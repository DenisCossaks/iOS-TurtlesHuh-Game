//
//  MainTurtleEquipments.h
//  TurtlesHuh
//
//  Created by  on 2012/6/17.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

/*typedef enum{
    kEquip_Rocket = 0,
    kEquip_Line,
    kEquip_Glide,
    kEquip_Rope,
}eEquip;*/

typedef struct sRocket{
    CCSprite* s_rockect;
    float x;
    float y;

	CCSprite* s_smoke[100];
    float smoke_X[100];
    float smoke_Y[100];
    float smoke_VX[100];
    float smoke_VY[100];
    float smoke_Scale[100];
    float smoke_Opacity[100];
    bool smoke_isAni[100];
    
    int maxSmoke;
    int smokeIdx;
}eRocket;


@interface MainTurtleEquipments : CCNode {
    CCSprite* s_glide;
    CCSprite* s_line;
    CCSprite* s_rope;
    CCSprite* s_helmet;
     CCSprite* s_fire;
    
    int fireAniTimer;
    int fireAniIdx;
    eRocket* rocket;
    
    bool isOpenningGlide;
    bool hasOpennedGlide;
    int openningGlideTimer;
    float glideOpenning_r;
    float glideOpenning_sx;
    float glideOpenning_sy;
    
    float rocketToTurtleOffsetX;
    float rocketToTurtleOffsetY;
    float smokeToRocketOffsetX;
    float smokeToRocketOffsetY;
    
    float glide1ToTurtleOffsetX;
    float glide1ToTurtleOffsetY;
    float glide2ToTurtleOffsetX;
    float glide2ToTurtleOffsetY;
    
    float ropeToTurtleOffsetX;
    float ropeToTurtleOffsetY;
    
    float superFuxkAngleDiff;
    float superFuxkOriX;
    float superFuxkOriY;
    float superFuxkCalX;
    float superFuxkCalY;
    
    float ani_Rocket_x;
    float ani_Rocket_y;
    float ani_Glide_x;
    float ani_Glide_y;
    float ani_Rope_x;
    float ani_Rope_y;
    float ani_Helmet_x;
    float ani_Helmet_y;
    float ani_Line_x;
    float ani_Line_y;
    float ani_Fire_x;
    float ani_Fire_y;
    
    float ani_Rocket_r;
    float ani_Glide_r;
    float ani_Rope_r;
    float ani_Helmet_r;
    float ani_Line_r;
    float ani_Fire_r;
    
    bool hasAppliedFuelOnce;
    
    bool isTurtleColliding;
    int turtleCollidingTimer;
    
    float collide_Rocket_r;
    float collide_Glide_r;
    float collide_Rope_r;
    float collide_Helmet_r;
    float collide_Line_r;
    
    float collide_Rocket_vx;
    float collide_Glide_vx;
    float collide_Rope_vx;
    float collide_Helmet_vx;
    float collide_Line_vx;
    
    float collide_Rocket_vy;
    float collide_Glide_vy;
    float collide_Rope_vy;
    float collide_Helmet_vy;
    float collide_Line_vy;
    
    float collide_Rocket_vr;
    float collide_Glide_vr;
    float collide_Rope_vr;
    float collide_Helmet_vr;
    float collide_Line_vr;
    
    float helmetLevel_offsetX;
    float helmetLevel_offsetY;
    float rocketLevel_offsetX;
    float rocketLevel_offsetY;
    float gliderLevel_offsetX;
    float gliderLevel_offsetY;
    
    
    //NEW
    int fireToRocketOffset;
}

-(void) initOffsets;
-(void) initEquipments;
-(void) initRocket;

-(void) genOneRocketSmoke:(bool)_isLarge;
-(void) genOnePenguinSmokeAtX:(float)_x Y:(float)_y;

-(void) manage;
-(void) manageRocket;
-(void) managePos;
-(void) manageRocketAni;
-(void) manageFire;
-(void) manageTurtleColliding;

-(void) setTurtleCollide;

@end
