//
//  Mini04.h
//  TurtlesHuh
//
//  Created by  on 2012/4/29.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "MiniBasic.h"
#import "Turtle.h"
#import "Penguin.h"

@interface Mini04 : MiniBasic {
    Turtle* turtle[6];
    Penguin* penguin;
    
    CCSprite* s_sea;
    CCSprite* s_LeftLeft;
    CCSprite* s_Left;
    CCSprite* s_RightRight;
    CCSprite* s_Right;
    
    CCSprite* s_Bubble[15];
    int bubble_Timer[15];
    bool bubble_isAni[15];
    float bubble_x[15];
    float bubble_y[15];
    float bubble_vy[15];
    float bubble_Opacity[15];
    int maxBubbles;
    int bubbleAppearedTimer;
    int currentBubbleAppear;
    
    
    float shellPosX[6];
    float shellPosY;
    
    int currentStandShell;
    
    bool hasNext;
    bool isGoingToNext;
    
    float seaOffestX;
    float seaOffsestFinalX;
    
    int shellGoingToMoment[6];
    int shellLevelGoingToMoment[6];
    
     int shell_Check[6];
    
}

-(void) setExternalValues:(float)_offsetFinalX;

-(void) initCharacters;
-(void) initExtraGraphics;
-(void) initBubbles;

-(void) manageBubbles;

-(void) manageRemainTapToNextStep;

-(void) gotoNextJump;
-(void) gotoNextDelayOneStep;

-(void) tapTurtle;

-(void) runTurtleAI;

-(int)genNextTargetMoment:(int)_shellStandPosition shellLevel:(int)_shellLevel NS1:(int)_NS1 NS2:(int)_NS2 NS3:(int)_NS3 NS4:(int)_NS4 NS5:(int)_NS5 NS6:(int)_NS6;


@end
