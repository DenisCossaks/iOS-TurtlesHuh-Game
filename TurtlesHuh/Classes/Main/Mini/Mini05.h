//
//  Mini05.h
//  TurtlesHuh
//
//  Created by  on 2012/5/15.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "MiniBasic.h"
#import "Turtle.h"
#import "Penguin.h"
#import "Cannon.h"



typedef enum{
    kBtnColor_Brown = 0,
    kBtnColor_Red,
    kBtnColor_Green,
    kBtnColor_Blue,
}eBtnColor;


@interface Mini05 : MiniBasic {
    Turtle* turtle[12];
    Penguin* penguin;
    
    int maxTurtle;
    int turtleIdx;
    
    float shellPosX[12];
    float shellPosY[12];
    float shellFixPosX[12];
    float shellFixPosY;
    int shellToFixIdx[12];
    float shellColor[12];
    
    float shellMovingSpeed;
    
    /*CCSprite* s_Cannon_Back;
    CCSprite* s_Cannon_Body;
    CCSprite* s_Cannon_Front;
    CCSprite* s_Cannon_Wood;
    
    float cannon_X;
    float cannon_Y;
    
    int cannon_aniTime;
    bool cannon_isAni;
    int cannon_status;*/
    Cannon* cannon;
    
    
    CCSprite* s_Cannon_Ball[8];
    int maxCannonBall;
    float cannonBall_X[8];
    float cannonBall_Y[8];
    bool cannonBall_isAni[8];
    int cannonBall_Timer[8];
    int cannonBallIdx;
    
    bool isPrepareShooting;
    int prepareShootingColor;
    
    int ranShellLevel;
    
    bool isAniWrong;
    int wrongTimer;
    
    float wrongScale;
    
    int SecondLevelShellAppearRatio;
    int ranSecondShellRatio;
    
    float fuckAngle;
    
    CCSprite* s_shadow_cannon;
    CCSprite* s_shadow_penguin;
}

-(void) setShellColor:(int)_shellIdx;

-(void) initShadows;
-(void) initCharacters;
-(void) initCannon;
-(void) initCannonBalls;
-(void) initShellPos;
-(void) initShellColors;


-(void) manageCannonBalls;
-(void) manageShells;
-(void) manageWrong;

-(void) tapButton:(int)_btnColor;
-(void) shootCannon:(int)_cannonColor;
-(void) setCannonBallTexture:(int)_cannonColor;

-(void) rearrageShellPos;


@end
