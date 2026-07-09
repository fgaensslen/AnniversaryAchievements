-- Global object setup for the Achievement button
if not AchievementMicroButton then
    -- Create a generic, vanilla button to stay completely clear of secure templates
    local btn = CreateFrame("Button", "AchievementMicroButton", UIParent)
    
    -- Manually assign the classic textures
    btn:SetNormalTexture("Interface\\Buttons\\UI-MicroButton-Achievement-Up")
    btn:SetPushedTexture("Interface\\Buttons\\UI-MicroButton-Achievement-Down")
    
    -- Fix texture coordinates so they aren't vertically squished/stretched
    local normal = btn:GetNormalTexture()
    if normal then normal:SetTexCoord(0, 1, 0, 0.8) end
    local pushed = btn:GetPushedTexture()
    if pushed then pushed:SetTexCoord(0, 1, 0, 0.8) end
end

-- Helper function to safely check if the frame is fully loaded and shown
local function IsAchievementFrameVisible()
    return _G["AchievementFrame"] and _G["AchievementFrame"]:IsShown()
end

function CA_InitializeMicrobutton()
    BINDING_NAME_CLASSIC_ACHIEVEMENT = 'Anniversary Achievements'
    
    -- Function to accurately set the texture state based on the current UI state
    local function RefreshButtonVisualState()
        if IsAchievementFrameVisible() then
            AchievementMicroButton:SetButtonState('PUSHED', true)
        else
            AchievementMicroButton:SetButtonState('NORMAL', false)
        end
    end

    -- Secure tracking of frame states
    hooksecurefunc("UpdateMicroButtons", RefreshButtonVisualState)
    
    AchievementMicroButton:SetScript('OnClick', function(self, button)
        AchievementFrame_ToggleAchievementFrame()
        RefreshButtonVisualState()
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
                btn:ClearAllPoints()
                if not prevButton then
                    -- EDIT MODE FIX: 
                    -- Instead of hard-coding coordinates, we anchor the first button 
                    -- to the top-left of its own parent container at 0,0.
                    -- This lets the Edit Mode "box" move freely.
                    btn:SetPoint("BOTTOMLEFT", btn:GetParent(), "BOTTOMLEFT", 0, 0)
                else
                    -- Maintain the tight classic spacing
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

    -- Match sizes to Blizzard's active layout specs
    local w, h = MainMenuMicroButton:GetSize()
    AchievementMicroButton:SetSize(w, h)
    AchievementMicroButton:SetFrameLevel(MainMenuMicroButton:GetFrameLevel() + 2)
    AchievementMicroButton:ClearAllPoints()
    AchievementMicroButton:SetPoint("LEFT", MainMenuMicroButton, "RIGHT", -3, 0)
    AchievementMicroButton:Show()
    AchievementMicroButton:SetAlpha(1)

    -- Ensure the microbutton's alpha matches Blizzard's active microbar state
    -- This keeps it from appearing too transparent/bright when other addons
    -- or Blizzard adjust micro button alphas.
    if MainMenuMicroButton then
        hooksecurefunc("UpdateMicroButtons", function()
            if AchievementMicroButton and MainMenuMicroButton then
                AchievementMicroButton:SetAlpha(MainMenuMicroButton:GetAlpha() or 1)
            end
        end)
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