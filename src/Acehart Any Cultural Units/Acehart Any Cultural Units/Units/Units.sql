-------------------------------------
-- By Acehart last mod: 2020-07-26
-------------------------------------

-- UnitClasses colum type must be unique and exist before assign to Units Table (Foreing Key)

-- insert new defaults
INSERT INTO UnitClasses (                            
                            Type,
                            Description,
                            MaxGlobalInstances,
                            MaxTeamInstances,
                            MaxPlayerInstances,
                            InstanceCostModifier,
                            DefaultUnit
                        )
                        SELECT                            
                            Units.Class || '_' || Units.ID, --'ClassType'
                            Units.Description, --'Description'
                            -1, --'MaxGlobalInstances'
                            -1, --'MaxTeamInstances'
                            -1, --'MaxPlayerInstances'
                             0, --'InstanceCostModifier'
                             Units.Type -- 'DefaultUnit'
                       FROM Units INNER JOIN Civilization_UnitClassOverrides CO
                                  ON Units.Type = CO.UnitType    
;

--  assign new units classes
UPDATE Units SET
Class = (SELECT Type FROM UnitClasses WHERE Units.Type = UnitClasses.DefaultUnit )
;


-- fix descriptions
UPDATE UnitClasses SET
Description = (SELECT Units.Description FROM Units WHERE Units.Type = UnitClasses.DefaultUnit)
WHERE
EXISTS(SELECT Units.Description FROM Units WHERE Units.Type = UnitClasses.DefaultUnit)  
;

-- delete overrides 
DELETE FROM Civilization_UnitClassOverrides
WHERE
CivilizationType <> 'CIVILIZATION_BARBARIAN'
AND
CivilizationType <> 'CIVILIZATION_MINOR'
;
