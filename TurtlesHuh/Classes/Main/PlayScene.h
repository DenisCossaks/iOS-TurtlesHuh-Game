//
//  PlayScene.h
//  BombTheTurtle
//
//  Created by  on 2012/4/13.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "UILayer.h"
#import "MiniBasic.h"
#import "BombScript.h"
#import "BombScript2.h"

/*typedef struct sBombingAniStruct{
	CCSprite* s_buum;
    CCSprite* s_blick;
    CCSprite* s_wave;
    CCSprite* s_debris[3];
    CCSprite* s_bigClouds[8];
    CCSprite* s_smallClouds[5];
    
    int aniTimer;
    bool isAni;
    bool isAniCombo;
    bool isAniShake; 
    bool isAniPlusTime;
    bool isAniCannon;
    bool isAniGameover;
    
    float aniX;
    float aniY;
    
}eBombingAniStruct;*/

@interface PlayScene : CCLayer {
   // UILayer* uILayer;
    
   /* eBombingAniStruct* bombingAniStruct[7];
    int bombingAniMax;
    int bombingAniIdx;*/
    

    MiniBasic* miniGame;
    
    int gameoverTimer;
    float gameover_scale;
    bool hasGameover;
    
    BombScript* bombScript;
    BombScript2* bombScript2;
    
    int gameoverBombTimer;
    
    /*int readyTimer;
    float readyBlacklayerOpacity;
    CCSprite* s_ready;
    float readyX;
    float readyY;
    float readyScale;*/
    
    
    int palyTimer;
    
    CCSprite* finishOne_colorLayer;
    float finishOne_colorLayerOpacity;
    CCSprite* s_transition;
    int transitionTimer;
    bool isTransitioning;
    float transitionOpacity;
    float transitionGain;
    
}

+(CCScene *) scene;

-(void) initTransition;

-(void) initBombScripts;

-(void) afterGameOver;

-(void) gameover;
-(void) ready;

-(void) initUI;
-(void) initMiniGame;
-(void) initBomobingAni;
-(void) initMenu;
-(void) initReady;

-(void) setToReady;


-(void) setToBombing:(float)_turtleX turtleY:(float)_turtleY;
-(void) setToShakingBomb:(float)_turtleX turtleY:(float)_turtleY;
-(void) setToBombingCannon:(float)_x y:(float)_y;
-(void) setToBombingCombo;
-(void) setToBombingTimePlus:(float)_x y:(float)_y;
-(void) setToBombingGameover;
-(void) setComboExtraValues;
-(void) setToBombingGameoverWithPos:(int)_x y:(int)_y;

-(void) manageBombGameoverAni;

/*-(void) manageBombAni;
-(void) manageBombComboAni;
-(void) manageBombShakeAni;
-(void) managePlusTimeAni;
-(void) manageBombCannonAni;
-(void) manageBombGameoverAni;*/

//-(void) showMenu;

-(void) gotoRestart;

-(void) initInstruction;
-(void) showInstruction;
-(void) removeInstruction;

@end
