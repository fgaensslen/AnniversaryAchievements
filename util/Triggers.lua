local _, ns = ...

local progression = ns.Progression
local state = ns.State
local database = ns.Database
local areaTableLocale = ns.AreaTableLocale

-- Build the localized area-name index once while the addon loads. Most names
-- resolve directly to one AreaTable ID. Duplicate localized names are marked
-- as ambiguous and resolved from the player's exact map position instead of
-- granting progress for an arbitrary matching area.
local areaIDByLocalizedName = {}
local ambiguousLocalizedAreaNames = {}
for areaID, name in pairs(areaTableLocale or {}) do
    if type(areaID) == "number" and type(name) == "string" and name ~= "" then
        if not ambiguousLocalizedAreaNames[name] then
            local existingAreaID = areaIDByLocalizedName[name]
            if existingAreaID == nil then
                areaIDByLocalizedName[name] = areaID
            elseif existingAreaID ~= areaID then
                areaIDByLocalizedName[name] = nil
                ambiguousLocalizedAreaNames[name] = true
            end
        end
    end
end

local TYPE = progression.TYPE
local GEAR_SLOT = progression.GEAR_SLOT
local checkRatedArenaWin
local loc = SexyLib:Localization('Anniversary Achievements')
local isTBCAnniversary = ns.IsTBCAnniversary == true

-- Initialize and validate the arena streak data for a character.
local function EnsureArenaCharacterData(charKey)
    local settings = state:GetSettings()
    local charData = settings[charKey]
    if type(charData) ~= "table" then
        charData = {}
        settings[charKey] = charData
    end

    charData.HotStreak = tonumber(charData.HotStreak) or 0
    charData.HotterStreak = tonumber(charData.HotterStreak) or 0
    if type(charData.LastArenaMatchToken) ~= "string" then
        charData.LastArenaMatchToken = nil
    end
    return charData
end

if isTBCAnniversary then
    local initialCharacterKey = UnitName("player") .. "-" .. GetRealmName()
    EnsureArenaCharacterData(initialCharacterKey)
end

local function trigger(...)
    progression:Trigger(...)
end

local function getItemIdFromLink(link)
    return tonumber(link:match("\124Hitem:(%d+):"))
end

local function IsDailyQuest(questID)
    local dailyQuests = ns.DailyQuestsTBC
    return dailyQuests and dailyQuests[questID]
end

local DAILY_ACHIEVEMENT_IDS = {
    567, 568, 569, 570, 571, 572, 573, 574
}

local function GetTotalDailyQuestCount()
    local maxProgress = 0

    for _, achID in ipairs(DAILY_ACHIEVEMENT_IDS) do
        local ach = database:GetAchievement(achID)
        if ach then
            for _, criteria in pairs(ach:GetCriterias()) do
                local progress = progression:GetCriteriaProgression(achID, criteria.id)
                if progress and progress > maxProgress then
                    maxProgress = progress
                end
            end
        end
    end

    return maxProgress
end

local completedNonDailyQuests = {}
local totalNonDailyQuests = 0
local questHistorySynchronized = false

-- Rebuild the quest cache only during initialization or an explicit full
-- synchronization. Normal quest turn-ins use RecordCompletedNonDailyQuest()
-- and therefore never iterate over the complete quest history.
local function syncTotalQuests()
    local questsCompleted = GetQuestsCompleted()
    local synchronizedQuests = {}
    local total = 0

    for questID, completed in pairs(questsCompleted) do
        if completed and not IsDailyQuest(questID) then
            synchronizedQuests[questID] = true
            trigger(TYPE.COMPLETE_QUEST, {questID}, 1, true)
            total = total + 1
        end
    end

    completedNonDailyQuests = synchronizedQuests
    totalNonDailyQuests = total
    questHistorySynchronized = true
    trigger(TYPE.COMPLETE_QUESTS, nil, totalNonDailyQuests, true)
end

local function RecordCompletedNonDailyQuest(questID)
    -- QUEST_TURNED_IN can theoretically arrive before the delayed initial
    -- check. In that exceptional case, establish the authoritative cache once.
    if not questHistorySynchronized then
        syncTotalQuests()
        return
    end

    trigger(TYPE.COMPLETE_QUEST, {questID}, 1, true)

    -- Repeatable quests and duplicate client events must not increase the
    -- unique completed-quest total more than once.
    if completedNonDailyQuests[questID] then return end

    completedNonDailyQuests[questID] = true
    totalNonDailyQuests = totalNonDailyQuests + 1
    trigger(TYPE.COMPLETE_QUESTS, nil, totalNonDailyQuests, true)
end

local function updateBankSlots()
    local bankSlots = GetNumBankSlots()
    trigger(TYPE.BANK_SLOTS, nil, bankSlots, true)
end

local function CheckDungeonQuests()
	local bossQuestMap = {
		-- Ragefire Chasm
		[5761] = { type = TYPE.KILL_NPC, data = {11520} }, -- Jergosh der Herbeirufer

		-- Wailing Caverns
		[6981] = { type = TYPE.KILL_NPC, data = {3654} }, -- Mutanus the Devourer

		-- Deadmines
		[166] = { type = TYPE.KILL_NPC, data = {639} }, -- Edwin VanCleef

		-- Shadowfang Keep
		[1014] = { type = TYPE.KILL_NPC, data = {4275} }, -- Archmage Arugal

		-- Blackfathom Deeps
		[1200] = { type = TYPE.KILL_NPC, data = {4832} }, -- Twilight-Lord Kelris
		[6561] = { type = TYPE.KILL_NPC, data = {4832} }, -- Twilight-Lord Kelris

		-- Stormwind Stockade
		[391] = { type = TYPE.KILL_NPC, data = {1716} }, -- Bazil Thredd

		-- Gnomeregan
		[2929] = { type = TYPE.KILL_NPC, data = {7800} }, -- Mekgineer Thermaplugg
		[2841] = { type = TYPE.KILL_NPC, data = {7800} }, -- Mekgineer Thermaplugg

		-- Razorfen Kraul
		[1101] = { type = TYPE.KILL_NPC, data = {4421} }, -- Charlga Razorflank
		[1102] = { type = TYPE.KILL_NPC, data = {4421} }, -- Charlga Razorflank

		-- Razorfen Downs
		[3636] = { type = TYPE.KILL_NPC, data = {7358} }, -- Amnennar the Coldbringer
		[3341] = { type = TYPE.KILL_NPC, data = {7358} }, -- Amnennar the Coldbringer

		-- Scarlet Monastery
		[1053] = { type = TYPE.KILL_NPC, data = {4543, 6487, 3975, 3976, 3977} }, -- Alle fünf Bosse für Horde
		[1048] = { type = TYPE.KILL_NPC, data = {4543, 6487, 3975, 3976, 3977} }, -- Alle fünf Bosse für Allianz

		-- Uldaman
		[2278] = { type = TYPE.KILL_NPC, data = {2748} }, -- Archaedas 

		-- Zul'Farrak
		[3527] = { type = TYPE.KILL_NPC, data = {7267} }, -- Häuptling Ukorz Sandscalp

		-- Maraudon
		[7064] = { type = TYPE.KILL_NPC, data = {12201} }, -- Princess Theradras
		[7065] = { type = TYPE.KILL_NPC, data = {12201} }, -- Princess Theradras

		-- Sunken Temple (Temple of Atal'Hakkar)
		[3373] = { type = TYPE.KILL_NPC, data = {5709} }, -- Shade of Eranikus

		-- Blackrock Depths
		[4003] = { type = TYPE.KILL_NPC, data = {9019} }, -- Emperor Dagran Thaurissan
		[4362] = { type = TYPE.KILL_NPC, data = {9019} }, -- Emperor Dagran Thaurissan

		-- Lower Blackrock Spire
		[4903] = { type = TYPE.KILL_NPC, data = {9568} }, -- 	Oberanführer Wyrmthalak 
		[5081] = { type = TYPE.KILL_NPC, data = {9568} }, -- 	Oberanführer Wyrmthalak 

		-- Upper Blackrock Spire
		[5102] = { type = TYPE.KILL_NPC, data = {10363} }, -- General Drakkisath
		[6602] = { type = TYPE.KILL_NPC, data = {10363} }, -- General Drakkisath
		[6502] = { type = TYPE.KILL_NPC, data = {10363} }, -- General Drakkisath

		-- Scholomance
		[5382] = { type = TYPE.KILL_NPC, data = {1853} }, -- Darkmaster Gandling
		[5466] = { type = TYPE.KILL_NPC, data = {10508} }, -- Ras Frostraunen

		-- Stratholme
		[5262] = { type = TYPE.KILL_NPC, data = {10813} }, -- Balnazzar
		[5263] = { type = TYPE.KILL_NPC, data = {10440} }, -- Baron Rivendare

		-- Dire Maul
		[7461] = { type = TYPE.KILL_NPC, data = {11496, 11486} }, -- Immol'thar, Prinz Tortheldrin
	}
	
	for questID, criteriaInfo in pairs(bossQuestMap) do
        if C_QuestLog.IsQuestFlaggedCompleted(questID) then
            -- Every KILL_NPC criterion has a registry data length of one.
            -- Completed quests that represent multiple bosses must therefore
            -- replay one trigger per NPC instead of passing the complete list.
            for _, npcID in ipairs(criteriaInfo.data) do
                progression:Trigger(criteriaInfo.type, {npcID})
            end
        end
    end
	
end

local function triggerExplorationAtPlayerPosition()
    if not C_Map or not C_Map.GetBestMapForUnit or not C_Map.GetPlayerMapPosition then
        return false
    end
    if not C_MapExplorationInfo or not C_MapExplorationInfo.GetExploredAreaIDsAtPosition then
        return false
    end

    local mapID = C_Map.GetBestMapForUnit("player")
    if not mapID then return false end

    local position = C_Map.GetPlayerMapPosition(mapID, "player")
    if not position then return false end

    local x, y
    if type(position.GetXY) == "function" then
        x, y = position:GetXY()
    else
        x, y = position.x, position.y
    end
    if type(x) ~= "number" or type(y) ~= "number" then return false end

    local areaIDs = C_MapExplorationInfo.GetExploredAreaIDsAtPosition(
        mapID,
        CreateVector2D(x, y)
    )
    if type(areaIDs) ~= "table" or #areaIDs == 0 then return false end

    local triggered = false
    for _, areaID in ipairs(areaIDs) do
        if type(areaID) == "number" then
            trigger(TYPE.EXPLORE_AREA, {areaID}, 1, true)
            triggered = true
        end
    end
    return triggered
end

local function checkUnexploredAreas()
    local areaName = GetSubZoneText()
    if not areaName or areaName == "" then
        areaName = GetZoneText()
    end
    if not areaName or areaName == "" then return end

    local areaID = areaIDByLocalizedName[areaName]
    if areaID then
        trigger(TYPE.EXPLORE_AREA, {areaID}, 1, true)
        return
    end

    -- Missing or duplicate localized names cannot be mapped safely to one ID.
    -- Resolve those rare cases from the player's actual map position.
    triggerExplorationAtPlayerPosition()
end

local function updateReputations()
    local totals = {}
    for factionIndex = 1, GetNumFactions() do
        local name, description, standingId, bottomValue, topValue, earnedValue, atWarWith, canToggleAtWar, isHeader, isCollapsed, hasRep, isWatched, isChild, factionID = GetFactionInfo(factionIndex)
        if not isHeader then
            for level = 1, standingId do
                trigger(TYPE.REACH_REPUTATION, {factionID, level}, 1, true)
                totals[level] = (totals[level] or 0) + 1
            end
        end
    end
    for standingId, total in pairs(totals) do
        trigger(TYPE.REACH_ANY_REPUTATION, {standingId}, total, true)
    end
end

local professions = {
    FIRST_AID = {1, false},
    FISHING = {2, false},
    COOKING = {3, false},
    ENCHANTING = {4, true},
    TAILORING = {5, true},
    ENGINEERING = {6, true},
    LEATHERWORKING = {7, true},
    ALCHEMY = {8, true},
    BLACKSMITHING = {9, true},
    HERBALISM = {10, true},
    MINING = {11, true},
    SKINNING = {12, true},
    JEWELCRAFTING = {14, true}
}

local skills = {
    UNARMED = 13,
    RIDING = 15
}

for idx, data in pairs(professions) do
    professions[idx] = {data[1], data[2], loc:Get('PROF_' .. idx)}
end

for idx, data in pairs(skills) do
    skills[idx] = {data, loc:Get('SKILL_' .. idx)}
end

ns.Professions = professions
ns.Skills = skills

local function triggerProfessions(array, type)
    local size = #array
    if size == 0 then return end
    if size == 1 then trigger(type, array, 1, true) end
    table.sort(array, function(a, b) return a < b end)
    for lvl = 1, array[1] do trigger(type, {lvl}, size, true) end
    for i = 2, size do
        if array[i - 1] ~= array[i] then
            for lvl = 1, array[i] do trigger(type, {lvl}, size - i + 1, true) end
        end
    end
end

local function updateProfessions()
    local main, secondary = {}, {}
    for i = 1, GetNumSkillLines() do
        local skillName, isHeader, _, points, tempPoints = GetSkillLineInfo(i)
        if not isHeader then
            points = min(375, points - tempPoints)
            for idx, data in pairs(professions) do
                if data[3] == skillName then
                    for ps = 1, points do trigger(TYPE.REACH_PROFESSION_LEVEL, {data[1], ps}, 1, true) end
                    if data[2] then
                        main[#main + 1] = points
                    else
                        secondary[#secondary + 1] = points
                    end
                    break
                end
            end
            for idx, data in pairs(skills) do
                if data[2] == skillName then
                    for ps = 1, points do trigger(TYPE.REACH_PROFESSION_LEVEL, {data[1], ps}, 1, true) end
                    break
                end
            end
        end
    end
    triggerProfessions(main, TYPE.REACH_MAIN_PROFESSION_LEVEL)
    triggerProfessions(secondary, TYPE.REACH_SECONDARY_PROFESSION_LEVEL)
end

local highestKnownCookingRecipeCount

local function GetRecordedCookingRecipeCount()
    local highest = 0

    for achievementID, achievement in pairs(database:GetAllAchievements()) do
        for _, criteria in pairs(achievement:GetCriterias()) do
            if criteria.type == TYPE.LEARN_PROFESSION_RECIPES
                and criteria.data
                and criteria.data[1] == professions.COOKING[1]
            then
                highest = max(highest, progression:GetCriteriaProgression(achievementID, criteria.id) or 0)
            end
        end
    end

    return highest
end

local function GetCookingRecipeCount()
    local collapsedHeaders

    -- GetNumTradeSkills() only exposes recipes below expanded headers on legacy
    -- clients. Temporarily expand all headers for the scan and restore the
    -- player's previous collapsed state afterwards.
    if type(ExpandTradeSkillSubClass) == 'function'
        and type(CollapseTradeSkillSubClass) == 'function'
    then
        collapsedHeaders = {}
        for i = 1, GetNumTradeSkills() do
            local name, skillType, _, isExpanded = GetTradeSkillInfo(i)
            if skillType == 'header' and name and not isExpanded then
                collapsedHeaders[name] = true
            end
        end

        pcall(ExpandTradeSkillSubClass, 0)
    end

    local total = 0
    for i = 1, GetNumTradeSkills() do
        local _, skillType = GetTradeSkillInfo(i)
        if skillType and skillType ~= 'header' and skillType ~= 'subheader' then
            total = total + 1
        end
    end

    if collapsedHeaders then
        for i = GetNumTradeSkills(), 1, -1 do
            local name, skillType = GetTradeSkillInfo(i)
            if skillType == 'header' and collapsedHeaders[name] then
                pcall(CollapseTradeSkillSubClass, i)
            end
        end
    end

    return total
end

local function CountLearnedCookingRecipes()
    local profession = GetTradeSkillLine()
    if profession ~= loc:Get('PROF_COOKING') then return end

    local total = GetCookingRecipeCount()
    if total <= 0 then return end

    if highestKnownCookingRecipeCount == nil then
        highestKnownCookingRecipeCount = GetRecordedCookingRecipeCount()
    end

    -- Recipe achievements represent an absolute character state. The first
    -- valid scan therefore updates the complete 5/10/25/50/75 chain directly.
    -- Never lower already recorded progress when a client-side filter hides
    -- entries from the current trade-skill list.
    highestKnownCookingRecipeCount = max(highestKnownCookingRecipeCount, total)
    trigger(
        TYPE.LEARN_PROFESSION_RECIPES,
        {professions.COOKING[1]},
        highestKnownCookingRecipeCount,
        true
    )
end

local function updateItemsInInventory()
    local items = {}
	
    local function processBag(bagID)
		for i = 1, C_Container.GetContainerNumSlots(bagID) do
			local itemInfo = C_Container.GetContainerItemInfo(bagID, i)
			if itemInfo and itemInfo.itemID and itemInfo.stackCount then
				if not items[itemInfo.itemID] then items[itemInfo.itemID] = 0 end
				items[itemInfo.itemID] = items[itemInfo.itemID] + itemInfo.stackCount
			end
		end
	end
    
    for i = 0, NUM_BAG_SLOTS do 
		processBag(i) 
	end
	
    for id, quantity in pairs(items) do
        trigger(TYPE.OBTAIN_ITEM, {id}, quantity, true)
        if id == 22589 or id == 22630 or id == 22631 or id == 22632 then
            trigger(TYPE.ATIESH, nil, 1, true)
        end
    end
end

local function updateGear()
    for idx, name in pairs(GEAR_SLOT) do
        if name == 'WEAPON' then name = 'MAINHAND'
        elseif name == 'FIRST_RING' then name = 'FINGER0'
        elseif name == 'SECOND_RING' then name = 'FINGER1'
        elseif name == 'FIRST_TRINKET' then name = 'TRINKET0'
        elseif name == 'SECOND_TRINKET' then name = 'TRINKET1'
        elseif name == 'CLOAK' then name = 'BACK' end
        
        local slotID = GetInventorySlotInfo(name .. 'SLOT')
        local itemLink = GetInventoryItemLink('player', slotID)
        if itemLink then
            local _, _, quality = GetItemInfo(itemLink)
            if quality ~= nil then
                if quality <= 6 then
                    for q = 2, quality do trigger(TYPE.GEAR_QUALITY, {idx, q}, 1, true) end
                else
                    trigger(TYPE.GEAR_QUALITY, {idx, quality}, 1, true)
                end
            end
            local id = getItemIdFromLink(itemLink)
            if id then
                trigger(TYPE.OBTAIN_ITEM, {id}, 1, true)
                if id == 22589 or id == 22630 or id == 22631 or id == 22632 then
                    trigger(TYPE.ATIESH, nil, 1, true)
                end
            end
        end
    end
end

local EXPLORATION_SAMPLE_FRACTIONS = {0.5, 0.25, 0.75, 0.125, 0.375, 0.625, 0.875}
local EXPLORATION_CALLS_PER_BATCH = 200
local EXPLORATION_FALLBACK_STEP = 0.02
local updatingExploredAreas = false
local explorationScanState = nil

local function clampMapCoordinate(value)
    if value < 0 then return 0 end
    if value > 1 then return 1 end
    return value
end

local function getMapArtDimensions(mapID)
    if not C_Map.GetMapArtLayers then return nil, nil end

    local layers = C_Map.GetMapArtLayers(mapID)
    local layer = layers and layers[1]
    if not layer then return nil, nil end

    local width = tonumber(layer.layerWidth)
    local height = tonumber(layer.layerHeight)
    if not width or width <= 0 or not height or height <= 0 then
        return nil, nil
    end
    return width, height
end

local function getExplorationOverlayRect(overlay, mapWidth, mapHeight)
    if type(overlay) ~= 'table' then return nil end

    local offsetX = tonumber(overlay.offsetX)
    local offsetY = tonumber(overlay.offsetY)
    local textureWidth = tonumber(overlay.textureWidth)
    local textureHeight = tonumber(overlay.textureHeight)
    if not offsetX or not offsetY or not textureWidth or not textureHeight then
        return nil
    end

    local left = clampMapCoordinate(offsetX / mapWidth)
    local top = clampMapCoordinate(offsetY / mapHeight)
    local right = clampMapCoordinate((offsetX + textureWidth) / mapWidth)
    local bottom = clampMapCoordinate((offsetY + textureHeight) / mapHeight)
    if right <= left or bottom <= top then return nil end

    return left, top, right, bottom
end

local function triggerExploredAreaIDs(state, mapID, x, y)
    local areaIDs = C_MapExplorationInfo.GetExploredAreaIDsAtPosition(mapID, CreateVector2D(x, y))
    if not areaIDs then return end

    for _, areaID in ipairs(areaIDs) do
        if areaID and not state.triggeredAreaIDs[areaID] then
            state.triggeredAreaIDs[areaID] = true
            trigger(TYPE.EXPLORE_AREA, {areaID}, 1, true)
        end
    end
end

local function advanceOverlaySample(mapState)
    mapState.sampleY = mapState.sampleY + 1
    if mapState.sampleY > #EXPLORATION_SAMPLE_FRACTIONS then
        mapState.sampleY = 1
        mapState.sampleX = mapState.sampleX + 1
        if mapState.sampleX > #EXPLORATION_SAMPLE_FRACTIONS then
            mapState.sampleX = 1
            mapState.overlayIndex = mapState.overlayIndex + 1
            mapState.overlayRect = nil
        end
    end
end

local function processOverlaySample(state, mapState)
    while mapState.overlayIndex <= #mapState.overlays do
        if not mapState.overlayRect then
            local left, top, right, bottom = getExplorationOverlayRect(
                mapState.overlays[mapState.overlayIndex], mapState.mapWidth, mapState.mapHeight
            )
            if left then
                mapState.overlayRect = {left, top, right, bottom}
            else
                mapState.overlayIndex = mapState.overlayIndex + 1
            end
        end

        if mapState.overlayRect then
            local rect = mapState.overlayRect
            local xFraction = EXPLORATION_SAMPLE_FRACTIONS[mapState.sampleX]
            local yFraction = EXPLORATION_SAMPLE_FRACTIONS[mapState.sampleY]
            local x = rect[1] + (rect[3] - rect[1]) * xFraction
            local y = rect[2] + (rect[4] - rect[2]) * yFraction
            local sampleKey = floor(x * 100000 + 0.5) .. ':' .. floor(y * 100000 + 0.5)

            advanceOverlaySample(mapState)
            if not mapState.sampledPositions[sampleKey] then
                mapState.sampledPositions[sampleKey] = true
                triggerExploredAreaIDs(state, mapState.mapID, x, y)
                return true, false
            end
        end
    end

    return false, true
end

local function processFallbackSample(state, mapState)
    local x = mapState.gridX * EXPLORATION_FALLBACK_STEP
    local y = mapState.gridY * EXPLORATION_FALLBACK_STEP

    mapState.gridY = mapState.gridY + 1
    if mapState.gridY > mapState.gridMax then
        mapState.gridY = 0
        mapState.gridX = mapState.gridX + 1
    end

    triggerExploredAreaIDs(state, mapState.mapID, clampMapCoordinate(x), clampMapCoordinate(y))
    return true, mapState.gridX > mapState.gridMax
end

local function prepareNextExplorationMap(state)
    while state.mapIndex < #state.mapIDs do
        state.mapIndex = state.mapIndex + 1
        local mapID = state.mapIDs[state.mapIndex]
        if C_Map.GetMapInfo(mapID) then
            if C_Map.RequestPreloadMap then
                C_Map.RequestPreloadMap(mapID)
            end

            if C_MapExplorationInfo.GetExploredMapTextures then
                local overlays = C_MapExplorationInfo.GetExploredMapTextures(mapID)
                if overlays and #overlays > 0 then
                    local mapWidth, mapHeight = getMapArtDimensions(mapID)
                    if mapWidth and mapHeight then
                        state.currentMap = {
                            mode = 'overlays',
                            mapID = mapID,
                            overlays = overlays,
                            mapWidth = mapWidth,
                            mapHeight = mapHeight,
                            overlayIndex = 1,
                            sampleX = 1,
                            sampleY = 1,
                            sampledPositions = {}
                        }
                        return true
                    end

                    local gridMax = floor(1 / EXPLORATION_FALLBACK_STEP + 0.5)
                    state.currentMap = {
                        mode = 'fallback',
                        mapID = mapID,
                        gridX = 0,
                        gridY = 0,
                        gridMax = gridMax
                    }
                    return true
                end
            else
                local gridMax = floor(1 / EXPLORATION_FALLBACK_STEP + 0.5)
                state.currentMap = {
                    mode = 'fallback',
                    mapID = mapID,
                    gridX = 0,
                    gridY = 0,
                    gridMax = gridMax
                }
                return true
            end
        end
    end

    return false
end

local function finishExplorationScan()
    explorationScanState = nil
    updatingExploredAreas = false
    SexyLib:Logger('Anniversary Achievements'):LogInfoL('UPDATED_EXPLORED_AREAS')
end

local function processExplorationScan()
    local state = explorationScanState
    if not state then return end

    local calls = 0
    while calls < EXPLORATION_CALLS_PER_BATCH do
        if not state.currentMap and not prepareNextExplorationMap(state) then
            finishExplorationScan()
            return
        end

        local didCall, mapFinished
        if state.currentMap.mode == 'overlays' then
            didCall, mapFinished = processOverlaySample(state, state.currentMap)
        else
            didCall, mapFinished = processFallbackSample(state, state.currentMap)
        end

        if didCall then calls = calls + 1 end
        if mapFinished then state.currentMap = nil end
    end

    C_Timer.After(0, processExplorationScan)
end

local function UpdateExploredAreas()
    if updatingExploredAreas then return end
    updatingExploredAreas = true

    SexyLib:Logger('Anniversary Achievements'):LogInfoL('UPDATING_EXPLORED_AREAS')

    local mapIDs = {}
    local ranges = {{1411, 1458}, {1941, 1955}, {1957, 1957}}
    for _, range in ipairs(ranges) do
        for mapID = range[1], range[2] do
            mapIDs[#mapIDs + 1] = mapID
        end
    end

    explorationScanState = {
        mapIDs = mapIDs,
        mapIndex = 0,
        currentMap = nil,
        triggeredAreaIDs = {}
    }
    C_Timer.After(0, processExplorationScan)
end

local function toPattern(message)
    local pattern = message:gsub('%.', '%%.')
    :gsub('\124%d%-%d%(.*%)', '(.*)')
    :gsub('\1244.*:.*;', '.*')

    for i = 1, 100 do
        local result, count = pattern:gsub('%%' .. i .. '$s', '(.*)')
        if count == 0 then break end
        pattern = result
    end
    pattern = pattern:gsub('%%s', '(.*)'):gsub('%%d', '(%%d%+)')
    return pattern
end

local ITEM_CREATION_PATTERN = toPattern(LOOT_ITEM_CREATED_SELF)
local ITEM_CREATION_PATTERN_MULTIPLE = toPattern(LOOT_ITEM_CREATED_SELF_MULTIPLE)

local DUEL_VICTORY_PATTERN = toPattern(DUEL_WINNER_KNOCKOUT)

local function getEmoteLocalizations(emote)
    local result = {}
    for i = 1, 100 do
        if not loc:IsPresent(emote .. i) then break end
        result[#result + 1] = loc:Get(emote .. i):gsub('%%s', '%(.*%)')
    end
    return result
end
local EMOTE_LOVE = getEmoteLocalizations('EMOTE_LOVE')
local EMOTE_PAT = getEmoteLocalizations('EMOTE_PAT')

local canGetBattlegroundsAchievement = false
local alteracID, warsongID, arathiID, bgEyeID = 1459, 1460, 1461, 1956

-- Kel'Thuzad Abomination Achievement
local KT_ABOMINATION_ID = 16428
local KELTHUZAD_ID = 15990
local ktAbomKills = 0

local PHASE_3_FIRST_WEEK_BOSSES = {
    [17968] = true, -- Archimonde
    [22917] = true, -- Illidan Stormrage
}

local function ResetKT()
    ktAbomKills = 0
end

local killingTracker = ns.CreatureKillingTracker

local function GetCreatureIDFromGUID(guid)
    return killingTracker:GetCreatureID(guid)
end
killingTracker:AddHandler(function(targetID) return true end, function(targetID)
    if targetID == KT_ABOMINATION_ID then
        -- Count the Monstrosities during the current Kel'Thuzad attempt, but do
        -- not award the criterion before Kel'Thuzad himself has died.
        ktAbomKills = ktAbomKills + 1
        return
    end

    -- 1. SINGLE NPC (exact ID)
    trigger(TYPE.KILL_NPC, {targetID}, 1)

    -- 2. ANY NPC (generic kill)
    trigger(TYPE.KILL_ANY_NPC, nil, 1)

    -- 3. MULTIPLE NPCS OF SPECIFIC IDs (list-type achievements)
    trigger(TYPE.KILL_NPCS, {targetID}, 1)

    -- 4. HEROIC kills
    local difficultyID = GetDungeonDifficultyID()
    local _, _, isHeroic = GetDifficultyInfo(difficultyID)
    if isHeroic then
        trigger(TYPE.KILL_NPC_HEROIC, {targetID}, 1)
    end

    -- 5. Phase 3 first week. The release window is based on server time and a
    -- central confirmed schedule, never on a character-specific quest flag.
    if isTBCAnniversary
        and PHASE_3_FIRST_WEEK_BOSSES[targetID]
        and ns.ReleaseSchedule:IsWithinFirstWeek("TBC_PHASE_3")
    then
        trigger(TYPE.P3_FIRST_WEEK, {targetID}, 1)
    end

    -- Achievement 565 is granted only with the Kel'Thuzad kill from the same
    -- combat attempt. PLAYER_REGEN_ENABLED clears the counter after a wipe.
    if targetID == KELTHUZAD_ID then
        if ktAbomKills >= 18 then
            trigger(TYPE.KILL_NPCS, {KT_ABOMINATION_ID}, 1)
        end
        ResetKT()
    end
end)

local leeroy = {}
killingTracker:AddHandler(10161, function(targetID)
    local time, any = time()
    for t, _ in pairs(leeroy) do
        if time - t > 15 then leeroy[t] = nil end
    end
    leeroy[time] = (leeroy[time] or 0) + 1
    local total = 0
    for _, v in pairs(leeroy) do total = total + v end
    if total >= 50 then
        trigger(TYPE.SPECIAL, {1}, 1, true)
    end
end)

local bwlDuo = {}
killingTracker:AddHandler({11981, 14601}, function(targetID)
    local time = time()
    bwlDuo[targetID] = time
    if time - (bwlDuo[11981] or 0) <= 45 and time - (bwlDuo[14601] or 0) <= 45 then
        trigger(TYPE.SPECIAL, {2}, 1, true)
    end
end)

local arachnophobia = 0
killingTracker:AddHandler(15956, function(targetID)
    arachnophobia = time()
end)
killingTracker:AddHandler(15952, function(targetID)
    if time() - arachnophobia < 60 * 20 then trigger(TYPE.SPECIAL, {3}, 1, true) end
end)

local horsemen = {}
killingTracker:AddHandler({16062, 16063, 16064, 16065}, function(targetID)
    horsemen[targetID] = time()
    local timings = {}
    for _, timing in pairs(horsemen) do timings[#timings + 1] = timing end

    if #timings == 4 then
        table.sort(timings, function(a, b) return a < b end)

        -- Timed achievement: all four deaths must fit into one shared
        -- 15-second window, not three independent 15-second intervals.
        if timings[4] - timings[1] <= 15 then
            trigger(TYPE.SPECIAL, {4}, 1, true)
        end

        -- Untimed achievement
        trigger(TYPE.SPECIAL, {5}, 1, true)

        -- ✅ Clear table so next attempt works correctly
        horsemen = {}
    end
end)

local bossesWithMobs = {
    [15956] = {16573},
    [15953] = {16505, 16506}
}
local bossesWithMobsCache = {}
for bossID, mobIDs in pairs(bossesWithMobs) do
    killingTracker:AddHandler(bossID, function(targetID)
        if bossesWithMobsCache[bossID] == nil then trigger(TYPE.BOSS_WITHOUT_MOBS, {bossID}, 1, true) end
    end)
    killingTracker:AddHandler(mobIDs, function(targetID)
        bossesWithMobsCache[bossID] = false
    end)
end

local bossesWithAllAlives = {
    [15936] = 40, -- Heigan
    [15989] = 40  -- Sapphiron
}

for bossID, _ in pairs(bossesWithAllAlives) do
    killingTracker:AddHandler(bossID, function(targetID)

        -- must be in a raid
        local members = GetNumGroupMembers()
        if members == 0 then return end

        local failed = false
        for i = 1, members do
            local unit = "raid" .. i

            -- only evaluate real units
            if UnitExists(unit) then

                -- if the player is offline, treat as alive
                if UnitIsConnected(unit) then
                    -- only fail if actually dead
                    if UnitIsDeadOrGhost(unit) then
                        failed = true
                        break
                    end
                end

            end
        end

        if not failed then
            trigger(TYPE.BOSS_WITH_ALL_ALIVE, {bossID}, 1, true)
        end
    end)
end

-- Patchwerk 3-minute kill
local PATCHWERK_ID = 16028
local PATCHWERK_TIME_LIMIT = 180
local PATCHWERK_PULL_RESET_GAP = 10
local patchwerkStart = nil
local patchwerkLastCombatEvent = nil

local patchwerkEngageEvents = {
    SWING_DAMAGE = true,
    SWING_MISSED = true,
    RANGE_DAMAGE = true,
    RANGE_MISSED = true,
    SPELL_DAMAGE = true,
    SPELL_MISSED = true,
    SPELL_PERIODIC_DAMAGE = true,
    SPELL_PERIODIC_MISSED = true,
    SPELL_BUILDING_DAMAGE = true,
    SPELL_BUILDING_MISSED = true,
    SPELL_DRAIN = true,
    SPELL_LEECH = true,
    SPELL_INSTAKILL = true
}

local function IsPatchwerkGUID(guid)
    return GetCreatureIDFromGUID(guid) == PATCHWERK_ID
end

local function IsPatchwerkCombatEvent(subEvent, sourceGUID, destGUID)
    return patchwerkEngageEvents[subEvent] == true
        and (IsPatchwerkGUID(sourceGUID) or IsPatchwerkGUID(destGUID))
end

local function TrackPatchwerkCombatEvent()
    local now = GetTime()
    if not patchwerkStart or not patchwerkLastCombatEvent or now - patchwerkLastCombatEvent > PATCHWERK_PULL_RESET_GAP then
        patchwerkStart = now
    end
    patchwerkLastCombatEvent = now
end

local function ResetPatchwerkTimer()
    patchwerkStart = nil
    patchwerkLastCombatEvent = nil
end

killingTracker:AddHandler(PATCHWERK_ID, function()
    if patchwerkStart and GetTime() - patchwerkStart <= PATCHWERK_TIME_LIMIT then
        trigger(TYPE.SPECIAL, {PATCHWERK_ID}, 1, true)
    end
    ResetPatchwerkTimer()
end)

--PVP
--Achievement: With a Little Helper from My Friends
local LITTLE_HELPER_BUFFS = {
    [26157] = true,
    [26272] = true,
    [26273] = true,
    [26274] = true
}
local hasLittleHelper = false

local function UpdateLittleHelper()
    hasLittleHelper = false
    for i = 1, 40 do
        local _, _, _, _, _, _, _, _, _, spellId = UnitBuff("player", i)
        if not spellId then break end
        if LITTLE_HELPER_BUFFS[spellId] then
            hasLittleHelper = true
            return
        end
    end
end

local previousPvPKills = GetPVPLifetimeStats()
killingTracker:AddPlayerHandler(function(targetGUID)
    local kills = GetPVPLifetimeStats()
    if kills == previousPvPKills then return end
    trigger(TYPE.KILL_PLAYERS, nil, kills, true)
    previousPvPKills = kills

    -- ✅ LITTLE HELPER ACHIEVEMENT
    if hasLittleHelper then
        trigger(TYPE.SPECIAL, { 'LITTLE_HELPER_HK' }, 1)
    end

    local className, raceName = killingTracker:GetPlayerFacts(targetGUID)
    if type(className) == 'string' and className ~= '' then
        trigger(TYPE.KILL_PLAYER_OF_CLASS, {string.upper(className)}, 1)
    end
    if type(raceName) == 'string' and raceName ~= '' then
        trigger(TYPE.KILL_PLAYER_OF_RACE, {string.upper(raceName)}, 1)
    end

    local mapID = C_Map.GetBestMapForUnit('player')
    if mapID == bgEyeID then
        local berserker = false
        for i = 1, 64 do
            local name, _, _, _, _, _, _, _, _, id = UnitAura('player', i, 'HARMFUL')
            if not name then break end
            if id == 24378 then
                berserker = true
                break
            end
        end
        if berserker then
            trigger(TYPE.BG_EYE_BERSERK)
        end
    end
end)

local alteracValleyMineCaptures = 0
killingTracker:AddHandler({11677, 13086, 13088}, function(targetID)
    alteracValleyMineCaptures = alteracValleyMineCaptures + 1
end)

-- Rated-arena achievements -------------------------------------------------
-- The instance ID returned by GetInstanceInfo() identifies the arena map, not
-- an individual match. Match completion is therefore deduplicated with a
-- composite token derived from map, winner and the estimated match start time.
local ARENA_TITLE_CRITERIA = {
    { labelKey = "AN_ARENA_TITLE1", criteriaKey = "GLADIATOR_TITLE" },
    { labelKey = "AN_ARENA_TITLE2", criteriaKey = "DUELIST_TITLE" },
    { labelKey = "AN_ARENA_TITLE3", criteriaKey = "RIVAL_TITLE" },
    { labelKey = "AN_ARENA_TITLE4", criteriaKey = "CHALLENGER_TITLE" },
}

local arenaSessionSerial = 0
local arenaResultProcessed = false

local function BeginArenaSession()
    arenaSessionSerial = arenaSessionSerial + 1
    arenaResultProcessed = false
end

local function ScanKnownArenaTitles()
    if not isTBCAnniversary then return end
    if type(GetNumTitles) ~= "function"
        or type(IsTitleKnown) ~= "function"
        or type(GetTitleName) ~= "function" then
        return
    end

    local ok, titleCount = pcall(GetNumTitles)
    titleCount = ok and tonumber(titleCount) or 0
    if titleCount <= 0 then return end

    local completed = {}
    local completedCount = 0

    for titleMask = 1, titleCount do
        local knownOK, known = pcall(IsTitleKnown, titleMask)
        if knownOK and known then
            local nameOK, titleName = pcall(GetTitleName, titleMask)
            if nameOK and type(titleName) == "string" and titleName ~= "" then
                for _, definition in ipairs(ARENA_TITLE_CRITERIA) do
                    if not completed[definition.criteriaKey] then
                        local label = loc:Get(definition.labelKey)
                        if type(label) == "string" and label ~= ""
                            and string.find(titleName, label, 1, true) then
                            trigger(TYPE.SPECIAL, { definition.criteriaKey }, 1, true)
                            completed[definition.criteriaKey] = true
                            completedCount = completedCount + 1
                        end
                    end
                end
            end
        end

        if completedCount == #ARENA_TITLE_CRITERIA then
            break
        end
    end
end

local function SyncArenaRatings()
    if not isTBCAnniversary or UnitLevel("player") ~= 70 then return end
    if type(GetArenaTeam) ~= "function" then return end

    for index = 1, 3 do
        local _, teamSize, _, _, _, _, _, _, _, _, personalRating = GetArenaTeam(index)
        teamSize = tonumber(teamSize)
        personalRating = tonumber(personalRating)
        if (teamSize == 2 or teamSize == 3 or teamSize == 5)
            and personalRating and personalRating > 0 then
            trigger(TYPE.ARENA_RATING, { teamSize }, personalRating, true)
        end
    end
end

local function GetPersonalArenaRating(teamSize)
    if type(GetArenaTeam) ~= "function" then return nil end
    teamSize = tonumber(teamSize)
    if teamSize ~= 2 and teamSize ~= 3 and teamSize ~= 5 then return nil end

    for index = 1, 3 do
        local _, currentSize, _, _, _, _, _, _, _, _, personalRating = GetArenaTeam(index)
        if tonumber(currentSize) == teamSize then
            return tonumber(personalRating)
        end
    end

    return nil
end

local function ShortPlayerName(name)
    if type(name) ~= "string" or name == "" then return nil end
    return name:match("^([^%-]+)") or name
end

local function ReadArenaScoreboard(playerName)
    local rows = {}
    local playerRow
    local shortPlayerName = ShortPlayerName(playerName)
    local scoreCount = tonumber(GetNumBattlefieldScores()) or 0

    for index = 1, scoreCount do
        local scoreName, _, _, deaths, _, team = GetBattlefieldScore(index)
        if type(scoreName) == "string" and team ~= nil then
            local row = {
                name = scoreName,
                deaths = tonumber(deaths),
                team = team,
            }
            rows[#rows + 1] = row

            if ShortPlayerName(scoreName) == shortPlayerName then
                playerRow = row
            end
        end
    end

    return rows, playerRow
end

local function InferArenaBracket(rows, playerTeam)
    local teamMembers = 0
    local opponents = 0

    for _, row in ipairs(rows) do
        if row.team == playerTeam then
            teamMembers = teamMembers + 1
        else
            opponents = opponents + 1
        end
    end

    if teamMembers == opponents
        and (teamMembers == 2 or teamMembers == 3 or teamMembers == 5) then
        return teamMembers
    end

    return nil
end

local function IsLastManStanding(rows, playerRow, bracket)
    if bracket ~= 5 or not playerRow or playerRow.deaths ~= 0 then return false end

    local teamMembers = 0
    local opponents = 0
    local survivingTeamMembers = 0

    for _, row in ipairs(rows) do
        if row.team == playerRow.team then
            teamMembers = teamMembers + 1
            if row.deaths == 0 then
                survivingTeamMembers = survivingTeamMembers + 1
            end
        else
            opponents = opponents + 1
        end
    end

    return teamMembers == 5 and opponents == 5 and survivingTeamMembers == 1
end

local function BuildArenaMatchToken(instanceID, winner)
    local runtimeMilliseconds = 0
    if type(GetBattlefieldInstanceRunTime) == "function" then
        runtimeMilliseconds = tonumber(GetBattlefieldInstanceRunTime()) or 0
    end

    local matchIdentity
    if runtimeMilliseconds > 0 then
        local estimatedStart = time() - math.floor(runtimeMilliseconds / 1000)
        -- A five-second bucket absorbs one-second rounding differences between
        -- repeated score updates while remaining unique between real matches.
        matchIdentity = math.floor((estimatedStart + 2) / 5) * 5
    else
        -- Fallback for clients that temporarily report no runtime. The session
        -- serial is reset only when PLAYER_ENTERING_WORLD starts a new visit.
        matchIdentity = "session-" .. tostring(arenaSessionSerial)
    end

    return table.concat({ tostring(instanceID), tostring(winner), tostring(matchIdentity) }, ":")
end

checkRatedArenaWin = function()
    if not isTBCAnniversary or arenaResultProcessed then return end
    if type(IsActiveBattlefieldArena) ~= "function"
        or type(GetArenaTeam) ~= "function"
        or type(GetBattlefieldWinner) ~= "function" then
        return
    end
    if UnitLevel("player") ~= 70 then return end

    local isArena, isRated = IsActiveBattlefieldArena()
    if not isArena then return end

    local _, instanceType, _, _, _, _, _, instanceID = GetInstanceInfo()
    if instanceType ~= "arena" or not instanceID then return end

    local winner = GetBattlefieldWinner()
    if winner == nil then return end

    -- Skirmishes must neither grant rated achievements nor break rated streaks.
    if not isRated then
        arenaResultProcessed = true
        return
    end

    local playerName = UnitName("player")
    local realmName = GetRealmName()
    if not playerName or not realmName then return end

    local rows, playerRow = ReadArenaScoreboard(playerName)
    if not playerRow then return end

    -- Wait for a complete, symmetric scoreboard before finalizing the match.
    -- UPDATE_BATTLEFIELD_SCORE can fire while rows are still being populated.
    local bracket = InferArenaBracket(rows, playerRow.team)
    if not bracket then return end

    local charKey = playerName .. "-" .. realmName
    local charData = EnsureArenaCharacterData(charKey)
    local matchToken = BuildArenaMatchToken(instanceID, winner)

    arenaResultProcessed = true
    if charData.LastArenaMatchToken == matchToken then
        return
    end
    charData.LastArenaMatchToken = matchToken

    -- Ratings can change after wins and losses. Synchronize immediately and
    -- once more after the client has had time to publish ARENA_TEAM_UPDATE.
    SyncArenaRatings()
    if C_Timer and type(C_Timer.After) == "function" then
        C_Timer.After(1, SyncArenaRatings)
    end

    local playerWon = playerRow.team == winner
    if not playerWon then
        charData.HotStreak = 0
        charData.HotterStreak = 0
        return
    end

    trigger(TYPE.ARENA_MAP, { instanceID })
    trigger(TYPE.ARENA_WIN)

    if IsLastManStanding(rows, playerRow, bracket) then
        trigger(TYPE.ARENA_5V5_SURVIVOR)
    end

    charData.HotStreak = charData.HotStreak + 1

    local personalRating = GetPersonalArenaRating(bracket)
    if personalRating and personalRating > 1800 then
        charData.HotterStreak = charData.HotterStreak + 1
        if charData.HotterStreak >= 10 then
            trigger(TYPE.ARENA_HOTTER_STREAK)
        end
    else
        charData.HotterStreak = 0
    end

    if charData.HotStreak >= 10 then
        trigger(TYPE.ARENA_HOT_STREAK)
    end
end

local events = {
    COMBAT_LOG_EVENT_UNFILTERED = function()
        -- CombatLogGetCurrentEventInfo() is intentionally called exactly once
        -- in the normal hot path. Consumers receive the already parsed fields.
        local _, subEvent, _, sourceGUID, _, sourceFlags, _, destGUID, _, _, _, spellId = CombatLogGetCurrentEventInfo()

        local relevantForKills = killingTracker:IsRelevantCombatEvent(subEvent, destGUID)
        local relevantForPatchwerk = IsPatchwerkCombatEvent(subEvent, sourceGUID, destGUID)
        local relevantForSnowball = type(subEvent) == 'string'
            and subEvent:find('^SPELL_') ~= nil
            and spellId == 21343

        if not relevantForKills and not relevantForPatchwerk and not relevantForSnowball then
            return
        end

        if relevantForKills then
            killingTracker:HandleCombatEventPayload(subEvent, sourceFlags, destGUID)
        end

        if relevantForPatchwerk then
            TrackPatchwerkCombatEvent()
        end

        if relevantForSnowball then
            -- Only player casts. Creature- and Vehicle- targets resolve through
            -- the same checked GUID parser used by the kill tracker.
            if sourceGUID ~= UnitGUID("player") then return end

            local targetID = GetCreatureIDFromGUID(destGUID)

            -- Horde
            if targetID == 3057 then
                trigger(TYPE.SPECIAL, { 'SNOWBALL_CAIRNE' }, 1, true)
            end

            -- Alliance
            if targetID == 2784 then
                trigger(TYPE.SPECIAL, { 'SNOWBALL_MAGNI' }, 1, true)
            end
        end
    end,
    PLAYER_PVP_KILLS_CHANGED = function()
        local kills = GetPVPLifetimeStats()
        trigger(TYPE.KILL_PLAYERS, nil, kills, true)
    end,
    PLAYER_LEVEL_UP = function(level, healthDelta, powerDelta, numNewTalents, numNewPvpTalentSlots, strengthDelta, agilityDelta, staminaDelta, intellectDelta)
        trigger(TYPE.REACH_LEVEL, {level}, 1, true)
    end,
    QUEST_TURNED_IN = function(questID, xpReward, moneyReward)
        trigger(TYPE.LOOT_QUEST_GOLD, nil, moneyReward)

        C_Timer.After(1, function()

            if IsDailyQuest(questID) then
                trigger(TYPE.COMPLETE_DAILY_QUEST, {questID}, 1, true)

                local totalDaily = GetTotalDailyQuestCount() + 1
                trigger(TYPE.COMPLETE_DAILY_QUESTS, nil, totalDaily, true)
            else
                RecordCompletedNonDailyQuest(questID)
            end
        end)
    end,
    PLAYERBANKBAGSLOTS_CHANGED = function()
        C_Timer.After(1, updateBankSlots)
    end,
	BANKFRAME_OPENED = function()
		updateBankSlots()
	end,
    UPDATE_FACTION = function()
        C_Timer.After(1, updateReputations)
    end,
    SKILL_LINES_CHANGED = function()
        C_Timer.After(1, updateProfessions)
    end,
    CHAT_MSG_LOOT = function(msg, initiator, langName, channelName, playerName, flags)
        if flags == 'GM' or flags == 'DEV' then return end
        if not playerName then playerName = initiator end
        if not playerName or playerName ~= UnitName('player') then return end

        C_Timer.After(1, updateItemsInInventory)

        local item, quantity = msg:match(ITEM_CREATION_PATTERN_MULTIPLE)
        if not item then
            item = msg:match(ITEM_CREATION_PATTERN)
            if not item then return end
            quantity = 1
        else
            quantity = tonumber(quantity)
        end
        local id = getItemIdFromLink(item)
        if not id then return end
        trigger(TYPE.CRAFT_ITEM, {id}, quantity)
    end,
    LOOT_OPENED = function()
        if not IsFishingLoot() then return end

        -- Fishing Diplomat: detect city by mapID
        local mapID = C_Map.GetBestMapForUnit("player")

        if mapID == 1454 or mapID == 1453 then
            trigger(TYPE.FISH_ANY_ITEM, {mapID}, 1)
        end

        for slot = 1, GetNumLootItems() do
            if LootSlotHasItem(slot) then
                local _, _, quantity = GetLootSlotInfo(slot)
                local link = GetLootSlotLink(slot)
                if link then
                    local id = getItemIdFromLink(link)
                    if id then 
                        trigger(TYPE.FISH_AN_ITEM, {id}, quantity)
                        trigger(TYPE.FISH_ANY_ITEM, {-1}, quantity)
                    end
                end
            end
        end
    end,
    UPDATE_BATTLEFIELD_SCORE = function()
        
        --ARENA
        if isTBCAnniversary then
            checkRatedArenaWin()
        end

        --BATTLEGROUNDS        
        if not InActiveBattlefield() or not canGetBattlegroundsAchievement then return end
        local winner = GetBattlefieldWinner()
        if not winner then return end
        canGetBattlegroundsAchievement = false
        
        local mapID = C_Map.GetBestMapForUnit('player')
        if mapID ~= alteracID and mapID ~= warsongID and mapID ~= arathiID and mapID ~= bgEyeID then return end

        local numStats, numScores = GetNumBattlefieldStats(), GetNumBattlefieldScores()
        local myName = UnitName('player')
        for i = 1, numScores do
            local name, killingBlows, honorableKills, deaths = GetBattlefieldScore(i)
            if name == myName then
                local scores = {killingBlows, honorableKills}
                for j = 1, numStats do
                    local stat = GetBattlefieldStatData(i, j)
                    trigger(TYPE.BATTLEFIELD_STAT, {mapID, j}, stat)
                    trigger(TYPE.BATTLEFIELD_STAT_MAX, {mapID, j}, stat, true)
                end
                for j, score in pairs(scores) do
                    trigger(TYPE.BATTLEFIELD_SCORE_MAX, {mapID, j}, score, true)
                    trigger(TYPE.BATTLEFIELDS_SCORE, {j}, score)
                end
                if mapID == bgEyeID then
                    if GetBattlefieldStatData(i, 1) >= 3 and deaths == 0 then
                        trigger(TYPE.BG_EYE_GLORY)
                    end
                end
                break
            end
        end

        trigger(TYPE.ALTERAC_VALLEY_MINE_CAPTURE_MAX, nil, alteracValleyMineCaptures, true)
        alteracValleyMineCaptures = 0

        local seconds = GetBattlefieldInstanceRunTime() / 1000

        local myFaction = UnitFactionGroup('player')
        if myFaction == 'Horde' then myFaction = 0 else myFaction = 1 end

        local myFactionPoints = GetBattlegroundPoints(myFaction)
        local enemyFactionPoints = GetBattlegroundPoints(1 - myFaction)

        trigger(TYPE.BG_POINTS, {mapID, myFactionPoints, enemyFactionPoints})

        if winner == myFaction then
            trigger(TYPE.BATTLEFIELD_WINS, {mapID}, 1)
            if seconds ~= 0 then
                if (mapID == alteracID or mapID == arathiID or mapID == bgEyeID) and seconds <= 360 or mapID == warsongID and seconds <= 420 then
                    trigger(TYPE.BATTLEFIELD_FAST_WIN, {mapID})
                end
            end
        end
        
        trigger(TYPE.BATTLEFIELD_MAX_LEVEL_PARTICIPATION)       
    end,
	UNIT_AURA = function(unit)
		if unit ~= "player" then return end
        UpdateLittleHelper()

		local i = 1
		while true do
			local name, _, _, _, _, _, _, _, _, spellId = UnitBuff("player", i)
			if not name then break end

			trigger(TYPE.HAS_BUFF, {spellId})
			i = i + 1
		end
	end,
	ZONE_CHANGED_NEW_AREA = function()
		checkUnexploredAreas()
	end,
	ZONE_CHANGED = function()		
		checkUnexploredAreas()
	end,
    PLAYER_EQUIPMENT_CHANGED = function()
        C_Timer.After(1, updateGear)
    end,
    PLAYER_ENTERING_WORLD = function()
        canGetBattlegroundsAchievement = true
        alteracValleyMineCaptures = 0
        BeginArenaSession()
    end,
	-- Scan after the cooking window has populated its recipe list.
	TRADE_SKILL_SHOW = function()
        C_Timer.After(0, CountLearnedCookingRecipes)
	end,
    CHAT_MSG_SYSTEM = function(msg)
        local winner = msg:match(DUEL_VICTORY_PATTERN)
        if winner and UnitName('player') == winner then
            trigger(TYPE.DUELS)
        end
    end,
    CHAT_MSG_TEXT_EMOTE = function(msg)
        local guid = UnitGUID('target')
        if not guid then return end
        local split = SexyLib:Util():Explode(UnitGUID('target'), '-')
        if split[1] ~= 'Creature' or not split[6] then return end
        local unitID = floor(split[6])
        if unitID == 0 then return end

        local matched = false
        for _, pattern in pairs(EMOTE_LOVE) do
            if msg:match(pattern) then
                trigger(TYPE.EMOTE, {'LOVE', unitID})
                matched = true
                break
            end
        end
        if matched then return end

        for _, pattern in pairs(EMOTE_PAT) do
            if msg:match(pattern) then
                trigger(TYPE.EMOTE, {'PAT', unitID})
                matched = true
                break
            end
        end
        if matched then return end
    end,
    PLAYER_REGEN_ENABLED = function()
        bossesWithMobsCache = {}

        -- Reset KT abominations on wipe / combat end        
        ResetKT()        
    end,
    UNIT_NAME_UPDATE = function(unit)
        if unit and unit ~= "player" then return end
        ScanKnownArenaTitles()
    end,
    ARENA_TEAM_UPDATE = function()
        if not isTBCAnniversary then return end
        if C_Timer and type(C_Timer.After) == "function" then
            C_Timer.After(0, SyncArenaRatings)
        else
            SyncArenaRatings()
        end
    end
}

local eventsHandler = CreateFrame('FRAME', 'ClassicAchievementsEventHandlingFrame')
eventsHandler:SetScript('OnEvent', function(self, event, ...)
    events[event](...)
end)
for eventName in pairs(events) do
    if eventName == "ARENA_TEAM_UPDATE" and not isTBCAnniversary then
        -- TBC-only event; do not attempt to register it on Classic Era.
    elseif eventName == "UNIT_AURA" then
        eventsHandler:RegisterUnitEvent(eventName, "player")
    else
        eventsHandler:RegisterEvent(eventName)
    end
end

local function PerformInitialCheck()
    local kills, _, maxRank = GetPVPLifetimeStats()
    local _, maxRank = GetPVPRankInfo(maxRank)
    trigger(TYPE.KILL_PLAYERS, nil, kills, true)
    for rank = 1, maxRank do trigger(TYPE.REACH_PVP_RANK, {rank}, 1, true) end

    local level = UnitLevel('player')
    for lvl = 1, level do trigger(TYPE.REACH_LEVEL, {lvl}, 1, true) end

    trigger(TYPE.NOT_WORKING, nil, 1, true)
    syncTotalQuests()
    updateBankSlots()
    updateReputations()
    updateProfessions()
    updateItemsInInventory()
    updateGear()
	CheckDungeonQuests()

    if isTBCAnniversary then
        ScanKnownArenaTitles()
        SyncArenaRatings()
    end

    progression:ReCheckAchievements()
end

ns.UpdateExploredAreas = UpdateExploredAreas
ns.PerformInitialCheck = PerformInitialCheck

C_Timer.After(5, PerformInitialCheck)