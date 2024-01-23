-- BRS_Otherworldly_Nexus
-- Author: Sanakan
-- DateCreated: 1/4/2024 12:01:12 PM
--------------------------------------------------------------
print("BRS_Otherworldly_Nexus.lua has loaded.")
local DEBUG_MODE = false -- set true to print to Lua.log, or don't.

local oDistrict = GameInfo.Districts["DISTRICT_SGA_BRS_OTHERWORLDLY_NEXUS"].Index
local barbarianPlayerID = 63 -- always barbarian id
local playerStrongestUnits = {}
local bUnitFallback = "UNIT_WARRIOR"
local query = "SELECT Tag FROM TypeTags WHERE Type = ? AND Tag LIKE 'CLASS_%%'" -- do not, don't

local function debugPrint(debug)
    if DEBUG_MODE then
        print(debug)
    end
end

function IsBlackRockShooter(playerID)
    local civType = PlayerConfigurations[playerID]:GetCivilizationTypeName()
    debugPrint("IsBlackRockShooter - Checking if player is Black Rock Shooter. Player ID:", playerID, "Civ Type:", civType)
    return civType == 'CIVILIZATION_SGA_BRS'
end

function OnDiplomacyDeclareWar(firstPlayerID, secondPlayerID)
    debugPrint("OnDiplomacyDeclareWar - Diplomacy Declare War. First Player ID:", firstPlayerID, "Second Player ID:", secondPlayerID)
    if IsBlackRockShooter(firstPlayerID) then
        SpawnBarbariansInOtherworldlyNexus(firstPlayerID)
    end
    if IsBlackRockShooter(secondPlayerID) then
        SpawnBarbariansInOtherworldlyNexus(secondPlayerID)
    end
end

function SpawnBarbariansInOtherworldlyNexus(playerID)
    debugPrint("SpawnBarbariansInOtherworldlyNexus - Spawning Barbarians in Otherworldly Nexus. Player ID:", playerID)
    local player = Players[playerID]
    local districts = player:GetDistricts()
    for i, district in districts:Members() do
        if district:GetType() == oDistrict then
            debugPrint("SpawnBarbariansInOtherworldlyNexus - Found Otherworldly Nexus district. X:", district:GetX(), "Y:", district:GetY())
            SpawnDynamicBarbarianAtPlot(district:GetX(), district:GetY())
        end
    end
end

function OnDistrictConstructed(playerID, districtID, iX, iY)
    debugPrint("OnDistrictConstructed - District Added. Player ID:", playerID, "District ID:", districtID, "X:", iX, "Y:", iY)
    if districtID == oDistrict then
        debugPrint("OnDistrictConstructed - Spawning Barbarian unit for constructed Otherworldly Nexus.")
        SpawnDynamicBarbarianAtPlot(iX, iY)
    end
end

function SpawnDynamicBarbarianAtPlot(x, y)
    debugPrint("SpawnDynamicBarbarianAtPlot - Spawning Barbarian near plot. X:", x, "Y:", y)
    local spawnPlot = FindAdjacentPlotForUnit(x, y)
    if spawnPlot then
        debugPrint("SpawnDynamicBarbarianAtPlot - Found adjacent plot for spawning. X:", spawnPlot:GetX(), "Y:", spawnPlot:GetY())
        GenerateRandomBarbarian(spawnPlot)
    else
        debugPrint("SpawnDynamicBarbarianAtPlot - No valid adjacent plot found for spawning.")
    end
end

function FindAdjacentPlotForUnit(x, y)
    debugPrint("FindAdjacentPlotForUnit - Finding adjacent plot for unit. X:", x, "Y:", y)
    for dx = -1, 1 do
        for dy = -1, 1 do
            local plot = Map.GetPlotXYWithRangeCheck(x, y, dx, dy, 1)
            if plot and not plot:IsMountain() and not plot:IsWater() and not plot:IsCity() and not plot:IsUnit() then
                debugPrint("FindAdjacentPlotForUnit - Found valid adjacent plot. X:", plot:GetX(), "Y:", plot:GetY())
                return plot
            end
        end
    end
    debugPrint("FindAdjacentPlotForUnit - No adjacent plot found.")
    return nil
end

function OnUnitAddedToMap(playerID, unitID)
    local player = Players[playerID]
    if player and IsBlackRockShooter(playerID) then
        local unit = player:GetUnits():FindID(unitID)
        if unit and unit:GetCombat() > 0 then
            local unitTypeID = unit:GetType()
            local unitTypeString = GameInfo.Units[unitTypeID].UnitType
            local unitClass = GetUnitClassFromTypeTags(unitTypeString)
            if unitClass and (not playerStrongestUnits[unitClass] or unit:GetCombat() > playerStrongestUnits[unitClass].combatStrength) then
                playerStrongestUnits[unitClass] = { unitType = unitTypeString, combatStrength = unit:GetCombat() }
                debugPrint("OnUnitAddedToMap - Updated strongest unit for class:", unitClass, "Unit Type:", unitTypeString, "Combat Strength:", unit:GetCombat())
            end
        end
    end
end

function GenerateRandomBarbarian(plot)
    debugPrint("GenerateRandomBarbarian - GenerateRandomBarbarian called. Plot X:", plot:GetX(), "Plot Y:", plot:GetY())
    local unitTypes = {}
    for _, unitInfo in pairs(playerStrongestUnits) do
        table.insert(unitTypes, unitInfo.unitType)
    end
    local unitType = #unitTypes > 0 and unitTypes[math.random(#unitTypes)] or bUnitFallback
    debugPrint("GenerateRandomBarbarian - Creating barbarian unitType:", unitType)
    CreateBarbarianUnit(unitType, plot)
end

function CreateBarbarianUnit(unitType, plot)
    if Players[barbarianPlayerID]:IsInitialized() then
        UnitManager.InitUnit(barbarianPlayerID, unitType, plot:GetX(), plot:GetY())
        debugPrint("CreateBarbarianUnit - Created Barbarian Unit. Type:", unitType, "Plot X:", plot:GetX(), "Plot Y:", plot:GetY())
    else
        debugPrint("CreateBarbarianUnit - Error: Barbarian player not initialized or not found.")
    end
end

function GetUnitClassFromTypeTags(unitType)
    local results = DB.Query(query, unitType)
    for i, row in ipairs(results or {}) do
        if row and row.Tag then
            debugPrint("GetUnitClassFromTypeTags - Found Tag from query:", row.Tag)
            return row.Tag
        end
    end
    debugPrint("GetUnitClassFromTypeTags - No results found for query.")
    return nil
end

GameEvents.OnDistrictConstructed.Add(OnDistrictConstructed)
Events.DiplomacyDeclareWar.Add(OnDiplomacyDeclareWar)
Events.UnitAddedToMap.Add(OnUnitAddedToMap) -- Update the Black Rock Shooter's current era units