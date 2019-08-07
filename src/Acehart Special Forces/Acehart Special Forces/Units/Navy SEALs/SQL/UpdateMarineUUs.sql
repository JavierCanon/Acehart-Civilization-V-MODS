--Update Pre-existing UUs
INSERT INTO Unit_ClassUpgrades(UnitType, UnitClassType)
	SELECT UnitType, "UNITCLASS_SEALTEAM" FROM Civilization_UnitClassOverrides WHERE UnitClassType = "UNITCLASS_MARINE"
	
--Create a trigger to update UUs added after this mod.
CREATE TRIGGER CivUpdateMarineReplacements AFTER INSERT ON Civilization_UnitClassOverrides WHEN NEW.UnitClassType = "UNITCLASS_MARINE" BEGIN
    INSERT INTO Unit_ClassUpgrades(UnitType, UnitClassType) VALUES(NEW.UnitType, "UNITCLASS_SEALTEAM");
    END;
