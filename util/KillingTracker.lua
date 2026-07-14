local _, ns = ...

local damageEvents = {}
local prefixes = {'SWING', 'RANGE', 'SPELL', 'SPELL_PERIODIC', 'SPELL_BUILDING'}
local suffixes = {'DAMAGE', 'DRAIN', 'LEECH', 'INSTAKILL'}
for _, prefix in pairs(prefixes) do
    for _, suffix in pairs(suffixes) do
        damageEvents[prefix .. '_' .. suffix] = true
    end
end

local inGroupBits = {
    COMBATLOG_OBJECT_AFFILIATION_MINE,
    COMBATLOG_OBJECT_AFFILIATION_PARTY,
    COMBATLOG_OBJECT_AFFILIATION_RAID
}

local PLAYER_GUID_PREFIX = 'Player-'
local CREATURE_GUID_PREFIX = 'Creature-'
local VEHICLE_GUID_PREFIX = 'Vehicle-'

local function HasGUIDPrefix(guid, prefix)
    return type(guid) == 'string' and guid:sub(1, #prefix) == prefix
end

-- Combat state is kept by GUID. Unit-token mappings are populated by UI events
-- and allow an O(1) tap refresh for a known target. Combat-log events never scan
-- the former list of 95 possible target unit tokens.
local firstDamagesFromGroup = {}
local tapAllowedByGUID = {}
local lastCombatSeenByGUID = {}
local unitGUIDByToken = {}
local unitTokensByGUID = {}
local nextCleanupAt = 0
local COMBAT_STATE_TTL = 120
local PLAYER_FACT_TTL = 300
local playerFactsByGUID = {}

local tracker = {
    handlers = {},
    playerHandlers = {}
}

function tracker:IsPlayerGUID(guid)
    return HasGUIDPrefix(guid, PLAYER_GUID_PREFIX)
end

function tracker:IsCreatureGUID(guid)
    return HasGUIDPrefix(guid, CREATURE_GUID_PREFIX)
        or HasGUIDPrefix(guid, VEHICLE_GUID_PREFIX)
end

function tracker:IsTrackableKillGUID(guid)
    if type(guid) ~= 'string' then return false end
    return guid:sub(1, #PLAYER_GUID_PREFIX) == PLAYER_GUID_PREFIX
        or guid:sub(1, #CREATURE_GUID_PREFIX) == CREATURE_GUID_PREFIX
        or guid:sub(1, #VEHICLE_GUID_PREFIX) == VEHICLE_GUID_PREFIX
end

function tracker:GetCreatureID(guid)
    if not self:IsCreatureGUID(guid) then return nil end
    local id = select(6, strsplit('-', guid))
    return tonumber(id)
end

function tracker:IsRelevantCombatEvent(eventType, targetGUID)
    if not self:IsTrackableKillGUID(targetGUID) then return false end
    return damageEvents[eventType] == true or eventType == 'UNIT_DIED'
end

function tracker:IsInGroup(sourceFlags)
    if not sourceFlags then return false end
    for _, groupBit in pairs(inGroupBits) do
        if bit.band(sourceFlags, groupBit) ~= 0 then return true end
    end
    return false
end

function tracker:DetachUnitToken(unit)
    local oldGUID = unitGUIDByToken[unit]
    if not oldGUID then return end

    unitGUIDByToken[unit] = nil
    local tokens = unitTokensByGUID[oldGUID]
    if tokens then
        tokens[unit] = nil
        if next(tokens) == nil then
            unitTokensByGUID[oldGUID] = nil
            -- Preserve the last tap result only while combat state for this GUID
            -- is still pending. This covers targets disappearing before UNIT_DIED.
            if firstDamagesFromGroup[oldGUID] == nil then
                tapAllowedByGUID[oldGUID] = nil
            end
        end
    end
end

function tracker:UpdateTapStateForUnit(unit, expectedGUID, knownGUID)
    local guid = knownGUID or UnitGUID(unit)
    if not guid or (expectedGUID and guid ~= expectedGUID) then return false end
    if not self:IsCreatureGUID(guid) then return true end

    tapAllowedByGUID[guid] = not UnitIsTapDenied(unit)
    return true
end

local function IsUsablePlayerFact(value)
    return type(value) == 'string' and value ~= ''
end

function tracker:UpdatePlayerFactsForUnit(unit, guid)
    if not unit or not guid or not self:IsPlayerGUID(guid) then return end

    local _, className = UnitClass(unit)
    local _, raceName = UnitRace(unit)
    if not IsUsablePlayerFact(className) and not IsUsablePlayerFact(raceName) then return end

    local facts = playerFactsByGUID[guid] or {}
    if IsUsablePlayerFact(className) then facts.className = className end
    if IsUsablePlayerFact(raceName) then facts.raceName = raceName end
    facts.lastSeen = GetTime()
    playerFactsByGUID[guid] = facts
end

function tracker:GetPlayerFacts(guid)
    if not self:IsPlayerGUID(guid) then return nil, nil end

    local className, raceName
    if type(GetPlayerInfoByGUID) == 'function' then
        local _, resolvedClassName, _, resolvedRaceName = GetPlayerInfoByGUID(guid)
        if IsUsablePlayerFact(resolvedClassName) then className = resolvedClassName end
        if IsUsablePlayerFact(resolvedRaceName) then raceName = resolvedRaceName end
    end

    local cachedFacts = playerFactsByGUID[guid]
    if cachedFacts then
        className = className or cachedFacts.className
        raceName = raceName or cachedFacts.raceName
    end

    if className or raceName then
        local facts = cachedFacts or {}
        if className then facts.className = className end
        if raceName then facts.raceName = raceName end
        facts.lastSeen = GetTime()
        playerFactsByGUID[guid] = facts
    end

    return className, raceName
end

function tracker:TrackUnitToken(unit)
    if not unit then return end

    self:DetachUnitToken(unit)

    local guid = UnitGUID(unit)
    if not guid then return end

    unitGUIDByToken[unit] = guid
    local tokens = unitTokensByGUID[guid]
    if not tokens then
        tokens = {}
        unitTokensByGUID[guid] = tokens
    end
    tokens[unit] = true

    self:UpdatePlayerFactsForUnit(unit, guid)
    self:UpdateTapStateForUnit(unit, guid, guid)
end

function tracker:RefreshTapStateForGUID(guid)
    local tokens = unitTokensByGUID[guid]
    if not tokens then return false end

    local staleTokens
    for unit in pairs(tokens) do
        local currentGUID = UnitGUID(unit)
        if currentGUID == guid then
            self:UpdateTapStateForUnit(unit, guid, currentGUID)
            return true
        end
        staleTokens = staleTokens or {}
        staleTokens[#staleTokens + 1] = unit
    end

    if staleTokens then
        for _, unit in ipairs(staleTokens) do
            self:DetachUnitToken(unit)
        end
    end
    return false
end

function tracker:TrackTargetOf(unit)
    if unit then self:TrackUnitToken(unit .. 'target') end
end

function tracker:TrackPetOf(unit)
    if not unit then return end

    local petUnit
    if unit == 'player' then
        petUnit = 'pet'
    else
        local partyIndex = unit:match('^party(%d+)$')
        local raidIndex = unit:match('^raid(%d+)$')
        if partyIndex then
            petUnit = 'partypet' .. partyIndex
        elseif raidIndex then
            petUnit = 'raidpet' .. raidIndex
        end
    end

    if petUnit then
        self:TrackUnitToken(petUnit)
        self:TrackTargetOf(petUnit)
    end
end

function tracker:WarmUnitCache()
    self:TrackUnitToken('target')
    self:TrackUnitToken('targettarget')
    self:TrackUnitToken('focus')
    self:TrackUnitToken('focustarget')
    self:TrackUnitToken('mouseover')
    self:TrackUnitToken('mouseovertarget')
    self:TrackUnitToken('pet')
    self:TrackUnitToken('pettarget')

    if IsInRaid and IsInRaid() then
        local count = GetNumGroupMembers and GetNumGroupMembers() or 40
        if count < 1 then count = 40 end
        if count > 40 then count = 40 end
        for i = 1, count do
            self:TrackUnitToken('raid' .. i .. 'target')
            self:TrackUnitToken('raidpet' .. i .. 'target')
        end
    else
        local count = GetNumSubgroupMembers and GetNumSubgroupMembers() or 4
        if count > 4 then count = 4 end
        for i = 1, count do
            self:TrackUnitToken('party' .. i .. 'target')
            self:TrackUnitToken('partypet' .. i .. 'target')
        end
    end
end

function tracker:QueueUnitCacheWarmup()
    if self.unitCacheWarmupQueued then return end
    self.unitCacheWarmupQueued = true
    C_Timer.After(0, function()
        self.unitCacheWarmupQueued = false
        self:WarmUnitCache()
    end)
end

function tracker:CleanupExpiredCombatState()
    local now = GetTime()
    if now < nextCleanupAt then return end
    nextCleanupAt = now + 30

    for guid, lastSeen in pairs(lastCombatSeenByGUID) do
        if now - lastSeen > COMBAT_STATE_TTL and not unitTokensByGUID[guid] then
            firstDamagesFromGroup[guid] = nil
            tapAllowedByGUID[guid] = nil
            lastCombatSeenByGUID[guid] = nil
        end
    end

    for guid, facts in pairs(playerFactsByGUID) do
        if now - (facts.lastSeen or 0) > PLAYER_FACT_TTL and not unitTokensByGUID[guid] then
            playerFactsByGUID[guid] = nil
        end
    end
end

function tracker:ClearCombatState(guid)
    firstDamagesFromGroup[guid] = nil
    tapAllowedByGUID[guid] = nil
    lastCombatSeenByGUID[guid] = nil
end

function tracker:HandleCombatEventPayload(eventType, sourceFlags, targetGUID)
    if not self:IsRelevantCombatEvent(eventType, targetGUID) then return false end

    if damageEvents[eventType] then
        local sourceIsInGroup = self:IsInGroup(sourceFlags)
        if firstDamagesFromGroup[targetGUID] == nil or sourceIsInGroup then
            firstDamagesFromGroup[targetGUID] = sourceIsInGroup
        end
        lastCombatSeenByGUID[targetGUID] = GetTime()

        -- Refresh only a directly cached token for this GUID. If the target is
        -- unknown, the group-damage fallback remains authoritative at death.
        self:RefreshTapStateForGUID(targetGUID)
        self:CleanupExpiredCombatState()
    else -- UNIT_DIED
        local count = tapAllowedByGUID[targetGUID]
        if count == nil then
            count = firstDamagesFromGroup[targetGUID] or false
        end

        self:ClearCombatState(targetGUID)
        if count then self:HandleKill(targetGUID) end
    end

    return true
end

-- Compatibility wrapper for internal callers outside the central dispatcher.
-- The normal COMBAT_LOG_EVENT_UNFILTERED path passes the already parsed payload
-- to HandleCombatEventPayload() and therefore reads the combat log only once.
function tracker:HandleCombatEvent()
    local _, eventType, _, _, _, sourceFlags, _, targetGUID = CombatLogGetCurrentEventInfo()
    return self:HandleCombatEventPayload(eventType, sourceFlags, targetGUID)
end

function tracker:HandleKill(targetGUID)
    if self:IsCreatureGUID(targetGUID) then
        local targetID = self:GetCreatureID(targetGUID)
        for _, handler in pairs(self.handlers) do
            if handler:predicate(targetID) then handler:accept(targetID) end
        end
    elseif self:IsPlayerGUID(targetGUID) then
        for _, handler in pairs(self.playerHandlers) do handler(targetGUID) end
    end
end

function tracker:AddHandler(predicate, acceptor)
    if type(predicate) == 'number' then
        local id = predicate
        predicate = function(targetID) return targetID == id end
    elseif type(predicate) == 'table' then
        local ids = {}
        for _, id in pairs(predicate) do ids[id] = true end
        predicate = function(targetID) return ids[targetID] == true end
    end
    self.handlers[#self.handlers + 1] = {
        predicate = function(self, targetID)
            return predicate(targetID)
        end,
        accept = function(self, targetID)
            return acceptor(targetID)
        end
    }
end

function tracker:AddPlayerHandler(acceptor)
    self.playerHandlers[#self.playerHandlers + 1] = acceptor
end

local tapCacheFrame = CreateFrame('Frame', 'AnniversaryAchievementsTapCacheFrame')
tapCacheFrame:SetScript('OnEvent', function(_, event, unit)
    if event == 'PLAYER_TARGET_CHANGED' then
        tracker:TrackUnitToken('target')
        tracker:TrackUnitToken('targettarget')
    elseif event == 'PLAYER_FOCUS_CHANGED' then
        tracker:TrackUnitToken('focus')
        tracker:TrackUnitToken('focustarget')
    elseif event == 'UPDATE_MOUSEOVER_UNIT' then
        tracker:TrackUnitToken('mouseover')
        tracker:TrackUnitToken('mouseovertarget')
    elseif event == 'NAME_PLATE_UNIT_ADDED' then
        tracker:TrackUnitToken(unit)
    elseif event == 'NAME_PLATE_UNIT_REMOVED' then
        tracker:DetachUnitToken(unit)
    elseif event == 'UNIT_FLAGS' or event == 'UNIT_FACTION' then
        tracker:TrackUnitToken(unit)
    elseif event == 'UNIT_TARGET' then
        tracker:TrackTargetOf(unit)
    elseif event == 'UNIT_PET' then
        tracker:TrackPetOf(unit)
    elseif event == 'PLAYER_ENTERING_WORLD' or event == 'GROUP_ROSTER_UPDATE' then
        tracker:QueueUnitCacheWarmup()
    end
end)

local tapCacheEvents = {
    'PLAYER_ENTERING_WORLD',
    'GROUP_ROSTER_UPDATE',
    'PLAYER_TARGET_CHANGED',
    'PLAYER_FOCUS_CHANGED',
    'UPDATE_MOUSEOVER_UNIT',
    'NAME_PLATE_UNIT_ADDED',
    'NAME_PLATE_UNIT_REMOVED',
    'UNIT_FLAGS',
    'UNIT_FACTION',
    'UNIT_TARGET',
    'UNIT_PET'
}
for _, event in ipairs(tapCacheEvents) do
    -- Keep the addon loadable on clients that do not expose every optional
    -- nameplate/focus event used by newer Classic branches.
    pcall(tapCacheFrame.RegisterEvent, tapCacheFrame, event)
end

ns.CreatureKillingTracker = tracker
