local _, ns = ...

local state = ns.State
local eventBus = ns.EventBus
local events = ns.Events

local struct = {}
ns.CompletionManager = struct
local mapping = {}
local metaMapping = {} -- subAchievementID -> { metaAchievementIDs }
local externalProvider

local function UsesExternalProvider(usesLocalData, achievementID)
    return usesLocalData
        and externalProvider
        and type(externalProvider.IsManagedAchievement) == "function"
        and externalProvider:IsManagedAchievement(achievementID)
end

local function Completion(data, usesLocalData)
    return {
        getData = function(self)
            if usesLocalData then
                return state:GetLocalData()
            end
            if type(data) ~= "table" then
                data = {}
            end
            return data
        end,
        AddAchievement = function(self, id)
            if UsesExternalProvider(usesLocalData, id) then
                return externalProvider:GetAchievement(id, true)
            end
            if self:getData()[id] then error('achievement completion ' .. id .. ' is already present') end
            self:getData()[id] = {false, 0, {}}
            return self:getData()[id]
        end,
        AddCriteria = function(self, achievementID, criteriaID)
            if UsesExternalProvider(usesLocalData, achievementID) then
                return externalProvider:GetCriteria(achievementID, criteriaID, true)
            end
            local achievement = self:GetAchievement(achievementID)
            if not achievement then
                achievement = self:AddAchievement(achievementID)
            end
            if achievement[3][criteriaID] then error('achievement criteria completion ' .. achievementID .. '/' .. criteriaID .. ' is already present') end
            local criteria = {false}
            achievement[3][criteriaID] = criteria
            
            return achievement[3][criteriaID]
        end,
        GetAchievement = function(self, id, createIfNotPresent)
            if UsesExternalProvider(usesLocalData, id) then
                return externalProvider:GetAchievement(id, createIfNotPresent == true)
            end
            local result = self:getData()[id]
            if not result and createIfNotPresent then
                result = self:AddAchievement(id)
            end
            return result
        end,
        GetCriteria = function(self, achievementID, criteriaID, createIfNotPresent)
            if UsesExternalProvider(usesLocalData, achievementID) then
                return externalProvider:GetCriteria(achievementID, criteriaID, createIfNotPresent == true)
            end
            local achievement = self:GetAchievement(achievementID)
            local criteria = nil
            if achievement then
                criteria = achievement[3][criteriaID]
            end
            if not criteria and createIfNotPresent then
                criteria = self:AddCriteria(achievementID, criteriaID)
            end
            return criteria
        end,
        IsAchievementCompleted = function(self, id)
            local achievement = self:GetAchievement(id)
            if not achievement then return false end
            return achievement[1]
        end,
        GetAchievementCompletionTime = function(self, id)
            local achievement = self:GetAchievement(id)
            if not achievement then return 0 end
            return achievement[2]
        end,
        IsCriteriaCompleted = function(self, achievementID, criteriaID, realCriteria)
            local criteria = self:GetCriteria(achievementID, criteriaID)
            realCriteria = realCriteria or ns.Criterias:GetCriteriaByID(criteriaID)

            if realCriteria and realCriteria.type == ns.Criterias.TYPE.OR and realCriteria.data then
                for _, sub in ipairs(realCriteria.data) do
                    if self:IsCriteriaCompleted(achievementID, sub.id) then
                        return true
                    end
                end
                return false
            elseif realCriteria and realCriteria.type == ns.Criterias.TYPE.COMPLETE_ACHIEVEMENT then
                return self:IsAchievementCompleted(realCriteria.data[1])
            end

            return criteria and criteria[1]
        end,
        AreAllCriteriasCompleted = function(self, achievementData)
            for id, criteria in pairs(achievementData:GetCriterias()) do
                if not self:IsCriteriaCompleted(achievementData.id, id, criteria) then return false end
            end
            return true
        end,
		isAchievementCompleted = function(self, achievementData)
            if not (achievementData and achievementData:IsAvailable()) then
                return false
            end

            local anyCompletable = achievementData:IsAnyCompletable()

            for _, criteria in pairs(achievementData:GetCriterias()) do
                local completed

                if criteria.type == ns.Criterias.TYPE.COMPLETE_ACHIEVEMENT then
                    completed = self:IsAchievementCompleted(criteria.data[1])
                else
                    completed = self:IsCriteriaCompleted(achievementData.id, criteria.id, criteria)
                end

                if anyCompletable then
                    if completed then
                        return true -- OR logic
                    end
                else
                    if not completed then
                        return false -- AND logic
                    end
                end
            end

            return not anyCompletable
        end,
        GetCriteriaProgression = function(self, achievementID, criteriaID)
            local criteria = self:GetCriteria(achievementID, criteriaID)
            if not criteria then return 0 end
            return criteria[2] or 0
        end,
        CompleteAchievement = function(self, id)
            local achievement = self:GetAchievement(id, true)
            if achievement[1] then return false end

            achievement[1] = true
            achievement[2] = GetServerTime()

            local metas = metaMapping[id]
            if metas then
                for _, metaID in ipairs(metas) do
                    self:checkAndComplete(metaID)
                end
            end

            return true
        end,
        completeAchievementGracefully = function(self, achievement, forcefully)
            local previousID = achievement:GetPreviousID()
            if previousID and not self:IsAchievementCompleted(previousID) then
                local previous = ns.Database:GetAchievement(previousID)
                if previous then self:completeAchievementGracefully(previous, true) end
            end

            if forcefully then
                for criteriaID, criteria in pairs(achievement:GetCriterias()) do
                    self:CompleteCriteria(achievement.id, criteriaID)
                    if criteria.quantity then
                        self:SetCriteriaProgression(achievement.id, criteriaID, criteria.quantity, criteria.quantity)
                    else
                        self:CompleteCriteria(achievement.id, criteriaID)
                    end
                end
            end

            if self:CompleteAchievement(achievement.id) then
                eventBus:Publish(events.ACHIEVEMENT_COMPLETED, achievement.id)
            end
        end,
        CompleteCriteria = function(self, achievementID, criteriaID, withQuantity)
            if self:IsAchievementCompleted(achievementID) then return false end
            local criteria = self:GetCriteria(achievementID, criteriaID, true)
            if not criteria or criteria[1] then return false end
            criteria[1] = true
            return true
        end,
		SetCriteriaProgression = function(self, achievementID, criteriaID, value, requiredQuantity)
			if self:IsAchievementCompleted(achievementID) then return false, false end
			local criteria = self:GetCriteria(achievementID, criteriaID, true)
            local previousProgress = criteria[2] or 0
            local newProgress = min(value, requiredQuantity)
            local progressChanged = newProgress ~= previousProgress

            if progressChanged then
                criteria[2] = newProgress
            end

			if newProgress >= requiredQuantity then
				local criteriaCompleted = self:CompleteCriteria(achievementID, criteriaID)
                return criteriaCompleted, progressChanged or criteriaCompleted
			end
			return false, progressChanged
        end,
        IncrementCriteriaProgression = function(self, achievementID, criteriaID, requiredQuantity, count)
            if self:IsAchievementCompleted(achievementID) then return false, false end
            count = count or 0
            local criteria = self:GetCriteria(achievementID, criteriaID, true)
            local previousProgress = criteria[2] or 0
            local newProgress = min(previousProgress + count, requiredQuantity)
            local progressChanged = newProgress ~= previousProgress

            if not progressChanged then return false, false end

            criteria[2] = newProgress
            if newProgress >= requiredQuantity then
                local criteriaCompleted = self:CompleteCriteria(achievementID, criteriaID)
                return criteriaCompleted, true
            end
            return false, true
        end,
        checkAndComplete = function(self, achievementID)
            if self:IsAchievementCompleted(achievementID) then return end
            local achievement = ns.Database:GetAchievement(achievementID)
            if self:isAchievementCompleted(achievement) then
                self:completeAchievementGracefully(achievement)
            end
        end,
        CompleteCriteriaGlobally = function(self, criteriaID)
            local achievementIDs = mapping[criteriaID]
            if not achievementIDs then return false end
            local anyProgressChanged = false

            for _, achievementID in pairs(achievementIDs) do
                if self:CompleteCriteria(achievementID, criteriaID) then
                    anyProgressChanged = true
                    self:checkAndComplete(achievementID)
                end
            end

            return anyProgressChanged
        end,
        SetCriteriaProgressionGlobally = function(self, criteriaID, requiredQuantity, count)
            local achievementIDs = mapping[criteriaID]
            if not achievementIDs then return false end
            local anyProgressChanged = false

            for _, achievementID in pairs(achievementIDs) do
                local criteriaCompleted, progressChanged = self:SetCriteriaProgression(achievementID, criteriaID, count, requiredQuantity)
                if progressChanged then
                    anyProgressChanged = true
                end
                if criteriaCompleted then
                    self:checkAndComplete(achievementID)
                end
            end

            return anyProgressChanged
        end,
        IncrementCriteriaProgressionGlobally = function(self, criteriaID, requiredQuantity, count)
            local achievementIDs = mapping[criteriaID]
            if not achievementIDs then return false end
            local anyProgressChanged = false

            for _, achievementID in pairs(achievementIDs) do
                local criteriaCompleted, progressChanged = self:IncrementCriteriaProgression(achievementID, criteriaID, requiredQuantity, count)
                if progressChanged then
                    anyProgressChanged = true
                end
                if criteriaCompleted then
                    self:checkAndComplete(achievementID)
                end
            end

            return anyProgressChanged
        end,
        ReCheckAchievements = function(self)
            for id, data in pairs(self:getData()) do
                if data[1] == false then
                    self:checkAndComplete(id)
                end
            end
        end,
        TakeIncompleteAchievements = function(self)
            for id, data in pairs(self:getData()) do
                if data[1] then
                    local ach = ns.Database:GetAchievement(id)
                    if self:isAchievementCompleted(ach) then
                        -- ok
                    else
                        data[1] = false
                        data[2] = 0
                    end
                end
            end
        end,
        UpdateNewCriteriasOfOldType = function(self)
            local data = self:getData()
            local copies = {
                {380, 25},
                {381, 25}
            }
            for _, pair in pairs(copies) do
                local to = pair[1]
                local from = pair[2]
                local cidFrom = ns.Database:GetAchievement(from):GetCriteriasSorted()[1].id
                if data[from] and data[from][3] and data[from][3][cidFrom] and data[from][3][cidFrom][2] then
                    local cidTo = ns.Database:GetAchievement(to):GetCriteriasSorted()[1].id
                    if not data[to] or not data[to][3] or not data[to][3][cidTo] or data[to][3][cidTo][2] < data[from][3][cidFrom][2] then
                        data[to] = {false, 0, {[cidTo] = {false, data[from][3][cidFrom][2]}}}
                    end
                end
            end
        end,
        Reset = function(self)
            if usesLocalData then
                state:ResetLocalData()
                eventBus:Publish(events.LOCAL_DATA_RESET)
            else
                data = {}
            end

            CA_FirstLogin = true
        end
    }
end

struct.localCompletion = Completion(nil, true)

function struct:SetExternalProvider(provider)
    if provider ~= nil and type(provider) ~= "table" then
        error("external completion provider must be a table or nil")
    end
    externalProvider = provider
end

function struct:GetLocal()
    return struct.localCompletion
end

function struct:GetTarget()
    return struct.targetCompletion
end

function struct:SetTarget(data)
    struct.targetCompletion = Completion(data, false)
end

function struct:PostLoad(categories)
    local function processCriteria(achievementID, criteria)
        if criteria.type == ns.Criterias.TYPE.OR then
            -- ✅ FIX: Loop through all subcriteria instead of hardcoding two
            for _, subCriteria in ipairs(criteria.data) do
                processCriteria(achievementID, subCriteria)
            end

		elseif criteria.type == ns.Criterias.TYPE.COMPLETE_ACHIEVEMENT then
			-- This is a meta requirement: sub-achievement must be completed
			local subID = criteria.data[1]  -- the achievement ID being referenced
			metaMapping[subID] = metaMapping[subID] or {}
			table.insert(metaMapping[subID], achievementID)

		else
			-- Normal criteria (zone discovered etc.)
			if not mapping[criteria.id] then mapping[criteria.id] = {} end
			local achievementIDs = mapping[criteria.id]
			achievementIDs[#achievementIDs + 1] = achievementID
		end
	end

    for _, category in pairs(categories) do
        for achievementID, achievement in pairs(category:GetAchievements()) do
            if achievement:IsAvailable() then
                -- criteria mapping (existing)
                for _, criteria in pairs(achievement:GetCriterias()) do
                    processCriteria(achievementID, criteria)
                end
            end
        end
    end
end