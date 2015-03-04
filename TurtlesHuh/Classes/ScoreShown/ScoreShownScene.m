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

#import "AchivementScene.h"
#import "SelectMiniGameScene2.h"
#import "PlayScene.h"
#import "NullScene.h"

#import "AppDelegate.h"

//#import "GameCenterController.h"
#import "StoryScene.h"

#import "P4RC.h"
#import "HeyzapCocos2DSDK.h"

const char *scoreShown_totalPriceChar = nil;

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

-(void) failP4RCaAndReload{
    printf("Score failP4RCaAndReload\n");
    [self sentP4RCScore];
}

-(void) addP4RCSpin{
 
    printf("addP4RCSpin\n");
    p4rc_isRemovedSpin = false;
    p4rc_spinningTimer = 0;
    AppController *appDelegate =(AppController*) [[UIApplication sharedApplication] delegate];
    [appDelegate loadIndicatorView];
}

-(void) removeP4RCSpin{
    if(p4rc_isRemovedSpin){
        return;
    }
   
    p4rc_isRemovedSpin = true;
    
    printf("removeP4RCSpin\n");
    AppController *appDelegate =(AppController*) [[UIApplication sharedApplication] delegate];
    [appDelegate removeIndicatorView];
}

-(void) displayP4RCLastPoint{
    printf("displayP4RCLastPoint:%i\n",lastFuckPoint);
    
    CCLabelAtlas* l_showP4RC_Point;
    
    if(isIpad){
        l_showP4RC_Point = [CCLabelAtlas labelWithString:[NSString stringWithFormat:@"%i", lastFuckPoint] charMapFile:@"fontV2.png" itemWidth:44 itemHeight:54 startCharMap:'0'];
    }else{
        l_showP4RC_Point = [CCLabelAtlas labelWithString:[NSString stringWithFormat:@"%i", lastFuckPoint] charMapFile:@"fontV2.png" itemWidth:22 itemHeight:27 startCharMap:'0'];
    }
    
    
    [l_showP4RC_Point setScale:0.641];
    [l_showP4RC_Point setColor:ccc3(32, 107, 195)];
    [l_showP4RC_Point setAnchorPoint:ccp(0,0.5)];
    [l_showP4RC_Point setPosition:ccp(172+210-30,95+11)];
    
    if(isIpad){
        [l_showP4RC_Point setPosition:ccp(352 * 1024.0/480.0, 106 * 768.0/320.0 + 17)];
    }
    
    if(isIphone5){
        [l_showP4RC_Point setPosition:ccp(l_showP4RC_Point.position.x + 44, l_showP4RC_Point.position.y)];
    }
    
    [self addChild:l_showP4RC_Point z:9998];
    [self removeP4RCSpin];
}

-(void) sentP4RCScore{
    
    sendLevel = 0;
    if(currentChosenMiniGame == 1){
        sendLevel = 1;
    }
    if(currentChosenMiniGame == 4){
        sendLevel = 2;
    }
    if(currentChosenMiniGame == 2){
        sendLevel = 3;
    }
    if(currentChosenMiniGame == 3){
        sendLevel = 4;
    }
    if(currentChosenMiniGame == 10){
        sendLevel = 5;
    }
    if(currentChosenMiniGame == 5){
        sendLevel = 6;
    }
    if(currentChosenMiniGame == 11){
        sendLevel = 7;
    }
    if(currentChosenMiniGame == 13){
        sendLevel = 8;
    }
    if(currentChosenMiniGame == 103){
        sendLevel = 10;
    }
    
    printf("P4RC send level:%i score:%i\n",sendLevel,(int)score);
    [[P4RC sharedInstance] didCompleteLevel:sendLevel withPoints:(int)score];
   // [[P4RC sharedInstance] didCompleteLevel:8 withPoints:60];
    
   
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
            multipier = 0.0 + (1.0 - 0.0) * (maxCombo - 0)/(100 - 0);
        }else if(maxCombo < 150){
            multipier = 1.0;
            multipier = 1.0 + (1.3 - 1.0) * (maxCombo - 100)/(150 - 100);
        }else if(maxCombo < 200){
            multipier = 1.3;
            multipier = 1.3 + (1.7 - 1.3) * (maxCombo - 150)/(200 - 150);  
        }else if(maxCombo < 250){
            multipier = 1.7;
             multipier = 1.7 + (2.0 - 1.7) * (maxCombo - 200)/(250 - 200);
        }else if(maxCombo < 300){
            multipier = 2;
             multipier = 2.0 + (2.2 - 2.0) * (maxCombo - 250)/(300 - 250);
        }else if(maxCombo < 350){
            multipier = 2.2;
             multipier = 2.2 + (2.5 - 2.2) * (maxCombo - 300)/(350 - 300);
        }else if(maxCombo < 400){
            multipier = 2.5;
             multipier = 2.5 + (3.0 - 2.5) * (maxCombo - 350)/(400 - 350);
        }else if(maxCombo < 10020){
            multipier = 3.0;
        }
        
        if(multipier < 1.0){
            multipier = 1.0;
        }

    }
    
    if(currentChosenMiniGame == 2){
        multipier = 1.0;
        
        if(maxCombo < 10){
            multipier = 1.0;
            multipier = 0.0 + (2.0 - 0.0) * (maxCombo - 0)/(10 - 0);
        }else if(maxCombo < 15){
            multipier = 2.0;
            multipier = 2.0 + (3.5 - 2.0) * (maxCombo - 10)/(15 - 10);
        }else if(maxCombo < 20){
            multipier = 3.5;
            multipier = 3.5 + (5.0 - 3.5) * (maxCombo - 15)/(20 - 15);
        }else if(maxCombo < 25){
            multipier = 5;
            multipier = 5.0 + (6.5 - 5.0) * (maxCombo - 20)/(25 - 20);
        }else if(maxCombo < 30){
            multipier = 6.5;
            multipier = 6.5 + (8.0 - 6.5) * (maxCombo - 25)/(30 - 25);
        }else if(maxCombo < 35){
            multipier = 8.0;
             multipier = 8.0 + (9.0 - 8.0) * (maxCombo - 30)/(35 - 30);
        }else if(maxCombo < 40){
            multipier = 9.0;
             multipier = 9.0 + (10.0 - 9.0) * (maxCombo - 35)/(40 - 35);
        }else if(maxCombo < 45){
            multipier = 10.0;
             multipier = 10.0 + (11.0 - 10.0) * (maxCombo - 40)/(45 - 40);
        }else if(maxCombo < 50){
            multipier = 11.0;
            multipier = 11.0 + (12.0 - 11.0) * (maxCombo - 45)/(50 - 45);
        }else if(maxCombo < 5099999){
            multipier = 12.0;
        }
    
    }
    
    if(currentChosenMiniGame == 3){
        multipier = 2.0;
        
       /* if(maxCombo < 100){
            multipier = 1.0;
            multipier = 0.0 + (1.1 - 0.0) * (maxCombo - 0)/(100 - 0);
        }else if(maxCombo < 150){
            multipier = 1.1;
             multipier = 1.1 + (1.2 - 1.1) * (maxCombo - 100)/(150 - 100);
        }else if(maxCombo < 200){
            multipier = 1.2;
            multipier = 1.2 + (1.3 - 1.2) * (maxCombo - 150)/(200 - 150);
        }else if(maxCombo < 250){
            multipier = 1.3;
            multipier = 1.3 + (1.5 - 1.3) * (maxCombo - 200)/(250 - 200);
        }else if(maxCombo < 300){
            multipier = 1.5;
            multipier = 1.5 + (1.7 - 1.5) * (maxCombo - 250)/(300 - 250);
        }else if(maxCombo < 350){
            multipier = 1.7;
            multipier = 1.7 + (2.0 - 1.7) * (maxCombo - 300)/(350 - 300);
        }else if(maxCombo < 400){
            multipier = 2.0;
            multipier = 2.0 + (3.0 - 3.0) * (maxCombo - 350)/(400 - 350);
        }else if(maxCombo < 10020){
            multipier = 3.0;
        }*/
        
    }
    
    
    if(currentChosenMiniGame == 4){
        multipier = 0.5;
        
        if(maxCombo < 30){
            multipier = 0.5;
             multipier = 0.0 + (0.5 - 0.0) * (maxCombo - 0)/(30 - 0);
        }else if(maxCombo < 50){
            multipier = 0.5;
             multipier = 0.5 + (0.65 - 0.5) * (maxCombo - 30)/(50 - 30);
        }else if(maxCombo < 80){
            multipier = 0.65;
            multipier = 0.65 + (0.85 - 0.65) * (maxCombo - 50)/(80 - 50);
        }else if(maxCombo < 100){
            multipier = 0.85;
            multipier = 0.85 + (1.0 - 0.85) * (maxCombo - 80)/(100 - 80);
        }else if(maxCombo < 150){
            multipier = 1.0;
            multipier = 1.0 + (1.2 - 1.0) * (maxCombo - 100)/(150 - 100);
        }else if(maxCombo < 200){
            multipier = 1.2;
            multipier = 1.2 + (1.5 - 1.2) * (maxCombo - 150)/(200 - 150);
        }else if(maxCombo < 250){
            multipier = 1.5;
            multipier = 1.5 + (1.65 - 1.5) * (maxCombo - 200)/(250 - 200);
        }else if(maxCombo < 300){
            multipier = 1.65;
             multipier = 1.65 + (1.85 - 1.65) * (maxCombo - 250)/(300 - 250);
        }else if(maxCombo < 350){
            multipier = 1.85;
            multipier = 1.85 + (2.0 - 1.85) * (maxCombo - 300)/(350 - 300);
        }else if(maxCombo < 400){
            multipier = 2.0;
             multipier = 2.0 + (3.0 - 2.0) * (maxCombo - 350)/(400 - 350);
        }else if(maxCombo < 450000){
            multipier = 3.0;
        }
        
        if(multipier < 1.0){
            multipier = 1.0;
        }
    
    }
    
    
    if(currentChosenMiniGame == 5){
        multipier = 1.0;
        
       /* if(maxCombo < 40){
            multipier = 1.0;
            multipier = 0.0 + (1.5 - 0.0) * (maxCombo - 0)/(40 - 0);
        }else if(maxCombo < 80){
            multipier = 1.5;
             multipier = 1.5 + (2.0 - 1.5) * (maxCombo - 40)/(80 - 40);
        }else if(maxCombo < 120){
            multipier = 2.0;
             multipier = 2.0 + (2.5 - 2.0) * (maxCombo - 80)/(120 - 80);
        }else if(maxCombo < 160){
            multipier = 2.5;
             multipier = 2.5 + (3.0 - 2.5) * (maxCombo - 120)/(160 - 120);
        }else if(maxCombo < 200){
            multipier = 3.0;
             multipier = 3.0 + (3.5 - 3.0) * (maxCombo - 160)/(200 - 160);
        }else if(maxCombo < 250){
            multipier = 3.5;
             multipier = 3.5 + (4.0 - 3.5) * (maxCombo - 200)/(250 - 200);
        }else if(maxCombo < 290){
            multipier = 4.0;
             multipier = 4.0 + (5.0 - 4.0) * (maxCombo - 250)/(290 - 250);
        }else if(maxCombo < 10020){
            multipier = 5.0;
        }*/
        
        
        if(maxCombo < 40){
            multipier = 1.0;
            multipier = 0.0 + (1.3 - 0.0) * (maxCombo - 0)/(40 - 0);
        }else if(maxCombo < 80){
            multipier = 1.3;
            multipier = 1.3 + (1.6 - 1.3) * (maxCombo - 40)/(80 - 40);
        }else if(maxCombo < 120){
            multipier = 1.6;
            multipier = 1.6 + (1.9 - 1.6) * (maxCombo - 80)/(120 - 80);
        }else if(maxCombo < 160){
            multipier = 1.9;
            multipier = 1.9 + (2.2 - 1.9) * (maxCombo - 120)/(160 - 120);
        }else if(maxCombo < 200){
            multipier = 2.2;
            multipier = 2.2 + (2.5 - 2.2) * (maxCombo - 160)/(200 - 160);
        }else if(maxCombo < 250){
            multipier = 2.5;
            multipier = 2.5 + (2.8 - 2.5) * (maxCombo - 200)/(250 - 200);
        }else if(maxCombo < 280){
            multipier = 2.8;
            multipier = 2.8 + (3.0 - 2.8) * (maxCombo - 250)/(280 - 250);
        }else if(maxCombo < 10020){
            multipier = 3.0;
        }

        
        if(multipier < 1.0){
            multipier = 1.0;
        }
        
        /*maxCombo = 0;
         do{
         maxCombo++;
         //  printf("MMM B:%i %4.8f\n",maxCombo,multipier);
             if(maxCombo < 40){
                 multipier = 1.0;
                 multipier = 0.0 + (1.3 - 0.0) * (maxCombo - 0)/(40 - 0);
             }else if(maxCombo < 80){
                 multipier = 1.3;
                 multipier = 1.3 + (1.6 - 1.3) * (maxCombo - 40)/(80 - 40);
             }else if(maxCombo < 120){
                 multipier = 1.6;
                 multipier = 1.6 + (1.9 - 1.6) * (maxCombo - 80)/(120 - 80);
             }else if(maxCombo < 160){
                 multipier = 1.9;
                 multipier = 1.9 + (2.2 - 1.9) * (maxCombo - 120)/(160 - 120);
             }else if(maxCombo < 200){
                 multipier = 2.2;
                 multipier = 2.2 + (2.5 - 2.2) * (maxCombo - 160)/(200 - 160);
             }else if(maxCombo < 250){
                 multipier = 2.5;
                 multipier = 2.5 + (2.8 - 2.5) * (maxCombo - 200)/(250 - 200);
             }else if(maxCombo < 280){
                 multipier = 2.8;
                 multipier = 2.8 + (3.0 - 2.8) * (maxCombo - 250)/(280 - 250);
             }else if(maxCombo < 10020){
                 multipier = 3.0;
             }
             

         
         printf("MMM E:%i %4.8f\n",maxCombo,multipier);
         
         static float floatMM;
         static int intMM;
         floatMM = multipier * 10;
         intMM = (int)floatMM;
         multipier = (float)intMM/10.0;
         printf("FFF S:%i %4.8f   ||   %4.8f %i\n",maxCombo, multipier  , floatMM,intMM);
         printf("\n");
         
         }while(maxCombo < 1000);*/

    }
    
    if(currentChosenMiniGame == 10){
        multipier = 6.0;
        
        /*if(maxCombo < 40){
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
        
        multipier += 1;*/
    }
    
    if(currentChosenMiniGame == 11){
        multipier = 1.0;
        
        if(maxCombo < 50){
            multipier = 0.3;
            multipier = 0.0 + (0.6 - 0.0) * (maxCombo - 0)/(50 - 0);
        }else if(maxCombo < 100){
            multipier = 0.6; 
            multipier = 0.6 + (0.65 - 0.6) * (maxCombo - 50)/(100 - 50);
        }else if(maxCombo < 130){
            multipier = 0.65;
            multipier = 0.65 + (0.9 - 0.65) * (maxCombo - 100)/(130 - 100);
        }else if(maxCombo < 160){
            multipier = 0.9;
            multipier = 0.9 + (1.0 - 0.9) * (maxCombo - 130)/(160 - 130);
        }else if(maxCombo < 200){
            multipier = 1.0;
            multipier = 1.0 + (1.5 - 1.0) * (maxCombo - 160)/(200 - 160);
        }else if(maxCombo < 250){
            multipier = 1.5;
            multipier = 1.5 + (1.7 - 1.5) * (maxCombo - 200)/(250 - 200);
        }else if(maxCombo < 300){
            multipier = 1.7;
            multipier = 1.7 + (2.0 - 1.7) * (maxCombo - 250)/(300 - 250);
        }else if(maxCombo < 10020){
            multipier = 2.0;
        }
        
        multipier += 0.3;
        
    }
    
    if(currentChosenMiniGame == 13){
        multipier = 1.0;
        
        if(maxCombo < 100){
            multipier = 1.4;
             multipier = 0.0 + (1.7 - 0.0) * (maxCombo - 0)/(100 - 0);
        }else if(maxCombo < 140){
            multipier = 1.7;
            multipier = 1.7 + (2.0 - 1.7) * (maxCombo - 100)/(140 - 100);
        }else if(maxCombo < 170){
            multipier = 2.0;
            multipier = 2.0 + (2.2 - 2.0) * (maxCombo - 140)/(170 -140);
        }else if(maxCombo < 200){
            multipier = 2.2;
            multipier = 2.2 + (2.5 - 2.2) * (maxCombo - 170)/(200 - 170);
        }else if(maxCombo < 250){
            multipier = 2.5;
            multipier = 2.5 + (2.7 - 2.5) * (maxCombo - 200)/(250 - 200);
        }else if(maxCombo < 300){
            multipier = 3.0;
            multipier = 2.7 + (3.0 - 2.7) * (maxCombo - 250)/(300 - 250);
        }else if(maxCombo < 40000){
            multipier = 3.0;
        }
        
        if(multipier < 1.4){
            multipier = 1.4;
        }
        
    }
    
    if(currentChosenMiniGame == 103){
        multipier = 1.5;
        
        
        if(maxCombo < 20){
            multipier = 1.5;
            multipier = 1.5 + (2.0 - 1.5) * (maxCombo - 0)/(20 - 0);
        }else if(maxCombo < 25){
            multipier = 2.0;
            multipier = 2.0 + (2.2 - 2.0) * (maxCombo - 20)/(25 - 20);
        }else if(maxCombo < 50){
            multipier = 2.2;
            multipier = 2.2 + (2.5 - 2.2) * (maxCombo - 25)/(50 - 25);
        }else if(maxCombo < 75){
            multipier = 2.5;
            multipier = 2.5 + (2.7 - 2.5) * (maxCombo - 50)/(75 - 50);
        }else if(maxCombo < 100){
            multipier = 2.7;
            multipier = 2.7 + (3.0 - 2.7) * (maxCombo - 75)/(100 - 75);
        }else if(maxCombo < 125){
            multipier = 3.0;
            multipier = 3.0 + (3.2 - 3.0) * (maxCombo - 100)/(125 - 100);
        }else if(maxCombo < 150){
            multipier = 3.2;
            multipier = 3.2 + (3.5 - 3.2) * (maxCombo - 125)/(150 - 125);
        }else if(maxCombo < 175){
            multipier = 3.5;
            multipier = 3.5 + (3.7 - 3.5) * (maxCombo - 150)/(175 - 150);
        }else if(maxCombo < 200){
            multipier = 3.7;
            multipier = 3.7 + (4.0 - 3.7) * (maxCombo - 175)/(200 - 175);
        }else if(maxCombo < 10020){
            multipier = 4.0;
        }
        
        
        if(multipier < 1.5){
            multipier = 1.5;
        }
        
    }
    
    printf("before multipier:%4.8f\n",multipier);
    static float floatM;
    static int intM;
    floatM = multipier * 10;
    intM = (int)floatM;
    multipier = (float)intM/10;
    printf("multipier:%4.8f\n",multipier);
}

-(void) gainAchivementCoin{
    if(hasGainedAchivementCoin){
        return;
    }
    
   // [musicController playThisSound:kSound_TurtleCoinsGain isLoop:NO gain:1.0];
    
    isPlayingAchivementAni = false;
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

-(bool) checkToShowThisAchivementToBeUnlboked:(int)_achivementPos{
    //return false;
    
    if(achivementIdx[_achivementPos] == 0){
        static int counterLeft;
        static int counter;
        
        counter = [[NSUserDefaults standardUserDefaults] integerForKey:@"counter_mini_01"];
        counterLeft = 400 - counter;
        
        if(counterLeft < 0){
            return true;
        }
    }
    
    if(achivementIdx[_achivementPos] == 1){
        static int counterLeft;
        static int counter;
        
        counter = [[NSUserDefaults standardUserDefaults] integerForKey:@"counter_mini_01"];
        counterLeft = 4000 - counter;
        
        if(counterLeft < 0){
            return true;
        }
    }
    
    if(achivementIdx[_achivementPos] == 2){
        if(grade >=  kGrade_B){
            return true;
        }
    }
    if(achivementIdx[_achivementPos] == 3){
        if(grade >=  kGrade_A){
            return true;
        }
    }
    if(achivementIdx[_achivementPos] == 4){
        if(grade >=  kGrade_S){
            return true;
        }
    }

    //MINI 02
    if(achivementIdx[_achivementPos] == 5){
        static int counterLeft;
        static int counter;
        
        counter = [[NSUserDefaults standardUserDefaults] integerForKey:@"counter_mini_04"];
        counterLeft = 400 - counter;
        
        if(counterLeft < 0){
            return true;
        }
    }
    
    if(achivementIdx[_achivementPos] == 6){
        static int counterLeft;
        static int counter;
        
        counter = [[NSUserDefaults standardUserDefaults] integerForKey:@"counter_mini_04"];
        counterLeft = 3500 - counter;
        
        if(counterLeft < 0){
            return true;
        }
    }
    
    if(achivementIdx[_achivementPos] == 7){
        if(grade >=  kGrade_B){
            return true;
        }
    }
    if(achivementIdx[_achivementPos] == 8){
        if(grade >=  kGrade_A){
            return true;
        }
    }
    if(achivementIdx[_achivementPos] == 9){
        if(grade >=  kGrade_S){
            return true;
        }
    }
    
    //MINI 03
    if(achivementIdx[_achivementPos] == 10){
        static int counterLeft;
        static int counter;
        
        counter = [[NSUserDefaults standardUserDefaults] integerForKey:@"counter_mini_02"];
        counterLeft = 400 - counter;
        
        if(counterLeft < 0){
            return true;
        }
    }
    
    if(achivementIdx[_achivementPos] == 11){
        static int counterLeft;
        static int counter;
        
        counter = [[NSUserDefaults standardUserDefaults] integerForKey:@"counter_mini_02"];
        counterLeft = 2000 - counter;
        
        if(counterLeft < 0){
            return true;
        }
    }
    
    if(achivementIdx[_achivementPos] == 12){
        if(grade >=  kGrade_B){
            return true;
        }
    }
    if(achivementIdx[_achivementPos] == 13){
        if(grade >=  kGrade_A){
            return true;
        }
    }
    if(achivementIdx[_achivementPos] == 14){
        if(grade >=  kGrade_S){
            return true;
        }
    }
    
    //MINI 04
    if(achivementIdx[_achivementPos] == 15){
        static int counterLeft;
        static int counter;
        
        counter = [[NSUserDefaults standardUserDefaults] integerForKey:@"counter_mini_03"];
        counterLeft = 400 - counter;
        
        if(counterLeft < 0){
            return true;
        }
    }
    
    if(achivementIdx[_achivementPos] == 16){
        static int counterLeft;
        static int counter;
        
        counter = [[NSUserDefaults standardUserDefaults] integerForKey:@"counter_mini_03"];
        counterLeft = 1500 - counter;
        
        if(counterLeft < 0){
            return true;
        }
    }
    
    if(achivementIdx[_achivementPos] == 17){
        if(grade >=  kGrade_B){
            return true;
        }
    }
    if(achivementIdx[_achivementPos] == 18){
        if(grade >=  kGrade_A){
            return true;
        }
    }
    if(achivementIdx[_achivementPos] == 19){
        if(grade >=  kGrade_S){
            return true;
        }
    }
    
    //MINI 05
    if(achivementIdx[_achivementPos] == 20){
        static int counterLeft;
        static int counter;
        
        counter = [[NSUserDefaults standardUserDefaults] integerForKey:@"counter_mini_10"];
        counterLeft = 200 - counter;
        
        if(counterLeft < 0){
            return true;
        }
    }
    
    if(achivementIdx[_achivementPos] == 21){
        static int counterLeft;
        static int counter;
        
        counter = [[NSUserDefaults standardUserDefaults] integerForKey:@"counter_mini_10"];
        counterLeft = 1200 - counter;
        
        if(counterLeft < 0){
            return true;
        }
    }
    
    if(achivementIdx[_achivementPos] == 22){
        if(grade >=  kGrade_B){
            return true;
        }
    }
    if(achivementIdx[_achivementPos] == 23){
        if(grade >=  kGrade_A){
            return true;
        }
    }
    if(achivementIdx[_achivementPos] == 24){
        if(grade >=  kGrade_S){
            return true;
        }
    }
    
    //MINI 06
    printf("achivementIdx[_achivementPos]:%i %i\n",achivementIdx[_achivementPos], _achivementPos);
    if(achivementIdx[_achivementPos] == 25){
        static int counterLeft;
        static int counter;
        
        counter = [[NSUserDefaults standardUserDefaults] integerForKey:@"counter_mini_05"];
        counterLeft = 400 - counter;
        
        if(counterLeft < 0){
            return true;
        }
    }
    
    if(achivementIdx[_achivementPos] == 26){
        static int counterLeft;
        static int counter;
        
        counter = [[NSUserDefaults standardUserDefaults] integerForKey:@"counter_mini_05"];
        counterLeft = 3000 - counter;
        
        if(counterLeft < 0){
            return true;
        }
    }
    
    if(achivementIdx[_achivementPos] == 27){
        if(grade >=  kGrade_B){
            return true;
        }
    }
    if(achivementIdx[_achivementPos] == 28){
        if(grade >=  kGrade_A){
            return true;
        }
    }
    if(achivementIdx[_achivementPos] == 29){
        if(grade >=  kGrade_S){
            return true;
        }
    }
    
    //MINI 07
    if(achivementIdx[_achivementPos] == 30){
        static int counterLeft;
        static int counter;
        
        counter = [[NSUserDefaults standardUserDefaults] integerForKey:@"counter_mini_11"];
        counterLeft = 800 - counter;
        
        if(counterLeft < 0){
            return true;
        }
    }
    
    if(achivementIdx[_achivementPos] == 31){
        static int counterLeft;
        static int counter;
        
        counter = [[NSUserDefaults standardUserDefaults] integerForKey:@"counter_mini_11"];
        counterLeft = 4000 - counter;
        
        if(counterLeft < 0){
            return true;
        }
    }
    
    if(achivementIdx[_achivementPos] == 32){
        if(grade >=  kGrade_B){
            return true;
        }
    }
    if(achivementIdx[_achivementPos] == 33){
        if(grade >=  kGrade_A){
            return true;
        }
    }
    if(achivementIdx[_achivementPos] == 34){
        if(grade >=  kGrade_S){
            return true;
        }
    }
    
    //MINI 08
    if(achivementIdx[_achivementPos] == 35){
        static int counterLeft;
        static int counter;
        
        counter = [[NSUserDefaults standardUserDefaults] integerForKey:@"counter_mini_13"];
        counterLeft = 400 - counter;
        
        if(counterLeft < 0){
            return true;
        }
    }
    
    if(achivementIdx[_achivementPos] == 36){
        static int counterLeft;
        static int counter;
        
        counter = [[NSUserDefaults standardUserDefaults] integerForKey:@"counter_mini_13"];
        counterLeft = 3000 - counter;
        
        if(counterLeft < 0){
            return true;
        }
    }
    
    if(achivementIdx[_achivementPos] == 37){
        if(grade >=  kGrade_B){
            return true;
        }
    }
    if(achivementIdx[_achivementPos] == 38){
        if(grade >=  kGrade_A){
            return true;
        }
    }
    if(achivementIdx[_achivementPos] == 39){
        if(grade >=  kGrade_S){
            return true;
        }
    }
    
    
    //MINI 09
    if(achivementIdx[_achivementPos] == 40){
        static int counterLeft;
        static int counter;
        
        counter = [[NSUserDefaults standardUserDefaults] integerForKey:@"counter_mini_103"];
        counterLeft = 400 - counter;
        
        if(counterLeft < 0){
            return true;
        }
    }
    
    if(achivementIdx[_achivementPos] == 41){
        static int counterLeft;
        static int counter;
        
        counter = [[NSUserDefaults standardUserDefaults] integerForKey:@"counter_mini_103"];
        counterLeft = 3000 - counter;
        
        if(counterLeft < 0){
            return true;
        }
    }
    
    if(achivementIdx[_achivementPos] == 42){
        if(grade >=  kGrade_B){
            return true;
        }
    }
    if(achivementIdx[_achivementPos] == 43){
        if(grade >=  kGrade_A){
            return true;
        }
    }
    if(achivementIdx[_achivementPos] == 44){
        if(grade >=  kGrade_S){
            return true;
        }
    }

    
    
    return false;
}

-(void) initHowmanyCompletedWIllBeShown{
    howmanyCompletedWillBeShown = 0;
    showCompletedCurrentTimer = 0;
    showCompletedCurrentIdx = 0;
    isShowingCompleted = false;
    
    isPlayingAchivementAni = false;
    
    for(int i = 0 ; i < howmanyAchivement ; i++){
        achivementHasUnblockedBeforeFuckingLongTimeAgo[i] = false;
        
        if(achivementIdx[i] >= 0){
            if(!hasFinishedThisAchivements[achivementIdx[i]]){
                
                if([self checkToShowThisAchivementToBeUnlboked:i]){
                    
                    achivementHasUnblockedBeforeFuckingLongTimeAgo[i] = true;
                    showCompletedIdx[howmanyCompletedWillBeShown] = achivementIdx[i];
                    showCompletedIdxReferToPositionIdx[howmanyCompletedWillBeShown] = i;
                    howmanyCompletedWillBeShown++;
                    isShowingCompleted = true;
                    isPlayingAchivementAni = true;
                    
                    save_unblockAchivementIdx[save_unblockCurrentIdx] = achivementIdx[i];
                    save_unblockCurrentIdx++;
                    
                    //NEW
                    hasFinishedThisAchivements[achivementIdx[i]] = true;

                }
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
 
        ad_isInGaming = false;
        
         [self addP4RCSpin];
        
        //[musicController initForPlay];
        [self saveToDBPre];
        
        isUnblockingMainGame = false;
        isProtecting = true;
        protectingTimer = 0;
        
        save_unblockAchivementIdx[0] = -1;
        save_unblockAchivementIdx[1] = -1;
        save_unblockAchivementIdx[2] = -1;
        save_unblockAchivementIdx[3] = -1;
        save_unblockAchivementIdx[4] = -1;
        save_unblockCurrentIdx = 0;
        
        AppController *appDelegate =(AppController*) [[UIApplication sharedApplication] delegate];
        [appDelegate getAchivementValues];
        [appDelegate setFucklegate:self];
        
       // [musicController initForNull];
        isPoppingUp = false;
        self.isTouchEnabled = YES;
        
        hasGainedAchivementCoin = false;
        isRunning = true;
        hasClickedToStop = false;
        
        
    //currentTurtleCoin = 197;
    //    maxCombo = 123;
    //    currentChosenMiniGame = 13;
        
        [musicController initForBegin];
        
        badge_letterScale = 1.0;
        
        CCSprite* s_bg = [CCSprite spriteWithFile:@"ScoreShown_bg.png"];
        [s_bg setPosition:ccp([UIScreen mainScreen].bounds.size.height/2, [UIScreen mainScreen].bounds.size.width/2)];
        [self addChild:s_bg];
        

        
        numTapped = currentTurtleCoin;
        startUpdatingDigits = false;
        
        [self checkIfGoToNextMiniGame];
        [self getValuesFromDB];
        [self getMultiplier];
        
        printf("Testing 00");
        [self getScoreAndGrade];
        printf("Testing 01");
        [self initMenu];
        printf("Testing 02");
        [self initGradeBar];
        printf("Testing 03");
        [self initTurtleCoins];
        printf("Testing 04");
        [self initLetters];
        printf("Testing 05");
        [self initGradeBadge];
        printf("Testing 06");
        [self initTurtleCoinAniStruct];
        printf("Testing 07");
        [self initAchivements];
        
        [self initAchivementPopup];
        [self initHowmanyCompletedWIllBeShown];
        
        detectChangeGradebarPercentage = 20.0;
        finalUpdateTimer = 0;
        startUpdatingDigits = false;
        isGoingToUpdateDigitsTimer = 0;
        [self schedule: @selector(gameStep:)];
        
        [self saveToDB];
      //  [gameCenterController submitScore];
        
        [self sentP4RCScore];
        //[self displayP4RCLastPoint];
        
//        printf("ad_howmanyGamesPlayed:%i\n",ad_howmanyGamesPlayed);
//        if(ad_howmanyGamesPlayed % 3 == 0){
//            [appDelegate showAllAds];
//        }
        
        // Create a menu item image button
        heyzap = [CCMenuItemImage itemWithNormalImage:@"Heyzap.bundle/btn-sdk-checkin.png"
                                                    selectedImage:@"Heyzap.bundle/btn-sdk-checkin-down.png"
                                                           target:self
                                                         selector:@selector(heyzapCheckinTapped:)];
        
        // Set x and y to be the position on screen where you want to place the button
        heyzap.position = ccp(-145,-73);
        
        if(isIpad){
            heyzap.position = ccp(-145 * 1024.0/480.0,-73 * 768.0/320.0);
        }
        
        if(isIphone5){
         //   heyzap.position= ccp(-135-10 - 44,-60-7-6);
        }
        
        // Add it to the menu (or use your existing menu instead)
        CCMenu *heyzapMenu = [CCMenu menuWithItems:heyzap, nil];
        [self addChild:heyzapMenu];
        
        //[self sendHeyzapScore];
        
        [appDelegate showAllAds];
        
    }
	return self;
}

-(void) sendHeyzapScore{
    HZScore *score_heyzap = [[HZScore alloc] init];
    
    score_heyzap.relativeScore = score;
    NSMutableString* scor_heyzapDisplay;
    scor_heyzapDisplay = [NSMutableString string];
    [scor_heyzapDisplay setString:[NSString stringWithFormat:@"%i", (int)score]];
    score_heyzap.displayScore = scor_heyzapDisplay;
   // score.username = @"johndoe1234";
    
    if(currentChosenMiniGame == 1){
        score_heyzap.levelID = @"W9g";
    }
    if(currentChosenMiniGame == 2){
        score_heyzap.levelID = @"WMc";
    }
    if(currentChosenMiniGame == 3){
        score_heyzap.levelID = @"WMm";
    }
    if(currentChosenMiniGame == 4){
        score_heyzap.levelID = @"WMQ";
    }
    if(currentChosenMiniGame == 5){
        score_heyzap.levelID = @"WIR";
    }
    if(currentChosenMiniGame == 10){
        score_heyzap.levelID = @"WMD";
    }
    if(currentChosenMiniGame == 11){
        score_heyzap.levelID = @"WI8";
    }
    if(currentChosenMiniGame == 13){
        score_heyzap.levelID = @"WI9";
    }
    if(currentChosenMiniGame == 103){
        score_heyzap.levelID = @"WI7";
    }
    
   // [[HeyzapSDK sharedSDK] submitScore: score_heyzap withCompletion:^(HZLeaderboardRank *rank, NSError *error) {
        
   // }];
    
    [[HeyzapSDK sharedSDK] submitScore:score_heyzap withCompletion:NO];
}

- (void)heyzapCheckinTapped: (id)sender {
    AppController *appDelegate =(AppController*) [[UIApplication sharedApplication] delegate];
    [appDelegate setHeyTimer];
    [appDelegate submitAllScoreToHeyZap];
    
    NSMutableString* heyString;
    heyString = [NSMutableString string];
    [heyString setString:@"I've just got a "];
    
    if(grade == kGrade_F){
        [heyString appendString:@"F"];
    }
    if(grade == kGrade_E){
        [heyString appendString:@"E"];
    }
    if(grade == kGrade_D){
        [heyString appendString:@"D"];
    }
    if(grade == kGrade_C){
        [heyString appendString:@"C"];
    }
    if(grade == kGrade_B){
        [heyString appendString:@"B"];
    }
    if(grade == kGrade_A){
        [heyString appendString:@"A"];
    }
    if(grade == kGrade_S){
        [heyString appendString:@"S"];
    }
    
    [heyString appendString:@"(Score:"];
    [heyString appendFormat:@"%i", (int)score];
    [heyString appendString:@")"];
    
    [heyString appendString:@" in mini-game #"];
    
    if(currentChosenMiniGame == 1){
        [heyString appendString:@"1"];
    }
    if(currentChosenMiniGame == 2){
        [heyString appendString:@"3"];
    }
    if(currentChosenMiniGame == 3){
        [heyString appendString:@"4"];
    }
    if(currentChosenMiniGame == 4){
        [heyString appendString:@"2"];
    }
    if(currentChosenMiniGame == 5){
        [heyString appendString:@"6"];
    }
    if(currentChosenMiniGame == 10){
        [heyString appendString:@"5"];
    }
    if(currentChosenMiniGame == 11){
        [heyString appendString:@"7"];
    }
    if(currentChosenMiniGame == 13){
        [heyString appendString:@"8"];
    }
    if(currentChosenMiniGame == 103){
        [heyString appendString:@"9"];
    }
    
    [heyString appendString:@"!"];
    
    [[HeyzapCocos2DSDK sharedSDK] checkinWithMessage:heyString];
}


-(void) showAchivementPopup{
    isPoppingUp = true;

    [achivementPopup setX:240];
    [achivementPopup setY:100];
    
    if(isIphone5){
        [achivementPopup setX:284];
    }
    
    if(isIpad){
        [achivementPopup setX:-(240 - 240) * 2 + 512];
        [achivementPopup setY:-(160 - 70) * 2 + 384];
    }
    
   // printf("show generalAchviementPosIdx:%i\n",generalAchviementPosIdx);
    if(isIpad){
        [achivementPopup popupAchivementDetails:achivementSelectIdx arrowIsUp:false arrowX:iconPosX[generalAchviementPosIdx]-235*2/textureRatioForFuckingIpad-30];
    }else{
        [achivementPopup popupAchivementDetails:achivementSelectIdx arrowIsUp:false arrowX:iconPosX[generalAchviementPosIdx]-235];
    }
    
    
     heyzap.position = ccp(-13500,-60-7);
}


-(void) initAchivementPopup{
    achivementPopup = [AchivementPopup node];
    [self addChild:achivementPopup z:9999];
    [achivementPopup setDelegate:self];
}

-(void) initAchivements{
    howmanyAchivement = 5;
    
    if(currentChosenMiniGame == 0){
    
    }
    
    printf("miniGameIdx:%i\n",miniGameIdx);
    achivementIdx[0] = miniGameIdx * 5 + 0;
    achivementIdx[1] = miniGameIdx * 5 + 1;
    achivementIdx[2] = miniGameIdx * 5 + 2;
    achivementIdx[3] = miniGameIdx * 5 + 3;
    achivementIdx[4] = miniGameIdx * 5 + 4;
    
    /*if(currentChosenMiniGame == 9){
        achivementIdx[0] = 32;
        achivementIdx[1] = -1;
        achivementIdx[2] = -1;
        achivementIdx[3] = -1;
    }*/
    
    
    /*//for FOUR
    static int iconStartX = 150;
    static int iconStartY = 28;
    static int iconOffsetX = 60;*/
    
    //FOR FIVE
     int iconStartX;
     int iconStartY;
     int iconOffsetX;
    
    iconStartX = 130;
    iconStartY = 28;
    iconOffsetX = 55;
    
    if(isIphone5){
        iconStartX += 44;
    }
    
    if(isIpad){
        iconStartX = 310;
        iconOffsetX  = 100;
        iconStartY = 60;
    }
    
    for(int i = 0 ; i < howmanyAchivement ; i++){
        if(hasFinishedThisAchivements[achivementIdx[i]]){
          //  s_icon[i] = [CCSprite spriteWithFile:@"AchievementIcon_unblockedBg.png"];
            //s_icon_bg[i] = [CCSprite spriteWithFile:@"AchievementIcon_unblockedBg.png"];
            

            NSString *key = [NSString stringWithFormat:@"icon_Achievement_%02d.png", achivementIdx[i]+1];
            s_icon_bg[i] = [CCSprite spriteWithFile:key];
             s_icon[i] = [CCSprite spriteWithFile:key];
            
            /*if(hasFinishedThisAchivements[i]){
                NSString *key = [NSString stringWithFormat:@"icon_Achievement_%02d.png", i+1];
                s_icon_bg[i] = [CCSprite spriteWithFile:key];
            }else{
                s_icon_bg[i] = [CCSprite spriteWithFile:@"icon_Achievement_unblock.png"];
            }*/
            
        }else{
            s_icon[i] = [CCSprite spriteWithFile:@"null.png"];
            s_icon_bg[i] = [CCSprite spriteWithFile:@"icon_Achievement_unblock.png"];
        }
        
        
        [self addChild:s_icon[i]];
        [s_icon[i] setPosition:ccp(10000,10000)];
        
        iconPosX[i] = iconStartX + iconOffsetX * i;
        iconPosY = iconStartY;
      
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
    
    if(isIphone5){
        badge_startX += 44;
    }
    
    badge_x = badge_startX;
    badge_y = 125 + 30;
    
    if(isIpad){
        badge_startX = 83 * 1024.0/480.0;
        badge_y = 155 * 768.0/320.0;
    }
    
    badge_letterIdx = 0;
    badge_prevousLetterIdx = -1;
    badge_scale = 1.0;
    
    badge_letterIdx = kGrade_F;
    [s_gradeBadge setPosition:ccp(badge_x,badge_y)];
    [s_badge_letter[badge_letterIdx] setPosition:ccp(badge_x,badge_y)];
   
}

-(void) initLetters{
    
    if(isIpad){
        
        l_score = [CCLabelAtlas labelWithString:@"0" charMapFile:@"fontV2.png" itemWidth:44 itemHeight:54 startCharMap:'0'];
        l_turtleTapped = [CCLabelAtlas labelWithString:@"0" charMapFile:@"fontV2.png" itemWidth:44 itemHeight:54 startCharMap:'0'];
        l_combo = [CCLabelAtlas labelWithString:@"0" charMapFile:@"fontV1.png" itemWidth:24 itemHeight:28 startCharMap:'0'];
        l_bestScore = [CCLabelAtlas labelWithString:@"0" charMapFile:@"fontV1.png" itemWidth:24 itemHeight:28 startCharMap:'0'];
        l_bestGrade = [CCLabelAtlas labelWithString:@"0" charMapFile:@"fontV1.png" itemWidth:24 itemHeight:28 startCharMap:'0'];
        l_multiplier_FirstDigit = [CCLabelAtlas labelWithString:@"0" charMapFile:@"fontV2.png" itemWidth:44 itemHeight:54 startCharMap:'0'];
        l_multiplier_SecondDigit = [CCLabelAtlas labelWithString:@"0" charMapFile:@"fontV2.png" itemWidth:44 itemHeight:54 startCharMap:'0'];
        l_multiplier_Dot = [CCSprite spriteWithFile:@"ScoreShown_multiplierDot.png"];
    }else{
        
        l_score = [CCLabelAtlas labelWithString:@"0" charMapFile:@"fontV2.png" itemWidth:22 itemHeight:27 startCharMap:'0'];
        l_turtleTapped = [CCLabelAtlas labelWithString:@"0" charMapFile:@"fontV2.png" itemWidth:22 itemHeight:27 startCharMap:'0'];
        l_combo = [CCLabelAtlas labelWithString:@"0" charMapFile:@"fontV1.png" itemWidth:12 itemHeight:14 startCharMap:'0'];
        l_bestScore = [CCLabelAtlas labelWithString:@"0" charMapFile:@"fontV1.png" itemWidth:12 itemHeight:14 startCharMap:'0'];
        l_bestGrade = [CCLabelAtlas labelWithString:@"0" charMapFile:@"fontV1.png" itemWidth:12 itemHeight:14 startCharMap:'0'];
        l_multiplier_FirstDigit = [CCLabelAtlas labelWithString:@"0" charMapFile:@"fontV2.png" itemWidth:22 itemHeight:27 startCharMap:'0'];
        l_multiplier_SecondDigit = [CCLabelAtlas labelWithString:@"0" charMapFile:@"fontV2.png" itemWidth:22 itemHeight:27 startCharMap:'0'];
        l_multiplier_Dot = [CCSprite spriteWithFile:@"ScoreShown_multiplierDot.png"];
    }
    
    
    [l_combo setColor:ccc3(48, 94, 173)];
    [l_bestScore setColor:ccc3(48, 94, 173)];
    [l_bestGrade setColor:ccc3(48, 94, 173)];
    
   // [l_bestScore setAnchorPoint:ccp(1,0.5)];
    
    static int fuckOffset = 18;
    static int iPhone5OffsetX;
    if (isIphone5) {
        iPhone5OffsetX = 44;
    }else{
        iPhone5OffsetX = 0;
    }
    
    if(isIpad){
        [l_score setPosition:ccp(332 * 1024.0/480.0, 215 * 768.0/320.0 + 10)];
        [l_turtleTapped setPosition:ccp(129 * 1024.0/480.0 + 11, 215 * 768.0/320.0 + 10)];
        [l_combo setPosition:ccp(218 * 1024.0/480.0, 245 * 768.0/320.0 + 0)];
        [l_bestScore setPosition:ccp(350 * 1024.0/480.0 - 18, 181 * 768.0/320.0 + 28)];
        [l_bestGrade setPosition:ccp(367 * 1024.0/480.0 - 18, 181 * 768.0/320.0 + 28)];
        [l_multiplier_FirstDigit setPosition:ccp(195 * 1024.0/480.0, 215 * 768.0/320.0 + 10)];
        [l_multiplier_SecondDigit setPosition:ccp(225 * 1024.0/480.0, 215 * 768.0/320.0 + 10)];
        [l_multiplier_Dot setPosition:ccp(220 * 1024.0/480.0, 223 * 768.0/320.0 + 10)];
        
       /* [l_score setPosition:ccp(-(240 - 332) * 2 + 512,-(160 - 215) * 2 + 384)];
        [l_turtleTapped setPosition:ccp(-(240 - 129) * 2 + 512,-(160 - 215) * 2 + 384)];
        [l_combo setPosition:ccp(-(240 - 218) * 2 + 512,-(160 - 245) * 2 + 384)];
        [l_bestScore setPosition:ccp(-(240 - 350) * 2 + 512,-(160 - 181) * 2 + 384)];
        [l_bestGrade setPosition:ccp(-(240 - 367) * 2 + 512,-(160 - 181) * 2 + 384)];
        [l_multiplier_FirstDigit setPosition:ccp(-(240 - 195) * 2 + 512,-(160 - 215) * 2 + 384)];
        [l_multiplier_SecondDigit setPosition:ccp(-(240 - 225) * 2 + 512,-(160 - 215) * 2 + 384)];
        [l_multiplier_Dot setPosition:ccp(-(240 - 220) * 2 + 512,223)];*/

    }else{
        [l_score setPosition:ccp(332 + iPhone5OffsetX,215 + fuckOffset)];
        [l_turtleTapped setPosition:ccp(129 + iPhone5OffsetX,215 + fuckOffset)];
        [l_combo setPosition:ccp(218 + iPhone5OffsetX,245 + fuckOffset)];
        [l_bestScore setPosition:ccp(350 + iPhone5OffsetX,181 + fuckOffset)];
        [l_bestGrade setPosition:ccp(367 + iPhone5OffsetX,181 + fuckOffset)];
        [l_multiplier_FirstDigit setPosition:ccp(195 + iPhone5OffsetX,215 + fuckOffset)];
        [l_multiplier_SecondDigit setPosition:ccp(225 + iPhone5OffsetX,215 + fuckOffset)];
        [l_multiplier_Dot setPosition:ccp(220 + iPhone5OffsetX,223 + fuckOffset)];
    }
    
    
    
    
    [l_score setAnchorPoint:ccp(0.5,0)];
    [l_turtleTapped setAnchorPoint:ccp(0.5,0)];
    [l_combo setAnchorPoint:ccp(0.5,0)];
    [l_bestGrade setAnchorPoint:ccp(0.5,0)];
   // [l_totalCoin setAnchorPoint:ccp(0.5,0)];
    [l_bestScore setAnchorPoint:ccp(1.0,0)];
    
    [l_turtleTapped setScale:0.85];
    [l_multiplier_FirstDigit setScale:0.85];
    [l_multiplier_SecondDigit setScale:0.85];
    
    [self addChild:l_score];
    [self addChild:l_turtleTapped];
    [self addChild:l_combo];
    [self addChild:l_bestScore];
    [self addChild:l_bestGrade];
    //[self addChild:l_totalCoin];
    [self addChild:l_multiplier_FirstDigit];
    [self addChild:l_multiplier_SecondDigit];
    [self addChild:l_multiplier_Dot];
    
    [self updateLetters];

}

-(void) gameStep:(ccTime) dt{
    
   /* p4rc_spinningTimer++;
    if(p4rc_spinningTimer == 60){
        [self removeP4RCSpin];
    }*/
    
    if(isProtecting){
        protectingTimer++;
        if(protectingTimer == 30){
            isProtecting = false;
        }
    }
    
    
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
    badge_x = badge_startX + 307*2/textureRatioForFuckingIpad * gradeBarPercentage/100;
    if(gradeBarPercentage > 100){
        badge_x = badge_startX + 307*2/textureRatioForFuckingIpad;
    }
    
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
    if(gradeBarPercentage >= detectChangeGradebarPercentage && !hasClickedToStop){
        detectChangeGradebarPercentage += 20.0;
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
            [l_bestGrade setString:@"X"];
        }else{
            [l_bestGrade setString:@"F"];
        }
    }
    
    if(bestGrade == kGrade_E){
        [l_bestGrade setString:@"E"];
    }  
    if(bestGrade == kGrade_D){
        [l_bestGrade setString:@"D"];
    } 
    if(bestGrade == kGrade_C){
        [l_bestGrade setString:@"C"];
    } 
    if(bestGrade == kGrade_B){
        [l_bestGrade setString:@"B"];
    } 
    if(bestGrade == kGrade_A){
        [l_bestGrade setString:@"A"];
    } 
    if(bestGrade == kGrade_S){
        [l_bestGrade setString:@"S"];
    } 
    if(bestGrade == kGrade_SS){
        [l_bestGrade setString:@"SS"];
    } 
    
    
    //---------NEW
    [self updateTurtleCoinsDisplay];
    //[l_totalCoin setString:[NSString stringWithFormat:@"%i", displayTurtleCoin]];
    
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
        
        [l_multiplier_FirstDigit setPosition:ccp(195+5,215+18)];
        [l_multiplier_SecondDigit setPosition:ccp(225-5,215+18)];
    }
    
      
    [l_multiplier_FirstDigit setString:[NSString stringWithFormat:@"%i", multipier_FirstDigit]];
    [l_multiplier_SecondDigit setString:[NSString stringWithFormat:@"%i", multipier_SecondDigit]];
}

-(void) updateGradeBar{
    //gradeBarPercentage += (gradeBarMaxPercentage - gradeBarPercentage)/20;
    
    static float diffGradePercentage;
    static float applyGradeInterval;
    static float scoreMusicInterval;
    static float scoreMusicAccumToInterval;
    
    if(gradeBarPercentage == 0){
        scoreMusicAccumToInterval = 0;
       // [musicController playThisSound:kSound_Score isLoop:NO gain:1.0];
        [self playOneScoreSound];
    } 
    
    diffGradePercentage = gradeBarMaxPercentage - gradeBarPercentage;
    if(diffGradePercentage > 80){
        applyGradeInterval = 0.9;
        scoreMusicInterval = 2.0;
    }else if(diffGradePercentage > 60){
        applyGradeInterval = 0.75;
        scoreMusicInterval = 2.0;
    }else if(diffGradePercentage > 40){
        applyGradeInterval = 0.6;
        scoreMusicInterval = 2.0;
    }else if(diffGradePercentage > 22){
        applyGradeInterval = 0.5;
        scoreMusicInterval = 2.0;
    }else if(diffGradePercentage > 12){
        applyGradeInterval = 0.4;
        scoreMusicInterval = 2.0;
    }else{
        applyGradeInterval = 0.3;
        scoreMusicInterval = 2.1;
    }
    
    applyGradeInterval *= 0.8;
    
    if(diffGradePercentage < 7){
        
        gradeBarPercentage += (gradeBarMaxPercentage - gradeBarPercentage)/30;
        
        finalUpdateTimer++;
        if(finalUpdateTimer == 90){
            gradeBarPercentage = gradeBarMaxPercentage;
            //[musicController playThisSound:kSound_Score isLoop:NO gain:1.0];
            [self playOneScoreSound];
            isRunning = false;
        }
        
        
        if(gradeBarMaxPercentage - gradeBarPercentage > 2.2){
            scoreMusicInterval = 2.2;
        }else{
            scoreMusicInterval = 2000.2;
        }
        
        scoreMusicAccumToInterval += (gradeBarMaxPercentage - gradeBarPercentage)/30;
        if(scoreMusicAccumToInterval >= scoreMusicInterval){
            scoreMusicAccumToInterval = 0;
            //[musicController playThisSound:kSound_Score isLoop:NO gain:1.0];
            [self playOneScoreSound];
        }
        
    }else{
        gradeBarPercentage += applyGradeInterval;
        
        scoreMusicAccumToInterval += applyGradeInterval;
        if(scoreMusicAccumToInterval >= scoreMusicInterval){
            scoreMusicAccumToInterval = 0;
            //[musicController playThisSound:kSound_Score isLoop:NO gain:1.0];
            [self playOneScoreSound];
        }
    }
    
    
    
    if(gradeBarPercentage > gradeBarMaxPercentage){
        gradeBarPercentage = gradeBarMaxPercentage;
    }
    
    if(gradeBarPercentage > 100){
        [s_gradeBar_center setScaleX:1.0];
    }else{
        [s_gradeBar_center setScaleX:gradeBarPercentage/100.0];
    }
    
}

-(void) playOneScoreSound{
    if(score == 0){
        return;
    }
    
    if(arc4random() % 3 == 0){
        [musicController playThisSound:kSound_Score2 isLoop:NO gain:0.65];
    }else{
        [musicController playThisSound:kSound_Score isLoop:NO gain:0.65];
    }
}

-(void) updateScoreAndCoin{
    displayScore = gradeBarPercentage / gradeBarMaxPercentage * score;
   // displayTurtleCoin = gradeBarPercentage / gradeBarMaxPercentage * score/10 + turtleCoinAccum;
}


-(void) getValuesFromDB{
    turtleCoinAccum =  [[NSUserDefaults standardUserDefaults] integerForKey:@"turtleCoin"];
    printf("getValuesFromDB:%i\n",turtleCoinAccum);
    
    
    NSMutableString* scoreString = [NSMutableString string];
    
    [scoreString setString:@"score_mini_"];
    
    if(currentChosenMiniGame <= 9){
        [scoreString appendString:@"0"];
    }
    
    [scoreString appendFormat:@"%i", currentChosenMiniGame];
    bestScore =  [[NSUserDefaults standardUserDefaults] integerForKey:scoreString];
      
    
}

-(void) initGradeBar{
    
    s_gradeBar_left = [CCSprite spriteWithFile:@"ScoreShown_redbar_left.png"];
    s_gradeBar_center = [CCSprite spriteWithFile:@"ScoreShown_redbar_center.png"];
    s_gradeBar_highlight = [CCSprite spriteWithFile:@"ScoreShown_highlight.png"];
    
    [s_gradeBar_center setAnchorPoint:ccp(0,0.5)];
    
    [s_gradeBar_left setPosition:ccp(83,125 + 32)];
    [s_gradeBar_center setPosition:ccp(93,125 + 32)];
    [s_gradeBar_highlight setPosition:ccp(240,160 + 0)];
    
    if(isIphone5){
        [s_gradeBar_left setPosition:ccp(s_gradeBar_left.position.x + 44, s_gradeBar_left.position.y)];
        [s_gradeBar_center setPosition:ccp(s_gradeBar_center.position.x + 44, s_gradeBar_center.position.y)];
        [s_gradeBar_highlight setPosition:ccp(s_gradeBar_highlight.position.x + 44, s_gradeBar_highlight.position.y)];
    }
    
    if(isIpad){
        [s_gradeBar_left setPosition:ccp(-(240 - 83) * 2 + 512, -(160 - 157) * 2 + 384)];
        [s_gradeBar_center setPosition:ccp(-(240 - 93) * 2 + 512,-(160 - 157) * 2 + 384)];
        [s_gradeBar_highlight setPosition:ccp(-(240 - 240) * 2 + 512,-(160 - 160) * 2 + 384)];
    }
    
    [self addChild:s_gradeBar_left];
    [self addChild:s_gradeBar_center];
    [self addChild:s_gradeBar_highlight];
    
    [s_gradeBar_center setScaleX:0];
}

-(void) initMenu{
    CCMenuItem *mAchivement = [CCMenuItemImage itemWithNormalImage:@"ScoreShown_btn_achivement_off.png" selectedImage:@"ScoreShown_btn_achivement_on.png" target:self selector:@selector(mAchivementCallback:)];
    
	CCMenuItem *mNext = [CCMenuItemImage itemWithNormalImage:@"ScoreShown_btn_restartPlay_off.png" selectedImage:@"ScoreShown_btn_restartPlay_on.png" target:self selector:@selector(mNextCallback:)];
	CCMenuItem *mBack = [CCMenuItemImage itemWithNormalImage:@"ScoreShown_btn_restart_off.png" selectedImage:@"ScoreShown_btn_restart_on.png" target:self selector:@selector(mBackCallback:)];
	 CCMenuItem *mRocket = [CCMenuItemImage itemWithNormalImage:@"p4rcBtn_off.png" selectedImage:@"p4rcBtn_on.png" target:self selector:@selector(mRocketCallback:)];

	//[mMenu setPosition:ccp(-200, -122)];
    [mAchivement setPosition:ccp(-200, 122)];
    [mNext setPosition:ccp(200, -122)];
    [mBack setPosition:ccp(-200000, 122)];
    [mRocket setPosition:ccp(214-30, -60-7)];
    
    if(isIphone5){
        [mNext setPosition:ccp(244, -122)];
        [mAchivement setPosition:ccp(-244, 122)];
        //[mRocket setPosition:ccp(214-30 - 44, -60-7)];
    }
    
    if(isIpad){
        [mNext setPosition:ccp(440, -310)];
        [mAchivement setPosition:ccp(-440, 310)];
        [mRocket setPosition:ccp(184 * 1024.0/480.0, -67 * 768.0/320.0 + 20)];
    }
    

    
	CCMenu* menu = [CCMenu menuWithItems:mAchivement,mNext,mRocket, nil];
	[self addChild:menu];
}

-(void) mRocketCallback: (id) sender{
    [[P4RC sharedInstance] showMain];
}


-(void) mNextCallback: (id) sender{
    
    
    [musicController playThisSound:kSound_ButtonTap isLoop:NO gain:1.0];
    [musicController playThisSound:kSound_ButtonTap2 isLoop:NO gain:0.2];
    printf("A\n");
    if(isProtecting){
        return;
    }
 printf("B\n");
    if(isPoppingUp){
        return;
    }
    
   /* if(isShowingCompleted){
        [self clickToStopCompleted];
        return;
    }*/
    
     printf("C\n");
    if(isRunning){
        [self clickToStop];
        return;
    }
     printf("D\n");
    if(isPlayingAchivementAni){
       // return;
    }
    
     printf("E\n");
    if(miniGameIdx == maxTotalMiniChosen - 2){
        if(![[NSUserDefaults standardUserDefaults] boolForKey:@"main_hasPlayedBeginStory"]){
            [self showUnblockMainGame];
            return;
        }
    }
    
    //DELETE later
    //[self showUnblockMainGame];
   // return;
    
     printf("F\n");
    
    p4rc_canDisplayScore = false;
    
    if(isGoingToNextMiniGame){
        [[CCDirector sharedDirector] replaceScene: [SelectMiniGameScene2 scene]];
        return;
    }
    
   // goToNullWithNewPlayMusic = true;
   // [[CCDirector sharedDirector] replaceScene: [NullScene scene]];
    [[CCDirector sharedDirector] replaceScene: [SelectMiniGameScene2 scene]];
}

-(void) mAchivementCallback: (id) sender{
    [musicController playThisSound:kSound_ButtonTap isLoop:NO gain:1.0];
    [musicController playThisSound:kSound_ButtonTap2 isLoop:NO gain:0.2];
    
    if(isProtecting){
        return;
    }
    
    if(isPoppingUp){
        return;
    }
    
    if(isRunning){
        [self clickToStop];
        return;
    }
    
    if(isPlayingAchivementAni){
        //return;
    }
    
    if(miniGameIdx == maxTotalMiniChosen - 2){
        if(![[NSUserDefaults standardUserDefaults] boolForKey:@"main_hasPlayedBeginStory"]){
            [self showUnblockMainGame];
            return;
        }
    }
    
     p4rc_canDisplayScore = false;
    
    achivementIsGoingToSelectMiniScene = true;
    [[CCDirector sharedDirector] replaceScene: [AchivementScene scene]];

}

-(void) mBackCallback: (id) sender{
    [musicController playThisSound:kSound_ButtonTap isLoop:NO gain:1.0];
    [musicController playThisSound:kSound_ButtonTap2 isLoop:NO gain:0.2];
    
    if(isProtecting){
        return;
    }
    
    if(isPoppingUp){
        return;
    }
    
    /*if(isShowingCompleted){
        [self clickToStopCompleted];
        return;
    }*/
    
    
    if(isRunning){
        [self clickToStop];
        return;
    }
    
    if(isPlayingAchivementAni){
      //  return;
    }
    
    
   /* //DELETE LATER
    [gameCenterController submitScore];
    [gameCenterController showLeaderboard];
    return;*/
    
     p4rc_canDisplayScore = false;
    
    [[CCDirector sharedDirector] replaceScene: [SelectMiniGameScene2 scene]];
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
    hasClickedToStop = true;
    badge_letterIdx = grade;
    
    isChangingBadgeGrade = true;
    chaningBadeGradeTimer = 0;
    badge_prevousLetterIdx = badge_letterIdx;
    badge_previousLetterScale = 1.0;
    badge_letterScale = 0.0;
    badge_scale = 1.0;
    badge_previousLetterOpacity = 255;
    [self setTurtleCoinAni];
}

-(void) getScoreAndGrade{
    score = numTapped * multipier;
    displayTurtleCoin = turtleCoinAccum;
    
    scoreLimitToGrade[0] = 80;
    scoreLimitToGrade[1] = 150;
    scoreLimitToGrade[2] = 250;
    scoreLimitToGrade[3] = 400;
    scoreLimitToGrade[4] = 630;
    scoreLimitToGrade[5] = 800;
    
    if(currentChosenMiniGame == 1){
        scoreLimitToGrade[0] = 50;
        scoreLimitToGrade[1] = 100;
        scoreLimitToGrade[2] = 200;
        scoreLimitToGrade[3] = 400;
        scoreLimitToGrade[4] = 700;
        scoreLimitToGrade[5] = 950;
    }
    if(currentChosenMiniGame == 2){
        scoreLimitToGrade[0] = 40;
        scoreLimitToGrade[1] = 150;
        scoreLimitToGrade[2] = 280;
        scoreLimitToGrade[3] = 400;
        scoreLimitToGrade[4] = 600;
        scoreLimitToGrade[5] = 660;
    }
    if(currentChosenMiniGame == 3){
        scoreLimitToGrade[0] = 60;
        scoreLimitToGrade[1] = 150;
        scoreLimitToGrade[2] = 250;
        scoreLimitToGrade[3] = 450;
        scoreLimitToGrade[4] = 650;
        scoreLimitToGrade[5] = 800;
    }
    if(currentChosenMiniGame == 4){
        scoreLimitToGrade[0] = 30;
        scoreLimitToGrade[1] = 70;
        scoreLimitToGrade[2] = 150;
        scoreLimitToGrade[3] = 340;
        scoreLimitToGrade[4] = 550;
        scoreLimitToGrade[5] = 900;
    }
    if(currentChosenMiniGame == 5){
        scoreLimitToGrade[0] = 50;
        scoreLimitToGrade[1] = 100;
        scoreLimitToGrade[2] = 200;
        scoreLimitToGrade[3] = 350;
        scoreLimitToGrade[4] = 600;
        scoreLimitToGrade[5] = 700;
    }
    if(currentChosenMiniGame == 10){
       /* scoreLimitToGrade[0] = 80;
        scoreLimitToGrade[1] = 140;
        scoreLimitToGrade[2] = 220;
        scoreLimitToGrade[3] = 320;
        scoreLimitToGrade[4] = 450;
        scoreLimitToGrade[5] = 700;*/
        
        scoreLimitToGrade[0] = 60;
        scoreLimitToGrade[1] = 180;
        scoreLimitToGrade[2] = 250;
        scoreLimitToGrade[3] = 420;
        scoreLimitToGrade[4] = 660;
        scoreLimitToGrade[5] = 900;
    }
    if(currentChosenMiniGame == 11){
        scoreLimitToGrade[0] = 70;
        scoreLimitToGrade[1] = 120;
        scoreLimitToGrade[2] = 230;
        scoreLimitToGrade[3] = 350;
        scoreLimitToGrade[4] = 530;
        scoreLimitToGrade[5] = 730;
    }
    if(currentChosenMiniGame == 13){
        scoreLimitToGrade[0] = 40;
        scoreLimitToGrade[1] = 90;
        scoreLimitToGrade[2] = 190;
        scoreLimitToGrade[3] = 350;
        scoreLimitToGrade[4] = 650;
        scoreLimitToGrade[5] = 900;
    }
    if(currentChosenMiniGame == 103){
        scoreLimitToGrade[0] = 40;
        scoreLimitToGrade[1] = 75;
        scoreLimitToGrade[2] = 170;
        scoreLimitToGrade[3] = 300;
        scoreLimitToGrade[4] = 600;
        scoreLimitToGrade[5] = 850;
    }
    
    if(score < scoreLimitToGrade[0]){
        grade = kGrade_F;
        gradeBarMaxPercentage = 0;
        gradeBarMaxPercentage +=  score/scoreLimitToGrade[0] * 20.0;
    }else if(score < scoreLimitToGrade[1]){
        grade = kGrade_E;
        gradeBarMaxPercentage = 20.0;
        gradeBarMaxPercentage += (score - scoreLimitToGrade[0])/(scoreLimitToGrade[1] - scoreLimitToGrade[0]) * 20.0;
    }else if(score < scoreLimitToGrade[2]){
        grade = kGrade_D;
        gradeBarMaxPercentage = 40.0;
        gradeBarMaxPercentage += (score - scoreLimitToGrade[1])/(scoreLimitToGrade[2] - scoreLimitToGrade[1]) * 20.0;
    }else if(score < scoreLimitToGrade[3]){
        grade = kGrade_C;
        gradeBarMaxPercentage = 60.0;
        gradeBarMaxPercentage += (score - scoreLimitToGrade[2])/(scoreLimitToGrade[3] - scoreLimitToGrade[2]) * 20.0;
    }else if(score < scoreLimitToGrade[4]){
        grade = kGrade_B;
        gradeBarMaxPercentage = 80.0;
        gradeBarMaxPercentage += (score - scoreLimitToGrade[3])/(scoreLimitToGrade[4] - scoreLimitToGrade[3]) * 20.0;
    }else if(score < scoreLimitToGrade[5]){
        grade = kGrade_A;
        gradeBarMaxPercentage = 100.0;
        gradeBarMaxPercentage += (score - scoreLimitToGrade[4])/(scoreLimitToGrade[5] - scoreLimitToGrade[3]) * 20.0;
    }else{
        grade = kGrade_S;
        gradeBarMaxPercentage = 120;
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
    
    if(gradeBarMaxPercentage <= 0.5){
        gradeBarMaxPercentage = 0.5;
    }

    
    gradeBarPercentage = 0;
    
    
    printf("gradeBarMaxPercentage:%4.8f\n",gradeBarMaxPercentage);
    
 
    
}

- (void) dealloc
{
	printf("ScoreShown Scene Dealloc\n");
   [self removeP4RCSpin];
    
    [turtleCoinString release];;
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
     heyzap.position = ccp(-135-10,-60-7-6);
    
    if(isIpad){
        heyzap.position = ccp(-145 * 1024.0/480.0,-73 * 768.0/320.0);
    }
}

- (void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
     printf("SDFSDFDSFSDFDSFDSFSDFSDFDSn");
    
    if(isPoppingUp){
        return;
    }
    
    for( UITouch *touch in touches ) {
		CGPoint location = [touch locationInView: [touch view]];
		location = [[CCDirector sharedDirector] convertToGL: location];
        printf("TTTT:%4.8f %4.8f\n",location.x, location.y);
        
        for(int i = 0 ; i < 5 ; i++){
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


-(void) saveToDBPre{
    NSMutableString* miniCounterString = [NSMutableString string];
    [miniCounterString setString:@"counter_mini_"];
        
    if(currentChosenMiniGame <= 9){
        [miniCounterString appendString:@"0"];
    }
    
    [miniCounterString appendFormat:@"%i", currentChosenMiniGame];
    
    static int preCounterAchivement;
    preCounterAchivement = [[NSUserDefaults standardUserDefaults] integerForKey:miniCounterString];
    preCounterAchivement += counterForAchivement;
    
    printf("preCounterAchivement:%i\n", preCounterAchivement);
  //  NSLog(miniCounterString);
    
    [[NSUserDefaults standardUserDefaults] setInteger:preCounterAchivement forKey:miniCounterString];
}

-(void) saveToDB{
    
    static int saveTurtleCoinAccum;
    
    save_bestScore = score;
    
    saveTurtleCoinAccum = turtleCoinAccum;
    
    for(int i = 0 ; i < howmanyAchivement ; i++){
        if(save_unblockAchivementIdx[i] != -1){
            
            saveTurtleCoinAccum += ahievementReward[save_unblockAchivementIdx[i]];
            
            
            NSMutableString* achivementString = [NSMutableString string];
            [achivementString setString:@"achivement_"];
            
            if(save_unblockAchivementIdx[i] < 9){
                [achivementString appendString:@"0"];
            }
            
            [achivementString appendFormat:@"%i", save_unblockAchivementIdx[i]+1];
            
            // NSLog(achivementString);
            
            [[NSUserDefaults standardUserDefaults] setBool:true forKey:achivementString];
        }
    }
    
  //  save_coins = score/10 + saveTurtleCoinAccum;
  //  [[NSUserDefaults standardUserDefaults] setInteger:save_coins forKey:@"turtleCoin"];
    
    if(save_bestScore > bestScore){
        NSMutableString* scoreString = [NSMutableString string];
        
        [scoreString setString:@"score_mini_"];
        
        if(currentChosenMiniGame <= 9){
            [scoreString appendString:@"0"];
        }
        
        [scoreString appendFormat:@"%i", currentChosenMiniGame];
        
        //NSLog(scoreString);
        
        [[NSUserDefaults standardUserDefaults] setInteger:save_bestScore forKey:scoreString];
    }
    
    
    printf("saveDB:%i %i\n",save_bestScore,save_coins);
    
}



-(void) initTurtleCoins{
    maxCoinWords = 10;
    
    ss_Font03  = [CCSpriteBatchNode batchNodeWithFile:@"fontV3.png" capacity:1];
    [self addChild:ss_Font03 z:kDeapth_Turtle_Bombing2];
    
    for(int i = 0 ; i < maxCoinWords ; i++){
        l_coin[i] = [CCSprite spriteWithTexture:ss_Font03.texture rect:CGRectMake(0, 0, 0, 0)];
        
        [l_coin[i] setPosition:ccp(10000,100000)];
        [l_coin[i] setAnchorPoint:ccp(0,0)];
        [ss_Font03 addChild: l_coin[i]];
    }
    
    turtleCoinString = [[NSMutableString string] retain];
}


-(void) updateTurtleCoinsDisplay{
    for(int i = 0 ; i < maxCoinWords ; i++){
        [l_coin[i] setPosition:ccp(10000,100000)];
    }
    
    totalPrice = displayTurtleCoin;
    
    //printf("totalPrice:%i\n",totalPrice);
    
    [turtleCoinString setString:@""];
    [turtleCoinString appendFormat:@"%i", totalPrice];
    
    scoreShown_totalPriceChar = [turtleCoinString UTF8String];
    
    fontTexture_numInRow = 10;
    fontTexture_offsetX = 17 * 2/textureRatioForFuckingIpad;
    fontTexture_offsetY = 21  * 2/textureRatioForFuckingIpad;
    fontTexture_startX = 0;
    fontTexture_howmanyCol = 4;
    
    sentense01_AccumOffset = 0;
    setense01_offsetX = 10;
    
     int setense01StartDisplayX;
     int setense01StartDisplayY;
    
    for(int k = 0 ; k < maxCoinWords ; k++){
        [l_coin[k] setScale:1.0];
    }
    
    setense01StartDisplayX = 400;
    setense01StartDisplayY = 255;
    
    
    if(totalPrice <= 9){
        setense01StartDisplayX = 439;
        for(int k = 0 ; k < maxCoinWords ; k++){
            [l_coin[k] setScale:1.0];
        }
    }else if(totalPrice <= 99){
        setense01StartDisplayX = 432;
        setense01_offsetX = 16;
        for(int k = 0 ; k < maxCoinWords ; k++){
            [l_coin[k] setScale:1.0];
        }
    }else if(totalPrice <= 999){
        setense01StartDisplayX = 428;
        setense01_offsetX = 13;
        for(int k = 0 ; k < maxCoinWords ; k++){
            [l_coin[k] setScale:0.9];
        }
    }else if(totalPrice <= 9999){
        setense01StartDisplayX = 426;
        setense01_offsetX = 11;
        for(int k = 0 ; k < maxCoinWords ; k++){
            [l_coin[k] setScale:0.8];
        }
    }else if(totalPrice <= 99999){
        setense01StartDisplayX = 423;
        setense01_offsetX = 10;
        for(int k = 0 ; k < maxCoinWords ; k++){
            [l_coin[k] setScale:0.75];
        }
    }else if(totalPrice <= 999999){
        setense01StartDisplayX = 420;
        setense01_offsetX = 9;
        for(int k = 0 ; k < maxCoinWords ; k++){
            [l_coin[k] setScale:0.69];
        }
    }else{
        setense01StartDisplayX = 415;
        setense01_offsetX = 8;
        for(int k = 0 ; k < maxCoinWords ; k++){
            [l_coin[k] setScale:0.62];
        }
    }
    
    if(isIpad){
        setense01StartDisplayX *=   1024.0/480.0;
        setense01StartDisplayX -= 25;
        setense01StartDisplayY *=   768.0/320.0;
        setense01StartDisplayY -= 50;
        setense01_offsetX *= 2;
    }
    
    if(isIphone5){
        setense01StartDisplayX += 44;
    }
    
    
    for (int i=0; scoreShown_totalPriceChar[i]; i++){
        
        startToFuckIdx = scoreShown_totalPriceChar[i] - 48;
        
        if(startToFuckIdx < 0){
            startToFuckIdx = 64 - 48;
            sentense01_AccumOffset -= 4 * 2/textureRatioForFuckingIpad;
        }
        
        // fontTexture_chosenCol = fontTexture_howmanyCol + 1;
        fontTexture_chosenCol = -1;
        do{
            
            fontTexture_chosenRow = startToFuckIdx;
            fontTexture_chosenCol++;
            
            startToFuckIdx -= fontTexture_numInRow;
        }while(startToFuckIdx >= 0);
        
        // printf("iii:%i\n",i);
        
        [l_coin[i] setTextureRect:CGRectMake(fontTexture_chosenRow * fontTexture_offsetX, fontTexture_chosenCol * fontTexture_offsetY, fontTexture_offsetX, fontTexture_offsetY)];
        
        
        [l_coin[i] setPosition:ccp(sentense01_AccumOffset + setense01StartDisplayX, setense01StartDisplayY)];
        sentense01_AccumOffset += setense01_offsetX;
        
    }
}


-(void) showUnblockMainGame{
    isPoppingUp = true;
    isUnblockingMainGame = true;
    
    s_unblockMainDialog = [CCSprite spriteWithFile:@"selectMini_unblockMain.png"];
    [self addChild:s_unblockMainDialog];
    [s_unblockMainDialog setPosition:ccp(240,175)];
    
    CCMenuItem *mUnblock = [CCMenuItemImage itemWithNormalImage:@"selectMini_unblockMain_btn_off.png" selectedImage:@"selectMini_unblockMain_btn_on.png" target:self selector:@selector(mMainUnblockCallback:)];
   
	[mUnblock setPosition:ccp(0, -20)];
    
	 m_unblockMainBtn = [CCMenu menuWithItems:mUnblock, nil];
	[self addChild:m_unblockMainBtn];

}

-(void) mMainUnblockCallback: (id) sender{
    storyType = 0;
    p4rc_canDisplayScore = false;
    [[CCDirector sharedDirector] replaceScene: [StoryScene scene]];
}


-(void) checkIfGoToNextMiniGame{
    printf("checkIfGoToNextMiniGame\n");
    if(miniGameIdx == maxTotalMiniChosen - 2){
        isGoingToNextMiniGame = false;
        
        printf("UNBLOCK MAIN\n");
        [[NSUserDefaults standardUserDefaults] setBool:true forKey:@"main_hasUnblocked"];
        
        NSString *key2 = [NSString stringWithFormat:@"mini_hasPlayed_%02d", currentChosenMiniGame];
       // NSLog(key2);
        [[NSUserDefaults standardUserDefaults] setBool:true forKey:key2];
        
        return;
    }
    
   /* if(currentChosenMiniGame == 13){
        printf("UNBLOCK MAIN\n");
        [[NSUserDefaults standardUserDefaults] setBool:true forKey:@"main_hasUnblocked"];
    }*/
    
    
    isGoingToNextMiniGame = false;
    
    NSString *key2 = [NSString stringWithFormat:@"mini_hasPlayed_%02d", currentChosenMiniGame];
   // NSLog(key2);
    [[NSUserDefaults standardUserDefaults] setBool:true forKey:key2];
    
    NSString *key = [NSString stringWithFormat:@"mini_hasPlayed_%02d", miniGameOrder[miniGameIdx+1]];
    static bool nextHasPlayed;
   //  NSLog(key);
    nextHasPlayed = [[NSUserDefaults standardUserDefaults] boolForKey:key];
    
    if(!nextHasPlayed){
        isGoingToNextMiniGame = true;
        printf("isGoingToNextMiniGameisGoingToNextMiniGameisGoingToNextMiniGameisGoingToNextMiniGame\n");
    }
    
    
}

@end
