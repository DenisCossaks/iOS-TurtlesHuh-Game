//
//  PlayScene.m
//  BombTheTurtle
//
//  Created by  on 2012/4/13.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "PlayScene.h"
#import "animationDefs.h"
#import "GamePlayGlobal.h"
#import "Turtle.h"

#import "MiniBasic.h"
#import "Mini01.h"
#import "Mini02.h"
#import "Mini03.h"
#import "Mini04.h"
#import "Mini05.h"
#import "Mini07.h"
#import "Mini10.h"
#import "Mini11.h"
#import "Mini13.h"
#import "Mini12.h"
#import "Mini101.h"
#import "Mini102.h"
#import "Mini103.h"

#import "Global.h"

#import "BombScript.h"
#import "BombScript2.h"
#import "BombScriptGlobal.h"

#import "SelectMiniGameScene2.h"
#import "ScoreShownScene.h"

#import "NullScene.h"
#import "AppDelegate.h"

@implementation PlayScene

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	PlayScene *layer = [PlayScene node];
    playLayer = layer;
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

-(void) initInstruction{
    printf("initInstruction:%i\n",currentChosenMiniGame);
}

-(void) showInstruction{
    printf("showInstruction:%i\n",currentChosenMiniGame);
    isShowingInstruction = true;
    
    if(currentChosenMiniGame == 1){
        s_ingameInstruction = [CCSprite spriteWithFile:@"instruction_mini01.png"];
    }
    if(currentChosenMiniGame == 4){
        s_ingameInstruction = [CCSprite spriteWithFile:@"instruction_mini02.png"];
    }
    if(currentChosenMiniGame == 2){
        s_ingameInstruction = [CCSprite spriteWithFile:@"instruction_mini03.png"];
    }
    if(currentChosenMiniGame == 3){
        s_ingameInstruction = [CCSprite spriteWithFile:@"instruction_mini04.png"];
    }
    if(currentChosenMiniGame == 10){
        s_ingameInstruction = [CCSprite spriteWithFile:@"instruction_mini05.png"];
    }
    if(currentChosenMiniGame == 5){
        s_ingameInstruction = [CCSprite spriteWithFile:@"instruction_mini06.png"];
    }
    if(currentChosenMiniGame == 11){
        s_ingameInstruction = [CCSprite spriteWithFile:@"instruction_mini07.png"];
    }
    if(currentChosenMiniGame == 13){
        s_ingameInstruction = [CCSprite spriteWithFile:@"instruction_mini08.png"];
    }
    
    if(currentChosenMiniGame == 103){
        s_ingameInstruction = [CCSprite spriteWithFile:@"instruction_mini09.png"];
    }
    
    [s_ingameInstruction setAnchorPoint:ccp(0.5,1.0)];
    
    [s_ingameInstruction setPosition:ccp(2400000, 255)];
    
    [self addChild:s_ingameInstruction z:kDeapth_Menu];

    
    [s_ingameInstruction setPosition:ccp(240, 255)];
    
    if(isIpad){
        [s_ingameInstruction setPosition:ccp(-(240 - 240) * 2 + 512, -(160 - 255) * 2 + 384)];
    }
}

-(void) removeInstruction{
    isShowingInstruction = false;
    [s_ingameInstruction setPosition:ccp(240000, 255)];
    [self removeChild:s_ingameInstruction cleanup:YES];
}


// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
        
        ad_isInGaming = true;
       
        
        printf("init PLAYSCENE\n");
        AppController *appDelegate =(AppController*) [[UIApplication sharedApplication] delegate];
        [appDelegate didStartLevel];
        
        //self.isTouchEnabled = YES;
        [musicController initForPlay];
    
        palyTimer = 0;
        
        isPlayingMiniGame = true;
        isStopping = false;
        isShowingMenu = false;
        isShowingInstruction = false;
        hasGameover = false;
        
      //  wholeGameStatus = kWholeGameStatus_Readying;
        
        /*turtle_detectHalfLeft = 50+15;
        turtle_detectHalfRight = 35+15;
        turtle_detectHalfUp = 35+10;
        turtle_detectHalfDown = 20+10;*/
        
        turtle_detectHalfLeft = 50+25;
        turtle_detectHalfRight = 35+25;
        turtle_detectHalfUp = 35+20;
        turtle_detectHalfDown = 20+20;
        
        if(isIpad){
            turtle_detectHalfLeft *= 2;
            turtle_detectHalfRight *= 2;
            turtle_detectHalfUp *= 2;
            turtle_detectHalfDown *= 2;
        }
        
        turtleCoinShinning_angleSpeed = 0.65;
        turtleCoinShinning_angleAcceleration = 0.65;
        
        comboColorLimit[0] = 0;
        comboColorLimit[1] = 15;
        comboColorLimit[2] = 30;
        comboColorLimit[3] = 45;
        comboColorLimit[4] = 60;
        comboColorLimit[5] = 75;
        comboColorLimit[6] = 90;
        comboColorLimit[7] = 105;
        comboColorLimit[8] = 120;
        comboColorLimit[9] = 135;
        comboColorLimit[10] = 150;
        
       // currentChosenMiniGame = 2;
        currentTurtleCoin = 0;
        maxTime = 30;
        timeRemain = maxTime;
        
       // comoboReduceSpeed = 0.01;
        comoboReduceSpeed = 0.005;
        comboRemain = 0;
        
        currentCombo = 0;
        maxCombo = 0;
        comboLevel = 0;
        
        currentTurtleOnScreen = 0;
        
        gameoverTimer = 0;
        gameover_scale = 0;
        
        //CCSprite* s_bg = [CCSprite spriteWithFile:@"mini_01_bg.png"];
        //[s_bg setPosition:ccp(240,160)];
		//[self addChild:s_bg];
        
        ss_Gameover  = [CCSpriteBatchNode batchNodeWithFile:@"s_menu_gameOver.png" capacity:1];
        [self addChild:ss_Gameover z:kDeapth_Menu];
        
        ss_Character  = [CCSpriteBatchNode batchNodeWithFile:@"whole_turtle.png" capacity:1];
        [self addChild:ss_Character z:kDeapth_ssCharacter];
        
        if(currentChosenMiniGame == 4 || currentChosenMiniGame == 10 || currentChosenMiniGame == 11 || currentChosenMiniGame == 7 || currentChosenMiniGame == 101 || currentChosenMiniGame == 102){
            ss_Extra  = [CCSpriteBatchNode batchNodeWithFile:@"mini_04_extraTexture.png" capacity:1];
            [self addChild:ss_Extra z:kDeapth_ssExtra];
        }
        
        if(currentChosenMiniGame == 13){
            ss_Extra  = [CCSpriteBatchNode batchNodeWithFile:@"mini_13_extraTexture.png" capacity:1];
            [self addChild:ss_Extra z:kDeapth_ssExtra];
        }
        
        [self initBombScripts];
        [self initUI];
        [self initMiniGame];
        //[self initUI];
        [self initBomobingAni];
       
        
        [self setComboExtraValues];
        
        [self schedule: @selector(gameStep:)];
        
        [self initMenu];
        //[self initReady];
        
        [musicController playThisSound:kSound_TimeRunOutSlow isLoop:YES gain:0.0];
        [musicController playThisSound:kSound_TimeRunOutFast isLoop:YES gain:0.0];
        
        if(currentChosenMiniGame == 2){
            comboToStart = 3;
        }else{
            comboToStart = 5;
        }
        
        [self initTransition];
        [self initInstruction];
       // [self showInstruction];

    }
	return self;
}

-(void) initTransition{
    finishOne_colorLayer= [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(0/2, 0/2, 0/2, 0/2)];
    [ss_Character addChild:finishOne_colorLayer z:kDeapth_Gameover];
    [finishOne_colorLayer setPosition:ccp(10000,10000)];
    
    
    if(isIpad){
        [finishOne_colorLayer setTextureRect:CGRectMake(728, 326, 4, 4)];
    }else{
        [finishOne_colorLayer setTextureRect:CGRectMake(728/2, 326/2, 2, 2)];
    }
    
    
    
    if(isIpad){
        [finishOne_colorLayer setScaleX:450];
        [finishOne_colorLayer setScaleY:300];
    }else{
        [finishOne_colorLayer setScaleX:300];
        [finishOne_colorLayer setScaleY:200];
    }
    
    [finishOne_colorLayer setColor:ccc3(0, 0, 0)];
    [finishOne_colorLayer setOpacity:255];
    finishOne_colorLayerOpacity = 255;
    [finishOne_colorLayer setPosition:ccp([UIScreen mainScreen].bounds.size.height/2, [UIScreen mainScreen].bounds.size.width/2)];
    
    isTransitioning = false;
    
}


-(void) gotoRestart{
    [[CCDirector sharedDirector] replaceScene: [NullScene scene]];
    return;
    
    currentCombo = 0;
    maxCombo = 0;
    comboLevel = 0;
    comboRemain = 0;
    currentTurtleCoin = 0;
    
    gameLevel = 0;
    gameRound = 0;
    
    timeRemain = maxTime;
    
    [uILayer restart];
    [miniGame restart];
}

-(void) initReady{
    /*s_ready  = [CCSprite spriteWithTexture:ss_Gameover.texture rect:CGRectMake(0,0,456/2,80/2)];
    [ss_Gameover addChild:s_ready z:kDeapth_Gameover];
    [s_ready setPosition:ccp(10000,10000)];
    
    [self setToReady];*/
}

-(void) setToReady{
    /*readyTimer = 0;
    readyX = 240;
    readyY = 160;
    readyScale = 0;
    readyBlacklayerOpacity = 255;*/
}

-(void) initBombScripts{
    bombScript = [[BombScript node] retain];
    bombScript2 = [[BombScript2 node] retain];;
}

-(void) initMenu{
    s_blackTranspancy_bg = [CCLayerColor layerWithColor:ccc4(0, 0, 0, 200)];
    [self addChild:s_blackTranspancy_bg z:kDeapth_Menu1];
    [s_blackTranspancy_bg setPosition:ccp(1000,10000)];
    
    s_menu_instruction = [CCSprite spriteWithFile:@"s_menu_instruction_off.png"];
    s_menu_resume = [CCSprite spriteWithFile:@"s_menu_resume_off.png"];
    s_menu_restart = [CCSprite spriteWithFile:@"s_menu_restart_off.png"];
    s_menu_exit = [CCSprite spriteWithFile:@"s_menu_exit_off.png"];
    s_gameover = [CCSprite spriteWithTexture:ss_Gameover.texture rect:CGRectMake(0,0,326/textureRatioForFuckingIpad,80/textureRatioForFuckingIpad)];
    
    [self addChild:s_menu_instruction z:kDeapth_Menu];
    [self addChild:s_menu_resume z:kDeapth_Menu];
    [self addChild:s_menu_restart z:kDeapth_Menu];
    [self addChild:s_menu_exit z:kDeapth_Menu];
    [ss_Gameover addChild:s_gameover z:kDeapth_Gameover];
    
    [s_menu_instruction setPosition:ccp(10000,10000)];
    [s_menu_resume setPosition:ccp(10000,10000)];
    [s_menu_restart setPosition:ccp(10000,10000)];
    [s_menu_exit setPosition:ccp(10000,10000)];
    [s_gameover setPosition:ccp(10000,10000)];
}

-(void) initUI{
    uILayer = [[UILayer alloc] init];
}

-(void) initMiniGame{
    if(currentChosenMiniGame == 1){
        miniGame = [[Mini01 alloc] init];
        [self addChild:miniGame z:kDeapth_miniBasic];
    }
    if(currentChosenMiniGame == 2){
        miniGame = [[Mini02 alloc] init];
        [self addChild:miniGame z:kDeapth_miniBasic];
    }
    if(currentChosenMiniGame == 3){
        miniGame = [[Mini03 alloc] init];
        [self addChild:miniGame z:kDeapth_miniBasic];
    }
    if(currentChosenMiniGame == 4){
        miniGame = [[Mini04 alloc] init];
        [self addChild:miniGame z:kDeapth_miniBasic];
    }
    if(currentChosenMiniGame == 5){
        miniGame = [[Mini05 alloc] init];
        [self addChild:miniGame z:kDeapth_miniBasic];
    }
    if(currentChosenMiniGame == 7){
        miniGame = [[Mini07 alloc] init];
        [self addChild:miniGame z:kDeapth_miniBasic];
    }
    if(currentChosenMiniGame == 10){
        miniGame = [[Mini10 alloc] init];
        [self addChild:miniGame z:kDeapth_miniBasic];
    }
    if(currentChosenMiniGame == 11){
        miniGame = [[Mini11 alloc] init];
        [self addChild:miniGame z:kDeapth_miniBasic];
    }
    if(currentChosenMiniGame == 12){
        miniGame = [[Mini12 alloc] init];
        [self addChild:miniGame z:kDeapth_miniBasic];
    }
    if(currentChosenMiniGame == 13){
        miniGame = [[Mini13 alloc] init];
        [self addChild:miniGame z:kDeapth_miniBasic];
    }
    if(currentChosenMiniGame == 101){
        miniGame = [[Mini101 alloc] init];
        [self addChild:miniGame z:kDeapth_miniBasic];
    }
    if(currentChosenMiniGame == 102){
        miniGame = [[Mini102 alloc] init];
        [self addChild:miniGame z:kDeapth_miniBasic];
    }
    if(currentChosenMiniGame == 103){
        miniGame = [[Mini103 alloc] init];
        [self addChild:miniGame z:kDeapth_miniBasic];
    }
}

-(void) gameover{
    [s_blackTranspancy_bg setPosition:ccp(0,0)];
    
    gameover_scale += (1 - gameover_scale)/7;
    
    static int ranGameoverX;
    static int ranGameoverY;
    
    if(gameoverTimer < 15){
        ranGameoverX = arc4random() % 16 - 8;
        ranGameoverY = arc4random() % 16 - 8;
    }else if(gameoverTimer < 30){
        ranGameoverX = arc4random() % 8 - 4;
        ranGameoverY = arc4random() % 8 - 4;
    }else if(gameoverTimer < 45){
        ranGameoverX = arc4random() % 4 - 2;
        ranGameoverY = arc4random() % 4 - 2;
    }else{
        ranGameoverX = 0;
        ranGameoverY = 0;
    }
    
    [s_gameover setPosition:ccp([UIScreen mainScreen].bounds.size.height/2 + ranGameoverX,[UIScreen mainScreen].bounds.size.width/2 + ranGameoverY)];
    [s_gameover setScale:gameover_scale];
    
    
    gameoverTimer++;
    
    
    timeRunOut_Fast_Gain -= 0.05;

    if(timeRunOut_Fast_Gain < 0){
        timeRunOut_Fast_Gain = 0;
        [musicController stopThisSound:kSound_TimeRunOutSlow];
        [musicController stopThisSound:kSound_TimeRunOutFast];
    }
    
    [musicController changeGain:kSound_TimeRunOutFast gain:timeRunOut_Fast_Gain*timeRunOut_Fast_MaxGain];
    
    isTapWronglyAndDisableBtns = true;
    
    //printf("gameover:%i\n",gameoverTimer);
    
    if(gameoverTimer == 180){
        [self afterGameOver];
    }
}

-(void) afterGameOver{
    p4rc_isInMiniGame = true;
    p4rc_canDisplayScore = true;
    [[CCDirector sharedDirector] replaceScene: [ScoreShownScene scene]];
}

-(void) ready{
    /*if(readyBlacklayerOpacity > 170){
        readyBlacklayerOpacity-=5;
    }
    
    //if(readyTimer == -
    readyTimer++;*/
}

-(void) gameStep:(ccTime) dt{
    
    //ADDED LATER
    if(currentCombo < comboToStart){
        comboRemain = 1;
    }
    
    if(hasGameover){
        [self gameover];
        [self manageBombGameoverAni];
    }else{
        if(currentChosenMiniGame == 3 || currentChosenMiniGame == 10  || currentChosenMiniGame == 1 || currentChosenMiniGame == 13 || currentChosenMiniGame == 2 || currentChosenMiniGame == 103){
            [self manageBombGameoverAni];
        }
    }
    
    if(isStopping){
        return;
    }
    
    palyTimer++;
    if(palyTimer < 60){
        finishOne_colorLayerOpacity -= 10;
        if(finishOne_colorLayerOpacity < 0){
            if(finishOne_colorLayerOpacity >= -10){
                [finishOne_colorLayer setScaleX:0];
                [finishOne_colorLayer setScaleY:0];
            }
            finishOne_colorLayerOpacity = -99999;
        }else{
            [finishOne_colorLayer setOpacity:finishOne_colorLayerOpacity];
        }
    }
    
    cannotPlayTurtleHeadOutSound = false;
    
    if(currentChosenMiniGame != 10){
         timeRemain -= dt;
    }
    
    if(timeRemain < 0){
        timeRemain = 0;
        isStopping = true;
        //[self gameover];
        //[self manageBombGameoverAni];
        
        if(!hasGameover){
            hasGameover = true;
            [self setToBombingGameover];
            [musicController playThisSound:kSound_GameOver isLoop:NO gain:1.0];
            
            ad_howmanyGamesPlayed++;
        }
    }
    
   /* [self manageBombAni];
    [self manageBombComboAni];
    [self manageBombShakeAni];
    [self managePlusTimeAni];
    [self manageBombCannonAni];*/
    
    
    
    [uILayer manage:dt];
    [miniGame manage:dt];
    
    [bombScript manage];
    [bombScript2 manage];
    
}

- (void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
	for( UITouch *touch in touches ) {
		CGPoint location = [touch locationInView: [touch view]];
		location = [[CCDirector sharedDirector] convertToGL: location];

       /* if(currentChosenMiniGame == 1){
            if(currentCombo < 10){
                turtleCoinShinning_angleSpeed += 0.3;
            }else{
                turtleCoinShinning_angleSpeed += 0.5;
            }
            [uILayer gainCombo:1];
        }
        if(currentChosenMiniGame == 4){
            
        }*/
        
    }
}


- (void) dealloc
{
	printf("PlayScene Dealloc\n");
    isTapWronglyAndDisableBtns = false;
    
    ad_isInGaming = false;
    
    [miniGame release];
    [uILayer release];
    
    [bombScript release];
    [bombScript2 release];
    
	[super dealloc];
}

-(void) initBomobingAni{
    bombingAniIdx = 0;
    bombingAniMax = 25;
    
    for(int i = 0 ; i < bombingAniMax+1 ; i++){
        bombingAniStruct[i] = malloc(sizeof(eBombingAniStruct));
        
        bombingAniStruct[i]->aniTimer = 0;
        bombingAniStruct[i]->isAni = false;
         bombingAniStruct[i]->isAniCombo = false;
         bombingAniStruct[i]->isAniShake = false;
        bombingAniStruct[i]->isAniCannon = false;
        bombingAniStruct[i]->isAniGameover = false;
        
        
        if(i == bombingAniMax){
            static float fuckOffsetX;
            static float fuckOffsetY;
            fuckOffsetX = 504/textureRatioForFuckingIpad;
            fuckOffsetY = 454/textureRatioForFuckingIpad - 80/textureRatioForFuckingIpad;
        
            
            bombingAniStruct[i]->s_buum = [CCSprite spriteWithTexture:ss_Gameover.texture rect:CGRectMake(504/textureRatioForFuckingIpad - fuckOffsetX,454/textureRatioForFuckingIpad - fuckOffsetY,140/textureRatioForFuckingIpad,134/textureRatioForFuckingIpad)];
            bombingAniStruct[i]->s_blick = [CCSprite spriteWithTexture:ss_Gameover.texture rect:CGRectMake(504/textureRatioForFuckingIpad - fuckOffsetX,590/textureRatioForFuckingIpad - fuckOffsetY,128/textureRatioForFuckingIpad,128/textureRatioForFuckingIpad)];
            bombingAniStruct[i]->s_wave = [CCSprite spriteWithTexture:ss_Gameover.texture rect:CGRectMake(646/textureRatioForFuckingIpad - fuckOffsetX,454/textureRatioForFuckingIpad - fuckOffsetY,106/textureRatioForFuckingIpad,108/textureRatioForFuckingIpad)];
            
            for(int j = 0 ; j < 3 ; j++){
                bombingAniStruct[i]->s_debris[j] = [CCSprite spriteWithTexture:ss_Gameover.texture rect:CGRectMake(720/textureRatioForFuckingIpad - fuckOffsetX,590/textureRatioForFuckingIpad - fuckOffsetY,22/textureRatioForFuckingIpad,14/textureRatioForFuckingIpad)];
            }
            
            for(int j = 0 ; j < 8 ; j++){
                bombingAniStruct[i]->s_bigClouds[j] = [CCSprite spriteWithTexture:ss_Gameover.texture rect:CGRectMake(646/textureRatioForFuckingIpad - fuckOffsetX,590/textureRatioForFuckingIpad - fuckOffsetY,72/textureRatioForFuckingIpad,70/textureRatioForFuckingIpad)];
            }
            
            for(int j = 0 ; j < 5 ; j++){
                bombingAniStruct[i]->s_smallClouds[j] = [CCSprite spriteWithTexture:ss_Gameover.texture rect:CGRectMake(720/textureRatioForFuckingIpad - fuckOffsetX,606/textureRatioForFuckingIpad - fuckOffsetY,26/textureRatioForFuckingIpad,28/textureRatioForFuckingIpad)];
            }

            
            for(int j = 0 ; j < 5 ; j++){
                [ss_Gameover addChild:bombingAniStruct[i]->s_smallClouds[j] z:kDeapth_Turtle_Bombing2];
                [bombingAniStruct[i]->s_smallClouds[j] setPosition:ccp(10000,10000)];
            }
            
            [ss_Gameover addChild:bombingAniStruct[i]->s_wave z:kDeapth_Turtle_Bombing2];
            [bombingAniStruct[i]->s_wave setPosition:ccp(10000,10000)];
            
            for(int j = 0 ; j < 8 ; j++){
                [ss_Gameover addChild:bombingAniStruct[i]->s_bigClouds[j] z:kDeapth_Turtle_Bombing2];
                [bombingAniStruct[i]->s_bigClouds[j] setPosition:ccp(10000,10000)];
            }
            
            for(int j = 0 ; j < 3 ; j++){
                [ss_Gameover addChild:bombingAniStruct[i]->s_debris[j] z:kDeapth_Turtle_Bombing2];
                [bombingAniStruct[i]->s_debris[j] setPosition:ccp(10000,10000)];
            }
            
            [ss_Gameover addChild:bombingAniStruct[i]->s_blick z:kDeapth_Turtle_Bombing2];
            [ss_Gameover addChild:bombingAniStruct[i]->s_buum z:kDeapth_Turtle_Bombing2];
        }else{
            static int bombDepth;
            if(currentChosenMiniGame == 11){
                bombDepth = kDeapth_Penguin_Bombing;
            }else{
                bombDepth = kDeapth_Turtle_Bombing;
            }
            
            
            bombingAniStruct[i]->s_buum = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(504/textureRatioForFuckingIpad,454/textureRatioForFuckingIpad,140/textureRatioForFuckingIpad,134/textureRatioForFuckingIpad)];
            bombingAniStruct[i]->s_blick = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(504/textureRatioForFuckingIpad,590/textureRatioForFuckingIpad,128/textureRatioForFuckingIpad,128/textureRatioForFuckingIpad)];
            bombingAniStruct[i]->s_wave = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(646/textureRatioForFuckingIpad,454/textureRatioForFuckingIpad,106/textureRatioForFuckingIpad,108/textureRatioForFuckingIpad)];
            
            for(int j = 0 ; j < 3 ; j++){
                bombingAniStruct[i]->s_debris[j] = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(720/textureRatioForFuckingIpad,590/textureRatioForFuckingIpad,22/textureRatioForFuckingIpad,14/textureRatioForFuckingIpad)];
            }
            
            for(int j = 0 ; j < 8 ; j++){
                bombingAniStruct[i]->s_bigClouds[j] = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(646/textureRatioForFuckingIpad,590/textureRatioForFuckingIpad,72/textureRatioForFuckingIpad,70/textureRatioForFuckingIpad)];
            }
            
            for(int j = 0 ; j < 5 ; j++){
                bombingAniStruct[i]->s_smallClouds[j] = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(720/textureRatioForFuckingIpad,606/textureRatioForFuckingIpad,26/textureRatioForFuckingIpad,28/textureRatioForFuckingIpad)];
            }

            
            for(int j = 0 ; j < 5 ; j++){
                [ss_Character addChild:bombingAniStruct[i]->s_smallClouds[j] z:bombDepth];
                [bombingAniStruct[i]->s_smallClouds[j] setPosition:ccp(10000,10000)];
            }
            
            [ss_Character addChild:bombingAniStruct[i]->s_wave z:kDeapth_Turtle_Bombing];
            [bombingAniStruct[i]->s_wave setPosition:ccp(10000,10000)];
            
            for(int j = 0 ; j < 8 ; j++){
                [ss_Character addChild:bombingAniStruct[i]->s_bigClouds[j] z:bombDepth];
                [bombingAniStruct[i]->s_bigClouds[j] setPosition:ccp(10000,10000)];
            }
            
            for(int j = 0 ; j < 3 ; j++){
                [ss_Character addChild:bombingAniStruct[i]->s_debris[j] z:bombDepth];
                [bombingAniStruct[i]->s_debris[j] setPosition:ccp(10000,10000)];
            }
            
            [ss_Character addChild:bombingAniStruct[i]->s_blick z:bombDepth];
            [ss_Character addChild:bombingAniStruct[i]->s_buum z:bombDepth];
        }
       
        
        [bombingAniStruct[i]->s_blick setPosition:ccp(10000,10000)];
        [bombingAniStruct[i]->s_buum setPosition:ccp(10000,10000)];
    }
}

-(void) setToShakingBomb:(float)_turtleX turtleY:(float)_turtleY{
    //printf("setToShakeBomb:%i\n",bombingAniIdx);
    bombingAniStruct[bombingAniIdx]->isAniShake = true;
    bombingAniStruct[bombingAniIdx]->aniTimer = 0;
    
    //  printf("setToBombing:%4.8f %4.8f\n",_turtleX, _turtleY);
    
    bombingAniStruct[bombingAniIdx]->aniX = _turtleX - 350;
    bombingAniStruct[bombingAniIdx]->aniY = _turtleY + 269;
    
    
    
    bombingAniIdx++;
    if(bombingAniIdx == bombingAniMax){
        bombingAniIdx = 0;
    }
}

-(void) setToBombing:(float)_turtleX turtleY:(float)_turtleY{
    
    bombingAniStruct[bombingAniIdx]->isAni = true;
    bombingAniStruct[bombingAniIdx]->aniTimer = 0;
    
  //  printf("setToBombing:%4.8f %4.8f\n",_turtleX, _turtleY);
    
    bombingAniStruct[bombingAniIdx]->aniX = _turtleX - 350;
    bombingAniStruct[bombingAniIdx]->aniY = _turtleY + 269;
    

    bombingAniIdx++;
    if(bombingAniIdx == bombingAniMax){
        bombingAniIdx = 0;
    }
}

-(void) setComboExtraValues{
    return;
    comboLevel = 0.65 + comboLevel * 0.5;
    comoboReduceSpeed = 0.01 + comboLevel * 0.5;
    turtleCoinShinning_angleAcceleration = 0.3 + + comboLevel * 0.3;
    
   // printf("setComboExtraValues:%i\n", comboLevel);
}

-(void) setToBombingCannon:(float)_x y:(float)_y{
    bombingAniStruct[bombingAniIdx]->isAniCannon = true;
    bombingAniStruct[bombingAniIdx]->aniTimer = 0;
    
    if(currentChosenMiniGame == 3 || currentChosenMiniGame == 11 || currentChosenMiniGame == 7){
        static float superFuxkAngleDiff;
        static float superFuxkOriX;
        static float superFuxkOriY;
        static float superFuxkOffsetX;
        static float superFuxkOffsetY;
        static float superFuxkFuxkX;
        static float superFuxkFuxkY;
        
        superFuxkOffsetX = -58 * 2/textureRatioForFuckingIpad * cos(cannonAngle * M_PI/180 + M_PI/2);
        superFuxkOffsetY = 58 * 2/textureRatioForFuckingIpad * sin(cannonAngle * M_PI/180 + M_PI/2) - 58 * 2/textureRatioForFuckingIpad;
        
        superFuxkAngleDiff = -cannonAngle * M_PI/180;
        superFuxkOriX = 91 * wholeCannonScaleFromSocurce * 2 * 2/textureRatioForFuckingIpad;
        superFuxkOriY = 35 * wholeCannonScaleFromSocurce * 2 * 2/textureRatioForFuckingIpad;
        superFuxkFuxkX = _x + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff) - superFuxkOffsetX * wholeCannonScaleFromSocurce;
        superFuxkFuxkY = _y + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff) - superFuxkOffsetY * wholeCannonScaleFromSocurce;
        
        bombingAniStruct[bombingAniIdx]->aniX = superFuxkFuxkX - 350;
        bombingAniStruct[bombingAniIdx]->aniY = superFuxkFuxkY + 269;
    }else{
        bombingAniStruct[bombingAniIdx]->aniX = _x - 350 + 70*2/textureRatioForFuckingIpad;
        bombingAniStruct[bombingAniIdx]->aniY = _y + 269 + 75*2/textureRatioForFuckingIpad;
        
        if(isIpad){
            bombingAniStruct[bombingAniIdx]->aniX -= 30;
            bombingAniStruct[bombingAniIdx]->aniY += 30;
        }
    }
    
    
    bombingAniIdx++;
    if(bombingAniIdx == bombingAniMax){
        bombingAniIdx = 0;
    }
    
    [self setComboExtraValues];
}

-(void) setToBombingTimePlus:(float)_x y:(float)_y{
    if(currentChosenMiniGame == 3){
        return;
    }
    
    bombingAniStruct[bombingAniIdx]->isAniPlusTime = true;
    bombingAniStruct[bombingAniIdx]->aniTimer = 0;
    
    printf("setToBombing:%4.8f %4.8f\n",_x, _y);
    
    bombingAniStruct[bombingAniIdx]->aniX = _x - 350;
    bombingAniStruct[bombingAniIdx]->aniY = _y + 269;
    
   /* if(isIpad){
        bombingAniStruct[bombingAniIdx]->aniX = _x - 350*2/textureRatioForFuckingIpad;
        bombingAniStruct[bombingAniIdx]->aniY = _y + 269*2/textureRatioForFuckingIpad;
    }*/
    
    
    
    bombingAniIdx++;
    if(bombingAniIdx == bombingAniMax){
        bombingAniIdx = 0;
    }
}

-(void)setToBombingCombo{
    
    //printf("setToBombingCombo\n");
    
    bombingAniStruct[bombingAniIdx]->isAniCombo = true;
    bombingAniStruct[bombingAniIdx]->aniTimer = 0;
    
    //  printf("setToBombing:%4.8f %4.8f\n",_turtleX, _turtleY);
    
    bombingAniStruct[bombingAniIdx]->aniX = 374 - 350;
    bombingAniStruct[bombingAniIdx]->aniY = 282 + 269;
    
    bombingAniIdx++;
    if(bombingAniIdx == bombingAniMax){
        bombingAniIdx = 0;
    }
    
    [self setComboExtraValues];
}

-(void) setToBombingGameover{
    printf("setToBombingGameover\n");
    bombingAniStruct[bombingAniMax]->isAniGameover = true;
    bombingAniStruct[bombingAniMax]->aniTimer = 0;
    
    bombingAniStruct[bombingAniMax]->aniX = [UIScreen mainScreen].bounds.size.height/2 - 350;
    bombingAniStruct[bombingAniMax]->aniY = 150 + 269;
    if(isIpad){
        float ratioX;
        float ratioY;
        
        ratioX = 1024.0/480.0;
        ratioY = 768.0/320.0;
        
        //bombingAniStruct[bombingAniMax]->aniX = [UIScreen mainScreen].bounds.size.height/2 - 350 * ratioX;
        bombingAniStruct[bombingAniMax]->aniY = 150 + 269 * 2;
    }
    
}


-(void) setToBombingGameoverWithPos:(int)_x y:(int)_y{
    printf("setToBombingGameoverWithPos:%i %i\n",_x,_y);
    bombingAniStruct[bombingAniMax]->isAniGameover = true;
    bombingAniStruct[bombingAniMax]->aniTimer = 0;
    
    
    bombingAniStruct[bombingAniMax]->aniX = _x - 350;
    bombingAniStruct[bombingAniMax]->aniY = _y + 269;
    
    if(isIpad){
        float ratioX;
        float ratioY;
        
        ratioX = 1024.0/480.0;
        ratioY = 768.0/320.0;
        
        //bombingAniStruct[bombingAniMax]->aniX = _x - 350 * ratioX;
        //bombingAniStruct[bombingAniMax]->aniY = _y + 269 * ratioY;
    }
}


-(void) manageBombGameoverAni{
    //return;
    
   // printf("gameoverBombTimer:%i\n",gameoverBombTimer);
    
    gameoverBombTimer++;
    if(gameoverBombTimer % 2 == 0){
        return;
    }
    
     float wholeBombOffsetX = 0;
     float wholeBombOffsetY = 0;
    
     float fuckBombGameoverScale = 1.75;
    
    if(hasGameover){
        fuckBombGameoverScale = 1.75;
    }else{
        //for min igame 03
        fuckBombGameoverScale = 3.0;
        
        if(currentChosenMiniGame == 2){
            gameoverBombTimer++;
        }
    }
    
        
        if(bombingAniStruct[bombingAniMax]->isAniGameover){
            
            //printf("M:%i %i\n",i, bombingAniStruct[bombingAniMax]->aniTimer);
            
            wholeBombOffsetX = bombingAniStruct[bombingAniMax]->aniX;
            wholeBombOffsetY = bombingAniStruct[bombingAniMax]->aniY;
            
            // printf("i:%4.8f %4.8f idx:%i\n",wholeBombOffsetX,wholeBombOffsetY, bombingAniMax);
            
            bombingAniStruct[bombingAniMax]->aniTimer++;
            
            //Frame 3
            if(bombingAniStruct[bombingAniMax]->aniTimer == 1){
                [bombingAniStruct[bombingAniMax]->s_buum setPosition:ccp(356.4 + wholeBombOffsetX, -259.7 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_buum setRotation:25.8];
                [bombingAniStruct[bombingAniMax]->s_buum setScaleX:0.522 * 1.537 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_buum setScaleY:0.522 * 1.537 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_buum setOpacity:50.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_blick setPosition:ccp(350.5 + wholeBombOffsetX, -261.4 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_blick setScaleX:1.064];
                [bombingAniStruct[bombingAniMax]->s_blick setScaleY:1.064];
                [bombingAniStruct[bombingAniMax]->s_blick setOpacity:33.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_wave setPosition:ccp(351.5 + wholeBombOffsetX, -265.4 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_wave setScaleX:0.335 * 2.099 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_wave setScaleY:0.335 * 2.099 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_wave setOpacity:39.0/100.0 * 255.0];
            }
            
            //Frame 4
            if(bombingAniStruct[bombingAniMax]->aniTimer == 2){
                [bombingAniStruct[bombingAniMax]->s_buum setPosition:ccp(360.1 + wholeBombOffsetX, -264.2 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_buum setRotation:51.9];
                [bombingAniStruct[bombingAniMax]->s_buum setScaleX:0.859 * 1.537 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_buum setScaleY:0.859 * 1.537 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_buum setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_blick setPosition:ccp(350.5 + wholeBombOffsetX, -261.5 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_blick setScaleX:1.527];
                [bombingAniStruct[bombingAniMax]->s_blick setScaleY:1.527];
                [bombingAniStruct[bombingAniMax]->s_blick setOpacity:67.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_wave setPosition:ccp(351.5 + wholeBombOffsetX, -265.4 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_wave setScaleX:0.5 * 2.099 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_wave setScaleY:0.5 * 2.099 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_wave setOpacity:79.0/100.0 * 255.0];
            }
            
            //Frame 5
            if(bombingAniStruct[bombingAniMax]->aniTimer == 3){
                [bombingAniStruct[bombingAniMax]->s_buum setPosition:ccp(353.6 + wholeBombOffsetX, -266.0 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_buum setRotation:86.2];
                [bombingAniStruct[bombingAniMax]->s_buum setScaleX:0.534 * 1.537 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_buum setScaleY:0.534 * 1.537 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_buum setOpacity:50.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_blick setPosition:ccp(350.5 + wholeBombOffsetX, -261.5 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_blick setScaleX:1.991];
                [bombingAniStruct[bombingAniMax]->s_blick setScaleY:1.991];
                [bombingAniStruct[bombingAniMax]->s_blick setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_wave setPosition:ccp(351.5 + wholeBombOffsetX, -265.4 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_wave setScaleX:0.554 * 2.099 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_wave setScaleY:0.554 * 2.099 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_wave setOpacity:75/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_debris[0] setPosition:ccp(345.8 + wholeBombOffsetX, -267.5 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_debris[0] setRotation:139.6];
                [bombingAniStruct[bombingAniMax]->s_debris[0] setScaleX:0.419 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_debris[0] setScaleY:0.636 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_debris[0] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_debris[1] setPosition:ccp(345.8 + wholeBombOffsetX, -254.0 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_debris[1] setRotation:-124.6];
                [bombingAniStruct[bombingAniMax]->s_debris[1] setScaleX:0.636 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_debris[1] setScaleY:0.899 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_debris[1] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_debris[2] setPosition:ccp(367.8 + wholeBombOffsetX, -254.5 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_debris[2] setRotation:-32.3];
                [bombingAniStruct[bombingAniMax]->s_debris[2] setScaleX:0.636 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_debris[2] setScaleY:0.636 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_debris[2] setOpacity:100.0/100.0 * 255.0];
            }
            
            //Frame 6
            if(bombingAniStruct[bombingAniMax]->aniTimer == 4){
                [bombingAniStruct[bombingAniMax]->s_buum setPosition:ccp(353000, 10000)];
                
                [bombingAniStruct[bombingAniMax]->s_blick setPosition:ccp(350.5 + wholeBombOffsetX, -261.5 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_blick setScaleX:1.492];
                [bombingAniStruct[bombingAniMax]->s_blick setScaleY:1.492];
                [bombingAniStruct[bombingAniMax]->s_blick setOpacity:67.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_wave setPosition:ccp(351.5 + wholeBombOffsetX, -265.4 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_wave setScaleX:0.639 * 2.099 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_wave setScaleY:0.639 * 2.099 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_wave setOpacity:71.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_debris[0] setPosition:ccp(335.3 + wholeBombOffsetX, -273.6 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_debris[0] setRotation:138.9];
                [bombingAniStruct[bombingAniMax]->s_debris[0] setScaleX:0.424 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_debris[0] setScaleY:0.635 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_debris[0] setOpacity:89.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_debris[1] setPosition:ccp(338.6 + wholeBombOffsetX, -239.8 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_debris[1] setRotation:-123.1];
                [bombingAniStruct[bombingAniMax]->s_debris[1] setScaleX:0.636 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_debris[1] setScaleY:0.899 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_debris[1] setOpacity:91.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_debris[2] setPosition:ccp(384.5 + wholeBombOffsetX, -242.6 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_debris[2] setRotation:-32.3];
                [bombingAniStruct[bombingAniMax]->s_debris[2] setScaleX:0.636 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_debris[2] setScaleY:0.636 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_debris[2] setOpacity:90.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[0] setPosition:ccp(364.1 + wholeBombOffsetX, -265.6 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[0] setRotation:113.8];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[0] setScaleX:1.1113 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[0] setScaleY:1.1113 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[0] setOpacity:41.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[1] setPosition:ccp(364.7 + wholeBombOffsetX, -248.4 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[1] setRotation:51.6];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[1] setScaleX:1.528 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[1] setScaleY:1.528 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[1] setOpacity:41.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[2] setPosition:ccp(346.6 + wholeBombOffsetX, -245.1 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[2] setRotation:51.6];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[2] setScaleX:0.973 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[2] setScaleY:0.973 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[2] setOpacity:41.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[3] setPosition:ccp(351.4 + wholeBombOffsetX, -272.2 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[3] setRotation:144.7];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[3] setScaleX:1.559 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[3] setScaleY:1.559 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[3] setOpacity:41.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[4] setPosition:ccp(335.6 + wholeBombOffsetX, -249.8 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[4] setRotation:-5];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[4] setScaleX:1.529 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[4] setScaleY:1.527 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[4] setOpacity:41.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[5] setPosition:ccp(349.8 + wholeBombOffsetX, -256.2 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[5] setRotation:-21.5];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[5] setScaleX:1.289 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[5] setScaleY:1.289 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[5] setOpacity:22.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[6] setPosition:ccp(341.6 + wholeBombOffsetX, -259.8 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[6] setRotation:-10.8];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[6] setScaleX:1.1185 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[6] setScaleY:1.1185 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[6] setOpacity:22.0/100.0 * 255.0];
            }
            
            
            //Frame 7
            if(bombingAniStruct[bombingAniMax]->aniTimer == 5){
                [bombingAniStruct[bombingAniMax]->s_blick setPosition:ccp(350.5 + wholeBombOffsetX, -261.5 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_blick setScaleX:0.994 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_blick setScaleY:0.994 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_blick setOpacity:33.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_wave setPosition:ccp(351.5 + wholeBombOffsetX, -265.4 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_wave setScaleX:0.753 * 2.099 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_wave setScaleY:0.753 * 2.099 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_wave setOpacity:64.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_debris[0] setPosition:ccp(324.1 + wholeBombOffsetX, -280.2 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_debris[0] setRotation:137.9];
                [bombingAniStruct[bombingAniMax]->s_debris[0] setScaleX:0.424 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_debris[0] setScaleY:0.635 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_debris[0] setOpacity:77.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_debris[1] setPosition:ccp(331.1 + wholeBombOffsetX, -224.4 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_debris[1] setRotation:-121.4];
                [bombingAniStruct[bombingAniMax]->s_debris[1] setScaleX:0.636 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_debris[1] setScaleY:0.899 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_debris[1] setOpacity:82.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_debris[2] setPosition:ccp(402.1 + wholeBombOffsetX, -230.0 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_debris[2] setRotation:-32.3];
                [bombingAniStruct[bombingAniMax]->s_debris[2] setScaleX:0.636 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_debris[2] setScaleY:0.636 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_debris[2] setOpacity:79.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[0] setPosition:ccp(367.3 + wholeBombOffsetX, -273.6 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[0] setRotation:113.3];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[0] setScaleX:1.598 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[0] setScaleY:1.598 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[0] setOpacity:79.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[1] setPosition:ccp(367.6 + wholeBombOffsetX, -247.9 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[1] setRotation:43.6];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[1] setScaleX:2.091 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[1] setScaleY:2.091 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[1] setOpacity:79.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[2] setPosition:ccp(345.4 + wholeBombOffsetX, -245.8 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[2] setRotation:43.6];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[2] setScaleX:1.321 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[2] setScaleY:1.321 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[2] setOpacity:79/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[3] setPosition:ccp(351.1 + wholeBombOffsetX, -277.1 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[3] setRotation:151.2];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[3] setScaleX:2.117 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[3] setScaleY:2.117 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[3] setOpacity:79.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[4] setPosition:ccp(330.0 + wholeBombOffsetX, -247.5 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[4] setRotation:-9.8];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[4] setScaleX:2.015 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[4] setScaleY:2.015 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[4] setOpacity:79.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[5] setPosition:ccp(349.8 + wholeBombOffsetX, -256.4 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[5] setRotation:-14.6];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[5] setScaleX:1.613 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[5] setScaleY:1.613 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[5] setOpacity:47.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[6] setPosition:ccp(341.6 + wholeBombOffsetX, -259.8 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[6] setRotation:-22.6];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[6] setScaleX:1.499 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[6] setScaleY:1.499 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[6] setOpacity:46.0/100.0 * 255.0];
            }
            
            //Frame 8
            if(bombingAniStruct[bombingAniMax]->aniTimer == 6){
                [bombingAniStruct[bombingAniMax]->s_blick setPosition:ccp(10000 , 261.5)];
                
                [bombingAniStruct[bombingAniMax]->s_wave setPosition:ccp(351.5 + wholeBombOffsetX, -265.4 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_wave setScaleX:0.89 * 2.099 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_wave setScaleY:0.89 * 2.099 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_wave setOpacity:56.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_debris[0] setPosition:ccp(313.1 + wholeBombOffsetX, -286.9 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_debris[0] setRotation:136.9];
                [bombingAniStruct[bombingAniMax]->s_debris[0] setScaleX:0.405 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_debris[0] setScaleY:0.635 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_debris[0] setOpacity:65.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_debris[1] setPosition:ccp(323.6 + wholeBombOffsetX, -209.2 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_debris[1] setRotation:-119.8];
                [bombingAniStruct[bombingAniMax]->s_debris[1] setScaleX:0.636 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_debris[1] setScaleY:0.925 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_debris[1] setOpacity:73/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_debris[2] setPosition:ccp(419.8 + wholeBombOffsetX, -217.4 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_debris[2] setRotation:-32.3];
                [bombingAniStruct[bombingAniMax]->s_debris[2] setScaleX:0.636 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_debris[2] setScaleY:0.636 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_debris[2] setOpacity:68.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[0] setPosition:ccp(368.9 + wholeBombOffsetX, -277.9 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[0] setRotation:113.1];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[0] setScaleX:1.856 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[0] setScaleY:1.856 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[0] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[1] setPosition:ccp(369.2 + wholeBombOffsetX, -247.7 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[1] setRotation:39.3];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[1] setScaleX:2.392 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[1] setScaleY:2.392 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[1] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[2] setPosition:ccp(344.7 + wholeBombOffsetX, -246.2 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[2] setRotation:39.3];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[2] setScaleX:1.508 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[2] setScaleY:1.508 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[2] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[3] setPosition:ccp(350.9 + wholeBombOffsetX, -279.6 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[3] setRotation:154.5];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[3] setScaleX:2.414 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[3] setScaleY:2.414 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[3] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[4] setPosition:ccp(327.1 + wholeBombOffsetX, -246.4 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[4] setRotation:-12.5];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[4] setScaleX:2.273 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[4] setScaleY:2.273 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[4] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[5] setPosition:ccp(349.7 + wholeBombOffsetX, -256.3 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[5] setRotation:-8.3];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[5] setScaleX:1.915 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[5] setScaleY:1.915 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[5] setOpacity:70.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[6] setPosition:ccp(341.6 + wholeBombOffsetX, -259.8 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[6] setRotation:-33.8];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[6] setScaleX:1.797 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[6] setScaleY:1.797 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[6] setOpacity:69.0/100.0 * 255.0];
                
                
                [bombingAniStruct[bombingAniMax]->s_smallClouds[0] setPosition:ccp(339 + wholeBombOffsetX, -258.5 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[0] setRotation:47.6];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[0] setScaleX:2.801 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[0] setScaleY:2.801 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[0] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_smallClouds[1] setPosition:ccp(347.0 + wholeBombOffsetX, -263.8 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[1] setRotation:-62.4];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[1] setScaleX:1.606 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[1] setScaleY:1.606 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[1] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_smallClouds[2] setPosition:ccp(350.8 + wholeBombOffsetX, -245 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[2] setRotation:78.7];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[2] setScaleX:1.956 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[2] setScaleY:1.956 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[2] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_smallClouds[3] setPosition:ccp(339.8 + wholeBombOffsetX, -251.8 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[3] setRotation:-130.4];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[3] setScaleX:2.226 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[3] setScaleY:2.226 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[3] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_smallClouds[4] setPosition:ccp(358.8 + wholeBombOffsetX, -253.8 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[4] setRotation:0];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[4] setScaleX:2.223 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[4] setScaleY:2.223 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[4] setOpacity:100.0/100.0 * 255.0];
            }
            
            //Frame 9
            if(bombingAniStruct[bombingAniMax]->aniTimer == 7){
                [bombingAniStruct[bombingAniMax]->s_wave setPosition:ccp(351.5 + wholeBombOffsetX, -265.4 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_wave setScaleX:1.045 * 2.099 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_wave setScaleY:1.015 * 2.099 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_wave setOpacity:47.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_debris[0] setPosition:ccp(302.4 + wholeBombOffsetX, -293.1 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_debris[0] setRotation:136.1];
                [bombingAniStruct[bombingAniMax]->s_debris[0] setScaleX:0.401 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_debris[0] setScaleY:0.635 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_debris[0] setOpacity:54.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_debris[1] setPosition:ccp(316.1 + wholeBombOffsetX, -194.1 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_debris[1] setRotation:-118.3];
                [bombingAniStruct[bombingAniMax]->s_debris[1] setScaleX:0.635 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_debris[1] setScaleY:0.934 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_debris[1] setOpacity:64.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_debris[2] setPosition:ccp(437 + wholeBombOffsetX, -205.2 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_debris[2] setRotation:-32.3];
                [bombingAniStruct[bombingAniMax]->s_debris[2] setScaleX:0.636 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_debris[2] setScaleY:0.636 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_debris[2] setOpacity:57.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[0] setPosition:ccp(370.6 + wholeBombOffsetX, -280.2 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[0] setRotation:116.9];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[0] setScaleX:1.8 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[0] setScaleY:1.8 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[0] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[1] setPosition:ccp(370.3 + wholeBombOffsetX, -246.7 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[1] setRotation:35.6];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[1] setScaleX:2.342 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[1] setScaleY:2.342 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[1] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[2] setPosition:ccp(344.+ + wholeBombOffsetX, -244.4 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[2] setRotation:35.6];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[2] setScaleX:1.479 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[2] setScaleY:1.479 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[2] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[3] setPosition:ccp(350.9 + wholeBombOffsetX, -281.1 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[3] setRotation:157.7];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[3] setScaleX:2.365 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[3] setScaleY:2.365 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[3] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[4] setPosition:ccp(325.2 + wholeBombOffsetX, -245.8 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[4] setRotation:-14.8];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[4] setScaleX:2.227 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[4] setScaleY:2.227 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[4] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[5] setPosition:ccp(349.7 + wholeBombOffsetX, -256.3 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[5] setRotation:-3.3];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[5] setScaleX:2.151 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[5] setScaleY:2.151 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[5] setOpacity:88.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[6] setPosition:ccp(341.6 + wholeBombOffsetX, -259.8 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[6] setRotation:-42.9];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[6] setScaleX:2.04 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[6] setScaleY:2.04 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[6] setOpacity:88.0/100.0 * 255.0];
                
                
                [bombingAniStruct[bombingAniMax]->s_smallClouds[0] setPosition:ccp(333.4 + wholeBombOffsetX, -258.4 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[0] setRotation:53.6];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[0] setScaleX:2.722 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[0] setScaleY:2.722 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[0] setOpacity:96.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_smallClouds[1] setPosition:ccp(344.6 + wholeBombOffsetX, -265.4 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[1] setRotation:-64.9];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[1] setScaleX:1.57 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[1] setScaleY:1.57 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[1] setOpacity:96.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_smallClouds[2] setPosition:ccp(350.9 + wholeBombOffsetX, -241.7 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[2] setRotation:83.7];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[2] setScaleX:1.91 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[2] setScaleY:1.91 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[2] setOpacity:96.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_smallClouds[3] setPosition:ccp(337.1 + wholeBombOffsetX, -248.8 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[3] setRotation:-130.4];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[3] setScaleX:2.168 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[3] setScaleY:2.168 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[3] setOpacity:96.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_smallClouds[4] setPosition:ccp(362.6 + wholeBombOffsetX, -253.5 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[4] setRotation:-4.3];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[4] setScaleX:2.174 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[4] setScaleY:2.174 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[4] setOpacity:96.0/100.0 * 255.0];
            }
            
            //Frame 10
            if(bombingAniStruct[bombingAniMax]->aniTimer == 8){
                [bombingAniStruct[bombingAniMax]->s_wave setPosition:ccp(351.5 + wholeBombOffsetX, -265.4 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_wave setScaleX:1.213 * 2.099 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_wave setScaleY:1.213 * 2.099 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_wave setOpacity:38.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_debris[0] setPosition:ccp(292.1 + wholeBombOffsetX, -299.2 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_debris[0] setRotation:135.4];
                [bombingAniStruct[bombingAniMax]->s_debris[0] setScaleX:0.397 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_debris[0] setScaleY:0.635 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_debris[0] setOpacity:42.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_debris[1] setPosition:ccp(308.8 + wholeBombOffsetX, -179.2 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_debris[1] setRotation:-116.6];
                [bombingAniStruct[bombingAniMax]->s_debris[1] setScaleX:0.635 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_debris[1] setScaleY:0.943 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_debris[1] setOpacity:55.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_debris[2] setPosition:ccp(453.8 + wholeBombOffsetX, -193.2 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_debris[2] setRotation:-32.3];
                [bombingAniStruct[bombingAniMax]->s_debris[2] setScaleX:0.636 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_debris[2] setScaleY:0.636 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_debris[2] setOpacity:47.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[0] setPosition:ccp(372.6 + wholeBombOffsetX, -283.0 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[0] setRotation:121.8];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[0] setScaleX:1.734 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[0] setScaleY:1.734 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[0] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[1] setPosition:ccp(372.2 + wholeBombOffsetX, -244.9 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[1] setRotation:29.1];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[1] setScaleX:2.26 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[1] setScaleY:2.26 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[1] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[2] setPosition:ccp(344.4 + wholeBombOffsetX, -241.1 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[2] setRotation:29.1];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[2] setScaleX:1.431 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[2] setScaleY:1.431 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[2] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[3] setPosition:ccp(350.9 + wholeBombOffsetX, -283.9 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[3] setRotation:163.2];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[3] setScaleX:2.281 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[3] setScaleY:2.281 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[3] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[4] setPosition:ccp(321.9 + wholeBombOffsetX, -244.6 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[4] setRotation:-19.3];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[4] setScaleX:2.146 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[4] setScaleY:2.146 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[4] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[5] setPosition:ccp(349.7 + wholeBombOffsetX, -256.3 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[5] setRotation:0];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[5] setScaleX:2.309 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[5] setScaleY:2.309 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[5] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[6] setPosition:ccp(341.6 + wholeBombOffsetX, -259.8 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[6] setRotation:-49.2];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[6] setScaleX:2.208 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[6] setScaleY:2.208 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[6] setOpacity:100.0/100.0 * 255.0];
                
                
                [bombingAniStruct[bombingAniMax]->s_smallClouds[0] setPosition:ccp(326.9 + wholeBombOffsetX, -258.3 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[0] setRotation:60.4];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[0] setScaleX:2.638 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[0] setScaleY:2.638 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[0] setOpacity:93.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_smallClouds[1] setPosition:ccp(341.7 + wholeBombOffsetX, -267.2 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[1] setRotation:-67.7];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[1] setScaleX:1.531 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[1] setScaleY:1.531 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[1] setOpacity:93.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_smallClouds[2] setPosition:ccp(351.1 + wholeBombOffsetX, -237.8 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[2] setRotation:89.4];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[2] setScaleX:1.858 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[2] setScaleY:1.858 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[2] setOpacity:93.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_smallClouds[3] setPosition:ccp(334.1 + wholeBombOffsetX, -245.2 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[3] setRotation:-130.6];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[3] setScaleX:2.105 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[3] setScaleY:2.105 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[3] setOpacity:93.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_smallClouds[4] setPosition:ccp(367.1 + wholeBombOffsetX, -253.1 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[4] setRotation:-9.5];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[4] setScaleX:2.11 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[4] setScaleY:2.11 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[4] setOpacity:93.0/100.0 * 255.0];
            }
            
            //Frame 11
            if(bombingAniStruct[bombingAniMax]->aniTimer == 9){
                [bombingAniStruct[bombingAniMax]->s_wave setPosition:ccp(351.5 + wholeBombOffsetX, -265.4 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_wave setScaleX:1.386 * 2.099 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_wave setScaleY:1.386 * 2.099 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_wave setOpacity:28.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_debris[0] setPosition:ccp(282.2 + wholeBombOffsetX, -305.1 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_debris[0] setRotation:134.4];
                [bombingAniStruct[bombingAniMax]->s_debris[0] setScaleX:0.393 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_debris[0] setScaleY:0.635 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_debris[0] setOpacity:32.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_debris[1] setPosition:ccp(301.6 + wholeBombOffsetX, -164.8 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_debris[1] setRotation:-115.1];
                [bombingAniStruct[bombingAniMax]->s_debris[1] setScaleX:0.635 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_debris[1] setScaleY:0.952 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_debris[1] setOpacity:46.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_debris[2] setPosition:ccp(469.9 + wholeBombOffsetX, -181.8 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_debris[2] setRotation:-32.3];
                [bombingAniStruct[bombingAniMax]->s_debris[2] setScaleX:0.636 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_debris[2] setScaleY:0.636 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_debris[2] setOpacity:38.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[0] setPosition:ccp(375.0 + wholeBombOffsetX, -286.4 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[0] setRotation:127.6];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[0] setScaleX:1.657 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[0] setScaleY:1.657 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[0] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[1] setPosition:ccp(374.9 + wholeBombOffsetX, -242.6 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[1] setRotation:20.8];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[1] setScaleX:2.153 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[1] setScaleY:2.153 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[1] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[2] setPosition:ccp(344.1 + wholeBombOffsetX, -236.9 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[2] setRotation:20.8];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[2] setScaleX:1.37 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[2] setScaleY:1.37 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[2] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[3] setPosition:ccp(350.9 + wholeBombOffsetX, -287.6 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[3] setRotation:170.2];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[3] setScaleX:2.173 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[3] setScaleY:2.173 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[3] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[4] setPosition:ccp(317.4 + wholeBombOffsetX, -243.0 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[4] setRotation:-24.8];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[4] setScaleX:2.043 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[4] setScaleY:2.043 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[4] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[5] setPosition:ccp(349.7 + wholeBombOffsetX, -256.3 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[5] setRotation:1.5];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[5] setScaleX:2.334 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[5] setScaleY:2.334 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[5] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[6] setPosition:ccp(341.6 + wholeBombOffsetX, -259.8 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[6] setRotation:-50.6];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[6] setScaleX:2.226 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[6] setScaleY:2.226 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[6] setOpacity:100.0/100.0 * 255.0];
                
                
                [bombingAniStruct[bombingAniMax]->s_smallClouds[0] setPosition:ccp(319.6 + wholeBombOffsetX, -258.1 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[0] setRotation:68.2];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[0] setScaleX:2.543 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[0] setScaleY:2.543 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[0] setOpacity:89.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_smallClouds[1] setPosition:ccp(338.5 + wholeBombOffsetX, -269.3 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[1] setRotation:-70.7];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[1] setScaleX:1.487 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[1] setScaleY:1.487 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[1] setOpacity:89.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_smallClouds[2] setPosition:ccp(351.2 + wholeBombOffsetX, -233.6 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[2] setRotation:95.6];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[2] setScaleX:1.78 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[2] setScaleY:1.78 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[2] setOpacity:89.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_smallClouds[3] setPosition:ccp(330.7 + wholeBombOffsetX, -241.4 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[3] setRotation:-130.6];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[3] setScaleX:2.034 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[3] setScaleY:2.034 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[3] setOpacity:89.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_smallClouds[4] setPosition:ccp(372.2 + wholeBombOffsetX, -252.7 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[4] setRotation:-15.3];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[4] setScaleX:2.038 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[4] setScaleY:2.038 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[4] setOpacity:89.0/100.0 * 255.0];
            }
            
            //Frame 12
            if(bombingAniStruct[bombingAniMax]->aniTimer == 10){
                [bombingAniStruct[bombingAniMax]->s_wave setPosition:ccp(351.5 + wholeBombOffsetX, -265.4 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_wave setScaleX:1.558 * 2.099 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_wave setScaleY:1.558 * 2.099 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_wave setOpacity:18.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_debris[0] setPosition:ccp(273.1 + wholeBombOffsetX, -310.5 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_debris[0] setRotation:133.6];
                [bombingAniStruct[bombingAniMax]->s_debris[0] setScaleX:0.389 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_debris[0] setScaleY:0.635 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_debris[0] setOpacity:22.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_debris[1] setPosition:ccp(294.6 + wholeBombOffsetX, -150.9 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_debris[1] setRotation:-113.6];
                [bombingAniStruct[bombingAniMax]->s_debris[1] setScaleX:0.635 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_debris[1] setScaleY:0.96 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_debris[1] setOpacity:38.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_debris[2] setPosition:ccp(485.1 + wholeBombOffsetX, -170.9 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_debris[2] setRotation:-32.3];
                [bombingAniStruct[bombingAniMax]->s_debris[2] setScaleX:0.636 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_debris[2] setScaleY:0.636 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_debris[2] setOpacity:28.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[0] setPosition:ccp(377.6 + wholeBombOffsetX, -290.1 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[0] setRotation:134.1];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[0] setScaleX:1.568 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[0] setScaleY:1.568 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[0] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[1] setPosition:ccp(378 + wholeBombOffsetX, -240.1 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[1] setRotation:11.0];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[1] setScaleX:2.029 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[1] setScaleY:2.029 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[1] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[2] setPosition:ccp(343.8 + wholeBombOffsetX, -232.1 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[2] setRotation:11.0];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[2] setScaleX:1.299 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[2] setScaleY:1.299 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[2] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[3] setPosition:ccp(351.1 + wholeBombOffsetX, -291.8 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[3] setRotation:178.7];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[3] setScaleX:2.048 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[3] setScaleY:2.048 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[3] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[4] setPosition:ccp(312.4 + wholeBombOffsetX, -241.2 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[4] setRotation:-31.3];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[4] setScaleX:1.922 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[4] setScaleY:1.922 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[4] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[5] setPosition:ccp(349.7 + wholeBombOffsetX, -256.3 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[5] setRotation:3.8];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[5] setScaleX:2.366 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[5] setScaleY:2.366 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[5] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[6] setPosition:ccp(341.6 + wholeBombOffsetX, -259.8 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[6] setRotation:-53.1];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[6] setScaleX:2.262 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[6] setScaleY:2.262 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[6] setOpacity:100.0/100.0 * 255.0];
                
                
                [bombingAniStruct[bombingAniMax]->s_smallClouds[0] setPosition:ccp(311.4 + wholeBombOffsetX, -258.1 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[0] setRotation:76.9];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[0] setScaleX:2.437 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[0] setScaleY:2.437 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[0] setOpacity:84.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_smallClouds[1] setPosition:ccp(334.9 + wholeBombOffsetX, -271.5 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[1] setRotation:-74.2];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[1] setScaleX:1.438 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[1] setScaleY:1.438 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[1] setOpacity:84.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_smallClouds[2] setPosition:ccp(351.4 + wholeBombOffsetX, -228.8 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[2] setRotation:102.8];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[2] setScaleX:1.731 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[2] setScaleY:1.731 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[2] setOpacity:84.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_smallClouds[3] setPosition:ccp(326.9 + wholeBombOffsetX, -236.0 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[3] setRotation:-130.9];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[3] setScaleX:1.955 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[3] setScaleY:1.955 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[3] setOpacity:84/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_smallClouds[4] setPosition:ccp(377.8 + wholeBombOffsetX, -252.2 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[4] setRotation:-21.8];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[4] setScaleX:1.959 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[4] setScaleY:1.959 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[4] setOpacity:84.0/100.0 * 255.0];
            }
            
            
            //Frame 13
            if(bombingAniStruct[bombingAniMax]->aniTimer == 11){
                [bombingAniStruct[bombingAniMax]->s_wave setPosition:ccp(351.5 + wholeBombOffsetX, -265.4 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_wave setScaleX:1.72 * 2.099 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_wave setScaleY:1.72 * 2.099 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_wave setOpacity:9.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_debris[0] setPosition:ccp(264.8 + wholeBombOffsetX, -315.4 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_debris[0] setRotation:133.1];
                [bombingAniStruct[bombingAniMax]->s_debris[0] setScaleX:0.386 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_debris[0] setScaleY:0.635 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_debris[0] setOpacity:13.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_debris[1] setPosition:ccp(288.1 + wholeBombOffsetX, -137.6 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_debris[1] setRotation:-112.6];
                [bombingAniStruct[bombingAniMax]->s_debris[1] setScaleX:0.635 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_debris[1] setScaleY:0.969 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_debris[1] setOpacity:30.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_debris[2] setPosition:ccp(499.4 + wholeBombOffsetX, -160.8 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_debris[2] setRotation:-32.3];
                [bombingAniStruct[bombingAniMax]->s_debris[2] setScaleX:0.636 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_debris[2] setScaleY:0.636 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_debris[2] setOpacity:19.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[0] setPosition:ccp(380.8 + wholeBombOffsetX, -294.2 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[0] setRotation:141.4];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[0] setScaleX:1.471 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[0] setScaleY:1.471 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[0] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[1] setPosition:ccp(381.1 + wholeBombOffsetX, -237.1 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[1] setRotation:0.3];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[1] setScaleX:1.892 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[1] setScaleY:1.892 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[1] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[2] setPosition:ccp(343.4 + wholeBombOffsetX, -226.7 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[2] setRotation:0.3];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[2] setScaleX:1.22 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[2] setScaleY:1.22 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[2] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[3] setPosition:ccp(351.1 + wholeBombOffsetX, -296.5 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[3] setRotation:-172.2];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[3] setScaleX:1.908 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[3] setScaleY:1.908 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[3] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[4] setPosition:ccp(306.9 + wholeBombOffsetX, -239.3 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[4] setRotation:-38.6];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[4] setScaleX:1.792 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[4] setScaleY:1.792 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[4] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[5] setPosition:ccp(349.7 + wholeBombOffsetX, -256.3 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[5] setRotation:6.0];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[5] setScaleX:2.402 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[5] setScaleY:2.402 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[5] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[6] setPosition:ccp(341.4 + wholeBombOffsetX, -259.8 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[6] setRotation:-53.6];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[6] setScaleX:2.312 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[6] setScaleY:2.312 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[6] setOpacity:100.0/100.0 * 255.0];
                
                
                [bombingAniStruct[bombingAniMax]->s_smallClouds[0] setPosition:ccp(302.6 + wholeBombOffsetX, -257.9 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[0] setRotation:86.2];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[0] setScaleX:2.32 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[0] setScaleY:2.32 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[0] setOpacity:79.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_smallClouds[1] setPosition:ccp(330.9 + wholeBombOffsetX, -274.0 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[1] setRotation:-77.7];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[1] setScaleX:1.384 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[1] setScaleY:1.384 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[1] setOpacity:79.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_smallClouds[2] setPosition:ccp(351.6 + wholeBombOffsetX, -223.6 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[2] setRotation:110.5];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[2] setScaleX:1.658 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[2] setScaleY:1.658 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[2] setOpacity:79.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_smallClouds[3] setPosition:ccp(322.8 + wholeBombOffsetX, -232.2 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[3] setRotation:-131.1];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[3] setScaleX:1.868 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[3] setScaleY:1.868 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[3] setOpacity:79.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_smallClouds[4] setPosition:ccp(383.9 + wholeBombOffsetX, -251.7 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[4] setRotation:-28.8];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[4] setScaleX:1.872 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[4] setScaleY:1.872 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[4] setOpacity:79.0/100.0 * 255.0];
            }
            
            
            //Frame 14
            if(bombingAniStruct[bombingAniMax]->aniTimer == 12){
                [bombingAniStruct[bombingAniMax]->s_wave setPosition:ccp(10000 , 265)];
                
                [bombingAniStruct[bombingAniMax]->s_debris[0] setPosition:ccp(257.8 + wholeBombOffsetX, -319.5 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_debris[0] setRotation:132.6];
                [bombingAniStruct[bombingAniMax]->s_debris[0] setScaleX:0.383 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_debris[0] setScaleY:0.635 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_debris[0] setOpacity:5.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_debris[1] setPosition:ccp(281.9 + wholeBombOffsetX, -125.0 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_debris[1] setRotation:-111.0];
                [bombingAniStruct[bombingAniMax]->s_debris[1] setScaleX:0.635 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_debris[1] setScaleY:0.976 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_debris[1] setOpacity:23.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_debris[2] setPosition:ccp(512.2 + wholeBombOffsetX, -151.7 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_debris[2] setRotation:-32.3];
                [bombingAniStruct[bombingAniMax]->s_debris[2] setScaleX:0.636 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_debris[2] setScaleY:0.636 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_debris[2] setOpacity:11.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[0] setPosition:ccp(394.1 + wholeBombOffsetX, -298.7 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[0] setRotation:149.4];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[0] setScaleX:1.361 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[0] setScaleY:1.361 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[0] setOpacity:91.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[1] setPosition:ccp(385.1 + wholeBombOffsetX, -234.1 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[1] setRotation:-11.3];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[1] setScaleX:1.742 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[1] setScaleY:1.742 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[1] setOpacity:91.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[2] setPosition:ccp(343.1 + wholeBombOffsetX, -220.9 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[2] setRotation:-11.3];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[2] setScaleX:1.133 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[2] setScaleY:1.133 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[2] setOpacity:91.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[3] setPosition:ccp(351.3 + wholeBombOffsetX, -301.5 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[3] setRotation:-162.4];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[3] setScaleX:1.75 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[3] setScaleY:1.75 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[3] setOpacity:91.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[4] setPosition:ccp(300.9 + wholeBombOffsetX, -237.1 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[4] setRotation:-46.4];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[4] setScaleX:1.647 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[4] setScaleY:1.647 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[4] setOpacity:91.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[5] setPosition:ccp(349.7 + wholeBombOffsetX, -256.3 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[5] setRotation:8.8];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[5] setScaleX:2.444 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[5] setScaleY:2.444 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[5] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[6] setPosition:ccp(341.4 + wholeBombOffsetX, -259.8 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[6] setRotation:-60.9];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[6] setScaleX:2.375 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[6] setScaleY:2.375 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[6] setOpacity:100.0/100.0 * 255.0];
                
                
                [bombingAniStruct[bombingAniMax]->s_smallClouds[0] setPosition:ccp(293.1 + wholeBombOffsetX, -257.8 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[0] setRotation:96.3];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[0] setScaleX:2.196 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[0] setScaleY:2.196 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[0] setOpacity:73.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_smallClouds[1] setPosition:ccp(326.6 + wholeBombOffsetX, -276.6 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[1] setRotation:-81.9];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[1] setScaleX:1.327 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[1] setScaleY:1.327 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[1] setOpacity:73.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_smallClouds[2] setPosition:ccp(351.8 + wholeBombOffsetX, -217.9 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[2] setRotation:118.9];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[2] setScaleX:1.58 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[2] setScaleY:1.58 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[2] setOpacity:73.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_smallClouds[3] setPosition:ccp(318.3 + wholeBombOffsetX, -226.9 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[3] setRotation:-131.1];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[3] setScaleX:1.775 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[3] setScaleY:1.775 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[3] setOpacity:73.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_smallClouds[4] setPosition:ccp(390.6 + wholeBombOffsetX, -251.2 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[4] setRotation:-36.3];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[4] setScaleX:1.778 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[4] setScaleY:1.778 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[4] setOpacity:73.0/100.0 * 255.0];
                
            }
            
            
            //Frame 15
            if(bombingAniStruct[bombingAniMax]->aniTimer == 13){
                
                [bombingAniStruct[bombingAniMax]->s_debris[0] setPosition:ccp(10000, 319.5)];
                
                [bombingAniStruct[bombingAniMax]->s_debris[1] setPosition:ccp(276.1 + wholeBombOffsetX, -113.3 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_debris[1] setRotation:-109.8];
                [bombingAniStruct[bombingAniMax]->s_debris[1] setScaleX:0.635 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_debris[1] setScaleY:0.984 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_debris[1] setOpacity:16.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_debris[2] setPosition:ccp(523.0 + wholeBombOffsetX, -143.9 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_debris[2] setRotation:-32.3];
                [bombingAniStruct[bombingAniMax]->s_debris[2] setScaleX:0.636 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_debris[2] setScaleY:0.636 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_debris[2] setOpacity:5.0/100.0 * 255.0];
                
                
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[0] setPosition:ccp(387.9 + wholeBombOffsetX, -303.8 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[0] setRotation:158.2];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[0] setScaleX:1.244 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[0] setScaleY:1.244 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[0] setOpacity:82.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[1] setPosition:ccp(389.1 + wholeBombOffsetX, -230.7 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[1] setRotation:-23.8];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[1] setScaleX:1.583 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[1] setScaleY:1.583 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[1] setOpacity:80.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[2] setPosition:ccp(342.7 + wholeBombOffsetX, -214.7 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[2] setRotation:-23.8];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[2] setScaleX:1.041 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[2] setScaleY:1.041 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[2] setOpacity:80.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[3] setPosition:ccp(351.5 + wholeBombOffsetX, -306.9 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[3] setRotation:-151.7];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[3] setScaleX:1.595 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[3] setScaleY:1.595 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[3] setOpacity:80.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[4] setPosition:ccp(294.6 + wholeBombOffsetX, -234.8 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[4] setRotation:-54.9];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[4] setScaleX:1.496 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[4] setScaleY:1.496 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[4] setOpacity:80.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[5] setPosition:ccp(349.7 + wholeBombOffsetX, -256.3 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[5] setRotation:13.0];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[5] setScaleX:2.492 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[5] setScaleY:2.495 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[5] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[6] setPosition:ccp(341.4 + wholeBombOffsetX, -259.8 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[6] setRotation:-65.9];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[6] setScaleX:2.453 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[6] setScaleY:2.453 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[6] setOpacity:100.0/100.0 * 255.0];
                
                
                [bombingAniStruct[bombingAniMax]->s_smallClouds[0] setPosition:ccp(282.9 + wholeBombOffsetX, -257.7 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[0] setRotation:107.1];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[0] setScaleX:2.06 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[0] setScaleY:2.06 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[0] setOpacity:67.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_smallClouds[1] setPosition:ccp(322.1 + wholeBombOffsetX, -279.6 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[1] setRotation:-86.2];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[1] setScaleX:1.265 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[1] setScaleY:1.265 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[1] setOpacity:67.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_smallClouds[2] setPosition:ccp(352.1 + wholeBombOffsetX, -211.9 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[2] setRotation:127.9];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[2] setScaleX:1.497 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[2] setScaleY:1.497 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[2] setOpacity:67.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_smallClouds[3] setPosition:ccp(313.6 + wholeBombOffsetX, -221.5 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[3] setRotation:-131.4];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[3] setScaleX:1.676 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[3] setScaleY:1.676 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[3] setOpacity:67.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_smallClouds[4] setPosition:ccp(397.6 + wholeBombOffsetX, -250.6 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[4] setRotation:-44.4];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[4] setScaleX:1.678 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[4] setScaleY:1.678 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[4] setOpacity:67.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[7] setPosition:ccp(351.0 + wholeBombOffsetX, -261.0 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[7] setRotation:-34.6];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[7] setScaleX:0.859 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[7] setScaleY:0.859 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[7] setOpacity:27.0/100.0 * 255.0];
                
            }
            
            
            //Frame 16
            if(bombingAniStruct[bombingAniMax]->aniTimer == 14){
                
                
                [bombingAniStruct[bombingAniMax]->s_debris[1] setPosition:ccp(270.9 + wholeBombOffsetX, -102.8 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_debris[1] setRotation:-108.6];
                [bombingAniStruct[bombingAniMax]->s_debris[1] setScaleX:0.635 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_debris[1] setScaleY:0.99 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_debris[1] setOpacity:9.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_debris[2] setPosition:ccp(10000 , 143.9)];
                
                
                
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[0] setPosition:ccp(391.6 + wholeBombOffsetX, -309.1 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[0] setRotation:167.7];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[0] setScaleX:1.118 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[0] setScaleY:1.118 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[0] setOpacity:72.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[1] setPosition:ccp(393.1 + wholeBombOffsetX, -227.7 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[1] setRotation:-36.6];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[1] setScaleX:1.416 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[1] setScaleY:1.416 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[1] setOpacity:70.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[2] setPosition:ccp(342.2 + wholeBombOffsetX, -208.2 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[2] setRotation:-36.6];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[2] setScaleX:0.946 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[2] setScaleY:0.946 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[2] setOpacity:70.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[3] setPosition:ccp(351.6 + wholeBombOffsetX, -312.6 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[3] setRotation:-140.6];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[3] setScaleX:1.427 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[3] setScaleY:1.427 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[3] setOpacity:70.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[4] setPosition:ccp(287.8 + wholeBombOffsetX, -232.5 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[4] setRotation:-63.5];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[4] setScaleX:1.338 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[4] setScaleY:1.338 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[4] setOpacity:70.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[5] setPosition:ccp(349.8 + wholeBombOffsetX, -256.2 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[5] setRotation:15.3];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[5] setScaleX:2.542 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[5] setScaleY:2.542 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[5] setOpacity:90.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[6] setPosition:ccp(341.4 + wholeBombOffsetX, -259.8 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[6] setRotation:-71.7];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[6] setScaleX:2.535 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[6] setScaleY:2.535 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[6] setOpacity:86.0/100.0 * 255.0];
                
                
                [bombingAniStruct[bombingAniMax]->s_smallClouds[0] setPosition:ccp(272.1 + wholeBombOffsetX, -257.6 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[0] setRotation:118.6];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[0] setScaleX:1.918 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[0] setScaleY:1.918 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[0] setOpacity:60.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_smallClouds[1] setPosition:ccp(317.4 + wholeBombOffsetX, -282.6 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[1] setRotation:-90.5];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[1] setScaleX:1.20 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[1] setScaleY:1.20 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[1] setOpacity:60.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_smallClouds[2] setPosition:ccp(352.3 + wholeBombOffsetX, -205.7 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[2] setRotation:137.4];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[2] setScaleX:1.409 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[2] setScaleY:1.409 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[2] setOpacity:60.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_smallClouds[3] setPosition:ccp(308.4 + wholeBombOffsetX, -215.7 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[3] setRotation:-131.6];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[3] setScaleX:1.571 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[3] setScaleY:1.571 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[3] setOpacity:60.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_smallClouds[4] setPosition:ccp(405.1 + wholeBombOffsetX, -250.1 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[4] setRotation:-52.9];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[4] setScaleX:1.574 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[4] setScaleY:1.574 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[4] setOpacity:60.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[7] setPosition:ccp(351.0 + wholeBombOffsetX, -261.0 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[7] setRotation:-20.8];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[7] setScaleX:1.131 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[7] setScaleY:1.131 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[7] setOpacity:56.0/100.0 * 255.0];
                
            }
            
            
            //Frame 17
            if(bombingAniStruct[bombingAniMax]->aniTimer == 15){
                [bombingAniStruct[bombingAniMax]->s_debris[1] setPosition:ccp(266.4 + wholeBombOffsetX, -93.9 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_debris[1] setRotation:-107.6];
                [bombingAniStruct[bombingAniMax]->s_debris[1] setScaleX:0.635 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_debris[1] setScaleY:0.996 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_debris[1] setOpacity:4.0/100.0 * 255.0];
                
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[0] setPosition:ccp(395.9 + wholeBombOffsetX, -314.9 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[0] setRotation:177.7];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[0] setScaleX:0.983 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[0] setScaleY:0.983 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[0] setOpacity:62.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[1] setPosition:ccp(397.4 + wholeBombOffsetX, -223.5 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[1] setRotation:-50.2];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[1] setScaleX:1.244 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[1] setScaleY:1.244 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[1] setOpacity:59.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[2] setPosition:ccp(341.9 + wholeBombOffsetX, -201.6 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[2] setRotation:-50.2];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[2] setScaleX:0.846 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[2] setScaleY:0.846 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[2] setOpacity:59.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[3] setPosition:ccp(351.7 + wholeBombOffsetX, -318.4 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[3] setRotation:-129.1];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[3] setScaleX:1.253 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[3] setScaleY:1.253 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[3] setOpacity:59.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[4] setPosition:ccp(280.9 + wholeBombOffsetX, -230.0 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[4] setRotation:-72.7];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[4] setScaleX:1.174 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[4] setScaleY:1.174 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[4] setOpacity:59.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[5] setPosition:ccp(349.8 + wholeBombOffsetX, -256.2 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[5] setRotation:19.0];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[5] setScaleX:2.596 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[5] setScaleY:2.596 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[5] setOpacity:79.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[6] setPosition:ccp(341.6 + wholeBombOffsetX, -259.8 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[6] setRotation:-77.7];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[6] setScaleX:2.627 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[6] setScaleY:2.627 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[6] setOpacity:72.0/100.0 * 255.0];
                
                
                [bombingAniStruct[bombingAniMax]->s_smallClouds[0] setPosition:ccp(260.9 + wholeBombOffsetX, -257.4 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[0] setRotation:130.6];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[0] setScaleX:1.771 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[0] setScaleY:1.771 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[0] setOpacity:54.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_smallClouds[1] setPosition:ccp(312.4 + wholeBombOffsetX, -285.7 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[1] setRotation:-95.3];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[1] setScaleX:1.132 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[1] setScaleY:1.132 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[1] setOpacity:54.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_smallClouds[2] setPosition:ccp(352.6 + wholeBombOffsetX, -199.1 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[2] setRotation:147.2];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[2] setScaleX:1.318 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[2] setScaleY:1.318 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[2] setOpacity:54.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_smallClouds[3] setPosition:ccp(303.2 + wholeBombOffsetX, -209.7 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[3] setRotation:-131.8];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[3] setScaleX:1.462 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[3] setScaleY:1.462 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[3] setOpacity:54.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_smallClouds[4] setPosition:ccp(412.8 + wholeBombOffsetX, -249.3 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[4] setRotation:-61.9];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[4] setScaleX:1.465 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[4] setScaleY:1.465 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[4] setOpacity:54.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[7] setPosition:ccp(351.0 + wholeBombOffsetX, -261.0 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[7] setRotation:-8.8];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[7] setScaleX:1.37 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[7] setScaleY:1.37 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[7] setOpacity:82.0/100.0 * 255.0];
                
            }
            
            
            //Frame 18
            if(bombingAniStruct[bombingAniMax]->aniTimer == 16){
                [bombingAniStruct[bombingAniMax]->s_debris[1] setPosition:ccp(10000, 93.9)];
                
                
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[0] setPosition:ccp(400.4 + wholeBombOffsetX, -321.0 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[0] setRotation:171.7];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[0] setScaleX:0.84 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[0] setScaleY:0.84 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[0] setOpacity:51.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[1] setPosition:ccp(401.8 + wholeBombOffsetX, -219.8 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[1] setRotation:-64.2];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[1] setScaleX:1.066 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[1] setScaleY:1.066 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[1] setOpacity:48.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[2] setPosition:ccp(341.3 + wholeBombOffsetX, -194.6 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[2] setRotation:-64.2];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[2] setScaleX:0.744 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[2] setScaleY:0.744 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[2] setOpacity:48.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[3] setPosition:ccp(351.8 + wholeBombOffsetX, -324.4 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[3] setRotation:-117.1];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[3] setScaleX:1.074 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[3] setScaleY:1.074 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[3] setOpacity:48.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[4] setPosition:ccp(273.8 + wholeBombOffsetX, -227.4 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[4] setRotation:-82.0];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[4] setScaleX:1.005 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[4] setScaleY:1.005 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[4] setOpacity:48.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[5] setPosition:ccp(349.8 + wholeBombOffsetX, -256.2 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[5] setRotation:22.8];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[5] setScaleX:2.654 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[5] setScaleY:2.654 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[5] setOpacity:68.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[6] setPosition:ccp(341.6 + wholeBombOffsetX, -259.8 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[6] setRotation:-84.0];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[6] setScaleX:2.722 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[6] setScaleY:2.722 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[6] setOpacity:57.0/100.0 * 255.0];
                
                
                [bombingAniStruct[bombingAniMax]->s_smallClouds[0] setPosition:ccp(249.3 + wholeBombOffsetX, -257.2 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[0] setRotation:142.7];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[0] setScaleX:1.619 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[0] setScaleY:1.619 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[0] setOpacity:47.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_smallClouds[1] setPosition:ccp(307.3 + wholeBombOffsetX, -288.9 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[1] setRotation:-100.0];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[1] setScaleX:1.062 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[1] setScaleY:1.062 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[1] setOpacity:47.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_smallClouds[2] setPosition:ccp(352.8 + wholeBombOffsetX, -192.2 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[2] setRotation:157.4];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[2] setScaleX:1.225 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[2] setScaleY:1.225 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[2] setOpacity:47.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_smallClouds[3] setPosition:ccp(297.9 + wholeBombOffsetX, -203.5 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[3] setRotation:-132.1];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[3] setScaleX:1.35 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[3] setScaleY:1.35 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[3] setOpacity:47.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_smallClouds[4] setPosition:ccp(420.7 + wholeBombOffsetX, -248.7 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[4] setRotation:-71];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[4] setScaleX:1.353 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[4] setScaleY:1.353 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[4] setOpacity:47.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[7] setPosition:ccp(351.0 + wholeBombOffsetX, -261.0 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[7] setRotation:0];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[7] setScaleX:1.544 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[7] setScaleY:1.544 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[7] setOpacity:100.0/100.0 * 255.0];
                
            }
            
            
            
            //Frame 19
            if(bombingAniStruct[bombingAniMax]->aniTimer == 17){
                [bombingAniStruct[bombingAniMax]->s_bigClouds[0] setPosition:ccp(404.9 + wholeBombOffsetX, -327.4 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[0] setRotation:160.5];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[0] setScaleX:0.688 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[0] setScaleY:0.688 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[0] setOpacity:39.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[1] setPosition:ccp(406.4 + wholeBombOffsetX, -215.9 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[1] setRotation:-78.5];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[1] setScaleX:0.884 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[1] setScaleY:0.884 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[1] setOpacity:36.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[2] setPosition:ccp(340.9 + wholeBombOffsetX, -187.4 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[2] setRotation:-78.5];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[2] setScaleX:0.639 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[2] setScaleY:0.639 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[2] setOpacity:36.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[3] setPosition:ccp(351.9 + wholeBombOffsetX, -330.5 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[3] setRotation:-104.8];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[3] setScaleX:0.889 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[3] setScaleY:0.889 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[3] setOpacity:36.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[4] setPosition:ccp(266.4 + wholeBombOffsetX, -224.8 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[4] setRotation:-91.5];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[4] setScaleX:0.83 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[4] setScaleY:0.83 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[4] setOpacity:36.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[5] setPosition:ccp(349.8 + wholeBombOffsetX, -256.2 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[5] setRotation:26.6];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[5] setScaleX:2.713 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[5] setScaleY:2.713 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[5] setOpacity:56.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[6] setPosition:ccp(341.6 + wholeBombOffsetX, -259.8 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[6] setRotation:-90.3];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[6] setScaleX:2.818 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[6] setScaleY:2.818 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[6] setOpacity:41.0/100.0 * 255.0];
                
                
                [bombingAniStruct[bombingAniMax]->s_smallClouds[0] setPosition:ccp(237.7 + wholeBombOffsetX, -257.1 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[0] setRotation:155.2];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[0] setScaleX:1.466 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[0] setScaleY:1.466 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[0] setOpacity:40.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_smallClouds[1] setPosition:ccp(302.1 + wholeBombOffsetX, -292.2 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[1] setRotation:-105.0];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[1] setScaleX:0.99 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[1] setScaleY:0.99 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[1] setOpacity:40.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_smallClouds[2] setPosition:ccp(353.1 + wholeBombOffsetX, -185.3 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[2] setRotation:167.7];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[2] setScaleX:1.13 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[2] setScaleY:1.13 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[2] setOpacity:40.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_smallClouds[3] setPosition:ccp(292.4 + wholeBombOffsetX, -197.1 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[3] setRotation:-132.1];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[3] setScaleX:1.236 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[3] setScaleY:1.236 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[3] setOpacity:40.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_smallClouds[4] setPosition:ccp(428.8 + wholeBombOffsetX, -248.1 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[4] setRotation:-80.2];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[4] setScaleX:1.239 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[4] setScaleY:1.239 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[4] setOpacity:40.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[7] setPosition:ccp(351.0 + wholeBombOffsetX, -261.0 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[7] setRotation:8];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[7] setScaleX:1.592 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[7] setScaleY:1.592 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[7] setOpacity:91.0/100.0 * 255.0];
                
            }
            
            
            //Frame 20
            if(bombingAniStruct[bombingAniMax]->aniTimer == 18){
                [bombingAniStruct[bombingAniMax]->s_bigClouds[0] setPosition:ccp(409.9 + wholeBombOffsetX, -334.2 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[0] setRotation:-148.7];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[0] setScaleX:0.529 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[0] setScaleY:0.529 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[0] setOpacity:27.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[1] setPosition:ccp(411.1 + wholeBombOffsetX, -212.0 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[1] setRotation:-93.0];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[1] setScaleX:0.696 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[1] setScaleY:0.696 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[1] setOpacity:25.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[2] setPosition:ccp(340.3 + wholeBombOffsetX, -180.1 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[2] setRotation:-93.0];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[2] setScaleX:0.531 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[2] setScaleY:0.531 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[2] setOpacity:25.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[3] setPosition:ccp(352.1 + wholeBombOffsetX, -336.9 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[3] setRotation:-92.3];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[3] setScaleX:0.699 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[3] setScaleY:0.699 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[3] setOpacity:25.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[4] setPosition:ccp(258.8 + wholeBombOffsetX, -222.1 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[4] setRotation:-101.3];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[4] setScaleX:0.65 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[4] setScaleY:0.65 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[4] setOpacity:25.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[5] setPosition:ccp(349.8 + wholeBombOffsetX, -256.2 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[5] setRotation:30.6];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[5] setScaleX:2.773 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[5] setScaleY:2.773 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[5] setOpacity:44.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[6] setPosition:ccp(341.6 + wholeBombOffsetX, -259.8 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[6] setRotation:-96.3];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[6] setScaleX:2.909 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[6] setScaleY:2.909 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[6] setOpacity:27.0/100.0 * 255.0];
                
                
                [bombingAniStruct[bombingAniMax]->s_smallClouds[0] setPosition:ccp(225.8 + wholeBombOffsetX, -256.9 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[0] setRotation:167.7];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[0] setScaleX:1.312 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[0] setScaleY:1.312 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[0] setOpacity:33.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_smallClouds[1] setPosition:ccp(296.9 + wholeBombOffsetX, -295.4 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[1] setRotation:-110.0];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[1] setScaleX:0.919 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[1] setScaleY:0.919 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[1] setOpacity:33.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_smallClouds[2] setPosition:ccp(353.4 + wholeBombOffsetX, -178.4 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[2] setRotation:178.0];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[2] setScaleX:1.035 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[2] setScaleY:1.035 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[2] setOpacity:33.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_smallClouds[3] setPosition:ccp(286.9 + wholeBombOffsetX, -190.7 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[3] setRotation:-132.4];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[3] setScaleX:1.122 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[3] setScaleY:1.122 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[3] setOpacity:33.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_smallClouds[4] setPosition:ccp(436.9 + wholeBombOffsetX, -247.3 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[4] setRotation:-89.7];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[4] setScaleX:1.125 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[4] setScaleY:1.125 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[4] setOpacity:33.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[7] setPosition:ccp(351.0 + wholeBombOffsetX, -261.0 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[7] setRotation:18.8];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[7] setScaleX:1.657 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[7] setScaleY:1.657 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[7] setOpacity:79.0/100.0 * 255.0];
                
            }
            
            
            //Frame 21
            if(bombingAniStruct[bombingAniMax]->aniTimer == 19){
                [bombingAniStruct[bombingAniMax]->s_bigClouds[0] setPosition:ccp(415.0 + wholeBombOffsetX, -341.1 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[0] setRotation:-136.4];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[0] setScaleX:0.364 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[0] setScaleY:0.364 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[0] setOpacity:14.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[1] setPosition:ccp(415.8 + wholeBombOffsetX, -207.8 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[1] setRotation:-108.1];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[1] setScaleX:0.503 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[1] setScaleY:0.503 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[1] setOpacity:13.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[2] setPosition:ccp(339.8 + wholeBombOffsetX, -172.7 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[2] setRotation:-108.1];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[2] setScaleX:0.42 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[2] setScaleY:0.42 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[2] setOpacity:13.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[3] setPosition:ccp(352.1 + wholeBombOffsetX, -343.4 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[3] setRotation:-79.7];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[3] setScaleX:0.505 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[3] setScaleY:0.505 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[3] setOpacity:13.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[4] setPosition:ccp(251.0 + wholeBombOffsetX, -219.3 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[4] setRotation:-111.5];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[4] setScaleX:0.466 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[4] setScaleY:0.466 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[4] setOpacity:13.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[5] setPosition:ccp(349.8 + wholeBombOffsetX, -256.2 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[5] setRotation:34.6];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[5] setScaleX:2.532 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[5] setScaleY:2.532 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[5] setOpacity:32.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[6] setPosition:ccp(341.6 + wholeBombOffsetX, -259.8 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[6] setRotation:-102.0];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[6] setScaleX:2.995 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[6] setScaleY:2.995 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[6] setOpacity:13.0/100.0 * 255.0];
                
                
                [bombingAniStruct[bombingAniMax]->s_smallClouds[0] setPosition:ccp(214.0 + wholeBombOffsetX, -256.9 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[0] setRotation:180];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[0] setScaleX:1.158 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[0] setScaleY:1.158 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[0] setOpacity:26.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_smallClouds[1] setPosition:ccp(291.6 + wholeBombOffsetX, -298.8 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[1] setRotation:-115.0];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[1] setScaleX:0.847 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[1] setScaleY:0.847 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[1] setOpacity:26.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_smallClouds[2] setPosition:ccp(353.6 + wholeBombOffsetX, -171.6 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[2] setRotation:171.9];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[2] setScaleX:0.939 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[2] setScaleY:0.939 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[2] setOpacity:26.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_smallClouds[3] setPosition:ccp(281.4 + wholeBombOffsetX, -184.3 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[3] setRotation:-132.4];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[3] setScaleX:1.007 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[3] setScaleY:1.007 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[3] setOpacity:26.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_smallClouds[4] setPosition:ccp(445.0 + wholeBombOffsetX, -246.7 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[4] setRotation:-98.8];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[4] setScaleX:1.01 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[4] setScaleY:1.01 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[4] setOpacity:26.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[7] setPosition:ccp(351.0 + wholeBombOffsetX, -261.0 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[7] setRotation:318];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[7] setScaleX:1.734 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[7] setScaleY:1.734 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[7] setOpacity:65.0/100.0 * 255.0];
                
            }
            
            
            
            //Frame 22
            if(bombingAniStruct[bombingAniMax]->aniTimer == 20){
                [bombingAniStruct[bombingAniMax]->s_bigClouds[0] setPosition:ccp(41500.0, -341.1)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[1] setPosition:ccp(41500.0, -341.1)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[2] setPosition:ccp(41500.0, -341.1)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[3] setPosition:ccp(41500.0, -341.1)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[4] setPosition:ccp(41500.0, -341.1)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[6] setPosition:ccp(41500.0, -341.1)];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[5] setPosition:ccp(349.8 + wholeBombOffsetX, -256.2 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[5] setRotation:38.4];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[5] setScaleX:2.889 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[5] setScaleY:2.889 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[5] setOpacity:21.0/100.0 * 255.0];
                
                
                
                [bombingAniStruct[bombingAniMax]->s_smallClouds[0] setPosition:ccp(202.5 + wholeBombOffsetX, -256.5 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[0] setRotation:167.7];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[0] setScaleX:1.006 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[0] setScaleY:1.006 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[0] setOpacity:19.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_smallClouds[1] setPosition:ccp(286.6 + wholeBombOffsetX, -302.0 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[1] setRotation:-119.8];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[1] setScaleX:0.777 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[1] setScaleY:0.777 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[1] setOpacity:19.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_smallClouds[2] setPosition:ccp(353.6 + wholeBombOffsetX, -164.7 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[2] setRotation:161.7];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[2] setScaleX:0.844 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[2] setScaleY:0.844 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[2] setOpacity:19.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_smallClouds[3] setPosition:ccp(276.1 + wholeBombOffsetX, -178.2 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[3] setRotation:-132.9];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[3] setScaleX:0.895 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[3] setScaleY:0.895 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[3] setOpacity:19.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_smallClouds[4] setPosition:ccp(453.0 + wholeBombOffsetX, -246.1 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[4] setRotation:-107.8];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[4] setScaleX:0.897 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[4] setScaleY:0.897 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[4] setOpacity:19.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[7] setPosition:ccp(351.0 + wholeBombOffsetX, -261.0 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[7] setRotation:46.4];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[7] setScaleX:1.822 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[7] setScaleY:1.822 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[7] setOpacity:49.0/100.0 * 255.0];
                
            }
            
            
            //Frame 23
            if(bombingAniStruct[bombingAniMax]->aniTimer == 21){
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[5] setPosition:ccp(349.8 + wholeBombOffsetX, -256.2 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[5] setRotation:41.9];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[5] setScaleX:2.944 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[5] setScaleY:2.944 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[5] setOpacity:10.0/100.0 * 255.0];
                
                
                
                [bombingAniStruct[bombingAniMax]->s_smallClouds[0] setPosition:ccp(191.2 + wholeBombOffsetX, -256.4 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[0] setRotation:155.7];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[0] setScaleX:0.858 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[0] setScaleY:0.858 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[0] setOpacity:13.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_smallClouds[1] setPosition:ccp(281.6 + wholeBombOffsetX, -305.1 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[1] setRotation:-124.6];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[1] setScaleX:0.709 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[1] setScaleY:0.709 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[1] setOpacity:13.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_smallClouds[2] setPosition:ccp(354.1 + wholeBombOffsetX, -158.1 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[2] setRotation:151.9];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[2] setScaleX:0.753 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[2] setScaleY:0.753 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[2] setOpacity:13.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_smallClouds[3] setPosition:ccp(270.8 + wholeBombOffsetX, -172.2 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[3] setRotation:-133.1];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[3] setScaleX:0.786 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[3] setScaleY:0.786 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[3] setOpacity:13.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_smallClouds[4] setPosition:ccp(460.8 + wholeBombOffsetX, -245.4 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[4] setRotation:-116.8];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[4] setScaleX:0.787 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[4] setScaleY:0.787 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[4] setOpacity:13.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[7] setPosition:ccp(351.0 + wholeBombOffsetX, -261.0 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[7] setRotation:61.9];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[7] setScaleX:1.916 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[7] setScaleY:1.916 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[7] setOpacity:32.0/100.0 * 255.0];
                
            }
            
            //Frame 24
            if(bombingAniStruct[bombingAniMax]->aniTimer == 22){
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[5] setPosition:ccp(34900.8 , -256.2)];
                
                
                [bombingAniStruct[bombingAniMax]->s_smallClouds[0] setPosition:ccp(180.5 + wholeBombOffsetX, -256.2 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[0] setRotation:144.4];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[0] setScaleX:0.716 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[0] setScaleY:0.716 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[0] setOpacity:6.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_smallClouds[1] setPosition:ccp(276.8 + wholeBombOffsetX, -308.1 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[1] setRotation:-129.1];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[1] setScaleX:0.644 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[1] setScaleY:0.644 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[1] setOpacity:6.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_smallClouds[2] setPosition:ccp(354.1 + wholeBombOffsetX, -151.8 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[2] setRotation:142.4];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[2] setScaleX:0.665 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[2] setScaleY:0.665 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[2] setOpacity:6.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_smallClouds[3] setPosition:ccp(265.8 + wholeBombOffsetX, -166.2 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[3] setRotation:-133.2];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[3] setScaleX:0.681 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[3] setScaleY:0.681 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[3] setOpacity:6.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_smallClouds[4] setPosition:ccp(468.2 + wholeBombOffsetX, -244.8 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[4] setRotation:-125.3];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[4] setScaleX:0.682 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[4] setScaleY:0.682 * 0.527 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[4] setOpacity:6.0/100.0 * 255.0];
                
                [bombingAniStruct[bombingAniMax]->s_bigClouds[7] setPosition:ccp(351.0 + wholeBombOffsetX, -261.0 + wholeBombOffsetY)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[7] setRotation:77.0];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[7] setScaleX:2.008 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[7] setScaleY:2.008 * 0.492 * fuckBombGameoverScale];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[7] setOpacity:15.0/100.0 * 255.0];
                
            }
            
            
            if(bombingAniStruct[bombingAniMax]->aniTimer == 23){
                [bombingAniStruct[bombingAniMax]->s_smallClouds[0] setPosition:ccp(34900.8 , -256.2)];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[1] setPosition:ccp(34900.8 , -256.2)];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[2] setPosition:ccp(34900.8 , -256.2)];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[3] setPosition:ccp(34900.8 , -256.2)];
                [bombingAniStruct[bombingAniMax]->s_smallClouds[4] setPosition:ccp(34900.8 , -256.2)];
                [bombingAniStruct[bombingAniMax]->s_bigClouds[7] setPosition:ccp(34900.8 , -256.2)];
                
                bombingAniStruct[bombingAniMax]->isAniGameover = false;
            }
            
            //printf("M2:%i %i\n",i, bombingAniStruct[i]->aniTimer);
            
        }//end if bombingAniStrut i isAni
        
        

    
    
    
}

@end
