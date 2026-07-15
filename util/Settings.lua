local _, ns = ...

local addon = 'Anniversary Achievements'
local loc = SexyLib:Localization(addon)
local state = ns.State

SexyLib:InitLogger(addon, '&6')

local function IsSharingAchievementsInChat()
    local settings = state:GetSettings()
    return settings.sharing and bit.band(state:GetFlags(), 1) == 1
end

local function IsTrackerEnabled()
    return state:GetSettings().trackerToggle
end

ns.IsSharingAchievementsInChat = IsSharingAchievementsInChat
ns.IsTrackerEnabled = IsTrackerEnabled

local MAIN_ADDON_FOLDER = "AnniversaryAchievements"
local MAIN_ADDON_NAME = "Anniversary Achievements"
local MAIN_ADDON_VERSION = "v2.3.39"
local MAIN_ADDON_AUTHOR = "BearCraftStudios"

local function GetMainAddonMetadata(field, fallback)
    if type(GetAddOnMetadata) == "function" then
        local value = GetAddOnMetadata(MAIN_ADDON_FOLDER, field)
        if type(value) == "string" and value ~= "" then
            return value
        end
    end
    return fallback
end

local RESET_ACHIEVEMENTS_POPUP = "ANNIVERSARY_ACHIEVEMENTS_CONFIRM_RESET"

local function ResetAchievementsForCurrentCharacter()
    ns.CompletionManager:GetLocal():Reset()
    ns.PerformInitialCheck()
end

StaticPopupDialogs[RESET_ACHIEVEMENTS_POPUP] = {
    text = loc:Get('OPTION_RESET_ACHIEVEMENTS_CONFIRM'),
    button1 = YES,
    button2 = NO,
    OnAccept = ResetAchievementsForCurrentCharacter,
    timeout = 0,
    whileDead = true,
    hideOnEscape = true,
    preferredIndex = 3,
}

local function AddListHeaders(args)
    args.headerName = {
        type = "description",
        name = "|cffffd100" .. loc:Get('OPTION_MODULE_NAME') .. "|r",
        width = 1.45,
        order = 1,
    }
    args.headerVersion = {
        type = "description",
        name = "|cffffd100" .. loc:Get('OPTION_MODULE_VERSION') .. "|r",
        width = 0.65,
        order = 2,
    }
    args.headerAuthor = {
        type = "description",
        name = "|cffffd100" .. loc:Get('OPTION_MODULE_AUTHOR') .. "|r",
        width = 0.90,
        order = 3,
    }
end

local function BuildAddonListOptions()
    local args = {}
    AddListHeaders(args)

    args.mainAddonName = {
        type = "description",
        name = GetMainAddonMetadata("Title", MAIN_ADDON_NAME),
        width = 1.45,
        order = 10,
    }
    args.mainAddonVersion = {
        type = "description",
        name = GetMainAddonMetadata("Version", MAIN_ADDON_VERSION),
        width = 0.65,
        order = 11,
    }
    args.mainAddonAuthor = {
        type = "description",
        name = GetMainAddonMetadata("Author", MAIN_ADDON_AUTHOR),
        width = 0.90,
        order = 12,
    }

    return args
end

local function BuildModuleListOptions()
    local args = {}
    AddListHeaders(args)

    local publicAPI = ns.PublicAPI or rawget(_G, "AnniversaryAchievementsAPI")
    local modules = publicAPI and publicAPI:GetRegisteredModules() or {}
    table.sort(modules, function(left, right)
        local leftName = tostring(left.name or left.id):lower()
        local rightName = tostring(right.name or right.id):lower()
        if leftName ~= rightName then return leftName < rightName end
        return tostring(left.id) < tostring(right.id)
    end)

    if #modules == 0 then
        args.empty = {
            type = "description",
            name = "|cffaaaaaa" .. loc:Get('OPTION_MODULES_EMPTY') .. "|r",
            width = "full",
            order = 10,
        }
        return args
    end

    local order = 10
    for index, moduleInfo in ipairs(modules) do
        local prefix = "module" .. index
        args[prefix .. "Name"] = {
            type = "description",
            name = tostring(moduleInfo.name or moduleInfo.id),
            width = 1.45,
            order = order,
        }
        args[prefix .. "Version"] = {
            type = "description",
            name = tostring(moduleInfo.version or "-"),
            width = 0.65,
            order = order + 1,
        }
        args[prefix .. "Author"] = {
            type = "description",
            name = tostring(moduleInfo.author or "-"),
            width = 0.90,
            order = order + 2,
        }
        order = order + 10
    end
    return args
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
                state:GetSettings().sharing = val
            end,
            get = function(info)
                return state:GetSettings().sharing
            end,
            order = 1
        },

        enableMicrobutton = {
            name = loc:Get('OPTION_MICROBUTTON'),
            desc = loc:Get('OPTION_MICROBUTTON_DESC'),
            type = 'toggle',
            width = 2,
            set = function(info, val)
                local settings = state:GetSettings()
                settings.microbutton = val and true or false
                settings.minimap = settings.minimap or {}
                settings.minimap.hide = settings.microbutton
                if type(ns.ApplyNavigationButtonMode) == 'function' then
                    ns.ApplyNavigationButtonMode(settings.microbutton)
                end
            end,
            get = function(info)
                return state:GetSettings().microbutton ~= false
            end,
            order = 2
        },

        enableTracker = {
            name = loc:Get('OPTION_TRACKER'),
            desc = loc:Get('OPTION_TRACKER_DESC'),
            type = 'toggle',
            width = 2,
            set = function(info, val)
                local enabled = val and true or false
                state:GetSettings().trackerToggle = enabled
                if type(ns.ApplyTrackerMode) == "function" then
                    ns.ApplyTrackerMode(enabled)
                end
            end,
            get = function(info)
                return IsTrackerEnabled()
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
                ns.UpdateExploredAreas()
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
                StaticPopup_Show(RESET_ACHIEVEMENTS_POPUP)
            end,
            order = 5
        },

        addonSectionSpacer = {
            type = "description",
            name = " ",
            order = 79,
        },

        -- These groups stay inline. AceConfigDialog therefore wraps the root
        -- options page in its ScrollFrame whenever the content exceeds the panel.
        addonSection = {
            type = "group",
            name = loc:Get('OPTION_ADDON'),
            inline = true,
            order = 80,
            args = BuildAddonListOptions(),
        },

        moduleSectionSpacer = {
            type = "description",
            name = " ",
            order = 81,
        },

        modulesSection = {
            type = "group",
            name = loc:Get('OPTION_MODULES'),
            inline = true,
            order = 82,
            args = BuildModuleListOptions(),
        },

    }
}

local function RefreshModuleSettings()
    options.args.modulesSection.args = BuildModuleListOptions()
    local registry = LibStub("AceConfigRegistry-3.0", true)
    if registry then registry:NotifyChange(addon) end
end

ns.RefreshModuleSettings = RefreshModuleSettings

LibStub("AceConfig-3.0"):RegisterOptionsTable(addon, options)
LibStub("AceConfigDialog-3.0"):AddToBlizOptions(addon)

SexyLib:Util():AfterLogin(function()
    state:EnsureInitialized()
end)

C_Timer.After(2, function()
    -- CA_Flags:
    -- 0x01: First login with addon installed
    -- 0x02: First login into TBCC with addon installed
    -- 0x04: PvP achievements update
    local flags = bit.bor(state:GetFlags(), 1)

    if bit.band(flags, 2) == 0 then
        flags = bit.bor(flags, 2)
        flags = bit.bor(flags, 4)
        state:SetFlags(flags)

        local cmanager = ns.CompletionManager:GetLocal()
        cmanager:TakeIncompleteAchievements()
        cmanager:UpdateNewCriteriasOfOldType()

    elseif bit.band(flags, 4) == 0 then
        flags = bit.bor(flags, 4)
        state:SetFlags(flags)

        local cmanager = ns.CompletionManager:GetLocal()
        cmanager:TakeIncompleteAchievements()
    else
        state:SetFlags(flags)
    end
end)
