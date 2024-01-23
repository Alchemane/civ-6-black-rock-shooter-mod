-- BRS_Districts
-- Author: Sanakan
-- DateCreated: 1/1/2024 7:23:31 PM
--------------------------------------------------------------
INSERT INTO Types (Type, Kind)
VALUES	('DISTRICT_SGA_BRS_OTHERWORLDLY_NEXUS', 'KIND_DISTRICT');

INSERT INTO Districts (DistrictType,
						Name,
						Description,
						PlunderType,
						PlunderAmount,
						AdvisorType,
						Cost,
						HitPoints,
						CanAttack,
						CostProgressionModel,
						CostProgressionParam1,
						Maintenance,
						RequiresPlacement,
						RequiresPopulation,
						AllowsHolyCity,
						ZOC,
						CaptureRemovesBuildings,
						CaptureRemovesCityDefenses,
						MilitaryDomain,
						Appeal,
						CityStrengthModifier,
						TraitType,
						CaptureRemovesDistrict,
						MaxPerPlayer,
						CitizenSlots,
						AirSlots,
						PrereqTech,
						NoAdjacentCity,
						Aqueduct,
						InternalOnly)
VALUES	('DISTRICT_SGA_BRS_OTHERWORLDLY_NEXUS', -- DistrictType
		'LOC_DISTRICT_SGA_BRS_OTHERWORLDLY_NEXUS_NAME', -- Name
		'LOC_DISTRICT_SGA_BRS_OTHERWORLDLY_NEXUS_DESCRIPTION', -- Description
		'PLUNDER_SCIENCE', -- PlunderType
		'2000', -- PlunderAmount
		'ADVISOR_TECHNOLOGY', -- AdvisorType
		'75', -- Cost
		'100', -- HitPoints
		'1', -- CanAttack
		'NO_COST_PROGRESSION', -- CostProgressionModel
		'0', -- CostProgressionParam1
		'3', -- Maintenance
		'1', -- RequiresPlacement
		'0', -- RequiresPopulation
		'0', -- AllowsHolyCity
		'1', -- ZOC
		'0', -- CaptureRemovesBuildings
		'1', -- CaptureRemovesCityDefenses
		'DOMAIN_LAND', -- MilitaryDomain
		'5', -- Appeal
		'1', -- CityStrengthModifier
		'TRAIT_CIVILIZATION_DISTRICT_SGA_BRS_OTHERWORLDLY_NEXUS', -- TraitType
		'0', -- CaptureRemovesDistrict
		'-1', -- MaxPerPlayer
		'2', -- CitizenSlots
		'0', -- AirSlots
		'TECH_EDUCATION', -- PrereqTech
		'0', -- Aqueduct
		'0', -- NoAdjacentCity
		'0'); -- InternalOnly

INSERT INTO District_CitizenYieldChanges (DistrictType, YieldType, YieldChange)
VALUES	('DISTRICT_SGA_BRS_OTHERWORLDLY_NEXUS', 'YIELD_SCIENCE', '2'),
		('DISTRICT_SGA_BRS_OTHERWORLDLY_NEXUS', 'YIELD_CULTURE', '2');
		
INSERT INTO Adjacency_YieldChanges (ID,
									Description, 
									YieldType, 
									YieldChange, 
									TilesRequired, 
									AdjacentDistrict)
VALUES	
-------------------------------------------------------------- OTHERWORLDLY NEXUS -------------------------------------------------------------- POSITIVE YIELDS
		('OTHERWORLDLY_NEXUS_SCIENCE',
		'LOC_DISTRICT_OTHERWORLDLY_NEXUS_SCIENCE_ADJACENCY_DESCRIPTION',
		'YIELD_SCIENCE',
		'3',
		'1',
		'DISTRICT_SGA_BRS_OTHERWORLDLY_NEXUS'),
		--------------------------------------------------------------
		('OTHERWORLDLY_NEXUS_CULTURE',
		'LOC_DISTRICT_OTHERWORLDLY_NEXUS_CULTURE_ADJACENCY_DESCRIPTION',
		'YIELD_CULTURE',
		'3',
		'1',
		'DISTRICT_SGA_BRS_OTHERWORLDLY_NEXUS'),
		--------------------------------------------------------------
		('OTHERWORLDLY_NEXUS_NEGATIVE_GOLD',
		'LOC_DISTRICT_OTHERWORLDLY_NEXUS_NEGATIVE_GOLD_ADJACENCY_DESCRIPTION',
		'YIELD_GOLD',
		'-2',
		'1',
		'DISTRICT_SGA_BRS_OTHERWORLDLY_NEXUS'),
-------------------------------------------------------------- AQUEDUCT --------------------------------------------------------------
		('AQUEDUCT_FOOD',
		'LOC_DISTRICT_AQUEDUCT_FOOD_ADJACENCY_DESCRIPTION',
		'YIELD_FOOD',
		'2',
		'1',
		'DISTRICT_AQUEDUCT'),
-------------------------------------------------------------- CAMPUS --------------------------------------------------------------
		('CAMPUS_SCIENCE',
		'LOC_DISTRICT_CAMPUS_SCIENCE_ADJACENCY_DESCRIPTION',
		'YIELD_SCIENCE',
		'2',
		'1',
		'DISTRICT_CAMPUS'),
-------------------------------------------------------------- HOLY SITE --------------------------------------------------------------
		('HOLY_SITE_FAITH',
		'LOC_DISTRICT_HOLY_SITE_FAITH_ADJACENCY_DESCRIPTION',
		'YIELD_FAITH',
		'2',
		'1',
		'DISTRICT_HOLY_SITE'),
-------------------------------------------------------------- COMMERCIAL HUB --------------------------------------------------------------
		('COMMERCIAL_HUB_GOLD',
		'LOC_DISTRICT_COMMERCIAL_HUB_GOLD_ADJACENCY_DESCRIPTION',
		'YIELD_GOLD',
		'2',
		'1',
		'DISTRICT_COMMERCIAL_HUB'),
-------------------------------------------------------------- INDUSTRIAL ZONE --------------------------------------------------------------
		('INDUSTRIAL_ZONE_PRODUCTION',
		'LOC_DISTRICT_INDUSTRIAL_ZONE_PRODUCTION_ADJACENCY_DESCRIPTION',
		'YIELD_PRODUCTION',
		'2',
		'1',
		'DISTRICT_INDUSTRIAL_ZONE'),
-------------------------------------------------------------- THEATER --------------------------------------------------------------
		('THEATER_CULTURE',
		'LOC_DISTRICT_THEATER_CULTURE_ADJACENCY_DESCRIPTION',
		'YIELD_CULTURE',
		'2',
		'1',
		'DISTRICT_THEATER'),
-------------------------------------------------------------- SPACEPORT --------------------------------------------------------------
		('SPACEPORT_SCIENCE',
		'LOC_DISTRICT_SPACEPORT_SCIENCE_ADJACENCY_DESCRIPTION',
		'YIELD_SCIENCE',
		'1',
		'1',
		'DISTRICT_SPACEPORT'),
-------------------------------------------------------------- HARBOR --------------------------------------------------------------
		('HARBOR_FOOD',
		'LOC_DISTRICT_HARBOR_FOOD_ADJACENCY_DESCRIPTION',
		'YIELD_FOOD',
		'1',
		'1',
		'DISTRICT_HARBOR'),
		--------------------------------------------------------------
		('HARBOR_GOLD',
		'LOC_DISTRICT_HARBOR_GOLD_ADJACENCY_DESCRIPTION',
		'YIELD_GOLD',
		'1',
		'1',
		'DISTRICT_HARBOR'),
-------------------------------------------------------------- ENCAMPMENT --------------------------------------------------------------
		('ENCAMPMENT_PRODUCTION',
		'LOC_DISTRICT_ENCAMPMENT_PRODUCTION_ADJACENCY_DESCRIPTION',
		'YIELD_PRODUCTION',
		'1',
		'1',
		'DISTRICT_ENCAMPMENT'),
		--------------------------------------------------------------
		('ENCAMPMENT_GOLD',
		'LOC_DISTRICT_ENCAMPMENT_GOLD_ADJACENCY_DESCRIPTION',
		'YIELD_GOLD',
		'1',
		'1',
		'DISTRICT_ENCAMPMENT');

INSERT INTO District_Adjacencies (DistrictType, YieldChangeId)
VALUES	
-------------------------------------------------------------- OTHERWORLDLY NEXUS
		('DISTRICT_SGA_BRS_OTHERWORLDLY_NEXUS', 'OTHERWORLDLY_NEXUS_SCIENCE'),
		('DISTRICT_SGA_BRS_OTHERWORLDLY_NEXUS', 'OTHERWORLDLY_NEXUS_CULTURE'),
		('DISTRICT_SGA_BRS_OTHERWORLDLY_NEXUS', 'OTHERWORLDLY_NEXUS_NEGATIVE_GOLD'),
		('DISTRICT_SGA_BRS_OTHERWORLDLY_NEXUS', 'AQUEDUCT_FOOD'),
		('DISTRICT_SGA_BRS_OTHERWORLDLY_NEXUS', 'CAMPUS_SCIENCE'),
		('DISTRICT_SGA_BRS_OTHERWORLDLY_NEXUS', 'HOLY_SITE_FAITH'),
		('DISTRICT_SGA_BRS_OTHERWORLDLY_NEXUS', 'COMMERCIAL_HUB_GOLD'),
		('DISTRICT_SGA_BRS_OTHERWORLDLY_NEXUS', 'INDUSTRIAL_ZONE_PRODUCTION'),
		('DISTRICT_SGA_BRS_OTHERWORLDLY_NEXUS', 'THEATER_CULTURE'),
		('DISTRICT_SGA_BRS_OTHERWORLDLY_NEXUS', 'SPACEPORT_SCIENCE'),
		('DISTRICT_SGA_BRS_OTHERWORLDLY_NEXUS', 'HARBOR_FOOD'),
		('DISTRICT_SGA_BRS_OTHERWORLDLY_NEXUS', 'HARBOR_GOLD'),
		('DISTRICT_SGA_BRS_OTHERWORLDLY_NEXUS', 'ENCAMPMENT_PRODUCTION'),
		('DISTRICT_SGA_BRS_OTHERWORLDLY_NEXUS', 'ENCAMPMENT_GOLD');

/*
INSERT INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent)
VALUES	('SKYNET_GRANT_T800', 'MODIFIER_SINGLE_CITY_GRANT_UNIT_IN_CITY', '1', '1'),
		('SKYNET_GRANT_CULTURE_BOMB_CENTRAL', 'MODIFIER_PLAYER_ADD_CULTURE_BOMB_TRIGGER', '1', '1'),
		('SKYNET_GRANT_CULTURE_BOMB_DEV_FACILITIES', 'MODIFIER_PLAYER_ADD_CULTURE_BOMB_TRIGGER', '1', '1'),
		('SKYNET_GEOMETRIC_LEARNING', 'MODIFIER_PLAYER_CAPITAL_CITY_ADJUST_CITY_YIELD_MODIFIER', '0', '1'),
		('SKYNET_CAPITAL_OFFENSE', 'MODIFIER_PLAYER_CAPITAL_CITY_ADJUST_UNIT_PRODUCTION', '0', '1'),
		('SKYNET_GRANT_CULTURE_BOMB_ENC_FACILITIES', 'MODIFIER_PLAYER_ADD_CULTURE_BOMB_TRIGGER', '1', '1');

INSERT INTO ModifierArguments (ModifierId, Name, Value)
VALUES	('SKYNET_GRANT_T800', 'UnitType', 'UNIT_SGA_SKYNET_T800'),
		('SKYNET_GRANT_T800', 'Amount', '1'),
		('SKYNET_GRANT_CULTURE_BOMB_CENTRAL', 'DistrictType', 'DISTRICT_SGA_SKYNET_CENTRAL'),
		('SKYNET_GRANT_CULTURE_BOMB_DEV_FACILITIES', 'DistrictType', 'DISTRICT_SGA_SKYNET_DEVELOPMENT_FACILITIES'),
		('SKYNET_GEOMETRIC_LEARNING', 'YieldType', 'YIELD_SCIENCE'),
		('SKYNET_GEOMETRIC_LEARNING', 'Amount', '100'),
		('SKYNET_CAPITAL_OFFENSE', 'Amount', '50'),
		('SKYNET_GRANT_CULTURE_BOMB_ENC_FACILITIES', 'DistrictType', 'DISTRICT_SGA_SKYNET_ENCAMPMENT_FACILITIES');

INSERT INTO DistrictModifiers (DistrictType, ModifierId)
VALUES	('DISTRICT_SGA_SKYNET_CENTRAL', 'SKYNET_GRANT_T800'),
		('DISTRICT_SGA_SKYNET_CENTRAL', 'SKYNET_GRANT_CULTURE_BOMB_CENTRAL'),
		('DISTRICT_SGA_SKYNET_DEVELOPMENT_FACILITIES', 'SKYNET_GRANT_CULTURE_BOMB_DEV_FACILITIES'),
		('DISTRICT_SGA_SKYNET_RESEARCH_FACILITIES', 'SKYNET_GEOMETRIC_LEARNING'),
		('DISTRICT_SGA_SKYNET_DEVELOPMENT_FACILITIES', 'SKYNET_CAPITAL_OFFENSE'),
		('DISTRICT_SGA_SKYNET_ENCAMPMENT_FACILITIES', 'SKYNET_GRANT_CULTURE_BOMB_ENC_FACILITIES');
*/