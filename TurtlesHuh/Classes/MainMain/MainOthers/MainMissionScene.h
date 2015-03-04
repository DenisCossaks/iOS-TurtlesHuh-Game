//
//  MainMissionScene.h
//  TurtlesHuh
//
//  Created by  on 2012/6/29.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Global.h"
#import "MainMissionCheck.h"

typedef struct sMissionStruct{
    int pirce;
    int missionPrice;
    int mission;
    //int missionIdx;
    
    CCSprite* s_col;
    CCSprite* s_icon;
    
    int firstSetencePosX[60];
   // int firstSetencePosY[60];
    int secondSetencePosX[60];
   // int secondSetencePosY[60];
    
    CCSprite* l_firstSentence[60];
    CCSprite* l_secondSentense[60];
    CCSprite* l_skipPrice[7];
    CCSprite* l_missionPrice[7];
    int firstSentenseLength;
    int sencondSentenseLength;
    int priceSetenseLength;
    int missionPriceSetenseLength;
    
    float x;
    float y;
    float vx;
    float ax;
    
    bool isWinning;
    bool isNexting;
    int isAniTimer;
}eMissionStruct;

typedef struct sTurtleCoinAniStruct3{
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
}eTurtleCoinAniStruct3;

@interface MainMissionScene : CCLayer {
   // CCSprite* s_mission[maxMissions];
   // int missionPrice[maxMissions];
    
    MainMissionCheck* mainMissionCheck;
    
    CCMenu* skipMenu;
    CCMenuItem* skipBtn[6];
    
    CCSprite* missionStruct_s_icon[88];
    
    
    int maxWordsInSkip;
    int maxWordsInSentense;
    float fixColumnX[maxMissionsShowForOneTime];
    float fixColumnY[maxMissionsShowForOneTime];
    
    eMissionStruct* missionStruct[6];
    
    bool isWinning[maxMissionsShowForOneTime];
    bool isFinishedThisMissionColumn[maxMissionsShowForOneTime];
    int nextShownMission[maxMissionsShowForOneTime];
    bool hasSwitchedCol[maxMissionsShowForOneTime];
    
    bool isPlayingWinMissionAni;
    int playingWinMissionAniTImer;
    
    bool isShowingNextMissionAni;
    int showingNextMissionTimer;
    
     CCSpriteBatchNode* ss_Font01;
    CCSpriteBatchNode* ss_Font03;
    
     int sentense01_AccumOffset;
     int setense01_offsetX;
     int startToFuckIdx;
     int fontTexture_numInRow;
     int fontTexture_offsetX;
     int fontTexture_offsetY;
     int fontTexture_startX;
     int fontTexture_howmanyCol;
    int fontTexture_chosenRow;
    int fontTexture_chosenCol;

    
    bool isWinFinal;
    

    CCSprite* s_bar_bottom;
    CCSprite* s_bar_top_left;
    CCSprite* s_bar_top_right;
    CCSprite* s_bar_top_center;
    CCSprite* s_bar_missionCompleted;
    CCSprite* l_missionCompleted[2];
    CCSprite* l_totalMission[2];
    float barX;
    float barY;
    
    NSMutableString* fuckString;
    NSMutableString* fuckfuckString; 
    NSMutableString* turtleCoinString;
    CCSprite* s_turtleCoin;
    int totalPrice;
    CCSprite* l_coin[10];
    int maxCoinWords;
    
    bool isCheckCol[maxMissionsShowForOneTime];
    
    
    eTurtleCoinAniStruct3* turtleCoinAniStruct[3];
    bool isPrepareWinForThisCol[3];
    bool isPreareWinAni;
    int prepareWInTimer;
    CCSprite* s_prepareWin_tick[3];
    float prepareWin_tick_Rotation;
    float prepareWin_tick_Scale;
    
    int beginningRestingTimer;
    
    
    CCSprite* s_transition;
    int transitionTimer;
    bool isTransitioning;
    float transitionOpacity;
    float transitionGain;
    
    bool canDisplayExtra;
    
    CCSprite* s_final_bg;
    CCMenu* m_final;
    CCLabelAtlas* l_final_ball;
    bool isDisplayingFinal;
    bool canDisplayFinalBtn;
    
    CCSprite* s_dot;
}

+(CCScene *) scene;

-(void) initFinal;
-(void) showFinal;
-(void) removeFinal;

-(void) getValues;
-(void) initMenu;
-(void) initMissionStructs;
-(void) initMissionSentense;
-(void) initFixColumnPos;
-(void) initMissionBar;
-(void) initTurtleCoins;
-(void) initTransition;

-(void) checkToShowNextMissions;
-(void) checkIfWInMissions;
-(void) winForThisColumn:(int)_column;

-(void) manageAni;
-(void) managePrepareWinAni;

-(int) getSkipPrice:(int)_missionIdx;
-(int) getMissionPrice:(int)_missionIdx;

-(void) getMissionSentense:(int)_missionIdx;

-(void) updateAll;
-(void) updateTurtleCoinsDisplay;
-(void) updateCols;
-(void) updateMissionBar;

-(void) setTurtleCoinAni:(int)_i;
-(void) turtleCoinAniManage;
-(void) initTurtleCoinAniStruct;

@end
