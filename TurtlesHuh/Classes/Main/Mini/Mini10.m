//
//  Mini10.m
//  TurtlesHuh
//
//  Created by  on 2012/5/26.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "Mini10.h"
#import "GamePlayGlobal.h"
#import "Global.h"

@implementation Mini10

-(void) reInitColorComboLimit{
    printf("reInitColorComboLimit:%i %i %i\n",gameLevel, gameRound, howmanyMinesweeperOnScreen);
    
   /* if(gameLevel <= 2){
        comboColorLimit[0] = 0;
        comboColorLimit[1] = 8;
        comboColorLimit[2] = 16;
        comboColorLimit[3] = 24;
        comboColorLimit[4] = 32;
        comboColorLimit[5] = 40;
        comboColorLimit[6] = 48;
        comboColorLimit[7] = 56;
        comboColorLimit[8] = 64;
        comboColorLimit[9] = 72;
        comboColorLimit[10] = 80;
    }else if(gameLevel <= 3){
        comboColorLimit[0] = 0;
        comboColorLimit[1] = 9;
        comboColorLimit[2] = 18;
        comboColorLimit[3] = 27;
        comboColorLimit[4] = 36;
        comboColorLimit[5] = 45;
        comboColorLimit[6] = 54;
        comboColorLimit[7] = 63;
        comboColorLimit[8] = 72;
        comboColorLimit[9] = 81;
        comboColorLimit[10] = 90;
    }else if(gameLevel <= 4){
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
    }else if(gameLevel <= 5){
        comboColorLimit[0] = 0;
        comboColorLimit[1] = 11;
        comboColorLimit[2] = 22;
        comboColorLimit[3] = 33;
        comboColorLimit[4] = 44;
        comboColorLimit[5] = 55;
        comboColorLimit[6] = 66;
        comboColorLimit[7] = 77;
        comboColorLimit[8] = 88;
        comboColorLimit[9] = 99;
        comboColorLimit[10] = 110;
    }else if(gameLevel <= 6){
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
    }else if(gameLevel <= 7){
        comboColorLimit[0] = 0;
        comboColorLimit[1] = 13;
        comboColorLimit[2] = 26;
        comboColorLimit[3] = 39;
        comboColorLimit[4] = 52;
        comboColorLimit[5] = 65;
        comboColorLimit[6] = 78;
        comboColorLimit[7] = 91;
        comboColorLimit[8] = 104;
        comboColorLimit[9] = 117;
        comboColorLimit[10] = 130;
    }else{
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
    }*/
    
    comboColorLimit[0] = 0;
    comboColorLimit[1] = 8;
    comboColorLimit[2] = 16;
    comboColorLimit[3] = 30;
    comboColorLimit[4] = 45;
    comboColorLimit[5] = 60;
    comboColorLimit[6] = 75;
    comboColorLimit[7] = 90;
    comboColorLimit[8] = 120;
    comboColorLimit[9] = 150;
    comboColorLimit[10] = 200;
    
}

-(void) updateGameLevel{
    if(gameRound < 5){
        gameLevel = 0;
    }else if(gameRound < 10){
        gameLevel = 1;
    }else if(gameRound < 20){
        gameLevel = 2;
    }else if(gameRound < 30){
        gameLevel = 3;
    }else if(gameRound < 45){
        gameLevel = 4;
    }else if(gameRound < 60){
        gameLevel = 5;
    }else if(gameRound < 75){
        gameLevel = 6;
    }else if(gameRound < 90){
        gameLevel = 7;
    }else if(gameRound < 110){
        gameLevel = 8;
    }else if(gameRound < 140){
        gameLevel = 9;
    }else if(gameRound < 180){
        gameLevel = 10;
    }
    
    [self reInitColorComboLimit];
    
    arrowScaleVX = 0.1;
    arrowVY = 10;
    arrowVO = 30;
    
    if(gameLevel == 0){
        restEndTime = 60; 
        shellSpeed = 12;
        shellAttackTime = 65;
        
        shellNumberAppearRatio[0] = 0;
        shellNumberAppearRatio[1] = 0;
        shellNumberAppearRatio[2] = 30;
        shellNumberAppearRatio[3] = 60;
        shellNumberAppearRatio[4] = 85;
        shellNumberAppearRatio[5] = 100;
        shellNumberAppearRatio[6] = 100;
        
        isMinesweeperMaxAppearningTime = 900;
        nextGenMinesweeperTime = 30000;
        maxHowmanyMinesweeperOnScreen = 0;
        
        arrowVY = 10 * 0.5;
        
    }
    if(gameLevel == 1){
        restEndTime = 55; 
        shellSpeed = 13;
        shellAttackTime = 60;
        
        shellNumberAppearRatio[0] = 0;
        shellNumberAppearRatio[1] = 0;
        shellNumberAppearRatio[2] = 30;
        shellNumberAppearRatio[3] = 70;
        shellNumberAppearRatio[4] = 100;
        shellNumberAppearRatio[5] = 100;
        shellNumberAppearRatio[6] = 100;
        
        isMinesweeperMaxAppearningTime = 900;
        nextGenMinesweeperTime = 300;
        maxHowmanyMinesweeperOnScreen = 3;
        
         arrowVY = 10 * 0.55;
    }
    if(gameLevel == 2){
        restEndTime = 50; 
        shellSpeed = 14;
        shellAttackTime = 55;
        
        shellNumberAppearRatio[0] = 0;
        shellNumberAppearRatio[1] = 0;
        shellNumberAppearRatio[2] = 20;
        shellNumberAppearRatio[3] = 45;
        shellNumberAppearRatio[4] = 80;
        shellNumberAppearRatio[5] = 95;
        shellNumberAppearRatio[6] = 100;
        
        isMinesweeperMaxAppearningTime = 800;
        nextGenMinesweeperTime = 30000;
        maxHowmanyMinesweeperOnScreen = 1;
        
         arrowVY = 10 * 0.62;
    }
    if(gameLevel == 3){
        restEndTime = 45; 
        shellSpeed = 15;
        shellAttackTime = 55;
        
        shellNumberAppearRatio[0] = 0;
        shellNumberAppearRatio[1] = 0;
        shellNumberAppearRatio[2] = 10;
        shellNumberAppearRatio[3] = 40;
        shellNumberAppearRatio[4] = 80;
        shellNumberAppearRatio[5] = 95;
        shellNumberAppearRatio[6] = 100;
        
        isMinesweeperMaxAppearningTime = 850;
        nextGenMinesweeperTime = 500;
        maxHowmanyMinesweeperOnScreen = 1;
        
         arrowVY = 10 * 0.7;
    }
    if(gameLevel == 4){
        restEndTime = 40; 
        shellSpeed = 15;
        shellAttackTime = 55;
        
        shellNumberAppearRatio[0] = 0;
        shellNumberAppearRatio[1] = 0;
        shellNumberAppearRatio[2] = 0;
        shellNumberAppearRatio[3] = 35;
        shellNumberAppearRatio[4] = 65;
        shellNumberAppearRatio[5] = 90;
        shellNumberAppearRatio[6] = 100;
        
        isMinesweeperMaxAppearningTime = 850;
        nextGenMinesweeperTime = 400;
        maxHowmanyMinesweeperOnScreen = 1;
        
         arrowVY = 10 * 0.8;
    }
    if(gameLevel == 5){
        restEndTime = 35; 
        shellSpeed = 16;
        shellAttackTime = 55;
        
        shellNumberAppearRatio[0] = 0;
        shellNumberAppearRatio[1] = 0;
        shellNumberAppearRatio[2] = 0;
        shellNumberAppearRatio[3] = 30;
        shellNumberAppearRatio[4] = 60;
        shellNumberAppearRatio[5] = 90;
        shellNumberAppearRatio[6] = 100;
        
        isMinesweeperMaxAppearningTime = 850;
        nextGenMinesweeperTime = 400;
        maxHowmanyMinesweeperOnScreen = 2;
        
         arrowVY = 10 * 0.9;
    }
    if(gameLevel == 6){
        restEndTime = 30; 
        shellSpeed = 17;
        shellAttackTime = 50;
        
        shellNumberAppearRatio[0] = 0;
        shellNumberAppearRatio[1] = 0;
        shellNumberAppearRatio[2] = 0;
        shellNumberAppearRatio[3] = 30;
        shellNumberAppearRatio[4] = 55;
        shellNumberAppearRatio[5] = 85;
        shellNumberAppearRatio[6] = 100;
        
        isMinesweeperMaxAppearningTime = 900;
        nextGenMinesweeperTime = 400;
        maxHowmanyMinesweeperOnScreen = 2;
    }
    
    //FIRST INIT
    if(gameLevel == 7){
        restEndTime = 25; 
        shellSpeed = 17;
        shellAttackTime = 50;
        
        shellNumberAppearRatio[0] = 0;
        shellNumberAppearRatio[1] = 0;
        shellNumberAppearRatio[2] = 0;
        shellNumberAppearRatio[3] = 30;
        shellNumberAppearRatio[4] = 55;
        shellNumberAppearRatio[5] = 85;
        shellNumberAppearRatio[6] = 100;
        
        isMinesweeperMaxAppearningTime = 900;
        nextGenMinesweeperTime = 300;
        maxHowmanyMinesweeperOnScreen = 3;
    }
    if(gameLevel == 8){
        restEndTime = 20; 
        shellSpeed = 18;
        shellAttackTime = 45;
        
        shellNumberAppearRatio[0] = 0;
        shellNumberAppearRatio[1] = 0;
        shellNumberAppearRatio[2] = 0;
        shellNumberAppearRatio[3] = 20;
        shellNumberAppearRatio[4] = 50;
        shellNumberAppearRatio[5] = 85;
        shellNumberAppearRatio[6] = 100;
        
        isMinesweeperMaxAppearningTime = 900;
        nextGenMinesweeperTime = 300;
        maxHowmanyMinesweeperOnScreen = 3;
    }
    if(gameLevel == 9){
        restEndTime = 20; 
        shellSpeed = 20;
        shellAttackTime = 40;
        
        shellNumberAppearRatio[0] = 0;
        shellNumberAppearRatio[1] = 0;
        shellNumberAppearRatio[2] = 0;
        shellNumberAppearRatio[3] = 15;
        shellNumberAppearRatio[4] = 45;
        shellNumberAppearRatio[5] = 85;
        shellNumberAppearRatio[6] = 100;
        
        isMinesweeperMaxAppearningTime = 900;
        nextGenMinesweeperTime = 300;
        maxHowmanyMinesweeperOnScreen = 3;
    }
    if(gameLevel == 10){
        restEndTime = 15; 
        shellSpeed = 25;
        shellAttackTime = 30;
        
        shellNumberAppearRatio[0] = 0;
        shellNumberAppearRatio[1] = 0;
        shellNumberAppearRatio[2] = 0;
        shellNumberAppearRatio[3] = 10;
        shellNumberAppearRatio[4] = 40;
        shellNumberAppearRatio[5] = 85;
        shellNumberAppearRatio[6] = 100;
        
        isMinesweeperMaxAppearningTime = 900;
        nextGenMinesweeperTime = 300;
        maxHowmanyMinesweeperOnScreen = 3;
    }
    
    
    if(numShellsGen == 7){
        shellAttackTime *= 1.5;
    }
    
    if(numShellsGen == 7){
        shellAttackTime *= 1.5;
        shellSpeed *= 1.5;
    }
    
    if(numShellsGen == 6){
        if(gameLevel <= 4){
            shellAttackTime *= 1.25;
        }
    }
    
    if(gameRoundFromBegin == 0){
        restEndTime *= 1.2;
        shellSpeed *= 0.75;
        shellAttackTime *= 1.2;
        
        shellNumberAppearRatio[0] = 0;
        shellNumberAppearRatio[1] = 20;
        shellNumberAppearRatio[2] = 50;
        shellNumberAppearRatio[3] = 80;
        shellNumberAppearRatio[4] = 100;
        shellNumberAppearRatio[5] = 100;
        shellNumberAppearRatio[6] = 100;
    }
    if(gameRoundFromBegin == 1){
        restEndTime *= 1.15;
        shellSpeed *= 0.8;
        shellAttackTime *= 1.15;
    }
    
    if(gameRoundFromBegin == 2){
        restEndTime *= 1.1;
        shellSpeed *= 0.85;
        shellAttackTime *= 1.1;
    }
    
    if(gameRoundFromBegin == 3){
        shellSpeed *= 0.9;
    }
    if(gameRoundFromBegin == 4){
        shellSpeed *= 0.95;
    }
}

-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
        
        finalTimeRemain = timeRemain;
        
        //newestMomentHasAppearedTime = 4;
        is2ndFucking = false;
        howmanyMinesweeperOnScreen = 0;
        gameRoundFromBegin = 0;
        
        fuckOffsetJumpForIpad = 28;
        
        [self updateGameLevel];
        
        s_bg = [CCSprite spriteWithFile:@"mini_10_bg.png"];
        [s_bg setPosition:ccp([UIScreen mainScreen].bounds.size.height/2, [UIScreen mainScreen].bounds.size.width/2)];
		[self addChild:s_bg];
  
        
		wholeTurtleScaleFromSocurce = 0.435;
//        wholePenguinScaleFromSocurce = 0.5;
        wholePenguinScaleFromSocurce = 0.8;
        
        columnIdx = 3;
        gameRound = 0;
        isBeingAttack = false;
            

        [self reInitColorComboLimit];
        [self initColumnPos];
        [self initFloors];
        [self initCharacters];
        [self initLevelsAndItems];
              
        [self initControlLayer];
        
        canBeGainCombo = false;
        
        
    }
	return self;
}

-(void) initFloors{
    s_floor[0] = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1806/textureRatioForFuckingIpad,490/textureRatioForFuckingIpad,242/textureRatioForFuckingIpad,140/textureRatioForFuckingIpad)];
    s_floor[1] = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1806/textureRatioForFuckingIpad,490/textureRatioForFuckingIpad,242/textureRatioForFuckingIpad,140/textureRatioForFuckingIpad)];
    s_floor[2] = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1806/textureRatioForFuckingIpad,490/textureRatioForFuckingIpad,242/textureRatioForFuckingIpad,140/textureRatioForFuckingIpad)];
    s_floor[3] = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1806/textureRatioForFuckingIpad,490/textureRatioForFuckingIpad,242/textureRatioForFuckingIpad,140/textureRatioForFuckingIpad)];
    
    [ss_Character addChild:s_floor[0] z:kDeapth_Extra2];
    [ss_Character addChild:s_floor[1] z:kDeapth_Extra2];
    [ss_Character addChild:s_floor[2] z:kDeapth_Extra2];
    [ss_Character addChild:s_floor[3] z:kDeapth_Extra2];
    
    [s_floor[0] setPosition:ccp(60,35)];
    [s_floor[1] setPosition:ccp(180,35)];
    [s_floor[2] setPosition:ccp(300,35)];
    [s_floor[3] setPosition:ccp(420,35)];
    
    if(isIpad){
        [s_floor[0] setPosition:ccp(120 + 28,70)];
        [s_floor[1] setPosition:ccp(360 + 28,70)];
        [s_floor[2] setPosition:ccp(600 + 28,70)];
        [s_floor[3] setPosition:ccp(840 + 28,70)];
    }
    
    if(isIphone5){
        [s_floor[0] setPosition:ccp(s_floor[0].position.x + 44, s_floor[0].position.y)];
        [s_floor[1] setPosition:ccp(s_floor[1].position.x + 44, s_floor[1].position.y)];
        [s_floor[2] setPosition:ccp(s_floor[2].position.x + 44, s_floor[2].position.y)];
        [s_floor[3] setPosition:ccp(s_floor[3].position.x + 44, s_floor[3].position.y)];
    }
    
    if(isIphone5 || isIpad){
        s_floor[4] = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1806/textureRatioForFuckingIpad,490/textureRatioForFuckingIpad,242/textureRatioForFuckingIpad,140/textureRatioForFuckingIpad)];
        s_floor[5] = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1806/textureRatioForFuckingIpad,490/textureRatioForFuckingIpad,242/textureRatioForFuckingIpad,140/textureRatioForFuckingIpad)];
        
        [ss_Character addChild:s_floor[4] z:kDeapth_Extra2];
        [ss_Character addChild:s_floor[5] z:kDeapth_Extra2];
        
        [s_floor[4] setPosition:ccp(0,35)];
        [s_floor[5] setPosition:ccp(480,35)];
        
        if(isIpad){
            [s_floor[4] setPosition:ccp(0 + 28,70)];
            [s_floor[5] setPosition:ccp(1080 + 28,70)];
        }
        
        if(isIphone5){
            [s_floor[4] setPosition:ccp(s_floor[4].position.x + 44, s_floor[4].position.y)];
            [s_floor[5] setPosition:ccp(s_floor[5].position.x + 44, s_floor[5].position.y)];
        }

    }
    
}


-(void) initLevelsAndItems{
    for(int i = 0 ; i < maxColumn ; i++){
        s_minesweeper[i] = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1434/textureRatioForFuckingIpad,610/textureRatioForFuckingIpad,110/textureRatioForFuckingIpad,86/textureRatioForFuckingIpad)];
        s_arrow[i] = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1670/textureRatioForFuckingIpad,490/textureRatioForFuckingIpad,86/textureRatioForFuckingIpad,90/textureRatioForFuckingIpad)];
        
        [ss_Character addChild:s_minesweeper[i]];
        [ss_Character addChild:s_arrow[i] z:kDeapth_Extra2];
        
        [s_minesweeper[i] setPosition:ccp(10000,10000)];
        [s_arrow[i] setPosition:ccp(10000,10000)];
        
        [s_minesweeper[i] setAnchorPoint:ccp(0.5, 0.141176471)];
    }
    
    canMinesweeper = true;
    minesweeperTimer = 0;
    
    isAttacking = false;
   // restEndTime = 60;
    restingTimer = restEndTime;
  //  shellSpeed = 15;
    
    for(int i = 0 ; i < maxColumn ; i++){
        isMinesweeperTimer[i] = 99999;
        isMinesweeper[i] = false;
        isTargeting[i] = false;
    }
}

-(void) initControlLayer{
    controlLayer = [ControlLayer node];
	[self addChild:controlLayer z:kDeapth_Btns];
    [controlLayer setDelegate:self];
}


-(void) initColumnPos{
    maxColumn = 8;
    
      columnStartX = 25;
      columnOffsetX = 60;
    
    if(isIphone5){
        columnStartX += 44;
    }
    
    if(isIpad){
        columnStartX = 50;
        columnOffsetX = 120;
    }
    
    for(int i = 0 ; i < maxColumn ; i++){
        columnX[i] = columnStartX + columnOffsetX * i;
        
        if(isIpad){
            columnX[i] += fuckOffsetJumpForIpad;
        }
    }
    columnY = 70;
    
    if(isIpad){
        columnY = 140;
    }
}

-(void) initCharacters{
    penguin = [[Penguin alloc] init];
    [penguin setX:columnX[columnIdx]];
    [penguin setY:columnY];
    [penguin setStatus:kPenguinAniStatus_Idle];
    [penguin setDelegate:self];
    
    for(int i = 0 ; i < maxColumn ; i++){
        turtle[i] = [[Turtle alloc] init];
        [turtle[i] setX:10000];
        [turtle[i] setStatus:kTurtleAniStatus_Normal_In];
        [turtle[i] setBombOutType:kTurtleBombOutType_bombOutOffScreen];
        [turtle[i] setIdNumber:i];
    }
    
}

-(void) gotoNextJump{
    
    //printf("mini04 gotoNextJump:%i\n",currentStandShell);
    
    if(next_isFacingRight){
        
        if(next_jumpType == kPenguinJump_jumpTo1TurtleShell){
            columnIdx++;
            if(columnIdx >= maxColumn){
                columnIdx = 0;
                penguinJumpFinalX = columnX[maxColumn-1] + columnOffsetX;
                penguinJumpFinalY = columnY;
                
                if(isIphone5){
                    penguinJumpFinalX += 44;
                }
                if(isIpad){
                    penguinJumpFinalX += fuckOffsetJumpForIpad;
                }
                
                
            }else{
                penguinJumpFinalX = columnX[columnIdx];
                penguinJumpFinalY = columnY;
            }
            
        }
        if(next_jumpType == kPenguinJump_jumpTo2TurtleShell){
            columnIdx+=2;
            if(columnIdx == maxColumn){
                columnIdx = 0;
                penguinJumpFinalX = columnX[maxColumn-1] + columnOffsetX;
                penguinJumpFinalY = columnY;
                
                if(isIphone5){
                    penguinJumpFinalX += 44;
                }
                if(isIpad){
                    penguinJumpFinalX += fuckOffsetJumpForIpad;
                }
                
            }else if(columnIdx == maxColumn+1){
                columnIdx = 1;
                penguinJumpFinalX = columnX[maxColumn-1] + columnOffsetX*2;
                penguinJumpFinalY = columnY;
                
                if(isIphone5){
                    penguinJumpFinalX += 44;
                }
                if(isIpad){
                    penguinJumpFinalX += fuckOffsetJumpForIpad;
                }
                
            }else{
                penguinJumpFinalX = columnX[columnIdx];
                penguinJumpFinalY = columnY;
            }
        }
        
       
        
    }else{
        
        if(next_jumpType == kPenguinJump_jumpTo1TurtleShell){
            columnIdx--;
            if(columnIdx < 0){
                columnIdx = maxColumn-1;
                penguinJumpFinalX = columnX[0] - columnOffsetX;
                penguinJumpFinalY = columnY;
                
                if(isIphone5){
                    penguinJumpFinalX -= 44;
                }
                if(isIpad){
                    penguinJumpFinalX -= fuckOffsetJumpForIpad;
                }
                
            }else{
                penguinJumpFinalX = columnX[columnIdx];
                penguinJumpFinalY = columnY;
            }
            
        }
        if(next_jumpType == kPenguinJump_jumpTo2TurtleShell){
            columnIdx-=2;
            if(columnIdx == 0){
                columnIdx = maxColumn-1;
                penguinJumpFinalX = columnX[0] - columnOffsetX;
                penguinJumpFinalY = columnY;
                
                if(isIphone5){
                    penguinJumpFinalX -= 44;
                }
                if(isIpad){
                    penguinJumpFinalX -= fuckOffsetJumpForIpad;
                }
                
            }else if(columnIdx == -2){
                columnIdx = maxColumn-2;
                penguinJumpFinalX = columnX[0] - columnOffsetX*2;
                penguinJumpFinalY = columnY;
                
                if(isIphone5){
                    penguinJumpFinalX -= 44;
                }
                if(isIpad){
                    penguinJumpFinalX -= fuckOffsetJumpForIpad;
                }
                
            }else{
                penguinJumpFinalX = columnX[columnIdx];
                penguinJumpFinalY = columnY;
            }
        }
        
    }
    
    //printf("Emini04 gotoNextJump:%i\n",currentStandShell);
}

-(void) gotoNextDelayOneStep{
    
}

-(void) resetPenguin{
    printf("resetPenguin\n");
    
    resetPenguinTimer = 0;
    restPenguinOnOffOpacityTimer = 0;
    resetPenguinIsOnOpacity = true;
    isResetPenguin = true;
    
    [penguin setX:columnX[columnIdx]];
    [penguin setY:columnY];
    
    [penguin setStatus:kPenguinAniStatus_Idle];
    
    isTapWronglyAndDisableBtns = false;
}

-(void) manageResetPenguin{
    if(!isResetPenguin){
        return;
    }
    
    //return;
    
   // printf("manageResetPenguin:%i\n",resetPenguinTimer);
    
    if(resetPenguinTimer < 20){
        restPenguinOnOffOpacityInterval = 6;
    }else if(resetPenguinTimer < 40){
        restPenguinOnOffOpacityInterval = 4;
    }if(resetPenguinTimer < 60){
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
    
    if(resetPenguinTimer == 60){
        isResetPenguin = false;
        [penguin setOpacity:255];
    }
    
    resetPenguinTimer++;
}

-(void) manage:(ccTime) dt{
    // fuckAngle += (0 - fuckAngle)/20;
    //[cannon setRotateDegree:fuckAngle];
    
     timeRemain += (finalTimeRemain - timeRemain)/10;
    
    [penguin manage];
    
    for(int i = 0 ; i < maxColumn ; i++){
        [turtle[i] manage:dt];
    }
       
    
   /* if(isTapWronglyAndDisableBtns){
        tapWronglyAndDisableBtnsTimer++;
        
        if(tapWronglyAndDisableBtnsTimer == 40){
            isTapWronglyAndDisableBtns = false;
        }
    }*/
    
    [self checkIfOutBoundary];
    
    [self manageAI];
    [self manageResetPenguin];
    
    [self maangeAttacking];
    [self manageMinesweepering];
    
    if(canBeGainCombo){
        //printf("gaingaingain\n");
        [uILayer gainCombo:1];
        canBeGainCombo = false;
        gameRoundFromBegin++;
    }
}

-(void) manageAI{
    
    //printf("restingTimer:%i %i\n",restingTimer, beingAttackTimer);
    
    if(isBeingAttack){
        beingAttackTimer--;
        if(beingAttackTimer == 0){
            isBeingAttack = false;
            isAttacking = false;
            canMinesweeper = true;
          //  isTapWronglyAndDisableBtns = true;
        }
        
        if(beingAttackTimer == 60){
            [self resetPenguin];
            currentCombo = 0;
        }
    }
    
   // if(!isAttacking){
    if(!isBeingAttack){
        restingTimer--;
        if(restingTimer == 0){
            [self genNextAttack];
        }
    }
    
   // canMinesweeper = true;
    if(canMinesweeper){
        minesweeperTimer++;
        
        //do it in btnIsTappedInControlLayer
       /* if(minesweeperTimer == nextGenMinesweeperTime){
            [self genNextMinesweeper:2];
            minesweeperTimer = 0;
        }*/
    }
}

-(void) genNextMinesweeper:(int)_howmany{
   // printf("genNextMinesweeper:%i\n",_howmany);
    
    static int minesweeperGenNum;
    minesweeperGenNum = 0;
    
    static int leftMinesweeperGened;
    static int rightMinesweeperGened;
    static int leftMinesweeperGened2;
    static int rightMinesweeperGened2;
    
    static int fuckTime;
    static int fuckTime2;
    fuckTime = 5;
    fuckTime2 = 5;
    
    
    static int ranMinesweeperGen;
    ranMinesweeperGen = arc4random() % maxColumn;
    // printf("TTTT:%i %i\n",ranMinesweeperGen,minesweeperGenNum);
    
    leftMinesweeperGened = ranMinesweeperGen - 1;
    if(leftMinesweeperGened < 0){
        leftMinesweeperGened = maxColumn-1;
    }
    
    leftMinesweeperGened2 = ranMinesweeperGen - 2;
    if(leftMinesweeperGened2 == 0){
        leftMinesweeperGened2 = maxColumn-1;
    }
    if(leftMinesweeperGened2 == -1){
        leftMinesweeperGened2 = maxColumn-2;
    }
    
    rightMinesweeperGened = ranMinesweeperGen + 1;
    if(rightMinesweeperGened >= maxColumn){
        rightMinesweeperGened = 0;
    }
    
    rightMinesweeperGened2 = ranMinesweeperGen + 2;
    if(rightMinesweeperGened2 == maxColumn){
        rightMinesweeperGened2 = 0;
    }
    if(rightMinesweeperGened2 == maxColumn+1){
        rightMinesweeperGened2 = 1;
    }
    
    if(isTargeting[ranMinesweeperGen] && !isMinesweeper[ranMinesweeperGen]  && !isMinesweeper[leftMinesweeperGened]  && !isMinesweeper[rightMinesweeperGened]){
        if(leftMinesweeperGened == columnIdx || leftMinesweeperGened2 == columnIdx || rightMinesweeperGened == columnIdx || rightMinesweeperGened2 == columnIdx){
            
        }else{
            minesweeperGenNum++;
            howmanyMinesweeperOnScreen++;
            
            isMinesweeper[ranMinesweeperGen] = true;
            isMinesweeperTimer[ranMinesweeperGen] = 0;
            isMinesweeperActiveForHurt[ranMinesweeperGen] = false;
            isMineseeperCanAppearingTime[ranMinesweeperGen] = isMinesweeperMaxAppearningTime;
            isMinesweeperIsDisappearing[ranMinesweeperGen] = false;
            
            [musicController playThisSound:kSound_Minesweeper isLoop:NO gain:1.0];
            [musicController playThisSound:kSound_MinesweeperV2 isLoop:NO gain:0.65];
        }
    }
    
    
}

-(void) genNextAttack{
    isAttacking = true;
    attackingTimer = 0;
    
    gameRound++;
    counterForAchivement++;
    

    static int ranNumShells;
    ranNumShells = arc4random()%100;
    static int numShells = 0;
    
    if(ranNumShells < shellNumberAppearRatio[0]){
        numShells = 1;
    }else if(ranNumShells < shellNumberAppearRatio[1]){
        numShells = 2;
    }else if(ranNumShells < shellNumberAppearRatio[2]){
        numShells = 3;
    }else if(ranNumShells < shellNumberAppearRatio[3]){
        numShells = 4;
    }else if(ranNumShells < shellNumberAppearRatio[4]){
        numShells = 5;
    }else if(ranNumShells < shellNumberAppearRatio[5]){
        numShells = 6;
    }else if(ranNumShells < shellNumberAppearRatio[6]){
        numShells = 7;
    }
    
    static int avialableColumnEscape;
    avialableColumnEscape = maxColumn;
    for(int i = 0 ; i < maxColumn ; i++){
        if(isMinesweeper[i]){
            avialableColumnEscape--;
        }
    }
    
    numShellsGen = 0;
    
    do{
        
        static int ranTarget;
        ranTarget = arc4random() % 8;
        
        if(!isTargeting[ranTarget]){
            isTargeting[ranTarget] = true;
            arrowIsOnOpacity[ranTarget] = true;
            arrowOnOffOpacityTimer[ranTarget] = 0;
            numShells--;
            numShellsGen++;
            
            if(!isMinesweeper[ranTarget]){
                avialableColumnEscape--;
            }
        }
    
    }while(numShells > 0 && avialableColumnEscape > 1);
    
    [self updateGameLevel];
    [musicController playThisSound:kSound_Arrows isLoop:NO gain:1.0];

}


-(void) maangeAttacking{
    if(!isAttacking){
        for(int i = 0 ; i < maxColumn ; i++){
            [s_arrow[i] setOpacity:0];
        }
        
        return;
    }
    
    for( int i = 0 ; i < maxColumn ; i++){
        if(isTargeting[i]){
            if(attackingTimer == 0){
                
                if(isIpad){
                    [s_arrow[i] setPosition:ccp(60 + 120 * i + fuckOffsetJumpForIpad, 600)];
                }else{
                    [s_arrow[i] setPosition:ccp(30 + 60 * i, 240)];
                }
                
                
                if(isIphone5){
                    [s_arrow[i] setPosition:ccp(s_arrow[i].position.x + 44, s_arrow[i].position.y)];
                }
                
                [s_arrow[i] setScaleY:1];
                [s_arrow[i] setScaleX:1.3];
                
                shellX[i] = 30 + 60 * i;
                shellY[i] = 350;
                
                if(isIpad){
                    shellX[i] = 60 + 120 * i + fuckOffsetJumpForIpad;
                    shellY[i] = 700;
                }
                
                if(isIphone5){
                    shellX[i] += 44;
                }
                
                if(i < 4){
                    [turtle[i] bombOutOffScreenDirection:kBombOutOffScreenDirection_Left];
                }else{
                    [turtle[i] bombOutOffScreenDirection:kBombOutOffScreenDirection_Right];
                }
                
                arrowOpacity[i] = 255;
                
                //[s_shell[i] setPosition:ccp(shellX[i], shellY[i])];
                //[s_shell[i] setScaleY:-1];
                
                shellIsExploding[i] = false;
                
                /*[turtle[i] setStatus:kTurtleAniStatus_Normal_In];
                [turtle[i] resetHurtTime];
                 [turtle[i] setRotation:180];*/
                
                shellScaleY[i] = 2.0;
                shellScaleX[i] = 1.35;
            }
            
            
            if(attackingTimer == shellAttackTime){
                [turtle[i] setStatus:kTurtleAniStatus_Normal_In];
                [turtle[i] resetHurtTime];
                [turtle[i] setRotation:180];
            }

            if(attackingTimer >= shellAttackTime){
                arrowOpacity[i] -= arrowVO;
                if( arrowOpacity[i] < 0){
                    arrowOpacity[i] = 0;
                } 
                
                [s_arrow[i] setOpacity:arrowOpacity[i]];
                [s_arrow[i] setScaleX:s_arrow[i].scaleX - arrowScaleVX];
                [s_arrow[i] setPosition:ccp(s_arrow[i].position.x, s_arrow[i].position.y - arrowVY)];
            }else{
                static float shellGoingAttackPercentage;
                shellGoingAttackPercentage = (float)attackingTimer/(float)shellAttackTime;
                
             //   printf("shellGoingAttackPercentage:%4.8f %i\n",shellGoingAttackPercentage, i);
                
                if(shellGoingAttackPercentage < 0.2){
                    arrowOnOffOpacityInterval[i] = 10;
                }else if(shellGoingAttackPercentage < 0.5){
                    arrowOnOffOpacityInterval[i] = 8;
                }else if(shellGoingAttackPercentage < 0.8){
                    arrowOnOffOpacityInterval[i] = 6;
                }else{
                    arrowOnOffOpacityInterval[i] = 3;
                }
                
                if(arrowOnOffOpacityTimer[i] >= arrowOnOffOpacityInterval[i]){
                    arrowOnOffOpacityTimer[i] = 0;
                    arrowIsOnOpacity[i] = !arrowIsOnOpacity[i];
                }
                
                if(arrowIsOnOpacity[i]){
                    [s_arrow[i] setOpacity:255];
                }else{
                    [s_arrow[i] setOpacity:0];
                }
                
                arrowOnOffOpacityTimer[i]++;
            }
            
            
            if(attackingTimer > shellAttackTime &&  !shellIsExploding[i]){
                shellY[i] -= shellSpeed;
                
                [turtle[i] setX:shellX[i]];
                [turtle[i] setY:shellY[i]];
                
                shellScaleY[i] -= 0.1;
                if(shellScaleY[i] < 1){
                    shellScaleY[i] = 1;
                }
                
                shellScaleX[i] -= 0.75;
                if(shellScaleX[i] < 0.85){
                    shellScaleX[i] = 0.85;
                }
                
                [turtle[i] setScaleXForShell:shellScaleX[i]];
                [turtle[i] setScaleYForShell:shellScaleY[i]];
            }
            
            int fuckUpper;
            int fuckDown;
            int fuck3;
            int fuck4;
            if(isIpad){
                fuckUpper = 500;
                fuckDown = 320;
                fuck3 = 360;
                fuck4 = 240;
            }else{
                fuckUpper = 250;
                fuckDown = 160;
                fuck3 = 180;
                fuck4 = 120;
            }
            if(shellY[i] < fuckUpper && shellY[i] > fuckDown && isBeingAttack){
                shellIsExploding[i] = true;
                [turtle[i] tap2];
                [turtle[i] setX:1000];
                isTargeting[i] = false;
                restingTimer = restEndTime;
            }
            
            if(shellY[i] < fuck3){
                [self checkToGiveNextMinesweeper];
            } 
            
            if(shellY[i] < fuck4 && i == columnIdx){
                shellIsExploding[i] = true;
                [turtle[i] tap2];
                isTargeting[i] = false;
                
                

                [self bombombomb];
               
                
               // printf("OOOOOOOOOOOOOOOOOOO\n");

            }else{
                
                int fuck5;
                if(isIpad){
                    fuck5 = 150;
                }else{
                    fuck5 = 75;
                }
                if(shellY[i] < fuck5){
                    shellIsExploding[i] = true;
                    [turtle[i] tap2];
                    isAttacking = false;
                    restingTimer = restEndTime;
                    isTargeting[i] = false;
                    
                    canBeGainCombo = true;
                    
                }
            }
            
            
            
        }
    }
    
    
    attackingTimer++;
}

-(void) manageMinesweepering{
    for(int i = 0 ; i < maxColumn ; i++){
        if(isMinesweeper[i]){
            
            if(!isMinesweeperIsDisappearing[i]){
                
                if(isMinesweeperTimer[i] == 0){
                    mineSweeperScale[i] = 0.1;
                    
                    mineSweeperX[i] = 30 + i * 60;
                    
                    if(isIphone5){
                        mineSweeperX[i] += 44;
                    }
                    
                    mineSweeperY[i] = 65;
                    
                    if(isIpad){
                         mineSweeperY[i] = 130;
                        mineSweeperX[i] = 60 + i * 120 + fuckOffsetJumpForIpad;
                    }
                    
                    [s_minesweeper[i] setPosition:ccp(mineSweeperX[i],  mineSweeperY[i])];
                    
                    //[playLayer setToBombingTimePlus:mineSweeperX[i] y:mineSweeperY[i]];
                }
                
                if(isMinesweeperTimer[i] < 12){
                    mineSweeperScale[i] += 0.1;
                }else{
                    mineSweeperScale[i] += (1 - mineSweeperScale[i])/15.0;
                }
                
                [s_minesweeper[i] setScale: mineSweeperScale[i]];
                
                if(isMinesweeperTimer[i] == 10){
                    isMinesweeperActiveForHurt[i] = true;
                }
                
                if(isMinesweeperTimer[i] == isMineseeperCanAppearingTime[i]){
                    //isMinesweeperIsDisappearing[i] = true;
                   // isMinesweeperTimer[i] = 0;
                   // isMinesweeperActiveForHurt[i] = false;
                    for(int j = 0 ; j < maxColumn ; j++){
                        if(isMinesweeper[j]){
                            isMinesweeperIsDisappearing[j] = true;
                             isMinesweeperTimer[j] = 0;
                             isMinesweeperActiveForHurt[j] = false;
                        }
                    }
                }
            }else{
                
                if(isMinesweeperTimer[i] == 1){
                    [playLayer setToShakingBomb:mineSweeperX[i] turtleY:mineSweeperY[i]];
                }
                
                if(isMinesweeperTimer[i] < 5){
                    mineSweeperScale[i] += 0.09;
                }else{
                    mineSweeperScale[i] += (0 - mineSweeperScale[i])/7.0;
                }
                
                [s_minesweeper[i] setScale: mineSweeperScale[i]];
                
                if(isMinesweeperTimer[i] == 20){
                    isMinesweeper[i] = false;
                    
                    [s_minesweeper[i] setPosition:ccp(10000,1000)];
                    howmanyMinesweeperOnScreen--;
                }
            }
            
            isMinesweeperTimer[i]++;
            
           /* printf("mine:%4.8f %4.8f %4.8f %4.8f %4c\n",s_minesweeper[i].position.x,s_minesweeper[i].position.y,s_minesweeper[i].scaleX,s_minesweeper[i].scaleY,s_minesweeper[i].opacity);*/
        }
        
        static int jumpToFuckStep;
        if(isTapTwoStep){
            jumpToFuckStep = 6;
        }else{
            jumpToFuckStep = 2;
        }
        
//printf("L:%i %i\n",[penguin jumpingAniStep],isTapTwoStep);
        
        if([penguin jumpingAniStep] > jumpToFuckStep && !isBeingAttack){
            if(isMinesweeperActiveForHurt[i]){
                if(i == columnIdx){
                    [self bombombomb];
                }
            }
        }
    }
}

-(void) bombombomb{
    [uILayer lostCombo];
    
    finalTimeRemain -= 10.05;
    //printf("finalTimeRemain:%4.8f\n",finalTimeRemain);
    //timeRemain += (finalTimeRemain - timeRemain)/10;
    gameRoundFromBegin = 0;
    
    isTapWronglyAndDisableBtns = true;
    
    canMinesweeper = false;
    isBeingAttack  = true;
    beingAttackTimer = 200;
    restingTimer = 60;
    
    static int bombgXPos;
    bombgXPos = columnIdx * 60 + 30;
    
    if(isIpad){
        [playLayer setToBombingGameoverWithPos:bombgXPos y:240];
    }else{
        [playLayer setToBombingGameoverWithPos:bombgXPos y:120];
    }
    
    
    if([penguin facingRight]){
        [penguin bombOutOffScreenDirection:kBombOutOffScreenDirection_Left_Penguin];
    }else{
        [penguin bombOutOffScreenDirection:kBombOutOffScreenDirection_Right_Penguin];
    }
    [penguin setToBombing];
    
    [self bombOutAllMinesweeper];
    
    
    /*for(int i = 0 ; i < maxColumn ; i++){
        [s_arrow[i] setOpacity:0];
    }*/
}

-(void) checkToGiveNextMinesweeper{
    if(maxHowmanyMinesweeperOnScreen == 0){
        return;
    }
    
    if(minesweeperTimer >= nextGenMinesweeperTime){
        [self genNextMinesweeper:2];
     
        if(howmanyMinesweeperOnScreen >= maxHowmanyMinesweeperOnScreen){
            minesweeperTimer = 0;
        }
    }
}

-(void) checkIfOutBoundary{
    static float pneuginOutX;
    
    if([penguin status] == kPenguinAniStatus_Jumping){
        
        static int checkOutsideBoudary;
        if(isIphone5){
            checkOutsideBoudary = 470 + 88;
        }if(isIpad){
            checkOutsideBoudary = 1004;
        }else{
            checkOutsideBoudary = 470;
        }
        
        if([penguin jumpingX] > checkOutsideBoudary && [penguin facingRight]){
            pneuginOutX  = [penguin jumpingX] - checkOutsideBoudary;
        
            
            //[penguin setX:pneuginOutX-28];
            static int apperarOffsetX;
            if(isIphone5){
                apperarOffsetX = -44;
            }else{
                apperarOffsetX = 0;
            }
            if(is2ndFucking){
                is2ndFucking = false;
                [penguin setX:-pneuginOutX - 20 - columnOffsetX + apperarOffsetX];
            }else{
                [penguin setX:-pneuginOutX - 20 + apperarOffsetX];
            }
             
            
            penguinJumpFinalX = columnX[columnIdx];
            
           // printf("PooooooooooooooooooK:%4.8f %4.8f %4.8f\n",[penguin jumpingX], [penguin x], penguinJumpFinalX);
            
        }
        
        if([penguin jumpingX] < 10 && ![penguin facingRight]){
            pneuginOutX  = [penguin jumpingX] - 10;
            //[penguin setX:pneuginOutX-28];
            
            static int setXValue;
            setXValue = 480;
            if(isIphone5){
                setXValue = 568;
            }
            if(isIpad){
                setXValue = 1024;
            }
            
            if(is2ndFucking){
                is2ndFucking = false;
                [penguin setX:setXValue - pneuginOutX + 20 + columnOffsetX];
            }else{
                [penguin setX:setXValue - pneuginOutX + 20];
            }
            
            
            penguinJumpFinalX = columnX[columnIdx];
            
         //printf("PooooooooooooooooooK:%i %4.8f %4.8f %4.8f\n", columnIdx,[penguin jumpingX], [penguin x], penguinJumpFinalX);
            
        }

        
         //printf("TTTPK:%4.8f %4.8f %4.8f\n",[penguin jumpingX], [penguin x], penguinJumpFinalX);
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
}

-(void) btnIsTappedInControlLayer:(int)_btnIdx{
   // printf("btnIsTappedInControlLayer:%i\n",_btnIdx);
   
    
    [musicController playThisSound:kSound_PenguinJump isLoop:NO gain:0.25];
    
    if(_btnIdx == 0){
        
        if([penguin status] != kPenguinAniStatus_Jumping){
            prevColumnIdx = columnIdx;
            isTapTwoStep = true;
            
            columnIdx-=2;
            if(columnIdx == -1){
                is2ndFucking = true;
                columnIdx = maxColumn-1;
                penguinJumpFinalX = columnX[0] - columnOffsetX;
                penguinJumpFinalY = columnY;
                
                if(isIphone5){
                    penguinJumpFinalX -= 44;
                }
                if(isIpad){
                    penguinJumpFinalX -= fuckOffsetJumpForIpad;
                }
                
            }else if(columnIdx == -2){
                columnIdx = maxColumn-2;
                penguinJumpFinalX = columnX[0] - columnOffsetX*2;
                penguinJumpFinalY = columnY;
                
                if(isIphone5){
                    penguinJumpFinalX -= 44;
                }
                
                if(isIpad){
                    penguinJumpFinalX -= fuckOffsetJumpForIpad;
                }
                
            }else{
                penguinJumpFinalX = columnX[columnIdx];
                penguinJumpFinalY = columnY;
                
            }
            
            [penguin setFacingRight:false];
            
            [penguin setJump:kPenguinJump_jumpTo2TurtleShell];
            
          //  [self checkToGiveNextMinesweeper];
            
        }else{
            [penguin setNext:kPenguinJump_jumpTo2TurtleShell isFacingRight:false];
        }
        
    }
    
    
    
    if(_btnIdx == 1){
        
        if([penguin status] != kPenguinAniStatus_Jumping){
             prevColumnIdx = columnIdx;
            
            columnIdx--;
            if(columnIdx < 0){
                columnIdx = maxColumn-1;
                penguinJumpFinalX = columnX[0] - columnOffsetX;
                penguinJumpFinalY = columnY;
                
                if(isIphone5){
                    penguinJumpFinalX -= 44;
                }
                
                if(isIpad){
                    penguinJumpFinalX -= fuckOffsetJumpForIpad;
                }
                
            }else{
                penguinJumpFinalX = columnX[columnIdx];
                penguinJumpFinalY = columnY;
            }

            
            [penguin setFacingRight:false];
            
            [penguin setJump:kPenguinJump_jumpTo1TurtleShell];
            
           // [self checkToGiveNextMinesweeper];
            
        }else{
            [penguin setNext:kPenguinJump_jumpTo1TurtleShell isFacingRight:false];
        }
        
        
    }
    if(_btnIdx == 2){
        
        if([penguin status] != kPenguinAniStatus_Jumping){
             prevColumnIdx = columnIdx;
            
            columnIdx++;
            if(columnIdx >= maxColumn){
                columnIdx = 0;
                penguinJumpFinalX = columnX[maxColumn-1] + columnOffsetX;
                penguinJumpFinalY = columnY;
                
                if(isIphone5){
                    penguinJumpFinalX += 44;
                }
                
                if(isIpad){
                    penguinJumpFinalX += fuckOffsetJumpForIpad;
                }

            }else{
                penguinJumpFinalX = columnX[columnIdx];
                penguinJumpFinalY = columnY;
            }
            
            
            [penguin setFacingRight:true];
            
            [penguin setJump:kPenguinJump_jumpTo1TurtleShell];
            
            //[self checkToGiveNextMinesweeper];
            
        }else{
            [penguin setNext:kPenguinJump_jumpTo1TurtleShell isFacingRight:true];
        }

    }
    if(_btnIdx == 3){
        
        if([penguin status] != kPenguinAniStatus_Jumping){
             prevColumnIdx = columnIdx;
            isTapTwoStep = true;
            
            columnIdx+=2;
            if(columnIdx == maxColumn){
                columnIdx = 0;
                penguinJumpFinalX = columnX[maxColumn-1] + columnOffsetX;
                penguinJumpFinalY = columnY;
                is2ndFucking = true;
                
                if(isIphone5){
                    penguinJumpFinalX += 44;
                }
                
                if(isIpad){
                    penguinJumpFinalX += fuckOffsetJumpForIpad;
                }
                
            }else if(columnIdx == maxColumn+1){
                columnIdx = 1;
                penguinJumpFinalX = columnX[maxColumn-1] + columnOffsetX*2;
                penguinJumpFinalY = columnY;
                
                if(isIphone5){
                    penguinJumpFinalX += 44;
                }
                
                if(isIpad){
                    penguinJumpFinalX += fuckOffsetJumpForIpad;
                }
                
            }else{
                penguinJumpFinalX = columnX[columnIdx];
                penguinJumpFinalY = columnY;
            }
            
            [penguin setFacingRight:true];
            
            [penguin setJump:kPenguinJump_jumpTo2TurtleShell];
            
           // [self checkToGiveNextMinesweeper];
            
        }else{
            [penguin setNext:kPenguinJump_jumpTo2TurtleShell isFacingRight:true];
        }
    }
}

-(void) tapTurtle{

}

-(void) bombOutAllMinesweeper{
    for(int i = 0 ; i < maxColumn ; i++){
        if(isMinesweeper[i]){
            isMinesweeperActiveForHurt[i] = false;
            isMinesweeper[i] = false;
            [s_minesweeper[i] setPosition:ccp(10000,1000)];
            [playLayer setToBombingTimePlus:mineSweeperX[i] y:mineSweeperY[i]];
            
            howmanyMinesweeperOnScreen--;
        }
    }
}

-(void) restart{
    [self bombombomb];
    [super updateGameLevel];
    finalTimeRemain = maxTime;
}

-(void) dealloc
{
	printf("Mini 10 Dealloc\n");
    
    [penguin release];
    for(int i = 0 ; i < maxColumn ; i++){
        [turtle[i] release];
    }
    
	[super dealloc];
}

@end
