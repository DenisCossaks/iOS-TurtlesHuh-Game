//
//  Mini07.h
//  TurtlesHuh
//
//  Created by  on 2012/6/8.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Turtle.h"
#import "Penguin.h"
#import "Cannon.h"
#import "MiniBasic.h"

@interface Mini07 : MiniBasic {
    Turtle* turtle[20];
    Penguin* penguin[20];
    Cannon* cannon;
    
    CCSprite* s_Cannon_Ball[2];
    int maxCannonBall;
    int cannonBallIdx;
    
    float cannonBall_VX[2];
    float cannonBall_VY[2];
    float cannonBall_X[2];
    float cannonBall_Y[2];
    bool cannonBall_isAni[2];
    int cannonBall_Timer[2];
    
    int maxTurtle;
    int maxPenguin;
    
    bool isTappingLeft;
    bool isTappingRight;
    
    float PCVX;
    float PCAX;
    float PCX;
    float PCY;
    float PCPOffsetX;
    
    int shootCannonTimer;
    bool isShootingCannon;
    bool hasShotOnceAndTakeRestForNextFuck;
    int hasShotOnceAndTakeRestForNextFuckTimer;

}

-(void) initCannon;
-(void) initCannonBalls;

-(void) manageCannonBalls;
-(void) manageCannon;

-(void) updatePCPosition;

@end
