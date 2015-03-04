//
//  Mini03.m
//  TurtlesHuh
//
//  Created by  on 2012/5/24.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "Mini03.h"
#import "GamePlayGlobal.h"
#import "animationDefs.h"
#import "Global.h"

@implementation Mini03

-(void) reInitColorComboLimit{
    
    // printf("reInitColorComboLimit:%i\n",gameLevel);
  
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
    timeToBeGained = 6.0;
    
}

-(void) updateGameLevel{
    
    comoboReduceSpeed = 0.003;
    
    if(gameRound < 6){
        gameLevel = 0;
    }else if(gameRound < 12){
        gameLevel = 1;
    }else if(gameRound < 25){
        gameLevel = 2;
    }else if(gameRound < 40){
        gameLevel = 3;
    }else if(gameRound < 60){
        gameLevel = 4;
    }else if(gameRound < 90){
        gameLevel = 5;
    }else if(gameRound < 120){
        gameLevel = 6;
    }else if(gameRound < 150){
        gameLevel = 7;
    }else if(gameRound < 190){
        gameLevel = 8;
    }else if(gameRound < 240){
        gameLevel = 9;
    }else if(gameRound < 300){
        gameLevel = 10;
    }else if(gameRound < 360){
        gameLevel = 11;
    }

    
    if(gameLevel == 0){
        shellLevelAppearRatio[0] = 100;
        shellLevelAppearRatio[1] = 100;
        shellLevelAppearRatio[2] = 100;
        
        minShootTime[0] = 40;
        shootInterval[0] = 50;
        
        bombShootRatio = 999999;
    }
    if(gameLevel == 1){
        shellLevelAppearRatio[0] = 100;
        shellLevelAppearRatio[1] = 100;
        shellLevelAppearRatio[2] = 100;
        
        minShootTime[0] = 35;
        shootInterval[0] = 40;
        
        bombShootRatio = 999999;
    }
    
    if(gameLevel == 2){
        shellLevelAppearRatio[0] = 90;
        shellLevelAppearRatio[1] = 100;
        shellLevelAppearRatio[2] = 100;
        
        minShootTime[0] = 35;
        shootInterval[0] = 35;
        
        minShootTime[1] = 60;
        shootInterval[1] = 50;
        
        bombShootRatio = 1000;
    }
    
    if(gameLevel == 3){
        shellLevelAppearRatio[0] = 80;
        shellLevelAppearRatio[1] = 95;
        shellLevelAppearRatio[2] = 100;
        
        minShootTime[0] = 30;
        shootInterval[0] = 35;
        
        minShootTime[1] = 55;
        shootInterval[1] = 45;
        
        minShootTime[2] = 70;
        shootInterval[2] = 50;
        
        bombShootRatio = 800;
    }
    
    if(gameLevel == 4){
        shellLevelAppearRatio[0] = 70;
        shellLevelAppearRatio[1] = 90;
        shellLevelAppearRatio[2] = 100;
        
        minShootTime[0] = 25;
        shootInterval[0] = 30;
        
        minShootTime[1] = 50;
        shootInterval[1] = 40;
        
        minShootTime[2] = 65;
        shootInterval[2] = 45;
        
        bombShootRatio = 550;
    }
    
    if(gameLevel == 5){
        shellLevelAppearRatio[0] = 60;
        shellLevelAppearRatio[1] = 85;
        shellLevelAppearRatio[2] = 100;
        
        minShootTime[0] = 20;
        shootInterval[0] = 25;
        
        minShootTime[1] = 45;
        shootInterval[1] = 35;
        
        minShootTime[2] = 60;
        shootInterval[2] = 40;
        
        bombShootRatio = 300;
    }
    
    if(gameLevel == 6){
        shellLevelAppearRatio[0] = 55;
        shellLevelAppearRatio[1] = 85;
        shellLevelAppearRatio[2] = 100;
        
        minShootTime[0] = 20;
        shootInterval[0] = 20;
        
        minShootTime[1] = 45;
        shootInterval[1] = 30;
        
        minShootTime[2] = 60;
        shootInterval[2] = 25;
        
        bombShootRatio = 200;
    }
    
    //FIRST
    if(gameLevel == 7){
        shellLevelAppearRatio[0] = 50;
        shellLevelAppearRatio[1] = 80;
        shellLevelAppearRatio[2] = 100;
        
        minShootTime[0] = 20;
        shootInterval[0] = 15;
        
        minShootTime[1] = 40;
        shootInterval[1] = 25;
        
        minShootTime[2] = 55;
        shootInterval[2] = 25;
        
        bombShootRatio = 100;
    }
    
    if(gameLevel == 8){
        shellLevelAppearRatio[0] = 45;
        shellLevelAppearRatio[1] = 75;
        shellLevelAppearRatio[2] = 100;
        
        minShootTime[0] = 20;
        shootInterval[0] = 10;
        
        minShootTime[1] = 40;
        shootInterval[1] = 20;
        
        minShootTime[2] = 55;
        shootInterval[2] = 20;
        
        bombShootRatio = 90;
    }
    
    if(gameLevel == 9){
        shellLevelAppearRatio[0] = 45;
        shellLevelAppearRatio[1] = 75;
        shellLevelAppearRatio[2] = 100;
        
        minShootTime[0] = 15;
        shootInterval[0] = 10;
        
        minShootTime[1] = 35;
        shootInterval[1] = 20;
        
        minShootTime[2] = 50;
        shootInterval[2] = 20;
        
        bombShootRatio = 80;
    }
    
    if(gameLevel == 10){
        shellLevelAppearRatio[0] = 45;
        shellLevelAppearRatio[1] = 75;
        shellLevelAppearRatio[2] = 100;
        
        minShootTime[0] = 10;
        shootInterval[0] = 10;
        
        minShootTime[1] = 30;
        shootInterval[1] = 20;
        
        minShootTime[2] = 45;
        shootInterval[2] = 20;
        
        bombShootRatio = 70;
    }
    
    if(gameLevel == 11){
        shellLevelAppearRatio[0] = 45;
        shellLevelAppearRatio[1] = 75;
        shellLevelAppearRatio[2] = 100;
        
        minShootTime[0] = 10;
        shootInterval[0] = 5;
        
        minShootTime[1] = 30;
        shootInterval[1] = 15;
        
        minShootTime[2] = 45;
        shootInterval[2] = 15;
        
        bombShootRatio = 55;
    }
    
    comboReduceSpeedAccum-=3;
    
    if(comboReduceSpeedAccum < 0 ){
        comboReduceSpeedAccum = 0;
    }
    
    minShootTime[0] += comboReduceSpeedAccum;
    minShootTime[1] += comboReduceSpeedAccum;
    minShootTime[2] += comboReduceSpeedAccum;
    
    shootInterval[0] += comboReduceSpeedAccum;
    shootInterval[1] += comboReduceSpeedAccum;
    shootInterval[2] += comboReduceSpeedAccum;
    
  //  printf("updateGameLevel:%i %i %4.8f\n",gameLevel,gameRound, comboReduceSpeedAccum);
    
    
   [self reInitColorComboLimit];

}


-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
        
        maxTime = 30;
        timeRemain = maxTime;
        finalTimeRemain = timeRemain;
        hasDead = false;
        
        [self updateGameLevel];
        
        s_bg = [CCSprite spriteWithFile:@"mini_05_bg.png"];
        [s_bg setPosition:ccp([UIScreen mainScreen].bounds.size.height/2, [UIScreen mainScreen].bounds.size.width/2)];
		[self addChild:s_bg];
        
        
        canShootBomb = false;
        isTappingTurtle = false;
        nextShootTimer= 15;
        
		wholeTurtleScaleFromSocurce = 0.5;
//        wholePenguinScaleFromSocurce = 0.5;
        wholePenguinScaleFromSocurce = 0.8;
        wholeCannonScaleFromSocurce = 0.5;
        
        cannonAngle = -45;
        
                
        turtleAppearRatio = 100;
        
        detectTurtleRadius = 53;
        detectBombRadius = 40;
        
        nextShellGen = 0;
        nextShootTimer = 50;
        
        if(isIpad){
            detectTurtleRadius *= 2;
            detectBombRadius *= 2;
            
        }
        
        [self initShadows];
        [self initCharacters];
        [self initCannon];
        [self initBombs];
        
    }
	return self;
}

-(void) initShadows{
    s_shadow_cannon = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1550/textureRatioForFuckingIpad, 640/textureRatioForFuckingIpad, 366/textureRatioForFuckingIpad, 28/textureRatioForFuckingIpad)];
    s_shadow_penguin = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1550/textureRatioForFuckingIpad, 610/textureRatioForFuckingIpad, 204/textureRatioForFuckingIpad, 26/textureRatioForFuckingIpad)];
    
    [ss_Character addChild:s_shadow_cannon];
    [ss_Character addChild:s_shadow_penguin];
    
    [s_shadow_penguin setPosition:ccp(20,12)];
    [s_shadow_cannon setPosition:ccp(62,6)];
    
    if(isIpad){
        [s_shadow_penguin setPosition:ccp(40,24)];
        [s_shadow_cannon setPosition:ccp(124,12)];
    }
}

-(void) initBombs{
    maxBomb = 10;
    bombShootIdx = 0;
    
    for(int i = 0 ; i < maxBomb ; i++){
        s_bomb[i] = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1948/textureRatioForFuckingIpad, 636/textureRatioForFuckingIpad, 100/textureRatioForFuckingIpad, 106/textureRatioForFuckingIpad)];
        [ss_Character addChild:s_bomb[i] z:kDeapth_Bg_Element1];
        
        [s_bomb[i] setPosition:ccp(1000,10000)];
    }
}

-(void) initCharacters{
    maxTurtle = 10;
    maxPenguin = 10;
    
    for(int i = 0 ; i < maxTurtle ; i++){
        turtle[i] = [[Turtle alloc] init];
        [turtle[i] setX:-9999];
        [turtle[i] setY:-9999];
        [turtle[i] setStatus:kTurtleAniStatus_Normal_In];
        [turtle[i] setIdNumber:i];
        [turtle[i] setDelegate:self];
        [turtle[i] setBombOutType:kTurtleBombOutType_bombOutOffScreenWithGravity];
        [turtle[i] bombOutOffScreenDirection:kBombOutOffScreenDirection_Right];
        [turtle[i] setGravity:true];
    }
    
    penguin[0] = [[Penguin alloc] init];
    [penguin[0] setX:15];
    [penguin[0] setY:14];
    [penguin[0] setStatus:kPenguinAniStatus_Idle];
    [penguin[0] setDelegate:self];
    
    penguin[1] = [[Penguin alloc] init];
    [penguin[1] setX:465000];
    [penguin[1] setY:14];
    [penguin[1] setStatus:kPenguinAniStatus_Idle];
    [penguin[1] setDelegate:self];
    [penguin[1] setFacingRight:false];
    
    if(isIpad){
        [penguin[0] setX:30];
        [penguin[0] setY:28];
    }
}

-(void) initCannon{
    cannon[0] = [[Cannon alloc] init];
    [cannon[0] setDelegate:self];
    [cannon[0] setCannonStatus:kCannonStatus_Idle];
    [cannon[0] setIdNumber:0];
    [cannon[0] setX:55];
    [cannon[0] setY:7];
    
    cannon[1] = [[Cannon alloc] init];
    [cannon[1] setDelegate:self];
    [cannon[1] setCannonStatus:kCannonStatus_Idle];
    [cannon[1] setIdNumber:1];
    [cannon[1] setX:450000];
    [cannon[1] setY:7];
    
    if(isIpad){
        [cannon[0] setX:110];
        [cannon[0] setY:14];
    }
    
}

-(void) cannonShootBall:(int)_fromId{
    [playLayer setToBombingCannon:[cannon[_fromId] x] y:[cannon[_fromId] y]];
}

-(void) manage:(ccTime) dt{
    // fuckAngle += (0 - fuckAngle)/20;
    //[cannon setRotateDegree:fuckAngle];
    
    timeRemain += (finalTimeRemain - timeRemain)/10;
    
    for ( int i = 0 ; i < maxTurtle ; i++){
        [turtle[i] manage:dt];
    }
    
    for ( int i = 0 ; i < 2 ; i++){
        [penguin[i] manage];
    }
    
    
    [cannon[0] manage];
    [cannon[1] manage];
    [cannon[0] setRotateDegree:cannonAngle + 50.4801941];
  
    
    [self manageTurtleHeadOut];
    
    [self genNextShoot];
    
    [self mangeCannonAI];
    [self manageBomb];
    
    [self checkCollisionOnWall];
    
    if(hasDead){
        hasDeadTimer++;
        if(hasDeadTimer >= 99){
            hasDead = false;
        }
    }
  
}

-(void) manageTurtleHeadOut{
    return;
    
    for(int i = 0 ; i < maxTurtle ; i++){
        if([turtle[i] status] == kTurtleAniStatus_Normal_In){
            if([turtle[i] x] > 0){
                [turtle[i] setStatus:kTurtleAniStatus_Out];
            }
        }
    }
}

-(void) genNextShoot{
    nextShootTimer--;
    
    if(nextShootTimer < 0){
        ranShootIntrval = arc4random() % shootInterval[nextShellGen];
        nextShootTimer = ranShootIntrval + minShootTime[nextShellGen];
        
        turtleAppearRatio = 100;
        [self shootAnAnimal:0];
    }else{
        if(arc4random()%bombShootRatio == 0 && canShootBomb){
            turtleAppearRatio = 0;
            [self shootAnAnimal:0];
        }
    }
    
}

-(void) shootAnAnimal:(int)_cannonIdx{
    
    [self updateGameLevel];
    
    canShootBomb = true;
    
     float ranForce;

    ranAnimalRatio = arc4random()%100;
    if(ranAnimalRatio < turtleAppearRatio){

        
        
        if(isIpad){
            ranForce = arc4random() % 20;
            ranForce+=5;
        }else{
            ranForce = arc4random() % 9;
            ranForce+=5;
        }
        
        [turtle[turtleShootIdx] resetHurtTime];
        [turtle[turtleShootIdx] setRotation:45];
        
        if(isIpad){
            [turtle[turtleShootIdx] shotFromCannonAtX:[cannon[_cannonIdx] cannonFrontX] y:[cannon[_cannonIdx] cannonFrontY] force:14 angle:cannonAngle];
        }else{
            [turtle[turtleShootIdx] shotFromCannonAtX:[cannon[_cannonIdx] cannonFrontX] y:[cannon[_cannonIdx] cannonFrontY] force:7 angle:cannonAngle];
        }
        
        [cannon[_cannonIdx] setCannonStatus:kCannonStatus_Shooting];
        
        
        [turtle[turtleShootIdx] setShellLevel:nextShellGen];
        
        static int ranShellLevel;
        ranShellLevel = arc4random()%100;
        if(ranShellLevel < shellLevelAppearRatio[0]){
            nextShellGen = 0;
        }else if(ranShellLevel < shellLevelAppearRatio[1]){
            nextShellGen = 1;
        }else{
            nextShellGen = 2;
        }
        
        turtleShootIdx++;
        if(turtleShootIdx >= maxTurtle){
            turtleShootIdx = 0;
        }
        
    }else{
        
        if(isIpad){
            ranForce = arc4random() % 20;
            ranForce+=5;
        }else{
            ranForce = arc4random() % 9;
            ranForce+=5;
        }

        if(isIpad){
            [self shotFromCannonAtX:[cannon[_cannonIdx] cannonFrontX] y:[cannon[_cannonIdx] cannonFrontY] force:18 angle:cannonAngle];
        }else{
            [self shotFromCannonAtX:[cannon[_cannonIdx] cannonFrontX] y:[cannon[_cannonIdx] cannonFrontY] force:9 angle:cannonAngle];
        }
        
        
        [cannon[_cannonIdx] setCannonStatus:kCannonStatus_Shooting];
        
        bombShootIdx++;
        if(bombShootIdx >= maxBomb){
            bombShootIdx = 0;
        }
    }
}

-(void) shotFromCannonAtX:(float)_x y:(float)_y force:(float)_force angle:(float)_angle{
    bomb_x[bombShootIdx] = _x;
    bomb_y[bombShootIdx] = _y;
    
    bomb_vx[bombShootIdx] = _force * cos(-_angle * M_PI/180);
    bomb_vy[bombShootIdx] = _force * sin(-_angle * M_PI/180) * 2.5;
    
    bomb_ar[bombShootIdx] = _force/5.5;
}

-(void) manageBomb{
    for(int i = 0 ; i < maxBomb ; i++){
        bomb_vx[i] += 0;
        bomb_vy[i] += -0.75;
        
        bomb_x[i] += bomb_vx[i];
        bomb_y[i] +=  bomb_vy[i];
        
        bomb_vr[i] += bomb_ar[i];
        bomb_r[i] += bomb_vr[i];
        
        bomb_ar[i] /= 10;
        
        
        [s_bomb[i] setPosition:ccp(bomb_x[i], bomb_y[i])];
        [s_bomb[i] setRotation:bomb_r[i]];
       // [s_bomb[i] setScale:1.5];
    }
}

-(void) mangeCannonAI{
    if(nextShootTimer == 10){
        
        cannonFinalRanAngle = arc4random() % 30;
        cannonFinalAngle = -30 - cannonFinalRanAngle;
        
        if(gameLevel == 0){
            if(cannonFinalAngle > -45){
                cannonFinalAngle = -45;
            }
        }
        if(gameLevel == 1){
            if(cannonFinalAngle > -40){
                cannonFinalAngle = -40;
            }
        }
        if(gameLevel == 2){
            if(cannonFinalAngle > -35){
                cannonFinalAngle = -35;
            }
        }
        
        
        cannonDiffAngle = cannonFinalAngle - cannonAngle;
        if(cannonDiffAngle > 0){
            cannonIsRotatingClockwise = true;
        }else{
            cannonIsRotatingClockwise = false;
        }
    }
    if(nextShootTimer < 10 && nextShootTimer > 0){
        cannonAngle += cannonDiffAngle / 3;
        
        if(cannonIsRotatingClockwise){
            if(cannonAngle - cannonFinalAngle > 0){
                cannonAngle = cannonFinalAngle;
            }
        }else{
            if(cannonAngle - cannonFinalAngle < 0){
                cannonAngle = cannonFinalAngle;
            }
        }
        
        // printf("CannonAngle:%4.8f %4.8f %4.8f\n",cannonAngle, cannonDiffAngle, cannonFinalAngle);
        [cannon[0] setRotation:cannonAngle + 50.4801941];
    }
    
}

- (void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    /*if(!isTappingTurtle){
        [super ccTouchesBegan:touches withEvent:event];
        isTappingTurtle = false;
    }*/
    
    if(!isTappingTurtle){
        [super ccTouchesBegan:touches withEvent:event];
        isTappingTurtle = false;
    }
    
    
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
    
     float fuxkTurtleAtX;
     float fuxkTurtleAtY;
    
     float fuxkDistanceDiff;
     float fuxkDistanceDiffX;
     float fuxkDistanceDiffY;
    
    isTappingTurtle = false;
	for( UITouch *touch in touches ) {
		CGPoint location = [touch locationInView: [touch view]];
		location = [[CCDirector sharedDirector] convertToGL: location];
        
        
        for(int i = 0 ; i < maxTurtle ; i++){
            
            fuxkTurtleAtX = [turtle[i] x];
            fuxkTurtleAtY = [turtle[i] y];
            
            if(fuxkTurtleAtX > 0 && fuxkTurtleAtX < [UIScreen mainScreen].bounds.size.height){
                if(fuxkTurtleAtY > 0 && fuxkTurtleAtY < [UIScreen mainScreen].bounds.size.width){
                    
                   // printf("ABC:%i l:%4.8f %4.8f r:%4.8f t:%4.8f %4.8f\n",i, location.x, location.y, [turtle[i] rotation], fuxkTurtleAtX, fuxkTurtleAtY);
                   // printf("DEF:%4.8f %4.8f %4.8f %4.8f\n", fuxkTurtleAtX - 11 * cos([turtle[i] rotation]* M_PI/180) - location.x, fuxkTurtleAtY + 11 * sin([turtle[i] rotation]* M_PI/180) - location.y,
                   //        fuxkTurtleAtX + 11 * cos([turtle[i] rotation]* M_PI/180) - location.x, fuxkTurtleAtY - 11 * sin([turtle[i] rotation]* M_PI/180) - location.y);
                    
                    fuxkDistanceDiffX = fuxkTurtleAtX - 11 * cos([turtle[i] rotation] * M_PI/180) - location.x;
                    fuxkDistanceDiffY = fuxkTurtleAtY + 11 * sin([turtle[i] rotation] * M_PI/180) - location.y;
                    fuxkDistanceDiff = sqrtf(fuxkDistanceDiffX*fuxkDistanceDiffX + fuxkDistanceDiffY*fuxkDistanceDiffY);
                    
                    if(fuxkDistanceDiff < detectTurtleRadius){
                        ///printf("TTTTTTTTTTBBBBBBBBBB\n\n");
                        isTappingTurtle = true;
                        [turtle[i] tap3];
                    }else{
                       // printf("YYYYYYYYYYYYYTTTTTTTTTTBBBBBBBBBB\n\n");
                        fuxkDistanceDiffX = fuxkTurtleAtX + 11 * cos([turtle[i] rotation] * M_PI/180) - location.x;
                        fuxkDistanceDiffY = fuxkTurtleAtY - 11 * sin([turtle[i] rotation] * M_PI/180) - location.y;
                        fuxkDistanceDiff = sqrtf(fuxkDistanceDiffX*fuxkDistanceDiffX + fuxkDistanceDiffY*fuxkDistanceDiffY);
                        
                        if(fuxkDistanceDiff < detectTurtleRadius){
                            isTappingTurtle = true;
                            [turtle[i] tap3];
                        }else{
                           // printf("BBBBBBBBBBBBBBBBBYYYYYYYYYYYYYTTTTTTTTTTBBBBBBBBBB\n\n");
                            fuxkDistanceDiffX = fuxkTurtleAtX - location.x;
                            fuxkDistanceDiffY = fuxkTurtleAtY - location.y;
                            fuxkDistanceDiff = sqrtf(fuxkDistanceDiffX*fuxkDistanceDiffX + fuxkDistanceDiffY*fuxkDistanceDiffY);
                            
                            if(fuxkDistanceDiff < detectTurtleRadius){
                                isTappingTurtle = true;
                                [turtle[i] tap3];
                            }
                        }
                    }
                    
                }
            }

        }
        
        
        for(int i = 0 ; i < maxBomb ; i++){
            
            fuxkTurtleAtX = bomb_x[i];
            fuxkTurtleAtY = bomb_y[i];
            
            fuxkDistanceDiffX = fuxkTurtleAtX - location.x;
            fuxkDistanceDiffY = fuxkTurtleAtY - location.y;
            fuxkDistanceDiff = sqrtf(fuxkDistanceDiffX*fuxkDistanceDiffX + fuxkDistanceDiffY*fuxkDistanceDiffY);
            
            // printf("i:%i l:%4.8f %4.8f t:%4.8f %4.8f D:%4.8f\n",i, location.x, location.y, fuxkTurtleAtX, fuxkTurtleAtY, fuxkDistanceDiff);
            
            if(fuxkDistanceDiff < detectBombRadius){
                [self tapThisBomb:i];
            }
            
        }
        
    }
    
    
}

-(void) checkCollisionOnWall{
    for(int i = 0 ; i < maxTurtle ; i++){
        
        if([turtle[i] x] > 460 || [turtle[i] x] < 20){
        //    [turtle[i] collisionOnWall];
        }
        
        if([turtle[i] y] < -20 && [turtle[i] y] > -100){
            [uILayer lostCombo];
            [turtle[i] setY:-99999];
            
            if(!hasDead){
                comboReduceSpeedAccum = 30;
                finalTimeRemain -= 10.05;
                hasDead = true;
            }
            
            nextShootTimer = 100;
            canShootBomb = false;
        }
    }
}

-(void) tapThisBomb:(int)_bombIdx{
    [playLayer setToBombing:bomb_x[_bombIdx] turtleY:bomb_y[_bombIdx]];
    [playLayer setToBombingGameover];
    bomb_x[_bombIdx] = 99999;
    nextShootTimer = 100;
    canShootBomb = false;
    
    for(int i = 0 ; i < maxTurtle ; i++){
        if([turtle[i] y] > 0 && [turtle[i] y] < 320){
            [turtle[i] bombButLoseCombo];
        }
    }
    
    [uILayer lostCombo];
    
    if(!hasDead){
        comboReduceSpeedAccum = 30;
        finalTimeRemain -= 10.05;
        hasDead = true;
    }
    
}

-(void) turtleBombed:(int)_momentIdx{
   // [super turtleBombed:_momentIdx];
   // printf("turtleBombed\n");
    //counterForAchivement++;
}

- (void) dealloc
{
	printf("Mini 03 Dealloc\n");
    
    for(int i = 0 ; i < maxTurtle ; i++){
        [turtle[i] release];
    }
    for(int i = 0 ; i < 2 ; i++){
        [penguin[i] release];
    }
    
    [cannon[0] release];
    [cannon[1] release];
    
    
	[super dealloc];
}


@end
