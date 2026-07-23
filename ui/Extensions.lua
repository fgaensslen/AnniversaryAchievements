local _, ns = ...

local api = ns.PublicAPI
local db = ns.Database
local eventBus = ns.EventBus
local events = ns.Events
local loc = SexyLib:Localization('Anniversary Achievements')

if not api then return end

local extensionUI = {}
ns.ExtensionUI = extensionUI

local originalBaseTabOnClick = AchievementFrameBaseTab_OnClick
local originalSetTabs = AchievementFrame_SetTabs
local originalForceUpdate = AchievementFrame_ForceUpdate
local originalSummaryUpdateCategories = AchievementFrameSummary_UpdateSummaryCategories
local originalSelectAchievement = AchievementFrame_SelectAchievement

local tabButtons = {}
local tabFrames = {}
local visibleTabEntries = {}
local visibleButtonIDs = setmetatable({}, { __mode = "k" })
local overflowTabEntries = {}
local overflowFrame
local activeTabEntry
local activeTabFrame
local activeEmptyCategoryEntry
local activeEmptyCategoryFrame
local nativePlayerSelectedCategory = ACHIEVEMENT_FUNCTIONS and ACHIEVEMENT_FUNCTIONS.selectedCategory or "summary"
local summaryScriptState = {}
local UI_REFRESH_INTERVAL = 0.20
local EMPTY_MENU_WIDTH = 178
local EMPTY_MENU_ROW_HEIGHT = 24
local MAX_PINNED_EXTENSION_TABS = 5
local OVERFLOW_MIN_WIDTH = 190
local OVERFLOW_MAX_WIDTH = 460
local OVERFLOW_ROW_HEIGHT = 27
local OVERFLOW_TEXT_Y_OFFSET = 2
local OVERFLOW_HEADER_HEIGHT = 33
local RESERVED_STATISTICS_TAB_WIDTH = 115
local MIN_EXTENSION_TAB_WIDTH = 80
local EXTENSION_TAB_GAP = 3
local refreshQueue = {
    scheduled = false,
    processing = false,
    scheduleToken = 0,
    lastRefreshAt = 0,
    structure = false,
    content = false,
    summary = false,
    tabs = false,
    refreshAllTabs = false,
    moduleIDs = {},
}

local function GetRootFrame()
    if type(AnniversaryAchievements_GetAchievementFrame) == "function" then
        return AnniversaryAchievements_GetAchievementFrame()
    end
    return _G.AnniversaryAchievementsFrame
end

local function PlayTabSound()
    if SOUNDKIT and SOUNDKIT.IG_CHARACTER_INFO_TAB then
        PlaySound(SOUNDKIT.IG_CHARACTER_INFO_TAB)
    end
end

local function GetTabStorageKey(entry)
    return tostring(entry.moduleID) .. ":" .. tostring(entry.key)
end

local function GetNavigationSettings()
    if type(CA_Settings) ~= "table" then CA_Settings = {} end
    if type(CA_Settings.apiTabNavigation) ~= "table" then
        CA_Settings.apiTabNavigation = {}
    end
    local navigation = CA_Settings.apiTabNavigation
    if type(navigation.pinned) ~= "table" then navigation.pinned = {} end
    return navigation
end

local function ClassifyTabs(entries)
    local navigation = GetNavigationSettings()
    local byKey = {}
    for _, entry in ipairs(entries) do byKey[GetTabStorageKey(entry)] = entry end

    local pinned, pinnedKeys, pinnedSet = {}, {}, {}
    for _, storageKey in ipairs(navigation.pinned) do
        local entry = type(storageKey) == "string" and byKey[storageKey] or nil
        if entry and not pinnedSet[entry] and #pinned < MAX_PINNED_EXTENSION_TABS then
            pinned[#pinned + 1] = entry
            pinnedKeys[#pinnedKeys + 1] = storageKey
            pinnedSet[entry] = true
        end
    end
    navigation.pinned = pinnedKeys

    local overflow = {}
    for _, entry in ipairs(entries) do
        if not pinnedSet[entry] then overflow[#overflow + 1] = entry end
    end
    return pinned, overflow
end

local function IsTabPinned(entry)
    for _, pinned in ipairs(visibleTabEntries) do
        if pinned == entry then return true end
    end
    return false
end

local function CenterTabText(button, selected)
    if not button then return end
    local label = button.text or button:GetFontString()
    if not label then return end

    -- A centered anchor plus an explicit final tab width is deterministic on
    -- Classic/TBC. Two edge anchors on ButtonText can retain the template's
    -- old text region after PanelTemplates resizes the button, which makes the
    -- caption appear left-shifted even with CENTER justification.
    label:ClearAllPoints()
    label:SetPoint("CENTER", button, "CENTER", 0, selected and -5 or -3)
    label:SetWidth(math.max(1, math.floor((button:GetWidth() or MIN_EXTENSION_TAB_WIDTH) + 0.5)))
    label:SetHeight(16)
    label:SetJustifyH("CENTER")
    if label.SetJustifyV then label:SetJustifyV("MIDDLE") end
    label:SetWordWrap(false)
end

local function RestoreNativeAchievementTabLayout(root)
    if not root then return end
    local button = _G[root:GetName() .. "Tab1"] or AchievementFrameTab1
    if not button then return end

    -- The native Achievements tab keeps Blizzard's original, text-derived
    -- width and centered label. Extension geometry must never resize it.
    if button.text then
        button.text:ClearAllPoints()
        button.text:SetPoint("CENTER", button, "CENTER", 0, root.selectedTab == 1 and -5 or -3)
        button.text:SetJustifyH("CENTER")
    end
    if type(PanelTemplates_TabResize) == "function" then
        PanelTemplates_TabResize(button, 10)
    end
end

local function UpdateTabTextOffsets(root)
    RestoreNativeAchievementTabLayout(root)
    local total = 1 + #visibleTabEntries
    for index = 2, total do
        CenterTabText(_G[root:GetName() .. "Tab" .. index], root.selectedTab == index)
    end
end

local function SetExtensionTabTooltip(button, entry, pinned)
    GameTooltip:SetOwner(button, "ANCHOR_BOTTOM")
    local tooltip = api:_GetTabTooltip(entry)
    if tooltip then GameTooltip:SetText(tooltip, 1, 1, 1, 1, true)
    else GameTooltip:SetText(entry.name, 1, 1, 1, 1, true) end
    if pinned then
        GameTooltip:AddLine(loc:Get('API_TAB_UNPIN_HINT'), 0.75, 0.75, 0.75, true)
    else
        GameTooltip:AddLine(loc:Get('API_TAB_PIN_HINT'), 0.75, 0.75, 0.75, true)
    end
    GameTooltip:Show()
end

local function ShowPinLimitError()
    local message = loc:Get('API_TAB_PIN_LIMIT')
    if UIErrorsFrame and type(UIErrorsFrame.AddMessage) == "function" then
        UIErrorsFrame:AddMessage(message, 1, 0.2, 0.2, 1)
    elseif type(print) == "function" then
        print(message)
    end
end

function extensionUI:SetTabPinned(entry, shouldPin)
    if not entry then return false end
    local navigation = GetNavigationSettings()
    local storageKey = GetTabStorageKey(entry)
    local found
    for index = #navigation.pinned, 1, -1 do
        if navigation.pinned[index] == storageKey then
            found = true
            if not shouldPin then table.remove(navigation.pinned, index) end
        end
    end
    if shouldPin and not found then
        local registered = {}
        for _, current in ipairs(api:_GetTabs()) do registered[GetTabStorageKey(current)] = true end
        local validCount = 0
        for _, key in ipairs(navigation.pinned) do
            if registered[key] then validCount = validCount + 1 end
        end
        if validCount >= MAX_PINNED_EXTENSION_TABS then
            ShowPinLimitError()
            return false
        end
        navigation.pinned[#navigation.pinned + 1] = storageKey
    end
    self:RefreshTabs()
    return true
end

local function EnsureTabButton(root, index)
    local buttonID = index + 1
    local button = tabButtons[index]
    if button then
        button:SetID(buttonID)
        return button
    end

    local name = root:GetName() .. "Tab" .. buttonID
    button = _G[name] or CreateFrame("Button", name, root, "AchievementFrameTabButtonTemplate")
    button:SetID(buttonID)
    button:RegisterForClicks("LeftButtonUp", "RightButtonUp")

    local templateOnEnter = button:GetScript("OnEnter")
    local templateOnLeave = button:GetScript("OnLeave")
    button:SetScript("OnEnter", function(self)
        if templateOnEnter then templateOnEnter(self) end
        if self.extensionEntry then SetExtensionTabTooltip(self, self.extensionEntry, true) end
    end)
    button:SetScript("OnLeave", function(self)
        if templateOnLeave then templateOnLeave(self) end
        GameTooltip:Hide()
    end)
    button:SetScript("OnClick", function(self, mouseButton)
        if not self.extensionEntry then return end
        if mouseButton == "RightButton" then
            extensionUI:SetTabPinned(self.extensionEntry, false)
            return
        end
        extensionUI:ActivateTab(self.extensionEntry, self:GetID())
        PlayTabSound()
    end)

    tabButtons[index] = button
    if type(AnniversaryAchievements_RefreshFrameAliases) == "function" then
        AnniversaryAchievements_RefreshFrameAliases()
    end
    return button
end

local function ResizeExtensionTabVisuals(button, width)
    width = math.max(MIN_EXTENSION_TAB_WIDTH, math.floor(tonumber(width) or 115))
    button:SetWidth(width)
    button:SetHitRectInsets(0, 0, 0, 0)

    local name = button:GetName()
    local middleWidth = math.max(1, width - 39)
    local middle = name and _G[name .. "Middle"] or nil
    local middleDisabled = name and _G[name .. "MiddleDisabled"] or nil
    if middle then middle:SetWidth(middleWidth) end
    if middleDisabled then middleDisabled:SetWidth(middleWidth) end

    -- The highlight middle is anchored between the left and right pieces.
    -- Reapplying both anchors after the final width makes the hover cover the
    -- complete clickable tab instead of the template's initial 115 px area.
    if button.middleHighlight and button.leftHighlight and button.rightHighlight then
        button.leftHighlight:ClearAllPoints()
        -- The source texture contains a three-pixel transparent lead-in.
        -- Restoring the template offset aligns the visible glow exactly with
        -- the curved left tab edge instead of leaving a dull vertical strip.
        button.leftHighlight:SetPoint("TOPLEFT", button, "TOPLEFT", -3, -1)
        button.rightHighlight:ClearAllPoints()
        -- The right cap has no transparent lead-out. Anchoring it directly to
        -- the button edge keeps the glow flush on the right instead of ending
        -- four pixels inside the clickable tab.
        button.rightHighlight:SetPoint("TOPRIGHT", button, "TOPRIGHT", 0, -1)
        button.middleHighlight:ClearAllPoints()
        button.middleHighlight:SetPoint("LEFT", button.leftHighlight, "RIGHT", 0, 0)
        button.middleHighlight:SetPoint("RIGHT", button.rightHighlight, "LEFT", 0, 0)
    end
end

local function ConfigureTabButton(button, entry, previousButton, displayWidth)
    button.extensionEntry = entry
    button:SetText(entry.name)
    button:ClearAllPoints()
    button:SetPoint("LEFT", previousButton, "RIGHT", EXTENSION_TAB_GAP, 0)

    if entry.icon then
        local icon = button.extensionIcon
        if not icon then
            icon = button:CreateTexture(nil, "ARTWORK")
            icon:SetSize(16, 16)
            icon:SetPoint("LEFT", button, "LEFT", 12, -3)
            button.extensionIcon = icon
        end
        icon:SetTexture(entry.icon)
        icon:Show()
    elseif button.extensionIcon then
        button.extensionIcon:Hide()
    end

    button:Show()
    ResizeExtensionTabVisuals(button, displayWidth or entry.width)
    CenterTabText(button, false)
end

local function CalculatePinnedTabWidths(root, baseButton, entries)
    local widths = {}
    if #entries == 0 then return widths end
    local rootWidth = tonumber(root:GetWidth()) or 0
    if rootWidth <= 0 then rootWidth = 900 end
    local baseWidth = tonumber(baseButton:GetWidth()) or 105
    local totalGap = #entries * EXTENSION_TAB_GAP
    local available = math.max(#entries * MIN_EXTENSION_TAB_WIDTH,
        rootWidth - baseWidth - RESERVED_STATISTICS_TAB_WIDTH - totalGap - 12)
    local requested = 0
    for index, entry in ipairs(entries) do
        widths[index] = math.max(MIN_EXTENSION_TAB_WIDTH, tonumber(entry.width) or 115)
        requested = requested + widths[index]
    end
    if requested <= available then return widths end

    local scale = available / requested
    local used = 0
    for index, width in ipairs(widths) do
        widths[index] = math.max(MIN_EXTENSION_TAB_WIDTH, math.floor(width * scale))
        used = used + widths[index]
    end
    while used > available do
        local changed = false
        for index = #widths, 1, -1 do
            if widths[index] > MIN_EXTENSION_TAB_WIDTH and used > available then
                widths[index] = widths[index] - 1
                used = used - 1
                changed = true
            end
        end
        if not changed then break end
    end
    return widths
end

local function DeselectBottomTabs(root)
    root.selectedTab = 0
    local total = 1 + #visibleTabEntries
    for index = 1, total do
        local button = _G[root:GetName() .. "Tab" .. index]
        if button then
            if type(PanelTemplates_DeselectTab) == "function" then PanelTemplates_DeselectTab(button) end
            button:Enable()
        end
    end
end

local function EnsureOverflowFrame(root)
    if overflowFrame then return overflowFrame end

    local frame = CreateFrame("Frame", "AnniversaryAchievementsExtensionTabList", root)
    frame:SetPoint("TOPLEFT", root, "TOPRIGHT", -5, -19)
    frame:SetPoint("BOTTOMLEFT", root, "BOTTOMRIGHT", -5, 20)
    frame:SetWidth(OVERFLOW_MIN_WIDTH)
    frame:SetFrameLevel(root:GetFrameLevel() + 12)
    frame:SetClampedToScreen(true)
    frame:Hide()

    local background = frame:CreateTexture(nil, "BACKGROUND")
    background:SetAllPoints(frame)
    background:SetTexture("Interface\\AddOns\\AnniversaryAchievements\\textures\\UI-Achievement-AchievementBackground")
    background:SetTexCoord(0, 1, 0, 0.5)
    frame.background = background

    local border = CreateFrame("Frame", nil, frame, "AchivementGoldBorderBackdrop")
    border:SetAllPoints(frame)
    frame.border = border

    local headerTexture = frame:CreateTexture(nil, "BORDER")
    headerTexture:SetTexture("Interface\\AddOns\\AnniversaryAchievements\\textures\\UI-Achievement-RecentHeader")
    headerTexture:SetPoint("TOPLEFT", frame, "TOPLEFT", 8, -8)
    headerTexture:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -8, -8)
    headerTexture:SetHeight(22)
    headerTexture:SetTexCoord(0, 1, 0, 0.71875)

    local title = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    title:SetPoint("CENTER", headerTexture, "CENTER", 0, 0)
    frame.title = title

    local scroll = CreateFrame("ScrollFrame", nil, frame)
    scroll:SetPoint("TOPLEFT", frame, "TOPLEFT", 9, -OVERFLOW_HEADER_HEIGHT)
    scroll:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -28, 9)
    scroll:EnableMouseWheel(true)
    frame.scroll = scroll

    local child = CreateFrame("Frame", nil, scroll)
    child:SetPoint("TOPLEFT")
    child:SetHeight(1)
    scroll:SetScrollChild(child)
    frame.child = child

    local slider = CreateFrame("Slider", nil, frame, "UIPanelScrollBarTemplate")
    slider:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -7, -OVERFLOW_HEADER_HEIGHT - 1)
    slider:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -7, 10)
    -- Install the handler before the first SetValue call. The Classic/TBC
    -- UIPanelScrollBarTemplate ships an inherited secure handler that expects
    -- its parent itself to be a ScrollFrame; our dock owns a separate scroll
    -- child, so that inherited handler must never run.
    slider:SetScript("OnValueChanged", function(_, value) scroll:SetVerticalScroll(value) end)
    slider:SetMinMaxValues(0, 0)
    slider:SetValueStep(OVERFLOW_ROW_HEIGHT)
    slider:SetValue(0)
    slider:Hide()
    frame.slider = slider

    scroll:SetScript("OnMouseWheel", function(_, delta)
        local minValue, maxValue = slider:GetMinMaxValues()
        if maxValue <= minValue then return end
        slider:SetValue(math.max(minValue, math.min(maxValue, slider:GetValue() - delta * OVERFLOW_ROW_HEIGHT * 2)))
    end)

    local measure = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    measure:Hide()
    frame.measure = measure
    frame.buttons = {}
    overflowFrame = frame
    return frame
end

local function EnsureOverflowButton(frame, index)
    local button = frame.buttons[index]
    if button then return button end

    button = CreateFrame("Button", nil, frame.child)
    button:SetHeight(OVERFLOW_ROW_HEIGHT)
    button:RegisterForClicks("LeftButtonUp", "RightButtonUp")
    button:SetPoint("TOPLEFT", frame.child, "TOPLEFT", 0, -((index - 1) * OVERFLOW_ROW_HEIGHT))

    local background = button:CreateTexture(nil, "BACKGROUND")
    background:SetAllPoints(button)
    background:SetTexture("Interface\\AddOns\\AnniversaryAchievements\\textures\\UI-Achievement-Category-Background")
    background:SetTexCoord(0, 0.6640625, 0, 1)
    button.background = background

    local highlight = button:CreateTexture(nil, "HIGHLIGHT")
    highlight:SetAllPoints(button)
    highlight:SetTexture("Interface\\AddOns\\AnniversaryAchievements\\textures\\UI-Achievement-Category-Highlight")
    highlight:SetBlendMode("ADD")
    highlight:SetTexCoord(0, 0.6640625, 0, 1)

    local icon = button:CreateTexture(nil, "ARTWORK")
    icon:SetSize(18, 18)
    icon:SetPoint("LEFT", button, "LEFT", 10, 0)
    button.icon = icon

    local label = button:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    label:SetHeight(OVERFLOW_ROW_HEIGHT)
    label:SetPoint("LEFT", icon, "RIGHT", 6, OVERFLOW_TEXT_Y_OFFSET)
    label:SetJustifyH("LEFT")
    if label.SetJustifyV then label:SetJustifyV("MIDDLE") end
    label:SetWordWrap(false)
    if label.SetMaxLines then label:SetMaxLines(1) end
    button.label = label

    button:SetScript("OnClick", function(self, mouseButton)
        if not self.extensionEntry then return end
        if mouseButton == "RightButton" then
            extensionUI:SetTabPinned(self.extensionEntry, true)
            return
        end
        extensionUI:ActivateTab(self.extensionEntry, nil)
        PlayTabSound()
    end)
    button:SetScript("OnEnter", function(self)
        if self.extensionEntry then SetExtensionTabTooltip(self, self.extensionEntry, false) end
    end)
    button:SetScript("OnLeave", function() GameTooltip:Hide() end)

    frame.buttons[index] = button
    return button
end

local function RefreshOverflowSelection()
    if not overflowFrame then return end
    for _, button in ipairs(overflowFrame.buttons) do
        if button.extensionEntry and button.extensionEntry == activeTabEntry then button:LockHighlight()
        else button:UnlockHighlight() end
    end
end

local function RefreshOverflowFrame(root, entries)
    local frame = EnsureOverflowFrame(root)
    overflowTabEntries = entries
    if #entries == 0 then
        frame:Hide()
        return
    end

    frame.title:SetText(string.format("%s (%d)", loc:Get('API_TAB_LIST_TITLE'), #entries))
    local maxTextWidth = 0
    for _, entry in ipairs(entries) do
        frame.measure:SetText(entry.name)
        maxTextWidth = math.max(maxTextWidth, frame.measure:GetStringWidth() or 0)
    end
    local width = math.ceil(maxTextWidth + 68)
    width = math.max(OVERFLOW_MIN_WIDTH, math.min(OVERFLOW_MAX_WIDTH, width))
    frame:SetWidth(width)
    frame.child:SetWidth(width - 38)

    for index, entry in ipairs(entries) do
        local button = EnsureOverflowButton(frame, index)
        button.extensionEntry = entry
        button:SetWidth(width - 38)
        if entry.icon then
            button.icon:SetTexture(entry.icon)
            button.icon:Show()
            button.label:ClearAllPoints()
            button.label:SetPoint("LEFT", button.icon, "RIGHT", 6, OVERFLOW_TEXT_Y_OFFSET)
        else
            button.icon:Hide()
            button.label:ClearAllPoints()
            button.label:SetPoint("LEFT", button, "LEFT", 12, OVERFLOW_TEXT_Y_OFFSET)
        end
        button.label:SetPoint("RIGHT", button, "RIGHT", -8, OVERFLOW_TEXT_Y_OFFSET)
        button.label:SetText(entry.name)
        button:Show()
    end
    for index = #entries + 1, #frame.buttons do
        local button = frame.buttons[index]
        button.extensionEntry = nil
        button:Hide()
    end

    local childHeight = math.max(1, #entries * OVERFLOW_ROW_HEIGHT)
    frame.child:SetHeight(childHeight)
    local viewHeight = math.max(1, frame.scroll:GetHeight())
    local maxScroll = math.max(0, childHeight - viewHeight)
    frame.slider:SetMinMaxValues(0, maxScroll)
    if frame.slider:GetValue() > maxScroll then frame.slider:SetValue(maxScroll) end
    if maxScroll > 0 then frame.slider:Show() else frame.slider:Hide(); frame.slider:SetValue(0) end
    RefreshOverflowSelection()
    frame:Show()
end

function extensionUI:RefreshTabs()
    local root = GetRootFrame()
    if not root then return end

    visibleTabEntries, overflowTabEntries = ClassifyTabs(api:_GetTabs())
    visibleButtonIDs = setmetatable({}, { __mode = "k" })
    local previousButton = _G[root:GetName() .. "Tab1"] or AchievementFrameTab1
    if not previousButton then return end

    RestoreNativeAchievementTabLayout(root)
    local displayWidths = CalculatePinnedTabWidths(root, previousButton, visibleTabEntries)
    for index, entry in ipairs(visibleTabEntries) do
        local button = EnsureTabButton(root, index)
        ConfigureTabButton(button, entry, previousButton, displayWidths[index])
        visibleButtonIDs[entry] = index + 1
        previousButton = button
    end

    local registeredCount = #api:_GetTabs()
    local lastPossibleButton = math.max(#tabButtons, registeredCount)
    for index = #visibleTabEntries + 1, lastPossibleButton do
        local button = tabButtons[index] or _G[root:GetName() .. "Tab" .. (index + 1)]
        if button then
            button.extensionEntry = nil
            button:Hide()
        end
    end

    PanelTemplates_SetNumTabs(root, 1 + #visibleTabEntries)
    if activeTabEntry then
        local buttonID = visibleButtonIDs[activeTabEntry]
        if buttonID then root.selectedTab = buttonID else DeselectBottomTabs(root) end
    elseif not root.selectedTab or root.selectedTab < 1 or root.selectedTab > 1 + #visibleTabEntries then
        root.selectedTab = 1
    end
    PanelTemplates_UpdateTabs(root)
    UpdateTabTextOffsets(root)
    RefreshOverflowFrame(root, overflowTabEntries)
end

local function CreateExtensionBackdrop(root, entry)
    local frame = CreateFrame("Frame", nil, root)
    frame:SetPoint("TOPLEFT", root, "TOPLEFT", 21, -19)
    frame:SetPoint("BOTTOMRIGHT", root, "BOTTOMRIGHT", -21, 20)
    frame:Hide()
    frame.entry = entry

    local background = frame:CreateTexture(nil, "BACKGROUND")
    background:SetAllPoints(frame)
    background:SetTexture("Interface\\AddOns\\AnniversaryAchievements\\textures\\UI-Achievement-AchievementBackground")
    background:SetTexCoord(0, 1, 0, 0.5)
    frame.background = background

    local border = CreateFrame("Frame", nil, frame, "AchivementGoldBorderBackdrop")
    border:SetAllPoints(frame)
    frame.border = border
    return frame
end

local function EnsureLegacyEmptyTabFrame(root, entry)
    local frame = tabFrames[entry]
    if frame then return frame end
    frame = CreateExtensionBackdrop(root, entry)

    local content = CreateFrame("Frame", nil, frame)
    content:SetPoint("TOPLEFT", frame, "TOPLEFT", 8, -8)
    content:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -8, 8)
    frame.content = content

    local ok = api:_CreateTabFrame(entry, content)
    if not ok then
        local errorText = content:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
        errorText:SetPoint("CENTER")
        errorText:SetText("Extension tab could not be initialized.")
    end

    tabFrames[entry] = frame
    return frame
end

local function FlattenEmptyCategories(entry)
    local roots, children = {}, {}
    for _, category in ipairs(api:_GetEmptyTabCategories(entry)) do
        if category.parent then
            local bucket = children[category.parent]
            if not bucket then bucket = {}; children[category.parent] = bucket end
            bucket[#bucket + 1] = category
        else
            roots[#roots + 1] = category
        end
    end
    local result = {}
    local function append(category, depth)
        result[#result + 1] = { entry = category, depth = depth }
        local bucket = children[category]
        if bucket then
            table.sort(bucket, function(a, b)
                if a.order ~= b.order then return a.order < b.order end
                return a.key < b.key
            end)
            for _, child in ipairs(bucket) do append(child, depth + 1) end
        end
    end
    for _, category in ipairs(roots) do append(category, 0) end
    return result
end

local function SetEmptyCategoryTooltip(button, category)
    local tooltip = api:_GetEmptyTabCategoryTooltip(category)
    if not tooltip then return end
    GameTooltip:SetOwner(button, "ANCHOR_RIGHT")
    GameTooltip:SetText(tooltip, 1, 1, 1, 1, true)
end

local function EnsureEmptyCategoryFrame(structured, category)
    local frame = structured.categoryFrames[category]
    if frame then return frame end
    frame = CreateFrame("Frame", nil, structured.pageHost)
    frame:SetAllPoints(structured.pageHost)
    frame:Hide()
    structured.categoryFrames[category] = frame
    local ok = api:_CreateEmptyTabCategoryFrame(category, frame)
    if not ok then
        local errorText = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
        errorText:SetPoint("CENTER")
        errorText:SetText("Extension category could not be initialized.")
    end
    return frame
end

local function UpdateEmptyMenuSelection(structured)
    for _, button in ipairs(structured.menuButtons) do
        if button.categoryEntry == activeEmptyCategoryEntry then
            button:LockHighlight()
        else
            button:UnlockHighlight()
        end
    end
end

function extensionUI:SelectEmptyCategory(entry, category)
    local frame = tabFrames[entry]
    if not frame or not frame.structured then return end
    local structured = frame.structured

    if activeEmptyCategoryEntry and activeEmptyCategoryFrame then
        api:_InvokeEmptyTabCategoryCallback(activeEmptyCategoryEntry, "onHide", activeEmptyCategoryFrame)
        activeEmptyCategoryFrame:Hide()
    elseif activeEmptyCategoryFrame then
        activeEmptyCategoryFrame:Hide()
    end

    activeEmptyCategoryEntry = category
    if category then
        activeEmptyCategoryFrame = EnsureEmptyCategoryFrame(structured, category)
        entry.selectedEmptyCategory = category
        activeEmptyCategoryFrame:Show()
        api:_InvokeEmptyTabCategoryCallback(category, "onShow", activeEmptyCategoryFrame)
    else
        activeEmptyCategoryFrame = structured.overview
        entry.selectedEmptyCategory = nil
        structured.overview:Show()
    end
    UpdateEmptyMenuSelection(structured)
end

local function EnsureEmptyMenuButton(structured, index)
    local button = structured.menuButtons[index]
    if button then return button end
    button = CreateFrame("Button", nil, structured.menuChild)
    button:SetHeight(EMPTY_MENU_ROW_HEIGHT)
    button:SetPoint("LEFT", structured.menuChild, "LEFT", 0, 0)
    button:SetPoint("RIGHT", structured.menuChild, "RIGHT", 0, 0)

    local background = button:CreateTexture(nil, "BACKGROUND")
    background:SetAllPoints(button)
    background:SetTexture("Interface\\QuestFrame\\UI-QuestTitleHighlight")
    background:SetBlendMode("ADD")
    background:SetAlpha(0.35)
    button:SetHighlightTexture(background)

    local label = button:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    label:SetPoint("LEFT", 8, 0)
    label:SetPoint("RIGHT", -8, 0)
    label:SetJustifyH("LEFT")
    button.label = label

    button:SetScript("OnClick", function(self)
        extensionUI:SelectEmptyCategory(structured.entry, self.categoryEntry)
    end)
    button:SetScript("OnEnter", function(self)
        if self.categoryEntry then SetEmptyCategoryTooltip(self, self.categoryEntry) end
    end)
    button:SetScript("OnLeave", function() GameTooltip:Hide() end)
    structured.menuButtons[index] = button
    return button
end

local function EnsureOverviewProgressBar(structured, index)
    local bar = structured.progressBars[index]
    if bar then return bar end
    bar = CreateFrame("StatusBar", nil, structured.overview)
    bar:SetHeight(22)
    bar:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar")
    bar:SetStatusBarColor(0.2, 0.75, 0.2)

    local background = bar:CreateTexture(nil, "BACKGROUND")
    background:SetAllPoints(bar)
    background:SetColorTexture(0, 0, 0, 0.55)

    local label = bar:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    label:SetPoint("LEFT", 7, 0)
    label:SetJustifyH("LEFT")
    bar.label = label

    local text = bar:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    text:SetPoint("RIGHT", -7, 0)
    text:SetJustifyH("RIGHT")
    bar.text = text

    local button = CreateFrame("Button", nil, bar)
    button:SetAllPoints(bar)
    button:SetScript("OnClick", function(self)
        if self.progressEntry and self.progressEntry.categoryEntry then
            extensionUI:SelectEmptyCategory(structured.entry, self.progressEntry.categoryEntry)
        end
    end)
    button:SetScript("OnEnter", function(self)
        if not self.progressEntry then return end
        local tooltip = api:_GetTabProgressBarTooltip(self.progressEntry, { tab = structured.entry.handle })
        if tooltip then
            GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
            GameTooltip:SetText(tooltip, 1, 1, 1, 1, true)
        end
    end)
    button:SetScript("OnLeave", function() GameTooltip:Hide() end)
    bar.button = button
    structured.progressBars[index] = bar
    return bar
end

local function RefreshEmptyOverview(structured)
    local shown = 0
    for _, progressEntry in ipairs(api:_GetTabProgressBars(structured.entry)) do
        local current, maximum, text = api:_EvaluateTabProgressBar(progressEntry, { tab = structured.entry.handle })
        if current ~= nil then
            shown = shown + 1
            local bar = EnsureOverviewProgressBar(structured, shown)
            bar:ClearAllPoints()
            local y = -55 - ((shown - 1) * 28)
            bar:SetPoint("TOPLEFT", structured.overview, "TOPLEFT", 18, y)
            bar:SetPoint("TOPRIGHT", structured.overview, "TOPRIGHT", -18, y)
            bar:SetMinMaxValues(0, maximum > 0 and maximum or 1)
            bar:SetValue(current)
            bar.label:SetText(progressEntry.label)
            bar.text:SetText(text)
            bar.button.progressEntry = progressEntry
            bar:Show()
        end
    end
    for index = shown + 1, #structured.progressBars do
        structured.progressBars[index]:Hide()
    end

    structured.overviewUserContent:ClearAllPoints()
    if shown > 0 then
        structured.overviewUserContent:SetPoint("TOPLEFT", structured.overviewTitle, "BOTTOMLEFT", 0, -18 - (shown * 28))
    else
        structured.overviewUserContent:SetPoint("TOPLEFT", structured.overviewTitle, "BOTTOMLEFT", 0, -12)
    end
    structured.overviewUserContent:SetPoint("BOTTOMRIGHT", structured.overview, "BOTTOMRIGHT", -18, 18)
end

local function RefreshEmptyTabStructure(frame)
    local structured = frame.structured
    if not structured then return end
    local flat = FlattenEmptyCategories(structured.entry)
    local row = 1

    local summaryButton = EnsureEmptyMenuButton(structured, row)
    summaryButton.categoryEntry = nil
    summaryButton.label:SetText(structured.entry.summaryName or ACHIEVEMENT_SUMMARY_CATEGORY or "Summary")
    summaryButton.label:SetPoint("LEFT", 8, 0)
    summaryButton:ClearAllPoints()
    summaryButton:SetPoint("TOPLEFT", structured.menuChild, "TOPLEFT", 0, 0)
    summaryButton:SetPoint("RIGHT", structured.menuChild, "RIGHT", 0, 0)
    summaryButton:Show()

    for _, item in ipairs(flat) do
        row = row + 1
        local button = EnsureEmptyMenuButton(structured, row)
        button.categoryEntry = item.entry
        button.label:SetText(item.entry.name)
        button.label:ClearAllPoints()
        button.label:SetPoint("LEFT", 8 + (item.depth * 14), 0)
        button.label:SetPoint("RIGHT", -8, 0)
        button:ClearAllPoints()
        button:SetPoint("TOPLEFT", structured.menuChild, "TOPLEFT", 0, -((row - 1) * EMPTY_MENU_ROW_HEIGHT))
        button:SetPoint("RIGHT", structured.menuChild, "RIGHT", 0, 0)
        button:Show()
    end
    for index = row + 1, #structured.menuButtons do structured.menuButtons[index]:Hide() end
    structured.menuChild:SetHeight(math.max(1, row * EMPTY_MENU_ROW_HEIGHT))
    RefreshEmptyOverview(structured)
    UpdateEmptyMenuSelection(structured)
end

local function EnsureStructuredEmptyTabFrame(root, entry)
    local frame = tabFrames[entry]
    if frame then return frame end
    frame = CreateExtensionBackdrop(root, entry)

    local menu = CreateFrame("Frame", nil, frame)
    menu:SetPoint("TOPLEFT", frame, "TOPLEFT", 8, -8)
    menu:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT", 8, 8)
    menu:SetWidth(EMPTY_MENU_WIDTH)
    local menuBackground = menu:CreateTexture(nil, "BACKGROUND")
    menuBackground:SetAllPoints(menu)
    menuBackground:SetTexture("Interface\\AddOns\\AnniversaryAchievements\\textures\\UI-Achievement-Category-Background")
    menuBackground:SetTexCoord(0, 0.5, 0, 1)

    local scroll = CreateFrame("ScrollFrame", nil, menu, "UIPanelScrollFrameTemplate")
    scroll:SetPoint("TOPLEFT", menu, "TOPLEFT", 5, -7)
    scroll:SetPoint("BOTTOMRIGHT", menu, "BOTTOMRIGHT", -27, 7)
    local child = CreateFrame("Frame", nil, scroll)
    child:SetWidth(EMPTY_MENU_WIDTH - 38)
    child:SetHeight(1)
    scroll:SetScrollChild(child)

    local pageHost = CreateFrame("Frame", nil, frame)
    pageHost:SetPoint("TOPLEFT", menu, "TOPRIGHT", 8, 0)
    pageHost:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -8, 8)

    local overview = CreateFrame("Frame", nil, pageHost)
    overview:SetAllPoints(pageHost)
    overview:Hide()
    local title = overview:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    title:SetPoint("TOPLEFT", 18, -18)
    title:SetText(entry.summaryName or ACHIEVEMENT_SUMMARY_CATEGORY or "Summary")
    local userContent = CreateFrame("Frame", nil, overview)

    local structured = {
        entry = entry,
        menu = menu,
        menuScroll = scroll,
        menuChild = child,
        pageHost = pageHost,
        overview = overview,
        overviewTitle = title,
        overviewUserContent = userContent,
        menuButtons = {},
        progressBars = {},
        categoryFrames = {},
    }
    frame.structured = structured
    frame.content = pageHost

    local ok = api:_CreateTabFrame(entry, userContent)
    if not ok then
        local errorText = userContent:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
        errorText:SetPoint("CENTER")
        errorText:SetText("Extension tab overview could not be initialized.")
    end

    tabFrames[entry] = frame
    RefreshEmptyTabStructure(frame)
    return frame
end

local function EnsureEmptyTabFrame(root, entry)
    local structuredRequired = #api:_GetEmptyTabCategories(entry) > 0 or #api:_GetTabProgressBars(entry) > 0
    local existing = tabFrames[entry]
    if structuredRequired and existing and not existing.structured then
        -- Registration normally finishes before the frame opens. Still support late
        -- category/progress registration by replacing the legacy surface cleanly.
        existing:Hide()
        tabFrames[entry] = nil
    end
    if not structuredRequired then return EnsureLegacyEmptyTabFrame(root, entry) end
    return EnsureStructuredEmptyTabFrame(root, entry)
end

local function HideCoreSurfaces(root)
    AchievementFrame_ShowSubFrame()
    if AchievementFrameCategories then AchievementFrameCategories:Hide() end
    if AchievementFrameCategoriesBG then AchievementFrameCategoriesBG:Hide() end
    if AchievementFrameWaterMark then AchievementFrameWaterMark:Hide() end
    if AchievementFrameGuildEmblemLeft then AchievementFrameGuildEmblemLeft:Hide() end
    if AchievementFrameGuildEmblemRight then AchievementFrameGuildEmblemRight:Hide() end
    if root.searchResults then root.searchResults:Hide() end
    if root.searchBox then root.searchBox:Hide() end
    if AchievementFrameFilterDropDown then AchievementFrameFilterDropDown:Hide() end
    if AchievementFrameHeaderLeftDDLInset then AchievementFrameHeaderLeftDDLInset:Hide() end
    if AchievementFrameHeaderRightDDLInset then AchievementFrameHeaderRightDDLInset:Hide() end
end

local function ShowNativeAchievementSurfaces(root)
    if AchievementFrameCategories then AchievementFrameCategories:Show() end
    if AchievementFrameCategoriesBG then AchievementFrameCategoriesBG:Show() end
    if AchievementFrameWaterMark then AchievementFrameWaterMark:Show() end
    if AchievementFrameGuildEmblemLeft then AchievementFrameGuildEmblemLeft:Hide() end
    if AchievementFrameGuildEmblemRight then AchievementFrameGuildEmblemRight:Hide() end
    if root.searchResults then root.searchResults:Hide() end
    if root.searchBox then root.searchBox:Show() end
    if AchievementFrameFilterDropDown then AchievementFrameFilterDropDown:Show() end
    if AchievementFrameHeaderLeftDDLInset then AchievementFrameHeaderLeftDDLInset:Show() end
    if AchievementFrameHeaderRightDDLInset then AchievementFrameHeaderRightDDLInset:Show() end
    if AchievementFrameHeaderPointBorder then AchievementFrameHeaderPointBorder:Show() end
    if AchievementFrameHeaderPoints then AchievementFrameHeaderPoints:Show() end
    if AchievementFrameHeaderShield then AchievementFrameHeaderShield:Show() end
end

local ResetAchievementContentState

local function RestoreCoreSurfaces(root)
    ShowNativeAchievementSurfaces(root)
    if AchievementFrameHeaderTitle then AchievementFrameHeaderTitle:SetText(ACHIEVEMENT_TITLE) end
    if AchievementFrameHeaderPoints then
        AchievementFrameHeaderPoints:SetText(BreakUpLargeNumbers(GetTotalAchievementPoints()))
    end
end

local function ResetNativeCategoryButtonPool()
    local container = AchievementFrameCategoriesContainer
    if not container then return end
    if container.buttons then
        for _, button in ipairs(container.buttons) do
            button.element = nil
            button.categoryID = nil
            button.parentID = nil
            button.showTooltipFunc = nil
            if button.label then button.label:SetText("") end
            button:UnlockHighlight()
            button:Hide()
        end
    end
    if AchievementFrameCategoriesContainerScrollBar then
        AchievementFrameCategoriesContainerScrollBar:SetValue(0)
    end
end

local function SanitizeAchievementTabCategoryList(entry)
    if not entry or entry.kind ~= "achievements" then return end
    for index = #ACHIEVEMENTUI_CATEGORIES, 1, -1 do
        local element = ACHIEVEMENTUI_CATEGORIES[index]
        if element and element.id ~= "summary" then
            local category = db and db:GetCategory(element.id) or nil
            local valid = category
                and category.tabID == entry.databaseTabID
                and category.apiRegistered == true
                and type(category.name) == "string"
                and category.name ~= ""
            if not valid then table.remove(ACHIEVEMENTUI_CATEGORIES, index) end
        end
    end
end

local function RefreshNativeBaseTabContent(id)
    local root = GetRootFrame()
    if not root then return end
    ResetAchievementContentState(root)
    ResetNativeCategoryButtonPool()
    AchievementFrameCategories_GetCategoryList(ACHIEVEMENTUI_CATEGORIES)
    if AchievementFrameCategories_ExpandSelection then
        AchievementFrameCategories_ExpandSelection(achievementFunctions and achievementFunctions.selectedCategory)
    end
    AchievementFrameCategories_Update()

    if id == 1 or id == 2 then
        local selected = achievementFunctions and achievementFunctions.selectedCategory or "summary"
        AchievementFrame_ShowSubFrame()
        if selected == "summary" then
            AchievementFrame_ShowSubFrame(AchievementFrameSummary)
            AchievementFrameSummary_UpdateSummaryCategories(ACHIEVEMENTUI_SUMMARYCATEGORIES)
            AchievementFrameSummary_Update()
        else
            AchievementFrame_ShowSubFrame(AchievementFrameAchievements)
            if AchievementFrameAchievements_ForceUpdate then AchievementFrameAchievements_ForceUpdate()
            elseif achievementFunctions and achievementFunctions.updateFunc then achievementFunctions.updateFunc() end
        end
    else
        AchievementFrame_ShowSubFrame()
        AchievementFrame_ShowSubFrame(AchievementFrameStats)
        if achievementFunctions and achievementFunctions.updateFunc then achievementFunctions.updateFunc() end
    end
end

function extensionUI:DeactivateTab()
    if activeTabEntry then
        if activeTabEntry.kind == "achievements" then
            activeTabEntry.selectedCategory = achievementFunctions and achievementFunctions.selectedCategory or "summary"
            api:_InvokeTabCallback(activeTabEntry, "onHide", GetRootFrame() or AchievementFrameAchievements)
            if ACHIEVEMENT_FUNCTIONS then ACHIEVEMENT_FUNCTIONS.selectedCategory = nativePlayerSelectedCategory or "summary" end
        elseif activeTabFrame then
            if activeEmptyCategoryEntry and activeEmptyCategoryFrame then
                api:_InvokeEmptyTabCategoryCallback(activeEmptyCategoryEntry, "onHide", activeEmptyCategoryFrame)
            end
            activeEmptyCategoryEntry = nil
            activeEmptyCategoryFrame = nil
            api:_InvokeTabCallback(activeTabEntry, "onHide", activeTabFrame.content)
            activeTabFrame:Hide()
        end
    end

    activeTabEntry = nil
    activeTabFrame = nil
    if db then
        if type(db.ClearUIScopeTab) == "function" then db:ClearUIScopeTab() end
        db:SetSelectedTab(db.TAB_ID_PLAYER)
    end

    local root = GetRootFrame()
    if root then RestoreCoreSurfaces(root) end
    RefreshOverflowSelection()
end

local function SelectNativeCategoryByID(categoryID)
    for _, element in ipairs(ACHIEVEMENTUI_CATEGORIES) do
        if element.id == categoryID then
            AchievementFrameCategories_SelectButton({ element = element })
            AchievementFrameCategories_Update()
            return true
        end
    end
    return false
end

local function AchievementBelongsToActiveTab(achievementID)
    if not activeTabEntry or activeTabEntry.kind ~= "achievements" then return false end
    local achievement = db and db:GetAchievement(achievementID) or nil
    return achievement and achievement.tabID == activeTabEntry.databaseTabID or false
end

function AchievementFrame_SelectAchievement(id, forceSelect, isComparison)
    if not isComparison and AchievementBelongsToActiveTab(id) then
        -- The native selector contains all category expansion, scrolling and
        -- button-selection behavior we need, but normally begins by clicking
        -- base tab 1. Suppress only that base-tab switch for the duration of
        -- the call so a recent achievement opens inside its owning API tab.
        local savedBaseTabOnClick = AchievementFrameBaseTab_OnClick
        local savedTabOnClick = AchievementFrameTab_OnClick
        local function KeepActiveExtensionTab() end
        AchievementFrameBaseTab_OnClick = KeepActiveExtensionTab
        AchievementFrameTab_OnClick = KeepActiveExtensionTab

        local ok, err = pcall(originalSelectAchievement, id, forceSelect, false)

        AchievementFrameBaseTab_OnClick = savedBaseTabOnClick
        AchievementFrameTab_OnClick = savedTabOnClick
        if not ok then error(err) end

        if activeTabEntry and achievementFunctions then
            activeTabEntry.selectedCategory = achievementFunctions.selectedCategory or activeTabEntry.selectedCategory
        end
        RefreshOverflowSelection()
        return
    end
    return originalSelectAchievement(id, forceSelect, isComparison)
end

ResetAchievementContentState = function(root)
    if root and root.searchResults then root.searchResults:Hide() end
    if root and root.searchBox then root.searchBox:SetText("") end
    if AchievementFrameAchievements_ClearSelection then AchievementFrameAchievements_ClearSelection() end
    if AchievementFrameAchievementsContainerScrollBar then AchievementFrameAchievementsContainerScrollBar:SetValue(0) end
    if AchievementFrameAchievementsObjectives then
        AchievementFrameAchievementsObjectives:Hide()
        AchievementFrameAchievementsObjectives.id = nil
    end
end

local function RefreshActivatedAchievementContent(entry, selected)
    -- Hide first so the native OnShow handlers cannot retain the previous
    -- achievement tab's already-visible content surface.
    AchievementFrame_ShowSubFrame()

    if selected == "summary" then
        AchievementFrame_ShowSubFrame(AchievementFrameSummary)
        -- ShowSubFrame does not rerun OnShow when the frame was already shown.
        -- Rebuild both the category bars and recent-achievement area explicitly.
        AchievementFrameSummary_UpdateSummaryCategories(ACHIEVEMENTUI_SUMMARYCATEGORIES)
        AchievementFrameSummary_Update()
        return
    end

    AchievementFrame_ShowSubFrame(AchievementFrameAchievements)
    local selectedCategory = db and db:GetCategory(selected) or nil
    if selectedCategory and selectedCategory.isFeatsOfStrength == true then
        if AchievementFrameFilterDropDown then AchievementFrameFilterDropDown:Hide() end
        if AchievementFrameHeaderLeftDDLInset then AchievementFrameHeaderLeftDDLInset:Hide() end
    else
        if AchievementFrameFilterDropDown then AchievementFrameFilterDropDown:Show() end
        if AchievementFrameHeaderLeftDDLInset then AchievementFrameHeaderLeftDDLInset:Show() end
    end
    if AchievementFrameAchievements_ForceUpdate then
        AchievementFrameAchievements_ForceUpdate()
    elseif achievementFunctions and achievementFunctions.updateFunc then
        achievementFunctions.updateFunc()
    end
end

local function ActivateAchievementTab(entry, buttonID)
    local root = GetRootFrame()
    if not root then return end

    if IN_GUILD_VIEW then
        db:SetSelectedTab(db.TAB_ID_PLAYER)
        AchievementFrame_ToggleView()
    end

    nativePlayerSelectedCategory = ACHIEVEMENT_FUNCTIONS and ACHIEVEMENT_FUNCTIONS.selectedCategory or nativePlayerSelectedCategory or "summary"
    activeTabEntry = entry
    activeTabFrame = nil
    if type(db.SetUIScopeTab) == "function" then db:SetUIScopeTab(entry.databaseTabID) end
    achievementFunctions = ACHIEVEMENT_FUNCTIONS
    AchievementFrameSummary.guildView = nil
    AchievementFrameAchievements.guildView = nil
    db:SetSelectedTab(entry.databaseTabID)
    SwitchAchievementSearchTab(entry.databaseTabID)
    ShowNativeAchievementSurfaces(root)

    AchievementFrameWaterMark:SetTexture("Interface\\AchievementFrame\\UI-Achievement-AchievementWatermark")
    AchievementFrameCategoriesBG:SetTexCoord(0, 0.5, 0, 1)
    AchievementFrameAchievementsBackground:SetTexCoord(0, 1, 0, 0.5)
    AchievementFrameSummaryBackground:SetTexCoord(0, 1, 0, 0.5)

    ResetAchievementContentState(root)
    ResetNativeCategoryButtonPool()
    AchievementFrameCategories_GetCategoryList(ACHIEVEMENTUI_CATEGORIES)
    SanitizeAchievementTabCategoryList(entry)
    local selected = entry.selectedCategory or "summary"
    local valid = selected == "summary"
    if not valid then
        for _, element in ipairs(ACHIEVEMENTUI_CATEGORIES) do
            if element.id == selected then valid = true; break end
        end
    end
    if not valid then selected = "summary" end
    achievementFunctions.selectedCategory = selected
    if AchievementFrameCategories_ExpandSelection then
        AchievementFrameCategories_ExpandSelection(selected)
    end

    AchievementFrameCategories_Update()
    RefreshActivatedAchievementContent(entry, selected)

    if AchievementFrameHeaderTitle then AchievementFrameHeaderTitle:SetText(entry.title) end
    if AchievementFrameHeaderPoints then
        AchievementFrameHeaderPoints:SetText(BreakUpLargeNumbers(GetTotalAchievementPoints(false)))
    end

    local button = buttonID and _G[root:GetName() .. "Tab" .. buttonID] or nil
    if button then PanelTemplates_Tab_OnClick(button, root) else DeselectBottomTabs(root) end
    UpdateTabTextOffsets(root)
    RefreshOverflowSelection()
    api:_InvokeTabCallback(entry, "onShow", root)
end

local function ActivateEmptyTab(entry, buttonID)
    local root = GetRootFrame()
    if not root then return end

    if type(db.ClearUIScopeTab) == "function" then db:ClearUIScopeTab() end
    db:SetSelectedTab(db.TAB_ID_PLAYER)
    AchievementFrameTab_OnClick = AchievementFrameBaseTab_OnClick
    originalBaseTabOnClick(1)
    HideCoreSurfaces(root)

    local frame = EnsureEmptyTabFrame(root, entry)
    activeTabEntry = entry
    activeTabFrame = frame
    frame:Show()

    if frame.structured then
        RefreshEmptyTabStructure(frame)
        extensionUI:SelectEmptyCategory(entry, entry.selectedEmptyCategory)
    end

    if AchievementFrameHeaderTitle then AchievementFrameHeaderTitle:SetText(entry.title) end
    if AchievementFrameHeaderPointBorder then AchievementFrameHeaderPointBorder:Hide() end
    if AchievementFrameHeaderPoints then AchievementFrameHeaderPoints:Hide() end
    if AchievementFrameHeaderShield then AchievementFrameHeaderShield:Hide() end

    local button = buttonID and _G[root:GetName() .. "Tab" .. buttonID] or nil
    if button then PanelTemplates_Tab_OnClick(button, root) else DeselectBottomTabs(root) end
    UpdateTabTextOffsets(root)
    RefreshOverflowSelection()
    api:_InvokeTabCallback(entry, "onShow", frame.content)
end

function extensionUI:ActivateTab(entry, buttonID)
    if activeTabEntry ~= entry then self:DeactivateTab() end
    if entry.kind == "achievements" then
        ActivateAchievementTab(entry, buttonID)
    else
        ActivateEmptyTab(entry, buttonID)
    end
end

function extensionUI:RefreshActiveTab(moduleID)
    if not activeTabEntry then return end
    if moduleID and activeTabEntry.moduleID ~= moduleID then return end

    if activeTabEntry.kind == "achievements" then
        if AchievementFrameHeaderPoints then
            AchievementFrameHeaderPoints:SetText(BreakUpLargeNumbers(GetTotalAchievementPoints(false)))
        end
        if AchievementFrameSummary and AchievementFrameSummary:IsShown() then
            AchievementFrameSummary_UpdateSummaryCategories(ACHIEVEMENTUI_SUMMARYCATEGORIES)
            AchievementFrameSummary_Update()
        elseif AchievementFrameAchievements and AchievementFrameAchievements:IsShown() then
            AchievementFrameAchievements_ForceUpdate()
        end
        api:_InvokeTabCallback(activeTabEntry, "onRefresh", GetRootFrame() or AchievementFrameAchievements)
        return
    end

    if not activeTabFrame then return end
    if activeTabFrame.structured then
        RefreshEmptyTabStructure(activeTabFrame)
        if activeEmptyCategoryEntry and activeEmptyCategoryFrame then
            api:_InvokeEmptyTabCategoryCallback(activeEmptyCategoryEntry, "onRefresh", activeEmptyCategoryFrame)
        end
    end
    api:_InvokeTabCallback(activeTabEntry, "onRefresh", activeTabFrame.content)
end

function AchievementFrameBaseTab_OnClick(id)
    extensionUI:DeactivateTab()
    if db then
        if type(db.ClearUIScopeTab) == "function" then db:ClearUIScopeTab() end
        db:SetSelectedTab(id)
    end
    local result = originalBaseTabOnClick(id)
    if id == 1 and ACHIEVEMENT_FUNCTIONS then
        nativePlayerSelectedCategory = ACHIEVEMENT_FUNCTIONS.selectedCategory or "summary"
    end
    RefreshNativeBaseTabContent(id)
    local root = GetRootFrame()
    if root then UpdateTabTextOffsets(root) end
    RefreshOverflowSelection()
    return result
end
AchievementFrameTab_OnClick = AchievementFrameBaseTab_OnClick

function AchievementFrame_SetTabs()
    originalSetTabs()
    extensionUI:RefreshTabs()
end

local function CaptureSummaryScripts(statusBar)
    if summaryScriptState[statusBar] then return summaryScriptState[statusBar] end
    local button = statusBar.button or _G[statusBar:GetName() .. "Button"]
    local state = {
        onShow = statusBar:GetScript("OnShow"),
        button = button,
        onClick = button and button:GetScript("OnClick"),
        onEnter = button and button:GetScript("OnEnter"),
        onLeave = button and button:GetScript("OnLeave"),
    }
    summaryScriptState[statusBar] = state
    return state
end

local function RestoreSummaryBar(statusBar)
    local scripts = CaptureSummaryScripts(statusBar)
    statusBar.extensionEntry = nil
    statusBar:SetScript("OnShow", scripts.onShow)
    if scripts.button then
        scripts.button:SetScript("OnClick", scripts.onClick)
        scripts.button:SetScript("OnEnter", scripts.onEnter)
        scripts.button:SetScript("OnLeave", scripts.onLeave)
    end
end

local function ConfigureCoreSummaryBar(statusBar, entry)
    local scripts = CaptureSummaryScripts(statusBar)
    local context = { isGuildView = AchievementFrameSummary and AchievementFrameSummary.guildView == true or false }
    local current, maximum, text = api:_EvaluateSummaryProgressBar(entry, context)
    if current == nil then statusBar:Hide(); return false end

    statusBar.extensionEntry = entry
    statusBar:SetScript("OnShow", nil)
    statusBar.label:SetText(entry.label)
    statusBar.text:SetText(text)
    statusBar:SetMinMaxValues(0, maximum > 0 and maximum or 1)
    statusBar:SetValue(current)
    statusBar:Show()

    if scripts.button then
        scripts.button:SetScript("OnClick", function(_, button) api:_ClickSummaryProgressBar(entry, button) end)
        scripts.button:SetScript("OnEnter", function(self)
            local highlight = _G[self:GetName() .. "Highlight"]
            if highlight then highlight:Show() end
            local tooltip = api:_GetSummaryProgressBarTooltip(entry, context)
            if tooltip then
                GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
                GameTooltip:SetText(tooltip, 1, 1, 1, 1, true)
            end
        end)
        scripts.button:SetScript("OnLeave", function(self)
            local highlight = _G[self:GetName() .. "Highlight"]
            if highlight then highlight:Hide() end
            GameTooltip:Hide()
        end)
    end
    return true
end

local function ConfigureAchievementTabSummaryBar(statusBar, entry)
    local scripts = CaptureSummaryScripts(statusBar)
    local current, maximum, text = api:_EvaluateTabProgressBar(entry, { tab = activeTabEntry and activeTabEntry.handle })
    if current == nil then statusBar:Hide(); return false end

    statusBar.extensionEntry = entry
    statusBar:SetScript("OnShow", nil)
    statusBar:SetID(entry.categoryID)
    statusBar.label:SetText(entry.label)
    statusBar.text:SetText(text)
    statusBar:SetMinMaxValues(0, maximum > 0 and maximum or 1)
    statusBar:SetValue(current)
    statusBar:Show()

    if scripts.button then
        scripts.button:SetScript("OnClick", function() SelectNativeCategoryByID(entry.categoryID) end)
        scripts.button:SetScript("OnEnter", function(self)
            local highlight = _G[self:GetName() .. "Highlight"]
            if highlight then highlight:Show() end
            local tooltip = api:_GetTabProgressBarTooltip(entry, { tab = activeTabEntry and activeTabEntry.handle })
            if tooltip then
                GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
                GameTooltip:SetText(tooltip, 1, 1, 1, 1, true)
            end
        end)
        scripts.button:SetScript("OnLeave", function(self)
            local highlight = _G[self:GetName() .. "Highlight"]
            if highlight then highlight:Hide() end
            GameTooltip:Hide()
        end)
    end
    return true
end

function extensionUI:ApplySummaryProgressBars(coreCount)
    local entries = api:_GetSummaryProgressBars()
    local slot = coreCount + 1
    for _, entry in ipairs(entries) do
        if slot > 12 then break end
        local statusBar = _G["AchievementFrameSummaryCategoriesCategory" .. slot]
        if statusBar and ConfigureCoreSummaryBar(statusBar, entry) then slot = slot + 1 end
    end
    for index = slot, 12 do
        local statusBar = _G["AchievementFrameSummaryCategoriesCategory" .. index]
        if statusBar then statusBar:Hide() end
    end
end

local function ApplyAchievementTabSummaryBars(entry)
    local slot = 1
    for _, progressEntry in ipairs(api:_GetTabProgressBars(entry)) do
        if slot > 10 then break end
        local statusBar = _G["AchievementFrameSummaryCategoriesCategory" .. slot]
        if statusBar and ConfigureAchievementTabSummaryBar(statusBar, progressEntry) then slot = slot + 1 end
    end
    for index = slot, 12 do
        local statusBar = _G["AchievementFrameSummaryCategoriesCategory" .. index]
        if statusBar then statusBar:Hide() end
    end
end

function AchievementFrameSummary_UpdateSummaryCategories(categories)
    for index = 1, 12 do
        local statusBar = _G["AchievementFrameSummaryCategoriesCategory" .. index]
        if statusBar then RestoreSummaryBar(statusBar) end
    end
    if activeTabEntry and activeTabEntry.kind == "achievements" then
        ApplyAchievementTabSummaryBars(activeTabEntry)
    else
        originalSummaryUpdateCategories(categories)
        extensionUI:ApplySummaryProgressBars(#categories)
    end
end

function AchievementFrame_ForceUpdate()
    originalForceUpdate()
    if AchievementFrameSummary and AchievementFrameSummary:IsShown() then AchievementFrameSummary_Update() end
    extensionUI:RefreshActiveTab()
end

local function RefreshSummaryUI()
    if not AchievementFrameSummary or not AchievementFrameSummary:IsShown() then return end
    local categories
    if AchievementFrameSummary.guildView then categories = ACHIEVEMENTUI_GUILDSUMMARYCATEGORIES
    else categories = ACHIEVEMENTUI_SUMMARYCATEGORIES end
    AchievementFrameSummary_UpdateSummaryCategories(categories)
    AchievementFrameSummary_Update()
end

local function GetRefreshTime()
    if type(GetTime) == "function" then return GetTime() end
    return 0
end

local function IsAchievementFrameVisible()
    local root = GetRootFrame()
    return root and root:IsShown() or false
end

local function RefreshDatabaseUI(rebuildCategories)
    if AchievementFrameHeaderPoints then
        AchievementFrameHeaderPoints:SetText(BreakUpLargeNumbers(GetTotalAchievementPoints()))
    end
    if AchievementFrameCategories and AchievementFrameCategoriesContainer then
        if rebuildCategories and AchievementFrameCategories_GetCategoryList then
            ResetNativeCategoryButtonPool()
            AchievementFrameCategories_GetCategoryList(ACHIEVEMENTUI_CATEGORIES)
            if activeTabEntry and activeTabEntry.kind == "achievements" then
                SanitizeAchievementTabCategoryList(activeTabEntry)
            end
            if AchievementFrameCategories_ExpandSelection then
                AchievementFrameCategories_ExpandSelection(achievementFunctions and achievementFunctions.selectedCategory)
            end
        end
        AchievementFrameCategories_Update()
    end
    originalForceUpdate()
    RefreshSummaryUI()
end

local function ClearQueuedUIRefresh()
    refreshQueue.structure = false
    refreshQueue.content = false
    refreshQueue.summary = false
    refreshQueue.tabs = false
    refreshQueue.refreshAllTabs = false
    refreshQueue.moduleIDs = {}
end

local function ProcessQueuedUIRefresh()
    if refreshQueue.processing then return end
    if not IsAchievementFrameVisible() then refreshQueue.scheduled = false; return end

    refreshQueue.processing = true
    refreshQueue.scheduled = false
    local rebuildCategories = refreshQueue.structure
    local refreshContent = refreshQueue.content
    local refreshSummary = refreshQueue.summary
    local refreshTabs = refreshQueue.tabs
    local refreshAllTabs = refreshQueue.refreshAllTabs
    local moduleIDs = refreshQueue.moduleIDs
    ClearQueuedUIRefresh()

    if refreshTabs then
        extensionUI:RefreshTabs()
        if activeTabEntry and activeTabEntry.kind == "empty" and activeTabFrame and activeTabFrame.structured then
            RefreshEmptyTabStructure(activeTabFrame)
        end
    end

    if rebuildCategories or refreshContent then
        if not activeTabEntry or activeTabEntry.kind == "achievements" then
            RefreshDatabaseUI(rebuildCategories)
        end
    elseif refreshSummary then
        if not activeTabEntry or activeTabEntry.kind == "achievements" then RefreshSummaryUI() end
    end

    if refreshAllTabs then
        extensionUI:RefreshActiveTab()
    elseif activeTabEntry and moduleIDs[activeTabEntry.moduleID] then
        extensionUI:RefreshActiveTab(activeTabEntry.moduleID)
    end

    refreshQueue.lastRefreshAt = GetRefreshTime()
    refreshQueue.processing = false
end

local function ScheduleQueuedUIRefresh(immediate)
    if not IsAchievementFrameVisible() then return end
    if immediate and not refreshQueue.processing then
        refreshQueue.scheduleToken = refreshQueue.scheduleToken + 1
        refreshQueue.scheduled = false
        ProcessQueuedUIRefresh()
        return
    end
    if refreshQueue.scheduled then return end

    local delay = 0
    local now = GetRefreshTime()
    if now > 0 and refreshQueue.lastRefreshAt > 0 then
        delay = math.max(0, UI_REFRESH_INTERVAL - (now - refreshQueue.lastRefreshAt))
    end

    if C_Timer and type(C_Timer.After) == "function" then
        refreshQueue.scheduled = true
        refreshQueue.scheduleToken = refreshQueue.scheduleToken + 1
        local token = refreshQueue.scheduleToken
        C_Timer.After(delay, function()
            if token ~= refreshQueue.scheduleToken then return end
            refreshQueue.scheduled = false
            ProcessQueuedUIRefresh()
        end)
    else
        ProcessQueuedUIRefresh()
    end
end

local function QueueUIRefresh(kind, moduleID, immediate)
    if kind == "structure" then refreshQueue.structure = true
    elseif kind == "build" then refreshQueue.structure = true; refreshQueue.content = true
    elseif kind == "content" then refreshQueue.content = true
    elseif kind == "summary" then refreshQueue.summary = true
    elseif kind == "tabs" then refreshQueue.tabs = true
    elseif kind == "all" then refreshQueue.content = true; refreshQueue.refreshAllTabs = true
    elseif kind == "module" then
        refreshQueue.summary = true
        if moduleID then refreshQueue.moduleIDs[moduleID] = true end
    elseif kind == "final" then
        refreshQueue.structure = true
        refreshQueue.content = true
        if moduleID then refreshQueue.moduleIDs[moduleID] = true end
    end
    ScheduleQueuedUIRefresh(immediate == true)
end

local function DatabaseChangeNeedsStructureRefresh(changes, phase)
    if phase == "structure" then return true end
    if phase == "content" then return false end
    if type(changes) == "table" then
        for _, change in ipairs(changes) do
            if change and change.kind == "category" then return true end
        end
    end
    return false
end

eventBus:Subscribe(events.DATABASE_CHANGED, function(_, _, moduleID, changes, phase)
    if DatabaseChangeNeedsStructureRefresh(changes, phase) then QueueUIRefresh("structure", moduleID)
    else QueueUIRefresh("build", moduleID) end
end)
eventBus:Subscribe(events.SUMMARY_BARS_CHANGED, function() QueueUIRefresh("summary") end)
eventBus:Subscribe(events.UI_TABS_CHANGED, function() QueueUIRefresh("tabs") end)
eventBus:Subscribe(events.EXTENSION_UI_REFRESH, function(moduleID) QueueUIRefresh("module", moduleID) end)
eventBus:Subscribe(events.PROGRESS_CHANGED, function() QueueUIRefresh("all") end)
eventBus:Subscribe(events.ACHIEVEMENT_COMPLETED, function() QueueUIRefresh("all") end)
eventBus:Subscribe(events.REGISTRATION_COMMITTED, function(moduleID) QueueUIRefresh("final", moduleID) end)

local root = GetRootFrame()
if root and type(root.HookScript) == "function" then
    root:HookScript("OnShow", function()
        refreshQueue.scheduleToken = refreshQueue.scheduleToken + 1
        refreshQueue.scheduled = false
        ClearQueuedUIRefresh()
        refreshQueue.lastRefreshAt = GetRefreshTime()
        extensionUI:RefreshTabs()
    end)
    root:HookScript("OnHide", function()
        refreshQueue.scheduleToken = refreshQueue.scheduleToken + 1
        refreshQueue.scheduled = false
        extensionUI:DeactivateTab()
    end)
end

extensionUI:RefreshTabs()
