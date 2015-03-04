//
//  MiniBasic.h
//  BombTheTurtle
//
//  Created by  on 2012/4/13.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "ControlLayer.h"

@interface MiniBasic : CCLayer {
    CCSprite* s_bg;
    
    int recentMomentIdx;
    int maxMoment;
    float momentRunTime[10];  //moment time initially set < 0, means no mement recently. no need fucking check
    int momentTarget[10];  //for mini game 01, 04  ->which turtle
    
    float momentOverTime[10];
    bool hasNoticedOverTime[10];
    
    float nextMomentAppearTime;
    float newestMomentHasAppearedTime;
    
    int numberTapToNextRound;
    int remainTapToNextRound;
    
    bool isFuxking;
    
    ControlLayer* controlLayer;
    
    float comboReduceSpeedAccum;
    float comboReduceSpeedAccumSpeed;
    
    float finalTimeRemain;

    
   // bool isFuckingShootFirstTime;
    
    
   // bool isTapWronglyAndDisableBtns;
   // int tapWronglyAndDisableBtnsTimer;
    
}

-(void) initAchivementIdx;

-(void) initControlLayer;
-(void) initComboColorLimit;
-(void) initMoments;
-(void) initCharacters;
-(void) manage:(ccTime) dt;

-(void) finishOneRound;

-(void) manageMini04Type:(ccTime) dt;

-(void) giveNextMoment;
//-(void) finishOneMoment;

-(void) thisMomentOverTime:(int)_momentIdx;


-(void) getScript;

-(void) turtleBombed:(int)_momentIdx;

-(void) tapWrongly;

-(void) updateGameLevel;

-(void) comboLost;

-(void) thisTurtleIsBombOutOffScreen:(int)_turtleIdx;

-(void) btnIsTappedInControlLayer:(int)_btnIdx;
-(void) btnIsReleasedInControlLayer:(int)_btnIdx;

-(void) restart;

-(void) cannonShootBall:(int)_fromId;

-(void) reInitColorComboLimit;

-(void) beforeLoseComboWhenComboRemainGoesToZero;

-(void) fuckfuck;

@end
