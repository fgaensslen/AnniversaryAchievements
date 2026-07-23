local _, ns = ...

local state = ns.State
local loc = SexyLib:Localization("Anniversary Achievements")
local BUTTON_NAME = "AchievementMicroButton"
local OPTIONS_CATEGORY = "Anniversary Achievements"
local SPACING = -3

local controller = {
    installed = false,
    updateHooked = false,
    helpHooked = false,
    applying = false,
    pending = false,
    originalLayout = nil,
    layoutCorrectionSerial = 0,
}
ns.Microbutton = controller

local function InCombat()
    return type(InCombatLockdown) == "function" and InCombatLockdown() == true
end

local function IsEnabled()
    return state:GetSettings().microbutton ~= false
end

local function IsStartupReady()
    return type(ns.IsAddonAndExtensionsReady) == "function"
        and ns.IsAddonAndExtensionsReady() == true
end

local LAYOUT_FRAME_NAMES = {
    "QuestLogMicroButton",
    "SocialsMicroButton",
    "GuildMicroButton",
    "WorldMapMicroButton",
    "MainMenuMicroButton",
    "HelpMicroButton",
}

local function FindButtonIndex(name)
    if type(name) ~= "string" or type(MICRO_BUTTONS) ~= "table" then return nil end
    for index, buttonName in ipairs(MICRO_BUTTONS) do
        if buttonName == name then return index end
    end
    return nil
end

local function RemoveButtonName(name)
    if type(name) ~= "string" or type(MICRO_BUTTONS) ~= "table" then return end
    for index = #MICRO_BUTTONS, 1, -1 do
        if MICRO_BUTTONS[index] == name then
            table.remove(MICRO_BUTTONS, index)
        end
    end
end

local function CaptureFramePoints(frame)
    local points = {}
    if not frame or type(frame.GetNumPoints) ~= "function" or type(frame.GetPoint) ~= "function" then
        return points
    end

    local count = frame:GetNumPoints() or 0
    for index = 1, count do
        local point, relativeTo, relativePoint, offsetX, offsetY = frame:GetPoint(index)
        points[#points + 1] = { point, relativeTo, relativePoint, offsetX, offsetY }
    end
    return points
end

local function RestoreFramePoints(frame, points)
    if not frame or type(frame.ClearAllPoints) ~= "function" then return end
    frame:ClearAllPoints()
    if type(frame.SetPoint) ~= "function" then return end

    for _, point in ipairs(points or {}) do
        frame:SetPoint(point[1], point[2], point[3], point[4], point[5])
    end
end

local function CaptureOriginalLayout()
    if controller.originalLayout then return controller.originalLayout end

    local snapshot = {
        frames = {},
        helpWasListed = false,
        helpIndex = nil,
        helpWasShown = true,
    }

    if type(MICRO_BUTTONS) == "table" then
        snapshot.helpIndex = FindButtonIndex("HelpMicroButton")
        snapshot.helpWasListed = snapshot.helpIndex ~= nil
    end

    for _, name in ipairs(LAYOUT_FRAME_NAMES) do
        local frame = _G[name]
        if frame then
            snapshot.frames[name] = CaptureFramePoints(frame)
            if name == "HelpMicroButton" and type(frame.IsShown) == "function" then
                snapshot.helpWasShown = frame:IsShown() == true
            end
        end
    end

    controller.originalLayout = snapshot
    return snapshot
end

local function EnsureEnabledButtonList()
    if type(MICRO_BUTTONS) ~= "table" then return false end

    CaptureOriginalLayout()
    RemoveButtonName(BUTTON_NAME)
    RemoveButtonName("HelpMicroButton")

    local questIndex = FindButtonIndex("QuestLogMicroButton")
    local insertIndex = questIndex and (questIndex + 1) or (#MICRO_BUTTONS + 1)
    table.insert(MICRO_BUTTONS, insertIndex, BUTTON_NAME)
    return true
end

local function RestoreOriginalButtonList()
    if type(MICRO_BUTTONS) ~= "table" then return end

    local snapshot = CaptureOriginalLayout()
    RemoveButtonName(BUTTON_NAME)
    RemoveButtonName("HelpMicroButton")

    if snapshot.helpWasListed then
        local insertIndex = math.max(1, math.min(snapshot.helpIndex or (#MICRO_BUTTONS + 1), #MICRO_BUTTONS + 1))
        table.insert(MICRO_BUTTONS, insertIndex, "HelpMicroButton")
    end
end

local function OpenAchievements()
    if type(AchievementFrame_ToggleAchievementFrame) == "function" then
        AchievementFrame_ToggleAchievementFrame()
    end
end

local function GetAceBlizOptionsFrame()
    if type(LibStub) ~= "function" then return nil end

    local okDialog, dialog = pcall(LibStub, "AceConfigDialog-3.0", true)
    if not okDialog or not dialog or type(dialog.BlizOptions) ~= "table" then
        return nil
    end

    local app = dialog.BlizOptions[OPTIONS_CATEGORY]
    if type(app) ~= "table" then return nil end

    local entry = app[OPTIONS_CATEGORY]
    if type(entry) == "table" and entry.frame then
        return entry.frame
    end
    return entry
end

local function EnsureAceBlizOptionsFrame()
    local frame = GetAceBlizOptionsFrame()
    if frame then return frame end
    if type(LibStub) ~= "function" then return nil end

    local okDialog, dialog = pcall(LibStub, "AceConfigDialog-3.0", true)
    if okDialog and dialog and type(dialog.AddToBlizOptions) == "function" then
        pcall(dialog.AddToBlizOptions, dialog, OPTIONS_CATEGORY)
    end
    return GetAceBlizOptionsFrame()
end

local function GetCategoryID(category)
    if not category then return nil end
    if type(category.GetID) == "function" then
        local ok, id = pcall(category.GetID, category)
        if ok and id then return id end
    end
    return category.ID or category.id or category.categoryID
end

local function CategoryMatches(category, name)
    if not category then return false end
    if category.name == name or category.Name == name then return true end
    if category.ID == name or category.id == name or category.categoryID == name then return true end

    local getters = { "GetName", "GetQualifiedName", "GetID" }
    for _, getterName in ipairs(getters) do
        local getter = category[getterName]
        if type(getter) == "function" then
            local ok, value = pcall(getter, category)
            if ok and value == name then return true end
        end
    end
    return false
end

local function FindSettingsCategoryByName(name)
    if type(Settings) == "table" and type(Settings.GetCategory) == "function" then
        local ok, category = pcall(Settings.GetCategory, name)
        if ok and category then return category end
    end

    local panel = SettingsPanel
    if not panel or type(panel.GetAllCategories) ~= "function" then return nil end

    local ok, categories = pcall(panel.GetAllCategories, panel)
    if not ok or type(categories) ~= "table" then return nil end

    local seen = {}
    local function Scan(list)
        if type(list) ~= "table" then return nil end
        for _, category in ipairs(list) do
            if category and not seen[category] then
                seen[category] = true
                if CategoryMatches(category, name) then return category end

                local subcategories
                if type(category.GetSubcategories) == "function" then
                    local okSub, result = pcall(category.GetSubcategories, category)
                    if okSub then subcategories = result end
                elseif type(category.subcategories) == "table" then
                    subcategories = category.subcategories
                end

                local found = Scan(subcategories)
                if found then return found end
            end
        end
        return nil
    end

    return Scan(categories)
end

local function OpenSettingsPanelCategory(category)
    local panel = SettingsPanel
    if not panel or not category then return false end

    if type(panel.Open) == "function" and type(panel.SelectCategory) == "function" then
        local okOpen = pcall(panel.Open, panel)
        local okSelect = pcall(panel.SelectCategory, panel, category)
        if okOpen and okSelect then return true end
    end

    local id = GetCategoryID(category) or OPTIONS_CATEGORY
    if type(panel.OpenToCategory) == "function" then
        local ok, result = pcall(panel.OpenToCategory, panel, id)
        if ok and result ~= false then return true end
    end
    return false
end

local function OpenOptionsNow()
    EnsureAceBlizOptionsFrame()

    local category = FindSettingsCategoryByName(OPTIONS_CATEGORY)
    if OpenSettingsPanelCategory(category) then return end

    local id = GetCategoryID(category) or OPTIONS_CATEGORY
    if type(Settings) == "table" and type(Settings.OpenToCategory) == "function" then
        local ok, result = pcall(Settings.OpenToCategory, id)
        if ok and result ~= false then return end
        if id ~= OPTIONS_CATEGORY then
            ok, result = pcall(Settings.OpenToCategory, OPTIONS_CATEGORY)
            if ok and result ~= false then return end
        end
    end

    local frame = EnsureAceBlizOptionsFrame()
    if type(InterfaceOptionsFrame_OpenToCategory) == "function" then
        if frame then
            InterfaceOptionsFrame_OpenToCategory(frame)
            InterfaceOptionsFrame_OpenToCategory(frame)
        else
            InterfaceOptionsFrame_OpenToCategory(OPTIONS_CATEGORY)
            InterfaceOptionsFrame_OpenToCategory(OPTIONS_CATEGORY)
        end
    end
end

local function OpenOptions()
    if C_Timer and type(C_Timer.After) == "function" then
        C_Timer.After(0, OpenOptionsNow)
    else
        OpenOptionsNow()
    end
end

ns.OpenAddonOptions = OpenOptions

local function OnClick(_, mouseButton)
    if mouseButton == "RightButton" then
        OpenOptions()
    else
        OpenAchievements()
    end
end

local function GetTooltipTitle()
    return ACHIEVEMENT_BUTTON or loc:Get("MICROBUTTON_TITLE")
end

local function SetTooltipText(button)
    if not button then return end

    local title = GetTooltipTitle()
    if type(MicroButtonTooltipText) == "function" then
        button.tooltipText = MicroButtonTooltipText(title, "CLASSIC_ACHIEVEMENT")
    else
        button.tooltipText = title
    end
    button.newbieText = loc:Get("MICROBUTTON_LEFT_CLICK")
        .. "\n" .. loc:Get("MICROBUTTON_RIGHT_CLICK")
end

local function PopulateNavigationTooltip(tooltip)
    if not tooltip then return end

    if type(tooltip.ClearLines) == "function" then
        tooltip:ClearLines()
    end
    tooltip:AddLine(GetTooltipTitle(), 1, 1, 1)
    tooltip:AddLine(loc:Get("MICROBUTTON_LEFT_CLICK"), 1, 0.82, 0)
    tooltip:AddLine(loc:Get("MICROBUTTON_RIGHT_CLICK"), 1, 0.82, 0)
end

ns.PopulateNavigationButtonTooltip = PopulateNavigationTooltip

local function ShowTooltip(button)
    if not button or not GameTooltip then return end

    GameTooltip:SetOwner(button, "ANCHOR_RIGHT")
    PopulateNavigationTooltip(GameTooltip)
    GameTooltip:Show()
end

local function HideTooltip()
    if GameTooltip then GameTooltip:Hide() end
end

local function RefreshButtonState(button)
    if not button or type(button.SetButtonState) ~= "function" then return end
    if AchievementFrame and AchievementFrame.IsShown and AchievementFrame:IsShown() then
        button:SetButtonState("PUSHED", true)
    else
        button:SetButtonState("NORMAL", false)
    end
end

local function ConfigureButton(button)
    if not button then return end

    if type(LoadMicroButtonTextures) == "function" then
        pcall(LoadMicroButtonTextures, button, "Achievement")
    else
        button:SetNormalTexture("Interface\\Buttons\\UI-MicroButton-Achievement-Up")
        button:SetPushedTexture("Interface\\Buttons\\UI-MicroButton-Achievement-Down")
        button:SetDisabledTexture("Interface\\Buttons\\UI-MicroButton-Achievement-Disabled")
        button:SetHighlightTexture("Interface\\Buttons\\UI-MicroButton-Hilight")
    end

    SetTooltipText(button)
    button:EnableMouse(true)
    button:Enable()
    button:SetHitRectInsets(0, 0, 0, 0)
    button:RegisterForClicks("LeftButtonUp", "RightButtonUp")
    button:SetScript("OnClick", OnClick)
    button:SetScript("OnEnter", ShowTooltip)
    button:SetScript("OnLeave", HideTooltip)
    button:SetScript("OnEvent", function(self) SetTooltipText(self) end)
end

local function GetOrCreateButton()
    local button = _G[BUTTON_NAME]
    if not button then
        if type(CreateFrame) ~= "function" or not UIParent or InCombat() then return nil end
        local ok, created = pcall(CreateFrame, "Button", BUTTON_NAME, UIParent, "MainMenuBarMicroButton")
        if not ok or not created then
            ok, created = pcall(CreateFrame, "Button", BUTTON_NAME, UIParent)
            if not ok or not created then return nil end
            if QuestLogMicroButton and QuestLogMicroButton.GetSize then
                created:SetSize(QuestLogMicroButton:GetSize())
            end
        end
        button = created
    end

    ConfigureButton(button)
    return button
end

local function AnchorRightOf(frame, previous)
    if not frame or not previous or type(frame.ClearAllPoints) ~= "function" or type(frame.SetPoint) ~= "function" then
        return
    end
    frame:ClearAllPoints()
    frame:SetPoint("BOTTOMLEFT", previous, "BOTTOMRIGHT", SPACING, 0)
end

local function ReanchorSharedSocialGuildSlot(button)
    local slot = SocialsMicroButton or GuildMicroButton
    if not slot then return button end

    -- Classic Era and TBC use SocialsMicroButton as the physical slot while
    -- GuildMicroButton is overlaid on that slot. SocialsMicroButton may be
    -- hidden when the guild variant is active, so its anchor must be moved
    -- regardless of visibility.
    if SocialsMicroButton then
        AnchorRightOf(SocialsMicroButton, button)
        slot = SocialsMicroButton
    else
        AnchorRightOf(GuildMicroButton, button)
        slot = GuildMicroButton
    end

    if GuildMicroButton and SocialsMicroButton and GuildMicroButton ~= SocialsMicroButton then
        if type(GuildMicroButton.ClearAllPoints) == "function" then
            GuildMicroButton:ClearAllPoints()
        end
        if type(GuildMicroButton.SetAllPoints) == "function" then
            GuildMicroButton:SetAllPoints(SocialsMicroButton)
        elseif type(GuildMicroButton.SetPoint) == "function" then
            GuildMicroButton:SetPoint("BOTTOMLEFT", SocialsMicroButton, "BOTTOMLEFT", 0, 0)
        end
    end

    return slot
end

local function ReanchorVisibleButtonsAfter(button)
    if not button then return button end

    local previous = ReanchorSharedSocialGuildSlot(button)

    if WorldMapMicroButton then
        AnchorRightOf(WorldMapMicroButton, previous)
        previous = WorldMapMicroButton
    end

    if MainMenuMicroButton then
        AnchorRightOf(MainMenuMicroButton, previous)
        previous = MainMenuMicroButton
    end

    return previous
end

local function HideHelpButton()
    if HelpMicroButton and type(HelpMicroButton.Hide) == "function" then
        HelpMicroButton:Hide()
    end
end

local function RestoreBlizzardLayout()
    local snapshot = CaptureOriginalLayout()

    for _, name in ipairs(LAYOUT_FRAME_NAMES) do
        local frame = _G[name]
        local points = snapshot.frames[name]
        if frame and points then
            RestoreFramePoints(frame, points)
        end
    end

    if HelpMicroButton then
        if snapshot.helpWasShown and type(HelpMicroButton.Show) == "function" then
            HelpMicroButton:Show()
        elseif type(HelpMicroButton.Hide) == "function" then
            HelpMicroButton:Hide()
        end
    end
end

local function ReanchorEnabledLayout()
    if InCombat() or not IsEnabled() then return end

    CaptureOriginalLayout()
    EnsureEnabledButtonList()

    local button = GetOrCreateButton()
    if not button then return end

    local parent = QuestLogMicroButton and QuestLogMicroButton.GetParent and QuestLogMicroButton:GetParent()
        or UIParent
    button:SetParent(parent)

    if QuestLogMicroButton and QuestLogMicroButton.GetFrameStrata and button.SetFrameStrata then
        button:SetFrameStrata(QuestLogMicroButton:GetFrameStrata())
    end
    if QuestLogMicroButton and QuestLogMicroButton.GetFrameLevel and button.SetFrameLevel then
        button:SetFrameLevel(QuestLogMicroButton:GetFrameLevel() + 1)
    end
    if QuestLogMicroButton and QuestLogMicroButton.GetScale and button.SetScale then
        button:SetScale(QuestLogMicroButton:GetScale())
    end

    button:ClearAllPoints()
    if QuestLogMicroButton then
        button:SetPoint("BOTTOMLEFT", QuestLogMicroButton, "BOTTOMRIGHT", SPACING, 0)
    else
        button:SetPoint("BOTTOMLEFT", parent, "BOTTOMLEFT", 0, 0)
    end
    button:Show()
    RefreshButtonState(button)

    ReanchorVisibleButtonsAfter(button)

    HideHelpButton()
end

local LAYOUT_CORRECTION_DELAYS = { 0.1, 0.5, 1, 2 }

local function ScheduleLayoutCorrections(serial)
    if not C_Timer or type(C_Timer.After) ~= "function" then return end

    for _, delay in ipairs(LAYOUT_CORRECTION_DELAYS) do
        C_Timer.After(delay, function()
            if serial ~= controller.layoutCorrectionSerial or not IsStartupReady() or not IsEnabled() then return end
            if InCombat() then
                controller.pending = true
                return
            end
            ReanchorEnabledLayout()
        end)
    end
end

local function SyncMinimapVisibility()
    local settings = state:GetSettings()
    settings.minimap = settings.minimap or {}

    if not IsStartupReady() then
        settings.minimap.hide = true
        if type(ns.SetMinimapButtonVisible) == "function" then
            ns.SetMinimapButtonVisible(false)
        end
        return
    end

    settings.minimap.hide = IsEnabled()
    if type(ns.SetMinimapButtonVisible) == "function" then
        ns.SetMinimapButtonVisible(not IsEnabled())
    end
end

function controller:Apply()
    self.layoutCorrectionSerial = self.layoutCorrectionSerial + 1
    local correctionSerial = self.layoutCorrectionSerial

    SyncMinimapVisibility()

    if not IsStartupReady() then
        local button = _G[BUTTON_NAME]
        if button then button:Hide() end
        self.pending = false
        return
    end

    if InCombat() then
        self.pending = true
        return
    end

    self.pending = false
    self.applying = true
    CaptureOriginalLayout()

    if IsEnabled() then
        EnsureEnabledButtonList()
        local button = GetOrCreateButton()
        if button then button:Show() end

        if type(UpdateMicroButtons) == "function" then
            pcall(UpdateMicroButtons)
        end
        ReanchorEnabledLayout()
        ScheduleLayoutCorrections(correctionSerial)
    else
        RestoreOriginalButtonList()
        local button = _G[BUTTON_NAME]
        if button then button:Hide() end

        if type(UpdateMicroButtons) == "function" then
            pcall(UpdateMicroButtons)
        end
        RestoreBlizzardLayout()
    end

    self.applying = false
    self.installed = true
end

function controller:SetEnabled(enabled)
    local settings = state:GetSettings()
    settings.microbutton = enabled and true or false
    settings.minimap = settings.minimap or {}
    settings.minimap.hide = settings.microbutton
    self:Apply()
end

local function HookHelpMicroButton()
    if controller.helpHooked or type(hooksecurefunc) ~= "function" or not HelpMicroButton
        or type(HelpMicroButton.Show) ~= "function" then
        return
    end

    local ok = pcall(hooksecurefunc, HelpMicroButton, "Show", function(self)
        if not IsStartupReady() or not IsEnabled() then return end
        if InCombat() then
            controller.pending = true
            return
        end
        if self and type(self.Hide) == "function" then self:Hide() end
    end)
    if ok then controller.helpHooked = true end
end

local function HookUpdateMicroButtons()
    if controller.updateHooked or type(hooksecurefunc) ~= "function" or type(UpdateMicroButtons) ~= "function" then
        return
    end

    hooksecurefunc("UpdateMicroButtons", function()
        if controller.applying then return end
        if not IsStartupReady() then
            local button = _G[BUTTON_NAME]
            if button then button:Hide() end
            return
        end
        if IsEnabled() then
            ReanchorEnabledLayout()
        else
            RestoreOriginalButtonList()
            local button = _G[BUTTON_NAME]
            if button then button:Hide() end
            RestoreBlizzardLayout()
        end
    end)
    controller.updateHooked = true
end

function ns.ApplyNavigationButtonMode(enabled)
    if enabled ~= nil then
        controller:SetEnabled(enabled)
    else
        controller:Apply()
    end
end

function CA_IsMicrobuttonEnabled()
    return IsEnabled()
end

function CA_ShouldUseMicrobutton()
    return IsEnabled()
end

function CA_InitializeMicrobutton()
    controller:Apply()
end

if type(ns.WhenAddonAndExtensionsReady) == "function" then
    ns.WhenAddonAndExtensionsReady(function()
        controller:Apply()
    end)
end

local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("PLAYER_LOGIN")
eventFrame:RegisterEvent("PLAYER_REGEN_ENABLED")
eventFrame:SetScript("OnEvent", function(_, event)
    if event == "PLAYER_LOGIN" then
        HookUpdateMicroButtons()
        HookHelpMicroButton()
        controller:Apply()
        if C_Timer and type(C_Timer.After) == "function" then
            C_Timer.After(0, function()
                if not InCombat() then controller:Apply() end
            end)
        end
    elseif event == "PLAYER_REGEN_ENABLED" and controller.pending then
        controller:Apply()
    end
end)
