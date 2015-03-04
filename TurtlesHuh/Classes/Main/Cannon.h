//
//  Cannon.h
//  TurtlesHuh
//
//  Created by  on 2012/5/23.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

typedef enum{
    kCannonStatus_Idle = 0,
    kCannonStatus_Shooting,
}eCannonStatus;

typedef enum{
    kCannonPart_Back = 0,
    kCannonPart_Body,
    kCannonPart_Front,
    kCannonPart_Wood,
}eCannonPart;

@interface Cannon : CCNode {
    CCSprite* s_Cannon_Back;
    CCSprite* s_Cannon_Body;
    CCSprite* s_Cannon_Front;
    CCSprite* s_Cannon_Wood;
    
    float cannon_Back_x;
    float cannon_Body_x;
    float cannon_Front_x;
    float cannon_Wood_x;
    float cannon_Back_y;
    float cannon_Body_y;
    float cannon_Front_y;
    float cannon_Wood_y;
    
    float cannon_X;
    float cannon_Y;
    
    int cannon_aniTime;
    bool cannon_isAni;
    int cannon_status;
    
    id delegate;
    
    
    float oriRadius_Body[10];
    float oriRadius_Back[10];
    float oriRadius_Front[10];
    //float oriRadius_Wood;
    
    float oriAngle_Body;
    float oriAngle_Back;
    float oriAngle_Front;
    //float oriAngle_Wood;
    
    float rotateDegreeAngle;
    
    int idNumber;
    
    bool MAIN_SHOOT;
    bool MAIN_SHOOTSHOOT;
    int MAIN_TIMER;
    int MAIN_STARTSHOOTTIMER;
    float MAIN_PRESHOOTSPEED;
}

-(void) setIdNumber:(int)_idNumber;
-(void) initOriValues;

-(void) setDelegate:(id)_delegate;

-(void) setX:(int)_x;
-(void) setY:(int)_y;

-(float) x;
-(float) y;
-(float) cannonFrontX;
-(float) cannonFrontY;

//-(void) initCannon;

-(void) setCannonStatus:(int)_cannonStatus;
-(void) manage;

-(void) setRotateDegree:(float)_angle;

-(void) setReverse;

-(void) setMAINPRESHOOTSPEED:(float)_speed;
-(void) setMAINSTARTSHOOTTIMER:(int)_startTimer;
-(void) MAIN_SETSHOOT;
-(void) manageMAIN;

@end
