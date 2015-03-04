//
//  UILayer.h
//  BombTheTurtle
//
//  Created by  on 2012/4/13.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

typedef struct sTurtleCoinAniStruct{
	CCSprite* s_graphic[10];
    float posX[10];
    float posY[10];
    float vx[10];
    float vy[10];
    float rv[10];
    float opacity[10];
    float ov[10];
    int aniTimer;
    bool isAni;
    int numElements;
}eTurtleCoinAniStruct;

@interface UILayer : CCNode {
    CCSprite* s_instruction;
    
    eTurtleCoinAniStruct* turtleCoinAniStruct;
    
    CCSprite* s_comboBar_text;
    CCSprite* s_comboBar_combo[4];
    CCSprite* s_comboBar_Icon;
    CCSprite* s_comboBar_Bar;
    CCSprite* s_comboBar_BarLifeLeft;
    CCSprite* s_comboBar_BarLife;
    float comboBar_posX;
    float comboBar_posY;
    float comboBar_BarLifeLength;
    float comboRemainPercentage;
    
    CCSprite* s_timeBar_text;
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
    
   // float comoboText_textureX;
   // float comoboText_textureY;
   // float comoboText_width;
   // float comoboText_height;
    int comboCoin_displayCurrent;
    int comboCoin_displayCurrentTimer;
     int comboCoin_disappearingTimer;
    bool comboCoin_startToDisplay;
    bool comboCoin_startToDisplay_Digit;
    bool comboCoin_startToDisplay_DigitEach[4];
    bool comboCoin_disappearing_Digit;
    int comboCoin_displayToHowmany;
    int comboCoin_displayToHowmany_Digit[4];
    float comboX;
    float comboY;
    float comboScaleX;
    float comboScaleY;
    
    int comboCoin_displayCurrentTimer_Digit;
    int comboCoin_displayCurrentTimer_DigitEach[4];
    bool comboCoin_Digit_changingDigit[4];
    float comboCoin_Digit_offsetX[4];
    float comboCoin_Digit_offsetY[4];
    float comboCoin_Digit_Opacity[4];
    
    bool turtleCoinShinning_isAni;
    int turtleCoinShinning_aniTimer;
    float turtleCoinShinningAngle;
    float turtleCoinShinningOpacity;
    //float turtleCoinShinning_angleSpeed;
   //  float trutleCoinShinningAnchorPotintX;
   //  float trutleCoinShinningAnchorPotintY;
    
    int ranNumber;
    
    
    int comboTextureX[11];
    int comboTextureY[11];
    int comboDigitTextureX[10][11];
    int comboDigitTextureY[11];
    int comboWidth[11];
    int comboHeight[11];
    int comboDigitWidth[11];
    int comboDigitHeight[11];
    
    
    
    bool isChangingComboLevel;
    float chaningComboLevelScale;
    int changingComboLevelTimer;
    float changingComboLevelOffsetX;
    
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
    
    

}

-(void) setDelegate:(id)_delegate;

-(void) initUI;
-(void) initTurtleCoin;
-(void) initTimeBar;
-(void) initComboBar;
-(void) initTurtleCoinAniStruct;
-(void) initComboColor;
-(void) initMenu;
-(void) initPlusTime;

-(void) manage:(ccTime) dt;
-(void) timeManage:(ccTime) dt;
-(void) comboManage:(ccTime) dt;
-(void) plusTimeManage;

-(void) turtleCoinDisplayManage;
-(void) turtleCoinShineManage;
-(void) turtleCoinAniManage;

-(void) gainCoin:(int)_coin;
-(void) gainCombo:(int)_combo;
-(void) lostCombo;

-(void) gainTime:(float)_time;

-(void) setPlusTimeAni;
-(void) setTurtleCoinShineAni;
-(void) setTurtleCoinAni;
-(void) setComboDigitValues;

//-(void) checkChangeComboColor;

-(void) showMenu;
-(void) removeMenu;

//-(void) showInstruction;
//-(void) removeInstruction;

-(void) getOneTurtleDefeat;

-(void) restart;

@end
