-- BRS_Two_Worlds
-- Author: Sanakan
-- DateCreated: 12/31/2023 10:29:30 AM
--------------------------------------------------------------
print("BRS_Two_Worlds.lua has loaded.")
local DEBUG_MODE = false -- set true to print to Lua.log, or don't.

ExposedMembers.BRS_Table = {}
local TWO_WORLDS_BONUS_STRENGTH = 1

-- Utility function for debug printing
local function debugPrint(debug)
    if DEBUG_MODE then
        print(debug)
    end
end

function IsBlackRockShooter(player)
    local civType = PlayerConfigurations[player:GetID()]:GetCivilizationTypeName()
    debugPrint("IsBlackRockShooter - Checking Civilization Type for Player ID:", player:GetID(), "Civilization Type:", civType)
    return civType == 'CIVILIZATION_SGA_BRS'
end

function OnTurnBegin()
    debugPrint("OnTurnBegin - Turn has begun")
    local players = Game.GetPlayers()
    for i, player in ipairs(players) do
        debugPrint("OnTurnBegin - Checking Player ID:", player:GetID())
        if player:IsMajor() and player:IsAlive() and IsBlackRockShooter(player) then
            debugPrint("OnTurnBegin - Updating Two Worlds for Player ID:", player:GetID())
            UpdateTwoWorlds(player)
        end
    end
end

function UpdateTwoWorlds(player)
    local playerID = player:GetID()
    debugPrint("UpdateTwoWorlds - Player ID:", playerID)
    local unitsInHomeTerritoryIDs, unitsInEnemyTerritoryIDs = CountUnitsByTerritory(player)
    local bonusApplied = false

    debugPrint("UpdateTwoWorlds - Applying/Removing Two Worlds Bonus for Player ID:", playerID)
    for _, unitID in ipairs(unitsInEnemyTerritoryIDs) do
        local unit = player:GetUnits():FindID(unitID)
        ApplyTwoWorlds(unit, #unitsInHomeTerritoryIDs)
        bonusApplied = true
    end
    for _, unitID in ipairs(unitsInHomeTerritoryIDs) do
        local unit = player:GetUnits():FindID(unitID)
        RemoveTwoWorlds(unit)
    end
    if bonusApplied and playerID == Game.GetLocalPlayer() then
        local bonusAmount = #unitsInHomeTerritoryIDs * TWO_WORLDS_BONUS_STRENGTH
        debugPrint("UpdateTwoWorlds - Sending Notification for Player ID:", playerID, "Bonus Amount:", bonusAmount)
        ExposedMembers.BRS_Table.SendTwoWorldsNotification(playerID, bonusAmount)
    end
end

function CountUnitsByTerritory(player)
    local unitsInHomeTerritory = {}
    local unitsInEnemyTerritory = {}
    local playerID = player:GetID()
    debugPrint("CountUnitsByTerritory - Counting units for Player ID:", playerID)
    for i, unit in player:GetUnits():Members() do
        if IsUnitInOwnerTerritory(unit) and unit:GetCombat() > 0 then
            table.insert(unitsInHomeTerritory, unit:GetID())
        elseif IsUnitInEnemyTerritory(unit, playerID) then
            table.insert(unitsInEnemyTerritory, unit:GetID())
        end
    end
    debugPrint("CountUnitsByTerritory - Units in Home Territory:", #unitsInHomeTerritory, "Units in Enemy Territory:", #unitsInEnemyTerritory)
    return unitsInHomeTerritory, unitsInEnemyTerritory
end

function IsUnitInOwnerTerritory(unit)
    local unitX, unitY = unit:GetX(), unit:GetY()
    local plot = Map.GetPlot(unitX, unitY)
    local isOwner = plot and plot:GetOwner() == unit:GetOwner()
	debugPrint("IsUnitInOwnerTerritory - Unit ID:", unit:GetID(), "Is Owner:", isOwner)
    return isOwner
end

function IsUnitInEnemyTerritory(unit, playerID)
    local unitX, unitY = unit:GetX(), unit:GetY()
    local plot = Map.GetPlot(unitX, unitY)
    if plot then
        local plotOwner = plot:GetOwner()
        local isInEnemyTerritory = plotOwner ~= -1 and plotOwner ~= playerID and Players[playerID]:GetDiplomacy():IsAtWarWith(plotOwner)
		debugPrint("IsUnitInEnemyTerritory - Unit ID:", unit:GetID(), "Is in Enemy Territory:", isInEnemyTerritory)
        return isInEnemyTerritory
    end
    return false
end

function ApplyTwoWorlds(unit, bonusAmount)
    local currentBonus = unit:GetProperty('TWO_WORLDS_COMBAT') or 0
	local newBonus = bonusAmount * TWO_WORLDS_BONUS_STRENGTH
	if currentBonus ~= newBonus then
        unit:SetProperty('TWO_WORLDS_COMBAT', newBonus)
        debugPrint("ApplyTwoWorlds - Bonus updated for Unit ID:", unit:GetID(), "New Bonus Value:", newBonus)
    else
        debugPrint("ApplyTwoWorlds - No change in bonus for Unit ID:", unit:GetID())
    end
end

function RemoveTwoWorlds(unit)
    local currentBonus = unit:GetProperty('TWO_WORLDS_COMBAT') or 0
    unit:SetProperty('TWO_WORLDS_COMBAT', 0)
    local newBonus = unit:GetProperty('TWO_WORLDS_COMBAT') or 0
	debugPrint("RemoveTwoWorlds - Unit ID:", unit:GetID(), "Bonus After Removal:", newBonus)
end

Events.TurnBegin.Add(OnTurnBegin)