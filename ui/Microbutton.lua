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
    if not CA_IsMicrobuttonEnabled() or Bartender4 then return end

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