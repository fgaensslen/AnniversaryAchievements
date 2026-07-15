if GetLocale() ~= 'zhTW' then return end

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

    GEAR_SLOT_HEAD = '頭部',
    GEAR_SLOT_NECK = '頸部',
    GEAR_SLOT_SHOULDER = '肩膀',
    GEAR_SLOT_CHEST = '胸部',
    GEAR_SLOT_WAIST = '腰部',
    GEAR_SLOT_LEGS = '腿部',
    GEAR_SLOT_FEET = '腳部',
    GEAR_SLOT_WRIST = '手腕',
    GEAR_SLOT_HANDS = '手部',
    GEAR_SLOT_FIRST_RING = '右手戒指',
    GEAR_SLOT_SECOND_RING = '左手戒指',
    GEAR_SLOT_FIRST_TRINKET = '第一飾品',
    GEAR_SLOT_SECOND_TRINKET = '第二飾品',
    GEAR_SLOT_CLOAK = '披風',
    GEAR_SLOT_WEAPON = '武器',

    NPC_3444 = 'Grubenratte', --#--#--
    NPC_620 = '雞',
    NPC_1420 = '蟾蜍',
    NPC_13321 = '青蛙',
    NPC_2620 = '草原土撥鼠',
    NPC_9600 = '鸚鵡',
    NPC_883 = '鹿',
    NPC_9699 = '火甲蟲',
    NPC_4953 = '毒水蟒',
    NPC_721 = '兔子',
    NPC_9700 = '熔岩蟹',
    NPC_15476 = '蠍子',
    NPC_2914 = '毒蛇',
    NPC_16030 = '蛆蟲',
    NPC_4075 = '大鼠',
    NPC_1412 = '松鼠',
    NPC_7390 = 'Nymphensittich', --#--#--
    NPC_15475 = 'Käfer', --#--#--
    NPC_15010 = 'Dschungelkröte', --#--#--
    NPC_4076 = '蟑螂',
    NPC_13016 = 'Untergrundratte', --#--#--
    NPC_14881 = '蜘蛛',
    NPC_2110 = 'Schwarze Ratte', --#--#--
    NPC_4166 = '蹬羚',
    NPC_1933 = '綿羊',
    NPC_890 = '幼鹿',
    NPC_2098 = '山羊',
    NPC_2442 = '牛',
    NPC_6368 = '貓',
    NPC_6271 = '溝鼠',
    NPC_385 = 'Pferd', --#--#--
    NPC_10685 = '豬',
    NPC_3300 = '奎蛇',
    NPC_15065 = 'Lady', --#--#--
    NPC_15066 = 'Cleo', --#--#--
    NPC_15071 = 'Schleicherpfote', --#--#--
    NPC_15072 = 'Spike', --#--#--

    CATEGORY_GENERAL = '一般',
    CATEGORY_QUESTS = '任務',
	CATEGORY_PVP = '玩家對玩家',
    CATEGORY_KALIMDOR = '卡林多',
    CATEGORY_EASTERN_KINGDOMS = '東部王國',
    CATEGORY_OUTLAND = '外域',
    CATEGORY_VANILLA = '艾澤拉斯',
    CATEGORY_TBC = '燃燒的遠征',
    CATEGORY_EXPLORATION = '探索',
    CATEGORY_PVE = '地城與團隊',
    CATEGORY_ARENA = '競技場',
    CATEGORY_BG_ALTERAC = '奧特蘭克山谷',
    CATEGORY_BG_WARSONG = '戰歌峽谷',
    CATEGORY_BG_ARATHI = '阿拉希盆地',
    CATEGORY_BG_EYE = '暴風之眼',
    CATEGORY_PROFESSIONS = '專業技能',
    CATEGORY_REPUTATION = '聲望',
	CATEGORY_EVENTS = '世界事件',
    CATEGORY_VALENTINES = '愛就在身邊',
    CATEGORY_LUNAR = '新年節慶',
    CATEGORY_NOBLEGARDEN = '貴族花園',
    CATEGORY_CHILDREN = '兒童週',
    CATEGORY_MIDSUMMER = '仲夏節',
    CATEGORY_BREWFEST = '啤酒節',
    CATEGORY_HALLOWSEND = '萬鬼節',
    CATEGORY_WINTERVEIL = '冬幕節',
    CATEGORY_FEATS_OF_STRENGTH = '偉業',
	
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
	AN_WARLOCK_T2 = '復仇長袍',
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

    AN_LVL = '%d級',
    AD_LVL = '達到%d級。',

    AN_BANK = '安全存放',
    AD_BANK = '購買7個銀行欄位。',
    AC_BANK = '購買7個銀行欄位。',

    AN_QUESTS = '%d個任務完成',
    AD_QUESTS = '完成%d個任務。',
    AC_QUESTS = 'Schließt %d Quests ab.', --#--#--

    AN_DAILY_QUESTS = '%d tägliche Quests abgeschlossen', --#--#--
    AD_DAILY_QUESTS = '完成%d個每日任務。',
    AC_DAILY_QUESTS = 'Schließt %d tägliche Quests ab.', --#--#--

    AN_QUEST_GOLD5 = 'Glitzernde Belohnung', --#--#--
    AN_QUEST_GOLD10 = 'Sammler geprägter Münzen', --#--#--
    AN_QUEST_GOLD25 = 'Täglich Brot', --#--#--
    AN_QUEST_GOLD50 = 'Wohlverdientes Gold', --#--#--
    AN_QUEST_GOLD100 = 'Verdient durch Schweiß und Blut', --#--#--
    AN_QUEST_GOLD250 = 'Golddrucker', --#--#--
    AN_QUEST_GOLD500 = 'Angemessene Entlohnung', --#--#--
    AD_QUEST_GOLD = '從任務獎勵中賺取%d枚金幣。',
    AC_QUEST_GOLD = 'Erhaltet %d Gold durch Questbelohnungen.', --#--#--

    AN_QUESTS_ZONE = '博學大師 %s',
    AD_QUESTS_ZONE = 'Schließt die Quest "%s" in %s ab.', --#--#--
    AD_QUESTS_ZONE_MULTI = 'Schließt die folgenden Quests in %s ab.', --#--#--
    AC_QUESTS_ZONE = 'Schließt die Quest "%s" ab.', --#--#--

    AZSHARA_1 = '艾薩拉',
    AZSHARA_2 = '艾薩拉',
    QUEST_3602 = 'Azsharit', --#--#--

    FELWOOD_1 = '費伍德森林',
    FELWOOD_2 = '費伍德森林',
    QUEST_5165 = 'Übergießen der Flammen des Schutzes', --#--#--
    QUEST_5385 = 'Die Überreste von Trey Lichtschmied', --#--#--

    DESOLACE_1 = '淒涼之地',
    DESOLACE_2 = '淒涼之地',
    QUEST_6027 = 'Buch der Uralten', --#--#--

    DUSTWALLOW_1 = '塵泥沼澤',
    DUSTWALLOW_2 = '塵泥沼澤',
    QUEST_1203 = 'Jarl braucht eine Klinge', --#--#--

    SILITHUS_1 = '希利蘇斯',
    SILITHUS_2 = '希利蘇斯',
    QUEST_8287 = 'Ein teuflischer Plan', --#--#--
    QUEST_8352 = 'Szepter des Rates', --#--#--
    QUEST_8321 = 'Vyral der Üble', --#--#--
    QUEST_8281 = 'Verstärkte Sicherheit', --#--#--

    DUROTAR_1 = '杜洛塔',
    DUROTAR_2 = '杜洛塔',
    QUEST_835 = 'Sicherung der Linien', --#--#--

    BARRENS_1 = '貧瘠之地',
    BARRENS_2 = '貧瘠之地',
    QUEST_888 = 'Gestohlene Beute', --#--#--
    QUEST_902 = 'Samophlang', --#--#--

    WINTERSPRING_1 = '冬泉谷',
    WINTERSPRING_2 = '冬泉谷',
    QUEST_975 = 'Behälter von Mau\'ari', --#--#--
    QUEST_5082 = 'Bedrohung durch die Winterfelle', --#--#--
    QUEST_5121 = 'Oberhäuptling der Winterfelle', --#--#--
    QUEST_5163 = 'Sind wir endlich da, Yeti?', --#--#--
    QUEST_4842 = 'Sonderbare Quellen', --#--#--

    TANARIS_1 = '塔納利斯',
    TANARIS_2 = '塔納利斯',
    QUEST_2662 = '諾格弗格藥劑',
    QUEST_2874 = 'Lieferung für MacKinley', --#--#--
    QUEST_1691 = 'Noch mehr Wüstenläufergerechtigkeit', --#--#--
    QUEST_113 = 'Insektenteil-Analyse', --#--#--

    STONETALON_1 = '石爪山脈',
    STONETALON_2 = '石爪山脈',
    QUEST_1096 = 'Gerenzo Pfeifzang', --#--#--

    UNGORO_1 = '安戈洛環形山',
    UNGORO_2 = '安戈洛環形山',
    QUEST_3962 = 'Allein ist es gefährlich', --#--#--
    QUEST_4245 = 'Chasing A-Me 01', --#--#--
    QUEST_4292 = 'Ein Köder für Lar\'korwi', --#--#--

    THOUSAND_NEEDLES_1 = '千針石林',
    THOUSAND_NEEDLES_2 = '千針石林',
    QUEST_1189 = 'Sicherheit zuerst', --#--#--

    ARATHI_1 = '阿拉希高地',
    ARATHI_2 = '阿拉希高地',
    QUEST_652 = 'Den Hauptstein zerbrechen', --#--#--

    BADLANDS_1 = '荒蕪之地',
    BADLANDS_2 = '荒蕪之地',
    QUEST_737 = 'Verbotenes Wissen', --#--#--
    QUEST_778 = 'Das wird schwierig', --#--#--
    QUEST_656 = 'Beschwören der Prinzessin', --#--#--
	QUEST_793 = 'Zerbrochene Allianzen', --#--#--
	QUEST_717 = 'Erdbeben', --#--#--
    
    EASTERN_PLAGUELANDS_1 = '東瘟疫之地',
    EASTERN_PLAGUELANDS_2 = '東瘟疫之地',
    QUEST_5942 = 'Versteckte Schätze', --#--#--
    QUEST_6148 = 'Das Scharlachrote Orakel Demetria', --#--#--
    QUEST_6187 = 'Ordnung muss wieder hergestellt werden', --#--#--
    QUEST_5265 = 'Der Argentumtresor', --#--#--

    BLASTED_LANDS_1 = '詛咒之地',
    BLASTED_LANDS_2 = '詛咒之地',
    QUEST_3628 = 'Ihr seid Rakh\'likh, Dämon', --#--#--

    STRANGLETHORN_VALLEY_1 = '荊棘谷',
    STRANGLETHORN_VALLEY_2 = '荊棘谷',
    QUEST_208 = '王牌獵人',
    QUEST_600 = 'Venture Company-Bergbau', --#--#--
    QUEST_613 = 'Maurys Fuß aufbrechen', --#--#--
    QUEST_628 = 'Exzelsior', --#--#--
    QUEST_338 = '荊棘谷的青山',
	
	AN_NESINGWARY = '荊棘谷的青山',
	AD_NESINGWARY = '完成赫米特·奈辛瓦里在荊棘谷的所有任務，包括荊棘谷的青山和王牌獵人。',

    WESTERN_PLAGUELANDS_1 = '西瘟疫之地',
    WESTERN_PLAGUELANDS_2 = '西瘟疫之地',
    QUEST_5944 = 'In den Träumen', --#--#--
    QUEST_5051 = 'Zwei Hälften vereint', --#--#--
    QUEST_4985 = 'Die Tierwelt leidet auch', --#--#--

    SEARING_GORGE_1 = '灼熱峽谷',
    SEARING_GORGE_2 = '灼熱峽谷',
    QUEST_3481 = 'Plunder...', --#--#--

    BLACK_ROCK_1 = '黑石山',
    BLACK_ROCK_2 = '黑石山',
    QUEST_8996 = 'Rückkehr zu Bodley', --#--#--

    AN_WISDOM_KEEPER = '博學大師',
    AD_WISDOM_KEEPER = '完成下列的任務成就。',
    AN_WISDOM_KEEPER_AZEROTH = '博學大師',
    AD_WISDOM_KEEPER_AZEROTH = '完成下列的任務成就。',
    AN_WISDOM_KEEPER_KALIMDOR = '卡林多博學大師',
    AD_WISDOM_KEEPER_KALIMDOR = '完成下列的任務成就。',
    AN_WISDOM_KEEPER_EASTERN_KINGDOMS = '東部王國博學大師',
    AD_WISDOM_KEEPER_EASTERN_KINGDOMS = '完成下列的任務成就。',
    AN_WISDOM_KEEPER_OUTLAND = '外域博學大師',
    AD_WISDOM_KEEPER_OUTLAND = '完成下列的外域任務成就。',

    AN_RAGEFIRE_CHASM = '怒焰裂谷',
    AD_RAGEFIRE_CHASM = '擊敗『飢餓者』塔拉加曼。',
    AN_WAILING_CAVERNS = '哀嚎洞穴',
    AD_WAILING_CAVERNS = '擊敗『吞噬者』穆坦努斯。',
    AN_DEAD_MINES = '死亡礦坑',
    AD_DEAD_MINES = '擊敗艾德溫·范克里夫。',
    AN_SHADOWFANG_KEEP = '影牙城堡',
    AD_SHADOWFANG_KEEP = '擊敗大法師阿魯高。',
    AN_BLACKFATHOM_DEEPS = '黑暗深淵',
    AD_BLACKFATHOM_DEEPS = '擊敗阿庫麥爾。',
    AN_JAIL = '暴風城監獄',
    AD_JAIL = '擊敗巴基爾·斯瑞德。',
    AN_GNOMREGAN = '諾姆瑞根',
    AD_GNOMREGAN = '擊敗機電師瑟瑪普拉格。',
    AN_RAZORFEN_KRAUL = '剃刀沼澤',
    AD_RAZORFEN_KRAUL = '擊敗卡爾加‧刺肋。',
    AN_SCARLET_MONASTERY = '血色修道院',
    AD_SCARLET_MONASTERY = '在血色修到院擊敗血色十字軍。',
    AC_SCARLET_MONASTERY1 = '血法師薩爾諾斯',
    AC_SCARLET_MONASTERY2 = '秘法師杜安',
    AC_SCARLET_MONASTERY3 = '赫洛德',
    AC_SCARLET_MONASTERY4 = '血色十字軍指揮官莫格萊尼',
    AC_SCARLET_MONASTERY5 = '高階審判官懷特邁恩',
	
    AN_RAZORFEN_DOWNS = '剃刀高地',
    AD_RAZORFEN_DOWNS = '擊敗『寒冰使者』亞門納爾。',
    AN_ULDAMAN = '奧達曼',
    AD_ULDAMAN = '擊敗阿札達斯。',
    AN_ZULFARRAK = '祖爾法拉克',
    AD_ZULFARRAK = '擊敗烏克茲·沙頂。',
    AN_MARAUDON = '瑪拉頓',
    AD_MARAUDON = '擊敗瑟萊德絲公主。',
    AN_SUNKEN_TEMPLE = '沉沒的神廟',
    AD_SUNKEN_TEMPLE = '擊敗伊蘭尼庫斯之影。',
	
    AN_NEW_EMPEROR = '黑石深淵',
    AD_NEW_EMPEROR = '擊敗達格蘭‧索瑞森大帝。',
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
	
    AN_BLACKROCK_SPIRE_BOTTOM = '黑石塔下層',
    AD_BLACKROCK_SPIRE_BOTTOM = '擊敗維姆薩拉克主宰。',
    AN_BLACKROCK_SPIRE_UPPER = '黑石塔上層',
    AD_BLACKROCK_SPIRE_UPPER = '擊敗達基薩斯將軍。',
    AN_BLACKROCK_SPIRE = 'Eindringling der Schwarzfelsspitze', --#--#--
    AD_BLACKROCK_SPIRE = 'Schließt die unten aufgelisteten Erfolge in der Schwarzfelsspitze ab.', --#--#--
    AN_DIRE_MAUL = '厄運之槌之王',
    AD_DIRE_MAUL = '擊敗厄運之槌每個區的首領。',
    AC_DIRE_MAUL1 = '『狂野變形者』奧茲恩',
    AC_DIRE_MAUL2 = '伊莫塔爾',
    AC_DIRE_MAUL3 = '戈多克大王',
    AN_STRATHOLME = '斯坦索姆',
    AD_STRATHOLME = '擊敗住在斯坦索姆的邪惡首腦。',
	AC_STRATHOLME1 = '巴納札爾',
	AC_STRATHOLME2 = '瑞文戴爾男爵',
    AN_SCHOLOMANCE = '通靈學院',
    AD_SCHOLOMANCE = '擊敗通靈學院的領袖。',
	AC_SCHOLOMANCE1 = '黑暗院長加丁',
	AC_SCHOLOMANCE2 = '萊斯·霜語',
    AN_YOUNG_DEFENDER = '艾澤拉斯地城大師',
    AD_YOUNG_DEFENDER = '完成下列的艾澤拉斯地城成就。',
    AN_DEFENDER = 'Verteidiger von Azeroth', --#--#--
    AD_DEFENDER = 'Schließt die unten aufgelisteten Dungeon-Erfolge ab.', --#--#--
    AR_DEFENDER = 'Verteidiger von Azeroth', --#--#--

    AN_ONYXIA = '奧妮克希亞的巢穴',
    AD_ONYXIA = 'Bezwingt Onyxia.', --#--#--
    AN_AQ20 = '安其拉廢墟',
    AD_AQ20 = '擊敗『無疤者』奧斯里安。',
    AN_ZULGURUB = '祖爾格拉布',
    AD_ZULGURUB = '擊敗哈卡。',
    AN_RAGNAROS = '熔火之心',
    AD_RAGNAROS = '擊敗拉格納羅斯。',
    AN_BLACK_WING_LAIR = '黑翼之巢',
    AD_BLACK_WING_LAIR = '擊敗奈法利安。',
    AN_AQ40 = '安其拉神廟',
    AD_AQ40 = '擊敗克蘇恩。',
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

    AN_PVP_RANK_A1 = '士兵',
    AN_PVP_RANK_A2 = '下士',
    AN_PVP_RANK_A3 = '士官',
    AN_PVP_RANK_A4 = '上士',
    AN_PVP_RANK_A5 = '士官長',
    AN_PVP_RANK_A6 = '騎士',
    AN_PVP_RANK_A7 = '中尉騎士',
    AN_PVP_RANK_A8 = '上尉騎士',
    AN_PVP_RANK_A9 = '一等騎士',
    AN_PVP_RANK_A10 = '少校',
    AN_PVP_RANK_A11 = '指揮官',
    AN_PVP_RANK_A12 = '元帥',
    AN_PVP_RANK_A13 = '戰場元帥',
    AN_PVP_RANK_A14 = '總元帥',
    AN_PVP_RANK_H1 = '斥候',
    AN_PVP_RANK_H2 = '蠻兵',
    AN_PVP_RANK_H3 = '士官',
    AN_PVP_RANK_H4 = '資深士官',
    AN_PVP_RANK_H5 = '一等士官',
    AN_PVP_RANK_H6 = '石衛士',
    AN_PVP_RANK_H7 = '血衛士',
    AN_PVP_RANK_H8 = '軍團士兵',
    AN_PVP_RANK_H9 = '百夫長',
    AN_PVP_RANK_H10 = '勇士',
    AN_PVP_RANK_H11 = '中將',
    AN_PVP_RANK_H12 = '將軍',
    AN_PVP_RANK_H13 = '督軍',
    AN_PVP_RANK_H14 = '高階督軍',
    AD_PVP_RANK = 'Den Titel "%s" erhalten.', --#--#--
    AN_PVP_FIRST_KILL = '一個榮譽擊殺',
    AD_PVP_FIRST_KILL = '達成一個榮譽擊殺。',
    AC_PVP_FIRST_KILL = '達成一個榮譽擊殺。',
    AN_PVP_KILLS = '%d次榮譽擊殺',
    AD_PVP_KILLS = '達成%d次榮譽擊殺。',
    AC_PVP_KILLS = '達成%d次榮譽擊殺',

    AN_MOB_KILLS_1 = 'Totschläger', --#--#--
    AN_MOB_KILLS_2 = 'Zerstörer', --#--#--
    AN_MOB_KILLS_3 = 'Brecher', --#--#--
    AN_MOB_KILLS_4 = 'Kopfgeldjäger', --#--#--
    AN_MOB_KILLS_5 = 'Gewittersturm aller Monster', --#--#--
    AN_MOB_KILLS_6 = 'Gewittersturm allen Lebens', --#--#--
    AN_MOB_KILLS_7 = 'Allgegenwärtiger Tod', --#--#--
    AD_MOB_KILLS = 'Tötet %d Gegner.', --#--#--
    AC_MOB_KILLS = 'Tötet %d Gegner', --#--#--

    AN_REPS_1 = '還是有人喜歡我',
    AD_REPS_1 = '1項聲望提升至崇拜。',
    AC_REPS_1 = '1項聲望提升至崇拜。',
    AN_REPS_X = '崇拜聲望',
    AD_REPS = '%d項聲望提升至崇拜。',
    AC_REPS = 'Erreicht bei %d Fraktionen einen ehrfürchtigen Ruf.', --#--#--
    AR_REPS = 'Der Ehrfurchtgebietende', --#--#--

    AN_HORDE_REPS = '部落大使',
    AD_HORDE_REPS = '取得五座主城的聲望崇拜。',
    AC_HORDE_REPS_1 = '奧格瑪崇拜',
    AC_HORDE_REPS_2 = '暗矛食人妖崇拜',
    AC_HORDE_REPS_3 = '幽暗城崇拜',
    AC_HORDE_REPS_4 = '雷霆崖崇拜',
    AC_HORDE_REPS_5 = '銀月城崇拜',

    AN_ALLIANCE_REPS = '聯盟大使',
    AD_ALLIANCE_REPS = '取得五座主城的聲望崇拜。',
    AC_ALLIANCE_REPS_1 = '暴風城崇拜',
    AC_ALLIANCE_REPS_2 = '達納蘇斯崇拜',
    AC_ALLIANCE_REPS_3 = '諾姆瑞根流亡者崇拜',
    AC_ALLIANCE_REPS_4 = '鐵爐堡崇拜',
    AC_ALLIANCE_REPS_5 = '艾克索達崇拜',

    AN_ARGENT_DAWN = '銀色黎明',
    AD_ARGENT_DAWN = '取得銀色黎明的聲望崇拜。',
    AN_BROOD_OF_NOZDORMU = '諾茲多姆的子嗣',
    AD_BROOD_OF_NOZDORMU = '取得諾茲多姆的子嗣的聲望崇拜。',
    AN_DARKMOON_FAIRE = '暗月馬戲團',
    AD_DARKMOON_FAIRE = 'Erreicht beim Dunkelmond-Jahrmarkt den Status ehrfürchtig.', --#--#--
    AN_ZANDALAR_TRIBE = '贊達拉部族的英雄',
    AD_ZANDALAR_TRIBE = '取得贊達拉部族的聲望崇拜。',
    AN_HYDRAXIANS = '海達希亞水元素',
    AD_HYDRAXIANS = '取得海達希亞水元素的聲望崇拜。',
    AN_TIMBERMAW_HOLD = '愛在隧道中',
    AD_TIMBERMAW_HOLD = '取得木喉要塞的聲望崇拜。',
    AN_THORIUM = '瑟銀兄弟會',
    AD_THORIUM = 'Erreicht bei der Thoriumbruderschaft den Status ehrfürchtig.', --#--#--
    AN_SHENDRALAR = 'Agent der Shen\'dralar', --#--#--
    AD_SHENDRALAR = 'Erreicht bei den Shen\'dralar den Status ehrfürchtig.', --#--#--
    AN_CENARION = '塞納里奧議會',
    AD_CENARION = 'Erreicht beim Zirkel des Cenarius den Status ehrfürchtig.', --#--#--

    AN_DEFILERS = '污染者',
    AD_DEFILERS = '在污染者獲得聲望崇拜。',
    AN_FROSTWOLF_CLAN = '霜狼氏族的英雄',
    AD_FROSTWOLF_CLAN = '在霜狼氏族獲得聲望崇拜。',
    AN_WARSONG_OUTRIDERS = '戰歌先遣騎',
    AD_WARSONG_OUTRIDERS = '在戰歌先遣騎獲得聲望崇拜。',
    AN_HORDE_PVP_FRACTIONS = '征服者',
    AD_HORDE_PVP_FRACTIONS = '你的戰歌峽谷、阿拉希盆地與奧特蘭克山谷聲望提升至崇拜。',

    AN_LEAGUE_OF_ARATHOR = '阿拉索騎士',
    AD_LEAGUE_OF_ARATHOR = '在阿拉索聯軍獲得聲望崇拜。',
    AN_STORMSPIKE_GUARD = '雷矛衛隊的英雄',
    AD_STORMSPIKE_GUARD = '在雷矛衛隊獲得聲望崇拜。',
    AN_SILVERWING_SENTINELS = '銀翼哨兵',
    AD_SILVERWING_SENTINELS = '在銀翼哨兵獲得聲望崇拜。',
    AN_ALLIANCE_PVP_FRACTIONS = '審判者',
    AD_ALLIANCE_PVP_FRACTIONS = '你的戰歌峽谷、阿拉希盆地與奧特蘭克山谷聲望提升至崇拜。',

    AN_BOLVAR_SLAYER = '暴風城風暴降臨',
    AD_BOLVAR_SLAYER = '擊殺大領主伯瓦爾·弗塔根。',
    AN_MAGNI_SLAYER = '國王之死!',
    AD_MAGNI_SLAYER = '擊殺麥格尼·銅鬚國王。',
    AN_TYRANDE_SLAYER = '不朽的終止',
    AD_TYRANDE_SLAYER = '擊殺高階祭司泰蘭妲·語風。',
    AN_VELEN_SLAYER = '熄滅聖光',
    AD_VELEN_SLAYER = '擊殺預言者費倫。',

    AN_ALLIANCE_KINGS_SLAYER = '為了部落!',
    AD_ALLIANCE_KINGS_SLAYER = '殺死聯盟首領。',

    AN_THRALL_SLAYER = '大酋長之死!',
    AD_THRALL_SLAYER = '擊殺索爾。',
    AN_SYLVANAS_SLAYER = '黑暗女王殞命',
    AD_SYLVANAS_SLAYER = '擊殺希瓦娜斯·風行者女士。',
    AN_CAIRNE_SLAYER = '染血的血蹄',
    AD_CAIRNE_SLAYER = '擊殺凱恩·血蹄。',
    AN_LORTHEMAR_SLAYER = '奎爾薩拉斯暗殺',
    AD_LORTHEMAR_SLAYER = '擊殺洛索瑪·塞隆。',

    AN_HORDE_KINGS_SLAYER = '為了聯盟!',
    AD_HORDE_KINGS_SLAYER = '殺死部落首領。',

    AN_RACES_KILLER = '瞭解敵人',
    AD_ALLIANCE_RACES_KILLER = '分別對五個不同種族取得最後一擊。',
    AD_HORDE_RACES_KILLER = '分別對五個不同種族取得最後一擊。',
    AC_HUMAN_KILLED = '人類',
    AC_NIGHTELF_KILLED = '夜精靈',
    AC_DWARF_KILLED = '矮人',
    AC_GNOME_KILLED = '地精',
    AC_ORC_KILLED = '獸人',
    AC_TROLL_KILLED = '食人妖',
    AC_SCOURGE_KILLED = '不死族',
    AC_TAUREN_KILLED = '牛頭人',
    AC_DRAENEI_KILLED = '德萊尼',
    AC_BLOODELF_KILLED = '血精靈',

    AN_CLASSES_KILLER = '不分職業',
    AD_CLASSES_KILLER = '分別對每一個不同種職業取得最後一擊。',
    AC_WARRIOR_KILLED = '戰士',
    AC_HUNTER_KILLED = '獵人',
    AC_ROGUE_KILLED = '盜賊',
    AC_PRIEST_KILLED = '牧師',
    AC_MAGE_KILLED = '法師',
    AC_WARLOCK_KILLED = '術士',
    AC_DRUID_KILLED = '德魯伊',
    AC_PALADIN_KILLED = '聖騎士',
    AC_SHAMAN_KILLED = '薩滿',

    AN_ALTERAC_WIN = '奧特蘭克山谷勝利',
    AD_ALTERAC_WIN = '奧特蘭克山谷獲勝。',
    AN_ALTERAC_WINS = '奧特蘭克山谷精兵',
    AD_ALTERAC_WINS = 'Erringt %d Siege im Alteractal.', --#--#--
    AN_WARSONG_WIN = '戰歌峽谷勝利',
    AD_WARSONG_WIN = '戰歌峽谷獲勝。',
    AN_WARSONG_WINS = '戰歌峽谷精兵',
    AD_WARSONG_WINS = '在戰歌峽谷完成%d次勝利。',
    AN_ARATHI_WIN = '阿拉希盆地勝利',
    AD_ARATHI_WIN = '阿拉希盆地獲勝。',
    AN_ARATHI_WINS = '阿拉希盆地精兵',
    AD_ARATHI_WINS = '在阿拉希盆地完成%d次勝利。',
    AN_EYE_WIN = '暴風之眼勝利',
    AD_EYE_WIN = '暴風之眼獲勝。',
    AN_EYE_WINS = '暴風之眼精兵',
    AD_EYE_WINS = 'Erringt %d Siege im Auge des Sturms.', --#--#--

    AN_ALTERAC_KILLING_BLOWS = 'Fleischwolf des Alteractals', --#--#--
    AD_ALTERAC_KILLING_BLOWS = 'Erreicht %d Todesstöße während einer einzigen Schlacht im Alteractal und bleibt bis zu deren Ende.', --#--#--
    AN_ALTERAC_GRAVEYARD_ASSAULT = '奧特蘭克盜墓者',
    AD_ALTERAC_GRAVEYARD_ASSAULT = '在奧特蘭克山谷中奪取50個墓地。',
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
    AN_ALTERAC_AUTOGRAPH = '贏家全拿',
    AD_ALTERAC_AUTOGRAPH = '於奧特蘭克山谷中拾取提古勒的簽名照。',

    AN_WARSONG_KILLS = 'Militärische Auszeichnung', --#--#--
    AD_WARSONG_KILLS = 'Erreicht %d ehrenhafte Siege während einer einzigen Schlacht in der Kriegshymnenschlucht und bleibt bis zu deren Ende.', --#--#--
    AN_WARSONG_FLAG_CAPTURE = '佔領旗幟',
    AD_WARSONG_FLAG_CAPTURE = '你在戰歌峽谷中攜帶並佔領旗幟。',
    AN_WARSONG_FLAG_CAPTURES = 'Großartiger Flaggenträger', --#--#--
    AD_WARSONG_FLAG_CAPTURES = 'Ergreift und erobert %d gegnerische Flaggen während einer einzigen Schlacht in der Kriegshymnenschlucht und bleibt bis zu deren Ende.', --#--#--
    AN_WARSONG_FLAG_RETURN = 'Fasst das nicht an!', --#--#--
    AD_WARSONG_FLAG_RETURN = 'Bringt als Verteidiger eine Flagge während einer einzigen Schlacht in der Kriegshymnenschlucht zurück und bleibt bis zu deren Ende.', --#--#--
    AN_WARSONG_FLAG_RETURNS = '固執防衛者',
    AD_WARSONG_FLAG_RETURNS = 'Bringt als Verteidiger %d Flaggen während einer einzigen Schlacht in der Kriegshymnenschlucht zurück und bleibt bis zu deren Ende.', --#--#--

    AN_ARATHI_BASE_ASSAULT = 'Konquistador', --#--#--
    AD_ARATHI_BASE_ASSAULT = 'Erobert eine Basis während einer einzigen Schlacht im Arathibecken und bleibt bis zu deren Ende.', --#--#--
    AN_ARATHI_BASE_ASSAULTS = '我和我的摸旗技術讓這一切成為現實',
    AD_ARATHI_BASE_ASSAULTS = 'Erobert %d Basen während einer einzigen Schlacht im Arathibecken und bleibt bis zu deren Ende.', --#--#--
    AN_ARATHI_BASE_DEFEND = 'Beschützer', --#--#--
    AD_ARATHI_BASE_DEFEND = 'Verteidigt eine Basis während einer einzigen Schlacht im Arathibecken und bleibt bis zu deren Ende.', --#--#--
    AN_ARATHI_BASE_DEFENDS = 'Wächter', --#--#--
    AD_ARATHI_BASE_DEFENDS = 'Verteidigt %d Basen während einer einzigen Schlacht im Arathibecken und bleibt bis zu deren Ende.', --#--#--
    AN_ARATHI_CLOSE = '我們終究贏了 *咳嗽*',
    AD_ARATHI_CLOSE = '阿拉希盆地以10分差距獲勝(1600比1590)。',
    AN_ARATHI_PERFECT = '阿拉希盆地完封',
    AD_ARATHI_PERFECT = '阿拉希盆地以1600比0獲勝。',

    AN_EYE_CAPTURE = '暴風籠罩',
    AD_EYE_CAPTURE = '你在暴風之眼中攜帶並佔領旗幟。',
    AD_EYE_CAPTURES = 'Ergreift und erobert persönlich %d Flaggen im Auge des Sturms und bleibt bis zum Ende der Schlacht.', --#--#--
    AN_EYE_GLORY = '為榮耀而生',
    AD_EYE_GLORY = '在單場暴風之眼競賽中，佔領旗幟3次，同時未曾死亡。',
    AN_EYE_FAST_WIN = '狂風',
    AD_EYE_FAST_WIN = '暴風之眼在6分鐘以內獲勝。',
    AN_EYE_BERSERK = '嗜血狂戰士',
    AD_EYE_BERSERK = '在暴風之眼中，於狂暴增益的效果下取得最後一擊。',
    AN_EYE_IDEAL_VICTORY = '完美的風暴',
    AD_EYE_IDEAL_VICTORY = '暴風之眼分數1600比0獲勝。',

    AN_BGS_KILLING_BLOWS = '死亡使者',
    AD_BGS_KILLING_BLOWS = 'Erringt %d Todesstöße auf einem beliebigen Schlachtfeld.', --#--#--
    AN_BGS_KILLS = '死神',
    AD_BGS_KILLS = 'Erringt %d ehrenhafte Siege auf einem beliebigen Schlachtfeld.', --#--#--

    PROF_FIRST_AID = '急救',
    PROF_FISHING = '釣魚',
    PROF_COOKING = '烹飪',
    PROF_ENCHANTING = '附魔',
    PROF_TAILORING = '裁縫',
    PROF_ENGINEERING = '工程學',
    PROF_LEATHERWORKING = '製皮',
    PROF_ALCHEMY = '鍊金術',
    PROF_BLACKSMITHING = '鍛造',
    PROF_HERBALISM = '草藥學',
    PROF_MINING = '採礦',
    PROF_SKINNING = '剝皮',
    PROF_JEWELCRAFTING = '珠寶設計',
    SKILL_UNARMED = '徒手戰鬥',
    SKILL_RIDING = '騎術',

    AN_PROFS_JOURNEYMAN = 'Lehrlingsprüfung', --#--#--
    AD_PROFS_JOURNEYMAN = 'Erlangt 75 Fertigkeitspunkte in einem Beruf.', --#--#--
    AN_PROFS_EXPERT = '專業中級職人',
    AD_PROFS_EXPERT = '習得一種中級專業技能。',
    AN_PROFS_ARTISAN = '專業高級職人',
    AD_PROFS_ARTISAN = '習得一種高級專業技能。',
    AN_PROFS_ONE = 'Professioneller Fachmann', --#--#--
    AD_PROFS_ONE = 'Erlangt 300 Fertigkeitspunkte in einem Beruf.', --#--#--
    AN_PROFS_ONE_OUTLAND = '專業大師',
    AD_PROFS_ONE_OUTLAND = '習得一種大師級專業技能。',
    AN_PROFS_TWO = 'Handwerker', --#--#--
    AD_PROFS_TWO = 'Werdet gleichzeitig in zwei Berufen Fachmann.', --#--#--
    AC_PROFS_TWO = 'Werdet gleichzeitig in zwei Berufen Fachmann.', --#--#--
    AN_PROFS_TWO_OUTLAND = 'Handwerker der Scherbenwelt', --#--#--
    AD_PROFS_TWO_OUTLAND = 'Werdet gleichzeitig in zwei Berufen Meister.', --#--#--
    AC_PROFS_TWO_OUTLAND = 'Werdet gleichzeitig in zwei Berufen Meister.', --#--#--

    AN_FIRST_AID_JOURNEYMAN = 'Lehrling in Erster Hilfe', --#--#--
    AD_FIRST_AID_JOURNEYMAN = 'Erlangt 75 Fertigkeitspunkte in Erster Hilfe.', --#--#--
    AN_FIRST_AID_EXPERT = '習得中級急救技能',
    AD_FIRST_AID_EXPERT = '習得中級急救技能。',
    AN_FIRST_AID_ARTISAN = '習得高級急救技能',
    AD_FIRST_AID_ARTISAN = '習得高級急救技能。',
    AN_FIRST_AID_MASTER = 'Fachmann in Erster Hilfe', --#--#--
    AD_FIRST_AID_MASTER = 'Erlangt 300 Fertigkeitspunkte in Erster Hilfe.', --#--#--
    AN_FIRST_AID_OUTLAND_MASTER = '習得大師級急救技能',
    AD_FIRST_AID_OUTLAND_MASTER = '習得大師級急救技能。',
	
    AN_FISHING_JOURNEYMAN = 'Anglerlehrling', --#--#--
    AD_FISHING_JOURNEYMAN = 'Erlangt 75 Fertigkeitspunkte im Angeln.', --#--#--
    AN_FISHING_EXPERT = '中級漁夫',
    AD_FISHING_EXPERT = '習得中級釣魚技能。',
    AN_FISHING_ARTISAN = '高級漁夫',
    AD_FISHING_ARTISAN = '習得高級釣魚技能。',
    AN_FISHING_MASTER = '專家級漁夫',
    AD_FISHING_MASTER = '習得專家級釣魚技能。',
    AN_FISHING_OUTLAND_MASTER = '大師級漁夫',
    AD_FISHING_OUTLAND_MASTER = '習得大師級釣魚技能。',
	
    AN_COOKING_JOURNEYMAN = 'Kochlehrling', --#--#--
    AD_COOKING_JOURNEYMAN = 'Erlangt 75 Fertigkeitspunkte im Kochen.', --#--#--
    AN_COOKING_EXPERT = '中級廚師',
    AD_COOKING_EXPERT = '習得中級烹飪技能。',
    AN_COOKING_ARTISAN = '高級廚師',
    AD_COOKING_ARTISAN = '習得高級烹飪技能。',
    AN_COOKING_MASTER = '專家級廚師',
    AD_COOKING_MASTER = '習得專家級烹飪技能。',
    AN_COOKING_OUTLAND_MASTER = '大師級廚師',
    AD_COOKING_OUTLAND_MASTER = '習得大師級烹飪技能。',
	
    AN_PROFS_SECONDARY = '付帳的技巧',
    AD_PROFS_SECONDARY = '習得釣魚、急救與烹飪的專家級技能。',
    AN_PROFS_SECONDARY_OUTLAND = '付帳的技巧',
    AD_PROFS_SECONDARY_OUTLAND = '習得釣魚、急救與烹飪的大師級技能。',
    AN_PROFS_FIVE = 'Genie', --#--#--
    AN_PROFS_FIVE_OUTLAND = 'Genie der Scherbenwelt', --#--#--
    AD_PROFS_FIVE = 'Erlangt die unten aufgelisteten Berufserfolge.', --#--#--
    AN_UNARMED_SKILL = '誰點了砂鍋大的拳頭?',
    AD_UNARMED_SKILL = '徒手戰鬥技能提升至350點。',

    AN_EXPLORE_AZEROTH = '世界探險家',
    AD_EXPLORE_AZEROTH = '探索東部王國、卡林多與外域。',
	AR_EXPLORER = 'Entdecker', --#--#--
    AN_EXPLORE_KALIMDOR = '探索卡林多',
    AD_EXPLORE_KALIMDOR = '探索卡林多所有區域。',
    AN_EXPLORE_EASTERN_KINGDOMS = '探索東部王國',
    AD_EXPLORE_EASTERN_KINGDOMS = '探索東部王國所有區域。',
	AN_EXPLORE = 'Erforscht %s', --#--#--
    AD_EXPLORE = 'Erforscht %s und enthüllt die verdeckten Gebiete auf der Weltkarte.', --#--#--

    AN_SULFURAS = '薩弗拉斯，炎魔拉格納羅斯之手',
    AD_SULFURAS = '薩弗拉斯，炎魔拉格納羅斯之手的持有者。',
    AN_THUNDER_FURY = '雷霆之怒，逐風者的祝福之刃',
    AD_THUNDER_FURY = '雷霆之怒，逐風者的祝福之刃的持有者。',
    AN_ATIESH = '阿泰絲，守護者之杖',
    AD_ATIESH = '阿泰絲，守護者之杖的持有者。',
    AN_BLACK_SCARAB = '聖甲蟲領主',
    AD_BLACK_SCARAB = '打開安其拉之門。',
    AN_RED_SCARAB = '問我為什麼?因為它是紅色的',
    AD_RED_SCARAB = '獲得一顆紅色其拉共鳴水晶。',
	AN_TIGER_MOUNT = '迅捷祖利安猛虎',
    AD_TIGER_MOUNT = '從祖爾格拉布的高階祭司塞卡爾手中獲得迅捷祖利安猛虎。',
	AN_RAPTOR_MOUNT = '迅捷拉札希迅猛龍',
    AD_RAPTOR_MOUNT = '從祖爾格拉布的血領主曼多基爾手中獲得迅捷拉札希迅猛龍。',
	AN_BARON_MOUNT = '死亡戰騎韁繩',
    AD_BARON_MOUNT = '從斯坦索姆的瑞文戴爾男爵手中獲得死亡戰騎韁繩。',
	AN_SABER_MOUNT = '冬泉霜刃豹',
    AD_SABER_MOUNT = '獲得一隻冬泉霜刃豹。',
    AN_ARGENT_DAWN_TABARD = '銀色黎明外袍',
    AD_ARGENT_DAWN_TABARD = '從天譴軍團入侵事件獲得銀色黎明外袍。',
    
    AN_UNCOMMON_GEAR = 'Selten', --#--#--
    AD_UNCOMMON_GEAR = 'Legt an jedem Platz einen Gegenstand von seltener Qualität an.', --#--#--
    AN_RARE_GEAR = '藍裝人',
    AD_RARE_GEAR = '全身每個部位都裝備物品等級最低115級的精良物品。',
    AN_EPIC_GEAR = '紫裝人',
    AD_EPIC_GEAR = '全身每個部位都裝備物品等級最低115級的史詩物品。',

    AN_STOCKING_UP = '存起來',
    AD_STOCKING_UP = '製造500個厚幽紋繃帶',
    AC_STOCKING_UP = 'Stellt 100 schwere Runenstoffverbände her', --#--#--
    AN_STOCKING_UP_2 = '存起來',
    AD_STOCKING_UP_2 = '製造500個厚符文布繃帶',
    AC_STOCKING_UP_2 = '製造500個厚符文布繃帶',
    AN_STOCKING_UP_OUTLAND = 'Vorbereitung für die Leere', --#--#--
    AD_STOCKING_UP_OUTLAND = 'Stellt 100 schwere Netherstoffverbände her.', --#--#--
    AC_STOCKING_UP_OUTLAND = 'Stellt 100 schwere Netherstoffverbände her', --#--#--
    AN_STOCKING_UP_2_OUTLAND = '存起來',
    AD_STOCKING_UP_2_OUTLAND = '製造500個厚幽紋繃帶',
    AC_STOCKING_UP_2_OUTLAND = '製造500個厚幽紋繃帶',

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
	
	AN_FISHING_COUNT = '%d隻魚',
	AC_FISHING_COUNT = 'Angelt %d Gegenstände oder Fische.', --#--#--
	AD_FISHING_COUNT = '釣起%d個物品。',

    AN_COOKING_RECIPES_5 = '午餐媽媽',
    AN_COOKING_RECIPES_10 = '快餐廚師',
    AN_COOKING_RECIPES_25 = '部門主廚',
    AN_COOKING_RECIPES_50 = '副主廚',
    AN_COOKING_RECIPES_75 = 'Chef de Cuisine', --#--#--
    AR_COOKING_RECIPES = 'Chefkoch', --#--#--
    AD_COOKING_RECIPES = '學習%d個烹飪食譜。',
    AC_COOKING_RECIPES = 'Lernt %d Kochrezepte', --#--#--

    AN_COOKING_SOUP = 'Suppenkocher', --#--#--
    AN_COOKING_DESSERT = 'Knollenmeister', --#--#--
    AN_COOKING_SQUID = 'Fang des Tages', --#--#--
    AN_COOKING_DUMPLINGS = 'Omas Knödel', --#--#--
    AN_COOKING_CAKE = '這蛋糕不是騙人的',
    AD_COOKING_CAKE = '烘烤一個美味的巧克力蛋糕。',
    AD_COOKING_CREATE = 'Kocht %s %d-mal.', --#--#--
    AC_COOKING_CREATE = 'Kocht %s %d-mal', --#--#--
    AN_COOKING_BIG_TABLE = '主廚萬歲',
    AD_COOKING_BIG_TABLE = '完成下列的烹飪成就。',

    AN_COOKING_FISHERMANS_FEAST = '漁夫大餐',
    AN_COOKING_SPICY_HOT_TALBUK = '辣炒塔巴克',
    AN_COOKING_SKULLFISH_SOUP = '鯨肉湯',
    AN_COOKING_RAVAGER_DOG = '劫毀熱狗',

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

    AN_DUEL = '嗜殺',
    AD_DUEL = '與另一名玩家決鬥獲勝。',
    AN_DUELS_10 = '決鬥者',
    AN_DUELS_25 = 'Geübter Duellist', --#--#--
    AN_DUELS_100 = 'Meister-Duellist', --#--#--
    AD_DUELS = 'Gewinnt in %d Duellen.', --#--#--
    AC_DUELS = 'Gewinnt in %d Duellen', --#--#--
    AN_GURUBASHI_1 = '古拉巴什競技場大師',
    AD_GURUBASHI_1 = '從古拉巴什競技場中拾取競技場大師飾品。',
    AN_GURUBASHI_2 = '古拉巴什競技場宗師',
    AD_GURUBASHI_2 = '完成小個子約翰·米斯瑞爾的任務，取得競技場宗師飾物。',
    AN_PARTICIPATE_IN_BGS = '戰爭的號角!',
    AD_PARTICIPATE_IN_BGS = 'Schließt %d Schlachtfelder ab.', --#--#--
    AC_PARTICIPATE_IN_BGS = 'Schließt %d Schlachtfelder ab.', --#--#--

    EMOTE_LOVE1 = 'Ihr liebt %s.', --#--#--
    AN_LOVE = '獻給所有我愛過的松鼠',
    AD_LOVE = '讓艾澤拉斯的小動物知道你有多麼 /愛 牠們。',
    EMOTE_PAT1 = 'Ihr streichelt %s.', --#--#--
    AN_ARATHI_CATS = 'Katzen sind am wichtigsten', --#--#--
    AD_ARATHI_CATS = 'Streichelt die angegebenen Haustiere im Arathibecken (/streicheln).', --#--#--

    AN_ALTERAC_FAST_WIN = '奧特蘭克閃擊戰',
    AD_ALTERAC_FAST_WIN = '奧特蘭克山谷在6分鐘以內獲勝。',
    AN_WARSONG_FAST_WIN = '戰歌快手',
    AD_WARSONG_FAST_WIN = '戰歌峽谷在7分鐘以內獲勝。',
    AN_ARATHI_FAST_WIN = '搞定它',
    AD_ARATHI_FAST_WIN = '阿拉希盆地在6分鐘以內獲勝。',

    AN_ALTERAC_TOWER_DEFEND_TOTAL = '哨塔防禦',
    AD_ALTERAC_TOWER_DEFEND_TOTAL = '在奧特蘭克山谷中守住%d座哨塔。',
    AN_ALTERAC_GRAVEYARD_ASSAULT_TOTAL = '奧特蘭克盜墓者',
    AD_ALTERAC_GRAVEYARD_ASSAULT_TOTAL = '在奧特蘭克山谷中奪取%d個墓地。',
    AN_WARSONG_FLAG_CAPTURE_TOTAL = '佔領旗幟',
    AD_WARSONG_FLAG_CAPTURE_TOTAL = 'Ergreift und erobert persönlich %d Flaggen in der Kriegshymnenschlucht.', --#--#--
    AN_WARSONG_FLAG_RETURN_TOTAL = '固執防衛者',
    AD_WARSONG_FLAG_RETURN_TOTAL = '於戰歌峽谷中以防守方身份搶回%d根旗幟。',
    AN_ARATHI_BASE_ASSAULT_TOTAL = '我和我的摸旗技術讓這一切成為現實',
    AD_ARATHI_BASE_ASSAULT_TOTAL = '在阿拉希盆地中奪取%d個旗幟。',
    AN_ARATHI_BASE_DEFEND_TOTAL = '及時救援!',
    AD_ARATHI_BASE_DEFEND_TOTAL = '在阿拉希盆地守住基地的旗子%d次。',
    AN_ALTERAC_MOUNT_HORDE = '霜狼嗥叫者',
    AD_ALTERAC_MOUNT_HORDE = '獲得一頭霜狼嗥叫者。',
    AN_ALTERAC_MOUNT_ALLIANCE = '雷矛軍用戰騎',
    AD_ALTERAC_MOUNT_ALLIANCE = '獲得一頭雷矛軍用戰騎。',

    AN_ALTERAC_BOSS = '奧特蘭克山谷大師',
    AD_ALTERAC_BOSS = '完成下列的奧特蘭克山谷成就。',
    AN_WARSONG_BOSS = '戰歌峽谷大師',
    AD_WARSONG_BOSS = '完成下列的戰歌峽谷成就。',
    AN_ARATHI_BOSS = '阿拉希盆地大師',
    AD_ARATHI_BOSS = '完成下列的阿拉希盆地成就。',
    AN_EYE_BOSS = '暴風之眼大師',
    AD_EYE_BOSS = '完成下列的暴風之眼成就。',
    AN_BATTLEMASTER = '戰鬥大師',
    AD_BATTLEMASTER = '完成下列的戰場成就。',
    AR_BATTLEMASTER = '頭銜獎勵:戰鬥大師',

    AN_LEEROY = 'Leeeeeeeeeeeeeroy!',
    AD_LEEROY = '15秒內擊殺50隻群居幼龍。',
    AR_LEEROY = '頭銜:炸雞勇者',
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
	
	AN_PIRATES_HAT = '敬禮，艦隊司令!',
	AD_PIRATES_HAT = '獲得血帆上將之帽…該出門去呼吸一些新鮮空氣了吧。',
	AR_PIRATES_HAT = '頭銜:血帆上將',
	AN_PALADIN_MOUNT = '戰騎',
	AD_PALADIN_MOUNT = '完成聖騎士的戰騎任務。',
	AN_WARLOCK_MOUNT = '克索諾斯恐懼戰馬',
	AD_WARLOCK_MOUNT = '完成術士的克索諾斯恐懼戰馬任務。',
	
	AN_HALLOWSEND = '以汝之名慶萬鬼',
	AD_HALLOWSEND = '完成下列的萬鬼節成就。',
	AR_HALLOWSEND = '頭銜獎勵:萬鬼',
	
	AN_PUMPKIN = 'Ziemlich gruselig', --#--#--
	AD_PUMPKIN = 'Erhaltet eine Kürbistasche während der Schlotternächte.', --#--#--
	AN_HALLOWSEND_ALLIANCE_QUEST1 = '發臭的萬鬼節',
	AD_HALLOWSEND_ALLIANCE_QUEST1 = '完成哈特曼中士的任務以破壞部落的萬鬼節，這其中包括了破壞稻草人節及清除南海鎮的臭彈。',
	AC_HALLOWSEND_ALLIANCE_QUEST1_CRITERIA1 = '破壞稻草人節',
	AC_HALLOWSEND_ALLIANCE_QUEST1_CRITERIA2 = '松木的力量',
	AN_HALLOWSEND_HORDE_QUEST1 = '發臭的萬鬼節',
	AD_HALLOWSEND_HORDE_QUEST1 = '完成黑暗召喚者雅恩卡的任務以破壞聯盟的萬鬼節，這其中包括了前往南海鎮，用臭雞蛋破壞酒桶，並且將臭彈丟進鎮裡。',
	AC_HALLOWSEND_HORDE_QUEST1_CRITERIA1 = '惡臭雞蛋和惡臭的酒桶',
	AC_HALLOWSEND_HORDE_QUEST1_CRITERIA2 = '薰死南海鎮',
	
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
	
	AN_HALLOWSEND_TREATS = '不給糖就搗蛋!',
	AD_HALLOWSEND_TREATS = '從旅店中的糖果桶裡面取得一把糖果。',
	
	AN_HALLOWSEND_MASK = '面具任務',
	AD_HALLOWSEND_MASK = '在萬鬼節期間得到劣質面具。',
	
	AN_HALLOWSEND_MASKS = '萬用面具',
	AD_HALLOWSEND_MASKS = '收集20種下列表中的劣質面具。',
	
	AN_HALLOWSEND_TRANSFORM = '化妝舞會',
	AD_HALLOWSEND_TRANSFORM = '被下列的萬鬼節魔杖變身成各種裝扮過。',
	AC_HALLOWSEND_GHOST = '被萬鬼節魔杖變形 - 鬼魂',
	AC_HALLOWSEND_GNOME = '被萬鬼節魔杖變形 - 麻瘋地精',
	AC_HALLOWSEND_WISP = '被萬鬼節魔杖變形 - 幽光',
	AC_HALLOWSEND_NINJA = '被萬鬼節魔杖變形 - 忍者',
	AC_HALLOWSEND_SKELETON = '被萬鬼節魔杖變形 - 骷髏',
	AC_HALLOWSEND_PIRATE = '被萬鬼節魔杖變形 - 海盜',
	AC_HALLOWSEND_BAT = '被萬鬼節魔杖變形 - 蝙蝠',

    --WINTERVEIL
    AN_WINTERVEIL = '狂歡客',
	AD_WINTERVEIL = '完成下列的冬幕節成就。',
	AR_WINTERVEIL = '頭銜獎勵:狂歡客',

    AN_WINTERVEIL_METZEN = '梅特森騎手!',
	AD_WINTERVEIL_METZEN = '拯救麋鹿梅特森。',

    AN_WINTERVEIL_SMOKEYWOOD = '一整個討人厭',
	AD_WINTERVEIL_SMOKEYWOOD = '完成取回燻木牧場被偷走的禮品任務，並獲得燻木牧場的感謝。',

    AN_WINTERVEIL_GOURMET = '冬幕美食家',
	AD_WINTERVEIL_GOURMET = '在冬幕節期間，使用你的烹飪專業技能製作薑餅、蛋奶酒以及熱蘋果酒。',
    AC_WINTERVEIL_GOURMET_CRITERIA1 = '薑餅',
    AC_WINTERVEIL_GOURMET_CRITERIA2 = '蛋奶酒',

    AN_WINTERVEIL_PRESENTS = '他知道你有沒有調皮搗蛋',
	AD_WINTERVEIL_PRESENTS = '待時機許可，在冬幕樹底下拆開一份禮物。',

    AN_WINTERVEIL_SNOWBALL_ALLIANCE = '小氣財神',
	AD_WINTERVEIL_SNOWBALL_ALLIANCE = '在冬幕節時對麥格尼·銅鬚國王丟一顆雪球。',

    AN_WINTERVEIL_SNOWBALL_HORDE = '小氣財神',
	AD_WINTERVEIL_SNOWBALL_HORDE = '在冬幕節時對凱恩·血蹄丟一顆雪球。',

    AN_WINTERVEIL_PVP = '朋友的小助手',
    AD_WINTERVEIL_PVP = '經由冬幕歡樂製造器變身成小助手時，達成50次榮譽擊殺。',

    --VALENTINES
    AN_VALENTINES = 'Liebestoll', --#--#--
	AD_VALENTINES = 'Schließt die unten aufgelisteten Erfolge von \'Liebe liegt in der Luft\' ab.', --#--#--

    AN_VALENTINES_ROSES = 'Sag\'s mit Rosen', --#--#--
    AD_VALENTINES_ROSES = 'Erhaltet während der \'Liebe liegt in der Luft\'-Feierlichkeiten einen roten Rosenstrauß.', --#--#--

    AN_VALENTINES_QUEST = 'Gefährliche Liebschaft', --#--#--
    AD_VALENTINES_QUEST = 'Helft dem Dampfdruckkartell dabei, den Plan der Chemiemanufaktur Krone zu vereiteln.', --#--#--

    AN_VALENTINES_CHOCOLATES = 'Naschkatze', --#--#--
    AD_VALENTINES_CHOCOLATES = 'Probiert die unten aufgelisteten \'Liebe liegt in der Luft\'-Süßigkeiten.', --#--#--
    AC_VALENTINES_CHOCOLATES_CRITERIA1 = '黑暗慾望',
    AC_VALENTINES_CHOCOLATES_CRITERIA2 = '歡恬牛奶',
    AC_VALENTINES_CHOCOLATES_CRITERIA3 = '甜蜜驚喜',
    AC_VALENTINES_CHOCOLATES_CRITERIA4 = '濃郁苺酪',

    AN_VALENTINES_DRESS = 'Das reizende Glück ist auf Eurer Seite', --#--#--
    AD_VALENTINES_DRESS = 'Öffnet einen reizenden Kleiderkarton und erhaltet ein reizendes schwarzes Kleid.', --#--#--

    AN_VALENTINES_PIDO = 'Perma-Pido', --#--#--
    AD_VALENTINES_PIDO = 'Erhaltet ein permanentes Q. Pido-Haustier, indem Ihr einen Echtsilberschaftpfeil erbeutet.', --#--#--

    --LUNAR
    AN_LUNAR = '榮耀長者',
	AD_LUNAR = '完成下列的新年節慶成就。',

    AN_LUNAR_COIN = '一枚先祖硬幣',
    AD_LUNAR_COIN = '獲得一枚先祖硬幣。',

    AN_LUNAR_COINS = '%d枚先祖硬幣',
    AD_LUNAR_COINS = '獲得%d枚先祖硬幣。',

    AN_LUNAR_QUEST = '伊露恩的祝福',
    AD_LUNAR_QUEST = '完成伊露恩的祝福任務並擊敗年獸。',

    AN_LUNAR_CLOTHES = '新年節慶華服',
    AD_LUNAR_CLOTHES = '使用先祖硬幣購買節慶長褲套裝或節慶裙裝。',

    AN_LUNAR_ELDERS_DUNGEONS = '地城中的長者',
    AD_LUNAR_ELDERS_DUNGEONS = '榮耀位於地城中的長者。',
    AC_LUNAR_ELDERS_DUNGEONS_8727 = 'Urahne Fernwisper', --#--#--
    AC_LUNAR_ELDERS_DUNGEONS_8619 = 'Urahne Schwermut', --#--#--
    AC_LUNAR_ELDERS_DUNGEONS_8635 = 'Urahne Splitterfels', --#--#--
    AC_LUNAR_ELDERS_DUNGEONS_8713 = 'Urahne Sternensang', --#--#--
    AC_LUNAR_ELDERS_DUNGEONS_8644 = 'Urahne Steinwehr', --#--#--
    AC_LUNAR_ELDERS_DUNGEONS_8676 = 'Urahne Wildmähne', --#--#--

    AN_LUNAR_ELDERS_HORDE = '部落的長者',
    AD_LUNAR_ELDERS_HORDE = '榮耀位於部落主城中的長者。',
    AC_LUNAR_ELDERS_HORDE_8678 = '雷霆崖的麥蹄長者',
    AC_LUNAR_ELDERS_HORDE_8648 = '幽暗城的暗靈長者',
    AC_LUNAR_ELDERS_HORDE_8677 = '奧格瑪的暗角長者',

    AN_LUNAR_ELDERS_ALLIANCE = '聯盟的長者',
    AD_LUNAR_ELDERS_ALLIANCE = '榮耀位於聯盟主城中的長者。',
    AC_LUNAR_ELDERS_ALLIANCE_8718 = '達納蘇斯的劍捷長者',
    AC_LUNAR_ELDERS_ALLIANCE_8866 = '鐵爐堡的銅鬚長者',
    AC_LUNAR_ELDERS_ALLIANCE_8646 = '暴風城的錘嘯長者',

    AN_LUNAR_ELDERS_EASTERN_KINGDOMS = '東部王國的長者',
    AD_LUNAR_ELDERS_EASTERN_KINGDOMS = '榮耀位於東部王國的長者。',
    AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8636 = '燃燒平原的巨石長者',
    AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8651 = '灼熱峽谷的鐵環長者',
    AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8652 = '布瑞爾的墓生長者',
    AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8674 = '藏寶海灣的冬蹄長者',
    AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8716 = '祖爾格拉布的星林長者',
    AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8643 = '辛特蘭的高峰長者',
    AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8675 = '哨兵嶺的逐星長者',
    AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8649 = '閃金鎮的雷眉長者',
    AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8650 = '聖光之願禮拜堂的雪冠長者',
    AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8642 = '塞爾薩瑪的銀脈長者',
    AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8645 = '瑟伯切爾的黑曜長者',
    AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8722 = '西瘟疫之地的草奔長者',
    AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8647 = '詛咒之地的怒嘯長者',
    AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8653 = '卡拉諾斯的金善長者',
    AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8714 = '通靈學院的月擊長者',
    AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8688 = '東瘟疫之地的風行長者',
    AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8683 = '烈焰峰的晨行長者',

    AN_LUNAR_ELDERS_KALIMDOR = '卡林多的長者',
    AD_LUNAR_ELDERS_KALIMDOR = '榮耀位於卡林多的長者。',
    AC_LUNAR_ELDERS_KALIMDOR_8673 = '血蹄村的血蹄長者',
    AC_LUNAR_ELDERS_KALIMDOR_8723 = '費伍德森林的夜風長者',
    AC_LUNAR_ELDERS_KALIMDOR_8684 = '加基森的夢境先知長者',
    AC_LUNAR_ELDERS_KALIMDOR_8726 = '冬泉谷的銳矛長者',
    AC_LUNAR_ELDERS_KALIMDOR_8725 = '阿斯特蘭納的河歌長者',
    AC_LUNAR_ELDERS_KALIMDOR_8715 = '多蘭納爾的刃葉長者',
    AC_LUNAR_ELDERS_KALIMDOR_8681 = '安戈洛的雷角長者',
    AC_LUNAR_ELDERS_KALIMDOR_8680 = '棘齒城的風之圖騰長者',
    AC_LUNAR_ELDERS_KALIMDOR_8720 = '艾薩拉的天光長者',
    AC_LUNAR_ELDERS_KALIMDOR_8670 = '剃刀嶺的符文圖騰長者',
    AC_LUNAR_ELDERS_KALIMDOR_8672 = '永望鎮的石塔長者',
    AC_LUNAR_ELDERS_KALIMDOR_8686 = '陶拉祖營地的高山長者',
    AC_LUNAR_ELDERS_KALIMDOR_8654 = '希利蘇斯的基石長者',
    AC_LUNAR_ELDERS_KALIMDOR_8671 = '塔納利斯的狂暴圖騰長者',
    AC_LUNAR_ELDERS_KALIMDOR_8724 = '沙漠賽道的晨露長者',
    AC_LUNAR_ELDERS_KALIMDOR_8685 = '厄運之槌的霧行長者',
    AC_LUNAR_ELDERS_KALIMDOR_8721 = '奧伯丁的星織長者',
    AC_LUNAR_ELDERS_KALIMDOR_8717 = '十字路口的月守長者',
    AC_LUNAR_ELDERS_KALIMDOR_8719 = '塞納里奧城堡的刃歌長者',
    AC_LUNAR_ELDERS_KALIMDOR_8682 = '亂風崗的星眼長者',
    AC_LUNAR_ELDERS_KALIMDOR_8679 = '菲拉斯的恐怖圖騰長者',

    --NOBLEGARDEN
    AN_NOBLEGARDEN_CLOTHES = '週日盛裝',
    AD_NOBLEGARDEN_CLOTHES = '在貴族花園節慶中打開明亮的彩蛋，得到白色禮服襯衣和黑色禮服束褲。',
    AC_NOBLEGARDEN_CLOTHES_CRITERIA1 = '白色禮服襯衣',
    AC_NOBLEGARDEN_CLOTHES_CRITERIA2 = '黑色禮服束褲',

    AN_NOBLEGARDEN_DRESS = '盛裝出席',
    AD_NOBLEGARDEN_DRESS = '在貴族花園節慶中打開明亮的彩蛋，得到一件端莊的晚禮服。',

    --CHILDRENS WEEK
    AN_CHILDREN = '為了孩子們',
    AD_CHILDREN = '完成下列的兒童週成就。',
    AR_CHILDREN = '頭銜獎勵:女監護/男監護',

    AN_CHILDREN_PET = '哇喔，很可愛吧?',
    AD_CHILDREN_PET = '獲得一隻兒童週獎勵寵物。',

    AN_CHILDREN_PETS = '老練褓母',
    AD_CHILDREN_PETS = '一個角色同時擁有艾格伯特的蛋、瞌睡蟲韋利、和伊萊克訓練項圈。',
    AC_CHILDREN_PETS1 = '伊萊克訓練項圈',
    AC_CHILDREN_PETS2 = '瞌睡蟲韋利',
    AC_CHILDREN_PETS3 = '艾格伯特的蛋',

    --MIDSUMMER
    AN_MIDSUMMER = '火焰守護者',
    AD_MIDSUMMER = '完成下列的仲夏節成就。',

    AN_MIDSUMMER_QUEST1 = '火焰節慶之王',
    AD_MIDSUMMER_QUEST1 = '從敵人的主城偷取火焰，完成了「小偷的獎勵」任務。',

    AN_MIDSUMMER_AHUNE = '凍死冰霜領主',
    AD_MIDSUMMER_AHUNE = '在奴隸監獄殺死艾胡恩。',

    AN_MIDSUMMER_DESECRATION_HORDE = '褻瀆聯盟',
    AD_MIDSUMMER_DESECRATION_HORDE = '完成了東部王國、卡林多與外域的熄燈號成就。',

    AN_MIDSUMMER_DESECRATION_HORDE_KALIMDOR = '卡林多熄燈號',
    AD_MIDSUMMER_DESECRATION_HORDE_KALIMDOR = '褻瀆卡林多的聯盟營火。',
    AC_MIDSUMMER_DESECRATION_HORDE_KALIMDOR_CRITERIA_11744 = '塵泥沼澤',
    AC_MIDSUMMER_DESECRATION_HORDE_KALIMDOR_CRITERIA_11734 = '梣谷',
    AC_MIDSUMMER_DESECRATION_HORDE_KALIMDOR_CRITERIA_11738 = '血謎島',
    AC_MIDSUMMER_DESECRATION_HORDE_KALIMDOR_CRITERIA_11740 = '黑海岸',
    AC_MIDSUMMER_DESECRATION_HORDE_KALIMDOR_CRITERIA_11746 = '菲拉斯',
    AC_MIDSUMMER_DESECRATION_HORDE_KALIMDOR_CRITERIA_11760 = '希利蘇斯',
    AC_MIDSUMMER_DESECRATION_HORDE_KALIMDOR_CRITERIA_11753 = '泰達希爾',
    AC_MIDSUMMER_DESECRATION_HORDE_KALIMDOR_CRITERIA_11762 = '塔納利斯',
    AC_MIDSUMMER_DESECRATION_HORDE_KALIMDOR_CRITERIA_11741 = '淒涼之地',
    AC_MIDSUMMER_DESECRATION_HORDE_KALIMDOR_CRITERIA_11763 = '冬泉谷',
    AC_MIDSUMMER_DESECRATION_HORDE_KALIMDOR_CRITERIA_11735 = '藍謎島',

    AN_MIDSUMMER_DESECRATION_HORDE_OUTLAND = '外域熄燈號',
    AD_MIDSUMMER_DESECRATION_HORDE_OUTLAND = '褻瀆外域的聯盟營火。',
    AC_MIDSUMMER_DESECRATION_HORDE_OUTLAND_CRITERIA_11736 = '劍刃山脈',
    AC_MIDSUMMER_DESECRATION_HORDE_OUTLAND_CRITERIA_11750 = '納葛蘭',
    AC_MIDSUMMER_DESECRATION_HORDE_OUTLAND_CRITERIA_11759 = '虛空風暴',
    AC_MIDSUMMER_DESECRATION_HORDE_OUTLAND_CRITERIA_11752 = '影月谷',
    AC_MIDSUMMER_DESECRATION_HORDE_OUTLAND_CRITERIA_11754 = '泰洛卡森林',
    AC_MIDSUMMER_DESECRATION_HORDE_OUTLAND_CRITERIA_11758 = '贊格沼澤',
    AC_MIDSUMMER_DESECRATION_HORDE_OUTLAND_CRITERIA_11747 = '地獄火半島',

    AN_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS = '東部王國熄燈號',
    AD_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS = '褻瀆東部王國的聯盟營火。',
    AC_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS_CRITERIA_11751 = '赤脊山',
    AC_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS_CRITERIA_11742 = '丹莫洛',
    AC_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS_CRITERIA_11745 = '艾爾文森林',
    AC_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS_CRITERIA_11749 = '洛克莫丹',
    AC_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS_CRITERIA_11732 = '阿拉希高地',
    AC_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS_CRITERIA_11739 = '燃燒平原',
    AC_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS_CRITERIA_11761 = '荊棘谷',
    AC_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS_CRITERIA_11755 = '辛特蘭',
    AC_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS_CRITERIA_11756 = '西瘟疫之地',
    AC_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS_CRITERIA_11581 = '西部荒野',
    AC_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS_CRITERIA_11748 = '希爾斯布萊德丘陵',
    AC_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS_CRITERIA_11737 = '詛咒之地',
    AC_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS_CRITERIA_11743 = '暮色森林',
    AC_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS_CRITERIA_11757 = '濕地',

    AN_MIDSUMMER_DESECRATION_ALLIANCE = '褻瀆部落',
    AD_MIDSUMMER_DESECRATION_ALLIANCE = '完成了東部王國、卡林多與外域的熄燈號成就。',

    AN_MIDSUMMER_DESECRATION_ALLIANCE_KALIMDOR = '卡林多熄燈號',
    AD_MIDSUMMER_DESECRATION_ALLIANCE_KALIMDOR = '褻瀆卡林多的部落營火。',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_KALIMDOR_CRITERIA_11803 = '冬泉谷',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_KALIMDOR_CRITERIA_11785 = '千針石林',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_KALIMDOR_CRITERIA_11765 = '梣谷',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_KALIMDOR_CRITERIA_11769 = '淒涼之地',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_KALIMDOR_CRITERIA_11773 = '菲拉斯',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_KALIMDOR_CRITERIA_11777 = '莫高雷',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_KALIMDOR_CRITERIA_11800 = '希利蘇斯',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_KALIMDOR_CRITERIA_11780 = '石爪山脈',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_KALIMDOR_CRITERIA_11802 = '塔納利斯',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_KALIMDOR_CRITERIA_11783 = '貧瘠之地',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_KALIMDOR_CRITERIA_11770 = '杜洛塔',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_KALIMDOR_CRITERIA_11771 = '塵泥沼澤',

    AN_MIDSUMMER_DESECRATION_ALLIANCE_OUTLAND = '外域熄燈號',
    AD_MIDSUMMER_DESECRATION_ALLIANCE_OUTLAND = '褻瀆外域的部落營火。',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_OUTLAND_CRITERIA_11767 = '劍刃山脈',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_OUTLAND_CRITERIA_11799 = '虛空風暴',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_OUTLAND_CRITERIA_11782 = '泰洛卡森林',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_OUTLAND_CRITERIA_11775 = '地獄火半島',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_OUTLAND_CRITERIA_11787 = '贊格沼澤',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_OUTLAND_CRITERIA_11778 = '納葛蘭',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_OUTLAND_CRITERIA_11779 = '影月谷',

    AN_MIDSUMMER_DESECRATION_ALLIANCE_EASTERN_KINGDOMS = '東部王國熄燈號',
    AD_MIDSUMMER_DESECRATION_ALLIANCE_EASTERN_KINGDOMS = '褻瀆東部王國的部落營火。',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11766 = '荒蕪之地',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11772 = '永歌森林',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11774 = '鬼魂之地',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11776 = '希爾斯布萊德丘陵',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11768 = '燃燒平原',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11781 = '悲傷沼澤',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11764 = '阿拉希高地',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11580 = '銀松森林',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11801 = '荊棘谷',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11784 = '辛特蘭',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11786 = '提里斯法林地',

    AN_MIDSUMMER_FLAME_KEEPER_HORDE = '艾澤拉斯之火',
    AD_MIDSUMMER_FLAME_KEEPER_HORDE = '完成了東部王國、卡林多與外域的火焰守護者成就。',

    AN_MIDSUMMER_FLAME_KEEPER_HORDE_KALIMDOR = '卡林多火焰守護者',
    AD_MIDSUMMER_FLAME_KEEPER_HORDE_KALIMDOR = '榮耀卡林多的火焰',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_KALIMDOR_CRITERIA_11841 = '梣谷',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_KALIMDOR_CRITERIA_11845 = '淒涼之地',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_KALIMDOR_CRITERIA_11846 = '杜洛塔',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_KALIMDOR_CRITERIA_11847 = '塵泥沼澤',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_KALIMDOR_CRITERIA_11849 = '菲拉斯',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_KALIMDOR_CRITERIA_11852 = '莫高雷',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_KALIMDOR_CRITERIA_11859 = '貧瘠之地',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_KALIMDOR_CRITERIA_11839 = '冬泉谷',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_KALIMDOR_CRITERIA_11836 = '希利蘇斯',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_KALIMDOR_CRITERIA_11856 = '石爪山脈',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_KALIMDOR_CRITERIA_11861 = '千針石林',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_KALIMDOR_CRITERIA_11838 = '塔納利斯',

    AN_MIDSUMMER_FLAME_KEEPER_HORDE_OUTLAND = '外域火焰守護者',
    AD_MIDSUMMER_FLAME_KEEPER_HORDE_OUTLAND = '榮耀外域的火焰',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_OUTLAND_CRITERIA_11851 = '地獄火半島',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_OUTLAND_CRITERIA_11835 = '虛空風暴',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_OUTLAND_CRITERIA_11855 = '影月谷',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_OUTLAND_CRITERIA_11858 = '泰洛卡森林',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_OUTLAND_CRITERIA_11854 = '納葛蘭',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_OUTLAND_CRITERIA_11863 = '贊格沼澤',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_OUTLAND_CRITERIA_11843 = '劍刃山脈',

    AN_MIDSUMMER_FLAME_KEEPER_HORDE_EASTERN_KINGDOMS = '東部王國火焰守護者',
    AD_MIDSUMMER_FLAME_KEEPER_HORDE_EASTERN_KINGDOMS = '榮耀東部王國的火焰',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_EASTERN_KINGDOMS_CRITERIA_11844 = '燃燒平原',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_EASTERN_KINGDOMS_CRITERIA_11840 = '阿拉希高地',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_EASTERN_KINGDOMS_CRITERIA_11584 = '銀松森林',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_EASTERN_KINGDOMS_CRITERIA_11837 = '荊棘谷',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_EASTERN_KINGDOMS_CRITERIA_11860 = '辛特蘭',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_EASTERN_KINGDOMS_CRITERIA_11850 = '鬼魂之地',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_EASTERN_KINGDOMS_CRITERIA_11862 = '提里斯法林地',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_EASTERN_KINGDOMS_CRITERIA_11853 = '希爾斯布萊德丘陵',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_EASTERN_KINGDOMS_CRITERIA_11848 = '永歌森林',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_EASTERN_KINGDOMS_CRITERIA_11857 = '悲傷沼澤',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_EASTERN_KINGDOMS_CRITERIA_11842 = '荒蕪之地',

    AN_MIDSUMMER_FLAME_KEEPER_ALLIANCE = '艾澤拉斯之火',
    AD_MIDSUMMER_FLAME_KEEPER_ALLIANCE = '完成了東部王國、卡林多與外域的火焰看守者成就。',

    AN_MIDSUMMER_FLAME_KEEPER_ALLIANCE_KALIMDOR = '卡林多火焰看守者',
    AD_MIDSUMMER_FLAME_KEEPER_ALLIANCE_KALIMDOR = '榮耀卡林多的火焰',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_KALIMDOR_CRITERIA_11833 = '塔納利斯',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_KALIMDOR_CRITERIA_11805 = '梣谷',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_KALIMDOR_CRITERIA_11809 = '血謎島',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_KALIMDOR_CRITERIA_11812 = '淒涼之地',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_KALIMDOR_CRITERIA_11817 = '菲拉斯',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_KALIMDOR_CRITERIA_11824 = '泰達希爾',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_KALIMDOR_CRITERIA_11806 = '藍謎島',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_KALIMDOR_CRITERIA_11834 = '冬泉谷',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_KALIMDOR_CRITERIA_11831 = '希利蘇斯',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_KALIMDOR_CRITERIA_11815 = '塵泥沼澤',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_KALIMDOR_CRITERIA_11811 = '黑海岸',

    AN_MIDSUMMER_FLAME_KEEPER_ALLIANCE_OUTLAND = '外域火焰看守者',
    AD_MIDSUMMER_FLAME_KEEPER_ALLIANCE_OUTLAND = '榮耀外域的火焰',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_OUTLAND_CRITERIA_11807 = '劍刃山脈',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_OUTLAND_CRITERIA_11830 = '虛空風暴',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_OUTLAND_CRITERIA_11823 = '影月谷',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_OUTLAND_CRITERIA_11829 = '贊格沼澤',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_OUTLAND_CRITERIA_11818 = '地獄火半島',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_OUTLAND_CRITERIA_11821 = '納葛蘭',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_OUTLAND_CRITERIA_11825 = '泰洛卡森林',

    AN_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS = '東部王國火焰看守者',
    AD_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS = '榮耀東部王國的火焰',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11816 = '艾爾文森林',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11810 = '燃燒平原',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11813 = '丹莫洛',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11822 = '赤脊山',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11832 = '荊棘谷',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11826 = '辛特蘭',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11583 = '西部荒野',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11827 = '西瘟疫之地',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11808 = '詛咒之地',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11819 = '希爾斯布萊德丘陵',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11814 = '暮色森林',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11820 = '洛克莫丹',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11804 = '阿拉希高地',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11828 = '濕地',

    --BREWFEST
    AN_BREWFEST = '釀酒大師',
    AD_BREWFEST = '完成下列的啤酒節成就。',
    AR_BREWFEST = '頭銜獎勵:釀酒大師',

    AN_BREWFEST_WOLPERTINGER = '你的鹿角兔還在嗎?',
    AD_BREWFEST_WOLPERTINGER = '獲得一個鹿角兔寵物。',

    AN_BREWFEST_COREN_DIREBREW = '把酒喝光',
    AD_BREWFEST_COREN_DIREBREW = '擊殺寇仁·恐酒。',

    AN_BREWFEST_QUEST1 = '打倒黑鐵',
    AD_BREWFEST_QUEST1 = '防衛啤酒節營地免於黑鐵的攻擊，並完成任務「就這麼一次，在我酒醉的時候…」',

    AN_BREWFEST_BEER_CLUB = '每月啤酒',
    AD_BREWFEST_BEER_CLUB = '加入每月啤酒俱樂部。',

    AN_BREWFEST_MOUNT = '有了桶子，就有樂子',
    AD_BREWFEST_MOUNT = '獲得一隻啤酒節坐騎，或是使用啤酒節蛇麻草轉換你的坐騎為啤酒節坐騎。',

    --LONG TRIP
    AC_WORLDEVENTS_TRIP = '真是一段又長，又奇妙的旅行',
    AD_WORLDEVENTS_TRIP = '完成下列世界事件成就。',

	--BURNING CRUSADE
    AN_DOLCE = '我有「巨無霸」的收納空間',
    AD_DOLCE = '裝備哈瑞斯·皮爾頓的「巨無霸」背包。',

    AN_QUESTS_HELLFIRE_PENINSULA = '來去地獄火',
    AD_QUESTS_HELLFIRE_PENINSULA = '在地獄火半島完成80個任務。',
    TBC_QUEST_10388 = 'Haltet die Brennende Legion auf', --#--#--
    TBC_QUEST_10389 = 'Grausame Pläne', --#--#--
    TBC_QUEST_10876 = 'Die Hand von Kargath', --#--#--
    TBC_QUEST_10258 = '斷脊氏族崗哨',
    TBC_QUEST_9406 = '瑪格哈',
    TBC_QUEST_9370 = '獵鷹哨站',
    TBC_QUEST_10351 = '塞納里奧前哨',

    TBC_QUEST_10397 = 'Haltet die Brennende Legion auf', --#--#--
    TBC_QUEST_10400 = 'Stürzt den Oberanführer', --#--#--
    TBC_QUEST_9545 = 'Die Suche nach Sedai', --#--#--
    TBC_QUEST_10935 = 'Der Exorzismus des Oberst Jules', --#--#--
    TBC_QUEST_10937 = 'Die Züchtigung des Drillmeisters', --#--#--
    TBC_QUEST_9383 = '特爾哈曼神廟',
    TBC_QUEST_10630 = 'Grün, aber kein Orc', --#--#--
    
    AN_QUESTS_ZANGARMASH = '沼澤之謎',
    AD_QUESTS_ZANGARMASH = '在贊格沼澤完成54個任務。',
    TBC_QUEST_9772 = '斯溫派特崗哨',
    TBC_QUEST_9904 = '薩布拉金',
    TBC_QUEST_10118 = 'Die Verteidigung von Zabra\'jin', --#--#--
    TBC_QUEST_9803 = 'Draeneidiplomatie', --#--#--
    TBC_QUEST_9783 = '泰倫多爾',
    TBC_QUEST_9902 = '奧雷伯爾港',
    TBC_QUEST_9709 = 'DIESE Pilze solltet Ihr nicht essen!', --#--#--
    TBC_QUEST_9732 = 'Trockenlegung der Marschen', --#--#--
    TBC_QUEST_9788 = 'Rettung der Sporloks', --#--#--
    TBC_QUEST_9726 = 'Ein Ausflug mit dem Sporlingen', --#--#--
    
    AN_QUESTS_TERROKAR = '泰洛卡大恐慌',
    AD_QUESTS_TERROKAR = '在泰洛卡森林完成63個任務。',
    TBC_QUEST_10879 = 'Offensive aus Skettis', --#--#--
    TBC_QUEST_10881 = '難民商隊',
    TBC_QUEST_10915 = '薩塔營地',
    TBC_QUEST_9951 = 'Das Geheimnis des Aufsehers', --#--#--
    TBC_QUEST_10042 = '艾蘭里堡壘',
    TBC_QUEST_10043 = '碎石堡',
    
    AN_QUESTS_NAGRAND = '納葛蘭滿貫',
    AD_QUESTS_NAGRAND = '在納葛蘭完成75個任務。',
    TBC_QUEST_10172 = 'Geburt eines Kriegshäuptlings', --#--#--
    TBC_QUEST_9977 = '血色競技場',
    TBC_QUEST_9853 = '元素王座',
    TBC_QUEST_9934 = 'Lantresor von der Klinge', --#--#--
    TBC_QUEST_9868 = 'Die Finsterblutzerschlagenen', --#--#--
    TBC_QUEST_9937 = 'Bedrohungen für Nagrand', --#--#--
    TBC_QUEST_9852 = '最後的浴血之戰',
    TBC_QUEST_9925 = 'Begegnung mit den Astralen', --#--#--
    TBC_QUEST_9955 = 'Die Abenteuer von Corki', --#--#--
    TBC_QUEST_9933 = 'Lantresor von der Klinge', --#--#--
    TBC_QUEST_9873 = 'Die Finsterblutzerschlagenen', --#--#--
    TBC_QUEST_10011 = 'Bedrohungen für Nagrand', --#--#--
    
    AN_QUESTS_BLADES_EDGE_MTNS = '刀鋒邊緣',
    AD_QUESTS_BLADES_EDGE_MTNS = '在劍刃山脈完成86個任務。',
    TBC_QUEST_10504 = '希爾瓦納',
    TBC_QUEST_10671 = '托斯利基地',
    TBC_QUEST_10806 = 'Die Gronnbedrohung', --#--#--
    TBC_QUEST_10505 = '雷霆王村',
    TBC_QUEST_10742 = 'Zusammenführung', --#--#--
    TBC_QUEST_10867 = 'Die Mok\'Nathal', --#--#--
    TBC_QUEST_10748 = '魯安曠野',
    
    AN_QUESTS_NETHERSTORM = '深入虛空',
    AD_QUESTS_NETHERSTORM = '在虛空風暴完成120個任務。',
    TBC_QUEST_10409 = 'Socrethar', --#--#--
    TBC_QUEST_10240 = '紫羅蘭之塔',
    TBC_QUEST_10249 = 'Beschützt Area 52!', --#--#--
    TBC_QUEST_10439 = 'Zerstörung des Allesverschlingenden', --#--#--
    TBC_QUEST_10221 = 'Bau der X-52 Netherrakete', --#--#--
    TBC_QUEST_10276 = '聯合團',
    
    AN_QUESTS_SHADOWMOON = '背叛者之影',
    AD_QUESTS_SHADOWMOON = '在影月谷完成90個任務。',
    TBC_QUEST_10744 = 'Nachricht vom Sieg', --#--#--
    TBC_QUEST_11041 = '虛空之翼岩架',
    TBC_QUEST_10645 = 'Der erste Todesritter', --#--#--
    TBC_QUEST_10651 = 'Geliehene Macht', --#--#--
    TBC_QUEST_11052 = 'Akamas Versprechen', --#--#--
    TBC_QUEST_10588 = 'Die Litanei der Verdammnis', --#--#--
    TBC_QUEST_10679 = 'Antidämonenwaffen', --#--#--
    TBC_QUEST_10808 = 'Der Dunkle Rat', --#--#--
	
	AN_HEMET_QUESTS_NAGRAND = '白色伊萊克般的山巒',
	AD_HEMET_QUESTS_NAGRAND = '完成赫米特·奈辛瓦里在納葛蘭的所有任務，包括最後的浴血之戰。',

    HEROIC_NAME_PATTERN = 'Heroisch: %s', --#--#--
    HEROIC_DESCRIPTION_PATTERN = '%s auf dem Schwierigkeitsgrad \'Heroisch\'', --#--#--

    AN_HELLFIRE_RAMPARTS = '地獄火壁壘',
    AD_HELLFIRE_RAMPARTS = '擊敗『無疤者』歐瑪爾。',
    AC_BOSS_17308 = '『無疤者』歐瑪爾',
    AC_BOSS_17537 = '『信使』維斯路登',
	AC_BOSS_17306 = 'Wachhabender Gargolmar', --#--#--

    AN_BLOOD_FURNACE = '血熔爐',
    AD_BLOOD_FURNACE = '擊敗『破壞者』凱利丹。',

    AN_SLAVE_PENS = '奴隸監獄',
    AD_SLAVE_PENS = '擊敗奎克米瑞。',

    AN_UNDERBOG = '深幽泥沼',
    AD_UNDERBOG = '擊敗黑色潛獵者。',

    AN_MANA_TOMBS = '法力墓地',
    AD_MANA_TOMBS = '擊敗奈薩斯王子薩法爾。',

    AN_AUCHENAI_CRYPTS = '奧奇奈地穴',
    AD_AUCHENAI_CRYPTS = '擊敗瑪拉達爾主教。',

    AN_OLD_HILLSBRAD = '逃離敦霍爾德',
    AD_OLD_HILLSBRAD = '擊敗紀元狩獵者。',

    AN_SETHEKK_HALLS = '塞司克大廳',
    AD_SETHEKK_HALLS = '擊敗鷹王伊奇斯。',

    AN_STEAMVAULT = '蒸汽洞窟',
    AD_STEAMVAULT = '擊敗督軍卡利斯瑞。',

    AN_SHADOW_LABYRINTH = '暗影迷宮',
    AD_SHADOW_LABYRINTH = '擊敗莫爾墨。',

    AN_SHATTERED_HALLS = '破碎大廳',
    AD_SHATTERED_HALLS = '擊敗大酋長卡加斯‧刃拳。',

    AN_BLACK_MORASS = '開啟黑暗之門',
    AD_BLACK_MORASS = '擊敗艾奧那斯。',

    AN_BOTANICA = '波塔尼卡',
    AD_BOTANICA = '擊敗扭曲分裂者。',

    AN_MECHANAR = '麥克納爾',
    AD_MECHANAR = '擊敗操縱者帕薩里歐。',

    AN_ARCATRAZ = '亞克崔茲',
    AD_ARCATRAZ = '擊敗先驅者史蓋力司。',
	
	AN_MAGISTERS_TERRACE = '博學者殿堂',
    AD_MAGISTERS_TERRACE = '擊敗凱爾薩斯‧逐日者。',
	
	AN_TBC_DUNGEONS = '外域地城大師',
    AD_TBC_DUNGEONS = '完成下列燃燒的遠征地城成就。',

    AN_TBC_DUNGEONS_HERO = '外域地城英雄',
    AD_TBC_DUNGEONS_HERO = '完成下列燃燒的遠征英雄地城成就。',

    AN_OUTLAND_HERO = 'Held der Scherbenwelt', --#--#--
    AD_OUTLAND_HERO = 'Schließt die unten aufgelisteten Schlachtzugserfolge ab.', --#--#--
    AR_OUTLAND_HERO = 'Held der Scherbenwelt', --#--#--
    
    AN_OUTLAND_GREAT_HERO = 'Großartiger Held der Scherbenwelt', --#--#--
    AD_OUTLAND_GREAT_HERO = 'Schließt die unten aufgelisteten Dungeon- und Schlachtzugserfolge ab.', --#--#--
    AR_OUTLAND_GREAT_HERO = 'Großartiger Held der Scherbenwelt', --#--#--

    AN_RAVEN_LORD = '烏鴉領主韁繩',
    AD_RAVEN_LORD = '從塞司克大廳的安祖手中獲得烏鴉領主韁繩。',

    AN_KARAZHAN = '卡拉贊',
    AD_KARAZHAN = '擊敗卡拉贊中的莫克札王子。',

    AN_GRUUL = '戈魯爾之巢',
    AD_GRUUL = '擊敗戈魯爾之巢中的弒龍者戈魯爾。',

    AN_MAGTHERIDON = '瑪瑟里頓的巢穴',
    AD_MAGTHERIDON = '擊敗瑪瑟里頓的巢穴中的瑪瑟里頓。',
	
	AN_ZULAMAN = '祖阿曼',
	AD_ZULAMAN = '擊敗祖阿曼中的祖爾金。',
	
	AN_SUNWELL = '太陽之井高地',
	AD_SUNWELL = '擊敗太陽之井高地中的基爾加丹。',

    AN_TBC_PHASE_1 = '外域團隊高手',
    AD_TBC_PHASE_1 = '完成下列燃燒的遠征團隊成就。',
    AN_TBC_PHASE_2 = '外域團隊高手',
    AD_TBC_PHASE_2 = '完成下列燃燒的遠征團隊成就。',
    AN_TBC_PHASE_3 = '外域團隊高手',
    AD_TBC_PHASE_3 = '完成下列燃燒的遠征團隊成就。',
	AN_TBC_PHASE_4 = '外域團隊高手',
    AD_TBC_PHASE_4 = '完成下列燃燒的遠征團隊成就。',
	AN_TBC_PHASE_5 = '外域團隊高手',
    AD_TBC_PHASE_5 = '完成下列燃燒的遠征團隊成就。',
	
    FACTION_946 = '榮譽堡',
    FACTION_947 = '索爾瑪',
    FACTION_942 = '塞納里奧遠征隊',
    FACTION_1011 = '陰鬱城',
    FACTION_989 = '時光守望者',
    FACTION_935 = '薩塔',
	FACTION_609 = '塞納里奧議會',

    AN_TBC_DUNGEON_REPUTATIONS = '燃燒十字軍',
    AD_TBC_DUNGEON_REPUTATIONS = '所有燃燒的遠征地城聲望提升至崇拜。',
	
	AN_CENARION_CIRCLE = '塞納留斯守護者',
    AD_CENARION_CIRCLE = '取得塞納里奧議會和塞納里奧遠征隊的聲望崇拜。',

    AN_SHATTRATH_REP = '撒塔斯派系',
    AD_SHATTRATH_REP = '取得占卜者或奧多爾的聲望崇拜。',

    AN_OGRILA = '一天一任務，巨魔不上身',
    AD_OGRILA = '取得歐格利拉的聲望崇拜。',

    AN_SPOREGGAR = '斯博格爾沙皇',
    AD_SPOREGGAR = '取得斯博格爾的聲望崇拜。',

    AN_CONSORTIUM = '首席資深官員',
    AD_CONSORTIUM = '取得聯合團的聲望崇拜。',

    AN_MAGHAR = '德拉諾的瑪格哈',
    AD_MAGHAR = '取得瑪格哈的聲望崇拜。',

    AN_KURENAI = '喔我的天，卡爾奈',
    AD_KURENAI = '取得卡爾奈的聲望崇拜。',

    AN_NETHERWINGS = '在虛空之翼上',
    AD_NETHERWINGS = '取得虛空之翼的聲望崇拜。',

    AN_SKYSHATTERED = '碎天破',
    AD_SKYSHATTERED = '在虛空之翼岩架的龍喉競賽中擊敗碎天者隊長。',

    AN_AMETHYST_EYE = '紫羅蘭之眼',
    AD_AMETHYST_EYE = '取得紫羅蘭之眼的聲望崇拜。',

    AN_SCALE_OF_THE_SANDS = '流沙之鱗',
    AD_SCALE_OF_THE_SANDS = '取得流沙之鱗的聲望崇拜。',

    AN_ASHTONGUE_DEATHSWORN = '死亡誓言者的誓徒',
    AD_ASHTONGUE_DEATHSWORN = '取得灰舌死亡誓言者的聲望崇拜。',

    AN_SHATTERED_SUN = '你的進攻真猛烈',
    AD_SHATTERED_SUN = '取得破碎之日進攻部隊的聲望崇拜。',

    AN_SKYGUARD = '飛越司凱堤斯',
    AD_SKYGUARD = '取得薩塔禦天者的聲望崇拜。',

    AN_HIPPOGRYPH = '塞納里奧戰爭角鷹獸',
    AD_HIPPOGRYPH = '從贊格沼澤的塞納里奧遠征隊處獲得塞納里奧戰爭角鷹獸。',

    AN_DIPLOMAT = '外交官',
    AD_DIPLOMAT_ALLIANCE = '你的木喉要塞、斯博格爾與卡爾奈聲望提升至崇拜。',
    AD_DIPLOMAT_HORDE = '你的木喉要塞、斯博格爾與瑪格哈聲望提升至崇拜。',
    AC_DIPLOMAT_576 = '木喉要塞崇拜',
    AC_DIPLOMAT_970 = '斯博格爾崇拜',
    AC_DIPLOMAT_978 = '卡爾奈崇拜',
    AC_DIPLOMAT_941 = '瑪格哈崇拜',

    AN_MR_PINCHY = 'Dr. Zwicky!', --#--#--
    AD_MR_PINCHY = 'Angelt Dr. Zwicky in der Scherbenwelt.', --#--#--

    AN_FISHING_BOOK = '魚兒不會留下足跡',
    AD_FISHING_BOOK = '學到如何尋找魚類',

    AN_ACCOMPLISHED_ANGLER = '熟練釣手',
    AD_ACCOMPLISHED_ANGLER = '完成下列的釣魚成就。',

    AN_TBC_DAILY_FISH = '老人巴洛認可',
    AD_TBC_DAILY_FISH = '完成下列表中老人巴洛的5個釣魚每日任務。',
    AC_TBC_DAILY_FISH1 = '城裡的鱷魚',
    AC_TBC_DAILY_FISH2 = '魚餌強盜',
    AC_TBC_DAILY_FISH3 = '魔化之血肉片',
    AC_TBC_DAILY_FISH4 = '逃脫的傢伙',
    AC_TBC_DAILY_FISH5 = '抓蝦子一點都不簡單',

    AN_OLD_IRONJAW = '老鐵顎',
    AD_OLD_IRONJAW = '在鐵爐堡釣起老鐵顎。',

    AN_OLD_CRAFTY = '老奸',
    AD_OLD_CRAFTY = '在奧格瑪釣到老奸。',

    AN_FISHING_DIPLOMAT = '垂釣外交官',
    AD_FISHING_DIPLOMAT = '在奧格瑪與暴風城釣到一條魚。',
    AC_FISHING_DIPLOMAT1 = '奧格瑪',
    AC_FISHING_DIPLOMAT2 = '暴風城',

    AN_CAPTAIN_RUMSEY = '蘭姆西船長的淡啤酒',
    AD_CAPTAIN_RUMSEY = '釀造一些蘭姆西船長的淡啤酒。',

    AN_SECOND_RING = 'Der Andere Ring', --#--#--
    AD_SECOND_RING = 'Erhaltet den Anderen Ring aus einem Sack voll geangelter Schätze.', --#--#--

    AN_TBC_DAILY_COOKING = '型男大主廚',
    AD_TBC_DAILY_COOKING = '完成下列表中洛克的4個烹飪每日任務。',
    AC_TBC_DAILY_COOKING1 = '美味法力',
    AC_TBC_DAILY_COOKING2 = '靈魂之湯',
    AC_TBC_DAILY_COOKING3 = '美味的復仇',
    AC_TBC_DAILY_COOKING4 = '超燙的燉肉',

    AN_TBC_COOKING_RECIPES = '外域美食家',
    AD_TBC_COOKING_RECIPES = '烹煮以下每種外域烹飪食譜。',

    AN_HAIL_CHEF = '主廚萬歲',
    AD_HAIL_CHEF = '完成下列的烹飪成就。',

    AN_EXPLORE_OUTLAND = '探索外域',
    AD_EXPLORE_OUTLAND = '探索外域所有區域。',

    AN_MIDDLE_RARE = '中等稀少',
    AD_MIDDLE_RARE = '擊殺一隻下面列出的外域極稀有生物。',
    AN_BLOODY_RARE = '超級稀少',
    AD_BLOODY_RARE = '擊殺所有下面列出的外域極稀有生物。',
    TBC_NPC_18695 = '傑瑞卡大使',
    TBC_NPC_18682 = '泥沼潛伏者',
    TBC_NPC_18697 = '首席工程師羅桑德',
    TBC_NPC_18681 = '盤牙特使',
    TBC_NPC_18694 = '『扭曲監視者』克里達斯',
    TBC_NPC_18689 = '殘廢者',
    TBC_NPC_18686 = '末日預言者裘瑞姆',
    TBC_NPC_18698 = '恆核懲戒者',
    TBC_NPC_18678 = '飽食者',
    TBC_NPC_17144 = '鋒牙',
    TBC_NPC_18692 = '赫瑪西恩',
    TBC_NPC_18696 = '克拉特',
    TBC_NPC_18680 = '瑪堤卡',
    TBC_NPC_18677 = '狂野的米克索格',
    TBC_NPC_18690 = '崩碎者',
    TBC_NPC_20932 = '努拉莫克',
    TBC_NPC_18685 = '歐克瑞克',
    TBC_NPC_18693 = '首長瑪庫隆',
    TBC_NPC_18683 = '虛無獵人亞爾',
    TBC_NPC_18679 = '弗拉肯‧厄語者',

    AN_PREPATCH_QUEST = 'Auf in den Kampf!', --#--#--
    AD_PREPATCH_QUEST = 'Hat am Kampf um das Dunkle Portal teilgenommen. Träger des Wappenrock des Beschützers.', --#--#--

    AN_RIDING_75 = '駕駕!',
    AD_RIDING_75 = '學習初級騎術。',
    AN_RIDING_150 = '玩命關頭',
    AD_RIDING_150 = '學習中級騎術。',
    AN_RIDING_225 = '駭速快手',
    AD_RIDING_225 = '學習高級騎術。',
    AN_RIDING_300 = '終極殺陣',
    AD_RIDING_300 = '學習專家級騎術。',

    AN_ATTUNE_SHATTERED_HALLS = 'Heißer als die Hölle', --#--#--
    AD_ATTUNE_SHATTERED_HALLS = 'Erhaltet den Schlüssel zu den Zerschmetterten Hallen.', --#--#--
    AN_ATTUNE_ARCATRAZ = '闖入亞克崔茲的方法',
    AD_ATTUNE_ARCATRAZ = 'Erhaltet den Schlüssel zur Arkatraz.', --#--#--
    AN_ATTUNE_KARAZHAN = '大師之觸',
    AD_ATTUNE_KARAZHAN = 'Erhaltet den Schlüssel des Meisters.', --#--#--
    AN_ATTUNE_NIGHT_BANE = 'Die Vergangenheit aufwühlen', --#--#--
    AD_ATTUNE_NIGHT_BANE = 'Erhaltet die Geschwärzte Urne und bezwingt den Schrecken der Nacht in Karazhan.', --#--#--
    AN_ATTUNE_SSC = '卡德許的鬥棍',
    AD_ATTUNE_SSC = 'Erhaltet Zugang zur Höhle des Schlangenschreins.', --#--#--
    AN_ATTUNE_EYE = 'Der Schlüssel der Stürme', --#--#--
    AD_ATTUNE_EYE = 'Erhaltet den Schlüssel der Stürme.', --#--#--
    AN_ATTUNE_HYJAL = '永恆之瓶',
    AD_ATTUNE_HYJAL = 'Erhaltet Zugang zur Schlacht um den Berg Hyjal.', --#--#--
    AN_ATTUNE_BLACK_TEMPLE = '幫阿卡瑪製造機會',
    AD_ATTUNE_BLACK_TEMPLE = 'Erhaltet das Medaillon von Karabor.', --#--#--

    AN_SSC = '毒蛇神殿洞穴',
    AD_SSC = '擊敗毒蛇神殿洞穴中的瓦許女士。',
    AC_KILL_HYDROS = 'Hydross der Unstete', --#--#--
    AC_KILL_LURKER = '海上潛伏者',
    AC_KILL_LEOTHERAS = 'Leotheras der Blinde', --#--#--
    AC_KILL_KARATHRESS = 'Tiefenlord Karathress', --#--#--
    AC_KILL_MOROGRIM = 'Morogrim Gezeitenwandler', --#--#--
    AC_KILL_VASHJ = '瓦許女士',
    AN_TK = '風暴要塞',
    AD_TK = '擊敗風暴要塞中的凱爾薩斯‧逐日者。',
    AC_KILL_ALAR = 'Al\'ar', --#--#--
    AC_KILL_VOID_REAVER = 'Leerhäscher', --#--#--
    AC_KILL_SOLARIAN = 'Hochastromantin Solarian', --#--#--
    AC_KILL_KAELTHAS = '凱爾薩斯‧逐日者',

    AN_HYJAL = '海加爾山戰場',
    AD_HYJAL = '擊敗海加爾山戰役中的阿克蒙德。',

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
    AC_KILL_ILLIDAN = '伊利丹‧怒風',

    AN_BLACK_TEMPLE = '黑暗神廟',
    AD_BLACK_TEMPLE = '擊敗黑暗神廟中的伊利丹‧怒風。',
    AR_BLACK_TEMPLE = 'Bezwinger des Schwarzen Tempels', --#--#--

    AN_ARENA_FIRST_WIN = '跨入競技場',
    AD_ARENA_FIRST_WIN = '在等級70的競技場積分賽中獲勝。',
    AN_ARENA_WIN1 = '無情獻身',
    AD_ARENA_WIN1 = '在等級70的競技場積分賽中獲得100場勝利。',
    AN_ARENA_WIN2 = '復仇獻身',
    AD_ARENA_WIN2 = '在等級70的競技場積分賽中獲得200場勝利。',
    AN_ARENA_WIN3 = '野蠻獻身',
    AD_ARENA_WIN3 = '在等級70的競技場積分賽中獲得300場勝利。',

    AN_ARENA_TITLE1 = '鬥士',
    AN_ARENA_TITLE2 = '決鬥者',
    AN_ARENA_TITLE3 = '競爭者',
    AN_ARENA_TITLE4 = '挑戰者',

    AN_ARENA_GLADIATOR = '鬥士',
    AD_ARENA_GLADIATOR = '70級時在一季競技場期間贏得鬥士頭銜。',
    AN_ARENA_DUELIST = '決鬥者',
    AD_ARENA_DUELIST = '70級時在一季競技場期間贏得決鬥者頭銜。',
    AN_ARENA_RIVAL = '競爭者',
    AD_ARENA_RIVAL = '70級時在一季競技場期間贏得競爭者頭銜。',
    AN_ARENA_CHALLENGER = '挑戰者',
    AD_ARENA_CHALLENGER = '70級時在一季競技場期間贏得挑戰者頭銜。',

    AN_ARENA_2_1550 = '只有我倆:1550',
    AD_ARENA_2_1550 = '在等級70的2v2競技場賽程中獲得1550點個人積分。',
    AN_ARENA_2_1750 = '只有我倆:1750',
    AD_ARENA_2_1750 = '在等級70的2v2競技場賽程中獲得1750點個人積分。',
    AN_ARENA_2_2000 = '只有我倆:2000',
    AD_ARENA_2_2000 = '在等級70的2v2競技場賽程中獲得2000點個人積分。',
    AN_ARENA_2_2200 = '只有我倆:2200',
    AD_ARENA_2_2200 = '在等級70的2v2競技場賽程中獲得2200點個人積分。',

    AN_ARENA_3_1550 = '三人成行:1550',
    AD_ARENA_3_1550 = '在等級70的3v3競技場賽程中獲得1550點個人積分。',
    AN_ARENA_3_1750 = '三人成行:1750',
    AD_ARENA_3_1750 = '在等級70的3v3競技場賽程中獲得1750點個人積分。',
    AN_ARENA_3_2000 = '三人成行:2000',
    AD_ARENA_3_2000 = '在等級70的3v3競技場賽程中獲得2000點個人積分。',
    AN_ARENA_3_2200 = '三人成行:2200',
    AD_ARENA_3_2200 = '在等級70的3v3競技場賽程中獲得2200點個人積分。',

    AN_ARENA_5_1550 = '五強聚首:1550',
    AD_ARENA_5_1550 = '在等級70的5v5競技場賽程中獲得1550點個人積分。',
    AN_ARENA_5_1750 = '五強聚首:1750',
    AD_ARENA_5_1750 = '在等級70的5v5競技場賽程中獲得1750點個人積分。',
    AN_ARENA_5_2000 = '五強聚首:2000',
    AD_ARENA_5_2000 = '在等級70的5v5競技場賽程中獲得2000點個人積分。',
    AN_ARENA_5_2200 = '五強聚首:2200',
    AD_ARENA_5_2200 = '在等級70的5v5競技場賽程中獲得2200點個人積分。',

    AN_ARENA_STREAK = '熱門連勝',
    AD_ARENA_STREAK = '在等級70的積分賽中連勝十場。',

    AN_ARENA_HOTSTREAK = '大熱門連勝',
    AD_ARENA_HOTSTREAK = '在等級70的積分1800以上積分賽連勝十場。',

    AN_ARENA_LASTMAN = '最後存活者',
    AD_ARENA_LASTMAN = '成為等級70的5v5積分賽終場的唯一倖存者。',

    AN_ARENA_MAPS = '寰宇贏家',
    AD_ARENA_MAPS = '在等級70的劍刃競技場、納葛蘭競技場、達拉然下水道以及羅德隆廢墟各獲得一場積分賽勝利。',
    AC_ARENA_MAPS1 = '劍刃競技場',
    AC_ARENA_MAPS2 = '納葛蘭競技場',
    AC_ARENA_MAPS3 = '羅德隆廢墟',

    AN_ARENA_MASTER = '競技場大師',
    AD_ARENA_MASTER = '完成下列的競技場成就。',

    AN_AZZINOTH = '埃辛諾斯戰刃',
    AD_AZZINOTH = '埃辛諾斯戰刃組的持有者。',
	AN_THORIDAL = '索瑞達爾，眾星之怒',
    AD_THORIDAL = '索瑞達爾，眾星之怒的持有者。',
    AC_OBTAIN_MAINHAND_AZZINOTH = 'Rechte Kriegsgleve von Azzinoth', --#--#--
    AC_OBTAIN_OFFHAND_AZZINOTH = 'Linke Kriegsgleve von Azzinoth', --#--#--
	AN_BEAR_MOUNT = '阿曼尼戰熊',
    AD_BEAR_MOUNT = '阿曼尼戰熊的擁有者。',
	AN_HAWK_MOUNT = '迅捷白色陸行鷹',
    AD_HAWK_MOUNT = '從博學者殿堂的凱爾薩斯‧逐日者手中獲得迅捷白色陸行鷹。',
	AN_ALAR_MOUNT = '歐爾灰燼',
    AD_ALAR_MOUNT = '從風暴要塞的凱爾薩斯‧逐日者手中獲得歐爾灰燼。',
	AN_HORSEMAN_MOUNT = '無頭騎士韁繩',
	AD_HORSEMAN_MOUNT = '在萬鬼節期間，於血色修道院中無頭騎士的手上得到無頭騎士韁繩。',
	AN_HERO_SHATTRATH = '撒塔斯的英雄',
	AD_HERO_SHATTRATH = '在占卜者與奧多爾的聲望中獲得過崇拜。',
	AN_HERO_SCRYER = '占卜者',
	AN_HERO_ALDOR = '奧多爾',
	AN_CHAMPION_NAARU = '那魯的勇士',
	AD_CHAMPION_NAARU = '取得「那魯的勇士」頭銜。',
	AR_CHAMPION_NAARU = '那魯的勇士',
	AN_HAND_ADAL = '阿達歐之手',
	AD_HAND_ADAL = '取得「阿達歐之手」頭銜。',

    AN_P3_FIRST_WEEK = 'Eroberer der Scherbenwelt', --#--#--
    AD_P3_FIRST_WEEK = 'Bezwingt Archimonde und Illidan Sturmgrimm in der ersten Woche von Phase 3.', --#--#--
    AC_KILL_ARCHIMONDE = '阿克蒙德',
    AR_P3_FIRST_WEEK = 'Eroberer der Scherbenwelt', --#--#--
	
	AN_FLIGHFORM = '迅捷飛行形態',
	AD_FLIGHFORM = '完成德魯伊的迅捷飛行形態任務。',

    AN_KRUUL = '...nicht noch ein Dämonenlord!', --#--#--
	AD_KRUUL = 'Bezwingt Hochlord Kruul während des Kampfes um das Dunkle Portal.', --#--#--

    AN_ATTUMEN_MOUNT = '熾炎戰馬韁繩',
	AD_ATTUMEN_MOUNT = '從卡拉贊的獵人阿圖曼手中獲得熾炎戰馬韁繩。',

    -- Built-in title catalog: labels and grammatical name placement.
    TITLE_BUILTIN_EXPLORER_LABEL = '征服者',
    TITLE_BUILTIN_EXPLORER_FORMAT_MALE = '征服者 %s',
    TITLE_BUILTIN_EXPLORER_FORMAT_FEMALE = '征服者 %s',
    TITLE_BUILTIN_BATTLEMASTER_LABEL = '戰鬥大師',
    TITLE_BUILTIN_BATTLEMASTER_FORMAT_MALE = '戰鬥大師 %s',
    TITLE_BUILTIN_BATTLEMASTER_FORMAT_FEMALE = '戰鬥大師 %s',
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
    TITLE_BUILTIN_JENKINS_LABEL = '炸雞勇者',
    TITLE_BUILTIN_JENKINS_FORMAT_MALE = '炸雞勇者 %s',
    TITLE_BUILTIN_JENKINS_FORMAT_FEMALE = '炸雞勇者 %s',
    TITLE_BUILTIN_AZEROTHS_GREATEST_ANGLER_LABEL = 'Größter Angler von Azeroth', --#--#--
    TITLE_BUILTIN_AZEROTHS_GREATEST_ANGLER_FORMAT_MALE = '%s, der größte Angler von Azeroth', --#--#--
    TITLE_BUILTIN_AZEROTHS_GREATEST_ANGLER_FORMAT_FEMALE = '%s, die größte Anglerin von Azeroth', --#--#--
    TITLE_BUILTIN_CHEF_LABEL = '大廚',
    TITLE_BUILTIN_CHEF_FORMAT_MALE = '大廚 %s',
    TITLE_BUILTIN_CHEF_FORMAT_FEMALE = '大廚 %s',
    TITLE_BUILTIN_THE_EXALTED_LABEL = 'Der Ehrfurchtgebietende', --#--#--
    TITLE_BUILTIN_THE_EXALTED_FORMAT_MALE = '%s der Ehrfurchtgebietende', --#--#--
    TITLE_BUILTIN_THE_EXALTED_FORMAT_FEMALE = '%s die Ehrfurchtgebietende', --#--#--
    TITLE_BUILTIN_BLOODSAIL_ADMIRAL_LABEL = '血帆上將',
    TITLE_BUILTIN_BLOODSAIL_ADMIRAL_FORMAT_MALE = '血帆上將 %s',
    TITLE_BUILTIN_BLOODSAIL_ADMIRAL_FORMAT_FEMALE = '血帆上將 %s',
    TITLE_BUILTIN_THE_HALLOWED_LABEL = '『萬鬼』',
    TITLE_BUILTIN_THE_HALLOWED_FORMAT_MALE = '『萬鬼』%s',
    TITLE_BUILTIN_THE_HALLOWED_FORMAT_FEMALE = '『萬鬼』%s',
    TITLE_BUILTIN_MERRYMAKER_LABEL = '狂歡客',
    TITLE_BUILTIN_MERRYMAKER_FORMAT_MALE = '狂歡客 %s',
    TITLE_BUILTIN_MERRYMAKER_FORMAT_FEMALE = '狂歡客 %s',
    TITLE_BUILTIN_THE_LOVE_FOOL_LABEL = 'Liebesgott', --#--#--
    TITLE_BUILTIN_THE_LOVE_FOOL_FORMAT_MALE = '%s, Liebesgott', --#--#--
    TITLE_BUILTIN_THE_LOVE_FOOL_FORMAT_FEMALE = '%s, Liebesgöttin', --#--#--
    TITLE_BUILTIN_ELDER_LABEL = '決鬥者',
    TITLE_BUILTIN_ELDER_FORMAT_MALE = '決鬥者 %s',
    TITLE_BUILTIN_ELDER_FORMAT_FEMALE = '決鬥者 %s',
    TITLE_BUILTIN_PATRON_LABEL = '男監護',
    TITLE_BUILTIN_PATRON_FORMAT_MALE = '男監護 %s',
    TITLE_BUILTIN_PATRON_FORMAT_FEMALE = '女監護 %s',
    TITLE_BUILTIN_FLAME_KEEPER_LABEL = '挑戰者',
    TITLE_BUILTIN_FLAME_KEEPER_FORMAT_MALE = '挑戰者 %s',
    TITLE_BUILTIN_FLAME_KEEPER_FORMAT_FEMALE = '挑戰者 %s',
    TITLE_BUILTIN_THE_LOREMASTER_LABEL = '博學大師',
    TITLE_BUILTIN_THE_LOREMASTER_FORMAT_MALE = '博學大師 %s',
    TITLE_BUILTIN_THE_LOREMASTER_FORMAT_FEMALE = '博學大師 %s',
    TITLE_BUILTIN_CONQUEROR_BLACK_TEMPLE_LABEL = 'Bezwinger des Schwarzen Tempels', --#--#--
    TITLE_BUILTIN_CONQUEROR_BLACK_TEMPLE_FORMAT_MALE = '%s, Bezwinger des Schwarzen Tempels', --#--#--
    TITLE_BUILTIN_CONQUEROR_BLACK_TEMPLE_FORMAT_FEMALE = '%s, Bezwingerin des Schwarzen Tempels', --#--#--
    TITLE_BUILTIN_CONQUEROR_OF_OUTLAND_LABEL = 'Eroberer der Scherbenwelt', --#--#--
    TITLE_BUILTIN_CONQUEROR_OF_OUTLAND_FORMAT_MALE = '%s, Eroberer der Scherbenwelt', --#--#--
    TITLE_BUILTIN_CONQUEROR_OF_OUTLAND_FORMAT_FEMALE = '%s, Eroberin der Scherbenwelt', --#--#--
    TITLE_BUILTIN_CHAMPION_OF_THE_NAARU_LABEL = '那魯的勇士',
    TITLE_BUILTIN_CHAMPION_OF_THE_NAARU_FORMAT_MALE = 'Champion der Naaru %s', --#--#--
    TITLE_BUILTIN_CHAMPION_OF_THE_NAARU_FORMAT_FEMALE = 'Champion der Naaru %s', --#--#--
    TITLE_BUILTIN_HAND_OF_ADAL_LABEL = '阿達歐之手',
    TITLE_BUILTIN_HAND_OF_ADAL_FORMAT_MALE = 'Hand von A\'dal %s', --#--#--
    TITLE_BUILTIN_HAND_OF_ADAL_FORMAT_FEMALE = 'Hand von A\'dal %s', --#--#--
    TITLE_BUILTIN_HERO_OF_OUTLAND_LABEL = 'Held der Scherbenwelt', --#--#--
    TITLE_BUILTIN_HERO_OF_OUTLAND_FORMAT_MALE = 'Held der Scherbenwelt %s', --#--#--
    TITLE_BUILTIN_HERO_OF_OUTLAND_FORMAT_FEMALE = 'Heldin der Scherbenwelt %s', --#--#--
    TITLE_BUILTIN_GREAT_HERO_OF_OUTLAND_LABEL = 'Großartiger Held der Scherbenwelt', --#--#--
    TITLE_BUILTIN_GREAT_HERO_OF_OUTLAND_FORMAT_MALE = 'Großartiger Held der Scherbenwelt %s', --#--#--
    TITLE_BUILTIN_GREAT_HERO_OF_OUTLAND_FORMAT_FEMALE = 'Großartige Heldin der Scherbenwelt %s', --#--#--
    TITLE_BUILTIN_BREWMASTER_LABEL = '釀酒大師',
    TITLE_BUILTIN_BREWMASTER_FORMAT_MALE = '釀酒大師 %s',
    TITLE_BUILTIN_BREWMASTER_FORMAT_FEMALE = '釀酒大師 %s',
    -- End built-in title catalog
}

SexyLib:InitLocalization('Anniversary Achievements', L)
