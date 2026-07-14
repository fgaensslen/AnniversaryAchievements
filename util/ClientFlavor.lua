local _, ns = ...

local _, _, _, interfaceVersion = GetBuildInfo()
interfaceVersion = tonumber(interfaceVersion) or 0

local isClassicEra = interfaceVersion >= 11500 and interfaceVersion < 20000
local isTBCAnniversary = interfaceVersion >= 20500 and interfaceVersion < 30000

-- Fallback for development clients that do not expose the expected interface number.
if not isClassicEra and not isTBCAnniversary then
    local projectID = WOW_PROJECT_ID
    if WOW_PROJECT_CLASSIC and projectID == WOW_PROJECT_CLASSIC then
        isClassicEra = true
    elseif WOW_PROJECT_BURNING_CRUSADE_CLASSIC and projectID == WOW_PROJECT_BURNING_CRUSADE_CLASSIC then
        isTBCAnniversary = true
    end
end

ns.ClientFlavor = {
    interfaceVersion = interfaceVersion,
    isClassicEra = isClassicEra,
    isTBCAnniversary = isTBCAnniversary,
}

ns.IsClassicEra = isClassicEra
ns.IsTBCAnniversary = isTBCAnniversary
