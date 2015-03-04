//
//  Mini11.h
//  TurtlesHuh
//
//  Created by  on 2012/5/30.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

#import "MiniBasic.h"

#import "Penguin.h"
#import "Cannon.h"

typedef enum{
    kChainType_Constant = 0,
    kChainType_Middle,
    kChainType_Behine,
    kChainType_SlowToFast,
    kChainType_FastToSlow,
}eChainType;

@interface Mini11 : MiniBasic {
    Penguin* penguin;
    Cannon* cannon;
    
    float PCVX;
    float PCAX;
    float PCX;
    float PCY;
    float PCPOffsetX;
    
    CCSprite* s_shell[20];
    float shellX[20];
    float shellY[20];
    float shellScale[20];
    bool shellIsAppearing[20];
    int shellAppearingTimer[20];
    bool shellIsOnScreen[20];
    int maxShell;
    int shellIdx;
    int maxShellGen;
    
    bool isUsingFirstNowIsShellOnScreen;
    bool nowIsShellOnScreen[20];
    bool nowIsShellOnScreen2[20];
    
    bool shellIsFuckingPenguin[20];
    int shellIsFuckingpenguinTimer[20];
    
    CCSprite* s_Cannon_Ball[2];
    int maxCannonBall;
    int cannonBallIdx;
   // float cannonBall_AY[8];
    
    float cannonForce;
    float cannonAdditionalForceY;
    float cannonGravity;
    float cannonFriction;
    
    float cannonBall_VX[2];
    float cannonBall_VY[2];
    float cannonBall_X[2];
    float cannonBall_Y[2];
    bool cannonBall_isAni[2];
    int cannonBall_Timer[2];
    bool cannBall_isHittingFirstChain;
    bool cannonBallIsGoingDown[2];
    
    bool hasShotOnceAndTakeRestForNextFuck;
    int hasShotOnceAndTakeRestForNextFuckTimer;
    
    //float cannonAngle;
    float cannonFinalAngle;
    float cannonAngleInterval;
    float cannonRotationSpeed;
    bool isClockwise;
    
    bool isTappingLeft;
    bool isTappingRight;
    
    float detectCannonBallRadius;
    float detectShellRadius;
    
     float fuxkCannonBombX;
     float fuxkCannonBombY;
    
    int shootCannonTimer;
    bool isShootingCannon;
    bool hasShotCannonBeforeNextChain;
    
    bool penguinIsJumping;
    bool penguinJumpingToRight;
    int penguinJumpTimer;
    float penguinJumpingExternalStartX;
    
     
    int chainType;
    int chainIntervalSelect[15];
    
    //change update values
    int cannonMinAngle;
    int cannonMaxAngle;
    int cannonAngleRange;
    
    int chainAverageInterval;
    int chainMinInterval;
    int chainMaxInterval;
    int chainMaxShellAppear;
    int chainTypeAppearRatio[5];
    
    float genX[20];
    float genY[20];
    
    bool isFuckedAndLoseCombo;
    
    CCSprite* s_carriage;
    CCSprite* s_carriageWheel[2];
    float carriage_X;
    float carriage_Y;
    float carriage_wheelR;
    float carriage_wheelVR;
    float carriage_wheelAR;
}

-(void) updatePCPosition;
-(void) manageShells;
-(void) manageCannonBalls;
-(void) manageCannon;
-(void) manageShootToNextChain;
-(void) managePenguinJump;
-(void) manageCarriage;

-(void) shootCannon;

-(void) getChainType;

-(void) thisShellIsBeingShot:(int)_shellIdx;

-(void) initCannon;
-(void) initCannonBalls;
-(void) initCarriage;

-(void) genOneShellAtX:(int)_x Y:(int)_y;
-(void) genNextShellChain;
-(void) checkToAnyRemainShellHasntHitted;
-(void) setThisShellFuckBackPenguin:(int)_shellIdx;

-(void) changePenguinPosition;
-(void) setPenguinJump:(bool)_isJumpingToRight;

@end
