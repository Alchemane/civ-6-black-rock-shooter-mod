-- BRS_Notifications
-- Author: Sanakan
-- DateCreated: 1/14/2024 10:41:46 PM
--------------------------------------------------------------

local NOTIFICATION_SGA_BRS_BURNING_EYE_MESSAGE = DB.MakeHash("NOTIFICATION_SGA_BRS_BURNING_EYE_MESSAGE")
local NOTIFICATION_SGA_BRS_TWO_WORLDS_MESSAGE = DB.MakeHash("NOTIFICATION_SGA_BRS_TWO_WORLDS_MESSAGE")

function CreateBRSNotificationData(playerID, message, summary, icon)
    local notificationData = {}
    notificationData.Message = message
    notificationData.Summary = summary
    notificationData.Icon = icon -- only way for custom icon to appear
    notificationData.AlwaysUnique = true  -- this ensures each notification is treated as unique
    return notificationData
end

function SendBurningEyeNotification(playerID, nBURNING_EYE_BONUS_STRENGTH, nBURNING_EYE_BONUS_MOVEMENT, keyValue)
	local message = Locale.Lookup("LOC_NOTIFICATION_BURNING_EYE_TITLE")
    local summary = Locale.Lookup("LOC_NOTIFICATION_BURNING_EYE_MESSAGE", nBURNING_EYE_BONUS_STRENGTH, nBURNING_EYE_BONUS_MOVEMENT, keyValue)
    local notificationData = CreateBRSNotificationData(playerID, message, summary, "ICON_NOTIFICATION_BURNING_EYE")
    NotificationManager.SendNotification(playerID, NOTIFICATION_SGA_BRS_BURNING_EYE_MESSAGE, notificationData)
end

function SendTwoWorldsNotification(playerID, iBonusAmount)
	local message = Locale.Lookup("LOC_NOTIFICATION_TWO_WORLDS_TITLE")
    local summary = Locale.Lookup("LOC_NOTIFICATION_TWO_WORLDS_MESSAGE", iBonusAmount)
    local notificationData = CreateBRSNotificationData(playerID, message, summary, "ICON_NOTIFICATION_TWO_WORLDS")
    NotificationManager.SendNotification(playerID, NOTIFICATION_SGA_BRS_TWO_WORLDS_MESSAGE, notificationData)
end

ExposedMembers.BRS_Table.SendBurningEyeNotification = SendBurningEyeNotification
ExposedMembers.BRS_Table.SendTwoWorldsNotification = SendTwoWorldsNotification