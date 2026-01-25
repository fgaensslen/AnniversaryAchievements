local addon = 'Anniversary Achievements'
local loc = SexyLib:Localization(addon)
CA_Flags = CA_Flags or 0

SexyLib:InitLogger(addon, '&6')

-- Reload tracking
CA_ReloadRequired = false
CA_OriginalSettings = {}

local function CA_UpdateReloadState()
    CA_ReloadRequired =
        CA_Settings.microbutton   ~= CA_OriginalSettings.microbutton or
        CA_Settings.trackerToggle ~= CA_OriginalSettings.trackerToggle
end

local options = {
    type = 'group',
    args = {
        enableSharing = {
            name = loc:Get('OPTION_SHARING'),
            desc = loc:Get('OPTION_SHARING_DESC'),
            type = 'toggle',
            width = 2,
            set = function(info, val)
                CA_Settings.sharing = val
            end,
            get = function(info)
                return CA_Settings.sharing
            end,
            order = 1
        },

        enableMicrobutton = {
            name = loc:Get('OPTION_MICROBUTTON'),
            desc = loc:Get('OPTION_MICROBUTTON_DESC'),
            type = 'toggle',
            width = 2,
            set = function(info, val)
                if CA_IsMicrobuttonForcedOff() then
                    return
                end
                CA_Settings.microbutton = val
                CA_UpdateReloadState()
            end,
            get = function(info)
                return CA_ShouldUseMicrobutton()
            end,
            disabled = function()
                return CA_IsMicrobuttonForcedOff()
            end,
            order = 2
        },

        enableTracker = {
            name = loc:Get('OPTION_TRACKER'),
            desc = loc:Get('OPTION_TRACKER_DESC'),
            type = 'toggle',
            width = 2,
            set = function(info, val)
                CA_Settings.trackerToggle = val
                CA_UpdateReloadState()
            end,
            get = function(info)
                return CA_IsTrackerEnabled()
            end,
            order = 3
        },

        spacerBeforeUpdate = {
            type = "description",
            name = "",
            width = 1,
            order = 3.5
        },

        updateMapExploration = {
            name = loc:Get('OPTION_UPDATE_MAP_EXPLORATION'),
            desc = loc:Get('OPTION_UPDATE_MAP_EXPLORATION_DESC'),
            type = 'execute',
            width = 1.5,
            func = function()
                CA_UpdateExploredAreas()
            end,
            order = 4
        },

        spacerResetButton = {
            type = 'description',
            name = ' ',
            fontSize = 'large',
            order = 4.5
        },

        resetAchievements = {
            name = loc:Get('OPTION_RESET_ACHIEVEMENTS'),
            desc = loc:Get('OPTION_RESET_ACHIEVEMENTS_DESC'),
            type = 'execute',
            width = 1.5,
            func = function()
                CA_CompletionManager:GetLocal():Reset()
                CA_performInitialCheck()
            end,
            order = 5
        },

        -- ===== Reload UI Section =====

        reloadSpacer = {
            type = "description",
            name = " ",
            order = 90
        },

        reloadWarning = {
            type = "description",
            name = "|cffff2020" .. loc:Get('OPTION_RELOAD') .. "|r",
            fontSize = "medium",
            order = 91,
            hidden = function()
                return not CA_ReloadRequired
            end
        },

        reloadButton = {
            type = "execute",
            name = "Reload",
            width = 1,
            order = 92,
            func = function()
                ReloadUI()
            end,
            hidden = function()
                return not CA_ReloadRequired
            end,
            disabled = function()
                return InCombatLockdown()
            end
        }
    }
}

LibStub("AceConfig-3.0"):RegisterOptionsTable(addon, options)
LibStub("AceConfigDialog-3.0"):AddToBlizOptions(addon)

SexyLib:Util():AfterLogin(function()
    if not CA_Settings then
        CA_Settings = {}
    end
    if CA_Settings.sharing == nil then CA_Settings.sharing = false end
    if CA_Settings.microbutton == nil then CA_Settings.microbutton = true end
    if CA_Settings.trackerToggle == nil then CA_Settings.trackerToggle = true end

    -- Snapshot originals
    CA_OriginalSettings.microbutton   = CA_Settings.microbutton
    CA_OriginalSettings.trackerToggle = CA_Settings.trackerToggle

    CA_ReloadRequired = false
end)

C_Timer.After(2, function()
    -- CA_Flags:
    -- 0x01: First login with addon installed
    -- 0x02: First login into TBCC with addon installed
    -- 0x04: PvP achievements update
    CA_Flags = bit.bor(CA_Flags, 1)

    if bit.band(CA_Flags, 2) == 0 then
        CA_Flags = bit.bor(CA_Flags, 2)
        CA_Flags = bit.bor(CA_Flags, 4)

        local cmanager = CA_CompletionManager:GetLocal()
        cmanager:TakeIncompleteAchievements()
        cmanager:UpdateNewCriteriasOfOldType()

    elseif bit.band(CA_Flags, 4) == 0 then
        CA_Flags = bit.bor(CA_Flags, 4)

        local cmanager = CA_CompletionManager:GetLocal()
        cmanager:TakeIncompleteAchievements()
    end
end)

function CA_IsSharingAchievementsInChat()
    return CA_Settings.sharing and bit.band(CA_Flags, 1) == 1
end

function CA_IsMicrobuttonEnabled()
    if CA_Settings.microbutton == nil then
        CA_Settings.microbutton = true
    end
    return CA_Settings.microbutton
end

function CA_IsTrackerEnabled()
    return CA_Settings.trackerToggle
end