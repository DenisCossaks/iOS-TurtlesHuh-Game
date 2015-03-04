//
//  SelectMiniGameScene2.m
//  TurtlesHuh
//
//  Created by  on 2012/8/15.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "SelectMiniGameScene2.h"
#import "Global.h"
#import "CoverScene.h"
#import "AchivementScene.h"
#import "GamePlayGlobal.h"
#import "PlayScene.h"
#import "ScoreShownScene.h"
#import "AppDelegate.h"

@implementation SelectMiniGameScene2

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	SelectMiniGameScene2 *layer = [SelectMiniGameScene2 node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

-(void) updateDisplay{
  //  printf("updateDisplay:A\n");
    if(idx == maxTotalMiniChosen - 1){
        [s_block setPosition:ccp(100000,200)];
        
        for(int i = 0 ; i < maxTotalMiniChosen ; i++){
            if(i == idx){
                [s_selectOn setPosition:ccp(selectPosX + selectOffsetX * i,selectPosY)];
                [s_selectOff[i] setPosition:ccp(10000,100000)];
                [s_content[i] setPosition:ccp([UIScreen mainScreen].bounds.size.height/2,169)];
                
                if(isIpad){
                     [s_content[i] setPosition:ccp([UIScreen mainScreen].bounds.size.height/2,169 * 768.0/320.0
                                                   )];
                }
                
                //printf("blockStartIdx:%i %i\n",blockStartIdx,i);

            }else{
                [s_selectOff[i] setPosition:ccp(selectPosX + selectOffsetX * i,selectPosY)];
                [s_content[i] setPosition:ccp(10000,100000)];
                //  printf("updateDisplay:B : %i\n",i);
            }
        }
        // printf("updateDisplay:C\n");
        
        currentChosenMiniGame =  -999;
        
         [l_minigame setString:@""];
        
        for(int i = 0 ; i < maxAchivements ; i++){
            [s_icon[i] setPosition:ccp(10000,10000)];
        }
        
        return;
    }
    
    [s_block setPosition:ccp(100000,200)];
    
    for(int i = 0 ; i < maxTotalMiniChosen ; i++){
        if(i == idx){
            [s_selectOn setPosition:ccp(selectPosX + selectOffsetX * i,selectPosY)];
            [s_selectOff[i] setPosition:ccp(10000,100000)];
            [s_content[i] setPosition:ccp([UIScreen mainScreen].bounds.size.height/2,169)];
            
            if(isIpad){
                [s_content[i] setPosition:ccp([UIScreen mainScreen].bounds.size.height/2,169 * 768.0/320.0
                                              )];
            }
            
            //printf("blockStartIdx:%i %i\n",blockStartIdx,i);
            
            if(i >= blockStartIdx){
                
                if(isIpad){
                    [s_block setPosition:ccp([UIScreen mainScreen].bounds.size.height/2 - 1 * 2/textureRatioForFuckingIpad, 169 * 768.0/320.0 + 4 * 2/textureRatioForFuckingIpad)];
                    

                }else{
                    
                    [s_block setPosition:ccp([UIScreen mainScreen].bounds.size.height/2 - 1 * 2/textureRatioForFuckingIpad, [UIScreen mainScreen].bounds.size.width/2 + 9)];
                    

                }
                                printf("BLOC:%i pos:%4.8f %4.8f\n",i, s_block.position.x, s_block.position.y );
            }
            
        }else{
            [s_selectOff[i] setPosition:ccp(selectPosX + selectOffsetX * i,selectPosY)];
            [s_content[i] setPosition:ccp(10000,100000)];
          //  printf("updateDisplay:B : %i\n",i);
        }
    }
   // printf("updateDisplay:C\n");
    
    currentChosenMiniGame =  miniGameOrder[idx];
    
    [l_minigame setString:[NSString stringWithFormat:@"%i", idx+1]];
  //  printf("updateDisplay:D\n");
    
    for(int i = 0 ; i < maxAchivements ; i++){
        [s_icon[i] setPosition:ccp(10000,10000)];
    //    printf("updateDisplay:E :%i\n",i);
    }
    
    printf("updateDisplay:F :%i %i\n",idx,currentChosenMiniGame);
    for(int i = 0 ; i < 5 ; i++){
      //  printf("updateDisplay:GF %i\n", 5* idx + i);
        [s_icon[5 * idx + i] setPosition:ccp(iconPosX[i],iconPosY)];
     //   printf("updateDisplay:G %i\n", 5* idx + i);
    }
    
    
    
    static int bestScore;
    static int bestGrade;
    NSMutableString* scoreString = [NSMutableString string];
    
    [scoreString setString:@"score_mini_"];
    
    if(currentChosenMiniGame <= 9){
        [scoreString appendString:@"0"];
    }
    
    [scoreString appendFormat:@"%i", currentChosenMiniGame];
    bestScore = [[NSUserDefaults standardUserDefaults] integerForKey:scoreString];
    [l_score setString:[NSString stringWithFormat:@"%i", bestScore]];
    //DELETE LATER
    //[l_score setString:[NSString stringWithFormat:@"%i", 124]];
   // printf("updateDisplay:H\n");
    
    if(bestScore <= 9){
        [l_score setPosition:ccp(257,72)];
        [l_score setPosition:ccp(257 * 1024.0/480.0, 72 * 768.0/320.0 + 34)];
    }else{
         [l_score setPosition:ccp(253,72)];
        [l_score setPosition:ccp(253 * 1024.0/480.0, 72 * 768.0/320.0 + 34)];
    }
    
    if(isIphone5){
        [l_score setPosition:ccp(l_score.position.x + 44, l_score.position.y)];
    }
    
   // printf("updateDisplay:I\n");
    
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
    
    
   // printf("updateDisplay:J\n");
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
    
    if(bestGrade == kGrade_F){
        if(bestScore == 0){
            [l_grade setString:@"X"];
        }else{
            [l_grade setString:@"F"];
        }
    }
    
    if(bestGrade == kGrade_E){
        [l_grade setString:@"E"];
    }  
    if(bestGrade == kGrade_D){
        [l_grade setString:@"D"];
    } 
    if(bestGrade == kGrade_C){
        [l_grade setString:@"C"];
    } 
    if(bestGrade == kGrade_B){
        [l_grade setString:@"B"];
    } 
    if(bestGrade == kGrade_A){
        [l_grade setString:@"A"];
    } 
    if(bestGrade == kGrade_S){
        [l_grade setString:@"S"];
    } 
    if(bestGrade == kGrade_SS){
        [l_grade setString:@"SS"];
    } 
   // printf("updateDisplay:K\n");
}

-(void) initContent{
    s_block = [CCSprite spriteWithFile:@"selectMini_lock.png"];
    s_content[0] = [CCSprite spriteWithFile:@"selectMini_content01.png"];
     s_content[1] = [CCSprite spriteWithFile:@"selectMini_content02.png"];
     s_content[2] = [CCSprite spriteWithFile:@"selectMini_content03.png"];
     s_content[3] = [CCSprite spriteWithFile:@"selectMini_content04.png"];
     s_content[4] = [CCSprite spriteWithFile:@"selectMini_content05.png"];
     s_content[5] = [CCSprite spriteWithFile:@"selectMini_content06.png"];
     s_content[6] = [CCSprite spriteWithFile:@"selectMini_content07.png"];
     s_content[7] = [CCSprite spriteWithFile:@"selectMini_content08.png"];
     s_content[8] = [CCSprite spriteWithFile:@"selectMini_content09.png"];
     s_content[9] = [CCSprite spriteWithFile:@"selectMini_updateCOming.png"];
    
    
    for(int i = 0 ; i < maxTotalMiniChosen ; i++){
        [self addChild:s_content[i]];
        [s_content[i] setPosition:ccp(10001,100000)];
    }
    
    [self addChild:s_block];
    [s_block setPosition:ccp(10001,100000)];
    
    
    selectPosX = 382/2 - 15;
    selectPosY = 320 - 452/2 - 5;
    selectOffsetX = 15;
    
    if(isIphone5){
        selectPosX += 44;
    }
    
    if(isIpad){
        selectPosX *= 1024.0/480.0;
        selectPosY *= 768.0/320.0;
        selectPosY += 30;
        selectOffsetX *= 2;
    }
    
    
    for(int i = 0 ; i < maxTotalMiniChosen ; i++){
        s_selectOff[i] = [CCSprite spriteWithFile:@"selectMini_selectOff.png"];
        [self addChild:s_selectOff[i]];
        [s_selectOff[i] setPosition:ccp(10000,100000)];
    }
    
    s_selectOn = [CCSprite spriteWithFile:@"selectMini_selectOn.png"];
    [self addChild:s_selectOn];
    [s_selectOn setPosition:ccp(10000,100000)];

}

-(void) initLabels{
    
    if(isIpad){
        l_minigame = [CCLabelAtlas labelWithString:@"0" charMapFile:@"fontV4.png" itemWidth:40 itemHeight:46 startCharMap:'0'];
        [l_minigame setPosition:ccp(680,598)];
    }else{
        l_minigame = [CCLabelAtlas labelWithString:@"0" charMapFile:@"fontV4.png" itemWidth:20 itemHeight:23 startCharMap:'0'];
        [l_minigame setPosition:ccp(326,267)];
    }
    
    
    [self addChild:l_minigame];
    
    if(isIpad){
        l_grade = [CCLabelAtlas labelWithString:@"0" charMapFile:@"fontV1.png" itemWidth:24 itemHeight:28 startCharMap:'0'];
        [l_grade setPosition:ccp(301 * 1024.0/480.0 - 10, 65 * 768.0/320.0 + 40)];
    }else{
        l_grade = [CCLabelAtlas labelWithString:@"0" charMapFile:@"fontV1.png" itemWidth:12 itemHeight:14 startCharMap:'0'];
        [l_grade setPosition:ccp(301,65)];
    }
    
   
    [self addChild:l_grade];
    
    if(isIpad){
        l_score = [CCLabelAtlas labelWithString:@"0" charMapFile:@"fontV1.png" itemWidth:24 itemHeight:28 startCharMap:'0'];
        [l_score setPosition:ccp(253 * 1024.0/480.0, 72 * 768.0/320.0)];
    }else{
        l_score = [CCLabelAtlas labelWithString:@"0" charMapFile:@"fontV1.png" itemWidth:12 itemHeight:14 startCharMap:'0'];
        [l_score setPosition:ccp(253,72)];
    }
    
    
    [self addChild:l_score];
    
    if(isIphone5){
        [l_grade setPosition:ccp(l_grade.position.x + 44, l_grade.position.y)];
        [l_score setPosition:ccp(l_score.position.x + 44, l_score.position.y)];
    }
    
    [l_score setAnchorPoint:ccp(0.0,0.5)];
}

-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
        
        AppController *appDelegate =(AppController*) [[UIApplication sharedApplication] delegate];
        [appDelegate getAchivementValues];

        self.isTouchEnabled = YES;
        isPoppingUp = false;
        isShowingInstruction = false;
        [musicController initForBegin];
        
        CCSprite* s_bg = [CCSprite spriteWithFile:@"mainMission_bg.png"];
        [s_bg setPosition:ccp([UIScreen mainScreen].bounds.size.height/2, [UIScreen mainScreen].bounds.size.width/2)];
        [self addChild:s_bg];
        
        
        CCSprite* s_bg2 = [CCSprite spriteWithFile:@"selectMini_bg.png"];
        [s_bg2 setPosition:ccp([UIScreen mainScreen].bounds.size.height/2, [UIScreen mainScreen].bounds.size.width/2)];
        [self addChild:s_bg2];
        
        
        [self initContent];
        [self initMenu];
        [self initLabels];

        
        idx = 0;
        blockStartIdx = 1;
       // printf("PPP:%i\n",blockStartIdx);
        if(isGoingToNextMiniGame){
            idx = miniGameIdx + 1;
            isGoingToNextMiniGame = false;
        }else{
            idx = miniGameIdx;
        }
        
        for(int i = 0 ; i < maxMiniGames ; i++){
           // printf("blockStartIdxblockStartIdx:%i %i\n",i,blockStartIdx);
            
            NSString *key = [NSString stringWithFormat:@"mini_hasPlayed_%02d", i+1];
           // NSLog(key);
            hasPlayedMiniGames[i] = [[NSUserDefaults standardUserDefaults] boolForKey:key];
            
            if(hasPlayedMiniGames[i]){
                blockStartIdx++;
              //  printf("hasPlayed:%i %i\n",i,blockStartIdx);
            }
        }
        
        if(isGoingSelectMIniAfterPlay){
            isGoingSelectMIniAfterPlay = false;
            if(blockStartIdx != maxTotalMiniChosen){
                idx = blockStartIdx - 1;
            }
            
            isTraitionDisappearing = false;
            isTransitioning = true;
            transitionGain = 0.0;
            transitionTimer = 0;
            transitionOpacity = 255;
            isGoingFromMainPlayScene = false;
            [s_transition setPosition:ccp(240,160)];

        }      
        
        [self initAchivements];
        [self initAchivementPopup];
        [self updateDisplay];
        
        [self initTransition];
        [self schedule: @selector(gameStep:)];

                
    }
	return self;
}

-(void) initAchivementPopup{
    achivementPopup = [AchivementPopup node];
    [self addChild:achivementPopup];
    [achivementPopup setDelegate:self];
}

-(void) showAchivementPopup{
    isPoppingUp = true;
    
    [achivementPopup setX:240];
    [achivementPopup setY:110];
    
    if(isIphone5){
        [achivementPopup setX:240 + 44];
    }
    
    if(isIpad){
        [achivementPopup setX:-(240 - 240) * 2 + 512];
        [achivementPopup setY:-(160 - 110) * 2 + 384];
    }
    
    // printf("show generalAchviementPosIdx:%i\n",generalAchviementPosIdx);
    if(isIpad){
        [achivementPopup popupAchivementDetails:generalAchviementPosIdx + idx * 5 arrowIsUp:false arrowX:iconPosX[generalAchviementPosIdx]-230*2/textureRatioForFuckingIpad-30];
        
    }else{
        [achivementPopup popupAchivementDetails:generalAchviementPosIdx + idx * 5 arrowIsUp:false arrowX:iconPosX[generalAchviementPosIdx]-230];
        
    }
    
    [menu setPosition:ccp(1000,100000)];
}

-(void) removePopup{
    isPoppingUp = false;
    [menu setPosition:ccp([UIScreen mainScreen].bounds.size.height/2,[UIScreen mainScreen].bounds.size.width/2)];
}


-(void) initAchivements{
    for(int i = 0 ; i < maxAchivements ; i++){
        
        if(hasFinishedThisAchivements[i]){
            NSString *key = [NSString stringWithFormat:@"icon_Achievement_%02d.png", i+1];
            s_icon[i] = [CCSprite spriteWithFile:key];
        }else{
            s_icon[i] = [CCSprite spriteWithFile:@"icon_Achievement_unblock.png"];
        }
        
        [self addChild: s_icon[i]];
        [s_icon[i] setPosition:ccp(10000,10000)];
        [s_icon[i] setScale:0.9];
    }
    
    int startX;
    int startY;
    int offsetX;
    startX = 148;
    startY = 40;
    offsetX = 47;
    
    if(isIphone5){
        startX += 44;
    }
    
    if(isIpad){
        startX = 310;
        offsetX  = 100;
        startY = 140;
    }
    
    iconPosY = startY;
    iconPosX[0] = startX + offsetX * 0;
    iconPosX[1] = startX + offsetX * 1;
    iconPosX[2] = startX + offsetX * 2;
    iconPosX[3] = startX + offsetX * 3;
    iconPosX[4] = startX + offsetX * 4;
}

-(void) initMenu{
	CCMenuItem *mLeft = [CCMenuItemImage itemWithNormalImage:@"ScoreShown_btn_restartPlay_off.png" selectedImage:@"ScoreShown_btn_restartPlay_on.png" target:self selector:@selector(mLeftCallback:)];
	CCMenuItem *mRight = [CCMenuItemImage itemWithNormalImage:@"ScoreShown_btn_restartPlay_off.png" selectedImage:@"ScoreShown_btn_restartPlay_on.png" target:self selector:@selector(mRightCallback:)];
	CCMenuItem *mInstruction = [CCMenuItemImage itemWithNormalImage:@"ScoreShown_btn_instruction_off.png" selectedImage:@"ScoreShown_btn_instruction_on.png" target:self selector:@selector(mInstructionCallback:)];
	CCMenuItem *mBack = [CCMenuItemImage itemWithNormalImage:@"ScoreShown_btn_restart_off.png" selectedImage:@"ScoreShown_btn_restart_on.png" target:self selector:@selector(mBackCallback:)];
	
    [mLeft setScaleX:-1];
    
	
	[mLeft setPosition:ccp(-181, 0)];
    [mRight setPosition:ccp(181, 0)];
    [mInstruction setPosition:ccp(204, 125)];
    [mBack setPosition:ccp(-204, 125)];
    
    [mInstruction setScale:0.79];
    [mBack setScale:0.79];
    
    if(isIphone5){
        [mBack setPosition:ccp(-204 - 44, 125)];
        [mInstruction setPosition:ccp(204 + 44, 125)];
    }
    
    if(isIpad){
        [mLeft setPosition:ccp(-350, 0)];
        [mRight setPosition:ccp(350, 0)];
        [mInstruction setPosition:ccp(420, 300)];
        [mBack setPosition:ccp(-420, 300)];
    }
    
    menu = [CCMenu menuWithItems:mLeft,mInstruction,mRight,mBack, nil];
    
	[self addChild:menu];
}

-(void) mLeftCallback: (id) sender{
    [musicController playThisSound:kSound_ButtonTap isLoop:NO gain:1.0];
    [musicController playThisSound:kSound_ButtonTap2 isLoop:NO gain:0.2];
    
    if(isPoppingUp || isShowingInstruction){
        return;
    }
    
    idx--;
    if(idx < 0){
        idx = maxTotalMiniChosen - 1;
    }
    [self updateDisplay];
}

-(void) mRightCallback: (id) sender{
    [musicController playThisSound:kSound_ButtonTap isLoop:NO gain:1.0];
    [musicController playThisSound:kSound_ButtonTap2 isLoop:NO gain:0.2];
    
    if(isPoppingUp || isShowingInstruction){
        return;
    }
    
    idx++;
    if(idx >= maxTotalMiniChosen){
        idx = 0;
    }
    [self updateDisplay];
}

-(void) mInstructionCallback: (id) sender{
    [musicController playThisSound:kSound_ButtonTap isLoop:NO gain:1.0];
    [musicController playThisSound:kSound_ButtonTap2 isLoop:NO gain:0.2];
    
    if(isPoppingUp || isShowingInstruction){
        return;
    }
    
    if(idx == maxTotalMiniChosen - 1){
        return;
    }
    
    [self initInstruction];
    [self showInstruction];
    
  //  [[CCDirector sharedDirector] replaceScene: [AchivementScene scene]];
}

-(void) mBackCallback: (id) sender{
    [musicController playThisSound:kSound_ButtonTap isLoop:NO gain:1.0];
    [musicController playThisSound:kSound_ButtonTap2 isLoop:NO gain:0.2];
    
    if(isPoppingUp || isShowingInstruction){
        return;
    }
    
    [[CCDirector sharedDirector] replaceScene: [CoverScene scene]];
}


-(void) initInstruction{
    s_dot = [CCLayerColor layerWithColor:ccc4(0, 0, 0, 190)];
    [self addChild:s_dot];
    [s_dot setPosition:ccp(1000,10000)];
    
    if(idx == 0){
        s_instruction = [CCSprite spriteWithFile:@"instruction_mini01.png"];
    }
    if(idx == 1){
        s_instruction = [CCSprite spriteWithFile:@"instruction_mini02.png"];
    }
    if(idx == 2){
        s_instruction = [CCSprite spriteWithFile:@"instruction_mini03.png"];
    }
    if(idx == 3){
        s_instruction = [CCSprite spriteWithFile:@"instruction_mini04.png"];
    }
    if(idx == 4){
        s_instruction = [CCSprite spriteWithFile:@"instruction_mini05.png"];
    }
    if(idx == 5){
        s_instruction = [CCSprite spriteWithFile:@"instruction_mini06.png"];
    }
    if(idx == 6){
        s_instruction = [CCSprite spriteWithFile:@"instruction_mini07.png"];
    }
    if(idx == 7){
        s_instruction = [CCSprite spriteWithFile:@"instruction_mini08.png"];
    }
    if(idx == 8){
        s_instruction = [CCSprite spriteWithFile:@"instruction_mini09.png"];
    }
    
    [s_instruction setAnchorPoint:ccp(0.5,1.0)];
    
    [s_instruction setPosition:ccp(10000, 10000)];
    
    [self addChild:s_instruction];
}
-(void) showInstruction{
    isShowingInstruction = true;
//     [s_instruction setPosition:ccp([UIScreen mainScreen].bounds.size.height/2, 255 * 768.0/320.0)];
    
    [s_instruction setPosition:ccp(240, 255)];
    if(isIpad){
        [s_instruction setPosition:ccp(-(240 - 240) * 2 + 512, -(160 - 255) * 2 + 384)];
    }

    
    [s_dot setPosition:ccp(0, 0)];
}

-(void) removeInstruction{
    isShowingInstruction = false;
    [self removeChild:s_instruction cleanup:YES];
    [self removeChild:s_dot cleanup:YES];
}

- (void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
  //  printf("TTTDFDSSSS\n");
    
    if(isPoppingUp){
        return;
    }
    
    for( UITouch *touch in touches ) {
		CGPoint location = [touch locationInView: [touch view]];
		location = [[CCDirector sharedDirector] convertToGL: location];
        printf("TTTT:%4.8f %4.8f\n",location.x, location.y);
        
        
        if(isShowingInstruction){
            [self removeInstruction];
            
            return;
        }
        
        int fuckLeft;
        int fuckRight;
        int fuckUp;
        int fuckDown;
        
        if(isIpad){
            fuckLeft = -(240 - 107) * 2 + 512;
            fuckRight = -(240 - 391) * 2 + 512;
            fuckUp = -(160 - 259) * 2 + 384;
            fuckDown = -(160 - 99) * 2 + 384;
            
           /* fuckLeft = 107 * 1024.0/480.0;
            fuckRight = 391 * 1024.0/480.0;
            fuckUp = 259 * 768.0/320.0;
            fuckDown = 99 * 768.0/320.0;*/
        }else{
            fuckLeft = 107;
            fuckRight = 391;
            fuckUp = 259;
            fuckDown = 99;
        }
        
        if(location.x > fuckLeft && location.x < fuckRight){
            if(location.y > fuckDown && location.y < fuckUp){
                if(idx >= blockStartIdx){
                    return;
                }
                
                if(isTraitionDisappearing){
                    return;
                }
                
                if(idx == maxTotalMiniChosen - 1){
                    return;
                }
                
                transitionTimer = 0;
                isTransitioning = true;
                isTraitionDisappearing = true;
            }
        }
        
        for(int i = 0 ; i < 5 ; i++){
            if(location.x > iconPosX[i] - 30*2/textureRatioForFuckingIpad && location.x <  iconPosX[i] + 30*2/textureRatioForFuckingIpad){
                if(location.y > iconPosY - 30*2/textureRatioForFuckingIpad && location.y <  iconPosY + 30*2/textureRatioForFuckingIpad){
                    
                    if(idx < maxTotalMiniChosen){
                        generalAchviementPosIdx = i;
                        achivementSelectIdx =  achivementIdx[i];
                        [self showAchivementPopup];
                    }

                    return;
                }
            }
        }
    }
}

-(void) initTransition{
    isTransitioning = false;
    s_transition = [CCSprite spriteWithFile:@"blackDot.png"];
    [self addChild:s_transition];
    [s_transition setScaleX:300];
    [s_transition setScaleY:200];
    [s_transition setPosition:ccp(10000,100000)];
    transitionOpacity = 0;
    transitionGain = 1.0;
}

-(void) gameStep:(ccTime) dt{
    [self manageTransition];
}

-(void) manageTransition{
    if(isTransitioning){
        if(isTraitionDisappearing){
            transitionOpacity+=20;
            if(transitionOpacity >= 255){
                transitionOpacity = 255;
                isTransitioning = false;
                
                miniGameIdx = idx;
                if(idx == 8){
                    currentChosenMiniGame = 103;
                }
                printf("miniGameIdxminiGameIdxminiGameIdx:%i\n",miniGameIdx);
                
                [[CCDirector sharedDirector] replaceScene: [PlayScene scene]];
            }else{
                
                transitionGain -= 0.02;
                if(transitionGain < 0){
                    transitionGain = 0;
                }
                
                [musicController setmusicGain:transitionGain];
                
            }
            
            [s_transition setPosition:ccp([UIScreen mainScreen].bounds.size.height/2, [UIScreen mainScreen].bounds.size.width/2)];
            [s_transition setOpacity:transitionOpacity];
        }else{
            transitionOpacity-=15;
            if(transitionOpacity <= 0){
                transitionOpacity = 0;
                isTransitioning = false;
            }
            
            [s_transition setPosition:ccp(240,160)];
            [s_transition setOpacity:transitionOpacity];

        }
        
        
    }
}

- (void) dealloc
{
	printf("SelectMinigameScene22 Dealloc\n");
    // [penguinJump release];
    
	[super dealloc];
}

@end
