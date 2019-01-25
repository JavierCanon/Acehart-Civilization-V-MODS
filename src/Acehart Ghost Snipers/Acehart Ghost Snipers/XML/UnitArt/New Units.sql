-- http://forums.civfanatics.com/showthread.php?t=461429
-- ***************** SNIPER ********************

INSERT INTO ArtDefine_UnitInfos (
	Type
	,DamageStates
	,Formation
	)
SELECT 
     ('ART_DEF_UNIT_SF_SNIPER')
	,1 --DamageStates
	,('UnFormed') --Formation
;

INSERT INTO ArtDefine_UnitInfoMemberInfos (
	 UnitInfoType
	,UnitMemberInfoType
	,NumMembers
	)
SELECT 
     ('ART_DEF_UNIT_SF_SNIPER')
	,('ART_DEF_UNIT_MEMBER_SNIPER')
	,1 --NumMembers
;

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
SELECT 
    ('ART_DEF_UNIT_MEMBER_SNIPER')
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
WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_WW2_INFANTRY')
;

INSERT INTO ArtDefine_UnitMemberCombatWeapons (
	 UnitMemberType
	,[Index]
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
SELECT
   ('ART_DEF_UNIT_MEMBER_SNIPER')
	,[Index]
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
WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_WW2_INFANTRY')
;

INSERT INTO ArtDefine_UnitMemberInfos (
	Type
	,Scale
	,ZOffset
	,Domain
	,Model
	,MaterialTypeTag
	,MaterialTypeSoundOverrideTag
	)
SELECT
     ('ART_DEF_UNIT_MEMBER_SNIPER')
	,Scale
	,ZOffset
	,Domain
	,('Paratrooper_USA.fxsxml')
	,MaterialTypeTag
	,MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos
WHERE (Type = 'ART_DEF_UNIT_MEMBER_WW2_INFANTRY')
;


-- ***************** MODERN SNIPER ********************

INSERT INTO ArtDefine_UnitInfos (
	Type
	,DamageStates
	,Formation
	)
SELECT 
     ('ART_DEF_UNIT_SFMODERN_SNIPER')
	,1 --DamageStates
	,('UnFormed') --Formation
;


INSERT INTO ArtDefine_UnitInfoMemberInfos (
	 UnitInfoType
	,UnitMemberInfoType
	,NumMembers
	)
SELECT 
     ('ART_DEF_UNIT_SFMODERN_SNIPER')
	,('ART_DEF_UNIT_MEMBER_MODERN_SNIPER')
	,1 --NumMembers
;


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
SELECT 
    ('ART_DEF_UNIT_MEMBER_MODERN_SNIPER')
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
WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_WW2_INFANTRY')
;

INSERT INTO ArtDefine_UnitMemberCombatWeapons (
	 UnitMemberType
	,[Index]
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
SELECT
   ('ART_DEF_UNIT_MEMBER_MODERN_SNIPER')
	,[Index]
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
WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_WW2_INFANTRY')
;

INSERT INTO ArtDefine_UnitMemberInfos (
	Type
	,Scale
	,ZOffset
	,Domain
	,Model
	,MaterialTypeTag
	,MaterialTypeSoundOverrideTag
	)
SELECT
     ('ART_DEF_UNIT_MEMBER_MODERN_SNIPER')
	,Scale
	,ZOffset
	,Domain
	,('Paratrooper_Generic.fxsxml')
	,MaterialTypeTag
	,MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos
WHERE (Type = 'ART_DEF_UNIT_MEMBER_WW2_INFANTRY')
;



-- ***************** AT SNIPER ********************

INSERT INTO ArtDefine_UnitInfos (
	Type
	,DamageStates
	,Formation
	)
SELECT 
     ('ART_DEF_UNIT_SFAT_SNIPER')
	,1 --DamageStates
	,('UnFormed') --Formation
;

INSERT INTO ArtDefine_UnitInfoMemberInfos (
	 UnitInfoType
	,UnitMemberInfoType
	,NumMembers
	)
SELECT 
   ('ART_DEF_UNIT_SFAT_SNIPER')
	,('ART_DEF_UNIT_MEMBER_AT_SNIPER')
	,1 --NumMembers
;


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
SELECT 
    ('ART_DEF_UNIT_MEMBER_AT_SNIPER')
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
WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_WW2_INFANTRY')
;

INSERT INTO ArtDefine_UnitMemberCombatWeapons (
	 UnitMemberType
	,[Index]
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
SELECT
   ('ART_DEF_UNIT_MEMBER_AT_SNIPER')
	,[Index]
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
WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_WW2_INFANTRY')
;

INSERT INTO ArtDefine_UnitMemberInfos (
	Type
	,Scale
	,ZOffset
	,Domain
	,Model
	,MaterialTypeTag
	,MaterialTypeSoundOverrideTag
	)
SELECT
     ('ART_DEF_UNIT_MEMBER_AT_SNIPER')
	,Scale
	,ZOffset
	,Domain
	,('Paratrooper_German.fxsxml')
	,MaterialTypeTag
	,MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos
WHERE (Type = 'ART_DEF_UNIT_MEMBER_WW2_INFANTRY')
;
