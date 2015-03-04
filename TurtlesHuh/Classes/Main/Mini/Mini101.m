//
//  Mini101.m
//  TurtlesHuh
//
//  Created by apple on 12/10/29.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "Mini101.h"
#import "GamePlayGlobal.h"
#import "Global.h"

@implementation Mini101

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
}

-(void) updateGameLevel{
    // printf("updateGameLevel:%i\n",gameRound);
    //------------------GAME LEVEL MAX = 7-----------------------------//
    
    return;
    
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
    
  //  [self reInitColorComboLimit];
    
    // printf("updateGameLevel:%i %i %i %4.8f %4.8f %4.8f\n",gameLevel,gameRound, gameRoundFromBegin, comboReduceSpeedAccum, comoboReduceSpeed, comboReduceSpeedAccumSpeed);
    
    
    //game level can't = 8 , will 3-3nd shell repeat//
    //------------------GAME LEVEL MAX = 7-----------------------------//
}


-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
        
        //newestMomentHasAppearedTime = 4;
        
        maxTime = 6000;
        timeRemain = maxTime;
        
        
        s_bg = [CCSprite spriteWithFile:@"mini_04_bg.png"];
        [s_bg setPosition:ccp(240,160)];
		[self addChild:s_bg];
        
		wholeTurtleScaleFromSocurce = 0.435;
        wholePenguinScaleFromSocurce = 0.5;
        
             maxBubbles = 15;
        bubbleAppearedTimer = 999;
        
        maxTurtleOnScreen = 3;
        
        
        gameLevel = 0;
        genScriptTimer = 99999;
        
        howmanyTaps = 0;
 
        [self initCharacters];
        [self initExtraGraphics];
        [self initBubbles];
        
        [self genScript];
        
        [self resetTap];

    }
	return self;
}

-(void) initBubbles{
    maxBubbles = 15;
    
    for(int i = 0 ; i < maxBubbles ; i++){
        s_Bubble[i] = [CCSprite spriteWithTexture:ss_Extra.texture rect:CGRectMake(304/2,0/2,31/2,31/2)];
        
        [ss_Extra addChild:s_Bubble[i]];
        
        [s_Bubble[i] setPosition:ccp(10000,10000)];
    }
}

-(void) resetThisTurtleShell:(int)_shellIdx{
    turtleType[_shellIdx] = 0;
    turtleShellLevel[_shellIdx] = 2;
    turtleShellOriLevel[_shellIdx] = turtleShellLevel[_shellIdx];
    turtleShellY[_shellIdx] = seaLevel;
    turtleShellIsAni[_shellIdx] = false;
    turtleShellAppearTime[_shellIdx] = 99999;
    turtleShellHasTapTimer[_shellIdx] = 0;
    turtleShellHasTapped[_shellIdx] = false;
    
    hasGenTimer[_shellIdx] = 0;
    generalCharacterScale[_shellIdx] = 0;
}

-(void) initCharacters{
    generalTurtleDetectOffset = 11;
    shellRadiusDetect = 40;
    
   //generalTurtleDetectOffset = 1;
   // shellRadiusDetect = 90;
    
    totalTurtleShell = 50;
    shellIdx = 1;
    gameLevel = 0;
    for(int i = 0 ; i < totalTurtleShell ; i++){
        turtleShell[i] = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(0,0,0,0)];
        [ss_Character addChild:turtleShell[i] z:i];
        
         isTapTurtleShell[i] = false;
        
        turtleShellIsColliding[i] = false;
        turtleShellCollidingTimer[i] = 0;
    }
   
    
    seaLevel = 100;
    
    
    for(int i = 0 ; i < totalTurtleShell ; i++){
        turtleType[i] = 0;
        turtleShellLevel[i] = 2;
        turtleShellOriLevel[i] = turtleShellLevel[i];
        turtleShellY[i] = seaLevel;
        turtleShellIsAni[i] = false;
        turtleShellAppearTime[i] = 99999;
        turtleShellHasTapTimer[i] = 0;
        turtleShellHasTapped[i] = false;
        
        turtleShellCanbeDestroyed[i] = true;
        thisCharacterScale[i] = 1.15;
    }
  
    turtleShellCanbeDestroyed[0] = true;
}


-(void) initExtraGraphics{
    // ss_Extra  = [CCSpriteBatchNode spriteSheetWithFile:@"mini_04_extraTexture.png" capacity:1];
    // [self addChild:ss_Extra z:kDeapth_ssExtra];
    
    s_sea = [CCSprite spriteWithTexture:ss_Extra.texture rect:CGRectMake(0/2,128/2,1060/2,202/2)];
    
    [ss_Extra addChild:s_sea];
    [s_sea setAnchorPoint:ccp(0,0.5)];
    [s_sea setPosition:ccp(0,50)];
    
}

-(void) setScript{
    printf("setScript:%i\n",gameLevel);
   /* for(int i = 0 ; i < totalTurtleShell ; i++){
        turtleType[i] = 0;
        turtleShellLevel[i] = 2;
        turtleShellOriLevel[i] = turtleShellLevel[i];
        turtleShellY[i] = seaLevel;
        turtleShellIsAni[i] = false;
        turtleShellAppearTime[i] = 99999;
        turtleShellHasTapTimer[i] = 0;
        turtleShellHasTapped[i] = false;
    }*/
    
   // generalCharacterScale = 0;
   // hasGenTimer = 0;
    thisLevelTimer = 0;
    howmanyTurtleIsDestroyedInThisLevel = 0;
    tapIdx = 1;
    
    for(int i = 0 ; i < totalTurtleShell ; i++){
        [self resetThisTurtleShell:i];
    }
    
    if(gameLevel == 0){
        
       /* howmanyShellInThisLevel = 1;
        
        turtleShellX[shellIdx] = 240;
        turtleShellAppearTime[shellIdx] = 0;
        turtleShellY[shellIdx] += 0;
        turtleShellLevel[shellIdx] = 4;
        turtleShellOriLevel[shellIdx] = turtleShellLevel[shellIdx];
        [self setTurtleTexture:shellIdx];
        [self nextShellIdx];*/
        
       /* howmanyShellInThisLevel = 3;
        
        [self resetThisTurtleShell:shellIdx];
        turtleShellX[shellIdx] = 120;
        turtleShellAppearTime[shellIdx] = 0;
        turtleShellY[shellIdx] += 0;
        turtleShellLevel[shellIdx] = 2;
        turtleShellOriLevel[shellIdx] = turtleShellLevel[shellIdx];
        [self setTurtleTexture:shellIdx];
        [self nextShellIdx];
        
        [self resetThisTurtleShell:shellIdx];
        turtleShellX[shellIdx] = 240;
        turtleShellAppearTime[shellIdx] = 0;
        turtleShellY[shellIdx] += 20;
        turtleShellLevel[shellIdx] = 2;
        turtleShellOriLevel[shellIdx] = turtleShellLevel[shellIdx];
        [self setTurtleTexture:shellIdx];
        [self nextShellIdx];
        
        [self resetThisTurtleShell:shellIdx];
        turtleShellX[shellIdx] = 360;
        turtleShellAppearTime[shellIdx] = 0;
        turtleShellY[shellIdx] += 40;
        turtleShellLevel[shellIdx] = 2;
        turtleShellOriLevel[shellIdx] = turtleShellLevel[shellIdx];
        [self setTurtleTexture:shellIdx];
        [self nextShellIdx];*/
        
        howmanyShellInThisLevel = 30;
        
        //[self resetThisTurtleShell:0];
        turtleShellX[0] = 240;
        turtleShellAppearTime[0] = 0;
        turtleShellY[0] += 0;
        turtleShellLevel[0] = 4;
        turtleShellOriLevel[0] = turtleShellLevel[0];
        [self setTurtleTexture:0];
        
        for(int j = 1 ; j < howmanyShellInThisLevel ; j++){
            static float ranX;
            static float ranY;
            static float ranVX;
            static float ranVY;
            static int ranNumber;
            
            ranNumber = arc4random()%100;
            ranX = 50.0 + 430.0 * (float)ranNumber/100.0;
            
            ranNumber = arc4random()%100;
            ranY = 101.0 + + 25.0 * (float)ranNumber/100.0;
            
            ranNumber = arc4random()%100;
            ranVX = -25.0 + 50.0 * (float)ranNumber/100.0;
            
            ranNumber = arc4random()%100;
            ranVY = (100 - ranY)/15.0;
            
            turtleShellY[shellIdx] = ranY;
            turtleShellX[shellIdx] = ranX;
            turtleShellVX[shellIdx] = ranVX;
            turtleShellVY[shellIdx] = ranVY;
            turtleShellVR[shellIdx] = turtleShellVX[shellIdx]/1.0;
            
            //[self resetThisTurtleShell:shellIdx];
            turtleShellX[shellIdx] = 240;
            turtleShellAppearTime[shellIdx] = 0;
            turtleShellY[shellIdx] += j*5;
            turtleShellLevel[shellIdx] = 2;
            turtleShellOriLevel[shellIdx] = turtleShellLevel[shellIdx];
            [self setTurtleTexture:shellIdx];
            [self nextShellIdx];
        } 
        
    }
    
    if(gameLevel == 1){
        [self resetThisTurtleShell:shellIdx];
        turtleShellX[shellIdx] = 120;
        turtleShellAppearTime[shellIdx] = 0;
        turtleShellY[shellIdx] += 0;
        turtleShellLevel[shellIdx] = 2;
        turtleShellOriLevel[shellIdx] = turtleShellLevel[shellIdx];
        [self setTurtleTexture:shellIdx];
        [self nextShellIdx];

    }
     printf("END genScript:%i gamelevel:%i\n",shellIdx, gameLevel);

}

-(void) setTurtleTexture:(int)_shellIdx{
    if(turtleShellOriLevel[_shellIdx] == 2){
        if(turtleShellLevel[_shellIdx] == 2){
            [turtleShell[_shellIdx] setTextureRect:CGRectMake(1938/2,380/2,108/2,76/2)];
        }
        if(turtleShellLevel[_shellIdx] == 1){
            [turtleShell[_shellIdx] setTextureRect:CGRectMake(1816/2,380/2,108/2,76/2)];
        }
    }
    if(turtleShellOriLevel[_shellIdx] == 3){
        if(turtleShellLevel[_shellIdx] == 3){
            [turtleShell[_shellIdx] setTextureRect:CGRectMake(1700/2,380/2,108/2,86/2)];
        }
        if(turtleShellLevel[_shellIdx] == 2){
            [turtleShell[_shellIdx] setTextureRect:CGRectMake(1058/2,370/2,108/2,76/2)];
        }
        if(turtleShellLevel[_shellIdx] == 1){
            [turtleShell[_shellIdx] setTextureRect:CGRectMake(1816/2,380/2,108/2,76/2)];
        }
    }
    if(turtleShellOriLevel[_shellIdx] == 4){
        if(turtleShellLevel[_shellIdx] == 4){
            [turtleShell[_shellIdx] setTextureRect:CGRectMake(836/2,370/2,108/2,86/2)];
        }
        if(turtleShellLevel[_shellIdx] == 3){
            [turtleShell[_shellIdx] setTextureRect:CGRectMake(504/2,370/2,108/2,76/2)];
        }
        if(turtleShellLevel[_shellIdx] == 2){
            [turtleShell[_shellIdx] setTextureRect:CGRectMake(614/2,370/2,108/2,76/2)];
        }
        if(turtleShellLevel[_shellIdx] == 1){
            [turtleShell[_shellIdx] setTextureRect:CGRectMake(724/2,370/2,108/2,76/2)];
        }
    }
}

-(void) genScript{
    //printf("genScript\n");
    genScriptTimer = 2;
    
    /*if(gameRound >= 1){
        gameLevel = 1;
    }*/
}

-(void) nextShellIdx{
    shellIdx++;
    if(shellIdx == totalTurtleShell){
        shellIdx = 1;
    }
}

-(void) runScript{
    genScriptTimer--;
    if(genScriptTimer == 0){
        [self setScript];
    }
    
    for(int i = 0 ; i < totalTurtleShell ; i++){
        turtleShellAppearTime[i]--;
      //  printf("Timer:%i %i\n",i,turtleShellAppearTime[i]);
        if(turtleShellAppearTime[i] == -1){
           // printf("AppeAR:%i\n",i);
            turtleShellIsAni[i] = true;
            if(turtleType[i] == 0){
                [playLayer setToShakingBomb:turtleShellX[i] turtleY:turtleShellY[i]];
               // [turtleShell[i] setTextureRect:CGRectMake(396/2,204/2,108/2,70/2)];
            }
        }
    }
}

-(void) resetTap{
    isTapping = false;
    tapIdx = 0;
    
    for(int i = 0 ; i < totalTurtleShell ; i++){
        tapIdxsStore[i] = -1;
    }
}

-(void) manage:(ccTime) dt{
    if(isTapping){
        static int topTapIdx;
        static int currentTestingTapIdx;
        topTapIdx = tapIdxsStore[0];
        
        currentTestingTapIdx = 0;
        
       /* for(int i = 0 ; i < totalTurtleShell ; i++){
            printf("tapIdxsStore:%i %i %4.8f\n",i,tapIdxsStore[i], tapDiffXStore[i]);
        }*/
        
        
        if(tapIdxsStore[1] >= 0){
            do{
                static int nextDeapth;
                static int recentDeapth;
                static int nextTapIdx;
                static int recentTapIdx;
                
                recentTapIdx = tapIdxsStore[currentTestingTapIdx];
                nextTapIdx = tapIdxsStore[currentTestingTapIdx+1];
                
               // printf("recentTapIdx:%i next:%i\n",recentTapIdx,nextTapIdx);
                
                if(recentTapIdx >= 0 && nextTapIdx >= 0){
                    
                    nextDeapth = [turtleShell[nextTapIdx] zOrder];
                    recentDeapth = [turtleShell[recentTapIdx] zOrder];
                    
                    if(nextDeapth > recentDeapth){
                        topTapIdx = nextTapIdx;
                    }
                } 
                
              //  printf("recentTapDeapth:%i next:%i\n",recentDeapth,nextDeapth);
                
                currentTestingTapIdx++;
            }while(tapIdxsStore[currentTestingTapIdx+1] >= 0 && currentTestingTapIdx < howmanyShellInThisLevel - 1);
        }
        
        [self REALtapTurtleShell:topTapIdx fuckDiffX:tapDiffXStore[topTapIdx]];
       
        
        [self resetTap];
    }
    
    [self runScript];
    [self manageTurtlePhysics];
    [self manageBubbles];
    [self manageGneralCharacter];
   // [self manageCollisions];

    seaOffestX += (seaOffsestFinalX - seaOffestX)/100;
    [s_sea setPosition:ccp(seaOffestX, 50)];
    
    for(int i = 0 ; i < totalTurtleShell ; i++){
        if(turtleShellIsColliding[i]){
            turtleShellCollidingTimer[i]++;
            turtleShellIsColliding[i] = false;
        }else{
            turtleShellCollidingTimer[i]=0;
        }
    }
}

-(void) manageGneralCharacter{
    for(int i = 0 ; i < totalTurtleShell ; i++){
        if(hasGenTimer[i] < 10){
            generalCharacterScale[i] += 0.13;
        }else{
            generalCharacterScale[i] += ( 1 - generalCharacterScale[i])/5;
        }
        
        hasGenTimer[i]++;
    }
    

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

-(void) manageCollisions{
    for(int i = 0 ; i < totalTurtleShell ; i++){
        //check for collision
        for(int j = 0 ; j < totalTurtleShell ; j++){
            if(i != j){
                
                static float turtleToTurtleRadius = 53;
                
                fuxkDistanceDiffX = turtleShellX[i] - generalTurtleDetectOffset * cos(turtleShellRotation[i] * M_PI/180) -
                turtleShellX[j] - generalTurtleDetectOffset * cos(turtleShellRotation[j] * M_PI/180);
                fuxkDistanceDiffY = turtleShellY[i] + generalTurtleDetectOffset * sin(turtleShellRotation[i] * M_PI/180) -
                turtleShellY[j] + generalTurtleDetectOffset * sin(turtleShellRotation[j] * M_PI/180);
                fuxkDistanceDiff = sqrtf(fuxkDistanceDiffX*fuxkDistanceDiffX + fuxkDistanceDiffY*fuxkDistanceDiffY);
                
                if(fuxkDistanceDiff < turtleToTurtleRadius){
                    turtleShellDetectIdx[i] = 0;
                    turtleShellDetectIdx[j] = 0;
                    [self collisionOn:i obj1:j];
                    printf("A:%i %i---------------------------------------\n",i,j);
                }else{
                    
                    fuxkDistanceDiffX = turtleShellX[i] - generalTurtleDetectOffset * cos(turtleShellRotation[i] * M_PI/180) -
                    turtleShellX[j] + generalTurtleDetectOffset * cos(turtleShellRotation[j] * M_PI/180);
                    fuxkDistanceDiffY = turtleShellY[i] + generalTurtleDetectOffset * sin(turtleShellRotation[i] * M_PI/180) -
                    turtleShellY[j] - generalTurtleDetectOffset * sin(turtleShellRotation[j] * M_PI/180);
                    fuxkDistanceDiff = sqrtf(fuxkDistanceDiffX*fuxkDistanceDiffX + fuxkDistanceDiffY*fuxkDistanceDiffY);
                    
                    
                    if(fuxkDistanceDiff < turtleToTurtleRadius){
                        turtleShellDetectIdx[i] = 0;
                        turtleShellDetectIdx[j] = 1;
                        [self collisionOn:i obj1:j];
                        printf("B:%i %i---------------------------------------\n",i,j);
                    }else{
                        
                        fuxkDistanceDiffX = turtleShellX[i] - generalTurtleDetectOffset * cos(turtleShellRotation[i] * M_PI/180) -
                        turtleShellX[j];
                        fuxkDistanceDiffY = turtleShellY[i] + generalTurtleDetectOffset * sin(turtleShellRotation[i] * M_PI/180) -
                        turtleShellY[j];
                        fuxkDistanceDiff = sqrtf(fuxkDistanceDiffX*fuxkDistanceDiffX + fuxkDistanceDiffY*fuxkDistanceDiffY);
                        
                        if(fuxkDistanceDiff < turtleToTurtleRadius){
                            turtleShellDetectIdx[i] = 0;
                            turtleShellDetectIdx[j] = 2;
                            [self collisionOn:i obj1:j];
                            printf("C:%i %i---------------------------------------\n",i,j);
                        }else{
                            
                            fuxkDistanceDiffX = turtleShellX[i] + generalTurtleDetectOffset * cos(turtleShellRotation[i] * M_PI/180) -
                            turtleShellX[j] - generalTurtleDetectOffset * cos(turtleShellRotation[j] * M_PI/180);
                            fuxkDistanceDiffY = turtleShellY[i] - generalTurtleDetectOffset * sin(turtleShellRotation[i] * M_PI/180) -
                            turtleShellY[j] + generalTurtleDetectOffset * sin(turtleShellRotation[j] * M_PI/180);
                            fuxkDistanceDiff = sqrtf(fuxkDistanceDiffX*fuxkDistanceDiffX + fuxkDistanceDiffY*fuxkDistanceDiffY);
                            
                            if(fuxkDistanceDiff < turtleToTurtleRadius){
                                turtleShellDetectIdx[i] = 1;
                                turtleShellDetectIdx[j] = 0;
                                [self collisionOn:i obj1:j];
                                printf("D:%i %i---------------------------------------\n",i,j);
                            }else{
                                
                                fuxkDistanceDiffX = turtleShellX[i] + generalTurtleDetectOffset * cos(turtleShellRotation[i] * M_PI/180) -
                                turtleShellX[j] + generalTurtleDetectOffset * cos(turtleShellRotation[j] * M_PI/180);
                                fuxkDistanceDiffY = turtleShellY[i] - generalTurtleDetectOffset * sin(turtleShellRotation[i] * M_PI/180) -
                                turtleShellY[j] - generalTurtleDetectOffset * sin(turtleShellRotation[j] * M_PI/180);
                                fuxkDistanceDiff = sqrtf(fuxkDistanceDiffX*fuxkDistanceDiffX + fuxkDistanceDiffY*fuxkDistanceDiffY);
                                
                                if(fuxkDistanceDiff < turtleToTurtleRadius){
                                    turtleShellDetectIdx[i] = 1;
                                    turtleShellDetectIdx[j] = 1;
                                    [self collisionOn:i obj1:j];
                                    printf("E:%i %i---------------------------------------\n",i,j);
                                }else{
                                    fuxkDistanceDiffX = turtleShellX[i] + generalTurtleDetectOffset * cos(turtleShellRotation[i] * M_PI/180) -
                                    turtleShellX[j];
                                    fuxkDistanceDiffY = turtleShellY[i] - generalTurtleDetectOffset * sin(turtleShellRotation[i] * M_PI/180) -
                                    turtleShellY[j];
                                    fuxkDistanceDiff = sqrtf(fuxkDistanceDiffX*fuxkDistanceDiffX + fuxkDistanceDiffY*fuxkDistanceDiffY);
                                    
                                    if(fuxkDistanceDiff < turtleToTurtleRadius){
                                        turtleShellDetectIdx[i] = 1;
                                        turtleShellDetectIdx[j] = 2;
                                        [self collisionOn:i obj1:j];
                                        printf("F:%i %i---------------------------------------\n",i,j);
                                    }else{
                                        
                                        fuxkDistanceDiffX = turtleShellX[i] -
                                        turtleShellX[j] - generalTurtleDetectOffset * cos(turtleShellRotation[j] * M_PI/180);
                                        fuxkDistanceDiffY = turtleShellY[i] -
                                        turtleShellY[j] + generalTurtleDetectOffset * sin(turtleShellRotation[j] * M_PI/180);
                                        fuxkDistanceDiff = sqrtf(fuxkDistanceDiffX*fuxkDistanceDiffX + fuxkDistanceDiffY*fuxkDistanceDiffY);
                                        
                                        
                                        if(fuxkDistanceDiff < turtleToTurtleRadius){
                                            turtleShellDetectIdx[i] = 2;
                                            turtleShellDetectIdx[j] = 0;
                                            [self collisionOn:i obj1:j];
                                            printf("G:%i %i---------------------------------------\n",i,j);
                                        }else{
                                            
                                            fuxkDistanceDiffX = turtleShellX[i] -
                                            turtleShellX[j] + generalTurtleDetectOffset * cos(turtleShellRotation[j] * M_PI/180);
                                            fuxkDistanceDiffY = turtleShellY[i] -
                                            turtleShellY[j] - generalTurtleDetectOffset * sin(turtleShellRotation[j] * M_PI/180);
                                            fuxkDistanceDiff = sqrtf(fuxkDistanceDiffX*fuxkDistanceDiffX + fuxkDistanceDiffY*fuxkDistanceDiffY);
                                            
                                            if(fuxkDistanceDiff < turtleToTurtleRadius){
                                                turtleShellDetectIdx[i] = 2;
                                                turtleShellDetectIdx[j] = 1;
                                                [self collisionOn:i obj1:j];
                                                printf("H:%i %i---------------------------------------\n",i,j);
                                            }else{
                                                
                                                fuxkDistanceDiffX = turtleShellX[i] -
                                                turtleShellX[j];
                                                fuxkDistanceDiffY = turtleShellY[i] -
                                                turtleShellY[j];
                                                fuxkDistanceDiff = sqrtf(fuxkDistanceDiffX*fuxkDistanceDiffX + fuxkDistanceDiffY*fuxkDistanceDiffY);
                                                
                                                if(fuxkDistanceDiff < turtleToTurtleRadius){
                                                    turtleShellDetectIdx[i] = 2;
                                                    turtleShellDetectIdx[j] = 2;
                                                    [self collisionOn:i obj1:j];
                                                    printf("I:%i %i---------------------------------------\n",i,j);
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                
            }
        }

    }
}

- (void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    for( UITouch *touch in touches ) {
		CGPoint location = [touch locationInView: [touch view]];
		location = [[CCDirector sharedDirector] convertToGL: location];
        
        
        
        for(int i = 0 ; i < totalTurtleShell ; i++){
            
            fuxkTurtleAtX = turtleShellX[i];
            fuxkTurtleAtY = turtleShellY[i];
            
           
            // printf("ABC:%i l:%4.8f %4.8f r:%4.8f t:%4.8f %4.8f\n",i, location.x, location.y, [turtle[i] rotation], fuxkTurtleAtX, fuxkTurtleAtY);
            // printf("DEF:%4.8f %4.8f %4.8f %4.8f\n", fuxkTurtleAtX - 11 * cos([turtle[i] rotation]* M_PI/180) - location.x, fuxkTurtleAtY + 11 * sin([turtle[i] rotation]* M_PI/180) - location.y,
            //        fuxkTurtleAtX + 11 * cos([turtle[i] rotation]* M_PI/180) - location.x, fuxkTurtleAtY - 11 * sin([turtle[i] rotation]* M_PI/180) - location.y);
            
            fuxkDistanceDiffX = fuxkTurtleAtX - generalTurtleDetectOffset * cos(turtleShellRotation[i] * M_PI/180) - location.x;
            fuxkDistanceDiffY = fuxkTurtleAtY + generalTurtleDetectOffset * sin(turtleShellRotation[i] * M_PI/180) - location.y;
            fuxkDistanceDiff = sqrtf(fuxkDistanceDiffX*fuxkDistanceDiffX + fuxkDistanceDiffY*fuxkDistanceDiffY);
            
            if(fuxkDistanceDiff < shellRadiusDetect){
                ///printf("TTTTTTTTTTBBBBBBBBBB\n\n");
                [self tapTurtleShell:i fuckDiffX:fuxkDistanceDiffX];
            }else{
                // printf("YYYYYYYYYYYYYTTTTTTTTTTBBBBBBBBBB\n\n");
                fuxkDistanceDiffX = fuxkTurtleAtX + generalTurtleDetectOffset * cos(turtleShellRotation[i] * M_PI/180) - location.x;
                fuxkDistanceDiffY = fuxkTurtleAtY - generalTurtleDetectOffset * sin(turtleShellRotation[i] * M_PI/180) - location.y;
                fuxkDistanceDiff = sqrtf(fuxkDistanceDiffX*fuxkDistanceDiffX + fuxkDistanceDiffY*fuxkDistanceDiffY);
                
                if(fuxkDistanceDiff < shellRadiusDetect){
                    [self tapTurtleShell:i fuckDiffX:fuxkDistanceDiffX];
                }else{
                    // printf("BBBBBBBBBBBBBBBBBYYYYYYYYYYYYYTTTTTTTTTTBBBBBBBBBB\n\n");
                    fuxkDistanceDiffX = fuxkTurtleAtX - location.x;
                    fuxkDistanceDiffY = fuxkTurtleAtY - location.y;
                    fuxkDistanceDiff = sqrtf(fuxkDistanceDiffX*fuxkDistanceDiffX + fuxkDistanceDiffY*fuxkDistanceDiffY);
                    
                    if(fuxkDistanceDiff < shellRadiusDetect){
                        [self tapTurtleShell:i fuckDiffX:fuxkDistanceDiffX];
                    }
                }
                
            }
            
            
                        
            
        }//END FOR

    }
}

-(void) REALtapTurtleShell:(int)_idx fuckDiffX:(float)_fuckDiffX{
    //printf("tapTurtleShell:%i\n",_idx);
    
    turtleShellHasTapTimer[_idx] = 0;
    turtleShellHasTapped[_idx] = true;
    
    isTapTurtleShell[_idx] = true;
    turtleDiffX[_idx] = _fuckDiffX;
    
    howmanyTaps++;
    [uILayer gainCombo:1];
    
    if(turtleShellCanbeDestroyed[_idx]){
         turtleShellLevel[_idx]--;
    }
   
    if(turtleShellLevel[_idx] == 0){
        
        [playLayer setToShakingBomb:turtleShellX[_idx] turtleY:turtleShellY[_idx]];
        turtleShellIsAni[_idx] = false;
        
        [musicController playThisSound:kSound_ComboSmoke isLoop:NO gain:1.0];
        [musicController playThisSound:kSound_CrackShell isLoop:NO gain:0.3];
        
        howmanyTurtleIsDestroyedInThisLevel++;
          printf("howmanyTurtleIsDestroyedInThisLevel:%i\n",howmanyTurtleIsDestroyedInThisLevel);
        
        if(gameLevel >= 0){
            /*if(howmanyTurtleIsDestroyedInThisLevel == howmanyShellInThisLevel){
                gameRound++;
                [self genScript];
            }*/
            if(_idx == 0){
                gameRound++;
                [self genScript];
            }
        }
        
       
        
    }else{
        [musicController playThisSound:kSound_CrackShell isLoop:NO gain:1.0];
        [self setTurtleTexture:_idx];
    }
    
    //turtleShellVY += 4.0;
}

-(void) tapTurtleShell:(int)_idx fuckDiffX:(float)_fuckDiffX{
    if(!turtleShellIsAni[_idx]){
        return;
    }
    
   // printf("tapTurtleShell:%i\n",_idx);
    isTapping = true;
    tapIdxsStore[tapIdx] = _idx;
    tapDiffXStore[_idx] = _fuckDiffX;
    tapIdx++;
    
}

-(void) manageTurtlePhysics{
    for(int i = 0 ; i < totalTurtleShell ; i++){
        if(turtleShellIsAni[i]){
            
            if(turtleShellHasTapped[i]){
                turtleShellHasTapTimer[i]++;
                if(turtleShellHasTapTimer[i] > 30){
                    turtleShellHasTapTimer[i] = 0;
                    turtleShellHasTapped[i] = false;
                }
            }

            turtleShellVX[i] *= 0.98;
            
            if(turtleShellY[i] < 100){
                
                if(!turtleShellHasTapped[i]){
                    
                    if(turtleType[i] == 0){
                        if(turtleShellVY[i] < -2){
                            turtleShellVY[i] *= 0.85;
                        }else{
                            turtleShellVY[i] = (100 - turtleShellY[i])/15.0;
                        }
                    }else{
                        turtleShellVY[i] -= 0.75;
                    }
                    
                }else{
                    //has tap for 10 seconds
                   // printf("tapping :%i\n",i);
                    turtleShellVY[i] -= 0.75;
                }
   
                
            }else{
                if(turtleShellY[i] > 101){
                    turtleShellVY[i] -= 0.75;
                }
            }
            if(turtleShellY[i] <= 101){
                turtleShellVX[i] *= 0.9;
            }
            
            if(isTapTurtleShell[i]){
               // printf("isTapTurtleShell:%i\n",i);
                turtleShellVY[i] = (360 - turtleShellY[i])/15.0;
                if(turtleShellVY[i] > 10){
                    turtleShellVY[i] = 10;
                }
                if(turtleShellVY[i] < 10){
                    //   turtleShellVY[i] = 10;
                }
                
                static int ranV;
                ranV = arc4random()%100;
                //  turtleShellVX[i] += 8.0 - 16.0 * (float)ranV/100.0;
                turtleShellVX[i] += (turtleDiffX[i]/5.0)/thisCharacterScale[i];
                
                turtleShellVR[i] += turtleShellVX[i]/1.0;
                
                isTapTurtleShell[i] = false;
            }
            
            if(turtleShellX[i] < 10){
                turtleShellX[i] = 10;
                turtleShellVX[i] *= -1;
            }
            if(turtleShellX[i] > 490){
                turtleShellX[i] = 490;
                turtleShellVX[i] *= -1;
            }
            
            turtleShellRotation[i] += turtleShellVR[i];
            turtleShellVR[i] *= 0.95;
            //turtleShellAR *= 0.1;
            
            turtleShellX[i] += turtleShellVX[i];
            turtleShellY[i] += turtleShellVY[i];
            
            // printf("X:%4.8f:%4.8f\n",turtleShellX, turtleShellY);
            [turtleShell[i] setPosition:ccp(turtleShellX[i],turtleShellY[i])];
            [turtleShell[i] setRotation:turtleShellRotation[i]];
        }else{
            [turtleShell[i] setPosition:ccp(10000,10000)];
        }
    }
    
    
    for(int i = 0 ; i < totalTurtleShell ; i++){
        if(turtleShellIsAni[i]){
            if(turtleType[i] == 0){
                [turtleShell[i] setScale:generalCharacterScale[i]*thisCharacterScale[i]];
            }else{
                [turtleShell[i] setScale:4.0];
            }
        }
       
    }
}


-(void) collisionOn:(int)_obj0Idx obj1:(int)_obj1Idx{
    
	static float dx;
	static float dy;
	
	static float angle;
	static float sin1;
	static float cos1;
	
	static float x0;
	static float y0;
	static float x1;
	static float y1;
	
	static float vx0;
	static float vy0;
	static float vx1;
	static float vy1;
	
	static float vxTotal;
	
	static float _obj1X;
	static float _obj0X;
	static float _obj1Y;
	static float _obj0Y;
	static float _mass0;
	static float _mass1;
	static float _obj0VX;
	static float _obj0VY;
	static float _obj1VX;
	static float _obj1VY;
	
    static float turtleRealityRatio = 1.0;
	
	_obj0X = turtleShellX[_obj0Idx];
	_obj0Y = turtleShellY[_obj0Idx];
	_obj0VX = turtleShellVX[_obj0Idx] * turtleRealityRatio;
	_obj0VY = turtleShellVY[_obj0Idx] * turtleRealityRatio;
	_mass0 = 1.0;
    
    _obj1X = turtleShellX[_obj1Idx];
	_obj1Y = turtleShellY[_obj1Idx];
	_obj1VX = turtleShellVX[_obj1Idx] * turtleRealityRatio;
	_obj1VY = turtleShellVY[_obj1Idx] * turtleRealityRatio;
	_mass1 = 1.0;

    
    static float diffCenter;
	static float xxDiff;
	static float yyDiff;
	
    
	dx = _obj1X - _obj0X;
	dy = _obj1Y - _obj0Y;
	
	angle = atan2(dy, dx);
	sin1 = sin(angle);
	cos1 = cos(angle);
	
	//printf("angle:%4.8f %4.8f %4.8f\n",angle,dy,dx);
	
	x0 = 0;
	y0 = 0;
	
	x1 = dx * cos1 + dy * sin1;
	y1 = dy * cos1 - dx * sin1;
	
	vx0 = _obj0VX * cos1 + _obj0VY * sin1;
	vy0 = _obj0VY * cos1 - _obj0VX * sin1;
	vx1 = _obj1VX * cos1 + _obj1VY * sin1;
	vy1 = _obj1VY * cos1 - _obj1VX * sin1;
	
	//printf("x1:%4.8f %4.8f %4.8f %4.8f %4.8f %4.8f\n",x1,y1,vx0,vy0,vx1,vy1);
	
	vxTotal = vx0 - vx1;
	vx0 = ((_mass0 - _mass1) * vx0 + 2 * _mass1 * vx1)/(_mass0 + _mass1);
	vx1 = vxTotal + vx0;
	x0 += vx0;
	x1 += vx1;
	
	static float x0Final;
	static float y0Final;
	static float x1Final;
	static float y1Final;
	
    /*static float finalX;
	static float finalY;
	static float finalVX;
	static float finalVY;*/
	
	x0Final = x0 * cos1 - y0 * sin1;
	y0Final = y0 * cos1 + x0 * sin1;
	x1Final = x1 * cos1 - y1 * sin1;
	y1Final = y1 * cos1 + x1 * sin1;
    
    
    static bool shxtPHysics;
	static float detectRadius_centerOffestY_Chosen;
	static float detectRadius_centerOffestX_Chosen;
	static float detectRadius_centerOffestY_Chosen_obj2;
	static float detectRadius_centerOffestX_Chosen_obj2;
	//static float turtleDetect1OffestY_Chosen;
	//static float turtleDetectRadius_Chosen;
	static float detectRadius_obj_Chosen;
	static float detectRadius_obj_Chosen_obj2;
    
    
    do {
        shxtPHysics = false;
        
        if(turtleShellDetectIdx[_obj0Idx] == 0){
            detectRadius_centerOffestX_Chosen = turtleShellX[_obj0Idx] - generalTurtleDetectOffset * cos(turtleShellRotation[_obj0Idx] * M_PI/180);
            detectRadius_centerOffestY_Chosen = turtleShellY[_obj0Idx] + generalTurtleDetectOffset * sin(turtleShellRotation[_obj0Idx] * M_PI/180);
            detectRadius_obj_Chosen = 15;
        }
        if(turtleShellDetectIdx[_obj0Idx] == 1){
            detectRadius_centerOffestX_Chosen = turtleShellX[_obj0Idx] + generalTurtleDetectOffset * cos(turtleShellRotation[_obj0Idx] * M_PI/180);
            detectRadius_centerOffestY_Chosen = turtleShellY[_obj0Idx] - generalTurtleDetectOffset * sin(turtleShellRotation[_obj0Idx] * M_PI/180);
            detectRadius_obj_Chosen = 15;
        }
        if(turtleShellDetectIdx[_obj0Idx] == 2){
            detectRadius_centerOffestX_Chosen = turtleShellX[_obj0Idx];
            detectRadius_centerOffestY_Chosen = turtleShellY[_obj0Idx];
            detectRadius_obj_Chosen = 15;
        }
        
        if(turtleShellDetectIdx[_obj1Idx] == 0){
            detectRadius_centerOffestX_Chosen = turtleShellX[_obj1Idx] - generalTurtleDetectOffset * cos(turtleShellRotation[_obj1Idx] * M_PI/180);
            detectRadius_centerOffestY_Chosen = turtleShellY[_obj1Idx] + generalTurtleDetectOffset * sin(turtleShellRotation[_obj1Idx] * M_PI/180);
            detectRadius_obj_Chosen = 15;
        }
        if(turtleShellDetectIdx[_obj1Idx] == 1){
            detectRadius_centerOffestX_Chosen = turtleShellX[_obj1Idx] + generalTurtleDetectOffset * cos(turtleShellRotation[_obj1Idx] * M_PI/180);
            detectRadius_centerOffestY_Chosen = turtleShellY[_obj1Idx] - generalTurtleDetectOffset * sin(turtleShellRotation[_obj1Idx] * M_PI/180);
            detectRadius_obj_Chosen = 15;
        }
        if(turtleShellDetectIdx[_obj1Idx] == 2){
            detectRadius_centerOffestX_Chosen = turtleShellX[_obj1Idx];
            detectRadius_centerOffestY_Chosen = turtleShellY[_obj1Idx];
            detectRadius_obj_Chosen = 15;
        }
        
        
        yyDiff = _obj0Y + y0Final + detectRadius_centerOffestY_Chosen * 1.0 - _obj0Y + y1Final + detectRadius_centerOffestY_Chosen_obj2 * 1.0;
        xxDiff = _obj0X + x0Final + detectRadius_centerOffestX_Chosen * 1.0 - _obj0X + x1Final + detectRadius_centerOffestX_Chosen_obj2 * 1.0;
        
        diffCenter = sqrt(xxDiff*xxDiff + yyDiff*yyDiff);
        
        if(diffCenter < detectRadius_obj_Chosen_obj2 * 1.0 + detectRadius_obj_Chosen * 1.0){
            //printf("fxxk22 you all\n");
            shxtPHysics = true;
            x0Final *= 1.02;
            y0Final *= 1.02;
            x1Final *= 1.02;
            y1Final *= 1.02;
        }
        
    }while (shxtPHysics);
    
    
    
    turtleShellIsColliding[_obj0Idx] = true;
	
	if(turtleShellCollidingTimer[_obj0Idx] <= 50){
		turtleShellX[_obj0Idx] = _obj0X + x0Final;
		turtleShellY[_obj0Idx] = _obj0Y + y0Final;
		turtleShellVX[_obj0Idx] = (vx0 * cos1 - vy0 * sin1)*1.0;
		turtleShellVY[_obj0Idx] = (vy0 * cos1 + vx0 * sin1)*1.0;
		
		turtleShellVX[_obj0Idx] /= turtleRealityRatio;
		turtleShellVY[_obj0Idx] /= turtleRealityRatio;
		
		turtleShellVX[_obj0Idx] *= 1;
		turtleShellVY[_obj0Idx] *= 1;
		
		static float objVInCollision;
		objVInCollision = sqrt(turtleShellVX[_obj0Idx] * turtleShellVX[_obj0Idx] +turtleShellVY[_obj0Idx] * turtleShellVY[_obj0Idx]);
		
		if(objVInCollision > 100){
			objVInCollision = 100;
		}
		if(objVInCollision < -100){
			objVInCollision = -100;
		}
		
		turtleShellVR[_obj0Idx] = objVInCollision*0.05;
        
		
		//printf("obj[_obj0Idx]->rotationV :%4.8f\n",obj[_obj0Idx]->rotationV);
		
		static float atan2ForOBj;
		atan2ForOBj = atan2(turtleShellVY[_obj0Idx], turtleShellVX[_obj0Idx]);
		if(atan2ForOBj > M_PI/2 || atan2ForOBj < -M_PI/2){
			turtleShellVR[_obj0Idx] *= -1;
		}
		
	}
    
    
    turtleShellIsColliding[_obj1Idx] = true;
    if(turtleShellCollidingTimer[_obj1Idx] <= 50){
        turtleShellX[_obj1Idx] = _obj0X + x1Final;
        turtleShellY[_obj1Idx] = _obj0Y + y1Final;
        turtleShellVX[_obj1Idx] = (vx1 * cos1 - vy1 * sin1)*1.0;
        turtleShellVY[_obj1Idx] = (vy1 * cos1 + vx1 * sin1)*1.0;
        
        turtleShellVX[_obj1Idx] /= turtleRealityRatio;
        turtleShellVY[_obj1Idx] /= turtleRealityRatio;
        
        turtleShellVX[_obj1Idx] *= 1;
        turtleShellVY[_obj1Idx] *= 1;
        
        
        static float objVInCollision;
        objVInCollision = sqrt(turtleShellVX[_obj1Idx] * turtleShellVX[_obj1Idx] + turtleShellVY[_obj1Idx] * turtleShellVY[_obj1Idx]);
        
        if(objVInCollision > 100){
            objVInCollision = 100;
        }
        if(objVInCollision < -100){
            objVInCollision = -100;
        }
        
        turtleShellVR[_obj1Idx] = objVInCollision*0.05;
        
        static float atan2ForOBj;
        atan2ForOBj = atan2(turtleShellVY[_obj1Idx], turtleShellVX[_obj1Idx]);
        if(atan2ForOBj > M_PI/2 || atan2ForOBj < -M_PI/2){
            turtleShellVR[_obj1Idx] *= -1;
        }
        
        
    }

    

}


- (void) dealloc
{
	printf("Mini 101 Dealloc\n");
    
	[super dealloc];
}

@end
