local _, ns = ...

local eventBus = {}
ns.EventBus = eventBus

ns.Events = {
    PROGRESS_CHANGED = "PROGRESS_CHANGED",
    ACHIEVEMENT_COMPLETED = "ACHIEVEMENT_COMPLETED",
    TITLE_CHANGED = "TITLE_CHANGED",
    LOCAL_DATA_RESET = "LOCAL_DATA_RESET",
    DATABASE_CHANGED = "DATABASE_CHANGED",
    SUMMARY_BARS_CHANGED = "SUMMARY_BARS_CHANGED",
    UI_TABS_CHANGED = "UI_TABS_CHANGED",
    EXTENSION_UI_REFRESH = "EXTENSION_UI_REFRESH",
    MODULES_CHANGED = "MODULES_CHANGED",
    REGISTRATION_COMMITTED = "REGISTRATION_COMMITTED"
}

local listenersByEvent = {}

function eventBus:Subscribe(eventName, listener)
    if type(eventName) ~= "string" then
        error("eventName must be a string")
    end
    if type(listener) ~= "function" then
        error("listener must be a function")
    end

    local listeners = listenersByEvent[eventName]
    if not listeners then
        listeners = {}
        listenersByEvent[eventName] = listeners
    end

    listeners[#listeners + 1] = listener
    return listener
end

function eventBus:Unsubscribe(eventName, listener)
    local listeners = listenersByEvent[eventName]
    if not listeners then return false end

    for index = #listeners, 1, -1 do
        if listeners[index] == listener then
            table.remove(listeners, index)
            if #listeners == 0 then
                listenersByEvent[eventName] = nil
            end
            return true
        end
    end

    return false
end

local function ReportListenerError(err)
    if type(geterrorhandler) == "function" then
        local handler = geterrorhandler()
        if type(handler) == "function" then
            handler(err)
            return
        end
    end

    if type(print) == "function" then
        print("AnniversaryAchievements event listener error: " .. tostring(err))
    end
end

function eventBus:Publish(eventName, ...)
    local listeners = listenersByEvent[eventName]
    if not listeners then return end

    -- Snapshot the active listeners so that subscriptions changed from inside a
    -- callback do not corrupt the current dispatch operation.
    local snapshot = {}
    for index = 1, #listeners do
        snapshot[index] = listeners[index]
    end

    for index = 1, #snapshot do
        local ok, err = pcall(snapshot[index], ...)
        if not ok then
            ReportListenerError(err)
        end
    end
end
