//
//  Mini05.m
//  TurtlesHuh
//
//  Created by  on 2012/5/15.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "Mini05.h"
#import "GamePlayGlobal.h"
#import "animationDefs.h"
#import "Global.h"

@implementation Mini05

-(void) updateGameLevel{

    if(gameRound < 10){
        SecondLevelShellAppearRatio = 0;
        comoboReduceSpeed = comboReduceSpeedAccum + 0.005;
    }else if(gameRound < 20){
        SecondLevelShellAppearRatio = 0;
        comoboReduceSpeed = comboReduceSpeedAccum + 0.007;
    }else if(gameRound < 35){
        SecondLevelShellAppearRatio = 10;
        comoboReduceSpeed = comboReduceSpeedAccum + 0.009;
    }else if(gameRound < 50){
        SecondLevelShellAppearRatio = 15;
        comoboReduceSpeed = comboReduceSpeedAccum + 0.012;
    }else if(gameRound < 65){
        SecondLevelShellAppearRatio = 20;
        comoboReduceSpeed =comboReduceSpeedAccum +  0.014;
    }else if(gameRound < 85){
        SecondLevelShellAppearRatio = 30;
        comoboReduceSpeed = comboReduceSpeedAccum + 0.016;
    }else if(gameRound < 110){
        SecondLevelShellAppearRatio = 30;
        comoboReduceSpeed = comboReduceSpeedAccum + 0.018;
    }else if(gameRound < 150){
        SecondLevelShellAppearRatio = 20;
        comoboReduceSpeed = comboReduceSpeedAccum + 0.02;
    }else if(gameRound < 190){
        SecondLevelShellAppearRatio = 15;
        comoboReduceSpeed = comboReduceSpeedAccum + 0.024;
    }else if(gameRound < 230){
        SecondLevelShellAppearRatio = 5;
        comoboReduceSpeed = comboReduceSpeedAccum + 0.027;
    }else if(gameRound < 270){
        SecondLevelShellAppearRatio = 0;
        comoboReduceSpeed = comboReduceSpeedAccum + 0.03;
    }else if(gameRound < 300){
        SecondLevelShellAppearRatio = 0;
        comoboReduceSpeed = comboReduceSpeedAccum + 0.035;
    }
    
    if(comboReduceSpeedAccum < 0){
        comboReduceSpeedAccum += comboReduceSpeedAccumSpeed/20;  //0.006/20
    }else{
        comboReduceSpeedAccum = 0;
    }
    
    if(comoboReduceSpeed < 0.005){
        comoboReduceSpeed = 0.005;
    }
    
   /* if(gameRoundFromBegin == 5){
        comoboReduceSpeed *= 0.5;
    }
    if(gameRoundFromBegin == 6){
        comoboReduceSpeed *= 0.6;
    }
    if(gameRoundFromBegin == 7){
        comoboReduceSpeed *= 0.7;
    }
    if(gameRoundFromBegin == 8){
        comoboReduceSpeed *= 0.8;
    }
    if(gameRoundFromBegin == 9){
        comoboReduceSpeed *= 0.9;
    }*/

   // printf("updateGameLevel:%i %i %i %4.8f %4.8f\n",gameLevel,gameRound, gameRoundFromBegin, comboReduceSpeedAccum, comoboReduceSpeed);
}

-(void) restart{
    
    [super restart];
    
    for(int i = 1 ; i < maxTurtle ; i++){
        [self setShellColor:i];
    }
    
    for(int i = 0 ; i < maxTurtle ; i++){
        ranSecondShellRatio = arc4random() % 100;
        if(ranSecondShellRatio < SecondLevelShellAppearRatio){
            ranShellLevel = 2;
        }else{
            ranShellLevel = 1;
        }
        [turtle[i] setShellLevel:ranShellLevel];
    }
    
}

-(void) initControlLayer{
    controlLayer = [ControlLayer node];
	[self addChild:controlLayer z:kDeapth_Btns];
    [controlLayer setDelegate:self];
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
        
        comboColorLimit[0] = 0;
        comboColorLimit[1] = 12;
        comboColorLimit[2] = 24;
        comboColorLimit[3] = 36;
        comboColorLimit[4] = 48;
        comboColorLimit[5] = 60;
        comboColorLimit[6] = 72;
        comboColorLimit[7] = 84;
        comboColorLimit[8] = 96;
        comboColorLimit[9] = 108;
        comboColorLimit[10] = 120;
        
        maxTime = 30;
        timeRemain = maxTime;
        
        cannonAngle = 0;
        fuckAngle = 30;
        
        gameRoundFromBegin = 0;
        SecondLevelShellAppearRatio = 0;
        
        isAniWrong = false;
        
        s_bg = [CCSprite spriteWithFile:@"mini_05_bg.png"];
        [s_bg setPosition:ccp([UIScreen mainScreen].bounds.size.height/2, [UIScreen mainScreen].bounds.size.width/2)];
		[self addChild:s_bg];
        
        wholeCannonScaleFromSocurce = 0.5;
        wholeTurtleScaleFromSocurce = 0.5;
        wholePenguinScaleFromSocurce = 0.55;
        
        [self initShadows];
        [self initCharacters];
        [self initCannon];
        [self initCannonBalls];
        [self initShellPos];
        [self initShellColors];
        
        gameLevel = 0;
        numberTapToNextRound = 0;
        remainTapToNextRound = 0;
        
        isPrepareShooting = false;
        
        [cannon setCannonStatus:kCannonStatus_Idle];
        
        [self initControlLayer];
        
        [self updateGameLevel];
        
    }
	return self;
}

-(void) initShadows{
    s_shadow_cannon = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1550/textureRatioForFuckingIpad, 640/textureRatioForFuckingIpad, 366/textureRatioForFuckingIpad, 28/textureRatioForFuckingIpad)];
    s_shadow_penguin = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1550/textureRatioForFuckingIpad, 610/textureRatioForFuckingIpad, 204/textureRatioForFuckingIpad, 26/textureRatioForFuckingIpad)];
    
    [ss_Character addChild:s_shadow_cannon];
    [ss_Character addChild:s_shadow_penguin];
    
    [s_shadow_penguin setPosition:ccp(28,12)];
    [s_shadow_cannon setPosition:ccp(90,6)];
    
    if(isIpad){
        [s_shadow_penguin setPosition:ccp(56,24)];
        [s_shadow_cannon setPosition:ccp(180,12)];
    }
}

-(void) initShellColors{
    static int ranColor;
    ranColor = arc4random() % 4;
    shellColor[0] = ranColor;
    [turtle[0] setColor:ranColor];
    
    for(int i = 1 ; i < maxTurtle ; i++){
        [self setShellColor:i];
    }
    
    for(int i = 0 ; i < maxTurtle ; i++){
        ranSecondShellRatio = arc4random() % 100;
       // printf("ranSecondShellRatio:%i %i\n",ranSecondShellRatio,SecondLevelShellAppearRatio);
        if(ranSecondShellRatio < SecondLevelShellAppearRatio){
            ranShellLevel = 2;
        }else{
            ranShellLevel = 1;
        }
        [turtle[i] setShellLevel:ranShellLevel];
    }
}

-(void) initShellPos{
    shellMovingSpeed = -10;
    
     float shellStartX = 210;
     float shellStartY = 200;
     float shellOffsetX = 70;
    
    if(isIpad){
         shellStartX = 420;
         shellStartY = 400;
         shellOffsetX = 140;
    }
    
    shellFixPosY = shellStartY;
    
    for(int i = 0 ; i < maxTurtle ; i++){
        shellToFixIdx[i] = i;
        shellFixPosX[i] = shellStartX + shellOffsetX * i;
        
        shellPosX[i] = shellFixPosX[i];
        shellPosY[i] = shellFixPosY;
    }
}

-(void) initCharacters{
    penguin = [[Penguin alloc] init];
    [penguin setX:25];
    [penguin setY:14];
    
    if(isIpad){
        [penguin setX:30];
        [penguin setY:28];
    }
    
    [penguin setStatus:kPenguinAniStatus_Idle];
    [penguin setDelegate:self];
    
    maxTurtle = 12;
    for(int i = 0 ; i < maxTurtle ; i++){
        turtle[i] = [[Turtle alloc] init];
        [turtle[i] setX:10000];
        [turtle[i] setY:10000];
        [turtle[i] setStatus:kTurtleAniStatus_Normal_In];
        [turtle[i] setIdNumber:i];
        [turtle[i] setDelegate:self];
        [turtle[i] setBombOutType:kTurtleBombOutType_bombOutOffScreen];
        [turtle[i] bombOutOffScreenDirection:kBombOutOffScreenDirection_Right];
    }
    
    turtleIdx = 0;
}

-(void) initCannonBalls{
    maxCannonBall = 8;
    for(int i = 0 ; i < maxCannonBall ; i++){
        s_Cannon_Ball[i] = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(0/textureRatioForFuckingIpad,0/textureRatioForFuckingIpad,0/textureRatioForFuckingIpad,0/textureRatioForFuckingIpad)];
        [s_Cannon_Ball[i] setPosition:ccp(1000,100000)];
        [ss_Character addChild:s_Cannon_Ball[i] z:kDeapth_Extra2];
        
        cannonBall_isAni[i] = false;
    }
    cannonBallIdx = 0;
}

-(void) initCannon{
    cannon = [[Cannon alloc] init];
    [cannon setDelegate:self];
    
    if(isIpad){
        [cannon setX:110];
        [cannon setY:14];
    }
}





-(void) manageCannonBalls{

    for(int i = 0 ; i < maxCannonBall ; i++){
        if(cannonBall_isAni[i]){
            
            if(cannonBall_Timer[i] == 0){
                cannonBall_X[i] = [cannon x] + 20;
                cannonBall_Y[i] = [cannon y] + 15;
                
                if(isIpad){
                    cannonBall_X[i] = [cannon x] + 40;
                    cannonBall_Y[i] = [cannon y] + 30;
                }
            }
            
            
            
            if(isIpad){
                cannonBall_X[i] += 80;
                cannonBall_Y[i] += 60;
            }else{
                cannonBall_X[i] += 40;
                cannonBall_Y[i] += 30;
            }
            
            cannonBall_Timer[i]++;

            
            if(cannonBall_Timer[i] == 1){
                cannonBall_isAni[i] = false;
                cannonBall_Timer[i] = 0;

                //[playLayer setToShakingBomb:shellFixPosX[0] turtleY:shellFixPosY];
                
                [s_Cannon_Ball[i] setPosition:ccp(10000,10000)];
                
                //[turtle[turtleIdx] setStatus:kTurtleAniStatus_Bombing];
                [turtle[turtleIdx] tap2];
                
                //printf("[turtle[turtleIdx] hurtTime]:%i %i\n",[turtle[turtleIdx] hurtTime],[turtle[turtleIdx] shellLevel]);
                if(([turtle[turtleIdx] hurtTime] == 1 && [turtle[turtleIdx] shellLevel] == 1) || ([turtle[turtleIdx] hurtTime] == 2 && [turtle[turtleIdx] shellLevel] == 2)){
                    [self rearrageShellPos];
                    
                    [turtle[turtleIdx] resetHurtTime];
                    
                    turtleIdx++;
                    if(turtleIdx == maxTurtle){
                        turtleIdx = 0;
                    }
                }
                
            }
        }
    }
}

-(void) manageShells{
    for(int i = 0 ; i < maxTurtle ; i++){
        //if([turtle[i] status] == kTurtleAniStatus_Normal_In){
            if(shellPosX[i] > shellFixPosX[shellToFixIdx[i]]){
                shellPosX[i] += shellMovingSpeed;
            }else{
                shellPosX[i] = shellFixPosX[shellToFixIdx[i]];
            }
            
        if([turtle[i] status] == kTurtleAniStatus_Normal_In){
            [turtle[i] setX:shellPosX[i]];
            [turtle[i] setY:shellPosY[i]];
        }
            
            //if(i == 1){
            //printf("i%i %4.8f %4.8f %i\n",i, shellPosX[i], shellPosY[i], [turtle[i] color]);
           // }
            
        /*if(i == 0){
            //printf("Turlt0 pos:%i %4.8f %4.8f %i\n",i,shellPosX[shellToFixIdx[i]], shellFixPosX[i], shellToFixIdx[i]);
            printf("Turlt pos:%i %4.8f %4.8f %i color:%i\n",i,shellPosX[i], shellFixPosX[shellToFixIdx[i]], shellToFixIdx[i], [turtle[i] color]);
        }*/
           // printf("Turlt pos:%i %4.8f %4.8f %i\n",i,shellPosX[i], shellFixPosX[shellToFixIdx[i]], shellToFixIdx[i]);
       // }
    }
}

-(void) manageWrong{
    if(isAniWrong){
        if(wrongTimer == 0){
            wrongScale = 1.0;
        }
        
        wrongTimer++;
        
        static int ranX;
        static int ranY;
        
        if(wrongTimer < 20){
            wrongScale += 0.01;
        }else{
            wrongScale -= 0.01;
        }
        
        for(int i = 0 ; i < maxTurtle ; i++){
            if(wrongTimer < 10 || wrongTimer > 30){
                ranX = arc4random()% 2 - 1;
                ranY = arc4random()%2 - 1;
            }else{
                ranX = arc4random()% 4 - 2;
                ranY = arc4random()%4 - 2;
            }
            
            
            [turtle[i] setWholeScale:wrongScale];
            [turtle[i] setX:shellPosX[i] + ranX];
            [turtle[i] setY:shellPosY[i] + ranX];
        }
        
        
        if(wrongTimer == 40){
            
            wrongScale = 1.0;
            for(int i = 0 ; i < maxTurtle ; i++){
                [turtle[i] setWholeScale:1.0];
                [turtle[i] setX:shellPosX[i]];
                [turtle[i] setY:shellPosY[i]];
            }
            
            isAniWrong = false;
        }
    }
}

-(void) setShellColor:(int)_shellIdx{
    static int prevShellIdx;
    prevShellIdx = _shellIdx - 1;
    if(prevShellIdx < 0){
        prevShellIdx = maxTurtle - 1;
    }
    
    static int ranColor;
    static bool hasCollide;
    
    do{
        hasCollide = false;
        ranColor = arc4random() % 4;
        
        if(ranColor == shellColor[prevShellIdx]){
            hasCollide = true;
        }
        
    }while(hasCollide);
    
   // printf("setShellColor:%i\n",ranColor);
    
    shellColor[_shellIdx] = ranColor;
    [turtle[_shellIdx] setColor:ranColor];
    
}

- (void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [super ccTouchesBegan:touches withEvent:event];
    
    if(isTapWronglyAndDisableBtns){
        return;
    }
    
    if(isStopping){
        return;
    }
    
    return;
    
	for( UITouch *touch in touches ) {
		CGPoint location = [touch locationInView: [touch view]];
		location = [[CCDirector sharedDirector] convertToGL: location];
        
        if(location.y < 84){
            if(location.x > 189 && location.x < 267){
                [self tapButton:kBtnColor_Brown];
            }
            if(location.x > 267 && location.x < 344){
                [self tapButton:kBtnColor_Red];
            }
            if(location.x > 344 && location.x < 421){
                [self tapButton:kBtnColor_Green];
            }
            if(location.x > 421){
                [self tapButton:kBtnColor_Blue];
            }    
        }
        
      //  printf("lx:%4.8f %4.8f\n",location.x,location.y );
    }
}

-(void) btnIsTappedInControlLayer:(int)_btnIdx{
   // printf("btnIsTappedInControlLayer:%i\n",_btnIdx);
    if(_btnIdx == 0){
        [self tapButton:kBtnColor_Brown];
    }
    if(_btnIdx == 1){
        [self tapButton:kBtnColor_Red];
    }
    if(_btnIdx == 2){
        [self tapButton:kBtnColor_Green];
    }
    if(_btnIdx == 3){
        [self tapButton:kBtnColor_Blue];
    }
}

-(void) manage:(ccTime) dt{
   // fuckAngle += (0 - fuckAngle)/20;
    //[cannon setRotateDegree:fuckAngle];
    
    for ( int i = 0 ; i < maxTurtle ; i++){
        [turtle[i] manage:dt];
    }
    
    [penguin manage];
    
    [cannon manage];
    [self manageCannonBalls];
    [self manageShells];
    [self manageWrong];
    
    
    if(isTapWronglyAndDisableBtns){
        tapWronglyAndDisableBtnsTimer++;
        
        if(tapWronglyAndDisableBtnsTimer == 40){
            isTapWronglyAndDisableBtns = false;
        }
    }
}

-(void) tapButton:(int)_btnColor{
    if(isPrepareShooting){
        return;
    }
    
    [self updateGameLevel];
    
    if(_btnColor == shellColor[turtleIdx]){
        prepareShootingColor = _btnColor;
        isPrepareShooting = true;
        [cannon setCannonStatus:kCannonStatus_Shooting];
        counterForAchivement++;
    }else{
        [self tapWrongly];
    }
}

-(void) setCannonBallTexture:(int)_cannonColor{
    if(_cannonColor == kBtnColor_Brown){
        [s_Cannon_Ball[cannonBallIdx] setTextureRect:CGRectMake(504/textureRatioForFuckingIpad, 724/textureRatioForFuckingIpad, 60/textureRatioForFuckingIpad, 58/textureRatioForFuckingIpad)];
    }
    if(_cannonColor == kBtnColor_Red){
        [s_Cannon_Ball[cannonBallIdx] setTextureRect:CGRectMake(568/textureRatioForFuckingIpad, 724/textureRatioForFuckingIpad, 60/textureRatioForFuckingIpad, 58/textureRatioForFuckingIpad)];
    }
    if(_cannonColor == kBtnColor_Green){
        [s_Cannon_Ball[cannonBallIdx] setTextureRect:CGRectMake(646/textureRatioForFuckingIpad, 662/textureRatioForFuckingIpad, 60/textureRatioForFuckingIpad, 58/textureRatioForFuckingIpad)];
    }
    if(_cannonColor == kBtnColor_Blue){
        [s_Cannon_Ball[cannonBallIdx] setTextureRect:CGRectMake(646/textureRatioForFuckingIpad, 724/textureRatioForFuckingIpad, 60/textureRatioForFuckingIpad, 58/textureRatioForFuckingIpad)];
    }
}

-(void) shootCannon:(int)_cannonColor{
    cannonBall_isAni[cannonBallIdx] = true;
    cannonBall_Timer[cannonBallIdx] = 0;
    
    cannonBallIdx++;
    if(cannonBallIdx == maxCannonBall){
        cannonBallIdx = 0;
    }
}

- (void) dealloc
{
	printf("Mini 05 Dealloc\n");
    
    [turtle[0] release];
    [turtle[1] release];
    [turtle[2] release];
    [turtle[3] release];
    [turtle[4] release];
    [turtle[5] release];
    
    [cannon release];
    [penguin release];
    
	[super dealloc];
}

-(void) thisTurtleIsBombOutOffScreen:(int)_turtleIdx{
    //printf("thisTurtleIsBombOutOffScreen:%i\n",_turtleIdx);
    [self setShellColor:_turtleIdx];
    ranSecondShellRatio = arc4random() % 100;
    if(ranSecondShellRatio < SecondLevelShellAppearRatio){
        ranShellLevel = 2;
    }else{
        ranShellLevel = 1;
    }
    [turtle[_turtleIdx] setShellLevel:ranShellLevel];
}

-(void) rearrageShellPos{
   // printf("rearrageShellPos:%i %i %i %i %i %i %i %i\n",shellToFixIdx[0],shellToFixIdx[1],shellToFixIdx[2],shellToFixIdx[3],shellToFixIdx[4],shellToFixIdx[5],shellToFixIdx[6],shellToFixIdx[7]);
    
    /*static int firstTempFixIdx;
    firstTempFixIdx = shellToFixIdx[0];
    
    for(int j = 0 ; j < maxTurtle-1 ; j++){
        shellToFixIdx[j] = shellToFixIdx[j+1];
    }
    shellToFixIdx[maxTurtle - 1] = firstTempFixIdx;*/
    
    static int firstTempFixIdx;
    firstTempFixIdx = shellToFixIdx[maxTurtle - 1];
    
    for(int j = maxTurtle - 1 ; j >= 1  ; j--){
        shellToFixIdx[j] = shellToFixIdx[j-1];
    }
    shellToFixIdx[0] = firstTempFixIdx;
    
   // printf("END rearrageShellPos:%i %i %i %i %i %i %i %i\n",shellToFixIdx[0],shellToFixIdx[1],shellToFixIdx[2],shellToFixIdx[3],shellToFixIdx[4],shellToFixIdx[5],shellToFixIdx[6],shellToFixIdx[7]);
}


-(void) tapWrongly{
    printf("tapWrongly\n");
    if(currentCombo >= 5){
        printf("REDUCE\n");
        comboReduceSpeedAccum -= 0.006;
        if(comboReduceSpeedAccum < -0.01){
            comboReduceSpeedAccum = -0.01;
        }
        comboReduceSpeedAccumSpeed = -comboReduceSpeedAccum;
    }
    
    [uILayer lostCombo];
    
    isTapWronglyAndDisableBtns = true;
    tapWronglyAndDisableBtnsTimer = 0;
    
    isAniWrong = true;
    wrongTimer = 0;
    gameRoundFromBegin = 0;

    
}

-(void) cannonShootBall:(int)_fromId{
    [self setCannonBallTexture:prepareShootingColor];
    [self shootCannon:prepareShootingColor];
    [playLayer setToBombingCannon:[cannon x] y:[cannon y]];
    isPrepareShooting = false;
}

-(void) beforeLoseComboWhenComboRemainGoesToZero{
    printf("beforeLoseComboWhenComboRemainGoesToZero\n");
    if(currentCombo >= 5){
        printf("REDUCE\n");
        comboReduceSpeedAccum -= 0.006;
        if(comboReduceSpeedAccum < -0.01){
            comboReduceSpeedAccum = -0.01;
        }
        comboReduceSpeedAccumSpeed = -comboReduceSpeedAccum;
    }

}

@end
