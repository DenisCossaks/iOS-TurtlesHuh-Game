//
//  ControlLayer.m
//  TurtlesHuh
//
//  Created by  on 2012/5/19.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "cocos2d.h"

typedef enum{
	kControlBtnClick_Group1_1 = 0,
    kControlBtnClick_Group1_2,
    kControlBtnClick_Group1_3,
    kControlBtnClick_Group1_4,
    kControlBtnClick_Nth,
}eControlBtnClick;

typedef struct sBtnControlValue{
	bool isApplyingGroup1_1;
	bool isApplyingGroup1_2;
	bool isApplyingGroup1_3;
	bool isApplyingGroup1_4;
}eBtnControlValue;
eBtnControlValue* btnControlValue;

@interface ControlLayer : CCLayer{
    CCSprite* s_group1_1;
    CCSprite* s_group1_2;
    CCSprite* s_group1_3;
    CCSprite* s_group1_4;
    
    CGRect	s_group1_1_rect[2];
	CGRect	s_group1_2_rect[2];
    CGRect	s_group1_3_rect[2];
    CGRect	s_group1_4_rect[2];
    
    bool isClickingGroup1_1;
    bool isClickingGroup1_2;
    bool isClickingGroup1_3;
    bool isClickingGroup1_4;
    
    eControlBtnClick controlBtnClick;
	eControlBtnClick controlBtnClick2;
    
    CGPoint locationPrev1;
	CGPoint locationPrev2;
	UITouch* touch1;
	UITouch* touch2;
    
    int detect_group1Left[4];
    int detect_group1Right[4];
    int detect_group1Up[4];
    int detect_group1Down[4];
    int detect_group1GeneralUp;
    
    id delegate;
    
    int fingerHolding;
    
    
    bool MAIN_isChangingBtn;
    int MAIN_changingBtnTimer;
    bool MAIN_hasChangedBtn;
    float MAIN_decreaseY;
    float MAIN_increaseY;
}

-(void) setDelegate:(id) _delegate;

//-(void) manage;

-(void) clickToStop;

-(void) initControl;
-(void) initDetectPos;

-(void) group1_1BtnClick;
-(void) group1_2BtnClick;
-(void) group1_3BtnClick;
-(void) group1_4BtnClick;

-(void) group1_1BtnClick2;
-(void) group1_2BtnClick2;
-(void) group1_3BtnClick2;
-(void) group1_4BtnClick2;

-(void) group1_1BtnRelease;
-(void) group1_2BtnRelease;
-(void) group1_3BtnRelease;
-(void) group1_4BtnRelease;

-(void) group1_1BtnRelease2;
-(void) group1_2BtnRelease2;
-(void) group1_3BtnRelease2;
-(void) group1_4BtnRelease2;

-(void) MAIN_setChangingBtn;
-(void) MAIN_setHasChangedBtn;
-(void) MAIN_manageChanging;

@end
