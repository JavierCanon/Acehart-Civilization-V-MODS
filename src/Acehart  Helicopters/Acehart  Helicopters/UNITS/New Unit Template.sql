-- UNIT ART
INSERT INTO ArtDefine_UnitInfos (
	Type
	,DamageStates
	,Formation
	)
SELECT ('ART_DEF_UNIT_BIPLAN')
	,DamageStates
	,Formation
FROM ArtDefine_UnitInfos
WHERE (Type = 'ART_DEF_UNIT_FIGHTER');

INSERT INTO ArtDefine_UnitInfoMemberInfos (
	UnitInfoType
	,UnitMemberInfoType
	,NumMembers
	)
SELECT ('ART_DEF_UNIT_BIPLAN')
	,('ART_DEF_UNIT_MEMBER_BIPLAN')
	,NumMembers
FROM ArtDefine_UnitInfoMemberInfos
WHERE (UnitInfoType = 'ART_DEF_UNIT_FIGHTER');

INSERT INTO ArtDefine_UnitMemberCombats (
	UnitMemberType
	,EnableActions
	,DisableActions
	,MoveRadius
	,ShortMoveRadius
	,ChargeRadius
	,AttackRadius
	,RangedAttackRadius
	,MoveRate
	,ShortMoveRate
	,TurnRateMin
	,TurnRateMax
	,TurnFacingRateMin
	,TurnFacingRateMax
	,RollRateMin
	,RollRateMax
	,PitchRateMin
	,PitchRateMax
	,LOSRadiusScale
	,TargetRadius
	,TargetHeight
	,HasShortRangedAttack
	,HasLongRangedAttack
	,HasLeftRightAttack
	,HasStationaryMelee
	,HasStationaryRangedAttack
	,HasRefaceAfterCombat
	,ReformBeforeCombat
	,HasIndependentWeaponFacing
	,HasOpponentTracking
	,HasCollisionAttack
	,AttackAltitude
	,AltitudeDecelerationDistance
	,OnlyTurnInMovementActions
	,RushAttackFormation
	)
SELECT ('ART_DEF_UNIT_MEMBER_BIPLAN')
	,EnableActions
	,DisableActions
	,MoveRadius
	,ShortMoveRadius
	,ChargeRadius
	,AttackRadius
	,RangedAttackRadius
	,MoveRate
	,ShortMoveRate
	,TurnRateMin
	,TurnRateMax
	,TurnFacingRateMin
	,TurnFacingRateMax
	,RollRateMin
	,RollRateMax
	,PitchRateMin
	,PitchRateMax
	,LOSRadiusScale
	,TargetRadius
	,TargetHeight
	,HasShortRangedAttack
	,HasLongRangedAttack
	,HasLeftRightAttack
	,HasStationaryMelee
	,HasStationaryRangedAttack
	,HasRefaceAfterCombat
	,ReformBeforeCombat
	,HasIndependentWeaponFacing
	,HasOpponentTracking
	,HasCollisionAttack
	,AttackAltitude
	,AltitudeDecelerationDistance
	,OnlyTurnInMovementActions
	,RushAttackFormation
FROM ArtDefine_UnitMemberCombats
WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_FIGHTER');

INSERT INTO ArtDefine_UnitMemberCombatWeapons (
	UnitMemberType
	,"Index"
	,SubIndex
	,ID
	,VisKillStrengthMin
	,VisKillStrengthMax
	,ProjectileSpeed
	,ProjectileTurnRateMin
	,ProjectileTurnRateMax
	,HitEffect
	,HitEffectScale
	,HitRadius
	,ProjectileChildEffectScale
	,AreaDamageDelay
	,ContinuousFire
	,WaitForEffectCompletion
	,TargetGround
	,IsDropped
	,WeaponTypeTag
	,WeaponTypeSoundOverrideTag
	)
SELECT ('ART_DEF_UNIT_MEMBER_BIPLAN')
	,"Index"
	,SubIndex
	,ID
	,VisKillStrengthMin
	,VisKillStrengthMax
	,ProjectileSpeed
	,ProjectileTurnRateMin
	,ProjectileTurnRateMax
	,HitEffect
	,HitEffectScale
	,HitRadius
	,ProjectileChildEffectScale
	,AreaDamageDelay
	,ContinuousFire
	,WaitForEffectCompletion
	,TargetGround
	,IsDropped
	,WeaponTypeTag
	,WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons
WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_FIGHTER');

INSERT INTO ArtDefine_UnitMemberInfos (
	Type
	,Scale
	,ZOffset
	,Domain
	,Model
	,MaterialTypeTag
	,MaterialTypeSoundOverrideTag
	)
SELECT ('ART_DEF_UNIT_MEMBER_BIPLAN')
	,Scale
	,ZOffset
	,Domain
	,('EarlyFighter_Generic.fxsxml')
	,MaterialTypeTag
	,MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos
WHERE (Type = 'ART_DEF_UNIT_MEMBER_FIGHTER');

INSERT INTO ArtDefine_StrategicView (
	StrategicViewType
	,TileType
	,Asset
	)
SELECT ('ART_DEF_UNIT_BIPLAN')
	,TileType
	,Asset
FROM ArtDefine_StrategicView
WHERE (StrategicViewType = 'ART_DEF_UNIT_FIGHTER');

-- UNIT AND UNIT CLASS
INSERT INTO UnitClasses (
	Type
	,Description
	,MaxGlobalInstances
	,MaxTeamInstances
	,MaxPlayerInstances
	,InstanceCostModifier
	,DefaultUnit
	)
SELECT ('UNITCLASS_BIPLAN')
	,Description
	,MaxGlobalInstances
	,MaxTeamInstances
	,MaxPlayerInstances
	,InstanceCostModifier
	,('UNIT_BIPLAN')
FROM UnitClasses
WHERE (Type = 'UNITCLASS_FIGHTER');

INSERT INTO Units (
	Type
	,Description
	,Civilopedia
	,Strategy
	,HELP
	,Requirements
	,Combat
	,RangedCombat
	,Cost
	,Moves
	,Immobile
	,Range
	,BaseSightRange
	,Class
	,Special
	,Capture
	,CombatClass
	,Domain
	,CivilianAttackPriority
	,DefaultUnitAI
	,Food
	,NoBadGoodies
	,RivalTerritory
	,MilitarySupport
	,MilitaryProduction
	,Pillage
	,Found
	,FoundAbroad
	,CultureBombRadius
	,GoldenAgeTurns
	,IgnoreBuildingDefense
	,PrereqResources
	,Mechanized
	,Suicide
	,CaptureWhileEmbarked
	,PrereqTech
	,ObsoleteTech
	,GoodyHutUpgradeUnitClass
	,HurryCostModifier
	,AdvancedStartCost
	,MinAreaSize
	,AirUnitCap
	,NukeDamageLevel
	,WorkRate
	,NumFreeTechs
	,RushBuilding
	,BaseHurry
	,HurryMultiplier
	,BaseGold
	,NumGoldPerEra
	,SpreadReligion
	,CombatLimit
	,RangeAttackOnlyInDomain
	,RangeAttackIgnoreLOS
	,RangedCombatLimit
	,XPValueAttack
	,XPValueDefense
	,SpecialCargo
	,DomainCargo
	,Conscription
	,ExtraMaintenanceCost
	,NoMaintenance
	,Unhappiness
	,UnitArtInfo
	,UnitArtInfoCulturalVariation
	,UnitArtInfoEraVariation
	,ProjectPrereq
	,SpaceshipProject
	,LeaderPromotion
	,LeaderExperience
	,DontShowYields
	,ShowInPedia
	,MoveRate
	,UnitFlagIconOffset
	,PortraitIndex
	,IconAtlas
	,UnitFlagAtlas
	)
SELECT ('UNIT_BIPLAN')
	,('Biplan')
	,Civilopedia
	,Strategy
	,HELP
	,Requirements
	,Combat
	,(25)
	,(250)
	,Moves
	,Immobile
	,(5)
	,BaseSightRange
	,('UNITCLASS_BIPLAN')
	,Special
	,Capture
	,CombatClass
	,Domain
	,CivilianAttackPriority
	,DefaultUnitAI
	,Food
	,NoBadGoodies
	,RivalTerritory
	,MilitarySupport
	,MilitaryProduction
	,Pillage
	,Found
	,FoundAbroad
	,CultureBombRadius
	,GoldenAgeTurns
	,IgnoreBuildingDefense
	,PrereqResources
	,Mechanized
	,Suicide
	,CaptureWhileEmbarked
	,PrereqTech
	,ObsoleteTech
	,GoodyHutUpgradeUnitClass
	,HurryCostModifier
	,AdvancedStartCost
	,MinAreaSize
	,AirUnitCap
	,NukeDamageLevel
	,WorkRate
	,NumFreeTechs
	,RushBuilding
	,BaseHurry
	,HurryMultiplier
	,BaseGold
	,NumGoldPerEra
	,SpreadReligion
	,CombatLimit
	,RangeAttackOnlyInDomain
	,RangeAttackIgnoreLOS
	,RangedCombatLimit
	,XPValueAttack
	,XPValueDefense
	,SpecialCargo
	,DomainCargo
	,Conscription
	,ExtraMaintenanceCost
	,NoMaintenance
	,Unhappiness
	,('ART_DEF_UNIT_BIPLAN')
	,UnitArtInfoCulturalVariation
	,UnitArtInfoEraVariation
	,ProjectPrereq
	,SpaceshipProject
	,LeaderPromotion
	,LeaderExperience
	,DontShowYields
	,ShowInPedia
	,MoveRate
	,UnitFlagIconOffset
	,PortraitIndex
	,IconAtlas
	,UnitFlagAtlas
FROM Units
WHERE (Type = 'UNIT_FIGHTER');

INSERT INTO Unit_AITypes (
	UnitType
	,UnitAIType
	)
SELECT ('UNIT_BIPLAN')
	,UnitAIType
FROM Unit_AITypes
WHERE (UnitType = 'UNIT_FIGHTER');

INSERT INTO Unit_ClassUpgrades (
	UnitType
	,UnitClassType
	)
SELECT ('UNIT_BIPLAN')
	,UnitClassType
FROM Unit_ClassUpgrades
WHERE (UnitType = 'UNIT_FIGHTER');

INSERT INTO Unit_Flavors (
	UnitType
	,FlavorType
	,Flavor
	)
SELECT ('UNIT_BIPLAN')
	,FlavorType
	,Flavor
FROM Unit_Flavors
WHERE (UnitType = 'UNIT_FIGHTER');

INSERT INTO Unit_FreePromotions (
	UnitType
	,PromotionType
	)
SELECT ('UNIT_BIPLAN')
	,PromotionType
FROM Unit_FreePromotions
WHERE (UnitType = 'UNIT_FIGHTER');

INSERT INTO Unit_ResourceQuantityRequirements (
	UnitType
	,ResourceType
	,Cost
	)
SELECT ('UNIT_BIPLAN')
	,ResourceType
	,Cost
FROM Unit_ResourceQuantityRequirements
WHERE (UnitType = 'UNIT_FIGHTER');