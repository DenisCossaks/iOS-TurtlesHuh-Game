//
//  Mini13.h
//  TurtlesHuh
//
//  Created by  on 2012/6/10.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Penguin.h"
#import "Turtle.h"
#import "MiniBasic.h"

@interface Mini13 : MiniBasic {
    Penguin* penguin;
    Turtle* turtle[10];
    bool thisTurtleIsBombShell[10];
    bool thisTurtleHasBeenFuckedByPenguin[10];
    int actualShellIdx[10];
    int virtualShellIdx[10];
    int acutalShellGenIdx;
    int maxTurtle;
    int lastBombShellIdx;
    int lastShellIdx;
    float shellOffsetX;
    //int turtleIdx;
    
    int maxScriptShell;
    int scriptShellApply[20];
    int scriptShellGenIdx;
    int scriptShellApplying;   //the last script shell
    int scriptShellDetectingIdx; // the fisrt script shell
    int scriptRatio[4]; //0 remain same , 1 increase 1, 2 increase 2, 3 random
    int scriptPreApply;
    

    CCSprite* s_LeftLeft;
    CCSprite* s_Left;
    CCSprite* s_RightRight;
    CCSprite* s_Right;
    
    CCSprite* s_sea[2];
    float seaOffset;
    int seaCurrentIdx;
    int seaNextIdx;
    float seaOffsetXCal;
    float seaRatio;
    float seaPosX[2];
    
    
    CCSprite* s_bg2[2];
    float bgOffset;
    int bgCurrentIdx;
    int bgNextIdx;
    float bgOffsetXCal;
    float bgRatio;
    float bgPosX[2];
    
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
    
    
    float shellPosX[10];
    float shellPosY;
    
    int currentStandShell;
    
    bool hasNext;
    bool isGoingToNext;
    
    
    int shellGoingToMoment[10];
    int shellLevelGoingToMoment[10];
    
    int shell_Check[6];
    
    bool isTappingLeft;
    
    
    bool isPenguinJumping;
    int isPenguinJumpingTimer;
    float wholeBgOffsetX;
    float wholeBgOffsetXCal;
    
    
    float turtleOriX[10];
    float turtleOriY[10];
    
    int penguinJump_maxStep;
    int penguinJump_currentStep;
    int penguinJump_finalStep;
    int penguinJump_howmanyStep;
    float penguinJump_jumpY;
    float penguinJump_oriY;
    
    CCSprite* s_comboBar_Icon;
    CCSprite* s_comboBar_Bar;
    CCSprite* s_comboBar_BarLifeLeft;
    CCSprite* s_comboBar_BarLife;
    float comboBar_posX;
    float comboBar_posY;
    float comboBar_BarLifeLength;
    float comboRemainPercentage;
    
    
    int bombombombIdx;
    
    bool isBeingAttack;
    int beingAttackTimer;
    
    bool isResetPenguin;
    int resetPenguinTimer;
    bool resetPenguinIsOnOpacity;
    int restPenguinOnOffOpacityTimer;
    int restPenguinOnOffOpacityInterval;
    
    bool goingToNextJump;
    int goingToNextJump_whichPower;
    
    
    CCSprite* s_jumpNotice;
    CCSprite* s_jumpTurtle;
    bool jumpNoticeDisappearing;
    float jumpNoticeOpacity;

}

-(void) setExternalValues:(float)_offsetFinalX;

-(void) initCharacters;
-(void) initExtraGraphics;
-(void) initBubbles;
-(void) initPowerBar;

-(void) manageBg;
-(void) manageBubbles;

-(void) gotoNextJump;

-(void) tapTurtle;

-(void) runTurtleAI;

-(void) giveNextMoment222:(int)_whichShell;

-(void) setPenguinJumping;
-(void) managePenguinJumping;
-(void) tapTurtleDelay;

-(void) bombTurtleByThisBombShell:(int)_shellIdx;

-(void) initScript;
-(void) genNextScript;

-(void) updatePowerBar;

-(void) bombombomb;
-(void) managePenguinDieing;

-(void) manageResetPenguin;
-(void) resetPenguin;

-(void) manageJumpNotice;
-(void) fuckfuck;

@end
