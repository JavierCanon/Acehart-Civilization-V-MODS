-- http://forums.civfanatics.com/showthread.php?t=461429


-- Description: Same as infantry but with more mobility

-- *** ART ***

INSERT INTO ArtDefine_UnitInfos ( 
    Type               ,--TEXT NOT NULL PRIMARY KEY,
    DamageStates       ,--INT,
    Formation          ,--TEXT,
    UnitFlagAtlas      ,--TEXT,
    UnitFlagIconOffset ,--INT,
    IconAtlas          ,--TEXT,
    PortraitIndex      --INT 
) 
SELECT  'ART_DEF_UNIT_HELISQUAD', --Type
        DamageStates, --DamageStates
        'UnFormed', --Formation
		UnitFlagAtlas      ,--TEXT,
		UnitFlagIconOffset ,--INT,
		IconAtlas          ,--TEXT,
		PortraitIndex      --INT 
  FROM ArtDefine_UnitInfos
 WHERE ( Type = 'ART_DEF_UNIT_MARINE' )
 ;

INSERT INTO ArtDefine_UnitMemberInfos ( 
    Type                         ,--TEXT  NOT NULL PRIMARY KEY,
    Scale                        ,--FLOAT,
    ZOffset                      ,--FLOAT,
    Domain                       ,--TEXT,
    Model                        ,--TEXT  NOT NULL,
    MaterialTypeTag              ,--TEXT,
    MaterialTypeSoundOverrideTag  --TEXT 
) 
SELECT ( 'ART_DEF_UNIT_MEMBER_HELISQUAD' ), --Type
       Scale,
       ZOffset,
       Domain,
       'UH1_team.fxsxml', --Model
       MaterialTypeTag,
       MaterialTypeSoundOverrideTag
  FROM ArtDefine_UnitMemberInfos
 WHERE ( Type = 'ART_DEF_UNIT_MEMBER_HELICOPTERGUNSHIP' )
 ;


INSERT INTO ArtDefine_UnitInfoMemberInfos ( 
    UnitInfoType,
    UnitMemberInfoType,
    NumMembers 
) 
SELECT 'ART_DEF_UNIT_HELISQUAD',
       'ART_DEF_UNIT_MEMBER_MARINE',
       6 --NumMembers
UNION
SELECT 'ART_DEF_UNIT_HELISQUAD',
       'ART_DEF_UNIT_MEMBER_HELISQUAD',
       1 --NumMembers
 ;

INSERT INTO ArtDefine_UnitMemberCombats ( 
    UnitMemberType               ,--TEXT    NOT NULL PRIMARY KEY,
    EnableActions                ,--TEXT,
    DisableActions               ,--TEXT,
    MoveRadius                   ,--FLOAT,
    ShortMoveRadius              ,--FLOAT,
    ChargeRadius                 ,--FLOAT,
    AttackRadius                 ,--FLOAT,
    RangedAttackRadius           ,--FLOAT,
    MoveRate                     ,--FLOAT,
    ShortMoveRate                ,--FLOAT,
    TurnRateMin                  ,--FLOAT,
    TurnRateMax                  ,--FLOAT,
    TurnFacingRateMin            ,--FLOAT,
    TurnFacingRateMax            ,--FLOAT,
    RollRateMin                  ,--FLOAT,
    RollRateMax                  ,--FLOAT,
    PitchRateMin                 ,--FLOAT,
    PitchRateMax                 ,--FLOAT,
    LOSRadiusScale               ,--FLOAT,
    TargetRadius                 ,--FLOAT,
    TargetHeight                 ,--FLOAT,
    HasShortRangedAttack         ,--INTEGER,
    HasLongRangedAttack          ,--INTEGER,
    HasLeftRightAttack           ,--INTEGER,
    HasStationaryMelee           ,--INTEGER,
    HasStationaryRangedAttack    ,--INTEGER,
    HasRefaceAfterCombat         ,--INTEGER,
    ReformBeforeCombat           ,--INTEGER,
    HasIndependentWeaponFacing   ,--INTEGER,
    HasOpponentTracking          ,--,--INTEGER,
    HasCollisionAttack           ,--INTEGER,
    AttackAltitude               ,--FLOAT,
    AltitudeDecelerationDistance ,--FLOAT,
    OnlyTurnInMovementActions    ,--INTEGER,
    RushAttackFormation          ,--TEXT,
    LastToDie                     --INTEGER,
) 
SELECT 
    ('ART_DEF_UNIT_MEMBER_HELISQUAD' ), --UnitMemberType, --TEXT    NOT NULL PRIMARY KEY,
    EnableActions                ,--TEXT,
    DisableActions               ,--TEXT,
    MoveRadius                   ,--FLOAT,
    ShortMoveRadius              ,--FLOAT,
    ChargeRadius                 ,--FLOAT,
    AttackRadius                 ,--FLOAT,
    RangedAttackRadius           ,--FLOAT,
    MoveRate                     ,--FLOAT,
    ShortMoveRate                ,--FLOAT,
    TurnRateMin                  ,--FLOAT,
    TurnRateMax                  ,--FLOAT,
    TurnFacingRateMin            ,--FLOAT,
    TurnFacingRateMax            ,--FLOAT,
    RollRateMin                  ,--FLOAT,
    RollRateMax                  ,--FLOAT,
    PitchRateMin                 ,--FLOAT,
    PitchRateMax                 ,--FLOAT,
    LOSRadiusScale               ,--FLOAT,
    TargetRadius                 ,--FLOAT,
    TargetHeight                 ,--FLOAT,
    HasShortRangedAttack         ,--INTEGER,
    HasLongRangedAttack          ,--INTEGER,
    HasLeftRightAttack           ,--INTEGER,
    HasStationaryMelee           ,--INTEGER,
    HasStationaryRangedAttack    ,--INTEGER,
    HasRefaceAfterCombat         ,--INTEGER,
    ReformBeforeCombat           ,--INTEGER,
    HasIndependentWeaponFacing   ,--INTEGER,
    HasOpponentTracking          ,--,--INTEGER,
    HasCollisionAttack           ,--INTEGER,
    AttackAltitude               ,--FLOAT,
    AltitudeDecelerationDistance ,--FLOAT,
    OnlyTurnInMovementActions    ,--INTEGER,
    RushAttackFormation          ,--TEXT,
    LastToDie                     --INTEGER,
  FROM ArtDefine_UnitMemberCombats
 WHERE ( UnitMemberType = 'ART_DEF_UNIT_MEMBER_MARINE' )
 ;

INSERT INTO ArtDefine_UnitMemberCombatWeapons ( 
    UnitMemberType             ,--TEXT    NOT NULL,
    [Index]                    ,--INTEGER NOT NULL,
    SubIndex                   ,--INTEGER NOT NULL,
    ID                         ,--TEXT,
    VisKillStrengthMin         ,--FLOAT,
    VisKillStrengthMax         ,--FLOAT,
    ProjectileSpeed            ,--FLOAT,
    ProjectileTurnRateMin      ,--FLOAT,
    ProjectileTurnRateMax      ,--FLOAT,
    HitEffect                  ,--TEXT,
    HitEffectScale             ,--FLOAT,
    HitRadius                  ,--FLOAT,
    ProjectileChildEffectScale ,--FLOAT,
    AreaDamageDelay            ,--FLOAT,
    ContinuousFire             ,--INTEGER,
    WaitForEffectCompletion    ,--INTEGER,
    TargetGround               ,--INTEGER,
    IsDropped                  ,--INTEGER,
    WeaponTypeTag              ,--TEXT,
    WeaponTypeSoundOverrideTag ,--TEXT,
    MissTargetSlopRadius        --FLOAT,
) 
SELECT 
    ('ART_DEF_UNIT_MEMBER_HELISQUAD'), --UnitMemberType ,--TEXT    NOT NULL,
    [Index]                    ,--INTEGER NOT NULL,
    SubIndex                   ,--INTEGER NOT NULL,
    ID                         ,--TEXT,
    VisKillStrengthMin         ,--FLOAT,
    VisKillStrengthMax         ,--FLOAT,
    ProjectileSpeed            ,--FLOAT,
    ProjectileTurnRateMin      ,--FLOAT,
    ProjectileTurnRateMax      ,--FLOAT,
    HitEffect                  ,--TEXT,
    HitEffectScale             ,--FLOAT,
    HitRadius                  ,--FLOAT,
    ProjectileChildEffectScale ,--FLOAT,
    AreaDamageDelay            ,--FLOAT,
    ContinuousFire             ,--INTEGER,
    WaitForEffectCompletion    ,--INTEGER,
    TargetGround               ,--INTEGER,
    IsDropped                  ,--INTEGER,
    WeaponTypeTag              ,--TEXT,
    WeaponTypeSoundOverrideTag ,--TEXT,
    MissTargetSlopRadius        --FLOAT,
  FROM ArtDefine_UnitMemberCombatWeapons
 WHERE ( UnitMemberType = 'ART_DEF_UNIT_MEMBER_MARINE' )
 ;


-- *** UNIT ***

INSERT INTO UnitClasses ( 
    Type                 ,--TEXT NOT NULL UNIQUE,
    Description          ,--TEXT,
    MaxGlobalInstances   ,--INTEGER DEFAULT '-1',
    MaxTeamInstances     ,--INTEGER DEFAULT '-1',
    MaxPlayerInstances   ,--INTEGER DEFAULT '-1',
    InstanceCostModifier ,--INTEGER DEFAULT 0,
    DefaultUnit           --TEXT 
) 
SELECT ( 'UNITCLASS_HELISQUAD' ), --Type
       Description,
       MaxGlobalInstances,
       MaxTeamInstances,
       MaxPlayerInstances,
       InstanceCostModifier,
       DefaultUnit
  FROM UnitClasses
 WHERE ( Type = 'UNITCLASS_MARINE' )
 ;

INSERT INTO Units ( 
    Type                         ,--TEXT    NOT NULL UNIQUE,
    Description                  ,--TEXT,
    Civilopedia                  ,--TEXT,
    Strategy                     ,--TEXT,
    Help                         ,--TEXT,
    Requirements                 ,--TEXT,
    Combat                       ,--INTEGER DEFAULT 0,
    RangedCombat                 ,--INTEGER DEFAULT 0,
    Cost                         ,--INTEGER DEFAULT 0,
    FaithCost                    ,--INTEGER DEFAULT 0,
    RequiresFaithPurchaseEnabled ,--BOOLEAN DEFAULT 0,
    Moves                        ,--INTEGER DEFAULT 0,
    Immobile                     ,--BOOLEAN DEFAULT 0,
    Range                        ,--INTEGER DEFAULT 0,
    BaseSightRange               ,--INTEGER DEFAULT 2,
    Class                        ,--TEXT    DEFAULT NULL,
    Special                      ,--TEXT    DEFAULT NULL,
    Capture                      ,--TEXT    DEFAULT NULL,
    CombatClass                  ,--TEXT    DEFAULT NULL,
    Domain                       ,--TEXT    DEFAULT NULL,
    CivilianAttackPriority       ,--TEXT    DEFAULT NULL,
    DefaultUnitAI                ,--TEXT    DEFAULT NULL,
    Food                         ,--BOOLEAN DEFAULT 0,
    NoBadGoodies                 ,--BOOLEAN DEFAULT 0,
    RivalTerritory               ,--BOOLEAN DEFAULT 0,
    MilitarySupport              ,--BOOLEAN DEFAULT 0,
    MilitaryProduction           ,--BOOLEAN DEFAULT 0,
    Pillage                      ,--BOOLEAN DEFAULT 0,
    PillagePrereqTech            ,--TEXT    DEFAULT NULL,
    Found                        ,--BOOLEAN DEFAULT 0,
    FoundAbroad                  ,--BOOLEAN DEFAULT 0,
    CultureBombRadius            ,--INTEGER DEFAULT 0,
    GoldenAgeTurns               ,--INTEGER DEFAULT 0,
    IgnoreBuildingDefense        ,--BOOLEAN DEFAULT 0,
    PrereqResources              ,--BOOLEAN DEFAULT 0,
    Mechanized                   ,--BOOLEAN DEFAULT 0,
    Suicide                      ,--BOOLEAN DEFAULT 0,
    CaptureWhileEmbarked         ,--BOOLEAN DEFAULT 0,
    PrereqTech                   ,--TEXT    DEFAULT NULL,
    ObsoleteTech                 ,--TEXT    DEFAULT NULL,
    GoodyHutUpgradeUnitClass     ,--TEXT    DEFAULT NULL,
    HurryCostModifier            ,--INTEGER DEFAULT 0,
    AdvancedStartCost            ,--INTEGER DEFAULT 0,
    MinAreaSize                  ,--INTEGER DEFAULT '-1',
    AirInterceptRange            ,--INTEGER DEFAULT 0,
    AirUnitCap                   ,--INTEGER DEFAULT 0,
    NukeDamageLevel              ,--INTEGER DEFAULT '-1',
    WorkRate                     ,--INTEGER DEFAULT 0,
    NumFreeTechs                 ,--INTEGER DEFAULT 0,
    BaseBeakersTurnsToCount      ,--INTEGER DEFAULT 0,
    RushBuilding                 ,--BOOLEAN DEFAULT 0,
    BaseHurry                    ,--INTEGER DEFAULT 0,
    HurryMultiplier              ,--INTEGER DEFAULT 0,
    BaseGold                     ,--INTEGER DEFAULT 0,
    NumGoldPerEra                ,--INTEGER DEFAULT 0,
    SpreadReligion               ,--BOOLEAN DEFAULT 0,
    RemoveHeresy                 ,--BOOLEAN DEFAULT 0,
    ReligionSpreads              ,--INTEGER DEFAULT 0,
    ReligiousStrength            ,--INTEGER DEFAULT 0,
    FoundReligion                ,--BOOLEAN DEFAULT 0,
    RequiresEnhancedReligion     ,--BOOLEAN DEFAULT 0,
    ProhibitsSpread              ,--BOOLEAN DEFAULT 0,
    CombatLimit                  ,--INTEGER DEFAULT 100,
    RangeAttackOnlyInDomain      ,--BOOLEAN DEFAULT 0,
    RangeAttackIgnoreLOS         ,--BOOLEAN DEFAULT 0,
    RangedCombatLimit            ,--INTEGER DEFAULT 0,
    XPValueAttack                ,--INTEGER DEFAULT 0,
    XPValueDefense               ,--INTEGER DEFAULT 0,
    SpecialCargo                 ,--TEXT    DEFAULT NULL,
    DomainCargo                  ,--TEXT    DEFAULT NULL,
    Conscription                 ,--INTEGER DEFAULT 0,
    ExtraMaintenanceCost         ,--INTEGER DEFAULT 0,
    NoMaintenance                ,--BOOLEAN DEFAULT 0,
    Unhappiness                  ,--INTEGER DEFAULT 0,
    UnitArtInfo                  ,--TEXT    DEFAULT NULL,
    UnitArtInfoCulturalVariation ,--BOOLEAN DEFAULT 0,
    UnitArtInfoEraVariation      ,--BOOLEAN DEFAULT 0,
    ProjectPrereq                ,--TEXT    DEFAULT NULL,
    SpaceshipProject             ,--TEXT    DEFAULT NULL,
    LeaderPromotion              ,--TEXT    DEFAULT NULL,
    LeaderExperience             ,--INTEGER DEFAULT 0,
    DontShowYields               ,--BOOLEAN DEFAULT 0,
    ShowInPedia                  ,--BOOLEAN DEFAULT 1,
    MoveRate                     ,--TEXT    DEFAULT 'BIPED',
    UnitFlagIconOffset           ,--INTEGER DEFAULT 0,
    PortraitIndex                ,--INTEGER DEFAULT '-1',
    IconAtlas                    ,--TEXT    DEFAULT NULL,
    UnitFlagAtlas                 --TEXT    DEFAULT 'UNIT_FLAG_ATLAS',
) 
SELECT 
    ( 'UNIT_HELISQUAD' ), --Type, --TEXT NOT NULL UNIQUE,
    ( 'TXT_KEY_UNIT_HELISQUAD_DESCRIPTION' ), --Description, --TEXT,
    'TXT_KEY_UNIT_HELISQUAD_CIVILOPEDIA'                  ,--TEXT,
    'TXT_KEY_UNIT_HELISQUAD_STRATEGY'                     ,--TEXT,
    'TXT_KEY_UNIT_HELISQUAD_HELP'                         ,--TEXT,
    Requirements                 ,--TEXT,
    65 , --Combat, --INTEGER DEFAULT 0,
    RangedCombat                 ,--INTEGER DEFAULT 0,
    800, --Cost, --INTEGER DEFAULT 0,
    FaithCost                    ,--INTEGER DEFAULT 0,
    RequiresFaithPurchaseEnabled ,--BOOLEAN DEFAULT 0,
    4, --Moves, --INTEGER DEFAULT 0,
    Immobile                     ,--BOOLEAN DEFAULT 0,
    Range                        ,--INTEGER DEFAULT 0,
    4, --BaseSightRange, --INTEGER DEFAULT 2,
    ( 'UNITCLASS_HELISQUAD' ), --Class, --TEXT DEFAULT NULL,
    Special                      ,--TEXT    DEFAULT NULL,
    Capture                      ,--TEXT    DEFAULT NULL,
    CombatClass                  ,--TEXT    DEFAULT NULL,
    Domain                       ,--TEXT    DEFAULT NULL,
    CivilianAttackPriority       ,--TEXT    DEFAULT NULL,
    DefaultUnitAI                ,--TEXT    DEFAULT NULL,
    Food                         ,--BOOLEAN DEFAULT 0,
    NoBadGoodies                 ,--BOOLEAN DEFAULT 0,
    RivalTerritory               ,--BOOLEAN DEFAULT 0,
    MilitarySupport              ,--BOOLEAN DEFAULT 0,
    MilitaryProduction           ,--BOOLEAN DEFAULT 0,
    Pillage                      ,--BOOLEAN DEFAULT 0,
    PillagePrereqTech            ,--TEXT    DEFAULT NULL,
    Found                        ,--BOOLEAN DEFAULT 0,
    FoundAbroad                  ,--BOOLEAN DEFAULT 0,
    CultureBombRadius            ,--INTEGER DEFAULT 0,
    GoldenAgeTurns               ,--INTEGER DEFAULT 0,
    IgnoreBuildingDefense        ,--BOOLEAN DEFAULT 0,
    PrereqResources              ,--BOOLEAN DEFAULT 0,
    1, --Mechanized, --BOOLEAN DEFAULT 0,
    Suicide                      ,--BOOLEAN DEFAULT 0,
    CaptureWhileEmbarked         ,--BOOLEAN DEFAULT 0,
    PrereqTech                   ,--TEXT    DEFAULT NULL,
    ObsoleteTech                 ,--TEXT    DEFAULT NULL,
    GoodyHutUpgradeUnitClass     ,--TEXT    DEFAULT NULL,
    HurryCostModifier            ,--INTEGER DEFAULT 0,
    AdvancedStartCost            ,--INTEGER DEFAULT 0,
    MinAreaSize                  ,--INTEGER DEFAULT '-1',
    AirInterceptRange            ,--INTEGER DEFAULT 0,
    AirUnitCap                   ,--INTEGER DEFAULT 0,
    NukeDamageLevel              ,--INTEGER DEFAULT '-1',
    WorkRate                     ,--INTEGER DEFAULT 0,
    NumFreeTechs                 ,--INTEGER DEFAULT 0,
    BaseBeakersTurnsToCount      ,--INTEGER DEFAULT 0,
    RushBuilding                 ,--BOOLEAN DEFAULT 0,
    BaseHurry                    ,--INTEGER DEFAULT 0,
    HurryMultiplier              ,--INTEGER DEFAULT 0,
    BaseGold                     ,--INTEGER DEFAULT 0,
    NumGoldPerEra                ,--INTEGER DEFAULT 0,
    SpreadReligion               ,--BOOLEAN DEFAULT 0,
    RemoveHeresy                 ,--BOOLEAN DEFAULT 0,
    ReligionSpreads              ,--INTEGER DEFAULT 0,
    ReligiousStrength            ,--INTEGER DEFAULT 0,
    FoundReligion                ,--BOOLEAN DEFAULT 0,
    RequiresEnhancedReligion     ,--BOOLEAN DEFAULT 0,
    ProhibitsSpread              ,--BOOLEAN DEFAULT 0,
    CombatLimit                  ,--INTEGER DEFAULT 100,
    RangeAttackOnlyInDomain      ,--BOOLEAN DEFAULT 0,
    RangeAttackIgnoreLOS         ,--BOOLEAN DEFAULT 0,
    RangedCombatLimit            ,--INTEGER DEFAULT 0,
    XPValueAttack                ,--INTEGER DEFAULT 0,
    XPValueDefense               ,--INTEGER DEFAULT 0,
    SpecialCargo                 ,--TEXT    DEFAULT NULL,
    DomainCargo                  ,--TEXT    DEFAULT NULL,
    Conscription                 ,--INTEGER DEFAULT 0,
    ExtraMaintenanceCost         ,--INTEGER DEFAULT 0,
    NoMaintenance                ,--BOOLEAN DEFAULT 0,
    Unhappiness                  ,--INTEGER DEFAULT 0,
    ( 'ART_DEF_UNIT_HELISQUAD' ), --UnitArtInfo, --TEXT DEFAULT NULL,
    UnitArtInfoCulturalVariation ,--BOOLEAN DEFAULT 0,
    UnitArtInfoEraVariation      ,--BOOLEAN DEFAULT 0,
    ProjectPrereq                ,--TEXT    DEFAULT NULL,
    SpaceshipProject             ,--TEXT    DEFAULT NULL,
    LeaderPromotion              ,--TEXT    DEFAULT NULL,
    LeaderExperience             ,--INTEGER DEFAULT 0,
    DontShowYields               ,--BOOLEAN DEFAULT 0,
    ShowInPedia                  ,--BOOLEAN DEFAULT 1,
    'WHEELED'	,--MoveRate   --TEXT    DEFAULT 'BIPED',
    UnitFlagIconOffset           ,--INTEGER DEFAULT 0,
    PortraitIndex                ,--INTEGER DEFAULT '-1',
    IconAtlas                    ,--TEXT    DEFAULT NULL,
    UnitFlagAtlas                 --TEXT    DEFAULT 'UNIT_FLAG_ATLAS',
  FROM Units
 WHERE ( Type = 'UNIT_MARINE' );

-- *** UPGRADES ***


INSERT INTO Unit_ClassUpgrades ( 
    UnitType      ,--TEXT,
    UnitClassType  --TEXT,
) 
SELECT ( 'UNIT_HELISQUAD' ),
       UnitClassType
  FROM Unit_ClassUpgrades
 WHERE ( UnitType = 'UNIT_MARINE' );


-- *** AI ***

INSERT INTO Unit_AITypes ( 
    UnitType,
    UnitAIType 
) 
SELECT ( 'UNIT_HELISQUAD' ),
       UnitAIType
  FROM Unit_AITypes
 WHERE ( UnitType = 'UNIT_MARINE' );


INSERT INTO Unit_Flavors ( 
    UnitType   ,--TEXT,
    FlavorType ,--TEXT,
    Flavor     --INTEGER NOT NULL,
) 
SELECT ( 'UNIT_HELISQUAD' ),
       FlavorType,
       Flavor
  FROM Unit_Flavors
 WHERE ( UnitType = 'UNIT_MARINE' );

-- *** PROMOTIONS ***

INSERT INTO Unit_FreePromotions ( 
    UnitType      ,--TEXT,
    PromotionType  --TEXT,
) 
SELECT ( 'UNIT_HELISQUAD' ),
       PromotionType
  FROM Unit_FreePromotions
 WHERE ( UnitType = 'UNIT_MARINE' )
UNION
SELECT
 'UNIT_HELISQUAD'
,'PROMOTION_IGNORE_TERRAIN_COST'
UNION
SELECT
 'UNIT_HELISQUAD'
,'PROMOTION_HOVERING_UNIT'
UNION
SELECT
 'UNIT_HELISQUAD'
,'PROMOTION_MOVEMENT_TO_GENERAL'
;

 -- *** RESOURCES ***
 
INSERT INTO Unit_ResourceQuantityRequirements(
    UnitType     ,--TEXT,
    ResourceType ,--TEXT,
    Cost          --INTEGER DEFAULT 1,
)
SELECT
 'UNIT_HELISQUAD'
,'RESOURCE_OIL'
,1
UNION
SELECT
 'UNIT_HELISQUAD'
,'RESOURCE_ALUMINUM'
,1
;
 
 -- *** TEXTS INFO ***

INSERT INTO Language_en_US(
            Tag --TEXT
           ,Text --TEXT
		   )
SELECT

           'TXT_KEY_UNIT_HELISQUAD_DESCRIPTION' 
           ,'Squad Heli'
UNION
SELECT

           'TXT_KEY_UNIT_HELISQUAD_CIVILOPEDIA' 
           ,'Squad Heli'
UNION
SELECT

           'TXT_KEY_UNIT_HELISQUAD_STRATEGY' 
           ,'Squad Heli'
UNION
SELECT

           'TXT_KEY_UNIT_HELISQUAD_HELP' 
           ,'Squad Heli'   
; 

