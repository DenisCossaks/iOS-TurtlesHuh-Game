//
//  AchivementPopup.m
//  TurtlesHuh
//
//  Created by  on 2012/5/21.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "AchivementPopup.h"
#import "GamePlayGlobal.h"
#import "Global.h"
#import "ScoreShownScene.h"

const char *firstSentenseChar = nil;
const char *secondSentenseChar = nil;
const char *achievementIdxChar = nil;

@implementation AchivementPopup

-(void) setX:(int)_x{
    posX = _x;
}
-(void) setY:(int)_y{
    posY = _y;
}

-(void) setDelegate:(id)_delegate{
    delegate = _delegate;
}

-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
        
        
        self.isTouchEnabled = YES;

        isShowingDetails = false;
        hasPlayedTurtleCoinSound = false;
        hasPlayedAcivementSound = false;
 
        
        string_setense01 = [[NSMutableString string] retain];
        string_setense02 = [[NSMutableString string] retain];
        string_achivementIdx = [[NSMutableString string] retain];
        
        s_blackLayer = [CCLayerColor layerWithColor:ccc4(0, 0, 0, 190)];
        [self addChild:s_blackLayer z :kDeapth_Btns];
        [s_blackLayer setPosition:ccp(1000,10000)];
        
       // ss_Achievement  = [CCSpriteBatchNode spriteSheetWithFile:@"AchievementIcons_Texture.png" capacity:1];
       // [self addChild:ss_Achievement z:kDeapth_ssCharacter];

        
        [self initDialog];
        [self initLetters];
        [self initReward];
        [self initCompleteDialog];

        

    }
	return self;
}

-(void) initReward{
    maxRewardDigit = 10;
    
    s_reward = [CCSprite spriteWithFile:@"AchievementPopup_reward.png"];
    [self addChild:s_reward z:kDeapth_Turtle_Bombing2];
    [s_reward setPosition:ccp(1000,10000)];
    
    
    l_rewordNumber = [CCLabelAtlas labelWithString:@"0" charMapFile:@"fontV2.png" itemWidth:22 itemHeight:27 startCharMap:'0'];
    [l_rewordNumber setPosition:ccp(10000,100000)];
    [l_rewordNumber setAnchorPoint:ccp(0,0)];
    [self addChild:l_rewordNumber z:kDeapth_Turtle_Bombing2];
    [l_rewordNumber setColor:ccc3(122, 12, 0)];
    
    [l_rewordNumber setScale:0.5];
    [l_rewordNumber setAnchorPoint:ccp(0.5,0.5)];
    
    for(int i = 0 ; i < 4 ; i++){
        s_completed_reward[i] = [CCSprite spriteWithFile:@"AchievementPopup_reward.png"];
        [self addChild:s_completed_reward[i] z:kDeapth_Turtle_Bombing2];
        [s_completed_reward[i] setPosition:ccp(1000,10000)];
        
        
        l_completed_rewordNumber[i] = [CCLabelAtlas labelWithString:@"0" charMapFile:@"fontV2.png" itemWidth:22 itemHeight:27 startCharMap:'0'];
        [l_completed_rewordNumber[i] setPosition:ccp(10000,100000)];
        [l_completed_rewordNumber[i] setAnchorPoint:ccp(0,0)];
        [self addChild: l_completed_rewordNumber[i] z:kDeapth_Turtle_Bombing2];
        [l_completed_rewordNumber[i] setColor:ccc3(122, 12, 0)];
        
        [l_completed_rewordNumber[i] setScale:0.5];
        [l_completed_rewordNumber[i] setAnchorPoint:ccp(0.5,0.5)];
    }
}

-(void) initLetters{
 
    
   // ss_Font01  = [CCSpriteBatchNode spriteSheetWithFile:@"fontV1.png" capacity:1];
    ss_Font01  = [CCSpriteBatchNode batchNodeWithFile:@"fontV1.png" capacity:1];
    [self addChild:ss_Font01 z:kDeapth_Turtle_Bombing2];
    
    maxSentenseWord = 60;
    for( int i = 0 ; i < maxSentenseWord ; i++){
        l_detailsDialog_sentense01[i] = [CCSprite spriteWithTexture:ss_Font01.texture rect:CGRectMake(0, 0, 0, 0)];
        l_detailsDialog_sentense02[i] = [CCSprite spriteWithTexture:ss_Font01.texture rect:CGRectMake(0, 0, 0, 0)];
        
        [l_detailsDialog_sentense01[i] setPosition:ccp(10000,100000)];
        [l_detailsDialog_sentense01[i] setAnchorPoint:ccp(0,0)];
        [ss_Font01 addChild:l_detailsDialog_sentense01[i]];
        [l_detailsDialog_sentense01[i] setColor:ccc3(159,159,159)];
        
        [l_detailsDialog_sentense02[i] setPosition:ccp(10000,100000)];
        [l_detailsDialog_sentense02[i] setAnchorPoint:ccp(0,0)];
        [ss_Font01 addChild:l_detailsDialog_sentense02[i]];
        [l_detailsDialog_sentense02[i] setColor:ccc3(159,159,159)];
    }
    
    for( int i = 0 ; i < 2 ; i++){
        l_achvementIdx[i] = [CCSprite spriteWithTexture:ss_Font01.texture rect:CGRectMake(0, 0, 0, 0)];
       
        [l_achvementIdx[i] setPosition:ccp(10000,100000)];
        [l_achvementIdx[i] setAnchorPoint:ccp(0,0)];
        [ss_Font01 addChild:l_achvementIdx[i]];
        [l_achvementIdx[i] setColor:ccc3(48, 94, 173)];
    }

}

-(void) initDialog{
    s_detailsDialog = [CCSprite spriteWithFile:@"AchievementPopup_dialog.png"];
    [self addChild:s_detailsDialog z:kDeapth_Menu1];
    [s_detailsDialog setPosition:ccp(1000,10000)];
    
    s_detailsDiaogArrow = [CCSprite spriteWithFile:@"AchievementPopup_arrow.png"];
    [self addChild:s_detailsDiaogArrow z:kDeapth_Menu1];
    [s_detailsDiaogArrow setPosition:ccp(1000,10000)];
    
}

-(void) initCompleteDialog{
    showingCompleteIdx = 0;
    
    for(int i = 0 ; i < 4 ; i++){
        s_completed_Dialog[i] = [CCSprite spriteWithFile:@"AchievementPopup_UnblockedDialog.png"];
        [self addChild:s_completed_Dialog[i] z:kDeapth_Menu1];
        [s_completed_Dialog[i] setPosition:ccp(10000,10000)];
        isShowingComplete[i] = false;
    }
    
}

-(void) popupAchivementDetails:(int)_achivementIdx arrowIsUp:(bool)isUp arrowX:(int)_arrowX{
    //printf("posX:%i %i\n",posX, posY);
    
    isShowingDetails = true;
    isShowingCompleted = false;
    
    [s_blackLayer setPosition:ccp(0,0)];
    
    achivementIdx = _achivementIdx;
    if(isUp){
        [s_detailsDiaogArrow setScaleY:-1];
    }else{
        [s_detailsDiaogArrow setScaleY:1];
    }
    
    detailDialogArrow_X = _arrowX;
    
    [s_detailsDialog setPosition:ccp(posX,posY)];
    if(isUp){
        [s_detailsDiaogArrow setPosition:ccp(_arrowX + posX, posY + 60.5 * 2/textureRatioForFuckingIpad)];
    }else{
        [s_detailsDiaogArrow setPosition:ccp(_arrowX + posX, posY - 60.5 * 2/textureRatioForFuckingIpad)];
    }
    
    if(isIphone5){
        [s_detailsDiaogArrow setPosition:ccp(s_detailsDiaogArrow.position.x - 44, s_detailsDiaogArrow.position.y)];
    }

    /*[l_achvementIdx setString:[NSString stringWithFormat:@"%i", _achivementIdx + 1]];
    
    [l_achvementIdx setPosition:ccp(posX+17,posY+16)];
    [l_detailsDialog_sentense01 setPosition:ccp(posX-103,posY-4)];
    [l_detailsDialog_sentense02 setPosition:ccp(posX-103,posY-22)];*/
    
    [self setDialogString];
    
    
    [self initIcons];
    
    
    return;
    
    [self checkToShowReward];
   
}

-(void) removeIconBeforePopAother{
    [self removeChild:s_icon cleanup:YES];
  //  [self removeChild:s_icon_bg cleanup:YES];
}


-(void) popupAchivementCompleted:(int)_achivementIdx posX:(float)_x posY:(float)_y{
    showCompleteReferToAchivementIdx[showingCompleteIdx] = _achivementIdx;
    isShowingComplete[showingCompleteIdx] = true;
    showCompleteTimer[showingCompleteIdx] = 0;
    
    showingCompleteOpacity[showingCompleteIdx] = 50;
    //showingCompleteOpacity[showingCompleteIdx] = 80;
    showingCompleteScale[showingCompleteIdx] = 5.0;
    
    showingCompleteIsDisappearing[showingCompleteIdx] = false;
    
    showingCompleteX[showingCompleteIdx] = _x;
    showingCompleteY[showingCompleteIdx] = _y;
   // [s_completed_Dialog[showingCompleteIdx] setPosition:ccp(showingCompleteX[showingCompleteIdx],showingCompleteY[showingCompleteIdx])];
    
   // s_completed_icon_bg[showingCompleteIdx] = [CCSprite spriteWithFile:@"AchievementIcon_unblockedBg.png"];
    
    if(hasFinishedThisAchivements[_achivementIdx]){
        NSString *key = [NSString stringWithFormat:@"icon_Achievement_%02d.png", _achivementIdx+1];
        s_completed_icon[showingCompleteIdx] = [CCSprite spriteWithFile:key];
    }else{
        s_completed_icon[showingCompleteIdx] = [CCSprite spriteWithFile:@"icon_Achievement_unblock.png"];
    }
    
    
    [self addChild:s_completed_icon[showingCompleteIdx]  z:kDeapth_Bg_Element1];
    //[self addChild:s_completed_icon_bg[showingCompleteIdx]  z:kDeapth_Bg_Element1];
    
    //[s_completed_icon_bg[showingCompleteIdx] setPosition:ccp(showingCompleteX[showingCompleteIdx]+10000,showingCompleteY[showingCompleteIdx])];
    [s_completed_icon[showingCompleteIdx] setPosition:ccp(showingCompleteX[showingCompleteIdx],showingCompleteY[showingCompleteIdx])];
    //[s_completed_reward[showingCompleteIdx] setPosition:ccp(showingCompleteX[showingCompleteIdx] + 150,showingCompleteY[showingCompleteIdx])];
    //[l_completed_rewordNumber[showingCompleteIdx] setPosition:ccp(s_completed_reward[showingCompleteIdx].position.x, 
    //                                                              s_completed_reward[showingCompleteIdx].position.y - 6)];
    
    [l_completed_rewordNumber[showingCompleteIdx] setString:[NSString stringWithFormat:@"%i", ahievementReward[_achivementIdx]]];
    
    showingComplete_RewardScale[showingCompleteIdx] = 1.0;
    showingComplete_RewardOpacity[showingCompleteIdx] = 0.0;
    showingComplete_OffsetY[showingCompleteIdx] = 0;
    showingComplete_VR[showingCompleteIdx] = 0;
    showingComplete_R[showingCompleteIdx] = 0;
    showingComplete_RewardIsGoingToHell[showingCompleteIdx] = false;
    
    showingCompleteIdx++;
}

-(void) manageCompleteV2{
    for(int i = 0 ; i < 4 ; i++){
        if(isShowingComplete[i]){
            
            
            if(!showingCompleteIsDisappearing[i]){
                
                showingCompleteScale[i] += (0 - showingCompleteScale[i])/20.0;
                
                if(showingCompleteScale[i] < 1){
                    showingCompleteScale[i] = 1;
                }
                
                if(showCompleteTimer[i] == 120){
                   // showingCompleteIsDisappearing[i] = true;
                }
                
                showingCompleteOpacity[i] += 15;
                
                if(showingCompleteOpacity[i] > 255){
                    showingCompleteOpacity[i] = 255;
                }
                
                if(showCompleteTimer[i] == 10){
                   // printf("iii:%i %4.8f %4.8f\n",i, showingCompleteX[i],showingCompleteY[i]);
                    [delegate setCoinAniForRewardAtX:showingCompleteX[i]+0 Y:showingCompleteY[i]];
                    if(!hasPlayedAcivementSound){
                        [musicController playThisSound:kSound_AchivementUnlock isLoop:NO gain:1.0];
                        [musicController playThisSound:kSound_Reward isLoop:NO gain:0.7];
                        hasPlayedAcivementSound = true;
                    }
                     
                }
                
            }else{
                showingCompleteOpacity[i] -= 30;
                showingCompleteScale[i] += 0.1;
                
                if(showingCompleteOpacity[i] < 0){
                    showingCompleteOpacity[i] = 0;
                }
            }

            

            [s_completed_icon[i] setScale:showingCompleteScale[i]]; 
            //[s_completed_icon_bg[i] setScale:showingCompleteScale[i]]; 
            
    
            [s_completed_icon[i] setOpacity:showingCompleteOpacity[i]]; 
           // [s_completed_icon_bg[i] setOpacity:showingCompleteOpacity[i]]; 
            
            
            [s_completed_icon[i] setPosition:ccp(showingCompleteX[i], showingCompleteY[i])];
           // [s_completed_icon_bg[i] setPosition:ccp(showingCompleteX[i], showingCompleteY[i])];
     

            if(!showingComplete_RewardIsGoingToHell[i]){

               /* if(showCompleteTimer[i] >= 45){
                    showingCompleteScale[i] += (0 - showingCompleteScale[i])/7;
                    
                    showingComplete_RewardOpacity[i] += 7;
                    if(showingComplete_RewardOpacity[i] > 255){
                        showingComplete_RewardOpacity[i] = 255;
                    }
                    
                    [s_completed_reward[i] setPosition:ccp(showingCompleteX[i]  ,showingCompleteY[i] + showingComplete_OffsetY[i])];
                    [l_completed_rewordNumber[i] setPosition:ccp(s_completed_reward[i].position.x, 
                                                                 s_completed_reward[i].position.y - 6)];
                    
                    [s_completed_reward[i] setOpacity:showingComplete_RewardOpacity[i]];
                    [l_completed_rewordNumber[i] setOpacity:showingComplete_RewardOpacity[i]];
                    
                    [s_completed_reward[i] setScale:showingCompleteScale[i]];
                    [l_completed_rewordNumber[i] setScale:showingCompleteScale[i] * 0.5];

                }
                
                if(showCompleteTimer[i] >= 60 && showCompleteTimer[i] < 150){
                    showingComplete_OffsetY[i] += 0.2;
                }
                if(showCompleteTimer[i] >= 150){
                    showingComplete_VR[i] += 0.2;
                    showingComplete_R[i] += showingComplete_VR[i];
                    
                    [s_completed_reward[i] setRotation:showingComplete_R[i]];
                    [l_completed_rewordNumber[i] setRotation:showingComplete_R[i]];
                }
                
                if(showCompleteTimer[i] == 150){
                    showingComplete_RewardIsGoingToHell[i] = true;
                    showingComplete_RewardToHellDiffX[i] = (445 - s_completed_reward[i].position.x);
                    showingComplete_RewardToHellDiffY[i] = (270 - s_completed_reward[i].position.y);
                    showingComplete_RewardToHellTimer[i] = 0;
                    showingComplete_RewardToHellOriX[i] = s_completed_reward[i].position.x;
                    showingComplete_RewardToHellOriY[i] = s_completed_reward[i].position.y;
                }*/
                
            }else{
                showingComplete_RewardToHellTimer[i]++;
                if(showingComplete_RewardToHellTimer[i] > 40){
                    showingComplete_RewardScale[i] += 0.2;
                    
                    showingComplete_RewardOpacity[i] -= 30;
                    if(showingComplete_RewardOpacity[i] < 0){
                        showingComplete_RewardOpacity[i] = 0;
                    }
                    
                    [s_completed_reward[i] setOpacity:showingComplete_RewardOpacity[i]];
                    [l_completed_rewordNumber[i] setOpacity:showingComplete_RewardOpacity[i]];
                    
                    [s_completed_reward[i] setScale:showingComplete_RewardScale[i]];
                    [l_completed_rewordNumber[i] setScale:showingComplete_RewardScale[i] * 0.5];
                    
                }else{
                    static float goingHellCurrentX;
                    static float goingHellCurrentY;
                    goingHellCurrentX = showingComplete_RewardToHellOriX[i] + (showingComplete_RewardToHellDiffX[i] - (40 - showingComplete_RewardToHellTimer[i]) * 10)/40 * showingComplete_RewardToHellTimer[i];
                    goingHellCurrentY = showingComplete_RewardToHellOriY[i] + (showingComplete_RewardToHellDiffY[i] - (40 - showingComplete_RewardToHellTimer[i]) * 10)/40 * showingComplete_RewardToHellTimer[i];
                  //  printf("goingHellCurrentX:%i %4.8f %4.8f\n",i ,goingHellCurrentX,showingComplete_RewardToHellDiffX[i]);
                    [s_completed_reward[i] setPosition:ccp(goingHellCurrentX,goingHellCurrentY)];
                    [l_completed_rewordNumber[i] setPosition:ccp(s_completed_reward[i].position.x, 
                                                                 s_completed_reward[i].position.y - 6)];
                }
                
                showingComplete_VR[i] += 0.5;
                showingComplete_R[i] += showingComplete_VR[i];
                
                [s_completed_reward[i] setRotation:showingComplete_R[i]];
                [l_completed_rewordNumber[i] setRotation:showingComplete_R[i]];
            }
            
            if(showingComplete_RewardToHellTimer[i] == 35){
                if(!hasPlayedTurtleCoinSound){
                    [musicController playThisSound:kSound_TurtleCoinsGain isLoop:NO gain:1.0];
                    hasPlayedTurtleCoinSound = true;
                }

                
            }
          
            if(showingComplete_RewardToHellTimer[i] == 40){
                [delegate gainAchivementCoin];
            }
            
            showCompleteTimer[i]++;
        }
    }
}

-(void) manageComplete{
    for(int i = 0 ; i < 4 ; i++){
        if(isShowingComplete[i]){
            
            if(!showingCompleteIsDisappearing[i]){
                
                showingCompleteScale[i] += (0 - showingCompleteScale[i])/10;
                
                if(showingCompleteScale[i] < 1){
                    showingCompleteScale[i] = 1;
                }
                
                if(showCompleteTimer[i] == 120){
                    showingCompleteIsDisappearing[i] = true;
                }
                
                showingCompleteOpacity[i] += 10;
                
                if(showingCompleteOpacity[i] > 255){
                    showingCompleteOpacity[i] = 255;
                }
                
            }else{
                showingCompleteOpacity[i] -= 30;
                showingCompleteScale[i] += 0.1;
               
                if(showingCompleteOpacity[i] < 0){
                    showingCompleteOpacity[i] = 0;
                }
            }
            
            [s_completed_Dialog[i] setPosition:ccp(showingCompleteX[i],showingCompleteY[i])];
           // [s_completed_icon_bg[i] setPosition:ccp(showingCompleteX[i],showingCompleteY[i]-10)];
           // [s_completed_reward[i] setPosition:ccp(showingCompleteX[i] + 145,showingCompleteY[i])];
            //[l_completed_rewordNumber[i] setPosition:ccp(s_completed_reward[i].position.x, 
            //                                                              s_completed_reward[i].position.y - 6)];
            
            
            [s_completed_Dialog[i] setScale:showingCompleteScale[i]]; 
          //  [s_completed_icon_bg[i] setScale:showingCompleteScale[i]]; 
            //[s_completed_reward[i] setScale:showingCompleteScale[i]]; 
           // [l_completed_rewordNumber[i] setScale:showingCompleteScale[i] * 0.5]; 
            
             [s_completed_Dialog[i] setOpacity:showingCompleteOpacity[i]]; 
            //[s_completed_icon_bg[i] setOpacity:showingCompleteOpacity[i]]; 
            [s_completed_reward[i] setOpacity:showingCompleteOpacity[i]]; 
            [l_completed_rewordNumber[i] setOpacity:showingCompleteOpacity[i]]; 
            
            static int ranRewardX;
            static int ranRewardY;
            
            if(showCompleteTimer[i] == 30){
                [delegate setTurtleCoinAniForReward];
            }
            
            if(showCompleteTimer[i] >= 30){
               // ranRewardX = arc4random()%4 - 2;
               // ranRewardY = arc4random()%4 - 2;
                [s_completed_reward[i] setPosition:ccp(showingCompleteX[i] + 145 + ranRewardX,showingCompleteY[i] + ranRewardY)];
                [l_completed_rewordNumber[i] setPosition:ccp(s_completed_reward[i].position.x, 
                                                             s_completed_reward[i].position.y - 6)];
            }
            
            showCompleteTimer[i]++;
        }
    }
}

-(void) setDisappearComplete{
    showingCompleteIsDisappearing[0] = true;
    showingCompleteIsDisappearing[1] = true;
    showingCompleteIsDisappearing[2] = true;
    showingCompleteIsDisappearing[3] = true;
}

-(void) initIcons{

    if(hasFinishedThisAchivements[achivementIdx]){
        NSString *key = [NSString stringWithFormat:@"icon_Achievement_%02d.png", achivementIdx+1];
         s_icon = [CCSprite spriteWithFile:key];
    }else{
        s_icon = [CCSprite spriteWithFile:@"icon_Achievement_unblock.png"];
    }

   
    [self addChild:s_icon z:kDeapth_Menu1];
    [s_icon setPosition:ccp(posX-142 * 2/textureRatioForFuckingIpad,posY+10 * 2/textureRatioForFuckingIpad)];
    
  /*  if(isShowingCompleted){
        [s_icon setScale:1.0];
    }else{
        [s_icon setScale:0.9];
         [s_icon setPosition:ccp(posX-142,posY+12)];
       // [s_icon_bg setPosition:ccp(posX-142,posY+12)];
    }*/
}

-(void) removePopup{
    isShowingDetails = false;
    
    [s_blackLayer setPosition:ccp(20040,160)];
    [s_detailsDialog setPosition:ccp(1000,10000)];
    [s_detailsDiaogArrow setPosition:ccp(1000,10000)];
    //[s_completedDialog setPosition:ccp(1000,10000)];
    [s_icon setPosition:ccp(10000,10000)];
    //[s_icon_bg setPosition:ccp(10000,10000)];
    
    [self removeChild:s_icon cleanup:YES];
   // [self removeChild:s_icon_bg cleanup:YES];
    
    [delegate removePopup];
    
    for(int i = 0 ; i < maxSentenseWord ; i++){
        [l_detailsDialog_sentense01[i] setPosition:ccp(10000,10000)];
        [l_detailsDialog_sentense02[i] setPosition:ccp(10000,10000)];
    }
    
    [l_achvementIdx[0] setPosition:ccp(1000,10000)];
    [l_achvementIdx[01] setPosition:ccp(1000,10000)];
    
    [s_reward setPosition:ccp(1000,100000)];
    [l_rewordNumber setPosition:ccp(1000,100000)];
}

-(void) setDialogString{
    printf("setDialogString:%i\n",achivementIdx);
    
    static int counterLeft;
    static int counter;
    
    if(achivementIdx == 0){
        counter = [[NSUserDefaults standardUserDefaults] integerForKey:@"counter_mini_01"];
        counterLeft = 400 - counter;
        
        [string_setense01 setString:@"BOMB 400 TURTLES TOTAL"];
        [string_setense02 setString:@"IN  MINI GAME 01 "];
        
        if(counterLeft > 0){
            [string_setense02 appendString:@"<"];
            [string_setense02 appendFormat:@"%i", counterLeft];
            [string_setense02 appendString:@" LEFT>"];
        }
        
        

    }
        
    if(achivementIdx == 1){
        counter = [[NSUserDefaults standardUserDefaults] integerForKey:@"counter_mini_01"];
        counterLeft = 4000 - counter;
        
        [string_setense01 setString:@"BOMB 4000 TURTLES TOTAL"];
        [string_setense02 setString:@"IN  MINI GAME 01 "];
        
        if(counterLeft > 0){
            [string_setense02 appendString:@"<"];
            [string_setense02 appendFormat:@"%i", counterLeft];
            [string_setense02 appendString:@" LEFT>"];
        }
    }
    if(achivementIdx == 2){
        [string_setense01 setString:@"GET GRADE B"];
        [string_setense02 setString:@"IN  MINI GAME 01 "];
    }
    if(achivementIdx == 3){
        [string_setense01 setString:@"GET GRADE A"];
        [string_setense02 setString:@"IN  MINI GAME 01 "];
    }
    if(achivementIdx == 4){
        [string_setense01 setString:@"GET 950 SCORE"];
        [string_setense02 setString:@"IN  MINI GAME 01 "];
    }
    
    
    //MINI 02
    if(achivementIdx == 5){
        counter = [[NSUserDefaults standardUserDefaults] integerForKey:@"counter_mini_04"];
        counterLeft = 400 - counter;
        
        [string_setense01 setString:@"BOMB 400 TURTLES TOTAL"];
        [string_setense02 setString:@"IN  MINI GAME 02 "];
        
        if(counterLeft > 0){
            [string_setense02 appendString:@"<"];
            [string_setense02 appendFormat:@"%i", counterLeft];
            [string_setense02 appendString:@" LEFT>"];
        }
    }
    
    if(achivementIdx == 6){
        counter = [[NSUserDefaults standardUserDefaults] integerForKey:@"counter_mini_04"];
        counterLeft = 3500 - counter;
        
        [string_setense01 setString:@"BOMB 3500 TURTLES TOTAL"];
        [string_setense02 setString:@"IN  MINI GAME 02 "];
        
        if(counterLeft > 0){
            [string_setense02 appendString:@"<"];
            [string_setense02 appendFormat:@"%i", counterLeft];
            [string_setense02 appendString:@" LEFT>"];
        }
    }
    if(achivementIdx == 7){
       [string_setense01 setString:@"GET GRADE B"];
        [string_setense02 setString:@"IN  MINI GAME 02"];
    }
    if(achivementIdx == 8){
        [string_setense01 setString:@"GET GRADE A"];
        [string_setense02 setString:@"IN  MINI GAME 02"];
    }
    if(achivementIdx == 9){
       [string_setense01 setString:@"GET 900 SCORE"];
        [string_setense02 setString:@"IN  MINI GAME 02"];
    }
    
    //MINI 03
    if(achivementIdx == 10){
        counter = [[NSUserDefaults standardUserDefaults] integerForKey:@"counter_mini_02"];
        counterLeft = 400 - counter;
        
       [string_setense01 setString:@"BOMB 400 TURTLE SHELLS TOTAL"];
        [string_setense02 setString:@"IN  MINI GAME 03 "];
        
        if(counterLeft > 0){
            [string_setense02 appendString:@"<"];
            [string_setense02 appendFormat:@"%i", counterLeft];
            [string_setense02 appendString:@" LEFT>"];
        }
    }
    if(achivementIdx == 11){
        counter = [[NSUserDefaults standardUserDefaults] integerForKey:@"counter_mini_02"];
        counterLeft = 2000 - counter;
        
       [string_setense01 setString:@"BOMB 2000 TURTLE SHELLS TOTAL"];
        [string_setense02 setString:@"IN  MINI GAME 03 "];
        
        if(counterLeft > 0){
            [string_setense02 appendString:@"<"];
            [string_setense02 appendFormat:@"%i", counterLeft];
            [string_setense02 appendString:@" LEFT>"];
        }
    }
    if(achivementIdx == 12){
       [string_setense01 setString:@"GET GRADE B"];
        [string_setense02 setString:@"IN  MINI GAME 03"];
    }
    if(achivementIdx == 13){
        [string_setense01 setString:@"GET GRADE A"];
        [string_setense02 setString:@"IN  MINI GAME 03"];
    }
    if(achivementIdx == 14){
       [string_setense01 setString:@"GET 660 SCORE"];
        [string_setense02 setString:@"IN  MINI GAME 03"];
    }
    
    
    //MINI 04
    if(achivementIdx == 15){
        counter = [[NSUserDefaults standardUserDefaults] integerForKey:@"counter_mini_03"];
        counterLeft = 400 - counter;
        
       [string_setense01 setString:@"BOMB 400 TURTLES TOTAL"];
        [string_setense02 setString:@"IN  MINI GAME 04 "];
        
        if(counterLeft > 0){
            [string_setense02 appendString:@"<"];
            [string_setense02 appendFormat:@"%i", counterLeft];
            [string_setense02 appendString:@" LEFT>"];
        }
    }
    if(achivementIdx == 16){
        counter = [[NSUserDefaults standardUserDefaults] integerForKey:@"counter_mini_03"];
        counterLeft = 1500 - counter;
        
       [string_setense01 setString:@"BOMB 1500 TURTLES TOTAL"];
        [string_setense02 setString:@"IN  MINI GAME 04 "];
        
        if(counterLeft > 0){
            [string_setense02 appendString:@"<"];
            [string_setense02 appendFormat:@"%i", counterLeft];
            [string_setense02 appendString:@" LEFT>"];
        }
    }
    if(achivementIdx == 17){
       [string_setense01 setString:@"GET GRADE B"];
        [string_setense02 setString:@"IN  MINI GAME 04"];
    }
    if(achivementIdx == 18){
        [string_setense01 setString:@"GET GRADE A"];
        [string_setense02 setString:@"IN  MINI GAME 04"];
    }

    if(achivementIdx == 19){
       [string_setense01 setString:@"GET 800 SCORE"];
        [string_setense02 setString:@"IN  MINI GAME 04"];
    }
    
    
    //MINI 05
    if(achivementIdx == 20){
        counter = [[NSUserDefaults standardUserDefaults] integerForKey:@"counter_mini_10"];
        counterLeft = 200 - counter;
        
       [string_setense01 setString:@"ESCAPE FROM ATTACK 200 TIMES TOTAL"];
        [string_setense02 setString:@"IN  MINI GAME 05 "];
        
        if(counterLeft > 0){
            [string_setense02 appendString:@"<"];
            [string_setense02 appendFormat:@"%i", counterLeft];
            [string_setense02 appendString:@" LEFT>"];
        }
    }
    if(achivementIdx == 21){
        counter = [[NSUserDefaults standardUserDefaults] integerForKey:@"counter_mini_10"];
        counterLeft = 1200 - counter;
        
       [string_setense01 setString:@"ESCAPE FROM ATTACK 1200 TIMES TOTAL"];
        [string_setense02 setString:@"IN  MINI GAME 05 "];
        
        if(counterLeft > 0){
            [string_setense02 appendString:@"<"];
            [string_setense02 appendFormat:@"%i", counterLeft];
            [string_setense02 appendString:@" LEFT>"];
        }
    }
    if(achivementIdx == 22){
       [string_setense01 setString:@"GET GRADE B"];
        [string_setense02 setString:@"IN  MINI GAME 05"];
    }
    if(achivementIdx == 23){
        [string_setense01 setString:@"GET GRADE A"];
        [string_setense02 setString:@"IN  MINI GAME 05"];
    }
    if(achivementIdx == 24){
       [string_setense01 setString:@"GET 900 SCORE"];
        [string_setense02 setString:@"IN  MINI GAME 05"];
    }
    
    
    //MINI 06
    if(achivementIdx == 25){
        counter = [[NSUserDefaults standardUserDefaults] integerForKey:@"counter_mini_05"];
        counterLeft = 400 - counter;
        
       [string_setense01 setString:@"BOMB 400 TURTLE SHELLS TOTAL"];
        [string_setense02 setString:@"IN  MINI GAME 06 "];
        
        if(counterLeft > 0){
            [string_setense02 appendString:@"<"];
            [string_setense02 appendFormat:@"%i", counterLeft];
            [string_setense02 appendString:@" LEFT>"];
        }
    }
    if(achivementIdx == 26){
        counter = [[NSUserDefaults standardUserDefaults] integerForKey:@"counter_mini_05"];
        counterLeft = 3000 - counter;
        
       [string_setense01 setString:@"BOMB 3000 TURTLE SHELLS TOTAL"];
        [string_setense02 setString:@"IN  MINI GAME 06 "];
        
        if(counterLeft > 0){
            [string_setense02 appendString:@"<"];
            [string_setense02 appendFormat:@"%i", counterLeft];
            [string_setense02 appendString:@" LEFT>"];
        }
    }
    if(achivementIdx == 27){
       [string_setense01 setString:@"GET GRADE B"];
        [string_setense02 setString:@"IN  MINI GAME 06"];
    }
    if(achivementIdx == 28){
        [string_setense01 setString:@"GET GRADE A"];
        [string_setense02 setString:@"IN  MINI GAME 06"];
    }
    if(achivementIdx == 29){
       [string_setense01 setString:@"GET 700 SCORE"];
        [string_setense02 setString:@"IN  MINI GAME 06"];
    }
    
    
    //MINI 07
    if(achivementIdx == 30){
        counter = [[NSUserDefaults standardUserDefaults] integerForKey:@"counter_mini_11"];
        counterLeft = 800 - counter;
        
       [string_setense01 setString:@"BOMB 800 TURTLE SHELLS TOTAL"];
        [string_setense02 setString:@"IN  MINI GAME 07 "];
        
        if(counterLeft > 0){
            [string_setense02 appendString:@"<"];
            [string_setense02 appendFormat:@"%i", counterLeft];
            [string_setense02 appendString:@" LEFT>"];
        }
    }
    if(achivementIdx == 31){
        counter = [[NSUserDefaults standardUserDefaults] integerForKey:@"counter_mini_11"];
        counterLeft = 4000 - counter;
        
       [string_setense01 setString:@"BOMB 4000 TURTLE SHELLS TOTAL"];
        [string_setense02 setString:@"IN  MINI GAME 07 "];
        
        if(counterLeft > 0){
            [string_setense02 appendString:@"<"];
            [string_setense02 appendFormat:@"%i", counterLeft];
            [string_setense02 appendString:@" LEFT>"];
        }
    }
    if(achivementIdx == 32){
       [string_setense01 setString:@"GET GRADE B"];
        [string_setense02 setString:@"IN  MINI GAME 07"];
    }
    if(achivementIdx == 33){
        [string_setense01 setString:@"GET GRADE A"];
        [string_setense02 setString:@"IN  MINI GAME 07"];
    }
    if(achivementIdx == 34){
       [string_setense01 setString:@"GET 730 SCORE"];
        [string_setense02 setString:@"IN  MINI GAME 07"];
    }
    
    
    //MINI 08
    if(achivementIdx == 35){
        counter = [[NSUserDefaults standardUserDefaults] integerForKey:@"counter_mini_13"];
        counterLeft = 400 - counter;
        
       [string_setense01 setString:@"BOMB 400 TURTLE SHELLS TOTAL"];
        [string_setense02 setString:@"IN  MINI GAME 08 "];
        
        if(counterLeft > 0){
            [string_setense02 appendString:@"<"];
            [string_setense02 appendFormat:@"%i", counterLeft];
            [string_setense02 appendString:@" LEFT>"];
        }
    }
    if(achivementIdx == 36){
        counter = [[NSUserDefaults standardUserDefaults] integerForKey:@"counter_mini_13"];
        counterLeft = 3000 - counter;
        
       [string_setense01 setString:@"BOMB 3000 TURTLE SHELLS TOTAL"];
        [string_setense02 setString:@"IN  MINI GAME 08 "];
        
        if(counterLeft > 0){
            [string_setense02 appendString:@"<"];
            [string_setense02 appendFormat:@"%i", counterLeft];
            [string_setense02 appendString:@" LEFT>"];
        }
    }
    if(achivementIdx == 37){
       [string_setense01 setString:@"GET GRADE B"];
        [string_setense02 setString:@"IN  MINI GAME 08"];
    }
    if(achivementIdx == 38){
        [string_setense01 setString:@"GET GRADE A"];
        [string_setense02 setString:@"IN  MINI GAME 08"];
    }
    if(achivementIdx == 39){
       [string_setense01 setString:@"GET 900 SCORE"];
        [string_setense02 setString:@"IN  MINI GAME 08"];
    }
    
    
    //MINI 09
    if(achivementIdx == 40){
        counter = [[NSUserDefaults standardUserDefaults] integerForKey:@"counter_mini_103"];
        counterLeft = 400 - counter;
        
        [string_setense01 setString:@"BOMB 400 TURTLE SHELLS TOTAL"];
        [string_setense02 setString:@"IN  MINI GAME 09 "];
        
        if(counterLeft > 0){
            [string_setense02 appendString:@"<"];
            [string_setense02 appendFormat:@"%i", counterLeft];
            [string_setense02 appendString:@" LEFT>"];
        }
    }
    if(achivementIdx == 41){
        counter = [[NSUserDefaults standardUserDefaults] integerForKey:@"counter_mini_103"];
        counterLeft = 3000 - counter;
        
        [string_setense01 setString:@"BOMB 3000 TURTLE SHELLS TOTAL"];
        [string_setense02 setString:@"IN  MINI GAME 09 "];
        
        if(counterLeft > 0){
            [string_setense02 appendString:@"<"];
            [string_setense02 appendFormat:@"%i", counterLeft];
            [string_setense02 appendString:@" LEFT>"];
        }
    }
    if(achivementIdx == 42){
        [string_setense01 setString:@"GET GRADE B"];
        [string_setense02 setString:@"IN  MINI GAME 09"];
    }
    if(achivementIdx == 43){
        [string_setense01 setString:@"GET GRADE A"];
        [string_setense02 setString:@"IN  MINI GAME 09"];
    }
    if(achivementIdx == 44){
        [string_setense01 setString:@"GET 850 SCORE"];
        [string_setense02 setString:@"IN  MINI GAME 09"];
    }

    
    
    
    [string_achivementIdx setString:[NSString stringWithFormat:@"%i", achivementIdx+1]];
    
    firstSentenseChar = [string_setense01 UTF8String];
    secondSentenseChar = [string_setense02 UTF8String];
    achievementIdxChar = [string_achivementIdx UTF8String];

 
    printf("achivementIdx:%i\n",achivementIdx);
    
    
     int startToFuckIdx;
    
     int fontTexture_numInRow = 10;
     int fontTexture_offsetX = 12;
     int fontTexture_offsetY = 14;
    
    if(isIpad){
        fontTexture_offsetX *= 2;
        fontTexture_offsetY *= 2;
    }
    
    //static int fontTexture_startX = 0;
   // static int fontTexture_howmanyCol = 4;
    
     int fontTexture_chosenRow;
     int fontTexture_chosenCol;
    
    
     int sentense01_AccumOffset;
     int setense01_offsetX;
    sentense01_AccumOffset = 0;
    setense01_offsetX = 10 * 2/textureRatioForFuckingIpad;
    
    for (int i=0; firstSentenseChar[i]; i++){
        startToFuckIdx = firstSentenseChar[i] - 48;
        
        if(startToFuckIdx < 0){
            startToFuckIdx = 64 - 48 - 6;
            sentense01_AccumOffset -= 4 * 2/textureRatioForFuckingIpad;
        }
        if(firstSentenseChar[i] == 73){
            sentense01_AccumOffset -= 4 * 2/textureRatioForFuckingIpad;
        }
        
       // fontTexture_chosenCol = fontTexture_howmanyCol + 1;
        fontTexture_chosenCol = -1;
        do{
            
            fontTexture_chosenRow = startToFuckIdx;
            fontTexture_chosenCol++;
            
            startToFuckIdx -= fontTexture_numInRow;
        }while(startToFuckIdx >= 0);
        
       // printf(":%i\n",sentense01_AccumOffset);
        
        [l_detailsDialog_sentense01[i] setTextureRect:CGRectMake(fontTexture_chosenRow * fontTexture_offsetX, fontTexture_chosenCol * fontTexture_offsetY, fontTexture_offsetX, fontTexture_offsetY)];
        
        [l_detailsDialog_sentense01[i] setPosition:ccp(sentense01_AccumOffset + (posX - 103 * 2/textureRatioForFuckingIpad), posY-4 * 2/textureRatioForFuckingIpad)];
        sentense01_AccumOffset += setense01_offsetX;
    }
    
    sentense01_AccumOffset = 0;
    for (int i=0; secondSentenseChar[i]; i++){
        startToFuckIdx = secondSentenseChar[i] - 48;
        
        if(startToFuckIdx < 0){
            startToFuckIdx = 64 - 48 - 6;
            sentense01_AccumOffset -= 4 * 2/textureRatioForFuckingIpad;
        }
        
        if(secondSentenseChar[i] == 73){
            sentense01_AccumOffset -= 4 * 2/textureRatioForFuckingIpad;
        }
        
        // fontTexture_chosenCol = fontTexture_howmanyCol + 1;
        fontTexture_chosenCol = -1;
        do{
            
            fontTexture_chosenRow = startToFuckIdx;
            fontTexture_chosenCol++;
            
            startToFuckIdx -= fontTexture_numInRow;
        }while(startToFuckIdx >= 0);
        
       //  printf("TTTiii:%i\n",i);
        
        [l_detailsDialog_sentense02[i] setTextureRect:CGRectMake(fontTexture_chosenRow * fontTexture_offsetX, fontTexture_chosenCol * fontTexture_offsetY, fontTexture_offsetX, fontTexture_offsetY)];
        
        [l_detailsDialog_sentense02[i] setPosition:ccp(sentense01_AccumOffset + (posX - 103 * 2/textureRatioForFuckingIpad), posY-22 * 2/textureRatioForFuckingIpad)];
        sentense01_AccumOffset += setense01_offsetX;
    }
    
    
    sentense01_AccumOffset = 0;
    for (int i=0; achievementIdxChar[i]; i++){
        startToFuckIdx = achievementIdxChar[i] - 48;
        
        if(startToFuckIdx < 0){
            startToFuckIdx = 64 - 48 - 6;
            sentense01_AccumOffset -= 4 * 2/textureRatioForFuckingIpad;
        }
        
        // fontTexture_chosenCol = fontTexture_howmanyCol + 1;
        fontTexture_chosenCol = -1;
        do{
            
            fontTexture_chosenRow = startToFuckIdx;
            fontTexture_chosenCol++;
            
            startToFuckIdx -= fontTexture_numInRow;
        }while(startToFuckIdx >= 0);
        
        //  printf("TTTiii:%i\n",i);
        
        [l_achvementIdx[i] setTextureRect:CGRectMake(fontTexture_chosenRow * fontTexture_offsetX, fontTexture_chosenCol * fontTexture_offsetY, fontTexture_offsetX, fontTexture_offsetY)];
        
        [l_achvementIdx[i] setPosition:ccp(sentense01_AccumOffset + posX + 10 * 2/textureRatioForFuckingIpad,posY+16 * 2/textureRatioForFuckingIpad)];
        sentense01_AccumOffset += setense01_offsetX;
    }
    
}

-(void) checkToShowReward{
    
    static int rewardMoney;
    rewardMoney = ahievementReward[achivementIdx];
    
    [l_rewordNumber setString:[NSString stringWithFormat:@"%i", rewardMoney]];
    
    if(isShowingCompleted){
        [s_reward setPosition:ccp(posX + 110 * 2/textureRatioForFuckingIpad, posY+45 * 2/textureRatioForFuckingIpad)];
    }else{
        [s_reward setPosition:ccp(posX - 142 * 2/textureRatioForFuckingIpad, posY-38 * 2/textureRatioForFuckingIpad)];
    }
    
    [l_rewordNumber setPosition:ccp(s_reward.position.x, s_reward.position.y - 6)];
}

- (void) dealloc
{
	printf("AchivementPop Up Dealloc\n");
    
    [string_setense01 release];
    [string_setense02 release];
    [string_achivementIdx release];
 
	[super dealloc];
}

- (void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    printf("DDDDDDDDDD\n");
    
    if(!isShowingDetails){
        return;
    }
    
    for( UITouch *touch in touches ) {
		CGPoint location = [touch locationInView: [touch view]];
		location = [[CCDirector sharedDirector] convertToGL: location];
        
        if(location.x > posX + 160 * 2/textureRatioForFuckingIpad && location.x < posX + 220 * 2/textureRatioForFuckingIpad){
            if(location.y > posY + 10 * 2/textureRatioForFuckingIpad && location.y < posY + 80 * 2/textureRatioForFuckingIpad){
                [self removePopup];
            }
        }
        
         printf("SDFSDFDSFSDFDSFDSFSDFSDFDS:%4.8f %4.8f\n",location.x, location.y);
        
    }
}




@end
