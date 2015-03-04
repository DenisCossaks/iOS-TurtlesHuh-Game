//
//  Mini13.m
//  TurtlesHuh
//
//  Created by  on 2012/6/10.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "Mini13.h"
#import "GamePlayGlobal.h"
#import "Global.h"

@implementation Mini13

-(void) updateGameLevel{
    
    if(scriptShellApplying < 20){
        comoboReduceSpeed = comboReduceSpeedAccum + 0.004;
    }else if(scriptShellApplying < 60){
        comoboReduceSpeed = comboReduceSpeedAccum + 0.004;
    }else if(scriptShellApplying < 100){
        comoboReduceSpeed = comboReduceSpeedAccum + 0.004;
    }else if(scriptShellApplying < 150){
        comoboReduceSpeed = comboReduceSpeedAccum + 0.006;
    }else if(scriptShellApplying < 170){
        comoboReduceSpeed = comboReduceSpeedAccum + 0.008;
    }else if(scriptShellApplying < 200){
        comoboReduceSpeed = comboReduceSpeedAccum + 0.01;
    }else if(scriptShellApplying < 250){
        comoboReduceSpeed = comboReduceSpeedAccum + 0.015;
    }else if(scriptShellApplying < 300){
        comoboReduceSpeed = comboReduceSpeedAccum + 0.018;
    }else if(scriptShellApplying < 350){
        comoboReduceSpeed = comboReduceSpeedAccum + 0.02;
    }else if(scriptShellApplying < 400){
        comoboReduceSpeed = comboReduceSpeedAccum + 0.02;
    }else if(scriptShellApplying < 450){
        comoboReduceSpeed = comboReduceSpeedAccum + 0.02;
    }else if(scriptShellApplying < 500){
        comoboReduceSpeed = comboReduceSpeedAccum + 0.022;
    }else if(scriptShellApplying < 550){
        comoboReduceSpeed = comboReduceSpeedAccum + 0.024;
    }else if(scriptShellApplying < 600){
        comoboReduceSpeed = comboReduceSpeedAccum + 0.027;
    }else if(scriptShellApplying < 700){
        comoboReduceSpeed = comboReduceSpeedAccum + 0.03;
    }else if(scriptShellApplying < 800){
        comoboReduceSpeed = comboReduceSpeedAccum + 0.04;
    }else if(scriptShellApplying < 900){
        comoboReduceSpeed = comboReduceSpeedAccum + 0.05;
    }
    
    if(scriptShellApplying < 70){
        scriptRatio[0] = 70;
        scriptRatio[1] = 100;
        scriptRatio[2] = 100;
        scriptRatio[3] = 100;
    }else if(scriptShellApplying < 450){
        scriptRatio[0] = 50;
        scriptRatio[1] = 100;
        scriptRatio[2] = 100;
        scriptRatio[3] = 100;
    }else{
        scriptRatio[0] = 0;
        scriptRatio[1] = 0;
        scriptRatio[2] = 0;
        scriptRatio[3] = 100;
        
      //  printf("prev:%4.8f\n",comoboReduceSpeed);
        comoboReduceSpeed -= 0.01;
     //    printf("after:%4.8f\n",comoboReduceSpeed);
    }
    
    if(comboReduceSpeedAccum < 0){
        comboReduceSpeedAccum += comboReduceSpeedAccumSpeed/50;  //0.003/30
    }else{
        comboReduceSpeedAccum = 0;
    }
    
    if(comoboReduceSpeed < 0.005){
        comoboReduceSpeed = 0.005;
    }
    
    //normal
    //comoboReduceSpeed = 0.01;
    
    //hard
    //comoboReduceSpeed = 0.02;
    
    //very hard
    //comoboReduceSpeed = 0.023;
    
    
   /* scriptRatio[0] = 0;
    scriptRatio[1] = 0;
    scriptRatio[2] = 0;
    scriptRatio[3] = 100;
    comoboReduceSpeed = 0.015;*/
    
  //  printf("updateGameLevel:%i %i %4.8f %4.8f %4.8f\n",gameLevel,scriptShellApplying, comboReduceSpeedAccum, comoboReduceSpeed, comboReduceSpeedAccumSpeed);
    
}

-(void) manageBg{
    seaPosX[seaCurrentIdx] -= seaRatio * wholeBgOffsetXCal;
    seaOffsetXCal = seaRatio * wholeBgOffsetXCal;
    
   // [s_sea[seaCurrentIdx] setPosition:ccp(s_sea[seaCurrentIdx].position.x - seaOffsetXCal, 50)];
   // [s_sea[seaNextIdx] setPosition:ccp(s_sea[seaCurrentIdx].position.x + seaOffset , 50)];
    
    [s_sea[seaCurrentIdx] setPosition:ccp(0, 50)];
    [s_sea[seaNextIdx] setPosition:ccp(480 , 50)];
    
    if(isIphone5){
        [s_sea[seaCurrentIdx] setPosition:ccp(0, 50)];
        [s_sea[seaNextIdx] setPosition:ccp(568 , 50)];
    }
    if(isIpad){
        [s_sea[seaCurrentIdx] setPosition:ccp(0, -20)];
        [s_sea[seaNextIdx] setPosition:ccp(1024 , -20)];
    }
    
    if(s_sea[seaCurrentIdx].position.x < -520){
        if(seaCurrentIdx == 0){
            seaCurrentIdx = 1;
            seaNextIdx = 0;
        }else{
            seaCurrentIdx = 0;
            seaNextIdx = 1;
        }
    }
    
    
    bgPosX[bgCurrentIdx] -= bgRatio * wholeBgOffsetXCal;
    bgOffsetXCal = bgRatio * wholeBgOffsetXCal;
    
    //[s_bg2[bgCurrentIdx] setPosition:ccp(s_bg2[bgCurrentIdx].position.x - bgOffsetXCal, [UIScreen mainScreen].bounds.size.width/textureRatioForFuckingIpad)];
    //[s_bg2[bgNextIdx] setPosition:ccp(s_bg2[bgCurrentIdx].position.x + bgOffset , [UIScreen mainScreen].bounds.size.width/textureRatioForFuckingIpad)];
    
    [s_bg2[bgCurrentIdx] setPosition:ccp(0, [UIScreen mainScreen].bounds.size.width/2)];
    [s_bg2[bgNextIdx] setPosition:ccp(10000 , [UIScreen mainScreen].bounds.size.width/2)];
    
    
    //printf("wholeBgOffsetXCal:%4.8f %4.8f %4.8f\n",wholeBgOffsetXCal,s_bg2[bgCurrentIdx].position.x,s_bg2[bgNextIdx].position.x);
    
    float fuckRight;
    fuckRight = 480;
    if(isIpad){
        fuckRight = 1024;
    }
    if(isIphone5){
        fuckRight = 568;
        
    }
    
    if(s_bg2[bgCurrentIdx].position.x < -fuckRight){
        if(bgCurrentIdx == 0){
            bgCurrentIdx = 1;
            bgNextIdx = 0;
        }else{
            bgCurrentIdx = 0;
            bgNextIdx = 1;
        }
    }
}

-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
        
        //newestMomentHasAppearedTime = 4;
        
        maxTime = 40;
        timeRemain = maxTime;
        timeToBeGained = 4.0;
        
         maxTurtle = 10;
        penguinJump_maxStep = 4;
        penguinJump_currentStep = 2;
        isBeingAttack = false;
        goingToNextJump = false;
        
      /*  s_bg = [CCSprite spriteWithFile:@"mini_04_bg.png"];
        [s_bg setPosition:ccp(240,160)];
		[self addChild:s_bg];*/
        
		//wholeTurtleScaleFromSocurce = 0.435+0.15;
        wholeTurtleScaleFromSocurce = 0.435+0.1;
//        wholePenguinScaleFromSocurce = 0.5;
        wholePenguinScaleFromSocurce = 0.8;
        
        //static float shellStartX = 45+22;
        static float shellStartX = 70;
        shellOffsetX = 76;
        
        shellPosY = 95;
        
        if(isIpad){
            shellPosY = 95 * 768.0/320.0;
            shellOffsetX = 76 * 2;
        }
        
        for(int i = 0 ; i < maxTurtle ; i++){
            shellPosX[i] = shellStartX + shellOffsetX * i;
        }
    
        isPenguinJumping = false;
        
        [self initCharacters];
        [self initScript];
        [self initExtraGraphics];
        [self initBubbles];
        [self initPowerBar];
        [self updatePowerBar];
        
        maxBubbles = 15;
        bubbleAppearedTimer = 999;
    
        
        //deletate later
        // gameLevel = 4;
        numberTapToNextRound = 0;
        remainTapToNextRound = 0;
        
        gameLevel = 0;
        [self updateGameLevel];
        
        [self initControlLayer];
        
    }
    
	return self;
}
-(void) initControlLayer{
    controlLayer = [ControlLayer node];
	[self addChild:controlLayer z:kDeapth_Btns];
    [controlLayer setDelegate:self];
}

-(void) initCharacters{
    
    for(int i = 0 ; i < maxTurtle ; i++){
        turtle[i] = [[Turtle alloc] init];
        [turtle[i] setStatus:kTurtleAniStatus_Normal_In];
        [turtle[i] setX:99999];
        [turtle[i] setDelegate:self];
        [turtle[i] setIdNumber:i];
    }

  
    for(int i = 0 ; i < maxTurtle ; i++){
        [turtle[i] setX:shellPosX[i]];
        [turtle[i] setY:shellPosY];
    }
    
      
    //PEGNUin
    currentStandShell = 0;
    
    penguin = [[Penguin alloc] init];
    [penguin setX:shellPosX[currentStandShell]];
    [penguin setY:shellPosY+15];
    [penguin setStatus:kPenguinAniStatus_Idle];
    //printf("penupossss:%4.8f %4.8f\n",[penguin x], shellPosY);

    [penguin setDelegate:self];

}

-(void) initExtraGraphics{
  //  s_sea[0] = [CCSprite spriteWithTexture:ss_Extra.texture rect:CGRectMake(0/textureRatioForFuckingIpad,128/textureRatioForFuckingIpad,980/textureRatioForFuckingIpad,202/textureRatioForFuckingIpad)];
   // s_sea[1] = [CCSprite spriteWithTexture:ss_Extra.texture rect:CGRectMake(0/textureRatioForFuckingIpad,128/textureRatioForFuckingIpad,980/textureRatioForFuckingIpad,202/textureRatioForFuckingIpad)];
    
    if(isIpad){
        s_sea[0] = [CCSprite spriteWithTexture:ss_Extra.texture rect:CGRectMake(0,128,1024,266)];
        s_sea[1] = [CCSprite spriteWithTexture:ss_Extra.texture rect:CGRectMake(0,128,1024,266)];
    }else{
        s_sea[0] = [CCSprite spriteWithTexture:ss_Extra.texture rect:CGRectMake(0/textureRatioForFuckingIpad,128/textureRatioForFuckingIpad,1060/textureRatioForFuckingIpad,202/textureRatioForFuckingIpad)];
        s_sea[1] = [CCSprite spriteWithTexture:ss_Extra.texture rect:CGRectMake(0/textureRatioForFuckingIpad,128/textureRatioForFuckingIpad,1060/textureRatioForFuckingIpad,202/textureRatioForFuckingIpad)];
    }

    
    [s_Left setScaleX:-1];
    [s_LeftLeft setScaleX:-1];
    
    [ss_Extra addChild:s_sea[0]];
    [ss_Extra addChild:s_sea[1]];
     
    seaCurrentIdx = 0;
    seaNextIdx = 1;
    [s_sea[0] setAnchorPoint:ccp(0,0.5)];
    [s_sea[1] setAnchorPoint:ccp(0,0.5)];
    
    
    if(isIpad){
        [s_sea[0] setAnchorPoint:ccp(0,0)];
        [s_sea[1] setAnchorPoint:ccp(0,0)];
    }else{
        [s_sea[0] setAnchorPoint:ccp(0,0.5)];
        [s_sea[1] setAnchorPoint:ccp(0,0.5)];
    }
    
    seaOffset = 980/textureRatioForFuckingIpad;
    seaRatio = 1.0;    
    
    seaPosX[0] = 0;
    
    
    
    
    s_bg2[0] = [CCSprite spriteWithFile:@"mini_04_bg.png"];
    s_bg2[1] = [CCSprite spriteWithFile:@"mini_04_bg.png"];
    
    [self addChild:s_bg2[0]];
    [self addChild:s_bg2[1]];
    
    bgCurrentIdx = 0;
    bgNextIdx = 1;
    [s_bg2[0] setAnchorPoint:ccp(0,0.5)];
    [s_bg2[1] setAnchorPoint:ccp(0,0.5)];
    
    
    bgOffset = 960/textureRatioForFuckingIpad - 2;
    bgRatio = 0.05;    
    
    bgPosX[0] = 0;
    
}

-(void) initBubbles{
    
    for(int i = 0 ; i < maxBubbles ; i++){
        s_Bubble[i] = [CCSprite spriteWithTexture:ss_Extra.texture rect:CGRectMake(304/textureRatioForFuckingIpad,0/textureRatioForFuckingIpad,31/textureRatioForFuckingIpad,31/textureRatioForFuckingIpad)];
        
        [ss_Extra addChild:s_Bubble[i]];
        
        [s_Bubble[i] setPosition:ccp(10000,10000)];
    }
}

- (void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    [super ccTouchesBegan:touches withEvent:event];

}

-(void) manageBubbles{
    if(bubbleAppearedTimer > 40){
        if(arc4random() % 70 == 0){
            static int bubbleAppearX;
            bubbleAppearX = arc4random()%480;
            
            static int bubbleRanVy;
            bubbleRanVy = arc4random()%100;
            bubble_vy[currentBubbleAppear] = 0.2 + 0.6 * (float)bubbleRanVy/100.0;
            
            bubble_x[currentBubbleAppear] = bubbleAppearX;
            bubble_y[currentBubbleAppear] = -20;
            bubble_Opacity[currentBubbleAppear] = 255;
            bubble_Timer[currentBubbleAppear] = 0;
            bubble_isAni[currentBubbleAppear] = true;
            
            currentBubbleAppear++;
            if(currentBubbleAppear >= 15){
                currentBubbleAppear = 0;
            }
            
            static int bubbleRanScale;
            bubbleRanScale = arc4random()%100;
            [s_Bubble[currentBubbleAppear] setScale:0.3+0.55*(float)bubbleRanScale/100];
        }
    }
    
    bubbleAppearedTimer++;
    
    for(int i = 0 ; i < maxBubbles ; i++){
        if(bubble_isAni[i]){
            [s_Bubble[i] setPosition:ccp(bubble_x[i], bubble_y[i])];
            [s_Bubble[i] setOpacity:bubble_Opacity[i]];
            
            bubble_y[i] += bubble_vy[i];
            
            if(bubble_y[i] < 20){
                bubble_Opacity[i] -= 0;
            }else  if(bubble_y[i] < 50){
                bubble_Opacity[i] -= 2;
            }else  if(bubble_y[i] < 75){
                bubble_Opacity[i] -= 4;
            }else  if(bubble_y[i] < 1000){
                bubble_Opacity[i] -= 6;
            }
            
            if(bubble_Opacity[i] < 0){
                bubble_Opacity[i] = 0;
                
                bubble_isAni[i] = false;
                
                [s_Bubble[i] setPosition:ccp(10000, 10000)];
            }
            
        }
    }
    
}


-(void) setExternalValues:(float)_offsetFinalX{
    return;
}

-(void) btnIsTappedInControlLayer:(int)_btnIdx{
    //printf("btnIsTappedInControlLayer:%i\n",_btnIdx);
    if(_btnIdx == 0){
        
        penguinJump_currentStep--;
        if(penguinJump_currentStep < 1){
            penguinJump_currentStep = penguinJump_maxStep - 1;
        }
        [self updatePowerBar];
    }
    if(_btnIdx == 1){
            
        penguinJump_currentStep++;
        if(penguinJump_currentStep == penguinJump_maxStep){
            penguinJump_currentStep = 1;
        }
        [self updatePowerBar];
        
       // [turtle[2] setYellowHurt];
    }
    
    if(_btnIdx == 2){
        if(isTapWronglyAndDisableBtns){
            return;
        }
        
        [self setPenguinJumping];
    }
}

-(void) btnIsReleasedInControlLayer:(int)_btnIdx{

}

-(void) manage:(ccTime) dt{
    
    wholeBgOffsetXCal = 0;
    
    [self manageMini04Type:dt];

    
    [penguin manage];
    [self managePenguinJumping];
    [self manageBubbles];
    [self managePenguinDieing];
    [self manageResetPenguin];
    
    [self runTurtleAI];
    
   // printf("penupos:%4.8f %4.8f\n",[penguin x], [penguin y]);
    // printf("currentTurtleOnScreen:%i %i\n",currentTurtleOnScreen,maxTurtleOnScreen);
    
    for ( int i = 0 ; i < maxTurtle ; i++){
        [turtle[i] manage:dt];
        [turtle[i] manageYellowHurt];
    }
    
    [self manageBg];
    [self manageJumpNotice];

}


-(void)tapTurtle{
    return;
 /*   if(!thisTurtleIsBombShell[currentStandShell]){
        [turtle[currentStandShell] tap];
        thisTurtleHasBeenFuckedByPenguin[currentStandShell] = true;
    }else{
        [self bombTurtleByThisBombShell:currentStandShell];
    }*/
}

-(void) tapTurtleDelay{
    static int detectWHichTurtleIsCurentStanding;
    for(int i = 0 ; i < maxTurtle ; i++){
       // printf("A:%i %4.8f %4.8f\n",i,[turtle[i] x],shellPosX[0]);
        
        if(isIpad){
            if([turtle[i] x] - shellPosX[0] < 20 && [turtle[i] x] - shellPosX[0] > -20){
                detectWHichTurtleIsCurentStanding = i;
                //  printf("detectWHichTurtleIsCurentStanding:%i\n",i);
            }
        }else{
            if([turtle[i] x] - shellPosX[0] < 5 && [turtle[i] x] - shellPosX[0] > -5){
                detectWHichTurtleIsCurentStanding = i;
                //  printf("detectWHichTurtleIsCurentStanding:%i\n",i);
            }
        }
        
    }
    
    if(!thisTurtleIsBombShell[detectWHichTurtleIsCurentStanding]){
        [turtle[detectWHichTurtleIsCurentStanding] tap];
        thisTurtleHasBeenFuckedByPenguin[detectWHichTurtleIsCurentStanding] = true;
        gameRound++;
        counterForAchivement++;
    }else{
        [self bombTurtleByThisBombShell:detectWHichTurtleIsCurentStanding];
    }
    
    
    if(gameRound == 0){
        gameRound = 1;
    }
    
    [self updateGameLevel];
}

-(void) initScript{
    acutalShellGenIdx = 0;
    
    thisTurtleHasBeenFuckedByPenguin[0] = false;
    thisTurtleIsBombShell[0] = true;
    actualShellIdx[0] = acutalShellGenIdx;
    virtualShellIdx[0] = 0;
    acutalShellGenIdx++;
    lastShellIdx = maxTurtle - 1;
    
    for(int i = 1 ; i < maxTurtle ; i++){
        thisTurtleIsBombShell[i] = true;
        thisTurtleHasBeenFuckedByPenguin[i] = false;
        [turtle[i] changeToBombShell];
        actualShellIdx[i] = acutalShellGenIdx;
        virtualShellIdx[i] = i;
        acutalShellGenIdx++;
    }
    
    maxScriptShell = 20;
    for(int i = 0 ; i < maxScriptShell ; i++){
        scriptShellApply[i] = -1;
    }
    
    
    
    scriptShellDetectingIdx = 1;
    [self giveNextMoment222:2];
     scriptShellGenIdx++;

    
    scriptShellDetectingIdx = 2;
    [self giveNextMoment222:4];
     scriptShellGenIdx++;
    
    scriptShellDetectingIdx = 3;
    [self giveNextMoment222:7];
     scriptShellGenIdx++;
    
    scriptShellDetectingIdx = 4;
    [self giveNextMoment222:8];
    scriptShellGenIdx++;
    
    
    scriptShellDetectingIdx = 5;
    [self giveNextMoment222:9];
    scriptShellGenIdx++;
    
    scriptShellApplying = 9;
    scriptPreApply = 1;
}

-(void) genNextScript{
   // printf("genNextScript\n");
    
    while (scriptShellApplying -actualShellIdx[currentStandShell] < 20) {
        static int ranNextShell;
        ranNextShell = arc4random()%3;
        ranNextShell += 1;
        
        static int scriptRanRatio;
        scriptRanRatio = arc4random() % 100;
        
        if(scriptRanRatio < scriptRatio[0]){
            ranNextShell = scriptPreApply;
        }else  if(scriptRanRatio < scriptRatio[1]){
            static int calNextApply;
            calNextApply = scriptPreApply + 1;
            if(calNextApply == 4){
                calNextApply = 1;
            }
            ranNextShell = calNextApply;
        }else  if(scriptRanRatio < scriptRatio[2]){
            static int calNextApply;
            calNextApply = scriptPreApply + 2;
            if(calNextApply >= 4){
                calNextApply -= 3;
            }
            ranNextShell = calNextApply;
        }
        
        //printf("ranNextShell:%i\n",ranNextShell);
        
        /*if(scriptShellApplying == 9){
            scriptShellApplying += 1;
        }else if(scriptShellApplying == 10){
            scriptShellApplying += 2;
        }else if(scriptShellApplying == 12){
            scriptShellApplying += 2;
        }else if(scriptShellApplying == 14){
            scriptShellApplying += 3;
        }else if(scriptShellApplying == 17){
            scriptShellApplying += 1;
        }else if(scriptShellApplying == 18){
            scriptShellApplying += 1;
        }else if(scriptShellApplying == 19){
            scriptShellApplying += 2;
        }else if(scriptShellApplying == 21){
            scriptShellApplying += 2;
        }else if(scriptShellApplying == 23){
            scriptShellApplying += 3;
        }else if(scriptShellApplying == 25){
            scriptShellApplying += 3;
        }else if(scriptShellApplying == 26){
            scriptShellApplying += 1;
        }else if(scriptShellApplying == 27){
            scriptShellApplying += 1;
        }else if(scriptShellApplying == 28){
            scriptShellApplying += 1;
        }else{
            scriptShellApplying += ranNextShell;
        }*/
        
        scriptShellApplying += ranNextShell;
        scriptPreApply = ranNextShell;
        
        scriptShellApply[scriptShellGenIdx] = scriptShellApplying;
        
        //printf("K:%i %i\n",scriptShellGenIdx,scriptShellApplying);
        
        scriptShellGenIdx++;
        if(scriptShellGenIdx == maxScriptShell){
            scriptShellGenIdx = 0;
        }
    }
    
    static int futureShellPos;
    futureShellPos = 6;
    for(int i = 0 ; i < maxTurtle ; i++){
        if([turtle[i] x] < -20){
           
            
            virtualShellIdx[i] = futureShellPos;
            actualShellIdx[i] = acutalShellGenIdx;
            thisTurtleHasBeenFuckedByPenguin[i] = false;
            
            [turtle[i] setX:[turtle[lastShellIdx] x] + shellOffsetX];
            
             //printf("reGEN:%i last:%i x:%4.8f  -- :%4.8f %4.8f\n",i,lastShellIdx,[turtle[i] x],shellPosX[lastShellIdx],shellOffsetX);
            // printf("TreGEN last:%i %i %i\n",acutalShellGenIdx,scriptShellDetectingIdx, scriptShellApply[scriptShellDetectingIdx]);
            
            lastShellIdx = i;
            
            acutalShellGenIdx++;
            futureShellPos++;
            
            if(actualShellIdx[i] == scriptShellApply[scriptShellDetectingIdx]){
                [self giveNextMoment222:i];
                thisTurtleIsBombShell[i] = false;
                
                scriptShellDetectingIdx++;
                if(scriptShellDetectingIdx == maxScriptShell){
                    scriptShellDetectingIdx = 0;
                }
                
            }else{
                [turtle[i] setStatus:kTurtleAniStatus_Normal_In];
                [turtle[i] changeToBombShell];
                thisTurtleIsBombShell[i] = true;
            }
        }
    }
}

-(void) bombTurtleByThisBombShell:(int)_shellIdx{
    [playLayer setToBombing:[turtle[_shellIdx] x] turtleY:[turtle[_shellIdx] y]];
    bombombombIdx = _shellIdx;
    [self bombombomb];
}


-(void) runTurtleAI{
    for(int i = 0 ; i < maxTurtle ; i++){
        if([turtle[i] status] != kTurtleAniStatus_Bombing && !thisTurtleHasBeenFuckedByPenguin[i]){
            if(gameRound == 0 && i == 0){
                
            }else{
                [turtle[i] setStatus:kTurtleAniStatus_Idle];
            }
        }
        
        
        /*//if([turtle[i] status] == kTurtleAniStatus_Normal_Out){
            if(arc4random() % 50 == 0){
                if(arc4random() % 10 == 0){
                    
                }else{
                    if(gameRound == 0 && i == 0){
                    
                    }else{
                        [turtle[i] setStatus:kTurtleAniStatus_Idle];
                    }
                    
                }
            } 
      // }*/
        
    }
    
}


-(void) thisMomentOverTime:(int)_momentIdx{

}


-(void) giveNextMoment{
    return;
}

-(void) getScript{
    nextMomentAppearTime = 400000;
}




-(void) turtleBombed:(int)_momentIdx{
    [super turtleBombed:_momentIdx];
    
    //remainTapToNextRound--;
    
}

-(void) giveNextMoment222:(int)_whichShell{
    //printf("giveNextMoment222:%i\n",_whichShell);
    [turtle[_whichShell] setStatus:kTurtleAniStatus_Out];
    [turtle[_whichShell] setShellLevel:0];
    thisTurtleIsBombShell[_whichShell] = false;
}

-(void) setPenguinJumping{
    
    if(isPenguinJumping){
        goingToNextJump_whichPower = penguinJump_currentStep;
        [penguin setNext:kPenguinJump_jumpToDYNAMICTurtleShell isFacingRight:true];
        return;
    }
    
    if(!goingToNextJump){
        penguinJump_finalStep = penguinJump_currentStep;
    }else{
        penguinJump_finalStep = goingToNextJump_whichPower;
    }
    
    
    penguinJumpFinalX = [penguin x];
    penguinJumpFinalY = [penguin y];
     
    penguin_DynmaicJumpY = 25 * penguinJump_finalStep * 2/textureRatioForFuckingIpad;
    //printf("penguin_DynmaicJumpY:%4.8f\n",penguin_DynmaicJumpY);
    [penguin setJump:kPenguinJump_jumpToDYNAMICTurtleShell];
    //[penguin setJumpWithGravity];
    
    
    if(!goingToNextJump){
        currentStandShell += penguinJump_currentStep;
    }else{
        currentStandShell += goingToNextJump_whichPower;
    }
    
    if(currentStandShell >= maxTurtle){
        currentStandShell -= maxTurtle;
    }
    
    isPenguinJumping = true;
    isPenguinJumpingTimer = 0;
    wholeBgOffsetX = 0;
    
    for(int i = 0 ; i < maxTurtle ; i++){
        turtleOriX[i] = [turtle[i] x];
        turtleOriY[i] = [turtle[i] y];
       // printf("jump orxi:%i :%4.8f\n",i,turtleOriX[i]);
    }
    
  //  penguinJump_howmanyStep = 9 * penguinJump_finalStep;
    penguinJump_howmanyStep = 9;
    penguinJump_jumpY = 0;
    penguinJump_oriY = [penguin y];
}

-(void) gotoNextJump{
    printf("gotoNextJump\n");
    goingToNextJump = true;
    //[self setPenguinJumping];
}

-(void) managePenguinJumping{
    if(isPenguinJumping){
        wholeBgOffsetXCal = (76.0/9.0) * penguinJump_finalStep;
        
        if(isIpad){
            wholeBgOffsetX -= wholeBgOffsetXCal * 2;
        }else{
            wholeBgOffsetX -= wholeBgOffsetXCal;
        }
        
        
        for(int i = 0 ; i < maxTurtle ; i++){
            [turtle[i] setX:turtleOriX[i] + wholeBgOffsetX];
            //printf("%i: jump:%i %4.8f\n",isPenguinJumpingTimer, i, [turtle[i] x]);
        }
    
        isPenguinJumpingTimer++;
        if(isPenguinJumpingTimer == penguinJump_howmanyStep){
            isPenguinJumping = false;
            for(int i = 0 ; i < maxTurtle ; i++){
                
                if(isIpad){
                    if([turtle[i] x] - shellPosX[i] < 20 && [turtle[i] x] - shellPosX[i] > -20){
                        [turtle[i] setPosition:ccp(shellPosX[i], shellPosY)];
                    }
                }else{
                    if([turtle[i] x] - shellPosX[i] < 5 && [turtle[i] x] - shellPosX[i] > -5){
                        [turtle[i] setPosition:ccp(shellPosX[i], shellPosY)];
                    }
                }
                
                
            }
            
            [self updateGameLevel];
            [self genNextScript];
            [penguin setY:penguinJump_oriY];
            [self tapTurtleDelay];
            
            if(goingToNextJump){
                [self setPenguinJumping];
                goingToNextJump = false;
            }
        }
    }
}


-(void) initPowerBar{
    //INIT POWER BAR
    s_comboBar_Icon = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(2000/textureRatioForFuckingIpad, 260/textureRatioForFuckingIpad, 32/textureRatioForFuckingIpad, 30/textureRatioForFuckingIpad)];
    s_comboBar_Bar = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1298/textureRatioForFuckingIpad, 320/textureRatioForFuckingIpad, 136/textureRatioForFuckingIpad, 22/textureRatioForFuckingIpad)];
    s_comboBar_BarLife = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1186/textureRatioForFuckingIpad, 320/textureRatioForFuckingIpad, 109/textureRatioForFuckingIpad, 22/textureRatioForFuckingIpad)];
    s_comboBar_BarLifeLeft = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1170/textureRatioForFuckingIpad, 320/textureRatioForFuckingIpad, 14/textureRatioForFuckingIpad, 22/textureRatioForFuckingIpad)];
    
    [s_comboBar_Bar setRotation:-90];
    [s_comboBar_BarLife setRotation:-90];
    [s_comboBar_BarLifeLeft setRotation:-90];
    
    [s_comboBar_Bar setAnchorPoint:ccp(0,0.5)];
    [s_comboBar_BarLife setAnchorPoint:ccp(0,0.5)];
    [s_comboBar_BarLifeLeft setAnchorPoint:ccp(1,0.5)];
    
    [ss_Character addChild:s_comboBar_Bar z:kDeapth_Top];
    [ss_Character addChild:s_comboBar_BarLife z:kDeapth_Top];
    [ss_Character addChild:s_comboBar_BarLifeLeft z:kDeapth_Top];
    [ss_Character addChild:s_comboBar_Icon z:kDeapth_Top];
    
    
    
    comboBar_posX = 40;
    comboBar_posY = 125;
    
    if(isIpad){
        comboBar_posX = 20;
        comboBar_posY = 65;
    }
    
    comboBar_BarLifeLength = 109/textureRatioForFuckingIpad;
    comboRemainPercentage = 0.0;
    comboRemain = 0.0;
    // [s_comboBar_BarLife setScaleX:comboRemainPercentage];
    
    [s_comboBar_Bar setPosition:ccp(10000,100000)];
    [s_comboBar_BarLife setPosition:ccp(10000,100000)];
    [s_comboBar_BarLifeLeft setPosition:ccp(10000,100000)];
    [s_comboBar_Icon setPosition:ccp(10000,100000)];
    
    [s_comboBar_BarLife setScaleX:0];
    
    s_jumpTurtle = [CCSprite spriteWithTexture:ss_Extra.texture rect:CGRectMake(650/textureRatioForFuckingIpad,0/textureRatioForFuckingIpad,152/textureRatioForFuckingIpad,20/textureRatioForFuckingIpad)];
    s_jumpNotice = [CCSprite spriteWithTexture:ss_Extra.texture rect:CGRectMake(810/textureRatioForFuckingIpad,0/textureRatioForFuckingIpad,84/textureRatioForFuckingIpad,48/textureRatioForFuckingIpad)];
    
    [s_jumpNotice setAnchorPoint:ccp(0,0)];
    [s_jumpTurtle setAnchorPoint:ccp(0,0)];
    
    [s_jumpTurtle setPosition:ccp(120-10,10)];
    [s_jumpNotice setPosition:ccp(127-10,20)];
    
    if(isIpad){
        [s_jumpTurtle setPosition:ccp(110 * 1024.0/480.0, 10 * 768.0/320.0)];
        [s_jumpNotice setPosition:ccp(117 * 1024.0/480, 20 * 768.0/320.0)];
    }
    
     [ss_Extra addChild:s_jumpTurtle];
     [ss_Extra addChild:s_jumpNotice];
    jumpNoticeOpacity = 255;
    jumpNoticeDisappearing = false;
    
}

-(void) updatePowerBar{

    comboRemainPercentage = ((float)penguinJump_currentStep-1.0)/((float)penguinJump_maxStep-2.0);
    //printf("comboRemainPercentage:%4.8f %i %i\n",comboRemainPercentage,penguinJump_currentStep,penguinJump_maxStep);
    
    [s_comboBar_Icon setPosition:ccp(comboBar_posX , comboBar_posY +  + comboBar_BarLifeLength * comboRemainPercentage)];
    [s_comboBar_BarLifeLeft setPosition:ccp(comboBar_posX , comboBar_posY)];
    [s_comboBar_Bar setPosition:ccp(comboBar_posX , comboBar_posY-7)];
    [s_comboBar_BarLife setPosition:ccp(comboBar_posX , comboBar_posY)];
    
    [s_comboBar_BarLife setScaleX:comboRemainPercentage];
    
    if(penguinJump_currentStep == 1){
        [s_jumpNotice setTextureRect:CGRectMake(810/textureRatioForFuckingIpad,52/textureRatioForFuckingIpad,50/textureRatioForFuckingIpad,28/textureRatioForFuckingIpad)];
    }
    if(penguinJump_currentStep == 2){
        [s_jumpNotice setTextureRect:CGRectMake(810/textureRatioForFuckingIpad,0/textureRatioForFuckingIpad,94/textureRatioForFuckingIpad,48/textureRatioForFuckingIpad)];
    }
    if(penguinJump_currentStep == 3){
        [s_jumpNotice setTextureRect:CGRectMake(650/textureRatioForFuckingIpad,30/textureRatioForFuckingIpad,130/textureRatioForFuckingIpad,64/textureRatioForFuckingIpad)];
    }
    
}

-(void) manageJumpNotice{
    if(jumpNoticeDisappearing){
        jumpNoticeOpacity -= 1.5;
        if(jumpNoticeOpacity < 0){
            jumpNoticeOpacity = 0;
        }
        
        [s_jumpNotice setOpacity:jumpNoticeOpacity];
        [s_jumpTurtle setOpacity:jumpNoticeOpacity];
    }
}

-(void) dealloc
{
	printf("Mini 11 Dealloc\n");
    
    [penguin release];
    
    for(int i = 0 ; i < maxTurtle ; i++){
        [turtle[i] release];
    }
    
    
	[super dealloc];
}


-(void) bombombomb{
    [uILayer lostCombo];
    
    isTapWronglyAndDisableBtns = true;
    
    isBeingAttack  = true;
    beingAttackTimer = 200;
    
    [playLayer setToBombingGameoverWithPos:[turtle[bombombombIdx] x] y:90];
    [penguin bombOutOffScreenDirection:kBombOutOffScreenDirection_Right_Penguin];
    [penguin setToBombing];
    
    [musicController playThisSound:kSound_TurtleExplode03 isLoop:NO gain:1.0];
    
    
    if(currentCombo >= 5){
      //  printf("REDUCE from bombombomb\n");
        comboReduceSpeedAccum -= 0.005;
        if(comboReduceSpeedAccum < -0.01){
            comboReduceSpeedAccum = -0.01;
        }
        comboReduceSpeedAccumSpeed = -comboReduceSpeedAccum;
    }
}

-(void) managePenguinDieing{
    if(isBeingAttack){
        beingAttackTimer--;
        if(beingAttackTimer == 0){
            isBeingAttack = false;
        }
        
        if(beingAttackTimer == 130){
            [self resetPenguin];
            [turtle[bombombombIdx] changeToNormalShell];
            [playLayer setToBombing:[turtle[bombombombIdx] x] turtleY:[turtle[bombombombIdx] y]];
            currentCombo = 0;
        }
    }
}

-(void) resetPenguin{
  //  printf("resetPenguin\n");
    
    resetPenguinTimer = 0;
    restPenguinOnOffOpacityTimer = 0;
    resetPenguinIsOnOpacity = true;
    isResetPenguin = true;
    
    [penguin setX:shellPosX[0]];
    [penguin setY:shellPosY+15];
    
    [penguin setStatus:kPenguinAniStatus_Idle];
    
    isTapWronglyAndDisableBtns = false;
}

-(void) manageResetPenguin{
    if(!isResetPenguin){
        return;
    }
    
    //return;
    
    // printf("manageResetPenguin:%i\n",resetPenguinTimer);
    
    if(resetPenguinTimer < 10){
        restPenguinOnOffOpacityInterval = 6;
    }else if(resetPenguinTimer < 20){
        restPenguinOnOffOpacityInterval = 4;
    }if(resetPenguinTimer < 30){
        restPenguinOnOffOpacityInterval = 3;
    }
    
    restPenguinOnOffOpacityTimer++;
    if(restPenguinOnOffOpacityTimer > restPenguinOnOffOpacityInterval){
        restPenguinOnOffOpacityTimer = 0;
        resetPenguinIsOnOpacity = !resetPenguinIsOnOpacity;
    }
    
    if(resetPenguinIsOnOpacity){
        [penguin setOpacity:255];
    }else{
        [penguin setOpacity:0];
    }
    
    if(resetPenguinTimer == 30){
        isResetPenguin = false;
        [penguin setOpacity:255];
    }
    
    resetPenguinTimer++;
}


-(void) beforeLoseComboWhenComboRemainGoesToZero{
    //printf("beforeLoseComboWhenComboRemainGoesToZero\n");
    if(currentCombo >= 5){
        printf("REDUCE from beforeLoseComboWhenComboRemainGoesToZero\n");
        comboReduceSpeedAccum -= 0.006;
        if(comboReduceSpeedAccum < -0.015){
            comboReduceSpeedAccum = -0.015;
        }
        comboReduceSpeedAccumSpeed = -comboReduceSpeedAccum;
    }
    
}

-(void) fuckfuck{
    jumpNoticeDisappearing = true;
}


@end
