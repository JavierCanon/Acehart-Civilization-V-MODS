-- check all Tables from Units for Error's and other Info's
CREATE VIEW IF NOT EXISTS Info_Units AS
SELECT 
Units.Type AS Type,
Units.Class AS Class,
'ERROR' AS Defcon,
(SELECT ("Units.Class "|| Units.Class || " NOT IN UnitClasses!")) AS Info
FROM Units
WHERE Units.Class NOT IN (SELECT Type FROM UnitClasses)
--
UNION ALL
SELECT 
UnitClasses.DefaultUnit AS Type,
UnitClasses.Type AS Class,
'ERROR' AS Defcon,
(SELECT ("UnitClasses.Type "|| UnitClasses.Type || " NOT IN Units.Class!")) AS Info
FROM UnitClasses
WHERE UnitClasses.Type NOT IN (SELECT Class FROM Units)
--
UNION ALL
SELECT 
UnitClasses.DefaultUnit AS Type,
UnitClasses.Type AS Class,
'ERROR' AS Defcon,
(SELECT ("UnitClasses.DefaultUnit "|| UnitClasses.DefaultUnit || " NOT IN Units.Type!")) AS Info
FROM UnitClasses
WHERE UnitClasses.DefaultUnit NOT IN (SELECT Type FROM Units)
--
UNION ALL
SELECT 
Units.Type AS Type,
Units.Class AS Class,
'OK' AS Defcon,
'Units.Class can not be built from Barbarian''s' AS Info
FROM Units
WHERE Units.Class IN (SELECT UnitClassType FROM Civilization_UnitClassOverrides WHERE CivilizationType = 'CIVILIZATION_BARBARIAN' AND UnitType IS NULL)
--
UNION ALL
SELECT 
Units.Type AS Type,
Units.Class AS Class,
'OK' AS Defcon,
'Units.Class can not be built from Minor Civ''s' AS Info
FROM Units
WHERE Units.Class IN (SELECT UnitClassType FROM Civilization_UnitClassOverrides WHERE CivilizationType = 'CIVILIZATION_MINOR' AND UnitType IS NULL)
--
UNION ALL
SELECT 
Units.Type AS Type,
Units.Class AS Class,
'INFO' AS Defcon,
(SELECT ("Units.Type can only be built from "|| Civilization_UnitClassOverrides.CivilizationType)) AS Info
FROM Units, Civilization_UnitClassOverrides
WHERE Units.Class IN (SELECT UnitClassType FROM Civilization_UnitClassOverrides WHERE UnitType NOT NULL)
AND Civilization_UnitClassOverrides.UnitType = Units.Type
AND Civilization_UnitClassOverrides.CivilizationType IS NOT 'CIVILIZATION_BARBARIAN'
--
UNION ALL
SELECT DISTINCT
Civilization_UnitClassOverrides.UnitType AS Type,
Civilization_UnitClassOverrides.UnitClassType AS Class,
'ERROR' AS Defcon,
'Civilization_UnitClassOverrides.UnitType not in Units.Type' AS Info
FROM Civilization_UnitClassOverrides
WHERE Civilization_UnitClassOverrides.UnitType NOT IN (SELECT Type FROM Units)
--
UNION ALL
SELECT DISTINCT
Civilization_UnitClassOverrides.UnitType AS Type,
Civilization_UnitClassOverrides.UnitClassType AS Class,
'ERROR' AS Defcon,
'Civilization_UnitClassOverrides.UnitClassType not in Units.Class' AS Info
FROM Civilization_UnitClassOverrides
WHERE Civilization_UnitClassOverrides.UnitClassType NOT IN (SELECT Class FROM Units)
--
UNION ALL
SELECT DISTINCT
Civilization_UnitClassOverrides.UnitType AS Type,
Civilization_UnitClassOverrides.UnitClassType AS Class,
'ERROR' AS Defcon,
'Civilization_UnitClassOverrides.CivilizationType not in Civilizations.Type' AS Info
FROM Civilization_UnitClassOverrides
WHERE Civilization_UnitClassOverrides.CivilizationType NOT IN (SELECT Type FROM Civilizations)
--
UNION ALL
SELECT 
Units.Type AS Type,
Units.Class AS Class,
'ERROR' AS Defcon,
(SELECT ("Units.Special "|| Units.Special || " NOT IN SpecialUnits!")) AS Info
FROM Units
WHERE Units.Special NOT IN (SELECT Type FROM SpecialUnits)
--
UNION ALL
SELECT 
Units.Type AS Type,
Units.Class AS Class,
'ERROR' AS Defcon,
(SELECT ("Units.Capture "|| Units.Capture || " NOT IN UnitClasses!")) AS Info
FROM Units
WHERE Units.Capture NOT IN (SELECT Type FROM UnitClasses)
--
UNION ALL
SELECT 
Units.Type AS Type,
Units.Class AS Class,
'ERROR' AS Defcon,
(SELECT ("Units.CombatClass "|| Units.CombatClass || " NOT IN UnitCombatInfos!")) AS Info
FROM Units
WHERE Units.CombatClass NOT IN (SELECT Type FROM UnitCombatInfos)
--
UNION ALL
SELECT 
Units.Type AS Type,
Units.Class AS Class,
'ERROR' AS Defcon,
(SELECT ("Units.Domain "|| Units.Domain || " NOT IN Domains!")) AS Info
FROM Units
WHERE Units.Domain NOT IN (SELECT Type FROM Domains)
--
UNION ALL
SELECT 
Units.Type AS Type,
Units.Class AS Class,
'ERROR' AS Defcon,
(SELECT ("Units.CivilianAttackPriority "|| Units.CivilianAttackPriority || " NOT IN CivilianAttackPriorities!")) AS Info
FROM Units
WHERE Units.CivilianAttackPriority NOT IN (SELECT Type FROM CivilianAttackPriorities)
--
UNION ALL
SELECT 
Units.Type AS Type,
Units.Class AS Class,
'ERROR' AS Defcon,
(SELECT ("Units.DefaultUnitAI "|| Units.DefaultUnitAI || " NOT IN UnitAIInfos!")) AS Info
FROM Units
WHERE Units.DefaultUnitAI NOT IN (SELECT Type FROM UnitAIInfos)
--
UNION ALL
SELECT 
Units.Type AS Type,
Units.Class AS Class,
'ERROR' AS Defcon,
(SELECT ("Units.PillagePrereqTech "|| Units.PillagePrereqTech || " NOT IN Technologies!")) AS Info
FROM Units
WHERE Units.PillagePrereqTech NOT IN (SELECT Type FROM Technologies)
-- /*
UNION ALL
SELECT 
Units.Type AS Type,
Units.Class AS Class,
'OK' AS Defcon,
'Unit has no PrereqTech' AS Info
FROM Units
WHERE Units.PrereqTech IS NULL
-- */
UNION ALL
SELECT 
Units.Type AS Type,
Units.Class AS Class,
'ERROR' AS Defcon,
(SELECT ("Units.PrereqTech "|| Units.PrereqTech || " NOT IN Technologies!")) AS Info
FROM Units
WHERE Units.PrereqTech NOT IN (SELECT Type FROM Technologies)
-- /*
UNION ALL
SELECT 
Units.Type AS Type,
Units.Class AS Class,
'OK' AS Defcon,
'Unit has NO PrereqTech in Unit_TechTypes' AS Info
FROM Units
WHERE Units.Type NOT IN (SELECT UnitType FROM Unit_TechTypes)
-- */
-- /*
UNION ALL
SELECT 
Units.Type AS Type,
Units.Class AS Class,
'INFO' AS Defcon,
(SELECT ("Unit has "|| Unit_TechTypes.TechType || " as PrereqTech in Unit_TechTypes")) AS Info
FROM Units, Unit_TechTypes
WHERE Units.Type IN (SELECT UnitType FROM Unit_TechTypes)
AND Units.Type = Unit_TechTypes.UnitType
-- */
UNION ALL
SELECT 
Units.Type AS Type,
Units.Class AS Class,
'ERROR' AS Defcon,
(SELECT ("Unit PrereqTech from Unit_TechTypes "|| Unit_TechTypes.TechType || " NOT IN Technologies!")) AS Info
FROM Units, Unit_TechTypes
WHERE Units.Type = Unit_TechTypes.UnitType
AND Unit_TechTypes.TechType NOT IN (SELECT Type FROM Technologies)
--
UNION ALL
SELECT 
Units.Type AS Type,
Units.Class AS Class,
'ERROR' AS Defcon,
(SELECT ("Units.ObsoleteTech "|| Units.ObsoleteTech || " NOT IN UnitAIInfos!")) AS Info
FROM Units
WHERE Units.ObsoleteTech NOT IN (SELECT Type FROM Technologies)
-- /*
UNION ALL
SELECT 
Units.Type AS Type,
Units.Class AS Class,
'OK' AS Defcon,
(SELECT ("Unit has the following GoodyHutUpgrade: "|| Units.GoodyHutUpgradeUnitClass)) AS Info
FROM Units
WHERE Units.GoodyHutUpgradeUnitClass NOT NULL
-- */
UNION ALL
SELECT 
Units.Type AS Type,
Units.Class AS Class,
'ERROR' AS Defcon,
(SELECT ("Units.GoodyHutUpgradeUnitClass "|| Units.GoodyHutUpgradeUnitClass || " NOT IN UnitClasses!")) AS Info
FROM Units
WHERE Units.GoodyHutUpgradeUnitClass NOT IN (SELECT Type FROM UnitClasses)
-- /*
UNION ALL
SELECT 
Units.Type AS Type,
Units.Class AS Class,
'INFO' AS Defcon,
(SELECT ("Unit needs the following Policy: "|| Units.PolicyType)) AS Info
FROM Units
WHERE Units.PolicyType NOT NULL
-- */
UNION ALL
SELECT 
Units.Type AS Type,
Units.Class AS Class,
'ERROR' AS Defcon,
(SELECT ("Units.PolicyType "|| Units.PolicyType || " NOT IN Policies!")) AS Info
FROM Units
WHERE Units.PolicyType NOT IN (SELECT Type FROM Policies)
--
UNION ALL
SELECT 
Units.Type AS Type,
Units.Class AS Class,
'ERROR' AS Defcon,
(SELECT ("Units.SpecialCargo "|| Units.SpecialCargo || " NOT IN SpecialUnits!")) AS Info
FROM Units
WHERE Units.SpecialCargo NOT IN (SELECT Type FROM SpecialUnits)
--
UNION ALL
SELECT 
Units.Type AS Type,
Units.Class AS Class,
'ERROR' AS Defcon,
(SELECT ("Units.DomainCargo "|| Units.DomainCargo || " NOT IN Domains!")) AS Info
FROM Units
WHERE Units.DomainCargo NOT IN (SELECT Type FROM Domains)
--
UNION ALL
SELECT 
Units.Type AS Type,
Units.Class AS Class,
'ERROR' AS Defcon,
(SELECT ("Units.UnitArtInfo "|| Units.UnitArtInfo || " NOT IN ArtDefine_UnitInfos!")) AS Info
FROM Units
WHERE Units.UnitArtInfo NOT IN (SELECT Type FROM ArtDefine_UnitInfos)
--
UNION ALL
SELECT 
Units.Type AS Type,
Units.Class AS Class,
'ERROR' AS Defcon,
(SELECT ("Units.ProjectPrereq "|| Units.ProjectPrereq || " NOT IN Projects!")) AS Info
FROM Units
WHERE Units.ProjectPrereq NOT IN (SELECT Type FROM Projects)
--
UNION ALL
SELECT 
Units.Type AS Type,
Units.Class AS Class,
'ERROR' AS Defcon,
(SELECT ("Units.SpaceshipProject "|| Units.SpaceshipProject || " NOT IN Projects!")) AS Info
FROM Units
WHERE Units.SpaceshipProject NOT IN (SELECT Type FROM Projects)
--
UNION ALL
SELECT 
Units.Type AS Type,
Units.Class AS Class,
'ERROR' AS Defcon,
(SELECT ("Units.LeaderPromotion "|| Units.LeaderPromotion || " NOT IN UnitPromotions!")) AS Info
FROM Units
WHERE Units.LeaderPromotion NOT IN (SELECT Type FROM UnitPromotions)
--
UNION ALL
SELECT 
Units.Type AS Type,
Units.Class AS Class,
'ERROR' AS Defcon,
(SELECT ("Units.MoveRate "|| Units.MoveRate || " NOT IN MovementRates!")) AS Info
FROM Units
WHERE Units.MoveRate NOT IN (SELECT Type FROM MovementRates)
--
UNION ALL
SELECT 
Units.Type AS Type,
Units.Class AS Class,
'ERROR' AS Defcon,
(SELECT ("Units.IconAtlas "|| Units.IconAtlas || " NOT IN IconTextureAtlases.Atlas!")) AS Info
FROM Units
WHERE Units.IconAtlas NOT IN (SELECT Atlas FROM IconTextureAtlases)
--
UNION ALL
SELECT 
Units.Type AS Type,
Units.Class AS Class,
'ERROR' AS Defcon,
(SELECT ("Units.UnitFlagAtlas "|| Units.UnitFlagAtlas || " NOT IN IconTextureAtlases.Atlas!")) AS Info
FROM Units
WHERE Units.UnitFlagAtlas NOT IN (SELECT Atlas FROM IconTextureAtlases)
--
UNION ALL
SELECT 
Units.Type AS Type,
Units.Class AS Class,
'ERROR' AS Defcon,
(SELECT ("Units.PromotionClass "|| Units.PromotionClass || " NOT IN UnitCombatInfos.Type!")) AS Info
FROM Units
WHERE Units.PromotionClass NOT IN (SELECT Type FROM UnitCombatInfos)
--
UNION ALL
SELECT 
Unit_BuildOnFound.UnitType AS Type,
Unit_BuildOnFound.BuildingClassType AS Class,
'ERROR' AS Defcon,
(SELECT ("Unit_BuildOnFound.UnitType "|| Unit_BuildOnFound.UnitType || " NOT IN Units.Type!")) AS Info
FROM Unit_BuildOnFound
WHERE Unit_BuildOnFound.UnitType NOT IN (SELECT Type FROM Units)
--
UNION ALL
SELECT 
Unit_BuildOnFound.UnitType AS Type,
Unit_BuildOnFound.BuildingClassType AS Class,
'ERROR' AS Defcon,
(SELECT ("Unit_BuildOnFound.BuildingClassType "|| Unit_BuildOnFound.BuildingClassType || " NOT IN Buildings.BuildingClass!")) AS Info
FROM Unit_BuildOnFound
WHERE Unit_BuildOnFound.BuildingClassType NOT IN (SELECT BuildingClass FROM Buildings)
--
UNION ALL
SELECT 
Unit_BuildingClassPurchaseRequireds.UnitType AS Type,
Unit_BuildingClassPurchaseRequireds.BuildingClassType AS Class,
'ERROR' AS Defcon,
(SELECT ("Unit_BuildingClassPurchaseRequireds.UnitType "|| Unit_BuildingClassPurchaseRequireds.UnitType || " NOT IN Units.Type!")) AS Info
FROM Unit_BuildingClassPurchaseRequireds
WHERE Unit_BuildingClassPurchaseRequireds.UnitType NOT IN (SELECT Type FROM Units)
--
UNION ALL
SELECT 
Unit_BuildingClassPurchaseRequireds.UnitType AS Type,
Unit_BuildingClassPurchaseRequireds.BuildingClassType AS Class,
'ERROR' AS Defcon,
(SELECT ("Unit_BuildingClassPurchaseRequireds.BuildingClassType "|| Unit_BuildingClassPurchaseRequireds.BuildingClassType || " NOT IN Buildings.BuildingClass!")) AS Info
FROM Unit_BuildingClassPurchaseRequireds
WHERE Unit_BuildingClassPurchaseRequireds.BuildingClassType NOT IN (SELECT BuildingClass FROM Buildings)
--
UNION ALL
SELECT 
Unit_BuildingClassRequireds.UnitType AS Type,
Unit_BuildingClassRequireds.BuildingClassType AS Class,
'ERROR' AS Defcon,
(SELECT ("Unit_BuildingClassRequireds.UnitType "|| Unit_BuildingClassRequireds.UnitType || " NOT IN Units.Type!")) AS Info
FROM Unit_BuildingClassRequireds
WHERE Unit_BuildingClassRequireds.UnitType NOT IN (SELECT Type FROM Units)
--
UNION ALL
SELECT 
Unit_BuildingClassRequireds.UnitType AS Type,
Unit_BuildingClassRequireds.BuildingClassType AS Class,
'ERROR' AS Defcon,
(SELECT ("Unit_BuildingClassRequireds.BuildingClassType "|| Unit_BuildingClassRequireds.BuildingClassType || " NOT IN Buildings.BuildingClass!")) AS Info
FROM Unit_BuildingClassRequireds
WHERE Unit_BuildingClassRequireds.BuildingClassType NOT IN (SELECT BuildingClass FROM Buildings)
--
UNION ALL
SELECT 
Unit_Buildings.UnitType AS Type,
Unit_Buildings.BuildingType AS Class,
'ERROR' AS Defcon,
(SELECT ("Unit_Buildings.UnitType "|| Unit_Buildings.UnitType || " NOT IN Units.Type!")) AS Info
FROM Unit_Buildings
WHERE Unit_Buildings.UnitType NOT IN (SELECT Type FROM Units)
--
UNION ALL
SELECT 
Unit_Buildings.UnitType AS Type,
Unit_Buildings.BuildingType AS Class,
'ERROR' AS Defcon,
(SELECT ("Unit_Buildings.BuildingType "|| Unit_Buildings.BuildingType || " NOT IN Buildings.Type!")) AS Info
FROM Unit_Buildings
WHERE Unit_Buildings.BuildingType NOT IN (SELECT Type FROM Buildings)
--
UNION ALL
SELECT 
Unit_Builds.UnitType AS Type,
Unit_Builds.BuildType AS Class,
'ERROR' AS Defcon,
(SELECT ("Unit_Builds.UnitType "|| Unit_Builds.UnitType || " NOT IN Units.Type!")) AS Info
FROM Unit_Builds
WHERE Unit_Builds.UnitType NOT IN (SELECT Type FROM Units)
--
UNION ALL
SELECT 
Unit_Builds.UnitType AS Type,
Unit_Builds.BuildType AS Class,
'ERROR' AS Defcon,
(SELECT ("Unit_Builds.BuildType "|| Unit_Builds.BuildType || " NOT IN Builds.Type!")) AS Info
FROM Unit_Builds
WHERE Unit_Builds.BuildType NOT IN (SELECT Type FROM Builds)
--
UNION ALL
SELECT 
Unit_ClassUpgrades.UnitType AS Type,
Unit_ClassUpgrades.UnitClassType AS Class,
'ERROR' AS Defcon,
(SELECT ("Unit_ClassUpgrades.UnitType "|| Unit_ClassUpgrades.UnitType || " NOT IN Units.Type!")) AS Info
FROM Unit_ClassUpgrades
WHERE Unit_ClassUpgrades.UnitType NOT IN (SELECT Type FROM Units)
--
UNION ALL
SELECT 
Unit_ClassUpgrades.UnitType AS Type,
Unit_ClassUpgrades.UnitClassType AS Class,
'ERROR' AS Defcon,
(SELECT ("Unit_ClassUpgrades.UnitClassType "|| Unit_ClassUpgrades.UnitClassType || " NOT IN UnitClasses.Type!")) AS Info
FROM Unit_ClassUpgrades
WHERE Unit_ClassUpgrades.UnitClassType NOT IN (SELECT Type FROM UnitClasses)
--
UNION ALL
SELECT 
Unit_Flavors.UnitType AS Type,
Unit_Flavors.FlavorType AS Class,
'ERROR' AS Defcon,
(SELECT ("Unit_Flavors.UnitType "|| Unit_Flavors.UnitType || " NOT IN Units.Type!")) AS Info
FROM Unit_Flavors
WHERE Unit_Flavors.UnitType NOT IN (SELECT Type FROM Units)
--
UNION ALL
SELECT 
Unit_Flavors.UnitType AS Type,
Unit_Flavors.FlavorType AS Class,
'ERROR' AS Defcon,
(SELECT ("Unit_Flavors.FlavorType "|| Unit_Flavors.FlavorType || " NOT IN Flavors.Type!")) AS Info
FROM Unit_Flavors
WHERE Unit_Flavors.FlavorType NOT IN (SELECT Type FROM Flavors)
--
UNION ALL
SELECT 
Unit_FreePromotions.UnitType AS Type,
Unit_FreePromotions.PromotionType AS Class,
'ERROR' AS Defcon,
(SELECT ("Unit_FreePromotions.UnitType "|| Unit_FreePromotions.UnitType || " NOT IN Units.Type!")) AS Info
FROM Unit_FreePromotions
WHERE Unit_FreePromotions.UnitType NOT IN (SELECT Type FROM Units)
--
UNION ALL
SELECT 
Unit_FreePromotions.UnitType AS Type,
Unit_FreePromotions.PromotionType AS Class,
'ERROR' AS Defcon,
(SELECT ("Unit_FreePromotions.PromotionType "|| Unit_FreePromotions.PromotionType || " NOT IN UnitPromotions.Type!")) AS Info
FROM Unit_FreePromotions
WHERE Unit_FreePromotions.PromotionType NOT IN (SELECT Type FROM UnitPromotions)
--
-- Unit_GreatPersons
-- Unit_NotAITypes
--
UNION ALL
SELECT 
Unit_ProductionModifierBuildings.UnitType AS Type,
Unit_ProductionModifierBuildings.BuildingType AS Class,
'ERROR' AS Defcon,
(SELECT ("Unit_ProductionModifierBuildings.UnitType "|| Unit_ProductionModifierBuildings.UnitType || " NOT IN Units.Type!")) AS Info
FROM Unit_ProductionModifierBuildings
WHERE Unit_ProductionModifierBuildings.UnitType NOT IN (SELECT Type FROM Units)
--
UNION ALL
SELECT 
Unit_ProductionModifierBuildings.UnitType AS Type,
Unit_ProductionModifierBuildings.BuildingType AS Class,
'ERROR' AS Defcon,
(SELECT ("Unit_ProductionModifierBuildings.BuildingType "|| Unit_ProductionModifierBuildings.BuildingType || " NOT IN Buildings.Type!")) AS Info
FROM Unit_ProductionModifierBuildings
WHERE Unit_ProductionModifierBuildings.BuildingType NOT IN (SELECT Type FROM Buildings)
--
-- Unit_ProductionTraits
--
UNION ALL
SELECT 
Unit_ResourceQuantityRequirements.UnitType AS Type,
Unit_ResourceQuantityRequirements.ResourceType AS Class,
'ERROR' AS Defcon,
(SELECT ("Unit_ResourceQuantityRequirements.UnitType "|| Unit_ResourceQuantityRequirements.UnitType || " NOT IN Units.Type!")) AS Info
FROM Unit_ResourceQuantityRequirements
WHERE Unit_ResourceQuantityRequirements.UnitType NOT IN (SELECT Type FROM Units)
--
UNION ALL
SELECT 
Unit_ResourceQuantityRequirements.UnitType AS Type,
Unit_ResourceQuantityRequirements.ResourceType AS Class,
'ERROR' AS Defcon,
(SELECT ("Unit_ResourceQuantityRequirements.ResourceType "|| Unit_ResourceQuantityRequirements.ResourceType || " NOT IN Resources.Type!")) AS Info
FROM Unit_ResourceQuantityRequirements
WHERE Unit_ResourceQuantityRequirements.ResourceType NOT IN (SELECT Type FROM Resources)
--
UNION ALL
SELECT 
Unit_UniqueNames.UnitType AS Type,
NULL AS Class,
'ERROR' AS Defcon,
(SELECT ("Unit_UniqueNames.UnitType "|| Unit_UniqueNames.UnitType || " NOT IN Units.Type!")) AS Info
FROM Unit_UniqueNames
WHERE Unit_UniqueNames.UnitType NOT IN (SELECT Type FROM Units)
--
-- Unit_YieldFromBarbarianKills
--
UNION ALL
SELECT 
Unit_YieldFromKills.UnitType AS Type,
Unit_YieldFromKills.YieldType AS Class,
'ERROR' AS Defcon,
(SELECT ("Unit_YieldFromKills.UnitType "|| Unit_YieldFromKills.UnitType || " NOT IN Units.Type!")) AS Info
FROM Unit_YieldFromKills
WHERE Unit_YieldFromKills.UnitType NOT IN (SELECT Type FROM Units)
--
UNION ALL
SELECT 
Unit_YieldFromKills.UnitType AS Type,
Unit_YieldFromKills.YieldType AS Class,
'ERROR' AS Defcon,
(SELECT ("Unit_YieldFromKills.YieldType "|| Unit_YieldFromKills.YieldType || " NOT IN Yields.Type!")) AS Info
FROM Unit_YieldFromKills
WHERE Unit_YieldFromKills.YieldType NOT IN (SELECT Type FROM Yields)
--
ORDER BY Defcon;