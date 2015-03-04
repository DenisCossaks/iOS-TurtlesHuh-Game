//
//  Mini03.h
//  TurtlesHuh
//
//  Created by  on 2012/5/24.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "MiniBasic.h"
#import "Turtle.h"
#import "Penguin.h"
#import "Cannon.h"

@interface Mini03 : MiniBasic {
    Turtle* turtle[10];
    Penguin* penguin[2];
    Cannon* cannon[2];
    CCSprite* s_bomb[10];
    
    float bomb_x[10];
    float bomb_y[10];
    float bomb_vx[10];
    float bomb_vy[10];
    float bomb_r[10];
    float bomb_vr[10];
    float bomb_ar[10];
    
    int maxTurtle;
    int maxPenguin;
    int maxBomb;
    
    int turtleShootIdx;
    int penguinShootIdx;
    int bombShootIdx;
    
    //float cannonAngle;
    float cannonFinalAngle;
    float cannonFinalRanAngle;
    float cannonDiffAngle;
    bool cannonIsRotatingClockwise;
    
    int nextShootTimer;
    int minShootTime[3];
    int shootInterval[3];
    int ranShootIntrval;
    int bombShootRatio;
    
    int turtleAppearRatio;
    int ranAnimalRatio;
    
    float detectTurtleRadius;
    float detectBombRadius;
    
    int maxShellLevel;
    int shellLevelAppearRatio[3];
    int nextShellGen;
    
    bool isTappingTurtle;
    
    bool canShootBomb;
    int hasDeadTimer;
    bool hasDead;
    
    CCSprite* s_shadow_cannon;
    CCSprite* s_shadow_penguin;
}

-(void) initShadows;
-(void) initCharacters;
-(void) initCannon;
-(void) initBombs;

//-(void) manage;
-(void) mangeCannonAI;
-(void) manageTurtleHeadOut;
-(void) manageBomb;
-(void) checkCollisionOnWall;

-(void) genNextShoot;
-(void) shootAnAnimal:(int)_cannonIdx;

-(void) shotFromCannonAtX:(float)_x y:(float)_y force:(float)_force angle:(float)_angle;

-(void) tapThisBomb:(int)_bombIdx;

@end
