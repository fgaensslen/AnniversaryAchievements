local db = CA_Database
local criterias = CA_Criterias
local loc = SexyLib:Localization('Anniversary Achievements')

local tab = db:GetTab(db.TAB_ID_PLAYER)
local ach, previous = nil

local L = CA_Loader:ForTab(tab)
local TYPE = criterias.TYPE

local separator = '.'

function FormatNumbersInString(text)
    if GetLocale() ~= "deDE" then
        return text
    end

    return text:gsub("%d+", function(num)
        local left, digits = num:match("^(%d)(%d+)$")
        if not digits then return num end
        return left .. digits:reverse():gsub("(%d%d%d)", "%1" .. separator):reverse()
    end)
end

-- CATEGORIES -- 
local general = tab:CreateCategory('CATEGORY_GENERAL', nil, true)

local quests = tab:CreateCategory('CATEGORY_QUESTS', nil, true)
local questsEasternKingdoms = tab:CreateCategory('CATEGORY_EASTERN_KINGDOMS', quests.id, true)
local questsKalimdor = tab:CreateCategory('CATEGORY_KALIMDOR', quests.id, true)
local outlandQuests = tab:CreateCategory('CATEGORY_OUTLAND', quests.id, true)

local exploration = tab:CreateCategory('CATEGORY_EXPLORATION', nil, true)
local explorationEasternKingdoms = tab:CreateCategory('CATEGORY_EASTERN_KINGDOMS', exploration.id, true)
local explorationKalimdor = tab:CreateCategory('CATEGORY_KALIMDOR', exploration.id, true)
local outlandExploration = tab:CreateCategory('CATEGORY_OUTLAND', exploration.id, true)

local pvp = tab:CreateCategory('CATEGORY_PVP', nil, true)
local warsong = tab:CreateCategory('CATEGORY_BG_WARSONG', pvp.id, true)
local arathi = tab:CreateCategory('CATEGORY_BG_ARATHI', pvp.id, true)
local bgEye = tab:CreateCategory('CATEGORY_BG_EYE', pvp.id, true)
local alterac = tab:CreateCategory('CATEGORY_BG_ALTERAC', pvp.id, true)

local pve = tab:CreateCategory('CATEGORY_PVE', nil, true)
local instances = tab:CreateCategory('CATEGORY_VANILLA', pve.id, true)
local tbcInstances = tab:CreateCategory('CATEGORY_TBC', pve.id, true)

local professions = tab:CreateCategory('CATEGORY_PROFESSIONS', nil, true)
local cooking = tab:CreateCategory('PROF_COOKING', professions.id, true)
local fishing = tab:CreateCategory('PROF_FISHING', professions.id, true)
local firstAid = tab:CreateCategory('PROF_FIRST_AID', professions.id, true)

local reputation = tab:CreateCategory('CATEGORY_REPUTATION', nil, true)
local vanillaReputation = tab:CreateCategory('CATEGORY_VANILLA', reputation.id, true)
local tbcReputations = tab:CreateCategory('CATEGORY_TBC', reputation.id, true)

local worldevents = tab:CreateCategory('CATEGORY_EVENTS', nil, true)
local lunar = tab:CreateCategory('CATEGORY_LUNAR', worldevents.id, true)
local valentines = tab:CreateCategory('CATEGORY_VALENTINES', worldevents.id, true)
local hallowsend = tab:CreateCategory('CATEGORY_HALLOWSEND', worldevents.id, true)
local winterveil = tab:CreateCategory('CATEGORY_WINTERVEIL', worldevents.id, true)

local featsOfStrength = tab:CreateCategory('CATEGORY_FEATS_OF_STRENGTH', nil, true)

-- GENERAL --
do 
    for i = 1, 7 do
        local lvl = i * 10
        ach = general:CreateAchievement(loc:Get('AN_LVL', lvl), loc:Get('AD_LVL', lvl), 10, '-achievement_level_' .. lvl)
        ach:AddCriteria(criterias:Create(nil, TYPE.REACH_LEVEL, {lvl}))
        if previous then previous:SetNext(ach) end
        previous = ach
    end
	
	--Level 70
	ach:SetUnavailable()

	ach = general:CreateAchievement('AN_BANK', 'AD_BANK', 10, '-inv_box_01', true)
	ach:AddCriteria(criterias:Create('AC_BANK', TYPE.BANK_SLOTS, nil, 6))

    previous = nil
    for i, count in pairs({100, 1000, 5000, 10000, 25000, 50000, 100000}) do
        ach = general:CreateAchievement(loc:Get('AN_MOB_KILLS_' .. i), FormatNumbersInString(loc:Get('AD_MOB_KILLS', count)), 10, '-inv_misc_monsterclaw_02')
        ach:AddCriteria(criterias:Create(FormatNumbersInString(loc:Get('AC_MOB_KILLS', count)), TYPE.KILL_ANY_NPC, nil, count))
        if previous then previous:SetNext(ach) end
        previous = ach
    end
	
    ach = general:CreateAchievement('AN_UNARMED_SKILL', 'AD_UNARMED_SKILL', 10, '-ability_warrior_secondwind', true)
    ach:AddCriteria(criterias:Create(nil, TYPE.REACH_PROFESSION_LEVEL, {ClassicAchievementsSkills.UNARMED[1], 300}))

    local function add(previous, qualityName, quality, icon)
        local ach = general:CreateAchievement('AN_' .. qualityName .. '_GEAR', 'AD_' .. qualityName .. '_GEAR', 10, icon, true)
        for idx, name in pairs(criterias.GEAR_SLOT) do
            ach:AddCriteria(criterias:CreateL('GEAR_SLOT_' .. name, TYPE.GEAR_QUALITY, {idx, quality}))
        end
        if previous then previous:SetNext(ach) end
        return ach
    end

    ach = add(nil, 'UNCOMMON', 2, '-Inv_Enchant_EssenceNetherSmall')
    ach = add(ach, 'RARE', 3, '-Spell_Frost_WizardMark')
    ach = add(ach, 'EPIC', 4, '-Inv_Enchant_ShardNexusLarge')
        
	local function riding(icon, skillPoints, previous)
		local builder = L:Achievement(general, 10, icon)
		:Name('AN_RIDING_' .. skillPoints, true)
		:Desc('AD_RIDING_' .. skillPoints, true)
		:Criteria(TYPE.REACH_PROFESSION_LEVEL, {ClassicAchievementsSkills.RIDING[1], skillPoints}):Build()
		if previous then builder:Previous(previous) end
		return builder:Build()
	end
	
	ach = nil
	for _, data in pairs({{'-Ability_Mount_RidingHorse', 75},{'-Ability_Mount_BlackPanther', 150},{'-Ability_Mount_Gryphon_01', 225},{'-Ability_Mount_RocketMount', 300}}) do 
		ach = riding(data[1], data[2], ach)
		ach:SetUnavailable()
	end        
		
	-- SETS --
	local function add(name, subtitle, icon, ids)
        local ach = general:CreateAchievement('AN_' .. name, subtitle, 20, icon, true)

		for _, itemID in pairs(ids) do
			local criteria = criterias:Create('itemID ' .. itemID, TYPE.OBTAIN_ITEM, {itemID})
				ach:AddCriteria(criteria)
				
			local item = Item:CreateFromItemID(itemID)
			item:ContinueOnItemLoad(function()
				criteria.name = item:GetItemName()
			end)
		end
	end

	local playerClass, englishClass = UnitClass('player')
	
	--T1
	if englishClass == 'DRUID' then		
		add('DRUID_T1', 'AD_SET', '-inv_helmet_09', {16828, 16829, 16830, 16833, 16831, 16834, 16835, 16836})	
	elseif englishClass == 'WARLOCK' then
		add('WARLOCK_T1', 'AD_SET', '-inv_helmet_08', {16806, 16804, 16805, 16810, 16809, 16807, 16808, 16803})	
	elseif englishClass == 'PRIEST' then
		add('PRIEST_T1', 'AD_SET', '-inv_helmet_34', {16811, 16813, 16817, 16812, 16814, 16816, 16815, 16819})	
	elseif englishClass == 'MAGE' then
		add('MAGE_T1', 'AD_SET', '-inv_helmet_53', {16795, 16797, 16798, 16796, 16801, 16800, 16802, 16799})
	elseif englishClass == 'ROGUE' then
		add('ROGUE_T1', 'AD_SET', '-inv_helmet_41', {16821, 16823, 16820, 16822, 16826, 16824, 16825, 16827})
	elseif englishClass == 'HUNTER' then
		add('HUNTER_T1', 'AD_SET', '-inv_helmet_05', {16846, 16848, 16845, 16847, 16852, 16849, 16851, 16850})
	elseif englishClass == 'PALADIN' then
		add('PALADIN_T1', 'AD_SET', '-inv_helmet_05', {16854, 16856, 16853, 16855, 16860, 16859, 16858, 16857})
	elseif englishClass == 'WARRIOR' then
		add('WARRIOR_T1', 'AD_SET', '-inv_helmet_09', {16866, 16868, 16865, 16867, 16863, 16862, 16864, 16861})
	elseif englishClass == 'SHAMAN' then
		add('SHAMAN_T1', 'AD_SET', '-inv_helmet_09', {16837, 16839, 16838, 16840, 16844, 16841, 16843, 16842})
	end	
	
	--T2
	if englishClass == 'DRUID' then		
		add('DRUID_T2', 'AD_SET', '-inv_helmet_09', {16903, 16898, 16904, 16897, 16900, 16899, 16901, 16902})	
	elseif englishClass == 'WARLOCK' then
		add('WARLOCK_T2', 'AD_SET', '-inv_helmet_08', {16933, 16927, 16934, 16928, 16930, 16931, 16929, 16932})	
	elseif englishClass == 'PRIEST' then
		add('PRIEST_T2', 'AD_SET', '-inv_helmet_24', {16925, 16926, 16919, 16921, 16920, 16922, 16924, 16923})	
	elseif englishClass == 'MAGE' then
		add('MAGE_T2', 'AD_SET', '-inv_helmet_70', {16818, 16918, 16912, 16914, 16917, 16913, 16915, 16916})
	elseif englishClass == 'ROGUE' then
		add('ROGUE_T2', 'AD_SET', '-inv_helmet_41', {16910, 16906, 16911, 16905, 16907, 16908, 16909, 16832})
	elseif englishClass == 'HUNTER' then
		add('HUNTER_T2', 'AD_SET', '-inv_helmet_05', {16936, 16935, 16942, 16940, 16941, 16939, 16938, 16937})
	elseif englishClass == 'PALADIN' then
		add('PALADIN_T2', 'AD_SET', '-inv_helmet_74', {16952, 16951, 16958, 16955, 16956, 16954, 16957, 16953})
	elseif englishClass == 'WARRIOR' then
		add('WARRIOR_T2', 'AD_SET', '-inv_helmet_71', {16959, 16966, 16964, 16963, 16962, 16961, 16965, 16960})
	elseif englishClass == 'SHAMAN' then
		add('SHAMAN_T2', 'AD_SET', '-inv_helmet_69', {16944, 16943, 16950, 16945, 16948, 16949, 16947, 16946})
	end	
	
	--T3
	if englishClass == 'DRUID' then		
		add('DRUID_T3', 'AD_SET', '-inv_helmet_15', {22490, 22491, 22488, 22489, 22492, 22494, 22493, 22495, 23064})	
	elseif englishClass == 'WARLOCK' then
		add('WARLOCK_T3', 'AD_SET', '-inv_crown_01', {22506, 22507, 22504, 22505, 22508, 22510, 22509, 22511, 23063})	
	elseif englishClass == 'PRIEST' then
		add('PRIEST_T3', 'AD_SET', '-inv_crown_01', {22518, 22519, 22514, 22517, 22513, 22512, 22516, 22515, 23061})	
	elseif englishClass == 'MAGE' then
		add('MAGE_T3', 'AD_SET', '-inv_crown_01', {22498, 22499, 22496, 22497, 22500, 22502, 22501, 22503, 23062})
	elseif englishClass == 'ROGUE' then
		add('ROGUE_T3', 'AD_SET', '-inv_helmet_58', {22478, 22479, 22476, 22477, 22480, 22482, 22481, 22483, 23060})
	elseif englishClass == 'HUNTER' then
		add('HUNTER_T3', 'AD_SET', '-inv_helmet_15', {22438, 22439, 22436, 22437, 22441, 22442, 22440, 22443, 23067})
	elseif englishClass == 'PALADIN' then
		add('PALADIN_T3', 'AD_SET', '-inv_helmet_15', {22428, 22429, 22426, 22427, 22430, 22424, 22431, 22425, 23066})
	elseif englishClass == 'WARRIOR' then
		add('WARRIOR_T3', 'AD_SET', '-inv_helmet_58', {22418, 22419, 22416, 22417, 22420, 22422, 22421, 22423, 23059})
	elseif englishClass == 'SHAMAN' then
		add('SHAMAN_T3', 'AD_SET', '-inv_helmet_15', {22466, 22467, 22464, 22465, 22468, 22470, 22469, 22471, 23065})
	end
	
end

-- QUESTS --
do
    previous = nil
    for i, count in pairs({50, 100, 250, 500, 750, 1000, 1500, 2000}) do
        ach = quests:CreateAchievement(FormatNumbersInString(loc:Get('AN_QUESTS', count)), FormatNumbersInString(loc:Get('AD_QUESTS', count)), 10, '-achievement_quests_completed_0' .. i)
        ach:AddCriteria(criterias:Create(FormatNumbersInString(loc:Get('AC_QUESTS', count)), TYPE.COMPLETE_QUESTS, nil, count))
        if previous then previous:SetNext(ach) end
        previous = ach
    end

    previous = nil
    for i, count in pairs({5, 10, 25, 50, 100, 250, 500}) do
        local texture
        if i == 1 then texture = 5
        elseif i == 2 then texture = 6
        elseif i == 3 then texture = 3
        elseif i == 4 then texture = 4
        elseif i == 5 then texture = 1
        elseif i > 5 then texture = 2
        end
        ach = quests:CreateAchievement(loc:Get('AN_QUEST_GOLD' .. count), loc:Get('AD_QUEST_GOLD', count), 10, '-Inv_Misc_Coin_0' .. texture)
        ach:AddCriteria(criterias:Create(loc:Get('AC_QUEST_GOLD', count), TYPE.LOOT_QUEST_GOLD, nil, count * 10000):SetQuantityFormatter(function(current, required)
            return GetCoinTextureString(current) .. ' / ' .. GetCoinTextureString(required)
        end))
        if previous then previous:SetNext(ach) end
        previous = ach
    end
	
	-- KEYs
    if UnitFactionGroup('player') == 'Horde' then
		ach = quests:CreateAchievement('AN_SKELETON_KEY', 'AD_SKELETON_KEY', 10, '-inv_misc_key_11', true)
	    ach:AddCriteria(criterias:Create(nil, TYPE.COMPLETE_QUEST, {5511}))
    else
		ach = quests:CreateAchievement('AN_SKELETON_KEY', 'AD_SKELETON_KEY', 10, '-inv_misc_key_11', true)
	    ach:AddCriteria(criterias:Create(nil, TYPE.COMPLETE_QUEST, {5505}))
    end	

    --ZONE QUESTS
	local function addZoneQuests(continent, parent, zoneName, questIDs, points, logo)
		if type(questIDs) ~= 'table' then questIDs = {questIDs} end
		local zname1, zname2 = loc:Get(zoneName .. '_1'), loc:Get(zoneName .. '_2')
		local name = loc:Get('AN_QUESTS_ZONE', zname2)
		local description
		if #questIDs == 1 then
			description = loc:Get('AD_QUESTS_ZONE', loc:Get('QUEST_' .. questIDs[1]), zname1)
		else
			description = loc:Get('AD_QUESTS_ZONE_MULTI', zname1)
		end

		local ach = continent:CreateAchievement(name, description, points, logo)
		if #questIDs == 1 then
			ach:AddCriteria(criterias:Create(nil, TYPE.COMPLETE_QUEST, questIDs))
		else
			for _, questID in pairs(questIDs) do
				ach:AddCriteria(criterias:Create(loc:Get('AC_QUESTS_ZONE', loc:Get('QUEST_' .. questID)), TYPE.COMPLETE_QUEST, {questID}))
			end
		end

        if(zoneName == 'BLACK_ROCK') then --create the Criteria but dont add it to the parent achievement. Necessary to don't mess up the database ids
		    criterias:Create(ach.name, TYPE.COMPLETE_ACHIEVEMENT, {ach.id})
        else
            parent:AddCriteria(criterias:Create(ach.name, TYPE.COMPLETE_ACHIEVEMENT, {ach.id}))
        end

		return ach
	end
   
    local kach = quests:CreateAchievement('AN_WISDOM_KEEPER_KALIMDOR', 'AD_WISDOM_KEEPER_KALIMDOR', 10, '-achievement_zone_kalimdor_01', true)
    questsKalimdor.add = function(self, ...) return addZoneQuests(self, kach, ...) end
    
    questsKalimdor:add('DUROTAR', 835, 10, '-achievement_zone_durotar')
    questsKalimdor:add('BARRENS', {888, 902}, 10, '-achievement_zone_barrens_01')
    questsKalimdor:add('STONETALON', 1096, 10, '-achievement_zone_stonetalon_01')
    questsKalimdor:add('DESOLACE', 6027, 10, '-achievement_zone_desolace')
    questsKalimdor:add('THOUSAND_NEEDLES', 1189, 10, '-achievement_zone_thousandneedles_01')
    questsKalimdor:add('DUSTWALLOW', 1203, 10, '-achievement_zone_dustwallowmarsh')
    questsKalimdor:add('FELWOOD', {5165, 5385}, 10, '-achievement_zone_felwood')
    questsKalimdor:add('TANARIS', {2662, 2874, 1691, 113}, 10, '-achievement_zone_tanaris_01')
    questsKalimdor:add('UNGORO', {3962, 4245, 4292}, 10, '-achievement_zone_ungorocrater_01')
    questsKalimdor:add('AZSHARA', 3602, 10, '-achievement_zone_azshara_01')
    questsKalimdor:add('WINTERSPRING', {975, 5082, 5121, 5163, 4842}, 10, '-achievement_zone_winterspring')
    questsKalimdor:add('SILITHUS', {8287, 8352, 8321, 8281}, 10, '-achievement_zone_silithus_01')    
    
    local ekach = quests:CreateAchievement('AN_WISDOM_KEEPER_EASTERN_KINGDOMS', 'AD_WISDOM_KEEPER_EASTERN_KINGDOMS', 10, '-achievement_zone_easternkingdoms_01', true)
    questsEasternKingdoms.add = function(self, ...) return addZoneQuests(self, ekach, ...) end

    questsEasternKingdoms:add('ARATHI', 652, 10, '-achievement_zone_arathihighlands_01')
    questsEasternKingdoms:add('STRANGLETHORN_VALLEY', {208, 600, 613, 628, 338}, 10, '-achievement_zone_stranglethorn_01')    
	if UnitFactionGroup('player') == 'Horde' then
		questsEasternKingdoms:add('BADLANDS', {737, 778, 656, 793}, 10, '-achievement_zone_badlands_01')
    else
		questsEasternKingdoms:add('BADLANDS', {737, 778, 656, 717}, 10, '-achievement_zone_badlands_01')
    end  
    questsEasternKingdoms:add('SEARING_GORGE', 3481, 10, '-achievement_zone_searinggorge_01')
    questsEasternKingdoms:add('BLASTED_LANDS', 3628, 10, '-achievement_zone_blastedlands_01')
    questsEasternKingdoms:add('WESTERN_PLAGUELANDS', {5944, 5051, 4985}, 10, '-achievement_zone_westernplaguelands_01')
	if UnitFactionGroup('player') == 'Horde' then
		questsEasternKingdoms:add('EASTERN_PLAGUELANDS', {5942, 6148, 5265}, 10, '-achievement_zone_easternplaguelands')
    else
		questsEasternKingdoms:add('EASTERN_PLAGUELANDS', {5942, 6187, 5265}, 10, '-achievement_zone_easternplaguelands')
    end    
    questsEasternKingdoms:add('BLACK_ROCK', 8996, 20, '-achievement_zone_blackrock_01')

    local wisdomAzeroth = quests:CreateAchievement('AN_WISDOM_KEEPER_AZEROTH', 'AD_WISDOM_KEEPER_AZEROTH', 20, '-Inv_Misc_Book_09', true)
        wisdomAzeroth:AddCriteria(criterias:Create(kach.name, TYPE.COMPLETE_ACHIEVEMENT, {kach.id}))
        wisdomAzeroth:AddCriteria(criterias:Create(ekach.name , TYPE.COMPLETE_ACHIEVEMENT, {ekach.id}))
		
	local nesingwaryQuests = questsEasternKingdoms:CreateAchievement('AN_NESINGWARY', 'AD_NESINGWARY', 10, '-ability_mount_whitetiger', true)
		nesingwaryQuests:AddCriteria(criterias:Create(nil, TYPE.COMPLETE_QUEST, {338, 208}))	
	
    --TBC
    local function create(zoneName, questIDs)
        local builder = L:Achievement(outlandQuests, 10, zoneName)
			:NameDesc('AN_QUESTS_' .. string.upper(zoneName), 'AD_QUESTS_' .. string.upper(zoneName), true)
        
        for _, questID in pairs(questIDs) do
            if type(questID) == 'table' then
                local first = L:Criteria(TYPE.COMPLETE_QUEST, {questID[1]}):Build()
                local second = L:Criteria(TYPE.COMPLETE_QUEST, {questID[2]}):Build()
                builder:Criteria(TYPE.OR, {first, second}):Name('TBC_QUEST_' .. questID[1], true):Build()
            else
                builder:Criteria(TYPE.COMPLETE_QUEST, {questID}):Name('TBC_QUEST_' .. questID, true):Build()
            end
        end
		
		return builder:Build()
    end
 
    local hellfireHorde = create('hellfire_peninsula', {10388, 10389, 10876, 10258, 9406, 9370, 10351})
		hellfireHorde:SetHordeOnly()
	
    local hellfireAlliance = create('hellfire_peninsula', {10397, 10400, 9545, 10935, 10937, 9383, 10630, 10351})
		hellfireAlliance:SetAllianceOnly()
	   
    local zangarHorde = create('zangarmash', {9772, 9904, 10118, 9709, 9732, 9788, 9726})
		zangarHorde:SetHordeOnly()
    local zangarAlliance = create('zangarmash', {9803, 9783, 9902, 9709, 9732, 9788, 9726})
		zangarAlliance:SetAllianceOnly()
    
    local terrorkarHorde = create('terrokar', {10879, 10881, 10915, 9951, 10043})
		terrorkarHorde:SetHordeOnly()
    local terrorkarAlliance = create('terrokar', {10879, 10881, 10915, 9951, 10042})
		terrorkarAlliance:SetAllianceOnly()
    
    local nagrandHorde = create('nagrand', {10172, 9977, 9853, 9934, 9868, 9937, 9852, 9925})
		nagrandHorde:SetHordeOnly()
    local nagrandAlliance = create('nagrand', {9955, 9977, 9853, 9933, 9873, 10011, 9852, 9925})
		nagrandAlliance:SetAllianceOnly()
    
    local bladesHorde = create('blades_edge_mtns', {10505, 10742, 10867, 10748})
		bladesHorde:SetHordeOnly()
    local bladesAlliance = create('blades_edge_mtns', {10504, 10671, 10806, 10748})
		bladesAlliance:SetAllianceOnly()
    
    local nether = create('netherstorm', {{10409, 10507}, 10240, 10249, 10439, 10221, 10276})
    
    local shadow = create('shadowmoon', {{10744, 10745}, 11052, {10645, 10639}, {10651, 10692}, 10588, 10679, 10808})
    
    local function create(questIDs)
		--Change category to quests
        local builder = L:Achievement(outlandQuests, 10, '-achievement_zone_outland_01')
			:NameDesc('AN_WISDOM_KEEPER_OUTLAND', 'AD_WISDOM_KEEPER_OUTLAND', true)
        
		for _, achID in pairs(questIDs) do 
			builder:Criteria(TYPE.COMPLETE_ACHIEVEMENT, {achID}):Name(L:GetAchievementByID(achID).name):Build() 
		end
		
		return builder:Build()
    end

    local hordeOutlandQuests = create({hellfireHorde.id, zangarHorde.id, terrorkarHorde.id, nagrandHorde.id, bladesHorde.id, nether.id, shadow.id})
    hordeOutlandQuests:SetHordeOnly()
        
    local allianceOutlandQuests = create({hellfireAlliance.id, zangarAlliance.id, terrorkarAlliance.id, nagrandAlliance.id, bladesAlliance.id, nether.id, shadow.id})
    allianceOutlandQuests:SetAllianceOnly()
  
    local wisdomHorde = quests:CreateAchievement('AN_WISDOM_KEEPER', 'AD_WISDOM_KEEPER', 30, '-Inv_Misc_Book_07', true)
        wisdomHorde:AddCriteria(criterias:Create(wisdomAzeroth.name, TYPE.COMPLETE_ACHIEVEMENT, {wisdomAzeroth.id}))
        wisdomHorde:AddCriteria(criterias:Create(hordeOutlandQuests.name , TYPE.COMPLETE_ACHIEVEMENT, {hordeOutlandQuests.id}))
        hordeOutlandQuests:SetHordeOnly()
        wisdomHorde:SetRewardText(loc:Get('AR_WISDOM_KEEPER')) 
	wisdomHorde:SetHordeOnly()
	wisdomHorde:SetUnavailable()
	
    local wisdomAlliance = quests:CreateAchievement('AN_WISDOM_KEEPER', 'AD_WISDOM_KEEPER', 30, '-Inv_Misc_Book_07', true)
        wisdomAlliance:AddCriteria(criterias:Create(wisdomAzeroth.name, TYPE.COMPLETE_ACHIEVEMENT, {wisdomAzeroth.id}))
        wisdomAlliance:AddCriteria(criterias:Create(allianceOutlandQuests.name , TYPE.COMPLETE_ACHIEVEMENT, {allianceOutlandQuests.id}))
        wisdomAlliance:SetRewardText(loc:Get('AR_WISDOM_KEEPER'))		
	wisdomAlliance:SetAllianceOnly()
	wisdomAlliance:SetUnavailable()
	
	ach = outlandQuests:CreateAchievement('AN_HEMET_QUESTS_NAGRAND', 'AD_HEMET_QUESTS_NAGRAND', 10, '-ability_mount_ridingelekk', true, 526)
		ach:AddCriteria(criterias:Create(nil, TYPE.COMPLETE_QUEST, {9852}))

    --ATTUNEMENT    
	L:Achievement(outlandQuests, 10, '-inv_misc_key_02')
        :NameDesc('AN_ATTUNE_SHATTERED_HALLS', 'AD_ATTUNE_SHATTERED_HALLS', true)
        :Criteria(TYPE.OBTAIN_ITEM, {28395}):Build()
        :Build()
		
	L:Achievement(outlandQuests, 10, '-inv_datacrystal03')
        :NameDesc('AN_ATTUNE_ARCATRAZ', 'AD_ATTUNE_ARCATRAZ', true)
        :Criteria(TYPE.COMPLETE_QUEST, {10704}):Build()
        :Build()
		
	L:Achievement(outlandQuests, 10, '-inv_misc_key_07')
        :NameDesc('AN_ATTUNE_KARAZHAN', 'AD_ATTUNE_KARAZHAN', true)
        :Criteria(TYPE.COMPLETE_QUEST, {9837}):Build()
        :Build()
		
	L:Achievement(outlandQuests, 10, '-inv_misc_urn_01')
        :NameDesc('AN_ATTUNE_NIGHT_BANE', 'AD_ATTUNE_NIGHT_BANE', true)
        :Criteria(TYPE.OBTAIN_ITEM, {24140}):Build()
        :Build()
		
	L:Achievement(outlandQuests, 10, '-inv_trinket_naxxramas01')
        :NameDesc('AN_ATTUNE_SSC', 'AD_ATTUNE_SSC', true)
        :Criteria(TYPE.COMPLETE_QUEST, {10901}):Build()
        :Build()
		
	L:Achievement(outlandQuests, 10, '-inv_datacrystal11')
        :NameDesc('AN_ATTUNE_EYE', 'AD_ATTUNE_EYE', true)
        :Criteria(TYPE.COMPLETE_QUEST, {10888}):Build()
        :Build()
		
    L:Achievement(outlandQuests, 10, '-inv_potion_101')
        :NameDesc('AN_ATTUNE_HYJAL', 'AD_ATTUNE_HYJAL', true)
        :Criteria(TYPE.COMPLETE_QUEST, {10445}):Build()
        :Build()
		
	L:Achievement(outlandQuests, 10, '-inv_jewelry_amulet_04')
        :NameDesc('AN_ATTUNE_BLACK_TEMPLE', 'AD_ATTUNE_BLACK_TEMPLE', true)
        :Criteria(TYPE.OR, {L:Criteria(TYPE.OBTAIN_ITEM, {32649}):Build(), L:Criteria(TYPE.OBTAIN_ITEM, {32757}):Build()}):Build()
        :Build()    
end

-- EXPLORATION --
do
	local exploreAzeroth = exploration:CreateAchievement('AN_EXPLORE_AZEROTH', 'AD_EXPLORE_AZEROTH', 30, '-inv_misc_map02', true)

    local global = exploration:CreateAchievement('AN_EXPLORE_KALIMDOR', 'AD_EXPLORE_KALIMDOR', 20, '-achievement_zone_kalimdor_01', true)
    local function add(areaID, areaIDs, icon)
        local areaName = AreaTableLocale[areaID]
        ach = explorationKalimdor:CreateAchievement(loc:Get('AN_EXPLORE', areaName), loc:Get('AD_EXPLORE', areaName), 10, icon)
        for _, childrenID in pairs(areaIDs) do
			ach:AddCriteria(criterias:Create(AreaTableLocale[childrenID], TYPE.EXPLORE_AREA, {childrenID}))
        end
		
		--dont add TBC achievements to Kalimdor achievement
		if(areaID ~= 3524 and areaID ~= 3525) then
			global:AddCriteria(criterias:Create(ach.name, TYPE.COMPLETE_ACHIEVEMENT, {ach.id}))
		else
			ach:SetUnavailable()
		end
    end

    add(331, {441, 414, 2301, 413, 417, 416, 424, 415, 421, 418, 426, 419, 422, 438, 430, 434, 437}, '-achievement_zone_ashenvale_01')
    add(16, {1228, 1230, 2497, 1229, 1226, 1219, 1220, 1225, 1216, 1237, 1236, 1235, 1221, 1231, 1232, 1234, 1256, 1233, 1227}, '-achievement_zone_azshara_01')
    add(148, {443, 444, 456, 446, 447, 448, 450, 449, 442}, '-achievement_zone_darkshore_01')
    add(405, {608, 603, 599, 2407, 609, 2405, 607, 596, 2408, 606, 602, 604, 2198, 2406, 2404}, '-achievement_zone_desolace')
    add(14, {367, 366, 368, 372, 362, 816, 369, 370, 817, 1637, 363}, '-achievement_zone_durotar')
    add(15, {502, 496, 2302, 509, 511, 2079, 513}, '-achievement_zone_dustwallowmarsh')
    add(361, {1998, 1762, 2618, 1767, 1765, 1766, 2481, 1763, 2479, 2480, 2478, 1761}, '-achievement_zone_felwood')
    add(357, {1137, 1111, 1114, 1113, 1108, 1119, 1105, 2577, 2522, 1106, 1099, 1101, 1103, 1100, 1121, 1120}, '-achievement_zone_feralas')
    add(215, {818, 220, 396, 222, 360, 821, 820, 224, 404, 397, 819, 225, 1638, 398}, '-achievement_zone_mulgore_01')
    add(1377, {3425, 2743, 2744, 2737, 2740}, '-achievement_zone_silithus_01')
    add(406, {2537, 2539, 1076, 2540, 2541, 461, 460, 465, 464, 467, 2538}, '-achievement_zone_stonetalon_01')
    add(440, {979, 976, 977, 1937, 1336, 986, 1939, 985, 982, 1938, 1940, 983, 984, 981, 992, 987, 980, 990, 2300, 978}, '-achievement_zone_tanaris_01')
    add(141, {736, 186, 261, 259, 478, 260, 264, 266, 1657, 702, 188}, '-achievement_zone_darnassus')
    add(17, {382, 1703, 384, 383, 386, 1702, 1704, 379, 1699, 380, 388, 392, 391, 385, 1697, 387, 1700, 1698, 378, 390, 1701, 359, 1717, 1316, 381}, '-achievement_zone_barrens_01')
    add(400, {2097, 483, 484, 481, 2303, 439, 480, 482, 485}, '-achievement_zone_thousandneedles_01')
    add(490, {543, 539, 540, 1942, 1943, 538, 537}, '-achievement_zone_ungorocrater_01')
    add(618, {2243, 2251, 2253, 2245, 2255, 2250, 2247, 2244, 2242, 2241, 2249, 2256, 2246}, '-achievement_zone_winterspring')
    add(3524, {3526, 3857, 3576, 3571, 3564, 3915, 3577, 3916, 3573, 3567, 3568, 3575, 3639, 3572, 3557, 3574, 3570}, '-achievement_zone_azuremystisle_01')
    add(3525, {3597, 3593, 3594, 3585, 3612, 3584, 3600, 3602, 3908, 3910, 3592, 3601, 3591, 3599, 3603, 3604, 3906, 3589, 3588, 3595, 3596, 3909, 3586, 3587, 3907, 3608, 3590, 3598}, '-achievement_zone_bloodmystisle_01')
    exploreAzeroth:AddCriteria(criterias:Create(global.name, TYPE.COMPLETE_ACHIEVEMENT, {global.id}))

    global = exploration:CreateAchievement('AN_EXPLORE_EASTERN_KINGDOMS', 'AD_EXPLORE_EASTERN_KINGDOMS', 20, '-achievement_zone_easternkingdoms_01', true)
    add = function(areaID, areaIDs, icon)
        local areaName = AreaTableLocale[areaID]
        ach = explorationEasternKingdoms:CreateAchievement(loc:Get('AN_EXPLORE', areaName), loc:Get('AD_EXPLORE', areaName), 10, icon)
        for _, childrenID in pairs(areaIDs) do
                ach:AddCriteria(criterias:Create(AreaTableLocale[childrenID], TYPE.EXPLORE_AREA, {childrenID}))
        end
		
		--dont add TBC achievements to Eastern Kingdoms achievement
		if(areaID ~= 3430 and areaID ~= 3433 and areaID ~= 4080) then
			global:AddCriteria(criterias:Create(ach.name, TYPE.COMPLETE_ACHIEVEMENT, {ach.id}))
		else
			ach:SetUnavailable()
		end
    end

    add(36, {1679, 282, 279, 1682, 1357, 1677, 1683, 278, 1681, 281, 1678, 280, 1680, 284, 1684}, '-achievement_zone_alteracmountains_01')
    add(45, {313, 334, 1857, 1858, 327, 324, 880, 335, 320, 316, 317, 336, 315, 314, 321, 333}, '-achievement_zone_arathihighlands_01')
    add(3, {342, 339, 1879, 345, 337, 344, 1878, 340, 338, 1877, 346, 1898, 341, 1897}, '-achievement_zone_badlands_01')
    add(4, {1457, 1438, 1440, 72, 1441, 1439, 73, 2517, 1437}, '-achievement_zone_blastedlands_01')
    add(46, {2418, 249, 2417, 2420, 253, 250, 2421, 252, 254, 255}, '-achievement_zone_burningsteppes_01')
    add(41, {2561, 2562, 2697}, '-achievement_zone_deadwindpass')
    add(1, {801, 800, 802, 804, 138, 212, 803, 808, 134, 137, 135, 136, 211, 806, 809, 133}, '-achievement_zone_dunmorogh')
    add(10, {536, 94, 492, 93, 856, 245, 242, 241, 121, 42, 1098, 799, 1097}, '-achievement_zone_duskwood')
    add(139, {2260, 2261, 2263, 2258, 2262, 2622, 2264, 2621, 2266, 2268, 2623, 2270, 2271, 2624, 2272, 2273, 2275, 2276, 2627, 2277, 2279, 2619}, '-achievement_zone_easternplaguelands')
    add(12, {87, 9, 1519, 57, 797, 60, 62, 91, 798, 88, 86, 18}, '-achievement_zone_elwynnforest')
    add(267, {272, 1056, 290, 275, 294, 289, 286, 271, 288, 295, 896, 285}, '-achievement_zone_hillsbradfoothills')
    add(38, {146, 143, 149, 838, 147, 142, 936, 144, 923, 924, 556}, '-achievement_zone_lochmodan')
    add(44, {68, 1002, 1001, 95, 97, 70, 997, 996, 71, 1000, 69}, '-achievement_zone_redridgemountains')
    add(51, {246, 1957, 1444, 1958, 247, 1959, 1442}, '-achievement_zone_searinggorge_01')
    add(130, {927, 240, 226, 928, 172, 237, 228, 213, 229, 233, 236, 204, 230, 231, 238}, '-achievement_zone_silverpine_01')
    add(33, {100, 117, 99, 101, 43, 1738, 1737, 1739, 311, 477, 310, 128, 1741, 103, 127, 129, 105, 1740, 37, 125, 123, 104, 122, 102, 297, 19, 35}, '-achievement_zone_stranglethorn_01')
    add(8, {116, 657, 1780, 1798, 75, 74, 1797, 1778, 76, 300, 1777}, '-achievement_zone_swampsorrows_01')
    add(47, {1882, 348, 350, 1885, 1883, 353, 1886, 1884, 356, 355, 1917, 351, 307, 354}, '-achievement_zone_hinterlands_01')
    add(85, {156, 154, 810, 157, 166, 811, 164, 159, 165, 162, 459, 167, 812, 160, 1497, 152}, '-achievement_zone_tirisfalglades_01')
    add(28, {197, 193, 813, 199, 200, 202, 192, 190, 201, 198, 2620, 2297}, '-achievement_zone_westernplaguelands_01')
    add(40, {107, 108, 916, 109, 918, 111, 917, 113, 219, 20, 115, 921, 922, 920}, '-achievement_zone_westfall_01')
    add(11, {1018, 1022, 118, 1024, 1023, 309, 205, 1036, 1025, 1020, 1016, 1017, 150}, '-achievement_zone_wetlands_01')
    add(3430, {3431, 3533, 3466, 3461, 3465, 3467, 3464, 3470, 3480, 3462, 3471, 3476, 3474, 3487, 3472, 3558, 3912, 3473, 3913, 3914, 3468, 3460, 3469, 3911, 3475}, '-achievement_zone_eversongwoods')
    add(3433, {3488, 3489, 3490, 3491, 3494, 3493, 3495, 3496, 3502, 3500, 3517, 3508, 3492, 3501, 3856, 3861}, '-achievement_zone_ghostlands')
	add(4080, {4087, 4089, 4091, 4092, 4094, 4095}, '-achievement_zone_isleofqueldanas')
    exploreAzeroth:AddCriteria(criterias:Create(global.name, TYPE.COMPLETE_ACHIEVEMENT, {global.id}))
	
	ach = L:Achievement(general, 10, '-inv_jewelcrafting_crimsonhare')
		:NameDesc('AN_LOVE', 'AD_LOVE', true)
		for _, creatureID in pairs({3444, 620, 1420, 13321, 2620, 9600, 883, 9699, 4953, 721, 9700, 15476, 2914, 16030, 4075, 1412, 7390, 15475, 15010, 4076, 13016, 14881, 2110, 4166, 1933, 890, 2098, 2442, 6368, 6271, 385, 10685, 3300}) do
			ach:Criteria(TYPE.EMOTE, {'LOVE', creatureID}):Name('NPC_' .. creatureID, true):Build()
		end

    --TBC		
	global = exploration:CreateAchievement('AN_EXPLORE_OUTLAND', 'AD_EXPLORE_OUTLAND', 20, '-achievement_zone_outland_01', true)
    add = function(areaID, areaIDs, icon)
        local areaName = AreaTableLocale[areaID]
        ach = outlandExploration:CreateAchievement(loc:Get('AN_EXPLORE', areaName), loc:Get('AD_EXPLORE', areaName), 10, icon)
        for _, childrenID in pairs(areaIDs) do
                ach:AddCriteria(criterias:Create(AreaTableLocale[childrenID], TYPE.EXPLORE_AREA, {childrenID}))
        end
        global:AddCriteria(criterias:Create(ach.name, TYPE.COMPLETE_ACHIEVEMENT, {ach.id}))
    end
	
	add(3483, {3539, 3546, 3554, 3545, 3538, 3555, 3553, 3551, 3552, 3804, 3536, 3547, 3582, 3556, 3797, 3802, 3796, 3541}, 'hellfire_peninsula')
    add(3521, {3565, 3650, 3642, 3667, 3656, 3646, 3644, 3648, 3659, 3720, 3641, 3649, 3651, 3818, 3766, 3647, 3645, 3841}, 'zangarmash')
    add(3519, {3719, 3684, 3674, 3681, 3682, 3683, 3675, 3703, 3860, 3696, 3858, 3685, 3689, 3891, 3676, 3893, 3888, 3677, 3678, 3693, 3679}, 'terrokar')
    add(3518, {3624, 3613, 3628, 3637, 3616, 3631, 3622, 3626, 3638, 3615, 3617, 3610, 3611, 3625, 3629, 3764, 3762, 3634, 3763}, 'nagrand')
    add(3522, {3864, 3867, 3773, 3777, 3776, 3863, 3775, 3831, 3787, 3784, 3785, 3781, 3774, 3768, 3844, 3830, 3833, 3828, 3866, 3772, 3865, 3769, 3782, 3829, 3827, 3832}, 'blades_edge_mtns')
    add(3523, {3712, 3726, 3730, 3734, 3722, 3736, 3741, 3842, 3729, 3723, 3737, 3732, 3850, 3725, 3837, 3738, 3868, 3874, 3877, 3878, 3742, 3739}, 'netherstorm')
    add(3520, {3750, 3822, 3743, 3759, 3744, 3840, 3748, 3746, 3821, 3745, 3754, 3752, 3758}, 'shadowmoon')
	
	global:SetUnavailable()
	--exploreAzeroth:AddCriteria(criterias:Create(global.name, TYPE.COMPLETE_ACHIEVEMENT, {global.id}))  
    exploreAzeroth:SetRewardText(loc:Get('AR_EXPLORER'))  
    
    local rareIDs = {18695, 18682, 18697, 18681, 18694, 18689, 18686, 18698, 18678, 17144, 18692, 18696, 18680, 18677, 18690, 20932, 18685, 18693, 18683, 18679}
    local function preBuild(name, points)
        local builder = L:Achievement(outlandExploration, points, '-Spell_Shadow_DeathScream')
        :NameDesc('AN_' .. name, 'AD_' .. name, true)
        for _, npcID in pairs(rareIDs) do
            builder:Criteria(TYPE.KILL_NPC, {npcID}):Name('TBC_NPC_' .. npcID, true):Build()
        end
        return builder
    end

    local ach = preBuild('MIDDLE_RARE', 10):Build()
    ach:SetAnyCompletable()

    preBuild('BLOODY_RARE', 20):Previous(ach):Build()
end

-- PVP -- 
do
	local alteracID = 1459
	local warsongID = 1460
	local arathiID = 1461
	local eyeID = 1956
	
    local pvpIcon
    local previous = nil

    local factionLetter
    if UnitFactionGroup('player') == 'Horde' then
        factionLetter = 'H'
    else
        factionLetter = 'A'
    end

    for i = 1, 14 do
        if i <= 9 then pvpIcon = '-achievement_pvp_o_0'
        else pvpIcon = '-achievement_pvp_o_' end

        local ach = featsOfStrength:CreateAchievement(
            'AN_PVP_RANK_' .. factionLetter .. i,
            'AD_PVP_RANK', -- description set dynamically
            0,
            pvpIcon .. i,
            true
        )

        -- Build description from the achievement title
        local title = ach.name
        local desc = string.format(loc:Get('AD_PVP_RANK'), title)
        ach.description = desc

        ach:AddCriteria(criterias:Create(nil, TYPE.REACH_PVP_RANK, { i }))

        if previous then
            previous:SetNext(ach)
        end
        previous = ach
    end

    local previous = pvp:CreateAchievement('AN_PVP_FIRST_KILL', 'AD_PVP_FIRST_KILL', 10, '-achievement_pvp_p_01', true)
    previous:AddCriteria(criterias:CreateL('AC_PVP_FIRST_KILL', TYPE.KILL_PLAYERS, nil, 1))
    for i, count in pairs({10, 100, 250, 500, 1000, 2500, 5000, 10000, 25000, 50000, 100000, 250000, 500000}) do
		if i <= 8 then pvpIcon = '-achievement_pvp_p_0'
        else pvpIcon = '-achievement_pvp_p_' end
	
        ach = pvp:CreateAchievement(FormatNumbersInString(loc:Get('AN_PVP_KILLS', count)), FormatNumbersInString(loc:Get('AD_PVP_KILLS', count)), 10, pvpIcon .. (i + 1))
        ach:AddCriteria(criterias:Create(FormatNumbersInString(loc:Get('AC_PVP_KILLS', count)), TYPE.KILL_PLAYERS, nil, count))
        previous:SetNext(ach)
        previous = ach
    end
	previous = nil
	
	local function add(category, factionID, factionName, points, icon)
        local ach = category:CreateAchievement(loc:Get('AN_' .. factionName), loc:Get('AD_' .. factionName), points or 10, icon or string.lower(factionName))
			ach:AddCriteria(criterias:Create(nil, TYPE.REACH_REPUTATION, {factionID, 8}))
        return ach
    end

    local ach1 = add(arathi, 510, 'DEFILERS', 10, '-spell_shadow_psychichorrors')
    ach1:SetHordeOnly()
    local ach2 = add(alterac, 729, 'FROSTWOLF_CLAN', 10, '-Inv_Jewelry_FrostwolfTrinket_05')
    ach2:SetHordeOnly()
    local ach3 = add(warsong, 889, 'WARSONG_OUTRIDERS', 10, '-ability_warrior_warcry')
    ach3:SetHordeOnly()

    ach = pvp:CreateAchievement(loc:Get('AN_HORDE_PVP_FRACTIONS'), loc:Get('AD_HORDE_PVP_FRACTIONS'), 10, '-inv_misc_tabardpvp_04')
    ach:AddCriteria(criterias:Create(ach1.name, TYPE.COMPLETE_ACHIEVEMENT, {ach1.id}))
    ach:AddCriteria(criterias:Create(ach2.name, TYPE.COMPLETE_ACHIEVEMENT, {ach2.id}))
    ach:AddCriteria(criterias:Create(ach3.name, TYPE.COMPLETE_ACHIEVEMENT, {ach3.id}))
    ach:SetHordeOnly()

    ach1 = add(arathi, 509, 'LEAGUE_OF_ARATHOR', 10, '-ability_warrior_rallyingcry')
    ach1:SetAllianceOnly()
    ach2 = add(alterac, 730, 'STORMSPIKE_GUARD', 10, '-Inv_Jewelry_Stormpiketrinket_05')
    ach2:SetAllianceOnly()
    ach3 = add(warsong, 890, 'SILVERWING_SENTINELS', 10, '-Ability_Racial_Shadowmeld')
    ach3:SetAllianceOnly()

    ach = pvp:CreateAchievement(loc:Get('AN_ALLIANCE_PVP_FRACTIONS'), loc:Get('AD_ALLIANCE_PVP_FRACTIONS'), 10, '-inv_misc_tabardpvp_03')
    ach:AddCriteria(criterias:Create(ach1.name, TYPE.COMPLETE_ACHIEVEMENT, {ach1.id}))
    ach:AddCriteria(criterias:Create(ach2.name, TYPE.COMPLETE_ACHIEVEMENT, {ach2.id}))
    ach:AddCriteria(criterias:Create(ach3.name, TYPE.COMPLETE_ACHIEVEMENT, {ach3.id}))
    ach:SetAllianceOnly()
    
    add = function(npcID, name, icon)
        local ach = pvp:CreateAchievement(loc:Get('AN_' .. name .. '_SLAYER'), loc:Get('AD_' .. name .. '_SLAYER'), 10, icon)
        ach:AddCriteria(criterias:Create(nil, TYPE.KILL_NPC, {npcID}))
        return ach
    end
    
    ach1 = add(1748, 'BOLVAR', '-achievement_leader_king_varian_wrynn')
    ach1:SetHordeOnly()
    ach2 = add(2784, 'MAGNI', '-Achievement_leader_king_magni_bronzebeard')
    ach2:SetHordeOnly()
    local ach4 = add(7999, 'TYRANDE', '-achievement_leader_tyrande_whisperwind')
    ach4:SetHordeOnly()
    local ach5 = add(17468, 'VELEN', '-Achievement_leader_prophet_velen')
    ach5:SetHordeOnly()
	ach5:SetUnavailable()
    ach = pvp:CreateAchievement(loc:Get('AN_ALLIANCE_KINGS_SLAYER'), loc:Get('AD_ALLIANCE_KINGS_SLAYER'), 20, '-inv_bannerpvp_01')
    ach:AddCriteria(criterias:Create(ach1.name, TYPE.COMPLETE_ACHIEVEMENT, {ach1.id}))
    ach:AddCriteria(criterias:Create(ach2.name, TYPE.COMPLETE_ACHIEVEMENT, {ach2.id}))
    ach:AddCriteria(criterias:Create(ach4.name, TYPE.COMPLETE_ACHIEVEMENT, {ach4.id}))
    --ach:AddCriteria(criterias:Create(ach5.name, TYPE.COMPLETE_ACHIEVEMENT, {ach5.id}))
    ach:SetHordeOnly()

    ach1 = add(4949, 'THRALL', 'Achievement_Leader_ Thrall')
    ach1:SetAllianceOnly()
    ach3 = add(10181, 'SYLVANAS', '-Achievement_leader_sylvanas')
    ach3:SetAllianceOnly()
    ach4 = add(3057, 'CAIRNE', 'Achievement_Leader_Cairne Bloodhoof')
    ach4:SetAllianceOnly()
    ach5 = add(16802, 'LORTHEMAR', 'Achievement_Leader_Lorthemar_Theron')
    ach5:SetAllianceOnly()
    ach5:SetUnavailable()
    ach = pvp:CreateAchievement(loc:Get('AN_HORDE_KINGS_SLAYER'), loc:Get('AD_HORDE_KINGS_SLAYER'), 20, '-inv_bannerpvp_02')
    ach:AddCriteria(criterias:Create(ach1.name, TYPE.COMPLETE_ACHIEVEMENT, {ach1.id}))
    ach:AddCriteria(criterias:Create(ach3.name, TYPE.COMPLETE_ACHIEVEMENT, {ach3.id}))
    ach:AddCriteria(criterias:Create(ach4.name, TYPE.COMPLETE_ACHIEVEMENT, {ach4.id}))
    --ach:AddCriteria(criterias:Create(ach5.name, TYPE.COMPLETE_ACHIEVEMENT, {ach5.id}))
    ach:SetAllianceOnly()

    ach = pvp:CreateAchievement(loc:Get('AN_RACES_KILLER'), loc:Get('AD_ALLIANCE_RACES_KILLER'), 10, '-Ability_Gouge')
    for _, race in pairs({'HUMAN', 'NIGHTELF', 'DWARF', 'GNOME'--[[, 'DRAENEI']]}) do
        ach:AddCriteria(criterias:CreateL('AC_' .. race .. '_KILLED', TYPE.KILL_PLAYER_OF_RACE, {race}))
    end
    ach:SetHordeOnly()

    ach = pvp:CreateAchievement(loc:Get('AN_RACES_KILLER'), loc:Get('AD_HORDE_RACES_KILLER'), 10, '-Ability_Gouge')
    for _, race in pairs({'ORC', 'TROLL', 'SCOURGE', 'TAUREN'--[[, 'BLOODELF']]}) do
        ach:AddCriteria(criterias:CreateL('AC_' .. race .. '_KILLED', TYPE.KILL_PLAYER_OF_RACE, {race}))
    end
    ach:SetAllianceOnly()

    ach = pvp:CreateAchievement(loc:Get('AN_CLASSES_KILLER'), loc:Get('AD_CLASSES_KILLER'), 10, '-Ability_Cheapshot')
    for _, class in pairs({'WARRIOR', 'HUNTER', 'ROGUE', 'PRIEST', 'MAGE', 'WARLOCK', 'DRUID', 'PALADIN', 'SHAMAN'}) do
        ach:AddCriteria(criterias:CreateL('AC_' .. class .. '_KILLED', TYPE.KILL_PLAYER_OF_CLASS, {class}))
    end
	
	local function _add(category, mapID, mapName, typeName, type, additionalParam, amounts, icon)
        previous = nil
        for _, amount in pairs(amounts) do
            local name, desc
            if amount == 1 then
                name = loc:Get('AN_' .. mapName .. '_' .. typeName)
                desc = loc:Get('AD_' .. mapName .. '_' .. typeName)
            else
                name = loc:Get('AN_' .. mapName .. '_' .. typeName .. 'S')
                desc = loc:Get('AD_' .. mapName .. '_' .. typeName .. 'S', amount)
            end
            ach = category:CreateAchievement(name, desc, 10, icon)
            local params
            if mapID == nil then
                params = nil
            else
                params = {mapID}
                if additionalParam then params[2] = additionalParam end
            end
            if amount == 1 then desc = nil end
            ach:AddCriteria(criterias:Create(desc, type, params, amount))
            if previous then previous:SetNext(ach) end
            previous = ach
        end
        return ach
    end

    local function add(category, mapID, mapName, icon)
        return _add(category, mapID, mapName, 'WIN', TYPE.BATTLEFIELD_WINS, nil, {1, 5, 10, 25, 50}, icon)
    end

    local alteracWins = add(alterac, alteracID, 'ALTERAC', '-achievement_bg_winav')
    local warsongWins = add(warsong, warsongID, 'WARSONG', '-achievement_bg_winwsg')
    local arathiWins = add(arathi, arathiID, 'ARATHI', '-achievement_bg_winab')
    local eyeWins = add(bgEye, eyeID, 'EYE', '-achievement_bg_wineos')

    add = function(typeName, type, additionalParam, amounts, icon)
        return _add(alterac, alteracID, 'ALTERAC', typeName, type, additionalParam, amounts, icon)
    end

    local alterac1 = add('KILLING_BLOW', TYPE.BATTLEFIELD_SCORE_MAX, 1, {5, 10, 25, 40}, '-Spell_Shadow_Summonimp')
    local alterac2 = add('GRAVEYARD_ASSAULT', TYPE.BATTLEFIELD_STAT_MAX, 1, {1, 2, 3, 4}, '-Spell_Holy_Divinespirit')
    local alterac3 = add('GRAVEYARD_DEFEND', TYPE.BATTLEFIELD_STAT_MAX, 2, {1, 2, 3, 4}, '-Spell_Holy_Prayerofspirit')
    local alterac4 = add('TOWER_ASSAULT', TYPE.BATTLEFIELD_STAT_MAX, 3, {1, 2, 3, 4}, '-Ability_Thunderbolt')
    local alterac5 = add('TOWER_DEFEND', TYPE.BATTLEFIELD_STAT_MAX, 4, {1, 2, 3, 4}, '-Inv_Shield_05')
    local alterac6 = _add(alterac, nil, 'ALTERAC', 'MINE_CAPTURE', TYPE.ALTERAC_VALLEY_MINE_CAPTURE_MAX, nil, {1, 2, 3, 4}, '-Inv_Pick_01')
	local alterac7 = L:Achievement(alterac, 10, '-achievement_bg_winav_underxminutes')
		:NameDesc('AN_ALTERAC_FAST_WIN', 'AD_ALTERAC_FAST_WIN', true)
		:Criteria(TYPE.BATTLEFIELD_FAST_WIN, {alteracID}):Build()
		:Build()

    add = function(typeName, type, additionalParam, amounts, icon)
        return _add(warsong, warsongID, 'WARSONG', typeName, type, additionalParam, amounts, icon)
    end

    local warsong1 = add('KILL', TYPE.BATTLEFIELD_SCORE_MAX, 2, {10, 25, 50, 75}, '-Ability_Rogue_Eviscerate')
    local warsong2 = add('FLAG_CAPTURE', TYPE.BATTLEFIELD_STAT_MAX, 1, {1, 2, 3}, '-Inv_Banner_03')
    local warsong3 = add('FLAG_RETURN', TYPE.BATTLEFIELD_STAT_MAX, 2, {1, 2, 3}, '-Spell_Nature_Reincarnation')
	local warsong4 = L:Achievement(warsong, 10, '-achievement_bg_winwsg_underxminutes')
		:NameDesc('AN_WARSONG_FAST_WIN', 'AD_WARSONG_FAST_WIN', true)
		:Criteria(TYPE.BATTLEFIELD_FAST_WIN, {warsongID}):Build()
		:Build()

    add = function(typeName, type, additionalParam, amounts, icon)
        return _add(arathi, arathiID, 'ARATHI', typeName, type, additionalParam, amounts, icon)
    end

    local arathi1 = add('BASE_ASSAULT', TYPE.BATTLEFIELD_STAT_MAX, 1, {1, 2, 3, 4}, '-Ability_Eyeoftheowl')
    local arathi2 = add('BASE_DEFEND', TYPE.BATTLEFIELD_STAT_MAX, 2, {1, 2, 3, 4}, '-Inv_Shield_06')	
	local arathi3
    if UnitFactionGroup('player') == 'Horde' then
        arathi3 = L:Achievement(arathi, 10, '-ability_hunter_catlikereflexes')
            :NameDesc('AN_ARATHI_CATS', 'AD_ARATHI_CATS', true)
            :Criteria(TYPE.EMOTE, {'PAT', 15071}):Name('NPC_15071', true):Build()
            :Criteria(TYPE.EMOTE, {'PAT', 15072}):Name('NPC_15072', true):Build()
            :Build()
    else
        arathi3 = L:Achievement(arathi, 10, '-ability_hunter_catlikereflexes')
            :NameDesc('AN_ARATHI_CATS', 'AD_ARATHI_CATS', true)
            :Criteria(TYPE.EMOTE, {'PAT', 15065}):Name('NPC_15065', true):Build()
            :Criteria(TYPE.EMOTE, {'PAT', 15066}):Name('NPC_15066', true):Build()
            :Build()
    end

	local arathi4 = L:Achievement(arathi, 10, '-achievement_bg_winab_underxminutes')
		:NameDesc('AN_ARATHI_FAST_WIN', 'AD_ARATHI_FAST_WIN', true)
		:Criteria(TYPE.BATTLEFIELD_FAST_WIN, {arathiID}):Build()
		:Build()

	local function add(category, mapID, statID, name, icon, count)
		local temp_ach = 
			L:Achievement(category, 10, icon)
				:Name('AN_' .. name .. '_TOTAL', true)
				:Desc('AD_' .. name .. '_TOTAL', true, count)
				:Criteria(TYPE.BATTLEFIELD_STAT, {mapID, statID}, count):Name('AD_' .. name .. '_TOTAL', true, count):Build()
				:Build()
			
		return temp_ach
	end

	local alterac8 = add(alterac, alteracID, 4, 'ALTERAC_TOWER_DEFEND', '-achievement_bg_defendxtowers_av', 50)
	local alterac9 = add(alterac, alteracID, 1, 'ALTERAC_GRAVEYARD_ASSAULT', '-achievement_bg_xkills_avgraveyard', 50)
	local warsong5 = add(warsong, warsongID, 1, 'WARSONG_FLAG_CAPTURE', '-achievement_bg_captureflag_wsg', 50)
	local warsong6 = add(warsong, warsongID, 2, 'WARSONG_FLAG_RETURN', '-achievement_bg_interruptx_flagcapture_attempts', 50)
	local arathi5 = add(arathi, arathiID, 1, 'ARATHI_BASE_ASSAULT', '-achievement_bg_takexflags_ab', 50)
	local arathi6 = add(arathi, arathiID, 2, 'ARATHI_BASE_DEFEND', '-ability_warrior_victoryrush', 50)

    local arathi7 = arathi:CreateAchievement('AN_ARATHI_CLOSE', 'AD_ARATHI_CLOSE', 10, '-spell_shadow_improvedvampiricembrace', true, 578)
		arathi7:AddCriteria(criterias:Create(nil, TYPE.BG_POINTS, {arathiID, 2000, 1990}, nil, 5781))

    local arathi8 = arathi:CreateAchievement('AN_ARATHI_PERFECT', 'AD_ARATHI_PERFECT', 10, '-achievement_bg_abshutout', true, 579)
		arathi8:AddCriteria(criterias:Create(nil, TYPE.BG_POINTS, {arathiID, 2000, 0}, nil, 5791))

	local frostwolf = L:Achievement(alterac, 10, '-inv_jewelry_frostwolftrinket_01')
		:NameDesc('AN_ALTERAC_MOUNT_HORDE', 'AD_ALTERAC_MOUNT_HORDE', true)
		:Criteria(TYPE.OBTAIN_ITEM, {19029}):Build()
		:Build()
	frostwolf:SetHordeOnly()			

	local stormpike = L:Achievement(alterac, 10, '-inv_jewelry_stormpiketrinket_01')
		:NameDesc('AN_ALTERAC_MOUNT_ALLIANCE', 'AD_ALTERAC_MOUNT_ALLIANCE', true)
		:Criteria(TYPE.OBTAIN_ITEM, {19030}):Build()
		:Build()		
	stormpike:SetAllianceOnly()	

	local function add(category, name, icon, ids)
		ach = L:Achievement(category, 10, icon)
				:NameDesc('AN_' .. name, 'AD_' .. name, true)
		
		for _, id in pairs(ids) do 
			ach:CompleteAchievementCriteria(id) 		
		end	
		
		return ach:Build()
	end

    --TBC
    local function flagCapture(count, prev)
        local desc
        if count == 1 then
            desc = loc:Get('AD_EYE_CAPTURE')
        else
            desc = loc:Get('AD_EYE_CAPTURES', count)
        end
        local builder = L:Achievement(bgEye, 10, '-achievement_bg_captureflag_eos')
			:Name('AN_EYE_CAPTURE', true)
			:Desc(desc)
			:Criteria(TYPE.BATTLEFIELD_STAT_MAX, {eyeID, 1}, count):Name(desc):Build()
        if prev then builder:Previous(prev) end
        return builder:Build()
    end
    local eye1 = flagCapture(1)
    eye1 = flagCapture(2, eye1)
    eye1 = flagCapture(3, eye1)
    
    local eye2 = L:Achievement(bgEye, 10, '-Spell_Arcane_MassDispel')
        :NameDesc('AN_EYE_GLORY', 'AD_EYE_GLORY', true)
        :Criteria(TYPE.BG_EYE_GLORY, {}):Build()
        :Build()
    
    local eye3 = L:Achievement(bgEye, 10, '-Spell_Nature_BloodLust')
        :NameDesc('AN_EYE_BERSERK', 'AD_EYE_BERSERK', true)
        :Criteria(TYPE.BG_EYE_BERSERK, {}):Build()
        :Build()
    
    local eye4 = L:Achievement(bgEye, 10, '-inv_brd_banner')
        :NameDesc('AN_EYE_IDEAL_VICTORY', 'AD_EYE_IDEAL_VICTORY', true)
        :Criteria(TYPE.BG_POINTS, {eyeID, 1500, 0}):Build()
        :Build()
    
    local eye5 = L:Achievement(bgEye, 10, '-achievement_bg_wineos_underxminutes')
        :NameDesc('AN_EYE_FAST_WIN', 'AD_EYE_FAST_WIN', true)
        :Criteria(TYPE.BATTLEFIELD_FAST_WIN, {eyeID}):Build()
        :Build()

    local alterac10 = alterac:CreateAchievement('AN_ALTERAC_AUTOGRAPH', 'AD_ALTERAC_AUTOGRAPH', 10, '-inv_scroll_10', true, 577)
		alterac10:AddCriteria(criterias:Create(nil, TYPE.OBTAIN_ITEM, {18228}))    

	local alteracBoss
	if factionLetter == 'H' then	
		alteracBoss = add(alterac, 'ALTERAC_BOSS', '-inv_jewelry_necklace_21', {alteracWins.id, alterac1.id, alterac2.id, alterac3.id, alterac4.id, alterac5.id, alterac6.id, alterac7.id, alterac8.id, alterac9.id, frostwolf.id})
	else
		alteracBoss = add(alterac, 'ALTERAC_BOSS', '-inv_jewelry_necklace_21', {alteracWins.id, alterac1.id, alterac2.id, alterac3.id, alterac4.id, alterac5.id, alterac6.id, alterac7.id, alterac8.id, alterac9.id, stormpike.id})
	end
	local warsongBoss = add(warsong, 'WARSONG_BOSS', '-inv_misc_rune_07', {warsongWins.id, warsong1.id, warsong2.id, warsong3.id, warsong4.id, warsong5.id, warsong6.id})
	local arathiBoss = add(arathi, 'ARATHI_BOSS', '-inv_jewelry_amulet_07', {arathiWins.id, arathi1.id, arathi2.id, arathi3.id, arathi4.id, arathi5.id, arathi6.id})
    local eyeBoss = add(bgEye, 'EYE_BOSS', '-Spell_Nature_EyeoftheStorm', {eyeWins.id, eye1.id, eye2.id, eye3.id, eye4.id, eye5.id})

	L:Achievement(pvp, 40, '-achievement_pvp_a_15')
		:NameDesc('AN_BATTLEMASTER', 'AD_BATTLEMASTER', true)
		:CompleteAchievementCriteria(alteracBoss)
		:CompleteAchievementCriteria(warsongBoss)
		:CompleteAchievementCriteria(arathiBoss)
        --:CompleteAchievementCriteria(eyeBoss)
		:Reward('AR_BATTLEMASTER', true)
		:Build()		
		
	--MISC	
	ach = nil
	for _, bgs in pairs({10, 25, 50}) do
		ach = L:Achievement(pvp, 10, '-Inv_Musket_02')
				:Name('AN_PARTICIPATE_IN_BGS', true)
				:Desc('AD_PARTICIPATE_IN_BGS', true, bgs)
				:Criteria(TYPE.BATTLEFIELD_MAX_LEVEL_PARTICIPATION, nil, bgs):Name('AC_PARTICIPATE_IN_BGS', true, bgs):Build()
				:Previous(ach)
				:Build()
	end
	
	add = function(typeName, type, param, amounts, icon)
        return _add(pvp, param, 'BGS', typeName, type, nil, amounts, icon)
    end

    add('KILLING_BLOW', TYPE.BATTLEFIELDS_SCORE, 1, {100, 250, 500, 750, 1000}, '-Spell_Shadow_Unholyfrenzy')
    add('KILL', TYPE.BATTLEFIELDS_SCORE, 2, {100, 250, 500, 750, 1000}, '-Ability_Warrior_Innerrage')
	
	ach = L:Achievement(pvp, 10, '-Inv_Misc_ArmorKit_14')
		:NameDesc('AN_GURUBASHI_1', 'AD_GURUBASHI_1', true)
		:Criteria(TYPE.COMPLETE_QUEST, {7810}):Build()
		:Build()
		ach.priority = 2

	L:Achievement(pvp, 10, '-Inv_Misc_ArmorKit_04')
		:NameDesc('AN_GURUBASHI_2', 'AD_GURUBASHI_2', true)
		:Criteria(TYPE.OBTAIN_ITEM, {19024}):Build()
		:Build()
		.priority = 2	
	
	ach = L:Achievement(pvp, 10, '-ability_dualwieldspecialization')
		:NameDesc('AN_DUEL', 'AD_DUEL', true)
		:Criteria(TYPE.DUELS):Build()
		:Build()
		
	for _, wins in pairs({10, 25, 100}) do
    ach = L:Achievement(pvp, 10, '-ability_dualwieldspecialization')
            :Name('AN_DUELS_' .. wins, true)
            :Desc('AD_DUELS', true, wins)
            :Criteria(TYPE.DUELS, nil, wins):Name('AC_DUELS', true, wins):Build()
            :Previous(ach)
            :Build()
	end
end

-- PVE --
do
	local createPvE = function(category)
		return function(instanceName, icon, npcIDs, points)
			ach = category:CreateAchievement('AN_' .. instanceName, 'AD_' .. instanceName, points or 10, icon, true)
			if type(npcIDs) == 'table' then 
				for i, npcID in pairs(npcIDs) do
                    if type(npcID) == 'table' then
                        -- Grouped bosses (e.g. The Four Horsemen)
                        ach:AddCriteria(criterias:CreateL('AC_' .. instanceName .. i, TYPE.SPECIAL, {5}))
                    elseif npcID > 0 then
                        ach:AddCriteria(criterias:CreateL('AC_' .. instanceName .. i, TYPE.KILL_NPC, {npcID}))
                    else
                        ach:AddCriteria(criterias:Create(nil, TYPE.KILL_NPC, {-npcID}))
                    end
                end
			else
				ach:AddCriteria(criterias:Create(nil, TYPE.KILL_NPC, {npcIDs}))
			end
			return ach
		end
	end

	local brd, brs, defender

	local create = createPvE(instances)
	local rc = create('RAGEFIRE_CHASM', '-spell_shadow_summonfelguard', 11520).id
	local wc = create('WAILING_CAVERNS', '-Achievement_boss_mutanus_the_devourer', 3654).id
	local dm = create('DEAD_MINES', '-achievement_boss_edwinvancleef', 639).id
	local sk = create('SHADOWFANG_KEEP', '-achievement_boss_archmagearugal', 4275).id
	local bfd = create('BLACKFATHOM_DEEPS', '-achievement_boss_bazil_akumai', 4829).id
	local jail = create('JAIL', '-Achievement_boss_bazil_thredd', 1716).id
	local gnom = create('GNOMREGAN', 'gnomeregan', 7800).id
	local rk = create('RAZORFEN_KRAUL', '-Achievement_boss_charlgarazorflank', 4421).id
	local sm = create('SCARLET_MONASTERY', '-inv_helmet_52', {4543, 6487, 3975, 3976, 3977}, 10).id
	local rd = create('RAZORFEN_DOWNS', '-achievement_boss_amnennar_the_coldbringer', 7358).id
	local uldaman = create('ULDAMAN', '-achievement_boss_archaedas', 2748).id
	local zf = create('ZULFARRAK', '-Achievement_boss_chiefukorzsandscalp', 7267).id
	local mara = create('MARAUDON', '-Achievement_boss_princesstheradras', 12201).id
	local st = create('SUNKEN_TEMPLE', '-achievement_boss_shadeoferanikus', 5709).id

	local id1 = create('NEW_EMPEROR', '-Achievement_boss_emperordagranthaurissan', 9019).id
	local id2 = create('BLACKROCK_DEPTHS', '-Spell_Fire_Lavaspawn', {9018, 9319, 9033, 8983, 9017, 9041, 9016}, 10).id
	local id3 = create('BLACKROCK_PARTY', '-inv_drink_05', {9543, 9499, 9537, 9502}, 10).id
	ach = instances:CreateAchievement('AN_ARMOR_SWORD', 'AD_ARMOR_SWORD', 10, '-Inv_Sword_47', true)
	ach:AddCriteria(criterias:Create(nil, TYPE.OBTAIN_ITEM, {11786}))
	local id4 = ach.id
	ach = instances:CreateAchievement('AN_BLACKROCK_DEPTHS_FULL', 'AD_BLACKROCK_DEPTHS_FULL', 10, '-Inv_Misc_AhnQirajTrinket_03', true)
	ach:AddCriteria(criterias:CreateL('AN_BLACKROCK_DEPTHS', TYPE.COMPLETE_ACHIEVEMENT, {id2}))
	ach:AddCriteria(criterias:CreateL('AN_BLACKROCK_PARTY', TYPE.COMPLETE_ACHIEVEMENT, {id3}))
	ach:AddCriteria(criterias:CreateL('AN_NEW_EMPEROR', TYPE.COMPLETE_ACHIEVEMENT, {id1}))
	ach:AddCriteria(criterias:CreateL('AN_ARMOR_SWORD', TYPE.COMPLETE_ACHIEVEMENT, {id4}))
	brd = ach.id

	id1 = create('BLACKROCK_SPIRE_BOTTOM', '-Achievement_boss_overlord_wyrmthalak', 9568).id
	id2 = create('BLACKROCK_SPIRE_UPPER', '-achievement_boss_generaldrakkisath', 10363).id
	ach = instances:CreateAchievement('AN_BLACKROCK_SPIRE', 'AD_BLACKROCK_SPIRE', 10, '-Inv_Sword_48', true)
	ach:AddCriteria(criterias:CreateL('AN_BLACKROCK_SPIRE_BOTTOM', TYPE.COMPLETE_ACHIEVEMENT, {id1}))
	ach:AddCriteria(criterias:CreateL('AN_BLACKROCK_SPIRE_UPPER', TYPE.COMPLETE_ACHIEVEMENT, {id2}))
	brs = ach.id

	local direm = create('DIRE_MAUL', '-Ability_Warrior_DecisiveStrike', {11492, 11496, 11501}).id

	local strat = create('STRATHOLME', '-spell_deathknight_armyofthedead', {10813, 10440}).id

	local scholo = create('SCHOLOMANCE', '-Spell_Holy_Senseundead', {1853, 10508}).id

	ach = pve:CreateAchievement('AN_YOUNG_DEFENDER', 'AD_YOUNG_DEFENDER', 10, '-spell_holy_revivechampion', true)
	ach:AddCriteria(criterias:CreateL('AN_RAGEFIRE_CHASM', TYPE.COMPLETE_ACHIEVEMENT, {rc}))
	ach:AddCriteria(criterias:CreateL('AN_WAILING_CAVERNS', TYPE.COMPLETE_ACHIEVEMENT, {wc}))
	ach:AddCriteria(criterias:CreateL('AN_DEAD_MINES', TYPE.COMPLETE_ACHIEVEMENT, {dm}))
	ach:AddCriteria(criterias:CreateL('AN_SHADOWFANG_KEEP', TYPE.COMPLETE_ACHIEVEMENT, {sk}))
	ach:AddCriteria(criterias:CreateL('AN_BLACKFATHOM_DEEPS', TYPE.COMPLETE_ACHIEVEMENT, {bfd}))
	ach:AddCriteria(criterias:CreateL('AN_JAIL', TYPE.COMPLETE_ACHIEVEMENT, {jail}))
	ach:AddCriteria(criterias:CreateL('AN_GNOMREGAN', TYPE.COMPLETE_ACHIEVEMENT, {gnom}))
	ach:AddCriteria(criterias:CreateL('AN_RAZORFEN_KRAUL', TYPE.COMPLETE_ACHIEVEMENT, {rk}))
	ach:AddCriteria(criterias:CreateL('AN_SCARLET_MONASTERY', TYPE.COMPLETE_ACHIEVEMENT, {sm}))
	ach:AddCriteria(criterias:CreateL('AN_RAZORFEN_DOWNS', TYPE.COMPLETE_ACHIEVEMENT, {rd}))
	ach:AddCriteria(criterias:CreateL('AN_ULDAMAN', TYPE.COMPLETE_ACHIEVEMENT, {uldaman}))
	ach:AddCriteria(criterias:CreateL('AN_ZULFARRAK', TYPE.COMPLETE_ACHIEVEMENT, {zf}))
	ach:AddCriteria(criterias:CreateL('AN_MARAUDON', TYPE.COMPLETE_ACHIEVEMENT, {mara}))
	ach:AddCriteria(criterias:CreateL('AN_SUNKEN_TEMPLE', TYPE.COMPLETE_ACHIEVEMENT, {st}))
	
	id1 = ach.id
	ach = pve:CreateAchievement('AN_DEFENDER', 'AD_DEFENDER', 10, '-achievement_dungeon_classicraider', true)
	ach:AddCriteria(criterias:CreateL('AN_YOUNG_DEFENDER', TYPE.COMPLETE_ACHIEVEMENT, {id1}))
	ach:AddCriteria(criterias:CreateL('AN_BLACKROCK_DEPTHS_FULL', TYPE.COMPLETE_ACHIEVEMENT, {brd}))
	ach:AddCriteria(criterias:CreateL('AN_BLACKROCK_SPIRE', TYPE.COMPLETE_ACHIEVEMENT, {brs}))
	ach:AddCriteria(criterias:CreateL('AN_DIRE_MAUL', TYPE.COMPLETE_ACHIEVEMENT, {direm}))
	ach:AddCriteria(criterias:CreateL('AN_STRATHOLME', TYPE.COMPLETE_ACHIEVEMENT, {strat}))
	ach:AddCriteria(criterias:CreateL('AN_SCHOLOMANCE', TYPE.COMPLETE_ACHIEVEMENT, {scholo}))
	ach:SetRewardText(loc:Get('AR_DEFENDER'))
	defender = ach.id	

    local create = createPvE(instances)
    local onyxia = create('ONYXIA', '-achievement_boss_onyxia', 10184).id
    local aq20 = create('AQ20', '-Achievement_boss_ossiriantheunscarred', 15339).id
    local zg = create('ZULGURUB', '-achievement_boss_hakkar', 14834).id
    local ragnaros = create('RAGNAROS', '-achievement_boss_ragnaros', 11502, 10).id
    local bwl = create('BLACK_WING_LAIR', '-Achievement_boss_nefarion', 11583, 10).id
    local aq40 = create('AQ40', '-Achievement_boss_cthun', 15727, 10).id
    local nx1 = create('NAXXRAMAS_SPIDERS', '-Inv_Trinket_Naxxramas04', {15956, 15953, 15952}).id
    local nx2 = create('NAXXRAMAS_PLAGUE', '-inv_misc_cauldron_nature', {15954, 15936, 16011}).id
    local nx3 = create('NAXXRAMAS_MILITARY', '-spell_deathknight_classicon', {16061, 16060, {16062, 16063, 16064, 16065}}, 10).id
    local nx4 = create('NAXXRAMAS_CONSTRUCT', '-ability_rogue_deviouspoisons', {16028, 15931, 15932, 15928}).id
    local nx5 = create('NAXXRAMAS_LAIR', '-inv_trinket_naxxramas06', 15990).id
    local nx6 = instances:CreateAchievement('AN_NAXXRAMAS_SAPPHIRON', 'AD_NAXXRAMAS_SAPPHIRON', 10, '-inv_misc_head_dragon_blue', true, 540)
		nx6:AddCriteria(criterias:Create(nil, TYPE.KILL_NPC, {15989}))
    ach = instances:CreateAchievement('AN_NAXXRAMAS', 'AD_NAXXRAMAS', 10, '-achievement_dungeon_naxxramas_10man', true)
    ach:AddCriteria(criterias:CreateL('AN_NAXXRAMAS_SPIDERS', TYPE.COMPLETE_ACHIEVEMENT, {nx1}))
    ach:AddCriteria(criterias:CreateL('AN_NAXXRAMAS_PLAGUE', TYPE.COMPLETE_ACHIEVEMENT, {nx2}))
    ach:AddCriteria(criterias:CreateL('AN_NAXXRAMAS_MILITARY', TYPE.COMPLETE_ACHIEVEMENT, {nx3}))
    ach:AddCriteria(criterias:CreateL('AN_NAXXRAMAS_CONSTRUCT', TYPE.COMPLETE_ACHIEVEMENT, {nx4}))
    ach:AddCriteria(criterias:CreateL('AN_NAXXRAMAS_LAIR', TYPE.COMPLETE_ACHIEVEMENT, {nx6.id}))
    ach:AddCriteria(criterias:CreateL('AN_NAXXRAMAS_LAIR', TYPE.COMPLETE_ACHIEVEMENT, {nx5}))
    local nx = ach.id

    ach = pve:CreateAchievement('AN_YOUNG_HERO', 'AD_YOUNG_HERO', 10, '-Achievement_dungeon_gloryofthehero', true)
    ach:AddCriteria(criterias:CreateL('AN_ONYXIA', TYPE.COMPLETE_ACHIEVEMENT, {onyxia}))
    ach:AddCriteria(criterias:CreateL('AN_AQ20', TYPE.COMPLETE_ACHIEVEMENT, {aq20}))
    ach:AddCriteria(criterias:CreateL('AN_ZULGURUB', TYPE.COMPLETE_ACHIEVEMENT, {zg}))
    local id = ach.id

    ach = instances:CreateAchievement('AN_BLACKROCK_MASTER', 'AD_BLACKROCK_MASTER', 10, '-achievement_dungeon_classicdungeonmaster', true)
    ach:AddCriteria(criterias:CreateL('AN_BLACKROCK_DEPTHS_FULL', TYPE.COMPLETE_ACHIEVEMENT, {brd}))
    ach:AddCriteria(criterias:CreateL('AN_BLACKROCK_SPIRE', TYPE.COMPLETE_ACHIEVEMENT, {brs}))
    ach:AddCriteria(criterias:CreateL('AN_RAGNAROS', TYPE.COMPLETE_ACHIEVEMENT, {ragnaros}))
    ach:AddCriteria(criterias:CreateL('AN_BLACK_WING_LAIR', TYPE.COMPLETE_ACHIEVEMENT, {bwl}))

    ach = pve:CreateAchievement('AN_HERO', 'AD_HERO', 10, '-Achievement_dungeon_heroic_gloryoftheraider', true)
    ach:AddCriteria(criterias:CreateL('AN_YOUNG_HERO', TYPE.COMPLETE_ACHIEVEMENT, {id}))
    ach:AddCriteria(criterias:CreateL('AN_RAGNAROS', TYPE.COMPLETE_ACHIEVEMENT, {ragnaros}))
    ach:AddCriteria(criterias:CreateL('AN_BLACK_WING_LAIR', TYPE.COMPLETE_ACHIEVEMENT, {bwl}))
    ach:AddCriteria(criterias:CreateL('AN_AQ40', TYPE.COMPLETE_ACHIEVEMENT, {aq40}))
    ach:AddCriteria(criterias:CreateL('AN_NAXXRAMAS', TYPE.COMPLETE_ACHIEVEMENT, {nx}))
    ach:SetRewardText(loc:Get('AR_HERO'))
    id = ach.id

    ach = pve:CreateAchievement('AN_GREAT_HERO', 'AD_GREAT_HERO', 10, '-Achievement_dungeon_gloryoftheraider', true)
    ach:AddCriteria(criterias:CreateL('AN_DEFENDER', TYPE.COMPLETE_ACHIEVEMENT, {defender}))
    ach:AddCriteria(criterias:CreateL('AN_HERO', TYPE.COMPLETE_ACHIEVEMENT, {id}))
    ach:SetRewardText(loc:Get('AR_GREAT_HERO'))
	
	local function add(name, creatureID, icon, fos)
        local category, points
        if fos then
            category = featsOfStrength
            points = 0
        else
            category = instances
            points = 10
        end
        return L:Achievement(category, points, icon)
                :NameDesc('AN_WB_' .. name, 'AD_WB_' .. name, true)
                :Criteria(TYPE.KILL_NPC, {creatureID}):Build()
                :Build()
    end

    add('AZUREGOS', 6109, '-achievement_boss_cyanigosa')
    add('KAZZAK', 12397, '-ability_warlock_demonicempowerment', true)
    local ysondre = add('YSONDRE', 14887, '-achievement_boss_valithradreamwalker')
    local lethon = add('LETHON', 14888, '-Achievement_boss_aeonus_01')
    local emeriss = add('EMERISS', 14889, '-Achievement_boss_malygos_01')
    local taerar = add('TAERAR', 14890, '-Achievement_boss_eregos')
	
    ach = L:Achievement(pve, 20, '-inv_misc_shadowegg')
            :NameDesc('AN_WB_EMERALD_DRAGONS', 'AD_WB_EMERALD_DRAGONS', true)
            :CompleteAchievementCriteria(ysondre)
            :CompleteAchievementCriteria(lethon)
            :CompleteAchievementCriteria(emeriss)
            :CompleteAchievementCriteria(taerar)
            :Reward('AR_WB_EMERALD_DRAGONS', true)
            :Build()			
			
	L:Achievement(instances, 20, '-ability_mount_drake_red')
		:NameDesc('AN_LEEROY', 'AD_LEEROY', true)
		:Criteria(TYPE.SPECIAL, {1}):Build()
		:Reward('AR_LEEROY', true)
		:Build()

	L:Achievement(instances, 20, '-ability_mount_drake_twilight')
		:NameDesc('AN_BWL_DUO', 'AD_BWL_DUO', true)
		:Criteria(TYPE.SPECIAL, {2}):Build()
		:Build()

	L:Achievement(instances, 20, '-achievement_boss_anubarak')
		:NameDesc('AN_ANUBREKHAN_WITHOUT_MOBS', 'AD_ANUBREKHAN_WITHOUT_MOBS', true)
		:Criteria(TYPE.BOSS_WITHOUT_MOBS, {15956}):Build()
		:Build()

	L:Achievement(instances, 20, '-spell_shadow_curseofmannoroth')
		:NameDesc('AN_FAERLINA_WITHOUT_MOBS', 'AD_FAERLINA_WITHOUT_MOBS', true)
		:Criteria(TYPE.BOSS_WITHOUT_MOBS, {15953}):Build()
		:Build()

	L:Achievement(instances, 20, '-achievement_halloween_spider_01')
		:NameDesc('AN_ARACHNOPHOBIA', 'AD_ARACHNOPHOBIA', true)
		:Criteria(TYPE.SPECIAL, {3}):Build()
		:Build()

	L:Achievement(instances, 20, '-spell_deathknight_summondeathcharger')
		:NameDesc('AN_FOUR_TOGETHER', 'AD_FOUR_TOGETHER', true)
		:Criteria(TYPE.SPECIAL, {4}):Build()
		:Build()

	L:Achievement(instances, 20, '-spell_frost_icestorm')
		:NameDesc('AN_SAPPHIRONE_WITH_ALL_ALIVE', 'AD_SAPPHIRONE_WITH_ALL_ALIVE', true)
		:Criteria(TYPE.BOSS_WITH_ALL_ALIVE, {15989}):Build()
		:Build()
		
	ach = instances:CreateAchievement('AN_HEIGAN_DANCE', 'AD_HEIGAN_DANCE', 10, '-ability_rogue_quickrecovery', true, 562)
		ach:AddCriteria(criterias:Create(nil, TYPE.BOSS_WITH_ALL_ALIVE, {15936}))
		
	ach = instances:CreateAchievement('AN_PATCHWERK', 'AD_PATCHWERK', 10, '-spell_shadow_abominationexplosion', true, 563)
		ach:AddCriteria(criterias:Create(nil, TYPE.SPECIAL, {16028}))

    ach = instances:CreateAchievement('AN_KELTHUZAD_ABOMINATIONS', 'AD_KELTHUZAD_ABOMINATIONS', 10, '-spell_deathknight_plaguestrike', true, 565)
		ach:AddCriteria(criterias:Create(nil, TYPE.KILL_NPCS, {16428}, 1))

    --TBC
	local builderNormalTBC = L:Achievement(pve, 10, '-spell_holy_summonchampion')
		:NameDesc('AN_TBC_DUNGEONS', 'AD_TBC_DUNGEONS', true)
	
	local builderHeroicTBC = L:Achievement(pve, 20, '-ability_creature_cursed_02')
		:NameDesc('AN_TBC_DUNGEONS_HERO', 'AD_TBC_DUNGEONS_HERO', true)
	
    local function preBuilder(zoneName, bossIDs, isHeroic, icon)
        local points = 10
    
        local ach = L:Achievement(tbcInstances, points, icon)

        local upperZoneName = string.upper(zoneName)
        local achievementName = loc:Get('AN_' .. upperZoneName)
        local achievementDesc = loc:Get('AD_' .. upperZoneName)
        if isHeroic then
            ach:NameDesc(loc:Get('HEROIC_NAME_PATTERN', achievementName), loc:Get('HEROIC_DESCRIPTION_PATTERN', achievementDesc) .. '.')
            if type(bossIDs) == 'table' then
                for _, bossID in pairs(bossIDs) do
                    ach:Criteria(TYPE.KILL_NPC_HEROIC, {bossID}):Name('AC_BOSS_' .. bossID, true):Build()
                end
            else
                ach:Criteria(TYPE.KILL_NPC_HEROIC, {bossIDs}):Build()
            end
        else
            ach:NameDesc(achievementName, achievementDesc .. '.')
            if type(bossIDs) == 'table' then
                for _, bossID in pairs(bossIDs) do
                    ach:Criteria(TYPE.KILL_NPC, {bossID}):Name('AC_BOSS_' .. bossID, true):Build()
                end
            else
                ach:Criteria(TYPE.KILL_NPC, {bossIDs}):Build()
            end
        end
		
        return ach
    end

    local function create(zoneName, bossIDs, icon)
        local normal = preBuilder(zoneName, bossIDs, false, icon):Build()
		builderNormalTBC:Criteria(TYPE.COMPLETE_ACHIEVEMENT, {normal.id}):Name(normal.name):Build()
		
        local heroic = preBuilder(zoneName, bossIDs, true, icon):Build()
		builderHeroicTBC:Criteria(TYPE.COMPLETE_ACHIEVEMENT, {heroic.id}):Name(heroic.name):Build()
		
		normal:SetNext(heroic)
    end

    create('hellfire_ramparts', {17308, 17537, 17536}, '-Achievement_boss_omartheunscarred_01')
    create('blood_furnace', 17377, '-Achievement_boss_kelidanthebreaker')
    create('slave_pens', 17942, '-Achievement_boss_quagmirran')
    create('underbog', 17882, '-Achievement_boss_theblackstalker')
    create('mana_tombs', 18344, '-achievement_boss_nexus_prince_shaffar')
    create('auchenai_crypts', 18373, '-Achievement_boss_exarch_maladaar')
    create('old_hillsbrad', 18096, '-Achievement_boss_epochhunter')
    create('sethekk_halls', 18473, '-Achievement_boss_talonkingikiss')
    create('steamvault', 17798, '-Achievement_boss_warlord_kalithresh')
    create('shadow_labyrinth', 18708, '-achievement_boss_murmur')
    create('shattered_halls', 16808, '-Achievement_boss_kargathbladefist_01')
    create('black_morass', 17881, '-Achievement_boss_aeonus_01')
    create('botanica', 17977, '-achievement_boss_warpsplinter')
    create('mechanar', 19220, '-achievement_boss_pathaleonthecalculator')
	create('arcatraz', 20912, '-achievement_boss_harbinger_skyriss')
	create('magisters_terrace', 24664, '-achievement_character_bloodelf_male')    	
	
	builderNormalTBC = builderNormalTBC:Build()
	builderHeroicTBC = builderHeroicTBC:Build()
	builderNormalTBC:SetNext(builderHeroicTBC)
	
	builderNormalTBC:SetUnavailable()
	builderHeroicTBC:SetUnavailable()	

    L:Achievement(featsOfStrength, 0, '-Inv-Mount_Raven_54')
        :NameDesc('AN_RAVEN_LORD', 'AD_RAVEN_LORD', true)
        :Criteria(TYPE.OBTAIN_ITEM, {32768}):Build()
        :Build()

    L:Achievement(tbcInstances, 10, '-spell_shadow_shadowbolt')
        :NameDesc('AN_WB_KAZZAK_OUTLAND', 'AD_WB_KAZZAK_OUTLAND', true)
        :Criteria(TYPE.KILL_NPC, {18728}):Build()
        :Build()
        
    L:Achievement(tbcInstances, 10, '-spell_fire_felflamebreath')
        :NameDesc('AN_WB_DOOMWALKER', 'AD_WB_DOOMWALKER', true)
        :Criteria(TYPE.KILL_NPC, {17711}):Build()
        :Build()

    --RAIDS P1
    local karazhan = L:Achievement(tbcInstances, 10, '-achievement_boss_prince_malchezaar')
        :NameDesc('AN_KARAZHAN', 'AD_KARAZHAN', true)
        :Criteria(TYPE.KILL_NPC, {15690}):Build()
        :Build()

    local gruul = L:Achievement(tbcInstances, 10, '-Achievement_boss_gruulthedragonkiller')
        :NameDesc('AN_GRUUL', 'AD_GRUUL', true)
        :Criteria(TYPE.KILL_NPC, {19044}):Build()
        :Build()

    local magtheridon = L:Achievement(tbcInstances, 10, '-achievement_boss_magtheridon')
        :NameDesc('AN_MAGTHERIDON', 'AD_MAGTHERIDON', true)
        :Criteria(TYPE.KILL_NPC, {17257}):Build()
        :Build()

    local p1 = L:Achievement(pve, 10, '-Inv_Helmet_89')
        :NameDesc('AN_TBC_PHASE_1', 'AD_TBC_PHASE_1', true)
        :Criteria(TYPE.COMPLETE_ACHIEVEMENT, {karazhan.id}):Name(karazhan.name):Build()
        :Criteria(TYPE.COMPLETE_ACHIEVEMENT, {gruul.id}):Name(gruul.name):Build()
        :Criteria(TYPE.COMPLETE_ACHIEVEMENT, {magtheridon.id}):Name(magtheridon.name):Build()
        :Build()
		
	p1:SetUnavailable()

    --RAIDS P2
    local ssc = L:Achievement(tbcInstances, 10, '-Achievement_boss_ladyvashj')
        :NameDesc('AN_SSC', 'AD_SSC', true)
        :Criteria(TYPE.KILL_NPC, {21216}):Name('AC_KILL_HYDROS', true):Build()
        :Criteria(TYPE.KILL_NPC, {21217}):Name('AC_KILL_LURKER', true):Build()
        :Criteria(TYPE.KILL_NPC, {21215}):Name('AC_KILL_LEOTHERAS', true):Build()
        :Criteria(TYPE.KILL_NPC, {21214}):Name('AC_KILL_KARATHRESS', true):Build()
        :Criteria(TYPE.KILL_NPC, {21213}):Name('AC_KILL_MOROGRIM', true):Build()
        :Criteria(TYPE.KILL_NPC, {21212}):Name('AC_KILL_VASHJ', true):Build()
        :Build()

    local tk = L:Achievement(tbcInstances, 10, 'the_eye')
        :NameDesc('AN_TK', 'AD_TK', true)
        :Criteria(TYPE.KILL_NPC, {19514}):Name('AC_KILL_ALAR', true):Build()
        :Criteria(TYPE.KILL_NPC, {19516}):Name('AC_KILL_VOID_REAVER', true):Build()
        :Criteria(TYPE.KILL_NPC, {18805}):Name('AC_KILL_SOLARIAN', true):Build()
        :Criteria(TYPE.KILL_NPC, {19622}):Name('AC_KILL_KAELTHAS', true):Build()
        :Build()

    local p2 = L:Achievement(pve, 10, '-Inv_Helmet_90')
        :NameDesc('AN_TBC_PHASE_2', 'AD_TBC_PHASE_2', true)
        :Criteria(TYPE.COMPLETE_ACHIEVEMENT, {ssc.id}):Name(ssc.name):Build()
        :Criteria(TYPE.COMPLETE_ACHIEVEMENT, {tk.id}):Name(tk.name):Build()
        :Build()
		
	p2:SetUnavailable()

    --RAIDS P3
    local hyjal = L:Achievement(tbcInstances, 10, '-achievement_boss_princemalchezaar_02')
        :NameDesc('AN_HYJAL', 'AD_HYJAL', true)
        :Criteria(TYPE.KILL_NPC, { 17968 }):Build()
        :Build()

    local btEntrance = L:Achievement(tbcInstances, 10, '-Spell_Fire_BlueImmolation')
        :NameDesc('AN_BT_ENTRANCE', 'AD_BT_ENTRANCE', true)
        :Criteria(TYPE.KILL_NPC, { 22887 }):Name('AC_KILL_NAJENTUS', true):Build()
        :Criteria(TYPE.KILL_NPC, { 22898 }):Name('AC_KILL_SUPREMUS', true):Build()
        :Build()

    local btSecondWing = L:Achievement(tbcInstances, 10, '-Spell_Shadow_ConeOfSilence')
        :NameDesc('AN_BT_SECOND_WING', 'AD_BT_SECOND_WING', true)
        :Criteria(TYPE.KILL_NPC, { 22841 }):Name('AC_KILL_SHADOW_OF_AKAMA', true):Build()
        :Criteria(TYPE.KILL_NPC, { 22871 }):Name('AC_KILL_THERON', true):Build()
        :Criteria(TYPE.KILL_NPC, { 22948 }):Name('AC_KILL_GURTOGG', true):Build()
        :Criteria(TYPE.KILL_NPC, { 23420 }):Name('AC_KILL_RELIQUARY', true):Build()
        :Build()

    local btLastWing = L:Achievement(tbcInstances, 10, '-Spell_Shadow_ShadowPower')
        :NameDesc('AN_BT_LAST_WING', 'AD_BT_LAST_WING', true)
        :Criteria(TYPE.KILL_NPC, { 22947 }):Name('AC_KILL_MOTHER_SHAHRAZ', true):Build()
        :Criteria(TYPE.KILL_NPC, { 22949 }):Name('AC_KILL_BT_COUNCIL', true):Build()
        :Criteria(TYPE.KILL_NPC, { 22917 }):Name('AC_KILL_ILLIDAN', true):Build()
        :Build()

    local bt = L:Achievement(tbcInstances, 10, '-achievement_boss_illidan')
        :NameDesc('AN_BLACK_TEMPLE', 'AD_BLACK_TEMPLE', true)
        :Criteria(TYPE.COMPLETE_ACHIEVEMENT, { btEntrance.id }):Name(btEntrance.name):Build()
        :Criteria(TYPE.COMPLETE_ACHIEVEMENT, { btSecondWing.id }):Name(btSecondWing.name):Build()
        :Criteria(TYPE.COMPLETE_ACHIEVEMENT, { btLastWing.id }):Name(btLastWing.name):Build()
        :Reward('AR_BLACK_TEMPLE', true)
        :Build()	

    local p3 = L:Achievement(pve, 10, '-Inv_Helmet_103')
        :NameDesc('AN_TBC_PHASE_3', 'AD_TBC_PHASE_3', true)
        :Criteria(TYPE.COMPLETE_ACHIEVEMENT, {hyjal.id}):Name(hyjal.name):Build()
        :Criteria(TYPE.COMPLETE_ACHIEVEMENT, {bt.id}):Name(bt.name):Build()
        :Build()
		
	p3:SetUnavailable()
		
	--RAIDS P4
	local zulAman = L:Achievement(tbcInstances, 10, '-achievement_boss_zuljin')
        :NameDesc('AN_ZULAMAN', 'AD_ZULAMAN', true)
        :Criteria(TYPE.KILL_NPC, { 23863 }):Build()
        :Build()	
		
	local p4 = L:Achievement(pve, 10, '-inv_helmet_112')
        :NameDesc('AN_TBC_PHASE_4', 'AD_TBC_PHASE_4', true)
		:Criteria(TYPE.COMPLETE_ACHIEVEMENT, {zulAman.id}):Name(zulAman.name):Build()
        :Build() 

	p4:SetUnavailable()	
		
	--RAIDS P5
	local sunwell = L:Achievement(tbcInstances, 10, '-achievement_boss_kiljaedan')
        :NameDesc('AN_SUNWELL', 'AD_SUNWELL', true)
        :Criteria(TYPE.KILL_NPC, { 25315 }):Build()
        :Build()
	
	local p5 = L:Achievement(pve, 10, '-inv_helmet_92')
        :NameDesc('AN_TBC_PHASE_5', 'AD_TBC_PHASE_5', true)
		:Criteria(TYPE.COMPLETE_ACHIEVEMENT, {sunwell.id}):Name(sunwell.name):Build()
        :Build() 
		
	p5:SetUnavailable() 		
end

-- PROFESSIONS --
do
	--FIRST MAIN PROFESSION
    ach = professions:CreateAchievement('AN_PROFS_JOURNEYMAN', 'AD_PROFS_JOURNEYMAN', 10, '-Inv_Misc_Note_01', true)
        ach:AddCriteria(criterias:Create(nil, TYPE.REACH_MAIN_PROFESSION_LEVEL, {75}))
    previous = ach
	
    ach = professions:CreateAchievement('AN_PROFS_EXPERT', 'AD_PROFS_EXPERT', 10, '-Inv_Misc_Note_01', true)
        ach:AddCriteria(criterias:Create(nil, TYPE.REACH_MAIN_PROFESSION_LEVEL, {150}))
        previous:SetNext(ach)
    previous = ach
	
    ach = professions:CreateAchievement('AN_PROFS_ARTISAN', 'AD_PROFS_ARTISAN', 10, '-Inv_Misc_Note_01', true)
        ach:AddCriteria(criterias:Create(nil, TYPE.REACH_MAIN_PROFESSION_LEVEL, {225}))
		previous:SetNext(ach)
	previous = ach
	
	ach = professions:CreateAchievement(loc:Get('AN_PROFS_ONE'), loc:Get('AD_PROFS_ONE'), 10, '-Inv_Misc_Note_01')
        ach:AddCriteria(criterias:Create(nil, TYPE.REACH_MAIN_PROFESSION_LEVEL, {300}))
	    previous:SetNext(ach)
    previous = ach
    
    ach = professions:CreateAchievement(loc:Get('AN_PROFS_ONE_OUTLAND'), loc:Get('AD_PROFS_ONE_OUTLAND'), 10, '-Inv_Misc_Note_01')
		ach:AddCriteria(criterias:Create(nil, TYPE.REACH_MAIN_PROFESSION_LEVEL, {375}))
		previous:SetNext(ach) 
	previous = nil	

	ach:SetUnavailable()
	
	--SECOND MAIN PROFESSION
	local twoMains = professions:CreateAchievement(loc:Get('AN_PROFS_TWO'), loc:Get('AD_PROFS_TWO'), 10, '-ability_repair')
		twoMains:AddCriteria(criterias:Create(loc:Get('AC_PROFS_TWO'), TYPE.REACH_MAIN_PROFESSION_LEVEL, {300}, 2))
		previous = twoMains

    local twoMainsOutland = professions:CreateAchievement(loc:Get('AN_PROFS_TWO_OUTLAND'), loc:Get('AD_PROFS_TWO_OUTLAND'), 10, '-ability_repair')
        twoMainsOutland:AddCriteria(criterias:Create(loc:Get('AC_PROFS_TWO_OUTLAND'), TYPE.REACH_MAIN_PROFESSION_LEVEL, {375}, 2))
        previous:SetNext(twoMainsOutland)
	previous = nil
	
	twoMainsOutland:SetUnavailable()

	--SECONDARY PROFESSIONS
    local levels = {{'JOURNEYMAN', 75}, {'EXPERT', 150}, {'ARTISAN', 225}, {'MASTER', 300}}
    local function add(category, name, icon)
		local ach
        for _, level in pairs(levels) do
            ach = category:CreateAchievement('AN_' .. name .. '_' .. level[1], 'AD_' .. name .. '_' .. level[1], 10, icon, true)
            ach:AddCriteria(criterias:Create(nil, TYPE.REACH_PROFESSION_LEVEL, {ClassicAchievementsProfessions[name][1], level[2]}))
            if previous then previous:SetNext(ach) end
            previous = ach
        end
        previous = nil
		
		return ach
    end
    local firstAidAch = add(firstAid, 'FIRST_AID', '-spell_holy_sealofsacrifice')
		firstAidAch:AddCriteria(criterias:Create(nil, TYPE.REACH_PROFESSION_LEVEL, {ClassicAchievementsProfessions.FIRST_AID[1], 300}))
    local fishingAch = add(fishing, 'FISHING', '-trade_fishing')
	    fishingAch:AddCriteria(criterias:Create(nil, TYPE.REACH_PROFESSION_LEVEL, {ClassicAchievementsProfessions.FISHING[1], 300}))
    local cookingAch = add(cooking, 'COOKING', '-inv_misc_food_15')
		cookingAch:AddCriteria(criterias:Create(nil, TYPE.REACH_PROFESSION_LEVEL, {ClassicAchievementsProfessions.COOKING[1], 300}))
		
	--ALL SECONDARY PROFESSIONS
	local secondary = professions:CreateAchievement(loc:Get('AN_PROFS_SECONDARY'), loc:Get('AD_PROFS_SECONDARY'), 10, '-Inv_Misc_Note_02')
        secondary:AddCriteria(criterias:Create(firstAidAch.name, TYPE.COMPLETE_ACHIEVEMENT, {firstAidAch.id}))
        secondary:AddCriteria(criterias:Create(fishingAch.name, TYPE.COMPLETE_ACHIEVEMENT, {fishingAch.id}))
        secondary:AddCriteria(criterias:Create(cookingAch.name, TYPE.COMPLETE_ACHIEVEMENT, {cookingAch.id}))
    local previousSecondary = secondary

    levels = {{'OUTLAND_MASTER', 375}}
    firstAidAch = add(firstAid, 'FIRST_AID', '-spell_holy_sealofsacrifice')
        firstAidAch:AddCriteria(criterias:Create(nil, TYPE.REACH_PROFESSION_LEVEL, {ClassicAchievementsProfessions.FIRST_AID[1], 375}))
    fishingAch = add(fishing, 'FISHING', '-trade_fishing')
        fishingAch:AddCriteria(criterias:Create(nil, TYPE.REACH_PROFESSION_LEVEL, {ClassicAchievementsProfessions.FISHING[1], 375}))
    cookingAch = add(cooking, 'COOKING', '-inv_misc_food_15')
        cookingAch:AddCriteria(criterias:Create(nil, TYPE.REACH_PROFESSION_LEVEL, {ClassicAchievementsProfessions.COOKING[1], 375}))
		
	firstAidAch:SetUnavailable()
	fishingAch:SetUnavailable()
	cookingAch:SetUnavailable()

    local secondaryOutland = professions:CreateAchievement(loc:Get('AN_PROFS_SECONDARY_OUTLAND'), loc:Get('AD_PROFS_SECONDARY_OUTLAND'), 10, '-Inv_Misc_Note_02')
		secondaryOutland:AddCriteria(criterias:Create(firstAidAch.name, TYPE.COMPLETE_ACHIEVEMENT, {firstAidAch.id}))
		secondaryOutland:AddCriteria(criterias:Create(fishingAch.name, TYPE.COMPLETE_ACHIEVEMENT, {fishingAch.id}))
		secondaryOutland:AddCriteria(criterias:Create(cookingAch.name, TYPE.COMPLETE_ACHIEVEMENT, {cookingAch.id}))
		previousSecondary:SetNext(secondaryOutland)
		
	secondaryOutland:SetUnavailable()
    
	--5 PROFESSIONS
    ach = professions:CreateAchievement(loc:Get('AN_PROFS_FIVE'), loc:Get('AD_PROFS_FIVE'), 10, '-Spell_Magic_GreaterBlessingOfKings')
        ach:AddCriteria(criterias:Create(twoMains.name, TYPE.COMPLETE_ACHIEVEMENT, {twoMains.id}))
        ach:AddCriteria(criterias:Create(secondary.name, TYPE.COMPLETE_ACHIEVEMENT, {secondary.id}))
	previous = ach
    
    ach = professions:CreateAchievement(loc:Get('AN_PROFS_FIVE_OUTLAND'), loc:Get('AD_PROFS_FIVE'), 10, '-Spell_Magic_GreaterBlessingOfKings')
        ach:AddCriteria(criterias:Create(twoMainsOutland.name, TYPE.COMPLETE_ACHIEVEMENT, {twoMainsOutland.id}))
        ach:AddCriteria(criterias:Create(secondaryOutland.name, TYPE.COMPLETE_ACHIEVEMENT, {secondaryOutland.id}))
        previous:SetNext(ach)
	previous = nil
	
	ach:SetUnavailable()
		
	-- FIRST AID
    ach = firstAid:CreateAchievement('AN_STOCKING_UP', 'AD_STOCKING_UP', 10, '-Inv_Misc_Bandage_12', true)
		ach:AddCriteria(criterias:CreateL('AC_STOCKING_UP', TYPE.CRAFT_ITEM, {14530}, 100))
    previous = ach

    ach = firstAid:CreateAchievement('AN_STOCKING_UP_2', 'AD_STOCKING_UP_2', 10, '-Inv_Misc_Bandage_12', true)
		ach:AddCriteria(criterias:CreateL('AC_STOCKING_UP_2', TYPE.CRAFT_ITEM, {14530}, 500))
		previous:SetNext(ach)
    previous = nil

    --TBC
    a1 = L:Achievement(firstAid, 10, '-Inv_Misc_Bandage_Netherweave_Heavy')
        :NameDesc('AN_STOCKING_UP_OUTLAND', 'AD_STOCKING_UP_OUTLAND', true)
        :Criteria(TYPE.CRAFT_ITEM, {21991}, 100):Name('AC_STOCKING_UP_OUTLAND', true):Build()
        :Build()

    local a2 = L:Achievement(firstAid, 10, '-Inv_Misc_Bandage_Netherweave_Heavy')
        :NameDesc('AN_STOCKING_UP_2_OUTLAND', 'AD_STOCKING_UP_2_OUTLAND', true)
        :Criteria(TYPE.CRAFT_ITEM, {21991}, 500):Name('AC_STOCKING_UP_2_OUTLAND', true):Build()
        :Previous(a1)
        :Build()
		
	a1:SetUnavailable()
	a2:SetUnavailable()

	--FISHING		
	L:Achievement(fishing, 10, '-inv_misc_fish_21')
        :NameDesc('AN_BOOTY_BAY_CONTEST', 'AD_BOOTY_BAY_CONTEST', true)
        :Criteria(TYPE.OR, {
            L:Criteria(TYPE.OBTAIN_ITEM, {19970}):Build(),
            L:Criteria(TYPE.OBTAIN_ITEM, {19979}):Build()
        }):Build()
        :Build()
	
	L:Achievement(fishing, 10, '-inv_misc_fish_10')
        :NameDesc('AN_BOOTY_BAY_FISH', 'AD_BOOTY_BAY_FISH', true)
        :Criteria(TYPE.OR, {
            L:Criteria(TYPE.FISH_AN_ITEM, {19803}):Build(),
            L:Criteria(TYPE.FISH_AN_ITEM, {19805}):Build(),
            L:Criteria(TYPE.FISH_AN_ITEM, {19806}):Build()
        }):Build()
        :Build()

    local function add(name, icon, ids)
        local ach = fishing:CreateAchievement('AN_FISHING_' .. name, 'AD_FISHING_' .. name, 10, icon, true)
        if #ids == 1 then
            ach:AddCriteria(criterias:Create(nil, TYPE.FISH_AN_ITEM, ids))
        else
            for _, itemID in pairs(ids) do
                local criteria = criterias:Create('itemID ' .. itemID, TYPE.FISH_AN_ITEM, {itemID})
                ach:AddCriteria(criteria)
    
                local item = Item:CreateFromItemID(itemID)
                item:ContinueOnItemLoad(function()
                    criteria.name = item:GetItemName()
                end)
            end
        end
        return ach
    end
	
	add('COLLECTION', '-inv_misc_fish_08', {6291, 6303, 8365, 6522, 6358, 21071, 6359, 8365, 21153, 13755, 13422, 13757, 13754, 13758, 13756, 13760, 13759, 13890, 13889, 13893, 13888, 12238, 6299, 4603, 6308, 6289, 6362, 6361})
    add('WATER', '-Spell_Nature_Acid_01', {7080})
    add('RUM', '-Inv_Drink_04', {21151, 21114, 20709})
    add('RING', '-Inv_Jewelry_Ring_03', {8350})
    add('SKULL', '-Inv_Misc_Bone_DwarfSkull_01', {6301})
	
	local snapper = add('SNAPPER', '-inv_misc_fish_32', {6292, 6294, 6295})
    local seaBass = add('SEA_BASS', '-inv_misc_fish_06', {13876, 13877, 13878, 13879, 13880})
    local salmon = add('SALMON', '-inv_misc_fish_02', {13901, 13902, 13903, 13904, 13905, 13906})
    local lobster = add('LOBSTER', '-Inv_Misc_Fish_14', {13907, 13908, 13909, 13910, 13911, 13912, 13913})
    ach = fishing:CreateAchievement('AN_FISHING_BIG_SIZE', 'AD_FISHING_BIG_SIZE', 10, '-Inv_FishingPole_01', true)
		ach:AddCriteria(criterias:Create(snapper.name, TYPE.COMPLETE_ACHIEVEMENT, {snapper.id}))
		ach:AddCriteria(criterias:Create(seaBass.name, TYPE.COMPLETE_ACHIEVEMENT, {seaBass.id}))
		ach:AddCriteria(criterias:Create(salmon.name, TYPE.COMPLETE_ACHIEVEMENT, {salmon.id}))
		ach:AddCriteria(criterias:Create(lobster.name, TYPE.COMPLETE_ACHIEVEMENT, {lobster.id}))
		ach:SetRewardText(loc:Get('AR_FISHING_BIG_SIZE'))
	
    local function fishingAchievements()
		local ach
		local lastID = 516
        for _, count in pairs({25, 50, 100, 250, 500, 1000}) do
			ach = fishing:CreateAchievement(FormatNumbersInString(loc:Get('AN_FISHING_COUNT', count)), FormatNumbersInString(loc:Get('AD_FISHING_COUNT', count)), 10, '-inv_misc_fish_50', false, lastID)
			ach:AddCriteria(criterias:Create(FormatNumbersInString(loc:Get('AC_FISHING_COUNT', count)), TYPE.FISH_ANY_ITEM, {-1}, count))				
		if previous then previous:SetNext(ach) end
            previous = ach
			lastID = lastID+1
        end
        previous = nil		
    end	
	fishingAchievements()

    --TBC
    local pinchy = L:Achievement(fishing, 10, '-Inv_Misc_Fish_14')
        :NameDesc('AN_MR_PINCHY', 'AD_MR_PINCHY', true)
        :Criteria(TYPE.FISH_AN_ITEM, {27388}):Build()
        :Build()
		
	pinchy:SetUnavailable()

    local fishing_diplomat = fishing:CreateAchievement('AN_FISHING_DIPLOMAT', 'AD_FISHING_DIPLOMAT', 10, '-inv_helmet_44', true, 552)
        fishing_diplomat:AddCriteria(criterias:Create(loc:Get('AC_FISHING_DIPLOMAT1'), TYPE.FISH_ANY_ITEM, {1454}))
        fishing_diplomat:AddCriteria(criterias:Create(loc:Get('AC_FISHING_DIPLOMAT2'), TYPE.FISH_ANY_ITEM, {1453})) 

	--COOKING
    previous = nil
    for _, count in pairs({5, 10, 25, 50, 75}) do
		local cookingIcon
		
		if count == 5 then cookingIcon = '-inv_misc_food_66'
		elseif count == 10 then cookingIcon = '-inv_misc_food_65'
		elseif count == 25 then cookingIcon = '-inv_misc_food_60'
		elseif count == 50 then cookingIcon = '-inv_misc_food_13'
		else cookingIcon = '-inv_misc_food_92_lobster' end
	
        local ach = cooking:CreateAchievement(loc:Get('AN_COOKING_RECIPES_' .. count), loc:Get('AD_COOKING_RECIPES', count), 10, cookingIcon)
        ach:AddCriteria(criterias:Create(loc:Get('AC_COOKING_RECIPES', count), TYPE.LEARN_PROFESSION_RECIPES, {ClassicAchievementsProfessions.COOKING[1]}, count))
        if previous then previous:SetNext(ach) end
        if count == 75 then
            ach:SetRewardText(loc:Get('AR_COOKING_RECIPES'))
        end
        previous = ach
    end
    previous = nil

    local function add(name, icon, itemID, count, points)
        local ach = cooking:CreateAchievement(loc:Get('AN_COOKING_' .. name), 'create itemID ' .. itemID, 10, icon)
			ach:AddCriteria(criterias:Create(loc:Get('AC_COOKING_CREATE', count), TYPE.CRAFT_ITEM, {itemID}, count))

        local item = Item:CreateFromItemID(itemID)
        item:ContinueOnItemLoad(function()
            ach.description = loc:Get('AD_COOKING_CREATE', item:GetItemName(), count)
        end)
        return ach
    end

    local soup = add('SOUP', '-Inv_Drink_17', 13931, 100)
    local dessert = add('DESSERT', '-Inv_Misc_Food_63', 18254, 100)
    local squid = add('SQUID', '-Inv_Misc_Fish_13', 13928, 100)
    local dumplings = add('DUMPLINGS', '-Inv_Misc_Food_64', 20452, 100)
    ach = cooking:CreateAchievement('AN_COOKING_BIG_TABLE', 'AD_COOKING_BIG_TABLE', 10, '-Inv_Misc_Food_49', true)
    ach:AddCriteria(criterias:Create(soup.name, TYPE.COMPLETE_ACHIEVEMENT, {soup.id}))
    ach:AddCriteria(criterias:Create(dessert.name, TYPE.COMPLETE_ACHIEVEMENT, {dessert.id}))
    ach:AddCriteria(criterias:Create(squid.name, TYPE.COMPLETE_ACHIEVEMENT, {squid.id}))
    ach:AddCriteria(criterias:Create(dumplings.name, TYPE.COMPLETE_ACHIEVEMENT, {dumplings.id}))

	--TODO: Change into TBC cake: https://www.wowhead.com/wotlk/achievement=877/the-cake-is-not-a-lie
    add('CHOPS', '-Inv_Misc_Food_65', 21023, 20):SetUnavailable()
end

--WORLD EVENTS
do
	-- HALLOWSEND
	local hallowsendSummary = worldevents:CreateAchievement('AN_HALLOWSEND', 'AD_HALLOWSEND', 10, '-achievement_halloween_witch_01', true, 531)
		hallowsendSummary:SetRewardText(loc:Get('AR_HALLOWSEND'))
    if UnitFactionGroup('player') == 'Horde' then		
		ach = hallowsend:CreateAchievement('AN_HALLOWSEND_HORDE_QUEST1', 'AD_HALLOWSEND_HORDE_QUEST1', 10, '-achievement_halloween_rottenegg_01', true, 532)
			ach:AddCriteria(criterias:Create(loc:Get('AC_HALLOWSEND_HORDE_QUEST1_CRITERIA1'), TYPE.COMPLETE_QUEST, {8409}))
			ach:AddCriteria(criterias:Create(loc:Get('AC_HALLOWSEND_HORDE_QUEST1_CRITERIA2'), TYPE.COMPLETE_QUEST, {1657}))
		hallowsendSummary:AddCriteria(criterias:Create(ach.name, TYPE.COMPLETE_ACHIEVEMENT, {ach.id}))
			
		ach = hallowsend:CreateAchievement('AN_HALLOWSEND_HORDE_QUEST2', 'AD_HALLOWSEND_HORDE_QUEST2', 10, '-inv_misc_food_26', true, 533)
			ach:AddCriteria(criterias:Create(loc:Get('AC_HALLOWSEND_HORDE_QUEST2_CRITERIA1'), TYPE.OBTAIN_ITEM, {20493}))
			ach:AddCriteria(criterias:Create(loc:Get('AC_HALLOWSEND_HORDE_QUEST2_CRITERIA2'), TYPE.OBTAIN_ITEM, {20495}))	
			ach:AddCriteria(criterias:Create(loc:Get('AC_HALLOWSEND_HORDE_QUEST2_CRITERIA3'), TYPE.OBTAIN_ITEM, {20491}))	
			ach:AddCriteria(criterias:Create(loc:Get('AC_HALLOWSEND_HORDE_QUEST2_CRITERIA4'), TYPE.OBTAIN_ITEM, {20497}))	
		hallowsendSummary:AddCriteria(criterias:Create(ach.name, TYPE.COMPLETE_ACHIEVEMENT, {ach.id}))
    else	
		ach = hallowsend:CreateAchievement('AN_HALLOWSEND_ALLIANCE_QUEST1', 'AD_HALLOWSEND_ALLIANCE_QUEST1', 10, '-achievement_halloween_rottenegg_01', true, 532)
			ach:AddCriteria(criterias:Create(loc:Get('AC_HALLOWSEND_ALLIANCE_QUEST1_CRITERIA1'), TYPE.COMPLETE_QUEST, {1658}))
			ach:AddCriteria(criterias:Create(loc:Get('AC_HALLOWSEND_ALLIANCE_QUEST1_CRITERIA2'), TYPE.COMPLETE_QUEST, {8373}))
		hallowsendSummary:AddCriteria(criterias:Create(ach.name, TYPE.COMPLETE_ACHIEVEMENT, {ach.id}))
			
		ach = hallowsend:CreateAchievement('AN_HALLOWSEND_ALLIANCE_QUEST2', 'AD_HALLOWSEND_ALLIANCE_QUEST2', 10, '-inv_misc_food_26', true, 533)
			ach:AddCriteria(criterias:Create(loc:Get('AC_HALLOWSEND_ALLIANCE_QUEST2_CRITERIA1'), TYPE.OBTAIN_ITEM, {20492}))
			ach:AddCriteria(criterias:Create(loc:Get('AC_HALLOWSEND_ALLIANCE_QUEST2_CRITERIA2'), TYPE.OBTAIN_ITEM, {20494}))
			ach:AddCriteria(criterias:Create(loc:Get('AC_HALLOWSEND_ALLIANCE_QUEST2_CRITERIA3'), TYPE.OBTAIN_ITEM, {20490}))
			ach:AddCriteria(criterias:Create(loc:Get('AC_HALLOWSEND_ALLIANCE_QUEST2_CRITERIA4'), TYPE.OBTAIN_ITEM, {20496}))
		hallowsendSummary:AddCriteria(criterias:Create(ach.name, TYPE.COMPLETE_ACHIEVEMENT, {ach.id}))
    end
	
	ach = hallowsend:CreateAchievement('AN_HALLOWSEND_TREATS', 'AD_HALLOWSEND_TREATS', 10, '-inv_misc_food_30', true, 534)
		ach:AddCriteria(criterias:Create(nil, TYPE.OBTAIN_ITEM, {20393}))
	hallowsendSummary:AddCriteria(criterias:Create(ach.name, TYPE.COMPLETE_ACHIEVEMENT, {ach.id}))
	
	ach = hallowsend:CreateAchievement('AN_PUMPKIN', 'AD_PUMPKIN', 10, '-inv_misc_food_59', true, 535)
		ach:AddCriteria(criterias:Create(nil, TYPE.OBTAIN_ITEM, {20400}))
	hallowsendSummary:AddCriteria(criterias:Create(ach.name, TYPE.COMPLETE_ACHIEVEMENT, {ach.id}))
	
	ach = hallowsend:CreateAchievement('AN_HALLOWSEND_INVOCATION_BUFF', 'AD_HALLOWSEND_INVOCATION_BUFF', 10, '-inv_waepon_bow_zulgrub_d_02', true, 536)
		ach:AddCriteria(criterias:Create(nil, TYPE.HAS_BUFF, {24705}))
	hallowsendSummary:AddCriteria(criterias:Create(ach.name, TYPE.COMPLETE_ACHIEVEMENT, {ach.id}))		
	
	local maskItems = {
		20570, 20561, 20391, 20566, 20564, 20572, 20568, 20573,
		20392, 20569, 20571, 20574, 20565, 20563, 20567, 20562
	}

	local function CreateAllMasksAchievement(ids, nameKey, descKey, points, icon, forcedID)
		local ach = hallowsend:CreateAchievement(nameKey, descKey, points, icon, true, forcedID)

		for _, itemID in ipairs(ids) do
			local criteria = criterias:Create(nil, TYPE.OBTAIN_ITEM, { itemID })
			ach:AddCriteria(criteria)

			local item = Item:CreateFromItemID(itemID)
                item:ContinueOnItemLoad(function()
                    criteria.name = item:GetItemName()
                end)
		end

		return ach
	end

	-- "Obtain any mask" achievement (TYPE.OR)
	local subCriterias = {}
	for _, itemID in ipairs(maskItems) do
		table.insert(subCriterias, criterias:Create(nil, TYPE.OBTAIN_ITEM, { itemID }))
	end
	local maskAny = hallowsend:CreateAchievement('AN_HALLOWSEND_MASK', 'AD_HALLOWSEND_MASK', 10, '-inv_mask_06', true, 537)
	maskAny:AddCriteria(criterias:Create(nil, TYPE.OR, subCriterias))

	-- "Obtain all masks" achievement
	local maskAll = CreateAllMasksAchievement(maskItems, 'AN_HALLOWSEND_MASKS', 'AD_HALLOWSEND_MASKS', 10, '-inv_mask_04', 538)

	maskAny:SetNext(maskAll)
	
	ach = hallowsend:CreateAchievement('AN_HALLOWSEND_TRANSFORM', 'AD_HALLOWSEND_TRANSFORM', 10, '-achievement_halloween_ghost_01', true, 539)
		ach:AddCriteria(criterias:Create(loc:Get('AC_HALLOWSEND_GHOST'), TYPE.HAS_BUFF, {24735}))
		ach:AddCriteria(criterias:Create(loc:Get('AC_HALLOWSEND_GNOME'), TYPE.HAS_BUFF, {24712}))
		ach:AddCriteria(criterias:Create(loc:Get('AC_HALLOWSEND_WISP'), TYPE.HAS_BUFF, {24740}))
		ach:AddCriteria(criterias:Create(loc:Get('AC_HALLOWSEND_NINJA'), TYPE.HAS_BUFF, {24710}))
		ach:AddCriteria(criterias:Create(loc:Get('AC_HALLOWSEND_SKELETON'), TYPE.HAS_BUFF, {24723}))
		ach:AddCriteria(criterias:Create(loc:Get('AC_HALLOWSEND_PIRATE'), TYPE.HAS_BUFF, {24708}))
		ach:AddCriteria(criterias:Create(loc:Get('AC_HALLOWSEND_BAT'), TYPE.HAS_BUFF, {24732}))
	hallowsendSummary:AddCriteria(criterias:Create(ach.name, TYPE.COMPLETE_ACHIEVEMENT, {ach.id}))    
    
    --WINTER VEIL
    local winterveilSummary = worldevents:CreateAchievement('AN_WINTERVEIL', 'AD_WINTERVEIL', 10, '-achievement_worldevent_merrymaker', true, 541)
		winterveilSummary:SetRewardText(loc:Get('AR_WINTERVEIL'))

    if UnitFactionGroup('player') == 'Horde' then
        ach = winterveil:CreateAchievement('AN_WINTERVEIL_METZEN', 'AD_WINTERVEIL_METZEN', 10, '-achievement_worldevent_reindeer', true, 542)
            ach:AddCriteria(criterias:Create(nil, TYPE.COMPLETE_QUEST, {8746}))
        winterveilSummary:AddCriteria(criterias:Create(ach.name, TYPE.COMPLETE_ACHIEVEMENT, {ach.id}))

        ach = winterveil:CreateAchievement('AN_WINTERVEIL_SMOKEYWOOD', 'AD_WINTERVEIL_SMOKEYWOOD', 10, '-inv_helmet_68', true, 543)
            ach:AddCriteria(criterias:Create(nil, TYPE.COMPLETE_QUEST, {6984}))
        winterveilSummary:AddCriteria(criterias:Create(ach.name, TYPE.COMPLETE_ACHIEVEMENT, {ach.id}))

        ach = winterveil:CreateAchievement('AN_WINTERVEIL_SNOWBALL_HORDE', 'AD_WINTERVEIL_SNOWBALL_HORDE', 10, '-inv_ammo_snowball', true, 546)
            ach:AddCriteria(criterias:Create(nil, TYPE.SPECIAL,{ 'SNOWBALL_CAIRNE' }))
        winterveilSummary:AddCriteria(criterias:Create(ach.name, TYPE.COMPLETE_ACHIEVEMENT, {ach.id}))
    else
        ach = winterveil:CreateAchievement('AN_WINTERVEIL_METZEN', 'AD_WINTERVEIL_METZEN', 10, '-achievement_worldevent_reindeer', true, 542)
            ach:AddCriteria(criterias:Create(nil, TYPE.COMPLETE_QUEST, {8762}))
        winterveilSummary:AddCriteria(criterias:Create(ach.name, TYPE.COMPLETE_ACHIEVEMENT, {ach.id}))

        ach = winterveil:CreateAchievement('AN_WINTERVEIL_SMOKEYWOOD', 'AD_WINTERVEIL_SMOKEYWOOD', 10, '-inv_helmet_68', true, 543)
            ach:AddCriteria(criterias:Create(nil, TYPE.COMPLETE_QUEST, {7045}))
        winterveilSummary:AddCriteria(criterias:Create(ach.name, TYPE.COMPLETE_ACHIEVEMENT, {ach.id}))

        ach = winterveil:CreateAchievement('AN_WINTERVEIL_SNOWBALL_ALLIANCE', 'AD_WINTERVEIL_SNOWBALL_ALLIANCE', 10, '-inv_ammo_snowball', true, 546)
            ach:AddCriteria(criterias:Create(nil, TYPE.SPECIAL,{ 'SNOWBALL_MAGNI' }))
        winterveilSummary:AddCriteria(criterias:Create(ach.name, TYPE.COMPLETE_ACHIEVEMENT, {ach.id}))
    end

        ach = winterveil:CreateAchievement('AN_WINTERVEIL_GOURMET', 'AD_WINTERVEIL_GOURMET', 10, '-inv_misc_food_62', true, 544)
            ach:AddCriteria(criterias:Create(loc:Get('AC_WINTERVEIL_GOURMET_CRITERIA1'), TYPE.CRAFT_ITEM, {17197}))
            ach:AddCriteria(criterias:Create(loc:Get('AC_WINTERVEIL_GOURMET_CRITERIA2'), TYPE.CRAFT_ITEM, {17198}))
        winterveilSummary:AddCriteria(criterias:Create(ach.name, TYPE.COMPLETE_ACHIEVEMENT, {ach.id}))

        ach = winterveil:CreateAchievement('AN_WINTERVEIL_PRESENTS', 'AD_WINTERVEIL_PRESENTS', 10, '-inv_holiday_christmas_present_01', true, 545)
            local q1 = criterias:Create(nil, TYPE.COMPLETE_QUEST, {8767})
            local q2 = criterias:Create(nil, TYPE.COMPLETE_QUEST, {8768})
            ach:AddCriteria(criterias:Create(nil, TYPE.OR, { q1, q2 }))
        winterveilSummary:AddCriteria(criterias:Create(ach.name, TYPE.COMPLETE_ACHIEVEMENT, {ach.id}))

        ach = winterveil:CreateAchievement('AN_WINTERVEIL_PVP', 'AD_WINTERVEIL_PVP', 10, '-achievement_worldevent_littlehelper', true, 566)
            ach:AddCriteria(criterias:Create(loc:Get('AC_PVP_KILLS', 50), TYPE.SPECIAL, { 'LITTLE_HELPER_HK' }, 50))
        winterveilSummary:AddCriteria(criterias:Create(ach.name, TYPE.COMPLETE_ACHIEVEMENT, {ach.id}))

        --VALENTINES
        local valentinesSummary = worldevents:CreateAchievement('AN_VALENTINES', 'AD_VALENTINES', 10, '-achievement_worldevent_valentine', true, 605)
            valentinesSummary:SetRewardText(loc:Get('AR_VALENTINES'))

        ach = valentines:CreateAchievement('AN_VALENTINES_ROSES', 'AD_VALENTINES_ROSES', 10, '-inv_rosebouquet01', true, 606)
            ach:AddCriteria(criterias:Create(nil, TYPE.OBTAIN_ITEM, {22206}))
        valentinesSummary:AddCriteria(criterias:Create(ach.name, TYPE.COMPLETE_ACHIEVEMENT, {ach.id}))

        if UnitFactionGroup('player') == 'Horde' then
            ach = valentines:CreateAchievement('AN_VALENTINES_QUEST', 'AD_VALENTINES_QUEST', 10, '-spell_brokenheart', true, 607)
                ach:AddCriteria(criterias:Create(nil, TYPE.COMPLETE_QUEST, {8984}))
            valentinesSummary:AddCriteria(criterias:Create(ach.name, TYPE.COMPLETE_ACHIEVEMENT, {ach.id}))
        else
            ach = valentines:CreateAchievement('AN_VALENTINES_QUEST', 'AD_VALENTINES_QUEST', 10, '-spell_brokenheart', true, 607)
                ach:AddCriteria(criterias:Create(nil, TYPE.COMPLETE_QUEST, {9028}))
            valentinesSummary:AddCriteria(criterias:Create(ach.name, TYPE.COMPLETE_ACHIEVEMENT, {ach.id}))
        end

        ach = valentines:CreateAchievement('AN_VALENTINES_CHOCOLATES', 'AD_VALENTINES_CHOCOLATES', 10, '-inv_valentineschocolate02', true, 608)
            ach:AddCriteria(criterias:Create(loc:Get('AC_VALENTINES_CHOCOLATES_CRITERIA1'), TYPE.OBTAIN_ITEM, {22237}))
            ach:AddCriteria(criterias:Create(loc:Get('AC_VALENTINES_CHOCOLATES_CRITERIA2'), TYPE.OBTAIN_ITEM, {22236}))
            ach:AddCriteria(criterias:Create(loc:Get('AC_VALENTINES_CHOCOLATES_CRITERIA3'), TYPE.OBTAIN_ITEM, {22239}))
            ach:AddCriteria(criterias:Create(loc:Get('AC_VALENTINES_CHOCOLATES_CRITERIA4'), TYPE.OBTAIN_ITEM, {22238}))
        valentinesSummary:AddCriteria(criterias:Create(ach.name, TYPE.COMPLETE_ACHIEVEMENT, {ach.id}))

        ach = valentines:CreateAchievement('AN_VALENTINES_DRESS', 'AD_VALENTINES_DRESS', 10, '-inv_chest_cloth_50', true, 609)
            ach:AddCriteria(criterias:Create(nil, TYPE.OBTAIN_ITEM, {22279}))
        valentinesSummary:AddCriteria(criterias:Create(ach.name, TYPE.COMPLETE_ACHIEVEMENT, {ach.id}))

        ach = valentines:CreateAchievement('AN_VALENTINES_PIDO', 'AD_VALENTINES_PIDO', 10, '-inv_ammo_arrow_02', true, 610)
            ach:AddCriteria(criterias:Create(nil, TYPE.OBTAIN_ITEM, {22235}))
        valentinesSummary:AddCriteria(criterias:Create(ach.name, TYPE.COMPLETE_ACHIEVEMENT, {ach.id}))

        --LUNAR FESTIVAL
        local lunarSummary = worldevents:CreateAchievement('AN_LUNAR', 'AD_LUNAR', 10, '-achievement_worldevent_lunar', true, 611)
            lunarSummary:SetRewardText(loc:Get('AR_LUNAR'))

        local previous = lunar:CreateAchievement('AN_LUNAR_COIN', 'AD_LUNAR_COIN', 10, '-inv_misc_elvencoins', true, 612)
            previous:AddCriteria(criterias:Create(nil, TYPE.OBTAIN_ITEM, {21100}))

        local coinID = 613
        for i, count in pairs({5, 10, 25, 50}) do	
            ach = lunar:CreateAchievement(loc:Get('AN_LUNAR_COINS', count), loc:Get('AD_LUNAR_COINS', count), 10, '-inv_misc_elvencoins', false, coinID)
            ach:AddCriteria(criterias:Create(loc:Get('AD_LUNAR_COINS', count), TYPE.OBTAIN_ITEM, {21100}, count))
            previous:SetNext(ach)
            previous = ach

            coinID = coinID + 1
        end
        previous = nil

        lunarSummary:AddCriteria(criterias:Create(loc:Get('AN_LUNAR_COINS', 50), TYPE.COMPLETE_ACHIEVEMENT, {616}))

        ach = lunar:CreateAchievement('AN_LUNAR_QUEST', 'AD_LUNAR_QUEST', 10, '-spell_holy_aspiration', true, 617)
            ach:AddCriteria(criterias:Create(nil, TYPE.COMPLETE_QUEST, {8868}))
        lunarSummary:AddCriteria(criterias:Create(ach.name, TYPE.COMPLETE_ACHIEVEMENT, {ach.id}))

        local clothItems = {
            21157, 21538, 21539, 21544, 21543, 21541
        }
        subCriterias = {}
        for _, itemID in ipairs(clothItems) do
            table.insert(subCriterias, criterias:Create(nil, TYPE.OBTAIN_ITEM, { itemID }))
        end
        ach = lunar:CreateAchievement('AN_LUNAR_CLOTHES', 'AD_LUNAR_CLOTHES', 10, '-inv_chest_cloth_59', true, 618)
            ach:AddCriteria(criterias:Create(nil, TYPE.OR, subCriterias))
        lunarSummary:AddCriteria(criterias:Create(ach.name, TYPE.COMPLETE_ACHIEVEMENT, {ach.id}))

        --ELDERS
        local function addLunarElders(name, ids, achievementID)
            local ach = lunar:CreateAchievement('AN_LUNAR_ELDERS_' .. name, 'AD_LUNAR_ELDERS_' .. name, 10, '-spell_holy_symbolofhope', true, achievementID)

            for _, questID in ipairs(ids) do
                local criteria = criterias:Create(loc:Get('AC_LUNAR_ELDERS_' .. name .. '_' .. questID), TYPE.COMPLETE_QUEST, {questID})
                    ach:AddCriteria(criteria)
            end

            return ach
        end
        
        local lunarElders = addLunarElders('DUNGEONS', {8727, 8619, 8635, 8713, 8644, 8676}, 619)
        lunarSummary:AddCriteria(criterias:Create(lunarElders.name, TYPE.COMPLETE_ACHIEVEMENT, {lunarElders.id}))

        if UnitFactionGroup('player') == 'Horde' then
            lunarElders = addLunarElders('HORDE', {8678, 8648, 8677}, 620)
            lunarSummary:AddCriteria(criterias:Create(lunarElders.name, TYPE.COMPLETE_ACHIEVEMENT, {lunarElders.id}))
        else
            lunarElders = addLunarElders('ALLIANCE', {8718, 8866, 8646}, 620)
            lunarSummary:AddCriteria(criterias:Create(lunarElders.name, TYPE.COMPLETE_ACHIEVEMENT, {lunarElders.id}))
        end

        lunarElders = addLunarElders('EASTERN_KINGDOMS', {8636, 8651, 8652, 8674, 8716, 8643, 8675, 8649, 8650, 8642, 8645, 8722, 8647, 8653, 8714, 8688, 8683}, 621)
        lunarSummary:AddCriteria(criterias:Create(lunarElders.name, TYPE.COMPLETE_ACHIEVEMENT, {lunarElders.id}))

        lunarElders = addLunarElders('KALIMDOR', {8673, 8723, 8684, 8726, 8725, 8715, 8681, 8680, 8720, 8670, 8672, 8686, 8654, 8671, 8724, 8685, 8721, 8717, 8719, 8682, 8679}, 622)
        lunarSummary:AddCriteria(criterias:Create(lunarElders.name, TYPE.COMPLETE_ACHIEVEMENT, {lunarElders.id}))
end

-- REPUTATION --
do
    --GENERAL
    previous = nil
    local icons = {
        '-achievement_reputation_01',
        '-achievement_reputation_02',
        '-achievement_reputation_03',
        '-achievement_reputation_04',
        '-achievement_reputation_05',
        '-achievement_reputation_06',
        '-achievement_reputation_07',
    }

    for i, count in pairs({1, 5, 10, 15, 20, 25, 30}) do
        local name, desc, cname

        if i == 1 then
			name = loc:Get('AN_REPS_1')
            desc = loc:Get('AD_REPS_1')
            cname = loc:Get('AC_REPS_1')
        else
			name = count .. loc:Get('AN_REPS_X')
            desc = loc:Get('AD_REPS', count)
            cname = loc:Get('AC_REPS', count)
        end		
		
        local icon = icons[i]
		
        ach = reputation:CreateAchievement(name, desc, 10, icon)
			ach:AddCriteria(criterias:Create(cname, TYPE.REACH_ANY_REPUTATION, {8}, count))
			
        if i == 7 then ach:SetRewardText(loc:Get('AR_REPS')) end
        if previous then previous:SetNext(ach) end
        previous = ach
    end

    ach = reputation:CreateAchievement(loc:Get('AN_HORDE_REPS'), loc:Get('AD_HORDE_REPS'), 10, '-achievement_pvp_o_h')
    for i, fid in pairs({76, 530, 68, 81}) do
        ach:AddCriteria(criterias:Create(loc:Get('AC_HORDE_REPS_' .. i), TYPE.REACH_REPUTATION, {fid, 8}))
    end
    ach:SetHordeOnly()

    ach = reputation:CreateAchievement(loc:Get('AN_ALLIANCE_REPS'), loc:Get('AD_ALLIANCE_REPS'), 10, '-achievement_pvp_o_a')
    for i, fid in pairs({72, 69, 54, 47}) do
        ach:AddCriteria(criterias:Create(loc:Get('AC_ALLIANCE_REPS_' .. i), TYPE.REACH_REPUTATION, {fid, 8}))
    end
    ach:SetAllianceOnly()

    --CLASSIC
    local function add(factionID, factionName, points, icon, reputationLevel)
        local ach = vanillaReputation:CreateAchievement(loc:Get('AN_' .. factionName), loc:Get('AD_' .. factionName), points, icon)
        ach:AddCriteria(criterias:Create(nil, TYPE.REACH_REPUTATION, {factionID, reputationLevel or 8}))
    end

    add(749, 'HYDRAXIANS', 10, '-spell_frost_summonwaterelemental_2')
    add(270, 'ZANDALAR_TRIBE', 10, '-inv_bijou_green')
    add(910, 'BROOD_OF_NOZDORMU', 10, '-Inv_Misc_Head_Dragon_Bronze')
    add(529, 'ARGENT_DAWN', 10, '-inv_jewelry_talisman_07')
    add(576, 'TIMBERMAW_HOLD', 10, '-achievement_reputation_timbermaw')
    add(909, 'DARKMOON_FAIRE', 10, '-Inv_Misc_MissileLarge_Red')
    add(59, 'THORIUM', 10, '-inv_enchant_dustsoul')
    add(809, 'SHENDRALAR', 10, '-inv_misc_book_11')

    local cenarion = vanillaReputation:CreateAchievement('AN_CENARION', 'AD_CENARION', 10, '-ability_druid_manatree', true, 576)
        cenarion:AddCriteria(criterias:Create(nil, TYPE.REACH_REPUTATION, {609, 8}))

    --TBC
    local builder = L:Achievement(tbcReputations, 20, '-Spell_Fire_FelfireWard')
		:NameDesc('AN_TBC_DUNGEON_REPUTATIONS', 'AD_TBC_DUNGEON_REPUTATIONS', true)
		for _, factionID in pairs({947, 942, 1011, 989, 935}) do
			builder:Criteria(TYPE.REACH_REPUTATION, {factionID, 8}):Name('FACTION_' .. factionID, true):Build()
		end
		builder:Build():SetHordeOnly()

    builder = L:Achievement(tbcReputations, 20, '-Spell_Fire_FelfireWard')
		:NameDesc('AN_TBC_DUNGEON_REPUTATIONS', 'AD_TBC_DUNGEON_REPUTATIONS', true)
		for _, factionID in pairs({946, 942, 1011, 989, 935}) do
			builder:Criteria(TYPE.REACH_REPUTATION, {factionID, 8}):Name('FACTION_' .. factionID, true):Build()
		end
		builder:Build():SetAllianceOnly()

    local function create(factionName, factionID, icon, points)
        return L:Achievement(tbcReputations, points or 10, icon or factionName)
            :NameDesc('AN_' .. string.upper(factionName), 'AD_' .. string.upper(factionName), true)
            :Criteria(TYPE.REACH_REPUTATION, {factionID, 8}):Build()
            :Build()			
    end

    L:Achievement(tbcReputations, 10, '-Spell_Arcane_PortalShattrath')
        :NameDesc('AN_SHATTRATH_REP', 'AD_SHATTRATH_REP', true)
        :Criteria(TYPE.OR, {
            L:Criteria(TYPE.REACH_REPUTATION, {932, 8}):Build(),
            L:Criteria(TYPE.REACH_REPUTATION, {934, 8}):Build()
        }):Build()
        :Build()

	L:Achievement(tbcReputations, 20, '-ability_racial_ultravision')
        :NameDesc('AN_CENARION_CIRCLE', 'AD_CENARION_CIRCLE', true)
		:Criteria(TYPE.REACH_REPUTATION, {609, 8}):Name('FACTION_609', true):Build()
		:Criteria(TYPE.REACH_REPUTATION, {942, 8}):Name('FACTION_942', true):Build()
		:Build()
		
    create('ogrila', 1038, '-Inv_Misc_Apexis_Crystal')
    create('sporeggar', 970, '-Inv_Mushroom_11', 10)
    create('consortium', 933, '-Inv_Enchant_ShardPrismaticLarge')
    create('maghar', 941, '-Inv_Misc_Foot_Centaur', 10):SetHordeOnly()
    create('kurenai', 978, '-Inv_Misc_Foot_Centaur', 10):SetAllianceOnly()
    create('netherwings', 1015, '-Ability_Mount_NetherdrakePurple')

    L:Achievement(tbcReputations, 10, '-Ability_Mount_NetherdrakePurple')
        :NameDesc('AN_SKYSHATTERED', 'AD_SKYSHATTERED', true)
        :Criteria(TYPE.COMPLETE_QUEST, {11071}):Build()
        :Build()

    create('amethyst_eye', 967, '-Spell_Holy_Mindsooth')
    create('scale_of_the_sands', 990, '-Inv_Enchant_DustIllusion')
    create('ashtongue_deathsworn', 1012, '-achievement_reputation_ashtonguedeathsworn')
    create('shattered_sun', 1077, '-Inv_Shield_48')
end

-- FEATS OF STRENGTH --
do
    ach = featsOfStrength:CreateAchievement('AN_SULFURAS', 'AD_SULFURAS', 0, '-Inv_Hammer_Unique_Sulfuras', true)
		ach:AddCriteria(criterias:Create(nil, TYPE.OBTAIN_ITEM, {17182}))

    ach = featsOfStrength:CreateAchievement('AN_THUNDER_FURY', 'AD_THUNDER_FURY', 0, '-Inv_Sword_39', true)
		ach:AddCriteria(criterias:Create(nil, TYPE.OBTAIN_ITEM, {19019}))

    ach = featsOfStrength:CreateAchievement('AN_BLACK_SCARAB', 'AD_BLACK_SCARAB', 0, '-achievement_zone_silithus_01', true)
		ach:AddCriteria(criterias:Create(nil, TYPE.OBTAIN_ITEM, {21176}))

    ach = featsOfStrength:CreateAchievement('AN_RED_SCARAB', 'AD_RED_SCARAB', 0, '-Inv_Misc_QirajiCrystal_02', true)
		ach:AddCriteria(criterias:Create(nil, TYPE.OBTAIN_ITEM, {21321}))

    ach = featsOfStrength:CreateAchievement('AN_ATIESH', 'AD_ATIESH', 0, '-Inv_Staff_Medivh', true)
		ach:AddCriteria(criterias:Create(nil, TYPE.ATIESH))
		
	ach = featsOfStrength:CreateAchievement('AN_TIGER_MOUNT', 'AD_TIGER_MOUNT', 0, '-ability_mount_jungletiger', true)
		ach:AddCriteria(criterias:Create(nil, TYPE.OBTAIN_ITEM, {19902}))
		
	ach = featsOfStrength:CreateAchievement('AN_RAPTOR_MOUNT', 'AD_RAPTOR_MOUNT', 0, '-ability_mount_raptor', true)
		ach:AddCriteria(criterias:Create(nil, TYPE.OBTAIN_ITEM, {19872}))
		
	ach = featsOfStrength:CreateAchievement('AN_BARON_MOUNT', 'AD_BARON_MOUNT', 0, '-ability_mount_undeadhorse', true)
		ach:AddCriteria(criterias:Create(nil, TYPE.OBTAIN_ITEM, {13335}))
	
	ach = featsOfStrength:CreateAchievement('AN_SABER_MOUNT', 'AD_SABER_MOUNT', 0, '-ability_mount_pinktiger', true)
		ach:AddCriteria(criterias:Create(nil, TYPE.OBTAIN_ITEM, {13086}))
		
	ach = featsOfStrength:CreateAchievement('AN_PIRATES_HAT', 'AD_PIRATES_HAT', 0, '-inv_helmet_66', true, 523)
		ach:AddCriteria(criterias:Create(nil, TYPE.COMPLETE_QUEST, {4621}))
		ach:SetRewardText(loc:Get('AR_PIRATES_HAT'))
		
	ach = featsOfStrength:CreateAchievement('AN_WARLOCK_MOUNT', 'AD_WARLOCK_MOUNT', 0, '-ability_mount_dreadsteed', true, 524)
		ach:AddCriteria(criterias:Create(nil, TYPE.COMPLETE_QUEST, {7631}))
		
	ach = featsOfStrength:CreateAchievement('AN_PALADIN_MOUNT', 'AD_PALADIN_MOUNT', 0, '-ability_mount_charger', true, 525)
		ach:AddCriteria(criterias:Create(nil, TYPE.COMPLETE_QUEST, {7647}))

    ach = featsOfStrength:CreateAchievement('AN_ARGENT_DAWN_TABARD', 'AD_ARGENT_DAWN_TABARD', 0, '-inv_shirt_guildtabard_01', true, 561)
		ach:AddCriteria(criterias:Create(nil, TYPE.OBTAIN_ITEM, {22999}))

    --[[
    --TBC
    L:Achievement(featsOfStrength, 0, '-inv_shirt_guildtabard_01')
        :NameDesc('AN_PREPATCH_QUEST', 'AD_PREPATCH_QUEST', true)
        :Criteria(TYPE.COMPLETE_QUEST, {10259}):Build()
        :Build()

    L:Achievement(featsOfStrength, 0, '-Inv_Weapon_Glave_01')
        :NameDesc('AN_AZZINOTH', 'AD_AZZINOTH', true)
        :Criteria(TYPE.OBTAIN_ITEM, { 32837 }):Name('AC_OBTAIN_MAINHAND_AZZINOTH', true):Build()
        :Criteria(TYPE.OBTAIN_ITEM, { 32838 }):Name('AC_OBTAIN_OFFHAND_AZZINOTH', true):Build()
        :Build()
		
	L:Achievement(featsOfStrength, 0, '-inv_weapon_bow_39')
        :NameDesc('AN_THORIDAL', 'AD_THORIDAL', true)
        :Criteria(TYPE.OBTAIN_ITEM, { 34334 }):Build()
        :Build()
		
	ach = featsOfStrength:CreateAchievement('AN_BEAR_MOUNT', 'AD_BEAR_MOUNT', 0, '-ability_druid_challangingroar', true)
		ach:AddCriteria(criterias:Create(nil, TYPE.OBTAIN_ITEM, {33809}))
		
	ach = featsOfStrength:CreateAchievement('AN_HAWK_MOUNT', 'AD_HAWK_MOUNT', 0, '-ability_mount_cockatricemountelite_green', true)
		ach:AddCriteria(criterias:Create(nil, TYPE.OBTAIN_ITEM, {35513}))
		
	ach = featsOfStrength:CreateAchievement('AN_ALAR_MOUNT', 'AD_ALAR_MOUNT', 0, '-inv_misc_summerfest_brazierorange', true)
		ach:AddCriteria(criterias:Create(nil, TYPE.OBTAIN_ITEM, {32458}))

    L:Achievement(featsOfStrength, 0, '-Inv_Helmet_96')
        :NameDesc('AN_P3_FIRST_WEEK', 'AD_P3_FIRST_WEEK', true)
        :Criteria(TYPE.P3_FIRST_WEEK, { 17968 }):Name('AC_KILL_ARCHIMONDE', true):Build()
        :Criteria(TYPE.P3_FIRST_WEEK, { 22917 }):Name('AC_KILL_ILLIDAN', true):Build()
        :Reward('AR_P3_FIRST_WEEK', true)
        :Build()

	ach = featsOfStrength:CreateAchievement('AN_FLIGHFORM', 'AD_FLIGHFORM', 0, '-ability_druid_flightform', true, 522)
		ach:AddCriteria(criterias:Create(nil, TYPE.COMPLETE_QUEST, {11001}))	
		
	ach = featsOfStrength:CreateAchievement('AN_HORSEMAN_MOUNT', 'AD_HORSEMAN_MOUNT', 0, '-inv_belt_12', true, 527)
		ach:AddCriteria(criterias:Create(nil, TYPE.OBTAIN_ITEM, {37012}))		
		
	ach = featsOfStrength:CreateAchievement('AN_HERO_SHATTRATH', 'AD_HERO_SHATTRATH', 0, '-spell_arcane_teleportshattrath', true, 528)
		ach:AddCriteria(criterias:Create(loc:Get('AN_HERO_ALDOR'), TYPE.REACH_REPUTATION, {932, 8}))	
		ach:AddCriteria(criterias:Create(loc:Get('AN_HERO_SCRYER'), TYPE.REACH_REPUTATION, {934, 8}))
		
	ach = featsOfStrength:CreateAchievement('AN_CHAMPION_NAARU', 'AD_CHAMPION_NAARU', 0, '-inv_mace_51', true, 529)
		ach:AddCriteria(criterias:Create(nil, TYPE.COMPLETE_QUEST, {10901}))
		ach:AddCriteria(criterias:Create(nil, TYPE.COMPLETE_QUEST, {10888}))
		ach:SetRewardText(loc:Get('AR_CHAMPION_NAARU'))	
		
	ach = featsOfStrength:CreateAchievement('AN_HAND_ADAL', 'AD_HAND_ADAL', 0, '-inv_mace_25', true, 530)
		ach:AddCriteria(criterias:Create(nil, TYPE.COMPLETE_QUEST, {10445}))
		ach:SetRewardText(loc:Get('AR_HAND_ADAL'))

    ]]
end

--DELETE WHEN TBC COMES OUT
outlandQuests:SetUnavailable()
outlandExploration:SetUnavailable()
bgEye:SetUnavailable()
tbcInstances:SetUnavailable()
tbcReputations:SetUnavailable()

--print(db:GetAllAchievements())
--[[
    local list = {}

    for id, ach in pairs(db.achievements or {}) do
        list[#list + 1] = { id = id, ach = ach }
    end

    table.sort(list, function(a, b)
        return a.id < b.id
    end)

    for _, entry in ipairs(list) do
        local ach = entry.ach
        print(entry.id, ";", ach.name, ";", ach.description, ";", ach.icon)
    end
--]]

CA_CompletionManager:PostLoad(CA_Database:GetTab(CA_Database.TAB_ID_PLAYER):GetCategories())