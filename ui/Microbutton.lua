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
    
    -- 1. Completely disable the Help Button as requested
    if HelpMicroButton then
        HelpMicroButton:Hide()
        HelpMicroButton:UnregisterAllEvents()
        HelpMicroButton:SetParent(nil)
    end

    local function ReanchorMicroButtons()
        if HelpMicroButton then HelpMicroButton:Hide() end

        local buttons = {
            CharacterMicroButton,
            SpellbookMicroButton,
            TalentMicroButton,
            QuestLogMicroButton,
            AchievementMicroButton,
            SocialsMicroButton,
            GuildMicroButton,
            WorldMapMicroButton,
            MainMenuMicroButton
        }

        local prevButton = nil
        
        for _, btn in ipairs(buttons) do
            if btn and btn:IsShown() and btn:GetAlpha() > 0 then

                if  prevButton then
                    btn:SetPoint("LEFT", prevButton, "RIGHT", -3, 0)                    
                end
                prevButton = btn
            end
        end
    end

    -- Hook the update function so when Socials is toggled, the bar reorganizes
    hooksecurefunc("UpdateMicroButtons", ReanchorMicroButtons)
    
    -- Run once immediately to set the initial layout
    ReanchorMicroButtons()
end)

function CA_ShouldUseMicrobutton()
    return CA_IsMicrobuttonEnabled() and not CA_IsMicrobuttonForcedOff()
end

function CA_IsMicrobuttonForcedOff()
    return Bartender4
        or Dominos
        or DragonflightUI
end