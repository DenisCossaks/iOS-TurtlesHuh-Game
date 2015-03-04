//
//  MainBgLayer.h
//  TurtlesHuh
//
//  Created by  on 2012/6/17.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

typedef enum{
    kItemType_money10 = 0,
    kItemType_money20,
    kItemType_money30,
    kItemType_money40,
}eItemType;

typedef struct sFloorSnow{
    int howmany;
    int idx;
    int genIdx;
    CCSprite* s_snow[50];
    float x[50];
    float y[50];
    float vx[50];
    float vy[50];
    float screenX[50];
    float screenY[50];
    bool isAni[50];
}eFloorSnow;

@interface MainBgLayer : CCNode {
    eFloorSnow* floorSnow;
    
    CCSprite* s_staticBg;
    CCSprite* s_staticBg2;
    float staticBg2_Opacity;
    
    CCSprite* s_floor[4];
    float floor_Offset;
    int floor_CurrentIdx;
    int floor_NextIdx;
    float floor_OffsetXCal;
    float floor_Ratio;
    float floor_RatioY;
    float floor_Y;
    float floor_ScreenY;
    
    
    CCSprite* floorItemLayer_s_snowman[2];
    CCSprite* floorItemLayer_s_igno[2];
    float floorItemLayer_Offset;
    int floorItemLayer_CurrentIdx;
    int floorItemLayer_NextIdx;
    float floorItemLayer_OffsetXCal;
    float floorItemLayer_OffsetYCal;
    float floorItemLayer_Ratio;
    float floorItemLayer_RatioY;
    float floorItemLayer_Y;
    float floorItemLayer_ScreenY;
    
    
    CCSprite* hillLayer_s_hill01[2];
    CCSprite* hillLayer_s_hill02[2];
    float hillLayer_Offset;
    int hillLayer_CurrentIdx;
    int hillLayer_NextIdx;
    float hillLayer_OffsetXCal;
    float hillLayer_OffsetYCal;
    float hillLayer_Ratio;
    float hillLayer_RatioY;
    float hillLayer_Y;
    float hillLayer_ScreenY;
    
    CCSprite* behindHillLayer_s_hill01[4];
    float behindHillLayer_Offset;
    int behindHillLayer_CurrentIdx;
    int behindHillLayer_NextIdx;
    float behindHillLayer_OffsetXCal;
    float behindHillLayer_OffsetYCal;
    float behindHillLayer_Ratio;
    float behindHillLayer_RatioY;
    float behindHillLayer_Y;
    float behindHillLayer_ScreenY;
    
//CCSprite* tempBg;
    
    
    int maxCloud;
    int cloudIdx;
    int maxCloudsOnScreen;
    int cloudsOnScreen;
    CCSprite* s_cloud[50];
    float cloud_X[50];
    float cloud_Y[50];
    bool cloud_isAni[50];
    int manageCloudTimer;
    
   // float characterIsFacingDirection;
    float cloudIsFacingDirectionAccordingToCharterVelocity;
    
    
    //ITEM
    int maxItem;
    int itemType[50];
    int itemIdx;
    int maxItemOnScreen;
    int itemOnScreen;
    CCSprite* s_item[50];
    float item_X[50];
    float item_Y[50];
    bool itemisAni[50];
    int manageItemTimer;
    int itemAppearRatio[10];
}

-(void) initFloorSnow;
-(void) initBg;
-(void) initFloor;
-(void) initClouds;
-(void) initItems;
-(void) initHillLayer;
-(void) initBehineHillLayer;
-(void) initFloorItemHillLayer;

-(void) manage;
-(void) manageStaticBg;
-(void) manageClouds;
-(void) manageItems;
-(void) manageFloor;
-(void) manageHill;
-(void) manageBehineHill;
-(void) manageFloorItem;
-(void) maangeFloorSnow;

-(void) newMethodToDetectGenItems;
-(void) newMethodToDetectGenCloud;
-(void) genOneCloud;

-(void) detectThisItemCollision:(int)_itemIdx;
-(void) getThisItem:(int)_itemIdx;

//-(void) updateLevel;

-(void) genFloorSnow;

@end
