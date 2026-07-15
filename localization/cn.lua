if GetLocale() ~= 'zhCN' then return end

-- Blizzard translations are taken from AchievementsData Classic/TBC.
-- German fallback lines are marked with --#--#-- for manual review.
local L = {
    achievement_earned = '&aErfolg von %s am %d.%d.%d errungen', --#--#--
    achievement_in_progress = '&aErfolg wird von %s erarbeitet', --#--#--
    MICROBUTTON_TITLE = 'Erfolge', --#--#--
    MICROBUTTON_LEFT_CLICK = 'Linksklick: Erfolge öffnen.', --#--#--
    MICROBUTTON_RIGHT_CLICK = 'Rechtsklick: Addon-Einstellungen öffnen.', --#--#--
    ITEM_FALLBACK = 'Gegenstand %d', --#--#--
    CATALOG_LOAD_ERROR = 'Der Classic-Erfolgskatalog muss vor dem TBC-Delta geladen werden.', --#--#--
    TITLE_FALLBACK_FORMAT = '%s, %s', --#--#--


    OPTION_SHARING = 'Erfolge teilen', --#--#--
    OPTION_SHARING_DESC = 'Neue Erfolge werden im Chat geteilt. Nur für Euch sichtbar.', --#--#--
    OPTION_MICROBUTTON = 'Micromenu-Button verwenden', --#--#--
    OPTION_MICROBUTTON_DESC = 'Zeigt den Anniversary-Achievements-Button im Micromenu an und blendet den Minimap-Button aus. Bei Deaktivierung wird der Micromenu-Button entfernt und stattdessen der Minimap-Button angezeigt.', --#--#--
    OPTION_UPDATE_MAP_EXPLORATION = 'Erkundete Gebiete überprüfen', --#--#--
    OPTION_UPDATE_MAP_EXPLORATION_DESC = 'Überprüft alle bereits erkundeten Gebiete für Erfolge.', --#--#--
    OPTION_RESET_ACHIEVEMENTS = 'Erfolge zurücksetzen', --#--#--
    OPTION_RESET_ACHIEVEMENTS_DESC = 'Setzt alle Erfolge auf diesem Charakter zurück. Dies kann nicht rückgängig gemacht werden!', --#--#--
    OPTION_RESET_ACHIEVEMENTS_CONFIRM = 'Möchtet Ihr wirklich alle Erfolge dieses Charakters zurücksetzen?\n\nDieser Vorgang kann nicht rückgängig gemacht werden.', --#--#--
    OPTION_TRACKER = 'Ziele beobachten', --#--#--
    OPTION_TRACKER_DESC = 'Aktiviert oder deaktiviert die Quest- und Erfolgsverfolgung.', --#--#--
    OPTION_DISABLED = 'Option aufgrund eines UI-Addons nicht verfügbar', --#--#--
    OPTION_ADDON = 'Addon', --#--#--
    OPTION_MODULES = 'Module', --#--#--
    OPTION_MODULE_NAME = 'Addonname', --#--#--
    OPTION_MODULE_VERSION = 'Version', --#--#--
    OPTION_MODULE_AUTHOR = 'Autor', --#--#--
    OPTION_MODULES_EMPTY = 'Keine aktiven Erweiterungsmodule registriert.', --#--#--
    API_TAB_LIST_TITLE = 'Weitere Tabs', --#--#--
    API_TAB_PIN_HINT = 'Rechtsklick, um diesen Tab unten anzuheften.', --#--#--
    API_TAB_UNPIN_HINT = 'Rechtsklick, um diesen Tab von der unteren Leiste zu lösen.', --#--#--
    API_TAB_PIN_LIMIT = 'Es können höchstens fünf Erweiterungs-Tabs gleichzeitig angeheftet werden.', --#--#--

    TITLE_SELECT = 'Titel auswählen', --#--#--
    TITLE_ICON_TOOLTIP = 'Titel auswählen', --#--#--
    TITLE_ICON_TOOLTIP_HINT = 'Klicken, um die Titelliste zu öffnen.', --#--#--
    TITLE_NONE = 'Kein Titel', --#--#--
    TITLE_UNLOCKED = 'Neuer Titel freigeschaltet: %s', --#--#--
    TITLE_LIST_HEADER = 'Freigeschaltete Anniversary-Titel: %d', --#--#--
    TITLE_COMMAND_HELP = 'Mit /aatitle <Nummer> wird ein Titel ausgewählt; /aatitle none blendet alle Titel aus.', --#--#--
    TITLE_NOT_AVAILABLE = 'Dieser Titel ist nicht verfügbar.', --#--#--

    GOT_ACHIEVEMENT_MESSAGE_MALE = 'Ihr habt den Erfolg %s erreicht!', --#--#--
    GOT_ACHIEVEMENT_MESSAGE_FEMALE = 'Ihr habt den Erfolg %s erreicht!', --#--#--

    UPDATING_EXPLORED_AREAS = 'Aktualisieren der erkundeten Gebiete. Dies kann ein paar Sekunden dauern.', --#--#--
    UPDATED_EXPLORED_AREAS = '&aErkundete Gebiete wurden aktualisiert!', --#--#--

    UI_COMBAT_ERROR = 'Anniversary Achievements kann nicht im Kampf geöffnet werden!', --#--#--

    GEAR_SLOT_HEAD = '头部',
    GEAR_SLOT_NECK = '颈部',
    GEAR_SLOT_SHOULDER = '肩部',
    GEAR_SLOT_CHEST = '胸甲',
    GEAR_SLOT_WAIST = '腰部',
    GEAR_SLOT_LEGS = '腿部',
    GEAR_SLOT_FEET = '脚',
    GEAR_SLOT_WRIST = '腕部',
    GEAR_SLOT_HANDS = '手',
    GEAR_SLOT_FIRST_RING = '右手戒指',
    GEAR_SLOT_SECOND_RING = '左手戒指',
    GEAR_SLOT_FIRST_TRINKET = '第一件饰品',
    GEAR_SLOT_SECOND_TRINKET = '第二件饰品',
    GEAR_SLOT_CLOAK = '披风',
    GEAR_SLOT_WEAPON = '武器',

    NPC_3444 = 'Grubenratte', --#--#--
    NPC_620 = '鸡',
    NPC_1420 = '蟾蜍',
    NPC_13321 = '青蛙',
    NPC_2620 = '草原土拨鼠',
    NPC_9600 = '鹦鹉',
    NPC_883 = '鹿',
    NPC_9699 = '火甲虫',
    NPC_4953 = '噬鱼蛇',
    NPC_721 = '兔子',
    NPC_9700 = '熔岩蟹',
    NPC_15476 = '蝎子',
    NPC_2914 = '蛇',
    NPC_16030 = '蛆虫',
    NPC_4075 = '老鼠',
    NPC_1412 = '松鼠',
    NPC_7390 = 'Nymphensittich', --#--#--
    NPC_15475 = 'Käfer', --#--#--
    NPC_15010 = 'Dschungelkröte', --#--#--
    NPC_4076 = '蟑螂',
    NPC_13016 = 'Untergrundratte', --#--#--
    NPC_14881 = '蜘蛛',
    NPC_2110 = 'Schwarze Ratte', --#--#--
    NPC_4166 = '瞪羚',
    NPC_1933 = '绵羊',
    NPC_890 = '小鹿',
    NPC_2098 = '山羊',
    NPC_2442 = '奶牛',
    NPC_6368 = '猫',
    NPC_6271 = '耗子',
    NPC_385 = 'Pferd', --#--#--
    NPC_10685 = '猪',
    NPC_3300 = '蝰蛇',
    NPC_15065 = 'Lady', --#--#--
    NPC_15066 = 'Cleo', --#--#--
    NPC_15071 = 'Schleicherpfote', --#--#--
    NPC_15072 = 'Spike', --#--#--

    CATEGORY_GENERAL = '综合',
    CATEGORY_QUESTS = '任务',
	CATEGORY_PVP = 'PvP',
    CATEGORY_KALIMDOR = '卡利姆多',
    CATEGORY_EASTERN_KINGDOMS = '东部王国',
    CATEGORY_OUTLAND = '外域',
    CATEGORY_VANILLA = '经典旧世',
    CATEGORY_TBC = '燃烧的远征',
    CATEGORY_EXPLORATION = '探索',
    CATEGORY_PVE = '地下城和团队',
    CATEGORY_ARENA = '竞技场',
    CATEGORY_BG_ALTERAC = '奥特兰克山谷',
    CATEGORY_BG_WARSONG = '战歌峡谷',
    CATEGORY_BG_ARATHI = '阿拉希盆地',
    CATEGORY_BG_EYE = '风暴之眼',
    CATEGORY_PROFESSIONS = '专业',
    CATEGORY_REPUTATION = '声望',
	CATEGORY_EVENTS = '世界事件',
    CATEGORY_VALENTINES = '情人节',
    CATEGORY_LUNAR = '春节',
    CATEGORY_NOBLEGARDEN = '复活节',
    CATEGORY_CHILDREN = '儿童周',
    CATEGORY_MIDSUMMER = '仲夏节',
    CATEGORY_BREWFEST = '美酒节',
    CATEGORY_HALLOWSEND = '万圣节',
    CATEGORY_WINTERVEIL = '冬幕节',
    CATEGORY_FEATS_OF_STRENGTH = '光辉事迹',
	
	AN_DRUID_T1 = 'Gewänder des Cenarius', --#--#--
	AN_WARLOCK_T1 = 'Teufelsherzroben', --#--#--
	AN_PRIEST_T1 = 'Gewänder der Prophezeiung', --#--#--
	AN_MAGE_T1 = 'Ornat des Arkanisten', --#--#--
	AN_ROGUE_T1 = 'Der Nachtmeuchler', --#--#--
	AN_HUNTER_T1 = 'Rüstung des Riesenjägers', --#--#--
	AN_PALADIN_T1 = 'Rüstung der Gerechtigkeit', --#--#--
	AN_WARRIOR_T1 = 'Schlachtrüstung der Macht', --#--#--
	AN_SHAMAN_T1 = 'Die Wut der Erde', --#--#--
	
	AN_DRUID_T2 = 'Sturmgrimms Gewänder', --#--#--
	AN_WARLOCK_T2 = '复仇法袍',
	AN_PRIEST_T2 = 'Gewänder der Erhabenheit', --#--#--
	AN_MAGE_T2 = 'Ornat des Netherwinds', --#--#--
	AN_ROGUE_T2 = 'Blutfangrüstung', --#--#--
	AN_HUNTER_T2 = 'Rüstung des Drachenjägers', --#--#--
	AN_PALADIN_T2 = 'Rüstung des Richturteils', --#--#--
	AN_WARRIOR_T2 = 'Schlachtrüstung des Zorns', --#--#--
	AN_SHAMAN_T2 = 'Die zehn Stürme', --#--#--
	
	AN_DRUID_T3 = 'Gewandung des Traumwandlers', --#--#--
	AN_WARLOCK_T3 = 'Roben des verseuchten Herzens', --#--#--
	AN_PRIEST_T3 = 'Gewänder des Glaubens', --#--#--
	AN_MAGE_T3 = 'Frostfeuerornat', --#--#--
	AN_ROGUE_T3 = 'Rüstung der Knochensense', --#--#--
	AN_HUNTER_T3 = 'Rüstung des Gruftpirschers', --#--#--
	AN_PALADIN_T3 = 'Rüstung der Erlösung', --#--#--
	AN_WARRIOR_T3 = 'Schlachtrüstung des Schreckenspanzers', --#--#--
	AN_SHAMAN_T3 = 'Der Erdspalter', --#--#--
	
	AD_SET = 'Sammelt alle Gegenstände des genannten Sets.', --#--#--
    
    AN_SKELETON_KEY = 'Der Schlüssel zur Scholomance', --#--#--
	AD_SKELETON_KEY = 'Erhaltet den Skelettschlüssel.', --#--#--

    AN_LVL = '%d级',
    AD_LVL = '升到%d级。',

    AN_BANK = '安全仓库',
    AD_BANK = '购买7个额外的银行栏位。',
    AC_BANK = '购买7个额外的银行栏位。',

    AN_QUESTS = '完成%d个任务',
    AD_QUESTS = '完成%d个任务。',
    AC_QUESTS = 'Schließt %d Quests ab.', --#--#--

    AN_DAILY_QUESTS = '%d tägliche Quests abgeschlossen', --#--#--
    AD_DAILY_QUESTS = '完成%d个日常任务。',
    AC_DAILY_QUESTS = 'Schließt %d tägliche Quests ab.', --#--#--

    AN_QUEST_GOLD5 = 'Glitzernde Belohnung', --#--#--
    AN_QUEST_GOLD10 = 'Sammler geprägter Münzen', --#--#--
    AN_QUEST_GOLD25 = 'Täglich Brot', --#--#--
    AN_QUEST_GOLD50 = 'Wohlverdientes Gold', --#--#--
    AN_QUEST_GOLD100 = 'Verdient durch Schweiß und Blut', --#--#--
    AN_QUEST_GOLD250 = 'Golddrucker', --#--#--
    AN_QUEST_GOLD500 = 'Angemessene Entlohnung', --#--#--
    AD_QUEST_GOLD = '通过任务奖励获得%d金币。',
    AC_QUEST_GOLD = 'Erhaltet %d Gold durch Questbelohnungen.', --#--#--

    AN_QUESTS_ZONE = '博学者 %s',
    AD_QUESTS_ZONE = 'Schließt die Quest "%s" in %s ab.', --#--#--
    AD_QUESTS_ZONE_MULTI = 'Schließt die folgenden Quests in %s ab.', --#--#--
    AC_QUESTS_ZONE = 'Schließt die Quest "%s" ab.', --#--#--

    AZSHARA_1 = '艾萨拉',
    AZSHARA_2 = '艾萨拉',
    QUEST_3602 = 'Azsharit', --#--#--

    FELWOOD_1 = '费伍德森林',
    FELWOOD_2 = '费伍德森林',
    QUEST_5165 = 'Übergießen der Flammen des Schutzes', --#--#--
    QUEST_5385 = 'Die Überreste von Trey Lichtschmied', --#--#--

    DESOLACE_1 = '凄凉之地',
    DESOLACE_2 = '凄凉之地',
    QUEST_6027 = 'Buch der Uralten', --#--#--

    DUSTWALLOW_1 = '尘泥沼泽',
    DUSTWALLOW_2 = '尘泥沼泽',
    QUEST_1203 = 'Jarl braucht eine Klinge', --#--#--

    SILITHUS_1 = '希利苏斯',
    SILITHUS_2 = '希利苏斯',
    QUEST_8287 = 'Ein teuflischer Plan', --#--#--
    QUEST_8352 = 'Szepter des Rates', --#--#--
    QUEST_8321 = 'Vyral der Üble', --#--#--
    QUEST_8281 = 'Verstärkte Sicherheit', --#--#--

    DUROTAR_1 = '杜隆塔尔',
    DUROTAR_2 = '杜隆塔尔',
    QUEST_835 = 'Sicherung der Linien', --#--#--

    BARRENS_1 = '贫瘠之地',
    BARRENS_2 = '贫瘠之地',
    QUEST_888 = 'Gestohlene Beute', --#--#--
    QUEST_902 = 'Samophlang', --#--#--

    WINTERSPRING_1 = '冬泉谷',
    WINTERSPRING_2 = '冬泉谷',
    QUEST_975 = 'Behälter von Mau\'ari', --#--#--
    QUEST_5082 = 'Bedrohung durch die Winterfelle', --#--#--
    QUEST_5121 = 'Oberhäuptling der Winterfelle', --#--#--
    QUEST_5163 = 'Sind wir endlich da, Yeti?', --#--#--
    QUEST_4842 = 'Sonderbare Quellen', --#--#--

    TANARIS_1 = '塔纳利斯',
    TANARIS_2 = '塔纳利斯',
    QUEST_2662 = '诺格弗格药剂',
    QUEST_2874 = 'Lieferung für MacKinley', --#--#--
    QUEST_1691 = 'Noch mehr Wüstenläufergerechtigkeit', --#--#--
    QUEST_113 = 'Insektenteil-Analyse', --#--#--

    STONETALON_1 = '石爪山脉',
    STONETALON_2 = '石爪山脉',
    QUEST_1096 = 'Gerenzo Pfeifzang', --#--#--

    UNGORO_1 = '安戈洛环形山',
    UNGORO_2 = '安戈洛环形山',
    QUEST_3962 = 'Allein ist es gefährlich', --#--#--
    QUEST_4245 = 'Chasing A-Me 01', --#--#--
    QUEST_4292 = 'Ein Köder für Lar\'korwi', --#--#--

    THOUSAND_NEEDLES_1 = '千针石林',
    THOUSAND_NEEDLES_2 = '千针石林',
    QUEST_1189 = 'Sicherheit zuerst', --#--#--

    ARATHI_1 = '阿拉希高地',
    ARATHI_2 = '阿拉希高地',
    QUEST_652 = 'Den Hauptstein zerbrechen', --#--#--

    BADLANDS_1 = '荒芜之地',
    BADLANDS_2 = '荒芜之地',
    QUEST_737 = 'Verbotenes Wissen', --#--#--
    QUEST_778 = 'Das wird schwierig', --#--#--
    QUEST_656 = 'Beschwören der Prinzessin', --#--#--
	QUEST_793 = 'Zerbrochene Allianzen', --#--#--
	QUEST_717 = 'Erdbeben', --#--#--
    
    EASTERN_PLAGUELANDS_1 = '东瘟疫之地',
    EASTERN_PLAGUELANDS_2 = '东瘟疫之地',
    QUEST_5942 = 'Versteckte Schätze', --#--#--
    QUEST_6148 = 'Das Scharlachrote Orakel Demetria', --#--#--
    QUEST_6187 = 'Ordnung muss wieder hergestellt werden', --#--#--
    QUEST_5265 = 'Der Argentumtresor', --#--#--

    BLASTED_LANDS_1 = '诅咒之地',
    BLASTED_LANDS_2 = '诅咒之地',
    QUEST_3628 = 'Ihr seid Rakh\'likh, Dämon', --#--#--

    STRANGLETHORN_VALLEY_1 = '荆棘谷',
    STRANGLETHORN_VALLEY_2 = '荆棘谷',
    QUEST_208 = '王牌猎人',
    QUEST_600 = 'Venture Company-Bergbau', --#--#--
    QUEST_613 = 'Maurys Fuß aufbrechen', --#--#--
    QUEST_628 = 'Exzelsior', --#--#--
    QUEST_338 = '荆棘谷的青山',
	
	AN_NESINGWARY = '荆棘谷的青山',
	AD_NESINGWARY = '在荆棘谷完成包括“荆棘谷的青山”和“王牌猎人”在内的所有赫米特·奈辛瓦里任务。',

    WESTERN_PLAGUELANDS_1 = '西瘟疫之地',
    WESTERN_PLAGUELANDS_2 = '西瘟疫之地',
    QUEST_5944 = 'In den Träumen', --#--#--
    QUEST_5051 = 'Zwei Hälften vereint', --#--#--
    QUEST_4985 = 'Die Tierwelt leidet auch', --#--#--

    SEARING_GORGE_1 = '灼热峡谷',
    SEARING_GORGE_2 = '灼热峡谷',
    QUEST_3481 = 'Plunder...', --#--#--

    BLACK_ROCK_1 = '黑石山',
    BLACK_ROCK_2 = '黑石山',
    QUEST_8996 = 'Rückkehr zu Bodley', --#--#--

    AN_WISDOM_KEEPER = '博学者',
    AD_WISDOM_KEEPER = '完成下列任务成就。',
    AN_WISDOM_KEEPER_AZEROTH = '博学者',
    AD_WISDOM_KEEPER_AZEROTH = '完成下列任务成就。',
    AN_WISDOM_KEEPER_KALIMDOR = '卡利姆多的博学者',
    AD_WISDOM_KEEPER_KALIMDOR = '完成下列任务成就。',
    AN_WISDOM_KEEPER_EASTERN_KINGDOMS = '东部王国的博学者',
    AD_WISDOM_KEEPER_EASTERN_KINGDOMS = '完成下列任务成就。',
    AN_WISDOM_KEEPER_OUTLAND = '外域的博学者',
    AD_WISDOM_KEEPER_OUTLAND = '完成下列外域任务成就。',

    AN_RAGEFIRE_CHASM = '怒焰裂谷',
    AD_RAGEFIRE_CHASM = '击败饥饿者塔拉加曼。',
    AN_WAILING_CAVERNS = '哀嚎洞穴',
    AD_WAILING_CAVERNS = '击败吞噬者穆坦努斯。',
    AN_DEAD_MINES = '死亡矿井',
    AD_DEAD_MINES = '击败艾德温·范克里夫。',
    AN_SHADOWFANG_KEEP = '影牙城堡',
    AD_SHADOWFANG_KEEP = '击败大法师阿鲁高。',
    AN_BLACKFATHOM_DEEPS = '黑暗深渊',
    AD_BLACKFATHOM_DEEPS = '击败阿库麦尔。',
    AN_JAIL = '暴风城监狱',
    AD_JAIL = '击败巴基尔·斯瑞德。',
    AN_GNOMREGAN = '诺莫瑞根',
    AD_GNOMREGAN = '击败机械师瑟玛普拉格。',
    AN_RAZORFEN_KRAUL = '剃刀沼泽',
    AD_RAZORFEN_KRAUL = '击败卡尔加·刺肋。',
    AN_SCARLET_MONASTERY = '血色修道院',
    AD_SCARLET_MONASTERY = '在血色修道院击败血色十字军。',
    AC_SCARLET_MONASTERY1 = '血法师萨尔诺斯',
    AC_SCARLET_MONASTERY2 = '奥法师杜安',
    AC_SCARLET_MONASTERY3 = '赫洛德',
    AC_SCARLET_MONASTERY4 = '血色十字军指挥官莫格莱尼',
    AC_SCARLET_MONASTERY5 = '大检察官怀特迈恩',
	
    AN_RAZORFEN_DOWNS = '剃刀高地',
    AD_RAZORFEN_DOWNS = '击败寒冰之王亚门纳尔。',
    AN_ULDAMAN = '奥达曼',
    AD_ULDAMAN = '击败阿扎达斯。',
    AN_ZULFARRAK = '祖尔法拉克',
    AD_ZULFARRAK = '击败乌克兹·沙顶。',
    AN_MARAUDON = '玛拉顿',
    AD_MARAUDON = '击败瑟莱德丝公主。',
    AN_SUNKEN_TEMPLE = '沉没的神庙',
    AD_SUNKEN_TEMPLE = '击败伊兰尼库斯的阴影。',
	
    AN_NEW_EMPEROR = '黑石深渊',
    AD_NEW_EMPEROR = '击败达格兰·索瑞森大帝。',
    AN_BLACKROCK_DEPTHS = 'Die Tiefen säubern', --#--#--
    AD_BLACKROCK_DEPTHS = 'Tötet die folgenden Bosse in den Schwarzfelstiefen.', --#--#--
    AC_BLACKROCK_DEPTHS1 = 'Verhörmeisterin Gerstahn', --#--#--
    AC_BLACKROCK_DEPTHS2 = 'Hundemeister Grebmar', --#--#--
    AC_BLACKROCK_DEPTHS3 = 'General Zornesschmied', --#--#--
    AC_BLACKROCK_DEPTHS4 = 'Golemlord Argelmach', --#--#--
    AC_BLACKROCK_DEPTHS5 = 'Lord Incendius', --#--#--
    AC_BLACKROCK_DEPTHS6 = 'Wärter Stilgiss', --#--#--
    AC_BLACKROCK_DEPTHS7 = 'Bael\'Gar', --#--#--
    AN_BLACKROCK_PARTY = 'Party in den Tiefen', --#--#--
    AD_BLACKROCK_PARTY = 'Bezwingt die folgenden Gegner im Grimmigen Säufer', --#--#--
    AC_BLACKROCK_PARTY1 = 'Ribbly Schraubstutz', --#--#--
    AC_BLACKROCK_PARTY2 = 'Stöpsel Zapfring', --#--#--
    AC_BLACKROCK_PARTY3 = 'Hurley Pestatem', --#--#--
    AC_BLACKROCK_PARTY4 = 'Phalanx', --#--#--
    AN_BLACKROCK_DEPTHS_FULL = 'Meister der Schwarzfelstiefen', --#--#--
    AD_BLACKROCK_DEPTHS_FULL = 'Schließt die unten aufgelisteten Erfolge in den Schwarzfelstiefen ab.', --#--#--
    AN_ARMOR_SWORD = 'Angriff ist die bessere Verteidigung', --#--#--
    AD_ARMOR_SWORD = 'Plündert den Stein der Erde von Panzor den Unbesiegbaren in den Schwarzfelstiefen.', --#--#--
	
    AN_BLACKROCK_SPIRE_BOTTOM = '黑石塔下层',
    AD_BLACKROCK_SPIRE_BOTTOM = '击败维姆萨拉克。',
    AN_BLACKROCK_SPIRE_UPPER = '黑石塔上层',
    AD_BLACKROCK_SPIRE_UPPER = '击败达基萨斯将军。',
    AN_BLACKROCK_SPIRE = 'Eindringling der Schwarzfelsspitze', --#--#--
    AD_BLACKROCK_SPIRE = 'Schließt die unten aufgelisteten Erfolge in der Schwarzfelsspitze ab.', --#--#--
    AN_DIRE_MAUL = '厄运之槌的国王',
    AD_DIRE_MAUL = '扫清厄运之槌的所有分支。',
    AC_DIRE_MAUL1 = '荒野变形者奥兹恩',
    AC_DIRE_MAUL2 = '伊莫塔尔',
    AC_DIRE_MAUL3 = '戈多克大王',
    AN_STRATHOLME = '斯坦索姆',
    AD_STRATHOLME = '击败隐藏在斯坦索姆城中的邪恶头目。',
	AC_STRATHOLME1 = '巴纳扎尔',
	AC_STRATHOLME2 = '瑞文戴尔男爵',
    AN_SCHOLOMANCE = '通灵学院',
    AD_SCHOLOMANCE = '击败通灵学院的首领。',
	AC_SCHOLOMANCE1 = '黑暗院长加丁',
	AC_SCHOLOMANCE2 = '莱斯·霜语',
    AN_YOUNG_DEFENDER = '旧世地下城大师',
    AD_YOUNG_DEFENDER = '完成下列《魔兽世界》地下城成就。',
    AN_DEFENDER = 'Verteidiger von Azeroth', --#--#--
    AD_DEFENDER = 'Schließt die unten aufgelisteten Dungeon-Erfolge ab.', --#--#--
    AR_DEFENDER = 'Verteidiger von Azeroth', --#--#--

    AN_ONYXIA = '奥妮克希亚的巢穴',
    AD_ONYXIA = 'Bezwingt Onyxia.', --#--#--
    AN_AQ20 = '安其拉废墟',
    AD_AQ20 = '击败无疤者奥斯里安。',
    AN_ZULGURUB = '祖尔格拉布',
    AD_ZULGURUB = '击败哈卡。',
    AN_RAGNAROS = '熔火之心',
    AD_RAGNAROS = '击败拉格纳罗斯。',
    AN_BLACK_WING_LAIR = '黑翼之巢',
    AD_BLACK_WING_LAIR = '击败奈法利安。',
    AN_AQ40 = '安其拉神殿',
    AD_AQ40 = '击败克苏恩。',
    AN_NAXXRAMAS_SPIDERS = 'Das Arachnidenviertel', --#--#--
    AD_NAXXRAMAS_SPIDERS = 'Bezwingt die Bosse im Arachnidenviertel von Naxxramas', --#--#--
    AC_NAXXRAMAS_SPIDERS1 = 'Anub\'Rekhan', --#--#--
    AC_NAXXRAMAS_SPIDERS2 = 'Großwitwe Faerlina', --#--#--
    AC_NAXXRAMAS_SPIDERS3 = 'Maexxna', --#--#--
    AN_NAXXRAMAS_PLAGUE = 'Das Seuchenviertel', --#--#--
    AD_NAXXRAMAS_PLAGUE = 'Bezwingt die Bosse im Seuchenviertel von Naxxramas.', --#--#--
    AC_NAXXRAMAS_PLAGUE1 = 'Noth der Seuchenfürst', --#--#--
    AC_NAXXRAMAS_PLAGUE2 = 'Heigan der Unreine', --#--#--
    AC_NAXXRAMAS_PLAGUE3 = 'Loatheb', --#--#--
    AN_NAXXRAMAS_MILITARY = 'Das Militärviertel', --#--#--
    AD_NAXXRAMAS_MILITARY = 'Bezwingt die Bosse im Militärviertel von Naxxramas.', --#--#--
    AC_NAXXRAMAS_MILITARY1 = 'Instrukteur Razuvious', --#--#--
    AC_NAXXRAMAS_MILITARY2 = 'Gothik der Ernter', --#--#--
    AC_NAXXRAMAS_MILITARY3 = 'Die Vier Reiter', --#--#--
    AN_NAXXRAMAS_CONSTRUCT = 'Das Konstruktviertel', --#--#--
    AD_NAXXRAMAS_CONSTRUCT = 'Bezwingt die Bosse im Konstruktviertel von Naxxramas.', --#--#--
    AC_NAXXRAMAS_CONSTRUCT1 = 'Flickwerk', --#--#--
    AC_NAXXRAMAS_CONSTRUCT2 = 'Grobbulus', --#--#--
    AC_NAXXRAMAS_CONSTRUCT3 = 'Gluth', --#--#--
    AC_NAXXRAMAS_CONSTRUCT4 = 'Thaddius', --#--#--
    AN_NAXXRAMAS_SAPPHIRON = 'Saphirons Ableben', --#--#--
    AD_NAXXRAMAS_SAPPHIRON = 'Bezwingt Saphiron in Naxxramas.', --#--#--
    AN_NAXXRAMAS_LAIR = 'Kel\'Thuzads Niederlage', --#--#--
    AD_NAXXRAMAS_LAIR = 'Bezwingt Kel\'Thuzad in Naxxramas.', --#--#--
    AN_NAXXRAMAS = 'Der Fall Naxxramas\'', --#--#--
    AD_NAXXRAMAS = 'Schließt die unten aufgelisteten Erfolge in Naxxramas ab.', --#--#--
    AN_YOUNG_HERO = 'Aufstrebender Held von Azeroth', --#--#--
    AD_YOUNG_HERO = 'Schließt die unten aufgelisteten Schlachtzugserfolge ab.', --#--#--
    AN_BLACKROCK_MASTER = 'Herr des Schwarzfels', --#--#--
    AD_BLACKROCK_MASTER = 'Schließt die unten aufgelisteten Erfolge im Schwarzfels ab.', --#--#--
    AN_HERO = 'Held von Azeroth', --#--#--
    AD_HERO = 'Schließt die unten aufgelisteten Schlachtzugserfolge ab.', --#--#--
    AR_HERO = 'Held von Azeroth', --#--#--
    AN_GREAT_HERO = 'Großartiger Held von Azeroth', --#--#--
    AD_GREAT_HERO = 'Schließt die unten aufgelisteten Dungeon- und Schlachtzugserfolge ab.', --#--#--
    AR_GREAT_HERO = 'Großartiger Held von Azeroth', --#--#--

    AN_PVP_RANK_A1 = '列兵',
    AN_PVP_RANK_A2 = '下士',
    AN_PVP_RANK_A3 = '中士',
    AN_PVP_RANK_A4 = '军士长',
    AN_PVP_RANK_A5 = '士官长',
    AN_PVP_RANK_A6 = '骑士',
    AN_PVP_RANK_A7 = '骑士中尉',
    AN_PVP_RANK_A8 = '骑士队长',
    AN_PVP_RANK_A9 = '护卫骑士',
    AN_PVP_RANK_A10 = '少校',
    AN_PVP_RANK_A11 = '司令',
    AN_PVP_RANK_A12 = '统帅',
    AN_PVP_RANK_A13 = '元帅',
    AN_PVP_RANK_A14 = '大元帅',
    AN_PVP_RANK_H1 = '侦察兵',
    AN_PVP_RANK_H2 = '步兵',
    AN_PVP_RANK_H3 = '中士',
    AN_PVP_RANK_H4 = '高阶军士',
    AN_PVP_RANK_H5 = '一等军士长',
    AN_PVP_RANK_H6 = '石头守卫',
    AN_PVP_RANK_H7 = '血卫士',
    AN_PVP_RANK_H8 = '军团士兵',
    AN_PVP_RANK_H9 = '百夫长',
    AN_PVP_RANK_H10 = '勇士',
    AN_PVP_RANK_H11 = '中将',
    AN_PVP_RANK_H12 = '将军',
    AN_PVP_RANK_H13 = '督军',
    AN_PVP_RANK_H14 = '高阶督军',
    AD_PVP_RANK = 'Den Titel "%s" erhalten.', --#--#--
    AN_PVP_FIRST_KILL = '一次荣誉击杀',
    AD_PVP_FIRST_KILL = '完成一次荣誉击杀。',
    AC_PVP_FIRST_KILL = '完成一次荣誉击杀。',
    AN_PVP_KILLS = '%d个荣誉击杀',
    AD_PVP_KILLS = '达到%d个荣誉击杀。',
    AC_PVP_KILLS = '达到%d个荣誉消灭',

    AN_MOB_KILLS_1 = 'Totschläger', --#--#--
    AN_MOB_KILLS_2 = 'Zerstörer', --#--#--
    AN_MOB_KILLS_3 = 'Brecher', --#--#--
    AN_MOB_KILLS_4 = 'Kopfgeldjäger', --#--#--
    AN_MOB_KILLS_5 = 'Gewittersturm aller Monster', --#--#--
    AN_MOB_KILLS_6 = 'Gewittersturm allen Lebens', --#--#--
    AN_MOB_KILLS_7 = 'Allgegenwärtiger Tod', --#--#--
    AD_MOB_KILLS = 'Tötet %d Gegner.', --#--#--
    AC_MOB_KILLS = 'Tötet %d Gegner', --#--#--

    AN_REPS_1 = '有人喜欢我',
    AD_REPS_1 = '在一个势力中达到崇拜声望。',
    AC_REPS_1 = '在一个势力中达到崇拜声望。',
    AN_REPS_X = '崇拜声望',
    AD_REPS = '在%d个势力中达到崇拜声望。',
    AC_REPS = 'Erreicht bei %d Fraktionen einen ehrfürchtigen Ruf.', --#--#--
    AR_REPS = 'Der Ehrfurchtgebietende', --#--#--

    AN_HORDE_REPS = '部落的大使',
    AD_HORDE_REPS = '在5座主城中都达到崇拜声望。',
    AC_HORDE_REPS_1 = '奥格瑞玛崇拜',
    AC_HORDE_REPS_2 = '暗矛巨魔崇拜',
    AC_HORDE_REPS_3 = '幽暗城崇拜',
    AC_HORDE_REPS_4 = '雷霆崖崇拜',
    AC_HORDE_REPS_5 = '银月城崇拜',

    AN_ALLIANCE_REPS = '联盟的大使',
    AD_ALLIANCE_REPS = '在5座主城中都达到崇拜声望。',
    AC_ALLIANCE_REPS_1 = '暴风城崇拜',
    AC_ALLIANCE_REPS_2 = '达纳苏斯崇拜',
    AC_ALLIANCE_REPS_3 = '诺莫瑞根流亡者崇拜',
    AC_ALLIANCE_REPS_4 = '铁炉堡崇拜',
    AC_ALLIANCE_REPS_5 = '埃索达崇拜',

    AN_ARGENT_DAWN = '银色黎明',
    AD_ARGENT_DAWN = '在银色黎明阵营中达到崇拜声望。',
    AN_BROOD_OF_NOZDORMU = '诺兹多姆的子嗣',
    AD_BROOD_OF_NOZDORMU = '在诺兹多姆的子嗣阵营中达到崇拜声望。',
    AN_DARKMOON_FAIRE = '暗月马戏团',
    AD_DARKMOON_FAIRE = 'Erreicht beim Dunkelmond-Jahrmarkt den Status ehrfürchtig.', --#--#--
    AN_ZANDALAR_TRIBE = '赞达拉部族的英雄',
    AD_ZANDALAR_TRIBE = '在赞达拉部族阵营中达到崇拜声望。',
    AN_HYDRAXIANS = '海达希亚水元素',
    AD_HYDRAXIANS = '在海达希亚水元素阵营中达到崇拜声望。',
    AN_TIMBERMAW_HOLD = '熊怪之友',
    AD_TIMBERMAW_HOLD = '在木喉要塞阵营中达到崇拜声望。',
    AN_THORIUM = '瑟银兄弟会',
    AD_THORIUM = 'Erreicht bei der Thoriumbruderschaft den Status ehrfürchtig.', --#--#--
    AN_SHENDRALAR = 'Agent der Shen\'dralar', --#--#--
    AD_SHENDRALAR = 'Erreicht bei den Shen\'dralar den Status ehrfürchtig.', --#--#--
    AN_CENARION = '塞纳里奥议会',
    AD_CENARION = 'Erreicht beim Zirkel des Cenarius den Status ehrfürchtig.', --#--#--

    AN_DEFILERS = '污染者',
    AD_DEFILERS = '在污染者阵营中达到崇拜声望。',
    AN_FROSTWOLF_CLAN = '霜狼氏族的英雄',
    AD_FROSTWOLF_CLAN = '在霜狼氏族阵营中达到崇拜声望。',
    AN_WARSONG_OUTRIDERS = '战歌氏族',
    AD_WARSONG_OUTRIDERS = '在战歌氏族阵营中达到崇拜声望。',
    AN_HORDE_PVP_FRACTIONS = '征服者',
    AD_HORDE_PVP_FRACTIONS = '在战歌峡谷、阿拉希盆地和奥特兰克山谷中达到崇拜声望。',

    AN_LEAGUE_OF_ARATHOR = '阿拉索的骑士',
    AD_LEAGUE_OF_ARATHOR = '在阿拉索联军阵营中达到崇拜声望。',
    AN_STORMSPIKE_GUARD = '雷矛卫队的英雄',
    AD_STORMSPIKE_GUARD = '在雷矛卫队阵营中达到崇拜声望。',
    AN_SILVERWING_SENTINELS = '银翼哨兵',
    AD_SILVERWING_SENTINELS = '在银翼要塞阵营中达到崇拜声望。',
    AN_ALLIANCE_PVP_FRACTIONS = '审判者',
    AD_ALLIANCE_PVP_FRACTIONS = '在战歌峡谷、阿拉希盆地和奥特兰克山谷中达到崇拜声望。',

    AN_BOLVAR_SLAYER = '暴风城的风暴',
    AD_BOLVAR_SLAYER = '杀死大领主伯瓦尔·弗塔根。',
    AN_MAGNI_SLAYER = '杀死国王！',
    AD_MAGNI_SLAYER = '杀死国王麦格尼·铜须。',
    AN_TYRANDE_SLAYER = '不再永恒',
    AD_TYRANDE_SLAYER = '杀死泰兰德·语风。',
    AN_VELEN_SLAYER = '熄灭圣光',
    AD_VELEN_SLAYER = '杀死先知维纶。',

    AN_ALLIANCE_KINGS_SLAYER = '为了部落！',
    AD_ALLIANCE_KINGS_SLAYER = '杀死联盟的领袖。',

    AN_THRALL_SLAYER = '杀死酋长！',
    AD_THRALL_SLAYER = '杀死萨尔。',
    AN_SYLVANAS_SLAYER = '黑暗女王之死',
    AD_SYLVANAS_SLAYER = '杀死希尔瓦娜斯·风行者。',
    AN_CAIRNE_SLAYER = '流血的血蹄',
    AD_CAIRNE_SLAYER = '杀死凯恩·血蹄。',
    AN_LORTHEMAR_SLAYER = '死于奎尔萨拉斯',
    AD_LORTHEMAR_SLAYER = '杀死洛瑟玛·塞隆。',

    AN_HORDE_KINGS_SLAYER = '为了联盟！',
    AD_HORDE_KINGS_SLAYER = '杀死部落的领袖。',

    AN_RACES_KILLER = '知己知彼',
    AD_ALLIANCE_RACES_KILLER = '亲手对五个不同种族的成员进行荣誉击杀。',
    AD_HORDE_RACES_KILLER = '亲手对五个不同种族的成员进行荣誉击杀。',
    AC_HUMAN_KILLED = '人类',
    AC_NIGHTELF_KILLED = '暗夜精灵',
    AC_DWARF_KILLED = '矮人',
    AC_GNOME_KILLED = '侏儒',
    AC_ORC_KILLED = '兽人',
    AC_TROLL_KILLED = '巨魔',
    AC_SCOURGE_KILLED = '亡灵',
    AC_TAUREN_KILLED = '牛头人',
    AC_DRAENEI_KILLED = '德莱尼',
    AC_BLOODELF_KILLED = '血精灵',

    AN_CLASSES_KILLER = '职业杀手',
    AD_CLASSES_KILLER = '亲手对下列职业中的一种进行荣誉击杀。',
    AC_WARRIOR_KILLED = '战士',
    AC_HUNTER_KILLED = '猎人',
    AC_ROGUE_KILLED = '潜行者',
    AC_PRIEST_KILLED = '牧师',
    AC_MAGE_KILLED = '法师',
    AC_WARLOCK_KILLED = '术士',
    AC_DRUID_KILLED = '德鲁伊',
    AC_PALADIN_KILLED = '圣骑士',
    AC_SHAMAN_KILLED = '萨满祭司',

    AN_ALTERAC_WIN = '奥特兰克山谷胜利',
    AD_ALTERAC_WIN = '在奥特兰克山谷获胜。',
    AN_ALTERAC_WINS = '奥特兰克山谷精英',
    AD_ALTERAC_WINS = 'Erringt %d Siege im Alteractal.', --#--#--
    AN_WARSONG_WIN = '战歌峡谷胜利',
    AD_WARSONG_WIN = '在战歌峡谷获胜。',
    AN_WARSONG_WINS = '战歌峡谷精英',
    AD_WARSONG_WINS = '在战歌峡谷获得%d场胜利。',
    AN_ARATHI_WIN = '阿拉希盆地胜利',
    AD_ARATHI_WIN = '在阿拉希盆地获胜。',
    AN_ARATHI_WINS = '阿拉希盆地精英',
    AD_ARATHI_WINS = '在阿拉希盆地获得%d场胜利。',
    AN_EYE_WIN = '风暴之眼胜利',
    AD_EYE_WIN = '在风暴之眼获胜。',
    AN_EYE_WINS = '风暴之眼精英',
    AD_EYE_WINS = 'Erringt %d Siege im Auge des Sturms.', --#--#--

    AN_ALTERAC_KILLING_BLOWS = 'Fleischwolf des Alteractals', --#--#--
    AD_ALTERAC_KILLING_BLOWS = 'Erreicht %d Todesstöße während einer einzigen Schlacht im Alteractal und bleibt bis zu deren Ende.', --#--#--
    AN_ALTERAC_GRAVEYARD_ASSAULT = '奥特兰克盗墓贼',
    AD_ALTERAC_GRAVEYARD_ASSAULT = '在奥特兰克山谷夺取50处墓地。',
    AN_ALTERAC_GRAVEYARD_ASSAULTS = 'Es fehlt an Särgen', --#--#--
    AD_ALTERAC_GRAVEYARD_ASSAULTS = 'Nehmt %d Friedhöfe während einer einzigen Schlacht im Alteractal ein und bleibt bis zu deren Ende.', --#--#--
    AN_ALTERAC_GRAVEYARD_DEFEND = 'Verteidiger der Verstorbenen', --#--#--
    AD_ALTERAC_GRAVEYARD_DEFEND = 'Verteidigt einen Friedhof während einer einzigen Schlacht im Alteractal und bleibt bis zu deren Ende.', --#--#--
    AN_ALTERAC_GRAVEYARD_DEFENDS = 'Verteidiger der Toten', --#--#--
    AD_ALTERAC_GRAVEYARD_DEFENDS = 'Verteidigt %d Friedhöfe während einer einzigen Schlacht im Alteractal und bleibt bis zu deren Ende.', --#--#--
    AN_ALTERAC_TOWER_ASSAULT = 'Nun gehört er mir!', --#--#--
    AD_ALTERAC_TOWER_ASSAULT = 'Nehmt einen Turm während einer einzigen Schlacht im Alteractal ein und und bleibt bis zu deren Ende.', --#--#--
    AN_ALTERAC_TOWER_ASSAULTS = 'Nun gehört ALLES mir!', --#--#--
    AD_ALTERAC_TOWER_ASSAULTS = 'Nehmt %d Türme während einer einzigen Schlacht im Alteractal ein und bleibt bis zu deren Ende.', --#--#--
    AN_ALTERAC_TOWER_DEFEND = 'Turmwächter', --#--#--
    AD_ALTERAC_TOWER_DEFEND = 'Verteidigt einen Turm während einer einzigen Schlacht im Alteractal und bleibt bis zu deren Ende.', --#--#--
    AN_ALTERAC_TOWER_DEFENDS = 'Turmverteidiger', --#--#--
    AD_ALTERAC_TOWER_DEFENDS = 'Verteidigt %d Türme während einer einzigen Schlacht im Alteractal und bleibt bis zu deren Ende.', --#--#--
    AN_ALTERAC_MINE_CAPTURE = 'Gefrorener Bergmann', --#--#--
    AD_ALTERAC_MINE_CAPTURE = 'Nehmt eine Mine während einer einzigen Schlacht im Alteractal ein und bleibt bis zu deren Ende.', --#--#--
    AN_ALTERAC_MINE_CAPTURES = 'Gefrorener Pikenier', --#--#--
    AD_ALTERAC_MINE_CAPTURES = 'Nehmt %d Minen während einer einzigen Schlacht im Alteractal ein und bleibt bis zu deren Ende.', --#--#--
    AN_ALTERAC_AUTOGRAPH = '曝光的照片',
    AD_ALTERAC_AUTOGRAPH = '在奥特兰克山谷中拾取提古勒的签名照。',

    AN_WARSONG_KILLS = 'Militärische Auszeichnung', --#--#--
    AD_WARSONG_KILLS = 'Erreicht %d ehrenhafte Siege während einer einzigen Schlacht in der Kriegshymnenschlucht und bleibt bis zu deren Ende.', --#--#--
    AN_WARSONG_FLAG_CAPTURE = '夺旗',
    AD_WARSONG_FLAG_CAPTURE = '在战歌峡谷中夺取并运回旗帜。',
    AN_WARSONG_FLAG_CAPTURES = 'Großartiger Flaggenträger', --#--#--
    AD_WARSONG_FLAG_CAPTURES = 'Ergreift und erobert %d gegnerische Flaggen während einer einzigen Schlacht in der Kriegshymnenschlucht und bleibt bis zu deren Ende.', --#--#--
    AN_WARSONG_FLAG_RETURN = 'Fasst das nicht an!', --#--#--
    AD_WARSONG_FLAG_RETURN = 'Bringt als Verteidiger eine Flagge während einer einzigen Schlacht in der Kriegshymnenschlucht zurück und bleibt bis zu deren Ende.', --#--#--
    AN_WARSONG_FLAG_RETURNS = '坚强的卫士',
    AD_WARSONG_FLAG_RETURNS = 'Bringt als Verteidiger %d Flaggen während einer einzigen Schlacht in der Kriegshymnenschlucht zurück und bleibt bis zu deren Ende.', --#--#--

    AN_ARATHI_BASE_ASSAULT = 'Konquistador', --#--#--
    AD_ARATHI_BASE_ASSAULT = 'Erobert eine Basis während einer einzigen Schlacht im Arathibecken und bleibt bis zu deren Ende.', --#--#--
    AN_ARATHI_BASE_ASSAULTS = '夺旗能手',
    AD_ARATHI_BASE_ASSAULTS = 'Erobert %d Basen während einer einzigen Schlacht im Arathibecken und bleibt bis zu deren Ende.', --#--#--
    AN_ARATHI_BASE_DEFEND = 'Beschützer', --#--#--
    AD_ARATHI_BASE_DEFEND = 'Verteidigt eine Basis während einer einzigen Schlacht im Arathibecken und bleibt bis zu deren Ende.', --#--#--
    AN_ARATHI_BASE_DEFENDS = 'Wächter', --#--#--
    AD_ARATHI_BASE_DEFENDS = 'Verteidigt %d Basen während einer einzigen Schlacht im Arathibecken und bleibt bis zu deren Ende.', --#--#--
    AN_ARATHI_CLOSE = '完胜！*咳*',
    AD_ARATHI_CLOSE = '在阿拉希盆地以1600比1590获胜。',
    AN_ARATHI_PERFECT = '完美阿拉希盆地',
    AD_ARATHI_PERFECT = '在阿拉希盆地以1600比0获胜。',

    AN_EYE_CAPTURE = '风暴旗手',
    AD_EYE_CAPTURE = '在风暴之眼中夺取并运回旗帜。',
    AD_EYE_CAPTURES = 'Ergreift und erobert persönlich %d Flaggen im Auge des Sturms und bleibt bis zum Ende der Schlacht.', --#--#--
    AN_EYE_GLORY = '荣耀之跃',
    AD_EYE_GLORY = '在一场风暴之眼的战斗中，在不死亡的情况下夺取3次旗帜。',
    AN_EYE_FAST_WIN = '疾风闪电',
    AD_EYE_FAST_WIN = '在6分钟内获得风暴之眼的胜利。',
    AN_EYE_BERSERK = '嗜血的狂暴者',
    AD_EYE_BERSERK = '在风暴之眼的战斗中，携带狂暴效果并杀死一名敌人。',
    AN_EYE_IDEAL_VICTORY = '完美风暴',
    AD_EYE_IDEAL_VICTORY = '在风暴之眼以1600比0获胜。',

    AN_BGS_KILLING_BLOWS = '死亡召唤者',
    AD_BGS_KILLING_BLOWS = 'Erringt %d Todesstöße auf einem beliebigen Schlachtfeld.', --#--#--
    AN_BGS_KILLS = '恐怖收割者',
    AD_BGS_KILLS = 'Erringt %d ehrenhafte Siege auf einem beliebigen Schlachtfeld.', --#--#--

    PROF_FIRST_AID = '急救',
    PROF_FISHING = '钓鱼',
    PROF_COOKING = '烹饪',
    PROF_ENCHANTING = '附魔',
    PROF_TAILORING = '裁缝',
    PROF_ENGINEERING = '工程学',
    PROF_LEATHERWORKING = '制皮',
    PROF_ALCHEMY = '炼金术',
    PROF_BLACKSMITHING = '锻造',
    PROF_HERBALISM = '草药学',
    PROF_MINING = '采矿',
    PROF_SKINNING = '剥皮',
    PROF_JEWELCRAFTING = '珠宝加工',
    SKILL_UNARMED = '徒手战斗',
    SKILL_RIDING = '骑术',

    AN_PROFS_JOURNEYMAN = 'Lehrlingsprüfung', --#--#--
    AD_PROFS_JOURNEYMAN = 'Erlangt 75 Fertigkeitspunkte in einem Beruf.', --#--#--
    AN_PROFS_EXPERT = '中级专业水准',
    AD_PROFS_EXPERT = '在一种专业中达到中级水准。',
    AN_PROFS_ARTISAN = '高级专业水准',
    AD_PROFS_ARTISAN = '在一种专业中达到高级水准。',
    AN_PROFS_ONE = 'Professioneller Fachmann', --#--#--
    AD_PROFS_ONE = 'Erlangt 300 Fertigkeitspunkte in einem Beruf.', --#--#--
    AN_PROFS_ONE_OUTLAND = '大师级专业水准',
    AD_PROFS_ONE_OUTLAND = '在一种专业中达到大师级水准。',
    AN_PROFS_TWO = 'Handwerker', --#--#--
    AD_PROFS_TWO = 'Werdet gleichzeitig in zwei Berufen Fachmann.', --#--#--
    AC_PROFS_TWO = 'Werdet gleichzeitig in zwei Berufen Fachmann.', --#--#--
    AN_PROFS_TWO_OUTLAND = 'Handwerker der Scherbenwelt', --#--#--
    AD_PROFS_TWO_OUTLAND = 'Werdet gleichzeitig in zwei Berufen Meister.', --#--#--
    AC_PROFS_TWO_OUTLAND = 'Werdet gleichzeitig in zwei Berufen Meister.', --#--#--

    AN_FIRST_AID_JOURNEYMAN = 'Lehrling in Erster Hilfe', --#--#--
    AD_FIRST_AID_JOURNEYMAN = 'Erlangt 75 Fertigkeitspunkte in Erster Hilfe.', --#--#--
    AN_FIRST_AID_EXPERT = '中级急救',
    AD_FIRST_AID_EXPERT = '成为一名中级急救师。',
    AN_FIRST_AID_ARTISAN = '高级急救师',
    AD_FIRST_AID_ARTISAN = '成为一名高级急救师。',
    AN_FIRST_AID_MASTER = 'Fachmann in Erster Hilfe', --#--#--
    AD_FIRST_AID_MASTER = 'Erlangt 300 Fertigkeitspunkte in Erster Hilfe.', --#--#--
    AN_FIRST_AID_OUTLAND_MASTER = '大师级急救师',
    AD_FIRST_AID_OUTLAND_MASTER = '成为一名大师级急救师。',
	
    AN_FISHING_JOURNEYMAN = 'Anglerlehrling', --#--#--
    AD_FISHING_JOURNEYMAN = 'Erlangt 75 Fertigkeitspunkte im Angeln.', --#--#--
    AN_FISHING_EXPERT = '中级钓鱼',
    AD_FISHING_EXPERT = '成为一名中级渔夫。',
    AN_FISHING_ARTISAN = '高级渔夫',
    AD_FISHING_ARTISAN = '成为一名高级渔夫。',
    AN_FISHING_MASTER = '钓鱼专家',
    AD_FISHING_MASTER = '成为一名专家级渔夫。',
    AN_FISHING_OUTLAND_MASTER = '大师级渔夫',
    AD_FISHING_OUTLAND_MASTER = '成为一名大师级渔夫。',
	
    AN_COOKING_JOURNEYMAN = 'Kochlehrling', --#--#--
    AD_COOKING_JOURNEYMAN = 'Erlangt 75 Fertigkeitspunkte im Kochen.', --#--#--
    AN_COOKING_EXPERT = '中级烹饪',
    AD_COOKING_EXPERT = '成为一名中级厨师。',
    AN_COOKING_ARTISAN = '高级厨师',
    AD_COOKING_ARTISAN = '成为一名高级厨师。',
    AN_COOKING_MASTER = '烹饪专家',
    AD_COOKING_MASTER = '成为一名专家级厨师。',
    AN_COOKING_OUTLAND_MASTER = '大师级厨师',
    AD_COOKING_OUTLAND_MASTER = '成为一名大师级厨师。',
	
    AN_PROFS_SECONDARY = '自力更生',
    AD_PROFS_SECONDARY = '达到专家级的钓鱼、急救和烹饪技能。',
    AN_PROFS_SECONDARY_OUTLAND = '自力更生',
    AD_PROFS_SECONDARY_OUTLAND = '达到大师级的钓鱼、急救和烹饪技能。',
    AN_PROFS_FIVE = 'Genie', --#--#--
    AN_PROFS_FIVE_OUTLAND = 'Genie der Scherbenwelt', --#--#--
    AD_PROFS_FIVE = 'Erlangt die unten aufgelisteten Berufserfolge.', --#--#--
    AN_UNARMED_SKILL = '有人想吃一拳吗？',
    AD_UNARMED_SKILL = '徒手技能达到350。',

    AN_EXPLORE_AZEROTH = '世界探索者',
    AD_EXPLORE_AZEROTH = '探索东部王国、卡利姆多和外域。',
	AR_EXPLORER = 'Entdecker', --#--#--
    AN_EXPLORE_KALIMDOR = '探索卡利姆多',
    AD_EXPLORE_KALIMDOR = '探索卡利姆多的各个区域。',
    AN_EXPLORE_EASTERN_KINGDOMS = '探索东部王国',
    AD_EXPLORE_EASTERN_KINGDOMS = '探索东部王国的各个区域。',
	AN_EXPLORE = 'Erforscht %s', --#--#--
    AD_EXPLORE = 'Erforscht %s und enthüllt die verdeckten Gebiete auf der Weltkarte.', --#--#--

    AN_SULFURAS = '萨弗拉斯，炎魔拉格纳罗斯之手',
    AD_SULFURAS = '获得萨弗拉斯，炎魔拉格纳罗斯之手。',
    AN_THUNDER_FURY = '雷霆之怒，逐风者的祝福之剑',
    AD_THUNDER_FURY = '获得雷霆之怒，逐风者的祝福之剑。',
    AN_ATIESH = '埃提耶什，守护者的传说之杖',
    AD_ATIESH = '获得埃提耶什，守护者的传说之杖。',
    AN_BLACK_SCARAB = '甲虫之王',
    AD_BLACK_SCARAB = '打开安其拉之门。',
    AN_RED_SCARAB = '红色是身份的象征',
    AD_RED_SCARAB = '获得一枚红色其拉共鸣水晶。',
	AN_TIGER_MOUNT = '迅捷祖利安猛虎',
    AD_TIGER_MOUNT = '从祖尔格拉布的高阶祭司塞卡尔那里获取迅捷祖利安猛虎。',
	AN_RAPTOR_MOUNT = '拉扎什迅猛龙',
    AD_RAPTOR_MOUNT = '从祖尔格拉布的血领主曼多基尔那里获取拉扎什迅猛龙。',
	AN_BARON_MOUNT = '死亡军马的缰绳',
    AD_BARON_MOUNT = '从斯坦索姆的瑞文戴尔男爵那里获取死亡军马的缰绳。',
	AN_SABER_MOUNT = '冬泉霜刃豹',
    AD_SABER_MOUNT = '获得一只冬泉霜刃豹。',
    AN_ARGENT_DAWN_TABARD = '银色黎明战袍',
    AD_ARGENT_DAWN_TABARD = '通过天灾入侵事件获得一件银色黎明战袍。',
    
    AN_UNCOMMON_GEAR = 'Selten', --#--#--
    AD_UNCOMMON_GEAR = 'Legt an jedem Platz einen Gegenstand von seltener Qualität an.', --#--#--
    AN_RARE_GEAR = '精良',
    AD_RARE_GEAR = '在身上的每一个装备栏中都装备一件物品等级不低于115级的精良品质物品。',
    AN_EPIC_GEAR = '史诗',
    AD_EPIC_GEAR = '在身上的每一个装备栏中都装备一件物品等级不低于115级的史诗品质物品。',

    AN_STOCKING_UP = '囤积绷带',
    AD_STOCKING_UP = '制造500条厚灵纹布绷带。',
    AC_STOCKING_UP = 'Stellt 100 schwere Runenstoffverbände her', --#--#--
    AN_STOCKING_UP_2 = '囤积绷带',
    AD_STOCKING_UP_2 = '制造500条厚符文布绷带。',
    AC_STOCKING_UP_2 = '制造500条厚符文布绷带。',
    AN_STOCKING_UP_OUTLAND = 'Vorbereitung für die Leere', --#--#--
    AD_STOCKING_UP_OUTLAND = 'Stellt 100 schwere Netherstoffverbände her.', --#--#--
    AC_STOCKING_UP_OUTLAND = 'Stellt 100 schwere Netherstoffverbände her', --#--#--
    AN_STOCKING_UP_2_OUTLAND = '囤积绷带',
    AD_STOCKING_UP_2_OUTLAND = '制造500条厚灵纹布绷带。',
    AC_STOCKING_UP_2_OUTLAND = '制造500条厚灵纹布绷带。',

    AN_BOOTY_BAY_CONTEST = 'Für\'s Angeln nur das Beste!', --#--#--
    AD_BOOTY_BAY_CONTEST = 'Gewinnt den Angelwettbewerb in der Beutebucht und wählt die Arkanitangel oder den Angelhaken des Anglermeisters als Belohnung.', --#--#--
    AN_BOOTY_BAY_FISH = 'Echter Fischliebhaber', --#--#--
    AD_BOOTY_BAY_FISH = 'Angelt einen der besonderen Fische während des Angelwettbewerbs in der Beutebucht.', --#--#--

    AN_FISHING_COLLECTION = 'Fischsammlung', --#--#--
    AD_FISHING_COLLECTION = 'Fangt die unten aufgelisteten Fische in Azeroth.', --#--#--
    AN_FISHING_OUTLAND_COLLECTION = 'Fischsammlung der Scherbenwelt', --#--#--
    AD_FISHING_OUTLAND_COLLECTION = 'Fangt die unten aufgelisteten Fische in der Scherbenwelt.', --#--#--
    AN_FISHING_WATER = 'Wasser aus Wasser', --#--#--
    AD_FISHING_WATER = 'Angelt eine Essenz des Wassers.', --#--#--
    AN_FISHING_RUM = 'Aufhören unmöglich', --#--#--
    AD_FISHING_RUM = 'Angelt die folgenden Rumsorten.', --#--#--
    AN_FISHING_RING = 'Geschenk von Mordor', --#--#--
    AD_FISHING_RING = 'Angelt den Einen Ring.', --#--#--
    AN_FISHING_SKULL = 'Bote eines traurigen Endes', --#--#--
    AD_FISHING_SKULL = 'Angelt Old Teamsters Schädel.', --#--#--
    AN_FISHING_SNAPPER = 'Großer Schnapperfanger', --#--#--
    AD_FISHING_SNAPPER = 'Angelt Matschschnapper der folgenden Größen.', --#--#--
    AC_FISHING_SNAPPER = '%d-pfündiger Matschschnapper', --#--#--
    AN_FISHING_SEA_BASS = 'Barschfänger', --#--#--
    AD_FISHING_SEA_BASS = 'Angelt Barsche der folgenden Größen.', --#--#--
    AC_FISHING_SEA_BASS = '%d-pfündiger Barsch', --#--#--
    AN_FISHING_SALMON = 'Lachsliebhaber', --#--#--
    AD_FISHING_SALMON = 'Angelt Lachse der folgenden Größen.', --#--#--
    AC_FISHING_SALMON = '%d-pfündiger Lachs', --#--#--
    AN_FISHING_LOBSTER = 'Hummerjäger', --#--#--
    AD_FISHING_LOBSTER = 'Angelt Hummer der folgenden Größen.', --#--#--
    AC_FISHING_LOBSTER = '%d-pfündiger Hummer', --#--#--
    AN_FISHING_BIG_SIZE = 'Der größte Angler von Azeroth', --#--#--
    AD_FISHING_BIG_SIZE = 'Schließt die unten aufgelisteten Angel-Erfolge ab.', --#--#--
	
	AN_FISHING_COUNT = '%d条鱼',
	AC_FISHING_COUNT = 'Angelt %d Gegenstände oder Fische.', --#--#--
	AD_FISHING_COUNT = '钓到%d件物品。',

    AN_COOKING_RECIPES_5 = '午餐女仆',
    AN_COOKING_RECIPES_10 = '散点厨师',
    AN_COOKING_RECIPES_25 = '二厨',
    AN_COOKING_RECIPES_50 = '副厨师长',
    AN_COOKING_RECIPES_75 = 'Chef de Cuisine', --#--#--
    AR_COOKING_RECIPES = 'Chefkoch', --#--#--
    AD_COOKING_RECIPES = '学习%d个烹饪食谱。',
    AC_COOKING_RECIPES = 'Lernt %d Kochrezepte', --#--#--

    AN_COOKING_SOUP = 'Suppenkocher', --#--#--
    AN_COOKING_DESSERT = 'Knollenmeister', --#--#--
    AN_COOKING_SQUID = 'Fang des Tages', --#--#--
    AN_COOKING_DUMPLINGS = 'Omas Knödel', --#--#--
    AN_COOKING_CAKE = '蛋糕不是谎言',
    AD_COOKING_CAKE = '烘焙一块美味巧克力蛋糕。',
    AD_COOKING_CREATE = 'Kocht %s %d-mal.', --#--#--
    AC_COOKING_CREATE = 'Kocht %s %d-mal', --#--#--
    AN_COOKING_BIG_TABLE = '向大厨致敬',
    AD_COOKING_BIG_TABLE = '完成下列烹饪成就。',

    AN_COOKING_FISHERMANS_FEAST = '渔夫的美味',
    AN_COOKING_SPICY_HOT_TALBUK = '热辣塔布羊排',
    AN_COOKING_SKULLFISH_SOUP = '骨鱼汤',
    AN_COOKING_RAVAGER_DOG = '掠食者热狗',

    AN_WB_AZUREGOS = 'Das Geheimnis des blauen Drachens', --#--#--
    AD_WB_AZUREGOS = 'Bezwingt Azuregos.', --#--#--
    AN_WB_KAZZAK = 'Dämonen können nicht vorbei', --#--#--
    AD_WB_KAZZAK = 'Bezwingt Lord Kazzak.', --#--#--
    AN_WB_KAZZAK_OUTLAND = ' Ich bin der Meister meines Schicksals', --#--#--
    AD_WB_KAZZAK_OUTLAND = 'Bezwingt Verdammnislord Kazzak auf der Höllenfeuerhalbinsel.', --#--#--
    AN_WB_DOOMWALKER = 'Kaputter Verdammniswandler', --#--#--
    AD_WB_DOOMWALKER = 'Bezwingt den Verdammniswandler im Schattenmondtal.', --#--#--
    AN_WB_YSONDRE = 'Kein Platz für Mädchen in einem Albtraum', --#--#--
    AD_WB_YSONDRE = 'Bezwingt Ysondre.', --#--#--
    AN_WB_LETHON = 'Kind des Smaragdgrünen Albtraums', --#--#--
    AD_WB_LETHON = 'Bezwingt Lethon.', --#--#--
    AN_WB_EMERISS = 'Emeriss, Verräter des Lebens', --#--#--
    AD_WB_EMERISS = 'Bezwingt Emeriss.', --#--#--
    AN_WB_TAERAR = 'Albtraumhafte Taerar', --#--#--
    AD_WB_TAERAR = 'Bezwingt Taerar.', --#--#--
    AN_WB_EMERALD_DRAGONS = 'Smaragdgrüner Wächter', --#--#--
    AD_WB_EMERALD_DRAGONS = 'Bezwingt alle Drachen des Smaragdgrünen Albtraums.', --#--#--

    AN_DUEL = '决斗赢家',
    AD_DUEL = '在与其他玩家的决斗中获胜。',
    AN_DUELS_10 = '决斗者',
    AN_DUELS_25 = 'Geübter Duellist', --#--#--
    AN_DUELS_100 = 'Meister-Duellist', --#--#--
    AD_DUELS = 'Gewinnt in %d Duellen.', --#--#--
    AC_DUELS = 'Gewinnt in %d Duellen', --#--#--
    AN_GURUBASHI_1 = '竞技场高手饰物',
    AD_GURUBASHI_1 = '从古拉巴什竞技场拾取竞技场高手饰物。',
    AN_GURUBASHI_2 = '古拉巴什竞技场大师',
    AD_GURUBASHI_2 = '完成小个子约翰·米斯瑞尔的任务，获得竞技场大师饰物。',
    AN_PARTICIPATE_IN_BGS = '战斗的召唤！',
    AD_PARTICIPATE_IN_BGS = 'Schließt %d Schlachtfelder ab.', --#--#--
    AC_PARTICIPATE_IN_BGS = 'Schließt %d Schlachtfelder ab.', --#--#--

    EMOTE_LOVE1 = 'Ihr liebt %s.', --#--#--
    AN_LOVE = '我亲爱的小松鼠们',
    AD_LOVE = '向艾泽拉斯的小动物展示你的爱心（使用/love命令）。',
    AN_LOVE_TBC = '无论远近，小动物都惹人爱',
    AD_LOVE_TBC = '向黑暗之门彼端的小动物表达你的爱意（使用/love命令）。',
    NPC_22480 = '棕色土拨鼠',
    NPC_22306 = '敏捷的洞穴蛛',
    NPC_22842 = '考瓦克斯',
    NPC_22843 = '鲁克',
    NPC_19665 = '母羊',
    NPC_19154 = '锐锐',
    NPC_19482 = '萨根',
    NPC_20411 = '鬼牛',
    EMOTE_PAT1 = 'Ihr streichelt %s.', --#--#--
    AN_ARATHI_CATS = 'Katzen sind am wichtigsten', --#--#--
    AD_ARATHI_CATS = 'Streichelt die angegebenen Haustiere im Arathibecken (/streicheln).', --#--#--

    AN_ALTERAC_FAST_WIN = '奥特兰克闪击战',
    AD_ALTERAC_FAST_WIN = '在6分钟内获得奥特兰克山谷的胜利。',
    AN_WARSONG_FAST_WIN = '战歌如风',
    AD_WARSONG_FAST_WIN = '在7分钟内赢得战歌峡谷的胜利。',
    AN_ARATHI_FAST_WIN = '一鼓作气',
    AD_ARATHI_FAST_WIN = '在6分钟内获得阿拉希盆地的胜利。',

    AN_ALTERAC_TOWER_DEFEND_TOTAL = '防御哨塔',
    AD_ALTERAC_TOWER_DEFEND_TOTAL = '在奥特兰克山谷中保卫%d次哨塔。',
    AN_ALTERAC_GRAVEYARD_ASSAULT_TOTAL = '奥特兰克盗墓贼',
    AD_ALTERAC_GRAVEYARD_ASSAULT_TOTAL = '在奥特兰克山谷夺取%d处墓地。',
    AN_WARSONG_FLAG_CAPTURE_TOTAL = '夺旗',
    AD_WARSONG_FLAG_CAPTURE_TOTAL = 'Ergreift und erobert persönlich %d Flaggen in der Kriegshymnenschlucht.', --#--#--
    AN_WARSONG_FLAG_RETURN_TOTAL = '坚强的卫士',
    AD_WARSONG_FLAG_RETURN_TOTAL = '在战歌峡谷中夺回本方的%d面旗帜。',
    AN_ARATHI_BASE_ASSAULT_TOTAL = '夺旗能手',
    AD_ARATHI_BASE_ASSAULT_TOTAL = '在阿拉希盆地夺取%d面旗帜。',
    AN_ARATHI_BASE_DEFEND_TOTAL = '雷霆救兵！',
    AD_ARATHI_BASE_DEFEND_TOTAL = '在阿拉希盆地中，通过夺回旗帜保卫%d次基地。',
    AN_ALTERAC_MOUNT_HORDE = '霜狼嗥叫者',
    AD_ALTERAC_MOUNT_HORDE = '获得一头霜狼嗥叫者。',
    AN_ALTERAC_MOUNT_ALLIANCE = '雷矛军用坐骑',
    AD_ALTERAC_MOUNT_ALLIANCE = '获得一头雷矛军用坐骑。',

    AN_ALTERAC_BOSS = '奥特兰克山谷主宰',
    AD_ALTERAC_BOSS = '完成下列奥特兰克山谷成就。',
    AN_WARSONG_BOSS = '战歌峡谷主宰',
    AD_WARSONG_BOSS = '完成下列战歌峡谷成就。',
    AN_ARATHI_BOSS = '阿拉希盆地主宰',
    AD_ARATHI_BOSS = '完成下列阿拉希盆地成就。',
    AN_EYE_BOSS = '风暴之眼主宰',
    AD_EYE_BOSS = '完成下列风暴之眼成就。',
    AN_BATTLEMASTER = '战斗大师',
    AD_BATTLEMASTER = '完成下列战场成就。',
    AR_BATTLEMASTER = '头衔奖励：战斗大师',

    AN_LEEROY = '灭团之星',
    AD_LEEROY = '在15秒内杀死50条群居雏龙。',
    AR_LEEROY = '头衔：火车王',
    AN_BWL_DUO = 'Doppelter Atem', --#--#--
    AD_BWL_DUO = 'Bezwingt Schattenschwinge und Flammenmaul innerhalb von 45 Sekunden.', --#--#--
    AN_ANUBREKHAN_WITHOUT_MOBS = 'Der böse Spinnenlord', --#--#--
    AD_ANUBREKHAN_WITHOUT_MOBS = 'Bezwingt Anub\'Rekhan in Naxxramas, während beide Gruftwachen am Leben sind.', --#--#--
    AN_FAERLINA_WITHOUT_MOBS = 'Witwenjäger', --#--#--
    AD_FAERLINA_WITHOUT_MOBS = 'Bezwingt Großwitwe Faerlina in Naxxramas, während alle Anhänger und Jünger von Naxxramas am Leben sind.', --#--#--
    AN_SAPPHIRONE_WITH_ALL_ALIVE = 'Ziemlich frostig hier', --#--#--
    AD_SAPPHIRONE_WITH_ALL_ALIVE = 'Bezwingt Saphiron in Naxxramas, ohne dass jemand aus dem Schlachtzug stirbt.', --#--#--
    AN_ARACHNOPHOBIA = 'Arachnophobie', --#--#--
    AD_ARACHNOPHOBIA = 'Bezwingt Maexxna in Naxxramas innerhalb von 20 Minuten nach Anub\'Rekhans Tod.', --#--#--
    AN_FOUR_TOGETHER = 'Zusammen bis in den Tod', --#--#--
    AD_FOUR_TOGETHER = 'Bezwingt die Vier Reiter in Naxxramas, wobei sie im Abstand von höchstens 15 Sekunden hintereinander sterben müssen.', --#--#--
    AN_HEIGAN_DANCE = 'Auf Nummer sicher', --#--#--
    AD_HEIGAN_DANCE = 'Bezwingt Heigan den Unreinen in Naxxramas, ohne dass jemand aus dem Schlachtzug stirbt.', --#--#--
    AN_PATCHWERK = 'Legt Flickwerk schnell das Handwerk', --#--#--
    AD_PATCHWERK = 'Bezwingt Flickwerk in Naxxramas in höchstens 3 Minuten.', --#--#--
    AN_KELTHUZAD_ABOMINATIONS = 'Ich krieg\' einfach nicht genug', --#--#--
    AD_KELTHUZAD_ABOMINATIONS = 'Bezwingt Kel\'Thuzad in Naxxramas, nachdem ihr mindestens 18 Monstrositäten in seiner Kammer besiegt habt.', --#--#--
	
	AN_PIRATES_HAT = '遵命，船长！',
	AD_PIRATES_HAT = '获得血帆舰长之帽……然后出门去呼吸一点新鲜空气。',
	AR_PIRATES_HAT = '头衔：血帆舰队司令',
	AN_PALADIN_MOUNT = '军马',
	AD_PALADIN_MOUNT = '完成圣骑士的军马任务。',
	AN_WARLOCK_MOUNT = '克索诺斯的恐惧战马',
	AD_WARLOCK_MOUNT = '完成克索诺斯的恐惧战马任务。',
	
	AN_HALLOWSEND = '神圣之名',
	AD_HALLOWSEND = '完成下列万圣节成就。',
	AR_HALLOWSEND = '头衔奖励：神圣的',
	
	AN_PUMPKIN = 'Ziemlich gruselig', --#--#--
	AD_PUMPKIN = 'Erhaltet eine Kürbistasche während der Schlotternächte.', --#--#--
	AN_HALLOWSEND_ALLIANCE_QUEST1 = '糟糕的万圣节',
	AD_HALLOWSEND_ALLIANCE_QUEST1 = '完成哈特曼中士交予的破坏稻草人庆典和清理南海镇臭气弹的任务，把部落的万圣节搞砸。',
	AC_HALLOWSEND_ALLIANCE_QUEST1_CRITERIA1 = '稻草人的节日',
	AC_HALLOWSEND_ALLIANCE_QUEST1_CRITERIA2 = '松木的力量',
	AN_HALLOWSEND_HORDE_QUEST1 = '糟糕的万圣节',
	AD_HALLOWSEND_HORDE_QUEST1 = '完成黑暗召唤者雅恩卡交予的在南海镇向酒桶里扔烂鸡蛋和在镇中投掷臭气弹的任务，把联盟的万圣节搞砸。',
	AC_HALLOWSEND_HORDE_QUEST1_CRITERIA1 = '腐烂的鸡蛋和恶臭的酒',
	AC_HALLOWSEND_HORDE_QUEST1_CRITERIA2 = '臭气熏天的南海镇',
	
	AN_HALLOWSEND_ALLIANCE_QUEST2 = 'Schlotternachtssüßigkeiten für Jesper!', --#--#--
	AD_HALLOWSEND_ALLIANCE_QUEST2 = 'Sammelt die gewünschten Süßigkeiten für Jesper.', --#--#--
	AC_HALLOWSEND_ALLIANCE_QUEST2_CRITERIA1 = 'Nugat aus Sturmwind', --#--#--
	AC_HALLOWSEND_ALLIANCE_QUEST2_CRITERIA2 = 'Kaugummikugel aus Gnomeregan', --#--#--
	AC_HALLOWSEND_ALLIANCE_QUEST2_CRITERIA3 = 'Pfefferminzbonbon aus Eisenschmiede', --#--#--
	AC_HALLOWSEND_ALLIANCE_QUEST2_CRITERIA4 = 'Marzipan aus Darnassus', --#--#--
	AN_HALLOWSEND_HORDE_QUEST2 = 'Schlotternachtssüßigkeiten für Spoops!', --#--#--
	AD_HALLOWSEND_HORDE_QUEST2 = 'Sammelt die gewünschten Süßigkeiten für Spoops.', --#--#--
	AC_HALLOWSEND_HORDE_QUEST2_CRITERIA1 = 'Nugat aus Orgrimmar', --#--#--
	AC_HALLOWSEND_HORDE_QUEST2_CRITERIA2 = 'Kaugummikugel der Dunkelspeertrolle', --#--#--
	AC_HALLOWSEND_HORDE_QUEST2_CRITERIA3 = 'Pfefferminzbonbon aus Unterstadt', --#--#--
	AC_HALLOWSEND_HORDE_QUEST2_CRITERIA4 = 'Marzipan aus Donnerfels', --#--#--
	
	AN_HALLOWSEND_INVOCATION_BUFF = 'Anrufung des Weidenmanns', --#--#--
	AD_HALLOWSEND_INVOCATION_BUFF = 'Erhaltet während der Schlotternächte den Stärkungszauber "Anrufung des Weidenmanns".', --#--#--
	
	AN_HALLOWSEND_TREATS = '不给糖果就捣乱！',
	AD_HALLOWSEND_TREATS = '从任意一座旅店的糖罐里获取糖果。',
	
	AN_HALLOWSEND_MASK = '面具怪杰',
	AD_HALLOWSEND_MASK = '在万圣节期间获得一张劣质面具。',
	
	AN_HALLOWSEND_MASKS = '一张面具应万变',
	AD_HALLOWSEND_MASKS = '收集下列20种不同的劣质面具。',
	
	AN_HALLOWSEND_TRANSFORM = '化妆舞会',
	AD_HALLOWSEND_TRANSFORM = '被下列万圣节魔棒变形。',
	AC_HALLOWSEND_GHOST = '被万圣节魔棒 - 鬼魂变形',
	AC_HALLOWSEND_GNOME = '被万圣节魔棒 - 麻风侏儒变形',
	AC_HALLOWSEND_WISP = '被万圣节魔棒 - 小精灵变形',
	AC_HALLOWSEND_NINJA = '被万圣节魔棒 - 忍者变形',
	AC_HALLOWSEND_SKELETON = '被万圣节魔棒 - 骷髅变形',
	AC_HALLOWSEND_PIRATE = '被万圣节魔棒 - 海盗变形',
	AC_HALLOWSEND_BAT = '被万圣节魔棒 - 蝙蝠变形',

    --WINTERVEIL
    AN_WINTERVEIL = '欢乐使者',
	AD_WINTERVEIL = '完成下列冬幕节成就。',
	AR_WINTERVEIL = '头衔奖励：欢乐使者',

    AN_WINTERVEIL_METZEN = '拯救梅森！',
	AD_WINTERVEIL_METZEN = '拯救驯鹿梅森。',

    AN_WINTERVEIL_SMOKEYWOOD = '真讨厌',
	AD_WINTERVEIL_SMOKEYWOOD = '完成夺回被偷走的烟林牧场礼物的任务，并获得烟林牧场的感谢。',

    AN_WINTERVEIL_GOURMET = '冬幕节美食家',
	AD_WINTERVEIL_GOURMET = '在冬幕节期间，运用你的烹饪技巧制作一份小姜饼、一份蛋奶酒和一份热苹果酒。',
    AC_WINTERVEIL_GOURMET_CRITERIA1 = '小姜饼',
    AC_WINTERVEIL_GOURMET_CRITERIA2 = '蛋奶酒',

    AN_WINTERVEIL_PRESENTS = '他知道你是不是乖孩子',
	AD_WINTERVEIL_PRESENTS = '在冬幕节期间，打开树下的一件礼物。',

    AN_WINTERVEIL_SNOWBALL_ALLIANCE = '冬幕节见鬼去吧！',
	AD_WINTERVEIL_SNOWBALL_ALLIANCE = '在冬幕节期间，向国王麦格尼·铜须投掷一枚雪球。',

    AN_WINTERVEIL_SNOWBALL_HORDE = '冬幕节见鬼去吧！',
	AD_WINTERVEIL_SNOWBALL_HORDE = '在冬幕节期间，向凯恩·血蹄投掷一枚雪球。',

    AN_WINTERVEIL_PVP = '我的小帮手',
    AD_WINTERVEIL_PVP = '通过欢乐制造器变成冬天爷爷的小助手，然后获得50个荣誉击杀。',

    --VALENTINES
    AN_VALENTINES = 'Liebestoll', --#--#--
	AD_VALENTINES = 'Schließt die unten aufgelisteten Erfolge von \'Liebe liegt in der Luft\' ab.', --#--#--

    AN_VALENTINES_ROSES = 'Sag\'s mit Rosen', --#--#--
    AD_VALENTINES_ROSES = 'Erhaltet während der \'Liebe liegt in der Luft\'-Feierlichkeiten einen roten Rosenstrauß.', --#--#--

    AN_VALENTINES_QUEST = 'Gefährliche Liebschaft', --#--#--
    AD_VALENTINES_QUEST = 'Helft dem Dampfdruckkartell dabei, den Plan der Chemiemanufaktur Krone zu vereiteln.', --#--#--

    AN_VALENTINES_CHOCOLATES = 'Naschkatze', --#--#--
    AD_VALENTINES_CHOCOLATES = 'Probiert die unten aufgelisteten \'Liebe liegt in der Luft\'-Süßigkeiten.', --#--#--
    AC_VALENTINES_CHOCOLATES_CRITERIA1 = '黑色欲望',
    AC_VALENTINES_CHOCOLATES_CRITERIA2 = '快乐奶油',
    AC_VALENTINES_CHOCOLATES_CRITERIA3 = '甜蜜惊喜',
    AC_VALENTINES_CHOCOLATES_CRITERIA4 = '水果芬芳',

    AN_VALENTINES_DRESS = 'Das reizende Glück ist auf Eurer Seite', --#--#--
    AD_VALENTINES_DRESS = 'Öffnet einen reizenden Kleiderkarton und erhaltet ein reizendes schwarzes Kleid.', --#--#--

    AN_VALENTINES_PIDO = 'Perma-Pido', --#--#--
    AD_VALENTINES_PIDO = 'Erhaltet ein permanentes Q. Pido-Haustier, indem Ihr einen Echtsilberschaftpfeil erbeutet.', --#--#--

    --LUNAR
    AN_LUNAR = '尊敬长者',
	AD_LUNAR = '完成下列春节成就。',

    AN_LUNAR_COIN = '1枚先祖硬币',
    AD_LUNAR_COIN = '获得一枚先祖硬币。',

    AN_LUNAR_COINS = '%d枚先祖硬币',
    AD_LUNAR_COINS = '获得%d枚先祖硬币。',

    AN_LUNAR_QUEST = '艾露恩的祝福',
    AD_LUNAR_QUEST = '击败年兽并完成“艾露恩的祝福”任务。',

    AN_LUNAR_CLOTHES = '春节服装',
    AD_LUNAR_CLOTHES = '使用先祖硬币购买一件节日裤装或者节日裙装。',

    AN_LUNAR_ELDERS_DUNGEONS = '地下城中的长者',
    AD_LUNAR_ELDERS_DUNGEONS = '祭拜地下城中的长者。',
    AC_LUNAR_ELDERS_DUNGEONS_8727 = 'Urahne Fernwisper', --#--#--
    AC_LUNAR_ELDERS_DUNGEONS_8619 = 'Urahne Schwermut', --#--#--
    AC_LUNAR_ELDERS_DUNGEONS_8635 = 'Urahne Splitterfels', --#--#--
    AC_LUNAR_ELDERS_DUNGEONS_8713 = 'Urahne Sternensang', --#--#--
    AC_LUNAR_ELDERS_DUNGEONS_8644 = 'Urahne Steinwehr', --#--#--
    AC_LUNAR_ELDERS_DUNGEONS_8676 = 'Urahne Wildmähne', --#--#--

    AN_LUNAR_ELDERS_HORDE = '部落的长者',
    AD_LUNAR_ELDERS_HORDE = '祭拜部落主城中的长者。',
    AC_LUNAR_ELDERS_HORDE_8678 = '雷霆崖的麦蹄长者',
    AC_LUNAR_ELDERS_HORDE_8648 = '幽暗城的暗灵长者',
    AC_LUNAR_ELDERS_HORDE_8677 = '奥格瑞玛的暗角长者',

    AN_LUNAR_ELDERS_ALLIANCE = '联盟的长者',
    AD_LUNAR_ELDERS_ALLIANCE = '祭拜联盟主城中的长者。',
    AC_LUNAR_ELDERS_ALLIANCE_8718 = '达纳苏斯的迅刀长者',
    AC_LUNAR_ELDERS_ALLIANCE_8866 = '铁炉堡的铜须长者',
    AC_LUNAR_ELDERS_ALLIANCE_8646 = '暴风城的雷锤长者',

    AN_LUNAR_ELDERS_EASTERN_KINGDOMS = '东部王国的长者',
    AD_LUNAR_ELDERS_EASTERN_KINGDOMS = '祭拜东部王国的长者。',
    AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8636 = '燃烧平原的巨石长者',
    AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8651 = '灼热峡谷的铁环长者',
    AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8652 = '布瑞尔的灰石长者',
    AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8674 = '藏宝海湾的冰蹄长者',
    AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8716 = '祖尔格拉布的星林长者',
    AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8643 = '辛特兰的雪峰长者',
    AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8675 = '哨兵岭的逐星长者',
    AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8649 = '闪金镇的雷眉长者',
    AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8650 = '圣光之愿礼拜堂的雪冠长者',
    AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8642 = '塞尔萨玛的银脉长者',
    AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8645 = '瑟伯切尔的黑曜石长者',
    AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8722 = '西瘟疫之地的幽林长者',
    AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8647 = '诅咒之地的风怒长者',
    AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8653 = '卡拉诺斯的金井长者',
    AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8714 = '通灵学院的袭月长者',
    AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8688 = '东瘟疫之地的风路长者',
    AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8683 = '烈焰峰的晨行者长者',

    AN_LUNAR_ELDERS_KALIMDOR = '卡利姆多的长者',
    AD_LUNAR_ELDERS_KALIMDOR = '祭拜卡利姆多的长者。',
    AC_LUNAR_ELDERS_KALIMDOR_8673 = '血蹄村的血蹄长者',
    AC_LUNAR_ELDERS_KALIMDOR_8723 = '费伍德森林的夜风长者',
    AC_LUNAR_ELDERS_KALIMDOR_8684 = '加基森的梦言长者',
    AC_LUNAR_ELDERS_KALIMDOR_8726 = '冬泉谷的金矛长者',
    AC_LUNAR_ELDERS_KALIMDOR_8725 = '阿斯特兰纳的水歌长者',
    AC_LUNAR_ELDERS_KALIMDOR_8715 = '多兰纳尔的刃叶长者',
    AC_LUNAR_ELDERS_KALIMDOR_8681 = '安戈洛环形山的雷角长者',
    AC_LUNAR_ELDERS_KALIMDOR_8680 = '棘齿城的风之图腾长者',
    AC_LUNAR_ELDERS_KALIMDOR_8720 = '艾萨拉的夜光长者',
    AC_LUNAR_ELDERS_KALIMDOR_8670 = '剃刀岭的符文图腾长者',
    AC_LUNAR_ELDERS_KALIMDOR_8672 = '永望镇的石塔长者',
    AC_LUNAR_ELDERS_KALIMDOR_8686 = '陶拉祖营地的高山长者',
    AC_LUNAR_ELDERS_KALIMDOR_8654 = '希利苏斯的棱石长者',
    AC_LUNAR_ELDERS_KALIMDOR_8671 = '塔纳利斯的暴怒图腾长者',
    AC_LUNAR_ELDERS_KALIMDOR_8724 = '沙漠赛道的晨露长者',
    AC_LUNAR_ELDERS_KALIMDOR_8685 = '厄运之槌的迷雾行者长者',
    AC_LUNAR_ELDERS_KALIMDOR_8721 = '奥伯丁的星纹长者',
    AC_LUNAR_ELDERS_KALIMDOR_8717 = '十字路口的月卫长者',
    AC_LUNAR_ELDERS_KALIMDOR_8719 = '塞纳里奥要塞的刃歌长者',
    AC_LUNAR_ELDERS_KALIMDOR_8682 = '乱风岗的星眼长者',
    AC_LUNAR_ELDERS_KALIMDOR_8679 = '菲拉斯的恐怖图腾长者',

    --NOBLEGARDEN
    AN_NOBLEGARDEN_CLOTHES = '假日礼服',
    AD_NOBLEGARDEN_CLOTHES = '在复活节期间，通过打开鲜艳的彩蛋获得白色礼服衬衣和黑色礼服短裤。',
    AC_NOBLEGARDEN_CLOTHES_CRITERIA1 = '白色礼服衬衣',
    AC_NOBLEGARDEN_CLOTHES_CRITERIA2 = '黑色礼服短裤',

    AN_NOBLEGARDEN_DRESS = '应景装扮',
    AD_NOBLEGARDEN_DRESS = '在复活节期间，通过打开鲜艳的彩蛋获得一件端庄的裙子。',

    --CHILDRENS WEEK
    AN_CHILDREN = '为了孩子',
    AD_CHILDREN = '完成下列儿童周成就。',
    AR_CHILDREN = '头衔奖励：护士长/监护人',

    AN_CHILDREN_PET = '呀，真可爱！',
    AD_CHILDREN_PET = '获得一种儿童周奖励宠物。',

    AN_CHILDREN_PETS = '资深保姆',
    AD_CHILDREN_PETS = '在同一个角色上获得蛋蛋的蛋、贪睡的威利和小象项圈。',
    AC_CHILDREN_PETS1 = '小象项圈',
    AC_CHILDREN_PETS2 = '贪睡的威利',
    AC_CHILDREN_PETS3 = '蛋蛋的蛋',

    --MIDSUMMER
    AN_MIDSUMMER = '护火者',
    AD_MIDSUMMER = '完成下列仲夏火焰节成就。',

    AN_MIDSUMMER_QUEST1 = '火焰节之王',
    AD_MIDSUMMER_QUEST1 = '从敌对阵营的主城中窃取烈焰，并完成“盗贼的奖励”任务。',

    AN_MIDSUMMER_AHUNE = '冰霜之王',
    AD_MIDSUMMER_AHUNE = '消灭奴隶围栏的埃霍恩。',

    AN_MIDSUMMER_DESECRATION_HORDE = '亵渎联盟',
    AD_MIDSUMMER_DESECRATION_HORDE = '完成“东部王国灭火”、“卡利姆多灭火”和“外域灭火”成就。',

    AN_MIDSUMMER_DESECRATION_HORDE_KALIMDOR = '卡利姆多灭火',
    AD_MIDSUMMER_DESECRATION_HORDE_KALIMDOR = '亵渎联盟在卡利姆多的篝火。',
    AC_MIDSUMMER_DESECRATION_HORDE_KALIMDOR_CRITERIA_11744 = '尘泥沼泽',
    AC_MIDSUMMER_DESECRATION_HORDE_KALIMDOR_CRITERIA_11734 = '灰谷',
    AC_MIDSUMMER_DESECRATION_HORDE_KALIMDOR_CRITERIA_11738 = '秘血岛',
    AC_MIDSUMMER_DESECRATION_HORDE_KALIMDOR_CRITERIA_11740 = '黑海岸',
    AC_MIDSUMMER_DESECRATION_HORDE_KALIMDOR_CRITERIA_11746 = '菲拉斯',
    AC_MIDSUMMER_DESECRATION_HORDE_KALIMDOR_CRITERIA_11760 = '希利苏斯',
    AC_MIDSUMMER_DESECRATION_HORDE_KALIMDOR_CRITERIA_11753 = '泰达希尔',
    AC_MIDSUMMER_DESECRATION_HORDE_KALIMDOR_CRITERIA_11762 = '塔纳利斯',
    AC_MIDSUMMER_DESECRATION_HORDE_KALIMDOR_CRITERIA_11741 = '凄凉之地',
    AC_MIDSUMMER_DESECRATION_HORDE_KALIMDOR_CRITERIA_11763 = '冬泉谷',
    AC_MIDSUMMER_DESECRATION_HORDE_KALIMDOR_CRITERIA_11735 = '秘蓝岛',

    AN_MIDSUMMER_DESECRATION_HORDE_OUTLAND = '外域灭火',
    AD_MIDSUMMER_DESECRATION_HORDE_OUTLAND = '亵渎联盟在外域的篝火。',
    AC_MIDSUMMER_DESECRATION_HORDE_OUTLAND_CRITERIA_11736 = '刀锋山',
    AC_MIDSUMMER_DESECRATION_HORDE_OUTLAND_CRITERIA_11750 = '纳格兰',
    AC_MIDSUMMER_DESECRATION_HORDE_OUTLAND_CRITERIA_11759 = '虚空风暴',
    AC_MIDSUMMER_DESECRATION_HORDE_OUTLAND_CRITERIA_11752 = '影月谷',
    AC_MIDSUMMER_DESECRATION_HORDE_OUTLAND_CRITERIA_11754 = '泰罗卡森林',
    AC_MIDSUMMER_DESECRATION_HORDE_OUTLAND_CRITERIA_11758 = '赞加沼泽',
    AC_MIDSUMMER_DESECRATION_HORDE_OUTLAND_CRITERIA_11747 = '地狱火半岛',

    AN_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS = '东部王国灭火',
    AD_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS = '亵渎联盟在东部王国的篝火。',
    AC_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS_CRITERIA_11751 = '赤脊山',
    AC_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS_CRITERIA_11742 = '丹莫罗',
    AC_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS_CRITERIA_11745 = '艾尔文森林',
    AC_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS_CRITERIA_11749 = '洛克莫丹',
    AC_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS_CRITERIA_11732 = '阿拉希高地',
    AC_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS_CRITERIA_11739 = '燃烧平原',
    AC_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS_CRITERIA_11761 = '荆棘谷',
    AC_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS_CRITERIA_11755 = '辛特兰',
    AC_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS_CRITERIA_11756 = '西瘟疫之地',
    AC_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS_CRITERIA_11581 = '西部荒野',
    AC_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS_CRITERIA_11748 = '希尔斯布莱德丘陵',
    AC_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS_CRITERIA_11737 = '诅咒之地',
    AC_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS_CRITERIA_11743 = '暮色森林',
    AC_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS_CRITERIA_11757 = '湿地',

    AN_MIDSUMMER_DESECRATION_ALLIANCE = '亵渎部落',
    AD_MIDSUMMER_DESECRATION_ALLIANCE = '完成“东部王国灭火”、“卡利姆多灭火”和“外域灭火”成就。',

    AN_MIDSUMMER_DESECRATION_ALLIANCE_KALIMDOR = '卡利姆多灭火',
    AD_MIDSUMMER_DESECRATION_ALLIANCE_KALIMDOR = '亵渎部落在卡利姆多的篝火。',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_KALIMDOR_CRITERIA_11803 = '冬泉谷',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_KALIMDOR_CRITERIA_11785 = '千针石林',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_KALIMDOR_CRITERIA_11765 = '灰谷',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_KALIMDOR_CRITERIA_11769 = '凄凉之地',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_KALIMDOR_CRITERIA_11773 = '菲拉斯',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_KALIMDOR_CRITERIA_11777 = '莫高雷',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_KALIMDOR_CRITERIA_11800 = '希利苏斯',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_KALIMDOR_CRITERIA_11780 = '石爪山脉',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_KALIMDOR_CRITERIA_11802 = '塔纳利斯',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_KALIMDOR_CRITERIA_11783 = '贫瘠之地',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_KALIMDOR_CRITERIA_11770 = '杜隆塔尔',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_KALIMDOR_CRITERIA_11771 = '尘泥沼泽',

    AN_MIDSUMMER_DESECRATION_ALLIANCE_OUTLAND = '外域灭火',
    AD_MIDSUMMER_DESECRATION_ALLIANCE_OUTLAND = '亵渎部落在外域的篝火。',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_OUTLAND_CRITERIA_11767 = '刀锋山',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_OUTLAND_CRITERIA_11799 = '虚空风暴',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_OUTLAND_CRITERIA_11782 = '泰罗卡森林',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_OUTLAND_CRITERIA_11775 = '地狱火半岛',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_OUTLAND_CRITERIA_11787 = '赞加沼泽',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_OUTLAND_CRITERIA_11778 = '纳格兰',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_OUTLAND_CRITERIA_11779 = '影月谷',

    AN_MIDSUMMER_DESECRATION_ALLIANCE_EASTERN_KINGDOMS = '东部王国灭火',
    AD_MIDSUMMER_DESECRATION_ALLIANCE_EASTERN_KINGDOMS = '亵渎部落在东部王国的篝火。',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11766 = '荒芜之地',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11772 = '永歌森林',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11774 = '幽魂之地',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11776 = '希尔斯布莱德丘陵',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11768 = '燃烧平原',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11781 = '悲伤沼泽',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11764 = '阿拉希高地',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11580 = '银松森林',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11801 = '荆棘谷',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11784 = '辛特兰',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11786 = '提瑞斯法林地',

    AN_MIDSUMMER_FLAME_KEEPER_HORDE = '艾泽拉斯的火焰',
    AD_MIDSUMMER_FLAME_KEEPER_HORDE = '完成“东部王国护火者”、“卡利姆多护火者”和“外域护火者”成就。',

    AN_MIDSUMMER_FLAME_KEEPER_HORDE_KALIMDOR = '卡利姆多护火者',
    AD_MIDSUMMER_FLAME_KEEPER_HORDE_KALIMDOR = '祭拜卡利姆多的火焰。',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_KALIMDOR_CRITERIA_11841 = '灰谷',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_KALIMDOR_CRITERIA_11845 = '凄凉之地',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_KALIMDOR_CRITERIA_11846 = '杜隆塔尔',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_KALIMDOR_CRITERIA_11847 = '尘泥沼泽',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_KALIMDOR_CRITERIA_11849 = '菲拉斯',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_KALIMDOR_CRITERIA_11852 = '莫高雷',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_KALIMDOR_CRITERIA_11859 = '贫瘠之地',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_KALIMDOR_CRITERIA_11839 = '冬泉谷',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_KALIMDOR_CRITERIA_11836 = '希利苏斯',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_KALIMDOR_CRITERIA_11856 = '石爪山脉',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_KALIMDOR_CRITERIA_11861 = '千针石林',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_KALIMDOR_CRITERIA_11838 = '塔纳利斯',

    AN_MIDSUMMER_FLAME_KEEPER_HORDE_OUTLAND = '外域护火者',
    AD_MIDSUMMER_FLAME_KEEPER_HORDE_OUTLAND = '祭拜外域的火焰。',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_OUTLAND_CRITERIA_11851 = '地狱火半岛',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_OUTLAND_CRITERIA_11835 = '虚空风暴',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_OUTLAND_CRITERIA_11855 = '影月谷',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_OUTLAND_CRITERIA_11858 = '泰罗卡森林',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_OUTLAND_CRITERIA_11854 = '纳格兰',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_OUTLAND_CRITERIA_11863 = '赞加沼泽',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_OUTLAND_CRITERIA_11843 = '刀锋山',

    AN_MIDSUMMER_FLAME_KEEPER_HORDE_EASTERN_KINGDOMS = '东部王国护火者',
    AD_MIDSUMMER_FLAME_KEEPER_HORDE_EASTERN_KINGDOMS = '祭拜东部王国的火焰。',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_EASTERN_KINGDOMS_CRITERIA_11844 = '燃烧平原',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_EASTERN_KINGDOMS_CRITERIA_11840 = '阿拉希高地',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_EASTERN_KINGDOMS_CRITERIA_11584 = '银松森林',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_EASTERN_KINGDOMS_CRITERIA_11837 = '荆棘谷',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_EASTERN_KINGDOMS_CRITERIA_11860 = '辛特兰',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_EASTERN_KINGDOMS_CRITERIA_11850 = '幽魂之地',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_EASTERN_KINGDOMS_CRITERIA_11862 = '提瑞斯法林地',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_EASTERN_KINGDOMS_CRITERIA_11853 = '希尔斯布莱德丘陵',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_EASTERN_KINGDOMS_CRITERIA_11848 = '永歌森林',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_EASTERN_KINGDOMS_CRITERIA_11857 = '悲伤沼泽',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_EASTERN_KINGDOMS_CRITERIA_11842 = '荒芜之地',

    AN_MIDSUMMER_FLAME_KEEPER_ALLIANCE = '艾泽拉斯的火焰',
    AD_MIDSUMMER_FLAME_KEEPER_ALLIANCE = '完成“东部王国护焰者”、“卡利姆多护焰者”和“外域护焰者”成就。',

    AN_MIDSUMMER_FLAME_KEEPER_ALLIANCE_KALIMDOR = '卡利姆多护焰者',
    AD_MIDSUMMER_FLAME_KEEPER_ALLIANCE_KALIMDOR = '祭拜卡利姆多的火焰。',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_KALIMDOR_CRITERIA_11833 = '塔纳利斯',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_KALIMDOR_CRITERIA_11805 = '灰谷',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_KALIMDOR_CRITERIA_11809 = '秘血岛',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_KALIMDOR_CRITERIA_11812 = '凄凉之地',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_KALIMDOR_CRITERIA_11817 = '菲拉斯',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_KALIMDOR_CRITERIA_11824 = '泰达希尔',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_KALIMDOR_CRITERIA_11806 = '秘蓝岛',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_KALIMDOR_CRITERIA_11834 = '冬泉谷',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_KALIMDOR_CRITERIA_11831 = '希利苏斯',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_KALIMDOR_CRITERIA_11815 = '尘泥沼泽',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_KALIMDOR_CRITERIA_11811 = '黑海岸',

    AN_MIDSUMMER_FLAME_KEEPER_ALLIANCE_OUTLAND = '外域护焰者',
    AD_MIDSUMMER_FLAME_KEEPER_ALLIANCE_OUTLAND = '祭拜外域的火焰。',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_OUTLAND_CRITERIA_11807 = '刀锋山',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_OUTLAND_CRITERIA_11830 = '虚空风暴',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_OUTLAND_CRITERIA_11823 = '影月谷',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_OUTLAND_CRITERIA_11829 = '赞加沼泽',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_OUTLAND_CRITERIA_11818 = '地狱火半岛',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_OUTLAND_CRITERIA_11821 = '纳格兰',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_OUTLAND_CRITERIA_11825 = '泰罗卡森林',

    AN_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS = '东部王国护焰者',
    AD_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS = '祭拜东部王国的火焰。',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11816 = '艾尔文森林',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11810 = '燃烧平原',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11813 = '丹莫罗',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11822 = '赤脊山',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11832 = '荆棘谷',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11826 = '辛特兰',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11583 = '西部荒野',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11827 = '西瘟疫之地',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11808 = '诅咒之地',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11819 = '希尔斯布莱德丘陵',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11814 = '暮色森林',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11820 = '洛克莫丹',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11804 = '阿拉希高地',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11828 = '湿地',

    --BREWFEST
    AN_BREWFEST = '酒仙',
    AD_BREWFEST = '完成下列美酒节成就。',
    AR_BREWFEST = '头衔奖励：酒仙',

    AN_BREWFEST_WOLPERTINGER = '你的小飞兔丢了吗？',
    AD_BREWFEST_WOLPERTINGER = '获得一只鹿角小飞兔宠物。',

    AN_BREWFEST_COREN_DIREBREW = '烈酒节',
    AD_BREWFEST_COREN_DIREBREW = '杀死科林·烈酒。',

    AN_BREWFEST_QUEST1 = '干掉黑铁矮人',
    AD_BREWFEST_QUEST1 = '在黑铁矮人进攻时保卫美酒节营地，并完成任务“那次，我喝醉了之后……”。',

    AN_BREWFEST_BEER_CLUB = '本月美酒',
    AD_BREWFEST_BEER_CLUB = '加入本月美酒俱乐部。',

    AN_BREWFEST_MOUNT = '带酒上路',
    AD_BREWFEST_MOUNT = '获得一头美酒节坐骑，或使用美酒节蛇麻草把你的坐骑变成一头美酒节坐骑。',

    --LONG TRIP
    AC_WORLDEVENTS_TRIP = '千奇百怪的漫长旅行',
    AD_WORLDEVENTS_TRIP = '完成下列世界事件成就。',

	--BURNING CRUSADE
    AN_DOLCE = '我的背包是“巨无霸”',
    AD_DOLCE = '装备哈莉丝·西尔顿的“巨无霸”背包。',

    AN_QUESTS_HELLFIRE_PENINSULA = '来往地狱火半岛',
    AD_QUESTS_HELLFIRE_PENINSULA = '在地狱火半岛完成80个任务。',
    TBC_QUEST_10388 = 'Haltet die Brennende Legion auf', --#--#--
    TBC_QUEST_10389 = 'Grausame Pläne', --#--#--
    TBC_QUEST_10876 = 'Die Hand von Kargath', --#--#--
    TBC_QUEST_10258 = '断背岗哨',
    TBC_QUEST_9406 = '玛格汉',
    TBC_QUEST_9370 = '猎鹰岗哨',
    TBC_QUEST_10351 = '塞纳里奥哨站',

    TBC_QUEST_10397 = 'Haltet die Brennende Legion auf', --#--#--
    TBC_QUEST_10400 = 'Stürzt den Oberanführer', --#--#--
    TBC_QUEST_9545 = 'Die Suche nach Sedai', --#--#--
    TBC_QUEST_10935 = 'Der Exorzismus des Oberst Jules', --#--#--
    TBC_QUEST_10937 = 'Die Züchtigung des Drillmeisters', --#--#--
    TBC_QUEST_9383 = '塔哈玛特神殿',
    TBC_QUEST_10630 = 'Grün, aber kein Orc', --#--#--
    
    AN_QUESTS_ZANGARMASH = '沼泽的秘密',
    AD_QUESTS_ZANGARMASH = '在赞加沼泽完成54个任务。',
    TBC_QUEST_9772 = '沼泽鼠岗哨',
    TBC_QUEST_9904 = '萨布拉金',
    TBC_QUEST_10118 = 'Die Verteidigung von Zabra\'jin', --#--#--
    TBC_QUEST_9803 = 'Draeneidiplomatie', --#--#--
    TBC_QUEST_9783 = '泰雷多尔',
    TBC_QUEST_9902 = '奥雷柏尔营地',
    TBC_QUEST_9709 = 'DIESE Pilze solltet Ihr nicht essen!', --#--#--
    TBC_QUEST_9732 = 'Trockenlegung der Marschen', --#--#--
    TBC_QUEST_9788 = 'Rettung der Sporloks', --#--#--
    TBC_QUEST_9726 = 'Ein Ausflug mit dem Sporlingen', --#--#--
    
    AN_QUESTS_TERROKAR = '泰罗卡的恐惧',
    AD_QUESTS_TERROKAR = '在泰罗卡森林完成63个任务。',
    TBC_QUEST_10879 = 'Offensive aus Skettis', --#--#--
    TBC_QUEST_10881 = '难民车队',
    TBC_QUEST_10915 = '沙塔尔营地',
    TBC_QUEST_9951 = 'Das Geheimnis des Aufsehers', --#--#--
    TBC_QUEST_10042 = '奥蕾莉亚要塞',
    TBC_QUEST_10043 = '裂石堡',
    
    AN_QUESTS_NAGRAND = '纳格兰大满贯',
    AD_QUESTS_NAGRAND = '在纳格兰完成75个任务。',
    TBC_QUEST_10172 = 'Geburt eines Kriegshäuptlings', --#--#--
    TBC_QUEST_9977 = '鲜血竞技场',
    TBC_QUEST_9853 = '元素王座',
    TBC_QUEST_9934 = 'Lantresor von der Klinge', --#--#--
    TBC_QUEST_9868 = 'Die Finsterblutzerschlagenen', --#--#--
    TBC_QUEST_9937 = 'Bedrohungen für Nagrand', --#--#--
    TBC_QUEST_9852 = '终极挑战',
    TBC_QUEST_9925 = 'Begegnung mit den Astralen', --#--#--
    TBC_QUEST_9955 = 'Die Abenteuer von Corki', --#--#--
    TBC_QUEST_9933 = 'Lantresor von der Klinge', --#--#--
    TBC_QUEST_9873 = 'Die Finsterblutzerschlagenen', --#--#--
    TBC_QUEST_10011 = 'Bedrohungen für Nagrand', --#--#--
    
    AN_QUESTS_BLADES_EDGE_MTNS = '刀锋之山',
    AD_QUESTS_BLADES_EDGE_MTNS = '在刀锋山完成86个任务。',
    TBC_QUEST_10504 = '希尔瓦纳',
    TBC_QUEST_10671 = '托什雷的基地',
    TBC_QUEST_10806 = 'Die Gronnbedrohung', --#--#--
    TBC_QUEST_10505 = '雷神要塞',
    TBC_QUEST_10742 = 'Zusammenführung', --#--#--
    TBC_QUEST_10867 = 'Die Mok\'Nathal', --#--#--
    TBC_QUEST_10748 = '卢安荒野',
    
    AN_QUESTS_NETHERSTORM = '进入虚空',
    AD_QUESTS_NETHERSTORM = '在虚空风暴完成120个任务。',
    TBC_QUEST_10409 = 'Socrethar', --#--#--
    TBC_QUEST_10240 = '紫罗兰之塔',
    TBC_QUEST_10249 = 'Beschützt Area 52!', --#--#--
    TBC_QUEST_10439 = 'Zerstörung des Allesverschlingenden', --#--#--
    TBC_QUEST_10221 = 'Bau der X-52 Netherrakete', --#--#--
    TBC_QUEST_10276 = '星界财团',
    
    AN_QUESTS_SHADOWMOON = '背叛者之影',
    AD_QUESTS_SHADOWMOON = '在影月谷完成90个任务。',
    TBC_QUEST_10744 = 'Nachricht vom Sieg', --#--#--
    TBC_QUEST_11041 = '灵翼浮岛',
    TBC_QUEST_10645 = 'Der erste Todesritter', --#--#--
    TBC_QUEST_10651 = 'Geliehene Macht', --#--#--
    TBC_QUEST_11052 = 'Akamas Versprechen', --#--#--
    TBC_QUEST_10588 = 'Die Litanei der Verdammnis', --#--#--
    TBC_QUEST_10679 = 'Antidämonenwaffen', --#--#--
    TBC_QUEST_10808 = 'Der Dunkle Rat', --#--#--
	
	AN_HEMET_QUESTS_NAGRAND = '白色雷象一般的山丘',
	AD_HEMET_QUESTS_NAGRAND = '在纳格兰完成包括“终极挑战”在内的所有赫米特·奈辛瓦里任务。',

    HEROIC_NAME_PATTERN = 'Heroisch: %s', --#--#--
    HEROIC_DESCRIPTION_PATTERN = '%s auf dem Schwierigkeitsgrad \'Heroisch\'', --#--#--

    AN_HELLFIRE_RAMPARTS = '地狱火城墙',
    AD_HELLFIRE_RAMPARTS = '击败无疤者奥摩尔。',
    AC_BOSS_17308 = '无疤者奥摩尔',
    AC_BOSS_17537 = '传令官瓦兹德',
	AC_BOSS_17306 = 'Wachhabender Gargolmar', --#--#--

    AN_BLOOD_FURNACE = '鲜血熔炉',
    AD_BLOOD_FURNACE = '击败击碎者克里丹。',

    AN_SLAVE_PENS = '奴隶围栏',
    AD_SLAVE_PENS = '击败夸格米拉。',

    AN_UNDERBOG = '幽暗沼泽',
    AD_UNDERBOG = '击败黑色阔步者。',

    AN_MANA_TOMBS = '法力陵墓',
    AD_MANA_TOMBS = '击败节点亲王沙法尔。',

    AN_AUCHENAI_CRYPTS = '奥金尼地穴',
    AD_AUCHENAI_CRYPTS = '击败大主教玛拉达尔。',

    AN_OLD_HILLSBRAD = '逃离敦霍尔德',
    AD_OLD_HILLSBRAD = '击败时空猎手。',

    AN_SETHEKK_HALLS = '塞泰克大厅',
    AD_SETHEKK_HALLS = '击败利爪之王艾吉斯。',

    AN_STEAMVAULT = '蒸汽地窟',
    AD_STEAMVAULT = '击败督军卡利瑟里斯。',

    AN_SHADOW_LABYRINTH = '暗影迷宫',
    AD_SHADOW_LABYRINTH = '击败摩摩尔。',

    AN_SHATTERED_HALLS = '破碎大厅',
    AD_SHATTERED_HALLS = '击败酋长卡加斯·刃拳。',

    AN_BLACK_MORASS = '开启黑暗之门',
    AD_BLACK_MORASS = '击败埃欧努斯。',

    AN_BOTANICA = '生态船',
    AD_BOTANICA = '击败迁跃扭木。',

    AN_MECHANAR = '能源舰',
    AD_MECHANAR = '击败计算者帕萨雷恩。',

    AN_ARCATRAZ = '禁魔监狱',
    AD_ARCATRAZ = '击败预言者斯克瑞斯。',
	
	AN_MAGISTERS_TERRACE = '魔导师平台',
    AD_MAGISTERS_TERRACE = '击败凯尔萨斯·逐日者。',
	
	AN_TBC_DUNGEONS = '外域地下城大师',
    AD_TBC_DUNGEONS = '完成下列《燃烧的远征》地下城成就。',

    AN_TBC_DUNGEONS_HERO = '外域地下城英雄',
    AD_TBC_DUNGEONS_HERO = '完成下列《燃烧的远征》英雄副本成就。',

    AN_OUTLAND_HERO = 'Held der Scherbenwelt', --#--#--
    AD_OUTLAND_HERO = 'Schließt die unten aufgelisteten Schlachtzugserfolge ab.', --#--#--
    AR_OUTLAND_HERO = 'Held der Scherbenwelt', --#--#--
    
    AN_OUTLAND_GREAT_HERO = 'Großartiger Held der Scherbenwelt', --#--#--
    AD_OUTLAND_GREAT_HERO = 'Schließt die unten aufgelisteten Dungeon- und Schlachtzugserfolge ab.', --#--#--
    AR_OUTLAND_GREAT_HERO = 'Großartiger Held der Scherbenwelt', --#--#--

    AN_RAVEN_LORD = '乌鸦之神的缰绳',
    AD_RAVEN_LORD = '从塞泰克大厅的安苏那里获取乌鸦之神的缰绳。',

    AN_KARAZHAN = '卡拉赞',
    AD_KARAZHAN = '击败卡拉赞的玛克扎尔王子。',

    AN_GRUUL = '格鲁尔的巢穴',
    AD_GRUUL = '击败格鲁尔的巢穴中的屠龙者格鲁尔。',

    AN_MAGTHERIDON = '玛瑟里顿的巢穴',
    AD_MAGTHERIDON = '击败玛瑟里顿的巢穴中的玛瑟里顿。',
	
	AN_ZULAMAN = '祖阿曼',
	AD_ZULAMAN = '击败祖阿曼的祖尔金。',
	
	AN_SUNWELL = '太阳之井高地',
	AD_SUNWELL = '击败太阳之井高地的基尔加丹。',

    AN_TBC_PHASE_1 = '外域奇兵',
    AD_TBC_PHASE_1 = '完成下列《燃烧的远征》团队副本成就。',
    AN_TBC_PHASE_2 = '外域奇兵',
    AD_TBC_PHASE_2 = '完成下列《燃烧的远征》团队副本成就。',
    AN_TBC_PHASE_3 = '外域奇兵',
    AD_TBC_PHASE_3 = '完成下列《燃烧的远征》团队副本成就。',
	AN_TBC_PHASE_4 = '外域奇兵',
    AD_TBC_PHASE_4 = '完成下列《燃烧的远征》团队副本成就。',
	AN_TBC_PHASE_5 = '外域奇兵',
    AD_TBC_PHASE_5 = '完成下列《燃烧的远征》团队副本成就。',
	
    FACTION_946 = '荣耀堡',
    FACTION_947 = '萨尔玛',
    FACTION_942 = '塞纳里奥远征队',
    FACTION_1011 = '贫民窟',
    FACTION_989 = '时光守护者',
    FACTION_935 = '沙塔尔',
	FACTION_609 = '塞纳里奥议会',

    AN_TBC_DUNGEON_REPUTATIONS = '燃烧的远征',
    AD_TBC_DUNGEON_REPUTATIONS = '在所有《燃烧的远征》副本相关势力中达到崇拜声望。',
	
	AN_CENARION_CIRCLE = '塞纳留斯的卫士',
    AD_CENARION_CIRCLE = '在塞纳里奥议会和塞纳里奥远征队阵营中达到崇拜声望。',

    AN_SHATTRATH_REP = '分裂的沙塔斯',
    AD_SHATTRATH_REP = '在占星者阵营或奥尔多阵营中达到崇拜声望。',

    AN_OGRILA = '每日一任务，食人魔全无忧',
    AD_OGRILA = '在奥格瑞拉阵营中达到崇拜声望。',

    AN_SPOREGGAR = '孢子村之友',
    AD_SPOREGGAR = '在孢子村阵营中达到崇拜声望。',

    AN_CONSORTIUM = '首席崇拜官',
    AD_CONSORTIUM = '在星界财团阵营中达到崇拜声望。',

    AN_MAGHAR = '德拉诺的玛格汉',
    AD_MAGHAR = '在玛格汉阵营中达到崇拜声望。',

    AN_KURENAI = '库雷尼',
    AD_KURENAI = '在库雷尼阵营中达到崇拜声望。',

    AN_NETHERWINGS = '灵翼之翼',
    AD_NETHERWINGS = '在灵翼之龙阵营中达到崇拜声望。',

    AN_SKYSHATTERED = '破碎天空',
    AD_SKYSHATTERED = '在灵翼浮岛的龙喉飞行竞赛中击败汤告鲁士·碎空。',

    AN_AMETHYST_EYE = '紫罗兰之眼',
    AD_AMETHYST_EYE = '在紫罗兰之眼阵营中达到崇拜声望。',

    AN_SCALE_OF_THE_SANDS = '流沙之鳞',
    AD_SCALE_OF_THE_SANDS = '在流沙之鳞阵营中达到崇拜声望。',

    AN_ASHTONGUE_DEATHSWORN = '死誓者的誓言',
    AD_ASHTONGUE_DEATHSWORN = '在灰舌死誓者阵营中达到崇拜声望。',

    AN_SHATTERED_SUN = '残阳勇士',
    AD_SHATTERED_SUN = '在破碎残阳阵营中达到崇拜声望。',

    AN_SKYGUARD = '翱翔在斯克提斯',
    AD_SKYGUARD = '在沙塔尔天空卫队阵营中达到崇拜声望。',

    AN_HIPPOGRYPH = '塞纳里奥作战角鹰兽',
    AD_HIPPOGRYPH = '从赞加沼泽的塞纳里奥远征队那里购买一头塞纳里奥作战角鹰兽。',

    AN_DIPLOMAT = '外交家',
    AD_DIPLOMAT_ALLIANCE = '将你在木喉要塞、孢子村和库雷尼势力中的声望从冷淡提升到崇拜。',
    AD_DIPLOMAT_HORDE = '将你在木喉要塞、孢子村和玛格汉势力中的声望从冷淡提升到崇拜。',
    AC_DIPLOMAT_576 = '木喉要塞崇拜',
    AC_DIPLOMAT_970 = '孢子村崇拜',
    AC_DIPLOMAT_978 = '库雷尼崇拜',
    AC_DIPLOMAT_941 = '玛格汉崇拜',

    AN_MR_PINCHY = 'Dr. Zwicky!', --#--#--
    AD_MR_PINCHY = 'Angelt Dr. Zwicky in der Scherbenwelt.', --#--#--

    AN_FISHING_BOOK = '鱼没有脚印',
    AD_FISHING_BOOK = '学习寻找渔点技能。',

    AN_ACCOMPLISHED_ANGLER = '垂钓有成',
    AD_ACCOMPLISHED_ANGLER = '完成下列钓鱼成就。',

    AN_TBC_DAILY_FISH = '老渔夫巴尔洛',
    AD_TBC_DAILY_FISH = '完成下列5个老渔夫巴尔洛的钓鱼日常任务。',
    AC_TBC_DAILY_FISH1 = '城中的鳄鱼',
    AC_TBC_DAILY_FISH2 = '黑鳞镖鲈',
    AC_TBC_DAILY_FISH3 = '魔血鲷鱼',
    AC_TBC_DAILY_FISH4 = '世界上最大的泥鱼',
    AC_TBC_DAILY_FISH5 = '巨型淡水虾',

    AN_OLD_IRONJAW = '老铁腭',
    AD_OLD_IRONJAW = '钓起铁炉堡的老铁腭。',

    AN_OLD_CRAFTY = '老滑头',
    AD_OLD_CRAFTY = '钓起奥格瑞玛的老滑头。',

    AN_FISHING_DIPLOMAT = '钓鱼外交',
    AD_FISHING_DIPLOMAT = '在奥格瑞玛和暴风城钓鱼。',
    AC_FISHING_DIPLOMAT1 = '奥格瑞玛',
    AC_FISHING_DIPLOMAT2 = '暴风城',

    AN_CAPTAIN_RUMSEY = '拉姆瑟船长的特酿啤酒',
    AD_CAPTAIN_RUMSEY = '酿制一些拉姆瑟船长的特酿啤酒。',

    AN_SECOND_RING = 'Der Andere Ring', --#--#--
    AD_SECOND_RING = 'Erhaltet den Anderen Ring aus einem Sack voll geangelter Schätze.', --#--#--

    AN_TBC_DAILY_COOKING = '香味弥漫',
    AD_TBC_DAILY_COOKING = '完成下列4个巨石洛克洛的烹饪日常任务。',
    AC_TBC_DAILY_COOKING1 = '魔法美味',
    AC_TBC_DAILY_COOKING2 = '灵魂之汤',
    AC_TBC_DAILY_COOKING3 = '甜美的复仇',
    AC_TBC_DAILY_COOKING4 = '超级美味烧烤',

    AN_TBC_COOKING_RECIPES = '外域美食家',
    AD_TBC_COOKING_RECIPES = '烹饪下列外域美食。',

    AN_HAIL_CHEF = '向大厨致敬',
    AD_HAIL_CHEF = '完成下列烹饪成就。',

    AN_EXPLORE_OUTLAND = '探索外域',
    AD_EXPLORE_OUTLAND = '探索外域的各个区域。',

    AN_MIDDLE_RARE = '稀有品种',
    AD_MIDDLE_RARE = '杀死下列非常罕见的外域生物中的一个。',
    AN_BLOODY_RARE = '罕见品种',
    AD_BLOODY_RARE = '杀死下列非常罕见的外域生物。',
    TBC_NPC_18695 = '耶瑞卡尔大使',
    TBC_NPC_18682 = '泥沼潜伏者',
    TBC_NPC_18697 = '主工程师洛杉德尔',
    TBC_NPC_18681 = '盘牙大使',
    TBC_NPC_18694 = '扭曲观察者科里度斯',
    TBC_NPC_18689 = '残骨骷髅',
    TBC_NPC_18686 = '灾难预言者尤瑞姆',
    TBC_NPC_18698 = '惩罚者埃沃考尔',
    TBC_NPC_18678 = '弗尔古格',
    TBC_NPC_17144 = '血齿鳄',
    TBC_NPC_18692 = '赫玛希恩',
    TBC_NPC_18696 = '克兰托尔',
    TBC_NPC_18680 = '玛尔提卡',
    TBC_NPC_18677 = '野蛮的麦索格',
    TBC_NPC_18690 = '莫克拉什',
    TBC_NPC_20932 = '努拉莫克',
    TBC_NPC_18685 = '奥卡雷',
    TBC_NPC_18693 = '演讲者玛尔高姆',
    TBC_NPC_18683 = '空灵猎手亚尔',
    TBC_NPC_18679 = '沃拉克姆',

    AN_PREPATCH_QUEST = 'Auf in den Kampf!', --#--#--
    AD_PREPATCH_QUEST = 'Hat am Kampf um das Dunkle Portal teilgenommen. Träger des Wappenrock des Beschützers.', --#--#--

    AN_RIDING_75 = '驾！',
    AD_RIDING_75 = '学习初级骑术。',
    AN_RIDING_150 = '迅如闪电',
    AD_RIDING_150 = '学习中级骑术。',
    AN_RIDING_225 = '向远方奔跑',
    AD_RIDING_225 = '学习高级骑术。',
    AN_RIDING_300 = '这就对了',
    AD_RIDING_300 = '学习专家级骑术。',

    AN_ATTUNE_SHATTERED_HALLS = 'Heißer als die Hölle', --#--#--
    AD_ATTUNE_SHATTERED_HALLS = 'Erhaltet den Schlüssel zu den Zerschmetterten Hallen.', --#--#--
    AN_ATTUNE_ARCATRAZ = '如何杀入禁魔监狱',
    AD_ATTUNE_ARCATRAZ = 'Erhaltet den Schlüssel zur Arkatraz.', --#--#--
    AN_ATTUNE_KARAZHAN = '麦迪文的触摸',
    AD_ATTUNE_KARAZHAN = 'Erhaltet den Schlüssel des Meisters.', --#--#--
    AN_ATTUNE_NIGHT_BANE = 'Die Vergangenheit aufwühlen', --#--#--
    AD_ATTUNE_NIGHT_BANE = 'Erhaltet die Geschwärzte Urne und bezwingt den Schrecken der Nacht in Karazhan.', --#--#--
    AN_ATTUNE_SSC = '卡达什圣杖',
    AD_ATTUNE_SSC = 'Erhaltet Zugang zur Höhle des Schlangenschreins.', --#--#--
    AN_ATTUNE_EYE = 'Der Schlüssel der Stürme', --#--#--
    AD_ATTUNE_EYE = 'Erhaltet den Schlüssel der Stürme.', --#--#--
    AN_ATTUNE_HYJAL = '永恒水瓶',
    AD_ATTUNE_HYJAL = 'Erhaltet Zugang zur Schlacht um den Berg Hyjal.', --#--#--
    AN_ATTUNE_BLACK_TEMPLE = '帮助阿卡玛',
    AD_ATTUNE_BLACK_TEMPLE = 'Erhaltet das Medaillon von Karabor.', --#--#--

    AN_SSC = '毒蛇神殿',
    AD_SSC = '击败毒蛇神殿的瓦丝琪。',
    AC_KILL_HYDROS = 'Hydross der Unstete', --#--#--
    AC_KILL_LURKER = '钓起鱼斯拉',
    AC_KILL_LEOTHERAS = 'Leotheras der Blinde', --#--#--
    AC_KILL_KARATHRESS = 'Tiefenlord Karathress', --#--#--
    AC_KILL_MOROGRIM = 'Morogrim Gezeitenwandler', --#--#--
    AC_KILL_VASHJ = '瓦丝琪',
    AN_TK = '风暴要塞',
    AD_TK = '击败风暴要塞的凯尔萨斯·逐日者。',
    AC_KILL_ALAR = 'Al\'ar', --#--#--
    AC_KILL_VOID_REAVER = 'Leerhäscher', --#--#--
    AC_KILL_SOLARIAN = 'Hochastromantin Solarian', --#--#--
    AC_KILL_KAELTHAS = '凯尔萨斯·逐日者',

    AN_HYJAL = '海加尔山之战',
    AD_HYJAL = '在海加尔山之战中击败阿克蒙德。',

    AN_BT_ENTRANCE = 'Infiltration', --#--#--
    AD_BT_ENTRANCE = 'Dringt über die Kanäle von Karabor in den Schwarzen Tempel ein, indem ihr nachfolgende Bosse bezwingt.', --#--#--
    AC_KILL_NAJENTUS = 'Oberster Kriegsfürst Naj\'entus', --#--#--
    AC_KILL_SUPREMUS = 'Supremus', --#--#--

    AN_BT_SECOND_WING = 'Akolyth von Karabor ', --#--#--
    AD_BT_SECOND_WING = 'Reinigt die Hallen des Schwarzen Tempels, indem ihr nachfolgende Bosse bezwingt.', --#--#--
    AC_KILL_SHADOW_OF_AKAMA = 'Akamas Schemen', --#--#--
    AC_KILL_THERON = 'Teron Blutschatten', --#--#--
    AC_KILL_GURTOGG = 'Gurtogg Siedeblut', --#--#--
    AC_KILL_RELIQUARY = 'Reliquiar der Seelen', --#--#--

    AN_BT_LAST_WING = 'Tempelspitze', --#--#--
    AD_BT_LAST_WING = 'Infiltriert die oberen Stockwerke des Schwarzen Tempels, indem ihr nachfolgende Bosse bezwingt.', --#--#--
    AC_KILL_MOTHER_SHAHRAZ = 'Mutter Shahraz', --#--#--
    AC_KILL_BT_COUNCIL = 'Der Rat der Illidari', --#--#--
    AC_KILL_ILLIDAN = '伊利丹·怒风',

    AN_BLACK_TEMPLE = '黑暗神殿',
    AD_BLACK_TEMPLE = '击败黑暗神殿的伊利丹。',
    AR_BLACK_TEMPLE = 'Bezwinger des Schwarzen Tempels', --#--#--

    AN_ARENA_FIRST_WIN = '进入竞技场',
    AD_ARENA_FIRST_WIN = '在70级时获得一场竞技场积分赛的胜利。',
    AN_ARENA_WIN1 = '残酷的斗士',
    AD_ARENA_WIN1 = '在70级时获得100场竞技场积分赛的胜利。',
    AN_ARENA_WIN2 = '坚定的复仇者',
    AD_ARENA_WIN2 = '在70级时获得200场竞技场积分赛的胜利。',
    AN_ARENA_WIN3 = '野蛮的坚定',
    AD_ARENA_WIN3 = '在70级时获得300场竞技场积分赛的胜利。',

    AN_ARENA_TITLE1 = '角斗士',
    AN_ARENA_TITLE2 = '决斗者',
    AN_ARENA_TITLE3 = '竞争者',
    AN_ARENA_TITLE4 = '挑战者',

    AN_ARENA_GLADIATOR = '角斗士',
    AD_ARENA_GLADIATOR = '在70级的竞技场赛季中获得“角斗士”头衔。',
    AN_ARENA_DUELIST = '决斗者',
    AD_ARENA_DUELIST = '在70级的竞技场赛季中获得“决斗者”头衔。',
    AN_ARENA_RIVAL = '竞争者',
    AD_ARENA_RIVAL = '在70级的竞技场赛季中获得“竞争者”头衔。',
    AN_ARENA_CHALLENGER = '挑战者',
    AD_ARENA_CHALLENGER = '在70级的竞技场赛季中获得“挑战者”头衔。',

    AN_ARENA_2_1550 = '两人世界：1550',
    AD_ARENA_2_1550 = '在70级2v2竞技场战队中达到1550个人等级。',
    AN_ARENA_2_1750 = '两人世界：1750',
    AD_ARENA_2_1750 = '在70级2v2竞技场战队中达到1750个人等级。',
    AN_ARENA_2_2000 = '两人世界：2000',
    AD_ARENA_2_2000 = '在70级2v2竞技场战队中达到2000个人等级。',
    AN_ARENA_2_2200 = '两人世界：2200',
    AD_ARENA_2_2200 = '在70级2v2竞技场战队中达到2200个人等级。',

    AN_ARENA_3_1550 = '三人行：1550',
    AD_ARENA_3_1550 = '在70级3v3竞技场战队中达到1550个人等级。',
    AN_ARENA_3_1750 = '三人行：1750',
    AD_ARENA_3_1750 = '在70级3v3竞技场战队中达到1750个人等级。',
    AN_ARENA_3_2000 = '三人行：2000',
    AD_ARENA_3_2000 = '在70级3v3竞技场战队中达到2000个人等级。',
    AN_ARENA_3_2200 = '三人行：2200',
    AD_ARENA_3_2200 = '在70级3v3竞技场战队中达到2200个人等级。',

    AN_ARENA_5_1550 = '五子登科：1550',
    AD_ARENA_5_1550 = '在70级5v5竞技场战队中达到1550个人等级。',
    AN_ARENA_5_1750 = '五子登科：1750',
    AD_ARENA_5_1750 = '在70级5v5竞技场战队中达到1750个人等级。',
    AN_ARENA_5_2000 = '五子登科：2000',
    AD_ARENA_5_2000 = '在70级5v5竞技场战队中达到2000个人等级。',
    AN_ARENA_5_2200 = '五子登科：2200',
    AD_ARENA_5_2200 = '在70级5v5竞技场战队中达到2200个人等级。',

    AN_ARENA_STREAK = '连战连胜',
    AD_ARENA_STREAK = '在70级时获得连续10场排位赛的胜利。',

    AN_ARENA_HOTSTREAK = '再接再厉',
    AD_ARENA_HOTSTREAK = '在70级时获得连续10场排位赛的胜利，且保持战队等级在1800以上。',

    AN_ARENA_LASTMAN = '最后一人',
    AD_ARENA_LASTMAN = '在70级的5v5竞技场积分赛中成为最后一名幸存者。',

    AN_ARENA_MAPS = '世界冠军',
    AD_ARENA_MAPS = '在70级时，于刀锋山竞技场、纳格兰竞技场、达拉然下水道和洛丹伦废墟各赢得一场积分赛的胜利。',
    AC_ARENA_MAPS1 = '刀锋山竞技场',
    AC_ARENA_MAPS2 = '纳格兰竞技场',
    AC_ARENA_MAPS3 = '洛丹伦废墟',

    AN_ARENA_MASTER = '竞技场大师',
    AD_ARENA_MASTER = '完成下列竞技场成就。',

    AN_AZZINOTH = '埃辛诺斯战刃',
    AD_AZZINOTH = '获得一套埃辛诺斯战刃。',
	AN_THORIDAL = '索利达尔，群星之怒',
    AD_THORIDAL = '获得索利达尔，群星之怒。',
    AC_OBTAIN_MAINHAND_AZZINOTH = 'Rechte Kriegsgleve von Azzinoth', --#--#--
    AC_OBTAIN_OFFHAND_AZZINOTH = 'Linke Kriegsgleve von Azzinoth', --#--#--
	AN_BEAR_MOUNT = '阿曼尼战熊',
    AD_BEAR_MOUNT = '拥有一头阿曼尼战熊。',
	AN_HAWK_MOUNT = '迅捷白色陆行鸟',
    AD_HAWK_MOUNT = '从魔导师平台的凯尔萨斯·逐日者那里获取迅捷白色陆行鸟。',
	AN_ALAR_MOUNT = '奥的灰烬',
    AD_ALAR_MOUNT = '从风暴要塞的凯尔萨斯·逐日者那里获取奥的灰烬。',
	AN_HORSEMAN_MOUNT = '无头骑士的缰绳',
	AD_HORSEMAN_MOUNT = '在万圣节期间，从血色修道院的无头骑士那里获取无头骑士的缰绳。',
	AN_HERO_SHATTRATH = '沙塔斯的英雄',
	AD_HERO_SHATTRATH = '在占星者和奥尔多阵营中达到崇拜声望。',
	AN_HERO_SCRYER = '占星者',
	AN_HERO_ALDOR = '奥尔多',
	AN_CHAMPION_NAARU = '纳鲁的勇士',
	AD_CHAMPION_NAARU = '获得头衔“纳鲁的勇士”。',
	AR_CHAMPION_NAARU = '纳鲁的勇士',
	AN_HAND_ADAL = '阿达尔之手',
	AD_HAND_ADAL = '获得头衔“阿达尔之手”。',

    AN_P3_FIRST_WEEK = 'Eroberer der Scherbenwelt', --#--#--
    AD_P3_FIRST_WEEK = 'Bezwingt Archimonde und Illidan Sturmgrimm in der ersten Woche von Phase 3.', --#--#--
    AC_KILL_ARCHIMONDE = '阿克蒙德',
    AR_P3_FIRST_WEEK = 'Eroberer der Scherbenwelt', --#--#--
	
	AN_FLIGHFORM = '迅捷飞行形态',
	AD_FLIGHFORM = '完成迅捷飞行形态的任务。',

    AN_KRUUL = '...nicht noch ein Dämonenlord!', --#--#--
	AD_KRUUL = 'Bezwingt Hochlord Kruul während des Kampfes um das Dunkle Portal.', --#--#--

    AN_ATTUMEN_MOUNT = '炽热战马的缰绳',
	AD_ATTUMEN_MOUNT = '从卡拉赞的猎手阿图门那里获取炽热战马的缰绳。',


    -- Classic-continent rare achievement series
    AN_ONE_OF_A_KIND = '独一无二',
    AD_ONE_OF_A_KIND = '击杀卡利姆多或东部王国的一只稀有精英生物。',
    AN_EXTREMELY_RARE = '极其稀有',
    AD_EXTREMELY_RARE = '击杀下方列出的卡利姆多和东部王国的所有稀有精英生物。',

    -- Classic-continent rare NPC names (localized by stable NPC ID).
    RARE_NPC_3586 = '矿工约翰森',
    RARE_NPC_3872 = '死亡之誓',
    RARE_NPC_6228 = '黑铁大使',
    RARE_NPC_6488 = '死灵勇士',
    RARE_NPC_6489 = '铁脊死灵',
    RARE_NPC_6490 = '永醒的艾希尔',
    RARE_NPC_7057 = '挖掘专家舒尔弗拉格',
    RARE_NPC_9024 = '控火师罗格雷恩',
    RARE_NPC_8923 = '无敌的潘佐尔',
    RARE_NPC_9041 = '典狱官斯迪尔基斯',
    RARE_NPC_9042 = '维雷克',
    RARE_NPC_9217 = '尖石首席法师',
    RARE_NPC_9218 = '尖石统帅',
    RARE_NPC_9219 = '尖石屠夫',
    RARE_NPC_9596 = '班诺克·巨斧',
    RARE_NPC_9736 = '军需官兹格雷斯',
    RARE_NPC_10376 = '水晶之牙',
    RARE_NPC_10263 = '燃烧地狱卫士',
    RARE_NPC_9718 = '霍克·巴什古德',
    RARE_NPC_10509 = '杰德',
    RARE_NPC_10899 = '古拉鲁克',
    RARE_NPC_10393 = '斯库尔',
    RARE_NPC_10558 = '弗雷斯特恩',
    RARE_NPC_10809 = '石脊',
    RARE_NPC_99 = '狡猾的莫加尼',
    RARE_NPC_100 = '格拉夫·疾齿',
    RARE_NPC_471 = '母蜘蛛',
    RARE_NPC_472 = '费德菲尼尔',
    RARE_NPC_61 = '索罗斯·莱特芬格',
    RARE_NPC_79 = '监工纳尔格',
    RARE_NPC_1130 = '游荡的冰爪熊',
    RARE_NPC_1132 = '狂暴的冬狼',
    RARE_NPC_1137 = '饥饿的雪怪',
    RARE_NPC_8503 = '吉波维特',
    RARE_NPC_1260 = '霜鬃长老',
    RARE_NPC_1119 = '雪盲石腭怪',
    RARE_NPC_10827 = '亡语者塞伦德',
    RARE_NPC_10817 = '杜甘·蛮锤',
    RARE_NPC_10825 = '僵硬的吉斯',
    RARE_NPC_10821 = '腐烂者海德姆什',
    RARE_NPC_10828 = '阿比迪斯将军',
    RARE_NPC_10826 = '黑暗镰刀',
    RARE_NPC_10824 = '游侠之王霍克斯比尔',
    RARE_NPC_10822 = '塔雷什森',
    RARE_NPC_10823 = '祖布林·扭枝',
    RARE_NPC_16184 = '蛛怪监工',
    RARE_NPC_1843 = '工头杰瑞斯',
    RARE_NPC_1844 = '工头玛希瑞德',
    RARE_NPC_1847 = '弗曼恩',
    RARE_NPC_1838 = '血色质问者',
    RARE_NPC_1851 = '哈斯克',
    RARE_NPC_1837 = '血色法官',
    RARE_NPC_1885 = '血色铁匠',
    RARE_NPC_1848 = '玛达萨尔',
    RARE_NPC_1850 = '普特迪乌斯',
    RARE_NPC_1839 = '血色高阶牧师',
    RARE_NPC_1841 = '血色刽子手',
    RARE_NPC_10356 = '贝恩',
    RARE_NPC_1911 = '迪布',
    RARE_NPC_1936 = '农夫索利丹',
    RARE_NPC_10358 = '菲林森特的阴影',
    RARE_NPC_1531 = '失落的灵魂',
    RARE_NPC_1910 = '穆亚德',
    RARE_NPC_10357 = '毒针雷萨恩',
    RARE_NPC_10359 = '瑟斯库克',
    RARE_NPC_1533 = '痛苦的灵魂',
    RARE_NPC_14221 = '格拉维斯·斯里诺特',
    RARE_NPC_2258 = '狂怒的石元素',
    RARE_NPC_14223 = '暴躁的本希',
    RARE_NPC_2453 = '洛格罗什',
    RARE_NPC_2452 = '斯格霍尔',
    RARE_NPC_12431 = '血牙狼人',
    RARE_NPC_12433 = '克雷希斯',
    RARE_NPC_12432 = '维斯迦尔',
    RARE_NPC_1944 = '腐皮惩戒者',
    RARE_NPC_1948 = '斯纳麦恩',
    RARE_NPC_2283 = '鸦爪摄政者',
    RARE_NPC_1920 = '达拉然书记员',
    RARE_NPC_8213 = '铁背龟',
    RARE_NPC_8214 = '加林德·夏龙',
    RARE_NPC_8216 = '狂暴者雷瑟罗克',
    RARE_NPC_8212 = '雷克',
    RARE_NPC_8218 = '漫步者维瑟哈特',
    RARE_NPC_8219 = '祖拉雷克',
    RARE_NPC_8210 = '锋爪',
    RARE_NPC_8217 = '附魔师米瑟雷希斯',
    RARE_NPC_8215 = '格瑞姆格斯',
    RARE_NPC_14222 = '阿拉加',
    RARE_NPC_14279 = '克雷普塞斯',
    RARE_NPC_14281 = '流血者吉米',
    RARE_NPC_14277 = '塞菲莉斯',
    RARE_NPC_8211 = '海崖奔跳者',
    RARE_NPC_14278 = '洛巴尔克',
    RARE_NPC_14276 = '斯卡基尔',
    RARE_NPC_14280 = '萨姆拉斯',
    RARE_NPC_2447 = '纳瑞尔拉萨斯',
    RARE_NPC_14275 = '塔尔玛·雷矛',
    RARE_NPC_2779 = '纳兹加克王子',
    RARE_NPC_2609 = '地占师弗林塔格',
    RARE_NPC_2600 = '歌唱者',
    RARE_NPC_2598 = '达贝尔·蒙特罗斯',
    RARE_NPC_2601 = '弗尔伯利',
    RARE_NPC_2602 = '鲁尔·巨石',
    RARE_NPC_2603 = '考沃克',
    RARE_NPC_2604 = '碎骨者穆罗克',
    RARE_NPC_2606 = '屠戮者尼玛尔',
    RARE_NPC_2605 = '扎拉斯·枯木',
    RARE_NPC_1037 = '龙喉军官',
    RARE_NPC_2108 = '加内格·焦颅',
    RARE_NPC_1112 = '吸血寡妇',
    RARE_NPC_2090 = '马鲁克·龙鳞',
    RARE_NPC_1140 = '刺喉雌龙',
    RARE_NPC_1050 = '刃鳞皇家卫士',
    RARE_NPC_14425 = '纳博恩',
    RARE_NPC_14424 = '米尔洛',
    RARE_NPC_14433 = '斯拉丁',
    RARE_NPC_1398 = '大头目加尔高什',
    RARE_NPC_1425 = '格瑞兹拉克',
    RARE_NPC_2476 = '大型洛克鳄',
    RARE_NPC_14268 = '康达尔',
    RARE_NPC_1399 = '玛高什',
    RARE_NPC_14266 = '纺织者杉达',
    RARE_NPC_14267 = '摧毁者埃摩戈',
    RARE_NPC_2751 = '作战傀儡',
    RARE_NPC_14224 = '7:XT',
    RARE_NPC_2744 = '暗炉指挥官',
    RARE_NPC_2752 = '拉姆布勒',
    RARE_NPC_2753 = '巴纳布斯',
    RARE_NPC_2850 = '断牙',
    RARE_NPC_2931 = '扎里科特',
    RARE_NPC_2754 = '安纳塞姆斯',
    RARE_NPC_2749 = '攻城傀儡',
    RARE_NPC_9046 = '裂盾军需官',
    RARE_NPC_10119 = '沃尔查',
    RARE_NPC_10077 = '死亡之喉',
    RARE_NPC_9604 = '高戈诺奇',
    RARE_NPC_8979 = '格鲁克拉什',
    RARE_NPC_9602 = '哈克佐尔',
    RARE_NPC_8976 = '赫玛图斯',
    RARE_NPC_8981 = '失控的掠夺者',
    RARE_NPC_10078 = '特罗斯巴克',
    RARE_NPC_8978 = '萨里斯·巴加尔',
    RARE_NPC_8279 = '未完善的作战傀儡',
    RARE_NPC_8277 = '雷克提拉克',
    RARE_NPC_8281 = '斯卡尔德',
    RARE_NPC_8280 = '夏雷纳尔',
    RARE_NPC_8283 = '奴隶主托恩·黑心',
    RARE_NPC_8278 = '斯莫达尔',
    RARE_NPC_8282 = '玛斯托格',
    RARE_NPC_584 = '卡松',
    RARE_NPC_14273 = '波德哈特',
    RARE_NPC_616 = '查特',
    RARE_NPC_14271 = '雷布查斯',
    RARE_NPC_947 = '沉默的罗恩',
    RARE_NPC_14269 = '搜寻者埃库隆',
    RARE_NPC_14272 = '斯纳弗莱尔',
    RARE_NPC_14270 = '斯奎迪克',
    RARE_NPC_763 = '失落者酋长',
    RARE_NPC_1106 = '失落者厨师',
    RARE_NPC_14447 = '基摩里安',
    RARE_NPC_14448 = '摩塔索恩',
    RARE_NPC_14445 = '维尔玛克将军',
    RARE_NPC_1063 = '玉龙',
    RARE_NPC_507 = '芬罗斯',
    RARE_NPC_771 = '指挥官菲斯托姆',
    RARE_NPC_503 = '玛拉索姆公爵',
    RARE_NPC_521 = '鲁伯斯',
    RARE_NPC_574 = '纳拉克西斯',
    RARE_NPC_534 = '奈法鲁',
    RARE_NPC_573 = '死神4000型',
    RARE_NPC_520 = '布拉克',
    RARE_NPC_572 = '莱布里萨斯',
    RARE_NPC_1424 = '掘地工头目',
    RARE_NPC_506 = '利爪队长',
    RARE_NPC_519 = '斯拉克',
    RARE_NPC_462 = '乌尔图斯',
    RARE_NPC_596 = '被洗脑的贵族',
    RARE_NPC_599 = '玛里莎·杜派格',
    RARE_NPC_14446 = '芬加特',
    RARE_NPC_8301 = '掠夺者科拉克',
    RARE_NPC_8304 = '德雷斯克恩',
    RARE_NPC_8303 = '格朗特',
    RARE_NPC_8296 = '扭曲者莫吉尔',
    RARE_NPC_8300 = '毁灭',
    RARE_NPC_8299 = '斯比弗雷尔',
    RARE_NPC_8298 = '先知阿库巴尔',
    RARE_NPC_8297 = '顽强的玛古诺斯',
    RARE_NPC_8302 = '死眼',
    RARE_NPC_1061 = '甘祖拉恩',
    RARE_NPC_14491 = '库尔莫克',
    RARE_NPC_2541 = '萨克拉希斯',
    RARE_NPC_14490 = '瑞帕',
    RARE_NPC_1552 = '金鳞蜥蜴',
    RARE_NPC_14492 = '维里弗尼克斯',
    RARE_NPC_723 = '莫什奥格屠夫',
    RARE_NPC_14487 = '戈鲁格尔',
    RARE_NPC_11383 = '高阶祭司海瓦纳',
    RARE_NPC_14488 = '罗洛克',
    RARE_NPC_3581 = '下水道鳄鱼',
    RARE_NPC_1720 = '布鲁高·铁拳',
    RARE_NPC_5399 = '食尸者维萨克',
    RARE_NPC_5400 = '泽基斯',
    RARE_NPC_8924 = '贝哈默斯',
    RARE_NPC_16854 = '埃迪纳库斯',
    RARE_NPC_16855 = '特雷格拉',
    RARE_NPC_22062 = '维斯利姆博士',
    RARE_NPC_5912 = '变异精灵龙',
    RARE_NPC_3652 = '鞭笞者特里高雷',
    RARE_NPC_3672 = '博艾恩',
    RARE_NPC_10080 = '杉达尔·沙掠者',
    RARE_NPC_10081 = '灰尘怨灵',
    RARE_NPC_10082 = '泽雷利斯',
    RARE_NPC_12237 = '收割者麦什洛克',
    RARE_NPC_11447 = '姆斯高格',
    RARE_NPC_11497 = '拉扎尔',
    RARE_NPC_11498 = '无敌的斯卡尔',
    RARE_NPC_11467 = '苏斯',
    RARE_NPC_3068 = '马兹拉纳其',
    RARE_NPC_3058 = '阿兰其亚',
    RARE_NPC_5787 = '执行者埃米尔冈德',
    RARE_NPC_5807 = '扫荡者',
    RARE_NPC_5786 = '断矛',
    RARE_NPC_5785 = '海特拉什',
    RARE_NPC_3056 = '鬼嚎',
    RARE_NPC_5822 = '斯考恩',
    RARE_NPC_5823 = '死亡毒蝎',
    RARE_NPC_5824 = '獠牙队长',
    RARE_NPC_5826 = '吉欧洛德·杂斑',
    RARE_NPC_5808 = '科卡尼斯',
    RARE_NPC_5809 = '指挥官萨拉菲尔',
    RARE_NPC_5828 = '狮王休玛',
    RARE_NPC_5842 = '"跳跃者"塔克',
    RARE_NPC_5834 = '天空之刃艾泽里',
    RARE_NPC_5865 = '迪舒',
    RARE_NPC_5836 = '技师维尔雷格',
    RARE_NPC_5835 = '工头葛瑞尔斯',
    RARE_NPC_3295 = '淤泥兽',
    RARE_NPC_5829 = '土狼斯诺特',
    RARE_NPC_5837 = '石臂',
    RARE_NPC_5838 = '断矛',
    RARE_NPC_3470 = '拉索利安',
    RARE_NPC_5863 = '土地祭司古科罗克',
    RARE_NPC_3253 = '异种收割者',
    RARE_NPC_5832 = '雷蹄蜥蜴',
    RARE_NPC_5849 = '矿工弗雷姆',
    RARE_NPC_5847 = '赫金·石须',
    RARE_NPC_5848 = '玛尔金·麦酒',
    RARE_NPC_3398 = '格沙拉罕',
    RARE_NPC_5797 = '艾恩·流水',
    RARE_NPC_7895 = '布拉德雷大使',
    RARE_NPC_5827 = '布隆塔斯',
    RARE_NPC_5851 = '基洛戈·锤趾队长',
    RARE_NPC_3270 = '秘法师拉佐斯诺特',
    RARE_NPC_5859 = '哈格',
    RARE_NPC_5799 = '汉娜·刃叶',
    RARE_NPC_5800 = '马库斯·拜尔',
    RARE_NPC_5841 = '石枪',
    RARE_NPC_5830 = '莱丝塔伦',
    RARE_NPC_5831 = '迅鬃斑马',
    RARE_NPC_5864 = '斯文格加特·矛鬃',
    RARE_NPC_5798 = '索拉·羽月',
    RARE_NPC_6584 = '暴龙之王摩什',
    RARE_NPC_6582 = '萨瓦丝女王',
    RARE_NPC_6581 = '暴掠龙女王',
    RARE_NPC_6585 = '乌卡洛克',
    RARE_NPC_6583 = '格鲁夫',
    RARE_NPC_3535 = '恶臭的黑苔兽',
    RARE_NPC_14430 = '暮色巡游者',
    RARE_NPC_14431 = '愤怒的谢尔达',
    RARE_NPC_14432 = '瑟雷基尔',
    RARE_NPC_14428 = '乌鲁森',
    RARE_NPC_14429 = '格雷莫尔',
    RARE_NPC_2186 = '卡尼沃斯',
    RARE_NPC_2192 = '召火者拉迪森',
    RARE_NPC_7015 = '残忍的弗拉格莫克',
    RARE_NPC_2184 = '莫嘉泽尔',
    RARE_NPC_2191 = '利斯林',
    RARE_NPC_2175 = '影爪',
    RARE_NPC_2172 = '雌性森林陆行鸟',
    RARE_NPC_7016 = '薇丝普拉',
    RARE_NPC_7017 = '辛斯雷尔',
    RARE_NPC_14342 = '拉吉波尔',
    RARE_NPC_14340 = '奥辛尔·灵息',
    RARE_NPC_14339 = '死亡之嚎',
    RARE_NPC_14344 = '莫戈雷斯',
    RARE_NPC_14343 = '智者奥尔姆',
    RARE_NPC_14345 = '欧加尔',
    RARE_NPC_7104 = '迪塞库斯',
    RARE_NPC_7137 = '伊姆拉图斯',
    RARE_NPC_6651 = '拉格罗尔',
    RARE_NPC_6647 = '玛济斯·鹰盔',
    RARE_NPC_6648 = '安提里奥斯',
    RARE_NPC_6650 = '方弗罗将军',
    RARE_NPC_6649 = '瑟丝彼拉',
    RARE_NPC_8660 = '伊夫卡尔',
    RARE_NPC_6118 = '瓦罗森的幽灵',
    RARE_NPC_6652 = '菲达雷德',
    RARE_NPC_6646 = '长者莫诺斯',
    RARE_NPC_13896 = '鳞须海龟',
    RARE_NPC_3735 = '药剂师法尔瑟斯',
    RARE_NPC_10559 = '薇丝比娅',
    RARE_NPC_10644 = '迷雾嚎叫者',
    RARE_NPC_10641 = '钳枝沼泽兽',
    RARE_NPC_10643 = '玛戈芬',
    RARE_NPC_10647 = '拉兹王子',
    RARE_NPC_10639 = '洛吉什',
    RARE_NPC_3792 = '恐狼族长',
    RARE_NPC_12037 = '乌索洛克',
    RARE_NPC_10642 = '埃卡洛姆',
    RARE_NPC_10640 = '橡爪',
    RARE_NPC_3736 = '屠杀者摩迪沙尔',
    RARE_NPC_3773 = '阿克瑞鲁斯',
    RARE_NPC_4066 = '纳尔塔萨',
    RARE_NPC_4015 = '巨翼雄兽',
    RARE_NPC_5916 = '哨兵阿玛拉珊',
    RARE_NPC_4030 = '狂怒的树人',
    RARE_NPC_5915 = '拉文诺克修士',
    RARE_NPC_5931 = '工头里格尔',
    RARE_NPC_5930 = '瑞雯',
    RARE_NPC_5928 = '悲哀之翼',
    RARE_NPC_5932 = '工头维普弗恩',
    RARE_NPC_14230 = '贼眼',
    RARE_NPC_4380 = '暗雾寡妇蛛',
    RARE_NPC_14234 = '哈尤克',
    RARE_NPC_4339 = '布雷姆戈',
    RARE_NPC_14232 = '达尔特',
    RARE_NPC_14231 = '咆哮者杜格斯',
    RARE_NPC_14236 = '安戈雷尔',
    RARE_NPC_14237 = '泥浆虫',
    RARE_NPC_14233 = '雷普斯凯尔',
    RARE_NPC_14235 = '腐烂者',
    RARE_NPC_14225 = '凯雷恩王子',
    RARE_NPC_14228 = '基格勒尔',
    RARE_NPC_14227 = '西斯普拉克',
    RARE_NPC_14226 = '卡斯克',
    RARE_NPC_14229 = '可憎的滑刃纳迦',
    RARE_NPC_11688 = '被诅咒的半人马',
    RARE_NPC_5347 = '滑翔者安蒂鲁斯',
    RARE_NPC_5349 = '阿拉瑟希斯',
    RARE_NPC_12801 = '魔法奇美洛克',
    RARE_NPC_5346 = '潜行者布拉多尔',
    RARE_NPC_12800 = '奇美洛克',
    RARE_NPC_12802 = '奇美洛克吞噬者',
    RARE_NPC_5345 = '钻石头',
    RARE_NPC_5354 = '纳尔利夫',
    RARE_NPC_5343 = '莎尔莱',
    RARE_NPC_5352 = '灰腹老熊',
    RARE_NPC_5350 = '基洛特',
    RARE_NPC_5356 = '咆哮者',
    RARE_NPC_5933 = '被流放的阿切鲁斯',
    RARE_NPC_4132 = '异种破坏者',
    RARE_NPC_5935 = '不可战胜的铁眼',
    RARE_NPC_14427 = '吉比斯尼克',
    RARE_NPC_14426 = '哈尔伯·邪泉',
    RARE_NPC_5934 = '哈特拉斯',
    RARE_NPC_5937 = '邪刺恐蝎',
    RARE_NPC_8207 = '巨型火鸟',
    RARE_NPC_8205 = '贪婪的哈尔卡',
    RARE_NPC_8203 = '克雷格·尼哈鲁',
    RARE_NPC_8208 = '残忍的疱爪土狼',
    RARE_NPC_8202 = '疯狂的塞科洛克',
    RARE_NPC_8201 = '失落者奥姆高尔',
    RARE_NPC_8204 = '吞噬者索利德',
    RARE_NPC_8200 = '唤沙者辛萨拉',
    RARE_NPC_8199 = '克莱吉拉克',
    RARE_NPC_14472 = '格雷瑟尔',
    RARE_NPC_14477 = '格鲁布索尔',
    RARE_NPC_14478 = '哈瑞坎尼安',
    RARE_NPC_14476 = '克里拉克',
    RARE_NPC_14473 = '拉普雷斯',
    RARE_NPC_14471 = '瑟提斯',
    RARE_NPC_14479 = '暮光之王艾沃兰',
    RARE_NPC_15308 = '暮光预言者',
    RARE_NPC_14474 = '苏尔拉',
    RARE_NPC_14475 = '雷克斯·亚希尔',
    RARE_NPC_10200 = '拉克西里',
    RARE_NPC_10197 = '嚎叫者米基尔',
    RARE_NPC_10201 = '赫达琳',
    RARE_NPC_10199 = '雪爪灰熊怪',
    RARE_NPC_10202 = '埃苏罗斯',
    RARE_NPC_10196 = '科巴塔恩将军',
    RARE_NPC_10198 = '劫掠者卡苏克',
    RARE_NPC_4425 = '盲眼猎手',
    RARE_NPC_4842 = '唤地者哈穆加',
    RARE_NPC_7354 = '拉戈斯诺特',
    RARE_NPC_22060 = '刺客芬妮萨',

    -- Built-in title catalog: labels and grammatical name placement.
    TITLE_BUILTIN_EXPLORER_LABEL = '征服者',
    TITLE_BUILTIN_EXPLORER_FORMAT_MALE = '征服者 %s',
    TITLE_BUILTIN_EXPLORER_FORMAT_FEMALE = '征服者 %s',
    TITLE_BUILTIN_THE_ELUSIVE_LABEL = '难以捉摸者',
    TITLE_BUILTIN_THE_ELUSIVE_FORMAT_MALE = '难以捉摸者 %s',
    TITLE_BUILTIN_THE_ELUSIVE_FORMAT_FEMALE = '难以捉摸者 %s',
    TITLE_BUILTIN_BATTLEMASTER_LABEL = '战斗大师',
    TITLE_BUILTIN_BATTLEMASTER_FORMAT_MALE = '战斗大师 %s',
    TITLE_BUILTIN_BATTLEMASTER_FORMAT_FEMALE = '战斗大师 %s',
    TITLE_BUILTIN_DEFENDER_OF_AZEROTH_LABEL = 'Verteidiger von Azeroth', --#--#--
    TITLE_BUILTIN_DEFENDER_OF_AZEROTH_FORMAT_MALE = 'Verteidiger von Azeroth %s', --#--#--
    TITLE_BUILTIN_DEFENDER_OF_AZEROTH_FORMAT_FEMALE = 'Verteidigerin von Azeroth %s', --#--#--
    TITLE_BUILTIN_HERO_OF_AZEROTH_LABEL = 'Held von Azeroth', --#--#--
    TITLE_BUILTIN_HERO_OF_AZEROTH_FORMAT_MALE = 'Held von Azeroth %s', --#--#--
    TITLE_BUILTIN_HERO_OF_AZEROTH_FORMAT_FEMALE = 'Heldin von Azeroth %s', --#--#--
    TITLE_BUILTIN_GREAT_HERO_OF_AZEROTH_LABEL = 'Großartiger Held von Azeroth', --#--#--
    TITLE_BUILTIN_GREAT_HERO_OF_AZEROTH_FORMAT_MALE = 'Großartiger Held von Azeroth %s', --#--#--
    TITLE_BUILTIN_GREAT_HERO_OF_AZEROTH_FORMAT_FEMALE = 'Großartige Heldin von Azeroth %s', --#--#--
    TITLE_BUILTIN_EMERALD_KEEPER_LABEL = 'Smaragdgrüner Wächter', --#--#--
    TITLE_BUILTIN_EMERALD_KEEPER_FORMAT_MALE = 'Smaragdgrüner Wächter %s', --#--#--
    TITLE_BUILTIN_EMERALD_KEEPER_FORMAT_FEMALE = 'Smaragdgrüne Wächterin %s', --#--#--
    TITLE_BUILTIN_JENKINS_LABEL = '火车王',
    TITLE_BUILTIN_JENKINS_FORMAT_MALE = '火车王 %s',
    TITLE_BUILTIN_JENKINS_FORMAT_FEMALE = '火车王 %s',
    TITLE_BUILTIN_AZEROTHS_GREATEST_ANGLER_LABEL = 'Größter Angler von Azeroth', --#--#--
    TITLE_BUILTIN_AZEROTHS_GREATEST_ANGLER_FORMAT_MALE = '%s, der größte Angler von Azeroth', --#--#--
    TITLE_BUILTIN_AZEROTHS_GREATEST_ANGLER_FORMAT_FEMALE = '%s, die größte Anglerin von Azeroth', --#--#--
    TITLE_BUILTIN_CHEF_LABEL = '大厨',
    TITLE_BUILTIN_CHEF_FORMAT_MALE = '大厨 %s',
    TITLE_BUILTIN_CHEF_FORMAT_FEMALE = '大厨 %s',
    TITLE_BUILTIN_THE_EXALTED_LABEL = 'Der Ehrfurchtgebietende', --#--#--
    TITLE_BUILTIN_THE_EXALTED_FORMAT_MALE = '%s der Ehrfurchtgebietende', --#--#--
    TITLE_BUILTIN_THE_EXALTED_FORMAT_FEMALE = '%s die Ehrfurchtgebietende', --#--#--
    TITLE_BUILTIN_BLOODSAIL_ADMIRAL_LABEL = '血帆舰队司令',
    TITLE_BUILTIN_BLOODSAIL_ADMIRAL_FORMAT_MALE = '血帆舰队司令 %s',
    TITLE_BUILTIN_BLOODSAIL_ADMIRAL_FORMAT_FEMALE = '血帆舰队司令 %s',
    TITLE_BUILTIN_THE_HALLOWED_LABEL = '神圣的',
    TITLE_BUILTIN_THE_HALLOWED_FORMAT_MALE = '神圣的%s',
    TITLE_BUILTIN_THE_HALLOWED_FORMAT_FEMALE = '神圣的%s',
    TITLE_BUILTIN_MERRYMAKER_LABEL = '欢乐使者',
    TITLE_BUILTIN_MERRYMAKER_FORMAT_MALE = '欢乐使者 %s',
    TITLE_BUILTIN_MERRYMAKER_FORMAT_FEMALE = '欢乐使者 %s',
    TITLE_BUILTIN_THE_LOVE_FOOL_LABEL = 'Liebesgott', --#--#--
    TITLE_BUILTIN_THE_LOVE_FOOL_FORMAT_MALE = '%s, Liebesgott', --#--#--
    TITLE_BUILTIN_THE_LOVE_FOOL_FORMAT_FEMALE = '%s, Liebesgöttin', --#--#--
    TITLE_BUILTIN_ELDER_LABEL = '决斗者',
    TITLE_BUILTIN_ELDER_FORMAT_MALE = '决斗者 %s',
    TITLE_BUILTIN_ELDER_FORMAT_FEMALE = '决斗者 %s',
    TITLE_BUILTIN_PATRON_LABEL = '监护人',
    TITLE_BUILTIN_PATRON_FORMAT_MALE = '监护人 %s',
    TITLE_BUILTIN_PATRON_FORMAT_FEMALE = '护士长 %s',
    TITLE_BUILTIN_FLAME_KEEPER_LABEL = '挑战者',
    TITLE_BUILTIN_FLAME_KEEPER_FORMAT_MALE = '挑战者 %s',
    TITLE_BUILTIN_FLAME_KEEPER_FORMAT_FEMALE = '挑战者 %s',
    TITLE_BUILTIN_THE_LOREMASTER_LABEL = '博学者',
    TITLE_BUILTIN_THE_LOREMASTER_FORMAT_MALE = '博学者 %s',
    TITLE_BUILTIN_THE_LOREMASTER_FORMAT_FEMALE = '博学者 %s',
    TITLE_BUILTIN_CONQUEROR_BLACK_TEMPLE_LABEL = 'Bezwinger des Schwarzen Tempels', --#--#--
    TITLE_BUILTIN_CONQUEROR_BLACK_TEMPLE_FORMAT_MALE = '%s, Bezwinger des Schwarzen Tempels', --#--#--
    TITLE_BUILTIN_CONQUEROR_BLACK_TEMPLE_FORMAT_FEMALE = '%s, Bezwingerin des Schwarzen Tempels', --#--#--
    TITLE_BUILTIN_CONQUEROR_OF_OUTLAND_LABEL = 'Eroberer der Scherbenwelt', --#--#--
    TITLE_BUILTIN_CONQUEROR_OF_OUTLAND_FORMAT_MALE = '%s, Eroberer der Scherbenwelt', --#--#--
    TITLE_BUILTIN_CONQUEROR_OF_OUTLAND_FORMAT_FEMALE = '%s, Eroberin der Scherbenwelt', --#--#--
    TITLE_BUILTIN_CHAMPION_OF_THE_NAARU_LABEL = '纳鲁的勇士',
    TITLE_BUILTIN_CHAMPION_OF_THE_NAARU_FORMAT_MALE = 'Champion der Naaru %s', --#--#--
    TITLE_BUILTIN_CHAMPION_OF_THE_NAARU_FORMAT_FEMALE = 'Champion der Naaru %s', --#--#--
    TITLE_BUILTIN_HAND_OF_ADAL_LABEL = '阿达尔之手',
    TITLE_BUILTIN_HAND_OF_ADAL_FORMAT_MALE = 'Hand von A\'dal %s', --#--#--
    TITLE_BUILTIN_HAND_OF_ADAL_FORMAT_FEMALE = 'Hand von A\'dal %s', --#--#--
    TITLE_BUILTIN_HERO_OF_OUTLAND_LABEL = 'Held der Scherbenwelt', --#--#--
    TITLE_BUILTIN_HERO_OF_OUTLAND_FORMAT_MALE = 'Held der Scherbenwelt %s', --#--#--
    TITLE_BUILTIN_HERO_OF_OUTLAND_FORMAT_FEMALE = 'Heldin der Scherbenwelt %s', --#--#--
    TITLE_BUILTIN_GREAT_HERO_OF_OUTLAND_LABEL = 'Großartiger Held der Scherbenwelt', --#--#--
    TITLE_BUILTIN_GREAT_HERO_OF_OUTLAND_FORMAT_MALE = 'Großartiger Held der Scherbenwelt %s', --#--#--
    TITLE_BUILTIN_GREAT_HERO_OF_OUTLAND_FORMAT_FEMALE = 'Großartige Heldin der Scherbenwelt %s', --#--#--
    TITLE_BUILTIN_BREWMASTER_LABEL = '酒仙',
    TITLE_BUILTIN_BREWMASTER_FORMAT_MALE = '酒仙 %s',
    TITLE_BUILTIN_BREWMASTER_FORMAT_FEMALE = '酒仙 %s',
    -- End built-in title catalog
}

SexyLib:InitLocalization('Anniversary Achievements', L)
