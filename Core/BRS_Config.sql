-- Skynet_Lite_Config
-- Author: Sanakan
-- DateCreated: 2/15/2023 9:13:42 PM
--------------------------------------------------------------
INSERT INTO Players	
		(Domain, 
		CivilizationType, 
		Portrait, 
		PortraitBackground, 
		LeaderType, 
		LeaderName, 
		LeaderIcon, 
		LeaderAbilityName,	
		LeaderAbilityDescription, 
		LeaderAbilityIcon, 
		CivilizationName, 
		CivilizationIcon, 
		CivilizationAbilityName, 
		CivilizationAbilityDescription, 
		CivilizationAbilityIcon)
		-------------------------------------------------------------- VANILLA
VALUES	('Players:StandardPlayers', -- Domain
		'CIVILIZATION_SGA_BRS', -- CivilizationType
		'LEADER_SGA_BRS_SELECT', -- Portrait
		'LEADER_SGA_BRS_BACKGROUND', -- PortraitBackground
		'LEADER_SGA_BRS', -- LeaderType
		'LOC_LEADER_SGA_BRS_NAME', -- LeaderName
		'ICON_LEADER_SGA_BRS', -- LeaderIcon
		'LOC_TRAIT_SGA_LEADER_BRS_BURNING_EYE_NAME', -- LeaderAbilityName
		'LOC_TRAIT_SGA_LEADER_BRS_BURNING_EYE_DESCRIPTION',	-- LeaderAbilityDescription
		'ICON_LEADER_SGA_BRS', -- LeaderAbilityIcon
		'LOC_CIVILIZATION_SGA_BRS_NAME', -- CivilizationName
		'ICON_CIVILIZATION_SGA_BRS', -- CivilizationIcon
		'LOC_TRAIT_CIVILIZATION_SGA_BRS_TWO_WORLDS_NAME', -- CivilizationAbilityName
		'LOC_TRAIT_CIVILIZATION_SGA_BRS_TWO_WORLDS_DESCRIPTION', -- CivilizationAbilityDescription
		'ICON_CIVILIZATION_SGA_BRS'), -- CivilizationAbilityIcon
		-------------------------------------------------------------- RISE AND FALL
		('Players:Expansion1_Players', -- Domain
		'CIVILIZATION_SGA_BRS', -- CivilizationType
		'LEADER_SGA_BRS_SELECT', -- Portrait
		'LEADER_SGA_BRS_BACKGROUND', -- PortraitBackground
		'LEADER_SGA_BRS', -- LeaderType
		'LOC_LEADER_SGA_BRS_NAME', -- LeaderName
		'ICON_LEADER_SGA_BRS', -- LeaderIcon
		'LOC_TRAIT_SGA_LEADER_BRS_BURNING_EYE_NAME', -- LeaderAbilityName
		'LOC_TRAIT_SGA_LEADER_BRS_BURNING_EYE_DESCRIPTION',	-- LeaderAbilityDescription
		'ICON_LEADER_SGA_BRS', -- LeaderAbilityIcon
		'LOC_CIVILIZATION_SGA_BRS_NAME', -- CivilizationName
		'ICON_CIVILIZATION_SGA_BRS', -- CivilizationIcon
		'LOC_TRAIT_CIVILIZATION_SGA_BRS_TWO_WORLDS_NAME', -- CivilizationAbilityName
		'LOC_TRAIT_CIVILIZATION_SGA_BRS_TWO_WORLDS_DESCRIPTION', -- CivilizationAbilityDescription
		'ICON_CIVILIZATION_SGA_BRS'), -- CivilizationAbilityIcon
		-------------------------------------------------------------- GATHERING STORM
		('Players:Expansion2_Players', -- Domain
		'CIVILIZATION_SGA_BRS', -- CivilizationType
		'LEADER_SGA_BRS_SELECT', -- Portrait
		'LEADER_SGA_BRS_BACKGROUND', -- PortraitBackground
		'LEADER_SGA_BRS', -- LeaderType
		'LOC_LEADER_SGA_BRS_NAME', -- LeaderName
		'ICON_LEADER_SGA_BRS', -- LeaderIcon
		'LOC_TRAIT_SGA_LEADER_BRS_BURNING_EYE_NAME', -- LeaderAbilityName
		'LOC_TRAIT_SGA_LEADER_BRS_BURNING_EYE_DESCRIPTION',	-- LeaderAbilityDescription
		'ICON_LEADER_SGA_BRS', -- LeaderAbilityIcon
		'LOC_CIVILIZATION_SGA_BRS_NAME', -- CivilizationName
		'ICON_CIVILIZATION_SGA_BRS', -- CivilizationIcon
		'LOC_TRAIT_CIVILIZATION_SGA_BRS_TWO_WORLDS_NAME', -- CivilizationAbilityName
		'LOC_TRAIT_CIVILIZATION_SGA_BRS_TWO_WORLDS_DESCRIPTION', -- CivilizationAbilityDescription
		'ICON_CIVILIZATION_SGA_BRS'); -- CivilizationAbilityIcon

INSERT INTO PlayerItems	
		(Domain,
		CivilizationType, 
		LeaderType,	
		Type, 
		Icon, 
		Name, 
		Description, 
		SortIndex)
		-------------------------------------------------------------- VANILLA
VALUES	('Players:StandardPlayers', -- Domain
		'CIVILIZATION_SGA_BRS', -- CivilizationType
		'LEADER_SGA_BRS', -- LeaderType
		'DISTRICT_SGA_BRS_OTHERWORLDLY_NEXUS', -- Type
		'ICON_DISTRICT_SGA_BRS_OTHERWORLDLY_NEXUS', -- Icon
		'LOC_DISTRICT_SGA_BRS_OTHERWORLDLY_NEXUS_NAME', -- Name
		'LOC_DISTRICT_SGA_BRS_OTHERWORLDLY_NEXUS_DESCRIPTION', -- Description
		1), -- SortIndex
		--------------------------------------------------------------
		('Players:StandardPlayers', -- Domain
		'CIVILIZATION_SGA_BRS', -- CivilizationType
		'LEADER_SGA_BRS', -- LeaderType
		'UNIT_SGA_BRS_BLACK_ROCK_INFANTRY', -- Type
		'ICON_UNIT_SGA_BRS_BLACK_ROCK_INFANTRY', -- Icon
		'LOC_UNIT_SGA_BRS_BRI_NAME', -- Name
		'LOC_SGA_BRS_BRI_DESCRIPTION', -- Description
		2), -- SortIndex
		-------------------------------------------------------------- RISE AND FALL
		('Players:Expansion1_Players', -- Domain
		'CIVILIZATION_SGA_BRS', -- CivilizationType
		'LEADER_SGA_BRS', -- LeaderType
		'DISTRICT_SGA_BRS_OTHERWORLDLY_NEXUS', -- Type
		'ICON_DISTRICT_SGA_BRS_OTHERWORLDLY_NEXUS', -- Icon
		'LOC_DISTRICT_SGA_BRS_OTHERWORLDLY_NEXUS_NAME', -- Name
		'LOC_DISTRICT_SGA_BRS_OTHERWORLDLY_NEXUS_DESCRIPTION', -- Description
		1), -- SortIndex
		--------------------------------------------------------------
		('Players:Expansion1_Players', -- Domain
		'CIVILIZATION_SGA_BRS', -- CivilizationType
		'LEADER_SGA_BRS', -- LeaderType
		'UNIT_SGA_BRS_BLACK_ROCK_INFANTRY', -- Type
		'ICON_UNIT_SGA_BRS_BLACK_ROCK_INFANTRY', -- Icon
		'LOC_UNIT_SGA_BRS_BRI_NAME', -- Name
		'LOC_SGA_BRS_BRI_DESCRIPTION', -- Description
		2), -- SortIndex
		-------------------------------------------------------------- GATHERING STORM
		('Players:Expansion2_Players', -- Domain
		'CIVILIZATION_SGA_BRS', -- CivilizationType
		'LEADER_SGA_BRS', -- LeaderType
		'DISTRICT_SGA_BRS_OTHERWORLDLY_NEXUS', -- Type
		'ICON_DISTRICT_SGA_BRS_OTHERWORLDLY_NEXUS', -- Icon
		'LOC_DISTRICT_SGA_BRS_OTHERWORLDLY_NEXUS_NAME', -- Name
		'LOC_DISTRICT_SGA_BRS_OTHERWORLDLY_NEXUS_DESCRIPTION', -- Description
		1), -- SortIndex
		--------------------------------------------------------------
		('Players:Expansion2_Players', -- Domain
		'CIVILIZATION_SGA_BRS', -- CivilizationType
		'LEADER_SGA_BRS', -- LeaderType
		'UNIT_SGA_BRS_BLACK_ROCK_INFANTRY', -- Type
		'ICON_UNIT_SGA_BRS_BLACK_ROCK_INFANTRY', -- Icon
		'LOC_UNIT_SGA_BRS_BRI_NAME', -- Name
		'LOC_SGA_BRS_BRI_DESCRIPTION', -- Description
		2); -- SortIndex