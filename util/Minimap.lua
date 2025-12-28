SexyLib:Util():AfterLogin(function()

    ----------------------------------------------------------------
    -- Disable minimap icon if micro button is enabled
    ----------------------------------------------------------------
    if CA_IsMicrobuttonEnabled() then
        return
    end

    ----------------------------------------------------------------
    -- Libraries
    ----------------------------------------------------------------
    local LDB = LibStub("LibDataBroker-1.1")
    local LDBIcon = LibStub("LibDBIcon-1.0")

    ----------------------------------------------------------------
    -- Create LDB launcher
    ----------------------------------------------------------------
    local launcher = LDB:NewDataObject("AnniversaryAchievements", {
        type = "launcher",

        icon = "Interface\\Icons\\Achievement_General",

        OnClick = function(_, button)
            if button == "RightButton" then
                Settings.OpenToCategory("Anniversary Achievements")
            else
                AchievementFrame_ToggleAchievementFrame()
            end
        end,

        OnTooltipShow = function(tooltip)
            tooltip:AddLine(
                "Anniversary Achievements",
                1, 1, 1
            )
            tooltip:AddLine(
                SexyLib:Localization("Anniversary Achievements"):Get("ICON_DESCRIPTION"),
                1, 1, 1
            )
        end,
    })

    ----------------------------------------------------------------
    -- Register minimap icon
    ----------------------------------------------------------------
    LDBIcon:Register(
        "AnniversaryAchievements",
        launcher,
        CA_Settings.microbutton
    )

    ----------------------------------------------------------------
    -- Sync visibility if settings change later
    ----------------------------------------------------------------
    if CA_Settings.microbutton then
        LDBIcon:Hide("AnniversaryAchievements")
    else
        LDBIcon:Show("AnniversaryAchievements")
    end

end)