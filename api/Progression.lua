local _, ns = ...

local criterias = ns.Criterias
local completion = ns.CompletionManager:GetLocal()
local eventBus = ns.EventBus
local events = ns.Events

local progression = {
    TYPE = criterias.TYPE,
    GEAR_SLOT = criterias.GEAR_SLOT
}
ns.Progression = progression

local function ApplyCriteria(criteria, count, const)
    if criteria.deactivated then return false end

    if criteria.quantity then
        if const then
            return completion:SetCriteriaProgressionGlobally(criteria.id, criteria.quantity, count)
        end
        return completion:IncrementCriteriaProgressionGlobally(criteria.id, criteria.quantity, count)
    end

    return completion:CompleteCriteriaGlobally(criteria.id)
end

function progression:Trigger(criteriaType, data, count, const)
    local matches = criterias:GetTriggeredCriterias(criteriaType, data)
    count = count or 1
    local anyProgressChanged = false

    if matches then
        for index = 1, #matches do
            if ApplyCriteria(matches[index], count, const) then
                anyProgressChanged = true
            end
        end
    end

    -- Public extension achievements use their own SavedVariables. The public
    -- API receives the same trigger but writes only through the extension's
    -- registered storage adapter, never through CA_LocalData.
    local publicAPI = ns.PublicAPI
    if publicAPI and type(publicAPI._TriggerExtensions) == "function" then
        if publicAPI:_TriggerExtensions(criteriaType, data, count, const) then
            anyProgressChanged = true
        end
    end

    if anyProgressChanged then
        eventBus:Publish(events.PROGRESS_CHANGED, criteriaType, data)
    end

    return anyProgressChanged
end

function progression:GetCriteriaProgression(achievementID, criteriaID)
    return completion:GetCriteriaProgression(achievementID, criteriaID)
end

function progression:ReCheckAchievements()
    return completion:ReCheckAchievements()
end

function progression:PostLoad(categories)
    return ns.CompletionManager:PostLoad(categories)
end

-- Achievement completion is a domain event. Progression listens for it and
-- evaluates COMPLETE_ACHIEVEMENT criteria without Completion knowing how the
-- criteria registry is implemented.
eventBus:Subscribe(events.ACHIEVEMENT_COMPLETED, function(achievementID)
    progression:Trigger(criterias.TYPE.COMPLETE_ACHIEVEMENT, {achievementID}, 1)
end)
