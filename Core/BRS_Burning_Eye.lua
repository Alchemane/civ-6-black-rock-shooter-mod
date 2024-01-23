-- BRS_Burning_Eye
-- Author: Sanakan
-- DateCreated: 12/29/2023 12:09:06 PM
--------------------------------------------------------------
print("BRS_BurningEye.lua has loaded.")
local DEBUG_MODE = false -- set true to print to Lua.log, or don't.

ExposedMembers.BRS_Table = {}
local affectedPlayers = {}
local BURNING_EYE_INITIAL_DURATION = 1
local BURNING_EYE_BONUS_STRENGTH = 10
local BURNING_EYE_BONUS_MOVEMENT = 1

-- Utility function for debug printing
local function debugPrint(debug)
    if DEBUG_MODE then
        print(debug)
    end
end

function PlayerHasBurningEye(playerID)
    local playerConfig = PlayerConfigurations[playerID]
    if playerConfig then
        local leaderType = playerConfig:GetLeaderTypeName()
        debugPrint("PlayerHasBurningEye - Checking Leader Type for Player ID:", playerID, "Leader Type:", leaderType)
        return leaderType == 'LEADER_SGA_BRS'
    end
    debugPrint("PlayerHasBurningEye - Player configuration not found for Player ID:", playerID)
    return false
end

function OnDiplomacyDeclareWar(firstPlayerID, secondPlayerID)
    debugPrint("OnDiplomacyDeclareWar - War declared. First Player ID:", firstPlayerID, "Second Player ID:", secondPlayerID)
    if PlayerHasBurningEye(firstPlayerID) or PlayerHasBurningEye(secondPlayerID) then
        local playerID = PlayerHasBurningEye(firstPlayerID) and firstPlayerID or secondPlayerID
        debugPrint("OnDiplomacyDeclareWar - Applying Burning Eye. Player ID:", playerID)
        ApplyBurningEye(playerID)
        affectedPlayers[playerID] = BURNING_EYE_INITIAL_DURATION
        ExposedMembers.BRS_Table.SendBurningEyeNotification(playerID, BURNING_EYE_BONUS_STRENGTH, BURNING_EYE_BONUS_MOVEMENT, affectedPlayers[playerID])
    else
        debugPrint("OnDiplomacyDeclareWar - Neither player has Burning Eye.")
    end
end

function OnTurnBegin()
    debugPrint("OnTurnBegin - Turn begin. Checking affected players for Burning Eye ability.")
    for playerID, turnsRemaining in pairs(affectedPlayers) do
        debugPrint("OnTurnBegin - Player ID:", playerID, "Turns remaining:", turnsRemaining)
        if turnsRemaining < 1 then
            debugPrint("OnTurnBegin - Reverting Burning Eye for Player ID:", playerID)
            RevertBurningEye(playerID)
            affectedPlayers[playerID] = nil
        else
            affectedPlayers[playerID] = turnsRemaining - 1
			-- Send a notification every turn as long as the ability is active
            ExposedMembers.BRS_Table.SendBurningEyeNotification(playerID, BURNING_EYE_BONUS_STRENGTH, BURNING_EYE_BONUS_MOVEMENT, affectedPlayers[playerID])
        end
    end
end

function OnUnitKilledInCombat(killedPlayerID, killedUnitID, victoriousPlayerID, victoriousUnitID)
    debugPrint("OnUnitKilledInCombat - Unit killed in combat. Victorious Player ID:", victoriousPlayerID, "Defeated Player ID:", killedPlayerID, "Unit ID:", victoriousUnitID)
    if PlayerHasBurningEye(victoriousPlayerID) and affectedPlayers[victoriousPlayerID] then
        debugPrint("OnUnitKilledInCombat - Burning Eye player won the combat. Extending duration. Player ID:", victoriousPlayerID)
        affectedPlayers[victoriousPlayerID] = affectedPlayers[victoriousPlayerID] + 1
        ExposedMembers.BRS_Table.SendBurningEyeNotification(victoriousPlayerID, BURNING_EYE_BONUS_STRENGTH, BURNING_EYE_BONUS_MOVEMENT, affectedPlayers[victoriousPlayerID])
    else
        debugPrint("OnUnitKilledInCombat - No Burning Eye effect involved in this combat.")
    end
end

function ApplyBurningEye(playerID)
    debugPrint("ApplyBurningEye - Applying Burning Eye to Player ID:", playerID)
    local player = Players[playerID]
    for i, unit in player:GetUnits():Members() do
        debugPrint("ApplyBurningEye - Applying Burning Eye bonuses to Unit. Unit Index:", i)
        unit:SetProperty('BURNING_EYE_COMBAT', BURNING_EYE_BONUS_STRENGTH)
        unit:SetProperty('BURNING_EYE_MOVEMENT', BURNING_EYE_BONUS_MOVEMENT)
    end
end

function RevertBurningEye(playerID)
    debugPrint("RevertBurningEye - Reverting Burning Eye for Player ID:", playerID)
    local player = Players[playerID]
    for i, unit in player:GetUnits():Members() do
        debugPrint("RevertBurningEye - Removing Burning Eye bonuses from Unit. Unit Index:", i)
        unit:SetProperty('BURNING_EYE_COMBAT', 0)
        unit:SetProperty('BURNING_EYE_MOVEMENT', 0)
    end
end

Events.DiplomacyDeclareWar.Add(OnDiplomacyDeclareWar)
Events.TurnBegin.Add(OnTurnBegin)
Events.UnitKilledInCombat.Add(OnUnitKilledInCombat)