//
//  Mini10.h
//  TurtlesHuh
//
//  Created by  on 2012/5/26.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "MiniBasic.h"

#import "Penguin.h"
#import "Turtle.h"

@interface Mini10 : MiniBasic {
     Penguin* penguin;
    
    int columnStartX;
    int columnOffsetX;
    int maxColumn;
    int columnX[8];
    int columnY;
    int columnIdx;
    int prevColumnIdx;
    
    bool is2ndFucking;
    
   
    int restingTimer;
    bool isTargeting[8];
    
     bool isAttacking;
    int attackingTimer;
    
    bool isMinesweepering;
    int minesweeperTimer;
    int nextGenMinesweeperTime;
    
    bool canMinesweeper;
    bool isMinesweeper[8];
    bool isMinesweeperActiveForHurt[8];
    bool isMinesweeperIsDisappearing[8];
    int isMinesweeperTimer[8];
    int isMineseeperCanAppearingTime[8];
    int isMinesweeperMaxAppearningTime;
    
    float shellX[8];
    float shellY[8];
    bool shellIsExploding[8];
    //CCSprite* s_shell[8];
    Turtle* turtle[8];
    CCSprite* s_arrow[8];
    CCSprite* s_minesweeper[8];
    CCSprite* s_floor[6];
    
    float arrowOpacity[8];
    float shellScaleY[8];
    float shellScaleX[8];
    
    float mineSweeperScale[8];
    float mineSweeperX[8];
    float mineSweeperY[8];
    
    int restEndTime;
    float shellSpeed;
    int shellAttackTime;
    //int arrowInterval;
    //int arrowFirstInterval;
    float arrowScaleVX;
    float arrowVY;
    float arrowVO;
    float shellNumberAppearRatio[8];
    
    bool arrowIsOnOpacity[8];
    int arrowOnOffOpacityTimer[8];
    int arrowOnOffOpacityInterval[8];
    
    bool canBeGainCombo;
    
    bool isBeingAttack;
    int beingAttackTimer;
    
    bool isResetPenguin;
    int resetPenguinTimer;
    bool resetPenguinIsOnOpacity;
    int restPenguinOnOffOpacityTimer;
    int restPenguinOnOffOpacityInterval;
    
    int numShellsGen;
    int howmanyMinesweeperOnScreen;
    int maxHowmanyMinesweeperOnScreen;
    bool isTapTwoStep;
    
    int fuckOffsetJumpForIpad;
    
}

-(void) initColumnPos;
-(void) initFloors;
-(void) initCharacters;
-(void) initLevelsAndItems;

-(void) gotoNextJump;
-(void) gotoNextDelayOneStep;

-(void) checkIfOutBoundary;
-(void) checkToGiveNextMinesweeper;

-(void) genNextAttack;
-(void) genNextMinesweeper:(int)_howmany;

-(void) manageAI;
-(void) maangeAttacking;
-(void) manageMinesweepering;
-(void) manageResetPenguin;

-(void) bombombomb;

-(void) resetPenguin;

-(void) bombOutAllMinesweeper;

@end
