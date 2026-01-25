function CA_InitializeMicrobutton()
    BINDING_NAME_CLASSIC_ACHIEVEMENT = 'Anniversary Achievements'
    
    local microButtons = {}
    for _, value in pairs(MICRO_BUTTONS) do
        microButtons[#microButtons + 1] = value
        if value == 'QuestLogMicroButton' then
            microButtons[#microButtons + 1] = 'AchievementMicroButton'
        end
    end
    
    MICRO_BUTTONS = microButtons

    hooksecurefunc("UpdateMicroButtons", function()
        if AchievementFrame and AchievementFrame:IsShown() then
            AchievementMicroButton:SetButtonState('PUSHED', true)
        else
            AchievementMicroButton:SetButtonState('NORMAL')
        end
    end)
    
    AchievementMicroButton:SetScript('OnClick', function(self, button)
        if button == 'RightButton' then
            Settings.OpenToCategory("Anniversary Achievements")
        else
            AchievementFrame_ToggleAchievementFrame()
        end
    end)
end

SexyLib:Util():AfterLogin(function()
    if not CA_ShouldUseMicrobutton() then
        -- Hard-disable the button if it exists
        if AchievementMicroButton then
            AchievementMicroButton:Hide()
            AchievementMicroButton:UnregisterAllEvents()
            AchievementMicroButton:SetParent(nil)
        end
        return
    end

    CA_InitializeMicrobutton()
    AchievementMicroButton:SetFrameLevel(QuestLogMicroButton:GetFrameLevel() + 1)

    local helpPoint, helpRelativeTo, helpRelativePoint, helpX, helpY

    if HelpMicroButton then
        helpPoint, helpRelativeTo, helpRelativePoint, helpX, helpY = HelpMicroButton:GetPoint()
    end

    if HelpMicroButton then
        HelpMicroButton:Hide()
        HelpMicroButton:UnregisterAllEvents()
        HelpMicroButton:SetParent(nil)
    end

    if SocialsMicroButton and helpPoint then
        SocialsMicroButton:ClearAllPoints()
        SocialsMicroButton:SetPoint(helpPoint, helpRelativeTo, helpRelativePoint, helpX, helpY)
    end

end)

function CA_ShouldUseMicrobutton()
    return CA_IsMicrobuttonEnabled() and not CA_IsMicrobuttonForcedOff()
end

function CA_IsMicrobuttonForcedOff()
    return Bartender4
        or Dominos
        or DragonflightUI
end