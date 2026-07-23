local _, ns = ...

local savedVariables = ns.SavedVariables
local state = {}
ns.State = state

function state:EnsureInitialized()
    return savedVariables:Initialize()
end

function state:GetLocalData()
    return savedVariables:GetLocalData()
end

function state:ResetLocalData()
    return savedVariables:ResetLocalData()
end

function state:GetSettings()
    return savedVariables:GetSettings()
end

function state:GetFlags()
    return savedVariables:GetFlags()
end

function state:SetFlags(value)
    return savedVariables:SetFlags(value)
end

function state:GetSchemaStatus()
    return savedVariables:GetSchemaStatus()
end
