//
//  UILayer.m
//  BombTheTurtle
//
//  Created by  on 2012/4/13.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "UILayer.h"
#import "GamePlayGlobal.h"
#import "Global.h"

@implementation UILayer

-(void) setDelegate:(id)_delegate{
    delegate = _delegate;
}

-(void) initMenu{
    /*s_menu_resume = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(314/2, 1936/2, 422/2, 112/2)];
    s_menu_restart = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(738/2, 1936/2, 422/2, 112/2)];
    s_menu_exit = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1164/2, 1936/2, 422/2, 112/2)];
    
    [ss_Character addChild:s_menu_resume];
    [ss_Character addChild:s_menu_restart];
    [ss_Character addChild:s_menu_exit];
    
    [s_menu_resume setPosition:ccp(10000,10000)];
    [s_menu_restart setPosition:ccp(10000,10000)];
    [s_menu_exit setPosition:ccp(10000,10000)];*/
}


-(void) showMenu{
    isShowingMenu = true;
    isShowingInstruction = false;
    [s_blackTranspancy_bg setPosition:ccp(0,0)];
    [s_menu_instruction setPosition:ccp([UIScreen mainScreen].bounds.size.height/2,270)];
    [s_menu_resume setPosition:ccp([UIScreen mainScreen].bounds.size.height/2,(270-50)/3*2+50)];
    [s_menu_restart setPosition:ccp([UIScreen mainScreen].bounds.size.height/2,(270-50)/3+50)];
    [s_menu_exit setPosition:ccp([UIScreen mainScreen].bounds.size.height/2,50)];
    
    if(isIpad){
        [s_menu_instruction setPosition:ccp([UIScreen mainScreen].bounds.size.height/2,650)];
        [s_menu_resume setPosition:ccp([UIScreen mainScreen].bounds.size.height/2,500)];
        [s_menu_restart setPosition:ccp([UIScreen mainScreen].bounds.size.height/2,350)];
        [s_menu_exit setPosition:ccp([UIScreen mainScreen].bounds.size.height/2,200)];
    }
    
}

-(void) removeMenu{
    isShowingMenu = false;
    isStopping = false;
    [s_menu_instruction setPosition:ccp(10000,10000)];
    [s_blackTranspancy_bg setPosition:ccp(10000,10000)];
    [s_menu_resume setPosition:ccp(10000,10000)];
    [s_menu_restart setPosition:ccp(10000,10000)];
    [s_menu_exit setPosition:ccp(10000,10000)];
}


-(void) restart{
    comboCoin_startToDisplay = false;
    comboCoin_startToDisplay_Digit = false;
    isChangingComboLevel = false;
    
    comboCoin_startToDisplay_DigitEach[0] = false;
    comboCoin_startToDisplay_DigitEach[1] = false;
    comboCoin_startToDisplay_DigitEach[2] = false;
    comboCoin_startToDisplay_DigitEach[3] = false;
    
    
    
    [s_comboBar_combo[0] setPosition:ccp(100000,10000)];
    [s_comboBar_combo[1] setPosition:ccp(100000,10000)];
    [s_comboBar_combo[2] setPosition:ccp(100000,10000)];
    [s_comboBar_combo[3] setPosition:ccp(100000,10000)];
    [s_comboBar_text setPosition:ccp(10000,100000)];
    [s_comboBar_Bar setPosition:ccp(10000,100000)];
    [s_comboBar_BarLife setPosition:ccp(10000,100000)];
    [s_comboBar_BarLifeLeft setPosition:ccp(10000,100000)];
    [s_comboBar_Icon setPosition:ccp(10000,100000)];
    
    [s_turtleCoinText[0] setPosition:ccp(45000 , 280)];
    [s_turtleCoinText[1] setPosition:ccp(45000 , 280)];
    [s_turtleCoinText[2] setPosition:ccp(45000 , 280)];
    [s_turtleCoinText[3] setPosition:ccp(45000 , 280)];
    
    [self gainCoin:0];

}

-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
        
        timeBarOffsetX = 7;
        comboOffsetX = 5;
        
        if(isIpad){
            timeBarOffsetX *= 2;
            comboOffsetX *= 2;
        }
        
        isChangingComboLevel = false;

        turtleCoinShinning_angleSpeed = 0.0;
        turtleCoinShinningOpacity = 255;
        turtleCoin_displayCurrent = -1;
        [self initUI];
        [self initMenu];
    
    }
	return self;
}

-(void) initTurtleCoinAniStruct{
    turtleCoinAniStruct = malloc(sizeof(eTurtleCoinAniStruct));
    turtleCoinAniStruct->numElements = 10;
    turtleCoinAniStruct->aniTimer = 0;
    turtleCoinAniStruct->isAni = false;
    
    for(int i = 0 ; i < turtleCoinAniStruct->numElements ; i++){
        turtleCoinAniStruct->s_graphic[i] = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1934/textureRatioForFuckingIpad, 260/textureRatioForFuckingIpad, 49/textureRatioForFuckingIpad, 48/textureRatioForFuckingIpad)];
        turtleCoinAniStruct->posX[i] = 99999;
        
        [ss_Character addChild:turtleCoinAniStruct->s_graphic[i] z:kDeapth_Top];
        [turtleCoinAniStruct->s_graphic[i] setPosition:ccp(10000,10000)];
    }
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
    [self initTurtleCoin];
    [self initTimeBar];
    [self initComboBar];
    [self initTurtleCoinAniStruct];
    [self initComboColor];
    [self initPlusTime];
    
    s_btn_Stop = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1270/textureRatioForFuckingIpad, 734/textureRatioForFuckingIpad, 91/textureRatioForFuckingIpad, 88/textureRatioForFuckingIpad)];
    
    [ss_Character addChild:s_btn_Stop z:kDeapth_Top];
    
    [s_btn_Stop setPosition:ccp([UIScreen mainScreen].bounds.size.height - 35, 284)];
    
    if(isIpad){
        [s_btn_Stop setPosition:ccp([UIScreen mainScreen].bounds.size.height - 70, 696)];
    }
}

-(void) initComboColor{
    
    changingComboLevelOffsetX = 0;
    
    comboTextureX[0] = 1438/textureRatioForFuckingIpad;
    comboTextureY[0] = 320/textureRatioForFuckingIpad;
    
    for(int j = 0 ; j < 10 ; j++){
        comboDigitTextureX[j][0] = 1540/textureRatioForFuckingIpad + 30/textureRatioForFuckingIpad * j;
    }
    comboDigitTextureY[0] = 320/textureRatioForFuckingIpad;
    
    
    for(int i = 1 ; i < 11; i++){
        comboTextureX[i] = 0;
        comboTextureY[i] = 560/textureRatioForFuckingIpad + 13*2/textureRatioForFuckingIpad * (i-1);
        
        comboDigitTextureY[i] = 370/textureRatioForFuckingIpad + 42/textureRatioForFuckingIpad * (i-1);
        for(int j = 0 ; j < 10 ; j++){
            comboDigitTextureX[j][i] = 160/textureRatioForFuckingIpad + 34/textureRatioForFuckingIpad * j;
        }
        
    }

    comboWidth[0] = 98/textureRatioForFuckingIpad;
    comboHeight[0] = 20/textureRatioForFuckingIpad;
    for(int i = 1 ; i < 11 ; i++){
        comboWidth[i] = 102/textureRatioForFuckingIpad;
        comboHeight[i] = 26/textureRatioForFuckingIpad;
    }
    
    comboDigitWidth[0] = 30/textureRatioForFuckingIpad;
    comboDigitHeight[0] = 36/textureRatioForFuckingIpad;
    for(int i = 1 ; i < 11 ; i++){
        comboDigitWidth[i] = 34/textureRatioForFuckingIpad;
        comboDigitHeight[i] = 42/textureRatioForFuckingIpad;
    }
}

-(void) initTimeBar{
    s_timeBar_Icon = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(0/textureRatioForFuckingIpad, 320/textureRatioForFuckingIpad, 79/textureRatioForFuckingIpad, 62/textureRatioForFuckingIpad)];
    //s_timeBar_text = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1834/textureRatioForFuckingIpad, 162/textureRatioForFuckingIpad, 69/textureRatioForFuckingIpad, 22/textureRatioForFuckingIpad)];
    s_timeBar_text = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(720/textureRatioForFuckingIpad, 732/textureRatioForFuckingIpad, 96/textureRatioForFuckingIpad, 30/textureRatioForFuckingIpad)];
    
    
    s_timeBar_Bar = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(382/textureRatioForFuckingIpad, 320/textureRatioForFuckingIpad, 400/textureRatioForFuckingIpad, 43/textureRatioForFuckingIpad)];
    s_timeBar_BarLife = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(810/textureRatioForFuckingIpad, 320/textureRatioForFuckingIpad, 357/textureRatioForFuckingIpad, 43/textureRatioForFuckingIpad)];
    s_timeBar_BarLifeLeft = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(784/textureRatioForFuckingIpad, 320/textureRatioForFuckingIpad, 23/textureRatioForFuckingIpad, 43/textureRatioForFuckingIpad)];
    
    s_timeBar_BarLeft_Blood = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1842/textureRatioForFuckingIpad, 320/textureRatioForFuckingIpad, 18/textureRatioForFuckingIpad, 43/textureRatioForFuckingIpad)];
    s_timeBar_BarLife_Blood = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1862/textureRatioForFuckingIpad, 320/textureRatioForFuckingIpad, 106/textureRatioForFuckingIpad, 43/textureRatioForFuckingIpad)];
    
    
    [ss_Character addChild:s_timeBar_Bar z:kDeapth_Top];
    [ss_Character addChild:s_timeBar_BarLife z:kDeapth_Top];
    [ss_Character addChild:s_timeBar_BarLifeLeft z:kDeapth_Top];
    [ss_Character addChild:s_timeBar_BarLeft_Blood z:kDeapth_Top];
    [ss_Character addChild:s_timeBar_BarLife_Blood z:kDeapth_Top];
    [ss_Character addChild:s_timeBar_text z:kDeapth_Top];
    [ss_Character addChild:s_timeBar_Icon z:kDeapth_Top];
    

    [s_timeBar_BarLife setAnchorPoint:ccp(0,0.5)];
    [s_timeBar_BarLifeLeft setAnchorPoint:ccp(1,0.5)];
    [s_timeBar_Bar setAnchorPoint:ccp(0,0.5)];
    [s_timeBar_BarLeft_Blood setAnchorPoint:ccp(1,0.5)];
    [s_timeBar_BarLife_Blood setAnchorPoint:ccp(0,0.5)];
   
    timeBar_posX = 134 + timeBarOffsetX;
    timeBar_posY = 290;
    
    if(isIpad){
        timeBar_posX = 134 * 2 + timeBarOffsetX;
        timeBar_posY = 702;
    }

    //[s_timeBar_BarLife setPosition:ccp(timeBar_posX , timeBar_posY)];
    [s_timeBar_Bar setPosition:ccp(timeBar_posX-11*2/textureRatioForFuckingIpad , timeBar_posY)];
    [s_timeBar_BarLifeLeft setPosition:ccp(timeBar_posX , timeBar_posY)];
    [s_timeBar_BarLife setPosition:ccp(timeBar_posX , timeBar_posY)];
    
    [s_timeBar_BarLeft_Blood setPosition:ccp(10000 , timeBar_posY)];
    [s_timeBar_BarLife_Blood setPosition:ccp(10000 , timeBar_posY)];
    
    timeBar_BarLifeLength = 357/textureRatioForFuckingIpad;
    timeRemainPercentage = 1.0;
    timeRemainPercentageShow = timeRemainPercentage;
    timeBarIcon_finalX = timeBar_posX + timeBar_BarLifeLength * timeRemainPercentage;
    timeBarIcon_showX = timeBarIcon_finalX;
    
    [s_timeBar_BarLife setScaleX:timeRemainPercentage];
    
    [s_timeBar_text setPosition:ccp(timeBar_posX - 38*2/textureRatioForFuckingIpad  , timeBar_posY)];
    [s_timeBar_Icon setPosition:ccp(timeBar_posX + timeBar_BarLifeLength * timeRemainPercentage , timeBar_posY)];
    
    if(currentChosenMiniGame == 10 || currentChosenMiniGame == 3){
        [s_timeBar_text setPosition:ccp(10000,10000)];
    }
    
}

-(void) initComboBar{
    //comoboText_textureX = 1540/2;
    //comoboText_textureY = 320/2;
   // comoboText_width = 30/2;
   // comoboText_height = 36/2;
    
    s_comboBar_text = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1438/textureRatioForFuckingIpad, 320/textureRatioForFuckingIpad, 98/textureRatioForFuckingIpad, 20/textureRatioForFuckingIpad)];
    s_comboBar_Icon = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(2000/textureRatioForFuckingIpad, 260/textureRatioForFuckingIpad, 32/textureRatioForFuckingIpad, 30/textureRatioForFuckingIpad)];
    s_comboBar_Bar = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1298/textureRatioForFuckingIpad, 320/textureRatioForFuckingIpad, 136/textureRatioForFuckingIpad, 22/textureRatioForFuckingIpad)];
    s_comboBar_BarLife = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1186/textureRatioForFuckingIpad, 320/textureRatioForFuckingIpad, 109/textureRatioForFuckingIpad, 22/textureRatioForFuckingIpad)];
    s_comboBar_BarLifeLeft = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1170/textureRatioForFuckingIpad, 320/textureRatioForFuckingIpad, 14/textureRatioForFuckingIpad, 22/textureRatioForFuckingIpad)];
    
    s_comboBar_combo[0] = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(0/2, 0/2, 0/2, 0/2)]; 
    s_comboBar_combo[1] = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(0/2, 0/2, 0/2, 0/2)]; 
    s_comboBar_combo[2] = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(0/2, 0/2, 0/2, 0/2)]; 
    s_comboBar_combo[3] = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(0/2, 0/2, 0/2, 0/2)]; 
    
    [s_comboBar_Bar setAnchorPoint:ccp(0,0.5)];
    [s_comboBar_BarLife setAnchorPoint:ccp(0,0.5)];
    [s_comboBar_BarLifeLeft setAnchorPoint:ccp(1,0.5)];
    
    [ss_Character addChild:s_comboBar_text z:kDeapth_Top];
    [ss_Character addChild:s_comboBar_Bar z:kDeapth_Top];
    [ss_Character addChild:s_comboBar_BarLife z:kDeapth_Top];
    [ss_Character addChild:s_comboBar_BarLifeLeft z:kDeapth_Top];
    [ss_Character addChild:s_comboBar_Icon z:kDeapth_Top];
    [ss_Character addChild:s_comboBar_combo[0] z:kDeapth_Top];
    [ss_Character addChild:s_comboBar_combo[1] z:kDeapth_Top];
    [ss_Character addChild:s_comboBar_combo[2] z:kDeapth_Top];
    [ss_Character addChild:s_comboBar_combo[3] z:kDeapth_Top];
    
    comboBar_posX = 347 + comboOffsetX;
    comboBar_posY = 270;
    comboX = comboBar_posX + 28;
    comboY = comboBar_posY + 14;
    
    if(isIpad){
        comboBar_posX = 347 * 2 + comboOffsetX;
        comboBar_posY = 668;
        comboX = comboBar_posX + 56;
        comboY = comboBar_posY + 28;
    }
    
    
    comboBar_BarLifeLength = 109/textureRatioForFuckingIpad;
    comboRemainPercentage = 0.0;
    comboRemain = 0.0;
   // [s_comboBar_BarLife setScaleX:comboRemainPercentage];
    
    [s_comboBar_text setPosition:ccp(comboX + 35*2/textureRatioForFuckingIpad , comboY + 20+10000)];
    [s_comboBar_Icon setPosition:ccp(comboBar_posX + comboBar_BarLifeLength * comboRemainPercentage , comboBar_posY+10000)];
    
    [s_comboBar_Bar setPosition:ccp(comboBar_posX-7*2/textureRatioForFuckingIpad , comboBar_posY+10000)];
    [s_comboBar_BarLifeLeft setPosition:ccp(comboBar_posX , comboBar_posY+10000)];
    [s_comboBar_BarLife setPosition:ccp(comboBar_posX , comboBar_posY+10000)];
    
    [s_comboBar_text setOpacity:255*0.9];
    
    [s_comboBar_combo[0] setPosition:ccp(100000,10000)];
    [s_comboBar_combo[1] setPosition:ccp(100000,10000)];
    [s_comboBar_combo[2] setPosition:ccp(100000,10000)];
    [s_comboBar_combo[3] setPosition:ccp(100000,10000)];
    [s_comboBar_text setPosition:ccp(10000,100000)];
    [s_comboBar_Bar setPosition:ccp(10000,100000)];
    [s_comboBar_BarLife setPosition:ccp(10000,100000)];
    [s_comboBar_BarLifeLeft setPosition:ccp(10000,100000)];
    [s_comboBar_Icon setPosition:ccp(10000,100000)];
}

-(void) initTurtleCoin{
    //turtlCoinText_textureX = 80/2;
    //turtlCoinText_textureY = 320/2;
    //turtlCoinText_width = 30/2;
   // turtlCoinText_height = 36/2;
    
    turtlCoinText_textureX = 820/textureRatioForFuckingIpad;
    turtlCoinText_textureY = 732/textureRatioForFuckingIpad;
    turtlCoinText_width = 36/textureRatioForFuckingIpad;
    turtlCoinText_height = 42/textureRatioForFuckingIpad;
    
    //s_turtleCoin = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1928/textureRatioForFuckingIpad, 162/textureRatioForFuckingIpad, 96/textureRatioForFuckingIpad, 97/textureRatioForFuckingIpad)];
    s_turtleCoin = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1560/textureRatioForFuckingIpad, 494/textureRatioForFuckingIpad, 104/textureRatioForFuckingIpad, 108/textureRatioForFuckingIpad)];
   // s_turtleCoin = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1560/textureRatioForFuckingIpad, 494/textureRatioForFuckingIpad, 92/textureRatioForFuckingIpad, 94/textureRatioForFuckingIpad)];
    s_turtleCoinShine = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1934/textureRatioForFuckingIpad, 260/textureRatioForFuckingIpad, 49/textureRatioForFuckingIpad, 48/textureRatioForFuckingIpad)];
    
    s_turtleCoinText[0] = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(0/2, 0/2, 0/2, 0/2)];
    s_turtleCoinText[1] = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(0/2, 0/2, 0/2, 0/2)];
    s_turtleCoinText[2] = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(0/2, 0/2, 0/2, 0/2)];
    s_turtleCoinText[3] = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(0/2, 0/2, 0/2, 0/2)];
    
    [ss_Character addChild:s_turtleCoin z:kDeapth_Top];
    [ss_Character addChild:s_turtleCoinShine z:kDeapth_Top];
    [ss_Character addChild:s_turtleCoinText[0] z:kDeapth_Top];
    [ss_Character addChild:s_turtleCoinText[1] z:kDeapth_Top];
    [ss_Character addChild:s_turtleCoinText[2] z:kDeapth_Top];
    [ss_Character addChild:s_turtleCoinText[3] z:kDeapth_Top];
    
    [s_turtleCoin setPosition:ccp(40,287)];
    [s_turtleCoinText[0] setPosition:ccp(45 , 280)];
    
    if(isIpad){
        [s_turtleCoin setPosition:ccp(80,702)];
        [s_turtleCoinText[0] setPosition:ccp(90 , 688)];
    }
    
    
    turtleCoinX = s_turtleCoin.position.x + 1;
    if (isIpad)
        turtleCoinY = s_turtleCoin.position.y - 50;
    else
        turtleCoinY = s_turtleCoin.position.y - 25;
    
    turtleCoin_displayCurrentTimer = 9999;
    turtleCoin_startToDisplay = true;
    


    [s_turtleCoinShine setPosition:ccp(s_turtleCoin.position.x + 1 + 21 * cos(-90*M_PI/180) + 99999, s_turtleCoin.position.y - 1 + 21 * sin(-90*M_PI/180))];
    
    
    [s_turtleCoinText[1] setPosition:ccp(45000 , 280)];
    [s_turtleCoinText[2] setPosition:ccp(45000 , 280)];
    [s_turtleCoinText[3] setPosition:ccp(45000 , 280)];
}

-(void) manage:(ccTime) dt{
    [self timeManage:dt];
    [self comboManage:dt];
    [self turtleCoinDisplayManage];
    //[self turtleCoinShineManage];
    [self turtleCoinAniManage];
    [self plusTimeManage];
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
                
                if(isIpad){
                    plusTimeX = 100 * 1024.0/480.0;
                    plusTimeY = 230 * 768.0/320.0;
                }
                
            }else{
                plusTimeX = 230;
                plusTimeY = 250;
                
                if(isIpad){
                    plusTimeX = 230 * 1024.0/480.0;
                    plusTimeY = 250 * 768.0/320.0;
                }
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

-(void) timeManage:(ccTime) dt{
    timeRemainPercentage = timeRemain/maxTime;
    timeRemainPercentageShow += (timeRemainPercentage - timeRemainPercentageShow)/10;
    [s_timeBar_BarLife setScaleX:timeRemainPercentageShow];
    
    if(timeBarBlood_isAni){
        if(timeRemainPercentage > 0.3){
            timeRunOut_Slow_Gain -= 0.05;
            timeRunOut_Fast_Gain -= 0.05;
            
            if(timeRunOut_Slow_Gain < 0){
                timeRunOut_Slow_Gain = 0;
            }
            if(timeRunOut_Fast_Gain < 0){
                timeRunOut_Fast_Gain = 0;
            }

            
            if(timeBarBlood_Opacity <= 0){
                timeBarBlood_isAni = false;
                
                [s_timeBar_BarLeft_Blood setPosition:ccp(10000 , comboBar_posY)];
                [s_timeBar_BarLife_Blood setPosition:ccp(10000 , comboBar_posY)];
                
                timeBarIcon_finalX = timeBar_posX + timeBar_BarLifeLength * timeRemainPercentage;
                timeBarIcon_finalY = timeBar_posY;
                //[s_timeBar_Icon setPosition:ccp(timeBar_posX + timeBar_BarLifeLength * timeRemainPercentage, timeBar_posY)];
                [s_timeBar_Icon setRotation:0];
                [s_timeBar_Icon setScale:1.0];
                
               // [musicController stopThisSound:kSound_TimeRunOutSlow];
               // [musicController stopThisSound:kSound_TimeRunOutFast];
                [musicController changeGain:kSound_TimeRunOutSlow gain:0];
                [musicController changeGain:kSound_TimeRunOutFast gain:0];
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
        
        if(currentChosenMiniGame == 10 || currentChosenMiniGame == 3){
            timeRunOut_Slow_MaxGain = 0;
            timeRunOut_Fast_MaxGain = 0;
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
            if(timeRemainPercentage < 0.15){
                timeBarBlood_iconExtraScale -= 8;
            }else{
                timeBarBlood_iconExtraScale -= 4;
            }
            
            if(timeBarBlood_iconExtraScale <= 0){
                timeBarBlood_iconExtraScale = 0;
                timeBarBlood_isDeceasingIconExtraScale = false;
            }
        }else{
            if(timeRemainPercentage < 0.15){
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
        
        if(timeRemainPercentage < 0.15){
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
        if(timeRemainPercentage <= 0.3){
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
            
            //PLAY AT FIST IN PLAY SCENE INIT
          //  [musicController playThisSound:kSound_TimeRunOutSlow isLoop:YES gain:1.0 * timeRunOut_Slow_MaxGain];
          //  [musicController playThisSound:kSound_TimeRunOutFast isLoop:YES gain:0.0];
            
            isPlayingFastTimeOut = false;
        }
        
        timeBarIcon_finalX = timeBar_posX + timeBar_BarLifeLength * timeRemainPercentage;
        timeBarIcon_finalY = timeBar_posY;
        //[s_timeBar_Icon setPosition:ccp(timeBar_posX + timeBar_BarLifeLength * timeRemainPercentage , timeBar_posY)];
    }
    
    timeBarIcon_showX += (timeBarIcon_finalX - timeBarIcon_showX)/10;
    [s_timeBar_Icon setPosition:ccp(timeBarIcon_showX , timeBarIcon_finalY)];
    
}

-(void) comboManage:(ccTime) dt{
    if(comboCoin_disappearing_Digit){
       
        if(comboCoin_disappearingTimer == 6){
            comboScaleY = 0.85;
            comboScaleX = 1.0;
        }
        if(comboCoin_disappearingTimer == 5){
            comboScaleY = 0.68;
            comboScaleX = 1.0;
        }
        if(comboCoin_disappearingTimer == 4){
            comboScaleY = 0.5;
            comboScaleX = 1.0;
        }
        
        if(comboCoin_disappearingTimer == 3){
            comboScaleY = 1.2;
            comboScaleX = 1.2;
        }
        
        if(comboCoin_disappearingTimer == 2){
            comboScaleY = 1.1;
            comboScaleX = 1.1;
        }
        if(comboCoin_disappearingTimer == 1){
            comboScaleY = 1.05;
            comboScaleX = 1.05;
        }
        
        if(comboCoin_disappearingTimer == 0){
            comboScaleY = 1.0;
            comboScaleX = 1.0;
        }
        
        if(comboCoin_disappearingTimer == 7){
            comboScaleY = 0.93;
            comboScaleX = 1.0;
            
            [s_comboBar_Icon setPosition:ccp(10000 , 10000)];
            [s_comboBar_text setPosition:ccp(10000 , 10000)];
            [s_comboBar_BarLifeLeft setPosition:ccp(10000 , 10000)];
            [s_comboBar_Bar setPosition:ccp(10000 , 10000)];
            [s_comboBar_BarLife setPosition:ccp(10000 , 10000)];
            [s_comboBar_combo[0] setPosition:ccp(10000 , 10000)];
            [s_comboBar_combo[1] setPosition:ccp(10000 , 10000)];
            [s_comboBar_combo[2] setPosition:ccp(10000 , 10000)];
            [s_comboBar_combo[3] setPosition:ccp(10000 , 10000)];
            
           // currentCombo = 0;
            
            comboCoin_disappearing_Digit = false;
            
            comboCoin_displayToHowmany_Digit[0] = 0;
            comboCoin_displayToHowmany_Digit[1] = 0;
            comboCoin_displayToHowmany_Digit[2] = 0;
            comboCoin_displayToHowmany_Digit[3] = 0;
            
            comboCoin_displayCurrentTimer_DigitEach[0] = 0;
            comboCoin_displayCurrentTimer_DigitEach[1] = 0;
            comboCoin_displayCurrentTimer_DigitEach[2] = 0;
            comboCoin_displayCurrentTimer_DigitEach[3] = 0;
            
           // printf("SDFDSFSDFSDFDSFSDFDSFDS\n");
            
            comboCoin_startToDisplay_DigitEach[0] = false;
            comboCoin_startToDisplay_DigitEach[1] = false;
            comboCoin_startToDisplay_DigitEach[2] = false;
            comboCoin_startToDisplay_DigitEach[3] = false;
            
            
            
            if(isChangingComboLevel){
                chaningComboLevelScale = 1.0;
                changingComboLevelOffsetX = 0;
                
                [s_comboBar_combo[0] setScale:0.0];
                [s_comboBar_combo[1] setScale:0.0];
                [s_comboBar_combo[2] setScale:0.0];
                [s_comboBar_combo[3] setScale:0.0];
            }
            
        }

        [s_comboBar_BarLife setScaleX:comboRemainPercentage * comboScaleX];
        [s_comboBar_Icon setScaleX:comboScaleX];
        [s_comboBar_text setScaleX:comboScaleX];
        [s_comboBar_BarLifeLeft setScaleX:comboScaleX];
        [s_comboBar_Bar setScaleX:comboScaleX];
        [s_comboBar_combo[0] setScaleX:comboScaleX];
        
        [s_comboBar_BarLife setScaleY:comboScaleY];
        [s_comboBar_Icon setScaleY:comboScaleY];
        [s_comboBar_text setScaleY:comboScaleY];
        [s_comboBar_BarLifeLeft setScaleY:comboScaleY];
        [s_comboBar_Bar setScaleY:comboScaleY];
        [s_comboBar_combo[0] setScaleY:comboScaleY];
        
        comboCoin_disappearingTimer++;
        
        return;
    }
    
    if(!comboCoin_startToDisplay){
        return;
    }

   // printf("fucking dIU:%i\n",comboCoin_displayCurrentTimer);
    
    
    if(comboCoin_displayCurrentTimer == 0){
        comboScaleY = 0.93;
        comboScaleX = 1.0;
    }
    if(comboCoin_displayCurrentTimer == 1){
        comboScaleY = 0.85;
        comboScaleX = 1.0;
    }
    if(comboCoin_displayCurrentTimer == 2){
        comboScaleY = 0.68;
        comboScaleX = 1.0;
    }
    if(comboCoin_displayCurrentTimer == 3){
        comboScaleY = 0.5;
        comboScaleX = 1.0;
    }
    
    if(comboCoin_displayCurrentTimer == 4){
        comboScaleY = 1.2;
        comboScaleX = 1.2;
    }
    
    if(comboCoin_displayCurrentTimer == 5){
        comboScaleY = 1.1;
        comboScaleX = 1.1;
    }
    if(comboCoin_displayCurrentTimer == 6){
        comboScaleY = 1.05;
        comboScaleX = 1.05;
    }
    if(comboCoin_displayCurrentTimer == 7){
        comboScaleY = 1.0;
        comboScaleX = 1.0;
    }

   // printf("comboRemain:%4.8f\n",comboRemain);

    comboRemain -= comoboReduceSpeed;
    
    
    
    comboRemainPercentage += (comboRemain - comboRemainPercentage)/3;
    //printf("comboRemain:%4.8f\n",comboRemain);
    
    if(comboRemain <= 0){
       // printf("DSFDSFDSFDSFSSSSSS\n");
        [delegate beforeLoseComboWhenComboRemainGoesToZero];
        [self lostCombo];

        return;
    }
    
    //[s_comboBar_BarLife setScaleX:comboRemainPercentage];
    [s_comboBar_Icon setPosition:ccp(comboBar_posX + comboBar_BarLifeLength * comboRemainPercentage , comboBar_posY)];
    [s_comboBar_text setPosition:ccp(comboX-2*2/textureRatioForFuckingIpad, comboY)];
    [s_comboBar_BarLifeLeft setPosition:ccp(comboBar_posX , comboBar_posY)];
    [s_comboBar_Bar setPosition:ccp(comboBar_posX-7*2/textureRatioForFuckingIpad , comboBar_posY)];
    [s_comboBar_BarLife setPosition:ccp(comboBar_posX , comboBar_posY)];
    
    [s_comboBar_BarLife setScaleX:comboRemainPercentage * comboScaleX];
    [s_comboBar_Icon setScaleX:comboScaleX];
    [s_comboBar_text setScaleX:comboScaleX];
    [s_comboBar_BarLifeLeft setScaleX:comboScaleX];
    [s_comboBar_Bar setScaleX:comboScaleX];
    [s_comboBar_combo[0] setScaleX:comboScaleX];
    
    [s_comboBar_BarLife setScaleY:comboScaleY];
    [s_comboBar_Icon setScaleY:comboScaleY];
    [s_comboBar_text setScaleY:comboScaleY];
    [s_comboBar_BarLifeLeft setScaleY:comboScaleY];
    [s_comboBar_Bar setScaleY:comboScaleY];
    [s_comboBar_combo[0] setScaleY:comboScaleY];
    
    
    comboCoin_displayCurrentTimer++;
    
   // printf("changingComboLevelTimer:%i\n",changingComboLevelTimer);
    
    if(isChangingComboLevel){
       // printf("isChangingComboLevel\n");
        if(changingComboLevelTimer == 0){
            chaningComboLevelScale = 2.8;
            changingComboLevelOffsetX = 100;
        }
        
        if(changingComboLevelTimer < 5){
            chaningComboLevelScale += 0.7;
            changingComboLevelOffsetX += 2;
        }else{
            chaningComboLevelScale -= 1.0;
            changingComboLevelOffsetX -= 2;
        }
        
        if(changingComboLevelTimer == 10){

            isChangingComboLevel = false;
            [s_comboBar_combo[0] setScale:1.0];
            [s_comboBar_combo[1] setScale:1.0];
            [s_comboBar_combo[2] setScale:1.0];
            
            changingComboLevelOffsetX = 0;
            
            [self setComboDigitValues];
            
        }else{
            [s_comboBar_combo[0] setScale:chaningComboLevelScale];
            [s_comboBar_combo[1] setScale:chaningComboLevelScale];
            [s_comboBar_combo[2] setScale:chaningComboLevelScale];
            
        }
        
        changingComboLevelTimer++;
    }

    
    
    //---------------RUN DIGIT ANI
 
    if(!comboCoin_startToDisplay_Digit){
       // [self setComboDigitValues];
        return;
    }
    
    //printf("RUN DIGIT\n");

    if(comboCoin_startToDisplay_DigitEach[0]){
        if(comboCoin_displayCurrentTimer_DigitEach[0] == 0){
            comboCoin_Digit_offsetX[0] = 0;
            comboCoin_Digit_offsetY[0] = 2;
            comboCoin_Digit_Opacity[0] = 210;
        }
        if(comboCoin_displayCurrentTimer_DigitEach[0] == 1){
            comboCoin_Digit_offsetX[0] = 0;
            comboCoin_Digit_offsetY[0] = 5.5;
            comboCoin_Digit_Opacity[0] = 150;
        }
        if(comboCoin_displayCurrentTimer_DigitEach[0] == 2){
            comboCoin_Digit_offsetX[0] = 0;
            comboCoin_Digit_offsetY[0] = 10;
            comboCoin_Digit_Opacity[0] = 80;
        }
        if(comboCoin_displayCurrentTimer_DigitEach[0] == 3){
            comboCoin_Digit_offsetX[0] = 0;
            comboCoin_Digit_offsetY[0] = 5.5;
            comboCoin_Digit_Opacity[0] = 150;
        }
        if(comboCoin_displayCurrentTimer_DigitEach[0] == 4){
            comboCoin_Digit_offsetX[0] = 0;
            comboCoin_Digit_offsetY[0] = 2;
            comboCoin_Digit_Opacity[0] = 210;
        }
        if(comboCoin_displayCurrentTimer_DigitEach[0] == 5){
            comboCoin_Digit_offsetX[0] = 0;
            comboCoin_Digit_offsetY[0] = 0;
            comboCoin_Digit_Opacity[0] = 255;
        }
       // printf("comboCoin_displayCurrentTimer_DigitEach[0]:%i\n",comboCoin_displayCurrentTimer_DigitEach[0]);      
        comboCoin_displayCurrentTimer_DigitEach[0]++;
    }
   
    
    if(comboCoin_startToDisplay_DigitEach[1]){
        if(comboCoin_Digit_changingDigit[1]){
             
            if(comboCoin_displayCurrentTimer_DigitEach[1] == 0){
                comboCoin_Digit_offsetX[1] = 0;
                comboCoin_Digit_offsetY[1] = 2;
                comboCoin_Digit_Opacity[1] = 210;
            }
            if(comboCoin_displayCurrentTimer_DigitEach[1] == 1){
                comboCoin_Digit_offsetX[1] = 0;
                comboCoin_Digit_offsetY[1] = 5.5;
                comboCoin_Digit_Opacity[1] = 150;
            }
            if(comboCoin_displayCurrentTimer_DigitEach[1] == 2){
                comboCoin_Digit_offsetX[1] = 0;
                comboCoin_Digit_offsetY[1] = 10;
                comboCoin_Digit_Opacity[1] = 80;
            }
            if(comboCoin_displayCurrentTimer_DigitEach[1] == 3){
                comboCoin_Digit_offsetX[1] = 0;
                comboCoin_Digit_offsetY[1] = 4;
                comboCoin_Digit_Opacity[1] = 165;
            }
            if(comboCoin_displayCurrentTimer_DigitEach[1] == 4){
                comboCoin_Digit_offsetX[1] = 0;
                comboCoin_Digit_offsetY[1] = 0;
                comboCoin_Digit_Opacity[1] = 255;
                
                comboCoin_Digit_changingDigit[1] = false;
                comboCoin_displayCurrentTimer_DigitEach[1] = -1;
                comboCoin_startToDisplay_DigitEach[1] = false;
            }
            
        }else{
            
            if(comboCoin_displayCurrentTimer_DigitEach[1] == 1){
                comboCoin_Digit_offsetY[1] = 0.5;
            }
            if(comboCoin_displayCurrentTimer_DigitEach[1] == 2){
                comboCoin_Digit_offsetY[1] = 1.5;
            }
            if(comboCoin_displayCurrentTimer_DigitEach[1] == 3){
                comboCoin_Digit_offsetY[1] = 0.5;
            }
            if(comboCoin_displayCurrentTimer_DigitEach[1] == 4){
                comboCoin_Digit_offsetY[1] = 0;
                
                comboCoin_Digit_changingDigit[1] = false;
               // comboCoin_displayCurrentTimer_DigitEach[1] = -1;
                comboCoin_startToDisplay_DigitEach[1] = false;
            }
        }
        //printf("comboCoin_displayCurrentTimer_DigitEach[1]:%i\n",comboCoin_displayCurrentTimer_DigitEach[1]); 
        comboCoin_displayCurrentTimer_DigitEach[1]++;
    }
    
    if(comboCoin_startToDisplay_DigitEach[2]){
        if(comboCoin_Digit_changingDigit[2]){
            
            if(comboCoin_displayCurrentTimer_DigitEach[2] == 0){
                comboCoin_Digit_offsetX[2] = 0;
                comboCoin_Digit_offsetY[2] = 2;
                comboCoin_Digit_Opacity[2] = 210;
            }
            if(comboCoin_displayCurrentTimer_DigitEach[2] == 1){
                comboCoin_Digit_offsetX[2] = 0;
                comboCoin_Digit_offsetY[2] = 5.5;
                comboCoin_Digit_Opacity[2] = 150;
            }
            if(comboCoin_displayCurrentTimer_DigitEach[2] == 2){
                comboCoin_Digit_offsetX[2] = 0;
                comboCoin_Digit_offsetY[2] = 10;
                comboCoin_Digit_Opacity[2] = 80;
            }
            if(comboCoin_displayCurrentTimer_DigitEach[2] == 3){
                comboCoin_Digit_offsetX[2] = 0;
                comboCoin_Digit_offsetY[2] = 4;
                comboCoin_Digit_Opacity[2] = 165;
            }
            if(comboCoin_displayCurrentTimer_DigitEach[2] == 4){
                comboCoin_Digit_offsetX[2] = 0;
                comboCoin_Digit_offsetY[2] = 0;
                comboCoin_Digit_Opacity[2] = 255;
                
                comboCoin_Digit_changingDigit[2] = false;
                comboCoin_displayCurrentTimer_DigitEach[2] = -1;
                comboCoin_startToDisplay_DigitEach[2] = false;
            }
            
        }else{
            
            if(comboCoin_displayCurrentTimer_DigitEach[2] == 1){
                comboCoin_Digit_offsetY[2] = 0.5;
            }
            if(comboCoin_displayCurrentTimer_DigitEach[2] == 2){
                comboCoin_Digit_offsetY[2] = 1.5;
            }
            if(comboCoin_displayCurrentTimer_DigitEach[2] == 3){
                comboCoin_Digit_offsetY[2] = 0.5;
            }
            if(comboCoin_displayCurrentTimer_DigitEach[2] == 4){
                comboCoin_Digit_offsetY[2] = 0;
                
                comboCoin_Digit_changingDigit[2] = false;
                // comboCoin_displayCurrentTimer_DigitEach[1] = -1;
                comboCoin_startToDisplay_DigitEach[2] = false;
            }
        }
        //printf("comboCoin_displayCurrentTimer_DigitEach[1]:%i\n",comboCoin_displayCurrentTimer_DigitEach[1]); 
        comboCoin_displayCurrentTimer_DigitEach[2]++;
    }
    
   /* if(isIpad){
        comboCoin_Digit_offsetX[0] *= 1000/2;
        comboCoin_Digit_offsetX[1] *= 1000/2;
        comboCoin_Digit_offsetX[2] *= 1000/2;
    }*/
    

    if(comboCoin_displayCurrentTimer_Digit == 0){
        comboCoin_displayToHowmany++;
        
        comboCoin_startToDisplay_DigitEach[0] = true;
        
        if(comboCoin_displayToHowmany >= 10){
            comboCoin_startToDisplay_DigitEach[1] = true;
        }
        
        if(comboCoin_displayToHowmany >= 100){
            comboCoin_startToDisplay_DigitEach[2] = true;
        }
    }
    
    if(comboCoin_displayCurrentTimer_Digit == 2){
        //comboCoin_displayToHowmany++;
        
        static int comb_digit0;
        static int comb_digit1;
        static int comb_digit2;
       // static int comb_digit3;
        
         //comboCoin_startToDisplay_DigitEach[0] = true;
        
        if(comboCoin_displayToHowmany < 10){
            [s_comboBar_combo[0] setTextureRect:CGRectMake(comboDigitTextureX[comboCoin_displayToHowmany][comboLevel], comboDigitTextureY[comboLevel], comboDigitWidth[comboLevel], comboDigitHeight[comboLevel])];
        }else if(comboCoin_displayToHowmany < 100){
            comb_digit1 = comboCoin_displayToHowmany/10;
            comb_digit0 = comboCoin_displayToHowmany - comb_digit1*10;
            
          //  printf("comb_digit1:%i %i\n",comb_digit1,comb_digit0);
            
            [s_comboBar_combo[0] setTextureRect:CGRectMake(comboDigitTextureX[comb_digit0][comboLevel], comboDigitTextureY[comboLevel], comboDigitWidth[comboLevel], comboDigitHeight[comboLevel])];
            [s_comboBar_combo[1] setTextureRect:CGRectMake(comboDigitTextureX[comb_digit1][comboLevel], comboDigitTextureY[comboLevel], comboDigitWidth[comboLevel], comboDigitHeight[comboLevel])];
            
            if(comboCoin_displayToHowmany_Digit[1] != comb_digit1){
                comboCoin_Digit_changingDigit[1] = true;
            }
            
            comboCoin_displayToHowmany_Digit[1] = comb_digit1;
            comboCoin_displayToHowmany_Digit[0] = comb_digit0;
            
           // comboCoin_startToDisplay_DigitEach[1] = true;
        }else if(comboCoin_displayToHowmany < 1000){
            comb_digit2 = comboCoin_displayToHowmany/100;
            comb_digit1 = (comboCoin_displayToHowmany - comb_digit2*100)/10;
            comb_digit0 = comboCoin_displayToHowmany - comb_digit2*100 - comb_digit1*10;
            
            //  printf("comb_digit1:%i %i\n",comb_digit1,comb_digit0);
            
            [s_comboBar_combo[0] setTextureRect:CGRectMake(comboDigitTextureX[comb_digit0][comboLevel], comboDigitTextureY[comboLevel], comboDigitWidth[comboLevel], comboDigitHeight[comboLevel])];
            [s_comboBar_combo[1] setTextureRect:CGRectMake(comboDigitTextureX[comb_digit1][comboLevel], comboDigitTextureY[comboLevel], comboDigitWidth[comboLevel], comboDigitHeight[comboLevel])];
            [s_comboBar_combo[2] setTextureRect:CGRectMake(comboDigitTextureX[comb_digit2][comboLevel], comboDigitTextureY[comboLevel], comboDigitWidth[comboLevel], comboDigitHeight[comboLevel])];
            
            if(comboCoin_displayToHowmany_Digit[2] != comb_digit1){
                comboCoin_Digit_changingDigit[2] = true;
            }
            
            comboCoin_displayToHowmany_Digit[2] = comb_digit2;
            comboCoin_displayToHowmany_Digit[1] = comb_digit1;
            comboCoin_displayToHowmany_Digit[0] = comb_digit0;
            
            // comboCoin_startToDisplay_DigitEach[1] = true;
        }
        
        [s_comboBar_text setTextureRect:CGRectMake(comboTextureX[comboLevel], comboTextureY[comboLevel], comboWidth[comboLevel], comboHeight[comboLevel])];
        
        
    }
    
    
    
    
    
    if(comboCoin_displayCurrentTimer_Digit == 5){
        if(currentCombo < 10){
            comboCoin_displayCurrentTimer_Digit = -1;
            if(comboCoin_displayToHowmany == currentCombo){
               // printf("END\n");
                comboCoin_startToDisplay_Digit = false;
                comboCoin_displayCurrentTimer_DigitEach[0] = 0;
            }
        }
    }
    
    if(comboCoin_displayCurrentTimer_Digit == 8){
        if(currentCombo >= 10){
            comboCoin_displayCurrentTimer_Digit = -1;
            if(comboCoin_displayToHowmany == currentCombo){
                comboCoin_startToDisplay_Digit = false;
                comboCoin_displayCurrentTimer_DigitEach[0] = 0;
                comboCoin_displayCurrentTimer_DigitEach[1] = 0;
            }
        }
    }
    
    if(comboCoin_displayCurrentTimer_Digit == 10){
        if(currentCombo >= 100){
            comboCoin_displayCurrentTimer_Digit = -1;
            if(comboCoin_displayToHowmany == currentCombo){
                comboCoin_startToDisplay_Digit = false;
                comboCoin_displayCurrentTimer_DigitEach[0] = 0;
                comboCoin_displayCurrentTimer_DigitEach[1] = 0;
                comboCoin_displayCurrentTimer_DigitEach[2] = 0;
            }
        }
    }
    
    
    //printf("changingComboLevelOffsetX:%4.8f\n",changingComboLevelOffsetX);
    [self setComboDigitValues];
    
    
        
    
    comboCoin_displayCurrentTimer_Digit++;
}

-(void) setComboDigitValues{
   // printf("changingComboLevelOffsetX:% 4.8f\n",changingComboLevelOffsetX);
    if(comboCoin_displayToHowmany < 10){
        [s_comboBar_combo[0] setPosition:ccp(comboX-2*2/textureRatioForFuckingIpad + comboCoin_Digit_offsetX[0], comboY + 17*2/textureRatioForFuckingIpad + comboCoin_Digit_offsetY[0])];
        [s_comboBar_combo[0] setOpacity:comboCoin_Digit_Opacity[0]*0.85];
    }else if(comboCoin_displayToHowmany < 100){
        if(comboLevel < 1){
            [s_comboBar_combo[0] setPosition:ccp(comboX + 4*2/textureRatioForFuckingIpad + comboCoin_Digit_offsetX[0] + changingComboLevelOffsetX/textureRatioForFuckingIpad, comboY + 17*2/textureRatioForFuckingIpad + comboCoin_Digit_offsetY[0])];
            [s_comboBar_combo[0] setOpacity:comboCoin_Digit_Opacity[0]*0.85];
            
            [s_comboBar_combo[1] setPosition:ccp(comboX - 9*2/textureRatioForFuckingIpad + comboCoin_Digit_offsetX[1] - changingComboLevelOffsetX/textureRatioForFuckingIpad, comboY + 17*2/textureRatioForFuckingIpad + comboCoin_Digit_offsetY[1])];
            [s_comboBar_combo[1] setOpacity:comboCoin_Digit_Opacity[1]*0.85];
        }else{
            [s_comboBar_combo[0] setPosition:ccp(comboX + 5*2/textureRatioForFuckingIpad + comboCoin_Digit_offsetX[0] + changingComboLevelOffsetX/textureRatioForFuckingIpad, comboY + 17*2/textureRatioForFuckingIpad + comboCoin_Digit_offsetY[0])];
            [s_comboBar_combo[0] setOpacity:comboCoin_Digit_Opacity[0]*0.85];
            
            [s_comboBar_combo[1] setPosition:ccp(comboX - 10*2/textureRatioForFuckingIpad + comboCoin_Digit_offsetX[1] - changingComboLevelOffsetX/textureRatioForFuckingIpad, comboY + 17*2/textureRatioForFuckingIpad + comboCoin_Digit_offsetY[1])];
            [s_comboBar_combo[1] setOpacity:comboCoin_Digit_Opacity[1]*0.85];
        }
        
    }else if(comboCoin_displayToHowmany < 1000){
        [s_comboBar_combo[0] setPosition:ccp(comboX + 13*2/textureRatioForFuckingIpad + comboCoin_Digit_offsetX[0] + changingComboLevelOffsetX, comboY + 17*2/textureRatioForFuckingIpad + comboCoin_Digit_offsetY[0])];
        [s_comboBar_combo[0] setOpacity:comboCoin_Digit_Opacity[0]*0.85];
        
        [s_comboBar_combo[1] setPosition:ccp(comboX-2*2/textureRatioForFuckingIpad + comboCoin_Digit_offsetX[1], comboY + 17*2/textureRatioForFuckingIpad + comboCoin_Digit_offsetY[1])];
        [s_comboBar_combo[1] setOpacity:comboCoin_Digit_Opacity[1]*0.85];
        
        [s_comboBar_combo[2] setPosition:ccp(comboX + 13*2/textureRatioForFuckingIpad + comboCoin_Digit_offsetX[1] - changingComboLevelOffsetX, comboY + 17*2/textureRatioForFuckingIpad + comboCoin_Digit_offsetY[1])];
        [s_comboBar_combo[2] setOpacity:comboCoin_Digit_Opacity[1]*0.85];
    }
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
        [s_turtleCoinText[0] setPosition:ccp(turtleCoinX, turtleCoinY - 7*2/textureRatioForFuckingIpad)];
    }else if(currentTurtleCoin < 100){
        [s_turtleCoinText[0] setTextureRect:CGRectMake(turtlCoinText_textureX + turtleCoin_displayToHowmany[0] * turtlCoinText_width, turtlCoinText_textureY, turtlCoinText_width, turtlCoinText_height)];
        [s_turtleCoinText[0] setPosition:ccp(turtleCoinX + 7*2/textureRatioForFuckingIpad, turtleCoinY - 7*2/textureRatioForFuckingIpad)];
        
        [s_turtleCoinText[1] setTextureRect:CGRectMake(turtlCoinText_textureX + turtleCoin_displayToHowmany[1] * turtlCoinText_width, turtlCoinText_textureY, turtlCoinText_width, turtlCoinText_height)];
        [s_turtleCoinText[1] setPosition:ccp(turtleCoinX - 8*2/textureRatioForFuckingIpad, turtleCoinY - 7*2/textureRatioForFuckingIpad)];
    }else if(currentTurtleCoin < 1000){
        [s_turtleCoinText[0] setTextureRect:CGRectMake(turtlCoinText_textureX + turtleCoin_displayToHowmany[0] * turtlCoinText_width, turtlCoinText_textureY, turtlCoinText_width, turtlCoinText_height)];
        [s_turtleCoinText[0] setPosition:ccp(turtleCoinX + 14*2/textureRatioForFuckingIpad, turtleCoinY - 7*2/textureRatioForFuckingIpad)];
        
        [s_turtleCoinText[1] setTextureRect:CGRectMake(turtlCoinText_textureX + turtleCoin_displayToHowmany[1] * turtlCoinText_width, turtlCoinText_textureY, turtlCoinText_width, turtlCoinText_height)];
        [s_turtleCoinText[1] setPosition:ccp(turtleCoinX + 0*2/textureRatioForFuckingIpad, turtleCoinY - 7*2/textureRatioForFuckingIpad)];
        
        [s_turtleCoinText[2] setTextureRect:CGRectMake(turtlCoinText_textureX + turtleCoin_displayToHowmany[2] * turtlCoinText_width, turtlCoinText_textureY, turtlCoinText_width, turtlCoinText_height)];
        [s_turtleCoinText[2] setPosition:ccp(turtleCoinX - 15*2/textureRatioForFuckingIpad, turtleCoinY - 7*2/textureRatioForFuckingIpad)];
        
    }else if(currentTurtleCoin < 10000){
        [s_turtleCoinText[0] setTextureRect:CGRectMake(turtlCoinText_textureX + turtleCoin_displayToHowmany[0] * turtlCoinText_width, turtlCoinText_textureY, turtlCoinText_width, turtlCoinText_height)];
        [s_turtleCoinText[0] setPosition:ccp(turtleCoinX + 21*2/textureRatioForFuckingIpad, turtleCoinY - 7*2/textureRatioForFuckingIpad)];
        
        [s_turtleCoinText[1] setTextureRect:CGRectMake(turtlCoinText_textureX + turtleCoin_displayToHowmany[1] * turtlCoinText_width, turtlCoinText_textureY, turtlCoinText_width, turtlCoinText_height)];
        [s_turtleCoinText[1] setPosition:ccp(turtleCoinX + 7*2/textureRatioForFuckingIpad, turtleCoinY - 7*2/textureRatioForFuckingIpad)];
        
        [s_turtleCoinText[2] setTextureRect:CGRectMake(turtlCoinText_textureX + turtleCoin_displayToHowmany[2] * turtlCoinText_width, turtlCoinText_textureY, turtlCoinText_width, turtlCoinText_height)];
        [s_turtleCoinText[2] setPosition:ccp(turtleCoinX - 8*2/textureRatioForFuckingIpad, turtleCoinY - 7*2/textureRatioForFuckingIpad)];
        
        [s_turtleCoinText[3] setTextureRect:CGRectMake(turtlCoinText_textureX + turtleCoin_displayToHowmany[3] * turtlCoinText_width, turtlCoinText_textureY, turtlCoinText_width, turtlCoinText_height)];
        [s_turtleCoinText[3] setPosition:ccp(turtleCoinX - 22*2/textureRatioForFuckingIpad, turtleCoinY - 7*2/textureRatioForFuckingIpad)];
    }
   
    
    turtleCoin_displayCurrentTimer++;
    
    if(turtleCoin_displayCurrentTimer >= 30){
        turtleCoin_startToDisplay = false;
    }
    
}

-(void) turtleCoinShineManage{
    
    if(arc4random()%6 == 0){
        if(arc4random()%3 == 0){
            turtleCoinShinningOpacity -= arc4random() % 50;
        }else{
            turtleCoinShinningOpacity += arc4random() % 50;
        }
        
        if(turtleCoinShinningOpacity < 150){
            turtleCoinShinningOpacity = 150;
        }
        
        if(turtleCoinShinningOpacity > 255){
            turtleCoinShinningOpacity = 255;
        }

        
        [s_turtleCoinShine setOpacity:turtleCoinShinningOpacity];
    }
   
    
    turtleCoinShinningAngle += (turtleCoinShinning_angleSpeed - turtleCoinShinningAngle)/10;
    
    [s_turtleCoinShine setPosition:ccp(s_turtleCoin.position.x + 1 + 21 * cos(-90*M_PI/180 - turtleCoinShinningAngle), s_turtleCoin.position.y - 1 + 21 * sin(-90*M_PI/180 - turtleCoinShinningAngle))];
    

    
    if(turtleCoinShinningAngle >= M_PI * 2){
        turtleCoinShinningAngle -= M_PI * 2;
        turtleCoinShinning_angleSpeed -= M_PI * 2;
        [self gainCoin:1];
    }

    
    turtleCoinShinning_aniTimer++;
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

-(void) gainCoin:(int)_coin{
   // printf("gainCoin\n");
    [self setTurtleCoinAni];
    
    currentTurtleCoin += _coin;
    
    turtleCoin_displayCurrentTimer = 0;
    turtleCoin_startToDisplay = true;
}

-(void) gainTime:(float)_time{
    printf("gainTime:%4.8f\n", _time);
    timeRemain += _time;
    if( timeRemain > maxTime){
        timeRemain = maxTime;
    }
}

-(void) gainCombo:(int)_combo{
    //gameRound++;
    

    turtleCoinShinning_angleSpeed += turtleCoinShinning_angleAcceleration;
    [self getOneTurtleDefeat];
    
    currentCombo += _combo;
    
   // printf("gainCombo:%i %i %i\n",currentCombo, comboColorLimit[comboLevel+1], comboLevel);
    
   // isChangingComboLevel = false;
    
    if(comboLevel <= 9){
        // printf("AgainCombo:%i %i %i %i\n",currentCombo, comboColorLimit[comboLevel+1], comboLevel, currentChosenMiniGame);
        
        if(currentCombo == comboColorLimit[comboLevel+1]){
          //  printf("OOOOOOOOOOOOOOOOOOOOOOOOOOOO\n");
            comboLevel++;
            [playLayer setToBombingCombo];
            
            if(currentChosenMiniGame == 1){
                [self gainTime:timeToBeGained];
            }else if(currentChosenMiniGame == 2){
                [self gainTime:6.0];
            }else if(currentChosenMiniGame == 3){
                [self gainTime:timeToBeGained];
            }else if(currentChosenMiniGame == 4){
                [self gainTime:timeToBeGained];
            }else if(currentChosenMiniGame == 5){
                [self gainTime:3.5];
            }else if(currentChosenMiniGame == 11){
                [self gainTime:timeToBeGained];
            }else if(currentChosenMiniGame == 13){
                [self gainTime:timeToBeGained];
                [delegate fuckfuck];
            }else{
                [self gainTime:6];
            }
            
            isChangingComboLevel = true;
            changingComboLevelTimer = 0;
            [self setPlusTimeAni];
            
            if(isIpad){
                if(currentChosenMiniGame == 5){
                    [playLayer setToBombingTimePlus:100 * 1024.0/480.0 y:230 * 768.0/320.0];
                }else{
                    [playLayer setToBombingTimePlus:230 * 1024.0/480.0 y:250 * 768.0/320.0];
                }
            }else{
                if(currentChosenMiniGame == 5){
                    [playLayer setToBombingTimePlus:100 y:230];
                }else{
                    [playLayer setToBombingTimePlus:230 y:250];
                }
            }
            
            
        }
    }else{
        // printf("TgainCombo:%i %i\n",currentCombo, comboLevel);
        
        static int extraComboLimit;
        if(currentChosenMiniGame == 11){
            extraComboLimit = 40;
        }else if(currentChosenMiniGame == 2){
            extraComboLimit = 3;
        }else if(currentChosenMiniGame == 103){
            extraComboLimit = 10;
        }else{
            extraComboLimit = 20;
        }
        
        if(currentCombo % extraComboLimit == 0){
          //  printf("OOOOOOOOOOOOOOOOOOOOOOOOOOOO\n");
            
            if(currentChosenMiniGame == 5){
                [self gainTime:3.5];
            }else{
                [self gainTime:6];
            }
            
            isChangingComboLevel = true;
            changingComboLevelTimer = 0;
            [self setPlusTimeAni];
            
            if(isIpad){
                if(currentChosenMiniGame == 5){
                    [playLayer setToBombingTimePlus:100 * 1024.0/480.0 y:230 * 768.0/320.0];
                }else{
                    [playLayer setToBombingTimePlus:230 * 1024.0/480.0 y:250 * 768.0/320.0];
                }
            }else{
                if(currentChosenMiniGame == 5){
                    [playLayer setToBombingTimePlus:100 y:230];
                }else{
                    [playLayer setToBombingTimePlus:230 y:250];
                }
            }
            
        }
    }
    
    
    //FUCK DO IT IN MINIBASIC
    //comboRemain = 1;
    if(currentChosenMiniGame == 5 || currentChosenMiniGame == 3 || currentChosenMiniGame == 10 || currentChosenMiniGame == 11 || currentChosenMiniGame == 13 || currentChosenMiniGame == 2){
        comboRemain = 1;
    }
    
    if(maxCombo < currentCombo){
        maxCombo = currentCombo;
    }
    
    if(currentCombo >= comboToStart){
        comboCoin_startToDisplay = true;
        comboCoin_startToDisplay_Digit = true;
       //comboCoin_disappearing_Digit = false;
        
        comboCoin_startToDisplay_DigitEach[0] = true;
    }
    
    if(currentCombo == comboToStart-1){
        comboLevel = 0;
    }
    
    if(currentCombo == comboToStart){
        //comboCoin_startToDisplay_Digit = true;
        
        comboRemainPercentage = 1.0;
                
        comboScaleX = 1;
        comboScaleY = 1;
        
        comboCoin_displayToHowmany = comboToStart-1;
        comboCoin_displayCurrentTimer_Digit = 0;
        
       // comboLevel = 0;

       // comboCoin_startToDisplay_DigitEach[0] = true;
        
        [s_comboBar_combo[0] setTextureRect:CGRectMake(comboDigitTextureX[comboCoin_displayToHowmany][comboLevel], comboDigitTextureY[comboLevel], comboDigitWidth[comboLevel], comboDigitHeight[comboLevel])];
        [s_comboBar_combo[1] setTextureRect:CGRectMake(comboDigitTextureX[1][comboLevel], comboDigitTextureY[comboLevel], comboDigitWidth[comboLevel], comboDigitHeight[comboLevel])];
       // [s_comboBar_combo[0] setTextureRect:CGRectMake(0,0,1024,1024)];
    }
}


-(void) lostCombo{
    //gameRound--;
    /*if(gameRound < 0){
        gameRound = 0;
    }*/
    
    gameRoundFromBegin = 0;
    
   // printf("loseCombo:%i\n",currentCombo);
    if(currentCombo == 0){
        return;
    }
    
    if(currentCombo >= 5){
        [playLayer setToBombingCombo];
    }
    
    comboCoin_startToDisplay = false;
    comboCoin_startToDisplay_Digit = false;
    comboCoin_disappearing_Digit = true;
    
    comboCoin_disappearingTimer = 0;
    
    currentCombo = 0;
    
    [playLayer setComboExtraValues];
    
    [delegate comboLost];
    
    [musicController playThisSound:kSound_ComboSmoke isLoop:NO gain:1.0];
    [musicController playThisSound:kSound_LoseCombo isLoop:NO gain:0.35];
    

}

-(void) setTurtleCoinShineAni{
    if(turtleCoinShinning_isAni){
        return;
    }
    
    turtleCoinShinning_isAni = true;
    turtleCoinShinning_aniTimer = 0;
    turtleCoinShinningAngle = 0;
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
    [self gainCoin:1];
}

@end
