//
//  UILayer.h
//  BombTheTurtle
//
//  Created by  on 2012/4/13.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "UILayer.h"

typedef struct sSpeedMeter{
    CCSprite* s_meter;
    CCSprite* s_meterBehine;
    CCSprite* s_arrow;
    CCSprite* s_heightBar;
    CCSprite* s_heightBar2;
    CCSprite* s_heightBar3;
    CCSprite* s_glass;
    CCSprite* s_redZoom;
    
    float x;
    float y;
    float arrowAngle;
    float arrowFinalAngle;
    
    float maxSpeedToDisplay;
    
    int height_digitIdx;
    int height_idx;
    int height_howmnayTotal;
    int height_howmnayDigit;
    CCSprite* height_s_indicator[10];
    CCSprite* height_s_digit[10][4];
    
    float height_x[10];
    float height_y[10];
    float height_digit_x[10];
    //float height_digit_y[10];
    bool height_thisIndicatorIsShowingDigit[10];
    //float height_finalY[10];
    float height_showingValue;
    int height_topIdx;
    int height_lowIdx;
   // int height_preTopIdx;
   // int height_preLowIdx;
    float height_bottomY;
    float height_topY;
    float height_digitDiff;
    float height_indicatorDiff;
    float height_digitDisplayDiff[10];
    int height_order[10];
    int height_orderBU[10];
    
    bool isNextDigitShown;
    
}eSpeedMeter;

@interface MainUILayer : CCNode {
    eSpeedMeter* speedMeter;
    eTurtleCoinAniStruct* turtleCoinAniStruct;

    
   // CCSprite* s_timeBar_text;
    CCSprite* s_timeBar_Icon;
    CCSprite* s_timeBar_Bar;
    CCSprite* s_timeBar_BarLife;
    CCSprite* s_timeBar_BarLifeLeft;
    float timeBar_posX;
    float timeBar_posY;
    float timeBar_BarLifeLength;
    float timeRemainPercentage;
    float timeRemainPercentageShow;
    bool timeBarBlood_isAni;
    int timeBarBlood_aniTimer;
    float timeBarBlood_Opacity;
    bool timeBarBlood_isDeceasingOpacity;
    float timeBarBlood_iconExtraScale;
    bool timeBarBlood_isDeceasingIconExtraScale;
    int timeBarBlood_offsetX;
    int timeBarBlood_offsetY;
    int timeBarBlood_offsetRotation;
    
    float timeBarIcon_finalX;
    float timeBarIcon_finalY;
    float timeBarIcon_showX;
    
    CCSprite* s_timeBar_BarLeft_Blood;
    CCSprite* s_timeBar_BarLife_Blood;
    
    CCSprite* s_btn_Stop;
    CCSprite* s_turtleCoin;
    CCSprite* s_turtleCoinShine;
    
    CCSprite* s_turtleCoinText[4];
    float turtlCoinText_textureX;
    float turtlCoinText_textureY;
    float turtlCoinText_width;
    float turtlCoinText_height;
    int turtleCoin_displayCurrent;
    int turtleCoin_displayCurrentTimer;
    bool turtleCoin_startToDisplay;
    float turtleCoinX;
    float turtleCoinY;
    int turtleCoin_displayToHowmany[4];
    
      
      
    bool turtleCoinShinning_isAni;
    int turtleCoinShinning_aniTimer;
    float turtleCoinShinningAngle;
    float turtleCoinShinningOpacity;

    
    int ranNumber;

    
    CCSprite* s_plusTime;
    bool isAniPlusTime;
    int plusTimeTimer;
    float plusTimeX;
    float plusTimeY;
    float plusTimeSX;
    float plusTimeSY;
    float plusTimeOpacity;
    
    id delegate;
    
    int timeBarOffsetX;
    int comboOffsetX;
    
    float prevTimeRemainPercentage;
    bool isPlayingFastTimeOut;
    
    float finalTimeRemain;
    
    
    //NEW
    bool timeBarBlood_isEnding;
    int timeBarBlood_endingTimer;
    
    
    //SHOW TIME
    CCSprite* s_lowTime;
    CCSprite* s_timeDigit[6];
    int showTime_digit[6];
    bool isShowingTime;
    int showingTimeTimer;
    bool isRemovingTime;
    int removingTimeTimer;
    float showTime_oriX;
    float showTime_oriY;
    float showTime_finalY;
    float showTime_y;
    float showTime_vy;
    float showTime_ay;
    
    float minute;
    float second;
    float minisecond;
    float currentMiniSecondTimeForCalFloat;
    float currentMinuteTimeForCalInt;
    
    
     int setDigitTextureX;
     int setDigitTextureY;
     int setDigitOffsetX;
     int setDigitOffsetY;
    
    
    
   
    float redFlame_scale;
    bool redFlame_isAni;
    int redFlame_aniTimer;
}

-(void) setDelegate:(id)_delegate;

-(void) initUI;
-(void) initTurtleCoin;
-(void) initTimeBar;
-(void) initMenu;
-(void) initPlusTime;
-(void) initSpeedMeter;

-(void) manage:(ccTime) dt;
-(void) timeManage:(ccTime) dt;
-(void) plusTimeManage;
-(void) manageSpeedMeter;

-(void) turtleCoinDisplayManage;
//-(void) turtleCoinShineManage;
-(void) turtleCoinAniManage;

-(void) initShowTime;
-(void) setShowTime;
-(void) removeShowTime;
-(void) manageShowTime;


-(bool) gainTime:(float)_time;
-(bool) loseTime:(float)_time;

-(void) setPlusTimeAni;
-(void) setTurtleCoinAni;
//-(void) setComboDigitValues;

//-(void) checkChangeComboColor;

-(void) showMenu;
-(void) removeMenu;

-(void) setHeightDigitFor:(int)_digitIdx heightIdx:(int)_heightIdx heightIsIncreasing:(bool) _isIncreasing assignDiffIdx:(int)_assign;


-(void) getOneTurtleDefeat;

//-(void) restart;

-(void) setRedFlameAni;

@end
