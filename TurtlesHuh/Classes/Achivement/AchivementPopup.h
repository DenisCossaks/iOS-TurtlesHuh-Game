//
//  AchivementPopup.h
//  TurtlesHuh
//
//  Created by  on 2012/5/21.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

extern const char * const aaa;

@interface AchivementPopup : CCLayer {
   // CCSpriteBatchNode* ss_Achievement;
    char *bbb;
    
   
    CCSprite* s_detailsDialog;
    CCSprite* s_detailsDiaogArrow;
    CCSprite* s_icon;  
  //  CCSprite* s_icon_bg;  
    
    int maxSentenseWord;
    CCSprite* l_achvementIdx[2];
    CCSprite* l_detailsDialog_sentense01[60];
    CCSprite* l_detailsDialog_sentense02[60];
    //CCLabelAtlas* l_achvementIdx;
   // CCLabelAtlas* l_detailsDialog_sentense01;
   // CCLabelAtlas* l_detailsDialog_sentense02;
    
    CCSpriteBatchNode* ss_Font01;
    CCSpriteBatchNode* ss_Font02;
    
    bool isShowingCompleted;
    
    float posX;
    float posY;
    int detailDialogArrow_X;
    
    bool isShowingDetails;
    
    id delegate;
    int achivementIdx;
    
    CCLayer* s_blackLayer;
    
    NSMutableString* string_setense01;
    NSMutableString* string_setense02;
    NSMutableString* string_achivementIdx;
    
    
    int maxRewardDigit;
    CCSprite* s_reward;
    CCLabelAtlas* l_rewordNumber;
    
    
    
    
    CCSprite* s_completed_Dialog[4];
    CCSprite* s_completed_icon[4];  
    //CCSprite* s_completed_icon_bg[4]; 
    CCSprite* s_completed_reward[4];
    CCLabelAtlas* l_completed_rewordNumber[4];
    int showCompleteReferToAchivementIdx[4];
    int showCompleteTimer[4];
    bool isShowingComplete[4];
    float showingCompleteX[4];
    float showingCompleteY[4];
    float showingCompleteScale[4];
    float showingCompleteOpacity[4];
    bool showingCompleteIsDisappearing[4];
    int showingCompleteIdx;
    
    float showingComplete_RewardOpacity[4];
    float showingComplete_RewardScale[4];
    float showingComplete_OffsetY[4];
    float showingComplete_R[4];
    float showingComplete_VR[4];
    float showingComplete_RewardToHellOriX[4];
    float showingComplete_RewardToHellOriY[4];
    float showingComplete_RewardToHellDiffX[4];
    float showingComplete_RewardToHellDiffY[4];
    int showingComplete_RewardToHellTimer[4];
    bool showingComplete_RewardIsGoingToHell[4];
    
    bool hasPlayedTurtleCoinSound;
    bool hasPlayedAcivementSound;
}

-(void) initCompleteDialog;
-(void) initDialog;
-(void) initLetters;
-(void) initIcons;
-(void) initReward;

-(void) setDelegate:(id)_delegate;
-(void) setX:(int)_x;
-(void) setY:(int)_y;
-(void) setDialogString;

-(void) popupAchivementCompleted:(int)_achivementIdx posX:(float)_x posY:(float)_y;
-(void) popupAchivementDetails:(int)_achivementIdx arrowIsUp:(bool)isUp arrowX:(int)_arrowX;

-(void) checkToShowReward;

-(void) removePopup;
-(void) removeIconBeforePopAother;

-(void) manageComplete;
-(void) manageCompleteV2;
-(void) setDisappearComplete;


@end
