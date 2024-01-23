-- BRS_Notification
-- Author: Sanakan
-- DateCreated: 1/10/2024 2:59:43 PM
--------------------------------------------------------------
INSERT OR REPLACE INTO Types (Type, Kind)
VALUES	('NOTIFICATION_SGA_BRS_BURNING_EYE_MESSAGE', 'KIND_NOTIFICATION'),
		('NOTIFICATION_SGA_BRS_TWO_WORLDS_MESSAGE', 'KIND_NOTIFICATION');

INSERT OR REPLACE INTO Notifications (NotificationType,
										SeverityType,
										ExpiresEndOfTurn,
										AutoNotify,
										AutoActivate,
										ShowIconSinglePlayer,
										GroupType)
VALUES	('NOTIFICATION_SGA_BRS_BURNING_EYE_MESSAGE', 'MID', 1, 0, 1, 1, 'USER'),
		('NOTIFICATION_SGA_BRS_TWO_WORLDS_MESSAGE', 'MID', 1, 0, 1, 1, 'USER');