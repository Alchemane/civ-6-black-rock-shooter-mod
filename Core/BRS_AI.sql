-- Skynet_Lite_AI
-- Author: Safeguard
-- DateCreated: 2/15/2023 9:11:55 PM
--------------------------------------------------------------
--AI LIST TYPES
INSERT INTO AiListTypes			
		(ListType)
VALUES	('SGA_BRS_DISTRICTS'),
		('SGA_BRS_TECH'),
		('SGA_BRS_CIVICS'),
		('SGA_BRS_PROJECTS'),
		('SGA_BRS_UNITS'),
		('SGA_BRS_DIPLO'),
		('SGA_BRS_BUILDINGS'),
		('SGA_BRS_YIELDS'),
		('SGA_BRS_AI_OPS'),
		('SGA_BRS_ARMY');

--AI LISTS
INSERT INTO AiLists	
		(ListType, LeaderType, System)
VALUES	('SGA_BRS_DISTRICTS', 'LEADER_SGA_BRS', 'Districts'),
		('SGA_BRS_TECH', 'LEADER_SGA_BRS', 'Technologies'),
		('SGA_BRS_CIVICS', 'LEADER_SGA_BRS', 'Civics'),
		('SGA_BRS_DIPLO', 'LEADER_SGA_BRS',	'DiplomaticActions'),
		('SGA_BRS_PROJECTS', 'LEADER_SGA_BRS', 'Projects'),
		('SGA_BRS_UNITS', 'LEADER_SGA_BRS', 'Units'),
		('SGA_BRS_BUILDINGS', 'LEADER_SGA_BRS', 'Buildings'),
		('SGA_BRS_YIELDS', 'LEADER_SGA_BRS', 'Yields'),
		('SGA_BRS_AI_OPS', 'LEADER_SGA_BRS', 'AiOperationTypes'),
		('SGA_BRS_ARMY', 'LEADER_SGA_BRS', 'PseudoYields');

--AI FAVORED ITEMS
INSERT OR IGNORE INTO AiFavoredItems	
	(ListType, Item, Favored, Value)
VALUES	('SGA_BRS_PROJECTS', 'PROJECT_SGA_SKYNET_GLOBAL_HACK_T800', 1, 1), -- Feature of my other skynet mod
		('SGA_BRS_PROJECTS', 'PROJECT_SGA_SKYNET_GLOBAL_HACK_HK_TANK', 1, 1), -- Feature of my other skynet mod
		('SGA_BRS_PROJECTS', 'PROJECT_SGA_SKYNET_GLOBAL_HACK_HK_AERIAL', 1, 1), -- Feature of my other skynet mod
		('SGA_BRS_PROJECTS', 'PROJECT_SGA_SKYNET_LITE_GLOBAL_HACK_T800', 1, 1), -- Feature of my other skynet mod
		('SGA_BRS_AI_OPS', 'CITY_ASSAULT', 1, 9999),
		('SGA_BRS_ARMY', 'PSEUDOYIELD_STANDING_ARMY_NUMBER', 1,	250),
		('SGA_BRS_ARMY', 'PSEUDOYIELD_STANDING_ARMY_VALUE', 1, 250),
		('SGA_BRS_ARMY', 'PSEUDOYIELD_NUCLEAR_WEAPON', 1, 100),
		('SGA_BRS_UNITS', 'UNIT_SGA_BRS_BLACK_ROCK_INFANTRY', 1, 100),
		('SGA_BRS_DISTRICTS', 'DISTRICT_SGA_BRS_OTHERWORLDLY_NEXUS', 1, 100);