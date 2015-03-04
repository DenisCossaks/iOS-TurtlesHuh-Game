//
//  Mini101.h
//  TurtlesHuh
//
//  Created by apple on 12/10/29.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "MiniBasic.h"
#import "Turtle.h"

@interface Mini101 : MiniBasic {
    int totalTurtleShell;
    int shellIdx;
   // int scriptLevel;
    int thisLevelTimer;
    int genScriptTimer;
    CCSprite* turtleShell[50];
    float turtleShellX[50];
    float turtleShellY[50];
    float turtleShellVX[50];
    float turtleShellVY[50];
    float turtleShellVR[50];
    float turtleShellAR[50];
    float turtleShellRotation[50];
    float turtleDiffX[50];
    bool turtleShellIsAni[50];
    int turtleShellDetectIdx[50];
    bool turtleShellIsColliding[50];
    int turtleShellCollidingTimer[50];
    int turtleType[50];
    int turtleShellLevel[50];
    int turtleShellOriLevel[50];
    int turtleShellAppearTime[50];
    int turtleShellHasTapTimer[50];
    bool turtleShellHasTapped[50];
    bool turtleShellCanbeDestroyed[50];
    int seaLevel;
    int howmanyShellInThisLevel;
    int howmanyTurtleIsDestroyedInThisLevel;
    int howmanyTaps;
    
    CCSprite* s_sea;
  
    
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

    
    float seaOffestX;
    float seaOffsestFinalX;
    
    
    bool isTapTurtleShell[50];
    
    float generalTurtleDetectOffset;
    float shellRadiusDetect;
    
    
     float fuxkTurtleAtX;
     float fuxkTurtleAtY;
     float fuxkDistanceDiffX;
     float fuxkDistanceDiffY;
     float fuxkDistanceDiff;
    
    
    float thisCharacterScale[50];
    float generalCharacterScale[50];
    int hasGenTimer[50];
    
    bool isTapping;
    int tapIdxsStore[50];
    float tapDiffXStore[50];
    int tapIdx;
    
    
}

-(void) resetTap;
-(void) resetThisTurtleShell:(int)_shellIdx;

-(void) genScript;
-(void) setScript;
-(void) runScript;
-(void) nextShellIdx;
-(void) setTurtleTexture:(int)_shellIdx;

-(void) initCharacters;
-(void) initExtraGraphics;
-(void) initBubbles;

-(void) manageBubbles;
-(void) manageTurtlePhysics;
-(void) manageCollisions;
-(void) manageGneralCharacter;

-(void) tapTurtleShell:(int)_idx fuckDiffX:(float)_fuckDiffX;
-(void) REALtapTurtleShell:(int)_idx fuckDiffX:(float)_fuckDiffX;
-(void) collisionOn:(int)_obj0Idx obj1:(int)_obj1Idx;



@end
