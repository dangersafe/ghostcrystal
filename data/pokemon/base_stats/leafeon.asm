	db  65, 110, 130,  95,  60,  65 ; 525 BST
	;   hp  atk  def  spe  sat  sdf

	db GRASS, GHOST ; type
	db 45 ; catch rate
	db 196 ; base exp
	db NO_ITEM, NO_ITEM ; held items
	dn GENDER_F12_5, HATCH_SLOWER ; gender ratio, step cycles to hatch

if DEF(FAITHFUL)
	abilities_for LEAFEON, LEAF_GUARD, LEAF_GUARD, CHLOROPHYLL
else
	abilities_for LEAFEON, TECHNICIAN, TECHNICIAN, CHLOROPHYLL
endc
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	ev_yield 2 Def

	; tm/hm learnset
	tmhm CURSE, CALM_MIND, ROAR, TOXIC, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, PROTECT, RAIN_DANCE, GIGA_DRAIN, SOLAR_BEAM, IRON_TAIL, RETURN, DIG, SHADOW_BALL, ROCK_SMASH, DOUBLE_TEAM, SWIFT, AERIAL_ACE, SUBSTITUTE, FACADE, REST, ATTRACT, ENERGY_BALL, X_SCISSOR, GIGA_IMPACT, FLASH, SWORDS_DANCE, STRENGTH, BATON_PASS, CHARM, DOUBLE_EDGE, EARTH_POWER, ENDURE, HEADBUTT, HYPER_VOICE, KNOCK_OFF, PAY_DAY, SEED_BOMB, SLEEP_TALK, SWAGGER
	; end
