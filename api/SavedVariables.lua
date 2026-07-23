local _, ns = ...

local CURRENT_SCHEMA_VERSION = 1
local manager = {
    CURRENT_SCHEMA_VERSION = CURRENT_SCHEMA_VERSION,
    accountSchemaVersion = 0,
    characterSchemaVersion = 0,
    futureAccountSchema = false,
    futureCharacterSchema = false,
}
ns.SavedVariables = manager

local function ReportMigrationError(scope, version, err)
    local message = string.format(
        "AnniversaryAchievements SavedVariables migration failed (%s schema %d): %s",
        tostring(scope), tonumber(version) or -1, tostring(err)
    )
    if type(geterrorhandler) == "function" then
        local handler = geterrorhandler()
        if type(handler) == "function" then
            handler(message)
            return
        end
    end
    print(message)
end

local function NormalizeSchemaVersion(value)
    value = tonumber(value)
    if not value or value < 0 then return 0 end
    return math.floor(value)
end

local function NormalizeNonNegativeNumber(value, default)
    value = tonumber(value)
    if not value or value < 0 then return default or 0 end
    return value
end

local function NormalizeBoolean(value, default)
    if type(value) == "boolean" then return value end
    if value == 1 or value == "1" or value == "true" then return true end
    if value == 0 or value == "0" or value == "false" then return false end
    return default
end

local function NormalizePosition(value)
    if type(value) ~= "table" then return nil end

    local point = type(value.point) == "string" and value.point or nil
    local relativePoint = type(value.relativePoint) == "string" and value.relativePoint or point
    local x = tonumber(value.x or value.xOfs)
    local y = tonumber(value.y or value.yOfs)

    if not point or not relativePoint or not x or not y then return nil end

    value.point = point
    value.relativePoint = relativePoint
    value.x = x
    value.y = y
    value.xOfs = nil
    value.yOfs = nil
    return value
end

local function NormalizeArenaData(value)
    if type(value) ~= "table" then return value end
    if value.HotStreak ~= nil or value.HotterStreak ~= nil then
        value.HotStreak = NormalizeNonNegativeNumber(value.HotStreak, 0)
        value.HotterStreak = NormalizeNonNegativeNumber(value.HotterStreak, 0)
    end
    return value
end

local function NormalizeSettings(settings)
    settings.sharing = NormalizeBoolean(settings.sharing, false)
    settings.trackerToggle = NormalizeBoolean(settings.trackerToggle, true)
    settings.trackerHidden = NormalizeBoolean(settings.trackerHidden, false)

    -- The micromenu button is the default access point. The minimap icon is
    -- the mutually exclusive fallback when the micromenu button is disabled.
    settings.microbutton = NormalizeBoolean(settings.microbutton, true)

    if type(settings.minimap) ~= "table" then
        settings.minimap = {}
    end
    settings.minimap.hide = settings.microbutton
    if settings.minimap.minimapPos ~= nil then
        settings.minimap.minimapPos = tonumber(settings.minimap.minimapPos) or nil
    end
    if settings.minimap.radius ~= nil then
        settings.minimap.radius = tonumber(settings.minimap.radius) or nil
    end
    if settings.minimap.lock ~= nil then
        settings.minimap.lock = NormalizeBoolean(settings.minimap.lock, nil)
    end

    settings.trackerPosition = NormalizePosition(settings.trackerPosition)
    settings.AchievementFramePosition = NormalizePosition(settings.AchievementFramePosition)

    if type(settings.apiTabNavigation) ~= "table" then settings.apiTabNavigation = {} end
    local navigation = settings.apiTabNavigation
    if type(navigation.pinned) ~= "table" then navigation.pinned = {} end
    local pinned, seen = {}, {}
    for _, key in ipairs(navigation.pinned) do
        if type(key) == "string" and key ~= "" and not seen[key] and #pinned < 5 then
            seen[key] = true
            pinned[#pinned + 1] = key
        end
    end
    navigation.pinned = pinned

    for _, value in pairs(settings) do
        NormalizeArenaData(value)
    end
end

local function MoveNumericKey(container, oldKey, newKey, value, merge)
    if oldKey == newKey then return value end

    local existing = container[newKey]
    if existing == nil then
        container[newKey] = value
    elseif type(merge) == "function" then
        container[newKey] = merge(existing, value)
    end

    container[oldKey] = nil
    return container[newKey]
end

local function MergeCriteriaData(target, source)
    if type(target) ~= "table" then return source end
    if type(source) ~= "table" then return target end

    target[1] = NormalizeBoolean(target[1], false) or NormalizeBoolean(source[1], false)

    if target[2] ~= nil or source[2] ~= nil then
        target[2] = math.max(
            NormalizeNonNegativeNumber(target[2], 0),
            NormalizeNonNegativeNumber(source[2], 0)
        )
    end

    -- Preserve extension or legacy fields that are not part of the core tuple.
    for key, value in pairs(source) do
        if key ~= 1 and key ~= 2 and target[key] == nil then
            target[key] = value
        end
    end

    return target
end

local function NormalizeCriteriaData(criteriaData)
    if type(criteriaData) ~= "table" then return nil end

    criteriaData[1] = NormalizeBoolean(criteriaData[1], false)
    if criteriaData[2] ~= nil then
        criteriaData[2] = NormalizeNonNegativeNumber(criteriaData[2], 0)
    end
    return criteriaData
end

local function NormalizeAchievementData(achievementData)
    if type(achievementData) ~= "table" then return nil end

    achievementData[1] = NormalizeBoolean(achievementData[1], false)
    achievementData[2] = NormalizeNonNegativeNumber(achievementData[2], 0)
    if type(achievementData[3]) ~= "table" then
        achievementData[3] = {}
    end

    local criteria = achievementData[3]
    local keys = {}
    for key in pairs(criteria) do keys[#keys + 1] = key end
    for _, key in ipairs(keys) do
        local numericKey = tonumber(key)
        local value = criteria[key]
        if not numericKey or numericKey <= 0 or numericKey % 1 ~= 0 then
            criteria[key] = nil
        else
            numericKey = math.floor(numericKey)
            value = NormalizeCriteriaData(value)
            if value then
                MoveNumericKey(criteria, key, numericKey, value, MergeCriteriaData)
            else
                criteria[key] = nil
            end
        end
    end

    return achievementData
end

local function MergeAchievementData(target, source)
    target = NormalizeAchievementData(target)
    source = NormalizeAchievementData(source)
    if not target then return source end
    if not source then return target end

    local targetCompleted = NormalizeBoolean(target[1], false)
    local sourceCompleted = NormalizeBoolean(source[1], false)
    local completed = targetCompleted or sourceCompleted

    local targetTime = NormalizeNonNegativeNumber(target[2], 0)
    local sourceTime = NormalizeNonNegativeNumber(source[2], 0)
    if completed then
        local earliest = nil
        if targetCompleted and targetTime > 0 then earliest = targetTime end
        if sourceCompleted and sourceTime > 0 and (not earliest or sourceTime < earliest) then
            earliest = sourceTime
        end
        target[2] = earliest or math.max(targetTime, sourceTime)
    else
        target[2] = math.max(targetTime, sourceTime)
    end
    target[1] = completed

    local targetCriteria = target[3]
    for criteriaID, criteriaData in pairs(source[3]) do
        if targetCriteria[criteriaID] == nil then
            targetCriteria[criteriaID] = criteriaData
        else
            targetCriteria[criteriaID] = MergeCriteriaData(targetCriteria[criteriaID], criteriaData)
        end
    end

    -- Keep any non-core fields from either legacy or current records. This is
    -- intentionally independent of the active client flavor: Classic records,
    -- TBC-only records and third-party metadata must survive every load.
    for key, value in pairs(source) do
        if key ~= 1 and key ~= 2 and key ~= 3 and target[key] == nil then
            target[key] = value
        end
    end

    return target
end

local function NormalizeTrackedData(localData)
    local tracked = localData.trackedAchievements
    if type(tracked) ~= "table" then tracked = {} end

    local normalizedTracked = {}
    for key, value in pairs(tracked) do
        local achievementID = tonumber(key)
        if achievementID and achievementID > 0 and achievementID % 1 == 0 and NormalizeBoolean(value, false) then
            normalizedTracked[math.floor(achievementID)] = true
        end
    end

    local order = localData.trackedOrder
    if type(order) ~= "table" then order = {} end

    local normalizedOrder = {}
    local seen = {}
    local orderedEntries = {}
    for index, value in pairs(order) do
        local numericIndex = tonumber(index)
        if numericIndex and numericIndex > 0 and numericIndex % 1 == 0 then
            orderedEntries[#orderedEntries + 1] = {math.floor(numericIndex), value}
        end
    end
    table.sort(orderedEntries, function(left, right) return left[1] < right[1] end)

    for _, entry in ipairs(orderedEntries) do
        local achievementID = tonumber(entry[2])
        if achievementID and achievementID > 0 and achievementID % 1 == 0 then
            achievementID = math.floor(achievementID)
            if not seen[achievementID] then
                seen[achievementID] = true
                normalizedTracked[achievementID] = true
                normalizedOrder[#normalizedOrder + 1] = achievementID
            end
        end
    end

    local missing = {}
    for achievementID in pairs(normalizedTracked) do
        if not seen[achievementID] then missing[#missing + 1] = achievementID end
    end
    table.sort(missing)
    for _, achievementID in ipairs(missing) do
        normalizedOrder[#normalizedOrder + 1] = achievementID
    end

    localData.trackedAchievements = normalizedTracked
    localData.trackedOrder = normalizedOrder
end

local function NormalizeTitleSelection(localData)
    local selection = localData.titleSelection
    if type(selection) ~= "table" then selection = {} end

    if type(selection.selectedKey) ~= "string" or selection.selectedKey == "" then
        selection.selectedKey = nil
        selection.selectedModuleID = nil
    end
    if type(selection.selectedModuleID) ~= "string" or selection.selectedModuleID == "" then
        selection.selectedModuleID = nil
    end
    selection.suppressNativeTitle = NormalizeBoolean(selection.suppressNativeTitle, false)
    localData.titleSelection = selection
end

local function NormalizeLocalData(localData)
    -- Do not filter this table against the active database or client flavor.
    -- Entries that are unavailable in Classic Era or TBC Anniversary remain
    -- stored verbatim so switching flavor or upgrading either release never
    -- discards completion, timestamp or criteria progress.
    local keys = {}
    for key in pairs(localData) do keys[#keys + 1] = key end

    for _, key in ipairs(keys) do
        if key ~= "trackedAchievements" and key ~= "trackedOrder" and key ~= "titleSelection" then
            local achievementID = tonumber(key)
            local value = localData[key]
            if achievementID and achievementID > 0 and achievementID % 1 == 0 then
                achievementID = math.floor(achievementID)
                value = NormalizeAchievementData(value)
                if value then
                    MoveNumericKey(localData, key, achievementID, value, MergeAchievementData)
                else
                    localData[key] = nil
                end
            elseif type(key) == "number" then
                localData[key] = nil
            end
        end
    end

    NormalizeTrackedData(localData)
    NormalizeTitleSelection(localData)
end

local accountMigrations = {
    [1] = function(settings)
        NormalizeSettings(settings)
    end,
}

local characterMigrations = {
    [1] = function(localData)
        NormalizeLocalData(localData)
    end,
}

local function RunMigrations(scope, root, storedVersion, migrations)
    local version = NormalizeSchemaVersion(storedVersion)
    if version > CURRENT_SCHEMA_VERSION then
        return version, true
    end

    while version < CURRENT_SCHEMA_VERSION do
        local nextVersion = version + 1
        local migration = migrations[nextVersion]
        if type(migration) ~= "function" then
            ReportMigrationError(scope, nextVersion, "missing migration function")
            return version, false
        end

        local ok, err = pcall(migration, root)
        if not ok then
            ReportMigrationError(scope, nextVersion, err)
            return version, false
        end
        version = nextVersion
    end

    return version, false
end

function manager:Initialize()
    if type(CA_Settings) ~= "table" then CA_Settings = {} end
    if type(CA_LocalData) ~= "table" then CA_LocalData = {} end
    CA_Flags = math.floor(NormalizeNonNegativeNumber(CA_Flags, 0))

    local accountVersion, futureAccount = RunMigrations(
        "account", CA_Settings, CA_SchemaVersion, accountMigrations
    )
    local characterVersion, futureCharacter = RunMigrations(
        "character", CA_LocalData, CA_LocalSchemaVersion, characterMigrations
    )

    -- Validation is idempotent and also repairs partially corrupted data that
    -- already carries the current schema version.
    NormalizeSettings(CA_Settings)
    NormalizeLocalData(CA_LocalData)

    if not futureAccount and accountVersion == CURRENT_SCHEMA_VERSION then
        CA_SchemaVersion = CURRENT_SCHEMA_VERSION
    end
    if not futureCharacter and characterVersion == CURRENT_SCHEMA_VERSION then
        CA_LocalSchemaVersion = CURRENT_SCHEMA_VERSION
    end

    self.accountSchemaVersion = NormalizeSchemaVersion(CA_SchemaVersion)
    self.characterSchemaVersion = NormalizeSchemaVersion(CA_LocalSchemaVersion)
    self.futureAccountSchema = futureAccount
    self.futureCharacterSchema = futureCharacter

    return not futureAccount and not futureCharacter
end

function manager:GetSettings()
    if type(CA_Settings) ~= "table" then
        CA_Settings = {}
        NormalizeSettings(CA_Settings)
    end
    return CA_Settings
end

function manager:GetLocalData()
    if type(CA_LocalData) ~= "table" then
        CA_LocalData = {}
        NormalizeLocalData(CA_LocalData)
    end
    return CA_LocalData
end

function manager:ResetLocalData()
    CA_LocalData = {}
    NormalizeLocalData(CA_LocalData)
    CA_LocalSchemaVersion = CURRENT_SCHEMA_VERSION
    self.characterSchemaVersion = CURRENT_SCHEMA_VERSION
    self.futureCharacterSchema = false
    return CA_LocalData
end

function manager:GetFlags()
    CA_Flags = math.floor(NormalizeNonNegativeNumber(CA_Flags, 0))
    return CA_Flags
end

function manager:SetFlags(value)
    CA_Flags = math.floor(NormalizeNonNegativeNumber(value, 0))
    return CA_Flags
end

function manager:GetSchemaStatus()
    return {
        current = CURRENT_SCHEMA_VERSION,
        account = self.accountSchemaVersion,
        character = self.characterSchemaVersion,
        futureAccount = self.futureAccountSchema,
        futureCharacter = self.futureCharacterSchema,
    }
end

manager:Initialize()
