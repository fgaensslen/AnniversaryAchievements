local db = CA_Database
local cmanager = CA_CompletionManager
local loc = SexyLib:Localization('Anniversary Achievements')

function GetAchievementLink(achievementID)
    local ach = db:GetAchievement(achievementID)
    if not ach then return nil end
    local completion = cmanager:GetLocal()
    local finished = 0
    local month, day, year = 0, 0, 0
    
    -- Split into two 32-bit integers to avoid overflow (supports up to 64 criteria)
    local criterias1, criterias2 = 0, 0
    
    if completion:IsAchievementCompleted(ach.id) then
        finished = 1
        local time = completion:GetAchievementCompletionTime(ach.id)
        month, day, year = tonumber(date('%m', time)), tonumber(date('%d', time)), tonumber(date('%y', time))
    end
    
    local index = 0
    for _, criteria in pairs(ach:GetCriterias()) do
        if completion:IsCriteriaCompleted(ach.id, criteria.id) then
            if index < 31 then
                criterias1 = bit.bor(criterias1, bit.lshift(1, index))
            else
                criterias2 = bit.bor(criterias2, bit.lshift(1, index - 31))
            end
        end
        index = index + 1
end

    -- New link format adds a second criteria block
    return string.format('[AnniversaryAchievement:%d:%s:%d:%d:%d:%d:%d:%d]', achievementID, UnitGUID('player'), finished, month, day, year, criterias1, criterias2)
end

local function FormatAnniversaryAchievementLinks(msg)
    local newMsg, remaining, done = '', msg, false

    repeat
        -- Updated pattern to look for the extra :%d at the end
        local start, finish, data = remaining:find('%[AnniversaryAchievement:(%d+:[^%]]+:%d:%d+:%d+:%d+:%d+:%d+)%]')
        if data then
            local link = ''
            local aid, guid, finished, month, day, year, c1, c2 = strsplit(':', data)
            if c1 then
                local ach = db:GetAchievement(tonumber(aid))
                if ach then
                    link = string.format(
                        '|cffffff00|Hgarrmission:clach:%d#%s#%d#%d#%d#%d#%d#%d|h[%s]|h|r',
                        aid, guid, finished, month, day, year, c1, c2, ach.name
                    )
                end
            end

            newMsg = newMsg .. remaining:sub(1, start - 1) .. link
            remaining = remaining:sub(finish + 1)
        else
            done = true
        end
    until done

    return newMsg .. remaining
end

local function ShowTooltip(lines, linesFromTop, activeCategories)
    ItemRefTooltip:Show();
    if not ItemRefTooltip:IsVisible() then
      ItemRefTooltip:SetOwner(UIParent, "ANCHOR_PRESERVE");
    end
    ItemRefTooltip:ClearLines();
    for i, line in ipairs(lines) do
      local sides, a1, a2, a3, a4, a5, a6, a7, a8 = unpack(line);
      if(sides == 1) then
        ItemRefTooltip:AddLine(a1, a2, a3, a4, a5);
      elseif(sides == 2) then
        ItemRefTooltip:AddDoubleLine(a1, a2, a3, a4, a5, a6, a7, a8);
      end
    end
    ItemRefTooltip:Show()
end

local function formatCriteriaCompletion(criteria)
    local color
    if criteria[2] then color = '&a' else color = '&7' end
    return SexyLib:Util():Colorize(color .. criteria[1])
end

local shownAchievementID = 0

hooksecurefunc('SetItemRef', function(link)
    local linkType, addon, params = strsplit(':', link)
    if linkType ~= 'garrmission' or addon ~= 'clach' then return end
    
    local aid, guid, finished, month, day, year, c1, c2 = strsplit('#', params)
    aid = tonumber(aid)
    finished = tonumber(finished)
    month = tonumber(month)
    day = tonumber(day)
    year = tonumber(year)
    c1 = tonumber(c1)
    c2 = tonumber(c2) or 0 -- Default to 0 for older links

    local ach = db:GetAchievement(aid)
    if ach == nil then return end
    
    if IsShiftKeyDown() then
        local editbox = GetCurrentKeyBoardFocus()
        if editbox then
            editbox:Insert('[AnniversaryAchievements: ' .. ach.name .. ']')
        end
    else
        if shownAchievementID == aid and ItemRefTooltip:IsVisible() then
            shownAchievementID = 0
            ItemRefTooltip:Hide()
            return
        end
        
        local lines = {
            {1, '|cffffffff' .. ach.name},
            {1, ' '}
        }

        local _, _, _, _, _, playerName = GetPlayerInfoByGUID(guid)
        if not playerName then playerName = '???' end
        if finished == 1 then
            lines[#lines + 1] = {1, loc:Get('achievement_earned', playerName, day, month, year)}
        else
            lines[#lines + 1] = {1, loc:Get('achievement_in_progress', playerName)}
        end
        lines[#lines + 1] = {1, ' '}

        -- Description wrapping logic
        local words = SexyLib:Util():Explode(ach.description, ' ')
        local sublines, subline = {}, ''
        for _, word in pairs(words) do
            if strlen(subline) + 1 + strlen(word) <= 100 then
                subline = (subline == '') and word or (subline .. ' ' .. word)
            else
                sublines[#sublines + 1] = subline
                subline = word
            end
        end
        if subline ~= '' then sublines[#sublines + 1] = subline end
        for _, sl in pairs(sublines) do lines[#lines + 1] = {1, sl} end
        
        -- Criteria logic updated for split bitfields
        local clist, index = {}, 0
        for _, criteria in pairs(ach:GetCriterias()) do
            if criteria.name and not criteria.quantity then
                local completed = false
                if index < 31 then
                local bt = bit.lshift(1, index)
                    completed = bit.band(c1, bt) == bt
                else
                    local bt = bit.lshift(1, index - 31)
                    completed = bit.band(c2, bt) == bt
                end
                clist[#clist + 1] = {criteria.name, completed}
            end
            index = index + 1
        end

        local size = #clist
        if size > 0 then
            lines[#lines + 1] = {1, ' '}
            local i = 1
            while i <= size do
                local inserted = false
                if i ~= size then
                    local a, b = formatCriteriaCompletion(clist[i]), formatCriteriaCompletion(clist[i + 1])
                    if strlen(a) + strlen(b) <= 100 then
                        inserted = true
                        i = i + 1
                        lines[#lines + 1] = {2, a, b}
                    end
                end
                if not inserted then lines[#lines + 1] = {1, formatCriteriaCompletion(clist[i])} end
                i = i + 1
            end
        end

        shownAchievementID = aid
        ShowTooltip(lines)
    end
end)

function CA_ShareAchievement(achievementID)
    if not CA_IsSharingAchievementsInChat() then return end

    local ach = db:GetAchievement(achievementID)
    if not ach then return end

    local gender = UnitSex('player')
    if gender <= 1 then return end

    gender = (gender == 2) and 'MALE' or 'FEMALE'

    local link = GetAchievementLink(achievementID)
    local fallback = "[" .. ach.name .. "]"
    local display = link or fallback

    local message = SexyLib:Localization('Anniversary Achievements'):Get(
        'GOT_ACHIEVEMENT_MESSAGE_' .. gender,
        display
    )

    PrintToSelf(message)
end

function PrintToSelf(msg)
    msg = FormatAnniversaryAchievementLinks(msg)
    DEFAULT_CHAT_FRAME:AddMessage("|cffffff00" .. msg .. "|r")
end