-- Skynet_Lite_Colors
-- Author: Safeguard
-- DateCreated: 2/15/2023 9:14:07 PM
--------------------------------------------------------------
INSERT INTO Colors(Type, Color) -- RGBA
VALUES	('COLOR_PLAYER_SGA_BRS_LEADER_BRS_PRIMARY', '0,0,0,255'), -- Black
        ('COLOR_PLAYER_SGA_BRS_LEADER_BRS_SECONDARY', '70,130,180,255'), -- Steel Blue
        ('COLOR_PLAYER_SGA_BRS_LEADER_BRS_PRIMARY1', '25,25,112,255'), -- Midnight Blue
        ('COLOR_PLAYER_SGA_BRS_LEADER_BRS_SECONDARY1', '255,255,255,255'), -- White
        ('COLOR_PLAYER_SGA_BRS_LEADER_BRS_PRIMARY2', '105,105,105,255'), -- Dim Gray
        ('COLOR_PLAYER_SGA_BRS_LEADER_BRS_SECONDARY2', '0,191,255,255'); -- Deep Sky Blue

INSERT INTO PlayerColors (Type, Usage, 
                                    PrimaryColor,    
                                    SecondaryColor,    
                                    Alt1PrimaryColor, 
                                    Alt1SecondaryColor,
                                    Alt2PrimaryColor,
                                    Alt2SecondaryColor)
VALUES  ('LEADER_SGA_BRS', 'Unique', 
        'COLOR_PLAYER_SGA_BRS_LEADER_BRS_PRIMARY', -- Midnight Blue
        'COLOR_PLAYER_SGA_BRS_LEADER_BRS_SECONDARY', -- White
        'COLOR_PLAYER_SGA_BRS_LEADER_BRS_PRIMARY1', -- Black
        'COLOR_PLAYER_SGA_BRS_LEADER_BRS_SECONDARY1', -- Steel Blue
        'COLOR_PLAYER_SGA_BRS_LEADER_BRS_PRIMARY2', -- Dim Gray
        'COLOR_PLAYER_SGA_BRS_LEADER_BRS_SECONDARY2'); -- Deep Sky Blue