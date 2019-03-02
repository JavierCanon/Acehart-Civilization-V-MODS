-- CanMoveAfterAttacking, is making infinite turn bug...

INSERT INTO UnitPromotions(
	 Type
	 ,CannotBeChosen 
	--,CanMoveAfterAttacking 
	,CanMoveImpassable
	,FlankAttackModifier
	,RangeAttackIgnoreLOS
	--,CityAttack
	,CityDefense
	,OpenRangedAttackMod
	--,RangedSupportFire
)
SELECT
	 'PROMOTION_HELICOPTER' --Type
	 ,1 --CannotBeChosen 
	--,1 --CanMoveAfterAttacking
	,1 --CanMoveImpassable
	,50 --FlankAttackModifier
	,1 --RangeAttackIgnoreLOS
	--,50 --CityAttack
	,50 --CityDefense
	,25 --OpenRangedAttackMod
	--,25 --RangedSupportFire
;

INSERT INTO UnitPromotions(
	  Type
	 ,CannotBeChosen 
	 ,EnemyHealChange
     ,NeutralHealChange
)
SELECT
	 'PROMOTION_LOST_HEAL_NOTERRI' --Type
	 ,1 --CannotBeChosen 
	 ,-10 --EnemyHealChange
     ,-10 --NeutralHealChange
;

INSERT INTO UnitPromotions_UnitCombatMods(
  PromotionType
 ,UnitCombatType
 ,Modifier
)
SELECT
  'PROMOTION_HELICOPTER' --PromotionType
 ,'UNITCOMBAT_ARCHER' --UnitCombatType
 ,25 --Modifier
UNION
SELECT
  'PROMOTION_HELICOPTER' --PromotionType
 ,'UNITCOMBAT_GUN' --UnitCombatType
 ,25 --Modifier
UNION
SELECT
  'PROMOTION_HELICOPTER' --PromotionType
 ,'UNITCOMBAT_MELEE' --UnitCombatType
 ,25 --Modifier
UNION
SELECT
  'PROMOTION_HELICOPTER' --PromotionType
 ,'UNITCOMBAT_RECON' --UnitCombatType
 ,25 --Modifier
;


INSERT INTO Unit_FreePromotions ( 
    UnitType      ,--TEXT,
    PromotionType  --TEXT,
) 
SELECT 
 'UNIT_HELICOPTER_GUNSHIP'
,'PROMOTION_HELICOPTER'
 UNION
SELECT 
 'UNIT_ASWHELI'
,'PROMOTION_HELICOPTER'
 UNION
 SELECT 
 'UNIT_HELIMEDIC'
,'PROMOTION_HELICOPTER'
 UNION
 SELECT 
 'UNIT_HELIMEDIC_II'
,'PROMOTION_HELICOPTER'
 UNION
 SELECT 
 'UNIT_ATTACKHELI'
,'PROMOTION_HELICOPTER'
  UNION
 SELECT 
 'UNIT_ATTACKHELI_II'
,'PROMOTION_HELICOPTER'
 UNION
 SELECT 
 'UNIT_HELISQUAD'
,'PROMOTION_HELICOPTER'
 UNION
 SELECT 
 'UNIT_HELISQUAD_II'
,'PROMOTION_HELICOPTER'
 UNION
 SELECT 
 'UNIT_HELITRANSPORT'
,'PROMOTION_HELICOPTER'
;

INSERT INTO Unit_FreePromotions ( 
    UnitType      ,--TEXT,
    PromotionType  --TEXT,
) 
SELECT 
 'UNIT_HELICOPTER_GUNSHIP'
,'PROMOTION_LOST_HEAL_NOTERRI'
 UNION
SELECT 
 'UNIT_ASWHELI'
,'PROMOTION_LOST_HEAL_NOTERRI'
 UNION
 SELECT 
 'UNIT_HELIMEDIC'
,'PROMOTION_LOST_HEAL_NOTERRI'
 UNION
 SELECT 
 'UNIT_HELIMEDIC_II'
,'PROMOTION_LOST_HEAL_NOTERRI'
 UNION
 SELECT 
 'UNIT_ATTACKHELI'
,'PROMOTION_LOST_HEAL_NOTERRI'
  UNION
 SELECT 
 'UNIT_ATTACKHELI_II'
,'PROMOTION_LOST_HEAL_NOTERRI'
 UNION
 SELECT 
 'UNIT_HELISQUAD'
,'PROMOTION_LOST_HEAL_NOTERRI'
 UNION
 SELECT 
 'UNIT_HELISQUAD_II'
,'PROMOTION_LOST_HEAL_NOTERRI'
 UNION
 SELECT 
 'UNIT_HELITRANSPORT'
,'PROMOTION_LOST_HEAL_NOTERRI'
;


-- TRY TO STACK UNITS
UPDATE Defines SET
Value= 2
WHERE 
Name = 'PLOT_UNIT_LIMIT'
;

/*
UPDATE Units SET
Special = 'SPECIALUNIT_PEOPLE'
WHERE
Type = 'UNIT_HELICOPTER_GUNSHIP'
OR
Type = 'UNIT_ASWHELI'
OR
Type =  'UNIT_HELIMEDIC'
OR
Type =  'UNIT_HELIMEDIC_II'
OR
Type =  'UNIT_ATTACKHELI'
OR
Type =  'UNIT_ATTACKHELI_II'
OR
Type =  'UNIT_HELISQUAD'
OR
Type =  'UNIT_HELISQUAD_II'
OR
Type =  'UNIT_HELITRANSPORT'
;

INSERT INTO Unit_FreePromotions ( 
    UnitType      ,--TEXT,
    PromotionType  --TEXT,
) 
SELECT 
 'UNIT_HELICOPTER_GUNSHIP'
,'PROMOTION_GREAT_GENERAL'
 UNION
SELECT 
 'UNIT_ASWHELI'
,'PROMOTION_GREAT_GENERAL'
 UNION
 SELECT 
 'UNIT_HELIMEDIC'
,'PROMOTION_GREAT_GENERAL'
 UNION
 SELECT 
 'UNIT_HELIMEDIC_II'
,'PROMOTION_GREAT_GENERAL'
 UNION
 SELECT 
 'UNIT_ATTACKHELI'
,'PROMOTION_GREAT_GENERAL'
  UNION
 SELECT 
 'UNIT_ATTACKHELI_II'
,'PROMOTION_GREAT_GENERAL'
 UNION
 SELECT 
 'UNIT_HELISQUAD'
,'PROMOTION_GREAT_GENERAL'
 UNION
 SELECT 
 'UNIT_HELISQUAD_II'
,'PROMOTION_GREAT_GENERAL'
 UNION
 SELECT 
 'UNIT_HELITRANSPORT'
,'PROMOTION_GREAT_GENERAL'
;

INSERT INTO Unit_FreePromotions ( 
    UnitType      ,--TEXT,
    PromotionType  --TEXT,
) 
SELECT 
 'UNIT_HELICOPTER_GUNSHIP'
,'PROMOTION_GENERAL_STACKING'
 UNION
SELECT 
 'UNIT_ASWHELI'
,'PROMOTION_GENERAL_STACKING'
 UNION
 SELECT 
 'UNIT_HELIMEDIC'
,'PROMOTION_GENERAL_STACKING'
 UNION
 SELECT 
 'UNIT_HELIMEDIC_II'
,'PROMOTION_GENERAL_STACKING'
 UNION
 SELECT 
 'UNIT_ATTACKHELI'
,'PROMOTION_GENERAL_STACKING'
  UNION
 SELECT 
 'UNIT_ATTACKHELI_II'
,'PROMOTION_GENERAL_STACKING'
 UNION
 SELECT 
 'UNIT_HELISQUAD'
,'PROMOTION_GENERAL_STACKING'
 UNION
 SELECT 
 'UNIT_HELISQUAD_II'
,'PROMOTION_GENERAL_STACKING'
 UNION
 SELECT 
 'UNIT_HELITRANSPORT'
,'PROMOTION_GENERAL_STACKING'
;
*/

-- REMAKE STANDARD UNIT_HELICOPTER_GUNSHIP
UPDATE Units SET
    Combat = 50, --INTEGER DEFAULT 0,
    RangedCombat = 60, --INTEGER DEFAULT 0,
    Moves = 6, --INTEGER DEFAULT 0,
    Range = 2, --INTEGER DEFAULT 0,
    BaseSightRange = 6 --INTEGER DEFAULT 2,
WHERE
Type = 'UNIT_HELICOPTER_GUNSHIP'
;


-- SET ANTI-AIR POWERFULL VS HELI
-- PROMOTION_ANTI_HELICOPTER
INSERT INTO UnitPromotions_UnitClasses(PromotionType, UnitClassType, Attack)
SELECT
 'PROMOTION_ANTI_HELICOPTER'
,'UNITCLASS_ASWHELI'
,100
UNION
SELECT
 'PROMOTION_ANTI_HELICOPTER'
,'UNITCLASS_ATTACKHELI'
,100
UNION
SELECT
 'PROMOTION_ANTI_HELICOPTER'
,'UNITCLASS_ATTACKHELI_II'
,100
UNION
SELECT
 'PROMOTION_ANTI_HELICOPTER'
,'UNITCLASS_HELIMEDIC'
,100
UNION
SELECT
 'PROMOTION_ANTI_HELICOPTER'
,'UNITCLASS_HELIMEDIC_II'
,100
UNION
SELECT
 'PROMOTION_ANTI_HELICOPTER'
,'UNITCLASS_HELISQUAD'
,100
UNION
SELECT
 'PROMOTION_ANTI_HELICOPTER'
,'UNITCLASS_HELISQUAD_II'
,100
UNION
SELECT
 'PROMOTION_ANTI_HELICOPTER'
,'UNITCLASS_HELITRANSPORT'
,100
UNION
SELECT
 'PROMOTION_ANTI_HELICOPTER'
,'UNITCLASS_HELITRANSPORT'
,100
;

INSERT INTO Unit_FreePromotions (UnitType, PromotionType)
SELECT
'UNIT_ANTI_AIRCRAFT_GUN', 'PROMOTION_ANTI_HELICOPTER'
UNION
SELECT
'UNIT_MOBILE_SAM', 'PROMOTION_ANTI_HELICOPTER'
;



-- FIXES...
-- CAN VIRTUALLY FLY OVER ALL TERRAIN
-- CAN FLY OVER COAST WATER
UPDATE Units SET
Domain = 'DOMAIN_LAND'
WHERE
Type = 'UNIT_HELICOPTER_GUNSHIP'
--OR
--Type = 'UNIT_ASWHELI' -- now is SEA unit
;

-- NO EMBARK IN COAST
-- FIX UNITCOMBATS
DELETE FROM UnitPromotions_UnitCombats
WHERE
UnitCombatType = 'UNITCOMBAT_HELICOPTER'
AND
(
PromotionType = 'PROMOTION_EMBARKATION'
OR
PromotionType = 'PROMOTION_DEFENSIVE_EMBARKATION'
OR
PromotionType = 'PROMOTION_ALLWATER_EMBARKATION'
OR
PromotionType = 'PROMOTION_HIMEJI_CASTLE'
OR
PromotionType = 'PROMOTION_NATIONALISM'
OR
PromotionType = 'PROMOTION_STATUE_ZEUS'
OR
PromotionType = 'PROMOTION_HOMELAND_GUARDIAN_BOOGALOO'
)
;
