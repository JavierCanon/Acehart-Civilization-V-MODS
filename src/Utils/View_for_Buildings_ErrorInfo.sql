-- check all Tables from Buildings for Error's and other Info's
CREATE VIEW IF NOT EXISTS Error_Info_Buildings AS
-- BuildingClass
SELECT 
Buildings.Type AS Type,
Buildings.BuildingClass AS Class,
'ERROR' AS Defcon,
(SELECT ("Buildings.BuildingClass "|| Buildings.BuildingClass || " NOT IN BuildingClasses.Type!")) AS Info
FROM Buildings
WHERE Buildings.BuildingClass NOT IN (SELECT Type FROM BuildingClasses)
--
UNION ALL
SELECT 
BuildingClasses.DefaultBuilding AS Type,
BuildingClasses.Type AS Class,
'ERROR' AS Defcon,
(SELECT ("BuildingClasses.Type "|| BuildingClasses.Type || " NOT IN Buildings.BuildingClass!")) AS Info
FROM BuildingClasses
WHERE BuildingClasses.Type NOT IN (SELECT BuildingClass FROM Buildings)
--
UNION ALL
SELECT 
BuildingClasses.DefaultBuilding AS Type,
BuildingClasses.Type AS Class,
'ERROR' AS Defcon,
(SELECT ("BuildingClasses.DefaultBuilding "|| BuildingClasses.DefaultBuilding || " NOT IN Buildings.Type!")) AS Info
FROM BuildingClasses
WHERE BuildingClasses.DefaultBuilding NOT IN (SELECT Type FROM Buildings)
--
UNION ALL
SELECT 
Buildings.Type AS Type,
Buildings.BuildingClass AS Class,
'OK' AS Defcon,
'Buildings.BuildingClass can not be built from Barbarian''s' AS Info
FROM Buildings
WHERE Buildings.BuildingClass IN (SELECT BuildingClassType FROM Civilization_BuildingClassOverrides WHERE CivilizationType = 'CIVILIZATION_BARBARIAN' AND BuildingType IS NULL)
--
UNION ALL
SELECT 
Buildings.Type AS Type,
Buildings.BuildingClass AS Class,
'OK' AS Defcon,
'Buildings.BuildingClass can not be built from Minor Civ''s' AS Info
FROM Buildings
WHERE Buildings.BuildingClass IN (SELECT BuildingClassType FROM Civilization_BuildingClassOverrides WHERE CivilizationType = 'CIVILIZATION_MINOR' AND BuildingType IS NULL)
--
UNION ALL
SELECT 
Buildings.Type AS Type,
Buildings.BuildingClass AS Class,
'INFO' AS Defcon,
(SELECT ("Buildings.Type can only be built from "|| Civilization_BuildingClassOverrides.CivilizationType)) AS Info
FROM Buildings, Civilization_BuildingClassOverrides
WHERE Buildings.BuildingClass IN (SELECT BuildingClassType FROM Civilization_BuildingClassOverrides WHERE BuildingType NOT NULL)
AND Civilization_BuildingClassOverrides.BuildingType = Buildings.Type
AND Civilization_BuildingClassOverrides.CivilizationType IS NOT 'CIVILIZATION_BARBARIAN'
--
UNION ALL
SELECT DISTINCT
Civilization_BuildingClassOverrides.BuildingType AS Type,
Civilization_BuildingClassOverrides.BuildingClassType AS Class,
'ERROR' AS Defcon,
'Civilization_BuildingClassOverrides.BuildingType not in Buildings.Type' AS Info
FROM Civilization_BuildingClassOverrides
WHERE Civilization_BuildingClassOverrides.BuildingType NOT IN (SELECT Type FROM Buildings)
--
UNION ALL
SELECT DISTINCT
Civilization_BuildingClassOverrides.BuildingType AS Type,
Civilization_BuildingClassOverrides.BuildingClassType AS Class,
'ERROR' AS Defcon,
'Civilization_BuildingClassOverrides.BuildingClassType not in Buildings.BuildingClass' AS Info
FROM Civilization_BuildingClassOverrides
WHERE Civilization_BuildingClassOverrides.BuildingClassType NOT IN (SELECT BuildingClass FROM Buildings)
--
UNION ALL
SELECT DISTINCT
Civilization_BuildingClassOverrides.BuildingType AS Type,
Civilization_BuildingClassOverrides.BuildingClassType AS Class,
'ERROR' AS Defcon,
'Civilization_BuildingClassOverrides.CivilizationType not in Civilizations.Type' AS Info
FROM Civilization_BuildingClassOverrides
WHERE Civilization_BuildingClassOverrides.CivilizationType NOT IN (SELECT Type FROM Civilizations)
--
-- ArtDefineTag
-- 
UNION ALL
SELECT 
Buildings.Type AS Type,
Buildings.BuildingClass AS Class,
'ERROR' AS Defcon,
(SELECT ("Buildings.NearbyTerrainRequired "|| Buildings.NearbyTerrainRequired || " NOT IN Terrains.Type!")) AS Info
FROM Buildings
WHERE Buildings.NearbyTerrainRequired NOT IN (SELECT Type FROM Terrains)
-- 
UNION ALL
SELECT 
Buildings.Type AS Type,
Buildings.BuildingClass AS Class,
'ERROR' AS Defcon,
(SELECT ("Buildings.ProhibitedCityTerrain "|| Buildings.ProhibitedCityTerrain || " NOT IN Terrains.Type!")) AS Info
FROM Buildings
WHERE Buildings.ProhibitedCityTerrain NOT IN (SELECT Type FROM Terrains)
-- 
UNION ALL
SELECT 
Buildings.Type AS Type,
Buildings.BuildingClass AS Class,
'ERROR' AS Defcon,
(SELECT ("Buildings.VictoryPrereq "|| Buildings.VictoryPrereq || " NOT IN Victories.Type!")) AS Info
FROM Buildings
WHERE Buildings.VictoryPrereq NOT IN (SELECT Type FROM Victories)
-- 
UNION ALL
SELECT 
Buildings.Type AS Type,
Buildings.BuildingClass AS Class,
'ERROR' AS Defcon,
(SELECT ("Buildings.FreeStartEra "|| Buildings.FreeStartEra || " NOT IN Eras.Type!")) AS Info
FROM Buildings
WHERE Buildings.FreeStartEra NOT IN (SELECT Type FROM Eras)
-- 
UNION ALL
SELECT 
Buildings.Type AS Type,
Buildings.BuildingClass AS Class,
'ERROR' AS Defcon,
(SELECT ("Buildings.MaxStartEra "|| Buildings.MaxStartEra || " NOT IN Eras.Type!")) AS Info
FROM Buildings
WHERE Buildings.MaxStartEra NOT IN (SELECT Type FROM Eras)
-- 
UNION ALL
SELECT 
Buildings.Type AS Type,
Buildings.BuildingClass AS Class,
'ERROR' AS Defcon,
(SELECT ("Buildings.ObsoleteTech "|| Buildings.ObsoleteTech || " NOT IN Technologies.Type!")) AS Info
FROM Buildings
WHERE Buildings.ObsoleteTech NOT IN (SELECT Type FROM Technologies)
-- 
UNION ALL
SELECT 
Buildings.Type AS Type,
Buildings.BuildingClass AS Class,
'ERROR' AS Defcon,
(SELECT ("Buildings.EnhancedYieldTech "|| Buildings.EnhancedYieldTech || " NOT IN Technologies.Type!")) AS Info
FROM Buildings
WHERE Buildings.EnhancedYieldTech NOT IN (SELECT Type FROM Technologies)
--
UNION ALL
SELECT 
Buildings.Type AS Type,
Buildings.BuildingClass AS Class,
'ERROR' AS Defcon,
(SELECT ("Buildings.Type has EnhancedYieldTech " || Buildings.EnhancedYieldTech || " AND TechEnhancedTourism "|| Buildings.TechEnhancedTourism ||" AND an Entry's in IN Building_TechEnhancedYieldChanges.BuildingType!")) AS Info
FROM Buildings, Building_TechEnhancedYieldChanges
WHERE Buildings.Type IN (SELECT BuildingType FROM Building_TechEnhancedYieldChanges)
AND Buildings.TechEnhancedTourism != 0
AND Buildings.Type = Building_TechEnhancedYieldChanges.BuildingType
--
UNION ALL
SELECT 
Buildings.Type AS Type,
Buildings.BuildingClass AS Class,
'ERROR' AS Defcon,
(SELECT ("Building has EnhancedYieldTech "|| Buildings.EnhancedYieldTech || " but NO TechEnhancedTourism AND NO TechEnhancedYieldChanges in Building_TechEnhancedYieldChanges.BuildingType")) AS Info
FROM Buildings, Building_TechEnhancedYieldChanges
WHERE Buildings.Type NOT IN (SELECT BuildingType FROM Building_TechEnhancedYieldChanges)
AND Buildings.TechEnhancedTourism = 0
AND Buildings.Type = Building_TechEnhancedYieldChanges.BuildingType
--
UNION ALL
SELECT 
Building_TechEnhancedYieldChanges.BuildingType AS Type,
NULL AS Class,
'ERROR' AS Defcon,
(SELECT ("Building_TechEnhancedYieldChanges.BuildingType "|| Building_TechEnhancedYieldChanges.BuildingType || " NOT IN Buildings.Type!")) AS Info
FROM Building_TechEnhancedYieldChanges
WHERE Building_TechEnhancedYieldChanges.BuildingType NOT IN (SELECT Type FROM Buildings)
--
UNION ALL
SELECT 
Building_TechEnhancedYieldChanges.BuildingType AS Type,
NULL AS Class,
'ERROR' AS Defcon,
(SELECT ("Building_TechEnhancedYieldChanges.YieldType "|| Building_TechEnhancedYieldChanges.YieldType || " NOT IN Yields.Type!")) AS Info
FROM Building_TechEnhancedYieldChanges
WHERE Building_TechEnhancedYieldChanges.YieldType NOT IN (SELECT Type FROM Yields)
-- 
UNION ALL
SELECT 
Buildings.Type AS Type,
Buildings.BuildingClass AS Class,
'ERROR' AS Defcon,
(SELECT ("Buildings.FreeBuilding "|| Buildings.FreeBuilding || " NOT IN BuildingClasses.Type!")) AS Info
FROM Buildings
WHERE Buildings.FreeBuilding NOT IN (SELECT Type FROM BuildingClasses)
-- 
UNION ALL
SELECT 
Buildings.Type AS Type,
Buildings.BuildingClass AS Class,
'ERROR' AS Defcon,
(SELECT ("Buildings.FreeBuildingThisCity "|| Buildings.FreeBuildingThisCity || " NOT IN BuildingClasses.Type!")) AS Info
FROM Buildings
WHERE Buildings.FreeBuildingThisCity NOT IN (SELECT Type FROM BuildingClasses)
-- 
UNION ALL
SELECT 
Buildings.Type AS Type,
Buildings.BuildingClass AS Class,
'ERROR' AS Defcon,
(SELECT ("Buildings.FreePromotion "|| Buildings.FreePromotion || " NOT IN UnitPromotions.Type!")) AS Info
FROM Buildings
WHERE Buildings.FreePromotion NOT IN (SELECT Type FROM UnitPromotions)
-- 
UNION ALL
SELECT 
Buildings.Type AS Type,
Buildings.BuildingClass AS Class,
'ERROR' AS Defcon,
(SELECT ("Buildings.TrainedFreePromotion "|| Buildings.TrainedFreePromotion || " NOT IN UnitPromotions.Type!")) AS Info
FROM Buildings
WHERE Buildings.TrainedFreePromotion NOT IN (SELECT Type FROM UnitPromotions)
-- 
UNION ALL
SELECT 
Buildings.Type AS Type,
Buildings.BuildingClass AS Class,
'ERROR' AS Defcon,
(SELECT ("Buildings.FreePromotionRemoved "|| Buildings.FreePromotionRemoved || " NOT IN UnitPromotions.Type!")) AS Info
FROM Buildings
WHERE Buildings.FreePromotionRemoved NOT IN (SELECT Type FROM UnitPromotions)
-- 
UNION ALL
SELECT 
Buildings.Type AS Type,
Buildings.BuildingClass AS Class,
'ERROR' AS Defcon,
(SELECT ("Buildings.ReplacementBuildingClass "|| Buildings.ReplacementBuildingClass || " NOT IN BuildingClasses.Type!")) AS Info
FROM Buildings
WHERE Buildings.ReplacementBuildingClass NOT IN (SELECT Type FROM BuildingClasses)
-- 
UNION ALL
SELECT 
Buildings.Type AS Type,
Buildings.BuildingClass AS Class,
'ERROR' AS Defcon,
(SELECT ("Buildings.PrereqTech "|| Buildings.PrereqTech || " NOT IN Technologies.Type!")) AS Info
FROM Buildings
WHERE Buildings.PrereqTech NOT IN (SELECT Type FROM Technologies)
-- 
UNION ALL
SELECT 
Buildings.Type AS Type,
Buildings.BuildingClass AS Class,
'OK' AS Defcon,
'Building has NO PrereqTech in Building_TechAndPrereqs' AS Info
FROM Buildings
WHERE Buildings.Type NOT IN (SELECT BuildingType FROM Building_TechAndPrereqs)
-- 
UNION ALL
SELECT 
Buildings.Type AS Type,
Buildings.BuildingClass AS Class,
'INFO' AS Defcon,
(SELECT ("Building has "|| Building_TechAndPrereqs.TechType || " as PrereqTech in Building_TechAndPrereqs")) AS Info
FROM Buildings, Building_TechAndPrereqs
WHERE Buildings.Type IN (SELECT BuildingType FROM Building_TechAndPrereqs)
AND Buildings.Type = Building_TechAndPrereqs.BuildingType
-- */
UNION ALL
SELECT 
Buildings.Type AS Type,
Buildings.BuildingClass AS Class,
'ERROR' AS Defcon,
(SELECT ("Building PrereqTech from Building_TechAndPrereqs "|| Building_TechAndPrereqs.TechType || " NOT IN Technologies!")) AS Info
FROM Buildings, Building_TechAndPrereqs
WHERE Buildings.Type = Building_TechAndPrereqs.BuildingType
AND Building_TechAndPrereqs.TechType NOT IN (SELECT Type FROM Technologies)
--
UNION ALL
SELECT 
Buildings.Type AS Type,
Buildings.BuildingClass AS Class,
'ERROR' AS Defcon,
(SELECT ("Buildings.PolicyBranchType "|| Buildings.PolicyBranchType || " NOT IN PolicyBranchTypes.Type!")) AS Info
FROM Buildings
WHERE Buildings.PolicyBranchType NOT IN (SELECT Type FROM PolicyBranchTypes)
-- 
UNION ALL
SELECT 
Buildings.Type AS Type,
Buildings.BuildingClass AS Class,
'ERROR' AS Defcon,
(SELECT ("Buildings.SpecialistType "|| Buildings.SpecialistType || " NOT IN Specialists.Type!")) AS Info
FROM Buildings
WHERE Buildings.SpecialistType NOT IN (SELECT Type FROM Specialists)
-- 
UNION ALL
SELECT 
Buildings.Type AS Type,
Buildings.BuildingClass AS Class,
'ERROR' AS Defcon,
(SELECT ("Buildings.GreatWorkSlotType "|| Buildings.GreatWorkSlotType || " NOT IN GreatWorkSlots.Type!")) AS Info
FROM Buildings
WHERE Buildings.GreatWorkSlotType NOT IN (SELECT Type FROM GreatWorkSlots)
-- 
UNION ALL
SELECT 
Buildings.Type AS Type,
Buildings.BuildingClass AS Class,
'ERROR' AS Defcon,
(SELECT ("Buildings.FreeGreatWork "|| Buildings.FreeGreatWork || " NOT IN GreatWorks.Type!")) AS Info
FROM Buildings
WHERE Buildings.FreeGreatWork NOT IN (SELECT Type FROM GreatWorks)
-- 
UNION ALL
SELECT 
Buildings.Type AS Type,
Buildings.BuildingClass AS Class,
'ERROR' AS Defcon,
(SELECT ("Buildings.IconAtlas "|| Buildings.IconAtlas || " NOT IN IconTextureAtlases.Atlas!")) AS Info
FROM Buildings
WHERE Buildings.IconAtlas NOT IN (SELECT Atlas FROM IconTextureAtlases)
-- 
UNION ALL
SELECT 
Buildings.Type AS Type,
Buildings.BuildingClass AS Class,
'ERROR' AS Defcon,
(SELECT ("Buildings.PolicyType "|| Buildings.PolicyType || " NOT IN Policies.Type!")) AS Info
FROM Buildings
WHERE Buildings.PolicyType NOT IN (SELECT Type FROM Policies)
-- 
UNION ALL
SELECT 
Buildings.Type AS Type,
Buildings.BuildingClass AS Class,
'ERROR' AS Defcon,
(SELECT ("Buildings.ResourceType "|| Buildings.ResourceType || " NOT IN Resources.Type!")) AS Info
FROM Buildings
WHERE Buildings.ResourceType NOT IN (SELECT Type FROM Resources)
-- 
-- NeedBuildingThisCity
--
UNION ALL
SELECT 
Buildings.Type AS Type,
Buildings.BuildingClass AS Class,
'ERROR' AS Defcon,
(SELECT ("Buildings.GreatWorkYieldType "|| Buildings.GreatWorkYieldType || " NOT IN Yields.Type!")) AS Info
FROM Buildings
WHERE Buildings.GreatWorkYieldType NOT IN (SELECT Type FROM Yields)
-- 
-- BuildingClass_VictoryThresholds
-- Building_AreaYieldModifiers
-- 
UNION ALL
SELECT 
Building_BuildingClassHappiness.BuildingType AS Type,
NULL AS Class,
'ERROR' AS Defcon,
(SELECT ("Building_BuildingClassHappiness.BuildingType "|| Building_BuildingClassHappiness.BuildingType || " NOT IN Buildings.Type!")) AS Info
FROM Building_BuildingClassHappiness
WHERE Building_BuildingClassHappiness.BuildingType NOT IN (SELECT Type FROM Buildings)
--
UNION ALL
SELECT 
Building_BuildingClassHappiness.BuildingType AS Type,
NULL AS Class,
'ERROR' AS Defcon,
(SELECT ("Building_BuildingClassHappiness.BuildingClassType "|| Building_BuildingClassHappiness.BuildingClassType || " NOT IN BuildingClasses.Type!")) AS Info
FROM Building_BuildingClassHappiness
WHERE Building_BuildingClassHappiness.BuildingClassType NOT IN (SELECT Type FROM BuildingClasses)
--
-- Building_BuildingClassLocalHappiness
-- Building_BuildingClassLocalYieldChanges
--
UNION ALL
SELECT 
Building_BuildingClassYieldChanges.BuildingType AS Type,
NULL AS Class,
'ERROR' AS Defcon,
(SELECT ("Building_BuildingClassYieldChanges.BuildingType "|| Building_BuildingClassYieldChanges.BuildingType || " NOT IN Buildings.Type!")) AS Info
FROM Building_BuildingClassYieldChanges
WHERE Building_BuildingClassYieldChanges.BuildingType NOT IN (SELECT Type FROM Buildings)
--
UNION ALL
SELECT 
Building_BuildingClassYieldChanges.BuildingType AS Type,
NULL AS Class,
'ERROR' AS Defcon,
(SELECT ("Building_BuildingClassYieldChanges.BuildingClassType "|| Building_BuildingClassYieldChanges.BuildingClassType || " NOT IN BuildingClasses.Type!")) AS Info
FROM Building_BuildingClassYieldChanges
WHERE Building_BuildingClassYieldChanges.BuildingClassType NOT IN (SELECT Type FROM BuildingClasses)
--
UNION ALL
SELECT 
Building_BuildingClassYieldChanges.BuildingType AS Type,
NULL AS Class,
'ERROR' AS Defcon,
(SELECT ("Building_BuildingClassYieldChanges.YieldType "|| Building_BuildingClassYieldChanges.YieldType || " NOT IN Yields.Type!")) AS Info
FROM Building_BuildingClassYieldChanges
WHERE Building_BuildingClassYieldChanges.YieldType NOT IN (SELECT Type FROM Yields)
--
-- Building_ClassNeededAnywhere
--
UNION ALL
SELECT 
Building_ClassesNeededInCity.BuildingType AS Type,
NULL AS Class,
'ERROR' AS Defcon,
(SELECT ("Building_ClassesNeededInCity.BuildingType "|| Building_ClassesNeededInCity.BuildingType || " NOT IN Buildings.Type!")) AS Info
FROM Building_ClassesNeededInCity
WHERE Building_ClassesNeededInCity.BuildingType NOT IN (SELECT Type FROM Buildings)
--
UNION ALL
SELECT 
Building_ClassesNeededInCity.BuildingType AS Type,
NULL AS Class,
'ERROR' AS Defcon,
(SELECT ("Building_ClassesNeededInCity.BuildingClassType "|| Building_ClassesNeededInCity.BuildingClassType || " NOT IN BuildingClasses.Type!")) AS Info
FROM Building_ClassesNeededInCity
WHERE Building_ClassesNeededInCity.BuildingClassType NOT IN (SELECT Type FROM BuildingClasses)
--
UNION ALL
SELECT 
Building_DomainFreeExperiencePerGreatWork.BuildingType AS Type,
NULL AS Class,
'ERROR' AS Defcon,
(SELECT ("Building_DomainFreeExperiencePerGreatWork.BuildingType "|| Building_DomainFreeExperiencePerGreatWork.BuildingType || " NOT IN Buildings.Type!")) AS Info
FROM Building_DomainFreeExperiencePerGreatWork
WHERE Building_DomainFreeExperiencePerGreatWork.BuildingType NOT IN (SELECT Type FROM Buildings)
--
UNION ALL
SELECT 
Building_DomainFreeExperiencePerGreatWork.BuildingType AS Type,
NULL AS Class,
'ERROR' AS Defcon,
(SELECT ("Building_DomainFreeExperiencePerGreatWork.DomainType "|| Building_DomainFreeExperiencePerGreatWork.DomainType || " NOT IN Domains.Type!")) AS Info
FROM Building_DomainFreeExperiencePerGreatWork
WHERE Building_DomainFreeExperiencePerGreatWork.DomainType NOT IN (SELECT Type FROM Domains)
--
UNION ALL
SELECT 
Building_DomainFreeExperiences.BuildingType AS Type,
NULL AS Class,
'ERROR' AS Defcon,
(SELECT ("Building_DomainFreeExperiences.BuildingType "|| Building_DomainFreeExperiences.BuildingType || " NOT IN Buildings.Type!")) AS Info
FROM Building_DomainFreeExperiences
WHERE Building_DomainFreeExperiences.BuildingType NOT IN (SELECT Type FROM Buildings)
--
UNION ALL
SELECT 
Building_DomainFreeExperiences.BuildingType AS Type,
NULL AS Class,
'ERROR' AS Defcon,
(SELECT ("Building_DomainFreeExperiences.DomainType "|| Building_DomainFreeExperiences.DomainType || " NOT IN Domains.Type!")) AS Info
FROM Building_DomainFreeExperiences
WHERE Building_DomainFreeExperiences.DomainType NOT IN (SELECT Type FROM Domains)
--
UNION ALL
SELECT 
Building_DomainProductionModifiers.BuildingType AS Type,
NULL AS Class,
'ERROR' AS Defcon,
(SELECT ("Building_DomainProductionModifiers.BuildingType "|| Building_DomainProductionModifiers.BuildingType || " NOT IN Buildings.Type!")) AS Info
FROM Building_DomainProductionModifiers
WHERE Building_DomainProductionModifiers.BuildingType NOT IN (SELECT Type FROM Buildings)
--
UNION ALL
SELECT 
Building_DomainProductionModifiers.BuildingType AS Type,
NULL AS Class,
'ERROR' AS Defcon,
(SELECT ("Building_DomainProductionModifiers.DomainType "|| Building_DomainProductionModifiers.DomainType || " NOT IN Domains.Type!")) AS Info
FROM Building_DomainProductionModifiers
WHERE Building_DomainProductionModifiers.DomainType NOT IN (SELECT Type FROM Domains)
--
UNION ALL
SELECT 
Building_FeatureYieldChanges.BuildingType AS Type,
NULL AS Class,
'ERROR' AS Defcon,
(SELECT ("Building_FeatureYieldChanges.BuildingType "|| Building_FeatureYieldChanges.BuildingType || " NOT IN Buildings.Type!")) AS Info
FROM Building_FeatureYieldChanges
WHERE Building_FeatureYieldChanges.BuildingType NOT IN (SELECT Type FROM Buildings)
--
UNION ALL
SELECT 
Building_FeatureYieldChanges.BuildingType AS Type,
NULL AS Class,
'ERROR' AS Defcon,
(SELECT ("Building_FeatureYieldChanges.FeatureType "|| Building_FeatureYieldChanges.FeatureType || " NOT IN Features.Type!")) AS Info
FROM Building_FeatureYieldChanges
WHERE Building_FeatureYieldChanges.FeatureType NOT IN (SELECT Type FROM Features)
--
UNION ALL
SELECT 
Building_FeatureYieldChanges.BuildingType AS Type,
NULL AS Class,
'ERROR' AS Defcon,
(SELECT ("Building_FeatureYieldChanges.YieldType "|| Building_FeatureYieldChanges.YieldType || " NOT IN Yields.Type!")) AS Info
FROM Building_FeatureYieldChanges
WHERE Building_FeatureYieldChanges.YieldType NOT IN (SELECT Type FROM Yields)
--
UNION ALL
SELECT 
Building_Flavors.BuildingType AS Type,
NULL AS Class,
'ERROR' AS Defcon,
(SELECT ("Building_Flavors.BuildingType "|| Building_Flavors.BuildingType || " NOT IN Buildings.Type!")) AS Info
FROM Building_Flavors
WHERE Building_Flavors.BuildingType NOT IN (SELECT Type FROM Buildings)
--
UNION ALL
SELECT 
Building_Flavors.BuildingType AS Type,
NULL AS Class,
'ERROR' AS Defcon,
(SELECT ("Building_Flavors.FlavorType "|| Building_Flavors.FlavorType || " NOT IN Flavors.Type!")) AS Info
FROM Building_Flavors
WHERE Building_Flavors.FlavorType NOT IN (SELECT Type FROM Flavors)
--
-- Building_Flavors_Human
-- Building_FreeSpecialistCounts
--
UNION ALL
SELECT 
Building_FreeUnits.BuildingType AS Type,
NULL AS Class,
'ERROR' AS Defcon,
(SELECT ("Building_FreeUnits.BuildingType "|| Building_FreeUnits.BuildingType || " NOT IN Buildings.Type!")) AS Info
FROM Building_FreeUnits
WHERE Building_FreeUnits.BuildingType NOT IN (SELECT Type FROM Buildings)
--
UNION ALL
SELECT 
Building_FreeUnits.BuildingType AS Type,
NULL AS Class,
'ERROR' AS Defcon,
(SELECT ("Building_FreeUnits.UnitType "|| Building_FreeUnits.UnitType || " NOT IN Units.Type!")) AS Info
FROM Building_FreeUnits
WHERE Building_FreeUnits.UnitType NOT IN (SELECT Type FROM Units)
--
UNION ALL
SELECT 
Building_GlobalYieldModifiers.BuildingType AS Type,
NULL AS Class,
'ERROR' AS Defcon,
(SELECT ("Building_GlobalYieldModifiers.BuildingType "|| Building_GlobalYieldModifiers.BuildingType || " NOT IN Buildings.Type!")) AS Info
FROM Building_GlobalYieldModifiers
WHERE Building_GlobalYieldModifiers.BuildingType NOT IN (SELECT Type FROM Buildings)
--
UNION ALL
SELECT 
Building_GlobalYieldModifiers.BuildingType AS Type,
NULL AS Class,
'ERROR' AS Defcon,
(SELECT ("Building_GlobalYieldModifiers.YieldType "|| Building_GlobalYieldModifiers.YieldType || " NOT IN Yields.Type!")) AS Info
FROM Building_GlobalYieldModifiers
WHERE Building_GlobalYieldModifiers.YieldType NOT IN (SELECT Type FROM Yields)
--
UNION ALL
SELECT 
Building_GrowthExtraYield.BuildingType AS Type,
NULL AS Class,
'ERROR' AS Defcon,
(SELECT ("Building_GrowthExtraYield.BuildingType "|| Building_GrowthExtraYield.BuildingType || " NOT IN Buildings.Type!")) AS Info
FROM Building_GrowthExtraYield
WHERE Building_GrowthExtraYield.BuildingType NOT IN (SELECT Type FROM Buildings)
--
UNION ALL
SELECT 
Building_GrowthExtraYield.BuildingType AS Type,
NULL AS Class,
'ERROR' AS Defcon,
(SELECT ("Building_GrowthExtraYield.YieldType "|| Building_GrowthExtraYield.YieldType || " NOT IN Yields.Type!")) AS Info
FROM Building_GrowthExtraYield
WHERE Building_GrowthExtraYield.YieldType NOT IN (SELECT Type FROM Yields)
--
UNION ALL
SELECT 
Building_HurryModifiers.BuildingType AS Type,
NULL AS Class,
'ERROR' AS Defcon,
(SELECT ("Building_HurryModifiers.BuildingType "|| Building_HurryModifiers.BuildingType || " NOT IN Buildings.Type!")) AS Info
FROM Building_HurryModifiers
WHERE Building_HurryModifiers.BuildingType NOT IN (SELECT Type FROM Buildings)
--
UNION ALL
SELECT 
Building_HurryModifiers.BuildingType AS Type,
NULL AS Class,
'ERROR' AS Defcon,
(SELECT ("Building_HurryModifiers.HurryType "|| Building_HurryModifiers.HurryType || " NOT IN HurryInfos.Type!")) AS Info
FROM Building_HurryModifiers
WHERE Building_HurryModifiers.HurryType NOT IN (SELECT Type FROM HurryInfos)
--
UNION ALL
SELECT 
Building_InstantYield.BuildingType AS Type,
NULL AS Class,
'ERROR' AS Defcon,
(SELECT ("Building_InstantYield.BuildingType "|| Building_InstantYield.BuildingType || " NOT IN Buildings.Type!")) AS Info
FROM Building_InstantYield
WHERE Building_InstantYield.BuildingType NOT IN (SELECT Type FROM Buildings)
--
UNION ALL
SELECT 
Building_InstantYield.BuildingType AS Type,
NULL AS Class,
'ERROR' AS Defcon,
(SELECT ("Building_InstantYield.YieldType "|| Building_InstantYield.YieldType || " NOT IN Yields.Type!")) AS Info
FROM Building_InstantYield
WHERE Building_InstantYield.YieldType NOT IN (SELECT Type FROM Yields)
--
UNION ALL
SELECT 
Building_LakePlotYieldChanges.BuildingType AS Type,
NULL AS Class,
'ERROR' AS Defcon,
(SELECT ("Building_LakePlotYieldChanges.BuildingType "|| Building_LakePlotYieldChanges.BuildingType || " NOT IN Buildings.Type!")) AS Info
FROM Building_LakePlotYieldChanges
WHERE Building_LakePlotYieldChanges.BuildingType NOT IN (SELECT Type FROM Buildings)
--
UNION ALL
SELECT 
Building_LakePlotYieldChanges.BuildingType AS Type,
NULL AS Class,
'ERROR' AS Defcon,
(SELECT ("Building_LakePlotYieldChanges.YieldType "|| Building_LakePlotYieldChanges.YieldType || " NOT IN Yields.Type!")) AS Info
FROM Building_LakePlotYieldChanges
WHERE Building_LakePlotYieldChanges.YieldType NOT IN (SELECT Type FROM Yields)
--
UNION ALL
SELECT 
Building_LocalResourceAnds.BuildingType AS Type,
NULL AS Class,
'ERROR' AS Defcon,
(SELECT ("Building_LocalResourceAnds.BuildingType "|| Building_LocalResourceAnds.BuildingType || " NOT IN Buildings.Type!")) AS Info
FROM Building_LocalResourceAnds
WHERE Building_LocalResourceAnds.BuildingType NOT IN (SELECT Type FROM Buildings)
--
UNION ALL
SELECT 
Building_LocalResourceAnds.BuildingType AS Type,
NULL AS Class,
'ERROR' AS Defcon,
(SELECT ("Building_LocalResourceAnds.ResourceType "|| Building_LocalResourceAnds.ResourceType || " NOT IN Resources.Type!")) AS Info
FROM Building_LocalResourceAnds
WHERE Building_LocalResourceAnds.ResourceType NOT IN (SELECT Type FROM Resources)
--
UNION ALL
SELECT 
Building_LocalResourceOrs.BuildingType AS Type,
NULL AS Class,
'ERROR' AS Defcon,
(SELECT ("Building_LocalResourceOrs.BuildingType "|| Building_LocalResourceOrs.BuildingType || " NOT IN Buildings.Type!")) AS Info
FROM Building_LocalResourceOrs
WHERE Building_LocalResourceOrs.BuildingType NOT IN (SELECT Type FROM Buildings)
--
UNION ALL
SELECT 
Building_LocalResourceOrs.BuildingType AS Type,
NULL AS Class,
'ERROR' AS Defcon,
(SELECT ("Building_LocalResourceOrs.ResourceType "|| Building_LocalResourceOrs.ResourceType || " NOT IN Resources.Type!")) AS Info
FROM Building_LocalResourceOrs
WHERE Building_LocalResourceOrs.ResourceType NOT IN (SELECT Type FROM Resources)
--
-- Building_LockedBuildingClasses
--
UNION ALL
SELECT 
Building_PlotYieldChanges.BuildingType AS Type,
NULL AS Class,
'ERROR' AS Defcon,
(SELECT ("Building_PlotYieldChanges.BuildingType "|| Building_PlotYieldChanges.BuildingType || " NOT IN Buildings.Type!")) AS Info
FROM Building_PlotYieldChanges
WHERE Building_PlotYieldChanges.BuildingType NOT IN (SELECT Type FROM Buildings)
--
UNION ALL
SELECT 
Building_PlotYieldChanges.BuildingType AS Type,
NULL AS Class,
'ERROR' AS Defcon,
(SELECT ("Building_PlotYieldChanges.PlotType "|| Building_PlotYieldChanges.PlotType || " NOT IN Plots.Type!")) AS Info
FROM Building_PlotYieldChanges
WHERE Building_PlotYieldChanges.PlotType NOT IN (SELECT Type FROM Plots)
--
UNION ALL
SELECT 
Building_PlotYieldChanges.BuildingType AS Type,
NULL AS Class,
'ERROR' AS Defcon,
(SELECT ("Building_PlotYieldChanges.YieldType "|| Building_PlotYieldChanges.YieldType || " NOT IN Yields.Type!")) AS Info
FROM Building_PlotYieldChanges
WHERE Building_PlotYieldChanges.YieldType NOT IN (SELECT Type FROM Yields)
--
UNION ALL
SELECT 
Building_PrereqBuildingClasses.BuildingType AS Type,
NULL AS Class,
'ERROR' AS Defcon,
(SELECT ("Building_PrereqBuildingClasses.BuildingType "|| Building_PrereqBuildingClasses.BuildingType || " NOT IN Buildings.Type!")) AS Info
FROM Building_PrereqBuildingClasses
WHERE Building_PrereqBuildingClasses.BuildingType NOT IN (SELECT Type FROM Buildings)
--
UNION ALL
SELECT 
Building_PrereqBuildingClasses.BuildingType AS Type,
NULL AS Class,
'ERROR' AS Defcon,
(SELECT ("Building_PrereqBuildingClasses.BuildingClassType "|| Building_PrereqBuildingClasses.BuildingClassType || " NOT IN BuildingClasses.Type!")) AS Info
FROM Building_PrereqBuildingClasses
WHERE Building_PrereqBuildingClasses.BuildingClassType NOT IN (SELECT Type FROM BuildingClasses)
--
-- Building_ResourceCultureChanges
-- Building_ResourceFaithChanges
-- Building_ResourceMonopolyAnds
-- Building_ResourceMonopolyOrs
-- 
UNION ALL
SELECT 
Building_ResourcePerEra.BuildingType AS Type,
NULL AS Class,
'ERROR' AS Defcon,
(SELECT ("Building_ResourcePerEra.BuildingType "|| Building_ResourcePerEra.BuildingType || " NOT IN Buildings.Type!")) AS Info
FROM Building_ResourcePerEra
WHERE Building_ResourcePerEra.BuildingType NOT IN (SELECT Type FROM Buildings)
--
UNION ALL
SELECT 
Building_ResourcePerEra.BuildingType AS Type,
NULL AS Class,
'ERROR' AS Defcon,
(SELECT ("Building_ResourcePerEra.ResourceType "|| Building_ResourcePerEra.ResourceType || " NOT IN Resources.Type!")) AS Info
FROM Building_ResourcePerEra
WHERE Building_ResourcePerEra.ResourceType NOT IN (SELECT Type FROM Resources)
--
UNION ALL
SELECT 
Building_ResourceQuantity.BuildingType AS Type,
NULL AS Class,
'ERROR' AS Defcon,
(SELECT ("Building_ResourceQuantity.BuildingType "|| Building_ResourceQuantity.BuildingType || " NOT IN Buildings.Type!")) AS Info
FROM Building_ResourceQuantity
WHERE Building_ResourceQuantity.BuildingType NOT IN (SELECT Type FROM Buildings)
--
UNION ALL
SELECT 
Building_ResourceQuantity.BuildingType AS Type,
NULL AS Class,
'ERROR' AS Defcon,
(SELECT ("Building_ResourceQuantity.ResourceType "|| Building_ResourceQuantity.ResourceType || " NOT IN Resources.Type!")) AS Info
FROM Building_ResourceQuantity
WHERE Building_ResourceQuantity.ResourceType NOT IN (SELECT Type FROM Resources)
--
UNION ALL
SELECT 
Building_ResourceQuantityRequirements.BuildingType AS Type,
NULL AS Class,
'ERROR' AS Defcon,
(SELECT ("Building_ResourceQuantityRequirements.BuildingType "|| Building_ResourceQuantityRequirements.BuildingType || " NOT IN Buildings.Type!")) AS Info
FROM Building_ResourceQuantityRequirements
WHERE Building_ResourceQuantityRequirements.BuildingType NOT IN (SELECT Type FROM Buildings)
--
UNION ALL
SELECT 
Building_ResourceQuantityRequirements.BuildingType AS Type,
NULL AS Class,
'ERROR' AS Defcon,
(SELECT ("Building_ResourceQuantityRequirements.ResourceType "|| Building_ResourceQuantityRequirements.ResourceType || " NOT IN Resources.Type!")) AS Info
FROM Building_ResourceQuantityRequirements
WHERE Building_ResourceQuantityRequirements.ResourceType NOT IN (SELECT Type FROM Resources)
--
UNION ALL
SELECT 
Building_ResourceYieldChanges.BuildingType AS Type,
NULL AS Class,
'ERROR' AS Defcon,
(SELECT ("Building_ResourceYieldChanges.BuildingType "|| Building_ResourceYieldChanges.BuildingType || " NOT IN Buildings.Type!")) AS Info
FROM Building_ResourceYieldChanges
WHERE Building_ResourceYieldChanges.BuildingType NOT IN (SELECT Type FROM Buildings)
--
UNION ALL
SELECT 
Building_ResourceYieldChanges.BuildingType AS Type,
NULL AS Class,
'ERROR' AS Defcon,
(SELECT ("Building_ResourceYieldChanges.ResourceType "|| Building_ResourceYieldChanges.ResourceType || " NOT IN Resources.Type!")) AS Info
FROM Building_ResourceYieldChanges
WHERE Building_ResourceYieldChanges.ResourceType NOT IN (SELECT Type FROM Resources)
--
UNION ALL
SELECT 
Building_ResourceYieldChanges.BuildingType AS Type,
NULL AS Class,
'ERROR' AS Defcon,
(SELECT ("Building_ResourceYieldChanges.YieldType "|| Building_ResourceYieldChanges.YieldType || " NOT IN Yields.Type!")) AS Info
FROM Building_ResourceYieldChanges
WHERE Building_ResourceYieldChanges.YieldType NOT IN (SELECT Type FROM Yields)
--
UNION ALL
SELECT 
Building_ResourceYieldModifiers.BuildingType AS Type,
NULL AS Class,
'ERROR' AS Defcon,
(SELECT ("Building_ResourceYieldModifiers.BuildingType "|| Building_ResourceYieldModifiers.BuildingType || " NOT IN Buildings.Type!")) AS Info
FROM Building_ResourceYieldModifiers
WHERE Building_ResourceYieldModifiers.BuildingType NOT IN (SELECT Type FROM Buildings)
--
UNION ALL
SELECT 
Building_ResourceYieldModifiers.BuildingType AS Type,
NULL AS Class,
'ERROR' AS Defcon,
(SELECT ("Building_ResourceYieldModifiers.ResourceType "|| Building_ResourceYieldModifiers.ResourceType || " NOT IN Resources.Type!")) AS Info
FROM Building_ResourceYieldModifiers
WHERE Building_ResourceYieldModifiers.ResourceType NOT IN (SELECT Type FROM Resources)
--
UNION ALL
SELECT 
Building_ResourceYieldModifiers.BuildingType AS Type,
NULL AS Class,
'ERROR' AS Defcon,
(SELECT ("Building_ResourceYieldModifiers.YieldType "|| Building_ResourceYieldModifiers.YieldType || " NOT IN Yields.Type!")) AS Info
FROM Building_ResourceYieldModifiers
WHERE Building_ResourceYieldModifiers.YieldType NOT IN (SELECT Type FROM Yields)
--
UNION ALL
SELECT 
Building_RiverPlotYieldChanges.BuildingType AS Type,
NULL AS Class,
'ERROR' AS Defcon,
(SELECT ("Building_RiverPlotYieldChanges.BuildingType "|| Building_RiverPlotYieldChanges.BuildingType || " NOT IN Buildings.Type!")) AS Info
FROM Building_RiverPlotYieldChanges
WHERE Building_RiverPlotYieldChanges.BuildingType NOT IN (SELECT Type FROM Buildings)
--
UNION ALL
SELECT 
Building_RiverPlotYieldChanges.BuildingType AS Type,
NULL AS Class,
'ERROR' AS Defcon,
(SELECT ("Building_RiverPlotYieldChanges.YieldType "|| Building_RiverPlotYieldChanges.YieldType || " NOT IN Yields.Type!")) AS Info
FROM Building_RiverPlotYieldChanges
WHERE Building_RiverPlotYieldChanges.YieldType NOT IN (SELECT Type FROM Yields)
--
UNION ALL
SELECT 
Building_SeaPlotYieldChanges.BuildingType AS Type,
NULL AS Class,
'ERROR' AS Defcon,
(SELECT ("Building_SeaPlotYieldChanges.BuildingType "|| Building_SeaPlotYieldChanges.BuildingType || " NOT IN Buildings.Type!")) AS Info
FROM Building_SeaPlotYieldChanges
WHERE Building_SeaPlotYieldChanges.BuildingType NOT IN (SELECT Type FROM Buildings)
--
UNION ALL
SELECT 
Building_SeaPlotYieldChanges.BuildingType AS Type,
NULL AS Class,
'ERROR' AS Defcon,
(SELECT ("Building_SeaPlotYieldChanges.YieldType "|| Building_SeaPlotYieldChanges.YieldType || " NOT IN Yields.Type!")) AS Info
FROM Building_SeaPlotYieldChanges
WHERE Building_SeaPlotYieldChanges.YieldType NOT IN (SELECT Type FROM Yields)
--
UNION ALL
SELECT 
Building_SeaResourceYieldChanges.BuildingType AS Type,
NULL AS Class,
'ERROR' AS Defcon,
(SELECT ("Building_SeaResourceYieldChanges.BuildingType "|| Building_SeaResourceYieldChanges.BuildingType || " NOT IN Buildings.Type!")) AS Info
FROM Building_SeaResourceYieldChanges
WHERE Building_SeaResourceYieldChanges.BuildingType NOT IN (SELECT Type FROM Buildings)
--
UNION ALL
SELECT 
Building_SeaResourceYieldChanges.BuildingType AS Type,
NULL AS Class,
'ERROR' AS Defcon,
(SELECT ("Building_SeaResourceYieldChanges.YieldType "|| Building_SeaResourceYieldChanges.YieldType || " NOT IN Yields.Type!")) AS Info
FROM Building_SeaResourceYieldChanges
WHERE Building_SeaResourceYieldChanges.YieldType NOT IN (SELECT Type FROM Yields)
--
UNION ALL
SELECT 
Building_SpecialistYieldChanges.BuildingType AS Type,
NULL AS Class,
'ERROR' AS Defcon,
(SELECT ("Building_SpecialistYieldChanges.BuildingType "|| Building_SpecialistYieldChanges.BuildingType || " NOT IN Buildings.Type!")) AS Info
FROM Building_SpecialistYieldChanges
WHERE Building_SpecialistYieldChanges.BuildingType NOT IN (SELECT Type FROM Buildings)
--
UNION ALL
SELECT 
Building_SpecialistYieldChanges.BuildingType AS Type,
NULL AS Class,
'ERROR' AS Defcon,
(SELECT ("Building_SpecialistYieldChanges.SpecialistType "|| Building_SpecialistYieldChanges.SpecialistType || " NOT IN Specialists.Type!")) AS Info
FROM Building_SpecialistYieldChanges
WHERE Building_SpecialistYieldChanges.SpecialistType NOT IN (SELECT Type FROM Specialists)
--
UNION ALL
SELECT 
Building_SpecialistYieldChanges.BuildingType AS Type,
NULL AS Class,
'ERROR' AS Defcon,
(SELECT ("Building_SpecialistYieldChanges.YieldType "|| Building_SpecialistYieldChanges.YieldType || " NOT IN Yields.Type!")) AS Info
FROM Building_SpecialistYieldChanges
WHERE Building_SpecialistYieldChanges.YieldType NOT IN (SELECT Type FROM Yields)
--
UNION ALL
SELECT 
Building_TerrainYieldChanges.BuildingType AS Type,
NULL AS Class,
'ERROR' AS Defcon,
(SELECT ("Building_TerrainYieldChanges.BuildingType "|| Building_TerrainYieldChanges.BuildingType || " NOT IN Buildings.Type!")) AS Info
FROM Building_TerrainYieldChanges
WHERE Building_TerrainYieldChanges.BuildingType NOT IN (SELECT Type FROM Buildings)
--
UNION ALL
SELECT 
Building_TerrainYieldChanges.BuildingType AS Type,
NULL AS Class,
'ERROR' AS Defcon,
(SELECT ("Building_TerrainYieldChanges.TerrainType "|| Building_TerrainYieldChanges.TerrainType || " NOT IN Terrains.Type!")) AS Info
FROM Building_TerrainYieldChanges
WHERE Building_TerrainYieldChanges.TerrainType NOT IN (SELECT Type FROM Terrains)
--
UNION ALL
SELECT 
Building_TerrainYieldChanges.BuildingType AS Type,
NULL AS Class,
'ERROR' AS Defcon,
(SELECT ("Building_TerrainYieldChanges.YieldType "|| Building_TerrainYieldChanges.YieldType || " NOT IN Yields.Type!")) AS Info
FROM Building_TerrainYieldChanges
WHERE Building_TerrainYieldChanges.YieldType NOT IN (SELECT Type FROM Yields)
--
UNION ALL
SELECT 
Building_ThemingBonuses.BuildingType AS Type,
NULL AS Class,
'ERROR' AS Defcon,
(SELECT ("Building_ThemingBonuses.BuildingType "|| Building_ThemingBonuses.BuildingType || " NOT IN Buildings.Type!")) AS Info
FROM Building_ThemingBonuses
WHERE Building_ThemingBonuses.BuildingType NOT IN (SELECT Type FROM Buildings)
--
UNION ALL
SELECT 
Building_UnitCombatFreeExperiences.BuildingType AS Type,
NULL AS Class,
'ERROR' AS Defcon,
(SELECT ("Building_UnitCombatFreeExperiences.BuildingType "|| Building_UnitCombatFreeExperiences.BuildingType || " NOT IN Buildings.Type!")) AS Info
FROM Building_UnitCombatFreeExperiences
WHERE Building_UnitCombatFreeExperiences.BuildingType NOT IN (SELECT Type FROM Buildings)
--
UNION ALL
SELECT 
Building_UnitCombatFreeExperiences.BuildingType AS Type,
NULL AS Class,
'ERROR' AS Defcon,
(SELECT ("Building_UnitCombatFreeExperiences.UnitCombatType "|| Building_UnitCombatFreeExperiences.UnitCombatType || " NOT IN UnitCombatInfos.Type!")) AS Info
FROM Building_UnitCombatFreeExperiences
WHERE Building_UnitCombatFreeExperiences.UnitCombatType NOT IN (SELECT Type FROM UnitCombatInfos)
--
UNION ALL
SELECT 
Building_UnitCombatProductionModifiers.BuildingType AS Type,
NULL AS Class,
'ERROR' AS Defcon,
(SELECT ("Building_UnitCombatProductionModifiers.BuildingType "|| Building_UnitCombatProductionModifiers.BuildingType || " NOT IN Buildings.Type!")) AS Info
FROM Building_UnitCombatProductionModifiers
WHERE Building_UnitCombatProductionModifiers.BuildingType NOT IN (SELECT Type FROM Buildings)
--
UNION ALL
SELECT 
Building_UnitCombatProductionModifiers.BuildingType AS Type,
NULL AS Class,
'ERROR' AS Defcon,
(SELECT ("Building_UnitCombatProductionModifiers.UnitCombatType "|| Building_UnitCombatProductionModifiers.UnitCombatType || " NOT IN UnitCombatInfos.Type!")) AS Info
FROM Building_UnitCombatProductionModifiers
WHERE Building_UnitCombatProductionModifiers.UnitCombatType NOT IN (SELECT Type FROM UnitCombatInfos)
--
UNION ALL
SELECT 
Building_YieldChanges.BuildingType AS Type,
NULL AS Class,
'ERROR' AS Defcon,
(SELECT ("Building_YieldChanges.BuildingType "|| Building_YieldChanges.BuildingType || " NOT IN Buildings.Type!")) AS Info
FROM Building_YieldChanges
WHERE Building_YieldChanges.BuildingType NOT IN (SELECT Type FROM Buildings)
--
UNION ALL
SELECT 
Building_YieldChanges.BuildingType AS Type,
NULL AS Class,
'ERROR' AS Defcon,
(SELECT ("Building_YieldChanges.YieldType "|| Building_YieldChanges.YieldType || " NOT IN Yields.Type!")) AS Info
FROM Building_YieldChanges
WHERE Building_YieldChanges.YieldType NOT IN (SELECT Type FROM Yields)
--
UNION ALL
SELECT 
Building_YieldChangesPerPop.BuildingType AS Type,
NULL AS Class,
'ERROR' AS Defcon,
(SELECT ("Building_YieldChangesPerPop.BuildingType "|| Building_YieldChangesPerPop.BuildingType || " NOT IN Buildings.Type!")) AS Info
FROM Building_YieldChangesPerPop
WHERE Building_YieldChangesPerPop.BuildingType NOT IN (SELECT Type FROM Buildings)
--
UNION ALL
SELECT 
Building_YieldChangesPerPop.BuildingType AS Type,
NULL AS Class,
'ERROR' AS Defcon,
(SELECT ("Building_YieldChangesPerPop.YieldType "|| Building_YieldChangesPerPop.YieldType || " NOT IN Yields.Type!")) AS Info
FROM Building_YieldChangesPerPop
WHERE Building_YieldChangesPerPop.YieldType NOT IN (SELECT Type FROM Yields)
--
UNION ALL
SELECT 
Building_YieldChangesPerReligion.BuildingType AS Type,
NULL AS Class,
'ERROR' AS Defcon,
(SELECT ("Building_YieldChangesPerReligion.BuildingType "|| Building_YieldChangesPerReligion.BuildingType || " NOT IN Buildings.Type!")) AS Info
FROM Building_YieldChangesPerReligion
WHERE Building_YieldChangesPerReligion.BuildingType NOT IN (SELECT Type FROM Buildings)
--
UNION ALL
SELECT 
Building_YieldChangesPerReligion.BuildingType AS Type,
NULL AS Class,
'ERROR' AS Defcon,
(SELECT ("Building_YieldChangesPerReligion.YieldType "|| Building_YieldChangesPerReligion.YieldType || " NOT IN Yields.Type!")) AS Info
FROM Building_YieldChangesPerReligion
WHERE Building_YieldChangesPerReligion.YieldType NOT IN (SELECT Type FROM Yields)
--
UNION ALL
SELECT 
Building_YieldFromCityStates.BuildingType AS Type,
NULL AS Class,
'ERROR' AS Defcon,
(SELECT ("Building_YieldFromCityStates.BuildingType "|| Building_YieldFromCityStates.BuildingType || " NOT IN Buildings.Type!")) AS Info
FROM Building_YieldFromCityStates
WHERE Building_YieldFromCityStates.BuildingType NOT IN (SELECT Type FROM Buildings)
--
UNION ALL
SELECT 
Building_YieldFromCityStates.BuildingType AS Type,
NULL AS Class,
'ERROR' AS Defcon,
(SELECT ("Building_YieldFromCityStates.YieldType "|| Building_YieldFromCityStates.YieldType || " NOT IN Yields.Type!")) AS Info
FROM Building_YieldFromCityStates
WHERE Building_YieldFromCityStates.YieldType NOT IN (SELECT Type FROM Yields)
--
UNION ALL
SELECT 
Building_YieldFromDeath.BuildingType AS Type,
NULL AS Class,
'ERROR' AS Defcon,
(SELECT ("Building_YieldFromDeath.BuildingType "|| Building_YieldFromDeath.BuildingType || " NOT IN Buildings.Type!")) AS Info
FROM Building_YieldFromDeath
WHERE Building_YieldFromDeath.BuildingType NOT IN (SELECT Type FROM Buildings)
--
UNION ALL
SELECT 
Building_YieldFromDeath.BuildingType AS Type,
NULL AS Class,
'ERROR' AS Defcon,
(SELECT ("Building_YieldFromDeath.YieldType "|| Building_YieldFromDeath.YieldType || " NOT IN Yields.Type!")) AS Info
FROM Building_YieldFromDeath
WHERE Building_YieldFromDeath.YieldType NOT IN (SELECT Type FROM Yields)
--
UNION ALL
SELECT 
Building_YieldFromVictory.BuildingType AS Type,
NULL AS Class,
'ERROR' AS Defcon,
(SELECT ("Building_YieldFromVictory.BuildingType "|| Building_YieldFromVictory.BuildingType || " NOT IN Buildings.Type!")) AS Info
FROM Building_YieldFromVictory
WHERE Building_YieldFromVictory.BuildingType NOT IN (SELECT Type FROM Buildings)
--
UNION ALL
SELECT 
Building_YieldFromVictory.BuildingType AS Type,
NULL AS Class,
'ERROR' AS Defcon,
(SELECT ("Building_YieldFromVictory.YieldType "|| Building_YieldFromVictory.YieldType || " NOT IN Yields.Type!")) AS Info
FROM Building_YieldFromVictory
WHERE Building_YieldFromVictory.YieldType NOT IN (SELECT Type FROM Yields)
--
UNION ALL
SELECT 
Building_YieldModifiers.BuildingType AS Type,
NULL AS Class,
'ERROR' AS Defcon,
(SELECT ("Building_YieldModifiers.BuildingType "|| Building_YieldModifiers.BuildingType || " NOT IN Buildings.Type!")) AS Info
FROM Building_YieldModifiers
WHERE Building_YieldModifiers.BuildingType NOT IN (SELECT Type FROM Buildings)
--
UNION ALL
SELECT 
Building_YieldModifiers.BuildingType AS Type,
NULL AS Class,
'ERROR' AS Defcon,
(SELECT ("Building_YieldModifiers.YieldType "|| Building_YieldModifiers.YieldType || " NOT IN Yields.Type!")) AS Info
FROM Building_YieldModifiers
WHERE Building_YieldModifiers.YieldType NOT IN (SELECT Type FROM Yields)
--
ORDER BY Defcon;