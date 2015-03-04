//
//  SelectMiniGameScene2.h
//  TurtlesHuh
//
//  Created by  on 2012/8/15.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Global.h"
#import "AchivementPopup.h"


@interface SelectMiniGameScene2 : CCLayer {
    CCLabelAtlas* l_minigame;
    
    CCLabelAtlas* l_grade;
    CCLabelAtlas* l_score;
    
    CCSprite* acivementIcon[5];
    CCSprite* s_content[maxTotalMiniChosen];
    CCSprite* s_block;
    
    int idx;
    
    int blockStartIdx;
    
    int selectPosX;
    int selectPosY;
    int selectOffsetX;
    CCSprite* s_selectOff[maxTotalMiniChosen];
    CCSprite* s_selectOn;
    
    
    
    
    AchivementPopup* achivementPopup;
    int achivementSelectIdx;  //actual achivement idx
    int generalAchviementPosIdx; //pos from 0 - 11
    int achivementIdx[5];
    CCSprite* s_icon[maxAchivements];  
    //CCSprite* s_icon_bg[maxAchivements];  
    float iconPosX[5];
    float iconPosY;
    
    
    CCSprite* s_transition;
    int transitionTimer;
    bool isTransitioning;
    bool isTraitionDisappearing;
    float transitionOpacity;
    float transitionGain;
    
    float scoreLimitToGrade[10];
    
    
    
    CCMenu* menu;
    
    bool isPoppingUp;
    bool isShowingInstruction;
    
    CCSprite* s_instruction;
    CCSprite* s_dot;
    

}

+(CCScene *) scene;

-(void) initInstruction;
-(void) showInstruction;
-(void) removeInstruction;

-(void) initLabels;

-(void) initMenu;
-(void) initContent;

-(void) updateDisplay;

-(void) initTransition;
-(void) manageTransition;

-(void) initAchivements;
-(void) initAchivementPopup;

-(void) showAchivementPopup;
-(void) removePopup;

@end
