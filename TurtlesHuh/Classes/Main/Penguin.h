//
//  Penguin.h
//  TurtlesHuh
//
//  Created by  on 2012/4/29.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

typedef enum{
    kPenguinPart_BackLeg = 0,
    kPenguinPart_Body,
    kPenguinPart_Wing,
    kPenguinPart_Eye,
    kPenguinPart_Mouth,
    kPenguinPart_FrontLeg,
}ePenguinPart;

typedef enum{
    kPenguinJump_jumpTo1TurtleShell = 0,
    kPenguinJump_jumpTo2TurtleShell,
    kPenguinJump_jumpToDYNAMICTurtleShell,
}ePenguinJump;

typedef enum{
    kPenguinAniStatus_Idle = 0,
    kPenguinAniStatus_Jumping,
    kPenguinAniStatus_JumpingWithGravity,
    kPenguinAniStatus_Bombing,
}ePenguinAniStatus;

typedef enum{
    kBombOutOffScreenDirection_Left_Penguin = 0,
    kBombOutOffScreenDirection_Right_Penguin,
}eBombOutOffScreenDirectionPenguin;

@interface Penguin : CCNode {
     ePenguinAniStatus status;
    ePenguinJump jumpType;
    
    bool isJumping;
    int jumpingTimer;
    
    int idNumber;

    float x;
    float y;
    float jumpXLengthInterval;
    //float jumpY_vy;
    //float jumpY_ay;
    float jumpY_extraY;
    float jumpY_maxY;
    float jumpY_angleInterval;
    float jumpY_angle;
    
    CCSprite* s_Body;
    CCSprite* s_Eye;
    CCSprite* s_FrontLeg;
    CCSprite* s_BackLeg;
    CCSprite* s_Mouth;
    CCSprite* s_Wing;
    
    float body_x;
    float eye_x;
    float frontLeg_x;
    float backLeg_x;
    float mouth_x;
    float wing_x;
    
    float body_y;
    float eye_y;
    float frontLeg_y;
    float backLeg_y;
    float mouth_y;
    float wing_y;
    
    int aniStep;
    int aniStep2;
    int jumpingAniStep;
    
    bool isFacingRight;
    bool temp_isFast;
    
   // int next_jumpType;
    //bool next_isFacingRight;
   // bool next_hasNext;
    
    id delegate;
    
    float idle_x[6];
    float idle_y[6];
    float idle_r[6];
    float idle_sx[6];
    float idle_sy[6];
    
    float externalOffsetX;
    float externalOffsetY;
    float externalOffsetX2;
    float externalOffsetY2;
    float externalOffsetFinalX;
    float externalOffsetFinalY;
    
     eBombOutOffScreenDirectionPenguin bombOutOffScreenDirection;
     int bombAniStep;
    
    
    float bomb_force;
    float bomb_x;
    float bomb_y;
    float bomb_vx;
    float bomb_vy;
    float bomb_oriVy;
    float bomb_ay;
    bool bomb_isRotatingClockrise;
    float bomb_vr;

    float turtleRotation;
    
    float superFuxkAngleDiff;
    float superFuxkOriX;
    float superFuxkOriY;

    bool isNotInGame;
    
    float penguinScale;
    
    bool MAIN_ISCOLLIDING;
    

    float MAIN_COLLIDE_EYE_X;
    float MAIN_COLLIDE_EYE_Y;
    float MAIN_COLLIDE_WING_X;
    float MAIN_COLLIDE_WING_Y;
    float MAIN_COLLIDE_EYE_R;
    float MAIN_COLLIDE_WING_R;

    float MAIN_COLLIDE_EYE_VX;
    float MAIN_COLLIDE_EYE_VY;
    float MAIN_COLLIDE_WING_VX;
    float MAIN_COLLIDE_WING_VY;
    float MAIN_COLLIDE_EYE_VR;
    float MAIN_COLLIDE_WING_VR;

}

-(void) setDelegate:(id)_delegate;
-(void) setIDNumber:(int)_number;

-(int) jumpingAniStep;
-(int) status;
-(float)x;
-(float)y;
-(float)jumpingX;
-(bool) facingRight;

-(void) setPenguinScale:(float)_scale;
-(void) setOpacity:(int)_opacity;
-(void) setStatus:(int) _status;
-(void) setX:(int)_x;
-(void) setY:(int)_y;
-(void) setR:(float)_r;
-(void) setIsNotInGame:(bool)_notInGame;

-(void) setExternalOffsetFinalXALL:(float)_ex;
-(void) setExternalOffsetFinalX:(float)_ex;
-(void) setExternalOffsetFinalY:(float)_ey;

-(void) setToBombing;
-(void) bombOutOffScreenDirection:(int)_bomOutOffScreenDirection;
-(void) BombOffScreen;


-(void) setJump:(int)_jump;
-(void) setJumpWithGravity;

-(void) manage;
-(void) checkAndRunAni;

-(void) penguinJump;
-(void) penguinJumpWithGravity;
-(void) penguinJumpForMain;

-(void) setFacingRight:(bool)_isRight;

-(void) tempSetFast:(bool)_isFast;

-(bool) setNext:(int)_jumpType isFacingRight:(bool)_isFacingRight;

//-(void) gotoNextDelayOneStep;

-(void) setOutside;

-(void) setMAINX:(int)_x;
-(void) setMAINY:(int)_y;
-(void) setMAINR:(float)_r;
-(void) MAINMANAGE;
-(void) SETMAINISCOLLDING:(bool)_isColliding;


@end
