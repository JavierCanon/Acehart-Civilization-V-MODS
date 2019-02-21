--This sql file changes the format of updating units in ENI mod via SQL.





UPDATE Units
SET Combat = '55'
WHERE Type = 'UNIT_ENGLISH_SHIPOFTHELINE';

UPDATE Units
SET Class = 'UNITCLASS_SHIPOFTHELINE'
WHERE Type = 'UNIT_ENGLISH_SHIPOFTHELINE';

UPDATE Units
SET RangedCombat = '55'
WHERE Type = 'UNIT_ENGLISH_SHIPOFTHELINE';

UPDATE Units
SET Cost = '200', Range = '3'
WHERE Type = 'UNIT_ENGLISH_SHIPOFTHELINE';

UPDATE Units
SET Combat = '70', Cost = '250', UnitArtInfo = 'ART_DEF_UNIT_DESTROYER_CLASS'
WHERE Type = 'UNIT_DESTROYER';

UPDATE Units
SET Combat = '50', RangedCombat = '75', UnitArtInfo = 'ART_DEF_UNIT_SUBMARINE_CLASS'
WHERE Type = 'UNIT_SUBMARINE';

UPDATE Units
SET Combat = '70', RangedCombat = '80', ObsoleteTech = 'TECH_STEALTH', UnitArtInfo = 'ART_DEF_UNIT_BATTLESHIP_CLASS'
WHERE Type = 'UNIT_BATTLESHIP';

UPDATE Units
SET Combat = '60', Cost = '400', UnitArtInfo = 'ART_DEF_UNIT_CARRIER_CLASS'
WHERE Type = 'UNIT_CARRIER';

UPDATE Units
SET Combat = '10'
WHERE Type = 'UNIT_BYZANTINE_DROMON';

UPDATE Units
SET Combat = '20', RangedCombat = '20'
WHERE Type = 'UNIT_GALLEASS';

UPDATE Units
SET Combat = '22', RangedCombat = '22'
WHERE Type = 'UNIT_VENETIAN_GALLEASS';

UPDATE Units
SET Class = 'UNITCLASS_CUTTER', ObsoleteTech = 'TECH_STEAM_POWER'
WHERE Type = 'UNIT_KOREAN_TURTLE_SHIP';

UPDATE Units
SET Combat = '40', RangedCombat = '40'
WHERE Type = 'UNIT_FRIGATE';

UPDATE Units
SET Combat = '30'
WHERE Type = 'UNIT_CARAVEL';

UPDATE Units
SET Combat = '50'
WHERE Type = 'UNIT_PRIVATEER';

UPDATE Units
SET Combat = '55'
WHERE Type = 'UNIT_DUTCH_SEA_BEGGAR';

UPDATE Units
SET Combat = '70', RangedCombat = '105'
WHERE Type = 'UNIT_NUCLEAR_SUBMARINE';

UPDATE Units
SET Combat = '100', RangedCombat = '120'
WHERE Type = 'UNIT_MISSILE_CRUISER';

UPDATE Units
SET Combat = '60'
WHERE Type = 'UNIT_IRONCLAD';



UPDATE Unit_ClassUpgrades
SET UnitClassType = 'UNITCLASS_CRUISER'
WHERE UnitType = 'UNIT_FRIGATE';

UPDATE Unit_ClassUpgrades
SET UnitClassType = 'UNITCLASS_CARRACK'
WHERE UnitType = 'UNIT_GALLEASS';

UPDATE Unit_ClassUpgrades
SET UnitClassType = 'UNITCLASS_CARRACK'
WHERE UnitType = 'UNIT_VENETIAN_GALLEASS';

UPDATE Unit_ClassUpgrades
SET UnitClassType = 'UNITCLASS_PRIVATEER'
WHERE UnitType = 'UNIT_CARAVEL';

UPDATE Civilization_UnitClassOverrides
SET UnitClassType = 'UNITCLASS_SHIPOFTHELINE'
WHERE UnitType = 'UNIT_ENGLISH_SHIPOFTHELINE';

UPDATE Civilization_UnitClassOverrides
SET UnitClassType = 'UNITCLASS_CUTTER'
WHERE UnitType = 'UNIT_KOREAN_TURTLE_SHIP';

DELETE FROM Unit_ResourceQuantityRequirements
WHERE UnitType = 'UNIT_FRIGATE' AND ResourceType = 'RESOURCE_IRON';


































