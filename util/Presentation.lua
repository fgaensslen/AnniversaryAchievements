local _, ns = ...

local eventBus = ns.EventBus
local events = ns.Events

local achievementFrameUpdateQueued = false
local achievementSoundQueued = false

local function QueueAchievementFrameUpdate()
    if achievementFrameUpdateQueued then return end

    achievementFrameUpdateQueued = true
    C_Timer.After(1, function()
        achievementFrameUpdateQueued = false
        if type(AchievementFrame_ForceUpdate) == "function" then
            AchievementFrame_ForceUpdate()
        end
    end)
end

local function QueueAchievementSound()
    if achievementSoundQueued then return end

    achievementSoundQueued = true
    C_Timer.After(0.1, function()
        achievementSoundQueued = false
        PlaySoundFile("Interface\\AddOns\\AnniversaryAchievements\\sounds\\AchievementEarned.ogg", "Master")
    end)
end

local function PresentCompletedAchievement(achievementID)
    if type(AchievementFrameAchievements_Update) == "function" then
        AchievementFrameAchievements_Update()
    end

    if AchievementAlertSystem and type(AchievementAlertSystem.AddAlert) == "function" then
        AchievementAlertSystem:AddAlert(achievementID)
    end

    QueueAchievementSound()

    if type(ns.ShareAchievement) == "function" then
        ns.ShareAchievement(achievementID)
    end
end

eventBus:Subscribe(events.PROGRESS_CHANGED, QueueAchievementFrameUpdate)
eventBus:Subscribe(events.ACHIEVEMENT_COMPLETED, PresentCompletedAchievement)
