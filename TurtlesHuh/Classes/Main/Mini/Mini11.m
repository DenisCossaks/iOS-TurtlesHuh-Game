//
//  Mini11.m
//  TurtlesHuh
//
//  Created by  on 2012/5/30.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "Mini11.h"
#import "GamePlayGlobal.h"
#import "Global.h"

@implementation Mini11

-(void) restart{
    [super restart];
    
    gameLevel = 0;
    comboReduceSpeedAccum = 0;
    comoboReduceSpeed = comboReduceSpeedAccum + 0.003;
    
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
    timeToBeGained = 6;
    
    //printf("restartTTT\n");
    
    for(int i = 0 ; i < maxShell ; i++){
        if(nowIsShellOnScreen[i]){
            //printf("LLLL:%i\n",i);
            nowIsShellOnScreen[i] = false;
            [self setThisShellFuckBackPenguin:i];
        }
        if(nowIsShellOnScreen2[i]){
           //  printf("LLLLSS:%i\n",i);
            nowIsShellOnScreen2[i] = false;
            [self setThisShellFuckBackPenguin:i];
        }
    }
    
    isUsingFirstNowIsShellOnScreen = !isUsingFirstNowIsShellOnScreen;
    hasShotCannonBeforeNextChain = true;
    isShootingCannon = true;
    shootCannonTimer = 0;
   // cannBall_isHittingFirstChain = !cannBall_isHittingFirstChain;
  //  [self genNextShellChain];

}

-(void) updateGameLevel{
    
    if(gameRound < 15){
        gameLevel = 0;
        comoboReduceSpeed = comboReduceSpeedAccum + 0.003;
    }else if(gameRound < 30){
        gameLevel = 1;
        comoboReduceSpeed = comboReduceSpeedAccum + 0.004;
    }else if(gameRound < 60){
        gameLevel = 2;
        comoboReduceSpeed = comboReduceSpeedAccum + 0.005;
    }else if(gameRound < 90){
        gameLevel = 3;
        comoboReduceSpeed = comboReduceSpeedAccum + 0.0065;
    }else if(gameRound < 120){
        gameLevel = 4;
        comoboReduceSpeed =comboReduceSpeedAccum +  0.008;
    }else if(gameRound < 160){
        gameLevel = 5;
        comoboReduceSpeed = comboReduceSpeedAccum + 0.01;
    }else if(gameRound < 200){
        gameLevel = 6;
        comoboReduceSpeed = comboReduceSpeedAccum + 0.012;
    }else if(gameRound < 230){
        gameLevel = 7;
        comoboReduceSpeed = comboReduceSpeedAccum + 0.014;
    }else if(gameRound < 260){
        gameLevel = 8;
        comoboReduceSpeed = comboReduceSpeedAccum + 0.015;
    }else if(gameRound < 300){
        gameLevel = 9;
        comoboReduceSpeed = comboReduceSpeedAccum + 0.016;
    }else if(gameRound < 350){
        gameLevel = 10;
        comoboReduceSpeed = comboReduceSpeedAccum + 0.017;
    }else if(gameRound < 400){
        gameLevel = 11;
        comoboReduceSpeed = comboReduceSpeedAccum + 0.018;
    }else if(gameRound < 450){
        gameLevel = 12;
        comoboReduceSpeed = comboReduceSpeedAccum + 0.02;
    }else if(gameRound < 500){
        gameLevel = 13;
        comoboReduceSpeed = comboReduceSpeedAccum + 0.023;
    }

    
    if(comboReduceSpeedAccum < 0){
        comboReduceSpeedAccum += comboReduceSpeedAccumSpeed/20;  //0.004/20
    }else{
        comboReduceSpeedAccum = 0;
    }
    
    if(comoboReduceSpeed < 0.003){
        comoboReduceSpeed = 0.003;
    }
    
    
    //printf("updateGameLevel:%i %i %i %4.8f %4.8f\n",gameLevel,gameRound, gameRoundFromBegin, comboReduceSpeedAccum, comoboReduceSpeed);
    
    cannonMinAngle = 30;
    cannonMaxAngle = 75;
    
    chainAverageInterval = 8;
    chainMaxShellAppear = 8;
    
    chainMinInterval = 5;
    chainMaxInterval = 10;
    
    if(gameLevel <= 1){
        chainTypeAppearRatio[0] = 100;
        chainTypeAppearRatio[1] = 100;
        chainTypeAppearRatio[2] = 100;
        chainTypeAppearRatio[3] = 100;
        chainTypeAppearRatio[4] = 100;
        
        chainAverageInterval = 6;
        cannonMinAngle = 40;
        cannonMaxAngle = 65;
    }

    if(gameLevel == 2){
        chainTypeAppearRatio[0] = 100;
        chainTypeAppearRatio[1] = 100;
        chainTypeAppearRatio[2] = 100;
        chainTypeAppearRatio[3] = 100;
        chainTypeAppearRatio[4] = 100;
        
        chainAverageInterval = 6;
        cannonMinAngle = 40;
        cannonMaxAngle = 65;
    }
    if(gameLevel == 3){
        chainTypeAppearRatio[0] = 100;
        chainTypeAppearRatio[1] = 100;
        chainTypeAppearRatio[2] = 100;
        chainTypeAppearRatio[3] = 100;
        chainTypeAppearRatio[4] = 100;
        
        chainAverageInterval = 7;
        cannonMinAngle = 40;
        cannonMaxAngle = 65;
    }
    if(gameLevel == 4){
        chainTypeAppearRatio[0] = 80;
        chainTypeAppearRatio[1] = 100;
        chainTypeAppearRatio[2] = 100;
        chainTypeAppearRatio[3] = 100;
        chainTypeAppearRatio[4] = 100;
        
        cannonMinAngle = 35;
        cannonMaxAngle = 68;
    }
    if(gameLevel == 5){
        chainTypeAppearRatio[0] = 75;
        chainTypeAppearRatio[1] = 95;
        chainTypeAppearRatio[2] = 100;
        chainTypeAppearRatio[3] = 100;
        chainTypeAppearRatio[4] = 100;
        
        cannonMinAngle = 30;
        cannonMaxAngle = 70;
    }
    if(gameLevel == 6){
        chainTypeAppearRatio[0] = 70;
        chainTypeAppearRatio[1] = 90;
        chainTypeAppearRatio[2] = 100;
        chainTypeAppearRatio[3] = 100;
        chainTypeAppearRatio[4] = 100;
    }
    if(gameLevel == 7){
        chainTypeAppearRatio[0] = 60;
        chainTypeAppearRatio[1] = 80;
        chainTypeAppearRatio[2] = 100;
        chainTypeAppearRatio[3] = 100;
        chainTypeAppearRatio[4] = 100;
    }
    if(gameLevel == 8){
        chainTypeAppearRatio[0] = 50;
        chainTypeAppearRatio[1] = 73;
        chainTypeAppearRatio[2] = 100;
        chainTypeAppearRatio[3] = 100;
        chainTypeAppearRatio[4] = 100;
    }
    
    if(gameLevel >= 9){
        chainTypeAppearRatio[0] = 33;
        chainTypeAppearRatio[1] = 66;
        chainTypeAppearRatio[2] = 100;
        chainTypeAppearRatio[3] = 100;
        chainTypeAppearRatio[4] = 100;
        
        chainAverageInterval = 9;
        cannonMinAngle = 30;
        cannonMaxAngle = 80;
    }
    
    cannonAngleRange = cannonMaxAngle - cannonMinAngle;
    
    [self reInitColorComboLimit];
   
}

-(void) reInitColorComboLimit{
    
   // printf("reInitColorComboLimit:%i\n",gameLevel);
    
    if(gameLevel == 3){
        comboColorLimit[0] = 0;
        comboColorLimit[1] = 20;
        comboColorLimit[2] = 40;
        comboColorLimit[3] = 60;
        comboColorLimit[4] = 80;
        comboColorLimit[5] = 100;
        comboColorLimit[6] = 120;
        comboColorLimit[7] = 140;
        comboColorLimit[8] = 160;
        comboColorLimit[9] = 180;
        comboColorLimit[10] = 200;
        timeToBeGained = 6;
    }
    if(gameLevel == 6){
        comboColorLimit[0] = 0;
        comboColorLimit[1] = 20;
        comboColorLimit[2] = 40;
        comboColorLimit[3] = 60;
        comboColorLimit[4] = 80;
        comboColorLimit[5] = 100;
        comboColorLimit[6] = 120;
        comboColorLimit[7] = 140;
        comboColorLimit[8] = 160;
        comboColorLimit[9] = 180;
        comboColorLimit[10] = 200;
        timeToBeGained = 6;
    }
    if(gameLevel == 8){
        comboColorLimit[0] = 0;
        comboColorLimit[1] = 20;
        comboColorLimit[2] = 40;
        comboColorLimit[3] = 60;
        comboColorLimit[4] = 80;
        comboColorLimit[5] = 100;
        comboColorLimit[6] = 120;
        comboColorLimit[7] = 140;
        comboColorLimit[8] = 160;
        comboColorLimit[9] = 180;
        comboColorLimit[10] = 200;
         timeToBeGained = 6;
    }

}


-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
        
        timeToBeGained = 6;
        maxTime = 60;
        timeRemain = maxTime;
        
        s_bg = [CCSprite spriteWithFile:@"mini_05_bg.png"];
        [s_bg setPosition:ccp([UIScreen mainScreen].bounds.size.height/2, [UIScreen mainScreen].bounds.size.width/2)];
		[self addChild:s_bg];
        
        wholeCannonScaleFromSocurce = 0.44;
//        wholePenguinScaleFromSocurce = 0.48;
        wholePenguinScaleFromSocurce = 0.75;
        
        cannonAngle = -135;
        cannonFinalAngle = -45;
        cannonRotationSpeed = 2.5;
        
        cannonForce = 20*2/textureRatioForFuckingIpad;
        cannonAdditionalForceY = 1.0;
        cannonFriction = 0.98;
        cannonGravity = -1.2;
        
       /* cannonForce = 21;
        cannonAdditionalForceY = 1.0;
        cannonFriction = 0.97;
        cannonGravity = -1.5;*/
        
        maxShellGen = 8;
        shootCannonTimer = 0;
        isShootingCannon = false;
        hasShotCannonBeforeNextChain = false;
        hasShotOnceAndTakeRestForNextFuck = false;
        isFuckedAndLoseCombo = false;
    
        isTappingLeft = false;
        isTappingRight = false;
        
        detectCannonBallRadius = 30/textureRatioForFuckingIpad;
        detectShellRadius = 54/textureRatioForFuckingIpad;
        
        PCAX = 0.5;
        PCVX = 0;
        PCX = 150;
        PCY = 15;
        
        if(isIpad){
            PCY = 25;
        }
       
        [self initControlLayer];
        [self initCharacters];
        [self initCannon];
        [self initCannonBalls];
        [self updatePCPosition];
        [self initCarriage];
        
        isClockwise = false;
        cannBall_isHittingFirstChain = true;
        [self genNextShellChain];
    }
    
	return self;
}

-(void) initCarriage{
    s_carriage = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1550/textureRatioForFuckingIpad, 672/textureRatioForFuckingIpad, 244/textureRatioForFuckingIpad, 14/textureRatioForFuckingIpad)];
    [ss_Character addChild:s_carriage z:kDeapth_Bg_Element1];
    
    s_carriageWheel[0] = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1806/textureRatioForFuckingIpad, 672/textureRatioForFuckingIpad, 54/textureRatioForFuckingIpad, 52/textureRatioForFuckingIpad)];
    s_carriageWheel[1] = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1806/textureRatioForFuckingIpad, 672/textureRatioForFuckingIpad, 54/textureRatioForFuckingIpad, 52/textureRatioForFuckingIpad)];
    [ss_Character addChild:s_carriageWheel[0] z:kDeapth_Bg_Element1];
    [ss_Character addChild:s_carriageWheel[1] z:kDeapth_Bg_Element1];
}

-(void) initControlLayer{
    controlLayer = [ControlLayer node];
	[self addChild:controlLayer z:kDeapth_Btns];
    [controlLayer setDelegate:self];
}

-(void) initCharacters{
    penguin = [[Penguin alloc] init];
    [penguin setX:25];
    [penguin setY:14];
    [penguin setStatus:kPenguinAniStatus_Idle];
    //[penguin setDelegate:self];

    
    shellIdx = 0;
    maxShell = 20;
    for(int i = 0 ; i < maxShell ; i++){
        s_shell[i] = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(948/textureRatioForFuckingIpad, 370/textureRatioForFuckingIpad, 108/textureRatioForFuckingIpad, 76/textureRatioForFuckingIpad)];
        [ss_Character addChild:s_shell[i]];
        [s_shell[i] setPosition:ccp(-10000,-10000)];
        
        shellIsOnScreen[i] = false;
        shellX[i] = 10000;
        shellY[i] = 10000;
        
        shellIsAppearing[i] = false;
        
        isUsingFirstNowIsShellOnScreen = false;
        nowIsShellOnScreen[i] = false;
        nowIsShellOnScreen2[i] = false;
        shellIsFuckingPenguin[i] = false;
    }
}

-(void) initCannonBalls{
    maxCannonBall = 2;
    for(int i = 0 ; i < maxCannonBall ; i++){
        s_Cannon_Ball[i] = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(504/textureRatioForFuckingIpad, 724/textureRatioForFuckingIpad, 60/textureRatioForFuckingIpad, 58/textureRatioForFuckingIpad)];
        [s_Cannon_Ball[i] setPosition:ccp(1000,100000)];
        [ss_Character addChild:s_Cannon_Ball[i] z:kDeapth_Extra2];
        [s_Cannon_Ball[i] setScale:1.12];
        cannonBall_isAni[i] = false;
    }
    cannonBallIdx = 0;
}

-(void) initCannon{
    cannon = [[Cannon alloc] init];
    [cannon setDelegate:self];
}

-(void) genOneShellAtX:(int)_x Y:(int)_y{
   // printf("genOneShellAtX:%i %i\n",_x, _y);
    
    shellIsAppearing[shellIdx] = true;
    shellIsOnScreen[shellIdx] = true;
    shellAppearingTimer[shellIdx] = 0;
    
    shellScale[shellIdx] = 0;
    shellX[shellIdx] = _x;
    shellY[shellIdx] = _y;
    
    if(isUsingFirstNowIsShellOnScreen){
        //printf("PPP:%i\n",shellIdx);
         nowIsShellOnScreen[shellIdx] = true;
    }else{
       // printf("KK:%i\n",shellIdx);
         nowIsShellOnScreen2[shellIdx] = true;
    }
   
    
    shellIdx++;
    if(shellIdx == maxShell){
        shellIdx = 0;
    }
}

-(void) genNextShellChain{
    [self updateGameLevel];
    
    isUsingFirstNowIsShellOnScreen = !isUsingFirstNowIsShellOnScreen;
    
    static int simulateTimer;
    static float simulateX;
    static float simulateY;
    static float simulateVX;
    static float simulateVY;
    static float simulateAngle;
    static int simulateShellHasGen;
    
    static float superFuxkAngleDiff;
    static float superFuxkOriX;
    static float superFuxkOriY;
    static float superFuxkOffsetX;
    static float superFuxkOffsetY;
    static float superFuxkFuxkX;
    static float superFuxkFuxkY;
    static int ranChainStartX;
    

    
    //ranChainStartX = arc4random()%200;
   // ranChainStartX += 100;
    
   /* superFuxkOffsetX = -58 * cos(cannonAngle * M_PI/180 + M_PI/2);
    superFuxkOffsetY = 58 * sin(cannonAngle * M_PI/180 + M_PI/2) - 58;
    
    superFuxkAngleDiff = -cannonAngle * M_PI/180;
    superFuxkOriX = 91 * wholeCannonScaleFromSocurce * 2;
    superFuxkOriY = 35 * wholeCannonScaleFromSocurce * 2;
    superFuxkFuxkX = ranChainStartX + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff) - superFuxkOffsetX * wholeCannonScaleFromSocurce;
    superFuxkFuxkY = [cannon y] + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff) - superFuxkOffsetY * wholeCannonScaleFromSocurce;*/
    
    
    static int ranFinalAngle;
    ranFinalAngle = arc4random() % cannonAngleRange;
    ranFinalAngle += cannonMinAngle;
    
    if(isClockwise){
        cannonFinalAngle = -180 + ranFinalAngle;
        ranChainStartX = arc4random()%160;
        ranChainStartX += 240;
    }else{
        cannonFinalAngle = -ranFinalAngle;
        ranChainStartX = arc4random()%160;
        ranChainStartX += 80;
    }
    
    if(isIphone5){
        if(isClockwise){
            cannonFinalAngle = -180 + ranFinalAngle;
            ranChainStartX = arc4random()%208;
            ranChainStartX += 288;
        }else{
            cannonFinalAngle = -ranFinalAngle;
            ranChainStartX = arc4random()%208;
            ranChainStartX += 80;
        }

    }
    
    if(isIpad){
        if(isClockwise){
            cannonFinalAngle = -180 + ranFinalAngle;
            ranChainStartX = arc4random()%412;
            ranChainStartX += 512;
        }else{
            cannonFinalAngle = -ranFinalAngle;
            ranChainStartX = arc4random()%412;
            ranChainStartX += 100;
        }
        
    }
    
    superFuxkOffsetX = -58*2/textureRatioForFuckingIpad * cos(cannonFinalAngle * M_PI/180 + M_PI/2);
    superFuxkOffsetY = 58*2/textureRatioForFuckingIpad * sin(cannonFinalAngle * M_PI/180 + M_PI/2) - 58*2/textureRatioForFuckingIpad;
    
    superFuxkAngleDiff = -cannonFinalAngle * M_PI/180;
    superFuxkOriX = 91*2/textureRatioForFuckingIpad * wholeCannonScaleFromSocurce * 2;
    superFuxkOriY = 35*2/textureRatioForFuckingIpad * wholeCannonScaleFromSocurce * 2;
    superFuxkFuxkX = ranChainStartX + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff) - superFuxkOffsetX * wholeCannonScaleFromSocurce;
    superFuxkFuxkY = [cannon y] + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff) - superFuxkOffsetY * wholeCannonScaleFromSocurce;
    
    simulateTimer = 0;
    simulateShellHasGen = 0;
    simulateAngle = cannonFinalAngle;
    
    simulateX = superFuxkFuxkX;
    simulateY = superFuxkFuxkY; 
    
   //  printf("ranChainStartX:%i %4.8f\n",ranChainStartX, simulateX);
    
    simulateVX = cannonForce * cos(-simulateAngle * M_PI/180);
    simulateVY = cannonForce * sin(-simulateAngle * M_PI/180) * cannonAdditionalForceY;
    
    
    
    static int shellHasGen;
    static int hasFuckTime;
    
    hasFuckTime = 0;
    do{
        
        simulateTimer = 0;
        shellHasGen = 0;
        simulateShellHasGen = 0;
        [self getChainType];
        
        
        simulateX = superFuxkFuxkX;
        simulateY = superFuxkFuxkY; 
        simulateVX = cannonForce * cos(-simulateAngle * M_PI/180);
        simulateVY = cannonForce * sin(-simulateAngle * M_PI/180) * cannonAdditionalForceY;

        
        do{
            simulateX += simulateVX;
            simulateY += simulateVY;
            simulateVY += cannonGravity;
            simulateVX *= cannonFriction;
            
            simulateTimer++;
            
           // printf("simulateTimer:%i %i %i\n",simulateTimer,chainIntervalSelect[shellHasGen],shellHasGen);
            
            static int boundaryY;
            if(isIphone5){
                boundaryY = 455 + 88;
            }else{
                boundaryY = 455;
            }
            
            if(simulateX > 25 && simulateX < boundaryY){
                if(simulateY > 70){
                    if(simulateTimer == chainIntervalSelect[shellHasGen]){
                        //printf("fuck one shell:%4.8f %4.8f\n",simulateX,simulateY);
                        genX[shellHasGen] = simulateX;
                        genY[shellHasGen] = simulateY;
                        
                        simulateShellHasGen++;
                        shellHasGen++;
                        
                        //[self genOneShellAtX:simulateX Y:simulateY];
                    }
                }
            }
            
                
        }while(simulateY > 69 && simulateShellHasGen < maxShellGen);
        
       // printf("TTTshellHasGen:%i\n",shellHasGen);
       // printf("\n\n");
        
        hasFuckTime++;
        if(hasFuckTime == 20){
         //   printf("fuck too many time\n");
            isUsingFirstNowIsShellOnScreen = !isUsingFirstNowIsShellOnScreen;
            [self genNextShellChain];
            return;
        }
    
    }while (shellHasGen <= 1);
    
    for(int i = 0 ; i < shellHasGen ; i++){
        [self genOneShellAtX:genX[i] Y:genY[i]];
    }

    
    cannonAngleInterval = cannonFinalAngle - cannonAngle;
    isClockwise = !isClockwise;
    
   // cannBall_isHittingFirstChain = !cannBall_isHittingFirstChain;
}

-(void) getChainType{
    static int ranChainType;
    ranChainType = arc4random()%100;
    if(ranChainType < chainTypeAppearRatio[0]){
        ranChainType = 0;
    }else  if(ranChainType < chainTypeAppearRatio[1]){
        ranChainType = 1;
    }else  if(ranChainType < chainTypeAppearRatio[2]){
        ranChainType = 2;
    }else  if(ranChainType < chainTypeAppearRatio[3]){
        ranChainType = 3;
    }else  if(ranChainType < chainTypeAppearRatio[4]){
        ranChainType = 4;
    }
    
    for(int i = 0 ; i < 15 ; i++){
        chainIntervalSelect[i] = -1;
    }
    
    static int chainSimulateTimer;
    static int chainOIntervalHasSelected;
    static int ranCut;
    static int chainCalInterval;
    
    chainSimulateTimer = 0;
    chainOIntervalHasSelected = 0;

    if(ranChainType == kChainType_Constant){
        ranCut = 0;
        chainCalInterval = chainAverageInterval;
    }
    
    if(ranChainType == kChainType_Middle){
        ranCut = arc4random() % 2;
        ranCut += 1;
        chainCalInterval = chainAverageInterval - 1;
    }
    if(ranChainType == kChainType_Behine){
        ranCut = arc4random() % 3;
        ranCut += 3;
        chainCalInterval = chainAverageInterval - 2;
    }
    
    if(ranChainType == kChainType_Constant || ranChainType == kChainType_Middle || ranChainType == kChainType_Behine){
        do{
            
           // printf("chainSimulateTimer:%i %i\n",chainSimulateTimer,chainAverageInterval);
            
            if(chainSimulateTimer % chainCalInterval == 0 && chainSimulateTimer != 0){
                if(chainOIntervalHasSelected - ranCut >= 0){
                   // printf("assign;%i %i\n",chainOIntervalHasSelected,chainSimulateTimer);
                    chainIntervalSelect[chainOIntervalHasSelected - ranCut] = chainSimulateTimer;
                }
                
                chainOIntervalHasSelected++;
            }
            
            chainSimulateTimer++;
        }while(chainOIntervalHasSelected < chainMaxShellAppear);
    }
    
  //  printf("getChainType:%i\n",ranChainType);
    /*printf("getChainType:%i\n",ranChainType);
    for(int i = 0 ; i < 15 ; i++){
        printf("%i  ",chainIntervalSelect[i]);
    }
    printf("\n");*/
}


-(void) manage:(ccTime) dt{
    [self manageCannon];
    [self manageCannonBalls];
    [self manageShells];
    [self manageShootToNextChain];
    [self managePenguinJump];
    [self updatePCPosition];
    
    [cannon manage];
    [penguin manage];
     [self manageCarriage];
}

-(void) manageCarriage{
    carriage_X = [cannon x];
    carriage_Y = [cannon y]-2*2/textureRatioForFuckingIpad;
    
    [s_carriage setPosition:ccp(carriage_X, carriage_Y)];
    [s_carriageWheel[0] setPosition:ccp(carriage_X - 30*2/textureRatioForFuckingIpad, carriage_Y)];
    [s_carriageWheel[1] setPosition:ccp(carriage_X + 30*2/textureRatioForFuckingIpad, carriage_Y)];
    
    static float whellCircumfunce = 84.8230016; // 27 X PI
    carriage_wheelVR = PCVX / whellCircumfunce * 360;
    carriage_wheelR += carriage_wheelVR;
    
    [s_carriageWheel[0] setRotation:carriage_wheelR];
    [s_carriageWheel[1] setRotation:carriage_wheelR];
    
}

-(void) manageShells{
    for(int i = 0 ; i < maxShell ; i++){
        if(shellIsAppearing[i]){
            
            if(shellAppearingTimer[i] < 10){
                shellScale[i] += 0.1;
            }else{
                shellScale[i] += (0.8 -  shellScale[i])/12;
            }
            
            [s_shell[i] setPosition:ccp(shellX[i], shellY[i])];
            [s_shell[i] setScale:shellScale[i]];
            
            shellAppearingTimer[i]++;
        }
        
        if(shellIsFuckingPenguin[i]){
            static int ranFuckPenguinX;
            static int ranFuckPenguinY;
            
            if(shellIsFuckingpenguinTimer[i] < 3){
                ranFuckPenguinX = arc4random() % 2;
                ranFuckPenguinX -= 1;
                
                ranFuckPenguinY = arc4random() % 2;
                ranFuckPenguinY -= 1;
            }else{
                ranFuckPenguinX = arc4random() % 4;
                ranFuckPenguinX -= 2;
                
                ranFuckPenguinY = arc4random() % 4;
                ranFuckPenguinY -= 2;
            }
            
            [s_shell[i] setPosition:ccp(shellX[i] + ranFuckPenguinX, shellY[i] + ranFuckPenguinY)];
            
            shellScale[i] += 0.05;
            [s_shell[i] setScale:shellScale[i]];
            
            if(shellIsFuckingpenguinTimer[i] == 15){
                shellIsFuckingPenguin[i] = false;
                
                [playLayer setToBombing:shellX[i] turtleY:shellY[i]];
                shellX[i] = 10000;
                shellY[i] = 10000;
                [s_shell[i] setPosition:ccp(-10000,-10000)];
                shellIsOnScreen[i] = false;
                shellIsAppearing[i] = false;
                
                [musicController playThisSound:kSound_TurtleExplode03 isLoop:NO gain:1.0];
                
            }
            
            shellIsFuckingpenguinTimer[i]++;
        }
    }
}

-(void) manageCannon{
    if(hasShotOnceAndTakeRestForNextFuck){
        hasShotOnceAndTakeRestForNextFuckTimer++;
        if(hasShotOnceAndTakeRestForNextFuckTimer == 30){
            hasShotOnceAndTakeRestForNextFuck = false;
        }
    }
    
    cannonAngle += cannonAngleInterval/4;
    if(!isClockwise){
        if(cannonAngle < cannonFinalAngle){
            cannonAngle = cannonFinalAngle;
        }
    }else{
      //  cannonFinalAngle = -45;
        if(cannonAngle > cannonFinalAngle){
            cannonAngle = cannonFinalAngle;
        }
    }
    
    [cannon setRotateDegree:cannonAngle + 50.4801941];
    
    return;
    
    if(isClockwise){
        cannonAngle += cannonRotationSpeed;
        if(cannonAngle > 0){
            cannonAngle = 0;
            isClockwise = !isClockwise;
        }
    }else{
        cannonAngle -= cannonRotationSpeed;
        if(cannonAngle < -90){
            cannonAngle = -90;
            isClockwise = !isClockwise;
        }
    }
    
   [cannon setRotateDegree:cannonAngle + 50.4801941];
}



-(void) manageCannonBalls{
    
    for(int i = 0 ; i < maxCannonBall ; i++){
        if(cannonBall_isAni[i]){
            cannonBall_X[i] += cannonBall_VX[i];
            cannonBall_Y[i] += cannonBall_VY[i];
            
            cannonBall_VY[i] += cannonGravity;
            cannonBall_VX[i] *= cannonFriction;
            
            [s_Cannon_Ball[i] setPosition:ccp(cannonBall_X[i],cannonBall_Y[i])];
            
            if(cannonBall_VY[i] > 0){
                cannonBallIsGoingDown[i] = false;
            }else{
                cannonBallIsGoingDown[i] = true;
            }
            
            
            if(cannonBall_Y[i] < -20){
                cannonBall_isAni[i] = false;
                
                if(isFuckedAndLoseCombo){
                    if(currentCombo >= 5){
                        printf("REDUCE\n");
                        comboReduceSpeedAccum -= 0.004;
                        if(comboReduceSpeedAccum < -0.01){
                            comboReduceSpeedAccum = -0.01;
                        }
                        comboReduceSpeedAccumSpeed = -comboReduceSpeedAccum;
                    }
                    
                    [uILayer lostCombo];
                    isFuckedAndLoseCombo = false;
                    
                }
            }
        }
        
        
    }

    for(int j = 0 ; j < maxShell ; j++){
        if(shellIsOnScreen[j] && !shellIsFuckingPenguin[j]){
            for(int i = 0 ; i < maxCannonBall ; i++){
                if(cannonBall_isAni[i]){
                    static float ballShellDiffX;
                    static float ballShellDiffY;
                    static float ballShellDiff;
                    ballShellDiffX = cannonBall_X[i] - shellX[j];
                    ballShellDiffY = cannonBall_Y[i] - shellY[j];
                    ballShellDiff = sqrtf(ballShellDiffX*ballShellDiffX + ballShellDiffY*ballShellDiffY);
                    
                    
                    if(ballShellDiff < detectShellRadius + detectCannonBallRadius){
                        if((i == 0 && nowIsShellOnScreen[j]) || (i == 1 && nowIsShellOnScreen2[j])){
                            [self thisShellIsBeingShot:j];
                        }
                    }
                    
                   
                    if(cannonBallIsGoingDown[i] && cannonBall_Y[i] - shellY[j] < -40 && i == 0 && nowIsShellOnScreen[j]){
                        //printf("d:%i\n",i);
                        nowIsShellOnScreen[j] = false;
                         [self setThisShellFuckBackPenguin:j];
                    }
                    
                    if(cannonBallIsGoingDown[i] && cannonBall_Y[i] - shellY[j] < -40 && i == 1 && nowIsShellOnScreen2[j]){
                         nowIsShellOnScreen2[j] = false;
                         [self setThisShellFuckBackPenguin:j];
                    }
                }
                
            }
        }
    }
}

-(void) thisShellIsBeingShot:(int)_shellIdx{
    [uILayer gainCombo:1];
    [playLayer setToBombing:shellX[_shellIdx] turtleY:shellY[_shellIdx]];
    shellX[_shellIdx] = 10000;
    shellY[_shellIdx] = 10000;
    [s_shell[_shellIdx] setPosition:ccp(10000,10000)];
    shellIsOnScreen[_shellIdx] = false;
    shellIsAppearing[_shellIdx] = false;
    
    nowIsShellOnScreen[_shellIdx] = false;
    nowIsShellOnScreen2[_shellIdx] = false;
    
    [musicController playThisSound:kSound_ComboSmoke isLoop:NO gain:1.0];
    [musicController playThisSound:kSound_CrackShell isLoop:NO gain:0.7];
    
    gameRound++;
    counterForAchivement++;
}

-(void) btnIsTappedInControlLayer:(int)_btnIdx{
    if(_btnIdx == 0){
        isTappingRight = false;
        isTappingLeft = true;
    }
    if(_btnIdx == 3){
        isTappingLeft = false;
        isTappingRight = true;
    }
}

-(void) btnIsReleasedInControlLayer:(int)_btnIdx{
    if(_btnIdx == 0){
        isTappingLeft = false;
    }
    if(_btnIdx == 3){
        isTappingRight = false;
    }
}

- (void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    
    if(isStopping){
        return;
    }
    
    if(isTapWronglyAndDisableBtns){
        isTapWronglyAndDisableBtns = false;
        isFuckingShootFirstTime = false;
        return;
    }
}

- (void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [super ccTouchesBegan:touches withEvent:event];

    if(isTapWronglyAndDisableBtns){
        return;
    }
    if(isStopping){
        return;
    }
 
    for( UITouch *touch in touches ) {
		CGPoint location = [touch locationInView: [touch view]];
		location = [[CCDirector sharedDirector] convertToGL: location];
        
         int boundaryY;
        
        if(isIpad){
            boundaryY = 844;
            
            if(location.y < 180){
                if(location.x > 179 && location.x < boundaryY){
                    [self shootCannon];
                }
            }
            
            if(location.y < 700 && location.y > 180){
                [self shootCannon];
            }
            
        }else{
            if(isIphone5){
                boundaryY = 396 + 88;
            }else{
                boundaryY = 396;
            }
            
            if(location.y < 90){
                if(location.x > 84 && location.x < boundaryY){
                    [self shootCannon];
                }
            }
            
            if(location.y < 258 && location.y > 90){
                [self shootCannon];
            }
            
        }

        
        
        //  printf("lx:%4.8f %4.8f\n",location.x,location.y );
    }

}

-(void) shootCannon{
    if(hasShotOnceAndTakeRestForNextFuck){
        return;
    }
    
    hasShotOnceAndTakeRestForNextFuck = true;
    hasShotOnceAndTakeRestForNextFuckTimer = 0;
    
    static float superFuxkAngleDiff;
    static float superFuxkOriX;
    static float superFuxkOriY;
    static float superFuxkOffsetX;
    static float superFuxkOffsetY;
    static float superFuxkFuxkX;
    static float superFuxkFuxkY;
    
    superFuxkOffsetX = -58*2/textureRatioForFuckingIpad * cos(cannonAngle * M_PI/180 + M_PI/2);
    superFuxkOffsetY = 58*2/textureRatioForFuckingIpad * sin(cannonAngle * M_PI/180 + M_PI/2) - 58*2/textureRatioForFuckingIpad;
    
    superFuxkAngleDiff = -cannonAngle * M_PI/180;
    superFuxkOriX = 91*2/textureRatioForFuckingIpad * wholeCannonScaleFromSocurce * 2;
    superFuxkOriY = 35*2/textureRatioForFuckingIpad * wholeCannonScaleFromSocurce * 2;
    superFuxkFuxkX = [cannon x] + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff) - superFuxkOffsetX * wholeCannonScaleFromSocurce;
    superFuxkFuxkY = [cannon y] + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff) - superFuxkOffsetY * wholeCannonScaleFromSocurce;
    
    
    cannonBall_X[cannonBallIdx] = superFuxkFuxkX;
    cannonBall_Y[cannonBallIdx] = superFuxkFuxkY; 
    
    cannonBall_VX[cannonBallIdx] = cannonForce * cos(-cannonAngle * M_PI/180);
    cannonBall_VY[cannonBallIdx] = cannonForce * sin(-cannonAngle * M_PI/180) * cannonAdditionalForceY;
    
    cannonBall_isAni[cannonBallIdx] = true;
    cannonBall_Timer[cannonBallIdx] = 0;
    
    cannonBallIdx++;
    if(cannonBallIdx == maxCannonBall){
        cannonBallIdx = 0;
    }
    
    [playLayer setToBombingCannon:[cannon x] y:[cannon y]];
    
    if(!hasShotCannonBeforeNextChain){
        hasShotCannonBeforeNextChain = true;
        isShootingCannon = true;
        shootCannonTimer = 0;
    }
    
    [musicController playThisSound:kSound_TurtleExplode01 isLoop:NO gain:1.0];
}

-(void) manageShootToNextChain{
    if(isShootingCannon){
        
        [self changePenguinPosition];
        shootCannonTimer++;
        
        if(shootCannonTimer == 20){
            //isShootingCannon = false;
            hasShotCannonBeforeNextChain = false;
            [self genNextShellChain];
        }
        
        if(shootCannonTimer == 40){
            isShootingCannon = false;
            //[self checkToAnyRemainShellHasntHitted];
            cannBall_isHittingFirstChain = !cannBall_isHittingFirstChain;
        }
        
    }
}

-(void) checkToAnyRemainShellHasntHitted{
    //isUsingFirstNowIsShellOnScreen = !isUsingFirstNowIsShellOnScreen;
    
    if(!isUsingFirstNowIsShellOnScreen){
        for(int i = 0 ; i < maxShell ; i++){
            if(nowIsShellOnScreen[i]){
                nowIsShellOnScreen[i] = false;
                [self setThisShellFuckBackPenguin:i];
            }
        }
    }else{
        for(int i = 0 ; i < maxShell ; i++){
            if(nowIsShellOnScreen2[i]){
                nowIsShellOnScreen2[i] = false;
                [self setThisShellFuckBackPenguin:i];
            }
        }
    }
    
    //isUsingFirstNowIsShellOnScreen = !isUsingFirstNowIsShellOnScreen;
}

-(void) setThisShellFuckBackPenguin:(int)_shellIdx{
    shellIsFuckingPenguin[_shellIdx] = true;
    shellIsFuckingpenguinTimer[_shellIdx] = 0;
    isFuckedAndLoseCombo = true;
}

-(void) changePenguinPosition{
   /* if(shootCannonTimer == 0){
        [playLayer setToBombing:[penguin x] turtleY:[penguin y]+30]; 
        if(!isClockwise){
            [playLayer setToBombing:[penguin x]-70 turtleY:[penguin y]+30];
        }else{
            [playLayer setToBombing:[penguin x]+70 turtleY:[penguin y]+30];
        }
    }*/
    
    if(shootCannonTimer == 20){
        if(!isClockwise){
            [self setPenguinJump:true];
            //PCPOffsetX = 0;
            //[penguin setFacingRight:true];
        }else{
            [self setPenguinJump:false];
            //PCPOffsetX = 73;
            //[penguin setFacingRight:false];
        }
    }
    
}

-(void) managePenguinJump{
    if(!penguinIsJumping){
        return;
    }
    
    if(penguinJumpTimer == 0){
        if(!isClockwise){
            penguinJumpFinalX = [penguin x] + 65*2/textureRatioForFuckingIpad;
        }else{
            penguinJumpFinalX = [penguin x] - 65*2/textureRatioForFuckingIpad;
        }
        
        penguinJumpFinalY = [penguin y];
        
        [penguin setJump:kPenguinJump_jumpTo1TurtleShell];
        
        penguinJumpingExternalStartX = PCX;
    }
    
    if(penguinJumpTimer == 4){
        if(isClockwise){
            [penguin setFacingRight:true];
        }else{
            [penguin setFacingRight:false];
        }
    }
    
    if(penguinJumpTimer == 8){
        if(isClockwise){
            PCPOffsetX = 0;
        }else{
            PCPOffsetX = 65*2/textureRatioForFuckingIpad;
        }
        
        penguinIsJumping = false;
    }
    
    penguinJumpTimer++;
    
}
             
-(void) setPenguinJump:(bool)_isJumpingToRight{
    penguinJumpingToRight = _isJumpingToRight;
    penguinJumpTimer = 0;
    penguinIsJumping = true;
}

-(void) updatePCPosition{
    if(isTappingRight){
        PCVX+=PCAX;
    }else if(isTappingLeft){
        PCVX-=PCAX;
    }else{
        PCVX += (0.0 - PCVX)/8.0;
    }
    
    
    PCX += PCVX;
    
    static int boundaryY;
    
    
    if(isClockwise){
        if(PCX < 7){
            PCX = 7;
            PCVX = 0;
        }
        
        boundaryY = 414;
        if(isIphone5){
            boundaryY = 414 + 88;
        }
        if(isIpad){
            boundaryY = 896;
        }
        
        if(PCX > boundaryY){
            PCX = boundaryY;
            PCVX = 0;
        }
    }else{
        if(PCX < -14){
            PCX = -14;
            PCVX = 0;
        }
        
        boundaryY = 390;
        if(isIphone5){
            boundaryY = 390 + 88;
        }
        if(isIpad){
            boundaryY = 844;
        }
        
        if(PCX > boundaryY){
            PCX = boundaryY;
            PCVX = 0;
        }
    }
    
   /* if(PCVX != 0 && penguinIsJumping){
        [penguin setX:PCX+PCPOffsetX];
        printf("PCX-penguinJumpingExternalStartX:%4.8f\n",PCX-penguinJumpingExternalStartX);
        [penguin setExternalOffsetFinalXALL:(PCX-penguinJumpingExternalStartX)];
    }else{
        [penguin setX:PCX+PCPOffsetX];
        [penguin setExternalOffsetFinalXALL:0];
    }*/
    
    [penguin setX:PCX+PCPOffsetX];
    [penguin setY:(int)PCY];

    
    [cannon setX:PCX + 40*2/textureRatioForFuckingIpad];
    [cannon setY:PCY];
    
   
}

-(void) beforeLoseComboWhenComboRemainGoesToZero{
    printf("beforeLoseComboWhenComboRemainGoesToZero\n");
    if(currentCombo >= 5){
        printf("REDUCE\n");
        comboReduceSpeedAccum -= 0.004;
        if(comboReduceSpeedAccum < -0.01){
            comboReduceSpeedAccum = -0.01;
        }
        comboReduceSpeedAccumSpeed = -comboReduceSpeedAccum;
    }
    
}

-(void) dealloc
{
	printf("Mini 11 Dealloc\n");
    
    [penguin release];
    [cannon release];
    
	[super dealloc];
}

@end
