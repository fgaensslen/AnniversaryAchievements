local addonName, ns = ...

local db = assert(ns.Database, "AnniversaryAchievements database must load before Titles")
local completion = assert(ns.CompletionManager, "AnniversaryAchievements completion manager must load before Titles")
local eventBus = assert(ns.EventBus, "AnniversaryAchievements event bus must load before Titles")
local events = assert(ns.Events, "AnniversaryAchievements events must load before Titles")
local state = assert(ns.State, "AnniversaryAchievements state must load before Titles")
local loc = SexyLib:Localization("Anniversary Achievements")

local titles = {}
ns.Titles = titles

local earnedCache
local earnedByKey
local titleIconButton
local titleText
local titleMenuFrame
local lastSelectedAddonKey
local paperDollOnShowHooked = false
local characterFrameOnShowHooked = false
local characterFrameOnEventHooked = false
local paperDollScriptHooked = false
local gameTooltipHooked = false

local function PrintMessage(message)
    local prefix = "|cff33ff99Anniversary Achievements:|r "
    if DEFAULT_CHAT_FRAME and type(DEFAULT_CHAT_FRAME.AddMessage) == "function" then
        DEFAULT_CHAT_FRAME:AddMessage(prefix .. tostring(message))
    elseif type(print) == "function" then
        print(prefix .. tostring(message))
    end
end

local function GetSelectionStorage()
    local localData = state:GetLocalData()
    local selection = localData.titleSelection
    if type(selection) ~= "table" then
        selection = {}
        localData.titleSelection = selection
    end
    if type(selection.selectedKey) ~= "string" or selection.selectedKey == "" then
        selection.selectedKey = nil
        selection.selectedModuleID = nil
    end
    if type(selection.selectedModuleID) ~= "string" or selection.selectedModuleID == "" then
        selection.selectedModuleID = nil
    end
    selection.suppressNativeTitle = selection.suppressNativeTitle == true
    return selection
end

local function CopyTitleEntry(entry)
    if not entry then return nil end
    return {
        key = entry.key,
        label = entry.label,
        format = entry.format,
        femaleFormat = entry.femaleFormat,
        nativeMask = entry.nativeMask,
        nativeMaskFemale = entry.nativeMaskFemale,
        achievementID = entry.achievementID,
        sourceModuleID = entry.sourceModuleID,
    }
end

local function InvalidateEarnedTitles()
    earnedCache = nil
    earnedByKey = nil
end

local function BuildEarnedTitles()
    if earnedCache then return earnedCache, earnedByKey end

    local rows = {}
    for achievementID, achievement in pairs(db:GetAllAchievements()) do
        if achievement:IsAvailable()
            and achievement:IsTitleReward()
            and completion:GetLocal():IsAchievementCompleted(achievementID)
        then
            rows[#rows + 1] = {
                achievementID = achievementID,
                achievement = achievement,
            }
        end
    end
    table.sort(rows, function(left, right) return left.achievementID < right.achievementID end)

    earnedCache = {}
    earnedByKey = {}
    for _, row in ipairs(rows) do
        local reward = row.achievement:GetTitleReward()
        if reward and reward.key and not earnedByKey[reward.key] then
            local entry = {
                key = reward.key,
                label = reward.label or row.achievement:GetRewardText() or row.achievement.name,
                format = reward.format,
                femaleFormat = reward.femaleFormat,
                nativeMask = reward.nativeMask,
                nativeMaskFemale = reward.nativeMaskFemale,
                achievementID = row.achievementID,
                sourceModuleID = reward.sourceModuleID,
            }
            earnedByKey[entry.key] = entry
            earnedCache[#earnedCache + 1] = entry
        end
    end

    table.sort(earnedCache, function(left, right)
        local leftLabel = tostring(left.label or left.key):lower()
        local rightLabel = tostring(right.label or right.key):lower()
        if leftLabel ~= rightLabel then return leftLabel < rightLabel end
        return left.key < right.key
    end)
    return earnedCache, earnedByKey
end

local function GetTitleMask(entry)
    if not entry then return nil end
    if type(UnitSex) == "function" and UnitSex("player") == 3 and tonumber(entry.nativeMaskFemale) then
        return tonumber(entry.nativeMaskFemale)
    end
    return tonumber(entry.nativeMask)
end

local function IsNativeTitleKnown(mask)
    mask = tonumber(mask)
    if not mask or mask <= 0 or type(IsTitleKnown) ~= "function" then return false end
    local ok, known = pcall(IsTitleKnown, mask)
    return ok and known == true
end

local function SetNativeTitle(mask)
    if type(SetCurrentTitle) ~= "function" then return false end
    local ok = pcall(SetCurrentTitle, tonumber(mask) or -1)
    return ok == true
end

local function GetNativeTitleMask()
    if type(GetCurrentTitle) ~= "function" then return -1 end
    local ok, mask = pcall(GetCurrentTitle)
    if not ok then return -1 end
    return tonumber(mask) or -1
end

local function SafeFormatTitle(formatText, playerName)
    formatText = type(formatText) == "string" and formatText or "%s"
    if not formatText:find("%%s") then formatText = formatText .. " %s" end
    local ok, formatted = pcall(string.format, formatText, playerName or "")
    if ok then return formatted end
    return (formatText:gsub("%%s", tostring(playerName or ""), 1))
end

local function TrimTitleLabel(text)
    if type(text) ~= "string" then return nil end
    text = text:gsub("%%s", "")
    text = text:gsub("^%s+", ""):gsub("%s+$", "")
    text = text:gsub("^,+%s*", ""):gsub("%s*,+$", "")
    text = text:gsub("^%-+%s*", ""):gsub("%s*%-$", "")
    return text ~= "" and text or nil
end

local function GetSelectedAddonEntry(clearInvalid)
    local selection = GetSelectionStorage()
    local selectedKey = selection.selectedKey
    if not selectedKey then
        lastSelectedAddonKey = nil
        return nil
    end

    local _, byKey = BuildEarnedTitles()
    local entry = byKey[selectedKey]
    if not entry and clearInvalid ~= false and not selection.selectedModuleID then
        selection.selectedKey = nil
        lastSelectedAddonKey = nil
        SetNativeTitle(-1)
    else
        lastSelectedAddonKey = entry and selectedKey or nil
    end
    return entry
end

function titles:GetEarnedTitles()
    local earned = BuildEarnedTitles()
    local result = {}
    for index, entry in ipairs(earned) do result[index] = CopyTitleEntry(entry) end
    return result
end

function titles:GetSelectedTitle()
    return CopyTitleEntry(GetSelectedAddonEntry(true))
end

function titles:IsTitleEarned(key)
    if type(key) ~= "string" then return false end
    local _, byKey = BuildEarnedTitles()
    return byKey[key] ~= nil
end

function titles:FormatTitleName(entry, playerName, sex)
    if not entry then return playerName or "" end
    playerName = playerName or (type(UnitName) == "function" and UnitName("player")) or ""
    sex = sex or (type(UnitSex) == "function" and UnitSex("player"))
    local formatText = sex == 3 and (entry.femaleFormat or entry.format) or entry.format
    return SafeFormatTitle(formatText, playerName)
end

function titles:GetLocalPlayerDisplayName()
    local playerName = type(UnitName) == "function" and UnitName("player") or ""
    if not playerName or playerName == "" then return nil end

    local selected = GetSelectedAddonEntry(true)
    if selected then return self:FormatTitleName(selected, playerName, UnitSex("player")) end

    if GetSelectionStorage().suppressNativeTitle then return playerName end
    if type(UnitPVPName) == "function" then
        local pvpName = UnitPVPName("player")
        if type(pvpName) == "string" and pvpName ~= "" then return pvpName end
    end
    return playerName
end

local function UpdateCharacterName()
    if not CharacterNameText or type(CharacterNameText.SetText) ~= "function" then return end
    local playerName = type(UnitName) == "function" and UnitName("player") or nil
    if playerName and playerName ~= "" then CharacterNameText:SetText(playerName) end
end

local function PublishTitleChanged()
    if events.TITLE_CHANGED then eventBus:Publish(events.TITLE_CHANGED, titles:GetSelectedTitle()) end
end

function titles:SetSelectedTitle(key)
    if type(key) ~= "string" or key == "" then return false end
    local _, byKey = BuildEarnedTitles()
    local entry = byKey[key]
    if not entry then return false end

    local selection = GetSelectionStorage()
    selection.selectedKey = key
    selection.selectedModuleID = entry.sourceModuleID
    selection.suppressNativeTitle = false
    lastSelectedAddonKey = key

    local mask = GetTitleMask(entry)
    if IsNativeTitleKnown(mask) then SetNativeTitle(mask) else SetNativeTitle(-1) end

    self:RefreshCharacterUI()
    PublishTitleChanged()
    return true
end

function titles:SelectNativeTitle(mask)
    mask = tonumber(mask)
    if not mask or not IsNativeTitleKnown(mask) then return false end
    local selection = GetSelectionStorage()
    selection.selectedKey = nil
    selection.selectedModuleID = nil
    selection.suppressNativeTitle = false
    lastSelectedAddonKey = nil
    SetNativeTitle(mask)
    self:RefreshCharacterUI()
    PublishTitleChanged()
    return true
end

function titles:SelectNoTitle()
    local selection = GetSelectionStorage()
    selection.selectedKey = nil
    selection.selectedModuleID = nil
    selection.suppressNativeTitle = true
    lastSelectedAddonKey = nil
    SetNativeTitle(-1)
    self:RefreshCharacterUI()
    PublishTitleChanged()
    return true
end

local function GetPVPTitleText(playerName)
    if type(UnitPVPName) ~= "function" then return nil end
    local pvpName = UnitPVPName("player")
    if type(pvpName) ~= "string" or pvpName == "" or pvpName == playerName then return nil end
    local startIndex, endIndex = pvpName:find(playerName, 1, true)
    if startIndex then
        pvpName = pvpName:sub(1, startIndex - 1) .. pvpName:sub(endIndex + 1)
    end
    return TrimTitleLabel(pvpName)
end

local function IsPVPTitleSelected()
    local selection = GetSelectionStorage()
    if selection.selectedKey or selection.suppressNativeTitle then return false end
    return GetNativeTitleMask() <= 0 and GetPVPTitleText(UnitName("player") or "") ~= nil
end

local function SelectPVPTitle()
    local selection = GetSelectionStorage()
    selection.selectedKey = nil
    selection.selectedModuleID = nil
    selection.suppressNativeTitle = false
    lastSelectedAddonKey = nil
    SetNativeTitle(-1)
    titles:RefreshCharacterUI()
    PublishTitleChanged()
end

local function IsNoTitleSelected()
    local selection = GetSelectionStorage()
    if selection.selectedKey then return false end
    if selection.suppressNativeTitle then return true end
    if GetNativeTitleMask() > 0 then return false end
    return GetPVPTitleText(UnitName("player") or "") == nil
end

local function IsAddonTitleSelected(key)
    return GetSelectionStorage().selectedKey == key
end

local function IsNativeTitleSelected(mask)
    mask = tonumber(mask)
    local selection = GetSelectionStorage()
    if selection.suppressNativeTitle or GetNativeTitleMask() ~= mask then return false end

    if not selection.selectedKey then return true end
    local selected = GetSelectedAddonEntry(false)
    return selected ~= nil and GetTitleMask(selected) == mask and IsNativeTitleKnown(mask)
end

local function BuildMenuEntries()
    local entries = {}
    local playerName = UnitName("player") or ""
    local earned = BuildEarnedTitles()
    local nativeMasks = {}

    if type(GetNumTitles) == "function" and type(GetTitleName) == "function" then
        local ok, count = pcall(GetNumTitles)
        count = ok and tonumber(count) or 0
        for mask = 1, count do
            if IsNativeTitleKnown(mask) then
                local nameOK, titleName = pcall(GetTitleName, mask)
                if nameOK and type(titleName) == "string" and titleName ~= "" then
                    nativeMasks[mask] = true
                    entries[#entries + 1] = {
                        text = TrimTitleLabel(titleName) or titleName,
                        value = mask,
                        check = IsNativeTitleSelected,
                        select = function(value) titles:SelectNativeTitle(value) end,
                    }
                end
            end
        end
    end

    local pvpTitle = GetPVPTitleText(playerName)
    if pvpTitle then
        entries[#entries + 1] = {
            text = pvpTitle,
            value = "pvp",
            check = function() return IsPVPTitleSelected() end,
            select = function() SelectPVPTitle() end,
        }
    end

    for _, entry in ipairs(earned) do
        local mask = GetTitleMask(entry)
        if not (mask and nativeMasks[mask]) then
            local formatText = UnitSex("player") == 3 and (entry.femaleFormat or entry.format) or entry.format
            entries[#entries + 1] = {
                text = TrimTitleLabel(formatText) or entry.label,
                value = entry.key,
                check = IsAddonTitleSelected,
                select = function(value) titles:SetSelectedTitle(value) end,
            }
        end
    end

    entries[#entries + 1] = {
        text = loc:Get("TITLE_NONE"),
        value = -1,
        check = function() return IsNoTitleSelected() end,
        select = function() titles:SelectNoTitle() end,
    }
    return entries
end

local function GetSelectedMenuText(entries, includeNoTitle)
    for _, entry in ipairs(entries) do
        if entry.check(entry.value) then
            if entry.value == -1 and includeNoTitle ~= true then return nil end
            return entry.text
        end
    end
    return nil
end

local TITLE_MENU_ROW_HEIGHT = 22
local TITLE_MENU_MIN_WIDTH = 120
local TITLE_MENU_HORIZONTAL_PADDING = 50
local TITLE_MENU_SCREEN_MARGIN = 8
local TITLE_MENU_LEAVE_DELAY = 0.12

local function ConfigureSingleLineFontString(fontString)
    if fontString.SetWordWrap then fontString:SetWordWrap(false) end
    if fontString.SetNonSpaceWrap then fontString:SetNonSpaceWrap(false) end
    if fontString.SetMaxLines then fontString:SetMaxLines(1) end
end

local function IsMouseOverFrame(frame)
    if not frame then return false end
    if frame.IsMouseOver then
        local ok, over = pcall(frame.IsMouseOver, frame)
        if ok then return over == true end
    end
    if type(MouseIsOver) == "function" then
        local ok, over = pcall(MouseIsOver, frame)
        if ok then return over == true end
    end
    return false
end

local function EnsureTitleMenuFrame()
    if titleMenuFrame then return titleMenuFrame end
    if type(CreateFrame) ~= "function" or not UIParent then return nil end

    local template = BackdropTemplateMixin and "BackdropTemplate" or nil
    local ok, frame = pcall(CreateFrame, "Frame", "AnniversaryAchievementsTitleMenu", UIParent, template)
    if not ok or not frame then
        ok, frame = pcall(CreateFrame, "Frame", "AnniversaryAchievementsTitleMenu", UIParent)
    end
    if not ok or not frame then return nil end

    titleMenuFrame = frame
    frame:SetFrameStrata("TOOLTIP")
    frame:SetFrameLevel(1000)
    frame:EnableMouse(true)
    if frame.SetClampedToScreen then frame:SetClampedToScreen(true) end
    frame:Hide()

    if frame.SetBackdrop then
        frame:SetBackdrop({
            bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
            edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
            tile = true,
            tileSize = 16,
            edgeSize = 16,
            insets = { left = 3, right = 3, top = 3, bottom = 3 },
        })
        frame:SetBackdropColor(0.05, 0.05, 0.05, 0.96)
        frame:SetBackdropBorderColor(0.75, 0.55, 0.20, 1)
    else
        local background = frame:CreateTexture(nil, "BACKGROUND")
        background:SetTexture("Interface\\Tooltips\\UI-Tooltip-Background")
        background:SetAllPoints(frame)
        background:SetVertexColor(0.05, 0.05, 0.05, 0.96)
        frame.background = background
    end

    local scrollFrame = CreateFrame("ScrollFrame", nil, frame)
    scrollFrame:SetPoint("TOPLEFT", frame, "TOPLEFT", 4, -4)
    scrollFrame:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -4, 4)
    if scrollFrame.EnableMouseWheel then scrollFrame:EnableMouseWheel(true) end
    frame.scrollFrame = scrollFrame

    local content = CreateFrame("Frame", nil, scrollFrame)
    content:SetPoint("TOPLEFT", scrollFrame, "TOPLEFT", 0, 0)
    content:SetSize(1, 1)
    scrollFrame:SetScrollChild(content)
    frame.content = content
    frame.rows = {}

    local measure = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    ConfigureSingleLineFontString(measure)
    measure:Hide()
    frame.measure = measure

    scrollFrame:SetScript("OnMouseWheel", function(self, delta)
        local owner = self:GetParent()
        local current = self:GetVerticalScroll() or 0
        local nextOffset = current - (delta * TITLE_MENU_ROW_HEIGHT * 3)
        if nextOffset < 0 then nextOffset = 0 end
        if nextOffset > (owner.maxScroll or 0) then nextOffset = owner.maxScroll or 0 end
        self:SetVerticalScroll(nextOffset)
    end)

    frame:SetScript("OnShow", function(self)
        self.outsideElapsed = 0
    end)
    frame:SetScript("OnHide", function(self)
        self.outsideElapsed = 0
        if self.scrollFrame then self.scrollFrame:SetVerticalScroll(0) end
    end)
    frame:SetScript("OnUpdate", function(self, elapsed)
        if IsMouseOverFrame(self) then
            self.outsideElapsed = 0
            return
        end
        self.outsideElapsed = (self.outsideElapsed or 0) + elapsed
        if self.outsideElapsed >= TITLE_MENU_LEAVE_DELAY then self:Hide() end
    end)

    return frame
end

local function EnsureTitleMenuRow(menu, index)
    local row = menu.rows[index]
    if row then return row end

    row = CreateFrame("Button", nil, menu.content)
    row:SetHeight(TITLE_MENU_ROW_HEIGHT)
    row:RegisterForClicks("LeftButtonUp")

    local highlight = row:CreateTexture(nil, "HIGHLIGHT")
    highlight:SetTexture("Interface\\QuestFrame\\UI-QuestTitleHighlight")
    highlight:SetBlendMode("ADD")
    highlight:SetAllPoints(row)
    row.highlight = highlight

    local check = row:CreateTexture(nil, "ARTWORK")
    check:SetTexture("Interface\\Buttons\\UI-CheckBox-Check")
    check:SetSize(18, 18)
    check:SetPoint("LEFT", row, "LEFT", 4, 0)
    row.check = check

    local text = row:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    text:SetPoint("LEFT", check, "RIGHT", 3, 0)
    text:SetPoint("RIGHT", row, "RIGHT", -8, 0)
    text:SetJustifyH("LEFT")
    text:SetJustifyV("MIDDLE")
    ConfigureSingleLineFontString(text)
    row.text = text

    row:SetScript("OnClick", function(self)
        local entry = self.entry
        if titleMenuFrame then titleMenuFrame:Hide() end
        if entry and entry.select then entry.select(entry.value) end
    end)

    menu.rows[index] = row
    return row
end

local function GetTitleMenuWidth(menu, entries)
    local longest = 0
    for _, entry in ipairs(entries) do
        local label = tostring(entry.text or "")
        menu.measure:SetText(label)
        local width = tonumber(menu.measure:GetStringWidth()) or 0
        if width <= 0 then width = #label * 7 end
        if width > longest then longest = width end
    end

    local screenWidth = tonumber(UIParent:GetWidth()) or 1024
    local maximum = math.max(TITLE_MENU_MIN_WIDTH, screenWidth - (TITLE_MENU_SCREEN_MARGIN * 2))
    return math.min(maximum, math.max(TITLE_MENU_MIN_WIDTH, math.ceil(longest + TITLE_MENU_HORIZONTAL_PADDING)))
end

local function PositionTitleMenuAtCursor(menu)
    local scale = tonumber(UIParent:GetEffectiveScale()) or 1
    local cursorX, cursorY = GetCursorPosition()
    cursorX = (tonumber(cursorX) or 0) / scale
    cursorY = (tonumber(cursorY) or 0) / scale

    local screenWidth = tonumber(UIParent:GetWidth()) or 1024
    local screenHeight = tonumber(UIParent:GetHeight()) or 768
    local menuWidth = tonumber(menu:GetWidth()) or TITLE_MENU_MIN_WIDTH
    local menuHeight = tonumber(menu:GetHeight()) or TITLE_MENU_ROW_HEIGHT

    local left = cursorX - 26
    if left < TITLE_MENU_SCREEN_MARGIN then left = TITLE_MENU_SCREEN_MARGIN end
    if left + menuWidth > screenWidth - TITLE_MENU_SCREEN_MARGIN then
        left = screenWidth - TITLE_MENU_SCREEN_MARGIN - menuWidth
    end

    local top = cursorY + (TITLE_MENU_ROW_HEIGHT / 2)
    if top > screenHeight - TITLE_MENU_SCREEN_MARGIN then
        top = screenHeight - TITLE_MENU_SCREEN_MARGIN
    end
    if top - menuHeight < TITLE_MENU_SCREEN_MARGIN then
        top = math.min(screenHeight - TITLE_MENU_SCREEN_MARGIN, cursorY + menuHeight - (TITLE_MENU_ROW_HEIGHT / 2))
    end

    menu:ClearAllPoints()
    menu:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", left, top)
end

local function ShowTitleMenu(_, entries)
    local menu = EnsureTitleMenuFrame()
    if not menu then return end
    if menu:IsShown() then
        menu:Hide()
        return
    end

    local menuWidth = GetTitleMenuWidth(menu, entries)
    local screenHeight = tonumber(UIParent:GetHeight()) or 768
    local fullContentHeight = math.max(TITLE_MENU_ROW_HEIGHT, #entries * TITLE_MENU_ROW_HEIGHT)
    local visibleHeight = math.min(fullContentHeight, math.max(TITLE_MENU_ROW_HEIGHT, screenHeight - 24))

    menu:SetSize(menuWidth, visibleHeight + 8)
    menu.content:SetSize(menuWidth - 8, fullContentHeight)
    menu.maxScroll = math.max(0, fullContentHeight - visibleHeight)
    menu.scrollFrame:SetVerticalScroll(0)

    for index, entry in ipairs(entries) do
        local row = EnsureTitleMenuRow(menu, index)
        row:ClearAllPoints()
        row:SetPoint("TOPLEFT", menu.content, "TOPLEFT", 0, -((index - 1) * TITLE_MENU_ROW_HEIGHT))
        row:SetPoint("TOPRIGHT", menu.content, "TOPRIGHT", 0, -((index - 1) * TITLE_MENU_ROW_HEIGHT))
        row.entry = entry
        row.text:SetText(entry.text or "")
        if entry.check(entry.value) == true then
            row.check:Show()
        else
            row.check:Hide()
        end
        row:Show()
    end
    for index = #entries + 1, #menu.rows do
        menu.rows[index]:Hide()
        menu.rows[index].entry = nil
    end

    PositionTitleMenuAtCursor(menu)
    menu:Show()
end

local TITLE_ICON_TEXTURE = "Interface\\Icons\\INV_Misc_Note_02"
local TITLE_ICON_BUTTON_SIZE = 28
local TITLE_ICON_SLOT_GAP = 7

local function GetItemButtonIconTexture(button)
    if not button then return nil end

    local icon = button.icon or button.Icon
    if not icon and button.GetName then
        local name = button:GetName()
        if name and name ~= "" then
            icon = _G[name .. "IconTexture"] or _G[name .. "Icon"]
        end
    end
    return icon
end

local function ConfigureTitleIconTexture(button)
    if button.anniversaryTitleTextureConfigured then return end
    button.anniversaryTitleTextureConfigured = true

    -- Der Titelbutton verwendet den nativen ItemButtonTemplate-Aufbau. Dadurch
    -- liegen Icon, Pushed-/Highlight-Zustand und Quickslot-Umrandung in den vom
    -- Client vorgesehenen Zeichenebenen. Das verhindert die zuvor sichtbaren
    -- Segment-/Überlagerungsartefakte der manuell übereinandergelegten Texturen.
    local icon = GetItemButtonIconTexture(button)
    if not icon then
        icon = button:CreateTexture(nil, "ARTWORK")
    end

    icon:SetTexture(TITLE_ICON_TEXTURE)
    if icon.ClearAllPoints then icon:ClearAllPoints() end
    icon:SetPoint("TOPLEFT", button, "TOPLEFT", 2, -2)
    icon:SetPoint("BOTTOMRIGHT", button, "BOTTOMRIGHT", -2, 2)
    if icon.SetTexCoord then icon:SetTexCoord(0.07, 0.93, 0.07, 0.93) end
    if icon.SetDrawLayer then icon:SetDrawLayer("ARTWORK", 0) end
    icon:Show()
    button.anniversaryTitleIcon = icon

    -- Das Template stellt die Buttonumrandung selbst bereit. Nur falls ein
    -- Client den Normalrahmen nicht erzeugt, wird defensiv derselbe native
    -- Quickslot-Rahmen ergänzt, ohne die Iconfläche als Normaltextur zu ersetzen.
    local normal = button.GetNormalTexture and button:GetNormalTexture() or nil
    if not normal and button.SetNormalTexture then
        button:SetNormalTexture("Interface\\Buttons\\UI-Quickslot2")
        normal = button:GetNormalTexture()
    end
    if normal then
        if normal.ClearAllPoints then normal:ClearAllPoints() end
        normal:SetPoint("TOPLEFT", button, "TOPLEFT", -5, 5)
        normal:SetPoint("BOTTOMRIGHT", button, "BOTTOMRIGHT", 5, -5)
        if normal.SetTexCoord then normal:SetTexCoord(0, 1, 0, 1) end
    end
end

local function EnsureTitleControls()
    local parent = PaperDollFrame or CharacterFrame
    if not parent then return nil, nil end

    if not titleIconButton or not titleIconButton.GetParent or titleIconButton:GetParent() ~= parent then
        local ok, button = pcall(CreateFrame, "Button", "AnniversaryAchievementsTitleIconButton", parent, "ItemButtonTemplate")
        if not ok or not button then
            ok, button = pcall(CreateFrame, "Button", "AnniversaryAchievementsTitleIconButton", parent)
        end
        if ok and button then
            titleIconButton = button
            button:SetSize(TITLE_ICON_BUTTON_SIZE, TITLE_ICON_BUTTON_SIZE)
            if button.SetFrameLevel and parent.GetFrameLevel then
                button:SetFrameLevel((parent:GetFrameLevel() or 0) + 20)
            end
            ConfigureTitleIconTexture(button)
            if button.RegisterForClicks then button:RegisterForClicks("LeftButtonUp") end
            button:SetScript("OnClick", function(self)
                ShowTitleMenu(self, BuildMenuEntries())
            end)
            button:SetScript("OnEnter", function(self)
                if not GameTooltip then return end
                GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
                GameTooltip:SetText(loc:Get("TITLE_ICON_TOOLTIP"))
                GameTooltip:AddLine(loc:Get("TITLE_ICON_TOOLTIP_HINT"), 1, 1, 1, true)
                GameTooltip:Show()
            end)
            button:SetScript("OnLeave", function()
                if GameTooltip then GameTooltip:Hide() end
            end)
        end
    end

    if titleIconButton then
        titleIconButton:ClearAllPoints()
        if CharacterHandsSlot then
            -- Horizontal über dem Handschuhslot zentriert und mit sieben Pixel
            -- Abstand im freien Zwischenraum platziert.
            titleIconButton:SetPoint("BOTTOM", CharacterHandsSlot, "TOP", 0, TITLE_ICON_SLOT_GAP)
        else
            titleIconButton:SetPoint("TOPLEFT", parent, "TOPLEFT", 54, -72)
        end
    end

    if not titleText or not titleText.GetParent or titleText:GetParent() ~= parent then
        local ok, text = pcall(parent.CreateFontString, parent, "AnniversaryAchievementsSelectedTitleText", "OVERLAY", "GameFontNormal")
        if ok and text then
            titleText = text
            titleText:SetWidth(190)
            titleText:SetHeight(20)
            titleText:SetJustifyH("CENTER")
            titleText:SetJustifyV("MIDDLE")
            if titleText.SetWordWrap then titleText:SetWordWrap(false) end
        end
    end

    if titleText then
        titleText:ClearAllPoints()
        if CharacterLevelText then
            titleText:SetPoint("TOP", CharacterLevelText, "BOTTOM", 0, -6)
        elseif CharacterNameFrame then
            titleText:SetPoint("TOP", CharacterNameFrame, "BOTTOM", 0, -18)
        else
            titleText:SetPoint("TOP", parent, "TOP", 0, -32)
        end
    end

    -- Die Titelauswahl wird vollständig über das Icon gesteuert; ein eventuell
    -- vorhandenes Blizzard-Dropdown bleibt an dieser Stelle unsichtbar.
    local nativeDropdown = parent.TitleDropdown or _G.PlayerTitleDropdown
    if nativeDropdown and nativeDropdown ~= titleIconButton and nativeDropdown.Hide then
        nativeDropdown:Hide()
    end

    return titleIconButton, titleText
end

local function ConfigureTitleControls()
    local entries = BuildMenuEntries()
    local button, text = EnsureTitleControls()
    if text then
        local selectedText = GetSelectedMenuText(entries, false)
        if selectedText then
            text:SetText(selectedText)
            text:Show()
        else
            text:SetText("")
            text:Hide()
        end
    end
    if button then button:Show() end
end

local TITLE_TOOLTIP_HORIZONTAL_PADDING = 28

local function GetTooltipNameLine(tooltip)
    if not tooltip or type(tooltip.GetName) ~= "function" then return nil end
    local tooltipName = tooltip:GetName()
    if not tooltipName then return nil end
    return _G[tooltipName .. "TextLeft1"], _G[tooltipName .. "TextRight1"]
end

local function GetFontStringTextWidth(fontString)
    if not fontString then return 0 end
    if type(fontString.GetUnboundedStringWidth) == "function" then
        local ok, width = pcall(fontString.GetUnboundedStringWidth, fontString)
        if ok and tonumber(width) then return tonumber(width) end
    end
    if type(fontString.GetStringWidth) == "function" then
        local ok, width = pcall(fontString.GetStringWidth, fontString)
        if ok and tonumber(width) then return tonumber(width) end
    end
    return 0
end

local function UpdateOwnNameInTooltip(tooltip)
    if not tooltip or type(tooltip.GetUnit) ~= "function" then return end
    local _, unit = tooltip:GetUnit()
    if not unit then return end
    local isPlayer = type(UnitIsUnit) == "function" and UnitIsUnit(unit, "player")
    if not isPlayer and unit ~= "player" then return end

    local displayName = titles:GetLocalPlayerDisplayName()
    if type(displayName) ~= "string" or displayName == "" then return end

    local nameLine, rightLine = GetTooltipNameLine(tooltip)
    if not nameLine or type(nameLine.SetText) ~= "function" then return end

    local red, green, blue, alpha
    if type(nameLine.GetTextColor) == "function" then
        red, green, blue, alpha = nameLine:GetTextColor()
    end

    ConfigureSingleLineFontString(nameLine)
    nameLine:SetText(displayName)
    if red and type(nameLine.SetTextColor) == "function" then
        nameLine:SetTextColor(red, green, blue, alpha or 1)
    end

    -- The title is part of the first name line. Increase the tooltip's minimum
    -- width to the unwrapped name width instead of adding a separate title line.
    local requiredWidth = GetFontStringTextWidth(nameLine)
        + GetFontStringTextWidth(rightLine)
        + TITLE_TOOLTIP_HORIZONTAL_PADDING
    local currentWidth = type(tooltip.GetWidth) == "function" and tonumber(tooltip:GetWidth()) or 0
    if requiredWidth > currentWidth then
        if type(tooltip.SetMinimumWidth) == "function" then
            pcall(tooltip.SetMinimumWidth, tooltip, requiredWidth)
        elseif type(tooltip.SetWidth) == "function" then
            pcall(tooltip.SetWidth, tooltip, requiredWidth)
        end
    end
    if type(tooltip.Show) == "function" then tooltip:Show() end
end

function titles:RefreshCharacterUI()
    UpdateCharacterName()
    if (PaperDollFrame and PaperDollFrame:IsShown()) or (CharacterFrame and CharacterFrame:IsShown()) then
        ConfigureTitleControls()
    end
end

local function InstallCharacterHooks()
    if type(hooksecurefunc) == "function" then
        if not paperDollOnShowHooked and type(PaperDollFrame_OnShow) == "function" then
            local ok = pcall(hooksecurefunc, "PaperDollFrame_OnShow", function()
                ConfigureTitleControls()
                UpdateCharacterName()
            end)
            paperDollOnShowHooked = ok == true
        end
        if not characterFrameOnShowHooked and type(CharacterFrame_OnShow) == "function" then
            local ok = pcall(hooksecurefunc, "CharacterFrame_OnShow", function()
                ConfigureTitleControls()
                UpdateCharacterName()
            end)
            characterFrameOnShowHooked = ok == true
        end
        if not characterFrameOnEventHooked and type(CharacterFrame_OnEvent) == "function" then
            local ok = pcall(hooksecurefunc, "CharacterFrame_OnEvent", function(_, event, unit)
                if event == "PLAYER_PVP_RANK_CHANGED" or (event == "UNIT_NAME_UPDATE" and unit == "player") then
                    titles:RefreshCharacterUI()
                end
            end)
            characterFrameOnEventHooked = ok == true
        end
    end

    if GameTooltip and GameTooltip.HookScript and not gameTooltipHooked then
        local ok = pcall(GameTooltip.HookScript, GameTooltip, "OnTooltipSetUnit", UpdateOwnNameInTooltip)
        gameTooltipHooked = ok == true
    end

    if PaperDollFrame and PaperDollFrame.HookScript and not paperDollScriptHooked then
        local ok = pcall(PaperDollFrame.HookScript, PaperDollFrame, "OnShow", function()
            ConfigureTitleControls()
            UpdateCharacterName()
        end)
        paperDollScriptHooked = ok == true
    end
end

local function ValidatePersistedSelection()
    local selected = GetSelectedAddonEntry(true)
    if selected then
        local mask = GetTitleMask(selected)
        if IsNativeTitleKnown(mask) then SetNativeTitle(mask) else SetNativeTitle(-1) end
    end
    UpdateCharacterName()
end

local function OnAchievementCompleted(achievementID)
    local achievement = db:GetAchievement(tonumber(achievementID))
    InvalidateEarnedTitles()
    if achievement and achievement:IsTitleReward() then
        local reward = achievement:GetTitleReward()
        PrintMessage(string.format(loc:Get("TITLE_UNLOCKED"), reward.label or achievement:GetRewardText() or achievement.name))
    end
    titles:RefreshCharacterUI()
end

local function OnLocalDataReset()
    InvalidateEarnedTitles()
    if lastSelectedAddonKey then SetNativeTitle(-1) end
    lastSelectedAddonKey = nil
    titles:RefreshCharacterUI()
end

local function IsCharacterFrameVisible()
    return (PaperDollFrame and PaperDollFrame:IsShown())
        or (CharacterFrame and CharacterFrame:IsShown())
        or false
end

local function OnDatabaseChanged()
    InvalidateEarnedTitles()
    if IsCharacterFrameVisible() then titles:RefreshCharacterUI() end
end

local function OnRegistrationCommitted(moduleID)
    InvalidateEarnedTitles()
    local selection = GetSelectionStorage()
    if selection.selectedModuleID and selection.selectedModuleID == moduleID then
        local selected = GetSelectedAddonEntry(false)
        if not selected then
            selection.selectedKey = nil
            selection.selectedModuleID = nil
            lastSelectedAddonKey = nil
            SetNativeTitle(-1)
        end
    else
        GetSelectedAddonEntry(true)
    end
    titles:RefreshCharacterUI()
end

eventBus:Subscribe(events.ACHIEVEMENT_COMPLETED, OnAchievementCompleted)
eventBus:Subscribe(events.LOCAL_DATA_RESET, OnLocalDataReset)
eventBus:Subscribe(events.DATABASE_CHANGED, OnDatabaseChanged)
eventBus:Subscribe(events.REGISTRATION_COMMITTED, OnRegistrationCommitted)

local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("ADDON_LOADED")
eventFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
eventFrame:RegisterEvent("UNIT_NAME_UPDATE")
eventFrame:RegisterEvent("PLAYER_PVP_RANK_CHANGED")
eventFrame:SetScript("OnEvent", function(_, event, arg1)
    if event == "ADDON_LOADED" and arg1 ~= addonName and arg1 ~= "Blizzard_CharacterFrame" then return end
    if event == "UNIT_NAME_UPDATE" and arg1 ~= "player" then return end
    InstallCharacterHooks()
    ValidatePersistedSelection()
    titles:RefreshCharacterUI()
end)

SLASH_ANNIVERSARYACHIEVEMENTSTITLE1 = "/aatitle"
SLASH_ANNIVERSARYACHIEVEMENTSTITLE2 = "/aa-title"
SLASH_ANNIVERSARYACHIEVEMENTSTITLE3 = "/aatitel"
SlashCmdList["ANNIVERSARYACHIEVEMENTSTITLE"] = function(argument)
    local command = tostring(argument or ""):match("^%s*(.-)%s*$")
    local lowered = command:lower()
    local earned = BuildEarnedTitles()

    if command == "" or lowered == "list" or lowered == "liste" then
        PrintMessage(string.format(loc:Get("TITLE_LIST_HEADER"), #earned))
        for index, entry in ipairs(earned) do
            PrintMessage(string.format("  %d. %s", index, entry.label))
        end
        PrintMessage(loc:Get("TITLE_COMMAND_HELP"))
        return
    end

    if lowered == "none" or lowered == "off" or lowered == "aus" or lowered == "kein" then
        titles:SelectNoTitle()
        return
    end

    local index = tonumber(command)
    local entry = index and earned[math.floor(index)] or nil
    if entry and titles:SetSelectedTitle(entry.key) then return end

    PrintMessage(loc:Get("TITLE_NOT_AVAILABLE"))
    PrintMessage(loc:Get("TITLE_COMMAND_HELP"))
end
