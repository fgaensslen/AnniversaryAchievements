local _, ns = ...
if not (ns and ns.IsTBCAnniversary) then return end

if GetLocale() ~= 'ruRU' then return end

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

    GEAR_SLOT_HEAD = 'Голова',
    GEAR_SLOT_NECK = 'Шея',
    GEAR_SLOT_SHOULDER = 'Плечо',
    GEAR_SLOT_CHEST = 'Грудь',
    GEAR_SLOT_WAIST = 'Пояс',
    GEAR_SLOT_LEGS = 'Ноги',
    GEAR_SLOT_FEET = 'Ступни',
    GEAR_SLOT_WRIST = 'Запястья',
    GEAR_SLOT_HANDS = 'Кисти рук',
    GEAR_SLOT_FIRST_RING = 'Кольцо на правой руке',
    GEAR_SLOT_SECOND_RING = 'Кольцо на левой руке',
    GEAR_SLOT_FIRST_TRINKET = 'Первый аксессуар',
    GEAR_SLOT_SECOND_TRINKET = 'Второй аксессуар',
    GEAR_SLOT_CLOAK = 'Плащ',
    GEAR_SLOT_WEAPON = 'Оружие',

    NPC_3444 = 'Grubenratte', --#--#--
    NPC_620 = 'Курица',
    NPC_1420 = 'Жаба',
    NPC_13321 = 'Лягушка',
    NPC_2620 = 'Луговая собачка',
    NPC_9600 = 'Попугай',
    NPC_883 = 'Олень',
    NPC_9699 = 'Огненный жук',
    NPC_4953 = 'Щитомордник',
    NPC_721 = 'Кролик',
    NPC_9700 = 'Лавовый краб',
    NPC_15476 = 'Скорпион',
    NPC_2914 = 'Змея',
    NPC_16030 = 'Червячок',
    NPC_4075 = 'Крыса',
    NPC_1412 = 'Белка',
    NPC_7390 = 'Nymphensittich', --#--#--
    NPC_15475 = 'Käfer', --#--#--
    NPC_15010 = 'Dschungelkröte', --#--#--
    NPC_4076 = 'Таракан',
    NPC_13016 = 'Untergrundratte', --#--#--
    NPC_14881 = 'Паук',
    NPC_2110 = 'Schwarze Ratte', --#--#--
    NPC_4166 = 'Газель',
    NPC_1933 = 'Овца',
    NPC_890 = 'Олененок',
    NPC_2098 = 'Баран',
    NPC_2442 = 'Корова',
    NPC_6368 = 'Кошка',
    NPC_6271 = 'Мышь',
    NPC_385 = 'Pferd', --#--#--
    NPC_10685 = 'Свинья',
    NPC_3300 = 'Аспид',
    NPC_15065 = 'Lady', --#--#--
    NPC_15066 = 'Cleo', --#--#--
    NPC_15071 = 'Schleicherpfote', --#--#--
    NPC_15072 = 'Spike', --#--#--

    CATEGORY_GENERAL = 'Общее',
    CATEGORY_QUESTS = 'Задания',
	CATEGORY_PVP = 'PvP',
    CATEGORY_KALIMDOR = 'Калимдор',
    CATEGORY_EASTERN_KINGDOMS = 'Восточные королевства',
    CATEGORY_OUTLAND = 'Запределье',
    CATEGORY_VANILLA = 'World of Warcraft',
    CATEGORY_TBC = 'The Burning Crusade',
    CATEGORY_EXPLORATION = 'Исследование',
    CATEGORY_PVE = 'Подземелья и рейды',
    CATEGORY_ARENA = 'Арена',
    CATEGORY_BG_ALTERAC = 'Альтеракская долина',
    CATEGORY_BG_WARSONG = 'Ущелье Песни Войны',
    CATEGORY_BG_ARATHI = 'Низина Арати',
    CATEGORY_BG_EYE = 'Око Бури',
    CATEGORY_PROFESSIONS = 'Профессии',
    CATEGORY_REPUTATION = 'Репутация',
	CATEGORY_EVENTS = 'Игровые события',
    CATEGORY_VALENTINES = 'Любовная лихорадка',
    CATEGORY_LUNAR = 'Лунный фестиваль',
    CATEGORY_NOBLEGARDEN = 'Сад чудес',
    CATEGORY_CHILDREN = 'Детская неделя',
    CATEGORY_MIDSUMMER = 'Огненный солнцеворот',
    CATEGORY_BREWFEST = 'Хмельной фестиваль',
    CATEGORY_HALLOWSEND = 'Тыквовин',
    CATEGORY_WINTERVEIL = 'Зимний Покров',
    CATEGORY_FEATS_OF_STRENGTH = 'Великие подвиги',
	
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
	AN_WARLOCK_T2 = 'Одеяния возмездия',
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

    AN_LVL = '%d-й уровень',
    AD_LVL = 'Достигните %d-го уровня.',

    AN_BANK = 'Банковская ячейка',
    AD_BANK = 'Купите 7 дополнительных ячеек в банке.',
    AC_BANK = 'Купите 7 дополнительных ячеек в банке.',

    AN_QUESTS = '%dзаданий',
    AD_QUESTS = 'Выполните %dзаданий.',
    AC_QUESTS = 'Schließt %d Quests ab.', --#--#--

    AN_DAILY_QUESTS = '%d tägliche Quests abgeschlossen', --#--#--
    AD_DAILY_QUESTS = 'Выполните %dежедневных заданий.',
    AC_DAILY_QUESTS = 'Schließt %d tägliche Quests ab.', --#--#--

    AN_QUEST_GOLD5 = 'Glitzernde Belohnung', --#--#--
    AN_QUEST_GOLD10 = 'Sammler geprägter Münzen', --#--#--
    AN_QUEST_GOLD25 = 'Täglich Brot', --#--#--
    AN_QUEST_GOLD50 = 'Wohlverdientes Gold', --#--#--
    AN_QUEST_GOLD100 = 'Verdient durch Schweiß und Blut', --#--#--
    AN_QUEST_GOLD250 = 'Golddrucker', --#--#--
    AN_QUEST_GOLD500 = 'Angemessene Entlohnung', --#--#--
    AD_QUEST_GOLD = 'Заработайте %dзолота за выполнение заданий.',
    AC_QUEST_GOLD = 'Erhaltet %d Gold durch Questbelohnungen.', --#--#--

    AN_QUESTS_ZONE = 'Хранитель мудрости %s',
    AD_QUESTS_ZONE = 'Schließt die Quest "%s" in %s ab.', --#--#--
    AD_QUESTS_ZONE_MULTI = 'Schließt die folgenden Quests in %s ab.', --#--#--
    AC_QUESTS_ZONE = 'Schließt die Quest "%s" ab.', --#--#--

    AZSHARA_1 = 'Азшара',
    AZSHARA_2 = 'Азшара',
    QUEST_3602 = 'Azsharit', --#--#--

    FELWOOD_1 = 'Оскверненный лес',
    FELWOOD_2 = 'Оскверненный лес',
    QUEST_5165 = 'Übergießen der Flammen des Schutzes', --#--#--
    QUEST_5385 = 'Die Überreste von Trey Lichtschmied', --#--#--

    DESOLACE_1 = 'Пустоши',
    DESOLACE_2 = 'Пустоши',
    QUEST_6027 = 'Buch der Uralten', --#--#--

    DUSTWALLOW_1 = 'Пылевые топи',
    DUSTWALLOW_2 = 'Пылевые топи',
    QUEST_1203 = 'Jarl braucht eine Klinge', --#--#--

    SILITHUS_1 = 'Силитус',
    SILITHUS_2 = 'Силитус',
    QUEST_8287 = 'Ein teuflischer Plan', --#--#--
    QUEST_8352 = 'Szepter des Rates', --#--#--
    QUEST_8321 = 'Vyral der Üble', --#--#--
    QUEST_8281 = 'Verstärkte Sicherheit', --#--#--

    DUROTAR_1 = 'Дуротар',
    DUROTAR_2 = 'Дуротар',
    QUEST_835 = 'Sicherung der Linien', --#--#--

    BARRENS_1 = 'Степи',
    BARRENS_2 = 'Степи',
    QUEST_888 = 'Gestohlene Beute', --#--#--
    QUEST_902 = 'Samophlang', --#--#--

    WINTERSPRING_1 = 'Зимние Ключи',
    WINTERSPRING_2 = 'Зимние Ключи',
    QUEST_975 = 'Behälter von Mau\'ari', --#--#--
    QUEST_5082 = 'Bedrohung durch die Winterfelle', --#--#--
    QUEST_5121 = 'Oberhäuptling der Winterfelle', --#--#--
    QUEST_5163 = 'Sind wir endlich da, Yeti?', --#--#--
    QUEST_4842 = 'Sonderbare Quellen', --#--#--

    TANARIS_1 = 'Танарис',
    TANARIS_2 = 'Танарис',
    QUEST_2662 = 'Noggenfogger-Elixier', --#--#--
    QUEST_2874 = 'Lieferung für MacKinley', --#--#--
    QUEST_1691 = 'Noch mehr Wüstenläufergerechtigkeit', --#--#--
    QUEST_113 = 'Insektenteil-Analyse', --#--#--

    STONETALON_1 = 'Когтистые горы',
    STONETALON_2 = 'Когтистые горы',
    QUEST_1096 = 'Gerenzo Pfeifzang', --#--#--

    UNGORO_1 = 'Кратер Ун\'Горо',
    UNGORO_2 = 'Кратер Ун\'Горо',
    QUEST_3962 = 'Allein ist es gefährlich', --#--#--
    QUEST_4245 = 'Chasing A-Me 01', --#--#--
    QUEST_4292 = 'Ein Köder für Lar\'korwi', --#--#--

    THOUSAND_NEEDLES_1 = 'Тысяча Игл',
    THOUSAND_NEEDLES_2 = 'Тысяча Игл',
    QUEST_1189 = 'Sicherheit zuerst', --#--#--

    ARATHI_1 = 'Нагорье Арати',
    ARATHI_2 = 'Нагорье Арати',
    QUEST_652 = 'Den Hauptstein zerbrechen', --#--#--

    BADLANDS_1 = 'Бесплодные земли',
    BADLANDS_2 = 'Бесплодные земли',
    QUEST_737 = 'Verbotenes Wissen', --#--#--
    QUEST_778 = 'Das wird schwierig', --#--#--
    QUEST_656 = 'Beschwören der Prinzessin', --#--#--
	QUEST_793 = 'Zerbrochene Allianzen', --#--#--
	QUEST_717 = 'Erdbeben', --#--#--
    
    EASTERN_PLAGUELANDS_1 = 'Восточные Чумные земли',
    EASTERN_PLAGUELANDS_2 = 'Восточные Чумные земли',
    QUEST_5942 = 'Versteckte Schätze', --#--#--
    QUEST_6148 = 'Das Scharlachrote Orakel Demetria', --#--#--
    QUEST_6187 = 'Ordnung muss wieder hergestellt werden', --#--#--
    QUEST_5265 = 'Der Argentumtresor', --#--#--

    BLASTED_LANDS_1 = 'Выжженные земли',
    BLASTED_LANDS_2 = 'Выжженные земли',
    QUEST_3628 = 'Ihr seid Rakh\'likh, Dämon', --#--#--

    STRANGLETHORN_VALLEY_1 = 'Тернистая долина',
    STRANGLETHORN_VALLEY_2 = 'Тернистая долина',
    QUEST_208 = 'Охотник на крупную дичь',
    QUEST_600 = 'Venture Company-Bergbau', --#--#--
    QUEST_613 = 'Maurys Fuß aufbrechen', --#--#--
    QUEST_628 = 'Exzelsior', --#--#--
    QUEST_338 = 'Зеленые холмы Тернистой долины',
	
	AN_NESINGWARY = 'Зеленые холмы Тернистой долины',
	AD_NESINGWARY = 'Выполните все задания Хеминга Эрнестуэя в Тернистой долине, включая финальное – "Охотник на крупную дичь".',

    WESTERN_PLAGUELANDS_1 = 'Западные Чумные земли',
    WESTERN_PLAGUELANDS_2 = 'Западные Чумные земли',
    QUEST_5944 = 'In den Träumen', --#--#--
    QUEST_5051 = 'Zwei Hälften vereint', --#--#--
    QUEST_4985 = 'Die Tierwelt leidet auch', --#--#--

    SEARING_GORGE_1 = 'Тлеющее ущелье',
    SEARING_GORGE_2 = 'Тлеющее ущелье',
    QUEST_3481 = 'Plunder...', --#--#--

    BLACK_ROCK_1 = 'Черная гора',
    BLACK_ROCK_2 = 'Черная гора',
    QUEST_8996 = 'Rückkehr zu Bodley', --#--#--

    AN_WISDOM_KEEPER = 'Хранитель мудрости',
    AD_WISDOM_KEEPER = 'Выполните указанные ниже задания.',
    AN_WISDOM_KEEPER_AZEROTH = 'Хранитель мудрости',
    AD_WISDOM_KEEPER_AZEROTH = 'Выполните указанные ниже задания.',
    AN_WISDOM_KEEPER_KALIMDOR = 'Хранитель мудрости Калимдора',
    AD_WISDOM_KEEPER_KALIMDOR = 'Выполните указанные ниже задания.',
    AN_WISDOM_KEEPER_EASTERN_KINGDOMS = 'Хранитель мудрости Восточных королевств',
    AD_WISDOM_KEEPER_EASTERN_KINGDOMS = 'Выполните указанные ниже задания.',
    AN_WISDOM_KEEPER_OUTLAND = 'Хранитель мудрости Запределья',
    AD_WISDOM_KEEPER_OUTLAND = 'Добейтесь указанных ниже достижений в Запределье.',

    AN_RAGEFIRE_CHASM = 'Огненная Пропасть',
    AD_RAGEFIRE_CHASM = 'Победите Баззалана.',
    AN_WAILING_CAVERNS = 'Пещеры Стенаний',
    AD_WAILING_CAVERNS = 'Убейте Мутануса Пожирателя.',
    AN_DEAD_MINES = 'Мертвые копи',
    AD_DEAD_MINES = 'Победите Эдвина ван Клифа.',
    AN_SHADOWFANG_KEEP = 'Крепость Темного Клыка',
    AD_SHADOWFANG_KEEP = 'Победите верховного мага Аругала.',
    AN_BLACKFATHOM_DEEPS = 'Непроглядная Пучина',
    AD_BLACKFATHOM_DEEPS = 'Убейте Аку\'мая.',
    AN_JAIL = 'Тюрьма Штормграда',
    AD_JAIL = 'Победите Базиля Тредда.',
    AN_GNOMREGAN = 'Гномреган',
    AD_GNOMREGAN = 'Убейте анжинера Термоштепселя.',
    AN_RAZORFEN_KRAUL = 'Лабиринты Иглошкурых',
    AD_RAZORFEN_KRAUL = 'Убейте Чарлгу Остробок.',
    AN_SCARLET_MONASTERY = 'Монастырь Алого ордена',
    AD_SCARLET_MONASTERY = 'Победите силы Алого ордена в моанстыре Алого ордена.',
    AC_SCARLET_MONASTERY1 = 'Волшебник крови Талнос',
    AC_SCARLET_MONASTERY2 = 'Чародей Доан',
    AC_SCARLET_MONASTERY3 = 'Ирод',
    AC_SCARLET_MONASTERY4 = 'Командир Алого ордена Могрейн',
    AC_SCARLET_MONASTERY5 = 'Верховный инквизитор Вайтмейн',
	
    AN_RAZORFEN_DOWNS = 'Курганы Иглошкурых',
    AD_RAZORFEN_DOWNS = 'Убейте Амненнара Хладовея.',
    AN_ULDAMAN = 'Ульдаман',
    AD_ULDAMAN = 'Убейте Аркедаса.',
    AN_ZULFARRAK = 'Зул\'Фаррак',
    AD_ZULFARRAK = 'Убейте Вождя Укорза Песчаного Черепа.',
    AN_MARAUDON = 'Мародон',
    AD_MARAUDON = 'Убейте Принцессу Терадрас.',
    AN_SUNKEN_TEMPLE = 'Затонувший храм',
    AD_SUNKEN_TEMPLE = 'Убейте Тень Эраникуса.',
	
    AN_NEW_EMPEROR = 'Глубины Черной горы',
    AD_NEW_EMPEROR = 'Убейте императора Даграна Тауриссана.',
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
	
    AN_BLACKROCK_SPIRE_BOTTOM = 'Нижняя часть пика Черной горы',
    AD_BLACKROCK_SPIRE_BOTTOM = 'Убейте Властителя Змейталака.',
    AN_BLACKROCK_SPIRE_UPPER = 'Верхняя часть пика Черной горы',
    AD_BLACKROCK_SPIRE_UPPER = 'Убейте Генерала Драккисата.',
    AN_BLACKROCK_SPIRE = 'Eindringling der Schwarzfelsspitze', --#--#--
    AD_BLACKROCK_SPIRE = 'Schließt die unten aufgelisteten Erfolge in der Schwarzfelsspitze ab.', --#--#--
    AN_DIRE_MAUL = 'Правитель Забытого города',
    AD_DIRE_MAUL = 'Очистите от врагов все части Забытого города.',
    AC_DIRE_MAUL1 = 'Алззин Перевертень',
    AC_DIRE_MAUL2 = 'Бессмер\'тер',
    AC_DIRE_MAUL3 = 'Король Гордок',
    AN_STRATHOLME = 'Стратхольм',
    AD_STRATHOLME = 'Очистите Стратхольм от населяющих его воплощений зла.',
	AC_STRATHOLME1 = 'Бальназар',
	AC_STRATHOLME2 = 'Барон Ривендер',
    AN_SCHOLOMANCE = 'Некроситет',
    AD_SCHOLOMANCE = 'Победите темного магистра Гандлинга.',
	AC_SCHOLOMANCE1 = 'Темный магистр Гандлинг',
	AC_SCHOLOMANCE2 = 'Рас Ледяной Шепот',
    AN_YOUNG_DEFENDER = 'Повелитель подземелий',
    AD_YOUNG_DEFENDER = 'Добейтесь указанных ниже достижений в подземельях классической игры.',
    AN_DEFENDER = 'Verteidiger von Azeroth', --#--#--
    AD_DEFENDER = 'Schließt die unten aufgelisteten Dungeon-Erfolge ab.', --#--#--
    AR_DEFENDER = 'Verteidiger von Azeroth', --#--#--

    AN_ONYXIA = 'Логово Ониксии',
    AD_ONYXIA = 'Bezwingt Onyxia.', --#--#--
    AN_AQ20 = 'Руины Ан\'Киража',
    AD_AQ20 = 'Убейте Оссириана Неуязвимого.',
    AN_ZULGURUB = 'Зул\'Гуруб',
    AD_ZULGURUB = 'Убейте Хаккара.',
    AN_RAGNAROS = 'Огненные Недра',
    AD_RAGNAROS = 'Убейте Рагнароса.',
    AN_BLACK_WING_LAIR = 'Логово Крыла Тьмы',
    AD_BLACK_WING_LAIR = 'Убейте Нефариана.',
    AN_AQ40 = 'Храм Ан\'Киража',
    AD_AQ40 = 'Убейте К\'Туна.',
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

    AN_PVP_RANK_A1 = 'Рядовой',
    AN_PVP_RANK_A2 = 'Капрал',
    AN_PVP_RANK_A3 = 'Сержант',
    AN_PVP_RANK_A4 = 'Старший сержант',
    AN_PVP_RANK_A5 = 'Старшина',
    AN_PVP_RANK_A6 = 'Рыцарь',
    AN_PVP_RANK_A7 = 'Рыцарь-лейтенант',
    AN_PVP_RANK_A8 = 'Рыцарь-капитан',
    AN_PVP_RANK_A9 = 'Рыцарь-защитник',
    AN_PVP_RANK_A10 = 'Лейтенант-командор',
    AN_PVP_RANK_A11 = 'Командор',
    AN_PVP_RANK_A12 = 'Маршал',
    AN_PVP_RANK_A13 = 'Фельдмаршал',
    AN_PVP_RANK_A14 = 'Главнокомандующий',
    AN_PVP_RANK_H1 = 'Разведчик',
    AN_PVP_RANK_H2 = 'Рубака',
    AN_PVP_RANK_H3 = 'Сержант',
    AN_PVP_RANK_H4 = 'Старший сержант',
    AN_PVP_RANK_H5 = 'Старшина',
    AN_PVP_RANK_H6 = 'Каменный страж',
    AN_PVP_RANK_H7 = 'Кровавый страж',
    AN_PVP_RANK_H8 = 'Легионер',
    AN_PVP_RANK_H9 = 'Центурион',
    AN_PVP_RANK_H10 = 'Защитник',
    AN_PVP_RANK_H11 = 'Лейтенант-генерал',
    AN_PVP_RANK_H12 = 'Генерал',
    AN_PVP_RANK_H13 = 'Вождь',
    AN_PVP_RANK_H14 = 'Верховный вождь',
    AD_PVP_RANK = 'Den Titel "%s" erhalten.', --#--#--
    AN_PVP_FIRST_KILL = 'Победа в PvP',
    AD_PVP_FIRST_KILL = 'Одержите почетную победу в PvP.',
    AC_PVP_FIRST_KILL = 'Одержите почетную победу в PvP.',
    AN_PVP_KILLS = '%dпочетных побед в PvP',
    AD_PVP_KILLS = 'Одержите %dпочетных побед в PvP.',
    AC_PVP_KILLS = 'Одержать %dпочетных побед',

    AN_MOB_KILLS_1 = 'Totschläger', --#--#--
    AN_MOB_KILLS_2 = 'Zerstörer', --#--#--
    AN_MOB_KILLS_3 = 'Brecher', --#--#--
    AN_MOB_KILLS_4 = 'Kopfgeldjäger', --#--#--
    AN_MOB_KILLS_5 = 'Gewittersturm aller Monster', --#--#--
    AN_MOB_KILLS_6 = 'Gewittersturm allen Lebens', --#--#--
    AN_MOB_KILLS_7 = 'Allgegenwärtiger Tod', --#--#--
    AD_MOB_KILLS = 'Tötet %d Gegner.', --#--#--
    AC_MOB_KILLS = 'Tötet %d Gegner', --#--#--

    AN_REPS_1 = 'Я кому-то нравлюсь!',
    AD_REPS_1 = 'Добейтесь того, чтобы вас превозносила какая-либо фракция.',
    AC_REPS_1 = 'Добейтесь того, чтобы вас превозносила какая-либо фракция.',
    AN_REPS_X = 'Репутаций "Превознесение"',
    AD_REPS = 'Добейтесь того, чтобы вас превозносили %dфракций.',
    AC_REPS = 'Erreicht bei %d Fraktionen einen ehrfürchtigen Ruf.', --#--#--
    AR_REPS = 'Der Ehrfurchtgebietende', --#--#--

    AN_HORDE_REPS = 'Посланник Орды',
    AD_HORDE_REPS = 'Добейтесь того, чтобы вас превозносили в 5 столицах.',
    AC_HORDE_REPS_1 = 'Превознесение в Оргриммаре',
    AC_HORDE_REPS_2 = 'Ehrfürchtig bei den Dunkelspeertrollen.', --#--#--
    AC_HORDE_REPS_3 = 'Превознесение в Подгороде',
    AC_HORDE_REPS_4 = 'Превознесение в Громовом Утесе',
    AC_HORDE_REPS_5 = 'Превознесение в Луносвете',

    AN_ALLIANCE_REPS = 'Посланник Альянса',
    AD_ALLIANCE_REPS = 'Добейтесь того, чтобы вас превозносили в 5 столицах.',
    AC_ALLIANCE_REPS_1 = 'Превознесение в Штормграде',
    AC_ALLIANCE_REPS_2 = 'Превознесение в Дарнасе',
    AC_ALLIANCE_REPS_3 = 'Превознесение у Изгнанников Гномрегана',
    AC_ALLIANCE_REPS_4 = 'Превознесение в Стальгорне',
    AC_ALLIANCE_REPS_5 = 'Превознесение в Экзодаре',

    AN_ARGENT_DAWN = 'Серебряный Рассвет',
    AD_ARGENT_DAWN = 'Добейтесь того, чтобы вас превозносил Серебряный Рассвет.',
    AN_BROOD_OF_NOZDORMU = 'Род Ноздорму',
    AD_BROOD_OF_NOZDORMU = 'Добейтесь того, чтобы вас превозносил Род Ноздорму.',
    AN_DARKMOON_FAIRE = 'Ярмарка Новолуния',
    AD_DARKMOON_FAIRE = 'Erreicht beim Dunkelmond-Jahrmarkt den Status ehrfürchtig.', --#--#--
    AN_ZANDALAR_TRIBE = 'Герой племени Зандалар',
    AD_ZANDALAR_TRIBE = 'Добейтесь того, чтобы вас превозносило племя Зандалар.',
    AN_HYDRAXIANS = 'Гидраксианские Повелители Вод',
    AD_HYDRAXIANS = 'Добейтесь того, чтобы вас превозносили Гидраксианские Повелители Вод.',
    AN_TIMBERMAW_HOLD = 'В том тоннеле меня любят!',
    AD_TIMBERMAW_HOLD = 'Добейтесь того, чтобы вас превозносила Крепость Древобрюхов.',
    AN_THORIUM = 'Братство Тория',
    AD_THORIUM = 'Erreicht bei der Thoriumbruderschaft den Status ehrfürchtig.', --#--#--
    AN_SHENDRALAR = 'Agent der Shen\'dralar', --#--#--
    AD_SHENDRALAR = 'Erreicht bei den Shen\'dralar den Status ehrfürchtig.', --#--#--
    AN_CENARION = 'Круг Кенария',
    AD_CENARION = 'Erreicht beim Zirkel des Cenarius den Status ehrfürchtig.', --#--#--

    AN_DEFILERS = 'Осквернитель',
    AD_DEFILERS = 'Добейтесь того, чтобы вас превозносили в клане Осквернителей.',
    AN_FROSTWOLF_CLAN = 'Герой клана Северного Волка',
    AD_FROSTWOLF_CLAN = 'Добейтесь того, чтобы вас превозносили в клане Северного Волка.',
    AN_WARSONG_OUTRIDERS = 'Всадник из клана Песни Войны',
    AD_WARSONG_OUTRIDERS = 'Добейтесь того, чтобы вас превозносили Всадники Песни Войны.',
    AN_HORDE_PVP_FRACTIONS = 'Завоеватель',
    AD_HORDE_PVP_FRACTIONS = 'Добейтесь того, чтобы вас превозносили в Ущелье Песни Войны, Низине Арати и Альтеракской долине.',

    AN_LEAGUE_OF_ARATHOR = 'Рыцарь Аратора',
    AD_LEAGUE_OF_ARATHOR = 'Добейтесь того, чтобы вас превозносили в Лиге Аратора.',
    AN_STORMSPIKE_GUARD = 'Герой Стражи Грозовой Вершины',
    AD_STORMSPIKE_GUARD = 'Добейтесь того, чтобы вас превозносила Стража Грозовой Вершины.',
    AN_SILVERWING_SENTINELS = 'Часовой Среброкрылых',
    AD_SILVERWING_SENTINELS = 'Добейтесь того, чтобы вас превозносили Среброкрылые Часовые.',
    AN_ALLIANCE_PVP_FRACTIONS = 'Вершитель правосудия',
    AD_ALLIANCE_PVP_FRACTIONS = 'Добейтесь того, чтобы вас превозносили в Ущелье Песни Войны, Низине Арати и Альтеракской долине.',

    AN_BOLVAR_SLAYER = 'Штурм Штормграда',
    AD_BOLVAR_SLAYER = 'Убейте верховного лорда Болвара Фордрагона.',
    AN_MAGNI_SLAYER = 'Король умер!',
    AD_MAGNI_SLAYER = 'Убейте короля Магни Бронзоборода.',
    AN_TYRANDE_SLAYER = 'Уже не бессмертна',
    AD_TYRANDE_SLAYER = 'Убейте верховную жрицу Тиранду Шелест Ветра.',
    AN_VELEN_SLAYER = 'Гасите свет',
    AD_VELEN_SLAYER = 'Убейте пророка Велена.',

    AN_ALLIANCE_KINGS_SLAYER = 'За Орду!',
    AD_ALLIANCE_KINGS_SLAYER = 'Убейте предводителей Альянса.',

    AN_THRALL_SLAYER = 'Смерть вождя',
    AD_THRALL_SLAYER = 'Убейте Тралла.',
    AN_SYLVANAS_SLAYER = 'Упокоить Темную Госпожу',
    AD_SYLVANAS_SLAYER = 'Убейте Сильвану Ветрокрылую.',
    AN_CAIRNE_SLAYER = 'Наступить на Кровавое Копыто',
    AD_CAIRNE_SLAYER = 'Убейте Кэрна Кровавое Копыто.',
    AN_LORTHEMAR_SLAYER = 'Убийство в Кель\'Таласе',
    AD_LORTHEMAR_SLAYER = 'Убейте Лор\'темара Терона.',

    AN_HORDE_KINGS_SLAYER = 'За Альянс!',
    AD_HORDE_KINGS_SLAYER = 'Убейте предводителей Орды.',

    AN_RACES_KILLER = 'Знай врага',
    AD_ALLIANCE_RACES_KILLER = 'Одержите почетную победу в PvP, убив по одному представителю 5 разных рас.',
    AD_HORDE_RACES_KILLER = 'Одержите почетную победу в PvP, убив по одному представителю 5 разных рас.',
    AC_HUMAN_KILLED = 'Человек',
    AC_NIGHTELF_KILLED = 'Ночной эльф',
    AC_DWARF_KILLED = 'Дворф',
    AC_GNOME_KILLED = 'Гном',
    AC_ORC_KILLED = 'Орк',
    AC_TROLL_KILLED = 'Тролль',
    AC_SCOURGE_KILLED = 'Нежить',
    AC_TAUREN_KILLED = 'Таурен',
    AC_DRAENEI_KILLED = 'Дреней',
    AC_BLOODELF_KILLED = 'Эльф крови',

    AN_CLASSES_KILLER = 'Вот это класс!',
    AD_CLASSES_KILLER = 'Одержите почетную победу в PvP, убив по одному персонажу каждого класса.',
    AC_WARRIOR_KILLED = 'Воин',
    AC_HUNTER_KILLED = 'Охотник',
    AC_ROGUE_KILLED = 'Разбойник',
    AC_PRIEST_KILLED = 'Жрец',
    AC_MAGE_KILLED = 'Маг',
    AC_WARLOCK_KILLED = 'Чернокнижник',
    AC_DRUID_KILLED = 'Друид',
    AC_PALADIN_KILLED = 'Паладин',
    AC_SHAMAN_KILLED = 'Шаман',

    AN_ALTERAC_WIN = 'Победа в Альтеракской долине',
    AD_ALTERAC_WIN = 'Выиграйте сражение в Альтеракской долине.',
    AN_ALTERAC_WINS = 'Защитник Альтеракской долины',
    AD_ALTERAC_WINS = 'Erringt %d Siege im Alteractal.', --#--#--
    AN_WARSONG_WIN = 'Победа в Ущелье Песни Войны',
    AD_WARSONG_WIN = 'Выиграйте сражение в Ущелье Песни Войны.',
    AN_WARSONG_WINS = 'Защитник Ущелья Песни Войны',
    AD_WARSONG_WINS = 'Одержите %dпобед в Ущелье Песни Войны.',
    AN_ARATHI_WIN = 'Победа в Низине Арати',
    AD_ARATHI_WIN = 'Выиграйте сражение в Низине Арати.',
    AN_ARATHI_WINS = 'Защитник Низины Арати',
    AD_ARATHI_WINS = 'Одержите %dпобед в Низине Арати.',
    AN_EYE_WIN = 'Победа на Оке Бури',
    AD_EYE_WIN = 'Одержите победу на Оке Бури.',
    AN_EYE_WINS = 'Защитник Ока Бури',
    AD_EYE_WINS = 'Erringt %d Siege im Auge des Sturms.', --#--#--

    AN_ALTERAC_KILLING_BLOWS = 'Fleischwolf des Alteractals', --#--#--
    AD_ALTERAC_KILLING_BLOWS = 'Erreicht %d Todesstöße während einer einzigen Schlacht im Alteractal und bleibt bis zu deren Ende.', --#--#--
    AN_ALTERAC_GRAVEYARD_ASSAULT = 'Кладбищенский вор Альтерака',
    AD_ALTERAC_GRAVEYARD_ASSAULT = '50 раз захватите кладбища в Альтеракской долине.',
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
    AN_ALTERAC_AUTOGRAPH = 'Трофей достается победителю',
    AD_ALTERAC_AUTOGRAPH = 'Добудьте подписанную картину Форора и Тигуля в Альтеракской долине.',

    AN_WARSONG_KILLS = 'Militärische Auszeichnung', --#--#--
    AD_WARSONG_KILLS = 'Erreicht %d ehrenhafte Siege während einer einzigen Schlacht in der Kriegshymnenschlucht und bleibt bis zu deren Ende.', --#--#--
    AN_WARSONG_FLAG_CAPTURE = 'Захват флага',
    AD_WARSONG_FLAG_CAPTURE = 'Возьмите флаг и отнесите его на свою базу в Ущелье Песни Войны.',
    AN_WARSONG_FLAG_CAPTURES = 'Großartiger Flaggenträger', --#--#--
    AD_WARSONG_FLAG_CAPTURES = 'Ergreift und erobert %d gegnerische Flaggen während einer einzigen Schlacht in der Kriegshymnenschlucht und bleibt bis zu deren Ende.', --#--#--
    AN_WARSONG_FLAG_RETURN = 'Fasst das nicht an!', --#--#--
    AD_WARSONG_FLAG_RETURN = 'Bringt als Verteidiger eine Flagge während einer einzigen Schlacht in der Kriegshymnenschlucht zurück und bleibt bis zu deren Ende.', --#--#--
    AN_WARSONG_FLAG_RETURNS = 'Неутомимый защитник',
    AD_WARSONG_FLAG_RETURNS = 'Bringt als Verteidiger %d Flaggen während einer einzigen Schlacht in der Kriegshymnenschlucht zurück und bleibt bis zu deren Ende.', --#--#--

    AN_ARATHI_BASE_ASSAULT = 'Konquistador', --#--#--
    AD_ARATHI_BASE_ASSAULT = 'Erobert eine Basis während einer einzigen Schlacht im Arathibecken und bleibt bis zu deren Ende.', --#--#--
    AN_ARATHI_BASE_ASSAULTS = 'Ловкость рук и резвость ног',
    AD_ARATHI_BASE_ASSAULTS = 'Erobert %d Basen während einer einzigen Schlacht im Arathibecken und bleibt bis zu deren Ende.', --#--#--
    AN_ARATHI_BASE_DEFEND = 'Beschützer', --#--#--
    AD_ARATHI_BASE_DEFEND = 'Verteidigt eine Basis während einer einzigen Schlacht im Arathibecken und bleibt bis zu deren Ende.', --#--#--
    AN_ARATHI_BASE_DEFENDS = 'Wächter', --#--#--
    AD_ARATHI_BASE_DEFENDS = 'Verteidigt %d Basen während einer einzigen Schlacht im Arathibecken und bleibt bis zu deren Ende.', --#--#--
    AN_ARATHI_CLOSE = 'Они нам дышали в затылок…',
    AD_ARATHI_CLOSE = 'Выиграйте сражение в Низине Арати, оторвавшись от противника на 10 очков (1600 к 1590).',
    AN_ARATHI_PERFECT = 'Победить всухую в Низине',
    AD_ARATHI_PERFECT = 'Выиграйте сражение в Низине Арати со счетом 1600 к 0.',

    AN_EYE_CAPTURE = 'Вестник бури',
    AD_EYE_CAPTURE = 'Возьмите флаг и отнесите его на свою базу на Оке Бури.',
    AD_EYE_CAPTURES = 'Ergreift und erobert persönlich %d Flaggen im Auge des Sturms und bleibt bis zum Ende der Schlacht.', --#--#--
    AN_EYE_GLORY = 'Обречен прославиться',
    AD_EYE_GLORY = 'В течение одного сражения на Оке Бури трижды захватите флаг, не умерев ни разу.',
    AN_EYE_FAST_WIN = 'Шквал',
    AD_EYE_FAST_WIN = 'Выиграйте сражение на Оке Бури за 6 минут.',
    AN_EYE_BERSERK = 'Кровожадный берсерк',
    AD_EYE_BERSERK = 'Нанесите смертельный удар, находясь в состоянии берсерка на Оке Бури.',
    AN_EYE_IDEAL_VICTORY = 'Идеальный штурм',
    AD_EYE_IDEAL_VICTORY = 'Одержите победу на Оке Бури со счетом 1600 к 0.',

    AN_BGS_KILLING_BLOWS = 'Смертоносный',
    AD_BGS_KILLING_BLOWS = 'Erringt %d Todesstöße auf einem beliebigen Schlachtfeld.', --#--#--
    AN_BGS_KILLS = 'Угрюмый жнец',
    AD_BGS_KILLS = 'Erringt %d ehrenhafte Siege auf einem beliebigen Schlachtfeld.', --#--#--

    PROF_FIRST_AID = 'Первая помощь',
    PROF_FISHING = 'Рыбная ловля',
    PROF_COOKING = 'Кулинария',
    PROF_ENCHANTING = 'Наложение чар',
    PROF_TAILORING = 'Портняжное дело',
    PROF_ENGINEERING = 'Инженерное дело',
    PROF_LEATHERWORKING = 'Кожевничество',
    PROF_ALCHEMY = 'Алхимия',
    PROF_BLACKSMITHING = 'Кузнечное дело',
    PROF_HERBALISM = 'Травничество',
    PROF_MINING = 'Горное дело',
    PROF_SKINNING = 'Cнятие шкур',
    PROF_JEWELCRAFTING = 'Ювелирное дело',
    SKILL_UNARMED = 'Рукопашный бой',
    SKILL_RIDING = 'Верховая езда',

    AN_PROFS_JOURNEYMAN = 'Lehrlingsprüfung', --#--#--
    AD_PROFS_JOURNEYMAN = 'Erlangt 75 Fertigkeitspunkte in einem Beruf.', --#--#--
    AN_PROFS_EXPERT = 'Подмастерье',
    AD_PROFS_EXPERT = 'Станьте подмастерьем в любой профессии.',
    AN_PROFS_ARTISAN = 'Умелец',
    AD_PROFS_ARTISAN = 'Станьте умельцем в любом ремесле.',
    AN_PROFS_ONE = 'Professioneller Fachmann', --#--#--
    AD_PROFS_ONE = 'Erlangt 300 Fertigkeitspunkte in einem Beruf.', --#--#--
    AN_PROFS_ONE_OUTLAND = 'Мастер',
    AD_PROFS_ONE_OUTLAND = 'Станьте мастером в любой профессии.',
    AN_PROFS_TWO = 'Handwerker', --#--#--
    AD_PROFS_TWO = 'Werdet gleichzeitig in zwei Berufen Fachmann.', --#--#--
    AC_PROFS_TWO = 'Werdet gleichzeitig in zwei Berufen Fachmann.', --#--#--
    AN_PROFS_TWO_OUTLAND = 'Handwerker der Scherbenwelt', --#--#--
    AD_PROFS_TWO_OUTLAND = 'Werdet gleichzeitig in zwei Berufen Meister.', --#--#--
    AC_PROFS_TWO_OUTLAND = 'Werdet gleichzeitig in zwei Berufen Meister.', --#--#--

    AN_FIRST_AID_JOURNEYMAN = 'Lehrling in Erster Hilfe', --#--#--
    AD_FIRST_AID_JOURNEYMAN = 'Erlangt 75 Fertigkeitspunkte in Erster Hilfe.', --#--#--
    AN_FIRST_AID_EXPERT = 'Подмастерье первой помощи',
    AD_FIRST_AID_EXPERT = 'Станьте подмастерьем первой помощи.',
    AN_FIRST_AID_ARTISAN = 'Умелец оказывать первую помощь',
    AD_FIRST_AID_ARTISAN = 'Станьте умельцем в деле оказания первой помощи.',
    AN_FIRST_AID_MASTER = 'Fachmann in Erster Hilfe', --#--#--
    AD_FIRST_AID_MASTER = 'Erlangt 300 Fertigkeitspunkte in Erster Hilfe.', --#--#--
    AN_FIRST_AID_OUTLAND_MASTER = 'Мастер оказания первой помощи',
    AD_FIRST_AID_OUTLAND_MASTER = 'Станьте мастером в деле оказания первой помощи.',
	
    AN_FISHING_JOURNEYMAN = 'Anglerlehrling', --#--#--
    AD_FISHING_JOURNEYMAN = 'Erlangt 75 Fertigkeitspunkte im Angeln.', --#--#--
    AN_FISHING_EXPERT = 'Рыболов-подмастерье',
    AD_FISHING_EXPERT = 'Станьте рыболовом-подмастерьем.',
    AN_FISHING_ARTISAN = 'Рыболов-умелец',
    AD_FISHING_ARTISAN = 'Станьте рыболовом-умельцем.',
    AN_FISHING_MASTER = 'Рыболов-искусник',
    AD_FISHING_MASTER = 'Станьте рыболовом-искусником.',
    AN_FISHING_OUTLAND_MASTER = 'Рыболов-мастер',
    AD_FISHING_OUTLAND_MASTER = 'Станьте рыболовом-мастером.',
	
    AN_COOKING_JOURNEYMAN = 'Kochlehrling', --#--#--
    AD_COOKING_JOURNEYMAN = 'Erlangt 75 Fertigkeitspunkte im Kochen.', --#--#--
    AN_COOKING_EXPERT = 'Повар-подмастерье',
    AD_COOKING_EXPERT = 'Станьте поваром-подмастерьем.',
    AN_COOKING_ARTISAN = 'Повар-умелец',
    AD_COOKING_ARTISAN = 'Станьте поваром-умельцем.',
    AN_COOKING_MASTER = 'Повар-искусник',
    AD_COOKING_MASTER = 'Станьте поваром-искусником.',
    AN_COOKING_OUTLAND_MASTER = 'Мастер кулинарии',
    AD_COOKING_OUTLAND_MASTER = 'Станьте мастером кулинарии.',
	
    AN_PROFS_SECONDARY = 'На все руки мастер',
    AD_PROFS_SECONDARY = 'Станьте искусником рыбной ловли, первой помощи и кулинарии.',
    AN_PROFS_SECONDARY_OUTLAND = 'На все руки мастер',
    AD_PROFS_SECONDARY_OUTLAND = 'Станьте мастером рыбной ловли, первой помощи и кулинарии.',
    AN_PROFS_FIVE = 'Genie', --#--#--
    AN_PROFS_FIVE_OUTLAND = 'Genie der Scherbenwelt', --#--#--
    AD_PROFS_FIVE = 'Erlangt die unten aufgelisteten Berufserfolge.', --#--#--
    AN_UNARMED_SKILL = 'Кому зуботычину?',
    AD_UNARMED_SKILL = 'Доведите свой навык рукопашного боя до 350.',

    AN_EXPLORE_AZEROTH = 'Первооткрыватель',
    AD_EXPLORE_AZEROTH = 'Исследуйте Восточные королевства, Калимдор и Запределье.',
	AR_EXPLORER = 'Entdecker', --#--#--
    AN_EXPLORE_KALIMDOR = 'Калимдор',
    AD_EXPLORE_KALIMDOR = 'Исследуйте все местности Калимдора.',
    AN_EXPLORE_EASTERN_KINGDOMS = 'Восточные королевства',
    AD_EXPLORE_EASTERN_KINGDOMS = 'Исследуйте все местности Восточных королевств.',
	AN_EXPLORE = 'Erforscht %s', --#--#--
    AD_EXPLORE = 'Erforscht %s und enthüllt die verdeckten Gebiete auf der Weltkarte.', --#--#--

    AN_SULFURAS = 'Сульфурас, Рука Рагнароса',
    AD_SULFURAS = 'Владелец Сульфараса, Руки Рагнароса.',
    AN_THUNDER_FURY = 'Грозовая Ярость, благословленный клинок Искателя Ветра',
    AD_THUNDER_FURY = 'Владелец Грозовой Ярости, благословенного клинка Искателя Ветра.',
    AN_ATIESH = 'Атиеш, большой посох Стража',
    AD_ATIESH = 'Владелец Атиеша, большого посоха Стража.',
    AN_BLACK_SCARAB = 'Король-скарабей',
    AD_BLACK_SCARAB = 'Откройте Врата Ан\'Киража.',
    AN_RED_SCARAB = 'Почему? Потому что он красный.',
    AD_RED_SCARAB = 'Получите Красный киражский резонирующий кристалл.',
	AN_TIGER_MOUNT = 'Стремительный зулианский тигр',
    AD_TIGER_MOUNT = 'Получите Стремительного зулианского тигра от Верховного Жреца Текала в Зул\'Гурубе.',
	AN_RAPTOR_MOUNT = 'Стремительный ящер Раззаши',
    AD_RAPTOR_MOUNT = 'Получите стремительного ящера Раззаши от Мандокира Повелителя Крови из Зул\'Гуруба.',
	AN_BARON_MOUNT = 'Поводья коня смерти',
    AD_BARON_MOUNT = 'Получите поводья коня смерти у Барона Ривендера из Стратхольма.',
	AN_SABER_MOUNT = 'Ледопард Зимних Ключей',
    AD_SABER_MOUNT = 'Получите ледопарда Зимних Ключей.',
    AN_ARGENT_DAWN_TABARD = 'Гербовая накидка Серебряного Рассвета',
    AD_ARGENT_DAWN_TABARD = 'Получите Гербовую накидку Серебряного Рассвета во время вторжения Плети.',
    
    AN_UNCOMMON_GEAR = 'Selten', --#--#--
    AD_UNCOMMON_GEAR = 'Legt an jedem Platz einen Gegenstand von seltener Qualität an.', --#--#--
    AN_RARE_GEAR = 'Превосходный боец',
    AD_RARE_GEAR = 'Полностью снарядите персонажа превосходной экипировкой с минимальным уровнем предметов не ниже 115.',
    AN_EPIC_GEAR = 'Эпический герой',
    AD_EPIC_GEAR = 'Полностью снарядите персонажа эпической экипировкой с минимальным уровнем предметов не ниже 115.',

    AN_STOCKING_UP = 'Запасаемся',
    AD_STOCKING_UP = 'Создайте 500 плотных бинтов из ткани Пустоты.',
    AC_STOCKING_UP = 'Stellt 100 schwere Runenstoffverbände her', --#--#--
    AN_STOCKING_UP_2 = 'Запасаемся',
    AD_STOCKING_UP_2 = 'Создайте 500 плотных бинтов из рунической ткани.',
    AC_STOCKING_UP_2 = 'Создайте 500 плотных бинтов из рунической ткани.',
    AN_STOCKING_UP_OUTLAND = 'Vorbereitung für die Leere', --#--#--
    AD_STOCKING_UP_OUTLAND = 'Stellt 100 schwere Netherstoffverbände her.', --#--#--
    AC_STOCKING_UP_OUTLAND = 'Stellt 100 schwere Netherstoffverbände her', --#--#--
    AN_STOCKING_UP_2_OUTLAND = 'Запасаемся',
    AD_STOCKING_UP_2_OUTLAND = 'Создайте 500 плотных бинтов из ткани Пустоты.',
    AC_STOCKING_UP_2_OUTLAND = 'Создайте 500 плотных бинтов из ткани Пустоты.',

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
	
	AN_FISHING_COUNT = '%dрыбок',
	AC_FISHING_COUNT = 'Angelt %d Gegenstände oder Fische.', --#--#--
	AD_FISHING_COUNT = 'Выудите %dпредметов.',

    AN_COOKING_RECIPES_5 = 'Буфетчик',
    AN_COOKING_RECIPES_10 = 'Мастер закусок',
    AN_COOKING_RECIPES_25 = 'Искусный кулинар',
    AN_COOKING_RECIPES_50 = 'Старший повар',
    AN_COOKING_RECIPES_75 = 'Chef de Cuisine', --#--#--
    AR_COOKING_RECIPES = 'Chefkoch', --#--#--
    AD_COOKING_RECIPES = 'Изучите %dкулинарных рецептов.',
    AC_COOKING_RECIPES = 'Lernt %d Kochrezepte', --#--#--

    AN_COOKING_SOUP = 'Suppenkocher', --#--#--
    AN_COOKING_DESSERT = 'Knollenmeister', --#--#--
    AN_COOKING_SQUID = 'Fang des Tages', --#--#--
    AN_COOKING_DUMPLINGS = 'Omas Knödel', --#--#--
    AN_COOKING_CAKE = 'Торт – это не выдумка!',
    AD_COOKING_CAKE = 'Испеките вкусный шоколадный торт.',
    AD_COOKING_CREATE = 'Kocht %s %d-mal.', --#--#--
    AC_COOKING_CREATE = 'Kocht %s %d-mal', --#--#--
    AN_COOKING_BIG_TABLE = 'Слава повару!',
    AD_COOKING_BIG_TABLE = 'Добейтесь достижений в кулинарии, указанных ниже.',

    AN_COOKING_FISHERMANS_FEAST = 'Рыбацкая услада',
    AN_COOKING_SPICY_HOT_TALBUK = 'Острый стейк из талбука',
    AN_COOKING_SKULLFISH_SOUP = 'Суп из рыбы-черепа',
    AN_COOKING_RAVAGER_DOG = 'Сосиска из мяса опустошителя',

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

    AN_DUEL = 'Дуэлянт',
    AD_DUEL = 'Победите другого игрока в дуэли.',
    AN_DUELS_10 = 'Дуэлянт',
    AN_DUELS_25 = 'Geübter Duellist', --#--#--
    AN_DUELS_100 = 'Meister-Duellist', --#--#--
    AD_DUELS = 'Gewinnt in %d Duellen.', --#--#--
    AC_DUELS = 'Gewinnt in %d Duellen', --#--#--
    AN_GURUBASHI_1 = 'Повелитель арены Гурубаши',
    AD_GURUBASHI_1 = 'Добудьте аксессуар Повелителя Арены на арене Гурубаши.',
    AN_GURUBASHI_2 = 'Великий хозяин арены Гурубаши',
    AD_GURUBASHI_2 = 'Выполните задание Коротышки Джона Мифрила, чтобы получить аксессуар великого мастера Арены.',
    AN_PARTICIPATE_IN_BGS = 'К оружию!',
    AD_PARTICIPATE_IN_BGS = 'Schließt %d Schlachtfelder ab.', --#--#--
    AC_PARTICIPATE_IN_BGS = 'Schließt %d Schlachtfelder ab.', --#--#--

    EMOTE_LOVE1 = 'Ihr liebt %s.', --#--#--
    AN_LOVE = 'Всем белочкам, которых я любил…',
    AD_LOVE = 'Выразите свою /любовь безобидным существам Азерота.',
    AN_LOVE_TBC = 'Близко ли, далеко ли — я люблю всех зверюшек',
    AD_LOVE_TBC = 'Покажите безобидным существам по ту сторону Темного портала, как сильно вы их любите (/любовь).',
    NPC_22480 = 'Бурый сурок',
    NPC_22306 = 'Шустрый пещерный паук',
    NPC_22842 = 'Корвакс',
    NPC_22843 = 'Грач',
    NPC_19665 = 'Доль',
    NPC_19154 = 'Пепельник',
    NPC_19482 = 'Саган',
    NPC_20411 = 'Призрачная корова',
    EMOTE_PAT1 = 'Ihr streichelt %s.', --#--#--
    AN_ARATHI_CATS = 'Katzen sind am wichtigsten', --#--#--
    AD_ARATHI_CATS = 'Streichelt die angegebenen Haustiere im Arathibecken (/streicheln).', --#--#--

    AN_ALTERAC_FAST_WIN = 'Альтеракский блиц',
    AD_ALTERAC_FAST_WIN = 'Выиграйте сражение в Альтеракской долине за 6 минут.',
    AN_WARSONG_FAST_WIN = 'Рационализация Ущелья',
    AD_WARSONG_FAST_WIN = 'Одержите победу в Ущелье Песни Войны менее чем за 7 минут.',
    AN_ARATHI_FAST_WIN = 'У нас все получится!',
    AD_ARATHI_FAST_WIN = 'Выиграйте сражение в Низине Арати за 6 минут.',

    AN_ALTERAC_TOWER_DEFEND_TOTAL = 'Защита башен',
    AD_ALTERAC_TOWER_DEFEND_TOTAL = '%dраз защитите башни в Альтеракской долине.',
    AN_ALTERAC_GRAVEYARD_ASSAULT_TOTAL = 'Кладбищенский вор Альтерака',
    AD_ALTERAC_GRAVEYARD_ASSAULT_TOTAL = '%dраз захватите кладбища в Альтеракской долине.',
    AN_WARSONG_FLAG_CAPTURE_TOTAL = 'Захват флага',
    AD_WARSONG_FLAG_CAPTURE_TOTAL = 'Ergreift und erobert persönlich %d Flaggen in der Kriegshymnenschlucht.', --#--#--
    AN_WARSONG_FLAG_RETURN_TOTAL = 'Неутомимый защитник',
    AD_WARSONG_FLAG_RETURN_TOTAL = 'Верните %dфлагов, защищая свою базу в Ущелье Песни Войны.',
    AN_ARATHI_BASE_ASSAULT_TOTAL = 'Ловкость рук и резвость ног',
    AD_ARATHI_BASE_ASSAULT_TOTAL = 'Захватите %dфлагов в Низине Арати.',
    AN_ARATHI_BASE_DEFEND_TOTAL = 'На помощь!',
    AD_ARATHI_BASE_DEFEND_TOTAL = 'Защищая базы в Низине Арати, %dраз верните контроль над флагом.',
    AN_ALTERAC_MOUNT_HORDE = 'Верховой Северный Волк',
    AD_ALTERAC_MOUNT_HORDE = 'Получите верхового Северного Волка.',
    AN_ALTERAC_MOUNT_ALLIANCE = 'Боевой скакун Грозовой Вершины',
    AD_ALTERAC_MOUNT_ALLIANCE = 'Получите Боевого скакуна Грозовой Вершины.',

    AN_ALTERAC_BOSS = 'Хозяин Альтеракской долины',
    AD_ALTERAC_BOSS = 'Добейтесь указанных ниже достижений в Альтеракской долине.',
    AN_WARSONG_BOSS = 'Повелитель Ущелья Песни Войны',
    AD_WARSONG_BOSS = 'Добейтесь указанных ниже достижений в Ущелье Песни Войны.',
    AN_ARATHI_BOSS = 'Хозяин Низины Арати',
    AD_ARATHI_BOSS = 'Добейтесь указанных ниже достижений в Низине Арати.',
    AN_EYE_BOSS = 'Повелитель Ока Бури',
    AD_EYE_BOSS = 'Добейтесь указанных ниже достижений на Оке Бури.',
    AN_BATTLEMASTER = 'Военачальник',
    AD_BATTLEMASTER = 'Добейтесь указанных ниже достижений на поле боя.',
    AR_BATTLEMASTER = 'Наградное звание: Военачальник',

    AN_LEEROY = 'Лиииииироооооой!',
    AD_LEEROY = 'Убейте 50 дракончиков Гнездовья за 15 секунд.',
    AR_LEEROY = 'Звание: Дженкинс',
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
	
	AN_PIRATES_HAT = 'Якорь мне в глотку!',
	AD_PIRATES_HAT = 'Получите Адмиральскую шляпу Кровавого Паруса… и почаще выходите на свежий воздух.',
	AR_PIRATES_HAT = 'Наградное звание: Адмирал Кровавого Паруса',
	AN_PALADIN_MOUNT = 'Скакун',
	AD_PALADIN_MOUNT = 'Выполнено задание для паладина на получение скакуна.',
	AN_WARLOCK_MOUNT = 'Зоротианский конь погибели',
	AD_WARLOCK_MOUNT = 'Выполнено задание для чернокнижников "Зоротианский конь погибели".',
	
	AN_HALLOWSEND = 'Да тыквится имя твое',
	AD_HALLOWSEND = 'Добейтесь всех достижений в честь Тыквовина, указанных ниже.',
	AR_HALLOWSEND = 'Наградное звание: Тыквер',
	
	AN_PUMPKIN = 'Ziemlich gruselig', --#--#--
	AD_PUMPKIN = 'Erhaltet eine Kürbistasche während der Schlotternächte.', --#--#--
	AN_HALLOWSEND_ALLIANCE_QUEST1 = 'Подпорченный праздник',
	AD_HALLOWSEND_ALLIANCE_QUEST1 = 'Выполните все задания сержанта Дыгала, чтобы испортить праздник Тыквовина Орде: сломайте Ивового человечка и уничтожьте вонючие бомбы в Южнобережье.',
	AC_HALLOWSEND_ALLIANCE_QUEST1_CRITERIA1 = 'Сорвать праздник Плетеного человека',
	AC_HALLOWSEND_ALLIANCE_QUEST1_CRITERIA2 = 'Сила сосен',
	AN_HALLOWSEND_HORDE_QUEST1 = 'Подпорченный праздник',
	AD_HALLOWSEND_HORDE_QUEST1 = 'Выполните все задания, чтобы испортить праздник Тыквовина Альянсу: съездите в Южнобережье, забросайте вражеский город бомбами и подбросьте тухлых яиц в бочки с элем.',
	AC_HALLOWSEND_HORDE_QUEST1_CRITERIA1 = 'Тухлые яйца и поломанные бочки',
	AC_HALLOWSEND_HORDE_QUEST1_CRITERIA2 = 'Чем пахнет в Южнобережье',
	
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
	
	AN_HALLOWSEND_TREATS = 'Конфета или жизнь!',
	AD_HALLOWSEND_TREATS = 'Зачерпните пригоршню конфет из кулька конфет в одной из таверн.',
	
	AN_HALLOWSEND_MASK = 'Время масок',
	AD_HALLOWSEND_MASK = 'Получите тонкую маску во время Тыквовина.',
	
	AN_HALLOWSEND_MASKS = 'Маски на все случаи жизни',
	AD_HALLOWSEND_MASKS = 'Соберите 20 тонких масок, указанных ниже.',
	
	AN_HALLOWSEND_TRANSFORM = 'Маскарад',
	AD_HALLOWSEND_TRANSFORM = 'Испытайте действие всех волшебных палочек, меняющих внешность.',
	AC_HALLOWSEND_GHOST = 'Волшебная палочка – костюм призрака',
	AC_HALLOWSEND_GNOME = 'Волшебная палочка – костюм лепрогнома',
	AC_HALLOWSEND_WISP = 'Волшебная палочка – костюм огонька',
	AC_HALLOWSEND_NINJA = 'Волшебная палочка – костюм ниндзя',
	AC_HALLOWSEND_SKELETON = 'Волшебная палочка – костюм скелета',
	AC_HALLOWSEND_PIRATE = 'Волшебная палочка – костюм пирата',
	AC_HALLOWSEND_BAT = 'Волшебная палочка – костюм летучей мыши',

    --WINTERVEIL
    AN_WINTERVEIL = 'Весельчак',
	AD_WINTERVEIL = 'Добейтесь перечисленных ниже достижений во время празднования Зимнего Покрова.',
	AR_WINTERVEIL = 'Наградное звание: Весельчак',

    AN_WINTERVEIL_METZEN = 'К Метцену!',
	AD_WINTERVEIL_METZEN = 'Спасите Метцена-северного оленя.',

    AN_WINTERVEIL_SMOKEYWOOD = 'Ох уж этот Гринч...',
	AD_WINTERVEIL_SMOKEYWOOD = 'Выполните задание, связанное с возвращением угощений Пастбищ Дымного Леса, и заслужите благодарность тех, кому помогли.',

    AN_WINTERVEIL_GOURMET = 'Зимние угощения',
	AD_WINTERVEIL_GOURMET = 'Во время Зимнего Покрова приготовьте имбирное печенье, гоголь-моголь и горячий яблочный сидр.',
    AC_WINTERVEIL_GOURMET_CRITERIA1 = 'Имбирное печенье',
    AC_WINTERVEIL_GOURMET_CRITERIA2 = 'Гоголь-моголь',

    AN_WINTERVEIL_PRESENTS = 'Подарки только послушным детишкам!',
	AD_WINTERVEIL_PRESENTS = 'Откройте один из подарков под деревом Зимнего Покрова.',

    AN_WINTERVEIL_SNOWBALL_ALLIANCE = 'Бука',
	AD_WINTERVEIL_SNOWBALL_ALLIANCE = 'Киньте снежок в короля Магни Бронзоборода во время празднования Зимнего Покрова.',

    AN_WINTERVEIL_SNOWBALL_HORDE = 'Бука',
	AD_WINTERVEIL_SNOWBALL_HORDE = 'Киньте снежок в Кэрна Кровавое Копыто во время празднования Зимнего Покрова.',

    AN_WINTERVEIL_PVP = 'С некоторой помощью моих друзей…',
    AD_WINTERVEIL_PVP = 'Одержите 50 почетных побед в облике Маленького Помощника с помощью Чудовольта Мороза.',

    --VALENTINES
    AN_VALENTINES = 'Liebestoll', --#--#--
	AD_VALENTINES = 'Schließt die unten aufgelisteten Erfolge von \'Liebe liegt in der Luft\' ab.', --#--#--

    AN_VALENTINES_ROSES = 'Sag\'s mit Rosen', --#--#--
    AD_VALENTINES_ROSES = 'Erhaltet während der \'Liebe liegt in der Luft\'-Feierlichkeiten einen roten Rosenstrauß.', --#--#--

    AN_VALENTINES_QUEST = 'Gefährliche Liebschaft', --#--#--
    AD_VALENTINES_QUEST = 'Helft dem Dampfdruckkartell dabei, den Plan der Chemiemanufaktur Krone zu vereiteln.', --#--#--

    AN_VALENTINES_CHOCOLATES = 'Naschkatze', --#--#--
    AD_VALENTINES_CHOCOLATES = 'Probiert die unten aufgelisteten \'Liebe liegt in der Luft\'-Süßigkeiten.', --#--#--
    AC_VALENTINES_CHOCOLATES_CRITERIA1 = 'Темное желание',
    AC_VALENTINES_CHOCOLATES_CRITERIA2 = 'Сливочное блаженство',
    AC_VALENTINES_CHOCOLATES_CRITERIA3 = 'Сладкий десерт',
    AC_VALENTINES_CHOCOLATES_CRITERIA4 = 'Ягодный-преягодный крем',

    AN_VALENTINES_DRESS = 'Das reizende Glück ist auf Eurer Seite', --#--#--
    AD_VALENTINES_DRESS = 'Öffnet einen reizenden Kleiderkarton und erhaltet ein reizendes schwarzes Kleid.', --#--#--

    AN_VALENTINES_PIDO = 'Perma-Pido', --#--#--
    AD_VALENTINES_PIDO = 'Erhaltet ein permanentes Q. Pido-Haustier, indem Ihr einen Echtsilberschaftpfeil erbeutet.', --#--#--

    --LUNAR
    AN_LUNAR = 'Почтение к предкам',
	AD_LUNAR = 'Добейтесь достижений Лунного фестиваля, указанных ниже.',

    AN_LUNAR_COIN = 'Монета наследия',
    AD_LUNAR_COIN = 'Получите монету наследия.',

    AN_LUNAR_COINS = '%dмонет наследия',
    AD_LUNAR_COINS = 'Соберите %dмонет наследия.',

    AN_LUNAR_QUEST = 'Благословение Элуны',
    AD_LUNAR_QUEST = 'Выполните задание "Благословение Элуны", убив Омена.',

    AN_LUNAR_CLOTHES = 'Уборы Лунного фестиваля',
    AD_LUNAR_CLOTHES = 'Приобретите праздничный костюм или праздничное платье за монеты наследия.',

    AN_LUNAR_ELDERS_DUNGEONS = 'Предки в подземельях',
    AD_LUNAR_ELDERS_DUNGEONS = 'Почтите предков, находящихся в подземельях.',
    AC_LUNAR_ELDERS_DUNGEONS_8727 = 'Urahne Fernwisper', --#--#--
    AC_LUNAR_ELDERS_DUNGEONS_8619 = 'Urahne Schwermut', --#--#--
    AC_LUNAR_ELDERS_DUNGEONS_8635 = 'Urahne Splitterfels', --#--#--
    AC_LUNAR_ELDERS_DUNGEONS_8713 = 'Urahne Sternensang', --#--#--
    AC_LUNAR_ELDERS_DUNGEONS_8644 = 'Urahne Steinwehr', --#--#--
    AC_LUNAR_ELDERS_DUNGEONS_8676 = 'Urahne Wildmähne', --#--#--

    AN_LUNAR_ELDERS_HORDE = 'Предки Орды',
    AD_LUNAR_ELDERS_HORDE = 'Почтите предков, находящихся в главных городах Орды.',
    AC_LUNAR_ELDERS_HORDE_8678 = 'Предок Пшеничная Грива в Громовом Утесе',
    AC_LUNAR_ELDERS_HORDE_8648 = 'Предок Черносерд в Подгороде',
    AC_LUNAR_ELDERS_HORDE_8677 = 'Предок Темный Рог в Оргриммаре',

    AN_LUNAR_ELDERS_ALLIANCE = 'Предки Альянса',
    AD_LUNAR_ELDERS_ALLIANCE = 'Почтите предков, находящихся в главных городах Альянса.',
    AC_LUNAR_ELDERS_ALLIANCE_8718 = 'Предок Быстрый Клинок в Дарнасе',
    AC_LUNAR_ELDERS_ALLIANCE_8866 = 'Предок Бронзобород в Стальгорне',
    AC_LUNAR_ELDERS_ALLIANCE_8646 = 'Предок Молотозвон в Штормграде',

    AN_LUNAR_ELDERS_EASTERN_KINGDOMS = 'Предки Восточных королевств',
    AD_LUNAR_ELDERS_EASTERN_KINGDOMS = 'Почтите предков в Восточных королевствах.',
    AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8636 = 'Предок Скалогром в Пылающих степях',
    AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8651 = 'Предок Сталекрут в Тлеющем ущелье',
    AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8652 = 'Предок Могильный Холм в Брилле',
    AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8674 = 'Предок Заиндевевшее Копыто в Пиратской Бухте',
    AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8716 = 'Предок Звездный Луг в Зул\'Гурубе',
    AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8643 = 'Предок Крутой Утес во Внутренних землях',
    AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8675 = 'Предок Небесная Охотница на Сторожевом холме',
    AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8649 = 'Предок Штормоскал в Златоземье',
    AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8650 = 'Предок Снежнокрон в часовне Последней Надежды',
    AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8642 = 'Предок Среброжил в Телсамаре',
    AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8645 = 'Предок Обсидиан у Гробницы',
    AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8722 = 'Предок Луговой Ручей в Западных Чумных землях',
    AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8647 = 'Предок Грозояр в Выжженных землях',
    AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8653 = 'Предок Златокладезь в Караносе',
    AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8714 = 'Предок Лунная Заря у Некроситета',
    AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8688 = 'Предок Вестник Ветров в Восточных Чумных землях',
    AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8683 = 'Предок Рассветная Странница в Пламенеющем Стяге',

    AN_LUNAR_ELDERS_KALIMDOR = 'Предки Калимдора',
    AD_LUNAR_ELDERS_KALIMDOR = 'Почтите предков в Калимдоре.',
    AC_LUNAR_ELDERS_KALIMDOR_8673 = 'Предок Кровавое Копыто в деревне Кровавого Копыта',
    AC_LUNAR_ELDERS_KALIMDOR_8723 = 'Предок Ночной Ветер в Оскверненном лесу',
    AC_LUNAR_ELDERS_KALIMDOR_8684 = 'Предок Толкователь Снов в Прибамбасске',
    AC_LUNAR_ELDERS_KALIMDOR_8726 = 'Предок Сияющее Копье в Зимних Ключах',
    AC_LUNAR_ELDERS_KALIMDOR_8725 = 'Предок Речная Песня в Астранааре',
    AC_LUNAR_ELDERS_KALIMDOR_8715 = 'Предок Остролист из Доланаара',
    AC_LUNAR_ELDERS_KALIMDOR_8681 = 'Предок Громовой Рог в Ун\'Горо',
    AC_LUNAR_ELDERS_KALIMDOR_8680 = 'Предок Тотем Ветра в Кабестане',
    AC_LUNAR_ELDERS_KALIMDOR_8720 = 'Предок Небесный Отблеск в Азшаре',
    AC_LUNAR_ELDERS_KALIMDOR_8670 = 'Предок Рунический Тотем в Колючем Холме',
    AC_LUNAR_ELDERS_KALIMDOR_8672 = 'Предок Каменное Копье в Круговзоре',
    AC_LUNAR_ELDERS_KALIMDOR_8686 = 'Предок Высокогор в лагере Таурахо',
    AC_LUNAR_ELDERS_KALIMDOR_8654 = 'Предок Первокамень в Силитусе',
    AC_LUNAR_ELDERS_KALIMDOR_8671 = 'Предок Тотем Ярости в Танарисе',
    AC_LUNAR_ELDERS_KALIMDOR_8724 = 'Предок Утренняя Роса у Виражей на Миражах',
    AC_LUNAR_ELDERS_KALIMDOR_8685 = 'Предок Странница Туманов в Забытом городе',
    AC_LUNAR_ELDERS_KALIMDOR_8721 = 'Предок Звездная Пряжа в Аубердине',
    AC_LUNAR_ELDERS_KALIMDOR_8717 = 'Предок Лунный Страж у Перекрестка',
    AC_LUNAR_ELDERS_KALIMDOR_8719 = 'Предок Песнь Клинка в крепости Кенария',
    AC_LUNAR_ELDERS_KALIMDOR_8682 = 'Предок Небесный Провидец на заставе Вольного Ветра',
    AC_LUNAR_ELDERS_KALIMDOR_8679 = 'Предок Зловещий Тотем в Фераласе',

    --NOBLEGARDEN
    AN_NOBLEGARDEN_CLOTHES = 'Воскресный костюм',
    AD_NOBLEGARDEN_CLOTHES = 'Найдите белую рубашку под смокинг и черные брюки под смокинг в раскрашенных яйцах во время празднования Сада чудес.',
    AC_NOBLEGARDEN_CLOTHES_CRITERIA1 = 'Белая рубашка под смокинг',
    AC_NOBLEGARDEN_CLOTHES_CRITERIA2 = 'Черные брюки под смокинг',

    AN_NOBLEGARDEN_DRESS = 'Дорого платье к Саду чудес',
    AD_NOBLEGARDEN_DRESS = 'Найдите элегантное платье в раскрашенных яйцах во время празднования Сада чудес.',

    --CHILDRENS WEEK
    AN_CHILDREN = 'Все лучшее – детям',
    AD_CHILDREN = 'Добейтесь достижений Детской недели, указанных ниже.',
    AR_CHILDREN = 'Наградное звание: Благодетель',

    AN_CHILDREN_PET = 'Какая лапочка!',
    AD_CHILDREN_PET = 'Получите одного из спутников за участие в Детской неделе.',

    AN_CHILDREN_PETS = 'Заслуженная няня',
    AD_CHILDREN_PETS = 'Соберите Яйцо Эгберта, Вилли-соню и Дрессировочный ошейник элекка одним персонажем.',
    AC_CHILDREN_PETS1 = 'Дрессировочный ошейник элекка',
    AC_CHILDREN_PETS2 = 'Вилли-соня',
    AC_CHILDREN_PETS3 = 'Яйцо Эгберта',

    --MIDSUMMER
    AN_MIDSUMMER = 'Хранитель огня',
    AD_MIDSUMMER = 'Добейтесь указанных ниже достижений на празднике Огненного солнцеворота.',

    AN_MIDSUMMER_QUEST1 = 'Король Огненного Солнцеворота',
    AD_MIDSUMMER_QUEST1 = 'Выполните задание "Награда вора", похитив огни из вражеских столиц.',

    AN_MIDSUMMER_AHUNE = 'Заморозить Повелителя Холода',
    AD_MIDSUMMER_AHUNE = 'Убейте Ахуна в Узилище.',

    AN_MIDSUMMER_DESECRATION_HORDE = 'Осквернение огней Альянса',
    AD_MIDSUMMER_DESECRATION_HORDE = 'Погасите костры в Восточных королевствах, Калимдоре и Запределье.',

    AN_MIDSUMMER_DESECRATION_HORDE_KALIMDOR = 'Погасить костры Калимдора',
    AD_MIDSUMMER_DESECRATION_HORDE_KALIMDOR = 'Оскверните праздничные костры Альянса в Калимдоре.',
    AC_MIDSUMMER_DESECRATION_HORDE_KALIMDOR_CRITERIA_11744 = 'Пылевые топи',
    AC_MIDSUMMER_DESECRATION_HORDE_KALIMDOR_CRITERIA_11734 = 'Ясеневый лес',
    AC_MIDSUMMER_DESECRATION_HORDE_KALIMDOR_CRITERIA_11738 = 'Остров Кровавой Дымки',
    AC_MIDSUMMER_DESECRATION_HORDE_KALIMDOR_CRITERIA_11740 = 'Темные берега',
    AC_MIDSUMMER_DESECRATION_HORDE_KALIMDOR_CRITERIA_11746 = 'Фералас',
    AC_MIDSUMMER_DESECRATION_HORDE_KALIMDOR_CRITERIA_11760 = 'Силитус',
    AC_MIDSUMMER_DESECRATION_HORDE_KALIMDOR_CRITERIA_11753 = 'Тельдрассил',
    AC_MIDSUMMER_DESECRATION_HORDE_KALIMDOR_CRITERIA_11762 = 'Танарис',
    AC_MIDSUMMER_DESECRATION_HORDE_KALIMDOR_CRITERIA_11741 = 'Пустоши',
    AC_MIDSUMMER_DESECRATION_HORDE_KALIMDOR_CRITERIA_11763 = 'Зимние Ключи',
    AC_MIDSUMMER_DESECRATION_HORDE_KALIMDOR_CRITERIA_11735 = 'Остров Лазурной Дымки',

    AN_MIDSUMMER_DESECRATION_HORDE_OUTLAND = 'Погасить костры Запределья',
    AD_MIDSUMMER_DESECRATION_HORDE_OUTLAND = 'Оскверните праздничные костры Альянса в Запределье.',
    AC_MIDSUMMER_DESECRATION_HORDE_OUTLAND_CRITERIA_11736 = 'Острогорье',
    AC_MIDSUMMER_DESECRATION_HORDE_OUTLAND_CRITERIA_11750 = 'Награнд',
    AC_MIDSUMMER_DESECRATION_HORDE_OUTLAND_CRITERIA_11759 = 'Пустоверть',
    AC_MIDSUMMER_DESECRATION_HORDE_OUTLAND_CRITERIA_11752 = 'Долина Призрачной Луны',
    AC_MIDSUMMER_DESECRATION_HORDE_OUTLAND_CRITERIA_11754 = 'Лес Тероккар',
    AC_MIDSUMMER_DESECRATION_HORDE_OUTLAND_CRITERIA_11758 = 'Зангартопь',
    AC_MIDSUMMER_DESECRATION_HORDE_OUTLAND_CRITERIA_11747 = 'Полуостров Адского Пламени',

    AN_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS = 'Погасить костры Восточных королевств',
    AD_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS = 'Оскверните праздничные костры Альянса в Восточных королевствах.',
    AC_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS_CRITERIA_11751 = 'Красногорье',
    AC_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS_CRITERIA_11742 = 'Дун Морог',
    AC_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS_CRITERIA_11745 = 'Элвиннский лес',
    AC_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS_CRITERIA_11749 = 'Лок Модан',
    AC_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS_CRITERIA_11732 = 'Нагорье Арати',
    AC_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS_CRITERIA_11739 = 'Пылающие степи',
    AC_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS_CRITERIA_11761 = 'Тернистая долина',
    AC_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS_CRITERIA_11755 = 'Внутренние земли',
    AC_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS_CRITERIA_11756 = 'Западные Чумные земли',
    AC_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS_CRITERIA_11581 = 'Западный край',
    AC_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS_CRITERIA_11748 = 'Предгорья Хилсбрада',
    AC_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS_CRITERIA_11737 = 'Выжженные земли',
    AC_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS_CRITERIA_11743 = 'Сумеречный лес',
    AC_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS_CRITERIA_11757 = 'Болотина',

    AN_MIDSUMMER_DESECRATION_ALLIANCE = 'Осквернение костров Орды',
    AD_MIDSUMMER_DESECRATION_ALLIANCE = 'Погасите костры в Восточных королевствах, Калимдоре и Запределье.',

    AN_MIDSUMMER_DESECRATION_ALLIANCE_KALIMDOR = 'Погасить костры Калимдора',
    AD_MIDSUMMER_DESECRATION_ALLIANCE_KALIMDOR = 'Оскверните праздничные костры Орды в Калимдоре.',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_KALIMDOR_CRITERIA_11803 = 'Зимние Ключи',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_KALIMDOR_CRITERIA_11785 = 'Тысяча Игл',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_KALIMDOR_CRITERIA_11765 = 'Ясеневый лес',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_KALIMDOR_CRITERIA_11769 = 'Пустоши',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_KALIMDOR_CRITERIA_11773 = 'Фералас',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_KALIMDOR_CRITERIA_11777 = 'Мулгор',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_KALIMDOR_CRITERIA_11800 = 'Силитус',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_KALIMDOR_CRITERIA_11780 = 'Когтистые горы',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_KALIMDOR_CRITERIA_11802 = 'Танарис',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_KALIMDOR_CRITERIA_11783 = 'Степи',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_KALIMDOR_CRITERIA_11770 = 'Дуротар',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_KALIMDOR_CRITERIA_11771 = 'Пылевые топи',

    AN_MIDSUMMER_DESECRATION_ALLIANCE_OUTLAND = 'Погасить костры Запределья',
    AD_MIDSUMMER_DESECRATION_ALLIANCE_OUTLAND = 'Оскверните праздничные костры Орды в Запределье.',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_OUTLAND_CRITERIA_11767 = 'Острогорье',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_OUTLAND_CRITERIA_11799 = 'Пустоверть',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_OUTLAND_CRITERIA_11782 = 'Лес Тероккар',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_OUTLAND_CRITERIA_11775 = 'Полуостров Адского Пламени',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_OUTLAND_CRITERIA_11787 = 'Зангартопь',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_OUTLAND_CRITERIA_11778 = 'Награнд',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_OUTLAND_CRITERIA_11779 = 'Долина Призрачной Луны',

    AN_MIDSUMMER_DESECRATION_ALLIANCE_EASTERN_KINGDOMS = 'Погасить костры Восточных королевств',
    AD_MIDSUMMER_DESECRATION_ALLIANCE_EASTERN_KINGDOMS = 'Оскверните праздничные костры Орды в Восточных королевствах.',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11766 = 'Бесплодные земли',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11772 = 'Леса Вечной Песни',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11774 = 'Призрачные земли',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11776 = 'Предгорья Хилсбрада',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11768 = 'Пылающие степи',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11781 = 'Болото Печали',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11764 = 'Нагорье Арати',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11580 = 'Серебряный бор',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11801 = 'Тернистая долина',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11784 = 'Внутренние земли',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11786 = 'Тирисфальские леса',

    AN_MIDSUMMER_FLAME_KEEPER_HORDE = 'Огни Азерота',
    AD_MIDSUMMER_FLAME_KEEPER_HORDE = 'Выполните задания "Хранитель огня" в Калимдоре, Восточных королевствах и Запределье.',

    AN_MIDSUMMER_FLAME_KEEPER_HORDE_KALIMDOR = 'Хранитель огня Калимдора',
    AD_MIDSUMMER_FLAME_KEEPER_HORDE_KALIMDOR = 'Почтите огни Калимдора.',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_KALIMDOR_CRITERIA_11841 = 'Ясеневый лес',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_KALIMDOR_CRITERIA_11845 = 'Пустоши',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_KALIMDOR_CRITERIA_11846 = 'Дуротар',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_KALIMDOR_CRITERIA_11847 = 'Пылевые топи',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_KALIMDOR_CRITERIA_11849 = 'Фералас',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_KALIMDOR_CRITERIA_11852 = 'Мулгор',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_KALIMDOR_CRITERIA_11859 = 'Степи',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_KALIMDOR_CRITERIA_11839 = 'Зимние Ключи',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_KALIMDOR_CRITERIA_11836 = 'Силитус',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_KALIMDOR_CRITERIA_11856 = 'Когтистые горы',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_KALIMDOR_CRITERIA_11861 = 'Тысяча Игл',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_KALIMDOR_CRITERIA_11838 = 'Танарис',

    AN_MIDSUMMER_FLAME_KEEPER_HORDE_OUTLAND = 'Хранитель огня Запределья',
    AD_MIDSUMMER_FLAME_KEEPER_HORDE_OUTLAND = 'Почтите огни Запределья.',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_OUTLAND_CRITERIA_11851 = 'Полуостров Адского Пламени',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_OUTLAND_CRITERIA_11835 = 'Пустоверть',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_OUTLAND_CRITERIA_11855 = 'Долина Призрачной Луны',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_OUTLAND_CRITERIA_11858 = 'Лес Тероккар',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_OUTLAND_CRITERIA_11854 = 'Награнд',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_OUTLAND_CRITERIA_11863 = 'Зангартопь',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_OUTLAND_CRITERIA_11843 = 'Острогорье',

    AN_MIDSUMMER_FLAME_KEEPER_HORDE_EASTERN_KINGDOMS = 'Хранитель огня Восточных королевств',
    AD_MIDSUMMER_FLAME_KEEPER_HORDE_EASTERN_KINGDOMS = 'Почтите огни Восточных королевств.',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_EASTERN_KINGDOMS_CRITERIA_11844 = 'Пылающие степи',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_EASTERN_KINGDOMS_CRITERIA_11840 = 'Нагорье Арати',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_EASTERN_KINGDOMS_CRITERIA_11584 = 'Серебряный бор',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_EASTERN_KINGDOMS_CRITERIA_11837 = 'Тернистая долина',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_EASTERN_KINGDOMS_CRITERIA_11860 = 'Внутренние земли',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_EASTERN_KINGDOMS_CRITERIA_11850 = 'Призрачные земли',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_EASTERN_KINGDOMS_CRITERIA_11862 = 'Тирисфальские леса',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_EASTERN_KINGDOMS_CRITERIA_11853 = 'Предгорья Хилсбрада',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_EASTERN_KINGDOMS_CRITERIA_11848 = 'Леса Вечной Песни',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_EASTERN_KINGDOMS_CRITERIA_11857 = 'Болото Печали',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_EASTERN_KINGDOMS_CRITERIA_11842 = 'Бесплодные земли',

    AN_MIDSUMMER_FLAME_KEEPER_ALLIANCE = 'Огни Азерота',
    AD_MIDSUMMER_FLAME_KEEPER_ALLIANCE = 'Выполните задания "Страж огня" в Калимдоре, Восточных королевствах и Запределье.',

    AN_MIDSUMMER_FLAME_KEEPER_ALLIANCE_KALIMDOR = 'Хранитель огня Калимдора',
    AD_MIDSUMMER_FLAME_KEEPER_ALLIANCE_KALIMDOR = 'Почтите огни Калимдора.',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_KALIMDOR_CRITERIA_11833 = 'Танарис',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_KALIMDOR_CRITERIA_11805 = 'Ясеневый лес',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_KALIMDOR_CRITERIA_11809 = 'Остров Кровавой Дымки',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_KALIMDOR_CRITERIA_11812 = 'Пустоши',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_KALIMDOR_CRITERIA_11817 = 'Фералас',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_KALIMDOR_CRITERIA_11824 = 'Тельдрассил',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_KALIMDOR_CRITERIA_11806 = 'Остров Лазурной Дымки',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_KALIMDOR_CRITERIA_11834 = 'Зимние Ключи',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_KALIMDOR_CRITERIA_11831 = 'Силитус',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_KALIMDOR_CRITERIA_11815 = 'Пылевые топи',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_KALIMDOR_CRITERIA_11811 = 'Темные берега',

    AN_MIDSUMMER_FLAME_KEEPER_ALLIANCE_OUTLAND = 'Страж огня Запределья',
    AD_MIDSUMMER_FLAME_KEEPER_ALLIANCE_OUTLAND = 'Почтите огни Запределья.',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_OUTLAND_CRITERIA_11807 = 'Острогорье',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_OUTLAND_CRITERIA_11830 = 'Пустоверть',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_OUTLAND_CRITERIA_11823 = 'Долина Призрачной Луны',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_OUTLAND_CRITERIA_11829 = 'Зангартопь',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_OUTLAND_CRITERIA_11818 = 'Полуостров Адского Пламени',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_OUTLAND_CRITERIA_11821 = 'Награнд',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_OUTLAND_CRITERIA_11825 = 'Лес Тероккар',

    AN_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS = 'Страж огня Восточных королевств',
    AD_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS = 'Почтите огни Восточных королевств.',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11816 = 'Элвиннский лес',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11810 = 'Пылающие степи',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11813 = 'Дун Морог',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11822 = 'Красногорье',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11832 = 'Тернистая долина',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11826 = 'Внутренние земли',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11583 = 'Западный край',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11827 = 'Западные Чумные земли',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11808 = 'Выжженные земли',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11819 = 'Предгорья Хилсбрада',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11814 = 'Сумеречный лес',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11820 = 'Лок Модан',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11804 = 'Нагорье Арати',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11828 = 'Болотина',

    --BREWFEST
    AN_BREWFEST = 'Хмелевар',
    AD_BREWFEST = 'Добейтесь указанных ниже достижений на Хмельном фестивале.',
    AR_BREWFEST = 'Наградное звание: Хмелевар',

    AN_BREWFEST_WOLPERTINGER = 'Что лопают зайцелопы?',
    AD_BREWFEST_WOLPERTINGER = 'Получите спутника зайцелопа.',

    AN_BREWFEST_COREN_DIREBREW = 'Фестиваль худоварева',
    AD_BREWFEST_COREN_DIREBREW = 'Убейте Корена Худовара.',

    AN_BREWFEST_QUEST1 = 'Покончить с Черным Железом',
    AD_BREWFEST_QUEST1 = 'Защитите лагерь Хмельного фестиваля от нападения дворфов Черного Железа и выполните задание "Однажды, напившись в..."',

    AN_BREWFEST_BEER_CLUB = '"Пиво месяца"',
    AD_BREWFEST_BEER_CLUB = 'Станьте членом клуба "Пиво месяца".',

    AN_BREWFEST_MOUNT = 'С бочкой едешь – дальше будешь',
    AD_BREWFEST_MOUNT = 'Получите верховое животное Хмельного фестиваля или превратите в него свое средство передвижения, используя пивные дрожжи.',

    --LONG TRIP
    AC_WORLDEVENTS_TRIP = 'Долгое и странное путешествие',
    AD_WORLDEVENTS_TRIP = 'Получите все нижеперечисленные достижения игровых событий.',

	--BURNING CRUSADE
    AN_DOLCE = 'У меня "Большущая" сумка!',
    AD_DOLCE = 'Экипируйтесь "Большущей" сумкой Псении Кобчак.',

    AN_QUESTS_HELLFIRE_PENINSULA = 'Из огня да в полымя',
    AD_QUESTS_HELLFIRE_PENINSULA = 'Выполните 80 заданий на Полуострове Адского Пламени.',
    TBC_QUEST_10388 = 'Haltet die Brennende Legion auf', --#--#--
    TBC_QUEST_10389 = 'Grausame Pläne', --#--#--
    TBC_QUEST_10876 = 'Die Hand von Kargath', --#--#--
    TBC_QUEST_10258 = 'Застава Хребтолома',
    TBC_QUEST_9406 = 'Маг\'хары',
    TBC_QUEST_9370 = 'Соколиный дозор',
    TBC_QUEST_10351 = 'Кенарийская застава',

    TBC_QUEST_10397 = 'Haltet die Brennende Legion auf', --#--#--
    TBC_QUEST_10400 = 'Stürzt den Oberanführer', --#--#--
    TBC_QUEST_9545 = 'Die Suche nach Sedai', --#--#--
    TBC_QUEST_10935 = 'Der Exorzismus des Oberst Jules', --#--#--
    TBC_QUEST_10937 = 'Die Züchtigung des Drillmeisters', --#--#--
    TBC_QUEST_9383 = 'Храм Телхамат',
    TBC_QUEST_10630 = 'Grün, aber kein Orc', --#--#--
    
    AN_QUESTS_ZANGARMASH = 'Тайны топи',
    AD_QUESTS_ZANGARMASH = 'Выполните 54 задания в Зангартопи.',
    TBC_QUEST_9772 = 'Застава Болотной Крысы',
    TBC_QUEST_9904 = 'Забра\'джин',
    TBC_QUEST_10118 = 'Die Verteidigung von Zabra\'jin', --#--#--
    TBC_QUEST_9803 = 'Draeneidiplomatie', --#--#--
    TBC_QUEST_9783 = 'Телредор',
    TBC_QUEST_9902 = 'Прибежище Оребор',
    TBC_QUEST_9709 = 'DIESE Pilze solltet Ihr nicht essen!', --#--#--
    TBC_QUEST_9732 = 'Trockenlegung der Marschen', --#--#--
    TBC_QUEST_9788 = 'Rettung der Sporloks', --#--#--
    TBC_QUEST_9726 = 'Ein Ausflug mit dem Sporlingen', --#--#--
    
    AN_QUESTS_TERROKAR = 'Террор в Тероккаре',
    AD_QUESTS_TERROKAR = 'Выполните 63 задания в Тероккарском лесу.',
    TBC_QUEST_10879 = 'Offensive aus Skettis', --#--#--
    TBC_QUEST_10881 = 'Караван беженцев',
    TBC_QUEST_10915 = 'Лагерь Ша\'тар',
    TBC_QUEST_9951 = 'Das Geheimnis des Aufsehers', --#--#--
    TBC_QUEST_10042 = 'Бастион Аллерии',
    TBC_QUEST_10043 = 'Форт Камнеломов',
    
    AN_QUESTS_NAGRAND = 'Гром в Награнде',
    AD_QUESTS_NAGRAND = 'Выполните 75 заданий в Награнде.',
    TBC_QUEST_10172 = 'Geburt eines Kriegshäuptlings', --#--#--
    TBC_QUEST_9977 = 'Кольцо Крови',
    TBC_QUEST_9853 = 'Трон стихий',
    TBC_QUEST_9934 = 'Lantresor von der Klinge', --#--#--
    TBC_QUEST_9868 = 'Die Finsterblutzerschlagenen', --#--#--
    TBC_QUEST_9937 = 'Bedrohungen für Nagrand', --#--#--
    TBC_QUEST_9852 = 'Опасный спорт',
    TBC_QUEST_9925 = 'Begegnung mit den Astralen', --#--#--
    TBC_QUEST_9955 = 'Die Abenteuer von Corki', --#--#--
    TBC_QUEST_9933 = 'Lantresor von der Klinge', --#--#--
    TBC_QUEST_9873 = 'Die Finsterblutzerschlagenen', --#--#--
    TBC_QUEST_10011 = 'Bedrohungen für Nagrand', --#--#--
    
    AN_QUESTS_BLADES_EDGE_MTNS = 'На пиках скал',
    AD_QUESTS_BLADES_EDGE_MTNS = 'Выполните 86 заданий в Острогорье.',
    TBC_QUEST_10504 = 'Сильванаар',
    TBC_QUEST_10671 = 'Станция Тошли',
    TBC_QUEST_10806 = 'Die Gronnbedrohung', --#--#--
    TBC_QUEST_10505 = 'Оплот Громоборцев',
    TBC_QUEST_10742 = 'Zusammenführung', --#--#--
    TBC_QUEST_10867 = 'Die Mok\'Nathal', --#--#--
    TBC_QUEST_10748 = 'Чащоба Рууан',
    
    AN_QUESTS_NETHERSTORM = 'В Пустоту',
    AD_QUESTS_NETHERSTORM = 'Выполните 120 заданий в Пустоверти.',
    TBC_QUEST_10409 = 'Socrethar', --#--#--
    TBC_QUEST_10240 = 'Аметистовая башня',
    TBC_QUEST_10249 = 'Beschützt Area 52!', --#--#--
    TBC_QUEST_10439 = 'Zerstörung des Allesverschlingenden', --#--#--
    TBC_QUEST_10221 = 'Bau der X-52 Netherrakete', --#--#--
    TBC_QUEST_10276 = 'Консорциум',
    
    AN_QUESTS_SHADOWMOON = 'Тень Предателя',
    AD_QUESTS_SHADOWMOON = 'Выполните 90 заданий в Долине Призрачной Луны.',
    TBC_QUEST_10744 = 'Nachricht vom Sieg', --#--#--
    TBC_QUEST_11041 = 'Кряж Крыльев Пустоты',
    TBC_QUEST_10645 = 'Der erste Todesritter', --#--#--
    TBC_QUEST_10651 = 'Geliehene Macht', --#--#--
    TBC_QUEST_11052 = 'Akamas Versprechen', --#--#--
    TBC_QUEST_10588 = 'Die Litanei der Verdammnis', --#--#--
    TBC_QUEST_10679 = 'Antidämonenwaffen', --#--#--
    TBC_QUEST_10808 = 'Der Dunkle Rat', --#--#--
	
	AN_HEMET_QUESTS_NAGRAND = 'Холмы как белые элекки',
	AD_HEMET_QUESTS_NAGRAND = 'Выполните все задания Хеминга Эрнестуэя в Награнде, включая финальное – "Опасный спорт".',

    HEROIC_NAME_PATTERN = 'Heroisch: %s', --#--#--
    HEROIC_DESCRIPTION_PATTERN = '%s auf dem Schwierigkeitsgrad \'Heroisch\'', --#--#--

    AN_HELLFIRE_RAMPARTS = 'Бастионы Адского Пламени',
    AD_HELLFIRE_RAMPARTS = 'Убейте Омора Неодолимого.',
    AC_BOSS_17308 = 'Омор Неодолимый',
    AC_BOSS_17537 = 'Вазруден Глашатай',
	AC_BOSS_17306 = 'Wachhabender Gargolmar', --#--#--

    AN_BLOOD_FURNACE = 'Кузня Крови',
    AD_BLOOD_FURNACE = 'Убейте Кели\'дана Разрушителя.',

    AN_SLAVE_PENS = 'Узилище',
    AD_SLAVE_PENS = 'Убейте Зыбуна.',

    AN_UNDERBOG = 'Нижетопь',
    AD_UNDERBOG = 'Убейте Черную Охотницу.',

    AN_MANA_TOMBS = 'Гробницы маны',
    AD_MANA_TOMBS = 'Убейте Принца Шаффара.',

    AN_AUCHENAI_CRYPTS = 'Аукенайские гробницы',
    AD_AUCHENAI_CRYPTS = 'Убейте экзарха Маладаара.',

    AN_OLD_HILLSBRAD = 'Побег из Дарнхольда',
    AD_OLD_HILLSBRAD = 'Убейте Охотника Вечности.',

    AN_SETHEKK_HALLS = 'Сетеккские залы',
    AD_SETHEKK_HALLS = 'Убейте Короля воронов Айкисса.',

    AN_STEAMVAULT = 'Паровое подземелье',
    AD_STEAMVAULT = 'Убейте полководца Калитреша.',

    AN_SHADOW_LABYRINTH = 'Темный лабиринт',
    AD_SHADOW_LABYRINTH = 'Убейте Бормотуна.',

    AN_SHATTERED_HALLS = 'Разрушенные залы',
    AD_SHATTERED_HALLS = 'Убейте вождя Каргата Острорука.',

    AN_BLACK_MORASS = 'Открытие Темного портала',
    AD_BLACK_MORASS = 'Убейте Эонуса.',

    AN_BOTANICA = 'Ботаника',
    AD_BOTANICA = 'Убейте Узлодревня.',

    AN_MECHANAR = 'Механар',
    AD_MECHANAR = 'Убейте Паталеона Вычислителя.',

    AN_ARCATRAZ = 'Аркатрац',
    AD_ARCATRAZ = 'Убейте Предвестника Скайрисса.',
	
	AN_MAGISTERS_TERRACE = 'Терраса Магистров',
    AD_MAGISTERS_TERRACE = 'Убейте Кель\'таса Солнечного Скитальца.',
	
	AN_TBC_DUNGEONS = 'Повелитель подземелий Запределья',
    AD_TBC_DUNGEONS = 'Добейтесь указанных ниже достижений в подземельях The Burning Crusade.',

    AN_TBC_DUNGEONS_HERO = 'Покоритель подземелий Запределья',
    AD_TBC_DUNGEONS_HERO = 'Выполните в подземельях The Burning Crusade указанные ниже задания в героическом режиме.',

    AN_OUTLAND_HERO = 'Held der Scherbenwelt', --#--#--
    AD_OUTLAND_HERO = 'Schließt die unten aufgelisteten Schlachtzugserfolge ab.', --#--#--
    AR_OUTLAND_HERO = 'Held der Scherbenwelt', --#--#--
    
    AN_OUTLAND_GREAT_HERO = 'Großartiger Held der Scherbenwelt', --#--#--
    AD_OUTLAND_GREAT_HERO = 'Schließt die unten aufgelisteten Dungeon- und Schlachtzugserfolge ab.', --#--#--
    AR_OUTLAND_GREAT_HERO = 'Großartiger Held der Scherbenwelt', --#--#--

    AN_RAVEN_LORD = 'Поводья повелителя воронов',
    AD_RAVEN_LORD = 'Получите поводья повелителя воронов от Анзу в Сетеккских залах.',

    AN_KARAZHAN = 'Каражан',
    AD_KARAZHAN = 'Убейте принца Малчезара в Каражане.',

    AN_GRUUL = 'Логово Груула',
    AD_GRUUL = 'Убейте Груула Драконобоя в его логове.',

    AN_MAGTHERIDON = 'Логово Магтеридона',
    AD_MAGTHERIDON = 'Убейте Магтеридона в его логове.',
	
	AN_ZULAMAN = 'Зул\'Аман',
	AD_ZULAMAN = 'Убейте Зул\'Джина в Зул\'Амане в рейдовом подземелье.',
	
	AN_SUNWELL = 'Плато Солнечного Колодца',
	AD_SUNWELL = 'Убейте Кил\'джедена на плато Солнечного Колодца.',

    AN_TBC_PHASE_1 = 'Поход по Запределью',
    AD_TBC_PHASE_1 = 'Выполните в подземельях The Burning Crusade указанные ниже задания.',
    AN_TBC_PHASE_2 = 'Поход по Запределью',
    AD_TBC_PHASE_2 = 'Выполните в подземельях The Burning Crusade указанные ниже задания.',
    AN_TBC_PHASE_3 = 'Поход по Запределью',
    AD_TBC_PHASE_3 = 'Выполните в подземельях The Burning Crusade указанные ниже задания.',
	AN_TBC_PHASE_4 = 'Поход по Запределью',
    AD_TBC_PHASE_4 = 'Выполните в подземельях The Burning Crusade указанные ниже задания.',
	AN_TBC_PHASE_5 = 'Поход по Запределью',
    AD_TBC_PHASE_5 = 'Выполните в подземельях The Burning Crusade указанные ниже задания.',
	
    FACTION_946 = 'Оплот Чести',
    FACTION_947 = 'Траллмар',
    FACTION_942 = 'Кенарийская экспедиция',
    FACTION_1011 = 'Нижний город',
    FACTION_989 = 'Хранители Времени',
    FACTION_935 = 'Ша\'тар',
	FACTION_609 = 'Круг Кенария',

    AN_TBC_DUNGEON_REPUTATIONS = 'Пламенный Рыцарь',
    AD_TBC_DUNGEON_REPUTATIONS = 'Добейтесь того, чтобы вас превозносили все фракции дополнения The Burning Crusade, отношения с которыми можно улучшить, сражаясь в подземельях.',
	
	AN_CENARION_CIRCLE = 'Защитник Кенария',
    AD_CENARION_CIRCLE = 'Добейтесь того, чтобы вас превозносили Круг Кенария и Кенарийская экспедиция.',

    AN_SHATTRATH_REP = 'Раздел Шаттрата',
    AD_SHATTRATH_REP = 'Добейтесь того, чтобы вас превозносили Провидцы или Алдоры.',

    AN_OGRILA = 'С ограми поведешься, от огров и наберешься',
    AD_OGRILA = 'Добейтесь того, чтобы вас превозносили в Огри\'ле.',

    AN_SPOREGGAR = 'Царь Спореггара',
    AD_SPOREGGAR = 'Добейтесь того, чтобы вас превозносил Спореггар.',

    AN_CONSORTIUM = 'Главный превозносительный директор',
    AD_CONSORTIUM = 'Добейтесь того, чтобы вас превозносил Консорциум.',

    AN_MAGHAR = 'Маг\'хар из Дренора',
    AD_MAGHAR = 'Добейтесь того, чтобы вас превозносили маг\'хары.',

    AN_KURENAI = 'Ай, Куренай!',
    AD_KURENAI = 'Добейтесь того, чтобы вас превозносили Куренай.',

    AN_NETHERWINGS = 'На крыльях Пустоты',
    AD_NETHERWINGS = 'Добейтесь того, чтобы вас превозносили Крылья Пустоты.',

    AN_SKYSHATTERED = 'Небокрушитель',
    AD_SKYSHATTERED = 'Победите Капитана Небокрушителя в гонках Драконьей Пасти на кряже Крыльев Пустоты.',

    AN_AMETHYST_EYE = 'Аметистовое Око',
    AD_AMETHYST_EYE = 'Добейтесь того, чтобы вас превозносило Аметистовое Око.',

    AN_SCALE_OF_THE_SANDS = 'Песчаная Чешуя',
    AD_SCALE_OF_THE_SANDS = 'Добейтесь того, чтобы вас превозносили в Песчаной Чешуе.',

    AN_ASHTONGUE_DEATHSWORN = 'Служитель Смерти',
    AD_ASHTONGUE_DEATHSWORN = 'Добейтесь того, чтобы вас превозносили Пеплоусты-служители.',

    AN_SHATTERED_SUN = 'Солнечный удар',
    AD_SHATTERED_SUN = 'Добейтесь того, чтобы вас превозносила Армия Расколотого Солнца.',

    AN_SKYGUARD = 'Пролетая над гнездами Скеттиса',
    AD_SKYGUARD = 'Добейтесь того, чтобы вас превозносили Стражи Небес Ша\'тар.',

    AN_HIPPOGRYPH = 'Кенарийский боевой гиппогриф',
    AD_HIPPOGRYPH = 'Получите кенарийского боевого гиппогрифа у Кенарийской экспедиции в Зангартопи.',

    AN_DIPLOMAT = 'Дипломат',
    AD_DIPLOMAT_ALLIANCE = 'Добейтесь того, чтобы Крепость Древобрюхов, Спореггар и куренай изменили отношение к вам с неприязни на превознесение.',
    AD_DIPLOMAT_HORDE = 'Добейтесь того, чтобы Крепость Древобрюхов, Спореггар и маг\'хары изменили отношение к вам с неприязни на превознесение.',
    AC_DIPLOMAT_576 = 'Превознесение в Крепости Древобрюхов',
    AC_DIPLOMAT_970 = 'Превознесение в Спореггаре',
    AC_DIPLOMAT_978 = 'Превознесение у Куренай',
    AC_DIPLOMAT_941 = 'Превознесение у Маг\'харов',

    AN_MR_PINCHY = 'Dr. Zwicky!', --#--#--
    AD_MR_PINCHY = 'Angelt Dr. Zwicky in der Scherbenwelt.', --#--#--

    AN_FISHING_BOOK = 'Рыба следов не оставляет',
    AD_FISHING_BOOK = 'Научитесь чуять рыбу.',

    AN_ACCOMPLISHED_ANGLER = 'Непревзойденный рыболов',
    AD_ACCOMPLISHED_ANGLER = 'Добейтесь достижений в рыболовстве, указанных ниже.',

    AN_TBC_DAILY_FISH = 'Старина ры-Барло',
    AD_TBC_DAILY_FISH = 'Выполните 5 ежедневных заданий Старины Барло, указанных ниже.',
    AC_TBC_DAILY_FISH1 = 'Кроколиски в городе',
    AC_TBC_DAILY_FISH2 = 'Поймай бандюгу',
    AC_TBC_DAILY_FISH3 = 'Филе сквернокровного луциана',
    AC_TBC_DAILY_FISH4 = 'Та самая рыбка',
    AC_TBC_DAILY_FISH5 = 'Ловить креветок – это не жук чихнул',

    AN_OLD_IRONJAW = 'Старый Сталезуб',
    AD_OLD_IRONJAW = 'Выудите старого Сталезуба в Стальгорне.',

    AN_OLD_CRAFTY = 'Старый Хитрюга',
    AD_OLD_CRAFTY = 'Выудите Старого Хитрюгу в Оргриммаре.',

    AN_FISHING_DIPLOMAT = 'Дипломатическая рыбалка',
    AD_FISHING_DIPLOMAT = 'Выудите что-нибудь в Оргриммаре и Штормграде.',
    AC_FISHING_DIPLOMAT1 = 'Оргриммар',
    AC_FISHING_DIPLOMAT2 = 'Штормград',

    AN_CAPTAIN_RUMSEY = 'Светлое пиво капитана Ромси',
    AD_CAPTAIN_RUMSEY = 'Сварите светлого пива капитана Ромси.',

    AN_SECOND_RING = 'Der Andere Ring', --#--#--
    AD_SECOND_RING = 'Erhaltet den Anderen Ring aus einem Sack voll geangelter Schätze.', --#--#--

    AN_TBC_DAILY_COOKING = 'Заварим кашу',
    AD_TBC_DAILY_COOKING = 'Выполните 4 ежедневные кулинарные задания Скалла, указанные ниже.',
    AC_TBC_DAILY_COOKING1 = 'Мания',
    AC_TBC_DAILY_COOKING2 = 'Супчик для души',
    AC_TBC_DAILY_COOKING3 = 'Месть сладка',
    AC_TBC_DAILY_COOKING4 = 'Очень горячая похлебка',

    AN_TBC_COOKING_RECIPES = 'Запредельный гурман',
    AD_TBC_COOKING_RECIPES = 'Приготовьте все блюда из Запределья, перечисленные ниже.',

    AN_HAIL_CHEF = 'Слава повару!',
    AD_HAIL_CHEF = 'Добейтесь достижений в кулинарии, указанных ниже.',

    AN_EXPLORE_OUTLAND = 'Запределье',
    AD_EXPLORE_OUTLAND = 'Исследуйте все местности Запределья.',

    AN_MIDDLE_RARE = 'Весьма редкий',
    AD_MIDDLE_RARE = 'Убейте одно из редких и неуловимых существ из Запределья, перечисленных ниже.',
    AN_BLOODY_RARE = 'Чертовски редкие',
    AD_BLOODY_RARE = 'Убейте редких и неуловимых существ из Запределья, перечисленных ниже.',
    TBC_NPC_18695 = 'Посол Жеррикар',
    TBC_NPC_18682 = 'Трясинный скрытень',
    TBC_NPC_18697 = 'Главный инженер Лортандер',
    TBC_NPC_18681 = 'Эмиссар резервуара Кривого Клыка',
    TBC_NPC_18694 = 'Страж портала Коллидус',
    TBC_NPC_18689 = 'Расчленитель',
    TBC_NPC_18686 = 'Вестник рока Джурим',
    TBC_NPC_18698 = 'Недремлющий Каратель',
    TBC_NPC_18678 = 'Обжорень',
    TBC_NPC_17144 = 'Жуткозуб',
    TBC_NPC_18692 = 'Гематион',
    TBC_NPC_18696 = 'Краатор',
    TBC_NPC_18680 = 'Мартикар',
    TBC_NPC_18677 = 'Мекторг Дикий',
    TBC_NPC_18690 = 'Моркруш',
    TBC_NPC_20932 = 'Нурамок',
    TBC_NPC_18685 = 'Окрек',
    TBC_NPC_18693 = 'Проповедник Маргром',
    TBC_NPC_18683 = 'Охотник Бездны Яр',
    TBC_NPC_18679 = 'Воракем Глашатай Судьбы',

    AN_PREPATCH_QUEST = 'Auf in den Kampf!', --#--#--
    AD_PREPATCH_QUEST = 'Hat am Kampf um das Dunkle Portal teilgenommen. Träger des Wappenrock des Beschützers.', --#--#--

    AN_RIDING_75 = 'Четыре ноги – лучше',
    AD_RIDING_75 = 'Станьте учеником в деле верховой езды.',
    AN_RIDING_150 = 'На всех парах',
    AD_RIDING_150 = 'Станьте подмастерьем в деле верховой езды.',
    AN_RIDING_225 = 'В голубую высь',
    AD_RIDING_225 = 'Станьте умельцем в деле верховой езды.',
    AN_RIDING_300 = 'Вас не догонят',
    AD_RIDING_300 = 'Станьте искусником в деле верховой езды.',

    AN_ATTUNE_SHATTERED_HALLS = 'Heißer als die Hölle', --#--#--
    AD_ATTUNE_SHATTERED_HALLS = 'Erhaltet den Schlüssel zu den Zerschmetterten Hallen.', --#--#--
    AN_ATTUNE_ARCATRAZ = 'Как проникнуть в Аркатрац',
    AD_ATTUNE_ARCATRAZ = 'Erhaltet den Schlüssel zur Arkatraz.', --#--#--
    AN_ATTUNE_KARAZHAN = 'Разрешение учителя',
    AD_ATTUNE_KARAZHAN = 'Erhaltet den Schlüssel des Meisters.', --#--#--
    AN_ATTUNE_NIGHT_BANE = 'Die Vergangenheit aufwühlen', --#--#--
    AD_ATTUNE_NIGHT_BANE = 'Erhaltet die Geschwärzte Urne und bezwingt den Schrecken der Nacht in Karazhan.', --#--#--
    AN_ATTUNE_SSC = 'Дубина Кардеша',
    AD_ATTUNE_SSC = 'Erhaltet Zugang zur Höhle des Schlangenschreins.', --#--#--
    AN_ATTUNE_EYE = 'Der Schlüssel der Stürme', --#--#--
    AD_ATTUNE_EYE = 'Erhaltet den Schlüssel der Stürme.', --#--#--
    AN_ATTUNE_HYJAL = 'Сосуды Вечности',
    AD_ATTUNE_HYJAL = 'Erhaltet Zugang zur Schlacht um den Berg Hyjal.', --#--#--
    AN_ATTUNE_BLACK_TEMPLE = 'Отвлекающий маневр',
    AD_ATTUNE_BLACK_TEMPLE = 'Erhaltet das Medaillon von Karabor.', --#--#--

    AN_SSC = 'Змеиное святилище',
    AD_SSC = 'Убейте леди Вайш в Змеином святилище.',
    AC_KILL_HYDROS = 'Hydross der Unstete', --#--#--
    AC_KILL_LURKER = 'Скрытое становится явным',
    AC_KILL_LEOTHERAS = 'Leotheras der Blinde', --#--#--
    AC_KILL_KARATHRESS = 'Tiefenlord Karathress', --#--#--
    AC_KILL_MOROGRIM = 'Morogrim Gezeitenwandler', --#--#--
    AC_KILL_VASHJ = 'Леди Вайш',
    AN_TK = 'Крепость Бурь',
    AD_TK = 'Убейте Кель\'таса Солнечного Скитальца в Крепости Бурь.',
    AC_KILL_ALAR = 'Al\'ar', --#--#--
    AC_KILL_VOID_REAVER = 'Leerhäscher', --#--#--
    AC_KILL_SOLARIAN = 'Hochastromantin Solarian', --#--#--
    AC_KILL_KAELTHAS = 'Кель\'тас Солнечный Скиталец',

    AN_HYJAL = 'Битва за гору Хиджал',
    AD_HYJAL = 'Убейте Архимонда в битве за гору Хиджал.',

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
    AC_KILL_ILLIDAN = 'Иллидан Ярость Бури',

    AN_BLACK_TEMPLE = 'Черный храм',
    AD_BLACK_TEMPLE = 'Убейте Иллидана Ярость Бури в Черном храме.',
    AR_BLACK_TEMPLE = 'Bezwinger des Schwarzen Tempels', --#--#--

    AN_ARENA_FIRST_WIN = 'Шаг на арену',
    AD_ARENA_FIRST_WIN = 'Одержите победу в рейтинговом бою на арене на 70-м уровне.',
    AN_ARENA_WIN1 = 'Безжалостность гладиатора',
    AD_ARENA_WIN1 = 'Одержите победу в 100 рейтинговых боях на арене на 70-м уровне.',
    AN_ARENA_WIN2 = 'Мстительность гладиатора',
    AD_ARENA_WIN2 = 'Одержите победу в 200 рейтинговых боях на арене на 70-м уровне.',
    AN_ARENA_WIN3 = 'Жестокость гладиатора',
    AD_ARENA_WIN3 = 'Одержите победу в 300 рейтинговых боях на арене на 70-м уровне.',

    AN_ARENA_TITLE1 = 'Гладиатор',
    AN_ARENA_TITLE2 = 'Дуэлянт',
    AN_ARENA_TITLE3 = 'Фаворит',
    AN_ARENA_TITLE4 = 'Претендент',

    AN_ARENA_GLADIATOR = 'Гладиатор',
    AD_ARENA_GLADIATOR = 'Заслужите звание гладиатора за сезон арены на 70-м уровне.',
    AN_ARENA_DUELIST = 'Дуэлянт',
    AD_ARENA_DUELIST = 'Заслужите звание Дуэлянта за сезон арены на 70-м уровне.',
    AN_ARENA_RIVAL = 'Фаворит',
    AD_ARENA_RIVAL = 'Заслужите звание Фаворита за сезон арены на 70-м уровне.',
    AN_ARENA_CHALLENGER = 'Претендент',
    AD_ARENA_CHALLENGER = 'Заслужите звание Претендента за сезон арены на 70-м уровне.',

    AN_ARENA_2_1550 = 'Только ты и я: 1550',
    AD_ARENA_2_1550 = 'Заслужите 1550 очков личного рейтинга в команде арены 2 на 2 на 70-м уровне.',
    AN_ARENA_2_1750 = 'Только ты и я: 1750',
    AD_ARENA_2_1750 = 'Заслужите 1750 очков личного рейтинга в команде арены 2 на 2 на 70-м уровне.',
    AN_ARENA_2_2000 = 'Только ты и я: 2000',
    AD_ARENA_2_2000 = 'Заслужите 2000 очков личного рейтинга в команде арены 2 на 2 на 70-м уровне.',
    AN_ARENA_2_2200 = 'Только ты и я: 2200',
    AD_ARENA_2_2200 = 'Заслужите 2200 очков личного рейтинга в команде арены 2 на 2 на 70-м уровне.',

    AN_ARENA_3_1550 = 'Трое – уже банда: 1550',
    AD_ARENA_3_1550 = 'Заслужите 1550 очков личного рейтинга в команде арены 3 на 3 на 70-м уровне.',
    AN_ARENA_3_1750 = 'Трое – уже банда: 1750',
    AD_ARENA_3_1750 = 'Заслужите 1750 очков личного рейтинга в команде арены 3 на 3 на 70-м уровне.',
    AN_ARENA_3_2000 = 'Трое – уже банда: 2000',
    AD_ARENA_3_2000 = 'Заслужите 2000 очков личного рейтинга в команде арены 3 на 3 на 70-м уровне.',
    AN_ARENA_3_2200 = 'Трое – уже банда: 2200',
    AD_ARENA_3_2200 = 'Заслужите 2200 очков личного рейтинга в команде арены 3 на 3 на 70-м уровне.',

    AN_ARENA_5_1550 = 'Большая пятерка: 1550',
    AD_ARENA_5_1550 = 'Заслужите 1550 очков личного рейтинга в команде арены 5 на 5 на 70-м уровне.',
    AN_ARENA_5_1750 = 'Большая пятерка: 1750',
    AD_ARENA_5_1750 = 'Заслужите 1750 очков личного рейтинга в команде арены 5 на 5 на 70-м уровне.',
    AN_ARENA_5_2000 = 'Большая пятерка: 2000',
    AD_ARENA_5_2000 = 'Заслужите 2000 очков личного рейтинга в команде арены 5 на 5 на 70-м уровне.',
    AN_ARENA_5_2200 = 'Большая пятерка: 2200',
    AD_ARENA_5_2200 = 'Заслужите 2200 очков личного рейтинга в команде арены 5 на 5 на 70-м уровне.',

    AN_ARENA_STREAK = 'Полоса везения',
    AD_ARENA_STREAK = 'Выиграйте подряд 10 рейтинговых боев на 70-м уровне.',

    AN_ARENA_HOTSTREAK = 'Полоса удачи',
    AD_ARENA_HOTSTREAK = 'Одержите 10 побед подряд в рейтинговых боях на Арене в команде с рейтингом выше 1800 на 70-м уровне.',

    AN_ARENA_LASTMAN = 'Остаться в живых',
    AD_ARENA_LASTMAN = 'Останьтесь единственным выжившим после рейтингового боя на Арене 5 на 5 на 70-м уровне.',

    AN_ARENA_MAPS = 'Чемпион войны',
    AD_ARENA_MAPS = 'Одержите победу в рейтинговом бою на Арене Острогорья, Арене Награнда, в Стоках Даларана и на Руинах Лордерона на 70-м уровне.',
    AC_ARENA_MAPS1 = 'Арена Острогорья',
    AC_ARENA_MAPS2 = 'Арена Награнда',
    AC_ARENA_MAPS3 = 'Руины Лордерона',

    AN_ARENA_MASTER = 'Повелитель арены',
    AD_ARENA_MASTER = 'Добейтесь указанных ниже достижений на Арене.',

    AN_AZZINOTH = 'Боевые клинки Аззинота',
    AD_AZZINOTH = 'Владелец Клинков Аззинота.',
	AN_THORIDAL = 'Тори\'дал, Звездная Ярость',
    AD_THORIDAL = 'Владелец Тори\'дала, Звездной Ярости.',
    AC_OBTAIN_MAINHAND_AZZINOTH = 'Rechte Kriegsgleve von Azzinoth', --#--#--
    AC_OBTAIN_OFFHAND_AZZINOTH = 'Linke Kriegsgleve von Azzinoth', --#--#--
	AN_BEAR_MOUNT = 'Аманийский боевой медведь',
    AD_BEAR_MOUNT = 'Владелец Аманийского боевого медведя.',
	AN_HAWK_MOUNT = 'Стремительный белый крылобег',
    AD_HAWK_MOUNT = 'Получите стремительного белого крылобега от Кель\'Таса Солнечного Скитальца на террасе Магистров.',
	AN_ALAR_MOUNT = 'Пепел Ал\'ара',
    AD_ALAR_MOUNT = 'Получите пепел Ал\'ара от Кель\'таса Солнечного Скитальца в Крепости Бурь.',
	AN_HORSEMAN_MOUNT = 'Поводья Всадника без головы',
	AD_HORSEMAN_MOUNT = 'Получите Поводья Всадника без головы от Всадника без головы в Монастыре Алого ордена во время Тыквовина.',
	AN_HERO_SHATTRATH = 'Герой Шаттрата',
	AD_HERO_SHATTRATH = 'Добейтесь того, чтобы вас превозносили Провидцы и Алдоры.',
	AN_HERO_SCRYER = 'Провидцы',
	AN_HERO_ALDOR = 'Алдоры',
	AN_CHAMPION_NAARU = 'Защитник наару',
	AD_CHAMPION_NAARU = 'Заслужите звание "Защитник наару".',
	AR_CHAMPION_NAARU = 'Защитник наару',
	AN_HAND_ADAL = 'Длань А\'дала',
	AD_HAND_ADAL = 'Заслужите звание "Длань А\'дала".',

    AN_P3_FIRST_WEEK = 'Eroberer der Scherbenwelt', --#--#--
    AD_P3_FIRST_WEEK = 'Bezwingt Archimonde und Illidan Sturmgrimm in der ersten Woche von Phase 3.', --#--#--
    AC_KILL_ARCHIMONDE = 'Архимонд',
    AR_P3_FIRST_WEEK = 'Eroberer der Scherbenwelt', --#--#--
	
	AN_FLIGHFORM = 'Облик стремительной птицы',
	AD_FLIGHFORM = 'Выполнено задание для друида на обретение облика стремительной птицы.',

    AN_KRUUL = '...nicht noch ein Dämonenlord!', --#--#--
	AD_KRUUL = 'Bezwingt Hochlord Kruul während des Kampfes um das Dunkle Portal.', --#--#--

    AN_ATTUMEN_MOUNT = 'Поводья огненного боевого коня',
	AD_ATTUMEN_MOUNT = 'Получите поводья огненного боевого коня от Ловчего Аттумена в Каражане.',


    -- Classic-continent rare achievement series
    AN_ONE_OF_A_KIND = 'Единственный в своём роде',
    AD_ONE_OF_A_KIND = 'Убейте редкое элитное существо в Калимдоре или Восточных королевствах.',
    AN_EXTREMELY_RARE = 'Исключительно редкие',
    AD_EXTREMELY_RARE = 'Убейте всех перечисленных ниже редких элитных существ Калимдора и Восточных королевств.',

    -- Classic-continent rare NPC names (localized by stable NPC ID).
    RARE_NPC_3586 = 'Шахтер Джонсон',
    RARE_NPC_3872 = 'Капитан служителей Смерти',
    RARE_NPC_6228 = 'Посол клана Черного Железа',
    RARE_NPC_6488 = 'Павший воитель',
    RARE_NPC_6489 = 'Железноспин',
    RARE_NPC_6490 = 'Азшир Неспящий',
    RARE_NPC_7057 = 'Мастер Лопаторук',
    RARE_NPC_9024 = 'Пиромант Зерно Мудрости',
    RARE_NPC_8923 = 'Панцер Непобедимый',
    RARE_NPC_9041 = 'Тюремщик Стилгисс',
    RARE_NPC_9042 = 'Верек',
    RARE_NPC_9217 = 'Лорд-волхв из клана Черной Вершины',
    RARE_NPC_9218 = 'Боевой предводитель клана Черной Вершины',
    RARE_NPC_9219 = 'Мясник из клана Черной Вершины',
    RARE_NPC_9596 = 'Баннок Люторез',
    RARE_NPC_9736 = 'Интендант Зигрис',
    RARE_NPC_10376 = 'Хрустальный Клык',
    RARE_NPC_10263 = 'Пылающий страж Скверны',
    RARE_NPC_9718 = 'Гок Крепкобив',
    RARE_NPC_10509 = 'Джед Руновед',
    RARE_NPC_10899 = 'Горалук Разбитая Наковальня',
    RARE_NPC_10393 = 'Череп',
    RARE_NPC_10558 = 'Певчий Форрестен',
    RARE_NPC_10809 = 'Каменный Гребень',
    RARE_NPC_99 = 'Моргана Лукавая',
    RARE_NPC_100 = 'Графф Быстрохват',
    RARE_NPC_471 = 'Мать Клык',
    RARE_NPC_472 = 'Федфенхель',
    RARE_NPC_61 = 'Турос Ловкорук',
    RARE_NPC_79 = 'Нарг Надсмотрщик',
    RARE_NPC_1130 = 'Бьярн',
    RARE_NPC_1132 = 'Серый',
    RARE_NPC_1137 = 'Идан Ревун',
    RARE_NPC_8503 = 'Гибломор',
    RARE_NPC_1260 = 'Великий Отец Арктикус',
    RARE_NPC_1119 = 'Твердоспин',
    RARE_NPC_10827 = 'Вестница смерти Селендра',
    RARE_NPC_10817 = 'Дугган Громовой Молот',
    RARE_NPC_10825 = 'Гиш Недвижимый',
    RARE_NPC_10821 = 'Хед\'маш Гниющий',
    RARE_NPC_10828 = 'Верховный генерал Аббендис',
    RARE_NPC_10826 = 'Лорд Темнокос',
    RARE_NPC_10824 = 'Предводитель следопытов Ястребиное Копье',
    RARE_NPC_10822 = 'Полководец Молот\'джин',
    RARE_NPC_10823 = 'Зул\'Брин Криводрев',
    RARE_NPC_16184 = 'Нерубский надзиратель',
    RARE_NPC_1843 = 'Штейгер Джеррис',
    RARE_NPC_1844 = 'Штейгер Маркрид',
    RARE_NPC_1847 = 'Скверногрив',
    RARE_NPC_1838 = 'Дознаватель из Алого ордена',
    RARE_NPC_1851 = 'Кикиморд',
    RARE_NPC_1837 = 'Судья из Алого ордена',
    RARE_NPC_1885 = 'Кузнец из Алого ордена',
    RARE_NPC_1848 = 'Лорд Малдаззар',
    RARE_NPC_1850 = 'Гнилиус',
    RARE_NPC_1839 = 'Верховный священник из Алого ордена',
    RARE_NPC_1841 = 'Палач из Алого ордена',
    RARE_NPC_10356 = 'Зверр',
    RARE_NPC_1911 = 'Диб',
    RARE_NPC_1936 = 'Фермер Соллиден',
    RARE_NPC_10358 = 'Тень Феллисенты',
    RARE_NPC_1531 = 'Заблудшая душа',
    RARE_NPC_1910 = 'Муад',
    RARE_NPC_10357 = 'Куссан Жалящий',
    RARE_NPC_10359 = 'Шри\'скалк',
    RARE_NPC_1533 = 'Страдающая душа',
    RARE_NPC_14221 = 'Гравис Слипнот',
    RARE_NPC_2258 = 'Каменная Ярость',
    RARE_NPC_14223 = 'Злобный Бенджи',
    RARE_NPC_2453 = 'Ло\'Грош',
    RARE_NPC_2452 = 'Сквой',
    RARE_NPC_12431 = 'Жуткоклык',
    RARE_NPC_12433 = 'Кретис Тенеткач',
    RARE_NPC_12432 = 'Старый Губач',
    RARE_NPC_1944 = 'Костолом из стаи Гнилошкуров',
    RARE_NPC_1948 = 'Спутанная Грива',
    RARE_NPC_2283 = 'Регент Когтя Ворона',
    RARE_NPC_1920 = 'Даларанский чарокнижник',
    RARE_NPC_8213 = 'Сталеспин',
    RARE_NPC_8214 = 'Джалинда Дракон Лета',
    RARE_NPC_8216 = 'Ретерокк Берсерк',
    RARE_NPC_8212 = 'Рик',
    RARE_NPC_8218 = 'Сухосерд Ловчий',
    RARE_NPC_8219 = 'Зул\'арек Злобный Охотник',
    RARE_NPC_8210 = 'Бритвокоготь',
    RARE_NPC_8217 = 'Мит\'ретис Чаротворец',
    RARE_NPC_8215 = 'Мрачноус',
    RARE_NPC_14222 = 'Арага',
    RARE_NPC_14279 = 'Ползух',
    RARE_NPC_14281 = 'Джимми Вымогатель',
    RARE_NPC_14277 = 'Леди Зефрис',
    RARE_NPC_8211 = 'Старый утесный прыгун',
    RARE_NPC_14278 = 'Ро\'Барк',
    RARE_NPC_14276 = 'Шрамник',
    RARE_NPC_14280 = 'Большой Самрас',
    RARE_NPC_2447 = 'Нарилласанз',
    RARE_NPC_14275 = 'Тамран Грозовая Вершина',
    RARE_NPC_2779 = 'Принц Назжак',
    RARE_NPC_2609 = 'Геомант Кремненож',
    RARE_NPC_2600 = 'Певица',
    RARE_NPC_2598 = 'Дарбелла Монтроуз',
    RARE_NPC_2601 = 'Гнилобрюх',
    RARE_NPC_2602 = 'Руул Одинокий Камень',
    RARE_NPC_2603 = 'Коворк',
    RARE_NPC_2604 = 'Молок Сокрушитель',
    RARE_NPC_2606 = 'Нимар Душегуб',
    RARE_NPC_2605 = 'Залас Сухокожий',
    RARE_NPC_1037 = 'Военачальница клана Драконьей Пасти',
    RARE_NPC_2108 = 'Гарнег Обугленный Череп',
    RARE_NPC_1112 = 'Кровавая Вдова',
    RARE_NPC_2090 = 'Ма\'рук Змеиная Чешуя',
    RARE_NPC_1140 = 'Острозуб-матриарх',
    RARE_NPC_1050 = 'Чешуйчатый королевский стражник',
    RARE_NPC_14425 = 'Костоглод',
    RARE_NPC_14424 = 'Подболотник',
    RARE_NPC_14433 = 'Болотный слякоч',
    RARE_NPC_1398 = 'Главарь Галгош',
    RARE_NPC_1425 = 'Гризлак',
    RARE_NPC_2476 = 'Большой озерный кроколиск',
    RARE_NPC_14268 = 'Лорд Кондар',
    RARE_NPC_1399 = 'Магош',
    RARE_NPC_14266 = 'Шанда Прядильщица',
    RARE_NPC_14267 = 'Амогг Сокрушитель',
    RARE_NPC_2751 = 'Боевой голем',
    RARE_NPC_14224 = '7:XT',
    RARE_NPC_2744 = 'Тенегорнский командир',
    RARE_NPC_2752 = 'Грохотун',
    RARE_NPC_2753 = 'Барнабус',
    RARE_NPC_2850 = 'Сломанный зуб',
    RARE_NPC_2931 = 'Зарикотль',
    RARE_NPC_2754 = 'Анатемус',
    RARE_NPC_2749 = 'Осадный голем',
    RARE_NPC_9046 = 'Интендант легиона Изрубленного Щита',
    RARE_NPC_10119 = 'Волкан',
    RARE_NPC_10077 = 'Гиблопасть',
    RARE_NPC_9604 = 'Горгон\'ох',
    RARE_NPC_8979 = 'Груклаш',
    RARE_NPC_9602 = 'Хак\'Зор',
    RARE_NPC_8976 = 'Гематос',
    RARE_NPC_8981 = 'Сломанный разоритель',
    RARE_NPC_10078 = 'Искра Ужаса',
    RARE_NPC_8978 = 'Таурис Бальгарр',
    RARE_NPC_8279 = 'Неисправный боевой голем',
    RARE_NPC_8277 = 'Рекк\'тилак',
    RARE_NPC_8281 = 'Жар',
    RARE_NPC_8280 = 'Шлейпнарр',
    RARE_NPC_8283 = 'Повелитель рабов Черносерд',
    RARE_NPC_8278 = 'Смолдар',
    RARE_NPC_8282 = 'Верховный лорд Мастрогонд',
    RARE_NPC_584 = 'Казон',
    RARE_NPC_14273 = 'Камнесерд',
    RARE_NPC_616 = 'Трещунья',
    RARE_NPC_14271 = 'Костелом',
    RARE_NPC_947 = 'Рохх Молчаливый',
    RARE_NPC_14269 = 'Искатель Аквалон',
    RARE_NPC_14272 = 'Огнемордик',
    RARE_NPC_14270 = 'Кальмарник',
    RARE_NPC_763 = 'Вождь из племени Заблудших',
    RARE_NPC_1106 = 'Повар из племени Заблудших',
    RARE_NPC_14447 = 'Гилмориан',
    RARE_NPC_14448 = 'Облезлый Шип',
    RARE_NPC_14445 = 'Лорд-капитан Змеюк',
    RARE_NPC_1063 = 'Нефрит',
    RARE_NPC_507 = 'Фенрос',
    RARE_NPC_771 = 'Командор Сквернстром',
    RARE_NPC_503 = 'Лорд Малатром',
    RARE_NPC_521 = 'Волкус',
    RARE_NPC_574 = 'Нараксис',
    RARE_NPC_534 = 'Нефару',
    RARE_NPC_573 = 'Врагорез-4000',
    RARE_NPC_520 = 'Бракк',
    RARE_NPC_572 = 'Лепритус',
    RARE_NPC_1424 = 'Старший землекоп',
    RARE_NPC_506 = 'Сержант Острый Коготь',
    RARE_NPC_519 = 'Сларк',
    RARE_NPC_462 = 'Сарыч',
    RARE_NPC_596 = 'Зомбированный дворянин',
    RARE_NPC_599 = 'Мариса дю Пэж',
    RARE_NPC_14446 = 'Узкий Плавник',
    RARE_NPC_8301 = 'Щелкун Разоритель',
    RARE_NPC_8304 = 'Бесстрашный',
    RARE_NPC_8303 = 'Хрюггер',
    RARE_NPC_8296 = 'Моджо Зловредный',
    RARE_NPC_8300 = 'Разор',
    RARE_NPC_8299 = 'Злобоклюй',
    RARE_NPC_8298 = 'Провидец Акубар',
    RARE_NPC_8297 = 'Магронос Неуступчивый',
    RARE_NPC_8302 = 'Смертеглаз',
    RARE_NPC_1061 = 'Ган\'зулах',
    RARE_NPC_14491 = 'Курмокк',
    RARE_NPC_2541 = 'Лорд Сакрасис',
    RARE_NPC_14490 = 'Потрошила',
    RARE_NPC_1552 = 'Чешуйчатое брюхо',
    RARE_NPC_14492 = 'Мигафоникс',
    RARE_NPC_723 = 'Палач Мош\'Огг',
    RARE_NPC_14487 = 'Барабуль',
    RARE_NPC_11383 = 'Верховная жрица Хай\'ватна',
    RARE_NPC_14488 = 'Ролох',
    RARE_NPC_3581 = 'Тварь из Стоков',
    RARE_NPC_1720 = 'Бругал Железный Кулак',
    RARE_NPC_5399 = 'Вейжак Каннибал',
    RARE_NPC_5400 = 'Зеккис',
    RARE_NPC_8924 = 'Чудище',
    RARE_NPC_16854 = 'Элдинаркус',
    RARE_NPC_16855 = 'Трегла',
    RARE_NPC_22062 = 'Доктор Белоручка',
    RARE_NPC_5912 = 'Загадочный чудесный дракончик',
    RARE_NPC_3652 = 'Тригор Хлестун',
    RARE_NPC_3672 = 'Боан',
    RARE_NPC_10080 = 'Сандарр Разоритель Барханов',
    RARE_NPC_10081 = 'Пыльный призрак',
    RARE_NPC_10082 = 'Зериллис',
    RARE_NPC_12237 = 'Мешлок Жнец',
    RARE_NPC_11447 = 'Мушгог',
    RARE_NPC_11497 = 'Разза',
    RARE_NPC_11498 = 'Скарр Непреклонный',
    RARE_NPC_11467 = 'Цу\'зи',
    RARE_NPC_3068 = 'Маззранач',
    RARE_NPC_3058 = 'Арра\'чея',
    RARE_NPC_5787 = 'Головорез Эмильгунд',
    RARE_NPC_5807 = 'Цап-царап',
    RARE_NPC_5786 = 'Кривое Копье',
    RARE_NPC_5785 = 'Сестра Плеть Ненависти',
    RARE_NPC_3056 = 'Призрачный Вой',
    RARE_NPC_5822 = 'Скорнн Ткач Скверны',
    RARE_NPC_5823 = 'Смертоносный живодер',
    RARE_NPC_5824 = 'Капитан Тупой Клык',
    RARE_NPC_5826 = 'Владычица земель Рябка',
    RARE_NPC_5808 = 'Полководец Колканис',
    RARE_NPC_5809 = 'Командир стражи Залафил',
    RARE_NPC_5828 = 'Вожак стаи Хумар',
    RARE_NPC_5842 = 'Такк Прыгун',
    RARE_NPC_5834 = 'Аззира Клинок Небес',
    RARE_NPC_5865 = 'Дишу',
    RARE_NPC_5836 = 'Инженер Безобразец',
    RARE_NPC_5835 = 'Штейгер Грилз',
    RARE_NPC_3295 = 'Слякохлюп',
    RARE_NPC_5829 = 'Фырк Дразнила',
    RARE_NPC_5837 = 'Каменная рука',
    RARE_NPC_5838 = 'Копьелом',
    RARE_NPC_3470 = 'Раториан',
    RARE_NPC_5863 = 'Жрица Земли Гукк\'рок',
    RARE_NPC_3253 = 'Силитид-жнец',
    RARE_NPC_5832 = 'Громоступ',
    RARE_NPC_5849 = 'Землекоп Огнеплав',
    RARE_NPC_5847 = 'Хеггин Камнеус',
    RARE_NPC_5848 = 'Малгин Ячменовар',
    RARE_NPC_3398 = 'Гешарахан',
    RARE_NPC_5797 = 'Эан Быстрая Река',
    RARE_NPC_7895 = 'Посол Ярокров',
    RARE_NPC_5827 = 'Бронтус',
    RARE_NPC_5851 = 'Капитан Герогг Тяжелоступ',
    RARE_NPC_3270 = 'Старый мистик Остроморд',
    RARE_NPC_5859 = 'Хагг Тауребой',
    RARE_NPC_5799 = 'Ханна Остролист',
    RARE_NPC_5800 = 'Маркус Бел',
    RARE_NPC_5841 = 'Каменное Копье',
    RARE_NPC_5830 = 'Сестра Коготь Кургана',
    RARE_NPC_5831 = 'Быстрогрив',
    RARE_NPC_5864 = 'Свинеар Копьешкур',
    RARE_NPC_5798 = 'Тора Оперенная Луна',
    RARE_NPC_6584 = 'Король Мош',
    RARE_NPC_6582 = 'Королева Завас',
    RARE_NPC_6581 = 'Равазавр-матриарх',
    RARE_NPC_6585 = 'Ак\'лок',
    RARE_NPC_6583 = 'Графф',
    RARE_NPC_3535 = 'Черномшец злосмрадный',
    RARE_NPC_14430 = 'Закатный ловец',
    RARE_NPC_14431 = 'Фурия Шельда',
    RARE_NPC_14432 = 'Треггил',
    RARE_NPC_14428 = 'Урусон',
    RARE_NPC_14429 = 'Зловещая Утроба',
    RARE_NPC_2186 = 'Карнивус Разрушитель',
    RARE_NPC_2192 = 'Радисон Призыватель Огня',
    RARE_NPC_7015 = 'Грязнюк Жестокий',
    RARE_NPC_2184 = 'Леди Луноокая',
    RARE_NPC_2191 = 'Лисиллин',
    RARE_NPC_2175 = 'Тенекоготь',
    RARE_NPC_2172 = 'Долгоног-несушка',
    RARE_NPC_7016 = 'Леди Веспира',
    RARE_NPC_7017 = 'Лорд Нечестивец',
    RARE_NPC_14342 = 'Яролап',
    RARE_NPC_14340 = 'Алшир Гиблодых',
    RARE_NPC_14339 = 'Смертный вой',
    RARE_NPC_14344 = 'Полукров',
    RARE_NPC_14343 = 'Олм Мудрый',
    RARE_NPC_14345 = 'Онгар',
    RARE_NPC_7104 = 'Дессекус',
    RARE_NPC_7137 = 'Испепелитель',
    RARE_NPC_6651 = 'Привратник Грознорев',
    RARE_NPC_6647 = 'Магистр Соколиный Шлем',
    RARE_NPC_6648 = 'Антилос',
    RARE_NPC_6650 = 'Генерал Фангферрор',
    RARE_NPC_6649 = 'Леди Сесспира',
    RARE_NPC_8660 = 'Эвалчарр',
    RARE_NPC_6118 = 'Привидение Варо\'тена',
    RARE_NPC_6652 = 'Мастер Страхожуть',
    RARE_NPC_6646 = 'Моннос Древний',
    RARE_NPC_13896 = 'Чешуебород',
    RARE_NPC_3735 = 'Аптекарь Фалтис',
    RARE_NPC_10559 = 'Леди Веспия',
    RARE_NPC_10644 = 'Ревун из тумана',
    RARE_NPC_10641 = 'Веткохват',
    RARE_NPC_10643 = 'Шоколадный Плавник',
    RARE_NPC_10647 = 'Принц Рейз',
    RARE_NPC_10639 = 'Роргиш Мощная Челюсть',
    RARE_NPC_3792 = 'Вожак терроволков',
    RARE_NPC_12037 = 'Урсол\'лок',
    RARE_NPC_10642 = 'Эк\'алом',
    RARE_NPC_10640 = 'Дуболап',
    RARE_NPC_3736 = 'Темный душегуб Мортентал',
    RARE_NPC_3773 = 'Аккрилус',
    RARE_NPC_4066 = 'Нал\'тазар',
    RARE_NPC_4015 = 'Величавый патриарх',
    RARE_NPC_5916 = 'Часовой Амарассан',
    RARE_NPC_4030 = 'Мстительное древо',
    RARE_NPC_5915 = 'Брат Вороний Дуб',
    RARE_NPC_5931 = 'Штейгер Риггер',
    RARE_NPC_5930 = 'Сестра Терзающая',
    RARE_NPC_5928 = 'Крыло скорби',
    RARE_NPC_5932 = 'Надсмотрщик Хлестоклык',
    RARE_NPC_14230 = 'Воровской Глаз',
    RARE_NPC_4380 = 'Черная вдова Мглистой пещеры',
    RARE_NPC_14234 = 'Хайок',
    RARE_NPC_4339 = 'Краегор',
    RARE_NPC_14232 = 'Дарт',
    RARE_NPC_14231 = 'Дрогот Бродяга',
    RARE_NPC_14236 = 'Морской черт',
    RARE_NPC_14237 = 'Слизнечерв',
    RARE_NPC_14233 = 'Чешуекус',
    RARE_NPC_14235 = 'Гниль',
    RARE_NPC_14225 = 'Принц Келлен',
    RARE_NPC_14228 = 'Хохотунья',
    RARE_NPC_14227 = 'Шшшперак',
    RARE_NPC_14226 = 'Каскк',
    RARE_NPC_14229 = 'Проклятый Скользящий Плавник',
    RARE_NPC_11688 = 'Проклятый кентавр',
    RARE_NPC_5347 = 'Антилус Парящий',
    RARE_NPC_5349 = 'Араш-етис',
    RARE_NPC_12801 = 'Волшебный химерок',
    RARE_NPC_5346 = 'Рокотун Ловец',
    RARE_NPC_12800 = 'Химерок',
    RARE_NPC_12802 = 'Химерок-пожиратель',
    RARE_NPC_5345 = 'Ромбоголов',
    RARE_NPC_5354 = 'Брат листвы',
    RARE_NPC_5343 = 'Леди Сзалла',
    RARE_NPC_5352 = 'Старый Серобрюх',
    RARE_NPC_5350 = 'Квирот',
    RARE_NPC_5356 = 'Рычун',
    RARE_NPC_5933 = 'Акеллиос Изгнанник',
    RARE_NPC_4132 = 'Опустошитель-силитид',
    RARE_NPC_5935 = 'Железноглаз Неуязвимый',
    RARE_NPC_14427 = 'Глупошмыг',
    RARE_NPC_14426 = 'Харб Поганая Гора',
    RARE_NPC_5934 = 'Сердцерез',
    RARE_NPC_5937 = 'Коварное Жало',
    RARE_NPC_8207 = 'Большой огнекрыл',
    RARE_NPC_8205 = 'Хаарка Ненасытный',
    RARE_NPC_8203 = 'Крегг Кильватель',
    RARE_NPC_8208 = 'Безжалостный хромоног',
    RARE_NPC_8202 = 'Циклок Безумный',
    RARE_NPC_8201 = 'Омгорн Заблудший',
    RARE_NPC_8204 = 'Сориид Пожиратель',
    RARE_NPC_8200 = 'Джин\'Заллах Хозяин Барханов',
    RARE_NPC_8199 = 'Военный вождь Краззилак',
    RARE_NPC_14472 = 'Гретир',
    RARE_NPC_14477 = 'Грубтор',
    RARE_NPC_14478 = 'Ураганий',
    RARE_NPC_14476 = 'Креллак',
    RARE_NPC_14473 = 'Лапресс',
    RARE_NPC_14471 = 'Сетис',
    RARE_NPC_14479 = 'Сумеречный владыка Эверан',
    RARE_NPC_15308 = 'Сумеречный пророк',
    RARE_NPC_14474 = 'Зора',
    RARE_NPC_14475 = 'Рекс Ашил',
    RARE_NPC_10200 = 'Рак\'шири',
    RARE_NPC_10197 = 'Меззир Ревун',
    RARE_NPC_10201 = 'Леди Хедерина',
    RARE_NPC_10199 = 'Гриззл Снежная Лапа',
    RARE_NPC_10202 = 'Лазурис',
    RARE_NPC_10196 = 'Генерал Колбатанн',
    RARE_NPC_10198 = 'Кашох Разоритель',
    RARE_NPC_4425 = 'Слепой охотник',
    RARE_NPC_4842 = 'Заклинательница земли Халмгар',
    RARE_NPC_7354 = 'Круглорыл',
    RARE_NPC_22060 = 'Фенисса Убийца',

    -- Built-in title catalog: labels and grammatical name placement.
    TITLE_BUILTIN_EXPLORER_LABEL = 'Завоеватель',
    TITLE_BUILTIN_EXPLORER_FORMAT_MALE = 'Завоеватель %s',
    TITLE_BUILTIN_EXPLORER_FORMAT_FEMALE = 'Завоевательница %s',
    TITLE_BUILTIN_THE_ELUSIVE_LABEL = 'Неуловимый',
    TITLE_BUILTIN_THE_ELUSIVE_FORMAT_MALE = '%s Неуловимый',
    TITLE_BUILTIN_THE_ELUSIVE_FORMAT_FEMALE = '%s Неуловимая',
    TITLE_BUILTIN_BATTLEMASTER_LABEL = 'Военачальник',
    TITLE_BUILTIN_BATTLEMASTER_FORMAT_MALE = 'Военачальник %s',
    TITLE_BUILTIN_BATTLEMASTER_FORMAT_FEMALE = 'Военачальник %s',
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
    TITLE_BUILTIN_JENKINS_LABEL = 'Дженкинс',
    TITLE_BUILTIN_JENKINS_FORMAT_MALE = '%s Дженкинс',
    TITLE_BUILTIN_JENKINS_FORMAT_FEMALE = '%s Дженкинс',
    TITLE_BUILTIN_AZEROTHS_GREATEST_ANGLER_LABEL = 'Größter Angler von Azeroth', --#--#--
    TITLE_BUILTIN_AZEROTHS_GREATEST_ANGLER_FORMAT_MALE = '%s, der größte Angler von Azeroth', --#--#--
    TITLE_BUILTIN_AZEROTHS_GREATEST_ANGLER_FORMAT_FEMALE = '%s, die größte Anglerin von Azeroth', --#--#--
    TITLE_BUILTIN_CHEF_LABEL = 'Шеф-повар',
    TITLE_BUILTIN_CHEF_FORMAT_MALE = 'Шеф-повар %s',
    TITLE_BUILTIN_CHEF_FORMAT_FEMALE = 'Шеф-повар %s',
    TITLE_BUILTIN_THE_EXALTED_LABEL = 'Der Ehrfurchtgebietende', --#--#--
    TITLE_BUILTIN_THE_EXALTED_FORMAT_MALE = '%s der Ehrfurchtgebietende', --#--#--
    TITLE_BUILTIN_THE_EXALTED_FORMAT_FEMALE = '%s die Ehrfurchtgebietende', --#--#--
    TITLE_BUILTIN_BLOODSAIL_ADMIRAL_LABEL = 'Адмирал Кровавого Паруса',
    TITLE_BUILTIN_BLOODSAIL_ADMIRAL_FORMAT_MALE = 'Адмирал Кровавого Паруса %s',
    TITLE_BUILTIN_BLOODSAIL_ADMIRAL_FORMAT_FEMALE = 'Адмирал Кровавого Паруса %s',
    TITLE_BUILTIN_THE_HALLOWED_LABEL = 'Тыквер',
    TITLE_BUILTIN_THE_HALLOWED_FORMAT_MALE = 'Тыквер %s',
    TITLE_BUILTIN_THE_HALLOWED_FORMAT_FEMALE = 'Тыквер %s',
    TITLE_BUILTIN_MERRYMAKER_LABEL = 'Весельчак',
    TITLE_BUILTIN_MERRYMAKER_FORMAT_MALE = 'Весельчак %s',
    TITLE_BUILTIN_MERRYMAKER_FORMAT_FEMALE = 'Весельчак %s',
    TITLE_BUILTIN_THE_LOVE_FOOL_LABEL = 'Liebesgott', --#--#--
    TITLE_BUILTIN_THE_LOVE_FOOL_FORMAT_MALE = '%s, Liebesgott', --#--#--
    TITLE_BUILTIN_THE_LOVE_FOOL_FORMAT_FEMALE = '%s, Liebesgöttin', --#--#--
    TITLE_BUILTIN_ELDER_LABEL = 'Дуэлянт',
    TITLE_BUILTIN_ELDER_FORMAT_MALE = 'Дуэлянт %s',
    TITLE_BUILTIN_ELDER_FORMAT_FEMALE = 'Дуэлянтка %s',
    TITLE_BUILTIN_PATRON_LABEL = 'Благодетель',
    TITLE_BUILTIN_PATRON_FORMAT_MALE = 'Благодетель %s',
    TITLE_BUILTIN_PATRON_FORMAT_FEMALE = 'Благодетельница %s',
    TITLE_BUILTIN_FLAME_KEEPER_LABEL = 'Претендент',
    TITLE_BUILTIN_FLAME_KEEPER_FORMAT_MALE = 'Претендент %s',
    TITLE_BUILTIN_FLAME_KEEPER_FORMAT_FEMALE = 'Претендентка %s',
    TITLE_BUILTIN_THE_LOREMASTER_LABEL = 'Хранитель мудрости',
    TITLE_BUILTIN_THE_LOREMASTER_FORMAT_MALE = 'Хранитель мудрости %s',
    TITLE_BUILTIN_THE_LOREMASTER_FORMAT_FEMALE = 'Хранительница мудрости %s',
    TITLE_BUILTIN_CONQUEROR_BLACK_TEMPLE_LABEL = 'Bezwinger des Schwarzen Tempels', --#--#--
    TITLE_BUILTIN_CONQUEROR_BLACK_TEMPLE_FORMAT_MALE = '%s, Bezwinger des Schwarzen Tempels', --#--#--
    TITLE_BUILTIN_CONQUEROR_BLACK_TEMPLE_FORMAT_FEMALE = '%s, Bezwingerin des Schwarzen Tempels', --#--#--
    TITLE_BUILTIN_CONQUEROR_OF_OUTLAND_LABEL = 'Eroberer der Scherbenwelt', --#--#--
    TITLE_BUILTIN_CONQUEROR_OF_OUTLAND_FORMAT_MALE = '%s, Eroberer der Scherbenwelt', --#--#--
    TITLE_BUILTIN_CONQUEROR_OF_OUTLAND_FORMAT_FEMALE = '%s, Eroberin der Scherbenwelt', --#--#--
    TITLE_BUILTIN_CHAMPION_OF_THE_NAARU_LABEL = 'Защитник наару',
    TITLE_BUILTIN_CHAMPION_OF_THE_NAARU_FORMAT_MALE = 'Champion der Naaru %s', --#--#--
    TITLE_BUILTIN_CHAMPION_OF_THE_NAARU_FORMAT_FEMALE = 'Champion der Naaru %s', --#--#--
    TITLE_BUILTIN_HAND_OF_ADAL_LABEL = 'Длань А\'дала',
    TITLE_BUILTIN_HAND_OF_ADAL_FORMAT_MALE = 'Hand von A\'dal %s', --#--#--
    TITLE_BUILTIN_HAND_OF_ADAL_FORMAT_FEMALE = 'Hand von A\'dal %s', --#--#--
    TITLE_BUILTIN_HERO_OF_OUTLAND_LABEL = 'Held der Scherbenwelt', --#--#--
    TITLE_BUILTIN_HERO_OF_OUTLAND_FORMAT_MALE = 'Held der Scherbenwelt %s', --#--#--
    TITLE_BUILTIN_HERO_OF_OUTLAND_FORMAT_FEMALE = 'Heldin der Scherbenwelt %s', --#--#--
    TITLE_BUILTIN_GREAT_HERO_OF_OUTLAND_LABEL = 'Großartiger Held der Scherbenwelt', --#--#--
    TITLE_BUILTIN_GREAT_HERO_OF_OUTLAND_FORMAT_MALE = 'Großartiger Held der Scherbenwelt %s', --#--#--
    TITLE_BUILTIN_GREAT_HERO_OF_OUTLAND_FORMAT_FEMALE = 'Großartige Heldin der Scherbenwelt %s', --#--#--
    TITLE_BUILTIN_BREWMASTER_LABEL = 'Хмелевар',
    TITLE_BUILTIN_BREWMASTER_FORMAT_MALE = 'Хмелевар %s',
    TITLE_BUILTIN_BREWMASTER_FORMAT_FEMALE = 'Хмелевар %s',
    -- End built-in title catalog
}

SexyLib:InitLocalization('Anniversary Achievements', L)
