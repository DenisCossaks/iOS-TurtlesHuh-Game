//
//  ScoreShownScene.m
//  TurtlesHuh
//
//  Created by  on 2012/5/21.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "ScoreShownScene.h"
#import "GamePlayGlobal.h"
#import "Global.h"

#import "SelectMinigameScene.h"
#import "PlayScene.h"
#import "NullScene.h"

#import "AppDelegate.h"

@implementation ScoreShownScene

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	ScoreShownScene *layer = [ScoreShownScene node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

-(void) getMultiplier{
    multipier = 1.0;
    
    if(maxCombo < 40){
        multipier = 1.0;
    }else if(maxCombo < 80){
        multipier = 1.5;
    }else if(maxCombo < 120){
        multipier = 2.0;
    }else if(maxCombo < 160){
        multipier = 2.5;
    }else if(maxCombo < 200){
        multipier = 3.0;
    }else if(maxCombo < 250){
        multipier = 3.5;
    }else if(maxCombo < 290){
        multipier = 4.0;
    }else if(maxCombo < 10020){
        multipier = 5.0;
    }
    
    if(currentChosenMiniGame == 1){
        multipier = 0.5;
        
        if(maxCombo < 100){
            multipier = 0.5;
        }else if(maxCombo < 150){
            multipier = 1.0;
        }else if(maxCombo < 200){
            multipier = 1.3;
        }else if(maxCombo < 250){
            multipier = 1.7;
        }else if(maxCombo < 300){
            multipier = 2;
        }else if(maxCombo < 350){
            multipier = 2.2;
        }else if(maxCombo < 400){
            multipier = 2.5;
        }else if(maxCombo < 10020){
            multipier = 3.0;
        }
    }
    
    if(currentChosenMiniGame == 2){
        multipier = 1.0;
        
        if(maxCombo < 10){
            multipier = 1.0;
        }else if(maxCombo < 15){
            multipier = 2.0;
        }else if(maxCombo < 20){
            multipier = 3.5;
        }else if(maxCombo < 25){
            multipier = 5;
        }else if(maxCombo < 30){
            multipier = 6.5;
        }else if(maxCombo < 35){
            multipier = 8.0;
        }else if(maxCombo < 40){
            multipier = 9.0;
        }else if(maxCombo < 45){
            multipier = 10.0;
        }else if(maxCombo < 50){
            multipier = 11.0;
        }else if(maxCombo < 55){
            multipier = 12.0;
        }else if(maxCombo < 60){
            multipier = 13.0;
        }else if(maxCombo < 65){
            multipier = 14.0;
        }else if(maxCombo < 99999){
            multipier = 16.0;
        }
    }
    
    if(currentChosenMiniGame == 3){
        multipier = 1.0;
        
        if(maxCombo < 100){
            multipier = 1.0;
        }else if(maxCombo < 150){
            multipier = 1.1;
        }else if(maxCombo < 200){
            multipier = 1.2;
        }else if(maxCombo < 250){
            multipier = 1.3;
        }else if(maxCombo < 300){
            multipier = 1.5;
        }else if(maxCombo < 350){
            multipier = 1.7;
        }else if(maxCombo < 400){
            multipier = 2.0;
        }else if(maxCombo < 10020){
            multipier = 3.0;
        }
    }
    
    if(currentChosenMiniGame == 4){
        multipier = 0.5;
        
        if(maxCombo < 30){
            multipier = 0.5;
        }else if(maxCombo < 50){
            multipier = 0.5;
        }else if(maxCombo < 80){
            multipier = 0.65;
        }else if(maxCombo < 100){
            multipier = 0.85;
        }else if(maxCombo < 150){
            multipier = 1.0;
        }else if(maxCombo < 200){
            multipier = 1.2;
        }else if(maxCombo < 250){
            multipier = 1.5;
        }else if(maxCombo < 300){
            multipier = 1.65;
        }else if(maxCombo < 350){
            multipier = 1.85;
        }else if(maxCombo < 400){
            multipier = 2.0;
        }else if(maxCombo < 450){
            multipier = 3.0;
        }
    }
    
    
    if(currentChosenMiniGame == 5){
        multipier = 1.0;
        
        if(maxCombo < 40){
            multipier = 1.0;
        }else if(maxCombo < 80){
            multipier = 1.5;
        }else if(maxCombo < 120){
            multipier = 2.0;
        }else if(maxCombo < 160){
            multipier = 2.5;
        }else if(maxCombo < 200){
            multipier = 3.0;
        }else if(maxCombo < 250){
            multipier = 3.5;
        }else if(maxCombo < 290){
            multipier = 4.0;
        }else if(maxCombo < 10020){
            multipier = 5.0;
        }
    }
    
    if(currentChosenMiniGame == 10){
        multipier = 1.0;
        
        if(maxCombo < 40){
            multipier = 1.0;
        }else if(maxCombo < 60){
            multipier = 1.5;
        }else if(maxCombo < 80){
            multipier = 2.0;
        }else if(maxCombo < 100){
            multipier = 2.5;
        }else if(maxCombo < 140){
            multipier = 3.0;
        }else if(maxCombo < 160){
            multipier = 4.0;
        }else if(maxCombo < 180){
            multipier = 5.0;
        }else if(maxCombo < 10020){
            multipier = 6.0;
        }
        
        multipier += 1;
    }
    
    if(currentChosenMiniGame == 11){
        multipier = 1.0;
        
        if(maxCombo < 50){
            multipier = 0.3;
        }else if(maxCombo < 100){
            multipier = 0.6;
        }else if(maxCombo < 130){
            multipier = 0.65;
        }else if(maxCombo < 160){
            multipier = 0.9;
        }else if(maxCombo < 200){
            multipier = 1.0;
        }else if(maxCombo < 250){
            multipier = 1.5;
        }else if(maxCombo < 300){
            multipier = 2.0;
        }else if(maxCombo < 10020){
            multipier = 3.0;
        }
    }
    
    if(currentChosenMiniGame == 13){
        multipier = 1.0;
        
        if(maxCombo < 100){
            multipier = 1.4;
        }else if(maxCombo < 140){
            multipier = 1.7;
        }else if(maxCombo < 170){
            multipier = 2.0;
        }else if(maxCombo < 200){
            multipier = 2.2;
        }else if(maxCombo < 250){
            multipier = 2.5;
        }else if(maxCombo < 300){
            multipier = 3.0;
        }else if(maxCombo < 40000){
            multipier = 4.0;
        }
    }
}

-(void) gainAchivementCoin{
    if(hasGainedAchivementCoin){
        return;
    }
    
    hasGainedAchivementCoin = true;
    
    static int coinFromAchivement;
    static int currentShownIdx;
    coinFromAchivement = 0;
    currentShownIdx = 0;
    if(howmanyCompletedWillBeShown != 0){
        do{
            coinFromAchivement += ahievementReward[showCompletedIdx[currentShownIdx]];
            
            currentShownIdx++;
        }while(currentShownIdx < howmanyCompletedWillBeShown);
    }
    
    turtleCoinAccum += coinFromAchivement;
    [self setCoinAniForRewardAtX:445 Y:270];
}

-(bool) checkToShowThisAchivementToBeUnlboked:(int)_achivementIdx{
    if(_achivementIdx == 0){
        save_unblockAchivementIdx[save_unblockCurrentIdx] = _achivementIdx;
        save_unblockCurrentIdx++;
        return true;
    }
    if(_achivementIdx == 2){
        save_unblockAchivementIdx[save_unblockCurrentIdx] = _achivementIdx;
        save_unblockCurrentIdx++;
        return true;
    }
    
    return false;
}

-(void) initHowmanyCompletedWIllBeShown{
    howmanyCompletedWillBeShown = 0;
    showCompletedCurrentTimer = 0;
    showCompletedCurrentIdx = 0;
    isShowingCompleted = false;
    
    for(int i = 0 ; i < howmanyAchivement ; i++){
        achivementHasUnblockedBeforeFuckingLongTimeAgo[i] = false;
        
        if(!achivementHasUnblocked[i]){
            if([self checkToShowThisAchivementToBeUnlboked:achivementIdx[i]]){
                achivementHasUnblockedBeforeFuckingLongTimeAgo[i] = true;
                showCompletedIdx[howmanyCompletedWillBeShown] = achivementIdx[i];
                showCompletedIdxReferToPositionIdx[howmanyCompletedWillBeShown] = i;
                howmanyCompletedWillBeShown++;
                isShowingCompleted = true;
            }
        }
    }
    
    if(howmanyCompletedWillBeShown != 0){
        //[self showNextPopup];
        showCompletedCurrentTimer = -20;
    }
    
}

-(void) manageShowCompletedAchivement{
    if(howmanyCompletedWillBeShown <= 0){
        return;
    }
    
    [achivementPopup manageCompleteV2];
    
    showCompletedCurrentTimer++;
    if(showCompletedCurrentTimer == 1){
        if(showCompletedCurrentIdx < howmanyCompletedWillBeShown){
            [self showNextPopup];
            showCompletedCurrentTimer = 0;
        }else{
            isShowingCompleted = false;
        }
    }
}

-(void) showNextPopup{
    [achivementPopup popupAchivementCompleted:showCompletedIdx[showCompletedCurrentIdx] posX:iconPosX[showCompletedIdxReferToPositionIdx[showCompletedCurrentIdx]] posY:iconPosY];
    
    turtleCoinForReward_X = iconPosX[showCompletedCurrentIdx];
    turtleCoinForReward_Y = iconPosY;
   // [self setTurtleCoinAniForReward];
    
    showCompletedCurrentIdx++;
}

-(void) setCoinAniForRewardAtX:(float)_x Y:(float)_y{
    printf("setCoinAniForRewardAtX:%4.8f %4.8f\n",_x,_y);
    turtleCoinForReward_X = _x;
    turtleCoinForReward_Y = _y;
    [self setTurtleCoinAniForReward];
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
        
        save_unblockAchivementIdx[0] = -1;
        save_unblockAchivementIdx[1] = -1;
        save_unblockAchivementIdx[2] = -1;
        save_unblockAchivementIdx[3] = -1;
        save_unblockCurrentIdx = 0;
        
        AppDelegate *appDelegate =(AppDelegate*) [[UIApplication sharedApplication] delegate];
        [appDelegate getAchivementValues];
        
       // [musicController initForNull];
        isPoppingUp = false;
        self.isTouchEnabled = YES;
        
        hasGainedAchivementCoin = false;
        isRunning = true;
        hasClickedToStop = false;
        
       //currentTurtleCoin = 59;
       // maxCombo = 59;
       // currentChosenMiniGame = 2;
        
        badge_letterScale = 1.0;
        
        CCSprite* s_bg = [CCSprite spriteWithFile:@"ScoreShown_bg.png"];
        [s_bg setPosition:ccp(240,160)];
        [self addChild:s_bg];
        
        numTapped = currentTurtleCoin;
        startUpdatingDigits = false;
        
        [self getValuesFromDB];
        [self getMultiplier];
        [self getScoreAndGrade];
        [self initMenu];
        [self initGradeBar];
        [self initLetters];
        [self initGradeBadge];
        [self initTurtleCoinAniStruct];
        [self initAchivements];
        [self initAchivementPopup];
        [self initHowmanyCompletedWIllBeShown];
        
        detectChangeGradebarPercentage = 16.6666667;
        finalUpdateTimer = 0;
        startUpdatingDigits = false;
        isGoingToUpdateDigitsTimer = 0;
        [self schedule: @selector(gameStep:)];
        
        [self saveToDB];
        
    }
	return self;
}

-(void) showAchivementPopup{
    isPoppingUp = true;

    [achivementPopup setX:240];
    [achivementPopup setY:100];
    
   // printf("show generalAchviementPosIdx:%i\n",generalAchviementPosIdx);
    [achivementPopup popupAchivementDetails:achivementSelectIdx arrowIsUp:false arrowX:iconPosX[generalAchviementPosIdx]-235];
}


-(void) initAchivementPopup{
    achivementPopup = [AchivementPopup node];
    [self addChild:achivementPopup];
    [achivementPopup setDelegate:self];
}

-(void) initAchivements{
    howmanyAchivement = 4;
    
    achivementIdx[0] = 0;
    achivementIdx[1] = 1;
    achivementIdx[2] = 2;
    achivementIdx[3] = 6;
    
    NSMutableString* achivementString = [NSMutableString string];
    for(int i = 0 ; i < howmanyAchivement ; i++){
        
        [achivementString setString:@"achivement_"];
        
        if(i < 9){
            [achivementString appendString:@"0"];
        }
        
        [achivementString appendFormat:@"%i", achivementIdx[i]+1];
        
        // NSLog(achivementString);
        achivementHasUnblocked[i] = [[NSUserDefaults standardUserDefaults] boolForKey:achivementString];
        
    }
    
    
    
    static int iconStartX = 150;
    static int iconStartY = 28;
    static int iconOffsetX = 60;
    
    
    for(int i = 0 ; i < 4 ; i++){
        s_icon[i] = [CCSprite spriteWithFile:@"AchievementIcon_blockedBg.png"];
        [self addChild:s_icon[i]];
        [s_icon[i] setPosition:ccp(10000,10000)];
        
        iconPosX[i] = iconStartX + iconOffsetX * i;
        iconPosY = iconStartY;
      
        s_icon_bg[i] = [CCSprite spriteWithFile:@"AchievementIcon_blockedBg.png"];
        [self addChild:s_icon_bg[i]];
        [s_icon_bg[i] setPosition:ccp( iconPosX[i], iconPosY)];
    }
}

-(void) initGradeBadge{
    s_gradeBadge = [CCSprite spriteWithFile:@"ScoreShown_Badge.png"];
    s_badge_letter[kGrade_F] = [CCSprite spriteWithFile:@"ScoreShown_Badge_F.png"];
    s_badge_letter[kGrade_E] = [CCSprite spriteWithFile:@"ScoreShown_Badge_E.png"];
    s_badge_letter[kGrade_D] = [CCSprite spriteWithFile:@"ScoreShown_Badge_D.png"];
    s_badge_letter[kGrade_C] = [CCSprite spriteWithFile:@"ScoreShown_Badge_C.png"];
    s_badge_letter[kGrade_B] = [CCSprite spriteWithFile:@"ScoreShown_Badge_B.png"];
    s_badge_letter[kGrade_A] = [CCSprite spriteWithFile:@"ScoreShown_Badge_A.png"];
    s_badge_letter[kGrade_S] = [CCSprite spriteWithFile:@"ScoreShown_Badge_S.png"];
    
    isChangingBadgeGrade = false;
    
    [self addChild:s_gradeBadge];
    
    for(int i = 0 ; i < 7 ; i++){
        [s_badge_letter[i] setPosition:ccp(155500,10000)];
        [self addChild:s_badge_letter[i]];
    }
    
    badge_startX = 83;
    badge_x = badge_startX;
    badge_y = 125;
    
    badge_letterIdx = 0;
    badge_prevousLetterIdx = -1;
    badge_scale = 1.0;
    
    badge_letterIdx = kGrade_F;
    [s_gradeBadge setPosition:ccp(badge_x,badge_y)];
    [s_badge_letter[badge_letterIdx] setPosition:ccp(badge_x,badge_y)];
   
}

-(void) initLetters{
    l_score = [CCLabelAtlas labelWithString:@"0" charMapFile:@"fontV2.png" itemWidth:22 itemHeight:27 startCharMap:'0'];
    l_turtleTapped = [CCLabelAtlas labelWithString:@"0" charMapFile:@"fontV2.png" itemWidth:22 itemHeight:27 startCharMap:'0'];
    l_combo = [CCLabelAtlas labelWithString:@"0" charMapFile:@"fontV1.png" itemWidth:12 itemHeight:14 startCharMap:'0'];
    l_bestScore = [CCLabelAtlas labelWithString:@"0" charMapFile:@"fontV1.png" itemWidth:12 itemHeight:14 startCharMap:'0'];
    l_bestGrade = [CCLabelAtlas labelWithString:@"0" charMapFile:@"fontV1.png" itemWidth:12 itemHeight:14 startCharMap:'0'];
    l_totalCoin = [CCLabelAtlas labelWithString:@"0" charMapFile:@"fontV3.png" itemWidth:17 itemHeight:21 startCharMap:'0'];
    l_multiplier_FirstDigit = [CCLabelAtlas labelWithString:@"0" charMapFile:@"fontV2.png" itemWidth:22 itemHeight:27 startCharMap:'0'];
    l_multiplier_SecondDigit = [CCLabelAtlas labelWithString:@"0" charMapFile:@"fontV2.png" itemWidth:22 itemHeight:27 startCharMap:'0'];
    l_multiplier_Dot = [CCSprite spriteWithFile:@"ScoreShown_multiplierDot.png"];
    
    [l_combo setColor:ccc3(48, 94, 173)];
    [l_bestScore setColor:ccc3(48, 94, 173)];
    [l_bestGrade setColor:ccc3(48, 94, 173)];
    
   // [l_bestScore setAnchorPoint:ccp(1,0.5)];
    
    [l_score setPosition:ccp(332,215)];
     [l_turtleTapped setPosition:ccp(129,215)];
     [l_combo setPosition:ccp(218,245)];
     [l_bestScore setPosition:ccp(350,181)];
     [l_bestGrade setPosition:ccp(367,181)];
     [l_totalCoin setPosition:ccp(447,255)];
     [l_multiplier_FirstDigit setPosition:ccp(195,215)];
     [l_multiplier_SecondDigit setPosition:ccp(225,215)];
     [l_multiplier_Dot setPosition:ccp(220,223)];
    
    [l_score setAnchorPoint:ccp(0.5,0)];
    [l_turtleTapped setAnchorPoint:ccp(0.5,0)];
    [l_combo setAnchorPoint:ccp(0.5,0)];
    [l_bestGrade setAnchorPoint:ccp(0.5,0)];
    [l_totalCoin setAnchorPoint:ccp(0.5,0)];
    [l_bestScore setAnchorPoint:ccp(1.0,0)];
    
    [l_turtleTapped setScale:0.85];
    [l_multiplier_FirstDigit setScale:0.85];
    [l_multiplier_SecondDigit setScale:0.85];
    
    [self addChild:l_score];
    [self addChild:l_turtleTapped];
    [self addChild:l_combo];
    [self addChild:l_bestScore];
    [self addChild:l_bestGrade];
    [self addChild:l_totalCoin];
    [self addChild:l_multiplier_FirstDigit];
    [self addChild:l_multiplier_SecondDigit];
    [self addChild:l_multiplier_Dot];
    
    [self updateLetters];

}

-(void) gameStep:(ccTime) dt{
    
    
    if(!startUpdatingDigits){
        isGoingToUpdateDigitsTimer++;
        if(isGoingToUpdateDigitsTimer == 25){
            startUpdatingDigits = true;
        }
        
        return;
    }
    [self updateGradeBar];
    [self updateScoreAndCoin];
    [self updateLetters];
    [self udpateBadge];
    [self turtleCoinAniManage];
    [self turtleCoinAniManageForReward];
    
    [self manageShowCompletedAchivement];
}

-(void) udpateBadge{
    badge_x = badge_startX + 307 * gradeBarPercentage/100;
    
    if(isChangingBadgeGrade){
        if(chaningBadeGradeTimer < 4){
            badge_scale += 0.035;
        }else{
            badge_scale += ( 1.0 - badge_scale)/3;
        }
        
        badge_previousLetterScale+= 0.11;
        badge_previousLetterOpacity -= 25;
        
        if(badge_previousLetterOpacity < 0){
            badge_previousLetterOpacity = 0;
        }
        
        badge_letterScale += 0.12;
        if(badge_letterScale > 1){
            badge_letterScale = 1;
        }
        
        chaningBadeGradeTimer++;
    }
    
    for(int i = 0 ; i < 7 ; i++){
        [s_badge_letter[i] setPosition:ccp(10000,10000)];
    }
    
    [s_gradeBadge setPosition:ccp(badge_x, badge_y)];
    [s_gradeBadge setScale:badge_scale];
    
    if(badge_prevousLetterIdx != -1){
        [s_badge_letter[badge_prevousLetterIdx] setPosition:ccp(badge_x, badge_y)];
        [s_badge_letter[badge_prevousLetterIdx] setScale:badge_previousLetterScale];
        [s_badge_letter[badge_prevousLetterIdx] setOpacity:badge_previousLetterOpacity];
    }
    
    if(badge_letterIdx < 7){
       // printf("AAAA:%i\n", badge_letterIdx);
        [s_badge_letter[badge_letterIdx] setPosition:ccp(badge_x, badge_y)];
        [s_badge_letter[badge_letterIdx] setScale:badge_letterScale];
        [s_badge_letter[badge_letterIdx] setOpacity:255];
    }
    
    //printf("displayScore:%i %i %i\n",displayScore,scoreLimitToGrade[badge_letterIdx],badge_letterIdx);
    //printf("gradeBarPercentage:%4.8f %4.8f %4.8f\n",gradeBarPercentage,detectChangeGradebarPercentage, gradeBarMaxPercentage);
    if(gradeBarPercentage > detectChangeGradebarPercentage){
        detectChangeGradebarPercentage += 16.6666667;
        isChangingBadgeGrade = true;
        chaningBadeGradeTimer = 0;
        badge_prevousLetterIdx = badge_letterIdx;
        badge_letterIdx++;
        badge_previousLetterScale = 1.0;
        badge_letterScale = 0.0;
        badge_scale = 1.0;
        badge_previousLetterOpacity = 255;
        [self setTurtleCoinAni];
    }
}

-(void) updateLetters{
    [l_score setString:[NSString stringWithFormat:@"%i", displayScore]];
   // printf("numTapped:%i\n",numTapped);
    [l_turtleTapped setString:[NSString stringWithFormat:@"%i", numTapped]];
    [l_combo setString:[NSString stringWithFormat:@"%i", maxCombo]];
    [l_bestScore setString:[NSString stringWithFormat:@"%i", bestScore]];
    
    if(bestGrade == kGrade_F){
        if(bestScore == 0){
            [l_bestGrade setString:[NSString stringWithString:@"X"]];
        }else{
            [l_bestGrade setString:[NSString stringWithString:@"F"]];
        }
    }
    
    if(bestGrade == kGrade_E){
        [l_bestGrade setString:[NSString stringWithString:@"E"]];
    }  
    if(bestGrade == kGrade_D){
        [l_bestGrade setString:[NSString stringWithString:@"D"]];
    } 
    if(bestGrade == kGrade_C){
        [l_bestGrade setString:[NSString stringWithString:@"C"]];
    } 
    if(bestGrade == kGrade_B){
        [l_bestGrade setString:[NSString stringWithString:@"B"]];
    } 
    if(bestGrade == kGrade_A){
        [l_bestGrade setString:[NSString stringWithString:@"A"]];
    } 
    if(bestGrade == kGrade_S){
        [l_bestGrade setString:[NSString stringWithString:@"S"]];
    } 
    if(bestGrade == kGrade_SS){
        [l_bestGrade setString:[NSString stringWithString:@"SS"]];
    } 
    
    
    [l_totalCoin setString:[NSString stringWithFormat:@"%i", displayTurtleCoin]];
    
    static float multiplierUseForCal;
    
    if(multipier < 10){
        multiplierUseForCal = multipier * 10;
        multipier_FirstDigit = multiplierUseForCal / 10;
        multipier_SecondDigit = multiplierUseForCal - multipier_FirstDigit * 10;
    }else{
        multiplierUseForCal = multipier;
        multipier_FirstDigit = multipier / 10;
        multipier_SecondDigit =multipier - multipier_FirstDigit * 10;
        
        [l_multiplier_Dot setPosition:ccp(2999920,223)];
        
        [l_multiplier_FirstDigit setPosition:ccp(195+5,215)];
        [l_multiplier_SecondDigit setPosition:ccp(225-5,215)];
    }
    
      
    [l_multiplier_FirstDigit setString:[NSString stringWithFormat:@"%i", multipier_FirstDigit]];
    [l_multiplier_SecondDigit setString:[NSString stringWithFormat:@"%i", multipier_SecondDigit]];
}

-(void) updateGradeBar{
    //gradeBarPercentage += (gradeBarMaxPercentage - gradeBarPercentage)/20;
    
    static float diffGradePercentage;
    static float applyGradeInterval;
    diffGradePercentage = gradeBarMaxPercentage - gradeBarPercentage;
    if(diffGradePercentage > 80){
        applyGradeInterval = 0.9;
    }else if(diffGradePercentage > 60){
        applyGradeInterval = 0.75;
    }else if(diffGradePercentage > 40){
        applyGradeInterval = 0.6;
    }else if(diffGradePercentage > 22){
        applyGradeInterval = 0.5;
    }else if(diffGradePercentage > 12){
        applyGradeInterval = 0.4;
    }else{
        applyGradeInterval = 0.3;
    }
    
    applyGradeInterval *= 0.8;
    
    if(diffGradePercentage < 7){
        gradeBarPercentage += (gradeBarMaxPercentage - gradeBarPercentage)/30;
        
        finalUpdateTimer++;
        if(finalUpdateTimer == 90){
            gradeBarPercentage = gradeBarMaxPercentage;
            isRunning = false;
        }
        
    }else{
        gradeBarPercentage += applyGradeInterval;
    }
    
    if(gradeBarPercentage > gradeBarMaxPercentage){
        gradeBarPercentage = gradeBarMaxPercentage;
    }
    
    [s_gradeBar_center setScaleX:gradeBarPercentage/100.0];
}

-(void) updateScoreAndCoin{
    displayScore = gradeBarPercentage / gradeBarMaxPercentage * score;
    displayTurtleCoin = gradeBarPercentage / gradeBarMaxPercentage * score/10 + turtleCoinAccum;
    
   // displayTurtleCoin += (finalTurtleCoin - displayTurtleCoin)/20;
   // displayScore += (score - displayScore)/20;
}


-(void) getValuesFromDB{
    turtleCoinAccum =  [[NSUserDefaults standardUserDefaults] integerForKey:@"turtleCoin"];
    
    
    
    NSMutableString* scoreString = [NSMutableString string];
    
    [scoreString setString:@"score_mini_"];
    
    if(currentChosenMiniGame < 9){
        [scoreString appendString:@"0"];
    }
    
    [scoreString appendFormat:@"%i", currentChosenMiniGame+1];
    bestScore =  [[NSUserDefaults standardUserDefaults] integerForKey:scoreString];
      
    
}

-(void) initGradeBar{
    
    s_gradeBar_left = [CCSprite spriteWithFile:@"ScoreShown_redbar_left.png"];
    s_gradeBar_center = [CCSprite spriteWithFile:@"ScoreShown_redbar_center.png"];
    s_gradeBar_highlight = [CCSprite spriteWithFile:@"ScoreShown_highlight.png"];
    
    [s_gradeBar_center setAnchorPoint:ccp(0,0.5)];
    
    [s_gradeBar_left setPosition:ccp(83,125)];
    [s_gradeBar_center setPosition:ccp(93,125)];
    [s_gradeBar_highlight setPosition:ccp(240,160)];
    
    [self addChild:s_gradeBar_left];
    [self addChild:s_gradeBar_center];
    [self addChild:s_gradeBar_highlight];
    
    [s_gradeBar_center setScaleX:0];
}

-(void) initMenu{
    CCMenuItem *mMenu = [CCMenuItemImage itemFromNormalImage:@"ScoreShown_btn_menu_off.png" selectedImage:@"ScoreShown_btn_menu_on.png" target:self selector:@selector(mMenuCallback:)];
    
	CCMenuItem *mRestart = [CCMenuItemImage itemFromNormalImage:@"ScoreShown_btn_restart_off.png" selectedImage:@"ScoreShown_btn_restart_on.png" target:self selector:@selector(mRestartCallback:)];
	

	[mMenu setPosition:ccp(-200, -122)];
    [mRestart setPosition:ccp(200, -122)];
    
	CCMenu* menu = [CCMenu menuWithItems:mMenu,mRestart, nil];
	[self addChild:menu];
}

-(void) mRestartCallback: (id) sender{
    if(isPoppingUp){
        return;
    }
    
    if(isShowingCompleted){
        [self clickToStopCompleted];
        return;
    }
    
    if(isRunning){
        [self clickToStop];
        return;
    }
    
   // goToNullWithNewPlayMusic = true;
    [[CCDirector sharedDirector] replaceScene: [NullScene scene]];
}

-(void) mMenuCallback: (id) sender{
    if(isPoppingUp){
        return;
    }
    
    if(isShowingCompleted){
        [self clickToStopCompleted];
        return;
    }
    
    if(isRunning){
        [self clickToStop];
        return;
    }
    
    [[CCDirector sharedDirector] replaceScene: [SelectMinigameScene scene]];
}

-(void) clickToStopCompleted{
    showCompletedCurrentIdx++;
    showCompletedCurrentTimer = 0;
    
    if(showCompletedCurrentIdx == howmanyCompletedWillBeShown){
        [achivementPopup setX:99999];
        isShowingCompleted = false;
    }else{
        //[achivementPopup popupAchivementCompleted:achivementIdx[showCompletedCurrentIdx]];
        [self showNextPopup];
    }
}

-(void) clickToStop{
    gradeBarPercentage = gradeBarMaxPercentage;
    isRunning = false;
}

-(void) getScoreAndGrade{
    score = numTapped * multipier;
    displayTurtleCoin = turtleCoinAccum;
    finalTurtleCoin = turtleCoinAccum + score;
    
    scoreLimitToGrade[0] = 80;
    scoreLimitToGrade[1] = 150;
    scoreLimitToGrade[2] = 250;
    scoreLimitToGrade[3] = 400;
    scoreLimitToGrade[4] = 630;
    scoreLimitToGrade[5] = 800;
    
    if(currentChosenMiniGame == 1){
        scoreLimitToGrade[0] = 50;
        scoreLimitToGrade[1] = 150;
        scoreLimitToGrade[2] = 300;
        scoreLimitToGrade[3] = 500;
        scoreLimitToGrade[4] = 800;
        scoreLimitToGrade[5] = 1050;
    }
    if(currentChosenMiniGame == 2){
        scoreLimitToGrade[0] = 40;
        scoreLimitToGrade[1] = 150;
        scoreLimitToGrade[2] = 280;
        scoreLimitToGrade[3] = 400;
        scoreLimitToGrade[4] = 600;
        scoreLimitToGrade[5] = 800;
    }
    if(currentChosenMiniGame == 3){
        scoreLimitToGrade[0] = 50;
        scoreLimitToGrade[1] = 150;
        scoreLimitToGrade[2] = 300;
        scoreLimitToGrade[3] = 450;
        scoreLimitToGrade[4] = 600;
        scoreLimitToGrade[5] = 800;
    }
    if(currentChosenMiniGame == 4){
        scoreLimitToGrade[0] = 50;
        scoreLimitToGrade[1] = 150;
        scoreLimitToGrade[2] = 250;
        scoreLimitToGrade[3] = 400;
        scoreLimitToGrade[4] = 600;
        scoreLimitToGrade[5] = 900;
    }
    if(currentChosenMiniGame == 5){
        scoreLimitToGrade[0] = 80;
        scoreLimitToGrade[1] = 150;
        scoreLimitToGrade[2] = 250;
        scoreLimitToGrade[3] = 400;
        scoreLimitToGrade[4] = 630;
        scoreLimitToGrade[5] = 800;
    }
    if(currentChosenMiniGame == 10){
        scoreLimitToGrade[0] = 80;
        scoreLimitToGrade[1] = 140;
        scoreLimitToGrade[2] = 220;
        scoreLimitToGrade[3] = 320;
        scoreLimitToGrade[4] = 450;
        scoreLimitToGrade[5] = 700;
    }
    if(currentChosenMiniGame == 11){
        scoreLimitToGrade[0] = 70;
        scoreLimitToGrade[1] = 120;
        scoreLimitToGrade[2] = 230;
        scoreLimitToGrade[3] = 350;
        scoreLimitToGrade[4] = 530;
        scoreLimitToGrade[5] = 780;
    }
    if(currentChosenMiniGame == 13){
        scoreLimitToGrade[0] = 50;
        scoreLimitToGrade[1] = 120;
        scoreLimitToGrade[2] = 250;
        scoreLimitToGrade[3] = 400;
        scoreLimitToGrade[4] = 650;
        scoreLimitToGrade[5] = 840;
    }
    
    if(score < scoreLimitToGrade[0]){
        grade = kGrade_F;
        gradeBarMaxPercentage = 0;
        gradeBarMaxPercentage +=  score/scoreLimitToGrade[0] * 16.6666667;
    }else if(score < scoreLimitToGrade[1]){
        grade = kGrade_E;
        gradeBarMaxPercentage = 16.6666667;
        gradeBarMaxPercentage += (score - scoreLimitToGrade[0])/(scoreLimitToGrade[1] - scoreLimitToGrade[0]) * 16.6666667;
    }else if(score < scoreLimitToGrade[2]){
        grade = kGrade_D;
        gradeBarMaxPercentage = 33.3333333;
        gradeBarMaxPercentage += (score - scoreLimitToGrade[1])/(scoreLimitToGrade[2] - scoreLimitToGrade[1]) * 16.6666667;
    }else if(score < scoreLimitToGrade[3]){
        grade = kGrade_C;
        gradeBarMaxPercentage = 50;
        gradeBarMaxPercentage += (score - scoreLimitToGrade[2])/(scoreLimitToGrade[3] - scoreLimitToGrade[2]) * 16.6666667;
    }else if(score < scoreLimitToGrade[4]){
        grade = kGrade_B;
        gradeBarMaxPercentage = 66.6666667;
        gradeBarMaxPercentage += (score - scoreLimitToGrade[3])/(scoreLimitToGrade[4] - scoreLimitToGrade[3]) * 16.6666667;
    }else if(score < scoreLimitToGrade[5]){
        grade = kGrade_A;
        gradeBarMaxPercentage = 83.3333333;
        gradeBarMaxPercentage += (score - scoreLimitToGrade[4])/(scoreLimitToGrade[5] - scoreLimitToGrade[4]) * 16.6666667;
    }else{
        grade = kGrade_S;
        gradeBarMaxPercentage = 100;
    }
    
    if(bestScore < scoreLimitToGrade[0]){
        bestGrade = kGrade_F;
    }else if(bestScore < scoreLimitToGrade[1]){
        bestGrade = kGrade_E;
    }else if(bestScore < scoreLimitToGrade[2]){
        bestGrade = kGrade_D;
    }else if(bestScore < scoreLimitToGrade[3]){
        bestGrade = kGrade_C;
    }else if(bestScore < scoreLimitToGrade[4]){
        bestGrade = kGrade_B;
    }else if(bestScore < scoreLimitToGrade[5]){
        bestGrade = kGrade_A;
    }else{
        bestGrade = kGrade_S;
    }

    
    gradeBarPercentage = 0;
    
    
    printf("gradeBarMaxPercentage:%4.8f\n",gradeBarMaxPercentage);
    
 
    
}

- (void) dealloc
{
	printf("ScoreShown Scene Dealloc\n");
	[super dealloc];
}

-(void) initTurtleCoinAniStruct{
    turtleCoinAniStruct = malloc(sizeof(eTurtleCoinAniStruct2));
    turtleCoinAniStruct->numElements = 10;
    turtleCoinAniStruct->aniTimer = 0;
    turtleCoinAniStruct->isAni = false;
    
    for(int i = 0 ; i < turtleCoinAniStruct->numElements ; i++){
        turtleCoinAniStruct->s_graphic[i] = [CCSprite spriteWithFile:@"ScoreShown_Badge_Shine.png"];
        turtleCoinAniStruct->posX[i] = 99999;
        
        [self addChild:turtleCoinAniStruct->s_graphic[i]];
        [turtleCoinAniStruct->s_graphic[i] setPosition:ccp(10000,10000)];
    }
    
    turtleCoinAniStructForReward = malloc(sizeof(eTurtleCoinAniStruct2));
    turtleCoinAniStructForReward->numElements = 10;
    turtleCoinAniStructForReward->aniTimer = 0;
    turtleCoinAniStructForReward->isAni = false;
    
    for(int i = 0 ; i < turtleCoinAniStructForReward->numElements ; i++){
        turtleCoinAniStructForReward->s_graphic[i] = [CCSprite spriteWithFile:@"ScoreShown_Badge_Shine.png"];
        turtleCoinAniStructForReward->posX[i] = 99999;
        
        [self addChild:turtleCoinAniStructForReward->s_graphic[i] z:kDeapth_Turtle_Bombing2];
        [turtleCoinAniStructForReward->s_graphic[i] setPosition:ccp(10000,10000)];
    }
}

-(void) turtleCoinAniManage{
    
    if(!turtleCoinAniStruct->isAni){
        return;
    }
    
    // printf("turtleCoinAniManage:%i\n",turtleCoinAniStruct->aniTimer);
    
    if( turtleCoinAniStruct->aniTimer > 26){
        turtleCoinAniStruct->aniTimer++;
        if( turtleCoinAniStruct->aniTimer > 26){
            turtleCoinAniStruct->isAni = false;
            for(int i = 0 ; i < turtleCoinAniStruct->numElements ; i++){
                [turtleCoinAniStruct->s_graphic[i] setPosition:ccp(10000,10000)];
            }
        }
        return;
    }
    
    static int ranNumber;
    
    if(turtleCoinAniStruct->aniTimer == 0){
        for(int i = 0 ; i <  turtleCoinAniStruct->numElements ; i++){
            ranNumber = arc4random()%100;
            turtleCoinAniStruct->vx[i] = (float)ranNumber/50.0;
            ranNumber = arc4random()%100;
            turtleCoinAniStruct->vy[i] = (float)ranNumber/30.0;
            ranNumber = arc4random()%100;
            turtleCoinAniStruct->rv[i] = (float)ranNumber/50.0;
            
            ranNumber = arc4random()%100;
            turtleCoinAniStruct->ov[i] = (float)ranNumber/20.0 + 10.0;
            
            if(arc4random()%2 == 0){
                turtleCoinAniStruct->rv[i] *= -1;
                turtleCoinAniStruct->vx[i] *= -1;
            }
            
            turtleCoinAniStruct->posX[i] = badge_x;
            turtleCoinAniStruct->posY[i] = badge_y;
            
            turtleCoinAniStruct->opacity[i] = 255;
            [turtleCoinAniStruct->s_graphic[i] setScale:2.0];
        }
    }
    
    for(int i = 0 ; i <  turtleCoinAniStruct->numElements ; i++){
        [turtleCoinAniStruct->s_graphic[i] setPosition:ccp(turtleCoinAniStruct->posX[i], turtleCoinAniStruct->posY[i])];
        [turtleCoinAniStruct->s_graphic[i] setOpacity:turtleCoinAniStruct->opacity[i]];
        
        turtleCoinAniStruct->posX[i] += turtleCoinAniStruct->vx[i];
        turtleCoinAniStruct->posY[i] += turtleCoinAniStruct->vy[i];
        turtleCoinAniStruct->opacity[i] -= turtleCoinAniStruct->ov[i];
        
        if(turtleCoinAniStruct->opacity[i] < 0 ){
            turtleCoinAniStruct->opacity[i] = 0;
        }
        
        turtleCoinAniStruct->vy[i] -= 0.2;
    }
    
    
    turtleCoinAniStruct->aniTimer++;
}

-(void) turtleCoinAniManageForReward{
  
    
    if(!turtleCoinAniStructForReward->isAni){
        return;
    }

    if( turtleCoinAniStructForReward->aniTimer > 26){
        turtleCoinAniStructForReward->aniTimer++;
        if( turtleCoinAniStructForReward->aniTimer > 26){
            turtleCoinAniStructForReward->isAni = false;
            for(int i = 0 ; i < turtleCoinAniStructForReward->numElements ; i++){
                [turtleCoinAniStructForReward->s_graphic[i] setPosition:ccp(10000,10000)];
            }
        }
        return;
    }
    
    static int ranNumber;
    
    if(turtleCoinAniStructForReward->aniTimer == 0){
        for(int i = 0 ; i <  turtleCoinAniStructForReward->numElements ; i++){
            ranNumber = arc4random()%100;
            turtleCoinAniStructForReward->vx[i] = (float)ranNumber/25.0;
            ranNumber = arc4random()%100;
            turtleCoinAniStructForReward->vy[i] = (float)ranNumber/15.0;
            ranNumber = arc4random()%100;
            turtleCoinAniStructForReward->rv[i] = (float)ranNumber/25.0;
            
            ranNumber = arc4random()%100;
            turtleCoinAniStructForReward->ov[i] = (float)ranNumber/10.0 + 5.0;
            
            if(arc4random()%2 == 0){
                turtleCoinAniStructForReward->rv[i] *= -1;
                turtleCoinAniStructForReward->vx[i] *= -1;
            }
            
            turtleCoinAniStructForReward->posX[i] = turtleCoinForReward_X;
            turtleCoinAniStructForReward->posY[i] = turtleCoinForReward_Y;
            
            turtleCoinAniStructForReward->opacity[i] = 255;
            [turtleCoinAniStructForReward->s_graphic[i] setScale:2.0];
        }
    }
    
    for(int i = 0 ; i <  turtleCoinAniStructForReward->numElements ; i++){
        [turtleCoinAniStructForReward->s_graphic[i] setPosition:ccp(turtleCoinAniStructForReward->posX[i], turtleCoinAniStructForReward->posY[i])];
        [turtleCoinAniStructForReward->s_graphic[i] setOpacity:turtleCoinAniStructForReward->opacity[i]];
        
        turtleCoinAniStructForReward->posX[i] += turtleCoinAniStructForReward->vx[i];
        turtleCoinAniStructForReward->posY[i] += turtleCoinAniStructForReward->vy[i];
        turtleCoinAniStructForReward->opacity[i] -= turtleCoinAniStructForReward->ov[i];
        
        if(turtleCoinAniStructForReward->opacity[i] < 0 ){
            turtleCoinAniStructForReward->opacity[i] = 0;
        }
        
        turtleCoinAniStructForReward->vy[i] -= 0.2;
    }
    
    
    turtleCoinAniStructForReward->aniTimer++;
}

-(void) setTurtleCoinAni{
    if(turtleCoinAniStruct->isAni){
        return;
    }
    
    // printf("setTurtleCoinAni\n");
    
    turtleCoinAniStruct->aniTimer = 0;
    turtleCoinAniStruct->isAni = true;
}

-(void) setTurtleCoinAniForReward{
    printf("setTurtleCoinAniForReward\n");
    if(turtleCoinAniStructForReward->isAni){
        return;
    }
 
    turtleCoinAniStructForReward->aniTimer = 0;
    turtleCoinAniStructForReward->isAni = true;
}


-(void) removePopup{
    isPoppingUp = false;
}

- (void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    // printf("SDFSDFDSFSDFDSFDSFSDFSDFDSn");
    
    if(isPoppingUp){
        return;
    }
    
    for( UITouch *touch in touches ) {
		CGPoint location = [touch locationInView: [touch view]];
		location = [[CCDirector sharedDirector] convertToGL: location];
        printf("TTTT:%4.8f %4.8f\n",location.x, location.y);
        
        for(int i = 0 ; i < 4 ; i++){
            if(location.x > iconPosX[i] - 30 && location.x <  iconPosX[i] + 30){
                if(location.y > iconPosY - 30 && location.y <  iconPosY + 30){
                    generalAchviementPosIdx = i;
                    achivementSelectIdx =  achivementIdx[i];
                    [self showAchivementPopup];
                    return;
                }
            }
        }
        
        
        
    }
}




-(void) saveToDB{
    
    static int saveTurtleCoinAccum;
    
    save_bestScore = score;
    
    saveTurtleCoinAccum = turtleCoinAccum;
    
    for(int i = 0 ; i < 4 ; i++){
        if(save_unblockAchivementIdx[i] != -1){
            
            saveTurtleCoinAccum += ahievementReward[save_unblockAchivementIdx[i]];
            
            
            NSMutableString* achivementString = [NSMutableString string];
            [achivementString setString:@"achivement_"];
            
            if(i < 9){
                [achivementString appendString:@"0"];
            }
            
            [achivementString appendFormat:@"%i", save_unblockAchivementIdx[i]+1];
            
             NSLog(achivementString);
            
           // [[NSUserDefaults standardUserDefaults] setBool:true forKey:achivementString];
        }
    }
    
    save_coins = score/10 + saveTurtleCoinAccum;
   // [[NSUserDefaults standardUserDefaults] setInteger:save_coins forKey:@"turtleCoin"];
    
    if(save_bestScore > bestScore){
        NSMutableString* scoreString = [NSMutableString string];
        
        [scoreString setString:@"score_mini_"];
        
        if(currentChosenMiniGame < 9){
            [scoreString appendString:@"0"];
        }
        
        [scoreString appendFormat:@"%i", currentChosenMiniGame+1];
        
        NSLog(scoreString);
        
       // [[NSUserDefaults standardUserDefaults] setInteger:save_bestScore forKey:scoreString];
    }
    
    
    printf("saveDB:%i %i\n",save_bestScore,save_coins);
    
}


@end
