local _, ns = ...

-- Content release dates are kept separate from achievement triggers so a
-- confirmed global launch time can be updated in one place. Never infer a
-- release from a character quest flag: those flags describe personal quest
-- completion, not realm-wide content availability.
local DAY = 24 * 60 * 60

local schedule = {
    TBC_PHASE_3 = {
        -- Set this to Blizzard's confirmed global Unix release timestamp once
        -- announced. nil deliberately fails closed and prevents false awards.
        releaseAt = nil,
        firstWeekDuration = 7 * DAY,
    },
}

function schedule:IsWithinFirstWeek(key, currentTime)
    local entry = self[key]
    if type(entry) ~= "table" then return false end

    local releaseAt = tonumber(entry.releaseAt)
    if not releaseAt then return false end

    local duration = tonumber(entry.firstWeekDuration) or (7 * DAY)
    local now = tonumber(currentTime)
    if not now then
        now = GetServerTime and GetServerTime() or time()
    end

    return now >= releaseAt and now < releaseAt + duration
end

ns.ReleaseSchedule = schedule
