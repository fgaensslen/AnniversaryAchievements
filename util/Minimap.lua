local _, ns = ...
local state = ns.State

local ICON_NAME = "AnniversaryAchievements"
local iconLibrary
local registered = false

local function SetVisible(visible)
    local settings = state:GetSettings()
    settings.minimap = settings.minimap or {}
    settings.minimap.hide = not visible

    if not registered or not iconLibrary then return end
    if visible then
        iconLibrary:Show(ICON_NAME)
    else
        iconLibrary:Hide(ICON_NAME)
    end
end

ns.SetMinimapButtonVisible = SetVisible

SexyLib:Util():AfterLogin(function()
    local LDB = LibStub("LibDataBroker-1.1")
    iconLibrary = LibStub("LibDBIcon-1.0")

    local launcher = LDB:NewDataObject(ICON_NAME, {
        type = "launcher",
        icon = "Interface\\Icons\\Achievement_General",
        OnClick = function(_, mouseButton)
            if mouseButton == "RightButton" then
                if type(ns.OpenAddonOptions) == "function" then
                    ns.OpenAddonOptions()
                end
                return
            end

            if type(AchievementFrame_ToggleAchievementFrame) == "function" then
                AchievementFrame_ToggleAchievementFrame()
            end
        end,
        OnTooltipShow = function(tooltip)
            if type(ns.PopulateNavigationButtonTooltip) == "function" then
                ns.PopulateNavigationButtonTooltip(tooltip)
            else
                tooltip:AddLine("Anniversary Achievements", 1, 1, 1)
            end
        end,
    })

    local settings = state:GetSettings()
    settings.minimap = settings.minimap or {}

    -- Register the launcher while hidden. The selected navigation button is
    -- exposed only after the main addon and all public-API extension batches
    -- have committed their startup registrations.
    settings.minimap.hide = true
    iconLibrary:Register(ICON_NAME, launcher, settings.minimap)
    registered = true
    SetVisible(false)

    if type(ns.WhenAddonAndExtensionsReady) == "function" then
        ns.WhenAddonAndExtensionsReady(function()
            SetVisible(state:GetSettings().microbutton == false)
        end)
    end
end)
