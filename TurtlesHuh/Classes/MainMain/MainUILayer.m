//
//  UILayer.m
//  BombTheTurtle
//
//  Created by  on 2012/4/13.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "MainUILayer.h"
#import "GamePlayGlobal.h"
#import "Global.h"
#import "MainGamePlayGlobal.h"

@implementation MainUILayer

-(void) setDelegate:(id)_delegate{
    delegate = _delegate;
}

-(void) initMenu{
    /*s_menu_resume = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(314/textureRatioForFuckingIpad, 1936/textureRatioForFuckingIpad, 422/textureRatioForFuckingIpad, 112/textureRatioForFuckingIpad)];
     s_menu_restart = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(738/textureRatioForFuckingIpad, 1936/textureRatioForFuckingIpad, 422/textureRatioForFuckingIpad, 112/textureRatioForFuckingIpad)];
     s_menu_exit = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1164/textureRatioForFuckingIpad, 1936/textureRatioForFuckingIpad, 422/textureRatioForFuckingIpad, 112/textureRatioForFuckingIpad)];
     
     [ss_Character addChild:s_menu_resume];
     [ss_Character addChild:s_menu_restart];
     [ss_Character addChild:s_menu_exit];
     
     [s_menu_resume setPosition:ccp(10000,10000)];
     [s_menu_restart setPosition:ccp(10000,10000)];
     [s_menu_exit setPosition:ccp(10000,10000)];*/
}

-(void) showMenu{
    isShowingMenu = true;
    
    [s_blackTranspancy_bg setPosition:ccp(0,0)];
    
    if(isIpad){
        [s_menu_resume setPosition:ccp([UIScreen mainScreen].bounds.size.height/2,[UIScreen mainScreen].bounds.size.width/2)];
    }else{
        [s_menu_resume setPosition:ccp([UIScreen mainScreen].bounds.size.height/2,240-80)];
    }
    
   // [s_menu_restart setPosition:ccp(240,160)];
   // [s_menu_exit setPosition:ccp(240,80)];
}

-(void) removeMenu{
    isShowingMenu = false;
    isStopping = false;
    [s_blackTranspancy_bg setPosition:ccp(10000,10000)];
    [s_menu_resume setPosition:ccp(10000,10000)];
    [s_menu_restart setPosition:ccp(10000,10000)];
    [s_menu_exit setPosition:ccp(10000,10000)];
}


-(void) initShowTime{
    isShowingTime = false;
    isRemovingTime = false;
    
    s_lowTime = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1096/textureRatioForFuckingIpad, 94/textureRatioForFuckingIpad, 118/textureRatioForFuckingIpad, 56/textureRatioForFuckingIpad)];
    s_timeDigit[0] = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad)];
    s_timeDigit[1] = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad)];
    s_timeDigit[2] = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad)];
    s_timeDigit[3] = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad)];
    s_timeDigit[4] = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad)];
    s_timeDigit[5] = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad)];
    
    [ss_Character addChild:s_lowTime z:kDeapth_Equip_Glide];
    [ss_Character addChild:s_timeDigit[0] z:kDeapth_Equip_Glide];
    [ss_Character addChild:s_timeDigit[1] z:kDeapth_Equip_Glide];
    [ss_Character addChild:s_timeDigit[2] z:kDeapth_Equip_Glide];
    [ss_Character addChild:s_timeDigit[3] z:kDeapth_Equip_Glide];
    [ss_Character addChild:s_timeDigit[4] z:kDeapth_Equip_Glide];
    [ss_Character addChild:s_timeDigit[5] z:kDeapth_Equip_Glide];
    
    [s_lowTime setPosition:ccp(10000,10000)];
    for(int i = 0 ; i < 6 ; i++){
        [s_timeDigit[i] setPosition:ccp(10000,10000)];
    }
    
    
    showTime_oriX = speedMeter->s_meter.position.x + 9 * 2/textureRatioForFuckingIpad;
    showTime_oriY = speedMeter->s_meter.position.y - 8 * 2/textureRatioForFuckingIpad;
    showTime_finalY = speedMeter->s_meter.position.y - 39 * 2/textureRatioForFuckingIpad;
    showTime_vy = 0;
    showTime_y = showTime_oriY;
    
}

-(void) setShowTime{
    if(isShowingTime){
        return;
    }
    
    isShowingTime = true;
    isRemovingTime = false;
    showingTimeTimer = 0;
    showTime_vy = 0;
}

-(void) removeShowTime{
    if(!isShowingTime){
        return;
    }
    
    isShowingTime = false;
    isRemovingTime = true;
    removingTimeTimer = 0;
}

-(void) manageShowTime{
     static float dx;
    
    if(isShowingTime){
     //   printf("showingTimeTimer::%i\n",showingTimeTimer);
        dx = showTime_finalY - showTime_y;
        /*showTime_ay = dx * 0.05;
        showTime_y += showTime_vy;
        showTime_vy += showTime_ay;
        showTime_vy *= 0.8;*/
        
        showTime_vy += -0.95;
        showTime_y += showTime_vy;
        if(showTime_y < showTime_finalY){
            showTime_y = showTime_finalY;
            showTime_vy *= -1;
            showTime_vy *= 0.8;
        }
        
        showingTimeTimer++;
    }
   
    if(isRemovingTime){
       // printf("isRemovingTime::%i\n",isRemovingTime);
        showTime_y += (showTime_oriY - showTime_y)/10.0;
        
        if(isRemovingTime == 90){
            isRemovingTime = false;
        }
        isRemovingTime++;
    }
    
    if(isShowingTime || isRemovingTime){
        minute = 0;
        
        currentMiniSecondTimeForCalFloat = timeChosenToDisplay;
        currentMinuteTimeForCalInt = (int)timeChosenToDisplay;
        
        currentMiniSecondTimeForCalFloat-=currentMinuteTimeForCalInt;
        
        while(currentMinuteTimeForCalInt>=60){
            currentMinuteTimeForCalInt -= 60;
            minute++;
        }
        second = currentMinuteTimeForCalInt;
        
        currentMiniSecondTimeForCalFloat*=100;
        minisecond = (int)currentMiniSecondTimeForCalFloat;
        
        if(minute >= 99){
            showTime_digit[0] = 9;
            showTime_digit[1] = 9;
        }else if(minute >= 10){
            showTime_digit[0] = minute/10;
            showTime_digit[1] = minute - showTime_digit[0] * 10;
        }else{
            showTime_digit[0] = 0;
            showTime_digit[1] = minute;
        }
        
        if(second >= 10){
            showTime_digit[2] = second/10;
            showTime_digit[3] = second - showTime_digit[2] * 10;
        }else{
            showTime_digit[2] = 0;
            showTime_digit[3] = second;
        }
         
        if(minisecond >= 10){
            showTime_digit[4] = minisecond/10;
            showTime_digit[5] = minisecond - showTime_digit[4 ] * 10;
        }else{
            showTime_digit[4] = 0;
            showTime_digit[5] = minisecond;
        }
        
        
        [s_lowTime setPosition:ccp(showTime_oriX,showTime_y)];
        [s_timeDigit[0] setPosition:ccp(showTime_oriX-18.5 * 2/textureRatioForFuckingIpad, showTime_y-3 * 2/textureRatioForFuckingIpad)];
        [s_timeDigit[1] setPosition:ccp(showTime_oriX-13 * 2/textureRatioForFuckingIpad,showTime_y-3 * 2/textureRatioForFuckingIpad)];
        [s_timeDigit[2] setPosition:ccp(showTime_oriX-3.5 * 2/textureRatioForFuckingIpad,showTime_y-3 * 2/textureRatioForFuckingIpad)];
        [s_timeDigit[3] setPosition:ccp(showTime_oriX+2 * 2/textureRatioForFuckingIpad,showTime_y-3 * 2/textureRatioForFuckingIpad)];
        [s_timeDigit[4] setPosition:ccp(showTime_oriX+12 * 2/textureRatioForFuckingIpad,showTime_y-3 * 2/textureRatioForFuckingIpad)];
        [s_timeDigit[5] setPosition:ccp(showTime_oriX+18 * 2/textureRatioForFuckingIpad,showTime_y-3 * 2/textureRatioForFuckingIpad)];
        
        for(int i = 0 ; i < 6 ; i++){
            [s_timeDigit[i] setTextureRect:CGRectMake(setDigitTextureX + showTime_digit[i] * setDigitOffsetX, setDigitTextureY, setDigitOffsetX, setDigitOffsetY)];
        }
        
    }
}


-(void) initSpeedMeter{
    speedMeter = malloc(sizeof(eSpeedMeter));
    
    speedMeter->s_meter =  [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(838/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad, 202/textureRatioForFuckingIpad, 144/textureRatioForFuckingIpad)];
    speedMeter->s_arrow =  [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1060/textureRatioForFuckingIpad, 18/textureRatioForFuckingIpad, 36/textureRatioForFuckingIpad, 94/textureRatioForFuckingIpad)];
    speedMeter->s_heightBar =  [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1042/textureRatioForFuckingIpad, 18/textureRatioForFuckingIpad, 14/textureRatioForFuckingIpad, 126/textureRatioForFuckingIpad)];
    speedMeter->s_heightBar2 =  [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1606/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad, 14/textureRatioForFuckingIpad, 126/textureRatioForFuckingIpad)];
    speedMeter->s_heightBar3 =  [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1624/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad, 14/textureRatioForFuckingIpad, 126/textureRatioForFuckingIpad)];
    speedMeter->s_glass =  [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1102/textureRatioForFuckingIpad, 18/textureRatioForFuckingIpad, 106/textureRatioForFuckingIpad, 70/textureRatioForFuckingIpad)];
    //speedMeter->s_redZoom =  [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1210/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad, 52/textureRatioForFuckingIpad, 72/textureRatioForFuckingIpad)];
    speedMeter->s_meterBehine =  [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1266/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad, 56/textureRatioForFuckingIpad, 122/textureRatioForFuckingIpad)];
    
   // [speedMeter->s_redZoom setAnchorPoint:ccp(0, 37.0/72.0)];
    [speedMeter->s_heightBar setAnchorPoint:ccp(0.5, 0.0)];
    [speedMeter->s_heightBar2 setAnchorPoint:ccp(0.5, 0.0)];
    [speedMeter->s_heightBar3 setAnchorPoint:ccp(0.5, 0.0)];
    [speedMeter->s_arrow setAnchorPoint:ccp(20.0/36.0, 55.0/94.0)];
    
    speedMeter->arrowAngle = 0;
    speedMeter->arrowFinalAngle = 0;
    

    [ss_Character addChild:speedMeter->s_meterBehine z:kDeapth_Top];
    [ss_Character addChild:speedMeter->s_heightBar z:kDeapth_Top];
    [ss_Character addChild:speedMeter->s_heightBar2 z:kDeapth_Top];
    [ss_Character addChild:speedMeter->s_heightBar3 z:kDeapth_Top];
    
    
    speedMeter->x = 55;
    speedMeter->y = 283;
    speedMeter->maxSpeedToDisplay = 10;
    
    if(isIpad){
        speedMeter->x *= 1024.0/480.0;
        speedMeter->y *= 768.0/320.0;
    }
    
    speedMeter->height_digitIdx = 0;
    speedMeter->height_idx = 0;
    speedMeter->height_howmnayTotal = 9;
    speedMeter->height_howmnayDigit = 4;
    
    
   // printf("speedMeter->x:%4.8f %4.8f\n",speedMeter->x,speedMeter->y);
    [speedMeter->s_meter setPosition:ccp(speedMeter->x,speedMeter->y)];
    [speedMeter->s_meterBehine setPosition:ccp(speedMeter->x-34 * 2/textureRatioForFuckingIpad,speedMeter->y)];
    
    for(int i = 0 ; i < speedMeter->height_howmnayTotal ; i++){
        
        speedMeter->height_s_indicator[i] = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1066/textureRatioForFuckingIpad, 114/textureRatioForFuckingIpad, 12/textureRatioForFuckingIpad, 3/textureRatioForFuckingIpad)];
        [ss_Character addChild:speedMeter->height_s_indicator[i] z:kDeapth_Top];
        [speedMeter->height_s_indicator[i] setPosition:ccp(10000,10000)];
        
        for(int j = 0 ; j < speedMeter->height_howmnayDigit ; j++){
            speedMeter->height_s_digit[i][j] = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad,0/textureRatioForFuckingIpad)];
            [ss_Character addChild:speedMeter->height_s_digit[i][j] z:kDeapth_Top];
            [speedMeter->height_s_digit[i][j] setPosition:ccp(10000,10000)];
        }
        
        speedMeter->height_digitDisplayDiff[i] = 5 * 2/textureRatioForFuckingIpad;
        speedMeter->height_x[i] =  speedMeter->x - 22 * 2/textureRatioForFuckingIpad;
        
        speedMeter->height_order[i] = i;
        speedMeter->height_orderBU[i] = i;
    }
    
    [ss_Character addChild:speedMeter->s_meter z:kDeapth_Top];
   // [ss_Character addChild:speedMeter->s_redZoom z:kDeapth_Top];
    [ss_Character addChild:speedMeter->s_arrow z:kDeapth_Top];
    [ss_Character addChild:speedMeter->s_glass z:kDeapth_Top];
    
    
    [speedMeter->s_arrow setPosition:ccp(speedMeter->x + 13 * 2/textureRatioForFuckingIpad,speedMeter->y)];
    [speedMeter->s_heightBar setPosition:ccp(speedMeter->x - 44 * 2/textureRatioForFuckingIpad,speedMeter->y - 32 * 2/textureRatioForFuckingIpad)];
    [speedMeter->s_heightBar2 setPosition:ccp(speedMeter->x - 44 * 2/textureRatioForFuckingIpad,speedMeter->y - 32 * 2/textureRatioForFuckingIpad)];
    [speedMeter->s_heightBar3 setPosition:ccp(speedMeter->x - 44 * 2/textureRatioForFuckingIpad,speedMeter->y - 32 * 2/textureRatioForFuckingIpad)];
    [speedMeter->s_glass setPosition:ccp(speedMeter->x + 13000,speedMeter->y + 9 * 2/textureRatioForFuckingIpad)];
    //[speedMeter->s_redZoom setPosition:ccp(speedMeter->x + 13,speedMeter->y)];
    
    speedMeter->isNextDigitShown = false;
    //speedMeter->height_digitDiff = 20;
    speedMeter->height_indicatorDiff = 10 * 2/textureRatioForFuckingIpad;
    speedMeter->height_digitDiff = speedMeter->height_indicatorDiff ;
    speedMeter->height_lowIdx = 0;
    //speedMeter->height_preLowIdx = 1;
    speedMeter->height_topIdx = speedMeter->height_howmnayTotal - 1;
   // speedMeter->height_preTopIdx = speedMeter->height_howmnayTotal - 2;
    speedMeter->height_bottomY =  speedMeter->y - 4 * speedMeter->height_indicatorDiff - speedMeter->height_indicatorDiff/2;
    speedMeter->height_topY =  speedMeter->y + 4 * speedMeter->height_indicatorDiff + speedMeter->height_indicatorDiff/2;
    
    
    static int hieghtYDiff;
    static int hieghtYDiff2;
    hieghtYDiff = characterY * characterYRealityRatio;
    hieghtYDiff2 = hieghtYDiff;
    
    speedMeter->height_showingValue = 0;
    while (hieghtYDiff >= speedMeter->height_indicatorDiff){
        hieghtYDiff -= speedMeter->height_indicatorDiff;
        speedMeter->height_digitIdx++;
    }
    
    while (hieghtYDiff2 >= speedMeter->height_indicatorDiff){
        hieghtYDiff2 -= speedMeter->height_indicatorDiff;
        speedMeter->height_showingValue += speedMeter->height_indicatorDiff;
    }
    
    
    speedMeter->height_y[8] = speedMeter->y + speedMeter->height_indicatorDiff * 4;
    speedMeter->height_y[7] = speedMeter->y + speedMeter->height_indicatorDiff * 3;
    speedMeter->height_y[6] = speedMeter->y + speedMeter->height_indicatorDiff * 2;
    speedMeter->height_y[5] = speedMeter->y + speedMeter->height_indicatorDiff;
    speedMeter->height_y[4] = speedMeter->y;
    speedMeter->height_y[3] =  speedMeter->y - speedMeter->height_indicatorDiff * 1;
    speedMeter->height_y[2] =  speedMeter->y - speedMeter->height_indicatorDiff * 2;
    speedMeter->height_y[1] =  speedMeter->y - speedMeter->height_indicatorDiff * 3;
    speedMeter->height_y[0] =  speedMeter->y - speedMeter->height_indicatorDiff * 4;
    
   // for(int i = 0 ; i < 10 ; i++){
   //     printf("speedMeter->height_y[0]:%i %4.8f RY:%4.8f %4.8f\n", i , speedMeter->height_y[i],characterY * characterYRealityRatio, speedMeter->height_showingValue);
   // }
    
    //printf("speedMeter->height_bottomY:%4.8f speedMeter->height_digitIdx:%i\n",speedMeter->height_bottomY, speedMeter->height_digitIdx);
    
    /*[self setHeightDigitFor:speedMeter->height_digitIdx heightIdx:1 heightIsIncreasing:false  assignDiffIdx:0];
    [self setHeightDigitFor:speedMeter->height_digitIdx heightIdx:3 heightIsIncreasing:false  assignDiffIdx:1];
    [self setHeightDigitFor:speedMeter->height_digitIdx heightIdx:5 heightIsIncreasing:false  assignDiffIdx:2];
    [self setHeightDigitFor:speedMeter->height_digitIdx heightIdx:7 heightIsIncreasing:false  assignDiffIdx:3];*/
    
    /*speedMeter->height_digitIdx -= 2;
    [self setHeightDigitFor:speedMeter->height_digitIdx heightIdx:0 heightIsIncreasing:false  assignDiffIdx:0];
    [self setHeightDigitFor:speedMeter->height_digitIdx heightIdx:2 heightIsIncreasing:false  assignDiffIdx:1];
    [self setHeightDigitFor:speedMeter->height_digitIdx heightIdx:4 heightIsIncreasing:false  assignDiffIdx:2];
    [self setHeightDigitFor:speedMeter->height_digitIdx heightIdx:6 heightIsIncreasing:false  assignDiffIdx:3];
    [self setHeightDigitFor:speedMeter->height_digitIdx heightIdx:8 heightIsIncreasing:false  assignDiffIdx:4];*/
    [self setHeightDigitFor:speedMeter->height_digitIdx heightIdx:0 heightIsIncreasing:false  assignDiffIdx:-4];
    [self setHeightDigitFor:speedMeter->height_digitIdx heightIdx:2 heightIsIncreasing:false  assignDiffIdx:-2];
    [self setHeightDigitFor:speedMeter->height_digitIdx heightIdx:4 heightIsIncreasing:false  assignDiffIdx:0];
    [self setHeightDigitFor:speedMeter->height_digitIdx heightIdx:6 heightIsIncreasing:false  assignDiffIdx:2];
    [self setHeightDigitFor:speedMeter->height_digitIdx heightIdx:8 heightIsIncreasing:false  assignDiffIdx:4];

    
    
    [self manageSpeedMeter];
    
}

-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
        
        timeRemain = 0;
        maxTime = 100;
        redFlame_scale = 1.0;
        
        timeBarOffsetX = 7 * 2/textureRatioForFuckingIpad;
        comboOffsetX = 5 * 2/textureRatioForFuckingIpad;
        
          setDigitTextureX = 521 * 2/textureRatioForFuckingIpad;
          setDigitTextureY = 0 * 2/textureRatioForFuckingIpad;
          setDigitOffsetX = 6 * 2/textureRatioForFuckingIpad;
          setDigitOffsetY = 8 * 2/textureRatioForFuckingIpad;
        
        turtleCoinShinning_angleSpeed = 0.0;
        turtleCoinShinningOpacity = 255;
        turtleCoin_displayCurrent = -1;
        [self initUI];
        [self initMenu];
        [self initSpeedMeter];
        [self initShowTime];
       
        
        timeBarBlood_isEnding = false;
        
    }
	return self;
}



-(void) initPlusTime{
    s_plusTime = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1170/textureRatioForFuckingIpad, 370/textureRatioForFuckingIpad, 244/textureRatioForFuckingIpad, 76/textureRatioForFuckingIpad)];
    
    [ss_Character addChild:s_plusTime z:kDeapth_Top];
    
    [s_plusTime setPosition:ccp(100000,10000)];
    
    isAniPlusTime = false;
}

-(void) setPlusTimeAni{
    [musicController playThisSound:kSound_ComboTime isLoop:NO gain:0.5];
    
    if(currentChosenMiniGame == 10 || currentChosenMiniGame == 3){
        return;
    }
    
    isAniPlusTime = true;
    plusTimeTimer = 0;
}

-(void) initUI{
    [self initTimeBar];
   // [self initTurtleCoin];
    //[self initTimeBar];
    [self initPlusTime];
    
    s_btn_Stop = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1706/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad, 91/textureRatioForFuckingIpad, 88/textureRatioForFuckingIpad)];
    
    [ss_Character addChild:s_btn_Stop z:kDeapth_Top];
    
    [s_btn_Stop setPosition:ccp(445,284)];
    
    if(isIpad){
        [s_btn_Stop setPosition:ccp(445 * 1024.0/480.0, 284 * 768.0/320.0)];
        
    }
    
    if(isIphone5){
        [s_btn_Stop setPosition:ccp(445+88, 284)];
    }
}


-(void) initTimeBar{
    redFlame_isAni = false;
    
    s_timeBar_Icon = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1310/textureRatioForFuckingIpad, 1744/textureRatioForFuckingIpad, 80/textureRatioForFuckingIpad, 104/textureRatioForFuckingIpad)];
    
    
    s_timeBar_Bar = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1536/textureRatioForFuckingIpad, 870/textureRatioForFuckingIpad, 258/textureRatioForFuckingIpad, 70/textureRatioForFuckingIpad)];
    s_timeBar_BarLife = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1540/textureRatioForFuckingIpad, 802/textureRatioForFuckingIpad, 212/textureRatioForFuckingIpad, 64/textureRatioForFuckingIpad)];
    s_timeBar_BarLifeLeft = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1516/textureRatioForFuckingIpad, 802/textureRatioForFuckingIpad, 20/textureRatioForFuckingIpad, 64/textureRatioForFuckingIpad)];
    
    s_timeBar_BarLeft_Blood = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad)];
    s_timeBar_BarLife_Blood = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad)];
    
    
    [ss_Character addChild:s_timeBar_Bar z:kDeapth_Top];
    [ss_Character addChild:s_timeBar_BarLife z:kDeapth_Top];
    [ss_Character addChild:s_timeBar_BarLifeLeft z:kDeapth_Top];
    [ss_Character addChild:s_timeBar_BarLeft_Blood z:kDeapth_Top];
    [ss_Character addChild:s_timeBar_BarLife_Blood z:kDeapth_Top];
   [ss_Character addChild:s_timeBar_Icon z:kDeapth_Top];
    
    
    [s_timeBar_BarLife setAnchorPoint:ccp(0,0.5)];
    [s_timeBar_BarLifeLeft setAnchorPoint:ccp(1,0.5)];
    [s_timeBar_Bar setAnchorPoint:ccp(0,0.5)];
    [s_timeBar_BarLeft_Blood setAnchorPoint:ccp(1,0.5)];
    [s_timeBar_BarLife_Blood setAnchorPoint:ccp(0,0.5)];
    
   // timeBar_posX = 134 + timeBarOffsetX + 105 - 90 + 65;
    timeBar_posX = 135;
    timeBar_posY = 290;
    
    if(isIpad){
        timeBar_posX *= 1024.0/480.0;
        timeBar_posY *= 768.0/320.0;
    }
    
    //[s_timeBar_BarLife setPosition:ccp(timeBar_posX , timeBar_posY)];
    [s_timeBar_Bar setPosition:ccp(timeBar_posX-11 , timeBar_posY-4)];
    [s_timeBar_BarLifeLeft setPosition:ccp(timeBar_posX , timeBar_posY-4)];
    [s_timeBar_BarLife setPosition:ccp(timeBar_posX-1 , timeBar_posY-4)];
    
    [s_timeBar_BarLeft_Blood setPosition:ccp(10000 , timeBar_posY)];
    [s_timeBar_BarLife_Blood setPosition:ccp(10000 , timeBar_posY)];
    
    timeBar_BarLifeLength = 212/2 * 2/textureRatioForFuckingIpad;
    timeRemainPercentage = 1.0;
    timeRemainPercentageShow = 0.0;
    timeBarIcon_finalX = timeBar_posX + timeBar_BarLifeLength * 0;
    timeBarIcon_showX = timeBarIcon_finalX;
    
    [s_timeBar_BarLife setScaleX:0.0];
    
    [s_timeBar_Icon setPosition:ccp(timeBar_posX + timeBar_BarLifeLength * 0 , timeBar_posY)];
    
    [s_timeBar_Bar setScaleX:1.0];
    
}


-(void) initTurtleCoin{
    //turtlCoinText_textureX = 80/2;
    //turtlCoinText_textureY = 320/2;
    //turtlCoinText_width = 30/2;
    // turtlCoinText_height = 36/2;
    
    turtlCoinText_textureX = 786/textureRatioForFuckingIpad;
    turtlCoinText_textureY = 278/textureRatioForFuckingIpad;
    turtlCoinText_width = 36/textureRatioForFuckingIpad;
    turtlCoinText_height = 42/textureRatioForFuckingIpad;
    
    //s_turtleCoin = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1928/textureRatioForFuckingIpad, 162/textureRatioForFuckingIpad, 96/textureRatioForFuckingIpad, 97/textureRatioForFuckingIpad)];
    s_turtleCoin = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1872/textureRatioForFuckingIpad, 1536/textureRatioForFuckingIpad, 120/textureRatioForFuckingIpad, 122/textureRatioForFuckingIpad)];
    // s_turtleCoin = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1560/textureRatioForFuckingIpad, 494/textureRatioForFuckingIpad, 92/textureRatioForFuckingIpad, 94/textureRatioForFuckingIpad)];
    s_turtleCoinShine = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1934/textureRatioForFuckingIpad, 260/textureRatioForFuckingIpad, 49/textureRatioForFuckingIpad, 48/textureRatioForFuckingIpad)];
    
   // [s_turtleCoin setScale:1.15];
    
    s_turtleCoinText[0] = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad)];
    s_turtleCoinText[1] = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad)];
    s_turtleCoinText[2] = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad)];
    s_turtleCoinText[3] = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad)];
    
    [ss_Character addChild:s_turtleCoin z:kDeapth_Top];
    [ss_Character addChild:s_turtleCoinShine z:kDeapth_Top];
    [ss_Character addChild:s_turtleCoinText[0] z:kDeapth_Top];
    [ss_Character addChild:s_turtleCoinText[1] z:kDeapth_Top];
    [ss_Character addChild:s_turtleCoinText[2] z:kDeapth_Top];
    [ss_Character addChild:s_turtleCoinText[3] z:kDeapth_Top];
    
    //[s_turtleCoin setPosition:ccp(40+341-90-145,285)];
    [s_turtleCoin setPosition:ccp(385,285)];
    [s_turtleCoinText[0] setPosition:ccp(45+340-200 , 280)];
    
    
    turtleCoinX = s_turtleCoin.position.x + 1;
    turtleCoinY = s_turtleCoin.position.y - 18;
    
    turtleCoin_displayCurrentTimer = 9999;
    turtleCoin_startToDisplay = true;
    
    
    
    [s_turtleCoinShine setPosition:ccp(s_turtleCoin.position.x + 1 + 21 * cos(-90*M_PI/180) + 99999, s_turtleCoin.position.y - 1 + 21 * sin(-90*M_PI/180))];
    
    [s_turtleCoinText[1] setPosition:ccp(45000 , 280)];
    [s_turtleCoinText[2] setPosition:ccp(45000 , 280)];
    [s_turtleCoinText[3] setPosition:ccp(45000 , 280)];
}

-(void) manageSpeedMeter{
   // printf("manageSpeedMeter:%4.8f %4.8f %4.8f %4.8f\n",characterRealY, speedMeter->height_s_indicator[0].position.x, speedMeter->height_s_indicator[0].position.y, speedMeter->height_y[0]);
    if(characterFuelRemain >= 200){
        [speedMeter->s_heightBar setScaleY:1.0];
        [speedMeter->s_heightBar2 setScaleY:1.0];
        [speedMeter->s_heightBar3 setScaleY:(characterFuelRemain - 200.0)/100.0];
    }else if(characterFuelRemain >= 100){
        [speedMeter->s_heightBar setScaleY:1.0];
        [speedMeter->s_heightBar2 setScaleY:(characterFuelRemain - 100.0)/100.0];
        [speedMeter->s_heightBar3 setScaleY:0.0];
    }else{
        [speedMeter->s_heightBar setScaleY:characterFuelRemain/100.0];
        [speedMeter->s_heightBar2 setScaleY:0.0];
        [speedMeter->s_heightBar3 setScaleY:0.0];
    }
    
    
    static float minAngle = 48;
    static float maxAngle = 312;
    static float diffAngle = 264;
    static float maxSpeedForDisplay = 20.0;
    
    record_speed = characterVelocity/maxSpeedForDisplay * 90.0;
    //printf("record_speed:%4.8f\n",record_speed);

    speedMeter->arrowFinalAngle = minAngle + diffAngle * characterVelocity / maxSpeedForDisplay;
    if(speedMeter->arrowFinalAngle > maxAngle){
        speedMeter->arrowFinalAngle = maxAngle;
    }
    speedMeter->arrowAngle += (speedMeter->arrowFinalAngle - speedMeter->arrowAngle)/5.0;
    
    [speedMeter->s_arrow setRotation:speedMeter->arrowAngle];
    
    
    //HEIGHT
    static float heightShowingDiff;
    static float heightIsIncreasing;
    static int heightHasExcessNumber;
    heightShowingDiff = characterRealY - speedMeter->height_showingValue;
    if(heightShowingDiff > 0 ){
        heightIsIncreasing = true;
    }else{
        heightIsIncreasing = false;
    }
    
    heightHasExcessNumber = 0;
   // printf("heightShowingDiff:%4.8f %4.8f %4.8f %4.8f\n",heightShowingDiff, characterY, characterRealY, speedMeter->height_showingValue);
    for(int i = 0 ; i < speedMeter->height_howmnayTotal ; i++){
        speedMeter->height_y[i] += -heightShowingDiff;
    }
    speedMeter->height_showingValue = characterRealY;
    
    for(int i = 0 ; i < speedMeter->height_howmnayTotal ; i++){
        if(!heightIsIncreasing){
            if(speedMeter->height_y[i] >  speedMeter->height_topY){
              //  printf("DEGREASING:%i %4.8f %4.8f low:%i height:%i\n",i,speedMeter->height_y[i], speedMeter->height_bottomY, speedMeter->height_lowIdx, speedMeter->height_topIdx);
                
                if(speedMeter->isNextDigitShown){
                    speedMeter->height_digitIdx--;
                    [self setHeightDigitFor:speedMeter->height_digitIdx heightIdx:i heightIsIncreasing:false assignDiffIdx:-99999];
                    speedMeter->isNextDigitShown = false;
                }else{
                    //printf("SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS\n");
                    speedMeter->height_digitIdx--;
                    speedMeter->height_thisIndicatorIsShowingDigit[i] = false;
                    for(int j = 0 ; j < speedMeter->height_howmnayDigit ; j++){
                        [speedMeter->height_s_digit[i][j] setTextureRect:CGRectMake(0, 0, 0, 0)];
                    }
                    speedMeter->isNextDigitShown = true;
                }
                
                speedMeter->height_y[i] = speedMeter->height_y[speedMeter->height_lowIdx] - speedMeter->height_indicatorDiff;

                
                for(int j = 0 ; j < speedMeter->height_howmnayTotal-1 ; j++){
                    speedMeter->height_order[j+1] = speedMeter->height_orderBU[j];
                }
                speedMeter->height_order[0] = i;
                
                for(int j = 0 ; j < speedMeter->height_howmnayTotal ; j++){
                    speedMeter->height_orderBU[j] = speedMeter->height_order[j];
                }
                
                speedMeter->height_lowIdx = speedMeter->height_order[0];
                speedMeter->height_topIdx = speedMeter->height_order[speedMeter->height_howmnayTotal - 1];
                
            }
        }else{
            if(speedMeter->height_y[i] <  speedMeter->height_bottomY){
               // printf("increasing:%i %4.8f %4.8f low:%i height:%i\n",i,speedMeter->height_y[i], speedMeter->height_bottomY, speedMeter->height_lowIdx, speedMeter->height_topIdx);
                if(speedMeter->isNextDigitShown){
                    speedMeter->height_digitIdx++;
                    [self setHeightDigitFor:speedMeter->height_digitIdx heightIdx:i heightIsIncreasing:true assignDiffIdx:-99999];
                    speedMeter->isNextDigitShown = false;
                }else{
                   // printf("AAASSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS\n");
                    speedMeter->height_digitIdx++;
                    speedMeter->height_thisIndicatorIsShowingDigit[i] = false;
                    for(int j = 0 ; j < speedMeter->height_howmnayDigit ; j++){
                        [speedMeter->height_s_digit[i][j] setTextureRect:CGRectMake(0, 0, 0, 0)];
                    }
                    speedMeter->isNextDigitShown = true;
                }
                
              //   printf("increasing222:%i %4.8f %4.8f low:%i height:%i\n",i,speedMeter->height_y[i], speedMeter->height_bottomY, speedMeter->height_lowIdx, speedMeter->height_topIdx);
              //  printf("increasin3333:%4.8f %4.8f\n", speedMeter->height_y[speedMeter->height_topIdx], speedMeter->height_indicatorDiff);
                speedMeter->height_y[i] = speedMeter->height_y[speedMeter->height_topIdx] + speedMeter->height_indicatorDiff;

                
                for(int j = 0 ; j < speedMeter->height_howmnayTotal-1 ; j++){
                    speedMeter->height_order[j] = speedMeter->height_orderBU[j+1];
                }
                speedMeter->height_order[speedMeter->height_howmnayTotal - 1] = i;
                
                for(int j = 0 ; j < speedMeter->height_howmnayTotal ; j++){
                    speedMeter->height_orderBU[j] = speedMeter->height_order[j];
                }
                
                speedMeter->height_lowIdx = speedMeter->height_order[0];
                speedMeter->height_topIdx = speedMeter->height_order[speedMeter->height_howmnayTotal - 1];
                
            }
        }
    }
    
    for(int i = 0 ; i < speedMeter->height_howmnayTotal ; i++){
        [speedMeter->height_s_indicator[i] setPosition:ccp(speedMeter->height_x[i], speedMeter->height_y[i])];
        
        for(int j = 0 ; j < speedMeter->height_howmnayDigit ; j++){
            [speedMeter->height_s_digit[i][j] setPosition:ccp(speedMeter->height_digit_x[i] + j * speedMeter->height_digitDisplayDiff[i], speedMeter->height_y[i])];
            [speedMeter->height_s_digit[i][j] setScaleY:1.0];
            
          //  printf("i:%i %i %4.8f %4.8f\n",i,j, speedMeter->height_s_digit[i][j].position.x, speedMeter->height_s_digit[i][j].position.y);
        } 
        
        static float heightYScale;
        static float yHeightDiff;
        yHeightDiff = speedMeter->height_y[i] - speedMeter->y;
        
        [speedMeter->height_s_indicator[i] setScaleY:1.0];
        if(yHeightDiff > 31 * 2/textureRatioForFuckingIpad){
            heightYScale = (-yHeightDiff + 34.0)/3.0;
            if(heightYScale < 0){
                heightYScale = 0;
            }
            
            [speedMeter->height_s_indicator[i] setScaleY:heightYScale];
            for(int j = 0 ; j < speedMeter->height_howmnayDigit ; j++){
                [speedMeter->height_s_digit[i][j] setScaleY:heightYScale];
            } 
        }
        if(yHeightDiff < -31 * 2/textureRatioForFuckingIpad){
            heightYScale = (yHeightDiff + 34.0)/3.0;
            if(heightYScale < 0){
                heightYScale = 0;
            }
            
            [speedMeter->height_s_indicator[i] setScaleY:heightYScale];
            for(int j = 0 ; j < speedMeter->height_howmnayDigit ; j++){
                [speedMeter->height_s_digit[i][j] setScaleY:heightYScale];
            } 
        }

    }
}

-(void) setHeightDigitFor:(int)_digitIdx heightIdx:(int)_heightIdx heightIsIncreasing:(bool) _isIncreasing assignDiffIdx:(int)_assign{
    
    static int setNumber;
    
    if(_assign != -99999){
        setNumber = _digitIdx * speedMeter->height_digitDiff + speedMeter->height_digitDiff * _assign;
    }else{
        if(_isIncreasing){
            setNumber = _digitIdx * speedMeter->height_digitDiff + speedMeter->height_digitDiff * 4;
        }else{
            setNumber = _digitIdx * speedMeter->height_digitDiff - speedMeter->height_digitDiff * 4;
        }
    }
    
   // setNumber -= minFloorY * characterYRealityRatio;
    
    //printf("setHeightDigitFor:%i setNumber:%i c:%4.8f\n",_digitIdx, setNumber, characterRealY);
    
    if(setNumber < 0){
        for(int j = 0 ; j < speedMeter->height_howmnayDigit ; j++){
            [speedMeter->height_s_digit[_heightIdx][j] setTextureRect:CGRectMake(0, 0, 0, 0)];
        } 
        return;
    }
    
    static int setFirstNumber;
    static int setSecondNumber;
    static int setThirdNumber;
    static int setForthNumber;
    
    speedMeter->height_digitDisplayDiff[_heightIdx] = 5.0 * 2/textureRatioForFuckingIpad;

    if(setNumber < 10){
        setFirstNumber = -1;
        setSecondNumber = -1;
        setThirdNumber = -1;
        setForthNumber = setNumber;
        speedMeter->height_digit_x[_heightIdx] = speedMeter->height_x[_heightIdx] - 25 * 2/textureRatioForFuckingIpad;
    }else if(setNumber < 100){
        setFirstNumber = -1;
        setSecondNumber = -1;
        setThirdNumber = setNumber/10;
        setForthNumber = setNumber - setThirdNumber * 10;
        speedMeter->height_digit_x[_heightIdx] = speedMeter->height_x[_heightIdx] - 19.5 * 2/textureRatioForFuckingIpad;
    }else if(setNumber < 1000){
        setFirstNumber = -1;
        setSecondNumber = setNumber/100;
        setThirdNumber = (setNumber - setSecondNumber * 100)/10;
        setForthNumber = setNumber - setSecondNumber * 100 - setThirdNumber * 10;
        speedMeter->height_digit_x[_heightIdx] = speedMeter->height_x[_heightIdx] - 17 * 2/textureRatioForFuckingIpad;
        
        speedMeter->height_digitDisplayDiff[_heightIdx] = 4.5 * 2/textureRatioForFuckingIpad;
        for(int j = 0 ; j < speedMeter->height_howmnayDigit ; j++){
            [speedMeter->height_s_digit[_heightIdx][j] setScale:0.93];
        }
        
    }else if(setNumber < 10000){
        setFirstNumber = setNumber/1000;
        setSecondNumber = (setNumber - setFirstNumber *1000)/100;
        setThirdNumber = (setNumber - setFirstNumber * 1000 - setSecondNumber * 100)/10;
        setForthNumber = setNumber - setFirstNumber * 1000 - setSecondNumber * 100 - setThirdNumber * 10;
        speedMeter->height_digit_x[_heightIdx] = speedMeter->height_x[_heightIdx] - 14 * 2/textureRatioForFuckingIpad;
        
        speedMeter->height_digitDisplayDiff[_heightIdx] = 3.5 * 2/textureRatioForFuckingIpad;
        for(int j = 0 ; j < speedMeter->height_howmnayDigit ; j++){
            [speedMeter->height_s_digit[_heightIdx][j] setScale:0.8];
        }
    }else{
        for(int j = 0 ; j < speedMeter->height_howmnayDigit ; j++){
            [speedMeter->height_s_digit[_heightIdx][j] setTextureRect:CGRectMake(0, 0, 0, 0)];
        }
        return;
    }
    
    // printf("_digitIdx:%i %i setNumber:%i %i %i %i %i\n",_digitIdx, _heightIdx, setNumber,setFirstNumber,setSecondNumber,setThirdNumber,setForthNumber);
  
   
    
    if(setFirstNumber >= 0){
        [speedMeter->height_s_digit[_heightIdx][0] setTextureRect:CGRectMake(setDigitTextureX + setFirstNumber * setDigitOffsetX, 
                                                                             setDigitTextureY, setDigitOffsetX, setDigitOffsetY)];
    }else{
        [speedMeter->height_s_digit[_heightIdx][0] setTextureRect:CGRectMake(0, 0, 0, 0)];
    }
    
    if(setSecondNumber >= 0){
        [speedMeter->height_s_digit[_heightIdx][1] setTextureRect:CGRectMake(setDigitTextureX + setSecondNumber * setDigitOffsetX, 
                                                                             setDigitTextureY, setDigitOffsetX, setDigitOffsetY)];
    }else{
        [speedMeter->height_s_digit[_heightIdx][1] setTextureRect:CGRectMake(0, 0, 0, 0)];
    }
    
    if(setThirdNumber >= 0){
        [speedMeter->height_s_digit[_heightIdx][2] setTextureRect:CGRectMake(setDigitTextureX + setThirdNumber * setDigitOffsetX, 
                                                                             setDigitTextureY, setDigitOffsetX, setDigitOffsetY)];
    }else{
        [speedMeter->height_s_digit[_heightIdx][2] setTextureRect:CGRectMake(0, 0, 0, 0)];
    }
    
    if(setForthNumber >= 0){
        [speedMeter->height_s_digit[_heightIdx][3] setTextureRect:CGRectMake(setDigitTextureX + setForthNumber * setDigitOffsetX, 
                                                                             setDigitTextureY, setDigitOffsetX, setDigitOffsetY)];
    }else{
        [speedMeter->height_s_digit[_heightIdx][3] setTextureRect:CGRectMake(0, 0, 0, 0)];
    }
    
   
    
    

    
}



-(void) manage:(ccTime) dt{
    //DELETE LATER
    if(currentTurtleCoin != record_hitted){
        turtleCoin_displayCurrentTimer = 0;
        turtleCoin_startToDisplay = true;
        currentTurtleCoin = record_hitted;
    }

    if(currentTurtleCoin < 10){
        turtleCoin_displayToHowmany[0] = currentTurtleCoin;
    }else  if(currentTurtleCoin < 100){
        turtleCoin_displayToHowmany[1] = currentTurtleCoin/10;
        turtleCoin_displayToHowmany[0] = currentTurtleCoin - turtleCoin_displayToHowmany[1] * 10;
    }else  if(currentTurtleCoin < 1000){
        turtleCoin_displayToHowmany[2] = currentTurtleCoin/100;
        turtleCoin_displayToHowmany[1] = (currentTurtleCoin - turtleCoin_displayToHowmany[2] * 100)/10;
        turtleCoin_displayToHowmany[0] = currentTurtleCoin - turtleCoin_displayToHowmany[2] * 100 - turtleCoin_displayToHowmany[1] * 10;
    }else{
        turtleCoin_displayToHowmany[3] = currentTurtleCoin/1000;
        turtleCoin_displayToHowmany[2] = (currentTurtleCoin - turtleCoin_displayToHowmany[3] * 1000)/100;
        turtleCoin_displayToHowmany[1] = (currentTurtleCoin - turtleCoin_displayToHowmany[3] * 1000 - turtleCoin_displayToHowmany[2] * 100)/10;
        turtleCoin_displayToHowmany[0] = currentTurtleCoin - turtleCoin_displayToHowmany[3] * 1000 - turtleCoin_displayToHowmany[2] * 100 - turtleCoin_displayToHowmany[1] * 10;
    }
    
    if(currentTurtleCoin < 10){
        [s_turtleCoinText[0] setTextureRect:CGRectMake(turtlCoinText_textureX + turtleCoin_displayToHowmany[0] * turtlCoinText_width, turtlCoinText_textureY, turtlCoinText_width, turtlCoinText_height)];
        [s_turtleCoinText[0] setPosition:ccp(turtleCoinX, turtleCoinY - 7)];
    }else if(currentTurtleCoin < 100){
        [s_turtleCoinText[0] setTextureRect:CGRectMake(turtlCoinText_textureX + turtleCoin_displayToHowmany[0] * turtlCoinText_width, turtlCoinText_textureY, turtlCoinText_width, turtlCoinText_height)];
        [s_turtleCoinText[0] setPosition:ccp(turtleCoinX + 10 -3, turtleCoinY - 7)];
        
        [s_turtleCoinText[1] setTextureRect:CGRectMake(turtlCoinText_textureX + turtleCoin_displayToHowmany[1] * turtlCoinText_width, turtlCoinText_textureY, turtlCoinText_width, turtlCoinText_height)];
        [s_turtleCoinText[1] setPosition:ccp(turtleCoinX - 5 -3, turtleCoinY - 7)];
    }else if(currentTurtleCoin < 1000){
        [s_turtleCoinText[0] setTextureRect:CGRectMake(turtlCoinText_textureX + turtleCoin_displayToHowmany[0] * turtlCoinText_width, turtlCoinText_textureY, turtlCoinText_width, turtlCoinText_height)];
        [s_turtleCoinText[0] setPosition:ccp(turtleCoinX + 17 - 3, turtleCoinY - 7)];
        
        [s_turtleCoinText[1] setTextureRect:CGRectMake(turtlCoinText_textureX + turtleCoin_displayToHowmany[1] * turtlCoinText_width, turtlCoinText_textureY, turtlCoinText_width, turtlCoinText_height)];
        [s_turtleCoinText[1] setPosition:ccp(turtleCoinX + 3 - 3, turtleCoinY - 7)];
        
        [s_turtleCoinText[2] setTextureRect:CGRectMake(turtlCoinText_textureX + turtleCoin_displayToHowmany[2] * turtlCoinText_width, turtlCoinText_textureY, turtlCoinText_width, turtlCoinText_height)];
        [s_turtleCoinText[2] setPosition:ccp(turtleCoinX - 12 - 3, turtleCoinY - 7)];
        
    }else if(currentTurtleCoin < 10000){
        [s_turtleCoinText[0] setTextureRect:CGRectMake(turtlCoinText_textureX + turtleCoin_displayToHowmany[0] * turtlCoinText_width, turtlCoinText_textureY, turtlCoinText_width, turtlCoinText_height)];
        [s_turtleCoinText[0] setPosition:ccp(turtleCoinX + 24 - 3, turtleCoinY - 7)];
        
        [s_turtleCoinText[1] setTextureRect:CGRectMake(turtlCoinText_textureX + turtleCoin_displayToHowmany[1] * turtlCoinText_width, turtlCoinText_textureY, turtlCoinText_width, turtlCoinText_height)];
        [s_turtleCoinText[1] setPosition:ccp(turtleCoinX + 10 - 3, turtleCoinY - 7)];
        
        [s_turtleCoinText[2] setTextureRect:CGRectMake(turtlCoinText_textureX + turtleCoin_displayToHowmany[2] * turtlCoinText_width, turtlCoinText_textureY, turtlCoinText_width, turtlCoinText_height)];
        [s_turtleCoinText[2] setPosition:ccp(turtleCoinX - 5 - 3, turtleCoinY - 7)];
        
        [s_turtleCoinText[3] setTextureRect:CGRectMake(turtlCoinText_textureX + turtleCoin_displayToHowmany[3] * turtlCoinText_width, turtlCoinText_textureY, turtlCoinText_width, turtlCoinText_height)];
        [s_turtleCoinText[3] setPosition:ccp(turtleCoinX - 19 - 3, turtleCoinY - 7)];
    }
    
    [self timeManage:dt];
    //[self turtleCoinDisplayManage];
    [self manageSpeedMeter];
    [self manageShowTime];
    
    return;
    
    /*[self manageSpeedMeter];
    [self timeManage:dt];
    [self comboManage:dt];
    [self turtleCoinDisplayManage];
    [self turtleCoinAniManage];
    [self plusTimeManage];*/
}

-(void) plusTimeManage{
    if(isAniPlusTime){
        if(plusTimeTimer == 0){
            plusTimeOpacity = 255;
            plusTimeSX = 0;
            plusTimeSY = 0;
            if(currentChosenMiniGame == 5){
                plusTimeX = 100;
                plusTimeY = 230;
            }else{
                plusTimeX = 230;
                plusTimeY = 250;
            }
            
            
        }
        
        if(plusTimeTimer < 10){
            plusTimeSX += 0.1;
            plusTimeSY += 0.1;
        }
        
        if(plusTimeTimer <= 18 && plusTimeTimer >= 10){
            plusTimeSX -= 0.02;
            plusTimeSY -= 0.02;
        }
        if(plusTimeTimer <= 25 && plusTimeTimer > 18){
            plusTimeSX += 0.02;
            plusTimeSY += 0.02;
        }
        if(plusTimeTimer <= 33 && plusTimeTimer > 25){
            plusTimeSX -= 0.02;
            plusTimeSY -= 0.02;
        }
        if(plusTimeTimer <= 41 && plusTimeTimer > 33){
            plusTimeSX += 0.02;
            plusTimeSY += 0.02;
        }
        if(plusTimeTimer <= 50 && plusTimeTimer > 41){
            plusTimeSX -= 0.02;
            plusTimeSY -= 0.02;
        }
        
        if(plusTimeTimer < 100 && plusTimeTimer > 50){
            plusTimeY += 7;
            plusTimeSX += 0.05;
            plusTimeSY += 0.05;
            plusTimeOpacity -= 22;
            if(plusTimeOpacity< 0){
                plusTimeOpacity = 0;
            }
        }
        
        [s_plusTime setPosition:ccp(plusTimeX,plusTimeY)];
        [s_plusTime setOpacity:plusTimeOpacity];
        [s_plusTime setScaleX:plusTimeSX];
        [s_plusTime setScaleY:plusTimeSY];
        
        if(plusTimeTimer == 100){
            [s_plusTime setPosition:ccp(10000,10000)];
            isAniPlusTime = false;
        }
        
        plusTimeTimer++;
    }
}

-(void) setRedFlameAni{
    redFlame_isAni = true;
    redFlame_aniTimer = 0;
}

-(void) timeManage:(ccTime) dt{
    timeRemainPercentage = timeRemain/maxTime;
    timeRemainPercentageShow += (timeRemainPercentage - timeRemainPercentageShow)/10;
    [s_timeBar_BarLife setScaleX:timeRemainPercentageShow];
    
    if(isBeginningHeavyInvincible){
        return;
    }
    
    if(redFlame_isAni){
        if(redFlame_aniTimer < 3){
            redFlame_scale += 0.3;
        }else{
            redFlame_scale += (1.0 - redFlame_scale)/6.0;
        }
        
        [s_timeBar_Icon setScale:redFlame_scale];
        
        if(redFlame_aniTimer == 30){
            redFlame_isAni = false;
        }
        
        redFlame_aniTimer++;
    }
    
    if(timeBarBlood_isAni){
        if(!isHeavyInvincible){
            
            timeBarBlood_Opacity = 0;
            
            if(timeBarBlood_Opacity <= 0){
                timeBarBlood_isAni = false;
                
                [s_timeBar_BarLeft_Blood setPosition:ccp(10000 , 12345)];
                [s_timeBar_BarLife_Blood setPosition:ccp(10000 , 12345)];
                
                timeBarIcon_finalX = timeBar_posX + timeBar_BarLifeLength * timeRemainPercentage;
                timeBarIcon_finalY = timeBar_posY;
                //[s_timeBar_Icon setPosition:ccp(timeBar_posX + timeBar_BarLifeLength * timeRemainPercentage, timeBar_posY)];
                [s_timeBar_Icon setRotation:0];
                [s_timeBar_Icon setScale:1.0];
                
                timeBarBlood_isEnding = true;
                timeBarBlood_endingTimer = 0;
            }   
        }else{
            if(isPlayingFastTimeOut){
                timeRunOut_Fast_Gain += 0.05;
                
                if(timeRunOut_Fast_Gain > 1){
                    timeRunOut_Fast_Gain = 1;
                }
                
                timeRunOut_Slow_Gain -= 0.05;
                
                if(timeRunOut_Slow_Gain < 0){
                    timeRunOut_Slow_Gain = 0;
                }
            }else{
                timeRunOut_Slow_Gain += 0.05;
                
                if(timeRunOut_Slow_Gain > 1){
                    timeRunOut_Slow_Gain = 1;
                }
                
                timeRunOut_Fast_Gain -= 0.05;
                
                if(timeRunOut_Fast_Gain < 0){
                    timeRunOut_Fast_Gain = 0;
                }
            }
            
        }
        
        if(timeRemainPercentage < 0.05){
            timeRunOut_Slow_Gain -= 0.05;
            timeRunOut_Fast_Gain -= 0.05;
        }
        

        [musicController changeGain:kSound_TimeRunOutSlow gain:timeRunOut_Slow_Gain * timeRunOut_Slow_MaxGain];
        [musicController changeGain:kSound_TimeRunOutFast gain:timeRunOut_Fast_Gain * timeRunOut_Fast_MaxGain];
        
        if(timeBarBlood_isDeceasingOpacity){
            timeBarBlood_Opacity -= 4;
            if(timeBarBlood_Opacity <= 0){
                timeBarBlood_Opacity = 0;
                timeBarBlood_isDeceasingOpacity = false;
            }
        }else{
            timeBarBlood_Opacity += 4;
            if(timeBarBlood_Opacity >= 255){
                timeBarBlood_Opacity = 255;
                timeBarBlood_isDeceasingOpacity = true;
            }
        }
        
        [s_timeBar_BarLife_Blood setScaleX:timeRemainPercentage*3.333333];
        
        [s_timeBar_BarLife_Blood setOpacity:timeBarBlood_Opacity];
        [s_timeBar_BarLeft_Blood setOpacity:timeBarBlood_Opacity];
        
        if(timeBarBlood_isDeceasingIconExtraScale){
            if(timeRemainPercentage < 0.2){
                timeBarBlood_iconExtraScale -= 8;
            }else{
                timeBarBlood_iconExtraScale -= 4;
            }
            
            if(timeBarBlood_iconExtraScale <= 0){
                timeBarBlood_iconExtraScale = 0;
                timeBarBlood_isDeceasingIconExtraScale = false;
            }
        }else{
            if(timeRemainPercentage < 0.2){
                timeBarBlood_iconExtraScale += 8;
            }else{
                timeBarBlood_iconExtraScale += 4;
            }
            
            if(timeBarBlood_iconExtraScale >= 255){
                timeBarBlood_iconExtraScale = 255;
                timeBarBlood_isDeceasingIconExtraScale = true;
            }
        }
        
        [s_timeBar_Icon setScale:1.0 + timeBarBlood_iconExtraScale/255 * 0.1];
        
        if(timeRemainPercentage < 0.2){
            if(timeBarBlood_aniTimer % 2 == 0){
                timeBarBlood_offsetX = arc4random()% 4 - 2;
                timeBarBlood_offsetY = arc4random()% 4 - 2;
                timeBarBlood_offsetRotation = arc4random()% 10 - 5; 
            } 
            
            if(prevTimeRemainPercentage >= 0.15){
                //printf("KKKKKKKKKKKK\n");
                isPlayingFastTimeOut = true;
            }
            
        }else{
            if(timeBarBlood_aniTimer % 3 == 0){
                timeBarBlood_offsetX = arc4random()% 3 - 1;
                timeBarBlood_offsetY = arc4random()% 3 - 1;
            } 
            if(timeBarBlood_aniTimer % 3 == 0){
                timeBarBlood_offsetRotation = arc4random()% 8 - 4; 
            } 
            
            if(prevTimeRemainPercentage < 0.15){
                // printf("KKKKKKKKKKKK 222\n");
                isPlayingFastTimeOut = false;
            }
        }
        
        
        timeBarIcon_finalX = timeBar_posX + timeBar_BarLifeLength * timeRemainPercentage + timeBarBlood_offsetX;
        timeBarIcon_finalY = timeBar_posY + timeBarBlood_offsetY;
        //[s_timeBar_Icon setPosition:ccp(timeBar_posX + timeBar_BarLifeLength * timeRemainPercentage + timeBarBlood_offsetX , timeBar_posY + timeBarBlood_offsetY)];
        [s_timeBar_Icon setRotation:timeBarBlood_offsetRotation];
        
        // printf("prevTimeRemainPercentage:%4.8f\n",prevTimeRemainPercentage);
        prevTimeRemainPercentage = timeRemainPercentage;
        timeBarBlood_aniTimer++;
        
    }else{
        if(timeRemainPercentage <= 0.4 && isHeavyInvincible){
            timeBarBlood_isAni = true;
            timeBarBlood_isDeceasingOpacity = true;
            timeBarBlood_Opacity = 0;
            
            [s_timeBar_BarLeft_Blood setPosition:ccp(timeBar_posX , timeBar_posY)];
            [s_timeBar_BarLife_Blood setPosition:ccp(timeBar_posX  , timeBar_posY)];
            
            [s_timeBar_BarLife_Blood setOpacity:timeBarBlood_Opacity];
            [s_timeBar_BarLeft_Blood setOpacity:timeBarBlood_Opacity];
            
            timeBarBlood_iconExtraScale = 0;
            timeBarBlood_isDeceasingIconExtraScale = false;
            
            timeBarBlood_aniTimer = 0;
            
            prevTimeRemainPercentage = 999;
            timeRunOut_Slow_Gain = 1;
            timeRunOut_Fast_Gain = 0.0;
            timeRunOut_Fast_MaxGain = 0.75;
            timeRunOut_Slow_MaxGain = 0.75;
            
            timeBarBlood_isEnding = false;
            
            
            //PLAY AT FIST IN PLAY SCENE INIT
            //  [musicController playThisSound:kSound_TimeRunOutSlow isLoop:YES gain:1.0 * timeRunOut_Slow_MaxGain];
            //  [musicController playThisSound:kSound_TimeRunOutFast isLoop:YES gain:0.0];
            
            isPlayingFastTimeOut = false;
        }else{
            if(timeBarBlood_isEnding){
                timeRunOut_Slow_Gain -= 0.1;
                timeRunOut_Fast_Gain -= 0.1;
                
                if(timeRunOut_Slow_Gain < 0){
                    timeRunOut_Slow_Gain = 0;
                }
                if(timeRunOut_Fast_Gain < 0){
                    timeRunOut_Fast_Gain = 0;
                }
                
                [s_timeBar_Icon setRotation:0];
                [s_timeBar_Icon setScale:1.0];
                
                [musicController changeGain:kSound_TimeRunOutSlow gain:timeRunOut_Slow_Gain * timeRunOut_Slow_MaxGain];
                [musicController changeGain:kSound_TimeRunOutFast gain:timeRunOut_Fast_Gain * timeRunOut_Fast_MaxGain];
                
                timeBarBlood_endingTimer++;
                if(timeBarBlood_endingTimer == 60){
                    timeBarBlood_isEnding = false;
                }
            }
           
        }
        
        timeBarIcon_finalX = timeBar_posX + timeBar_BarLifeLength * timeRemainPercentage;
       // printf("A:%4.8f\n",timeBarIcon_finalX);
        timeBarIcon_finalY = timeBar_posY;
        //[s_timeBar_Icon setPosition:ccp(timeBar_posX + timeBar_BarLifeLength * timeRemainPercentage , timeBar_posY)];
    }
    
    timeBarIcon_showX += (timeBarIcon_finalX - timeBarIcon_showX)/10;
    //printf("B:%4.8f\n",timeBarIcon_finalX);
    [s_timeBar_Icon setPosition:ccp(timeBarIcon_showX , timeBarIcon_finalY)];
    
}




-(void) turtleCoinDisplayManage{
    if(!turtleCoin_startToDisplay){
        return;
    }
    
    if(turtleCoin_displayCurrentTimer == 0){
        [s_turtleCoinText[0] setScaleY:0.93];
        [s_turtleCoinText[1] setScaleY:0.93];
    }
    if(turtleCoin_displayCurrentTimer == 1){
        [s_turtleCoinText[0] setScaleY:0.85];
        [s_turtleCoinText[1] setScaleY:0.85];
    }
    if(turtleCoin_displayCurrentTimer == 2){
        [s_turtleCoinText[0] setScaleY:0.68];
        [s_turtleCoinText[1] setScaleY:0.68];
    }
    if(turtleCoin_displayCurrentTimer == 3){
        [s_turtleCoinText[0] setScaleY:0.5];
        [s_turtleCoinText[1] setScaleY:0.5];
    }
    
    if(turtleCoin_displayCurrentTimer == 4){
        if(currentTurtleCoin < 10){
            turtleCoin_displayToHowmany[0] = currentTurtleCoin;
        }else  if(currentTurtleCoin < 100){
            turtleCoin_displayToHowmany[1] = currentTurtleCoin/10;
            turtleCoin_displayToHowmany[0] = currentTurtleCoin - turtleCoin_displayToHowmany[1] * 10;
        }else  if(currentTurtleCoin < 1000){
            turtleCoin_displayToHowmany[2] = currentTurtleCoin/100;
            turtleCoin_displayToHowmany[1] = (currentTurtleCoin - turtleCoin_displayToHowmany[2] * 100)/10;
            turtleCoin_displayToHowmany[0] = currentTurtleCoin - turtleCoin_displayToHowmany[2] * 100 - turtleCoin_displayToHowmany[1] * 10;
        }else{
            turtleCoin_displayToHowmany[3] = currentTurtleCoin/1000;
            turtleCoin_displayToHowmany[2] = (currentTurtleCoin - turtleCoin_displayToHowmany[3] * 1000)/100;
            turtleCoin_displayToHowmany[1] = (currentTurtleCoin - turtleCoin_displayToHowmany[3] * 1000 - turtleCoin_displayToHowmany[2] * 100)/10;
            turtleCoin_displayToHowmany[0] = currentTurtleCoin - turtleCoin_displayToHowmany[3] * 1000 - turtleCoin_displayToHowmany[2] * 100 - turtleCoin_displayToHowmany[1] * 10;
        }
        
        [s_turtleCoinText[0] setScaleY:1.2];
        [s_turtleCoinText[0] setScaleX:1.2];
        [s_turtleCoinText[1] setScaleY:1.2];
        [s_turtleCoinText[1] setScaleX:1.2];
        [s_turtleCoinText[2] setScaleY:1.2];
        [s_turtleCoinText[2] setScaleX:1.2];
        [s_turtleCoinText[3] setScaleY:1.2];
        [s_turtleCoinText[3] setScaleX:1.2];
    }
    
    
    if(turtleCoin_displayCurrentTimer == 5){
        [s_turtleCoinText[0] setScaleY:1.1];
        [s_turtleCoinText[0] setScaleX:1.1];
        [s_turtleCoinText[1] setScaleY:1.1];
        [s_turtleCoinText[1] setScaleX:1.1];
        [s_turtleCoinText[2] setScaleY:1.1];
        [s_turtleCoinText[2] setScaleX:1.1];
        [s_turtleCoinText[3] setScaleY:1.1];
        [s_turtleCoinText[3] setScaleX:1.1];
    }
    if(turtleCoin_displayCurrentTimer == 6){
        [s_turtleCoinText[0] setScaleY:1.05];
        [s_turtleCoinText[0] setScaleX:1.05];
        [s_turtleCoinText[1] setScaleY:1.05];
        [s_turtleCoinText[1] setScaleX:1.05];
        [s_turtleCoinText[2] setScaleY:1.05];
        [s_turtleCoinText[2] setScaleX:1.05];
        [s_turtleCoinText[3] setScaleY:1.05];
        [s_turtleCoinText[3] setScaleX:1.05];
    }
    if(turtleCoin_displayCurrentTimer == 7){
        [s_turtleCoinText[0] setScaleY:1.0];
        [s_turtleCoinText[0] setScaleX:1.0];
        [s_turtleCoinText[1] setScaleY:1.0];
        [s_turtleCoinText[1] setScaleX:1.0];
        [s_turtleCoinText[2] setScaleY:1.0];
        [s_turtleCoinText[2] setScaleX:1.0];
        [s_turtleCoinText[3] setScaleY:1.0];
        [s_turtleCoinText[3] setScaleX:1.0];
    }
    
    if(currentTurtleCoin < 10){
        [s_turtleCoinText[0] setTextureRect:CGRectMake(turtlCoinText_textureX + turtleCoin_displayToHowmany[0] * turtlCoinText_width, turtlCoinText_textureY, turtlCoinText_width, turtlCoinText_height)];
        [s_turtleCoinText[0] setPosition:ccp(turtleCoinX, turtleCoinY - 7)];
    }else if(currentTurtleCoin < 100){
        [s_turtleCoinText[0] setTextureRect:CGRectMake(turtlCoinText_textureX + turtleCoin_displayToHowmany[0] * turtlCoinText_width, turtlCoinText_textureY, turtlCoinText_width, turtlCoinText_height)];
        [s_turtleCoinText[0] setPosition:ccp(turtleCoinX + 10 -3, turtleCoinY - 7)];
        
        [s_turtleCoinText[1] setTextureRect:CGRectMake(turtlCoinText_textureX + turtleCoin_displayToHowmany[1] * turtlCoinText_width, turtlCoinText_textureY, turtlCoinText_width, turtlCoinText_height)];
        [s_turtleCoinText[1] setPosition:ccp(turtleCoinX - 5 -3, turtleCoinY - 7)];
    }else if(currentTurtleCoin < 1000){
        [s_turtleCoinText[0] setTextureRect:CGRectMake(turtlCoinText_textureX + turtleCoin_displayToHowmany[0] * turtlCoinText_width, turtlCoinText_textureY, turtlCoinText_width, turtlCoinText_height)];
        [s_turtleCoinText[0] setPosition:ccp(turtleCoinX + 17 - 3, turtleCoinY - 7)];
        
        [s_turtleCoinText[1] setTextureRect:CGRectMake(turtlCoinText_textureX + turtleCoin_displayToHowmany[1] * turtlCoinText_width, turtlCoinText_textureY, turtlCoinText_width, turtlCoinText_height)];
        [s_turtleCoinText[1] setPosition:ccp(turtleCoinX + 3 - 3, turtleCoinY - 7)];
        
        [s_turtleCoinText[2] setTextureRect:CGRectMake(turtlCoinText_textureX + turtleCoin_displayToHowmany[2] * turtlCoinText_width, turtlCoinText_textureY, turtlCoinText_width, turtlCoinText_height)];
        [s_turtleCoinText[2] setPosition:ccp(turtleCoinX - 12 - 3, turtleCoinY - 7)];
        
    }else if(currentTurtleCoin < 10000){
        [s_turtleCoinText[0] setTextureRect:CGRectMake(turtlCoinText_textureX + turtleCoin_displayToHowmany[0] * turtlCoinText_width, turtlCoinText_textureY, turtlCoinText_width, turtlCoinText_height)];
        [s_turtleCoinText[0] setPosition:ccp(turtleCoinX + 24 - 3, turtleCoinY - 7)];
        
        [s_turtleCoinText[1] setTextureRect:CGRectMake(turtlCoinText_textureX + turtleCoin_displayToHowmany[1] * turtlCoinText_width, turtlCoinText_textureY, turtlCoinText_width, turtlCoinText_height)];
        [s_turtleCoinText[1] setPosition:ccp(turtleCoinX + 10 - 3, turtleCoinY - 7)];
        
        [s_turtleCoinText[2] setTextureRect:CGRectMake(turtlCoinText_textureX + turtleCoin_displayToHowmany[2] * turtlCoinText_width, turtlCoinText_textureY, turtlCoinText_width, turtlCoinText_height)];
        [s_turtleCoinText[2] setPosition:ccp(turtleCoinX - 5 - 3, turtleCoinY - 7)];
        
        [s_turtleCoinText[3] setTextureRect:CGRectMake(turtlCoinText_textureX + turtleCoin_displayToHowmany[3] * turtlCoinText_width, turtlCoinText_textureY, turtlCoinText_width, turtlCoinText_height)];
        [s_turtleCoinText[3] setPosition:ccp(turtleCoinX - 19 - 3, turtleCoinY - 7)];
    }
    
    
    turtleCoin_displayCurrentTimer++;
    
    if(turtleCoin_displayCurrentTimer >= 30){
        turtleCoin_startToDisplay = false;
    }
    
}


-(void) turtleCoinAniManage{
    
    if(!turtleCoinAniStruct->isAni){
        return;
    }
    
    // printf("turtleCoinAniManage:%i\n",turtleCoinAniStruct->aniTimer);
    
    if( turtleCoinAniStruct->aniTimer > 26){
        turtleCoinAniStruct->aniTimer++;
        if( turtleCoinAniStruct->aniTimer > 26){
            turtleCoinAniStruct->isAni = false;
            for(int i = 0 ; i < turtleCoinAniStruct->numElements ; i++){
                [turtleCoinAniStruct->s_graphic[i] setPosition:ccp(10000,10000)];
            }
        }
        return;
    }
    
    if(turtleCoinAniStruct->aniTimer == 0){
        for(int i = 0 ; i <  turtleCoinAniStruct->numElements ; i++){
            ranNumber = arc4random()%100;
            turtleCoinAniStruct->vx[i] = (float)ranNumber/50.0;
            ranNumber = arc4random()%100;
            turtleCoinAniStruct->vy[i] = (float)ranNumber/30.0;
            ranNumber = arc4random()%100;
            turtleCoinAniStruct->rv[i] = (float)ranNumber/50.0;
            
            ranNumber = arc4random()%100;
            turtleCoinAniStruct->ov[i] = (float)ranNumber/20.0 + 10.0;
            
            if(arc4random()%2 == 0){
                turtleCoinAniStruct->rv[i] *= -1;
                turtleCoinAniStruct->vx[i] *= -1;
            }
            
            turtleCoinAniStruct->posX[i] = s_turtleCoinShine.position.x;
            turtleCoinAniStruct->posY[i] = s_turtleCoinShine.position.y;
            
            turtleCoinAniStruct->opacity[i] = 255;
        }
    }
    
    for(int i = 0 ; i <  turtleCoinAniStruct->numElements ; i++){
        [turtleCoinAniStruct->s_graphic[i] setPosition:ccp(turtleCoinAniStruct->posX[i], turtleCoinAniStruct->posY[i])];
        [turtleCoinAniStruct->s_graphic[i] setOpacity:turtleCoinAniStruct->opacity[i]];
        
        turtleCoinAniStruct->posX[i] += turtleCoinAniStruct->vx[i];
        turtleCoinAniStruct->posY[i] += turtleCoinAniStruct->vy[i];
        turtleCoinAniStruct->opacity[i] -= turtleCoinAniStruct->ov[i];
        
        if(turtleCoinAniStruct->opacity[i] < 0 ){
            turtleCoinAniStruct->opacity[i] = 0;
        }
        
        turtleCoinAniStruct->vy[i] -= 0.2;
    }
    
    
    turtleCoinAniStruct->aniTimer++;
}



-(bool) gainTime:(float)_time{
    timeRemain += _time;
    if( timeRemain >= maxTime){
        timeRemain = maxTime;
        return true;
    }
    
    return false;
}

-(bool) loseTime:(float)_time{
    if(timeRemain < 0){
        return false;
    }
    
    timeRemain -= _time;
    if( timeRemain <= 0){
        timeRemain = -0.05;
        return true;
    }
    
    return false;
}




-(void) setTurtleCoinAni{
    if(turtleCoinAniStruct->isAni){
        return;
    }
    
    // printf("setTurtleCoinAni\n");
    
    turtleCoinAniStruct->aniTimer = 0;
    turtleCoinAniStruct->isAni = true;
}

-(void) getOneTurtleDefeat{
  //  [self gainCoin:1];
}

- (void) dealloc
{
	printf("Main UI Layer Dealloc\n");
	[super dealloc];
}


@end
