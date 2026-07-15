if GetLocale() ~= 'frFR' then return end

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

    GEAR_SLOT_HEAD = 'Tête',
    GEAR_SLOT_NECK = 'Cou',
    GEAR_SLOT_SHOULDER = 'Épaule',
    GEAR_SLOT_CHEST = 'Torse',
    GEAR_SLOT_WAIST = 'Taille',
    GEAR_SLOT_LEGS = 'Jambes',
    GEAR_SLOT_FEET = 'Pieds',
    GEAR_SLOT_WRIST = 'Poignets',
    GEAR_SLOT_HANDS = 'Mains',
    GEAR_SLOT_FIRST_RING = 'Anneau droit',
    GEAR_SLOT_SECOND_RING = 'Anneau gauche',
    GEAR_SLOT_FIRST_TRINKET = 'Premier bijou',
    GEAR_SLOT_SECOND_TRINKET = 'Second bijou',
    GEAR_SLOT_CLOAK = 'Cape',
    GEAR_SLOT_WEAPON = 'Arme',

    NPC_3444 = 'Grubenratte', --#--#--
    NPC_620 = 'Poulet',
    NPC_1420 = 'Crapaud',
    NPC_13321 = 'Grenouille',
    NPC_2620 = 'Chien de prairie',
    NPC_9600 = 'Perroquet',
    NPC_883 = 'Daim',
    NPC_9699 = 'Hanneton de feu',
    NPC_4953 = 'Mocassin',
    NPC_721 = 'Lapin',
    NPC_9700 = 'Crabe de lave',
    NPC_15476 = 'Scorpion',
    NPC_2914 = 'Serpent',
    NPC_16030 = 'Asticot',
    NPC_4075 = 'Rat',
    NPC_1412 = 'Ecureuil',
    NPC_7390 = 'Nymphensittich', --#--#--
    NPC_15475 = 'Käfer', --#--#--
    NPC_15010 = 'Dschungelkröte', --#--#--
    NPC_4076 = 'Blatte',
    NPC_13016 = 'Untergrundratte', --#--#--
    NPC_14881 = 'Araignée',
    NPC_2110 = 'Schwarze Ratte', --#--#--
    NPC_4166 = 'Gazelle',
    NPC_1933 = 'Mouton',
    NPC_890 = 'Faon',
    NPC_2098 = 'Bélier',
    NPC_2442 = 'Vache',
    NPC_6368 = 'Félin',
    NPC_6271 = 'Souris',
    NPC_385 = 'Pferd', --#--#--
    NPC_10685 = 'Pourceau',
    NPC_3300 = 'Aspic',
    NPC_15065 = 'Lady', --#--#--
    NPC_15066 = 'Cleo', --#--#--
    NPC_15071 = 'Schleicherpfote', --#--#--
    NPC_15072 = 'Spike', --#--#--

    CATEGORY_GENERAL = 'Général',
    CATEGORY_QUESTS = 'Quêtes',
	CATEGORY_PVP = 'Joueur contre Joueur',
    CATEGORY_KALIMDOR = 'Kalimdor',
    CATEGORY_EASTERN_KINGDOMS = 'Royaumes de l\'est',
    CATEGORY_OUTLAND = 'Outreterre',
    CATEGORY_VANILLA = 'Classique',
    CATEGORY_TBC = 'The Burning Crusade',
    CATEGORY_EXPLORATION = 'Exploration',
    CATEGORY_PVE = 'Donjons & raids',
    CATEGORY_ARENA = 'Arène',
    CATEGORY_BG_ALTERAC = 'Vallée d\'Alterac',
    CATEGORY_BG_WARSONG = 'Goulet des Chanteguerres',
    CATEGORY_BG_ARATHI = 'Bassin Arathi',
    CATEGORY_BG_EYE = 'Œil du cyclone',
    CATEGORY_PROFESSIONS = 'Métiers',
    CATEGORY_REPUTATION = 'Réputation',
	CATEGORY_EVENTS = 'Évènements mondiaux',
    CATEGORY_VALENTINES = 'De l\'amour dans l\'air',
    CATEGORY_LUNAR = 'Fête lunaire',
    CATEGORY_NOBLEGARDEN = 'Jardin des nobles',
    CATEGORY_CHILDREN = 'Semaine des enfants',
    CATEGORY_MIDSUMMER = 'Solstice d\'été',
    CATEGORY_BREWFEST = 'Fête des Brasseurs',
    CATEGORY_HALLOWSEND = 'Sanssaint',
    CATEGORY_WINTERVEIL = 'Voile d\'hiver',
    CATEGORY_FEATS_OF_STRENGTH = 'Tours de force',
	
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
	AN_WARLOCK_T2 = 'Robe de Némésis',
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

    AN_LVL = 'Niveau %d',
    AD_LVL = 'Atteindre le niveau %d',

    AN_BANK = 'Chambre forte',
    AD_BANK = 'Acheter 7 emplacements de sac supplémentaires.',
    AC_BANK = 'Acheter 7 emplacements de sac supplémentaires.',

    AN_QUESTS = '%dquêtes achevées',
    AD_QUESTS = 'Achever %dquêtes.',
    AC_QUESTS = 'Schließt %d Quests ab.', --#--#--

    AN_DAILY_QUESTS = '%d tägliche Quests abgeschlossen', --#--#--
    AD_DAILY_QUESTS = 'Achever %dquêtes journalières.',
    AC_DAILY_QUESTS = 'Schließt %d tägliche Quests ab.', --#--#--

    AN_QUEST_GOLD5 = 'Glitzernde Belohnung', --#--#--
    AN_QUEST_GOLD10 = 'Sammler geprägter Münzen', --#--#--
    AN_QUEST_GOLD25 = 'Täglich Brot', --#--#--
    AN_QUEST_GOLD50 = 'Wohlverdientes Gold', --#--#--
    AN_QUEST_GOLD100 = 'Verdient durch Schweiß und Blut', --#--#--
    AN_QUEST_GOLD250 = 'Golddrucker', --#--#--
    AN_QUEST_GOLD500 = 'Angemessene Entlohnung', --#--#--
    AD_QUEST_GOLD = 'Obtenir %dpièces d\'or en récompenses de quêtes.',
    AC_QUEST_GOLD = 'Erhaltet %d Gold durch Questbelohnungen.', --#--#--

    AN_QUESTS_ZONE = 'Maître des traditions %s',
    AD_QUESTS_ZONE = 'Schließt die Quest "%s" in %s ab.', --#--#--
    AD_QUESTS_ZONE_MULTI = 'Schließt die folgenden Quests in %s ab.', --#--#--
    AC_QUESTS_ZONE = 'Schließt die Quest "%s" ab.', --#--#--

    AZSHARA_1 = 'Azshara',
    AZSHARA_2 = 'Azshara',
    QUEST_3602 = 'Azsharit', --#--#--

    FELWOOD_1 = 'Gangrebois',
    FELWOOD_2 = 'Gangrebois',
    QUEST_5165 = 'Übergießen der Flammen des Schutzes', --#--#--
    QUEST_5385 = 'Die Überreste von Trey Lichtschmied', --#--#--

    DESOLACE_1 = 'Désolace',
    DESOLACE_2 = 'Désolace',
    QUEST_6027 = 'Buch der Uralten', --#--#--

    DUSTWALLOW_1 = 'Marécage d\'Âprefange',
    DUSTWALLOW_2 = 'Marécage d\'Âprefange',
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

    BARRENS_1 = 'Les Tarides',
    BARRENS_2 = 'Les Tarides',
    QUEST_888 = 'Gestohlene Beute', --#--#--
    QUEST_902 = 'Samophlang', --#--#--

    WINTERSPRING_1 = 'Berceau-de-l\'Hiver',
    WINTERSPRING_2 = 'Berceau-de-l\'Hiver',
    QUEST_975 = 'Behälter von Mau\'ari', --#--#--
    QUEST_5082 = 'Bedrohung durch die Winterfelle', --#--#--
    QUEST_5121 = 'Oberhäuptling der Winterfelle', --#--#--
    QUEST_5163 = 'Sind wir endlich da, Yeti?', --#--#--
    QUEST_4842 = 'Sonderbare Quellen', --#--#--

    TANARIS_1 = 'Tanaris',
    TANARIS_2 = 'Tanaris',
    QUEST_2662 = 'Noggenfogger-Elixier', --#--#--
    QUEST_2874 = 'Lieferung für MacKinley', --#--#--
    QUEST_1691 = 'Noch mehr Wüstenläufergerechtigkeit', --#--#--
    QUEST_113 = 'Insektenteil-Analyse', --#--#--

    STONETALON_1 = 'Les Serres-Rocheuses',
    STONETALON_2 = 'Les Serres-Rocheuses',
    QUEST_1096 = 'Gerenzo Pfeifzang', --#--#--

    UNGORO_1 = 'Cratère d\'Un\'Goro',
    UNGORO_2 = 'Cratère d\'Un\'Goro',
    QUEST_3962 = 'Allein ist es gefährlich', --#--#--
    QUEST_4245 = 'Chasing A-Me 01', --#--#--
    QUEST_4292 = 'Ein Köder für Lar\'korwi', --#--#--

    THOUSAND_NEEDLES_1 = 'Mille pointes',
    THOUSAND_NEEDLES_2 = 'Mille pointes',
    QUEST_1189 = 'Sicherheit zuerst', --#--#--

    ARATHI_1 = 'Hautes-terres Arathies',
    ARATHI_2 = 'Hautes-terres Arathies',
    QUEST_652 = 'Den Hauptstein zerbrechen', --#--#--

    BADLANDS_1 = 'Terres ingrates',
    BADLANDS_2 = 'Terres ingrates',
    QUEST_737 = 'Verbotenes Wissen', --#--#--
    QUEST_778 = 'Das wird schwierig', --#--#--
    QUEST_656 = 'Beschwören der Prinzessin', --#--#--
	QUEST_793 = 'Zerbrochene Allianzen', --#--#--
	QUEST_717 = 'Erdbeben', --#--#--
    
    EASTERN_PLAGUELANDS_1 = 'Maleterres de l\'est',
    EASTERN_PLAGUELANDS_2 = 'Maleterres de l\'est',
    QUEST_5942 = 'Versteckte Schätze', --#--#--
    QUEST_6148 = 'Das Scharlachrote Orakel Demetria', --#--#--
    QUEST_6187 = 'Ordnung muss wieder hergestellt werden', --#--#--
    QUEST_5265 = 'Der Argentumtresor', --#--#--

    BLASTED_LANDS_1 = 'Terres foudroyées',
    BLASTED_LANDS_2 = 'Terres foudroyées',
    QUEST_3628 = 'Ihr seid Rakh\'likh, Dämon', --#--#--

    STRANGLETHORN_VALLEY_1 = 'Vallée de Strangleronce',
    STRANGLETHORN_VALLEY_2 = 'Vallée de Strangleronce',
    QUEST_208 = 'La chasse au gros gibier',
    QUEST_600 = 'Venture Company-Bergbau', --#--#--
    QUEST_613 = 'Maurys Fuß aufbrechen', --#--#--
    QUEST_628 = 'Exzelsior', --#--#--
    QUEST_338 = 'Les vertes collines de Strangleronce',
	
	AN_NESINGWARY = 'Les vertes collines de Strangleronce',
	AD_NESINGWARY = 'Achever toutes les quêtes d\'Hemet Nesingwary dans la vallée de Strangleronce, y compris « Les vertes collines de Strangleronce » et « La chasse au gros gibier ».',

    WESTERN_PLAGUELANDS_1 = 'Maleterres de l\'ouest',
    WESTERN_PLAGUELANDS_2 = 'Maleterres de l\'ouest',
    QUEST_5944 = 'In den Träumen', --#--#--
    QUEST_5051 = 'Zwei Hälften vereint', --#--#--
    QUEST_4985 = 'Die Tierwelt leidet auch', --#--#--

    SEARING_GORGE_1 = 'Gorge des Vents brûlants',
    SEARING_GORGE_2 = 'Gorge des Vents brûlants',
    QUEST_3481 = 'Plunder...', --#--#--

    BLACK_ROCK_1 = 'Mont Rochenoire',
    BLACK_ROCK_2 = 'Mont Rochenoire',
    QUEST_8996 = 'Rückkehr zu Bodley', --#--#--

    AN_WISDOM_KEEPER = 'Maître des traditions',
    AD_WISDOM_KEEPER = 'Accomplir les hauts faits de quêtes listés ci-dessous.',
    AN_WISDOM_KEEPER_AZEROTH = 'Maître des traditions',
    AD_WISDOM_KEEPER_AZEROTH = 'Accomplir les hauts faits de quêtes listés ci-dessous.',
    AN_WISDOM_KEEPER_KALIMDOR = 'Maître des traditions de Kalimdor',
    AD_WISDOM_KEEPER_KALIMDOR = 'Accomplir les hauts faits de quêtes listés ci-dessous.',
    AN_WISDOM_KEEPER_EASTERN_KINGDOMS = 'Maître des traditions des Royaumes de l\'est',
    AD_WISDOM_KEEPER_EASTERN_KINGDOMS = 'Accomplir les hauts faits de quêtes listés ci-dessous.',
    AN_WISDOM_KEEPER_OUTLAND = 'Maître des traditions de l\'Outreterre',
    AD_WISDOM_KEEPER_OUTLAND = 'Accomplir les hauts faits relatifs aux quêtes de l\'Outreterre listés ci-dessous.',

    AN_RAGEFIRE_CHASM = 'Gouffre de Ragefeu',
    AD_RAGEFIRE_CHASM = 'Vaincre Taragaman l\'Affameur.',
    AN_WAILING_CAVERNS = 'Cavernes des Lamentations',
    AD_WAILING_CAVERNS = 'Vaincre Mutanus le Dévoreur.',
    AN_DEAD_MINES = 'Mortemines',
    AD_DEAD_MINES = 'Vaincre Edwin VanCleef.',
    AN_SHADOWFANG_KEEP = 'Donjon d’Ombrecroc',
    AD_SHADOWFANG_KEEP = 'Vaincre l’archimage Arugal.',
    AN_BLACKFATHOM_DEEPS = 'Profondeurs de Brassenoire',
    AD_BLACKFATHOM_DEEPS = 'Vaincre Aku’mai.',
    AN_JAIL = 'Prison de Hurlevent',
    AD_JAIL = 'Vaincre Bazil Thredd.',
    AN_GNOMREGAN = 'Gnomeregan',
    AD_GNOMREGAN = 'Vaincre le mekgénieur Thermojoncteur.',
    AN_RAZORFEN_KRAUL = 'Kraal de Tranchebauge',
    AD_RAZORFEN_KRAUL = 'Vaincre Charlga Trancheflanc.',
    AN_SCARLET_MONASTERY = 'Monastère écarlate',
    AD_SCARLET_MONASTERY = 'Vaincre la Croisade écarlate dans le Monastère écarlate.',
    AC_SCARLET_MONASTERY1 = 'Mage de sang Thalnos',
    AC_SCARLET_MONASTERY2 = 'Arcaniste Doan',
    AC_SCARLET_MONASTERY3 = 'Hérode',
    AC_SCARLET_MONASTERY4 = 'Commandant écarlate Mograine',
    AC_SCARLET_MONASTERY5 = 'Grande inquisitrice Blanchetête',
	
    AN_RAZORFEN_DOWNS = 'Souilles de Tranchebauge',
    AD_RAZORFEN_DOWNS = 'Vaincre Amnennar le Porte-Froid.',
    AN_ULDAMAN = 'Uldaman',
    AD_ULDAMAN = 'Détruisez Archaedas.',
    AN_ZULFARRAK = 'Zul’Farrak',
    AD_ZULFARRAK = 'Vaincre le chef Ukorz Scalpessable.',
    AN_MARAUDON = 'Maraudon',
    AD_MARAUDON = 'Vaincre la princesse Theradras.',
    AN_SUNKEN_TEMPLE = 'Temple englouti',
    AD_SUNKEN_TEMPLE = 'Vaincre l’Ombre d’Eranikus.',
	
    AN_NEW_EMPEROR = 'Profondeurs de Rochenoire',
    AD_NEW_EMPEROR = 'Vaincre l’empereur Dagran Thaurissan.',
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
	
    AN_BLACKROCK_SPIRE_BOTTOM = 'Bas du pic Rochenoire',
    AD_BLACKROCK_SPIRE_BOTTOM = 'Vaincre le seigneur Wyrmthalak.',
    AN_BLACKROCK_SPIRE_UPPER = 'Sommet du pic Rochenoire',
    AD_BLACKROCK_SPIRE_UPPER = 'Vaincre le général Drakkisath.',
    AN_BLACKROCK_SPIRE = 'Eindringling der Schwarzfelsspitze', --#--#--
    AD_BLACKROCK_SPIRE = 'Schließt die unten aufgelisteten Erfolge in der Schwarzfelsspitze ab.', --#--#--
    AN_DIRE_MAUL = 'Roi de Haches-Tripes',
    AD_DIRE_MAUL = 'Triompher de chaque aile de Hache-Tripes.',
    AC_DIRE_MAUL1 = 'Alzzin le Modeleur',
    AC_DIRE_MAUL2 = 'Immol’thar',
    AC_DIRE_MAUL3 = 'Roi Gordok',
    AN_STRATHOLME = 'Stratholme',
    AD_STRATHOLME = 'Triompher des pièges maléfiques qui hantent Stratholme.',
	AC_STRATHOLME1 = 'Balnazzar',
	AC_STRATHOLME2 = 'Baron Vaillefendre',
    AN_SCHOLOMANCE = 'Scholomance',
    AD_SCHOLOMANCE = 'Vaincre les chefs de la Scholomance.',
	AC_SCHOLOMANCE1 = 'Sombre Maître Gandling',
	AC_SCHOLOMANCE2 = 'Ras Murmegivre',
    AN_YOUNG_DEFENDER = 'Maître des vieux donjons',
    AD_YOUNG_DEFENDER = 'Accomplir les hauts faits dans les donjons classiques listés ci-dessous.',
    AN_DEFENDER = 'Verteidiger von Azeroth', --#--#--
    AD_DEFENDER = 'Schließt die unten aufgelisteten Dungeon-Erfolge ab.', --#--#--
    AR_DEFENDER = 'Verteidiger von Azeroth', --#--#--

    AN_ONYXIA = 'Onyxias Hort', --#--#--
    AD_ONYXIA = 'Bezwingt Onyxia.', --#--#--
    AN_AQ20 = 'Ruines d\'Ahn\'Qiraj',
    AD_AQ20 = 'Vaincre Ossirian l’Intouché.',
    AN_ZULGURUB = 'Zul’Gurub',
    AD_ZULGURUB = 'Vaincre Hakkar.',
    AN_RAGNAROS = 'Cœur du Magma',
    AD_RAGNAROS = 'Vaincre Ragnaros.',
    AN_BLACK_WING_LAIR = 'Repaire de l’Aile noire',
    AD_BLACK_WING_LAIR = 'Vaincre Nefarian.',
    AN_AQ40 = 'Temple d’Ahn’Qiraj',
    AD_AQ40 = 'Vaincre C’Thun.',
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

    AN_PVP_RANK_A1 = 'Soldat',
    AN_PVP_RANK_A2 = 'Caporal',
    AN_PVP_RANK_A3 = 'Sergent',
    AN_PVP_RANK_A4 = 'Sergent-chef',
    AN_PVP_RANK_A5 = 'Sergent-major',
    AN_PVP_RANK_A6 = 'Chevalier',
    AN_PVP_RANK_A7 = 'Chevalier-lieutenant',
    AN_PVP_RANK_A8 = 'Chevalier-capitaine',
    AN_PVP_RANK_A9 = 'Chevalier-champion',
    AN_PVP_RANK_A10 = 'Lieutenant-commandant',
    AN_PVP_RANK_A11 = 'Commandant',
    AN_PVP_RANK_A12 = 'Maréchal',
    AN_PVP_RANK_A13 = 'Grand maréchal',
    AN_PVP_RANK_A14 = 'Connétable',
    AN_PVP_RANK_H1 = 'Éclaireur',
    AN_PVP_RANK_H2 = 'Grunt',
    AN_PVP_RANK_H3 = 'Sergent',
    AN_PVP_RANK_H4 = 'Sergent-chef',
    AN_PVP_RANK_H5 = 'Adjudant',
    AN_PVP_RANK_H6 = 'Garde de pierre',
    AN_PVP_RANK_H7 = 'Garde de sang',
    AN_PVP_RANK_H8 = 'Légionnaire',
    AN_PVP_RANK_H9 = 'Centurion',
    AN_PVP_RANK_H10 = 'Champion',
    AN_PVP_RANK_H11 = 'Lieutenant-général',
    AN_PVP_RANK_H12 = 'Général',
    AN_PVP_RANK_H13 = 'Seigneur de guerre',
    AN_PVP_RANK_H14 = 'Grand seigneur de guerre',
    AD_PVP_RANK = 'Den Titel "%s" erhalten.', --#--#--
    AN_PVP_FIRST_KILL = 'Une victoire honorable',
    AD_PVP_FIRST_KILL = 'Obtenir une victoire honorable.',
    AC_PVP_FIRST_KILL = 'Obtenir une victoire honorable.',
    AN_PVP_KILLS = '%dvictoires honorables',
    AD_PVP_KILLS = 'Obtenir %dvictoires honorables.',
    AC_PVP_KILLS = 'Obtenir %dvictoires honorables',

    AN_MOB_KILLS_1 = 'Totschläger', --#--#--
    AN_MOB_KILLS_2 = 'Zerstörer', --#--#--
    AN_MOB_KILLS_3 = 'Brecher', --#--#--
    AN_MOB_KILLS_4 = 'Kopfgeldjäger', --#--#--
    AN_MOB_KILLS_5 = 'Gewittersturm aller Monster', --#--#--
    AN_MOB_KILLS_6 = 'Gewittersturm allen Lebens', --#--#--
    AN_MOB_KILLS_7 = 'Allgegenwärtiger Tod', --#--#--
    AD_MOB_KILLS = 'Tötet %d Gegner.', --#--#--
    AC_MOB_KILLS = 'Tötet %d Gegner', --#--#--

    AN_REPS_1 = 'Quelqu\'un m\'aime',
    AD_REPS_1 = 'Monter une réputation jusqu\'à Exalté.',
    AC_REPS_1 = 'Monter une réputation jusqu\'à Exalté.',
    AN_REPS_X = 'Réputations exaltées',
    AD_REPS = 'Monter %dréputations jusqu\'à Exalté.',
    AC_REPS = 'Erreicht bei %d Fraktionen einen ehrfürchtigen Ruf.', --#--#--
    AR_REPS = 'Der Ehrfurchtgebietende', --#--#--

    AN_HORDE_REPS = 'Ambassadeur de la Horde',
    AD_HORDE_REPS = 'Être exalté auprès des 5 races de sa faction.',
    AC_HORDE_REPS_1 = 'Exalté auprès d’Orgrimmar',
    AC_HORDE_REPS_2 = 'Exalté auprès des Trolls sombrelances',
    AC_HORDE_REPS_3 = 'Exalté auprès de Fossoyeuse',
    AC_HORDE_REPS_4 = 'Exalté auprès des Pitons du Tonnerre',
    AC_HORDE_REPS_5 = 'Exalté auprès de Lune-d’Argent',

    AN_ALLIANCE_REPS = 'Ambassadeur de l\'Alliance',
    AD_ALLIANCE_REPS = 'Être exalté auprès des 5 races de sa faction.',
    AC_ALLIANCE_REPS_1 = 'Exalté auprès de Hurlevent',
    AC_ALLIANCE_REPS_2 = 'Exalté auprès de Darnassus',
    AC_ALLIANCE_REPS_3 = 'Exalté auprès des exilés de Gnomeregan',
    AC_ALLIANCE_REPS_4 = 'Exalté auprès de Forgefer',
    AC_ALLIANCE_REPS_5 = 'Exalté auprès de l’Exodar',

    AN_ARGENT_DAWN = 'L\'Aube d\'argent',
    AD_ARGENT_DAWN = 'Être exalté auprès de l\'Aube d\'argent.',
    AN_BROOD_OF_NOZDORMU = 'Progéniture de Nozdormu',
    AD_BROOD_OF_NOZDORMU = 'Être exalté auprès de la Progéniture de Nozdormu.',
    AN_DARKMOON_FAIRE = 'Foire de Sombrelune',
    AD_DARKMOON_FAIRE = 'Erreicht beim Dunkelmond-Jahrmarkt den Status ehrfürchtig.', --#--#--
    AN_ZANDALAR_TRIBE = 'Héros de la tribu Zandalar',
    AD_ZANDALAR_TRIBE = 'Être exalté auprès de la tribu Zandalar.',
    AN_HYDRAXIANS = 'Les Hydraxiens',
    AD_HYDRAXIANS = 'Être exalté auprès des Hydraxiens.',
    AN_TIMBERMAW_HOLD = 'Il y a de l\'amour dans ce tunnel',
    AD_TIMBERMAW_HOLD = 'Être exalté auprès des Grumegueules.',
    AN_THORIUM = 'Confrérie du thorium',
    AD_THORIUM = 'Erreicht bei der Thoriumbruderschaft den Status ehrfürchtig.', --#--#--
    AN_SHENDRALAR = 'Agent der Shen\'dralar', --#--#--
    AD_SHENDRALAR = 'Erreicht bei den Shen\'dralar den Status ehrfürchtig.', --#--#--
    AN_CENARION = 'Cercle cénarien',
    AD_CENARION = 'Erreicht beim Zirkel des Cenarius den Status ehrfürchtig.', --#--#--

    AN_DEFILERS = 'Profanateur',
    AD_DEFILERS = 'Être exalté auprès des Profanateurs réprouvés.',
    AN_FROSTWOLF_CLAN = 'Héros du clan Loup-de-givre',
    AD_FROSTWOLF_CLAN = 'Être exalté auprès du clan Loup-de-givre.',
    AN_WARSONG_OUTRIDERS = 'Voltigeur Chanteguerre',
    AD_WARSONG_OUTRIDERS = 'Être exalté auprès des voltigeurs Chanteguerre.',
    AN_HORDE_PVP_FRACTIONS = 'Conquérant',
    AD_HORDE_PVP_FRACTIONS = 'Être exalté auprès des factions du goulet des Chanteguerres, du bassin Arathi et de la vallée d\'Alterac.',

    AN_LEAGUE_OF_ARATHOR = 'Chevalier d\'Arathor',
    AD_LEAGUE_OF_ARATHOR = 'Être exalté auprès de la ligue d\'Arathor.',
    AN_STORMSPIKE_GUARD = 'Héros de la garde Foudrepique',
    AD_STORMSPIKE_GUARD = 'Être exalté auprès de la garde Foudrepique.',
    AN_SILVERWING_SENTINELS = 'Sentinelle d\'Aile-argent',
    AD_SILVERWING_SENTINELS = 'Être exalté auprès des sentinelles d\'Aile-argent.',
    AN_ALLIANCE_PVP_FRACTIONS = 'Le justicier',
    AD_ALLIANCE_PVP_FRACTIONS = 'Être exalté auprès des factions du goulet des Chanteguerres, du bassin Arathi et de la vallée d\'Alterac.',

    AN_BOLVAR_SLAYER = 'La prise de Hurlevent',
    AD_BOLVAR_SLAYER = 'Tuer le généralissime Bolvar Fordragon.',
    AN_MAGNI_SLAYER = 'Mort au roi !',
    AD_MAGNI_SLAYER = 'Tuer le roi Magni Barbe-de-bronze.',
    AN_TYRANDE_SLAYER = 'L\'immortalité, c\'est fini',
    AD_TYRANDE_SLAYER = 'Tuer la grande prêtresse Tyrande Murmevent.',
    AN_VELEN_SLAYER = 'Éteignez la Lumière',
    AD_VELEN_SLAYER = 'Tuer le prophète Velen.',

    AN_ALLIANCE_KINGS_SLAYER = 'Pour la Horde !',
    AD_ALLIANCE_KINGS_SLAYER = 'Tuer les chefs de l\'Alliance.',

    AN_THRALL_SLAYER = 'Mort au chef de guerre !',
    AD_THRALL_SLAYER = 'Tuer Thrall.',
    AN_SYLVANAS_SLAYER = 'À bas la Dame noire',
    AD_SYLVANAS_SLAYER = 'Tuer Dame Sylvanas Coursevent.',
    AN_CAIRNE_SLAYER = 'Un Sabot-de-sang saignant',
    AD_CAIRNE_SLAYER = 'Tuer Cairne Sabot-de-sang.',
    AN_LORTHEMAR_SLAYER = 'Tué à Quel\'Thalas',
    AD_LORTHEMAR_SLAYER = 'Tuer Lor\'themar Theron.',

    AN_HORDE_KINGS_SLAYER = 'Pour l\'Alliance !',
    AD_HORDE_KINGS_SLAYER = 'Tuer les chefs de la Horde.',

    AN_RACES_KILLER = 'Connais ton ennemi...',
    AD_ALLIANCE_RACES_KILLER = 'Asséner un coup fatal apportant une victoire honorable sur cinq représentants de différentes races.',
    AD_HORDE_RACES_KILLER = 'Asséner un coup fatal apportant une victoire honorable sur cinq représentants de différentes races.',
    AC_HUMAN_KILLED = 'Humain',
    AC_NIGHTELF_KILLED = 'Elfe de la nuit',
    AC_DWARF_KILLED = 'Nain',
    AC_GNOME_KILLED = 'Gnome',
    AC_ORC_KILLED = 'Orc',
    AC_TROLL_KILLED = 'Troll',
    AC_SCOURGE_KILLED = 'Mort-vivant',
    AC_TAUREN_KILLED = 'Tauren',
    AC_DRAENEI_KILLED = 'Draeneï',
    AC_BLOODELF_KILLED = 'Elfe de sang',

    AN_CLASSES_KILLER = 'Ça, c\'est la classe',
    AD_CLASSES_KILLER = 'Asséner un coup fatal apportant une victoire honorable sur un membre de chaque classe.',
    AC_WARRIOR_KILLED = 'Guerrier',
    AC_HUNTER_KILLED = 'Chasseur',
    AC_ROGUE_KILLED = 'Voleur',
    AC_PRIEST_KILLED = 'Prêtre',
    AC_MAGE_KILLED = 'Mage',
    AC_WARLOCK_KILLED = 'Démoniste',
    AC_DRUID_KILLED = 'Druide',
    AC_PALADIN_KILLED = 'Paladin',
    AC_SHAMAN_KILLED = 'Chaman',

    AN_ALTERAC_WIN = 'Victoire dans la vallée d\'Alterac',
    AD_ALTERAC_WIN = 'Gagner dans la vallée d\'Alterac.',
    AN_ALTERAC_WINS = 'Vétéran de la vallée d\'Alterac',
    AD_ALTERAC_WINS = 'Erringt %d Siege im Alteractal.', --#--#--
    AN_WARSONG_WIN = 'Victoire dans le goulet des Chanteguerres',
    AD_WARSONG_WIN = 'Gagner dans le goulet des Chanteguerres.',
    AN_WARSONG_WINS = 'Vétéran du goulet des Chanteguerres',
    AD_WARSONG_WINS = 'Obtenir %dvictoires dans le goulet des Chanteguerres.',
    AN_ARATHI_WIN = 'Victoire dans le bassin Arathi',
    AD_ARATHI_WIN = 'Gagner dans le bassin Arathi.',
    AN_ARATHI_WINS = 'Vétéran du bassin Arathi',
    AD_ARATHI_WINS = 'Obtenir %dvictoires au bassin Arathi.',
    AN_EYE_WIN = 'Victoire dans l\'Œil du cyclone',
    AD_EYE_WIN = 'Gagner dans l\'Œil du cyclone.',
    AN_EYE_WINS = 'Vétéran de l\'Œil du cyclone',
    AD_EYE_WINS = 'Erringt %d Siege im Auge des Sturms.', --#--#--

    AN_ALTERAC_KILLING_BLOWS = 'Fleischwolf des Alteractals', --#--#--
    AD_ALTERAC_KILLING_BLOWS = 'Erreicht %d Todesstöße während einer einzigen Schlacht im Alteractal und bleibt bis zu deren Ende.', --#--#--
    AN_ALTERAC_GRAVEYARD_ASSAULT = 'Pilleur de tombes d\'Alterac',
    AD_ALTERAC_GRAVEYARD_ASSAULT = 'Prendre 50 cimetières dans la vallée d\'Alterac.',
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
    AN_ALTERAC_AUTOGRAPH = 'Tout vient à point à qui sait ramasser',
    AD_ALTERAC_AUTOGRAPH = 'Ramasser le portrait dédicacé d’Aguilor dans la vallée d’Alterac',

    AN_WARSONG_KILLS = 'Militärische Auszeichnung', --#--#--
    AD_WARSONG_KILLS = 'Erreicht %d ehrenhafte Siege während einer einzigen Schlacht in der Kriegshymnenschlucht und bleibt bis zu deren Ende.', --#--#--
    AN_WARSONG_FLAG_CAPTURE = 'Capture du drapeau',
    AD_WARSONG_FLAG_CAPTURE = 'Porter et capturer soi-même le drapeau dans le goulet des Chanteguerres.',
    AN_WARSONG_FLAG_CAPTURES = 'Großartiger Flaggenträger', --#--#--
    AD_WARSONG_FLAG_CAPTURES = 'Ergreift und erobert %d gegnerische Flaggen während einer einzigen Schlacht in der Kriegshymnenschlucht und bleibt bis zu deren Ende.', --#--#--
    AN_WARSONG_FLAG_RETURN = 'Fasst das nicht an!', --#--#--
    AD_WARSONG_FLAG_RETURN = 'Bringt als Verteidiger eine Flagge während einer einzigen Schlacht in der Kriegshymnenschlucht zurück und bleibt bis zu deren Ende.', --#--#--
    AN_WARSONG_FLAG_RETURNS = 'Défenseur obstiné',
    AD_WARSONG_FLAG_RETURNS = 'Bringt als Verteidiger %d Flaggen während einer einzigen Schlacht in der Kriegshymnenschlucht zurück und bleibt bis zu deren Ende.', --#--#--

    AN_ARATHI_BASE_ASSAULT = 'Konquistador', --#--#--
    AD_ARATHI_BASE_ASSAULT = 'Erobert eine Basis während einer einzigen Schlacht im Arathibecken und bleibt bis zu deren Ende.', --#--#--
    AN_ARATHI_BASE_ASSAULTS = 'Cap ou pas cap ?',
    AD_ARATHI_BASE_ASSAULTS = 'Erobert %d Basen während einer einzigen Schlacht im Arathibecken und bleibt bis zu deren Ende.', --#--#--
    AN_ARATHI_BASE_DEFEND = 'Beschützer', --#--#--
    AD_ARATHI_BASE_DEFEND = 'Verteidigt eine Basis während einer einzigen Schlacht im Arathibecken und bleibt bis zu deren Ende.', --#--#--
    AN_ARATHI_BASE_DEFENDS = 'Wächter', --#--#--
    AD_ARATHI_BASE_DEFENDS = 'Verteidigt %d Basen während einer einzigen Schlacht im Arathibecken und bleibt bis zu deren Ende.', --#--#--
    AN_ARATHI_CLOSE = 'C\'était gagné d\'avance *hum hum*',
    AD_ARATHI_CLOSE = 'Gagner dans le bassin Arathi avec une différence de 10 points (1600 à 1590).',
    AN_ARATHI_PERFECT = 'Bassin Arathi parfait',
    AD_ARATHI_PERFECT = 'Gagner dans le bassin Arathi par 1600 à 0.',

    AN_EYE_CAPTURE = 'Au centre du cyclone',
    AD_EYE_CAPTURE = 'Porter et capturer soi-même le drapeau dans l\'Œil du cyclone.',
    AD_EYE_CAPTURES = 'Ergreift und erobert persönlich %d Flaggen im Auge des Sturms und bleibt bis zum Ende der Schlacht.', --#--#--
    AN_EYE_GLORY = 'En route pour la gloire',
    AD_EYE_GLORY = 'Dans une même bataille pour l\'Œil du cyclone, capturer le drapeau 3 fois sans mourir.',
    AN_EYE_FAST_WIN = 'Rafale',
    AD_EYE_FAST_WIN = 'Gagner une bataille pour l\'Œil du cyclone en moins de 6 minutes.',
    AN_EYE_BERSERK = 'Berserker assoiffé de sang',
    AD_EYE_BERSERK = 'Asséner un coup fatal sous berserker dans l\'Œil du cyclone.',
    AN_EYE_IDEAL_VICTORY = 'Bon pied, bon Œil',
    AD_EYE_IDEAL_VICTORY = 'Gagner dans l\'Œil du cyclone par 1600 à 0.',

    AN_BGS_KILLING_BLOWS = 'Porte-mort',
    AD_BGS_KILLING_BLOWS = 'Erringt %d Todesstöße auf einem beliebigen Schlachtfeld.', --#--#--
    AN_BGS_KILLS = 'Le Faucheur',
    AD_BGS_KILLS = 'Erringt %d ehrenhafte Siege auf einem beliebigen Schlachtfeld.', --#--#--

    PROF_FIRST_AID = 'Secourisme',
    PROF_FISHING = 'Pêche',
    PROF_COOKING = 'Cuisine',
    PROF_ENCHANTING = 'Enchantement',
    PROF_TAILORING = 'Couture',
    PROF_ENGINEERING = 'Ingénierie',
    PROF_LEATHERWORKING = 'Travail du cuir',
    PROF_ALCHEMY = 'Alchimie',
    PROF_BLACKSMITHING = 'Forge',
    PROF_HERBALISM = 'Herboristerie',
    PROF_MINING = 'Minage',
    PROF_SKINNING = 'Dépeçage',
    PROF_JEWELCRAFTING = 'Joaillerie',
    SKILL_UNARMED = 'Mains nues',
    SKILL_RIDING = 'Monte',

    AN_PROFS_JOURNEYMAN = 'Lehrlingsprüfung', --#--#--
    AD_PROFS_JOURNEYMAN = 'Erlangt 75 Fertigkeitspunkte in einem Beruf.', --#--#--
    AN_PROFS_EXPERT = 'Compagnon de métier',
    AD_PROFS_EXPERT = 'Devenir un compagnon dans un métier.',
    AN_PROFS_ARTISAN = 'Expert de métier',
    AD_PROFS_ARTISAN = 'Devenir un expert dans un métier.',
    AN_PROFS_ONE = 'Professioneller Fachmann', --#--#--
    AD_PROFS_ONE = 'Erlangt 300 Fertigkeitspunkte in einem Beruf.', --#--#--
    AN_PROFS_ONE_OUTLAND = 'Maître de métier',
    AD_PROFS_ONE_OUTLAND = 'Devenir maître dans un métier.',
    AN_PROFS_TWO = 'Handwerker', --#--#--
    AD_PROFS_TWO = 'Werdet gleichzeitig in zwei Berufen Fachmann.', --#--#--
    AC_PROFS_TWO = 'Werdet gleichzeitig in zwei Berufen Fachmann.', --#--#--
    AN_PROFS_TWO_OUTLAND = 'Handwerker der Scherbenwelt', --#--#--
    AD_PROFS_TWO_OUTLAND = 'Werdet gleichzeitig in zwei Berufen Meister.', --#--#--
    AC_PROFS_TWO_OUTLAND = 'Werdet gleichzeitig in zwei Berufen Meister.', --#--#--

    AN_FIRST_AID_JOURNEYMAN = 'Lehrling in Erster Hilfe', --#--#--
    AD_FIRST_AID_JOURNEYMAN = 'Erlangt 75 Fertigkeitspunkte in Erster Hilfe.', --#--#--
    AN_FIRST_AID_EXPERT = 'Compagnon secouriste',
    AD_FIRST_AID_EXPERT = 'Devenir un compagnon secouriste.',
    AN_FIRST_AID_ARTISAN = 'Expert secouriste',
    AD_FIRST_AID_ARTISAN = 'Devenir expert secouriste.',
    AN_FIRST_AID_MASTER = 'Fachmann in Erster Hilfe', --#--#--
    AD_FIRST_AID_MASTER = 'Erlangt 300 Fertigkeitspunkte in Erster Hilfe.', --#--#--
    AN_FIRST_AID_OUTLAND_MASTER = 'Maître secouriste',
    AD_FIRST_AID_OUTLAND_MASTER = 'Devenir un maître secouriste.',
	
    AN_FISHING_JOURNEYMAN = 'Anglerlehrling', --#--#--
    AD_FISHING_JOURNEYMAN = 'Erlangt 75 Fertigkeitspunkte im Angeln.', --#--#--
    AN_FISHING_EXPERT = 'Compagnon pêcheur',
    AD_FISHING_EXPERT = 'Devenir un compagnon pêcheur.',
    AN_FISHING_ARTISAN = 'Expert pêcheur',
    AD_FISHING_ARTISAN = 'Devenir un expert pêcheur.',
    AN_FISHING_MASTER = 'Artisan pêcheur',
    AD_FISHING_MASTER = 'Devenir un artisan pêcheur.',
    AN_FISHING_OUTLAND_MASTER = 'Maître pêcheur',
    AD_FISHING_OUTLAND_MASTER = 'Devenir un maître pêcheur.',
	
    AN_COOKING_JOURNEYMAN = 'Kochlehrling', --#--#--
    AD_COOKING_JOURNEYMAN = 'Erlangt 75 Fertigkeitspunkte im Kochen.', --#--#--
    AN_COOKING_EXPERT = 'Compagnon cuisinier',
    AD_COOKING_EXPERT = 'Devenir un compagnon cuisinier.',
    AN_COOKING_ARTISAN = 'Expert cuisinier',
    AD_COOKING_ARTISAN = 'Devenir un expert cuisinier.',
    AN_COOKING_MASTER = 'Artisan cuisinier',
    AD_COOKING_MASTER = 'Devenir un artisan cuisinier.',
    AN_COOKING_OUTLAND_MASTER = 'Maître cuisinier',
    AD_COOKING_OUTLAND_MASTER = 'Devenir un maître cuisinier.',
	
    AN_PROFS_SECONDARY = 'Boulots alimentaires',
    AD_PROFS_SECONDARY = 'Devenir un artisan en pêche, secourisme et cuisine.',
    AN_PROFS_SECONDARY_OUTLAND = 'Boulots alimentaires',
    AD_PROFS_SECONDARY_OUTLAND = 'Devenir un maître en pêche, secourisme et cuisine.',
    AN_PROFS_FIVE = 'Genie', --#--#--
    AN_PROFS_FIVE_OUTLAND = 'Genie der Scherbenwelt', --#--#--
    AD_PROFS_FIVE = 'Erlangt die unten aufgelisteten Berufserfolge.', --#--#--
    AN_UNARMED_SKILL = 'Qui a commandé une salade de phalanges ?',
    AD_UNARMED_SKILL = 'Obtenir un score de 350 avec la compétence Mains nues.',

    AN_EXPLORE_AZEROTH = 'Grand explorateur',
    AD_EXPLORE_AZEROTH = 'Explorer les Royaumes de l\'est, Kalimdor et l\'Outreterre.',
	AR_EXPLORER = 'Entdecker', --#--#--
    AN_EXPLORE_KALIMDOR = 'Exploration de Kalimdor',
    AD_EXPLORE_KALIMDOR = 'Explorer les régions de Kalimdor.',
    AN_EXPLORE_EASTERN_KINGDOMS = 'Exploration des Royaumes de l\'est',
    AD_EXPLORE_EASTERN_KINGDOMS = 'Explorer les régions des Royaumes de l\'est.',
	AN_EXPLORE = 'Erforscht %s', --#--#--
    AD_EXPLORE = 'Erforscht %s und enthüllt die verdeckten Gebiete auf der Weltkarte.', --#--#--

    AN_SULFURAS = 'Sulfuras, Main de Ragnaros',
    AD_SULFURAS = 'S\'équiper de Sulfuras, Main de Ragnaros.',
    AN_THUNDER_FURY = 'Lame-tonnerre, épée bénie du Cherchevent',
    AD_THUNDER_FURY = 'S\'équiper de la Lame-tonnerre, épée bénie du Cherchevent.',
    AN_ATIESH = 'Atiesh, grand bâton du Gardien',
    AD_ATIESH = 'S\'équiper d\'Atiesh, grand bâton du Gardien.',
    AN_BLACK_SCARAB = 'Seigneur scarabée',
    AD_BLACK_SCARAB = 'Avoir ouvert les portes d\'Ahn\'Qiraj.',
    AN_RED_SCARAB = 'Pourquoi ? Parce que !!!',
    AD_RED_SCARAB = 'Obtenir un cristal de résonance qiraji rouge.',
	AN_TIGER_MOUNT = 'Tigre zulien rapide',
    AD_TIGER_MOUNT = 'Obtenir le tigre zulien rapide sur le grand prêtre Thekal à Zul\'Gurub.',
	AN_RAPTOR_MOUNT = 'Raptor razzashi rapide',
    AD_RAPTOR_MOUNT = 'Obtenir le raptor Razzashi rapide sur le seigneur sanglant Mandokir à Zul’Gurub.',
	AN_BARON_MOUNT = 'Rênes de destrier de la mort',
    AD_BARON_MOUNT = 'Obtenir les rênes de destrier de la mort sur le baron Vaillefendre à Stratholme.',
	AN_SABER_MOUNT = 'Sabre-de-givre de Berceau-de-l\'Hiver',
    AD_SABER_MOUNT = 'Obtenir un sabre-de-givre de Berceau-de-l\'Hiver.',
    AN_ARGENT_DAWN_TABARD = 'Tabard de l\'Aube d\'argent',
    AD_ARGENT_DAWN_TABARD = 'Avoir obtenu un tabard de l\'Aube d\'argent lors de l\'invasion du Fléau.',
    
    AN_UNCOMMON_GEAR = 'Selten', --#--#--
    AD_UNCOMMON_GEAR = 'Legt an jedem Platz einen Gegenstand von seltener Qualität an.', --#--#--
    AN_RARE_GEAR = 'Qualité supérieure',
    AD_RARE_GEAR = 'Équiper un objet de niveau 115 et de qualité supérieure dans chaque emplacement.',
    AN_EPIC_GEAR = 'Qualité épique',
    AD_EPIC_GEAR = 'Équiper un objet de niveau 115 et de qualité épique dans chaque emplacement.',

    AN_STOCKING_UP = 'Réserves',
    AD_STOCKING_UP = 'Créer 500 bandages épais en tisse-néant.',
    AC_STOCKING_UP = 'Stellt 100 schwere Runenstoffverbände her', --#--#--
    AN_STOCKING_UP_2 = 'Réserves',
    AD_STOCKING_UP_2 = 'Créer 500 bandages épais en étoffe runique.',
    AC_STOCKING_UP_2 = 'Créer 500 bandages épais en étoffe runique.',
    AN_STOCKING_UP_OUTLAND = 'Vorbereitung für die Leere', --#--#--
    AD_STOCKING_UP_OUTLAND = 'Stellt 100 schwere Netherstoffverbände her.', --#--#--
    AC_STOCKING_UP_OUTLAND = 'Stellt 100 schwere Netherstoffverbände her', --#--#--
    AN_STOCKING_UP_2_OUTLAND = 'Réserves',
    AD_STOCKING_UP_2_OUTLAND = 'Créer 500 bandages épais en tisse-néant.',
    AC_STOCKING_UP_2_OUTLAND = 'Créer 500 bandages épais en tisse-néant.',

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
	
	AN_FISHING_COUNT = '%dpoissons',
	AC_FISHING_COUNT = 'Angelt %d Gegenstände oder Fische.', --#--#--
	AD_FISHING_COUNT = 'Pêcher %dobjets.',

    AN_COOKING_RECIPES_5 = 'Commis',
    AN_COOKING_RECIPES_10 = 'Cuistot',
    AN_COOKING_RECIPES_25 = 'Chef de partie',
    AN_COOKING_RECIPES_50 = 'Sous chef',
    AN_COOKING_RECIPES_75 = 'Chef de Cuisine', --#--#--
    AR_COOKING_RECIPES = 'Chefkoch', --#--#--
    AD_COOKING_RECIPES = 'Apprendre %drecettes de cuisine.',
    AC_COOKING_RECIPES = 'Lernt %d Kochrezepte', --#--#--

    AN_COOKING_SOUP = 'Suppenkocher', --#--#--
    AN_COOKING_DESSERT = 'Knollenmeister', --#--#--
    AN_COOKING_SQUID = 'Fang des Tages', --#--#--
    AN_COOKING_DUMPLINGS = 'Omas Knödel', --#--#--
    AN_COOKING_CAKE = 'Le gâteau n\'est pas un mensonge',
    AD_COOKING_CAKE = 'Cuisiner un gâteau au chocolat délicieux.',
    AD_COOKING_CREATE = 'Kocht %s %d-mal.', --#--#--
    AC_COOKING_CREATE = 'Kocht %s %d-mal', --#--#--
    AN_COOKING_BIG_TABLE = 'Gloire au chef',
    AD_COOKING_BIG_TABLE = 'Accomplir les hauts faits de cuisine listés ci-dessous.',

    AN_COOKING_FISHERMANS_FEAST = 'Festin du pêcheur',
    AN_COOKING_SPICY_HOT_TALBUK = 'Talbuk extra piquant',
    AN_COOKING_SKULLFISH_SOUP = 'Soupe de poisson-crâne',
    AN_COOKING_RAVAGER_DOG = 'Croque-ravageur',

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

    AN_DUEL = 'Duel-icieux',
    AD_DUEL = 'Gagner un duel contre un autre personnage.',
    AN_DUELS_10 = 'Duelliste',
    AN_DUELS_25 = 'Geübter Duellist', --#--#--
    AN_DUELS_100 = 'Meister-Duellist', --#--#--
    AD_DUELS = 'Gewinnt in %d Duellen.', --#--#--
    AC_DUELS = 'Gewinnt in %d Duellen', --#--#--
    AN_GURUBASHI_1 = 'Maître de l\'arène des Gurubashi',
    AD_GURUBASHI_1 = 'Obtenir le bijou Maître de l\'arène dans l\'arène des Gurubashi.',
    AN_GURUBASHI_2 = 'Grand maître de l\'arène des Gurubashi',
    AD_GURUBASHI_2 = 'Achever la quête de Court John Mithril pour obtenir le bijou Grand maître de l\'arène.',
    AN_PARTICIPATE_IN_BGS = 'Appel aux armes !',
    AD_PARTICIPATE_IN_BGS = 'Schließt %d Schlachtfelder ab.', --#--#--
    AC_PARTICIPATE_IN_BGS = 'Schließt %d Schlachtfelder ab.', --#--#--

    EMOTE_LOVE1 = 'Ihr liebt %s.', --#--#--
    AN_LOVE = 'À tous les écureuils que j\'ai aimés, avant',
    AD_LOVE = 'Montrer tout votre /amour aux bestioles d\'Azeroth.',
    AN_LOVE_TBC = 'De près ou de loin, je les aime tous',
    AD_LOVE_TBC = 'Montrez aux bestioles au-delà de la Porte des ténèbres combien vous les aimez (/amour).',
    NPC_22480 = 'Marmotte brune',
    NPC_22306 = 'Rampante des cavernes grouillante',
    NPC_22842 = 'Corvax',
    NPC_22843 = 'Freux',
    NPC_19665 = 'Brebis',
    NPC_19154 = 'Suie',
    NPC_19482 = 'Sagan',
    NPC_20411 = 'Bovidé spectral',
    EMOTE_PAT1 = 'Ihr streichelt %s.', --#--#--
    AN_ARATHI_CATS = 'Katzen sind am wichtigsten', --#--#--
    AD_ARATHI_CATS = 'Streichelt die angegebenen Haustiere im Arathibecken (/streicheln).', --#--#--

    AN_ALTERAC_FAST_WIN = 'L\'Alterac express',
    AD_ALTERAC_FAST_WIN = 'Gagner dans la vallée d\'Alterac en 6 minutes.',
    AN_WARSONG_FAST_WIN = 'Goulet expédié',
    AD_WARSONG_FAST_WIN = 'Gagner une bataille pour le goulet des Chanteguerres en moins de 7 minutes.',
    AN_ARATHI_FAST_WIN = 'Une formalité à régler',
    AD_ARATHI_FAST_WIN = 'Gagner dans le bassin Arathi en 6 minutes.',

    AN_ALTERAC_TOWER_DEFEND_TOTAL = 'Défense des tours',
    AD_ALTERAC_TOWER_DEFEND_TOTAL = 'Défendre %dtours dans la vallée d\'Alterac.',
    AN_ALTERAC_GRAVEYARD_ASSAULT_TOTAL = 'Pilleur de tombes d\'Alterac',
    AD_ALTERAC_GRAVEYARD_ASSAULT_TOTAL = 'Prendre %dcimetières dans la vallée d\'Alterac.',
    AN_WARSONG_FLAG_CAPTURE_TOTAL = 'Capture du drapeau',
    AD_WARSONG_FLAG_CAPTURE_TOTAL = 'Ergreift und erobert persönlich %d Flaggen in der Kriegshymnenschlucht.', --#--#--
    AN_WARSONG_FLAG_RETURN_TOTAL = 'Défenseur obstiné',
    AD_WARSONG_FLAG_RETURN_TOTAL = 'Ramener %ddrapeaux en défense dans le goulet des Chanteguerres.',
    AN_ARATHI_BASE_ASSAULT_TOTAL = 'Cap ou pas cap ?',
    AD_ARATHI_BASE_ASSAULT_TOTAL = 'Capturer %ddrapeaux au bassin Arathi.',
    AN_ARATHI_BASE_DEFEND_TOTAL = 'À la rescousse !',
    AD_ARATHI_BASE_DEFEND_TOTAL = 'Venir %dfois à la rescousse d\'une base du bassin Arathi en récupérant le drapeau.',
    AN_ALTERAC_MOUNT_HORDE = 'Hurleur loup-de-givre',
    AD_ALTERAC_MOUNT_HORDE = 'Obtenir un hurleur loup-de-givre.',
    AN_ALTERAC_MOUNT_ALLIANCE = 'Destrier de bataille foudrepique',
    AD_ALTERAC_MOUNT_ALLIANCE = 'Obtenir un destrier de bataille foudrepique.',

    AN_ALTERAC_BOSS = 'Maîtrise de la vallée d\'Alterac',
    AD_ALTERAC_BOSS = 'Accomplir les hauts faits de la vallée d\'Alterac listés ci-dessous.',
    AN_WARSONG_BOSS = 'Maîtrise du goulet des Chanteguerres',
    AD_WARSONG_BOSS = 'Achever les hauts faits du goulet des Chanteguerres listés ci-dessous.',
    AN_ARATHI_BOSS = 'Maîtrise du bassin Arathi',
    AD_ARATHI_BOSS = 'Accomplir les hauts faits du bassin Arathi listés ci-dessous.',
    AN_EYE_BOSS = 'Maîtrise de l\'Œil du cyclone',
    AD_EYE_BOSS = 'Accomplir les hauts faits de l\'Œil du cyclone listés ci-dessous.',
    AN_BATTLEMASTER = 'Maître de guerre',
    AD_BATTLEMASTER = 'Accomplir les hauts faits de champ de bataille listés ci-dessous.',
    AR_BATTLEMASTER = 'Titre : maître de guerre',

    AN_LEEROY = 'Leeeeeeeeeeeeeroy !',
    AD_LEEROY = 'Tuer 50 dragonnets de la colonie en 15 secondes.',
    AR_LEEROY = 'Titre : Jenkins',
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
	
	AN_PIRATES_HAT = 'En avant toutes, Amiral !',
	AD_PIRATES_HAT = 'Obtenir le bicorne d\'amiral de la Voile sanglante… et essayer de prendre l\'air de temps en temps.',
	AR_PIRATES_HAT = 'Titre : amiral de la Voile sanglante',
	AN_PALADIN_MOUNT = 'Destrier',
	AD_PALADIN_MOUNT = 'Avoir achevé la quête de paladin pour obtenir un destrier.',
	AN_WARLOCK_MOUNT = 'Destrier de l\'effroi de Xoroth',
	AD_WARLOCK_MOUNT = 'Avoir achevé la quête de démoniste « Le destrier de l\'effroi de Xoroth ».',
	
	AN_HALLOWSEND = 'Que ton nom soit sanssainctifié',
	AD_HALLOWSEND = 'Accomplir les hauts faits de la Sanssaint listés ci-dessous.',
	AR_HALLOWSEND = 'Titre : le Sanssaint',
	
	AN_PUMPKIN = 'Ziemlich gruselig', --#--#--
	AD_PUMPKIN = 'Erhaltet eine Kürbistasche während der Schlotternächte.', --#--#--
	AN_HALLOWSEND_ALLIANCE_QUEST1 = 'Sanssaint ruinée',
	AD_HALLOWSEND_ALLIANCE_QUEST1 = 'Ruiner la Sanssaint de la Horde en achevant les quêtes du sergent Hartman, qui incluent la perturbation de la Fête de l\'homme d\'osier et le nettoyage des boules puantes à Austrivage.',
	AC_HALLOWSEND_ALLIANCE_QUEST1_CRITERIA1 = 'Un intrus à la Fête de l’homme d’osier',
	AC_HALLOWSEND_ALLIANCE_QUEST1_CRITERIA2 = 'La puissance du pin',
	AN_HALLOWSEND_HORDE_QUEST1 = 'Sanssaint ruinée',
	AD_HALLOWSEND_HORDE_QUEST1 = 'Ruiner la Sanssaint de l\'Alliance en achevant les quêtes de la sombre imploratrice Yanka, qui incluent la dégradation des tonneaux avec des œufs pourris et le largage de boules puantes en ville.',
	AC_HALLOWSEND_HORDE_QUEST1_CRITERIA1 = 'Œufs pourris et tonneaux gâtés',
	AC_HALLOWSEND_HORDE_QUEST1_CRITERIA2 = 'Empuantir Austrivage',
	
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
	
	AN_HALLOWSEND_TREATS = 'Un bonbon ou une blague !',
	AD_HALLOWSEND_TREATS = 'Piocher une poignée de bonbons dans l\'un des seaux de bonbons se trouvant dans les auberges.',
	
	AN_HALLOWSEND_MASK = 'Le masque au rade',
	AD_HALLOWSEND_MASK = 'Obtenir un masque fragile pendant la Sanssaint.',
	
	AN_HALLOWSEND_MASKS = 'Un masque en toutes occasions',
	AD_HALLOWSEND_MASKS = 'Collecter les 20 différents masques fragiles listés ci-dessous.',
	
	AN_HALLOWSEND_TRANSFORM = 'La grande mascarade',
	AD_HALLOWSEND_TRANSFORM = 'Être transformé sous tous les costumes listés ci-dessous.',
	AC_HALLOWSEND_GHOST = 'Transformé en fantôme',
	AC_HALLOWSEND_GNOME = 'Transformé en Gnome lépreux',
	AC_HALLOWSEND_WISP = 'Transformé en feu follet',
	AC_HALLOWSEND_NINJA = 'Transformé en ninja',
	AC_HALLOWSEND_SKELETON = 'Transformé en squelette',
	AC_HALLOWSEND_PIRATE = 'Transformé en pirate',
	AC_HALLOWSEND_BAT = 'Transformé en chauve-souris',

    --WINTERVEIL
    AN_WINTERVEIL = 'Joyeuses fêtes !',
	AD_WINTERVEIL = 'Accomplir les hauts faits du Voile d\'hiver listés ci-dessous.',
	AR_WINTERVEIL = 'Titre : le joyeux',

    AN_WINTERVEIL_METZEN = 'Allez Metzen !',
	AD_WINTERVEIL_METZEN = 'Sauver Metzen le renne',

    AN_WINTERVEIL_SMOKEYWOOD = 'A-BO-MI-NA-BLE !',
	AD_WINTERVEIL_SMOKEYWOOD = 'Achever la quête de récupération des friandises volées des Gourmandises Fumebois et recevoir un grand merci des Gourmandises Fumebois.',

    AN_WINTERVEIL_GOURMET = 'Gourmet du Voile d\'hiver',
	AD_WINTERVEIL_GOURMET = 'Pendant la fête du Voile d\'hiver, utiliser vos compétences culinaires pour préparer un biscuit en pain d\'épice, du lait de poule et du cidre chaud.',
    AC_WINTERVEIL_GOURMET_CRITERIA1 = 'Biscuit en pain d’épice',
    AC_WINTERVEIL_GOURMET_CRITERIA2 = 'Lait de poule',

    AN_WINTERVEIL_PRESENTS = 'Avez-vous été sage, cette année ?',
	AD_WINTERVEIL_PRESENTS = 'Ouvrir l\'un des cadeaux sous l\'arbre du Voile d\'hiver lorsqu\'ils sont disponibles.',

    AN_WINTERVEIL_SNOWBALL_ALLIANCE = 'Blague de Noël',
	AD_WINTERVEIL_SNOWBALL_ALLIANCE = 'Lancer une boule de neige sur le roi Magni Barbe-de-bronze pendant la fête du Voile d\'hiver.',

    AN_WINTERVEIL_SNOWBALL_HORDE = 'Blague de Noël',
	AD_WINTERVEIL_SNOWBALL_HORDE = 'Lancer une boule de neige sur Cairne Sabot-de-sang pendant la fête du Voile d\'hiver.',

    AN_WINTERVEIL_PVP = 'Petits assistants entre amis',
    AD_WINTERVEIL_PVP = 'Obtenir 50 victoires honorables en étant déguisé en petit assistant grâce au Fabulovolt PX-238 Hiver.',

    --VALENTINES
    AN_VALENTINES = 'Liebestoll', --#--#--
	AD_VALENTINES = 'Schließt die unten aufgelisteten Erfolge von \'Liebe liegt in der Luft\' ab.', --#--#--

    AN_VALENTINES_ROSES = 'Sag\'s mit Rosen', --#--#--
    AD_VALENTINES_ROSES = 'Erhaltet während der \'Liebe liegt in der Luft\'-Feierlichkeiten einen roten Rosenstrauß.', --#--#--

    AN_VALENTINES_QUEST = 'Gefährliche Liebschaft', --#--#--
    AD_VALENTINES_QUEST = 'Helft dem Dampfdruckkartell dabei, den Plan der Chemiemanufaktur Krone zu vereiteln.', --#--#--

    AN_VALENTINES_CHOCOLATES = 'Naschkatze', --#--#--
    AD_VALENTINES_CHOCOLATES = 'Probiert die unten aufgelisteten \'Liebe liegt in der Luft\'-Süßigkeiten.', --#--#--
    AC_VALENTINES_CHOCOLATES_CRITERIA1 = 'Désir noir',
    AC_VALENTINES_CHOCOLATES_CRITERIA2 = 'Délice au lait',
    AC_VALENTINES_CHOCOLATES_CRITERIA3 = 'Douce surprise',
    AC_VALENTINES_CHOCOLATES_CRITERIA4 = 'Fondant aux myrtilles',

    AN_VALENTINES_DRESS = 'Das reizende Glück ist auf Eurer Seite', --#--#--
    AD_VALENTINES_DRESS = 'Öffnet einen reizenden Kleiderkarton und erhaltet ein reizendes schwarzes Kleid.', --#--#--

    AN_VALENTINES_PIDO = 'Perma-Pido', --#--#--
    AD_VALENTINES_PIDO = 'Erhaltet ein permanentes Q. Pido-Haustier, indem Ihr einen Echtsilberschaftpfeil erbeutet.', --#--#--

    --LUNAR
    AN_LUNAR = 'Honorer ses Anciens',
	AD_LUNAR = 'Accomplir les hauts faits de la fête lunaire listés ci-dessous.',

    AN_LUNAR_COIN = 'Une pièce des ancêtres',
    AD_LUNAR_COIN = 'Recevoir une pièce des ancêtres.',

    AN_LUNAR_COINS = '%dpièces des ancêtres',
    AD_LUNAR_COINS = 'Recevoir %dpièces des ancêtres.',

    AN_LUNAR_QUEST = 'La bénédiction d\'Elune',
    AD_LUNAR_QUEST = 'Achever la quête « La bénédiction d\'Elune » en venant à bout de Présage.',

    AN_LUNAR_CLOTHES = 'Parure de la fête lunaire',
    AD_LUNAR_CLOTHES = 'Acheter un habit de fête ou une robe de fête avec les pièces des ancêtres.',

    AN_LUNAR_ELDERS_DUNGEONS = 'Les Anciens des donjons',
    AD_LUNAR_ELDERS_DUNGEONS = 'Honorer les Anciens situés dans les donjons.',
    AC_LUNAR_ELDERS_DUNGEONS_8727 = 'Urahne Fernwisper', --#--#--
    AC_LUNAR_ELDERS_DUNGEONS_8619 = 'Urahne Schwermut', --#--#--
    AC_LUNAR_ELDERS_DUNGEONS_8635 = 'Urahne Splitterfels', --#--#--
    AC_LUNAR_ELDERS_DUNGEONS_8713 = 'Urahne Sternensang', --#--#--
    AC_LUNAR_ELDERS_DUNGEONS_8644 = 'Urahne Steinwehr', --#--#--
    AC_LUNAR_ELDERS_DUNGEONS_8676 = 'Urahne Wildmähne', --#--#--

    AN_LUNAR_ELDERS_HORDE = 'Les Anciens de la Horde',
    AD_LUNAR_ELDERS_HORDE = 'Honorer les anciens situés dans les capitales de la Horde.',
    AC_LUNAR_ELDERS_HORDE_8678 = 'Ancien Sabot-de-Blé aux Pitons du Tonnerre',
    AC_LUNAR_ELDERS_HORDE_8648 = 'Ancien Sombre-noyau à Fossoyeuse',
    AC_LUNAR_ELDERS_HORDE_8677 = 'Ancienne Sombre-corne à Orgrimmar',

    AN_LUNAR_ELDERS_ALLIANCE = 'Les Anciens de l\'Alliance',
    AD_LUNAR_ELDERS_ALLIANCE = 'Honorer les anciens situés dans les capitales de l\'Alliance.',
    AC_LUNAR_ELDERS_ALLIANCE_8718 = 'Ancien Lamevive à Darnassus',
    AC_LUNAR_ELDERS_ALLIANCE_8866 = 'Ancien Barbe-de-Bronze à Forgefer',
    AC_LUNAR_ELDERS_ALLIANCE_8646 = 'Ancien Cri-du-marteau à Hurlevent',

    AN_LUNAR_ELDERS_EASTERN_KINGDOMS = 'Les Anciens des Royaumes de l\'est',
    AD_LUNAR_ELDERS_EASTERN_KINGDOMS = 'Honorer les Anciens situés dans les Royaumes de l\'est.',
    AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8636 = 'Ancien Pierre-grondante dans les steppes Ardentes',
    AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8651 = 'Ancien Baguefer dans la gorge des Vents brûlants',
    AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8652 = 'Ancien Né-au-Tombeau à Brill',
    AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8674 = 'Ancien Sabot-d’Hiver à Baie-du-Butin',
    AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8716 = 'Ancien Reflet-d’étoile à Zul’Gurub',
    AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8643 = 'Ancien Haut-pic dans les Hinterlands',
    AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8675 = 'Ancienne Chasse-le-Ciel sur la colline des Sentinelles',
    AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8649 = 'Ancien Front-de-tempête à Comté-de-l’or',
    AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8650 = 'Ancien Couronne-de-neige à la chapelle de l’Espoir de Lumière',
    AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8642 = 'Ancien Veine-argent à Thelsamar',
    AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8645 = 'Ancien Obsidien au Sépulcre',
    AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8722 = 'Ancienne Courresteppe dans les Maleterres de l’ouest',
    AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8647 = 'Ancien Soufflet-de-rage dans les terres Foudroyées',
    AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8653 = 'Ancien Puits-doré à Kharanos',
    AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8714 = 'Ancienne Heurtelune dans la Scholomance',
    AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8688 = 'Ancien Tracevent dans les Maleterres de l’est',
    AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8683 = 'Ancienne Aube-glorieuse sur la corniche des Flammes',

    AN_LUNAR_ELDERS_KALIMDOR = 'Les Anciens de Kalimdor',
    AD_LUNAR_ELDERS_KALIMDOR = 'Honorer les Anciens situés en Kalimdor.',
    AC_LUNAR_ELDERS_KALIMDOR_8673 = 'Ancien Sabot-de-Sang à Sabot-de-Sang',
    AC_LUNAR_ELDERS_KALIMDOR_8723 = 'Ancien Ventenuit à Gangrebois',
    AC_LUNAR_ELDERS_KALIMDOR_8684 = 'Ancien Œil-des-rêves à Gadgetzan',
    AC_LUNAR_ELDERS_KALIMDOR_8726 = 'Ancienne Brillelance au Berceau-de-l’Hiver',
    AC_LUNAR_ELDERS_KALIMDOR_8725 = 'Ancienne Chantelonde à Astranaar',
    AC_LUNAR_ELDERS_KALIMDOR_8715 = 'Ancien Feuillelame à Dolanaar',
    AC_LUNAR_ELDERS_KALIMDOR_8681 = 'Ancien Corne-Tonnerre dans le cratère d’Un’Goro',
    AC_LUNAR_ELDERS_KALIMDOR_8680 = 'Ancienne Totem-de-Vent à Cabestan',
    AC_LUNAR_ELDERS_KALIMDOR_8720 = 'Ancien Luireciel en Azshara',
    AC_LUNAR_ELDERS_KALIMDOR_8670 = 'Ancienne Totem-Runique à Tranchecolline',
    AC_LUNAR_ELDERS_KALIMDOR_8672 = 'Ancien Cime-de-Pierre à Long-Guet',
    AC_LUNAR_ELDERS_KALIMDOR_8686 = 'Ancien Haute-Montagne au camp Taurajo',
    AC_LUNAR_ELDERS_KALIMDOR_8654 = 'Ancien Prime-Pierre en Silithus',
    AC_LUNAR_ELDERS_KALIMDOR_8671 = 'Ancienne Totem-de-Rage dans Tanaris',
    AC_LUNAR_ELDERS_KALIMDOR_8724 = 'Ancienne Rosée-du-matin à la Piste des mirages',
    AC_LUNAR_ELDERS_KALIMDOR_8685 = 'Ancienne Marche-Brume dans Hache-Tripes',
    AC_LUNAR_ELDERS_KALIMDOR_8721 = 'Ancienne Tissétoile à Auberdine',
    AC_LUNAR_ELDERS_KALIMDOR_8717 = 'Ancien Gardelune à la Croisée',
    AC_LUNAR_ELDERS_KALIMDOR_8719 = 'Ancienne Lamechant au fort Cénarien',
    AC_LUNAR_ELDERS_KALIMDOR_8682 = 'Ancien Œil-des-Cieux au poste de Librevent',
    AC_LUNAR_ELDERS_KALIMDOR_8679 = 'Ancien Totem-Sinistre en Féralas',

    --NOBLEGARDEN
    AN_NOBLEGARDEN_CLOTHES = 'Habits du dimanche',
    AD_NOBLEGARDEN_CLOTHES = 'Découvrir la chemise blanche de smoking et le pantalon de smoking noir en ouvrant des œufs vivement colorés pendant la fête du Jardin des nobles.',
    AC_NOBLEGARDEN_CLOTHES_CRITERIA1 = 'Chemise blanche de smoking',
    AC_NOBLEGARDEN_CLOTHES_CRITERIA2 = 'Pantalon de smoking noir',

    AN_NOBLEGARDEN_DRESS = 'Tenue de soirée',
    AD_NOBLEGARDEN_DRESS = 'Découvrir une robe de soirée en ouvrant des œufs vivement colorés pendant la fête du Jardin des nobles.',

    --CHILDRENS WEEK
    AN_CHILDREN = 'Les enfants d\'abord',
    AD_CHILDREN = 'Accomplir les hauts faits de la semaine des enfants listés ci-dessous.',
    AR_CHILDREN = 'Titre : parrain',

    AN_CHILDREN_PET = 'Ouh, qu\'il est mignon !',
    AD_CHILDREN_PET = 'Obtenir l\'un des familiers en récompense de la semaine des enfants.',

    AN_CHILDREN_PETS = 'Nounou chevronnée',
    AD_CHILDREN_PETS = 'Obtenir l\'Œuf d\'Egbert, Willy l\'Endormi et le Collier de dressage d\'elekk sur un même personnage.',
    AC_CHILDREN_PETS1 = 'Collier de dressage d’elekk',
    AC_CHILDREN_PETS2 = 'Willy l’Endormi',
    AC_CHILDREN_PETS3 = 'Œuf d’Egbert',

    --MIDSUMMER
    AN_MIDSUMMER = 'Le garde-flammes',
    AD_MIDSUMMER = 'Accomplir les hauts faits du Solstice listés ci-dessous.',

    AN_MIDSUMMER_QUEST1 = 'Le roi de la fête du Feu',
    AD_MIDSUMMER_QUEST1 = 'Achever la quête « La récompense d\'un voleur » en volant les flammes des capitales ennemies.',

    AN_MIDSUMMER_AHUNE = 'Tel est glacé qui croyait geler',
    AD_MIDSUMMER_AHUNE = 'Tuer Ahune dans les enclos aux esclaves.',

    AN_MIDSUMMER_DESECRATION_HORDE = 'Profanation de l\'Alliance',
    AD_MIDSUMMER_DESECRATION_HORDE = 'Accomplir les hauts faits Extinction des royaumes de l\'Est, de Kalimdor et d\'Outreterre.',

    AN_MIDSUMMER_DESECRATION_HORDE_KALIMDOR = 'Extinction de Kalimdor',
    AD_MIDSUMMER_DESECRATION_HORDE_KALIMDOR = 'Piétiner les feux de joie de l\'Alliance en Kalimdor.',
    AC_MIDSUMMER_DESECRATION_HORDE_KALIMDOR_CRITERIA_11744 = 'Marécage d’Âprefange',
    AC_MIDSUMMER_DESECRATION_HORDE_KALIMDOR_CRITERIA_11734 = 'Orneval',
    AC_MIDSUMMER_DESECRATION_HORDE_KALIMDOR_CRITERIA_11738 = 'Île de Brume-Sang',
    AC_MIDSUMMER_DESECRATION_HORDE_KALIMDOR_CRITERIA_11740 = 'Sombrivage',
    AC_MIDSUMMER_DESECRATION_HORDE_KALIMDOR_CRITERIA_11746 = 'Féralas',
    AC_MIDSUMMER_DESECRATION_HORDE_KALIMDOR_CRITERIA_11760 = 'Silithus',
    AC_MIDSUMMER_DESECRATION_HORDE_KALIMDOR_CRITERIA_11753 = 'Teldrassil',
    AC_MIDSUMMER_DESECRATION_HORDE_KALIMDOR_CRITERIA_11762 = 'Tanaris',
    AC_MIDSUMMER_DESECRATION_HORDE_KALIMDOR_CRITERIA_11741 = 'Désolace',
    AC_MIDSUMMER_DESECRATION_HORDE_KALIMDOR_CRITERIA_11763 = 'Berceau-de-l’Hiver',
    AC_MIDSUMMER_DESECRATION_HORDE_KALIMDOR_CRITERIA_11735 = 'Île de Brume-Azur',

    AN_MIDSUMMER_DESECRATION_HORDE_OUTLAND = 'Extinction de l\'Outreterre',
    AD_MIDSUMMER_DESECRATION_HORDE_OUTLAND = 'Piétiner les feux de joie de l\'Alliance en Outreterre.',
    AC_MIDSUMMER_DESECRATION_HORDE_OUTLAND_CRITERIA_11736 = 'Les Tranchantes',
    AC_MIDSUMMER_DESECRATION_HORDE_OUTLAND_CRITERIA_11750 = 'Nagrand',
    AC_MIDSUMMER_DESECRATION_HORDE_OUTLAND_CRITERIA_11759 = 'Raz-de-Néant',
    AC_MIDSUMMER_DESECRATION_HORDE_OUTLAND_CRITERIA_11752 = 'Vallée d’Ombrelune',
    AC_MIDSUMMER_DESECRATION_HORDE_OUTLAND_CRITERIA_11754 = 'Forêt de Terokkar',
    AC_MIDSUMMER_DESECRATION_HORDE_OUTLAND_CRITERIA_11758 = 'Marécage de Zangar',
    AC_MIDSUMMER_DESECRATION_HORDE_OUTLAND_CRITERIA_11747 = 'Péninsule des Flammes infernales',

    AN_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS = 'Extinction des royaumes de l’Est',
    AD_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS = 'Piétiner les feux de joie de l\'Alliance dans les Royaumes de l\'est.',
    AC_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS_CRITERIA_11751 = 'Les Carmines',
    AC_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS_CRITERIA_11742 = 'Dun Morogh',
    AC_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS_CRITERIA_11745 = 'Forêt d’Elwynn',
    AC_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS_CRITERIA_11749 = 'Loch Modan',
    AC_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS_CRITERIA_11732 = 'Hautes-terres Arathies',
    AC_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS_CRITERIA_11739 = 'Steppes Ardentes',
    AC_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS_CRITERIA_11761 = 'Vallée de Strangleronce',
    AC_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS_CRITERIA_11755 = 'Les Hinterlands',
    AC_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS_CRITERIA_11756 = 'Maleterres de l\'ouest',
    AC_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS_CRITERIA_11581 = 'Marche de l’Ouest',
    AC_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS_CRITERIA_11748 = 'Contreforts de Hautebrande',
    AC_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS_CRITERIA_11737 = 'Terres Foudroyées',
    AC_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS_CRITERIA_11743 = 'Bois de la Pénombre',
    AC_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS_CRITERIA_11757 = 'Les Paluns',

    AN_MIDSUMMER_DESECRATION_ALLIANCE = 'Profanation de la Horde',
    AD_MIDSUMMER_DESECRATION_ALLIANCE = 'Accomplir les hauts faits Extinction des royaumes de l\'Est, de Kalimdor et d\'Outreterre.',

    AN_MIDSUMMER_DESECRATION_ALLIANCE_KALIMDOR = 'Extinction de Kalimdor',
    AD_MIDSUMMER_DESECRATION_ALLIANCE_KALIMDOR = 'Piétiner les feux de joie de la Horde en Kalimdor.',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_KALIMDOR_CRITERIA_11803 = 'Berceau-de-l’Hiver',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_KALIMDOR_CRITERIA_11785 = 'Mille pointes',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_KALIMDOR_CRITERIA_11765 = 'Orneval',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_KALIMDOR_CRITERIA_11769 = 'Désolace',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_KALIMDOR_CRITERIA_11773 = 'Féralas',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_KALIMDOR_CRITERIA_11777 = 'Mulgore',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_KALIMDOR_CRITERIA_11800 = 'Silithus',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_KALIMDOR_CRITERIA_11780 = 'Les Serres-Rocheuses',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_KALIMDOR_CRITERIA_11802 = 'Tanaris',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_KALIMDOR_CRITERIA_11783 = 'Les Tarides',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_KALIMDOR_CRITERIA_11770 = 'Durotar',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_KALIMDOR_CRITERIA_11771 = 'Marécage d’Âprefange',

    AN_MIDSUMMER_DESECRATION_ALLIANCE_OUTLAND = 'Extinction de l\'Outreterre',
    AD_MIDSUMMER_DESECRATION_ALLIANCE_OUTLAND = 'Piétiner les feux de joie de la Horde en Outreterre.',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_OUTLAND_CRITERIA_11767 = 'Les Tranchantes',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_OUTLAND_CRITERIA_11799 = 'Raz-de-Néant',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_OUTLAND_CRITERIA_11782 = 'Forêt de Terokkar',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_OUTLAND_CRITERIA_11775 = 'Péninsule des Flammes infernales',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_OUTLAND_CRITERIA_11787 = 'Marécage de Zangar',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_OUTLAND_CRITERIA_11778 = 'Nagrand',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_OUTLAND_CRITERIA_11779 = 'Vallée d’Ombrelune',

    AN_MIDSUMMER_DESECRATION_ALLIANCE_EASTERN_KINGDOMS = 'Extinction des royaumes de l’Est',
    AD_MIDSUMMER_DESECRATION_ALLIANCE_EASTERN_KINGDOMS = 'Piétiner les feux de joie de la Horde dans les Royaumes de l\'est.',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11766 = 'Terres Ingrates',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11772 = 'Bois des Chants éternels',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11774 = 'Les terres Fantômes',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11776 = 'Contreforts de Hautebrande',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11768 = 'Steppes Ardentes',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11781 = 'Marais des Chagrins',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11764 = 'Hautes-terres Arathies',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11580 = 'Forêt des Pins argentés',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11801 = 'Vallée de Strangleronce',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11784 = 'Les Hinterlands',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11786 = 'Clairières de Tirisfal',

    AN_MIDSUMMER_FLAME_KEEPER_HORDE = 'Les feux d\'Azeroth',
    AD_MIDSUMMER_FLAME_KEEPER_HORDE = 'Accomplir les hauts faits Gardien de la flamme des Royaumes de l\'est, de Kalimdor et d\'Outreterre.',

    AN_MIDSUMMER_FLAME_KEEPER_HORDE_KALIMDOR = 'Garde-flammes de Kalimdor',
    AD_MIDSUMMER_FLAME_KEEPER_HORDE_KALIMDOR = 'Honorer les flammes de Kalimdor.',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_KALIMDOR_CRITERIA_11841 = 'Orneval',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_KALIMDOR_CRITERIA_11845 = 'Désolace',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_KALIMDOR_CRITERIA_11846 = 'Durotar',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_KALIMDOR_CRITERIA_11847 = 'Marécage d’Âprefange',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_KALIMDOR_CRITERIA_11849 = 'Féralas',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_KALIMDOR_CRITERIA_11852 = 'Mulgore',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_KALIMDOR_CRITERIA_11859 = 'Les Tarides',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_KALIMDOR_CRITERIA_11839 = 'Berceau-de-l’Hiver',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_KALIMDOR_CRITERIA_11836 = 'Silithus',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_KALIMDOR_CRITERIA_11856 = 'Les Serres-Rocheuses',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_KALIMDOR_CRITERIA_11861 = 'Mille pointes',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_KALIMDOR_CRITERIA_11838 = 'Tanaris',

    AN_MIDSUMMER_FLAME_KEEPER_HORDE_OUTLAND = 'Garde-flammes d\'Outreterre',
    AD_MIDSUMMER_FLAME_KEEPER_HORDE_OUTLAND = 'Honorer les flammes d\'Outreterre.',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_OUTLAND_CRITERIA_11851 = 'Péninsule des Flammes infernales',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_OUTLAND_CRITERIA_11835 = 'Raz-de-Néant',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_OUTLAND_CRITERIA_11855 = 'Vallée d’Ombrelune',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_OUTLAND_CRITERIA_11858 = 'Forêt de Terokkar',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_OUTLAND_CRITERIA_11854 = 'Nagrand',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_OUTLAND_CRITERIA_11863 = 'Marécage de Zangar',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_OUTLAND_CRITERIA_11843 = 'Les Tranchantes',

    AN_MIDSUMMER_FLAME_KEEPER_HORDE_EASTERN_KINGDOMS = 'Garde-flammes des Royaumes de l\'est',
    AD_MIDSUMMER_FLAME_KEEPER_HORDE_EASTERN_KINGDOMS = 'Honorer les flammes des Royaumes de l\'est.',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_EASTERN_KINGDOMS_CRITERIA_11844 = 'Steppes Ardentes',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_EASTERN_KINGDOMS_CRITERIA_11840 = 'Hautes-terres Arathies',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_EASTERN_KINGDOMS_CRITERIA_11584 = 'Forêt des Pins argentés',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_EASTERN_KINGDOMS_CRITERIA_11837 = 'Vallée de Strangleronce',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_EASTERN_KINGDOMS_CRITERIA_11860 = 'Les Hinterlands',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_EASTERN_KINGDOMS_CRITERIA_11850 = 'Les terres Fantômes',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_EASTERN_KINGDOMS_CRITERIA_11862 = 'Clairières de Tirisfal',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_EASTERN_KINGDOMS_CRITERIA_11853 = 'Contreforts de Hautebrande',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_EASTERN_KINGDOMS_CRITERIA_11848 = 'Bois des Chants éternels',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_EASTERN_KINGDOMS_CRITERIA_11857 = 'Marais des Chagrins',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_EASTERN_KINGDOMS_CRITERIA_11842 = 'Terres Ingrates',

    AN_MIDSUMMER_FLAME_KEEPER_ALLIANCE = 'Les feux d\'Azeroth',
    AD_MIDSUMMER_FLAME_KEEPER_ALLIANCE = 'Accomplir les hauts faits Responsable de la flamme des Royaumes de l\'est, de Kalimdor et d\'Outreterre.',

    AN_MIDSUMMER_FLAME_KEEPER_ALLIANCE_KALIMDOR = 'Gardien des flammes de Kalimdor',
    AD_MIDSUMMER_FLAME_KEEPER_ALLIANCE_KALIMDOR = 'Honorer les flammes de Kalimdor.',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_KALIMDOR_CRITERIA_11833 = 'Tanaris',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_KALIMDOR_CRITERIA_11805 = 'Orneval',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_KALIMDOR_CRITERIA_11809 = 'Île de Brume-Sang',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_KALIMDOR_CRITERIA_11812 = 'Désolace',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_KALIMDOR_CRITERIA_11817 = 'Féralas',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_KALIMDOR_CRITERIA_11824 = 'Teldrassil',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_KALIMDOR_CRITERIA_11806 = 'Île de Brume-Azur',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_KALIMDOR_CRITERIA_11834 = 'Berceau-de-l’Hiver',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_KALIMDOR_CRITERIA_11831 = 'Silithus',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_KALIMDOR_CRITERIA_11815 = 'Marécage d’Âprefange',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_KALIMDOR_CRITERIA_11811 = 'Sombrivage',

    AN_MIDSUMMER_FLAME_KEEPER_ALLIANCE_OUTLAND = 'Gardien des flammes d\'Outreterre',
    AD_MIDSUMMER_FLAME_KEEPER_ALLIANCE_OUTLAND = 'Honorer les flammes d\'Outreterre.',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_OUTLAND_CRITERIA_11807 = 'Les Tranchantes',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_OUTLAND_CRITERIA_11830 = 'Raz-de-Néant',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_OUTLAND_CRITERIA_11823 = 'Vallée d’Ombrelune',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_OUTLAND_CRITERIA_11829 = 'Marécage de Zangar',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_OUTLAND_CRITERIA_11818 = 'Péninsule des Flammes infernales',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_OUTLAND_CRITERIA_11821 = 'Nagrand',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_OUTLAND_CRITERIA_11825 = 'Forêt de Terokkar',

    AN_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS = 'Gardien des flammes des Royaumes de l\'est',
    AD_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS = 'Honorer les flammes des Royaumes de l\'est.',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11816 = 'Forêt d’Elwynn',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11810 = 'Steppes Ardentes',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11813 = 'Dun Morogh',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11822 = 'Les Carmines',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11832 = 'Vallée de Strangleronce',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11826 = 'Les Hinterlands',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11583 = 'Marche de l’Ouest',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11827 = 'Maleterres de l\'ouest',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11808 = 'Terres Foudroyées',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11819 = 'Contreforts de Hautebrande',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11814 = 'Bois de la Pénombre',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11820 = 'Loch Modan',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11804 = 'Hautes-terres Arathies',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11828 = 'Les Paluns',

    --BREWFEST
    AN_BREWFEST = 'Maître brasseur',
    AD_BREWFEST = 'Accomplir les hauts faits de la fête des Brasseurs listés ci-dessous.',
    AR_BREWFEST = 'Titre : maître brasseur',

    AN_BREWFEST_WOLPERTINGER = 'Puisque je vous dis que je l\'ai vu !',
    AD_BREWFEST_WOLPERTINGER = 'Obtenir un wolpertinger.',

    AN_BREWFEST_COREN_DIREBREW = 'Faites la fête au brasseur',
    AD_BREWFEST_COREN_DIREBREW = 'Tuer Coren Navrebière.',

    AN_BREWFEST_QUEST1 = 'À bas les Sombrefers !',
    AD_BREWFEST_QUEST1 = 'Défendre le camp de la fête des Brasseurs contre l\'attaque des Sombrefers et achever la quête « Et une fois, quand j\'étais ivre… ».',

    AN_BREWFEST_BEER_CLUB = 'La bière du mois',
    AD_BREWFEST_BEER_CLUB = 'S\'abonner au club de la bière du mois',

    AN_BREWFEST_MOUNT = 'Qui veut s\'abreuver loin aménage sa monture',
    AD_BREWFEST_MOUNT = 'Obtenir une monture de la fête des Brasseurs ou transformer la vôtre à l\'aide de houblon de la fête des Brasseurs.',

    --LONG TRIP
    AC_WORLDEVENTS_TRIP = 'Voyages au bout du monde',
    AD_WORLDEVENTS_TRIP = 'Accomplir les hauts faits des évènements mondiaux listés ci-dessous.',

	--BURNING CRUSADE
    AN_DOLCE = 'Ma réserve est gigantesque !',
    AD_DOLCE = 'Équiper le Sac "gigantesque" de Haris Pilton.',

    AN_QUESTS_HELLFIRE_PENINSULA = 'Les Flammes infernales des hommes',
    AD_QUESTS_HELLFIRE_PENINSULA = 'Achever 80 quêtes dans la péninsule des Flammes infernales.',
    TBC_QUEST_10388 = 'Haltet die Brennende Legion auf', --#--#--
    TBC_QUEST_10389 = 'Grausame Pläne', --#--#--
    TBC_QUEST_10876 = 'Die Hand von Kargath', --#--#--
    TBC_QUEST_10258 = 'Poste de Brise-échine',
    TBC_QUEST_9406 = 'Mag\'har',
    TBC_QUEST_9370 = 'Guet de l\'épervier',
    TBC_QUEST_10351 = 'Poste cénarien',

    TBC_QUEST_10397 = 'Haltet die Brennende Legion auf', --#--#--
    TBC_QUEST_10400 = 'Stürzt den Oberanführer', --#--#--
    TBC_QUEST_9545 = 'Die Suche nach Sedai', --#--#--
    TBC_QUEST_10935 = 'Der Exorzismus des Oberst Jules', --#--#--
    TBC_QUEST_10937 = 'Die Züchtigung des Drillmeisters', --#--#--
    TBC_QUEST_9383 = 'Temple de Telhamat',
    TBC_QUEST_10630 = 'Grün, aber kein Orc', --#--#--
    
    AN_QUESTS_ZANGARMASH = 'Les mystères du marécage',
    AD_QUESTS_ZANGARMASH = 'Achever 54 quêtes dans le marécage de Zangar.',
    TBC_QUEST_9772 = 'Poste du Rat des marais',
    TBC_QUEST_9904 = 'Zabra\'jin',
    TBC_QUEST_10118 = 'Die Verteidigung von Zabra\'jin', --#--#--
    TBC_QUEST_9803 = 'Draeneidiplomatie', --#--#--
    TBC_QUEST_9783 = 'Telredor',
    TBC_QUEST_9902 = 'Havre d\'Orebor',
    TBC_QUEST_9709 = 'DIESE Pilze solltet Ihr nicht essen!', --#--#--
    TBC_QUEST_9732 = 'Trockenlegung der Marschen', --#--#--
    TBC_QUEST_9788 = 'Rettung der Sporloks', --#--#--
    TBC_QUEST_9726 = 'Ein Ausflug mit dem Sporlingen', --#--#--
    
    AN_QUESTS_TERROKAR = 'Terreur dans Terokkar',
    AD_QUESTS_TERROKAR = 'Achever 63 quêtes dans la forêt de Terokkar.',
    TBC_QUEST_10879 = 'Offensive aus Skettis', --#--#--
    TBC_QUEST_10881 = 'Caravane de réfugiés',
    TBC_QUEST_10915 = 'Camp de base sha\'tari',
    TBC_QUEST_9951 = 'Das Geheimnis des Aufsehers', --#--#--
    TBC_QUEST_10042 = 'Bastion allérien',
    TBC_QUEST_10043 = 'Fort des Brise-pierres',
    
    AN_QUESTS_NAGRAND = 'Chelem en Nagrand',
    AD_QUESTS_NAGRAND = 'Achever 75 quêtes en Nagrand.',
    TBC_QUEST_10172 = 'Geburt eines Kriegshäuptlings', --#--#--
    TBC_QUEST_9977 = 'L\'arène de sang',
    TBC_QUEST_9853 = 'Trône des éléments',
    TBC_QUEST_9934 = 'Lantresor von der Klinge', --#--#--
    TBC_QUEST_9868 = 'Die Finsterblutzerschlagenen', --#--#--
    TBC_QUEST_9937 = 'Bedrohungen für Nagrand', --#--#--
    TBC_QUEST_9852 = 'Le plus gros des gibiers',
    TBC_QUEST_9925 = 'Begegnung mit den Astralen', --#--#--
    TBC_QUEST_9955 = 'Die Abenteuer von Corki', --#--#--
    TBC_QUEST_9933 = 'Lantresor von der Klinge', --#--#--
    TBC_QUEST_9873 = 'Die Finsterblutzerschlagenen', --#--#--
    TBC_QUEST_10011 = 'Bedrohungen für Nagrand', --#--#--
    
    AN_QUESTS_BLADES_EDGE_MTNS = 'Sur le fil des Tranchantes',
    AD_QUESTS_BLADES_EDGE_MTNS = 'Achever 86 quêtes dans les Tranchantes.',
    TBC_QUEST_10504 = 'Sylvanaar',
    TBC_QUEST_10671 = 'Poste de Toshley',
    TBC_QUEST_10806 = 'Die Gronnbedrohung', --#--#--
    TBC_QUEST_10505 = 'Bastion des Sire-tonnerre',
    TBC_QUEST_10742 = 'Zusammenführung', --#--#--
    TBC_QUEST_10867 = 'Die Mok\'Nathal', --#--#--
    TBC_QUEST_10748 = 'Sylve Ruuan',
    
    AN_QUESTS_NETHERSTORM = 'Dans le Néant',
    AD_QUESTS_NETHERSTORM = 'Achever 120 quêtes à Raz-de-Néant.',
    TBC_QUEST_10409 = 'Socrethar', --#--#--
    TBC_QUEST_10240 = 'La Tour pourpre',
    TBC_QUEST_10249 = 'Beschützt Area 52!', --#--#--
    TBC_QUEST_10439 = 'Zerstörung des Allesverschlingenden', --#--#--
    TBC_QUEST_10221 = 'Bau der X-52 Netherrakete', --#--#--
    TBC_QUEST_10276 = 'Le Consortium',
    
    AN_QUESTS_SHADOWMOON = 'L\'ombre du Traître',
    AD_QUESTS_SHADOWMOON = 'Achever 90 quêtes dans la vallée d\'Ombrelune.',
    TBC_QUEST_10744 = 'Nachricht vom Sieg', --#--#--
    TBC_QUEST_11041 = 'Escarpement de l\'Aile-du-Néant',
    TBC_QUEST_10645 = 'Der erste Todesritter', --#--#--
    TBC_QUEST_10651 = 'Geliehene Macht', --#--#--
    TBC_QUEST_11052 = 'Akamas Versprechen', --#--#--
    TBC_QUEST_10588 = 'Die Litanei der Verdammnis', --#--#--
    TBC_QUEST_10679 = 'Antidämonenwaffen', --#--#--
    TBC_QUEST_10808 = 'Der Dunkle Rat', --#--#--
	
	AN_HEMET_QUESTS_NAGRAND = 'Paradis perdu',
	AD_HEMET_QUESTS_NAGRAND = 'Achever toutes les quêtes d\'Hemet Nesingwary en Outreterre, y compris « Le plus gros des gibiers ».',

    HEROIC_NAME_PATTERN = 'Heroisch: %s', --#--#--
    HEROIC_DESCRIPTION_PATTERN = '%s auf dem Schwierigkeitsgrad \'Heroisch\'', --#--#--

    AN_HELLFIRE_RAMPARTS = 'Remparts des Flammes infernales',
    AD_HELLFIRE_RAMPARTS = 'Vaincre Omor l’Intouché.',
    AC_BOSS_17308 = 'Omor l’Intouché',
    AC_BOSS_17537 = 'Vazruden le Héraut',
	AC_BOSS_17306 = 'Wachhabender Gargolmar', --#--#--

    AN_BLOOD_FURNACE = 'Fournaise du sang',
    AD_BLOOD_FURNACE = 'Vaincre Keli’dan le Briseur.',

    AN_SLAVE_PENS = 'Enclos aux esclaves',
    AD_SLAVE_PENS = 'Vaincre Bourbierreux.',

    AN_UNDERBOG = 'Basse-tourbière',
    AD_UNDERBOG = 'Vaincre la Traqueuse noire.',

    AN_MANA_TOMBS = 'Tombes-mana',
    AD_MANA_TOMBS = 'Vaincre le prince-nexus Shaffar.',

    AN_AUCHENAI_CRYPTS = 'Cryptes Auchenaï',
    AD_AUCHENAI_CRYPTS = 'Vaincre l’exarque Maladaar.',

    AN_OLD_HILLSBRAD = 'L\'évasion de Fort-de-Durn',
    AD_OLD_HILLSBRAD = 'Vaincre le Chasseur d’époques.',

    AN_SETHEKK_HALLS = 'Salles des Sethekk',
    AD_SETHEKK_HALLS = 'Vaincre le roi-serre Ikiss.',

    AN_STEAMVAULT = 'Caveau de la Vapeur',
    AD_STEAMVAULT = 'Vaincre le seigneur de guerre Kalithresh.',

    AN_SHADOW_LABYRINTH = 'Labyrinthe des ombres',
    AD_SHADOW_LABYRINTH = 'Vaincre Marmon.',

    AN_SHATTERED_HALLS = 'Salles Brisées',
    AD_SHATTERED_HALLS = 'Vaincre le chef de guerre Kargath Lamepoing.',

    AN_BLACK_MORASS = 'Ouverture de la Porte des ténèbres',
    AD_BLACK_MORASS = 'Vaincre Aeonus.',

    AN_BOTANICA = 'Botanica',
    AD_BOTANICA = 'Vaincre Brise-Dimension.',

    AN_MECHANAR = 'Méchanar',
    AD_MECHANAR = 'Vaincre Pathaleon le Calculateur.',

    AN_ARCATRAZ = 'L\'Arcatraz',
    AD_ARCATRAZ = 'Vaincre le messager Cieuriss.',
	
	AN_MAGISTERS_TERRACE = 'Terrasse des magistères',
    AD_MAGISTERS_TERRACE = 'Vaincre Kael’thas Haut-Soleil.',
	
	AN_TBC_DUNGEONS = 'Maître des donjons de l\'Outreterre',
    AD_TBC_DUNGEONS = 'Accomplir les hauts faits dans les donjons de The Burning Crusade listés ci-dessous.',

    AN_TBC_DUNGEONS_HERO = 'Héros des donjons de l\'Outreterre',
    AD_TBC_DUNGEONS_HERO = 'Accomplir les hauts faits dans les donjons héroïques de The Burning Crusade listés ci-dessous.',

    AN_OUTLAND_HERO = 'Held der Scherbenwelt', --#--#--
    AD_OUTLAND_HERO = 'Schließt die unten aufgelisteten Schlachtzugserfolge ab.', --#--#--
    AR_OUTLAND_HERO = 'Held der Scherbenwelt', --#--#--
    
    AN_OUTLAND_GREAT_HERO = 'Großartiger Held der Scherbenwelt', --#--#--
    AD_OUTLAND_GREAT_HERO = 'Schließt die unten aufgelisteten Dungeon- und Schlachtzugserfolge ab.', --#--#--
    AR_OUTLAND_GREAT_HERO = 'Großartiger Held der Scherbenwelt', --#--#--

    AN_RAVEN_LORD = 'Rênes du seigneur corbeau',
    AD_RAVEN_LORD = 'Obtenir les rênes du seigneur corbeau sur Anzu dans les salles des Sethekk.',

    AN_KARAZHAN = 'Karazhan',
    AD_KARAZHAN = 'Vaincre le prince Malchezaar à Karazhan.',

    AN_GRUUL = 'Repaire de Gruul',
    AD_GRUUL = 'Vaincre Gruul le Tue-Dragon dans le repaire de Gruul.',

    AN_MAGTHERIDON = 'Repaire de Magtheridon',
    AD_MAGTHERIDON = 'Vaincre Magtheridon dans le repaire de Magtheridon.',
	
	AN_ZULAMAN = 'Zul’Aman',
	AD_ZULAMAN = 'Vaincre Zul\'jin à Zul\'Aman.',
	
	AN_SUNWELL = 'Plateau du Puits de soleil',
	AD_SUNWELL = 'Vaincre Kil’jaeden sur le Plateau du Puits de soleil.',

    AN_TBC_PHASE_1 = 'Écumeur des raids de l\'Outreterre',
    AD_TBC_PHASE_1 = 'Accomplir les hauts faits dans les raids de The Burning Crusade listés ci-dessous.',
    AN_TBC_PHASE_2 = 'Écumeur des raids de l\'Outreterre',
    AD_TBC_PHASE_2 = 'Accomplir les hauts faits dans les raids de The Burning Crusade listés ci-dessous.',
    AN_TBC_PHASE_3 = 'Écumeur des raids de l\'Outreterre',
    AD_TBC_PHASE_3 = 'Accomplir les hauts faits dans les raids de The Burning Crusade listés ci-dessous.',
	AN_TBC_PHASE_4 = 'Écumeur des raids de l\'Outreterre',
    AD_TBC_PHASE_4 = 'Accomplir les hauts faits dans les raids de The Burning Crusade listés ci-dessous.',
	AN_TBC_PHASE_5 = 'Écumeur des raids de l\'Outreterre',
    AD_TBC_PHASE_5 = 'Accomplir les hauts faits dans les raids de The Burning Crusade listés ci-dessous.',
	
    FACTION_946 = 'Bastion de l\'Honneur',
    FACTION_947 = 'Thrallmar',
    FACTION_942 = 'Expédition cénarienne',
    FACTION_1011 = 'Ville basse',
    FACTION_989 = 'Gardiens du Temps',
    FACTION_935 = 'Les Sha\'tar',
	FACTION_609 = 'Cercle cénarien',

    AN_TBC_DUNGEON_REPUTATIONS = 'Le croisé ardent',
    AD_TBC_DUNGEON_REPUTATIONS = 'Être exalté auprès de toutes les factions relatives aux donjons de The Burning Crusade.',
	
	AN_CENARION_CIRCLE = 'Gardien de Cénarius',
    AD_CENARION_CIRCLE = 'Être exalté auprès du Cercle cénarien et de l\'Expédition cénarienne.',

    AN_SHATTRATH_REP = 'Shattrath divisée',
    AD_SHATTRATH_REP = 'Être exalté auprès des Clairvoyants ou de l\'Aldor.',

    AN_OGRILA = 'Une quête par jour pour leur amour',
    AD_OGRILA = 'Être exalté auprès d\'Ogri\'la.',

    AN_SPOREGGAR = 'Le tsar de Sporeggar',
    AD_SPOREGGAR = 'Être exalté auprès de Sporeggar.',

    AN_CONSORTIUM = 'Président directeur exalté',
    AD_CONSORTIUM = 'Être exalté auprès du Consortium.',

    AN_MAGHAR = 'Les Mag\'har de Draenor',
    AD_MAGHAR = 'Être exalté auprès des Mag\'har.',

    AN_KURENAI = 'Il n\'y a que les Kurenaï qui m\'aillent',
    AD_KURENAI = 'Être exalté auprès des Kurenaï.',

    AN_NETHERWINGS = 'Sur les ailes du néant',
    AD_NETHERWINGS = 'Être exalté auprès de l\'Aile-du-Néant.',

    AN_SKYSHATTERED = 'Fracassé',
    AD_SKYSHATTERED = 'Vaincre le capitaine Fracasse-ciel pendant la course Gueule-de-dragon sur l\'escarpement de l\'Aile-du-Néant.',

    AN_AMETHYST_EYE = 'L\'Œil pourpre',
    AD_AMETHYST_EYE = 'Être exalté auprès de l\'Œil pourpre.',

    AN_SCALE_OF_THE_SANDS = 'La Balance des sables',
    AD_SCALE_OF_THE_SANDS = 'Être exalté auprès de la Balance des sables.',

    AN_ASHTONGUE_DEATHSWORN = 'Lié aux ligemorts',
    AD_ASHTONGUE_DEATHSWORN = 'Être exalté auprès des ligemorts cendrelangues.',

    AN_SHATTERED_SUN = 'Chef des opérations',
    AD_SHATTERED_SUN = 'Être exalté auprès de l\'opération Soleil brisé.',

    AN_SKYGUARD = 'Belle vue sur Skettis',
    AD_SKYGUARD = 'Être exalté auprès de la garde-ciel sha\'tari.',

    AN_HIPPOGRYPH = 'Hippogriffe de guerre cénarien',
    AD_HIPPOGRYPH = 'Obtenir l\'hippogriffe de guerre cénarien auprès de l\'Expédition cénarienne dans le marécage de Zangar.',

    AN_DIPLOMAT = 'Diplomate',
    AD_DIPLOMAT_ALLIANCE = 'Augmenter votre réputation d\'inamical à exalté auprès des Grumegueules, de Sporeggar et des Kurenaï.',
    AD_DIPLOMAT_HORDE = 'Augmenter votre réputation d\'inamical à exalté auprès des Grumegueules, de Sporeggar et des Mag\'har.',
    AC_DIPLOMAT_576 = 'Exalté auprès des Grumegueules',
    AC_DIPLOMAT_970 = 'Exalté auprès de Sporeggar',
    AC_DIPLOMAT_978 = 'Exalté auprès des Kurenaï',
    AC_DIPLOMAT_941 = 'Exalté auprès des Mag’har',

    AN_MR_PINCHY = 'Dr. Zwicky!', --#--#--
    AD_MR_PINCHY = 'Angelt Dr. Zwicky in der Scherbenwelt.', --#--#--

    AN_FISHING_BOOK = 'Les poissons ne laissent pas de traces',
    AD_FISHING_BOOK = 'Apprendre la découverte de poissons.',

    AN_ACCOMPLISHED_ANGLER = 'Pêcheur accompli',
    AD_ACCOMPLISHED_ANGLER = 'Accomplir les hauts faits de pêche listés ci-dessous.',

    AN_TBC_DAILY_FISH = 'Le vieux Barlo',
    AD_TBC_DAILY_FISH = 'Achever chacune des 5 quêtes journalières de pêche du vieux Barlo listées ci-dessous.',
    AC_TBC_DAILY_FISH1 = 'Les crocilisques sont lâchés',
    AC_TBC_DAILY_FISH2 = 'Succomber à vos appâts',
    AC_TBC_DAILY_FISH3 = 'Filet de gangresang',
    AC_TBC_DAILY_FISH4 = 'Celui qui s’échappa',
    AC_TBC_DAILY_FISH5 = 'Les crevettes, c’est pas pour les mauviettes',

    AN_OLD_IRONJAW = 'Vieux gueule-de-fer',
    AD_OLD_IRONJAW = 'Pêcher Vieux gueule-de-fer dans Forgefer.',

    AN_OLD_CRAFTY = 'Vieux malin',
    AD_OLD_CRAFTY = 'Pêcher Vieux malin à Orgrimmar.',

    AN_FISHING_DIPLOMAT = 'Le pêcheur diplomate',
    AD_FISHING_DIPLOMAT = 'Pêcher quelque chose dans Orgrimmar et Hurlevent',
    AC_FISHING_DIPLOMAT1 = 'Orgrimmar',
    AC_FISHING_DIPLOMAT2 = 'Hurlevent',

    AN_CAPTAIN_RUMSEY = 'Auprès de ma brune',
    AD_CAPTAIN_RUMSEY = 'Brasser de la brune du capitaine Rumsey.',

    AN_SECOND_RING = 'Der Andere Ring', --#--#--
    AD_SECOND_RING = 'Erhaltet den Anderen Ring aus einem Sack voll geangelter Schätze.', --#--#--

    AN_TBC_DAILY_COOKING = 'Relever un peu la sauce',
    AD_TBC_DAILY_COOKING = 'Achever chacune des 4 quêtes journalières de cuisine du Rokk listées ci-dessous.',
    AC_TBC_DAILY_COOKING1 = 'Manalicieux',
    AC_TBC_DAILY_COOKING2 = 'Une soupe pour l’âme',
    AC_TBC_DAILY_COOKING3 = 'La vengeance est un plat…',
    AC_TBC_DAILY_COOKING4 = 'Un ragoût très épicé',

    AN_TBC_COOKING_RECIPES = 'Gourmet de l\'Outreterre',
    AD_TBC_COOKING_RECIPES = 'Préparer toutes les recettes de l\'Outreterre listées ci-dessous.',

    AN_HAIL_CHEF = 'Gloire au chef',
    AD_HAIL_CHEF = 'Accomplir les hauts faits de cuisine listés ci-dessous.',

    AN_EXPLORE_OUTLAND = 'Exploration de l\'Outreterre',
    AD_EXPLORE_OUTLAND = 'Explorer les régions de l\'Outreterre.',

    AN_MIDDLE_RARE = 'La rareté du fait donne du prix à la chose.',
    AD_MIDDLE_RARE = 'Tuer l\'une des créatures de l\'Outreterre très rares et difficiles à trouver listées ci-dessous.',
    AN_BLOODY_RARE = 'Sacrément rare',
    AD_BLOODY_RARE = 'Tuer toutes les créatures de l\'Outreterre très rares et difficiles à trouver listées ci-dessous.',
    TBC_NPC_18695 = 'Ambassadeur Jerrikar',
    TBC_NPC_18682 = 'Rôdeur des tourbières',
    TBC_NPC_18697 = 'Ingénieur en chef Lorthander',
    TBC_NPC_18681 = 'Émissaire de Glissecroc',
    TBC_NPC_18694 = 'Collidus le Guetteur-Dimensionnel',
    TBC_NPC_18689 = 'Estropieur',
    TBC_NPC_18686 = 'Auspice funeste Jurim',
    TBC_NPC_18698 = 'Permacœur le Punisseur',
    TBC_NPC_18678 = 'Goinfreplein',
    TBC_NPC_17144 = 'Sangredent',
    TBC_NPC_18692 = 'Hemathion',
    TBC_NPC_18696 = 'Kraator',
    TBC_NPC_18680 = 'Marticar',
    TBC_NPC_18677 = 'Mekthorg le Sauvage',
    TBC_NPC_18690 = 'Morcrase',
    TBC_NPC_20932 = 'Nuramoc',
    TBC_NPC_18685 = 'Okrek',
    TBC_NPC_18693 = 'Porte-parole Mar’grom',
    TBC_NPC_18683 = 'Chasseur du Vide Yar',
    TBC_NPC_18679 = 'Vorakem Parleruine',

    AN_PREPATCH_QUEST = 'Auf in den Kampf!', --#--#--
    AD_PREPATCH_QUEST = 'Hat am Kampf um das Dunkle Portal teilgenommen. Träger des Wappenrock des Beschützers.', --#--#--

    AN_RIDING_75 = 'En selle !',
    AD_RIDING_75 = 'Apprendre la compétence Apprenti cavalier.',
    AN_RIDING_150 = 'L\'équipée sauvage',
    AD_RIDING_150 = 'Apprendre la compétence Compagnon cavalier.',
    AN_RIDING_225 = 'La charge héroïque',
    AD_RIDING_225 = 'Apprendre la compétence Expert cavalier.',
    AN_RIDING_300 = 'L\'étoffe des héros',
    AD_RIDING_300 = 'Apprendre la compétence Artisan cavalier.',

    AN_ATTUNE_SHATTERED_HALLS = 'Heißer als die Hölle', --#--#--
    AD_ATTUNE_SHATTERED_HALLS = 'Erhaltet den Schlüssel zu den Zerschmetterten Hallen.', --#--#--
    AN_ATTUNE_ARCATRAZ = 'Comment pénétrer dans l’Arcatraz',
    AD_ATTUNE_ARCATRAZ = 'Erhaltet den Schlüssel zur Arkatraz.', --#--#--
    AN_ATTUNE_KARAZHAN = 'Le toucher du maître',
    AD_ATTUNE_KARAZHAN = 'Erhaltet den Schlüssel des Meisters.', --#--#--
    AN_ATTUNE_NIGHT_BANE = 'Die Vergangenheit aufwühlen', --#--#--
    AD_ATTUNE_NIGHT_BANE = 'Erhaltet die Geschwärzte Urne und bezwingt den Schrecken der Nacht in Karazhan.', --#--#--
    AN_ATTUNE_SSC = 'Le gourdin de Kar\'desh',
    AD_ATTUNE_SSC = 'Erhaltet Zugang zur Höhle des Schlangenschreins.', --#--#--
    AN_ATTUNE_EYE = 'Der Schlüssel der Stürme', --#--#--
    AD_ATTUNE_EYE = 'Erhaltet den Schlüssel der Stürme.', --#--#--
    AN_ATTUNE_HYJAL = 'Les fioles d’éternité',
    AD_ATTUNE_HYJAL = 'Erhaltet Zugang zur Schlacht um den Berg Hyjal.', --#--#--
    AN_ATTUNE_BLACK_TEMPLE = 'Une distraction pour Akama',
    AD_ATTUNE_BLACK_TEMPLE = 'Erhaltet das Medaillon von Karabor.', --#--#--

    AN_SSC = 'Caverne du sanctuaire du Serpent',
    AD_SSC = 'Vaincre Dame Vashj dans la caverne du Sanctuaire du serpent.',
    AC_KILL_HYDROS = 'Hydross der Unstete', --#--#--
    AC_KILL_LURKER = 'Le Rôdeur d’En haut',
    AC_KILL_LEOTHERAS = 'Leotheras der Blinde', --#--#--
    AC_KILL_KARATHRESS = 'Tiefenlord Karathress', --#--#--
    AC_KILL_MOROGRIM = 'Morogrim Gezeitenwandler', --#--#--
    AC_KILL_VASHJ = 'Dame Vashj',
    AN_TK = 'Donjon de la Tempête',
    AD_TK = 'Vaincre Kael’thas Haut-Soleil au donjon de la Tempête.',
    AC_KILL_ALAR = 'Al\'ar', --#--#--
    AC_KILL_VOID_REAVER = 'Leerhäscher', --#--#--
    AC_KILL_SOLARIAN = 'Hochastromantin Solarian', --#--#--
    AC_KILL_KAELTHAS = 'Kael’thas Haut-Soleil',

    AN_HYJAL = 'La bataille du mont Hyjal',
    AD_HYJAL = 'Vaincre Archimonde au cours de la bataille du mont Hyjal.',

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
    AC_KILL_ILLIDAN = 'Illidan Hurlorage',

    AN_BLACK_TEMPLE = 'Le Temple noir',
    AD_BLACK_TEMPLE = 'Vaincre Illidan Hurlorage au Temple noir.',
    AR_BLACK_TEMPLE = 'Bezwinger des Schwarzen Tempels', --#--#--

    AN_ARENA_FIRST_WIN = 'Un pied dans l\'arène',
    AD_ARENA_FIRST_WIN = 'Gagner un match d\'arène du championnat au niveau 70.',
    AN_ARENA_WIN1 = 'Dévouement impitoyable',
    AD_ARENA_WIN1 = 'Gagner 100 matchs d\'arène du championnat au niveau 70.',
    AN_ARENA_WIN2 = 'Dévouement vengeur',
    AD_ARENA_WIN2 = 'Gagner 200 matchs d\'arène du championnat au niveau 70.',
    AN_ARENA_WIN3 = 'Dévouement brutal',
    AD_ARENA_WIN3 = 'Gagner 300 matchs d\'arène du championnat au niveau 70.',

    AN_ARENA_TITLE1 = 'Gladiateur',
    AN_ARENA_TITLE2 = 'Duelliste',
    AN_ARENA_TITLE3 = 'Rival',
    AN_ARENA_TITLE4 = 'Compétiteur',

    AN_ARENA_GLADIATOR = 'Gladiateur',
    AD_ARENA_GLADIATOR = 'Obtenir le titre de gladiateur lors d\'une saison d\'arène au niveau 70.',
    AN_ARENA_DUELIST = 'Duelliste',
    AD_ARENA_DUELIST = 'Obtenir le titre de duelliste lors d\'une saison d\'arène au niveau 70.',
    AN_ARENA_RIVAL = 'Rival',
    AD_ARENA_RIVAL = 'Obtenir le titre de rival lors d\'une saison d\'arène au niveau 70.',
    AN_ARENA_CHALLENGER = 'Compétiteur',
    AD_ARENA_CHALLENGER = 'Obtenir le titre de compétiteur lors d\'une saison d\'arène au niveau 70.',

    AN_ARENA_2_1550 = 'Rien que nous deux : 1550',
    AD_ARENA_2_1550 = 'Obtenir une cote personnelle de 1550 en équipe d\'arène de 2c2 au niveau 70.',
    AN_ARENA_2_1750 = 'Rien que nous deux : 1750',
    AD_ARENA_2_1750 = 'Obtenir une cote personnelle de 1750 en équipe d\'arène de 2c2 au niveau 70.',
    AN_ARENA_2_2000 = 'Rien que nous deux : 2000',
    AD_ARENA_2_2000 = 'Obtenir une cote personnelle de 2000 en équipe d\'arène de 2c2 au niveau 70.',
    AN_ARENA_2_2200 = 'Rien que nous deux : 2200',
    AD_ARENA_2_2200 = 'Obtenir une cote personnelle de 2200 en équipe d\'arène de 2c2 au niveau 70.',

    AN_ARENA_3_1550 = 'Jamais deux sans trois : 1550',
    AD_ARENA_3_1550 = 'Obtenir une cote personnelle de 1550 en équipe d\'arène de 3c3 au niveau 70.',
    AN_ARENA_3_1750 = 'Jamais deux sans trois : 1750',
    AD_ARENA_3_1750 = 'Obtenir une cote personnelle de 1750 en équipe d\'arène de 3c3 au niveau 70.',
    AN_ARENA_3_2000 = 'Jamais deux sans trois : 2000',
    AD_ARENA_3_2000 = 'Obtenir une cote personnelle de 2000 en équipe d\'arène de 3c3 au niveau 70.',
    AN_ARENA_3_2200 = 'Jamais deux sans trois : 2200',
    AD_ARENA_3_2200 = 'Obtenir une cote personnelle de 2200 en équipe d\'arène de 3c3 au niveau 70.',

    AN_ARENA_5_1550 = 'Les cinq doigts de la main : 1550',
    AD_ARENA_5_1550 = 'Obtenir une cote personnelle de 1550 en équipe d\'arène de 5c5 au niveau 70.',
    AN_ARENA_5_1750 = 'Les cinq doigts de la main : 1750',
    AD_ARENA_5_1750 = 'Obtenir une cote personnelle de 1750 en équipe d\'arène de 5c5 au niveau 70.',
    AN_ARENA_5_2000 = 'Les cinq doigts de la main : 2000',
    AD_ARENA_5_2000 = 'Obtenir une cote personnelle de 2000 en équipe d\'arène de 5c5 au niveau 70.',
    AN_ARENA_5_2200 = 'Les cinq doigts de la main : 2200',
    AD_ARENA_5_2200 = 'Obtenir une cote personnelle de 2200 en équipe d\'arène de 5c5 au niveau 70.',

    AN_ARENA_STREAK = 'Bonne série',
    AD_ARENA_STREAK = 'Gagner 10 matchs d\'arène du championnat consécutifs au niveau 70.',

    AN_ARENA_HOTSTREAK = 'Meilleure série',
    AD_ARENA_HOTSTREAK = 'Gagner 10 matchs d\'arène du championnat consécutifs avec une cote supérieure à 1800 au niveau 70.',

    AN_ARENA_LASTMAN = 'Le dernier debout',
    AD_ARENA_LASTMAN = 'Être le seul survivant à la fin d\'un match d\'arène du championnat en 5c5 au niveau 70.',

    AN_ARENA_MAPS = 'Champion du monde',
    AD_ARENA_MAPS = 'Gagner un match d\'arène coté dans les arènes des Tranchantes et de Nagrand, les égouts de Dalaran et les ruines de Lordaeron au niveau 70.',
    AC_ARENA_MAPS1 = 'Arène des Tranchantes',
    AC_ARENA_MAPS2 = 'Arène de Nagrand',
    AC_ARENA_MAPS3 = 'Ruines de Lordaeron',

    AN_ARENA_MASTER = 'Maîtrise de l\'arène',
    AD_ARENA_MASTER = 'Accomplir les hauts faits d\'arène listés ci-dessous.',

    AN_AZZINOTH = 'Glaives de guerre d’Azzinoth',
    AD_AZZINOTH = 'S’équiper des glaives de guerre d’Azzinoth.',
	AN_THORIDAL = 'Thori\'dal, la Fureur des étoiles',
    AD_THORIDAL = 'S’équiper de Thori’dal, la Fureur des étoiles.',
    AC_OBTAIN_MAINHAND_AZZINOTH = 'Rechte Kriegsgleve von Azzinoth', --#--#--
    AC_OBTAIN_OFFHAND_AZZINOTH = 'Linke Kriegsgleve von Azzinoth', --#--#--
	AN_BEAR_MOUNT = 'Ours de guerre amani',
    AD_BEAR_MOUNT = 'Posséder un ours de guerre amani',
	AN_HAWK_MOUNT = 'Faucon-pérégrin blanc rapide',
    AD_HAWK_MOUNT = 'Obtenir le faucon-pérégrin blanc rapide sur Kael’thas Haut-Soleil sur la terrasse des Magistères.',
	AN_ALAR_MOUNT = 'Cendres d\'Al\'ar',
    AD_ALAR_MOUNT = 'Obtenir les cendres d’Al’ar sur Kael’thas Haut-Soleil dans le donjon de la Tempête.',
	AN_HORSEMAN_MOUNT = 'Les rênes du Cavalier',
	AD_HORSEMAN_MOUNT = 'Obtenir les rênes du Cavalier sur le Cavalier sans tête au Monastère écarlate pendant la Sanssaint.',
	AN_HERO_SHATTRATH = 'Héros de Shattrath',
	AD_HERO_SHATTRATH = 'Avoir été exalté auprès des Clairvoyants et de l\'Aldor.',
	AN_HERO_SCRYER = 'Les Clairvoyants',
	AN_HERO_ALDOR = 'L\'Aldor',
	AN_CHAMPION_NAARU = 'Champion des naaru',
	AD_CHAMPION_NAARU = 'Avoir obtenu le titre de champion des naaru.',
	AR_CHAMPION_NAARU = 'Champion des naaru',
	AN_HAND_ADAL = 'Main d\'A\'dal',
	AD_HAND_ADAL = 'Avoir obtenu le titre de main d\'A\'dal.',

    AN_P3_FIRST_WEEK = 'Eroberer der Scherbenwelt', --#--#--
    AD_P3_FIRST_WEEK = 'Bezwingt Archimonde und Illidan Sturmgrimm in der ersten Woche von Phase 3.', --#--#--
    AC_KILL_ARCHIMONDE = 'Archimonde',
    AR_P3_FIRST_WEEK = 'Eroberer der Scherbenwelt', --#--#--
	
	AN_FLIGHFORM = 'Forme de vol rapide',
	AD_FLIGHFORM = 'Avoir achevé la quête de druide pour obtenir la forme de vol rapide.',

    AN_KRUUL = '...nicht noch ein Dämonenlord!', --#--#--
	AD_KRUUL = 'Bezwingt Hochlord Kruul während des Kampfes um das Dunkle Portal.', --#--#--

    AN_ATTUMEN_MOUNT = 'Rênes de cheval de guerre embrasé',
	AD_ATTUMEN_MOUNT = 'Obtenir les rênes de cheval de guerre embrasé sur Attumen à Karazhan.',


    -- Classic-continent rare achievement series
    AN_ONE_OF_A_KIND = 'Unique en son genre',
    AD_ONE_OF_A_KIND = 'Tuez une créature rare élite en Kalimdor ou dans les Royaumes de l’Est.',
    AN_EXTREMELY_RARE = 'Extrêmement rare',
    AD_EXTREMELY_RARE = 'Tuez toutes les créatures rares élites de Kalimdor et des Royaumes de l’Est indiquées ci-dessous.',

    -- Classic-continent rare NPC names (localized by stable NPC ID).
    RARE_NPC_3586 = 'Mineur Johnson',
    RARE_NPC_3872 = 'Capitaine Ligemort',
    RARE_NPC_6228 = 'Ambassadeur Sombrefer',
    RARE_NPC_6488 = 'Champion déchu',
    RARE_NPC_6489 = 'Echine-de-fer',
    RARE_NPC_6490 = 'Azshir le Sans-sommeil',
    RARE_NPC_7057 = 'Maître des fouilles Pellaphlange',
    RARE_NPC_9024 = 'Pyromancien Blé-du-savoir',
    RARE_NPC_8923 = 'Panzor l\'Invincible',
    RARE_NPC_9041 = 'Gardien Stilgiss',
    RARE_NPC_9042 = 'Verek',
    RARE_NPC_9217 = 'Seigneur magus Pierre-du-pic',
    RARE_NPC_9218 = 'Seigneur de bataille Pierre-du-pic',
    RARE_NPC_9219 = 'Boucher Pierre-du-pic',
    RARE_NPC_9596 = 'Bannok Hache-sinistre',
    RARE_NPC_9736 = 'Intendant Zigris',
    RARE_NPC_10376 = 'Croc cristallin',
    RARE_NPC_10263 = 'Gangregarde ardent',
    RARE_NPC_9718 = 'Ghok Bounnebaffe',
    RARE_NPC_10509 = 'Jed Guette-runes',
    RARE_NPC_10899 = 'Goraluk Brisenclume',
    RARE_NPC_10393 = 'Krân',
    RARE_NPC_10558 = 'Chanteloge Forrestin',
    RARE_NPC_10809 = 'Echine-de-pierre',
    RARE_NPC_99 = 'Morgaine la rusée',
    RARE_NPC_100 = 'Gruff Mord-vite',
    RARE_NPC_471 = 'Mère Croc',
    RARE_NPC_472 = 'Fenouillard',
    RARE_NPC_61 = 'Thuros Doigts-agiles',
    RARE_NPC_79 = 'Narg le Sous-chef',
    RARE_NPC_1130 = 'Bjarn',
    RARE_NPC_1132 = 'Grumeux',
    RARE_NPC_1137 = 'Edan le Hurleur',
    RARE_NPC_8503 = 'Margouilleur',
    RARE_NPC_1260 = 'Grand-père Arctikus',
    RARE_NPC_1119 = 'Martelléchine',
    RARE_NPC_10827 = 'Nécrorateur Selendre',
    RARE_NPC_10817 = 'Duggan Marteau-hardi',
    RARE_NPC_10825 = 'Gish l\'Immobile',
    RARE_NPC_10821 = 'Hed\'mush le Pourrissant',
    RARE_NPC_10828 = 'Grand général Abbendis',
    RARE_NPC_10826 = 'Seigneur Sombrefaux',
    RARE_NPC_10824 = 'Seigneur forestier Eperlance',
    RARE_NPC_10822 = 'Seigneur de guerre Thresh\'jin',
    RARE_NPC_10823 = 'Zul\'Brin Voilebranche',
    RARE_NPC_16184 = 'Surveillant nérubien',
    RARE_NPC_1843 = 'Contremaître Jerris',
    RARE_NPC_1844 = 'Contremaître Marcrid',
    RARE_NPC_1847 = 'Vilcrin',
    RARE_NPC_1838 = 'Inquisiteur écarlate',
    RARE_NPC_1851 = 'La Bogue',
    RARE_NPC_1837 = 'Juge écarlate',
    RARE_NPC_1885 = 'Forgeron écarlate',
    RARE_NPC_1848 = 'Seigneur Maldazzar',
    RARE_NPC_1850 = 'Putridius',
    RARE_NPC_1839 = 'Grand prêtre écarlate',
    RARE_NPC_1841 = 'Bourreau écarlate',
    RARE_NPC_10356 = 'Bayne',
    RARE_NPC_1911 = 'Deeb',
    RARE_NPC_1936 = 'Fermier de Solliden',
    RARE_NPC_10358 = 'Ombre de Fellicent',
    RARE_NPC_1531 = 'Ame égarée',
    RARE_NPC_1910 = 'Muad',
    RARE_NPC_10357 = 'Ressan le Harceleur',
    RARE_NPC_10359 = 'Sri\'skulk',
    RARE_NPC_1533 = 'Esprit tourmenté',
    RARE_NPC_14221 = 'Gravis Lecollet',
    RARE_NPC_2258 = 'Furie-de-pierre',
    RARE_NPC_14223 = 'Benj le teigneux',
    RARE_NPC_2453 = 'Lo\'Grosh',
    RARE_NPC_2452 = 'Grybou',
    RARE_NPC_12431 = 'Croquetripe',
    RARE_NPC_12433 = 'Krethis Tissombre',
    RARE_NPC_12432 = 'Vieux Vile mâchoire',
    RARE_NPC_1944 = 'Cogneur Poil-Putride',
    RARE_NPC_1948 = 'Grondecrin',
    RARE_NPC_2283 = 'Régent Serres-de-corbeau',
    RARE_NPC_1920 = 'Copiste de Dalaran',
    RARE_NPC_8213 = 'Dos-de-fer',
    RARE_NPC_8214 = 'Jalinde Drake-d\'été',
    RARE_NPC_8216 = 'Retherokk le Berserker',
    RARE_NPC_8212 = 'Le Jonc',
    RARE_NPC_8218 = 'Flétricoeur le Traqueur',
    RARE_NPC_8219 = 'Zul\'arek Volaillaîne',
    RARE_NPC_8210 = 'Trancheserre',
    RARE_NPC_8217 = 'Mith\'rethis l\'Enchanteur',
    RARE_NPC_8215 = 'Grimungous',
    RARE_NPC_14222 = 'Araga',
    RARE_NPC_14279 = 'Insinueuse',
    RARE_NPC_14281 = 'Jimmy le Saignant',
    RARE_NPC_14277 = 'Dame Zephris',
    RARE_NPC_8211 = 'Vieux Saute-falaise',
    RARE_NPC_14278 = 'Ro\'Bark',
    RARE_NPC_14276 = 'Scargil',
    RARE_NPC_14280 = 'Gros Samras',
    RARE_NPC_2447 = 'Narillasanz',
    RARE_NPC_14275 = 'Tamra Foudrepique',
    RARE_NPC_2779 = 'Prince Nazjak',
    RARE_NPC_2609 = 'Géomancien Dague-de-silex',
    RARE_NPC_2600 = 'Singer',
    RARE_NPC_2598 = 'Darbel Montrose',
    RARE_NPC_2601 = 'Souillebedon',
    RARE_NPC_2602 = 'Ruul Unepierre',
    RARE_NPC_2603 = 'Kovork',
    RARE_NPC_2604 = 'Molok l\'Anéantisseur',
    RARE_NPC_2606 = 'Nimar le Pourfendeur',
    RARE_NPC_2605 = 'Zalas Fânécorce',
    RARE_NPC_1037 = 'Maître de guerre Gueule-de-dragon',
    RARE_NPC_2108 = 'Garneg Grille-crâne',
    RARE_NPC_1112 = 'Veuve sanguine',
    RARE_NPC_2090 = 'Ma\'ruk Wyrmécaille',
    RARE_NPC_1140 = 'Matriarche tranchegueules',
    RARE_NPC_1050 = 'Garde royal Plaiedécaille',
    RARE_NPC_14425 = 'Ronge-les-os',
    RARE_NPC_14424 = 'Bas-boueux',
    RARE_NPC_14433 = 'Bouillasseux',
    RARE_NPC_1398 = 'Boss Galgosh',
    RARE_NPC_1425 = 'Grizlak',
    RARE_NPC_2476 = 'Grand crocilisque du loch',
    RARE_NPC_14268 = 'Seigneur Condar',
    RARE_NPC_1399 = 'Magosh',
    RARE_NPC_14266 = 'Shanda la Tisseuse',
    RARE_NPC_14267 = 'Emogg le Broyeur',
    RARE_NPC_2751 = 'Golem de guerre',
    RARE_NPC_14224 = '7:XT',
    RARE_NPC_2744 = 'Commandant Ombreforge',
    RARE_NPC_2752 = 'Grondeur',
    RARE_NPC_2753 = 'Barnabus',
    RARE_NPC_2850 = 'Brèchedent',
    RARE_NPC_2931 = 'Zaricotl',
    RARE_NPC_2754 = 'Anathemus',
    RARE_NPC_2749 = 'Golem de siège',
    RARE_NPC_9046 = 'Intendant du Bouclier balafré',
    RARE_NPC_10119 = 'Volchan',
    RARE_NPC_10077 = 'Gueule-du-trépas',
    RARE_NPC_9604 = 'Gorgon\'och',
    RARE_NPC_8979 = 'Gruklash',
    RARE_NPC_9602 = 'Hahk\'Zor',
    RARE_NPC_8976 = 'Hematos',
    RARE_NPC_8981 = 'Saccageur défectueux',
    RARE_NPC_10078 = 'Lueur terrifiante',
    RARE_NPC_8978 = 'Thauris Balgarr',
    RARE_NPC_8279 = 'Golem de guerre défaillant',
    RARE_NPC_8277 = 'Rekk\'tilac',
    RARE_NPC_8281 = 'Brûlar',
    RARE_NPC_8280 = 'Shleipnarr',
    RARE_NPC_8283 = 'Maître des esclaves Coeur-noir',
    RARE_NPC_8278 = 'Fumar',
    RARE_NPC_8282 = 'Généralissime Mastrogonde',
    RARE_NPC_584 = 'Kazon',
    RARE_NPC_14273 = 'Rochecoeur',
    RARE_NPC_616 = 'Cliqueteuse',
    RARE_NPC_14271 = 'Chassecôtes',
    RARE_NPC_947 = 'Rohh le silencieux',
    RARE_NPC_14269 = 'Aqualon le Chercheur',
    RARE_NPC_14272 = 'Grondefuse',
    RARE_NPC_14270 = 'Squiddic',
    RARE_NPC_763 = 'Chef Perdu',
    RARE_NPC_1106 = 'Cuisinier perdu',
    RARE_NPC_14447 = 'Gilmorian',
    RARE_NPC_14448 = 'Rougeronce',
    RARE_NPC_14445 = 'Seigneur-capitaine Wyrmak',
    RARE_NPC_1063 = 'Jade',
    RARE_NPC_507 = 'Fenros',
    RARE_NPC_771 = 'Commandant Gangretrombe',
    RARE_NPC_503 = 'Seigneur Malathrom',
    RARE_NPC_521 = 'Lupos',
    RARE_NPC_574 = 'Naraxis',
    RARE_NPC_534 = 'Nefaru',
    RARE_NPC_573 = 'Découpeur 4000',
    RARE_NPC_520 = 'Brack',
    RARE_NPC_572 = 'Leprithus',
    RARE_NPC_1424 = 'Maître Terrassier',
    RARE_NPC_506 = 'Sergent Promptegriffe',
    RARE_NPC_519 = 'Slark',
    RARE_NPC_462 = 'Vultros',
    RARE_NPC_596 = 'Noble manipulé',
    RARE_NPC_599 = 'Marisa du\'Paige',
    RARE_NPC_14446 = 'Fingat',
    RARE_NPC_8301 = 'Clack le Saccageur',
    RARE_NPC_8304 = 'Dériseffroi',
    RARE_NPC_8303 = 'Grunter',
    RARE_NPC_8296 = 'Mojo le Tordu',
    RARE_NPC_8300 = 'Ravage',
    RARE_NPC_8299 = 'Ecorchebile',
    RARE_NPC_8298 = 'Akubar le Prophète',
    RARE_NPC_8297 = 'Magronos l\'Inflexible',
    RARE_NPC_8302 = 'Oeil-de-mort',
    RARE_NPC_1061 = 'Gan\'zulah',
    RARE_NPC_14491 = 'Kurmokk',
    RARE_NPC_2541 = 'Seigneur Sakrasis',
    RARE_NPC_14490 = 'Rippa',
    RARE_NPC_1552 = 'Ventrécaille',
    RARE_NPC_14492 = 'Drolatix',
    RARE_NPC_723 = 'Boucher Mosh\'Ogg',
    RARE_NPC_14487 = 'Glougloug',
    RARE_NPC_11383 = 'Grande prêtresse Hai\'watna',
    RARE_NPC_14488 = 'Roloch',
    RARE_NPC_3581 = 'Bête des égouts',
    RARE_NPC_1720 = 'Bruegal Poing-de-fer',
    RARE_NPC_5399 = 'Veyzhak le Cannibale',
    RARE_NPC_5400 = 'Zekkis',
    RARE_NPC_8924 = 'Le Béhémoth',
    RARE_NPC_16854 = 'Eldinarcus',
    RARE_NPC_16855 = 'Tregla',
    RARE_NPC_22062 = 'Dr Gâtemembre',
    RARE_NPC_5912 = 'Dragon féerique déviant',
    RARE_NPC_3652 = 'Trigore le Flagelleur',
    RARE_NPC_3672 = 'Boahn',
    RARE_NPC_10080 = 'Sandarr Ravadune',
    RARE_NPC_10081 = 'Ame en peine poudreuse',
    RARE_NPC_10082 = 'Zerillis',
    RARE_NPC_12237 = 'Meshlok le Moissonneur',
    RARE_NPC_11447 = 'Mushgog',
    RARE_NPC_11497 = 'La Razza',
    RARE_NPC_11498 = 'Bâlhafr l\'Invaincu',
    RARE_NPC_11467 = 'Tsu\'zee',
    RARE_NPC_3068 = 'Mazzranache',
    RARE_NPC_3058 = 'Arra\'chea',
    RARE_NPC_5787 = 'Massacreur Emilgund',
    RARE_NPC_5807 = 'Le Griffu',
    RARE_NPC_5786 = 'Travépieu',
    RARE_NPC_5785 = 'Sœur Cinglehaine',
    RARE_NPC_3056 = 'Hurleur fantomatique',
    RARE_NPC_5822 = 'Gangretisseur Arrogg',
    RARE_NPC_5823 = 'Ecorcheur mortel',
    RARE_NPC_5824 = 'Capitaine Plate-défense',
    RARE_NPC_5826 = 'Géomaîtresse Mouchette',
    RARE_NPC_5808 = 'Seigneur de guerre Kolkanis',
    RARE_NPC_5809 = 'Commandant de la garde Zalaphil',
    RARE_NPC_5828 = 'Humar le Fier',
    RARE_NPC_5842 = 'Takk le Bondisseur',
    RARE_NPC_5834 = 'Azzere la lame céleste',
    RARE_NPC_5865 = 'Dishu',
    RARE_NPC_5836 = 'Ingénieur Tourbicoton',
    RARE_NPC_5835 = 'Contremaître Grills',
    RARE_NPC_3295 = 'Limace bestiale',
    RARE_NPC_5829 = 'Snort la Moqueuse',
    RARE_NPC_5837 = 'Bras-de-pierre',
    RARE_NPC_5838 = 'Brise-épieu',
    RARE_NPC_3470 = 'Rathorian',
    RARE_NPC_5863 = 'Géoprêtresse Gukk\'rok',
    RARE_NPC_3253 = 'Moissonneur silithide',
    RARE_NPC_5832 = 'Grondeterre',
    RARE_NPC_5849 = 'Terrassier Forgeflamme',
    RARE_NPC_5847 = 'Heggin Moustache-de-pierre',
    RARE_NPC_5848 = 'Malgin Brasselorge',
    RARE_NPC_3398 = 'Gesharahan',
    RARE_NPC_5797 = 'Aean Ondevive',
    RARE_NPC_7895 = 'Ambassadeur Ragesang',
    RARE_NPC_5827 = 'Brontus',
    RARE_NPC_5851 = 'Capitaine Gerogg Martèlorteil',
    RARE_NPC_3270 = 'Ancienne mystique Tranchegroin',
    RARE_NPC_5859 = 'Hagg Plaie-des-taurens',
    RARE_NPC_5799 = 'Hannah Feuillelame',
    RARE_NPC_5800 = 'Marcus Bel',
    RARE_NPC_5841 = 'Rochelance',
    RARE_NPC_5830 = 'Sœur Rathtalon',
    RARE_NPC_5831 = 'Vif-crins',
    RARE_NPC_5864 = 'Peau-piquante Pourcegart',
    RARE_NPC_5798 = 'Thora Pennelune',
    RARE_NPC_6584 = 'Roi Mosh',
    RARE_NPC_6582 = 'Matriarche Zavas',
    RARE_NPC_6581 = 'Matriarche ravasaure',
    RARE_NPC_6585 = 'Uhk\'loc',
    RARE_NPC_6583 = 'Gruff',
    RARE_NPC_3535 = 'Noiremousse le Fétide',
    RARE_NPC_14430 = 'Traqueur du crépuscule',
    RARE_NPC_14431 = 'Furie Shelda',
    RARE_NPC_14432 = 'Threggil',
    RARE_NPC_14428 = 'Uruson',
    RARE_NPC_14429 = 'Mornegueule',
    RARE_NPC_2186 = 'Carnivous le Casseur',
    RARE_NPC_2192 = 'Mandefeu Radison',
    RARE_NPC_7015 = 'Flagglemurk le Cruel',
    RARE_NPC_2184 = 'Dame Mirelune',
    RARE_NPC_2191 = 'Licillin',
    RARE_NPC_2175 = 'Ombregriffe',
    RARE_NPC_2172 = 'Matriarche trotteuse',
    RARE_NPC_7016 = 'Dame Vespira',
    RARE_NPC_7017 = 'Seigneur Salvassio',
    RARE_NPC_14342 = 'Ragepatte',
    RARE_NPC_14340 = 'Alshirr Souffléau',
    RARE_NPC_14339 = 'Hurlemort',
    RARE_NPC_14344 = 'Mongress',
    RARE_NPC_14343 = 'Olm la Sage',
    RARE_NPC_14345 = 'L\'Ongar',
    RARE_NPC_7104 = 'Dessecus',
    RARE_NPC_7137 = 'Immolatus',
    RARE_NPC_6651 = 'Portier Hurlerage',
    RARE_NPC_6647 = 'Magistère Falcoiffe',
    RARE_NPC_6648 = 'Antilos',
    RARE_NPC_6650 = 'Général Crocdangoiffe',
    RARE_NPC_6649 = 'Dame Sesspira',
    RARE_NPC_8660 = 'L\'Evalcharr',
    RARE_NPC_6118 = 'Fantôme de Varo\'then',
    RARE_NPC_6652 = 'Maître Trouilleffroi',
    RARE_NPC_6646 = 'Monnos l\'Ancien',
    RARE_NPC_13896 = 'Barbe-d\'écailles',
    RARE_NPC_3735 = 'Apothicaire Falthis',
    RARE_NPC_10559 = 'Dame Vespia',
    RARE_NPC_10644 = 'Hurleur des brumes',
    RARE_NPC_10641 = 'Brise-branche',
    RARE_NPC_10643 = 'Moldaileron',
    RARE_NPC_10647 = 'Prince Raze',
    RARE_NPC_10639 = 'Joufflu le croquant',
    RARE_NPC_3792 = 'Chef de meute Frayeloup',
    RARE_NPC_12037 = 'Ursol\'lok',
    RARE_NPC_10642 = 'Eck\'alom',
    RARE_NPC_10640 = 'Chênepatte',
    RARE_NPC_3736 = 'Assassin Mordenthal',
    RARE_NPC_3773 = 'Akkrilus',
    RARE_NPC_4066 = 'Nal\'taszar',
    RARE_NPC_4015 = 'Patriarche Aile-fière',
    RARE_NPC_5916 = 'Sentinelle Amarassan',
    RARE_NPC_4030 = 'Ancien vengeur',
    RARE_NPC_5915 = 'Frère Corvichêne',
    RARE_NPC_5931 = 'Contremaître Gréeur',
    RARE_NPC_5930 = 'Sœur Riven',
    RARE_NPC_5928 = 'Ailes du désespoir',
    RARE_NPC_5932 = 'Sous-chef Fouettecroc',
    RARE_NPC_14230 = 'Pique-les-yeux',
    RARE_NPC_4380 = 'Veuve de Sombrebrume',
    RARE_NPC_14234 = 'Hayoc',
    RARE_NPC_4339 = 'Soufresang',
    RARE_NPC_14232 = 'Flèche',
    RARE_NPC_14231 = 'Drogoth le Vagabond',
    RARE_NPC_14236 = 'Seigneur Baudroie',
    RARE_NPC_14237 = 'Ver de limon',
    RARE_NPC_14233 = 'Arrachécaille',
    RARE_NPC_14235 = 'La Pourriture',
    RARE_NPC_14225 = 'Prince Kellen',
    RARE_NPC_14228 = 'Glousse',
    RARE_NPC_14227 = 'Hissperak',
    RARE_NPC_14226 = 'Kaskk',
    RARE_NPC_14229 = 'Ondulame maudit',
    RARE_NPC_11688 = 'Centaure maudit',
    RARE_NPC_5347 = 'Antilus le Planeur',
    RARE_NPC_5349 = 'Arash-ethis',
    RARE_NPC_12801 = 'Chimaerok des arcanes',
    RARE_NPC_5346 = 'Rugissang le Traqueur',
    RARE_NPC_12800 = 'Chimaerok',
    RARE_NPC_12802 = 'Dévoreur Chimaerok',
    RARE_NPC_5345 = 'Tête-de-diamant',
    RARE_NPC_5354 = 'Gnarl Frèrefeuilles',
    RARE_NPC_5343 = 'Dame Szallah',
    RARE_NPC_5352 = 'Vieux Grisebedaine',
    RARE_NPC_5350 = 'Qirot',
    RARE_NPC_5356 = 'Grogneur',
    RARE_NPC_5933 = 'Achellios le Banni',
    RARE_NPC_4132 = 'Ravageur silithide',
    RARE_NPC_5935 = 'Ferregard l\'Invincible',
    RARE_NPC_14427 = 'Margouilloche',
    RARE_NPC_14426 = 'Harb Mont-souillé',
    RARE_NPC_5934 = 'Tranchecoeur',
    RARE_NPC_5937 = 'Dardeur',
    RARE_NPC_8207 = 'Grand oiseau de feu',
    RARE_NPC_8205 = 'Haarka le Féroce',
    RARE_NPC_8203 = 'Kregg Soulaquille',
    RARE_NPC_8208 = 'Brûlepatte meurtrier',
    RARE_NPC_8202 = 'Cyclok le Fol',
    RARE_NPC_8201 = 'Omgorn l\'Egaré',
    RARE_NPC_8204 = 'Soriid le Dévoreur',
    RARE_NPC_8200 = 'Jin\'Zallah Porte-sable',
    RARE_NPC_8199 = 'Chef de guerre Krazzilak',
    RARE_NPC_14472 = 'Gretheer',
    RARE_NPC_14477 = 'Grubthor',
    RARE_NPC_14478 = 'Ouraganien',
    RARE_NPC_14476 = 'Krellack',
    RARE_NPC_14473 = 'Lapress',
    RARE_NPC_14471 = 'Setis',
    RARE_NPC_14479 = 'Seigneur du crépuscule Everun',
    RARE_NPC_15308 = 'Prophète du crépuscule',
    RARE_NPC_14474 = 'Zora',
    RARE_NPC_14475 = 'Rex Ashil',
    RARE_NPC_10200 = 'Rak\'shiri',
    RARE_NPC_10197 = 'Mezzir le hurleur',
    RARE_NPC_10201 = 'Dame Hederine',
    RARE_NPC_10199 = 'Grison Neigepatte',
    RARE_NPC_10202 = 'Azurous',
    RARE_NPC_10196 = 'Général Colbatann',
    RARE_NPC_10198 = 'Kashoch le saccageur',
    RARE_NPC_4425 = 'Chasseur aveugle',
    RARE_NPC_4842 = 'Implorateur de la terre Halmgar',
    RARE_NPC_7354 = 'Groinfendu',
    RARE_NPC_22060 = 'Fenissa l\'Assassin',

    -- Built-in title catalog: labels and grammatical name placement.
    TITLE_BUILTIN_EXPLORER_LABEL = 'Conquérant',
    TITLE_BUILTIN_EXPLORER_FORMAT_MALE = 'Conquérant %s',
    TITLE_BUILTIN_EXPLORER_FORMAT_FEMALE = 'Conquérante %s',
    TITLE_BUILTIN_THE_ELUSIVE_LABEL = 'L’Insaisissable',
    TITLE_BUILTIN_THE_ELUSIVE_FORMAT_MALE = '%s l’Insaisissable',
    TITLE_BUILTIN_THE_ELUSIVE_FORMAT_FEMALE = '%s l’Insaisissable',
    TITLE_BUILTIN_BATTLEMASTER_LABEL = 'Maître de guerre',
    TITLE_BUILTIN_BATTLEMASTER_FORMAT_MALE = 'Maître de guerre %s',
    TITLE_BUILTIN_BATTLEMASTER_FORMAT_FEMALE = 'Maîtresse de guerre %s',
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
    TITLE_BUILTIN_BLOODSAIL_ADMIRAL_LABEL = 'Amiral de la Voile sanglante',
    TITLE_BUILTIN_BLOODSAIL_ADMIRAL_FORMAT_MALE = 'Amiral de la Voile sanglante %s',
    TITLE_BUILTIN_BLOODSAIL_ADMIRAL_FORMAT_FEMALE = 'Amiral de la Voile sanglante %s',
    TITLE_BUILTIN_THE_HALLOWED_LABEL = 'le Sanssaint',
    TITLE_BUILTIN_THE_HALLOWED_FORMAT_MALE = '%s le Sanssaint',
    TITLE_BUILTIN_THE_HALLOWED_FORMAT_FEMALE = '%s la Sanssainte',
    TITLE_BUILTIN_MERRYMAKER_LABEL = 'Joyeuses fêtes !',
    TITLE_BUILTIN_MERRYMAKER_FORMAT_MALE = '%s le joyeux',
    TITLE_BUILTIN_MERRYMAKER_FORMAT_FEMALE = '%s le joyeux',
    TITLE_BUILTIN_THE_LOVE_FOOL_LABEL = 'Liebesgott', --#--#--
    TITLE_BUILTIN_THE_LOVE_FOOL_FORMAT_MALE = '%s, Liebesgott', --#--#--
    TITLE_BUILTIN_THE_LOVE_FOOL_FORMAT_FEMALE = '%s, Liebesgöttin', --#--#--
    TITLE_BUILTIN_ELDER_LABEL = 'Duelliste',
    TITLE_BUILTIN_ELDER_FORMAT_MALE = 'Duelliste %s',
    TITLE_BUILTIN_ELDER_FORMAT_FEMALE = 'Duelliste %s',
    TITLE_BUILTIN_PATRON_LABEL = 'Parrain',
    TITLE_BUILTIN_PATRON_FORMAT_MALE = 'Parrain %s',
    TITLE_BUILTIN_PATRON_FORMAT_FEMALE = 'Marraine %s',
    TITLE_BUILTIN_FLAME_KEEPER_LABEL = 'Compétiteur',
    TITLE_BUILTIN_FLAME_KEEPER_FORMAT_MALE = 'Compétiteur %s',
    TITLE_BUILTIN_FLAME_KEEPER_FORMAT_FEMALE = 'Compétitrice %s',
    TITLE_BUILTIN_THE_LOREMASTER_LABEL = 'Maître des traditions',
    TITLE_BUILTIN_THE_LOREMASTER_FORMAT_MALE = 'Maître des traditions %s',
    TITLE_BUILTIN_THE_LOREMASTER_FORMAT_FEMALE = 'Maître des traditions %s',
    TITLE_BUILTIN_CONQUEROR_BLACK_TEMPLE_LABEL = 'Bezwinger des Schwarzen Tempels', --#--#--
    TITLE_BUILTIN_CONQUEROR_BLACK_TEMPLE_FORMAT_MALE = '%s, Bezwinger des Schwarzen Tempels', --#--#--
    TITLE_BUILTIN_CONQUEROR_BLACK_TEMPLE_FORMAT_FEMALE = '%s, Bezwingerin des Schwarzen Tempels', --#--#--
    TITLE_BUILTIN_CONQUEROR_OF_OUTLAND_LABEL = 'Eroberer der Scherbenwelt', --#--#--
    TITLE_BUILTIN_CONQUEROR_OF_OUTLAND_FORMAT_MALE = '%s, Eroberer der Scherbenwelt', --#--#--
    TITLE_BUILTIN_CONQUEROR_OF_OUTLAND_FORMAT_FEMALE = '%s, Eroberin der Scherbenwelt', --#--#--
    TITLE_BUILTIN_CHAMPION_OF_THE_NAARU_LABEL = 'Champion des naaru',
    TITLE_BUILTIN_CHAMPION_OF_THE_NAARU_FORMAT_MALE = 'Champion der Naaru %s', --#--#--
    TITLE_BUILTIN_CHAMPION_OF_THE_NAARU_FORMAT_FEMALE = 'Champion der Naaru %s', --#--#--
    TITLE_BUILTIN_HAND_OF_ADAL_LABEL = 'Main d\'A\'dal',
    TITLE_BUILTIN_HAND_OF_ADAL_FORMAT_MALE = 'Hand von A\'dal %s', --#--#--
    TITLE_BUILTIN_HAND_OF_ADAL_FORMAT_FEMALE = 'Hand von A\'dal %s', --#--#--
    TITLE_BUILTIN_HERO_OF_OUTLAND_LABEL = 'Held der Scherbenwelt', --#--#--
    TITLE_BUILTIN_HERO_OF_OUTLAND_FORMAT_MALE = 'Held der Scherbenwelt %s', --#--#--
    TITLE_BUILTIN_HERO_OF_OUTLAND_FORMAT_FEMALE = 'Heldin der Scherbenwelt %s', --#--#--
    TITLE_BUILTIN_GREAT_HERO_OF_OUTLAND_LABEL = 'Großartiger Held der Scherbenwelt', --#--#--
    TITLE_BUILTIN_GREAT_HERO_OF_OUTLAND_FORMAT_MALE = 'Großartiger Held der Scherbenwelt %s', --#--#--
    TITLE_BUILTIN_GREAT_HERO_OF_OUTLAND_FORMAT_FEMALE = 'Großartige Heldin der Scherbenwelt %s', --#--#--
    TITLE_BUILTIN_BREWMASTER_LABEL = 'Maître brasseur',
    TITLE_BUILTIN_BREWMASTER_FORMAT_MALE = 'Maître brasseur %s',
    TITLE_BUILTIN_BREWMASTER_FORMAT_FEMALE = 'Maître brasseur %s',
    -- End built-in title catalog
}

SexyLib:InitLocalization('Anniversary Achievements', L)
