-- Insert SQL Rules Here 

-- Add RangedCombat
UPDATE Units SET
 Description = 'Attack Heli'
,Range = 2
,RangedCombat = 70
--,RangeAttackIgnoreLOS = 1
,BaseSightRange = 4
,Mechanized = 1
,MinAreaSize = 10
WHERE
Type = 'UNIT_HELICOPTER_GUNSHIP'
;

 -- *** RESOURCES ***

-- Modify the standard Gunship, they already have alluminium...
INSERT INTO Unit_ResourceQuantityRequirements(
 UnitType
,ResourceType
,Cost
)
SELECT
 'UNIT_HELICOPTER_GUNSHIP'
,'RESOURCE_OIL'
,1
;

