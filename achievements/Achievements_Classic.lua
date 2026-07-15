local _, ns = ...

-- Generated flavor catalog for AnniversaryAchievements v2.3.46.
-- This file contains only definitions used by this client flavor. Stable IDs
-- keep Classic v1.4.6 and all existing TBC SavedVariables fully compatible.

local db = ns.Database
local criterias = ns.Criterias
local TYPE = criterias.TYPE
local loc = SexyLib:Localization("Anniversary Achievements")
local factionKey = UnitFactionGroup("player") == "Horde" and "H" or "A"
local _, classKey = UnitClass("player")
local selector = factionKey .. ":" .. tostring(classKey or "WARRIOR")

local areaTableLocale = ns.AreaTableLocale

local separator = "."

local function FormatNumbersInString(text)
    if GetLocale() ~= "deDE" then return text end
    return text:gsub("%d+", function(num)
        local left, digits = num:match("^(%d)(%d+)$")
        if not digits then return num end
        return left .. digits:reverse():gsub("(%d%d%d)", "%1" .. separator):reverse()
    end)
end

local function Text(value)
    local valueType = type(value)
    if valueType == "nil" then return "" end
    if valueType == "number" then return tostring(value) end
    if valueType == "string" then
        if value == "" then return "" end
        if loc:IsPresent(value) then return loc:Get(value) end
        return value
    end
    if valueType ~= "table" then return tostring(value) end

    if value.numberFormat ~= nil then
        return FormatNumbersInString(Text(value.numberFormat))
    end
    if value.key then
        local args = {}
        for index, argument in ipairs(value.args or {}) do args[index] = Text(argument) end
        return loc:Get(value.key, unpack(args))
    end
    if value.areaID then
        return areaTableLocale[value.areaID] or ""
    end
    if value.itemID then
        return "__ITEM_" .. tostring(value.itemID) .. "__"
    end
    if value.concat then
        local result = ""
        for _, part in ipairs(value.concat) do result = result .. Text(part) end
        return result
    end
    if value.literal ~= nil then return tostring(value.literal) end
    return ""
end

local function SelectDefinition(entry)
    if not entry or not entry.variants then return entry end
    local index = entry.selectors[selector] or 1
    return entry.variants[index]
end

local function ResolveItemText(template, callback)
    if type(template) ~= "string" or not template:find("__ITEM_", 1, true) then
        callback(template or "")
        return
    end

    local itemIDs = {}
    for itemID in template:gmatch("__ITEM_(%d+)__") do itemIDs[tonumber(itemID)] = true end

    local function render()
        return (template:gsub("__ITEM_(%d+)__", function(itemID)
            itemID = tonumber(itemID)
            return GetItemInfo(itemID) or loc:Get("ITEM_FALLBACK", itemID)
        end))
    end

    callback(render())
    if not Item or not Item.CreateFromItemID then return end
    for itemID in pairs(itemIDs) do
        local item = Item:CreateFromItemID(itemID)
        item:ContinueOnItemLoad(function() callback(render()) end)
    end
end

local function BuildCriteria(definition)
    local data = definition.data
    if definition.type == TYPE.OR then
        data = {}
        for _, subDefinition in ipairs(definition.data or {}) do
            data[#data + 1] = BuildCriteria(subDefinition)
        end
    end

    local criteriaName = Text(definition.name)
    local criteria = criterias:Create(criteriaName, definition.type, data, definition.quantity, definition.id)
    if definition.coinFormatter then
        criteria:SetQuantityFormatter(function(current, required)
            return GetCoinTextureString(current) .. " / " .. GetCoinTextureString(required)
        end)
    end
    -- Generated catalogs historically use an empty label for internal text
    -- criteria. Such rows rendered as a lone "-". Keep the criterion active
    -- for triggering/completion, but suppress only its standard UI row.
    local hasProgressBar = tonumber(definition.quantity) and tonumber(definition.quantity) > 0
    if definition.hidden == true or (criteriaName == "" and not hasProgressBar) then
        criteria:SetHidden(true)
    end
    ResolveItemText(criteriaName, function(value) criteria.name = value end)
    return criteria
end


-- Shared Classic catalog. TBC loads this file first and applies only its delta.
local DEFINITION_ACHIEVEMENT_COUNTER = 515
local DEFINITION_CATEGORY_COUNTER = 35
local DEFINITION_CRITERIA_COUNTER = 2057

local categoryDefinitions = {
    [1] = {
        ["id"] = 1,
        ["isFeats"] = false,
        ["name"] = "CATEGORY_GENERAL",
        ["parentID"] = -1,
        ["tabID"] = 1,
    },
    [2] = {
        ["id"] = 2,
        ["isFeats"] = false,
        ["name"] = "CATEGORY_QUESTS",
        ["parentID"] = -1,
        ["tabID"] = 1,
    },
    [3] = {
        ["id"] = 3,
        ["isFeats"] = false,
        ["name"] = "CATEGORY_EASTERN_KINGDOMS",
        ["parentID"] = 2,
        ["tabID"] = 1,
    },
    [4] = {
        ["id"] = 4,
        ["isFeats"] = false,
        ["name"] = "CATEGORY_KALIMDOR",
        ["parentID"] = 2,
        ["tabID"] = 1,
    },
    [6] = {
        ["id"] = 6,
        ["isFeats"] = false,
        ["name"] = "CATEGORY_EXPLORATION",
        ["parentID"] = -1,
        ["tabID"] = 1,
    },
    [7] = {
        ["id"] = 7,
        ["isFeats"] = false,
        ["name"] = "CATEGORY_EASTERN_KINGDOMS",
        ["parentID"] = 6,
        ["tabID"] = 1,
    },
    [8] = {
        ["id"] = 8,
        ["isFeats"] = false,
        ["name"] = "CATEGORY_KALIMDOR",
        ["parentID"] = 6,
        ["tabID"] = 1,
    },
    [10] = {
        ["id"] = 10,
        ["isFeats"] = false,
        ["name"] = "CATEGORY_PVP",
        ["parentID"] = -1,
        ["tabID"] = 1,
    },
    [11] = {
        ["id"] = 11,
        ["isFeats"] = false,
        ["name"] = "CATEGORY_BG_WARSONG",
        ["parentID"] = 10,
        ["tabID"] = 1,
    },
    [12] = {
        ["id"] = 12,
        ["isFeats"] = false,
        ["name"] = "CATEGORY_BG_ARATHI",
        ["parentID"] = 10,
        ["tabID"] = 1,
    },
    [14] = {
        ["id"] = 14,
        ["isFeats"] = false,
        ["name"] = "CATEGORY_BG_ALTERAC",
        ["parentID"] = 10,
        ["tabID"] = 1,
    },
    [16] = {
        ["id"] = 16,
        ["isFeats"] = false,
        ["name"] = "CATEGORY_PVE",
        ["parentID"] = -1,
        ["tabID"] = 1,
    },
    [17] = {
        ["id"] = 17,
        ["isFeats"] = false,
        ["name"] = "CATEGORY_VANILLA",
        ["parentID"] = 16,
        ["tabID"] = 1,
    },
    [19] = {
        ["id"] = 19,
        ["isFeats"] = false,
        ["name"] = "CATEGORY_PROFESSIONS",
        ["parentID"] = -1,
        ["tabID"] = 1,
    },
    [20] = {
        ["id"] = 20,
        ["isFeats"] = false,
        ["name"] = "PROF_COOKING",
        ["parentID"] = 19,
        ["tabID"] = 1,
    },
    [21] = {
        ["id"] = 21,
        ["isFeats"] = false,
        ["name"] = "PROF_FISHING",
        ["parentID"] = 19,
        ["tabID"] = 1,
    },
    [22] = {
        ["id"] = 22,
        ["isFeats"] = false,
        ["name"] = "PROF_FIRST_AID",
        ["parentID"] = 19,
        ["tabID"] = 1,
    },
    [23] = {
        ["id"] = 23,
        ["isFeats"] = false,
        ["name"] = "CATEGORY_REPUTATION",
        ["parentID"] = -1,
        ["tabID"] = 1,
    },
    [24] = {
        ["id"] = 24,
        ["isFeats"] = false,
        ["name"] = "CATEGORY_VANILLA",
        ["parentID"] = 23,
        ["tabID"] = 1,
    },
    [26] = {
        ["id"] = 26,
        ["isFeats"] = false,
        ["name"] = "CATEGORY_EVENTS",
        ["parentID"] = -1,
        ["tabID"] = 1,
    },
    [27] = {
        ["id"] = 27,
        ["isFeats"] = false,
        ["name"] = "CATEGORY_LUNAR",
        ["parentID"] = 26,
        ["tabID"] = 1,
    },
    [28] = {
        ["id"] = 28,
        ["isFeats"] = false,
        ["name"] = "CATEGORY_VALENTINES",
        ["parentID"] = 26,
        ["tabID"] = 1,
    },
    [29] = {
        ["id"] = 29,
        ["isFeats"] = false,
        ["name"] = "CATEGORY_NOBLEGARDEN",
        ["parentID"] = 26,
        ["tabID"] = 1,
    },
    [30] = {
        ["id"] = 30,
        ["isFeats"] = false,
        ["name"] = "CATEGORY_CHILDREN",
        ["parentID"] = 26,
        ["tabID"] = 1,
    },
    [31] = {
        ["id"] = 31,
        ["isFeats"] = false,
        ["name"] = "CATEGORY_MIDSUMMER",
        ["parentID"] = 26,
        ["tabID"] = 1,
    },
    [33] = {
        ["id"] = 33,
        ["isFeats"] = false,
        ["name"] = "CATEGORY_HALLOWSEND",
        ["parentID"] = 26,
        ["tabID"] = 1,
    },
    [34] = {
        ["id"] = 34,
        ["isFeats"] = false,
        ["name"] = "CATEGORY_WINTERVEIL",
        ["parentID"] = 26,
        ["tabID"] = 1,
    },
    [35] = {
        ["id"] = 35,
        ["isFeats"] = true,
        ["name"] = "CATEGORY_FEATS_OF_STRENGTH",
        ["parentID"] = -1,
        ["tabID"] = 1,
    },
}

local achievementDefinitions = {
    [1] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 1,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 10,
                },
                ["id"] = 1,
                ["name"] = "",
                ["type"] = 19,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 10,
            },
            ["key"] = "AD_LVL",
        },
        ["icon"] = "level_10",
        ["id"] = 1,
        ["name"] = {
            ["args"] = {
                [1] = 10,
            },
            ["key"] = "AN_LVL",
        },
        ["nextID"] = 2,
        ["points"] = 10,
    },
    [2] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 1,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 20,
                },
                ["id"] = 2,
                ["name"] = "",
                ["type"] = 19,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 20,
            },
            ["key"] = "AD_LVL",
        },
        ["icon"] = "level_20",
        ["id"] = 2,
        ["name"] = {
            ["args"] = {
                [1] = 20,
            },
            ["key"] = "AN_LVL",
        },
        ["nextID"] = 3,
        ["points"] = 10,
        ["previousID"] = 1,
    },
    [3] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 1,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 30,
                },
                ["id"] = 3,
                ["name"] = "",
                ["type"] = 19,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 30,
            },
            ["key"] = "AD_LVL",
        },
        ["icon"] = "level_30",
        ["id"] = 3,
        ["name"] = {
            ["args"] = {
                [1] = 30,
            },
            ["key"] = "AN_LVL",
        },
        ["nextID"] = 4,
        ["points"] = 10,
        ["previousID"] = 2,
    },
    [4] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 1,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 40,
                },
                ["id"] = 4,
                ["name"] = "",
                ["type"] = 19,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 40,
            },
            ["key"] = "AD_LVL",
        },
        ["icon"] = "level_40",
        ["id"] = 4,
        ["name"] = {
            ["args"] = {
                [1] = 40,
            },
            ["key"] = "AN_LVL",
        },
        ["nextID"] = 5,
        ["points"] = 10,
        ["previousID"] = 3,
    },
    [5] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 1,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 50,
                },
                ["id"] = 5,
                ["name"] = "",
                ["type"] = 19,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 50,
            },
            ["key"] = "AD_LVL",
        },
        ["icon"] = "level_50",
        ["id"] = 5,
        ["name"] = {
            ["args"] = {
                [1] = 50,
            },
            ["key"] = "AN_LVL",
        },
        ["nextID"] = 6,
        ["points"] = 10,
        ["previousID"] = 4,
    },
    [6] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 1,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 60,
                },
                ["id"] = 6,
                ["name"] = "",
                ["type"] = 19,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 60,
            },
            ["key"] = "AD_LVL",
        },
        ["icon"] = "level_60",
        ["id"] = 6,
        ["name"] = {
            ["args"] = {
                [1] = 60,
            },
            ["key"] = "AN_LVL",
        },
        ["points"] = 10,
        ["previousID"] = 5,
    },
    [8] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 1,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {},
                ["id"] = 8,
                ["name"] = "AC_BANK",
                ["quantity"] = 6,
                ["type"] = 21,
            },
        },
        ["description"] = "AD_BANK",
        ["icon"] = "-inv_box_01",
        ["id"] = 8,
        ["name"] = "AN_BANK",
        ["points"] = 10,
    },
    [9] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 1,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {},
                ["id"] = 9,
                ["name"] = {
                    ["args"] = {
                        [1] = 100,
                    },
                    ["key"] = "AC_MOB_KILLS",
                },
                ["quantity"] = 100,
                ["type"] = 48,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 100,
            },
            ["key"] = "AD_MOB_KILLS",
        },
        ["icon"] = "-inv_misc_monsterclaw_02",
        ["id"] = 9,
        ["name"] = "AN_MOB_KILLS_1",
        ["nextID"] = 10,
        ["points"] = 10,
    },
    [10] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 1,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {},
                ["id"] = 10,
                ["name"] = {
                    ["numberFormat"] = {
                        ["args"] = {
                            [1] = 1000,
                        },
                        ["key"] = "AC_MOB_KILLS",
                    },
                },
                ["quantity"] = 1000,
                ["type"] = 48,
            },
        },
        ["description"] = {
            ["numberFormat"] = {
                ["args"] = {
                    [1] = 1000,
                },
                ["key"] = "AD_MOB_KILLS",
            },
        },
        ["icon"] = "-inv_misc_monsterclaw_02",
        ["id"] = 10,
        ["name"] = "AN_MOB_KILLS_2",
        ["nextID"] = 11,
        ["points"] = 10,
        ["previousID"] = 9,
    },
    [11] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 1,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {},
                ["id"] = 11,
                ["name"] = {
                    ["numberFormat"] = {
                        ["args"] = {
                            [1] = 5000,
                        },
                        ["key"] = "AC_MOB_KILLS",
                    },
                },
                ["quantity"] = 5000,
                ["type"] = 48,
            },
        },
        ["description"] = {
            ["numberFormat"] = {
                ["args"] = {
                    [1] = 5000,
                },
                ["key"] = "AD_MOB_KILLS",
            },
        },
        ["icon"] = "-inv_misc_monsterclaw_02",
        ["id"] = 11,
        ["name"] = "AN_MOB_KILLS_3",
        ["nextID"] = 12,
        ["points"] = 10,
        ["previousID"] = 10,
    },
    [12] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 1,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {},
                ["id"] = 12,
                ["name"] = {
                    ["numberFormat"] = {
                        ["args"] = {
                            [1] = 10000,
                        },
                        ["key"] = "AC_MOB_KILLS",
                    },
                },
                ["quantity"] = 10000,
                ["type"] = 48,
            },
        },
        ["description"] = {
            ["numberFormat"] = {
                ["args"] = {
                    [1] = 10000,
                },
                ["key"] = "AD_MOB_KILLS",
            },
        },
        ["icon"] = "-inv_misc_monsterclaw_02",
        ["id"] = 12,
        ["name"] = "AN_MOB_KILLS_4",
        ["nextID"] = 13,
        ["points"] = 10,
        ["previousID"] = 11,
    },
    [13] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 1,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {},
                ["id"] = 13,
                ["name"] = {
                    ["numberFormat"] = {
                        ["args"] = {
                            [1] = 25000,
                        },
                        ["key"] = "AC_MOB_KILLS",
                    },
                },
                ["quantity"] = 25000,
                ["type"] = 48,
            },
        },
        ["description"] = {
            ["numberFormat"] = {
                ["args"] = {
                    [1] = 25000,
                },
                ["key"] = "AD_MOB_KILLS",
            },
        },
        ["icon"] = "-inv_misc_monsterclaw_02",
        ["id"] = 13,
        ["name"] = "AN_MOB_KILLS_5",
        ["nextID"] = 14,
        ["points"] = 10,
        ["previousID"] = 12,
    },
    [14] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 1,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {},
                ["id"] = 14,
                ["name"] = {
                    ["numberFormat"] = {
                        ["args"] = {
                            [1] = 50000,
                        },
                        ["key"] = "AC_MOB_KILLS",
                    },
                },
                ["quantity"] = 50000,
                ["type"] = 48,
            },
        },
        ["description"] = {
            ["numberFormat"] = {
                ["args"] = {
                    [1] = 50000,
                },
                ["key"] = "AD_MOB_KILLS",
            },
        },
        ["icon"] = "-inv_misc_monsterclaw_02",
        ["id"] = 14,
        ["name"] = "AN_MOB_KILLS_6",
        ["nextID"] = 15,
        ["points"] = 10,
        ["previousID"] = 13,
    },
    [15] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 1,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {},
                ["id"] = 15,
                ["name"] = {
                    ["numberFormat"] = {
                        ["args"] = {
                            [1] = 100000,
                        },
                        ["key"] = "AC_MOB_KILLS",
                    },
                },
                ["quantity"] = 100000,
                ["type"] = 48,
            },
        },
        ["description"] = {
            ["numberFormat"] = {
                ["args"] = {
                    [1] = 100000,
                },
                ["key"] = "AD_MOB_KILLS",
            },
        },
        ["icon"] = "-inv_misc_monsterclaw_02",
        ["id"] = 15,
        ["name"] = "AN_MOB_KILLS_7",
        ["points"] = 10,
        ["previousID"] = 14,
    },
    [16] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 1,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 13,
                    [2] = 300,
                },
                ["id"] = 16,
                ["name"] = "",
                ["type"] = 12,
            },
        },
        ["description"] = "AD_UNARMED_SKILL",
        ["icon"] = "-ability_warrior_secondwind",
        ["id"] = 16,
        ["name"] = "AN_UNARMED_SKILL",
        ["points"] = 10,
    },
    [17] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 1,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1,
                    [2] = 2,
                },
                ["id"] = 17,
                ["name"] = "GEAR_SLOT_HEAD",
                ["type"] = 27,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 2,
                    [2] = 2,
                },
                ["id"] = 18,
                ["name"] = "GEAR_SLOT_NECK",
                ["type"] = 27,
            },
            [3] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 3,
                    [2] = 2,
                },
                ["id"] = 19,
                ["name"] = "GEAR_SLOT_SHOULDER",
                ["type"] = 27,
            },
            [4] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 4,
                    [2] = 2,
                },
                ["id"] = 20,
                ["name"] = "GEAR_SLOT_CHEST",
                ["type"] = 27,
            },
            [5] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 5,
                    [2] = 2,
                },
                ["id"] = 21,
                ["name"] = "GEAR_SLOT_WAIST",
                ["type"] = 27,
            },
            [6] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 6,
                    [2] = 2,
                },
                ["id"] = 22,
                ["name"] = "GEAR_SLOT_LEGS",
                ["type"] = 27,
            },
            [7] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 7,
                    [2] = 2,
                },
                ["id"] = 23,
                ["name"] = "GEAR_SLOT_FEET",
                ["type"] = 27,
            },
            [8] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 8,
                    [2] = 2,
                },
                ["id"] = 24,
                ["name"] = "GEAR_SLOT_WRIST",
                ["type"] = 27,
            },
            [9] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 9,
                    [2] = 2,
                },
                ["id"] = 25,
                ["name"] = "GEAR_SLOT_HANDS",
                ["type"] = 27,
            },
            [10] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 10,
                    [2] = 2,
                },
                ["id"] = 26,
                ["name"] = "GEAR_SLOT_FIRST_RING",
                ["type"] = 27,
            },
            [11] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 11,
                    [2] = 2,
                },
                ["id"] = 27,
                ["name"] = "GEAR_SLOT_SECOND_RING",
                ["type"] = 27,
            },
            [12] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 12,
                    [2] = 2,
                },
                ["id"] = 28,
                ["name"] = "GEAR_SLOT_FIRST_TRINKET",
                ["type"] = 27,
            },
            [13] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 13,
                    [2] = 2,
                },
                ["id"] = 29,
                ["name"] = "GEAR_SLOT_SECOND_TRINKET",
                ["type"] = 27,
            },
            [14] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 14,
                    [2] = 2,
                },
                ["id"] = 30,
                ["name"] = "GEAR_SLOT_CLOAK",
                ["type"] = 27,
            },
            [15] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 15,
                    [2] = 2,
                },
                ["id"] = 31,
                ["name"] = "GEAR_SLOT_WEAPON",
                ["type"] = 27,
            },
        },
        ["description"] = "AD_UNCOMMON_GEAR",
        ["icon"] = "-Inv_Enchant_EssenceNetherSmall",
        ["id"] = 17,
        ["name"] = "AN_UNCOMMON_GEAR",
        ["nextID"] = 18,
        ["points"] = 10,
    },
    [18] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 1,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1,
                    [2] = 3,
                },
                ["id"] = 32,
                ["name"] = "GEAR_SLOT_HEAD",
                ["type"] = 27,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 2,
                    [2] = 3,
                },
                ["id"] = 33,
                ["name"] = "GEAR_SLOT_NECK",
                ["type"] = 27,
            },
            [3] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 3,
                    [2] = 3,
                },
                ["id"] = 34,
                ["name"] = "GEAR_SLOT_SHOULDER",
                ["type"] = 27,
            },
            [4] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 4,
                    [2] = 3,
                },
                ["id"] = 35,
                ["name"] = "GEAR_SLOT_CHEST",
                ["type"] = 27,
            },
            [5] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 5,
                    [2] = 3,
                },
                ["id"] = 36,
                ["name"] = "GEAR_SLOT_WAIST",
                ["type"] = 27,
            },
            [6] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 6,
                    [2] = 3,
                },
                ["id"] = 37,
                ["name"] = "GEAR_SLOT_LEGS",
                ["type"] = 27,
            },
            [7] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 7,
                    [2] = 3,
                },
                ["id"] = 38,
                ["name"] = "GEAR_SLOT_FEET",
                ["type"] = 27,
            },
            [8] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 8,
                    [2] = 3,
                },
                ["id"] = 39,
                ["name"] = "GEAR_SLOT_WRIST",
                ["type"] = 27,
            },
            [9] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 9,
                    [2] = 3,
                },
                ["id"] = 40,
                ["name"] = "GEAR_SLOT_HANDS",
                ["type"] = 27,
            },
            [10] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 10,
                    [2] = 3,
                },
                ["id"] = 41,
                ["name"] = "GEAR_SLOT_FIRST_RING",
                ["type"] = 27,
            },
            [11] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 11,
                    [2] = 3,
                },
                ["id"] = 42,
                ["name"] = "GEAR_SLOT_SECOND_RING",
                ["type"] = 27,
            },
            [12] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 12,
                    [2] = 3,
                },
                ["id"] = 43,
                ["name"] = "GEAR_SLOT_FIRST_TRINKET",
                ["type"] = 27,
            },
            [13] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 13,
                    [2] = 3,
                },
                ["id"] = 44,
                ["name"] = "GEAR_SLOT_SECOND_TRINKET",
                ["type"] = 27,
            },
            [14] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 14,
                    [2] = 3,
                },
                ["id"] = 45,
                ["name"] = "GEAR_SLOT_CLOAK",
                ["type"] = 27,
            },
            [15] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 15,
                    [2] = 3,
                },
                ["id"] = 46,
                ["name"] = "GEAR_SLOT_WEAPON",
                ["type"] = 27,
            },
        },
        ["description"] = "AD_RARE_GEAR",
        ["icon"] = "-Spell_Frost_WizardMark",
        ["id"] = 18,
        ["name"] = "AN_RARE_GEAR",
        ["nextID"] = 19,
        ["points"] = 10,
        ["previousID"] = 17,
    },
    [19] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 1,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1,
                    [2] = 4,
                },
                ["id"] = 47,
                ["name"] = "GEAR_SLOT_HEAD",
                ["type"] = 27,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 2,
                    [2] = 4,
                },
                ["id"] = 48,
                ["name"] = "GEAR_SLOT_NECK",
                ["type"] = 27,
            },
            [3] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 3,
                    [2] = 4,
                },
                ["id"] = 49,
                ["name"] = "GEAR_SLOT_SHOULDER",
                ["type"] = 27,
            },
            [4] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 4,
                    [2] = 4,
                },
                ["id"] = 50,
                ["name"] = "GEAR_SLOT_CHEST",
                ["type"] = 27,
            },
            [5] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 5,
                    [2] = 4,
                },
                ["id"] = 51,
                ["name"] = "GEAR_SLOT_WAIST",
                ["type"] = 27,
            },
            [6] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 6,
                    [2] = 4,
                },
                ["id"] = 52,
                ["name"] = "GEAR_SLOT_LEGS",
                ["type"] = 27,
            },
            [7] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 7,
                    [2] = 4,
                },
                ["id"] = 53,
                ["name"] = "GEAR_SLOT_FEET",
                ["type"] = 27,
            },
            [8] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 8,
                    [2] = 4,
                },
                ["id"] = 54,
                ["name"] = "GEAR_SLOT_WRIST",
                ["type"] = 27,
            },
            [9] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 9,
                    [2] = 4,
                },
                ["id"] = 55,
                ["name"] = "GEAR_SLOT_HANDS",
                ["type"] = 27,
            },
            [10] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 10,
                    [2] = 4,
                },
                ["id"] = 56,
                ["name"] = "GEAR_SLOT_FIRST_RING",
                ["type"] = 27,
            },
            [11] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 11,
                    [2] = 4,
                },
                ["id"] = 57,
                ["name"] = "GEAR_SLOT_SECOND_RING",
                ["type"] = 27,
            },
            [12] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 12,
                    [2] = 4,
                },
                ["id"] = 58,
                ["name"] = "GEAR_SLOT_FIRST_TRINKET",
                ["type"] = 27,
            },
            [13] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 13,
                    [2] = 4,
                },
                ["id"] = 59,
                ["name"] = "GEAR_SLOT_SECOND_TRINKET",
                ["type"] = 27,
            },
            [14] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 14,
                    [2] = 4,
                },
                ["id"] = 60,
                ["name"] = "GEAR_SLOT_CLOAK",
                ["type"] = 27,
            },
            [15] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 15,
                    [2] = 4,
                },
                ["id"] = 61,
                ["name"] = "GEAR_SLOT_WEAPON",
                ["type"] = 27,
            },
        },
        ["description"] = "AD_EPIC_GEAR",
        ["icon"] = "-Inv_Enchant_ShardNexusLarge",
        ["id"] = 19,
        ["name"] = "AN_EPIC_GEAR",
        ["points"] = 10,
        ["previousID"] = 18,
    },
    [24] = {
        ["selectors"] = {
            ["A:DRUID"] = 9,
            ["A:HUNTER"] = 3,
            ["A:MAGE"] = 7,
            ["A:PALADIN"] = 2,
            ["A:PRIEST"] = 5,
            ["A:ROGUE"] = 4,
            ["A:SHAMAN"] = 6,
            ["A:WARLOCK"] = 8,
            ["A:WARRIOR"] = 1,
            ["H:DRUID"] = 9,
            ["H:HUNTER"] = 3,
            ["H:MAGE"] = 7,
            ["H:PALADIN"] = 2,
            ["H:PRIEST"] = 5,
            ["H:ROGUE"] = 4,
            ["H:SHAMAN"] = 6,
            ["H:WARLOCK"] = 8,
            ["H:WARRIOR"] = 1,
        },
        ["variants"] = {
            [1] = {
                ["anyCompletable"] = false,
                ["categoryID"] = 1,
                ["criteria"] = {
                    [1] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16866,
                        },
                        ["id"] = 66,
                        ["name"] = {
                            ["itemID"] = 16866,
                        },
                        ["type"] = 5,
                    },
                    [2] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16868,
                        },
                        ["id"] = 67,
                        ["name"] = {
                            ["itemID"] = 16868,
                        },
                        ["type"] = 5,
                    },
                    [3] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16865,
                        },
                        ["id"] = 68,
                        ["name"] = {
                            ["itemID"] = 16865,
                        },
                        ["type"] = 5,
                    },
                    [4] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16867,
                        },
                        ["id"] = 69,
                        ["name"] = {
                            ["itemID"] = 16867,
                        },
                        ["type"] = 5,
                    },
                    [5] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16863,
                        },
                        ["id"] = 70,
                        ["name"] = {
                            ["itemID"] = 16863,
                        },
                        ["type"] = 5,
                    },
                    [6] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16862,
                        },
                        ["id"] = 71,
                        ["name"] = {
                            ["itemID"] = 16862,
                        },
                        ["type"] = 5,
                    },
                    [7] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16864,
                        },
                        ["id"] = 72,
                        ["name"] = {
                            ["itemID"] = 16864,
                        },
                        ["type"] = 5,
                    },
                    [8] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16861,
                        },
                        ["id"] = 73,
                        ["name"] = {
                            ["itemID"] = 16861,
                        },
                        ["type"] = 5,
                    },
                },
                ["description"] = "AD_SET",
                ["icon"] = "-inv_helmet_09",
                ["id"] = 24,
                ["name"] = "AN_WARRIOR_T1",
                ["points"] = 20,
            },
            [2] = {
                ["anyCompletable"] = false,
                ["categoryID"] = 1,
                ["criteria"] = {
                    [1] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16854,
                        },
                        ["id"] = 66,
                        ["name"] = {
                            ["itemID"] = 16854,
                        },
                        ["type"] = 5,
                    },
                    [2] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16856,
                        },
                        ["id"] = 67,
                        ["name"] = {
                            ["itemID"] = 16856,
                        },
                        ["type"] = 5,
                    },
                    [3] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16853,
                        },
                        ["id"] = 68,
                        ["name"] = {
                            ["itemID"] = 16853,
                        },
                        ["type"] = 5,
                    },
                    [4] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16855,
                        },
                        ["id"] = 69,
                        ["name"] = {
                            ["itemID"] = 16855,
                        },
                        ["type"] = 5,
                    },
                    [5] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16860,
                        },
                        ["id"] = 70,
                        ["name"] = {
                            ["itemID"] = 16860,
                        },
                        ["type"] = 5,
                    },
                    [6] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16859,
                        },
                        ["id"] = 71,
                        ["name"] = {
                            ["itemID"] = 16859,
                        },
                        ["type"] = 5,
                    },
                    [7] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16858,
                        },
                        ["id"] = 72,
                        ["name"] = {
                            ["itemID"] = 16858,
                        },
                        ["type"] = 5,
                    },
                    [8] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16857,
                        },
                        ["id"] = 73,
                        ["name"] = {
                            ["itemID"] = 16857,
                        },
                        ["type"] = 5,
                    },
                },
                ["description"] = "AD_SET",
                ["icon"] = "-inv_helmet_05",
                ["id"] = 24,
                ["name"] = "AN_PALADIN_T1",
                ["points"] = 20,
            },
            [3] = {
                ["anyCompletable"] = false,
                ["categoryID"] = 1,
                ["criteria"] = {
                    [1] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16846,
                        },
                        ["id"] = 66,
                        ["name"] = {
                            ["itemID"] = 16846,
                        },
                        ["type"] = 5,
                    },
                    [2] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16848,
                        },
                        ["id"] = 67,
                        ["name"] = {
                            ["itemID"] = 16848,
                        },
                        ["type"] = 5,
                    },
                    [3] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16845,
                        },
                        ["id"] = 68,
                        ["name"] = {
                            ["itemID"] = 16845,
                        },
                        ["type"] = 5,
                    },
                    [4] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16847,
                        },
                        ["id"] = 69,
                        ["name"] = {
                            ["itemID"] = 16847,
                        },
                        ["type"] = 5,
                    },
                    [5] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16852,
                        },
                        ["id"] = 70,
                        ["name"] = {
                            ["itemID"] = 16852,
                        },
                        ["type"] = 5,
                    },
                    [6] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16849,
                        },
                        ["id"] = 71,
                        ["name"] = {
                            ["itemID"] = 16849,
                        },
                        ["type"] = 5,
                    },
                    [7] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16851,
                        },
                        ["id"] = 72,
                        ["name"] = {
                            ["itemID"] = 16851,
                        },
                        ["type"] = 5,
                    },
                    [8] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16850,
                        },
                        ["id"] = 73,
                        ["name"] = {
                            ["itemID"] = 16850,
                        },
                        ["type"] = 5,
                    },
                },
                ["description"] = "AD_SET",
                ["icon"] = "-inv_helmet_05",
                ["id"] = 24,
                ["name"] = "AN_HUNTER_T1",
                ["points"] = 20,
            },
            [4] = {
                ["anyCompletable"] = false,
                ["categoryID"] = 1,
                ["criteria"] = {
                    [1] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16821,
                        },
                        ["id"] = 66,
                        ["name"] = {
                            ["itemID"] = 16821,
                        },
                        ["type"] = 5,
                    },
                    [2] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16823,
                        },
                        ["id"] = 67,
                        ["name"] = {
                            ["itemID"] = 16823,
                        },
                        ["type"] = 5,
                    },
                    [3] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16820,
                        },
                        ["id"] = 68,
                        ["name"] = {
                            ["itemID"] = 16820,
                        },
                        ["type"] = 5,
                    },
                    [4] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16822,
                        },
                        ["id"] = 69,
                        ["name"] = {
                            ["itemID"] = 16822,
                        },
                        ["type"] = 5,
                    },
                    [5] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16826,
                        },
                        ["id"] = 70,
                        ["name"] = {
                            ["itemID"] = 16826,
                        },
                        ["type"] = 5,
                    },
                    [6] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16824,
                        },
                        ["id"] = 71,
                        ["name"] = {
                            ["itemID"] = 16824,
                        },
                        ["type"] = 5,
                    },
                    [7] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16825,
                        },
                        ["id"] = 72,
                        ["name"] = {
                            ["itemID"] = 16825,
                        },
                        ["type"] = 5,
                    },
                    [8] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16827,
                        },
                        ["id"] = 73,
                        ["name"] = {
                            ["itemID"] = 16827,
                        },
                        ["type"] = 5,
                    },
                },
                ["description"] = "AD_SET",
                ["icon"] = "-inv_helmet_41",
                ["id"] = 24,
                ["name"] = "AN_ROGUE_T1",
                ["points"] = 20,
            },
            [5] = {
                ["anyCompletable"] = false,
                ["categoryID"] = 1,
                ["criteria"] = {
                    [1] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16811,
                        },
                        ["id"] = 66,
                        ["name"] = {
                            ["itemID"] = 16811,
                        },
                        ["type"] = 5,
                    },
                    [2] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16813,
                        },
                        ["id"] = 67,
                        ["name"] = {
                            ["itemID"] = 16813,
                        },
                        ["type"] = 5,
                    },
                    [3] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16817,
                        },
                        ["id"] = 68,
                        ["name"] = {
                            ["itemID"] = 16817,
                        },
                        ["type"] = 5,
                    },
                    [4] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16812,
                        },
                        ["id"] = 69,
                        ["name"] = {
                            ["itemID"] = 16812,
                        },
                        ["type"] = 5,
                    },
                    [5] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16814,
                        },
                        ["id"] = 70,
                        ["name"] = {
                            ["itemID"] = 16814,
                        },
                        ["type"] = 5,
                    },
                    [6] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16816,
                        },
                        ["id"] = 71,
                        ["name"] = {
                            ["itemID"] = 16816,
                        },
                        ["type"] = 5,
                    },
                    [7] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16815,
                        },
                        ["id"] = 72,
                        ["name"] = {
                            ["itemID"] = 16815,
                        },
                        ["type"] = 5,
                    },
                    [8] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16819,
                        },
                        ["id"] = 73,
                        ["name"] = {
                            ["itemID"] = 16819,
                        },
                        ["type"] = 5,
                    },
                },
                ["description"] = "AD_SET",
                ["icon"] = "-inv_helmet_34",
                ["id"] = 24,
                ["name"] = "AN_PRIEST_T1",
                ["points"] = 20,
            },
            [6] = {
                ["anyCompletable"] = false,
                ["categoryID"] = 1,
                ["criteria"] = {
                    [1] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16837,
                        },
                        ["id"] = 66,
                        ["name"] = {
                            ["itemID"] = 16837,
                        },
                        ["type"] = 5,
                    },
                    [2] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16839,
                        },
                        ["id"] = 67,
                        ["name"] = {
                            ["itemID"] = 16839,
                        },
                        ["type"] = 5,
                    },
                    [3] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16838,
                        },
                        ["id"] = 68,
                        ["name"] = {
                            ["itemID"] = 16838,
                        },
                        ["type"] = 5,
                    },
                    [4] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16840,
                        },
                        ["id"] = 69,
                        ["name"] = {
                            ["itemID"] = 16840,
                        },
                        ["type"] = 5,
                    },
                    [5] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16844,
                        },
                        ["id"] = 70,
                        ["name"] = {
                            ["itemID"] = 16844,
                        },
                        ["type"] = 5,
                    },
                    [6] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16841,
                        },
                        ["id"] = 71,
                        ["name"] = {
                            ["itemID"] = 16841,
                        },
                        ["type"] = 5,
                    },
                    [7] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16843,
                        },
                        ["id"] = 72,
                        ["name"] = {
                            ["itemID"] = 16843,
                        },
                        ["type"] = 5,
                    },
                    [8] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16842,
                        },
                        ["id"] = 73,
                        ["name"] = {
                            ["itemID"] = 16842,
                        },
                        ["type"] = 5,
                    },
                },
                ["description"] = "AD_SET",
                ["icon"] = "-inv_helmet_09",
                ["id"] = 24,
                ["name"] = "AN_SHAMAN_T1",
                ["points"] = 20,
            },
            [7] = {
                ["anyCompletable"] = false,
                ["categoryID"] = 1,
                ["criteria"] = {
                    [1] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16795,
                        },
                        ["id"] = 66,
                        ["name"] = {
                            ["itemID"] = 16795,
                        },
                        ["type"] = 5,
                    },
                    [2] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16797,
                        },
                        ["id"] = 67,
                        ["name"] = {
                            ["itemID"] = 16797,
                        },
                        ["type"] = 5,
                    },
                    [3] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16798,
                        },
                        ["id"] = 68,
                        ["name"] = {
                            ["itemID"] = 16798,
                        },
                        ["type"] = 5,
                    },
                    [4] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16796,
                        },
                        ["id"] = 69,
                        ["name"] = {
                            ["itemID"] = 16796,
                        },
                        ["type"] = 5,
                    },
                    [5] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16801,
                        },
                        ["id"] = 70,
                        ["name"] = {
                            ["itemID"] = 16801,
                        },
                        ["type"] = 5,
                    },
                    [6] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16800,
                        },
                        ["id"] = 71,
                        ["name"] = {
                            ["itemID"] = 16800,
                        },
                        ["type"] = 5,
                    },
                    [7] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16802,
                        },
                        ["id"] = 72,
                        ["name"] = {
                            ["itemID"] = 16802,
                        },
                        ["type"] = 5,
                    },
                    [8] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16799,
                        },
                        ["id"] = 73,
                        ["name"] = {
                            ["itemID"] = 16799,
                        },
                        ["type"] = 5,
                    },
                },
                ["description"] = "AD_SET",
                ["icon"] = "-inv_helmet_53",
                ["id"] = 24,
                ["name"] = "AN_MAGE_T1",
                ["points"] = 20,
            },
            [8] = {
                ["anyCompletable"] = false,
                ["categoryID"] = 1,
                ["criteria"] = {
                    [1] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16806,
                        },
                        ["id"] = 66,
                        ["name"] = {
                            ["itemID"] = 16806,
                        },
                        ["type"] = 5,
                    },
                    [2] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16804,
                        },
                        ["id"] = 67,
                        ["name"] = {
                            ["itemID"] = 16804,
                        },
                        ["type"] = 5,
                    },
                    [3] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16805,
                        },
                        ["id"] = 68,
                        ["name"] = {
                            ["itemID"] = 16805,
                        },
                        ["type"] = 5,
                    },
                    [4] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16810,
                        },
                        ["id"] = 69,
                        ["name"] = {
                            ["itemID"] = 16810,
                        },
                        ["type"] = 5,
                    },
                    [5] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16809,
                        },
                        ["id"] = 70,
                        ["name"] = {
                            ["itemID"] = 16809,
                        },
                        ["type"] = 5,
                    },
                    [6] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16807,
                        },
                        ["id"] = 71,
                        ["name"] = {
                            ["itemID"] = 16807,
                        },
                        ["type"] = 5,
                    },
                    [7] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16808,
                        },
                        ["id"] = 72,
                        ["name"] = {
                            ["itemID"] = 16808,
                        },
                        ["type"] = 5,
                    },
                    [8] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16803,
                        },
                        ["id"] = 73,
                        ["name"] = {
                            ["itemID"] = 16803,
                        },
                        ["type"] = 5,
                    },
                },
                ["description"] = "AD_SET",
                ["icon"] = "-inv_helmet_08",
                ["id"] = 24,
                ["name"] = "AN_WARLOCK_T1",
                ["points"] = 20,
            },
            [9] = {
                ["anyCompletable"] = false,
                ["categoryID"] = 1,
                ["criteria"] = {
                    [1] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16828,
                        },
                        ["id"] = 66,
                        ["name"] = {
                            ["itemID"] = 16828,
                        },
                        ["type"] = 5,
                    },
                    [2] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16829,
                        },
                        ["id"] = 67,
                        ["name"] = {
                            ["itemID"] = 16829,
                        },
                        ["type"] = 5,
                    },
                    [3] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16830,
                        },
                        ["id"] = 68,
                        ["name"] = {
                            ["itemID"] = 16830,
                        },
                        ["type"] = 5,
                    },
                    [4] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16833,
                        },
                        ["id"] = 69,
                        ["name"] = {
                            ["itemID"] = 16833,
                        },
                        ["type"] = 5,
                    },
                    [5] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16831,
                        },
                        ["id"] = 70,
                        ["name"] = {
                            ["itemID"] = 16831,
                        },
                        ["type"] = 5,
                    },
                    [6] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16834,
                        },
                        ["id"] = 71,
                        ["name"] = {
                            ["itemID"] = 16834,
                        },
                        ["type"] = 5,
                    },
                    [7] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16835,
                        },
                        ["id"] = 72,
                        ["name"] = {
                            ["itemID"] = 16835,
                        },
                        ["type"] = 5,
                    },
                    [8] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16836,
                        },
                        ["id"] = 73,
                        ["name"] = {
                            ["itemID"] = 16836,
                        },
                        ["type"] = 5,
                    },
                },
                ["description"] = "AD_SET",
                ["icon"] = "-inv_helmet_09",
                ["id"] = 24,
                ["name"] = "AN_DRUID_T1",
                ["points"] = 20,
            },
        },
    },
    [25] = {
        ["selectors"] = {
            ["A:DRUID"] = 9,
            ["A:HUNTER"] = 3,
            ["A:MAGE"] = 7,
            ["A:PALADIN"] = 2,
            ["A:PRIEST"] = 5,
            ["A:ROGUE"] = 4,
            ["A:SHAMAN"] = 6,
            ["A:WARLOCK"] = 8,
            ["A:WARRIOR"] = 1,
            ["H:DRUID"] = 9,
            ["H:HUNTER"] = 3,
            ["H:MAGE"] = 7,
            ["H:PALADIN"] = 2,
            ["H:PRIEST"] = 5,
            ["H:ROGUE"] = 4,
            ["H:SHAMAN"] = 6,
            ["H:WARLOCK"] = 8,
            ["H:WARRIOR"] = 1,
        },
        ["variants"] = {
            [1] = {
                ["anyCompletable"] = false,
                ["categoryID"] = 1,
                ["criteria"] = {
                    [1] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16959,
                        },
                        ["id"] = 74,
                        ["name"] = {
                            ["itemID"] = 16959,
                        },
                        ["type"] = 5,
                    },
                    [2] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16966,
                        },
                        ["id"] = 75,
                        ["name"] = {
                            ["itemID"] = 16966,
                        },
                        ["type"] = 5,
                    },
                    [3] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16964,
                        },
                        ["id"] = 76,
                        ["name"] = {
                            ["itemID"] = 16964,
                        },
                        ["type"] = 5,
                    },
                    [4] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16963,
                        },
                        ["id"] = 77,
                        ["name"] = {
                            ["itemID"] = 16963,
                        },
                        ["type"] = 5,
                    },
                    [5] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16962,
                        },
                        ["id"] = 78,
                        ["name"] = {
                            ["itemID"] = 16962,
                        },
                        ["type"] = 5,
                    },
                    [6] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16961,
                        },
                        ["id"] = 79,
                        ["name"] = {
                            ["itemID"] = 16961,
                        },
                        ["type"] = 5,
                    },
                    [7] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16965,
                        },
                        ["id"] = 80,
                        ["name"] = {
                            ["itemID"] = 16965,
                        },
                        ["type"] = 5,
                    },
                    [8] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16960,
                        },
                        ["id"] = 81,
                        ["name"] = {
                            ["itemID"] = 16960,
                        },
                        ["type"] = 5,
                    },
                },
                ["description"] = "AD_SET",
                ["icon"] = "-inv_helmet_71",
                ["id"] = 25,
                ["name"] = "AN_WARRIOR_T2",
                ["points"] = 20,
            },
            [2] = {
                ["anyCompletable"] = false,
                ["categoryID"] = 1,
                ["criteria"] = {
                    [1] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16952,
                        },
                        ["id"] = 74,
                        ["name"] = {
                            ["itemID"] = 16952,
                        },
                        ["type"] = 5,
                    },
                    [2] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16951,
                        },
                        ["id"] = 75,
                        ["name"] = {
                            ["itemID"] = 16951,
                        },
                        ["type"] = 5,
                    },
                    [3] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16958,
                        },
                        ["id"] = 76,
                        ["name"] = {
                            ["itemID"] = 16958,
                        },
                        ["type"] = 5,
                    },
                    [4] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16955,
                        },
                        ["id"] = 77,
                        ["name"] = {
                            ["itemID"] = 16955,
                        },
                        ["type"] = 5,
                    },
                    [5] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16956,
                        },
                        ["id"] = 78,
                        ["name"] = {
                            ["itemID"] = 16956,
                        },
                        ["type"] = 5,
                    },
                    [6] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16954,
                        },
                        ["id"] = 79,
                        ["name"] = {
                            ["itemID"] = 16954,
                        },
                        ["type"] = 5,
                    },
                    [7] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16957,
                        },
                        ["id"] = 80,
                        ["name"] = {
                            ["itemID"] = 16957,
                        },
                        ["type"] = 5,
                    },
                    [8] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16953,
                        },
                        ["id"] = 81,
                        ["name"] = {
                            ["itemID"] = 16953,
                        },
                        ["type"] = 5,
                    },
                },
                ["description"] = "AD_SET",
                ["icon"] = "-inv_helmet_74",
                ["id"] = 25,
                ["name"] = "AN_PALADIN_T2",
                ["points"] = 20,
            },
            [3] = {
                ["anyCompletable"] = false,
                ["categoryID"] = 1,
                ["criteria"] = {
                    [1] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16936,
                        },
                        ["id"] = 74,
                        ["name"] = {
                            ["itemID"] = 16936,
                        },
                        ["type"] = 5,
                    },
                    [2] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16935,
                        },
                        ["id"] = 75,
                        ["name"] = {
                            ["itemID"] = 16935,
                        },
                        ["type"] = 5,
                    },
                    [3] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16942,
                        },
                        ["id"] = 76,
                        ["name"] = {
                            ["itemID"] = 16942,
                        },
                        ["type"] = 5,
                    },
                    [4] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16940,
                        },
                        ["id"] = 77,
                        ["name"] = {
                            ["itemID"] = 16940,
                        },
                        ["type"] = 5,
                    },
                    [5] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16941,
                        },
                        ["id"] = 78,
                        ["name"] = {
                            ["itemID"] = 16941,
                        },
                        ["type"] = 5,
                    },
                    [6] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16939,
                        },
                        ["id"] = 79,
                        ["name"] = {
                            ["itemID"] = 16939,
                        },
                        ["type"] = 5,
                    },
                    [7] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16938,
                        },
                        ["id"] = 80,
                        ["name"] = {
                            ["itemID"] = 16938,
                        },
                        ["type"] = 5,
                    },
                    [8] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16937,
                        },
                        ["id"] = 81,
                        ["name"] = {
                            ["itemID"] = 16937,
                        },
                        ["type"] = 5,
                    },
                },
                ["description"] = "AD_SET",
                ["icon"] = "-inv_helmet_05",
                ["id"] = 25,
                ["name"] = "AN_HUNTER_T2",
                ["points"] = 20,
            },
            [4] = {
                ["anyCompletable"] = false,
                ["categoryID"] = 1,
                ["criteria"] = {
                    [1] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16910,
                        },
                        ["id"] = 74,
                        ["name"] = {
                            ["itemID"] = 16910,
                        },
                        ["type"] = 5,
                    },
                    [2] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16906,
                        },
                        ["id"] = 75,
                        ["name"] = {
                            ["itemID"] = 16906,
                        },
                        ["type"] = 5,
                    },
                    [3] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16911,
                        },
                        ["id"] = 76,
                        ["name"] = {
                            ["itemID"] = 16911,
                        },
                        ["type"] = 5,
                    },
                    [4] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16905,
                        },
                        ["id"] = 77,
                        ["name"] = {
                            ["itemID"] = 16905,
                        },
                        ["type"] = 5,
                    },
                    [5] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16907,
                        },
                        ["id"] = 78,
                        ["name"] = {
                            ["itemID"] = 16907,
                        },
                        ["type"] = 5,
                    },
                    [6] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16908,
                        },
                        ["id"] = 79,
                        ["name"] = {
                            ["itemID"] = 16908,
                        },
                        ["type"] = 5,
                    },
                    [7] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16909,
                        },
                        ["id"] = 80,
                        ["name"] = {
                            ["itemID"] = 16909,
                        },
                        ["type"] = 5,
                    },
                    [8] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16832,
                        },
                        ["id"] = 81,
                        ["name"] = {
                            ["itemID"] = 16832,
                        },
                        ["type"] = 5,
                    },
                },
                ["description"] = "AD_SET",
                ["icon"] = "-inv_helmet_41",
                ["id"] = 25,
                ["name"] = "AN_ROGUE_T2",
                ["points"] = 20,
            },
            [5] = {
                ["anyCompletable"] = false,
                ["categoryID"] = 1,
                ["criteria"] = {
                    [1] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16925,
                        },
                        ["id"] = 74,
                        ["name"] = {
                            ["itemID"] = 16925,
                        },
                        ["type"] = 5,
                    },
                    [2] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16926,
                        },
                        ["id"] = 75,
                        ["name"] = {
                            ["itemID"] = 16926,
                        },
                        ["type"] = 5,
                    },
                    [3] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16919,
                        },
                        ["id"] = 76,
                        ["name"] = {
                            ["itemID"] = 16919,
                        },
                        ["type"] = 5,
                    },
                    [4] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16921,
                        },
                        ["id"] = 77,
                        ["name"] = {
                            ["itemID"] = 16921,
                        },
                        ["type"] = 5,
                    },
                    [5] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16920,
                        },
                        ["id"] = 78,
                        ["name"] = {
                            ["itemID"] = 16920,
                        },
                        ["type"] = 5,
                    },
                    [6] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16922,
                        },
                        ["id"] = 79,
                        ["name"] = {
                            ["itemID"] = 16922,
                        },
                        ["type"] = 5,
                    },
                    [7] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16924,
                        },
                        ["id"] = 80,
                        ["name"] = {
                            ["itemID"] = 16924,
                        },
                        ["type"] = 5,
                    },
                    [8] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16923,
                        },
                        ["id"] = 81,
                        ["name"] = {
                            ["itemID"] = 16923,
                        },
                        ["type"] = 5,
                    },
                },
                ["description"] = "AD_SET",
                ["icon"] = "-inv_helmet_24",
                ["id"] = 25,
                ["name"] = "AN_PRIEST_T2",
                ["points"] = 20,
            },
            [6] = {
                ["anyCompletable"] = false,
                ["categoryID"] = 1,
                ["criteria"] = {
                    [1] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16944,
                        },
                        ["id"] = 74,
                        ["name"] = {
                            ["itemID"] = 16944,
                        },
                        ["type"] = 5,
                    },
                    [2] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16943,
                        },
                        ["id"] = 75,
                        ["name"] = {
                            ["itemID"] = 16943,
                        },
                        ["type"] = 5,
                    },
                    [3] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16950,
                        },
                        ["id"] = 76,
                        ["name"] = {
                            ["itemID"] = 16950,
                        },
                        ["type"] = 5,
                    },
                    [4] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16945,
                        },
                        ["id"] = 77,
                        ["name"] = {
                            ["itemID"] = 16945,
                        },
                        ["type"] = 5,
                    },
                    [5] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16948,
                        },
                        ["id"] = 78,
                        ["name"] = {
                            ["itemID"] = 16948,
                        },
                        ["type"] = 5,
                    },
                    [6] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16949,
                        },
                        ["id"] = 79,
                        ["name"] = {
                            ["itemID"] = 16949,
                        },
                        ["type"] = 5,
                    },
                    [7] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16947,
                        },
                        ["id"] = 80,
                        ["name"] = {
                            ["itemID"] = 16947,
                        },
                        ["type"] = 5,
                    },
                    [8] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16946,
                        },
                        ["id"] = 81,
                        ["name"] = {
                            ["itemID"] = 16946,
                        },
                        ["type"] = 5,
                    },
                },
                ["description"] = "AD_SET",
                ["icon"] = "-inv_helmet_69",
                ["id"] = 25,
                ["name"] = "AN_SHAMAN_T2",
                ["points"] = 20,
            },
            [7] = {
                ["anyCompletable"] = false,
                ["categoryID"] = 1,
                ["criteria"] = {
                    [1] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16818,
                        },
                        ["id"] = 74,
                        ["name"] = {
                            ["itemID"] = 16818,
                        },
                        ["type"] = 5,
                    },
                    [2] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16918,
                        },
                        ["id"] = 75,
                        ["name"] = {
                            ["itemID"] = 16918,
                        },
                        ["type"] = 5,
                    },
                    [3] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16912,
                        },
                        ["id"] = 76,
                        ["name"] = {
                            ["itemID"] = 16912,
                        },
                        ["type"] = 5,
                    },
                    [4] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16914,
                        },
                        ["id"] = 77,
                        ["name"] = {
                            ["itemID"] = 16914,
                        },
                        ["type"] = 5,
                    },
                    [5] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16917,
                        },
                        ["id"] = 78,
                        ["name"] = {
                            ["itemID"] = 16917,
                        },
                        ["type"] = 5,
                    },
                    [6] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16913,
                        },
                        ["id"] = 79,
                        ["name"] = {
                            ["itemID"] = 16913,
                        },
                        ["type"] = 5,
                    },
                    [7] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16915,
                        },
                        ["id"] = 80,
                        ["name"] = {
                            ["itemID"] = 16915,
                        },
                        ["type"] = 5,
                    },
                    [8] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16916,
                        },
                        ["id"] = 81,
                        ["name"] = {
                            ["itemID"] = 16916,
                        },
                        ["type"] = 5,
                    },
                },
                ["description"] = "AD_SET",
                ["icon"] = "-inv_helmet_70",
                ["id"] = 25,
                ["name"] = "AN_MAGE_T2",
                ["points"] = 20,
            },
            [8] = {
                ["anyCompletable"] = false,
                ["categoryID"] = 1,
                ["criteria"] = {
                    [1] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16933,
                        },
                        ["id"] = 74,
                        ["name"] = {
                            ["itemID"] = 16933,
                        },
                        ["type"] = 5,
                    },
                    [2] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16927,
                        },
                        ["id"] = 75,
                        ["name"] = {
                            ["itemID"] = 16927,
                        },
                        ["type"] = 5,
                    },
                    [3] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16934,
                        },
                        ["id"] = 76,
                        ["name"] = {
                            ["itemID"] = 16934,
                        },
                        ["type"] = 5,
                    },
                    [4] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16928,
                        },
                        ["id"] = 77,
                        ["name"] = {
                            ["itemID"] = 16928,
                        },
                        ["type"] = 5,
                    },
                    [5] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16930,
                        },
                        ["id"] = 78,
                        ["name"] = {
                            ["itemID"] = 16930,
                        },
                        ["type"] = 5,
                    },
                    [6] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16931,
                        },
                        ["id"] = 79,
                        ["name"] = {
                            ["itemID"] = 16931,
                        },
                        ["type"] = 5,
                    },
                    [7] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16929,
                        },
                        ["id"] = 80,
                        ["name"] = {
                            ["itemID"] = 16929,
                        },
                        ["type"] = 5,
                    },
                    [8] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16932,
                        },
                        ["id"] = 81,
                        ["name"] = {
                            ["itemID"] = 16932,
                        },
                        ["type"] = 5,
                    },
                },
                ["description"] = "AD_SET",
                ["icon"] = "-inv_helmet_08",
                ["id"] = 25,
                ["name"] = "AN_WARLOCK_T2",
                ["points"] = 20,
            },
            [9] = {
                ["anyCompletable"] = false,
                ["categoryID"] = 1,
                ["criteria"] = {
                    [1] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16903,
                        },
                        ["id"] = 74,
                        ["name"] = {
                            ["itemID"] = 16903,
                        },
                        ["type"] = 5,
                    },
                    [2] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16898,
                        },
                        ["id"] = 75,
                        ["name"] = {
                            ["itemID"] = 16898,
                        },
                        ["type"] = 5,
                    },
                    [3] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16904,
                        },
                        ["id"] = 76,
                        ["name"] = {
                            ["itemID"] = 16904,
                        },
                        ["type"] = 5,
                    },
                    [4] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16897,
                        },
                        ["id"] = 77,
                        ["name"] = {
                            ["itemID"] = 16897,
                        },
                        ["type"] = 5,
                    },
                    [5] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16900,
                        },
                        ["id"] = 78,
                        ["name"] = {
                            ["itemID"] = 16900,
                        },
                        ["type"] = 5,
                    },
                    [6] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16899,
                        },
                        ["id"] = 79,
                        ["name"] = {
                            ["itemID"] = 16899,
                        },
                        ["type"] = 5,
                    },
                    [7] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16901,
                        },
                        ["id"] = 80,
                        ["name"] = {
                            ["itemID"] = 16901,
                        },
                        ["type"] = 5,
                    },
                    [8] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 16902,
                        },
                        ["id"] = 81,
                        ["name"] = {
                            ["itemID"] = 16902,
                        },
                        ["type"] = 5,
                    },
                },
                ["description"] = "AD_SET",
                ["icon"] = "-inv_helmet_09",
                ["id"] = 25,
                ["name"] = "AN_DRUID_T2",
                ["points"] = 20,
            },
        },
    },
    [26] = {
        ["selectors"] = {
            ["A:DRUID"] = 9,
            ["A:HUNTER"] = 3,
            ["A:MAGE"] = 7,
            ["A:PALADIN"] = 2,
            ["A:PRIEST"] = 5,
            ["A:ROGUE"] = 4,
            ["A:SHAMAN"] = 6,
            ["A:WARLOCK"] = 8,
            ["A:WARRIOR"] = 1,
            ["H:DRUID"] = 9,
            ["H:HUNTER"] = 3,
            ["H:MAGE"] = 7,
            ["H:PALADIN"] = 2,
            ["H:PRIEST"] = 5,
            ["H:ROGUE"] = 4,
            ["H:SHAMAN"] = 6,
            ["H:WARLOCK"] = 8,
            ["H:WARRIOR"] = 1,
        },
        ["variants"] = {
            [1] = {
                ["anyCompletable"] = false,
                ["categoryID"] = 1,
                ["criteria"] = {
                    [1] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 22418,
                        },
                        ["id"] = 82,
                        ["name"] = {
                            ["itemID"] = 22418,
                        },
                        ["type"] = 5,
                    },
                    [2] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 22419,
                        },
                        ["id"] = 83,
                        ["name"] = {
                            ["itemID"] = 22419,
                        },
                        ["type"] = 5,
                    },
                    [3] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 22416,
                        },
                        ["id"] = 84,
                        ["name"] = {
                            ["itemID"] = 22416,
                        },
                        ["type"] = 5,
                    },
                    [4] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 22417,
                        },
                        ["id"] = 85,
                        ["name"] = {
                            ["itemID"] = 22417,
                        },
                        ["type"] = 5,
                    },
                    [5] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 22420,
                        },
                        ["id"] = 86,
                        ["name"] = {
                            ["itemID"] = 22420,
                        },
                        ["type"] = 5,
                    },
                    [6] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 22422,
                        },
                        ["id"] = 87,
                        ["name"] = {
                            ["itemID"] = 22422,
                        },
                        ["type"] = 5,
                    },
                    [7] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 22421,
                        },
                        ["id"] = 88,
                        ["name"] = {
                            ["itemID"] = 22421,
                        },
                        ["type"] = 5,
                    },
                    [8] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 22423,
                        },
                        ["id"] = 89,
                        ["name"] = {
                            ["itemID"] = 22423,
                        },
                        ["type"] = 5,
                    },
                    [9] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 23059,
                        },
                        ["id"] = 90,
                        ["name"] = {
                            ["itemID"] = 23059,
                        },
                        ["type"] = 5,
                    },
                },
                ["description"] = "AD_SET",
                ["icon"] = "-inv_helmet_58",
                ["id"] = 26,
                ["name"] = "AN_WARRIOR_T3",
                ["points"] = 20,
            },
            [2] = {
                ["anyCompletable"] = false,
                ["categoryID"] = 1,
                ["criteria"] = {
                    [1] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 22428,
                        },
                        ["id"] = 82,
                        ["name"] = {
                            ["itemID"] = 22428,
                        },
                        ["type"] = 5,
                    },
                    [2] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 22429,
                        },
                        ["id"] = 83,
                        ["name"] = {
                            ["itemID"] = 22429,
                        },
                        ["type"] = 5,
                    },
                    [3] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 22426,
                        },
                        ["id"] = 84,
                        ["name"] = {
                            ["itemID"] = 22426,
                        },
                        ["type"] = 5,
                    },
                    [4] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 22427,
                        },
                        ["id"] = 85,
                        ["name"] = {
                            ["itemID"] = 22427,
                        },
                        ["type"] = 5,
                    },
                    [5] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 22430,
                        },
                        ["id"] = 86,
                        ["name"] = {
                            ["itemID"] = 22430,
                        },
                        ["type"] = 5,
                    },
                    [6] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 22424,
                        },
                        ["id"] = 87,
                        ["name"] = {
                            ["itemID"] = 22424,
                        },
                        ["type"] = 5,
                    },
                    [7] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 22431,
                        },
                        ["id"] = 88,
                        ["name"] = {
                            ["itemID"] = 22431,
                        },
                        ["type"] = 5,
                    },
                    [8] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 22425,
                        },
                        ["id"] = 89,
                        ["name"] = {
                            ["itemID"] = 22425,
                        },
                        ["type"] = 5,
                    },
                    [9] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 23066,
                        },
                        ["id"] = 90,
                        ["name"] = {
                            ["itemID"] = 23066,
                        },
                        ["type"] = 5,
                    },
                },
                ["description"] = "AD_SET",
                ["icon"] = "-inv_helmet_15",
                ["id"] = 26,
                ["name"] = "AN_PALADIN_T3",
                ["points"] = 20,
            },
            [3] = {
                ["anyCompletable"] = false,
                ["categoryID"] = 1,
                ["criteria"] = {
                    [1] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 22438,
                        },
                        ["id"] = 82,
                        ["name"] = {
                            ["itemID"] = 22438,
                        },
                        ["type"] = 5,
                    },
                    [2] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 22439,
                        },
                        ["id"] = 83,
                        ["name"] = {
                            ["itemID"] = 22439,
                        },
                        ["type"] = 5,
                    },
                    [3] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 22436,
                        },
                        ["id"] = 84,
                        ["name"] = {
                            ["itemID"] = 22436,
                        },
                        ["type"] = 5,
                    },
                    [4] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 22437,
                        },
                        ["id"] = 85,
                        ["name"] = {
                            ["itemID"] = 22437,
                        },
                        ["type"] = 5,
                    },
                    [5] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 22441,
                        },
                        ["id"] = 86,
                        ["name"] = {
                            ["itemID"] = 22441,
                        },
                        ["type"] = 5,
                    },
                    [6] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 22442,
                        },
                        ["id"] = 87,
                        ["name"] = {
                            ["itemID"] = 22442,
                        },
                        ["type"] = 5,
                    },
                    [7] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 22440,
                        },
                        ["id"] = 88,
                        ["name"] = {
                            ["itemID"] = 22440,
                        },
                        ["type"] = 5,
                    },
                    [8] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 22443,
                        },
                        ["id"] = 89,
                        ["name"] = {
                            ["itemID"] = 22443,
                        },
                        ["type"] = 5,
                    },
                    [9] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 23067,
                        },
                        ["id"] = 90,
                        ["name"] = {
                            ["itemID"] = 23067,
                        },
                        ["type"] = 5,
                    },
                },
                ["description"] = "AD_SET",
                ["icon"] = "-inv_helmet_15",
                ["id"] = 26,
                ["name"] = "AN_HUNTER_T3",
                ["points"] = 20,
            },
            [4] = {
                ["anyCompletable"] = false,
                ["categoryID"] = 1,
                ["criteria"] = {
                    [1] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 22478,
                        },
                        ["id"] = 82,
                        ["name"] = {
                            ["itemID"] = 22478,
                        },
                        ["type"] = 5,
                    },
                    [2] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 22479,
                        },
                        ["id"] = 83,
                        ["name"] = {
                            ["itemID"] = 22479,
                        },
                        ["type"] = 5,
                    },
                    [3] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 22476,
                        },
                        ["id"] = 84,
                        ["name"] = {
                            ["itemID"] = 22476,
                        },
                        ["type"] = 5,
                    },
                    [4] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 22477,
                        },
                        ["id"] = 85,
                        ["name"] = {
                            ["itemID"] = 22477,
                        },
                        ["type"] = 5,
                    },
                    [5] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 22480,
                        },
                        ["id"] = 86,
                        ["name"] = {
                            ["itemID"] = 22480,
                        },
                        ["type"] = 5,
                    },
                    [6] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 22482,
                        },
                        ["id"] = 87,
                        ["name"] = {
                            ["itemID"] = 22482,
                        },
                        ["type"] = 5,
                    },
                    [7] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 22481,
                        },
                        ["id"] = 88,
                        ["name"] = {
                            ["itemID"] = 22481,
                        },
                        ["type"] = 5,
                    },
                    [8] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 22483,
                        },
                        ["id"] = 89,
                        ["name"] = {
                            ["itemID"] = 22483,
                        },
                        ["type"] = 5,
                    },
                    [9] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 23060,
                        },
                        ["id"] = 90,
                        ["name"] = {
                            ["itemID"] = 23060,
                        },
                        ["type"] = 5,
                    },
                },
                ["description"] = "AD_SET",
                ["icon"] = "-inv_helmet_58",
                ["id"] = 26,
                ["name"] = "AN_ROGUE_T3",
                ["points"] = 20,
            },
            [5] = {
                ["anyCompletable"] = false,
                ["categoryID"] = 1,
                ["criteria"] = {
                    [1] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 22518,
                        },
                        ["id"] = 82,
                        ["name"] = {
                            ["itemID"] = 22518,
                        },
                        ["type"] = 5,
                    },
                    [2] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 22519,
                        },
                        ["id"] = 83,
                        ["name"] = {
                            ["itemID"] = 22519,
                        },
                        ["type"] = 5,
                    },
                    [3] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 22514,
                        },
                        ["id"] = 84,
                        ["name"] = {
                            ["itemID"] = 22514,
                        },
                        ["type"] = 5,
                    },
                    [4] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 22517,
                        },
                        ["id"] = 85,
                        ["name"] = {
                            ["itemID"] = 22517,
                        },
                        ["type"] = 5,
                    },
                    [5] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 22513,
                        },
                        ["id"] = 86,
                        ["name"] = {
                            ["itemID"] = 22513,
                        },
                        ["type"] = 5,
                    },
                    [6] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 22512,
                        },
                        ["id"] = 87,
                        ["name"] = {
                            ["itemID"] = 22512,
                        },
                        ["type"] = 5,
                    },
                    [7] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 22516,
                        },
                        ["id"] = 88,
                        ["name"] = {
                            ["itemID"] = 22516,
                        },
                        ["type"] = 5,
                    },
                    [8] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 22515,
                        },
                        ["id"] = 89,
                        ["name"] = {
                            ["itemID"] = 22515,
                        },
                        ["type"] = 5,
                    },
                    [9] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 23061,
                        },
                        ["id"] = 90,
                        ["name"] = {
                            ["itemID"] = 23061,
                        },
                        ["type"] = 5,
                    },
                },
                ["description"] = "AD_SET",
                ["icon"] = "-inv_crown_01",
                ["id"] = 26,
                ["name"] = "AN_PRIEST_T3",
                ["points"] = 20,
            },
            [6] = {
                ["anyCompletable"] = false,
                ["categoryID"] = 1,
                ["criteria"] = {
                    [1] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 22466,
                        },
                        ["id"] = 82,
                        ["name"] = {
                            ["itemID"] = 22466,
                        },
                        ["type"] = 5,
                    },
                    [2] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 22467,
                        },
                        ["id"] = 83,
                        ["name"] = {
                            ["itemID"] = 22467,
                        },
                        ["type"] = 5,
                    },
                    [3] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 22464,
                        },
                        ["id"] = 84,
                        ["name"] = {
                            ["itemID"] = 22464,
                        },
                        ["type"] = 5,
                    },
                    [4] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 22465,
                        },
                        ["id"] = 85,
                        ["name"] = {
                            ["itemID"] = 22465,
                        },
                        ["type"] = 5,
                    },
                    [5] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 22468,
                        },
                        ["id"] = 86,
                        ["name"] = {
                            ["itemID"] = 22468,
                        },
                        ["type"] = 5,
                    },
                    [6] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 22470,
                        },
                        ["id"] = 87,
                        ["name"] = {
                            ["itemID"] = 22470,
                        },
                        ["type"] = 5,
                    },
                    [7] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 22469,
                        },
                        ["id"] = 88,
                        ["name"] = {
                            ["itemID"] = 22469,
                        },
                        ["type"] = 5,
                    },
                    [8] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 22471,
                        },
                        ["id"] = 89,
                        ["name"] = {
                            ["itemID"] = 22471,
                        },
                        ["type"] = 5,
                    },
                    [9] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 23065,
                        },
                        ["id"] = 90,
                        ["name"] = {
                            ["itemID"] = 23065,
                        },
                        ["type"] = 5,
                    },
                },
                ["description"] = "AD_SET",
                ["icon"] = "-inv_helmet_15",
                ["id"] = 26,
                ["name"] = "AN_SHAMAN_T3",
                ["points"] = 20,
            },
            [7] = {
                ["anyCompletable"] = false,
                ["categoryID"] = 1,
                ["criteria"] = {
                    [1] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 22498,
                        },
                        ["id"] = 82,
                        ["name"] = {
                            ["itemID"] = 22498,
                        },
                        ["type"] = 5,
                    },
                    [2] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 22499,
                        },
                        ["id"] = 83,
                        ["name"] = {
                            ["itemID"] = 22499,
                        },
                        ["type"] = 5,
                    },
                    [3] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 22496,
                        },
                        ["id"] = 84,
                        ["name"] = {
                            ["itemID"] = 22496,
                        },
                        ["type"] = 5,
                    },
                    [4] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 22497,
                        },
                        ["id"] = 85,
                        ["name"] = {
                            ["itemID"] = 22497,
                        },
                        ["type"] = 5,
                    },
                    [5] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 22500,
                        },
                        ["id"] = 86,
                        ["name"] = {
                            ["itemID"] = 22500,
                        },
                        ["type"] = 5,
                    },
                    [6] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 22502,
                        },
                        ["id"] = 87,
                        ["name"] = {
                            ["itemID"] = 22502,
                        },
                        ["type"] = 5,
                    },
                    [7] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 22501,
                        },
                        ["id"] = 88,
                        ["name"] = {
                            ["itemID"] = 22501,
                        },
                        ["type"] = 5,
                    },
                    [8] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 22503,
                        },
                        ["id"] = 89,
                        ["name"] = {
                            ["itemID"] = 22503,
                        },
                        ["type"] = 5,
                    },
                    [9] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 23062,
                        },
                        ["id"] = 90,
                        ["name"] = {
                            ["itemID"] = 23062,
                        },
                        ["type"] = 5,
                    },
                },
                ["description"] = "AD_SET",
                ["icon"] = "-inv_crown_01",
                ["id"] = 26,
                ["name"] = "AN_MAGE_T3",
                ["points"] = 20,
            },
            [8] = {
                ["anyCompletable"] = false,
                ["categoryID"] = 1,
                ["criteria"] = {
                    [1] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 22506,
                        },
                        ["id"] = 82,
                        ["name"] = {
                            ["itemID"] = 22506,
                        },
                        ["type"] = 5,
                    },
                    [2] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 22507,
                        },
                        ["id"] = 83,
                        ["name"] = {
                            ["itemID"] = 22507,
                        },
                        ["type"] = 5,
                    },
                    [3] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 22504,
                        },
                        ["id"] = 84,
                        ["name"] = {
                            ["itemID"] = 22504,
                        },
                        ["type"] = 5,
                    },
                    [4] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 22505,
                        },
                        ["id"] = 85,
                        ["name"] = {
                            ["itemID"] = 22505,
                        },
                        ["type"] = 5,
                    },
                    [5] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 22508,
                        },
                        ["id"] = 86,
                        ["name"] = {
                            ["itemID"] = 22508,
                        },
                        ["type"] = 5,
                    },
                    [6] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 22510,
                        },
                        ["id"] = 87,
                        ["name"] = {
                            ["itemID"] = 22510,
                        },
                        ["type"] = 5,
                    },
                    [7] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 22509,
                        },
                        ["id"] = 88,
                        ["name"] = {
                            ["itemID"] = 22509,
                        },
                        ["type"] = 5,
                    },
                    [8] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 22511,
                        },
                        ["id"] = 89,
                        ["name"] = {
                            ["itemID"] = 22511,
                        },
                        ["type"] = 5,
                    },
                    [9] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 23063,
                        },
                        ["id"] = 90,
                        ["name"] = {
                            ["itemID"] = 23063,
                        },
                        ["type"] = 5,
                    },
                },
                ["description"] = "AD_SET",
                ["icon"] = "-inv_crown_01",
                ["id"] = 26,
                ["name"] = "AN_WARLOCK_T3",
                ["points"] = 20,
            },
            [9] = {
                ["anyCompletable"] = false,
                ["categoryID"] = 1,
                ["criteria"] = {
                    [1] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 22490,
                        },
                        ["id"] = 82,
                        ["name"] = {
                            ["itemID"] = 22490,
                        },
                        ["type"] = 5,
                    },
                    [2] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 22491,
                        },
                        ["id"] = 83,
                        ["name"] = {
                            ["itemID"] = 22491,
                        },
                        ["type"] = 5,
                    },
                    [3] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 22488,
                        },
                        ["id"] = 84,
                        ["name"] = {
                            ["itemID"] = 22488,
                        },
                        ["type"] = 5,
                    },
                    [4] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 22489,
                        },
                        ["id"] = 85,
                        ["name"] = {
                            ["itemID"] = 22489,
                        },
                        ["type"] = 5,
                    },
                    [5] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 22492,
                        },
                        ["id"] = 86,
                        ["name"] = {
                            ["itemID"] = 22492,
                        },
                        ["type"] = 5,
                    },
                    [6] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 22494,
                        },
                        ["id"] = 87,
                        ["name"] = {
                            ["itemID"] = 22494,
                        },
                        ["type"] = 5,
                    },
                    [7] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 22493,
                        },
                        ["id"] = 88,
                        ["name"] = {
                            ["itemID"] = 22493,
                        },
                        ["type"] = 5,
                    },
                    [8] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 22495,
                        },
                        ["id"] = 89,
                        ["name"] = {
                            ["itemID"] = 22495,
                        },
                        ["type"] = 5,
                    },
                    [9] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 23064,
                        },
                        ["id"] = 90,
                        ["name"] = {
                            ["itemID"] = 23064,
                        },
                        ["type"] = 5,
                    },
                },
                ["description"] = "AD_SET",
                ["icon"] = "-inv_helmet_15",
                ["id"] = 26,
                ["name"] = "AN_DRUID_T3",
                ["points"] = 20,
            },
        },
    },
    [27] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 2,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {},
                ["id"] = 91,
                ["name"] = {
                    ["args"] = {
                        [1] = 50,
                    },
                    ["key"] = "AC_QUESTS",
                },
                ["quantity"] = 50,
                ["type"] = 4,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 50,
            },
            ["key"] = "AD_QUESTS",
        },
        ["icon"] = "achievement_quests_completed_01",
        ["id"] = 27,
        ["name"] = {
            ["args"] = {
                [1] = 50,
            },
            ["key"] = "AN_QUESTS",
        },
        ["nextID"] = 28,
        ["points"] = 10,
    },
    [28] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 2,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {},
                ["id"] = 92,
                ["name"] = {
                    ["args"] = {
                        [1] = 100,
                    },
                    ["key"] = "AC_QUESTS",
                },
                ["quantity"] = 100,
                ["type"] = 4,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 100,
            },
            ["key"] = "AD_QUESTS",
        },
        ["icon"] = "achievement_quests_completed_02",
        ["id"] = 28,
        ["name"] = {
            ["args"] = {
                [1] = 100,
            },
            ["key"] = "AN_QUESTS",
        },
        ["nextID"] = 29,
        ["points"] = 10,
        ["previousID"] = 27,
    },
    [29] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 2,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {},
                ["id"] = 93,
                ["name"] = {
                    ["args"] = {
                        [1] = 250,
                    },
                    ["key"] = "AC_QUESTS",
                },
                ["quantity"] = 250,
                ["type"] = 4,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 250,
            },
            ["key"] = "AD_QUESTS",
        },
        ["icon"] = "achievement_quests_completed_03",
        ["id"] = 29,
        ["name"] = {
            ["args"] = {
                [1] = 250,
            },
            ["key"] = "AN_QUESTS",
        },
        ["nextID"] = 30,
        ["points"] = 10,
        ["previousID"] = 28,
    },
    [30] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 2,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {},
                ["id"] = 94,
                ["name"] = {
                    ["args"] = {
                        [1] = 500,
                    },
                    ["key"] = "AC_QUESTS",
                },
                ["quantity"] = 500,
                ["type"] = 4,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 500,
            },
            ["key"] = "AD_QUESTS",
        },
        ["icon"] = "achievement_quests_completed_04",
        ["id"] = 30,
        ["name"] = {
            ["args"] = {
                [1] = 500,
            },
            ["key"] = "AN_QUESTS",
        },
        ["nextID"] = 31,
        ["points"] = 10,
        ["previousID"] = 29,
    },
    [31] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 2,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {},
                ["id"] = 95,
                ["name"] = {
                    ["args"] = {
                        [1] = 750,
                    },
                    ["key"] = "AC_QUESTS",
                },
                ["quantity"] = 750,
                ["type"] = 4,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 750,
            },
            ["key"] = "AD_QUESTS",
        },
        ["icon"] = "achievement_quests_completed_05",
        ["id"] = 31,
        ["name"] = {
            ["args"] = {
                [1] = 750,
            },
            ["key"] = "AN_QUESTS",
        },
        ["nextID"] = 32,
        ["points"] = 10,
        ["previousID"] = 30,
    },
    [32] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 2,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {},
                ["id"] = 96,
                ["name"] = {
                    ["numberFormat"] = {
                        ["args"] = {
                            [1] = 1000,
                        },
                        ["key"] = "AC_QUESTS",
                    },
                },
                ["quantity"] = 1000,
                ["type"] = 4,
            },
        },
        ["description"] = {
            ["numberFormat"] = {
                ["args"] = {
                    [1] = 1000,
                },
                ["key"] = "AD_QUESTS",
            },
        },
        ["icon"] = "achievement_quests_completed_06",
        ["id"] = 32,
        ["name"] = {
            ["numberFormat"] = {
                ["args"] = {
                    [1] = 1000,
                },
                ["key"] = "AN_QUESTS",
            },
        },
        ["nextID"] = 33,
        ["points"] = 10,
        ["previousID"] = 31,
    },
    [33] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 2,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {},
                ["id"] = 97,
                ["name"] = {
                    ["numberFormat"] = {
                        ["args"] = {
                            [1] = 1500,
                        },
                        ["key"] = "AC_QUESTS",
                    },
                },
                ["quantity"] = 1500,
                ["type"] = 4,
            },
        },
        ["description"] = {
            ["numberFormat"] = {
                ["args"] = {
                    [1] = 1500,
                },
                ["key"] = "AD_QUESTS",
            },
        },
        ["icon"] = "achievement_quests_completed_07",
        ["id"] = 33,
        ["name"] = {
            ["numberFormat"] = {
                ["args"] = {
                    [1] = 1500,
                },
                ["key"] = "AN_QUESTS",
            },
        },
        ["nextID"] = 34,
        ["points"] = 10,
        ["previousID"] = 32,
    },
    [34] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 2,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {},
                ["id"] = 98,
                ["name"] = {
                    ["numberFormat"] = {
                        ["args"] = {
                            [1] = 2000,
                        },
                        ["key"] = "AC_QUESTS",
                    },
                },
                ["quantity"] = 2000,
                ["type"] = 4,
            },
        },
        ["description"] = {
            ["numberFormat"] = {
                ["args"] = {
                    [1] = 2000,
                },
                ["key"] = "AD_QUESTS",
            },
        },
        ["icon"] = "achievement_quests_completed_08",
        ["id"] = 34,
        ["name"] = {
            ["numberFormat"] = {
                ["args"] = {
                    [1] = 2000,
                },
                ["key"] = "AN_QUESTS",
            },
        },
        ["points"] = 10,
        ["previousID"] = 33,
    },
    [35] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 2,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = true,
                ["data"] = {},
                ["id"] = 107,
                ["name"] = {
                    ["args"] = {
                        [1] = 5,
                    },
                    ["key"] = "AC_QUEST_GOLD",
                },
                ["quantity"] = 50000,
                ["type"] = 22,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 5,
            },
            ["key"] = "AD_QUEST_GOLD",
        },
        ["icon"] = "-Inv_Misc_Coin_05",
        ["id"] = 35,
        ["name"] = "AN_QUEST_GOLD5",
        ["nextID"] = 36,
        ["points"] = 10,
    },
    [36] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 2,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = true,
                ["data"] = {},
                ["id"] = 108,
                ["name"] = {
                    ["args"] = {
                        [1] = 10,
                    },
                    ["key"] = "AC_QUEST_GOLD",
                },
                ["quantity"] = 100000,
                ["type"] = 22,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 10,
            },
            ["key"] = "AD_QUEST_GOLD",
        },
        ["icon"] = "-Inv_Misc_Coin_06",
        ["id"] = 36,
        ["name"] = "AN_QUEST_GOLD10",
        ["nextID"] = 37,
        ["points"] = 10,
        ["previousID"] = 35,
    },
    [37] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 2,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = true,
                ["data"] = {},
                ["id"] = 109,
                ["name"] = {
                    ["args"] = {
                        [1] = 25,
                    },
                    ["key"] = "AC_QUEST_GOLD",
                },
                ["quantity"] = 250000,
                ["type"] = 22,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 25,
            },
            ["key"] = "AD_QUEST_GOLD",
        },
        ["icon"] = "-Inv_Misc_Coin_03",
        ["id"] = 37,
        ["name"] = "AN_QUEST_GOLD25",
        ["nextID"] = 38,
        ["points"] = 10,
        ["previousID"] = 36,
    },
    [38] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 2,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = true,
                ["data"] = {},
                ["id"] = 110,
                ["name"] = {
                    ["args"] = {
                        [1] = 50,
                    },
                    ["key"] = "AC_QUEST_GOLD",
                },
                ["quantity"] = 500000,
                ["type"] = 22,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 50,
            },
            ["key"] = "AD_QUEST_GOLD",
        },
        ["icon"] = "-Inv_Misc_Coin_04",
        ["id"] = 38,
        ["name"] = "AN_QUEST_GOLD50",
        ["nextID"] = 39,
        ["points"] = 10,
        ["previousID"] = 37,
    },
    [39] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 2,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = true,
                ["data"] = {},
                ["id"] = 111,
                ["name"] = {
                    ["args"] = {
                        [1] = 100,
                    },
                    ["key"] = "AC_QUEST_GOLD",
                },
                ["quantity"] = 1000000,
                ["type"] = 22,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 100,
            },
            ["key"] = "AD_QUEST_GOLD",
        },
        ["icon"] = "-Inv_Misc_Coin_01",
        ["id"] = 39,
        ["name"] = "AN_QUEST_GOLD100",
        ["nextID"] = 40,
        ["points"] = 10,
        ["previousID"] = 38,
    },
    [40] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 2,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = true,
                ["data"] = {},
                ["id"] = 112,
                ["name"] = {
                    ["args"] = {
                        [1] = 250,
                    },
                    ["key"] = "AC_QUEST_GOLD",
                },
                ["quantity"] = 2500000,
                ["type"] = 22,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 250,
            },
            ["key"] = "AD_QUEST_GOLD",
        },
        ["icon"] = "-Inv_Misc_Coin_02",
        ["id"] = 40,
        ["name"] = "AN_QUEST_GOLD250",
        ["nextID"] = 41,
        ["points"] = 10,
        ["previousID"] = 39,
    },
    [41] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 2,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = true,
                ["data"] = {},
                ["id"] = 113,
                ["name"] = {
                    ["args"] = {
                        [1] = 500,
                    },
                    ["key"] = "AC_QUEST_GOLD",
                },
                ["quantity"] = 5000000,
                ["type"] = 22,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 500,
            },
            ["key"] = "AD_QUEST_GOLD",
        },
        ["icon"] = "-Inv_Misc_Coin_02",
        ["id"] = 41,
        ["name"] = "AN_QUEST_GOLD500",
        ["points"] = 10,
        ["previousID"] = 40,
    },
    [42] = {
        ["selectors"] = {
            ["A:DRUID"] = 2,
            ["A:HUNTER"] = 2,
            ["A:MAGE"] = 2,
            ["A:PALADIN"] = 2,
            ["A:PRIEST"] = 2,
            ["A:ROGUE"] = 2,
            ["A:SHAMAN"] = 2,
            ["A:WARLOCK"] = 2,
            ["A:WARRIOR"] = 2,
            ["H:DRUID"] = 1,
            ["H:HUNTER"] = 1,
            ["H:MAGE"] = 1,
            ["H:PALADIN"] = 1,
            ["H:PRIEST"] = 1,
            ["H:ROGUE"] = 1,
            ["H:SHAMAN"] = 1,
            ["H:WARLOCK"] = 1,
            ["H:WARRIOR"] = 1,
        },
        ["variants"] = {
            [1] = {
                ["anyCompletable"] = false,
                ["categoryID"] = 3,
                ["criteria"] = {
                    [1] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 5511,
                        },
                        ["id"] = 114,
                        ["name"] = "",
                        ["type"] = 3,
                    },
                },
                ["description"] = "AD_SKELETON_KEY",
                ["icon"] = "-inv_misc_key_11",
                ["id"] = 42,
                ["name"] = "AN_SKELETON_KEY",
                ["points"] = 10,
            },
            [2] = {
                ["anyCompletable"] = false,
                ["categoryID"] = 3,
                ["criteria"] = {
                    [1] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 5505,
                        },
                        ["id"] = 114,
                        ["name"] = "",
                        ["type"] = 3,
                    },
                },
                ["description"] = "AD_SKELETON_KEY",
                ["icon"] = "-inv_misc_key_11",
                ["id"] = 42,
                ["name"] = "AN_SKELETON_KEY",
                ["points"] = 10,
            },
        },
    },
    [43] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 2,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 44,
                },
                ["id"] = 116,
                ["name"] = {
                    ["args"] = {
                        [1] = "DUROTAR_2",
                    },
                    ["key"] = "AN_QUESTS_ZONE",
                },
                ["type"] = 20,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 45,
                },
                ["id"] = 119,
                ["name"] = {
                    ["args"] = {
                        [1] = "BARRENS_2",
                    },
                    ["key"] = "AN_QUESTS_ZONE",
                },
                ["type"] = 20,
            },
            [3] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 46,
                },
                ["id"] = 121,
                ["name"] = {
                    ["args"] = {
                        [1] = "STONETALON_2",
                    },
                    ["key"] = "AN_QUESTS_ZONE",
                },
                ["type"] = 20,
            },
            [4] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 47,
                },
                ["id"] = 123,
                ["name"] = {
                    ["args"] = {
                        [1] = "DESOLACE_2",
                    },
                    ["key"] = "AN_QUESTS_ZONE",
                },
                ["type"] = 20,
            },
            [5] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 48,
                },
                ["id"] = 125,
                ["name"] = {
                    ["args"] = {
                        [1] = "THOUSAND_NEEDLES_2",
                    },
                    ["key"] = "AN_QUESTS_ZONE",
                },
                ["type"] = 20,
            },
            [6] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 49,
                },
                ["id"] = 127,
                ["name"] = {
                    ["args"] = {
                        [1] = "DUSTWALLOW_2",
                    },
                    ["key"] = "AN_QUESTS_ZONE",
                },
                ["type"] = 20,
            },
            [7] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 50,
                },
                ["id"] = 130,
                ["name"] = {
                    ["args"] = {
                        [1] = "FELWOOD_2",
                    },
                    ["key"] = "AN_QUESTS_ZONE",
                },
                ["type"] = 20,
            },
            [8] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 51,
                },
                ["id"] = 135,
                ["name"] = {
                    ["args"] = {
                        [1] = "TANARIS_2",
                    },
                    ["key"] = "AN_QUESTS_ZONE",
                },
                ["type"] = 20,
            },
            [9] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 52,
                },
                ["id"] = 139,
                ["name"] = {
                    ["args"] = {
                        [1] = "UNGORO_2",
                    },
                    ["key"] = "AN_QUESTS_ZONE",
                },
                ["type"] = 20,
            },
            [10] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 53,
                },
                ["id"] = 141,
                ["name"] = {
                    ["args"] = {
                        [1] = "AZSHARA_2",
                    },
                    ["key"] = "AN_QUESTS_ZONE",
                },
                ["type"] = 20,
            },
            [11] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 54,
                },
                ["id"] = 147,
                ["name"] = {
                    ["args"] = {
                        [1] = "WINTERSPRING_2",
                    },
                    ["key"] = "AN_QUESTS_ZONE",
                },
                ["type"] = 20,
            },
            [12] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 55,
                },
                ["id"] = 152,
                ["name"] = {
                    ["args"] = {
                        [1] = "SILITHUS_2",
                    },
                    ["key"] = "AN_QUESTS_ZONE",
                },
                ["type"] = 20,
            },
        },
        ["description"] = "AD_WISDOM_KEEPER_KALIMDOR",
        ["icon"] = "kalimdor",
        ["id"] = 43,
        ["name"] = "AN_WISDOM_KEEPER_KALIMDOR",
        ["points"] = 10,
    },
    [44] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 4,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 835,
                },
                ["id"] = 115,
                ["name"] = "",
                ["type"] = 3,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = "QUEST_835",
                [2] = "DUROTAR_1",
            },
            ["key"] = "AD_QUESTS_ZONE",
        },
        ["icon"] = "durotar",
        ["id"] = 44,
        ["name"] = {
            ["args"] = {
                [1] = "DUROTAR_2",
            },
            ["key"] = "AN_QUESTS_ZONE",
        },
        ["points"] = 10,
    },
    [45] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 4,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 888,
                },
                ["id"] = 117,
                ["name"] = {
                    ["args"] = {
                        [1] = "QUEST_888",
                    },
                    ["key"] = "AC_QUESTS_ZONE",
                },
                ["type"] = 3,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 902,
                },
                ["id"] = 118,
                ["name"] = {
                    ["args"] = {
                        [1] = "QUEST_902",
                    },
                    ["key"] = "AC_QUESTS_ZONE",
                },
                ["type"] = 3,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = "BARRENS_1",
            },
            ["key"] = "AD_QUESTS_ZONE_MULTI",
        },
        ["icon"] = "barrens",
        ["id"] = 45,
        ["name"] = {
            ["args"] = {
                [1] = "BARRENS_2",
            },
            ["key"] = "AN_QUESTS_ZONE",
        },
        ["points"] = 10,
    },
    [46] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 4,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1096,
                },
                ["id"] = 120,
                ["name"] = "",
                ["type"] = 3,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = "QUEST_1096",
                [2] = "STONETALON_1",
            },
            ["key"] = "AD_QUESTS_ZONE",
        },
        ["icon"] = "stonetalon",
        ["id"] = 46,
        ["name"] = {
            ["args"] = {
                [1] = "STONETALON_2",
            },
            ["key"] = "AN_QUESTS_ZONE",
        },
        ["points"] = 10,
    },
    [47] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 4,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 6027,
                },
                ["id"] = 122,
                ["name"] = "",
                ["type"] = 3,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = "QUEST_6027",
                [2] = "DESOLACE_1",
            },
            ["key"] = "AD_QUESTS_ZONE",
        },
        ["icon"] = "desolace",
        ["id"] = 47,
        ["name"] = {
            ["args"] = {
                [1] = "DESOLACE_2",
            },
            ["key"] = "AN_QUESTS_ZONE",
        },
        ["points"] = 10,
    },
    [48] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 4,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1189,
                },
                ["id"] = 124,
                ["name"] = "",
                ["type"] = 3,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = "QUEST_1189",
                [2] = "THOUSAND_NEEDLES_1",
            },
            ["key"] = "AD_QUESTS_ZONE",
        },
        ["icon"] = "thousand_needles",
        ["id"] = 48,
        ["name"] = {
            ["args"] = {
                [1] = "THOUSAND_NEEDLES_2",
            },
            ["key"] = "AN_QUESTS_ZONE",
        },
        ["points"] = 10,
    },
    [49] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 4,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1203,
                },
                ["id"] = 126,
                ["name"] = "",
                ["type"] = 3,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = "QUEST_1203",
                [2] = "DUSTWALLOW_1",
            },
            ["key"] = "AD_QUESTS_ZONE",
        },
        ["icon"] = "dustwallow",
        ["id"] = 49,
        ["name"] = {
            ["args"] = {
                [1] = "DUSTWALLOW_2",
            },
            ["key"] = "AN_QUESTS_ZONE",
        },
        ["points"] = 10,
    },
    [50] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 4,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 5165,
                },
                ["id"] = 128,
                ["name"] = {
                    ["args"] = {
                        [1] = "QUEST_5165",
                    },
                    ["key"] = "AC_QUESTS_ZONE",
                },
                ["type"] = 3,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 5385,
                },
                ["id"] = 129,
                ["name"] = {
                    ["args"] = {
                        [1] = "QUEST_5385",
                    },
                    ["key"] = "AC_QUESTS_ZONE",
                },
                ["type"] = 3,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = "FELWOOD_1",
            },
            ["key"] = "AD_QUESTS_ZONE_MULTI",
        },
        ["icon"] = "felwood",
        ["id"] = 50,
        ["name"] = {
            ["args"] = {
                [1] = "FELWOOD_2",
            },
            ["key"] = "AN_QUESTS_ZONE",
        },
        ["points"] = 10,
    },
    [51] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 4,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 2662,
                },
                ["id"] = 131,
                ["name"] = {
                    ["args"] = {
                        [1] = "QUEST_2662",
                    },
                    ["key"] = "AC_QUESTS_ZONE",
                },
                ["type"] = 3,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 2874,
                },
                ["id"] = 132,
                ["name"] = {
                    ["args"] = {
                        [1] = "QUEST_2874",
                    },
                    ["key"] = "AC_QUESTS_ZONE",
                },
                ["type"] = 3,
            },
            [3] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1691,
                },
                ["id"] = 133,
                ["name"] = {
                    ["args"] = {
                        [1] = "QUEST_1691",
                    },
                    ["key"] = "AC_QUESTS_ZONE",
                },
                ["type"] = 3,
            },
            [4] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 113,
                },
                ["id"] = 134,
                ["name"] = {
                    ["args"] = {
                        [1] = "QUEST_113",
                    },
                    ["key"] = "AC_QUESTS_ZONE",
                },
                ["type"] = 3,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = "TANARIS_1",
            },
            ["key"] = "AD_QUESTS_ZONE_MULTI",
        },
        ["icon"] = "tanaris",
        ["id"] = 51,
        ["name"] = {
            ["args"] = {
                [1] = "TANARIS_2",
            },
            ["key"] = "AN_QUESTS_ZONE",
        },
        ["points"] = 10,
    },
    [52] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 4,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 3962,
                },
                ["id"] = 136,
                ["name"] = {
                    ["args"] = {
                        [1] = "QUEST_3962",
                    },
                    ["key"] = "AC_QUESTS_ZONE",
                },
                ["type"] = 3,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 4245,
                },
                ["id"] = 137,
                ["name"] = {
                    ["args"] = {
                        [1] = "QUEST_4245",
                    },
                    ["key"] = "AC_QUESTS_ZONE",
                },
                ["type"] = 3,
            },
            [3] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 4292,
                },
                ["id"] = 138,
                ["name"] = {
                    ["args"] = {
                        [1] = "QUEST_4292",
                    },
                    ["key"] = "AC_QUESTS_ZONE",
                },
                ["type"] = 3,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = "UNGORO_1",
            },
            ["key"] = "AD_QUESTS_ZONE_MULTI",
        },
        ["icon"] = "ungoro",
        ["id"] = 52,
        ["name"] = {
            ["args"] = {
                [1] = "UNGORO_2",
            },
            ["key"] = "AN_QUESTS_ZONE",
        },
        ["points"] = 10,
    },
    [53] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 4,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 3602,
                },
                ["id"] = 140,
                ["name"] = "",
                ["type"] = 3,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = "QUEST_3602",
                [2] = "AZSHARA_1",
            },
            ["key"] = "AD_QUESTS_ZONE",
        },
        ["icon"] = "azshara",
        ["id"] = 53,
        ["name"] = {
            ["args"] = {
                [1] = "AZSHARA_2",
            },
            ["key"] = "AN_QUESTS_ZONE",
        },
        ["points"] = 10,
    },
    [54] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 4,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 975,
                },
                ["id"] = 142,
                ["name"] = {
                    ["args"] = {
                        [1] = "QUEST_975",
                    },
                    ["key"] = "AC_QUESTS_ZONE",
                },
                ["type"] = 3,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 5082,
                },
                ["id"] = 143,
                ["name"] = {
                    ["args"] = {
                        [1] = "QUEST_5082",
                    },
                    ["key"] = "AC_QUESTS_ZONE",
                },
                ["type"] = 3,
            },
            [3] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 5121,
                },
                ["id"] = 144,
                ["name"] = {
                    ["args"] = {
                        [1] = "QUEST_5121",
                    },
                    ["key"] = "AC_QUESTS_ZONE",
                },
                ["type"] = 3,
            },
            [4] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 5163,
                },
                ["id"] = 145,
                ["name"] = {
                    ["args"] = {
                        [1] = "QUEST_5163",
                    },
                    ["key"] = "AC_QUESTS_ZONE",
                },
                ["type"] = 3,
            },
            [5] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 4842,
                },
                ["id"] = 146,
                ["name"] = {
                    ["args"] = {
                        [1] = "QUEST_4842",
                    },
                    ["key"] = "AC_QUESTS_ZONE",
                },
                ["type"] = 3,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = "WINTERSPRING_1",
            },
            ["key"] = "AD_QUESTS_ZONE_MULTI",
        },
        ["icon"] = "winterspring",
        ["id"] = 54,
        ["name"] = {
            ["args"] = {
                [1] = "WINTERSPRING_2",
            },
            ["key"] = "AN_QUESTS_ZONE",
        },
        ["points"] = 10,
    },
    [55] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 4,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 8287,
                },
                ["id"] = 148,
                ["name"] = {
                    ["args"] = {
                        [1] = "QUEST_8287",
                    },
                    ["key"] = "AC_QUESTS_ZONE",
                },
                ["type"] = 3,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 8352,
                },
                ["id"] = 149,
                ["name"] = {
                    ["args"] = {
                        [1] = "QUEST_8352",
                    },
                    ["key"] = "AC_QUESTS_ZONE",
                },
                ["type"] = 3,
            },
            [3] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 8321,
                },
                ["id"] = 150,
                ["name"] = {
                    ["args"] = {
                        [1] = "QUEST_8321",
                    },
                    ["key"] = "AC_QUESTS_ZONE",
                },
                ["type"] = 3,
            },
            [4] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 8281,
                },
                ["id"] = 151,
                ["name"] = {
                    ["args"] = {
                        [1] = "QUEST_8281",
                    },
                    ["key"] = "AC_QUESTS_ZONE",
                },
                ["type"] = 3,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = "SILITHUS_1",
            },
            ["key"] = "AD_QUESTS_ZONE_MULTI",
        },
        ["icon"] = "silithus",
        ["id"] = 55,
        ["name"] = {
            ["args"] = {
                [1] = "SILITHUS_2",
            },
            ["key"] = "AN_QUESTS_ZONE",
        },
        ["points"] = 10,
    },
    [56] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 2,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 57,
                },
                ["id"] = 154,
                ["name"] = {
                    ["args"] = {
                        [1] = "ARATHI_2",
                    },
                    ["key"] = "AN_QUESTS_ZONE",
                },
                ["type"] = 20,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 58,
                },
                ["id"] = 160,
                ["name"] = {
                    ["args"] = {
                        [1] = "STRANGLETHORN_VALLEY_2",
                    },
                    ["key"] = "AN_QUESTS_ZONE",
                },
                ["type"] = 20,
            },
            [3] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 59,
                },
                ["id"] = 165,
                ["name"] = {
                    ["args"] = {
                        [1] = "BADLANDS_2",
                    },
                    ["key"] = "AN_QUESTS_ZONE",
                },
                ["type"] = 20,
            },
            [4] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 60,
                },
                ["id"] = 167,
                ["name"] = {
                    ["args"] = {
                        [1] = "SEARING_GORGE_2",
                    },
                    ["key"] = "AN_QUESTS_ZONE",
                },
                ["type"] = 20,
            },
            [5] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 61,
                },
                ["id"] = 169,
                ["name"] = {
                    ["args"] = {
                        [1] = "BLASTED_LANDS_2",
                    },
                    ["key"] = "AN_QUESTS_ZONE",
                },
                ["type"] = 20,
            },
            [6] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 62,
                },
                ["id"] = 173,
                ["name"] = {
                    ["args"] = {
                        [1] = "WESTERN_PLAGUELANDS_2",
                    },
                    ["key"] = "AN_QUESTS_ZONE",
                },
                ["type"] = 20,
            },
            [7] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 63,
                },
                ["id"] = 177,
                ["name"] = {
                    ["args"] = {
                        [1] = "EASTERN_PLAGUELANDS_2",
                    },
                    ["key"] = "AN_QUESTS_ZONE",
                },
                ["type"] = 20,
            },
        },
        ["description"] = "AD_WISDOM_KEEPER_EASTERN_KINGDOMS",
        ["icon"] = "eastern_kingdoms",
        ["id"] = 56,
        ["name"] = "AN_WISDOM_KEEPER_EASTERN_KINGDOMS",
        ["points"] = 10,
    },
    [57] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 3,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 652,
                },
                ["id"] = 153,
                ["name"] = "",
                ["type"] = 3,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = "QUEST_652",
                [2] = "ARATHI_1",
            },
            ["key"] = "AD_QUESTS_ZONE",
        },
        ["icon"] = "arathi",
        ["id"] = 57,
        ["name"] = {
            ["args"] = {
                [1] = "ARATHI_2",
            },
            ["key"] = "AN_QUESTS_ZONE",
        },
        ["points"] = 10,
    },
    [58] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 3,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 208,
                },
                ["id"] = 155,
                ["name"] = {
                    ["args"] = {
                        [1] = "QUEST_208",
                    },
                    ["key"] = "AC_QUESTS_ZONE",
                },
                ["type"] = 3,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 600,
                },
                ["id"] = 156,
                ["name"] = {
                    ["args"] = {
                        [1] = "QUEST_600",
                    },
                    ["key"] = "AC_QUESTS_ZONE",
                },
                ["type"] = 3,
            },
            [3] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 613,
                },
                ["id"] = 157,
                ["name"] = {
                    ["args"] = {
                        [1] = "QUEST_613",
                    },
                    ["key"] = "AC_QUESTS_ZONE",
                },
                ["type"] = 3,
            },
            [4] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 628,
                },
                ["id"] = 158,
                ["name"] = {
                    ["args"] = {
                        [1] = "QUEST_628",
                    },
                    ["key"] = "AC_QUESTS_ZONE",
                },
                ["type"] = 3,
            },
            [5] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 338,
                },
                ["id"] = 159,
                ["name"] = {
                    ["args"] = {
                        [1] = "QUEST_338",
                    },
                    ["key"] = "AC_QUESTS_ZONE",
                },
                ["type"] = 3,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = "STRANGLETHORN_VALLEY_1",
            },
            ["key"] = "AD_QUESTS_ZONE_MULTI",
        },
        ["icon"] = "stranglethorn_valley",
        ["id"] = 58,
        ["name"] = {
            ["args"] = {
                [1] = "STRANGLETHORN_VALLEY_2",
            },
            ["key"] = "AN_QUESTS_ZONE",
        },
        ["points"] = 10,
    },
    [59] = {
        ["selectors"] = {
            ["A:DRUID"] = 2,
            ["A:HUNTER"] = 2,
            ["A:MAGE"] = 2,
            ["A:PALADIN"] = 2,
            ["A:PRIEST"] = 2,
            ["A:ROGUE"] = 2,
            ["A:SHAMAN"] = 2,
            ["A:WARLOCK"] = 2,
            ["A:WARRIOR"] = 2,
            ["H:DRUID"] = 1,
            ["H:HUNTER"] = 1,
            ["H:MAGE"] = 1,
            ["H:PALADIN"] = 1,
            ["H:PRIEST"] = 1,
            ["H:ROGUE"] = 1,
            ["H:SHAMAN"] = 1,
            ["H:WARLOCK"] = 1,
            ["H:WARRIOR"] = 1,
        },
        ["variants"] = {
            [1] = {
                ["anyCompletable"] = false,
                ["categoryID"] = 3,
                ["criteria"] = {
                    [1] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 737,
                        },
                        ["id"] = 161,
                        ["name"] = {
                            ["args"] = {
                                [1] = "QUEST_737",
                            },
                            ["key"] = "AC_QUESTS_ZONE",
                        },
                        ["type"] = 3,
                    },
                    [2] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 778,
                        },
                        ["id"] = 162,
                        ["name"] = {
                            ["args"] = {
                                [1] = "QUEST_778",
                            },
                            ["key"] = "AC_QUESTS_ZONE",
                        },
                        ["type"] = 3,
                    },
                    [3] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 656,
                        },
                        ["id"] = 163,
                        ["name"] = {
                            ["args"] = {
                                [1] = "QUEST_656",
                            },
                            ["key"] = "AC_QUESTS_ZONE",
                        },
                        ["type"] = 3,
                    },
                    [4] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 793,
                        },
                        ["id"] = 164,
                        ["name"] = {
                            ["args"] = {
                                [1] = "QUEST_793",
                            },
                            ["key"] = "AC_QUESTS_ZONE",
                        },
                        ["type"] = 3,
                    },
                },
                ["description"] = {
                    ["args"] = {
                        [1] = "BADLANDS_1",
                    },
                    ["key"] = "AD_QUESTS_ZONE_MULTI",
                },
                ["icon"] = "badlands",
                ["id"] = 59,
                ["name"] = {
                    ["args"] = {
                        [1] = "BADLANDS_2",
                    },
                    ["key"] = "AN_QUESTS_ZONE",
                },
                ["points"] = 10,
            },
            [2] = {
                ["anyCompletable"] = false,
                ["categoryID"] = 3,
                ["criteria"] = {
                    [1] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 737,
                        },
                        ["id"] = 161,
                        ["name"] = {
                            ["args"] = {
                                [1] = "QUEST_737",
                            },
                            ["key"] = "AC_QUESTS_ZONE",
                        },
                        ["type"] = 3,
                    },
                    [2] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 778,
                        },
                        ["id"] = 162,
                        ["name"] = {
                            ["args"] = {
                                [1] = "QUEST_778",
                            },
                            ["key"] = "AC_QUESTS_ZONE",
                        },
                        ["type"] = 3,
                    },
                    [3] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 656,
                        },
                        ["id"] = 163,
                        ["name"] = {
                            ["args"] = {
                                [1] = "QUEST_656",
                            },
                            ["key"] = "AC_QUESTS_ZONE",
                        },
                        ["type"] = 3,
                    },
                    [4] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 717,
                        },
                        ["id"] = 164,
                        ["name"] = {
                            ["args"] = {
                                [1] = "QUEST_717",
                            },
                            ["key"] = "AC_QUESTS_ZONE",
                        },
                        ["type"] = 3,
                    },
                },
                ["description"] = {
                    ["args"] = {
                        [1] = "BADLANDS_1",
                    },
                    ["key"] = "AD_QUESTS_ZONE_MULTI",
                },
                ["icon"] = "badlands",
                ["id"] = 59,
                ["name"] = {
                    ["args"] = {
                        [1] = "BADLANDS_2",
                    },
                    ["key"] = "AN_QUESTS_ZONE",
                },
                ["points"] = 10,
            },
        },
    },
    [60] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 3,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 3481,
                },
                ["id"] = 166,
                ["name"] = "",
                ["type"] = 3,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = "QUEST_3481",
                [2] = "SEARING_GORGE_1",
            },
            ["key"] = "AD_QUESTS_ZONE",
        },
        ["icon"] = "searing_gorge",
        ["id"] = 60,
        ["name"] = {
            ["args"] = {
                [1] = "SEARING_GORGE_2",
            },
            ["key"] = "AN_QUESTS_ZONE",
        },
        ["points"] = 10,
    },
    [61] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 3,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 3628,
                },
                ["id"] = 168,
                ["name"] = "",
                ["type"] = 3,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = "QUEST_3628",
                [2] = "BLASTED_LANDS_1",
            },
            ["key"] = "AD_QUESTS_ZONE",
        },
        ["icon"] = "blasted_lands",
        ["id"] = 61,
        ["name"] = {
            ["args"] = {
                [1] = "BLASTED_LANDS_2",
            },
            ["key"] = "AN_QUESTS_ZONE",
        },
        ["points"] = 10,
    },
    [62] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 3,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 5944,
                },
                ["id"] = 170,
                ["name"] = {
                    ["args"] = {
                        [1] = "QUEST_5944",
                    },
                    ["key"] = "AC_QUESTS_ZONE",
                },
                ["type"] = 3,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 5051,
                },
                ["id"] = 171,
                ["name"] = {
                    ["args"] = {
                        [1] = "QUEST_5051",
                    },
                    ["key"] = "AC_QUESTS_ZONE",
                },
                ["type"] = 3,
            },
            [3] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 4985,
                },
                ["id"] = 172,
                ["name"] = {
                    ["args"] = {
                        [1] = "QUEST_4985",
                    },
                    ["key"] = "AC_QUESTS_ZONE",
                },
                ["type"] = 3,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = "WESTERN_PLAGUELANDS_1",
            },
            ["key"] = "AD_QUESTS_ZONE_MULTI",
        },
        ["icon"] = "western_plaguelands",
        ["id"] = 62,
        ["name"] = {
            ["args"] = {
                [1] = "WESTERN_PLAGUELANDS_2",
            },
            ["key"] = "AN_QUESTS_ZONE",
        },
        ["points"] = 10,
    },
    [63] = {
        ["selectors"] = {
            ["A:DRUID"] = 2,
            ["A:HUNTER"] = 2,
            ["A:MAGE"] = 2,
            ["A:PALADIN"] = 2,
            ["A:PRIEST"] = 2,
            ["A:ROGUE"] = 2,
            ["A:SHAMAN"] = 2,
            ["A:WARLOCK"] = 2,
            ["A:WARRIOR"] = 2,
            ["H:DRUID"] = 1,
            ["H:HUNTER"] = 1,
            ["H:MAGE"] = 1,
            ["H:PALADIN"] = 1,
            ["H:PRIEST"] = 1,
            ["H:ROGUE"] = 1,
            ["H:SHAMAN"] = 1,
            ["H:WARLOCK"] = 1,
            ["H:WARRIOR"] = 1,
        },
        ["variants"] = {
            [1] = {
                ["anyCompletable"] = false,
                ["categoryID"] = 3,
                ["criteria"] = {
                    [1] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 5942,
                        },
                        ["id"] = 174,
                        ["name"] = {
                            ["args"] = {
                                [1] = "QUEST_5942",
                            },
                            ["key"] = "AC_QUESTS_ZONE",
                        },
                        ["type"] = 3,
                    },
                    [2] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 6148,
                        },
                        ["id"] = 175,
                        ["name"] = {
                            ["args"] = {
                                [1] = "QUEST_6148",
                            },
                            ["key"] = "AC_QUESTS_ZONE",
                        },
                        ["type"] = 3,
                    },
                    [3] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 5265,
                        },
                        ["id"] = 176,
                        ["name"] = {
                            ["args"] = {
                                [1] = "QUEST_5265",
                            },
                            ["key"] = "AC_QUESTS_ZONE",
                        },
                        ["type"] = 3,
                    },
                },
                ["description"] = {
                    ["args"] = {
                        [1] = "EASTERN_PLAGUELANDS_1",
                    },
                    ["key"] = "AD_QUESTS_ZONE_MULTI",
                },
                ["icon"] = "eastern_plaguelands",
                ["id"] = 63,
                ["name"] = {
                    ["args"] = {
                        [1] = "EASTERN_PLAGUELANDS_2",
                    },
                    ["key"] = "AN_QUESTS_ZONE",
                },
                ["points"] = 10,
            },
            [2] = {
                ["anyCompletable"] = false,
                ["categoryID"] = 3,
                ["criteria"] = {
                    [1] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 5942,
                        },
                        ["id"] = 174,
                        ["name"] = {
                            ["args"] = {
                                [1] = "QUEST_5942",
                            },
                            ["key"] = "AC_QUESTS_ZONE",
                        },
                        ["type"] = 3,
                    },
                    [2] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 6187,
                        },
                        ["id"] = 175,
                        ["name"] = {
                            ["args"] = {
                                [1] = "QUEST_6187",
                            },
                            ["key"] = "AC_QUESTS_ZONE",
                        },
                        ["type"] = 3,
                    },
                    [3] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 5265,
                        },
                        ["id"] = 176,
                        ["name"] = {
                            ["args"] = {
                                [1] = "QUEST_5265",
                            },
                            ["key"] = "AC_QUESTS_ZONE",
                        },
                        ["type"] = 3,
                    },
                },
                ["description"] = {
                    ["args"] = {
                        [1] = "EASTERN_PLAGUELANDS_1",
                    },
                    ["key"] = "AD_QUESTS_ZONE_MULTI",
                },
                ["icon"] = "eastern_plaguelands",
                ["id"] = 63,
                ["name"] = {
                    ["args"] = {
                        [1] = "EASTERN_PLAGUELANDS_2",
                    },
                    ["key"] = "AN_QUESTS_ZONE",
                },
                ["points"] = 10,
            },
        },
    },
    [64] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 3,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 8996,
                },
                ["id"] = 178,
                ["name"] = "",
                ["type"] = 3,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = "QUEST_8996",
                [2] = "BLACK_ROCK_1",
            },
            ["key"] = "AD_QUESTS_ZONE",
        },
        ["icon"] = "black_rock",
        ["id"] = 64,
        ["name"] = {
            ["args"] = {
                [1] = "BLACK_ROCK_2",
            },
            ["key"] = "AN_QUESTS_ZONE",
        },
        ["points"] = 20,
    },
    [65] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 2,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 43,
                },
                ["id"] = 180,
                ["name"] = "AN_WISDOM_KEEPER_KALIMDOR",
                ["type"] = 20,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 56,
                },
                ["id"] = 181,
                ["name"] = "AN_WISDOM_KEEPER_EASTERN_KINGDOMS",
                ["type"] = 20,
            },
        },
        ["description"] = "AD_WISDOM_KEEPER_AZEROTH",
        ["icon"] = "-Inv_Misc_Book_09",
        ["id"] = 65,
        ["name"] = "AN_WISDOM_KEEPER_AZEROTH",
        ["points"] = 20,
    },
    [66] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 3,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 338,
                },
                ["id"] = 182,
                ["name"] = "",
                ["type"] = 3,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 208,
                },
                ["id"] = 6557,
                ["name"] = "",
                ["type"] = 3,
            },
        },
        ["description"] = "AD_NESINGWARY",
        ["icon"] = "-ability_mount_whitetiger",
        ["id"] = 66,
        ["name"] = "AN_NESINGWARY",
        ["points"] = 10,
    },
    [91] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 6,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 92,
                },
                ["id"] = 579,
                ["name"] = "AN_EXPLORE_KALIMDOR",
                ["type"] = 20,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 112,
                },
                ["id"] = 941,
                ["name"] = "AN_EXPLORE_EASTERN_KINGDOMS",
                ["type"] = 20,
            },
        },
        ["description"] = "AD_EXPLORE_AZEROTH",
        ["icon"] = "inv_misc_map02",
        ["id"] = 91,
        ["name"] = "AN_EXPLORE_AZEROTH",
        ["points"] = 30,
        ["rewardText"] = "TITLE_BUILTIN_EXPLORER_LABEL",
    },
    [92] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 6,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 93,
                },
                ["id"] = 313,
                ["name"] = {
                    ["args"] = {
                        [1] = {
                            ["areaID"] = 331,
                        },
                    },
                    ["key"] = "AN_EXPLORE",
                },
                ["type"] = 20,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 94,
                },
                ["id"] = 333,
                ["name"] = {
                    ["args"] = {
                        [1] = {
                            ["areaID"] = 16,
                        },
                    },
                    ["key"] = "AN_EXPLORE",
                },
                ["type"] = 20,
            },
            [3] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 95,
                },
                ["id"] = 343,
                ["name"] = {
                    ["args"] = {
                        [1] = {
                            ["areaID"] = 148,
                        },
                    },
                    ["key"] = "AN_EXPLORE",
                },
                ["type"] = 20,
            },
            [4] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 96,
                },
                ["id"] = 359,
                ["name"] = {
                    ["args"] = {
                        [1] = {
                            ["areaID"] = 405,
                        },
                    },
                    ["key"] = "AN_EXPLORE",
                },
                ["type"] = 20,
            },
            [5] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 97,
                },
                ["id"] = 371,
                ["name"] = {
                    ["args"] = {
                        [1] = {
                            ["areaID"] = 14,
                        },
                    },
                    ["key"] = "AN_EXPLORE",
                },
                ["type"] = 20,
            },
            [6] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 98,
                },
                ["id"] = 379,
                ["name"] = {
                    ["args"] = {
                        [1] = {
                            ["areaID"] = 15,
                        },
                    },
                    ["key"] = "AN_EXPLORE",
                },
                ["type"] = 20,
            },
            [7] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 99,
                },
                ["id"] = 392,
                ["name"] = {
                    ["args"] = {
                        [1] = {
                            ["areaID"] = 361,
                        },
                    },
                    ["key"] = "AN_EXPLORE",
                },
                ["type"] = 20,
            },
            [8] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 100,
                },
                ["id"] = 409,
                ["name"] = {
                    ["args"] = {
                        [1] = {
                            ["areaID"] = 357,
                        },
                    },
                    ["key"] = "AN_EXPLORE",
                },
                ["type"] = 20,
            },
            [9] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 101,
                },
                ["id"] = 424,
                ["name"] = {
                    ["args"] = {
                        [1] = {
                            ["areaID"] = 215,
                        },
                    },
                    ["key"] = "AN_EXPLORE",
                },
                ["type"] = 20,
            },
            [10] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 102,
                },
                ["id"] = 430,
                ["name"] = {
                    ["args"] = {
                        [1] = {
                            ["areaID"] = 1377,
                        },
                    },
                    ["key"] = "AN_EXPLORE",
                },
                ["type"] = 20,
            },
            [11] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 103,
                },
                ["id"] = 442,
                ["name"] = {
                    ["args"] = {
                        [1] = {
                            ["areaID"] = 406,
                        },
                    },
                    ["key"] = "AN_EXPLORE",
                },
                ["type"] = 20,
            },
            [12] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 104,
                },
                ["id"] = 463,
                ["name"] = {
                    ["args"] = {
                        [1] = {
                            ["areaID"] = 440,
                        },
                    },
                    ["key"] = "AN_EXPLORE",
                },
                ["type"] = 20,
            },
            [13] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 105,
                },
                ["id"] = 475,
                ["name"] = {
                    ["args"] = {
                        [1] = {
                            ["areaID"] = 141,
                        },
                    },
                    ["key"] = "AN_EXPLORE",
                },
                ["type"] = 20,
            },
            [14] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 106,
                },
                ["id"] = 501,
                ["name"] = {
                    ["args"] = {
                        [1] = {
                            ["areaID"] = 17,
                        },
                    },
                    ["key"] = "AN_EXPLORE",
                },
                ["type"] = 20,
            },
            [15] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 107,
                },
                ["id"] = 511,
                ["name"] = {
                    ["args"] = {
                        [1] = {
                            ["areaID"] = 400,
                        },
                    },
                    ["key"] = "AN_EXPLORE",
                },
                ["type"] = 20,
            },
            [16] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 108,
                },
                ["id"] = 519,
                ["name"] = {
                    ["args"] = {
                        [1] = {
                            ["areaID"] = 490,
                        },
                    },
                    ["key"] = "AN_EXPLORE",
                },
                ["type"] = 20,
            },
            [17] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 109,
                },
                ["id"] = 533,
                ["name"] = {
                    ["args"] = {
                        [1] = {
                            ["areaID"] = 618,
                        },
                    },
                    ["key"] = "AN_EXPLORE",
                },
                ["type"] = 20,
            },
        },
        ["description"] = "AD_EXPLORE_KALIMDOR",
        ["icon"] = "kalimdor",
        ["id"] = 92,
        ["name"] = "AN_EXPLORE_KALIMDOR",
        ["points"] = 20,
    },
    [93] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 8,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 441,
                },
                ["id"] = 296,
                ["name"] = {
                    ["areaID"] = 441,
                },
                ["type"] = 18,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 414,
                },
                ["id"] = 297,
                ["name"] = {
                    ["areaID"] = 414,
                },
                ["type"] = 18,
            },
            [3] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 2301,
                },
                ["id"] = 298,
                ["name"] = {
                    ["areaID"] = 2301,
                },
                ["type"] = 18,
            },
            [4] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 413,
                },
                ["id"] = 299,
                ["name"] = {
                    ["areaID"] = 413,
                },
                ["type"] = 18,
            },
            [5] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 417,
                },
                ["id"] = 300,
                ["name"] = {
                    ["areaID"] = 417,
                },
                ["type"] = 18,
            },
            [6] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 416,
                },
                ["id"] = 301,
                ["name"] = {
                    ["areaID"] = 416,
                },
                ["type"] = 18,
            },
            [7] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 424,
                },
                ["id"] = 302,
                ["name"] = {
                    ["areaID"] = 424,
                },
                ["type"] = 18,
            },
            [8] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 415,
                },
                ["id"] = 303,
                ["name"] = {
                    ["areaID"] = 415,
                },
                ["type"] = 18,
            },
            [9] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 421,
                },
                ["id"] = 304,
                ["name"] = {
                    ["areaID"] = 421,
                },
                ["type"] = 18,
            },
            [10] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 418,
                },
                ["id"] = 305,
                ["name"] = {
                    ["areaID"] = 418,
                },
                ["type"] = 18,
            },
            [11] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 426,
                },
                ["id"] = 306,
                ["name"] = {
                    ["areaID"] = 426,
                },
                ["type"] = 18,
            },
            [12] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 419,
                },
                ["id"] = 307,
                ["name"] = {
                    ["areaID"] = 419,
                },
                ["type"] = 18,
            },
            [13] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 422,
                },
                ["id"] = 308,
                ["name"] = {
                    ["areaID"] = 422,
                },
                ["type"] = 18,
            },
            [14] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 438,
                },
                ["id"] = 309,
                ["name"] = {
                    ["areaID"] = 438,
                },
                ["type"] = 18,
            },
            [15] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 430,
                },
                ["id"] = 310,
                ["name"] = {
                    ["areaID"] = 430,
                },
                ["type"] = 18,
            },
            [16] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 434,
                },
                ["id"] = 311,
                ["name"] = {
                    ["areaID"] = 434,
                },
                ["type"] = 18,
            },
            [17] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 437,
                },
                ["id"] = 312,
                ["name"] = {
                    ["areaID"] = 437,
                },
                ["type"] = 18,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = {
                    ["areaID"] = 331,
                },
            },
            ["key"] = "AD_EXPLORE",
        },
        ["icon"] = "ashenvale",
        ["id"] = 93,
        ["name"] = {
            ["args"] = {
                [1] = {
                    ["areaID"] = 331,
                },
            },
            ["key"] = "AN_EXPLORE",
        },
        ["points"] = 10,
    },
    [94] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 8,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1228,
                },
                ["id"] = 314,
                ["name"] = {
                    ["areaID"] = 1228,
                },
                ["type"] = 18,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1230,
                },
                ["id"] = 315,
                ["name"] = {
                    ["areaID"] = 1230,
                },
                ["type"] = 18,
            },
            [3] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 2497,
                },
                ["id"] = 316,
                ["name"] = {
                    ["areaID"] = 2497,
                },
                ["type"] = 18,
            },
            [4] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1229,
                },
                ["id"] = 317,
                ["name"] = {
                    ["areaID"] = 1229,
                },
                ["type"] = 18,
            },
            [5] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1226,
                },
                ["id"] = 318,
                ["name"] = {
                    ["areaID"] = 1226,
                },
                ["type"] = 18,
            },
            [6] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1219,
                },
                ["id"] = 319,
                ["name"] = {
                    ["areaID"] = 1219,
                },
                ["type"] = 18,
            },
            [7] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1220,
                },
                ["id"] = 320,
                ["name"] = {
                    ["areaID"] = 1220,
                },
                ["type"] = 18,
            },
            [8] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1225,
                },
                ["id"] = 321,
                ["name"] = {
                    ["areaID"] = 1225,
                },
                ["type"] = 18,
            },
            [9] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1216,
                },
                ["id"] = 322,
                ["name"] = {
                    ["areaID"] = 1216,
                },
                ["type"] = 18,
            },
            [10] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1237,
                },
                ["id"] = 323,
                ["name"] = {
                    ["areaID"] = 1237,
                },
                ["type"] = 18,
            },
            [11] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1236,
                },
                ["id"] = 324,
                ["name"] = {
                    ["areaID"] = 1236,
                },
                ["type"] = 18,
            },
            [12] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1235,
                },
                ["id"] = 325,
                ["name"] = {
                    ["areaID"] = 1235,
                },
                ["type"] = 18,
            },
            [13] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1221,
                },
                ["id"] = 326,
                ["name"] = {
                    ["areaID"] = 1221,
                },
                ["type"] = 18,
            },
            [14] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1231,
                },
                ["id"] = 327,
                ["name"] = {
                    ["areaID"] = 1231,
                },
                ["type"] = 18,
            },
            [15] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1232,
                },
                ["id"] = 328,
                ["name"] = {
                    ["areaID"] = 1232,
                },
                ["type"] = 18,
            },
            [16] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1234,
                },
                ["id"] = 329,
                ["name"] = {
                    ["areaID"] = 1234,
                },
                ["type"] = 18,
            },
            [17] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1256,
                },
                ["id"] = 330,
                ["name"] = {
                    ["areaID"] = 1256,
                },
                ["type"] = 18,
            },
            [18] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1233,
                },
                ["id"] = 331,
                ["name"] = {
                    ["areaID"] = 1233,
                },
                ["type"] = 18,
            },
            [19] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1227,
                },
                ["id"] = 332,
                ["name"] = {
                    ["areaID"] = 1227,
                },
                ["type"] = 18,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = {
                    ["areaID"] = 16,
                },
            },
            ["key"] = "AD_EXPLORE",
        },
        ["icon"] = "azshara",
        ["id"] = 94,
        ["name"] = {
            ["args"] = {
                [1] = {
                    ["areaID"] = 16,
                },
            },
            ["key"] = "AN_EXPLORE",
        },
        ["points"] = 10,
    },
    [95] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 8,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 443,
                },
                ["id"] = 334,
                ["name"] = {
                    ["areaID"] = 443,
                },
                ["type"] = 18,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 444,
                },
                ["id"] = 335,
                ["name"] = {
                    ["areaID"] = 444,
                },
                ["type"] = 18,
            },
            [3] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 456,
                },
                ["id"] = 336,
                ["name"] = {
                    ["areaID"] = 456,
                },
                ["type"] = 18,
            },
            [4] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 446,
                },
                ["id"] = 337,
                ["name"] = {
                    ["areaID"] = 446,
                },
                ["type"] = 18,
            },
            [5] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 447,
                },
                ["id"] = 338,
                ["name"] = {
                    ["areaID"] = 447,
                },
                ["type"] = 18,
            },
            [6] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 448,
                },
                ["id"] = 339,
                ["name"] = {
                    ["areaID"] = 448,
                },
                ["type"] = 18,
            },
            [7] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 450,
                },
                ["id"] = 340,
                ["name"] = {
                    ["areaID"] = 450,
                },
                ["type"] = 18,
            },
            [8] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 449,
                },
                ["id"] = 341,
                ["name"] = {
                    ["areaID"] = 449,
                },
                ["type"] = 18,
            },
            [9] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 442,
                },
                ["id"] = 342,
                ["name"] = {
                    ["areaID"] = 442,
                },
                ["type"] = 18,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = {
                    ["areaID"] = 148,
                },
            },
            ["key"] = "AD_EXPLORE",
        },
        ["icon"] = "darkshore",
        ["id"] = 95,
        ["name"] = {
            ["args"] = {
                [1] = {
                    ["areaID"] = 148,
                },
            },
            ["key"] = "AN_EXPLORE",
        },
        ["points"] = 10,
    },
    [96] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 8,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 608,
                },
                ["id"] = 344,
                ["name"] = {
                    ["areaID"] = 608,
                },
                ["type"] = 18,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 603,
                },
                ["id"] = 345,
                ["name"] = {
                    ["areaID"] = 603,
                },
                ["type"] = 18,
            },
            [3] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 599,
                },
                ["id"] = 346,
                ["name"] = {
                    ["areaID"] = 599,
                },
                ["type"] = 18,
            },
            [4] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 2407,
                },
                ["id"] = 347,
                ["name"] = {
                    ["areaID"] = 2407,
                },
                ["type"] = 18,
            },
            [5] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 609,
                },
                ["id"] = 348,
                ["name"] = {
                    ["areaID"] = 609,
                },
                ["type"] = 18,
            },
            [6] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 2405,
                },
                ["id"] = 349,
                ["name"] = {
                    ["areaID"] = 2405,
                },
                ["type"] = 18,
            },
            [7] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 607,
                },
                ["id"] = 350,
                ["name"] = {
                    ["areaID"] = 607,
                },
                ["type"] = 18,
            },
            [8] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 596,
                },
                ["id"] = 351,
                ["name"] = {
                    ["areaID"] = 596,
                },
                ["type"] = 18,
            },
            [9] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 2408,
                },
                ["id"] = 352,
                ["name"] = {
                    ["areaID"] = 2408,
                },
                ["type"] = 18,
            },
            [10] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 606,
                },
                ["id"] = 353,
                ["name"] = {
                    ["areaID"] = 606,
                },
                ["type"] = 18,
            },
            [11] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 602,
                },
                ["id"] = 354,
                ["name"] = {
                    ["areaID"] = 602,
                },
                ["type"] = 18,
            },
            [12] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 604,
                },
                ["id"] = 355,
                ["name"] = {
                    ["areaID"] = 604,
                },
                ["type"] = 18,
            },
            [13] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 2198,
                },
                ["id"] = 356,
                ["name"] = {
                    ["areaID"] = 2198,
                },
                ["type"] = 18,
            },
            [14] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 2406,
                },
                ["id"] = 357,
                ["name"] = {
                    ["areaID"] = 2406,
                },
                ["type"] = 18,
            },
            [15] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 2404,
                },
                ["id"] = 358,
                ["name"] = {
                    ["areaID"] = 2404,
                },
                ["type"] = 18,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = {
                    ["areaID"] = 405,
                },
            },
            ["key"] = "AD_EXPLORE",
        },
        ["icon"] = "desolace",
        ["id"] = 96,
        ["name"] = {
            ["args"] = {
                [1] = {
                    ["areaID"] = 405,
                },
            },
            ["key"] = "AN_EXPLORE",
        },
        ["points"] = 10,
    },
    [97] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 8,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 367,
                },
                ["id"] = 360,
                ["name"] = {
                    ["areaID"] = 367,
                },
                ["type"] = 18,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 366,
                },
                ["id"] = 361,
                ["name"] = {
                    ["areaID"] = 366,
                },
                ["type"] = 18,
            },
            [3] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 368,
                },
                ["id"] = 362,
                ["name"] = {
                    ["areaID"] = 368,
                },
                ["type"] = 18,
            },
            [4] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 372,
                },
                ["id"] = 363,
                ["name"] = {
                    ["areaID"] = 372,
                },
                ["type"] = 18,
            },
            [5] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 362,
                },
                ["id"] = 364,
                ["name"] = {
                    ["areaID"] = 362,
                },
                ["type"] = 18,
            },
            [6] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 816,
                },
                ["id"] = 365,
                ["name"] = {
                    ["areaID"] = 816,
                },
                ["type"] = 18,
            },
            [7] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 369,
                },
                ["id"] = 366,
                ["name"] = {
                    ["areaID"] = 369,
                },
                ["type"] = 18,
            },
            [8] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 370,
                },
                ["id"] = 367,
                ["name"] = {
                    ["areaID"] = 370,
                },
                ["type"] = 18,
            },
            [9] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 817,
                },
                ["id"] = 368,
                ["name"] = {
                    ["areaID"] = 817,
                },
                ["type"] = 18,
            },
            [10] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1637,
                },
                ["id"] = 369,
                ["name"] = {
                    ["areaID"] = 1637,
                },
                ["type"] = 18,
            },
            [11] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 363,
                },
                ["id"] = 370,
                ["name"] = {
                    ["areaID"] = 363,
                },
                ["type"] = 18,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = {
                    ["areaID"] = 14,
                },
            },
            ["key"] = "AD_EXPLORE",
        },
        ["icon"] = "durotar",
        ["id"] = 97,
        ["name"] = {
            ["args"] = {
                [1] = {
                    ["areaID"] = 14,
                },
            },
            ["key"] = "AN_EXPLORE",
        },
        ["points"] = 10,
    },
    [98] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 8,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 502,
                },
                ["id"] = 372,
                ["name"] = {
                    ["areaID"] = 502,
                },
                ["type"] = 18,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 496,
                },
                ["id"] = 373,
                ["name"] = {
                    ["areaID"] = 496,
                },
                ["type"] = 18,
            },
            [3] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 2302,
                },
                ["id"] = 374,
                ["name"] = {
                    ["areaID"] = 2302,
                },
                ["type"] = 18,
            },
            [4] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 509,
                },
                ["id"] = 375,
                ["name"] = {
                    ["areaID"] = 509,
                },
                ["type"] = 18,
            },
            [5] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 511,
                },
                ["id"] = 376,
                ["name"] = {
                    ["areaID"] = 511,
                },
                ["type"] = 18,
            },
            [6] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 2079,
                },
                ["id"] = 377,
                ["name"] = {
                    ["areaID"] = 2079,
                },
                ["type"] = 18,
            },
            [7] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 513,
                },
                ["id"] = 378,
                ["name"] = {
                    ["areaID"] = 513,
                },
                ["type"] = 18,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = {
                    ["areaID"] = 15,
                },
            },
            ["key"] = "AD_EXPLORE",
        },
        ["icon"] = "dustwallow",
        ["id"] = 98,
        ["name"] = {
            ["args"] = {
                [1] = {
                    ["areaID"] = 15,
                },
            },
            ["key"] = "AN_EXPLORE",
        },
        ["points"] = 10,
    },
    [99] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 8,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1998,
                },
                ["id"] = 380,
                ["name"] = {
                    ["areaID"] = 1998,
                },
                ["type"] = 18,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1762,
                },
                ["id"] = 381,
                ["name"] = {
                    ["areaID"] = 1762,
                },
                ["type"] = 18,
            },
            [3] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 2618,
                },
                ["id"] = 382,
                ["name"] = {
                    ["areaID"] = 2618,
                },
                ["type"] = 18,
            },
            [4] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1767,
                },
                ["id"] = 383,
                ["name"] = {
                    ["areaID"] = 1767,
                },
                ["type"] = 18,
            },
            [5] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1765,
                },
                ["id"] = 384,
                ["name"] = {
                    ["areaID"] = 1765,
                },
                ["type"] = 18,
            },
            [6] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1766,
                },
                ["id"] = 385,
                ["name"] = {
                    ["areaID"] = 1766,
                },
                ["type"] = 18,
            },
            [7] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 2481,
                },
                ["id"] = 386,
                ["name"] = {
                    ["areaID"] = 2481,
                },
                ["type"] = 18,
            },
            [8] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1763,
                },
                ["id"] = 387,
                ["name"] = {
                    ["areaID"] = 1763,
                },
                ["type"] = 18,
            },
            [9] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 2479,
                },
                ["id"] = 388,
                ["name"] = {
                    ["areaID"] = 2479,
                },
                ["type"] = 18,
            },
            [10] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 2480,
                },
                ["id"] = 389,
                ["name"] = {
                    ["areaID"] = 2480,
                },
                ["type"] = 18,
            },
            [11] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 2478,
                },
                ["id"] = 390,
                ["name"] = {
                    ["areaID"] = 2478,
                },
                ["type"] = 18,
            },
            [12] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1761,
                },
                ["id"] = 391,
                ["name"] = {
                    ["areaID"] = 1761,
                },
                ["type"] = 18,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = {
                    ["areaID"] = 361,
                },
            },
            ["key"] = "AD_EXPLORE",
        },
        ["icon"] = "felwood",
        ["id"] = 99,
        ["name"] = {
            ["args"] = {
                [1] = {
                    ["areaID"] = 361,
                },
            },
            ["key"] = "AN_EXPLORE",
        },
        ["points"] = 10,
    },
    [100] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 8,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1137,
                },
                ["id"] = 393,
                ["name"] = {
                    ["areaID"] = 1137,
                },
                ["type"] = 18,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1111,
                },
                ["id"] = 394,
                ["name"] = {
                    ["areaID"] = 1111,
                },
                ["type"] = 18,
            },
            [3] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1114,
                },
                ["id"] = 395,
                ["name"] = {
                    ["areaID"] = 1114,
                },
                ["type"] = 18,
            },
            [4] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1113,
                },
                ["id"] = 396,
                ["name"] = {
                    ["areaID"] = 1113,
                },
                ["type"] = 18,
            },
            [5] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1108,
                },
                ["id"] = 397,
                ["name"] = {
                    ["areaID"] = 1108,
                },
                ["type"] = 18,
            },
            [6] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1119,
                },
                ["id"] = 398,
                ["name"] = {
                    ["areaID"] = 1119,
                },
                ["type"] = 18,
            },
            [7] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1105,
                },
                ["id"] = 399,
                ["name"] = {
                    ["areaID"] = 1105,
                },
                ["type"] = 18,
            },
            [8] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 2577,
                },
                ["id"] = 400,
                ["name"] = {
                    ["areaID"] = 2577,
                },
                ["type"] = 18,
            },
            [9] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 2522,
                },
                ["id"] = 401,
                ["name"] = {
                    ["areaID"] = 2522,
                },
                ["type"] = 18,
            },
            [10] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1106,
                },
                ["id"] = 402,
                ["name"] = {
                    ["areaID"] = 1106,
                },
                ["type"] = 18,
            },
            [11] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1099,
                },
                ["id"] = 403,
                ["name"] = {
                    ["areaID"] = 1099,
                },
                ["type"] = 18,
            },
            [12] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1101,
                },
                ["id"] = 404,
                ["name"] = {
                    ["areaID"] = 1101,
                },
                ["type"] = 18,
            },
            [13] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1103,
                },
                ["id"] = 405,
                ["name"] = {
                    ["areaID"] = 1103,
                },
                ["type"] = 18,
            },
            [14] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1100,
                },
                ["id"] = 406,
                ["name"] = {
                    ["areaID"] = 1100,
                },
                ["type"] = 18,
            },
            [15] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1121,
                },
                ["id"] = 407,
                ["name"] = {
                    ["areaID"] = 1121,
                },
                ["type"] = 18,
            },
            [16] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1120,
                },
                ["id"] = 408,
                ["name"] = {
                    ["areaID"] = 1120,
                },
                ["type"] = 18,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = {
                    ["areaID"] = 357,
                },
            },
            ["key"] = "AD_EXPLORE",
        },
        ["icon"] = "feralas",
        ["id"] = 100,
        ["name"] = {
            ["args"] = {
                [1] = {
                    ["areaID"] = 357,
                },
            },
            ["key"] = "AN_EXPLORE",
        },
        ["points"] = 10,
    },
    [101] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 8,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 818,
                },
                ["id"] = 410,
                ["name"] = {
                    ["areaID"] = 818,
                },
                ["type"] = 18,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 220,
                },
                ["id"] = 411,
                ["name"] = {
                    ["areaID"] = 220,
                },
                ["type"] = 18,
            },
            [3] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 396,
                },
                ["id"] = 412,
                ["name"] = {
                    ["areaID"] = 396,
                },
                ["type"] = 18,
            },
            [4] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 222,
                },
                ["id"] = 413,
                ["name"] = {
                    ["areaID"] = 222,
                },
                ["type"] = 18,
            },
            [5] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 360,
                },
                ["id"] = 414,
                ["name"] = {
                    ["areaID"] = 360,
                },
                ["type"] = 18,
            },
            [6] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 821,
                },
                ["id"] = 415,
                ["name"] = {
                    ["areaID"] = 821,
                },
                ["type"] = 18,
            },
            [7] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 820,
                },
                ["id"] = 416,
                ["name"] = {
                    ["areaID"] = 820,
                },
                ["type"] = 18,
            },
            [8] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 224,
                },
                ["id"] = 417,
                ["name"] = {
                    ["areaID"] = 224,
                },
                ["type"] = 18,
            },
            [9] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 404,
                },
                ["id"] = 418,
                ["name"] = {
                    ["areaID"] = 404,
                },
                ["type"] = 18,
            },
            [10] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 397,
                },
                ["id"] = 419,
                ["name"] = {
                    ["areaID"] = 397,
                },
                ["type"] = 18,
            },
            [11] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 819,
                },
                ["id"] = 420,
                ["name"] = {
                    ["areaID"] = 819,
                },
                ["type"] = 18,
            },
            [12] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 225,
                },
                ["id"] = 421,
                ["name"] = {
                    ["areaID"] = 225,
                },
                ["type"] = 18,
            },
            [13] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1638,
                },
                ["id"] = 422,
                ["name"] = {
                    ["areaID"] = 1638,
                },
                ["type"] = 18,
            },
            [14] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 398,
                },
                ["id"] = 423,
                ["name"] = {
                    ["areaID"] = 398,
                },
                ["type"] = 18,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = {
                    ["areaID"] = 215,
                },
            },
            ["key"] = "AD_EXPLORE",
        },
        ["icon"] = "mulgore",
        ["id"] = 101,
        ["name"] = {
            ["args"] = {
                [1] = {
                    ["areaID"] = 215,
                },
            },
            ["key"] = "AN_EXPLORE",
        },
        ["points"] = 10,
    },
    [102] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 8,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 3425,
                },
                ["id"] = 425,
                ["name"] = {
                    ["areaID"] = 3425,
                },
                ["type"] = 18,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 2743,
                },
                ["id"] = 426,
                ["name"] = {
                    ["areaID"] = 2743,
                },
                ["type"] = 18,
            },
            [3] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 2744,
                },
                ["id"] = 427,
                ["name"] = {
                    ["areaID"] = 2744,
                },
                ["type"] = 18,
            },
            [4] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 2737,
                },
                ["id"] = 428,
                ["name"] = {
                    ["areaID"] = 2737,
                },
                ["type"] = 18,
            },
            [5] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 2740,
                },
                ["id"] = 429,
                ["name"] = {
                    ["areaID"] = 2740,
                },
                ["type"] = 18,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = {
                    ["areaID"] = 1377,
                },
            },
            ["key"] = "AD_EXPLORE",
        },
        ["icon"] = "silithus",
        ["id"] = 102,
        ["name"] = {
            ["args"] = {
                [1] = {
                    ["areaID"] = 1377,
                },
            },
            ["key"] = "AN_EXPLORE",
        },
        ["points"] = 10,
    },
    [103] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 8,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 2537,
                },
                ["id"] = 431,
                ["name"] = {
                    ["areaID"] = 2537,
                },
                ["type"] = 18,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 2539,
                },
                ["id"] = 432,
                ["name"] = {
                    ["areaID"] = 2539,
                },
                ["type"] = 18,
            },
            [3] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1076,
                },
                ["id"] = 433,
                ["name"] = {
                    ["areaID"] = 1076,
                },
                ["type"] = 18,
            },
            [4] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 2540,
                },
                ["id"] = 434,
                ["name"] = {
                    ["areaID"] = 2540,
                },
                ["type"] = 18,
            },
            [5] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 2541,
                },
                ["id"] = 435,
                ["name"] = {
                    ["areaID"] = 2541,
                },
                ["type"] = 18,
            },
            [6] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 461,
                },
                ["id"] = 436,
                ["name"] = {
                    ["areaID"] = 461,
                },
                ["type"] = 18,
            },
            [7] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 460,
                },
                ["id"] = 437,
                ["name"] = {
                    ["areaID"] = 460,
                },
                ["type"] = 18,
            },
            [8] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 465,
                },
                ["id"] = 438,
                ["name"] = {
                    ["areaID"] = 465,
                },
                ["type"] = 18,
            },
            [9] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 464,
                },
                ["id"] = 439,
                ["name"] = {
                    ["areaID"] = 464,
                },
                ["type"] = 18,
            },
            [10] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 467,
                },
                ["id"] = 440,
                ["name"] = {
                    ["areaID"] = 467,
                },
                ["type"] = 18,
            },
            [11] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 2538,
                },
                ["id"] = 441,
                ["name"] = {
                    ["areaID"] = 2538,
                },
                ["type"] = 18,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = {
                    ["areaID"] = 406,
                },
            },
            ["key"] = "AD_EXPLORE",
        },
        ["icon"] = "stonetalon",
        ["id"] = 103,
        ["name"] = {
            ["args"] = {
                [1] = {
                    ["areaID"] = 406,
                },
            },
            ["key"] = "AN_EXPLORE",
        },
        ["points"] = 10,
    },
    [104] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 8,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 979,
                },
                ["id"] = 443,
                ["name"] = {
                    ["areaID"] = 979,
                },
                ["type"] = 18,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 976,
                },
                ["id"] = 444,
                ["name"] = {
                    ["areaID"] = 976,
                },
                ["type"] = 18,
            },
            [3] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 977,
                },
                ["id"] = 445,
                ["name"] = {
                    ["areaID"] = 977,
                },
                ["type"] = 18,
            },
            [4] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1937,
                },
                ["id"] = 446,
                ["name"] = {
                    ["areaID"] = 1937,
                },
                ["type"] = 18,
            },
            [5] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1336,
                },
                ["id"] = 447,
                ["name"] = {
                    ["areaID"] = 1336,
                },
                ["type"] = 18,
            },
            [6] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 986,
                },
                ["id"] = 448,
                ["name"] = {
                    ["areaID"] = 986,
                },
                ["type"] = 18,
            },
            [7] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1939,
                },
                ["id"] = 449,
                ["name"] = {
                    ["areaID"] = 1939,
                },
                ["type"] = 18,
            },
            [8] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 985,
                },
                ["id"] = 450,
                ["name"] = {
                    ["areaID"] = 985,
                },
                ["type"] = 18,
            },
            [9] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 982,
                },
                ["id"] = 451,
                ["name"] = {
                    ["areaID"] = 982,
                },
                ["type"] = 18,
            },
            [10] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1938,
                },
                ["id"] = 452,
                ["name"] = {
                    ["areaID"] = 1938,
                },
                ["type"] = 18,
            },
            [11] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1940,
                },
                ["id"] = 453,
                ["name"] = {
                    ["areaID"] = 1940,
                },
                ["type"] = 18,
            },
            [12] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 983,
                },
                ["id"] = 454,
                ["name"] = {
                    ["areaID"] = 983,
                },
                ["type"] = 18,
            },
            [13] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 984,
                },
                ["id"] = 455,
                ["name"] = {
                    ["areaID"] = 984,
                },
                ["type"] = 18,
            },
            [14] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 981,
                },
                ["id"] = 456,
                ["name"] = {
                    ["areaID"] = 981,
                },
                ["type"] = 18,
            },
            [15] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 992,
                },
                ["id"] = 457,
                ["name"] = {
                    ["areaID"] = 992,
                },
                ["type"] = 18,
            },
            [16] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 987,
                },
                ["id"] = 458,
                ["name"] = {
                    ["areaID"] = 987,
                },
                ["type"] = 18,
            },
            [17] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 980,
                },
                ["id"] = 459,
                ["name"] = {
                    ["areaID"] = 980,
                },
                ["type"] = 18,
            },
            [18] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 990,
                },
                ["id"] = 460,
                ["name"] = {
                    ["areaID"] = 990,
                },
                ["type"] = 18,
            },
            [19] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 2300,
                },
                ["id"] = 461,
                ["name"] = {
                    ["areaID"] = 2300,
                },
                ["type"] = 18,
            },
            [20] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 978,
                },
                ["id"] = 462,
                ["name"] = {
                    ["areaID"] = 978,
                },
                ["type"] = 18,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = {
                    ["areaID"] = 440,
                },
            },
            ["key"] = "AD_EXPLORE",
        },
        ["icon"] = "tanaris",
        ["id"] = 104,
        ["name"] = {
            ["args"] = {
                [1] = {
                    ["areaID"] = 440,
                },
            },
            ["key"] = "AN_EXPLORE",
        },
        ["points"] = 10,
    },
    [105] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 8,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 736,
                },
                ["id"] = 464,
                ["name"] = {
                    ["areaID"] = 736,
                },
                ["type"] = 18,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 186,
                },
                ["id"] = 465,
                ["name"] = {
                    ["areaID"] = 186,
                },
                ["type"] = 18,
            },
            [3] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 261,
                },
                ["id"] = 466,
                ["name"] = {
                    ["areaID"] = 261,
                },
                ["type"] = 18,
            },
            [4] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 259,
                },
                ["id"] = 467,
                ["name"] = {
                    ["areaID"] = 259,
                },
                ["type"] = 18,
            },
            [5] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 478,
                },
                ["id"] = 468,
                ["name"] = {
                    ["areaID"] = 478,
                },
                ["type"] = 18,
            },
            [6] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 260,
                },
                ["id"] = 469,
                ["name"] = {
                    ["areaID"] = 260,
                },
                ["type"] = 18,
            },
            [7] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 264,
                },
                ["id"] = 470,
                ["name"] = {
                    ["areaID"] = 264,
                },
                ["type"] = 18,
            },
            [8] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 266,
                },
                ["id"] = 471,
                ["name"] = {
                    ["areaID"] = 266,
                },
                ["type"] = 18,
            },
            [9] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1657,
                },
                ["id"] = 472,
                ["name"] = {
                    ["areaID"] = 1657,
                },
                ["type"] = 18,
            },
            [10] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 702,
                },
                ["id"] = 473,
                ["name"] = {
                    ["areaID"] = 702,
                },
                ["type"] = 18,
            },
            [11] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 188,
                },
                ["id"] = 474,
                ["name"] = {
                    ["areaID"] = 188,
                },
                ["type"] = 18,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = {
                    ["areaID"] = 141,
                },
            },
            ["key"] = "AD_EXPLORE",
        },
        ["icon"] = "teldrassil",
        ["id"] = 105,
        ["name"] = {
            ["args"] = {
                [1] = {
                    ["areaID"] = 141,
                },
            },
            ["key"] = "AN_EXPLORE",
        },
        ["points"] = 10,
    },
    [106] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 8,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 382,
                },
                ["id"] = 476,
                ["name"] = {
                    ["areaID"] = 382,
                },
                ["type"] = 18,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1703,
                },
                ["id"] = 477,
                ["name"] = {
                    ["areaID"] = 1703,
                },
                ["type"] = 18,
            },
            [3] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 384,
                },
                ["id"] = 478,
                ["name"] = {
                    ["areaID"] = 384,
                },
                ["type"] = 18,
            },
            [4] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 383,
                },
                ["id"] = 479,
                ["name"] = {
                    ["areaID"] = 383,
                },
                ["type"] = 18,
            },
            [5] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 386,
                },
                ["id"] = 480,
                ["name"] = {
                    ["areaID"] = 386,
                },
                ["type"] = 18,
            },
            [6] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1702,
                },
                ["id"] = 481,
                ["name"] = {
                    ["areaID"] = 1702,
                },
                ["type"] = 18,
            },
            [7] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1704,
                },
                ["id"] = 482,
                ["name"] = {
                    ["areaID"] = 1704,
                },
                ["type"] = 18,
            },
            [8] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 379,
                },
                ["id"] = 483,
                ["name"] = {
                    ["areaID"] = 379,
                },
                ["type"] = 18,
            },
            [9] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1699,
                },
                ["id"] = 484,
                ["name"] = {
                    ["areaID"] = 1699,
                },
                ["type"] = 18,
            },
            [10] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 380,
                },
                ["id"] = 485,
                ["name"] = {
                    ["areaID"] = 380,
                },
                ["type"] = 18,
            },
            [11] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 388,
                },
                ["id"] = 486,
                ["name"] = {
                    ["areaID"] = 388,
                },
                ["type"] = 18,
            },
            [12] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 392,
                },
                ["id"] = 487,
                ["name"] = {
                    ["areaID"] = 392,
                },
                ["type"] = 18,
            },
            [13] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 391,
                },
                ["id"] = 488,
                ["name"] = {
                    ["areaID"] = 391,
                },
                ["type"] = 18,
            },
            [14] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 385,
                },
                ["id"] = 489,
                ["name"] = {
                    ["areaID"] = 385,
                },
                ["type"] = 18,
            },
            [15] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1697,
                },
                ["id"] = 490,
                ["name"] = {
                    ["areaID"] = 1697,
                },
                ["type"] = 18,
            },
            [16] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 387,
                },
                ["id"] = 491,
                ["name"] = {
                    ["areaID"] = 387,
                },
                ["type"] = 18,
            },
            [17] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1700,
                },
                ["id"] = 492,
                ["name"] = {
                    ["areaID"] = 1700,
                },
                ["type"] = 18,
            },
            [18] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1698,
                },
                ["id"] = 493,
                ["name"] = {
                    ["areaID"] = 1698,
                },
                ["type"] = 18,
            },
            [19] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 378,
                },
                ["id"] = 494,
                ["name"] = {
                    ["areaID"] = 378,
                },
                ["type"] = 18,
            },
            [20] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 390,
                },
                ["id"] = 495,
                ["name"] = {
                    ["areaID"] = 390,
                },
                ["type"] = 18,
            },
            [21] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1701,
                },
                ["id"] = 496,
                ["name"] = {
                    ["areaID"] = 1701,
                },
                ["type"] = 18,
            },
            [22] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 359,
                },
                ["id"] = 497,
                ["name"] = {
                    ["areaID"] = 359,
                },
                ["type"] = 18,
            },
            [23] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1717,
                },
                ["id"] = 498,
                ["name"] = {
                    ["areaID"] = 1717,
                },
                ["type"] = 18,
            },
            [24] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1316,
                },
                ["id"] = 499,
                ["name"] = {
                    ["areaID"] = 1316,
                },
                ["type"] = 18,
            },
            [25] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 381,
                },
                ["id"] = 500,
                ["name"] = {
                    ["areaID"] = 381,
                },
                ["type"] = 18,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = {
                    ["areaID"] = 17,
                },
            },
            ["key"] = "AD_EXPLORE",
        },
        ["icon"] = "barrens",
        ["id"] = 106,
        ["name"] = {
            ["args"] = {
                [1] = {
                    ["areaID"] = 17,
                },
            },
            ["key"] = "AN_EXPLORE",
        },
        ["points"] = 10,
    },
    [107] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 8,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 2097,
                },
                ["id"] = 502,
                ["name"] = {
                    ["areaID"] = 2097,
                },
                ["type"] = 18,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 483,
                },
                ["id"] = 503,
                ["name"] = {
                    ["areaID"] = 483,
                },
                ["type"] = 18,
            },
            [3] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 484,
                },
                ["id"] = 504,
                ["name"] = {
                    ["areaID"] = 484,
                },
                ["type"] = 18,
            },
            [4] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 481,
                },
                ["id"] = 505,
                ["name"] = {
                    ["areaID"] = 481,
                },
                ["type"] = 18,
            },
            [5] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 2303,
                },
                ["id"] = 506,
                ["name"] = {
                    ["areaID"] = 2303,
                },
                ["type"] = 18,
            },
            [6] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 439,
                },
                ["id"] = 507,
                ["name"] = {
                    ["areaID"] = 439,
                },
                ["type"] = 18,
            },
            [7] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 480,
                },
                ["id"] = 508,
                ["name"] = {
                    ["areaID"] = 480,
                },
                ["type"] = 18,
            },
            [8] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 482,
                },
                ["id"] = 509,
                ["name"] = {
                    ["areaID"] = 482,
                },
                ["type"] = 18,
            },
            [9] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 485,
                },
                ["id"] = 510,
                ["name"] = {
                    ["areaID"] = 485,
                },
                ["type"] = 18,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = {
                    ["areaID"] = 400,
                },
            },
            ["key"] = "AD_EXPLORE",
        },
        ["icon"] = "thousand_needles",
        ["id"] = 107,
        ["name"] = {
            ["args"] = {
                [1] = {
                    ["areaID"] = 400,
                },
            },
            ["key"] = "AN_EXPLORE",
        },
        ["points"] = 10,
    },
    [108] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 8,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 543,
                },
                ["id"] = 512,
                ["name"] = {
                    ["areaID"] = 543,
                },
                ["type"] = 18,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 539,
                },
                ["id"] = 513,
                ["name"] = {
                    ["areaID"] = 539,
                },
                ["type"] = 18,
            },
            [3] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 540,
                },
                ["id"] = 514,
                ["name"] = {
                    ["areaID"] = 540,
                },
                ["type"] = 18,
            },
            [4] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1942,
                },
                ["id"] = 515,
                ["name"] = {
                    ["areaID"] = 1942,
                },
                ["type"] = 18,
            },
            [5] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1943,
                },
                ["id"] = 516,
                ["name"] = {
                    ["areaID"] = 1943,
                },
                ["type"] = 18,
            },
            [6] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 538,
                },
                ["id"] = 517,
                ["name"] = {
                    ["areaID"] = 538,
                },
                ["type"] = 18,
            },
            [7] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 537,
                },
                ["id"] = 518,
                ["name"] = {
                    ["areaID"] = 537,
                },
                ["type"] = 18,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = {
                    ["areaID"] = 490,
                },
            },
            ["key"] = "AD_EXPLORE",
        },
        ["icon"] = "ungoro",
        ["id"] = 108,
        ["name"] = {
            ["args"] = {
                [1] = {
                    ["areaID"] = 490,
                },
            },
            ["key"] = "AN_EXPLORE",
        },
        ["points"] = 10,
    },
    [109] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 8,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 2243,
                },
                ["id"] = 520,
                ["name"] = {
                    ["areaID"] = 2243,
                },
                ["type"] = 18,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 2251,
                },
                ["id"] = 521,
                ["name"] = {
                    ["areaID"] = 2251,
                },
                ["type"] = 18,
            },
            [3] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 2253,
                },
                ["id"] = 522,
                ["name"] = {
                    ["areaID"] = 2253,
                },
                ["type"] = 18,
            },
            [4] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 2245,
                },
                ["id"] = 523,
                ["name"] = {
                    ["areaID"] = 2245,
                },
                ["type"] = 18,
            },
            [5] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 2255,
                },
                ["id"] = 524,
                ["name"] = {
                    ["areaID"] = 2255,
                },
                ["type"] = 18,
            },
            [6] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 2250,
                },
                ["id"] = 525,
                ["name"] = {
                    ["areaID"] = 2250,
                },
                ["type"] = 18,
            },
            [7] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 2247,
                },
                ["id"] = 526,
                ["name"] = {
                    ["areaID"] = 2247,
                },
                ["type"] = 18,
            },
            [8] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 2244,
                },
                ["id"] = 527,
                ["name"] = {
                    ["areaID"] = 2244,
                },
                ["type"] = 18,
            },
            [9] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 2242,
                },
                ["id"] = 528,
                ["name"] = {
                    ["areaID"] = 2242,
                },
                ["type"] = 18,
            },
            [10] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 2241,
                },
                ["id"] = 529,
                ["name"] = {
                    ["areaID"] = 2241,
                },
                ["type"] = 18,
            },
            [11] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 2249,
                },
                ["id"] = 530,
                ["name"] = {
                    ["areaID"] = 2249,
                },
                ["type"] = 18,
            },
            [12] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 2256,
                },
                ["id"] = 531,
                ["name"] = {
                    ["areaID"] = 2256,
                },
                ["type"] = 18,
            },
            [13] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 2246,
                },
                ["id"] = 532,
                ["name"] = {
                    ["areaID"] = 2246,
                },
                ["type"] = 18,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = {
                    ["areaID"] = 618,
                },
            },
            ["key"] = "AD_EXPLORE",
        },
        ["icon"] = "winterspring",
        ["id"] = 109,
        ["name"] = {
            ["args"] = {
                [1] = {
                    ["areaID"] = 618,
                },
            },
            ["key"] = "AN_EXPLORE",
        },
        ["points"] = 10,
    },
    [112] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 6,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 113,
                },
                ["id"] = 595,
                ["name"] = {
                    ["args"] = {
                        [1] = {
                            ["areaID"] = 36,
                        },
                    },
                    ["key"] = "AN_EXPLORE",
                },
                ["type"] = 20,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 114,
                },
                ["id"] = 612,
                ["name"] = {
                    ["args"] = {
                        [1] = {
                            ["areaID"] = 45,
                        },
                    },
                    ["key"] = "AN_EXPLORE",
                },
                ["type"] = 20,
            },
            [3] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 115,
                },
                ["id"] = 627,
                ["name"] = {
                    ["args"] = {
                        [1] = {
                            ["areaID"] = 3,
                        },
                    },
                    ["key"] = "AN_EXPLORE",
                },
                ["type"] = 20,
            },
            [4] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 116,
                },
                ["id"] = 637,
                ["name"] = {
                    ["args"] = {
                        [1] = {
                            ["areaID"] = 4,
                        },
                    },
                    ["key"] = "AN_EXPLORE",
                },
                ["type"] = 20,
            },
            [5] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 117,
                },
                ["id"] = 648,
                ["name"] = {
                    ["args"] = {
                        [1] = {
                            ["areaID"] = 46,
                        },
                    },
                    ["key"] = "AN_EXPLORE",
                },
                ["type"] = 20,
            },
            [6] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 118,
                },
                ["id"] = 652,
                ["name"] = {
                    ["args"] = {
                        [1] = {
                            ["areaID"] = 41,
                        },
                    },
                    ["key"] = "AN_EXPLORE",
                },
                ["type"] = 20,
            },
            [7] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 119,
                },
                ["id"] = 669,
                ["name"] = {
                    ["args"] = {
                        [1] = {
                            ["areaID"] = 1,
                        },
                    },
                    ["key"] = "AN_EXPLORE",
                },
                ["type"] = 20,
            },
            [8] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 120,
                },
                ["id"] = 683,
                ["name"] = {
                    ["args"] = {
                        [1] = {
                            ["areaID"] = 10,
                        },
                    },
                    ["key"] = "AN_EXPLORE",
                },
                ["type"] = 20,
            },
            [9] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 121,
                },
                ["id"] = 706,
                ["name"] = {
                    ["args"] = {
                        [1] = {
                            ["areaID"] = 139,
                        },
                    },
                    ["key"] = "AN_EXPLORE",
                },
                ["type"] = 20,
            },
            [10] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 122,
                },
                ["id"] = 719,
                ["name"] = {
                    ["args"] = {
                        [1] = {
                            ["areaID"] = 12,
                        },
                    },
                    ["key"] = "AN_EXPLORE",
                },
                ["type"] = 20,
            },
            [11] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 123,
                },
                ["id"] = 732,
                ["name"] = {
                    ["args"] = {
                        [1] = {
                            ["areaID"] = 267,
                        },
                    },
                    ["key"] = "AN_EXPLORE",
                },
                ["type"] = 20,
            },
            [12] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 124,
                },
                ["id"] = 744,
                ["name"] = {
                    ["args"] = {
                        [1] = {
                            ["areaID"] = 38,
                        },
                    },
                    ["key"] = "AN_EXPLORE",
                },
                ["type"] = 20,
            },
            [13] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 125,
                },
                ["id"] = 756,
                ["name"] = {
                    ["args"] = {
                        [1] = {
                            ["areaID"] = 44,
                        },
                    },
                    ["key"] = "AN_EXPLORE",
                },
                ["type"] = 20,
            },
            [14] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 126,
                },
                ["id"] = 764,
                ["name"] = {
                    ["args"] = {
                        [1] = {
                            ["areaID"] = 51,
                        },
                    },
                    ["key"] = "AN_EXPLORE",
                },
                ["type"] = 20,
            },
            [15] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 127,
                },
                ["id"] = 780,
                ["name"] = {
                    ["args"] = {
                        [1] = {
                            ["areaID"] = 130,
                        },
                    },
                    ["key"] = "AN_EXPLORE",
                },
                ["type"] = 20,
            },
            [16] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 128,
                },
                ["id"] = 808,
                ["name"] = {
                    ["args"] = {
                        [1] = {
                            ["areaID"] = 33,
                        },
                    },
                    ["key"] = "AN_EXPLORE",
                },
                ["type"] = 20,
            },
            [17] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 129,
                },
                ["id"] = 820,
                ["name"] = {
                    ["args"] = {
                        [1] = {
                            ["areaID"] = 8,
                        },
                    },
                    ["key"] = "AN_EXPLORE",
                },
                ["type"] = 20,
            },
            [18] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 130,
                },
                ["id"] = 835,
                ["name"] = {
                    ["args"] = {
                        [1] = {
                            ["areaID"] = 47,
                        },
                    },
                    ["key"] = "AN_EXPLORE",
                },
                ["type"] = 20,
            },
            [19] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 131,
                },
                ["id"] = 852,
                ["name"] = {
                    ["args"] = {
                        [1] = {
                            ["areaID"] = 85,
                        },
                    },
                    ["key"] = "AN_EXPLORE",
                },
                ["type"] = 20,
            },
            [20] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 132,
                },
                ["id"] = 865,
                ["name"] = {
                    ["args"] = {
                        [1] = {
                            ["areaID"] = 28,
                        },
                    },
                    ["key"] = "AN_EXPLORE",
                },
                ["type"] = 20,
            },
            [21] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 133,
                },
                ["id"] = 880,
                ["name"] = {
                    ["args"] = {
                        [1] = {
                            ["areaID"] = 40,
                        },
                    },
                    ["key"] = "AN_EXPLORE",
                },
                ["type"] = 20,
            },
            [22] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 134,
                },
                ["id"] = 894,
                ["name"] = {
                    ["args"] = {
                        [1] = {
                            ["areaID"] = 11,
                        },
                    },
                    ["key"] = "AN_EXPLORE",
                },
                ["type"] = 20,
            },
        },
        ["description"] = "AD_EXPLORE_EASTERN_KINGDOMS",
        ["icon"] = "eastern_kingdoms",
        ["id"] = 112,
        ["name"] = "AN_EXPLORE_EASTERN_KINGDOMS",
        ["points"] = 20,
    },
    [113] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 7,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1679,
                },
                ["id"] = 580,
                ["name"] = {
                    ["areaID"] = 1679,
                },
                ["type"] = 18,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 282,
                },
                ["id"] = 581,
                ["name"] = {
                    ["areaID"] = 282,
                },
                ["type"] = 18,
            },
            [3] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 279,
                },
                ["id"] = 582,
                ["name"] = {
                    ["areaID"] = 279,
                },
                ["type"] = 18,
            },
            [4] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1682,
                },
                ["id"] = 583,
                ["name"] = {
                    ["areaID"] = 1682,
                },
                ["type"] = 18,
            },
            [5] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1357,
                },
                ["id"] = 584,
                ["name"] = {
                    ["areaID"] = 1357,
                },
                ["type"] = 18,
            },
            [6] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1677,
                },
                ["id"] = 585,
                ["name"] = {
                    ["areaID"] = 1677,
                },
                ["type"] = 18,
            },
            [7] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1683,
                },
                ["id"] = 586,
                ["name"] = {
                    ["areaID"] = 1683,
                },
                ["type"] = 18,
            },
            [8] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 278,
                },
                ["id"] = 587,
                ["name"] = {
                    ["areaID"] = 278,
                },
                ["type"] = 18,
            },
            [9] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1681,
                },
                ["id"] = 588,
                ["name"] = {
                    ["areaID"] = 1681,
                },
                ["type"] = 18,
            },
            [10] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 281,
                },
                ["id"] = 589,
                ["name"] = {
                    ["areaID"] = 281,
                },
                ["type"] = 18,
            },
            [11] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1678,
                },
                ["id"] = 590,
                ["name"] = {
                    ["areaID"] = 1678,
                },
                ["type"] = 18,
            },
            [12] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 280,
                },
                ["id"] = 591,
                ["name"] = {
                    ["areaID"] = 280,
                },
                ["type"] = 18,
            },
            [13] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1680,
                },
                ["id"] = 592,
                ["name"] = {
                    ["areaID"] = 1680,
                },
                ["type"] = 18,
            },
            [14] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 284,
                },
                ["id"] = 593,
                ["name"] = {
                    ["areaID"] = 284,
                },
                ["type"] = 18,
            },
            [15] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1684,
                },
                ["id"] = 594,
                ["name"] = {
                    ["areaID"] = 1684,
                },
                ["type"] = 18,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = {
                    ["areaID"] = 36,
                },
            },
            ["key"] = "AD_EXPLORE",
        },
        ["icon"] = "alterac_mountains",
        ["id"] = 113,
        ["name"] = {
            ["args"] = {
                [1] = {
                    ["areaID"] = 36,
                },
            },
            ["key"] = "AN_EXPLORE",
        },
        ["points"] = 10,
    },
    [114] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 7,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 313,
                },
                ["id"] = 596,
                ["name"] = {
                    ["areaID"] = 313,
                },
                ["type"] = 18,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 334,
                },
                ["id"] = 597,
                ["name"] = {
                    ["areaID"] = 334,
                },
                ["type"] = 18,
            },
            [3] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1857,
                },
                ["id"] = 598,
                ["name"] = {
                    ["areaID"] = 1857,
                },
                ["type"] = 18,
            },
            [4] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1858,
                },
                ["id"] = 599,
                ["name"] = {
                    ["areaID"] = 1858,
                },
                ["type"] = 18,
            },
            [5] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 327,
                },
                ["id"] = 600,
                ["name"] = {
                    ["areaID"] = 327,
                },
                ["type"] = 18,
            },
            [6] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 324,
                },
                ["id"] = 601,
                ["name"] = {
                    ["areaID"] = 324,
                },
                ["type"] = 18,
            },
            [7] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 880,
                },
                ["id"] = 602,
                ["name"] = {
                    ["areaID"] = 880,
                },
                ["type"] = 18,
            },
            [8] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 335,
                },
                ["id"] = 603,
                ["name"] = {
                    ["areaID"] = 335,
                },
                ["type"] = 18,
            },
            [9] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 320,
                },
                ["id"] = 604,
                ["name"] = {
                    ["areaID"] = 320,
                },
                ["type"] = 18,
            },
            [10] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 316,
                },
                ["id"] = 605,
                ["name"] = {
                    ["areaID"] = 316,
                },
                ["type"] = 18,
            },
            [11] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 317,
                },
                ["id"] = 606,
                ["name"] = {
                    ["areaID"] = 317,
                },
                ["type"] = 18,
            },
            [12] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 336,
                },
                ["id"] = 607,
                ["name"] = {
                    ["areaID"] = 336,
                },
                ["type"] = 18,
            },
            [13] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 315,
                },
                ["id"] = 608,
                ["name"] = {
                    ["areaID"] = 315,
                },
                ["type"] = 18,
            },
            [14] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 314,
                },
                ["id"] = 609,
                ["name"] = {
                    ["areaID"] = 314,
                },
                ["type"] = 18,
            },
            [15] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 321,
                },
                ["id"] = 610,
                ["name"] = {
                    ["areaID"] = 321,
                },
                ["type"] = 18,
            },
            [16] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 333,
                },
                ["id"] = 611,
                ["name"] = {
                    ["areaID"] = 333,
                },
                ["type"] = 18,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = {
                    ["areaID"] = 45,
                },
            },
            ["key"] = "AD_EXPLORE",
        },
        ["icon"] = "arathi",
        ["id"] = 114,
        ["name"] = {
            ["args"] = {
                [1] = {
                    ["areaID"] = 45,
                },
            },
            ["key"] = "AN_EXPLORE",
        },
        ["points"] = 10,
    },
    [115] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 7,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 342,
                },
                ["id"] = 613,
                ["name"] = {
                    ["areaID"] = 342,
                },
                ["type"] = 18,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 339,
                },
                ["id"] = 614,
                ["name"] = {
                    ["areaID"] = 339,
                },
                ["type"] = 18,
            },
            [3] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1879,
                },
                ["id"] = 615,
                ["name"] = {
                    ["areaID"] = 1879,
                },
                ["type"] = 18,
            },
            [4] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 345,
                },
                ["id"] = 616,
                ["name"] = {
                    ["areaID"] = 345,
                },
                ["type"] = 18,
            },
            [5] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 337,
                },
                ["id"] = 617,
                ["name"] = {
                    ["areaID"] = 337,
                },
                ["type"] = 18,
            },
            [6] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 344,
                },
                ["id"] = 618,
                ["name"] = {
                    ["areaID"] = 344,
                },
                ["type"] = 18,
            },
            [7] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1878,
                },
                ["id"] = 619,
                ["name"] = {
                    ["areaID"] = 1878,
                },
                ["type"] = 18,
            },
            [8] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 340,
                },
                ["id"] = 620,
                ["name"] = {
                    ["areaID"] = 340,
                },
                ["type"] = 18,
            },
            [9] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 338,
                },
                ["id"] = 621,
                ["name"] = {
                    ["areaID"] = 338,
                },
                ["type"] = 18,
            },
            [10] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1877,
                },
                ["id"] = 622,
                ["name"] = {
                    ["areaID"] = 1877,
                },
                ["type"] = 18,
            },
            [11] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 346,
                },
                ["id"] = 623,
                ["name"] = {
                    ["areaID"] = 346,
                },
                ["type"] = 18,
            },
            [12] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1898,
                },
                ["id"] = 624,
                ["name"] = {
                    ["areaID"] = 1898,
                },
                ["type"] = 18,
            },
            [13] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 341,
                },
                ["id"] = 625,
                ["name"] = {
                    ["areaID"] = 341,
                },
                ["type"] = 18,
            },
            [14] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1897,
                },
                ["id"] = 626,
                ["name"] = {
                    ["areaID"] = 1897,
                },
                ["type"] = 18,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = {
                    ["areaID"] = 3,
                },
            },
            ["key"] = "AD_EXPLORE",
        },
        ["icon"] = "badlands",
        ["id"] = 115,
        ["name"] = {
            ["args"] = {
                [1] = {
                    ["areaID"] = 3,
                },
            },
            ["key"] = "AN_EXPLORE",
        },
        ["points"] = 10,
    },
    [116] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 7,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1457,
                },
                ["id"] = 628,
                ["name"] = {
                    ["areaID"] = 1457,
                },
                ["type"] = 18,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1438,
                },
                ["id"] = 629,
                ["name"] = {
                    ["areaID"] = 1438,
                },
                ["type"] = 18,
            },
            [3] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1440,
                },
                ["id"] = 630,
                ["name"] = {
                    ["areaID"] = 1440,
                },
                ["type"] = 18,
            },
            [4] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 72,
                },
                ["id"] = 631,
                ["name"] = {
                    ["areaID"] = 72,
                },
                ["type"] = 18,
            },
            [5] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1441,
                },
                ["id"] = 632,
                ["name"] = {
                    ["areaID"] = 1441,
                },
                ["type"] = 18,
            },
            [6] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1439,
                },
                ["id"] = 633,
                ["name"] = {
                    ["areaID"] = 1439,
                },
                ["type"] = 18,
            },
            [7] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 73,
                },
                ["id"] = 634,
                ["name"] = {
                    ["areaID"] = 73,
                },
                ["type"] = 18,
            },
            [8] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 2517,
                },
                ["id"] = 635,
                ["name"] = {
                    ["areaID"] = 2517,
                },
                ["type"] = 18,
            },
            [9] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1437,
                },
                ["id"] = 636,
                ["name"] = {
                    ["areaID"] = 1437,
                },
                ["type"] = 18,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = {
                    ["areaID"] = 4,
                },
            },
            ["key"] = "AD_EXPLORE",
        },
        ["icon"] = "blasted_lands",
        ["id"] = 116,
        ["name"] = {
            ["args"] = {
                [1] = {
                    ["areaID"] = 4,
                },
            },
            ["key"] = "AN_EXPLORE",
        },
        ["points"] = 10,
    },
    [117] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 7,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 2418,
                },
                ["id"] = 638,
                ["name"] = {
                    ["areaID"] = 2418,
                },
                ["type"] = 18,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 249,
                },
                ["id"] = 639,
                ["name"] = {
                    ["areaID"] = 249,
                },
                ["type"] = 18,
            },
            [3] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 2417,
                },
                ["id"] = 640,
                ["name"] = {
                    ["areaID"] = 2417,
                },
                ["type"] = 18,
            },
            [4] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 2420,
                },
                ["id"] = 641,
                ["name"] = {
                    ["areaID"] = 2420,
                },
                ["type"] = 18,
            },
            [5] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 253,
                },
                ["id"] = 642,
                ["name"] = {
                    ["areaID"] = 253,
                },
                ["type"] = 18,
            },
            [6] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 250,
                },
                ["id"] = 643,
                ["name"] = {
                    ["areaID"] = 250,
                },
                ["type"] = 18,
            },
            [7] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 2421,
                },
                ["id"] = 644,
                ["name"] = {
                    ["areaID"] = 2421,
                },
                ["type"] = 18,
            },
            [8] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 252,
                },
                ["id"] = 645,
                ["name"] = {
                    ["areaID"] = 252,
                },
                ["type"] = 18,
            },
            [9] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 254,
                },
                ["id"] = 646,
                ["name"] = {
                    ["areaID"] = 254,
                },
                ["type"] = 18,
            },
            [10] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 255,
                },
                ["id"] = 647,
                ["name"] = {
                    ["areaID"] = 255,
                },
                ["type"] = 18,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = {
                    ["areaID"] = 46,
                },
            },
            ["key"] = "AD_EXPLORE",
        },
        ["icon"] = "burning_steppes",
        ["id"] = 117,
        ["name"] = {
            ["args"] = {
                [1] = {
                    ["areaID"] = 46,
                },
            },
            ["key"] = "AN_EXPLORE",
        },
        ["points"] = 10,
    },
    [118] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 7,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 2561,
                },
                ["id"] = 649,
                ["name"] = {
                    ["areaID"] = 2561,
                },
                ["type"] = 18,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 2562,
                },
                ["id"] = 650,
                ["name"] = {
                    ["areaID"] = 2562,
                },
                ["type"] = 18,
            },
            [3] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 2697,
                },
                ["id"] = 651,
                ["name"] = {
                    ["areaID"] = 2697,
                },
                ["type"] = 18,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = {
                    ["areaID"] = 41,
                },
            },
            ["key"] = "AD_EXPLORE",
        },
        ["icon"] = "deadwind_pass",
        ["id"] = 118,
        ["name"] = {
            ["args"] = {
                [1] = {
                    ["areaID"] = 41,
                },
            },
            ["key"] = "AN_EXPLORE",
        },
        ["points"] = 10,
    },
    [119] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 7,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 801,
                },
                ["id"] = 653,
                ["name"] = {
                    ["areaID"] = 801,
                },
                ["type"] = 18,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 800,
                },
                ["id"] = 654,
                ["name"] = {
                    ["areaID"] = 800,
                },
                ["type"] = 18,
            },
            [3] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 802,
                },
                ["id"] = 655,
                ["name"] = {
                    ["areaID"] = 802,
                },
                ["type"] = 18,
            },
            [4] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 804,
                },
                ["id"] = 656,
                ["name"] = {
                    ["areaID"] = 804,
                },
                ["type"] = 18,
            },
            [5] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 138,
                },
                ["id"] = 657,
                ["name"] = {
                    ["areaID"] = 138,
                },
                ["type"] = 18,
            },
            [6] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 212,
                },
                ["id"] = 658,
                ["name"] = {
                    ["areaID"] = 212,
                },
                ["type"] = 18,
            },
            [7] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 803,
                },
                ["id"] = 659,
                ["name"] = {
                    ["areaID"] = 803,
                },
                ["type"] = 18,
            },
            [8] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 808,
                },
                ["id"] = 660,
                ["name"] = {
                    ["areaID"] = 808,
                },
                ["type"] = 18,
            },
            [9] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 134,
                },
                ["id"] = 661,
                ["name"] = {
                    ["areaID"] = 134,
                },
                ["type"] = 18,
            },
            [10] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 137,
                },
                ["id"] = 662,
                ["name"] = {
                    ["areaID"] = 137,
                },
                ["type"] = 18,
            },
            [11] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 135,
                },
                ["id"] = 663,
                ["name"] = {
                    ["areaID"] = 135,
                },
                ["type"] = 18,
            },
            [12] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 136,
                },
                ["id"] = 664,
                ["name"] = {
                    ["areaID"] = 136,
                },
                ["type"] = 18,
            },
            [13] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 211,
                },
                ["id"] = 665,
                ["name"] = {
                    ["areaID"] = 211,
                },
                ["type"] = 18,
            },
            [14] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 806,
                },
                ["id"] = 666,
                ["name"] = {
                    ["areaID"] = 806,
                },
                ["type"] = 18,
            },
            [15] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 809,
                },
                ["id"] = 667,
                ["name"] = {
                    ["areaID"] = 809,
                },
                ["type"] = 18,
            },
            [16] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 133,
                },
                ["id"] = 668,
                ["name"] = {
                    ["areaID"] = 133,
                },
                ["type"] = 18,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = {
                    ["areaID"] = 1,
                },
            },
            ["key"] = "AD_EXPLORE",
        },
        ["icon"] = "dun_morogh",
        ["id"] = 119,
        ["name"] = {
            ["args"] = {
                [1] = {
                    ["areaID"] = 1,
                },
            },
            ["key"] = "AN_EXPLORE",
        },
        ["points"] = 10,
    },
    [120] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 7,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 536,
                },
                ["id"] = 670,
                ["name"] = {
                    ["areaID"] = 536,
                },
                ["type"] = 18,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 94,
                },
                ["id"] = 671,
                ["name"] = {
                    ["areaID"] = 94,
                },
                ["type"] = 18,
            },
            [3] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 492,
                },
                ["id"] = 672,
                ["name"] = {
                    ["areaID"] = 492,
                },
                ["type"] = 18,
            },
            [4] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 93,
                },
                ["id"] = 673,
                ["name"] = {
                    ["areaID"] = 93,
                },
                ["type"] = 18,
            },
            [5] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 856,
                },
                ["id"] = 674,
                ["name"] = {
                    ["areaID"] = 856,
                },
                ["type"] = 18,
            },
            [6] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 245,
                },
                ["id"] = 675,
                ["name"] = {
                    ["areaID"] = 245,
                },
                ["type"] = 18,
            },
            [7] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 242,
                },
                ["id"] = 676,
                ["name"] = {
                    ["areaID"] = 242,
                },
                ["type"] = 18,
            },
            [8] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 241,
                },
                ["id"] = 677,
                ["name"] = {
                    ["areaID"] = 241,
                },
                ["type"] = 18,
            },
            [9] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 121,
                },
                ["id"] = 678,
                ["name"] = {
                    ["areaID"] = 121,
                },
                ["type"] = 18,
            },
            [10] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 42,
                },
                ["id"] = 679,
                ["name"] = {
                    ["areaID"] = 42,
                },
                ["type"] = 18,
            },
            [11] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1098,
                },
                ["id"] = 680,
                ["name"] = {
                    ["areaID"] = 1098,
                },
                ["type"] = 18,
            },
            [12] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 799,
                },
                ["id"] = 681,
                ["name"] = {
                    ["areaID"] = 799,
                },
                ["type"] = 18,
            },
            [13] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1097,
                },
                ["id"] = 682,
                ["name"] = {
                    ["areaID"] = 1097,
                },
                ["type"] = 18,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = {
                    ["areaID"] = 10,
                },
            },
            ["key"] = "AD_EXPLORE",
        },
        ["icon"] = "duskwood",
        ["id"] = 120,
        ["name"] = {
            ["args"] = {
                [1] = {
                    ["areaID"] = 10,
                },
            },
            ["key"] = "AN_EXPLORE",
        },
        ["points"] = 10,
    },
    [121] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 7,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 2260,
                },
                ["id"] = 684,
                ["name"] = {
                    ["areaID"] = 2260,
                },
                ["type"] = 18,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 2261,
                },
                ["id"] = 685,
                ["name"] = {
                    ["areaID"] = 2261,
                },
                ["type"] = 18,
            },
            [3] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 2263,
                },
                ["id"] = 686,
                ["name"] = {
                    ["areaID"] = 2263,
                },
                ["type"] = 18,
            },
            [4] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 2258,
                },
                ["id"] = 687,
                ["name"] = {
                    ["areaID"] = 2258,
                },
                ["type"] = 18,
            },
            [5] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 2262,
                },
                ["id"] = 688,
                ["name"] = {
                    ["areaID"] = 2262,
                },
                ["type"] = 18,
            },
            [6] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 2622,
                },
                ["id"] = 689,
                ["name"] = {
                    ["areaID"] = 2622,
                },
                ["type"] = 18,
            },
            [7] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 2264,
                },
                ["id"] = 690,
                ["name"] = {
                    ["areaID"] = 2264,
                },
                ["type"] = 18,
            },
            [8] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 2621,
                },
                ["id"] = 691,
                ["name"] = {
                    ["areaID"] = 2621,
                },
                ["type"] = 18,
            },
            [9] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 2266,
                },
                ["id"] = 692,
                ["name"] = {
                    ["areaID"] = 2266,
                },
                ["type"] = 18,
            },
            [10] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 2268,
                },
                ["id"] = 693,
                ["name"] = {
                    ["areaID"] = 2268,
                },
                ["type"] = 18,
            },
            [11] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 2623,
                },
                ["id"] = 694,
                ["name"] = {
                    ["areaID"] = 2623,
                },
                ["type"] = 18,
            },
            [12] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 2270,
                },
                ["id"] = 695,
                ["name"] = {
                    ["areaID"] = 2270,
                },
                ["type"] = 18,
            },
            [13] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 2271,
                },
                ["id"] = 696,
                ["name"] = {
                    ["areaID"] = 2271,
                },
                ["type"] = 18,
            },
            [14] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 2624,
                },
                ["id"] = 697,
                ["name"] = {
                    ["areaID"] = 2624,
                },
                ["type"] = 18,
            },
            [15] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 2272,
                },
                ["id"] = 698,
                ["name"] = {
                    ["areaID"] = 2272,
                },
                ["type"] = 18,
            },
            [16] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 2273,
                },
                ["id"] = 699,
                ["name"] = {
                    ["areaID"] = 2273,
                },
                ["type"] = 18,
            },
            [17] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 2275,
                },
                ["id"] = 700,
                ["name"] = {
                    ["areaID"] = 2275,
                },
                ["type"] = 18,
            },
            [18] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 2276,
                },
                ["id"] = 701,
                ["name"] = {
                    ["areaID"] = 2276,
                },
                ["type"] = 18,
            },
            [19] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 2627,
                },
                ["id"] = 702,
                ["name"] = {
                    ["areaID"] = 2627,
                },
                ["type"] = 18,
            },
            [20] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 2277,
                },
                ["id"] = 703,
                ["name"] = {
                    ["areaID"] = 2277,
                },
                ["type"] = 18,
            },
            [21] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 2279,
                },
                ["id"] = 704,
                ["name"] = {
                    ["areaID"] = 2279,
                },
                ["type"] = 18,
            },
            [22] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 2619,
                },
                ["id"] = 705,
                ["name"] = {
                    ["areaID"] = 2619,
                },
                ["type"] = 18,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = {
                    ["areaID"] = 139,
                },
            },
            ["key"] = "AD_EXPLORE",
        },
        ["icon"] = "eastern_plaguelands",
        ["id"] = 121,
        ["name"] = {
            ["args"] = {
                [1] = {
                    ["areaID"] = 139,
                },
            },
            ["key"] = "AN_EXPLORE",
        },
        ["points"] = 10,
    },
    [122] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 7,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 87,
                },
                ["id"] = 707,
                ["name"] = {
                    ["areaID"] = 87,
                },
                ["type"] = 18,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 9,
                },
                ["id"] = 708,
                ["name"] = {
                    ["areaID"] = 9,
                },
                ["type"] = 18,
            },
            [3] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1519,
                },
                ["id"] = 709,
                ["name"] = {
                    ["areaID"] = 1519,
                },
                ["type"] = 18,
            },
            [4] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 57,
                },
                ["id"] = 710,
                ["name"] = {
                    ["areaID"] = 57,
                },
                ["type"] = 18,
            },
            [5] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 797,
                },
                ["id"] = 711,
                ["name"] = {
                    ["areaID"] = 797,
                },
                ["type"] = 18,
            },
            [6] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 60,
                },
                ["id"] = 712,
                ["name"] = {
                    ["areaID"] = 60,
                },
                ["type"] = 18,
            },
            [7] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 62,
                },
                ["id"] = 713,
                ["name"] = {
                    ["areaID"] = 62,
                },
                ["type"] = 18,
            },
            [8] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 91,
                },
                ["id"] = 714,
                ["name"] = {
                    ["areaID"] = 91,
                },
                ["type"] = 18,
            },
            [9] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 798,
                },
                ["id"] = 715,
                ["name"] = {
                    ["areaID"] = 798,
                },
                ["type"] = 18,
            },
            [10] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 88,
                },
                ["id"] = 716,
                ["name"] = {
                    ["areaID"] = 88,
                },
                ["type"] = 18,
            },
            [11] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 86,
                },
                ["id"] = 717,
                ["name"] = {
                    ["areaID"] = 86,
                },
                ["type"] = 18,
            },
            [12] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 18,
                },
                ["id"] = 718,
                ["name"] = {
                    ["areaID"] = 18,
                },
                ["type"] = 18,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = {
                    ["areaID"] = 12,
                },
            },
            ["key"] = "AD_EXPLORE",
        },
        ["icon"] = "elwynn_forest",
        ["id"] = 122,
        ["name"] = {
            ["args"] = {
                [1] = {
                    ["areaID"] = 12,
                },
            },
            ["key"] = "AN_EXPLORE",
        },
        ["points"] = 10,
    },
    [123] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 7,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 272,
                },
                ["id"] = 720,
                ["name"] = {
                    ["areaID"] = 272,
                },
                ["type"] = 18,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1056,
                },
                ["id"] = 721,
                ["name"] = {
                    ["areaID"] = 1056,
                },
                ["type"] = 18,
            },
            [3] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 290,
                },
                ["id"] = 722,
                ["name"] = {
                    ["areaID"] = 290,
                },
                ["type"] = 18,
            },
            [4] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 275,
                },
                ["id"] = 723,
                ["name"] = {
                    ["areaID"] = 275,
                },
                ["type"] = 18,
            },
            [5] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 294,
                },
                ["id"] = 724,
                ["name"] = {
                    ["areaID"] = 294,
                },
                ["type"] = 18,
            },
            [6] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 289,
                },
                ["id"] = 725,
                ["name"] = {
                    ["areaID"] = 289,
                },
                ["type"] = 18,
            },
            [7] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 286,
                },
                ["id"] = 726,
                ["name"] = {
                    ["areaID"] = 286,
                },
                ["type"] = 18,
            },
            [8] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 271,
                },
                ["id"] = 727,
                ["name"] = {
                    ["areaID"] = 271,
                },
                ["type"] = 18,
            },
            [9] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 288,
                },
                ["id"] = 728,
                ["name"] = {
                    ["areaID"] = 288,
                },
                ["type"] = 18,
            },
            [10] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 295,
                },
                ["id"] = 729,
                ["name"] = {
                    ["areaID"] = 295,
                },
                ["type"] = 18,
            },
            [11] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 896,
                },
                ["id"] = 730,
                ["name"] = {
                    ["areaID"] = 896,
                },
                ["type"] = 18,
            },
            [12] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 285,
                },
                ["id"] = 731,
                ["name"] = {
                    ["areaID"] = 285,
                },
                ["type"] = 18,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = {
                    ["areaID"] = 267,
                },
            },
            ["key"] = "AD_EXPLORE",
        },
        ["icon"] = "hillsbrad",
        ["id"] = 123,
        ["name"] = {
            ["args"] = {
                [1] = {
                    ["areaID"] = 267,
                },
            },
            ["key"] = "AN_EXPLORE",
        },
        ["points"] = 10,
    },
    [124] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 7,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 146,
                },
                ["id"] = 733,
                ["name"] = {
                    ["areaID"] = 146,
                },
                ["type"] = 18,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 143,
                },
                ["id"] = 734,
                ["name"] = {
                    ["areaID"] = 143,
                },
                ["type"] = 18,
            },
            [3] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 149,
                },
                ["id"] = 735,
                ["name"] = {
                    ["areaID"] = 149,
                },
                ["type"] = 18,
            },
            [4] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 838,
                },
                ["id"] = 736,
                ["name"] = {
                    ["areaID"] = 838,
                },
                ["type"] = 18,
            },
            [5] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 147,
                },
                ["id"] = 737,
                ["name"] = {
                    ["areaID"] = 147,
                },
                ["type"] = 18,
            },
            [6] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 142,
                },
                ["id"] = 738,
                ["name"] = {
                    ["areaID"] = 142,
                },
                ["type"] = 18,
            },
            [7] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 936,
                },
                ["id"] = 739,
                ["name"] = {
                    ["areaID"] = 936,
                },
                ["type"] = 18,
            },
            [8] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 144,
                },
                ["id"] = 740,
                ["name"] = {
                    ["areaID"] = 144,
                },
                ["type"] = 18,
            },
            [9] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 923,
                },
                ["id"] = 741,
                ["name"] = {
                    ["areaID"] = 923,
                },
                ["type"] = 18,
            },
            [10] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 924,
                },
                ["id"] = 742,
                ["name"] = {
                    ["areaID"] = 924,
                },
                ["type"] = 18,
            },
            [11] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 556,
                },
                ["id"] = 743,
                ["name"] = {
                    ["areaID"] = 556,
                },
                ["type"] = 18,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = {
                    ["areaID"] = 38,
                },
            },
            ["key"] = "AD_EXPLORE",
        },
        ["icon"] = "loch_modan",
        ["id"] = 124,
        ["name"] = {
            ["args"] = {
                [1] = {
                    ["areaID"] = 38,
                },
            },
            ["key"] = "AN_EXPLORE",
        },
        ["points"] = 10,
    },
    [125] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 7,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 68,
                },
                ["id"] = 745,
                ["name"] = {
                    ["areaID"] = 68,
                },
                ["type"] = 18,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1002,
                },
                ["id"] = 746,
                ["name"] = {
                    ["areaID"] = 1002,
                },
                ["type"] = 18,
            },
            [3] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1001,
                },
                ["id"] = 747,
                ["name"] = {
                    ["areaID"] = 1001,
                },
                ["type"] = 18,
            },
            [4] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 95,
                },
                ["id"] = 748,
                ["name"] = {
                    ["areaID"] = 95,
                },
                ["type"] = 18,
            },
            [5] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 97,
                },
                ["id"] = 749,
                ["name"] = {
                    ["areaID"] = 97,
                },
                ["type"] = 18,
            },
            [6] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 70,
                },
                ["id"] = 750,
                ["name"] = {
                    ["areaID"] = 70,
                },
                ["type"] = 18,
            },
            [7] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 997,
                },
                ["id"] = 751,
                ["name"] = {
                    ["areaID"] = 997,
                },
                ["type"] = 18,
            },
            [8] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 996,
                },
                ["id"] = 752,
                ["name"] = {
                    ["areaID"] = 996,
                },
                ["type"] = 18,
            },
            [9] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 71,
                },
                ["id"] = 753,
                ["name"] = {
                    ["areaID"] = 71,
                },
                ["type"] = 18,
            },
            [10] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1000,
                },
                ["id"] = 754,
                ["name"] = {
                    ["areaID"] = 1000,
                },
                ["type"] = 18,
            },
            [11] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 69,
                },
                ["id"] = 755,
                ["name"] = {
                    ["areaID"] = 69,
                },
                ["type"] = 18,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = {
                    ["areaID"] = 44,
                },
            },
            ["key"] = "AD_EXPLORE",
        },
        ["icon"] = "redridge_mountains",
        ["id"] = 125,
        ["name"] = {
            ["args"] = {
                [1] = {
                    ["areaID"] = 44,
                },
            },
            ["key"] = "AN_EXPLORE",
        },
        ["points"] = 10,
    },
    [126] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 7,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 246,
                },
                ["id"] = 757,
                ["name"] = {
                    ["areaID"] = 246,
                },
                ["type"] = 18,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1957,
                },
                ["id"] = 758,
                ["name"] = {
                    ["areaID"] = 1957,
                },
                ["type"] = 18,
            },
            [3] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1444,
                },
                ["id"] = 759,
                ["name"] = {
                    ["areaID"] = 1444,
                },
                ["type"] = 18,
            },
            [4] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1958,
                },
                ["id"] = 760,
                ["name"] = {
                    ["areaID"] = 1958,
                },
                ["type"] = 18,
            },
            [5] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 247,
                },
                ["id"] = 761,
                ["name"] = {
                    ["areaID"] = 247,
                },
                ["type"] = 18,
            },
            [6] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1959,
                },
                ["id"] = 762,
                ["name"] = {
                    ["areaID"] = 1959,
                },
                ["type"] = 18,
            },
            [7] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1442,
                },
                ["id"] = 763,
                ["name"] = {
                    ["areaID"] = 1442,
                },
                ["type"] = 18,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = {
                    ["areaID"] = 51,
                },
            },
            ["key"] = "AD_EXPLORE",
        },
        ["icon"] = "searing_gorge",
        ["id"] = 126,
        ["name"] = {
            ["args"] = {
                [1] = {
                    ["areaID"] = 51,
                },
            },
            ["key"] = "AN_EXPLORE",
        },
        ["points"] = 10,
    },
    [127] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 7,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 927,
                },
                ["id"] = 765,
                ["name"] = {
                    ["areaID"] = 927,
                },
                ["type"] = 18,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 240,
                },
                ["id"] = 766,
                ["name"] = {
                    ["areaID"] = 240,
                },
                ["type"] = 18,
            },
            [3] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 226,
                },
                ["id"] = 767,
                ["name"] = {
                    ["areaID"] = 226,
                },
                ["type"] = 18,
            },
            [4] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 928,
                },
                ["id"] = 768,
                ["name"] = {
                    ["areaID"] = 928,
                },
                ["type"] = 18,
            },
            [5] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 172,
                },
                ["id"] = 769,
                ["name"] = {
                    ["areaID"] = 172,
                },
                ["type"] = 18,
            },
            [6] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 237,
                },
                ["id"] = 770,
                ["name"] = {
                    ["areaID"] = 237,
                },
                ["type"] = 18,
            },
            [7] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 228,
                },
                ["id"] = 771,
                ["name"] = {
                    ["areaID"] = 228,
                },
                ["type"] = 18,
            },
            [8] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 213,
                },
                ["id"] = 772,
                ["name"] = {
                    ["areaID"] = 213,
                },
                ["type"] = 18,
            },
            [9] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 229,
                },
                ["id"] = 773,
                ["name"] = {
                    ["areaID"] = 229,
                },
                ["type"] = 18,
            },
            [10] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 233,
                },
                ["id"] = 774,
                ["name"] = {
                    ["areaID"] = 233,
                },
                ["type"] = 18,
            },
            [11] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 236,
                },
                ["id"] = 775,
                ["name"] = {
                    ["areaID"] = 236,
                },
                ["type"] = 18,
            },
            [12] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 204,
                },
                ["id"] = 776,
                ["name"] = {
                    ["areaID"] = 204,
                },
                ["type"] = 18,
            },
            [13] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 230,
                },
                ["id"] = 777,
                ["name"] = {
                    ["areaID"] = 230,
                },
                ["type"] = 18,
            },
            [14] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 231,
                },
                ["id"] = 778,
                ["name"] = {
                    ["areaID"] = 231,
                },
                ["type"] = 18,
            },
            [15] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 238,
                },
                ["id"] = 779,
                ["name"] = {
                    ["areaID"] = 238,
                },
                ["type"] = 18,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = {
                    ["areaID"] = 130,
                },
            },
            ["key"] = "AD_EXPLORE",
        },
        ["icon"] = "silverpine_forest",
        ["id"] = 127,
        ["name"] = {
            ["args"] = {
                [1] = {
                    ["areaID"] = 130,
                },
            },
            ["key"] = "AN_EXPLORE",
        },
        ["points"] = 10,
    },
    [128] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 7,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 100,
                },
                ["id"] = 781,
                ["name"] = {
                    ["areaID"] = 100,
                },
                ["type"] = 18,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 117,
                },
                ["id"] = 782,
                ["name"] = {
                    ["areaID"] = 117,
                },
                ["type"] = 18,
            },
            [3] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 99,
                },
                ["id"] = 783,
                ["name"] = {
                    ["areaID"] = 99,
                },
                ["type"] = 18,
            },
            [4] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 101,
                },
                ["id"] = 784,
                ["name"] = {
                    ["areaID"] = 101,
                },
                ["type"] = 18,
            },
            [5] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 43,
                },
                ["id"] = 785,
                ["name"] = {
                    ["areaID"] = 43,
                },
                ["type"] = 18,
            },
            [6] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1738,
                },
                ["id"] = 786,
                ["name"] = {
                    ["areaID"] = 1738,
                },
                ["type"] = 18,
            },
            [7] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1737,
                },
                ["id"] = 787,
                ["name"] = {
                    ["areaID"] = 1737,
                },
                ["type"] = 18,
            },
            [8] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1739,
                },
                ["id"] = 788,
                ["name"] = {
                    ["areaID"] = 1739,
                },
                ["type"] = 18,
            },
            [9] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 311,
                },
                ["id"] = 789,
                ["name"] = {
                    ["areaID"] = 311,
                },
                ["type"] = 18,
            },
            [10] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 477,
                },
                ["id"] = 790,
                ["name"] = {
                    ["areaID"] = 477,
                },
                ["type"] = 18,
            },
            [11] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 310,
                },
                ["id"] = 791,
                ["name"] = {
                    ["areaID"] = 310,
                },
                ["type"] = 18,
            },
            [12] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 128,
                },
                ["id"] = 792,
                ["name"] = {
                    ["areaID"] = 128,
                },
                ["type"] = 18,
            },
            [13] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1741,
                },
                ["id"] = 793,
                ["name"] = {
                    ["areaID"] = 1741,
                },
                ["type"] = 18,
            },
            [14] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 103,
                },
                ["id"] = 794,
                ["name"] = {
                    ["areaID"] = 103,
                },
                ["type"] = 18,
            },
            [15] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 127,
                },
                ["id"] = 795,
                ["name"] = {
                    ["areaID"] = 127,
                },
                ["type"] = 18,
            },
            [16] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 129,
                },
                ["id"] = 796,
                ["name"] = {
                    ["areaID"] = 129,
                },
                ["type"] = 18,
            },
            [17] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 105,
                },
                ["id"] = 797,
                ["name"] = {
                    ["areaID"] = 105,
                },
                ["type"] = 18,
            },
            [18] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1740,
                },
                ["id"] = 798,
                ["name"] = {
                    ["areaID"] = 1740,
                },
                ["type"] = 18,
            },
            [19] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 37,
                },
                ["id"] = 799,
                ["name"] = {
                    ["areaID"] = 37,
                },
                ["type"] = 18,
            },
            [20] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 125,
                },
                ["id"] = 800,
                ["name"] = {
                    ["areaID"] = 125,
                },
                ["type"] = 18,
            },
            [21] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 123,
                },
                ["id"] = 801,
                ["name"] = {
                    ["areaID"] = 123,
                },
                ["type"] = 18,
            },
            [22] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 104,
                },
                ["id"] = 802,
                ["name"] = {
                    ["areaID"] = 104,
                },
                ["type"] = 18,
            },
            [23] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 122,
                },
                ["id"] = 803,
                ["name"] = {
                    ["areaID"] = 122,
                },
                ["type"] = 18,
            },
            [24] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 102,
                },
                ["id"] = 804,
                ["name"] = {
                    ["areaID"] = 102,
                },
                ["type"] = 18,
            },
            [25] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 297,
                },
                ["id"] = 805,
                ["name"] = {
                    ["areaID"] = 297,
                },
                ["type"] = 18,
            },
            [26] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 19,
                },
                ["id"] = 806,
                ["name"] = {
                    ["areaID"] = 19,
                },
                ["type"] = 18,
            },
            [27] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 35,
                },
                ["id"] = 807,
                ["name"] = {
                    ["areaID"] = 35,
                },
                ["type"] = 18,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = {
                    ["areaID"] = 33,
                },
            },
            ["key"] = "AD_EXPLORE",
        },
        ["icon"] = "stranglethorn_valley",
        ["id"] = 128,
        ["name"] = {
            ["args"] = {
                [1] = {
                    ["areaID"] = 33,
                },
            },
            ["key"] = "AN_EXPLORE",
        },
        ["points"] = 10,
    },
    [129] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 7,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 116,
                },
                ["id"] = 809,
                ["name"] = {
                    ["areaID"] = 116,
                },
                ["type"] = 18,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 657,
                },
                ["id"] = 810,
                ["name"] = {
                    ["areaID"] = 657,
                },
                ["type"] = 18,
            },
            [3] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1780,
                },
                ["id"] = 811,
                ["name"] = {
                    ["areaID"] = 1780,
                },
                ["type"] = 18,
            },
            [4] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1798,
                },
                ["id"] = 812,
                ["name"] = {
                    ["areaID"] = 1798,
                },
                ["type"] = 18,
            },
            [5] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 75,
                },
                ["id"] = 813,
                ["name"] = {
                    ["areaID"] = 75,
                },
                ["type"] = 18,
            },
            [6] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 74,
                },
                ["id"] = 814,
                ["name"] = {
                    ["areaID"] = 74,
                },
                ["type"] = 18,
            },
            [7] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1797,
                },
                ["id"] = 815,
                ["name"] = {
                    ["areaID"] = 1797,
                },
                ["type"] = 18,
            },
            [8] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1778,
                },
                ["id"] = 816,
                ["name"] = {
                    ["areaID"] = 1778,
                },
                ["type"] = 18,
            },
            [9] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 76,
                },
                ["id"] = 817,
                ["name"] = {
                    ["areaID"] = 76,
                },
                ["type"] = 18,
            },
            [10] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 300,
                },
                ["id"] = 818,
                ["name"] = {
                    ["areaID"] = 300,
                },
                ["type"] = 18,
            },
            [11] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1777,
                },
                ["id"] = 819,
                ["name"] = {
                    ["areaID"] = 1777,
                },
                ["type"] = 18,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = {
                    ["areaID"] = 8,
                },
            },
            ["key"] = "AD_EXPLORE",
        },
        ["icon"] = "swamp_of_sorrows",
        ["id"] = 129,
        ["name"] = {
            ["args"] = {
                [1] = {
                    ["areaID"] = 8,
                },
            },
            ["key"] = "AN_EXPLORE",
        },
        ["points"] = 10,
    },
    [130] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 7,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1882,
                },
                ["id"] = 821,
                ["name"] = {
                    ["areaID"] = 1882,
                },
                ["type"] = 18,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 348,
                },
                ["id"] = 822,
                ["name"] = {
                    ["areaID"] = 348,
                },
                ["type"] = 18,
            },
            [3] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 350,
                },
                ["id"] = 823,
                ["name"] = {
                    ["areaID"] = 350,
                },
                ["type"] = 18,
            },
            [4] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1885,
                },
                ["id"] = 824,
                ["name"] = {
                    ["areaID"] = 1885,
                },
                ["type"] = 18,
            },
            [5] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1883,
                },
                ["id"] = 825,
                ["name"] = {
                    ["areaID"] = 1883,
                },
                ["type"] = 18,
            },
            [6] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 353,
                },
                ["id"] = 826,
                ["name"] = {
                    ["areaID"] = 353,
                },
                ["type"] = 18,
            },
            [7] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1886,
                },
                ["id"] = 827,
                ["name"] = {
                    ["areaID"] = 1886,
                },
                ["type"] = 18,
            },
            [8] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1884,
                },
                ["id"] = 828,
                ["name"] = {
                    ["areaID"] = 1884,
                },
                ["type"] = 18,
            },
            [9] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 356,
                },
                ["id"] = 829,
                ["name"] = {
                    ["areaID"] = 356,
                },
                ["type"] = 18,
            },
            [10] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 355,
                },
                ["id"] = 830,
                ["name"] = {
                    ["areaID"] = 355,
                },
                ["type"] = 18,
            },
            [11] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1917,
                },
                ["id"] = 831,
                ["name"] = {
                    ["areaID"] = 1917,
                },
                ["type"] = 18,
            },
            [12] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 351,
                },
                ["id"] = 832,
                ["name"] = {
                    ["areaID"] = 351,
                },
                ["type"] = 18,
            },
            [13] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 307,
                },
                ["id"] = 833,
                ["name"] = {
                    ["areaID"] = 307,
                },
                ["type"] = 18,
            },
            [14] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 354,
                },
                ["id"] = 834,
                ["name"] = {
                    ["areaID"] = 354,
                },
                ["type"] = 18,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = {
                    ["areaID"] = 47,
                },
            },
            ["key"] = "AD_EXPLORE",
        },
        ["icon"] = "hinterlands",
        ["id"] = 130,
        ["name"] = {
            ["args"] = {
                [1] = {
                    ["areaID"] = 47,
                },
            },
            ["key"] = "AN_EXPLORE",
        },
        ["points"] = 10,
    },
    [131] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 7,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 156,
                },
                ["id"] = 836,
                ["name"] = {
                    ["areaID"] = 156,
                },
                ["type"] = 18,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 154,
                },
                ["id"] = 837,
                ["name"] = {
                    ["areaID"] = 154,
                },
                ["type"] = 18,
            },
            [3] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 810,
                },
                ["id"] = 838,
                ["name"] = {
                    ["areaID"] = 810,
                },
                ["type"] = 18,
            },
            [4] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 157,
                },
                ["id"] = 839,
                ["name"] = {
                    ["areaID"] = 157,
                },
                ["type"] = 18,
            },
            [5] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 166,
                },
                ["id"] = 840,
                ["name"] = {
                    ["areaID"] = 166,
                },
                ["type"] = 18,
            },
            [6] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 811,
                },
                ["id"] = 841,
                ["name"] = {
                    ["areaID"] = 811,
                },
                ["type"] = 18,
            },
            [7] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 164,
                },
                ["id"] = 842,
                ["name"] = {
                    ["areaID"] = 164,
                },
                ["type"] = 18,
            },
            [8] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 159,
                },
                ["id"] = 843,
                ["name"] = {
                    ["areaID"] = 159,
                },
                ["type"] = 18,
            },
            [9] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 165,
                },
                ["id"] = 844,
                ["name"] = {
                    ["areaID"] = 165,
                },
                ["type"] = 18,
            },
            [10] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 162,
                },
                ["id"] = 845,
                ["name"] = {
                    ["areaID"] = 162,
                },
                ["type"] = 18,
            },
            [11] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 459,
                },
                ["id"] = 846,
                ["name"] = {
                    ["areaID"] = 459,
                },
                ["type"] = 18,
            },
            [12] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 167,
                },
                ["id"] = 847,
                ["name"] = {
                    ["areaID"] = 167,
                },
                ["type"] = 18,
            },
            [13] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 812,
                },
                ["id"] = 848,
                ["name"] = {
                    ["areaID"] = 812,
                },
                ["type"] = 18,
            },
            [14] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 160,
                },
                ["id"] = 849,
                ["name"] = {
                    ["areaID"] = 160,
                },
                ["type"] = 18,
            },
            [15] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1497,
                },
                ["id"] = 850,
                ["name"] = {
                    ["areaID"] = 1497,
                },
                ["type"] = 18,
            },
            [16] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 152,
                },
                ["id"] = 851,
                ["name"] = {
                    ["areaID"] = 152,
                },
                ["type"] = 18,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = {
                    ["areaID"] = 85,
                },
            },
            ["key"] = "AD_EXPLORE",
        },
        ["icon"] = "tirisfal_glades",
        ["id"] = 131,
        ["name"] = {
            ["args"] = {
                [1] = {
                    ["areaID"] = 85,
                },
            },
            ["key"] = "AN_EXPLORE",
        },
        ["points"] = 10,
    },
    [132] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 7,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 197,
                },
                ["id"] = 853,
                ["name"] = {
                    ["areaID"] = 197,
                },
                ["type"] = 18,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 193,
                },
                ["id"] = 854,
                ["name"] = {
                    ["areaID"] = 193,
                },
                ["type"] = 18,
            },
            [3] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 813,
                },
                ["id"] = 855,
                ["name"] = {
                    ["areaID"] = 813,
                },
                ["type"] = 18,
            },
            [4] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 199,
                },
                ["id"] = 856,
                ["name"] = {
                    ["areaID"] = 199,
                },
                ["type"] = 18,
            },
            [5] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 200,
                },
                ["id"] = 857,
                ["name"] = {
                    ["areaID"] = 200,
                },
                ["type"] = 18,
            },
            [6] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 202,
                },
                ["id"] = 858,
                ["name"] = {
                    ["areaID"] = 202,
                },
                ["type"] = 18,
            },
            [7] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 192,
                },
                ["id"] = 859,
                ["name"] = {
                    ["areaID"] = 192,
                },
                ["type"] = 18,
            },
            [8] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 190,
                },
                ["id"] = 860,
                ["name"] = {
                    ["areaID"] = 190,
                },
                ["type"] = 18,
            },
            [9] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 201,
                },
                ["id"] = 861,
                ["name"] = {
                    ["areaID"] = 201,
                },
                ["type"] = 18,
            },
            [10] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 198,
                },
                ["id"] = 862,
                ["name"] = {
                    ["areaID"] = 198,
                },
                ["type"] = 18,
            },
            [11] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 2620,
                },
                ["id"] = 863,
                ["name"] = {
                    ["areaID"] = 2620,
                },
                ["type"] = 18,
            },
            [12] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 2297,
                },
                ["id"] = 864,
                ["name"] = {
                    ["areaID"] = 2297,
                },
                ["type"] = 18,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = {
                    ["areaID"] = 28,
                },
            },
            ["key"] = "AD_EXPLORE",
        },
        ["icon"] = "western_plaguelands",
        ["id"] = 132,
        ["name"] = {
            ["args"] = {
                [1] = {
                    ["areaID"] = 28,
                },
            },
            ["key"] = "AN_EXPLORE",
        },
        ["points"] = 10,
    },
    [133] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 7,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 107,
                },
                ["id"] = 866,
                ["name"] = {
                    ["areaID"] = 107,
                },
                ["type"] = 18,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 108,
                },
                ["id"] = 867,
                ["name"] = {
                    ["areaID"] = 108,
                },
                ["type"] = 18,
            },
            [3] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 916,
                },
                ["id"] = 868,
                ["name"] = {
                    ["areaID"] = 916,
                },
                ["type"] = 18,
            },
            [4] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 109,
                },
                ["id"] = 869,
                ["name"] = {
                    ["areaID"] = 109,
                },
                ["type"] = 18,
            },
            [5] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 918,
                },
                ["id"] = 870,
                ["name"] = {
                    ["areaID"] = 918,
                },
                ["type"] = 18,
            },
            [6] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 111,
                },
                ["id"] = 871,
                ["name"] = {
                    ["areaID"] = 111,
                },
                ["type"] = 18,
            },
            [7] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 917,
                },
                ["id"] = 872,
                ["name"] = {
                    ["areaID"] = 917,
                },
                ["type"] = 18,
            },
            [8] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 113,
                },
                ["id"] = 873,
                ["name"] = {
                    ["areaID"] = 113,
                },
                ["type"] = 18,
            },
            [9] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 219,
                },
                ["id"] = 874,
                ["name"] = {
                    ["areaID"] = 219,
                },
                ["type"] = 18,
            },
            [10] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 20,
                },
                ["id"] = 875,
                ["name"] = {
                    ["areaID"] = 20,
                },
                ["type"] = 18,
            },
            [11] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 115,
                },
                ["id"] = 876,
                ["name"] = {
                    ["areaID"] = 115,
                },
                ["type"] = 18,
            },
            [12] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 921,
                },
                ["id"] = 877,
                ["name"] = {
                    ["areaID"] = 921,
                },
                ["type"] = 18,
            },
            [13] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 922,
                },
                ["id"] = 878,
                ["name"] = {
                    ["areaID"] = 922,
                },
                ["type"] = 18,
            },
            [14] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 920,
                },
                ["id"] = 879,
                ["name"] = {
                    ["areaID"] = 920,
                },
                ["type"] = 18,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = {
                    ["areaID"] = 40,
                },
            },
            ["key"] = "AD_EXPLORE",
        },
        ["icon"] = "westfall",
        ["id"] = 133,
        ["name"] = {
            ["args"] = {
                [1] = {
                    ["areaID"] = 40,
                },
            },
            ["key"] = "AN_EXPLORE",
        },
        ["points"] = 10,
    },
    [134] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 7,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1018,
                },
                ["id"] = 881,
                ["name"] = {
                    ["areaID"] = 1018,
                },
                ["type"] = 18,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1022,
                },
                ["id"] = 882,
                ["name"] = {
                    ["areaID"] = 1022,
                },
                ["type"] = 18,
            },
            [3] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 118,
                },
                ["id"] = 883,
                ["name"] = {
                    ["areaID"] = 118,
                },
                ["type"] = 18,
            },
            [4] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1024,
                },
                ["id"] = 884,
                ["name"] = {
                    ["areaID"] = 1024,
                },
                ["type"] = 18,
            },
            [5] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1023,
                },
                ["id"] = 885,
                ["name"] = {
                    ["areaID"] = 1023,
                },
                ["type"] = 18,
            },
            [6] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 309,
                },
                ["id"] = 886,
                ["name"] = {
                    ["areaID"] = 309,
                },
                ["type"] = 18,
            },
            [7] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 205,
                },
                ["id"] = 887,
                ["name"] = {
                    ["areaID"] = 205,
                },
                ["type"] = 18,
            },
            [8] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1036,
                },
                ["id"] = 888,
                ["name"] = {
                    ["areaID"] = 1036,
                },
                ["type"] = 18,
            },
            [9] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1025,
                },
                ["id"] = 889,
                ["name"] = {
                    ["areaID"] = 1025,
                },
                ["type"] = 18,
            },
            [10] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1020,
                },
                ["id"] = 890,
                ["name"] = {
                    ["areaID"] = 1020,
                },
                ["type"] = 18,
            },
            [11] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1016,
                },
                ["id"] = 891,
                ["name"] = {
                    ["areaID"] = 1016,
                },
                ["type"] = 18,
            },
            [12] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1017,
                },
                ["id"] = 892,
                ["name"] = {
                    ["areaID"] = 1017,
                },
                ["type"] = 18,
            },
            [13] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 150,
                },
                ["id"] = 893,
                ["name"] = {
                    ["areaID"] = 150,
                },
                ["type"] = 18,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = {
                    ["areaID"] = 11,
                },
            },
            ["key"] = "AD_EXPLORE",
        },
        ["icon"] = "wetlands",
        ["id"] = 134,
        ["name"] = {
            ["args"] = {
                [1] = {
                    ["areaID"] = 11,
                },
            },
            ["key"] = "AN_EXPLORE",
        },
        ["points"] = 10,
    },
    [138] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 1,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = "LOVE",
                    [2] = 3444,
                },
                ["id"] = 942,
                ["name"] = "NPC_3444",
                ["type"] = 33,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = "LOVE",
                    [2] = 620,
                },
                ["id"] = 943,
                ["name"] = "NPC_620",
                ["type"] = 33,
            },
            [3] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = "LOVE",
                    [2] = 1420,
                },
                ["id"] = 944,
                ["name"] = "NPC_1420",
                ["type"] = 33,
            },
            [4] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = "LOVE",
                    [2] = 13321,
                },
                ["id"] = 945,
                ["name"] = "NPC_13321",
                ["type"] = 33,
            },
            [5] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = "LOVE",
                    [2] = 2620,
                },
                ["id"] = 946,
                ["name"] = "NPC_2620",
                ["type"] = 33,
            },
            [6] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = "LOVE",
                    [2] = 9600,
                },
                ["id"] = 947,
                ["name"] = "NPC_9600",
                ["type"] = 33,
            },
            [7] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = "LOVE",
                    [2] = 883,
                },
                ["id"] = 948,
                ["name"] = "NPC_883",
                ["type"] = 33,
            },
            [8] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = "LOVE",
                    [2] = 9699,
                },
                ["id"] = 949,
                ["name"] = "NPC_9699",
                ["type"] = 33,
            },
            [9] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = "LOVE",
                    [2] = 4953,
                },
                ["id"] = 950,
                ["name"] = "NPC_4953",
                ["type"] = 33,
            },
            [10] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = "LOVE",
                    [2] = 721,
                },
                ["id"] = 951,
                ["name"] = "NPC_721",
                ["type"] = 33,
            },
            [11] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = "LOVE",
                    [2] = 9700,
                },
                ["id"] = 952,
                ["name"] = "NPC_9700",
                ["type"] = 33,
            },
            [12] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = "LOVE",
                    [2] = 15476,
                },
                ["id"] = 953,
                ["name"] = "NPC_15476",
                ["type"] = 33,
            },
            [13] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = "LOVE",
                    [2] = 2914,
                },
                ["id"] = 954,
                ["name"] = "NPC_2914",
                ["type"] = 33,
            },
            [14] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = "LOVE",
                    [2] = 16030,
                },
                ["id"] = 955,
                ["name"] = "NPC_16030",
                ["type"] = 33,
            },
            [15] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = "LOVE",
                    [2] = 4075,
                },
                ["id"] = 956,
                ["name"] = "NPC_4075",
                ["type"] = 33,
            },
            [16] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = "LOVE",
                    [2] = 1412,
                },
                ["id"] = 957,
                ["name"] = "NPC_1412",
                ["type"] = 33,
            },
            [17] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = "LOVE",
                    [2] = 7390,
                },
                ["id"] = 958,
                ["name"] = "NPC_7390",
                ["type"] = 33,
            },
            [18] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = "LOVE",
                    [2] = 15475,
                },
                ["id"] = 959,
                ["name"] = "NPC_15475",
                ["type"] = 33,
            },
            [19] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = "LOVE",
                    [2] = 15010,
                },
                ["id"] = 960,
                ["name"] = "NPC_15010",
                ["type"] = 33,
            },
            [20] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = "LOVE",
                    [2] = 4076,
                },
                ["id"] = 961,
                ["name"] = "NPC_4076",
                ["type"] = 33,
            },
            [21] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = "LOVE",
                    [2] = 13016,
                },
                ["id"] = 962,
                ["name"] = "NPC_13016",
                ["type"] = 33,
            },
            [22] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = "LOVE",
                    [2] = 14881,
                },
                ["id"] = 963,
                ["name"] = "NPC_14881",
                ["type"] = 33,
            },
            [23] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = "LOVE",
                    [2] = 2110,
                },
                ["id"] = 964,
                ["name"] = "NPC_2110",
                ["type"] = 33,
            },
            [24] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = "LOVE",
                    [2] = 4166,
                },
                ["id"] = 965,
                ["name"] = "NPC_4166",
                ["type"] = 33,
            },
            [25] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = "LOVE",
                    [2] = 1933,
                },
                ["id"] = 966,
                ["name"] = "NPC_1933",
                ["type"] = 33,
            },
            [26] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = "LOVE",
                    [2] = 890,
                },
                ["id"] = 967,
                ["name"] = "NPC_890",
                ["type"] = 33,
            },
            [27] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = "LOVE",
                    [2] = 2098,
                },
                ["id"] = 968,
                ["name"] = "NPC_2098",
                ["type"] = 33,
            },
            [28] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = "LOVE",
                    [2] = 2442,
                },
                ["id"] = 969,
                ["name"] = "NPC_2442",
                ["type"] = 33,
            },
            [29] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = "LOVE",
                    [2] = 6368,
                },
                ["id"] = 970,
                ["name"] = "NPC_6368",
                ["type"] = 33,
            },
            [30] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = "LOVE",
                    [2] = 6271,
                },
                ["id"] = 971,
                ["name"] = "NPC_6271",
                ["type"] = 33,
            },
            [31] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = "LOVE",
                    [2] = 385,
                },
                ["id"] = 972,
                ["name"] = "NPC_385",
                ["type"] = 33,
            },
            [32] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = "LOVE",
                    [2] = 10685,
                },
                ["id"] = 973,
                ["name"] = "NPC_10685",
                ["type"] = 33,
            },
            [33] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = "LOVE",
                    [2] = 3300,
                },
                ["id"] = 974,
                ["name"] = "NPC_3300",
                ["type"] = 33,
            },
        },
        ["description"] = "AD_LOVE",
        ["icon"] = "inv_jewelcrafting_crimsonhare",
        ["id"] = 138,
        ["name"] = "AN_LOVE",
        ["points"] = 10,
    },
    [149] = {
        ["selectors"] = {
            ["A:DRUID"] = 2,
            ["A:HUNTER"] = 2,
            ["A:MAGE"] = 2,
            ["A:PALADIN"] = 2,
            ["A:PRIEST"] = 2,
            ["A:ROGUE"] = 2,
            ["A:SHAMAN"] = 2,
            ["A:WARLOCK"] = 2,
            ["A:WARRIOR"] = 2,
            ["H:DRUID"] = 1,
            ["H:HUNTER"] = 1,
            ["H:MAGE"] = 1,
            ["H:PALADIN"] = 1,
            ["H:PRIEST"] = 1,
            ["H:ROGUE"] = 1,
            ["H:SHAMAN"] = 1,
            ["H:WARLOCK"] = 1,
            ["H:WARRIOR"] = 1,
        },
        ["variants"] = {
            [1] = {
                ["anyCompletable"] = false,
                ["categoryID"] = 10,
                ["criteria"] = {
                    [1] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 1,
                        },
                        ["id"] = 1159,
                        ["name"] = "",
                        ["type"] = 10,
                    },
                },
                ["description"] = {
                    ["args"] = {
                        [1] = "AN_PVP_RANK_H1",
                    },
                    ["key"] = "AD_PVP_RANK",
                },
                ["icon"] = "pvp_rank_1",
                ["id"] = 149,
                ["name"] = "AN_PVP_RANK_H1",
                ["points"] = 0,
            },
            [2] = {
                ["anyCompletable"] = false,
                ["categoryID"] = 10,
                ["criteria"] = {
                    [1] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 1,
                        },
                        ["id"] = 1159,
                        ["name"] = "",
                        ["type"] = 10,
                    },
                },
                ["description"] = {
                    ["args"] = {
                        [1] = "AN_PVP_RANK_A1",
                    },
                    ["key"] = "AD_PVP_RANK",
                },
                ["icon"] = "pvp_rank_1",
                ["id"] = 149,
                ["name"] = "AN_PVP_RANK_A1",
                ["points"] = 0,
            },
        },
    },
    [150] = {
        ["selectors"] = {
            ["A:DRUID"] = 2,
            ["A:HUNTER"] = 2,
            ["A:MAGE"] = 2,
            ["A:PALADIN"] = 2,
            ["A:PRIEST"] = 2,
            ["A:ROGUE"] = 2,
            ["A:SHAMAN"] = 2,
            ["A:WARLOCK"] = 2,
            ["A:WARRIOR"] = 2,
            ["H:DRUID"] = 1,
            ["H:HUNTER"] = 1,
            ["H:MAGE"] = 1,
            ["H:PALADIN"] = 1,
            ["H:PRIEST"] = 1,
            ["H:ROGUE"] = 1,
            ["H:SHAMAN"] = 1,
            ["H:WARLOCK"] = 1,
            ["H:WARRIOR"] = 1,
        },
        ["variants"] = {
            [1] = {
                ["anyCompletable"] = false,
                ["categoryID"] = 10,
                ["criteria"] = {
                    [1] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 2,
                        },
                        ["id"] = 1160,
                        ["name"] = "",
                        ["type"] = 10,
                    },
                },
                ["description"] = {
                    ["args"] = {
                        [1] = "AN_PVP_RANK_H2",
                    },
                    ["key"] = "AD_PVP_RANK",
                },
                ["icon"] = "pvp_rank_2",
                ["id"] = 150,
                ["name"] = "AN_PVP_RANK_H2",
                ["points"] = 0,
            },
            [2] = {
                ["anyCompletable"] = false,
                ["categoryID"] = 10,
                ["criteria"] = {
                    [1] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 2,
                        },
                        ["id"] = 1160,
                        ["name"] = "",
                        ["type"] = 10,
                    },
                },
                ["description"] = {
                    ["args"] = {
                        [1] = "AN_PVP_RANK_A2",
                    },
                    ["key"] = "AD_PVP_RANK",
                },
                ["icon"] = "pvp_rank_2",
                ["id"] = 150,
                ["name"] = "AN_PVP_RANK_A2",
                ["points"] = 0,
            },
        },
    },
    [151] = {
        ["selectors"] = {
            ["A:DRUID"] = 2,
            ["A:HUNTER"] = 2,
            ["A:MAGE"] = 2,
            ["A:PALADIN"] = 2,
            ["A:PRIEST"] = 2,
            ["A:ROGUE"] = 2,
            ["A:SHAMAN"] = 2,
            ["A:WARLOCK"] = 2,
            ["A:WARRIOR"] = 2,
            ["H:DRUID"] = 1,
            ["H:HUNTER"] = 1,
            ["H:MAGE"] = 1,
            ["H:PALADIN"] = 1,
            ["H:PRIEST"] = 1,
            ["H:ROGUE"] = 1,
            ["H:SHAMAN"] = 1,
            ["H:WARLOCK"] = 1,
            ["H:WARRIOR"] = 1,
        },
        ["variants"] = {
            [1] = {
                ["anyCompletable"] = false,
                ["categoryID"] = 10,
                ["criteria"] = {
                    [1] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 3,
                        },
                        ["id"] = 1161,
                        ["name"] = "",
                        ["type"] = 10,
                    },
                },
                ["description"] = {
                    ["args"] = {
                        [1] = "AN_PVP_RANK_H3",
                    },
                    ["key"] = "AD_PVP_RANK",
                },
                ["icon"] = "pvp_rank_3",
                ["id"] = 151,
                ["name"] = "AN_PVP_RANK_H3",
                ["points"] = 0,
            },
            [2] = {
                ["anyCompletable"] = false,
                ["categoryID"] = 10,
                ["criteria"] = {
                    [1] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 3,
                        },
                        ["id"] = 1161,
                        ["name"] = "",
                        ["type"] = 10,
                    },
                },
                ["description"] = {
                    ["args"] = {
                        [1] = "AN_PVP_RANK_A3",
                    },
                    ["key"] = "AD_PVP_RANK",
                },
                ["icon"] = "pvp_rank_3",
                ["id"] = 151,
                ["name"] = "AN_PVP_RANK_A3",
                ["points"] = 0,
            },
        },
    },
    [152] = {
        ["selectors"] = {
            ["A:DRUID"] = 2,
            ["A:HUNTER"] = 2,
            ["A:MAGE"] = 2,
            ["A:PALADIN"] = 2,
            ["A:PRIEST"] = 2,
            ["A:ROGUE"] = 2,
            ["A:SHAMAN"] = 2,
            ["A:WARLOCK"] = 2,
            ["A:WARRIOR"] = 2,
            ["H:DRUID"] = 1,
            ["H:HUNTER"] = 1,
            ["H:MAGE"] = 1,
            ["H:PALADIN"] = 1,
            ["H:PRIEST"] = 1,
            ["H:ROGUE"] = 1,
            ["H:SHAMAN"] = 1,
            ["H:WARLOCK"] = 1,
            ["H:WARRIOR"] = 1,
        },
        ["variants"] = {
            [1] = {
                ["anyCompletable"] = false,
                ["categoryID"] = 10,
                ["criteria"] = {
                    [1] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 4,
                        },
                        ["id"] = 1162,
                        ["name"] = "",
                        ["type"] = 10,
                    },
                },
                ["description"] = {
                    ["args"] = {
                        [1] = "AN_PVP_RANK_H4",
                    },
                    ["key"] = "AD_PVP_RANK",
                },
                ["icon"] = "pvp_rank_4",
                ["id"] = 152,
                ["name"] = "AN_PVP_RANK_H4",
                ["points"] = 0,
            },
            [2] = {
                ["anyCompletable"] = false,
                ["categoryID"] = 10,
                ["criteria"] = {
                    [1] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 4,
                        },
                        ["id"] = 1162,
                        ["name"] = "",
                        ["type"] = 10,
                    },
                },
                ["description"] = {
                    ["args"] = {
                        [1] = "AN_PVP_RANK_A4",
                    },
                    ["key"] = "AD_PVP_RANK",
                },
                ["icon"] = "pvp_rank_4",
                ["id"] = 152,
                ["name"] = "AN_PVP_RANK_A4",
                ["points"] = 0,
            },
        },
    },
    [153] = {
        ["selectors"] = {
            ["A:DRUID"] = 2,
            ["A:HUNTER"] = 2,
            ["A:MAGE"] = 2,
            ["A:PALADIN"] = 2,
            ["A:PRIEST"] = 2,
            ["A:ROGUE"] = 2,
            ["A:SHAMAN"] = 2,
            ["A:WARLOCK"] = 2,
            ["A:WARRIOR"] = 2,
            ["H:DRUID"] = 1,
            ["H:HUNTER"] = 1,
            ["H:MAGE"] = 1,
            ["H:PALADIN"] = 1,
            ["H:PRIEST"] = 1,
            ["H:ROGUE"] = 1,
            ["H:SHAMAN"] = 1,
            ["H:WARLOCK"] = 1,
            ["H:WARRIOR"] = 1,
        },
        ["variants"] = {
            [1] = {
                ["anyCompletable"] = false,
                ["categoryID"] = 10,
                ["criteria"] = {
                    [1] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 5,
                        },
                        ["id"] = 1163,
                        ["name"] = "",
                        ["type"] = 10,
                    },
                },
                ["description"] = {
                    ["args"] = {
                        [1] = "AN_PVP_RANK_H5",
                    },
                    ["key"] = "AD_PVP_RANK",
                },
                ["icon"] = "pvp_rank_5",
                ["id"] = 153,
                ["name"] = "AN_PVP_RANK_H5",
                ["points"] = 0,
            },
            [2] = {
                ["anyCompletable"] = false,
                ["categoryID"] = 10,
                ["criteria"] = {
                    [1] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 5,
                        },
                        ["id"] = 1163,
                        ["name"] = "",
                        ["type"] = 10,
                    },
                },
                ["description"] = {
                    ["args"] = {
                        [1] = "AN_PVP_RANK_A5",
                    },
                    ["key"] = "AD_PVP_RANK",
                },
                ["icon"] = "pvp_rank_5",
                ["id"] = 153,
                ["name"] = "AN_PVP_RANK_A5",
                ["points"] = 0,
            },
        },
    },
    [154] = {
        ["selectors"] = {
            ["A:DRUID"] = 2,
            ["A:HUNTER"] = 2,
            ["A:MAGE"] = 2,
            ["A:PALADIN"] = 2,
            ["A:PRIEST"] = 2,
            ["A:ROGUE"] = 2,
            ["A:SHAMAN"] = 2,
            ["A:WARLOCK"] = 2,
            ["A:WARRIOR"] = 2,
            ["H:DRUID"] = 1,
            ["H:HUNTER"] = 1,
            ["H:MAGE"] = 1,
            ["H:PALADIN"] = 1,
            ["H:PRIEST"] = 1,
            ["H:ROGUE"] = 1,
            ["H:SHAMAN"] = 1,
            ["H:WARLOCK"] = 1,
            ["H:WARRIOR"] = 1,
        },
        ["variants"] = {
            [1] = {
                ["anyCompletable"] = false,
                ["categoryID"] = 10,
                ["criteria"] = {
                    [1] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 6,
                        },
                        ["id"] = 1164,
                        ["name"] = "",
                        ["type"] = 10,
                    },
                },
                ["description"] = {
                    ["args"] = {
                        [1] = "AN_PVP_RANK_H6",
                    },
                    ["key"] = "AD_PVP_RANK",
                },
                ["icon"] = "pvp_rank_6",
                ["id"] = 154,
                ["name"] = "AN_PVP_RANK_H6",
                ["points"] = 0,
            },
            [2] = {
                ["anyCompletable"] = false,
                ["categoryID"] = 10,
                ["criteria"] = {
                    [1] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 6,
                        },
                        ["id"] = 1164,
                        ["name"] = "",
                        ["type"] = 10,
                    },
                },
                ["description"] = {
                    ["args"] = {
                        [1] = "AN_PVP_RANK_A6",
                    },
                    ["key"] = "AD_PVP_RANK",
                },
                ["icon"] = "pvp_rank_6",
                ["id"] = 154,
                ["name"] = "AN_PVP_RANK_A6",
                ["points"] = 0,
            },
        },
    },
    [155] = {
        ["selectors"] = {
            ["A:DRUID"] = 2,
            ["A:HUNTER"] = 2,
            ["A:MAGE"] = 2,
            ["A:PALADIN"] = 2,
            ["A:PRIEST"] = 2,
            ["A:ROGUE"] = 2,
            ["A:SHAMAN"] = 2,
            ["A:WARLOCK"] = 2,
            ["A:WARRIOR"] = 2,
            ["H:DRUID"] = 1,
            ["H:HUNTER"] = 1,
            ["H:MAGE"] = 1,
            ["H:PALADIN"] = 1,
            ["H:PRIEST"] = 1,
            ["H:ROGUE"] = 1,
            ["H:SHAMAN"] = 1,
            ["H:WARLOCK"] = 1,
            ["H:WARRIOR"] = 1,
        },
        ["variants"] = {
            [1] = {
                ["anyCompletable"] = false,
                ["categoryID"] = 10,
                ["criteria"] = {
                    [1] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 7,
                        },
                        ["id"] = 1165,
                        ["name"] = "",
                        ["type"] = 10,
                    },
                },
                ["description"] = {
                    ["args"] = {
                        [1] = "AN_PVP_RANK_H7",
                    },
                    ["key"] = "AD_PVP_RANK",
                },
                ["icon"] = "pvp_rank_7",
                ["id"] = 155,
                ["name"] = "AN_PVP_RANK_H7",
                ["points"] = 0,
            },
            [2] = {
                ["anyCompletable"] = false,
                ["categoryID"] = 10,
                ["criteria"] = {
                    [1] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 7,
                        },
                        ["id"] = 1165,
                        ["name"] = "",
                        ["type"] = 10,
                    },
                },
                ["description"] = {
                    ["args"] = {
                        [1] = "AN_PVP_RANK_A7",
                    },
                    ["key"] = "AD_PVP_RANK",
                },
                ["icon"] = "pvp_rank_7",
                ["id"] = 155,
                ["name"] = "AN_PVP_RANK_A7",
                ["points"] = 0,
            },
        },
    },
    [156] = {
        ["selectors"] = {
            ["A:DRUID"] = 2,
            ["A:HUNTER"] = 2,
            ["A:MAGE"] = 2,
            ["A:PALADIN"] = 2,
            ["A:PRIEST"] = 2,
            ["A:ROGUE"] = 2,
            ["A:SHAMAN"] = 2,
            ["A:WARLOCK"] = 2,
            ["A:WARRIOR"] = 2,
            ["H:DRUID"] = 1,
            ["H:HUNTER"] = 1,
            ["H:MAGE"] = 1,
            ["H:PALADIN"] = 1,
            ["H:PRIEST"] = 1,
            ["H:ROGUE"] = 1,
            ["H:SHAMAN"] = 1,
            ["H:WARLOCK"] = 1,
            ["H:WARRIOR"] = 1,
        },
        ["variants"] = {
            [1] = {
                ["anyCompletable"] = false,
                ["categoryID"] = 10,
                ["criteria"] = {
                    [1] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 8,
                        },
                        ["id"] = 1166,
                        ["name"] = "",
                        ["type"] = 10,
                    },
                },
                ["description"] = {
                    ["args"] = {
                        [1] = "AN_PVP_RANK_H8",
                    },
                    ["key"] = "AD_PVP_RANK",
                },
                ["icon"] = "pvp_rank_8",
                ["id"] = 156,
                ["name"] = "AN_PVP_RANK_H8",
                ["points"] = 0,
            },
            [2] = {
                ["anyCompletable"] = false,
                ["categoryID"] = 10,
                ["criteria"] = {
                    [1] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 8,
                        },
                        ["id"] = 1166,
                        ["name"] = "",
                        ["type"] = 10,
                    },
                },
                ["description"] = {
                    ["args"] = {
                        [1] = "AN_PVP_RANK_A8",
                    },
                    ["key"] = "AD_PVP_RANK",
                },
                ["icon"] = "pvp_rank_8",
                ["id"] = 156,
                ["name"] = "AN_PVP_RANK_A8",
                ["points"] = 0,
            },
        },
    },
    [157] = {
        ["selectors"] = {
            ["A:DRUID"] = 2,
            ["A:HUNTER"] = 2,
            ["A:MAGE"] = 2,
            ["A:PALADIN"] = 2,
            ["A:PRIEST"] = 2,
            ["A:ROGUE"] = 2,
            ["A:SHAMAN"] = 2,
            ["A:WARLOCK"] = 2,
            ["A:WARRIOR"] = 2,
            ["H:DRUID"] = 1,
            ["H:HUNTER"] = 1,
            ["H:MAGE"] = 1,
            ["H:PALADIN"] = 1,
            ["H:PRIEST"] = 1,
            ["H:ROGUE"] = 1,
            ["H:SHAMAN"] = 1,
            ["H:WARLOCK"] = 1,
            ["H:WARRIOR"] = 1,
        },
        ["variants"] = {
            [1] = {
                ["anyCompletable"] = false,
                ["categoryID"] = 10,
                ["criteria"] = {
                    [1] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 9,
                        },
                        ["id"] = 1167,
                        ["name"] = "",
                        ["type"] = 10,
                    },
                },
                ["description"] = {
                    ["args"] = {
                        [1] = "AN_PVP_RANK_H9",
                    },
                    ["key"] = "AD_PVP_RANK",
                },
                ["icon"] = "pvp_rank_9",
                ["id"] = 157,
                ["name"] = "AN_PVP_RANK_H9",
                ["points"] = 0,
            },
            [2] = {
                ["anyCompletable"] = false,
                ["categoryID"] = 10,
                ["criteria"] = {
                    [1] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 9,
                        },
                        ["id"] = 1167,
                        ["name"] = "",
                        ["type"] = 10,
                    },
                },
                ["description"] = {
                    ["args"] = {
                        [1] = "AN_PVP_RANK_A9",
                    },
                    ["key"] = "AD_PVP_RANK",
                },
                ["icon"] = "pvp_rank_9",
                ["id"] = 157,
                ["name"] = "AN_PVP_RANK_A9",
                ["points"] = 0,
            },
        },
    },
    [158] = {
        ["selectors"] = {
            ["A:DRUID"] = 2,
            ["A:HUNTER"] = 2,
            ["A:MAGE"] = 2,
            ["A:PALADIN"] = 2,
            ["A:PRIEST"] = 2,
            ["A:ROGUE"] = 2,
            ["A:SHAMAN"] = 2,
            ["A:WARLOCK"] = 2,
            ["A:WARRIOR"] = 2,
            ["H:DRUID"] = 1,
            ["H:HUNTER"] = 1,
            ["H:MAGE"] = 1,
            ["H:PALADIN"] = 1,
            ["H:PRIEST"] = 1,
            ["H:ROGUE"] = 1,
            ["H:SHAMAN"] = 1,
            ["H:WARLOCK"] = 1,
            ["H:WARRIOR"] = 1,
        },
        ["variants"] = {
            [1] = {
                ["anyCompletable"] = false,
                ["categoryID"] = 10,
                ["criteria"] = {
                    [1] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 10,
                        },
                        ["id"] = 1168,
                        ["name"] = "",
                        ["type"] = 10,
                    },
                },
                ["description"] = {
                    ["args"] = {
                        [1] = "AN_PVP_RANK_H10",
                    },
                    ["key"] = "AD_PVP_RANK",
                },
                ["icon"] = "pvp_rank_10",
                ["id"] = 158,
                ["name"] = "AN_PVP_RANK_H10",
                ["points"] = 0,
            },
            [2] = {
                ["anyCompletable"] = false,
                ["categoryID"] = 10,
                ["criteria"] = {
                    [1] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 10,
                        },
                        ["id"] = 1168,
                        ["name"] = "",
                        ["type"] = 10,
                    },
                },
                ["description"] = {
                    ["args"] = {
                        [1] = "AN_PVP_RANK_A10",
                    },
                    ["key"] = "AD_PVP_RANK",
                },
                ["icon"] = "pvp_rank_10",
                ["id"] = 158,
                ["name"] = "AN_PVP_RANK_A10",
                ["points"] = 0,
            },
        },
    },
    [159] = {
        ["selectors"] = {
            ["A:DRUID"] = 2,
            ["A:HUNTER"] = 2,
            ["A:MAGE"] = 2,
            ["A:PALADIN"] = 2,
            ["A:PRIEST"] = 2,
            ["A:ROGUE"] = 2,
            ["A:SHAMAN"] = 2,
            ["A:WARLOCK"] = 2,
            ["A:WARRIOR"] = 2,
            ["H:DRUID"] = 1,
            ["H:HUNTER"] = 1,
            ["H:MAGE"] = 1,
            ["H:PALADIN"] = 1,
            ["H:PRIEST"] = 1,
            ["H:ROGUE"] = 1,
            ["H:SHAMAN"] = 1,
            ["H:WARLOCK"] = 1,
            ["H:WARRIOR"] = 1,
        },
        ["variants"] = {
            [1] = {
                ["anyCompletable"] = false,
                ["categoryID"] = 10,
                ["criteria"] = {
                    [1] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 11,
                        },
                        ["id"] = 1169,
                        ["name"] = "",
                        ["type"] = 10,
                    },
                },
                ["description"] = {
                    ["args"] = {
                        [1] = "AN_PVP_RANK_H11",
                    },
                    ["key"] = "AD_PVP_RANK",
                },
                ["icon"] = "pvp_rank_11",
                ["id"] = 159,
                ["name"] = "AN_PVP_RANK_H11",
                ["points"] = 0,
            },
            [2] = {
                ["anyCompletable"] = false,
                ["categoryID"] = 10,
                ["criteria"] = {
                    [1] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 11,
                        },
                        ["id"] = 1169,
                        ["name"] = "",
                        ["type"] = 10,
                    },
                },
                ["description"] = {
                    ["args"] = {
                        [1] = "AN_PVP_RANK_A11",
                    },
                    ["key"] = "AD_PVP_RANK",
                },
                ["icon"] = "pvp_rank_11",
                ["id"] = 159,
                ["name"] = "AN_PVP_RANK_A11",
                ["points"] = 0,
            },
        },
    },
    [160] = {
        ["selectors"] = {
            ["A:DRUID"] = 2,
            ["A:HUNTER"] = 2,
            ["A:MAGE"] = 2,
            ["A:PALADIN"] = 2,
            ["A:PRIEST"] = 2,
            ["A:ROGUE"] = 2,
            ["A:SHAMAN"] = 2,
            ["A:WARLOCK"] = 2,
            ["A:WARRIOR"] = 2,
            ["H:DRUID"] = 1,
            ["H:HUNTER"] = 1,
            ["H:MAGE"] = 1,
            ["H:PALADIN"] = 1,
            ["H:PRIEST"] = 1,
            ["H:ROGUE"] = 1,
            ["H:SHAMAN"] = 1,
            ["H:WARLOCK"] = 1,
            ["H:WARRIOR"] = 1,
        },
        ["variants"] = {
            [1] = {
                ["anyCompletable"] = false,
                ["categoryID"] = 10,
                ["criteria"] = {
                    [1] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 12,
                        },
                        ["id"] = 1170,
                        ["name"] = "",
                        ["type"] = 10,
                    },
                },
                ["description"] = {
                    ["args"] = {
                        [1] = "AN_PVP_RANK_H12",
                    },
                    ["key"] = "AD_PVP_RANK",
                },
                ["icon"] = "pvp_rank_12",
                ["id"] = 160,
                ["name"] = "AN_PVP_RANK_H12",
                ["points"] = 0,
            },
            [2] = {
                ["anyCompletable"] = false,
                ["categoryID"] = 10,
                ["criteria"] = {
                    [1] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 12,
                        },
                        ["id"] = 1170,
                        ["name"] = "",
                        ["type"] = 10,
                    },
                },
                ["description"] = {
                    ["args"] = {
                        [1] = "AN_PVP_RANK_A12",
                    },
                    ["key"] = "AD_PVP_RANK",
                },
                ["icon"] = "pvp_rank_12",
                ["id"] = 160,
                ["name"] = "AN_PVP_RANK_A12",
                ["points"] = 0,
            },
        },
    },
    [161] = {
        ["selectors"] = {
            ["A:DRUID"] = 2,
            ["A:HUNTER"] = 2,
            ["A:MAGE"] = 2,
            ["A:PALADIN"] = 2,
            ["A:PRIEST"] = 2,
            ["A:ROGUE"] = 2,
            ["A:SHAMAN"] = 2,
            ["A:WARLOCK"] = 2,
            ["A:WARRIOR"] = 2,
            ["H:DRUID"] = 1,
            ["H:HUNTER"] = 1,
            ["H:MAGE"] = 1,
            ["H:PALADIN"] = 1,
            ["H:PRIEST"] = 1,
            ["H:ROGUE"] = 1,
            ["H:SHAMAN"] = 1,
            ["H:WARLOCK"] = 1,
            ["H:WARRIOR"] = 1,
        },
        ["variants"] = {
            [1] = {
                ["anyCompletable"] = false,
                ["categoryID"] = 10,
                ["criteria"] = {
                    [1] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 13,
                        },
                        ["id"] = 1171,
                        ["name"] = "",
                        ["type"] = 10,
                    },
                },
                ["description"] = {
                    ["args"] = {
                        [1] = "AN_PVP_RANK_H13",
                    },
                    ["key"] = "AD_PVP_RANK",
                },
                ["icon"] = "pvp_rank_13",
                ["id"] = 161,
                ["name"] = "AN_PVP_RANK_H13",
                ["points"] = 0,
            },
            [2] = {
                ["anyCompletable"] = false,
                ["categoryID"] = 10,
                ["criteria"] = {
                    [1] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 13,
                        },
                        ["id"] = 1171,
                        ["name"] = "",
                        ["type"] = 10,
                    },
                },
                ["description"] = {
                    ["args"] = {
                        [1] = "AN_PVP_RANK_A13",
                    },
                    ["key"] = "AD_PVP_RANK",
                },
                ["icon"] = "pvp_rank_13",
                ["id"] = 161,
                ["name"] = "AN_PVP_RANK_A13",
                ["points"] = 0,
            },
        },
    },
    [162] = {
        ["selectors"] = {
            ["A:DRUID"] = 2,
            ["A:HUNTER"] = 2,
            ["A:MAGE"] = 2,
            ["A:PALADIN"] = 2,
            ["A:PRIEST"] = 2,
            ["A:ROGUE"] = 2,
            ["A:SHAMAN"] = 2,
            ["A:WARLOCK"] = 2,
            ["A:WARRIOR"] = 2,
            ["H:DRUID"] = 1,
            ["H:HUNTER"] = 1,
            ["H:MAGE"] = 1,
            ["H:PALADIN"] = 1,
            ["H:PRIEST"] = 1,
            ["H:ROGUE"] = 1,
            ["H:SHAMAN"] = 1,
            ["H:WARLOCK"] = 1,
            ["H:WARRIOR"] = 1,
        },
        ["variants"] = {
            [1] = {
                ["anyCompletable"] = false,
                ["categoryID"] = 10,
                ["criteria"] = {
                    [1] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 14,
                        },
                        ["id"] = 1172,
                        ["name"] = "",
                        ["type"] = 10,
                    },
                },
                ["description"] = {
                    ["args"] = {
                        [1] = "AN_PVP_RANK_H14",
                    },
                    ["key"] = "AD_PVP_RANK",
                },
                ["icon"] = "pvp_rank_14",
                ["id"] = 162,
                ["name"] = "AN_PVP_RANK_H14",
                ["points"] = 0,
            },
            [2] = {
                ["anyCompletable"] = false,
                ["categoryID"] = 10,
                ["criteria"] = {
                    [1] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 14,
                        },
                        ["id"] = 1172,
                        ["name"] = "",
                        ["type"] = 10,
                    },
                },
                ["description"] = {
                    ["args"] = {
                        [1] = "AN_PVP_RANK_A14",
                    },
                    ["key"] = "AD_PVP_RANK",
                },
                ["icon"] = "pvp_rank_14",
                ["id"] = 162,
                ["name"] = "AN_PVP_RANK_A14",
                ["points"] = 0,
            },
        },
    },
    [163] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 10,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {},
                ["id"] = 1173,
                ["name"] = "AC_PVP_FIRST_KILL",
                ["quantity"] = 1,
                ["type"] = 6,
            },
        },
        ["description"] = "AD_PVP_FIRST_KILL",
        ["icon"] = "achievement_pvp_p_01",
        ["id"] = 163,
        ["name"] = "AN_PVP_FIRST_KILL",
        ["nextID"] = 164,
        ["points"] = 10,
    },
    [164] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 10,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {},
                ["id"] = 1174,
                ["name"] = {
                    ["args"] = {
                        [1] = 10,
                    },
                    ["key"] = "AC_PVP_KILLS",
                },
                ["quantity"] = 10,
                ["type"] = 6,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 10,
            },
            ["key"] = "AD_PVP_KILLS",
        },
        ["icon"] = "achievement_pvp_p_02",
        ["id"] = 164,
        ["name"] = {
            ["args"] = {
                [1] = 10,
            },
            ["key"] = "AN_PVP_KILLS",
        },
        ["nextID"] = 165,
        ["points"] = 10,
        ["previousID"] = 163,
    },
    [165] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 10,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {},
                ["id"] = 1175,
                ["name"] = {
                    ["args"] = {
                        [1] = 100,
                    },
                    ["key"] = "AC_PVP_KILLS",
                },
                ["quantity"] = 100,
                ["type"] = 6,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 100,
            },
            ["key"] = "AD_PVP_KILLS",
        },
        ["icon"] = "achievement_pvp_p_03",
        ["id"] = 165,
        ["name"] = {
            ["args"] = {
                [1] = 100,
            },
            ["key"] = "AN_PVP_KILLS",
        },
        ["nextID"] = 166,
        ["points"] = 10,
        ["previousID"] = 164,
    },
    [166] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 10,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {},
                ["id"] = 1176,
                ["name"] = {
                    ["args"] = {
                        [1] = 250,
                    },
                    ["key"] = "AC_PVP_KILLS",
                },
                ["quantity"] = 250,
                ["type"] = 6,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 250,
            },
            ["key"] = "AD_PVP_KILLS",
        },
        ["icon"] = "achievement_pvp_p_04",
        ["id"] = 166,
        ["name"] = {
            ["args"] = {
                [1] = 250,
            },
            ["key"] = "AN_PVP_KILLS",
        },
        ["nextID"] = 167,
        ["points"] = 10,
        ["previousID"] = 165,
    },
    [167] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 10,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {},
                ["id"] = 1177,
                ["name"] = {
                    ["args"] = {
                        [1] = 500,
                    },
                    ["key"] = "AC_PVP_KILLS",
                },
                ["quantity"] = 500,
                ["type"] = 6,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 500,
            },
            ["key"] = "AD_PVP_KILLS",
        },
        ["icon"] = "achievement_pvp_p_05",
        ["id"] = 167,
        ["name"] = {
            ["args"] = {
                [1] = 500,
            },
            ["key"] = "AN_PVP_KILLS",
        },
        ["nextID"] = 168,
        ["points"] = 10,
        ["previousID"] = 166,
    },
    [168] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 10,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {},
                ["id"] = 1178,
                ["name"] = {
                    ["numberFormat"] = {
                        ["args"] = {
                            [1] = 1000,
                        },
                        ["key"] = "AC_PVP_KILLS",
                    },
                },
                ["quantity"] = 1000,
                ["type"] = 6,
            },
        },
        ["description"] = {
            ["numberFormat"] = {
                ["args"] = {
                    [1] = 1000,
                },
                ["key"] = "AD_PVP_KILLS",
            },
        },
        ["icon"] = "achievement_pvp_p_06",
        ["id"] = 168,
        ["name"] = {
            ["numberFormat"] = {
                ["args"] = {
                    [1] = 1000,
                },
                ["key"] = "AN_PVP_KILLS",
            },
        },
        ["nextID"] = 169,
        ["points"] = 10,
        ["previousID"] = 167,
    },
    [169] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 10,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {},
                ["id"] = 1179,
                ["name"] = {
                    ["numberFormat"] = {
                        ["args"] = {
                            [1] = 2500,
                        },
                        ["key"] = "AC_PVP_KILLS",
                    },
                },
                ["quantity"] = 2500,
                ["type"] = 6,
            },
        },
        ["description"] = {
            ["numberFormat"] = {
                ["args"] = {
                    [1] = 2500,
                },
                ["key"] = "AD_PVP_KILLS",
            },
        },
        ["icon"] = "achievement_pvp_p_07",
        ["id"] = 169,
        ["name"] = {
            ["numberFormat"] = {
                ["args"] = {
                    [1] = 2500,
                },
                ["key"] = "AN_PVP_KILLS",
            },
        },
        ["nextID"] = 170,
        ["points"] = 10,
        ["previousID"] = 168,
    },
    [170] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 10,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {},
                ["id"] = 1180,
                ["name"] = {
                    ["numberFormat"] = {
                        ["args"] = {
                            [1] = 5000,
                        },
                        ["key"] = "AC_PVP_KILLS",
                    },
                },
                ["quantity"] = 5000,
                ["type"] = 6,
            },
        },
        ["description"] = {
            ["numberFormat"] = {
                ["args"] = {
                    [1] = 5000,
                },
                ["key"] = "AD_PVP_KILLS",
            },
        },
        ["icon"] = "achievement_pvp_p_08",
        ["id"] = 170,
        ["name"] = {
            ["numberFormat"] = {
                ["args"] = {
                    [1] = 5000,
                },
                ["key"] = "AN_PVP_KILLS",
            },
        },
        ["nextID"] = 171,
        ["points"] = 10,
        ["previousID"] = 169,
    },
    [171] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 10,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {},
                ["id"] = 1181,
                ["name"] = {
                    ["numberFormat"] = {
                        ["args"] = {
                            [1] = 10000,
                        },
                        ["key"] = "AC_PVP_KILLS",
                    },
                },
                ["quantity"] = 10000,
                ["type"] = 6,
            },
        },
        ["description"] = {
            ["numberFormat"] = {
                ["args"] = {
                    [1] = 10000,
                },
                ["key"] = "AD_PVP_KILLS",
            },
        },
        ["icon"] = "achievement_pvp_p_09",
        ["id"] = 171,
        ["name"] = {
            ["numberFormat"] = {
                ["args"] = {
                    [1] = 10000,
                },
                ["key"] = "AN_PVP_KILLS",
            },
        },
        ["nextID"] = 172,
        ["points"] = 10,
        ["previousID"] = 170,
    },
    [172] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 10,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {},
                ["id"] = 1182,
                ["name"] = {
                    ["numberFormat"] = {
                        ["args"] = {
                            [1] = 25000,
                        },
                        ["key"] = "AC_PVP_KILLS",
                    },
                },
                ["quantity"] = 25000,
                ["type"] = 6,
            },
        },
        ["description"] = {
            ["numberFormat"] = {
                ["args"] = {
                    [1] = 25000,
                },
                ["key"] = "AD_PVP_KILLS",
            },
        },
        ["icon"] = "achievement_pvp_p_10",
        ["id"] = 172,
        ["name"] = {
            ["numberFormat"] = {
                ["args"] = {
                    [1] = 25000,
                },
                ["key"] = "AN_PVP_KILLS",
            },
        },
        ["nextID"] = 173,
        ["points"] = 10,
        ["previousID"] = 171,
    },
    [173] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 10,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {},
                ["id"] = 1183,
                ["name"] = {
                    ["numberFormat"] = {
                        ["args"] = {
                            [1] = 50000,
                        },
                        ["key"] = "AC_PVP_KILLS",
                    },
                },
                ["quantity"] = 50000,
                ["type"] = 6,
            },
        },
        ["description"] = {
            ["numberFormat"] = {
                ["args"] = {
                    [1] = 50000,
                },
                ["key"] = "AD_PVP_KILLS",
            },
        },
        ["icon"] = "achievement_pvp_p_11",
        ["id"] = 173,
        ["name"] = {
            ["numberFormat"] = {
                ["args"] = {
                    [1] = 50000,
                },
                ["key"] = "AN_PVP_KILLS",
            },
        },
        ["nextID"] = 174,
        ["points"] = 10,
        ["previousID"] = 172,
    },
    [174] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 10,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {},
                ["id"] = 1184,
                ["name"] = {
                    ["numberFormat"] = {
                        ["args"] = {
                            [1] = 100000,
                        },
                        ["key"] = "AC_PVP_KILLS",
                    },
                },
                ["quantity"] = 100000,
                ["type"] = 6,
            },
        },
        ["description"] = {
            ["numberFormat"] = {
                ["args"] = {
                    [1] = 100000,
                },
                ["key"] = "AD_PVP_KILLS",
            },
        },
        ["icon"] = "achievement_pvp_p_12",
        ["id"] = 174,
        ["name"] = {
            ["numberFormat"] = {
                ["args"] = {
                    [1] = 100000,
                },
                ["key"] = "AN_PVP_KILLS",
            },
        },
        ["nextID"] = 175,
        ["points"] = 10,
        ["previousID"] = 173,
    },
    [175] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 10,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {},
                ["id"] = 1185,
                ["name"] = {
                    ["numberFormat"] = {
                        ["args"] = {
                            [1] = 250000,
                        },
                        ["key"] = "AC_PVP_KILLS",
                    },
                },
                ["quantity"] = 250000,
                ["type"] = 6,
            },
        },
        ["description"] = {
            ["numberFormat"] = {
                ["args"] = {
                    [1] = 250000,
                },
                ["key"] = "AD_PVP_KILLS",
            },
        },
        ["icon"] = "achievement_pvp_p_13",
        ["id"] = 175,
        ["name"] = {
            ["numberFormat"] = {
                ["args"] = {
                    [1] = 250000,
                },
                ["key"] = "AN_PVP_KILLS",
            },
        },
        ["nextID"] = 176,
        ["points"] = 10,
        ["previousID"] = 174,
    },
    [176] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 10,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {},
                ["id"] = 1186,
                ["name"] = {
                    ["numberFormat"] = {
                        ["args"] = {
                            [1] = 500000,
                        },
                        ["key"] = "AC_PVP_KILLS",
                    },
                },
                ["quantity"] = 500000,
                ["type"] = 6,
            },
        },
        ["description"] = {
            ["numberFormat"] = {
                ["args"] = {
                    [1] = 500000,
                },
                ["key"] = "AD_PVP_KILLS",
            },
        },
        ["icon"] = "achievement_pvp_p_14",
        ["id"] = 176,
        ["name"] = {
            ["numberFormat"] = {
                ["args"] = {
                    [1] = 500000,
                },
                ["key"] = "AN_PVP_KILLS",
            },
        },
        ["points"] = 10,
        ["previousID"] = 175,
    },
    [177] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 12,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 510,
                    [2] = 8,
                },
                ["id"] = 1187,
                ["name"] = "",
                ["type"] = 16,
            },
        },
        ["description"] = "AD_DEFILERS",
        ["faction"] = true,
        ["icon"] = "spell_shadow_psychichorrors",
        ["id"] = 177,
        ["name"] = "AN_DEFILERS",
        ["points"] = 10,
    },
    [178] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 14,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 729,
                    [2] = 8,
                },
                ["id"] = 1188,
                ["name"] = "",
                ["type"] = 16,
            },
        },
        ["description"] = "AD_FROSTWOLF_CLAN",
        ["faction"] = true,
        ["icon"] = "-Inv_Jewelry_FrostwolfTrinket_05",
        ["id"] = 178,
        ["name"] = "AN_FROSTWOLF_CLAN",
        ["points"] = 10,
    },
    [179] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 11,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 889,
                    [2] = 8,
                },
                ["id"] = 1189,
                ["name"] = "",
                ["type"] = 16,
            },
        },
        ["description"] = "AD_WARSONG_OUTRIDERS",
        ["faction"] = true,
        ["icon"] = "-ability_warrior_warcry",
        ["id"] = 179,
        ["name"] = "AN_WARSONG_OUTRIDERS",
        ["points"] = 10,
    },
    [180] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 10,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 177,
                },
                ["id"] = 1190,
                ["name"] = "AN_DEFILERS",
                ["type"] = 20,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 178,
                },
                ["id"] = 1191,
                ["name"] = "AN_FROSTWOLF_CLAN",
                ["type"] = 20,
            },
            [3] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 179,
                },
                ["id"] = 1192,
                ["name"] = "AN_WARSONG_OUTRIDERS",
                ["type"] = 20,
            },
        },
        ["description"] = "AD_HORDE_PVP_FRACTIONS",
        ["faction"] = true,
        ["icon"] = "-inv_misc_tabardpvp_04",
        ["id"] = 180,
        ["name"] = "AN_HORDE_PVP_FRACTIONS",
        ["points"] = 10,
    },
    [181] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 12,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 509,
                    [2] = 8,
                },
                ["id"] = 1193,
                ["name"] = "",
                ["type"] = 16,
            },
        },
        ["description"] = "AD_LEAGUE_OF_ARATHOR",
        ["faction"] = false,
        ["icon"] = "-ability_warrior_rallyingcry",
        ["id"] = 181,
        ["name"] = "AN_LEAGUE_OF_ARATHOR",
        ["points"] = 10,
    },
    [182] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 14,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 730,
                    [2] = 8,
                },
                ["id"] = 1194,
                ["name"] = "",
                ["type"] = 16,
            },
        },
        ["description"] = "AD_STORMSPIKE_GUARD",
        ["faction"] = false,
        ["icon"] = "-Inv_Jewelry_Stormpiketrinket_05",
        ["id"] = 182,
        ["name"] = "AN_STORMSPIKE_GUARD",
        ["points"] = 10,
    },
    [183] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 11,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 890,
                    [2] = 8,
                },
                ["id"] = 1195,
                ["name"] = "",
                ["type"] = 16,
            },
        },
        ["description"] = "AD_SILVERWING_SENTINELS",
        ["faction"] = false,
        ["icon"] = "-Ability_Racial_Shadowmeld",
        ["id"] = 183,
        ["name"] = "AN_SILVERWING_SENTINELS",
        ["points"] = 10,
    },
    [184] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 10,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 181,
                },
                ["id"] = 1196,
                ["name"] = "AN_LEAGUE_OF_ARATHOR",
                ["type"] = 20,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 182,
                },
                ["id"] = 1197,
                ["name"] = "AN_STORMSPIKE_GUARD",
                ["type"] = 20,
            },
            [3] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 183,
                },
                ["id"] = 1198,
                ["name"] = "AN_SILVERWING_SENTINELS",
                ["type"] = 20,
            },
        },
        ["description"] = "AD_ALLIANCE_PVP_FRACTIONS",
        ["faction"] = false,
        ["icon"] = "-inv_misc_tabardpvp_03",
        ["id"] = 184,
        ["name"] = "AN_ALLIANCE_PVP_FRACTIONS",
        ["points"] = 10,
    },
    [185] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 10,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1748,
                },
                ["id"] = 1199,
                ["name"] = "",
                ["type"] = 1,
            },
        },
        ["description"] = "AD_BOLVAR_SLAYER",
        ["faction"] = true,
        ["icon"] = "achievement_leader_king_varian_wrynn",
        ["id"] = 185,
        ["name"] = "AN_BOLVAR_SLAYER",
        ["points"] = 10,
    },
    [186] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 10,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 2784,
                },
                ["id"] = 1200,
                ["name"] = "",
                ["type"] = 1,
            },
        },
        ["description"] = "AD_MAGNI_SLAYER",
        ["faction"] = true,
        ["icon"] = "achievement_leader_king_magni_bronzebeard",
        ["id"] = 186,
        ["name"] = "AN_MAGNI_SLAYER",
        ["points"] = 10,
    },
    [187] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 10,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 7999,
                },
                ["id"] = 1201,
                ["name"] = "",
                ["type"] = 1,
            },
        },
        ["description"] = "AD_TYRANDE_SLAYER",
        ["faction"] = true,
        ["icon"] = "achievement_leader_tyrande_whisperwind",
        ["id"] = 187,
        ["name"] = "AN_TYRANDE_SLAYER",
        ["points"] = 10,
    },
    [189] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 10,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 185,
                },
                ["id"] = 1203,
                ["name"] = "AN_BOLVAR_SLAYER",
                ["type"] = 20,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 186,
                },
                ["id"] = 1204,
                ["name"] = "AN_MAGNI_SLAYER",
                ["type"] = 20,
            },
            [3] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 187,
                },
                ["id"] = 1205,
                ["name"] = "AN_TYRANDE_SLAYER",
                ["type"] = 20,
            },
        },
        ["description"] = "AD_ALLIANCE_KINGS_SLAYER",
        ["faction"] = true,
        ["icon"] = "-inv_bannerpvp_01",
        ["id"] = 189,
        ["name"] = "AN_ALLIANCE_KINGS_SLAYER",
        ["points"] = 20,
    },
    [190] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 10,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 4949,
                },
                ["id"] = 1206,
                ["name"] = "",
                ["type"] = 1,
            },
        },
        ["description"] = "AD_THRALL_SLAYER",
        ["faction"] = false,
        ["icon"] = "Achievement_Leader_ Thrall",
        ["id"] = 190,
        ["name"] = "AN_THRALL_SLAYER",
        ["points"] = 10,
    },
    [191] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 10,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 10181,
                },
                ["id"] = 1207,
                ["name"] = "",
                ["type"] = 1,
            },
        },
        ["description"] = "AD_SYLVANAS_SLAYER",
        ["faction"] = false,
        ["icon"] = "Achievement_leader_sylvanas",
        ["id"] = 191,
        ["name"] = "AN_SYLVANAS_SLAYER",
        ["points"] = 10,
    },
    [192] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 10,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 3057,
                },
                ["id"] = 1208,
                ["name"] = "",
                ["type"] = 1,
            },
        },
        ["description"] = "AD_CAIRNE_SLAYER",
        ["faction"] = false,
        ["icon"] = "Achievement_Leader_Cairne Bloodhoof",
        ["id"] = 192,
        ["name"] = "AN_CAIRNE_SLAYER",
        ["points"] = 10,
    },
    [194] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 10,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 190,
                },
                ["id"] = 1210,
                ["name"] = "AN_THRALL_SLAYER",
                ["type"] = 20,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 191,
                },
                ["id"] = 1211,
                ["name"] = "AN_SYLVANAS_SLAYER",
                ["type"] = 20,
            },
            [3] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 192,
                },
                ["id"] = 1212,
                ["name"] = "AN_CAIRNE_SLAYER",
                ["type"] = 20,
            },
        },
        ["description"] = "AD_HORDE_KINGS_SLAYER",
        ["faction"] = false,
        ["icon"] = "-inv_bannerpvp_02",
        ["id"] = 194,
        ["name"] = "AN_HORDE_KINGS_SLAYER",
        ["points"] = 20,
    },
    [195] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 10,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = "HUMAN",
                },
                ["id"] = 1213,
                ["name"] = "AC_HUMAN_KILLED",
                ["type"] = 7,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = "NIGHTELF",
                },
                ["id"] = 1214,
                ["name"] = "AC_NIGHTELF_KILLED",
                ["type"] = 7,
            },
            [3] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = "DWARF",
                },
                ["id"] = 1215,
                ["name"] = "AC_DWARF_KILLED",
                ["type"] = 7,
            },
            [4] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = "GNOME",
                },
                ["id"] = 1216,
                ["name"] = "AC_GNOME_KILLED",
                ["type"] = 7,
            },
        },
        ["description"] = "AD_ALLIANCE_RACES_KILLER",
        ["faction"] = true,
        ["icon"] = "-Ability_Gouge",
        ["id"] = 195,
        ["name"] = "AN_RACES_KILLER",
        ["points"] = 10,
    },
    [196] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 10,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = "ORC",
                },
                ["id"] = 1217,
                ["name"] = "AC_ORC_KILLED",
                ["type"] = 7,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = "TROLL",
                },
                ["id"] = 1218,
                ["name"] = "AC_TROLL_KILLED",
                ["type"] = 7,
            },
            [3] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = "SCOURGE",
                },
                ["id"] = 1219,
                ["name"] = "AC_SCOURGE_KILLED",
                ["type"] = 7,
            },
            [4] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = "TAUREN",
                },
                ["id"] = 1220,
                ["name"] = "AC_TAUREN_KILLED",
                ["type"] = 7,
            },
        },
        ["description"] = "AD_HORDE_RACES_KILLER",
        ["faction"] = false,
        ["icon"] = "-Ability_Gouge",
        ["id"] = 196,
        ["name"] = "AN_RACES_KILLER",
        ["points"] = 10,
    },
    [197] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 10,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = "WARRIOR",
                },
                ["id"] = 1221,
                ["name"] = "AC_WARRIOR_KILLED",
                ["type"] = 8,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = "HUNTER",
                },
                ["id"] = 1222,
                ["name"] = "AC_HUNTER_KILLED",
                ["type"] = 8,
            },
            [3] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = "ROGUE",
                },
                ["id"] = 1223,
                ["name"] = "AC_ROGUE_KILLED",
                ["type"] = 8,
            },
            [4] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = "PRIEST",
                },
                ["id"] = 1224,
                ["name"] = "AC_PRIEST_KILLED",
                ["type"] = 8,
            },
            [5] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = "MAGE",
                },
                ["id"] = 1225,
                ["name"] = "AC_MAGE_KILLED",
                ["type"] = 8,
            },
            [6] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = "WARLOCK",
                },
                ["id"] = 1226,
                ["name"] = "AC_WARLOCK_KILLED",
                ["type"] = 8,
            },
            [7] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = "DRUID",
                },
                ["id"] = 1227,
                ["name"] = "AC_DRUID_KILLED",
                ["type"] = 8,
            },
            [8] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = "PALADIN",
                },
                ["id"] = 1228,
                ["name"] = "AC_PALADIN_KILLED",
                ["type"] = 8,
            },
            [9] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = "SHAMAN",
                },
                ["id"] = 1229,
                ["name"] = "AC_SHAMAN_KILLED",
                ["type"] = 8,
            },
        },
        ["description"] = "AD_CLASSES_KILLER",
        ["icon"] = "-Ability_Cheapshot",
        ["id"] = 197,
        ["name"] = "AN_CLASSES_KILLER",
        ["points"] = 10,
    },
    [198] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 14,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1459,
                },
                ["id"] = 1230,
                ["name"] = "",
                ["quantity"] = 1,
                ["type"] = 26,
            },
        },
        ["description"] = "AD_ALTERAC_WIN",
        ["icon"] = "achievement_bg_winav",
        ["id"] = 198,
        ["name"] = "AN_ALTERAC_WIN",
        ["nextID"] = 199,
        ["points"] = 10,
    },
    [199] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 14,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1459,
                },
                ["id"] = 1231,
                ["name"] = {
                    ["args"] = {
                        [1] = 5,
                    },
                    ["key"] = "AD_ALTERAC_WINS",
                },
                ["quantity"] = 5,
                ["type"] = 26,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 5,
            },
            ["key"] = "AD_ALTERAC_WINS",
        },
        ["icon"] = "achievement_bg_winav",
        ["id"] = 199,
        ["name"] = "AN_ALTERAC_WINS",
        ["nextID"] = 200,
        ["points"] = 10,
        ["previousID"] = 198,
    },
    [200] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 14,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1459,
                },
                ["id"] = 1232,
                ["name"] = {
                    ["args"] = {
                        [1] = 10,
                    },
                    ["key"] = "AD_ALTERAC_WINS",
                },
                ["quantity"] = 10,
                ["type"] = 26,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 10,
            },
            ["key"] = "AD_ALTERAC_WINS",
        },
        ["icon"] = "achievement_bg_winav",
        ["id"] = 200,
        ["name"] = "AN_ALTERAC_WINS",
        ["nextID"] = 201,
        ["points"] = 10,
        ["previousID"] = 199,
    },
    [201] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 14,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1459,
                },
                ["id"] = 1233,
                ["name"] = {
                    ["args"] = {
                        [1] = 25,
                    },
                    ["key"] = "AD_ALTERAC_WINS",
                },
                ["quantity"] = 25,
                ["type"] = 26,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 25,
            },
            ["key"] = "AD_ALTERAC_WINS",
        },
        ["icon"] = "achievement_bg_winav",
        ["id"] = 201,
        ["name"] = "AN_ALTERAC_WINS",
        ["nextID"] = 202,
        ["points"] = 10,
        ["previousID"] = 200,
    },
    [202] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 14,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1459,
                },
                ["id"] = 1234,
                ["name"] = {
                    ["args"] = {
                        [1] = 50,
                    },
                    ["key"] = "AD_ALTERAC_WINS",
                },
                ["quantity"] = 50,
                ["type"] = 26,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 50,
            },
            ["key"] = "AD_ALTERAC_WINS",
        },
        ["icon"] = "achievement_bg_winav",
        ["id"] = 202,
        ["name"] = "AN_ALTERAC_WINS",
        ["points"] = 10,
        ["previousID"] = 201,
    },
    [203] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 11,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1460,
                },
                ["id"] = 1235,
                ["name"] = "",
                ["quantity"] = 1,
                ["type"] = 26,
            },
        },
        ["description"] = "AD_WARSONG_WIN",
        ["icon"] = "achievement_bg_winwsg",
        ["id"] = 203,
        ["name"] = "AN_WARSONG_WIN",
        ["nextID"] = 204,
        ["points"] = 10,
    },
    [204] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 11,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1460,
                },
                ["id"] = 1236,
                ["name"] = {
                    ["args"] = {
                        [1] = 5,
                    },
                    ["key"] = "AD_WARSONG_WINS",
                },
                ["quantity"] = 5,
                ["type"] = 26,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 5,
            },
            ["key"] = "AD_WARSONG_WINS",
        },
        ["icon"] = "achievement_bg_winwsg",
        ["id"] = 204,
        ["name"] = "AN_WARSONG_WINS",
        ["nextID"] = 205,
        ["points"] = 10,
        ["previousID"] = 203,
    },
    [205] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 11,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1460,
                },
                ["id"] = 1237,
                ["name"] = {
                    ["args"] = {
                        [1] = 10,
                    },
                    ["key"] = "AD_WARSONG_WINS",
                },
                ["quantity"] = 10,
                ["type"] = 26,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 10,
            },
            ["key"] = "AD_WARSONG_WINS",
        },
        ["icon"] = "achievement_bg_winwsg",
        ["id"] = 205,
        ["name"] = "AN_WARSONG_WINS",
        ["nextID"] = 206,
        ["points"] = 10,
        ["previousID"] = 204,
    },
    [206] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 11,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1460,
                },
                ["id"] = 1238,
                ["name"] = {
                    ["args"] = {
                        [1] = 25,
                    },
                    ["key"] = "AD_WARSONG_WINS",
                },
                ["quantity"] = 25,
                ["type"] = 26,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 25,
            },
            ["key"] = "AD_WARSONG_WINS",
        },
        ["icon"] = "achievement_bg_winwsg",
        ["id"] = 206,
        ["name"] = "AN_WARSONG_WINS",
        ["nextID"] = 207,
        ["points"] = 10,
        ["previousID"] = 205,
    },
    [207] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 11,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1460,
                },
                ["id"] = 1239,
                ["name"] = {
                    ["args"] = {
                        [1] = 50,
                    },
                    ["key"] = "AD_WARSONG_WINS",
                },
                ["quantity"] = 50,
                ["type"] = 26,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 50,
            },
            ["key"] = "AD_WARSONG_WINS",
        },
        ["icon"] = "achievement_bg_winwsg",
        ["id"] = 207,
        ["name"] = "AN_WARSONG_WINS",
        ["points"] = 10,
        ["previousID"] = 206,
    },
    [208] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 12,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1461,
                },
                ["id"] = 1240,
                ["name"] = "",
                ["quantity"] = 1,
                ["type"] = 26,
            },
        },
        ["description"] = "AD_ARATHI_WIN",
        ["icon"] = "achievement_bg_winab",
        ["id"] = 208,
        ["name"] = "AN_ARATHI_WIN",
        ["nextID"] = 209,
        ["points"] = 10,
    },
    [209] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 12,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1461,
                },
                ["id"] = 1241,
                ["name"] = {
                    ["args"] = {
                        [1] = 5,
                    },
                    ["key"] = "AD_ARATHI_WINS",
                },
                ["quantity"] = 5,
                ["type"] = 26,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 5,
            },
            ["key"] = "AD_ARATHI_WINS",
        },
        ["icon"] = "achievement_bg_winab",
        ["id"] = 209,
        ["name"] = "AN_ARATHI_WINS",
        ["nextID"] = 210,
        ["points"] = 10,
        ["previousID"] = 208,
    },
    [210] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 12,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1461,
                },
                ["id"] = 1242,
                ["name"] = {
                    ["args"] = {
                        [1] = 10,
                    },
                    ["key"] = "AD_ARATHI_WINS",
                },
                ["quantity"] = 10,
                ["type"] = 26,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 10,
            },
            ["key"] = "AD_ARATHI_WINS",
        },
        ["icon"] = "achievement_bg_winab",
        ["id"] = 210,
        ["name"] = "AN_ARATHI_WINS",
        ["nextID"] = 211,
        ["points"] = 10,
        ["previousID"] = 209,
    },
    [211] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 12,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1461,
                },
                ["id"] = 1243,
                ["name"] = {
                    ["args"] = {
                        [1] = 25,
                    },
                    ["key"] = "AD_ARATHI_WINS",
                },
                ["quantity"] = 25,
                ["type"] = 26,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 25,
            },
            ["key"] = "AD_ARATHI_WINS",
        },
        ["icon"] = "achievement_bg_winab",
        ["id"] = 211,
        ["name"] = "AN_ARATHI_WINS",
        ["nextID"] = 212,
        ["points"] = 10,
        ["previousID"] = 210,
    },
    [212] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 12,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1461,
                },
                ["id"] = 1244,
                ["name"] = {
                    ["args"] = {
                        [1] = 50,
                    },
                    ["key"] = "AD_ARATHI_WINS",
                },
                ["quantity"] = 50,
                ["type"] = 26,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 50,
            },
            ["key"] = "AD_ARATHI_WINS",
        },
        ["icon"] = "achievement_bg_winab",
        ["id"] = 212,
        ["name"] = "AN_ARATHI_WINS",
        ["points"] = 10,
        ["previousID"] = 211,
    },
    [218] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 14,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1459,
                    [2] = 1,
                },
                ["id"] = 1250,
                ["name"] = {
                    ["args"] = {
                        [1] = 5,
                    },
                    ["key"] = "AD_ALTERAC_KILLING_BLOWS",
                },
                ["quantity"] = 5,
                ["type"] = 24,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 5,
            },
            ["key"] = "AD_ALTERAC_KILLING_BLOWS",
        },
        ["icon"] = "-Spell_Shadow_Summonimp",
        ["id"] = 218,
        ["name"] = "AN_ALTERAC_KILLING_BLOWS",
        ["nextID"] = 219,
        ["points"] = 10,
    },
    [219] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 14,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1459,
                    [2] = 1,
                },
                ["id"] = 1251,
                ["name"] = {
                    ["args"] = {
                        [1] = 10,
                    },
                    ["key"] = "AD_ALTERAC_KILLING_BLOWS",
                },
                ["quantity"] = 10,
                ["type"] = 24,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 10,
            },
            ["key"] = "AD_ALTERAC_KILLING_BLOWS",
        },
        ["icon"] = "-Spell_Shadow_Summonimp",
        ["id"] = 219,
        ["name"] = "AN_ALTERAC_KILLING_BLOWS",
        ["nextID"] = 220,
        ["points"] = 10,
        ["previousID"] = 218,
    },
    [220] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 14,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1459,
                    [2] = 1,
                },
                ["id"] = 1252,
                ["name"] = {
                    ["args"] = {
                        [1] = 25,
                    },
                    ["key"] = "AD_ALTERAC_KILLING_BLOWS",
                },
                ["quantity"] = 25,
                ["type"] = 24,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 25,
            },
            ["key"] = "AD_ALTERAC_KILLING_BLOWS",
        },
        ["icon"] = "-Spell_Shadow_Summonimp",
        ["id"] = 220,
        ["name"] = "AN_ALTERAC_KILLING_BLOWS",
        ["nextID"] = 221,
        ["points"] = 10,
        ["previousID"] = 219,
    },
    [221] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 14,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1459,
                    [2] = 1,
                },
                ["id"] = 1253,
                ["name"] = {
                    ["args"] = {
                        [1] = 40,
                    },
                    ["key"] = "AD_ALTERAC_KILLING_BLOWS",
                },
                ["quantity"] = 40,
                ["type"] = 24,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 40,
            },
            ["key"] = "AD_ALTERAC_KILLING_BLOWS",
        },
        ["icon"] = "-Spell_Shadow_Summonimp",
        ["id"] = 221,
        ["name"] = "AN_ALTERAC_KILLING_BLOWS",
        ["points"] = 10,
        ["previousID"] = 220,
    },
    [222] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 14,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1459,
                    [2] = 1,
                },
                ["id"] = 1254,
                ["name"] = "",
                ["quantity"] = 1,
                ["type"] = 23,
            },
        },
        ["description"] = "AD_ALTERAC_GRAVEYARD_ASSAULT",
        ["icon"] = "-Spell_Holy_Divinespirit",
        ["id"] = 222,
        ["name"] = "AN_ALTERAC_GRAVEYARD_ASSAULT",
        ["nextID"] = 223,
        ["points"] = 10,
    },
    [223] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 14,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1459,
                    [2] = 1,
                },
                ["id"] = 1255,
                ["name"] = {
                    ["args"] = {
                        [1] = 2,
                    },
                    ["key"] = "AD_ALTERAC_GRAVEYARD_ASSAULTS",
                },
                ["quantity"] = 2,
                ["type"] = 23,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 2,
            },
            ["key"] = "AD_ALTERAC_GRAVEYARD_ASSAULTS",
        },
        ["icon"] = "-Spell_Holy_Divinespirit",
        ["id"] = 223,
        ["name"] = "AN_ALTERAC_GRAVEYARD_ASSAULTS",
        ["nextID"] = 224,
        ["points"] = 10,
        ["previousID"] = 222,
    },
    [224] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 14,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1459,
                    [2] = 1,
                },
                ["id"] = 1256,
                ["name"] = {
                    ["args"] = {
                        [1] = 3,
                    },
                    ["key"] = "AD_ALTERAC_GRAVEYARD_ASSAULTS",
                },
                ["quantity"] = 3,
                ["type"] = 23,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 3,
            },
            ["key"] = "AD_ALTERAC_GRAVEYARD_ASSAULTS",
        },
        ["icon"] = "-Spell_Holy_Divinespirit",
        ["id"] = 224,
        ["name"] = "AN_ALTERAC_GRAVEYARD_ASSAULTS",
        ["nextID"] = 225,
        ["points"] = 10,
        ["previousID"] = 223,
    },
    [225] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 14,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1459,
                    [2] = 1,
                },
                ["id"] = 1257,
                ["name"] = {
                    ["args"] = {
                        [1] = 4,
                    },
                    ["key"] = "AD_ALTERAC_GRAVEYARD_ASSAULTS",
                },
                ["quantity"] = 4,
                ["type"] = 23,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 4,
            },
            ["key"] = "AD_ALTERAC_GRAVEYARD_ASSAULTS",
        },
        ["icon"] = "-Spell_Holy_Divinespirit",
        ["id"] = 225,
        ["name"] = "AN_ALTERAC_GRAVEYARD_ASSAULTS",
        ["points"] = 10,
        ["previousID"] = 224,
    },
    [226] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 14,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1459,
                    [2] = 2,
                },
                ["id"] = 1258,
                ["name"] = "",
                ["quantity"] = 1,
                ["type"] = 23,
            },
        },
        ["description"] = "AD_ALTERAC_GRAVEYARD_DEFEND",
        ["icon"] = "-Spell_Holy_Prayerofspirit",
        ["id"] = 226,
        ["name"] = "AN_ALTERAC_GRAVEYARD_DEFEND",
        ["nextID"] = 227,
        ["points"] = 10,
    },
    [227] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 14,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1459,
                    [2] = 2,
                },
                ["id"] = 1259,
                ["name"] = {
                    ["args"] = {
                        [1] = 2,
                    },
                    ["key"] = "AD_ALTERAC_GRAVEYARD_DEFENDS",
                },
                ["quantity"] = 2,
                ["type"] = 23,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 2,
            },
            ["key"] = "AD_ALTERAC_GRAVEYARD_DEFENDS",
        },
        ["icon"] = "-Spell_Holy_Prayerofspirit",
        ["id"] = 227,
        ["name"] = "AN_ALTERAC_GRAVEYARD_DEFENDS",
        ["nextID"] = 228,
        ["points"] = 10,
        ["previousID"] = 226,
    },
    [228] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 14,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1459,
                    [2] = 2,
                },
                ["id"] = 1260,
                ["name"] = {
                    ["args"] = {
                        [1] = 3,
                    },
                    ["key"] = "AD_ALTERAC_GRAVEYARD_DEFENDS",
                },
                ["quantity"] = 3,
                ["type"] = 23,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 3,
            },
            ["key"] = "AD_ALTERAC_GRAVEYARD_DEFENDS",
        },
        ["icon"] = "-Spell_Holy_Prayerofspirit",
        ["id"] = 228,
        ["name"] = "AN_ALTERAC_GRAVEYARD_DEFENDS",
        ["nextID"] = 229,
        ["points"] = 10,
        ["previousID"] = 227,
    },
    [229] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 14,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1459,
                    [2] = 2,
                },
                ["id"] = 1261,
                ["name"] = {
                    ["args"] = {
                        [1] = 4,
                    },
                    ["key"] = "AD_ALTERAC_GRAVEYARD_DEFENDS",
                },
                ["quantity"] = 4,
                ["type"] = 23,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 4,
            },
            ["key"] = "AD_ALTERAC_GRAVEYARD_DEFENDS",
        },
        ["icon"] = "-Spell_Holy_Prayerofspirit",
        ["id"] = 229,
        ["name"] = "AN_ALTERAC_GRAVEYARD_DEFENDS",
        ["points"] = 10,
        ["previousID"] = 228,
    },
    [230] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 14,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1459,
                    [2] = 3,
                },
                ["id"] = 1262,
                ["name"] = "",
                ["quantity"] = 1,
                ["type"] = 23,
            },
        },
        ["description"] = "AD_ALTERAC_TOWER_ASSAULT",
        ["icon"] = "-Ability_Thunderbolt",
        ["id"] = 230,
        ["name"] = "AN_ALTERAC_TOWER_ASSAULT",
        ["nextID"] = 231,
        ["points"] = 10,
    },
    [231] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 14,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1459,
                    [2] = 3,
                },
                ["id"] = 1263,
                ["name"] = {
                    ["args"] = {
                        [1] = 2,
                    },
                    ["key"] = "AD_ALTERAC_TOWER_ASSAULTS",
                },
                ["quantity"] = 2,
                ["type"] = 23,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 2,
            },
            ["key"] = "AD_ALTERAC_TOWER_ASSAULTS",
        },
        ["icon"] = "-Ability_Thunderbolt",
        ["id"] = 231,
        ["name"] = "AN_ALTERAC_TOWER_ASSAULTS",
        ["nextID"] = 232,
        ["points"] = 10,
        ["previousID"] = 230,
    },
    [232] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 14,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1459,
                    [2] = 3,
                },
                ["id"] = 1264,
                ["name"] = {
                    ["args"] = {
                        [1] = 3,
                    },
                    ["key"] = "AD_ALTERAC_TOWER_ASSAULTS",
                },
                ["quantity"] = 3,
                ["type"] = 23,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 3,
            },
            ["key"] = "AD_ALTERAC_TOWER_ASSAULTS",
        },
        ["icon"] = "-Ability_Thunderbolt",
        ["id"] = 232,
        ["name"] = "AN_ALTERAC_TOWER_ASSAULTS",
        ["nextID"] = 233,
        ["points"] = 10,
        ["previousID"] = 231,
    },
    [233] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 14,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1459,
                    [2] = 3,
                },
                ["id"] = 1265,
                ["name"] = {
                    ["args"] = {
                        [1] = 4,
                    },
                    ["key"] = "AD_ALTERAC_TOWER_ASSAULTS",
                },
                ["quantity"] = 4,
                ["type"] = 23,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 4,
            },
            ["key"] = "AD_ALTERAC_TOWER_ASSAULTS",
        },
        ["icon"] = "-Ability_Thunderbolt",
        ["id"] = 233,
        ["name"] = "AN_ALTERAC_TOWER_ASSAULTS",
        ["points"] = 10,
        ["previousID"] = 232,
    },
    [234] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 14,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1459,
                    [2] = 4,
                },
                ["id"] = 1266,
                ["name"] = "",
                ["quantity"] = 1,
                ["type"] = 23,
            },
        },
        ["description"] = "AD_ALTERAC_TOWER_DEFEND",
        ["icon"] = "-Inv_Shield_05",
        ["id"] = 234,
        ["name"] = "AN_ALTERAC_TOWER_DEFEND",
        ["nextID"] = 235,
        ["points"] = 10,
    },
    [235] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 14,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1459,
                    [2] = 4,
                },
                ["id"] = 1267,
                ["name"] = {
                    ["args"] = {
                        [1] = 2,
                    },
                    ["key"] = "AD_ALTERAC_TOWER_DEFENDS",
                },
                ["quantity"] = 2,
                ["type"] = 23,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 2,
            },
            ["key"] = "AD_ALTERAC_TOWER_DEFENDS",
        },
        ["icon"] = "-Inv_Shield_05",
        ["id"] = 235,
        ["name"] = "AN_ALTERAC_TOWER_DEFENDS",
        ["nextID"] = 236,
        ["points"] = 10,
        ["previousID"] = 234,
    },
    [236] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 14,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1459,
                    [2] = 4,
                },
                ["id"] = 1268,
                ["name"] = {
                    ["args"] = {
                        [1] = 3,
                    },
                    ["key"] = "AD_ALTERAC_TOWER_DEFENDS",
                },
                ["quantity"] = 3,
                ["type"] = 23,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 3,
            },
            ["key"] = "AD_ALTERAC_TOWER_DEFENDS",
        },
        ["icon"] = "-Inv_Shield_05",
        ["id"] = 236,
        ["name"] = "AN_ALTERAC_TOWER_DEFENDS",
        ["nextID"] = 237,
        ["points"] = 10,
        ["previousID"] = 235,
    },
    [237] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 14,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1459,
                    [2] = 4,
                },
                ["id"] = 1269,
                ["name"] = {
                    ["args"] = {
                        [1] = 4,
                    },
                    ["key"] = "AD_ALTERAC_TOWER_DEFENDS",
                },
                ["quantity"] = 4,
                ["type"] = 23,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 4,
            },
            ["key"] = "AD_ALTERAC_TOWER_DEFENDS",
        },
        ["icon"] = "-Inv_Shield_05",
        ["id"] = 237,
        ["name"] = "AN_ALTERAC_TOWER_DEFENDS",
        ["points"] = 10,
        ["previousID"] = 236,
    },
    [242] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 14,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1459,
                },
                ["id"] = 1274,
                ["name"] = "",
                ["type"] = 34,
            },
        },
        ["description"] = "AD_ALTERAC_FAST_WIN",
        ["icon"] = "achievement_bg_winav_underxminutes",
        ["id"] = 242,
        ["name"] = "AN_ALTERAC_FAST_WIN",
        ["points"] = 10,
    },
    [243] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 11,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1460,
                    [2] = 2,
                },
                ["id"] = 1275,
                ["name"] = {
                    ["args"] = {
                        [1] = 10,
                    },
                    ["key"] = "AD_WARSONG_KILLS",
                },
                ["quantity"] = 10,
                ["type"] = 24,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 10,
            },
            ["key"] = "AD_WARSONG_KILLS",
        },
        ["icon"] = "-Ability_Rogue_Eviscerate",
        ["id"] = 243,
        ["name"] = "AN_WARSONG_KILLS",
        ["nextID"] = 244,
        ["points"] = 10,
    },
    [244] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 11,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1460,
                    [2] = 2,
                },
                ["id"] = 1276,
                ["name"] = {
                    ["args"] = {
                        [1] = 25,
                    },
                    ["key"] = "AD_WARSONG_KILLS",
                },
                ["quantity"] = 25,
                ["type"] = 24,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 25,
            },
            ["key"] = "AD_WARSONG_KILLS",
        },
        ["icon"] = "-Ability_Rogue_Eviscerate",
        ["id"] = 244,
        ["name"] = "AN_WARSONG_KILLS",
        ["nextID"] = 245,
        ["points"] = 10,
        ["previousID"] = 243,
    },
    [245] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 11,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1460,
                    [2] = 2,
                },
                ["id"] = 1277,
                ["name"] = {
                    ["args"] = {
                        [1] = 50,
                    },
                    ["key"] = "AD_WARSONG_KILLS",
                },
                ["quantity"] = 50,
                ["type"] = 24,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 50,
            },
            ["key"] = "AD_WARSONG_KILLS",
        },
        ["icon"] = "-Ability_Rogue_Eviscerate",
        ["id"] = 245,
        ["name"] = "AN_WARSONG_KILLS",
        ["nextID"] = 246,
        ["points"] = 10,
        ["previousID"] = 244,
    },
    [246] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 11,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1460,
                    [2] = 2,
                },
                ["id"] = 1278,
                ["name"] = {
                    ["args"] = {
                        [1] = 75,
                    },
                    ["key"] = "AD_WARSONG_KILLS",
                },
                ["quantity"] = 75,
                ["type"] = 24,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 75,
            },
            ["key"] = "AD_WARSONG_KILLS",
        },
        ["icon"] = "-Ability_Rogue_Eviscerate",
        ["id"] = 246,
        ["name"] = "AN_WARSONG_KILLS",
        ["points"] = 10,
        ["previousID"] = 245,
    },
    [247] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 11,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1460,
                    [2] = 1,
                },
                ["id"] = 1279,
                ["name"] = "",
                ["quantity"] = 1,
                ["type"] = 23,
            },
        },
        ["description"] = "AD_WARSONG_FLAG_CAPTURE",
        ["icon"] = "-Inv_Banner_03",
        ["id"] = 247,
        ["name"] = "AN_WARSONG_FLAG_CAPTURE",
        ["nextID"] = 248,
        ["points"] = 10,
    },
    [248] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 11,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1460,
                    [2] = 1,
                },
                ["id"] = 1280,
                ["name"] = {
                    ["args"] = {
                        [1] = 2,
                    },
                    ["key"] = "AD_WARSONG_FLAG_CAPTURES",
                },
                ["quantity"] = 2,
                ["type"] = 23,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 2,
            },
            ["key"] = "AD_WARSONG_FLAG_CAPTURES",
        },
        ["icon"] = "-Inv_Banner_03",
        ["id"] = 248,
        ["name"] = "AN_WARSONG_FLAG_CAPTURES",
        ["nextID"] = 249,
        ["points"] = 10,
        ["previousID"] = 247,
    },
    [249] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 11,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1460,
                    [2] = 1,
                },
                ["id"] = 1281,
                ["name"] = {
                    ["args"] = {
                        [1] = 3,
                    },
                    ["key"] = "AD_WARSONG_FLAG_CAPTURES",
                },
                ["quantity"] = 3,
                ["type"] = 23,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 3,
            },
            ["key"] = "AD_WARSONG_FLAG_CAPTURES",
        },
        ["icon"] = "-Inv_Banner_03",
        ["id"] = 249,
        ["name"] = "AN_WARSONG_FLAG_CAPTURES",
        ["points"] = 10,
        ["previousID"] = 248,
    },
    [250] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 11,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1460,
                    [2] = 2,
                },
                ["id"] = 1282,
                ["name"] = "",
                ["quantity"] = 1,
                ["type"] = 23,
            },
        },
        ["description"] = "AD_WARSONG_FLAG_RETURN",
        ["icon"] = "-Spell_Nature_Reincarnation",
        ["id"] = 250,
        ["name"] = "AN_WARSONG_FLAG_RETURN",
        ["nextID"] = 251,
        ["points"] = 10,
    },
    [251] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 11,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1460,
                    [2] = 2,
                },
                ["id"] = 1283,
                ["name"] = {
                    ["args"] = {
                        [1] = 2,
                    },
                    ["key"] = "AD_WARSONG_FLAG_RETURNS",
                },
                ["quantity"] = 2,
                ["type"] = 23,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 2,
            },
            ["key"] = "AD_WARSONG_FLAG_RETURNS",
        },
        ["icon"] = "-Spell_Nature_Reincarnation",
        ["id"] = 251,
        ["name"] = "AN_WARSONG_FLAG_RETURNS",
        ["nextID"] = 252,
        ["points"] = 10,
        ["previousID"] = 250,
    },
    [252] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 11,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1460,
                    [2] = 2,
                },
                ["id"] = 1284,
                ["name"] = {
                    ["args"] = {
                        [1] = 3,
                    },
                    ["key"] = "AD_WARSONG_FLAG_RETURNS",
                },
                ["quantity"] = 3,
                ["type"] = 23,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 3,
            },
            ["key"] = "AD_WARSONG_FLAG_RETURNS",
        },
        ["icon"] = "-Spell_Nature_Reincarnation",
        ["id"] = 252,
        ["name"] = "AN_WARSONG_FLAG_RETURNS",
        ["points"] = 10,
        ["previousID"] = 251,
    },
    [253] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 11,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1460,
                },
                ["id"] = 1285,
                ["name"] = "",
                ["type"] = 34,
            },
        },
        ["description"] = "AD_WARSONG_FAST_WIN",
        ["icon"] = "achievement_bg_winwsg_underxminutes",
        ["id"] = 253,
        ["name"] = "AN_WARSONG_FAST_WIN",
        ["points"] = 10,
    },
    [254] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 12,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1461,
                    [2] = 1,
                },
                ["id"] = 1286,
                ["name"] = "",
                ["quantity"] = 1,
                ["type"] = 23,
            },
        },
        ["description"] = "AD_ARATHI_BASE_ASSAULT",
        ["icon"] = "-Ability_Eyeoftheowl",
        ["id"] = 254,
        ["name"] = "AN_ARATHI_BASE_ASSAULT",
        ["nextID"] = 255,
        ["points"] = 10,
    },
    [255] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 12,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1461,
                    [2] = 1,
                },
                ["id"] = 1287,
                ["name"] = {
                    ["args"] = {
                        [1] = 2,
                    },
                    ["key"] = "AD_ARATHI_BASE_ASSAULTS",
                },
                ["quantity"] = 2,
                ["type"] = 23,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 2,
            },
            ["key"] = "AD_ARATHI_BASE_ASSAULTS",
        },
        ["icon"] = "-Ability_Eyeoftheowl",
        ["id"] = 255,
        ["name"] = "AN_ARATHI_BASE_ASSAULTS",
        ["nextID"] = 256,
        ["points"] = 10,
        ["previousID"] = 254,
    },
    [256] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 12,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1461,
                    [2] = 1,
                },
                ["id"] = 1288,
                ["name"] = {
                    ["args"] = {
                        [1] = 3,
                    },
                    ["key"] = "AD_ARATHI_BASE_ASSAULTS",
                },
                ["quantity"] = 3,
                ["type"] = 23,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 3,
            },
            ["key"] = "AD_ARATHI_BASE_ASSAULTS",
        },
        ["icon"] = "-Ability_Eyeoftheowl",
        ["id"] = 256,
        ["name"] = "AN_ARATHI_BASE_ASSAULTS",
        ["nextID"] = 257,
        ["points"] = 10,
        ["previousID"] = 255,
    },
    [257] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 12,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1461,
                    [2] = 1,
                },
                ["id"] = 1289,
                ["name"] = {
                    ["args"] = {
                        [1] = 4,
                    },
                    ["key"] = "AD_ARATHI_BASE_ASSAULTS",
                },
                ["quantity"] = 4,
                ["type"] = 23,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 4,
            },
            ["key"] = "AD_ARATHI_BASE_ASSAULTS",
        },
        ["icon"] = "-Ability_Eyeoftheowl",
        ["id"] = 257,
        ["name"] = "AN_ARATHI_BASE_ASSAULTS",
        ["points"] = 10,
        ["previousID"] = 256,
    },
    [258] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 12,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1461,
                    [2] = 2,
                },
                ["id"] = 1290,
                ["name"] = "",
                ["quantity"] = 1,
                ["type"] = 23,
            },
        },
        ["description"] = "AD_ARATHI_BASE_DEFEND",
        ["icon"] = "-Inv_Shield_06",
        ["id"] = 258,
        ["name"] = "AN_ARATHI_BASE_DEFEND",
        ["nextID"] = 259,
        ["points"] = 10,
    },
    [259] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 12,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1461,
                    [2] = 2,
                },
                ["id"] = 1291,
                ["name"] = {
                    ["args"] = {
                        [1] = 2,
                    },
                    ["key"] = "AD_ARATHI_BASE_DEFENDS",
                },
                ["quantity"] = 2,
                ["type"] = 23,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 2,
            },
            ["key"] = "AD_ARATHI_BASE_DEFENDS",
        },
        ["icon"] = "-Inv_Shield_06",
        ["id"] = 259,
        ["name"] = "AN_ARATHI_BASE_DEFENDS",
        ["nextID"] = 260,
        ["points"] = 10,
        ["previousID"] = 258,
    },
    [260] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 12,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1461,
                    [2] = 2,
                },
                ["id"] = 1292,
                ["name"] = {
                    ["args"] = {
                        [1] = 3,
                    },
                    ["key"] = "AD_ARATHI_BASE_DEFENDS",
                },
                ["quantity"] = 3,
                ["type"] = 23,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 3,
            },
            ["key"] = "AD_ARATHI_BASE_DEFENDS",
        },
        ["icon"] = "-Inv_Shield_06",
        ["id"] = 260,
        ["name"] = "AN_ARATHI_BASE_DEFENDS",
        ["nextID"] = 261,
        ["points"] = 10,
        ["previousID"] = 259,
    },
    [261] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 12,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1461,
                    [2] = 2,
                },
                ["id"] = 1293,
                ["name"] = {
                    ["args"] = {
                        [1] = 4,
                    },
                    ["key"] = "AD_ARATHI_BASE_DEFENDS",
                },
                ["quantity"] = 4,
                ["type"] = 23,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 4,
            },
            ["key"] = "AD_ARATHI_BASE_DEFENDS",
        },
        ["icon"] = "-Inv_Shield_06",
        ["id"] = 261,
        ["name"] = "AN_ARATHI_BASE_DEFENDS",
        ["points"] = 10,
        ["previousID"] = 260,
    },
    [262] = {
        ["selectors"] = {
            ["A:DRUID"] = 2,
            ["A:HUNTER"] = 2,
            ["A:MAGE"] = 2,
            ["A:PALADIN"] = 2,
            ["A:PRIEST"] = 2,
            ["A:ROGUE"] = 2,
            ["A:SHAMAN"] = 2,
            ["A:WARLOCK"] = 2,
            ["A:WARRIOR"] = 2,
            ["H:DRUID"] = 1,
            ["H:HUNTER"] = 1,
            ["H:MAGE"] = 1,
            ["H:PALADIN"] = 1,
            ["H:PRIEST"] = 1,
            ["H:ROGUE"] = 1,
            ["H:SHAMAN"] = 1,
            ["H:WARLOCK"] = 1,
            ["H:WARRIOR"] = 1,
        },
        ["variants"] = {
            [1] = {
                ["anyCompletable"] = false,
                ["categoryID"] = 12,
                ["criteria"] = {
                    [1] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = "PAT",
                            [2] = 15071,
                        },
                        ["id"] = 1294,
                        ["name"] = "NPC_15071",
                        ["type"] = 33,
                    },
                    [2] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = "PAT",
                            [2] = 15072,
                        },
                        ["id"] = 1295,
                        ["name"] = "NPC_15072",
                        ["type"] = 33,
                    },
                },
                ["description"] = "AD_ARATHI_CATS",
                ["icon"] = "-ability_hunter_catlikereflexes",
                ["id"] = 262,
                ["name"] = "AN_ARATHI_CATS",
                ["points"] = 10,
            },
            [2] = {
                ["anyCompletable"] = false,
                ["categoryID"] = 12,
                ["criteria"] = {
                    [1] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = "PAT",
                            [2] = 15065,
                        },
                        ["id"] = 1294,
                        ["name"] = "NPC_15065",
                        ["type"] = 33,
                    },
                    [2] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = "PAT",
                            [2] = 15066,
                        },
                        ["id"] = 1295,
                        ["name"] = "NPC_15066",
                        ["type"] = 33,
                    },
                },
                ["description"] = "AD_ARATHI_CATS",
                ["icon"] = "-ability_hunter_catlikereflexes",
                ["id"] = 262,
                ["name"] = "AN_ARATHI_CATS",
                ["points"] = 10,
            },
        },
    },
    [263] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 12,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1461,
                },
                ["id"] = 1296,
                ["name"] = "",
                ["type"] = 34,
            },
        },
        ["description"] = "AD_ARATHI_FAST_WIN",
        ["icon"] = "achievement_bg_winab_underxminutes",
        ["id"] = 263,
        ["name"] = "AN_ARATHI_FAST_WIN",
        ["points"] = 10,
    },
    [264] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 14,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1459,
                    [2] = 4,
                },
                ["id"] = 1297,
                ["name"] = {
                    ["args"] = {
                        [1] = 50,
                    },
                    ["key"] = "AD_ALTERAC_TOWER_DEFEND_TOTAL",
                },
                ["quantity"] = 50,
                ["type"] = 35,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 50,
            },
            ["key"] = "AD_ALTERAC_TOWER_DEFEND_TOTAL",
        },
        ["icon"] = "achievement_bg_defendxtowers_av",
        ["id"] = 264,
        ["name"] = "AN_ALTERAC_TOWER_DEFEND_TOTAL",
        ["points"] = 10,
    },
    [265] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 14,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1459,
                    [2] = 1,
                },
                ["id"] = 1298,
                ["name"] = {
                    ["args"] = {
                        [1] = 50,
                    },
                    ["key"] = "AD_ALTERAC_GRAVEYARD_ASSAULT_TOTAL",
                },
                ["quantity"] = 50,
                ["type"] = 35,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 50,
            },
            ["key"] = "AD_ALTERAC_GRAVEYARD_ASSAULT_TOTAL",
        },
        ["icon"] = "achievement_bg_xkills_avgraveyard",
        ["id"] = 265,
        ["name"] = "AN_ALTERAC_GRAVEYARD_ASSAULT_TOTAL",
        ["points"] = 10,
    },
    [266] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 11,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1460,
                    [2] = 1,
                },
                ["id"] = 1299,
                ["name"] = {
                    ["args"] = {
                        [1] = 50,
                    },
                    ["key"] = "AD_WARSONG_FLAG_CAPTURE_TOTAL",
                },
                ["quantity"] = 50,
                ["type"] = 35,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 50,
            },
            ["key"] = "AD_WARSONG_FLAG_CAPTURE_TOTAL",
        },
        ["icon"] = "achievement_bg_captureflag_wsg",
        ["id"] = 266,
        ["name"] = "AN_WARSONG_FLAG_CAPTURE_TOTAL",
        ["points"] = 10,
    },
    [267] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 11,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1460,
                    [2] = 2,
                },
                ["id"] = 1300,
                ["name"] = {
                    ["args"] = {
                        [1] = 50,
                    },
                    ["key"] = "AD_WARSONG_FLAG_RETURN_TOTAL",
                },
                ["quantity"] = 50,
                ["type"] = 35,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 50,
            },
            ["key"] = "AD_WARSONG_FLAG_RETURN_TOTAL",
        },
        ["icon"] = "achievement_bg_interruptx_flagcapture_attempts",
        ["id"] = 267,
        ["name"] = "AN_WARSONG_FLAG_RETURN_TOTAL",
        ["points"] = 10,
    },
    [268] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 12,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1461,
                    [2] = 1,
                },
                ["id"] = 1301,
                ["name"] = {
                    ["args"] = {
                        [1] = 50,
                    },
                    ["key"] = "AD_ARATHI_BASE_ASSAULT_TOTAL",
                },
                ["quantity"] = 50,
                ["type"] = 35,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 50,
            },
            ["key"] = "AD_ARATHI_BASE_ASSAULT_TOTAL",
        },
        ["icon"] = "achievement_bg_takexflags_ab",
        ["id"] = 268,
        ["name"] = "AN_ARATHI_BASE_ASSAULT_TOTAL",
        ["points"] = 10,
    },
    [269] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 12,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1461,
                    [2] = 2,
                },
                ["id"] = 1302,
                ["name"] = {
                    ["args"] = {
                        [1] = 50,
                    },
                    ["key"] = "AD_ARATHI_BASE_DEFEND_TOTAL",
                },
                ["quantity"] = 50,
                ["type"] = 35,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 50,
            },
            ["key"] = "AD_ARATHI_BASE_DEFEND_TOTAL",
        },
        ["icon"] = "ability_warrior_victoryrush",
        ["id"] = 269,
        ["name"] = "AN_ARATHI_BASE_DEFEND_TOTAL",
        ["points"] = 10,
    },
    [270] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 14,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 19029,
                },
                ["id"] = 1303,
                ["name"] = "",
                ["type"] = 5,
            },
        },
        ["description"] = "AD_ALTERAC_MOUNT_HORDE",
        ["faction"] = true,
        ["icon"] = "-inv_jewelry_frostwolftrinket_01",
        ["id"] = 270,
        ["name"] = "AN_ALTERAC_MOUNT_HORDE",
        ["points"] = 10,
    },
    [271] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 14,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 19030,
                },
                ["id"] = 1304,
                ["name"] = "",
                ["type"] = 5,
            },
        },
        ["description"] = "AD_ALTERAC_MOUNT_ALLIANCE",
        ["faction"] = false,
        ["icon"] = "-inv_jewelry_stormpiketrinket_01",
        ["id"] = 271,
        ["name"] = "AN_ALTERAC_MOUNT_ALLIANCE",
        ["points"] = 10,
    },
    [279] = {
        ["selectors"] = {
            ["A:DRUID"] = 2,
            ["A:HUNTER"] = 2,
            ["A:MAGE"] = 2,
            ["A:PALADIN"] = 2,
            ["A:PRIEST"] = 2,
            ["A:ROGUE"] = 2,
            ["A:SHAMAN"] = 2,
            ["A:WARLOCK"] = 2,
            ["A:WARRIOR"] = 2,
            ["H:DRUID"] = 1,
            ["H:HUNTER"] = 1,
            ["H:MAGE"] = 1,
            ["H:PALADIN"] = 1,
            ["H:PRIEST"] = 1,
            ["H:ROGUE"] = 1,
            ["H:SHAMAN"] = 1,
            ["H:WARLOCK"] = 1,
            ["H:WARRIOR"] = 1,
        },
        ["variants"] = {
            [1] = {
                ["anyCompletable"] = false,
                ["categoryID"] = 14,
                ["criteria"] = {
                    [1] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 202,
                        },
                        ["id"] = 1313,
                        ["name"] = "AN_ALTERAC_WINS",
                        ["type"] = 20,
                    },
                    [2] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 221,
                        },
                        ["id"] = 1314,
                        ["name"] = "AN_ALTERAC_KILLING_BLOWS",
                        ["type"] = 20,
                    },
                    [3] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 225,
                        },
                        ["id"] = 1315,
                        ["name"] = "AN_ALTERAC_GRAVEYARD_ASSAULTS",
                        ["type"] = 20,
                    },
                    [4] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 229,
                        },
                        ["id"] = 1316,
                        ["name"] = "AN_ALTERAC_GRAVEYARD_DEFENDS",
                        ["type"] = 20,
                    },
                    [5] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 233,
                        },
                        ["id"] = 1317,
                        ["name"] = "AN_ALTERAC_TOWER_ASSAULTS",
                        ["type"] = 20,
                    },
                    [6] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 237,
                        },
                        ["id"] = 1318,
                        ["name"] = "AN_ALTERAC_TOWER_DEFENDS",
                        ["type"] = 20,
                    },
                    [7] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 577,
                        },
                        ["id"] = 1319,
                        ["name"] = "AN_ALTERAC_AUTOGRAPH",
                        ["type"] = 20,
                    },
                    [8] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 242,
                        },
                        ["id"] = 1320,
                        ["name"] = "AN_ALTERAC_FAST_WIN",
                        ["type"] = 20,
                    },
                    [9] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 264,
                        },
                        ["id"] = 1321,
                        ["name"] = "AN_ALTERAC_TOWER_DEFEND_TOTAL",
                        ["type"] = 20,
                    },
                    [10] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 265,
                        },
                        ["id"] = 1322,
                        ["name"] = "AN_ALTERAC_GRAVEYARD_ASSAULT_TOTAL",
                        ["type"] = 20,
                    },
                    [11] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 270,
                        },
                        ["id"] = 1323,
                        ["name"] = "AN_ALTERAC_MOUNT_HORDE",
                        ["type"] = 20,
                    },
                },
                ["description"] = "AD_ALTERAC_BOSS",
                ["icon"] = "-inv_jewelry_necklace_21",
                ["id"] = 279,
                ["name"] = "AN_ALTERAC_BOSS",
                ["points"] = 10,
            },
            [2] = {
                ["anyCompletable"] = false,
                ["categoryID"] = 14,
                ["criteria"] = {
                    [1] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 202,
                        },
                        ["id"] = 1313,
                        ["name"] = "AN_ALTERAC_WINS",
                        ["type"] = 20,
                    },
                    [2] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 221,
                        },
                        ["id"] = 1314,
                        ["name"] = "AN_ALTERAC_KILLING_BLOWS",
                        ["type"] = 20,
                    },
                    [3] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 225,
                        },
                        ["id"] = 1315,
                        ["name"] = "AN_ALTERAC_GRAVEYARD_ASSAULTS",
                        ["type"] = 20,
                    },
                    [4] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 229,
                        },
                        ["id"] = 1316,
                        ["name"] = "AN_ALTERAC_GRAVEYARD_DEFENDS",
                        ["type"] = 20,
                    },
                    [5] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 233,
                        },
                        ["id"] = 1317,
                        ["name"] = "AN_ALTERAC_TOWER_ASSAULTS",
                        ["type"] = 20,
                    },
                    [6] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 237,
                        },
                        ["id"] = 1318,
                        ["name"] = "AN_ALTERAC_TOWER_DEFENDS",
                        ["type"] = 20,
                    },
                    [7] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 577,
                        },
                        ["id"] = 1319,
                        ["name"] = "AN_ALTERAC_AUTOGRAPH",
                        ["type"] = 20,
                    },
                    [8] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 242,
                        },
                        ["id"] = 1320,
                        ["name"] = "AN_ALTERAC_FAST_WIN",
                        ["type"] = 20,
                    },
                    [9] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 264,
                        },
                        ["id"] = 1321,
                        ["name"] = "AN_ALTERAC_TOWER_DEFEND_TOTAL",
                        ["type"] = 20,
                    },
                    [10] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 265,
                        },
                        ["id"] = 1322,
                        ["name"] = "AN_ALTERAC_GRAVEYARD_ASSAULT_TOTAL",
                        ["type"] = 20,
                    },
                    [11] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 271,
                        },
                        ["id"] = 1323,
                        ["name"] = "AN_ALTERAC_MOUNT_ALLIANCE",
                        ["type"] = 20,
                    },
                },
                ["description"] = "AD_ALTERAC_BOSS",
                ["icon"] = "-inv_jewelry_necklace_21",
                ["id"] = 279,
                ["name"] = "AN_ALTERAC_BOSS",
                ["points"] = 10,
            },
        },
    },
    [280] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 11,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 207,
                },
                ["id"] = 1324,
                ["name"] = "AN_WARSONG_WINS",
                ["type"] = 20,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 246,
                },
                ["id"] = 1325,
                ["name"] = "AN_WARSONG_KILLS",
                ["type"] = 20,
            },
            [3] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 249,
                },
                ["id"] = 1326,
                ["name"] = "AN_WARSONG_FLAG_CAPTURES",
                ["type"] = 20,
            },
            [4] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 252,
                },
                ["id"] = 1327,
                ["name"] = "AN_WARSONG_FLAG_RETURNS",
                ["type"] = 20,
            },
            [5] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 253,
                },
                ["id"] = 1328,
                ["name"] = "AN_WARSONG_FAST_WIN",
                ["type"] = 20,
            },
            [6] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 266,
                },
                ["id"] = 1329,
                ["name"] = "AN_WARSONG_FLAG_CAPTURE_TOTAL",
                ["type"] = 20,
            },
            [7] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 267,
                },
                ["id"] = 1330,
                ["name"] = "AN_WARSONG_FLAG_RETURN_TOTAL",
                ["type"] = 20,
            },
        },
        ["description"] = "AD_WARSONG_BOSS",
        ["icon"] = "-inv_misc_rune_07",
        ["id"] = 280,
        ["name"] = "AN_WARSONG_BOSS",
        ["points"] = 10,
    },
    [281] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 12,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 212,
                },
                ["id"] = 1331,
                ["name"] = "AN_ARATHI_WINS",
                ["type"] = 20,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 257,
                },
                ["id"] = 1332,
                ["name"] = "AN_ARATHI_BASE_ASSAULTS",
                ["type"] = 20,
            },
            [3] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 261,
                },
                ["id"] = 1333,
                ["name"] = "AN_ARATHI_BASE_DEFENDS",
                ["type"] = 20,
            },
            [4] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 262,
                },
                ["id"] = 1334,
                ["name"] = "AN_ARATHI_CATS",
                ["type"] = 20,
            },
            [5] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 263,
                },
                ["id"] = 1335,
                ["name"] = "AN_ARATHI_FAST_WIN",
                ["type"] = 20,
            },
            [6] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 268,
                },
                ["id"] = 1336,
                ["name"] = "AN_ARATHI_BASE_ASSAULT_TOTAL",
                ["type"] = 20,
            },
            [7] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 269,
                },
                ["id"] = 1337,
                ["name"] = "AN_ARATHI_BASE_DEFEND_TOTAL",
                ["type"] = 20,
            },
        },
        ["description"] = "AD_ARATHI_BOSS",
        ["icon"] = "-inv_jewelry_amulet_07",
        ["id"] = 281,
        ["name"] = "AN_ARATHI_BOSS",
        ["points"] = 10,
    },
    [283] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 10,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 279,
                },
                ["id"] = 1344,
                ["name"] = "AN_ALTERAC_BOSS",
                ["type"] = 20,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 280,
                },
                ["id"] = 1345,
                ["name"] = "AN_WARSONG_BOSS",
                ["type"] = 20,
            },
            [3] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 281,
                },
                ["id"] = 1346,
                ["name"] = "AN_ARATHI_BOSS",
                ["type"] = 20,
            },
        },
        ["description"] = "AD_BATTLEMASTER",
        ["icon"] = "achievement_pvp_a_15",
        ["id"] = 283,
        ["name"] = "AN_BATTLEMASTER",
        ["points"] = 40,
        ["rewardText"] = "TITLE_BUILTIN_BATTLEMASTER_LABEL",
    },
    [284] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 10,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {},
                ["id"] = 1347,
                ["name"] = {
                    ["args"] = {
                        [1] = 10,
                    },
                    ["key"] = "AC_PARTICIPATE_IN_BGS",
                },
                ["quantity"] = 10,
                ["type"] = 32,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 10,
            },
            ["key"] = "AD_PARTICIPATE_IN_BGS",
        },
        ["icon"] = "-Inv_Musket_02",
        ["id"] = 284,
        ["name"] = "AN_PARTICIPATE_IN_BGS",
        ["nextID"] = 285,
        ["points"] = 10,
    },
    [285] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 10,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {},
                ["id"] = 1348,
                ["name"] = {
                    ["args"] = {
                        [1] = 25,
                    },
                    ["key"] = "AC_PARTICIPATE_IN_BGS",
                },
                ["quantity"] = 25,
                ["type"] = 32,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 25,
            },
            ["key"] = "AD_PARTICIPATE_IN_BGS",
        },
        ["icon"] = "-Inv_Musket_02",
        ["id"] = 285,
        ["name"] = "AN_PARTICIPATE_IN_BGS",
        ["nextID"] = 286,
        ["points"] = 10,
        ["previousID"] = 284,
    },
    [286] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 10,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {},
                ["id"] = 1349,
                ["name"] = {
                    ["args"] = {
                        [1] = 50,
                    },
                    ["key"] = "AC_PARTICIPATE_IN_BGS",
                },
                ["quantity"] = 50,
                ["type"] = 32,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 50,
            },
            ["key"] = "AD_PARTICIPATE_IN_BGS",
        },
        ["icon"] = "-Inv_Musket_02",
        ["id"] = 286,
        ["name"] = "AN_PARTICIPATE_IN_BGS",
        ["points"] = 10,
        ["previousID"] = 285,
    },
    [287] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 10,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1,
                },
                ["id"] = 1350,
                ["name"] = {
                    ["args"] = {
                        [1] = 100,
                    },
                    ["key"] = "AD_BGS_KILLING_BLOWS",
                },
                ["quantity"] = 100,
                ["type"] = 25,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 100,
            },
            ["key"] = "AD_BGS_KILLING_BLOWS",
        },
        ["icon"] = "-Spell_Shadow_Unholyfrenzy",
        ["id"] = 287,
        ["name"] = "AN_BGS_KILLING_BLOWS",
        ["nextID"] = 288,
        ["points"] = 10,
    },
    [288] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 10,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1,
                },
                ["id"] = 1351,
                ["name"] = {
                    ["args"] = {
                        [1] = 250,
                    },
                    ["key"] = "AD_BGS_KILLING_BLOWS",
                },
                ["quantity"] = 250,
                ["type"] = 25,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 250,
            },
            ["key"] = "AD_BGS_KILLING_BLOWS",
        },
        ["icon"] = "-Spell_Shadow_Unholyfrenzy",
        ["id"] = 288,
        ["name"] = "AN_BGS_KILLING_BLOWS",
        ["nextID"] = 289,
        ["points"] = 10,
        ["previousID"] = 287,
    },
    [289] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 10,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1,
                },
                ["id"] = 1352,
                ["name"] = {
                    ["args"] = {
                        [1] = 500,
                    },
                    ["key"] = "AD_BGS_KILLING_BLOWS",
                },
                ["quantity"] = 500,
                ["type"] = 25,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 500,
            },
            ["key"] = "AD_BGS_KILLING_BLOWS",
        },
        ["icon"] = "-Spell_Shadow_Unholyfrenzy",
        ["id"] = 289,
        ["name"] = "AN_BGS_KILLING_BLOWS",
        ["nextID"] = 290,
        ["points"] = 10,
        ["previousID"] = 288,
    },
    [290] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 10,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1,
                },
                ["id"] = 1353,
                ["name"] = {
                    ["args"] = {
                        [1] = 750,
                    },
                    ["key"] = "AD_BGS_KILLING_BLOWS",
                },
                ["quantity"] = 750,
                ["type"] = 25,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 750,
            },
            ["key"] = "AD_BGS_KILLING_BLOWS",
        },
        ["icon"] = "-Spell_Shadow_Unholyfrenzy",
        ["id"] = 290,
        ["name"] = "AN_BGS_KILLING_BLOWS",
        ["nextID"] = 291,
        ["points"] = 10,
        ["previousID"] = 289,
    },
    [291] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 10,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1,
                },
                ["id"] = 1354,
                ["name"] = {
                    ["args"] = {
                        [1] = 1000,
                    },
                    ["key"] = "AD_BGS_KILLING_BLOWS",
                },
                ["quantity"] = 1000,
                ["type"] = 25,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 1000,
            },
            ["key"] = "AD_BGS_KILLING_BLOWS",
        },
        ["icon"] = "-Spell_Shadow_Unholyfrenzy",
        ["id"] = 291,
        ["name"] = "AN_BGS_KILLING_BLOWS",
        ["points"] = 10,
        ["previousID"] = 290,
    },
    [292] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 10,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 2,
                },
                ["id"] = 1355,
                ["name"] = {
                    ["args"] = {
                        [1] = 100,
                    },
                    ["key"] = "AD_BGS_KILLS",
                },
                ["quantity"] = 100,
                ["type"] = 25,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 100,
            },
            ["key"] = "AD_BGS_KILLS",
        },
        ["icon"] = "-Ability_Warrior_Innerrage",
        ["id"] = 292,
        ["name"] = "AN_BGS_KILLS",
        ["nextID"] = 293,
        ["points"] = 10,
    },
    [293] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 10,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 2,
                },
                ["id"] = 1356,
                ["name"] = {
                    ["args"] = {
                        [1] = 250,
                    },
                    ["key"] = "AD_BGS_KILLS",
                },
                ["quantity"] = 250,
                ["type"] = 25,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 250,
            },
            ["key"] = "AD_BGS_KILLS",
        },
        ["icon"] = "-Ability_Warrior_Innerrage",
        ["id"] = 293,
        ["name"] = "AN_BGS_KILLS",
        ["nextID"] = 294,
        ["points"] = 10,
        ["previousID"] = 292,
    },
    [294] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 10,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 2,
                },
                ["id"] = 1357,
                ["name"] = {
                    ["args"] = {
                        [1] = 500,
                    },
                    ["key"] = "AD_BGS_KILLS",
                },
                ["quantity"] = 500,
                ["type"] = 25,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 500,
            },
            ["key"] = "AD_BGS_KILLS",
        },
        ["icon"] = "-Ability_Warrior_Innerrage",
        ["id"] = 294,
        ["name"] = "AN_BGS_KILLS",
        ["nextID"] = 295,
        ["points"] = 10,
        ["previousID"] = 293,
    },
    [295] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 10,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 2,
                },
                ["id"] = 1358,
                ["name"] = {
                    ["args"] = {
                        [1] = 750,
                    },
                    ["key"] = "AD_BGS_KILLS",
                },
                ["quantity"] = 750,
                ["type"] = 25,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 750,
            },
            ["key"] = "AD_BGS_KILLS",
        },
        ["icon"] = "-Ability_Warrior_Innerrage",
        ["id"] = 295,
        ["name"] = "AN_BGS_KILLS",
        ["nextID"] = 296,
        ["points"] = 10,
        ["previousID"] = 294,
    },
    [296] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 10,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 2,
                },
                ["id"] = 1359,
                ["name"] = {
                    ["args"] = {
                        [1] = 1000,
                    },
                    ["key"] = "AD_BGS_KILLS",
                },
                ["quantity"] = 1000,
                ["type"] = 25,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 1000,
            },
            ["key"] = "AD_BGS_KILLS",
        },
        ["icon"] = "-Ability_Warrior_Innerrage",
        ["id"] = 296,
        ["name"] = "AN_BGS_KILLS",
        ["points"] = 10,
        ["previousID"] = 295,
    },
    [297] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 10,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 7810,
                },
                ["id"] = 1360,
                ["name"] = "",
                ["type"] = 3,
            },
        },
        ["description"] = "AD_GURUBASHI_1",
        ["icon"] = "-Inv_Misc_ArmorKit_14",
        ["id"] = 297,
        ["name"] = "AN_GURUBASHI_1",
        ["points"] = 10,
    },
    [298] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 10,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 19024,
                },
                ["id"] = 1361,
                ["name"] = "",
                ["type"] = 5,
            },
        },
        ["description"] = "AD_GURUBASHI_2",
        ["icon"] = "-Inv_Misc_ArmorKit_04",
        ["id"] = 298,
        ["name"] = "AN_GURUBASHI_2",
        ["points"] = 10,
    },
    [299] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 10,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {},
                ["id"] = 1362,
                ["name"] = "",
                ["type"] = 31,
            },
        },
        ["description"] = "AD_DUEL",
        ["icon"] = "-ability_dualwieldspecialization",
        ["id"] = 299,
        ["name"] = "AN_DUEL",
        ["nextID"] = 300,
        ["points"] = 10,
    },
    [300] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 10,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {},
                ["id"] = 1363,
                ["name"] = {
                    ["args"] = {
                        [1] = 10,
                    },
                    ["key"] = "AC_DUELS",
                },
                ["quantity"] = 10,
                ["type"] = 31,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 10,
            },
            ["key"] = "AD_DUELS",
        },
        ["icon"] = "-ability_dualwieldspecialization",
        ["id"] = 300,
        ["name"] = "AN_DUELS_10",
        ["nextID"] = 301,
        ["points"] = 10,
        ["previousID"] = 299,
    },
    [301] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 10,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {},
                ["id"] = 1364,
                ["name"] = {
                    ["args"] = {
                        [1] = 25,
                    },
                    ["key"] = "AC_DUELS",
                },
                ["quantity"] = 25,
                ["type"] = 31,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 25,
            },
            ["key"] = "AD_DUELS",
        },
        ["icon"] = "-ability_dualwieldspecialization",
        ["id"] = 301,
        ["name"] = "AN_DUELS_25",
        ["nextID"] = 302,
        ["points"] = 10,
        ["previousID"] = 300,
    },
    [302] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 10,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {},
                ["id"] = 1365,
                ["name"] = {
                    ["args"] = {
                        [1] = 100,
                    },
                    ["key"] = "AC_DUELS",
                },
                ["quantity"] = 100,
                ["type"] = 31,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 100,
            },
            ["key"] = "AD_DUELS",
        },
        ["icon"] = "-ability_dualwieldspecialization",
        ["id"] = 302,
        ["name"] = "AN_DUELS_100",
        ["points"] = 10,
        ["previousID"] = 301,
    },
    [303] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 17,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 11520,
                },
                ["id"] = 1377,
                ["name"] = "",
                ["type"] = 1,
            },
        },
        ["description"] = "AD_RAGEFIRE_CHASM",
        ["icon"] = "-spell_shadow_summonfelguard",
        ["id"] = 303,
        ["name"] = "AN_RAGEFIRE_CHASM",
        ["points"] = 10,
    },
    [304] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 17,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 3654,
                },
                ["id"] = 1378,
                ["name"] = "",
                ["type"] = 1,
            },
        },
        ["description"] = "AD_WAILING_CAVERNS",
        ["icon"] = "achievement_boss_mutanus_the_devourer",
        ["id"] = 304,
        ["name"] = "AN_WAILING_CAVERNS",
        ["points"] = 10,
    },
    [305] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 17,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 639,
                },
                ["id"] = 1379,
                ["name"] = "",
                ["type"] = 1,
            },
        },
        ["description"] = "AD_DEAD_MINES",
        ["icon"] = "achievement_boss_edwinvancleef",
        ["id"] = 305,
        ["name"] = "AN_DEAD_MINES",
        ["points"] = 10,
    },
    [306] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 17,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 4275,
                },
                ["id"] = 1380,
                ["name"] = "",
                ["type"] = 1,
            },
        },
        ["description"] = "AD_SHADOWFANG_KEEP",
        ["icon"] = "achievement_boss_archmagearugal",
        ["id"] = 306,
        ["name"] = "AN_SHADOWFANG_KEEP",
        ["points"] = 10,
    },
    [307] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 17,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 4829,
                },
                ["id"] = 1381,
                ["name"] = "",
                ["type"] = 1,
            },
        },
        ["description"] = "AD_BLACKFATHOM_DEEPS",
        ["icon"] = "achievement_boss_bazil_akumai",
        ["id"] = 307,
        ["name"] = "AN_BLACKFATHOM_DEEPS",
        ["points"] = 10,
    },
    [308] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 17,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1716,
                },
                ["id"] = 1382,
                ["name"] = "",
                ["type"] = 1,
            },
        },
        ["description"] = "AD_JAIL",
        ["icon"] = "achievement_boss_bazil_thredd",
        ["id"] = 308,
        ["name"] = "AN_JAIL",
        ["points"] = 10,
    },
    [309] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 17,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 7800,
                },
                ["id"] = 1383,
                ["name"] = "",
                ["type"] = 1,
            },
        },
        ["description"] = "AD_GNOMREGAN",
        ["icon"] = "gnomeregan",
        ["id"] = 309,
        ["name"] = "AN_GNOMREGAN",
        ["points"] = 10,
    },
    [310] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 17,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 4421,
                },
                ["id"] = 1384,
                ["name"] = "",
                ["type"] = 1,
            },
        },
        ["description"] = "AD_RAZORFEN_KRAUL",
        ["icon"] = "achievement_boss_charlgarazorflank",
        ["id"] = 310,
        ["name"] = "AN_RAZORFEN_KRAUL",
        ["points"] = 10,
    },
    [311] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 17,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 4543,
                },
                ["id"] = 1385,
                ["name"] = "AC_SCARLET_MONASTERY1",
                ["type"] = 1,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 6487,
                },
                ["id"] = 1386,
                ["name"] = "AC_SCARLET_MONASTERY2",
                ["type"] = 1,
            },
            [3] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 3975,
                },
                ["id"] = 1387,
                ["name"] = "AC_SCARLET_MONASTERY3",
                ["type"] = 1,
            },
            [4] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 3976,
                },
                ["id"] = 1388,
                ["name"] = "AC_SCARLET_MONASTERY4",
                ["type"] = 1,
            },
            [5] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 3977,
                },
                ["id"] = 1389,
                ["name"] = "AC_SCARLET_MONASTERY5",
                ["type"] = 1,
            },
        },
        ["description"] = "AD_SCARLET_MONASTERY",
        ["icon"] = "-inv_helmet_52",
        ["id"] = 311,
        ["name"] = "AN_SCARLET_MONASTERY",
        ["points"] = 10,
    },
    [312] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 17,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 7358,
                },
                ["id"] = 1390,
                ["name"] = "",
                ["type"] = 1,
            },
        },
        ["description"] = "AD_RAZORFEN_DOWNS",
        ["icon"] = "achievement_boss_amnennar_the_coldbringer",
        ["id"] = 312,
        ["name"] = "AN_RAZORFEN_DOWNS",
        ["points"] = 10,
    },
    [313] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 17,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 2748,
                },
                ["id"] = 1391,
                ["name"] = "",
                ["type"] = 1,
            },
        },
        ["description"] = "AD_ULDAMAN",
        ["icon"] = "achievement_boss_archaedas",
        ["id"] = 313,
        ["name"] = "AN_ULDAMAN",
        ["points"] = 10,
    },
    [314] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 17,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 7267,
                },
                ["id"] = 1392,
                ["name"] = "",
                ["type"] = 1,
            },
        },
        ["description"] = "AD_ZULFARRAK",
        ["icon"] = "achievement_boss_chiefukorzsandscalp",
        ["id"] = 314,
        ["name"] = "AN_ZULFARRAK",
        ["points"] = 10,
    },
    [315] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 17,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 12201,
                },
                ["id"] = 1393,
                ["name"] = "",
                ["type"] = 1,
            },
        },
        ["description"] = "AD_MARAUDON",
        ["icon"] = "achievement_boss_princesstheradras",
        ["id"] = 315,
        ["name"] = "AN_MARAUDON",
        ["points"] = 10,
    },
    [316] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 17,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 5709,
                },
                ["id"] = 1394,
                ["name"] = "",
                ["type"] = 1,
            },
        },
        ["description"] = "AD_SUNKEN_TEMPLE",
        ["icon"] = "achievement_boss_shadeoferanikus",
        ["id"] = 316,
        ["name"] = "AN_SUNKEN_TEMPLE",
        ["points"] = 10,
    },
    [317] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 17,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 9019,
                },
                ["id"] = 1395,
                ["name"] = "",
                ["type"] = 1,
            },
        },
        ["description"] = "AD_NEW_EMPEROR",
        ["icon"] = "achievement_boss_emperordagranthaurissan",
        ["id"] = 317,
        ["name"] = "AN_NEW_EMPEROR",
        ["points"] = 10,
    },
    [318] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 17,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 9018,
                },
                ["id"] = 1396,
                ["name"] = "AC_BLACKROCK_DEPTHS1",
                ["type"] = 1,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 9319,
                },
                ["id"] = 1397,
                ["name"] = "AC_BLACKROCK_DEPTHS2",
                ["type"] = 1,
            },
            [3] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 9033,
                },
                ["id"] = 1398,
                ["name"] = "AC_BLACKROCK_DEPTHS3",
                ["type"] = 1,
            },
            [4] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 8983,
                },
                ["id"] = 1399,
                ["name"] = "AC_BLACKROCK_DEPTHS4",
                ["type"] = 1,
            },
            [5] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 9017,
                },
                ["id"] = 1400,
                ["name"] = "AC_BLACKROCK_DEPTHS5",
                ["type"] = 1,
            },
            [6] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 9041,
                },
                ["id"] = 1401,
                ["name"] = "AC_BLACKROCK_DEPTHS6",
                ["type"] = 1,
            },
            [7] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 9016,
                },
                ["id"] = 1402,
                ["name"] = "AC_BLACKROCK_DEPTHS7",
                ["type"] = 1,
            },
        },
        ["description"] = "AD_BLACKROCK_DEPTHS",
        ["icon"] = "-Spell_Fire_Lavaspawn",
        ["id"] = 318,
        ["name"] = "AN_BLACKROCK_DEPTHS",
        ["points"] = 10,
    },
    [319] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 17,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 9543,
                },
                ["id"] = 1403,
                ["name"] = "AC_BLACKROCK_PARTY1",
                ["type"] = 1,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 9499,
                },
                ["id"] = 1404,
                ["name"] = "AC_BLACKROCK_PARTY2",
                ["type"] = 1,
            },
            [3] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 9537,
                },
                ["id"] = 1405,
                ["name"] = "AC_BLACKROCK_PARTY3",
                ["type"] = 1,
            },
            [4] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 9502,
                },
                ["id"] = 1406,
                ["name"] = "AC_BLACKROCK_PARTY4",
                ["type"] = 1,
            },
        },
        ["description"] = "AD_BLACKROCK_PARTY",
        ["icon"] = "-inv_drink_05",
        ["id"] = 319,
        ["name"] = "AN_BLACKROCK_PARTY",
        ["points"] = 10,
    },
    [320] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 17,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 11786,
                },
                ["id"] = 1407,
                ["name"] = "",
                ["type"] = 5,
            },
        },
        ["description"] = "AD_ARMOR_SWORD",
        ["icon"] = "-Inv_Sword_47",
        ["id"] = 320,
        ["name"] = "AN_ARMOR_SWORD",
        ["points"] = 10,
    },
    [321] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 17,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 318,
                },
                ["id"] = 1408,
                ["name"] = "AN_BLACKROCK_DEPTHS",
                ["type"] = 20,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 319,
                },
                ["id"] = 1409,
                ["name"] = "AN_BLACKROCK_PARTY",
                ["type"] = 20,
            },
            [3] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 317,
                },
                ["id"] = 1410,
                ["name"] = "AN_NEW_EMPEROR",
                ["type"] = 20,
            },
            [4] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 320,
                },
                ["id"] = 1411,
                ["name"] = "AN_ARMOR_SWORD",
                ["type"] = 20,
            },
        },
        ["description"] = "AD_BLACKROCK_DEPTHS_FULL",
        ["icon"] = "-Inv_Misc_AhnQirajTrinket_03",
        ["id"] = 321,
        ["name"] = "AN_BLACKROCK_DEPTHS_FULL",
        ["points"] = 10,
    },
    [322] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 17,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 9568,
                },
                ["id"] = 1412,
                ["name"] = "",
                ["type"] = 1,
            },
        },
        ["description"] = "AD_BLACKROCK_SPIRE_BOTTOM",
        ["icon"] = "achievement_boss_overlord_wyrmthalak",
        ["id"] = 322,
        ["name"] = "AN_BLACKROCK_SPIRE_BOTTOM",
        ["points"] = 10,
    },
    [323] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 17,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 10363,
                },
                ["id"] = 1413,
                ["name"] = "",
                ["type"] = 1,
            },
        },
        ["description"] = "AD_BLACKROCK_SPIRE_UPPER",
        ["icon"] = "achievement_boss_generaldrakkisath",
        ["id"] = 323,
        ["name"] = "AN_BLACKROCK_SPIRE_UPPER",
        ["points"] = 10,
    },
    [324] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 17,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 322,
                },
                ["id"] = 1414,
                ["name"] = "AN_BLACKROCK_SPIRE_BOTTOM",
                ["type"] = 20,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 323,
                },
                ["id"] = 1415,
                ["name"] = "AN_BLACKROCK_SPIRE_UPPER",
                ["type"] = 20,
            },
        },
        ["description"] = "AD_BLACKROCK_SPIRE",
        ["icon"] = "-Inv_Sword_48",
        ["id"] = 324,
        ["name"] = "AN_BLACKROCK_SPIRE",
        ["points"] = 10,
    },
    [325] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 17,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 11492,
                },
                ["id"] = 1416,
                ["name"] = "AC_DIRE_MAUL1",
                ["type"] = 1,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 11496,
                },
                ["id"] = 1417,
                ["name"] = "AC_DIRE_MAUL2",
                ["type"] = 1,
            },
            [3] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 11501,
                },
                ["id"] = 1418,
                ["name"] = "AC_DIRE_MAUL3",
                ["type"] = 1,
            },
        },
        ["description"] = "AD_DIRE_MAUL",
        ["icon"] = "-Ability_Warrior_DecisiveStrike",
        ["id"] = 325,
        ["name"] = "AN_DIRE_MAUL",
        ["points"] = 10,
    },
    [326] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 17,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 10813,
                },
                ["id"] = 1419,
                ["name"] = "AC_STRATHOLME1",
                ["type"] = 1,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 10440,
                },
                ["id"] = 1420,
                ["name"] = "AC_STRATHOLME2",
                ["type"] = 1,
            },
        },
        ["description"] = "AD_STRATHOLME",
        ["icon"] = "spell_deathknight_armyofthedead",
        ["id"] = 326,
        ["name"] = "AN_STRATHOLME",
        ["points"] = 10,
    },
    [327] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 17,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1853,
                },
                ["id"] = 1421,
                ["name"] = "AC_SCHOLOMANCE1",
                ["type"] = 1,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 10508,
                },
                ["id"] = 1422,
                ["name"] = "AC_SCHOLOMANCE2",
                ["type"] = 1,
            },
        },
        ["description"] = "AD_SCHOLOMANCE",
        ["icon"] = "-Spell_Holy_Senseundead",
        ["id"] = 327,
        ["name"] = "AN_SCHOLOMANCE",
        ["points"] = 10,
    },
    [328] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 16,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 303,
                },
                ["id"] = 1423,
                ["name"] = "AN_RAGEFIRE_CHASM",
                ["type"] = 20,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 304,
                },
                ["id"] = 1424,
                ["name"] = "AN_WAILING_CAVERNS",
                ["type"] = 20,
            },
            [3] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 305,
                },
                ["id"] = 1425,
                ["name"] = "AN_DEAD_MINES",
                ["type"] = 20,
            },
            [4] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 306,
                },
                ["id"] = 1426,
                ["name"] = "AN_SHADOWFANG_KEEP",
                ["type"] = 20,
            },
            [5] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 307,
                },
                ["id"] = 1427,
                ["name"] = "AN_BLACKFATHOM_DEEPS",
                ["type"] = 20,
            },
            [6] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 308,
                },
                ["id"] = 1428,
                ["name"] = "AN_JAIL",
                ["type"] = 20,
            },
            [7] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 309,
                },
                ["id"] = 1429,
                ["name"] = "AN_GNOMREGAN",
                ["type"] = 20,
            },
            [8] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 310,
                },
                ["id"] = 1430,
                ["name"] = "AN_RAZORFEN_KRAUL",
                ["type"] = 20,
            },
            [9] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 311,
                },
                ["id"] = 1431,
                ["name"] = "AN_SCARLET_MONASTERY",
                ["type"] = 20,
            },
            [10] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 312,
                },
                ["id"] = 1432,
                ["name"] = "AN_RAZORFEN_DOWNS",
                ["type"] = 20,
            },
            [11] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 313,
                },
                ["id"] = 1433,
                ["name"] = "AN_ULDAMAN",
                ["type"] = 20,
            },
            [12] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 314,
                },
                ["id"] = 1434,
                ["name"] = "AN_ZULFARRAK",
                ["type"] = 20,
            },
            [13] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 315,
                },
                ["id"] = 1435,
                ["name"] = "AN_MARAUDON",
                ["type"] = 20,
            },
            [14] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 316,
                },
                ["id"] = 1436,
                ["name"] = "AN_SUNKEN_TEMPLE",
                ["type"] = 20,
            },
        },
        ["description"] = "AD_YOUNG_DEFENDER",
        ["icon"] = "-spell_holy_revivechampion",
        ["id"] = 328,
        ["name"] = "AN_YOUNG_DEFENDER",
        ["points"] = 10,
    },
    [329] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 16,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 328,
                },
                ["id"] = 1437,
                ["name"] = "AN_YOUNG_DEFENDER",
                ["type"] = 20,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 321,
                },
                ["id"] = 1438,
                ["name"] = "AN_BLACKROCK_DEPTHS_FULL",
                ["type"] = 20,
            },
            [3] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 324,
                },
                ["id"] = 1439,
                ["name"] = "AN_BLACKROCK_SPIRE",
                ["type"] = 20,
            },
            [4] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 325,
                },
                ["id"] = 1440,
                ["name"] = "AN_DIRE_MAUL",
                ["type"] = 20,
            },
            [5] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 326,
                },
                ["id"] = 1441,
                ["name"] = "AN_STRATHOLME",
                ["type"] = 20,
            },
            [6] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 327,
                },
                ["id"] = 1442,
                ["name"] = "AN_SCHOLOMANCE",
                ["type"] = 20,
            },
        },
        ["description"] = "AD_DEFENDER",
        ["icon"] = "achievement_dungeon_classicraider",
        ["id"] = 329,
        ["name"] = "AN_DEFENDER",
        ["points"] = 10,
        ["rewardText"] = "TITLE_BUILTIN_DEFENDER_OF_AZEROTH_LABEL",
    },
    [330] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 17,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 10184,
                },
                ["id"] = 1443,
                ["name"] = "",
                ["type"] = 1,
            },
        },
        ["description"] = "AD_ONYXIA",
        ["icon"] = "achievement_boss_onyxia",
        ["id"] = 330,
        ["name"] = "AN_ONYXIA",
        ["points"] = 10,
    },
    [331] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 17,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 15339,
                },
                ["id"] = 1444,
                ["name"] = "",
                ["type"] = 1,
            },
        },
        ["description"] = "AD_AQ20",
        ["icon"] = "achievement_boss_ossiriantheunscarred",
        ["id"] = 331,
        ["name"] = "AN_AQ20",
        ["points"] = 10,
    },
    [332] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 17,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 14834,
                },
                ["id"] = 1445,
                ["name"] = "",
                ["type"] = 1,
            },
        },
        ["description"] = "AD_ZULGURUB",
        ["icon"] = "achievement_boss_hakkar",
        ["id"] = 332,
        ["name"] = "AN_ZULGURUB",
        ["points"] = 10,
    },
    [333] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 17,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 11502,
                },
                ["id"] = 1446,
                ["name"] = "",
                ["type"] = 1,
            },
        },
        ["description"] = "AD_RAGNAROS",
        ["icon"] = "achievement_boss_ragnaros",
        ["id"] = 333,
        ["name"] = "AN_RAGNAROS",
        ["points"] = 10,
    },
    [334] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 17,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 11583,
                },
                ["id"] = 1447,
                ["name"] = "",
                ["type"] = 1,
            },
        },
        ["description"] = "AD_BLACK_WING_LAIR",
        ["icon"] = "achievement_boss_nefarion",
        ["id"] = 334,
        ["name"] = "AN_BLACK_WING_LAIR",
        ["points"] = 10,
    },
    [335] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 17,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 15727,
                },
                ["id"] = 1448,
                ["name"] = "",
                ["type"] = 1,
            },
        },
        ["description"] = "AD_AQ40",
        ["icon"] = "achievement_boss_cthun",
        ["id"] = 335,
        ["name"] = "AN_AQ40",
        ["points"] = 10,
    },
    [336] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 17,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 15956,
                },
                ["id"] = 1449,
                ["name"] = "AC_NAXXRAMAS_SPIDERS1",
                ["type"] = 1,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 15953,
                },
                ["id"] = 1450,
                ["name"] = "AC_NAXXRAMAS_SPIDERS2",
                ["type"] = 1,
            },
            [3] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 15952,
                },
                ["id"] = 1451,
                ["name"] = "AC_NAXXRAMAS_SPIDERS3",
                ["type"] = 1,
            },
        },
        ["description"] = "AD_NAXXRAMAS_SPIDERS",
        ["icon"] = "-Inv_Trinket_Naxxramas04",
        ["id"] = 336,
        ["name"] = "AN_NAXXRAMAS_SPIDERS",
        ["points"] = 10,
    },
    [337] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 17,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 15954,
                },
                ["id"] = 1452,
                ["name"] = "AC_NAXXRAMAS_PLAGUE1",
                ["type"] = 1,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 15936,
                },
                ["id"] = 1453,
                ["name"] = "AC_NAXXRAMAS_PLAGUE2",
                ["type"] = 1,
            },
            [3] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 16011,
                },
                ["id"] = 1454,
                ["name"] = "AC_NAXXRAMAS_PLAGUE3",
                ["type"] = 1,
            },
        },
        ["description"] = "AD_NAXXRAMAS_PLAGUE",
        ["icon"] = "-inv_misc_cauldron_nature",
        ["id"] = 337,
        ["name"] = "AN_NAXXRAMAS_PLAGUE",
        ["points"] = 10,
    },
    [338] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 17,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 16061,
                },
                ["id"] = 1455,
                ["name"] = "AC_NAXXRAMAS_MILITARY1",
                ["type"] = 1,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 16060,
                },
                ["id"] = 1456,
                ["name"] = "AC_NAXXRAMAS_MILITARY2",
                ["type"] = 1,
            },
            [3] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 5,
                },
                ["id"] = 1457,
                ["name"] = "AC_NAXXRAMAS_MILITARY3",
                ["type"] = 36,
            },
        },
        ["description"] = "AD_NAXXRAMAS_MILITARY",
        ["icon"] = "spell_deathknight_classicon",
        ["id"] = 338,
        ["name"] = "AN_NAXXRAMAS_MILITARY",
        ["points"] = 10,
    },
    [339] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 17,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 16028,
                },
                ["id"] = 1458,
                ["name"] = "AC_NAXXRAMAS_CONSTRUCT1",
                ["type"] = 1,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 15931,
                },
                ["id"] = 1459,
                ["name"] = "AC_NAXXRAMAS_CONSTRUCT2",
                ["type"] = 1,
            },
            [3] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 15932,
                },
                ["id"] = 1460,
                ["name"] = "AC_NAXXRAMAS_CONSTRUCT3",
                ["type"] = 1,
            },
            [4] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 15928,
                },
                ["id"] = 1461,
                ["name"] = "AC_NAXXRAMAS_CONSTRUCT4",
                ["type"] = 1,
            },
        },
        ["description"] = "AD_NAXXRAMAS_CONSTRUCT",
        ["icon"] = "ability_rogue_deviouspoisons",
        ["id"] = 339,
        ["name"] = "AN_NAXXRAMAS_CONSTRUCT",
        ["points"] = 10,
    },
    [340] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 17,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 15990,
                },
                ["id"] = 1462,
                ["name"] = "",
                ["type"] = 1,
            },
        },
        ["description"] = "AD_NAXXRAMAS_LAIR",
        ["icon"] = "-inv_trinket_naxxramas06",
        ["id"] = 340,
        ["name"] = "AN_NAXXRAMAS_LAIR",
        ["points"] = 10,
    },
    [341] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 17,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 336,
                },
                ["id"] = 1464,
                ["name"] = "AN_NAXXRAMAS_SPIDERS",
                ["type"] = 20,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 337,
                },
                ["id"] = 1465,
                ["name"] = "AN_NAXXRAMAS_PLAGUE",
                ["type"] = 20,
            },
            [3] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 338,
                },
                ["id"] = 1466,
                ["name"] = "AN_NAXXRAMAS_MILITARY",
                ["type"] = 20,
            },
            [4] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 339,
                },
                ["id"] = 1467,
                ["name"] = "AN_NAXXRAMAS_CONSTRUCT",
                ["type"] = 20,
            },
            [5] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 540,
                },
                ["id"] = 1468,
                ["name"] = "AN_NAXXRAMAS_LAIR",
                ["type"] = 20,
            },
            [6] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 340,
                },
                ["id"] = 1469,
                ["name"] = "AN_NAXXRAMAS_LAIR",
                ["type"] = 20,
            },
        },
        ["description"] = "AD_NAXXRAMAS",
        ["icon"] = "achievement_dungeon_naxxramas_normal",
        ["id"] = 341,
        ["name"] = "AN_NAXXRAMAS",
        ["points"] = 10,
    },
    [342] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 16,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 330,
                },
                ["id"] = 1470,
                ["name"] = "AN_ONYXIA",
                ["type"] = 20,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 331,
                },
                ["id"] = 1471,
                ["name"] = "AN_AQ20",
                ["type"] = 20,
            },
            [3] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 332,
                },
                ["id"] = 1472,
                ["name"] = "AN_ZULGURUB",
                ["type"] = 20,
            },
        },
        ["description"] = "AD_YOUNG_HERO",
        ["icon"] = "achievement_dungeon_gloryofthehero",
        ["id"] = 342,
        ["name"] = "AN_YOUNG_HERO",
        ["points"] = 10,
    },
    [343] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 17,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 321,
                },
                ["id"] = 1473,
                ["name"] = "AN_BLACKROCK_DEPTHS_FULL",
                ["type"] = 20,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 324,
                },
                ["id"] = 1474,
                ["name"] = "AN_BLACKROCK_SPIRE",
                ["type"] = 20,
            },
            [3] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 333,
                },
                ["id"] = 1475,
                ["name"] = "AN_RAGNAROS",
                ["type"] = 20,
            },
            [4] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 334,
                },
                ["id"] = 1476,
                ["name"] = "AN_BLACK_WING_LAIR",
                ["type"] = 20,
            },
        },
        ["description"] = "AD_BLACKROCK_MASTER",
        ["icon"] = "achievement_dungeon_classicdungeonmaster",
        ["id"] = 343,
        ["name"] = "AN_BLACKROCK_MASTER",
        ["points"] = 10,
    },
    [344] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 16,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 342,
                },
                ["id"] = 1477,
                ["name"] = "AN_YOUNG_HERO",
                ["type"] = 20,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 333,
                },
                ["id"] = 1478,
                ["name"] = "AN_RAGNAROS",
                ["type"] = 20,
            },
            [3] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 334,
                },
                ["id"] = 1479,
                ["name"] = "AN_BLACK_WING_LAIR",
                ["type"] = 20,
            },
            [4] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 335,
                },
                ["id"] = 1480,
                ["name"] = "AN_AQ40",
                ["type"] = 20,
            },
            [5] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 341,
                },
                ["id"] = 1481,
                ["name"] = "AN_NAXXRAMAS",
                ["type"] = 20,
            },
        },
        ["description"] = "AD_HERO",
        ["icon"] = "achievement_dungeon_heroic_gloryoftheraider",
        ["id"] = 344,
        ["name"] = "AN_HERO",
        ["points"] = 10,
        ["rewardText"] = "TITLE_BUILTIN_HERO_OF_AZEROTH_LABEL",
    },
    [345] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 16,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 329,
                },
                ["id"] = 1482,
                ["name"] = "AN_DEFENDER",
                ["type"] = 20,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 344,
                },
                ["id"] = 1483,
                ["name"] = "AN_HERO",
                ["type"] = 20,
            },
        },
        ["description"] = "AD_GREAT_HERO",
        ["icon"] = "achievement_dungeon_gloryoftheraider",
        ["id"] = 345,
        ["name"] = "AN_GREAT_HERO",
        ["points"] = 10,
        ["rewardText"] = "TITLE_BUILTIN_GREAT_HERO_OF_AZEROTH_LABEL",
    },
    [346] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 17,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 6109,
                },
                ["id"] = 1484,
                ["name"] = "",
                ["type"] = 1,
            },
        },
        ["description"] = "AD_WB_AZUREGOS",
        ["icon"] = "achievement_boss_cyanigosa",
        ["id"] = 346,
        ["name"] = "AN_WB_AZUREGOS",
        ["points"] = 10,
    },
    [347] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 35,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 12397,
                },
                ["id"] = 1485,
                ["name"] = "",
                ["type"] = 1,
            },
        },
        ["description"] = "AD_WB_KAZZAK",
        ["icon"] = "ability_warlock_demonicempowerment",
        ["id"] = 347,
        ["name"] = "AN_WB_KAZZAK",
        ["points"] = 0,
    },
    [348] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 17,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 14887,
                },
                ["id"] = 1486,
                ["name"] = "",
                ["type"] = 1,
            },
        },
        ["description"] = "AD_WB_YSONDRE",
        ["icon"] = "achievement_boss_valithradreamwalker",
        ["id"] = 348,
        ["name"] = "AN_WB_YSONDRE",
        ["points"] = 10,
    },
    [349] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 17,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 14888,
                },
                ["id"] = 1487,
                ["name"] = "",
                ["type"] = 1,
            },
        },
        ["description"] = "AD_WB_LETHON",
        ["icon"] = "achievement_boss_aeonus_01",
        ["id"] = 349,
        ["name"] = "AN_WB_LETHON",
        ["points"] = 10,
    },
    [350] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 17,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 14889,
                },
                ["id"] = 1488,
                ["name"] = "",
                ["type"] = 1,
            },
        },
        ["description"] = "AD_WB_EMERISS",
        ["icon"] = "achievement_boss_malygos_01",
        ["id"] = 350,
        ["name"] = "AN_WB_EMERISS",
        ["points"] = 10,
    },
    [351] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 17,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 14890,
                },
                ["id"] = 1489,
                ["name"] = "",
                ["type"] = 1,
            },
        },
        ["description"] = "AD_WB_TAERAR",
        ["icon"] = "achievement_boss_eregos",
        ["id"] = 351,
        ["name"] = "AN_WB_TAERAR",
        ["points"] = 10,
    },
    [352] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 16,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 348,
                },
                ["id"] = 1490,
                ["name"] = "AN_WB_YSONDRE",
                ["type"] = 20,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 349,
                },
                ["id"] = 1491,
                ["name"] = "AN_WB_LETHON",
                ["type"] = 20,
            },
            [3] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 350,
                },
                ["id"] = 1492,
                ["name"] = "AN_WB_EMERISS",
                ["type"] = 20,
            },
            [4] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 351,
                },
                ["id"] = 1493,
                ["name"] = "AN_WB_TAERAR",
                ["type"] = 20,
            },
        },
        ["description"] = "AD_WB_EMERALD_DRAGONS",
        ["icon"] = "inv_misc_shadowegg",
        ["id"] = 352,
        ["name"] = "AN_WB_EMERALD_DRAGONS",
        ["points"] = 20,
        ["rewardText"] = "TITLE_BUILTIN_EMERALD_KEEPER_LABEL",
    },
    [353] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 17,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1,
                },
                ["id"] = 1494,
                ["name"] = "",
                ["type"] = 36,
            },
        },
        ["description"] = "AD_LEEROY",
        ["icon"] = "ability_mount_drake_red",
        ["id"] = 353,
        ["name"] = "AN_LEEROY",
        ["points"] = 20,
        ["rewardText"] = "TITLE_BUILTIN_JENKINS_LABEL",
    },
    [354] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 17,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 2,
                },
                ["id"] = 1495,
                ["name"] = "",
                ["type"] = 36,
            },
        },
        ["description"] = "AD_BWL_DUO",
        ["icon"] = "ability_mount_drake_twilight",
        ["id"] = 354,
        ["name"] = "AN_BWL_DUO",
        ["points"] = 20,
    },
    [355] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 17,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 15956,
                },
                ["id"] = 1496,
                ["name"] = "",
                ["type"] = 37,
            },
        },
        ["description"] = "AD_ANUBREKHAN_WITHOUT_MOBS",
        ["icon"] = "achievement_boss_anubarak",
        ["id"] = 355,
        ["name"] = "AN_ANUBREKHAN_WITHOUT_MOBS",
        ["points"] = 20,
    },
    [356] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 17,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 15953,
                },
                ["id"] = 1497,
                ["name"] = "",
                ["type"] = 37,
            },
        },
        ["description"] = "AD_FAERLINA_WITHOUT_MOBS",
        ["icon"] = "-spell_shadow_curseofmannoroth",
        ["id"] = 356,
        ["name"] = "AN_FAERLINA_WITHOUT_MOBS",
        ["points"] = 20,
    },
    [357] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 17,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 3,
                },
                ["id"] = 1498,
                ["name"] = "",
                ["type"] = 36,
            },
        },
        ["description"] = "AD_ARACHNOPHOBIA",
        ["icon"] = "achievement_halloween_spider_01",
        ["id"] = 357,
        ["name"] = "AN_ARACHNOPHOBIA",
        ["points"] = 20,
    },
    [358] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 17,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 4,
                },
                ["id"] = 1499,
                ["name"] = "",
                ["type"] = 36,
            },
        },
        ["description"] = "AD_FOUR_TOGETHER",
        ["icon"] = "spell_deathknight_summondeathcharger",
        ["id"] = 358,
        ["name"] = "AN_FOUR_TOGETHER",
        ["points"] = 20,
    },
    [359] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 17,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 15989,
                },
                ["id"] = 1500,
                ["name"] = "",
                ["type"] = 38,
            },
        },
        ["description"] = "AD_SAPPHIRONE_WITH_ALL_ALIVE",
        ["icon"] = "-spell_frost_icestorm",
        ["id"] = 359,
        ["name"] = "AN_SAPPHIRONE_WITH_ALL_ALIVE",
        ["points"] = 20,
    },
    [414] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 19,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 75,
                },
                ["id"] = 1612,
                ["name"] = "",
                ["type"] = 13,
            },
        },
        ["description"] = "AD_PROFS_JOURNEYMAN",
        ["icon"] = "-Inv_Misc_Note_01",
        ["id"] = 414,
        ["name"] = "AN_PROFS_JOURNEYMAN",
        ["nextID"] = 415,
        ["points"] = 10,
    },
    [415] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 19,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 150,
                },
                ["id"] = 1613,
                ["name"] = "",
                ["type"] = 13,
            },
        },
        ["description"] = "AD_PROFS_EXPERT",
        ["icon"] = "-Inv_Misc_Note_01",
        ["id"] = 415,
        ["name"] = "AN_PROFS_EXPERT",
        ["nextID"] = 416,
        ["points"] = 10,
        ["previousID"] = 414,
    },
    [416] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 19,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 225,
                },
                ["id"] = 1614,
                ["name"] = "",
                ["type"] = 13,
            },
        },
        ["description"] = "AD_PROFS_ARTISAN",
        ["icon"] = "-Inv_Misc_Note_01",
        ["id"] = 416,
        ["name"] = "AN_PROFS_ARTISAN",
        ["nextID"] = 417,
        ["points"] = 10,
        ["previousID"] = 415,
    },
    [417] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 19,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 300,
                },
                ["id"] = 1615,
                ["name"] = "",
                ["type"] = 13,
            },
        },
        ["description"] = "AD_PROFS_ONE",
        ["icon"] = "-Inv_Misc_Note_01",
        ["id"] = 417,
        ["name"] = "AN_PROFS_ONE",
        ["points"] = 10,
        ["previousID"] = 416,
    },
    [419] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 19,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 300,
                },
                ["id"] = 1617,
                ["name"] = "AC_PROFS_TWO",
                ["quantity"] = 2,
                ["type"] = 13,
            },
        },
        ["description"] = "AD_PROFS_TWO",
        ["icon"] = "-ability_repair",
        ["id"] = 419,
        ["name"] = "AN_PROFS_TWO",
        ["points"] = 10,
    },
    [421] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 22,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1,
                    [2] = 75,
                },
                ["id"] = 1619,
                ["name"] = "",
                ["type"] = 12,
            },
        },
        ["description"] = "AD_FIRST_AID_JOURNEYMAN",
        ["icon"] = "-spell_holy_sealofsacrifice",
        ["id"] = 421,
        ["name"] = "AN_FIRST_AID_JOURNEYMAN",
        ["nextID"] = 422,
        ["points"] = 10,
    },
    [422] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 22,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1,
                    [2] = 150,
                },
                ["id"] = 1620,
                ["name"] = "",
                ["type"] = 12,
            },
        },
        ["description"] = "AD_FIRST_AID_EXPERT",
        ["icon"] = "-spell_holy_sealofsacrifice",
        ["id"] = 422,
        ["name"] = "AN_FIRST_AID_EXPERT",
        ["nextID"] = 423,
        ["points"] = 10,
        ["previousID"] = 421,
    },
    [423] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 22,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1,
                    [2] = 225,
                },
                ["id"] = 1621,
                ["name"] = "",
                ["type"] = 12,
            },
        },
        ["description"] = "AD_FIRST_AID_ARTISAN",
        ["icon"] = "-spell_holy_sealofsacrifice",
        ["id"] = 423,
        ["name"] = "AN_FIRST_AID_ARTISAN",
        ["nextID"] = 424,
        ["points"] = 10,
        ["previousID"] = 422,
    },
    [424] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 22,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1,
                    [2] = 300,
                },
                ["id"] = 1622,
                ["name"] = "",
                ["type"] = 12,
            },
        },
        ["description"] = "AD_FIRST_AID_MASTER",
        ["icon"] = "-spell_holy_sealofsacrifice",
        ["id"] = 424,
        ["name"] = "AN_FIRST_AID_MASTER",
        ["points"] = 10,
        ["previousID"] = 423,
    },
    [425] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 21,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 2,
                    [2] = 75,
                },
                ["id"] = 1624,
                ["name"] = "",
                ["type"] = 12,
            },
        },
        ["description"] = "AD_FISHING_JOURNEYMAN",
        ["icon"] = "-trade_fishing",
        ["id"] = 425,
        ["name"] = "AN_FISHING_JOURNEYMAN",
        ["nextID"] = 426,
        ["points"] = 10,
    },
    [426] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 21,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 2,
                    [2] = 150,
                },
                ["id"] = 1625,
                ["name"] = "",
                ["type"] = 12,
            },
        },
        ["description"] = "AD_FISHING_EXPERT",
        ["icon"] = "-trade_fishing",
        ["id"] = 426,
        ["name"] = "AN_FISHING_EXPERT",
        ["nextID"] = 427,
        ["points"] = 10,
        ["previousID"] = 425,
    },
    [427] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 21,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 2,
                    [2] = 225,
                },
                ["id"] = 1626,
                ["name"] = "",
                ["type"] = 12,
            },
        },
        ["description"] = "AD_FISHING_ARTISAN",
        ["icon"] = "-trade_fishing",
        ["id"] = 427,
        ["name"] = "AN_FISHING_ARTISAN",
        ["nextID"] = 428,
        ["points"] = 10,
        ["previousID"] = 426,
    },
    [428] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 21,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 2,
                    [2] = 300,
                },
                ["id"] = 1627,
                ["name"] = "",
                ["type"] = 12,
            },
        },
        ["description"] = "AD_FISHING_MASTER",
        ["icon"] = "-trade_fishing",
        ["id"] = 428,
        ["name"] = "AN_FISHING_MASTER",
        ["points"] = 10,
        ["previousID"] = 427,
    },
    [429] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 20,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 3,
                    [2] = 75,
                },
                ["id"] = 1629,
                ["name"] = "",
                ["type"] = 12,
            },
        },
        ["description"] = "AD_COOKING_JOURNEYMAN",
        ["icon"] = "-inv_misc_food_15",
        ["id"] = 429,
        ["name"] = "AN_COOKING_JOURNEYMAN",
        ["nextID"] = 430,
        ["points"] = 10,
    },
    [430] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 20,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 3,
                    [2] = 150,
                },
                ["id"] = 1630,
                ["name"] = "",
                ["type"] = 12,
            },
        },
        ["description"] = "AD_COOKING_EXPERT",
        ["icon"] = "-inv_misc_food_15",
        ["id"] = 430,
        ["name"] = "AN_COOKING_EXPERT",
        ["nextID"] = 431,
        ["points"] = 10,
        ["previousID"] = 429,
    },
    [431] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 20,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 3,
                    [2] = 225,
                },
                ["id"] = 1631,
                ["name"] = "",
                ["type"] = 12,
            },
        },
        ["description"] = "AD_COOKING_ARTISAN",
        ["icon"] = "-inv_misc_food_15",
        ["id"] = 431,
        ["name"] = "AN_COOKING_ARTISAN",
        ["nextID"] = 432,
        ["points"] = 10,
        ["previousID"] = 430,
    },
    [432] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 20,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 3,
                    [2] = 300,
                },
                ["id"] = 1632,
                ["name"] = "",
                ["type"] = 12,
            },
        },
        ["description"] = "AD_COOKING_MASTER",
        ["icon"] = "-inv_misc_food_15",
        ["id"] = 432,
        ["name"] = "AN_COOKING_MASTER",
        ["points"] = 10,
        ["previousID"] = 431,
    },
    [433] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 19,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 424,
                },
                ["id"] = 1634,
                ["name"] = "AN_FIRST_AID_MASTER",
                ["type"] = 20,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 428,
                },
                ["id"] = 1635,
                ["name"] = "AN_FISHING_MASTER",
                ["type"] = 20,
            },
            [3] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 432,
                },
                ["id"] = 1636,
                ["name"] = "AN_COOKING_MASTER",
                ["type"] = 20,
            },
        },
        ["description"] = "AD_PROFS_SECONDARY",
        ["icon"] = "-Inv_Misc_Note_02",
        ["id"] = 433,
        ["name"] = "AN_PROFS_SECONDARY",
        ["points"] = 10,
    },
    [438] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 19,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 419,
                },
                ["id"] = 1646,
                ["name"] = "AN_PROFS_TWO",
                ["type"] = 20,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 433,
                },
                ["id"] = 1647,
                ["name"] = "AN_PROFS_SECONDARY",
                ["type"] = 20,
            },
        },
        ["description"] = "AD_PROFS_FIVE",
        ["icon"] = "-Spell_Magic_GreaterBlessingOfKings",
        ["id"] = 438,
        ["name"] = "AN_PROFS_FIVE",
        ["points"] = 10,
    },
    [440] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 22,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 14530,
                },
                ["id"] = 1650,
                ["name"] = "AC_STOCKING_UP",
                ["quantity"] = 100,
                ["type"] = 15,
            },
        },
        ["description"] = "AD_STOCKING_UP",
        ["icon"] = "-Inv_Misc_Bandage_12",
        ["id"] = 440,
        ["name"] = "AN_STOCKING_UP",
        ["nextID"] = 441,
        ["points"] = 10,
    },
    [441] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 22,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 14530,
                },
                ["id"] = 1651,
                ["name"] = "AC_STOCKING_UP_2",
                ["quantity"] = 500,
                ["type"] = 15,
            },
        },
        ["description"] = "AD_STOCKING_UP_2",
        ["icon"] = "-Inv_Misc_Bandage_12",
        ["id"] = 441,
        ["name"] = "AN_STOCKING_UP_2",
        ["points"] = 10,
        ["previousID"] = 440,
    },
    [444] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 21,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 19970,
                        },
                        ["id"] = 1654,
                        ["name"] = "",
                        ["type"] = 5,
                    },
                    [2] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 19979,
                        },
                        ["id"] = 1655,
                        ["name"] = "",
                        ["type"] = 5,
                    },
                },
                ["id"] = 1656,
                ["name"] = "",
                ["type"] = 39,
            },
        },
        ["description"] = "AD_BOOTY_BAY_CONTEST",
        ["icon"] = "-inv_misc_fish_21",
        ["id"] = 444,
        ["name"] = "AN_BOOTY_BAY_CONTEST",
        ["points"] = 10,
    },
    [445] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 21,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 19803,
                        },
                        ["id"] = 1657,
                        ["name"] = "",
                        ["type"] = 28,
                    },
                    [2] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 19805,
                        },
                        ["id"] = 1658,
                        ["name"] = "",
                        ["type"] = 28,
                    },
                    [3] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 19806,
                        },
                        ["id"] = 1659,
                        ["name"] = "",
                        ["type"] = 28,
                    },
                },
                ["id"] = 1660,
                ["name"] = "",
                ["type"] = 39,
            },
        },
        ["description"] = "AD_BOOTY_BAY_FISH",
        ["icon"] = "-inv_misc_fish_10",
        ["id"] = 445,
        ["name"] = "AN_BOOTY_BAY_FISH",
        ["points"] = 10,
    },
    [446] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 21,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 6291,
                },
                ["id"] = 1661,
                ["name"] = {
                    ["itemID"] = 6291,
                },
                ["type"] = 28,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 6303,
                },
                ["id"] = 1662,
                ["name"] = {
                    ["itemID"] = 6303,
                },
                ["type"] = 28,
            },
            [3] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 8365,
                },
                ["id"] = 1663,
                ["name"] = {
                    ["itemID"] = 8365,
                },
                ["type"] = 28,
            },
            [4] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 6522,
                },
                ["id"] = 1664,
                ["name"] = {
                    ["itemID"] = 6522,
                },
                ["type"] = 28,
            },
            [5] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 6358,
                },
                ["id"] = 1665,
                ["name"] = {
                    ["itemID"] = 6358,
                },
                ["type"] = 28,
            },
            [6] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 21071,
                },
                ["id"] = 1666,
                ["name"] = {
                    ["itemID"] = 21071,
                },
                ["type"] = 28,
            },
            [7] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 6359,
                },
                ["id"] = 1667,
                ["name"] = {
                    ["itemID"] = 6359,
                },
                ["type"] = 28,
            },
            [8] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 8366,
                },
                ["id"] = 1668,
                ["name"] = {
                    ["itemID"] = 8366,
                },
                ["type"] = 28,
            },
            [9] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 21153,
                },
                ["id"] = 1669,
                ["name"] = {
                    ["itemID"] = 21153,
                },
                ["type"] = 28,
            },
            [10] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 13755,
                },
                ["id"] = 1670,
                ["name"] = {
                    ["itemID"] = 13755,
                },
                ["type"] = 28,
            },
            [11] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 13422,
                },
                ["id"] = 1671,
                ["name"] = {
                    ["itemID"] = 13422,
                },
                ["type"] = 28,
            },
            [12] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 13757,
                },
                ["id"] = 1672,
                ["name"] = {
                    ["itemID"] = 13757,
                },
                ["type"] = 28,
            },
            [13] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 13754,
                },
                ["id"] = 1673,
                ["name"] = {
                    ["itemID"] = 13754,
                },
                ["type"] = 28,
            },
            [14] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 13758,
                },
                ["id"] = 1674,
                ["name"] = {
                    ["itemID"] = 13758,
                },
                ["type"] = 28,
            },
            [15] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 13756,
                },
                ["id"] = 1675,
                ["name"] = {
                    ["itemID"] = 13756,
                },
                ["type"] = 28,
            },
            [16] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 13760,
                },
                ["id"] = 1676,
                ["name"] = {
                    ["itemID"] = 13760,
                },
                ["type"] = 28,
            },
            [17] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 13759,
                },
                ["id"] = 1677,
                ["name"] = {
                    ["itemID"] = 13759,
                },
                ["type"] = 28,
            },
            [18] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 13890,
                },
                ["id"] = 1678,
                ["name"] = {
                    ["itemID"] = 13890,
                },
                ["type"] = 28,
            },
            [19] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 13889,
                },
                ["id"] = 1679,
                ["name"] = {
                    ["itemID"] = 13889,
                },
                ["type"] = 28,
            },
            [20] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 13893,
                },
                ["id"] = 1680,
                ["name"] = {
                    ["itemID"] = 13893,
                },
                ["type"] = 28,
            },
            [21] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 13888,
                },
                ["id"] = 1681,
                ["name"] = {
                    ["itemID"] = 13888,
                },
                ["type"] = 28,
            },
            [22] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 12238,
                },
                ["id"] = 1682,
                ["name"] = {
                    ["itemID"] = 12238,
                },
                ["type"] = 28,
            },
            [23] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 6299,
                },
                ["id"] = 1683,
                ["name"] = {
                    ["itemID"] = 6299,
                },
                ["type"] = 28,
            },
            [24] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 4603,
                },
                ["id"] = 1684,
                ["name"] = {
                    ["itemID"] = 4603,
                },
                ["type"] = 28,
            },
            [25] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 6308,
                },
                ["id"] = 1685,
                ["name"] = {
                    ["itemID"] = 6308,
                },
                ["type"] = 28,
            },
            [26] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 6289,
                },
                ["id"] = 1686,
                ["name"] = {
                    ["itemID"] = 6289,
                },
                ["type"] = 28,
            },
            [27] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 6362,
                },
                ["id"] = 1687,
                ["name"] = {
                    ["itemID"] = 6362,
                },
                ["type"] = 28,
            },
            [28] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 6361,
                },
                ["id"] = 1688,
                ["name"] = {
                    ["itemID"] = 6361,
                },
                ["type"] = 28,
            },
        },
        ["description"] = "AD_FISHING_COLLECTION",
        ["icon"] = "-inv_misc_fish_08",
        ["id"] = 446,
        ["name"] = "AN_FISHING_COLLECTION",
        ["points"] = 10,
    },
    [447] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 21,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 7080,
                },
                ["id"] = 1689,
                ["name"] = "",
                ["type"] = 28,
            },
        },
        ["description"] = "AD_FISHING_WATER",
        ["icon"] = "-Spell_Nature_Acid_01",
        ["id"] = 447,
        ["name"] = "AN_FISHING_WATER",
        ["points"] = 10,
    },
    [448] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 21,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 21151,
                },
                ["id"] = 1690,
                ["name"] = {
                    ["itemID"] = 21151,
                },
                ["type"] = 28,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 21114,
                },
                ["id"] = 1691,
                ["name"] = {
                    ["itemID"] = 21114,
                },
                ["type"] = 28,
            },
            [3] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 20709,
                },
                ["id"] = 1692,
                ["name"] = {
                    ["itemID"] = 20709,
                },
                ["type"] = 28,
            },
        },
        ["description"] = "AD_FISHING_RUM",
        ["icon"] = "-Inv_Drink_04",
        ["id"] = 448,
        ["name"] = "AN_FISHING_RUM",
        ["points"] = 10,
    },
    [449] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 21,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 8350,
                },
                ["id"] = 1693,
                ["name"] = "",
                ["type"] = 28,
            },
        },
        ["description"] = "AD_FISHING_RING",
        ["icon"] = "-Inv_Jewelry_Ring_03",
        ["id"] = 449,
        ["name"] = "AN_FISHING_RING",
        ["points"] = 10,
    },
    [450] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 21,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 6301,
                },
                ["id"] = 1694,
                ["name"] = "",
                ["type"] = 28,
            },
        },
        ["description"] = "AD_FISHING_SKULL",
        ["icon"] = "-Inv_Misc_Bone_DwarfSkull_01",
        ["id"] = 450,
        ["name"] = "AN_FISHING_SKULL",
        ["points"] = 10,
    },
    [451] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 21,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 6292,
                },
                ["id"] = 1695,
                ["name"] = {
                    ["itemID"] = 6292,
                },
                ["type"] = 28,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 6294,
                },
                ["id"] = 1696,
                ["name"] = {
                    ["itemID"] = 6294,
                },
                ["type"] = 28,
            },
            [3] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 6295,
                },
                ["id"] = 1697,
                ["name"] = {
                    ["itemID"] = 6295,
                },
                ["type"] = 28,
            },
        },
        ["description"] = "AD_FISHING_SNAPPER",
        ["icon"] = "-inv_misc_fish_32",
        ["id"] = 451,
        ["name"] = "AN_FISHING_SNAPPER",
        ["points"] = 10,
    },
    [452] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 21,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 13876,
                },
                ["id"] = 1698,
                ["name"] = {
                    ["itemID"] = 13876,
                },
                ["type"] = 28,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 13877,
                },
                ["id"] = 1699,
                ["name"] = {
                    ["itemID"] = 13877,
                },
                ["type"] = 28,
            },
            [3] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 13878,
                },
                ["id"] = 1700,
                ["name"] = {
                    ["itemID"] = 13878,
                },
                ["type"] = 28,
            },
            [4] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 13879,
                },
                ["id"] = 1701,
                ["name"] = {
                    ["itemID"] = 13879,
                },
                ["type"] = 28,
            },
            [5] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 13880,
                },
                ["id"] = 1702,
                ["name"] = {
                    ["itemID"] = 13880,
                },
                ["type"] = 28,
            },
        },
        ["description"] = "AD_FISHING_SEA_BASS",
        ["icon"] = "-inv_misc_fish_06",
        ["id"] = 452,
        ["name"] = "AN_FISHING_SEA_BASS",
        ["points"] = 10,
    },
    [453] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 21,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 13901,
                },
                ["id"] = 1703,
                ["name"] = {
                    ["itemID"] = 13901,
                },
                ["type"] = 28,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 13902,
                },
                ["id"] = 1704,
                ["name"] = {
                    ["itemID"] = 13902,
                },
                ["type"] = 28,
            },
            [3] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 13903,
                },
                ["id"] = 1705,
                ["name"] = {
                    ["itemID"] = 13903,
                },
                ["type"] = 28,
            },
            [4] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 13904,
                },
                ["id"] = 1706,
                ["name"] = {
                    ["itemID"] = 13904,
                },
                ["type"] = 28,
            },
            [5] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 13905,
                },
                ["id"] = 1707,
                ["name"] = {
                    ["itemID"] = 13905,
                },
                ["type"] = 28,
            },
            [6] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 13906,
                },
                ["id"] = 1708,
                ["name"] = {
                    ["itemID"] = 13906,
                },
                ["type"] = 28,
            },
        },
        ["description"] = "AD_FISHING_SALMON",
        ["icon"] = "-inv_misc_fish_02",
        ["id"] = 453,
        ["name"] = "AN_FISHING_SALMON",
        ["points"] = 10,
    },
    [454] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 21,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 13907,
                },
                ["id"] = 1709,
                ["name"] = {
                    ["itemID"] = 13907,
                },
                ["type"] = 28,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 13908,
                },
                ["id"] = 1710,
                ["name"] = {
                    ["itemID"] = 13908,
                },
                ["type"] = 28,
            },
            [3] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 13909,
                },
                ["id"] = 1711,
                ["name"] = {
                    ["itemID"] = 13909,
                },
                ["type"] = 28,
            },
            [4] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 13910,
                },
                ["id"] = 1712,
                ["name"] = {
                    ["itemID"] = 13910,
                },
                ["type"] = 28,
            },
            [5] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 13911,
                },
                ["id"] = 1713,
                ["name"] = {
                    ["itemID"] = 13911,
                },
                ["type"] = 28,
            },
            [6] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 13912,
                },
                ["id"] = 1714,
                ["name"] = {
                    ["itemID"] = 13912,
                },
                ["type"] = 28,
            },
            [7] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 13913,
                },
                ["id"] = 1715,
                ["name"] = {
                    ["itemID"] = 13913,
                },
                ["type"] = 28,
            },
        },
        ["description"] = "AD_FISHING_LOBSTER",
        ["icon"] = "-Inv_Misc_Fish_14",
        ["id"] = 454,
        ["name"] = "AN_FISHING_LOBSTER",
        ["points"] = 10,
    },
    [455] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 21,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 451,
                },
                ["id"] = 1716,
                ["name"] = "AN_FISHING_SNAPPER",
                ["type"] = 20,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 452,
                },
                ["id"] = 1717,
                ["name"] = "AN_FISHING_SEA_BASS",
                ["type"] = 20,
            },
            [3] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 453,
                },
                ["id"] = 1718,
                ["name"] = "AN_FISHING_SALMON",
                ["type"] = 20,
            },
            [4] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 454,
                },
                ["id"] = 1719,
                ["name"] = "AN_FISHING_LOBSTER",
                ["type"] = 20,
            },
        },
        ["description"] = "AD_FISHING_BIG_SIZE",
        ["icon"] = "-Inv_FishingPole_01",
        ["id"] = 455,
        ["name"] = "AN_FISHING_BIG_SIZE",
        ["points"] = 10,
        ["rewardText"] = "TITLE_BUILTIN_AZEROTHS_GREATEST_ANGLER_LABEL",
    },
    [457] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 20,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 3,
                },
                ["id"] = 1756,
                ["name"] = {
                    ["args"] = {
                        [1] = 5,
                    },
                    ["key"] = "AC_COOKING_RECIPES",
                },
                ["quantity"] = 5,
                ["type"] = 30,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 5,
            },
            ["key"] = "AD_COOKING_RECIPES",
        },
        ["icon"] = "-inv_misc_food_66",
        ["id"] = 457,
        ["name"] = "AN_COOKING_RECIPES_5",
        ["nextID"] = 458,
        ["points"] = 10,
    },
    [458] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 20,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 3,
                },
                ["id"] = 1757,
                ["name"] = {
                    ["args"] = {
                        [1] = 10,
                    },
                    ["key"] = "AC_COOKING_RECIPES",
                },
                ["quantity"] = 10,
                ["type"] = 30,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 10,
            },
            ["key"] = "AD_COOKING_RECIPES",
        },
        ["icon"] = "-inv_misc_food_65",
        ["id"] = 458,
        ["name"] = "AN_COOKING_RECIPES_10",
        ["nextID"] = 459,
        ["points"] = 10,
        ["previousID"] = 457,
    },
    [459] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 20,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 3,
                },
                ["id"] = 1758,
                ["name"] = {
                    ["args"] = {
                        [1] = 25,
                    },
                    ["key"] = "AC_COOKING_RECIPES",
                },
                ["quantity"] = 25,
                ["type"] = 30,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 25,
            },
            ["key"] = "AD_COOKING_RECIPES",
        },
        ["icon"] = "-inv_misc_food_60",
        ["id"] = 459,
        ["name"] = "AN_COOKING_RECIPES_25",
        ["nextID"] = 460,
        ["points"] = 10,
        ["previousID"] = 458,
    },
    [460] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 20,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 3,
                },
                ["id"] = 1759,
                ["name"] = {
                    ["args"] = {
                        [1] = 50,
                    },
                    ["key"] = "AC_COOKING_RECIPES",
                },
                ["quantity"] = 50,
                ["type"] = 30,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 50,
            },
            ["key"] = "AD_COOKING_RECIPES",
        },
        ["icon"] = "-inv_misc_food_13",
        ["id"] = 460,
        ["name"] = "AN_COOKING_RECIPES_50",
        ["nextID"] = 461,
        ["points"] = 10,
        ["previousID"] = 459,
    },
    [461] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 20,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 3,
                },
                ["id"] = 1760,
                ["name"] = {
                    ["args"] = {
                        [1] = 75,
                    },
                    ["key"] = "AC_COOKING_RECIPES",
                },
                ["quantity"] = 75,
                ["type"] = 30,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 75,
            },
            ["key"] = "AD_COOKING_RECIPES",
        },
        ["icon"] = "-inv_misc_food_92_lobster",
        ["id"] = 461,
        ["name"] = "AN_COOKING_RECIPES_75",
        ["points"] = 10,
        ["previousID"] = 460,
        ["rewardText"] = "TITLE_BUILTIN_CHEF_LABEL",
    },
    [462] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 20,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 13931,
                },
                ["id"] = 1761,
                ["name"] = "AC_COOKING_CREATE",
                ["quantity"] = 100,
                ["type"] = 15,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = {
                    ["itemID"] = 13931,
                },
                [2] = 100,
            },
            ["key"] = "AD_COOKING_CREATE",
        },
        ["icon"] = "-Inv_Drink_17",
        ["id"] = 462,
        ["name"] = "AN_COOKING_SOUP",
        ["points"] = 10,
    },
    [463] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 20,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 18254,
                },
                ["id"] = 1762,
                ["name"] = "AC_COOKING_CREATE",
                ["quantity"] = 100,
                ["type"] = 15,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = {
                    ["itemID"] = 18254,
                },
                [2] = 100,
            },
            ["key"] = "AD_COOKING_CREATE",
        },
        ["icon"] = "-Inv_Misc_Food_63",
        ["id"] = 463,
        ["name"] = "AN_COOKING_DESSERT",
        ["points"] = 10,
    },
    [464] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 20,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 13928,
                },
                ["id"] = 1763,
                ["name"] = "AC_COOKING_CREATE",
                ["quantity"] = 100,
                ["type"] = 15,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = {
                    ["itemID"] = 13928,
                },
                [2] = 100,
            },
            ["key"] = "AD_COOKING_CREATE",
        },
        ["icon"] = "-Inv_Misc_Fish_13",
        ["id"] = 464,
        ["name"] = "AN_COOKING_SQUID",
        ["points"] = 10,
    },
    [465] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 20,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 20452,
                },
                ["id"] = 1764,
                ["name"] = "AC_COOKING_CREATE",
                ["quantity"] = 100,
                ["type"] = 15,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = {
                    ["itemID"] = 20452,
                },
                [2] = 100,
            },
            ["key"] = "AD_COOKING_CREATE",
        },
        ["icon"] = "-Inv_Misc_Food_64",
        ["id"] = 465,
        ["name"] = "AN_COOKING_DUMPLINGS",
        ["points"] = 10,
    },
    [466] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 20,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 462,
                },
                ["id"] = 1765,
                ["name"] = "AN_COOKING_SOUP",
                ["type"] = 20,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 463,
                },
                ["id"] = 1766,
                ["name"] = "AN_COOKING_DESSERT",
                ["type"] = 20,
            },
            [3] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 464,
                },
                ["id"] = 1767,
                ["name"] = "AN_COOKING_SQUID",
                ["type"] = 20,
            },
            [4] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 465,
                },
                ["id"] = 1768,
                ["name"] = "AN_COOKING_DUMPLINGS",
                ["type"] = 20,
            },
        },
        ["description"] = "AD_COOKING_BIG_TABLE",
        ["icon"] = "-Inv_Misc_Food_49",
        ["id"] = 466,
        ["name"] = "AN_COOKING_BIG_TABLE",
        ["points"] = 10,
    },
    [468] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 23,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 8,
                },
                ["id"] = 1971,
                ["name"] = "AC_REPS_1",
                ["quantity"] = 1,
                ["type"] = 17,
            },
        },
        ["description"] = "AD_REPS_1",
        ["icon"] = "achievement_reputation_01",
        ["id"] = 468,
        ["name"] = "AN_REPS_1",
        ["nextID"] = 469,
        ["points"] = 10,
    },
    [469] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 23,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 8,
                },
                ["id"] = 1972,
                ["name"] = {
                    ["args"] = {
                        [1] = 5,
                    },
                    ["key"] = "AC_REPS",
                },
                ["quantity"] = 5,
                ["type"] = 17,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 5,
            },
            ["key"] = "AD_REPS",
        },
        ["icon"] = "achievement_reputation_02",
        ["id"] = 469,
        ["name"] = {
            ["concat"] = {
                [1] = {
                    ["literal"] = "5",
                },
                [2] = "AN_REPS_X",
                [3] = {
                    ["literal"] = "",
                },
            },
        },
        ["nextID"] = 470,
        ["points"] = 10,
        ["previousID"] = 468,
    },
    [470] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 23,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 8,
                },
                ["id"] = 1973,
                ["name"] = {
                    ["args"] = {
                        [1] = 10,
                    },
                    ["key"] = "AC_REPS",
                },
                ["quantity"] = 10,
                ["type"] = 17,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 10,
            },
            ["key"] = "AD_REPS",
        },
        ["icon"] = "achievement_reputation_03",
        ["id"] = 470,
        ["name"] = {
            ["concat"] = {
                [1] = {
                    ["literal"] = "10",
                },
                [2] = "AN_REPS_X",
                [3] = {
                    ["literal"] = "",
                },
            },
        },
        ["nextID"] = 471,
        ["points"] = 10,
        ["previousID"] = 469,
    },
    [471] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 23,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 8,
                },
                ["id"] = 1974,
                ["name"] = {
                    ["args"] = {
                        [1] = 15,
                    },
                    ["key"] = "AC_REPS",
                },
                ["quantity"] = 15,
                ["type"] = 17,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 15,
            },
            ["key"] = "AD_REPS",
        },
        ["icon"] = "achievement_reputation_04",
        ["id"] = 471,
        ["name"] = {
            ["concat"] = {
                [1] = {
                    ["literal"] = "15",
                },
                [2] = "AN_REPS_X",
                [3] = {
                    ["literal"] = "",
                },
            },
        },
        ["nextID"] = 472,
        ["points"] = 10,
        ["previousID"] = 470,
    },
    [472] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 23,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 8,
                },
                ["id"] = 1975,
                ["name"] = {
                    ["args"] = {
                        [1] = 20,
                    },
                    ["key"] = "AC_REPS",
                },
                ["quantity"] = 20,
                ["type"] = 17,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 20,
            },
            ["key"] = "AD_REPS",
        },
        ["icon"] = "achievement_reputation_05",
        ["id"] = 472,
        ["name"] = {
            ["concat"] = {
                [1] = {
                    ["literal"] = "20",
                },
                [2] = "AN_REPS_X",
                [3] = {
                    ["literal"] = "",
                },
            },
        },
        ["nextID"] = 473,
        ["points"] = 10,
        ["previousID"] = 471,
    },
    [473] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 23,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 8,
                },
                ["id"] = 1976,
                ["name"] = {
                    ["args"] = {
                        [1] = 25,
                    },
                    ["key"] = "AC_REPS",
                },
                ["quantity"] = 25,
                ["type"] = 17,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 25,
            },
            ["key"] = "AD_REPS",
        },
        ["icon"] = "achievement_reputation_06",
        ["id"] = 473,
        ["name"] = {
            ["concat"] = {
                [1] = {
                    ["literal"] = "25",
                },
                [2] = "AN_REPS_X",
                [3] = {
                    ["literal"] = "",
                },
            },
        },
        ["nextID"] = 474,
        ["points"] = 10,
        ["previousID"] = 472,
    },
    [474] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 23,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 8,
                },
                ["id"] = 1977,
                ["name"] = {
                    ["args"] = {
                        [1] = 30,
                    },
                    ["key"] = "AC_REPS",
                },
                ["quantity"] = 30,
                ["type"] = 17,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 30,
            },
            ["key"] = "AD_REPS",
        },
        ["icon"] = "achievement_reputation_07",
        ["id"] = 474,
        ["name"] = {
            ["concat"] = {
                [1] = {
                    ["literal"] = "30",
                },
                [2] = "AN_REPS_X",
                [3] = {
                    ["literal"] = "",
                },
            },
        },
        ["points"] = 10,
        ["previousID"] = 473,
        ["rewardText"] = "TITLE_BUILTIN_THE_EXALTED_LABEL",
    },
    [475] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 23,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 76,
                    [2] = 8,
                },
                ["id"] = 1978,
                ["name"] = "AC_HORDE_REPS_1",
                ["type"] = 16,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 530,
                    [2] = 8,
                },
                ["id"] = 1979,
                ["name"] = "AC_HORDE_REPS_2",
                ["type"] = 16,
            },
            [3] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 68,
                    [2] = 8,
                },
                ["id"] = 1980,
                ["name"] = "AC_HORDE_REPS_3",
                ["type"] = 16,
            },
            [4] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 81,
                    [2] = 8,
                },
                ["id"] = 1981,
                ["name"] = "AC_HORDE_REPS_4",
                ["type"] = 16,
            },
            [5] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 911,
                    [2] = 8,
                },
                ["id"] = 1982,
                ["name"] = "AC_HORDE_REPS_5",
                ["type"] = 16,
            },
        },
        ["description"] = "AD_HORDE_REPS",
        ["faction"] = true,
        ["icon"] = "achievement_pvp_o_h",
        ["id"] = 475,
        ["name"] = "AN_HORDE_REPS",
        ["points"] = 10,
    },
    [476] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 23,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 72,
                    [2] = 8,
                },
                ["id"] = 1983,
                ["name"] = "AC_ALLIANCE_REPS_1",
                ["type"] = 16,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 69,
                    [2] = 8,
                },
                ["id"] = 1984,
                ["name"] = "AC_ALLIANCE_REPS_2",
                ["type"] = 16,
            },
            [3] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 54,
                    [2] = 8,
                },
                ["id"] = 1985,
                ["name"] = "AC_ALLIANCE_REPS_3",
                ["type"] = 16,
            },
            [4] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 47,
                    [2] = 8,
                },
                ["id"] = 1986,
                ["name"] = "AC_ALLIANCE_REPS_4",
                ["type"] = 16,
            },
            [5] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 930,
                    [2] = 8,
                },
                ["id"] = 1987,
                ["name"] = "AC_ALLIANCE_REPS_5",
                ["type"] = 16,
            },
        },
        ["description"] = "AD_ALLIANCE_REPS",
        ["faction"] = false,
        ["icon"] = "achievement_pvp_o_a",
        ["id"] = 476,
        ["name"] = "AN_ALLIANCE_REPS",
        ["points"] = 10,
    },
    [477] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 24,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 749,
                    [2] = 8,
                },
                ["id"] = 1988,
                ["name"] = "",
                ["type"] = 16,
            },
        },
        ["description"] = "AD_HYDRAXIANS",
        ["icon"] = "-spell_frost_summonwaterelemental_2",
        ["id"] = 477,
        ["name"] = "AN_HYDRAXIANS",
        ["points"] = 10,
    },
    [478] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 24,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 270,
                    [2] = 8,
                },
                ["id"] = 1989,
                ["name"] = "",
                ["type"] = 16,
            },
        },
        ["description"] = "AD_ZANDALAR_TRIBE",
        ["icon"] = "-inv_bijou_green",
        ["id"] = 478,
        ["name"] = "AN_ZANDALAR_TRIBE",
        ["points"] = 10,
    },
    [479] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 24,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 910,
                    [2] = 8,
                },
                ["id"] = 1990,
                ["name"] = "",
                ["type"] = 16,
            },
        },
        ["description"] = "AD_BROOD_OF_NOZDORMU",
        ["icon"] = "-Inv_Misc_Head_Dragon_Bronze",
        ["id"] = 479,
        ["name"] = "AN_BROOD_OF_NOZDORMU",
        ["points"] = 10,
    },
    [480] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 24,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 529,
                    [2] = 8,
                },
                ["id"] = 1991,
                ["name"] = "",
                ["type"] = 16,
            },
        },
        ["description"] = "AD_ARGENT_DAWN",
        ["icon"] = "-inv_jewelry_talisman_07",
        ["id"] = 480,
        ["name"] = "AN_ARGENT_DAWN",
        ["points"] = 10,
    },
    [481] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 24,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 576,
                    [2] = 8,
                },
                ["id"] = 1992,
                ["name"] = "",
                ["type"] = 16,
            },
        },
        ["description"] = "AD_TIMBERMAW_HOLD",
        ["icon"] = "achievement_reputation_timbermaw",
        ["id"] = 481,
        ["name"] = "AN_TIMBERMAW_HOLD",
        ["points"] = 10,
    },
    [482] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 24,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 909,
                    [2] = 8,
                },
                ["id"] = 1993,
                ["name"] = "",
                ["type"] = 16,
            },
        },
        ["description"] = "AD_DARKMOON_FAIRE",
        ["icon"] = "-Inv_Misc_MissileLarge_Red",
        ["id"] = 482,
        ["name"] = "AN_DARKMOON_FAIRE",
        ["points"] = 10,
    },
    [483] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 24,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 59,
                    [2] = 8,
                },
                ["id"] = 1994,
                ["name"] = "",
                ["type"] = 16,
            },
        },
        ["description"] = "AD_THORIUM",
        ["icon"] = "-inv_enchant_dustsoul",
        ["id"] = 483,
        ["name"] = "AN_THORIUM",
        ["points"] = 10,
    },
    [484] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 24,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 809,
                    [2] = 8,
                },
                ["id"] = 1995,
                ["name"] = "",
                ["type"] = 16,
            },
        },
        ["description"] = "AD_SHENDRALAR",
        ["icon"] = "-inv_misc_book_11",
        ["id"] = 484,
        ["name"] = "AN_SHENDRALAR",
        ["points"] = 10,
    },
    [500] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 35,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 17182,
                },
                ["id"] = 2028,
                ["name"] = "",
                ["type"] = 5,
            },
        },
        ["description"] = "AD_SULFURAS",
        ["icon"] = "-Inv_Hammer_Unique_Sulfuras",
        ["id"] = 500,
        ["name"] = "AN_SULFURAS",
        ["points"] = 0,
    },
    [501] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 35,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 19019,
                },
                ["id"] = 2029,
                ["name"] = "",
                ["type"] = 5,
            },
        },
        ["description"] = "AD_THUNDER_FURY",
        ["icon"] = "-Inv_Sword_39",
        ["id"] = 501,
        ["name"] = "AN_THUNDER_FURY",
        ["points"] = 0,
    },
    [502] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 35,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 21176,
                },
                ["id"] = 2030,
                ["name"] = "",
                ["type"] = 5,
            },
        },
        ["description"] = "AD_BLACK_SCARAB",
        ["icon"] = "silithus",
        ["id"] = 502,
        ["name"] = "AN_BLACK_SCARAB",
        ["points"] = 0,
    },
    [503] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 35,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 21321,
                },
                ["id"] = 2031,
                ["name"] = "",
                ["type"] = 5,
            },
        },
        ["description"] = "AD_RED_SCARAB",
        ["icon"] = "-Inv_Misc_QirajiCrystal_02",
        ["id"] = 503,
        ["name"] = "AN_RED_SCARAB",
        ["points"] = 0,
    },
    [504] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 35,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {},
                ["id"] = 2032,
                ["name"] = "",
                ["type"] = 9,
            },
        },
        ["description"] = "AD_ATIESH",
        ["icon"] = "-Inv_Staff_Medivh",
        ["id"] = 504,
        ["name"] = "AN_ATIESH",
        ["points"] = 0,
    },
    [505] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 35,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 19902,
                },
                ["id"] = 2033,
                ["name"] = "",
                ["type"] = 5,
            },
        },
        ["description"] = "AD_TIGER_MOUNT",
        ["icon"] = "-ability_mount_jungletiger",
        ["id"] = 505,
        ["name"] = "AN_TIGER_MOUNT",
        ["points"] = 0,
    },
    [506] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 35,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 19872,
                },
                ["id"] = 2034,
                ["name"] = "",
                ["type"] = 5,
            },
        },
        ["description"] = "AD_RAPTOR_MOUNT",
        ["icon"] = "-ability_mount_raptor",
        ["id"] = 506,
        ["name"] = "AN_RAPTOR_MOUNT",
        ["points"] = 0,
    },
    [507] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 35,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 13335,
                },
                ["id"] = 2035,
                ["name"] = "",
                ["type"] = 5,
            },
        },
        ["description"] = "AD_BARON_MOUNT",
        ["icon"] = "-ability_mount_undeadhorse",
        ["id"] = 507,
        ["name"] = "AN_BARON_MOUNT",
        ["points"] = 0,
    },
    [508] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 35,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 13086,
                },
                ["id"] = 2036,
                ["name"] = "",
                ["type"] = 5,
            },
        },
        ["description"] = "AD_SABER_MOUNT",
        ["icon"] = "-ability_mount_pinktiger",
        ["id"] = 508,
        ["name"] = "AN_SABER_MOUNT",
        ["points"] = 0,
    },
    [516] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 21,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = -1,
                },
                ["id"] = 1720,
                ["name"] = {
                    ["args"] = {
                        [1] = 25,
                    },
                    ["key"] = "AC_FISHING_COUNT",
                },
                ["quantity"] = 25,
                ["type"] = 46,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 25,
            },
            ["key"] = "AD_FISHING_COUNT",
        },
        ["icon"] = "inv_misc_fish_50",
        ["id"] = 516,
        ["name"] = {
            ["args"] = {
                [1] = 25,
            },
            ["key"] = "AN_FISHING_COUNT",
        },
        ["nextID"] = 517,
        ["points"] = 10,
    },
    [517] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 21,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = -1,
                },
                ["id"] = 1721,
                ["name"] = {
                    ["args"] = {
                        [1] = 50,
                    },
                    ["key"] = "AC_FISHING_COUNT",
                },
                ["quantity"] = 50,
                ["type"] = 46,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 50,
            },
            ["key"] = "AD_FISHING_COUNT",
        },
        ["icon"] = "inv_misc_fish_50",
        ["id"] = 517,
        ["name"] = {
            ["args"] = {
                [1] = 50,
            },
            ["key"] = "AN_FISHING_COUNT",
        },
        ["nextID"] = 518,
        ["points"] = 10,
        ["previousID"] = 516,
    },
    [518] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 21,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = -1,
                },
                ["id"] = 1722,
                ["name"] = {
                    ["args"] = {
                        [1] = 100,
                    },
                    ["key"] = "AC_FISHING_COUNT",
                },
                ["quantity"] = 100,
                ["type"] = 46,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 100,
            },
            ["key"] = "AD_FISHING_COUNT",
        },
        ["icon"] = "inv_misc_fish_50",
        ["id"] = 518,
        ["name"] = {
            ["args"] = {
                [1] = 100,
            },
            ["key"] = "AN_FISHING_COUNT",
        },
        ["nextID"] = 519,
        ["points"] = 10,
        ["previousID"] = 517,
    },
    [519] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 21,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = -1,
                },
                ["id"] = 1723,
                ["name"] = {
                    ["args"] = {
                        [1] = 250,
                    },
                    ["key"] = "AC_FISHING_COUNT",
                },
                ["quantity"] = 250,
                ["type"] = 46,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 250,
            },
            ["key"] = "AD_FISHING_COUNT",
        },
        ["icon"] = "inv_misc_fish_50",
        ["id"] = 519,
        ["name"] = {
            ["args"] = {
                [1] = 250,
            },
            ["key"] = "AN_FISHING_COUNT",
        },
        ["nextID"] = 520,
        ["points"] = 10,
        ["previousID"] = 518,
    },
    [520] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 21,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = -1,
                },
                ["id"] = 1724,
                ["name"] = {
                    ["args"] = {
                        [1] = 500,
                    },
                    ["key"] = "AC_FISHING_COUNT",
                },
                ["quantity"] = 500,
                ["type"] = 46,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 500,
            },
            ["key"] = "AD_FISHING_COUNT",
        },
        ["icon"] = "inv_misc_fish_50",
        ["id"] = 520,
        ["name"] = {
            ["args"] = {
                [1] = 500,
            },
            ["key"] = "AN_FISHING_COUNT",
        },
        ["nextID"] = 521,
        ["points"] = 10,
        ["previousID"] = 519,
    },
    [521] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 21,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = -1,
                },
                ["id"] = 1725,
                ["name"] = {
                    ["numberFormat"] = {
                        ["args"] = {
                            [1] = 1000,
                        },
                        ["key"] = "AC_FISHING_COUNT",
                    },
                },
                ["quantity"] = 1000,
                ["type"] = 46,
            },
        },
        ["description"] = {
            ["numberFormat"] = {
                ["args"] = {
                    [1] = 1000,
                },
                ["key"] = "AD_FISHING_COUNT",
            },
        },
        ["icon"] = "inv_misc_fish_50",
        ["id"] = 521,
        ["name"] = {
            ["numberFormat"] = {
                ["args"] = {
                    [1] = 1000,
                },
                ["key"] = "AN_FISHING_COUNT",
            },
        },
        ["points"] = 10,
        ["previousID"] = 520,
    },
    [523] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 35,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 4621,
                },
                ["id"] = 2037,
                ["name"] = "",
                ["type"] = 3,
            },
        },
        ["description"] = "AD_PIRATES_HAT",
        ["icon"] = "-inv_helmet_66",
        ["id"] = 523,
        ["name"] = "AN_PIRATES_HAT",
        ["points"] = 0,
        ["rewardText"] = "TITLE_BUILTIN_BLOODSAIL_ADMIRAL_LABEL",
    },
    [524] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 35,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 7631,
                },
                ["id"] = 2038,
                ["name"] = "",
                ["type"] = 3,
            },
        },
        ["description"] = "AD_WARLOCK_MOUNT",
        ["icon"] = "-ability_mount_dreadsteed",
        ["id"] = 524,
        ["name"] = "AN_WARLOCK_MOUNT",
        ["points"] = 0,
    },
    [525] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 35,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 7647,
                },
                ["id"] = 2039,
                ["name"] = "",
                ["type"] = 3,
            },
        },
        ["description"] = "AD_PALADIN_MOUNT",
        ["icon"] = "-ability_mount_charger",
        ["id"] = 525,
        ["name"] = "AN_PALADIN_MOUNT",
        ["points"] = 0,
    },
    [531] = {
        ["selectors"] = {
            ["A:DRUID"] = 2,
            ["A:HUNTER"] = 2,
            ["A:MAGE"] = 2,
            ["A:PALADIN"] = 2,
            ["A:PRIEST"] = 2,
            ["A:ROGUE"] = 2,
            ["A:SHAMAN"] = 2,
            ["A:WARLOCK"] = 2,
            ["A:WARRIOR"] = 2,
            ["H:DRUID"] = 1,
            ["H:HUNTER"] = 1,
            ["H:MAGE"] = 1,
            ["H:PALADIN"] = 1,
            ["H:PRIEST"] = 1,
            ["H:ROGUE"] = 1,
            ["H:SHAMAN"] = 1,
            ["H:WARLOCK"] = 1,
            ["H:WARRIOR"] = 1,
        },
        ["variants"] = {
            [1] = {
                ["anyCompletable"] = false,
                ["categoryID"] = 26,
                ["criteria"] = {
                    [1] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 532,
                        },
                        ["id"] = 1809,
                        ["name"] = "AN_HALLOWSEND_HORDE_QUEST1",
                        ["type"] = 20,
                    },
                    [2] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 533,
                        },
                        ["id"] = 1814,
                        ["name"] = "AN_HALLOWSEND_HORDE_QUEST2",
                        ["type"] = 20,
                    },
                    [3] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 534,
                        },
                        ["id"] = 1816,
                        ["name"] = "AN_HALLOWSEND_TREATS",
                        ["type"] = 20,
                    },
                    [4] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 535,
                        },
                        ["id"] = 1818,
                        ["name"] = "AN_PUMPKIN",
                        ["type"] = 20,
                    },
                    [5] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 536,
                        },
                        ["id"] = 1820,
                        ["name"] = "AN_HALLOWSEND_INVOCATION_BUFF",
                        ["type"] = 20,
                    },
                    [6] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 539,
                        },
                        ["id"] = 1869,
                        ["name"] = "AN_HALLOWSEND_TRANSFORM",
                        ["type"] = 20,
                    },
                },
                ["description"] = "AD_HALLOWSEND",
                ["icon"] = "achievement_halloween_witch_01",
                ["id"] = 531,
                ["name"] = "AN_HALLOWSEND",
                ["points"] = 10,
                ["rewardText"] = "TITLE_BUILTIN_THE_HALLOWED_LABEL",
            },
            [2] = {
                ["anyCompletable"] = false,
                ["categoryID"] = 26,
                ["criteria"] = {
                    [1] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 532,
                        },
                        ["id"] = 1809,
                        ["name"] = "AN_HALLOWSEND_ALLIANCE_QUEST1",
                        ["type"] = 20,
                    },
                    [2] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 533,
                        },
                        ["id"] = 1814,
                        ["name"] = "AN_HALLOWSEND_ALLIANCE_QUEST2",
                        ["type"] = 20,
                    },
                    [3] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 534,
                        },
                        ["id"] = 1816,
                        ["name"] = "AN_HALLOWSEND_TREATS",
                        ["type"] = 20,
                    },
                    [4] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 535,
                        },
                        ["id"] = 1818,
                        ["name"] = "AN_PUMPKIN",
                        ["type"] = 20,
                    },
                    [5] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 536,
                        },
                        ["id"] = 1820,
                        ["name"] = "AN_HALLOWSEND_INVOCATION_BUFF",
                        ["type"] = 20,
                    },
                    [6] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 539,
                        },
                        ["id"] = 1869,
                        ["name"] = "AN_HALLOWSEND_TRANSFORM",
                        ["type"] = 20,
                    },
                },
                ["description"] = "AD_HALLOWSEND",
                ["icon"] = "achievement_halloween_witch_01",
                ["id"] = 531,
                ["name"] = "AN_HALLOWSEND",
                ["points"] = 10,
                ["rewardText"] = "TITLE_BUILTIN_THE_HALLOWED_LABEL",
            },
        },
    },
    [532] = {
        ["selectors"] = {
            ["A:DRUID"] = 2,
            ["A:HUNTER"] = 2,
            ["A:MAGE"] = 2,
            ["A:PALADIN"] = 2,
            ["A:PRIEST"] = 2,
            ["A:ROGUE"] = 2,
            ["A:SHAMAN"] = 2,
            ["A:WARLOCK"] = 2,
            ["A:WARRIOR"] = 2,
            ["H:DRUID"] = 1,
            ["H:HUNTER"] = 1,
            ["H:MAGE"] = 1,
            ["H:PALADIN"] = 1,
            ["H:PRIEST"] = 1,
            ["H:ROGUE"] = 1,
            ["H:SHAMAN"] = 1,
            ["H:WARLOCK"] = 1,
            ["H:WARRIOR"] = 1,
        },
        ["variants"] = {
            [1] = {
                ["anyCompletable"] = false,
                ["categoryID"] = 33,
                ["criteria"] = {
                    [1] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 8409,
                        },
                        ["id"] = 1807,
                        ["name"] = "AC_HALLOWSEND_HORDE_QUEST1_CRITERIA1",
                        ["type"] = 3,
                    },
                    [2] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 1657,
                        },
                        ["id"] = 1808,
                        ["name"] = "AC_HALLOWSEND_HORDE_QUEST1_CRITERIA2",
                        ["type"] = 3,
                    },
                },
                ["description"] = "AD_HALLOWSEND_HORDE_QUEST1",
                ["icon"] = "achievement_halloween_rottenegg_01",
                ["id"] = 532,
                ["name"] = "AN_HALLOWSEND_HORDE_QUEST1",
                ["points"] = 10,
            },
            [2] = {
                ["anyCompletable"] = false,
                ["categoryID"] = 33,
                ["criteria"] = {
                    [1] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 1658,
                        },
                        ["id"] = 1807,
                        ["name"] = "AC_HALLOWSEND_ALLIANCE_QUEST1_CRITERIA1",
                        ["type"] = 3,
                    },
                    [2] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 8373,
                        },
                        ["id"] = 1808,
                        ["name"] = "AC_HALLOWSEND_ALLIANCE_QUEST1_CRITERIA2",
                        ["type"] = 3,
                    },
                },
                ["description"] = "AD_HALLOWSEND_ALLIANCE_QUEST1",
                ["icon"] = "achievement_halloween_rottenegg_01",
                ["id"] = 532,
                ["name"] = "AN_HALLOWSEND_ALLIANCE_QUEST1",
                ["points"] = 10,
            },
        },
    },
    [533] = {
        ["selectors"] = {
            ["A:DRUID"] = 2,
            ["A:HUNTER"] = 2,
            ["A:MAGE"] = 2,
            ["A:PALADIN"] = 2,
            ["A:PRIEST"] = 2,
            ["A:ROGUE"] = 2,
            ["A:SHAMAN"] = 2,
            ["A:WARLOCK"] = 2,
            ["A:WARRIOR"] = 2,
            ["H:DRUID"] = 1,
            ["H:HUNTER"] = 1,
            ["H:MAGE"] = 1,
            ["H:PALADIN"] = 1,
            ["H:PRIEST"] = 1,
            ["H:ROGUE"] = 1,
            ["H:SHAMAN"] = 1,
            ["H:WARLOCK"] = 1,
            ["H:WARRIOR"] = 1,
        },
        ["variants"] = {
            [1] = {
                ["anyCompletable"] = false,
                ["categoryID"] = 33,
                ["criteria"] = {
                    [1] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 20493,
                        },
                        ["id"] = 1810,
                        ["name"] = "AC_HALLOWSEND_HORDE_QUEST2_CRITERIA1",
                        ["type"] = 5,
                    },
                    [2] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 20495,
                        },
                        ["id"] = 1811,
                        ["name"] = "AC_HALLOWSEND_HORDE_QUEST2_CRITERIA2",
                        ["type"] = 5,
                    },
                    [3] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 20491,
                        },
                        ["id"] = 1812,
                        ["name"] = "AC_HALLOWSEND_HORDE_QUEST2_CRITERIA3",
                        ["type"] = 5,
                    },
                    [4] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 20497,
                        },
                        ["id"] = 1813,
                        ["name"] = "AC_HALLOWSEND_HORDE_QUEST2_CRITERIA4",
                        ["type"] = 5,
                    },
                },
                ["description"] = "AD_HALLOWSEND_HORDE_QUEST2",
                ["icon"] = "-inv_misc_food_26",
                ["id"] = 533,
                ["name"] = "AN_HALLOWSEND_HORDE_QUEST2",
                ["points"] = 10,
            },
            [2] = {
                ["anyCompletable"] = false,
                ["categoryID"] = 33,
                ["criteria"] = {
                    [1] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 20492,
                        },
                        ["id"] = 1810,
                        ["name"] = "AC_HALLOWSEND_ALLIANCE_QUEST2_CRITERIA1",
                        ["type"] = 5,
                    },
                    [2] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 20494,
                        },
                        ["id"] = 1811,
                        ["name"] = "AC_HALLOWSEND_ALLIANCE_QUEST2_CRITERIA2",
                        ["type"] = 5,
                    },
                    [3] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 20490,
                        },
                        ["id"] = 1812,
                        ["name"] = "AC_HALLOWSEND_ALLIANCE_QUEST2_CRITERIA3",
                        ["type"] = 5,
                    },
                    [4] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 20496,
                        },
                        ["id"] = 1813,
                        ["name"] = "AC_HALLOWSEND_ALLIANCE_QUEST2_CRITERIA4",
                        ["type"] = 5,
                    },
                },
                ["description"] = "AD_HALLOWSEND_ALLIANCE_QUEST2",
                ["icon"] = "-inv_misc_food_26",
                ["id"] = 533,
                ["name"] = "AN_HALLOWSEND_ALLIANCE_QUEST2",
                ["points"] = 10,
            },
        },
    },
    [534] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 33,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 20393,
                },
                ["id"] = 1815,
                ["name"] = "",
                ["type"] = 5,
            },
        },
        ["description"] = "AD_HALLOWSEND_TREATS",
        ["icon"] = "-inv_misc_food_30",
        ["id"] = 534,
        ["name"] = "AN_HALLOWSEND_TREATS",
        ["points"] = 10,
    },
    [535] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 33,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 20400,
                },
                ["id"] = 1817,
                ["name"] = "",
                ["type"] = 5,
            },
        },
        ["description"] = "AD_PUMPKIN",
        ["icon"] = "-inv_misc_food_59",
        ["id"] = 535,
        ["name"] = "AN_PUMPKIN",
        ["points"] = 10,
    },
    [536] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 33,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 24705,
                },
                ["id"] = 1819,
                ["name"] = "",
                ["type"] = 47,
            },
        },
        ["description"] = "AD_HALLOWSEND_INVOCATION_BUFF",
        ["icon"] = "-inv_waepon_bow_zulgrub_d_02",
        ["id"] = 536,
        ["name"] = "AN_HALLOWSEND_INVOCATION_BUFF",
        ["points"] = 10,
    },
    [537] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 33,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 20570,
                        },
                        ["id"] = 1821,
                        ["name"] = "",
                        ["type"] = 5,
                    },
                    [2] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 20561,
                        },
                        ["id"] = 1822,
                        ["name"] = "",
                        ["type"] = 5,
                    },
                    [3] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 20391,
                        },
                        ["id"] = 1823,
                        ["name"] = "",
                        ["type"] = 5,
                    },
                    [4] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 20566,
                        },
                        ["id"] = 1824,
                        ["name"] = "",
                        ["type"] = 5,
                    },
                    [5] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 20564,
                        },
                        ["id"] = 1825,
                        ["name"] = "",
                        ["type"] = 5,
                    },
                    [6] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 20572,
                        },
                        ["id"] = 1826,
                        ["name"] = "",
                        ["type"] = 5,
                    },
                    [7] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 20568,
                        },
                        ["id"] = 1827,
                        ["name"] = "",
                        ["type"] = 5,
                    },
                    [8] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 20573,
                        },
                        ["id"] = 1828,
                        ["name"] = "",
                        ["type"] = 5,
                    },
                    [9] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 34000,
                        },
                        ["id"] = 1829,
                        ["name"] = "",
                        ["type"] = 5,
                    },
                    [10] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 34002,
                        },
                        ["id"] = 1830,
                        ["name"] = "",
                        ["type"] = 5,
                    },
                    [11] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 20392,
                        },
                        ["id"] = 1831,
                        ["name"] = "",
                        ["type"] = 5,
                    },
                    [12] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 20569,
                        },
                        ["id"] = 1832,
                        ["name"] = "",
                        ["type"] = 5,
                    },
                    [13] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 20571,
                        },
                        ["id"] = 1833,
                        ["name"] = "",
                        ["type"] = 5,
                    },
                    [14] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 20574,
                        },
                        ["id"] = 1834,
                        ["name"] = "",
                        ["type"] = 5,
                    },
                    [15] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 20565,
                        },
                        ["id"] = 1835,
                        ["name"] = "",
                        ["type"] = 5,
                    },
                    [16] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 20563,
                        },
                        ["id"] = 1836,
                        ["name"] = "",
                        ["type"] = 5,
                    },
                    [17] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 20567,
                        },
                        ["id"] = 1837,
                        ["name"] = "",
                        ["type"] = 5,
                    },
                    [18] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 20562,
                        },
                        ["id"] = 1838,
                        ["name"] = "",
                        ["type"] = 5,
                    },
                    [19] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 34001,
                        },
                        ["id"] = 1839,
                        ["name"] = "",
                        ["type"] = 5,
                    },
                    [20] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 34003,
                        },
                        ["id"] = 1840,
                        ["name"] = "",
                        ["type"] = 5,
                    },
                },
                ["id"] = 1841,
                ["name"] = "",
                ["type"] = 39,
            },
        },
        ["description"] = "AD_HALLOWSEND_MASK",
        ["icon"] = "-inv_mask_06",
        ["id"] = 537,
        ["name"] = "AN_HALLOWSEND_MASK",
        ["nextID"] = 538,
        ["points"] = 10,
    },
    [538] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 33,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 20570,
                },
                ["id"] = 1842,
                ["name"] = {
                    ["itemID"] = 20570,
                },
                ["type"] = 5,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 20561,
                },
                ["id"] = 1843,
                ["name"] = {
                    ["itemID"] = 20561,
                },
                ["type"] = 5,
            },
            [3] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 20391,
                },
                ["id"] = 1844,
                ["name"] = {
                    ["itemID"] = 20391,
                },
                ["type"] = 5,
            },
            [4] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 20566,
                },
                ["id"] = 1845,
                ["name"] = {
                    ["itemID"] = 20566,
                },
                ["type"] = 5,
            },
            [5] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 20564,
                },
                ["id"] = 1846,
                ["name"] = {
                    ["itemID"] = 20564,
                },
                ["type"] = 5,
            },
            [6] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 20572,
                },
                ["id"] = 1847,
                ["name"] = {
                    ["itemID"] = 20572,
                },
                ["type"] = 5,
            },
            [7] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 20568,
                },
                ["id"] = 1848,
                ["name"] = {
                    ["itemID"] = 20568,
                },
                ["type"] = 5,
            },
            [8] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 20573,
                },
                ["id"] = 1849,
                ["name"] = {
                    ["itemID"] = 20573,
                },
                ["type"] = 5,
            },
            [9] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 34000,
                },
                ["id"] = 1850,
                ["name"] = {
                    ["itemID"] = 34000,
                },
                ["type"] = 5,
            },
            [10] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 34002,
                },
                ["id"] = 1851,
                ["name"] = {
                    ["itemID"] = 34002,
                },
                ["type"] = 5,
            },
            [11] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 20392,
                },
                ["id"] = 1852,
                ["name"] = {
                    ["itemID"] = 20392,
                },
                ["type"] = 5,
            },
            [12] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 20569,
                },
                ["id"] = 1853,
                ["name"] = {
                    ["itemID"] = 20569,
                },
                ["type"] = 5,
            },
            [13] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 20571,
                },
                ["id"] = 1854,
                ["name"] = {
                    ["itemID"] = 20571,
                },
                ["type"] = 5,
            },
            [14] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 20574,
                },
                ["id"] = 1855,
                ["name"] = {
                    ["itemID"] = 20574,
                },
                ["type"] = 5,
            },
            [15] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 20565,
                },
                ["id"] = 1856,
                ["name"] = {
                    ["itemID"] = 20565,
                },
                ["type"] = 5,
            },
            [16] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 20563,
                },
                ["id"] = 1857,
                ["name"] = {
                    ["itemID"] = 20563,
                },
                ["type"] = 5,
            },
            [17] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 20567,
                },
                ["id"] = 1858,
                ["name"] = {
                    ["itemID"] = 20567,
                },
                ["type"] = 5,
            },
            [18] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 20562,
                },
                ["id"] = 1859,
                ["name"] = {
                    ["itemID"] = 20562,
                },
                ["type"] = 5,
            },
            [19] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 34001,
                },
                ["id"] = 1860,
                ["name"] = {
                    ["itemID"] = 34001,
                },
                ["type"] = 5,
            },
            [20] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 34003,
                },
                ["id"] = 1861,
                ["name"] = {
                    ["itemID"] = 34003,
                },
                ["type"] = 5,
            },
        },
        ["description"] = "AD_HALLOWSEND_MASKS",
        ["icon"] = "-inv_mask_04",
        ["id"] = 538,
        ["name"] = "AN_HALLOWSEND_MASKS",
        ["points"] = 10,
        ["previousID"] = 537,
    },
    [539] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 33,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 24735,
                },
                ["id"] = 1862,
                ["name"] = "AC_HALLOWSEND_GHOST",
                ["type"] = 47,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 24712,
                },
                ["id"] = 1863,
                ["name"] = "AC_HALLOWSEND_GNOME",
                ["type"] = 47,
            },
            [3] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 24740,
                },
                ["id"] = 1864,
                ["name"] = "AC_HALLOWSEND_WISP",
                ["type"] = 47,
            },
            [4] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 24710,
                },
                ["id"] = 1865,
                ["name"] = "AC_HALLOWSEND_NINJA",
                ["type"] = 47,
            },
            [5] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 24723,
                },
                ["id"] = 1866,
                ["name"] = "AC_HALLOWSEND_SKELETON",
                ["type"] = 47,
            },
            [6] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 24708,
                },
                ["id"] = 1867,
                ["name"] = "AC_HALLOWSEND_PIRATE",
                ["type"] = 47,
            },
            [7] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 24732,
                },
                ["id"] = 1868,
                ["name"] = "AC_HALLOWSEND_BAT",
                ["type"] = 47,
            },
        },
        ["description"] = "AD_HALLOWSEND_TRANSFORM",
        ["icon"] = "achievement_halloween_ghost_01",
        ["id"] = 539,
        ["name"] = "AN_HALLOWSEND_TRANSFORM",
        ["points"] = 10,
    },
    [540] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 17,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 15989,
                },
                ["id"] = 1463,
                ["name"] = "",
                ["type"] = 1,
            },
        },
        ["description"] = "AD_NAXXRAMAS_SAPPHIRON",
        ["icon"] = "-inv_misc_head_dragon_blue",
        ["id"] = 540,
        ["name"] = "AN_NAXXRAMAS_SAPPHIRON",
        ["points"] = 10,
    },
    [541] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 26,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 542,
                },
                ["id"] = 1871,
                ["name"] = "AN_WINTERVEIL_METZEN",
                ["type"] = 20,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 543,
                },
                ["id"] = 1873,
                ["name"] = "AN_WINTERVEIL_SMOKEYWOOD",
                ["type"] = 20,
            },
            [3] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 546,
                },
                ["id"] = 1875,
                ["name"] = "AN_WINTERVEIL_SNOWBALL_ALLIANCE",
                ["type"] = 20,
            },
            [4] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 544,
                },
                ["id"] = 1878,
                ["name"] = "AN_WINTERVEIL_GOURMET",
                ["type"] = 20,
            },
            [5] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 545,
                },
                ["id"] = 1882,
                ["name"] = "AN_WINTERVEIL_PRESENTS",
                ["type"] = 20,
            },
            [6] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 566,
                },
                ["id"] = 1884,
                ["name"] = "AN_WINTERVEIL_PVP",
                ["type"] = 20,
            },
        },
        ["description"] = "AD_WINTERVEIL",
        ["icon"] = "achievement_worldevent_merrymaker",
        ["id"] = 541,
        ["name"] = "AN_WINTERVEIL",
        ["points"] = 10,
        ["rewardText"] = "TITLE_BUILTIN_MERRYMAKER_LABEL",
    },
    [542] = {
        ["selectors"] = {
            ["A:DRUID"] = 2,
            ["A:HUNTER"] = 2,
            ["A:MAGE"] = 2,
            ["A:PALADIN"] = 2,
            ["A:PRIEST"] = 2,
            ["A:ROGUE"] = 2,
            ["A:SHAMAN"] = 2,
            ["A:WARLOCK"] = 2,
            ["A:WARRIOR"] = 2,
            ["H:DRUID"] = 1,
            ["H:HUNTER"] = 1,
            ["H:MAGE"] = 1,
            ["H:PALADIN"] = 1,
            ["H:PRIEST"] = 1,
            ["H:ROGUE"] = 1,
            ["H:SHAMAN"] = 1,
            ["H:WARLOCK"] = 1,
            ["H:WARRIOR"] = 1,
        },
        ["variants"] = {
            [1] = {
                ["anyCompletable"] = false,
                ["categoryID"] = 34,
                ["criteria"] = {
                    [1] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 8746,
                        },
                        ["id"] = 1870,
                        ["name"] = "",
                        ["type"] = 3,
                    },
                },
                ["description"] = "AD_WINTERVEIL_METZEN",
                ["icon"] = "achievement_worldevent_reindeer",
                ["id"] = 542,
                ["name"] = "AN_WINTERVEIL_METZEN",
                ["points"] = 10,
            },
            [2] = {
                ["anyCompletable"] = false,
                ["categoryID"] = 34,
                ["criteria"] = {
                    [1] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 8762,
                        },
                        ["id"] = 1870,
                        ["name"] = "",
                        ["type"] = 3,
                    },
                },
                ["description"] = "AD_WINTERVEIL_METZEN",
                ["icon"] = "achievement_worldevent_reindeer",
                ["id"] = 542,
                ["name"] = "AN_WINTERVEIL_METZEN",
                ["points"] = 10,
            },
        },
    },
    [543] = {
        ["selectors"] = {
            ["A:DRUID"] = 2,
            ["A:HUNTER"] = 2,
            ["A:MAGE"] = 2,
            ["A:PALADIN"] = 2,
            ["A:PRIEST"] = 2,
            ["A:ROGUE"] = 2,
            ["A:SHAMAN"] = 2,
            ["A:WARLOCK"] = 2,
            ["A:WARRIOR"] = 2,
            ["H:DRUID"] = 1,
            ["H:HUNTER"] = 1,
            ["H:MAGE"] = 1,
            ["H:PALADIN"] = 1,
            ["H:PRIEST"] = 1,
            ["H:ROGUE"] = 1,
            ["H:SHAMAN"] = 1,
            ["H:WARLOCK"] = 1,
            ["H:WARRIOR"] = 1,
        },
        ["variants"] = {
            [1] = {
                ["anyCompletable"] = false,
                ["categoryID"] = 34,
                ["criteria"] = {
                    [1] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 6984,
                        },
                        ["id"] = 1872,
                        ["name"] = "",
                        ["type"] = 3,
                    },
                },
                ["description"] = "AD_WINTERVEIL_SMOKEYWOOD",
                ["icon"] = "-inv_helmet_68",
                ["id"] = 543,
                ["name"] = "AN_WINTERVEIL_SMOKEYWOOD",
                ["points"] = 10,
            },
            [2] = {
                ["anyCompletable"] = false,
                ["categoryID"] = 34,
                ["criteria"] = {
                    [1] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 7045,
                        },
                        ["id"] = 1872,
                        ["name"] = "",
                        ["type"] = 3,
                    },
                },
                ["description"] = "AD_WINTERVEIL_SMOKEYWOOD",
                ["icon"] = "-inv_helmet_68",
                ["id"] = 543,
                ["name"] = "AN_WINTERVEIL_SMOKEYWOOD",
                ["points"] = 10,
            },
        },
    },
    [544] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 34,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 17197,
                },
                ["id"] = 1876,
                ["name"] = "AC_WINTERVEIL_GOURMET_CRITERIA1",
                ["type"] = 15,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 17198,
                },
                ["id"] = 1877,
                ["name"] = "AC_WINTERVEIL_GOURMET_CRITERIA2",
                ["type"] = 15,
            },
        },
        ["description"] = "AD_WINTERVEIL_GOURMET",
        ["icon"] = "-inv_misc_food_62",
        ["id"] = 544,
        ["name"] = "AN_WINTERVEIL_GOURMET",
        ["points"] = 10,
    },
    [545] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 34,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 8767,
                        },
                        ["id"] = 1879,
                        ["name"] = "",
                        ["type"] = 3,
                    },
                    [2] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 8768,
                        },
                        ["id"] = 1880,
                        ["name"] = "",
                        ["type"] = 3,
                    },
                },
                ["id"] = 1881,
                ["name"] = "",
                ["type"] = 39,
            },
        },
        ["description"] = "AD_WINTERVEIL_PRESENTS",
        ["icon"] = "-inv_holiday_christmas_present_01",
        ["id"] = 545,
        ["name"] = "AN_WINTERVEIL_PRESENTS",
        ["points"] = 10,
    },
    [546] = {
        ["selectors"] = {
            ["A:DRUID"] = 2,
            ["A:HUNTER"] = 2,
            ["A:MAGE"] = 2,
            ["A:PALADIN"] = 2,
            ["A:PRIEST"] = 2,
            ["A:ROGUE"] = 2,
            ["A:SHAMAN"] = 2,
            ["A:WARLOCK"] = 2,
            ["A:WARRIOR"] = 2,
            ["H:DRUID"] = 1,
            ["H:HUNTER"] = 1,
            ["H:MAGE"] = 1,
            ["H:PALADIN"] = 1,
            ["H:PRIEST"] = 1,
            ["H:ROGUE"] = 1,
            ["H:SHAMAN"] = 1,
            ["H:WARLOCK"] = 1,
            ["H:WARRIOR"] = 1,
        },
        ["variants"] = {
            [1] = {
                ["anyCompletable"] = false,
                ["categoryID"] = 34,
                ["criteria"] = {
                    [1] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = "SNOWBALL_CAIRNE",
                        },
                        ["id"] = 1874,
                        ["name"] = "",
                        ["type"] = 36,
                    },
                },
                ["description"] = "AD_WINTERVEIL_SNOWBALL_HORDE",
                ["icon"] = "-inv_ammo_snowball",
                ["id"] = 546,
                ["name"] = "AN_WINTERVEIL_SNOWBALL_HORDE",
                ["points"] = 10,
            },
            [2] = {
                ["anyCompletable"] = false,
                ["categoryID"] = 34,
                ["criteria"] = {
                    [1] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = "SNOWBALL_MAGNI",
                        },
                        ["id"] = 1874,
                        ["name"] = "",
                        ["type"] = 36,
                    },
                },
                ["description"] = "AD_WINTERVEIL_SNOWBALL_ALLIANCE",
                ["icon"] = "-inv_ammo_snowball",
                ["id"] = 546,
                ["name"] = "AN_WINTERVEIL_SNOWBALL_ALLIANCE",
                ["points"] = 10,
            },
        },
    },
    [552] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 21,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1454,
                },
                ["id"] = 1746,
                ["name"] = "AC_FISHING_DIPLOMAT1",
                ["type"] = 46,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1453,
                },
                ["id"] = 1747,
                ["name"] = "AC_FISHING_DIPLOMAT2",
                ["type"] = 46,
            },
        },
        ["description"] = "AD_FISHING_DIPLOMAT",
        ["icon"] = "-inv_helmet_44",
        ["id"] = 552,
        ["name"] = "AN_FISHING_DIPLOMAT",
        ["points"] = 10,
    },
    [561] = {
        ["selectors"] = {
            ["A:DRUID"] = 2,
            ["A:HUNTER"] = 2,
            ["A:MAGE"] = 2,
            ["A:PALADIN"] = 2,
            ["A:PRIEST"] = 2,
            ["A:ROGUE"] = 2,
            ["A:SHAMAN"] = 2,
            ["A:WARLOCK"] = 2,
            ["A:WARRIOR"] = 2,
            ["H:DRUID"] = 1,
            ["H:HUNTER"] = 1,
            ["H:MAGE"] = 1,
            ["H:PALADIN"] = 1,
            ["H:PRIEST"] = 1,
            ["H:ROGUE"] = 1,
            ["H:SHAMAN"] = 1,
            ["H:WARLOCK"] = 1,
            ["H:WARRIOR"] = 1,
        },
        ["variants"] = {
            [1] = {
                ["anyCompletable"] = false,
                ["categoryID"] = 35,
                ["criteria"] = {
                    [1] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 9343,
                        },
                        ["id"] = 2040,
                        ["name"] = "",
                        ["type"] = 3,
                    },
                },
                ["description"] = "AD_ARGENT_DAWN_TABARD",
                ["icon"] = "-inv_shirt_guildtabard_01",
                ["id"] = 561,
                ["name"] = "AN_ARGENT_DAWN_TABARD",
                ["points"] = 0,
            },
            [2] = {
                ["anyCompletable"] = false,
                ["categoryID"] = 35,
                ["criteria"] = {
                    [1] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 9341,
                        },
                        ["id"] = 2040,
                        ["name"] = "",
                        ["type"] = 3,
                    },
                },
                ["description"] = "AD_ARGENT_DAWN_TABARD",
                ["icon"] = "-inv_shirt_guildtabard_01",
                ["id"] = 561,
                ["name"] = "AN_ARGENT_DAWN_TABARD",
                ["points"] = 0,
            },
        },
    },
    [562] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 17,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 15936,
                },
                ["id"] = 1501,
                ["name"] = "",
                ["type"] = 38,
            },
        },
        ["description"] = "AD_HEIGAN_DANCE",
        ["icon"] = "-ability_rogue_quickrecovery",
        ["id"] = 562,
        ["name"] = "AN_HEIGAN_DANCE",
        ["points"] = 10,
    },
    [563] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 17,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 16028,
                },
                ["id"] = 1502,
                ["name"] = "",
                ["type"] = 36,
            },
        },
        ["description"] = "AD_PATCHWERK",
        ["icon"] = "-spell_shadow_abominationexplosion",
        ["id"] = 563,
        ["name"] = "AN_PATCHWERK",
        ["points"] = 10,
    },
    [565] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 17,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 16428,
                },
                ["id"] = 1503,
                ["name"] = "",
                ["quantity"] = 1,
                ["type"] = 2,
            },
        },
        ["description"] = "AD_KELTHUZAD_ABOMINATIONS",
        ["icon"] = "spell_deathknight_plaguestrike",
        ["id"] = 565,
        ["name"] = "AN_KELTHUZAD_ABOMINATIONS",
        ["points"] = 10,
    },
    [566] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 34,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = "LITTLE_HELPER_HK",
                },
                ["id"] = 1883,
                ["name"] = {
                    ["args"] = {
                        [1] = 50,
                    },
                    ["key"] = "AC_PVP_KILLS",
                },
                ["quantity"] = 50,
                ["type"] = 36,
            },
        },
        ["description"] = "AD_WINTERVEIL_PVP",
        ["icon"] = "achievement_worldevent_littlehelper",
        ["id"] = 566,
        ["name"] = "AN_WINTERVEIL_PVP",
        ["points"] = 10,
    },
    [576] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 24,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 609,
                    [2] = 8,
                },
                ["id"] = 1996,
                ["name"] = "",
                ["type"] = 16,
            },
        },
        ["description"] = "AD_CENARION",
        ["icon"] = "ability_druid_manatree",
        ["id"] = 576,
        ["name"] = "AN_CENARION",
        ["points"] = 10,
    },
    [577] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 14,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 18228,
                },
                ["id"] = 1312,
                ["name"] = "",
                ["type"] = 5,
            },
        },
        ["description"] = "AD_ALTERAC_AUTOGRAPH",
        ["icon"] = "-inv_scroll_10",
        ["id"] = 577,
        ["name"] = "AN_ALTERAC_AUTOGRAPH",
        ["points"] = 10,
    },
    [578] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 12,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1461,
                    [2] = 2000,
                    [3] = 1990,
                },
                ["id"] = 5781,
                ["name"] = "",
                ["type"] = 44,
            },
        },
        ["description"] = "AD_ARATHI_CLOSE",
        ["icon"] = "-spell_shadow_improvedvampiricembrace",
        ["id"] = 578,
        ["name"] = "AN_ARATHI_CLOSE",
        ["points"] = 10,
    },
    [579] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 12,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 1461,
                    [2] = 2000,
                    [3] = 0,
                },
                ["id"] = 5791,
                ["name"] = "",
                ["type"] = 44,
            },
        },
        ["description"] = "AD_ARATHI_PERFECT",
        ["icon"] = "achievement_bg_abshutout",
        ["id"] = 579,
        ["name"] = "AN_ARATHI_PERFECT",
        ["points"] = 10,
    },
    [605] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 26,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 606,
                },
                ["id"] = 1886,
                ["name"] = "AN_VALENTINES_ROSES",
                ["type"] = 20,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 607,
                },
                ["id"] = 1888,
                ["name"] = "AN_VALENTINES_QUEST",
                ["type"] = 20,
            },
            [3] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 608,
                },
                ["id"] = 1893,
                ["name"] = "AN_VALENTINES_CHOCOLATES",
                ["type"] = 20,
            },
            [4] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 609,
                },
                ["id"] = 1895,
                ["name"] = "AN_VALENTINES_DRESS",
                ["type"] = 20,
            },
            [5] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 610,
                },
                ["id"] = 1897,
                ["name"] = "AN_VALENTINES_PIDO",
                ["type"] = 20,
            },
        },
        ["description"] = "AD_VALENTINES",
        ["icon"] = "achievement_worldevent_valentine",
        ["id"] = 605,
        ["name"] = "AN_VALENTINES",
        ["points"] = 10,
        ["rewardText"] = "TITLE_BUILTIN_THE_LOVE_FOOL_LABEL",
    },
    [606] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 28,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 22206,
                },
                ["id"] = 1885,
                ["name"] = "",
                ["type"] = 5,
            },
        },
        ["description"] = "AD_VALENTINES_ROSES",
        ["icon"] = "-inv_rosebouquet01",
        ["id"] = 606,
        ["name"] = "AN_VALENTINES_ROSES",
        ["points"] = 10,
    },
    [607] = {
        ["selectors"] = {
            ["A:DRUID"] = 2,
            ["A:HUNTER"] = 2,
            ["A:MAGE"] = 2,
            ["A:PALADIN"] = 2,
            ["A:PRIEST"] = 2,
            ["A:ROGUE"] = 2,
            ["A:SHAMAN"] = 2,
            ["A:WARLOCK"] = 2,
            ["A:WARRIOR"] = 2,
            ["H:DRUID"] = 1,
            ["H:HUNTER"] = 1,
            ["H:MAGE"] = 1,
            ["H:PALADIN"] = 1,
            ["H:PRIEST"] = 1,
            ["H:ROGUE"] = 1,
            ["H:SHAMAN"] = 1,
            ["H:WARLOCK"] = 1,
            ["H:WARRIOR"] = 1,
        },
        ["variants"] = {
            [1] = {
                ["anyCompletable"] = false,
                ["categoryID"] = 28,
                ["criteria"] = {
                    [1] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 8984,
                        },
                        ["id"] = 1887,
                        ["name"] = "",
                        ["type"] = 3,
                    },
                },
                ["description"] = "AD_VALENTINES_QUEST",
                ["icon"] = "-spell_brokenheart",
                ["id"] = 607,
                ["name"] = "AN_VALENTINES_QUEST",
                ["points"] = 10,
            },
            [2] = {
                ["anyCompletable"] = false,
                ["categoryID"] = 28,
                ["criteria"] = {
                    [1] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 9028,
                        },
                        ["id"] = 1887,
                        ["name"] = "",
                        ["type"] = 3,
                    },
                },
                ["description"] = "AD_VALENTINES_QUEST",
                ["icon"] = "-spell_brokenheart",
                ["id"] = 607,
                ["name"] = "AN_VALENTINES_QUEST",
                ["points"] = 10,
            },
        },
    },
    [608] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 28,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 22237,
                },
                ["id"] = 1889,
                ["name"] = "AC_VALENTINES_CHOCOLATES_CRITERIA1",
                ["type"] = 5,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 22236,
                },
                ["id"] = 1890,
                ["name"] = "AC_VALENTINES_CHOCOLATES_CRITERIA2",
                ["type"] = 5,
            },
            [3] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 22239,
                },
                ["id"] = 1891,
                ["name"] = "AC_VALENTINES_CHOCOLATES_CRITERIA3",
                ["type"] = 5,
            },
            [4] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 22238,
                },
                ["id"] = 1892,
                ["name"] = "AC_VALENTINES_CHOCOLATES_CRITERIA4",
                ["type"] = 5,
            },
        },
        ["description"] = "AD_VALENTINES_CHOCOLATES",
        ["icon"] = "-inv_valentineschocolate02",
        ["id"] = 608,
        ["name"] = "AN_VALENTINES_CHOCOLATES",
        ["points"] = 10,
    },
    [609] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 28,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 22279,
                },
                ["id"] = 1894,
                ["name"] = "",
                ["type"] = 5,
            },
        },
        ["description"] = "AD_VALENTINES_DRESS",
        ["icon"] = "-inv_chest_cloth_50",
        ["id"] = 609,
        ["name"] = "AN_VALENTINES_DRESS",
        ["points"] = 10,
    },
    [610] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 28,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 22235,
                },
                ["id"] = 1896,
                ["name"] = "",
                ["type"] = 5,
            },
        },
        ["description"] = "AD_VALENTINES_PIDO",
        ["icon"] = "-inv_ammo_arrow_02",
        ["id"] = 610,
        ["name"] = "AN_VALENTINES_PIDO",
        ["points"] = 10,
    },
    [611] = {
        ["selectors"] = {
            ["A:DRUID"] = 2,
            ["A:HUNTER"] = 2,
            ["A:MAGE"] = 2,
            ["A:PALADIN"] = 2,
            ["A:PRIEST"] = 2,
            ["A:ROGUE"] = 2,
            ["A:SHAMAN"] = 2,
            ["A:WARLOCK"] = 2,
            ["A:WARRIOR"] = 2,
            ["H:DRUID"] = 1,
            ["H:HUNTER"] = 1,
            ["H:MAGE"] = 1,
            ["H:PALADIN"] = 1,
            ["H:PRIEST"] = 1,
            ["H:ROGUE"] = 1,
            ["H:SHAMAN"] = 1,
            ["H:WARLOCK"] = 1,
            ["H:WARRIOR"] = 1,
        },
        ["variants"] = {
            [1] = {
                ["anyCompletable"] = false,
                ["categoryID"] = 26,
                ["criteria"] = {
                    [1] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 616,
                        },
                        ["id"] = 1903,
                        ["name"] = {
                            ["args"] = {
                                [1] = 50,
                            },
                            ["key"] = "AN_LUNAR_COINS",
                        },
                        ["type"] = 20,
                    },
                    [2] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 617,
                        },
                        ["id"] = 1905,
                        ["name"] = "AN_LUNAR_QUEST",
                        ["type"] = 20,
                    },
                    [3] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 618,
                        },
                        ["id"] = 1913,
                        ["name"] = "AN_LUNAR_CLOTHES",
                        ["type"] = 20,
                    },
                    [4] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 619,
                        },
                        ["id"] = 1920,
                        ["name"] = "AN_LUNAR_ELDERS_DUNGEONS",
                        ["type"] = 20,
                    },
                    [5] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 620,
                        },
                        ["id"] = 1924,
                        ["name"] = "AN_LUNAR_ELDERS_HORDE",
                        ["type"] = 20,
                    },
                    [6] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 621,
                        },
                        ["id"] = 1942,
                        ["name"] = "AN_LUNAR_ELDERS_EASTERN_KINGDOMS",
                        ["type"] = 20,
                    },
                    [7] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 622,
                        },
                        ["id"] = 1964,
                        ["name"] = "AN_LUNAR_ELDERS_KALIMDOR",
                        ["type"] = 20,
                    },
                },
                ["description"] = "AD_LUNAR",
                ["icon"] = "achievement_worldevent_lunar",
                ["id"] = 611,
                ["name"] = "AN_LUNAR",
                ["points"] = 10,
                ["rewardText"] = "TITLE_BUILTIN_ELDER_LABEL",
            },
            [2] = {
                ["anyCompletable"] = false,
                ["categoryID"] = 26,
                ["criteria"] = {
                    [1] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 616,
                        },
                        ["id"] = 1903,
                        ["name"] = {
                            ["args"] = {
                                [1] = 50,
                            },
                            ["key"] = "AN_LUNAR_COINS",
                        },
                        ["type"] = 20,
                    },
                    [2] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 617,
                        },
                        ["id"] = 1905,
                        ["name"] = "AN_LUNAR_QUEST",
                        ["type"] = 20,
                    },
                    [3] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 618,
                        },
                        ["id"] = 1913,
                        ["name"] = "AN_LUNAR_CLOTHES",
                        ["type"] = 20,
                    },
                    [4] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 619,
                        },
                        ["id"] = 1920,
                        ["name"] = "AN_LUNAR_ELDERS_DUNGEONS",
                        ["type"] = 20,
                    },
                    [5] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 620,
                        },
                        ["id"] = 1924,
                        ["name"] = "AN_LUNAR_ELDERS_ALLIANCE",
                        ["type"] = 20,
                    },
                    [6] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 621,
                        },
                        ["id"] = 1942,
                        ["name"] = "AN_LUNAR_ELDERS_EASTERN_KINGDOMS",
                        ["type"] = 20,
                    },
                    [7] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 622,
                        },
                        ["id"] = 1964,
                        ["name"] = "AN_LUNAR_ELDERS_KALIMDOR",
                        ["type"] = 20,
                    },
                },
                ["description"] = "AD_LUNAR",
                ["icon"] = "achievement_worldevent_lunar",
                ["id"] = 611,
                ["name"] = "AN_LUNAR",
                ["points"] = 10,
                ["rewardText"] = "TITLE_BUILTIN_ELDER_LABEL",
            },
        },
    },
    [612] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 27,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 21100,
                },
                ["id"] = 1898,
                ["name"] = "",
                ["type"] = 5,
            },
        },
        ["description"] = "AD_LUNAR_COIN",
        ["icon"] = "-inv_misc_elvencoins",
        ["id"] = 612,
        ["name"] = "AN_LUNAR_COIN",
        ["nextID"] = 613,
        ["points"] = 10,
    },
    [613] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 27,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 21100,
                },
                ["id"] = 1899,
                ["name"] = {
                    ["args"] = {
                        [1] = 5,
                    },
                    ["key"] = "AD_LUNAR_COINS",
                },
                ["quantity"] = 5,
                ["type"] = 5,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 5,
            },
            ["key"] = "AD_LUNAR_COINS",
        },
        ["icon"] = "-inv_misc_elvencoins",
        ["id"] = 613,
        ["name"] = {
            ["args"] = {
                [1] = 5,
            },
            ["key"] = "AN_LUNAR_COINS",
        },
        ["nextID"] = 614,
        ["points"] = 10,
        ["previousID"] = 612,
    },
    [614] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 27,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 21100,
                },
                ["id"] = 1900,
                ["name"] = {
                    ["args"] = {
                        [1] = 10,
                    },
                    ["key"] = "AD_LUNAR_COINS",
                },
                ["quantity"] = 10,
                ["type"] = 5,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 10,
            },
            ["key"] = "AD_LUNAR_COINS",
        },
        ["icon"] = "-inv_misc_elvencoins",
        ["id"] = 614,
        ["name"] = {
            ["args"] = {
                [1] = 10,
            },
            ["key"] = "AN_LUNAR_COINS",
        },
        ["nextID"] = 615,
        ["points"] = 10,
        ["previousID"] = 613,
    },
    [615] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 27,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 21100,
                },
                ["id"] = 1901,
                ["name"] = {
                    ["args"] = {
                        [1] = 25,
                    },
                    ["key"] = "AD_LUNAR_COINS",
                },
                ["quantity"] = 25,
                ["type"] = 5,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 25,
            },
            ["key"] = "AD_LUNAR_COINS",
        },
        ["icon"] = "-inv_misc_elvencoins",
        ["id"] = 615,
        ["name"] = {
            ["args"] = {
                [1] = 25,
            },
            ["key"] = "AN_LUNAR_COINS",
        },
        ["nextID"] = 616,
        ["points"] = 10,
        ["previousID"] = 614,
    },
    [616] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 27,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 21100,
                },
                ["id"] = 1902,
                ["name"] = {
                    ["args"] = {
                        [1] = 50,
                    },
                    ["key"] = "AD_LUNAR_COINS",
                },
                ["quantity"] = 50,
                ["type"] = 5,
            },
        },
        ["description"] = {
            ["args"] = {
                [1] = 50,
            },
            ["key"] = "AD_LUNAR_COINS",
        },
        ["icon"] = "-inv_misc_elvencoins",
        ["id"] = 616,
        ["name"] = {
            ["args"] = {
                [1] = 50,
            },
            ["key"] = "AN_LUNAR_COINS",
        },
        ["points"] = 10,
        ["previousID"] = 615,
    },
    [617] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 27,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 8868,
                },
                ["id"] = 1904,
                ["name"] = "",
                ["type"] = 3,
            },
        },
        ["description"] = "AD_LUNAR_QUEST",
        ["icon"] = "spell_holy_aspiration",
        ["id"] = 617,
        ["name"] = "AN_LUNAR_QUEST",
        ["points"] = 10,
    },
    [618] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 27,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 21157,
                        },
                        ["id"] = 1906,
                        ["name"] = "",
                        ["type"] = 5,
                    },
                    [2] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 21538,
                        },
                        ["id"] = 1907,
                        ["name"] = "",
                        ["type"] = 5,
                    },
                    [3] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 21539,
                        },
                        ["id"] = 1908,
                        ["name"] = "",
                        ["type"] = 5,
                    },
                    [4] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 21544,
                        },
                        ["id"] = 1909,
                        ["name"] = "",
                        ["type"] = 5,
                    },
                    [5] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 21543,
                        },
                        ["id"] = 1910,
                        ["name"] = "",
                        ["type"] = 5,
                    },
                    [6] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 21541,
                        },
                        ["id"] = 1911,
                        ["name"] = "",
                        ["type"] = 5,
                    },
                },
                ["id"] = 1912,
                ["name"] = "",
                ["type"] = 39,
            },
        },
        ["description"] = "AD_LUNAR_CLOTHES",
        ["icon"] = "-inv_chest_cloth_59",
        ["id"] = 618,
        ["name"] = "AN_LUNAR_CLOTHES",
        ["points"] = 10,
    },
    [619] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 27,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 8727,
                },
                ["id"] = 1914,
                ["name"] = "AC_LUNAR_ELDERS_DUNGEONS_8727",
                ["type"] = 3,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 8619,
                },
                ["id"] = 1915,
                ["name"] = "AC_LUNAR_ELDERS_DUNGEONS_8619",
                ["type"] = 3,
            },
            [3] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 8635,
                },
                ["id"] = 1916,
                ["name"] = "AC_LUNAR_ELDERS_DUNGEONS_8635",
                ["type"] = 3,
            },
            [4] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 8713,
                },
                ["id"] = 1917,
                ["name"] = "AC_LUNAR_ELDERS_DUNGEONS_8713",
                ["type"] = 3,
            },
            [5] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 8644,
                },
                ["id"] = 1918,
                ["name"] = "AC_LUNAR_ELDERS_DUNGEONS_8644",
                ["type"] = 3,
            },
            [6] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 8676,
                },
                ["id"] = 1919,
                ["name"] = "AC_LUNAR_ELDERS_DUNGEONS_8676",
                ["type"] = 3,
            },
        },
        ["description"] = "AD_LUNAR_ELDERS_DUNGEONS",
        ["icon"] = "-spell_holy_symbolofhope",
        ["id"] = 619,
        ["name"] = "AN_LUNAR_ELDERS_DUNGEONS",
        ["points"] = 10,
    },
    [620] = {
        ["selectors"] = {
            ["A:DRUID"] = 2,
            ["A:HUNTER"] = 2,
            ["A:MAGE"] = 2,
            ["A:PALADIN"] = 2,
            ["A:PRIEST"] = 2,
            ["A:ROGUE"] = 2,
            ["A:SHAMAN"] = 2,
            ["A:WARLOCK"] = 2,
            ["A:WARRIOR"] = 2,
            ["H:DRUID"] = 1,
            ["H:HUNTER"] = 1,
            ["H:MAGE"] = 1,
            ["H:PALADIN"] = 1,
            ["H:PRIEST"] = 1,
            ["H:ROGUE"] = 1,
            ["H:SHAMAN"] = 1,
            ["H:WARLOCK"] = 1,
            ["H:WARRIOR"] = 1,
        },
        ["variants"] = {
            [1] = {
                ["anyCompletable"] = false,
                ["categoryID"] = 27,
                ["criteria"] = {
                    [1] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 8678,
                        },
                        ["id"] = 1921,
                        ["name"] = "AC_LUNAR_ELDERS_HORDE_8678",
                        ["type"] = 3,
                    },
                    [2] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 8648,
                        },
                        ["id"] = 1922,
                        ["name"] = "AC_LUNAR_ELDERS_HORDE_8648",
                        ["type"] = 3,
                    },
                    [3] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 8677,
                        },
                        ["id"] = 1923,
                        ["name"] = "AC_LUNAR_ELDERS_HORDE_8677",
                        ["type"] = 3,
                    },
                },
                ["description"] = "AD_LUNAR_ELDERS_HORDE",
                ["icon"] = "-spell_holy_symbolofhope",
                ["id"] = 620,
                ["name"] = "AN_LUNAR_ELDERS_HORDE",
                ["points"] = 10,
            },
            [2] = {
                ["anyCompletable"] = false,
                ["categoryID"] = 27,
                ["criteria"] = {
                    [1] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 8718,
                        },
                        ["id"] = 1921,
                        ["name"] = "AC_LUNAR_ELDERS_ALLIANCE_8718",
                        ["type"] = 3,
                    },
                    [2] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 8866,
                        },
                        ["id"] = 1922,
                        ["name"] = "AC_LUNAR_ELDERS_ALLIANCE_8866",
                        ["type"] = 3,
                    },
                    [3] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 8646,
                        },
                        ["id"] = 1923,
                        ["name"] = "AC_LUNAR_ELDERS_ALLIANCE_8646",
                        ["type"] = 3,
                    },
                },
                ["description"] = "AD_LUNAR_ELDERS_ALLIANCE",
                ["icon"] = "-spell_holy_symbolofhope",
                ["id"] = 620,
                ["name"] = "AN_LUNAR_ELDERS_ALLIANCE",
                ["points"] = 10,
            },
        },
    },
    [621] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 27,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 8636,
                },
                ["id"] = 1925,
                ["name"] = "AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8636",
                ["type"] = 3,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 8651,
                },
                ["id"] = 1926,
                ["name"] = "AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8651",
                ["type"] = 3,
            },
            [3] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 8652,
                },
                ["id"] = 1927,
                ["name"] = "AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8652",
                ["type"] = 3,
            },
            [4] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 8674,
                },
                ["id"] = 1928,
                ["name"] = "AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8674",
                ["type"] = 3,
            },
            [5] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 8716,
                },
                ["id"] = 1929,
                ["name"] = "AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8716",
                ["type"] = 3,
            },
            [6] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 8643,
                },
                ["id"] = 1930,
                ["name"] = "AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8643",
                ["type"] = 3,
            },
            [7] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 8675,
                },
                ["id"] = 1931,
                ["name"] = "AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8675",
                ["type"] = 3,
            },
            [8] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 8649,
                },
                ["id"] = 1932,
                ["name"] = "AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8649",
                ["type"] = 3,
            },
            [9] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 8650,
                },
                ["id"] = 1933,
                ["name"] = "AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8650",
                ["type"] = 3,
            },
            [10] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 8642,
                },
                ["id"] = 1934,
                ["name"] = "AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8642",
                ["type"] = 3,
            },
            [11] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 8645,
                },
                ["id"] = 1935,
                ["name"] = "AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8645",
                ["type"] = 3,
            },
            [12] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 8722,
                },
                ["id"] = 1936,
                ["name"] = "AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8722",
                ["type"] = 3,
            },
            [13] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 8647,
                },
                ["id"] = 1937,
                ["name"] = "AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8647",
                ["type"] = 3,
            },
            [14] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 8653,
                },
                ["id"] = 1938,
                ["name"] = "AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8653",
                ["type"] = 3,
            },
            [15] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 8714,
                },
                ["id"] = 1939,
                ["name"] = "AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8714",
                ["type"] = 3,
            },
            [16] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 8688,
                },
                ["id"] = 1940,
                ["name"] = "AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8688",
                ["type"] = 3,
            },
            [17] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 8683,
                },
                ["id"] = 1941,
                ["name"] = "AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8683",
                ["type"] = 3,
            },
        },
        ["description"] = "AD_LUNAR_ELDERS_EASTERN_KINGDOMS",
        ["icon"] = "-spell_holy_symbolofhope",
        ["id"] = 621,
        ["name"] = "AN_LUNAR_ELDERS_EASTERN_KINGDOMS",
        ["points"] = 10,
    },
    [622] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 27,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 8673,
                },
                ["id"] = 1943,
                ["name"] = "AC_LUNAR_ELDERS_KALIMDOR_8673",
                ["type"] = 3,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 8723,
                },
                ["id"] = 1944,
                ["name"] = "AC_LUNAR_ELDERS_KALIMDOR_8723",
                ["type"] = 3,
            },
            [3] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 8684,
                },
                ["id"] = 1945,
                ["name"] = "AC_LUNAR_ELDERS_KALIMDOR_8684",
                ["type"] = 3,
            },
            [4] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 8726,
                },
                ["id"] = 1946,
                ["name"] = "AC_LUNAR_ELDERS_KALIMDOR_8726",
                ["type"] = 3,
            },
            [5] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 8725,
                },
                ["id"] = 1947,
                ["name"] = "AC_LUNAR_ELDERS_KALIMDOR_8725",
                ["type"] = 3,
            },
            [6] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 8715,
                },
                ["id"] = 1948,
                ["name"] = "AC_LUNAR_ELDERS_KALIMDOR_8715",
                ["type"] = 3,
            },
            [7] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 8681,
                },
                ["id"] = 1949,
                ["name"] = "AC_LUNAR_ELDERS_KALIMDOR_8681",
                ["type"] = 3,
            },
            [8] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 8680,
                },
                ["id"] = 1950,
                ["name"] = "AC_LUNAR_ELDERS_KALIMDOR_8680",
                ["type"] = 3,
            },
            [9] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 8720,
                },
                ["id"] = 1951,
                ["name"] = "AC_LUNAR_ELDERS_KALIMDOR_8720",
                ["type"] = 3,
            },
            [10] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 8670,
                },
                ["id"] = 1952,
                ["name"] = "AC_LUNAR_ELDERS_KALIMDOR_8670",
                ["type"] = 3,
            },
            [11] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 8672,
                },
                ["id"] = 1953,
                ["name"] = "AC_LUNAR_ELDERS_KALIMDOR_8672",
                ["type"] = 3,
            },
            [12] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 8686,
                },
                ["id"] = 1954,
                ["name"] = "AC_LUNAR_ELDERS_KALIMDOR_8686",
                ["type"] = 3,
            },
            [13] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 8654,
                },
                ["id"] = 1955,
                ["name"] = "AC_LUNAR_ELDERS_KALIMDOR_8654",
                ["type"] = 3,
            },
            [14] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 8671,
                },
                ["id"] = 1956,
                ["name"] = "AC_LUNAR_ELDERS_KALIMDOR_8671",
                ["type"] = 3,
            },
            [15] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 8724,
                },
                ["id"] = 1957,
                ["name"] = "AC_LUNAR_ELDERS_KALIMDOR_8724",
                ["type"] = 3,
            },
            [16] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 8685,
                },
                ["id"] = 1958,
                ["name"] = "AC_LUNAR_ELDERS_KALIMDOR_8685",
                ["type"] = 3,
            },
            [17] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 8721,
                },
                ["id"] = 1959,
                ["name"] = "AC_LUNAR_ELDERS_KALIMDOR_8721",
                ["type"] = 3,
            },
            [18] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 8717,
                },
                ["id"] = 1960,
                ["name"] = "AC_LUNAR_ELDERS_KALIMDOR_8717",
                ["type"] = 3,
            },
            [19] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 8719,
                },
                ["id"] = 1961,
                ["name"] = "AC_LUNAR_ELDERS_KALIMDOR_8719",
                ["type"] = 3,
            },
            [20] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 8682,
                },
                ["id"] = 1962,
                ["name"] = "AC_LUNAR_ELDERS_KALIMDOR_8682",
                ["type"] = 3,
            },
            [21] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 8679,
                },
                ["id"] = 1963,
                ["name"] = "AC_LUNAR_ELDERS_KALIMDOR_8679",
                ["type"] = 3,
            },
        },
        ["description"] = "AD_LUNAR_ELDERS_KALIMDOR",
        ["icon"] = "-spell_holy_symbolofhope",
        ["id"] = 622,
        ["name"] = "AN_LUNAR_ELDERS_KALIMDOR",
        ["points"] = 10,
    },
    [625] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 29,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 6833,
                },
                ["id"] = 1965,
                ["name"] = "AC_NOBLEGARDEN_CLOTHES_CRITERIA1",
                ["type"] = 5,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 6835,
                },
                ["id"] = 1966,
                ["name"] = "AC_NOBLEGARDEN_CLOTHES_CRITERIA2",
                ["type"] = 5,
            },
        },
        ["description"] = "AD_NOBLEGARDEN_CLOTHES",
        ["icon"] = "-inv_shirt_08",
        ["id"] = 625,
        ["name"] = "AN_NOBLEGARDEN_CLOTHES",
        ["points"] = 10,
    },
    [626] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 29,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 19028,
                },
                ["id"] = 1967,
                ["name"] = "",
                ["type"] = 5,
            },
        },
        ["description"] = "AD_NOBLEGARDEN_DRESS",
        ["icon"] = "-inv_chest_cloth_04",
        ["id"] = 626,
        ["name"] = "AN_NOBLEGARDEN_DRESS",
        ["points"] = 10,
    },
    [628] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 26,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 629,
                },
                ["id"] = 6280,
                ["name"] = "AN_CHILDREN_PET",
                ["type"] = 20,
            },
        },
        ["description"] = "AD_CHILDREN",
        ["icon"] = "-inv_misc_toy_04",
        ["id"] = 628,
        ["name"] = "AN_CHILDREN",
        ["points"] = 10,
        ["rewardText"] = "TITLE_BUILTIN_PATRON_LABEL",
    },
    [629] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 30,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 23007,
                        },
                        ["id"] = 1968,
                        ["name"] = "",
                        ["type"] = 5,
                    },
                    [2] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 23015,
                        },
                        ["id"] = 1969,
                        ["name"] = "",
                        ["type"] = 5,
                    },
                    [3] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 23002,
                        },
                        ["id"] = 1970,
                        ["name"] = "",
                        ["type"] = 5,
                    },
                },
                ["id"] = 6290,
                ["name"] = "",
                ["type"] = 39,
            },
        },
        ["description"] = "AD_CHILDREN_PET",
        ["icon"] = "-ability_hunter_pet_turtle",
        ["id"] = 629,
        ["name"] = "AN_CHILDREN_PET",
        ["points"] = 10,
    },
    [633] = {
        ["selectors"] = {
            ["A:DRUID"] = 2,
            ["A:HUNTER"] = 2,
            ["A:MAGE"] = 2,
            ["A:PALADIN"] = 2,
            ["A:PRIEST"] = 2,
            ["A:ROGUE"] = 2,
            ["A:SHAMAN"] = 2,
            ["A:WARLOCK"] = 2,
            ["A:WARRIOR"] = 2,
            ["H:DRUID"] = 1,
            ["H:HUNTER"] = 1,
            ["H:MAGE"] = 1,
            ["H:PALADIN"] = 1,
            ["H:PRIEST"] = 1,
            ["H:ROGUE"] = 1,
            ["H:SHAMAN"] = 1,
            ["H:WARLOCK"] = 1,
            ["H:WARRIOR"] = 1,
        },
        ["variants"] = {
            [1] = {
                ["anyCompletable"] = false,
                ["categoryID"] = 26,
                ["criteria"] = {
                    [1] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 634,
                        },
                        ["id"] = 6330,
                        ["name"] = "AN_MIDSUMMER_QUEST1",
                        ["type"] = 20,
                    },
                },
                ["description"] = "AD_MIDSUMMER",
                ["icon"] = "-inv_summerfest_symbol_low",
                ["id"] = 633,
                ["name"] = "AN_MIDSUMMER",
                ["points"] = 20,
                ["rewardText"] = "TITLE_BUILTIN_FLAME_KEEPER_LABEL",
            },
            [2] = {
                ["anyCompletable"] = false,
                ["categoryID"] = 26,
                ["criteria"] = {
                    [1] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 634,
                        },
                        ["id"] = 6330,
                        ["name"] = "AN_MIDSUMMER_QUEST1",
                        ["type"] = 20,
                    },
                },
                ["description"] = "AD_MIDSUMMER",
                ["icon"] = "-inv_summerfest_symbol_high",
                ["id"] = 633,
                ["name"] = "AN_MIDSUMMER",
                ["points"] = 20,
                ["rewardText"] = "TITLE_BUILTIN_FLAME_KEEPER_LABEL",
            },
        },
    },
    [634] = {
        ["selectors"] = {
            ["A:DRUID"] = 2,
            ["A:HUNTER"] = 2,
            ["A:MAGE"] = 2,
            ["A:PALADIN"] = 2,
            ["A:PRIEST"] = 2,
            ["A:ROGUE"] = 2,
            ["A:SHAMAN"] = 2,
            ["A:WARLOCK"] = 2,
            ["A:WARRIOR"] = 2,
            ["H:DRUID"] = 1,
            ["H:HUNTER"] = 1,
            ["H:MAGE"] = 1,
            ["H:PALADIN"] = 1,
            ["H:PRIEST"] = 1,
            ["H:ROGUE"] = 1,
            ["H:SHAMAN"] = 1,
            ["H:WARLOCK"] = 1,
            ["H:WARRIOR"] = 1,
        },
        ["variants"] = {
            [1] = {
                ["anyCompletable"] = false,
                ["categoryID"] = 31,
                ["criteria"] = {
                    [1] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 9339,
                        },
                        ["id"] = 6340,
                        ["name"] = "",
                        ["type"] = 3,
                    },
                },
                ["description"] = "AD_MIDSUMMER_QUEST1",
                ["icon"] = "-inv_helmet_08",
                ["id"] = 634,
                ["name"] = "AN_MIDSUMMER_QUEST1",
                ["points"] = 10,
            },
            [2] = {
                ["anyCompletable"] = false,
                ["categoryID"] = 31,
                ["criteria"] = {
                    [1] = {
                        ["coinFormatter"] = false,
                        ["data"] = {
                            [1] = 9365,
                        },
                        ["id"] = 6340,
                        ["name"] = "",
                        ["type"] = 3,
                    },
                },
                ["description"] = "AD_MIDSUMMER_QUEST1",
                ["icon"] = "-inv_helmet_08",
                ["id"] = 634,
                ["name"] = "AN_MIDSUMMER_QUEST1",
                ["points"] = 10,
            },
        },
    },
    [650] = {
        ["anyCompletable"] = false,
        ["categoryID"] = 26,
        ["criteria"] = {
            [1] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 531,
                },
                ["id"] = 6550,
                ["name"] = "AN_HALLOWSEND",
                ["type"] = 20,
            },
            [2] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 541,
                },
                ["id"] = 6551,
                ["name"] = "AN_WINTERVEIL",
                ["type"] = 20,
            },
            [3] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 611,
                },
                ["id"] = 6552,
                ["name"] = "AN_LUNAR",
                ["type"] = 20,
            },
            [4] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 628,
                },
                ["id"] = 6553,
                ["name"] = "AN_CHILDREN",
                ["type"] = 20,
            },
            [5] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 633,
                },
                ["id"] = 6555,
                ["name"] = "AN_MIDSUMMER",
                ["type"] = 20,
            },
            [6] = {
                ["coinFormatter"] = false,
                ["data"] = {
                    [1] = 605,
                },
                ["id"] = 6556,
                ["name"] = "AN_VALENTINES",
                ["type"] = 20,
            },
        },
        ["description"] = "AD_WORLDEVENTS_TRIP",
        ["icon"] = "achievement_bg_masterofallbgs",
        ["id"] = 650,
        ["name"] = "AC_WORLDEVENTS_TRIP",
        ["points"] = 50,
    },
}

local CATALOG_DELETE = {}

local function CopyTable(value)
    if type(value) ~= "table" then return value end
    local result = {}
    for key, child in pairs(value) do
        result[key] = CopyTable(child)
    end
    return result
end

local function ApplyPatch(target, patch)
    if type(patch) ~= "table" then return patch end
    if patch.__aaCatalogDelete == true and next(patch, "__aaCatalogDelete") == nil then
        return CATALOG_DELETE
    end
    if patch.__aaCatalogReplace == true then
        return CopyTable(patch.value)
    end
    if type(target) ~= "table" then target = {} end
    for key, value in pairs(patch) do
        local updated = ApplyPatch(target[key], value)
        if updated == CATALOG_DELETE then
            target[key] = nil
        else
            target[key] = updated
        end
    end
    return target
end

local function RegisterDefinitions()
    local categoryObjects = {}
    for categoryID, entry in pairs(categoryDefinitions) do
        local definition = SelectDefinition(entry)
        if definition then
            local tab = db:GetTab(definition.tabID or db.TAB_ID_PLAYER)
            local category = tab:CreateCategory(Text(definition.name), definition.parentID, false, definition.id)
            if definition.isFeats then
                category.isFeatsOfStrength = true
                db.FEATS_OF_STRENGTH_CATEGORY_ID = category.id
            end
            categoryObjects[categoryID] = category
        end
    end

    local achievementObjects = {}
    for achievementID, entry in pairs(achievementDefinitions) do
        local definition = SelectDefinition(entry)
        if definition then
            local category = categoryObjects[definition.categoryID] or db:GetCategory(definition.categoryID)
            if category then
                local achievement = category:CreateAchievement(Text(definition.name), Text(definition.description), definition.points, definition.icon, false, definition.id)
                ResolveItemText(Text(definition.name), function(value) achievement.name = value end)
                ResolveItemText(Text(definition.description), function(value) achievement.description = value end)
                local hasCriteria = false
                local allCriteriaHidden = true
                for _, criteriaDefinition in ipairs(definition.criteria or {}) do
                    local criteria = BuildCriteria(criteriaDefinition)
                    if definition.hideCriteriaUI == true then criteria:SetHidden(true) end
                    achievement:AddCriteria(criteria)
                    hasCriteria = true
                    if not criteria:IsHidden() then allCriteriaHidden = false end
                end
                if definition.hideCriteriaUI == true or (hasCriteria and allCriteriaHidden) then
                    achievement:SetHideCriteriaUI(true)
                end
                if definition.rewardText then
                    achievement:SetRewardText(Text(definition.rewardText))
                    if ns.TitleData then
                        local titleReward = ns.TitleData:ResolveBuiltIn(definition.rewardText)
                        if titleReward then achievement:SetTitleReward(titleReward) end
                    end
                end
                if definition.anyCompletable then achievement:SetAnyCompletable() end
                if definition.faction == true then achievement:SetHordeOnly()
                elseif definition.faction == false then achievement:SetAllianceOnly() end
                achievementObjects[achievementID] = achievement
            end
        end
    end

    for achievementID, entry in pairs(achievementDefinitions) do
        local definition = SelectDefinition(entry)
        local achievement = achievementObjects[achievementID]
        if definition and achievement then
            if definition.nextID and achievementObjects[definition.nextID] then achievement.nextID = definition.nextID end
            if definition.previousID and achievementObjects[definition.previousID] then achievement.previousID = definition.previousID end
        end
    end

    db:SetDefinitionIDCounters(DEFINITION_ACHIEVEMENT_COUNTER, DEFINITION_CATEGORY_COUNTER)
    criterias:SetDefinitionIDCounter(DEFINITION_CRITERIA_COUNTER)
    ns.Progression:PostLoad(db:GetTab(db.TAB_ID_PLAYER):GetCategories())
end

local catalog = {}

function catalog:ApplyTBCDelta(delta)
    if not ns.IsTBCAnniversary then return false end
    for _, achievementID in ipairs(delta.removeAchievements or {}) do
        achievementDefinitions[achievementID] = nil
    end
    for categoryID, patch in pairs(delta.categoryPatches or {}) do
        local updated = ApplyPatch(categoryDefinitions[categoryID], patch)
        categoryDefinitions[categoryID] = updated == CATALOG_DELETE and nil or updated
    end
    for achievementID, patch in pairs(delta.achievementPatches or {}) do
        local updated = ApplyPatch(achievementDefinitions[achievementID], patch)
        achievementDefinitions[achievementID] = updated == CATALOG_DELETE and nil or updated
    end
    for categoryID, definition in pairs(delta.categoryDefinitions or {}) do
        categoryDefinitions[categoryID] = definition
    end
    for achievementID, definition in pairs(delta.achievementDefinitions or {}) do
        achievementDefinitions[achievementID] = definition
    end
    DEFINITION_ACHIEVEMENT_COUNTER = delta.achievementCounter or DEFINITION_ACHIEVEMENT_COUNTER
    DEFINITION_CATEGORY_COUNTER = delta.categoryCounter or DEFINITION_CATEGORY_COUNTER
    DEFINITION_CRITERIA_COUNTER = delta.criteriaCounter or DEFINITION_CRITERIA_COUNTER
    RegisterDefinitions()
    ns.AchievementCatalog = nil
    return true
end

ns.AchievementCatalog = catalog

if not ns.IsTBCAnniversary then
    RegisterDefinitions()
    ns.AchievementCatalog = nil
end
