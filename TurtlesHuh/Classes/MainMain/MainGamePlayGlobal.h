int playTimer;
int playFlightTime;

bool isClickingRocket;
bool isClickingAntiClockwise;
bool isClickingClockwise;
bool isClickingProtect;
bool hasApplyedProtect;
int clickingRocketTimer;

bool isApplyingFuel;
bool isApplyingProtect;

float characterMass;
float characterIsFacingDirection;
float characterX;
float characterY;
float characterVelocity;
float characterVX;
float characterPreVX;
float character0To180VX;
float characterVY;
float characterAX;
float characterAY;
float character0To180FreeAX;
float character0To180FreeAY;
float characterSuddenVY;
float characterVR;
float characterRotation;
float characterCollideVX;
float characterCollideVY;
float characterCollideVR;
float screenX;
float screenY;
float wholeScale;

float characterLastVY;
float characterLastVX;

float characterCollideAtX;
float characterCollideAtY;
float dragonBallCollideAtX;
float dragonBallCollideAtY;
bool dragonBall_isCollidingAtDragonBall;

float characterXRealityRatio;
float characterYRealityRatio;
float characterRealX;
float characterRealY;

bool characterIsMagnet;
float characterMagnetPower;


float upgraded_maxVelocityX;
float upgraded_maxVelocityY;
float upgraded_gravity;


typedef enum{
    kCharacterStatus_Flying = 0,
}eCharacterStatus;
int characterStatus;
int characterFlyingStep;

int characterDetectNumber;
int characterDetectX[5];
int characterDetectY[5];

float minFloorY;
 float startToDeclineY;


bool isPlayingWithAccelator;

bool hasFinishedOneRound;

 bool dragonBall_isCollidingOnPillar;
bool dragonBall_isInHittingRange;

bool isBeginningHeavyInvincible;
bool isHeavyInvincible;
bool isEndingHeavyInvincible;
bool isEndingRedDueToHeavyInvincible;
int endingHeavyInvincibleTimer;

//for recoprd
//float record_continuing_height;
//float record_cotinuing_attitude;

float record_mission; //MEANINGNESS, just use for easy cal
float record_height;  //VERTICAL, MAX
float record_maxAttitude;
float record_hitted;
float record_coinsCollected;
float record_speed;
bool record_hasHittedDragonBall[7];
float record_totalFlightTime;
float record_destroyUseTime;
float record_flyNearFloorTime;
float record_flyStraightTime;

bool canDisplayTotalFlightTime;
bool canDisplayDestroyUseTime;
bool canDisplayFlyNearFloorTime;
bool canDisplayFlyStraightTime;

bool isUnderingTotalFlightTime;
bool isUnderingDestroyUseTime;
bool isUnderingFlyNearFloorTime;
bool isUnderingFlyStraightTime;

float timeChosenToDisplay;


bool spin_pefect;
float recordUse_flyStraightMinSpeed;
bool recordUse_flyStraightCanFuel;
float recordUse_flyNearFloorMinSpeed;
bool recordUse_flyNearFloorCanFuel;
float recordUse_maxSpeed;
bool recordUse_isClickingBtnFromHeavyInvincible;

int recordUse_diamondGotInOneRound;
int recordUse_GREENDiamondGotInOneRound;
int recordUse_PURPLEDiamondGotInOneRound;
int recordUse_diamondGotTotal;
int recordUse_moneyEarnedFromDiamondsInOneRound;
int recordUse_penguinHitInOneRound;
int recordUse_penguinHitInYellowBlaze;
int recordUse_penguinHitTotal;
int recordUse_continuePerfectLaunchTIme;
int recordUse_howmanyDragonBallHitted;
int recordUse_howmanyDragonBallNeedToHit;
int recordUse_targetDragonBall;
int recordUse_moneyGainedTotal;
int recordUse_pantsOfFireTime;
bool recordUse_hasAppliedFuel;
bool recordUse_breakWhileInHeavy;

//ONEUSE
//bool oneUse_hardSpin;
bool oneUse_20Fuel;
bool oneUse_50Fuel;
bool oneUse_100Fuel;
bool oneUse_doubleYellow;
bool oneUse_superInitBoost;
bool oneUse_slowCannon;
bool oneUse_BreakLess;
bool oneUse_magnetic;

bool pemanent_fuel1;
bool pemanent_fuel2;
bool pemanent_perfectLuanch;
bool pemanent_magnet1;
bool pemanent_magnet2;
bool pemanent_breakless;
bool pemanent_extraYellow;
bool pemanent_moneyRatio;

//LEVEL
int playerGlider;
int playerBoost;
int playerCannon;
int playerHelmet;

int playerFuelAmount;
int playerFuelConsumption;
int playerAirResistance;
int playerMaxSpeed;
int playerAcceleration;
int playerMoneyDensity;
int playerMoneyRatio;
int playerExtraYellow;
int playerLongerYellow;
int playerFasterToRedFrame;

/*int playerDoubleFuel;
int playerSpinIncrease;
int playerMaxYellowObtaion;
int playerInitRedFrame;*/


float characterFuelRemain;
float characterFuelReduceSpeed;
int characterMaxSpinFlightTime;
int characterMaxBeginHeavyTime;
float characterGainInvincible;
float characterGainInvincibleInterval;
int characterLightInvincibleMax;
int characterLightInvincibleMaxTime;
float characterAirResistanceReduce;
float characterMaxSpeedReduce;
float characterAccelerationReduce;
int moneyGenRadius;
int moneyNumArea;
float moneyExchangeRatio;


//OTHER DATA
int mainOtherData_bestHeight;

