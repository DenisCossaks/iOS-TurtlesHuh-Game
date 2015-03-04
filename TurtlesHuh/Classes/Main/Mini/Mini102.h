//
//  Mini102.h
//  TurtlesHuh
//
//  Created by apple on 12/11/4.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "MiniBasic.h"

#import "Penguin.h"
#import "Cannon.h"

@interface Mini102 : MiniBasic {
    Penguin* penguin;
    Cannon* cannon;
    
    CCSprite* s_shell[20];
    float shellX[20];
    float shellY[20];
    float shellScale[20];
    bool shellIsAppearing[20];
    int shellAppearingTimer[20];
    bool shellIsOnScreen[20];
    int maxShell;
    int shellIdx;
    
    int cannonTapDirection;  // 0 left , 1 middle , 2 right
    float cannonFinalAngle;
    float cannonAngleInterval;
    float cannonRotationSpeed;
    bool isClockwise;
    
    CCSprite* s_Cannon_Ball;
    int maxCannonBall;
    int cannonBallIdx;
    int recentCannonBallShootingTime;
    float cannonBall_VX;
    float cannonBall_VY;
    float cannonBall_X;
    float cannonBall_Y;
    
    
    //penguin jump
    bool penguinIsFacingRight;
    bool penguinIsJumping;
    int penguinJumpTimer;
    float penguinJumpingExternalStartX;
    
    
    //carraige
    CCSprite* s_carriage;
    CCSprite* s_carriageWheel[2];
    float carriage_X;
    float carriage_Y;
    float carriage_wheelR;
    float carriage_wheelVR;
    float carriage_wheelAR;
    
    
    float PCPOffsetX;
}


-(void) manageShells;
-(void) manageCannonBalls;
-(void) manageCannon;
-(void) managePenguinJump;
-(void) manageCarriage;

-(void) shootCannon;

-(void) initCannon;
-(void) initCannonBalls;
-(void) initCarriage;

-(void) genOneShellAtX:(int)_x Y:(int)_y;

-(void) setPenguinJump:(bool)_isJumpingToRight;

-(void) tapLeft:(bool)_isLeft;
-(void) tryShootCannonBall;

@end
