//
//  Mini102.m
//  TurtlesHuh
//
//  Created by apple on 12/11/4.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "Mini102.h"
#import "GamePlayGlobal.h"
#import "Global.h"

@implementation Mini102

-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
        
        maxTime = 6000;
        timeRemain = maxTime;
        
        
        s_bg = [CCSprite spriteWithFile:@"mini_05_bg.png"];
        [s_bg setPosition:ccp(240,160)];
		[self addChild:s_bg];
        
        wholeCannonScaleFromSocurce = 0.44;
        wholePenguinScaleFromSocurce = 0.48;
        
        cannonAngle = -45;
        cannonFinalAngle = -45;
        isClockwise = true;
        
        cannonRotationSpeed = 2.5;

        [self initControlLayer];
        [self initCharacters];
        [self initCannon];
        [self initCannonBalls];
        [self initCarriage];
        
        cannonTapDirection = 2;
        penguinIsFacingRight = true;
        [cannon setX:240];
        [cannon setY:15];

    }
    
	return self;
}

-(void) initCarriage{
    s_carriage = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1550/2, 672/2, 244/2, 14/2)];
    [ss_Character addChild:s_carriage z:kDeapth_Bg_Element1];
    
    s_carriageWheel[0] = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1806/2, 672/2, 54/2, 52/2)];
    s_carriageWheel[1] = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1806/2, 672/2, 54/2, 52/2)];
    [ss_Character addChild:s_carriageWheel[0] z:kDeapth_Bg_Element1];
    [ss_Character addChild:s_carriageWheel[1] z:kDeapth_Bg_Element1];
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
        s_shell[i] = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(948/2, 370/2, 108/2, 76/2)];
        [ss_Character addChild:s_shell[i]];
        [s_shell[i] setPosition:ccp(-10000,-10000)];
        
        shellIsOnScreen[i] = false;
        shellX[i] = 10000;
        shellY[i] = 10000;
        
        shellIsAppearing[i] = false;
    }
}

-(void) initControlLayer{
    controlLayer = [ControlLayer node];
	[self addChild:controlLayer z:kDeapth_Btns];
    [controlLayer setDelegate:self];
}


-(void) initCannonBalls{

        s_Cannon_Ball = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(504/2, 724/2, 60/2, 58/2)];
        [s_Cannon_Ball setPosition:ccp(1000,100000)];
        [ss_Character addChild:s_Cannon_Ball z:kDeapth_Extra2];
        [s_Cannon_Ball setScale:1.12];
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
    
    
    shellIdx++;
    if(shellIdx == maxShell){
        shellIdx = 0;
    }
}

-(void) manage:(ccTime) dt{
    [self manageCannon];
    [self manageCannonBalls];
    [self manageShells];
    [self managePenguinJump];
    
    [cannon manage];
    
    [penguin setX:[cannon x]+PCPOffsetX-40];
    [penguin setY:[cannon y]];
    [penguin manage];
    
    [self manageCarriage];
    
}

-(void) manageCarriage{
    carriage_X = [cannon x];
    carriage_Y = [cannon y]-2;
    
    [s_carriage setPosition:ccp(carriage_X, carriage_Y)];
    [s_carriageWheel[0] setPosition:ccp(carriage_X - 30, carriage_Y)];
    [s_carriageWheel[1] setPosition:ccp(carriage_X + 30, carriage_Y)];
    
    //static float whellCircumfunce = 84.8230016; // 27 X PI
    carriage_wheelR += carriage_wheelVR;
    
    [s_carriageWheel[0] setRotation:carriage_wheelR];
    [s_carriageWheel[1] setRotation:carriage_wheelR];
    
}



-(void) managePenguinJump{
    if(!penguinIsJumping){
        return;
    }
    
    //printf("penguinJumpTimer:%i\n",penguinJumpTimer);
    
    if(penguinJumpTimer == 0){
        if(!isClockwise){
            penguinJumpFinalX = [penguin x] + 65;
        }else{
            penguinJumpFinalX = [penguin x] - 65;
        }
        
        penguinJumpFinalY = [penguin y];
        
        [penguin setJump:kPenguinJump_jumpTo1TurtleShell];
        
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
            PCPOffsetX = 65;
        }
        
        penguinIsJumping = false;
    }
    
    if(penguinJumpTimer == 8){
        
        penguinIsJumping = false;
    }
    
    penguinJumpTimer++;
    
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
        
    }
}



-(void) manageCannon{
    
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
    
}



-(void) manageCannonBalls{
    
}

-(void) setPenguinJump:(bool)_isJumpingToRight{
    penguinIsFacingRight = _isJumpingToRight;
    penguinJumpTimer = 0;
    penguinIsJumping = true;
}



-(void) btnIsTappedInControlLayer:(int)_btnIdx{
  //  printf("btnIsTappedInControlLayer:%i\n",_btnIdx);
    if(_btnIdx == 0){
        [self tapLeft:true];
    }
    if(_btnIdx == 3){
        [self tapLeft:false];
    }
    if(_btnIdx == 2){
        
    }
   // if(_btnIdx == 3){
        //[self tryShootCannonBall];
   // }
}

-(void) btnIsReleasedInControlLayer:(int)_btnIdx{
   
}

-(void) tapLeft:(bool)_isLeft{
    static int prevDirection;
    prevDirection = cannonTapDirection;
    
    if(_isLeft){
        cannonTapDirection--;
    }else{
        cannonTapDirection++;
    }
    if(cannonTapDirection < 0){
        cannonTapDirection = 0;
    }
    if(cannonTapDirection >= 2){
        cannonTapDirection = 2;
    }
    
    if(cannonTapDirection == 0){
        cannonFinalAngle = -135;
    }
    if(cannonTapDirection == 1){
        cannonFinalAngle = -90;
    }
    if(cannonTapDirection == 2){
        cannonFinalAngle = -45;
    }
    
    cannonAngleInterval = cannonFinalAngle - cannonAngle;
    
    if(cannonTapDirection > prevDirection){
        isClockwise = true;
    }else{
        isClockwise = false;
    }
    
    if(cannonTapDirection == 0){
        if(penguinIsFacingRight){
            [self setPenguinJump:false];
        }
    }
    if(cannonTapDirection == 2){
        if(!penguinIsFacingRight){
            [self setPenguinJump:true];
        }
    }

    
   // printf("cannonTapDirection:%i :%4.8f\n",cannonTapDirection,cannonFinalAngle);
}

-(void) tryShootCannonBall{
    [self shootCannon];
}

-(void) shootCannon{
    static float superFuxkAngleDiff;
    static float superFuxkOriX;
    static float superFuxkOriY;
    static float superFuxkOffsetX;
    static float superFuxkOffsetY;
    static float superFuxkFuxkX;
    static float superFuxkFuxkY;
    
    superFuxkOffsetX = -58 * cos(cannonAngle * M_PI/180 + M_PI/2);
    superFuxkOffsetY = 58 * sin(cannonAngle * M_PI/180 + M_PI/2) - 58;
    
    superFuxkAngleDiff = -cannonAngle * M_PI/180;
    superFuxkOriX = 91 * wholeCannonScaleFromSocurce * 2;
    superFuxkOriY = 35 * wholeCannonScaleFromSocurce * 2;
    superFuxkFuxkX = [cannon x] + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff) - superFuxkOffsetX * wholeCannonScaleFromSocurce;
    superFuxkFuxkY = [cannon y] + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff) - superFuxkOffsetY * wholeCannonScaleFromSocurce;
    
    
    cannonBall_X = superFuxkFuxkX;
    cannonBall_Y = superFuxkFuxkY;
    
    cannonBall_VX = 10 * cos(-cannonAngle * M_PI/180);
    cannonBall_VY = 10 * sin(-cannonAngle * M_PI/180);

    
    
    [playLayer setToBombingCannon:[cannon x] y:[cannon y]];
    

    
    [musicController playThisSound:kSound_TurtleExplode01 isLoop:NO gain:1.0];
}


- (void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [super ccTouchesBegan:touches withEvent:event];
    

    if(isStopping){
        return;
    }
    
    for( UITouch *touch in touches ) {
		CGPoint location = [touch locationInView: [touch view]];
		location = [[CCDirector sharedDirector] convertToGL: location];
        
        if(location.y < 90){
            if(location.x > 84 && location.x < 396){
                [self tryShootCannonBall];
            }
        }
        
        if(location.y < 258 && location.y > 90){
            [self tryShootCannonBall];
        }
        
        //  printf("lx:%4.8f %4.8f\n",location.x,location.y );
    }
    
}



@end
