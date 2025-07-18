MACRO move
	db \1 ; animation
	db \2 ; effect
	db \3 ; power (0 for status moves, 1 for nonstandard base power)
	db \4 ; type
	db \5 ; accuracy (-1 for moves that ignore accuracy checks)
	db \6 ; pp
	db \7 ; effect chance
	db \8 ; category
	assert (\2 != EFFECT_MULTI_HIT || \3 < 52), "AI routines assume multihit BP x 5 <= 255"
ENDM

Moves::
; entries correspond to move ids (see constants/move_constants.asm)
	table_width MOVE_LENGTH
	move ACROBATICS,      EFFECT_CONDITIONAL_BOOST,  55, FLYING,    100, 15,   0, PHYSICAL
	move KARATE_CHOP,     EFFECT_NORMAL_HIT,         50, FIGHTING,  100, 25,   0, PHYSICAL
	move DOUBLE_SLAP,     EFFECT_MULTI_HIT,          15, NORMAL,     85, 10,   0, PHYSICAL
	move AERIAL_ACE,      EFFECT_ALWAYS_HIT,         60, FLYING,     -1, 20,   0, PHYSICAL
	move DRAGON_CLAW,     EFFECT_NORMAL_HIT,         80, DRAGON,    100, 15,   0, PHYSICAL
	move PAY_DAY,         EFFECT_PAY_DAY,            40, NORMAL,    100, 20,   0, PHYSICAL
	move FIRE_PUNCH,      EFFECT_BURN_HIT,           75, FIRE,      100, 15,  10, PHYSICAL
	move ICE_PUNCH,       EFFECT_FREEZE_HIT,         75, ICE,       100, 15,  10, PHYSICAL
	move THUNDERPUNCH,    EFFECT_PARALYZE_HIT,       75, ELECTRIC,  100, 15,  10, PHYSICAL
	move SCRATCH,         EFFECT_NORMAL_HIT,         40, NORMAL,    100, 35,   0, PHYSICAL
	move X_SCISSOR,       EFFECT_NORMAL_HIT,         80, BUG,       100, 15,   0, PHYSICAL
	move NIGHT_SLASH,     EFFECT_NORMAL_HIT,         70, DARK,      100, 15,   0, PHYSICAL
	move AIR_SLASH,       EFFECT_FLINCH_HIT,         75, FLYING,     95, 15,  30, SPECIAL
	move SWORDS_DANCE,    EFFECT_ATTACK_UP_2,         0, NORMAL,     -1, 20,   0, STATUS
if DEF(FAITHFUL)
	move CUT,             EFFECT_NORMAL_HIT,         50, NORMAL,     95, 30,   0, PHYSICAL
else
	move CUT,             EFFECT_NORMAL_HIT,         60, STEEL,     100, 30,   0, PHYSICAL
endc
	move GUST,            EFFECT_GUST,               40, FLYING,    100, 35,   0, SPECIAL
	move WING_ATTACK,     EFFECT_NORMAL_HIT,         60, FLYING,    100, 35,   0, PHYSICAL
	move SUCKER_PUNCH,    EFFECT_SUCKER_PUNCH,       70, DARK,      100,  5,   0, PHYSICAL
if DEF(FAITHFUL)
	move FLY,             EFFECT_FLY,                90, FLYING,     95, 15,   0, PHYSICAL
else
	move FLY,             EFFECT_FLY,                90, FLYING,    100, 15,   0, PHYSICAL
endc
	move DAZZLINGLEAM,    EFFECT_NORMAL_HIT,         80, FAIRY,     100, 10,   0, SPECIAL
	move VOLT_SWITCH,     EFFECT_SWITCH_HIT,         70, ELECTRIC,  100, 20,   0, SPECIAL
	move VINE_WHIP,       EFFECT_NORMAL_HIT,         45, GRASS,     100, 25,   0, PHYSICAL
	move STOMP,           EFFECT_STOMP,              65, NORMAL,    100, 20,  30, PHYSICAL
	move DOUBLE_KICK,     EFFECT_DOUBLE_HIT,         30, FIGHTING,  100, 30,   0, PHYSICAL
	move FLARE_BLITZ,     EFFECT_FLARE_BLITZ,       120, FIRE,      100, 15,  10, PHYSICAL
	move STONE_EDGE,      EFFECT_NORMAL_HIT,        100, ROCK,       80,  5,   0, PHYSICAL
	move FOCUS_BLAST,     EFFECT_SP_DEF_DOWN_HIT,   120, FIGHTING,   70,  5,  10, SPECIAL
	move TOXIC_SPIKES,    EFFECT_TOXIC_SPIKES,        0, POISON,     -1, 20,   0, STATUS
	move HEADBUTT,        EFFECT_FLINCH_HIT,         70, NORMAL,    100, 15,  30, PHYSICAL
	move HORN_ATTACK,     EFFECT_NORMAL_HIT,         65, NORMAL,    100, 25,   0, PHYSICAL
	move TRICK,           EFFECT_TRICK,               0, PSYCHIC,   100, 10,   0, STATUS
	move HEX,             EFFECT_CONDITIONAL_BOOST,  65, GHOST,     100, 10,   0, SPECIAL
	move TACKLE,          EFFECT_NORMAL_HIT,         40, NORMAL,    100, 35,   0, PHYSICAL
	move BODY_SLAM,       EFFECT_BODY_SLAM,          85, NORMAL,    100, 15,  30, PHYSICAL
	move WRAP,            EFFECT_TRAP,               15, NORMAL,     90, 20,   0, PHYSICAL
if DEF(FAITHFUL)
	move TAKE_DOWN,       EFFECT_RECOIL_HIT,         90, NORMAL,     85, 20,   0, PHYSICAL
else
	move TAKE_DOWN,       EFFECT_RECOIL_HIT,         90, NORMAL,    100, 15,   0, PHYSICAL
endc
	move THRASH,          EFFECT_RAMPAGE,           120, NORMAL,    100, 10,   0, PHYSICAL
	move DOUBLE_EDGE,     EFFECT_RECOIL_HIT,        120, NORMAL,    100, 15,   0, PHYSICAL
	move HAIL,            EFFECT_HAIL,                0, ICE,        -1, 10,   0, STATUS
	move POISON_STING,    EFFECT_POISON_HIT,         15, POISON,    100, 35,  30, PHYSICAL
	move U_TURN,          EFFECT_SWITCH_HIT,         70, BUG,       100, 20,   0, PHYSICAL
	move PIN_MISSILE,     EFFECT_MULTI_HIT,          25, BUG,        95, 20,   0, PHYSICAL
	move LEER,            EFFECT_DEFENSE_DOWN,        0, NORMAL,    100, 30,   0, STATUS
	move BITE,            EFFECT_FLINCH_HIT,         60, DARK,      100, 25,  30, PHYSICAL
	move GROWL,           EFFECT_ATTACK_DOWN,         0, NORMAL,    100, 40,   0, STATUS
	move ROAR,            EFFECT_ROAR,                0, NORMAL,     -1, 20,   0, STATUS
if DEF(FAITHFUL)
	move SING,            EFFECT_SLEEP,               0, NORMAL,     55, 15,   0, STATUS
	move SUPERSONIC,      EFFECT_CONFUSE,             0, NORMAL,     55, 20,   0, STATUS
else
	move SING,            EFFECT_SLEEP,               0, NORMAL,     75, 15,   0, STATUS
	move SUPERSONIC,      EFFECT_CONFUSE,             0, NORMAL,     65, 20,   0, STATUS
endc
	move SONIC_BOOM,      EFFECT_STATIC_DAMAGE,      20, NORMAL,     90, 20,   0, SPECIAL
	move DISABLE,         EFFECT_DISABLE,             0, NORMAL,    100, 20,   0, STATUS
	move ACID,            EFFECT_SP_DEF_DOWN_HIT,    40, POISON,    100, 30,  10, SPECIAL
	move EMBER,           EFFECT_BURN_HIT,           40, FIRE,      100, 25,  10, SPECIAL
	move FLAMETHROWER,    EFFECT_BURN_HIT,           90, FIRE,      100, 15,  10, SPECIAL
	move CALM_MIND,       EFFECT_CALM_MIND,           0, PSYCHIC,    -1, 20,   0, STATUS
	move WATER_GUN,       EFFECT_NORMAL_HIT,         40, WATER,     100, 25,   0, SPECIAL
	move HYDRO_PUMP,      EFFECT_NORMAL_HIT,        110, WATER,      80,  5,   0, SPECIAL
	move SURF,            EFFECT_NORMAL_HIT,         90, WATER,     100, 15,   0, SPECIAL
	move ICE_BEAM,        EFFECT_FREEZE_HIT,         90, ICE,       100, 10,  10, SPECIAL
	move BLIZZARD,        EFFECT_FREEZE_HIT,        110, ICE,        70,  5,  10, SPECIAL
	move PSYBEAM,         EFFECT_CONFUSE_HIT,        65, PSYCHIC,   100, 20,  10, SPECIAL
	move BUBBLE_BEAM,     EFFECT_SPEED_DOWN_HIT,     65, WATER,     100, 20,  10, SPECIAL
	move AURORA_BEAM,     EFFECT_ATTACK_DOWN_HIT,    65, ICE,       100, 20,  10, SPECIAL
	move HYPER_BEAM,      EFFECT_HYPER_BEAM,        150, NORMAL,     90,  5,   0, SPECIAL
	move PECK,            EFFECT_NORMAL_HIT,         35, FLYING,    100, 35,   0, PHYSICAL
	move DRILL_PECK,      EFFECT_NORMAL_HIT,         80, FLYING,    100, 20,   0, PHYSICAL
	move CLOSE_COMBAT,    EFFECT_CLOSE_COMBAT,      120, FIGHTING,  100,  5,   0, PHYSICAL
	move LOW_KICK,        EFFECT_LOW_KICK,            1, FIGHTING,  100, 20,  30, PHYSICAL
	move COUNTER,         EFFECT_COUNTER,             1, FIGHTING,   -1, 20,   0, PHYSICAL
	move SEISMIC_TOSS,    EFFECT_LEVEL_DAMAGE,        1, FIGHTING,  100, 20,   0, PHYSICAL
if DEF(FAITHFUL)
	move STRENGTH,        EFFECT_NORMAL_HIT,         80, NORMAL,    100, 15,   0, PHYSICAL
else
	move STRENGTH,        EFFECT_NORMAL_HIT,         80, FIGHTING,  100, 15,   0, PHYSICAL
endc
	move ABSORB,          EFFECT_LEECH_HIT,          20, GRASS,     100, 25,   0, SPECIAL
	move MEGA_DRAIN,      EFFECT_LEECH_HIT,          40, GRASS,     100, 15,   0, SPECIAL
	move LEECH_SEED,      EFFECT_LEECH_SEED,          0, GRASS,      90, 10,   0, STATUS
	move GROWTH,          EFFECT_GROWTH,              0, NORMAL,     -1, 20,   0, STATUS
	move RAZOR_LEAF,      EFFECT_NORMAL_HIT,         55, GRASS,      95, 25,   0, PHYSICAL
	move SOLAR_BEAM,      EFFECT_SOLAR_BEAM,        120, GRASS,     100, 10,   0, SPECIAL
	move POISONPOWDER,    EFFECT_POISON,              0, POISON,     75, 35,   0, STATUS
	move STUN_SPORE,      EFFECT_PARALYZE,            0, GRASS,      75, 30,   0, STATUS
	move SLEEP_POWDER,    EFFECT_SLEEP,               0, GRASS,      75, 15,   0, STATUS
	move PETAL_DANCE,     EFFECT_RAMPAGE,           120, GRASS,     100, 10,   0, SPECIAL
	move STRING_SHOT,     EFFECT_SPEED_DOWN_2,        0, BUG,        95, 40,   0, STATUS
	move DRAGON_RAGE,     EFFECT_STATIC_DAMAGE,      40, DRAGON,    100, 10,   0, SPECIAL
if DEF(FAITHFUL)
	move FIRE_SPIN,       EFFECT_TRAP,               35, FIRE,       85, 15,   0, SPECIAL
else
	move FIRE_SPIN,       EFFECT_TRAP,               40, FIRE,       90, 15,   0, SPECIAL
endc
	move THUNDERSHOCK,    EFFECT_PARALYZE_HIT,       40, ELECTRIC,  100, 30,  10, SPECIAL
	move THUNDERBOLT,     EFFECT_PARALYZE_HIT,       90, ELECTRIC,  100, 15,  10, SPECIAL
	move THUNDER_WAVE,    EFFECT_PARALYZE,            0, ELECTRIC,   90, 20,   0, STATUS
	move THUNDER,         EFFECT_THUNDER,           110, ELECTRIC,   70, 10,  30, SPECIAL
	move ROCK_THROW,      EFFECT_NORMAL_HIT,         50, ROCK,       90, 15,   0, PHYSICAL
	move EARTHQUAKE,      EFFECT_EARTHQUAKE,        100, GROUND,    100, 10,   0, PHYSICAL
	move AVALANCHE,       EFFECT_CONDITIONAL_BOOST,  60, ICE,       100, 10,   0, PHYSICAL
if DEF(FAITHFUL)
	move DIG,             EFFECT_FLY,                80, GROUND,    100, 10,   0, PHYSICAL
else
	move DIG,             EFFECT_FLY,                90, GROUND,    100, 10,   0, PHYSICAL
endc
	move TOXIC,           EFFECT_TOXIC,               0, POISON,     90, 10,   0, STATUS
	move CONFUSION,       EFFECT_CONFUSE_HIT,        50, PSYCHIC,   100, 25,  10, SPECIAL
	move PSYCHIC_M,       EFFECT_SP_DEF_DOWN_HIT,    90, PSYCHIC,   100, 10,  10, SPECIAL
	move HYPNOSIS,        EFFECT_SLEEP,               0, PSYCHIC,    60, 20,   0, STATUS
	move HONE_CLAWS,      EFFECT_HONE_CLAWS,          0, DARK,       -1, 40,   0, STATUS
	move AGILITY,         EFFECT_SPEED_UP_2,          0, PSYCHIC,    -1, 30,   0, STATUS
	move QUICK_ATTACK,    EFFECT_PRIORITY_HIT,       40, NORMAL,    100, 30,   0, PHYSICAL
	move RAGE,            EFFECT_RAGE,               20, NORMAL,    100, 20,   0, PHYSICAL
	move TELEPORT,        EFFECT_TELEPORT,            0, PSYCHIC,    -1, 20,   0, STATUS
	move NIGHT_SHADE,     EFFECT_LEVEL_DAMAGE,        1, GHOST,     100, 15,   0, SPECIAL
	move DRAGON_PULSE,    EFFECT_NORMAL_HIT,         85, DRAGON,    100, 10,   0, SPECIAL
	move SCREECH,         EFFECT_DEFENSE_DOWN_2,      0, NORMAL,     85, 40,   0, STATUS
	move DOUBLE_TEAM,     EFFECT_EVASION_UP,          0, NORMAL,     -1, 15,   0, STATUS
	move RECOVER,         EFFECT_HEAL,                0, NORMAL,     -1, 5,    0, STATUS
	move ROCK_BLAST,      EFFECT_MULTI_HIT,          25, ROCK,       90, 25,   0, PHYSICAL
	move MINIMIZE,        EFFECT_MINIMIZE,            0, NORMAL,     -1, 10,   0, STATUS
	move SMOKESCREEN,     EFFECT_ACCURACY_DOWN,       0, NORMAL,    100, 20,   0, STATUS
	move CONFUSE_RAY,     EFFECT_CONFUSE,             0, GHOST,     100, 10,   0, STATUS
	move AQUA_TAIL,       EFFECT_NORMAL_HIT,         90, WATER,      90, 10,   0, PHYSICAL
	move DEFENSE_CURL,    EFFECT_DEFENSE_CURL,        0, NORMAL,     -1, 40,   0, STATUS
	move BARRIER,         EFFECT_DEFENSE_UP_2,        0, PSYCHIC,    -1, 20,   0, STATUS
	move LIGHT_SCREEN,    EFFECT_LIGHT_SCREEN,        0, PSYCHIC,    -1, 30,   0, STATUS
	move HAZE,            EFFECT_HAZE,                0, ICE,        -1, 30,   0, STATUS
	move REFLECT,         EFFECT_REFLECT,             0, PSYCHIC,    -1, 20,   0, STATUS
	move FOCUS_ENERGY,    EFFECT_FOCUS_ENERGY,        0, NORMAL,     -1, 30,   0, STATUS
	move FLASH_CANNON,    EFFECT_SP_DEF_DOWN_HIT,    80, STEEL,     100, 10,  10, SPECIAL
if DEF(FAITHFUL)
	move METRONOME,       EFFECT_METRONOME,           0, NORMAL,     -1, 10,   0, STATUS
else
	move METRONOME,       EFFECT_METRONOME,           0, UNKNOWN_T,  -1, 20,   0, STATUS
endc
if DEF(FAITHFUL)
	move SCALD,           EFFECT_BURN_HIT,           80, WATER,     100, 15,  30, SPECIAL
else
	move SCALD,           EFFECT_BURN_HIT,           70, WATER,     100, 15,  30, SPECIAL
endc
	move TRICK_ROOM,      EFFECT_TRICK_ROOM,          0, PSYCHIC,    -1,  5,   0, STATUS
	move SKILL_SWAP,      EFFECT_SKILL_SWAP,          0, PSYCHIC,    -1, 10,   0, STATUS
	move LICK,            EFFECT_PARALYZE_HIT,       30, GHOST,     100, 30,  30, PHYSICAL
	move GUNK_SHOT,       EFFECT_POISON_HIT,        120, POISON,     80,  5,  30, PHYSICAL
	move VENOSHOCK,       EFFECT_CONDITIONAL_BOOST,  65, POISON,    100, 10,   0, SPECIAL
	move EARTH_POWER,     EFFECT_SP_DEF_DOWN_HIT,    90, GROUND,    100, 10,  10, SPECIAL
	move FIRE_BLAST,      EFFECT_BURN_HIT,          110, FIRE,       85,  5,  10, SPECIAL
	move WATERFALL,       EFFECT_FLINCH_HIT,         80, WATER,     100, 15,  20, PHYSICAL
	move ICICLE_CRASH,    EFFECT_FLINCH_HIT,         85, ICE,        90, 10,  30, PHYSICAL
	move SWIFT,           EFFECT_ALWAYS_HIT,         60, NORMAL,     -1, 20,   0, SPECIAL
	move IRON_HEAD,       EFFECT_FLINCH_HIT,         80, STEEL,     100, 15,  30, PHYSICAL
	move ICICLE_SPEAR,    EFFECT_MULTI_HIT,          25, ICE,       100, 30,   0, PHYSICAL
	move BULLDOZE,        EFFECT_SPEED_DOWN_HIT,     60, GROUND,    100, 20, 100, PHYSICAL
	move AMNESIA,         EFFECT_SP_DEF_UP_2,         0, PSYCHIC,    -1, 20,   0, STATUS
	move ROOST,           EFFECT_ROOST,               0, FLYING,     -1, 5,    0, STATUS
	move FRESH_SNACK,     EFFECT_HEAL,                0, NORMAL,     -1, 10,   0, STATUS
	move HI_JUMP_KICK,    EFFECT_JUMP_KICK,         130, FIGHTING,   90, 10,   0, PHYSICAL
	move GLARE,           EFFECT_PARALYZE,            0, NORMAL,    100, 30,   0, STATUS
	move DREAM_EATER,     EFFECT_DREAM_EATER,       100, PSYCHIC,   100, 15,   0, SPECIAL
	move POISON_JAB,      EFFECT_POISON_HIT,         80, POISON,    100, 20,  30, PHYSICAL
	move BULLET_PUNCH,    EFFECT_PRIORITY_HIT,       40, STEEL,     100, 30,   0, PHYSICAL
	move LEECH_LIFE,      EFFECT_LEECH_HIT,          80, BUG,       100, 10,   0, PHYSICAL
	move DRAINING_KISS,   EFFECT_LEECH_HIT,          60, FAIRY,     100, 10,   0, SPECIAL
	move BRAVE_BIRD,      EFFECT_RECOIL_HIT,        120, FLYING,    100, 15,   0, PHYSICAL
	move TRANSFORM,       EFFECT_TRANSFORM,           0, NORMAL,     -1, 10,   0, STATUS
	move WATER_PULSE,     EFFECT_CONFUSE_HIT,        60, WATER,     100, 20,  20, SPECIAL
	move DIZZY_PUNCH,     EFFECT_CONFUSE_HIT,        70, NORMAL,    100, 10,  20, PHYSICAL
	move SPORE,           EFFECT_SLEEP,               0, GRASS,     100, 15,   0, STATUS
	move FLASH,           EFFECT_ACCURACY_DOWN,       0, NORMAL,    100, 20,   0, STATUS
	move EXTRASENSORY,    EFFECT_FLINCH_HIT,         80, PSYCHIC,   100, 20,  10, SPECIAL
	move SPLASH,          EFFECT_SPLASH,              0, NORMAL,     -1, 40,   0, STATUS
	move DRAGON_DANCE,    EFFECT_DRAGON_DANCE,        0, DRAGON,    100, 20,   0, STATUS
if DEF(FAITHFUL)
	move CRABHAMMER,      EFFECT_NORMAL_HIT,        100, WATER,      90, 10,   0, PHYSICAL
else
	move CRABHAMMER,      EFFECT_NORMAL_HIT,        100, WATER,      95, 10,   0, PHYSICAL
endc
	move EXPLOSION,       EFFECT_EXPLOSION,         250, NORMAL,    100,  5,   0, PHYSICAL
if DEF(FAITHFUL)
	move FURY_STRIKES,    EFFECT_MULTI_HIT,          18, NORMAL,     80, 15,   0, PHYSICAL
else
	move FURY_STRIKES,    EFFECT_MULTI_HIT,          20, NORMAL,     85, 15,   0, PHYSICAL
endc
	move BONEMERANG,      EFFECT_DOUBLE_HIT,         50, GROUND,     90, 10,   0, PHYSICAL
	move REST,            EFFECT_HEAL,                0, PSYCHIC,    -1, 5,    0, STATUS
	move ROCK_SLIDE,      EFFECT_FLINCH_HIT,         75, ROCK,       90, 10,  30, PHYSICAL
	move HYPER_FANG,      EFFECT_FLINCH_HIT,         80, NORMAL,     90, 15,  10, PHYSICAL
	move BULK_UP,         EFFECT_BULK_UP,             0, FIGHTING,   -1, 20,   0, STATUS
	move CONVERSION,      EFFECT_CONVERSION,          0, NORMAL,     -1, 30,   0, STATUS
	move TRI_ATTACK,      EFFECT_TRI_ATTACK,         80, NORMAL,    100, 10,  20, SPECIAL
	move SUPER_FANG,      EFFECT_SUPER_FANG,          1, NORMAL,     90, 10,   0, PHYSICAL
	move SLASH,           EFFECT_NORMAL_HIT,         70, NORMAL,    100, 20,   0, PHYSICAL
	move SUBSTITUTE,      EFFECT_SUBSTITUTE,          0, NORMAL,     -1, 10,   0, STATUS
	move GIGA_IMPACT,     EFFECT_HYPER_BEAM,        150, NORMAL,     90,  5,   0, PHYSICAL
	move SKETCH,          EFFECT_SKETCH,              0, NORMAL,     -1,  1,   0, STATUS
	move DRAIN_PUNCH,     EFFECT_LEECH_HIT,          75, FIGHTING,  100, 10,   0, PHYSICAL
	move THIEF,           EFFECT_THIEF,              60, DARK,      100, 25, 100, PHYSICAL
	move WILL_O_WISP,     EFFECT_BURN,                0, FIRE,       85, 15,   0, STATUS
	move ZEN_HEADBUTT,    EFFECT_FLINCH_HIT,         80, PSYCHIC,    90, 15,  20, PHYSICAL
	move FACADE,          EFFECT_CONDITIONAL_BOOST,  70, NORMAL,    100, 20,   0, PHYSICAL
	move FLAME_CHARGE,    EFFECT_SPEED_UP_HIT,       50, FIRE,      100, 20, 100, PHYSICAL
	move HYPER_VOICE,     EFFECT_NORMAL_HIT,         90, NORMAL,    100, 10,   0, SPECIAL
	move CURSE,           EFFECT_CURSE,               0, GHOST,      -1, 10,   0, STATUS
	move GYRO_BALL,       EFFECT_GYRO_BALL,           1, STEEL,     100,  5,   0, PHYSICAL
	move ENERGY_BALL,     EFFECT_SP_DEF_DOWN_HIT,    90, GRASS,     100, 10,  10, SPECIAL
	move AEROBLAST,       EFFECT_NORMAL_HIT,        100, FLYING,     95,  5,   0, SPECIAL
	move SEED_BOMB,       EFFECT_NORMAL_HIT,         80, GRASS,     100, 15,   0, PHYSICAL
	move REVERSAL,        EFFECT_REVERSAL,            1, FIGHTING,  100, 15,   0, PHYSICAL
	move ASTONISH,        EFFECT_FLINCH_HIT,         30, GHOST,     100, 15,  30, PHYSICAL
	move ICE_SHARD,       EFFECT_PRIORITY_HIT,       40, ICE,       100, 30,   0, PHYSICAL
	move PROTECT,         EFFECT_PROTECT,             0, NORMAL,     -1, 10,   0, STATUS
	move MACH_PUNCH,      EFFECT_PRIORITY_HIT,       40, FIGHTING,  100, 30,   0, PHYSICAL
	move SCARY_FACE,      EFFECT_SPEED_DOWN_2,        0, NORMAL,    100, 10,   0, STATUS
	move FEINT_ATTACK,    EFFECT_ALWAYS_HIT,         60, DARK,       -1, 20,   0, PHYSICAL
	move SWEET_KISS,      EFFECT_CONFUSE,             0, FAIRY,      75, 10,   0, STATUS
	move BELLY_DRUM,      EFFECT_BELLY_DRUM,          0, NORMAL,     -1, 10,   0, STATUS
	move SLUDGE_BOMB,     EFFECT_POISON_HIT,         90, POISON,    100, 10,  30, SPECIAL
	move MUD_SLAP,        EFFECT_ACCURACY_DOWN_HIT,  20, GROUND,    100, 10, 100, SPECIAL
if DEF(FAITHFUL)
	move OCTAZOOKA,       EFFECT_ACCURACY_DOWN_HIT,  65, WATER,      85, 10,  50, SPECIAL
else
	move OCTAZOOKA,       EFFECT_ACCURACY_DOWN_HIT,  75, WATER,      95, 10,  30, SPECIAL
endc
	move SPIKES,          EFFECT_SPIKES,              0, GROUND,     -1, 20,   0, STATUS
	move ZAP_CANNON,      EFFECT_PARALYZE_HIT,      120, ELECTRIC,   50,  5, 100, SPECIAL
	move FORESIGHT,       EFFECT_FORESIGHT,           0, NORMAL,     -1, 40,   0, STATUS
	move DESTINY_BOND,    EFFECT_DESTINY_BOND,        0, GHOST,      -1,  5,   0, STATUS
	move PERISH_SONG,     EFFECT_PERISH_SONG,         0, NORMAL,     -1,  5,   0, STATUS
	move ICY_WIND,        EFFECT_SPEED_DOWN_HIT,     55, ICE,        95, 15, 100, SPECIAL
	move POWER_GEM,       EFFECT_NORMAL_HIT,         80, ROCK,      100, 20,   0, SPECIAL
	move WILD_CHARGE,     EFFECT_RECOIL_HIT,         90, ELECTRIC,  100, 15,   0, PHYSICAL
	move POWER_WHIP,      EFFECT_NORMAL_HIT,        120, GRASS,      85, 10,   0, PHYSICAL
	move OUTRAGE,         EFFECT_RAMPAGE,           120, DRAGON,    100, 10,   0, PHYSICAL
	move SANDSTORM,       EFFECT_SANDSTORM,           0, ROCK,       -1, 10,   0, STATUS
	move GIGA_DRAIN,      EFFECT_LEECH_HIT,          75, GRASS,     100, 10,   0, SPECIAL
	move ENDURE,          EFFECT_ENDURE,              0, NORMAL,     -1, 10,   0, STATUS
	move CHARM,           EFFECT_ATTACK_DOWN_2,       0, FAIRY,     100, 20,   0, STATUS
	move ROLLOUT,         EFFECT_ROLLOUT,            30, ROCK,       90, 20,   0, PHYSICAL
	move FALSE_SWIPE,     EFFECT_FALSE_SWIPE,        40, NORMAL,    100, 40,   0, PHYSICAL
	move SWAGGER,         EFFECT_SWAGGER,             0, NORMAL,     85, 15, 100, STATUS
	move SHELL_SMASH,     EFFECT_SHELL_SMASH,         0, NORMAL,     -1, 15,   0, STATUS
	move SPARK,           EFFECT_PARALYZE_HIT,       65, ELECTRIC,  100, 20,  30, PHYSICAL
	move BUG_BITE,        EFFECT_BUG_BITE,           60, BUG,       100, 20,   0, PHYSICAL
	move STEEL_WING,      EFFECT_DEFENSE_UP_HIT,     70, STEEL,      90, 25,  10, PHYSICAL
	move MEAN_LOOK,       EFFECT_MEAN_LOOK,           0, NORMAL,     -1,  5,   0, STATUS
	move ATTRACT,         EFFECT_ATTRACT,             0, NORMAL,    100, 15,   0, STATUS
	move SLEEP_TALK,      EFFECT_SLEEP_TALK,          0, NORMAL,    100, 10,   0, STATUS
	move HEAL_BELL,       EFFECT_HEAL_BELL,           0, NORMAL,     -1,  5,   0, STATUS
	move RETURN,          EFFECT_RETURN,              1, NORMAL,    100, 20,   0, PHYSICAL
	move PSYSTRIKE,       EFFECT_PSYSTRIKE,         100, PSYCHIC,   100, 10,   0, SPECIAL
	move BUG_BUZZ,        EFFECT_SP_DEF_DOWN_HIT,    90, BUG,       100, 10,  10, SPECIAL
	move SAFEGUARD,       EFFECT_SAFEGUARD,           0, NORMAL,     -1, 25,   0, STATUS
if DEF(FAITHFUL)
	move PAIN_SPLIT,      EFFECT_PAIN_SPLIT,          0, NORMAL,     -1, 20,   0, STATUS
else
	move PAIN_SPLIT,      EFFECT_PAIN_SPLIT,          0, GHOST,      -1, 20,   0, STATUS
endc
	move SACRED_FIRE,     EFFECT_SACRED_FIRE,       100, FIRE,       95,  5,  50, PHYSICAL
	move MAGNITUDE,       EFFECT_MAGNITUDE,           1, GROUND,    100, 30,   0, PHYSICAL
	move DYNAMICPUNCH,    EFFECT_CONFUSE_HIT,       100, FIGHTING,   50,  5, 100, PHYSICAL
	move MEGAHORN,        EFFECT_NORMAL_HIT,        120, BUG,        85, 10,   0, PHYSICAL
	move DRAGONBREATH,    EFFECT_PARALYZE_HIT,       60, DRAGON,    100, 20,  30, SPECIAL
	move BATON_PASS,      EFFECT_BATON_PASS,          0, NORMAL,     -1, 40,   0, STATUS
	move ENCORE,          EFFECT_ENCORE,              0, NORMAL,    100,  5,   0, STATUS
	move PURSUIT,         EFFECT_PURSUIT,            40, DARK,      100, 20,   0, PHYSICAL
if DEF(FAITHFUL)
	move RAPID_SPIN,      EFFECT_RAPID_SPIN,         50, NORMAL,    100, 40, 100, PHYSICAL
else
	move RAPID_SPIN,      EFFECT_RAPID_SPIN,         50, NORMAL,    100, 20, 100, PHYSICAL
endc
	move SHADOW_CLAW,     EFFECT_ALWAYS_HIT,         60, GHOST,     -1, 15,   0, PHYSICAL
	move IRON_TAIL,       EFFECT_DEFENSE_DOWN_HIT,  100, STEEL,      75, 15,  30, PHYSICAL
	move METAL_CLAW,      EFFECT_ATTACK_UP_HIT,      50, STEEL,      95, 35,  10, PHYSICAL
	move AURA_SPHERE,     EFFECT_ALWAYS_HIT,         80, FIGHTING,   -1, 20,   0, SPECIAL
	move HEALINGLIGHT,    EFFECT_HEALING_LIGHT,       0, NORMAL,     -1,  5,   0, STATUS
	move HURRICANE,       EFFECT_CONFUSE_HIT,       110, FLYING,     70, 10,  30, SPECIAL
	move KNOCK_OFF,       EFFECT_KNOCK_OFF,          65, DARK,      100, 20, 100, PHYSICAL
if DEF(FAITHFUL)
	move HIDDEN_POWER,    EFFECT_HIDDEN_POWER,       60, NORMAL,    100, 15,   0, SPECIAL
else
	move HIDDEN_POWER,    EFFECT_HIDDEN_POWER,       70, UNKNOWN_T, 100, 15,   0, SPECIAL
endc
	move CROSS_CHOP,      EFFECT_NORMAL_HIT,        100, FIGHTING,   80,  5,   0, PHYSICAL
	move AQUA_JET,        EFFECT_PRIORITY_HIT,       40, WATER,     100, 20,   0, PHYSICAL
	move RAIN_DANCE,      EFFECT_RAIN_DANCE,          0, WATER,      -1,  5,   0, STATUS
	move SUNNY_DAY,       EFFECT_SUNNY_DAY,           0, FIRE,       -1,  5,   0, STATUS
	move CRUNCH,          EFFECT_DEFENSE_DOWN_HIT,   80, DARK,      100, 15,  20, PHYSICAL
	move MIRROR_COAT,     EFFECT_COUNTER,             1, PSYCHIC,    -1, 20,   0, SPECIAL
	move NASTY_PLOT,      EFFECT_SP_ATK_UP_2,         0, DARK,       -1, 20,   0, STATUS
	move EXTREMESPEED,    EFFECT_PRIORITY_HIT,       80, NORMAL,    100,  5,   0, PHYSICAL
	move ANCIENTPOWER,    EFFECT_ALL_UP_HIT,         60, ROCK,      100,  5,  10, SPECIAL
	move SHADOW_BALL,     EFFECT_SP_DEF_DOWN_HIT,    80, GHOST,     100, 15,  20, SPECIAL
	move FUTURE_SIGHT,    EFFECT_FUTURE_SIGHT,      120, PSYCHIC,   100, 10,   0, SPECIAL
if DEF(FAITHFUL)
	move ROCK_SMASH,      EFFECT_DEFENSE_DOWN_HIT,   40, FIGHTING,  100, 15,  50, PHYSICAL
else
	move BRICK_BREAK,     EFFECT_BRICK_BREAK,        75, FIGHTING,  100, 15,   0, PHYSICAL
endc
if DEF(FAITHFUL)
	move WHIRLPOOL,       EFFECT_TRAP,               35, WATER,      85, 15,   0, SPECIAL
else
	move WHIRLPOOL,       EFFECT_TRAP,               40, WATER,      90, 15,   0, SPECIAL
endc
	move DARK_PULSE,      EFFECT_FLINCH_HIT,         80, DARK,      100, 15,  20, SPECIAL
	move MOONBLAST,       EFFECT_SP_ATK_DOWN_HIT,    95, FAIRY,     100, 15,  30, SPECIAL
	move PLAY_ROUGH,      EFFECT_ATTACK_DOWN_HIT,    90, FAIRY,      90, 10,  10, PHYSICAL
	move DISARM_VOICE,    EFFECT_ALWAYS_HIT,         40, FAIRY,      -1, 15,   0, SPECIAL
	move STRUGGLE,        EFFECT_RECOIL_HIT,         50, UNKNOWN_T,  -1,  1,   0, PHYSICAL
	assert_table_length NUM_ATTACKS
