typedef enum{
    kWholeGameStatus_Playing = 0,
    kWholeGameStatus_Restarting,
}eWholeGameStatus;

eWholeGameStatus wholeGameStatus;
bool isStopping;
CCLayerColor* s_blackTranspancy_bg;
CCSprite* s_menu_instruction;
CCSprite* s_menu_restart;
CCSprite* s_menu_resume;
CCSprite* s_menu_exit;
CCSprite* s_gameover;
CCSprite* s_ingameInstruction;

typedef enum{
    kDeapth_miniBasic = 0,
    kDeapth_ssCharacter,
    kDeapth_ssExtra,
    
    kDeapth_Extra1,
    kDeapth_Extra2,
    
    kDeapth_Equip_Fire,
    kDeapth_Equip_Smoke,
    kDeapth_Equip_Rocket,
    kDeapth_Turtle_Neck,
    kDeapth_Turtle_Shadow,
    kDeapth_Turtle_Head,
    kDeapth_Turtle_HeadAndNeck,
    kDeapth_Turtle_Tail,
    kDeapth_Turtle_Shell,
    kDeapth_Turtle_LeftLeg,
    kDeapth_Turtle_RightLeg,
    kDeapth_Turtle_Eye,
    kDeapth_Turtle_Spike,
    kDeapth_Equip_Glide,
    
    kDeapth_Penguin_MAIN,
    
    kDeapth_Top,
    kDeapth_Turtle_Bombing,
    
    kDeapth_Penguin_Body,
    kDeapth_Penguin_Eye,
    kDeapth_Penguin_Mouth,
    kDeapth_Penguin_Wing,
    kDeapth_Penguin_BackLeg,
    kDeapth_Penguin_FrongLeg,
    
    kDeapth_Penguin_Bombing,
    
    kDeapth_Bg_Element1,
    
    kDeapth_Btns,
    kDeapth_Menu1,
    kDeapth_Menu,
    kDeapth_Gameover,
    kDeapth_Turtle_Bombing2,
    kDeapth_FUCKTOP,
    
}eDeapth;

CCSpriteBatchNode* ss_Gameover;
CCSpriteBatchNode* ss_Character;
CCSpriteBatchNode* ss_Extra;

float wholeTurtleScaleFromSocurce;
float wholePenguinScaleFromSocurce;
float wholeCannonScaleFromSocurce;
float aniControlValueForFuckingIpad;
float textureRatioForFuckingIpad;

int currentChosenMiniGame;

int counterForAchivement;
int currentTurtleCoin; //replaced by Bomb(B) number
int turtleCoinAccum;
int currentCombo;
int maxCombo;
float comboRemain;
float comoboReduceSpeed;
int comboToStart;

bool isShowingMenu;
bool isShowingInstruction;

float timeRemain;
float maxTime;

float penguinJumpFinalX;
float penguinJumpFinalY;
float penguin_DynmaicJumpY;


int next_jumpType;
bool next_isFacingRight;
bool next_hasNext;
bool isGoingToNext;

int comboColorLimit[11];
int comboLevel;

float turtleCoinShinning_angleSpeed;
float turtleCoinShinning_angleAcceleration;

int currentTurtleOnScreen;
int maxTurtleOnScreen;

float cannonAngle;

#import "UILayer.h"
UILayer* uILayer;

int turtle_detectHalfLeft;
int turtle_detectHalfRight;
int turtle_detectHalfUp;
int turtle_detectHalfDown;


#import "PlayScene.h"
PlayScene* playLayer;


int gameLevel;
int gameLevel_Combo;
int gameRound;
int gameRoundFromBegin;


bool isTapWronglyAndDisableBtns;
int tapWronglyAndDisableBtnsTimer;

bool isFuckingShootFirstTime;


bool cannotPlayTurtleHeadOutSound;

float timeToBeGained;

bool isPlayingMiniGame;
bool isMainGameBeginning;
float objVInCollision;