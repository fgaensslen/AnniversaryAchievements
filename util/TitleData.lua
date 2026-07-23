local _, ns = ...

local titleData = {}
ns.TitleData = titleData

local loc = SexyLib:Localization("Anniversary Achievements")

local function NormalizeWhitespace(value)
    if type(value) ~= "string" then return "" end
    return (value:gsub("%s+", " "):gsub("^%s+", ""):gsub("%s+$", ""))
end

local function Slug(value)
    value = NormalizeWhitespace(value):lower()
    value = value:gsub("['’]", "")
    value = value:gsub("[^%w]+", "_")
    value = value:gsub("^_+", ""):gsub("_+$", "")
    return value ~= "" and value or "title"
end

local function Entry(key, localizationKey, nativeMask, nativeMaskFemale)
    return {
        key = "builtin." .. key,
        localizationKey = localizationKey,
        nativeMask = nativeMask,
        nativeMaskFemale = nativeMaskFemale,
    }
end

-- The catalog contains only stable identifiers and native title masks.
-- Labels and grammatical display formats live exclusively in the active localization/classic or localization/tbc files.
local BUILTIN = {
    explorer = Entry("explorer", "TITLE_BUILTIN_EXPLORER", 47),
    the_elusive = Entry("the_elusive", "TITLE_BUILTIN_THE_ELUSIVE", nil),
    battlemaster = Entry("battlemaster", "TITLE_BUILTIN_BATTLEMASTER", 210),
    defender_of_azeroth = Entry("defender_of_azeroth", "TITLE_BUILTIN_DEFENDER_OF_AZEROTH", nil),
    hero_of_azeroth = Entry("hero_of_azeroth", "TITLE_BUILTIN_HERO_OF_AZEROTH", nil),
    great_hero_of_azeroth = Entry("great_hero_of_azeroth", "TITLE_BUILTIN_GREAT_HERO_OF_AZEROTH", nil),
    emerald_keeper = Entry("emerald_keeper", "TITLE_BUILTIN_EMERALD_KEEPER", nil),
    jenkins = Entry("jenkins", "TITLE_BUILTIN_JENKINS", 110),
    azeroths_greatest_angler = Entry("azeroths_greatest_angler", "TITLE_BUILTIN_AZEROTHS_GREATEST_ANGLER", nil),
    chef = Entry("chef", "TITLE_BUILTIN_CHEF", 52),
    the_exalted = Entry("the_exalted", "TITLE_BUILTIN_THE_EXALTED", nil),
    bloodsail_admiral = Entry("bloodsail_admiral", "TITLE_BUILTIN_BLOODSAIL_ADMIRAL", 111),
    the_hallowed = Entry("the_hallowed", "TITLE_BUILTIN_THE_HALLOWED", 92),
    merrymaker = Entry("merrymaker", "TITLE_BUILTIN_MERRYMAKER", 102),
    the_love_fool = Entry("the_love_fool", "TITLE_BUILTIN_THE_LOVE_FOOL", nil),
    elder = Entry("elder", "TITLE_BUILTIN_ELDER", 43),
    patron = Entry("patron", "TITLE_BUILTIN_PATRON", 105, 104),
    flame_keeper = Entry("flame_keeper", "TITLE_BUILTIN_FLAME_KEEPER", 45),
    the_loremaster = Entry("the_loremaster", "TITLE_BUILTIN_THE_LOREMASTER", 93),
    conqueror_of_the_black_temple = Entry("conqueror_black_temple", "TITLE_BUILTIN_CONQUEROR_BLACK_TEMPLE", nil),
    conqueror_of_outland = Entry("conqueror_of_outland", "TITLE_BUILTIN_CONQUEROR_OF_OUTLAND", nil),
    champion_of_the_naaru = Entry("champion_of_the_naaru", "TITLE_BUILTIN_CHAMPION_OF_THE_NAARU", nil),
    hand_of_adal = Entry("hand_of_adal", "TITLE_BUILTIN_HAND_OF_ADAL", nil),
    hero_of_outland = Entry("hero_of_outland", "TITLE_BUILTIN_HERO_OF_OUTLAND", nil),
    great_hero_of_outland = Entry("great_hero_of_outland", "TITLE_BUILTIN_GREAT_HERO_OF_OUTLAND", nil),
    brewmaster = Entry("brewmaster", "TITLE_BUILTIN_BREWMASTER", 101),
}

local BUILTIN_BY_LABEL_KEY = {}
for _, definition in pairs(BUILTIN) do
    BUILTIN_BY_LABEL_KEY[definition.localizationKey .. "_LABEL"] = definition
end

local function LocalizedValue(key)
    local value = loc:GetRaw(key)
    return NormalizeWhitespace(value)
end

local function FallbackFormat(label)
    local pattern = LocalizedValue("TITLE_FALLBACK_FORMAT")
    if pattern == "" then return "%s" end

    local ok, value = pcall(string.format, pattern, "%s", label)
    if not ok then return "%s" end
    return NormalizeWhitespace(value)
end

function titleData:NormalizeLabel(value)
    return NormalizeWhitespace(value)
end

function titleData:MakeStableKey(prefix, value)
    return tostring(prefix or "title") .. "." .. Slug(value)
end

function titleData:ResolveBuiltIn(rewardDefinition)
    local definition
    local fallbackLabel

    if type(rewardDefinition) == "string" then
        definition = BUILTIN_BY_LABEL_KEY[rewardDefinition]
        if not definition then return nil end
        fallbackLabel = LocalizedValue(rewardDefinition)
    elseif type(rewardDefinition) == "table" then
        local englishLabel = NormalizeWhitespace(rewardDefinition.enUS or rewardDefinition.deDE
            or rewardDefinition.esES or rewardDefinition.esMX)
        fallbackLabel = NormalizeWhitespace(rewardDefinition[GetLocale()] or rewardDefinition.enUS
            or rewardDefinition.deDE or rewardDefinition.esES or rewardDefinition.esMX)
        if englishLabel == "" or fallbackLabel == "" then return nil end
        definition = BUILTIN[Slug(englishLabel)]
        if not definition then
            return {
                key = self:MakeStableKey("builtin", englishLabel),
                label = fallbackLabel,
                format = FallbackFormat(fallbackLabel),
                femaleFormat = FallbackFormat(fallbackLabel),
            }
        end
    else
        return nil
    end

    local label = LocalizedValue(definition.localizationKey .. "_LABEL")
    local format = LocalizedValue(definition.localizationKey .. "_FORMAT_MALE")
    local femaleFormat = LocalizedValue(definition.localizationKey .. "_FORMAT_FEMALE")
    if label == "" then label = fallbackLabel end
    if format == "" then format = FallbackFormat(label) end
    if femaleFormat == "" then femaleFormat = format end

    return {
        key = definition.key,
        label = label,
        format = format,
        femaleFormat = femaleFormat,
        nativeMask = definition.nativeMask,
        nativeMaskFemale = definition.nativeMaskFemale,
    }
end

function titleData:CreateExtensionReward(moduleID, achievementKey, rewardText, definition)
    definition = definition == true and {} or definition
    if type(definition) ~= "table" then return nil end

    local keyPart = definition.key or achievementKey
    local key = "extension." .. tostring(moduleID) .. "." .. tostring(keyPart)
    local format = NormalizeWhitespace(definition.format)
    local femaleFormat = NormalizeWhitespace(definition.femaleFormat)
    local label = NormalizeWhitespace(rewardText)

    if format == "" then format = FallbackFormat(label) end
    if femaleFormat == "" then femaleFormat = format end

    return {
        key = key,
        label = label,
        format = format,
        femaleFormat = femaleFormat,
        nativeMask = definition.nativeMask,
        nativeMaskFemale = definition.nativeMaskFemale,
        sourceModuleID = moduleID,
    }
end
