if GetLocale() ~= 'ptBR' then return end

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

    GEAR_SLOT_HEAD = 'Cabeça',
    GEAR_SLOT_NECK = 'Pescoço',
    GEAR_SLOT_SHOULDER = 'Ombros',
    GEAR_SLOT_CHEST = 'Torso',
    GEAR_SLOT_WAIST = 'Cintura',
    GEAR_SLOT_LEGS = 'Pernas',
    GEAR_SLOT_FEET = 'Pés',
    GEAR_SLOT_WRIST = 'Pulsos',
    GEAR_SLOT_HANDS = 'Mãos',
    GEAR_SLOT_FIRST_RING = 'Dedo direito',
    GEAR_SLOT_SECOND_RING = 'Dedo esquerdo',
    GEAR_SLOT_FIRST_TRINKET = 'Primeiro berloque',
    GEAR_SLOT_SECOND_TRINKET = 'Segundo berloque',
    GEAR_SLOT_CLOAK = 'Manto',
    GEAR_SLOT_WEAPON = 'Arma',

    NPC_3444 = 'Grubenratte', --#--#--
    NPC_620 = 'Galinha',
    NPC_1420 = 'Sapo',
    NPC_13321 = 'Rã',
    NPC_2620 = 'Cão-da-pradaria',
    NPC_9600 = 'Papagaio',
    NPC_883 = 'Cervo',
    NPC_9699 = 'Besouro de Fogo',
    NPC_4953 = 'Caninana',
    NPC_721 = 'Coelho',
    NPC_9700 = 'Caranguejo de Lava',
    NPC_15476 = 'Escorpião',
    NPC_2914 = 'Cobra',
    NPC_16030 = 'Verme',
    NPC_4075 = 'Rato',
    NPC_1412 = 'Esquilo',
    NPC_7390 = 'Nymphensittich', --#--#--
    NPC_15475 = 'Käfer', --#--#--
    NPC_15010 = 'Dschungelkröte', --#--#--
    NPC_4076 = 'Cascuda',
    NPC_13016 = 'Untergrundratte', --#--#--
    NPC_14881 = 'Aranha',
    NPC_2110 = 'Schwarze Ratte', --#--#--
    NPC_4166 = 'Gazela',
    NPC_1933 = 'Ovelha',
    NPC_890 = 'Corço',
    NPC_2098 = 'Carneiro',
    NPC_2442 = 'Vaca',
    NPC_6368 = 'Gato',
    NPC_6271 = 'Camundongo',
    NPC_385 = 'Pferd', --#--#--
    NPC_10685 = 'Suíno',
    NPC_3300 = 'Áspide',
    NPC_15065 = 'Lady', --#--#--
    NPC_15066 = 'Cleo', --#--#--
    NPC_15071 = 'Schleicherpfote', --#--#--
    NPC_15072 = 'Spike', --#--#--

    CATEGORY_GENERAL = 'Geral',
    CATEGORY_QUESTS = 'Missões',
	CATEGORY_PVP = 'Jogador x Jogador',
    CATEGORY_KALIMDOR = 'Kalimdor',
    CATEGORY_EASTERN_KINGDOMS = 'Reinos do Leste',
    CATEGORY_OUTLAND = 'Terralém',
    CATEGORY_VANILLA = 'Clássico',
    CATEGORY_TBC = 'The Burning Crusade',
    CATEGORY_EXPLORATION = 'Exploração',
    CATEGORY_PVE = 'Masmorras e Raides',
    CATEGORY_ARENA = 'Arena',
    CATEGORY_BG_ALTERAC = 'Vale Alterac',
    CATEGORY_BG_WARSONG = 'Ravina Brado Guerreiro',
    CATEGORY_BG_ARATHI = 'Bacia Arathi',
    CATEGORY_BG_EYE = 'Olho da Tormenta',
    CATEGORY_PROFESSIONS = 'Profissões',
    CATEGORY_REPUTATION = 'Reputação',
	CATEGORY_EVENTS = 'Eventos Mundiais',
    CATEGORY_VALENTINES = 'O Amor Está no Ar',
    CATEGORY_LUNAR = 'Festival da Lua',
    CATEGORY_NOBLEGARDEN = 'Jardinova',
    CATEGORY_CHILDREN = 'A Semana das Crianças',
    CATEGORY_MIDSUMMER = 'Solstício',
    CATEGORY_BREWFEST = 'CervaFest',
    CATEGORY_HALLOWSEND = 'Noturnália',
    CATEGORY_WINTERVEIL = 'Véu de Inverno',
    CATEGORY_FEATS_OF_STRENGTH = 'Proezas Memoráveis',
	
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
	AN_WARLOCK_T2 = 'Vestes da Nêmesis',
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

    AN_LVL = 'Nível %d',
    AD_LVL = 'Alcançar o nível %d',

    AN_BANK = 'Poupança fácil',
    AD_BANK = 'Comprar 7 compartimentos bancários.',
    AC_BANK = 'Comprar 7 compartimentos bancários.',

    AN_QUESTS = '%dmissões cumpridas',
    AD_QUESTS = 'Cumprir %dmissões.',
    AC_QUESTS = 'Schließt %d Quests ab.', --#--#--

    AN_DAILY_QUESTS = '%d tägliche Quests abgeschlossen', --#--#--
    AD_DAILY_QUESTS = 'Cumprir %dmissões diárias.',
    AC_DAILY_QUESTS = 'Schließt %d tägliche Quests ab.', --#--#--

    AN_QUEST_GOLD5 = 'Glitzernde Belohnung', --#--#--
    AN_QUEST_GOLD10 = 'Sammler geprägter Münzen', --#--#--
    AN_QUEST_GOLD25 = 'Täglich Brot', --#--#--
    AN_QUEST_GOLD50 = 'Wohlverdientes Gold', --#--#--
    AN_QUEST_GOLD100 = 'Verdient durch Schweiß und Blut', --#--#--
    AN_QUEST_GOLD250 = 'Golddrucker', --#--#--
    AN_QUEST_GOLD500 = 'Angemessene Entlohnung', --#--#--
    AD_QUEST_GOLD = 'Obter %dpeças de ouro como recompensa de missões.',
    AC_QUEST_GOLD = 'Erhaltet %d Gold durch Questbelohnungen.', --#--#--

    AN_QUESTS_ZONE = 'Mestre Historiador %s',
    AD_QUESTS_ZONE = 'Schließt die Quest "%s" in %s ab.', --#--#--
    AD_QUESTS_ZONE_MULTI = 'Schließt die folgenden Quests in %s ab.', --#--#--
    AC_QUESTS_ZONE = 'Schließt die Quest "%s" ab.', --#--#--

    AZSHARA_1 = 'Azshara',
    AZSHARA_2 = 'Azshara',
    QUEST_3602 = 'Azsharit', --#--#--

    FELWOOD_1 = 'Selva Maleva',
    FELWOOD_2 = 'Selva Maleva',
    QUEST_5165 = 'Übergießen der Flammen des Schutzes', --#--#--
    QUEST_5385 = 'Die Überreste von Trey Lichtschmied', --#--#--

    DESOLACE_1 = 'Desolação',
    DESOLACE_2 = 'Desolação',
    QUEST_6027 = 'Buch der Uralten', --#--#--

    DUSTWALLOW_1 = 'Pântano Vadeoso',
    DUSTWALLOW_2 = 'Pântano Vadeoso',
    QUEST_1203 = 'Jarl braucht eine Klinge', --#--#--

    SILITHUS_1 = 'Silithus',
    SILITHUS_2 = 'Silithus',
    QUEST_8287 = 'Ein teuflischer Plan', --#--#--
    QUEST_8352 = 'Szepter des Rates', --#--#--
    QUEST_8321 = 'Vyral der Üble', --#--#--
    QUEST_8281 = 'Verstärkte Sicherheit', --#--#--

    DUROTAR_1 = 'Durotar',
    DUROTAR_2 = 'Durotar',
    QUEST_835 = 'Sicherung der Linien', --#--#--

    BARRENS_1 = 'Sertões',
    BARRENS_2 = 'Sertões',
    QUEST_888 = 'Gestohlene Beute', --#--#--
    QUEST_902 = 'Samophlang', --#--#--

    WINTERSPRING_1 = 'Hibérnia',
    WINTERSPRING_2 = 'Hibérnia',
    QUEST_975 = 'Behälter von Mau\'ari', --#--#--
    QUEST_5082 = 'Bedrohung durch die Winterfelle', --#--#--
    QUEST_5121 = 'Oberhäuptling der Winterfelle', --#--#--
    QUEST_5163 = 'Sind wir endlich da, Yeti?', --#--#--
    QUEST_4842 = 'Sonderbare Quellen', --#--#--

    TANARIS_1 = 'Tanaris',
    TANARIS_2 = 'Tanaris',
    QUEST_2662 = 'Elixir Nublacuca',
    QUEST_2874 = 'Lieferung für MacKinley', --#--#--
    QUEST_1691 = 'Noch mehr Wüstenläufergerechtigkeit', --#--#--
    QUEST_113 = 'Insektenteil-Analyse', --#--#--

    STONETALON_1 = 'Cordilheira das Torres de Pedra',
    STONETALON_2 = 'Cordilheira das Torres de Pedra',
    QUEST_1096 = 'Gerenzo Pfeifzang', --#--#--

    UNGORO_1 = 'Cratera Un\'Goro',
    UNGORO_2 = 'Cratera Un\'Goro',
    QUEST_3962 = 'Allein ist es gefährlich', --#--#--
    QUEST_4245 = 'Chasing A-Me 01', --#--#--
    QUEST_4292 = 'Ein Köder für Lar\'korwi', --#--#--

    THOUSAND_NEEDLES_1 = 'Mil Agulhas',
    THOUSAND_NEEDLES_2 = 'Mil Agulhas',
    QUEST_1189 = 'Sicherheit zuerst', --#--#--

    ARATHI_1 = 'Planalto Arathi',
    ARATHI_2 = 'Planalto Arathi',
    QUEST_652 = 'Den Hauptstein zerbrechen', --#--#--

    BADLANDS_1 = 'Ermos',
    BADLANDS_2 = 'Ermos',
    QUEST_737 = 'Verbotenes Wissen', --#--#--
    QUEST_778 = 'Das wird schwierig', --#--#--
    QUEST_656 = 'Beschwören der Prinzessin', --#--#--
	QUEST_793 = 'Zerbrochene Allianzen', --#--#--
	QUEST_717 = 'Erdbeben', --#--#--
    
    EASTERN_PLAGUELANDS_1 = 'Terras Pestilentas Orientais',
    EASTERN_PLAGUELANDS_2 = 'Terras Pestilentas Orientais',
    QUEST_5942 = 'Versteckte Schätze', --#--#--
    QUEST_6148 = 'Das Scharlachrote Orakel Demetria', --#--#--
    QUEST_6187 = 'Ordnung muss wieder hergestellt werden', --#--#--
    QUEST_5265 = 'Der Argentumtresor', --#--#--

    BLASTED_LANDS_1 = 'Barreira do Inferno',
    BLASTED_LANDS_2 = 'Barreira do Inferno',
    QUEST_3628 = 'Ihr seid Rakh\'likh, Dämon', --#--#--

    STRANGLETHORN_VALLEY_1 = 'Selva do Espinhaço',
    STRANGLETHORN_VALLEY_2 = 'Selva do Espinhaço',
    QUEST_208 = 'A grande caçada',
    QUEST_600 = 'Venture Company-Bergbau', --#--#--
    QUEST_613 = 'Maurys Fuß aufbrechen', --#--#--
    QUEST_628 = 'Exzelsior', --#--#--
    QUEST_338 = 'Grande Espinhaço: Veredas',
	
	AN_NESINGWARY = 'Grande Espinhaço: Veredas',
	AD_NESINGWARY = 'Cumprir as missões de Rosarães Guima na Selva do Espinhaço até a missão Grande Espinhaço: Veredas e A Grande Caçada.',

    WESTERN_PLAGUELANDS_1 = 'Terras Pestilentas Ocidentais',
    WESTERN_PLAGUELANDS_2 = 'Terras Pestilentas Ocidentais',
    QUEST_5944 = 'In den Träumen', --#--#--
    QUEST_5051 = 'Zwei Hälften vereint', --#--#--
    QUEST_4985 = 'Die Tierwelt leidet auch', --#--#--

    SEARING_GORGE_1 = 'Garganta Abrasadora',
    SEARING_GORGE_2 = 'Garganta Abrasadora',
    QUEST_3481 = 'Plunder...', --#--#--

    BLACK_ROCK_1 = 'Montanha Rocha Negra',
    BLACK_ROCK_2 = 'Montanha Rocha Negra',
    QUEST_8996 = 'Rückkehr zu Bodley', --#--#--

    AN_WISDOM_KEEPER = 'O Mestre Historiador',
    AD_WISDOM_KEEPER = 'Obter as conquistas de missões listadas abaixo.',
    AN_WISDOM_KEEPER_AZEROTH = 'O Mestre Historiador',
    AD_WISDOM_KEEPER_AZEROTH = 'Obter as conquistas de missões listadas abaixo.',
    AN_WISDOM_KEEPER_KALIMDOR = 'Historiador de Kalimdor',
    AD_WISDOM_KEEPER_KALIMDOR = 'Obter as conquistas de missões listadas abaixo.',
    AN_WISDOM_KEEPER_EASTERN_KINGDOMS = 'Historiador dos Reinos do Leste',
    AD_WISDOM_KEEPER_EASTERN_KINGDOMS = 'Obter as conquistas de missões listadas abaixo.',
    AN_WISDOM_KEEPER_OUTLAND = 'Historiador de Terralém',
    AD_WISDOM_KEEPER_OUTLAND = 'Obter as conquistas das missões de Terralém listadas abaixo.',

    AN_RAGEFIRE_CHASM = 'Cavernas Ígneas',
    AD_RAGEFIRE_CHASM = 'Derrotar Taragaman, o Famélico.',
    AN_WAILING_CAVERNS = 'Caverna Ululante',
    AD_WAILING_CAVERNS = 'Derrotar Mutanus, o Devorador.',
    AN_DEAD_MINES = 'Minas Mortas',
    AD_DEAD_MINES = 'Derrotar Edwin VanCleef.',
    AN_SHADOWFANG_KEEP = 'Bastilha da Presa Negra',
    AD_SHADOWFANG_KEEP = 'Derrotar o Arquimago Arugal.',
    AN_BLACKFATHOM_DEEPS = 'Profundezas Negras',
    AD_BLACKFATHOM_DEEPS = 'Derrotar Aku\'mai.',
    AN_JAIL = 'Cárcere de Ventobravo',
    AD_JAIL = 'Derrotar Basílio Taborda.',
    AN_GNOMREGAN = 'Gnomeregan',
    AD_GNOMREGAN = 'Derrote o Mecangenheiro Termaplugue.',
    AN_RAZORFEN_KRAUL = 'Urzal dos Tuscos',
    AD_RAZORFEN_KRAUL = 'Derrotar Charlga Talhaflanco.',
    AN_SCARLET_MONASTERY = 'Monastério Escarlate',
    AD_SCARLET_MONASTERY = 'Derrotar a Cruzada Escarlate dentro dos Salões Escarlates.',
    AC_SCARLET_MONASTERY1 = 'Mago Sangrento Thalnos',
    AC_SCARLET_MONASTERY2 = 'Arcanista Doan',
    AC_SCARLET_MONASTERY3 = 'Herodes',
    AC_SCARLET_MONASTERY4 = 'Comandante Escarlate Mograine',
    AC_SCARLET_MONASTERY5 = 'Alta-inquisidora Cristalba',
	
    AN_RAZORFEN_DOWNS = 'Urzal dos Mortos',
    AD_RAZORFEN_DOWNS = 'Derrotar Amnennar, o Frigífero.',
    AN_ULDAMAN = 'Uldaman',
    AD_ULDAMAN = 'Derrote Arkhaedas.',
    AN_ZULFARRAK = 'Zul\'Farrak',
    AD_ZULFARRAK = 'Derrotar o Chefe Ukorz Escalpareia.',
    AN_MARAUDON = 'Maraudon',
    AD_MARAUDON = 'Derrotar a Princesa Theradras.',
    AN_SUNKEN_TEMPLE = 'Templo Submerso',
    AD_SUNKEN_TEMPLE = 'Derrotar o Vulto de Erânicos.',
	
    AN_NEW_EMPEROR = 'Abismo Rocha Negra',
    AD_NEW_EMPEROR = 'Derrotar o Imperador Dagran Thaurissan.',
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
	
    AN_BLACKROCK_SPIRE_BOTTOM = 'Pico da Rocha Negra Inferior',
    AD_BLACKROCK_SPIRE_BOTTOM = 'Derrotar o Lorde Supremo Serpethalak.',
    AN_BLACKROCK_SPIRE_UPPER = 'Pico da Rocha Negra Superior',
    AD_BLACKROCK_SPIRE_UPPER = 'Derrotar o General Drakkisath.',
    AN_BLACKROCK_SPIRE = 'Eindringling der Schwarzfelsspitze', --#--#--
    AD_BLACKROCK_SPIRE = 'Schließt die unten aufgelisteten Erfolge in der Schwarzfelsspitze ab.', --#--#--
    AN_DIRE_MAUL = 'Rei do Gládio Cruel',
    AD_DIRE_MAUL = 'Concluir todas as alas do Gládio Cruel.',
    AC_DIRE_MAUL1 = 'Azzin, o Selvamorfo',
    AC_DIRE_MAUL2 = 'Immol\'thar',
    AC_DIRE_MAUL3 = 'Rei Gordok',
    AN_STRATHOLME = 'Stratholme',
    AD_STRATHOLME = 'Derrotar os malignos gênios do crime que habitam Stratholme.',
	AC_STRATHOLME1 = 'Balnazzar',
	AC_STRATHOLME2 = 'Barão Rivendare',
    AN_SCHOLOMANCE = 'Scolomântia',
    AD_SCHOLOMANCE = 'Derrotar os líderes da Scolomântia.',
	AC_SCHOLOMANCE1 = 'Umbromestre Gandling',
	AC_SCHOLOMANCE2 = 'Ras Friomúrmuro',
    AN_YOUNG_DEFENDER = 'Mestre das masmorras clássicas',
    AD_YOUNG_DEFENDER = 'Obter as conquistas de masmorras clássicas listadas abaixo.',
    AN_DEFENDER = 'Verteidiger von Azeroth', --#--#--
    AD_DEFENDER = 'Schließt die unten aufgelisteten Dungeon-Erfolge ab.', --#--#--
    AR_DEFENDER = 'Verteidiger von Azeroth', --#--#--

    AN_ONYXIA = 'Onyxias Hort', --#--#--
    AD_ONYXIA = 'Bezwingt Onyxia.', --#--#--
    AN_AQ20 = 'Ruínas de Ahn\'Qiraj',
    AD_AQ20 = 'Derrotar Ossirian, o Intocado.',
    AN_ZULGURUB = 'Zul\'Gurub',
    AD_ZULGURUB = 'Derrotar Hakkar.',
    AN_RAGNAROS = 'Núcleo Derretido',
    AD_RAGNAROS = 'Derrotar Ragnaros.',
    AN_BLACK_WING_LAIR = 'Covil Asa Negra',
    AD_BLACK_WING_LAIR = 'Derrotar Nefarian.',
    AN_AQ40 = 'Templo de Ahn\'Qiraj',
    AD_AQ40 = 'Derrotar C\'Thun.',
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

    AN_PVP_RANK_A1 = 'Recruta',
    AN_PVP_RANK_A2 = 'Cabo',
    AN_PVP_RANK_A3 = 'Terceiro-sargento',
    AN_PVP_RANK_A4 = 'Segundo-sargento',
    AN_PVP_RANK_A5 = 'Primeiro-sargento',
    AN_PVP_RANK_A6 = 'Cavaleiro',
    AN_PVP_RANK_A7 = 'Tenente-cavaleiro',
    AN_PVP_RANK_A8 = 'Capitão-cavaleiro',
    AN_PVP_RANK_A9 = 'Campeão-cavaleiro',
    AN_PVP_RANK_A10 = 'Tenente-comandante',
    AN_PVP_RANK_A11 = 'Comandante',
    AN_PVP_RANK_A12 = 'Marechal',
    AN_PVP_RANK_A13 = 'Marechal-de-campo',
    AN_PVP_RANK_A14 = 'Grão-marechal',
    AN_PVP_RANK_H1 = 'Batedor',
    AN_PVP_RANK_H2 = 'Bruto',
    AN_PVP_RANK_H3 = 'Terceiro-sargento',
    AN_PVP_RANK_H4 = 'Segundo-sargento',
    AN_PVP_RANK_H5 = 'Primeiro-sargento',
    AN_PVP_RANK_H6 = 'Guarda Pétreo',
    AN_PVP_RANK_H7 = 'Guarda-de-Sangue',
    AN_PVP_RANK_H8 = 'Legionário',
    AN_PVP_RANK_H9 = 'Centurião',
    AN_PVP_RANK_H10 = 'Campeão',
    AN_PVP_RANK_H11 = 'Tenente-general',
    AN_PVP_RANK_H12 = 'General',
    AN_PVP_RANK_H13 = 'Senhor da Guerra',
    AN_PVP_RANK_H14 = 'Sumo Senhor da Guerra',
    AD_PVP_RANK = 'Den Titel "%s" erhalten.', --#--#--
    AN_PVP_FIRST_KILL = 'Abate honroso',
    AD_PVP_FIRST_KILL = 'Abater um jogador honrosamente.',
    AC_PVP_FIRST_KILL = 'Abater um jogador honrosamente.',
    AN_PVP_KILLS = '%d ehrenhafte Siege', --#--#--
    AD_PVP_KILLS = 'Erringt %d ehrenhafte Siege.', --#--#--
    AC_PVP_KILLS = 'Alcançar um total de %djogadores abatidos honrosamente',

    AN_MOB_KILLS_1 = 'Totschläger', --#--#--
    AN_MOB_KILLS_2 = 'Zerstörer', --#--#--
    AN_MOB_KILLS_3 = 'Brecher', --#--#--
    AN_MOB_KILLS_4 = 'Kopfgeldjäger', --#--#--
    AN_MOB_KILLS_5 = 'Gewittersturm aller Monster', --#--#--
    AN_MOB_KILLS_6 = 'Gewittersturm allen Lebens', --#--#--
    AN_MOB_KILLS_7 = 'Allgegenwärtiger Tod', --#--#--
    AD_MOB_KILLS = 'Tötet %d Gegner.', --#--#--
    AC_MOB_KILLS = 'Tötet %d Gegner', --#--#--

    AN_REPS_1 = 'Alguém gosta de mim',
    AD_REPS_1 = 'Tornar-se exaltado por uma facção.',
    AC_REPS_1 = 'Tornar-se exaltado por uma facção.',
    AN_REPS_X = 'Reputações de exaltado',
    AD_REPS = 'Tornar-se exaltado por %dfacções.',
    AC_REPS = 'Erreicht bei %d Fraktionen einen ehrfürchtigen Ruf.', --#--#--
    AR_REPS = 'Der Ehrfurchtgebietende', --#--#--

    AN_HORDE_REPS = 'Embaixador da Horda',
    AD_HORDE_REPS = 'Obter a reputação Exaltado com 5 cidades de facção.',
    AC_HORDE_REPS_1 = 'Exaltado por Orgrimmar',
    AC_HORDE_REPS_2 = 'Exaltado pelos Trolls Lançanegra',
    AC_HORDE_REPS_3 = 'Exaltado pela Cidade Baixa',
    AC_HORDE_REPS_4 = 'Exaltado pelo Penhasco do Trovão',
    AC_HORDE_REPS_5 = 'Exaltado por Luaprata',

    AN_ALLIANCE_REPS = 'Embaixador da Aliança',
    AD_ALLIANCE_REPS = 'Obter a reputação Exaltado com 5 cidades de facção.',
    AC_ALLIANCE_REPS_1 = 'Exaltado por Ventobravo',
    AC_ALLIANCE_REPS_2 = 'Exaltado por Darnassus',
    AC_ALLIANCE_REPS_3 = 'Exaltado pelos Exilados de Gnomeregan',
    AC_ALLIANCE_REPS_4 = 'Exaltado por Altaforja',
    AC_ALLIANCE_REPS_5 = 'Exaltado por Exodar',

    AN_ARGENT_DAWN = 'A Aurora Argêntea',
    AD_ARGENT_DAWN = 'Tornar-se exaltado pela Aurora Argêntea.',
    AN_BROOD_OF_NOZDORMU = 'Prole de Nozdormu',
    AD_BROOD_OF_NOZDORMU = 'Tornar-se exaltado pela Prole de Nozdormu.',
    AN_DARKMOON_FAIRE = 'Feira de Negraluna',
    AD_DARKMOON_FAIRE = 'Erreicht beim Dunkelmond-Jahrmarkt den Status ehrfürchtig.', --#--#--
    AN_ZANDALAR_TRIBE = 'Herói da Tribo Zandalar',
    AD_ZANDALAR_TRIBE = 'Tornar-se exaltado pela Tribo Zandalar.',
    AN_HYDRAXIANS = 'Senhores das Águas Hidraxianos',
    AD_HYDRAXIANS = 'Tornar-se exaltado pelos Senhores das Águas Hidraxianos.',
    AN_TIMBERMAW_HOLD = 'Eles me amam naquele túnel',
    AD_TIMBERMAW_HOLD = 'Tornar-se exaltado pelo Domínio dos Presamatos.',
    AN_THORIUM = 'Irmandade do Tório',
    AD_THORIUM = 'Erreicht bei der Thoriumbruderschaft den Status ehrfürchtig.', --#--#--
    AN_SHENDRALAR = 'Agent der Shen\'dralar', --#--#--
    AD_SHENDRALAR = 'Erreicht bei den Shen\'dralar den Status ehrfürchtig.', --#--#--
    AN_CENARION = 'Círculo Cenariano',
    AD_CENARION = 'Erreicht beim Zirkel des Cenarius den Status ehrfürchtig.', --#--#--

    AN_DEFILERS = 'O Profanador',
    AD_DEFILERS = 'Tornar-se exaltado pelos Profanadores Renegados.',
    AN_FROSTWOLF_CLAN = 'Herói do Clã Lobo do Gelo',
    AD_FROSTWOLF_CLAN = 'Tornar-se exaltado pelo Clã Lobo do Gelo.',
    AN_WARSONG_OUTRIDERS = 'Pioneiro Brado Guerreiro',
    AD_WARSONG_OUTRIDERS = 'Tornar-se exaltado pelos Pioneiros do Brado Guerreiro.',
    AN_HORDE_PVP_FRACTIONS = 'O Conquistador',
    AD_HORDE_PVP_FRACTIONS = 'Elevar sua reputação para exaltado pela Ravina Brado Guerreiro, pela Bacia Arathi e pelo Vale Alterac.',

    AN_LEAGUE_OF_ARATHOR = 'Cavaleiro de Arathor',
    AD_LEAGUE_OF_ARATHOR = 'Tornar-se exaltado pela Liga de Arathor.',
    AN_STORMSPIKE_GUARD = 'Herói da Guarda de Lançatroz',
    AD_STORMSPIKE_GUARD = 'Tornar-se exaltado pela Guarda de Lançatroz.',
    AN_SILVERWING_SENTINELS = 'Sentinela da Asa de Prata',
    AD_SILVERWING_SENTINELS = 'Tornar-se exaltado pelas Sentinelas da Asa de Prata.',
    AN_ALLIANCE_PVP_FRACTIONS = 'Justicar',
    AD_ALLIANCE_PVP_FRACTIONS = 'Elevar sua reputação para exaltado pela Ravina Brado Guerreiro, pela Bacia Arathi e pelo Vale Alterac.',

    AN_BOLVAR_SLAYER = 'Vendaval em Ventobravo',
    AD_BOLVAR_SLAYER = 'Matar o Grão-lorde Bolvar Fordragon.',
    AN_MAGNI_SLAYER = 'Morte ao Rei!',
    AD_MAGNI_SLAYER = 'Matar o Rei Magni Barbabronze.',
    AN_TYRANDE_SLAYER = 'Imortal é quem não morre de velhice',
    AD_TYRANDE_SLAYER = 'Matar a Alta-sacerdotisa Tyrande Murmuréolo.',
    AN_VELEN_SLAYER = 'O último que sair, apague a luz',
    AD_VELEN_SLAYER = 'Matar o Profeta Velen.',

    AN_ALLIANCE_KINGS_SLAYER = 'Pela Horda!',
    AD_ALLIANCE_KINGS_SLAYER = 'Matar os líderes da Aliança.',

    AN_THRALL_SLAYER = 'Morte ao Chefe Guerreiro!',
    AD_THRALL_SLAYER = 'Matar Thrall.',
    AN_SYLVANAS_SLAYER = 'Abaixo a Dama Sombria',
    AD_SYLVANAS_SLAYER = 'Matar a Grande Dama Sylvana Correventos.',
    AN_CAIRNE_SLAYER = 'Casco Ensanguentado',
    AD_CAIRNE_SLAYER = 'Matar Caerne Casco Sangrento.',
    AN_LORTHEMAR_SLAYER = 'Morto em Quel\'thalas',
    AD_LORTHEMAR_SLAYER = 'Matar Lor\'themar Theron.',

    AN_HORDE_KINGS_SLAYER = 'Pela Aliança!',
    AD_HORDE_KINGS_SLAYER = 'Matar os líderes da Horda.',

    AN_RACES_KILLER = 'Conhece teu inimigo',
    AD_ALLIANCE_RACES_KILLER = 'Desferir um golpe fatal honroso em cinco raças diferentes.',
    AD_HORDE_RACES_KILLER = 'Desferir um golpe fatal honroso em cinco raças diferentes.',
    AC_HUMAN_KILLED = 'Humano',
    AC_NIGHTELF_KILLED = 'Elfo Noturno',
    AC_DWARF_KILLED = 'Anão',
    AC_GNOME_KILLED = 'Gnomo',
    AC_ORC_KILLED = 'Orc',
    AC_TROLL_KILLED = 'Troll',
    AC_SCOURGE_KILLED = 'Morto-vivo',
    AC_TAUREN_KILLED = 'Tauren',
    AC_DRAENEI_KILLED = 'Draenei',
    AC_BLOODELF_KILLED = 'Elfo Sangrento',

    AN_CLASSES_KILLER = 'Golpes de classe',
    AD_CLASSES_KILLER = 'Desferir um golpe fatal honroso em cada uma das classes.',
    AC_WARRIOR_KILLED = 'Guerreiro',
    AC_HUNTER_KILLED = 'Caçador',
    AC_ROGUE_KILLED = 'Ladino',
    AC_PRIEST_KILLED = 'Sacerdote',
    AC_MAGE_KILLED = 'Mago',
    AC_WARLOCK_KILLED = 'Bruxo',
    AC_DRUID_KILLED = 'Druida',
    AC_PALADIN_KILLED = 'Paladino',
    AC_SHAMAN_KILLED = 'Xamã',

    AN_ALTERAC_WIN = 'Vitória no Vale Alterac',
    AD_ALTERAC_WIN = 'Vencer no Vale Alterac.',
    AN_ALTERAC_WINS = 'Veterano do Vale Alterac',
    AD_ALTERAC_WINS = 'Erringt %d Siege im Alteractal.', --#--#--
    AN_WARSONG_WIN = 'Vitória na Ravina Brado Guerreiro',
    AD_WARSONG_WIN = 'Vencer na Ravina Brado Guerreiro.',
    AN_WARSONG_WINS = 'Veterano da Ravina Brado Guerreiro',
    AD_WARSONG_WINS = 'Conquistar %dvitórias na Ravina Brado Guerreiro.',
    AN_ARATHI_WIN = 'Vitória na Bacia Arathi',
    AD_ARATHI_WIN = 'Vencer na Bacia Arathi.',
    AN_ARATHI_WINS = 'Veterano da Bacia Arathi',
    AD_ARATHI_WINS = 'Conquistar %dvitórias na Bacia Arathi.',
    AN_EYE_WIN = 'Vitória no Olho da Tormenta',
    AD_EYE_WIN = 'Vencer no Olho da Tormenta.',
    AN_EYE_WINS = 'Veterano do Olho da Tormenta',
    AD_EYE_WINS = 'Erringt %d Siege im Auge des Sturms.', --#--#--

    AN_ALTERAC_KILLING_BLOWS = 'Fleischwolf des Alteractals', --#--#--
    AD_ALTERAC_KILLING_BLOWS = 'Erreicht %d Todesstöße während einer einzigen Schlacht im Alteractal und bleibt bis zu deren Ende.', --#--#--
    AN_ALTERAC_GRAVEYARD_ASSAULT = 'Ladrão de Sepulturas de Alterac',
    AD_ALTERAC_GRAVEYARD_ASSAULT = 'Tomar 50 cemitérios no Vale Alterac.',
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
    AN_ALTERAC_AUTOGRAPH = 'Ao vencedor, as batatas',
    AD_ALTERAC_AUTOGRAPH = 'Saquear a Foto Autografada de Tigule no Vale Alterac.',

    AN_WARSONG_KILLS = 'Militärische Auszeichnung', --#--#--
    AD_WARSONG_KILLS = 'Erreicht %d ehrenhafte Siege während einer einzigen Schlacht in der Kriegshymnenschlucht und bleibt bis zu deren Ende.', --#--#--
    AN_WARSONG_FLAG_CAPTURE = 'Capturar a bandeira',
    AD_WARSONG_FLAG_CAPTURE = 'Transportar e capturar pessoalmente a bandeira na Ravina Brado Guerreiro.',
    AN_WARSONG_FLAG_CAPTURES = 'Großartiger Flaggenträger', --#--#--
    AD_WARSONG_FLAG_CAPTURES = 'Ergreift und erobert %d gegnerische Flaggen während einer einzigen Schlacht in der Kriegshymnenschlucht und bleibt bis zu deren Ende.', --#--#--
    AN_WARSONG_FLAG_RETURN = 'Fasst das nicht an!', --#--#--
    AD_WARSONG_FLAG_RETURN = 'Bringt als Verteidiger eine Flagge während einer einzigen Schlacht in der Kriegshymnenschlucht zurück und bleibt bis zu deren Ende.', --#--#--
    AN_WARSONG_FLAG_RETURNS = 'Defensor persistente',
    AD_WARSONG_FLAG_RETURNS = 'Bringt als Verteidiger %d Flaggen während einer einzigen Schlacht in der Kriegshymnenschlucht zurück und bleibt bis zu deren Ende.', --#--#--

    AN_ARATHI_BASE_ASSAULT = 'Konquistador', --#--#--
    AD_ARATHI_BASE_ASSAULT = 'Erobert eine Basis während einer einzigen Schlacht im Arathibecken und bleibt bis zu deren Ende.', --#--#--
    AN_ARATHI_BASE_ASSAULTS = 'Capitão Captura',
    AD_ARATHI_BASE_ASSAULTS = 'Erobert %d Basen während einer einzigen Schlacht im Arathibecken und bleibt bis zu deren Ende.', --#--#--
    AN_ARATHI_BASE_DEFEND = 'Beschützer', --#--#--
    AD_ARATHI_BASE_DEFEND = 'Verteidigt eine Basis während einer einzigen Schlacht im Arathibecken und bleibt bis zu deren Ende.', --#--#--
    AN_ARATHI_BASE_DEFENDS = 'Wächter', --#--#--
    AD_ARATHI_BASE_DEFENDS = 'Verteidigt %d Basen während einer einzigen Schlacht im Arathibecken und bleibt bis zu deren Ende.', --#--#--
    AN_ARATHI_CLOSE = 'Meus movimentos são friamente calculados',
    AD_ARATHI_CLOSE = 'Vencer na Bacia Arathi por 10 pontos de diferença (1600 a 1590).',
    AN_ARATHI_PERFECT = 'Perfeição da Bacia Arathi',
    AD_ARATHI_PERFECT = 'Vencer na Bacia Arathi com um placar de 1600 a 0.',

    AN_EYE_CAPTURE = 'Deixa comigo!',
    AD_EYE_CAPTURE = 'Pegar e capturar a bandeira no Olho da Tormenta.',
    AD_EYE_CAPTURES = 'Ergreift und erobert persönlich %d Flaggen im Auge des Sturms und bleibt bis zum Ende der Schlacht.', --#--#--
    AN_EYE_GLORY = 'Destinado à glória',
    AD_EYE_GLORY = 'Capturar a bandeira 3 vezes sem morrer em uma mesma batalha no Olho da Tormenta.',
    AN_EYE_FAST_WIN = 'Rajada',
    AD_EYE_FAST_WIN = 'Vencer no Olho da Tormenta em no máximo 6 minutos.',
    AN_EYE_BERSERK = 'Berserker sanguinário',
    AD_EYE_BERSERK = 'Desferir um golpe fatal sob efeito do bônus berserk no Olho da Tormenta.',
    AN_EYE_IDEAL_VICTORY = 'Tormenta perfeita',
    AD_EYE_IDEAL_VICTORY = 'Vencer no Olho da Tormenta com um placar de 1600 a 0.',

    AN_BGS_KILLING_BLOWS = 'Mortífero',
    AD_BGS_KILLING_BLOWS = 'Erringt %d Todesstöße auf einem beliebigen Schlachtfeld.', --#--#--
    AN_BGS_KILLS = 'O anjo da morte',
    AD_BGS_KILLS = 'Erringt %d ehrenhafte Siege auf einem beliebigen Schlachtfeld.', --#--#--

    PROF_FIRST_AID = 'Primeiros Socorros',
    PROF_FISHING = 'Pesca',
    PROF_COOKING = 'Culinária',
    PROF_ENCHANTING = 'Encantamento',
    PROF_TAILORING = 'Alfaiataria',
    PROF_ENGINEERING = 'Engenharia',
    PROF_LEATHERWORKING = 'Couraria',
    PROF_ALCHEMY = 'Alquimia',
    PROF_BLACKSMITHING = 'Ferraria',
    PROF_HERBALISM = 'Herborismo',
    PROF_MINING = 'Mineração',
    PROF_SKINNING = 'Esfolamento',
    PROF_JEWELCRAFTING = 'Joalheria',
    SKILL_UNARMED = 'Combate desarmado',
    SKILL_RIDING = 'Montaria',

    AN_PROFS_JOURNEYMAN = 'Lehrlingsprüfung', --#--#--
    AD_PROFS_JOURNEYMAN = 'Erlangt 75 Fertigkeitspunkte in einem Beruf.', --#--#--
    AN_PROFS_EXPERT = 'O Profissional',
    AD_PROFS_EXPERT = 'Tornar-se Profissional em uma profissão.',
    AN_PROFS_ARTISAN = 'O Perito',
    AD_PROFS_ARTISAN = 'Tornar-se Perito em uma profissão.',
    AN_PROFS_ONE = 'Professioneller Fachmann', --#--#--
    AD_PROFS_ONE = 'Erlangt 300 Fertigkeitspunkte in einem Beruf.', --#--#--
    AN_PROFS_ONE_OUTLAND = 'O Mestre',
    AD_PROFS_ONE_OUTLAND = 'Tornar-se Mestre em uma profissão.',
    AN_PROFS_TWO = 'Handwerker', --#--#--
    AD_PROFS_TWO = 'Werdet gleichzeitig in zwei Berufen Fachmann.', --#--#--
    AC_PROFS_TWO = 'Werdet gleichzeitig in zwei Berufen Fachmann.', --#--#--
    AN_PROFS_TWO_OUTLAND = 'Handwerker der Scherbenwelt', --#--#--
    AD_PROFS_TWO_OUTLAND = 'Werdet gleichzeitig in zwei Berufen Meister.', --#--#--
    AC_PROFS_TWO_OUTLAND = 'Werdet gleichzeitig in zwei Berufen Meister.', --#--#--

    AN_FIRST_AID_JOURNEYMAN = 'Lehrling in Erster Hilfe', --#--#--
    AD_FIRST_AID_JOURNEYMAN = 'Erlangt 75 Fertigkeitspunkte in Erster Hilfe.', --#--#--
    AN_FIRST_AID_EXPERT = 'Socorrista Profissional',
    AD_FIRST_AID_EXPERT = 'Tornar-se Profissional em Primeiros Socorros.',
    AN_FIRST_AID_ARTISAN = 'Socorrista Perito',
    AD_FIRST_AID_ARTISAN = 'Tornar-se Perito em Primeiros Socorros.',
    AN_FIRST_AID_MASTER = 'Fachmann in Erster Hilfe', --#--#--
    AD_FIRST_AID_MASTER = 'Erlangt 300 Fertigkeitspunkte in Erster Hilfe.', --#--#--
    AN_FIRST_AID_OUTLAND_MASTER = 'Mestre Socorrista',
    AD_FIRST_AID_OUTLAND_MASTER = 'Tornar-se Mestre em Primeiros Socorros.',
	
    AN_FISHING_JOURNEYMAN = 'Anglerlehrling', --#--#--
    AD_FISHING_JOURNEYMAN = 'Erlangt 75 Fertigkeitspunkte im Angeln.', --#--#--
    AN_FISHING_EXPERT = 'Pescador Profissional',
    AD_FISHING_EXPERT = 'Tornar-se Pescador Profissional.',
    AN_FISHING_ARTISAN = 'Pescador Perito',
    AD_FISHING_ARTISAN = 'Tornar-se Pescador Perito.',
    AN_FISHING_MASTER = 'Pescador Artífice',
    AD_FISHING_MASTER = 'Tornar-se Pescador Artífice.',
    AN_FISHING_OUTLAND_MASTER = 'Mestre Pescador',
    AD_FISHING_OUTLAND_MASTER = 'Tornar-se Mestre Pescador.',
	
    AN_COOKING_JOURNEYMAN = 'Kochlehrling', --#--#--
    AD_COOKING_JOURNEYMAN = 'Erlangt 75 Fertigkeitspunkte im Kochen.', --#--#--
    AN_COOKING_EXPERT = 'Cozinheiro Profissional',
    AD_COOKING_EXPERT = 'Tornar-se Cozinheiro Profissional.',
    AN_COOKING_ARTISAN = 'Cozinheiro Perito',
    AD_COOKING_ARTISAN = 'Tornar-se Cozinheiro Perito.',
    AN_COOKING_MASTER = 'Cozinheiro Artífice',
    AD_COOKING_MASTER = 'Tornar-se Cozinheiro Artífice.',
    AN_COOKING_OUTLAND_MASTER = 'Mestre Cozinheiro',
    AD_COOKING_OUTLAND_MASTER = 'Tornar-se Mestre Cozinheiro.',
	
    AN_PROFS_SECONDARY = 'Quem paga as contas aqui sou eu!',
    AD_PROFS_SECONDARY = 'Tornar-se Artífice em Pesca, Primeiros Socorros e Culinária.',
    AN_PROFS_SECONDARY_OUTLAND = 'Quem paga as contas aqui sou eu!',
    AD_PROFS_SECONDARY_OUTLAND = 'Tornar-se Mestre em Pesca, Primeiros Socorros e Culinária.',
    AN_PROFS_FIVE = 'Genie', --#--#--
    AN_PROFS_FIVE_OUTLAND = 'Genie der Scherbenwelt', --#--#--
    AD_PROFS_FIVE = 'Erlangt die unten aufgelisteten Berufserfolge.', --#--#--
    AN_UNARMED_SKILL = 'Alguém pediu uma surra?',
    AD_UNARMED_SKILL = 'Treinar a perícia de Combate Desarmado até o nível 350.',

    AN_EXPLORE_AZEROTH = 'O Explorador',
    AD_EXPLORE_AZEROTH = 'Explorar Reinos do Leste, Kalimdor e Terralém.',
	AR_EXPLORER = 'Entdecker', --#--#--
    AN_EXPLORE_KALIMDOR = 'Explorar Kalimdor',
    AD_EXPLORE_KALIMDOR = 'Explorar todas as regiões de Kalimdor.',
    AN_EXPLORE_EASTERN_KINGDOMS = 'Explorar os Reinos do Leste',
    AD_EXPLORE_EASTERN_KINGDOMS = 'Explorar todas as regiões dos Reinos do Leste.',
	AN_EXPLORE = 'Erforscht %s', --#--#--
    AD_EXPLORE = 'Erforscht %s und enthüllt die verdeckten Gebiete auf der Weltkarte.', --#--#--

    AN_SULFURAS = 'Sulfuras, a Mão de Ragnaros',
    AD_SULFURAS = 'Empunhar Sulfuras, a Mão de Ragnaros.',
    AN_THUNDER_FURY = 'Tormentária',
    AD_THUNDER_FURY = 'Empunhar Tormentária, a Lâmina Sagrada do Perseguidor dos Ventos.',
    AN_ATIESH = 'Atiesh, Grande Cajado do Guardião',
    AD_ATIESH = 'Empunhar Atiesh, o Grande Cajado do Guardião.',
    AN_BLACK_SCARAB = 'Senhor dos Escaravelhos',
    AD_BLACK_SCARAB = 'Participou da abertura dos portões de Ahn\'Qiraj.',
    AN_RED_SCARAB = 'Pra quê? Pra ver melhor...',
    AD_RED_SCARAB = 'Obter um Cristal Ressonante Qiraji Vermelho.',
	AN_TIGER_MOUNT = 'Tigre Zulian Veloz',
    AD_TIGER_MOUNT = 'Obter o Tigre Zulian Veloz do Sumo Sacerdote Thekal em Zul\'Gurub.',
	AN_RAPTOR_MOUNT = 'Raptor Razzashi Veloz',
    AD_RAPTOR_MOUNT = 'Obter o Raptor Razzashi Veloz do Sangrelorde Mandokir em Zul\'Gurub',
	AN_BARON_MOUNT = 'Rédeas do Corcel da Morte',
    AD_BARON_MOUNT = 'Obter as Rédeas do Corcel da Morte do Barão Rivendare em Stratholme.',
	AN_SABER_MOUNT = 'Sabre-de-gelo de Hibérnia',
    AD_SABER_MOUNT = 'Obter um Sabre-de-gelo de Hibérnia.',
    AN_ARGENT_DAWN_TABARD = 'Tabardo da Aurora Argêntea',
    AD_ARGENT_DAWN_TABARD = 'Obter um Tabardo da Aurora Argêntea no evento da Invasão do Flagelo.',
    
    AN_UNCOMMON_GEAR = 'Selten', --#--#--
    AD_UNCOMMON_GEAR = 'Legt an jedem Platz einen Gegenstand von seltener Qualität an.', --#--#--
    AN_RARE_GEAR = 'Superior',
    AD_RARE_GEAR = 'Equipar-se total e exclusivamente com itens superiores de nível 115 ou mais alto.',
    AN_EPIC_GEAR = 'Épico',
    AD_EPIC_GEAR = 'Equipar-se total e exclusivamente com itens épicos de nível 115 ou mais alto.',

    AN_STOCKING_UP = 'Farmácia particular',
    AD_STOCKING_UP = 'Criar 500 Bandagens Grossas de Etertrama.',
    AC_STOCKING_UP = 'Stellt 100 schwere Runenstoffverbände her', --#--#--
    AN_STOCKING_UP_2 = 'Farmácia particular',
    AD_STOCKING_UP_2 = 'Criar 500 Bandagens Grossas de Runatrama.',
    AC_STOCKING_UP_2 = 'Criar 500 Bandagens Grossas de Runatrama.',
    AN_STOCKING_UP_OUTLAND = 'Vorbereitung für die Leere', --#--#--
    AD_STOCKING_UP_OUTLAND = 'Stellt 100 schwere Netherstoffverbände her.', --#--#--
    AC_STOCKING_UP_OUTLAND = 'Stellt 100 schwere Netherstoffverbände her', --#--#--
    AN_STOCKING_UP_2_OUTLAND = 'Farmácia particular',
    AD_STOCKING_UP_2_OUTLAND = 'Criar 500 Bandagens Grossas de Etertrama.',
    AC_STOCKING_UP_2_OUTLAND = 'Criar 500 Bandagens Grossas de Etertrama.',

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
	
	AN_FISHING_COUNT = '%dpeixes',
	AC_FISHING_COUNT = 'Angelt %d Gegenstände oder Fische.', --#--#--
	AD_FISHING_COUNT = 'Pescar %dpeixes.',

    AN_COOKING_RECIPES_5 = 'Merendeiro',
    AN_COOKING_RECIPES_10 = 'Cozinheiro de boteco',
    AN_COOKING_RECIPES_25 = 'Chef de Partie',
    AN_COOKING_RECIPES_50 = 'Sous Chef',
    AN_COOKING_RECIPES_75 = 'Chef de Cuisine', --#--#--
    AR_COOKING_RECIPES = 'Chefkoch', --#--#--
    AD_COOKING_RECIPES = 'Aprender %dreceitas de culinária.',
    AC_COOKING_RECIPES = 'Lernt %d Kochrezepte', --#--#--

    AN_COOKING_SOUP = 'Suppenkocher', --#--#--
    AN_COOKING_DESSERT = 'Knollenmeister', --#--#--
    AN_COOKING_SQUID = 'Fang des Tages', --#--#--
    AN_COOKING_DUMPLINGS = 'Omas Knödel', --#--#--
    AN_COOKING_CAKE = 'O Bolo é Real!',
    AD_COOKING_CAKE = 'Preparar um Bolo de Chocolate Delicioso.',
    AD_COOKING_CREATE = 'Kocht %s %d-mal.', --#--#--
    AC_COOKING_CREATE = 'Kocht %s %d-mal', --#--#--
    AN_COOKING_BIG_TABLE = 'Salve o chef!',
    AD_COOKING_BIG_TABLE = 'Obter as conquistas de culinária listadas abaixo.',

    AN_COOKING_FISHERMANS_FEAST = 'Banquete do Pescador',
    AN_COOKING_SPICY_HOT_TALBUK = 'Talbuque Apimentado',
    AN_COOKING_SKULLFISH_SOUP = 'Sopa de Kranikola',
    AN_COOKING_RAVAGER_DOG = 'Cachorro-quente de Assolador',

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

    AN_DUEL = 'Duelicioso',
    AD_DUEL = 'Vencer um duelo contra outro jogador.',
    AN_DUELS_10 = 'Duelista',
    AN_DUELS_25 = 'Geübter Duellist', --#--#--
    AN_DUELS_100 = 'Meister-Duellist', --#--#--
    AD_DUELS = 'Gewinnt in %d Duellen.', --#--#--
    AC_DUELS = 'Gewinnt in %d Duellen', --#--#--
    AN_GURUBASHI_1 = 'Mestre da Arena de Gurubashi',
    AD_GURUBASHI_1 = 'Obter o berloque Mestre da Arena na Arena de Gurubashi.',
    AN_GURUBASHI_2 = 'Grande Mestre da Arena de Gurubashi',
    AD_GURUBASHI_2 = 'Cumprir a missão do João Tampinha Mithril para obter o berloque Grande Mestre da Arena.',
    AN_PARTICIPATE_IN_BGS = 'Chamado às armas!',
    AD_PARTICIPATE_IN_BGS = 'Schließt %d Schlachtfelder ab.', --#--#--
    AC_PARTICIPATE_IN_BGS = 'Schließt %d Schlachtfelder ab.', --#--#--

    EMOTE_LOVE1 = 'Ihr liebt %s.', --#--#--
    AN_LOVE = 'Aos bichinhos, com amor',
    AD_LOVE = 'Mostrar aos bichos de Azeroth o que é /amar.',
    EMOTE_PAT1 = 'Ihr streichelt %s.', --#--#--
    AN_ARATHI_CATS = 'Katzen sind am wichtigsten', --#--#--
    AD_ARATHI_CATS = 'Streichelt die angegebenen Haustiere im Arathibecken (/streicheln).', --#--#--

    AN_ALTERAC_FAST_WIN = 'Alterac relâmpago',
    AD_ALTERAC_FAST_WIN = 'Vencer no Vale Alterac em no máximo 6 minutos.',
    AN_WARSONG_FAST_WIN = 'Domínio da Ravina',
    AD_WARSONG_FAST_WIN = 'Vencer na Ravina Brado Guerreiro em no máximo 7 minutos.',
    AN_ARATHI_FAST_WIN = 'Vamos acabar logo com isso',
    AD_ARATHI_FAST_WIN = 'Vencer na Bacia Arathi em no máximo 6 minutos.',

    AN_ALTERAC_TOWER_DEFEND_TOTAL = 'Defender a torre',
    AD_ALTERAC_TOWER_DEFEND_TOTAL = 'Defender %dtorres no Vale Alterac.',
    AN_ALTERAC_GRAVEYARD_ASSAULT_TOTAL = 'Ladrão de Sepulturas de Alterac',
    AD_ALTERAC_GRAVEYARD_ASSAULT_TOTAL = 'Tomar %dcemitérios no Vale Alterac.',
    AN_WARSONG_FLAG_CAPTURE_TOTAL = 'Capturar a bandeira',
    AD_WARSONG_FLAG_CAPTURE_TOTAL = 'Ergreift und erobert persönlich %d Flaggen in der Kriegshymnenschlucht.', --#--#--
    AN_WARSONG_FLAG_RETURN_TOTAL = 'Defensor persistente',
    AD_WARSONG_FLAG_RETURN_TOTAL = 'Recuperar %dbandeiras na Ravina Brado Guerreiro.',
    AN_ARATHI_BASE_ASSAULT_TOTAL = 'Capitão Captura',
    AD_ARATHI_BASE_ASSAULT_TOTAL = 'Tomar %dbandeiras na Bacia Arathi.',
    AN_ARATHI_BASE_DEFEND_TOTAL = 'Ao resgate!',
    AD_ARATHI_BASE_DEFEND_TOTAL = 'Defender e recapturar a bandeira de uma base na Bacia Arathi %dvezes.',
    AN_ALTERAC_MOUNT_HORDE = 'Uivador Lobo do Gelo',
    AD_ALTERAC_MOUNT_HORDE = 'Obter um Uivador Lobo do Gelo.',
    AN_ALTERAC_MOUNT_ALLIANCE = 'Carneiro de Batalha Lançatroz',
    AD_ALTERAC_MOUNT_ALLIANCE = 'Obter um Carneiro de Batalha Lançatroz.',

    AN_ALTERAC_BOSS = 'Mestre do Vale Alterac',
    AD_ALTERAC_BOSS = 'Obter as conquistas do Vale Alterac listadas abaixo.',
    AN_WARSONG_BOSS = 'Mestre da Ravina Brado Guerreiro',
    AD_WARSONG_BOSS = 'Obter as conquistas da Ravina Brado Guerreiro listadas abaixo.',
    AN_ARATHI_BOSS = 'Mestre da Bacia Arathi',
    AD_ARATHI_BOSS = 'Obter as conquistas da Bacia Arathi listadas abaixo.',
    AN_EYE_BOSS = 'Mestre do Olho da Tormenta',
    AD_EYE_BOSS = 'Obter as conquistas do Olho da Tormenta listadas abaixo.',
    AN_BATTLEMASTER = 'Mestre de Batalha',
    AD_BATTLEMASTER = 'Obter as conquistas de campo de batalha listadas abaixo.',
    AR_BATTLEMASTER = 'Título: Mestre de Batalha',

    AN_LEEROY = 'Leeeeeeeeeeeeeroy!',
    AD_LEEROY = 'Matar 50 dragonetes de viveiro em, no máximo, 15 segundos.',
    AR_LEEROY = 'Título: Jenkins',
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
	
	AN_PIRATES_HAT = 'Ioho, Almirante!',
	AD_PIRATES_HAT = 'Obter o Chapéu do Almirante dos Vela Sangrenta... e tentar respirar um pouco de ar fresco de vez em quando.',
	AR_PIRATES_HAT = 'Título: Almirante dos Vela Sangrenta',
	AN_PALADIN_MOUNT = 'Corcel',
	AD_PALADIN_MOUNT = 'Completar a missão de paladino para obter um Corcel.',
	AN_WARLOCK_MOUNT = 'Corcel Medonho de Zorote',
	AD_WARLOCK_MOUNT = 'Completar a missão de bruxo Corcel Medonho de Zorote.',
	
	AN_HALLOWSEND = 'Eu sou o terror que voa na noite',
	AD_HALLOWSEND = 'Obter as conquistas da Noturnália listadas abaixo.',
	AR_HALLOWSEND = 'Título: o Noturno',
	
	AN_PUMPKIN = 'Ziemlich gruselig', --#--#--
	AD_PUMPKIN = 'Erhaltet eine Kürbistasche während der Schlotternächte.', --#--#--
	AN_HALLOWSEND_ALLIANCE_QUEST1 = 'Arruinando Noturnália',
	AD_HALLOWSEND_ALLIANCE_QUEST1 = 'Arruinar a Noturnália para a Horda cumprindo as missões do Sargento Hartman, que envolvem ir de penetra ao Festival do Homem de Palha e remover as bombas de mau cheiro da Costa Sul.',
	AC_HALLOWSEND_ALLIANCE_QUEST1_CRITERIA1 = 'Penetra no Festival do Homem de Palha',
	AC_HALLOWSEND_ALLIANCE_QUEST1_CRITERIA2 = 'O poder do pinho',
	AN_HALLOWSEND_HORDE_QUEST1 = 'Arruinando Noturnália',
	AD_HALLOWSEND_HORDE_QUEST1 = 'Arruinar a Noturnália para a Aliança cumprindo as missões da Invoca-trevas Yanka, que envolvem ir à Costa Sul, estragar os barris com ovos podres e jogar bombas de mau cheiro na cidade.',
	AC_HALLOWSEND_HORDE_QUEST1_CRITERIA1 = 'Ovos Podres e Barris arruinados',
	AC_HALLOWSEND_HORDE_QUEST1_CRITERIA2 = 'Fedor na Costa Sul',
	
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
	
	AN_HALLOWSEND_TREATS = 'Travessuras ou Gostosuras!',
	AD_HALLOWSEND_TREATS = 'Obter um punhado de doces em um dos Baldes de Balas localizados nas estalagens.',
	
	AN_HALLOWSEND_MASK = 'O Máscara',
	AD_HALLOWSEND_MASK = 'Obter uma Máscara Frágil durante a Noturnália.',
	
	AN_HALLOWSEND_MASKS = 'Máscaras para todas as ocasiões',
	AD_HALLOWSEND_MASKS = 'Obter as 20 Máscaras Frágeis listadas abaixo.',
	
	AN_HALLOWSEND_TRANSFORM = 'Baile de máscaras',
	AD_HALLOWSEND_TRANSFORM = 'Ser transformado pelas Varinhas Feiticeiras listadas abaixo.',
	AC_HALLOWSEND_GHOST = 'Transformado pela Varinha Feiticeira - Fantasma',
	AC_HALLOWSEND_GNOME = 'Transformado pela Varinha Feiticeira - Gnomo Leproso',
	AC_HALLOWSEND_WISP = 'Transformado pela Varinha Feiticeira - Fogo Fátuo',
	AC_HALLOWSEND_NINJA = 'Transformado pela Varinha Feiticeira - Ninja',
	AC_HALLOWSEND_SKELETON = 'Transformado pela Varinha Feiticeira - Esqueleto',
	AC_HALLOWSEND_PIRATE = 'Transformado pela Varinha Feiticeira - Pirata',
	AC_HALLOWSEND_BAT = 'Transformado pela Varinha Feiticeira - Morcego',

    --WINTERVEIL
    AN_WINTERVEIL = 'Ajudante de Papai Inverno',
	AD_WINTERVEIL = 'Obter as conquistas do Véu de Inverno listadas abaixo.',
	AR_WINTERVEIL = 'Título: Ajudante de Papai Inverno',

    AN_WINTERVEIL_METZEN = 'Corra, Metzen, Corra',
	AD_WINTERVEIL_METZEN = 'Salvar Metzen, a Rena.',

    AN_WINTERVEIL_SMOKEYWOOD = 'Simplesmente abominável!',
	AD_WINTERVEIL_SMOKEYWOOD = 'Cumprir a missão para recuperar as gostosuras roubadas da Fazenda Bosque Defumado e receber um Agradecimento da Fazenda Bosque Defumado.',

    AN_WINTERVEIL_GOURMET = 'O gourmet de Véu de Inverno',
	AD_WINTERVEIL_GOURMET = 'Durante a Festa do Véu de Inverno, use sua habilidade culinária para produzir um Biscoito de Gengibre, uma Gemada e uma Cidra de Maçã Quente.',
    AC_WINTERVEIL_GOURMET_CRITERIA1 = 'Biscoito de Gengibre',
    AC_WINTERVEIL_GOURMET_CRITERIA2 = 'Gemada',

    AN_WINTERVEIL_PRESENTS = 'Ele sabe se você andou aprontando',
	AD_WINTERVEIL_PRESENTS = 'Abrir um dos presentes sob a árvore de Véu de Inverno.',

    AN_WINTERVEIL_SNOWBALL_ALLIANCE = 'Guerra fria',
	AD_WINTERVEIL_SNOWBALL_ALLIANCE = 'Jogar uma bola de neve no Rei Magni Barbabronze durante a Festa do Véu de Inverno.',

    AN_WINTERVEIL_SNOWBALL_HORDE = 'Guerra fria',
	AD_WINTERVEIL_SNOWBALL_HORDE = 'Jogar uma bola de neve em Caerne Casco Sangrento durante a Festa do Véu de Inverno.',

    AN_WINTERVEIL_PVP = 'Um ajudante invernal',
    AD_WINTERVEIL_PVP = 'Alcançar um total de 50 Jogadores Abatidos Honrosamente enquanto transformado em um Ajudante do Papai Inverno pela máquina Voltímato de Inverno.',

    --VALENTINES
    AN_VALENTINES = 'Liebestoll', --#--#--
	AD_VALENTINES = 'Schließt die unten aufgelisteten Erfolge von \'Liebe liegt in der Luft\' ab.', --#--#--

    AN_VALENTINES_ROSES = 'Sag\'s mit Rosen', --#--#--
    AD_VALENTINES_ROSES = 'Erhaltet während der \'Liebe liegt in der Luft\'-Feierlichkeiten einen roten Rosenstrauß.', --#--#--

    AN_VALENTINES_QUEST = 'Gefährliche Liebschaft', --#--#--
    AD_VALENTINES_QUEST = 'Helft dem Dampfdruckkartell dabei, den Plan der Chemiemanufaktur Krone zu vereiteln.', --#--#--

    AN_VALENTINES_CHOCOLATES = 'Naschkatze', --#--#--
    AD_VALENTINES_CHOCOLATES = 'Probiert die unten aufgelisteten \'Liebe liegt in der Luft\'-Süßigkeiten.', --#--#--
    AC_VALENTINES_CHOCOLATES_CRITERIA1 = 'Desejo Negro',
    AC_VALENTINES_CHOCOLATES_CRITERIA2 = 'Delícia de Leitelho',
    AC_VALENTINES_CHOCOLATES_CRITERIA3 = 'Doce Surpresa',
    AC_VALENTINES_CHOCOLATES_CRITERIA4 = 'Creme Absoluta Fruta',

    AN_VALENTINES_DRESS = 'Das reizende Glück ist auf Eurer Seite', --#--#--
    AD_VALENTINES_DRESS = 'Öffnet einen reizenden Kleiderkarton und erhaltet ein reizendes schwarzes Kleid.', --#--#--

    AN_VALENTINES_PIDO = 'Perma-Pido', --#--#--
    AD_VALENTINES_PIDO = 'Erhaltet ein permanentes Q. Pido-Haustier, indem Ihr einen Echtsilberschaftpfeil erbeutet.', --#--#--

    --LUNAR
    AN_LUNAR = 'Respeito aos mais velhos',
	AD_LUNAR = 'Obter as conquistas do Festival da Lua listadas abaixo.',

    AN_LUNAR_COIN = 'Moeda dos Ancestrais',
    AD_LUNAR_COIN = 'Receber uma Moeda dos Ancestrais.',

    AN_LUNAR_COINS = '%dMoedas dos Ancestrais',
    AD_LUNAR_COINS = 'Receber %dMoedas dos Ancestrais.',

    AN_LUNAR_QUEST = 'Bênção de Eluna',
    AD_LUNAR_QUEST = 'Cumprir a missão Bênção de Eluna e derrotar Agouro.',

    AN_LUNAR_CLOTHES = 'Vestido a caráter',
    AD_LUNAR_CLOTHES = 'Comprar uma calça festiva ou um vestido festivo com Moedas dos Ancestrais.',

    AN_LUNAR_ELDERS_DUNGEONS = 'Anciãos das Masmorras',
    AD_LUNAR_ELDERS_DUNGEONS = 'Reverenciar os Anciãos localizados dentro das masmorras.',
    AC_LUNAR_ELDERS_DUNGEONS_8727 = 'Urahne Fernwisper', --#--#--
    AC_LUNAR_ELDERS_DUNGEONS_8619 = 'Urahne Schwermut', --#--#--
    AC_LUNAR_ELDERS_DUNGEONS_8635 = 'Urahne Splitterfels', --#--#--
    AC_LUNAR_ELDERS_DUNGEONS_8713 = 'Urahne Sternensang', --#--#--
    AC_LUNAR_ELDERS_DUNGEONS_8644 = 'Urahne Steinwehr', --#--#--
    AC_LUNAR_ELDERS_DUNGEONS_8676 = 'Urahne Wildmähne', --#--#--

    AN_LUNAR_ELDERS_HORDE = 'Anciãos da Horda',
    AD_LUNAR_ELDERS_HORDE = 'Reverenciar os Anciãos localizados nas capitais da Horda.',
    AC_LUNAR_ELDERS_HORDE_8678 = 'Ancião Casco de Trigo no Penhasco do Trovão',
    AC_LUNAR_ELDERS_HORDE_8648 = 'Ancião Negrocerne na Cidade Baixa',
    AC_LUNAR_ELDERS_HORDE_8677 = 'Anciã Chifre Preto em Orgrimmar',

    AN_LUNAR_ELDERS_ALLIANCE = 'Anciãos da Aliança',
    AD_LUNAR_ELDERS_ALLIANCE = 'Reverenciar os Anciãos localizados nas capitais da Aliança.',
    AC_LUNAR_ELDERS_ALLIANCE_8718 = 'Ancião Açolesto em Darnassus',
    AC_LUNAR_ELDERS_ALLIANCE_8866 = 'Ancião Barbabronze na Altaforja',
    AC_LUNAR_ELDERS_ALLIANCE_8646 = 'Ancião Malhogrito em Ventobravo',

    AN_LUNAR_ELDERS_EASTERN_KINGDOMS = 'Anciãos dos Reinos do Leste',
    AD_LUNAR_ELDERS_EASTERN_KINGDOMS = 'Reverenciar os Anciãos localizados nos Reinos do Leste.',
    AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8636 = 'Ancião Troapedra nas Estepes Ardentes',
    AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8651 = 'Ancião Bandaferro na Garganta Abrasadora',
    AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8652 = 'Ancião Nascitumba em Montalvo',
    AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8674 = 'Ancião Casco Invernal na Angra do Butim',
    AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8716 = 'Ancião Clarestela em Zul\'Gurub',
    AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8643 = 'Ancião Topoalto nas Terras Agrestes',
    AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8675 = 'Anciã Persegue-céus no Morro da Sentinela',
    AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8649 = 'Ancião Tempescenho em Vila d\'Ouro',
    AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8650 = 'Ancião Laureaneve na Capela Esperança da Luz',
    AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8642 = 'Ancião Venaprata em Thelsamar',
    AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8645 = 'Ancião Obsidiano no Sepulcro',
    AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8722 = 'Anciã Correcampo nas Terras Pestilentas Ocidentais',
    AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8647 = 'Ancião Vocifúria na Barreira do Inferno',
    AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8653 = 'Ancião Poçodouro em Kharanos',
    AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8714 = 'Anciã Raioluna na Scolomântia',
    AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8688 = 'Ancião Andavento nas Terras Pestilentas Orientais',
    AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8683 = 'Anciã Andarilha da Aurora no Monte Candente',

    AN_LUNAR_ELDERS_KALIMDOR = 'Anciãos de Kalimdor',
    AD_LUNAR_ELDERS_KALIMDOR = 'Reverenciar os Anciãos localizados em Kalimdor.',
    AC_LUNAR_ELDERS_KALIMDOR_8673 = 'Ancião Casco Sangrento na Aldeia Casco Sangrento',
    AC_LUNAR_ELDERS_KALIMDOR_8723 = 'Ancião Noctéolas na Selva Maleva',
    AC_LUNAR_ELDERS_KALIMDOR_8684 = 'Ancião Vidente Onírico em Geringontzan',
    AC_LUNAR_ELDERS_KALIMDOR_8726 = 'Anciã Setalume em Hibérnia',
    AC_LUNAR_ELDERS_KALIMDOR_8725 = 'Anciã Cantoflúvio em Astranaar',
    AC_LUNAR_ELDERS_KALIMDOR_8715 = 'Ancião Folhâmina em Dolanaar',
    AC_LUNAR_ELDERS_KALIMDOR_8681 = 'Ancião Chifre Troante em Un\'Goro',
    AC_LUNAR_ELDERS_KALIMDOR_8680 = 'Anciã Totem do Vento em Vila Catraca',
    AC_LUNAR_ELDERS_KALIMDOR_8720 = 'Ancião Brilhacéu em Azshara',
    AC_LUNAR_ELDERS_KALIMDOR_8670 = 'Anciã Runa Totem no Monte Navalha',
    AC_LUNAR_ELDERS_KALIMDOR_8672 = 'Ancião Agulha de Pedra na Visteterna',
    AC_LUNAR_ELDERS_KALIMDOR_8686 = 'Ancião Monte Alto no Acampamento Taurajo',
    AC_LUNAR_ELDERS_KALIMDOR_8654 = 'Ancião Primapedra em Silithus',
    AC_LUNAR_ELDERS_KALIMDOR_8671 = 'Anciã Totem da Fúria em Tanaris',
    AC_LUNAR_ELDERS_KALIMDOR_8724 = 'Anciã Serenalva no Circuito da Ilusão',
    AC_LUNAR_ELDERS_KALIMDOR_8685 = 'Anciã Andanévoa no Gládio Cruel',
    AC_LUNAR_ELDERS_KALIMDOR_8721 = 'Anciã Tecestrela em Auberdine',
    AC_LUNAR_ELDERS_KALIMDOR_8717 = 'Ancião Velaluna na Encruzilhada',
    AC_LUNAR_ELDERS_KALIMDOR_8719 = 'Anciã Chialâmina no Forte Cenariano',
    AC_LUNAR_ELDERS_KALIMDOR_8682 = 'Ancião Vidente do Céu na Aldeia Vento Livre',
    AC_LUNAR_ELDERS_KALIMDOR_8679 = 'Ancião Temível Totem em Feralas',

    --NOBLEGARDEN
    AN_NOBLEGARDEN_CLOTHES = 'Traje de domingo',
    AD_NOBLEGARDEN_CLOTHES = 'Encontre uma Camisa Branca de Smoking e uma Calça Preta de Smoking abrindo os Ovos Coloridos Brilhantes durante a comemoração do Jardinova.',
    AC_NOBLEGARDEN_CLOTHES_CRITERIA1 = 'Camisa Branca de Smoking',
    AC_NOBLEGARDEN_CLOTHES_CRITERIA2 = 'Calça Preta de Smoking',

    AN_NOBLEGARDEN_DRESS = 'Olha que vestido lindo!',
    AD_NOBLEGARDEN_DRESS = 'Encontrar um Vestido Elegante abrindo os Ovos Coloridos Brilhantes durante a comemoração do Jardinova.',

    --CHILDRENS WEEK
    AN_CHILDREN = 'Pelas criancinhas',
    AD_CHILDREN = 'Obter as conquistas da Semana das Crianças listadas abaixo.',
    AR_CHILDREN = 'Título: Tia/Tio',

    AN_CHILDREN_PET = 'Ahh, não é uma gracinha?!',
    AD_CHILDREN_PET = 'Obter uma das mascotes da Semana das Crianças.',

    AN_CHILDREN_PETS = 'Uma babá quase perfeita',
    AD_CHILDREN_PETS = 'Obter o Ovo de Egberto, Júnior Dorminhoco e a Coleira de Treinamento de Elekk com um mesmo personagem.',
    AC_CHILDREN_PETS1 = 'Coleira de Treinamento de Elekk',
    AC_CHILDREN_PETS2 = 'Júnior Dorminhoco',
    AC_CHILDREN_PETS3 = 'Ovo de Egberto',

    --MIDSUMMER
    AN_MIDSUMMER = 'Protetor da Chama',
    AD_MIDSUMMER = 'Obter as conquistas do Solstício listadas abaixo.',

    AN_MIDSUMMER_QUEST1 = 'Rei do Festival do Fogo',
    AD_MIDSUMMER_QUEST1 = 'Cumprir a missão "A recompensa de um ladrão", em que você tem que roubar as chamas das capitais da facção inimiga.',

    AN_MIDSUMMER_AHUNE = 'Congelando o senhor do gelo',
    AD_MIDSUMMER_AHUNE = 'Matar Ahune no Pátio dos Escravos.',

    AN_MIDSUMMER_DESECRATION_HORDE = 'Profanação da Aliança',
    AD_MIDSUMMER_DESECRATION_HORDE = 'Obter as conquistas Extinguindo os Reinos do Leste, Extinguindo Kalimdor e Extinguindo Terralém.',

    AN_MIDSUMMER_DESECRATION_HORDE_KALIMDOR = 'Extinguindo Kalimdor',
    AD_MIDSUMMER_DESECRATION_HORDE_KALIMDOR = 'Profanar as fogueiras da Aliança em Kalimdor.',
    AC_MIDSUMMER_DESECRATION_HORDE_KALIMDOR_CRITERIA_11744 = 'Pântano Vadeoso',
    AC_MIDSUMMER_DESECRATION_HORDE_KALIMDOR_CRITERIA_11734 = 'Vale Gris',
    AC_MIDSUMMER_DESECRATION_HORDE_KALIMDOR_CRITERIA_11738 = 'Ilha Névoa Rubra',
    AC_MIDSUMMER_DESECRATION_HORDE_KALIMDOR_CRITERIA_11740 = 'Costa Negra',
    AC_MIDSUMMER_DESECRATION_HORDE_KALIMDOR_CRITERIA_11746 = 'Feralas',
    AC_MIDSUMMER_DESECRATION_HORDE_KALIMDOR_CRITERIA_11760 = 'Silithus',
    AC_MIDSUMMER_DESECRATION_HORDE_KALIMDOR_CRITERIA_11753 = 'Teldrassil',
    AC_MIDSUMMER_DESECRATION_HORDE_KALIMDOR_CRITERIA_11762 = 'Tanaris',
    AC_MIDSUMMER_DESECRATION_HORDE_KALIMDOR_CRITERIA_11741 = 'Desolação',
    AC_MIDSUMMER_DESECRATION_HORDE_KALIMDOR_CRITERIA_11763 = 'Hibérnia',
    AC_MIDSUMMER_DESECRATION_HORDE_KALIMDOR_CRITERIA_11735 = 'Ilha Névoa Lazúli',

    AN_MIDSUMMER_DESECRATION_HORDE_OUTLAND = 'Extinguindo Terralém',
    AD_MIDSUMMER_DESECRATION_HORDE_OUTLAND = 'Profanar as fogueiras da Aliança em Terralém.',
    AC_MIDSUMMER_DESECRATION_HORDE_OUTLAND_CRITERIA_11736 = 'Montanhas da Lâmina Afiada',
    AC_MIDSUMMER_DESECRATION_HORDE_OUTLAND_CRITERIA_11750 = 'Nagrand',
    AC_MIDSUMMER_DESECRATION_HORDE_OUTLAND_CRITERIA_11759 = 'Eternévoa',
    AC_MIDSUMMER_DESECRATION_HORDE_OUTLAND_CRITERIA_11752 = 'Vale da Lua Negra',
    AC_MIDSUMMER_DESECRATION_HORDE_OUTLAND_CRITERIA_11754 = 'Mata Terokkar',
    AC_MIDSUMMER_DESECRATION_HORDE_OUTLAND_CRITERIA_11758 = 'Pântano Zíngaro',
    AC_MIDSUMMER_DESECRATION_HORDE_OUTLAND_CRITERIA_11747 = 'Península Fogo do Inferno',

    AN_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS = 'Extinguindo os Reinos do Leste',
    AD_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS = 'Profanar as fogueiras da Aliança nos Reinos do Leste.',
    AC_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS_CRITERIA_11751 = 'Montanhas Cristarrubra',
    AC_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS_CRITERIA_11742 = 'Dun Morogh',
    AC_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS_CRITERIA_11745 = 'Floresta de Elwynn',
    AC_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS_CRITERIA_11749 = 'Loch Modan',
    AC_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS_CRITERIA_11732 = 'Planalto Arathi',
    AC_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS_CRITERIA_11739 = 'Estepes Ardentes',
    AC_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS_CRITERIA_11761 = 'Selva do Espinhaço',
    AC_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS_CRITERIA_11755 = 'Terras Agrestes',
    AC_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS_CRITERIA_11756 = 'Terras Pestilentas Ocidentais',
    AC_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS_CRITERIA_11581 = 'Cerro Oeste',
    AC_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS_CRITERIA_11748 = 'Contraforte de Eira dos Montes',
    AC_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS_CRITERIA_11737 = 'Barreira do Inferno',
    AC_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS_CRITERIA_11743 = 'Floresta do Crepúsculo',
    AC_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS_CRITERIA_11757 = 'Pantanal',

    AN_MIDSUMMER_DESECRATION_ALLIANCE = 'Profanação da Horda',
    AD_MIDSUMMER_DESECRATION_ALLIANCE = 'Obter as conquistas Extinguindo os Reinos do Leste, Extinguindo Kalimdor e Extinguindo Terralém.',

    AN_MIDSUMMER_DESECRATION_ALLIANCE_KALIMDOR = 'Extinguindo Kalimdor',
    AD_MIDSUMMER_DESECRATION_ALLIANCE_KALIMDOR = 'Profanar as fogueiras da Horda em Kalimdor.',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_KALIMDOR_CRITERIA_11803 = 'Hibérnia',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_KALIMDOR_CRITERIA_11785 = 'Mil Agulhas',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_KALIMDOR_CRITERIA_11765 = 'Vale Gris',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_KALIMDOR_CRITERIA_11769 = 'Desolação',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_KALIMDOR_CRITERIA_11773 = 'Feralas',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_KALIMDOR_CRITERIA_11777 = 'Mulgore',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_KALIMDOR_CRITERIA_11800 = 'Silithus',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_KALIMDOR_CRITERIA_11780 = 'Cordilheira das Torres de Pedra',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_KALIMDOR_CRITERIA_11802 = 'Tanaris',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_KALIMDOR_CRITERIA_11783 = 'Sertões',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_KALIMDOR_CRITERIA_11770 = 'Durotar',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_KALIMDOR_CRITERIA_11771 = 'Pântano Vadeoso',

    AN_MIDSUMMER_DESECRATION_ALLIANCE_OUTLAND = 'Extinguindo Terralém',
    AD_MIDSUMMER_DESECRATION_ALLIANCE_OUTLAND = 'Profanar as fogueiras da Horda em Terralém.',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_OUTLAND_CRITERIA_11767 = 'Montanhas da Lâmina Afiada',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_OUTLAND_CRITERIA_11799 = 'Eternévoa',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_OUTLAND_CRITERIA_11782 = 'Mata Terokkar',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_OUTLAND_CRITERIA_11775 = 'Península Fogo do Inferno',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_OUTLAND_CRITERIA_11787 = 'Pântano Zíngaro',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_OUTLAND_CRITERIA_11778 = 'Nagrand',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_OUTLAND_CRITERIA_11779 = 'Vale da Lua Negra',

    AN_MIDSUMMER_DESECRATION_ALLIANCE_EASTERN_KINGDOMS = 'Extinguindo os Reinos do Leste',
    AD_MIDSUMMER_DESECRATION_ALLIANCE_EASTERN_KINGDOMS = 'Profanar as fogueiras da Horda nos Reinos do Leste.',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11766 = 'Ermos',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11772 = 'Floresta do Canto Eterno',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11774 = 'Terra Fantasma',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11776 = 'Contraforte de Eira dos Montes',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11768 = 'Estepes Ardentes',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11781 = 'Pântano das Mágoas',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11764 = 'Planalto Arathi',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11580 = 'Floresta de Pinhaprata',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11801 = 'Selva do Espinhaço',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11784 = 'Terras Agrestes',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11786 = 'Clareiras de Tirisfal',

    AN_MIDSUMMER_FLAME_KEEPER_HORDE = 'As Chamas de Azeroth',
    AD_MIDSUMMER_FLAME_KEEPER_HORDE = 'Cumprir as conquistas Protetor das Chamas dos Reinos do Leste, Kalimdor e Terralém.',

    AN_MIDSUMMER_FLAME_KEEPER_HORDE_KALIMDOR = 'Protetor das Chamas de Kalimdor',
    AD_MIDSUMMER_FLAME_KEEPER_HORDE_KALIMDOR = 'Reverenciar as chamas de Kalimdor.',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_KALIMDOR_CRITERIA_11841 = 'Vale Gris',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_KALIMDOR_CRITERIA_11845 = 'Desolação',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_KALIMDOR_CRITERIA_11846 = 'Durotar',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_KALIMDOR_CRITERIA_11847 = 'Pântano Vadeoso',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_KALIMDOR_CRITERIA_11849 = 'Feralas',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_KALIMDOR_CRITERIA_11852 = 'Mulgore',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_KALIMDOR_CRITERIA_11859 = 'Sertões',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_KALIMDOR_CRITERIA_11839 = 'Hibérnia',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_KALIMDOR_CRITERIA_11836 = 'Silithus',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_KALIMDOR_CRITERIA_11856 = 'Cordilheira das Torres de Pedra',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_KALIMDOR_CRITERIA_11861 = 'Mil Agulhas',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_KALIMDOR_CRITERIA_11838 = 'Tanaris',

    AN_MIDSUMMER_FLAME_KEEPER_HORDE_OUTLAND = 'Protetor das Chamas de Terralém',
    AD_MIDSUMMER_FLAME_KEEPER_HORDE_OUTLAND = 'Reverenciar as chamas de Terralém.',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_OUTLAND_CRITERIA_11851 = 'Península Fogo do Inferno',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_OUTLAND_CRITERIA_11835 = 'Eternévoa',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_OUTLAND_CRITERIA_11855 = 'Vale da Lua Negra',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_OUTLAND_CRITERIA_11858 = 'Mata Terokkar',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_OUTLAND_CRITERIA_11854 = 'Nagrand',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_OUTLAND_CRITERIA_11863 = 'Pântano Zíngaro',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_OUTLAND_CRITERIA_11843 = 'Montanhas da Lâmina Afiada',

    AN_MIDSUMMER_FLAME_KEEPER_HORDE_EASTERN_KINGDOMS = 'Protetor das Chamas dos Reinos do Leste',
    AD_MIDSUMMER_FLAME_KEEPER_HORDE_EASTERN_KINGDOMS = 'Reverenciar as chamas dos Reinos do Leste.',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_EASTERN_KINGDOMS_CRITERIA_11844 = 'Estepes Ardentes',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_EASTERN_KINGDOMS_CRITERIA_11840 = 'Planalto Arathi',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_EASTERN_KINGDOMS_CRITERIA_11584 = 'Floresta de Pinhaprata',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_EASTERN_KINGDOMS_CRITERIA_11837 = 'Selva do Espinhaço',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_EASTERN_KINGDOMS_CRITERIA_11860 = 'Terras Agrestes',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_EASTERN_KINGDOMS_CRITERIA_11850 = 'Terra Fantasma',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_EASTERN_KINGDOMS_CRITERIA_11862 = 'Clareiras de Tirisfal',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_EASTERN_KINGDOMS_CRITERIA_11853 = 'Contraforte de Eira dos Montes',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_EASTERN_KINGDOMS_CRITERIA_11848 = 'Floresta do Canto Eterno',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_EASTERN_KINGDOMS_CRITERIA_11857 = 'Pântano das Mágoas',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_EASTERN_KINGDOMS_CRITERIA_11842 = 'Ermos',

    AN_MIDSUMMER_FLAME_KEEPER_ALLIANCE = 'As Chamas de Azeroth',
    AD_MIDSUMMER_FLAME_KEEPER_ALLIANCE = 'Cumprir as conquistas Guardião das Chamas dos Reinos do Leste, Kalimdor e Terralém.',

    AN_MIDSUMMER_FLAME_KEEPER_ALLIANCE_KALIMDOR = 'Guardião das Chamas de Kalimdor',
    AD_MIDSUMMER_FLAME_KEEPER_ALLIANCE_KALIMDOR = 'Reverenciar as chamas de Kalimdor.',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_KALIMDOR_CRITERIA_11833 = 'Tanaris',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_KALIMDOR_CRITERIA_11805 = 'Vale Gris',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_KALIMDOR_CRITERIA_11809 = 'Ilha Névoa Rubra',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_KALIMDOR_CRITERIA_11812 = 'Desolação',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_KALIMDOR_CRITERIA_11817 = 'Feralas',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_KALIMDOR_CRITERIA_11824 = 'Teldrassil',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_KALIMDOR_CRITERIA_11806 = 'Ilha Névoa Lazúli',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_KALIMDOR_CRITERIA_11834 = 'Hibérnia',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_KALIMDOR_CRITERIA_11831 = 'Silithus',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_KALIMDOR_CRITERIA_11815 = 'Pântano Vadeoso',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_KALIMDOR_CRITERIA_11811 = 'Costa Negra',

    AN_MIDSUMMER_FLAME_KEEPER_ALLIANCE_OUTLAND = 'Guardião das Chamas de Terralém',
    AD_MIDSUMMER_FLAME_KEEPER_ALLIANCE_OUTLAND = 'Reverenciar as chamas de Terralém.',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_OUTLAND_CRITERIA_11807 = 'Montanhas da Lâmina Afiada',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_OUTLAND_CRITERIA_11830 = 'Eternévoa',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_OUTLAND_CRITERIA_11823 = 'Vale da Lua Negra',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_OUTLAND_CRITERIA_11829 = 'Pântano Zíngaro',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_OUTLAND_CRITERIA_11818 = 'Península Fogo do Inferno',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_OUTLAND_CRITERIA_11821 = 'Nagrand',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_OUTLAND_CRITERIA_11825 = 'Mata Terokkar',

    AN_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS = 'Guardião das Chamas dos Reinos do Leste',
    AD_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS = 'Reverenciar as chamas dos Reinos do Leste.',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11816 = 'Floresta de Elwynn',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11810 = 'Estepes Ardentes',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11813 = 'Dun Morogh',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11822 = 'Montanhas Cristarrubra',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11832 = 'Selva do Espinhaço',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11826 = 'Terras Agrestes',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11583 = 'Cerro Oeste',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11827 = 'Terras Pestilentas Ocidentais',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11808 = 'Barreira do Inferno',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11819 = 'Contraforte de Eira dos Montes',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11814 = 'Floresta do Crepúsculo',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11820 = 'Loch Modan',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11804 = 'Planalto Arathi',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11828 = 'Pantanal',

    --BREWFEST
    AN_BREWFEST = 'Mestre-cervejeiro',
    AD_BREWFEST = 'Obter as conquistas da CervaFest listadas abaixo.',
    AR_BREWFEST = 'Título: Mestre-cervejeiro',

    AN_BREWFEST_WOLPERTINGER = 'Você lebrerva como eu lebrervo?',
    AD_BREWFEST_WOLPERTINGER = 'Obter uma mascote lebrervo.',

    AN_BREWFEST_COREN_DIREBREW = 'CervatrozFest',
    AD_BREWFEST_COREN_DIREBREW = 'Matar Coren Cervatroz.',

    AN_BREWFEST_QUEST1 = 'Abaixo os Ferro Negro',
    AD_BREWFEST_QUEST1 = 'Defender o acampamento da CervaFest do ataque dos anões Ferro Negro e cumprir e missão "Certa vez, quando eu estava bêbado...".',

    AN_BREWFEST_BEER_CLUB = 'Cerveja do Mês',
    AD_BREWFEST_BEER_CLUB = 'Entrar para o Clube da Cerveja do Mês.',

    AN_BREWFEST_MOUNT = 'Se beber, não dirija',
    AD_BREWFEST_MOUNT = 'Obter uma montaria da CervaFest ou transformar uma das suas montarias em uma montaria da CervaFest usando um Lúpulo Fresco.',

    --LONG TRIP
    AC_WORLDEVENTS_TRIP = 'Um ano de luta, um ano de conquistas',
    AD_WORLDEVENTS_TRIP = 'Obter as conquistas dos eventos globais listadas abaixo.',

	--BURNING CRUSADE
    AN_DOLCE = 'Armazenamento "Gigantique"',
    AD_DOLCE = 'Equipar-se com a Bolsa "Gigantique" da Haris Pilton.',

    AN_QUESTS_HELLFIRE_PENINSULA = 'Vou ali no Inferno e já volto',
    AD_QUESTS_HELLFIRE_PENINSULA = 'Cumprir 80 missões na Península Fogo do Inferno.',
    TBC_QUEST_10388 = 'Haltet die Brennende Legion auf', --#--#--
    TBC_QUEST_10389 = 'Grausame Pläne', --#--#--
    TBC_QUEST_10876 = 'Die Hand von Kargath', --#--#--
    TBC_QUEST_10258 = 'Acampamento Quebra-espinha',
    TBC_QUEST_9406 = 'Os Mag\'har',
    TBC_QUEST_9370 = 'Vigília do Falcão',
    TBC_QUEST_10351 = 'Posto Cenariano',

    TBC_QUEST_10397 = 'Haltet die Brennende Legion auf', --#--#--
    TBC_QUEST_10400 = 'Stürzt den Oberanführer', --#--#--
    TBC_QUEST_9545 = 'Die Suche nach Sedai', --#--#--
    TBC_QUEST_10935 = 'Der Exorzismus des Oberst Jules', --#--#--
    TBC_QUEST_10937 = 'Die Züchtigung des Drillmeisters', --#--#--
    TBC_QUEST_9383 = 'Templo de Telhamat',
    TBC_QUEST_10630 = 'Grün, aber kein Orc', --#--#--
    
    AN_QUESTS_ZANGARMASH = 'Mistérios do Pântano',
    AD_QUESTS_ZANGARMASH = 'Cumprir 54 missões no Pântano Zíngaro.',
    TBC_QUEST_9772 = 'Mocó do Rato Lamacento',
    TBC_QUEST_9904 = 'Zabra\'jin',
    TBC_QUEST_10118 = 'Die Verteidigung von Zabra\'jin', --#--#--
    TBC_QUEST_9803 = 'Draeneidiplomatie', --#--#--
    TBC_QUEST_9783 = 'Telredor',
    TBC_QUEST_9902 = 'Porto Orebor',
    TBC_QUEST_9709 = 'DIESE Pilze solltet Ihr nicht essen!', --#--#--
    TBC_QUEST_9732 = 'Trockenlegung der Marschen', --#--#--
    TBC_QUEST_9788 = 'Rettung der Sporloks', --#--#--
    TBC_QUEST_9726 = 'Ein Ausflug mit dem Sporlingen', --#--#--
    
    AN_QUESTS_TERROKAR = 'Terror de Terokkar',
    AD_QUESTS_TERROKAR = 'Cumprir 63 missões na Mata Terokkar.',
    TBC_QUEST_10879 = 'Offensive aus Skettis', --#--#--
    TBC_QUEST_10881 = 'Caravana dos Refugiados',
    TBC_QUEST_10915 = 'Acampamento Sha\'tari',
    TBC_QUEST_9951 = 'Das Geheimnis des Aufsehers', --#--#--
    TBC_QUEST_10042 = 'Fortaleza Alleriana',
    TBC_QUEST_10043 = 'Vila de Quebrapedra',
    
    AN_QUESTS_NAGRAND = 'Nagrand Vitória',
    AD_QUESTS_NAGRAND = 'Cumprir 75 missões em Nagrand.',
    TBC_QUEST_10172 = 'Geburt eines Kriegshäuptlings', --#--#--
    TBC_QUEST_9977 = 'Ringue de Sangue',
    TBC_QUEST_9853 = 'Trono dos Elementos',
    TBC_QUEST_9934 = 'Lantresor von der Klinge', --#--#--
    TBC_QUEST_9868 = 'Die Finsterblutzerschlagenen', --#--#--
    TBC_QUEST_9937 = 'Bedrohungen für Nagrand', --#--#--
    TBC_QUEST_9852 = 'O vale-tudo de sangue',
    TBC_QUEST_9925 = 'Begegnung mit den Astralen', --#--#--
    TBC_QUEST_9955 = 'Die Abenteuer von Corki', --#--#--
    TBC_QUEST_9933 = 'Lantresor von der Klinge', --#--#--
    TBC_QUEST_9873 = 'Die Finsterblutzerschlagenen', --#--#--
    TBC_QUEST_10011 = 'Bedrohungen für Nagrand', --#--#--
    
    AN_QUESTS_BLADES_EDGE_MTNS = 'No fio da Lâmina Afiada',
    AD_QUESTS_BLADES_EDGE_MTNS = 'Cumprir 86 missões nas Montanhas da Lâmina Afiada.',
    TBC_QUEST_10504 = 'Sylvanaar',
    TBC_QUEST_10671 = 'Estação do Tocha',
    TBC_QUEST_10806 = 'Die Gronnbedrohung', --#--#--
    TBC_QUEST_10505 = 'Cidadela do Senhor do Trovão',
    TBC_QUEST_10742 = 'Zusammenführung', --#--#--
    TBC_QUEST_10867 = 'Die Mok\'Nathal', --#--#--
    TBC_QUEST_10748 = 'Bosque Ruuan',
    
    AN_QUESTS_NETHERSTORM = 'Éter Adentro',
    AD_QUESTS_NETHERSTORM = 'Cumprir 120 missões na Eternévoa.',
    TBC_QUEST_10409 = 'Socrethar', --#--#--
    TBC_QUEST_10240 = 'Torre Violeta',
    TBC_QUEST_10249 = 'Beschützt Area 52!', --#--#--
    TBC_QUEST_10439 = 'Zerstörung des Allesverschlingenden', --#--#--
    TBC_QUEST_10221 = 'Bau der X-52 Netherrakete', --#--#--
    TBC_QUEST_10276 = 'O Consórcio',
    
    AN_QUESTS_SHADOWMOON = 'A sombra do traidor',
    AD_QUESTS_SHADOWMOON = 'Cumprir 90 missões no Vale da Lua Negra.',
    TBC_QUEST_10744 = 'Nachricht vom Sieg', --#--#--
    TBC_QUEST_11041 = 'Plataforma da Asa Etérea',
    TBC_QUEST_10645 = 'Der erste Todesritter', --#--#--
    TBC_QUEST_10651 = 'Geliehene Macht', --#--#--
    TBC_QUEST_11052 = 'Akamas Versprechen', --#--#--
    TBC_QUEST_10588 = 'Die Litanei der Verdammnis', --#--#--
    TBC_QUEST_10679 = 'Antidämonenwaffen', --#--#--
    TBC_QUEST_10808 = 'Der Dunkle Rat', --#--#--
	
	AN_HEMET_QUESTS_NAGRAND = 'Conversa de Elekk',
	AD_HEMET_QUESTS_NAGRAND = 'Cumprir as missões de Rosarães Guima em Nagrand até a missão O Vale-tudo de Sangue.',

    HEROIC_NAME_PATTERN = 'Heroisch: %s', --#--#--
    HEROIC_DESCRIPTION_PATTERN = '%s auf dem Schwierigkeitsgrad \'Heroisch\'', --#--#--

    AN_HELLFIRE_RAMPARTS = 'Muralha Fogo do Inferno',
    AD_HELLFIRE_RAMPARTS = 'Derrotar Omor, o Intocado.',
    AC_BOSS_17308 = 'Omor, o Intocado',
    AC_BOSS_17537 = 'Vazruden, o Arauto',
	AC_BOSS_17306 = 'Wachhabender Gargolmar', --#--#--

    AN_BLOOD_FURNACE = 'Fornalha de Sangue',
    AD_BLOOD_FURNACE = 'Derrotar Keli\'dan, o Quebrador.',

    AN_SLAVE_PENS = 'Pátio dos Escravos',
    AD_SLAVE_PENS = 'Derrotar o Atolaço.',

    AN_UNDERBOG = 'Brejo Oculto',
    AD_UNDERBOG = 'Derrotar a Espreitadora Negra.',

    AN_MANA_TOMBS = 'Tumbas de Mana',
    AD_MANA_TOMBS = 'Derrotar o Príncipe do Nexus Shaffar.',

    AN_AUCHENAI_CRYPTS = 'Catacumbas Auchenai',
    AD_AUCHENAI_CRYPTS = 'Derrotar o Exarca Maladaar.',

    AN_OLD_HILLSBRAD = 'A Fuga de Forte do Desterro',
    AD_OLD_HILLSBRAD = 'Derrotar o Caçador das Eras.',

    AN_SETHEKK_HALLS = 'Salões dos Sethekk',
    AD_SETHEKK_HALLS = 'Derrotar Ikiss, o Rei-gadanho.',

    AN_STEAMVAULT = 'Câmara dos Vapores',
    AD_STEAMVAULT = 'Derrotar o Senhor da Guerra Kalithresh.',

    AN_SHADOW_LABYRINTH = 'Labirinto Soturno',
    AD_SHADOW_LABYRINTH = 'Derrotar o Murmúrio.',

    AN_SHATTERED_HALLS = 'Salões Despedaçados',
    AD_SHATTERED_HALLS = 'Derrotar o Chefe Guerreiro Karrath Carpunhal.',

    AN_BLACK_MORASS = 'Abertura do Portal Negro',
    AD_BLACK_MORASS = 'Derrotar Aeonus.',

    AN_BOTANICA = 'Jardim Botânico',
    AD_BOTANICA = 'Derrotar o Estilhaço Dimensional.',

    AN_MECHANAR = 'Mecanar',
    AD_MECHANAR = 'Derrotar Pathaleon, o Calculista.',

    AN_ARCATRAZ = 'Arcatraz',
    AD_ARCATRAZ = 'Derrotar o Precursor Skiriss.',
	
	AN_MAGISTERS_TERRACE = 'Terraço dos Magísteres',
    AD_MAGISTERS_TERRACE = 'Derrotar Kael\'thas Andassol.',
	
	AN_TBC_DUNGEONS = 'Mestre das masmorras de Terralém',
    AD_TBC_DUNGEONS = 'Obter as conquistas de masmorras da expansão The Burning Crusade listadas abaixo.',

    AN_TBC_DUNGEONS_HERO = 'Herói das masmorras de Terralém',
    AD_TBC_DUNGEONS_HERO = 'Obter as conquistas de masmorras heroicas da expansão The Burning Crusade listadas abaixo.',

    AN_OUTLAND_HERO = 'Held der Scherbenwelt', --#--#--
    AD_OUTLAND_HERO = 'Schließt die unten aufgelisteten Schlachtzugserfolge ab.', --#--#--
    AR_OUTLAND_HERO = 'Held der Scherbenwelt', --#--#--
    
    AN_OUTLAND_GREAT_HERO = 'Großartiger Held der Scherbenwelt', --#--#--
    AD_OUTLAND_GREAT_HERO = 'Schließt die unten aufgelisteten Dungeon- und Schlachtzugserfolge ab.', --#--#--
    AR_OUTLAND_GREAT_HERO = 'Großartiger Held der Scherbenwelt', --#--#--

    AN_RAVEN_LORD = 'Rédeas do Senhor dos Corvos',
    AD_RAVEN_LORD = 'Obter as Rédeas do Senhor dos Corvos de Anzu, nos Salões dos Sethekk.',

    AN_KARAZHAN = 'Karazhan',
    AD_KARAZHAN = 'Derrotar o Príncipe Malquezaar, em Karazhan.',

    AN_GRUUL = 'Covil de Gruul',
    AD_GRUUL = 'Derrotar Gruul, o Matador de Dragões, no Covil de Gruul.',

    AN_MAGTHERIDON = 'Covil de Magtheridon',
    AD_MAGTHERIDON = 'Derrotar Magtheridon no Covil de Magtheridon.',
	
	AN_ZULAMAN = 'Zul\'Aman',
	AD_ZULAMAN = 'Derrotar Zul\'jin em Zul\'Aman.',
	
	AN_SUNWELL = 'Platô da Nascente do Sol',
	AD_SUNWELL = 'Derrotar Kil\'jaeden no Platô da Nascente do Sol.',

    AN_TBC_PHASE_1 = 'Aventureiro de Terralém',
    AD_TBC_PHASE_1 = 'Obter as conquistas das raides da expansão The Burning Crusade listadas abaixo.',
    AN_TBC_PHASE_2 = 'Aventureiro de Terralém',
    AD_TBC_PHASE_2 = 'Obter as conquistas das raides da expansão The Burning Crusade listadas abaixo.',
    AN_TBC_PHASE_3 = 'Aventureiro de Terralém',
    AD_TBC_PHASE_3 = 'Obter as conquistas das raides da expansão The Burning Crusade listadas abaixo.',
	AN_TBC_PHASE_4 = 'Aventureiro de Terralém',
    AD_TBC_PHASE_4 = 'Obter as conquistas das raides da expansão The Burning Crusade listadas abaixo.',
	AN_TBC_PHASE_5 = 'Aventureiro de Terralém',
    AD_TBC_PHASE_5 = 'Obter as conquistas das raides da expansão The Burning Crusade listadas abaixo.',
	
    FACTION_946 = 'Fortaleza da Honra',
    FACTION_947 = 'Thrallmar',
    FACTION_942 = 'Expedição Cenariana',
    FACTION_1011 = 'Bairro Inferior',
    FACTION_989 = 'Defensores do Tempo',
    FACTION_935 = 'Os Sha\'tar',
	FACTION_609 = 'Círculo Cenariano',

    AN_TBC_DUNGEON_REPUTATIONS = 'O Cruzado Flamejante',
    AD_TBC_DUNGEON_REPUTATIONS = 'Tornar-se exaltado por todas as facções das masmorras da expansão The Burning Crusade.',
	
	AN_CENARION_CIRCLE = 'Guardião de Cenarius',
    AD_CENARION_CIRCLE = 'Tornar-se exaltado pelo Círculo Cenariano e pela Expedição Cenariana.',

    AN_SHATTRATH_REP = 'Discórdia em Shattrath',
    AD_SHATTRATH_REP = 'Tornar-se exaltado pelos Áugure ou pelos Aldor.',

    AN_OGRILA = 'Uma missão por dia até acabar a antipatia',
    AD_OGRILA = 'Tornar-se exaltado por Ogri\'la.',

    AN_SPOREGGAR = 'O Czar de Sporeggar',
    AD_SPOREGGAR = 'Tornar-se exaltado por Sporeggar.',

    AN_CONSORTIUM = 'Diretor Exaltado do Consórcio',
    AD_CONSORTIUM = 'Tornar-se exaltado pelo Consórcio.',

    AN_MAGHAR = 'Mag\'har de Draenor',
    AD_MAGHAR = 'Tornar-se exaltado pelos Mag\'har.',

    AN_KURENAI = 'Ai ai ai, Kurenai',
    AD_KURENAI = 'Tornar-se exaltado pelos Kurenai.',

    AN_NETHERWINGS = 'Em Asas Etéreas',
    AD_NETHERWINGS = 'Tornar-se exaltado pela Asa Etérea.',

    AN_SKYSHATTERED = 'Céu rompido',
    AD_SKYSHATTERED = 'Derrotar o Capitão Rasga-céus na corrida Presa do Dragão na Plataforma da Asa Etérea.',

    AN_AMETHYST_EYE = 'O Olho Violeta',
    AD_AMETHYST_EYE = 'Tornar-se exaltado pelo Olho Violeta.',

    AN_SCALE_OF_THE_SANDS = 'A Escama das Areias',
    AD_SCALE_OF_THE_SANDS = 'Tornar-se exaltado pela Escama das Areias.',

    AN_ASHTONGUE_DEATHSWORN = 'Devoto dos Devotos',
    AD_ASHTONGUE_DEATHSWORN = 'Tornar-se exaltado pelos Devotos da Morte Grislíngua.',

    AN_SHATTERED_SUN = 'És tão ofensivo!',
    AD_SHATTERED_SUN = 'Tornar-se exaltado pela Ofensiva Sol Partido.',

    AN_SKYGUARD = 'Voando alto sobre Skettis',
    AD_SKYGUARD = 'Tornar-se exaltado pela Guarda Aérea de Sha\'tari.',

    AN_HIPPOGRYPH = 'Hipogrifo de Guerra Cenariano',
    AD_HIPPOGRYPH = 'Obter o Hipogrifo de Guerra Cenariano da Expedição Cenariana no Pântano Zíngaro.',

    AN_DIPLOMAT = 'O Diplomata',
    AD_DIPLOMAT_ALLIANCE = 'Elevar sua reputação de ignorado para exaltado pelo Domínio dos Presamatos, por Sporeggar e pelos Kurenai.',
    AD_DIPLOMAT_HORDE = 'Elevar sua reputação de ignorado para exaltado pelo Domínio dos Presamatos, por Sporeggar e pelos Mag\'har.',
    AC_DIPLOMAT_576 = 'Exaltado pelo Domínio dos Presamatos',
    AC_DIPLOMAT_970 = 'Exaltado por Sporeggar',
    AC_DIPLOMAT_978 = 'Exaltado pelos Kurenai',
    AC_DIPLOMAT_941 = 'Exaltado pelos Mag\'har',

    AN_MR_PINCHY = 'Dr. Zwicky!', --#--#--
    AD_MR_PINCHY = 'Angelt Dr. Zwicky in der Scherbenwelt.', --#--#--

    AN_FISHING_BOOK = 'Peixes não deixam pegadas',
    AD_FISHING_BOOK = 'Aprender a habilidade de localizar peixes.',

    AN_ACCOMPLISHED_ANGLER = 'Pescador de Sucesso',
    AD_ACCOMPLISHED_ANGLER = 'Obter as conquistas de pesca listadas abaixo.',

    AN_TBC_DAILY_FISH = 'O Velho Barlo de cara no barro',
    AD_TBC_DAILY_FISH = 'Cumprir cada uma das 5 missões diárias de pesca do Velho Barlo listadas abaixo.',
    AC_TBC_DAILY_FISH1 = 'Crocoliscos na cidade',
    AC_TBC_DAILY_FISH2 = 'Ladrões de isca',
    AC_TBC_DAILY_FISH3 = 'Filé de sangrevil',
    AC_TBC_DAILY_FISH4 = 'O peixe fugitivo',
    AC_TBC_DAILY_FISH5 = 'Camarão é a mãe!',

    AN_OLD_IRONJAW = 'Velho Ferroqueixo',
    AD_OLD_IRONJAW = 'Pescar o Velho Ferroqueixo em Altaforja.',

    AN_OLD_CRAFTY = 'Velho Pilantra',
    AD_OLD_CRAFTY = 'Pescar o Velho Pilantra em Orgrimmar.',

    AN_FISHING_DIPLOMAT = 'O diplomata pescador',
    AD_FISHING_DIPLOMAT = 'Pescar alguma coisa em Orgrimmar e Ventobravo.',
    AC_FISHING_DIPLOMAT1 = 'Orgrimmar',
    AC_FISHING_DIPLOMAT2 = 'Ventobravo',

    AN_CAPTAIN_RUMSEY = 'Lager do Capitão Rumsey',
    AD_CAPTAIN_RUMSEY = 'Preparar a Lager do Capitão Rumsey.',

    AN_SECOND_RING = 'Der Andere Ring', --#--#--
    AD_SECOND_RING = 'Erhaltet den Anderen Ring aus einem Sack voll geangelter Schätze.', --#--#--

    AN_TBC_DAILY_COOKING = 'Manteiga no biscoito',
    AD_TBC_DAILY_COOKING = 'Cumprir cada uma das 4 missões diárias de culinária do Troagrô listadas abaixo.',
    AC_TBC_DAILY_COOKING1 = 'Manalicioso',
    AC_TBC_DAILY_COOKING2 = 'Canja para a alma',
    AC_TBC_DAILY_COOKING3 = 'A vingança é doce',
    AC_TBC_DAILY_COOKING4 = 'Ensopado super quente',

    AN_TBC_COOKING_RECIPES = 'O gourmet de Terralém',
    AD_TBC_COOKING_RECIPES = 'Cozinhar cada uma das receitas de culinária de Terralém listadas abaixo.',

    AN_HAIL_CHEF = 'Salve o chef!',
    AD_HAIL_CHEF = 'Obter as conquistas de culinária listadas abaixo.',

    AN_EXPLORE_OUTLAND = 'Explorar Terralém',
    AD_EXPLORE_OUTLAND = 'Explorar todas as regiões de Terralém.',

    AN_MIDDLE_RARE = 'Extinção Instantânea',
    AD_MIDDLE_RARE = 'Matar uma das criaturas extremamente raras e difíceis de encontrar em Terralém que estão listadas abaixo.',
    AN_BLOODY_RARE = 'Extinção Brutal',
    AD_BLOODY_RARE = 'Matar todas as criaturas extremamente raras e difíceis de encontrar em Terralém listadas abaixo.',
    TBC_NPC_18695 = 'Embaixador Jerrikar',
    TBC_NPC_18682 = 'Tocaieiro do Brejo',
    TBC_NPC_18697 = 'Engenheiro-chefe Lorthander',
    TBC_NPC_18681 = 'Emissária Presacurva',
    TBC_NPC_18694 = 'Collidus, o Observador Dimensional',
    TBC_NPC_18689 = 'Aleijador',
    TBC_NPC_18686 = 'Agoureiro Jurim',
    TBC_NPC_18698 = 'Perenúcleo, o Castigador',
    TBC_NPC_18678 = 'Engole-tudo',
    TBC_NPC_17144 = 'Trincador',
    TBC_NPC_18692 = 'Hemathion',
    TBC_NPC_18696 = 'Kraator',
    TBC_NPC_18680 = 'Marticar',
    TBC_NPC_18677 = 'Mekthorg, o Selvagem',
    TBC_NPC_18690 = 'Smagga',
    TBC_NPC_20932 = 'Nuramoc',
    TBC_NPC_18685 = 'Okrek',
    TBC_NPC_18693 = 'Orador Mar\'grom',
    TBC_NPC_18683 = 'Caçador Caótico Yar',
    TBC_NPC_18679 = 'Vorakem Voz-da-Ruína',

    AN_PREPATCH_QUEST = 'Auf in den Kampf!', --#--#--
    AD_PREPATCH_QUEST = 'Hat am Kampf um das Dunkle Portal teilgenommen. Träger des Wappenrock des Beschützers.', --#--#--

    AN_RIDING_75 = 'Meu primeiro pangaré',
    AD_RIDING_75 = 'Alcançar o nível de Aprendiz de Montaria.',
    AN_RIDING_150 = 'Velozes e Furiosos',
    AD_RIDING_150 = 'Alcançar o nível de Profissional em Montaria.',
    AN_RIDING_225 = 'Para o alto e avante!',
    AD_RIDING_225 = 'Alcançar o nível de Perito em Montaria.',
    AN_RIDING_300 = 'Onde o futuro começa',
    AD_RIDING_300 = 'Alcançar o nível de Artífice em montaria.',

    AN_ATTUNE_SHATTERED_HALLS = 'Heißer als die Hölle', --#--#--
    AD_ATTUNE_SHATTERED_HALLS = 'Erhaltet den Schlüssel zu den Zerschmetterten Hallen.', --#--#--
    AN_ATTUNE_ARCATRAZ = 'Como entrar em Arcatraz',
    AD_ATTUNE_ARCATRAZ = 'Erhaltet den Schlüssel zur Arkatraz.', --#--#--
    AN_ATTUNE_KARAZHAN = 'O toque do mestre',
    AD_ATTUNE_KARAZHAN = 'Erhaltet den Schlüssel des Meisters.', --#--#--
    AN_ATTUNE_NIGHT_BANE = 'Die Vergangenheit aufwühlen', --#--#--
    AD_ATTUNE_NIGHT_BANE = 'Erhaltet die Geschwärzte Urne und bezwingt den Schrecken der Nacht in Karazhan.', --#--#--
    AN_ATTUNE_SSC = 'A clava de Kar\'desh',
    AD_ATTUNE_SSC = 'Erhaltet Zugang zur Höhle des Schlangenschreins.', --#--#--
    AN_ATTUNE_EYE = 'Der Schlüssel der Stürme', --#--#--
    AD_ATTUNE_EYE = 'Erhaltet den Schlüssel der Stürme.', --#--#--
    AN_ATTUNE_HYJAL = 'As ampolas da eternidade',
    AD_ATTUNE_HYJAL = 'Erhaltet Zugang zur Schlacht um den Berg Hyjal.', --#--#--
    AN_ATTUNE_BLACK_TEMPLE = 'Uma distração para Akama',
    AD_ATTUNE_BLACK_TEMPLE = 'Erhaltet das Medaillon von Karabor.', --#--#--

    AN_SSC = 'Caverna do Serpentário',
    AD_SSC = 'Derrotar a Lady Vashj na Caverna do Serpentário.',
    AC_KILL_HYDROS = 'Hydross der Unstete', --#--#--
    AC_KILL_LURKER = 'O Tocaieiro Supraterrâneo',
    AC_KILL_LEOTHERAS = 'Leotheras der Blinde', --#--#--
    AC_KILL_KARATHRESS = 'Tiefenlord Karathress', --#--#--
    AC_KILL_MOROGRIM = 'Morogrim Gezeitenwandler', --#--#--
    AC_KILL_VASHJ = 'Lady Vashj',
    AN_TK = 'Bastilha da Tormenta',
    AD_TK = 'Derrotar Kael\'thas Andassol na Bastilha da Tormenta.',
    AC_KILL_ALAR = 'Al\'ar', --#--#--
    AC_KILL_VOID_REAVER = 'Leerhäscher', --#--#--
    AC_KILL_SOLARIAN = 'Hochastromantin Solarian', --#--#--
    AC_KILL_KAELTHAS = 'Kael\'thas Andassol',

    AN_HYJAL = 'A Batalha pelo Monte Hyjal',
    AD_HYJAL = 'Derrotar Arquimonde na Batalha pelo Monte Hyjal.',

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
    AC_KILL_ILLIDAN = 'Illidan Tempesfúria',

    AN_BLACK_TEMPLE = 'Templo Negro',
    AD_BLACK_TEMPLE = 'Derrotar Illidan Tempesfúria no Templo Negro.',
    AR_BLACK_TEMPLE = 'Bezwinger des Schwarzen Tempels', --#--#--

    AN_ARENA_FIRST_WIN = 'Primeiros passos na Arena',
    AD_ARENA_FIRST_WIN = 'Vencer uma partida de arena ranqueada no nível 70.',
    AN_ARENA_WIN1 = 'Dedicação impiedosa',
    AD_ARENA_WIN1 = 'Vencer 100 partidas de arena ranqueadas no nível 70.',
    AN_ARENA_WIN2 = 'Dedicação Vingativa',
    AD_ARENA_WIN2 = 'Vencer 200 partidas de arena ranqueadas no nível 70.',
    AN_ARENA_WIN3 = 'Dedicação Brutal',
    AD_ARENA_WIN3 = 'Vencer 300 partidas de arena ranqueadas no nível 70.',

    AN_ARENA_TITLE1 = 'Gladiador',
    AN_ARENA_TITLE2 = 'Duelista',
    AN_ARENA_TITLE3 = 'Rival',
    AN_ARENA_TITLE4 = 'Desafiante',

    AN_ARENA_GLADIATOR = 'Gladiador',
    AD_ARENA_GLADIATOR = 'Obter o título de Gladiador numa Série de Arena no nível 70.',
    AN_ARENA_DUELIST = 'Duelista',
    AD_ARENA_DUELIST = 'Obter o título de Duelista numa Série de Arena no nível 70.',
    AN_ARENA_RIVAL = 'Rival',
    AD_ARENA_RIVAL = 'Obter o título de Rival numa Série de Arena no nível 70.',
    AN_ARENA_CHALLENGER = 'Desafiante',
    AD_ARENA_CHALLENGER = 'Obter o título de Desafiante numa Série de Arena no nível 70.',

    AN_ARENA_2_1550 = 'Dupla Dinâmica: 1550',
    AD_ARENA_2_1550 = 'Obter pontuação pessoal de 1550 na categoria 2x2 da arena no nível 70.',
    AN_ARENA_2_1750 = 'Dupla Dinâmica: 1750',
    AD_ARENA_2_1750 = 'Obter pontuação pessoal de 1750 na categoria 2x2 da arena no nível 70.',
    AN_ARENA_2_2000 = 'Dupla Dinâmica: 2000',
    AD_ARENA_2_2000 = 'Obter pontuação pessoal de 2000 na categoria 2x2 da arena no nível 70.',
    AN_ARENA_2_2200 = 'Dupla Dinâmica: 2200',
    AD_ARENA_2_2200 = 'Obter pontuação pessoal de 2200 na categoria 2x2 da arena no nível 70.',

    AN_ARENA_3_1550 = 'Três é demais: 1550',
    AD_ARENA_3_1550 = 'Obter pontuação pessoal de 1550 na categoria 3x3 da arena no nível 70.',
    AN_ARENA_3_1750 = 'Três é demais: 1750',
    AD_ARENA_3_1750 = 'Obter pontuação pessoal de 1750 na categoria 3x3 da arena no nível 70.',
    AN_ARENA_3_2000 = 'Três é demais: 2000',
    AD_ARENA_3_2000 = 'Obter pontuação pessoal de 2000 na categoria 3x3 da arena no nível 70.',
    AN_ARENA_3_2200 = 'Três é demais: 2200',
    AD_ARENA_3_2200 = 'Obter pontuação pessoal de 2200 na categoria 3x3 da arena no nível 70.',

    AN_ARENA_5_1550 = 'Cinco contra... cinco: 1550',
    AD_ARENA_5_1550 = 'Obter pontuação pessoal de 1550 na categoria 5x5 da arena no nível 70.',
    AN_ARENA_5_1750 = 'Cinco contra... cinco: 1750',
    AD_ARENA_5_1750 = 'Obter pontuação pessoal de 1750 na categoria 5x5 da arena no nível 70.',
    AN_ARENA_5_2000 = 'Cinco contra... cinco: 2000',
    AD_ARENA_5_2000 = 'Obter pontuação pessoal de 2000 na categoria 5x5 da arena no nível 70.',
    AN_ARENA_5_2200 = 'Cinco contra... cinco: 2200',
    AD_ARENA_5_2200 = 'Obter pontuação pessoal de 2200 na categoria 5x5 da arena no nível 70.',

    AN_ARENA_STREAK = 'Embalo de Fogo',
    AD_ARENA_STREAK = 'Vencer dez partidas de arena ranqueadas seguidas no nível 70.',

    AN_ARENA_HOTSTREAK = 'Ninguém segura MESMO essa equipe',
    AD_ARENA_HOTSTREAK = 'Vencer dez partidas de arena ranqueadas seguidas com uma pontuação acima de 1800 no nível 70.',

    AN_ARENA_LASTMAN = 'O Último dos Moicanos',
    AD_ARENA_LASTMAN = 'Ser o último sobrevivente em uma partida ranqueada de arena 5x5 no nível 70.',

    AN_ARENA_MAPS = 'Rede Mundial de Competidores',
    AD_ARENA_MAPS = 'Vencer uma partida de arena ranqueada em Lâmina Afiada, Nagrand, Esgotos de Dalaran e Ruínas de Lordaeron no nível 70.',
    AC_ARENA_MAPS1 = 'Arena da Lâmina Afiada',
    AC_ARENA_MAPS2 = 'Arena de Nagrand',
    AC_ARENA_MAPS3 = 'Ruínas de Lordaeron',

    AN_ARENA_MASTER = 'O Mestre da Arena',
    AD_ARENA_MASTER = 'Obter as conquistas de arena listadas abaixo.',

    AN_AZZINOTH = 'Glaives de Azzinoth',
    AD_AZZINOTH = 'Empunhar os Glaives de Guerra de Azzinoth.',
	AN_THORIDAL = 'Thori\'dal, a Fúria das Estrelas',
    AD_THORIDAL = 'Empunhar Thori\'dal, a Fúria das Estrelas.',
    AC_OBTAIN_MAINHAND_AZZINOTH = 'Rechte Kriegsgleve von Azzinoth', --#--#--
    AC_OBTAIN_OFFHAND_AZZINOTH = 'Linke Kriegsgleve von Azzinoth', --#--#--
	AN_BEAR_MOUNT = 'Urso Guerreiro Amani',
    AD_BEAR_MOUNT = 'Proprietário do Urso Guerreiro Amani.',
	AN_HAWK_MOUNT = 'Falcostruz Branco Veloz',
    AD_HAWK_MOUNT = 'Obter o Falcostruz Branco Veloz de Kael\'thas Andassol, no Terraço dos Magísteres.',
	AN_ALAR_MOUNT = 'Cinzas de Al\'ar',
    AD_ALAR_MOUNT = 'Obter as Cinzas de Al\'ar de Kael\'thas Andassol na Bastilha da Tormenta.',
	AN_HORSEMAN_MOUNT = 'As rédeas do cavaleiro',
	AD_HORSEMAN_MOUNT = 'Durante a Noturnália, matar o Cavaleiro Sem Cabeça no Monastério Escarlate e obter as As Rédeas do Cavaleiro.',
	AN_HERO_SHATTRATH = 'Herói de Shattrath',
	AD_HERO_SHATTRATH = 'Tornar-se exaltado pelos Áugures e pelos Aldor.',
	AN_HERO_SCRYER = 'Os Áugures',
	AN_HERO_ALDOR = 'Os Aldor',
	AN_CHAMPION_NAARU = 'Campeão dos Naarus',
	AD_CHAMPION_NAARU = 'Conquistou o título "Campeão dos Naarus".',
	AR_CHAMPION_NAARU = 'Campeão dos Naarus',
	AN_HAND_ADAL = 'Mão de A\'dal',
	AD_HAND_ADAL = 'Conquistou o título "A Mão de A\'dal".',

    AN_P3_FIRST_WEEK = 'Eroberer der Scherbenwelt', --#--#--
    AD_P3_FIRST_WEEK = 'Bezwingt Archimonde und Illidan Sturmgrimm in der ersten Woche von Phase 3.', --#--#--
    AC_KILL_ARCHIMONDE = 'Arquimonde',
    AR_P3_FIRST_WEEK = 'Eroberer der Scherbenwelt', --#--#--
	
	AN_FLIGHFORM = 'Forma Voadora Veloz',
	AD_FLIGHFORM = 'Completar a missão de druida para obter a Forma Voadora Veloz.',

    AN_KRUUL = '...nicht noch ein Dämonenlord!', --#--#--
	AD_KRUUL = 'Bezwingt Hochlord Kruul während des Kampfes um das Dunkle Portal.', --#--#--

    AN_ATTUMEN_MOUNT = 'Rédeas do Cavalo de Guerra Fogoso',
	AD_ATTUMEN_MOUNT = 'Obter as Rédeas do Cavalo de Guerra Fogoso de Attumen, o Caçador, em Karazhan.',

    -- Built-in title catalog: labels and grammatical name placement.
    TITLE_BUILTIN_EXPLORER_LABEL = 'Conquistadora',
    TITLE_BUILTIN_EXPLORER_FORMAT_MALE = 'Conquistadora %s',
    TITLE_BUILTIN_EXPLORER_FORMAT_FEMALE = 'Conquistadora %s',
    TITLE_BUILTIN_BATTLEMASTER_LABEL = 'Mestre de Batalha',
    TITLE_BUILTIN_BATTLEMASTER_FORMAT_MALE = 'Mestre de Batalha %s',
    TITLE_BUILTIN_BATTLEMASTER_FORMAT_FEMALE = 'Mestre de Batalha %s',
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
    TITLE_BUILTIN_JENKINS_LABEL = 'Jenkins',
    TITLE_BUILTIN_JENKINS_FORMAT_MALE = '%s Jenkins',
    TITLE_BUILTIN_JENKINS_FORMAT_FEMALE = '%s Jenkins',
    TITLE_BUILTIN_AZEROTHS_GREATEST_ANGLER_LABEL = 'Größter Angler von Azeroth', --#--#--
    TITLE_BUILTIN_AZEROTHS_GREATEST_ANGLER_FORMAT_MALE = '%s, der größte Angler von Azeroth', --#--#--
    TITLE_BUILTIN_AZEROTHS_GREATEST_ANGLER_FORMAT_FEMALE = '%s, die größte Anglerin von Azeroth', --#--#--
    TITLE_BUILTIN_CHEF_LABEL = 'Chef',
    TITLE_BUILTIN_CHEF_FORMAT_MALE = 'Chef %s',
    TITLE_BUILTIN_CHEF_FORMAT_FEMALE = 'Chef %s',
    TITLE_BUILTIN_THE_EXALTED_LABEL = 'Der Ehrfurchtgebietende', --#--#--
    TITLE_BUILTIN_THE_EXALTED_FORMAT_MALE = '%s der Ehrfurchtgebietende', --#--#--
    TITLE_BUILTIN_THE_EXALTED_FORMAT_FEMALE = '%s die Ehrfurchtgebietende', --#--#--
    TITLE_BUILTIN_BLOODSAIL_ADMIRAL_LABEL = 'Almirante da Vela Sangrenta',
    TITLE_BUILTIN_BLOODSAIL_ADMIRAL_FORMAT_MALE = 'Almirante da Vela Sangrenta %s',
    TITLE_BUILTIN_BLOODSAIL_ADMIRAL_FORMAT_FEMALE = 'Almirante da Vela Sangrenta %s',
    TITLE_BUILTIN_THE_HALLOWED_LABEL = 'o Noturno',
    TITLE_BUILTIN_THE_HALLOWED_FORMAT_MALE = '%s, o Noturno',
    TITLE_BUILTIN_THE_HALLOWED_FORMAT_FEMALE = '%s, a Noturna',
    TITLE_BUILTIN_MERRYMAKER_LABEL = 'Ajudante de Papai Inverno',
    TITLE_BUILTIN_MERRYMAKER_FORMAT_MALE = '%s, o Ajudante de Papai Inverno',
    TITLE_BUILTIN_MERRYMAKER_FORMAT_FEMALE = '%s, o Ajudante de Papai Inverno',
    TITLE_BUILTIN_THE_LOVE_FOOL_LABEL = 'Liebesgott', --#--#--
    TITLE_BUILTIN_THE_LOVE_FOOL_FORMAT_MALE = '%s, Liebesgott', --#--#--
    TITLE_BUILTIN_THE_LOVE_FOOL_FORMAT_FEMALE = '%s, Liebesgöttin', --#--#--
    TITLE_BUILTIN_ELDER_LABEL = 'Duelista',
    TITLE_BUILTIN_ELDER_FORMAT_MALE = 'Duelista %s',
    TITLE_BUILTIN_ELDER_FORMAT_FEMALE = 'Duelista %s',
    TITLE_BUILTIN_PATRON_LABEL = 'Tio',
    TITLE_BUILTIN_PATRON_FORMAT_MALE = 'Tio %s',
    TITLE_BUILTIN_PATRON_FORMAT_FEMALE = 'Tia %s',
    TITLE_BUILTIN_FLAME_KEEPER_LABEL = 'Desafiante',
    TITLE_BUILTIN_FLAME_KEEPER_FORMAT_MALE = 'Desafiante %s',
    TITLE_BUILTIN_FLAME_KEEPER_FORMAT_FEMALE = 'Desafiante %s',
    TITLE_BUILTIN_THE_LOREMASTER_LABEL = 'O Mestre Historiador',
    TITLE_BUILTIN_THE_LOREMASTER_FORMAT_MALE = 'Mestre Historiador %s',
    TITLE_BUILTIN_THE_LOREMASTER_FORMAT_FEMALE = 'Mestre Historiadora %s',
    TITLE_BUILTIN_CONQUEROR_BLACK_TEMPLE_LABEL = 'Bezwinger des Schwarzen Tempels', --#--#--
    TITLE_BUILTIN_CONQUEROR_BLACK_TEMPLE_FORMAT_MALE = '%s, Bezwinger des Schwarzen Tempels', --#--#--
    TITLE_BUILTIN_CONQUEROR_BLACK_TEMPLE_FORMAT_FEMALE = '%s, Bezwingerin des Schwarzen Tempels', --#--#--
    TITLE_BUILTIN_CONQUEROR_OF_OUTLAND_LABEL = 'Eroberer der Scherbenwelt', --#--#--
    TITLE_BUILTIN_CONQUEROR_OF_OUTLAND_FORMAT_MALE = '%s, Eroberer der Scherbenwelt', --#--#--
    TITLE_BUILTIN_CONQUEROR_OF_OUTLAND_FORMAT_FEMALE = '%s, Eroberin der Scherbenwelt', --#--#--
    TITLE_BUILTIN_CHAMPION_OF_THE_NAARU_LABEL = 'Campeão dos Naarus',
    TITLE_BUILTIN_CHAMPION_OF_THE_NAARU_FORMAT_MALE = 'Champion der Naaru %s', --#--#--
    TITLE_BUILTIN_CHAMPION_OF_THE_NAARU_FORMAT_FEMALE = 'Champion der Naaru %s', --#--#--
    TITLE_BUILTIN_HAND_OF_ADAL_LABEL = 'Mão de A\'dal',
    TITLE_BUILTIN_HAND_OF_ADAL_FORMAT_MALE = 'Hand von A\'dal %s', --#--#--
    TITLE_BUILTIN_HAND_OF_ADAL_FORMAT_FEMALE = 'Hand von A\'dal %s', --#--#--
    TITLE_BUILTIN_HERO_OF_OUTLAND_LABEL = 'Held der Scherbenwelt', --#--#--
    TITLE_BUILTIN_HERO_OF_OUTLAND_FORMAT_MALE = 'Held der Scherbenwelt %s', --#--#--
    TITLE_BUILTIN_HERO_OF_OUTLAND_FORMAT_FEMALE = 'Heldin der Scherbenwelt %s', --#--#--
    TITLE_BUILTIN_GREAT_HERO_OF_OUTLAND_LABEL = 'Großartiger Held der Scherbenwelt', --#--#--
    TITLE_BUILTIN_GREAT_HERO_OF_OUTLAND_FORMAT_MALE = 'Großartiger Held der Scherbenwelt %s', --#--#--
    TITLE_BUILTIN_GREAT_HERO_OF_OUTLAND_FORMAT_FEMALE = 'Großartige Heldin der Scherbenwelt %s', --#--#--
    TITLE_BUILTIN_BREWMASTER_LABEL = 'Mestre-cervejeiro',
    TITLE_BUILTIN_BREWMASTER_FORMAT_MALE = 'Mestre Cervejeiro %s',
    TITLE_BUILTIN_BREWMASTER_FORMAT_FEMALE = 'Mestre Cervejeira %s',
    -- End built-in title catalog
}

SexyLib:InitLocalization('Anniversary Achievements', L)
