//
//  Mini07.m
//  TurtlesHuh
//
//  Created by  on 2012/6/8.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "Mini07.h"
#import "GamePlayGlobal.h"
#import "Global.h"

@implementation Mini07

-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
        
        s_bg = [CCSprite spriteWithFile:@"mini_05_bg.png"];
        [s_bg setPosition:ccp(240,160)];
		[self addChild:s_bg];
        
        wholeCannonScaleFromSocurce = 0.5;
        wholePenguinScaleFromSocurce = 0.5;
        wholeTurtleScaleFromSocurce = 0.5;
        
        maxTurtle = 20;
        maxPenguin = 20;
        
        PCAX = 0.5;
        PCVX = 0;
        PCX = 150;
        PCY = 15;
        
        isTappingLeft = false;
        isTappingRight = false;
       
        [self initControlLayer];
        [self initCharacters];
        [self initCannon];
        [self initCannonBalls];
    }
    
	return self;
}

-(void) initCannon{
    cannonAngle = 90;
    shootCannonTimer = 0;
    isShootingCannon = false;
   // hasShotCannonBeforeNextChain = false;
    hasShotOnceAndTakeRestForNextFuck = false;
    
    cannon = [[Cannon alloc] init];
    [cannon setDelegate:self];
    
    [cannon setCannonStatus:kCannonStatus_Idle];
    
    [cannon setRotateDegree:cannonAngle + 50.4801941];
    
    [cannon setX:240];
    [cannon setY:250];
}

-(void) initCannonBalls{
    maxCannonBall = 2;
    for(int i = 0 ; i < maxCannonBall ; i++){
        s_Cannon_Ball[i] = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(504/2, 724/2, 60/2, 58/2)];
        [s_Cannon_Ball[i] setPosition:ccp(1000,100000)];
        [ss_Character addChild:s_Cannon_Ball[i] z:kDeapth_Extra2];
        [s_Cannon_Ball[i] setScale:1.12];
        cannonBall_isAni[i] = false;
    }
    cannonBallIdx = 0;
}

-(void) initControlLayer{
    controlLayer = [ControlLayer node];
	[self addChild:controlLayer z:kDeapth_Btns];
    [controlLayer setDelegate:self];
}

-(void) initCharacters{
    for(int i = 0 ; i < maxPenguin ; i++){
        penguin[i] = [[Penguin alloc] init];
        [penguin[i] setX:25];
        [penguin[i] setY:14];
        [penguin[i] setStatus:kPenguinAniStatus_Idle];
        //[penguin setDelegate:self]
    }
    
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
    
}

-(void) manage:(ccTime) dt{
    [self manageCannon];
    [self manageCannonBalls];
    [self updatePCPosition];
    
    [cannon manage];
    
    
    for(int i = 0 ; i < maxTurtle ; i++){
        [turtle[i] manage:dt];
    }
    
    for(int i = 0 ; i < maxPenguin ; i++){
       // printf("p:%i\n",i);
        [penguin[i] manage];
    }

}

-(void) manageCannonBalls{
    
    for(int i = 0 ; i < maxCannonBall ; i++){
        if(cannonBall_isAni[i]){
            cannonBall_X[i] += cannonBall_VX[i];
            cannonBall_Y[i] += cannonBall_VY[i];
            
            [s_Cannon_Ball[i] setPosition:ccp(cannonBall_X[i],cannonBall_Y[i])];
            
        }
        
    }
    
}

-(void) manageCannon{
    if(hasShotOnceAndTakeRestForNextFuck){
        hasShotOnceAndTakeRestForNextFuckTimer++;
        if(hasShotOnceAndTakeRestForNextFuckTimer == 30){
            hasShotOnceAndTakeRestForNextFuck = false;
        }
    }
}

-(void) shootCannon{
    if(hasShotOnceAndTakeRestForNextFuck){
        return;
    }
    
    hasShotOnceAndTakeRestForNextFuck = true;
    hasShotOnceAndTakeRestForNextFuckTimer = 0;
    
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
    
    //printf("cannonBallIdx:%i\n",cannonBallIdx);
    
    cannonBall_X[cannonBallIdx] = superFuxkFuxkX;
    cannonBall_Y[cannonBallIdx] = superFuxkFuxkY; 
    
    cannonBall_VY[cannonBallIdx] = -15;
    cannonBall_VX[cannonBallIdx] = 0;
    
    cannonBall_isAni[cannonBallIdx] = true;
    cannonBall_Timer[cannonBallIdx] = 0;
    
    cannonBallIdx++;
    if(cannonBallIdx == maxCannonBall){
        cannonBallIdx = 0;
    }
    
    [playLayer setToBombingCannon:[cannon x] y:[cannon y]];
    
 
    
    [musicController playThisSound:kSound_TurtleExplode01 isLoop:NO gain:1.0];
}

-(void) btnIsTappedInControlLayer:(int)_btnIdx{
    if(_btnIdx == 0){
        isTappingRight = false;
        isTappingLeft = true;
    }
    if(_btnIdx == 3){
        isTappingLeft = false;
        isTappingRight = true;
    }
}

-(void) btnIsReleasedInControlLayer:(int)_btnIdx{
    if(_btnIdx == 0){
        isTappingLeft = false;
    }
    if(_btnIdx == 3){
        isTappingRight = false;
    }
}

-(void) updatePCPosition{
    /*if(isTappingRight){
        PCVX+=PCAX;
    }else if(isTappingLeft){
        PCVX-=PCAX;
    }else{
        PCVX += (0.0 - PCVX)/8.0;
    }*/
    
    if(isTappingRight){
        PCVX = 7;
    }else if(isTappingLeft){
        PCVX = -7;
    }else{
        PCVX = 0;
    }
    
    
    PCX += PCVX;
    
    if(PCX < 7){
        PCX = 7;
        PCVX = 0;
    }
    if(PCX > 414){
        PCX = 414;
        PCVX = 0;
    }
   
    
    [cannon setX:PCX];

    
}


-(void) dealloc
{
	printf("Mini 11 Dealloc\n");
    
    for(int i = 0 ; i < maxTurtle ; i++){
        [turtle[i] release];
    }
    
    for(int i = 0 ; i < maxPenguin ; i++){
        [penguin[i] release];
    }
    
    [cannon release];
    
	[super dealloc];
}

- (void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    
    if(isStopping){
        return;
    }
    
    if(isTapWronglyAndDisableBtns){
        isTapWronglyAndDisableBtns = false;
        isFuckingShootFirstTime = false;
        return;
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
    
    for( UITouch *touch in touches ) {
		CGPoint location = [touch locationInView: [touch view]];
		location = [[CCDirector sharedDirector] convertToGL: location];
        
        if(location.y < 90){
            if(location.x > 84 && location.x < 396){
                [self shootCannon];
            } 
        }
        
        if(location.y < 258 && location.y > 90){
            [self shootCannon];
        }
        
        //  printf("lx:%4.8f %4.8f\n",location.x,location.y );
    }
    
}


@end
