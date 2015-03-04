//
//  Turtle.h
//  BombTheTurtle
//
//  Created by  on 2012/4/12.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

typedef enum{
    kTurtleShellColor_Brown = 0,
    kTurtleShellColor_Red,
    kTurtleShellColor_Green,
    kTurtleShellColor_Blue,
    kTurtleShellColor_BrownOri,
}eTurtleShellColor;


typedef enum{
    kTurtlePart_Shadow = 0,
    kTurtlePart_Neck,
    kTurtlePart_Head,
    
    kTurtlePart_Eye,
    kTurtlePart_Jaw,
    
    kTurtlePart_Tail,
    kTurtlePart_Shell,
    kTurtlePart_LeftLeg,
    kTurtlePart_RightLeg,
    
    kTurtlePart_Glide,
    kTurtlePart_Line,
    kTurtlePart_Rocket,
    kTurtlePart_Helmet,
    kTurtlePart_Rope,
}eTurtlePart;

typedef enum{
    kTurtleAniStatus_Normal_Out = 0,
    kTurtleAniStatus_Normal_In,
    //kTurtleAniStatus_Wink,
    kTurtleAniStatus_Idle,
    kTurtleAniStatus_In,
    kTurtleAniStatus_Out,
    kTurtleAniStatus_Bombing,
    kTurtleAniStatus_Shaking,
    kTurtleAniStatus_Flying,
    kTurtleAniStatus_Colliding,
}eTurtleAniStatus;


typedef enum{
    kTurtleBombOutType_backToOri = 0,
    kTurtleBombOutType_bombOutOffScreen,
    kTurtleBombOutType_bombOutOffScreenWithGravity,
}eTurtleBombOutType;



typedef enum{
    kBombOutOffScreenDirection_Left = 0,
    kBombOutOffScreenDirection_Right,
}eBombOutOffScreenDirection;

@interface Turtle : CCNode {
    eTurtleAniStatus status;
    
    eTurtleShellColor color;
    
    bool isWinking;
    int winkingTimer;

    int turtleAniSte;
    int turtleAniStep;
    int turtleAniStep2;
    int turtleBombAniStep;
    
    float bomb_force;
    float bomb_x;
    float bomb_y;
    float bomb_vx;
    float bomb_vy;
    float bomb_oriVy;
    float bomb_ay;
    float bomb_floorY;
    bool bomb_isHittedFloor;
    bool bomb_hasOnceHittedFloor;
    int bomb_hitFloorTimer;
    bool bomb_isRotatingClockrise;
    float bomb_vr;
    float bomb_shadowOpacity;
    float bomb_shadowScaleY;
    
    float turtleOriX;
    float turtleOriY;
    float turtleX;
    float turtleY;
    float turtleRotation;
    float prevTurtleRotation;
    
    float turtleAX;
    float turtleAY;
    float turtleVX;
    float turtleVY;
    float turtleVR;
    float turtleAR;
    bool isGravity;
    
    CCSprite* s_Turtle_HeadAndNeck;
    CCSprite* s_Turtle_Head;
    CCSprite* s_Turtle_Jaw;
    CCSprite* s_Turtle_Neck;
    CCSprite* s_Turtle_Shell;
    CCSprite* s_Turtle_LeftLeg;
    CCSprite* s_Turtle_RightLeg;
    CCSprite* s_Turtle_Tail;
    CCSprite* s_Turtle_Shadow;
    CCSprite* s_Turtle_Eye;
    CCSprite* s_Turtle_Spike[4];
    
    float turtle_HeadAndNeck_r;
    float turtle_Head_r;
    float turtle_Jaw_r;
    float turtle_Neck_r;
    float turtle_Shell_r;
    float turtle_LeftLeg_r;
    float turtle_RightLeg_r;
    float turtle_Tail_r;
    float turtle_Shadow_r;
    float turtle_Eye_r;
    float turtle_Spike_r[4];
    
    float turtle_HeadAndNeck_x;
    float turtle_Head_x;
    float turtle_Jaw_x;
    float turtle_Neck_x;
    float turtle_Shell_x;
    float turtle_LeftLeg_x;
    float turtle_RightLeg_x;
    float turtle_Tail_x;
    float turtle_Shadow_x;
    float turtle_Eye_x;
    float turtle_Spike_x[4];
    
    float turtle_HeadAndNeck_y;
    float turtle_Head_y;
    float turtle_Jaw_y;
    float turtle_Neck_y;
    float turtle_Shell_y;
    float turtle_LeftLeg_y;
    float turtle_RightLeg_y;
    float turtle_Tail_y;
    float turtle_Shadow_y;
    float turtle_Eye_y;
    float turtle_Spike_y[4];
    
    float turtle_Shell_scaleX;
    float turtle_Shell_scaleY;
    
    bool isFacingRight;
    
    int shellLevel;
    int hurtTime;
    bool hasSpike;
    int spikeRemoveAniTimer;
    bool spikeRemoveIsAni;
    float spikePosX[4];
    float spikePosY[4];
    float spikeOpacity;
    
    eTurtleBombOutType bombOutType;
    
    bool isCountAlready;
    
    float externalOffsetX;
    float externalOffsetY;
    float externalOffsetX2;
    float externalOffsetY2;
    float externalOffsetFinalX;
    float externalOffsetFinalY;
    bool isExternalOffseting;
    
    id delegate;
    
    int idNumber;
    float showingHeadTime;
    int momentIdx;
    
    eBombOutOffScreenDirection bombOutOffScreenDirection;
    
    bool isChangingWholeScale;
    
     float superFuxkAngleDiff;
     float superFuxkOriX;
     float superFuxkOriY;
    
    
    bool isBombShell;
    
    bool isYellowHurt;
    int yellowHurtTimer;
}

-(void) setDelegate:(id)_delegate;
-(void) setScaleYForShell:(float)_scaleY;
-(void) setScaleXForShell:(float)_scaleX;

-(float) rotation;
-(int) hurtTime;
-(int) shellLevel;
-(float) x;
-(float) y;
-(int) color;
-(int) idNumber;

-(int) status;

-(void) resetHurtTime;
-(void) setMomentIdx:(int)_momentIdx;
-(void) setIdNumber:(int)_idNumber;
-(void) setStatus:(int) _status;
-(void) setX:(int)_x;
-(void) setY:(int)_y;
-(void) setExternalOffsetFinalXALL:(float)_ex;
-(void) setExternalOffsetFinalX:(float)_ex;
-(void) setExternalOffsetFinalY:(float)_ey;
-(void) setRotation:(float)_rotation;
-(void) setGravity:(bool)_gravity;

-(void) setWholeScale:(float)_wholeScale;

-(void) manageNormalInMovement;
-(void) manageMovement;
-(void) manage:(ccTime) dt;
-(void) mainManage:(ccTime) dt;
-(void) manageSpike;
-(void) manageBombAni;
-(void) checkAndRunAni;

-(void) turtleOut;
-(void) turtleIn;
-(void) turtleWink;
-(void) turtleIdle;
-(void) turtleInFromBombing_BackToOri;
-(void) turtleInFromBombing_BombOffScreen;
-(void) turtleInFromBombing_BombOffScreenWithGravity;
-(void) turtleShake;
-(void) turtleFlying;

-(void) endWink;
-(void) endIdle;

-(void) setFacingRight:(bool)_isRight;

-(void) setShellLevel:(int)_shellLevel;


-(void) setColor:(int)_color;
-(void) setToBombing;
-(void) setToBombingForMiniGame03;
-(void) setBombOutType:(int)_bombOutType;
-(void) bombOutOffScreenDirection:(int)_bomOutOffScreenDirection;


-(void) tap;
-(void) tap2;
-(void) tap3;
-(void) bombButLoseCombo;

-(void) checkIfLostComboWhenTurtleIn;

-(void) shotFromCannonAtX:(float)_x y:(float)_y force:(float)_force angle:(float)_angle;

-(void) collisionOnWall;

-(void) changeToBombShell;
-(void) changeToNormalShell;

-(void) setYellowHurt;
-(void) manageYellowHurt;

//-(void) manageTurtleIn13;

@end
