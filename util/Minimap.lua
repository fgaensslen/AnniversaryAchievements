SexyLib:Util():AfterLogin(function()

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
            AchievementFrame_ToggleAchievementFrame()
        end,

        OnTooltipShow = function(tooltip)
            tooltip:AddLine(
                "Anniversary Achievements",
                1, 1, 1
            )
        end,
    })

    CA_Settings.minimap = CA_Settings.minimap or {}
    CA_Settings.minimap.hide = CA_Settings.minimap.hide or false

    ----------------------------------------------------------------
    -- Register minimap icon
    ----------------------------------------------------------------
    LDBIcon:Register(
        "AnniversaryAchievements",
        launcher,
        CA_Settings.minimap
    )

    ----------------------------------------------------------------
    -- Sync visibility if settings change later
    ----------------------------------------------------------------
    if CA_Settings.minimap.hide then
        LDBIcon:Hide("AnniversaryAchievements")
    else
        LDBIcon:Show("AnniversaryAchievements")
    end

end)