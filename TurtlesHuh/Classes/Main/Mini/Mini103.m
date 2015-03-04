//
//  Mini103.m
//  TurtlesHuh
//
//  Created by apple on 12/11/5.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "Mini103.h"
#import "GamePlayGlobal.h"
#import "Global.h"

@implementation Mini103

-(void) reInitColorComboLimit{
    
    // printf("reInitColorComboLimit:%i\n",gameLevel);
    
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

-(void) updateGameLevel{
    //------------------GAME LEVEL MAX = 7-----------------------------//
    
    /*if(gameRound < 1){
        gameLevel = 0;
    }else if(gameRound < 10){
        gameLevel = 1;
    }else if(gameRound < 20){
        gameLevel = 2;
    }else if(gameRound < 30){
        gameLevel = 3;
    }else if(gameRound < 35){
        gameLevel = 4;
    }else if(gameRound < 40){
        gameLevel = 5;
    }else if(gameRound < 50){
        gameLevel = 6;
    }else if(gameRound < 60){
        gameLevel = 7;
    }*/
    if(gameRound < 1){
        gameLevel = 0;
    }else if(gameRound < 10){
        gameLevel = 1;
    }else if(gameRound < 13){
        gameLevel = 2;
    }else if(gameRound < 15){
        gameLevel = 3;
    }else if(gameRound < 25){
        gameLevel = 4;
    }else if(gameRound < 30){
        gameLevel = 5;
    }else if(gameRound < 33){
        gameLevel = 6;
    }else if(gameRound < 38){
        gameLevel = 7;
    }else if(gameRound < 41){
        gameLevel = 8;
    }else if(gameRound < 44){
        gameLevel = 9;
    }else if(gameRound < 49){
        gameLevel = 10;
    }else if(gameRound < 53){
        gameLevel = 11;
    }else if(gameRound < 56){
        gameLevel = 12;
    }else if(gameRound < 58){
        gameLevel = 13;
    }else if(gameRound < 59){
        gameLevel = 14;
    }else if(gameRound < 70){
        gameLevel = 15;
    }else if(gameRound < 85){
        gameLevel = 16;
    }else if(gameRound < 101){
        gameLevel = 17;
    }else{
        gameLevel = 18;
    }


    
    if(gameLevel == 1){
        comoboReduceSpeed = comboReduceSpeedAccum + 0.002;
    }else if(gameLevel == 2){
        comoboReduceSpeed = comboReduceSpeedAccum + 0.002;
    }else if(gameLevel == 3){
        comoboReduceSpeed = comboReduceSpeedAccum + 0.002;
    }else if(gameLevel == 4){
        comoboReduceSpeed = comboReduceSpeedAccum + 0.002;
    }else if(gameLevel == 5){
        comoboReduceSpeed = comboReduceSpeedAccum + 0.003;
    }else if(gameLevel == 6){
        comoboReduceSpeed = comboReduceSpeedAccum + 0.003;
    }else if(gameLevel == 7){
        comoboReduceSpeed = comboReduceSpeedAccum + 0.004;
    }else if(gameLevel == 8){
        comoboReduceSpeed = comboReduceSpeedAccum + 0.004;
    }else if(gameLevel == 9){
        comoboReduceSpeed = comboReduceSpeedAccum + 0.004;
    }else if(gameLevel == 10){
        comoboReduceSpeed = comboReduceSpeedAccum + 0.005;
    }else if(gameLevel == 11){
        comoboReduceSpeed = comboReduceSpeedAccum + 0.004;
    }else if(gameLevel == 12){
        comoboReduceSpeed = comboReduceSpeedAccum + 0.004;
    }else if(gameLevel == 13){
        comoboReduceSpeed = comboReduceSpeedAccum + 0.004;
    }else if(gameLevel == 14){
        comoboReduceSpeed = comboReduceSpeedAccum + 0.005;
    }else if(gameLevel == 15){
        comoboReduceSpeed = comboReduceSpeedAccum + 0.005;
    }else if(gameLevel == 16){
        comoboReduceSpeed = comboReduceSpeedAccum + 0.006;
    }else if(gameLevel == 17){
        comoboReduceSpeed = comboReduceSpeedAccum + 0.006;
    }else{
        comoboReduceSpeed = comboReduceSpeedAccum + 0.006;
    }
    
    if(comboReduceSpeedAccum < 0){
        comboReduceSpeedAccum += comboReduceSpeedAccumSpeed/20;  //0.003/30
    }else{
        comboReduceSpeedAccum = 0;
    }
    
    if(comoboReduceSpeed < 0.001){
        comoboReduceSpeed = 0.001;
    }
    
    //gameLevel = 6;
    
    [self reInitColorComboLimit];
    
    printf("updateGameLevel:%i %i %i %4.8f %4.8f %4.8f\n",gameLevel,gameRound, gameRoundFromBegin, comboReduceSpeedAccum, comoboReduceSpeed, comboReduceSpeedAccumSpeed);
    
    //------------------GAME LEVEL MAX = 7-----------------------------//
}



- (void)accelerometer:(UIAccelerometer*)accelerometer didAccelerate:(UIAcceleration*)acceleration
{

    if(isStopping){
        return;
    }
    
#define kFilterFactor2 0.175f
//#define kFilterFactor2 0.105f
    
    if(gOrientation == UIDeviceOrientationLandscapeRight){
        acceX = (float) acceleration.y * kFilterFactor2 + (1- kFilterFactor2)*prevX;
        acceY = (float) acceleration.x * kFilterFactor2 + (1- kFilterFactor2)*prevY;
    }else{
        //  printf("LEFT\n");
        acceX = (float) -acceleration.y * kFilterFactor2 + (1- kFilterFactor2)*prevX;
        acceY = (float) -acceleration.x * kFilterFactor2 + (1- kFilterFactor2)*prevY;
    }
    
    prevX = acceX;
    prevY = acceY;
    
    bulletTarget_x = [UIScreen mainScreen].bounds.size.height * acceX + [UIScreen mainScreen].bounds.size.height/2;
    if(acceX> 0.5){
        bulletTarget_x = [UIScreen mainScreen].bounds.size.height;
    }
    if(acceX < -0.5){
        bulletTarget_x = 0;
    }
    
    bulletTarget_y = [UIScreen mainScreen].bounds.size.width * -acceY + [UIScreen mainScreen].bounds.size.width/2;
    if(-acceY> 0.5){
        bulletTarget_y = [UIScreen mainScreen].bounds.size.width;
    }
    if(-acceY < -0.5){
        bulletTarget_y = 0;
    }
    
    
    return;
    

    
}

-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
        
        self.isAccelerometerEnabled = YES;
        [[UIAccelerometer sharedAccelerometer] setUpdateInterval:1.0 / 60.0];
        
        bulletTarget_x = 999999;
        
        maxTime = 60;
        timeRemain = maxTime;
        
        s_bg = [CCSprite spriteWithFile:@"mini_01_bg.png"];
        [s_bg setPosition:ccp([UIScreen mainScreen].bounds.size.height/2, [UIScreen mainScreen].bounds.size.width/2)];
		[self addChild:s_bg];
        
        [self initShells];
        [self initOthers];
        [self genScript];
        
        detectTurtleRadius = 22;
        gameLevel = 0;
        gameRound = 0;
        
        ranTypeTimer = 0;
        
        [self updateGameLevel];
    }
	return self;
}

-(void) initOthers{
    s_correct = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1400/textureRatioForFuckingIpad, 732/textureRatioForFuckingIpad, 318/textureRatioForFuckingIpad, 68/textureRatioForFuckingIpad)];
    [s_correct setPosition:ccp(10000,10000)];
    [ss_Character addChild:s_correct];
    
    s_bulletTarget = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1482/textureRatioForFuckingIpad, 922/textureRatioForFuckingIpad, 78/textureRatioForFuckingIpad, 76/textureRatioForFuckingIpad)];
    [s_bulletTarget setPosition:ccp(10000,10000)];
    [ss_Character addChild:s_bulletTarget z:999];
}

-(void) initShells{
    maxShell = 20;
    shellGenIdx = 0;
    lineLength = 217;
    circleOriX = [UIScreen mainScreen].bounds.size.height/2;
    
    if(isIpad){
        lineLength *= 2;
    }
    
    if(isIpad){
        circleOriY = 600;
    }else{
        circleOriY = 260;
    }
    
    circle_x[0] = circleOriX;
    circle_x[1] = 100000;
    circle_y[0] = circleOriY;
    circle_y[1] = circleOriY;
    circleIdx = 0;
    circle_isLeaving[0] = false;
    circle_isLeaving[1] = false;
    circle_isEnterning[0] = false;
    circle_isEnterning[1] = false;
    
    s_circle[0] = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1722/textureRatioForFuckingIpad, 732/textureRatioForFuckingIpad, 38/textureRatioForFuckingIpad, 36/textureRatioForFuckingIpad)];
    [ss_Character addChild:s_circle[0] z:kDeapth_Bg_Element1];
    [s_circle[0] setPosition:ccp(10000,10000)];
    s_circle[1] = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1722/textureRatioForFuckingIpad, 732/textureRatioForFuckingIpad, 38/textureRatioForFuckingIpad, 36/textureRatioForFuckingIpad)];
    [ss_Character addChild:s_circle[1] z:kDeapth_Bg_Element1];
    [s_circle[1] setPosition:ccp(10000,10000)];
    
    for(int i = 0 ; i < maxShell ; i++){
        s_line[i] = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1238/textureRatioForFuckingIpad, 910/textureRatioForFuckingIpad, 434/textureRatioForFuckingIpad, 10/textureRatioForFuckingIpad)];
        [ss_Character addChild:s_line[i] z:kDeapth_Bg_Element1+i];
        [s_line[i] setAnchorPoint:ccp(0,0.5)];
        //[s_line[i] setScaleY:0.7];
        
        s_shell[i] = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1124/textureRatioForFuckingIpad, 910/textureRatioForFuckingIpad, 110/textureRatioForFuckingIpad, 76/textureRatioForFuckingIpad)];
        [ss_Character addChild:s_shell[i] z:kDeapth_Bg_Element1+i];
       // [s_shell[i] setScale:0.75];
        
        [s_shell[i] setPosition:ccp(10000,10000)];
        [s_line[i] setPosition:ccp(10000,10000)];
    }
}

-(void) genRanMovement{
    static float fuckRanVelocity;
    static float fuckRanAngle;
    static int fuckRan;
    
    
    for(int i = 0 ; i < howmanyShells ; i++){
        fuckRan = arc4random()% 100;
        fuckRanVelocity = script_ufo2MinV;
        
        fuckRanAngle = arc4random()% 360;
        assignedVX[i] = fuckRanVelocity * cos(fuckRanAngle);
        assignedVY[i] = fuckRanVelocity * sin(fuckRanAngle);
        
        
        fuckRan = arc4random()% 100;
        assignedR[i] = (float)fuckRan/100.0 * 2;
        
        fuckRan = arc4random()% 100;
        assignedVR[i] =   0.5 + (float)fuckRan/100.0 * 1.0;
        
        if(assignedVX[i] < 0){
            assignedVR[i] *= -1;
        }

    }
}

-(void) genRanPosition{
    static int prevJ;
    prevJ = -1;
    for(int j = 0 ; j < howmanyShells ; j++){
        
        static float ranYrange;
        if(isIphone5){
            ranYrange = 280 + 88;
        }else{
            ranYrange = 280;
        }
        
        if(isIpad){
            ranYrange = 870;
        }
        
        static int ranNumber;
        
        if(isIpad){
            ranNumber = arc4random()%100;
            assignedLocationX[j] = (float)ranNumber/100.0*ranYrange + 100.0;
            
            ranNumber = arc4random()%100;
            assignedLocationY[j] = (float)ranNumber/100.0*450 + 80.0;

        }else{
            ranNumber = arc4random()%100;
            assignedLocationX[j] = (float)ranNumber/100.0*ranYrange + 100.0;
            
            ranNumber = arc4random()%100;
            assignedLocationY[j] = (float)ranNumber/100.0*150.0 + 40.0;
        }
        
         bool hasCollide;
         float diffLocationX;
         float diffLocationY;
         float locationAccept;
         float locationAcceptMax = 150;
        hasCollide = false;
        
        if(isIpad){
            locationAcceptMax = 300;
        }
        
        
         //printf("j:%i %4.8f pos:%i %i\n",j,locationAccept,assignedLocationX[j], assignedLocationY[j]);
        
        if(prevJ != j){
            locationAccept = locationAcceptMax;
        }
        prevJ = j;
        
        diffLocationX = assignedLocationX[j] - prevTappedLocationX;
        diffLocationY = assignedLocationY[j] - prevTappedLocationY;
        if(diffLocationX > -locationAccept && diffLocationX < locationAccept
           && diffLocationY > -locationAccept && diffLocationY < locationAccept){
            hasCollide = true;
            locationAccept--;
        }
        
        if(j >= 1){
            for(int k = 0 ; k < j ; k++){
             //       printf("j:%i k:%i\n",j,k);
                diffLocationX = assignedLocationX[j] - assignedLocationX[k];
                diffLocationY = assignedLocationY[j] - assignedLocationY[k];
                if(diffLocationX > -locationAccept && diffLocationX < locationAccept
                   && diffLocationY > -locationAccept && diffLocationY < locationAccept){
                    hasCollide = true;
                    locationAccept--;
                }
            }
        }
        
        if(assignedLocationX[j] >= 400 && assignedLocationY[j] <= 80){
            hasCollide = true;
        }
        
        if(locationAccept < 30 * 2/textureRatioForFuckingIpad){
            locationAccept = 30 * 2/textureRatioForFuckingIpad;
        }
        
        if(hasCollide){
            j--;
        }
        
    }
    
   // for(int j = 0 ; j < howmanyShells ; j++){
   //     printf("l:%i %i\n",assignedLocationX[j],assignedLocationY[j]);
   // }
}

-(void) genScript{
    printf("genScript:%i\n",gameRound);
    comboRemain = 1;
    [self updateGameLevel];
    
    hasGen = true;
    generalCharacterScale = 0.0;
    hasGenTimer = 0;
    
    
    
    for(int i = 0 ; i < maxShell ; i++){
        shellHasTappedInThisRound[i] = 0;
        assignedLocationX[i] = -1;
        assignedLocationY[i] = -1;
        assignedVX[i] = 0;
        assignedVY[i] = 0;
        assignedVR[i] = 0;
        assignedR[i] = 0;
        hasAssigned[i] = false;
        assignedShellType[i] = 0;
        shell_angle[i] = 0;
    }
    
    round_hasTapped = false;
    round_hasTappedFirst = false;
    howmanyShells = 5;
    howmanyShellsTapped = 0;
    
    assigned_minAngle = 20;
    assigned_maxAngle = 60;
    
    
    if(gameLevel == 0){
        
        howmanyShells = 1;
        generalGameType = 0;
        
        assignedLocationX[0] = [UIScreen mainScreen].bounds.size.height/2;
        assignedLocationY[0] = [UIScreen mainScreen].bounds.size.width/2;
        assignedType[0] = 0;
        shell_sizeType[0] = 0;
        
    }else if(gameLevel == 1){
        howmanyShells = 1;
        generalGameType = 0;
        
        for(int i = 0 ; i < howmanyShells ; i++){
            assignedType[i] = 0;
            shell_sizeType[i] = 0;
        }
        
        [self genRanPosition];
        
       /* howmanyShells = 1;
        generalGameType = 1;
        
        for(int i = 0 ; i < howmanyShells ; i++){
            assignedType[i] = 0;
            shell_sizeType[i] = 0;
        }
        
        [self genRanPosition];
        
        script_ufo2MinV = 1.0;
        [self genRanMovement];*/
        
    }else if(gameLevel == 2){
        howmanyShells = 2;
        generalGameType = 0;
        
        for(int i = 0 ; i < howmanyShells ; i++){
            assignedType[i] = 0;
            shell_sizeType[i] = 0;
        }
        
        [self genRanPosition];
        
        /*howmanyShells = 2;
        generalGameType = 1;
        
        for(int i = 0 ; i < howmanyShells ; i++){
            assignedType[i] = 0;
            shell_sizeType[i] = 0;
        }
        
        [self genRanPosition];
        
        script_ufo2MinV = 2.0;
        [self genRanMovement];*/
        
    }else if(gameLevel == 3){
        howmanyShells = 3;
        generalGameType = 0;
        
        for(int i = 0 ; i < howmanyShells ; i++){
            assignedType[i] = 0;
            shell_sizeType[i] = 0;
        }
        
        [self genRanPosition];
        
        /*howmanyShells = 2;
         generalGameType = 1;
         
         for(int i = 0 ; i < howmanyShells ; i++){
         assignedType[i] = 0;
         shell_sizeType[i] = 0;
         }
         
         [self genRanPosition];
         
         script_ufo2MinV = 2.0;
         [self genRanMovement];*/
        
    }else if(gameLevel == 4){
        
        howmanyShells = 1;
        generalGameType = 1;
        
        for(int i = 0 ; i < howmanyShells ; i++){
            assignedType[i] = 0;
            shell_sizeType[i] = 0;
        }
        
        [self genRanPosition];
        
        script_ufo2MinV = 1.0;
        [self genRanMovement];
        
    }else if(gameLevel == 5){
        
        howmanyShells = 2;
        generalGameType = 1;
        
        for(int i = 0 ; i < howmanyShells ; i++){
            assignedType[i] = 0;
            shell_sizeType[i] = 0;
        }
        
        [self genRanPosition];
        
        script_ufo2MinV = 0.75;
        [self genRanMovement];
        
    }else if(gameLevel == 6){
        
        // MIN AND MAX
        /*assigned_angelVelocityRatio = 0.0005;
        assigned_angelVelocityMin = 0.0005;
        assigned_angelVelocityRatio = 0.001;
        assigned_angelVelocityMin = 0.001;*/
        
        assigned_minAngle = 20;
        assigned_maxAngle = 45;

        assigned_angelVelocityRatio = 0.00075;
        assigned_angelVelocityMin = 0.00075;
        
        howmanyShells = 2;
        generalGameType = 2;
        
        for(int i = 0 ; i < howmanyShells ; i++){
            assignedType[i] = 0;
            shell_sizeType[i] = 0;
        }
        
        
       /* ranTypeTimer++;
        assigned_angelVelocityRatio = 0.001;
        assigned_angelVelocityMin = 0.001;
        
        if(ranTypeTimer % 2 == 0){
            howmanyShells = 2;
            generalGameType = 2;
            
            for(int i = 0 ; i < howmanyShells ; i++){
                assignedType[i] = 0;
                shell_sizeType[i] = 0;
            }
        }else{
            howmanyShells = 2;
            generalGameType = 2;
            
            for(int i = 0 ; i < howmanyShells ; i++){
                assignedType[i] = 0;
                shell_sizeType[i] = 0;
            }
        }*/
        
    }else if(gameLevel == 7){
        
        howmanyShells = 3;
        generalGameType = 1;
        
        for(int i = 0 ; i < howmanyShells ; i++){
            assignedType[i] = 0;
            shell_sizeType[i] = 0;
        }
        
        [self genRanPosition];
        
        script_ufo2MinV = 1.4;
        [self genRanMovement];
               
    }else if(gameLevel == 8){
        
        assigned_angelVelocityRatio = 0.00075;
        assigned_angelVelocityMin = 0.00075;
        
        howmanyShells = 3;
        generalGameType = 2;
        
        for(int i = 0 ; i < howmanyShells ; i++){
            assignedType[i] = 0;
            shell_sizeType[i] = 0;
        }
        
    }else if(gameLevel == 9){

        howmanyShells = 4;
        generalGameType = 0;
        
        for(int i = 0 ; i < howmanyShells ; i++){
            assignedType[i] = 0;
            shell_sizeType[i] = 0;
        }
        
        [self genRanPosition];
        
    }else if(gameLevel == 10){
        
        howmanyShells = 3;
        generalGameType = 1;
        
        for(int i = 0 ; i < howmanyShells ; i++){
            assignedType[i] = 0;
            shell_sizeType[i] = 0;
        }
        
        [self genRanPosition];
        
        script_ufo2MinV = 1.7;
        [self genRanMovement];
        
    }else if(gameLevel == 11){
        
        assigned_angelVelocityRatio = 0.001;
        assigned_angelVelocityMin = 0.001;
        
        howmanyShells = 4;
        generalGameType = 2;
        
        for(int i = 0 ; i < howmanyShells ; i++){
            assignedType[i] = 0;
            shell_sizeType[i] = 0;
        }
        
    }else if(gameLevel == 12){
        
        howmanyShells = 4;
        generalGameType = 1;
        
        for(int i = 0 ; i < howmanyShells ; i++){
            assignedType[i] = 0;
            shell_sizeType[i] = 0;
        }
        
        [self genRanPosition];
        
        script_ufo2MinV = 2.0;
        [self genRanMovement];
        
    }else if(gameLevel == 13){
        
        howmanyShells = 5;
        generalGameType = 1;
        
        for(int i = 0 ; i < howmanyShells ; i++){
            assignedType[i] = 0;
            shell_sizeType[i] = 0;
        }
        
        [self genRanPosition];
        
        script_ufo2MinV = 2.0;
        [self genRanMovement];
        
    }else if(gameLevel == 14){
        
        assigned_angelVelocityRatio = 0.001;
        assigned_angelVelocityMin = 0.001;
        
        howmanyShells = 5;
        generalGameType = 2;
        
        for(int i = 0 ; i < howmanyShells ; i++){
            assignedType[i] = 0;
            shell_sizeType[i] = 0;
        }

        
    }else if(gameLevel == 15){
        static int ranGenGameType;
        ranGenGameType = arc4random() % 5;
        
        if(ranGenGameType == 0 || ranGenGameType == 3){
            howmanyShells = 5;
            generalGameType = 0;
            
            for(int i = 0 ; i < howmanyShells ; i++){
                assignedType[i] = 0;
                shell_sizeType[i] = 0;
            }
            
            [self genRanPosition];
        }
        
        if(ranGenGameType == 1 || ranGenGameType == 4){
            howmanyShells = 5;
            generalGameType = 1;
            
            for(int i = 0 ; i < howmanyShells ; i++){
                assignedType[i] = 0;
                shell_sizeType[i] = 0;
            }
            
            [self genRanPosition];
            
            script_ufo2MinV = 2.5;
            [self genRanMovement];
        }
        
        if(ranGenGameType == 2){
            assigned_angelVelocityRatio = 0.001;
            assigned_angelVelocityMin = 0.001;
            
            assigned_minAngle = 30;
            assigned_maxAngle = 70;
            
            howmanyShells = 5;
            generalGameType = 2;
            
            for(int i = 0 ; i < howmanyShells ; i++){
                assignedType[i] = 0;
                shell_sizeType[i] = 0;
            }
        }
        
    }else if(gameLevel == 16){
        static int ranGenGameType;
        ranGenGameType = arc4random() % 5;
        
        if(ranGenGameType == 0 || ranGenGameType == 3){
            howmanyShells = 5;
            generalGameType = 0;
            
            for(int i = 0 ; i < howmanyShells ; i++){
                assignedType[i] = 0;
                shell_sizeType[i] = 0;
            }
            
            [self genRanPosition];
        }
        
        if(ranGenGameType == 1 || ranGenGameType == 4){
            howmanyShells = 5;
            generalGameType = 1;
            
            for(int i = 0 ; i < howmanyShells ; i++){
                assignedType[i] = 0;
                shell_sizeType[i] = 0;
            }
            
            [self genRanPosition];
            
            script_ufo2MinV = 2.8;
            [self genRanMovement];
        }
        
        if(ranGenGameType == 2){
            assigned_angelVelocityRatio = 0.00175;
            assigned_angelVelocityMin = 0.00175;
            
            assigned_minAngle = 40;
            assigned_maxAngle = 85;
            
            howmanyShells = 5;
            generalGameType = 2;
            
            for(int i = 0 ; i < howmanyShells ; i++){
                assignedType[i] = 0;
                shell_sizeType[i] = 0;
            }
        }
        
    }else{
        static int ranGenGameType;
        ranGenGameType = arc4random() % 5;
        
        if(ranGenGameType == 0 || ranGenGameType == 3){
            howmanyShells = 6;
            generalGameType = 0;
            
            for(int i = 0 ; i < howmanyShells ; i++){
                assignedType[i] = 0;
                shell_sizeType[i] = 0;
            }
            
            [self genRanPosition];
        }
        
        if(ranGenGameType == 1 || ranGenGameType == 4){
            howmanyShells = 6;
            generalGameType = 1;
            
            for(int i = 0 ; i < howmanyShells ; i++){
                assignedType[i] = 0;
                shell_sizeType[i] = 0;
            }
            
            [self genRanPosition];
            
            script_ufo2MinV = 3.0;
            [self genRanMovement];
        }
        
        if(ranGenGameType == 2){
            assigned_angelVelocityRatio = 0.001;
            assigned_angelVelocityMin = 0.001;
            
            assigned_minAngle = 45;
            assigned_maxAngle = 90;
            
            howmanyShells = 6;
            generalGameType = 2;
            
            for(int i = 0 ; i < howmanyShells ; i++){
                assignedType[i] = 0;
                shell_sizeType[i] = 0;
            }
        }
        
    }
    
    for(int i = 0 ; i < howmanyShells ; i++){
       /* if(arc4random()%2 == 0){
            [s_shell[shellGenIdx] setTextureRect:CGRectMake(1124/textureRatioForFuckingIpad, 910/textureRatioForFuckingIpad, 110/textureRatioForFuckingIpad, 76/textureRatioForFuckingIpad)];
            shell_type[shellGenIdx] = 0;
            [s_shell[shellGenIdx] setAnchorPoint:ccp(0.5,0.5)];
        }else{
            [s_shell[shellGenIdx] setTextureRect:CGRectMake(1360/textureRatioForFuckingIpad, 922/textureRatioForFuckingIpad, 98/textureRatioForFuckingIpad, 102/textureRatioForFuckingIpad)];
            shell_type[shellGenIdx] = 1;
            [s_shell[shellGenIdx] setAnchorPoint:ccp(0.4,0.38)];
        }*/
        //[s_shell[shellGenIdx] setTextureRect:CGRectMake(1676/textureRatioForFuckingIpad, 910/textureRatioForFuckingIpad, 164/textureRatioForFuckingIpad, 114/textureRatioForFuckingIpad)];
        shell_type[shellGenIdx] = assignedShellType[i];
        [s_shell[shellGenIdx] setAnchorPoint:ccp(0.5,0.5)];
        
        if(shell_sizeType[i] == 0){
            shell_oriScale[shellGenIdx] = 1.0;
            shell_detectLeftrightLegnth[shellGenIdx] = 25;
            shell_detectRadius1[shellGenIdx] = 29;
            shell_detectRadius2[shellGenIdx] = 17;
        }
        if(shell_sizeType[i] == 1){
            shell_oriScale[shellGenIdx] = 0.67;
            shell_detectLeftrightLegnth[shellGenIdx] = 16;
            shell_detectRadius1[shellGenIdx] = 22;
            shell_detectRadius2[shellGenIdx] = 11;
        }
        
        if(isIpad){
            shell_detectRadius1[shellGenIdx] *= 2.2;
            shell_detectRadius2[shellGenIdx] *= 2.2;
        }
        
        
        
        if(assignedLocationX[i] >=0){
            hasAssigned[shellGenIdx] = true;
            shell_x[shellGenIdx] = assignedLocationX[i];
            shell_y[shellGenIdx] = assignedLocationY[i];
            gameType[shellGenIdx] = assignedType[i];
            
         //   printf("shellGenIdx:%i , :%4.8f %4.8f\n",shellGenIdx, shell_y[shellGenIdx],shell_x[shellGenIdx]);
        }
        
        if(shell_type[shellGenIdx] == 0){
            [s_shell[shellGenIdx] setTextureRect:CGRectMake(1676/textureRatioForFuckingIpad, 910/textureRatioForFuckingIpad, 164/textureRatioForFuckingIpad, 114/textureRatioForFuckingIpad)];
            [s_shell[shellGenIdx] setAnchorPoint:ccp(0.5,0.5)];
        }else{
            [s_shell[shellGenIdx] setTextureRect:CGRectMake(1360/textureRatioForFuckingIpad, 922/textureRatioForFuckingIpad, 98/textureRatioForFuckingIpad, 102/textureRatioForFuckingIpad)];
            [s_shell[shellGenIdx] setAnchorPoint:ccp(0.4,0.38)];
        }
        
        shell_isAni[shellGenIdx] = true;
        thisShellIsTapped[shellGenIdx] = false;
        shell_attach[shellGenIdx] = circleIdx;
        
        if(generalGameType == 1){
            shell_vx[shellGenIdx] = assignedVX[i];
            shell_vy[shellGenIdx] = assignedVY[i];
            shell_angle[shellGenIdx] = assignedR[i];
            shell_angleVelocity[shellGenIdx] = assignedVR[i];
        }
        
        if(generalGameType == 2){
            static int ranNumber;
            //shell_angle[shellGenIdx] = -90 + 180 * (float)ranNumber/100.0;
            static bool continueAngle;
            continueAngle = false;
            do{
                 continueAngle = false;
                ranNumber = arc4random()%100;
                shell_angle[shellGenIdx] = -90 + 180 * (float)ranNumber/100.0;
                
               // printf("shell_angle[shellGenIdx]:%4.8f\n",shell_angle[shellGenIdx]);
                
                if(shell_angle[shellGenIdx] < assigned_minAngle && shell_angle[shellGenIdx] > -assigned_minAngle){
                    continueAngle = true;
                }
                if(shell_angle[shellGenIdx] > assigned_maxAngle || shell_angle[shellGenIdx] < -assigned_maxAngle){
                    continueAngle = true;
                }
                
            }while(continueAngle);
            
            ranNumber = arc4random()%100;
            shell_angleVelocity[shellGenIdx] = -1 + 2 * (float)ranNumber/100.0;
            shell_angleVelocity[shellGenIdx] = 0;
            
            ranNumber = arc4random()%100;
            shell_angleAccelerationRatio[shellGenIdx] =  0.001 * (float)ranNumber/100.0 + 0.001;
            //shell_angleAccelerationRatio[shellGenIdx] = 0.0005 * (float)ranNumber/100.0 + 0.0005;
            shell_angleAccelerationRatio[shellGenIdx] = assigned_angelVelocityRatio * (float)ranNumber/100.0 + assigned_angelVelocityMin;
            
            [s_line[shellGenIdx] setAnchorPoint:ccp(0,0.5)];
        }
        
        shellGenIdx++;
        if(shellGenIdx >= maxShell){
            shellGenIdx = 0;
        }
       
    }
    

}

-(void) manage:(ccTime) dt{
    bombMusicIsPlayed = false;
    [self manageCircleMovement];
    [self manageShell];
    [self runCorrectWrongAni];
    [self manageTapped];
}

-(void) runCorrectWrongAni{
    if(isCorrectWrongAni){
        if(isCorrect){
           /* if(correctWrongAniTimer == 0){
                plusTimeOpacity = 255;
                plusTimeSX = 0;
                plusTimeSY = 0;
            
                plusTimeX = 240;
                plusTimeY = 160;
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
            [s_correct setScaleY:plusTimeSY*1.2];*/
            
            
        }else{
            /*gameover_scale += (1 - gameover_scale)/7;
            
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
            
            [s_correct setPosition:ccp(240 + ranGameoverX,160 + ranGameoverY)];
            [s_correct setScale:gameover_scale*1.1];
            [s_correct setOpacity:gameover_opacity];*/
        }
        
        correctWrongAniTimer++;
        
        if(generalGameType == 2){
            if(isCorrect){
                if(correctWrongAniTimer == 1){
                    //[self setCircleLeavingEntering];
                    //   [self fuckAllRemainShells];
                    [self genScript];
                    isCorrectWrongAni = false;
                }
            }else{
                if(correctWrongAniTimer == 60){
                    [self setCircleLeavingEntering];
                    // [self fuckAllRemainShells];
                    [self genScript];
                    isCorrectWrongAni = false;
                }
            }
        }else{
            if(isCorrect){
                if(correctWrongAniTimer == 1){
                    [self fuckAllRemainShells];
                    [self genScript];
                    isCorrectWrongAni = false;
                }
            }else{
                if(correctWrongAniTimer < 30){
                    [self bombAllShellsOutScreen];
                }
                if(correctWrongAniTimer == 30){
                    [self fuckAllRemainShells];
                    [self genScript];
                    isCorrectWrongAni = false;
                }
            }
        }
        
        
    }
}

-(void) setCircleLeavingEntering{
    
    circle_leavingEnteringTimer[0] = 0;
    circle_leavingEnteringTimer[1] = 0;
    circle_isLeaving[0] = false;
    circle_isLeaving[1] = false;
    circle_isEnterning[0] = false;
    circle_isEnterning[1] = false;
    
    static int currentIdx;
    static int nextIdx;
    currentIdx = circleIdx;
    nextIdx = currentIdx+1;
    if(nextIdx == 2){
        nextIdx = 0;
    }
    /*if(currentIdx == 2){
        currentIdx = 0;
    }*/
   // printf("setCircleLeavingEntering:%i %i\n",currentIdx, nextIdx);
    circle_isEnterning[nextIdx] = true;
    circle_x[nextIdx] = -100;
    
    circle_isLeaving[currentIdx] = true;
    
    [self fuckAllRemainShells];
    
    circleIdx++;
    if(circleIdx == 2){
        circleIdx = 0;
    }
    
}

-(void) manageCircleMovement{
    for(int i = 0 ; i < 2 ; i++){
        if(circle_isLeaving[i]){
        //    printf("leaving:%i\n",i);
            circle_x[i] += (800 - circle_x[i])/25.0;
            circle_leavingEnteringTimer[i]++;
        }
        if(circle_isEnterning[i]){
           // printf("entering:%i\n",i);
            circle_x[i] += (circleOriX - circle_x[i])/15.0;
            circle_leavingEnteringTimer[i]++;
        }
        
        if(circle_leavingEnteringTimer[i] == 120){
            circle_isLeaving[i] = false;
            circle_isEnterning[i] = false;
        }
    }
    
    
    [s_bulletTarget setPosition:ccp(bulletTarget_x, bulletTarget_y)];
    
    if(generalGameType == 0 || generalGameType == 1){
        [s_circle[0] setPosition:ccp(circle_x[0]+10000, circle_y[0])];
        [s_circle[1] setPosition:ccp(circle_x[1]+10000, circle_y[1])];
    }
    if(generalGameType == 2){
        [s_circle[0] setPosition:ccp(circle_x[0], circle_y[0])];
        [s_circle[1] setPosition:ccp(circle_x[1], circle_y[1])];
    }
    
  //  printf("cicle0:%4.8f %4.8f\n", circle_x[0], circle_y[0]);
   // printf("cicle1:%4.8f %4.8f\n", circle_x[1], circle_y[1]);
    
}

-(void) manageShell{
    if(hasGen){
        
        if(hasGenTimer < 10){
            generalCharacterScale += 0.13;
        }else{
            generalCharacterScale += ( 1 - generalCharacterScale)/5;
        }
        
        hasGenTimer++;
    }
    
    for(int i = 0 ; i < maxShell ; i++){
        if(shell_isAni[i]){
            
            if(generalGameType == 1){
                shell_x[i] += shell_vx[i];
                shell_y[i] += shell_vy[i];
                shell_angle[i] += shell_angleVelocity[i];
                
                if(shell_x[i] < 79){
                    shell_x[i] = 79;
                    shell_vx[i] *= -1;
                }
                
                static int boundaryY;
                if(isIphone5){
                    boundaryY = 401 + 88;
                }else{
                    boundaryY = 401;
                }
                
                if(isIpad){
                    boundaryY = 870;
                }
                
                if(shell_x[i] > boundaryY){
                    shell_x[i] = boundaryY;
                    shell_vx[i] *= -1;
                }
                
                if(isIpad){
                    if(shell_y[i] < 40){
                        shell_y[i] = 40;
                        shell_vy[i] *= -1;
                    }
                    if(shell_y[i] > 550){
                        shell_y[i] = 550;
                        shell_vy[i] *= -1;
                    }
                }else{
                    if(shell_y[i] < 20){
                        shell_y[i] = 20;
                        shell_vy[i] *= -1;
                    }
                    if(shell_y[i] > 191){
                        shell_y[i] = 191;
                        shell_vy[i] *= -1;
                    }
                }
                
            }

            if(generalGameType == 0 || generalGameType == 1){
                if(gameType[i] == 0){
                    [s_shell[i] setRotation:shell_angle[i]];
                    [s_shell[i] setPosition:ccp(shell_x[i], shell_y[i])];
                }
            }else if(generalGameType == 2){
                shell_angleAcceleration[i] = -shell_angle[i] * shell_angleAccelerationRatio[i];
                //printf("i:%i  shell_angleAccelerationRatio:%4.8f\n",i,shell_angleAccelerationRatio);
                
                shell_angleVelocity[i] += shell_angleAcceleration[i];
                shell_angle[i] += shell_angleVelocity[i];
                
                shell_x[i] = lineLength * sin(shell_angle[i] * M_PI/180) + circle_x[shell_attach[i]];
                shell_preY[i] = shell_y[i];
                shell_y[i] = -lineLength * cos(shell_angle[i] * M_PI/180) + circle_y[shell_attach[i]];
                
                [s_shell[i] setRotation:-shell_angle[i]];
                [s_shell[i] setPosition:ccp(shell_x[i], shell_y[i])];
                
                [s_line[i] setPosition:ccp(circle_x[shell_attach[i]], circle_y[shell_attach[i]])];
                [s_line[i] setRotation:-shell_angle[i]+90];
            }
            
            
            if(hasGenTimer == 1){
                [playLayer setToShakingBomb:shell_x[i] turtleY:shell_y[i]];
            }
            
        }else{
            if(thisShellIsTapped[i]){
                tapped_line_x[i] += tapped_line_vx[i];
                tapped_line_y[i] += tapped_line_vy[i];
                tapped_line_r[i] += tapped_line_vr[i];
                
               // tapped_line_vx[i] *= 0.98;
                tapped_line_vy[i] -= 0.75;
               // tapped_line_vr[i] *= 0.98;
                
                [s_line[i] setPosition:ccp(tapped_line_x[i], tapped_line_y[i])];
                [s_line[i] setRotation:-tapped_line_r[i]+90];
            }
        }
        
        shell_scale[i] = shell_oriScale[i] * generalCharacterScale;
        [s_shell[i] setScale:shell_scale[i]];
        
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
        
    static float fuxkTurtleAtX;
    static float fuxkTurtleAtY;
    
    static float fuxkDistanceDiff;
    static float fuxkDistanceDiffX;
    static float fuxkDistanceDiffY;
    
    for( UITouch *touch in touches ) {
		CGPoint location = [touch locationInView: [touch view]];
		location = [[CCDirector sharedDirector] convertToGL: location];
        
        location.x = bulletTarget_x;
        location.y = bulletTarget_y;
        
        
        printf("bulletTarget_x:%4.8f %4.8f\n",bulletTarget_x,bulletTarget_y);
        
        
        prevTappedLocationX = bulletTarget_x;
        prevTappedLocationY = bulletTarget_y;
        
        
        [playLayer setToShakingBomb:location.x turtleY:location.y];
        //[musicController playThisSound:kSound_ComboSmoke isLoop:NO gain:0.75];
       // [musicController playThisSound:kSound_CrackShell isLoop:NO gain:0.2];
        [musicController playThisSound:kSound_ComboSmoke isLoop:NO gain:0.9];
        [musicController playThisSound:kSound_CrackShell isLoop:NO gain:0.35];
        
        static bool hasBeingTapped;
        hasBeingTapped = false;
        
        
        for(int i = 0 ; i < maxShell ; i++){
            
            if(shell_isAni[i]){
              
                if(shell_type[i] == 0){
                    //printf("ADSFSDFDFSFDSFDSFDSFDSFDSFDSFsd\n");
                    
                    fuxkTurtleAtX = shell_x[i];
                    fuxkTurtleAtY = shell_y[i];
                    
                    fuxkDistanceDiffX = fuxkTurtleAtX - shell_detectLeftrightLegnth[i] * cos(s_shell[i].rotation * M_PI/180) - location.x;
                    fuxkDistanceDiffY = fuxkTurtleAtY + shell_detectLeftrightLegnth[i] * sin(s_shell[i].rotation * M_PI/180) - location.y;
                    fuxkDistanceDiff = sqrtf(fuxkDistanceDiffX*fuxkDistanceDiffX + fuxkDistanceDiffY*fuxkDistanceDiffY);
                    
                    if(fuxkDistanceDiff < shell_detectRadius2[i]){
                       // printf("TTTTTTTTTTBBBBBBBBBB1\n\n");
                        hasBeingTapped = true;
                        [self thisSHellBeingTapped:i afterBomb:false];
                    }else{
                        // printf("YYYYYYYYYYYYYTTTTTTTTTTBBBBBBBBBB\n\n");
                        fuxkDistanceDiffX = fuxkTurtleAtX + shell_detectLeftrightLegnth[i] * cos(s_shell[i].rotation * M_PI/180) - location.x;
                        fuxkDistanceDiffY = fuxkTurtleAtY - shell_detectLeftrightLegnth[i] * sin(s_shell[i].rotation * M_PI/180) - location.y;
                        fuxkDistanceDiff = sqrtf(fuxkDistanceDiffX*fuxkDistanceDiffX + fuxkDistanceDiffY*fuxkDistanceDiffY);
                        
                        if(fuxkDistanceDiff < shell_detectRadius2[i]){
                          //   printf("TTTTTTTTTTBBBBBBBBBB2\n\n");
                            hasBeingTapped = true;
                            [self thisSHellBeingTapped:i afterBomb:false];
                        }else{
                            // printf("BBBBBBBBBBBBBBBBBYYYYYYYYYYYYYTTTTTTTTTTBBBBBBBBBB\n\n");
                            fuxkDistanceDiffX = fuxkTurtleAtX - location.x;
                            fuxkDistanceDiffY = fuxkTurtleAtY - location.y;
                            fuxkDistanceDiff = sqrtf(fuxkDistanceDiffX*fuxkDistanceDiffX + fuxkDistanceDiffY*fuxkDistanceDiffY);
                           // printf("fuxkDistanceDiff:%4.8f\n",fuxkDistanceDiff);
                            if(fuxkDistanceDiff < shell_detectRadius1[i]){
                              //   printf("TTTTTTTTTTBBBBBBBBBB3\n\n");
                                hasBeingTapped = true;
                                [self thisSHellBeingTapped:i afterBomb:false];
                            }
                        }
                    }

                }else{
                    fuxkTurtleAtX = shell_x[i];
                    fuxkTurtleAtY = shell_y[i];
                    
                    fuxkDistanceDiffX = fuxkTurtleAtX - location.x;
                    fuxkDistanceDiffY = fuxkTurtleAtY - location.y;
                    fuxkDistanceDiff = sqrtf(fuxkDistanceDiffX*fuxkDistanceDiffX + fuxkDistanceDiffY*fuxkDistanceDiffY);
                    
                    if(fuxkDistanceDiff < 19){
                        ///printf("TTTTTTTTTTBBBBBBBBBB\n\n");
                        hasBeingTapped = true;
                        [self thisSHellBeingTapped:i afterBomb:false];
                    }
                }
                
                
            }
            
            
        }
        
        if(!hasBeingTapped){
            [uILayer lostCombo];
        }
        
        
    }
    
    
    
}

-(void) detectWhichShellBombed{
    
    static int higestDeapth;
    static int currentDeapth;
    static int tappedDetectIdx;
    higestDeapth = 0;
    for(int i = 0 ; i < maxShell ; i++){
        if(shellHasTappedInThisRound[i]){
            currentDeapth = s_shell[i].zOrder;
            if(currentDeapth > higestDeapth){
                higestDeapth = currentDeapth;
                tappedDetectIdx = i;
            }
        }
    }
    
    for(int i = 0 ; i < maxShell ; i++){
        shellHasTappedInThisRound[i] = 0;
    }
    
    //printf("detectWhichShellBombed:%i\n",tappedDetectIdx);
    [self thisSHellBeingTappedFUCKFUCKFUCKFUCKFUCK:tappedDetectIdx];
    [self detectWin];
    
    
    if(shell_type[tappedDetectIdx] == 0){
        [uILayer gainCombo:1];
    }
    if(shell_type[tappedDetectIdx] == 1){
        [uILayer lostCombo];
        [self fuckToLose];

    }
}

-(void) detectWin{
    static bool hasWin;
    hasWin = true;
    for(int i = 0 ; i < maxShell ; i++){
        if(shell_isAni[i]){
            if(shell_type[i] == 0){
                hasWin = false;
            }
        }
    }
    
    if(hasWin){
        [self fuckToWIn];
    }
}

-(void) fuckToWIn{
    printf("fuckTO WIn\n");
    isCorrectWrongAni = true;
    correctWrongAniTimer = 0;
    gameRound++;

    isCorrect = true;
   // [playLayer setToBombingTimePlus:240 y:160];
}

-(void) fuckToLose{
    printf("fuckTO Lose\n");
    isCorrectWrongAni = true;
    correctWrongAniTimer = 0;
    
    isCorrect = false;
    //[playLayer setToShakingBomb:0 turtleY:320];
    [playLayer setToBombingGameoverWithPos:240 y:160];
    [musicController playThisSound:kSound_ComboSmoke isLoop:NO gain:1.0];
    [musicController playThisSound:kSound_TurtleExplode02 isLoop:NO gain:1.0];
    [musicController playThisSound:kSound_TurtleExplode01 isLoop:NO gain:1.0];
    gameover_scale = 0;
   // [playLayer setToBombingGameoverWithPos:240 y:160];
    
    if(generalGameType == 0 || generalGameType == 1){
        for(int i = 0 ; i < maxShell ; i++){
            if(shell_isAni[i]){
                static int ranNumber;
                ranNumber = arc4random()%100;
                shell_vy[i] = (float)ranNumber/100.0 * 2.0 + 2.0;
                
                if(shell_x[i] < 240){
                    shell_vx[i] = -shell_x[i]/120.0;
                }else{
                    shell_vx[i] = 480 - 120 * shell_x[i];
                }
                
                shell_angleVelocity[i] = shell_vx[i];
                
            }
        }
    }
    
    
    if(currentCombo >= 5){
        printf("REDUCE from tap Wrongly\n");
        comboReduceSpeedAccum -= 0.001;
        if(comboReduceSpeedAccum < -0.002){
            comboReduceSpeedAccum = -0.002;
        }
        comboReduceSpeedAccumSpeed = -comboReduceSpeedAccum;
    }
    
}

-(void) bombAllShellsOutScreen{
    for(int i = 0 ; i < maxShell ; i++){
        if(shell_isAni[i]){
            shell_x[i] += shell_vx[i];
            shell_y[i] += shell_vy[i];
            shell_angle[i] += shell_angleVelocity[i];
            
            shell_vy[i] += -0.75;
            shell_angleVelocity[i] *= 0.98;
        }
    }
}

-(void) thisSHellBeingTappedFUCKFUCKFUCKFUCKFUCK:(int)_shellIdx{
    printf("thisSHellBeingTapped:%i\n",_shellIdx);
   // [playLayer setToBombing:s_shell[_shellIdx].position.x turtleY:s_shell[_shellIdx].position.y];

    howmanyShellsTapped++;
    counterForAchivement++;
    
    thisShellIsTapped[_shellIdx] = true;
    shell_isAni[_shellIdx] = false;
    [s_shell[_shellIdx] setPosition:ccp(10000,100000)];
    
    [s_line[_shellIdx] setAnchorPoint:ccp(0.5,0.5)];
    tapped_line_x[_shellIdx] = s_line[_shellIdx].position.x + 217.0/2.0 * sin(shell_angle[_shellIdx] * M_PI/180);
    tapped_line_y[_shellIdx] = s_line[_shellIdx].position.y - 217.0/2.0 * cos(shell_angle[_shellIdx] * M_PI/180);
    
    if(isIpad){
        tapped_line_x[_shellIdx] = s_line[_shellIdx].position.x + 217.0 * sin(shell_angle[_shellIdx] * M_PI/180);
        tapped_line_y[_shellIdx] = s_line[_shellIdx].position.y - 217.0 * cos(shell_angle[_shellIdx] * M_PI/180);
        
    }
    
    tapped_line_vx[_shellIdx] = shell_angleVelocity[_shellIdx]*2.0;
    
    static float yDiff;
    yDiff = shell_y[_shellIdx] - shell_preY[_shellIdx];
    tapped_line_vy[_shellIdx] = yDiff * 3;
    
    if(tapped_line_vy[_shellIdx] < 0){
        tapped_line_vy[_shellIdx] /= 3;
    }
    
    tapped_line_r[_shellIdx] = shell_angle[_shellIdx];
    tapped_line_vr[_shellIdx] = tapped_line_vx[_shellIdx]*1.5;
    

}

-(void) thisSHellBeingTapped:(int)_shellIdx afterBomb:(bool)_afterBomb{
    if(round_hasTapped && !_afterBomb){
        return;
    }
    
    if(!shell_isAni[_shellIdx]){
        return;
    }
    
    //[playLayer setToShakingBomb:240 turtleY:160];
    //return;
    
    shellHasTappedInThisRound[_shellIdx] = 1;
    round_hasTappedFirst = true;
    round_hasTappedTimer =  0;
    
    return;

    
    round_hasTappedFirst = true;
    round_hasTappedTimer =  0;
    howmanyShellsTapped++;
    
    thisShellIsTapped[_shellIdx] = true;
    [playLayer setToBombing:s_shell[_shellIdx].position.x turtleY:s_shell[_shellIdx].position.y];
    shell_isAni[_shellIdx] = false;
    [s_shell[_shellIdx] setPosition:ccp(10000,100000)];
    
    [s_line[_shellIdx] setAnchorPoint:ccp(0.5,0.5)];
    tapped_line_x[_shellIdx] = s_line[_shellIdx].position.x + 217.0/2.0 * sin(shell_angle[_shellIdx] * M_PI/180);
    tapped_line_y[_shellIdx] = s_line[_shellIdx].position.y - 217.0/2.0 * cos(shell_angle[_shellIdx] * M_PI/180);
    
    if(isIpad){
        tapped_line_x[_shellIdx] = s_line[_shellIdx].position.x + 217.0 * sin(shell_angle[_shellIdx] * M_PI/180);
        tapped_line_y[_shellIdx] = s_line[_shellIdx].position.y - 217.0 * cos(shell_angle[_shellIdx] * M_PI/180);
        
    }
    
    tapped_line_vx[_shellIdx] = shell_angleVelocity[_shellIdx]*2.0;
    
    static float yDiff;
    yDiff = shell_y[_shellIdx] - shell_preY[_shellIdx];
    tapped_line_vy[_shellIdx] = yDiff * 3;
    
    if(tapped_line_vy[_shellIdx] < 0){
        tapped_line_vy[_shellIdx] /= 3;
    }
    
    tapped_line_r[_shellIdx] = shell_angle[_shellIdx];
    tapped_line_vr[_shellIdx] = tapped_line_vx[_shellIdx]*1.5;
     
    if(!bombMusicIsPlayed){
        bombMusicIsPlayed = true;
        [musicController playThisSound:kSound_ComboSmoke isLoop:NO gain:0.75];
        [musicController playThisSound:kSound_CrackShell isLoop:NO gain:0.2];
    }
    
}

-(void) manageTapped{
    if(round_hasTappedFirst){
        if(round_hasTappedTimer == 1){
            [self detectWhichShellBombed];
        }
        round_hasTappedTimer++;
        return;
    }
    return;
    
    if(round_hasTappedFirst){
        if(round_hasTappedTimer == 1){
            round_hasTapped = true;
            gameRound++;
            
            static float percentageTapped;
            percentageTapped = (float)howmanyShellsTapped/(float)howmanyShells;
            
            if(percentageTapped == 1){
                performaceGot = 0;
            }else if(percentageTapped >= 0.5){
                performaceGot = 1;
            }else if(percentageTapped >= 0.25){
                performaceGot = 2;
            }else{
                performaceGot = 3;
            }
            
            
            
            isCorrectWrongAni = true;
            correctWrongAniTimer = 0;
            
            if(performaceGot <= 1){
                
                isCorrect = true;
                [musicController playThisSound:kSound_ComboTime isLoop:NO gain:0.5];
                [playLayer setToBombingTimePlus:[UIScreen mainScreen].bounds.size.height/2 y:[UIScreen mainScreen].bounds.size.width/2];
                
            }else{
                
                isCorrect = false;
                [playLayer setToBombingGameoverWithPos:[UIScreen mainScreen].bounds.size.height/2 y:[UIScreen mainScreen].bounds.size.width/2];
                [musicController playThisSound:kSound_ComboSmoke isLoop:NO gain:1.0];
                [musicController playThisSound:kSound_TurtleExplode02 isLoop:NO gain:1.0];
                [musicController playThisSound:kSound_TurtleExplode01 isLoop:NO gain:1.0];
                gameover_scale = 0;

            }
        }
        
        
        round_hasTappedTimer++;
    }
    
}

-(void) fuckAllRemainShells{
    printf("fuckAllRemainShells\n");
    for(int i = 0 ; i < maxShell ; i++){
        if(shell_attach[i] == circleIdx){
            if(shell_isAni[i]){
                [self thisSHellBeingTappedFUCKFUCKFUCKFUCKFUCK:i];
            }   
        } 
    }
}

@end
