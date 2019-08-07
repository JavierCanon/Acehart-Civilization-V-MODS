-- Insert SQL Rules Here 
DELETE FROM Civilization_UnitClassOverrides
WHERE
CivilizationType <> 'CIVILIZATION_BARBARIAN'
AND
CivilizationType <> 'CIVILIZATION_MINOR'
;
