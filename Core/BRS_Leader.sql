-- Black Rock Shooter
-- Author: Sanakan
-- DateCreated: 2/3/2023 10:15:02 PM
--------------------------------------------------------------
-- TYPES	
INSERT INTO Types (Type, Kind)
VALUES	('LEADER_SGA_BRS', 'KIND_LEADER');

-- LEADERS
INSERT INTO Leaders	(LeaderType, Name, InheritFrom, SceneLayers)
VALUES	('LEADER_SGA_BRS', 'LOC_LEADER_SGA_BRS_NAME', 'LEADER_DEFAULT', 4);

-- LEADERQUOTES
INSERT INTO LeaderQuotes (LeaderType, Quote)
VALUES	('LEADER_SGA_BRS', 'LOC_PEDIA_LEADERS_PAGE_LEADER_SGA_BRS_QUOTE');	

-- LOADINGINFO	
INSERT INTO LoadingInfo	(LeaderType, BackgroundImage, ForegroundImage, PlayDawnOfManAudio)
VALUES	('LEADER_SGA_BRS', 'LEADER_SGA_BRS_BACKGROUND', 'LEADER_SGA_BRS_NEUTRAL', 0);

-- CIV LEADERS
INSERT INTO CivilizationLeaders	(CivilizationType, LeaderType, CapitalName)
VALUES	('CIVILIZATION_SGA_BRS', 'LEADER_SGA_BRS', 'LOC_CITY_NAME_SGA_BRS_1');
	
/*
-- LEADER BACKGROUND ART		
INSERT INTO DiplomacyInfo (Type, BackgroundImage)
VALUES	('LEADER_SGA_BRS', 'SGA_BRS_1');
*/

-- LEADER TRAITS
-- TYPES	
INSERT INTO Types (Type, Kind)
VALUES	('TRAIT_SGA_LEADER_BRS_BURNING_EYE', 'KIND_TRAIT');
		
-- TRAITS							
INSERT INTO Traits (TraitType, Name, Description)
VALUES	('TRAIT_SGA_LEADER_BRS_BURNING_EYE', 'LOC_TRAIT_SGA_LEADER_BRS_BURNING_EYE_NAME', 'LOC_TRAIT_SGA_LEADER_BRS_BURNING_EYE_DESCRIPTION');
		
/*		
-- TRAIT MODIFIERS					
INSERT INTO TraitModifiers			
		(TraitType,	ModifierId)
VALUES	('TRAIT_SGA_LEADER_BRS_BURNING_EYE', 'TRAIT_MODIFIER_BURNING_EYE_COMBAT_BOOST'),
		('TRAIT_SGA_LEADER_BRS_BURNING_EYE', 'TRAIT_MODIFIER_BURNING_EYE_MOVEMENT_BOOST');

-- MODIFIERS
INSERT INTO Modifiers	
		(ModifierId, ModifierType, SubjectRequirementSetId)
VALUES	('TRAIT_MODIFIER_BURNING_EYE_COMBAT_BOOST', 'MODIFIER_PLAYER_UNITS_ADJUST_COMBAT_STRENGTH', 'PLAYER_DECLARES_SURPRISE_WAR'),
		('TRAIT_MODIFIER_BURNING_EYE_MOVEMENT_BOOST', 'MODIFIER_PLAYER_UNITS_ADJUST_MOVEMENT', 'PLAYER_DECLARES_SURPRISE_WAR');
		

-- MODIFIER ARGUMENTS
INSERT INTO ModifierArguments
		(ModifierId, Name, Value)
VALUES	('TRAIT_MODIFIER_BURNING_EYE_COMBAT_BOOST', 'Amount', '15'),
		('TRAIT_MODIFIER_BURNING_EYE_MOVEMENT_BOOST', 'Amount', '1'),
		('TRAIT_MODIFIER_BURNING_EYE_COMBAT_BOOST', 'TurnsActive', '1'),
		('TRAIT_MODIFIER_BURNING_EYE_MOVEMENT_BOOST', 'TurnsActive', '1'); -- NOT VANILLA
*/

-- LEADER TRAITS
INSERT INTO LeaderTraits (LeaderType, TraitType)
VALUES	('LEADER_SGA_BRS', 'TRAIT_SGA_LEADER_BRS_BURNING_EYE');