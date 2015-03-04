//
//  Mini01.m
//  BombTheTurtle
//
//  Created by  on 2012/4/13.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "Mini01.h"

#import "animationDefs.h"
#import "GamePlayGlobal.h"
#import "Turtle.h"
#import "Global.h"


@implementation Mini01

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

-(void) reInitColorComboLimit{
    
    // printf("reInitColorComboLimit:%i\n",gameLevel);
    
    if(gameLevel == 5){
        timeToBeGained = 4;
    }

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
    }
    
    if(gameLevel == 6){
        comboColorLimit[0] = 0;
        comboColorLimit[1] = 25;
        comboColorLimit[2] = 40;
        comboColorLimit[3] = 60;
        comboColorLimit[4] = 80;
        comboColorLimit[5] = 100;
        comboColorLimit[6] = 120;
        comboColorLimit[7] = 140;
        comboColorLimit[8] = 160;
        comboColorLimit[9] = 180;
        comboColorLimit[10] = 200;
    }
      
}


-(void) updateGameLevel{
    // printf("updateGameLevel:%i\n",gameRound);
    //------------------GAME LEVEL MAX = 7-----------------------------//
    
    if(gameRound < 10){
        gameLevel = 0;
    }else if(gameRound < 30){
        gameLevel = 1;
    }else if(gameRound < 60){
        gameLevel = 2;
    }else if(gameRound < 90){
        gameLevel = 3;
    }else if(gameRound < 120){
        gameLevel = 4;
    }else if(gameRound < 160){
        gameLevel = 5;
    }else if(gameRound < 200){
        gameLevel = 6;
    }else if(gameRound < 250){
        gameLevel = 7;
    }else if(gameRound < 300){
        gameLevel = 9;
    }
    
    if(gameRound < 10){
        comoboReduceSpeed = comboReduceSpeedAccum + 0.006;
    }else if(gameRound < 30){
        comoboReduceSpeed = comboReduceSpeedAccum + 0.006;
    }else if(gameRound < 60){
        comoboReduceSpeed = comboReduceSpeedAccum + 0.007;
    }else if(gameRound < 100){
        comoboReduceSpeed = comboReduceSpeedAccum + 0.009;
    }else if(gameRound < 130){
        comoboReduceSpeed = comboReduceSpeedAccum + 0.01;
    }else if(gameRound < 160){
        comoboReduceSpeed = comboReduceSpeedAccum + 0.011;
    }else if(gameRound < 200){
        comoboReduceSpeed = comboReduceSpeedAccum + 0.012;
    }else if(gameRound < 230){
        comoboReduceSpeed = comboReduceSpeedAccum + 0.0135;
    }else if(gameRound < 260){
        comoboReduceSpeed = comboReduceSpeedAccum + 0.015;
    }else if(gameRound < 300){
        comoboReduceSpeed = comboReduceSpeedAccum + 0.017;
    }else if(gameRound < 350){
        comoboReduceSpeed = comboReduceSpeedAccum + 0.02;
    }else if(gameRound < 400){
        comoboReduceSpeed = comboReduceSpeedAccum + 0.0225;
    }else if(gameRound < 450){
        comoboReduceSpeed = comboReduceSpeedAccum + 0.025;
    }else if(gameRound < 500){
        comoboReduceSpeed = comboReduceSpeedAccum + 0.03;
    }
 
    if(comboReduceSpeedAccum < 0){
        comboReduceSpeedAccum += comboReduceSpeedAccumSpeed/50;  //0.003/30
    }else{
        comboReduceSpeedAccum = 0;
    }
    
    if(comoboReduceSpeed < 0.006){
        comoboReduceSpeed = 0.006;
    }
    
    [self reInitColorComboLimit];
    
   // printf("updateGameLevel:%i %i %i %4.8f %4.8f %4.8f\n",gameLevel,gameRound, gameRoundFromBegin, comboReduceSpeedAccum, comoboReduceSpeed, comboReduceSpeedAccumSpeed);
    

    //game level can't = 8 , will 3-3nd shell repeat//
    //------------------GAME LEVEL MAX = 7-----------------------------//
}


// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
        
        maxTime = 40;
        timeRemain = maxTime;
        timeToBeGained = 3.5;
        
         s_bg = [CCSprite spriteWithFile:@"mini_01_bg.png"];
        [s_bg setPosition:ccp([UIScreen mainScreen].bounds.size.height/2, [UIScreen mainScreen].bounds.size.width/2)];
		[self addChild:s_bg];
        
       // wholeTurtleScaleFromSocurce = 0.25;
		wholeTurtleScaleFromSocurce = 0.5;
        maxTurtleOnScreen = 3;
        
        [self initCharacters];
        

        gameLevel = 0;
        numberTapToNextRound = 0;
        remainTapToNextRound = 0;
        
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
    
     float startX = 105;
     float startY = 60;
     float offsetX = 150;
     float offsetY = 100;
    
    if(isIphone5){
        startX = 105 + 44;
    }
    
    if(isIpad){
         startX = 210;
         startY = 200;
         offsetX = 150 * 2;
         offsetY = 100 * 2;
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
    
    [turtle[3] setX:startX];
    [turtle[3] setY:startY+offsetY];
    [turtle[3] setStatus:kTurtleAniStatus_Normal_In];
    
    [turtle[4] setX:startX + offsetX];
    [turtle[4] setY:startY+offsetY];
    [turtle[4] setStatus:kTurtleAniStatus_Normal_In];
    
    [turtle[5] setX:startX + offsetX*2];
    [turtle[5] setY:startY+offsetY];
    [turtle[5] setStatus:kTurtleAniStatus_Normal_In];
    
    [turtle[0] setBombOutType:kTurtleBombOutType_backToOri];
    [turtle[1] setBombOutType:kTurtleBombOutType_backToOri];
    [turtle[2] setBombOutType:kTurtleBombOutType_backToOri];
    [turtle[3] setBombOutType:kTurtleBombOutType_backToOri];
    [turtle[4] setBombOutType:kTurtleBombOutType_backToOri];
    [turtle[5] setBombOutType:kTurtleBombOutType_backToOri];
    
    /*[turtle[0] setFacingRight:true];
    [turtle[1] setFacingRight:true];
    [turtle[2] setFacingRight:true];
    [turtle[3] setFacingRight:true];
    [turtle[4] setFacingRight:true];
    [turtle[5] setFacingRight:true];*/
    
    [turtle[0] setDelegate:self];
    [turtle[1] setDelegate:self];
    [turtle[2] setDelegate:self];
    [turtle[3] setDelegate:self];
    [turtle[4] setDelegate:self];
    [turtle[5] setDelegate:self];
    
    [turtle[0] setIdNumber:0];
    [turtle[1] setIdNumber:1];
    [turtle[2] setIdNumber:2];
    [turtle[3] setIdNumber:3];
    [turtle[4] setIdNumber:4];
    [turtle[5] setIdNumber:5];
}

-(void) manage:(ccTime) dt{
    //printf("comboRemain:%4.8f\n",comboRemain);
   // printf("currentTurtleOnScreen:%i %i\n",currentTurtleOnScreen,maxTurtleOnScreen);
  //  printf("A1:%i  ",remainTapToNextRound);
    [self manageRemainTapToNextStep];
  // printf("A2:%i  ",remainTapToNextRound);
    [self manageMini04Type:dt];
  //printf("A3:%i  ",remainTapToNextRound);
    
    for ( int i = 0 ; i < 6 ; i++){
       // printf("AAI:%i %4.8f\n",i,momentRunTime[i]);
        
        [turtle[i] manage:dt];
      // printf("D1:%i  ",remainTapToNextRound);
        
        if([turtle[i] status] == kTurtleAniStatus_Normal_Out){
            if(arc4random() % 50 == 0){
                [turtle[i] setStatus:kTurtleAniStatus_Idle];
            }  
        }
    // printf("D2:%i  ",remainTapToNextRound);
    }
   //printf("E1:%i  ",remainTapToNextRound);
}

- (void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [super ccTouchesBegan:touches withEvent:event];
    
    if(isTapWronglyAndDisableBtns){
        return;
    }
    
    if(isStopping){
        return;
    }
    
    if(isFuckingShootFirstTime){
        isFuckingShootFirstTime = false;
        return;
    }
    
	for( UITouch *touch in touches ) {
		CGPoint location = [touch locationInView: [touch view]];
		location = [[CCDirector sharedDirector] convertToGL: location];
        
          /*  if(currentCombo < 10){
                turtleCoinShinning_angleSpeed += 0.3;
            }else{
                turtleCoinShinning_angleSpeed += 0.5;
            }
            [uILayer gainCombo:1];*/

        static bool fuxkHasTapTurtle;
        fuxkHasTapTurtle = false;
        
        for(int i = 0 ; i < 6 ; i++){
            static float fuxkTurtleAtX;
            static float fuxkTurtleAtY;
            static float fuxkTurtleLeft;
            static float fuxkTurtleRight;
            static float fuxkTurtleUp;
            static float fuxkTurtleDown;
            
            fuxkTurtleAtX = [turtle[i] x];
            fuxkTurtleAtY = [turtle[i] y];
            fuxkTurtleLeft = wholeTurtleScaleFromSocurce * 2 * turtle_detectHalfLeft;
            fuxkTurtleRight = wholeTurtleScaleFromSocurce * 2 * turtle_detectHalfRight;
            fuxkTurtleUp = wholeTurtleScaleFromSocurce * 2 * turtle_detectHalfUp;
            fuxkTurtleDown = wholeTurtleScaleFromSocurce * 2 * turtle_detectHalfDown;
            
            //printf("ll:%4.8f %4.8f %4.8f %4.8f\n",location.x, location.y, fuxkTurtleAtX, fuxkTurtleAtY);
            
           
            if(location.x > fuxkTurtleAtX - fuxkTurtleLeft  && location.x < fuxkTurtleAtX + fuxkTurtleRight){
                if(location.y > fuxkTurtleAtY - fuxkTurtleDown  && location.y < fuxkTurtleAtY + fuxkTurtleUp){
                   // printf("turtle is tap:%i\n",i);
                    [turtle[i] tap];
                    fuxkHasTapTurtle = true;
                    
                    [self updateGameLevel];
                }
            }
            
        }
        
        if(!fuxkHasTapTurtle){
           // printf("loseCombo FuckNOTTAP\n");
           // [uILayer lostCombo];
        }
    }
}

-(void) initComboColorLimit{
    comboColorLimit[0] = 0;
    comboColorLimit[1] = 15;
    comboColorLimit[2] = 30;
    comboColorLimit[3] = 60;
    comboColorLimit[4] = 90;
    comboColorLimit[5] = 120;
    comboColorLimit[6] = 150;
    comboColorLimit[7] = 180;
    comboColorLimit[8] = 200;
    comboColorLimit[9] = 250;
    comboColorLimit[10] = 300;
    
    comboColorLimit[1] = 11;
}


-(void) giveNextMoment{
    //printf("giveNextMoment:%i\n",gameRound);
    
    //[self updateGameLevel];
    
    // gameLevel = 2;
    
    for(int i = 0 ; i < 6 ; i++){
        shellGoingToMoment[i] = -1;
    }
    


    static int ranShellLevel;
    static int maxTurtleCount;
    static int turtleNumbers;
    
    for(int i = 0 ; i < 6 ; i++){
        shell_Check[i] = -1;
    }
    
    turtleNumbers = 0;
    maxTurtleCount = gameLevel+1; //5
    
    static int gotFuckedTime;
    gotFuckedTime = 0;
    do{
        static bool innerFuck;
        do{
            innerFuck = false;
            
            ranShellLevel = arc4random()%3;
           // printf("first ran:%i gofuckTIme:%i\n", ranShellLevel, gotFuckedTime);
            
            if(gameLevel == 1){
                ranShellLevel = 0;
            }
            
            if(gameLevel == 2){
                if(arc4random() % 100 < 80){
                    ranShellLevel = 0;
                }else{
                    ranShellLevel = 1;
                }
            }
            
            if(gameLevel == 6  && gotFuckedTime < 1){
                ranShellLevel = 1;
                gotFuckedTime++;
            }
            if(gameLevel == 7  && gotFuckedTime < 1){
                ranShellLevel = 2;
                gotFuckedTime++;
            }
            
            if(gameLevel >= 8 && gotFuckedTime < 2){
              //  printf("MUST 2nd\n");
                ranShellLevel = 2;
                gotFuckedTime ++;
                
            }
            
        }while(innerFuck);
        
       // printf("T1:%i %i %i\n",turtleNumbers, ranShellLevel, maxTurtleCount);
        maxTurtleCount -= ranShellLevel + 1;
        if(maxTurtleCount < 0){
            ranShellLevel = maxTurtleCount + ranShellLevel;
        }
        
        shell_Check[turtleNumbers] = [self genNextTargetMoment:-1 shellLevel:ranShellLevel NS1:shell_Check[0] NS2:shell_Check[1] NS3:shell_Check[2] NS4:shell_Check[3] NS5:shell_Check[4] NS6:shell_Check[5]]; 
       // printf("T2:%i %i %i\n",turtleNumbers, ranShellLevel, maxTurtleCount);
        turtleNumbers++;
        
    }while(maxTurtleCount > 0);

    
    if(shell_Check[0] < -1 || shell_Check[1] < -1 || shell_Check[2] < -1 || shell_Check[3] < -1 || shell_Check[4] < -1 || shell_Check[5] < -1){
        newestMomentHasAppearedTime = nextMomentAppearTime - 0.05; 
    }else{
        numberTapToNextRound = turtleNumbers;
        remainTapToNextRound += turtleNumbers;
       // printf("TT:%i\n",remainTapToNextRound);
    }

    for(int i = 0 ; i < 6 ; i++){
       // printf("shellGoingToMoment[i]:%i %i\n",i,shellGoingToMoment[i]);
        if(shellGoingToMoment[i] < 0){
            //return;
        }else{
          //  printf("III:%i %i\n",i,shellGoingToMoment[i]);
            
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

-(void) getScript{
    if(gameLevel == 0){
        nextMomentAppearTime = 8;
    }
    
  //  printf("get Script\n");
    nextMomentAppearTime = 40000;
}

-(void) turtleBombed:(int)_momentIdx{
    [super turtleBombed:_momentIdx];
    //remainTapToNextRound--;
    //counterForAchivement++;
}


-(void) manageRemainTapToNextStep{
   // printf("manageRemainTapToNextStep:%i\n",remainTapToNextRound);
    if(remainTapToNextRound == 0 && !isFuxking){
      //  printf("CCCCCCCCCCCCCCCCCC:%4.8f %4.8f\n",nextMomentAppearTime, newestMomentHasAppearedTime);
        
        if(nextMomentAppearTime - newestMomentHasAppearedTime > 0.05){
          //  printf("AAAAAAAAAAAAAAAAAAA\n");
            newestMomentHasAppearedTime = nextMomentAppearTime - 0.05; 
        }
        //printf("BBBBBBBBBBBBBBBBBBBBBBBBBBB\n");
    
    }
}


-(int) genNextTargetMoment:(int)_shellStandPosition shellLevel:(int)_shellLevel NS1:(int)_NS1 NS2:(int)_NS2 NS3:(int)_NS3 NS4:(int)_NS4 NS5:(int)_NS5 NS6:(int)_NS6{
    if(_shellStandPosition < -100){
        printf("fuck you all genNextTargetMoment\n");
        return -1000;
    }
    
    //printf("genNextTargetMoment\n");
    
    /*hasNoticedOverTime[recentMomentIdx] = false;
     momentRunTime[recentMomentIdx] = 0;
     momentOverTime[recentMomentIdx] = 6;*/
    
    isFuxking = false;
    
    static bool hasColide;
    static int momentTargetCheck;
    static int hasColideTimes;
    
    hasColideTimes = 0;
    do{
        hasColideTimes++;
        hasColide = false;
        

        momentTargetCheck = arc4random()%6;
        
        for(int j = 0 ; j < maxMoment ; j++){
            if(momentRunTime[j] > 0){
                if(momentTarget[j] == momentTargetCheck){
                    hasColide = true;
                }
            }
        }
        
        if(hasColideTimes > 100){
           // printf("colide too many\n");
            hasColide = false;
            for(int i = 0 ; i < 6 ; i++){
                shellGoingToMoment[i] = -1;
            }
            return -200;
        }
        
        if(momentTargetCheck < 0 || momentTargetCheck > 5){
            hasColide = true;
        }else{
            if([turtle[momentTargetCheck] status] != kTurtleAniStatus_Normal_In){
                hasColide = true;
            }
        }
        
        if(momentTargetCheck == _NS1 || momentTargetCheck == _NS2 || momentTargetCheck == _NS3 || momentTargetCheck == _NS4 || momentTargetCheck == _NS5 || momentTargetCheck == _NS6){
            hasColide = true;
        }
        
        
    }while(hasColide);
    
    //printf("momentTargetCheck:%i %i\n",momentTargetCheck, recentMomentIdx);

    
    shellGoingToMoment[momentTargetCheck] = 1;
    shellLevelGoingToMoment[momentTargetCheck] = _shellLevel;
    
    
   // printf("return momentTargetCheck:%i\n",momentTargetCheck);
    return momentTargetCheck;
    
}

-(void) thisMomentOverTime:(int)_momentIdx{
    //printf("this moment over time:%i %i\n",_momentIdx, momentTarget[_momentIdx]);
    [turtle[momentTarget[_momentIdx]] setStatus:kTurtleAniStatus_In];
    gameRound--;
    if(gameRound < 0){
        gameRound = 0;
    }
    remainTapToNextRound--;
    

    
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
    
	[super dealloc];
}


-(void) tapWrongly{
    [super tapWrongly];
    
    static bool hasPlayedBigBomb;
    hasPlayedBigBomb = false;
    //printf("tapWrongly\n");
    
    if(currentCombo >= 5){
        printf("REDUCE from tap Wrongly\n");
        comboReduceSpeedAccum -= 0.005;
        if(comboReduceSpeedAccum < -0.01){
            comboReduceSpeedAccum = -0.01;
        }
        comboReduceSpeedAccumSpeed = -comboReduceSpeedAccum;
    }
    
    for(int i = 0 ; i < maxMoment ; i++){
        if(momentRunTime[i] > 0){
            [turtle[momentTarget[i]] setStatus:kTurtleAniStatus_In];
            momentRunTime[i] = -9999;

            if(!hasPlayedBigBomb){
                hasPlayedBigBomb = true;
                printf("setToBombingGameover from mini01\n");
                [playLayer setToBombingGameover];
            }
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
