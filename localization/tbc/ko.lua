local _, ns = ...
if not (ns and ns.IsTBCAnniversary) then return end

if GetLocale() ~= 'koKR' then return end

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

    GEAR_SLOT_HEAD = '머리',
    GEAR_SLOT_NECK = '목',
    GEAR_SLOT_SHOULDER = '어깨',
    GEAR_SLOT_CHEST = '가슴',
    GEAR_SLOT_WAIST = '허리',
    GEAR_SLOT_LEGS = '다리',
    GEAR_SLOT_FEET = '발',
    GEAR_SLOT_WRIST = '손목',
    GEAR_SLOT_HANDS = '손',
    GEAR_SLOT_FIRST_RING = '오른쪽 반지',
    GEAR_SLOT_SECOND_RING = '왼쪽 반지',
    GEAR_SLOT_FIRST_TRINKET = '첫 번째 장신구',
    GEAR_SLOT_SECOND_TRINKET = '두 번째 장신구',
    GEAR_SLOT_CLOAK = '망토',
    GEAR_SLOT_WEAPON = '무기',

    NPC_3444 = 'Grubenratte', --#--#--
    NPC_620 = '닭',
    NPC_1420 = '두꺼비',
    NPC_13321 = '개구리',
    NPC_2620 = '땅다람쥐',
    NPC_9600 = '앵무새',
    NPC_883 = '사슴',
    NPC_9699 = '불딱정벌레',
    NPC_4953 = '늪살무사',
    NPC_721 = '토끼',
    NPC_9700 = '용암게',
    NPC_15476 = '전갈',
    NPC_2914 = '뱀',
    NPC_16030 = '구더기',
    NPC_4075 = '쥐',
    NPC_1412 = '다람쥐',
    NPC_7390 = 'Nymphensittich', --#--#--
    NPC_15475 = 'Käfer', --#--#--
    NPC_15010 = 'Dschungelkröte', --#--#--
    NPC_4076 = '바퀴',
    NPC_13016 = 'Untergrundratte', --#--#--
    NPC_14881 = '거미',
    NPC_2110 = 'Schwarze Ratte', --#--#--
    NPC_4166 = '가젤',
    NPC_1933 = '양',
    NPC_890 = '새끼 사슴',
    NPC_2098 = '산양',
    NPC_2442 = '소',
    NPC_6368 = '고양이',
    NPC_6271 = '생쥐',
    NPC_385 = 'Pferd', --#--#--
    NPC_10685 = '돼지',
    NPC_3300 = '살무사',
    NPC_15065 = 'Lady', --#--#--
    NPC_15066 = 'Cleo', --#--#--
    NPC_15071 = 'Schleicherpfote', --#--#--
    NPC_15072 = 'Spike', --#--#--

    CATEGORY_GENERAL = '일반',
    CATEGORY_QUESTS = '퀘스트',
	CATEGORY_PVP = '플레이어 대 플레이어',
    CATEGORY_KALIMDOR = '칼림도어',
    CATEGORY_EASTERN_KINGDOMS = '동부 왕국',
    CATEGORY_OUTLAND = '아웃랜드',
    CATEGORY_VANILLA = '오리지널',
    CATEGORY_TBC = '불타는 성전',
    CATEGORY_EXPLORATION = '탐험',
    CATEGORY_PVE = '던전 및 공격대',
    CATEGORY_ARENA = '투기장',
    CATEGORY_BG_ALTERAC = '알터랙 계곡',
    CATEGORY_BG_WARSONG = '전쟁노래 협곡',
    CATEGORY_BG_ARATHI = '아라시 분지',
    CATEGORY_BG_EYE = '폭풍의 눈',
    CATEGORY_PROFESSIONS = '전문 기술',
    CATEGORY_REPUTATION = '평판',
	CATEGORY_EVENTS = '이벤트',
    CATEGORY_VALENTINES = '온누리에 사랑을',
    CATEGORY_LUNAR = '달의 축제',
    CATEGORY_NOBLEGARDEN = '귀족의 정원',
    CATEGORY_CHILDREN = '어린이 주간',
    CATEGORY_MIDSUMMER = '한여름 축제',
    CATEGORY_BREWFEST = '가을 축제',
    CATEGORY_HALLOWSEND = '할로윈 축제',
    CATEGORY_WINTERVEIL = '겨울맞이 축제',
    CATEGORY_FEATS_OF_STRENGTH = '위업',
	
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
	AN_WARLOCK_T2 = '천벌의 로브',
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

    AN_LVL = '%d레벨',
    AD_LVL = '%d레벨 달성',

    AN_BANK = '안전 예금',
    AD_BANK = '은행 가방 보관함 7개 구입',
    AC_BANK = '은행 가방 보관함 7개 구입',

    AN_QUESTS = '퀘스트 %d개 완료',
    AD_QUESTS = '퀘스트 %d개 완료',
    AC_QUESTS = 'Schließt %d Quests ab.', --#--#--

    AN_DAILY_QUESTS = '%d tägliche Quests abgeschlossen', --#--#--
    AD_DAILY_QUESTS = '일일 퀘스트 %d개 완료',
    AC_DAILY_QUESTS = 'Schließt %d tägliche Quests ab.', --#--#--

    AN_QUEST_GOLD5 = 'Glitzernde Belohnung', --#--#--
    AN_QUEST_GOLD10 = 'Sammler geprägter Münzen', --#--#--
    AN_QUEST_GOLD25 = 'Täglich Brot', --#--#--
    AN_QUEST_GOLD50 = 'Wohlverdientes Gold', --#--#--
    AN_QUEST_GOLD100 = 'Verdient durch Schweiß und Blut', --#--#--
    AN_QUEST_GOLD250 = 'Golddrucker', --#--#--
    AN_QUEST_GOLD500 = 'Angemessene Entlohnung', --#--#--
    AD_QUEST_GOLD = '퀘스트 보상으로 %d골드 획득',
    AC_QUEST_GOLD = 'Erhaltet %d Gold durch Questbelohnungen.', --#--#--

    AN_QUESTS_ZONE = '현자 %s',
    AD_QUESTS_ZONE = 'Schließt die Quest "%s" in %s ab.', --#--#--
    AD_QUESTS_ZONE_MULTI = 'Schließt die folgenden Quests in %s ab.', --#--#--
    AC_QUESTS_ZONE = 'Schließt die Quest "%s" ab.', --#--#--

    AZSHARA_1 = '아즈샤라',
    AZSHARA_2 = '아즈샤라',
    QUEST_3602 = 'Azsharit', --#--#--

    FELWOOD_1 = '악령의 숲',
    FELWOOD_2 = '악령의 숲',
    QUEST_5165 = 'Übergießen der Flammen des Schutzes', --#--#--
    QUEST_5385 = 'Die Überreste von Trey Lichtschmied', --#--#--

    DESOLACE_1 = '잊혀진 땅',
    DESOLACE_2 = '잊혀진 땅',
    QUEST_6027 = 'Buch der Uralten', --#--#--

    DUSTWALLOW_1 = '먼지진흙 습지대',
    DUSTWALLOW_2 = '먼지진흙 습지대',
    QUEST_1203 = 'Jarl braucht eine Klinge', --#--#--

    SILITHUS_1 = '실리더스',
    SILITHUS_2 = '실리더스',
    QUEST_8287 = 'Ein teuflischer Plan', --#--#--
    QUEST_8352 = 'Szepter des Rates', --#--#--
    QUEST_8321 = 'Vyral der Üble', --#--#--
    QUEST_8281 = 'Verstärkte Sicherheit', --#--#--

    DUROTAR_1 = '듀로타',
    DUROTAR_2 = '듀로타',
    QUEST_835 = 'Sicherung der Linien', --#--#--

    BARRENS_1 = '불모의 땅',
    BARRENS_2 = '불모의 땅',
    QUEST_888 = 'Gestohlene Beute', --#--#--
    QUEST_902 = 'Samophlang', --#--#--

    WINTERSPRING_1 = '여명의 설원',
    WINTERSPRING_2 = '여명의 설원',
    QUEST_975 = 'Behälter von Mau\'ari', --#--#--
    QUEST_5082 = 'Bedrohung durch die Winterfelle', --#--#--
    QUEST_5121 = 'Oberhäuptling der Winterfelle', --#--#--
    QUEST_5163 = 'Sind wir endlich da, Yeti?', --#--#--
    QUEST_4842 = 'Sonderbare Quellen', --#--#--

    TANARIS_1 = '타나리스',
    TANARIS_2 = '타나리스',
    QUEST_2662 = '노겐포저의 비약',
    QUEST_2874 = 'Lieferung für MacKinley', --#--#--
    QUEST_1691 = 'Noch mehr Wüstenläufergerechtigkeit', --#--#--
    QUEST_113 = 'Insektenteil-Analyse', --#--#--

    STONETALON_1 = '돌발톱 산맥',
    STONETALON_2 = '돌발톱 산맥',
    QUEST_1096 = 'Gerenzo Pfeifzang', --#--#--

    UNGORO_1 = '운고로 분화구',
    UNGORO_2 = '운고로 분화구',
    QUEST_3962 = 'Allein ist es gefährlich', --#--#--
    QUEST_4245 = 'Chasing A-Me 01', --#--#--
    QUEST_4292 = 'Ein Köder für Lar\'korwi', --#--#--

    THOUSAND_NEEDLES_1 = '버섯구름 봉우리',
    THOUSAND_NEEDLES_2 = '버섯구름 봉우리',
    QUEST_1189 = 'Sicherheit zuerst', --#--#--

    ARATHI_1 = '아라시 고원',
    ARATHI_2 = '아라시 고원',
    QUEST_652 = 'Den Hauptstein zerbrechen', --#--#--

    BADLANDS_1 = '황야의 땅',
    BADLANDS_2 = '황야의 땅',
    QUEST_737 = 'Verbotenes Wissen', --#--#--
    QUEST_778 = 'Das wird schwierig', --#--#--
    QUEST_656 = 'Beschwören der Prinzessin', --#--#--
	QUEST_793 = 'Zerbrochene Allianzen', --#--#--
	QUEST_717 = 'Erdbeben', --#--#--
    
    EASTERN_PLAGUELANDS_1 = '동부 역병지대',
    EASTERN_PLAGUELANDS_2 = '동부 역병지대',
    QUEST_5942 = 'Versteckte Schätze', --#--#--
    QUEST_6148 = 'Das Scharlachrote Orakel Demetria', --#--#--
    QUEST_6187 = 'Ordnung muss wieder hergestellt werden', --#--#--
    QUEST_5265 = 'Der Argentumtresor', --#--#--

    BLASTED_LANDS_1 = '저주받은 땅',
    BLASTED_LANDS_2 = '저주받은 땅',
    QUEST_3628 = 'Ihr seid Rakh\'likh, Dämon', --#--#--

    STRANGLETHORN_VALLEY_1 = '가시덤불 골짜기',
    STRANGLETHORN_VALLEY_2 = '가시덤불 골짜기',
    QUEST_208 = '나 이런 사냥꾼이야!',
    QUEST_600 = 'Venture Company-Bergbau', --#--#--
    QUEST_613 = 'Maurys Fuß aufbrechen', --#--#--
    QUEST_628 = 'Exzelsior', --#--#--
    QUEST_338 = '가시덤불 골짜기의 푸른 언덕',
	
	AN_NESINGWARY = '가시덤불 골짜기의 푸른 언덕',
	AD_NESINGWARY = '가시덤불 골짜기의 헤멧 네싱워리 퀘스트를 "가시덤불 골짜기의 푸른 언덕" 및 "대단한 사냥꾼"까지 모두 완료',

    WESTERN_PLAGUELANDS_1 = '서부 역병지대',
    WESTERN_PLAGUELANDS_2 = '서부 역병지대',
    QUEST_5944 = 'In den Träumen', --#--#--
    QUEST_5051 = 'Zwei Hälften vereint', --#--#--
    QUEST_4985 = 'Die Tierwelt leidet auch', --#--#--

    SEARING_GORGE_1 = '이글거리는 협곡',
    SEARING_GORGE_2 = '이글거리는 협곡',
    QUEST_3481 = 'Plunder...', --#--#--

    BLACK_ROCK_1 = '검은바위 산',
    BLACK_ROCK_2 = '검은바위 산',
    QUEST_8996 = 'Rückkehr zu Bodley', --#--#--

    AN_WISDOM_KEEPER = '현자',
    AD_WISDOM_KEEPER = '아래 나열된 퀘스트 업적 완료',
    AN_WISDOM_KEEPER_AZEROTH = '현자',
    AD_WISDOM_KEEPER_AZEROTH = '아래 나열된 퀘스트 업적 완료',
    AN_WISDOM_KEEPER_KALIMDOR = '칼림도어의 현자',
    AD_WISDOM_KEEPER_KALIMDOR = '아래 나열된 퀘스트 업적 완료',
    AN_WISDOM_KEEPER_EASTERN_KINGDOMS = '동부 왕국의 현자',
    AD_WISDOM_KEEPER_EASTERN_KINGDOMS = '아래 나열된 퀘스트 업적 완료',
    AN_WISDOM_KEEPER_OUTLAND = '아웃랜드의 현자',
    AD_WISDOM_KEEPER_OUTLAND = '아래 나열된 아웃랜드 퀘스트 업적 완료',

    AN_RAGEFIRE_CHASM = '성난불길 협곡',
    AD_RAGEFIRE_CHASM = '욕망의 타라가만 처치',
    AN_WAILING_CAVERNS = '통곡의 동굴',
    AD_WAILING_CAVERNS = '걸신들린 무타누스 처치',
    AN_DEAD_MINES = '죽음의 폐광',
    AD_DEAD_MINES = '에드윈 밴클리프 처치',
    AN_SHADOWFANG_KEEP = '그림자송곳니 성채',
    AD_SHADOWFANG_KEEP = '대마법사 아루갈 처치',
    AN_BLACKFATHOM_DEEPS = '검은심연 나락',
    AD_BLACKFATHOM_DEEPS = '아쿠마이 처치',
    AN_JAIL = '스톰윈드 지하감옥',
    AD_JAIL = '바질 스레드 처치',
    AN_GNOMREGAN = '놈리건',
    AD_GNOMREGAN = '멕기니어 텔마플러그 처치',
    AN_RAZORFEN_KRAUL = '가시덩굴 우리',
    AD_RAZORFEN_KRAUL = '서슬깃 차를가 처치',
    AN_SCARLET_MONASTERY = '붉은십자군 수도원',
    AD_SCARLET_MONASTERY = '붉은십자군 수도원에서 붉은십자군 처치',
    AC_SCARLET_MONASTERY1 = '혈법사 탈노스',
    AC_SCARLET_MONASTERY2 = '신비술사 도안',
    AC_SCARLET_MONASTERY3 = '헤로드',
    AC_SCARLET_MONASTERY4 = '붉은십자군 사령관 모그레인',
    AC_SCARLET_MONASTERY5 = '종교재판관 화이트메인',
	
    AN_RAZORFEN_DOWNS = '가시덩굴 구릉',
    AD_RAZORFEN_DOWNS = '혹한의 암네나르 처치',
    AN_ULDAMAN = '울다만',
    AD_ULDAMAN = '아카에다스 처치',
    AN_ZULFARRAK = '줄파락',
    AD_ZULFARRAK = '족장 우코르즈 샌드스칼프 처치',
    AN_MARAUDON = '마라우돈',
    AD_MARAUDON = '공주 테라드라스 처치',
    AN_SUNKEN_TEMPLE = '가라앉은 사원',
    AD_SUNKEN_TEMPLE = '에라니쿠스의 사령 처치',
	
    AN_NEW_EMPEROR = '검은바위 나락',
    AD_NEW_EMPEROR = '제왕 다그란 타우릿산 처치',
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
	
    AN_BLACKROCK_SPIRE_BOTTOM = '검은바위 첨탑 하층',
    AD_BLACKROCK_SPIRE_BOTTOM = '대군주 웜타라크 처치',
    AN_BLACKROCK_SPIRE_UPPER = '검은바위 첨탑 상층',
    AD_BLACKROCK_SPIRE_UPPER = '사령관 드라키사스 처치',
    AN_BLACKROCK_SPIRE = 'Eindringling der Schwarzfelsspitze', --#--#--
    AD_BLACKROCK_SPIRE = 'Schließt die unten aufgelisteten Erfolge in der Schwarzfelsspitze ab.', --#--#--
    AN_DIRE_MAUL = '혈투의 전장의 왕',
    AD_DIRE_MAUL = '혈투의 전장 각 우두머리 처치',
    AC_DIRE_MAUL1 = '칼날바람 알진',
    AC_DIRE_MAUL2 = '이몰타르',
    AC_DIRE_MAUL3 = '왕 고르독',
    AN_STRATHOLME = '스트라솔름',
    AD_STRATHOLME = '스트라솔름에 거주하는 악의 무리 처치',
	AC_STRATHOLME1 = '발나자르',
	AC_STRATHOLME2 = '남작 리븐데어',
    AN_SCHOLOMANCE = '스칼로맨스',
    AD_SCHOLOMANCE = '스칼로맨스 우두머리 모두 처치',
	AC_SCHOLOMANCE1 = '암흑스승 간들링',
	AC_SCHOLOMANCE2 = '라스 프로스트위스퍼',
    AN_YOUNG_DEFENDER = '월드 오브 워크래프트 던전 전문가',
    AD_YOUNG_DEFENDER = '아래 나열된 월드 오브 워크래프트 던전 업적 완료',
    AN_DEFENDER = 'Verteidiger von Azeroth', --#--#--
    AD_DEFENDER = 'Schließt die unten aufgelisteten Dungeon-Erfolge ab.', --#--#--
    AR_DEFENDER = 'Verteidiger von Azeroth', --#--#--

    AN_ONYXIA = '오닉시아의 둥지',
    AD_ONYXIA = 'Bezwingt Onyxia.', --#--#--
    AN_AQ20 = '안퀴라즈 폐허',
    AD_AQ20 = '무적의 오시리안 처치',
    AN_ZULGURUB = '줄구룹',
    AD_ZULGURUB = '학카르 처치',
    AN_RAGNAROS = '화산 심장부',
    AD_RAGNAROS = '라그나로스 처치',
    AN_BLACK_WING_LAIR = '검은날개 둥지',
    AD_BLACK_WING_LAIR = '네파리안 처치',
    AN_AQ40 = '안퀴라즈 사원',
    AD_AQ40 = '쑨 처치',
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

    AN_PVP_RANK_A1 = '정찰병',
    AN_PVP_RANK_A2 = '파수병',
    AN_PVP_RANK_A3 = '수호병',
    AN_PVP_RANK_A4 = '정예근위병',
    AN_PVP_RANK_A5 = '하급기사',
    AN_PVP_RANK_A6 = '기사',
    AN_PVP_RANK_A7 = '상급기사',
    AN_PVP_RANK_A8 = '기사대장',
    AN_PVP_RANK_A9 = '기사단장',
    AN_PVP_RANK_A10 = '부사령관',
    AN_PVP_RANK_A11 = '사령관',
    AN_PVP_RANK_A12 = '작전사령관',
    AN_PVP_RANK_A13 = '야전사령관',
    AN_PVP_RANK_A14 = '최고사령관',
    AN_PVP_RANK_H1 = '척후병',
    AN_PVP_RANK_H2 = '그런트',
    AN_PVP_RANK_H3 = '수호병',
    AN_PVP_RANK_H4 = '정예수호병',
    AN_PVP_RANK_H5 = '하급투사',
    AN_PVP_RANK_H6 = '투사',
    AN_PVP_RANK_H7 = '혈투사',
    AN_PVP_RANK_H8 = '용사',
    AN_PVP_RANK_H9 = '백인대장',
    AN_PVP_RANK_H10 = '부사령관',
    AN_PVP_RANK_H11 = '사령관',
    AN_PVP_RANK_H12 = '전투사령관',
    AN_PVP_RANK_H13 = '장군',
    AN_PVP_RANK_H14 = '대장군',
    AD_PVP_RANK = 'Den Titel "%s" erhalten.', --#--#--
    AN_PVP_FIRST_KILL = '명예로운 처치',
    AD_PVP_FIRST_KILL = '명예 승수 획득',
    AC_PVP_FIRST_KILL = '명예 승수 획득',
    AN_PVP_KILLS = '명예 승수 %d',
    AD_PVP_KILLS = '명예 승수 %d',
    AC_PVP_KILLS = '명예 승수 %d',

    AN_MOB_KILLS_1 = 'Totschläger', --#--#--
    AN_MOB_KILLS_2 = 'Zerstörer', --#--#--
    AN_MOB_KILLS_3 = 'Brecher', --#--#--
    AN_MOB_KILLS_4 = 'Kopfgeldjäger', --#--#--
    AN_MOB_KILLS_5 = 'Gewittersturm aller Monster', --#--#--
    AN_MOB_KILLS_6 = 'Gewittersturm allen Lebens', --#--#--
    AN_MOB_KILLS_7 = 'Allgegenwärtiger Tod', --#--#--
    AD_MOB_KILLS = 'Tötet %d Gegner.', --#--#--
    AC_MOB_KILLS = 'Tötet %d Gegner', --#--#--

    AN_REPS_1 = '후... 이놈의 인기란...',
    AD_REPS_1 = '확고한 동맹 평판 획득',
    AC_REPS_1 = '확고한 동맹 평판 획득',
    AN_REPS_X = '확고한 동맹',
    AD_REPS = '%d개 세력과 확고한 동맹 달성',
    AC_REPS = 'Erreicht bei %d Fraktionen einen ehrfürchtigen Ruf.', --#--#--
    AR_REPS = 'Der Ehrfurchtgebietende', --#--#--

    AN_HORDE_REPS = '호드의 대사',
    AD_HORDE_REPS = '5개 아군 대도시 확고한 동맹',
    AC_HORDE_REPS_1 = '오그리마 확고한 동맹',
    AC_HORDE_REPS_2 = '검은창 트롤 확고한 동맹',
    AC_HORDE_REPS_3 = '언더시티 확고한 동맹',
    AC_HORDE_REPS_4 = '썬더 블러프 확고한 동맹',
    AC_HORDE_REPS_5 = '실버문 확고한 동맹',

    AN_ALLIANCE_REPS = '얼라이언스의 대사',
    AD_ALLIANCE_REPS = '5개 아군 대도시 확고한 동맹',
    AC_ALLIANCE_REPS_1 = '스톰윈드 확고한 동맹',
    AC_ALLIANCE_REPS_2 = '다르나서스 확고한 동맹',
    AC_ALLIANCE_REPS_3 = '놈리건 확고한 동맹',
    AC_ALLIANCE_REPS_4 = '아이언포지 확고한 동맹',
    AC_ALLIANCE_REPS_5 = '엑소다르 확고한 동맹',

    AN_ARGENT_DAWN = '은빛 여명회',
    AD_ARGENT_DAWN = '은빛 여명회 확고한 동맹',
    AN_BROOD_OF_NOZDORMU = '노즈도르무 혈족',
    AD_BROOD_OF_NOZDORMU = '노즈도르무 혈족 확고한 동맹',
    AN_DARKMOON_FAIRE = 'Dunkelmond-Jahrmarkt', --#--#--
    AD_DARKMOON_FAIRE = 'Erreicht beim Dunkelmond-Jahrmarkt den Status ehrfürchtig.', --#--#--
    AN_ZANDALAR_TRIBE = '잔달라 부족',
    AD_ZANDALAR_TRIBE = '잔달라 부족 확고한 동맹',
    AN_HYDRAXIANS = '히드락시안 물의 군주',
    AD_HYDRAXIANS = '히드락시안 물의 군주 확고한 동맹',
    AN_TIMBERMAW_HOLD = '동굴 속에서도 이 놈의 인기란...',
    AD_TIMBERMAW_HOLD = '나무구렁 요새 확고한 동맹',
    AN_THORIUM = '토륨 대장조합',
    AD_THORIUM = 'Erreicht bei der Thoriumbruderschaft den Status ehrfürchtig.', --#--#--
    AN_SHENDRALAR = 'Agent der Shen\'dralar', --#--#--
    AD_SHENDRALAR = 'Erreicht bei den Shen\'dralar den Status ehrfürchtig.', --#--#--
    AN_CENARION = '세나리온 의회',
    AD_CENARION = 'Erreicht beim Zirkel des Cenarius den Status ehrfürchtig.', --#--#--

    AN_DEFILERS = '파멸자',
    AD_DEFILERS = '포세이큰 파멸단 확고한 동맹',
    AN_FROSTWOLF_CLAN = '서리늑대부족 영웅',
    AD_FROSTWOLF_CLAN = '서리늑대부족 확고한 동맹',
    AN_WARSONG_OUTRIDERS = '전쟁노래 정찰대',
    AD_WARSONG_OUTRIDERS = '전쟁노래 정찰대 확고한 동맹',
    AN_HORDE_PVP_FRACTIONS = '정복자',
    AD_HORDE_PVP_FRACTIONS = '전쟁노래 협곡, 아라시 분지, 알터랙 계곡 확고한 동맹',

    AN_LEAGUE_OF_ARATHOR = '아라소르의 기사',
    AD_LEAGUE_OF_ARATHOR = '아라소르 연맹 확고한 동맹',
    AN_STORMSPIKE_GUARD = '스톰파이크 경비대의 영웅',
    AD_STORMSPIKE_GUARD = '스톰파이크 경비대 확고한 동맹',
    AN_SILVERWING_SENTINELS = '은빛날개 파수대',
    AD_SILVERWING_SENTINELS = '은빛날개 파수대 확고한 동맹',
    AN_ALLIANCE_PVP_FRACTIONS = '심판관',
    AD_ALLIANCE_PVP_FRACTIONS = '전쟁노래 협곡, 아라시 분지, 알터랙 계곡 확고한 동맹',

    AN_BOLVAR_SLAYER = '스톰윈드 침공',
    AD_BOLVAR_SLAYER = '대영주 볼바르 폴드라곤 처치',
    AN_MAGNI_SLAYER = '국왕에게 죽음을!',
    AD_MAGNI_SLAYER = '국왕 마그니 브론즈비어드 처치',
    AN_TYRANDE_SLAYER = '불사신은 없다!',
    AD_TYRANDE_SLAYER = '대여사제 티란데 위스퍼윈드 처치',
    AN_VELEN_SLAYER = '빛의 소멸',
    AD_VELEN_SLAYER = '예언자 벨렌 처치',

    AN_ALLIANCE_KINGS_SLAYER = '호드를 위하여!',
    AD_ALLIANCE_KINGS_SLAYER = '얼라이언스 수장 처치',

    AN_THRALL_SLAYER = '대족장에게 죽음을!',
    AD_THRALL_SLAYER = '스랄 처치',
    AN_SYLVANAS_SLAYER = '어둠의 여왕 처치',
    AD_SYLVANAS_SLAYER = '여군주 실바나스 윈드러너 처치',
    AN_CAIRNE_SLAYER = '피흘리는 블러드후프',
    AD_CAIRNE_SLAYER = '케른 블러드후프 처치',
    AN_LORTHEMAR_SLAYER = '쿠엘탈라스의 굴욕',
    AD_LORTHEMAR_SLAYER = '로르테마르 테론 처치',

    AN_HORDE_KINGS_SLAYER = '얼라이언스를 위하여!',
    AD_HORDE_KINGS_SLAYER = '호드 수장 처치',

    AN_RACES_KILLER = '적을 알고 나를 알면',
    AD_ALLIANCE_RACES_KILLER = '다섯 종족 캐릭터를 상대로 명예 승수, 결정타 획득',
    AD_HORDE_RACES_KILLER = '다섯 종족 캐릭터를 상대로 명예 승수, 결정타 획득',
    AC_HUMAN_KILLED = '인간',
    AC_NIGHTELF_KILLED = '나이트 엘프',
    AC_DWARF_KILLED = '드워프',
    AC_GNOME_KILLED = '노움',
    AC_ORC_KILLED = '오크',
    AC_TROLL_KILLED = '트롤',
    AC_SCOURGE_KILLED = '언데드',
    AC_TAUREN_KILLED = '타우렌',
    AC_DRAENEI_KILLED = '드레나이',
    AC_BLOODELF_KILLED = '블러드 엘프',

    AN_CLASSES_KILLER = '직업 불균형 해결사',
    AD_CLASSES_KILLER = '각 직업 캐릭터를 상대로 명예 승수, 결정타 획득',
    AC_WARRIOR_KILLED = '전사',
    AC_HUNTER_KILLED = '사냥꾼',
    AC_ROGUE_KILLED = '도적',
    AC_PRIEST_KILLED = '사제',
    AC_MAGE_KILLED = '마법사',
    AC_WARLOCK_KILLED = '흑마법사',
    AC_DRUID_KILLED = '드루이드',
    AC_PALADIN_KILLED = '성기사',
    AC_SHAMAN_KILLED = '주술사',

    AN_ALTERAC_WIN = '알터랙 계곡 승리',
    AD_ALTERAC_WIN = '알터랙 계곡 승리',
    AN_ALTERAC_WINS = '알터랙 계곡 역전용사',
    AD_ALTERAC_WINS = 'Erringt %d Siege im Alteractal.', --#--#--
    AN_WARSONG_WIN = '전쟁노래 협곡 승리',
    AD_WARSONG_WIN = '전쟁노래 협곡 승리',
    AN_WARSONG_WINS = '전쟁노래 협곡 역전용사',
    AD_WARSONG_WINS = '전쟁노래 협곡 %d승',
    AN_ARATHI_WIN = '아라시 분지 승리',
    AD_ARATHI_WIN = '아라시 분지 승리',
    AN_ARATHI_WINS = '아라시 분지 역전용사',
    AD_ARATHI_WINS = '아라시 분지 %d승',
    AN_EYE_WIN = '폭풍의 눈 승리',
    AD_EYE_WIN = '폭풍의 눈 승리',
    AN_EYE_WINS = '폭풍의 눈 역전용사',
    AD_EYE_WINS = 'Erringt %d Siege im Auge des Sturms.', --#--#--

    AN_ALTERAC_KILLING_BLOWS = 'Fleischwolf des Alteractals', --#--#--
    AD_ALTERAC_KILLING_BLOWS = 'Erreicht %d Todesstöße während einer einzigen Schlacht im Alteractal und bleibt bis zu deren Ende.', --#--#--
    AN_ALTERAC_GRAVEYARD_ASSAULT = '알터랙 도굴꾼',
    AD_ALTERAC_GRAVEYARD_ASSAULT = '알터랙 계곡 무덤 50회 점령',
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
    AN_ALTERAC_AUTOGRAPH = '구하는 자, 전리품을 얻으리라!',
    AD_ALTERAC_AUTOGRAPH = '알터랙 계곡에서 전리품으로 \'서명된 티굴의 사진\' 획득',

    AN_WARSONG_KILLS = 'Militärische Auszeichnung', --#--#--
    AD_WARSONG_KILLS = 'Erreicht %d ehrenhafte Siege während einer einzigen Schlacht in der Kriegshymnenschlucht und bleibt bis zu deren Ende.', --#--#--
    AN_WARSONG_FLAG_CAPTURE = '깃발 쟁취',
    AD_WARSONG_FLAG_CAPTURE = '전쟁노래 협곡에서 깃발 운반 및 쟁취',
    AN_WARSONG_FLAG_CAPTURES = 'Großartiger Flaggenträger', --#--#--
    AD_WARSONG_FLAG_CAPTURES = 'Ergreift und erobert %d gegnerische Flaggen während einer einzigen Schlacht in der Kriegshymnenschlucht und bleibt bis zu deren Ende.', --#--#--
    AN_WARSONG_FLAG_RETURN = 'Fasst das nicht an!', --#--#--
    AD_WARSONG_FLAG_RETURN = 'Bringt als Verteidiger eine Flagge während einer einzigen Schlacht in der Kriegshymnenschlucht zurück und bleibt bis zu deren Ende.', --#--#--
    AN_WARSONG_FLAG_RETURNS = '끈질긴 수호자',
    AD_WARSONG_FLAG_RETURNS = 'Bringt als Verteidiger %d Flaggen während einer einzigen Schlacht in der Kriegshymnenschlucht zurück und bleibt bis zu deren Ende.', --#--#--

    AN_ARATHI_BASE_ASSAULT = 'Konquistador', --#--#--
    AD_ARATHI_BASE_ASSAULT = 'Erobert eine Basis während einer einzigen Schlacht im Arathibecken und bleibt bis zu deren Ende.', --#--#--
    AN_ARATHI_BASE_ASSAULTS = '너와 내가 아니면 누가 뺏으랴!',
    AD_ARATHI_BASE_ASSAULTS = 'Erobert %d Basen während einer einzigen Schlacht im Arathibecken und bleibt bis zu deren Ende.', --#--#--
    AN_ARATHI_BASE_DEFEND = 'Beschützer', --#--#--
    AD_ARATHI_BASE_DEFEND = 'Verteidigt eine Basis während einer einzigen Schlacht im Arathibecken und bleibt bis zu deren Ende.', --#--#--
    AN_ARATHI_BASE_DEFENDS = 'Wächter', --#--#--
    AD_ARATHI_BASE_DEFENDS = 'Verteidigt %d Basen während einer einzigen Schlacht im Arathibecken und bleibt bis zu deren Ende.', --#--#--
    AN_ARATHI_CLOSE = '승리가 제일 쉬웠어요. *풉*',
    AD_ARATHI_CLOSE = '아라시 분지 자원 10점 차 승리 (1,600 대 1,590)',
    AN_ARATHI_PERFECT = '아라시 분지 완승',
    AD_ARATHI_PERFECT = '아라시 분지 1,600대 0 승리',

    AN_EYE_CAPTURE = '폭풍의 바람잡이',
    AD_EYE_CAPTURE = '폭풍의 눈에서 깃발 운반 및 쟁취',
    AD_EYE_CAPTURES = 'Ergreift und erobert persönlich %d Flaggen im Auge des Sturms und bleibt bis zum Ende der Schlacht.', --#--#--
    AN_EYE_GLORY = '영광을 향한 질주',
    AD_EYE_GLORY = '폭풍의 눈 단일 전투에서 죽지 않고 깃발 3회 쟁취',
    AN_EYE_FAST_WIN = '질풍',
    AD_EYE_FAST_WIN = '6분 안에 폭풍의 눈 승리',
    AN_EYE_BERSERK = '피에 굶주린 광전사',
    AD_EYE_BERSERK = '폭풍의 눈에서 광폭 강화 효과 상태로 결정타 획득',
    AN_EYE_IDEAL_VICTORY = '완벽한 폭풍',
    AD_EYE_IDEAL_VICTORY = '폭풍의 눈 1,600대 0 승리',

    AN_BGS_KILLING_BLOWS = '죽음의 인도자',
    AD_BGS_KILLING_BLOWS = 'Erringt %d Todesstöße auf einem beliebigen Schlachtfeld.', --#--#--
    AN_BGS_KILLS = '공포의 사신',
    AD_BGS_KILLS = 'Erringt %d ehrenhafte Siege auf einem beliebigen Schlachtfeld.', --#--#--

    PROF_FIRST_AID = '응급치료',
    PROF_FISHING = '낚시',
    PROF_COOKING = '요리',
    PROF_ENCHANTING = '마법부여',
    PROF_TAILORING = '재봉술',
    PROF_ENGINEERING = '기계공학',
    PROF_LEATHERWORKING = '가죽세공',
    PROF_ALCHEMY = '연금술',
    PROF_BLACKSMITHING = '대장기술',
    PROF_HERBALISM = '약초채집',
    PROF_MINING = '채광',
    PROF_SKINNING = '무두질',
    PROF_JEWELCRAFTING = '보석세공',
    SKILL_UNARMED = '맨손 전투',
    SKILL_RIDING = '탈것 타기',

    AN_PROFS_JOURNEYMAN = 'Lehrlingsprüfung', --#--#--
    AD_PROFS_JOURNEYMAN = 'Erlangt 75 Fertigkeitspunkte in einem Beruf.', --#--#--
    AN_PROFS_EXPERT = '전문 기술 수습 등급',
    AD_PROFS_EXPERT = '전문 기술 수습 등급 달성',
    AN_PROFS_ARTISAN = '전문 기술 숙련 등급',
    AD_PROFS_ARTISAN = '전문 기술 숙련 등급 달성',
    AN_PROFS_ONE = 'Professioneller Fachmann', --#--#--
    AD_PROFS_ONE = 'Erlangt 300 Fertigkeitspunkte in einem Beruf.', --#--#--
    AN_PROFS_ONE_OUTLAND = '전문 기술 대가',
    AD_PROFS_ONE_OUTLAND = '전문 기술 대가 되기',
    AN_PROFS_TWO = 'Handwerker', --#--#--
    AD_PROFS_TWO = 'Werdet gleichzeitig in zwei Berufen Fachmann.', --#--#--
    AC_PROFS_TWO = 'Werdet gleichzeitig in zwei Berufen Fachmann.', --#--#--
    AN_PROFS_TWO_OUTLAND = 'Handwerker der Scherbenwelt', --#--#--
    AD_PROFS_TWO_OUTLAND = 'Werdet gleichzeitig in zwei Berufen Meister.', --#--#--
    AC_PROFS_TWO_OUTLAND = 'Werdet gleichzeitig in zwei Berufen Meister.', --#--#--

    AN_FIRST_AID_JOURNEYMAN = 'Lehrling in Erster Hilfe', --#--#--
    AD_FIRST_AID_JOURNEYMAN = 'Erlangt 75 Fertigkeitspunkte in Erster Hilfe.', --#--#--
    AN_FIRST_AID_EXPERT = '수습 응급치료사',
    AD_FIRST_AID_EXPERT = '수습 응급치료사 되기',
    AN_FIRST_AID_ARTISAN = '숙련 응급치료사',
    AD_FIRST_AID_ARTISAN = '숙련 응급치료사 되기',
    AN_FIRST_AID_MASTER = 'Fachmann in Erster Hilfe', --#--#--
    AD_FIRST_AID_MASTER = 'Erlangt 300 Fertigkeitspunkte in Erster Hilfe.', --#--#--
    AN_FIRST_AID_OUTLAND_MASTER = '응급치료의 대가',
    AD_FIRST_AID_OUTLAND_MASTER = '응급치료의 대가 되기',
	
    AN_FISHING_JOURNEYMAN = 'Anglerlehrling', --#--#--
    AD_FISHING_JOURNEYMAN = 'Erlangt 75 Fertigkeitspunkte im Angeln.', --#--#--
    AN_FISHING_EXPERT = '수습 낚시꾼',
    AD_FISHING_EXPERT = '수습 낚시꾼 되기',
    AN_FISHING_ARTISAN = '숙련 낚시꾼',
    AD_FISHING_ARTISAN = '숙련 낚시꾼 되기',
    AN_FISHING_MASTER = '전문 낚시꾼',
    AD_FISHING_MASTER = '전문 낚시꾼 되기',
    AN_FISHING_OUTLAND_MASTER = '낚시의 대가',
    AD_FISHING_OUTLAND_MASTER = '낚시의 대가 되기',
	
    AN_COOKING_JOURNEYMAN = 'Kochlehrling', --#--#--
    AD_COOKING_JOURNEYMAN = 'Erlangt 75 Fertigkeitspunkte im Kochen.', --#--#--
    AN_COOKING_EXPERT = '수습 요리사',
    AD_COOKING_EXPERT = '수습 요리사 되기',
    AN_COOKING_ARTISAN = '숙련 요리사',
    AD_COOKING_ARTISAN = '숙련 요리사 되기',
    AN_COOKING_MASTER = '전문 요리사',
    AD_COOKING_MASTER = '전문 요리사 되기',
    AN_COOKING_OUTLAND_MASTER = '요리의 대가',
    AD_COOKING_OUTLAND_MASTER = '요리의 대가 되기',
	
    AN_PROFS_SECONDARY = '돈 버는 기술',
    AD_PROFS_SECONDARY = '낚시, 응급치료, 요리의 전문 되기',
    AN_PROFS_SECONDARY_OUTLAND = '돈 버는 기술',
    AD_PROFS_SECONDARY_OUTLAND = '낚시, 응급치료, 요리의 대가 되기',
    AN_PROFS_FIVE = 'Genie', --#--#--
    AN_PROFS_FIVE_OUTLAND = 'Genie der Scherbenwelt', --#--#--
    AD_PROFS_FIVE = 'Erlangt die unten aufgelisteten Berufserfolge.', --#--#--
    AN_UNARMED_SKILL = '주먹밥 시키신 분?',
    AD_UNARMED_SKILL = '맨손 전투 숙련도 350 달성',

    AN_EXPLORE_AZEROTH = '세계 탐험',
    AD_EXPLORE_AZEROTH = '동부 왕국, 칼림도어, 아웃랜드 탐험',
	AR_EXPLORER = 'Entdecker', --#--#--
    AN_EXPLORE_KALIMDOR = '칼림도어 탐험',
    AD_EXPLORE_KALIMDOR = '칼림도어 탐험',
    AN_EXPLORE_EASTERN_KINGDOMS = '동부 왕국 탐험',
    AD_EXPLORE_EASTERN_KINGDOMS = '동부 왕국 지역 탐험',
	AN_EXPLORE = 'Erforscht %s', --#--#--
    AD_EXPLORE = 'Erforscht %s und enthüllt die verdeckten Gebiete auf der Weltkarte.', --#--#--

    AN_SULFURAS = '설퍼라스 - 라그나로스의 손',
    AD_SULFURAS = '설퍼라스 - 라그나로스의 손을 부리는 자',
    AN_THUNDER_FURY = '우레폭풍 - 바람추적자의 성검',
    AD_THUNDER_FURY = '우레폭풍 - 바람추적자의 성검을 부리는 자',
    AN_ATIESH = '아티쉬 - 수호자의 지팡이',
    AD_ATIESH = '아티쉬 - 수호자의 지팡이를 부리는 자',
    AN_BLACK_SCARAB = '스카라베 군주',
    AD_BLACK_SCARAB = '안퀴라즈 성문 열기',
    AN_RED_SCARAB = '왜? 붉은색이니까!',
    AD_RED_SCARAB = '공명의 붉은 퀴라지 수정 획득',
	AN_TIGER_MOUNT = '날쌘 줄리안 호랑이',
    AD_TIGER_MOUNT = '줄구룹 대사제 데칼에게서 날쌘 줄리안 호랑이 획득',
	AN_RAPTOR_MOUNT = '날쌘 래즈자쉬 랩터',
    AD_RAPTOR_MOUNT = '줄구룹의 혈군주 만도키르에게서 날쌘 래즈자쉬 랩터 획득',
	AN_BARON_MOUNT = '죽음의 군마 고삐',
    AD_BARON_MOUNT = '스트라솔름의 남작 리븐데어에게서 죽음의 군마 고삐 획득',
	AN_SABER_MOUNT = '여명의 설원 눈호랑이',
    AD_SABER_MOUNT = '여명의 설원 눈호랑이 획득',
    AN_ARGENT_DAWN_TABARD = '은빛 여명회 휘장',
    AD_ARGENT_DAWN_TABARD = '스컬지 침공 이벤트에서 은빛 여명회 휘장 획득',
    
    AN_UNCOMMON_GEAR = 'Selten', --#--#--
    AD_UNCOMMON_GEAR = 'Legt an jedem Platz einen Gegenstand von seltener Qualität an.', --#--#--
    AN_RARE_GEAR = '최고급 장비',
    AD_RARE_GEAR = '모든 칸에 아이템 레벨 115 이상의 최고급 아이템 착용',
    AN_EPIC_GEAR = '영웅급 장비',
    AD_EPIC_GEAR = '모든 칸에 아이템 레벨 115 이상의 영웅급 아이템 착용',

    AN_STOCKING_UP = '물품 비축',
    AD_STOCKING_UP = '두꺼운 황천매듭 붕대 500개 만들기',
    AC_STOCKING_UP = 'Stellt 100 schwere Runenstoffverbände her', --#--#--
    AN_STOCKING_UP_2 = '물품 비축',
    AD_STOCKING_UP_2 = '두꺼운 룬매듭 붕대 500개 만들기',
    AC_STOCKING_UP_2 = '두꺼운 룬매듭 붕대 500개 만들기',
    AN_STOCKING_UP_OUTLAND = 'Vorbereitung für die Leere', --#--#--
    AD_STOCKING_UP_OUTLAND = 'Stellt 100 schwere Netherstoffverbände her.', --#--#--
    AC_STOCKING_UP_OUTLAND = 'Stellt 100 schwere Netherstoffverbände her', --#--#--
    AN_STOCKING_UP_2_OUTLAND = '물품 비축',
    AD_STOCKING_UP_2_OUTLAND = '두꺼운 황천매듭 붕대 500개 만들기',
    AC_STOCKING_UP_2_OUTLAND = '두꺼운 황천매듭 붕대 500개 만들기',

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
	
	AN_FISHING_COUNT = '%d개 낚기',
	AC_FISHING_COUNT = 'Angelt %d Gegenstände oder Fische.', --#--#--
	AD_FISHING_COUNT = '아이템 %d개 낚기',

    AN_COOKING_RECIPES_5 = '취사 당번',
    AN_COOKING_RECIPES_10 = '수습 주방장',
    AN_COOKING_RECIPES_25 = '주방장',
    AN_COOKING_RECIPES_50 = '선임 주방장',
    AN_COOKING_RECIPES_75 = 'Chef de Cuisine', --#--#--
    AR_COOKING_RECIPES = 'Chefkoch', --#--#--
    AD_COOKING_RECIPES = '요리 조리법 %d개 배우기',
    AC_COOKING_RECIPES = 'Lernt %d Kochrezepte', --#--#--

    AN_COOKING_SOUP = 'Suppenkocher', --#--#--
    AN_COOKING_DESSERT = 'Knollenmeister', --#--#--
    AN_COOKING_SQUID = 'Fang des Tages', --#--#--
    AN_COOKING_DUMPLINGS = 'Omas Knödel', --#--#--
    AN_COOKING_CAKE = '케이크를 정말로 준다니까요!',
    AD_COOKING_CAKE = '맛좋은 초콜릿 케이크 굽기',
    AD_COOKING_CREATE = 'Kocht %s %d-mal.', --#--#--
    AC_COOKING_CREATE = 'Kocht %s %d-mal', --#--#--
    AN_COOKING_BIG_TABLE = '요리사 만세!',
    AD_COOKING_BIG_TABLE = '아래 나열된 요리 업적 완료',

    AN_COOKING_FISHERMANS_FEAST = '낚시꾼의 별미',
    AN_COOKING_SPICY_HOT_TALBUK = '매콤한 양념 탈부크 구이',
    AN_COOKING_SKULLFISH_SOUP = '해골물고기 수프',
    AN_COOKING_RAVAGER_DOG = '칼날발톱 핫도그',

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

    AN_DUEL = '결투의 제왕',
    AD_DUEL = '다른 사람과의 결투에서 승리',
    AN_DUELS_10 = '결투사',
    AN_DUELS_25 = 'Geübter Duellist', --#--#--
    AN_DUELS_100 = 'Meister-Duellist', --#--#--
    AD_DUELS = 'Gewinnt in %d Duellen.', --#--#--
    AC_DUELS = 'Gewinnt in %d Duellen', --#--#--
    AN_GURUBASHI_1 = '구루바시 투기장 전문 검투사',
    AD_GURUBASHI_1 = '구루바시 투기장에서 전리품으로 "전문 검투사의 징표" 획득',
    AN_GURUBASHI_2 = '구루바시 투기장 최고검투사',
    AD_GURUBASHI_2 = '땅딸보 존 미스릴의 퀘스트를 완료하여 "최고검투사의 징표" 획득',
    AN_PARTICIPATE_IN_BGS = '전장으로!',
    AD_PARTICIPATE_IN_BGS = 'Schließt %d Schlachtfelder ab.', --#--#--
    AC_PARTICIPATE_IN_BGS = 'Schließt %d Schlachtfelder ab.', --#--#--

    EMOTE_LOVE1 = 'Ihr liebt %s.', --#--#--
    AN_LOVE = '내가 사랑했던 모든 다람쥐에게',
    AD_LOVE = '아제로스의 동물들에게 얼마나 /사랑 하는지 보여주기',
    AN_LOVE_TBC = '가까이 있든 멀리 있든, 모두 사랑스러워',
    AD_LOVE_TBC = '어둠의 문 너머에 있는 동물들에게 얼마나 사랑하는지 보여주세요 (/사랑).',
    NPC_22480 = '갈색 마모트',
    NPC_22306 = '새끼 동굴 거미',
    NPC_22842 = '코르백스',
    NPC_22843 = '루크',
    NPC_19665 = '암양',
    NPC_19154 = '검둥이',
    NPC_19482 = '세이건',
    NPC_20411 = '유령 소',
    EMOTE_PAT1 = 'Ihr streichelt %s.', --#--#--
    AN_ARATHI_CATS = 'Katzen sind am wichtigsten', --#--#--
    AD_ARATHI_CATS = 'Streichelt die angegebenen Haustiere im Arathibecken (/streicheln).', --#--#--

    AN_ALTERAC_FAST_WIN = '알터랙 급습',
    AD_ALTERAC_FAST_WIN = '6분 이내 알터랙 계곡 승리',
    AN_WARSONG_FAST_WIN = '전쟁노래부족의 승리',
    AD_WARSONG_FAST_WIN = '전쟁노래 협곡 전투 7분 안에 승리',
    AN_ARATHI_FAST_WIN = '끝장내기',
    AD_ARATHI_FAST_WIN = '6분 안에 아라시 분지 승리',

    AN_ALTERAC_TOWER_DEFEND_TOTAL = '철벽 수비',
    AD_ALTERAC_TOWER_DEFEND_TOTAL = '알터랙 계곡 경비탑 %d회 방어',
    AN_ALTERAC_GRAVEYARD_ASSAULT_TOTAL = '알터랙 도굴꾼',
    AD_ALTERAC_GRAVEYARD_ASSAULT_TOTAL = '알터랙 계곡 무덤 %d회 점령',
    AN_WARSONG_FLAG_CAPTURE_TOTAL = '깃발 쟁취',
    AD_WARSONG_FLAG_CAPTURE_TOTAL = 'Ergreift und erobert persönlich %d Flaggen in der Kriegshymnenschlucht.', --#--#--
    AN_WARSONG_FLAG_RETURN_TOTAL = '끈질긴 수호자',
    AD_WARSONG_FLAG_RETURN_TOTAL = '전쟁노래 협곡에서 깃발 %d회 반환',
    AN_ARATHI_BASE_ASSAULT_TOTAL = '너와 내가 아니면 누가 뺏으랴!',
    AD_ARATHI_BASE_ASSAULT_TOTAL = '아라시 분지 깃발 %d회 쟁취',
    AN_ARATHI_BASE_DEFEND_TOTAL = '구원의 손길',
    AD_ARATHI_BASE_DEFEND_TOTAL = '깃발 탈환 후 아라시 분지 거점 %d회 방어',
    AN_ALTERAC_MOUNT_HORDE = '전투 서리늑대',
    AD_ALTERAC_MOUNT_HORDE = '전투 서리늑대 획득',
    AN_ALTERAC_MOUNT_ALLIANCE = '스톰파이크 전투산양',
    AD_ALTERAC_MOUNT_ALLIANCE = '스톰파이크 전투산양 획득',

    AN_ALTERAC_BOSS = '알터랙 계곡의 지배자',
    AD_ALTERAC_BOSS = '아래 나열된 알터랙 계곡 업적 완료',
    AN_WARSONG_BOSS = '전쟁노래 협곡의 지배자',
    AD_WARSONG_BOSS = '아래 나열된 전쟁노래 협곡 업적 완료',
    AN_ARATHI_BOSS = '아라시 분지의 지배자',
    AD_ARATHI_BOSS = '아래 나열된 아라시 분지 업적 완료',
    AN_EYE_BOSS = '폭풍의 눈 지배자',
    AD_EYE_BOSS = '아래 나열된 폭풍의 눈 업적 완료',
    AN_BATTLEMASTER = '지휘관',
    AD_BATTLEMASTER = '아래 나열된 플레이어 대 플레이어 업적 완료',
    AR_BATTLEMASTER = '칭호: 지휘관',

    AN_LEEROY = '리.......... 로이!',
    AD_LEEROY = '15초 안에 부화장 새끼용 50마리 처치',
    AR_LEEROY = '칭호: 젠킨스',
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
	
	AN_PIRATES_HAT = '제독님, 안녕?',
	AD_PIRATES_HAT = '붉은해적단 제독 모자를 획득하여 가끔 신선한 바람 쐬기',
	AR_PIRATES_HAT = '칭호: 붉은해적단 제독',
	AN_PALADIN_MOUNT = '군마',
	AD_PALADIN_MOUNT = '군마 획득을 위한 성기사 퀘스트 완료',
	AN_WARLOCK_MOUNT = '소로스의 공포마',
	AD_WARLOCK_MOUNT = '흑마법사 퀘스트 소로스의 공포마 완료',
	
	AN_HALLOWSEND = '이름이 거룩히 여김을 받으소서',
	AD_HALLOWSEND = '아래 나열된 할로윈 업적 완료',
	AR_HALLOWSEND = '칭호: 성자',
	
	AN_PUMPKIN = 'Ziemlich gruselig', --#--#--
	AD_PUMPKIN = 'Erhaltet eine Kürbistasche während der Schlotternächte.', --#--#--
	AN_HALLOWSEND_ALLIANCE_QUEST1 = '부패한 할로윈',
	AD_HALLOWSEND_ALLIANCE_QUEST1 = '밀짚인형 축제를 방해하고 사우스쇼어에서 구린내 폭탄을 탈취하는 하사관 허트만 퀘스트를 완료하여 호드의 할로윈 축제 망치기',
	AC_HALLOWSEND_ALLIANCE_QUEST1_CRITERIA1 = '밀짚인형 축제 정탐',
	AC_HALLOWSEND_ALLIANCE_QUEST1_CRITERIA2 = '소나무의 힘',
	AN_HALLOWSEND_HORDE_QUEST1 = '부패한 할로윈',
	AD_HALLOWSEND_HORDE_QUEST1 = '사우스쇼어로 가서 썩은 달걀로 술통을 오염시키고 마을에 구린내 폭탄을 터뜨리는 암흑의 소환사 얀카 퀘스트를 수행하여 얼라이언스의 할로윈 축제 망치기',
	AC_HALLOWSEND_HORDE_QUEST1_CRITERIA1 = '엉망이 된 양조통',
	AC_HALLOWSEND_HORDE_QUEST1_CRITERIA2 = '사우스쇼어에 구린내 폭탄 투하',
	
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
	
	AN_HALLOWSEND_TREATS = '사탕 하나 주면 안 잡아먹지!',
	AD_HALLOWSEND_TREATS = '여관 안에 있는 사탕 바구니 중 하나에서 사탕 한 줌 얻기',
	
	AN_HALLOWSEND_MASK = '가면 쓰면...',
	AD_HALLOWSEND_MASK = '할로윈 축제 기간 동안 얇은 가면 획득',
	
	AN_HALLOWSEND_MASKS = '가면 수집가',
	AD_HALLOWSEND_MASKS = '아래 나열된 얇은 가면 20개 모으기',
	
	AN_HALLOWSEND_TRANSFORM = '가장무도회',
	AD_HALLOWSEND_TRANSFORM = '아래 나열된 할로윈 마법봉을 이용해 변신',
	AC_HALLOWSEND_GHOST = '할로윈 마법봉 - 유령',
	AC_HALLOWSEND_GNOME = '할로윈 마법봉 - 오염된 노움',
	AC_HALLOWSEND_WISP = '할로윈 마법봉 - 위습',
	AC_HALLOWSEND_NINJA = '할로윈 마법봉 - 자객',
	AC_HALLOWSEND_SKELETON = '할로윈 마법봉 - 해골',
	AC_HALLOWSEND_PIRATE = '할로윈 마법봉 - 해적',
	AC_HALLOWSEND_BAT = '할로윈 마법봉 - 박쥐',

    --WINTERVEIL
    AN_WINTERVEIL = '흥겨운 축제꾼',
	AD_WINTERVEIL = '아래 나열된 겨울맞이 축제 업적 완료',
	AR_WINTERVEIL = '칭호: 흥겨운 축제꾼',

    AN_WINTERVEIL_METZEN = '달려라 멧젠!',
	AD_WINTERVEIL_METZEN = '순록 멧젠 구하기',

    AN_WINTERVEIL_SMOKEYWOOD = '장난감을 찾아라!',
	AD_WINTERVEIL_SMOKEYWOOD = '굴뚝나무 목장조합의 도둑맞은 장난감을 찾아주고 보상으로 굴뚝나무 목장조합의 선물 받기',

    AN_WINTERVEIL_GOURMET = '겨울맞이 축제 미식가',
	AD_WINTERVEIL_GOURMET = '겨울맞이 축제 기간 동안 요리 기술을 활용하여 생강 과자빵, 에그노그, 따뜻한 사과맛 탄산수 만들기',
    AC_WINTERVEIL_GOURMET_CRITERIA1 = '생강 과자빵',
    AC_WINTERVEIL_GOURMET_CRITERIA2 = '에그노그',

    AN_WINTERVEIL_PRESENTS = '누가 착한 앤지 나쁜 앤지',
	AD_WINTERVEIL_PRESENTS = '겨울맞이 축제 트리 아래 있는 선물 중 하나 열기',

    AN_WINTERVEIL_SNOWBALL_ALLIANCE = '구두쇠',
	AD_WINTERVEIL_SNOWBALL_ALLIANCE = '겨울맞이 축제 기간 동안 국왕 마그니 브론즈비어드에게 눈뭉치 던지기',

    AN_WINTERVEIL_SNOWBALL_HORDE = '구두쇠',
	AD_WINTERVEIL_SNOWBALL_HORDE = '겨울맞이 축제 기간 동안 케른 블러드후프에게 눈뭉치 던지기',

    AN_WINTERVEIL_PVP = '내 친구의 꼬마 도우미',
    AD_WINTERVEIL_PVP = '겨울맞이 윈터볼트의 꼬마 도우미로서 명예 승수 50 획득',

    --VALENTINES
    AN_VALENTINES = 'Liebestoll', --#--#--
	AD_VALENTINES = 'Schließt die unten aufgelisteten Erfolge von \'Liebe liegt in der Luft\' ab.', --#--#--

    AN_VALENTINES_ROSES = 'Sag\'s mit Rosen', --#--#--
    AD_VALENTINES_ROSES = 'Erhaltet während der \'Liebe liegt in der Luft\'-Feierlichkeiten einen roten Rosenstrauß.', --#--#--

    AN_VALENTINES_QUEST = 'Gefährliche Liebschaft', --#--#--
    AD_VALENTINES_QUEST = 'Helft dem Dampfdruckkartell dabei, den Plan der Chemiemanufaktur Krone zu vereiteln.', --#--#--

    AN_VALENTINES_CHOCOLATES = 'Naschkatze', --#--#--
    AD_VALENTINES_CHOCOLATES = 'Probiert die unten aufgelisteten \'Liebe liegt in der Luft\'-Süßigkeiten.', --#--#--
    AC_VALENTINES_CHOCOLATES_CRITERIA1 = '광란의 욕망',
    AC_VALENTINES_CHOCOLATES_CRITERIA2 = '천사의 유혹',
    AC_VALENTINES_CHOCOLATES_CRITERIA3 = '달콤한 속삭임',
    AC_VALENTINES_CHOCOLATES_CRITERIA4 = '진한 산딸기 크림',

    AN_VALENTINES_DRESS = 'Das reizende Glück ist auf Eurer Seite', --#--#--
    AD_VALENTINES_DRESS = 'Öffnet einen reizenden Kleiderkarton und erhaltet ein reizendes schwarzes Kleid.', --#--#--

    AN_VALENTINES_PIDO = 'Perma-Pido', --#--#--
    AD_VALENTINES_PIDO = 'Erhaltet ein permanentes Q. Pido-Haustier, indem Ihr einen Echtsilberschaftpfeil erbeutet.', --#--#--

    --LUNAR
    AN_LUNAR = '장로 섬기기',
	AD_LUNAR = '아래 나열된 달의 축제 업적 완료',

    AN_LUNAR_COIN = '선조의 주화',
    AD_LUNAR_COIN = '선조의 주화 획득',

    AN_LUNAR_COINS = '선조의 주화 %d개',
    AD_LUNAR_COINS = '선조의 주화 %d개 획득',

    AN_LUNAR_QUEST = '엘룬의 축복',
    AD_LUNAR_QUEST = '오멘 처치 후 엘룬의 축복 퀘스트 완료',

    AN_LUNAR_CLOTHES = '달의 축제 의상',
    AD_LUNAR_CLOTHES = '선조의 주화로 달의 축제 의상 또는 축제 드레스 구입',

    AN_LUNAR_ELDERS_DUNGEONS = '던전의 장로',
    AD_LUNAR_ELDERS_DUNGEONS = '던전에 있는 장로 방문하기',
    AC_LUNAR_ELDERS_DUNGEONS_8727 = 'Urahne Fernwisper', --#--#--
    AC_LUNAR_ELDERS_DUNGEONS_8619 = 'Urahne Schwermut', --#--#--
    AC_LUNAR_ELDERS_DUNGEONS_8635 = 'Urahne Splitterfels', --#--#--
    AC_LUNAR_ELDERS_DUNGEONS_8713 = 'Urahne Sternensang', --#--#--
    AC_LUNAR_ELDERS_DUNGEONS_8644 = 'Urahne Steinwehr', --#--#--
    AC_LUNAR_ELDERS_DUNGEONS_8676 = 'Urahne Wildmähne', --#--#--

    AN_LUNAR_ELDERS_HORDE = '호드의 장로',
    AD_LUNAR_ELDERS_HORDE = '호드 대도시에 있는 장로 방문하기',
    AC_LUNAR_ELDERS_HORDE_8678 = '썬더 블러프 장로 윗후프',
    AC_LUNAR_ELDERS_HORDE_8648 = '언더시티 장로 다크코어',
    AC_LUNAR_ELDERS_HORDE_8677 = '오그리마 장로 다크혼',

    AN_LUNAR_ELDERS_ALLIANCE = '얼라이언스의 장로',
    AD_LUNAR_ELDERS_ALLIANCE = '얼라이언스 대도시에 있는 장로 방문하기',
    AC_LUNAR_ELDERS_ALLIANCE_8718 = '다르나서스 장로 블레이드스위프트',
    AC_LUNAR_ELDERS_ALLIANCE_8866 = '아이언포지 장로 브론즈비어드',
    AC_LUNAR_ELDERS_ALLIANCE_8646 = '스톰윈드 장로 해머스타우트',

    AN_LUNAR_ELDERS_EASTERN_KINGDOMS = '동부 왕국의 장로',
    AD_LUNAR_ELDERS_EASTERN_KINGDOMS = '동부 왕국에 있는 장로 방문하기',
    AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8636 = '불타는 평원 장로 럼버락',
    AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8651 = '이글거리는 협곡 장로 아이언밴드',
    AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8652 = '브릴 장로 그레이브본',
    AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8674 = '무법항 장로 윈터후프',
    AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8716 = '줄구룹 장로 스타글레이드',
    AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8643 = '동부 내륙지 장로 하이피크',
    AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8675 = '감시의 언덕 장로 스카이체이서',
    AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8649 = '황금골 장로 스톰브라우',
    AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8650 = '희망의 빛 예배당 장로 스노우크라운',
    AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8642 = '텔사마 장로 실버베인',
    AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8645 = '공동묘지 장로 옵시디안',
    AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8722 = '서부 역병지대 장로 메도런',
    AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8647 = '저주받은 땅 장로 벨로우레이지',
    AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8653 = '카라노스 장로 골드웰',
    AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8714 = '스칼로맨스 장로 문스트라이크',
    AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8688 = '동부 역병지대 장로 윈드런',
    AC_LUNAR_ELDERS_EASTERN_KINGDOMS_8683 = '화염 마루 장로 돈스트라이더',

    AN_LUNAR_ELDERS_KALIMDOR = '칼림도어의 장로',
    AD_LUNAR_ELDERS_KALIMDOR = '칼림도어에 있는 장로 방문하기',
    AC_LUNAR_ELDERS_KALIMDOR_8673 = '블러드후프 마을 장로 블러드후프',
    AC_LUNAR_ELDERS_KALIMDOR_8723 = '악령숲 장로 나이트윈드',
    AC_LUNAR_ELDERS_KALIMDOR_8684 = '가젯잔 장로 드림시어',
    AC_LUNAR_ELDERS_KALIMDOR_8726 = '여명의 설원 장로 브라이트스피어',
    AC_LUNAR_ELDERS_KALIMDOR_8725 = '아스트라나르 장로 리버송',
    AC_LUNAR_ELDERS_KALIMDOR_8715 = '돌라나르 장로 블레이드리프',
    AC_LUNAR_ELDERS_KALIMDOR_8681 = '운고로 분화구 장로 썬더혼',
    AC_LUNAR_ELDERS_KALIMDOR_8680 = '톱니항 장로 윈드토템',
    AC_LUNAR_ELDERS_KALIMDOR_8720 = '아즈샤라 장로 스카이글림',
    AC_LUNAR_ELDERS_KALIMDOR_8670 = '칼바위 언덕 장로 룬토템',
    AC_LUNAR_ELDERS_KALIMDOR_8672 = '눈망루 마을 장로 스톤스파이어',
    AC_LUNAR_ELDERS_KALIMDOR_8686 = '타우라조 야영지 장로 하이마운틴',
    AC_LUNAR_ELDERS_KALIMDOR_8654 = '실리더스 장로 프라임스톤',
    AC_LUNAR_ELDERS_KALIMDOR_8671 = '타나리스 장로 레이지토템',
    AC_LUNAR_ELDERS_KALIMDOR_8724 = '신기루 경주장 장로 모닝듀',
    AC_LUNAR_ELDERS_KALIMDOR_8685 = '혈투의 전장 장로 미스트워커',
    AC_LUNAR_ELDERS_KALIMDOR_8721 = '아우버다인 장로 스타위브',
    AC_LUNAR_ELDERS_KALIMDOR_8717 = '십자로 장로 문워든',
    AC_LUNAR_ELDERS_KALIMDOR_8719 = '세나리온 요새 장로 블레이드싱',
    AC_LUNAR_ELDERS_KALIMDOR_8682 = '높새바람 봉우리 장로 스카이시어',
    AC_LUNAR_ELDERS_KALIMDOR_8679 = '페랄라스 장로 그림토템',

    --NOBLEGARDEN
    AN_NOBLEGARDEN_CLOTHES = '일요 특선',
    AD_NOBLEGARDEN_CLOTHES = '귀족의 정원 축제 기간 동안 알록달록한 알에서 흰색 턱시도 셔츠와 검은색 턱시도 바지 획득',
    AC_NOBLEGARDEN_CLOTHES_CRITERIA1 = '흰색 턱시도 셔츠',
    AC_NOBLEGARDEN_CLOTHES_CRITERIA2 = '검은색 턱시도 바지',

    AN_NOBLEGARDEN_DRESS = '특별한 날의 의상',
    AD_NOBLEGARDEN_DRESS = '귀족의 정원 축제 기간 동안 알록달록한 알에서 우아한 드레스 획득',

    --CHILDRENS WEEK
    AN_CHILDREN = '어린이는 우리의 희망',
    AD_CHILDREN = '아래 나열된 어린이 주간 업적 완료',
    AR_CHILDREN = '칭호: 보모/후원자',

    AN_CHILDREN_PET = '너무 귀여워!',
    AD_CHILDREN_PET = '어린이 주간 보상 애완동물 하나 얻기',

    AN_CHILDREN_PETS = '노련한 보모',
    AD_CHILDREN_PETS = '한 캐릭터로 용용이 알, 잠꾸러기 왕눈이, 엘레크 조련용 목줄 획득',
    AC_CHILDREN_PETS1 = '엘레크 조련용 목줄',
    AC_CHILDREN_PETS2 = '잠꾸러기 왕눈이',
    AC_CHILDREN_PETS3 = '용용이 알',

    --MIDSUMMER
    AN_MIDSUMMER = '불꽃지기',
    AD_MIDSUMMER = '아래 나열된 한여름 축제 업적 완료',

    AN_MIDSUMMER_QUEST1 = '불꽃 축제의 제왕',
    AD_MIDSUMMER_QUEST1 = '적 진영 수도에서 불꽃을 훔쳐 "도적의 보상" 퀘스트 완료',

    AN_MIDSUMMER_AHUNE = '서리 군주 처치',
    AD_MIDSUMMER_AHUNE = '강제 노역소에서 아훈 처치',

    AN_MIDSUMMER_DESECRATION_HORDE = '얼라이언스 모독하기',
    AD_MIDSUMMER_DESECRATION_HORDE = '동부 왕국, 칼림도어, 아웃랜드 불꽃 끄기 업적 완료',

    AN_MIDSUMMER_DESECRATION_HORDE_KALIMDOR = '칼림도어 불꽃 끄기',
    AD_MIDSUMMER_DESECRATION_HORDE_KALIMDOR = '칼림도어에서 얼라이언스 화톳불 모독!',
    AC_MIDSUMMER_DESECRATION_HORDE_KALIMDOR_CRITERIA_11744 = '먼지진흙 습지대',
    AC_MIDSUMMER_DESECRATION_HORDE_KALIMDOR_CRITERIA_11734 = '잿빛 골짜기',
    AC_MIDSUMMER_DESECRATION_HORDE_KALIMDOR_CRITERIA_11738 = '핏빛안개 섬',
    AC_MIDSUMMER_DESECRATION_HORDE_KALIMDOR_CRITERIA_11740 = '어둠해안',
    AC_MIDSUMMER_DESECRATION_HORDE_KALIMDOR_CRITERIA_11746 = '페랄라스',
    AC_MIDSUMMER_DESECRATION_HORDE_KALIMDOR_CRITERIA_11760 = '실리더스',
    AC_MIDSUMMER_DESECRATION_HORDE_KALIMDOR_CRITERIA_11753 = '텔드랏실',
    AC_MIDSUMMER_DESECRATION_HORDE_KALIMDOR_CRITERIA_11762 = '타나리스',
    AC_MIDSUMMER_DESECRATION_HORDE_KALIMDOR_CRITERIA_11741 = '잊혀진 땅',
    AC_MIDSUMMER_DESECRATION_HORDE_KALIMDOR_CRITERIA_11763 = '여명의 설원',
    AC_MIDSUMMER_DESECRATION_HORDE_KALIMDOR_CRITERIA_11735 = '하늘안개 섬',

    AN_MIDSUMMER_DESECRATION_HORDE_OUTLAND = '아웃랜드 불꽃 끄기',
    AD_MIDSUMMER_DESECRATION_HORDE_OUTLAND = '아웃랜드에서 얼라이언스 화톳불 모독!',
    AC_MIDSUMMER_DESECRATION_HORDE_OUTLAND_CRITERIA_11736 = '칼날 산맥',
    AC_MIDSUMMER_DESECRATION_HORDE_OUTLAND_CRITERIA_11750 = '나그란드',
    AC_MIDSUMMER_DESECRATION_HORDE_OUTLAND_CRITERIA_11759 = '황천의 폭풍',
    AC_MIDSUMMER_DESECRATION_HORDE_OUTLAND_CRITERIA_11752 = '어둠달 골짜기',
    AC_MIDSUMMER_DESECRATION_HORDE_OUTLAND_CRITERIA_11754 = '테로카르 숲',
    AC_MIDSUMMER_DESECRATION_HORDE_OUTLAND_CRITERIA_11758 = '장가르 습지대',
    AC_MIDSUMMER_DESECRATION_HORDE_OUTLAND_CRITERIA_11747 = '지옥불 반도',

    AN_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS = '동부 왕국 불꽃 끄기',
    AD_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS = '동부 왕국에서 얼라이언스 화톳불 모독!',
    AC_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS_CRITERIA_11751 = '붉은마루 산맥',
    AC_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS_CRITERIA_11742 = '던 모로',
    AC_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS_CRITERIA_11745 = '엘윈 숲',
    AC_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS_CRITERIA_11749 = '모단 호수',
    AC_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS_CRITERIA_11732 = '아라시 고원',
    AC_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS_CRITERIA_11739 = '불타는 평원',
    AC_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS_CRITERIA_11761 = '가시덤불 골짜기',
    AC_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS_CRITERIA_11755 = '동부 내륙지',
    AC_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS_CRITERIA_11756 = '서부 역병지대',
    AC_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS_CRITERIA_11581 = '서부 몰락지대',
    AC_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS_CRITERIA_11748 = '언덕마루 구릉지',
    AC_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS_CRITERIA_11737 = '저주받은 땅',
    AC_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS_CRITERIA_11743 = '그늘숲',
    AC_MIDSUMMER_DESECRATION_HORDE_EASTERN_KINGDOMS_CRITERIA_11757 = '저습지',

    AN_MIDSUMMER_DESECRATION_ALLIANCE = '호드 모독하기',
    AD_MIDSUMMER_DESECRATION_ALLIANCE = '동부 왕국, 칼림도어, 아웃랜드 불꽃 끄기 업적 완료',

    AN_MIDSUMMER_DESECRATION_ALLIANCE_KALIMDOR = '칼림도어 불꽃 끄기',
    AD_MIDSUMMER_DESECRATION_ALLIANCE_KALIMDOR = '칼림도어에서 호드 화톳불 모독!',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_KALIMDOR_CRITERIA_11803 = '여명의 설원',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_KALIMDOR_CRITERIA_11785 = '버섯구름 봉우리',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_KALIMDOR_CRITERIA_11765 = '잿빛 골짜기',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_KALIMDOR_CRITERIA_11769 = '잊혀진 땅',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_KALIMDOR_CRITERIA_11773 = '페랄라스',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_KALIMDOR_CRITERIA_11777 = '멀고어',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_KALIMDOR_CRITERIA_11800 = '실리더스',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_KALIMDOR_CRITERIA_11780 = '돌발톱 산맥',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_KALIMDOR_CRITERIA_11802 = '타나리스',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_KALIMDOR_CRITERIA_11783 = '불모의 땅',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_KALIMDOR_CRITERIA_11770 = '듀로타',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_KALIMDOR_CRITERIA_11771 = '먼지진흙 습지대',

    AN_MIDSUMMER_DESECRATION_ALLIANCE_OUTLAND = '아웃랜드 불꽃 끄기',
    AD_MIDSUMMER_DESECRATION_ALLIANCE_OUTLAND = '아웃랜드에서 호드 화톳불 모독!',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_OUTLAND_CRITERIA_11767 = '칼날 산맥',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_OUTLAND_CRITERIA_11799 = '황천의 폭풍',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_OUTLAND_CRITERIA_11782 = '테로카르 숲',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_OUTLAND_CRITERIA_11775 = '지옥불 반도',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_OUTLAND_CRITERIA_11787 = '장가르 습지대',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_OUTLAND_CRITERIA_11778 = '나그란드',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_OUTLAND_CRITERIA_11779 = '어둠달 골짜기',

    AN_MIDSUMMER_DESECRATION_ALLIANCE_EASTERN_KINGDOMS = '동부 왕국 불꽃 끄기',
    AD_MIDSUMMER_DESECRATION_ALLIANCE_EASTERN_KINGDOMS = '동부 왕국에서 호드 화톳불 모독!',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11766 = '황야의 땅',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11772 = '영원노래 숲',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11774 = '유령의 땅',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11776 = '언덕마루 구릉지',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11768 = '불타는 평원',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11781 = '슬픔의 늪',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11764 = '아라시 고원',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11580 = '은빛소나무 숲',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11801 = '가시덤불 골짜기',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11784 = '동부 내륙지',
    AC_MIDSUMMER_DESECRATION_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11786 = '티리스팔 숲',

    AN_MIDSUMMER_FLAME_KEEPER_HORDE = '아제로스의 불꽃',
    AD_MIDSUMMER_FLAME_KEEPER_HORDE = '동부 왕국, 칼림도어, 아웃랜드 불꽃지기 업적 완료',

    AN_MIDSUMMER_FLAME_KEEPER_HORDE_KALIMDOR = '칼림도어 불꽃지기',
    AD_MIDSUMMER_FLAME_KEEPER_HORDE_KALIMDOR = '칼림도어에 있는 불꽃에 경의 표시하기',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_KALIMDOR_CRITERIA_11841 = '잿빛 골짜기',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_KALIMDOR_CRITERIA_11845 = '잊혀진 땅',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_KALIMDOR_CRITERIA_11846 = '듀로타',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_KALIMDOR_CRITERIA_11847 = '먼지진흙 습지대',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_KALIMDOR_CRITERIA_11849 = '페랄라스',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_KALIMDOR_CRITERIA_11852 = '멀고어',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_KALIMDOR_CRITERIA_11859 = '불모의 땅',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_KALIMDOR_CRITERIA_11839 = '여명의 설원',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_KALIMDOR_CRITERIA_11836 = '실리더스',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_KALIMDOR_CRITERIA_11856 = '돌발톱 산맥',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_KALIMDOR_CRITERIA_11861 = '버섯구름 봉우리',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_KALIMDOR_CRITERIA_11838 = '타나리스',

    AN_MIDSUMMER_FLAME_KEEPER_HORDE_OUTLAND = '아웃랜드 불꽃지기',
    AD_MIDSUMMER_FLAME_KEEPER_HORDE_OUTLAND = '아웃랜드에 있는 불꽃에 경의 표시하기',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_OUTLAND_CRITERIA_11851 = '지옥불 반도',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_OUTLAND_CRITERIA_11835 = '황천의 폭풍',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_OUTLAND_CRITERIA_11855 = '어둠달 골짜기',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_OUTLAND_CRITERIA_11858 = '테로카르 숲',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_OUTLAND_CRITERIA_11854 = '나그란드',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_OUTLAND_CRITERIA_11863 = '장가르 습지대',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_OUTLAND_CRITERIA_11843 = '칼날 산맥',

    AN_MIDSUMMER_FLAME_KEEPER_HORDE_EASTERN_KINGDOMS = '동부 왕국 불꽃지기',
    AD_MIDSUMMER_FLAME_KEEPER_HORDE_EASTERN_KINGDOMS = '동부 왕국에 있는 불꽃에 경의 표시하기',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_EASTERN_KINGDOMS_CRITERIA_11844 = '불타는 평원',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_EASTERN_KINGDOMS_CRITERIA_11840 = '아라시 고원',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_EASTERN_KINGDOMS_CRITERIA_11584 = '은빛소나무 숲',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_EASTERN_KINGDOMS_CRITERIA_11837 = '가시덤불 골짜기',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_EASTERN_KINGDOMS_CRITERIA_11860 = '동부 내륙지',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_EASTERN_KINGDOMS_CRITERIA_11850 = '유령의 땅',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_EASTERN_KINGDOMS_CRITERIA_11862 = '티리스팔 숲',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_EASTERN_KINGDOMS_CRITERIA_11853 = '언덕마루 구릉지',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_EASTERN_KINGDOMS_CRITERIA_11848 = '영원노래 숲',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_EASTERN_KINGDOMS_CRITERIA_11857 = '슬픔의 늪',
    AC_MIDSUMMER_FLAME_KEEPER_HORDE_EASTERN_KINGDOMS_CRITERIA_11842 = '황야의 땅',

    AN_MIDSUMMER_FLAME_KEEPER_ALLIANCE = '아제로스의 불꽃',
    AD_MIDSUMMER_FLAME_KEEPER_ALLIANCE = '동부 왕국, 칼림도어, 아웃랜드 불꽃감시자 업적 완료',

    AN_MIDSUMMER_FLAME_KEEPER_ALLIANCE_KALIMDOR = '칼림도어 불꽃감시자',
    AD_MIDSUMMER_FLAME_KEEPER_ALLIANCE_KALIMDOR = '칼림도어에 있는 불꽃에 경의 표시하기',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_KALIMDOR_CRITERIA_11833 = '타나리스',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_KALIMDOR_CRITERIA_11805 = '잿빛 골짜기',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_KALIMDOR_CRITERIA_11809 = '핏빛안개 섬',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_KALIMDOR_CRITERIA_11812 = '잊혀진 땅',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_KALIMDOR_CRITERIA_11817 = '페랄라스',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_KALIMDOR_CRITERIA_11824 = '텔드랏실',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_KALIMDOR_CRITERIA_11806 = '하늘안개 섬',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_KALIMDOR_CRITERIA_11834 = '여명의 설원',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_KALIMDOR_CRITERIA_11831 = '실리더스',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_KALIMDOR_CRITERIA_11815 = '먼지진흙 습지대',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_KALIMDOR_CRITERIA_11811 = '어둠해안',

    AN_MIDSUMMER_FLAME_KEEPER_ALLIANCE_OUTLAND = '아웃랜드 불꽃감시자',
    AD_MIDSUMMER_FLAME_KEEPER_ALLIANCE_OUTLAND = '아웃랜드에 있는 불꽃에 경의 표시하기',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_OUTLAND_CRITERIA_11807 = '칼날 산맥',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_OUTLAND_CRITERIA_11830 = '황천의 폭풍',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_OUTLAND_CRITERIA_11823 = '어둠달 골짜기',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_OUTLAND_CRITERIA_11829 = '장가르 습지대',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_OUTLAND_CRITERIA_11818 = '지옥불 반도',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_OUTLAND_CRITERIA_11821 = '나그란드',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_OUTLAND_CRITERIA_11825 = '테로카르 숲',

    AN_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS = '동부 왕국 불꽃감시자',
    AD_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS = '동부 왕국에 있는 불꽃에 경의 표시하기',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11816 = '엘윈 숲',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11810 = '불타는 평원',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11813 = '던 모로',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11822 = '붉은마루 산맥',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11832 = '가시덤불 골짜기',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11826 = '동부 내륙지',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11583 = '서부 몰락지대',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11827 = '서부 역병지대',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11808 = '저주받은 땅',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11819 = '언덕마루 구릉지',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11814 = '그늘숲',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11820 = '모단 호수',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11804 = '아라시 고원',
    AC_MIDSUMMER_FLAME_KEEPER_ALLIANCE_EASTERN_KINGDOMS_CRITERIA_11828 = '저습지',

    --BREWFEST
    AN_BREWFEST = '시음가',
    AD_BREWFEST = '아래 나열된 가을 축제 업적 완료',
    AR_BREWFEST = '칭호: 시음가',

    AN_BREWFEST_WOLPERTINGER = '당신의 노루토끼는 잘 지내고 있나요?',
    AD_BREWFEST_WOLPERTINGER = '노루토끼 획득',

    AN_BREWFEST_COREN_DIREBREW = '공포의 가을 축제',
    AD_BREWFEST_COREN_DIREBREW = '코렌 다이어브루 처치',

    AN_BREWFEST_QUEST1 = '검은무쇠단 드워프 타도',
    AD_BREWFEST_QUEST1 = '검은무쇠단 드워프의 공격으로부터 가을 축제 야영지를 보호하고 "가을 축제를 즐기는 자세" 퀘스트 완료',

    AN_BREWFEST_BEER_CLUB = '유별난 맥주 사랑',
    AD_BREWFEST_BEER_CLUB = '맥주 사랑 동호회 가입하기',

    AN_BREWFEST_MOUNT = '만취 여행',
    AD_BREWFEST_MOUNT = '가을 축제 탈것 획득 또는 가을 축제 홉 열매를 사용하여 자신의 탈것을 가을 축제 탈것으로 변신',

    --LONG TRIP
    AC_WORLDEVENTS_TRIP = '길고도 낯선 길',
    AD_WORLDEVENTS_TRIP = '아래 나열된 이벤트 업적 완료',

	--BURNING CRUSADE
    AN_DOLCE = '명품은 아무나 하나?',
    AD_DOLCE = '해리스 필튼의 \'거인의 가방\' 착용',

    AN_QUESTS_HELLFIRE_PENINSULA = '지옥불 전선',
    AD_QUESTS_HELLFIRE_PENINSULA = '지옥불 반도 퀘스트 80개 완료',
    TBC_QUEST_10388 = 'Haltet die Brennende Legion auf', --#--#--
    TBC_QUEST_10389 = 'Grausame Pläne', --#--#--
    TBC_QUEST_10876 = 'Die Hand von Kargath', --#--#--
    TBC_QUEST_10258 = '해골망치 초소',
    TBC_QUEST_9406 = '마그하르',
    TBC_QUEST_9370 = '매의 감시탑',
    TBC_QUEST_10351 = '세나리온 초소',

    TBC_QUEST_10397 = 'Haltet die Brennende Legion auf', --#--#--
    TBC_QUEST_10400 = 'Stürzt den Oberanführer', --#--#--
    TBC_QUEST_9545 = 'Die Suche nach Sedai', --#--#--
    TBC_QUEST_10935 = 'Der Exorzismus des Oberst Jules', --#--#--
    TBC_QUEST_10937 = 'Die Züchtigung des Drillmeisters', --#--#--
    TBC_QUEST_9383 = '텔하마트 사원',
    TBC_QUEST_10630 = 'Grün, aber kein Orc', --#--#--
    
    AN_QUESTS_ZANGARMASH = '습지대의 신비',
    AD_QUESTS_ZANGARMASH = '장가르 습지대 퀘스트 54개 완료',
    TBC_QUEST_9772 = '늪쥐 감시초소',
    TBC_QUEST_9904 = '자브라진',
    TBC_QUEST_10118 = 'Die Verteidigung von Zabra\'jin', --#--#--
    TBC_QUEST_9803 = 'Draeneidiplomatie', --#--#--
    TBC_QUEST_9783 = '텔레도르',
    TBC_QUEST_9902 = '오레보르 피난처',
    TBC_QUEST_9709 = 'DIESE Pilze solltet Ihr nicht essen!', --#--#--
    TBC_QUEST_9732 = 'Trockenlegung der Marschen', --#--#--
    TBC_QUEST_9788 = 'Rettung der Sporloks', --#--#--
    TBC_QUEST_9726 = 'Ein Ausflug mit dem Sporlingen', --#--#--
    
    AN_QUESTS_TERROKAR = '테로카르의 공포',
    AD_QUESTS_TERROKAR = '테로카르 숲 퀘스트 63개 완료',
    TBC_QUEST_10879 = 'Offensive aus Skettis', --#--#--
    TBC_QUEST_10881 = '피난민 행렬',
    TBC_QUEST_10915 = '샤타리 주둔지',
    TBC_QUEST_9951 = 'Das Geheimnis des Aufsehers', --#--#--
    TBC_QUEST_10042 = '알레리아 성채',
    TBC_QUEST_10043 = '돌망치 요새',
    
    AN_QUESTS_NAGRAND = '나그란드 격돌',
    AD_QUESTS_NAGRAND = '나그란드 퀘스트 75개 완료',
    TBC_QUEST_10172 = 'Geburt eines Kriegshäuptlings', --#--#--
    TBC_QUEST_9977 = '피의 투기장',
    TBC_QUEST_9853 = '정령의 옥좌',
    TBC_QUEST_9934 = 'Lantresor von der Klinge', --#--#--
    TBC_QUEST_9868 = 'Die Finsterblutzerschlagenen', --#--#--
    TBC_QUEST_9937 = 'Bedrohungen für Nagrand', --#--#--
    TBC_QUEST_9852 = '궁극의 사냥감',
    TBC_QUEST_9925 = 'Begegnung mit den Astralen', --#--#--
    TBC_QUEST_9955 = 'Die Abenteuer von Corki', --#--#--
    TBC_QUEST_9933 = 'Lantresor von der Klinge', --#--#--
    TBC_QUEST_9873 = 'Die Finsterblutzerschlagenen', --#--#--
    TBC_QUEST_10011 = 'Bedrohungen für Nagrand', --#--#--
    
    AN_QUESTS_BLADES_EDGE_MTNS = '칼날 산맥 정복',
    AD_QUESTS_BLADES_EDGE_MTNS = '칼날 산맥 퀘스트 86개 완료',
    TBC_QUEST_10504 = '실바나르',
    TBC_QUEST_10671 = '토쉴리의 연구기지',
    TBC_QUEST_10806 = 'Die Gronnbedrohung', --#--#--
    TBC_QUEST_10505 = '천둥군주 요새',
    TBC_QUEST_10742 = 'Zusammenführung', --#--#--
    TBC_QUEST_10867 = 'Die Mok\'Nathal', --#--#--
    TBC_QUEST_10748 = '루안 숲',
    
    AN_QUESTS_NETHERSTORM = '황천 속으로',
    AD_QUESTS_NETHERSTORM = '황천의 폭풍 퀘스트 120개 완료',
    TBC_QUEST_10409 = 'Socrethar', --#--#--
    TBC_QUEST_10240 = '보랏빛 탑',
    TBC_QUEST_10249 = 'Beschützt Area 52!', --#--#--
    TBC_QUEST_10439 = 'Zerstörung des Allesverschlingenden', --#--#--
    TBC_QUEST_10221 = 'Bau der X-52 Netherrakete', --#--#--
    TBC_QUEST_10276 = '무역연합',
    
    AN_QUESTS_SHADOWMOON = '배신자의 그림자',
    AD_QUESTS_SHADOWMOON = '어둠달 골짜기 퀘스트 90개 완료',
    TBC_QUEST_10744 = 'Nachricht vom Sieg', --#--#--
    TBC_QUEST_11041 = '황천날개 마루',
    TBC_QUEST_10645 = 'Der erste Todesritter', --#--#--
    TBC_QUEST_10651 = 'Geliehene Macht', --#--#--
    TBC_QUEST_11052 = 'Akamas Versprechen', --#--#--
    TBC_QUEST_10588 = 'Die Litanei der Verdammnis', --#--#--
    TBC_QUEST_10679 = 'Antidämonenwaffen', --#--#--
    TBC_QUEST_10808 = 'Der Dunkle Rat', --#--#--
	
	AN_HEMET_QUESTS_NAGRAND = '흰 엘레크 언덕',
	AD_HEMET_QUESTS_NAGRAND = '나그란드의 헤멧 네싱워리 퀘스트를 "궁극의 사냥감"까지 모두 완료',

    HEROIC_NAME_PATTERN = 'Heroisch: %s', --#--#--
    HEROIC_DESCRIPTION_PATTERN = '%s auf dem Schwierigkeitsgrad \'Heroisch\'', --#--#--

    AN_HELLFIRE_RAMPARTS = '지옥불 성루',
    AD_HELLFIRE_RAMPARTS = '무적의 오모르 처치',
    AC_BOSS_17308 = '무적의 오모르',
    AC_BOSS_17537 = '사자 바즈루덴',
	AC_BOSS_17306 = 'Wachhabender Gargolmar', --#--#--

    AN_BLOOD_FURNACE = '피의 용광로',
    AD_BLOOD_FURNACE = '파괴자 켈리단 처치',

    AN_SLAVE_PENS = '강제 노역소',
    AD_SLAVE_PENS = '쿠아그미란 처치',

    AN_UNDERBOG = '지하수렁',
    AD_UNDERBOG = '검은 추적자 처치',

    AN_MANA_TOMBS = '마나 무덤',
    AD_MANA_TOMBS = '연합왕자 샤파르 처치',

    AN_AUCHENAI_CRYPTS = '아키나이 납골당',
    AD_AUCHENAI_CRYPTS = '총독 말라다르 처치',

    AN_OLD_HILLSBRAD = '던홀드 탈출',
    AD_OLD_HILLSBRAD = '시대의 사냥꾼 처치',

    AN_SETHEKK_HALLS = '세데크 전당',
    AD_SETHEKK_HALLS = '갈퀴대왕 이키스 처치',

    AN_STEAMVAULT = '증기 저장고',
    AD_STEAMVAULT = '장군 칼리스레쉬 처치',

    AN_SHADOW_LABYRINTH = '어둠의 미궁',
    AD_SHADOW_LABYRINTH = '울림 처치',

    AN_SHATTERED_HALLS = '으스러진 손의 전당',
    AD_SHATTERED_HALLS = '대족장 카르가스 블레이드피스트 처치',

    AN_BLACK_MORASS = '어둠의 문 열기',
    AD_BLACK_MORASS = '아에누스 처치',

    AN_BOTANICA = '신록의 정원',
    AD_BOTANICA = '차원의 분리자 처치',

    AN_MECHANAR = '메카나르',
    AD_MECHANAR = '철두철미한 파탈리온 처치',

    AN_ARCATRAZ = '알카트라즈',
    AD_ARCATRAZ = '선구자 스키리스 처치',
	
	AN_MAGISTERS_TERRACE = '마법학자의 정원',
    AD_MAGISTERS_TERRACE = '캘타스 선스트라이더 처치',
	
	AN_TBC_DUNGEONS = '아웃랜드 던전 전문가',
    AD_TBC_DUNGEONS = '아래 나열된 불타는 성전 던전 업적 완료',

    AN_TBC_DUNGEONS_HERO = '아웃랜드 던전 영웅',
    AD_TBC_DUNGEONS_HERO = '아래 나열된 불타는 성전 영웅 던전 업적 완료',

    AN_OUTLAND_HERO = 'Held der Scherbenwelt', --#--#--
    AD_OUTLAND_HERO = 'Schließt die unten aufgelisteten Schlachtzugserfolge ab.', --#--#--
    AR_OUTLAND_HERO = 'Held der Scherbenwelt', --#--#--
    
    AN_OUTLAND_GREAT_HERO = 'Großartiger Held der Scherbenwelt', --#--#--
    AD_OUTLAND_GREAT_HERO = 'Schließt die unten aufgelisteten Dungeon- und Schlachtzugserfolge ab.', --#--#--
    AR_OUTLAND_GREAT_HERO = 'Großartiger Held der Scherbenwelt', --#--#--

    AN_RAVEN_LORD = '까마귀 군주의 고삐',
    AD_RAVEN_LORD = '세데크 전당의 안주에게서 까마귀 군주의 고삐 획득',

    AN_KARAZHAN = '카라잔',
    AD_KARAZHAN = '카라잔에서 공작 말체자르 처치',

    AN_GRUUL = '그룰의 둥지',
    AD_GRUUL = '그룰의 둥지에서 용 학살자 그룰 처치',

    AN_MAGTHERIDON = '마그테리돈의 둥지',
    AD_MAGTHERIDON = '마그테리돈의 둥지에서 마그테리돈 처치',
	
	AN_ZULAMAN = '줄아만',
	AD_ZULAMAN = '줄아만에서 줄진 처치',
	
	AN_SUNWELL = '태양샘 고원',
	AD_SUNWELL = '태양샘 고원에서 킬제덴 처치',

    AN_TBC_PHASE_1 = '아웃랜드 공격대',
    AD_TBC_PHASE_1 = '아래 나열된 불타는 성전 공격대 업적 완료',
    AN_TBC_PHASE_2 = '아웃랜드 공격대',
    AD_TBC_PHASE_2 = '아래 나열된 불타는 성전 공격대 업적 완료',
    AN_TBC_PHASE_3 = '아웃랜드 공격대',
    AD_TBC_PHASE_3 = '아래 나열된 불타는 성전 공격대 업적 완료',
	AN_TBC_PHASE_4 = '아웃랜드 공격대',
    AD_TBC_PHASE_4 = '아래 나열된 불타는 성전 공격대 업적 완료',
	AN_TBC_PHASE_5 = '아웃랜드 공격대',
    AD_TBC_PHASE_5 = '아래 나열된 불타는 성전 공격대 업적 완료',
	
    FACTION_946 = '명예의 요새',
    FACTION_947 = '스랄마',
    FACTION_942 = '세나리온 원정대',
    FACTION_1011 = '고난의 거리',
    FACTION_989 = '시간의 수호자',
    FACTION_935 = '샤타르',
	FACTION_609 = '세나리온 의회',

    AN_TBC_DUNGEON_REPUTATIONS = '불타는 성전사',
    AD_TBC_DUNGEON_REPUTATIONS = '불타는 성전 모든 던전 평판 확고한 동맹',
	
	AN_CENARION_CIRCLE = '세나리우스의 친구',
    AD_CENARION_CIRCLE = '세나리온 의회, 세나리온 원정대 확고한 동맹',

    AN_SHATTRATH_REP = '분단된 샤트라스',
    AD_SHATTRATH_REP = '점술가 길드 혹은 알도르 사제회 확고한 동맹',

    AN_OGRILA = '하루에 퀘스트 하나면 오우거도 친구된다',
    AD_OGRILA = '오그릴라 확고한 동맹',

    AN_SPOREGGAR = '스포어가르 황제',
    AD_SPOREGGAR = '스포어가르 확고한 동맹',

    AN_CONSORTIUM = '최고 확고 관리자',
    AD_CONSORTIUM = '무역연합 확고한 동맹',

    AN_MAGHAR = '드레노어의 마그하르',
    AD_MAGHAR = '마그하르 확고한 동맹',

    AN_KURENAI = '오, 나의 쿠레나이',
    AD_KURENAI = '쿠레나이 확고한 동맹',

    AN_NETHERWINGS = '황천의 날개를 달고',
    AD_NETHERWINGS = '황천의 용군단 확고한 동맹',

    AN_SKYSHATTERED = '스카이쉐터와의 한 판 승부',
    AD_SKYSHATTERED = '황천날개 마루의 용아귀부족 경주에서 대장 스카이쉐터 이기기',

    AN_AMETHYST_EYE = '보랏빛 눈',
    AD_AMETHYST_EYE = '보랏빛 눈의 감시자 확고한 동맹',

    AN_SCALE_OF_THE_SANDS = '시간의 중재자',
    AD_SCALE_OF_THE_SANDS = '시간의 중재자 확고한 동맹',

    AN_ASHTONGUE_DEATHSWORN = '결사단과의 맹세',
    AD_ASHTONGUE_DEATHSWORN = '잿빛혓바닥 결사단 확고한 동맹',

    AN_SHATTERED_SUN = '너무 무너진 당신',
    AD_SHATTERED_SUN = '무너진 태양 공격대 확고한 동맹',

    AN_SKYGUARD = '스케티스 창공을 날아서',
    AD_SKYGUARD = '샤타리 하늘경비대 확고한 동맹',

    AN_HIPPOGRYPH = '세나리온 전투 히포그리프',
    AD_HIPPOGRYPH = '장가르습지대 세나리온 원정대에서 세나리온 전투 히포그리프 획득',

    AN_DIPLOMAT = '외교관',
    AD_DIPLOMAT_ALLIANCE = '나무구렁 요새, 스포어가르, 쿠레나이 평판 확고한 동맹',
    AD_DIPLOMAT_HORDE = '나무구렁 요새, 스포어가르, 마그하르 평판 확고한 동맹',
    AC_DIPLOMAT_576 = '나무구렁 요새 확고한 동맹',
    AC_DIPLOMAT_970 = '스포어가르 확고한 동맹',
    AC_DIPLOMAT_978 = '쿠레나이 확고한 동맹',
    AC_DIPLOMAT_941 = '마그하르 확고한 동맹',

    AN_MR_PINCHY = 'Dr. Zwicky!', --#--#--
    AD_MR_PINCHY = 'Angelt Dr. Zwicky in der Scherbenwelt.', --#--#--

    AN_FISHING_BOOK = '물고기는 발자국을 남기지 않는 법',
    AD_FISHING_BOOK = '물고기 찾는 능력 익히기',

    AN_ACCOMPLISHED_ANGLER = '노련한 낚시꾼',
    AD_ACCOMPLISHED_ANGLER = '아래 나열된 낚시 업적 완료',

    AN_TBC_DAILY_FISH = '노인 발로',
    AD_TBC_DAILY_FISH = '아래 나열된 노인 발로 일일 퀘스트 5개 완료',
    AC_TBC_DAILY_FISH1 = '도시에 나타난 악어',
    AC_TBC_DAILY_FISH2 = '미끼 도둑',
    AC_TBC_DAILY_FISH3 = '지옥피퉁돔 분비선',
    AC_TBC_DAILY_FISH4 = '놓친 물고기',
    AC_TBC_DAILY_FISH5 = '새우잡이',

    AN_OLD_IRONJAW = '늙은 무쇠턱',
    AD_OLD_IRONJAW = '아이언포지에서 늙은 무쇠턱 낚기',

    AN_OLD_CRAFTY = '늙은 재주꾼',
    AD_OLD_CRAFTY = '오그리마에서 늙은 재주꾼 낚기',

    AN_FISHING_DIPLOMAT = '낚시는 즐거워!',
    AD_FISHING_DIPLOMAT = '오그리마와 스톰윈드에서 낚시',
    AC_FISHING_DIPLOMAT1 = '오그리마',
    AC_FISHING_DIPLOMAT2 = '스톰윈드',

    AN_CAPTAIN_RUMSEY = '럼지 선장의 맥주',
    AD_CAPTAIN_RUMSEY = '럼지 선장의 맥주 양조',

    AN_SECOND_RING = 'Der Andere Ring', --#--#--
    AD_SECOND_RING = 'Erhaltet den Anderen Ring aus einem Sack voll geangelter Schätze.', --#--#--

    AN_TBC_DAILY_COOKING = '요리 실력 향상',
    AD_TBC_DAILY_COOKING = '로크가 주는 아래 나열된 일일 요리 퀘스트 4개 완료',
    AC_TBC_DAILY_COOKING1 = '맛있는 마나',
    AC_TBC_DAILY_COOKING2 = '영혼의 수프',
    AC_TBC_DAILY_COOKING3 = '복수의 감칠맛',
    AC_TBC_DAILY_COOKING4 = '엄청나게 매운 스튜',

    AN_TBC_COOKING_RECIPES = '아웃랜드 미식가',
    AD_TBC_COOKING_RECIPES = '아래 나열된 아웃랜드 요리 조리법으로 요리하기',

    AN_HAIL_CHEF = '요리사 만세!',
    AD_HAIL_CHEF = '아래 나열된 요리 업적 완료',

    AN_EXPLORE_OUTLAND = '아웃랜드 탐험',
    AD_EXPLORE_OUTLAND = '아웃랜드 탐험',

    AN_MIDDLE_RARE = '희귀한 몬스터를 찾아서',
    AD_MIDDLE_RARE = '아래 나열된 매우 귀하고 좀처럼 찾기 어려운 아웃랜드 몬스터 중 하나 처치',
    AN_BLOODY_RARE = '엄청나게 희귀한 몬스터를 찾아서',
    AD_BLOODY_RARE = '아래 나열된 매우 귀하고 좀처럼 찾기 어려운 아웃랜드 몬스터 모두 처치',
    TBC_NPC_18695 = '사자 제리카르',
    TBC_NPC_18682 = '늪지 잠복꾼',
    TBC_NPC_18697 = '선임기술자 노산더',
    TBC_NPC_18681 = '갈퀴송곳니 사절',
    TBC_NPC_18694 = '차원의 감시자 콜리더스',
    TBC_NPC_18689 = '절름발이',
    TBC_NPC_18686 = '파멸의 예언자 유림',
    TBC_NPC_18698 = '응징자 영원핵',
    TBC_NPC_18678 = '모래아귀',
    TBC_NPC_17144 = '쐐기이빨',
    TBC_NPC_18692 = '헤마시온',
    TBC_NPC_18696 = '크라토르',
    TBC_NPC_18680 = '마르티카',
    TBC_NPC_18677 = '야수 메크토그',
    TBC_NPC_18690 = '모르크루쉬',
    TBC_NPC_20932 = '누라모크',
    TBC_NPC_18685 = '오크렉',
    TBC_NPC_18693 = '연설가 마르그롬',
    TBC_NPC_18683 = '공허의 사냥꾼 야르',
    TBC_NPC_18679 = '보라켐 둠스피커',

    AN_PREPATCH_QUEST = 'Auf in den Kampf!', --#--#--
    AD_PREPATCH_QUEST = 'Hat am Kampf um das Dunkle Portal teilgenommen. Träger des Wappenrock des Beschützers.', --#--#--

    AN_RIDING_75 = '이랴!',
    AD_RIDING_75 = '초급 타기 배우기',
    AN_RIDING_150 = '사납고 빠르게',
    AD_RIDING_150 = '수습 타기 배우기',
    AN_RIDING_225 = '저 푸른 초원 속으로',
    AD_RIDING_225 = '숙련 타기 배우기',
    AN_RIDING_300 = '필사의 도전',
    AD_RIDING_300 = '타기의 대가 기술 배우기',

    AN_ATTUNE_SHATTERED_HALLS = 'Heißer als die Hölle', --#--#--
    AD_ATTUNE_SHATTERED_HALLS = 'Erhaltet den Schlüssel zu den Zerschmetterten Hallen.', --#--#--
    AN_ATTUNE_ARCATRAZ = '알카트라즈에 잠입하는 방법',
    AD_ATTUNE_ARCATRAZ = 'Erhaltet den Schlüssel zur Arkatraz.', --#--#--
    AN_ATTUNE_KARAZHAN = '메디브와의 만남',
    AD_ATTUNE_KARAZHAN = 'Erhaltet den Schlüssel des Meisters.', --#--#--
    AN_ATTUNE_NIGHT_BANE = 'Die Vergangenheit aufwühlen', --#--#--
    AD_ATTUNE_NIGHT_BANE = 'Erhaltet die Geschwärzte Urne und bezwingt den Schrecken der Nacht in Karazhan.', --#--#--
    AN_ATTUNE_SSC = '카르데쉬의 곤봉',
    AD_ATTUNE_SSC = 'Erhaltet Zugang zur Höhle des Schlangenschreins.', --#--#--
    AN_ATTUNE_EYE = 'Der Schlüssel der Stürme', --#--#--
    AD_ATTUNE_EYE = 'Erhaltet den Schlüssel der Stürme.', --#--#--
    AN_ATTUNE_HYJAL = '영원의 샘',
    AD_ATTUNE_HYJAL = 'Erhaltet Zugang zur Schlacht um den Berg Hyjal.', --#--#--
    AN_ATTUNE_BLACK_TEMPLE = '아카마를 위한 소동',
    AD_ATTUNE_BLACK_TEMPLE = 'Erhaltet das Medaillon von Karabor.', --#--#--

    AN_SSC = '불뱀 제단',
    AD_SSC = '불뱀 제단에서 여군주 바쉬 처치',
    AC_KILL_HYDROS = 'Hydross der Unstete', --#--#--
    AC_KILL_LURKER = '잠복꾼 낚시',
    AC_KILL_LEOTHERAS = 'Leotheras der Blinde', --#--#--
    AC_KILL_KARATHRESS = 'Tiefenlord Karathress', --#--#--
    AC_KILL_MOROGRIM = 'Morogrim Gezeitenwandler', --#--#--
    AC_KILL_VASHJ = '여군주 바쉬',
    AN_TK = '폭풍우 요새',
    AD_TK = '폭풍우 요새에서 캘타스 선스트라이더 처치',
    AC_KILL_ALAR = 'Al\'ar', --#--#--
    AC_KILL_VOID_REAVER = 'Leerhäscher', --#--#--
    AC_KILL_SOLARIAN = 'Hochastromantin Solarian', --#--#--
    AC_KILL_KAELTHAS = '캘타스 선스트라이더',

    AN_HYJAL = '하이잘 산의 전투',
    AD_HYJAL = '하이잘 산 전투에서 아키몬드 처치',

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
    AC_KILL_ILLIDAN = '일리단 스톰레이지',

    AN_BLACK_TEMPLE = '검은 사원',
    AD_BLACK_TEMPLE = '검은 사원에서 일리단 스톰레이지 처치',
    AR_BLACK_TEMPLE = 'Bezwinger des Schwarzen Tempels', --#--#--

    AN_ARENA_FIRST_WIN = '투기장으로',
    AD_ARENA_FIRST_WIN = '70 레벨 투기장 본선 전투 승리',
    AN_ARENA_WIN1 = '무자비한 집념',
    AD_ARENA_WIN1 = '70 레벨 투기장 본선 전투 승리 100회',
    AN_ARENA_WIN2 = '복수심에 불타는 집념',
    AD_ARENA_WIN2 = '70 레벨 투기장 본선 전투 승리 200회',
    AN_ARENA_WIN3 = '야만적인 집념',
    AD_ARENA_WIN3 = '70 레벨 투기장 본선 전투 승리 300회',

    AN_ARENA_TITLE1 = '검투사',
    AN_ARENA_TITLE2 = '결투사',
    AN_ARENA_TITLE3 = '승부사',
    AN_ARENA_TITLE4 = '도전자',

    AN_ARENA_GLADIATOR = '검투사',
    AD_ARENA_GLADIATOR = '70 레벨 투기장 시즌에서 "검투사" 칭호 획득',
    AN_ARENA_DUELIST = '결투사',
    AD_ARENA_DUELIST = '70 레벨 투기장 시즌에 "결투사" 칭호 획득',
    AN_ARENA_RIVAL = '승부사',
    AD_ARENA_RIVAL = '70 레벨 투기장 시즌에서 "승부사" 칭호 획득',
    AN_ARENA_CHALLENGER = '도전자',
    AD_ARENA_CHALLENGER = '70 레벨 투기장 시즌에 "도전자" 칭호 획득',

    AN_ARENA_2_1550 = '우리 둘이서 1,550',
    AD_ARENA_2_1550 = '70 레벨 2v2 투기장 개인 평점 1,550',
    AN_ARENA_2_1750 = '우리 둘이서 1,750',
    AD_ARENA_2_1750 = '70 레벨 2v2 투기장 개인 평점 1,750',
    AN_ARENA_2_2000 = '우리 둘이서 2,000',
    AD_ARENA_2_2000 = '70 레벨 2v2 투기장 개인 평점 2,000',
    AN_ARENA_2_2200 = '우리 둘이서 2,200',
    AD_ARENA_2_2200 = '70 레벨 2v2 투기장 개인 평점 2,200',

    AN_ARENA_3_1550 = '투기장 삼총사 1,550',
    AD_ARENA_3_1550 = '70 레벨 3v3 투기장 개인 평점 1,550',
    AN_ARENA_3_1750 = '투기장 삼총사 1,750',
    AD_ARENA_3_1750 = '70 레벨 3v3 투기장 개인 평점 1,750',
    AN_ARENA_3_2000 = '투기장 삼총사 2,000',
    AD_ARENA_3_2000 = '70 레벨 3v3 투기장 개인 평점 2,000',
    AN_ARENA_3_2200 = '투기장 삼총사 2,200',
    AD_ARENA_3_2200 = '70 레벨 3v3 투기장 개인 평점 2,200',

    AN_ARENA_5_1550 = '의기투합 오형제 1,550',
    AD_ARENA_5_1550 = '70 레벨 5v5 투기장 개인 평점 1,550',
    AN_ARENA_5_1750 = '의기투합 오형제 1,750',
    AD_ARENA_5_1750 = '70 레벨 5v5 투기장 개인 평점 1,750',
    AN_ARENA_5_2000 = '의기투합 오형제 2,000',
    AD_ARENA_5_2000 = '70 레벨 5v5 투기장 개인 평점 2,000',
    AN_ARENA_5_2200 = '의기투합 오형제 2,200',
    AD_ARENA_5_2200 = '70 레벨 5v5 투기장 개인 평점 2,200',

    AN_ARENA_STREAK = '파죽지세',
    AD_ARENA_STREAK = '연속으로 70 레벨 본선 전투 승리 10회',

    AN_ARENA_HOTSTREAK = '뜨겁게 몰아치는 열기',
    AD_ARENA_HOTSTREAK = '70 레벨 투기장 평점 1,800 이상에서 본선 전투 10회 연속으로 승리',

    AN_ARENA_LASTMAN = '최후의 생존자',
    AD_ARENA_LASTMAN = '70 레벨 5v5 투기장 본선 전투에서 혼자 살아남기',

    AN_ARENA_MAPS = '세계 우승',
    AD_ARENA_MAPS = '70 레벨 칼날 산맥, 나그란드, 달라란 하수도, 로데론의 폐허의 본선 전투 승리',
    AC_ARENA_MAPS1 = '칼날 산맥 투기장',
    AC_ARENA_MAPS2 = '나그란드 투기장',
    AC_ARENA_MAPS3 = '로데론의 폐허',

    AN_ARENA_MASTER = '전문 검투사',
    AD_ARENA_MASTER = '아래 나열된 투기장 업적 완료',

    AN_AZZINOTH = '아지노스의 쌍날검',
    AD_AZZINOTH = '아지노스의 쌍날검을 부리는 자',
	AN_THORIDAL = '소리달 - 별의 분노',
    AD_THORIDAL = '소리달 - 별의 분노를 부리는 자',
    AC_OBTAIN_MAINHAND_AZZINOTH = 'Rechte Kriegsgleve von Azzinoth', --#--#--
    AC_OBTAIN_OFFHAND_AZZINOTH = 'Linke Kriegsgleve von Azzinoth', --#--#--
	AN_BEAR_MOUNT = '아마니 전투곰',
    AD_BEAR_MOUNT = '아마니 전투곰 소유자',
	AN_HAWK_MOUNT = '날쌘 흰색 매타조',
    AD_HAWK_MOUNT = '마법학자의 정원 캘타스 선스트라이더에게서 날쌘 흰색 매타조 획득',
	AN_ALAR_MOUNT = '알라르의 재',
    AD_ALAR_MOUNT = '폭풍우 요새 캘타스 선스트라이더에게서 알라르의 재 획득',
	AN_HORSEMAN_MOUNT = '저주받은 기사의 고삐',
	AD_HORSEMAN_MOUNT = '할로윈 축제 기간 동안 붉은십자군 수도원의 저주받은 기사에게서 저주받은 기사의 고삐 획득',
	AN_HERO_SHATTRATH = '샤트라스의 영웅',
	AD_HERO_SHATTRATH = '점술가 길드 및 알도르 사제회 확고한 동맹',
	AN_HERO_SCRYER = '점술가 길드',
	AN_HERO_ALDOR = '알도르 사제회',
	AN_CHAMPION_NAARU = '나루의 용사',
	AD_CHAMPION_NAARU = '"나루의 용사" 칭호 획득',
	AR_CHAMPION_NAARU = '나루의 용사',
	AN_HAND_ADAL = '아달의 수호자',
	AD_HAND_ADAL = '"아달의 수호자" 칭호 획득',

    AN_P3_FIRST_WEEK = 'Eroberer der Scherbenwelt', --#--#--
    AD_P3_FIRST_WEEK = 'Bezwingt Archimonde und Illidan Sturmgrimm in der ersten Woche von Phase 3.', --#--#--
    AC_KILL_ARCHIMONDE = '아키몬드',
    AR_P3_FIRST_WEEK = 'Eroberer der Scherbenwelt', --#--#--
	
	AN_FLIGHFORM = '빠른 폭풍까마귀 변신',
	AD_FLIGHFORM = '빠른 폭풍까마귀 변신을 위한 드루이드 퀘스트 완료',

    AN_KRUUL = '...nicht noch ein Dämonenlord!', --#--#--
	AD_KRUUL = 'Bezwingt Hochlord Kruul während des Kampfes um das Dunkle Portal.', --#--#--

    AN_ATTUMEN_MOUNT = '불타는 전투마 고삐',
	AD_ATTUMEN_MOUNT = '카라잔의 사냥꾼 어튜멘에게서 불타는 전투마 고삐 획득',


    -- Classic-continent rare achievement series
    AN_ONE_OF_A_KIND = '유일무이',
    AD_ONE_OF_A_KIND = '칼림도어 또는 동부 왕국에서 희귀 정예 생명체 한 마리를 처치하십시오.',
    AN_EXTREMELY_RARE = '극도로 희귀한',
    AD_EXTREMELY_RARE = '아래 목록에 있는 칼림도어와 동부 왕국의 모든 희귀 정예 생명체를 처치하십시오.',

    -- Classic-continent rare NPC names (localized by stable NPC ID).
    RARE_NPC_3586 = '광부 존슨',
    RARE_NPC_3872 = '죽음의 경비대장',
    RARE_NPC_6228 = '검은무쇠단 사절',
    RARE_NPC_6488 = '타락한 용사',
    RARE_NPC_6489 = '무쇠해골',
    RARE_NPC_6490 = '잠들지 않는 아즈쉬르',
    RARE_NPC_7057 = '발굴단장 쇼벨플랜지',
    RARE_NPC_9024 = '화염술사 로어그레인',
    RARE_NPC_8923 = '무적의 판저',
    RARE_NPC_9041 = '문지기 스틸기스',
    RARE_NPC_9042 = '베레크',
    RARE_NPC_9217 = '뾰족바위일족 마법사장',
    RARE_NPC_9218 = '뾰족바위일족 전투대장',
    RARE_NPC_9219 = '뾰족바위일족 학살자',
    RARE_NPC_9596 = '반노크 그림액스',
    RARE_NPC_9736 = '병참장교 지그리스',
    RARE_NPC_10376 = '수정 맹독거미',
    RARE_NPC_10263 = '불타는 지옥군단병',
    RARE_NPC_9718 = '고크 배시구드',
    RARE_NPC_10509 = '제드 룬와처',
    RARE_NPC_10899 = '고랄루크 앤빌크랙',
    RARE_NPC_10393 = '스컬',
    RARE_NPC_10558 = '하스싱어 포레스턴',
    RARE_NPC_10809 = '뾰족바위',
    RARE_NPC_99 = '교활한 도적 몰게니',
    RARE_NPC_100 = '날쌘발톱 그러프',
    RARE_NPC_471 = '여왕 굴거미',
    RARE_NPC_472 = '페드페널',
    RARE_NPC_61 = '투로스 라이트핑거',
    RARE_NPC_79 = '현장감독 나르그',
    RARE_NPC_1130 = '뱌른',
    RARE_NPC_1132 = '팀버',
    RARE_NPC_1137 = '포효의 에단',
    RARE_NPC_8503 = '기블윌트',
    RARE_NPC_1260 = '대부 아크티쿠스',
    RARE_NPC_1119 = '가시망치',
    RARE_NPC_10827 = '죽음의전령사 셀렌드레',
    RARE_NPC_10817 = '두간 와일드해머',
    RARE_NPC_10825 = '부동의 기쉬',
    RARE_NPC_10821 = '부패의 헤드무쉬',
    RARE_NPC_10828 = '고위사령관 아벤디스',
    RARE_NPC_10826 = '군주 다크사이드',
    RARE_NPC_10824 = '순찰대장 호크스피어',
    RARE_NPC_10822 = '장군 트레쉬진',
    RARE_NPC_10823 = '줄브린 워프브랜치',
    RARE_NPC_16184 = '네루비안 우두머리',
    RARE_NPC_1843 = '현장감독 제리스',
    RARE_NPC_1844 = '현장감독 마크리드',
    RARE_NPC_1847 = '파울메인',
    RARE_NPC_1838 = '붉은십자군 심문관',
    RARE_NPC_1851 = '허스크',
    RARE_NPC_1837 = '붉은십자군 재판관',
    RARE_NPC_1885 = '붉은십자군 대장장이',
    RARE_NPC_1848 = '말다자르 경',
    RARE_NPC_1850 = '퓨트리디우스',
    RARE_NPC_1839 = '붉은십자군 고위성직자',
    RARE_NPC_1841 = '붉은십자군 사형집행인',
    RARE_NPC_10356 = '크르르',
    RARE_NPC_1911 = '디브',
    RARE_NPC_1936 = '농부 솔리덴',
    RARE_NPC_10358 = '펠리센트의 유령',
    RARE_NPC_1531 = '길잃은 영혼',
    RARE_NPC_1910 = '무아드',
    RARE_NPC_10357 = '칼날비명 레산',
    RARE_NPC_10359 = '스리술크',
    RARE_NPC_1533 = '고통받는 영혼',
    RARE_NPC_14221 = '그라비스 슬립노트',
    RARE_NPC_2258 = '분노한 바위 정령',
    RARE_NPC_14223 = '심술쟁이 밴즈',
    RARE_NPC_2453 = '로그로쉬',
    RARE_NPC_2452 = '스카울',
    RARE_NPC_12431 = '피송곳니',
    RARE_NPC_12433 = '크레시스 섀도스피너',
    RARE_NPC_12432 = '늙은곰 톱니이빨',
    RARE_NPC_1944 = '썩은가죽일족 투사',
    RARE_NPC_1948 = '썩은갈기',
    RARE_NPC_2283 = '까마귀발톱 섭정',
    RARE_NPC_1920 = '달라란 역술사',
    RARE_NPC_8213 = '무쇠껍질',
    RARE_NPC_8214 = '잘린데 서머드레이크',
    RARE_NPC_8216 = '광전사 레세로크',
    RARE_NPC_8212 = '리크',
    RARE_NPC_8218 = '추적자 매마른심장',
    RARE_NPC_8219 = '줄라렉 헤이트파울러',
    RARE_NPC_8210 = '서슬갈퀴',
    RARE_NPC_8217 = '마법부여사 미스레디스',
    RARE_NPC_8215 = '그림운거스',
    RARE_NPC_14222 = '아라가',
    RARE_NPC_14279 = '땅거미',
    RARE_NPC_14281 = '날도둑 지미',
    RARE_NPC_14277 = '여군주 제프리스',
    RARE_NPC_8211 = '늙은 절벽껑충늑대',
    RARE_NPC_14278 = '로바크',
    RARE_NPC_14276 = '칼지느러미',
    RARE_NPC_14280 = '큰곰 삼라스',
    RARE_NPC_2447 = '나릴라산즈',
    RARE_NPC_14275 = '탐라 스톰파이크',
    RARE_NPC_2779 = '왕자 나자크',
    RARE_NPC_2609 = '흙점쟁이 플린트대거',
    RARE_NPC_2600 = '싱어',
    RARE_NPC_2598 = '다벨 몬트로즈',
    RARE_NPC_2601 = '뒤뚱발이',
    RARE_NPC_2602 = '루울 원스톤',
    RARE_NPC_2603 = '코보르크',
    RARE_NPC_2604 = '무쇠주먹 몰로크',
    RARE_NPC_2606 = '학살자 니마르',
    RARE_NPC_2605 = '마른나무껍질 잘라스',
    RARE_NPC_1037 = '용아귀부족 지휘관',
    RARE_NPC_2108 = '가르넥 찰스컬',
    RARE_NPC_1112 = '거머리과부거미',
    RARE_NPC_2090 = '마룩 웜스케일',
    RARE_NPC_1140 = '무쇠턱 우두머리랩터',
    RARE_NPC_1050 = '비늘맹독혈족 근위병',
    RARE_NPC_14425 = '뼈갈이',
    RARE_NPC_14424 = '골구렁',
    RARE_NPC_14433 = '곤죽이',
    RARE_NPC_1398 = '우두머리 갈고쉬',
    RARE_NPC_1425 = '그리즐락',
    RARE_NPC_2476 = '큰 호수악어',
    RARE_NPC_14268 = '독수리왕 콘다르',
    RARE_NPC_1399 = '마고쉬',
    RARE_NPC_14266 = '검은올가미 샨다',
    RARE_NPC_14267 = '무쇠주먹 에모그',
    RARE_NPC_2751 = '전투골렘',
    RARE_NPC_14224 = '7:XT',
    RARE_NPC_2744 = '어둠괴철로단 사령관',
    RARE_NPC_2752 = '우레정령',
    RARE_NPC_2753 = '바르나부스',
    RARE_NPC_2850 = '부러진 송곳니',
    RARE_NPC_2931 = '자리코틀',
    RARE_NPC_2754 = '아나테무스',
    RARE_NPC_2749 = '공성용 골렘',
    RARE_NPC_9046 = '방패부대 병참장교',
    RARE_NPC_10119 = '볼찬',
    RARE_NPC_10077 = '송장아귀',
    RARE_NPC_9604 = '고르고노취',
    RARE_NPC_8979 = '그루클라쉬',
    RARE_NPC_9602 = '하크조르',
    RARE_NPC_8976 = '헤마토스',
    RARE_NPC_8981 = '상태이상의 전투절단기',
    RARE_NPC_10078 = '도깨비불꽃',
    RARE_NPC_8978 = '타우리스 발가르',
    RARE_NPC_8279 = '불완전한 전투골렘',
    RARE_NPC_8277 = '레크틸락',
    RARE_NPC_8281 = '스칼드',
    RARE_NPC_8280 = '셸리나르',
    RARE_NPC_8283 = '노예상인 블랙하트',
    RARE_NPC_8278 = '스몰더',
    RARE_NPC_8282 = '대영주 마스트로곤드',
    RARE_NPC_584 = '카존',
    RARE_NPC_14273 = '바위심장',
    RARE_NPC_616 = '우두머리 집게턱타란툴라',
    RARE_NPC_14271 = '늑골잡이',
    RARE_NPC_947 = '암살자 로',
    RARE_NPC_14269 = '수색자 아쿠알론',
    RARE_NPC_14272 = '불꽃용',
    RARE_NPC_14270 = '망둥이',
    RARE_NPC_763 = '드레노어 난민 족장',
    RARE_NPC_1106 = '드레노어 난민 요리사',
    RARE_NPC_14447 = '길모리안',
    RARE_NPC_14448 = '허물가시',
    RARE_NPC_14445 = '대군주 웜막',
    RARE_NPC_1063 = '비취',
    RARE_NPC_507 = '펜로스',
    RARE_NPC_771 = '사령관 펠스트롬',
    RARE_NPC_503 = '군주 말라스롬',
    RARE_NPC_521 = '루포스',
    RARE_NPC_574 = '나락시스',
    RARE_NPC_534 = '네파루',
    RARE_NPC_573 = '전투 절단기 4000',
    RARE_NPC_520 = '브랙',
    RARE_NPC_572 = '레프리투스',
    RARE_NPC_1424 = '우두머리 채굴꾼',
    RARE_NPC_506 = '부대장 가시발톱',
    RARE_NPC_519 = '슬라크',
    RARE_NPC_462 = '벌트로스',
    RARE_NPC_596 = '세뇌당한 귀족',
    RARE_NPC_599 = '마리사 두페이지',
    RARE_NPC_14446 = '핀개트',
    RARE_NPC_8301 = '칼날집게발 딸깍이',
    RARE_NPC_8304 = '드레드스콘',
    RARE_NPC_8303 = '꿀꿀이',
    RARE_NPC_8296 = '험상궂은 모조',
    RARE_NPC_8300 = '부라퀴',
    RARE_NPC_8299 = '재앙의 검은발톱',
    RARE_NPC_8298 = '현자 아쿠바르',
    RARE_NPC_8297 = '고집불통 마그로노스',
    RARE_NPC_8302 = '죽음의 눈',
    RARE_NPC_1061 = '간줄라',
    RARE_NPC_14491 = '쿠르모크',
    RARE_NPC_2541 = '군주 사크라시스',
    RARE_NPC_14490 = '리파',
    RARE_NPC_1552 = '무쇠비늘 바실리스크',
    RARE_NPC_14492 = '베리포닉스',
    RARE_NPC_723 = '모쉬오그일족 도살꾼',
    RARE_NPC_14487 = '글루글',
    RARE_NPC_11383 = '대여사제 하이와트나',
    RARE_NPC_14488 = '로로취',
    RARE_NPC_3581 = '시궁창 악어',
    RARE_NPC_1720 = '브루갈 아이언너클',
    RARE_NPC_5399 = '식인트롤 베이쟉',
    RARE_NPC_5400 = '젝키스',
    RARE_NPC_8924 = '거수',
    RARE_NPC_16854 = '엘디나르쿠스',
    RARE_NPC_16855 = '트레글라',
    RARE_NPC_22062 = '박사 위더림',
    RARE_NPC_5912 = '돌연변이 요정용',
    RARE_NPC_3652 = '채찍꼬리 트리고어',
    RARE_NPC_3672 = '보안',
    RARE_NPC_10080 = '산다르 듄리버',
    RARE_NPC_10081 = '더스트레이스',
    RARE_NPC_10082 = '제릴리스',
    RARE_NPC_12237 = '정원사 메슬로크',
    RARE_NPC_11447 = '머쉬고그',
    RARE_NPC_11497 = '라자',
    RARE_NPC_11498 = '무패의 스카르',
    RARE_NPC_11467 = '츄지',
    RARE_NPC_3068 = '마즈라나체',
    RARE_NPC_3058 = '알라치아',
    RARE_NPC_5787 = '감독관 에밀군드',
    RARE_NPC_5807 = '갈퀴',
    RARE_NPC_5786 = '스나글스피어',
    RARE_NPC_5785 = '마녀 헤이트래쉬',
    RARE_NPC_3056 = '유령울음늑대',
    RARE_NPC_5822 = '펠위버 스코른',
    RARE_NPC_5823 = '맹독무당전갈',
    RARE_NPC_5824 = '호위대장 납작어금니',
    RARE_NPC_5826 = '가시대장 점박이',
    RARE_NPC_5808 = '대장 콜카니스',
    RARE_NPC_5809 = '경비대장 잘라필',
    RARE_NPC_5828 = '사자왕 후마르',
    RARE_NPC_5842 = '껑충발 타크',
    RARE_NPC_5834 = '창공의 칼날 아제레',
    RARE_NPC_5865 = '디슈',
    RARE_NPC_5836 = '기술자 휠리기그',
    RARE_NPC_5835 = '현장감독 그릴즈',
    RARE_NPC_3295 = '녹괴물',
    RARE_NPC_5829 = '칼날발톱 킁킁이',
    RARE_NPC_5837 = '무쇠팔',
    RARE_NPC_5838 = '부러진창',
    RARE_NPC_3470 = '라소리안',
    RARE_NPC_5863 = '가시사제 구크로크',
    RARE_NPC_3253 = '여왕 실리시드',
    RARE_NPC_5832 = '천둥발굽',
    RARE_NPC_5849 = '채굴꾼 플레임포지',
    RARE_NPC_5847 = '헤긴 스톤위스커',
    RARE_NPC_5848 = '말긴 발리브루',
    RARE_NPC_3398 = '게샤라한',
    RARE_NPC_5797 = '이안 스위프트리버',
    RARE_NPC_7895 = '사절 블러드레이지',
    RARE_NPC_5827 = '브론투스',
    RARE_NPC_5851 = '경비대장 지로그 해머토',
    RARE_NPC_3270 = '장로비술사 레이저스나웃',
    RARE_NPC_5859 = '하그 타우렌베인',
    RARE_NPC_5799 = '한나 블레이드리프',
    RARE_NPC_5800 = '마커스 벨',
    RARE_NPC_5841 = '바위송곳',
    RARE_NPC_5830 = '마녀 라스탈론',
    RARE_NPC_5831 = '번개갈기',
    RARE_NPC_5864 = '가시근위병 스와인가트',
    RARE_NPC_5798 = '토라 페더문',
    RARE_NPC_6584 = '폭군 모쉬',
    RARE_NPC_6582 = '여왕 자바스',
    RARE_NPC_6581 = '우두머리 라바사우루스',
    RARE_NPC_6585 = '우크로크',
    RARE_NPC_6583 = '그러프',
    RARE_NPC_3535 = '악취나는 검은이끼괴물',
    RARE_NPC_14430 = '그늘표범',
    RARE_NPC_14431 = '복수의 여신 쉘다',
    RARE_NPC_14432 = '트레길',
    RARE_NPC_14428 = '우루손',
    RARE_NPC_14429 = '검은아귀',
    RARE_NPC_2186 = '파괴자 카니버스',
    RARE_NPC_2192 = '불꽃의 소환사 래디슨',
    RARE_NPC_7015 = '무자비한 플래글머크',
    RARE_NPC_2184 = '여군주 문게이저',
    RARE_NPC_2191 = '리킬린',
    RARE_NPC_2175 = '그림자발톱',
    RARE_NPC_2172 = '우두머리 타조',
    RARE_NPC_7016 = '여군주 베스피라',
    RARE_NPC_7017 = '군주 신슬레이어',
    RARE_NPC_14342 = '성난발톱',
    RARE_NPC_14340 = '맹독숨결 알쉬르',
    RARE_NPC_14339 = '검은울음',
    RARE_NPC_14344 = '몽그레스',
    RARE_NPC_14343 = '지혜의 오름',
    RARE_NPC_14345 = '온가르',
    RARE_NPC_7104 = '데시쿠스',
    RARE_NPC_7137 = '이몰라투스',
    RARE_NPC_6651 = '문지기 레이지로어',
    RARE_NPC_6647 = '마법학자 호크헬름',
    RARE_NPC_6648 = '안틸로스',
    RARE_NPC_6650 = '장군 팽페러',
    RARE_NPC_6649 = '여군주 세스피라',
    RARE_NPC_8660 = '에발차르',
    RARE_NPC_6118 = '바로덴의 유령발늑대',
    RARE_NPC_6652 = '군주 피어드레드',
    RARE_NPC_6646 = '고대의 몬노스',
    RARE_NPC_13896 = '비늘수염',
    RARE_NPC_3735 = '연금술사 팔디스',
    RARE_NPC_10559 = '여군주 베스피아',
    RARE_NPC_10644 = '긴울음 안개늑대',
    RARE_NPC_10641 = '썩은가지',
    RARE_NPC_10643 = '우렁비늘',
    RARE_NPC_10647 = '왕자 라제',
    RARE_NPC_10639 = '난폭한 몽구리',
    RARE_NPC_3792 = '테로울프 우두머리',
    RARE_NPC_12037 = '우르솔로크',
    RARE_NPC_10642 = '엑칼롬',
    RARE_NPC_10640 = '떡갈손',
    RARE_NPC_3736 = '어둠의암살자 몰덴살',
    RARE_NPC_3773 = '아크릴루스',
    RARE_NPC_4066 = '날타스자르',
    RARE_NPC_4015 = '우두머리 사자날개 와이번',
    RARE_NPC_5916 = '파수꾼 아마랏산',
    RARE_NPC_4030 = '복수심에 불타는 고대정령',
    RARE_NPC_5915 = '수사 레이븐오크',
    RARE_NPC_5931 = '현장감독 리거',
    RARE_NPC_5930 = '마녀 리벤',
    RARE_NPC_5928 = '슬픈날개',
    RARE_NPC_5932 = '행동대장 채찍송곳니',
    RARE_NPC_14230 = '외눈박이',
    RARE_NPC_4380 = '암흑안개 과부거미',
    RARE_NPC_14234 = '하요크',
    RARE_NPC_4339 = '피바다',
    RARE_NPC_14232 = '바람뿔',
    RARE_NPC_14231 = '방랑자 드로고스',
    RARE_NPC_14236 = '마크루라왕 아귀',
    RARE_NPC_14237 = '수액벌레',
    RARE_NPC_14233 = '비늘톱',
    RARE_NPC_14235 = '시궁괴물',
    RARE_NPC_14225 = '왕자 켈렌',
    RARE_NPC_14228 = '갈갈이',
    RARE_NPC_14227 = '히스페락',
    RARE_NPC_14226 = '카스크',
    RARE_NPC_14229 = '저주받은 뱀갈퀴일족 나가',
    RARE_NPC_11688 = '저주받은 켄타우로스',
    RARE_NPC_5347 = '창공의 안틸루스',
    RARE_NPC_5349 = '아라쉬에디스',
    RARE_NPC_12801 = '불가사의한 키메로크',
    RARE_NPC_5346 = '추적자 블러드로어',
    RARE_NPC_12800 = '키메로크',
    RARE_NPC_12802 = '굶주린 키메로크',
    RARE_NPC_5345 = '다이아몬드 마크루라',
    RARE_NPC_5354 = '날 리프브라더',
    RARE_NPC_5343 = '여군주 스잘라',
    RARE_NPC_5352 = '늙은 그리즐거트',
    RARE_NPC_5350 = '퀴로트',
    RARE_NPC_5356 = '스날러',
    RARE_NPC_5933 = '추방자 아킬리오스',
    RARE_NPC_4132 = '갈퀴발톱 실리시드',
    RARE_NPC_5935 = '무적의 무쇠눈바실리스크',
    RARE_NPC_14427 = '기블스니크',
    RARE_NPC_14426 = '하브 파울마운틴',
    RARE_NPC_5934 = '칼날심장',
    RARE_NPC_5937 = '죽음의 맹독전갈',
    RARE_NPC_8207 = '거대한 불새',
    RARE_NPC_8205 = '포악한 하르카',
    RARE_NPC_8203 = '크레그 킬하울',
    RARE_NPC_8208 = '피에 굶주린 문둥발하이에나',
    RARE_NPC_8202 = '미치광이 사이클록',
    RARE_NPC_8201 = '실성한 옴고른',
    RARE_NPC_8204 = '파멸의 소리드',
    RARE_NPC_8200 = '모래술사 진잘라',
    RARE_NPC_8199 = '부대장 크라질락',
    RARE_NPC_14472 = '그리시르',
    RARE_NPC_14477 = '그룹토르',
    RARE_NPC_14478 = '허리케니안',
    RARE_NPC_14476 = '크렐락크',
    RARE_NPC_14473 = '라프리스',
    RARE_NPC_14471 = '세티스',
    RARE_NPC_14479 = '황혼의 군주 이브런',
    RARE_NPC_15308 = '황혼의 예언자',
    RARE_NPC_14474 = '조라',
    RARE_NPC_14475 = '렉스 아쉴',
    RARE_NPC_10200 = '라크쉬리',
    RARE_NPC_10197 = '포효의 메찌르',
    RARE_NPC_10201 = '여군주 헤더린',
    RARE_NPC_10199 = '눈발톱 그리즐',
    RARE_NPC_10202 = '아주로우스',
    RARE_NPC_10196 = '장군 콜바탄',
    RARE_NPC_10198 = '약탈자 카쇼크',
    RARE_NPC_4425 = '눈먼사냥꾼',
    RARE_NPC_4842 = '대지의주술사 함가르',
    RARE_NPC_7354 = '너덜주둥이',
    RARE_NPC_22060 = '암살자 페닛사',

    -- Built-in title catalog: labels and grammatical name placement.
    TITLE_BUILTIN_EXPLORER_LABEL = '정복자',
    TITLE_BUILTIN_EXPLORER_FORMAT_MALE = '정복자 %s',
    TITLE_BUILTIN_EXPLORER_FORMAT_FEMALE = '정복자 %s',
    TITLE_BUILTIN_THE_ELUSIVE_LABEL = '종잡을 수 없는 자',
    TITLE_BUILTIN_THE_ELUSIVE_FORMAT_MALE = '종잡을 수 없는 자 %s',
    TITLE_BUILTIN_THE_ELUSIVE_FORMAT_FEMALE = '종잡을 수 없는 자 %s',
    TITLE_BUILTIN_BATTLEMASTER_LABEL = '지휘관',
    TITLE_BUILTIN_BATTLEMASTER_FORMAT_MALE = '지휘관 %s',
    TITLE_BUILTIN_BATTLEMASTER_FORMAT_FEMALE = '지휘관 %s',
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
    TITLE_BUILTIN_JENKINS_LABEL = '젠킨스',
    TITLE_BUILTIN_JENKINS_FORMAT_MALE = '젠킨스 %s',
    TITLE_BUILTIN_JENKINS_FORMAT_FEMALE = '젠킨스 %s',
    TITLE_BUILTIN_AZEROTHS_GREATEST_ANGLER_LABEL = 'Größter Angler von Azeroth', --#--#--
    TITLE_BUILTIN_AZEROTHS_GREATEST_ANGLER_FORMAT_MALE = '%s, der größte Angler von Azeroth', --#--#--
    TITLE_BUILTIN_AZEROTHS_GREATEST_ANGLER_FORMAT_FEMALE = '%s, die größte Anglerin von Azeroth', --#--#--
    TITLE_BUILTIN_CHEF_LABEL = '요리사',
    TITLE_BUILTIN_CHEF_FORMAT_MALE = '요리사 %s',
    TITLE_BUILTIN_CHEF_FORMAT_FEMALE = '요리사 %s',
    TITLE_BUILTIN_THE_EXALTED_LABEL = 'Der Ehrfurchtgebietende', --#--#--
    TITLE_BUILTIN_THE_EXALTED_FORMAT_MALE = '%s der Ehrfurchtgebietende', --#--#--
    TITLE_BUILTIN_THE_EXALTED_FORMAT_FEMALE = '%s die Ehrfurchtgebietende', --#--#--
    TITLE_BUILTIN_BLOODSAIL_ADMIRAL_LABEL = '붉은해적단 제독',
    TITLE_BUILTIN_BLOODSAIL_ADMIRAL_FORMAT_MALE = '붉은해적단 제독 %s',
    TITLE_BUILTIN_BLOODSAIL_ADMIRAL_FORMAT_FEMALE = '붉은해적단 제독 %s',
    TITLE_BUILTIN_THE_HALLOWED_LABEL = '성자',
    TITLE_BUILTIN_THE_HALLOWED_FORMAT_MALE = '성자 %s',
    TITLE_BUILTIN_THE_HALLOWED_FORMAT_FEMALE = '성자 %s',
    TITLE_BUILTIN_MERRYMAKER_LABEL = '흥겨운 축제꾼',
    TITLE_BUILTIN_MERRYMAKER_FORMAT_MALE = '흥겨운 축제꾼 %s',
    TITLE_BUILTIN_MERRYMAKER_FORMAT_FEMALE = '흥겨운 축제꾼 %s',
    TITLE_BUILTIN_THE_LOVE_FOOL_LABEL = 'Liebesgott', --#--#--
    TITLE_BUILTIN_THE_LOVE_FOOL_FORMAT_MALE = '%s, Liebesgott', --#--#--
    TITLE_BUILTIN_THE_LOVE_FOOL_FORMAT_FEMALE = '%s, Liebesgöttin', --#--#--
    TITLE_BUILTIN_ELDER_LABEL = '결투사',
    TITLE_BUILTIN_ELDER_FORMAT_MALE = '결투사 %s',
    TITLE_BUILTIN_ELDER_FORMAT_FEMALE = '결투사 %s',
    TITLE_BUILTIN_PATRON_LABEL = '후원자',
    TITLE_BUILTIN_PATRON_FORMAT_MALE = '후원자 %s',
    TITLE_BUILTIN_PATRON_FORMAT_FEMALE = '보모 %s',
    TITLE_BUILTIN_FLAME_KEEPER_LABEL = '도전자',
    TITLE_BUILTIN_FLAME_KEEPER_FORMAT_MALE = '도전자 %s',
    TITLE_BUILTIN_FLAME_KEEPER_FORMAT_FEMALE = '도전자 %s',
    TITLE_BUILTIN_THE_LOREMASTER_LABEL = '현자',
    TITLE_BUILTIN_THE_LOREMASTER_FORMAT_MALE = '현자 %s',
    TITLE_BUILTIN_THE_LOREMASTER_FORMAT_FEMALE = '현자 %s',
    TITLE_BUILTIN_CONQUEROR_BLACK_TEMPLE_LABEL = 'Bezwinger des Schwarzen Tempels', --#--#--
    TITLE_BUILTIN_CONQUEROR_BLACK_TEMPLE_FORMAT_MALE = '%s, Bezwinger des Schwarzen Tempels', --#--#--
    TITLE_BUILTIN_CONQUEROR_BLACK_TEMPLE_FORMAT_FEMALE = '%s, Bezwingerin des Schwarzen Tempels', --#--#--
    TITLE_BUILTIN_CONQUEROR_OF_OUTLAND_LABEL = 'Eroberer der Scherbenwelt', --#--#--
    TITLE_BUILTIN_CONQUEROR_OF_OUTLAND_FORMAT_MALE = '%s, Eroberer der Scherbenwelt', --#--#--
    TITLE_BUILTIN_CONQUEROR_OF_OUTLAND_FORMAT_FEMALE = '%s, Eroberin der Scherbenwelt', --#--#--
    TITLE_BUILTIN_CHAMPION_OF_THE_NAARU_LABEL = '나루의 용사',
    TITLE_BUILTIN_CHAMPION_OF_THE_NAARU_FORMAT_MALE = 'Champion der Naaru %s', --#--#--
    TITLE_BUILTIN_CHAMPION_OF_THE_NAARU_FORMAT_FEMALE = 'Champion der Naaru %s', --#--#--
    TITLE_BUILTIN_HAND_OF_ADAL_LABEL = '아달의 수호자',
    TITLE_BUILTIN_HAND_OF_ADAL_FORMAT_MALE = 'Hand von A\'dal %s', --#--#--
    TITLE_BUILTIN_HAND_OF_ADAL_FORMAT_FEMALE = 'Hand von A\'dal %s', --#--#--
    TITLE_BUILTIN_HERO_OF_OUTLAND_LABEL = 'Held der Scherbenwelt', --#--#--
    TITLE_BUILTIN_HERO_OF_OUTLAND_FORMAT_MALE = 'Held der Scherbenwelt %s', --#--#--
    TITLE_BUILTIN_HERO_OF_OUTLAND_FORMAT_FEMALE = 'Heldin der Scherbenwelt %s', --#--#--
    TITLE_BUILTIN_GREAT_HERO_OF_OUTLAND_LABEL = 'Großartiger Held der Scherbenwelt', --#--#--
    TITLE_BUILTIN_GREAT_HERO_OF_OUTLAND_FORMAT_MALE = 'Großartiger Held der Scherbenwelt %s', --#--#--
    TITLE_BUILTIN_GREAT_HERO_OF_OUTLAND_FORMAT_FEMALE = 'Großartige Heldin der Scherbenwelt %s', --#--#--
    TITLE_BUILTIN_BREWMASTER_LABEL = '시음가',
    TITLE_BUILTIN_BREWMASTER_FORMAT_MALE = '시음가 %s',
    TITLE_BUILTIN_BREWMASTER_FORMAT_FEMALE = '시음가 %s',
    -- End built-in title catalog
}

SexyLib:InitLocalization('Anniversary Achievements', L)
