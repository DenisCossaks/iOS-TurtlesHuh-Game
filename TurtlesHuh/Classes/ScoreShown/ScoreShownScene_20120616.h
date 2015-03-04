//
//  ScoreShownScene.h
//  TurtlesHuh
//
//  Created by  on 2012/5/21.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "AchivementPopup.h"

typedef enum{
    kGrade_F = 0,
    kGrade_E,
    kGrade_D,
    kGrade_C,
    kGrade_B,
    kGrade_A,
    kGrade_S,
    kGrade_SS,
}eGrade;

typedef struct sTurtleCoinAniStruct2{
	CCSprite* s_graphic[10];
    float posX[10];
    float posY[10];
    float vx[10];
    float vy[10];
    float rv[10];
    float opacity[10];
    float ov[10];
    int aniTimer;
    bool isAni;
    int numElements;
}eTurtleCoinAniStruct2;


@interface ScoreShownScene : CCLayer {
     eTurtleCoinAniStruct2* turtleCoinAniStruct;
    eTurtleCoinAniStruct2* turtleCoinAniStructForReward;
    float turtleCoinForReward_X;
     float turtleCoinForReward_Y;
    
    float score;
    int grade;
    
    int displayScore;
    int displayGrade;
    
    int bestScore;
    int bestGrade;
    
    CCLabelAtlas* l_score;
    CCLabelAtlas* l_turtleTapped;
    CCLabelAtlas* l_combo;
    CCLabelAtlas* l_bestScore;
    CCLabelAtlas* l_bestGrade;
    CCLabelAtlas* l_totalCoin;
    
    CCLabelAtlas* l_multiplier_FirstDigit;
    CCLabelAtlas* l_multiplier_SecondDigit;
    CCSprite* l_multiplier_Dot;
    
    CCSprite* s_gradeBadge;
    CCSprite* s_badge_letter[7];
    int badge_letterIdx;
    int badge_prevousLetterIdx;
    bool isChangingBadgeGrade;
    int chaningBadeGradeTimer;
    float badge_x;
    float badge_y;
    float badge_startX;
    float badge_scale;
    float badge_previousLetterScale;
    float badge_letterScale;
    float badge_previousLetterOpacity;
    
    
    AchivementPopup* achivementPopup;
    int achivementSelectIdx;  //actual achivement idx
    int generalAchviementPosIdx; //pos from 0 - 11
    int achivementIdx[4];
    CCSprite* s_icon[4];  
    CCSprite* s_icon_bg[4];  
    float iconPosX[4];
    float iconPosY;
    
    CCSprite* s_gradeBar_left;
    CCSprite* s_gradeBar_center;
    CCSprite* s_gradeBar_highlight;
    float gradeBarMaxPercentage;
    float gradeBarPercentage;
    float gradeBarDisplayPercentage;
    
    float scoreLimitToGrade[10];
    
    int numTapped;
    float multipier;
    int multipier_FirstDigit;
    int multipier_SecondDigit;
    
    int finalTurtleCoin;
    int displayTurtleCoin;
    
    bool startUpdatingDigits;
    int isGoingToUpdateDigitsTimer;
    int finalUpdateTimer;
    
    float detectChangeGradebarPercentage;
    
    bool isRunning;
    bool hasClickedToStop;
    
    bool isPoppingUp;
    
    int howmanyAchivement;
    
    bool achivementHasUnblocked[4];
    bool achivementHasUnblockedBeforeFuckingLongTimeAgo[4];
    int howmanyCompletedWillBeShown;
    int showCompletedIdx[4];
    int showCompletedIdxReferToPositionIdx[4];
    
    bool isShowingCompleted;
    int showCompletedCurrentIdx;
    int showCompletedCurrentTimer;
   
    bool hasGainedAchivementCoin;
    
     int save_bestScore;
     int save_coins;
    int save_unblockAchivementIdx[4];
    int save_unblockCurrentIdx;
}

-(void) initHowmanyCompletedWIllBeShown;
-(void) initTurtleCoinAniStruct;
-(void) initMenu;
-(void) initGradeBar;
-(void) initLetters;
-(void) initGradeBadge;
-(void) initAchivements;
-(void) initAchivementPopup;
-(void) showAchivementPopup;

-(void) getMultiplier;
-(void) getValuesFromDB;
-(void) getScoreAndGrade;

-(void) saveToDB;

-(void) updateGradeBar;
-(void) updateScoreAndCoin;
-(void) updateLetters;
-(void) udpateBadge;

-(void) manageShowCompletedAchivement;

-(void) setTurtleCoinAni;
-(void) turtleCoinAniManage;

-(void) setTurtleCoinAniForReward;
-(void) turtleCoinAniManageForReward;
-(void) setCoinAniForRewardAtX:(float)_x Y:(float)_y;
-(void) gainAchivementCoin;


-(void) clickToStop;
-(void) clickToStopCompleted;

-(void) showNextPopup;

-(bool) checkToShowThisAchivementToBeUnlboked:(int)_achivementIdx;

@end
