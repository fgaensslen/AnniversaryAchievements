local _, ns = ...

-- Shared code lists this file in both client-specific TOCs. Classic exits before
-- the TBC delta table is created or any TBC achievement is registered.
if not ns.IsTBCAnniversary then return end

local loc = SexyLib:Localization("Anniversary Achievements")
local catalog = assert(ns.AchievementCatalog, loc:Get("CATALOG_LOAD_ERROR"))

local tbcDelta = {
    ["achievementCounter"] = 518,
    ["achievementDefinitions"] = {
        [7] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 1,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 70,
                    },
                    ["id"] = 7,
                    ["name"] = "",
                    ["type"] = 19,
                },
            },
            ["description"] = {
                ["args"] = {
                    [1] = 70,
                },
                ["key"] = "AD_LVL",
            },
            ["icon"] = "level_70",
            ["id"] = 7,
            ["name"] = {
                ["args"] = {
                    [1] = 70,
                },
                ["key"] = "AN_LVL",
            },
            ["points"] = 10,
            ["previousID"] = 6,
        },
        [20] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 1,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 15,
                        [2] = 75,
                    },
                    ["id"] = 62,
                    ["name"] = "",
                    ["type"] = 12,
                },
            },
            ["description"] = "AD_RIDING_75",
            ["icon"] = "-Ability_Mount_RidingHorse",
            ["id"] = 20,
            ["name"] = "AN_RIDING_75",
            ["nextID"] = 21,
            ["points"] = 10,
        },
        [21] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 1,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 15,
                        [2] = 150,
                    },
                    ["id"] = 63,
                    ["name"] = "",
                    ["type"] = 12,
                },
            },
            ["description"] = "AD_RIDING_150",
            ["icon"] = "-Ability_Mount_BlackPanther",
            ["id"] = 21,
            ["name"] = "AN_RIDING_150",
            ["nextID"] = 22,
            ["points"] = 10,
            ["previousID"] = 20,
        },
        [22] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 1,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 15,
                        [2] = 225,
                    },
                    ["id"] = 64,
                    ["name"] = "",
                    ["type"] = 12,
                },
            },
            ["description"] = "AD_RIDING_225",
            ["icon"] = "-Ability_Mount_Gryphon_01",
            ["id"] = 22,
            ["name"] = "AN_RIDING_225",
            ["nextID"] = 23,
            ["points"] = 10,
            ["previousID"] = 21,
        },
        [23] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 1,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 15,
                        [2] = 300,
                    },
                    ["id"] = 65,
                    ["name"] = "",
                    ["type"] = 12,
                },
            },
            ["description"] = "AD_RIDING_300",
            ["icon"] = "-Ability_Mount_RocketMount",
            ["id"] = 23,
            ["name"] = "AN_RIDING_300",
            ["points"] = 10,
            ["previousID"] = 22,
        },
        [67] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 5,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 10388,
                    },
                    ["id"] = 183,
                    ["name"] = "TBC_QUEST_10388",
                    ["type"] = 3,
                },
                [2] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 10389,
                    },
                    ["id"] = 184,
                    ["name"] = "TBC_QUEST_10389",
                    ["type"] = 3,
                },
                [3] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 10876,
                    },
                    ["id"] = 185,
                    ["name"] = "TBC_QUEST_10876",
                    ["type"] = 3,
                },
                [4] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 10258,
                    },
                    ["id"] = 186,
                    ["name"] = "TBC_QUEST_10258",
                    ["type"] = 3,
                },
                [5] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 9406,
                    },
                    ["id"] = 187,
                    ["name"] = "TBC_QUEST_9406",
                    ["type"] = 3,
                },
                [6] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 9370,
                    },
                    ["id"] = 188,
                    ["name"] = "TBC_QUEST_9370",
                    ["type"] = 3,
                },
                [7] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 10351,
                    },
                    ["id"] = 189,
                    ["name"] = "TBC_QUEST_10351",
                    ["type"] = 3,
                },
                [8] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 10630,
                    },
                    ["id"] = 67000,
                    ["name"] = "TBC_QUEST_10630",
                    ["type"] = 3,
                },
            },
            ["description"] = "AD_QUESTS_HELLFIRE_PENINSULA",
            ["faction"] = true,
            ["icon"] = "hellfire_peninsula",
            ["id"] = 67,
            ["name"] = "AN_QUESTS_HELLFIRE_PENINSULA",
            ["points"] = 10,
        },
        [68] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 5,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 10397,
                    },
                    ["id"] = 190,
                    ["name"] = "TBC_QUEST_10397",
                    ["type"] = 3,
                },
                [2] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 10400,
                    },
                    ["id"] = 191,
                    ["name"] = "TBC_QUEST_10400",
                    ["type"] = 3,
                },
                [3] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 9545,
                    },
                    ["id"] = 192,
                    ["name"] = "TBC_QUEST_9545",
                    ["type"] = 3,
                },
                [4] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 10935,
                    },
                    ["id"] = 193,
                    ["name"] = "TBC_QUEST_10935",
                    ["type"] = 3,
                },
                [5] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 10937,
                    },
                    ["id"] = 194,
                    ["name"] = "TBC_QUEST_10937",
                    ["type"] = 3,
                },
                [6] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 9383,
                    },
                    ["id"] = 195,
                    ["name"] = "TBC_QUEST_9383",
                    ["type"] = 3,
                },
                [7] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 10630,
                    },
                    ["id"] = 196,
                    ["name"] = "TBC_QUEST_10630",
                    ["type"] = 3,
                },
                [8] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 10351,
                    },
                    ["id"] = 197,
                    ["name"] = "TBC_QUEST_10351",
                    ["type"] = 3,
                },
            },
            ["description"] = "AD_QUESTS_HELLFIRE_PENINSULA",
            ["faction"] = false,
            ["icon"] = "hellfire_peninsula",
            ["id"] = 68,
            ["name"] = "AN_QUESTS_HELLFIRE_PENINSULA",
            ["points"] = 10,
        },
        [69] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 5,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 9772,
                    },
                    ["id"] = 198,
                    ["name"] = "TBC_QUEST_9772",
                    ["type"] = 3,
                },
                [2] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 9904,
                    },
                    ["id"] = 199,
                    ["name"] = "TBC_QUEST_9904",
                    ["type"] = 3,
                },
                [3] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 10118,
                    },
                    ["id"] = 200,
                    ["name"] = "TBC_QUEST_10118",
                    ["type"] = 3,
                },
                [4] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 9709,
                    },
                    ["id"] = 201,
                    ["name"] = "TBC_QUEST_9709",
                    ["type"] = 3,
                },
                [5] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 9732,
                    },
                    ["id"] = 202,
                    ["name"] = "TBC_QUEST_9732",
                    ["type"] = 3,
                },
                [6] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 9788,
                    },
                    ["id"] = 203,
                    ["name"] = "TBC_QUEST_9788",
                    ["type"] = 3,
                },
                [7] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 9726,
                    },
                    ["id"] = 204,
                    ["name"] = "TBC_QUEST_9726",
                    ["type"] = 3,
                },
            },
            ["description"] = "AD_QUESTS_ZANGARMASH",
            ["faction"] = true,
            ["icon"] = "zangarmash",
            ["id"] = 69,
            ["name"] = "AN_QUESTS_ZANGARMASH",
            ["points"] = 10,
        },
        [70] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 5,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 9803,
                    },
                    ["id"] = 205,
                    ["name"] = "TBC_QUEST_9803",
                    ["type"] = 3,
                },
                [2] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 9783,
                    },
                    ["id"] = 206,
                    ["name"] = "TBC_QUEST_9783",
                    ["type"] = 3,
                },
                [3] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 9902,
                    },
                    ["id"] = 207,
                    ["name"] = "TBC_QUEST_9902",
                    ["type"] = 3,
                },
                [4] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 9709,
                    },
                    ["id"] = 208,
                    ["name"] = "TBC_QUEST_9709",
                    ["type"] = 3,
                },
                [5] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 9732,
                    },
                    ["id"] = 209,
                    ["name"] = "TBC_QUEST_9732",
                    ["type"] = 3,
                },
                [6] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 9788,
                    },
                    ["id"] = 210,
                    ["name"] = "TBC_QUEST_9788",
                    ["type"] = 3,
                },
                [7] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 9726,
                    },
                    ["id"] = 211,
                    ["name"] = "TBC_QUEST_9726",
                    ["type"] = 3,
                },
            },
            ["description"] = "AD_QUESTS_ZANGARMASH",
            ["faction"] = false,
            ["icon"] = "zangarmash",
            ["id"] = 70,
            ["name"] = "AN_QUESTS_ZANGARMASH",
            ["points"] = 10,
        },
        [71] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 5,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 10879,
                    },
                    ["id"] = 212,
                    ["name"] = "TBC_QUEST_10879",
                    ["type"] = 3,
                },
                [2] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 10881,
                    },
                    ["id"] = 213,
                    ["name"] = "TBC_QUEST_10881",
                    ["type"] = 3,
                },
                [3] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 10915,
                    },
                    ["id"] = 214,
                    ["name"] = "TBC_QUEST_10915",
                    ["type"] = 3,
                },
                [4] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 9951,
                    },
                    ["id"] = 215,
                    ["name"] = "TBC_QUEST_9951",
                    ["type"] = 3,
                },
                [5] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 10043,
                    },
                    ["id"] = 216,
                    ["name"] = "TBC_QUEST_10043",
                    ["type"] = 3,
                },
            },
            ["description"] = "AD_QUESTS_TERROKAR",
            ["faction"] = true,
            ["icon"] = "terrokar",
            ["id"] = 71,
            ["name"] = "AN_QUESTS_TERROKAR",
            ["points"] = 10,
        },
        [72] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 5,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 10879,
                    },
                    ["id"] = 217,
                    ["name"] = "TBC_QUEST_10879",
                    ["type"] = 3,
                },
                [2] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 10881,
                    },
                    ["id"] = 218,
                    ["name"] = "TBC_QUEST_10881",
                    ["type"] = 3,
                },
                [3] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 10915,
                    },
                    ["id"] = 219,
                    ["name"] = "TBC_QUEST_10915",
                    ["type"] = 3,
                },
                [4] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 9951,
                    },
                    ["id"] = 220,
                    ["name"] = "TBC_QUEST_9951",
                    ["type"] = 3,
                },
                [5] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 10042,
                    },
                    ["id"] = 221,
                    ["name"] = "TBC_QUEST_10042",
                    ["type"] = 3,
                },
            },
            ["description"] = "AD_QUESTS_TERROKAR",
            ["faction"] = false,
            ["icon"] = "terrokar",
            ["id"] = 72,
            ["name"] = "AN_QUESTS_TERROKAR",
            ["points"] = 10,
        },
        [73] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 5,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 10172,
                    },
                    ["id"] = 222,
                    ["name"] = "TBC_QUEST_10172",
                    ["type"] = 3,
                },
                [2] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 9977,
                    },
                    ["id"] = 223,
                    ["name"] = "TBC_QUEST_9977",
                    ["type"] = 3,
                },
                [3] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 9853,
                    },
                    ["id"] = 224,
                    ["name"] = "TBC_QUEST_9853",
                    ["type"] = 3,
                },
                [4] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 9934,
                    },
                    ["id"] = 225,
                    ["name"] = "TBC_QUEST_9934",
                    ["type"] = 3,
                },
                [5] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 9868,
                    },
                    ["id"] = 226,
                    ["name"] = "TBC_QUEST_9868",
                    ["type"] = 3,
                },
                [6] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 9937,
                    },
                    ["id"] = 227,
                    ["name"] = "TBC_QUEST_9937",
                    ["type"] = 3,
                },
                [7] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 9852,
                    },
                    ["id"] = 228,
                    ["name"] = "TBC_QUEST_9852",
                    ["type"] = 3,
                },
                [8] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 9925,
                    },
                    ["id"] = 229,
                    ["name"] = "TBC_QUEST_9925",
                    ["type"] = 3,
                },
            },
            ["description"] = "AD_QUESTS_NAGRAND",
            ["faction"] = true,
            ["icon"] = "nagrand",
            ["id"] = 73,
            ["name"] = "AN_QUESTS_NAGRAND",
            ["points"] = 10,
        },
        [74] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 5,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 9955,
                    },
                    ["id"] = 230,
                    ["name"] = "TBC_QUEST_9955",
                    ["type"] = 3,
                },
                [2] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 9977,
                    },
                    ["id"] = 231,
                    ["name"] = "TBC_QUEST_9977",
                    ["type"] = 3,
                },
                [3] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 9853,
                    },
                    ["id"] = 232,
                    ["name"] = "TBC_QUEST_9853",
                    ["type"] = 3,
                },
                [4] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 9933,
                    },
                    ["id"] = 233,
                    ["name"] = "TBC_QUEST_9933",
                    ["type"] = 3,
                },
                [5] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 9873,
                    },
                    ["id"] = 234,
                    ["name"] = "TBC_QUEST_9873",
                    ["type"] = 3,
                },
                [6] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 10011,
                    },
                    ["id"] = 235,
                    ["name"] = "TBC_QUEST_10011",
                    ["type"] = 3,
                },
                [7] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 9852,
                    },
                    ["id"] = 236,
                    ["name"] = "TBC_QUEST_9852",
                    ["type"] = 3,
                },
                [8] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 9925,
                    },
                    ["id"] = 237,
                    ["name"] = "TBC_QUEST_9925",
                    ["type"] = 3,
                },
            },
            ["description"] = "AD_QUESTS_NAGRAND",
            ["faction"] = false,
            ["icon"] = "nagrand",
            ["id"] = 74,
            ["name"] = "AN_QUESTS_NAGRAND",
            ["points"] = 10,
        },
        [75] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 5,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 10505,
                    },
                    ["id"] = 238,
                    ["name"] = "TBC_QUEST_10505",
                    ["type"] = 3,
                },
                [2] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 10742,
                    },
                    ["id"] = 239,
                    ["name"] = "TBC_QUEST_10742",
                    ["type"] = 3,
                },
                [3] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 10867,
                    },
                    ["id"] = 240,
                    ["name"] = "TBC_QUEST_10867",
                    ["type"] = 3,
                },
                [4] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 10748,
                    },
                    ["id"] = 241,
                    ["name"] = "TBC_QUEST_10748",
                    ["type"] = 3,
                },
            },
            ["description"] = "AD_QUESTS_BLADES_EDGE_MTNS",
            ["faction"] = true,
            ["icon"] = "blades_edge_mtns",
            ["id"] = 75,
            ["name"] = "AN_QUESTS_BLADES_EDGE_MTNS",
            ["points"] = 10,
        },
        [76] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 5,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 10504,
                    },
                    ["id"] = 242,
                    ["name"] = "TBC_QUEST_10504",
                    ["type"] = 3,
                },
                [2] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 10671,
                    },
                    ["id"] = 243,
                    ["name"] = "TBC_QUEST_10671",
                    ["type"] = 3,
                },
                [3] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 10806,
                    },
                    ["id"] = 244,
                    ["name"] = "TBC_QUEST_10806",
                    ["type"] = 3,
                },
                [4] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 10748,
                    },
                    ["id"] = 245,
                    ["name"] = "TBC_QUEST_10748",
                    ["type"] = 3,
                },
            },
            ["description"] = "AD_QUESTS_BLADES_EDGE_MTNS",
            ["faction"] = false,
            ["icon"] = "blades_edge_mtns",
            ["id"] = 76,
            ["name"] = "AN_QUESTS_BLADES_EDGE_MTNS",
            ["points"] = 10,
        },
        [77] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 5,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 10409,
                            },
                            ["id"] = 246,
                            ["name"] = "",
                            ["type"] = 3,
                        },
                        [2] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 10507,
                            },
                            ["id"] = 247,
                            ["name"] = "",
                            ["type"] = 3,
                        },
                    },
                    ["id"] = 248,
                    ["name"] = "TBC_QUEST_10409",
                    ["type"] = 39,
                },
                [2] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 10240,
                    },
                    ["id"] = 249,
                    ["name"] = "TBC_QUEST_10240",
                    ["type"] = 3,
                },
                [3] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 10249,
                    },
                    ["id"] = 250,
                    ["name"] = "TBC_QUEST_10249",
                    ["type"] = 3,
                },
                [4] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 10439,
                    },
                    ["id"] = 251,
                    ["name"] = "TBC_QUEST_10439",
                    ["type"] = 3,
                },
                [5] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 10221,
                    },
                    ["id"] = 252,
                    ["name"] = "TBC_QUEST_10221",
                    ["type"] = 3,
                },
                [6] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 10276,
                    },
                    ["id"] = 253,
                    ["name"] = "TBC_QUEST_10276",
                    ["type"] = 3,
                },
            },
            ["description"] = "AD_QUESTS_NETHERSTORM",
            ["icon"] = "netherstorm",
            ["id"] = 77,
            ["name"] = "AN_QUESTS_NETHERSTORM",
            ["points"] = 10,
        },
        [78] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 5,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 10744,
                            },
                            ["id"] = 254,
                            ["name"] = "",
                            ["type"] = 3,
                        },
                        [2] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 10745,
                            },
                            ["id"] = 255,
                            ["name"] = "",
                            ["type"] = 3,
                        },
                    },
                    ["id"] = 256,
                    ["name"] = "TBC_QUEST_10744",
                    ["type"] = 39,
                },
                [2] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 11052,
                    },
                    ["id"] = 257,
                    ["name"] = "TBC_QUEST_11052",
                    ["type"] = 3,
                },
                [3] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 10645,
                            },
                            ["id"] = 258,
                            ["name"] = "",
                            ["type"] = 3,
                        },
                        [2] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 10639,
                            },
                            ["id"] = 259,
                            ["name"] = "",
                            ["type"] = 3,
                        },
                    },
                    ["id"] = 260,
                    ["name"] = "TBC_QUEST_10645",
                    ["type"] = 39,
                },
                [4] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 10651,
                            },
                            ["id"] = 261,
                            ["name"] = "",
                            ["type"] = 3,
                        },
                        [2] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 10692,
                            },
                            ["id"] = 262,
                            ["name"] = "",
                            ["type"] = 3,
                        },
                    },
                    ["id"] = 263,
                    ["name"] = "TBC_QUEST_10651",
                    ["type"] = 39,
                },
                [5] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 10588,
                    },
                    ["id"] = 264,
                    ["name"] = "TBC_QUEST_10588",
                    ["type"] = 3,
                },
                [6] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 10679,
                    },
                    ["id"] = 265,
                    ["name"] = "TBC_QUEST_10679",
                    ["type"] = 3,
                },
                [7] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 10808,
                    },
                    ["id"] = 266,
                    ["name"] = "TBC_QUEST_10808",
                    ["type"] = 3,
                },
                [8] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 11041,
                    },
                    ["id"] = 78000,
                    ["name"] = "TBC_QUEST_11041",
                    ["type"] = 3,
                },
            },
            ["description"] = "AD_QUESTS_SHADOWMOON",
            ["icon"] = "shadowmoon",
            ["id"] = 78,
            ["name"] = "AN_QUESTS_SHADOWMOON",
            ["points"] = 10,
        },
        [79] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 2,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 67,
                    },
                    ["id"] = 267,
                    ["name"] = "AN_QUESTS_HELLFIRE_PENINSULA",
                    ["type"] = 20,
                },
                [2] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 69,
                    },
                    ["id"] = 268,
                    ["name"] = "AN_QUESTS_ZANGARMASH",
                    ["type"] = 20,
                },
                [3] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 71,
                    },
                    ["id"] = 269,
                    ["name"] = "AN_QUESTS_TERROKAR",
                    ["type"] = 20,
                },
                [4] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 73,
                    },
                    ["id"] = 270,
                    ["name"] = "AN_QUESTS_NAGRAND",
                    ["type"] = 20,
                },
                [5] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 75,
                    },
                    ["id"] = 271,
                    ["name"] = "AN_QUESTS_BLADES_EDGE_MTNS",
                    ["type"] = 20,
                },
                [6] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 77,
                    },
                    ["id"] = 272,
                    ["name"] = "AN_QUESTS_NETHERSTORM",
                    ["type"] = 20,
                },
                [7] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 78,
                    },
                    ["id"] = 273,
                    ["name"] = "AN_QUESTS_SHADOWMOON",
                    ["type"] = 20,
                },
            },
            ["description"] = "AD_WISDOM_KEEPER_OUTLAND",
            ["faction"] = true,
            ["icon"] = "outland",
            ["id"] = 79,
            ["name"] = "AN_WISDOM_KEEPER_OUTLAND",
            ["points"] = 10,
        },
        [80] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 2,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 68,
                    },
                    ["id"] = 274,
                    ["name"] = "AN_QUESTS_HELLFIRE_PENINSULA",
                    ["type"] = 20,
                },
                [2] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 70,
                    },
                    ["id"] = 275,
                    ["name"] = "AN_QUESTS_ZANGARMASH",
                    ["type"] = 20,
                },
                [3] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 72,
                    },
                    ["id"] = 276,
                    ["name"] = "AN_QUESTS_TERROKAR",
                    ["type"] = 20,
                },
                [4] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 74,
                    },
                    ["id"] = 277,
                    ["name"] = "AN_QUESTS_NAGRAND",
                    ["type"] = 20,
                },
                [5] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 76,
                    },
                    ["id"] = 278,
                    ["name"] = "AN_QUESTS_BLADES_EDGE_MTNS",
                    ["type"] = 20,
                },
                [6] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 77,
                    },
                    ["id"] = 279,
                    ["name"] = "AN_QUESTS_NETHERSTORM",
                    ["type"] = 20,
                },
                [7] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 78,
                    },
                    ["id"] = 280,
                    ["name"] = "AN_QUESTS_SHADOWMOON",
                    ["type"] = 20,
                },
            },
            ["description"] = "AD_WISDOM_KEEPER_OUTLAND",
            ["faction"] = false,
            ["icon"] = "outland",
            ["id"] = 80,
            ["name"] = "AN_WISDOM_KEEPER_OUTLAND",
            ["points"] = 10,
        },
        [81] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 2,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 65,
                    },
                    ["id"] = 281,
                    ["name"] = "AN_WISDOM_KEEPER_AZEROTH",
                    ["type"] = 20,
                },
                [2] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 79,
                    },
                    ["id"] = 282,
                    ["name"] = "AN_WISDOM_KEEPER_OUTLAND",
                    ["type"] = 20,
                },
            },
            ["description"] = "AD_WISDOM_KEEPER",
            ["faction"] = true,
            ["icon"] = "-Inv_Misc_Book_07",
            ["id"] = 81,
            ["name"] = "AN_WISDOM_KEEPER",
            ["points"] = 30,
            ["rewardText"] = "TITLE_BUILTIN_THE_LOREMASTER_LABEL",
        },
        [82] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 2,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 65,
                    },
                    ["id"] = 283,
                    ["name"] = "AN_WISDOM_KEEPER_AZEROTH",
                    ["type"] = 20,
                },
                [2] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 80,
                    },
                    ["id"] = 284,
                    ["name"] = "AN_WISDOM_KEEPER_OUTLAND",
                    ["type"] = 20,
                },
            },
            ["description"] = "AD_WISDOM_KEEPER",
            ["faction"] = false,
            ["icon"] = "-Inv_Misc_Book_07",
            ["id"] = 82,
            ["name"] = "AN_WISDOM_KEEPER",
            ["points"] = 30,
            ["rewardText"] = "TITLE_BUILTIN_THE_LOREMASTER_LABEL",
        },
        [83] = {
            ["selectors"] = {
                ["A:DRUID"] = 2,
                ["A:HUNTER"] = 2,
                ["A:MAGE"] = 2,
                ["A:PALADIN"] = 2,
                ["A:PRIEST"] = 2,
                ["A:ROGUE"] = 2,
                ["A:SHAMAN"] = 2,
                ["A:WARLOCK"] = 2,
                ["A:WARRIOR"] = 2,
                ["H:DRUID"] = 1,
                ["H:HUNTER"] = 1,
                ["H:MAGE"] = 1,
                ["H:PALADIN"] = 1,
                ["H:PRIEST"] = 1,
                ["H:ROGUE"] = 1,
                ["H:SHAMAN"] = 1,
                ["H:WARLOCK"] = 1,
                ["H:WARRIOR"] = 1,
            },
            ["variants"] = {
                [1] = {
                    ["anyCompletable"] = false,
                    ["categoryID"] = 5,
                    ["criteria"] = {
                        [1] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 10758,
                            },
                            ["id"] = 286,
                            ["name"] = "",
                            ["type"] = 3,
                        },
                    },
                    ["description"] = "AD_ATTUNE_SHATTERED_HALLS",
                    ["icon"] = "-inv_misc_key_02",
                    ["id"] = 83,
                    ["name"] = "AN_ATTUNE_SHATTERED_HALLS",
                    ["points"] = 10,
                },
                [2] = {
                    ["anyCompletable"] = false,
                    ["categoryID"] = 5,
                    ["criteria"] = {
                        [1] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 10764,
                            },
                            ["id"] = 286,
                            ["name"] = "",
                            ["type"] = 3,
                        },
                    },
                    ["description"] = "AD_ATTUNE_SHATTERED_HALLS",
                    ["icon"] = "-inv_misc_key_02",
                    ["id"] = 83,
                    ["name"] = "AN_ATTUNE_SHATTERED_HALLS",
                    ["points"] = 10,
                },
            },
        },
        [84] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 5,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 10704,
                    },
                    ["id"] = 287,
                    ["name"] = "",
                    ["type"] = 3,
                },
            },
            ["description"] = "AD_ATTUNE_ARCATRAZ",
            ["icon"] = "-inv_datacrystal03",
            ["id"] = 84,
            ["name"] = "AN_ATTUNE_ARCATRAZ",
            ["points"] = 10,
        },
        [85] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 5,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 9837,
                    },
                    ["id"] = 288,
                    ["name"] = "",
                    ["type"] = 3,
                },
            },
            ["description"] = "AD_ATTUNE_KARAZHAN",
            ["icon"] = "-inv_misc_key_07",
            ["id"] = 85,
            ["name"] = "AN_ATTUNE_KARAZHAN",
            ["points"] = 10,
        },
        [86] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 5,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 9644,
                    },
                    ["id"] = 289,
                    ["name"] = "",
                    ["type"] = 3,
                },
            },
            ["description"] = "AD_ATTUNE_NIGHT_BANE",
            ["icon"] = "-inv_misc_urn_01",
            ["id"] = 86,
            ["name"] = "AN_ATTUNE_NIGHT_BANE",
            ["points"] = 10,
        },
        [87] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 5,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 10901,
                    },
                    ["id"] = 290,
                    ["name"] = "",
                    ["type"] = 3,
                },
            },
            ["description"] = "AD_ATTUNE_SSC",
            ["icon"] = "-inv_trinket_naxxramas01",
            ["id"] = 87,
            ["name"] = "AN_ATTUNE_SSC",
            ["points"] = 10,
        },
        [88] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 5,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 10888,
                    },
                    ["id"] = 291,
                    ["name"] = "",
                    ["type"] = 3,
                },
            },
            ["description"] = "AD_ATTUNE_EYE",
            ["icon"] = "-inv_datacrystal11",
            ["id"] = 88,
            ["name"] = "AN_ATTUNE_EYE",
            ["points"] = 10,
        },
        [89] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 5,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 10445,
                    },
                    ["id"] = 292,
                    ["name"] = "",
                    ["type"] = 3,
                },
            },
            ["description"] = "AD_ATTUNE_HYJAL",
            ["icon"] = "-inv_potion_101",
            ["id"] = 89,
            ["name"] = "AN_ATTUNE_HYJAL",
            ["points"] = 10,
        },
        [90] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 5,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 10985,
                            },
                            ["id"] = 293,
                            ["name"] = "",
                            ["type"] = 3,
                        },
                    },
                    ["id"] = 295,
                    ["name"] = "",
                    ["type"] = 39,
                },
            },
            ["description"] = "AD_ATTUNE_BLACK_TEMPLE",
            ["icon"] = "-inv_jewelry_amulet_04",
            ["id"] = 90,
            ["name"] = "AN_ATTUNE_BLACK_TEMPLE",
            ["points"] = 10,
        },
        [110] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 8,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3526,
                    },
                    ["id"] = 534,
                    ["name"] = {
                        ["areaID"] = 3526,
                    },
                    ["type"] = 18,
                },
                [2] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3857,
                    },
                    ["id"] = 535,
                    ["name"] = {
                        ["areaID"] = 3857,
                    },
                    ["type"] = 18,
                },
                [3] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3576,
                    },
                    ["id"] = 536,
                    ["name"] = {
                        ["areaID"] = 3576,
                    },
                    ["type"] = 18,
                },
                [4] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3571,
                    },
                    ["id"] = 537,
                    ["name"] = {
                        ["areaID"] = 3571,
                    },
                    ["type"] = 18,
                },
                [5] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3564,
                    },
                    ["id"] = 538,
                    ["name"] = {
                        ["areaID"] = 3564,
                    },
                    ["type"] = 18,
                },
                [6] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3915,
                    },
                    ["id"] = 539,
                    ["name"] = {
                        ["areaID"] = 3915,
                    },
                    ["type"] = 18,
                },
                [7] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3577,
                    },
                    ["id"] = 540,
                    ["name"] = {
                        ["areaID"] = 3577,
                    },
                    ["type"] = 18,
                },
                [8] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3916,
                    },
                    ["id"] = 541,
                    ["name"] = {
                        ["areaID"] = 3916,
                    },
                    ["type"] = 18,
                },
                [9] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3573,
                    },
                    ["id"] = 542,
                    ["name"] = {
                        ["areaID"] = 3573,
                    },
                    ["type"] = 18,
                },
                [10] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3567,
                    },
                    ["id"] = 543,
                    ["name"] = {
                        ["areaID"] = 3567,
                    },
                    ["type"] = 18,
                },
                [11] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3568,
                    },
                    ["id"] = 544,
                    ["name"] = {
                        ["areaID"] = 3568,
                    },
                    ["type"] = 18,
                },
                [12] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3575,
                    },
                    ["id"] = 545,
                    ["name"] = {
                        ["areaID"] = 3575,
                    },
                    ["type"] = 18,
                },
                [13] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3639,
                    },
                    ["id"] = 546,
                    ["name"] = {
                        ["areaID"] = 3639,
                    },
                    ["type"] = 18,
                },
                [14] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3572,
                    },
                    ["id"] = 547,
                    ["name"] = {
                        ["areaID"] = 3572,
                    },
                    ["type"] = 18,
                },
                [15] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3557,
                    },
                    ["id"] = 548,
                    ["name"] = {
                        ["areaID"] = 3557,
                    },
                    ["type"] = 18,
                },
                [16] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3574,
                    },
                    ["id"] = 549,
                    ["name"] = {
                        ["areaID"] = 3574,
                    },
                    ["type"] = 18,
                },
                [17] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3570,
                    },
                    ["id"] = 550,
                    ["name"] = {
                        ["areaID"] = 3570,
                    },
                    ["type"] = 18,
                },
            },
            ["description"] = {
                ["args"] = {
                    [1] = {
                        ["areaID"] = 3524,
                    },
                },
                ["key"] = "AD_EXPLORE",
            },
            ["icon"] = "azuremyst_isle",
            ["id"] = 110,
            ["name"] = {
                ["args"] = {
                    [1] = {
                        ["areaID"] = 3524,
                    },
                },
                ["key"] = "AN_EXPLORE",
            },
            ["points"] = 10,
        },
        [111] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 8,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3597,
                    },
                    ["id"] = 552,
                    ["name"] = {
                        ["areaID"] = 3597,
                    },
                    ["type"] = 18,
                },
                [2] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3593,
                    },
                    ["id"] = 553,
                    ["name"] = {
                        ["areaID"] = 3593,
                    },
                    ["type"] = 18,
                },
                [3] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3594,
                    },
                    ["id"] = 554,
                    ["name"] = {
                        ["areaID"] = 3594,
                    },
                    ["type"] = 18,
                },
                [4] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3585,
                    },
                    ["id"] = 555,
                    ["name"] = {
                        ["areaID"] = 3585,
                    },
                    ["type"] = 18,
                },
                [5] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3612,
                    },
                    ["id"] = 556,
                    ["name"] = {
                        ["areaID"] = 3612,
                    },
                    ["type"] = 18,
                },
                [6] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3584,
                    },
                    ["id"] = 557,
                    ["name"] = {
                        ["areaID"] = 3584,
                    },
                    ["type"] = 18,
                },
                [7] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3600,
                    },
                    ["id"] = 558,
                    ["name"] = {
                        ["areaID"] = 3600,
                    },
                    ["type"] = 18,
                },
                [8] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3602,
                    },
                    ["id"] = 559,
                    ["name"] = {
                        ["areaID"] = 3602,
                    },
                    ["type"] = 18,
                },
                [9] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3908,
                    },
                    ["id"] = 560,
                    ["name"] = {
                        ["areaID"] = 3908,
                    },
                    ["type"] = 18,
                },
                [10] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3910,
                    },
                    ["id"] = 561,
                    ["name"] = {
                        ["areaID"] = 3910,
                    },
                    ["type"] = 18,
                },
                [11] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3592,
                    },
                    ["id"] = 562,
                    ["name"] = {
                        ["areaID"] = 3592,
                    },
                    ["type"] = 18,
                },
                [12] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3601,
                    },
                    ["id"] = 563,
                    ["name"] = {
                        ["areaID"] = 3601,
                    },
                    ["type"] = 18,
                },
                [13] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3591,
                    },
                    ["id"] = 564,
                    ["name"] = {
                        ["areaID"] = 3591,
                    },
                    ["type"] = 18,
                },
                [14] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3599,
                    },
                    ["id"] = 565,
                    ["name"] = {
                        ["areaID"] = 3599,
                    },
                    ["type"] = 18,
                },
                [15] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3603,
                    },
                    ["id"] = 566,
                    ["name"] = {
                        ["areaID"] = 3603,
                    },
                    ["type"] = 18,
                },
                [16] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3604,
                    },
                    ["id"] = 567,
                    ["name"] = {
                        ["areaID"] = 3604,
                    },
                    ["type"] = 18,
                },
                [17] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3906,
                    },
                    ["id"] = 568,
                    ["name"] = {
                        ["areaID"] = 3906,
                    },
                    ["type"] = 18,
                },
                [18] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3589,
                    },
                    ["id"] = 569,
                    ["name"] = {
                        ["areaID"] = 3589,
                    },
                    ["type"] = 18,
                },
                [19] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3588,
                    },
                    ["id"] = 570,
                    ["name"] = {
                        ["areaID"] = 3588,
                    },
                    ["type"] = 18,
                },
                [20] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3595,
                    },
                    ["id"] = 571,
                    ["name"] = {
                        ["areaID"] = 3595,
                    },
                    ["type"] = 18,
                },
                [21] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3596,
                    },
                    ["id"] = 572,
                    ["name"] = {
                        ["areaID"] = 3596,
                    },
                    ["type"] = 18,
                },
                [22] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3909,
                    },
                    ["id"] = 573,
                    ["name"] = {
                        ["areaID"] = 3909,
                    },
                    ["type"] = 18,
                },
                [23] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3586,
                    },
                    ["id"] = 574,
                    ["name"] = {
                        ["areaID"] = 3586,
                    },
                    ["type"] = 18,
                },
                [24] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3587,
                    },
                    ["id"] = 575,
                    ["name"] = {
                        ["areaID"] = 3587,
                    },
                    ["type"] = 18,
                },
                [25] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3907,
                    },
                    ["id"] = 576,
                    ["name"] = {
                        ["areaID"] = 3907,
                    },
                    ["type"] = 18,
                },
                [26] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3608,
                    },
                    ["id"] = 577,
                    ["name"] = {
                        ["areaID"] = 3608,
                    },
                    ["type"] = 18,
                },
                [27] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3590,
                    },
                    ["id"] = 578,
                    ["name"] = {
                        ["areaID"] = 3590,
                    },
                    ["type"] = 18,
                },
                [28] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3598,
                    },
                    ["id"] = 579,
                    ["name"] = {
                        ["areaID"] = 3598,
                    },
                    ["type"] = 18,
                },
            },
            ["description"] = {
                ["args"] = {
                    [1] = {
                        ["areaID"] = 3525,
                    },
                },
                ["key"] = "AD_EXPLORE",
            },
            ["icon"] = "bloodmyst_isle",
            ["id"] = 111,
            ["name"] = {
                ["args"] = {
                    [1] = {
                        ["areaID"] = 3525,
                    },
                },
                ["key"] = "AN_EXPLORE",
            },
            ["points"] = 10,
        },
        [135] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 7,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3431,
                    },
                    ["id"] = 897,
                    ["name"] = {
                        ["areaID"] = 3431,
                    },
                    ["type"] = 18,
                },
                [2] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3533,
                    },
                    ["id"] = 898,
                    ["name"] = {
                        ["areaID"] = 3533,
                    },
                    ["type"] = 18,
                },
                [3] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3466,
                    },
                    ["id"] = 899,
                    ["name"] = {
                        ["areaID"] = 3466,
                    },
                    ["type"] = 18,
                },
                [4] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3461,
                    },
                    ["id"] = 900,
                    ["name"] = {
                        ["areaID"] = 3461,
                    },
                    ["type"] = 18,
                },
                [5] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3465,
                    },
                    ["id"] = 901,
                    ["name"] = {
                        ["areaID"] = 3465,
                    },
                    ["type"] = 18,
                },
                [6] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3467,
                    },
                    ["id"] = 902,
                    ["name"] = {
                        ["areaID"] = 3467,
                    },
                    ["type"] = 18,
                },
                [7] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3464,
                    },
                    ["id"] = 903,
                    ["name"] = {
                        ["areaID"] = 3464,
                    },
                    ["type"] = 18,
                },
                [8] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3470,
                    },
                    ["id"] = 904,
                    ["name"] = {
                        ["areaID"] = 3470,
                    },
                    ["type"] = 18,
                },
                [9] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3480,
                    },
                    ["id"] = 905,
                    ["name"] = {
                        ["areaID"] = 3480,
                    },
                    ["type"] = 18,
                },
                [10] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3462,
                    },
                    ["id"] = 906,
                    ["name"] = {
                        ["areaID"] = 3462,
                    },
                    ["type"] = 18,
                },
                [11] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3471,
                    },
                    ["id"] = 907,
                    ["name"] = {
                        ["areaID"] = 3471,
                    },
                    ["type"] = 18,
                },
                [12] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3476,
                    },
                    ["id"] = 908,
                    ["name"] = {
                        ["areaID"] = 3476,
                    },
                    ["type"] = 18,
                },
                [13] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3474,
                    },
                    ["id"] = 909,
                    ["name"] = {
                        ["areaID"] = 3474,
                    },
                    ["type"] = 18,
                },
                [14] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3472,
                    },
                    ["id"] = 910,
                    ["name"] = {
                        ["areaID"] = 3472,
                    },
                    ["type"] = 18,
                },
                [15] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3558,
                    },
                    ["id"] = 911,
                    ["name"] = {
                        ["areaID"] = 3558,
                    },
                    ["type"] = 18,
                },
                [16] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3912,
                    },
                    ["id"] = 912,
                    ["name"] = {
                        ["areaID"] = 3912,
                    },
                    ["type"] = 18,
                },
                [17] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3473,
                    },
                    ["id"] = 913,
                    ["name"] = {
                        ["areaID"] = 3473,
                    },
                    ["type"] = 18,
                },
                [18] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3913,
                    },
                    ["id"] = 914,
                    ["name"] = {
                        ["areaID"] = 3913,
                    },
                    ["type"] = 18,
                },
                [19] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3914,
                    },
                    ["id"] = 915,
                    ["name"] = {
                        ["areaID"] = 3914,
                    },
                    ["type"] = 18,
                },
                [20] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3468,
                    },
                    ["id"] = 916,
                    ["name"] = {
                        ["areaID"] = 3468,
                    },
                    ["type"] = 18,
                },
                [21] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3460,
                    },
                    ["id"] = 917,
                    ["name"] = {
                        ["areaID"] = 3460,
                    },
                    ["type"] = 18,
                },
                [22] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3469,
                    },
                    ["id"] = 918,
                    ["name"] = {
                        ["areaID"] = 3469,
                    },
                    ["type"] = 18,
                },
                [23] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3911,
                    },
                    ["id"] = 919,
                    ["name"] = {
                        ["areaID"] = 3911,
                    },
                    ["type"] = 18,
                },
                [24] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3475,
                    },
                    ["id"] = 920,
                    ["name"] = {
                        ["areaID"] = 3475,
                    },
                    ["type"] = 18,
                },
            },
            ["description"] = {
                ["args"] = {
                    [1] = {
                        ["areaID"] = 3430,
                    },
                },
                ["key"] = "AD_EXPLORE",
            },
            ["icon"] = "eversong_woods",
            ["id"] = 135,
            ["name"] = {
                ["args"] = {
                    [1] = {
                        ["areaID"] = 3430,
                    },
                },
                ["key"] = "AN_EXPLORE",
            },
            ["points"] = 10,
        },
        [136] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 7,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3488,
                    },
                    ["id"] = 922,
                    ["name"] = {
                        ["areaID"] = 3488,
                    },
                    ["type"] = 18,
                },
                [2] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3489,
                    },
                    ["id"] = 923,
                    ["name"] = {
                        ["areaID"] = 3489,
                    },
                    ["type"] = 18,
                },
                [3] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3490,
                    },
                    ["id"] = 924,
                    ["name"] = {
                        ["areaID"] = 3490,
                    },
                    ["type"] = 18,
                },
                [4] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3491,
                    },
                    ["id"] = 925,
                    ["name"] = {
                        ["areaID"] = 3491,
                    },
                    ["type"] = 18,
                },
                [5] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3494,
                    },
                    ["id"] = 926,
                    ["name"] = {
                        ["areaID"] = 3494,
                    },
                    ["type"] = 18,
                },
                [6] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3493,
                    },
                    ["id"] = 927,
                    ["name"] = {
                        ["areaID"] = 3493,
                    },
                    ["type"] = 18,
                },
                [7] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3495,
                    },
                    ["id"] = 928,
                    ["name"] = {
                        ["areaID"] = 3495,
                    },
                    ["type"] = 18,
                },
                [8] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3496,
                    },
                    ["id"] = 929,
                    ["name"] = {
                        ["areaID"] = 3496,
                    },
                    ["type"] = 18,
                },
                [9] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3502,
                    },
                    ["id"] = 930,
                    ["name"] = {
                        ["areaID"] = 3502,
                    },
                    ["type"] = 18,
                },
                [10] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3500,
                    },
                    ["id"] = 931,
                    ["name"] = {
                        ["areaID"] = 3500,
                    },
                    ["type"] = 18,
                },
                [11] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3517,
                    },
                    ["id"] = 932,
                    ["name"] = {
                        ["areaID"] = 3517,
                    },
                    ["type"] = 18,
                },
                [12] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3508,
                    },
                    ["id"] = 933,
                    ["name"] = {
                        ["areaID"] = 3508,
                    },
                    ["type"] = 18,
                },
                [13] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3492,
                    },
                    ["id"] = 934,
                    ["name"] = {
                        ["areaID"] = 3492,
                    },
                    ["type"] = 18,
                },
                [14] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3501,
                    },
                    ["id"] = 935,
                    ["name"] = {
                        ["areaID"] = 3501,
                    },
                    ["type"] = 18,
                },
                [15] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3856,
                    },
                    ["id"] = 936,
                    ["name"] = {
                        ["areaID"] = 3856,
                    },
                    ["type"] = 18,
                },
                [16] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3861,
                    },
                    ["id"] = 937,
                    ["name"] = {
                        ["areaID"] = 3861,
                    },
                    ["type"] = 18,
                },
            },
            ["description"] = {
                ["args"] = {
                    [1] = {
                        ["areaID"] = 3433,
                    },
                },
                ["key"] = "AD_EXPLORE",
            },
            ["icon"] = "ghostlands",
            ["id"] = 136,
            ["name"] = {
                ["args"] = {
                    [1] = {
                        ["areaID"] = 3433,
                    },
                },
                ["key"] = "AN_EXPLORE",
            },
            ["points"] = 10,
        },
        [137] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 7,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 4087,
                    },
                    ["id"] = 939,
                    ["name"] = {
                        ["areaID"] = 4087,
                    },
                    ["type"] = 18,
                },
                [2] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 4089,
                    },
                    ["id"] = 940,
                    ["name"] = {
                        ["areaID"] = 4089,
                    },
                    ["type"] = 18,
                },
                [3] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 4091,
                    },
                    ["id"] = 941,
                    ["name"] = {
                        ["areaID"] = 4091,
                    },
                    ["type"] = 18,
                },
                [4] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 4092,
                    },
                    ["id"] = 942,
                    ["name"] = {
                        ["areaID"] = 4092,
                    },
                    ["type"] = 18,
                },
                [5] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 4094,
                    },
                    ["id"] = 943,
                    ["name"] = {
                        ["areaID"] = 4094,
                    },
                    ["type"] = 18,
                },
                [6] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 4095,
                    },
                    ["id"] = 944,
                    ["name"] = {
                        ["areaID"] = 4095,
                    },
                    ["type"] = 18,
                },
            },
            ["description"] = {
                ["args"] = {
                    [1] = {
                        ["areaID"] = 4080,
                    },
                },
                ["key"] = "AD_EXPLORE",
            },
            ["icon"] = "achievement_zone_isleofqueldanas",
            ["id"] = 137,
            ["name"] = {
                ["args"] = {
                    [1] = {
                        ["areaID"] = 4080,
                    },
                },
                ["key"] = "AN_EXPLORE",
            },
            ["points"] = 10,
        },
        [139] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 6,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 140,
                    },
                    ["id"] = 998,
                    ["name"] = {
                        ["args"] = {
                            [1] = {
                                ["areaID"] = 3483,
                            },
                        },
                        ["key"] = "AN_EXPLORE",
                    },
                    ["type"] = 20,
                },
                [2] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 141,
                    },
                    ["id"] = 1017,
                    ["name"] = {
                        ["args"] = {
                            [1] = {
                                ["areaID"] = 3521,
                            },
                        },
                        ["key"] = "AN_EXPLORE",
                    },
                    ["type"] = 20,
                },
                [3] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 142,
                    },
                    ["id"] = 1039,
                    ["name"] = {
                        ["args"] = {
                            [1] = {
                                ["areaID"] = 3519,
                            },
                        },
                        ["key"] = "AN_EXPLORE",
                    },
                    ["type"] = 20,
                },
                [4] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 143,
                    },
                    ["id"] = 1059,
                    ["name"] = {
                        ["args"] = {
                            [1] = {
                                ["areaID"] = 3518,
                            },
                        },
                        ["key"] = "AN_EXPLORE",
                    },
                    ["type"] = 20,
                },
                [5] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 144,
                    },
                    ["id"] = 1086,
                    ["name"] = {
                        ["args"] = {
                            [1] = {
                                ["areaID"] = 3522,
                            },
                        },
                        ["key"] = "AN_EXPLORE",
                    },
                    ["type"] = 20,
                },
                [6] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 145,
                    },
                    ["id"] = 1109,
                    ["name"] = {
                        ["args"] = {
                            [1] = {
                                ["areaID"] = 3523,
                            },
                        },
                        ["key"] = "AN_EXPLORE",
                    },
                    ["type"] = 20,
                },
                [7] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 146,
                    },
                    ["id"] = 1123,
                    ["name"] = {
                        ["args"] = {
                            [1] = {
                                ["areaID"] = 3520,
                            },
                        },
                        ["key"] = "AN_EXPLORE",
                    },
                    ["type"] = 20,
                },
            },
            ["description"] = "AD_EXPLORE_OUTLAND",
            ["icon"] = "outland",
            ["id"] = 139,
            ["name"] = "AN_EXPLORE_OUTLAND",
            ["points"] = 20,
        },
        [140] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 9,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3539,
                    },
                    ["id"] = 980,
                    ["name"] = {
                        ["areaID"] = 3539,
                    },
                    ["type"] = 18,
                },
                [2] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3546,
                    },
                    ["id"] = 981,
                    ["name"] = {
                        ["areaID"] = 3546,
                    },
                    ["type"] = 18,
                },
                [3] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3554,
                    },
                    ["id"] = 982,
                    ["name"] = {
                        ["areaID"] = 3554,
                    },
                    ["type"] = 18,
                },
                [4] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3545,
                    },
                    ["id"] = 983,
                    ["name"] = {
                        ["areaID"] = 3545,
                    },
                    ["type"] = 18,
                },
                [5] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3538,
                    },
                    ["id"] = 984,
                    ["name"] = {
                        ["areaID"] = 3538,
                    },
                    ["type"] = 18,
                },
                [6] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3555,
                    },
                    ["id"] = 985,
                    ["name"] = {
                        ["areaID"] = 3555,
                    },
                    ["type"] = 18,
                },
                [7] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3553,
                    },
                    ["id"] = 986,
                    ["name"] = {
                        ["areaID"] = 3553,
                    },
                    ["type"] = 18,
                },
                [8] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3551,
                    },
                    ["id"] = 987,
                    ["name"] = {
                        ["areaID"] = 3551,
                    },
                    ["type"] = 18,
                },
                [9] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3552,
                    },
                    ["id"] = 988,
                    ["name"] = {
                        ["areaID"] = 3552,
                    },
                    ["type"] = 18,
                },
                [10] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3804,
                    },
                    ["id"] = 989,
                    ["name"] = {
                        ["areaID"] = 3804,
                    },
                    ["type"] = 18,
                },
                [11] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3536,
                    },
                    ["id"] = 990,
                    ["name"] = {
                        ["areaID"] = 3536,
                    },
                    ["type"] = 18,
                },
                [12] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3547,
                    },
                    ["id"] = 991,
                    ["name"] = {
                        ["areaID"] = 3547,
                    },
                    ["type"] = 18,
                },
                [13] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3582,
                    },
                    ["id"] = 992,
                    ["name"] = {
                        ["areaID"] = 3582,
                    },
                    ["type"] = 18,
                },
                [14] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3556,
                    },
                    ["id"] = 993,
                    ["name"] = {
                        ["areaID"] = 3556,
                    },
                    ["type"] = 18,
                },
                [15] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3797,
                    },
                    ["id"] = 994,
                    ["name"] = {
                        ["areaID"] = 3797,
                    },
                    ["type"] = 18,
                },
                [16] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3802,
                    },
                    ["id"] = 995,
                    ["name"] = {
                        ["areaID"] = 3802,
                    },
                    ["type"] = 18,
                },
                [17] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3796,
                    },
                    ["id"] = 996,
                    ["name"] = {
                        ["areaID"] = 3796,
                    },
                    ["type"] = 18,
                },
                [18] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3541,
                    },
                    ["id"] = 997,
                    ["name"] = {
                        ["areaID"] = 3541,
                    },
                    ["type"] = 18,
                },
            },
            ["description"] = {
                ["args"] = {
                    [1] = {
                        ["areaID"] = 3483,
                    },
                },
                ["key"] = "AD_EXPLORE",
            },
            ["icon"] = "hellfire_peninsula",
            ["id"] = 140,
            ["name"] = {
                ["args"] = {
                    [1] = {
                        ["areaID"] = 3483,
                    },
                },
                ["key"] = "AN_EXPLORE",
            },
            ["points"] = 10,
        },
        [141] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 9,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3565,
                    },
                    ["id"] = 999,
                    ["name"] = {
                        ["areaID"] = 3565,
                    },
                    ["type"] = 18,
                },
                [2] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3650,
                    },
                    ["id"] = 1000,
                    ["name"] = {
                        ["areaID"] = 3650,
                    },
                    ["type"] = 18,
                },
                [3] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3642,
                    },
                    ["id"] = 1001,
                    ["name"] = {
                        ["areaID"] = 3642,
                    },
                    ["type"] = 18,
                },
                [4] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3667,
                    },
                    ["id"] = 1002,
                    ["name"] = {
                        ["areaID"] = 3667,
                    },
                    ["type"] = 18,
                },
                [5] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3656,
                    },
                    ["id"] = 1003,
                    ["name"] = {
                        ["areaID"] = 3656,
                    },
                    ["type"] = 18,
                },
                [6] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3646,
                    },
                    ["id"] = 1004,
                    ["name"] = {
                        ["areaID"] = 3646,
                    },
                    ["type"] = 18,
                },
                [7] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3644,
                    },
                    ["id"] = 1005,
                    ["name"] = {
                        ["areaID"] = 3644,
                    },
                    ["type"] = 18,
                },
                [8] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3648,
                    },
                    ["id"] = 1006,
                    ["name"] = {
                        ["areaID"] = 3648,
                    },
                    ["type"] = 18,
                },
                [9] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3659,
                    },
                    ["id"] = 1007,
                    ["name"] = {
                        ["areaID"] = 3659,
                    },
                    ["type"] = 18,
                },
                [10] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3720,
                    },
                    ["id"] = 1008,
                    ["name"] = {
                        ["areaID"] = 3720,
                    },
                    ["type"] = 18,
                },
                [11] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3641,
                    },
                    ["id"] = 1009,
                    ["name"] = {
                        ["areaID"] = 3641,
                    },
                    ["type"] = 18,
                },
                [12] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3649,
                    },
                    ["id"] = 1010,
                    ["name"] = {
                        ["areaID"] = 3649,
                    },
                    ["type"] = 18,
                },
                [13] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3651,
                    },
                    ["id"] = 1011,
                    ["name"] = {
                        ["areaID"] = 3651,
                    },
                    ["type"] = 18,
                },
                [14] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3818,
                    },
                    ["id"] = 1012,
                    ["name"] = {
                        ["areaID"] = 3818,
                    },
                    ["type"] = 18,
                },
                [15] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3766,
                    },
                    ["id"] = 1013,
                    ["name"] = {
                        ["areaID"] = 3766,
                    },
                    ["type"] = 18,
                },
                [16] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3647,
                    },
                    ["id"] = 1014,
                    ["name"] = {
                        ["areaID"] = 3647,
                    },
                    ["type"] = 18,
                },
                [17] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3645,
                    },
                    ["id"] = 1015,
                    ["name"] = {
                        ["areaID"] = 3645,
                    },
                    ["type"] = 18,
                },
                [18] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3841,
                    },
                    ["id"] = 1016,
                    ["name"] = {
                        ["areaID"] = 3841,
                    },
                    ["type"] = 18,
                },
            },
            ["description"] = {
                ["args"] = {
                    [1] = {
                        ["areaID"] = 3521,
                    },
                },
                ["key"] = "AD_EXPLORE",
            },
            ["icon"] = "zangarmash",
            ["id"] = 141,
            ["name"] = {
                ["args"] = {
                    [1] = {
                        ["areaID"] = 3521,
                    },
                },
                ["key"] = "AN_EXPLORE",
            },
            ["points"] = 10,
        },
        [142] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 9,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3719,
                    },
                    ["id"] = 1018,
                    ["name"] = {
                        ["areaID"] = 3719,
                    },
                    ["type"] = 18,
                },
                [2] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3684,
                    },
                    ["id"] = 1019,
                    ["name"] = {
                        ["areaID"] = 3684,
                    },
                    ["type"] = 18,
                },
                [3] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3674,
                    },
                    ["id"] = 1020,
                    ["name"] = {
                        ["areaID"] = 3674,
                    },
                    ["type"] = 18,
                },
                [4] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3681,
                    },
                    ["id"] = 1021,
                    ["name"] = {
                        ["areaID"] = 3681,
                    },
                    ["type"] = 18,
                },
                [5] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3682,
                    },
                    ["id"] = 1022,
                    ["name"] = {
                        ["areaID"] = 3682,
                    },
                    ["type"] = 18,
                },
                [6] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3683,
                    },
                    ["id"] = 1023,
                    ["name"] = {
                        ["areaID"] = 3683,
                    },
                    ["type"] = 18,
                },
                [7] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3675,
                    },
                    ["id"] = 1024,
                    ["name"] = {
                        ["areaID"] = 3675,
                    },
                    ["type"] = 18,
                },
                [8] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3703,
                    },
                    ["id"] = 1025,
                    ["name"] = {
                        ["areaID"] = 3703,
                    },
                    ["type"] = 18,
                },
                [9] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3860,
                    },
                    ["id"] = 1026,
                    ["name"] = {
                        ["areaID"] = 3860,
                    },
                    ["type"] = 18,
                },
                [10] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3696,
                    },
                    ["id"] = 1027,
                    ["name"] = {
                        ["areaID"] = 3696,
                    },
                    ["type"] = 18,
                },
                [11] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3858,
                    },
                    ["id"] = 1028,
                    ["name"] = {
                        ["areaID"] = 3858,
                    },
                    ["type"] = 18,
                },
                [12] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3685,
                    },
                    ["id"] = 1029,
                    ["name"] = {
                        ["areaID"] = 3685,
                    },
                    ["type"] = 18,
                },
                [13] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3689,
                    },
                    ["id"] = 1030,
                    ["name"] = {
                        ["areaID"] = 3689,
                    },
                    ["type"] = 18,
                },
                [14] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3891,
                    },
                    ["id"] = 1031,
                    ["name"] = {
                        ["areaID"] = 3891,
                    },
                    ["type"] = 18,
                },
                [15] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3676,
                    },
                    ["id"] = 1032,
                    ["name"] = {
                        ["areaID"] = 3676,
                    },
                    ["type"] = 18,
                },
                [16] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3893,
                    },
                    ["id"] = 1033,
                    ["name"] = {
                        ["areaID"] = 3893,
                    },
                    ["type"] = 18,
                },
                [17] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3888,
                    },
                    ["id"] = 1034,
                    ["name"] = {
                        ["areaID"] = 3888,
                    },
                    ["type"] = 18,
                },
                [18] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3677,
                    },
                    ["id"] = 1035,
                    ["name"] = {
                        ["areaID"] = 3677,
                    },
                    ["type"] = 18,
                },
                [19] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3678,
                    },
                    ["id"] = 1036,
                    ["name"] = {
                        ["areaID"] = 3678,
                    },
                    ["type"] = 18,
                },
                [20] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3693,
                    },
                    ["id"] = 1037,
                    ["name"] = {
                        ["areaID"] = 3693,
                    },
                    ["type"] = 18,
                },
                [21] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3679,
                    },
                    ["id"] = 1038,
                    ["name"] = {
                        ["areaID"] = 3679,
                    },
                    ["type"] = 18,
                },
            },
            ["description"] = {
                ["args"] = {
                    [1] = {
                        ["areaID"] = 3519,
                    },
                },
                ["key"] = "AD_EXPLORE",
            },
            ["icon"] = "terrokar",
            ["id"] = 142,
            ["name"] = {
                ["args"] = {
                    [1] = {
                        ["areaID"] = 3519,
                    },
                },
                ["key"] = "AN_EXPLORE",
            },
            ["points"] = 10,
        },
        [143] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 9,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3624,
                    },
                    ["id"] = 1040,
                    ["name"] = {
                        ["areaID"] = 3624,
                    },
                    ["type"] = 18,
                },
                [2] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3613,
                    },
                    ["id"] = 1041,
                    ["name"] = {
                        ["areaID"] = 3613,
                    },
                    ["type"] = 18,
                },
                [3] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3628,
                    },
                    ["id"] = 1042,
                    ["name"] = {
                        ["areaID"] = 3628,
                    },
                    ["type"] = 18,
                },
                [4] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3637,
                    },
                    ["id"] = 1043,
                    ["name"] = {
                        ["areaID"] = 3637,
                    },
                    ["type"] = 18,
                },
                [5] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3616,
                    },
                    ["id"] = 1044,
                    ["name"] = {
                        ["areaID"] = 3616,
                    },
                    ["type"] = 18,
                },
                [6] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3631,
                    },
                    ["id"] = 1045,
                    ["name"] = {
                        ["areaID"] = 3631,
                    },
                    ["type"] = 18,
                },
                [7] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3622,
                    },
                    ["id"] = 1046,
                    ["name"] = {
                        ["areaID"] = 3622,
                    },
                    ["type"] = 18,
                },
                [8] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3626,
                    },
                    ["id"] = 1047,
                    ["name"] = {
                        ["areaID"] = 3626,
                    },
                    ["type"] = 18,
                },
                [9] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3638,
                    },
                    ["id"] = 1048,
                    ["name"] = {
                        ["areaID"] = 3638,
                    },
                    ["type"] = 18,
                },
                [10] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3615,
                    },
                    ["id"] = 1049,
                    ["name"] = {
                        ["areaID"] = 3615,
                    },
                    ["type"] = 18,
                },
                [11] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3617,
                    },
                    ["id"] = 1050,
                    ["name"] = {
                        ["areaID"] = 3617,
                    },
                    ["type"] = 18,
                },
                [12] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3610,
                    },
                    ["id"] = 1051,
                    ["name"] = {
                        ["areaID"] = 3610,
                    },
                    ["type"] = 18,
                },
                [13] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3611,
                    },
                    ["id"] = 1052,
                    ["name"] = {
                        ["areaID"] = 3611,
                    },
                    ["type"] = 18,
                },
                [14] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3625,
                    },
                    ["id"] = 1053,
                    ["name"] = {
                        ["areaID"] = 3625,
                    },
                    ["type"] = 18,
                },
                [15] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3629,
                    },
                    ["id"] = 1054,
                    ["name"] = {
                        ["areaID"] = 3629,
                    },
                    ["type"] = 18,
                },
                [16] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3764,
                    },
                    ["id"] = 1055,
                    ["name"] = {
                        ["areaID"] = 3764,
                    },
                    ["type"] = 18,
                },
                [17] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3762,
                    },
                    ["id"] = 1056,
                    ["name"] = {
                        ["areaID"] = 3762,
                    },
                    ["type"] = 18,
                },
                [18] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3634,
                    },
                    ["id"] = 1057,
                    ["name"] = {
                        ["areaID"] = 3634,
                    },
                    ["type"] = 18,
                },
                [19] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3763,
                    },
                    ["id"] = 1058,
                    ["name"] = {
                        ["areaID"] = 3763,
                    },
                    ["type"] = 18,
                },
            },
            ["description"] = {
                ["args"] = {
                    [1] = {
                        ["areaID"] = 3518,
                    },
                },
                ["key"] = "AD_EXPLORE",
            },
            ["icon"] = "nagrand",
            ["id"] = 143,
            ["name"] = {
                ["args"] = {
                    [1] = {
                        ["areaID"] = 3518,
                    },
                },
                ["key"] = "AN_EXPLORE",
            },
            ["points"] = 10,
        },
        [144] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 9,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3864,
                    },
                    ["id"] = 1060,
                    ["name"] = {
                        ["areaID"] = 3864,
                    },
                    ["type"] = 18,
                },
                [2] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3867,
                    },
                    ["id"] = 1061,
                    ["name"] = {
                        ["areaID"] = 3867,
                    },
                    ["type"] = 18,
                },
                [3] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3773,
                    },
                    ["id"] = 1062,
                    ["name"] = {
                        ["areaID"] = 3773,
                    },
                    ["type"] = 18,
                },
                [4] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3777,
                    },
                    ["id"] = 1063,
                    ["name"] = {
                        ["areaID"] = 3777,
                    },
                    ["type"] = 18,
                },
                [5] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3776,
                    },
                    ["id"] = 1064,
                    ["name"] = {
                        ["areaID"] = 3776,
                    },
                    ["type"] = 18,
                },
                [6] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3863,
                    },
                    ["id"] = 1065,
                    ["name"] = {
                        ["areaID"] = 3863,
                    },
                    ["type"] = 18,
                },
                [7] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3775,
                    },
                    ["id"] = 1066,
                    ["name"] = {
                        ["areaID"] = 3775,
                    },
                    ["type"] = 18,
                },
                [8] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3831,
                    },
                    ["id"] = 1067,
                    ["name"] = {
                        ["areaID"] = 3831,
                    },
                    ["type"] = 18,
                },
                [9] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3787,
                    },
                    ["id"] = 1068,
                    ["name"] = {
                        ["areaID"] = 3787,
                    },
                    ["type"] = 18,
                },
                [10] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3784,
                    },
                    ["id"] = 1069,
                    ["name"] = {
                        ["areaID"] = 3784,
                    },
                    ["type"] = 18,
                },
                [11] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3785,
                    },
                    ["id"] = 1070,
                    ["name"] = {
                        ["areaID"] = 3785,
                    },
                    ["type"] = 18,
                },
                [12] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3781,
                    },
                    ["id"] = 1071,
                    ["name"] = {
                        ["areaID"] = 3781,
                    },
                    ["type"] = 18,
                },
                [13] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3618,
                    },
                    ["id"] = 1072,
                    ["name"] = {
                        ["areaID"] = 3618,
                    },
                    ["type"] = 18,
                },
                [14] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3768,
                    },
                    ["id"] = 1073,
                    ["name"] = {
                        ["areaID"] = 3768,
                    },
                    ["type"] = 18,
                },
                [15] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3844,
                    },
                    ["id"] = 1074,
                    ["name"] = {
                        ["areaID"] = 3844,
                    },
                    ["type"] = 18,
                },
                [16] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3830,
                    },
                    ["id"] = 1075,
                    ["name"] = {
                        ["areaID"] = 3830,
                    },
                    ["type"] = 18,
                },
                [17] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3833,
                    },
                    ["id"] = 1076,
                    ["name"] = {
                        ["areaID"] = 3833,
                    },
                    ["type"] = 18,
                },
                [18] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3828,
                    },
                    ["id"] = 1077,
                    ["name"] = {
                        ["areaID"] = 3828,
                    },
                    ["type"] = 18,
                },
                [19] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3866,
                    },
                    ["id"] = 1078,
                    ["name"] = {
                        ["areaID"] = 3866,
                    },
                    ["type"] = 18,
                },
                [20] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3772,
                    },
                    ["id"] = 1079,
                    ["name"] = {
                        ["areaID"] = 3772,
                    },
                    ["type"] = 18,
                },
                [21] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3865,
                    },
                    ["id"] = 1080,
                    ["name"] = {
                        ["areaID"] = 3865,
                    },
                    ["type"] = 18,
                },
                [22] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3769,
                    },
                    ["id"] = 1081,
                    ["name"] = {
                        ["areaID"] = 3769,
                    },
                    ["type"] = 18,
                },
                [23] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3782,
                    },
                    ["id"] = 1082,
                    ["name"] = {
                        ["areaID"] = 3782,
                    },
                    ["type"] = 18,
                },
                [24] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3829,
                    },
                    ["id"] = 1083,
                    ["name"] = {
                        ["areaID"] = 3829,
                    },
                    ["type"] = 18,
                },
                [25] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3827,
                    },
                    ["id"] = 1084,
                    ["name"] = {
                        ["areaID"] = 3827,
                    },
                    ["type"] = 18,
                },
                [26] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3832,
                    },
                    ["id"] = 1085,
                    ["name"] = {
                        ["areaID"] = 3832,
                    },
                    ["type"] = 18,
                },
            },
            ["description"] = {
                ["args"] = {
                    [1] = {
                        ["areaID"] = 3522,
                    },
                },
                ["key"] = "AD_EXPLORE",
            },
            ["icon"] = "blades_edge_mtns",
            ["id"] = 144,
            ["name"] = {
                ["args"] = {
                    [1] = {
                        ["areaID"] = 3522,
                    },
                },
                ["key"] = "AN_EXPLORE",
            },
            ["points"] = 10,
        },
        [145] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 9,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3712,
                    },
                    ["id"] = 1087,
                    ["name"] = {
                        ["areaID"] = 3712,
                    },
                    ["type"] = 18,
                },
                [2] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3726,
                    },
                    ["id"] = 1088,
                    ["name"] = {
                        ["areaID"] = 3726,
                    },
                    ["type"] = 18,
                },
                [3] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3730,
                    },
                    ["id"] = 1089,
                    ["name"] = {
                        ["areaID"] = 3730,
                    },
                    ["type"] = 18,
                },
                [4] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3734,
                    },
                    ["id"] = 1090,
                    ["name"] = {
                        ["areaID"] = 3734,
                    },
                    ["type"] = 18,
                },
                [5] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3722,
                    },
                    ["id"] = 1091,
                    ["name"] = {
                        ["areaID"] = 3722,
                    },
                    ["type"] = 18,
                },
                [6] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3736,
                    },
                    ["id"] = 1092,
                    ["name"] = {
                        ["areaID"] = 3736,
                    },
                    ["type"] = 18,
                },
                [7] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3741,
                    },
                    ["id"] = 1093,
                    ["name"] = {
                        ["areaID"] = 3741,
                    },
                    ["type"] = 18,
                },
                [8] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3842,
                    },
                    ["id"] = 1094,
                    ["name"] = {
                        ["areaID"] = 3842,
                    },
                    ["type"] = 18,
                },
                [9] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3729,
                    },
                    ["id"] = 1095,
                    ["name"] = {
                        ["areaID"] = 3729,
                    },
                    ["type"] = 18,
                },
                [10] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3723,
                    },
                    ["id"] = 1096,
                    ["name"] = {
                        ["areaID"] = 3723,
                    },
                    ["type"] = 18,
                },
                [11] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3737,
                    },
                    ["id"] = 1097,
                    ["name"] = {
                        ["areaID"] = 3737,
                    },
                    ["type"] = 18,
                },
                [12] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3733,
                    },
                    ["id"] = 1098,
                    ["name"] = {
                        ["areaID"] = 3733,
                    },
                    ["type"] = 18,
                },
                [13] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3850,
                    },
                    ["id"] = 1099,
                    ["name"] = {
                        ["areaID"] = 3850,
                    },
                    ["type"] = 18,
                },
                [14] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3725,
                    },
                    ["id"] = 1100,
                    ["name"] = {
                        ["areaID"] = 3725,
                    },
                    ["type"] = 18,
                },
                [15] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3837,
                    },
                    ["id"] = 1101,
                    ["name"] = {
                        ["areaID"] = 3837,
                    },
                    ["type"] = 18,
                },
                [16] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3738,
                    },
                    ["id"] = 1102,
                    ["name"] = {
                        ["areaID"] = 3738,
                    },
                    ["type"] = 18,
                },
                [17] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3868,
                    },
                    ["id"] = 1103,
                    ["name"] = {
                        ["areaID"] = 3868,
                    },
                    ["type"] = 18,
                },
                [18] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3874,
                    },
                    ["id"] = 1104,
                    ["name"] = {
                        ["areaID"] = 3874,
                    },
                    ["type"] = 18,
                },
                [19] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3877,
                    },
                    ["id"] = 1105,
                    ["name"] = {
                        ["areaID"] = 3877,
                    },
                    ["type"] = 18,
                },
                [20] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3878,
                    },
                    ["id"] = 1106,
                    ["name"] = {
                        ["areaID"] = 3878,
                    },
                    ["type"] = 18,
                },
                [21] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3742,
                    },
                    ["id"] = 1107,
                    ["name"] = {
                        ["areaID"] = 3742,
                    },
                    ["type"] = 18,
                },
                [22] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3739,
                    },
                    ["id"] = 1108,
                    ["name"] = {
                        ["areaID"] = 3739,
                    },
                    ["type"] = 18,
                },
            },
            ["description"] = {
                ["args"] = {
                    [1] = {
                        ["areaID"] = 3523,
                    },
                },
                ["key"] = "AD_EXPLORE",
            },
            ["icon"] = "netherstorm",
            ["id"] = 145,
            ["name"] = {
                ["args"] = {
                    [1] = {
                        ["areaID"] = 3523,
                    },
                },
                ["key"] = "AN_EXPLORE",
            },
            ["points"] = 10,
        },
        [146] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 9,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3750,
                    },
                    ["id"] = 1110,
                    ["name"] = {
                        ["areaID"] = 3750,
                    },
                    ["type"] = 18,
                },
                [2] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3822,
                    },
                    ["id"] = 1111,
                    ["name"] = {
                        ["areaID"] = 3822,
                    },
                    ["type"] = 18,
                },
                [3] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3743,
                    },
                    ["id"] = 1112,
                    ["name"] = {
                        ["areaID"] = 3743,
                    },
                    ["type"] = 18,
                },
                [4] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3759,
                    },
                    ["id"] = 1113,
                    ["name"] = {
                        ["areaID"] = 3759,
                    },
                    ["type"] = 18,
                },
                [5] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3744,
                    },
                    ["id"] = 1114,
                    ["name"] = {
                        ["areaID"] = 3744,
                    },
                    ["type"] = 18,
                },
                [6] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3756,
                    },
                    ["id"] = 1115,
                    ["name"] = {
                        ["areaID"] = 3756,
                    },
                    ["type"] = 18,
                },
                [7] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3748,
                    },
                    ["id"] = 1116,
                    ["name"] = {
                        ["areaID"] = 3748,
                    },
                    ["type"] = 18,
                },
                [8] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3746,
                    },
                    ["id"] = 1117,
                    ["name"] = {
                        ["areaID"] = 3746,
                    },
                    ["type"] = 18,
                },
                [9] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3821,
                    },
                    ["id"] = 1118,
                    ["name"] = {
                        ["areaID"] = 3821,
                    },
                    ["type"] = 18,
                },
                [10] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3745,
                    },
                    ["id"] = 1119,
                    ["name"] = {
                        ["areaID"] = 3745,
                    },
                    ["type"] = 18,
                },
                [11] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3754,
                    },
                    ["id"] = 1120,
                    ["name"] = {
                        ["areaID"] = 3754,
                    },
                    ["type"] = 18,
                },
                [12] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3752,
                    },
                    ["id"] = 1121,
                    ["name"] = {
                        ["areaID"] = 3752,
                    },
                    ["type"] = 18,
                },
                [13] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3758,
                    },
                    ["id"] = 1122,
                    ["name"] = {
                        ["areaID"] = 3758,
                    },
                    ["type"] = 18,
                },
            },
            ["description"] = {
                ["args"] = {
                    [1] = {
                        ["areaID"] = 3520,
                    },
                },
                ["key"] = "AD_EXPLORE",
            },
            ["icon"] = "shadowmoon",
            ["id"] = 146,
            ["name"] = {
                ["args"] = {
                    [1] = {
                        ["areaID"] = 3520,
                    },
                },
                ["key"] = "AN_EXPLORE",
            },
            ["points"] = 10,
        },
        [147] = {
            ["anyCompletable"] = true,
            ["categoryID"] = 9,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 18695,
                    },
                    ["id"] = 1125,
                    ["name"] = "TBC_NPC_18695",
                    ["type"] = 1,
                },
                [2] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 18682,
                    },
                    ["id"] = 1126,
                    ["name"] = "TBC_NPC_18682",
                    ["type"] = 1,
                },
                [3] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 18697,
                    },
                    ["id"] = 1127,
                    ["name"] = "TBC_NPC_18697",
                    ["type"] = 1,
                },
                [4] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 18681,
                    },
                    ["id"] = 1128,
                    ["name"] = "TBC_NPC_18681",
                    ["type"] = 1,
                },
                [5] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 18694,
                    },
                    ["id"] = 1129,
                    ["name"] = "TBC_NPC_18694",
                    ["type"] = 1,
                },
                [6] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 18689,
                    },
                    ["id"] = 1130,
                    ["name"] = "TBC_NPC_18689",
                    ["type"] = 1,
                },
                [7] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 18686,
                    },
                    ["id"] = 1131,
                    ["name"] = "TBC_NPC_18686",
                    ["type"] = 1,
                },
                [8] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 18698,
                    },
                    ["id"] = 1132,
                    ["name"] = "TBC_NPC_18698",
                    ["type"] = 1,
                },
                [9] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 18678,
                    },
                    ["id"] = 1133,
                    ["name"] = "TBC_NPC_18678",
                    ["type"] = 1,
                },
                [10] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 17144,
                    },
                    ["id"] = 1134,
                    ["name"] = "TBC_NPC_17144",
                    ["type"] = 1,
                },
                [11] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 18692,
                    },
                    ["id"] = 1135,
                    ["name"] = "TBC_NPC_18692",
                    ["type"] = 1,
                },
                [12] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 18696,
                    },
                    ["id"] = 1136,
                    ["name"] = "TBC_NPC_18696",
                    ["type"] = 1,
                },
                [13] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 18680,
                    },
                    ["id"] = 1137,
                    ["name"] = "TBC_NPC_18680",
                    ["type"] = 1,
                },
                [14] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 18677,
                    },
                    ["id"] = 1138,
                    ["name"] = "TBC_NPC_18677",
                    ["type"] = 1,
                },
                [15] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 18690,
                    },
                    ["id"] = 1139,
                    ["name"] = "TBC_NPC_18690",
                    ["type"] = 1,
                },
                [16] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 20932,
                    },
                    ["id"] = 1140,
                    ["name"] = "TBC_NPC_20932",
                    ["type"] = 1,
                },
                [17] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 18685,
                    },
                    ["id"] = 1141,
                    ["name"] = "TBC_NPC_18685",
                    ["type"] = 1,
                },
                [18] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 18693,
                    },
                    ["id"] = 1142,
                    ["name"] = "TBC_NPC_18693",
                    ["type"] = 1,
                },
                [19] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 18683,
                    },
                    ["id"] = 1143,
                    ["name"] = "TBC_NPC_18683",
                    ["type"] = 1,
                },
                [20] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 18679,
                    },
                    ["id"] = 1144,
                    ["name"] = "TBC_NPC_18679",
                    ["type"] = 1,
                },
            },
            ["description"] = "AD_MIDDLE_RARE",
            ["icon"] = "-Spell_Shadow_DeathScream",
            ["id"] = 147,
            ["name"] = "AN_MIDDLE_RARE",
            ["nextID"] = 148,
            ["points"] = 10,
        },
        [148] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 9,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 18695,
                    },
                    ["id"] = 1145,
                    ["name"] = "TBC_NPC_18695",
                    ["type"] = 1,
                },
                [2] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 18682,
                    },
                    ["id"] = 1146,
                    ["name"] = "TBC_NPC_18682",
                    ["type"] = 1,
                },
                [3] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 18697,
                    },
                    ["id"] = 1147,
                    ["name"] = "TBC_NPC_18697",
                    ["type"] = 1,
                },
                [4] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 18681,
                    },
                    ["id"] = 1148,
                    ["name"] = "TBC_NPC_18681",
                    ["type"] = 1,
                },
                [5] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 18694,
                    },
                    ["id"] = 1149,
                    ["name"] = "TBC_NPC_18694",
                    ["type"] = 1,
                },
                [6] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 18689,
                    },
                    ["id"] = 1150,
                    ["name"] = "TBC_NPC_18689",
                    ["type"] = 1,
                },
                [7] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 18686,
                    },
                    ["id"] = 1151,
                    ["name"] = "TBC_NPC_18686",
                    ["type"] = 1,
                },
                [8] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 18698,
                    },
                    ["id"] = 1152,
                    ["name"] = "TBC_NPC_18698",
                    ["type"] = 1,
                },
                [9] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 18678,
                    },
                    ["id"] = 1153,
                    ["name"] = "TBC_NPC_18678",
                    ["type"] = 1,
                },
                [10] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 17144,
                    },
                    ["id"] = 1154,
                    ["name"] = "TBC_NPC_17144",
                    ["type"] = 1,
                },
                [11] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 18692,
                    },
                    ["id"] = 1155,
                    ["name"] = "TBC_NPC_18692",
                    ["type"] = 1,
                },
                [12] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 18696,
                    },
                    ["id"] = 1156,
                    ["name"] = "TBC_NPC_18696",
                    ["type"] = 1,
                },
                [13] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 18680,
                    },
                    ["id"] = 1157,
                    ["name"] = "TBC_NPC_18680",
                    ["type"] = 1,
                },
                [14] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 18677,
                    },
                    ["id"] = 1158,
                    ["name"] = "TBC_NPC_18677",
                    ["type"] = 1,
                },
                [15] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 18690,
                    },
                    ["id"] = 1159,
                    ["name"] = "TBC_NPC_18690",
                    ["type"] = 1,
                },
                [16] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 20932,
                    },
                    ["id"] = 1160,
                    ["name"] = "TBC_NPC_20932",
                    ["type"] = 1,
                },
                [17] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 18685,
                    },
                    ["id"] = 1161,
                    ["name"] = "TBC_NPC_18685",
                    ["type"] = 1,
                },
                [18] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 18693,
                    },
                    ["id"] = 1162,
                    ["name"] = "TBC_NPC_18693",
                    ["type"] = 1,
                },
                [19] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 18683,
                    },
                    ["id"] = 1163,
                    ["name"] = "TBC_NPC_18683",
                    ["type"] = 1,
                },
                [20] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 18679,
                    },
                    ["id"] = 1164,
                    ["name"] = "TBC_NPC_18679",
                    ["type"] = 1,
                },
            },
            ["description"] = "AD_BLOODY_RARE",
            ["icon"] = "-Spell_Shadow_DeathScream",
            ["id"] = 148,
            ["name"] = "AN_BLOODY_RARE",
            ["points"] = 20,
            ["previousID"] = 147,
        },
        [188] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 10,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 17468,
                    },
                    ["id"] = 1208,
                    ["name"] = "",
                    ["type"] = 1,
                },
            },
            ["description"] = "AD_VELEN_SLAYER",
            ["faction"] = true,
            ["icon"] = "achievement_leader_prophet_velen",
            ["id"] = 188,
            ["name"] = "AN_VELEN_SLAYER",
            ["points"] = 10,
        },
        [193] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 10,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 16802,
                    },
                    ["id"] = 1216,
                    ["name"] = "",
                    ["type"] = 1,
                },
            },
            ["description"] = "AD_LORTHEMAR_SLAYER",
            ["faction"] = false,
            ["icon"] = "Achievement_Leader_Lorthemar_Theron",
            ["id"] = 193,
            ["name"] = "AN_LORTHEMAR_SLAYER",
            ["points"] = 10,
        },
        [213] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 13,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 1956,
                    },
                    ["id"] = 1255,
                    ["name"] = "",
                    ["quantity"] = 1,
                    ["type"] = 26,
                },
            },
            ["description"] = "AD_EYE_WIN",
            ["icon"] = "achievement_bg_wineos",
            ["id"] = 213,
            ["name"] = "AN_EYE_WIN",
            ["nextID"] = 214,
            ["points"] = 10,
        },
        [214] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 13,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 1956,
                    },
                    ["id"] = 1256,
                    ["name"] = {
                        ["args"] = {
                            [1] = 5,
                        },
                        ["key"] = "AD_EYE_WINS",
                    },
                    ["quantity"] = 5,
                    ["type"] = 26,
                },
            },
            ["description"] = {
                ["args"] = {
                    [1] = 5,
                },
                ["key"] = "AD_EYE_WINS",
            },
            ["icon"] = "achievement_bg_wineos",
            ["id"] = 214,
            ["name"] = "AN_EYE_WINS",
            ["nextID"] = 215,
            ["points"] = 10,
            ["previousID"] = 213,
        },
        [215] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 13,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 1956,
                    },
                    ["id"] = 1257,
                    ["name"] = {
                        ["args"] = {
                            [1] = 10,
                        },
                        ["key"] = "AD_EYE_WINS",
                    },
                    ["quantity"] = 10,
                    ["type"] = 26,
                },
            },
            ["description"] = {
                ["args"] = {
                    [1] = 10,
                },
                ["key"] = "AD_EYE_WINS",
            },
            ["icon"] = "achievement_bg_wineos",
            ["id"] = 215,
            ["name"] = "AN_EYE_WINS",
            ["nextID"] = 216,
            ["points"] = 10,
            ["previousID"] = 214,
        },
        [216] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 13,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 1956,
                    },
                    ["id"] = 1258,
                    ["name"] = {
                        ["args"] = {
                            [1] = 25,
                        },
                        ["key"] = "AD_EYE_WINS",
                    },
                    ["quantity"] = 25,
                    ["type"] = 26,
                },
            },
            ["description"] = {
                ["args"] = {
                    [1] = 25,
                },
                ["key"] = "AD_EYE_WINS",
            },
            ["icon"] = "achievement_bg_wineos",
            ["id"] = 216,
            ["name"] = "AN_EYE_WINS",
            ["nextID"] = 217,
            ["points"] = 10,
            ["previousID"] = 215,
        },
        [217] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 13,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 1956,
                    },
                    ["id"] = 1259,
                    ["name"] = {
                        ["args"] = {
                            [1] = 50,
                        },
                        ["key"] = "AD_EYE_WINS",
                    },
                    ["quantity"] = 50,
                    ["type"] = 26,
                },
            },
            ["description"] = {
                ["args"] = {
                    [1] = 50,
                },
                ["key"] = "AD_EYE_WINS",
            },
            ["icon"] = "achievement_bg_wineos",
            ["id"] = 217,
            ["name"] = "AN_EYE_WINS",
            ["points"] = 10,
            ["previousID"] = 216,
        },
        [272] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 13,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 1956,
                        [2] = 1,
                    },
                    ["id"] = 1315,
                    ["name"] = "AD_EYE_CAPTURE",
                    ["quantity"] = 1,
                    ["type"] = 23,
                },
            },
            ["description"] = "AD_EYE_CAPTURE",
            ["icon"] = "achievement_bg_captureflag_eos",
            ["id"] = 272,
            ["name"] = "AN_EYE_CAPTURE",
            ["nextID"] = 273,
            ["points"] = 10,
        },
        [273] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 13,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 1956,
                        [2] = 1,
                    },
                    ["id"] = 1316,
                    ["name"] = {
                        ["args"] = {
                            [1] = 2,
                        },
                        ["key"] = "AD_EYE_CAPTURES",
                    },
                    ["quantity"] = 2,
                    ["type"] = 23,
                },
            },
            ["description"] = {
                ["args"] = {
                    [1] = 2,
                },
                ["key"] = "AD_EYE_CAPTURES",
            },
            ["icon"] = "achievement_bg_captureflag_eos",
            ["id"] = 273,
            ["name"] = "AN_EYE_CAPTURE",
            ["nextID"] = 274,
            ["points"] = 10,
            ["previousID"] = 272,
        },
        [274] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 13,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 1956,
                        [2] = 1,
                    },
                    ["id"] = 1317,
                    ["name"] = {
                        ["args"] = {
                            [1] = 3,
                        },
                        ["key"] = "AD_EYE_CAPTURES",
                    },
                    ["quantity"] = 3,
                    ["type"] = 23,
                },
            },
            ["description"] = {
                ["args"] = {
                    [1] = 3,
                },
                ["key"] = "AD_EYE_CAPTURES",
            },
            ["icon"] = "achievement_bg_captureflag_eos",
            ["id"] = 274,
            ["name"] = "AN_EYE_CAPTURE",
            ["points"] = 10,
            ["previousID"] = 273,
        },
        [275] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 13,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {},
                    ["id"] = 1318,
                    ["name"] = "",
                    ["type"] = 42,
                },
            },
            ["description"] = "AD_EYE_GLORY",
            ["icon"] = "-Spell_Arcane_MassDispel",
            ["id"] = 275,
            ["name"] = "AN_EYE_GLORY",
            ["points"] = 10,
        },
        [276] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 13,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {},
                    ["id"] = 1319,
                    ["name"] = "",
                    ["type"] = 43,
                },
            },
            ["description"] = "AD_EYE_BERSERK",
            ["icon"] = "-Spell_Nature_BloodLust",
            ["id"] = 276,
            ["name"] = "AN_EYE_BERSERK",
            ["points"] = 10,
        },
        [277] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 13,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 1956,
                        [2] = 2000,
                        [3] = 0,
                    },
                    ["id"] = 1320,
                    ["name"] = "",
                    ["type"] = 44,
                },
            },
            ["description"] = "AD_EYE_IDEAL_VICTORY",
            ["icon"] = "-inv_brd_banner",
            ["id"] = 277,
            ["name"] = "AN_EYE_IDEAL_VICTORY",
            ["points"] = 10,
        },
        [278] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 13,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 1956,
                    },
                    ["id"] = 1321,
                    ["name"] = "",
                    ["type"] = 34,
                },
            },
            ["description"] = "AD_EYE_FAST_WIN",
            ["icon"] = "achievement_bg_wineos_underxminutes",
            ["id"] = 278,
            ["name"] = "AN_EYE_FAST_WIN",
            ["points"] = 10,
        },
        [282] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 13,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 217,
                    },
                    ["id"] = 1348,
                    ["name"] = "AN_EYE_WINS",
                    ["type"] = 20,
                },
                [2] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 274,
                    },
                    ["id"] = 1349,
                    ["name"] = "AN_EYE_CAPTURE",
                    ["type"] = 20,
                },
                [3] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 275,
                    },
                    ["id"] = 1350,
                    ["name"] = "AN_EYE_GLORY",
                    ["type"] = 20,
                },
                [4] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 276,
                    },
                    ["id"] = 1351,
                    ["name"] = "AN_EYE_BERSERK",
                    ["type"] = 20,
                },
                [5] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 277,
                    },
                    ["id"] = 1352,
                    ["name"] = "AN_EYE_IDEAL_VICTORY",
                    ["type"] = 20,
                },
                [6] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 278,
                    },
                    ["id"] = 1353,
                    ["name"] = "AN_EYE_FAST_WIN",
                    ["type"] = 20,
                },
            },
            ["description"] = "AD_EYE_BOSS",
            ["icon"] = "-Spell_Nature_EyeoftheStorm",
            ["id"] = 282,
            ["name"] = "AN_EYE_BOSS",
            ["points"] = 10,
        },
        [360] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 16,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 362,
                    },
                    ["id"] = 1518,
                    ["name"] = "AN_HELLFIRE_RAMPARTS",
                    ["type"] = 20,
                },
                [2] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 364,
                    },
                    ["id"] = 1524,
                    ["name"] = "AN_BLOOD_FURNACE",
                    ["type"] = 20,
                },
                [3] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 366,
                    },
                    ["id"] = 1528,
                    ["name"] = "AN_SLAVE_PENS",
                    ["type"] = 20,
                },
                [4] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 368,
                    },
                    ["id"] = 1532,
                    ["name"] = "AN_UNDERBOG",
                    ["type"] = 20,
                },
                [5] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 370,
                    },
                    ["id"] = 1536,
                    ["name"] = "AN_MANA_TOMBS",
                    ["type"] = 20,
                },
                [6] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 372,
                    },
                    ["id"] = 1540,
                    ["name"] = "AN_AUCHENAI_CRYPTS",
                    ["type"] = 20,
                },
                [7] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 374,
                    },
                    ["id"] = 1544,
                    ["name"] = "AN_OLD_HILLSBRAD",
                    ["type"] = 20,
                },
                [8] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 376,
                    },
                    ["id"] = 1548,
                    ["name"] = "AN_SETHEKK_HALLS",
                    ["type"] = 20,
                },
                [9] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 378,
                    },
                    ["id"] = 1552,
                    ["name"] = "AN_STEAMVAULT",
                    ["type"] = 20,
                },
                [10] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 380,
                    },
                    ["id"] = 1556,
                    ["name"] = "AN_SHADOW_LABYRINTH",
                    ["type"] = 20,
                },
                [11] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 382,
                    },
                    ["id"] = 1560,
                    ["name"] = "AN_SHATTERED_HALLS",
                    ["type"] = 20,
                },
                [12] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 384,
                    },
                    ["id"] = 1564,
                    ["name"] = "AN_BLACK_MORASS",
                    ["type"] = 20,
                },
                [13] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 386,
                    },
                    ["id"] = 1568,
                    ["name"] = "AN_BOTANICA",
                    ["type"] = 20,
                },
                [14] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 388,
                    },
                    ["id"] = 1572,
                    ["name"] = "AN_MECHANAR",
                    ["type"] = 20,
                },
                [15] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 390,
                    },
                    ["id"] = 1576,
                    ["name"] = "AN_ARCATRAZ",
                    ["type"] = 20,
                },
                [16] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 392,
                    },
                    ["id"] = 1580,
                    ["name"] = "AN_MAGISTERS_TERRACE",
                    ["type"] = 20,
                },
            },
            ["description"] = "AD_TBC_DUNGEONS",
            ["icon"] = "-spell_holy_summonchampion",
            ["id"] = 360,
            ["name"] = "AN_TBC_DUNGEONS",
            ["points"] = 10,
        },
        [361] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 16,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 363,
                    },
                    ["id"] = 1522,
                    ["name"] = {
                        ["args"] = {
                            [1] = "AN_HELLFIRE_RAMPARTS",
                        },
                        ["key"] = "HEROIC_NAME_PATTERN",
                    },
                    ["type"] = 20,
                },
                [2] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 365,
                    },
                    ["id"] = 1526,
                    ["name"] = {
                        ["args"] = {
                            [1] = "AN_BLOOD_FURNACE",
                        },
                        ["key"] = "HEROIC_NAME_PATTERN",
                    },
                    ["type"] = 20,
                },
                [3] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 367,
                    },
                    ["id"] = 1530,
                    ["name"] = {
                        ["args"] = {
                            [1] = "AN_SLAVE_PENS",
                        },
                        ["key"] = "HEROIC_NAME_PATTERN",
                    },
                    ["type"] = 20,
                },
                [4] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 369,
                    },
                    ["id"] = 1534,
                    ["name"] = {
                        ["args"] = {
                            [1] = "AN_UNDERBOG",
                        },
                        ["key"] = "HEROIC_NAME_PATTERN",
                    },
                    ["type"] = 20,
                },
                [5] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 371,
                    },
                    ["id"] = 1538,
                    ["name"] = {
                        ["args"] = {
                            [1] = "AN_MANA_TOMBS",
                        },
                        ["key"] = "HEROIC_NAME_PATTERN",
                    },
                    ["type"] = 20,
                },
                [6] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 373,
                    },
                    ["id"] = 1542,
                    ["name"] = {
                        ["args"] = {
                            [1] = "AN_AUCHENAI_CRYPTS",
                        },
                        ["key"] = "HEROIC_NAME_PATTERN",
                    },
                    ["type"] = 20,
                },
                [7] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 375,
                    },
                    ["id"] = 1546,
                    ["name"] = {
                        ["args"] = {
                            [1] = "AN_OLD_HILLSBRAD",
                        },
                        ["key"] = "HEROIC_NAME_PATTERN",
                    },
                    ["type"] = 20,
                },
                [8] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 377,
                    },
                    ["id"] = 1550,
                    ["name"] = {
                        ["args"] = {
                            [1] = "AN_SETHEKK_HALLS",
                        },
                        ["key"] = "HEROIC_NAME_PATTERN",
                    },
                    ["type"] = 20,
                },
                [9] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 379,
                    },
                    ["id"] = 1554,
                    ["name"] = {
                        ["args"] = {
                            [1] = "AN_STEAMVAULT",
                        },
                        ["key"] = "HEROIC_NAME_PATTERN",
                    },
                    ["type"] = 20,
                },
                [10] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 381,
                    },
                    ["id"] = 1558,
                    ["name"] = {
                        ["args"] = {
                            [1] = "AN_SHADOW_LABYRINTH",
                        },
                        ["key"] = "HEROIC_NAME_PATTERN",
                    },
                    ["type"] = 20,
                },
                [11] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 383,
                    },
                    ["id"] = 1562,
                    ["name"] = {
                        ["args"] = {
                            [1] = "AN_SHATTERED_HALLS",
                        },
                        ["key"] = "HEROIC_NAME_PATTERN",
                    },
                    ["type"] = 20,
                },
                [12] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 385,
                    },
                    ["id"] = 1566,
                    ["name"] = {
                        ["args"] = {
                            [1] = "AN_BLACK_MORASS",
                        },
                        ["key"] = "HEROIC_NAME_PATTERN",
                    },
                    ["type"] = 20,
                },
                [13] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 387,
                    },
                    ["id"] = 1570,
                    ["name"] = {
                        ["args"] = {
                            [1] = "AN_BOTANICA",
                        },
                        ["key"] = "HEROIC_NAME_PATTERN",
                    },
                    ["type"] = 20,
                },
                [14] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 389,
                    },
                    ["id"] = 1574,
                    ["name"] = {
                        ["args"] = {
                            [1] = "AN_MECHANAR",
                        },
                        ["key"] = "HEROIC_NAME_PATTERN",
                    },
                    ["type"] = 20,
                },
                [15] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 391,
                    },
                    ["id"] = 1578,
                    ["name"] = {
                        ["args"] = {
                            [1] = "AN_ARCATRAZ",
                        },
                        ["key"] = "HEROIC_NAME_PATTERN",
                    },
                    ["type"] = 20,
                },
                [16] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 393,
                    },
                    ["id"] = 1582,
                    ["name"] = {
                        ["args"] = {
                            [1] = "AN_MAGISTERS_TERRACE",
                        },
                        ["key"] = "HEROIC_NAME_PATTERN",
                    },
                    ["type"] = 20,
                },
            },
            ["description"] = "AD_TBC_DUNGEONS_HERO",
            ["icon"] = "-ability_creature_cursed_02",
            ["id"] = 361,
            ["name"] = "AN_TBC_DUNGEONS_HERO",
            ["points"] = 20,
        },
        [362] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 18,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 17308,
                    },
                    ["id"] = 1515,
                    ["name"] = "AC_BOSS_17308",
                    ["type"] = 1,
                },
                [2] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 17537,
                    },
                    ["id"] = 1516,
                    ["name"] = "AC_BOSS_17537",
                    ["type"] = 1,
                },
                [3] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 17306,
                    },
                    ["id"] = 1517,
                    ["name"] = "AC_BOSS_17306",
                    ["type"] = 1,
                },
            },
            ["description"] = {
                ["concat"] = {
                    [1] = {
                        ["literal"] = "",
                    },
                    [2] = "AD_HELLFIRE_RAMPARTS",
                    [3] = {
                        ["literal"] = ".",
                    },
                },
            },
            ["icon"] = "achievement_boss_omartheunscarred_01",
            ["id"] = 362,
            ["name"] = "AN_HELLFIRE_RAMPARTS",
            ["nextID"] = 363,
            ["points"] = 10,
        },
        [363] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 18,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 17308,
                    },
                    ["id"] = 1519,
                    ["name"] = "AC_BOSS_17308",
                    ["type"] = 40,
                },
                [2] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 17537,
                    },
                    ["id"] = 1520,
                    ["name"] = "AC_BOSS_17537",
                    ["type"] = 40,
                },
                [3] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 17306,
                    },
                    ["id"] = 1521,
                    ["name"] = "AC_BOSS_17306",
                    ["type"] = 40,
                },
            },
            ["description"] = {
                ["concat"] = {
                    [1] = {
                        ["literal"] = "",
                    },
                    [2] = {
                        ["args"] = {
                            [1] = "AD_HELLFIRE_RAMPARTS",
                        },
                        ["key"] = "HEROIC_DESCRIPTION_PATTERN",
                    },
                    [3] = {
                        ["literal"] = ".",
                    },
                },
            },
            ["icon"] = "achievement_boss_omartheunscarred_01",
            ["id"] = 363,
            ["name"] = {
                ["args"] = {
                    [1] = "AN_HELLFIRE_RAMPARTS",
                },
                ["key"] = "HEROIC_NAME_PATTERN",
            },
            ["points"] = 10,
            ["previousID"] = 362,
        },
        [364] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 18,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 17377,
                    },
                    ["id"] = 1523,
                    ["name"] = "",
                    ["type"] = 1,
                },
            },
            ["description"] = {
                ["concat"] = {
                    [1] = {
                        ["literal"] = "",
                    },
                    [2] = "AD_BLOOD_FURNACE",
                    [3] = {
                        ["literal"] = ".",
                    },
                },
            },
            ["icon"] = "achievement_boss_kelidanthebreaker",
            ["id"] = 364,
            ["name"] = "AN_BLOOD_FURNACE",
            ["nextID"] = 365,
            ["points"] = 10,
        },
        [365] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 18,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 17377,
                    },
                    ["id"] = 1525,
                    ["name"] = "",
                    ["type"] = 40,
                },
            },
            ["description"] = {
                ["concat"] = {
                    [1] = {
                        ["literal"] = "",
                    },
                    [2] = {
                        ["args"] = {
                            [1] = "AD_BLOOD_FURNACE",
                        },
                        ["key"] = "HEROIC_DESCRIPTION_PATTERN",
                    },
                    [3] = {
                        ["literal"] = ".",
                    },
                },
            },
            ["icon"] = "achievement_boss_kelidanthebreaker",
            ["id"] = 365,
            ["name"] = {
                ["args"] = {
                    [1] = "AN_BLOOD_FURNACE",
                },
                ["key"] = "HEROIC_NAME_PATTERN",
            },
            ["points"] = 10,
            ["previousID"] = 364,
        },
        [366] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 18,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 17942,
                    },
                    ["id"] = 1527,
                    ["name"] = "",
                    ["type"] = 1,
                },
            },
            ["description"] = {
                ["concat"] = {
                    [1] = {
                        ["literal"] = "",
                    },
                    [2] = "AD_SLAVE_PENS",
                    [3] = {
                        ["literal"] = ".",
                    },
                },
            },
            ["icon"] = "achievement_boss_quagmirran",
            ["id"] = 366,
            ["name"] = "AN_SLAVE_PENS",
            ["nextID"] = 367,
            ["points"] = 10,
        },
        [367] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 18,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 17942,
                    },
                    ["id"] = 1529,
                    ["name"] = "",
                    ["type"] = 40,
                },
            },
            ["description"] = {
                ["concat"] = {
                    [1] = {
                        ["literal"] = "",
                    },
                    [2] = {
                        ["args"] = {
                            [1] = "AD_SLAVE_PENS",
                        },
                        ["key"] = "HEROIC_DESCRIPTION_PATTERN",
                    },
                    [3] = {
                        ["literal"] = ".",
                    },
                },
            },
            ["icon"] = "achievement_boss_quagmirran",
            ["id"] = 367,
            ["name"] = {
                ["args"] = {
                    [1] = "AN_SLAVE_PENS",
                },
                ["key"] = "HEROIC_NAME_PATTERN",
            },
            ["points"] = 10,
            ["previousID"] = 366,
        },
        [368] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 18,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 17882,
                    },
                    ["id"] = 1531,
                    ["name"] = "",
                    ["type"] = 1,
                },
            },
            ["description"] = {
                ["concat"] = {
                    [1] = {
                        ["literal"] = "",
                    },
                    [2] = "AD_UNDERBOG",
                    [3] = {
                        ["literal"] = ".",
                    },
                },
            },
            ["icon"] = "achievement_boss_theblackstalker",
            ["id"] = 368,
            ["name"] = "AN_UNDERBOG",
            ["nextID"] = 369,
            ["points"] = 10,
        },
        [369] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 18,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 17882,
                    },
                    ["id"] = 1533,
                    ["name"] = "",
                    ["type"] = 40,
                },
            },
            ["description"] = {
                ["concat"] = {
                    [1] = {
                        ["literal"] = "",
                    },
                    [2] = {
                        ["args"] = {
                            [1] = "AD_UNDERBOG",
                        },
                        ["key"] = "HEROIC_DESCRIPTION_PATTERN",
                    },
                    [3] = {
                        ["literal"] = ".",
                    },
                },
            },
            ["icon"] = "achievement_boss_theblackstalker",
            ["id"] = 369,
            ["name"] = {
                ["args"] = {
                    [1] = "AN_UNDERBOG",
                },
                ["key"] = "HEROIC_NAME_PATTERN",
            },
            ["points"] = 10,
            ["previousID"] = 368,
        },
        [370] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 18,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 18344,
                    },
                    ["id"] = 1535,
                    ["name"] = "",
                    ["type"] = 1,
                },
            },
            ["description"] = {
                ["concat"] = {
                    [1] = {
                        ["literal"] = "",
                    },
                    [2] = "AD_MANA_TOMBS",
                    [3] = {
                        ["literal"] = ".",
                    },
                },
            },
            ["icon"] = "achievement_boss_nexus_prince_shaffar",
            ["id"] = 370,
            ["name"] = "AN_MANA_TOMBS",
            ["nextID"] = 371,
            ["points"] = 10,
        },
        [371] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 18,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 18344,
                    },
                    ["id"] = 1537,
                    ["name"] = "",
                    ["type"] = 40,
                },
            },
            ["description"] = {
                ["concat"] = {
                    [1] = {
                        ["literal"] = "",
                    },
                    [2] = {
                        ["args"] = {
                            [1] = "AD_MANA_TOMBS",
                        },
                        ["key"] = "HEROIC_DESCRIPTION_PATTERN",
                    },
                    [3] = {
                        ["literal"] = ".",
                    },
                },
            },
            ["icon"] = "achievement_boss_nexus_prince_shaffar",
            ["id"] = 371,
            ["name"] = {
                ["args"] = {
                    [1] = "AN_MANA_TOMBS",
                },
                ["key"] = "HEROIC_NAME_PATTERN",
            },
            ["points"] = 10,
            ["previousID"] = 370,
        },
        [372] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 18,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 18373,
                    },
                    ["id"] = 1539,
                    ["name"] = "",
                    ["type"] = 1,
                },
            },
            ["description"] = {
                ["concat"] = {
                    [1] = {
                        ["literal"] = "",
                    },
                    [2] = "AD_AUCHENAI_CRYPTS",
                    [3] = {
                        ["literal"] = ".",
                    },
                },
            },
            ["icon"] = "achievement_boss_exarch_maladaar",
            ["id"] = 372,
            ["name"] = "AN_AUCHENAI_CRYPTS",
            ["nextID"] = 373,
            ["points"] = 10,
        },
        [373] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 18,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 18373,
                    },
                    ["id"] = 1541,
                    ["name"] = "",
                    ["type"] = 40,
                },
            },
            ["description"] = {
                ["concat"] = {
                    [1] = {
                        ["literal"] = "",
                    },
                    [2] = {
                        ["args"] = {
                            [1] = "AD_AUCHENAI_CRYPTS",
                        },
                        ["key"] = "HEROIC_DESCRIPTION_PATTERN",
                    },
                    [3] = {
                        ["literal"] = ".",
                    },
                },
            },
            ["icon"] = "achievement_boss_exarch_maladaar",
            ["id"] = 373,
            ["name"] = {
                ["args"] = {
                    [1] = "AN_AUCHENAI_CRYPTS",
                },
                ["key"] = "HEROIC_NAME_PATTERN",
            },
            ["points"] = 10,
            ["previousID"] = 372,
        },
        [374] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 18,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 18096,
                    },
                    ["id"] = 1543,
                    ["name"] = "",
                    ["type"] = 1,
                },
            },
            ["description"] = {
                ["concat"] = {
                    [1] = {
                        ["literal"] = "",
                    },
                    [2] = "AD_OLD_HILLSBRAD",
                    [3] = {
                        ["literal"] = ".",
                    },
                },
            },
            ["icon"] = "achievement_boss_epochhunter",
            ["id"] = 374,
            ["name"] = "AN_OLD_HILLSBRAD",
            ["nextID"] = 375,
            ["points"] = 10,
        },
        [375] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 18,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 18096,
                    },
                    ["id"] = 1545,
                    ["name"] = "",
                    ["type"] = 40,
                },
            },
            ["description"] = {
                ["concat"] = {
                    [1] = {
                        ["literal"] = "",
                    },
                    [2] = {
                        ["args"] = {
                            [1] = "AD_OLD_HILLSBRAD",
                        },
                        ["key"] = "HEROIC_DESCRIPTION_PATTERN",
                    },
                    [3] = {
                        ["literal"] = ".",
                    },
                },
            },
            ["icon"] = "achievement_boss_epochhunter",
            ["id"] = 375,
            ["name"] = {
                ["args"] = {
                    [1] = "AN_OLD_HILLSBRAD",
                },
                ["key"] = "HEROIC_NAME_PATTERN",
            },
            ["points"] = 10,
            ["previousID"] = 374,
        },
        [376] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 18,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 18473,
                    },
                    ["id"] = 1547,
                    ["name"] = "",
                    ["type"] = 1,
                },
            },
            ["description"] = {
                ["concat"] = {
                    [1] = {
                        ["literal"] = "",
                    },
                    [2] = "AD_SETHEKK_HALLS",
                    [3] = {
                        ["literal"] = ".",
                    },
                },
            },
            ["icon"] = "achievement_boss_talonkingikiss",
            ["id"] = 376,
            ["name"] = "AN_SETHEKK_HALLS",
            ["nextID"] = 377,
            ["points"] = 10,
        },
        [377] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 18,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 18473,
                    },
                    ["id"] = 1549,
                    ["name"] = "",
                    ["type"] = 40,
                },
            },
            ["description"] = {
                ["concat"] = {
                    [1] = {
                        ["literal"] = "",
                    },
                    [2] = {
                        ["args"] = {
                            [1] = "AD_SETHEKK_HALLS",
                        },
                        ["key"] = "HEROIC_DESCRIPTION_PATTERN",
                    },
                    [3] = {
                        ["literal"] = ".",
                    },
                },
            },
            ["icon"] = "achievement_boss_talonkingikiss",
            ["id"] = 377,
            ["name"] = {
                ["args"] = {
                    [1] = "AN_SETHEKK_HALLS",
                },
                ["key"] = "HEROIC_NAME_PATTERN",
            },
            ["points"] = 10,
            ["previousID"] = 376,
        },
        [378] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 18,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 17798,
                    },
                    ["id"] = 1551,
                    ["name"] = "",
                    ["type"] = 1,
                },
            },
            ["description"] = {
                ["concat"] = {
                    [1] = {
                        ["literal"] = "",
                    },
                    [2] = "AD_STEAMVAULT",
                    [3] = {
                        ["literal"] = ".",
                    },
                },
            },
            ["icon"] = "achievement_boss_warlord_kalithresh",
            ["id"] = 378,
            ["name"] = "AN_STEAMVAULT",
            ["nextID"] = 379,
            ["points"] = 10,
        },
        [379] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 18,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 17798,
                    },
                    ["id"] = 1553,
                    ["name"] = "",
                    ["type"] = 40,
                },
            },
            ["description"] = {
                ["concat"] = {
                    [1] = {
                        ["literal"] = "",
                    },
                    [2] = {
                        ["args"] = {
                            [1] = "AD_STEAMVAULT",
                        },
                        ["key"] = "HEROIC_DESCRIPTION_PATTERN",
                    },
                    [3] = {
                        ["literal"] = ".",
                    },
                },
            },
            ["icon"] = "achievement_boss_warlord_kalithresh",
            ["id"] = 379,
            ["name"] = {
                ["args"] = {
                    [1] = "AN_STEAMVAULT",
                },
                ["key"] = "HEROIC_NAME_PATTERN",
            },
            ["points"] = 10,
            ["previousID"] = 378,
        },
        [380] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 18,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 18708,
                    },
                    ["id"] = 1555,
                    ["name"] = "",
                    ["type"] = 1,
                },
            },
            ["description"] = {
                ["concat"] = {
                    [1] = {
                        ["literal"] = "",
                    },
                    [2] = "AD_SHADOW_LABYRINTH",
                    [3] = {
                        ["literal"] = ".",
                    },
                },
            },
            ["icon"] = "achievement_boss_murmur",
            ["id"] = 380,
            ["name"] = "AN_SHADOW_LABYRINTH",
            ["nextID"] = 381,
            ["points"] = 10,
        },
        [381] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 18,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 18708,
                    },
                    ["id"] = 1557,
                    ["name"] = "",
                    ["type"] = 40,
                },
            },
            ["description"] = {
                ["concat"] = {
                    [1] = {
                        ["literal"] = "",
                    },
                    [2] = {
                        ["args"] = {
                            [1] = "AD_SHADOW_LABYRINTH",
                        },
                        ["key"] = "HEROIC_DESCRIPTION_PATTERN",
                    },
                    [3] = {
                        ["literal"] = ".",
                    },
                },
            },
            ["icon"] = "achievement_boss_murmur",
            ["id"] = 381,
            ["name"] = {
                ["args"] = {
                    [1] = "AN_SHADOW_LABYRINTH",
                },
                ["key"] = "HEROIC_NAME_PATTERN",
            },
            ["points"] = 10,
            ["previousID"] = 380,
        },
        [382] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 18,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 16808,
                    },
                    ["id"] = 1559,
                    ["name"] = "",
                    ["type"] = 1,
                },
            },
            ["description"] = {
                ["concat"] = {
                    [1] = {
                        ["literal"] = "",
                    },
                    [2] = "AD_SHATTERED_HALLS",
                    [3] = {
                        ["literal"] = ".",
                    },
                },
            },
            ["icon"] = "achievement_boss_kargathbladefist_01",
            ["id"] = 382,
            ["name"] = "AN_SHATTERED_HALLS",
            ["nextID"] = 383,
            ["points"] = 10,
        },
        [383] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 18,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 16808,
                    },
                    ["id"] = 1561,
                    ["name"] = "",
                    ["type"] = 40,
                },
            },
            ["description"] = {
                ["concat"] = {
                    [1] = {
                        ["literal"] = "",
                    },
                    [2] = {
                        ["args"] = {
                            [1] = "AD_SHATTERED_HALLS",
                        },
                        ["key"] = "HEROIC_DESCRIPTION_PATTERN",
                    },
                    [3] = {
                        ["literal"] = ".",
                    },
                },
            },
            ["icon"] = "achievement_boss_kargathbladefist_01",
            ["id"] = 383,
            ["name"] = {
                ["args"] = {
                    [1] = "AN_SHATTERED_HALLS",
                },
                ["key"] = "HEROIC_NAME_PATTERN",
            },
            ["points"] = 10,
            ["previousID"] = 382,
        },
        [384] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 18,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 17881,
                    },
                    ["id"] = 1563,
                    ["name"] = "",
                    ["type"] = 1,
                },
            },
            ["description"] = {
                ["concat"] = {
                    [1] = {
                        ["literal"] = "",
                    },
                    [2] = "AD_BLACK_MORASS",
                    [3] = {
                        ["literal"] = ".",
                    },
                },
            },
            ["icon"] = "achievement_boss_aeonus_01",
            ["id"] = 384,
            ["name"] = "AN_BLACK_MORASS",
            ["nextID"] = 385,
            ["points"] = 10,
        },
        [385] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 18,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 17881,
                    },
                    ["id"] = 1565,
                    ["name"] = "",
                    ["type"] = 40,
                },
            },
            ["description"] = {
                ["concat"] = {
                    [1] = {
                        ["literal"] = "",
                    },
                    [2] = {
                        ["args"] = {
                            [1] = "AD_BLACK_MORASS",
                        },
                        ["key"] = "HEROIC_DESCRIPTION_PATTERN",
                    },
                    [3] = {
                        ["literal"] = ".",
                    },
                },
            },
            ["icon"] = "achievement_boss_aeonus_01",
            ["id"] = 385,
            ["name"] = {
                ["args"] = {
                    [1] = "AN_BLACK_MORASS",
                },
                ["key"] = "HEROIC_NAME_PATTERN",
            },
            ["points"] = 10,
            ["previousID"] = 384,
        },
        [386] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 18,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 17977,
                    },
                    ["id"] = 1567,
                    ["name"] = "",
                    ["type"] = 1,
                },
            },
            ["description"] = {
                ["concat"] = {
                    [1] = {
                        ["literal"] = "",
                    },
                    [2] = "AD_BOTANICA",
                    [3] = {
                        ["literal"] = ".",
                    },
                },
            },
            ["icon"] = "achievement_boss_warpsplinter",
            ["id"] = 386,
            ["name"] = "AN_BOTANICA",
            ["nextID"] = 387,
            ["points"] = 10,
        },
        [387] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 18,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 17977,
                    },
                    ["id"] = 1569,
                    ["name"] = "",
                    ["type"] = 40,
                },
            },
            ["description"] = {
                ["concat"] = {
                    [1] = {
                        ["literal"] = "",
                    },
                    [2] = {
                        ["args"] = {
                            [1] = "AD_BOTANICA",
                        },
                        ["key"] = "HEROIC_DESCRIPTION_PATTERN",
                    },
                    [3] = {
                        ["literal"] = ".",
                    },
                },
            },
            ["icon"] = "achievement_boss_warpsplinter",
            ["id"] = 387,
            ["name"] = {
                ["args"] = {
                    [1] = "AN_BOTANICA",
                },
                ["key"] = "HEROIC_NAME_PATTERN",
            },
            ["points"] = 10,
            ["previousID"] = 386,
        },
        [388] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 18,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 19220,
                    },
                    ["id"] = 1571,
                    ["name"] = "",
                    ["type"] = 1,
                },
            },
            ["description"] = {
                ["concat"] = {
                    [1] = {
                        ["literal"] = "",
                    },
                    [2] = "AD_MECHANAR",
                    [3] = {
                        ["literal"] = ".",
                    },
                },
            },
            ["icon"] = "achievement_boss_pathaleonthecalculator",
            ["id"] = 388,
            ["name"] = "AN_MECHANAR",
            ["nextID"] = 389,
            ["points"] = 10,
        },
        [389] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 18,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 19220,
                    },
                    ["id"] = 1573,
                    ["name"] = "",
                    ["type"] = 40,
                },
            },
            ["description"] = {
                ["concat"] = {
                    [1] = {
                        ["literal"] = "",
                    },
                    [2] = {
                        ["args"] = {
                            [1] = "AD_MECHANAR",
                        },
                        ["key"] = "HEROIC_DESCRIPTION_PATTERN",
                    },
                    [3] = {
                        ["literal"] = ".",
                    },
                },
            },
            ["icon"] = "achievement_boss_pathaleonthecalculator",
            ["id"] = 389,
            ["name"] = {
                ["args"] = {
                    [1] = "AN_MECHANAR",
                },
                ["key"] = "HEROIC_NAME_PATTERN",
            },
            ["points"] = 10,
            ["previousID"] = 388,
        },
        [390] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 18,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 20912,
                    },
                    ["id"] = 1575,
                    ["name"] = "",
                    ["type"] = 1,
                },
            },
            ["description"] = {
                ["concat"] = {
                    [1] = {
                        ["literal"] = "",
                    },
                    [2] = "AD_ARCATRAZ",
                    [3] = {
                        ["literal"] = ".",
                    },
                },
            },
            ["icon"] = "achievement_boss_harbinger_skyriss",
            ["id"] = 390,
            ["name"] = "AN_ARCATRAZ",
            ["nextID"] = 391,
            ["points"] = 10,
        },
        [391] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 18,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 20912,
                    },
                    ["id"] = 1577,
                    ["name"] = "",
                    ["type"] = 40,
                },
            },
            ["description"] = {
                ["concat"] = {
                    [1] = {
                        ["literal"] = "",
                    },
                    [2] = {
                        ["args"] = {
                            [1] = "AD_ARCATRAZ",
                        },
                        ["key"] = "HEROIC_DESCRIPTION_PATTERN",
                    },
                    [3] = {
                        ["literal"] = ".",
                    },
                },
            },
            ["icon"] = "achievement_boss_harbinger_skyriss",
            ["id"] = 391,
            ["name"] = {
                ["args"] = {
                    [1] = "AN_ARCATRAZ",
                },
                ["key"] = "HEROIC_NAME_PATTERN",
            },
            ["points"] = 10,
            ["previousID"] = 390,
        },
        [392] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 18,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 24664,
                    },
                    ["id"] = 1579,
                    ["name"] = "",
                    ["type"] = 1,
                },
            },
            ["description"] = {
                ["concat"] = {
                    [1] = {
                        ["literal"] = "",
                    },
                    [2] = "AD_MAGISTERS_TERRACE",
                    [3] = {
                        ["literal"] = ".",
                    },
                },
            },
            ["icon"] = "achievement_boss_kaelthassunstrider_01",
            ["id"] = 392,
            ["name"] = "AN_MAGISTERS_TERRACE",
            ["nextID"] = 393,
            ["points"] = 10,
        },
        [393] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 18,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 24664,
                    },
                    ["id"] = 1581,
                    ["name"] = "",
                    ["type"] = 40,
                },
            },
            ["description"] = {
                ["concat"] = {
                    [1] = {
                        ["literal"] = "",
                    },
                    [2] = {
                        ["args"] = {
                            [1] = "AD_MAGISTERS_TERRACE",
                        },
                        ["key"] = "HEROIC_DESCRIPTION_PATTERN",
                    },
                    [3] = {
                        ["literal"] = ".",
                    },
                },
            },
            ["icon"] = "achievement_boss_kaelthassunstrider_01",
            ["id"] = 393,
            ["name"] = {
                ["args"] = {
                    [1] = "AN_MAGISTERS_TERRACE",
                },
                ["key"] = "HEROIC_NAME_PATTERN",
            },
            ["points"] = 10,
            ["previousID"] = 392,
        },
        [394] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 35,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 32768,
                    },
                    ["id"] = 1583,
                    ["name"] = "",
                    ["type"] = 5,
                },
            },
            ["description"] = "AD_RAVEN_LORD",
            ["icon"] = "-Inv-Mount_Raven_54",
            ["id"] = 394,
            ["name"] = "AN_RAVEN_LORD",
            ["points"] = 0,
        },
        [395] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 18,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 18728,
                    },
                    ["id"] = 1584,
                    ["name"] = "",
                    ["type"] = 1,
                },
            },
            ["description"] = "AD_WB_KAZZAK_OUTLAND",
            ["icon"] = "-spell_shadow_shadowbolt",
            ["id"] = 395,
            ["name"] = "AN_WB_KAZZAK_OUTLAND",
            ["points"] = 10,
        },
        [396] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 18,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 17711,
                    },
                    ["id"] = 1585,
                    ["name"] = "",
                    ["type"] = 1,
                },
            },
            ["description"] = "AD_WB_DOOMWALKER",
            ["icon"] = "-spell_fire_felflamebreath",
            ["id"] = 396,
            ["name"] = "AN_WB_DOOMWALKER",
            ["points"] = 10,
        },
        [397] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 18,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 15690,
                    },
                    ["id"] = 1586,
                    ["name"] = "",
                    ["type"] = 1,
                },
            },
            ["description"] = "AD_KARAZHAN",
            ["icon"] = "achievement_boss_prince_malchezaar",
            ["id"] = 397,
            ["name"] = "AN_KARAZHAN",
            ["points"] = 10,
        },
        [398] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 18,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 19044,
                    },
                    ["id"] = 1587,
                    ["name"] = "",
                    ["type"] = 1,
                },
            },
            ["description"] = "AD_GRUUL",
            ["icon"] = "achievement_boss_gruulthedragonkiller",
            ["id"] = 398,
            ["name"] = "AN_GRUUL",
            ["points"] = 10,
        },
        [399] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 18,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 17257,
                    },
                    ["id"] = 1588,
                    ["name"] = "",
                    ["type"] = 1,
                },
            },
            ["description"] = "AD_MAGTHERIDON",
            ["icon"] = "achievement_boss_magtheridon",
            ["id"] = 399,
            ["name"] = "AN_MAGTHERIDON",
            ["points"] = 10,
        },
        [400] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 16,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 397,
                    },
                    ["id"] = 1589,
                    ["name"] = "AN_KARAZHAN",
                    ["type"] = 20,
                },
                [2] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 398,
                    },
                    ["id"] = 1590,
                    ["name"] = "AN_GRUUL",
                    ["type"] = 20,
                },
                [3] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 399,
                    },
                    ["id"] = 1591,
                    ["name"] = "AN_MAGTHERIDON",
                    ["type"] = 20,
                },
            },
            ["description"] = "AD_TBC_PHASE_1",
            ["icon"] = "-Inv_Helmet_89",
            ["id"] = 400,
            ["name"] = "AN_TBC_PHASE_1",
            ["points"] = 10,
        },
        [401] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 18,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 21216,
                    },
                    ["id"] = 1592,
                    ["name"] = "AC_KILL_HYDROS",
                    ["type"] = 1,
                },
                [2] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 21217,
                    },
                    ["id"] = 1593,
                    ["name"] = "AC_KILL_LURKER",
                    ["type"] = 1,
                },
                [3] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 21215,
                    },
                    ["id"] = 1594,
                    ["name"] = "AC_KILL_LEOTHERAS",
                    ["type"] = 1,
                },
                [4] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 21214,
                    },
                    ["id"] = 1595,
                    ["name"] = "AC_KILL_KARATHRESS",
                    ["type"] = 1,
                },
                [5] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 21213,
                    },
                    ["id"] = 1596,
                    ["name"] = "AC_KILL_MOROGRIM",
                    ["type"] = 1,
                },
                [6] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 21212,
                    },
                    ["id"] = 1597,
                    ["name"] = "AC_KILL_VASHJ",
                    ["type"] = 1,
                },
            },
            ["description"] = "AD_SSC",
            ["icon"] = "achievement_boss_ladyvashj",
            ["id"] = 401,
            ["name"] = "AN_SSC",
            ["points"] = 10,
        },
        [402] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 18,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 19514,
                    },
                    ["id"] = 1598,
                    ["name"] = "AC_KILL_ALAR",
                    ["type"] = 1,
                },
                [2] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 19516,
                    },
                    ["id"] = 1599,
                    ["name"] = "AC_KILL_VOID_REAVER",
                    ["type"] = 1,
                },
                [3] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 18805,
                    },
                    ["id"] = 1600,
                    ["name"] = "AC_KILL_SOLARIAN",
                    ["type"] = 1,
                },
                [4] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 19622,
                    },
                    ["id"] = 1601,
                    ["name"] = "AC_KILL_KAELTHAS",
                    ["type"] = 1,
                },
            },
            ["description"] = "AD_TK",
            ["icon"] = "achievement_character_bloodelf_male",
            ["id"] = 402,
            ["name"] = "AN_TK",
            ["points"] = 10,
        },
        [403] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 16,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 401,
                    },
                    ["id"] = 1602,
                    ["name"] = "AN_SSC",
                    ["type"] = 20,
                },
                [2] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 402,
                    },
                    ["id"] = 1603,
                    ["name"] = "AN_TK",
                    ["type"] = 20,
                },
            },
            ["description"] = "AD_TBC_PHASE_2",
            ["icon"] = "-Inv_Helmet_90",
            ["id"] = 403,
            ["name"] = "AN_TBC_PHASE_2",
            ["points"] = 10,
        },
        [404] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 18,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 17968,
                    },
                    ["id"] = 1604,
                    ["name"] = "",
                    ["type"] = 1,
                },
            },
            ["description"] = "AD_HYJAL",
            ["icon"] = "achievement_boss_princemalchezaar_02",
            ["id"] = 404,
            ["name"] = "AN_HYJAL",
            ["points"] = 10,
        },
        [405] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 18,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 22887,
                    },
                    ["id"] = 1605,
                    ["name"] = "AC_KILL_NAJENTUS",
                    ["type"] = 1,
                },
                [2] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 22898,
                    },
                    ["id"] = 1606,
                    ["name"] = "AC_KILL_SUPREMUS",
                    ["type"] = 1,
                },
            },
            ["description"] = "AD_BT_ENTRANCE",
            ["icon"] = "-spell_Fire_BlueImmolation",
            ["id"] = 405,
            ["name"] = "AN_BT_ENTRANCE",
            ["points"] = 10,
        },
        [406] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 18,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 22841,
                    },
                    ["id"] = 1607,
                    ["name"] = "AC_KILL_SHADOW_OF_AKAMA",
                    ["type"] = 1,
                },
                [2] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 22871,
                    },
                    ["id"] = 1608,
                    ["name"] = "AC_KILL_THERON",
                    ["type"] = 1,
                },
                [3] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 22948,
                    },
                    ["id"] = 1609,
                    ["name"] = "AC_KILL_GURTOGG",
                    ["type"] = 1,
                },
                [4] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 23420,
                    },
                    ["id"] = 1610,
                    ["name"] = "AC_KILL_RELIQUARY",
                    ["type"] = 1,
                },
            },
            ["description"] = "AD_BT_SECOND_WING",
            ["icon"] = "-spell_Shadow_ConeOfSilence",
            ["id"] = 406,
            ["name"] = "AN_BT_SECOND_WING",
            ["points"] = 10,
        },
        [407] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 18,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 22947,
                    },
                    ["id"] = 1611,
                    ["name"] = "AC_KILL_MOTHER_SHAHRAZ",
                    ["type"] = 1,
                },
                [2] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 22949,
                    },
                    ["id"] = 1612,
                    ["name"] = "AC_KILL_BT_COUNCIL",
                    ["type"] = 1,
                },
                [3] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 22917,
                    },
                    ["id"] = 1613,
                    ["name"] = "AC_KILL_ILLIDAN",
                    ["type"] = 1,
                },
            },
            ["description"] = "AD_BT_LAST_WING",
            ["icon"] = "-Spell_Shadow_ShadowPower",
            ["id"] = 407,
            ["name"] = "AN_BT_LAST_WING",
            ["points"] = 10,
        },
        [408] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 18,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 405,
                    },
                    ["id"] = 1614,
                    ["name"] = "AN_BT_ENTRANCE",
                    ["type"] = 20,
                },
                [2] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 406,
                    },
                    ["id"] = 1615,
                    ["name"] = "AN_BT_SECOND_WING",
                    ["type"] = 20,
                },
                [3] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 407,
                    },
                    ["id"] = 1616,
                    ["name"] = "AN_BT_LAST_WING",
                    ["type"] = 20,
                },
            },
            ["description"] = "AD_BLACK_TEMPLE",
            ["icon"] = "achievement_boss_illidan",
            ["id"] = 408,
            ["name"] = "AN_BLACK_TEMPLE",
            ["points"] = 10,
            ["rewardText"] = "TITLE_BUILTIN_CONQUEROR_BLACK_TEMPLE_LABEL",
        },
        [409] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 16,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 404,
                    },
                    ["id"] = 1617,
                    ["name"] = "AN_HYJAL",
                    ["type"] = 20,
                },
                [2] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 408,
                    },
                    ["id"] = 1618,
                    ["name"] = "AN_BLACK_TEMPLE",
                    ["type"] = 20,
                },
            },
            ["description"] = "AD_TBC_PHASE_3",
            ["icon"] = "-Inv_Helmet_103",
            ["id"] = 409,
            ["name"] = "AN_TBC_PHASE_3",
            ["points"] = 10,
        },
        [410] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 18,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 23863,
                    },
                    ["id"] = 1619,
                    ["name"] = "",
                    ["type"] = 1,
                },
            },
            ["description"] = "AD_ZULAMAN",
            ["icon"] = "achievement_boss_zuljin",
            ["id"] = 410,
            ["name"] = "AN_ZULAMAN",
            ["points"] = 10,
        },
        [411] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 16,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 410,
                    },
                    ["id"] = 1620,
                    ["name"] = "AN_ZULAMAN",
                    ["type"] = 20,
                },
            },
            ["description"] = "AD_TBC_PHASE_4",
            ["icon"] = "-inv_helmet_112",
            ["id"] = 411,
            ["name"] = "AN_TBC_PHASE_4",
            ["points"] = 10,
        },
        [412] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 18,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 25315,
                    },
                    ["id"] = 1621,
                    ["name"] = "",
                    ["type"] = 1,
                },
            },
            ["description"] = "AD_SUNWELL",
            ["icon"] = "achievement_boss_kiljaedan",
            ["id"] = 412,
            ["name"] = "AN_SUNWELL",
            ["points"] = 10,
        },
        [413] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 16,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 412,
                    },
                    ["id"] = 1622,
                    ["name"] = "AN_SUNWELL",
                    ["type"] = 20,
                },
            },
            ["description"] = "AD_TBC_PHASE_5",
            ["icon"] = "-inv_helmet_92",
            ["id"] = 413,
            ["name"] = "AN_TBC_PHASE_5",
            ["points"] = 10,
        },
        [418] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 19,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 375,
                    },
                    ["id"] = 1627,
                    ["name"] = "",
                    ["type"] = 13,
                },
            },
            ["description"] = "AD_PROFS_ONE_OUTLAND",
            ["icon"] = "-Inv_Misc_Note_01",
            ["id"] = 418,
            ["name"] = "AN_PROFS_ONE_OUTLAND",
            ["points"] = 10,
            ["previousID"] = 417,
        },
        [420] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 19,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 375,
                    },
                    ["id"] = 1629,
                    ["name"] = "AC_PROFS_TWO_OUTLAND",
                    ["quantity"] = 2,
                    ["type"] = 13,
                },
            },
            ["description"] = "AD_PROFS_TWO_OUTLAND",
            ["icon"] = "-ability_repair",
            ["id"] = 420,
            ["name"] = "AN_PROFS_TWO_OUTLAND",
            ["points"] = 10,
            ["previousID"] = 419,
        },
        [434] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 22,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 1,
                        [2] = 375,
                    },
                    ["id"] = 1648,
                    ["name"] = "",
                    ["type"] = 12,
                },
            },
            ["description"] = "AD_FIRST_AID_OUTLAND_MASTER",
            ["icon"] = "-spell_holy_sealofsacrifice",
            ["id"] = 434,
            ["name"] = "AN_FIRST_AID_OUTLAND_MASTER",
            ["points"] = 10,
            ["previousID"] = 424,
        },
        [435] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 21,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 2,
                        [2] = 375,
                    },
                    ["id"] = 1650,
                    ["name"] = "",
                    ["type"] = 12,
                },
            },
            ["description"] = "AD_FISHING_OUTLAND_MASTER",
            ["icon"] = "-trade_fishing",
            ["id"] = 435,
            ["name"] = "AN_FISHING_OUTLAND_MASTER",
            ["points"] = 10,
            ["previousID"] = 428,
        },
        [436] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 20,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3,
                        [2] = 375,
                    },
                    ["id"] = 1652,
                    ["name"] = "",
                    ["type"] = 12,
                },
            },
            ["description"] = "AD_COOKING_OUTLAND_MASTER",
            ["icon"] = "-inv_misc_food_15",
            ["id"] = 436,
            ["name"] = "AN_COOKING_OUTLAND_MASTER",
            ["points"] = 10,
            ["previousID"] = 432,
        },
        [437] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 19,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 434,
                    },
                    ["id"] = 1654,
                    ["name"] = "AN_FIRST_AID_OUTLAND_MASTER",
                    ["type"] = 20,
                },
                [2] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 435,
                    },
                    ["id"] = 1655,
                    ["name"] = "AN_FISHING_OUTLAND_MASTER",
                    ["type"] = 20,
                },
                [3] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 436,
                    },
                    ["id"] = 1656,
                    ["name"] = "AN_COOKING_OUTLAND_MASTER",
                    ["type"] = 20,
                },
            },
            ["description"] = "AD_PROFS_SECONDARY_OUTLAND",
            ["icon"] = "-Inv_Misc_Note_02",
            ["id"] = 437,
            ["name"] = "AN_PROFS_SECONDARY_OUTLAND",
            ["points"] = 10,
            ["previousID"] = 433,
        },
        [439] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 19,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 420,
                    },
                    ["id"] = 1659,
                    ["name"] = "AN_PROFS_TWO_OUTLAND",
                    ["type"] = 20,
                },
                [2] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 437,
                    },
                    ["id"] = 1660,
                    ["name"] = "AN_PROFS_SECONDARY_OUTLAND",
                    ["type"] = 20,
                },
            },
            ["description"] = "AD_PROFS_FIVE",
            ["icon"] = "-Spell_Magic_GreaterBlessingOfKings",
            ["id"] = 439,
            ["name"] = "AN_PROFS_FIVE_OUTLAND",
            ["points"] = 10,
            ["previousID"] = 438,
        },
        [442] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 22,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 21991,
                    },
                    ["id"] = 1663,
                    ["name"] = "AC_STOCKING_UP_OUTLAND",
                    ["quantity"] = 100,
                    ["type"] = 15,
                },
            },
            ["description"] = "AD_STOCKING_UP_OUTLAND",
            ["icon"] = "-Inv_Misc_Bandage_Netherweave_Heavy",
            ["id"] = 442,
            ["name"] = "AN_STOCKING_UP_OUTLAND",
            ["nextID"] = 443,
            ["points"] = 10,
        },
        [443] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 22,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 21991,
                    },
                    ["id"] = 1664,
                    ["name"] = "AC_STOCKING_UP_2_OUTLAND",
                    ["quantity"] = 500,
                    ["type"] = 15,
                },
            },
            ["description"] = "AD_STOCKING_UP_2_OUTLAND",
            ["icon"] = "-Inv_Misc_Bandage_Netherweave_Heavy",
            ["id"] = 443,
            ["name"] = "AN_STOCKING_UP_2_OUTLAND",
            ["points"] = 10,
            ["previousID"] = 442,
        },
        [456] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 21,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 27388,
                    },
                    ["id"] = 1737,
                    ["name"] = "",
                    ["type"] = 28,
                },
            },
            ["description"] = "AD_MR_PINCHY",
            ["icon"] = "-Inv_Misc_Fish_14",
            ["id"] = 456,
            ["name"] = "AN_MR_PINCHY",
            ["points"] = 10,
        },
        [467] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 20,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 33924,
                    },
                    ["id"] = 1780,
                    ["name"] = "",
                    ["type"] = 15,
                },
            },
            ["description"] = "AD_COOKING_CAKE",
            ["icon"] = "-inv_misc_celebrationcake_01",
            ["id"] = 467,
            ["name"] = "AN_COOKING_CAKE",
            ["points"] = 10,
        },
        [485] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 25,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 947,
                        [2] = 8,
                    },
                    ["id"] = 2008,
                    ["name"] = "FACTION_947",
                    ["type"] = 16,
                },
                [2] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 942,
                        [2] = 8,
                    },
                    ["id"] = 2009,
                    ["name"] = "FACTION_942",
                    ["type"] = 16,
                },
                [3] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 1011,
                        [2] = 8,
                    },
                    ["id"] = 2010,
                    ["name"] = "FACTION_1011",
                    ["type"] = 16,
                },
                [4] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 989,
                        [2] = 8,
                    },
                    ["id"] = 2011,
                    ["name"] = "FACTION_989",
                    ["type"] = 16,
                },
                [5] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 935,
                        [2] = 8,
                    },
                    ["id"] = 2012,
                    ["name"] = "FACTION_935",
                    ["type"] = 16,
                },
            },
            ["description"] = "AD_TBC_DUNGEON_REPUTATIONS",
            ["faction"] = true,
            ["icon"] = "-Spell_Fire_FelfireWard",
            ["id"] = 485,
            ["name"] = "AN_TBC_DUNGEON_REPUTATIONS",
            ["points"] = 20,
        },
        [486] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 25,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 946,
                        [2] = 8,
                    },
                    ["id"] = 2013,
                    ["name"] = "FACTION_946",
                    ["type"] = 16,
                },
                [2] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 942,
                        [2] = 8,
                    },
                    ["id"] = 2014,
                    ["name"] = "FACTION_942",
                    ["type"] = 16,
                },
                [3] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 1011,
                        [2] = 8,
                    },
                    ["id"] = 2015,
                    ["name"] = "FACTION_1011",
                    ["type"] = 16,
                },
                [4] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 989,
                        [2] = 8,
                    },
                    ["id"] = 2016,
                    ["name"] = "FACTION_989",
                    ["type"] = 16,
                },
                [5] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 935,
                        [2] = 8,
                    },
                    ["id"] = 2017,
                    ["name"] = "FACTION_935",
                    ["type"] = 16,
                },
            },
            ["description"] = "AD_TBC_DUNGEON_REPUTATIONS",
            ["faction"] = false,
            ["icon"] = "-Spell_Fire_FelfireWard",
            ["id"] = 486,
            ["name"] = "AN_TBC_DUNGEON_REPUTATIONS",
            ["points"] = 20,
        },
        [487] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 25,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 932,
                                [2] = 8,
                            },
                            ["id"] = 2018,
                            ["name"] = "",
                            ["type"] = 16,
                        },
                        [2] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 934,
                                [2] = 8,
                            },
                            ["id"] = 2019,
                            ["name"] = "",
                            ["type"] = 16,
                        },
                    },
                    ["id"] = 2020,
                    ["name"] = "",
                    ["type"] = 39,
                },
            },
            ["description"] = "AD_SHATTRATH_REP",
            ["icon"] = "-Spell_Arcane_PortalShattrath",
            ["id"] = 487,
            ["name"] = "AN_SHATTRATH_REP",
            ["points"] = 10,
        },
        [488] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 25,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 609,
                        [2] = 8,
                    },
                    ["id"] = 2021,
                    ["name"] = "FACTION_609",
                    ["type"] = 16,
                },
                [2] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 942,
                        [2] = 8,
                    },
                    ["id"] = 2022,
                    ["name"] = "FACTION_942",
                    ["type"] = 16,
                },
            },
            ["description"] = "AD_CENARION_CIRCLE",
            ["icon"] = "-ability_racial_ultravision",
            ["id"] = 488,
            ["name"] = "AN_CENARION_CIRCLE",
            ["points"] = 20,
        },
        [489] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 25,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 1038,
                        [2] = 8,
                    },
                    ["id"] = 2023,
                    ["name"] = "",
                    ["type"] = 16,
                },
            },
            ["description"] = "AD_OGRILA",
            ["icon"] = "-Inv_Misc_Apexis_Crystal",
            ["id"] = 489,
            ["name"] = "AN_OGRILA",
            ["points"] = 10,
        },
        [490] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 25,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 970,
                        [2] = 8,
                    },
                    ["id"] = 2024,
                    ["name"] = "",
                    ["type"] = 16,
                },
            },
            ["description"] = "AD_SPOREGGAR",
            ["icon"] = "-Inv_Mushroom_11",
            ["id"] = 490,
            ["name"] = "AN_SPOREGGAR",
            ["points"] = 10,
        },
        [491] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 25,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 933,
                        [2] = 8,
                    },
                    ["id"] = 2025,
                    ["name"] = "",
                    ["type"] = 16,
                },
            },
            ["description"] = "AD_CONSORTIUM",
            ["icon"] = "-Inv_Enchant_ShardPrismaticLarge",
            ["id"] = 491,
            ["name"] = "AN_CONSORTIUM",
            ["points"] = 10,
        },
        [492] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 25,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 941,
                        [2] = 8,
                    },
                    ["id"] = 2026,
                    ["name"] = "",
                    ["type"] = 16,
                },
            },
            ["description"] = "AD_MAGHAR",
            ["faction"] = true,
            ["icon"] = "-Inv_Misc_Foot_Centaur",
            ["id"] = 492,
            ["name"] = "AN_MAGHAR",
            ["points"] = 10,
        },
        [493] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 25,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 978,
                        [2] = 8,
                    },
                    ["id"] = 2027,
                    ["name"] = "",
                    ["type"] = 16,
                },
            },
            ["description"] = "AD_KURENAI",
            ["faction"] = false,
            ["icon"] = "-Inv_Misc_Foot_Centaur",
            ["id"] = 493,
            ["name"] = "AN_KURENAI",
            ["points"] = 10,
        },
        [494] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 25,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 1015,
                        [2] = 8,
                    },
                    ["id"] = 2028,
                    ["name"] = "",
                    ["type"] = 16,
                },
            },
            ["description"] = "AD_NETHERWINGS",
            ["icon"] = "-Ability_Mount_NetherdrakePurple",
            ["id"] = 494,
            ["name"] = "AN_NETHERWINGS",
            ["points"] = 10,
        },
        [495] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 25,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 11071,
                    },
                    ["id"] = 2029,
                    ["name"] = "",
                    ["type"] = 3,
                },
            },
            ["description"] = "AD_SKYSHATTERED",
            ["icon"] = "-Ability_Mount_NetherdrakePurple",
            ["id"] = 495,
            ["name"] = "AN_SKYSHATTERED",
            ["points"] = 10,
        },
        [496] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 25,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 967,
                        [2] = 8,
                    },
                    ["id"] = 2030,
                    ["name"] = "",
                    ["type"] = 16,
                },
            },
            ["description"] = "AD_AMETHYST_EYE",
            ["icon"] = "-Spell_Holy_Mindsooth",
            ["id"] = 496,
            ["name"] = "AN_AMETHYST_EYE",
            ["points"] = 10,
        },
        [497] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 25,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 990,
                        [2] = 8,
                    },
                    ["id"] = 2031,
                    ["name"] = "",
                    ["type"] = 16,
                },
            },
            ["description"] = "AD_SCALE_OF_THE_SANDS",
            ["icon"] = "-Inv_Enchant_DustIllusion",
            ["id"] = 497,
            ["name"] = "AN_SCALE_OF_THE_SANDS",
            ["points"] = 10,
        },
        [498] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 25,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 1012,
                        [2] = 8,
                    },
                    ["id"] = 2032,
                    ["name"] = "",
                    ["type"] = 16,
                },
            },
            ["description"] = "AD_ASHTONGUE_DEATHSWORN",
            ["icon"] = "achievement_reputation_ashtonguedeathsworn",
            ["id"] = 498,
            ["name"] = "AN_ASHTONGUE_DEATHSWORN",
            ["points"] = 10,
        },
        [499] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 25,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 1077,
                        [2] = 8,
                    },
                    ["id"] = 2033,
                    ["name"] = "",
                    ["type"] = 16,
                },
            },
            ["description"] = "AD_SHATTERED_SUN",
            ["icon"] = "-Inv_Shield_48",
            ["id"] = 499,
            ["name"] = "AN_SHATTERED_SUN",
            ["points"] = 10,
        },
        [509] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 35,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 10259,
                    },
                    ["id"] = 2052,
                    ["name"] = "",
                    ["type"] = 3,
                },
            },
            ["description"] = "AD_PREPATCH_QUEST",
            ["icon"] = "-inv_shirt_guildtabard_01",
            ["id"] = 509,
            ["name"] = "AN_PREPATCH_QUEST",
            ["points"] = 0,
        },
        [510] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 35,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 32837,
                    },
                    ["id"] = 2053,
                    ["name"] = "AC_OBTAIN_MAINHAND_AZZINOTH",
                    ["type"] = 5,
                },
                [2] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 32838,
                    },
                    ["id"] = 2054,
                    ["name"] = "AC_OBTAIN_OFFHAND_AZZINOTH",
                    ["type"] = 5,
                },
            },
            ["description"] = "AD_AZZINOTH",
            ["icon"] = "-Inv_Weapon_Glave_01",
            ["id"] = 510,
            ["name"] = "AN_AZZINOTH",
            ["points"] = 0,
        },
        [511] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 35,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 34334,
                    },
                    ["id"] = 2055,
                    ["name"] = "",
                    ["type"] = 5,
                },
            },
            ["description"] = "AD_THORIDAL",
            ["icon"] = "-inv_weapon_bow_39",
            ["id"] = 511,
            ["name"] = "AN_THORIDAL",
            ["points"] = 0,
        },
        [512] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 35,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 33809,
                    },
                    ["id"] = 2056,
                    ["name"] = "",
                    ["type"] = 5,
                },
            },
            ["description"] = "AD_BEAR_MOUNT",
            ["icon"] = "-ability_druid_challangingroar",
            ["id"] = 512,
            ["name"] = "AN_BEAR_MOUNT",
            ["points"] = 0,
        },
        [513] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 35,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 35513,
                    },
                    ["id"] = 2057,
                    ["name"] = "",
                    ["type"] = 5,
                },
            },
            ["description"] = "AD_HAWK_MOUNT",
            ["icon"] = "-ability_mount_cockatricemountelite_green",
            ["id"] = 513,
            ["name"] = "AN_HAWK_MOUNT",
            ["points"] = 0,
        },
        [514] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 35,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 32458,
                    },
                    ["id"] = 2058,
                    ["name"] = "",
                    ["type"] = 5,
                },
            },
            ["description"] = "AD_ALAR_MOUNT",
            ["icon"] = "-inv_misc_summerfest_brazierorange",
            ["id"] = 514,
            ["name"] = "AN_ALAR_MOUNT",
            ["points"] = 0,
        },
        [515] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 35,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 17968,
                    },
                    ["id"] = 2059,
                    ["name"] = "AC_KILL_ARCHIMONDE",
                    ["type"] = 45,
                },
                [2] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 22917,
                    },
                    ["id"] = 2060,
                    ["name"] = "AC_KILL_ILLIDAN",
                    ["type"] = 45,
                },
            },
            ["description"] = "AD_P3_FIRST_WEEK",
            ["icon"] = "-Inv_Helmet_96",
            ["id"] = 515,
            ["name"] = "AN_P3_FIRST_WEEK",
            ["points"] = 0,
            ["rewardText"] = "TITLE_BUILTIN_CONQUEROR_OF_OUTLAND_LABEL",
        },
        [522] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 35,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 11001,
                    },
                    ["id"] = 2061,
                    ["name"] = "",
                    ["type"] = 3,
                },
            },
            ["description"] = "AD_FLIGHFORM",
            ["icon"] = "-ability_druid_flightform",
            ["id"] = 522,
            ["name"] = "AN_FLIGHFORM",
            ["points"] = 0,
        },
        [526] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 5,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 9852,
                    },
                    ["id"] = 285,
                    ["name"] = "",
                    ["type"] = 3,
                },
            },
            ["description"] = "AD_HEMET_QUESTS_NAGRAND",
            ["icon"] = "-ability_mount_ridingelekk",
            ["id"] = 526,
            ["name"] = "AN_HEMET_QUESTS_NAGRAND",
            ["points"] = 10,
        },
        [527] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 35,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 37012,
                    },
                    ["id"] = 2062,
                    ["name"] = "",
                    ["type"] = 5,
                },
            },
            ["description"] = "AD_HORSEMAN_MOUNT",
            ["icon"] = "-inv_belt_12",
            ["id"] = 527,
            ["name"] = "AN_HORSEMAN_MOUNT",
            ["points"] = 0,
        },
        [528] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 35,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 932,
                        [2] = 8,
                    },
                    ["id"] = 2063,
                    ["name"] = "AN_HERO_ALDOR",
                    ["type"] = 16,
                },
                [2] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 934,
                        [2] = 8,
                    },
                    ["id"] = 2064,
                    ["name"] = "AN_HERO_SCRYER",
                    ["type"] = 16,
                },
            },
            ["description"] = "AD_HERO_SHATTRATH",
            ["icon"] = "-spell_arcane_teleportshattrath",
            ["id"] = 528,
            ["name"] = "AN_HERO_SHATTRATH",
            ["points"] = 0,
        },
        [529] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 35,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 10901,
                    },
                    ["id"] = 2065,
                    ["name"] = "",
                    ["type"] = 3,
                },
                [2] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 10888,
                    },
                    ["id"] = 2066,
                    ["name"] = "",
                    ["type"] = 3,
                },
            },
            ["description"] = "AD_CHAMPION_NAARU",
            ["icon"] = "-inv_mace_51",
            ["id"] = 529,
            ["name"] = "AN_CHAMPION_NAARU",
            ["points"] = 0,
            ["rewardText"] = "TITLE_BUILTIN_CHAMPION_OF_THE_NAARU_LABEL",
        },
        [530] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 35,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 10445,
                    },
                    ["id"] = 5300,
                    ["name"] = "",
                    ["type"] = 3,
                },
                [2] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 10985,
                    },
                    ["id"] = 5301,
                    ["name"] = "",
                    ["type"] = 3,
                },
            },
            ["description"] = "AD_HAND_ADAL",
            ["icon"] = "-inv_mace_25",
            ["id"] = 530,
            ["name"] = "AN_HAND_ADAL",
            ["points"] = 0,
            ["rewardText"] = "TITLE_BUILTIN_HAND_OF_ADAL_LABEL",
        },
        [547] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 21,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 35285,
                    },
                    ["id"] = 1738,
                    ["name"] = {
                        ["itemID"] = 35285,
                    },
                    ["type"] = 28,
                },
                [2] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 27422,
                    },
                    ["id"] = 1739,
                    ["name"] = {
                        ["itemID"] = 27422,
                    },
                    ["type"] = 28,
                },
                [3] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 27439,
                    },
                    ["id"] = 1740,
                    ["name"] = {
                        ["itemID"] = 27439,
                    },
                    ["type"] = 28,
                },
                [4] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 27438,
                    },
                    ["id"] = 1741,
                    ["name"] = {
                        ["itemID"] = 27438,
                    },
                    ["type"] = 28,
                },
                [5] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 27437,
                    },
                    ["id"] = 1742,
                    ["name"] = {
                        ["itemID"] = 27437,
                    },
                    ["type"] = 28,
                },
                [6] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 27429,
                    },
                    ["id"] = 1743,
                    ["name"] = {
                        ["itemID"] = 27429,
                    },
                    ["type"] = 28,
                },
                [7] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 27425,
                    },
                    ["id"] = 1744,
                    ["name"] = {
                        ["itemID"] = 27425,
                    },
                    ["type"] = 28,
                },
                [8] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 27435,
                    },
                    ["id"] = 1745,
                    ["name"] = {
                        ["itemID"] = 27435,
                    },
                    ["type"] = 28,
                },
                [9] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 33824,
                    },
                    ["id"] = 1746,
                    ["name"] = {
                        ["itemID"] = 33824,
                    },
                    ["type"] = 28,
                },
                [10] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 33823,
                    },
                    ["id"] = 1747,
                    ["name"] = {
                        ["itemID"] = 33823,
                    },
                    ["type"] = 28,
                },
                [11] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 35286,
                    },
                    ["id"] = 1748,
                    ["name"] = {
                        ["itemID"] = 35286,
                    },
                    ["type"] = 28,
                },
            },
            ["description"] = "AD_FISHING_OUTLAND_COLLECTION",
            ["icon"] = "-Inv_Misc_Fish_37",
            ["id"] = 547,
            ["name"] = "AN_FISHING_OUTLAND_COLLECTION",
            ["points"] = 10,
        },
        [548] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 21,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 34109,
                    },
                    ["id"] = 1749,
                    ["name"] = "",
                    ["type"] = 5,
                },
            },
            ["description"] = "AD_FISHING_BOOK",
            ["icon"] = "achievement_profession_fishing_findfish",
            ["id"] = 548,
            ["name"] = "AN_FISHING_BOOK",
            ["points"] = 10,
        },
        [549] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 21,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 11665,
                    },
                    ["id"] = 1750,
                    ["name"] = "AC_TBC_DAILY_FISH1",
                    ["type"] = 49,
                },
                [2] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 11666,
                    },
                    ["id"] = 1751,
                    ["name"] = "AC_TBC_DAILY_FISH2",
                    ["type"] = 49,
                },
                [3] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 11669,
                    },
                    ["id"] = 1752,
                    ["name"] = "AC_TBC_DAILY_FISH3",
                    ["type"] = 49,
                },
                [4] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 11667,
                    },
                    ["id"] = 1753,
                    ["name"] = "AC_TBC_DAILY_FISH4",
                    ["type"] = 49,
                },
                [5] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 11668,
                    },
                    ["id"] = 1754,
                    ["name"] = "AC_TBC_DAILY_FISH5",
                    ["type"] = 49,
                },
            },
            ["description"] = "AD_TBC_DAILY_FISH",
            ["icon"] = "achievement_profession_fishing_oldmanbarlowned",
            ["id"] = 549,
            ["name"] = "AN_TBC_DAILY_FISH",
            ["points"] = 10,
        },
        [550] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 21,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 34484,
                    },
                    ["id"] = 1755,
                    ["name"] = "",
                    ["type"] = 28,
                },
            },
            ["description"] = "AD_OLD_IRONJAW",
            ["icon"] = "-inv_misc_fish_31",
            ["id"] = 550,
            ["name"] = "AN_OLD_IRONJAW",
            ["points"] = 10,
        },
        [551] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 21,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 34486,
                    },
                    ["id"] = 1756,
                    ["name"] = "",
                    ["type"] = 28,
                },
            },
            ["description"] = "AD_OLD_CRAFTY",
            ["icon"] = "-inv_misc_fish_35",
            ["id"] = 551,
            ["name"] = "AN_OLD_CRAFTY",
            ["points"] = 10,
        },
        [554] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 21,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 548,
                    },
                    ["id"] = 1759,
                    ["name"] = "AN_FISHING_BOOK",
                    ["type"] = 20,
                },
                [2] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 521,
                    },
                    ["id"] = 1760,
                    ["name"] = {
                        ["args"] = {
                            [1] = 1000,
                        },
                        ["key"] = "AN_FISHING_COUNT",
                    },
                    ["type"] = 20,
                },
                [3] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 549,
                    },
                    ["id"] = 1761,
                    ["name"] = "AN_TBC_DAILY_FISH",
                    ["type"] = 20,
                },
                [4] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 456,
                    },
                    ["id"] = 1762,
                    ["name"] = "AN_MR_PINCHY",
                    ["type"] = 20,
                },
                [5] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 435,
                    },
                    ["id"] = 1763,
                    ["name"] = "AN_FISHING_OUTLAND_MASTER",
                    ["type"] = 20,
                },
                [6] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 444,
                    },
                    ["id"] = 1764,
                    ["name"] = "AN_BOOTY_BAY_CONTEST",
                    ["type"] = 20,
                },
                [7] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 552,
                    },
                    ["id"] = 1765,
                    ["name"] = "AN_FISHING_DIPLOMAT",
                    ["type"] = 20,
                },
            },
            ["description"] = "AD_ACCOMPLISHED_ANGLER",
            ["icon"] = "-trade_fishing",
            ["id"] = 554,
            ["name"] = "AN_ACCOMPLISHED_ANGLER",
            ["points"] = 10,
        },
        [555] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 20,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 34832,
                    },
                    ["id"] = 1781,
                    ["name"] = "",
                    ["type"] = 15,
                },
            },
            ["description"] = "AD_CAPTAIN_RUMSEY",
            ["icon"] = "-inv_drink_03",
            ["id"] = 555,
            ["name"] = "AN_CAPTAIN_RUMSEY",
            ["points"] = 10,
        },
        [556] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 20,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 11380,
                    },
                    ["id"] = 1782,
                    ["name"] = "AC_TBC_DAILY_COOKING1",
                    ["type"] = 49,
                },
                [2] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 11381,
                    },
                    ["id"] = 1783,
                    ["name"] = "AC_TBC_DAILY_COOKING2",
                    ["type"] = 49,
                },
                [3] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 11377,
                    },
                    ["id"] = 1784,
                    ["name"] = "AC_TBC_DAILY_COOKING3",
                    ["type"] = 49,
                },
                [4] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 11379,
                    },
                    ["id"] = 1785,
                    ["name"] = "AC_TBC_DAILY_COOKING4",
                    ["type"] = 49,
                },
            },
            ["description"] = "AD_TBC_DAILY_COOKING",
            ["icon"] = "-inv_misc_cauldron_arcane",
            ["id"] = 556,
            ["name"] = "AN_TBC_DAILY_COOKING",
            ["points"] = 10,
        },
        [557] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 20,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 27663,
                    },
                    ["id"] = 1786,
                    ["name"] = {
                        ["itemID"] = 27663,
                    },
                    ["type"] = 15,
                },
                [2] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 33053,
                    },
                    ["id"] = 1787,
                    ["name"] = {
                        ["itemID"] = 33053,
                    },
                    ["type"] = 15,
                },
                [3] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 27665,
                    },
                    ["id"] = 1788,
                    ["name"] = {
                        ["itemID"] = 27665,
                    },
                    ["type"] = 15,
                },
                [4] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 27655,
                    },
                    ["id"] = 1789,
                    ["name"] = {
                        ["itemID"] = 27655,
                    },
                    ["type"] = 15,
                },
                [5] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 33048,
                    },
                    ["id"] = 1790,
                    ["name"] = {
                        ["itemID"] = 33048,
                    },
                    ["type"] = 15,
                },
                [6] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 27667,
                    },
                    ["id"] = 1791,
                    ["name"] = {
                        ["itemID"] = 27667,
                    },
                    ["type"] = 15,
                },
                [7] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 33052,
                    },
                    ["id"] = 1792,
                    ["name"] = {
                        ["itemID"] = 33052,
                    },
                    ["type"] = 15,
                },
                [8] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 31673,
                    },
                    ["id"] = 1793,
                    ["name"] = {
                        ["itemID"] = 31673,
                    },
                    ["type"] = 15,
                },
                [9] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 27660,
                    },
                    ["id"] = 1794,
                    ["name"] = {
                        ["itemID"] = 27660,
                    },
                    ["type"] = 15,
                },
                [10] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 27658,
                    },
                    ["id"] = 1795,
                    ["name"] = {
                        ["itemID"] = 27658,
                    },
                    ["type"] = 15,
                },
                [11] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 33867,
                    },
                    ["id"] = 1796,
                    ["name"] = {
                        ["itemID"] = 33867,
                    },
                    ["type"] = 15,
                },
                [12] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 30155,
                    },
                    ["id"] = 1797,
                    ["name"] = {
                        ["itemID"] = 30155,
                    },
                    ["type"] = 15,
                },
                [13] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 27664,
                    },
                    ["id"] = 1798,
                    ["name"] = {
                        ["itemID"] = 27664,
                    },
                    ["type"] = 15,
                },
                [14] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 31672,
                    },
                    ["id"] = 1799,
                    ["name"] = {
                        ["itemID"] = 31672,
                    },
                    ["type"] = 15,
                },
                [15] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 33866,
                    },
                    ["id"] = 1800,
                    ["name"] = {
                        ["itemID"] = 33866,
                    },
                    ["type"] = 15,
                },
                [16] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 27662,
                    },
                    ["id"] = 1801,
                    ["name"] = {
                        ["itemID"] = 27662,
                    },
                    ["type"] = 15,
                },
                [17] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 33924,
                    },
                    ["id"] = 1802,
                    ["name"] = {
                        ["itemID"] = 33924,
                    },
                    ["type"] = 15,
                },
                [18] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 27666,
                    },
                    ["id"] = 1803,
                    ["name"] = {
                        ["itemID"] = 27666,
                    },
                    ["type"] = 15,
                },
                [19] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 33874,
                    },
                    ["id"] = 1804,
                    ["name"] = {
                        ["itemID"] = 33874,
                    },
                    ["type"] = 15,
                },
                [20] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 27659,
                    },
                    ["id"] = 1805,
                    ["name"] = {
                        ["itemID"] = 27659,
                    },
                    ["type"] = 15,
                },
                [21] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 27651,
                    },
                    ["id"] = 1806,
                    ["name"] = {
                        ["itemID"] = 27651,
                    },
                    ["type"] = 15,
                },
                [22] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 27661,
                    },
                    ["id"] = 1807,
                    ["name"] = {
                        ["itemID"] = 27661,
                    },
                    ["type"] = 15,
                },
                [23] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 27656,
                    },
                    ["id"] = 1808,
                    ["name"] = {
                        ["itemID"] = 27656,
                    },
                    ["type"] = 15,
                },
                [24] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 33825,
                    },
                    ["id"] = 1809,
                    ["name"] = {
                        ["itemID"] = 33825,
                    },
                    ["type"] = 15,
                },
                [25] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 33872,
                    },
                    ["id"] = 1810,
                    ["name"] = {
                        ["itemID"] = 33872,
                    },
                    ["type"] = 15,
                },
                [26] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 27657,
                    },
                    ["id"] = 1811,
                    ["name"] = {
                        ["itemID"] = 27657,
                    },
                    ["type"] = 15,
                },
            },
            ["description"] = "AD_TBC_COOKING_RECIPES",
            ["icon"] = "-inv_misc_food_84_roastclefthoof",
            ["id"] = 557,
            ["name"] = "AN_TBC_COOKING_RECIPES",
            ["points"] = 10,
        },
        [558] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 20,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 461,
                    },
                    ["id"] = 1812,
                    ["name"] = "AN_COOKING_RECIPES_75",
                    ["type"] = 20,
                },
                [2] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 436,
                    },
                    ["id"] = 1813,
                    ["name"] = "AN_COOKING_OUTLAND_MASTER",
                    ["type"] = 20,
                },
                [3] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 467,
                    },
                    ["id"] = 1814,
                    ["name"] = "AN_COOKING_CAKE",
                    ["type"] = 20,
                },
                [4] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 555,
                    },
                    ["id"] = 1815,
                    ["name"] = "AN_CAPTAIN_RUMSEY",
                    ["type"] = 20,
                },
                [5] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 556,
                    },
                    ["id"] = 1816,
                    ["name"] = "AN_TBC_DAILY_COOKING",
                    ["type"] = 20,
                },
                [6] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 557,
                    },
                    ["id"] = 1817,
                    ["name"] = "AN_TBC_COOKING_RECIPES",
                    ["type"] = 20,
                },
            },
            ["description"] = "AD_HAIL_CHEF",
            ["icon"] = "achievement_profession_chefhat",
            ["id"] = 558,
            ["name"] = "AN_HAIL_CHEF",
            ["points"] = 10,
        },
        [559] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 25,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 1031,
                        [2] = 8,
                    },
                    ["id"] = 2034,
                    ["name"] = "",
                    ["type"] = 16,
                },
            },
            ["description"] = "AD_SKYGUARD",
            ["icon"] = "-ability_hunter_pet_netherray",
            ["id"] = 559,
            ["name"] = "AN_SKYGUARD",
            ["points"] = 10,
        },
        [560] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 25,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 33999,
                    },
                    ["id"] = 2035,
                    ["name"] = "",
                    ["type"] = 5,
                },
            },
            ["description"] = "AD_HIPPOGRYPH",
            ["icon"] = "-ability_mount_warhippogryph",
            ["id"] = 560,
            ["name"] = "AN_HIPPOGRYPH",
            ["points"] = 10,
        },
        [564] = {
            ["selectors"] = {
                ["A:DRUID"] = 2,
                ["A:HUNTER"] = 2,
                ["A:MAGE"] = 2,
                ["A:PALADIN"] = 2,
                ["A:PRIEST"] = 2,
                ["A:ROGUE"] = 2,
                ["A:SHAMAN"] = 2,
                ["A:WARLOCK"] = 2,
                ["A:WARRIOR"] = 2,
                ["H:DRUID"] = 1,
                ["H:HUNTER"] = 1,
                ["H:MAGE"] = 1,
                ["H:PALADIN"] = 1,
                ["H:PRIEST"] = 1,
                ["H:ROGUE"] = 1,
                ["H:SHAMAN"] = 1,
                ["H:WARLOCK"] = 1,
                ["H:WARRIOR"] = 1,
            },
            ["variants"] = {
                [1] = {
                    ["anyCompletable"] = false,
                    ["categoryID"] = 25,
                    ["criteria"] = {
                        [1] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 576,
                                [2] = 8,
                            },
                            ["id"] = 2036,
                            ["name"] = "AC_DIPLOMAT_576",
                            ["type"] = 16,
                        },
                        [2] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 970,
                                [2] = 8,
                            },
                            ["id"] = 2037,
                            ["name"] = "AC_DIPLOMAT_970",
                            ["type"] = 16,
                        },
                        [3] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 941,
                                [2] = 8,
                            },
                            ["id"] = 2038,
                            ["name"] = "AC_DIPLOMAT_941",
                            ["type"] = 16,
                        },
                    },
                    ["description"] = "AD_DIPLOMAT_HORDE",
                    ["icon"] = "-inv_helmet_44",
                    ["id"] = 564,
                    ["name"] = "AN_DIPLOMAT",
                    ["points"] = 10,
                },
                [2] = {
                    ["anyCompletable"] = false,
                    ["categoryID"] = 25,
                    ["criteria"] = {
                        [1] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 576,
                                [2] = 8,
                            },
                            ["id"] = 2036,
                            ["name"] = "AC_DIPLOMAT_576",
                            ["type"] = 16,
                        },
                        [2] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 970,
                                [2] = 8,
                            },
                            ["id"] = 2037,
                            ["name"] = "AC_DIPLOMAT_970",
                            ["type"] = 16,
                        },
                        [3] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 978,
                                [2] = 8,
                            },
                            ["id"] = 2038,
                            ["name"] = "AC_DIPLOMAT_978",
                            ["type"] = 16,
                        },
                    },
                    ["description"] = "AD_DIPLOMAT_ALLIANCE",
                    ["icon"] = "-inv_helmet_44",
                    ["id"] = 564,
                    ["name"] = "AN_DIPLOMAT",
                    ["points"] = 10,
                },
            },
        },
        [567] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 2,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {},
                    ["id"] = 99,
                    ["name"] = {
                        ["args"] = {
                            [1] = 5,
                        },
                        ["key"] = "AC_DAILY_QUESTS",
                    },
                    ["quantity"] = 5,
                    ["type"] = 50,
                },
            },
            ["description"] = {
                ["args"] = {
                    [1] = 5,
                },
                ["key"] = "AD_DAILY_QUESTS",
            },
            ["icon"] = "achievement_quests_completed_daily_01",
            ["id"] = 567,
            ["name"] = {
                ["args"] = {
                    [1] = 5,
                },
                ["key"] = "AN_DAILY_QUESTS",
            },
            ["nextID"] = 568,
            ["points"] = 10,
        },
        [568] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 2,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {},
                    ["id"] = 100,
                    ["name"] = {
                        ["args"] = {
                            [1] = 50,
                        },
                        ["key"] = "AC_DAILY_QUESTS",
                    },
                    ["quantity"] = 50,
                    ["type"] = 50,
                },
            },
            ["description"] = {
                ["args"] = {
                    [1] = 50,
                },
                ["key"] = "AD_DAILY_QUESTS",
            },
            ["icon"] = "achievement_quests_completed_daily_02",
            ["id"] = 568,
            ["name"] = {
                ["args"] = {
                    [1] = 50,
                },
                ["key"] = "AN_DAILY_QUESTS",
            },
            ["nextID"] = 569,
            ["points"] = 10,
            ["previousID"] = 567,
        },
        [569] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 2,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {},
                    ["id"] = 101,
                    ["name"] = {
                        ["args"] = {
                            [1] = 200,
                        },
                        ["key"] = "AC_DAILY_QUESTS",
                    },
                    ["quantity"] = 200,
                    ["type"] = 50,
                },
            },
            ["description"] = {
                ["args"] = {
                    [1] = 200,
                },
                ["key"] = "AD_DAILY_QUESTS",
            },
            ["icon"] = "achievement_quests_completed_daily_03",
            ["id"] = 569,
            ["name"] = {
                ["args"] = {
                    [1] = 200,
                },
                ["key"] = "AN_DAILY_QUESTS",
            },
            ["nextID"] = 570,
            ["points"] = 10,
            ["previousID"] = 568,
        },
        [570] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 2,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {},
                    ["id"] = 102,
                    ["name"] = {
                        ["args"] = {
                            [1] = 500,
                        },
                        ["key"] = "AC_DAILY_QUESTS",
                    },
                    ["quantity"] = 500,
                    ["type"] = 50,
                },
            },
            ["description"] = {
                ["args"] = {
                    [1] = 500,
                },
                ["key"] = "AD_DAILY_QUESTS",
            },
            ["icon"] = "achievement_quests_completed_daily_04",
            ["id"] = 570,
            ["name"] = {
                ["args"] = {
                    [1] = 500,
                },
                ["key"] = "AN_DAILY_QUESTS",
            },
            ["nextID"] = 571,
            ["points"] = 10,
            ["previousID"] = 569,
        },
        [571] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 2,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {},
                    ["id"] = 103,
                    ["name"] = {
                        ["args"] = {
                            [1] = 1000,
                        },
                        ["key"] = "AC_DAILY_QUESTS",
                    },
                    ["quantity"] = 1000,
                    ["type"] = 50,
                },
            },
            ["description"] = {
                ["numberFormat"] = {
                    ["args"] = {
                        [1] = 1000,
                    },
                    ["key"] = "AD_DAILY_QUESTS",
                },
            },
            ["icon"] = "achievement_quests_completed_daily_05",
            ["id"] = 571,
            ["name"] = {
                ["numberFormat"] = {
                    ["args"] = {
                        [1] = 1000,
                    },
                    ["key"] = "AN_DAILY_QUESTS",
                },
            },
            ["nextID"] = 572,
            ["points"] = 10,
            ["previousID"] = 570,
        },
        [572] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 2,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {},
                    ["id"] = 104,
                    ["name"] = {
                        ["args"] = {
                            [1] = 2500,
                        },
                        ["key"] = "AC_DAILY_QUESTS",
                    },
                    ["quantity"] = 2500,
                    ["type"] = 50,
                },
            },
            ["description"] = {
                ["numberFormat"] = {
                    ["args"] = {
                        [1] = 2500,
                    },
                    ["key"] = "AD_DAILY_QUESTS",
                },
            },
            ["icon"] = "achievement_quests_completed_daily_06",
            ["id"] = 572,
            ["name"] = {
                ["numberFormat"] = {
                    ["args"] = {
                        [1] = 2500,
                    },
                    ["key"] = "AN_DAILY_QUESTS",
                },
            },
            ["nextID"] = 573,
            ["points"] = 10,
            ["previousID"] = 571,
        },
        [573] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 2,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {},
                    ["id"] = 105,
                    ["name"] = {
                        ["args"] = {
                            [1] = 5000,
                        },
                        ["key"] = "AC_DAILY_QUESTS",
                    },
                    ["quantity"] = 5000,
                    ["type"] = 50,
                },
            },
            ["description"] = {
                ["numberFormat"] = {
                    ["args"] = {
                        [1] = 5000,
                    },
                    ["key"] = "AD_DAILY_QUESTS",
                },
            },
            ["icon"] = "achievement_quests_completed_daily_07",
            ["id"] = 573,
            ["name"] = {
                ["numberFormat"] = {
                    ["args"] = {
                        [1] = 5000,
                    },
                    ["key"] = "AN_DAILY_QUESTS",
                },
            },
            ["nextID"] = 574,
            ["points"] = 10,
            ["previousID"] = 572,
        },
        [574] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 2,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {},
                    ["id"] = 106,
                    ["name"] = {
                        ["args"] = {
                            [1] = 10000,
                        },
                        ["key"] = "AC_DAILY_QUESTS",
                    },
                    ["quantity"] = 10000,
                    ["type"] = 50,
                },
            },
            ["description"] = {
                ["numberFormat"] = {
                    ["args"] = {
                        [1] = 10000,
                    },
                    ["key"] = "AD_DAILY_QUESTS",
                },
            },
            ["icon"] = "achievement_quests_completed_daily_08",
            ["id"] = 574,
            ["name"] = {
                ["numberFormat"] = {
                    ["args"] = {
                        [1] = 10000,
                    },
                    ["key"] = "AN_DAILY_QUESTS",
                },
            },
            ["points"] = 10,
            ["previousID"] = 573,
        },
        [575] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 35,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 18338,
                    },
                    ["id"] = 2067,
                    ["name"] = "",
                    ["type"] = 1,
                },
            },
            ["description"] = "AD_KRUUL",
            ["icon"] = "-spell_shadow_demonictactics",
            ["id"] = 575,
            ["name"] = "AN_KRUUL",
            ["points"] = 0,
        },
        [580] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 15,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = "GLADIATOR_TITLE",
                    },
                    ["id"] = 5800,
                    ["name"] = "",
                    ["type"] = 36,
                },
            },
            ["description"] = "AD_ARENA_GLADIATOR",
            ["icon"] = "achievement_featsofstrength_gladiator_07",
            ["id"] = 580,
            ["name"] = "AN_ARENA_GLADIATOR",
            ["points"] = 10,
        },
        [581] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 15,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = "DUELIST_TITLE",
                    },
                    ["id"] = 5810,
                    ["name"] = "",
                    ["type"] = 36,
                },
            },
            ["description"] = "AD_ARENA_DUELIST",
            ["icon"] = "achievement_featsofstrength_gladiator_06",
            ["id"] = 581,
            ["name"] = "AN_ARENA_DUELIST",
            ["points"] = 10,
        },
        [582] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 15,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = "RIVAL_TITLE",
                    },
                    ["id"] = 5820,
                    ["name"] = "",
                    ["type"] = 36,
                },
            },
            ["description"] = "AD_ARENA_RIVAL",
            ["icon"] = "achievement_featsofstrength_gladiator_05",
            ["id"] = 582,
            ["name"] = "AN_ARENA_RIVAL",
            ["points"] = 10,
        },
        [583] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 15,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = "CHALLENGER_TITLE",
                    },
                    ["id"] = 5830,
                    ["name"] = "",
                    ["type"] = 36,
                },
            },
            ["description"] = "AD_ARENA_CHALLENGER",
            ["icon"] = "achievement_featsofstrength_gladiator_04",
            ["id"] = 583,
            ["name"] = "AN_ARENA_CHALLENGER",
            ["points"] = 10,
        },
        [584] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 15,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {},
                    ["id"] = 5840,
                    ["name"] = "AD_ARENA_FIRST_WIN",
                    ["quantity"] = 1,
                    ["type"] = 51,
                },
            },
            ["description"] = "AD_ARENA_FIRST_WIN",
            ["icon"] = "achievement_featsofstrength_gladiator_10",
            ["id"] = 584,
            ["name"] = "AN_ARENA_FIRST_WIN",
            ["nextID"] = 585,
            ["points"] = 10,
        },
        [585] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 15,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {},
                    ["id"] = 5850,
                    ["name"] = "AN_ARENA_WIN1",
                    ["quantity"] = 100,
                    ["type"] = 51,
                },
            },
            ["description"] = "AD_ARENA_WIN1",
            ["icon"] = "achievement_featsofstrength_gladiator_01",
            ["id"] = 585,
            ["name"] = "AN_ARENA_WIN1",
            ["nextID"] = 586,
            ["points"] = 10,
            ["previousID"] = 584,
        },
        [586] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 15,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {},
                    ["id"] = 5860,
                    ["name"] = "AN_ARENA_WIN2",
                    ["quantity"] = 200,
                    ["type"] = 51,
                },
            },
            ["description"] = "AD_ARENA_WIN2",
            ["icon"] = "achievement_featsofstrength_gladiator_02",
            ["id"] = 586,
            ["name"] = "AN_ARENA_WIN2",
            ["nextID"] = 587,
            ["points"] = 10,
            ["previousID"] = 585,
        },
        [587] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 15,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {},
                    ["id"] = 5870,
                    ["name"] = "AN_ARENA_WIN3",
                    ["quantity"] = 300,
                    ["type"] = 51,
                },
            },
            ["description"] = "AD_ARENA_WIN3",
            ["icon"] = "achievement_featsofstrength_gladiator_03",
            ["id"] = 587,
            ["name"] = "AN_ARENA_WIN3",
            ["points"] = 10,
            ["previousID"] = 586,
        },
        [588] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 15,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 562,
                    },
                    ["id"] = 1377,
                    ["name"] = "AC_ARENA_MAPS1",
                    ["type"] = 52,
                },
                [2] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 559,
                    },
                    ["id"] = 1378,
                    ["name"] = "AC_ARENA_MAPS2",
                    ["type"] = 52,
                },
                [3] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 572,
                    },
                    ["id"] = 1379,
                    ["name"] = "AC_ARENA_MAPS3",
                    ["type"] = 52,
                },
            },
            ["description"] = "AD_ARENA_MAPS",
            ["icon"] = "-ability_hunter_pathfinding",
            ["id"] = 588,
            ["name"] = "AN_ARENA_MAPS",
            ["points"] = 10,
        },
        [589] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 15,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {},
                    ["id"] = 5890,
                    ["name"] = "",
                    ["quantity"] = 1,
                    ["type"] = 55,
                },
            },
            ["description"] = "AD_ARENA_STREAK",
            ["icon"] = "-spell_fire_fire",
            ["id"] = 589,
            ["name"] = "AN_ARENA_STREAK",
            ["points"] = 10,
        },
        [590] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 15,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 2,
                    },
                    ["id"] = 5900,
                    ["name"] = "",
                    ["quantity"] = 1550,
                    ["type"] = 53,
                },
            },
            ["description"] = "AD_ARENA_2_1550",
            ["icon"] = "achievement_arena_2v2_1",
            ["id"] = 590,
            ["name"] = "AN_ARENA_2_1550",
            ["nextID"] = 591,
            ["points"] = 10,
        },
        [591] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 15,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 2,
                    },
                    ["id"] = 5910,
                    ["name"] = "",
                    ["quantity"] = 1750,
                    ["type"] = 53,
                },
            },
            ["description"] = "AD_ARENA_2_1750",
            ["icon"] = "achievement_arena_2v2_4",
            ["id"] = 591,
            ["name"] = "AN_ARENA_2_1750",
            ["nextID"] = 592,
            ["points"] = 10,
            ["previousID"] = 590,
        },
        [592] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 15,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 2,
                    },
                    ["id"] = 5920,
                    ["name"] = "",
                    ["quantity"] = 2000,
                    ["type"] = 53,
                },
            },
            ["description"] = "AD_ARENA_2_2000",
            ["icon"] = "achievement_arena_2v2_5",
            ["id"] = 592,
            ["name"] = "AN_ARENA_2_2000",
            ["nextID"] = 593,
            ["points"] = 10,
            ["previousID"] = 591,
        },
        [593] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 15,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 2,
                    },
                    ["id"] = 5930,
                    ["name"] = "",
                    ["quantity"] = 2200,
                    ["type"] = 53,
                },
            },
            ["description"] = "AD_ARENA_2_2200",
            ["icon"] = "achievement_arena_2v2_7",
            ["id"] = 593,
            ["name"] = "AN_ARENA_2_2200",
            ["points"] = 10,
            ["previousID"] = 592,
        },
        [594] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 15,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3,
                    },
                    ["id"] = 5940,
                    ["name"] = "",
                    ["quantity"] = 1550,
                    ["type"] = 53,
                },
            },
            ["description"] = "AD_ARENA_3_1550",
            ["icon"] = "achievement_arena_3v3_1",
            ["id"] = 594,
            ["name"] = "AN_ARENA_3_1550",
            ["nextID"] = 595,
            ["points"] = 10,
        },
        [595] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 15,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3,
                    },
                    ["id"] = 5950,
                    ["name"] = "",
                    ["quantity"] = 1750,
                    ["type"] = 53,
                },
            },
            ["description"] = "AD_ARENA_3_1750",
            ["icon"] = "achievement_arena_3v3_4",
            ["id"] = 595,
            ["name"] = "AN_ARENA_3_1750",
            ["nextID"] = 596,
            ["points"] = 10,
            ["previousID"] = 594,
        },
        [596] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 15,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3,
                    },
                    ["id"] = 5960,
                    ["name"] = "",
                    ["quantity"] = 2000,
                    ["type"] = 53,
                },
            },
            ["description"] = "AD_ARENA_3_2000",
            ["icon"] = "achievement_arena_3v3_5",
            ["id"] = 596,
            ["name"] = "AN_ARENA_3_2000",
            ["nextID"] = 597,
            ["points"] = 10,
            ["previousID"] = 595,
        },
        [597] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 15,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 3,
                    },
                    ["id"] = 5970,
                    ["name"] = "",
                    ["quantity"] = 2200,
                    ["type"] = 53,
                },
            },
            ["description"] = "AD_ARENA_3_2200",
            ["icon"] = "achievement_arena_3v3_7",
            ["id"] = 597,
            ["name"] = "AN_ARENA_3_2200",
            ["points"] = 10,
            ["previousID"] = 596,
        },
        [598] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 15,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 5,
                    },
                    ["id"] = 5980,
                    ["name"] = "",
                    ["quantity"] = 1550,
                    ["type"] = 53,
                },
            },
            ["description"] = "AD_ARENA_5_1550",
            ["icon"] = "achievement_arena_5v5_1",
            ["id"] = 598,
            ["name"] = "AN_ARENA_5_1550",
            ["nextID"] = 599,
            ["points"] = 10,
        },
        [599] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 15,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 5,
                    },
                    ["id"] = 5990,
                    ["name"] = "",
                    ["quantity"] = 1750,
                    ["type"] = 53,
                },
            },
            ["description"] = "AD_ARENA_5_1750",
            ["icon"] = "achievement_arena_5v5_4",
            ["id"] = 599,
            ["name"] = "AN_ARENA_5_1750",
            ["nextID"] = 600,
            ["points"] = 10,
            ["previousID"] = 598,
        },
        [600] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 15,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 5,
                    },
                    ["id"] = 6000,
                    ["name"] = "",
                    ["quantity"] = 2000,
                    ["type"] = 53,
                },
            },
            ["description"] = "AD_ARENA_5_2000",
            ["icon"] = "achievement_arena_5v5_5",
            ["id"] = 600,
            ["name"] = "AN_ARENA_5_2000",
            ["nextID"] = 601,
            ["points"] = 10,
            ["previousID"] = 599,
        },
        [601] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 15,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 5,
                    },
                    ["id"] = 6010,
                    ["name"] = "",
                    ["quantity"] = 2200,
                    ["type"] = 53,
                },
            },
            ["description"] = "AD_ARENA_5_2200",
            ["icon"] = "achievement_arena_5v5_7",
            ["id"] = 601,
            ["name"] = "AN_ARENA_5_2200",
            ["points"] = 10,
            ["previousID"] = 600,
        },
        [602] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 15,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {},
                    ["id"] = 6020,
                    ["name"] = "",
                    ["quantity"] = 1,
                    ["type"] = 56,
                },
            },
            ["description"] = "AD_ARENA_HOTSTREAK",
            ["icon"] = "-spell_fire_fire",
            ["id"] = 602,
            ["name"] = "AN_ARENA_HOTSTREAK",
            ["points"] = 10,
        },
        [603] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 15,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {},
                    ["id"] = 6030,
                    ["name"] = "",
                    ["quantity"] = 1,
                    ["type"] = 54,
                },
            },
            ["description"] = "AD_ARENA_LASTMAN",
            ["icon"] = "-spell_holy_surgeoflight",
            ["id"] = 603,
            ["name"] = "AN_ARENA_LASTMAN",
            ["points"] = 10,
        },
        [604] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 15,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 588,
                    },
                    ["id"] = 1380,
                    ["name"] = "AN_ARENA_MAPS",
                    ["type"] = 20,
                },
                [2] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 587,
                    },
                    ["id"] = 1381,
                    ["name"] = "AN_ARENA_WIN3",
                    ["type"] = 20,
                },
                [3] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 589,
                    },
                    ["id"] = 1382,
                    ["name"] = "AN_ARENA_STREAK",
                    ["type"] = 20,
                },
                [4] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 602,
                    },
                    ["id"] = 1383,
                    ["name"] = "AN_ARENA_HOTSTREAK",
                    ["type"] = 20,
                },
                [5] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 599,
                    },
                    ["id"] = 1384,
                    ["name"] = "AN_ARENA_2_2200",
                    ["type"] = 20,
                },
                [6] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 600,
                    },
                    ["id"] = 1385,
                    ["name"] = "AN_ARENA_3_2200",
                    ["type"] = 20,
                },
                [7] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 601,
                    },
                    ["id"] = 1386,
                    ["name"] = "AN_ARENA_5_2200",
                    ["type"] = 20,
                },
                [8] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 603,
                    },
                    ["id"] = 1387,
                    ["name"] = "AN_ARENA_LASTMAN",
                    ["type"] = 20,
                },
            },
            ["description"] = "AD_ARENA_MASTER",
            ["icon"] = "achievement_featsofstrength_gladiator_08",
            ["id"] = 604,
            ["name"] = "AN_ARENA_MASTER",
            ["points"] = 10,
        },
        [623] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 35,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 30480,
                    },
                    ["id"] = 2068,
                    ["name"] = "",
                    ["type"] = 5,
                },
            },
            ["description"] = "AD_ATTUMEN_MOUNT",
            ["icon"] = "-ability_mount_dreadsteed",
            ["id"] = 623,
            ["name"] = "AN_ATTUMEN_MOUNT",
            ["points"] = 0,
        },
        [624] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 21,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 34837,
                    },
                    ["id"] = 1766,
                    ["name"] = "",
                    ["type"] = 5,
                },
            },
            ["description"] = "AD_SECOND_RING",
            ["icon"] = "-inv_jewelry_ring_34",
            ["id"] = 624,
            ["name"] = "AN_SECOND_RING",
            ["points"] = 10,
        },
        [627] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 1,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 38082,
                    },
                    ["id"] = 6270,
                    ["name"] = "",
                    ["type"] = 5,
                },
            },
            ["description"] = "AD_DOLCE",
            ["icon"] = "-inv_misc_bag_27",
            ["id"] = 627,
            ["name"] = "AN_DOLCE",
            ["points"] = 10,
        },
        [630] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 30,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 32622,
                    },
                    ["id"] = 6300,
                    ["name"] = "AC_CHILDREN_PETS1",
                    ["type"] = 5,
                },
                [2] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 32617,
                    },
                    ["id"] = 6301,
                    ["name"] = "AC_CHILDREN_PETS2",
                    ["type"] = 5,
                },
                [3] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 32616,
                    },
                    ["id"] = 6302,
                    ["name"] = "AC_CHILDREN_PETS3",
                    ["type"] = 5,
                },
            },
            ["description"] = "AD_CHILDREN_PETS",
            ["icon"] = "-inv_misc_toy_01",
            ["id"] = 630,
            ["name"] = "AN_CHILDREN_PETS",
            ["points"] = 10,
        },
        [631] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 16,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 400,
                    },
                    ["id"] = 6310,
                    ["name"] = "AN_YOUNG_HERO",
                    ["type"] = 20,
                },
                [2] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 403,
                    },
                    ["id"] = 6311,
                    ["name"] = "AN_YOUNG_HERO",
                    ["type"] = 20,
                },
                [3] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 409,
                    },
                    ["id"] = 6312,
                    ["name"] = "AN_YOUNG_HERO",
                    ["type"] = 20,
                },
                [4] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 411,
                    },
                    ["id"] = 6313,
                    ["name"] = "AN_YOUNG_HERO",
                    ["type"] = 20,
                },
                [5] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 413,
                    },
                    ["id"] = 6314,
                    ["name"] = "AN_YOUNG_HERO",
                    ["type"] = 20,
                },
            },
            ["description"] = "AD_OUTLAND_HERO",
            ["icon"] = "achievement_dungeon_outland_dungeon_hero",
            ["id"] = 631,
            ["name"] = "AN_OUTLAND_HERO",
            ["points"] = 10,
            ["rewardText"] = "TITLE_BUILTIN_HERO_OF_OUTLAND_LABEL",
        },
        [632] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 16,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 360,
                    },
                    ["id"] = 6320,
                    ["name"] = "AN_GREAT_HERO",
                    ["type"] = 20,
                },
                [2] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 361,
                    },
                    ["id"] = 6321,
                    ["name"] = "AN_GREAT_HERO",
                    ["type"] = 20,
                },
                [3] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 631,
                    },
                    ["id"] = 6322,
                    ["name"] = "AN_GREAT_HERO",
                    ["type"] = 20,
                },
            },
            ["description"] = "AD_OUTLAND_GREAT_HERO",
            ["icon"] = "spell_holy_proclaimchampion_02",
            ["id"] = 632,
            ["name"] = "AN_OUTLAND_GREAT_HERO",
            ["points"] = 10,
            ["rewardText"] = "TITLE_BUILTIN_GREAT_HERO_OF_OUTLAND_LABEL",
        },
        [635] = {
            ["selectors"] = {
                ["A:DRUID"] = 2,
                ["A:HUNTER"] = 2,
                ["A:MAGE"] = 2,
                ["A:PALADIN"] = 2,
                ["A:PRIEST"] = 2,
                ["A:ROGUE"] = 2,
                ["A:SHAMAN"] = 2,
                ["A:WARLOCK"] = 2,
                ["A:WARRIOR"] = 2,
                ["H:DRUID"] = 1,
                ["H:HUNTER"] = 1,
                ["H:MAGE"] = 1,
                ["H:PALADIN"] = 1,
                ["H:PRIEST"] = 1,
                ["H:ROGUE"] = 1,
                ["H:SHAMAN"] = 1,
                ["H:WARLOCK"] = 1,
                ["H:WARRIOR"] = 1,
            },
            ["variants"] = {
                [1] = {
                    ["anyCompletable"] = false,
                    ["categoryID"] = 31,
                    ["criteria"] = {
                        [1] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11744,
                            },
                            ["id"] = 7457440,
                            ["name"] = "AC_MIDSUMMER_DESECRATION_HORDE_KALIMDOR_CRITERIA_11744",
                            ["type"] = 3,
                        },
                        [2] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11734,
                            },
                            ["id"] = 7451090,
                            ["name"] = "AC_MIDSUMMER_DESECRATION_HORDE_KALIMDOR_CRITERIA_11734",
                            ["type"] = 3,
                        },
                        [3] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11738,
                            },
                            ["id"] = 7453630,
                            ["name"] = "AC_MIDSUMMER_DESECRATION_HORDE_KALIMDOR_CRITERIA_11738",
                            ["type"] = 3,
                        },
                        [4] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11740,
                            },
                            ["id"] = 7454900,
                            ["name"] = "AC_MIDSUMMER_DESECRATION_HORDE_KALIMDOR_CRITERIA_11740",
                            ["type"] = 3,
                        },
                        [5] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11746,
                            },
                            ["id"] = 7458710,
                            ["name"] = "AC_MIDSUMMER_DESECRATION_HORDE_KALIMDOR_CRITERIA_11746",
                            ["type"] = 3,
                        },
                        [6] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11760,
                            },
                            ["id"] = 7467600,
                            ["name"] = "AC_MIDSUMMER_DESECRATION_HORDE_KALIMDOR_CRITERIA_11760",
                            ["type"] = 3,
                        },
                        [7] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11753,
                            },
                            ["id"] = 7463155,
                            ["name"] = "AC_MIDSUMMER_DESECRATION_HORDE_KALIMDOR_CRITERIA_11753",
                            ["type"] = 3,
                        },
                        [8] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11762,
                            },
                            ["id"] = 7468870,
                            ["name"] = "AC_MIDSUMMER_DESECRATION_HORDE_KALIMDOR_CRITERIA_11762",
                            ["type"] = 3,
                        },
                        [9] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11741,
                            },
                            ["id"] = 7455535,
                            ["name"] = "AC_MIDSUMMER_DESECRATION_HORDE_KALIMDOR_CRITERIA_11741",
                            ["type"] = 3,
                        },
                        [10] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11763,
                            },
                            ["id"] = 7469505,
                            ["name"] = "AC_MIDSUMMER_DESECRATION_HORDE_KALIMDOR_CRITERIA_11763",
                            ["type"] = 3,
                        },
                        [11] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11735,
                            },
                            ["id"] = 7451725,
                            ["name"] = "AC_MIDSUMMER_DESECRATION_HORDE_KALIMDOR_CRITERIA_11735",
                            ["type"] = 3,
                        },
                    },
                    ["description"] = "AD_MIDSUMMER_DESECRATION_HORDE_KALIMDOR",
                    ["icon"] = "-spell_fire_masterofelements",
                    ["id"] = 635,
                    ["name"] = "AN_MIDSUMMER_DESECRATION_HORDE_KALIMDOR",
                    ["points"] = 10,
                },
                [2] = {
                    ["anyCompletable"] = false,
                    ["categoryID"] = 31,
                    ["criteria"] = {
                        [1] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11803,
                            },
                            ["id"] = 7494905,
                            ["name"] = "AC_MIDSUMMER_DESECRATION_ALLIANCE_KALIMDOR_CRITERIA_11803",
                            ["type"] = 3,
                        },
                        [2] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11785,
                            },
                            ["id"] = 7483475,
                            ["name"] = "AC_MIDSUMMER_DESECRATION_ALLIANCE_KALIMDOR_CRITERIA_11785",
                            ["type"] = 3,
                        },
                        [3] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11765,
                            },
                            ["id"] = 7470775,
                            ["name"] = "AC_MIDSUMMER_DESECRATION_ALLIANCE_KALIMDOR_CRITERIA_11765",
                            ["type"] = 3,
                        },
                        [4] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11769,
                            },
                            ["id"] = 7473315,
                            ["name"] = "AC_MIDSUMMER_DESECRATION_ALLIANCE_KALIMDOR_CRITERIA_11769",
                            ["type"] = 3,
                        },
                        [5] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11773,
                            },
                            ["id"] = 7475855,
                            ["name"] = "AC_MIDSUMMER_DESECRATION_ALLIANCE_KALIMDOR_CRITERIA_11773",
                            ["type"] = 3,
                        },
                        [6] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11777,
                            },
                            ["id"] = 7478395,
                            ["name"] = "AC_MIDSUMMER_DESECRATION_ALLIANCE_KALIMDOR_CRITERIA_11777",
                            ["type"] = 3,
                        },
                        [7] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11800,
                            },
                            ["id"] = 7493000,
                            ["name"] = "AC_MIDSUMMER_DESECRATION_ALLIANCE_KALIMDOR_CRITERIA_11800",
                            ["type"] = 3,
                        },
                        [8] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11780,
                            },
                            ["id"] = 7480300,
                            ["name"] = "AC_MIDSUMMER_DESECRATION_ALLIANCE_KALIMDOR_CRITERIA_11780",
                            ["type"] = 3,
                        },
                        [9] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11802,
                            },
                            ["id"] = 7494270,
                            ["name"] = "AC_MIDSUMMER_DESECRATION_ALLIANCE_KALIMDOR_CRITERIA_11802",
                            ["type"] = 3,
                        },
                        [10] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11783,
                            },
                            ["id"] = 7482205,
                            ["name"] = "AC_MIDSUMMER_DESECRATION_ALLIANCE_KALIMDOR_CRITERIA_11783",
                            ["type"] = 3,
                        },
                        [11] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11770,
                            },
                            ["id"] = 7473950,
                            ["name"] = "AC_MIDSUMMER_DESECRATION_ALLIANCE_KALIMDOR_CRITERIA_11770",
                            ["type"] = 3,
                        },
                        [12] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11771,
                            },
                            ["id"] = 7474585,
                            ["name"] = "AC_MIDSUMMER_DESECRATION_ALLIANCE_KALIMDOR_CRITERIA_11771",
                            ["type"] = 3,
                        },
                    },
                    ["description"] = "AD_MIDSUMMER_DESECRATION_ALLIANCE_KALIMDOR",
                    ["icon"] = "-spell_fire_masterofelements",
                    ["id"] = 635,
                    ["name"] = "AN_MIDSUMMER_DESECRATION_ALLIANCE_KALIMDOR",
                    ["points"] = 10,
                },
            },
        },
        [636] = {
            ["selectors"] = {
                ["A:DRUID"] = 2,
                ["A:HUNTER"] = 2,
                ["A:MAGE"] = 2,
                ["A:PALADIN"] = 2,
                ["A:PRIEST"] = 2,
                ["A:ROGUE"] = 2,
                ["A:SHAMAN"] = 2,
                ["A:WARLOCK"] = 2,
                ["A:WARRIOR"] = 2,
                ["H:DRUID"] = 1,
                ["H:HUNTER"] = 1,
                ["H:MAGE"] = 1,
                ["H:PALADIN"] = 1,
                ["H:PRIEST"] = 1,
                ["H:ROGUE"] = 1,
                ["H:SHAMAN"] = 1,
                ["H:WARLOCK"] = 1,
                ["H:WARRIOR"] = 1,
            },
            ["variants"] = {
                [1] = {
                    ["anyCompletable"] = false,
                    ["categoryID"] = 31,
                    ["criteria"] = {
                        [1] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11736,
                            },
                            ["id"] = 7464096,
                            ["name"] = "AC_MIDSUMMER_DESECRATION_HORDE_OUTLAND_CRITERIA_11736",
                            ["type"] = 3,
                        },
                        [2] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11750,
                            },
                            ["id"] = 7473000,
                            ["name"] = "AC_MIDSUMMER_DESECRATION_HORDE_OUTLAND_CRITERIA_11750",
                            ["type"] = 3,
                        },
                        [3] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11759,
                            },
                            ["id"] = 7478724,
                            ["name"] = "AC_MIDSUMMER_DESECRATION_HORDE_OUTLAND_CRITERIA_11759",
                            ["type"] = 3,
                        },
                        [4] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11752,
                            },
                            ["id"] = 7474272,
                            ["name"] = "AC_MIDSUMMER_DESECRATION_HORDE_OUTLAND_CRITERIA_11752",
                            ["type"] = 3,
                        },
                        [5] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11754,
                            },
                            ["id"] = 7475544,
                            ["name"] = "AC_MIDSUMMER_DESECRATION_HORDE_OUTLAND_CRITERIA_11754",
                            ["type"] = 3,
                        },
                        [6] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11758,
                            },
                            ["id"] = 7478088,
                            ["name"] = "AC_MIDSUMMER_DESECRATION_HORDE_OUTLAND_CRITERIA_11758",
                            ["type"] = 3,
                        },
                        [7] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11747,
                            },
                            ["id"] = 7471092,
                            ["name"] = "AC_MIDSUMMER_DESECRATION_HORDE_OUTLAND_CRITERIA_11747",
                            ["type"] = 3,
                        },
                    },
                    ["description"] = "AD_MIDSUMMER_DESECRATION_HORDE_OUTLAND",
                    ["icon"] = "-spell_fire_masterofelements",
                    ["id"] = 636,
                    ["name"] = "AN_MIDSUMMER_DESECRATION_HORDE_OUTLAND",
                    ["points"] = 10,
                },
                [2] = {
                    ["anyCompletable"] = false,
                    ["categoryID"] = 31,
                    ["criteria"] = {
                        [1] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11767,
                            },
                            ["id"] = 7483812,
                            ["name"] = "AC_MIDSUMMER_DESECRATION_ALLIANCE_OUTLAND_CRITERIA_11767",
                            ["type"] = 3,
                        },
                        [2] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11799,
                            },
                            ["id"] = 7504164,
                            ["name"] = "AC_MIDSUMMER_DESECRATION_ALLIANCE_OUTLAND_CRITERIA_11799",
                            ["type"] = 3,
                        },
                        [3] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11782,
                            },
                            ["id"] = 7493352,
                            ["name"] = "AC_MIDSUMMER_DESECRATION_ALLIANCE_OUTLAND_CRITERIA_11782",
                            ["type"] = 3,
                        },
                        [4] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11775,
                            },
                            ["id"] = 7488900,
                            ["name"] = "AC_MIDSUMMER_DESECRATION_ALLIANCE_OUTLAND_CRITERIA_11775",
                            ["type"] = 3,
                        },
                        [5] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11787,
                            },
                            ["id"] = 7496532,
                            ["name"] = "AC_MIDSUMMER_DESECRATION_ALLIANCE_OUTLAND_CRITERIA_11787",
                            ["type"] = 3,
                        },
                        [6] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11778,
                            },
                            ["id"] = 7490808,
                            ["name"] = "AC_MIDSUMMER_DESECRATION_ALLIANCE_OUTLAND_CRITERIA_11778",
                            ["type"] = 3,
                        },
                        [7] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11779,
                            },
                            ["id"] = 7491444,
                            ["name"] = "AC_MIDSUMMER_DESECRATION_ALLIANCE_OUTLAND_CRITERIA_11779",
                            ["type"] = 3,
                        },
                    },
                    ["description"] = "AD_MIDSUMMER_DESECRATION_ALLIANCE_OUTLAND",
                    ["icon"] = "-spell_fire_masterofelements",
                    ["id"] = 636,
                    ["name"] = "AN_MIDSUMMER_DESECRATION_ALLIANCE_OUTLAND",
                    ["points"] = 10,
                },
            },
        },
        [637] = {
            ["selectors"] = {
                ["A:DRUID"] = 2,
                ["A:HUNTER"] = 2,
                ["A:MAGE"] = 2,
                ["A:PALADIN"] = 2,
                ["A:PRIEST"] = 2,
                ["A:ROGUE"] = 2,
                ["A:SHAMAN"] = 2,
                ["A:WARLOCK"] = 2,
                ["A:WARRIOR"] = 2,
                ["H:DRUID"] = 1,
                ["H:HUNTER"] = 1,
                ["H:MAGE"] = 1,
                ["H:PALADIN"] = 1,
                ["H:PRIEST"] = 1,
                ["H:ROGUE"] = 1,
                ["H:SHAMAN"] = 1,
                ["H:WARLOCK"] = 1,
                ["H:WARRIOR"] = 1,
            },
            ["variants"] = {
                [1] = {
                    ["anyCompletable"] = false,
                    ["categoryID"] = 31,
                    ["criteria"] = {
                        [1] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11751,
                            },
                            ["id"] = 7485387,
                            ["name"] = "AC_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS_CRITERIA_11751",
                            ["type"] = 3,
                        },
                        [2] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11742,
                            },
                            ["id"] = 7479654,
                            ["name"] = "AC_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS_CRITERIA_11742",
                            ["type"] = 3,
                        },
                        [3] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11745,
                            },
                            ["id"] = 7481565,
                            ["name"] = "AC_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS_CRITERIA_11745",
                            ["type"] = 3,
                        },
                        [4] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11749,
                            },
                            ["id"] = 7484113,
                            ["name"] = "AC_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS_CRITERIA_11749",
                            ["type"] = 3,
                        },
                        [5] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11732,
                            },
                            ["id"] = 7473284,
                            ["name"] = "AC_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS_CRITERIA_11732",
                            ["type"] = 3,
                        },
                        [6] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11739,
                            },
                            ["id"] = 7477743,
                            ["name"] = "AC_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS_CRITERIA_11739",
                            ["type"] = 3,
                        },
                        [7] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11761,
                            },
                            ["id"] = 7491757,
                            ["name"] = "AC_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS_CRITERIA_11761",
                            ["type"] = 3,
                        },
                        [8] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11755,
                            },
                            ["id"] = 7487935,
                            ["name"] = "AC_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS_CRITERIA_11755",
                            ["type"] = 3,
                        },
                        [9] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11756,
                            },
                            ["id"] = 7488572,
                            ["name"] = "AC_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS_CRITERIA_11756",
                            ["type"] = 3,
                        },
                        [10] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11581,
                            },
                            ["id"] = 7377097,
                            ["name"] = "AC_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS_CRITERIA_11581",
                            ["type"] = 3,
                        },
                        [11] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11748,
                            },
                            ["id"] = 7483476,
                            ["name"] = "AC_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS_CRITERIA_11748",
                            ["type"] = 3,
                        },
                        [12] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11737,
                            },
                            ["id"] = 7476469,
                            ["name"] = "AC_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS_CRITERIA_11737",
                            ["type"] = 3,
                        },
                        [13] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11743,
                            },
                            ["id"] = 7480291,
                            ["name"] = "AC_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS_CRITERIA_11743",
                            ["type"] = 3,
                        },
                        [14] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11757,
                            },
                            ["id"] = 7489209,
                            ["name"] = "AC_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS_CRITERIA_11757",
                            ["type"] = 3,
                        },
                    },
                    ["description"] = "AD_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS",
                    ["icon"] = "-spell_fire_masterofelements",
                    ["id"] = 637,
                    ["name"] = "AN_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS",
                    ["points"] = 10,
                },
                [2] = {
                    ["anyCompletable"] = false,
                    ["categoryID"] = 31,
                    ["criteria"] = {
                        [1] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11766,
                            },
                            ["id"] = 7494942,
                            ["name"] = "AC_MIDSUMMER_DESECRATION_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11766",
                            ["type"] = 3,
                        },
                        [2] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11772,
                            },
                            ["id"] = 7498764,
                            ["name"] = "AC_MIDSUMMER_DESECRATION_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11772",
                            ["type"] = 3,
                        },
                        [3] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11774,
                            },
                            ["id"] = 7500038,
                            ["name"] = "AC_MIDSUMMER_DESECRATION_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11774",
                            ["type"] = 3,
                        },
                        [4] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11776,
                            },
                            ["id"] = 7501312,
                            ["name"] = "AC_MIDSUMMER_DESECRATION_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11776",
                            ["type"] = 3,
                        },
                        [5] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11768,
                            },
                            ["id"] = 7496216,
                            ["name"] = "AC_MIDSUMMER_DESECRATION_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11768",
                            ["type"] = 3,
                        },
                        [6] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11781,
                            },
                            ["id"] = 7504497,
                            ["name"] = "AC_MIDSUMMER_DESECRATION_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11781",
                            ["type"] = 3,
                        },
                        [7] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11764,
                            },
                            ["id"] = 7493668,
                            ["name"] = "AC_MIDSUMMER_DESECRATION_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11764",
                            ["type"] = 3,
                        },
                        [8] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11580,
                            },
                            ["id"] = 7376460,
                            ["name"] = "AC_MIDSUMMER_DESECRATION_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11580",
                            ["type"] = 3,
                        },
                        [9] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11801,
                            },
                            ["id"] = 7517237,
                            ["name"] = "AC_MIDSUMMER_DESECRATION_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11801",
                            ["type"] = 3,
                        },
                        [10] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11784,
                            },
                            ["id"] = 7506408,
                            ["name"] = "AC_MIDSUMMER_DESECRATION_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11784",
                            ["type"] = 3,
                        },
                        [11] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11786,
                            },
                            ["id"] = 7507682,
                            ["name"] = "AC_MIDSUMMER_DESECRATION_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11786",
                            ["type"] = 3,
                        },
                    },
                    ["description"] = "AD_MIDSUMMER_DESECRATION_ALLIANCE_EASTERN_KINGDOMS",
                    ["icon"] = "-spell_fire_masterofelements",
                    ["id"] = 637,
                    ["name"] = "AN_MIDSUMMER_DESECRATION_ALLIANCE_EASTERN_KINGDOMS",
                    ["points"] = 10,
                },
            },
        },
        [638] = {
            ["selectors"] = {
                ["A:DRUID"] = 2,
                ["A:HUNTER"] = 2,
                ["A:MAGE"] = 2,
                ["A:PALADIN"] = 2,
                ["A:PRIEST"] = 2,
                ["A:ROGUE"] = 2,
                ["A:SHAMAN"] = 2,
                ["A:WARLOCK"] = 2,
                ["A:WARRIOR"] = 2,
                ["H:DRUID"] = 1,
                ["H:HUNTER"] = 1,
                ["H:MAGE"] = 1,
                ["H:PALADIN"] = 1,
                ["H:PRIEST"] = 1,
                ["H:ROGUE"] = 1,
                ["H:SHAMAN"] = 1,
                ["H:WARLOCK"] = 1,
                ["H:WARRIOR"] = 1,
            },
            ["variants"] = {
                [1] = {
                    ["anyCompletable"] = false,
                    ["categoryID"] = 31,
                    ["criteria"] = {
                        [1] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 635,
                            },
                            ["id"] = 6380,
                            ["name"] = "AN_MIDSUMMER_DESECRATION_HORDE_KALIMDOR",
                            ["type"] = 20,
                        },
                        [2] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 636,
                            },
                            ["id"] = 6381,
                            ["name"] = "AN_MIDSUMMER_DESECRATION_HORDE_OUTLAND",
                            ["type"] = 20,
                        },
                        [3] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 637,
                            },
                            ["id"] = 6382,
                            ["name"] = "AN_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS",
                            ["type"] = 20,
                        },
                    },
                    ["description"] = "AD_MIDSUMMER_DESECRATION_HORDE",
                    ["icon"] = "-spell_fire_masterofelements",
                    ["id"] = 638,
                    ["name"] = "AN_MIDSUMMER_DESECRATION_HORDE",
                    ["points"] = 10,
                },
                [2] = {
                    ["anyCompletable"] = false,
                    ["categoryID"] = 31,
                    ["criteria"] = {
                        [1] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 635,
                            },
                            ["id"] = 6380,
                            ["name"] = "AN_MIDSUMMER_DESECRATION_ALLIANCE_KALIMDOR",
                            ["type"] = 20,
                        },
                        [2] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 636,
                            },
                            ["id"] = 6381,
                            ["name"] = "AN_MIDSUMMER_DESECRATION_ALLIANCE_OUTLAND",
                            ["type"] = 20,
                        },
                        [3] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 637,
                            },
                            ["id"] = 6382,
                            ["name"] = "AN_MIDSUMMER_DESECRATION_ALLIANCE_EASTERN_KINGDOMS",
                            ["type"] = 20,
                        },
                    },
                    ["description"] = "AD_MIDSUMMER_DESECRATION_ALLIANCE",
                    ["icon"] = "-spell_fire_masterofelements",
                    ["id"] = 638,
                    ["name"] = "AN_MIDSUMMER_DESECRATION_ALLIANCE",
                    ["points"] = 10,
                },
            },
        },
        [639] = {
            ["selectors"] = {
                ["A:DRUID"] = 2,
                ["A:HUNTER"] = 2,
                ["A:MAGE"] = 2,
                ["A:PALADIN"] = 2,
                ["A:PRIEST"] = 2,
                ["A:ROGUE"] = 2,
                ["A:SHAMAN"] = 2,
                ["A:WARLOCK"] = 2,
                ["A:WARRIOR"] = 2,
                ["H:DRUID"] = 1,
                ["H:HUNTER"] = 1,
                ["H:MAGE"] = 1,
                ["H:PALADIN"] = 1,
                ["H:PRIEST"] = 1,
                ["H:ROGUE"] = 1,
                ["H:SHAMAN"] = 1,
                ["H:WARLOCK"] = 1,
                ["H:WARRIOR"] = 1,
            },
            ["variants"] = {
                [1] = {
                    ["anyCompletable"] = false,
                    ["categoryID"] = 31,
                    ["criteria"] = {
                        [1] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11841,
                            },
                            ["id"] = 7566399,
                            ["name"] = "AC_MIDSUMMER_FLAME_KEEPER_HORDE_KALIMDOR_CRITERIA_11841",
                            ["type"] = 3,
                        },
                        [2] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11845,
                            },
                            ["id"] = 7568955,
                            ["name"] = "AC_MIDSUMMER_FLAME_KEEPER_HORDE_KALIMDOR_CRITERIA_11845",
                            ["type"] = 3,
                        },
                        [3] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11846,
                            },
                            ["id"] = 7569594,
                            ["name"] = "AC_MIDSUMMER_FLAME_KEEPER_HORDE_KALIMDOR_CRITERIA_11846",
                            ["type"] = 3,
                        },
                        [4] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11847,
                            },
                            ["id"] = 7570233,
                            ["name"] = "AC_MIDSUMMER_FLAME_KEEPER_HORDE_KALIMDOR_CRITERIA_11847",
                            ["type"] = 3,
                        },
                        [5] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11849,
                            },
                            ["id"] = 7571511,
                            ["name"] = "AC_MIDSUMMER_FLAME_KEEPER_HORDE_KALIMDOR_CRITERIA_11849",
                            ["type"] = 3,
                        },
                        [6] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11852,
                            },
                            ["id"] = 7573428,
                            ["name"] = "AC_MIDSUMMER_FLAME_KEEPER_HORDE_KALIMDOR_CRITERIA_11852",
                            ["type"] = 3,
                        },
                        [7] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11859,
                            },
                            ["id"] = 7577901,
                            ["name"] = "AC_MIDSUMMER_FLAME_KEEPER_HORDE_KALIMDOR_CRITERIA_11859",
                            ["type"] = 3,
                        },
                        [8] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11839,
                            },
                            ["id"] = 7565121,
                            ["name"] = "AC_MIDSUMMER_FLAME_KEEPER_HORDE_KALIMDOR_CRITERIA_11839",
                            ["type"] = 3,
                        },
                        [9] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11836,
                            },
                            ["id"] = 7563204,
                            ["name"] = "AC_MIDSUMMER_FLAME_KEEPER_HORDE_KALIMDOR_CRITERIA_11836",
                            ["type"] = 3,
                        },
                        [10] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11856,
                            },
                            ["id"] = 7575984,
                            ["name"] = "AC_MIDSUMMER_FLAME_KEEPER_HORDE_KALIMDOR_CRITERIA_11856",
                            ["type"] = 3,
                        },
                        [11] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11861,
                            },
                            ["id"] = 7579179,
                            ["name"] = "AC_MIDSUMMER_FLAME_KEEPER_HORDE_KALIMDOR_CRITERIA_11861",
                            ["type"] = 3,
                        },
                        [12] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11838,
                            },
                            ["id"] = 7564482,
                            ["name"] = "AC_MIDSUMMER_FLAME_KEEPER_HORDE_KALIMDOR_CRITERIA_11838",
                            ["type"] = 3,
                        },
                    },
                    ["description"] = "AD_MIDSUMMER_FLAME_KEEPER_HORDE_KALIMDOR",
                    ["icon"] = "-inv_summerfest_firespirit",
                    ["id"] = 639,
                    ["name"] = "AN_MIDSUMMER_FLAME_KEEPER_HORDE_KALIMDOR",
                    ["points"] = 10,
                },
                [2] = {
                    ["anyCompletable"] = false,
                    ["categoryID"] = 31,
                    ["criteria"] = {
                        [1] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11833,
                            },
                            ["id"] = 7561287,
                            ["name"] = "AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_KALIMDOR_CRITERIA_11833",
                            ["type"] = 3,
                        },
                        [2] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11805,
                            },
                            ["id"] = 7543395,
                            ["name"] = "AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_KALIMDOR_CRITERIA_11805",
                            ["type"] = 3,
                        },
                        [3] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11809,
                            },
                            ["id"] = 7545951,
                            ["name"] = "AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_KALIMDOR_CRITERIA_11809",
                            ["type"] = 3,
                        },
                        [4] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11812,
                            },
                            ["id"] = 7547868,
                            ["name"] = "AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_KALIMDOR_CRITERIA_11812",
                            ["type"] = 3,
                        },
                        [5] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11817,
                            },
                            ["id"] = 7551063,
                            ["name"] = "AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_KALIMDOR_CRITERIA_11817",
                            ["type"] = 3,
                        },
                        [6] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11824,
                            },
                            ["id"] = 7555536,
                            ["name"] = "AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_KALIMDOR_CRITERIA_11824",
                            ["type"] = 3,
                        },
                        [7] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11806,
                            },
                            ["id"] = 7544034,
                            ["name"] = "AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_KALIMDOR_CRITERIA_11806",
                            ["type"] = 3,
                        },
                        [8] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11834,
                            },
                            ["id"] = 7561926,
                            ["name"] = "AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_KALIMDOR_CRITERIA_11834",
                            ["type"] = 3,
                        },
                        [9] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11831,
                            },
                            ["id"] = 7560009,
                            ["name"] = "AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_KALIMDOR_CRITERIA_11831",
                            ["type"] = 3,
                        },
                        [10] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11815,
                            },
                            ["id"] = 7549785,
                            ["name"] = "AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_KALIMDOR_CRITERIA_11815",
                            ["type"] = 3,
                        },
                        [11] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11811,
                            },
                            ["id"] = 7547229,
                            ["name"] = "AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_KALIMDOR_CRITERIA_11811",
                            ["type"] = 3,
                        },
                    },
                    ["description"] = "AD_MIDSUMMER_FLAME_KEEPER_ALLIANCE_KALIMDOR",
                    ["icon"] = "-inv_summerfest_firespirit",
                    ["id"] = 639,
                    ["name"] = "AN_MIDSUMMER_FLAME_KEEPER_ALLIANCE_KALIMDOR",
                    ["points"] = 10,
                },
            },
        },
        [640] = {
            ["selectors"] = {
                ["A:DRUID"] = 2,
                ["A:HUNTER"] = 2,
                ["A:MAGE"] = 2,
                ["A:PALADIN"] = 2,
                ["A:PRIEST"] = 2,
                ["A:ROGUE"] = 2,
                ["A:SHAMAN"] = 2,
                ["A:WARLOCK"] = 2,
                ["A:WARRIOR"] = 2,
                ["H:DRUID"] = 1,
                ["H:HUNTER"] = 1,
                ["H:MAGE"] = 1,
                ["H:PALADIN"] = 1,
                ["H:PRIEST"] = 1,
                ["H:ROGUE"] = 1,
                ["H:SHAMAN"] = 1,
                ["H:WARLOCK"] = 1,
                ["H:WARRIOR"] = 1,
            },
            ["variants"] = {
                [1] = {
                    ["anyCompletable"] = false,
                    ["categoryID"] = 31,
                    ["criteria"] = {
                        [1] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11851,
                            },
                            ["id"] = 7584640,
                            ["name"] = "AC_MIDSUMMER_FLAME_KEEPER_HORDE_OUTLAND_CRITERIA_11851",
                            ["type"] = 3,
                        },
                        [2] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11835,
                            },
                            ["id"] = 7574400,
                            ["name"] = "AC_MIDSUMMER_FLAME_KEEPER_HORDE_OUTLAND_CRITERIA_11835",
                            ["type"] = 3,
                        },
                        [3] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11855,
                            },
                            ["id"] = 7587200,
                            ["name"] = "AC_MIDSUMMER_FLAME_KEEPER_HORDE_OUTLAND_CRITERIA_11855",
                            ["type"] = 3,
                        },
                        [4] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11858,
                            },
                            ["id"] = 7589120,
                            ["name"] = "AC_MIDSUMMER_FLAME_KEEPER_HORDE_OUTLAND_CRITERIA_11858",
                            ["type"] = 3,
                        },
                        [5] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11854,
                            },
                            ["id"] = 7586560,
                            ["name"] = "AC_MIDSUMMER_FLAME_KEEPER_HORDE_OUTLAND_CRITERIA_11854",
                            ["type"] = 3,
                        },
                        [6] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11863,
                            },
                            ["id"] = 7592320,
                            ["name"] = "AC_MIDSUMMER_FLAME_KEEPER_HORDE_OUTLAND_CRITERIA_11863",
                            ["type"] = 3,
                        },
                        [7] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11843,
                            },
                            ["id"] = 7579520,
                            ["name"] = "AC_MIDSUMMER_FLAME_KEEPER_HORDE_OUTLAND_CRITERIA_11843",
                            ["type"] = 3,
                        },
                    },
                    ["description"] = "AD_MIDSUMMER_FLAME_KEEPER_HORDE_OUTLAND",
                    ["icon"] = "-inv_summerfest_firespirit",
                    ["id"] = 640,
                    ["name"] = "AN_MIDSUMMER_FLAME_KEEPER_HORDE_OUTLAND",
                    ["points"] = 10,
                },
                [2] = {
                    ["anyCompletable"] = false,
                    ["categoryID"] = 31,
                    ["criteria"] = {
                        [1] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11807,
                            },
                            ["id"] = 7556480,
                            ["name"] = "AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_OUTLAND_CRITERIA_11807",
                            ["type"] = 3,
                        },
                        [2] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11830,
                            },
                            ["id"] = 7571200,
                            ["name"] = "AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_OUTLAND_CRITERIA_11830",
                            ["type"] = 3,
                        },
                        [3] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11823,
                            },
                            ["id"] = 7566720,
                            ["name"] = "AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_OUTLAND_CRITERIA_11823",
                            ["type"] = 3,
                        },
                        [4] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11829,
                            },
                            ["id"] = 7570560,
                            ["name"] = "AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_OUTLAND_CRITERIA_11829",
                            ["type"] = 3,
                        },
                        [5] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11818,
                            },
                            ["id"] = 7563520,
                            ["name"] = "AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_OUTLAND_CRITERIA_11818",
                            ["type"] = 3,
                        },
                        [6] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11821,
                            },
                            ["id"] = 7565440,
                            ["name"] = "AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_OUTLAND_CRITERIA_11821",
                            ["type"] = 3,
                        },
                        [7] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11825,
                            },
                            ["id"] = 7568000,
                            ["name"] = "AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_OUTLAND_CRITERIA_11825",
                            ["type"] = 3,
                        },
                    },
                    ["description"] = "AD_MIDSUMMER_FLAME_KEEPER_ALLIANCE_OUTLAND",
                    ["icon"] = "-inv_summerfest_firespirit",
                    ["id"] = 640,
                    ["name"] = "AN_MIDSUMMER_FLAME_KEEPER_ALLIANCE_OUTLAND",
                    ["points"] = 10,
                },
            },
        },
        [641] = {
            ["selectors"] = {
                ["A:DRUID"] = 2,
                ["A:HUNTER"] = 2,
                ["A:MAGE"] = 2,
                ["A:PALADIN"] = 2,
                ["A:PRIEST"] = 2,
                ["A:ROGUE"] = 2,
                ["A:SHAMAN"] = 2,
                ["A:WARLOCK"] = 2,
                ["A:WARRIOR"] = 2,
                ["H:DRUID"] = 1,
                ["H:HUNTER"] = 1,
                ["H:MAGE"] = 1,
                ["H:PALADIN"] = 1,
                ["H:PRIEST"] = 1,
                ["H:ROGUE"] = 1,
                ["H:SHAMAN"] = 1,
                ["H:WARLOCK"] = 1,
                ["H:WARRIOR"] = 1,
            },
            ["variants"] = {
                [1] = {
                    ["anyCompletable"] = false,
                    ["categoryID"] = 31,
                    ["criteria"] = {
                        [1] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11844,
                            },
                            ["id"] = 7592004,
                            ["name"] = "AC_MIDSUMMER_FLAME_KEEPER_HORDE_EASTERN_KINGDOMS_CRITERIA_11844",
                            ["type"] = 3,
                        },
                        [2] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11840,
                            },
                            ["id"] = 7589440,
                            ["name"] = "AC_MIDSUMMER_FLAME_KEEPER_HORDE_EASTERN_KINGDOMS_CRITERIA_11840",
                            ["type"] = 3,
                        },
                        [3] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11584,
                            },
                            ["id"] = 7425344,
                            ["name"] = "AC_MIDSUMMER_FLAME_KEEPER_HORDE_EASTERN_KINGDOMS_CRITERIA_11584",
                            ["type"] = 3,
                        },
                        [4] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11837,
                            },
                            ["id"] = 7587517,
                            ["name"] = "AC_MIDSUMMER_FLAME_KEEPER_HORDE_EASTERN_KINGDOMS_CRITERIA_11837",
                            ["type"] = 3,
                        },
                        [5] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11860,
                            },
                            ["id"] = 7602260,
                            ["name"] = "AC_MIDSUMMER_FLAME_KEEPER_HORDE_EASTERN_KINGDOMS_CRITERIA_11860",
                            ["type"] = 3,
                        },
                        [6] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11850,
                            },
                            ["id"] = 7595850,
                            ["name"] = "AC_MIDSUMMER_FLAME_KEEPER_HORDE_EASTERN_KINGDOMS_CRITERIA_11850",
                            ["type"] = 3,
                        },
                        [7] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11862,
                            },
                            ["id"] = 7603542,
                            ["name"] = "AC_MIDSUMMER_FLAME_KEEPER_HORDE_EASTERN_KINGDOMS_CRITERIA_11862",
                            ["type"] = 3,
                        },
                        [8] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11853,
                            },
                            ["id"] = 7597773,
                            ["name"] = "AC_MIDSUMMER_FLAME_KEEPER_HORDE_EASTERN_KINGDOMS_CRITERIA_11853",
                            ["type"] = 3,
                        },
                        [9] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11848,
                            },
                            ["id"] = 7594568,
                            ["name"] = "AC_MIDSUMMER_FLAME_KEEPER_HORDE_EASTERN_KINGDOMS_CRITERIA_11848",
                            ["type"] = 3,
                        },
                        [10] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11857,
                            },
                            ["id"] = 7600337,
                            ["name"] = "AC_MIDSUMMER_FLAME_KEEPER_HORDE_EASTERN_KINGDOMS_CRITERIA_11857",
                            ["type"] = 3,
                        },
                        [11] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11842,
                            },
                            ["id"] = 7590722,
                            ["name"] = "AC_MIDSUMMER_FLAME_KEEPER_HORDE_EASTERN_KINGDOMS_CRITERIA_11842",
                            ["type"] = 3,
                        },
                    },
                    ["description"] = "AD_MIDSUMMER_FLAME_KEEPER_HORDE_EASTERN_KINGDOMS",
                    ["icon"] = "-inv_summerfest_firespirit",
                    ["id"] = 641,
                    ["name"] = "AN_MIDSUMMER_FLAME_KEEPER_HORDE_EASTERN_KINGDOMS",
                    ["points"] = 10,
                },
                [2] = {
                    ["anyCompletable"] = false,
                    ["categoryID"] = 31,
                    ["criteria"] = {
                        [1] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11816,
                            },
                            ["id"] = 7574056,
                            ["name"] = "AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11816",
                            ["type"] = 3,
                        },
                        [2] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11810,
                            },
                            ["id"] = 7570210,
                            ["name"] = "AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11810",
                            ["type"] = 3,
                        },
                        [3] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11813,
                            },
                            ["id"] = 7572133,
                            ["name"] = "AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11813",
                            ["type"] = 3,
                        },
                        [4] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11822,
                            },
                            ["id"] = 7577902,
                            ["name"] = "AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11822",
                            ["type"] = 3,
                        },
                        [5] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11832,
                            },
                            ["id"] = 7584312,
                            ["name"] = "AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11832",
                            ["type"] = 3,
                        },
                        [6] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11826,
                            },
                            ["id"] = 7580466,
                            ["name"] = "AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11826",
                            ["type"] = 3,
                        },
                        [7] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11583,
                            },
                            ["id"] = 7424703,
                            ["name"] = "AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11583",
                            ["type"] = 3,
                        },
                        [8] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11827,
                            },
                            ["id"] = 7581107,
                            ["name"] = "AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11827",
                            ["type"] = 3,
                        },
                        [9] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11808,
                            },
                            ["id"] = 7568928,
                            ["name"] = "AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11808",
                            ["type"] = 3,
                        },
                        [10] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11819,
                            },
                            ["id"] = 7575979,
                            ["name"] = "AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11819",
                            ["type"] = 3,
                        },
                        [11] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11814,
                            },
                            ["id"] = 7572774,
                            ["name"] = "AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11814",
                            ["type"] = 3,
                        },
                        [12] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11820,
                            },
                            ["id"] = 7576620,
                            ["name"] = "AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11820",
                            ["type"] = 3,
                        },
                        [13] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11804,
                            },
                            ["id"] = 7566364,
                            ["name"] = "AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11804",
                            ["type"] = 3,
                        },
                        [14] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 11828,
                            },
                            ["id"] = 7581748,
                            ["name"] = "AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11828",
                            ["type"] = 3,
                        },
                    },
                    ["description"] = "AD_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS",
                    ["icon"] = "-inv_summerfest_firespirit",
                    ["id"] = 641,
                    ["name"] = "AN_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS",
                    ["points"] = 10,
                },
            },
        },
        [642] = {
            ["selectors"] = {
                ["A:DRUID"] = 2,
                ["A:HUNTER"] = 2,
                ["A:MAGE"] = 2,
                ["A:PALADIN"] = 2,
                ["A:PRIEST"] = 2,
                ["A:ROGUE"] = 2,
                ["A:SHAMAN"] = 2,
                ["A:WARLOCK"] = 2,
                ["A:WARRIOR"] = 2,
                ["H:DRUID"] = 1,
                ["H:HUNTER"] = 1,
                ["H:MAGE"] = 1,
                ["H:PALADIN"] = 1,
                ["H:PRIEST"] = 1,
                ["H:ROGUE"] = 1,
                ["H:SHAMAN"] = 1,
                ["H:WARLOCK"] = 1,
                ["H:WARRIOR"] = 1,
            },
            ["variants"] = {
                [1] = {
                    ["anyCompletable"] = false,
                    ["categoryID"] = 31,
                    ["criteria"] = {
                        [1] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 639,
                            },
                            ["id"] = 6420,
                            ["name"] = "AN_MIDSUMMER_FLAME_KEEPER_HORDE_KALIMDOR",
                            ["type"] = 20,
                        },
                        [2] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 640,
                            },
                            ["id"] = 6421,
                            ["name"] = "AN_MIDSUMMER_FLAME_KEEPER_HORDE_OUTLAND",
                            ["type"] = 20,
                        },
                        [3] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 641,
                            },
                            ["id"] = 6422,
                            ["name"] = "AN_MIDSUMMER_FLAME_KEEPER_HORDE_EASTERN_KINGDOMS",
                            ["type"] = 20,
                        },
                    },
                    ["description"] = "AD_MIDSUMMER_FLAME_KEEPER_HORDE",
                    ["icon"] = "-inv_summerfest_firespirit",
                    ["id"] = 642,
                    ["name"] = "AN_MIDSUMMER_FLAME_KEEPER_HORDE",
                    ["points"] = 10,
                },
                [2] = {
                    ["anyCompletable"] = false,
                    ["categoryID"] = 31,
                    ["criteria"] = {
                        [1] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 639,
                            },
                            ["id"] = 6420,
                            ["name"] = "AN_MIDSUMMER_FLAME_KEEPER_ALLIANCE_KALIMDOR",
                            ["type"] = 20,
                        },
                        [2] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 640,
                            },
                            ["id"] = 6421,
                            ["name"] = "AN_MIDSUMMER_FLAME_KEEPER_ALLIANCE_OUTLAND",
                            ["type"] = 20,
                        },
                        [3] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 641,
                            },
                            ["id"] = 6422,
                            ["name"] = "AN_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS",
                            ["type"] = 20,
                        },
                    },
                    ["description"] = "AD_MIDSUMMER_FLAME_KEEPER_ALLIANCE",
                    ["icon"] = "-inv_summerfest_firespirit",
                    ["id"] = 642,
                    ["name"] = "AN_MIDSUMMER_FLAME_KEEPER_ALLIANCE",
                    ["points"] = 10,
                },
            },
        },
        [643] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 31,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 25740,
                    },
                    ["id"] = 6430,
                    ["name"] = "",
                    ["type"] = 1,
                },
            },
            ["description"] = "AD_MIDSUMMER_AHUNE",
            ["icon"] = "-spell_frost_summonwaterelemental",
            ["id"] = 643,
            ["name"] = "AN_MIDSUMMER_AHUNE",
            ["points"] = 10,
        },
        [644] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 26,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 645,
                    },
                    ["id"] = 6440,
                    ["name"] = "AN_BREWFEST_WOLPERTINGER",
                    ["type"] = 20,
                },
                [2] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 646,
                    },
                    ["id"] = 6441,
                    ["name"] = "AN_BREWFEST_COREN_DIREBREW",
                    ["type"] = 20,
                },
                [3] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 647,
                    },
                    ["id"] = 6442,
                    ["name"] = "AN_BREWFEST_QUEST1",
                    ["type"] = 20,
                },
                [4] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 648,
                    },
                    ["id"] = 6443,
                    ["name"] = "AN_BREWFEST_MOUNT",
                    ["type"] = 20,
                },
                [5] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 649,
                    },
                    ["id"] = 6444,
                    ["name"] = "AN_BREWFEST_BEER_CLUB",
                    ["type"] = 20,
                },
            },
            ["description"] = "AD_BREWFEST",
            ["icon"] = "achievement_worldevent_brewmaster",
            ["id"] = 644,
            ["name"] = "AN_BREWFEST",
            ["points"] = 10,
            ["rewardText"] = "TITLE_BUILTIN_BREWMASTER_LABEL",
        },
        [645] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 32,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 32233,
                    },
                    ["id"] = 6450,
                    ["name"] = "",
                    ["type"] = 5,
                },
            },
            ["description"] = "AD_BREWFEST_WOLPERTINGER",
            ["icon"] = "-inv_drink_13",
            ["id"] = 645,
            ["name"] = "AN_BREWFEST_WOLPERTINGER",
            ["points"] = 10,
        },
        [646] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 32,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 23872,
                    },
                    ["id"] = 6460,
                    ["name"] = "",
                    ["type"] = 1,
                },
            },
            ["description"] = "AD_BREWFEST_COREN_DIREBREW",
            ["icon"] = "-inv_misc_head_dwarf_01",
            ["id"] = 646,
            ["name"] = "AN_BREWFEST_COREN_DIREBREW",
            ["points"] = 10,
        },
        [647] = {
            ["selectors"] = {
                ["A:DRUID"] = 2,
                ["A:HUNTER"] = 2,
                ["A:MAGE"] = 2,
                ["A:PALADIN"] = 2,
                ["A:PRIEST"] = 2,
                ["A:ROGUE"] = 2,
                ["A:SHAMAN"] = 2,
                ["A:WARLOCK"] = 2,
                ["A:WARRIOR"] = 2,
                ["H:DRUID"] = 1,
                ["H:HUNTER"] = 1,
                ["H:MAGE"] = 1,
                ["H:PALADIN"] = 1,
                ["H:PRIEST"] = 1,
                ["H:ROGUE"] = 1,
                ["H:SHAMAN"] = 1,
                ["H:WARLOCK"] = 1,
                ["H:WARRIOR"] = 1,
            },
            ["variants"] = {
                [1] = {
                    ["anyCompletable"] = false,
                    ["categoryID"] = 32,
                    ["criteria"] = {
                        [1] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 12192,
                            },
                            ["id"] = 6470,
                            ["name"] = "",
                            ["type"] = 3,
                        },
                    },
                    ["description"] = "AD_BREWFEST_QUEST1",
                    ["icon"] = "-inv_ore_mithril_01",
                    ["id"] = 647,
                    ["name"] = "AN_BREWFEST_QUEST1",
                    ["points"] = 10,
                },
                [2] = {
                    ["anyCompletable"] = false,
                    ["categoryID"] = 32,
                    ["criteria"] = {
                        [1] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 12020,
                            },
                            ["id"] = 6470,
                            ["name"] = "",
                            ["type"] = 3,
                        },
                    },
                    ["description"] = "AD_BREWFEST_QUEST1",
                    ["icon"] = "-inv_ore_mithril_01",
                    ["id"] = 647,
                    ["name"] = "AN_BREWFEST_QUEST1",
                    ["points"] = 10,
                },
            },
        },
        [648] = {
            ["selectors"] = {
                ["A:DRUID"] = 2,
                ["A:HUNTER"] = 2,
                ["A:MAGE"] = 2,
                ["A:PALADIN"] = 2,
                ["A:PRIEST"] = 2,
                ["A:ROGUE"] = 2,
                ["A:SHAMAN"] = 2,
                ["A:WARLOCK"] = 2,
                ["A:WARRIOR"] = 2,
                ["H:DRUID"] = 1,
                ["H:HUNTER"] = 1,
                ["H:MAGE"] = 1,
                ["H:PALADIN"] = 1,
                ["H:PRIEST"] = 1,
                ["H:ROGUE"] = 1,
                ["H:SHAMAN"] = 1,
                ["H:WARLOCK"] = 1,
                ["H:WARRIOR"] = 1,
            },
            ["variants"] = {
                [1] = {
                    ["anyCompletable"] = false,
                    ["categoryID"] = 32,
                    ["criteria"] = {
                        [1] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 37828,
                            },
                            ["id"] = 6480,
                            ["name"] = "",
                            ["type"] = 5,
                        },
                    },
                    ["description"] = "AD_BREWFEST_MOUNT",
                    ["icon"] = "-inv_cask_01",
                    ["id"] = 648,
                    ["name"] = "AN_BREWFEST_MOUNT",
                    ["points"] = 10,
                },
                [2] = {
                    ["anyCompletable"] = false,
                    ["categoryID"] = 32,
                    ["criteria"] = {
                        [1] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 33977,
                            },
                            ["id"] = 6480,
                            ["name"] = "",
                            ["type"] = 5,
                        },
                    },
                    ["description"] = "AD_BREWFEST_MOUNT",
                    ["icon"] = "-inv_cask_01",
                    ["id"] = 648,
                    ["name"] = "AN_BREWFEST_MOUNT",
                    ["points"] = 10,
                },
            },
        },
        [649] = {
            ["selectors"] = {
                ["A:DRUID"] = 2,
                ["A:HUNTER"] = 2,
                ["A:MAGE"] = 2,
                ["A:PALADIN"] = 2,
                ["A:PRIEST"] = 2,
                ["A:ROGUE"] = 2,
                ["A:SHAMAN"] = 2,
                ["A:WARLOCK"] = 2,
                ["A:WARRIOR"] = 2,
                ["H:DRUID"] = 1,
                ["H:HUNTER"] = 1,
                ["H:MAGE"] = 1,
                ["H:PALADIN"] = 1,
                ["H:PRIEST"] = 1,
                ["H:ROGUE"] = 1,
                ["H:SHAMAN"] = 1,
                ["H:WARLOCK"] = 1,
                ["H:WARRIOR"] = 1,
            },
            ["variants"] = {
                [1] = {
                    ["anyCompletable"] = false,
                    ["categoryID"] = 32,
                    ["criteria"] = {
                        [1] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 12421,
                            },
                            ["id"] = 6490,
                            ["name"] = "",
                            ["type"] = 3,
                        },
                    },
                    ["description"] = "AD_BREWFEST_BEER_CLUB",
                    ["icon"] = "-inv_misc_beer_02",
                    ["id"] = 649,
                    ["name"] = "AN_BREWFEST_BEER_CLUB",
                    ["points"] = 10,
                },
                [2] = {
                    ["anyCompletable"] = false,
                    ["categoryID"] = 32,
                    ["criteria"] = {
                        [1] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 12420,
                            },
                            ["id"] = 6490,
                            ["name"] = "",
                            ["type"] = 3,
                        },
                    },
                    ["description"] = "AD_BREWFEST_BEER_CLUB",
                    ["icon"] = "-inv_misc_beer_02",
                    ["id"] = 649,
                    ["name"] = "AN_BREWFEST_BEER_CLUB",
                    ["points"] = 10,
                },
            },
        },
        [653] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 1,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = "LOVE",
                        [2] = 22480,
                    },
                    ["id"] = 6531,
                    ["name"] = "NPC_22480",
                    ["type"] = 33,
                },
                [2] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = "LOVE",
                        [2] = 22306,
                    },
                    ["id"] = 6532,
                    ["name"] = "NPC_22306",
                    ["type"] = 33,
                },
                [3] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = "LOVE",
                        [2] = 22842,
                    },
                    ["id"] = 6533,
                    ["name"] = "NPC_22842",
                    ["type"] = 33,
                },
                [4] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = "LOVE",
                        [2] = 22843,
                    },
                    ["id"] = 6534,
                    ["name"] = "NPC_22843",
                    ["type"] = 33,
                },
                [5] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = "LOVE",
                        [2] = 19665,
                    },
                    ["id"] = 6535,
                    ["name"] = "NPC_19665",
                    ["type"] = 33,
                },
                [6] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = "LOVE",
                        [2] = 19154,
                    },
                    ["id"] = 6536,
                    ["name"] = "NPC_19154",
                    ["type"] = 33,
                },
                [7] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = "LOVE",
                        [2] = 19482,
                    },
                    ["id"] = 6537,
                    ["name"] = "NPC_19482",
                    ["type"] = 33,
                },
                [8] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = "LOVE",
                        [2] = 20411,
                    },
                    ["id"] = 6538,
                    ["name"] = "NPC_20411",
                    ["type"] = 33,
                },
            },
            ["description"] = "AD_LOVE_TBC",
            ["icon"] = "inv_jewelcrafting_crimsonhare",
            ["id"] = 653,
            ["name"] = "AN_LOVE_TBC",
            ["points"] = 10,
        },
        [538] = {
            ["anyCompletable"] = false,
            ["categoryID"] = 33,
            ["criteria"] = {
                [1] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 20570,
                    },
                    ["id"] = 1853,
                    ["name"] = {
                        ["itemID"] = 20570,
                    },
                    ["type"] = 5,
                },
                [2] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 20561,
                    },
                    ["id"] = 1854,
                    ["name"] = {
                        ["itemID"] = 20561,
                    },
                    ["type"] = 5,
                },
                [3] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 20391,
                    },
                    ["id"] = 1855,
                    ["name"] = {
                        ["itemID"] = 20391,
                    },
                    ["type"] = 5,
                },
                [4] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 20566,
                    },
                    ["id"] = 1856,
                    ["name"] = {
                        ["itemID"] = 20566,
                    },
                    ["type"] = 5,
                },
                [5] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 20564,
                    },
                    ["id"] = 1857,
                    ["name"] = {
                        ["itemID"] = 20564,
                    },
                    ["type"] = 5,
                },
                [6] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 20572,
                    },
                    ["id"] = 1858,
                    ["name"] = {
                        ["itemID"] = 20572,
                    },
                    ["type"] = 5,
                },
                [7] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 20568,
                    },
                    ["id"] = 1859,
                    ["name"] = {
                        ["itemID"] = 20568,
                    },
                    ["type"] = 5,
                },
                [8] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 20573,
                    },
                    ["id"] = 1860,
                    ["name"] = {
                        ["itemID"] = 20573,
                    },
                    ["type"] = 5,
                },
                [9] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 34000,
                    },
                    ["id"] = 1861,
                    ["name"] = {
                        ["itemID"] = 34000,
                    },
                    ["type"] = 5,
                },
                [10] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 34002,
                    },
                    ["id"] = 1862,
                    ["name"] = {
                        ["itemID"] = 34002,
                    },
                    ["type"] = 5,
                },
                [11] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 20392,
                    },
                    ["id"] = 1863,
                    ["name"] = {
                        ["itemID"] = 20392,
                    },
                    ["type"] = 5,
                },
                [12] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 20569,
                    },
                    ["id"] = 1864,
                    ["name"] = {
                        ["itemID"] = 20569,
                    },
                    ["type"] = 5,
                },
                [13] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 20571,
                    },
                    ["id"] = 1865,
                    ["name"] = {
                        ["itemID"] = 20571,
                    },
                    ["type"] = 5,
                },
                [14] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 20574,
                    },
                    ["id"] = 1866,
                    ["name"] = {
                        ["itemID"] = 20574,
                    },
                    ["type"] = 5,
                },
                [15] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 20565,
                    },
                    ["id"] = 1867,
                    ["name"] = {
                        ["itemID"] = 20565,
                    },
                    ["type"] = 5,
                },
                [16] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 20563,
                    },
                    ["id"] = 1868,
                    ["name"] = {
                        ["itemID"] = 20563,
                    },
                    ["type"] = 5,
                },
                [17] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 20567,
                    },
                    ["id"] = 1869,
                    ["name"] = {
                        ["itemID"] = 20567,
                    },
                    ["type"] = 5,
                },
                [18] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 20562,
                    },
                    ["id"] = 1870,
                    ["name"] = {
                        ["itemID"] = 20562,
                    },
                    ["type"] = 5,
                },
                [19] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 34001,
                    },
                    ["id"] = 1871,
                    ["name"] = {
                        ["itemID"] = 34001,
                    },
                    ["type"] = 5,
                },
                [20] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 34003,
                    },
                    ["id"] = 1872,
                    ["name"] = {
                        ["itemID"] = 34003,
                    },
                    ["type"] = 5,
                },
            },
            ["description"] = "AD_HALLOWSEND_MASKS",
            ["icon"] = "-inv_mask_04",
            ["id"] = 538,
            ["name"] = "AN_HALLOWSEND_MASKS",
            ["points"] = 10,
            ["previousID"] = 537,
        },
    },
    ["achievementPatches"] = {
        [6] = {
            ["nextID"] = 7,
        },
        [8] = {
            ["criteria"] = {
                [1] = {
                    ["quantity"] = 7,
                },
            },
        },
        [16] = {
            ["criteria"] = {
                [1] = {
                    ["data"] = {
                        [2] = 350,
                    },
                },
            },
        },
        [91] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 581,
                },
                [2] = {
                    ["id"] = 946,
                },
                [3] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 139,
                    },
                    ["id"] = 1124,
                    ["name"] = "AN_EXPLORE_OUTLAND",
                    ["type"] = 20,
                },
            },
        },
        [92] = {
            ["criteria"] = {
                [18] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 110,
                    },
                    ["id"] = 551,
                    ["name"] = {
                        ["args"] = {
                            [1] = {
                                ["areaID"] = 3524,
                            },
                        },
                        ["key"] = "AN_EXPLORE",
                    },
                    ["type"] = 20,
                },
                [19] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 111,
                    },
                    ["id"] = 580,
                    ["name"] = {
                        ["args"] = {
                            [1] = {
                                ["areaID"] = 3525,
                            },
                        },
                        ["key"] = "AN_EXPLORE",
                    },
                    ["type"] = 20,
                },
            },
        },
        [112] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 597,
                },
                [2] = {
                    ["id"] = 614,
                },
                [3] = {
                    ["id"] = 629,
                },
                [4] = {
                    ["id"] = 639,
                },
                [5] = {
                    ["id"] = 650,
                },
                [6] = {
                    ["id"] = 654,
                },
                [7] = {
                    ["id"] = 671,
                },
                [8] = {
                    ["id"] = 685,
                },
                [9] = {
                    ["id"] = 708,
                },
                [10] = {
                    ["id"] = 721,
                },
                [11] = {
                    ["id"] = 734,
                },
                [12] = {
                    ["id"] = 746,
                },
                [13] = {
                    ["id"] = 758,
                },
                [14] = {
                    ["id"] = 766,
                },
                [15] = {
                    ["id"] = 782,
                },
                [16] = {
                    ["id"] = 810,
                },
                [17] = {
                    ["id"] = 822,
                },
                [18] = {
                    ["id"] = 837,
                },
                [19] = {
                    ["id"] = 854,
                },
                [20] = {
                    ["id"] = 867,
                },
                [21] = {
                    ["id"] = 882,
                },
                [22] = {
                    ["id"] = 896,
                },
                [23] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 135,
                    },
                    ["id"] = 921,
                    ["name"] = {
                        ["args"] = {
                            [1] = {
                                ["areaID"] = 3430,
                            },
                        },
                        ["key"] = "AN_EXPLORE",
                    },
                    ["type"] = 20,
                },
                [24] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 136,
                    },
                    ["id"] = 938,
                    ["name"] = {
                        ["args"] = {
                            [1] = {
                                ["areaID"] = 3433,
                            },
                        },
                        ["key"] = "AN_EXPLORE",
                    },
                    ["type"] = 20,
                },
                [25] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 137,
                    },
                    ["id"] = 945,
                    ["name"] = {
                        ["args"] = {
                            [1] = {
                                ["areaID"] = 4080,
                            },
                        },
                        ["key"] = "AN_EXPLORE",
                    },
                    ["type"] = 20,
                },
            },
        },
        [113] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 582,
                },
                [2] = {
                    ["id"] = 583,
                },
                [3] = {
                    ["id"] = 584,
                },
                [4] = {
                    ["id"] = 585,
                },
                [5] = {
                    ["id"] = 586,
                },
                [6] = {
                    ["id"] = 587,
                },
                [7] = {
                    ["id"] = 588,
                },
                [8] = {
                    ["id"] = 589,
                },
                [9] = {
                    ["id"] = 590,
                },
                [10] = {
                    ["id"] = 591,
                },
                [11] = {
                    ["id"] = 592,
                },
                [12] = {
                    ["id"] = 593,
                },
                [13] = {
                    ["id"] = 594,
                },
                [14] = {
                    ["id"] = 595,
                },
                [15] = {
                    ["id"] = 596,
                },
            },
        },
        [114] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 598,
                },
                [2] = {
                    ["id"] = 599,
                },
                [3] = {
                    ["id"] = 600,
                },
                [4] = {
                    ["id"] = 601,
                },
                [5] = {
                    ["id"] = 602,
                },
                [6] = {
                    ["id"] = 603,
                },
                [7] = {
                    ["id"] = 604,
                },
                [8] = {
                    ["id"] = 605,
                },
                [9] = {
                    ["id"] = 606,
                },
                [10] = {
                    ["id"] = 607,
                },
                [11] = {
                    ["id"] = 608,
                },
                [12] = {
                    ["id"] = 609,
                },
                [13] = {
                    ["id"] = 610,
                },
                [14] = {
                    ["id"] = 611,
                },
                [15] = {
                    ["id"] = 612,
                },
                [16] = {
                    ["id"] = 613,
                },
            },
        },
        [115] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 615,
                },
                [2] = {
                    ["id"] = 616,
                },
                [3] = {
                    ["id"] = 617,
                },
                [4] = {
                    ["id"] = 618,
                },
                [5] = {
                    ["id"] = 619,
                },
                [6] = {
                    ["id"] = 620,
                },
                [7] = {
                    ["id"] = 621,
                },
                [8] = {
                    ["id"] = 622,
                },
                [9] = {
                    ["id"] = 623,
                },
                [10] = {
                    ["id"] = 624,
                },
                [11] = {
                    ["id"] = 625,
                },
                [12] = {
                    ["id"] = 626,
                },
                [13] = {
                    ["id"] = 627,
                },
                [14] = {
                    ["id"] = 628,
                },
            },
        },
        [116] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 630,
                },
                [2] = {
                    ["id"] = 631,
                },
                [3] = {
                    ["id"] = 632,
                },
                [4] = {
                    ["id"] = 633,
                },
                [5] = {
                    ["id"] = 634,
                },
                [6] = {
                    ["id"] = 635,
                },
                [7] = {
                    ["id"] = 636,
                },
                [8] = {
                    ["id"] = 637,
                },
                [9] = {
                    ["id"] = 638,
                },
            },
        },
        [117] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 640,
                },
                [2] = {
                    ["id"] = 641,
                },
                [3] = {
                    ["id"] = 642,
                },
                [4] = {
                    ["id"] = 643,
                },
                [5] = {
                    ["id"] = 644,
                },
                [6] = {
                    ["id"] = 645,
                },
                [7] = {
                    ["id"] = 646,
                },
                [8] = {
                    ["id"] = 647,
                },
                [9] = {
                    ["id"] = 648,
                },
                [10] = {
                    ["id"] = 649,
                },
            },
        },
        [118] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 651,
                },
                [2] = {
                    ["id"] = 652,
                },
                [3] = {
                    ["id"] = 653,
                },
            },
        },
        [119] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 655,
                },
                [2] = {
                    ["id"] = 656,
                },
                [3] = {
                    ["id"] = 657,
                },
                [4] = {
                    ["id"] = 658,
                },
                [5] = {
                    ["id"] = 659,
                },
                [6] = {
                    ["id"] = 660,
                },
                [7] = {
                    ["id"] = 661,
                },
                [8] = {
                    ["id"] = 662,
                },
                [9] = {
                    ["id"] = 663,
                },
                [10] = {
                    ["id"] = 664,
                },
                [11] = {
                    ["id"] = 665,
                },
                [12] = {
                    ["id"] = 666,
                },
                [13] = {
                    ["id"] = 667,
                },
                [14] = {
                    ["id"] = 668,
                },
                [15] = {
                    ["id"] = 669,
                },
                [16] = {
                    ["id"] = 670,
                },
            },
        },
        [120] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 672,
                },
                [2] = {
                    ["id"] = 673,
                },
                [3] = {
                    ["id"] = 674,
                },
                [4] = {
                    ["id"] = 675,
                },
                [5] = {
                    ["id"] = 676,
                },
                [6] = {
                    ["id"] = 677,
                },
                [7] = {
                    ["id"] = 678,
                },
                [8] = {
                    ["id"] = 679,
                },
                [9] = {
                    ["id"] = 680,
                },
                [10] = {
                    ["id"] = 681,
                },
                [11] = {
                    ["id"] = 682,
                },
                [12] = {
                    ["id"] = 683,
                },
                [13] = {
                    ["id"] = 684,
                },
            },
        },
        [121] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 686,
                },
                [2] = {
                    ["id"] = 687,
                },
                [3] = {
                    ["id"] = 688,
                },
                [4] = {
                    ["id"] = 689,
                },
                [5] = {
                    ["id"] = 690,
                },
                [6] = {
                    ["id"] = 691,
                },
                [7] = {
                    ["id"] = 692,
                },
                [8] = {
                    ["id"] = 693,
                },
                [9] = {
                    ["id"] = 694,
                },
                [10] = {
                    ["id"] = 695,
                },
                [11] = {
                    ["id"] = 696,
                },
                [12] = {
                    ["id"] = 697,
                },
                [13] = {
                    ["id"] = 698,
                },
                [14] = {
                    ["id"] = 699,
                },
                [15] = {
                    ["id"] = 700,
                },
                [16] = {
                    ["id"] = 701,
                },
                [17] = {
                    ["id"] = 702,
                },
                [18] = {
                    ["id"] = 703,
                },
                [19] = {
                    ["id"] = 704,
                },
                [20] = {
                    ["id"] = 705,
                },
                [21] = {
                    ["id"] = 706,
                },
                [22] = {
                    ["id"] = 707,
                },
            },
        },
        [122] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 709,
                },
                [2] = {
                    ["id"] = 710,
                },
                [3] = {
                    ["id"] = 711,
                },
                [4] = {
                    ["id"] = 712,
                },
                [5] = {
                    ["id"] = 713,
                },
                [6] = {
                    ["id"] = 714,
                },
                [7] = {
                    ["id"] = 715,
                },
                [8] = {
                    ["id"] = 716,
                },
                [9] = {
                    ["id"] = 717,
                },
                [10] = {
                    ["id"] = 718,
                },
                [11] = {
                    ["id"] = 719,
                },
                [12] = {
                    ["id"] = 720,
                },
            },
        },
        [123] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 722,
                },
                [2] = {
                    ["id"] = 723,
                },
                [3] = {
                    ["id"] = 724,
                },
                [4] = {
                    ["id"] = 725,
                },
                [5] = {
                    ["id"] = 726,
                },
                [6] = {
                    ["id"] = 727,
                },
                [7] = {
                    ["id"] = 728,
                },
                [8] = {
                    ["id"] = 729,
                },
                [9] = {
                    ["id"] = 730,
                },
                [10] = {
                    ["id"] = 731,
                },
                [11] = {
                    ["id"] = 732,
                },
                [12] = {
                    ["id"] = 733,
                },
            },
        },
        [124] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 735,
                },
                [2] = {
                    ["id"] = 736,
                },
                [3] = {
                    ["id"] = 737,
                },
                [4] = {
                    ["id"] = 738,
                },
                [5] = {
                    ["id"] = 739,
                },
                [6] = {
                    ["id"] = 740,
                },
                [7] = {
                    ["id"] = 741,
                },
                [8] = {
                    ["id"] = 742,
                },
                [9] = {
                    ["id"] = 743,
                },
                [10] = {
                    ["id"] = 744,
                },
                [11] = {
                    ["id"] = 745,
                },
            },
        },
        [125] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 747,
                },
                [2] = {
                    ["id"] = 748,
                },
                [3] = {
                    ["id"] = 749,
                },
                [4] = {
                    ["id"] = 750,
                },
                [5] = {
                    ["id"] = 751,
                },
                [6] = {
                    ["id"] = 752,
                },
                [7] = {
                    ["id"] = 753,
                },
                [8] = {
                    ["id"] = 754,
                },
                [9] = {
                    ["id"] = 755,
                },
                [10] = {
                    ["id"] = 756,
                },
                [11] = {
                    ["id"] = 757,
                },
            },
        },
        [126] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 759,
                },
                [2] = {
                    ["id"] = 760,
                },
                [3] = {
                    ["id"] = 761,
                },
                [4] = {
                    ["id"] = 762,
                },
                [5] = {
                    ["id"] = 763,
                },
                [6] = {
                    ["id"] = 764,
                },
                [7] = {
                    ["id"] = 765,
                },
            },
        },
        [127] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 767,
                },
                [2] = {
                    ["id"] = 768,
                },
                [3] = {
                    ["id"] = 769,
                },
                [4] = {
                    ["id"] = 770,
                },
                [5] = {
                    ["id"] = 771,
                },
                [6] = {
                    ["id"] = 772,
                },
                [7] = {
                    ["id"] = 773,
                },
                [8] = {
                    ["id"] = 774,
                },
                [9] = {
                    ["id"] = 775,
                },
                [10] = {
                    ["id"] = 776,
                },
                [11] = {
                    ["id"] = 777,
                },
                [12] = {
                    ["id"] = 778,
                },
                [13] = {
                    ["id"] = 779,
                },
                [14] = {
                    ["id"] = 780,
                },
                [15] = {
                    ["id"] = 781,
                },
            },
        },
        [128] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 783,
                },
                [2] = {
                    ["id"] = 784,
                },
                [3] = {
                    ["id"] = 785,
                },
                [4] = {
                    ["id"] = 786,
                },
                [5] = {
                    ["id"] = 787,
                },
                [6] = {
                    ["id"] = 788,
                },
                [7] = {
                    ["id"] = 789,
                },
                [8] = {
                    ["id"] = 790,
                },
                [9] = {
                    ["id"] = 791,
                },
                [10] = {
                    ["id"] = 792,
                },
                [11] = {
                    ["id"] = 793,
                },
                [12] = {
                    ["id"] = 794,
                },
                [13] = {
                    ["id"] = 795,
                },
                [14] = {
                    ["id"] = 796,
                },
                [15] = {
                    ["id"] = 797,
                },
                [16] = {
                    ["id"] = 798,
                },
                [17] = {
                    ["id"] = 799,
                },
                [18] = {
                    ["id"] = 800,
                },
                [19] = {
                    ["id"] = 801,
                },
                [20] = {
                    ["id"] = 802,
                },
                [21] = {
                    ["id"] = 803,
                },
                [22] = {
                    ["id"] = 804,
                },
                [23] = {
                    ["id"] = 805,
                },
                [24] = {
                    ["id"] = 806,
                },
                [25] = {
                    ["id"] = 807,
                },
                [26] = {
                    ["id"] = 808,
                },
                [27] = {
                    ["id"] = 809,
                },
            },
        },
        [129] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 811,
                },
                [2] = {
                    ["id"] = 812,
                },
                [3] = {
                    ["id"] = 813,
                },
                [4] = {
                    ["id"] = 814,
                },
                [5] = {
                    ["id"] = 815,
                },
                [6] = {
                    ["id"] = 816,
                },
                [7] = {
                    ["id"] = 817,
                },
                [8] = {
                    ["id"] = 818,
                },
                [9] = {
                    ["id"] = 819,
                },
                [10] = {
                    ["id"] = 820,
                },
                [11] = {
                    ["id"] = 821,
                },
            },
        },
        [130] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 823,
                },
                [2] = {
                    ["id"] = 824,
                },
                [3] = {
                    ["id"] = 825,
                },
                [4] = {
                    ["id"] = 826,
                },
                [5] = {
                    ["id"] = 827,
                },
                [6] = {
                    ["id"] = 828,
                },
                [7] = {
                    ["id"] = 829,
                },
                [8] = {
                    ["id"] = 830,
                },
                [9] = {
                    ["id"] = 831,
                },
                [10] = {
                    ["id"] = 832,
                },
                [11] = {
                    ["id"] = 833,
                },
                [12] = {
                    ["id"] = 834,
                },
                [13] = {
                    ["id"] = 835,
                },
                [14] = {
                    ["id"] = 836,
                },
            },
        },
        [131] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 838,
                },
                [2] = {
                    ["id"] = 839,
                },
                [3] = {
                    ["id"] = 840,
                },
                [4] = {
                    ["id"] = 841,
                },
                [5] = {
                    ["id"] = 842,
                },
                [6] = {
                    ["id"] = 843,
                },
                [7] = {
                    ["id"] = 844,
                },
                [8] = {
                    ["id"] = 845,
                },
                [9] = {
                    ["id"] = 846,
                },
                [10] = {
                    ["id"] = 847,
                },
                [11] = {
                    ["id"] = 848,
                },
                [12] = {
                    ["id"] = 849,
                },
                [13] = {
                    ["id"] = 850,
                },
                [14] = {
                    ["id"] = 851,
                },
                [15] = {
                    ["id"] = 852,
                },
                [16] = {
                    ["id"] = 853,
                },
            },
        },
        [132] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 855,
                },
                [2] = {
                    ["id"] = 856,
                },
                [3] = {
                    ["id"] = 857,
                },
                [4] = {
                    ["id"] = 858,
                },
                [5] = {
                    ["id"] = 859,
                },
                [6] = {
                    ["id"] = 860,
                },
                [7] = {
                    ["id"] = 861,
                },
                [8] = {
                    ["id"] = 862,
                },
                [9] = {
                    ["id"] = 863,
                },
                [10] = {
                    ["id"] = 864,
                },
                [11] = {
                    ["id"] = 865,
                },
                [12] = {
                    ["id"] = 866,
                },
            },
        },
        [133] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 868,
                },
                [2] = {
                    ["id"] = 869,
                },
                [3] = {
                    ["id"] = 870,
                },
                [4] = {
                    ["id"] = 871,
                },
                [5] = {
                    ["id"] = 872,
                },
                [6] = {
                    ["id"] = 873,
                },
                [7] = {
                    ["id"] = 874,
                },
                [8] = {
                    ["id"] = 875,
                },
                [9] = {
                    ["id"] = 876,
                },
                [10] = {
                    ["id"] = 877,
                },
                [11] = {
                    ["id"] = 878,
                },
                [12] = {
                    ["id"] = 879,
                },
                [13] = {
                    ["id"] = 880,
                },
                [14] = {
                    ["id"] = 881,
                },
            },
        },
        [134] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 883,
                },
                [2] = {
                    ["id"] = 884,
                },
                [3] = {
                    ["id"] = 885,
                },
                [4] = {
                    ["id"] = 886,
                },
                [5] = {
                    ["id"] = 887,
                },
                [6] = {
                    ["id"] = 888,
                },
                [7] = {
                    ["id"] = 889,
                },
                [8] = {
                    ["id"] = 890,
                },
                [9] = {
                    ["id"] = 891,
                },
                [10] = {
                    ["id"] = 892,
                },
                [11] = {
                    ["id"] = 893,
                },
                [12] = {
                    ["id"] = 894,
                },
                [13] = {
                    ["id"] = 895,
                },
            },
        },
        [138] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 947,
                },
                [2] = {
                    ["id"] = 948,
                },
                [3] = {
                    ["id"] = 949,
                },
                [4] = {
                    ["id"] = 950,
                },
                [5] = {
                    ["id"] = 951,
                },
                [6] = {
                    ["id"] = 952,
                },
                [7] = {
                    ["id"] = 953,
                },
                [8] = {
                    ["id"] = 954,
                },
                [9] = {
                    ["id"] = 955,
                },
                [10] = {
                    ["id"] = 956,
                },
                [11] = {
                    ["id"] = 957,
                },
                [12] = {
                    ["id"] = 958,
                },
                [13] = {
                    ["id"] = 959,
                },
                [14] = {
                    ["id"] = 960,
                },
                [15] = {
                    ["id"] = 961,
                },
                [16] = {
                    ["id"] = 962,
                },
                [17] = {
                    ["id"] = 963,
                },
                [18] = {
                    ["id"] = 964,
                },
                [19] = {
                    ["id"] = 965,
                },
                [20] = {
                    ["id"] = 966,
                },
                [21] = {
                    ["id"] = 967,
                },
                [22] = {
                    ["id"] = 968,
                },
                [23] = {
                    ["id"] = 969,
                },
                [24] = {
                    ["id"] = 970,
                },
                [25] = {
                    ["id"] = 971,
                },
                [26] = {
                    ["id"] = 972,
                },
                [27] = {
                    ["id"] = 973,
                },
                [28] = {
                    ["id"] = 974,
                },
                [29] = {
                    ["id"] = 975,
                },
                [30] = {
                    ["id"] = 976,
                },
                [31] = {
                    ["id"] = 977,
                },
                [32] = {
                    ["id"] = 978,
                },
                [33] = {
                    ["id"] = 979,
                },
            },
        },
        [163] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1179,
                },
            },
        },
        [164] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1180,
                },
            },
        },
        [165] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1181,
                },
            },
        },
        [166] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1182,
                },
            },
        },
        [167] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1183,
                },
            },
        },
        [168] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1184,
                },
            },
        },
        [169] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1185,
                },
            },
        },
        [170] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1186,
                },
            },
        },
        [171] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1187,
                },
            },
        },
        [172] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1188,
                },
            },
        },
        [173] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1189,
                },
            },
        },
        [174] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1190,
                },
            },
        },
        [175] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1191,
                },
            },
        },
        [176] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1192,
                },
            },
        },
        [177] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1193,
                },
            },
        },
        [178] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1194,
                },
            },
        },
        [179] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1195,
                },
            },
        },
        [180] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1196,
                },
                [2] = {
                    ["id"] = 1197,
                },
                [3] = {
                    ["id"] = 1198,
                },
            },
        },
        [181] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1199,
                },
            },
        },
        [182] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1200,
                },
            },
        },
        [183] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1201,
                },
            },
        },
        [184] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1202,
                },
                [2] = {
                    ["id"] = 1203,
                },
                [3] = {
                    ["id"] = 1204,
                },
            },
        },
        [185] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1205,
                },
            },
        },
        [186] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1206,
                },
            },
        },
        [187] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1207,
                },
            },
        },
        [189] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1209,
                },
                [2] = {
                    ["id"] = 1210,
                },
                [3] = {
                    ["id"] = 1211,
                },
                [4] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 188,
                    },
                    ["id"] = 1212,
                    ["name"] = "AN_VELEN_SLAYER",
                    ["type"] = 20,
                },
            },
        },
        [190] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1213,
                },
            },
        },
        [191] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1214,
                },
            },
        },
        [192] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1215,
                },
            },
        },
        [194] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1217,
                },
                [2] = {
                    ["id"] = 1218,
                },
                [3] = {
                    ["id"] = 1219,
                },
                [4] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 193,
                    },
                    ["id"] = 1220,
                    ["name"] = "AN_LORTHEMAR_SLAYER",
                    ["type"] = 20,
                },
            },
        },
        [195] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1221,
                },
                [2] = {
                    ["id"] = 1222,
                },
                [3] = {
                    ["id"] = 1223,
                },
                [4] = {
                    ["id"] = 1224,
                },
                [5] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = "DRAENEI",
                    },
                    ["id"] = 1225,
                    ["name"] = "AC_DRAENEI_KILLED",
                    ["type"] = 7,
                },
            },
        },
        [196] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1226,
                },
                [2] = {
                    ["id"] = 1227,
                },
                [3] = {
                    ["id"] = 1228,
                },
                [4] = {
                    ["id"] = 1229,
                },
                [5] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = "BLOODELF",
                    },
                    ["id"] = 1230,
                    ["name"] = "AC_BLOODELF_KILLED",
                    ["type"] = 7,
                },
            },
        },
        [197] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1231,
                },
                [2] = {
                    ["id"] = 1232,
                },
                [3] = {
                    ["id"] = 1233,
                },
                [4] = {
                    ["id"] = 1234,
                },
                [5] = {
                    ["id"] = 1235,
                },
                [6] = {
                    ["id"] = 1236,
                },
                [7] = {
                    ["id"] = 1237,
                },
                [8] = {
                    ["id"] = 1238,
                },
                [9] = {
                    ["id"] = 1239,
                },
            },
        },
        [198] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1240,
                },
            },
        },
        [199] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1241,
                },
            },
        },
        [200] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1242,
                },
            },
        },
        [201] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1243,
                },
            },
        },
        [202] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1244,
                },
            },
        },
        [203] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1245,
                },
            },
        },
        [204] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1246,
                },
            },
        },
        [205] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1247,
                },
            },
        },
        [206] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1248,
                },
            },
        },
        [207] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1249,
                },
            },
        },
        [208] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1250,
                },
            },
        },
        [209] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1251,
                },
            },
        },
        [210] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1252,
                },
            },
        },
        [211] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1253,
                },
            },
        },
        [212] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1254,
                },
            },
        },
        [218] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1260,
                },
            },
        },
        [219] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1261,
                },
            },
        },
        [220] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1262,
                },
            },
        },
        [221] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1263,
                },
            },
        },
        [222] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1264,
                },
            },
        },
        [223] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1265,
                },
            },
        },
        [224] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1266,
                },
            },
        },
        [225] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1267,
                },
            },
        },
        [226] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1268,
                },
            },
        },
        [227] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1269,
                },
            },
        },
        [228] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1270,
                },
            },
        },
        [229] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1271,
                },
            },
        },
        [230] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1272,
                },
            },
        },
        [231] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1273,
                },
            },
        },
        [232] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1274,
                },
            },
        },
        [233] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1275,
                },
            },
        },
        [234] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1276,
                },
            },
        },
        [235] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1277,
                },
            },
        },
        [236] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1278,
                },
            },
        },
        [237] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1279,
                },
            },
        },
        [242] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1284,
                },
            },
        },
        [243] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1285,
                },
            },
        },
        [244] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1286,
                },
            },
        },
        [245] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1287,
                },
            },
        },
        [246] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1288,
                },
            },
        },
        [247] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1289,
                },
            },
        },
        [248] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1290,
                },
            },
        },
        [249] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1291,
                },
            },
        },
        [250] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1292,
                },
            },
        },
        [251] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1293,
                },
            },
        },
        [252] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1294,
                },
            },
        },
        [253] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1295,
                },
            },
        },
        [254] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1296,
                },
            },
        },
        [255] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1297,
                },
            },
        },
        [256] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1298,
                },
            },
        },
        [257] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1299,
                },
            },
        },
        [258] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1300,
                },
            },
        },
        [259] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1301,
                },
            },
        },
        [260] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1302,
                },
            },
        },
        [261] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1303,
                },
            },
        },
        [262] = {
            ["variants"] = {
                [1] = {
                    ["criteria"] = {
                        [1] = {
                            ["id"] = 1304,
                        },
                        [2] = {
                            ["id"] = 1305,
                        },
                    },
                },
                [2] = {
                    ["criteria"] = {
                        [1] = {
                            ["id"] = 1304,
                        },
                        [2] = {
                            ["id"] = 1305,
                        },
                    },
                },
            },
        },
        [263] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1306,
                },
            },
        },
        [264] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1307,
                },
            },
        },
        [265] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1308,
                },
            },
        },
        [266] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1309,
                },
            },
        },
        [267] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1310,
                },
            },
        },
        [268] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1311,
                },
            },
        },
        [269] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1312,
                },
            },
        },
        [270] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1313,
                },
            },
        },
        [271] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1314,
                },
            },
        },
        [279] = {
            ["variants"] = {
                [1] = {
                    ["criteria"] = {
                        [1] = {
                            ["id"] = 1323,
                        },
                        [2] = {
                            ["id"] = 1324,
                        },
                        [3] = {
                            ["id"] = 1325,
                        },
                        [4] = {
                            ["id"] = 1326,
                        },
                        [5] = {
                            ["id"] = 1327,
                        },
                        [6] = {
                            ["id"] = 1328,
                        },
                        [7] = {
                            ["id"] = 1329,
                        },
                        [8] = {
                            ["id"] = 1330,
                        },
                        [9] = {
                            ["id"] = 1331,
                        },
                        [10] = {
                            ["id"] = 1332,
                        },
                        [11] = {
                            ["id"] = 1333,
                        },
                    },
                },
                [2] = {
                    ["criteria"] = {
                        [1] = {
                            ["id"] = 1323,
                        },
                        [2] = {
                            ["id"] = 1324,
                        },
                        [3] = {
                            ["id"] = 1325,
                        },
                        [4] = {
                            ["id"] = 1326,
                        },
                        [5] = {
                            ["id"] = 1327,
                        },
                        [6] = {
                            ["id"] = 1328,
                        },
                        [7] = {
                            ["id"] = 1329,
                        },
                        [8] = {
                            ["id"] = 1330,
                        },
                        [9] = {
                            ["id"] = 1331,
                        },
                        [10] = {
                            ["id"] = 1332,
                        },
                        [11] = {
                            ["id"] = 1333,
                        },
                    },
                },
            },
        },
        [280] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1334,
                },
                [2] = {
                    ["id"] = 1335,
                },
                [3] = {
                    ["id"] = 1336,
                },
                [4] = {
                    ["id"] = 1337,
                },
                [5] = {
                    ["id"] = 1338,
                },
                [6] = {
                    ["id"] = 1339,
                },
                [7] = {
                    ["id"] = 1340,
                },
            },
        },
        [281] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1341,
                },
                [2] = {
                    ["id"] = 1342,
                },
                [3] = {
                    ["id"] = 1343,
                },
                [4] = {
                    ["id"] = 1344,
                },
                [5] = {
                    ["id"] = 1345,
                },
                [6] = {
                    ["id"] = 1346,
                },
                [7] = {
                    ["id"] = 1347,
                },
            },
        },
        [283] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1354,
                },
                [2] = {
                    ["id"] = 1355,
                },
                [3] = {
                    ["id"] = 1356,
                },
                [4] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 282,
                    },
                    ["id"] = 1357,
                    ["name"] = "AN_EYE_BOSS",
                    ["type"] = 20,
                },
            },
        },
        [284] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1358,
                },
            },
        },
        [285] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1359,
                },
            },
        },
        [286] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1360,
                },
            },
        },
        [287] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1361,
                },
            },
        },
        [288] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1362,
                },
            },
        },
        [289] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1363,
                },
            },
        },
        [290] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1364,
                },
            },
        },
        [291] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1365,
                },
            },
        },
        [292] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1366,
                },
            },
        },
        [293] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1367,
                },
            },
        },
        [294] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1368,
                },
            },
        },
        [295] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1369,
                },
            },
        },
        [296] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1370,
                },
            },
        },
        [297] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1371,
                },
            },
        },
        [298] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1372,
                },
            },
        },
        [299] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1373,
                },
            },
        },
        [300] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1374,
                },
            },
        },
        [301] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1375,
                },
            },
        },
        [302] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1376,
                },
            },
        },
        [303] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1388,
                },
            },
        },
        [304] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1389,
                },
            },
        },
        [305] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1390,
                },
            },
        },
        [306] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1391,
                },
            },
        },
        [307] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1392,
                },
            },
        },
        [308] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1393,
                },
            },
        },
        [309] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1394,
                },
            },
        },
        [310] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1395,
                },
            },
        },
        [311] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1396,
                },
                [2] = {
                    ["id"] = 1397,
                },
                [3] = {
                    ["id"] = 1398,
                },
                [4] = {
                    ["id"] = 1399,
                },
                [5] = {
                    ["id"] = 1400,
                },
            },
        },
        [312] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1401,
                },
            },
        },
        [313] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1402,
                },
            },
        },
        [314] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1403,
                },
            },
        },
        [315] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1404,
                },
            },
        },
        [316] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1405,
                },
            },
        },
        [317] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1406,
                },
            },
        },
        [318] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1407,
                },
                [2] = {
                    ["id"] = 1408,
                },
                [3] = {
                    ["id"] = 1409,
                },
                [4] = {
                    ["id"] = 1410,
                },
                [5] = {
                    ["id"] = 1411,
                },
                [6] = {
                    ["id"] = 1412,
                },
                [7] = {
                    ["id"] = 1413,
                },
            },
        },
        [319] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1414,
                },
                [2] = {
                    ["id"] = 1415,
                },
                [3] = {
                    ["id"] = 1416,
                },
                [4] = {
                    ["id"] = 1417,
                },
            },
        },
        [320] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1418,
                },
            },
        },
        [321] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1419,
                },
                [2] = {
                    ["id"] = 1420,
                },
                [3] = {
                    ["id"] = 1421,
                },
                [4] = {
                    ["id"] = 1422,
                },
            },
        },
        [322] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1423,
                },
            },
        },
        [323] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1424,
                },
            },
        },
        [324] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1425,
                },
                [2] = {
                    ["id"] = 1426,
                },
            },
        },
        [325] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1427,
                },
                [2] = {
                    ["id"] = 1428,
                },
                [3] = {
                    ["id"] = 1429,
                },
            },
        },
        [326] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1430,
                },
                [2] = {
                    ["id"] = 1431,
                },
            },
        },
        [327] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1432,
                },
                [2] = {
                    ["id"] = 1433,
                },
            },
        },
        [328] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1434,
                },
                [2] = {
                    ["id"] = 1435,
                },
                [3] = {
                    ["id"] = 1436,
                },
                [4] = {
                    ["id"] = 1437,
                },
                [5] = {
                    ["id"] = 1438,
                },
                [6] = {
                    ["id"] = 1439,
                },
                [7] = {
                    ["id"] = 1440,
                },
                [8] = {
                    ["id"] = 1441,
                },
                [9] = {
                    ["id"] = 1442,
                },
                [10] = {
                    ["id"] = 1443,
                },
                [11] = {
                    ["id"] = 1444,
                },
                [12] = {
                    ["id"] = 1445,
                },
                [13] = {
                    ["id"] = 1446,
                },
                [14] = {
                    ["id"] = 1447,
                },
            },
        },
        [329] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1448,
                },
                [2] = {
                    ["id"] = 1449,
                },
                [3] = {
                    ["id"] = 1450,
                },
                [4] = {
                    ["id"] = 1451,
                },
                [5] = {
                    ["id"] = 1452,
                },
                [6] = {
                    ["id"] = 1453,
                },
            },
        },
        [330] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1454,
                },
            },
        },
        [331] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1455,
                },
            },
        },
        [332] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1456,
                },
            },
        },
        [333] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1457,
                },
            },
        },
        [334] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1458,
                },
            },
        },
        [335] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1459,
                },
            },
        },
        [336] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1460,
                },
                [2] = {
                    ["id"] = 1461,
                },
                [3] = {
                    ["id"] = 1462,
                },
            },
        },
        [337] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1463,
                },
                [2] = {
                    ["id"] = 1464,
                },
                [3] = {
                    ["id"] = 1465,
                },
            },
        },
        [338] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1466,
                },
                [2] = {
                    ["id"] = 1467,
                },
                [3] = {
                    ["id"] = 1468,
                },
            },
        },
        [339] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1469,
                },
                [2] = {
                    ["id"] = 1470,
                },
                [3] = {
                    ["id"] = 1471,
                },
                [4] = {
                    ["id"] = 1472,
                },
            },
        },
        [340] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1473,
                },
            },
        },
        [341] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1475,
                },
                [2] = {
                    ["id"] = 1476,
                },
                [3] = {
                    ["id"] = 1477,
                },
                [4] = {
                    ["id"] = 1478,
                },
                [5] = {
                    ["id"] = 1479,
                },
                [6] = {
                    ["id"] = 1480,
                },
            },
        },
        [342] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1481,
                },
                [2] = {
                    ["id"] = 1482,
                },
                [3] = {
                    ["id"] = 1483,
                },
            },
        },
        [343] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1484,
                },
                [2] = {
                    ["id"] = 1485,
                },
                [3] = {
                    ["id"] = 1486,
                },
                [4] = {
                    ["id"] = 1487,
                },
            },
        },
        [344] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1488,
                },
                [2] = {
                    ["id"] = 1489,
                },
                [3] = {
                    ["id"] = 1490,
                },
                [4] = {
                    ["id"] = 1491,
                },
                [5] = {
                    ["id"] = 1492,
                },
            },
        },
        [345] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1493,
                },
                [2] = {
                    ["id"] = 1494,
                },
            },
        },
        [346] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1495,
                },
            },
        },
        [347] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1496,
                },
            },
        },
        [348] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1497,
                },
            },
        },
        [349] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1498,
                },
            },
        },
        [350] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1499,
                },
            },
        },
        [351] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1500,
                },
            },
        },
        [352] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1501,
                },
                [2] = {
                    ["id"] = 1502,
                },
                [3] = {
                    ["id"] = 1503,
                },
                [4] = {
                    ["id"] = 1504,
                },
            },
        },
        [353] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1505,
                },
            },
        },
        [354] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1506,
                },
            },
        },
        [355] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1507,
                },
            },
        },
        [356] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1508,
                },
            },
        },
        [357] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1509,
                },
            },
        },
        [358] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1510,
                },
            },
        },
        [359] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1511,
                },
            },
        },
        [414] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1623,
                },
            },
        },
        [415] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1624,
                },
            },
        },
        [416] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1625,
                },
            },
        },
        [417] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1626,
                },
            },
            ["nextID"] = 418,
        },
        [419] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1628,
                },
            },
            ["nextID"] = 420,
        },
        [421] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1630,
                },
            },
        },
        [422] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1631,
                },
            },
        },
        [423] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1632,
                },
            },
        },
        [424] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1633,
                },
            },
            ["nextID"] = 434,
        },
        [425] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1635,
                },
            },
        },
        [426] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1636,
                },
            },
        },
        [427] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1637,
                },
            },
        },
        [428] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1638,
                },
            },
            ["nextID"] = 435,
        },
        [429] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1640,
                },
            },
        },
        [430] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1641,
                },
            },
        },
        [431] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1642,
                },
            },
        },
        [432] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1643,
                },
            },
            ["nextID"] = 436,
        },
        [433] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1645,
                },
                [2] = {
                    ["id"] = 1646,
                },
                [3] = {
                    ["id"] = 1647,
                },
            },
            ["nextID"] = 437,
        },
        [438] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1657,
                },
                [2] = {
                    ["id"] = 1658,
                },
            },
            ["nextID"] = 439,
        },
        [440] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1661,
                },
            },
        },
        [441] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1662,
                },
            },
        },
        [444] = {
            ["criteria"] = {
                [1] = {
                    ["data"] = {
                        [1] = {
                            ["id"] = 1665,
                        },
                        [2] = {
                            ["id"] = 1666,
                        },
                    },
                    ["id"] = 1667,
                },
            },
        },
        [445] = {
            ["criteria"] = {
                [1] = {
                    ["data"] = {
                        [1] = {
                            ["id"] = 1668,
                        },
                        [2] = {
                            ["id"] = 1669,
                        },
                        [3] = {
                            ["id"] = 1670,
                        },
                    },
                    ["id"] = 1671,
                },
            },
        },
        [446] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1672,
                },
                [2] = {
                    ["id"] = 1673,
                },
                [3] = {
                    ["id"] = 1674,
                },
                [4] = {
                    ["id"] = 1675,
                },
                [5] = {
                    ["id"] = 1676,
                },
                [6] = {
                    ["id"] = 1677,
                },
                [7] = {
                    ["id"] = 1678,
                },
                [8] = {
                    ["id"] = 1679,
                },
                [9] = {
                    ["id"] = 1680,
                },
                [10] = {
                    ["id"] = 1681,
                },
                [11] = {
                    ["id"] = 1682,
                },
                [12] = {
                    ["id"] = 1683,
                },
                [13] = {
                    ["id"] = 1684,
                },
                [14] = {
                    ["id"] = 1685,
                },
                [15] = {
                    ["id"] = 1686,
                },
                [16] = {
                    ["id"] = 1687,
                },
                [17] = {
                    ["id"] = 1688,
                },
                [18] = {
                    ["id"] = 1689,
                },
                [19] = {
                    ["id"] = 1690,
                },
                [20] = {
                    ["id"] = 1691,
                },
                [21] = {
                    ["id"] = 1692,
                },
                [22] = {
                    ["id"] = 1693,
                },
                [23] = {
                    ["id"] = 1694,
                },
                [24] = {
                    ["id"] = 1695,
                },
                [25] = {
                    ["id"] = 1696,
                },
                [26] = {
                    ["id"] = 1697,
                },
                [27] = {
                    ["id"] = 1698,
                },
                [28] = {
                    ["id"] = 1699,
                },
            },
        },
        [447] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1700,
                },
            },
        },
        [448] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1701,
                },
                [2] = {
                    ["id"] = 1702,
                },
                [3] = {
                    ["id"] = 1703,
                },
            },
        },
        [449] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1704,
                },
            },
        },
        [450] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1705,
                },
            },
        },
        [451] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1706,
                },
                [2] = {
                    ["id"] = 1707,
                },
                [3] = {
                    ["id"] = 1708,
                },
            },
        },
        [452] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1709,
                },
                [2] = {
                    ["id"] = 1710,
                },
                [3] = {
                    ["id"] = 1711,
                },
                [4] = {
                    ["id"] = 1712,
                },
                [5] = {
                    ["id"] = 1713,
                },
            },
        },
        [453] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1714,
                },
                [2] = {
                    ["id"] = 1715,
                },
                [3] = {
                    ["id"] = 1716,
                },
                [4] = {
                    ["id"] = 1717,
                },
                [5] = {
                    ["id"] = 1718,
                },
                [6] = {
                    ["id"] = 1719,
                },
            },
        },
        [454] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1720,
                },
                [2] = {
                    ["id"] = 1721,
                },
                [3] = {
                    ["id"] = 1722,
                },
                [4] = {
                    ["id"] = 1723,
                },
                [5] = {
                    ["id"] = 1724,
                },
                [6] = {
                    ["id"] = 1725,
                },
                [7] = {
                    ["id"] = 1726,
                },
            },
        },
        [455] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1727,
                },
                [2] = {
                    ["id"] = 1728,
                },
                [3] = {
                    ["id"] = 1729,
                },
                [4] = {
                    ["id"] = 1730,
                },
            },
        },
        [457] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1767,
                },
            },
        },
        [458] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1768,
                },
            },
        },
        [459] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1769,
                },
            },
        },
        [460] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1770,
                },
            },
        },
        [461] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1771,
                },
            },
        },
        [462] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1772,
                },
            },
        },
        [463] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1773,
                },
            },
        },
        [464] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1774,
                },
            },
        },
        [465] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1775,
                },
            },
        },
        [466] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1776,
                },
                [2] = {
                    ["id"] = 1777,
                },
                [3] = {
                    ["id"] = 1778,
                },
                [4] = {
                    ["id"] = 1779,
                },
            },
        },
        [468] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1982,
                },
            },
        },
        [469] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1983,
                },
            },
        },
        [470] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1984,
                },
            },
        },
        [471] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1985,
                },
            },
        },
        [472] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1986,
                },
            },
        },
        [473] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1987,
                },
            },
        },
        [474] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1988,
                },
            },
        },
        [475] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1989,
                },
                [2] = {
                    ["id"] = 1990,
                },
                [3] = {
                    ["id"] = 1991,
                },
                [4] = {
                    ["id"] = 1992,
                },
                [5] = {
                    ["id"] = 1993,
                },
            },
        },
        [476] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1994,
                },
                [2] = {
                    ["id"] = 1995,
                },
                [3] = {
                    ["id"] = 1996,
                },
                [4] = {
                    ["id"] = 1997,
                },
                [5] = {
                    ["id"] = 1998,
                },
            },
        },
        [477] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1999,
                },
            },
        },
        [478] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 2000,
                },
            },
        },
        [479] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 2001,
                },
            },
        },
        [480] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 2002,
                },
            },
        },
        [481] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 2003,
                },
            },
        },
        [482] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 2004,
                },
            },
        },
        [483] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 2005,
                },
            },
        },
        [484] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 2006,
                },
            },
        },
        [500] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 2039,
                },
            },
        },
        [501] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 2040,
                },
            },
        },
        [502] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 2041,
                },
            },
        },
        [503] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 2042,
                },
            },
        },
        [504] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 2043,
                },
            },
        },
        [505] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 2044,
                },
            },
        },
        [506] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 2045,
                },
            },
        },
        [507] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 2046,
                },
            },
        },
        [508] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 2047,
                },
            },
        },
        [516] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1731,
                },
            },
        },
        [517] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1732,
                },
            },
        },
        [518] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1733,
                },
            },
        },
        [519] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1734,
                },
            },
        },
        [520] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1735,
                },
            },
        },
        [521] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1736,
                },
            },
        },
        [523] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 2048,
                },
            },
        },
        [524] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 2049,
                },
            },
        },
        [525] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 2050,
                },
            },
        },
        [531] = {
            ["variants"] = {
                [1] = {
                    ["criteria"] = {
                        [1] = {
                            ["id"] = 1820,
                        },
                        [2] = {
                            ["id"] = 1825,
                        },
                        [3] = {
                            ["id"] = 1827,
                        },
                        [4] = {
                            ["id"] = 1829,
                        },
                        [5] = {
                            ["id"] = 1831,
                        },
                        [6] = {
                            ["id"] = 1880,
                        },
                    },
                },
                [2] = {
                    ["criteria"] = {
                        [1] = {
                            ["id"] = 1820,
                        },
                        [2] = {
                            ["id"] = 1825,
                        },
                        [3] = {
                            ["id"] = 1827,
                        },
                        [4] = {
                            ["id"] = 1829,
                        },
                        [5] = {
                            ["id"] = 1831,
                        },
                        [6] = {
                            ["id"] = 1880,
                        },
                    },
                },
            },
        },
        [532] = {
            ["variants"] = {
                [1] = {
                    ["criteria"] = {
                        [1] = {
                            ["id"] = 1818,
                        },
                        [2] = {
                            ["id"] = 1819,
                        },
                    },
                },
                [2] = {
                    ["criteria"] = {
                        [1] = {
                            ["id"] = 1818,
                        },
                        [2] = {
                            ["id"] = 1819,
                        },
                    },
                },
            },
        },
        [533] = {
            ["variants"] = {
                [1] = {
                    ["criteria"] = {
                        [1] = {
                            ["id"] = 1821,
                        },
                        [2] = {
                            ["id"] = 1822,
                        },
                        [3] = {
                            ["id"] = 1823,
                        },
                        [4] = {
                            ["id"] = 1824,
                        },
                    },
                },
                [2] = {
                    ["criteria"] = {
                        [1] = {
                            ["id"] = 1821,
                        },
                        [2] = {
                            ["id"] = 1822,
                        },
                        [3] = {
                            ["id"] = 1823,
                        },
                        [4] = {
                            ["id"] = 1824,
                        },
                    },
                },
            },
        },
        [534] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1826,
                },
            },
        },
        [535] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1828,
                },
            },
        },
        [536] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1830,
                },
            },
        },
        [537] = {
            ["criteria"] = {
                [1] = {
                    ["data"] = {
                        [1] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 20570,
                            },
                            ["id"] = 1832,
                            ["name"] = "",
                            ["type"] = 5,
                        },
                        [2] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 20561,
                            },
                            ["id"] = 1833,
                            ["name"] = "",
                            ["type"] = 5,
                        },
                        [3] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 20391,
                            },
                            ["id"] = 1834,
                            ["name"] = "",
                            ["type"] = 5,
                        },
                        [4] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 20566,
                            },
                            ["id"] = 1835,
                            ["name"] = "",
                            ["type"] = 5,
                        },
                        [5] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 20564,
                            },
                            ["id"] = 1836,
                            ["name"] = "",
                            ["type"] = 5,
                        },
                        [6] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 20572,
                            },
                            ["id"] = 1837,
                            ["name"] = "",
                            ["type"] = 5,
                        },
                        [7] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 20568,
                            },
                            ["id"] = 1838,
                            ["name"] = "",
                            ["type"] = 5,
                        },
                        [8] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 20573,
                            },
                            ["id"] = 1839,
                            ["name"] = "",
                            ["type"] = 5,
                        },
                        [9] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 34000,
                            },
                            ["id"] = 1840,
                            ["name"] = "",
                            ["type"] = 5,
                        },
                        [10] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 34002,
                            },
                            ["id"] = 1841,
                            ["name"] = "",
                            ["type"] = 5,
                        },
                        [11] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 20392,
                            },
                            ["id"] = 1842,
                            ["name"] = "",
                            ["type"] = 5,
                        },
                        [12] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 20569,
                            },
                            ["id"] = 1843,
                            ["name"] = "",
                            ["type"] = 5,
                        },
                        [13] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 20571,
                            },
                            ["id"] = 1844,
                            ["name"] = "",
                            ["type"] = 5,
                        },
                        [14] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 20574,
                            },
                            ["id"] = 1845,
                            ["name"] = "",
                            ["type"] = 5,
                        },
                        [15] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 20565,
                            },
                            ["id"] = 1846,
                            ["name"] = "",
                            ["type"] = 5,
                        },
                        [16] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 20563,
                            },
                            ["id"] = 1847,
                            ["name"] = "",
                            ["type"] = 5,
                        },
                        [17] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 20567,
                            },
                            ["id"] = 1848,
                            ["name"] = "",
                            ["type"] = 5,
                        },
                        [18] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 20562,
                            },
                            ["id"] = 1849,
                            ["name"] = "",
                            ["type"] = 5,
                        },
                        [19] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 34001,
                            },
                            ["id"] = 1850,
                            ["name"] = "",
                            ["type"] = 5,
                        },
                        [20] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 34003,
                            },
                            ["id"] = 1851,
                            ["name"] = "",
                            ["type"] = 5,
                        },
                    },
                    ["id"] = 1852,
                },
            },
        },

        [539] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1873,
                },
                [2] = {
                    ["id"] = 1874,
                },
                [3] = {
                    ["id"] = 1875,
                },
                [4] = {
                    ["id"] = 1876,
                },
                [5] = {
                    ["id"] = 1877,
                },
                [6] = {
                    ["id"] = 1878,
                },
                [7] = {
                    ["id"] = 1879,
                },
            },
        },
        [540] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1474,
                },
            },
        },
        [541] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1882,
                },
                [2] = {
                    ["id"] = 1884,
                },
                [3] = {
                    ["id"] = 1886,
                },
                [4] = {
                    ["id"] = 1889,
                },
                [5] = {
                    ["id"] = 1893,
                },
                [6] = {
                    ["id"] = 1895,
                },
            },
        },
        [542] = {
            ["variants"] = {
                [1] = {
                    ["criteria"] = {
                        [1] = {
                            ["id"] = 1881,
                        },
                    },
                },
                [2] = {
                    ["criteria"] = {
                        [1] = {
                            ["id"] = 1881,
                        },
                    },
                },
            },
        },
        [543] = {
            ["variants"] = {
                [1] = {
                    ["criteria"] = {
                        [1] = {
                            ["id"] = 1883,
                        },
                    },
                },
                [2] = {
                    ["criteria"] = {
                        [1] = {
                            ["id"] = 1883,
                        },
                    },
                },
            },
        },
        [544] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1887,
                },
                [2] = {
                    ["id"] = 1888,
                },
            },
        },
        [545] = {
            ["criteria"] = {
                [1] = {
                    ["data"] = {
                        [1] = {
                            ["id"] = 1890,
                        },
                        [2] = {
                            ["id"] = 1891,
                        },
                    },
                    ["id"] = 1892,
                },
            },
        },
        [546] = {
            ["variants"] = {
                [1] = {
                    ["criteria"] = {
                        [1] = {
                            ["id"] = 1885,
                        },
                    },
                },
                [2] = {
                    ["criteria"] = {
                        [1] = {
                            ["id"] = 1885,
                        },
                    },
                },
            },
        },
        [552] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1757,
                },
                [2] = {
                    ["id"] = 1758,
                },
            },
        },
        [561] = {
            ["variants"] = {
                [1] = {
                    ["criteria"] = {
                        [1] = {
                            ["id"] = 2051,
                        },
                    },
                },
                [2] = {
                    ["criteria"] = {
                        [1] = {
                            ["id"] = 2051,
                        },
                    },
                },
            },
        },
        [562] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1512,
                },
            },
        },
        [563] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1513,
                },
            },
        },
        [565] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1514,
                },
            },
        },
        [566] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1894,
                },
            },
        },
        [576] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 2007,
                },
            },
        },
        [577] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1322,
                },
            },
        },
        [605] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1897,
                },
                [2] = {
                    ["id"] = 1899,
                },
                [3] = {
                    ["id"] = 1904,
                },
                [4] = {
                    ["id"] = 1906,
                },
                [5] = {
                    ["id"] = 1908,
                },
            },
        },
        [606] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1896,
                },
            },
        },
        [607] = {
            ["variants"] = {
                [1] = {
                    ["criteria"] = {
                        [1] = {
                            ["id"] = 1898,
                        },
                    },
                },
                [2] = {
                    ["criteria"] = {
                        [1] = {
                            ["id"] = 1898,
                        },
                    },
                },
            },
        },
        [608] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1900,
                },
                [2] = {
                    ["id"] = 1901,
                },
                [3] = {
                    ["id"] = 1902,
                },
                [4] = {
                    ["id"] = 1903,
                },
            },
        },
        [609] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1905,
                },
            },
        },
        [610] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1907,
                },
            },
        },
        [611] = {
            ["variants"] = {
                [1] = {
                    ["criteria"] = {
                        [1] = {
                            ["id"] = 1914,
                        },
                        [2] = {
                            ["id"] = 1916,
                        },
                        [3] = {
                            ["id"] = 1924,
                        },
                        [4] = {
                            ["id"] = 1931,
                        },
                        [5] = {
                            ["id"] = 1935,
                        },
                        [6] = {
                            ["id"] = 1953,
                        },
                        [7] = {
                            ["id"] = 1975,
                        },
                    },
                },
                [2] = {
                    ["criteria"] = {
                        [1] = {
                            ["id"] = 1914,
                        },
                        [2] = {
                            ["id"] = 1916,
                        },
                        [3] = {
                            ["id"] = 1924,
                        },
                        [4] = {
                            ["id"] = 1931,
                        },
                        [5] = {
                            ["id"] = 1935,
                        },
                        [6] = {
                            ["id"] = 1953,
                        },
                        [7] = {
                            ["id"] = 1975,
                        },
                    },
                },
            },
        },
        [612] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1909,
                },
            },
        },
        [613] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1910,
                },
            },
        },
        [614] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1911,
                },
            },
        },
        [615] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1912,
                },
            },
        },
        [616] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1913,
                },
            },
        },
        [617] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1915,
                },
            },
        },
        [618] = {
            ["criteria"] = {
                [1] = {
                    ["data"] = {
                        [1] = {
                            ["id"] = 1917,
                        },
                        [2] = {
                            ["id"] = 1918,
                        },
                        [3] = {
                            ["id"] = 1919,
                        },
                        [4] = {
                            ["id"] = 1920,
                        },
                        [5] = {
                            ["id"] = 1921,
                        },
                        [6] = {
                            ["id"] = 1922,
                        },
                    },
                    ["id"] = 1923,
                },
            },
        },
        [619] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1925,
                },
                [2] = {
                    ["id"] = 1926,
                },
                [3] = {
                    ["id"] = 1927,
                },
                [4] = {
                    ["id"] = 1928,
                },
                [5] = {
                    ["id"] = 1929,
                },
                [6] = {
                    ["id"] = 1930,
                },
            },
        },
        [620] = {
            ["variants"] = {
                [1] = {
                    ["criteria"] = {
                        [1] = {
                            ["id"] = 1932,
                        },
                        [2] = {
                            ["id"] = 1933,
                        },
                        [3] = {
                            ["id"] = 1934,
                        },
                    },
                },
                [2] = {
                    ["criteria"] = {
                        [1] = {
                            ["id"] = 1932,
                        },
                        [2] = {
                            ["id"] = 1933,
                        },
                        [3] = {
                            ["id"] = 1934,
                        },
                    },
                },
            },
        },
        [621] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1936,
                },
                [2] = {
                    ["id"] = 1937,
                },
                [3] = {
                    ["id"] = 1938,
                },
                [4] = {
                    ["id"] = 1939,
                },
                [5] = {
                    ["id"] = 1940,
                },
                [6] = {
                    ["id"] = 1941,
                },
                [7] = {
                    ["id"] = 1942,
                },
                [8] = {
                    ["id"] = 1943,
                },
                [9] = {
                    ["id"] = 1944,
                },
                [10] = {
                    ["id"] = 1945,
                },
                [11] = {
                    ["id"] = 1946,
                },
                [12] = {
                    ["id"] = 1947,
                },
                [13] = {
                    ["id"] = 1948,
                },
                [14] = {
                    ["id"] = 1949,
                },
                [15] = {
                    ["id"] = 1950,
                },
                [16] = {
                    ["id"] = 1951,
                },
                [17] = {
                    ["id"] = 1952,
                },
            },
        },
        [622] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1954,
                },
                [2] = {
                    ["id"] = 1955,
                },
                [3] = {
                    ["id"] = 1956,
                },
                [4] = {
                    ["id"] = 1957,
                },
                [5] = {
                    ["id"] = 1958,
                },
                [6] = {
                    ["id"] = 1959,
                },
                [7] = {
                    ["id"] = 1960,
                },
                [8] = {
                    ["id"] = 1961,
                },
                [9] = {
                    ["id"] = 1962,
                },
                [10] = {
                    ["id"] = 1963,
                },
                [11] = {
                    ["id"] = 1964,
                },
                [12] = {
                    ["id"] = 1965,
                },
                [13] = {
                    ["id"] = 1966,
                },
                [14] = {
                    ["id"] = 1967,
                },
                [15] = {
                    ["id"] = 1968,
                },
                [16] = {
                    ["id"] = 1969,
                },
                [17] = {
                    ["id"] = 1970,
                },
                [18] = {
                    ["id"] = 1971,
                },
                [19] = {
                    ["id"] = 1972,
                },
                [20] = {
                    ["id"] = 1973,
                },
                [21] = {
                    ["id"] = 1974,
                },
            },
        },
        [625] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1976,
                },
                [2] = {
                    ["id"] = 1977,
                },
            },
        },
        [626] = {
            ["criteria"] = {
                [1] = {
                    ["id"] = 1978,
                },
            },
        },
        [629] = {
            ["criteria"] = {
                [1] = {
                    ["data"] = {
                        [1] = {
                            ["id"] = 1979,
                        },
                        [2] = {
                            ["id"] = 1980,
                        },
                        [3] = {
                            ["id"] = 1981,
                        },
                    },
                },
            },
        },
        [633] = {
            ["variants"] = {
                [1] = {
                    ["criteria"] = {
                        [2] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 638,
                            },
                            ["id"] = 6331,
                            ["name"] = "AN_MIDSUMMER_DESECRATION_HORDE",
                            ["type"] = 20,
                        },
                        [3] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 642,
                            },
                            ["id"] = 6332,
                            ["name"] = "AN_MIDSUMMER_FLAME_KEEPER_HORDE",
                            ["type"] = 20,
                        },
                        [4] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 643,
                            },
                            ["id"] = 6333,
                            ["name"] = "AN_MIDSUMMER_AHUNE",
                            ["type"] = 20,
                        },
                    },
                },
                [2] = {
                    ["criteria"] = {
                        [2] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 638,
                            },
                            ["id"] = 6331,
                            ["name"] = "AN_MIDSUMMER_DESECRATION_ALLIANCE",
                            ["type"] = 20,
                        },
                        [3] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 642,
                            },
                            ["id"] = 6332,
                            ["name"] = "AN_MIDSUMMER_FLAME_KEEPER_ALLIANCE",
                            ["type"] = 20,
                        },
                        [4] = {
                            ["coinFormatter"] = false,
                            ["data"] = {
                                [1] = 643,
                            },
                            ["id"] = 6333,
                            ["name"] = "AN_MIDSUMMER_AHUNE",
                            ["type"] = 20,
                        },
                    },
                },
            },
        },
        [650] = {
            ["criteria"] = {
                [5] = {
                    ["data"] = {
                        [1] = 644,
                    },
                    ["id"] = 6554,
                    ["name"] = "AN_BREWFEST",
                },
                [6] = {
                    ["data"] = {
                        [1] = 633,
                    },
                    ["id"] = 6555,
                    ["name"] = "AN_MIDSUMMER",
                },
                [7] = {
                    ["coinFormatter"] = false,
                    ["data"] = {
                        [1] = 605,
                    },
                    ["id"] = 6556,
                    ["name"] = "AN_VALENTINES",
                    ["type"] = 20,
                },
            },
        },
    },
    ["categoryCounter"] = 35,
    ["categoryDefinitions"] = {
        [5] = {
            ["id"] = 5,
            ["isFeats"] = false,
            ["name"] = "CATEGORY_OUTLAND",
            ["parentID"] = 2,
            ["tabID"] = 1,
        },
        [9] = {
            ["id"] = 9,
            ["isFeats"] = false,
            ["name"] = "CATEGORY_OUTLAND",
            ["parentID"] = 6,
            ["tabID"] = 1,
        },
        [13] = {
            ["id"] = 13,
            ["isFeats"] = false,
            ["name"] = "CATEGORY_BG_EYE",
            ["parentID"] = 10,
            ["tabID"] = 1,
        },
        [15] = {
            ["id"] = 15,
            ["isFeats"] = false,
            ["name"] = "CATEGORY_ARENA",
            ["parentID"] = 10,
            ["tabID"] = 1,
        },
        [18] = {
            ["id"] = 18,
            ["isFeats"] = false,
            ["name"] = "CATEGORY_TBC",
            ["parentID"] = 16,
            ["tabID"] = 1,
        },
        [25] = {
            ["id"] = 25,
            ["isFeats"] = false,
            ["name"] = "CATEGORY_TBC",
            ["parentID"] = 23,
            ["tabID"] = 1,
        },
        [32] = {
            ["id"] = 32,
            ["isFeats"] = false,
            ["name"] = "CATEGORY_BREWFEST",
            ["parentID"] = 26,
            ["tabID"] = 1,
        },
    },
    ["categoryPatches"] = {},
    ["criteriaCounter"] = 2848,
    ["removeAchievements"] = {
        [1] = 149,
        [2] = 150,
        [3] = 151,
        [4] = 152,
        [5] = 153,
        [6] = 154,
        [7] = 155,
        [8] = 156,
        [9] = 157,
        [10] = 158,
        [11] = 159,
        [12] = 160,
        [13] = 161,
        [14] = 162,
        -- ID 538 has a client-specific full definition above. Remove the
        -- shared Classic variant before the TBC definition is installed.
        [15] = 538,
    },
}

catalog:ApplyTBCDelta(tbcDelta)
