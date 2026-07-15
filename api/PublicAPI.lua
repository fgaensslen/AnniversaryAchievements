local addonName, ns = ...

local db = assert(ns.Database, "AnniversaryAchievements database must load before PublicAPI")
local criterias = assert(ns.Criterias, "AnniversaryAchievements criterias must load before PublicAPI")
local progression = assert(ns.Progression, "AnniversaryAchievements progression must load before PublicAPI")
local eventBus = assert(ns.EventBus, "AnniversaryAchievements event bus must load before PublicAPI")
local events = assert(ns.Events, "AnniversaryAchievements events must load before PublicAPI")
local mainState = assert(ns.State, "AnniversaryAchievements state must load before PublicAPI")

local API_MAJOR = 1
local API_MINOR = 4
local API_PATCH = 0
local GLOBAL_NAME = "AnniversaryAchievementsAPI"

local ID_RANGES = {
    category = { first = 1000000, span = 99000000 },
    achievement = { first = 100000000, span = 900000000 },
    criteria = { first = 1000000000, span = 1000000000 },
    criteriaType = { first = 10000, span = 90000 },
}

local MAX_SUMMARY_BARS = 4
local MAX_TAB_PROGRESS_BARS = 10
local MAX_ACHIEVEMENT_TAB_MAIN_CATEGORIES = 10
local DATABASE_TAB_FIRST = 1000
local DATABASE_TAB_SPAN = 900000
local EXTENSION_STORAGE_SCHEMA = 1
local EXTENSION_STORAGE_KEY = "AnniversaryAchievements"

local modulesByID = {}
local summaryBars = {}
local uiTabs = {}
local moduleStates = setmetatable({}, { __mode = "k" })
local categoryObjects = setmetatable({}, { __mode = "k" })
local achievementObjects = setmetatable({}, { __mode = "k" })
local tabObjects = setmetatable({}, { __mode = "k" })
local tabCategoryObjects = setmetatable({}, { __mode = "k" })
local subscriptionStates = setmetatable({}, { __mode = "k" })
local databaseTabEntries = {}
local idOwners = {
    category = {},
    achievement = {},
    criteria = {},
    criteriaType = {},
}
local achievementOwners = {}
local criteriaOwners = {}
local metaDependentsByAchievementID = {}
local CheckAchievement
local QueueAchievementCheck

-- Registration is always finalized asynchronously in small, bounded slices.
-- This protects login/reload from large extension packs that register hundreds
-- of achievements in one Lua file. Existing packs benefit automatically; the
-- explicit Begin/End methods only extend the same batch across multiple calls.
local REGISTRATION_MAX_CHECKS_PER_SLICE = 20
local REGISTRATION_TIME_BUDGET_MS = 2
local registrationQueue = {
    checks = {},
    head = 1,
    checkKeys = {},
    pendingCheckCount = setmetatable({}, { __mode = "k" }),
    scheduled = false,
    processing = false,
}

local function HasPendingStructure(state)
    return #state.pendingStructureChanges > 0
        or state.pendingSummaryBarsChanged == true
        or state.pendingTabsChanged == true
end

-- Startup navigation must not become visible while extension packs are still
-- registering data. PLAYER_LOGIN guarantees that all addon Lua files have been
-- loaded, while this coordinator additionally waits for every public-API bulk
-- registration and every deferred completion check to commit.
local STARTUP_SETTLE_SECONDS = 1.0
local STARTUP_RECHECK_SECONDS = 0.05
local startupReadiness = {
    loginSeen = false,
    ready = false,
    scheduled = false,
    activitySerial = 0,
    stableSerial = nil,
    stablePasses = 0,
    lastActivityAt = 0,
    callbacks = {},
}
local ProcessRegistrationQueue
local ScheduleStartupReadyCheck

local function GetStartupTime()
    if type(GetTime) == "function" then
        local value = GetTime()
        if type(value) == "number" then return value end
    end
    return 0
end

local function HasPendingStartupRegistration()
    if registrationQueue.processing or registrationQueue.scheduled then return true end
    if registrationQueue.head <= #registrationQueue.checks then return true end

    for _, state in pairs(modulesByID) do
        if state.bulkDepth > 0
            or state.registrationDirty == true
            or HasPendingStructure(state)
            or #state.pendingContentChanges > 0
            or (registrationQueue.pendingCheckCount[state] or 0) > 0 then
            return true
        end
    end
    return false
end

local function ReportStartupCallbackError(err)
    if type(geterrorhandler) == "function" then
        local handler = geterrorhandler()
        if type(handler) == "function" then
            handler(err)
            return
        end
    end
    if type(print) == "function" then
        print("AnniversaryAchievements startup callback error: " .. tostring(err))
    end
end

local function FinishStartupReadiness()
    if startupReadiness.ready then return end
    startupReadiness.ready = true
    startupReadiness.scheduled = false

    local callbacks = startupReadiness.callbacks
    startupReadiness.callbacks = {}
    for index = 1, #callbacks do
        local ok, err = pcall(callbacks[index])
        if not ok then ReportStartupCallbackError(err) end
    end
end

local function CheckStartupReadiness()
    startupReadiness.scheduled = false
    if startupReadiness.ready or not startupReadiness.loginSeen then return end

    if HasPendingStartupRegistration() then
        startupReadiness.stablePasses = 0
        ScheduleStartupReadyCheck(STARTUP_RECHECK_SECONDS)
        return
    end

    if startupReadiness.stableSerial ~= startupReadiness.activitySerial then
        startupReadiness.stableSerial = startupReadiness.activitySerial
        startupReadiness.stablePasses = 0
        ScheduleStartupReadyCheck(STARTUP_SETTLE_SECONDS)
        return
    end

    local elapsed = GetStartupTime() - startupReadiness.lastActivityAt
    if elapsed < STARTUP_SETTLE_SECONDS then
        ScheduleStartupReadyCheck(STARTUP_SETTLE_SECONDS - elapsed)
        return
    end

    -- Require two consecutive idle checks. This also covers extension packs
    -- that start their first registration slice from a zero-delay timer.
    startupReadiness.stablePasses = startupReadiness.stablePasses + 1
    if startupReadiness.stablePasses < 2 then
        ScheduleStartupReadyCheck(0)
        return
    end

    FinishStartupReadiness()
end

ScheduleStartupReadyCheck = function(delay)
    if startupReadiness.ready or startupReadiness.scheduled then return end
    startupReadiness.scheduled = true
    delay = math.max(0, tonumber(delay) or 0)

    if C_Timer and type(C_Timer.After) == "function" then
        C_Timer.After(delay, CheckStartupReadiness)
    else
        startupReadiness.scheduled = false
        if not HasPendingStartupRegistration() then FinishStartupReadiness() end
    end
end

local function TouchStartupActivity()
    if startupReadiness.ready then return end
    startupReadiness.activitySerial = startupReadiness.activitySerial + 1
    startupReadiness.lastActivityAt = GetStartupTime()
    startupReadiness.stableSerial = nil
    startupReadiness.stablePasses = 0
    if startupReadiness.loginSeen then
        ScheduleStartupReadyCheck(STARTUP_RECHECK_SECONDS)
    end
end

function ns.IsAddonAndExtensionsReady()
    return startupReadiness.ready == true
end

function ns.WhenAddonAndExtensionsReady(callback)
    if type(callback) ~= "function" then return false end
    if startupReadiness.ready then
        local ok, err = pcall(callback)
        if not ok then ReportStartupCallbackError(err) end
    else
        startupReadiness.callbacks[#startupReadiness.callbacks + 1] = callback
    end
    return true
end

local startupFrame = CreateFrame("Frame")
startupFrame:RegisterEvent("PLAYER_LOGIN")
startupFrame:SetScript("OnEvent", function()
    startupReadiness.loginSeen = true
    startupReadiness.lastActivityAt = GetStartupTime()
    startupReadiness.stableSerial = startupReadiness.activitySerial
    startupReadiness.stablePasses = 0
    ScheduleStartupReadyCheck(STARTUP_SETTLE_SECONDS)
end)

local function GetProfileTimeMS()
    if type(debugprofilestop) == "function" then return debugprofilestop() end
    return nil
end

local function DeferRegistrationWork(callback)
    if C_Timer and type(C_Timer.After) == "function" then
        C_Timer.After(0, callback)
    else
        callback()
    end
end

local function HasRunnableRegistrationWork()
    for index = registrationQueue.head, #registrationQueue.checks do
        local item = registrationQueue.checks[index]
        if item and item.state.bulkDepth == 0 then return true end
    end
    for _, state in pairs(modulesByID) do
        if state.bulkDepth == 0 and HasPendingStructure(state) then
            return true
        end
        if state.bulkDepth == 0 and state.registrationDirty and (registrationQueue.pendingCheckCount[state] or 0) == 0 then
            return true
        end
    end
    return false
end

local function ScheduleRegistrationWork()
    if registrationQueue.processing then return end
    if registrationQueue.scheduled then return end
    if not HasRunnableRegistrationWork() then return end
    registrationQueue.scheduled = true
    DeferRegistrationWork(function()
        registrationQueue.scheduled = false
        ProcessRegistrationQueue()
    end)
end

local function MarkRegistrationDirty(state)
    state.registrationDirty = true
    TouchStartupActivity()
    if state.bulkDepth == 0 then ScheduleRegistrationWork() end
end

local function QueueDatabaseChange(state, kind, objectID)
    local target
    if kind == "category" then
        target = state.pendingStructureChanges
    else
        target = state.pendingContentChanges
    end
    target[#target + 1] = {
        kind = kind,
        objectID = objectID,
        moduleID = state.id,
    }
    MarkRegistrationDirty(state)
end

local function QueueSummaryBarsChanged(state)
    state.pendingSummaryBarsChanged = true
    MarkRegistrationDirty(state)
end

local function QueueTabsChanged(state)
    state.pendingTabsChanged = true
    MarkRegistrationDirty(state)
end

QueueAchievementCheck = function(state, achievementID)
    local key = tostring(state.id) .. ":" .. tostring(achievementID)
    if registrationQueue.checkKeys[key] then return end
    registrationQueue.checkKeys[key] = true
    registrationQueue.checks[#registrationQueue.checks + 1] = {
        key = key,
        state = state,
        achievementID = achievementID,
    }
    registrationQueue.pendingCheckCount[state] = (registrationQueue.pendingCheckCount[state] or 0) + 1
    MarkRegistrationDirty(state)
end

local publicEvents = {
    PROGRESS_CHANGED = events.PROGRESS_CHANGED,
    ACHIEVEMENT_COMPLETED = events.ACHIEVEMENT_COMPLETED,
    TITLE_CHANGED = events.TITLE_CHANGED,
    DATABASE_CHANGED = events.DATABASE_CHANGED,
    REGISTRATION_COMMITTED = events.REGISTRATION_COMMITTED,
}

local function Fail(message, level)
    error("AnniversaryAchievementsAPI: " .. tostring(message), (level or 1) + 1)
end

local function ReportExtensionError(moduleID, surface, err)
    local message = string.format("AnniversaryAchievements extension %s (%s): %s", tostring(moduleID), tostring(surface), tostring(err))
    if type(geterrorhandler) == "function" then
        local handler = geterrorhandler()
        if type(handler) == "function" then
            handler(message)
            return
        end
    end
    if type(print) == "function" then print(message) end
end

local function ProtectedCall(state, surface, callback, ...)
    local results = { pcall(callback, state.handle, ...) }
    local ok = table.remove(results, 1)
    if not ok then
        ReportExtensionError(state.id, surface, results[1])
        return false
    end
    return true, unpack(results)
end

local function IsInteger(value)
    return type(value) == "number" and value > 0 and value % 1 == 0
end

local function ValidateKey(value, fieldName)
    if type(value) ~= "string" or value == "" then
        Fail((fieldName or "key") .. " must be a non-empty string", 2)
    end
    if not value:match("^[%w_%.%-]+$") then
        Fail((fieldName or "key") .. " may only contain letters, numbers, underscore, dot and hyphen", 2)
    end
    return value
end

local function ValidateText(value, fieldName, allowEmpty)
    if type(value) ~= "string" or (not allowEmpty and value == "") then
        Fail((fieldName or "text") .. " must be a " .. (allowEmpty and "string" or "non-empty string"), 2)
    end
    return value
end

local function ValidateOptionalBoolean(value, fieldName)
    if value ~= nil and type(value) ~= "boolean" then
        Fail((fieldName or "value") .. " must be a boolean or nil", 2)
    end
    return value == true
end

local function NormalizeTitleRewardDefinition(state, achievementKey, rewardText, value)
    if value == nil or value == false then return nil end
    if type(rewardText) ~= "string" or rewardText == "" then
        Fail("achievement titleReward requires a non-empty rewardText", 3)
    end
    if value == true then value = {} end
    if type(value) ~= "table" then
        Fail("achievement titleReward must be true, a table, false or nil", 3)
    end

    local normalized = {}
    if value.key ~= nil then normalized.key = ValidateKey(value.key, "achievement titleReward key") end
    if value.format ~= nil then normalized.format = ValidateText(value.format, "achievement titleReward format") end
    if value.femaleFormat ~= nil then normalized.femaleFormat = ValidateText(value.femaleFormat, "achievement titleReward femaleFormat") end

    local function OptionalMask(mask, fieldName)
        if mask == nil then return nil end
        mask = tonumber(mask)
        if not IsInteger(mask) then Fail(fieldName .. " must be a positive integer or nil", 4) end
        return math.floor(mask)
    end
    normalized.nativeMask = OptionalMask(value.nativeMask, "achievement titleReward nativeMask")
    normalized.nativeMaskFemale = OptionalMask(value.nativeMaskFemale, "achievement titleReward nativeMaskFemale")

    return ns.TitleData:CreateExtensionReward(state.id, achievementKey, rewardText, normalized)
end

local function CopyArray(source)
    if source == nil then return nil end
    if type(source) ~= "table" then Fail("criteria data must be a table or nil", 2) end
    local result = {}
    for index, value in ipairs(source) do
        result[index] = value
    end
    return result
end

local function SortExtensionEntries(entries)
    table.sort(entries, function(left, right)
        if left.order ~= right.order then return left.order < right.order end
        if left.moduleID ~= right.moduleID then return left.moduleID < right.moduleID end
        return left.key < right.key
    end)
end

local function EnsureRecordTable(value)
    if type(value) ~= "table" then return {} end
    return value
end

local function ContainsTable(container, target, visited)
    if container == target then return true end
    if type(container) ~= "table" then return false end
    visited = visited or {}
    if visited[container] then return false end
    visited[container] = true
    for _, value in pairs(container) do
        if type(value) == "table" and ContainsTable(value, target, visited) then
            return true
        end
    end
    return false
end

local function PrepareModuleStorage(moduleID, storageRoot)
    if type(storageRoot) ~= "table" then
        Fail("module metadata.storage must be the extension addon's own SavedVariables table", 3)
    end

    -- Hard boundary: an extension may never use the main addon's SavedVariables
    -- or a nested table inside them as its storage root. Runtime registrations
    -- live in the private namespace; persistent progress lives only below the
    -- table supplied by the extension.
    if ContainsTable(mainState:GetLocalData(), storageRoot) or ContainsTable(mainState:GetSettings(), storageRoot) then
        Fail("module storage must not be CA_LocalData, CA_Settings or a nested table inside them; declare a separate SavedVariables table in the extension TOC", 3)
    end

    local root = storageRoot[EXTENSION_STORAGE_KEY]
    if root == nil then
        root = { schemaVersion = EXTENSION_STORAGE_SCHEMA, modules = {} }
        storageRoot[EXTENSION_STORAGE_KEY] = root
    elseif type(root) ~= "table" then
        Fail("storage." .. EXTENSION_STORAGE_KEY .. " already exists and is not a table", 3)
    end

    root.modules = EnsureRecordTable(root.modules)
    local schema = tonumber(root.schemaVersion) or 0
    if schema > EXTENSION_STORAGE_SCHEMA then
        Fail("extension storage schema " .. schema .. " is newer than supported schema " .. EXTENSION_STORAGE_SCHEMA, 3)
    end
    root.schemaVersion = EXTENSION_STORAGE_SCHEMA

    local moduleStorage = root.modules[moduleID]
    if type(moduleStorage) ~= "table" then
        moduleStorage = {}
        root.modules[moduleID] = moduleStorage
    end
    moduleStorage.achievements = EnsureRecordTable(moduleStorage.achievements)
    return moduleStorage
end

local function NormalizeAchievementRecord(record)
    if type(record) ~= "table" then record = {} end
    record[1] = record[1] == true
    record[2] = tonumber(record[2]) or 0
    record[3] = EnsureRecordTable(record[3])
    return record
end

local function NormalizeCriteriaRecord(record)
    if type(record) ~= "table" then record = {} end
    record[1] = record[1] == true
    record[2] = tonumber(record[2]) or 0
    return record
end

local function GetAchievementRecord(state, achievementID, create)
    local records = state.storage.achievements
    local record = records[achievementID]
    if record == nil and create then
        record = { false, 0, {} }
        records[achievementID] = record
    elseif record ~= nil then
        record = NormalizeAchievementRecord(record)
        records[achievementID] = record
    end
    return record
end

local function GetCriteriaRecord(state, achievementID, criteriaID, create)
    local achievement = GetAchievementRecord(state, achievementID, create)
    if not achievement then return nil end
    local record = achievement[3][criteriaID]
    if record == nil and create then
        record = { false, 0 }
        achievement[3][criteriaID] = record
    elseif record ~= nil then
        record = NormalizeCriteriaRecord(record)
        achievement[3][criteriaID] = record
    end
    return record
end

local function ValidateOptionalCallback(value, fieldName)
    if value ~= nil and type(value) ~= "function" then
        Fail(fieldName .. " must be a function or nil", 2)
    end
    return value
end

local function ValidateOptionalTooltip(value)
    if value ~= nil and type(value) ~= "string" and type(value) ~= "function" then
        Fail("tooltip must be a string, function or nil", 2)
    end
    return value
end

local function StableHash(text)
    local hash = 5381
    for index = 1, #text do
        hash = (hash * 33 + string.byte(text, index)) % 2147483647
    end
    return hash
end

local function IsIDUsed(kind, id)
    if kind == "category" then
        return db:GetCategory(id) ~= nil
    elseif kind == "achievement" then
        return db:GetAchievement(id) ~= nil
    elseif kind == "criteria" then
        return criterias:GetCriteriaByID(id) ~= nil
    elseif kind == "criteriaType" then
        return criterias:GetDataLength(id) ~= nil
    end
    return false
end

local function ResolveExtensionID(kind, moduleID, key, explicitID)
    local range = ID_RANGES[kind]
    if not range then Fail("unsupported ID kind " .. tostring(kind), 2) end

    local id
    if explicitID ~= nil then
        id = tonumber(explicitID)
        if not IsInteger(id) then
            Fail(kind .. " id must be a positive integer", 2)
        end
        id = math.floor(id)
        local last = range.first + range.span - 1
        if id < range.first or id > last then
            Fail(string.format("%s id %d is outside the public extension range %d-%d", kind, id, range.first, last), 2)
        end
    else
        id = range.first + (StableHash(moduleID .. ":" .. kind .. ":" .. key) % range.span)
    end

    local requestedOwner = moduleID .. "/" .. key
    local owner = idOwners[kind][id]
    if IsIDUsed(kind, id) then
        Fail(string.format("%s id collision at %d with an existing object; set an explicit id or change the registration key", kind, id), 2)
    end
    if owner and owner ~= requestedOwner then
        Fail(string.format("%s id collision at %d (already owned by %s); set an explicit id or change the registration key", kind, id, owner), 2)
    end

    idOwners[kind][id] = requestedOwner
    return id
end

local function AllocateDatabaseTabID(moduleID, key)
    local offset = StableHash(moduleID .. ":achievementTab:" .. key) % DATABASE_TAB_SPAN
    for attempt = 0, DATABASE_TAB_SPAN - 1 do
        local id = DATABASE_TAB_FIRST + ((offset + attempt) % DATABASE_TAB_SPAN)
        if not db:GetTab(id) and not databaseTabEntries[id] then return id end
    end
    Fail("unable to allocate an internal database tab id", 2)
end

local function ResolveRegisteredTab(state, value)
    if type(value) == "string" then
        local entry = state.tabsByKey[value]
        if entry then return entry end
    elseif type(value) == "table" then
        local entry = tabObjects[value]
        if entry and entry.state == state then return entry end
    end
    Fail("tab must be a tab handle or tab key from the same module", 2)
end

local function ResolveTabID(state, value)
    if value == nil then return db.TAB_ID_PLAYER end
    if type(value) == "string" then
        local normalized = value:lower()
        if normalized == "player" then return db.TAB_ID_PLAYER end
        if normalized == "guild" then return db.TAB_ID_GUILD end
        if normalized == "stats" or normalized == "statistics" then return db.TAB_ID_STATS end
        local entry = state and state.tabsByKey[value]
        if entry then
            if entry.kind ~= "achievements" then
                Fail("database categories can only target an achievement tab", 2)
            end
            return entry.databaseTabID
        end
    elseif type(value) == "table" then
        local entry = tabObjects[value]
        if entry then
            if not state or entry.state ~= state then Fail("tab handle belongs to another module", 2) end
            if entry.kind ~= "achievements" then
                Fail("database categories can only target an achievement tab", 2)
            end
            return entry.databaseTabID
        end
    end
    local numeric = tonumber(value)
    if numeric == db.TAB_ID_PLAYER or numeric == db.TAB_ID_GUILD or numeric == db.TAB_ID_STATS then
        return numeric
    end
    Fail("tab must be 'player', 'guild', 'stats', API.TAB.*, or an achievement-tab handle/key", 2)
end

local function FindCategoryTabID(categoryID)
    local category = db:GetCategory(categoryID)
    return category and category.tabID or nil
end

local function IsFeatsOfStrengthCategory(category)
    if not category then return false end
    local visited = {}
    while category and not visited[category.id] do
        visited[category.id] = true
        if category.id == db.FEATS_OF_STRENGTH_CATEGORY_ID or category.isFeatsOfStrength == true then return true end
        local parentID = tonumber(category.parentID) or -1
        if parentID < 0 then break end
        category = db:GetCategory(parentID)
    end
    return false
end

local function IsProtectedCoreFeatsCategory(category)
    if not category or not db.FEATS_OF_STRENGTH_CATEGORY_ID then return false end
    local visited = {}
    while category and not visited[category.id] do
        visited[category.id] = true
        if category.id == db.FEATS_OF_STRENGTH_CATEGORY_ID then return true end
        local parentID = tonumber(category.parentID) or -1
        if parentID < 0 then break end
        category = db:GetCategory(parentID)
    end
    return false
end

local function GetModuleState(handle)
    local state = moduleStates[handle]
    if not state then Fail("invalid or foreign module handle", 2) end
    return state
end

local function ResolveCategory(state, value)
    if type(value) == "string" then
        local handle = state.categoriesByKey[value]
        if not handle then Fail("unknown category key '" .. value .. "' in module " .. state.id, 2) end
        return categoryObjects[handle], handle.tabID
    end

    if type(value) == "table" then
        local category = categoryObjects[value]
        if not category then Fail("invalid or foreign category handle", 2) end
        return category, value.tabID
    end

    local id = tonumber(value)
    if IsInteger(id) then
        id = math.floor(id)
        local category = db:GetCategory(id)
        if not category then Fail("unknown category id " .. id, 2) end
        return category, FindCategoryTabID(id)
    end

    Fail("category must be a category handle, category key or numeric category id", 2)
end

local function ResolveAchievement(state, value)
    if type(value) == "string" then
        local handle = state.achievementsByKey[value]
        if not handle then Fail("unknown achievement key '" .. value .. "' in module " .. state.id, 2) end
        return achievementObjects[handle]
    end

    if type(value) == "table" then
        local achievement = achievementObjects[value]
        if not achievement then Fail("invalid or foreign achievement handle", 2) end
        return achievement
    end

    local id = tonumber(value)
    if IsInteger(id) then
        id = math.floor(id)
        local achievement = db:GetAchievement(id)
        if not achievement then Fail("unknown achievement id " .. id, 2) end
        return achievement
    end

    Fail("achievement must be an achievement handle, achievement key or numeric achievement id", 2)
end

local function ResolveCriteriaType(state, value)
    if type(value) == "string" then
        local custom = state.criteriaTypesByKey[value]
        if custom then return custom end
        local core = criterias.TYPE[value:upper()]
        if core then return core end
        Fail("unknown criteria type '" .. value .. "'", 2)
    end

    value = tonumber(value)
    if IsInteger(value) and criterias:GetDataLength(value) ~= nil then
        return math.floor(value)
    end
    Fail("criteria type must be a registered numeric type, core type name or module type key", 2)
end

local function ResolveCriteriaData(state, criteriaType, data)
    local result = CopyArray(data)
    local length = criterias:GetDataLength(criteriaType)
    if length == nil then Fail("criteria type is not registered", 2) end

    if criteriaType == criterias.TYPE.OR then
        Fail("the internal OR criteria type is not part of the public API; use achievement.anyCriteria = true", 2)
    end

    if length > 0 then
        if type(result) ~= "table" then
            Fail("criteria data is required for this criteria type", 2)
        end
        for index = 1, length do
            if result[index] == nil then
                Fail("criteria data is missing value " .. index, 2)
            end
        end
    end

    if criteriaType == criterias.TYPE.COMPLETE_ACHIEVEMENT and type(result) == "table" then
        local referenced = result[1]
        if type(referenced) == "table" or type(referenced) == "string" then
            result[1] = ResolveAchievement(state, referenced).id
        end
    end

    return result
end

local function MakeReadOnlyHandle(values)
    return setmetatable({}, {
        __index = values,
        __newindex = function()
            Fail("registration handles are read-only", 2)
        end,
        __metatable = false,
    })
end

local function MakeCategoryHandle(state, key, category, tabID)
    local handle = MakeReadOnlyHandle({
        id = category.id,
        key = key,
        moduleID = state.id,
        tabID = tabID,
        kind = "category",
    })
    categoryObjects[handle] = category
    state.categoriesByKey[key] = handle
    state.categoryHandlesByID[category.id] = handle
    return handle
end

local function MakeTabHandle(state, key, entry)
    local handle = MakeReadOnlyHandle({
        key = key,
        moduleID = state.id,
        kind = entry.kind == "achievements" and "achievementTab" or "tab",
        tabType = entry.kind,
        tabID = entry.databaseTabID,
    })
    tabObjects[handle] = entry
    entry.handle = handle
    return handle
end

local function MakeTabCategoryHandle(state, tabEntry, key, entry)
    local handle = MakeReadOnlyHandle({
        key = key,
        moduleID = state.id,
        tabKey = tabEntry.key,
        kind = "tabCategory",
    })
    tabCategoryObjects[handle] = entry
    entry.handle = handle
    return handle
end

local function MakeAchievementHandle(state, key, achievement, categoryHandle, criteriaIDs)
    local handle = MakeReadOnlyHandle({
        id = achievement.id,
        key = key,
        moduleID = state.id,
        categoryID = achievement.categoryID or (categoryHandle and categoryHandle.id),
        kind = "achievement",
        criteriaIDs = criteriaIDs,
    })
    achievementObjects[handle] = achievement
    state.achievementsByKey[key] = handle
    state.achievementHandlesByID[achievement.id] = handle
    state.criteriaIDsByAchievement[key] = criteriaIDs
    return handle
end

local moduleMethods = {}

function moduleMethods:GetID()
    return GetModuleState(self).id
end

function moduleMethods:GetMetadata()
    local state = GetModuleState(self)
    return {
        id = state.id,
        name = state.metadata.name,
        version = state.metadata.version,
        author = state.metadata.author,
        storageSchema = EXTENSION_STORAGE_SCHEMA,
    }
end

function moduleMethods:BeginBulkRegistration()
    local state = GetModuleState(self)
    state.bulkDepth = state.bulkDepth + 1
    TouchStartupActivity()
    return self
end

function moduleMethods:EndBulkRegistration()
    local state = GetModuleState(self)
    if state.bulkDepth <= 0 then
        Fail("EndBulkRegistration called without matching BeginBulkRegistration in module " .. state.id, 2)
    end
    state.bulkDepth = state.bulkDepth - 1
    TouchStartupActivity()
    if state.bulkDepth == 0 then ScheduleRegistrationWork() end
    return self
end

function moduleMethods:IsRegistrationPending()
    local state = GetModuleState(self)
    return state.bulkDepth > 0
        or state.registrationDirty == true
        or (registrationQueue.pendingCheckCount[state] or 0) > 0
end

function moduleMethods:RegisterCriteriaType(key, dataLength, options)
    local state = GetModuleState(self)
    key = ValidateKey(key, "criteria type key")
    if state.criteriaTypesByKey[key] then
        Fail("criteria type key '" .. key .. "' is already registered in module " .. state.id, 2)
    end

    dataLength = tonumber(dataLength)
    if type(dataLength) ~= "number" or dataLength < 0 or dataLength > 16 or dataLength % 1 ~= 0 then
        Fail("dataLength must be an integer from 0 to 16", 2)
    end
    dataLength = math.floor(dataLength)
    options = options or {}
    if type(options) ~= "table" then Fail("criteria type options must be a table", 2) end

    local typeID = ResolveExtensionID("criteriaType", state.id, key, options.id)
    criterias:RegisterType(typeID, dataLength)
    state.criteriaTypesByKey[key] = typeID
    return typeID
end

local function RegisterAchievementCategory(state, key, definition)
    key = ValidateKey(key, "category key")
    if state.categoriesByKey[key] then
        Fail("category key '" .. key .. "' is already registered in module " .. state.id, 2)
    end
    if type(definition) ~= "table" then Fail("category definition must be a table", 2) end

    local name = ValidateText(definition.name, "category name")
    local tabID = ResolveTabID(state, definition.tab)
    local tabEntry = databaseTabEntries[tabID]
    local parentID = -1
    if definition.parent ~= nil then
        local parent, parentTabID = ResolveCategory(state, definition.parent)
        if parentTabID and parentTabID ~= tabID then
            Fail("category parent must belong to the same tab", 2)
        end
        if IsProtectedCoreFeatsCategory(parent) then
            Fail("extension categories may never be created below the native Feats of Strength category", 2)
        end
        parentID = parent.id
    end

    local featsOfStrength = ValidateOptionalBoolean(definition.featsOfStrength, "category featsOfStrength") == true
    if featsOfStrength then
        if not tabEntry or tabEntry.kind ~= "achievements" then
            Fail("featsOfStrength is supported only for API achievement tabs", 2)
        end
        if parentID ~= -1 then Fail("a Feats of Strength category must be a main category", 2) end
        if tabEntry.featsCategoryID then Fail("an achievement tab can contain only one Feats of Strength category", 2) end
    end

    if tabEntry and parentID == -1 and tabEntry.mainCategoryCount >= MAX_ACHIEVEMENT_TAB_MAIN_CATEGORIES then
        Fail("achievement tabs support at most " .. MAX_ACHIEVEMENT_TAB_MAIN_CATEGORIES .. " main categories", 2)
    end

    local categoryID = ResolveExtensionID("category", state.id, key, definition.id)
    local tab = db:GetTab(tabID)
    if not tab then Fail("requested tab is unavailable", 2) end

    local category = tab:CreateCategory(name, parentID, false, categoryID)
    -- Custom achievement tabs expose only categories explicitly registered
    -- through the public API. This marker prevents any internal/default object
    -- from becoming a blank menu entry in another extension page.
    category.apiRegistered = true
    category.apiModuleID = state.id
    category.apiKey = key
    category.apiOrder = tonumber(definition.order) or (featsOfStrength and 100000 or 100)
    if featsOfStrength then
        category.isFeatsOfStrength = true
        tabEntry.featsCategoryID = categoryID
    end
    if definition.unavailable then category:SetUnavailable() end
    local handle = MakeCategoryHandle(state, key, category, tabID)
    if tabEntry and parentID == -1 then tabEntry.mainCategoryCount = tabEntry.mainCategoryCount + 1 end
    QueueDatabaseChange(state, "category", categoryID)
    return handle
end

function moduleMethods:RegisterCategory(key, definition)
    return RegisterAchievementCategory(GetModuleState(self), key, definition)
end

local function ValidateCriteriaDefinitions(state, achievementKey, definitions)
    if type(definitions) ~= "table" or #definitions == 0 then
        Fail("achievement criteria must be a non-empty array", 3)
    end

    local normalized = {}
    local usedKeys = {}
    for index, definition in ipairs(definitions) do
        if type(definition) ~= "table" then Fail("criteria definition " .. index .. " must be a table", 3) end
        local key = ValidateKey(definition.key, "criteria key")
        if usedKeys[key] then Fail("duplicate criteria key '" .. key .. "' in achievement " .. achievementKey, 3) end
        usedKeys[key] = true

        local criteriaType = ResolveCriteriaType(state, definition.type)
        local data = ResolveCriteriaData(state, criteriaType, definition.data)
        local quantity = definition.quantity
        if quantity ~= nil then
            quantity = tonumber(quantity)
            if type(quantity) ~= "number" or quantity <= 0 then
                Fail("criteria quantity must be a number greater than zero", 3)
            end
        end
        if definition.name ~= nil and type(definition.name) ~= "string" then
            Fail("criteria name must be a string or nil", 3)
        end
        if definition.quantityFormatter ~= nil and type(definition.quantityFormatter) ~= "function" then
            Fail("criteria quantityFormatter must be a function or nil", 3)
        end
        local hidden = ValidateOptionalBoolean(definition.hidden, "criteria hidden")

        local idKey = achievementKey .. "." .. key
        local criteriaID = ResolveExtensionID("criteria", state.id, idKey, definition.id)
        normalized[#normalized + 1] = {
            key = key,
            id = criteriaID,
            name = definition.name,
            type = criteriaType,
            data = data,
            quantity = quantity,
            quantityFormatter = definition.quantityFormatter,
            hidden = hidden,
        }
    end
    return normalized
end

function moduleMethods:RegisterAchievement(key, definition)
    local state = GetModuleState(self)
    key = ValidateKey(key, "achievement key")
    if state.achievementsByKey[key] then
        Fail("achievement key '" .. key .. "' is already registered in module " .. state.id, 2)
    end
    if type(definition) ~= "table" then Fail("achievement definition must be a table", 2) end

    local category, categoryTabID = ResolveCategory(state, definition.category)
    local customTab = databaseTabEntries[categoryTabID]
    if categoryTabID ~= db.TAB_ID_PLAYER and not (customTab and customTab.kind == "achievements") then
        Fail("public achievements are supported in the player tab and API achievement tabs only", 2)
    end
    if IsProtectedCoreFeatsCategory(category) then
        Fail("extension achievements may never be registered in the native Feats of Strength category or its descendants", 2)
    end

    local name = ValidateText(definition.name, "achievement name")
    local description = ValidateText(definition.description, "achievement description", true)
    local points = tonumber(definition.points or 0)
    if type(points) ~= "number" or points < 0 then Fail("achievement points must be a non-negative number", 2) end
    local icon = definition.icon
    if type(icon) ~= "string" and type(icon) ~= "number" then
        Fail("achievement icon must be a texture path, icon name or file id", 2)
    end

    local achievementID = ResolveExtensionID("achievement", state.id, key, definition.id)
    local hideCriteriaUI = ValidateOptionalBoolean(definition.hideCriteriaUI, "achievement hideCriteriaUI")
    local normalizedCriteria = ValidateCriteriaDefinitions(state, key, definition.criteria)
    local previous
    if definition.previous ~= nil then
        previous = ResolveAchievement(state, definition.previous)
        if previous:GetNextID() then
            Fail("previous achievement " .. previous.id .. " already has a next achievement", 2)
        end
    end

    local faction = definition.faction
    if faction ~= nil and faction ~= "Horde" and faction ~= "Alliance" then
        Fail("achievement faction must be 'Horde', 'Alliance' or nil", 2)
    end
    if definition.rewardText ~= nil and type(definition.rewardText) ~= "string" then
        Fail("achievement rewardText must be a string or nil", 2)
    end
    local titleReward = NormalizeTitleRewardDefinition(state, key, definition.rewardText, definition.titleReward)
    if definition.priority ~= nil and type(tonumber(definition.priority)) ~= "number" then
        Fail("achievement priority must be numeric or nil", 2)
    end

    local achievement = category:CreateAchievement(name, description, points, icon, false, achievementID)
    achievement.categoryID = category.id
    if hideCriteriaUI then achievement:SetHideCriteriaUI(true) end
    local criteriaIDs = {}
    for _, criteriaDefinition in ipairs(normalizedCriteria) do
        local criteria = criterias:Create(
            criteriaDefinition.name,
            criteriaDefinition.type,
            criteriaDefinition.data,
            criteriaDefinition.quantity,
            criteriaDefinition.id
        )
        if not criteria then
            Fail("failed to create criteria " .. criteriaDefinition.key .. " for achievement " .. key, 2)
        end
        if criteriaDefinition.quantityFormatter then
            criteria:SetQuantityFormatter(criteriaDefinition.quantityFormatter)
        end
        if hideCriteriaUI or criteriaDefinition.hidden then
            criteria:SetHidden(true)
        end
        achievement:AddCriteria(criteria)
        criteriaIDs[criteriaDefinition.key] = criteria.id
    end

    if definition.anyCriteria then achievement:SetAnyCompletable() end
    if definition.rewardText then achievement:SetRewardText(definition.rewardText) end
    if titleReward then achievement:SetTitleReward(titleReward) end
    if faction == "Horde" then achievement:SetHordeOnly() end
    if faction == "Alliance" then achievement:SetAllianceOnly() end
    if definition.unavailable then achievement:SetUnavailable() end
    if definition.priority ~= nil then achievement.priority = tonumber(definition.priority) end
    if previous then
        local previousOwner = achievementOwners[previous.id]
        if previousOwner ~= state then
            Fail("previous must reference an achievement from the same extension module", 2)
        end
        previous:SetNext(achievement)
    end

    achievement.extensionModuleID = state.id
    achievementOwners[achievementID] = state
    local record = GetAchievementRecord(state, achievementID, true)
    for _, criteriaDefinition in ipairs(normalizedCriteria) do
        criteriaOwners[criteriaDefinition.id] = { state = state, achievementID = achievementID }
        GetCriteriaRecord(state, achievementID, criteriaDefinition.id, true)
        if criteriaDefinition.type == criterias.TYPE.COMPLETE_ACHIEVEMENT then
            local referencedID = tonumber(criteriaDefinition.data and criteriaDefinition.data[1])
            if referencedID then
                local dependents = metaDependentsByAchievementID[referencedID]
                if not dependents then
                    dependents = {}
                    metaDependentsByAchievementID[referencedID] = dependents
                end
                dependents[achievementID] = { state = state, achievementID = achievementID }
            end
        end
    end

    local categoryHandle = state.categoryHandlesByID[category.id]
    local handle = MakeAchievementHandle(state, key, achievement, categoryHandle, criteriaIDs)
    QueueAchievementCheck(state, achievementID)
    QueueDatabaseChange(state, "achievement", achievementID)
    return handle
end

function moduleMethods:RegisterSummaryProgressBar(key, definition)
    local state = GetModuleState(self)
    key = ValidateKey(key, "summary progress bar key")
    if state.summaryBarsByKey[key] then
        Fail("summary progress bar key '" .. key .. "' is already registered in module " .. state.id, 2)
    end
    if #summaryBars >= MAX_SUMMARY_BARS then
        Fail("the public API supports at most " .. MAX_SUMMARY_BARS .. " extension summary progress bars", 2)
    end
    if type(definition) ~= "table" then Fail("summary progress bar definition must be a table", 2) end

    local label = ValidateText(definition.label, "summary progress bar label")
    local categoryID
    if definition.category ~= nil then
        local category = ResolveCategory(state, definition.category)
        categoryID = category.id
    end
    local getProgress = definition.getProgress
    if categoryID == nil and type(getProgress) ~= "function" then
        Fail("summary progress bar requires either category or getProgress", 2)
    end
    ValidateOptionalCallback(getProgress, "getProgress")
    ValidateOptionalCallback(definition.isVisible, "isVisible")
    ValidateOptionalCallback(definition.onClick, "onClick")
    ValidateOptionalTooltip(definition.tooltip)

    local entry = {
        moduleID = state.id,
        state = state,
        key = key,
        label = label,
        categoryID = categoryID,
        getProgress = getProgress,
        isVisible = definition.isVisible,
        onClick = definition.onClick,
        tooltip = definition.tooltip,
        order = tonumber(definition.order) or 100,
    }
    summaryBars[#summaryBars + 1] = entry
    SortExtensionEntries(summaryBars)
    state.summaryBarsByKey[key] = entry
    QueueSummaryBarsChanged(state)
    return MakeReadOnlyHandle({ kind = "summaryProgressBar", moduleID = state.id, key = key })
end

local function ValidateTabPresentation(definition)
    local name = ValidateText(definition.name, "tab name")
    if definition.icon ~= nil and type(definition.icon) ~= "string" and type(definition.icon) ~= "number" then
        Fail("tab icon must be a texture path, file id or nil", 3)
    end
    ValidateOptionalCallback(definition.onShow, "onShow")
    ValidateOptionalCallback(definition.onHide, "onHide")
    ValidateOptionalCallback(definition.onRefresh, "onRefresh")
    ValidateOptionalTooltip(definition.tooltip)
    local width = tonumber(definition.width) or 115
    if width < 80 or width > 160 then Fail("tab width must be between 80 and 160", 3) end
    return name, width
end

local function RegisterTabEntry(state, key, definition, kind)
    key = ValidateKey(key, "tab key")
    if state.tabsByKey[key] then Fail("tab key '" .. key .. "' is already registered in module " .. state.id, 3) end
    if type(definition) ~= "table" then Fail("tab definition must be a table", 3) end

    local name, width = ValidateTabPresentation(definition)
    local entry = {
        moduleID = state.id,
        state = state,
        key = key,
        kind = kind,
        name = name,
        title = type(definition.title) == "string" and definition.title or name,
        icon = definition.icon,
        tooltip = definition.tooltip,
        width = width,
        order = tonumber(definition.order) or 100,
        onShow = definition.onShow,
        onHide = definition.onHide,
        onRefresh = definition.onRefresh,
        categories = {},
        categoriesByKey = {},
        progressBars = {},
        progressBarsByKey = {},
        mainCategoryCount = 0,
        selectedCategory = "summary",
    }

    if kind == "empty" then
        if definition.createFrame ~= nil and type(definition.createFrame) ~= "function" then
            Fail("tab createFrame must be a function or nil", 3)
        end
        entry.createFrame = definition.createFrame
        entry.summaryName = type(definition.summaryName) == "string" and definition.summaryName or nil
    else
        if definition.createFrame ~= nil then
            Fail("achievement tabs use the native achievement UI and do not accept createFrame", 3)
        end
        entry.databaseTabID = AllocateDatabaseTabID(state.id, key)
        db:CreateTab(entry.databaseTabID)
        databaseTabEntries[entry.databaseTabID] = entry
    end

    local handle = MakeTabHandle(state, key, entry)
    uiTabs[#uiTabs + 1] = entry
    SortExtensionEntries(uiTabs)
    state.tabsByKey[key] = entry
    state.tabHandlesByKey[key] = handle
    QueueTabsChanged(state)
    return handle
end

function moduleMethods:RegisterTab(key, definition)
    return RegisterTabEntry(GetModuleState(self), key, definition, "empty")
end

function moduleMethods:RegisterAchievementTab(key, definition)
    return RegisterTabEntry(GetModuleState(self), key, definition, "achievements")
end

local function ResolveEmptyTabCategory(state, tabEntry, value)
    local entry
    if type(value) == "string" then
        entry = tabEntry.categoriesByKey[value]
    elseif type(value) == "table" then
        entry = tabCategoryObjects[value]
    end
    if not entry or entry.state ~= state or entry.tabEntry ~= tabEntry then
        Fail("parent must be a category handle or key from the same empty tab", 3)
    end
    return entry
end

local function RegisterEmptyTabCategory(state, tabEntry, key, definition)
    key = ValidateKey(key, "tab category key")
    if tabEntry.categoriesByKey[key] then
        Fail("tab category key '" .. key .. "' is already registered in tab " .. tabEntry.key, 3)
    end
    if type(definition) ~= "table" then Fail("tab category definition must be a table", 3) end
    local name = ValidateText(definition.name, "tab category name")
    if type(definition.createFrame) ~= "function" then
        Fail("empty-tab category createFrame must be a function", 3)
    end
    ValidateOptionalCallback(definition.onShow, "onShow")
    ValidateOptionalCallback(definition.onHide, "onHide")
    ValidateOptionalCallback(definition.onRefresh, "onRefresh")
    ValidateOptionalTooltip(definition.tooltip)

    local parent
    if definition.parent ~= nil then parent = ResolveEmptyTabCategory(state, tabEntry, definition.parent) end
    local entry = {
        moduleID = state.id,
        state = state,
        tabEntry = tabEntry,
        key = key,
        name = name,
        parent = parent,
        order = tonumber(definition.order) or 100,
        createFrame = definition.createFrame,
        onShow = definition.onShow,
        onHide = definition.onHide,
        onRefresh = definition.onRefresh,
        tooltip = definition.tooltip,
    }
    local handle = MakeTabCategoryHandle(state, tabEntry, key, entry)
    tabEntry.categories[#tabEntry.categories + 1] = entry
    SortExtensionEntries(tabEntry.categories)
    tabEntry.categoriesByKey[key] = entry
    QueueTabsChanged(state)
    return handle, entry
end

function moduleMethods:RegisterTabCategory(tab, key, definition)
    local state = GetModuleState(self)
    local tabEntry = ResolveRegisteredTab(state, tab)
    if tabEntry.kind ~= "empty" then
        Fail("RegisterTabCategory is available only for empty tabs; use RegisterCategory for achievement tabs", 2)
    end
    local handle = RegisterEmptyTabCategory(state, tabEntry, key, definition)
    return handle
end

function moduleMethods:RegisterTabProgressBar(tab, key, definition)
    local state = GetModuleState(self)
    local tabEntry = ResolveRegisteredTab(state, tab)
    key = ValidateKey(key, "tab progress bar key")
    if tabEntry.progressBarsByKey[key] then
        Fail("tab progress bar key '" .. key .. "' is already registered in tab " .. tabEntry.key, 2)
    end
    if #tabEntry.progressBars >= MAX_TAB_PROGRESS_BARS then
        Fail("a tab supports at most " .. MAX_TAB_PROGRESS_BARS .. " progress bars", 2)
    end
    if type(definition) ~= "table" then Fail("tab progress bar definition must be a table", 2) end
    if definition.parent ~= nil then Fail("a tab progress bar always creates a main category and cannot have parent", 2) end
    if definition.onClick ~= nil then Fail("tab progress bar clicks are reserved for category navigation", 2) end

    local name = ValidateText(definition.name or definition.label, "tab progress bar category name")
    local label = type(definition.label) == "string" and ValidateText(definition.label, "tab progress bar label") or name
    ValidateOptionalCallback(definition.isVisible, "isVisible")
    ValidateOptionalTooltip(definition.tooltip)

    local categoryHandle
    local categoryEntry
    local categoryID
    if tabEntry.kind == "achievements" then
        if definition.getProgress ~= nil then
            Fail("achievement-tab progress is calculated from the created category and does not accept getProgress", 2)
        end
        if definition.createFrame ~= nil then
            Fail("achievement-tab progress categories use the native achievement UI and do not accept createFrame", 2)
        end
        categoryHandle = RegisterAchievementCategory(state, key, {
            name = name,
            tab = tabEntry.handle,
            id = definition.id,
            unavailable = definition.unavailable,
            featsOfStrength = definition.featsOfStrength,
            order = definition.order,
        })
        categoryID = categoryHandle.id
    else
        if type(definition.getProgress) ~= "function" then
            Fail("empty-tab progress bars require getProgress", 2)
        end
        if type(definition.createFrame) ~= "function" then
            Fail("empty-tab progress bars require createFrame for their target category", 2)
        end
        categoryHandle, categoryEntry = RegisterEmptyTabCategory(state, tabEntry, key, {
            name = name,
            createFrame = definition.createFrame,
            onShow = definition.onShow,
            onHide = definition.onHide,
            onRefresh = definition.onRefresh,
            tooltip = definition.categoryTooltip,
            order = definition.order,
        })
    end

    local entry = {
        moduleID = state.id,
        state = state,
        tabEntry = tabEntry,
        key = key,
        label = label,
        order = tonumber(definition.order) or 100,
        tooltip = definition.tooltip,
        isVisible = definition.isVisible,
        getProgress = definition.getProgress,
        categoryID = categoryID,
        categoryEntry = categoryEntry,
        categoryHandle = categoryHandle,
    }
    tabEntry.progressBars[#tabEntry.progressBars + 1] = entry
    SortExtensionEntries(tabEntry.progressBars)
    tabEntry.progressBarsByKey[key] = entry
    QueueTabsChanged(state)
    return categoryHandle
end

function moduleMethods:RequestUIRefresh()
    local state = GetModuleState(self)
    eventBus:Publish(events.EXTENSION_UI_REFRESH, state.id)
end

function moduleMethods:Trigger(criteriaType, data, count, mode)
    local state = GetModuleState(self)
    local resolvedType = ResolveCriteriaType(state, criteriaType)
    local resolvedData = ResolveCriteriaData(state, resolvedType, data)
    if count ~= nil and type(tonumber(count)) ~= "number" then
        Fail("trigger count must be numeric or nil", 2)
    end
    if mode ~= nil and mode ~= "increment" and mode ~= "set" then
        Fail("trigger mode must be 'increment', 'set' or nil", 2)
    end
    return progression:Trigger(resolvedType, resolvedData, tonumber(count) or 1, mode == "set")
end

function moduleMethods:Subscribe(eventName, callback)
    local state = GetModuleState(self)
    if type(eventName) ~= "string" then Fail("event name must be a string", 2) end
    local resolvedEvent = publicEvents[eventName] or publicEvents[eventName:upper()]
    if not resolvedEvent then Fail("unsupported public event '" .. eventName .. "'", 2) end
    if type(callback) ~= "function" then Fail("event callback must be a function", 2) end

    local listener = function(...)
        return callback(self, ...)
    end
    eventBus:Subscribe(resolvedEvent, listener)
    local token = {}
    subscriptionStates[token] = { eventName = resolvedEvent, listener = listener, module = state.id }
    state.subscriptions[token] = true
    return token
end

function moduleMethods:Unsubscribe(token)
    local state = GetModuleState(self)
    local subscription = subscriptionStates[token]
    if not subscription or subscription.module ~= state.id then return false end
    local removed = eventBus:Unsubscribe(subscription.eventName, subscription.listener)
    subscriptionStates[token] = nil
    state.subscriptions[token] = nil
    return removed
end

function moduleMethods:GetCategoryID(key)
    local state = GetModuleState(self)
    local handle = state.categoriesByKey[key]
    return handle and handle.id or nil
end

function moduleMethods:GetAchievementID(key)
    local state = GetModuleState(self)
    local handle = state.achievementsByKey[key]
    return handle and handle.id or nil
end

function moduleMethods:GetCriteriaID(achievementKey, criteriaKey)
    local state = GetModuleState(self)
    local ids = state.criteriaIDsByAchievement[achievementKey]
    return ids and ids[criteriaKey] or nil
end

function moduleMethods:GetCriteriaTypeID(key)
    return GetModuleState(self).criteriaTypesByKey[key]
end

function moduleMethods:HasSummaryProgressBar(key)
    return GetModuleState(self).summaryBarsByKey[key] ~= nil
end

function moduleMethods:HasTab(key)
    return GetModuleState(self).tabsByKey[key] ~= nil
end

function moduleMethods:GetTabHandle(key)
    return GetModuleState(self).tabHandlesByKey[key]
end

function moduleMethods:HasTabProgressBar(tab, key)
    local state = GetModuleState(self)
    local tabEntry = ResolveRegisteredTab(state, tab)
    return tabEntry.progressBarsByKey[key] ~= nil
end

function moduleMethods:IsAchievementCompleted(value)
    local state = GetModuleState(self)
    local achievement = ResolveAchievement(state, value)
    local record = GetAchievementRecord(state, achievement.id, false)
    return record and record[1] == true or false
end

function moduleMethods:GetCriteriaProgress(achievementValue, criteriaKeyOrID)
    local state = GetModuleState(self)
    local achievement = ResolveAchievement(state, achievementValue)
    local criteriaID = tonumber(criteriaKeyOrID)
    if not criteriaID and type(achievementValue) == "string" then
        local ids = state.criteriaIDsByAchievement[achievementValue]
        criteriaID = ids and ids[criteriaKeyOrID]
    end
    if not criteriaID then return 0 end
    local record = GetCriteriaRecord(state, achievement.id, criteriaID, false)
    return record and (tonumber(record[2]) or 0) or 0
end

function moduleMethods:ResetProgress()
    local state = GetModuleState(self)
    state.storage.achievements = {}
    for achievementID in pairs(state.achievementHandlesByID) do
        GetAchievementRecord(state, achievementID, true)
        local achievement = db:GetAchievement(achievementID)
        if achievement then
            for criteriaID in pairs(achievement:GetCriterias()) do
                GetCriteriaRecord(state, achievementID, criteriaID, true)
            end
        end
    end
    eventBus:Publish(events.EXTENSION_UI_REFRESH, state.id)
end

local function IsCriteriaCompleted(achievementID, criteria)
    local localCompletion = ns.CompletionManager:GetLocal()
    if criteria.type == criterias.TYPE.COMPLETE_ACHIEVEMENT then
        return localCompletion:IsAchievementCompleted(criteria.data[1])
    end
    return localCompletion:IsCriteriaCompleted(achievementID, criteria.id, criteria) == true
end

local function IsAchievementReady(achievement)
    if not achievement or not achievement:IsAvailable() then return false end
    local anyCriteria = achievement:IsAnyCompletable()
    for _, criteria in pairs(achievement:GetCriterias()) do
        local completed = IsCriteriaCompleted(achievement.id, criteria)
        if anyCriteria and completed then return true end
        if not anyCriteria and not completed then return false end
    end
    return not anyCriteria
end

local function ForceCompleteAchievement(state, achievement)
    local record = GetAchievementRecord(state, achievement.id, true)
    if record[1] then return false end

    local previousID = achievement:GetPreviousID()
    if previousID then
        local previousState = achievementOwners[previousID]
        local previous = db:GetAchievement(previousID)
        if previous and previousState == state then
            ForceCompleteAchievement(state, previous)
        end
    end

    for criteriaID, criteria in pairs(achievement:GetCriterias()) do
        local criteriaRecord = GetCriteriaRecord(state, achievement.id, criteriaID, true)
        criteriaRecord[1] = true
        if criteria.quantity then criteriaRecord[2] = criteria.quantity end
    end
    record[1] = true
    record[2] = GetServerTime()
    eventBus:Publish(events.ACHIEVEMENT_COMPLETED, achievement.id, state.id)
    return true
end

CheckAchievement = function(state, achievementID)
    local achievement = db:GetAchievement(achievementID)
    local record = GetAchievementRecord(state, achievementID, true)
    if record[1] or not IsAchievementReady(achievement) then return false end
    return ForceCompleteAchievement(state, achievement)
end

local function ApplyExternalCriteria(criteria, count, const)
    local owner = criteriaOwners[criteria.id]
    if not owner or criteria.deactivated then return false end
    local state = owner.state
    local achievementID = owner.achievementID
    local achievementRecord = GetAchievementRecord(state, achievementID, true)
    if achievementRecord[1] then return false end

    local criteriaRecord = GetCriteriaRecord(state, achievementID, criteria.id, true)
    local changed = false
    if criteria.quantity then
        local oldValue = tonumber(criteriaRecord[2]) or 0
        local requested = tonumber(count) or 1
        local newValue
        if const then newValue = requested else newValue = oldValue + requested end
        if newValue < 0 then newValue = 0 end
        if newValue > criteria.quantity then newValue = criteria.quantity end
        if newValue ~= oldValue then
            criteriaRecord[2] = newValue
            changed = true
        end
        if newValue >= criteria.quantity and not criteriaRecord[1] then
            criteriaRecord[1] = true
            changed = true
        end
    elseif not criteriaRecord[1] then
        criteriaRecord[1] = true
        changed = true
    end

    if changed then QueueAchievementCheck(state, achievementID) end
    return changed
end

local completionProvider = {}

function completionProvider:IsManagedAchievement(achievementID)
    return achievementOwners[tonumber(achievementID)] ~= nil
end

function completionProvider:GetAchievement(achievementID, create)
    local state = achievementOwners[tonumber(achievementID)]
    if not state then return nil end
    return GetAchievementRecord(state, tonumber(achievementID), create == true)
end

function completionProvider:GetCriteria(achievementID, criteriaID, create)
    local state = achievementOwners[tonumber(achievementID)]
    if not state then return nil end
    return GetCriteriaRecord(state, tonumber(achievementID), tonumber(criteriaID), create == true)
end

local api = {
    API_VERSION = string.format("%d.%d.%d", API_MAJOR, API_MINOR, API_PATCH),
    API_MAJOR = API_MAJOR,
    API_MINOR = API_MINOR,
    API_PATCH = API_PATCH,
    TAB = {
        PLAYER = db.TAB_ID_PLAYER,
        GUILD = db.TAB_ID_GUILD,
        STATS = db.TAB_ID_STATS,
    },
    EVENT = {
        PROGRESS_CHANGED = "PROGRESS_CHANGED",
        ACHIEVEMENT_COMPLETED = "ACHIEVEMENT_COMPLETED",
        TITLE_CHANGED = "TITLE_CHANGED",
        DATABASE_CHANGED = "DATABASE_CHANGED",
        REGISTRATION_COMMITTED = "REGISTRATION_COMMITTED",
    },
    TAB_TYPE = {
        EMPTY = "empty",
        ACHIEVEMENTS = "achievements",
    },
    LIMITS = {
        SUMMARY_PROGRESS_BARS = MAX_SUMMARY_BARS,
        CORE_SUMMARY_PROGRESS_BARS = MAX_SUMMARY_BARS,
        TAB_PROGRESS_BARS = MAX_TAB_PROGRESS_BARS,
        ACHIEVEMENT_TAB_MAIN_CATEGORIES = MAX_ACHIEVEMENT_TAB_MAIN_CATEGORIES,
        REGISTRATION_CHECKS_PER_SLICE = REGISTRATION_MAX_CHECKS_PER_SLICE,
        REGISTRATION_TIME_BUDGET_MS = REGISTRATION_TIME_BUDGET_MS,
    },
    STORAGE = {
        SCHEMA_VERSION = EXTENSION_STORAGE_SCHEMA,
        ROOT_KEY = EXTENSION_STORAGE_KEY,
        POLICY = "extension-owned-only",
    },
    CLIENT_FLAVOR = {
        CLASSIC_ERA = "CLASSIC_ERA",
        TBC_ANNIVERSARY = "TBC_ANNIVERSARY",
    },
    ID_RANGE = {
        CATEGORY_FIRST = ID_RANGES.category.first,
        CATEGORY_LAST = ID_RANGES.category.first + ID_RANGES.category.span - 1,
        ACHIEVEMENT_FIRST = ID_RANGES.achievement.first,
        ACHIEVEMENT_LAST = ID_RANGES.achievement.first + ID_RANGES.achievement.span - 1,
        CRITERIA_FIRST = ID_RANGES.criteria.first,
        CRITERIA_LAST = ID_RANGES.criteria.first + ID_RANGES.criteria.span - 1,
        CRITERIA_TYPE_FIRST = ID_RANGES.criteriaType.first,
        CRITERIA_TYPE_LAST = ID_RANGES.criteriaType.first + ID_RANGES.criteriaType.span - 1,
    },
    CRITERIA_TYPE = {},
}

for name, id in pairs(criterias.TYPE) do
    api.CRITERIA_TYPE[name] = id
end

function api:GetVersion()
    return API_MAJOR, API_MINOR, API_PATCH
end

function api:GetAddonVersion()
    if type(GetAddOnMetadata) == "function" then
        return GetAddOnMetadata(addonName or "AnniversaryAchievements", "Version")
    end
    return "v2.3.43"
end

function api:GetClientFlavor()
    if ns.IsTBCAnniversary then return self.CLIENT_FLAVOR.TBC_ANNIVERSARY end
    return self.CLIENT_FLAVOR.CLASSIC_ERA
end

function api:GetClientInterfaceVersion()
    return tonumber(ns.ClientFlavor and ns.ClientFlavor.interfaceVersion) or 0
end

function api:IsClassicEra()
    return ns.IsClassicEra == true
end

function api:IsTBCAnniversary()
    return ns.IsTBCAnniversary == true
end

function api:IsCompatible(requiredMajor, minimumMinor)
    requiredMajor = tonumber(requiredMajor)
    minimumMinor = tonumber(minimumMinor or 0)
    return requiredMajor == API_MAJOR and minimumMinor <= API_MINOR
end

function api:RegisterModule(moduleID, metadata)
    moduleID = ValidateKey(moduleID, "module id")
    metadata = metadata or {}
    if type(metadata) ~= "table" then Fail("module metadata must be a table", 2) end

    local existing = modulesByID[moduleID]
    if existing then
        if metadata.storage ~= nil and metadata.storage ~= existing.storageRoot then
            Fail("module id '" .. moduleID .. "' is already registered with a different storage table", 2)
        end
        return existing.handle
    end

    local moduleStorage = PrepareModuleStorage(moduleID, metadata.storage)
    local state = {
        id = moduleID,
        metadata = {
            name = type(metadata.name) == "string" and metadata.name or moduleID,
            version = type(metadata.version) == "string" and metadata.version or tostring(metadata.version or "unknown"),
            author = type(metadata.author) == "string" and metadata.author or nil,
        },
        storage = moduleStorage,
        storageRoot = metadata.storage,
        categoriesByKey = {},
        categoryHandlesByID = {},
        achievementsByKey = {},
        achievementHandlesByID = {},
        criteriaIDsByAchievement = {},
        criteriaTypesByKey = {},
        summaryBarsByKey = {},
        tabsByKey = {},
        tabHandlesByKey = {},
        subscriptions = {},
        bulkDepth = 0,
        registrationDirty = false,
        pendingStructureChanges = {},
        pendingContentChanges = {},
        pendingCommitChangeCount = 0,
        pendingSummaryBarsChanged = false,
        pendingTabsChanged = false,
    }

    local handle = setmetatable({}, { __index = moduleMethods, __metatable = false })
    state.handle = handle
    moduleStates[handle] = state
    modulesByID[moduleID] = state
    TouchStartupActivity()

    if type(ns.RefreshModuleSettings) == "function" then
        local ok, err = pcall(ns.RefreshModuleSettings)
        if not ok then ReportExtensionError(moduleID, "settings module list", err) end
    end
    eventBus:Publish(events.MODULES_CHANGED, moduleID)
    return handle
end

function api:GetModule(moduleID)
    local state = modulesByID[moduleID]
    return state and state.handle or nil
end

function api:GetRegisteredModules()
    local result = {}
    for moduleID, state in pairs(modulesByID) do
        result[#result + 1] = {
            id = moduleID,
            name = state.metadata.name,
            version = state.metadata.version,
            author = state.metadata.author,
        }
    end
    table.sort(result, function(left, right) return left.id < right.id end)
    return result
end

function api:GetCategory(categoryID)
    local category = db:GetCategory(tonumber(categoryID))
    if not category then return nil end
    return {
        id = category.id,
        name = category.name,
        parentID = category.parentID,
        tabID = category.tabID,
        order = category.apiOrder,
        featsOfStrength = category.isFeatsOfStrength == true,
        available = category:IsAvailable(),
    }
end

function api:GetAchievement(achievementID)
    local achievement = db:GetAchievement(tonumber(achievementID))
    if not achievement then return nil end
    local criteriaSnapshots = {}
    for _, criteria in ipairs(achievement:GetCriteriasSorted()) do
        criteriaSnapshots[#criteriaSnapshots + 1] = {
            id = criteria.id,
            name = criteria.name,
            type = criteria.type,
            quantity = criteria.quantity,
            hidden = criteria.hidden == true,
        }
    end
    local titleReward = achievement:GetTitleReward()
    local titleSnapshot
    if titleReward then
        titleSnapshot = {
            key = titleReward.key,
            label = titleReward.label,
            format = titleReward.format,
            femaleFormat = titleReward.femaleFormat,
            nativeMask = titleReward.nativeMask,
            nativeMaskFemale = titleReward.nativeMaskFemale,
            sourceModuleID = titleReward.sourceModuleID,
        }
    end
    return {
        id = achievement.id,
        name = achievement.name,
        description = achievement.description,
        points = achievement.points,
        icon = achievement.icon,
        rewardText = achievement:GetRewardText(),
        titleReward = titleSnapshot,
        categoryID = achievement.categoryID,
        tabID = achievement.tabID,
        available = achievement:IsAvailable(),
        hideCriteriaUI = achievement.hideCriteriaUI == true,
        criteria = criteriaSnapshots,
    }
end

function api:GetEarnedTitles()
    if not ns.Titles then return {} end
    return ns.Titles:GetEarnedTitles()
end

function api:GetSelectedTitle()
    if not ns.Titles then return nil end
    return ns.Titles:GetSelectedTitle()
end

function api:IsAchievementCompleted(achievementID)
    achievementID = tonumber(achievementID)
    if not achievementID then return false end
    return ns.CompletionManager:GetLocal():IsAchievementCompleted(achievementID)
end

function api:GetCriteriaProgress(achievementID, criteriaID)
    achievementID = tonumber(achievementID)
    criteriaID = tonumber(criteriaID)
    if not achievementID or not criteriaID then return 0 end
    return progression:GetCriteriaProgression(achievementID, criteriaID)
end

function api:GetRegisteredSummaryProgressBars()
    local result = {}
    for index, entry in ipairs(summaryBars) do
        result[index] = { moduleID = entry.moduleID, key = entry.key, label = entry.label, order = entry.order }
    end
    return result
end

function api:GetRegisteredTabs()
    local result = {}
    for index, entry in ipairs(uiTabs) do
        result[index] = {
            moduleID = entry.moduleID, key = entry.key, name = entry.name, title = entry.title,
            order = entry.order, tabType = entry.kind, tabID = entry.databaseTabID,
            progressBarCount = #entry.progressBars, mainCategoryCount = entry.mainCategoryCount,
        }
    end
    return result
end

function api:IsExtensionAchievement(achievementID)
    return achievementOwners[tonumber(achievementID)] ~= nil
end

function api:_TriggerExtensions(criteriaType, data, count, const)
    local matches = criterias:GetTriggeredCriterias(criteriaType, data)
    if not matches then return false end
    local changed = false
    for index = 1, #matches do
        if criteriaOwners[matches[index].id] and ApplyExternalCriteria(matches[index], count, const) then
            changed = true
        end
    end
    return changed
end

-- Internal, read-only integration surface used by the main addon's UI.
-- It is intentionally not documented as part of the public API contract.
function api:_GetSummaryProgressBars()
    return summaryBars
end

function api:_GetTabs()
    return uiTabs
end

local function CountCategoryAchievements(categoryID, visited, expectedTabID)
    visited = visited or {}
    if visited[categoryID] then return 0, 0 end
    visited[categoryID] = true

    local current, maximum = 0, 0
    local category = db:GetCategory(categoryID)
    if not category then return current, maximum end
    if expectedTabID and category.tabID ~= expectedTabID then return current, maximum end

    local completion = ns.CompletionManager:GetLocal()
    for _, achievement in pairs(category:GetAchievements()) do
        if (not expectedTabID or achievement.tabID == expectedTabID) and achievement:IsAvailable() then
            maximum = maximum + 1
            if completion:IsAchievementCompleted(achievement.id) then
                current = current + 1
            end
        end
    end

    for childID, child in pairs(db:GetAllCategories()) do
        if child.parentID == categoryID
            and (not expectedTabID or child.tabID == expectedTabID)
            and child:IsAvailable() then
            local childCurrent, childMaximum = CountCategoryAchievements(childID, visited, expectedTabID)
            current = current + childCurrent
            maximum = maximum + childMaximum
        end
    end

    return current, maximum
end

function api:_EvaluateSummaryProgressBar(entry, context)
    context = type(context) == "table" and context or {}
    if entry.isVisible then
        local ok, visible = ProtectedCall(entry.state, "summary bar " .. entry.key .. " visibility", entry.isVisible, context)
        if not ok or visible == false then return nil end
    end

    local current, maximum, text
    if entry.categoryID then
        if not db:GetCategory(entry.categoryID) then return nil end
        current, maximum = CountCategoryAchievements(entry.categoryID)
    else
        local ok
        ok, current, maximum, text = ProtectedCall(entry.state, "summary bar " .. entry.key .. " progress", entry.getProgress, context)
        if not ok then return nil end
    end

    current = tonumber(current) or 0
    maximum = tonumber(maximum) or 0
    if maximum < 0 then maximum = 0 end
    if current < 0 then current = 0 end
    if maximum > 0 and current > maximum then current = maximum end
    if text == nil then text = tostring(current) .. "/" .. tostring(maximum) end
    return current, maximum, tostring(text)
end

function api:_GetSummaryProgressBarTooltip(entry, context)
    if type(entry.tooltip) == "string" then return entry.tooltip end
    if type(entry.tooltip) == "function" then
        local ok, value = ProtectedCall(entry.state, "summary bar " .. entry.key .. " tooltip", entry.tooltip, type(context) == "table" and context or {})
        if ok and value ~= nil then return tostring(value) end
    end
    return nil
end

function api:_ClickSummaryProgressBar(entry, button)
    if not entry.onClick then return end
    ProtectedCall(entry.state, "summary bar " .. entry.key .. " click", entry.onClick, button)
end

function api:_CreateTabFrame(entry, parent)
    if not entry.createFrame then return true end
    return ProtectedCall(entry.state, "tab " .. entry.key .. " createFrame", entry.createFrame, parent)
end

function api:_InvokeTabCallback(entry, callbackName, frame)
    local callback = entry[callbackName]
    if not callback then return true end
    return ProtectedCall(entry.state, "tab " .. entry.key .. " " .. callbackName, callback, frame)
end

function api:_GetTabTooltip(entry)
    if type(entry.tooltip) == "string" then return entry.tooltip end
    if type(entry.tooltip) == "function" then
        local ok, value = ProtectedCall(entry.state, "tab " .. entry.key .. " tooltip", entry.tooltip)
        if ok and value ~= nil then return tostring(value) end
    end
    return nil
end

function api:_GetTabProgressBars(entry)
    return entry and entry.progressBars or {}
end

function api:_EvaluateTabProgressBar(entry, context)
    context = type(context) == "table" and context or {}
    if entry.isVisible then
        local ok, visible = ProtectedCall(entry.state, "tab progress bar " .. entry.key .. " visibility", entry.isVisible, context)
        if not ok or visible == false then return nil end
    end
    local current, maximum, text
    if entry.categoryID then
        local expectedTabID = entry.tabEntry and entry.tabEntry.databaseTabID or nil
        local category = db:GetCategory(entry.categoryID)
        if expectedTabID and (not category or category.tabID ~= expectedTabID) then return nil end
        current, maximum = CountCategoryAchievements(entry.categoryID, nil, expectedTabID)
        -- A category-backed bar without any registered achievements has no
        -- meaningful progress or navigation target yet. Keep it out of the
        -- summary until the category (or one of its descendants) owns content.
        if expectedTabID and maximum <= 0 then return nil end
    else
        local ok
        ok, current, maximum, text = ProtectedCall(entry.state, "tab progress bar " .. entry.key .. " progress", entry.getProgress, context)
        if not ok then return nil end
    end
    current = tonumber(current) or 0
    maximum = tonumber(maximum) or 0
    if maximum < 0 then maximum = 0 end
    if current < 0 then current = 0 end
    if maximum > 0 and current > maximum then current = maximum end
    if text == nil then text = tostring(current) .. "/" .. tostring(maximum) end
    return current, maximum, tostring(text)
end

function api:_GetTabProgressBarTooltip(entry, context)
    if type(entry.tooltip) == "string" then return entry.tooltip end
    if type(entry.tooltip) == "function" then
        local ok, value = ProtectedCall(entry.state, "tab progress bar " .. entry.key .. " tooltip", entry.tooltip, context or {})
        if ok and value ~= nil then return tostring(value) end
    end
    return nil
end

function api:_GetEmptyTabCategories(entry)
    return entry and entry.categories or {}
end

function api:_CreateEmptyTabCategoryFrame(entry, parent)
    return ProtectedCall(entry.state, "tab category " .. entry.key .. " createFrame", entry.createFrame, parent)
end

function api:_InvokeEmptyTabCategoryCallback(entry, callbackName, frame)
    local callback = entry and entry[callbackName]
    if not callback then return true end
    return ProtectedCall(entry.state, "tab category " .. entry.key .. " " .. callbackName, callback, frame)
end

function api:_GetEmptyTabCategoryTooltip(entry)
    if type(entry.tooltip) == "string" then return entry.tooltip end
    if type(entry.tooltip) == "function" then
        local ok, value = ProtectedCall(entry.state, "tab category " .. entry.key .. " tooltip", entry.tooltip)
        if ok and value ~= nil then return tostring(value) end
    end
    return nil
end

function api:_IsFeatsOfStrengthCategory(categoryID)
    return IsFeatsOfStrengthCategory(db:GetCategory(tonumber(categoryID)))
end

function api:_GetDatabaseTabEntry(tabID)
    return databaseTabEntries[tonumber(tabID)]
end

ProcessRegistrationQueue = function()
    if registrationQueue.processing then return end
    registrationQueue.processing = true

    local function CollectReadyStates(predicate)
        local states = {}
        for _, state in pairs(modulesByID) do
            if state.bulkDepth == 0 and predicate(state) then
                states[#states + 1] = state
            end
        end
        table.sort(states, function(left, right) return left.id < right.id end)
        return states
    end

    local function FlushStructureChanges()
        local states = CollectReadyStates(HasPendingStructure)
        for index = 1, #states do
            local state = states[index]
            local changes = state.pendingStructureChanges
            local summaryBarsChanged = state.pendingSummaryBarsChanged == true
            local tabsChanged = state.pendingTabsChanged == true

            -- Detach the published snapshot first. Registrations triggered by an
            -- event listener therefore remain queued for the next pass instead
            -- of being cleared together with the current notification.
            state.pendingStructureChanges = {}
            state.pendingSummaryBarsChanged = false
            state.pendingTabsChanged = false

            local changeCount = #changes
            if changeCount > 0 then
                -- Preserve the established DATABASE_CHANGED argument prefix.
                -- The final extra argument identifies the UI refresh phase.
                eventBus:Publish(events.DATABASE_CHANGED, "batch", nil, state.id, changes, "structure")
                state.pendingCommitChangeCount = state.pendingCommitChangeCount + changeCount
            end
            if summaryBarsChanged then
                eventBus:Publish(events.SUMMARY_BARS_CHANGED, state.id)
            end
            if tabsChanged then
                eventBus:Publish(events.UI_TABS_CHANGED, state.id)
            end
        end
    end

    local function FlushContentChanges()
        local states = CollectReadyStates(function(state)
            return #state.pendingContentChanges > 0
        end)
        for index = 1, #states do
            local state = states[index]
            local changes = state.pendingContentChanges
            state.pendingContentChanges = {}

            local changeCount = #changes
            if changeCount > 0 then
                -- Content is published after every bounded processing slice.
                -- The UI can therefore refresh while an extension is still
                -- registering instead of waiting for the final commit.
                eventBus:Publish(events.DATABASE_CHANGED, "batch", nil, state.id, changes, "content")
                state.pendingCommitChangeCount = state.pendingCommitChangeCount + changeCount
            end
        end
    end

    -- Categories, summary bars and tabs are presentation structure. Publish
    -- them before any bounded achievement-completion work so the first visible
    -- refresh already knows the final extension hierarchy.
    FlushStructureChanges()

    local startedAt = GetProfileTimeMS()
    local processed = 0
    local checks = registrationQueue.checks
    local head = registrationQueue.head

    -- Keep an advancing head instead of copying every unprocessed queue entry
    -- into a new table on every slice. The old implementation walked the whole
    -- remaining queue after the budget was reached, turning large packs into
    -- avoidable quadratic work.
    while head <= #checks do
        local elapsed = startedAt and (GetProfileTimeMS() - startedAt) or 0
        local budgetReached = processed >= REGISTRATION_MAX_CHECKS_PER_SLICE
            or (startedAt and elapsed >= REGISTRATION_TIME_BUDGET_MS)
        if budgetReached then break end

        local item = checks[head]
        if item.state.bulkDepth > 0 then
            -- Normally no blocked item reaches a scheduled pass because bulk
            -- registration defers scheduling. This swap keeps multiple modules
            -- robust without rebuilding the queue.
            local runnableIndex
            for index = head + 1, #checks do
                local candidate = checks[index]
                if candidate and candidate.state.bulkDepth == 0 then
                    runnableIndex = index
                    break
                end
            end
            if not runnableIndex then break end
            checks[head], checks[runnableIndex] = checks[runnableIndex], checks[head]
            item = checks[head]
        end

        registrationQueue.checkKeys[item.key] = nil
        registrationQueue.pendingCheckCount[item.state] = math.max(0, (registrationQueue.pendingCheckCount[item.state] or 1) - 1)
        CheckAchievement(item.state, item.achievementID)
        processed = processed + 1
        head = head + 1
    end

    registrationQueue.head = head
    if registrationQueue.head > #registrationQueue.checks then
        registrationQueue.checks = {}
        registrationQueue.head = 1
    end

    -- A completion callback may itself add structure. Preserve the structure-
    -- first guarantee before publishing the content accumulated in this slice.
    FlushStructureChanges()
    FlushContentChanges()

    local readyStates = CollectReadyStates(function(state)
        return state.registrationDirty
            and not HasPendingStructure(state)
            and #state.pendingContentChanges == 0
            and (registrationQueue.pendingCheckCount[state] or 0) == 0
    end)

    for index = 1, #readyStates do
        local state = readyStates[index]
        local changeCount = state.pendingCommitChangeCount
        state.pendingStructureChanges = {}
        state.pendingContentChanges = {}
        state.pendingCommitChangeCount = 0
        state.pendingSummaryBarsChanged = false
        state.pendingTabsChanged = false
        state.registrationDirty = false
        TouchStartupActivity()
        eventBus:Publish(events.REGISTRATION_COMMITTED, state.id, changeCount)
    end

    registrationQueue.processing = false
    ScheduleRegistrationWork()
end

local existing = rawget(_G, GLOBAL_NAME)
if existing ~= nil and existing ~= api then
    Fail("global name " .. GLOBAL_NAME .. " is already in use", 1)
end
rawset(_G, GLOBAL_NAME, api)
ns.PublicAPI = api
ns.CompletionManager:SetExternalProvider(completionProvider)

-- Recheck only meta achievements that explicitly depend on the completed
-- achievement. The previous all-achievements scan was O(n) per completion and
-- could become O(n²) while a large extension pack was being registered.
eventBus:Subscribe(events.ACHIEVEMENT_COMPLETED, function(achievementID)
    local dependents = metaDependentsByAchievementID[tonumber(achievementID)]
    if not dependents then return end
    for _, dependent in pairs(dependents) do
        QueueAchievementCheck(dependent.state, dependent.achievementID)
    end
end)
