//
//  SelectMissionGameScene.h
//  TurtlesHuh
//
//  Created by apple on 12/10/29.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Global.h"

@interface SelectMissionGameScene : CCLayer {
  
    
    int idx;
    
    CCSprite* s_content[maxTotalMissionGameChosen];

    
    CCSprite* s_transition;
    int transitionTimer;
    bool isTransitioning;
    bool isTraitionDisappearing;
    float transitionOpacity;
    float transitionGain;
    
    float scoreLimitToGrade[10];
    
    int selectPosX;
    int selectPosY;
    int selectOffsetX;
    CCSprite* s_selectOff[maxTotalMiniChosen];
    CCSprite* s_selectOn;

    
    
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

@end
