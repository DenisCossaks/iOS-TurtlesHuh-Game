//
//  Mini01.h
//  BombTheTurtle
//
//  Created by  on 2012/4/13.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "MiniBasic.h"
#import "Turtle.h"
#import "Penguin.h"

typedef struct sGeneralMini02Character{
	int idxR;
    int whichType; // 0 for turtle, 1 for penguin
    float posX;
    float posY;
    float vx;
    float vy;
    float r;
    float vr;
    bool isAni;
    bool isLarging;
    
    int ufoType;
    int ufoInteveral;
    int ufoIntervalTimer;
    float ufoVx;
    float ufoVy;
    float ufoSpeed;
    int ufoIdx;
}eGeneralMini02Character;

@interface Mini02 : MiniBasic {
    eGeneralMini02Character* generalMini02Character[60];
    int generalCharacterIdx;
    int maxGeneralCharacter;
    
    float generalCharacterScale;
    
    Turtle* turtle[30];
    Penguin* penguin[30]; 
    
    int maxTurtle;
    int maxPenguin;
    
    int turtleIdx;
    int penguinIdx;
    
    
    int howmanyTurtleOnScreen;
    int howmanyPenguinOnScreen;
    
    bool hasGen;
    int hasGenTimer;
    int genNextTimer;
    
    
    
    bool isAllowLarging;
    int isAllowLargingTimer;
    
    bool isLarging;
    int isLargingTimer;
    float isLargingScale;
    bool generalCharacterIsLarging[60];
    
    int sperateSpace;
    
    CCSprite* s_ufo1[20];
     CCSprite* s_ufo2[20];
     CCSprite* s_ufo3[20];
    int ufoTypeAppearRatio[3];
    int ufo1Idx;
    int ufo2Idx;
    int ufo3Idx;
    int maxUfoInOneType;
    
    
    CCSprite* s_digits[4][2];
    int digits[4];
    int maxDigitNumber;
    int digit_textureX;
    int digit_textureY;
    int digit_textureWidth;
    int digit_textureHeight;
    int digit_posX[4];
    int digit_posY[4];
    int correctAnswer;
    int correctAnswerIdx;

    //int howmanyUFOGen;  equals to howmanyTurtleOnScreen
    int script_howmanyUFOGenMin;
    int script_howmanyUFOGenRatio;
    
    int script_digitLowerLimit;
    int script_digitUpperLimit;
    int script_lowerUpperOffsetRatio;
    
    float script_ufo2MinV;
    float script_ufo2VxInterval;
    float script_ufo2VyInterval;
    float script_ufo2VRInterval;
    
    int script_ufo3IntervalTime;
    int script_ufo3SpeendRatio;
    float script_ufo3MinSpeed;
    
    CCSprite* s_correct;
    CCSprite* s_wrong;
    bool isCorrect;
    bool isCorrectWrongAni;
    int correctWrongAniTimer;
    
    //use for correct ani
    float plusTimeX;
    float plusTimeY;
    float plusTimeSX;
    float plusTimeSY;
    float plusTimeOpacity;
     float gameover_scale;
    float gameover_opacity;
    
    CCSprite* s_tempWrongNotice;
    float wrongNoticeOpacity;
    int tapWhich;

}

-(void) initCharacters;
-(void) initGeneralCharacter;

-(void) initGenNext;
-(void) initLarging;
-(void) initPanel;
-(void) initCorrectWrong;

//-(void) manage;
-(void) manageGenNext;
-(void) manageGneralCharacter;
-(void) manageIsLarging;

-(void) genNext;
-(void) genDigits;
-(void) genIsLarging;

-(void) genOneGeneralCharacter:(int)_whichType;

-(void) tap:(int)_which;

-(void) correct;
-(void) wrong;
-(void) runCorrectWrongAni;

-(void) prepareNextGen;

@end
