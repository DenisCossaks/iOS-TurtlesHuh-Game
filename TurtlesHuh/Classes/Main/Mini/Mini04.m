//
//  Mini02.m
//  TurtlesHuh
//
//  Created by  on 2012/4/29.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "Mini04.h"
#import "GamePlayGlobal.h"
#import "Global.h"

@implementation Mini04

-(void) reInitColorComboLimit{
    
    // printf("reInitColorComboLimit:%i\n",gameLevel);
    
    if(gameLevel == 0){
        comboColorLimit[0] = 0;
        comboColorLimit[1] = 10;
        comboColorLimit[2] = 20;
        comboColorLimit[3] = 30;
        comboColorLimit[4] = 40;
        comboColorLimit[5] = 50;
        comboColorLimit[6] = 60;
        comboColorLimit[7] = 70;
        comboColorLimit[8] = 80;
        comboColorLimit[9] = 90;
        comboColorLimit[10] = 100;
        timeToBeGained = 5.0;
    }
    
    if(gameLevel == 1){
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
         timeToBeGained = 4.5;
    }
    
    if(gameLevel == 2){
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
         timeToBeGained = 4.5;
    }
}

-(void) updateGameLevel{
    //------------------GAME LEVEL MAX = 7-----------------------------//
    
    if(gameRound < 10){
        gameLevel = 0;
    }else if(gameRound < 50){
        gameLevel = 1;
    }else if(gameRound < 80){
        gameLevel = 2;
    }else if(gameRound < 100){
        gameLevel = 3;
    }else if(gameRound < 135){
        gameLevel = 4;
    }else if(gameRound < 170){
        gameLevel = 5;
    }else if(gameRound < 200){
        gameLevel = 6;
    }else if(gameRound < 10000){
        gameLevel = 7;
    }
    
    if(gameRound < 20){
        comoboReduceSpeed = comboReduceSpeedAccum + 0.004;
    }else if(gameRound < 60){
        comoboReduceSpeed = comboReduceSpeedAccum + 0.004;
    }else if(gameRound < 100){
        comoboReduceSpeed = comboReduceSpeedAccum + 0.004;
    }else if(gameRound < 150){
        comoboReduceSpeed = comboReduceSpeedAccum + 0.004;
    }else if(gameRound < 170){
        comoboReduceSpeed = comboReduceSpeedAccum + 0.005;
    }else if(gameRound < 200){
        comoboReduceSpeed = comboReduceSpeedAccum + 0.006;
    }else if(gameRound < 250){
        comoboReduceSpeed = comboReduceSpeedAccum + 0.008;
    }else if(gameRound < 300){
        comoboReduceSpeed = comboReduceSpeedAccum + 0.01;
    }else if(gameRound < 350){
        comoboReduceSpeed = comboReduceSpeedAccum + 0.012;
    }else if(gameRound < 400){
        comoboReduceSpeed = comboReduceSpeedAccum + 0.015;
    }else if(gameRound < 450){
        comoboReduceSpeed = comboReduceSpeedAccum + 0.02;
    }else if(gameRound < 500){
        comoboReduceSpeed = comboReduceSpeedAccum + 0.03;
    }
    
    if(comboReduceSpeedAccum < 0){
        comboReduceSpeedAccum += comboReduceSpeedAccumSpeed/50;  //0.003/30
    }else{
        comboReduceSpeedAccum = 0;
    }
    
    if(comoboReduceSpeed < 0.005){
        comoboReduceSpeed = 0.005;
    }
    
    //gameLevel = 6;
    
    [self reInitColorComboLimit];
    
    //printf("updateGameLevel:%i %i %i %4.8f %4.8f %4.8f\n",gameLevel,gameRound, gameRoundFromBegin, comboReduceSpeedAccum, comoboReduceSpeed, comboReduceSpeedAccumSpeed);
    
    //------------------GAME LEVEL MAX = 7-----------------------------//
}



-(void) restart{
    /*for(int i = 0 ; i < 6 ; i++){    
     [turtle[i] setStatus:kTurtleAniStatus_Normal_In];
     //hasNoticedOverTime[i] = true;
     momentRunTime[i] = -9999;
     }*/
    for(int i = 0 ; i < maxMoment ; i++){
        if(momentRunTime[i] > 0){
            [turtle[momentTarget[i]] setStatus:kTurtleAniStatus_In];
            momentRunTime[i] = -9999;
        }
    }
    
    numberTapToNextRound = 0;
    remainTapToNextRound = 0;
    
    recentMomentIdx = 0;
    
    [super restart];
}

-(void) initControlLayer{
    controlLayer = [ControlLayer node];
	[self addChild:controlLayer z:kDeapth_Btns];
    [controlLayer setDelegate:self];
}

-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
        
        //newestMomentHasAppearedTime = 4;
        
        maxTime = 60;
        timeRemain = maxTime;
        
        
        
        s_bg = [CCSprite spriteWithFile:@"mini_04_bg.png"];
        [s_bg setPosition:ccp([UIScreen mainScreen].bounds.size.height/2, [UIScreen mainScreen].bounds.size.width/2)];
		[self addChild:s_bg];
        
        /*if(isIphone5){
            CCSprite* s_temp_bg = [CCSprite spriteWithFile:@"mini_04_bg.png"];
            [s_temp_bg setPosition:ccp(479,160)];
            [s_temp_bg setAnchorPoint:ccp(1,0.5)];
            [s_temp_bg setScaleX:-1];
            [self addChild:s_temp_bg];
        }*/
        
		wholeTurtleScaleFromSocurce = 0.435;
//        wholePenguinScaleFromSocurce = 0.5;
        wholePenguinScaleFromSocurce = 0.8;
        
        //static float shellStartX = 45+22;
         float shellStartX = 45;
         float shellOffsetX = 76;
        
        if(isIphone5){
            shellStartX = 45 + 44;
        }
        
        shellPosY = 112;
        
        if(isIpad){
            shellPosY = 112 * 768.0/320.0;
            shellStartX = 45 * 1024.0/480.0;
            shellOffsetX *= 2;
        }
        
        shellPosX[0] = shellStartX + shellOffsetX*0;
        shellPosX[1] = shellStartX + shellOffsetX*1;
        shellPosX[2] = shellStartX + shellOffsetX*2;
        shellPosX[3] = shellStartX + shellOffsetX*3;
        shellPosX[4] = shellStartX + shellOffsetX*4;
        shellPosX[5] = shellStartX + shellOffsetX*5;
        
        [self initCharacters];
        [self initExtraGraphics];
        [self initBubbles];
        
        maxBubbles = 15;
        bubbleAppearedTimer = 999;
        
        maxTurtleOnScreen = 3;
        
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

-(void) initCharacters{
    turtle[0] = [[Turtle alloc] init];
    turtle[1] = [[Turtle alloc] init];
    turtle[2] = [[Turtle alloc] init];
    turtle[3] = [[Turtle alloc] init];
    turtle[4] = [[Turtle alloc] init];
    turtle[5] = [[Turtle alloc] init];
    
    //static float startX = 47+22;
     float startX = 47;
     float startY = 95;
     float offsetX = 76;
     float offsetY = 0;
    
    if(isIphone5){
        startX += 44;
    }
    
    if(isIpad){
        startY = 95 * 768.0/320.0;
        startX = 47 * 1024.0/480.0;
        offsetX *= 2;
    }

    
    [turtle[0] setX:startX];
    [turtle[0] setY:startY];
    [turtle[0] setStatus:kTurtleAniStatus_Normal_In];
    
    [turtle[1] setX:startX + offsetX];
    [turtle[1] setY:startY];
    [turtle[1] setStatus:kTurtleAniStatus_Normal_In];
    
    [turtle[2] setX:startX + offsetX*2];
    [turtle[2] setY:startY];
    [turtle[2] setStatus:kTurtleAniStatus_Normal_In];
    
    [turtle[3] setX:startX + offsetX*3];
    [turtle[3] setY:startY];
    [turtle[3] setStatus:kTurtleAniStatus_Normal_In];
    
    [turtle[4] setX:startX + offsetX*4];
    [turtle[4] setY:startY+offsetY];
    [turtle[4] setStatus:kTurtleAniStatus_Normal_In];
    
    [turtle[5] setX:startX + offsetX*5];
    [turtle[5] setY:startY+offsetY];
    [turtle[5] setStatus:kTurtleAniStatus_Normal_In];
    
    
    //PEGNUin
    currentStandShell = 2;
    
    penguin = [[Penguin alloc] init];
    [penguin setX:shellPosX[currentStandShell]];
    [penguin setY:shellPosY];
    [penguin setStatus:kPenguinAniStatus_Idle];
//    [penguin setPenguinScale:wholePenguinScaleFromSocurce];
    
    
    [turtle[0] setDelegate:self];
    [turtle[1] setDelegate:self];
    [turtle[2] setDelegate:self];
    [turtle[3] setDelegate:self];
    [turtle[4] setDelegate:self];
    [turtle[5] setDelegate:self];
    [penguin setDelegate:self];
    
    [turtle[0] setIdNumber:0];
    [turtle[1] setIdNumber:1];
    [turtle[2] setIdNumber:2];
    [turtle[3] setIdNumber:3];
    [turtle[4] setIdNumber:4];
    [turtle[5] setIdNumber:5];
}

-(void) initExtraGraphics{
   // ss_Extra  = [CCSpriteBatchNode spriteSheetWithFile:@"mini_04_extraTexture.png" capacity:1];
   // [self addChild:ss_Extra z:kDeapth_ssExtra];
    
    ////////////////////////////////////////////////
    //the 4 buttons are done in ControlLayer class//
    ////////////////////////////////////////////////
    
   
    if(isIpad){
//        s_sea = [CCSprite spriteWithTexture:ss_Extra.texture rect:CGRectMake(0,160,1024,266)];
        s_sea = [CCSprite spriteWithTexture:ss_Extra.texture rect:CGRectMake(0,124,1024,266)];
    }else{
        s_sea = [CCSprite spriteWithTexture:ss_Extra.texture rect:CGRectMake(0/textureRatioForFuckingIpad,128/textureRatioForFuckingIpad,1060/textureRatioForFuckingIpad,202/textureRatioForFuckingIpad)];
    }
   

    
    [s_Left setScaleX:-1];
    [s_LeftLeft setScaleX:-1];
    
    [ss_Extra addChild:s_sea];
    /*[ss_Extra addChild:s_LeftLeft z:kDeapth_Extra2];
    [ss_Extra addChild:s_Left z:kDeapth_Extra2];
    [ss_Extra addChild:s_RightRight z:kDeapth_Extra2];
    [ss_Extra addChild:s_Right z:kDeapth_Extra2];*/
    
    if(isIpad){
        [s_sea setAnchorPoint:ccp(0,0)];
        [s_sea setPosition:ccp(0,0)];
    }else{
        [s_sea setAnchorPoint:ccp(0,0.5)];
        [s_sea setPosition:ccp(0,50)];
    }
    
    
    
    /*[s_LeftLeft setPosition:ccp(48, 38)];
    [s_Left setPosition:ccp(135, 38)];
    [s_RightRight setPosition:ccp([UIScreen mainScreen].bounds.size.height - 48, 38)];
    [s_Right setPosition:ccp([UIScreen mainScreen].bounds.size.height - 145, 38)];*/
    
    if(isIphone5){
        [s_sea setScaleX:1.1];
    }


}

-(void) initBubbles{
    maxBubbles = 15;
    
    for(int i = 0 ; i < maxBubbles ; i++){
        s_Bubble[i] = [CCSprite spriteWithTexture:ss_Extra.texture rect:CGRectMake(304/2,0/2,31/2,31/2)];
        
        [ss_Extra addChild:s_Bubble[i]];
        
        [s_Bubble[i] setPosition:ccp(10000,10000)];
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
    
    return;
    
	for( UITouch *touch in touches ) {
		CGPoint location = [touch locationInView: [touch view]];
		location = [[CCDirector sharedDirector] convertToGL: location];
        
        if(currentCombo < 10){
            turtleCoinShinning_angleSpeed += 0.3;
        }else{
            turtleCoinShinning_angleSpeed += 0.5;
        }
        //[uILayer gainCombo:1];
        
        if(location.y < 110){
            if(location.x < 84){
                if([penguin status] != kPenguinAniStatus_Jumping){
                    currentStandShell-=2;
                    if(currentStandShell<0){
                        currentStandShell = 0;
                    }
                    penguinJumpFinalX = shellPosX[currentStandShell];
                    penguinJumpFinalY = shellPosY;
                    [penguin setFacingRight:false];
                   // [penguin tempSetFast:true];
                    
                    [penguin setJump:kPenguinJump_jumpTo2TurtleShell];
                    
                }else{
                    [penguin setNext:kPenguinJump_jumpTo2TurtleShell isFacingRight:false];
                }
                
                
            }else if(location.x < 175){
                if([penguin status] != kPenguinAniStatus_Jumping){
                    currentStandShell--;
                    if(currentStandShell<0){
                        currentStandShell = 0;
                    }

                    penguinJumpFinalX = shellPosX[currentStandShell];
                    penguinJumpFinalY = shellPosY;
                    [penguin setFacingRight:false];
                  //  [penguin tempSetFast:false];
                    
                    [penguin setJump:kPenguinJump_jumpTo1TurtleShell];
                }else{
                    [penguin setNext:kPenguinJump_jumpTo1TurtleShell isFacingRight:false];
                }
                
                
            }
            
            if(location.x > 396){
                if([penguin status] != kPenguinAniStatus_Jumping){
                    currentStandShell+=2;
                    if(currentStandShell > 5){
                        currentStandShell = 5;
                    }
                    
                    penguinJumpFinalX = shellPosX[currentStandShell];
                    penguinJumpFinalY = shellPosY;
                    [penguin setFacingRight:true];
                  //  [penguin tempSetFast:true];
                    
                    [penguin setJump:kPenguinJump_jumpTo2TurtleShell];
                }else{
                    [penguin setNext:kPenguinJump_jumpTo2TurtleShell isFacingRight:true];
                }
                
                
            }else if(location.x > 300){
                if([penguin status] != kPenguinAniStatus_Jumping){
                    currentStandShell++;
                    if(currentStandShell > 5){
                        currentStandShell = 5;
                    }

                    penguinJumpFinalX = shellPosX[currentStandShell];
                    penguinJumpFinalY = shellPosY;
                    [penguin setFacingRight:true];
                 //   [penguin tempSetFast:false];
                    
                    [penguin setJump:kPenguinJump_jumpTo1TurtleShell];
                }else{
                    [penguin setNext:kPenguinJump_jumpTo1TurtleShell isFacingRight:true];
                }
                
                
            }
        }
       
        
               
       
    }
}

-(void) manageBubbles{
    if(bubbleAppearedTimer > 40){
        if(arc4random() % 70 == 0){
            static int bubbleAppearX;
            
            if(isIphone5){
                 bubbleAppearX = arc4random()%480;
            }else{
                 bubbleAppearX = arc4random()%480;
            }
           
            
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
    //printf("setExternalValues\n");
     seaOffsestFinalX = _offsetFinalX;
    for(int i = 0 ; i < 6 ; i++){
        [turtle[i] setExternalOffsetFinalX:-seaOffsestFinalX];
    }
    [penguin setExternalOffsetFinalX:-seaOffsestFinalX];
}

-(void) btnIsTappedInControlLayer:(int)_btnIdx{
    //printf("btnIsTappedInControlLayer:%i\n",_btnIdx);
    if(_btnIdx == 0){
        if([penguin status] != kPenguinAniStatus_Jumping){
            currentStandShell-=2;
            if(currentStandShell<0){
                currentStandShell = 0;
            }
            penguinJumpFinalX = shellPosX[currentStandShell];
            penguinJumpFinalY = shellPosY;
            [penguin setFacingRight:false];
            // [penguin tempSetFast:true];
            
            [penguin setJump:kPenguinJump_jumpTo2TurtleShell];
            
        }else{
            [penguin setNext:kPenguinJump_jumpTo2TurtleShell isFacingRight:false];
        }
    }
    if(_btnIdx == 1){
        if([penguin status] != kPenguinAniStatus_Jumping){
            currentStandShell--;
            if(currentStandShell<0){
                currentStandShell = 0;
            }
            
            penguinJumpFinalX = shellPosX[currentStandShell];
            penguinJumpFinalY = shellPosY;
            [penguin setFacingRight:false];
            //  [penguin tempSetFast:false];
            
            [penguin setJump:kPenguinJump_jumpTo1TurtleShell];
        }else{
            [penguin setNext:kPenguinJump_jumpTo1TurtleShell isFacingRight:false];
        }
    }
    if(_btnIdx == 2){
        if([penguin status] != kPenguinAniStatus_Jumping){
            currentStandShell++;
            if(currentStandShell > 5){
                currentStandShell = 5;
            }
            
            penguinJumpFinalX = shellPosX[currentStandShell];
            penguinJumpFinalY = shellPosY;
            [penguin setFacingRight:true];
            //   [penguin tempSetFast:false];
            
            [penguin setJump:kPenguinJump_jumpTo1TurtleShell];
        }else{
            [penguin setNext:kPenguinJump_jumpTo1TurtleShell isFacingRight:true];
        }
    }
    if(_btnIdx == 3){
        if([penguin status] != kPenguinAniStatus_Jumping){
            currentStandShell+=2;
            if(currentStandShell > 5){
                currentStandShell = 5;
            }
            
            penguinJumpFinalX = shellPosX[currentStandShell];
            penguinJumpFinalY = shellPosY;
            [penguin setFacingRight:true];
            //  [penguin tempSetFast:true];
            
            [penguin setJump:kPenguinJump_jumpTo2TurtleShell];
        }else{
            [penguin setNext:kPenguinJump_jumpTo2TurtleShell isFacingRight:true];
        }
    }
}

-(void) manage:(ccTime) dt{
    [self manageRemainTapToNextStep];
    
    [self manageMini04Type:dt];
    
    if(isGoingToNext){
        [self gotoNextDelayOneStep];
    }
    
    [penguin manage];
    [self manageBubbles];
    
    [self runTurtleAI];
    

        // printf("currentTurtleOnScreen:%i %i\n",currentTurtleOnScreen,maxTurtleOnScreen);
        
        for ( int i = 0 ; i < 6 ; i++){
            [turtle[i] manage:dt];
        }
    
    
    
    seaOffestX += (seaOffsestFinalX - seaOffestX)/100;
    
    seaOffestX = 0;
    
    [s_sea setPosition:ccp(seaOffestX, 50)];
    
    if(isIpad){
        [s_sea setPosition:ccp(seaOffestX, -20)];
    }
    
}

-(void) gotoNextJump{
    //printf("mini04 gotoNextJump:%i\n",currentStandShell);
    
    if(next_isFacingRight){
        
        if(next_jumpType == kPenguinJump_jumpTo1TurtleShell){
            currentStandShell++;
            if(currentStandShell > 5){
                currentStandShell = 5;
            }
        }
        if(next_jumpType == kPenguinJump_jumpTo2TurtleShell){
            currentStandShell+=2;
            if(currentStandShell > 5){
                currentStandShell = 5;
            }
        }
        
        penguinJumpFinalX = shellPosX[currentStandShell];
        penguinJumpFinalY = shellPosY;
    }else{
        
        if(next_jumpType == kPenguinJump_jumpTo1TurtleShell){
            currentStandShell--;
            if(currentStandShell<0){
                currentStandShell = 0;
            }
        }
        if(next_jumpType == kPenguinJump_jumpTo2TurtleShell){
            currentStandShell-=2;
            if(currentStandShell<0){
                currentStandShell = 0;
            }
        }

        
        penguinJumpFinalX = shellPosX[currentStandShell];
        penguinJumpFinalY = shellPosY;
        
    }

    //printf("Emini04 gotoNextJump:%i\n",currentStandShell);
}

-(void) gotoNextDelayOneStep{

}

-(void)tapTurtle{
    [self updateGameLevel];
    
    [turtle[currentStandShell] tap];
}

- (void) dealloc
{
	printf("Mini 01 Dealloc\n");
    
    [turtle[0] release];
    [turtle[1] release];
    [turtle[2] release];
    [turtle[3] release];
    [turtle[4] release];
    [turtle[5] release];
    
    [penguin release];
    
	[super dealloc];
}


-(void) runTurtleAI{
    for(int i = 0 ; i < 6 ; i++){
        
        if([turtle[i] status] == kTurtleAniStatus_Normal_Out){
            if(arc4random() % 50 == 0){
                if(arc4random() % 10 == 0){
                    // printf("turtle in\n");
                   // [turtle[i] setStatus:kTurtleAniStatus_In];
                }else{
                    [turtle[i] setStatus:kTurtleAniStatus_Idle];
                }
            } 
        }
        
    }
    
}

-(void) finishOneRound{
   // printf("mini 04 finish one round\n");
    
    /*[super finishOneRound];
    
    if(gameRound < 15){
        gameLevel = 0;
    }else if(gameRound < 30){
        gameLevel = 1;
    }else if(gameRound < 45){
        gameLevel = 2;
    }*/
}

-(void) thisMomentOverTime:(int)_momentIdx{
    printf("this moment over time:%i %i\n",_momentIdx, momentTarget[_momentIdx]);
    [turtle[momentTarget[_momentIdx]] setStatus:kTurtleAniStatus_In];
    gameRound--;
    if(gameRound < 0){
        gameRound = 0;
    }
    remainTapToNextRound--;
}

-(void) getScript{
    if(gameLevel == 0){
        nextMomentAppearTime = 8;
    }
    
    //printf("get Script\n");
    nextMomentAppearTime = 400000;
}

-(int) genNextTargetMoment:(int)_shellStandPosition shellLevel:(int)_shellLevel NS1:(int)_NS1 NS2:(int)_NS2 NS3:(int)_NS3 NS4:(int)_NS4 NS5:(int)_NS5 NS6:(int)_NS6{
    if(_shellStandPosition < 0){
        printf("fuck you all genNextTargetMoment\n");
        return -10;
    }
    
   // printf("genNextTargetMoment:%i\n",_shellStandPosition);
    
    isFuxking = false;
    
    /*hasNoticedOverTime[recentMomentIdx] = false;
    momentRunTime[recentMomentIdx] = 0;
    momentOverTime[recentMomentIdx] = 6;*/
    
    static bool hasColide;
    static int momentTargetCheck;
    static int hasColideTimes;
    
    hasColideTimes = 0;
    do{
        hasColideTimes++;
        hasColide = false;
        
        static int ranMomentTarget;
        ranMomentTarget = arc4random()%4;
        
        if(ranMomentTarget == 0){
            momentTargetCheck = _shellStandPosition - 2;
            if(gameLevel == 0 && gameRound < 3){
                momentTargetCheck = _shellStandPosition - 1;
            }
        }
        if(ranMomentTarget == 1){
            momentTargetCheck = _shellStandPosition - 1;
        }
        if(ranMomentTarget == 2){
            momentTargetCheck = _shellStandPosition + 1;
        }
        if(ranMomentTarget == 3){
            momentTargetCheck = _shellStandPosition + 2;
            if(gameLevel == 0 && gameRound < 3){
                momentTargetCheck = _shellStandPosition + 1;
            }
        }
        
        
        
        for(int j = 0 ; j < maxMoment ; j++){
            if(momentRunTime[j] > 0){
                if(momentTarget[j] == momentTargetCheck){
                    hasColide = true;
                }
            }
        }
        
        if(hasColideTimes > 100){
            printf("colide too many\n");
            hasColide = false;
            for(int i = 0 ; i < 6 ; i++){
                shellGoingToMoment[i] = -1;
            }
          //  newestMomentHasAppearedTime = nextMomentAppearTime - 1;
          //  remainTapToNextRound--;
            return -2;
        }
        
        if(momentTargetCheck < 0 || momentTargetCheck > 5){
            hasColide = true;
        }else{
            if([turtle[momentTargetCheck] status] != kTurtleAniStatus_Normal_In){
                hasColide = true;
            }
        }
        
        if(momentTargetCheck == currentStandShell || momentTargetCheck == _NS1 || momentTargetCheck == _NS2 || momentTargetCheck == _NS3 || momentTargetCheck == _NS4 || momentTargetCheck == _NS5 || momentTargetCheck == _NS6){
            hasColide = true;
        }
        
        
    }while(hasColide);
    
    //printf("momentTargetCheck:%i %i\n",momentTargetCheck, recentMomentIdx);
    
    if(momentTargetCheck == 0){
        [self setExternalValues:-22];
    }
    
    shellGoingToMoment[momentTargetCheck] = 1;
    shellLevelGoingToMoment[momentTargetCheck] = _shellLevel;
    
    
    //printf("return momentTargetCheck:%i\n",momentTargetCheck);
    return momentTargetCheck;

}


-(void) giveNextMoment{
  //  printf("giveNextMoment:%i\n",gameRound);
    
     //[self updateGameLevel];
    
    for(int i = 0 ; i < 6 ; i++){
        shellGoingToMoment[i] = -1;
    }
    
    
    for(int i = 0 ; i < 6 ; i++){
        shell_Check[i] = -1;
    }
    
    static int turtleNumbers;
    static int ranShellScript;
    
    if(gameLevel == 0){
            
        shell_Check[0] = [self genNextTargetMoment:currentStandShell shellLevel:0 NS1:shell_Check[0] NS2:shell_Check[1] NS3:shell_Check[2] NS4:shell_Check[3] NS5:shell_Check[4] NS6:shell_Check[5]]; 
        turtleNumbers = 1;
        
        if(shell_Check[0] < -1 || shell_Check[1] < -1 || shell_Check[2] < -1 || shell_Check[3] < -1 || shell_Check[4] < -1 || shell_Check[5] < -1){
            newestMomentHasAppearedTime = nextMomentAppearTime - 0.05; 
        }else{
            numberTapToNextRound = turtleNumbers;
            remainTapToNextRound += turtleNumbers;
        }
            
    }
    
    if(gameLevel == 1){

        
        shell_Check[0] = [self genNextTargetMoment:currentStandShell shellLevel:0 NS1:shell_Check[0] NS2:shell_Check[1] NS3:shell_Check[2] NS4:shell_Check[3] NS5:shell_Check[4] NS6:shell_Check[5]]; 
        shell_Check[1] = [self genNextTargetMoment:shell_Check[0] shellLevel:0 NS1:shell_Check[0] NS2:shell_Check[1] NS3:shell_Check[2] NS4:shell_Check[3] NS5:shell_Check[4] NS6:shell_Check[5]]; 
        turtleNumbers = 2;
        
        if(shell_Check[0] < -1 || shell_Check[1] < -1 || shell_Check[2] < -1 || shell_Check[3] < -1 || shell_Check[4] < -1 || shell_Check[5] < -1){
            newestMomentHasAppearedTime = nextMomentAppearTime - 0.05; 
        }else{
            numberTapToNextRound = turtleNumbers;
            remainTapToNextRound += turtleNumbers;
        }
    }
    
    //NEW ADD
    if(gameLevel == 2){

        shell_Check[0] = [self genNextTargetMoment:currentStandShell shellLevel:1 NS1:shell_Check[0] NS2:shell_Check[1] NS3:shell_Check[2] NS4:shell_Check[3] NS5:shell_Check[4] NS6:shell_Check[5]]; 
        shell_Check[1] = [self genNextTargetMoment:shell_Check[0] shellLevel:1 NS1:shell_Check[0] NS2:shell_Check[1] NS3:shell_Check[2] NS4:shell_Check[3] NS5:shell_Check[4] NS6:shell_Check[5]]; 
        turtleNumbers = 2;
        
        if(shell_Check[0] < -1 || shell_Check[1] < -1 || shell_Check[2] < -1 || shell_Check[3] < -1 || shell_Check[4] < -1 || shell_Check[5] < -1){
            newestMomentHasAppearedTime = nextMomentAppearTime - 0.05; 
        }else{
            numberTapToNextRound = turtleNumbers;
            remainTapToNextRound += turtleNumbers;
        }
    }
    
    if(gameLevel == 3){
        
        if(arc4random() % 2 == 0){
            shell_Check[0] = [self genNextTargetMoment:currentStandShell shellLevel:1 NS1:shell_Check[0] NS2:shell_Check[1] NS3:shell_Check[2] NS4:shell_Check[3] NS5:shell_Check[4] NS6:shell_Check[5]]; 
            shell_Check[1] = [self genNextTargetMoment:shell_Check[0] shellLevel:0 NS1:shell_Check[0] NS2:shell_Check[1] NS3:shell_Check[2] NS4:shell_Check[3] NS5:shell_Check[4] NS6:shell_Check[5]]; 
            turtleNumbers = 2;
        }else{
           /* shell_Check[0] = [self genNextTargetMoment:currentStandShell shellLevel:0 NS1:shell_Check[0] NS2:shell_Check[1] NS3:shell_Check[2] NS4:shell_Check[3] NS5:shell_Check[4] NS6:shell_Check[5]]; 
            shell_Check[1] = [self genNextTargetMoment:shell_Check[0] shellLevel:0 NS1:shell_Check[0] NS2:shell_Check[1] NS3:shell_Check[2] NS4:shell_Check[3] NS5:shell_Check[4] NS6:shell_Check[5]]; 
            shell_Check[2] = [self genNextTargetMoment:shell_Check[1] shellLevel:0 NS1:shell_Check[0] NS2:shell_Check[1] NS3:shell_Check[2] NS4:shell_Check[3] NS5:shell_Check[4] NS6:shell_Check[5]]; 
            turtleNumbers = 3;*/
            
            shell_Check[0] = [self genNextTargetMoment:currentStandShell shellLevel:1 NS1:shell_Check[0] NS2:shell_Check[1] NS3:shell_Check[2] NS4:shell_Check[3] NS5:shell_Check[4] NS6:shell_Check[5]]; 
            shell_Check[1] = [self genNextTargetMoment:shell_Check[0] shellLevel:1 NS1:shell_Check[0] NS2:shell_Check[1] NS3:shell_Check[2] NS4:shell_Check[3] NS5:shell_Check[4] NS6:shell_Check[5]]; 
            turtleNumbers = 2;
        }
                
        if(shell_Check[0] < -1 || shell_Check[1] < -1 || shell_Check[2] < -1 || shell_Check[3] < -1 || shell_Check[4] < -1 || shell_Check[5] < -1){
            newestMomentHasAppearedTime = nextMomentAppearTime - 0.05; 
        }else{
            numberTapToNextRound = turtleNumbers;
            remainTapToNextRound += turtleNumbers;
        }

        
    }
    if(gameLevel == 4){
        
        ranShellScript = arc4random() % 4;
        
        if(ranShellScript == 0){
            shell_Check[0] = [self genNextTargetMoment:currentStandShell shellLevel:0 NS1:shell_Check[0] NS2:shell_Check[1] NS3:shell_Check[2] NS4:shell_Check[3] NS5:shell_Check[4] NS6:shell_Check[5]]; 
            shell_Check[1] = [self genNextTargetMoment:shell_Check[0] shellLevel:0 NS1:shell_Check[0] NS2:shell_Check[1] NS3:shell_Check[2] NS4:shell_Check[3] NS5:shell_Check[4] NS6:shell_Check[5]]; 
            shell_Check[2] = [self genNextTargetMoment:shell_Check[1] shellLevel:0 NS1:shell_Check[0] NS2:shell_Check[1] NS3:shell_Check[2] NS4:shell_Check[3] NS5:shell_Check[4] NS6:shell_Check[5]]; 
            shell_Check[3] = [self genNextTargetMoment:shell_Check[2] shellLevel:0 NS1:shell_Check[0] NS2:shell_Check[1] NS3:shell_Check[2] NS4:shell_Check[3] NS5:shell_Check[4] NS6:shell_Check[5]]; 
            turtleNumbers = 4;
        }else if(ranShellScript == 1){
            /*shell_Check[0] = [self genNextTargetMoment:currentStandShell shellLevel:1 NS1:shell_Check[0] NS2:shell_Check[1] NS3:shell_Check[2] NS4:shell_Check[3] NS5:shell_Check[4] NS6:shell_Check[5]]; 
            shell_Check[1] = [self genNextTargetMoment:shell_Check[0] shellLevel:1 NS1:shell_Check[0] NS2:shell_Check[1] NS3:shell_Check[2] NS4:shell_Check[3] NS5:shell_Check[4] NS6:shell_Check[5]]; 
            turtleNumbers = 2;*/
            
            shell_Check[0] = [self genNextTargetMoment:currentStandShell shellLevel:0 NS1:shell_Check[0] NS2:shell_Check[1] NS3:shell_Check[2] NS4:shell_Check[3] NS5:shell_Check[4] NS6:shell_Check[5]]; 
            shell_Check[1] = [self genNextTargetMoment:shell_Check[0] shellLevel:0 NS1:shell_Check[0] NS2:shell_Check[1] NS3:shell_Check[2] NS4:shell_Check[3] NS5:shell_Check[4] NS6:shell_Check[5]]; 
            shell_Check[2] = [self genNextTargetMoment:shell_Check[1] shellLevel:0 NS1:shell_Check[0] NS2:shell_Check[1] NS3:shell_Check[2] NS4:shell_Check[3] NS5:shell_Check[4] NS6:shell_Check[5]]; 
            turtleNumbers = 3;
        }else if(ranShellScript == 2){
            shell_Check[0] = [self genNextTargetMoment:currentStandShell shellLevel:1 NS1:shell_Check[0] NS2:shell_Check[1] NS3:shell_Check[2] NS4:shell_Check[3] NS5:shell_Check[4] NS6:shell_Check[5]]; 
            shell_Check[1] = [self genNextTargetMoment:shell_Check[0] shellLevel:0 NS1:shell_Check[0] NS2:shell_Check[1] NS3:shell_Check[2] NS4:shell_Check[3] NS5:shell_Check[4] NS6:shell_Check[5]]; 
            shell_Check[2] = [self genNextTargetMoment:shell_Check[0] shellLevel:0 NS1:shell_Check[0] NS2:shell_Check[1] NS3:shell_Check[2] NS4:shell_Check[3] NS5:shell_Check[4] NS6:shell_Check[5]]; 
            turtleNumbers = 3;
        }else if(ranShellScript == 3){
            shell_Check[0] = [self genNextTargetMoment:currentStandShell shellLevel:0 NS1:shell_Check[0] NS2:shell_Check[1] NS3:shell_Check[2] NS4:shell_Check[3] NS5:shell_Check[4] NS6:shell_Check[5]]; 
            shell_Check[1] = [self genNextTargetMoment:shell_Check[0] shellLevel:1 NS1:shell_Check[0] NS2:shell_Check[1] NS3:shell_Check[2] NS4:shell_Check[3] NS5:shell_Check[4] NS6:shell_Check[5]]; 
            shell_Check[2] = [self genNextTargetMoment:shell_Check[1] shellLevel:0 NS1:shell_Check[0] NS2:shell_Check[1] NS3:shell_Check[2] NS4:shell_Check[3] NS5:shell_Check[4] NS6:shell_Check[5]]; 
            turtleNumbers = 3;
        }
        
        if(shell_Check[0] < -1 || shell_Check[1] < -1 || shell_Check[2] < -1 || shell_Check[3] < -1 || shell_Check[4] < -1 || shell_Check[5] < -1){
            newestMomentHasAppearedTime = nextMomentAppearTime - 0.05; 
        }else{
            numberTapToNextRound = turtleNumbers;
            remainTapToNextRound += turtleNumbers;
        }
        
        
        
    }
    
    if(gameLevel == 5){
        
        ranShellScript = arc4random() % 4;
        
        if(ranShellScript == 0){
            shell_Check[0] = [self genNextTargetMoment:currentStandShell shellLevel:2 NS1:shell_Check[0] NS2:shell_Check[1] NS3:shell_Check[2] NS4:shell_Check[3] NS5:shell_Check[4] NS6:shell_Check[5]]; 
            shell_Check[1] = [self genNextTargetMoment:shell_Check[0] shellLevel:0 NS1:shell_Check[0] NS2:shell_Check[1] NS3:shell_Check[2] NS4:shell_Check[3] NS5:shell_Check[4] NS6:shell_Check[5]]; 
            shell_Check[2] = [self genNextTargetMoment:shell_Check[0] shellLevel:0 NS1:shell_Check[0] NS2:shell_Check[1] NS3:shell_Check[2] NS4:shell_Check[3] NS5:shell_Check[4] NS6:shell_Check[5]];  
            turtleNumbers = 3;
        }else if(ranShellScript == 1){
            shell_Check[0] = [self genNextTargetMoment:currentStandShell shellLevel:2 NS1:shell_Check[0] NS2:shell_Check[1] NS3:shell_Check[2] NS4:shell_Check[3] NS5:shell_Check[4] NS6:shell_Check[5]]; 
            shell_Check[1] = [self genNextTargetMoment:shell_Check[0] shellLevel:1 NS1:shell_Check[0] NS2:shell_Check[1] NS3:shell_Check[2] NS4:shell_Check[3] NS5:shell_Check[4] NS6:shell_Check[5]]; 
            turtleNumbers = 2;
        }else if(ranShellScript == 2){
            shell_Check[0] = [self genNextTargetMoment:currentStandShell shellLevel:1 NS1:shell_Check[0] NS2:shell_Check[1] NS3:shell_Check[2] NS4:shell_Check[3] NS5:shell_Check[4] NS6:shell_Check[5]]; 
            shell_Check[1] = [self genNextTargetMoment:shell_Check[0] shellLevel:1 NS1:shell_Check[0] NS2:shell_Check[1] NS3:shell_Check[2] NS4:shell_Check[3] NS5:shell_Check[4] NS6:shell_Check[5]]; 
            shell_Check[2] = [self genNextTargetMoment:shell_Check[1] shellLevel:0 NS1:shell_Check[0] NS2:shell_Check[1] NS3:shell_Check[2] NS4:shell_Check[3] NS5:shell_Check[4] NS6:shell_Check[5]]; 
            turtleNumbers = 3;
        }else if(ranShellScript == 3){
            shell_Check[0] = [self genNextTargetMoment:currentStandShell shellLevel:0 NS1:shell_Check[0] NS2:shell_Check[1] NS3:shell_Check[2] NS4:shell_Check[3] NS5:shell_Check[4] NS6:shell_Check[5]]; 
            shell_Check[1] = [self genNextTargetMoment:shell_Check[0] shellLevel:1 NS1:shell_Check[0] NS2:shell_Check[1] NS3:shell_Check[2] NS4:shell_Check[3] NS5:shell_Check[4] NS6:shell_Check[5]]; 
            shell_Check[2] = [self genNextTargetMoment:shell_Check[1] shellLevel:0 NS1:shell_Check[0] NS2:shell_Check[1] NS3:shell_Check[2] NS4:shell_Check[3] NS5:shell_Check[4] NS6:shell_Check[5]]; 
            shell_Check[3] = [self genNextTargetMoment:shell_Check[1] shellLevel:0 NS1:shell_Check[0] NS2:shell_Check[1] NS3:shell_Check[2] NS4:shell_Check[3] NS5:shell_Check[4] NS6:shell_Check[5]]; 
            turtleNumbers = 4;
        }
        
        if(shell_Check[0] < -1 || shell_Check[1] < -1 || shell_Check[2] < -1 || shell_Check[3] < -1 || shell_Check[4] < -1 || shell_Check[5] < -1){
            newestMomentHasAppearedTime = nextMomentAppearTime - 0.05; 
        }else{
            numberTapToNextRound = turtleNumbers;
            remainTapToNextRound += turtleNumbers;
        }
        
    }
    
    if(gameLevel == 6){
        
        ranShellScript = arc4random() % 4;
        
        if(ranShellScript == 0){
            shell_Check[0] = [self genNextTargetMoment:currentStandShell shellLevel:2 NS1:shell_Check[0] NS2:shell_Check[1] NS3:shell_Check[2] NS4:shell_Check[3] NS5:shell_Check[4] NS6:shell_Check[5]]; 
            shell_Check[1] = [self genNextTargetMoment:shell_Check[0] shellLevel:2 NS1:shell_Check[0] NS2:shell_Check[1] NS3:shell_Check[2] NS4:shell_Check[3] NS5:shell_Check[4] NS6:shell_Check[5]]; 
            turtleNumbers = 2;
        }else if(ranShellScript == 1){
            shell_Check[0] = [self genNextTargetMoment:currentStandShell shellLevel:2 NS1:shell_Check[0] NS2:shell_Check[1] NS3:shell_Check[2] NS4:shell_Check[3] NS5:shell_Check[4] NS6:shell_Check[5]]; 
            shell_Check[1] = [self genNextTargetMoment:shell_Check[0] shellLevel:1 NS1:shell_Check[0] NS2:shell_Check[1] NS3:shell_Check[2] NS4:shell_Check[3] NS5:shell_Check[4] NS6:shell_Check[5]]; 
            shell_Check[2] = [self genNextTargetMoment:shell_Check[0] shellLevel:0 NS1:shell_Check[0] NS2:shell_Check[1] NS3:shell_Check[2] NS4:shell_Check[3] NS5:shell_Check[4] NS6:shell_Check[5]]; 
            turtleNumbers = 3;
        }else if(ranShellScript == 2){
            shell_Check[0] = [self genNextTargetMoment:currentStandShell shellLevel:0 NS1:shell_Check[0] NS2:shell_Check[1] NS3:shell_Check[2] NS4:shell_Check[3] NS5:shell_Check[4] NS6:shell_Check[5]]; 
            shell_Check[1] = [self genNextTargetMoment:shell_Check[0] shellLevel:2 NS1:shell_Check[0] NS2:shell_Check[1] NS3:shell_Check[2] NS4:shell_Check[3] NS5:shell_Check[4] NS6:shell_Check[5]]; 
            shell_Check[2] = [self genNextTargetMoment:shell_Check[1] shellLevel:1 NS1:shell_Check[0] NS2:shell_Check[1] NS3:shell_Check[2] NS4:shell_Check[3] NS5:shell_Check[4] NS6:shell_Check[5]]; 
            turtleNumbers = 3;
        }else if(ranShellScript == 3){
            shell_Check[0] = [self genNextTargetMoment:currentStandShell shellLevel:1 NS1:shell_Check[0] NS2:shell_Check[1] NS3:shell_Check[2] NS4:shell_Check[3] NS5:shell_Check[4] NS6:shell_Check[5]]; 
            shell_Check[1] = [self genNextTargetMoment:shell_Check[0] shellLevel:0 NS1:shell_Check[0] NS2:shell_Check[1] NS3:shell_Check[2] NS4:shell_Check[3] NS5:shell_Check[4] NS6:shell_Check[5]]; 
            shell_Check[2] = [self genNextTargetMoment:shell_Check[0] shellLevel:1 NS1:shell_Check[0] NS2:shell_Check[1] NS3:shell_Check[2] NS4:shell_Check[3] NS5:shell_Check[4] NS6:shell_Check[5]]; 
            shell_Check[3] = [self genNextTargetMoment:shell_Check[2] shellLevel:0 NS1:shell_Check[0] NS2:shell_Check[1] NS3:shell_Check[2] NS4:shell_Check[3] NS5:shell_Check[4] NS6:shell_Check[5]]; 
            turtleNumbers = 4;
        }
        
        if(shell_Check[0] < -1 || shell_Check[1] < -1 || shell_Check[2] < -1 || shell_Check[3] < -1 || shell_Check[4] < -1 || shell_Check[5] < -1){
            newestMomentHasAppearedTime = nextMomentAppearTime - 0.05; 
        }else{
            numberTapToNextRound = turtleNumbers;
            remainTapToNextRound += turtleNumbers;
        }
        
    }
    
    
    if(gameLevel == 7){
        
        ranShellScript = arc4random() % 6;
        
        if(ranShellScript == 0){
            shell_Check[0] = [self genNextTargetMoment:currentStandShell shellLevel:2 NS1:shell_Check[0] NS2:shell_Check[1] NS3:shell_Check[2] NS4:shell_Check[3] NS5:shell_Check[4] NS6:shell_Check[5]]; 
            shell_Check[1] = [self genNextTargetMoment:shell_Check[0] shellLevel:1 NS1:shell_Check[0] NS2:shell_Check[1] NS3:shell_Check[2] NS4:shell_Check[3] NS5:shell_Check[4] NS6:shell_Check[5]]; 
            shell_Check[2] = [self genNextTargetMoment:shell_Check[0] shellLevel:0 NS1:shell_Check[0] NS2:shell_Check[1] NS3:shell_Check[2] NS4:shell_Check[3] NS5:shell_Check[4] NS6:shell_Check[5]]; 
            turtleNumbers = 3;
        }else if(ranShellScript == 1){
            shell_Check[0] = [self genNextTargetMoment:currentStandShell shellLevel:0 NS1:shell_Check[0] NS2:shell_Check[1] NS3:shell_Check[2] NS4:shell_Check[3] NS5:shell_Check[4] NS6:shell_Check[5]]; 
            shell_Check[1] = [self genNextTargetMoment:shell_Check[0] shellLevel:2 NS1:shell_Check[0] NS2:shell_Check[1] NS3:shell_Check[2] NS4:shell_Check[3] NS5:shell_Check[4] NS6:shell_Check[5]]; 
            shell_Check[2] = [self genNextTargetMoment:shell_Check[1] shellLevel:1 NS1:shell_Check[0] NS2:shell_Check[1] NS3:shell_Check[2] NS4:shell_Check[3] NS5:shell_Check[4] NS6:shell_Check[5]]; 
            turtleNumbers = 3;
        }else if(ranShellScript == 2){
            shell_Check[0] = [self genNextTargetMoment:currentStandShell shellLevel:1 NS1:shell_Check[0] NS2:shell_Check[1] NS3:shell_Check[2] NS4:shell_Check[3] NS5:shell_Check[4] NS6:shell_Check[5]]; 
            shell_Check[1] = [self genNextTargetMoment:shell_Check[0] shellLevel:0 NS1:shell_Check[0] NS2:shell_Check[1] NS3:shell_Check[2] NS4:shell_Check[3] NS5:shell_Check[4] NS6:shell_Check[5]]; 
            shell_Check[2] = [self genNextTargetMoment:shell_Check[0] shellLevel:1 NS1:shell_Check[0] NS2:shell_Check[1] NS3:shell_Check[2] NS4:shell_Check[3] NS5:shell_Check[4] NS6:shell_Check[5]]; 
            shell_Check[3] = [self genNextTargetMoment:shell_Check[2] shellLevel:0 NS1:shell_Check[0] NS2:shell_Check[1] NS3:shell_Check[2] NS4:shell_Check[3] NS5:shell_Check[4] NS6:shell_Check[5]]; 
            turtleNumbers = 4;
        }else  if(ranShellScript == 3){
            shell_Check[0] = [self genNextTargetMoment:currentStandShell shellLevel:2 NS1:shell_Check[0] NS2:shell_Check[1] NS3:shell_Check[2] NS4:shell_Check[3] NS5:shell_Check[4] NS6:shell_Check[5]]; 
            shell_Check[1] = [self genNextTargetMoment:shell_Check[0] shellLevel:0 NS1:shell_Check[0] NS2:shell_Check[1] NS3:shell_Check[2] NS4:shell_Check[3] NS5:shell_Check[4] NS6:shell_Check[5]]; 
            shell_Check[2] = [self genNextTargetMoment:shell_Check[0] shellLevel:0 NS1:shell_Check[0] NS2:shell_Check[1] NS3:shell_Check[2] NS4:shell_Check[3] NS5:shell_Check[4] NS6:shell_Check[5]];  
            turtleNumbers = 3;
        }else if(ranShellScript == 4){
            shell_Check[0] = [self genNextTargetMoment:currentStandShell shellLevel:1 NS1:shell_Check[0] NS2:shell_Check[1] NS3:shell_Check[2] NS4:shell_Check[3] NS5:shell_Check[4] NS6:shell_Check[5]]; 
            shell_Check[1] = [self genNextTargetMoment:shell_Check[0] shellLevel:1 NS1:shell_Check[0] NS2:shell_Check[1] NS3:shell_Check[2] NS4:shell_Check[3] NS5:shell_Check[4] NS6:shell_Check[5]]; 
            shell_Check[2] = [self genNextTargetMoment:shell_Check[1] shellLevel:0 NS1:shell_Check[0] NS2:shell_Check[1] NS3:shell_Check[2] NS4:shell_Check[3] NS5:shell_Check[4] NS6:shell_Check[5]]; 
            turtleNumbers = 3;
        }else if(ranShellScript == 5){
            shell_Check[0] = [self genNextTargetMoment:currentStandShell shellLevel:0 NS1:shell_Check[0] NS2:shell_Check[1] NS3:shell_Check[2] NS4:shell_Check[3] NS5:shell_Check[4] NS6:shell_Check[5]]; 
            shell_Check[1] = [self genNextTargetMoment:shell_Check[0] shellLevel:1 NS1:shell_Check[0] NS2:shell_Check[1] NS3:shell_Check[2] NS4:shell_Check[3] NS5:shell_Check[4] NS6:shell_Check[5]]; 
            shell_Check[2] = [self genNextTargetMoment:shell_Check[1] shellLevel:0 NS1:shell_Check[0] NS2:shell_Check[1] NS3:shell_Check[2] NS4:shell_Check[3] NS5:shell_Check[4] NS6:shell_Check[5]]; 
            shell_Check[3] = [self genNextTargetMoment:shell_Check[1] shellLevel:0 NS1:shell_Check[0] NS2:shell_Check[1] NS3:shell_Check[2] NS4:shell_Check[3] NS5:shell_Check[4] NS6:shell_Check[5]]; 
            turtleNumbers = 4;
        }
        
        if(shell_Check[0] < -1 || shell_Check[1] < -1 || shell_Check[2] < -1 || shell_Check[3] < -1 || shell_Check[4] < -1 || shell_Check[5] < -1){
            newestMomentHasAppearedTime = nextMomentAppearTime - 0.05; 
        }else{
            numberTapToNextRound = turtleNumbers;
            remainTapToNextRound += turtleNumbers;
        }
        
    }
    
   /* //NEW ADD
    if(gameLevel == 6){
        
        ranShellScript = arc4random() % 4;
        printf("ranShellScript:%i\n",ranShellScript);
        
        if(ranShellScript == 0){
            shell_Check[0] = [self genNextTargetMoment:currentStandShell shellLevel:3 NS1:shell_Check[0] NS2:shell_Check[1] NS3:shell_Check[2] NS4:shell_Check[3] NS5:shell_Check[4] NS6:shell_Check[5]]; 
            shell_Check[1] = [self genNextTargetMoment:shell_Check[0] shellLevel:1 NS1:shell_Check[0] NS2:shell_Check[1] NS3:shell_Check[2] NS4:shell_Check[3] NS5:shell_Check[4] NS6:shell_Check[5]]; 
            shell_Check[2] = [self genNextTargetMoment:shell_Check[0] shellLevel:1 NS1:shell_Check[0] NS2:shell_Check[1] NS3:shell_Check[2] NS4:shell_Check[3] NS5:shell_Check[4] NS6:shell_Check[5]]; 
            
            turtleNumbers = 3;
        }else if(ranShellScript == 1){
            
        }else if(ranShellScript == 2){
            
        }else if(ranShellScript == 3){
            
        }
        
        if(shell_Check[0] < -1 || shell_Check[1] < -1 || shell_Check[2] < -1 || shell_Check[3] < -1 || shell_Check[4] < -1 || shell_Check[5] < -1){
            newestMomentHasAppearedTime = nextMomentAppearTime - 0.05; 
        }else{
            numberTapToNextRound = turtleNumbers;
            remainTapToNextRound += turtleNumbers;
        }
        
    }*/
    
    //newestMomentHasAppearedTime = 0;
   // [self getScript];
    
    for(int i = 0 ; i < 6 ; i++){
       // printf("shellGoingToMoment[i]:%i %i\n",i,shellGoingToMoment[i]);
        if(shellGoingToMoment[i] < 0){
            //return;
        }else{
           // printf("III:%i %i\n",i,shellGoingToMoment[i]);
            
            hasNoticedOverTime[recentMomentIdx] = false;
            momentRunTime[recentMomentIdx] = 0;
            momentOverTime[recentMomentIdx] = 40000;
            
            momentTarget[recentMomentIdx] = i;
            [turtle[i] setStatus:kTurtleAniStatus_Out];
            [turtle[i] setMomentIdx:recentMomentIdx];
            [turtle[i] setShellLevel:shellLevelGoingToMoment[i]];
            
            recentMomentIdx++;
            if(recentMomentIdx >= maxMoment){
                recentMomentIdx = 0;
            }
            
            newestMomentHasAppearedTime = 0;
            [self getScript];

        }
    }
}

-(void) turtleBombed:(int)_momentIdx{
    [super turtleBombed:_momentIdx];
    
  //  printf("turtleBombed\n");
    //remainTapToNextRound--;
    // counterForAchivement++;
    
}

-(void) manageRemainTapToNextStep{
    if(remainTapToNextRound == 0 && !isFuxking){
        //printf("CCCCCCCCCCCCCCCCCC:%4.8f %4.8f\n",nextMomentAppearTime, newestMomentHasAppearedTime);
        
        if(nextMomentAppearTime - newestMomentHasAppearedTime > 0.05){
          //  printf("AAAAAAAAAAAAAAAAAAA\n");
            newestMomentHasAppearedTime = nextMomentAppearTime - 0.05; 
        }
        //printf("BBBBBBBBBBBBBBBBBBBBBBBBBBB\n");
        
        /*if(gameRound < 10){
            gameLevel = 0;
        }else if(gameRound < 20){
            gameLevel = 1;
        }else if(gameRound < 30){
            gameLevel = 2;
        }
        gameLevel = 3;*/
        
        /*if(gameLevel == 0){
            numberTapToNextRound = 1;
        }else if(gameLevel == 1){
            numberTapToNextRound = 2;
        }else if(gameLevel == 2){
            numberTapToNextRound = 2;
        }else if(gameLevel == 3){
            numberTapToNextRound = 3;
        }*/
        
        //remainTapToNextRound = numberTapToNextRound;
    }
}

-(void) tapWrongly{
    if(currentCombo >= 5){
        printf("REDUCE from tap Wrongly\n");
        comboReduceSpeedAccum -= 0.005;
        if(comboReduceSpeedAccum < -0.01){
            comboReduceSpeedAccum = -0.01;
        }
        comboReduceSpeedAccumSpeed = -comboReduceSpeedAccum;
    }
    
    comboReduceSpeedAccumSpeed = -comboReduceSpeedAccum;
    
    [super tapWrongly];
    
    for(int i = 0 ; i < maxMoment ; i++){
        if(momentRunTime[i] > 0){
            [turtle[momentTarget[i]] setStatus:kTurtleAniStatus_In];
            momentRunTime[i] = -9999;
        }
    }
    
}

-(void) beforeLoseComboWhenComboRemainGoesToZero{
    //printf("beforeLoseComboWhenComboRemainGoesToZero\n");
    if(currentCombo >= 5){
        printf("REDUCE from beforeLoseComboWhenComboRemainGoesToZero\n");
        comboReduceSpeedAccum -= 0.005;
        if(comboReduceSpeedAccum < -0.01){
            comboReduceSpeedAccum = -0.01;
        }
        comboReduceSpeedAccumSpeed = -comboReduceSpeedAccum;
    }
    
}

@end
