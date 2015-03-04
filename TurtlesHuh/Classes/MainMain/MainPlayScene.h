//
//  MainPlayScene.h
//  TurtlesHuh
//
//  Created by  on 2012/6/17.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "MainUILayer.h"
#import "Turtle.h"
#import "Penguin.h"
#import "MainTurtleEquipments.h"
#import "ControlLayer.h"
#import "MainBgLayer.h"
#import "MainBombScript.h"
#import "MainMissionCheck.h"
#import "MainTurtlePhycis.h"

#import "Cannon.h"

@interface MainPlayScene : CCLayer <UIAccelerometerDelegate>{
    MainUILayer* mainUILayer;
    Turtle* turtle;
    MainTurtleEquipments* mainTurtleEquipments;
    ControlLayer* controlLayer;
    MainBgLayer* mainBgLayer;
    MainTurtlePhycis* mainTurtlePhycis;
    
 
    CCSprite* s_distanceShown_line;
    CCSprite* s_distanceShown_turtle;
    CCSprite* s_distanceShown_bestPosition;
    float distanceShown_maxDistance;
    float distanceShown_length;
    float distanceShown_calRatio;
    
    Cannon* cannon;
    bool cannon_showing;
    float cannon_x;
    float cannon_y;
    float cannon_initScreenX;
    float cannon_initScreenY;
    float cannon_finalScreenX;
    float cannon_finalScreenY;
    
    int spin_perffectFireTextureIdx;
    int spin_perffectCircleTextureIdx;
    CCSprite* s_spin_perfectFire;
    float spin_perfectFireScaleX;
    float spin_perfectFireScaleY;
    float spin_perfectFireOpacity;
    CCSprite* s_spin_circle;
    CCSprite* s_spin_center;
    CCSprite* s_spin_noddle;
    float spin_x;
    float spin_y;
    float spin_noddle_r;
    float spin_noddle_vr;
    float spin_circle_r;
    float spin_circle_vr;
    float spin_maxForce;
    float spin_chosenForce;
    float spin_forceRatio;
    bool spin_isRotating;
   // float spin_cheatAngleStep;
    int spin_cheatStep;
   // float spin_cheatingFinalAngleDiff;
    float spinAngleDiff;
    float spin_noddle_finalAngle;
    float spin_circlar_finalAngle;
    bool spin_isCheating;
    //bool spin_pefect;
    int spin_perfectTimer;
    bool spin_hasPerfect;
    int spin_timer;
    
    CCSprite* s_riff;
    float riff_x;
    float riff_y;
    
    bool isBeginningFlight;
    
    
    Penguin* airPenguin[30];
    int maxAirPenguinOnScreen;
    int howmanyAirPenguinOnScreen;
    int maxAirPenguin;
    int airPenguinIdx;
    float airPenguinVX[30];
    float airPenguinVY[30];
    float airPenguinX[30];
    float airPenguinY[30];
    float airPenguinRotation[30];
    float airPenguinVR[30];
    bool airPenguinIsAni[30];
    int airPenguinAniTimer[30];
    bool airPenguinIsColliding[30];
    float airPenguinMass[30];
 
    
    CCSprite* s_dragonDetect;
    CCSprite* s_dragonDetectObj;
    CCSprite* s_dragonDetectArrow;
    CCSprite* s_dragonDetectDotLine;
    float dragonDetect_dotLineOpacity;
    //CCSprite* s_dragonDetectDotWords[5];
    float dragonDetect_X;
    float dragonDetect_Y;
    float dragonDetect_ScreenX;
    float dragonDetect_ScreenY;
    float dragonDetect_dragonAtX;
    float dragonDetect_dragonAtY;
    float dragonDetect_leftSideLimit;
    float dragonDetect_scale;
    int dragonDetect_detectIdx;
    int dragonDetect_aniTimer;
    int dragonDetect_preDisappearingTimer;
    bool dragonDetect_isAni;
    bool dragonDetect_isAppearing;
    bool dragonDetect_isDisappearing;
    CCSprite* s_dragonDetect_digit[4];
    
    

    
    //float minFloorY;
   // float startToDeclineY;
    
     float suddenFuckUpAccumX;
     float suddenFuckUpAccumAngle;
    float prevCharacterX;
    float prevCharacterAngle;
    
    
    CCSprite* dragonBall_s_targeting_ballBottom;
    CCSprite* dragonBall_s_targeting_ballTop;
    CCSprite* dragonBall_s_targeting_ballStar[7];
    float dragonBall_s_targeting_starToBallOffsetX[7];
    float dragonBall_s_targeting_starToBallOffsetY[7];
    int dragonBall_s_targeting_howmanyStars;
    float dragonBall_s_targeting_detectRadius;
    
    float dragonBall_targeting_cover_Scale;
    CCSprite* dragonBall_s_targeting_cover;
    CCSprite* dragonBall_s_targeting_breakCover[2];
    CCSprite* dragonBall_s_targeting_breakSpike[7];
    float dragonBall_targeting_breakCover_X[2];
    float dragonBall_targeting_breakCover_Y[2];
    float dragonBall_targeting_breakCover_VX[2];
    float dragonBall_targeting_breakCover_VY[2];
    float dragonBall_targeting_breakSpike_X[7];
    float dragonBall_targeting_breakSpike_Y[7];
    float dragonBall_targeting_breakSpike_VX[7];
    float dragonBall_targeting_breakSpike_VY[7];
    float dragonBall_targeting_breakCover_R[2];
    float dragonBall_targeting_breakSpike_R[7];
    float dragonBall_targeting_breakCover_VR[2];
    float dragonBall_targeting_breakSpike_VR[7];
    
    float dragonBall_s_targeting_coverToBallOffsetX;
    float dragonBall_s_targeting_coverToBallOffsetY;
    
    CCSprite* dragonBall_s_targeting_pillarBottom;
    CCSprite* dragonBall_s_targeting_pillarMiddle[5];
    CCSprite* dragonBall_s_targeting_pillarTop;
    float dragonBall_s_targeting_pillarX;
    
    float dragonBall_s_targeting_detectLine[4]; //up bottom left right
    
    float dragonBall_s_targeting_pillarTopBreak_x;
    float dragonBall_s_targeting_pillarTopBreak_y;
    float dragonBall_s_targeting_pillarTopBreak_vx;
    float dragonBall_s_targeting_pillarTopBreak_vy;
    float dragonBall_s_targeting_pillarTopBreak_r;
    float dragonBall_s_targeting_pillarTopBreak_vr;
    float dragonBall_s_targeting_pillarBreak_x[5];
    float dragonBall_s_targeting_pillarBreak_y[5];
    float dragonBall_s_targeting_pillarBreak_r[5];
    float dragonBall_s_targeting_pillarBreak_vx[5];
    float dragonBall_s_targeting_pillarBreak_vy[5];
    float dragonBall_s_targeting_pillarBreak_vr[5];
    bool dragonBall_s_targeting_isPillarBreaking;
    int dragonBall_s_targeting_pillarBreakingTimer;
    
    bool dragonBall_hasEnoughMissionCompleted[7];
    bool dragonBall_isAvailable[7]; // can show dragon ball
    bool dragonBall_hasBroken[7];
    float dragonBall_oriX[7];
    float dragonBall_oriY[7];
    float dragonBall_X[7];
    float dragonBall_Y[7];
    float dragonBall_maxSpeedToBreak[7];
    float dragonBall_detectRange[7];
    int dragonBall_howmanyStars[7];
    int maxDragonBalls;
    int maxPillarMiddle;
    int dragonBall_targetingIdx;
    int dragonBall_checkTimer;
    float dragonBall_targetHowmnayPillarMiddle;
    float dragonBall_targetPillarBottomY;
    float dragonBall_targetPillarMiddleY[5];
    float dragonBall_targetPillarTopY;
    //bool dragonBall_isCollidingOnPillar;
    float dragonBall_targetMovingAngle;
    
    int dragonBall_howmanyPillarDetect;
    float dragonBall_pillarDetectPosY[10];
    float dragonBall_pillarDtectRadius;
    
    bool dragonBall_isBreaking;
    int dragonBall_breakingIdx;
    int dragonBall_breakingTimer;
    
     float dragonBallDisappear_x;
     float dragonBallDisappear_y;
     float dragonBallDisappear_r;
     float dragonBallDisappear_scale;
    
    
    //INVICIBLE
    bool isInvicinble;
    int invicinbleTimer;
    bool isStartingInvincible;
    int startingInvincibleTimer;
    bool isEndingInvicinble;
    int endingInvicinbletimer;
    
    
    MainBombScript* mainBombScript;
    
    MainMissionCheck* mainMissionCheck;
    int missionChecker;
    
    float accelRotation;
    float acceX;
    float prevX;
    
    int landingFloorTimer;
    
    
    CCSprite* finishOne_s_bg;
    CCSprite* finishOne_s_btnOn;
    CCSprite* finishOne_totalMoneyWord;
    /*int maxOneRoundWord;
    CCSprite* finishOne_l_height[7];
    CCSprite* finishOne_l_hiehgtMoney[7];
    CCSprite* finishOne_l_attitude[7];
    CCSprite* finishOne_l_attitudeMoney[7];
    CCSprite* finishOne_l_hitted[7];
    CCSprite* finishOne_l_hittedMoney[7];
    CCSprite* finishOne_l_coin[7];
    CCSprite* finishOne_l_coinMoney[7];*/
    CCSprite* finishOne_colorLayer;
    float finishOne_colorLayerOpacity;
    float finishOne_x;
    float finishOne_y;
    float finishOne_vy;
    int finishOne_timer;
    int finishOne_calTimer;
    bool canClickForNextScene;
    bool finishOne_isCalculating;
    int finishOne_displayingIdx;
    int finishOne_displayingTimer;
    int finishOne_displayingMaxTime;
    NSMutableString* finishOne_string;
    
    CCLabelAtlas* finishOne_l_height;
    CCLabelAtlas* finishOne_l_hiehgtMoney;
    CCLabelAtlas* finishOne_l_attitude;
    CCLabelAtlas* finishOne_l_attitudeMoney;
    CCLabelAtlas* finishOne_l_hitted;
    CCLabelAtlas* finishOne_l_hittedMoney;
    CCLabelAtlas* finishOne_l_coin;
    CCLabelAtlas* finishOne_l_coinMoney;
    CCLabelAtlas* finishOne_l_missionMoney;
    CCLabelAtlas* finishOne_l_totalMoney;
    
    
    float finishOne_display_height;
    float finishOne_display_attitude;
    float finishOne_display_hitted;
    float finishOne_display_coin;
    float finishOne_display_mission;
    float finishOne_display_heightMoney;
    float finishOne_display_attitudeMoney;
    float finishOne_display_hittedMoney;
    float finishOne_display_coinMoney;
    float finishOne_display_totalMoney;
    float finishOne_display_missionMoney;
    
    float finishOne_moneyGotFromHeight;
    float finishOne_moneyGotFromAttitude;
    float finishOne_moneyGotFromHitted;
    float finishOne_moneyGotFromCoin;
    float finishOne_moneyGotFromMission;
    float finishOne_totalMoneyGot;
    
    
    
    float  missionCompleted_x;
    float  missionCompleted_y;
    CCSprite* missionCompleted_s_bg;
    CCSprite* missionCompleted_s_tick;
    CCSprite* missionCompleted_s_icon;
    int maxWordsInSentense;
    int missionCompleted_timer;
    bool missionCompleted_willBeShownThis[3];
    bool missionCompleted_showingThis[3];
    int missionCompleted_showingThisTimer[3];
    bool missionCompleted_hasShownThis[3];
    
    CCSprite* l_firstSentence[60];
    CCSprite* l_secondSentense[60];
    int firstSentenseLength;
    int sencondSentenseLength;
    
    int sentense01_AccumOffset;
    int setense01_offsetX;
    int startToFuckIdx;
    int fontTexture_numInRow;
    int fontTexture_offsetX;
    int fontTexture_offsetY;
    int fontTexture_startX;
    int fontTexture_howmanyCol;
    int fontTexture_chosenRow;
    int fontTexture_chosenCol;
    
     bool hasWinMission;

    CCSprite* s_temp[5];
    
    float slowStep;
    int slowTimer;
    bool isSlowing;
    
    float applyPitch;
	float applyGain;
    
    
    //bool isHeavyInvincible;
    //bool isBeginningHeavyInvincible;
    int heavyInvincibleTimer;
    int heavyInvincibleMaxTime;
    CGRect heavyInvincble_texture[3];
    CCSprite* s_heavyIncible;
    CCSprite* s_heavyIncible2;
    int heavyInvincible_idx;
    float heavInvincible_x;
    float heavInvincible_y;
    float heavInvincible2_x;
    float heavInvincible2_y;
    float heavyInvincible_scaleX;
    float heavyInvincible_scaleY;
    float heavyInvincible_endScaleX;
    float heavyInvincible_endScaleY;
    float heavyInvincible_endOpacity;
    float heavyInvincible2_scale;
    float heavyInvincible2_vScale;
    float heavyInvincible2_opacity;
    int heavyInvincible_step;
    
    bool isLightInvincible;
    int lightInvincibleTimer;
    int lightInvincibleMaxTime;
    CGRect lightInvincble_texture[3];
    CCSprite* s_lightIncible;
    CCSprite* s_lightIncible2;
    int lightInvincible_idx;
    int lightInvincible_remain;
    int lightInvincible_max;
    float lightInvincible_x;
    float lightInvincible_y;
    float lightInvincible2_x;
    float lightInvincible2_y;
    float lightInvincible_scaleX;
    float lightInvincible_scaleY;
    float lightInvincible_endScaleX;
    float lightInvincible_endScaleY;
    float lightInvincible_endOpacity;
    float lightInvincible2_scale;
    float lightInvincible2_vScale;
    float lightInvincible2_opacity;
    int lightInvincible_step;
    CCSprite* s_lightInvincibleIcon[18];
    float lightInvincibleScale;
    float lightInvincibleAS;
    float lightInvincibleVS;
    int lightInvincibleStartTimer;
    
    float superFuxkAngleDiff;
     float superFuxkOriX;
     float superFuxkOriY;
    
     float fuxkDistanceDiffX;
     float fuxkDistanceDiffY;
     float fuxkDistanceDiff;
     float detectPointX;
     float detectPointY;
    
    
    int loadingTimer;
    int beginningFlightTimer;
    
    
   
    CCSprite* s_transition;
    int transitionTimer;
    bool isTransitioning;
    float transitionOpacity;
    float transitionGain;
    
    bool isPlayingEngineSound;
    float windSoundGain;
    bool windSoundIsIncreasing;
    bool isEndedSpin;
    
    int floorTime;
    
    float engineSound;
    float perfectLaunchSound;
    float thurstSound;
    
    bool fuckedSpinPower;
    
    //p4rc
    CCSprite* s_p4rc_setense1;
    CCSprite* s_p4rc_setense2;
    CCLabelAtlas* l_p4rc_earned;
    CCSprite* s_p4rcIcon;
    bool p4rc_isRemovedSpin;
    int p4rc_spinningTimer;
    
    UIDeviceOrientation d;
    
}

+(CCScene *) scene;

-(void) initP4RC;
-(void) showP4RC;
-(void) removeP4RCSpin;
-(void) displayP4RCLastPoint;

-(void) initForBeginning;
-(void) startFlight;

-(void) getMissionOtherValues;
-(void) getDataFromUpgrades;

-(void) initTransition;
-(void) initRecords;
-(void) initUI;
-(void) initCharacter;
-(void) initControlLayer;
-(void) initBg;
-(void) initMenu;
-(void) initDragonDetect;
-(void) initDragonBalls;
//-(void) initGameLevel;
-(void) initBomobingAni;
-(void) initMissionCheck;
-(void) initMainTurtlePhysics;
-(void) initFinishedOneRound;
-(void) initMissionCompletedShown;
-(void) initSpeical;

-(void) initBeginFlightOther;
-(void) initSpin;
-(void) spinRotating;
-(void) endSpin;
-(void) endSpin2;

-(void) initDistanceShown;
-(void) manageDistanceShown;

-(void) initCannon;
-(void) setToBombingCannon:(float)_x y:(float)_y;
-(void) setCannonPrepareShoot;

-(void) setAirPenguinBomb;
-(void) setToBombing:(float)_turtleX turtleY:(float)_turtleY;

-(void) manageCharacter;
-(void) manageWholeMovement;
-(void) manageAirPenguins;
-(void) manageDragonBalls;
//-(void) manageGameLevel;
-(void) manageInvicinble;
-(void) manageBombScript;
//-(void) manageMissionCheck;
-(void) manageMainTurtlePhysics;
-(void) manageThurstSound;
-(void) maangeCannon;
-(void) manageSpin;
-(void) manageBeginFlightOther;
-(void) manageShowTime:(ccTime)dt;

-(void) getUpgradedValues;
-(void) genOneAirPenguin;

//-(void) genOneAirPenguinDetect;

-(void) checkIfCollideWithThisAirPenguin:(int)_penguinIdx;
-(void) collideOnThisAirPenguin:(int)_penguinIdx;


-(void) checkIfCollideWithTargetBall;
-(void) checkIfCollideWithTargetPillar;
-(void) collideOnPillar;
-(void) collideOnBall:(float)_detectX DetectY:(float)_detectY;
-(void) breakTheBall:(bool)_isCollideFromBall;
-(void) pillarBreak:(int)_pillarIdx;

-(void) finishOneRound;
-(void) manageFinishedOneRound;
-(void) manageMissionCompletedShown;
-(void) initMissionSentense;
-(void) getMissionSentense:(int)_missionIdx;
-(void) finishOneRoundClick;
-(void) calMoneyGot;
-(int) calDigitDiffShow:(int)_diff;
-(float) calDigitDiffShow2:(float)_finalValue;

-(void) saveToDB_Begin;
-(void) saveToDB;
-(void) saveCompletedMissionDBByColIdx:(int)_colIdx;

-(void) setSlow:(int)_speed;
-(void) removeSlow;

-(void) setDragonAniAtX:(float)_x Y:(float)_y detectIdx:(int)_detectIdx;
-(void) manageDragonDetect;

-(void) tryToUseLightInvincible;
-(void) setHeavyInvincible;
-(void) setLightInvincible;
-(void) manageHeavyInvincible;
-(void) manageLightInvincible;
-(void) endHeavyInvincible;
-(void) endLightInvincible;

-(void) setScreenOffsetXFromExternal:(float)_offsetX;
-(void) setScreenOffsetYFromExternal:(float)_offsetY;

-(void) newMethodToDetectGenAirPenguins;

@end
