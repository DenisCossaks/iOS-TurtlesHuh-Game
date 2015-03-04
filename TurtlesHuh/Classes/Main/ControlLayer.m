#import "ControlLayer.h"
#import "GamePlayGlobal.h"
#import "Global.h"

@implementation ControlLayer

-(void) setDelegate:(id) _delegate{
    delegate = _delegate;
}

-(void) initDetectPos{
    
    if(isPlayingMiniGame){
        if(currentChosenMiniGame == 102){
            detect_group1GeneralUp = 110;
            detect_group1Left[0] = 0;
            detect_group1Right[0] = 84;
            detect_group1Left[1] = 84000;
            detect_group1Right[1] = 175000;
            detect_group1Left[2] = 30000;
            detect_group1Right[2] = 39600;
            detect_group1Left[3] = 396;
            detect_group1Right[3] = 482;
            
            if(isIphone5){
                detect_group1Left[3] += 88;
                detect_group1Right[3] += 88;
            }
        }
        
        if(currentChosenMiniGame == 4 || currentChosenMiniGame == 10){
            detect_group1GeneralUp = 110;
            detect_group1Left[0] = 0;
            detect_group1Right[0] = 84;
            detect_group1Left[1] = 84;
            detect_group1Right[1] = 175;
            detect_group1Left[2] = 300;
            detect_group1Right[2] = 396;
            detect_group1Left[3] = 396;
            detect_group1Right[3] = 482;
            
            if(isIphone5){
                detect_group1Left[2] += 88;
                detect_group1Right[2] += 88;
                detect_group1Left[3] += 88;
                detect_group1Right[3] += 88;
            }
            
            if(isIpad){
                detect_group1GeneralUp *= 2;
                
                detect_group1Left[0] *= 1024.0/480.0;
                detect_group1Right[0] *= 1024.0/480.0;
                detect_group1Left[1] *= 1024.0/480.0;
                detect_group1Right[1] *= 1024.0/480.0;
                detect_group1Left[2] *= 1024.0/480.0;
                detect_group1Right[2] *= 1024.0/480.0;
                detect_group1Left[3] *= 1024.0/480.0;
                detect_group1Right[3] *= 1024.0/480.0;
            }
            
        }
        
        if(currentChosenMiniGame == 11 || currentChosenMiniGame == 7){
            detect_group1GeneralUp = 90;
            detect_group1Left[0] = 0;
            detect_group1Right[0] = 84;
            detect_group1Left[1] = 8400;
            detect_group1Right[1] = 175;
            detect_group1Left[2] = 30000;
            detect_group1Right[2] = 396;
            detect_group1Left[3] = 396;
            detect_group1Right[3] = 482;
            
            if(isIphone5){
                detect_group1Left[3] += 88;
                detect_group1Right[3] += 88;
            }
            
            if(isIpad){
                detect_group1GeneralUp *= 2;
                
                detect_group1Left[0] *= 1024.0/480.0;
                detect_group1Right[0] *= 1024.0/480.0;
                detect_group1Left[1] *= 1024.0/480.0;
                detect_group1Right[1] *= 1024.0/480.0;
                detect_group1Left[2] *= 1024.0/480.0;
                detect_group1Right[2] *= 1024.0/480.0;
                detect_group1Left[3] *= 1024.0/480.0;
                detect_group1Right[3] *= 1024.0/480.0;
            }
        }
        
        if(currentChosenMiniGame == 13){
            detect_group1GeneralUp = 130;
            detect_group1Left[0] = 99999;
            detect_group1Right[0] = 84;
            detect_group1Left[1] = 0;
            detect_group1Right[1] = 100;
            detect_group1Left[2] = 380;
            detect_group1Right[2] = 482;
            detect_group1Left[3] = 999999;
            detect_group1Right[3] = 75;
            
            if(isIphone5){
                detect_group1Left[2] += 88;
                detect_group1Right[2] += 88;
            }
            
            if(isIpad){
                detect_group1GeneralUp *= 2;
                
                detect_group1Left[0] *= 1024.0/480.0;
                detect_group1Right[0] *= 1024.0/480.0;
                detect_group1Left[1] *= 1024.0/480.0;
                detect_group1Right[1] *= 1024.0/480.0;
                detect_group1Left[2] *= 1024.0/480.0;
                detect_group1Right[2] *= 1024.0/480.0;
                detect_group1Left[3] *= 1024.0/480.0;
                detect_group1Right[3] *= 1024.0/480.0;
            }

        }
        
        if(currentChosenMiniGame == 5){
            detect_group1GeneralUp = 84;
            detect_group1Left[0] = 189;
            detect_group1Right[0] = 267;
            detect_group1Left[1] = 267;
            detect_group1Right[1] = 344;
            detect_group1Left[2] = 344;
            detect_group1Right[2] = 421;
            detect_group1Left[3] = 421;
            detect_group1Right[3] = 481;
            
            if(isIphone5){
                detect_group1Left[0] += 88;
                detect_group1Right[0] += 88;
                detect_group1Left[1] += 88;
                detect_group1Right[1] += 88;
                detect_group1Left[2] += 88;
                detect_group1Right[2] += 88;
                detect_group1Left[3] += 88;
                detect_group1Right[3] += 88;
            }
            
            if(isIpad){
                detect_group1GeneralUp *= 2;
                detect_group1Left[0] *= 1024.0/480.0;
                detect_group1Right[0] *= 1024.0/480.0;
                detect_group1Left[1] *= 1024.0/480.0;
                detect_group1Right[1] *= 1024.0/480.0;
                detect_group1Left[2] *= 1024.0/480.0;
                detect_group1Right[2] *= 1024.0/480.0;
                detect_group1Left[3] *= 1024.0/480.0;
                detect_group1Right[3] *= 1024.0/480.0;
            }

        }
        
    }else{
        detect_group1GeneralUp = 130;
        detect_group1Left[0] = 380;
        detect_group1Right[0] = 482;
        detect_group1Left[1] = 999999;
        detect_group1Right[1] = 84;
        detect_group1Left[2] = 999999;
        detect_group1Right[2] = 482;
        detect_group1Left[3] = 999999;
        detect_group1Right[3] = 75;
        
        if(isIphone5){
            detect_group1Left[0] += 88;
            detect_group1Right[0] += 88;
            detect_group1Left[1] += 88;
            detect_group1Right[1] += 88;
            detect_group1Left[2] += 88;
            detect_group1Right[2] += 88;
            detect_group1Left[3] += 88;
            detect_group1Right[3] += 88;
        }
        
        if(isIpad){
            detect_group1GeneralUp *= 2;
            
            detect_group1Left[0] *= 1024.0/480.0;
            detect_group1Right[0] *= 1024.0/480.0;
            detect_group1Left[1] *= 1024.0/480.0;
            detect_group1Right[1] *= 1024.0/480.0;
            detect_group1Left[2] *= 1024.0/480.0;
            detect_group1Right[2] *= 1024.0/480.0;
            detect_group1Left[3] *= 1024.0/480.0;
            detect_group1Right[3] *= 1024.0/480.0;
        }

    }
    
    
}

-(void) MAIN_manageChanging{
    if(MAIN_isChangingBtn){
        
        MAIN_decreaseY += (-120 - MAIN_decreaseY)/5.0;
        MAIN_increaseY += (38 * 768.0/320.0 - MAIN_increaseY)/5.0;
        
        [s_group1_1 setPosition:ccp(s_group1_1.position.x, MAIN_decreaseY)];
        
      //  [s_group1_2 setPosition:ccp(s_group1_2.position.x, MAIN_increaseY)];
        [s_group1_3 setPosition:ccp(s_group1_3.position.x, MAIN_increaseY)];
        
        MAIN_changingBtnTimer++;
        if(MAIN_changingBtnTimer == 50){
            
            [s_group1_1 setPosition:ccp(s_group1_1.position.x, -9999)];
            
            //[s_group1_2 setPosition:ccp(s_group1_2.position.x, 38)];
            [s_group1_3 setPosition:ccp(s_group1_3.position.x, 38 * 768.0/320.0)];

            
            MAIN_isChangingBtn = false;
           // [self MAIN_setHasChangedBtn];
        }
    }
}

-(void) MAIN_setChangingBtn{
    MAIN_changingBtnTimer = 0;
    MAIN_isChangingBtn = true;
    
    MAIN_decreaseY = s_group1_1.position.y;
    MAIN_increaseY = s_group1_2.position.y;
    
    [self MAIN_setHasChangedBtn];
}

-(void) MAIN_setHasChangedBtn{
    MAIN_hasChangedBtn = true;
    
    detect_group1Left[0] = 9999999;
    detect_group1Right[0] = 84;
    detect_group1Left[1] = 0;
    detect_group1Right[1] = 84;
    detect_group1Left[2] = 380;
    detect_group1Right[2] = 482;
    
    if(isIphone5){
        detect_group1Left[2] = 380 + 88;
        detect_group1Right[2] = 482 + 88;
    }
    
    if(isIpad){
        detect_group1Left[2] = 380 * 1024.0/480.0;
        detect_group1Right[2] = 482 * 1024.0/480.0;
    }
    
    //DELETE
    detect_group1Left[1] = 0;
    detect_group1Right[1] = 84;
    detect_group1Left[3] = 84;
    detect_group1Right[3] = 170;
    
    if(isIpad){
        detect_group1Left[1] = 0 * 1024.0/480.0;
        detect_group1Right[1] = 84 * 1024.0/480.0;
        detect_group1Left[3] = 84 * 1024.0/480.0;
        detect_group1Right[3] = 170 * 1024.0/480.0;
    }
}

-(id) init
{
	if( ! [super init] )
		return nil;
    
    
    controlBtnClick = kControlBtnClick_Nth;
    
    MAIN_isChangingBtn = false;
    MAIN_hasChangedBtn = false;
    
	self.isTouchEnabled = YES;
    
	btnControlValue = malloc(sizeof(eBtnControlValue));
    
	btnControlValue->isApplyingGroup1_1 = false;
	btnControlValue->isApplyingGroup1_2 = false;
	btnControlValue->isApplyingGroup1_3 = false;
	btnControlValue->isApplyingGroup1_4 = false;
    
	
	isClickingGroup1_1 = false;
	isClickingGroup1_2 = false;
	isClickingGroup1_3 = false;
	isClickingGroup1_4 = false;
    
	
	locationPrev1 = ccp(1000,1000);
	locationPrev2 = ccp(1000,1000);
	
	[self initControl];
    [self initDetectPos];
	
	return self;
}

-(void) initControl{
    // printf("initControlinitControl\n");
    if(!isPlayingMiniGame){
        //  printf("iniControl\n");
        
        s_group1_1_rect[0] = CGRectMake(1114/textureRatioForFuckingIpad,1614/textureRatioForFuckingIpad,138/textureRatioForFuckingIpad,128/textureRatioForFuckingIpad);
        s_group1_2_rect[0] = CGRectMake(1666/textureRatioForFuckingIpad - 1112/textureRatioForFuckingIpad,0/textureRatioForFuckingIpad,138/textureRatioForFuckingIpad,128/textureRatioForFuckingIpad);
        s_group1_3_rect[0] = CGRectMake(1666/textureRatioForFuckingIpad - 1112/textureRatioForFuckingIpad,0/textureRatioForFuckingIpad,138/textureRatioForFuckingIpad,128/textureRatioForFuckingIpad);
        s_group1_4_rect[0] = CGRectMake(0/textureRatioForFuckingIpad,0/textureRatioForFuckingIpad,149/textureRatioForFuckingIpad,121/textureRatioForFuckingIpad);
        
        
        s_group1_1_rect[1] = CGRectMake(1264/textureRatioForFuckingIpad,1614/textureRatioForFuckingIpad,138/textureRatioForFuckingIpad,128/textureRatioForFuckingIpad);
        s_group1_2_rect[1] = CGRectMake(1806/textureRatioForFuckingIpad - 1112/textureRatioForFuckingIpad,0/textureRatioForFuckingIpad,138/textureRatioForFuckingIpad,128/textureRatioForFuckingIpad);
        s_group1_3_rect[1] = CGRectMake(1806/textureRatioForFuckingIpad - 1112/textureRatioForFuckingIpad,0/textureRatioForFuckingIpad,138/textureRatioForFuckingIpad,128/textureRatioForFuckingIpad);
        s_group1_4_rect[1] = CGRectMake(0/textureRatioForFuckingIpad,1920/textureRatioForFuckingIpad,138/textureRatioForFuckingIpad,138/textureRatioForFuckingIpad);
        
        
        s_group1_1 = [CCSprite spriteWithTexture:ss_Character.texture rect:s_group1_1_rect[0]];
        s_group1_2 = [CCSprite spriteWithTexture:ss_Character.texture rect:s_group1_2_rect[0]];
        s_group1_3 = [CCSprite spriteWithTexture:ss_Character.texture rect:s_group1_3_rect[0]];
        s_group1_4 = [CCSprite spriteWithTexture:ss_Character.texture rect:s_group1_4_rect[0]];
        
        [ss_Character addChild:s_group1_1 z:kDeapth_Btns];
        [ss_Character addChild:s_group1_2 z:kDeapth_Btns];
        [ss_Character addChild:s_group1_3 z:kDeapth_Btns];
        [ss_Character addChild:s_group1_4 z:kDeapth_Btns];
        
        //  [s_group1_1 setScaleX:-1];
        
        
        [s_group1_1 setPosition:ccp(432, 38)];
        [s_group1_2 setPosition:ccp(48, -120)];
        [s_group1_3 setPosition:ccp(432, -120)];
        [s_group1_4 setPosition:ccp(99999, 38)];
        
        if(isIpad){
            [s_group1_1 setPosition:ccp(432 * 1024.0/480.0, 38 * 2)];
            [s_group1_2 setPosition:ccp(48  * 1024.0/480.0, -120)];
            [s_group1_3 setPosition:ccp(432 * 1024.0/480.0, -120)];
        }
        
        if(isIphone5){
            [s_group1_1 setPosition:ccp(432 + 88, 38)];
            [s_group1_2 setPosition:ccp(48 + 88, -120)];
            [s_group1_3 setPosition:ccp(432 + 88, -120)];
        }
        
        
        return;
    }
    
    if(currentChosenMiniGame == 102){
     //   printf("currentChosenMiniGame  == 122222222\n");
        s_group1_1_rect[0] = CGRectMake(152/textureRatioForFuckingIpad,0/textureRatioForFuckingIpad,149/textureRatioForFuckingIpad,121/textureRatioForFuckingIpad);
        s_group1_4_rect[0] = CGRectMake(152/textureRatioForFuckingIpad,0/textureRatioForFuckingIpad,149/textureRatioForFuckingIpad,121/textureRatioForFuckingIpad);
        s_group1_3_rect[0] = CGRectMake(152/textureRatioForFuckingIpad,0/textureRatioForFuckingIpad,149/textureRatioForFuckingIpad,121/textureRatioForFuckingIpad);
        s_group1_2_rect[0] = CGRectMake(0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad);
        
        s_group1_1_rect[1] = CGRectMake(152/textureRatioForFuckingIpad + 340/textureRatioForFuckingIpad,0/textureRatioForFuckingIpad,149/textureRatioForFuckingIpad,121/textureRatioForFuckingIpad);
        s_group1_4_rect[1] = CGRectMake(152/textureRatioForFuckingIpad + 340/textureRatioForFuckingIpad,0/textureRatioForFuckingIpad,149/textureRatioForFuckingIpad,121/textureRatioForFuckingIpad);
        s_group1_3_rect[1] = CGRectMake(152/textureRatioForFuckingIpad + 340/textureRatioForFuckingIpad,0/textureRatioForFuckingIpad,149/textureRatioForFuckingIpad,121/textureRatioForFuckingIpad);
        s_group1_2_rect[1] = CGRectMake(0/textureRatioForFuckingIpad + 0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad);
        
        s_group1_1 = [CCSprite spriteWithTexture:ss_Extra.texture rect:s_group1_1_rect[0]];
        s_group1_2 = [CCSprite spriteWithTexture:ss_Extra.texture rect:s_group1_2_rect[0]];
        s_group1_3 = [CCSprite spriteWithTexture:ss_Extra.texture rect:s_group1_3_rect[0]];
        s_group1_4 = [CCSprite spriteWithTexture:ss_Extra.texture rect:s_group1_4_rect[0]];
        
        [ss_Extra addChild:s_group1_1 z:kDeapth_Btns];
        [ss_Extra addChild:s_group1_2 z:kDeapth_Btns];
        [ss_Extra addChild:s_group1_3 z:kDeapth_Btns];
        [ss_Extra addChild:s_group1_4 z:kDeapth_Btns];
        
        [s_group1_1 setScaleX:-1];
        //[s_group1_2 setScaleX:-1];
    }
    
    
    if(currentChosenMiniGame == 13){
        s_group1_1_rect[0] = CGRectMake(0/textureRatioForFuckingIpad,0/textureRatioForFuckingIpad,149/textureRatioForFuckingIpad,121/textureRatioForFuckingIpad);
        s_group1_2_rect[0] = CGRectMake(0/textureRatioForFuckingIpad,0/textureRatioForFuckingIpad,149/textureRatioForFuckingIpad,121/textureRatioForFuckingIpad);
        s_group1_3_rect[0] = CGRectMake(152/textureRatioForFuckingIpad,0/textureRatioForFuckingIpad,149/textureRatioForFuckingIpad,121/textureRatioForFuckingIpad);
        s_group1_4_rect[0] = CGRectMake(99999/textureRatioForFuckingIpad,0/textureRatioForFuckingIpad,149/textureRatioForFuckingIpad,121/textureRatioForFuckingIpad);
        
        s_group1_4_rect[1] = CGRectMake(99999/textureRatioForFuckingIpad + 340/textureRatioForFuckingIpad,0/textureRatioForFuckingIpad,149/textureRatioForFuckingIpad,121/textureRatioForFuckingIpad);
        s_group1_3_rect[1] = CGRectMake(152/textureRatioForFuckingIpad + 340/textureRatioForFuckingIpad,0/textureRatioForFuckingIpad,149/textureRatioForFuckingIpad,121/textureRatioForFuckingIpad);
        s_group1_2_rect[1] = CGRectMake(0/textureRatioForFuckingIpad + 340/textureRatioForFuckingIpad,0/textureRatioForFuckingIpad,149/textureRatioForFuckingIpad,121/textureRatioForFuckingIpad);
        s_group1_1_rect[1] = CGRectMake(0/textureRatioForFuckingIpad + 340/textureRatioForFuckingIpad,0/textureRatioForFuckingIpad,149/textureRatioForFuckingIpad,121/textureRatioForFuckingIpad);
        
        s_group1_1 = [CCSprite spriteWithTexture:ss_Extra.texture rect:s_group1_1_rect[0]];
        s_group1_2 = [CCSprite spriteWithTexture:ss_Extra.texture rect:s_group1_2_rect[0]];
        s_group1_3 = [CCSprite spriteWithTexture:ss_Extra.texture rect:s_group1_3_rect[0]];
        s_group1_4 = [CCSprite spriteWithTexture:ss_Extra.texture rect:s_group1_4_rect[0]];
        
        [ss_Extra addChild:s_group1_1 z:kDeapth_Btns];
        [ss_Extra addChild:s_group1_2 z:kDeapth_Btns];
        [ss_Extra addChild:s_group1_3 z:kDeapth_Btns];
        [ss_Extra addChild:s_group1_4 z:kDeapth_Btns];
        
        [s_group1_1 setScaleX:-1];
        
    }
    
    if(currentChosenMiniGame == 4 || currentChosenMiniGame == 10){
        s_group1_1_rect[0] = CGRectMake(0/textureRatioForFuckingIpad,0/textureRatioForFuckingIpad,149/textureRatioForFuckingIpad,121/textureRatioForFuckingIpad);
        s_group1_2_rect[0] = CGRectMake(152/textureRatioForFuckingIpad,0/textureRatioForFuckingIpad,149/textureRatioForFuckingIpad,121/textureRatioForFuckingIpad);
        s_group1_3_rect[0] = CGRectMake(152/textureRatioForFuckingIpad,0/textureRatioForFuckingIpad,149/textureRatioForFuckingIpad,121/textureRatioForFuckingIpad);
        s_group1_4_rect[0] = CGRectMake(0/textureRatioForFuckingIpad,0/textureRatioForFuckingIpad,149/textureRatioForFuckingIpad,121/textureRatioForFuckingIpad);
        
        s_group1_4_rect[1] = CGRectMake(0/textureRatioForFuckingIpad + 340/textureRatioForFuckingIpad,0/textureRatioForFuckingIpad,149/textureRatioForFuckingIpad,121/textureRatioForFuckingIpad);
        s_group1_3_rect[1] = CGRectMake(152/textureRatioForFuckingIpad + 340/textureRatioForFuckingIpad,0/textureRatioForFuckingIpad,149/textureRatioForFuckingIpad,121/textureRatioForFuckingIpad);
        s_group1_2_rect[1] = CGRectMake(152/textureRatioForFuckingIpad + 340/textureRatioForFuckingIpad,0/textureRatioForFuckingIpad,149/textureRatioForFuckingIpad,121/textureRatioForFuckingIpad);
        s_group1_1_rect[1] = CGRectMake(0/textureRatioForFuckingIpad + 340/textureRatioForFuckingIpad,0/textureRatioForFuckingIpad,149/textureRatioForFuckingIpad,121/textureRatioForFuckingIpad);
        
        s_group1_1 = [CCSprite spriteWithTexture:ss_Extra.texture rect:s_group1_1_rect[0]];
        s_group1_2 = [CCSprite spriteWithTexture:ss_Extra.texture rect:s_group1_2_rect[0]];
        s_group1_3 = [CCSprite spriteWithTexture:ss_Extra.texture rect:s_group1_3_rect[0]];
        s_group1_4 = [CCSprite spriteWithTexture:ss_Extra.texture rect:s_group1_4_rect[0]];
        
        [ss_Extra addChild:s_group1_1 z:kDeapth_Btns];
        [ss_Extra addChild:s_group1_2 z:kDeapth_Btns];
        [ss_Extra addChild:s_group1_3 z:kDeapth_Btns];
        [ss_Extra addChild:s_group1_4 z:kDeapth_Btns];
        
        [s_group1_1 setScaleX:-1];
        [s_group1_2 setScaleX:-1];
    }
    
    if(currentChosenMiniGame == 11 || currentChosenMiniGame == 7){
        s_group1_1_rect[0] = CGRectMake(152/textureRatioForFuckingIpad,0/textureRatioForFuckingIpad,149/textureRatioForFuckingIpad,121/textureRatioForFuckingIpad);
        s_group1_2_rect[0] = CGRectMake(152/textureRatioForFuckingIpad,0/textureRatioForFuckingIpad,149/textureRatioForFuckingIpad,121/textureRatioForFuckingIpad);
        s_group1_3_rect[0] = CGRectMake(152/textureRatioForFuckingIpad,0/textureRatioForFuckingIpad,149/textureRatioForFuckingIpad,121/textureRatioForFuckingIpad);
        s_group1_4_rect[0] = CGRectMake(152/textureRatioForFuckingIpad,0/textureRatioForFuckingIpad,149/textureRatioForFuckingIpad,121/textureRatioForFuckingIpad);
        
        s_group1_4_rect[1] = CGRectMake(152/textureRatioForFuckingIpad + 340/textureRatioForFuckingIpad,0/textureRatioForFuckingIpad,149/textureRatioForFuckingIpad,121/textureRatioForFuckingIpad);
        s_group1_3_rect[1] = CGRectMake(152/textureRatioForFuckingIpad + 340/textureRatioForFuckingIpad,0/textureRatioForFuckingIpad,149/textureRatioForFuckingIpad,121/textureRatioForFuckingIpad);
        s_group1_2_rect[1] = CGRectMake(152/textureRatioForFuckingIpad + 340/textureRatioForFuckingIpad,0/textureRatioForFuckingIpad,149/textureRatioForFuckingIpad,121/textureRatioForFuckingIpad);
        s_group1_1_rect[1] = CGRectMake(152/textureRatioForFuckingIpad + 340/textureRatioForFuckingIpad,0/textureRatioForFuckingIpad,149/textureRatioForFuckingIpad,121/textureRatioForFuckingIpad);
        
        s_group1_1 = [CCSprite spriteWithTexture:ss_Extra.texture rect:s_group1_1_rect[0]];
        s_group1_2 = [CCSprite spriteWithTexture:ss_Extra.texture rect:s_group1_2_rect[0]];
        s_group1_3 = [CCSprite spriteWithTexture:ss_Extra.texture rect:s_group1_3_rect[0]];
        s_group1_4 = [CCSprite spriteWithTexture:ss_Extra.texture rect:s_group1_4_rect[0]];
        
        [ss_Extra addChild:s_group1_1 z:kDeapth_Btns];
        [ss_Extra addChild:s_group1_2 z:kDeapth_Btns];
        [ss_Extra addChild:s_group1_3 z:kDeapth_Btns];
        [ss_Extra addChild:s_group1_4 z:kDeapth_Btns];
        
        [s_group1_1 setScaleX:-1];
        [s_group1_2 setScaleX:-1];
    }
    
	
    if(currentChosenMiniGame == 5){
        s_group1_1_rect[0] = CGRectMake(0/textureRatioForFuckingIpad, 834/textureRatioForFuckingIpad, 136/textureRatioForFuckingIpad, 128/textureRatioForFuckingIpad);
        s_group1_2_rect[0] = CGRectMake(138/textureRatioForFuckingIpad, 834/textureRatioForFuckingIpad, 136/textureRatioForFuckingIpad, 128/textureRatioForFuckingIpad);
        s_group1_3_rect[0] = CGRectMake(278/textureRatioForFuckingIpad, 834/textureRatioForFuckingIpad, 136/textureRatioForFuckingIpad, 128/textureRatioForFuckingIpad);
        s_group1_4_rect[0] = CGRectMake(418/textureRatioForFuckingIpad, 834/textureRatioForFuckingIpad, 136/textureRatioForFuckingIpad, 128/textureRatioForFuckingIpad);
        
        s_group1_1_rect[1] = CGRectMake(0/textureRatioForFuckingIpad + 556/textureRatioForFuckingIpad, 834/textureRatioForFuckingIpad, 136/textureRatioForFuckingIpad, 128/textureRatioForFuckingIpad);
        s_group1_2_rect[1] = CGRectMake(138/textureRatioForFuckingIpad + 556/textureRatioForFuckingIpad, 834/textureRatioForFuckingIpad, 136/textureRatioForFuckingIpad, 128/textureRatioForFuckingIpad);
        s_group1_3_rect[1] = CGRectMake(278/textureRatioForFuckingIpad + 556/textureRatioForFuckingIpad, 834/textureRatioForFuckingIpad, 136/textureRatioForFuckingIpad, 128/textureRatioForFuckingIpad);
        s_group1_4_rect[1] = CGRectMake(418/textureRatioForFuckingIpad + 556/textureRatioForFuckingIpad, 834/textureRatioForFuckingIpad, 136/textureRatioForFuckingIpad, 128/textureRatioForFuckingIpad);
        
        s_group1_1 = [CCSprite spriteWithTexture:ss_Character.texture rect:s_group1_1_rect[0]];
        s_group1_2 = [CCSprite spriteWithTexture:ss_Character.texture rect:s_group1_2_rect[0]];
        s_group1_3 = [CCSprite spriteWithTexture:ss_Character.texture rect:s_group1_3_rect[0]];
        s_group1_4 = [CCSprite spriteWithTexture:ss_Character.texture rect:s_group1_4_rect[0]];
        
        [ss_Character addChild:s_group1_1 z:kDeapth_Btns];
        [ss_Character addChild:s_group1_2 z:kDeapth_Btns];
        [ss_Character addChild:s_group1_3 z:kDeapth_Btns];
        [ss_Character addChild:s_group1_4 z:kDeapth_Btns];
    }
	
    
    static int btnOffsetX;
    static int btnStartX;
    static int btnStartY;
    
    if(currentChosenMiniGame == 102){
        [s_group1_1 setPosition:ccp(48, 38)];
        [s_group1_2 setPosition:ccp(135, 38)];
        [s_group1_3 setPosition:ccp(34005, 38)];
        [s_group1_4 setPosition:ccp(432, 38)];
    }
    if(currentChosenMiniGame == 13){
        [s_group1_1 setPosition:ccp(48999, 38)];
        [s_group1_2 setPosition:ccp(48, 38)];
        [s_group1_3 setPosition:ccp(432, 38)];
        [s_group1_4 setPosition:ccp(99999, 38)];
        
        if(isIphone5){
            [s_group1_3 setPosition:ccp(432 + 88, 38)];
        }
        
        if(isIpad){
            [s_group1_1 setPosition:ccp(489999 * 1024.0/480.0, 38 * 2)];
            [s_group1_2 setPosition:ccp(48 * 1024.0/480.0, 38 * 2)];
            [s_group1_3 setPosition:ccp(432 * 1024.0/480.0, 38 * 2)];
            [s_group1_4 setPosition:ccp(99999 * 1024.0/480.0, 38 * 2)];
        }
    }
    if(currentChosenMiniGame == 4){
        [s_group1_1 setPosition:ccp(48, 38)];
        [s_group1_2 setPosition:ccp(135, 38)];
        [s_group1_3 setPosition:ccp(345, 38)];
        [s_group1_4 setPosition:ccp(432, 38)];
        
        if(isIphone5){
            [s_group1_3 setPosition:ccp(345 + 88, 38)];
            [s_group1_4 setPosition:ccp(432 + 88, 38)];
        }
        
        if(isIpad){
            [s_group1_1 setPosition:ccp(48 * 1024.0/480.0, 38 * 2)];
            [s_group1_2 setPosition:ccp(135 * 1024.0/480.0, 38 * 2)];
            [s_group1_3 setPosition:ccp(345 * 1024.0/480.0, 38 * 2)];
            [s_group1_4 setPosition:ccp(432 * 1024.0/480.0, 38 * 2)];
        }
        
    }
    if(currentChosenMiniGame == 10){
        [s_group1_1 setPosition:ccp(48, 35)];
        [s_group1_2 setPosition:ccp(135, 35)];
        [s_group1_3 setPosition:ccp(345, 35)];
        [s_group1_4 setPosition:ccp(432, 35)];
        
        if(isIphone5){
            [s_group1_3 setPosition:ccp(345 + 88, 38)];
            [s_group1_4 setPosition:ccp(432 + 88, 38)];
        }
        
        if(isIpad){
            [s_group1_1 setPosition:ccp(48 * 1024.0/480.0, 38 * 2)];
            [s_group1_2 setPosition:ccp(135 * 1024.0/480.0, 38 * 2)];
            [s_group1_3 setPosition:ccp(345 * 1024.0/480.0, 38 * 2)];
            [s_group1_4 setPosition:ccp(432 * 1024.0/480.0, 38 * 2)];
        }
        
    }
    if(currentChosenMiniGame == 11 || currentChosenMiniGame == 7){
        [s_group1_1 setPosition:ccp(48, 38)];
        [s_group1_2 setPosition:ccp(13500, 38)];
        [s_group1_3 setPosition:ccp(34500, 38)];
        [s_group1_4 setPosition:ccp(432, 38)];
        
        if(isIphone5){
            [s_group1_4 setPosition:ccp(432 + 88, 38)];
        }
        
        if(isIpad){
            [s_group1_1 setPosition:ccp(48 * 1024.0/480.0, 38 * 2)];
            [s_group1_2 setPosition:ccp(13500 * 1024.0/480.0, 38 * 2)];
            [s_group1_3 setPosition:ccp(34500 * 1024.0/480.0, 38 * 2)];
            [s_group1_4 setPosition:ccp(432 * 1024.0/480.0, 38 * 2)];
        }

    }
    
	if(currentChosenMiniGame == 5){
        btnOffsetX = 70;
        btnStartX = 199 + 136/4;
        btnStartY = 69 - 126/4;
        
        if(isIphone5){
            btnStartX += 88;
        }
        
        [s_group1_1 setPosition:ccp(btnStartX + btnOffsetX * 0, btnStartY)];
        [s_group1_2 setPosition:ccp(btnStartX + btnOffsetX * 1, btnStartY)];
        [s_group1_3 setPosition:ccp(btnStartX + btnOffsetX * 2, btnStartY)];
        [s_group1_4 setPosition:ccp(btnStartX + btnOffsetX * 3, btnStartY)];
        
        if(isIpad){
            [s_group1_1 setPosition:ccp((btnStartX + btnOffsetX * 0) * 1024.0/480.0, btnStartY * 2)];
            [s_group1_2 setPosition:ccp((btnStartX + btnOffsetX * 1) * 1024.0/480.0, btnStartY * 2)];
            [s_group1_3 setPosition:ccp((btnStartX + btnOffsetX * 2) * 1024.0/480.0, btnStartY * 2)];
            [s_group1_4 setPosition:ccp((btnStartX + btnOffsetX * 3) * 1024.0/480.0, btnStartY * 2)];
        }
        
    }
	
	
}


- (void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    // printf("ccTouchesBegan\n");
    if(currentChosenMiniGame == 13 || !isPlayingMiniGame){
        isClickingGroup1_1 = false;
        isClickingGroup1_2 = false;
        isClickingGroup1_3 = false;
        isClickingGroup1_4 = false;
    }
    
    if(currentChosenMiniGame == 13){
        
    }else{
        if(isPlayingMiniGame){
            if(isTapWronglyAndDisableBtns){
              //  printf("isTapWronglyAndDisableBtns\n");
                return;
            }
        }
    }
    
    
    if(isFuckingShootFirstTime){
        isFuckingShootFirstTime = false;
         //printf("isFuckingShootFirstTime\n");
        return;
    }
    
    for( UITouch *touch in touches ) {
		CGPoint location = [touch locationInView: [touch view]];
		location = [[CCDirector sharedDirector] convertToGL: location];
        //printf("location:%4.8f %4.8f\n",location.x, location.y);
        
        if(location.y < detect_group1GeneralUp){
            if(location.x > detect_group1Left[0] && location.x < detect_group1Right[0]){
                
                if(isClickingGroup1_2 || isClickingGroup1_3 || isClickingGroup1_4){
                    //[self clickToStop];
                }else{
                    if(controlBtnClick == kControlBtnClick_Nth){
                        touch1 = touch;
                        locationPrev1 = location;
                        [self group1_1BtnClick];
                        //printf("P\n");
                    }else{
                        touch2 = touch;
                        locationPrev2 = location;
                        [self group1_1BtnClick2];
                        // printf("PD\n");
                    }
                }
                
                
            }
            
            
            if(location.x > detect_group1Left[1] && location.x < detect_group1Right[1]){
                
                if(isClickingGroup1_1 || isClickingGroup1_3 || isClickingGroup1_4){
                    //[self clickToStop];
                }else{
                    if(controlBtnClick == kControlBtnClick_Nth){
                        touch1 = touch;
                        locationPrev1 = location;
                        [self group1_2BtnClick];
                    }else{
                        touch2 = touch;
                        locationPrev2 = location;
                        [self group1_2BtnClick2];
                    }
                }   
                
                
            }
            
            
            if(location.x > detect_group1Left[2] && location.x < detect_group1Right[2]){
                
                if(isClickingGroup1_1 || isClickingGroup1_2 || isClickingGroup1_4){
                    //[self clickToStop];
                }else{
                    if(controlBtnClick == kControlBtnClick_Nth){
                        touch1 = touch;
                        locationPrev1 = location;
                        [self group1_3BtnClick];
                        // printf("PAD\n");
                    }else{
                        touch2 = touch;
                        locationPrev2 = location;
                        [self group1_3BtnClick2];
                        //  printf("EP\n");
                    }
                }
                
                
            }
            
            if(location.x > detect_group1Left[3] && location.x < detect_group1Right[3]){
                
                if(isClickingGroup1_1 || isClickingGroup1_2 || isClickingGroup1_3){
                    // [self clickToStop];
                }else{
                    if(controlBtnClick == kControlBtnClick_Nth){
                        touch1 = touch;
                        locationPrev1 = location;
                        [self group1_4BtnClick];
                    }else{
                        touch2 = touch;
                        locationPrev2 = location;
                        [self group1_4BtnClick2];
                    }
                }
                
                
            }
            
        }
        
        
    }
}


- (void)ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    static bool hasMovingOutside;
	hasMovingOutside = false;
    
    
    for( UITouch *touch in touches ) {
		CGPoint location = [touch locationInView: [touch view]];
		location = [[CCDirector sharedDirector] convertToGL: location];
        
        if(touch == touch1){
            CGPoint location = [touch1 locationInView: [touch1 view]];
            location = [[CCDirector sharedDirector] convertToGL: location];
            
            if(location.y >= detect_group1GeneralUp || location.x <= detect_group1Left[0] || location.x >= detect_group1Right[0]){
                if(locationPrev1.y < detect_group1GeneralUp){
                    if(locationPrev1.x > detect_group1Left[0] && locationPrev1.x < detect_group1Right[0]){
                        //printf("OP\n");
                        [self group1_1BtnRelease];
                        hasMovingOutside = true;
                    }
                }
            }
            
            if(location.y >= detect_group1GeneralUp || location.x <= detect_group1Left[1] || location.x >= detect_group1Right[1]){
                if(locationPrev1.y < detect_group1GeneralUp){
                    if(locationPrev1.x > detect_group1Left[1] && locationPrev1.x < detect_group1Right[1]){
                        [self group1_2BtnRelease];
                        hasMovingOutside = true;
                    }
                }
            }
            
            if(location.y >= detect_group1GeneralUp || location.x <= detect_group1Left[2] || location.x >= detect_group1Right[2]){
                if(locationPrev1.y < detect_group1GeneralUp){
                    if(locationPrev1.x > detect_group1Left[2] && locationPrev1.x < detect_group1Right[2]){
                        [self group1_3BtnRelease];
                        hasMovingOutside = true;
                    }
                }
            }
            
            if(location.y >= detect_group1GeneralUp || location.x <= detect_group1Left[3] || location.x >= detect_group1Right[3]){
                if(locationPrev1.y < detect_group1GeneralUp){
                    if(locationPrev1.x > detect_group1Left[3] && locationPrev1.x < detect_group1Right[3]){
                        [self group1_4BtnRelease];
                        hasMovingOutside = true;
                    }
                }
            }
            
            
            if(hasMovingOutside && !isPlayingMiniGame){
                if(location.y < detect_group1GeneralUp){
                    if(location.x > detect_group1Left[0] && location.x < detect_group1Right[0]){
                        //printf("OP2\n");
                        locationPrev1 = location;
                        [self group1_1BtnClick];
                    }
                    
                    if(location.x > detect_group1Left[1] && location.x < detect_group1Right[1]){
                        locationPrev1 = location;
                        [self group1_2BtnClick];
                    }
                    
                    if(location.x > detect_group1Left[2] && location.x < detect_group1Right[2]){
                        locationPrev1 = location;
                        [self group1_3BtnClick];
                    }
                    
                    if(location.x > detect_group1Left[3] && location.x < detect_group1Right[3]){
                        locationPrev1 = location;
                        [self group1_4BtnClick];
                    }
                }
            }

        }// end if touch == touch1
        
        hasMovingOutside = false;
        
        if(touch == touch2){
            CGPoint location = [touch2 locationInView: [touch2 view]];
            location = [[CCDirector sharedDirector] convertToGL: location];
            
            if(location.y >= detect_group1GeneralUp || location.x <= detect_group1Left[0] || location.x >= detect_group1Right[0]){
                if(locationPrev2.y < detect_group1GeneralUp){
                    if(locationPrev2.x > detect_group1Left[0] && locationPrev2.x < detect_group1Right[0]){
                        [self group1_1BtnRelease2];
                        hasMovingOutside = true;
                    }
                }
            }
            
            if(location.y >= detect_group1GeneralUp || location.x <= detect_group1Left[1] || location.x >= detect_group1Right[1]){
                if(locationPrev2.y < detect_group1GeneralUp){
                    if(locationPrev2.x > detect_group1Left[1] && locationPrev2.x < detect_group1Right[1]){
                        [self group1_2BtnRelease2];
                        hasMovingOutside = true;
                    }
                }
            }
            
            if(location.y >= detect_group1GeneralUp || location.x <= detect_group1Left[2] || location.x >= detect_group1Right[2]){
                if(locationPrev2.y < detect_group1GeneralUp){
                    if(locationPrev2.x > detect_group1Left[2] && locationPrev2.x < detect_group1Right[2]){
                        [self group1_3BtnRelease2];
                        hasMovingOutside = true;
                    }
                }
            }
            
            if(location.y >= detect_group1GeneralUp || location.x <= detect_group1Left[3] || location.x >= detect_group1Right[3]){
                if(locationPrev2.y < detect_group1GeneralUp){
                    if(locationPrev2.x > detect_group1Left[3] && locationPrev2.x < detect_group1Right[3]){
                        [self group1_4BtnRelease2];
                        hasMovingOutside = true;
                    }
                }
            }
            
            
            if(hasMovingOutside && !isPlayingMiniGame){
                if(location.y < detect_group1GeneralUp){
                    if(location.x > detect_group1Left[0] && location.x < detect_group1Right[0]){
                        locationPrev2 = location;
                        [self group1_1BtnClick2];
                    }
                    
                    if(location.x > detect_group1Left[1] && location.x < detect_group1Right[1]){
                        locationPrev2 = location;
                        [self group1_2BtnClick2];
                    }
                    
                    if(location.x > detect_group1Left[2] && location.x < detect_group1Right[2]){
                        locationPrev2 = location;
                        [self group1_3BtnClick2];
                    }
                    
                    if(location.x > detect_group1Left[3] && location.x < detect_group1Right[3]){
                        locationPrev2 = location;
                        [self group1_4BtnClick2];
                    }
                }
            }
        }
    }
  
}



- (void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    // printf("ccTouchesEnded\n");
    static bool hasCollide;
	
	for( UITouch *touch in touches ) {
		if (touch1 == touch) {
            // printf("touch1\n");
            hasCollide = false;
            if(locationPrev1.y < detect_group1GeneralUp){
                if(locationPrev1.x > detect_group1Left[0] && locationPrev1.x < detect_group1Right[0]){
                    hasCollide = true;
					[self group1_1BtnRelease];
                }
                if(locationPrev1.x > detect_group1Left[1] && locationPrev1.x < detect_group1Right[1] && !hasCollide){
                    hasCollide = true;
					[self group1_2BtnRelease];
                }
                if(locationPrev1.x > detect_group1Left[2] && locationPrev1.x < detect_group1Right[2] && !hasCollide){
                    hasCollide = true;
                    //   printf("TTT\n");
					[self group1_3BtnRelease];
                }
                if(locationPrev1.x > detect_group1Left[3] && locationPrev1.x < detect_group1Right[3] && !hasCollide){
                    hasCollide = true;
					[self group1_4BtnRelease];
                }
            }
            
            touch1 = nil;
            
        }
        
        if (touch2 == touch) {
            //  printf("touch2\n");
            hasCollide = false;
            if(locationPrev2.y < detect_group1GeneralUp){
                if(locationPrev2.x > detect_group1Left[0] && locationPrev2.x < detect_group1Right[0]){
                    hasCollide = true;
					[self group1_1BtnRelease2];
                }
                if(locationPrev2.x > detect_group1Left[1] && locationPrev2.x < detect_group1Right[1] && !hasCollide){
                    hasCollide = true;
					[self group1_2BtnRelease2];
                }
                if(locationPrev2.x > detect_group1Left[2] && locationPrev2.x < detect_group1Right[2] && !hasCollide){
                    hasCollide = true;
                    //  printf("TTTG\n");
					[self group1_3BtnRelease2];
                }
                if(locationPrev2.x > detect_group1Left[3] && locationPrev2.x < detect_group1Right[3] && !hasCollide){
                    hasCollide = true;
					[self group1_4BtnRelease2];
                }
            }
            
            touch2 = nil;
            
        }
    }
}

-(void) clickToStop{
    printf("clickToStop\n");
    
	touch1 = nil;
	touch2 = nil;
	[self group1_1BtnRelease];
	[self group1_2BtnRelease];
	[self group1_3BtnRelease];
	[self group1_4BtnRelease];
    
	[self group1_1BtnRelease2];
	[self group1_2BtnRelease2];
	[self group1_3BtnRelease2];
	[self group1_4BtnRelease2];
}

-(void) group1_1BtnClick{
    // printf("group 1 1 click\n");
	controlBtnClick = kControlBtnClick_Group1_1;
    
    if(currentChosenMiniGame == 11 || currentChosenMiniGame == 7){
        isClickingGroup1_1 = false;
    }else{
        isClickingGroup1_1 = true;
    }
    
    if(!isPlayingMiniGame){
        isClickingGroup1_1 = false;
    }
	
	[s_group1_1 setTextureRect:s_group1_1_rect[1]];
	fingerHolding++;
    [delegate btnIsTappedInControlLayer:0];
}

-(void) group1_2BtnClick{
    //  printf("group 1 2 click\n");
	controlBtnClick = kControlBtnClick_Group1_2;
	isClickingGroup1_2 = true;
	[s_group1_2 setTextureRect:s_group1_2_rect[1]];
	fingerHolding++;
    [delegate btnIsTappedInControlLayer:1];
    
    if(!isPlayingMiniGame){
        isClickingGroup1_2 = false;
    }
}

-(void) group1_3BtnClick{
    //  printf("group 1 3 click\n");
	controlBtnClick = kControlBtnClick_Group1_3;
	isClickingGroup1_3 = true;
	[s_group1_3 setTextureRect:s_group1_3_rect[1]];
	fingerHolding++;
    [delegate btnIsTappedInControlLayer:2];
    
    if(!isPlayingMiniGame){
        isClickingGroup1_3 = false;
    }
}

-(void) group1_4BtnClick{
    //  printf("group 1 4 click\n");
	controlBtnClick = kControlBtnClick_Group1_4;
    
    if(currentChosenMiniGame == 11 || currentChosenMiniGame == 7){
        isClickingGroup1_4 = false;
    }else{
        isClickingGroup1_4 = true;
    }
    
	[s_group1_4 setTextureRect:s_group1_4_rect[1]];
	fingerHolding++;
    [delegate btnIsTappedInControlLayer:3];
    
    if(!isPlayingMiniGame){
        isClickingGroup1_4 = false;
    }
}


-(void) group1_1BtnClick2{
    //	printf("group 1 1 click2\n");
	controlBtnClick2 = kControlBtnClick_Group1_1;
    
    if(currentChosenMiniGame == 11 || currentChosenMiniGame == 7){
        isClickingGroup1_1 = false;
    }else{
        isClickingGroup1_1 = true;
    }
    
	[s_group1_1 setTextureRect:s_group1_1_rect[1]];
	fingerHolding++;
    [delegate btnIsTappedInControlLayer:0];
    
    if(!isPlayingMiniGame){
        isClickingGroup1_1 = false;
    }
}

-(void) group1_2BtnClick2{
    //	printf("group 1 2 click2\n");
	controlBtnClick2 = kControlBtnClick_Group1_2;
	isClickingGroup1_2 = true;
	[s_group1_2 setTextureRect:s_group1_2_rect[1]];
	fingerHolding++;
    [delegate btnIsTappedInControlLayer:1];
    
    if(!isPlayingMiniGame){
        isClickingGroup1_2 = false;
    }
}

-(void) group1_3BtnClick2{
    //	printf("group 1 3 click2\n");
	controlBtnClick2 = kControlBtnClick_Group1_3;
	isClickingGroup1_3 = true;
	[s_group1_3 setTextureRect:s_group1_3_rect[1]];
	fingerHolding++;
    [delegate btnIsTappedInControlLayer:2];
    
    if(!isPlayingMiniGame){
        isClickingGroup1_3 = false;
    }
}

-(void) group1_4BtnClick2{
    //	printf("group 1 4 click2\n");
	controlBtnClick2 = kControlBtnClick_Group1_4;
    
    if(currentChosenMiniGame == 11 || currentChosenMiniGame == 7){
        isClickingGroup1_4 = false;
    }else{
        isClickingGroup1_4 = true;
    }
    
	[s_group1_4 setTextureRect:s_group1_4_rect[1]];
	fingerHolding++;
    [delegate btnIsTappedInControlLayer:3];
    
    if(!isPlayingMiniGame){
        isClickingGroup1_4 = false;
    }
}


-(void) group1_1BtnRelease{
	//printf("group 1 1 release\n");
	//touch1 = nil;
	controlBtnClick = kControlBtnClick_Nth;
	isClickingGroup1_1 = false;
	locationPrev1 = ccp(1000,1000);
	[s_group1_1 setTextureRect:s_group1_1_rect[0]];
	fingerHolding--;
    [delegate btnIsReleasedInControlLayer:0];
}

-(void) group1_2BtnRelease{
    //	printf("group 1 2 release\n");
	//touch1 = nil;
	controlBtnClick = kControlBtnClick_Nth;
	isClickingGroup1_2 = false;
	locationPrev1 = ccp(1000,1000);
	[s_group1_2 setTextureRect:s_group1_2_rect[0]];
	fingerHolding--;
    [delegate btnIsReleasedInControlLayer:1];
}

-(void) group1_3BtnRelease{
    //	printf("group 1 3 release\n");
	//touch1 = nil;
	controlBtnClick = kControlBtnClick_Nth;
	isClickingGroup1_3 = false;
	locationPrev1 = ccp(1000,1000);
	[s_group1_3 setTextureRect:s_group1_3_rect[0]];
	fingerHolding--;
    [delegate btnIsReleasedInControlLayer:2];
}

-(void) group1_4BtnRelease{
    //	printf("group 1 4 release\n");
	//touch1 = nil;
	controlBtnClick = kControlBtnClick_Nth;
	isClickingGroup1_4 = false;
	locationPrev1 = ccp(1000,1000);
	[s_group1_4 setTextureRect:s_group1_4_rect[0]];
	fingerHolding--;
    [delegate btnIsReleasedInControlLayer:3];
}


-(void) group1_1BtnRelease2{
	//printf("group 1 1 release2\n");
	//touch1 = nil;
	controlBtnClick2 = kControlBtnClick_Nth;
	isClickingGroup1_1 = false;
	locationPrev2 = ccp(1000,1000);
	[s_group1_1 setTextureRect:s_group1_1_rect[0]];
	fingerHolding--;
    [delegate btnIsReleasedInControlLayer:0];
}

-(void) group1_2BtnRelease2{
    //	printf("group 1 2 release2\n");
	//touch1 = nil;
	controlBtnClick2 = kControlBtnClick_Nth;
	isClickingGroup1_2 = false;
	locationPrev2 = ccp(1000,1000);
	[s_group1_2 setTextureRect:s_group1_2_rect[0]];
	fingerHolding--;
    [delegate btnIsReleasedInControlLayer:1];
}

-(void) group1_3BtnRelease2{
    //	printf("group 1 3 release2\n");
	//touch1 = nil;
	controlBtnClick2 = kControlBtnClick_Nth;
	isClickingGroup1_3 = false;
	locationPrev2 = ccp(1000,1000);
	[s_group1_3 setTextureRect:s_group1_3_rect[0]];
	fingerHolding--;
    [delegate btnIsReleasedInControlLayer:2];
}

-(void) group1_4BtnRelease2{
    //	printf("group 1 4 release2\n");
	//touch1 = nil;
	controlBtnClick2 = kControlBtnClick_Nth;
	isClickingGroup1_4 = false;
	locationPrev2 = ccp(1000,1000);
	[s_group1_4 setTextureRect:s_group1_4_rect[0]];
	fingerHolding--;
    [delegate btnIsReleasedInControlLayer:3];
}



-(void) dealloc{
	NSLog(@"ControlLayer Layer dealloc");
	[super dealloc];
}



@end