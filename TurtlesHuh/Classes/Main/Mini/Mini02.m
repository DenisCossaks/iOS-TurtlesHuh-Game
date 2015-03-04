//
//  Mini02.m
//  TurtlesHuh
//
//  Created by  on 2012/4/29.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "Mini02.h"
#import "GamePlayGlobal.h"
#import "Global.h"

@implementation Mini02

-(void) updateGameLevel{
    comboColorLimit[0] = 0;
    comboColorLimit[1] = 3;
    comboColorLimit[2] = 6;
    comboColorLimit[3] = 9;
    comboColorLimit[4] = 12;
    comboColorLimit[5] = 15;
    comboColorLimit[6] = 18;
    comboColorLimit[7] = 21;
    comboColorLimit[8] = 24;
    comboColorLimit[9] = 27;
    comboColorLimit[10] = 30;
    
    if(gameRound <= 4){
        gameLevel = 0;
    }else if(gameRound <= 8){
        gameLevel = 1;
    }else if(gameRound <= 14){
        gameLevel = 2;
    }else if(gameRound <= 20){
        gameLevel = 3;
    }else if(gameRound <= 26){
        gameLevel = 4;
    }else if(gameRound <= 32){
        gameLevel = 5;
    }else if(gameRound <= 40){
        gameLevel = 6;
    }else if(gameRound <= 48){
        gameLevel = 7;
    }else if(gameRound <= 56){
        gameLevel = 8;
    }else if(gameRound <= 64){
        gameLevel = 9;
    }else if(gameRound <= 75){
        gameLevel = 10;
    }
    
    //MIN
    //script_ufo2MinV = 0.2;
   
    
    script_ufo2VxInterval = 0;
    script_ufo2VyInterval = 0;
    script_ufo2VRInterval = 1.5;
    
    if(gameLevel == 0){
        ufoTypeAppearRatio[0] = 100;
        ufoTypeAppearRatio[1] = 100;
        ufoTypeAppearRatio[2] = 100;
        
        script_howmanyUFOGenMin = 2;
        script_howmanyUFOGenRatio = 3;
        
        script_digitLowerLimit = 2;
        script_digitUpperLimit = 2;
        script_lowerUpperOffsetRatio = 2;
    }
    if(gameLevel == 1){
        ufoTypeAppearRatio[0] = 80;
        ufoTypeAppearRatio[1] = 100;
        ufoTypeAppearRatio[2] = 100;
        
        script_howmanyUFOGenMin = 3;
        script_howmanyUFOGenRatio = 3;
        
        script_digitLowerLimit = 2;
        script_digitUpperLimit = 3;
        script_lowerUpperOffsetRatio = 2;
        
        script_ufo2MinV = 0.2;
    }
    if(gameLevel == 2){
        ufoTypeAppearRatio[0] = 60;
        ufoTypeAppearRatio[1] = 100;
        ufoTypeAppearRatio[2] = 100;
        
        script_howmanyUFOGenMin = 3;
        script_howmanyUFOGenRatio = 4;
        
        script_digitLowerLimit = 2;
        script_digitUpperLimit = 3;
        script_lowerUpperOffsetRatio = 2;
        
        script_ufo2MinV = 0.3;
    }
    if(gameLevel == 4){
        ufoTypeAppearRatio[0] = 60;
        ufoTypeAppearRatio[1] = 90;
        ufoTypeAppearRatio[2] = 100;
        
        script_howmanyUFOGenMin = 4;
        script_howmanyUFOGenRatio = 5;
        
        script_digitLowerLimit = 3;
        script_digitUpperLimit = 3;
        script_lowerUpperOffsetRatio = 3;
        
        script_ufo2MinV = 0.4;
        
        script_ufo3IntervalTime = 60;
        script_ufo3SpeendRatio = 6;
        script_ufo3MinSpeed = 3;
    }
    if(gameLevel == 5){
        ufoTypeAppearRatio[0] = 50;
        ufoTypeAppearRatio[1] = 85;
        ufoTypeAppearRatio[2] = 100;
        
        script_howmanyUFOGenMin = 5;
        script_howmanyUFOGenRatio = 5;
        
        script_digitLowerLimit = 3;
        script_digitUpperLimit = 3;
        script_lowerUpperOffsetRatio = 3;
        
        script_ufo2MinV = 0.4;
        
        script_ufo3IntervalTime = 60;
        script_ufo3SpeendRatio = 6;
        script_ufo3MinSpeed = 4;
    }
    if(gameLevel == 6){
        ufoTypeAppearRatio[0] = 45;
        ufoTypeAppearRatio[1] = 80;
        ufoTypeAppearRatio[2] = 100;
        
        script_howmanyUFOGenMin = 5;
        script_howmanyUFOGenRatio = 7;
        
        script_digitLowerLimit = 2;
        script_digitUpperLimit = 2;
        script_lowerUpperOffsetRatio = 3;
        
        script_ufo2MinV = 0.5;
        
        script_ufo3IntervalTime = 60;
        script_ufo3SpeendRatio = 6;
        script_ufo3MinSpeed = 5;
    }
    if(gameLevel == 7){
        ufoTypeAppearRatio[0] = 40;
        ufoTypeAppearRatio[1] = 75;
        ufoTypeAppearRatio[2] = 100;
        
        script_howmanyUFOGenMin = 6;
        script_howmanyUFOGenRatio = 8;
        
        script_digitLowerLimit = 2;
        script_digitUpperLimit = 2;
        script_lowerUpperOffsetRatio = 3;
        
        script_ufo2MinV = 0.5;
        
        script_ufo3IntervalTime = 60;
        script_ufo3SpeendRatio = 6;
        script_ufo3MinSpeed = 5;
    }
    
    if(gameLevel == 8){
        ufoTypeAppearRatio[0] = 33;
        ufoTypeAppearRatio[1] = 66;
        ufoTypeAppearRatio[2] = 100;
        
        script_howmanyUFOGenMin = 7;
        script_howmanyUFOGenRatio = 8;
        
        if(arc4random() % 2 == 0){
            script_digitLowerLimit = 1;
            script_digitUpperLimit = 2;
        }else{
            script_digitLowerLimit = 2;
            script_digitUpperLimit = 1;
        }
        script_lowerUpperOffsetRatio = 4;
        
        script_ufo2MinV = 0.6;
        
        script_ufo3IntervalTime = 60;
        script_ufo3SpeendRatio = 6;
        script_ufo3MinSpeed = 5;
    }
    if(gameLevel == 9){
        ufoTypeAppearRatio[0] = 33;
        ufoTypeAppearRatio[1] = 66;
        ufoTypeAppearRatio[2] = 100;
        
        script_howmanyUFOGenMin = 8;
        script_howmanyUFOGenRatio = 9;
        
        if(arc4random() % 2 == 0){
            script_digitLowerLimit = 1;
            script_digitUpperLimit = 2;
        }else{
            script_digitLowerLimit = 2;
            script_digitUpperLimit = 1;
        }
        script_lowerUpperOffsetRatio = 4;
        
        script_ufo2MinV = 0.6;
        
        script_ufo3IntervalTime = 45;
        script_ufo3SpeendRatio = 6;
        script_ufo3MinSpeed = 5;
    }
    if(gameLevel == 10){
        ufoTypeAppearRatio[0] = 33;
        ufoTypeAppearRatio[1] = 66;
        ufoTypeAppearRatio[2] = 100;
        
        script_howmanyUFOGenMin = 8;
        script_howmanyUFOGenRatio = 12;
        
        if(arc4random() % 2 == 0){
            script_digitLowerLimit = 1;
            script_digitUpperLimit = 2;
        }else{
            script_digitLowerLimit = 2;
            script_digitUpperLimit = 1;
        }
        script_lowerUpperOffsetRatio = 3;
        
        script_ufo2MinV = 0.7;
        
        script_ufo3IntervalTime = 40;
        script_ufo3SpeendRatio = 6;
        script_ufo3MinSpeed = 7;
    }
    
    
  //  printf("update:%i %i\n",gameLevel, gameRound);
}

-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
        
        comoboReduceSpeed = 0.0005;
        
        maxTime = 50;
        timeRemain = maxTime;
        
        [self updateGameLevel];
        
		wholeTurtleScaleFromSocurce = 1.0;
        wholePenguinScaleFromSocurce = 0.5;
        
       
        
        
        s_bg = [CCSprite spriteWithFile:@"mini_02_bg.png"];
        [s_bg setPosition:ccp([UIScreen mainScreen].bounds.size.height/2, [UIScreen mainScreen].bounds.size.width/2)];
		[self addChild:s_bg];
        
 
        
        [self initGenNext];
        [self initCharacters];
        [self initGeneralCharacter];
        [self initLarging];
        [self initPanel];
        [self initCorrectWrong];
        
    }
	return self;
}

-(void) initPanel{
    CCSprite* s_tempPanel = [CCSprite spriteWithFile:@"tempPanel.png"];
    
    if (isIpad) {
        [s_tempPanel setPosition:ccp([UIScreen mainScreen].bounds.size.height/2,78)];
    }else{
        [s_tempPanel setPosition:ccp([UIScreen mainScreen].bounds.size.height/2,39)];
    }
    
    [self addChild:s_tempPanel z:kDeapth_miniBasic];
    
    s_tempWrongNotice = [CCSprite spriteWithFile:@"tempWrongNotice.png"];
    [s_tempWrongNotice setPosition:ccp(24000,41)];
    [self addChild:s_tempWrongNotice z:kDeapth_miniBasic];
    
    maxDigitNumber = 4;
    for(int i = 0 ; i < maxDigitNumber ; i++){
        for(int j = 0 ; j < 2 ; j++){
            s_digits[i][j] = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(0,0,0,0)];
            [ss_Character addChild:s_digits[i][j]];
            [s_digits[i][j] setPosition:ccp(10000,10000)];
            [s_digits[i][j] setScale:0.9];
        }
    }
    
    digit_textureX = 1400/textureRatioForFuckingIpad;
    digit_textureY = 834/textureRatioForFuckingIpad;
    digit_textureWidth = 50/textureRatioForFuckingIpad;
    digit_textureHeight = 62/textureRatioForFuckingIpad;
    
    digit_posX[0] = 160;
    digit_posX[1] = 320;
    digit_posX[2] = 160;
    digit_posX[3] = 320;
    
    if(isIphone5){
        digit_posX[0] += 44;
        digit_posX[1] += 44;
        digit_posX[2] += 44;
        digit_posX[3] += 44;
    }
    
    digit_posY[0] = 65-5;
    digit_posY[1] = 65-5;
    digit_posY[2] = 20-5;
    digit_posY[3] = 20-5;
    
    if(isIpad){
        digit_posX[0] = -(240 - 160) * 2 + 512;
        digit_posX[1] = -(240 - 320) * 2 + 512;
        digit_posX[2] = -(240 - 160) * 2 + 512;
        digit_posX[3] = -(240 - 320) * 2 + 512;
        
        digit_posY[0] = -(160 - 60) * 2 + 384 - 58;
        digit_posY[1] = -(160 - 60) * 2 + 384 - 58;
        digit_posY[2] = -(160 - 15) * 2 + 384 - 58;
        digit_posY[3] = -(160 - 15) * 2 + 384 - 58;
    }
    
}

-(void) initLarging{
    isLarging = false;
    isAllowLarging = false;
    isAllowLargingTimer = 0;
    isLargingTimer = 0;
}

-(void) initGenNext{
    genNextTimer = 10;
    hasGen = false;
}

-(void) initCharacters{
    maxPenguin = 0;
    maxTurtle = 0;
    
    for(int i = 0 ; i < maxPenguin ; i++){
        penguin[i] = [[Penguin alloc] init];
        [penguin[i] setX:99999];
        [penguin[i] setY:99999];
        [penguin[i] setStatus:kPenguinAniStatus_Idle];
        //[penguin setDelegate:self]
    }
    
    for(int i = 0 ; i < maxTurtle ; i++){
        turtle[i] = [[Turtle alloc] init];
        [turtle[i] setX:99999];
        [turtle[i] setY:99999];
        [turtle[i] setStatus:kTurtleAniStatus_Normal_In];
        [turtle[i] setIdNumber:i];
        [turtle[i] setDelegate:self];
    }
}

-(void) initGeneralCharacter{
    ufo1Idx = 0;
    ufo2Idx = 0;
    ufo3Idx = 0;
    maxUfoInOneType = 20;
    
    for(int i = 0 ; i < maxUfoInOneType ; i++){
        s_ufo1[i] = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(396/textureRatioForFuckingIpad,204/textureRatioForFuckingIpad,108/textureRatioForFuckingIpad,70/textureRatioForFuckingIpad)];
        [ss_Character addChild: s_ufo1[i]];
        [s_ufo1[i] setPosition:ccp(10000,10000)];
    }
    for(int i = 0 ; i < maxUfoInOneType ; i++){
        s_ufo2[i] = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(948/textureRatioForFuckingIpad,370/textureRatioForFuckingIpad,108/textureRatioForFuckingIpad,76/textureRatioForFuckingIpad)];
        [ss_Character addChild: s_ufo2[i]];
        [s_ufo2[i] setPosition:ccp(10000,10000)];
    }
    for(int i = 0 ; i < maxUfoInOneType ; i++){
        s_ufo3[i] = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1090/textureRatioForFuckingIpad,552/textureRatioForFuckingIpad,108/textureRatioForFuckingIpad,86/textureRatioForFuckingIpad)];
        [ss_Character addChild: s_ufo3[i]];
        [s_ufo3[i] setPosition:ccp(10000,10000)];
    }
    
    maxGeneralCharacter = 60;
    generalCharacterIdx = 0;
    
    for(int i = 0 ; i < maxGeneralCharacter ; i++){
        generalMini02Character[i] = malloc(sizeof(eGeneralMini02Character));
        generalMini02Character[i]->isAni = false;
        generalMini02Character[i]->posX = -99999;
        generalMini02Character[i]->posY = -99999;
    }
    
}

-(void) manage:(ccTime) dt{
    [self manageGenNext];
    [self manageGneralCharacter];
    [self manageIsLarging];
    
    for(int i = 0 ; i < maxTurtle ; i++){
        [turtle[i] manage:dt];
    }
    
    for(int i = 0 ; i < maxPenguin ; i++){
        [penguin[i] manage];
    }
    
    [self runCorrectWrongAni];
    
}

-(void) manageIsLarging{
    if(isAllowLarging){
        isAllowLargingTimer++;
        
        if(!isLarging){
            isLargingTimer++;
            if(isLargingTimer == 60){
                isLarging = true;
                isLargingTimer = 0;
                [self genIsLarging];
            }
        }else{
            isLargingTimer++;
            if(isLargingTimer == 60){
                isLarging = false;
                isLargingTimer = 0;
            }
        }
        
        /*if(isAllowLargingTimer == 1){
            isLarging = true;
            isLargingTimer = 0;
        }*/
    }
    
    if(isLarging){
        if(isLargingTimer < 10){
            isLargingScale += 0.03;
        }else{
            isLargingScale += (0 - isLargingScale)/20;
        }
        
       // printf("isLarging:%4.8f\n",isLargingScale);
    }
}

-(void) genIsLarging{
    //printf("genIsLarging\n");
    
    isLargingScale = 0.0;
    
    for(int i = 0 ; i < maxGeneralCharacter ; i++){
        if(arc4random() % 2 == 0){
            generalCharacterIsLarging[i] = true;
        }else{
            generalCharacterIsLarging[i] = false;
        }
    }
}

-(void) manageGneralCharacter{
    if(hasGen){
        
        if(hasGenTimer < 10){
            generalCharacterScale += 0.13;
        }else{
            generalCharacterScale += ( 1 - generalCharacterScale)/5;
        }
        
        hasGenTimer++;
    }

    
    for(int i = 0 ; i < maxGeneralCharacter ; i++){
        if(generalMini02Character[i]->isAni){
            
          //  printf("G:%i %4.8f %4.8f\n",i, generalMini02Character[i]->vx,generalMini02Character[i]->vy);
            
            if(generalMini02Character[i]->ufoType == 2){
                generalMini02Character[i]->ufoIntervalTimer++;
                if(generalMini02Character[i]->ufoIntervalTimer >= generalMini02Character[i]->ufoInteveral){
                    generalMini02Character[i]->ufoIntervalTimer = 0;
                    
                    static int fuckUFORanAngle;
                    if(isIphone5){
                        fuckUFORanAngle = arc4random() % 448;
                    }else{
                        fuckUFORanAngle = arc4random() % 360;
                    }
                    
                    generalMini02Character[i]->ufoVx = generalMini02Character[i]->ufoSpeed * cos((float)fuckUFORanAngle * M_PI/180);
                    generalMini02Character[i]->ufoVy = generalMini02Character[i]->ufoSpeed * sin((float)fuckUFORanAngle * M_PI/180);
                    
                    generalMini02Character[i]->vx = generalMini02Character[i]->ufoVx;
                    generalMini02Character[i]->vy = generalMini02Character[i]->ufoVy;
                    
                   

                }
                
                generalMini02Character[i]->vx += (0 - generalMini02Character[i]->vx)/20;
                generalMini02Character[i]->vy += (0 - generalMini02Character[i]->vy)/20;
            }

            generalMini02Character[i]->posX +=  generalMini02Character[i]->vx;
            generalMini02Character[i]->posY +=  generalMini02Character[i]->vy;
            generalMini02Character[i]->r += generalMini02Character[i]->vr;
            
            
            if(generalMini02Character[i]->posX < 20){
                generalMini02Character[i]->posX = 20;
                 generalMini02Character[i]->vx *= -1;
            }
            
            static int boundaryY;
            if(isIphone5){
                boundaryY = 548;
            }else{
                boundaryY = 460;
            }
            
            if(isIpad){
                boundaryY = 1024-40;
            }
            
            if(generalMini02Character[i]->posX > boundaryY){
                generalMini02Character[i]->posX = boundaryY;
                 generalMini02Character[i]->vx *= -1;
            }
            
            if(isIpad){
                if(generalMini02Character[i]->posY < 200){
                    generalMini02Character[i]->posY = 200;
                    generalMini02Character[i]->vy *= -1;
                }
                if(generalMini02Character[i]->posY > 728){
                    generalMini02Character[i]->posY = 728;
                    generalMini02Character[i]->vy *= -1;
                }
            }else{
                if(generalMini02Character[i]->posY < 100){
                    generalMini02Character[i]->posY = 100;
                    generalMini02Character[i]->vy *= -1;
                }
                if(generalMini02Character[i]->posY > 300){
                    generalMini02Character[i]->posY = 300;
                    generalMini02Character[i]->vy *= -1;
                }
            }
           

            static float tempFuckScale = 1.15;
            
            if(generalMini02Character[i]->whichType == 0){
                if(generalMini02Character[i]->ufoType == 0){
                    [s_ufo1[generalMini02Character[i]->ufoIdx] setPosition:ccp(generalMini02Character[i]->posX,generalMini02Character[i]->posY)];
                    [s_ufo1[generalMini02Character[i]->ufoIdx] setRotation:generalMini02Character[i]->r];
                    
                    if(generalCharacterIsLarging[i]){
                        [s_ufo1[generalMini02Character[i]->ufoIdx] setScale:(generalCharacterScale + isLargingScale) * tempFuckScale];
                    }else{
                        [s_ufo1[generalMini02Character[i]->ufoIdx] setScale:generalCharacterScale * tempFuckScale];
                    }
                }
                
                if(generalMini02Character[i]->ufoType == 1){
                    [s_ufo2[generalMini02Character[i]->ufoIdx] setPosition:ccp(generalMini02Character[i]->posX,generalMini02Character[i]->posY)];
                    [s_ufo2[generalMini02Character[i]->ufoIdx] setRotation:generalMini02Character[i]->r];
                    
                    if(generalCharacterIsLarging[i]){
                        [s_ufo2[generalMini02Character[i]->ufoIdx] setScale:(generalCharacterScale + isLargingScale) * tempFuckScale];
                    }else{
                        [s_ufo2[generalMini02Character[i]->ufoIdx] setScale:generalCharacterScale * tempFuckScale];
                    }
                }
                
                if(generalMini02Character[i]->ufoType == 2){
                    [s_ufo3[generalMini02Character[i]->ufoIdx] setPosition:ccp(generalMini02Character[i]->posX,generalMini02Character[i]->posY)];
                    [s_ufo3[generalMini02Character[i]->ufoIdx] setRotation:generalMini02Character[i]->r];
                    
                    if(generalCharacterIsLarging[i]){
                        [s_ufo3[generalMini02Character[i]->ufoIdx] setScale:(generalCharacterScale + isLargingScale) * tempFuckScale];
                    }else{
                        [s_ufo3[generalMini02Character[i]->ufoIdx] setScale:generalCharacterScale * tempFuckScale];
                    }
                }
                
            }
        }
    }
}

-(void) manageGenNext{
    if(!hasGen){
        genNextTimer--;
        if(genNextTimer == 0){
            hasGen = true;
            hasGenTimer = 0;
            [self genNext];
        }
    }
}

-(void) genNext{
    [self updateGameLevel];
   
    [musicController playThisSound:kSound_Minesweeper isLoop:NO gain:0.65];
    [musicController playThisSound:kSound_MinesweeperV2 isLoop:NO gain:0.35];
    
    isAllowLarging = true;
    isAllowLargingTimer = 0;
    isLargingTimer = 0;
    
    static int fuckRan;
    fuckRan = arc4random() % script_howmanyUFOGenRatio;
    
    howmanyTurtleOnScreen = fuckRan + script_howmanyUFOGenMin;
    howmanyPenguinOnScreen = 0;
    
    if(gameRound < 2){
        if(arc4random() % 2 == 0){
            howmanyTurtleOnScreen = 2;
        }else{
            howmanyTurtleOnScreen = 3;
        }
    }
        
    
    correctAnswer = howmanyTurtleOnScreen;
    // printf("genNext:%i\n",howmanyTurtleOnScreen);
    
    generalCharacterScale = 0.0;
    
    static int howmanyGen;
    howmanyGen = howmanyTurtleOnScreen;
    while (howmanyGen > 0) {
        [self genOneGeneralCharacter:0];

        howmanyGen--;
    }
    
    howmanyGen = howmanyPenguinOnScreen;
    while (howmanyGen > 0) {
        [self genOneGeneralCharacter:1];

        howmanyGen--;
    }
    
    [self genDigits];
}

-(void) genDigits{
    for(int i = 0 ; i < maxDigitNumber ; i++){
        for(int j = 0 ; j < 2 ; j++){
            [s_digits[i][j] setPosition:ccp(10000,10000)];
        }
    }
    
    static int maxToMinDiff;
    maxToMinDiff = script_digitUpperLimit + script_digitLowerLimit + 1; //1 for correctAnswer
    
    correctAnswerIdx = arc4random() % maxDigitNumber;
    
    for(int i = 0 ; i < maxDigitNumber ; i++){
        digits[i] = -1;
    }
    
    static int ranUpperLowerOffset;
    
    ranUpperLowerOffset = arc4random() % script_lowerUpperOffsetRatio;
    if(arc4random() % 2 == 0){
        ranUpperLowerOffset *= -1;
    }
    
   // printf("ranUpperLowerOffset:%i\n",ranUpperLowerOffset);
    
    static int hasCollideTime;
    hasCollideTime = 0;
    
    for(int i = 0 ; i < maxDigitNumber ; i++){
        if(correctAnswerIdx == i){
            digits[i] = howmanyTurtleOnScreen;
        }else{
            
            static bool hasCollide;
            static int ranDigit;
            
            
            do {
                hasCollide = false;
                
                ranDigit = arc4random() % maxToMinDiff;
                ranDigit += correctAnswer - script_digitLowerLimit;
                      
                ranDigit += ranUpperLowerOffset;
                
                if(ranDigit <= 0){
                    hasCollide = true;
                }
                
                if(ranDigit == correctAnswer){
                    hasCollide = true;
                }
                
                for(int j = 0 ; j < maxDigitNumber ; j++){
                    if(ranDigit == digits[j]){
                        hasCollide = true;
                    }
                }
                
                hasCollideTime++;
                if(hasCollideTime == 100){
                    ranUpperLowerOffset = 0;
                }
                
            } while (hasCollide);
              
            digits[i] = ranDigit;
        }
    }
    
        
    for(int i = 0 ; i < maxDigitNumber ; i++){
        if(digits[i] <= 9){
            [s_digits[i][0] setTextureRect:CGRectMake(digit_textureX + digits[i] * digit_textureWidth, digit_textureY, digit_textureWidth, digit_textureHeight)];
            
            [s_digits[i][0] setPosition:ccp(digit_posX[i], digit_posY[i])];
            
        }else{
            static int firtDigit;
            static int secondDigit;
            
            firtDigit = digits[i]/10;
            secondDigit = digits[i] - firtDigit * 10;
            
           // printf("i:%i %i %i\n",i,firtDigit,secondDigit);
            
            [s_digits[i][0] setTextureRect:CGRectMake(digit_textureX + secondDigit * digit_textureWidth, digit_textureY, digit_textureWidth, digit_textureHeight)];
            [s_digits[i][1] setTextureRect:CGRectMake(digit_textureX + firtDigit * digit_textureWidth, digit_textureY, digit_textureWidth, digit_textureHeight)];
            
            [s_digits[i][0] setPosition:ccp(digit_posX[i]+10*2/textureRatioForFuckingIpad, digit_posY[i])];
            [s_digits[i][1] setPosition:ccp(digit_posX[i]-10*2/textureRatioForFuckingIpad, digit_posY[i])];
            
        }
    }
    
}

-(void) genOneGeneralCharacter:(int)_whichType{
    
    static int fuckRanX;
    static int fuckRanY;
    static float simX;
    static float simY;
    
    generalMini02Character[generalCharacterIdx]->isAni = true;
    
    static bool continueFuck;
    static int fuckTooManyNumber;
    
    fuckTooManyNumber = 0;
    sperateSpace = 70;
    
    if(isIpad){
        sperateSpace *= 2;
    }
    
    do{
        continueFuck = false;
        
        if(isIpad){
            fuckRanX = arc4random()% 870;
            fuckRanY = arc4random()% 350;
            simX = (float)fuckRanX + 70;
            simY = (float)fuckRanY + 230;
        }else{
            fuckRanX = arc4random()% 410;
            fuckRanY = arc4random()% 140;
            simX = (float)fuckRanX + 35;
            simY = (float)fuckRanY + 115;

        }
        
        for(int i = 0 ; i < maxGeneralCharacter ; i++){
            if( i != generalCharacterIdx){
                if(simX - generalMini02Character[i]->posX < sperateSpace && simX - generalMini02Character[i]->posX > -sperateSpace){
                    if(simY - generalMini02Character[i]->posY < sperateSpace && simY - generalMini02Character[i]->posY > -sperateSpace){
                        continueFuck = true;
                        fuckTooManyNumber++;
                        
                     //   printf("inside:%i %i\n",generalCharacterIdx,sperateSpace);
                      //  printf("insideA:%i %4.8f %4.8f %4.8f %4.8f\n",i,simX,simY, generalMini02Character[i]->posX, generalMini02Character[i]->posY);
                        
                        if(fuckTooManyNumber % 4 == 0){
                             sperateSpace--;
                        }
                       
                        
                        if(fuckTooManyNumber == 280){
                            printf("too many fuck\n");
                            
                            if(_whichType == 0){
                                howmanyTurtleOnScreen--;
                            }
                            if(_whichType == 1){
                                howmanyPenguinOnScreen--;
                            }
                            
                            return;
                        }
                    }
                }
            }
            
        }
        
    }while(continueFuck);
    
   // printf("sperateSpace:%i\n",sperateSpace);
    
    generalMini02Character[generalCharacterIdx]->posX = simX;
    generalMini02Character[generalCharacterIdx]->posY = simY;
    
   // printf("FI:%i %4.8f  %4.8f\n",generalCharacterIdx,  generalMini02Character[generalCharacterIdx]->posX, generalMini02Character[generalCharacterIdx]->posY);
    
    generalMini02Character[generalCharacterIdx]->whichType = _whichType;
    
    if(_whichType == 0){
        generalMini02Character[generalCharacterIdx]->idxR = turtleIdx;
        turtleIdx++;
        if(turtleIdx == maxTurtle){
            turtleIdx = 0;
        }
    }
    if(_whichType == 1){
        generalMini02Character[generalCharacterIdx]->idxR = penguinIdx;
        penguinIdx++;
        if(penguinIdx == maxPenguin){
            penguinIdx = 0;
        }
    }
    
    if(_whichType == 0){
        // [turtle[generalMini02Character[generalCharacterIdx]->idxR] setStatus:kTurtleAniStatus_Out];
    }
    
    
    static int ufoRanType;
    ufoRanType = arc4random() % 100;
    if(ufoRanType < ufoTypeAppearRatio[0]){
        generalMini02Character[generalCharacterIdx]->ufoType = 0;
        generalMini02Character[generalCharacterIdx]->ufoIdx = ufo1Idx;
        
        ufo1Idx++;
        if(ufo1Idx >= maxUfoInOneType){
            ufo1Idx = 0;
        }
    }else if(ufoRanType < ufoTypeAppearRatio[1]){
        generalMini02Character[generalCharacterIdx]->ufoType = 1;
        generalMini02Character[generalCharacterIdx]->ufoIdx = ufo2Idx;
        
        ufo2Idx++;
        if(ufo2Idx >= maxUfoInOneType){
            ufo2Idx = 0;
        }
    }else{
        generalMini02Character[generalCharacterIdx]->ufoType = 2;
        generalMini02Character[generalCharacterIdx]->ufoIdx = ufo3Idx;
        
        ufo3Idx++;
        if(ufo3Idx >= maxUfoInOneType){
            ufo3Idx = 0;
        }
    }
    
    
   
    
    if(generalMini02Character[generalCharacterIdx]->ufoType == 0){
        generalMini02Character[generalCharacterIdx]->vx = 0;
        generalMini02Character[generalCharacterIdx]->vy = 0;
        generalMini02Character[generalCharacterIdx]->r = 0;
        generalMini02Character[generalCharacterIdx]->vr = 0;
    }
    
    if(generalMini02Character[generalCharacterIdx]->ufoType == 1){
        static int fuckRan;
        /*fuckRan = arc4random()% 100;
        generalMini02Character[generalCharacterIdx]->vx = script_ufo2MinV + (float)fuckRan/100.0 * script_ufo2VxInterval - script_ufo2VxInterval/2;
        
        fuckRan = arc4random()% 100;
        generalMini02Character[generalCharacterIdx]->vy = script_ufo2MinV + (float)fuckRan/100.0 * script_ufo2VyInterval - script_ufo2VyInterval/2;*/
        
        static float fuckRanVelocity;
        fuckRan = arc4random()% 100;
        fuckRanVelocity = script_ufo2MinV + (float)fuckRan/100.0 * script_ufo2VxInterval - script_ufo2VxInterval/2;
        
        static float fuckRanAngle;
        fuckRanAngle = arc4random()% 360;
        generalMini02Character[generalCharacterIdx]->vx = fuckRanVelocity * cos(fuckRanAngle);
        generalMini02Character[generalCharacterIdx]->vy = fuckRanVelocity * sin(fuckRanAngle);
        
        
        fuckRan = arc4random()% 100;
        generalMini02Character[generalCharacterIdx]->r = (float)fuckRan/100.0 * 2;
        
        fuckRan = arc4random()% 100;
        generalMini02Character[generalCharacterIdx]->vr =   0.0 + (float)fuckRan/100.0 * script_ufo2VRInterval;
        
        if(arc4random() % 2 == 0){
            generalMini02Character[generalCharacterIdx]->r *= -1;
            generalMini02Character[generalCharacterIdx]->vr *= -1;
        }
        
        //printf("L:%i %4.8f %4.8f\n",generalCharacterIdx, generalMini02Character[generalCharacterIdx]->vx,generalMini02Character[generalCharacterIdx]->vy);
        
       // generalMini02Character[generalCharacterIdx]->vy = 0.6;
       // generalMini02Character[generalCharacterIdx]->vx = 0.6;
    }
    
    if(generalMini02Character[generalCharacterIdx]->ufoType == 2){
        generalMini02Character[generalCharacterIdx]->vx = 0;
        generalMini02Character[generalCharacterIdx]->vy = 0;
        generalMini02Character[generalCharacterIdx]->r = 0;
        generalMini02Character[generalCharacterIdx]->vr = 0;
        
        generalMini02Character[generalCharacterIdx]->ufoIntervalTimer = 0;
        generalMini02Character[generalCharacterIdx]->ufoInteveral = script_ufo3IntervalTime;
        
        static int fuckUFORan;
        fuckUFORan = arc4random() % script_ufo3SpeendRatio;
        generalMini02Character[generalCharacterIdx]->ufoSpeed = (float)fuckUFORan + script_ufo3MinSpeed;
    }
    
    
     //[playLayer setToBombing:generalMini02Character[generalCharacterIdx]->posX turtleY:generalMini02Character[generalCharacterIdx]->posY];
    [playLayer setToShakingBomb:generalMini02Character[generalCharacterIdx]->posX turtleY:generalMini02Character[generalCharacterIdx]->posY];
    
    generalCharacterIdx++;
    if(generalCharacterIdx == maxGeneralCharacter){
        generalCharacterIdx = 0;
    }
    
}

-(void) ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    for( UITouch *touch in touches ) {
		CGPoint location = [touch locationInView: [touch view]];
		location = [[CCDirector sharedDirector] convertToGL: location];
        
        if(isIpad){
            if(location.y < 161 && location.y > 81){
                if(location.x < 517 && location.x > 149){
                    [self tap:0];
                }
                if(location.x < 906 && location.x > 517){
                    [self tap:1];
                }
            }
            
            if(location.y < 81){
                if(location.x < 517 && location.x > 149){
                    [self tap:2];
                }
                if(location.x < 906 && location.x > 517){
                    [self tap:3];
                }
            }
        }else{
            if(location.y < 88 && location.y > 37){
                if(location.x < 240 && location.x > 71){
                    [self tap:0];
                }
                if(location.x < 444 && location.x > 240){
                    [self tap:1];
                }
            }
            
            if(location.y < 37){
                if(location.x < 240 && location.x > 71){
                    [self tap:2];
                }
                if(location.x < 444 && location.x > 240){
                    [self tap:3];
                }
            }
        }
        
        
        
        printf("location:%4.8f %4.8f\n",location.x, location.y);
        
    }
}

-(void) tap:(int)_which{
    if(isCorrectWrongAni){
        return;
    }
    
    if(!hasGen){
        return;
    }
    
    tapWhich = _which;
    
    if(_which == correctAnswerIdx){
        [self correct];
    }else{
        [self wrong];
    }
}

-(void) initCorrectWrong{
    s_correct = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1400/textureRatioForFuckingIpad, 732/textureRatioForFuckingIpad, 318/textureRatioForFuckingIpad, 68/textureRatioForFuckingIpad)];
    [s_correct setPosition:ccp(10000,10000)];
    [ss_Character addChild:s_correct];
    
    s_wrong = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1112/textureRatioForFuckingIpad, 824/textureRatioForFuckingIpad, 268/textureRatioForFuckingIpad, 66/textureRatioForFuckingIpad)];
    [s_wrong setPosition:ccp(10000,10000)];
    [ss_Character addChild:s_wrong];
    
    
}

-(void) correct{
   // printf("correct\n");
   // printf("correct:%i\n",correctAnswer);
    counterForAchivement += correctAnswer;
    
    isCorrectWrongAni = true;
    
    correctWrongAniTimer = 0;
    
    isCorrect = true;
    [uILayer gainCombo:1];
    
    [musicController playThisSound:kSound_ComboTime isLoop:NO gain:0.5];
    [playLayer setToBombingTimePlus:[UIScreen mainScreen].bounds.size.height/2 y:[UIScreen mainScreen].bounds.size.width/2];
    
    gameRound++;
}

-(void) wrong{
  //  printf("wrong\n");
    isCorrectWrongAni = true;
    correctWrongAniTimer = 0;
 
    [uILayer lostCombo];
    
    isCorrect = false;
    [playLayer setToBombingGameoverWithPos:[UIScreen mainScreen].bounds.size.height/2 y:[UIScreen mainScreen].bounds.size.width/2];
    //[playLayer setToBombingTimePlus:[UIScreen mainScreen].bounds.size.height/2 y:[UIScreen mainScreen].bounds.size.width/2];
    [musicController playThisSound:kSound_ComboSmoke isLoop:NO gain:1.0];
    [musicController playThisSound:kSound_TurtleExplode02 isLoop:NO gain:1.0];
    [musicController playThisSound:kSound_TurtleExplode01 isLoop:NO gain:1.0];
    gameover_scale = 0;
}

-(void) runCorrectWrongAni{
    if(isCorrectWrongAni){
        if(isCorrect){
            if(correctWrongAniTimer == 0){
                plusTimeOpacity = 255;
                plusTimeSX = 0;
                plusTimeSY = 0;
                
                plusTimeX = [UIScreen mainScreen].bounds.size.height/2;
                plusTimeY = [UIScreen mainScreen].bounds.size.width/2;
            }
            
            if(correctWrongAniTimer < 10){
                plusTimeSX += 0.1;
                plusTimeSY += 0.1;
            }
            
            if(correctWrongAniTimer <= 18 && correctWrongAniTimer >= 10){
                plusTimeSX -= 0.02;
                plusTimeSY -= 0.02;
            }
            if(correctWrongAniTimer <= 25 && correctWrongAniTimer > 18){
                plusTimeSX += 0.02;
                plusTimeSY += 0.02;
            }
            if(correctWrongAniTimer <= 33 && correctWrongAniTimer > 25){
                plusTimeSX -= 0.02;
                plusTimeSY -= 0.02;
            }

            
            if(correctWrongAniTimer < 50 && correctWrongAniTimer > 33){
                plusTimeY += 5;
                plusTimeSX += 0.06;
                plusTimeSY += 0.06;
                plusTimeOpacity -= 38;
                if(plusTimeOpacity< 0){
                    plusTimeOpacity = 0;
                }
            }
            
            [s_correct setPosition:ccp(plusTimeX,plusTimeY)];
            [s_correct setOpacity:plusTimeOpacity];
            [s_correct setScaleX:plusTimeSX*1.2];
            [s_correct setScaleY:plusTimeSY*1.2];
            
            
        }else{
            gameover_scale += (1 - gameover_scale)/7;
            
            static int ranGameoverX;
            static int ranGameoverY;
            
            if(correctWrongAniTimer < 20){
                gameover_opacity = 255;
                ranGameoverX = arc4random() % 8 - 4;
                ranGameoverY = arc4random() % 8 - 4;
            }else if(correctWrongAniTimer < 40){
                ranGameoverX = arc4random() % 4 - 2;
                ranGameoverY = arc4random() % 4 - 2;
            }else if(correctWrongAniTimer < 58){
                ranGameoverX = arc4random() % 2 - 1;
                ranGameoverY = arc4random() % 2 - 1;
            }else if(correctWrongAniTimer < 65){
                ranGameoverX = 0;
                ranGameoverY = 0;
            }else{
                ranGameoverY += 4;
                gameover_opacity -= 25;
                if(gameover_opacity < 0){
                    gameover_opacity = 0;
                }
                gameover_scale+=0.05;
            }
            
            [s_wrong setPosition:ccp([UIScreen mainScreen].bounds.size.height/2 + ranGameoverX,[UIScreen mainScreen].bounds.size.width/2 + ranGameoverY)];
            [s_wrong setScale:gameover_scale*1.1];
            [s_wrong setOpacity:gameover_opacity];
            
            
            if(isIpad){
                if(correctAnswerIdx == 0){
                    [s_tempWrongNotice setPosition:ccp(-(240 - 163) * 2 + 512,60*2)];
                }
                if(correctAnswerIdx == 1){
                    [s_tempWrongNotice setPosition:ccp(-(240 - 319) * 2 + 512,60*2)];
                }
                if(correctAnswerIdx == 2){
                    [s_tempWrongNotice setPosition:ccp(-(240 - 163) * 2 + 512,20*2)];
                }
                if(correctAnswerIdx == 3){
                    [s_tempWrongNotice setPosition:ccp(-(240 - 319) * 2 + 512,20*2)];
                }
                
            }else{
                if(correctAnswerIdx == 0){
                    [s_tempWrongNotice setPosition:ccp(163,60)];
                }
                if(correctAnswerIdx == 1){
                    [s_tempWrongNotice setPosition:ccp(319,60)];
                }
                if(correctAnswerIdx == 2){
                    [s_tempWrongNotice setPosition:ccp(163,20)];
                }
                if(correctAnswerIdx == 3){
                    [s_tempWrongNotice setPosition:ccp(319,20)];
                }
                
            }
            
            
            if(isIphone5){
                [s_tempWrongNotice setPosition:ccp(s_tempWrongNotice.position.x + 44, s_tempWrongNotice.position.y)];
            }   
            
            if(correctWrongAniTimer < 10){
                [s_tempWrongNotice setOpacity:255];
            }else if(correctWrongAniTimer < 20){
                [s_tempWrongNotice setOpacity:0];
            }else if(correctWrongAniTimer < 30){
                [s_tempWrongNotice setOpacity:255];
            }else if(correctWrongAniTimer < 40){
                [s_tempWrongNotice setOpacity:0];
            }else if(correctWrongAniTimer < 60){
                [s_tempWrongNotice setOpacity:255];
                wrongNoticeOpacity = 255;
            }
            
            if(correctWrongAniTimer > 60){
                wrongNoticeOpacity -= 15;
                if(wrongNoticeOpacity < 0){
                    wrongNoticeOpacity = 0;
                }
                [s_tempWrongNotice setOpacity:wrongNoticeOpacity];
            }
            
            
        }
        
        correctWrongAniTimer++;
        
        if(isCorrect){
            if(correctWrongAniTimer == 42){
                [self prepareNextGen];
                isCorrectWrongAni = false;
            }
        }else{
            if(correctWrongAniTimer == 80){
                [self prepareNextGen];
                isCorrectWrongAni = false;
            }
        }
        
    }
}

-(void) prepareNextGen{
    for(int i = 0 ; i < maxGeneralCharacter ; i++){
        if(generalMini02Character[i]->isAni){
            generalMini02Character[i]->isAni = false;
            
            if(generalMini02Character[i]->ufoType == 0){
                [playLayer setToBombing:generalMini02Character[i]->posX turtleY:generalMini02Character[i]->posY];
                [s_ufo1[generalMini02Character[i]->ufoIdx] setPosition:ccp(10000,10000)];
            }
            if(generalMini02Character[i]->ufoType == 1){
                [playLayer setToBombing:generalMini02Character[i]->posX turtleY:generalMini02Character[i]->posY];
                [s_ufo2[generalMini02Character[i]->ufoIdx] setPosition:ccp(10000,10000)];
            }
            if(generalMini02Character[i]->ufoType == 2){
                [playLayer setToBombing:generalMini02Character[i]->posX turtleY:generalMini02Character[i]->posY];
                [s_ufo3[generalMini02Character[i]->ufoIdx] setPosition:ccp(10000,10000)];
            }
            
            generalMini02Character[i]->posX = 10000;
            generalMini02Character[i]->posY = 10000;
        }
    }
    
    isAllowLarging = false;
    isAllowLargingTimer = 0;
    isLargingScale = 0;
    isLarging = false;
    
    [self initGenNext];
}

@end
