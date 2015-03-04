//
//  Mini103.h
//  TurtlesHuh
//
//  Created by apple on 12/11/5.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "MiniBasic.h"

@interface Mini103 : MiniBasic <UIAccelerometerDelegate>{
    int howmanyShells;
    int howmanyShellsTapped;
    int performaceGot;
    int gameType[20];  //0 static, 1 move, 2 swing
    int generalGameType;  
    int assignedLocationX[20];
    int assignedLocationY[20];
    float assignedVX[20];
    float assignedVY[20];
    float assignedVR[20];
    float assignedR[20];
    bool hasAssigned[20];
    int assignedType[20];
    int assignedShellType[20];
    
    float assigned_angelVelocityRatio;
    float assigned_angelVelocityMin;
    float assigned_minAngle;
    float assigned_maxAngle;
    
    int shellGenIdx;
    int maxShell;
    CCSprite* s_shell[20];
    int shellHasTappedInThisRound[20];
    
    int circleIdx;
    float circleOriX;
    float circleOriY;
    CCSprite* s_circle[2];
    float circle_x[2];
    float circle_y[2];
    bool circle_isLeaving[2];
    bool circle_isEnterning[2];
    int circle_leavingEnteringTimer[2];
    CCSprite* s_line[20];
    int shell_attach[20];
    
    int lineLength;
    
    bool shell_isAni[20];
    float shell_angle[20];
    float shell_angleVelocity[20];
    float shell_angleAcceleration[20];
    float shell_angleAccelerationRatio[20];
    float shell_weight[20]; //weighter faster
    float shell_x[20];
    float shell_y[20];
    float shell_vx[20];
    float shell_vy[20];
    float shell_preY[20];
    int shell_type[20];
    
    float prevTappedLocationX;
    float prevTappedLocationY;
    
    int shell_sizeType[20];
    float shell_scale[20];
    float shell_oriScale[20];
    int shell_detectLeftrightLegnth[20];
    int shell_detectRadius1[20];
    int shell_detectRadius2[20];
    
    bool thisShellIsTapped[20];
    float tapped_line_x[20];
    float tapped_line_y[20];
    float tapped_line_vx[20];
    float tapped_line_vy[20];
    float tapped_line_r[20];
    float tapped_line_vr[20];
  
    float detectTurtleRadius;
    
    bool bombMusicIsPlayed;
    
    //use for correct ani
    bool isCorrect;
    bool isCorrectWrongAni;
    int correctWrongAniTimer;
    CCSprite* s_correct;
    float plusTimeX;
    float plusTimeY;
    float plusTimeSX;
    float plusTimeSY;
    float plusTimeOpacity;
    float gameover_scale;
    float gameover_opacity;
    
    bool round_hasTapped;
    int round_hasTappedTimer;
    bool round_hasTappedFirst;
    
    CCSprite* s_bulletTarget;
    float bulletTarget_x;
    float bulletTarget_y;
    float acceX;
    float acceY;
    float prevX;
    float prevY;
    
    
    float generalCharacterScale;
    bool hasGen;
    int hasGenTimer;
    
    int ranTypeTimer;
    
    float script_ufo2MinV;
}

-(void) initOthers;
-(void) initShells;
-(void) manageShell;
-(void) manageCircleMovement;
-(void) genScript;

-(void) setCircleLeavingEntering;

-(void) runCorrectWrongAni;

-(void) thisSHellBeingTapped:(int)_shellIdx afterBomb:(bool)_afterBomb;
-(void) thisSHellBeingTappedFUCKFUCKFUCKFUCKFUCK:(int)_shellIdx;

-(void) manageTapped;

-(void) fuckAllRemainShells;

-(void) detectWhichShellBombed;

-(void) detectWin;
-(void) fuckToWIn;
-(void) fuckToLose;
-(void) bombAllShellsOutScreen;

@end
