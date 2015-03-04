//
//  MainMissionScene.m
//  TurtlesHuh
//
//  Created by  on 2012/6/29.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "MainMissionScene.h"
#import "AppDelegate.h"
#import "Global.h"
#import "GamePlayGlobal.h"
#import "MissionGlobal.h"
#import "MainUpgradeScene.h"
#import "MainGamePlayGlobal.h"
#import "StoryScene.h"

const char *missionFirstSentenseChar = nil;
const char *missionSecondSentenseChar = nil;
const char *missionCompletedChar = nil;
const char *missionTotalChar = nil;
const char *skipPrice = nil;
const char *missionPrice = nil;
const char *totalPriceChar = nil;

@implementation MainMissionScene

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	MainMissionScene *layer = [MainMissionScene node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}


-(void) initTurtleCoinAniStruct{
    for(int j = 0 ; j < 3 ; j++){
        turtleCoinAniStruct[j] = malloc(sizeof(eTurtleCoinAniStruct3));
        turtleCoinAniStruct[j]->numElements = 10;
        turtleCoinAniStruct[j]->aniTimer = 0;
        turtleCoinAniStruct[j]->isAni = false;
        
        for(int i = 0 ; i < turtleCoinAniStruct[j]->numElements ; i++){
            turtleCoinAniStruct[j]->s_graphic[i] = [CCSprite spriteWithFile:@"ScoreShown_Badge_Shine.png"];
            turtleCoinAniStruct[j]->posX[i] = 99999;
            
            [self addChild:turtleCoinAniStruct[j]->s_graphic[i] z:kDeapth_FUCKTOP];
            [turtleCoinAniStruct[j]->s_graphic[i] setPosition:ccp(10000,10000)];
        }
    }
    
}

-(void) setTurtleCoinAni:(int)_i{
    if(turtleCoinAniStruct[_i]->isAni){
        return;
    }
    
    
    turtleCoinAniStruct[_i]->aniTimer = 0;
    turtleCoinAniStruct[_i]->isAni = true;
}


-(void) turtleCoinAniManage{
    
        
    // printf("turtleCoinAniManage:%i\n",turtleCoinAniStruct->aniTimer);
    
    for(int j = 0 ; j < 3 ; j++){
        
        static bool canContinue;
        
        canContinue = true;
        if(!turtleCoinAniStruct[j]->isAni){
           // return;
            canContinue = false;
        }

        
        if( turtleCoinAniStruct[j]->aniTimer > 26){
            turtleCoinAniStruct[j]->aniTimer++;
            if( turtleCoinAniStruct[j]->aniTimer > 26){
                turtleCoinAniStruct[j]->isAni = false;
                for(int i = 0 ; i < turtleCoinAniStruct[j]->numElements ; i++){
                    [turtleCoinAniStruct[j]->s_graphic[i] setPosition:ccp(10000,10000)];
                }
            }
            //return;
            canContinue = false;
        }
        
        static int ranNumber;
        
        if(canContinue){
            if(turtleCoinAniStruct[j]->aniTimer == 0){
                for(int i = 0 ; i <  turtleCoinAniStruct[j]->numElements ; i++){
                    ranNumber = arc4random()%100;
                    turtleCoinAniStruct[j]->vx[i] = (float)ranNumber/20.0;
                    ranNumber = arc4random()%100;
                    turtleCoinAniStruct[j]->vy[i] = (float)ranNumber/20.0;
                    ranNumber = arc4random()%100;
                    turtleCoinAniStruct[j]->rv[i] = (float)ranNumber/25.0;
                    
                    ranNumber = arc4random()%100;
                    turtleCoinAniStruct[j]->ov[i] = (float)ranNumber/10.0 + 5.0;
                    
                    if(arc4random()%2 == 0){
                        turtleCoinAniStruct[j]->rv[i] *= -1;
                        turtleCoinAniStruct[j]->vx[i] *= -1;
                    }
                    
                   // turtleCoinAniStruct[j]->posX[i] = missionStruct[j]->s_icon.position.x;
                   // turtleCoinAniStruct[j]->posY[i] = missionStruct[j]->s_icon.position.y;
                    
                    if(missionStruct[j]->mission >= 0 && missionStruct[j]->mission < 1000){
                        turtleCoinAniStruct[j]->posX[i] = missionStruct_s_icon[missionStruct[j]->mission].position.x;
                        turtleCoinAniStruct[j]->posY[i] = missionStruct_s_icon[missionStruct[j]->mission].position.y;
                    }
                    
                    
                    turtleCoinAniStruct[j]->opacity[i] = 255;
                }
            }
            
            for(int i = 0 ; i <  turtleCoinAniStruct[j]->numElements ; i++){
                [turtleCoinAniStruct[j]->s_graphic[i] setPosition:ccp(turtleCoinAniStruct[j]->posX[i], turtleCoinAniStruct[j]->posY[i])];
                [turtleCoinAniStruct[j]->s_graphic[i] setOpacity:turtleCoinAniStruct[j]->opacity[i]];
                
                turtleCoinAniStruct[j]->posX[i] += turtleCoinAniStruct[j]->vx[i];
                turtleCoinAniStruct[j]->posY[i] += turtleCoinAniStruct[j]->vy[i];
                turtleCoinAniStruct[j]->opacity[i] -= turtleCoinAniStruct[j]->ov[i];
                
                if(turtleCoinAniStruct[j]->opacity[i] < 0 ){
                    turtleCoinAniStruct[j]->opacity[i] = 0;
                }
                
                turtleCoinAniStruct[j]->vy[i] -= 0.2;
            }
            
            
            turtleCoinAniStruct[j]->aniTimer++;
        }
        
    }
    
    
}


-(void) checkIfWInMissions{
    
    for(int i = 0 ; i < maxMissionsShowForOneTime ; i++){
        isPrepareWinForThisCol[i] = false;
        
        if(currentChosenMissionWon[i]){
            printf("checkIfWInMissions:%i\n",i);
            
            static int missionChosenToCheck;
            missionChosenToCheck = currentChosenMission[i];
            
            missionStruct[i]->mission = missionChosenToCheck;
            
            isPrepareWinForThisCol[i] = true;
            isPreareWinAni = true;
            prepareWInTimer = 0;
            [self setTurtleCoinAni:i];
        }
    }
    return;
    
    
   /* for(int i = 0 ; i < maxMissionsShowForOneTime ; i++){
        static int missionChosenToCheck;
        missionChosenToCheck = currentChosenMission[i];
        
        missionStruct[i]->mission = missionChosenToCheck;
        
        if([mainMissionCheck checkThisMissionByPassingColIdx:i]){
            isPrepareWinForThisCol[i] = true;
            isPreareWinAni = true;
            prepareWInTimer = 0;
            [self setTurtleCoinAni:i];
        }
    }*/
}

-(void) winForThisColumn:(int)_column{
 
 //   isWinning[_column] = true;
    
     missionCompleted++;
    
    static int chosenSaveCol;
    if(!hasSwitchedCol[_column]){
        chosenSaveCol = _column;
    }else{
        chosenSaveCol = _column + maxMissionsShowForOneTime;
    }
    
     NSMutableString* achivementString = [NSMutableString string];
    [achivementString setString:@"mission_"];
    
    //printf("PRE winForThisColumn:%i %i %i\n",_column,chosenSaveCol, missionStruct[chosenSaveCol]->mission);
    if(missionStruct[chosenSaveCol]->mission <= 9){
        [achivementString appendString:@"0"];
    }
    
    [achivementString appendFormat:@"%i", missionStruct[chosenSaveCol]->mission];
 
    [[NSUserDefaults standardUserDefaults] setBool:true forKey:achivementString];

     printf("winForThisColumn:%i %i %i\n",_column,chosenSaveCol, missionStruct[chosenSaveCol]->mission);
    
    
    static int nextMissionIdx;
    static int biggestCurrentIdx;
    biggestCurrentIdx = 0;
    
    for(int i = 0 ; i < maxMissionsShowForOneTime ; i++){
        if(biggestCurrentIdx < currentChosenMissionIdx[i]){
            biggestCurrentIdx = currentChosenMissionIdx[i];
        }
        
        
    }
    
    for(int i = 0 ; i < maxMissionsShowForOneTime ; i++){
        if(currentChosenMissionIdx[i] < 0){
            biggestCurrentIdx = -100;
        }
    }
    
    nextMissionIdx = biggestCurrentIdx+1;
    if(nextMissionIdx >= maxMissions){
      //  nextMissionIdx = -100;
        nextMissionIdx = 9999;
        printf("nextMissionIdx >= maxMissions");
    }
    if(nextMissionIdx == maxMissions){
        isWinFinal = true;
        nextMissionIdx = 9999;
        printf("nextMissionIdx == maxMissions");
    }
    
    currentChosenMissionIdx[_column] = nextMissionIdx;
    
   
    if(_column == 0){
        [[NSUserDefaults standardUserDefaults] setInteger:nextMissionIdx forKey:@"currentMissionIdx_00"];
    }
    if(_column == 1){
        [[NSUserDefaults standardUserDefaults] setInteger:nextMissionIdx forKey:@"currentMissionIdx_01"];
    } 
    if(_column == 2){
        [[NSUserDefaults standardUserDefaults] setInteger:nextMissionIdx forKey:@"currentMissionIdx_02"];
    }   
    
    if(nextMissionIdx >= 0 && nextMissionIdx < 9999){
        nextShownMission[_column] = missionIdxMatched[nextMissionIdx];
       // isShowingNextMissionAni = true;
    }
    

    if(nextMissionIdx == 9999){
        nextShownMission[_column] = 9999;
    }
        
}

-(void) getValues{
    AppController *appDelegate =(AppController*) [[UIApplication sharedApplication] delegate];
    [appDelegate getMissionValues];
    //DELETE
   //  missionCompleted = 80;
}

-(void) initTransition{
    isTransitioning = false;
    if(!isGoingFromMainPlayScene){
        return;
    }
    
    isGoingFromMainPlayScene = false;
    isTransitioning = true;
    s_transition = [CCSprite spriteWithFile:@"blackDot.png"];
    [self addChild:s_transition z:kDeapth_Turtle_Bombing2];
    [s_transition setScaleX:300];
    [s_transition setScaleY:200];
    [s_transition setPosition:ccp([UIScreen mainScreen].bounds.size.height/2,[UIScreen mainScreen].bounds.size.width/2)];
    transitionOpacity = 255;
    transitionGain = 1.0;
    
    [self schedule:@selector(transitionStep:)];
}

-(void) transitionStep:(ccTime) dt{
    [s_transition setOpacity:transitionOpacity];
   
    transitionOpacity -= 10;
    if(transitionOpacity < 0){
        transitionOpacity = 0;
        isTransitioning = false;
        [self unschedule:@selector(transitionStep:)];
        
    }
}

- (void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    if(!isDisplayingFinal){
        return;
    }
    
    for( UITouch *touch in touches ) {
		CGPoint location = [touch locationInView: [touch view]];
		location = [[CCDirector sharedDirector] convertToGL: location];
        printf("TTTT:%4.8f %4.8f\n",location.x, location.y);
        
        if(isIpad){
            if(location.x > 818 && location.x < 949){
                if(location.y > 482 && location.y < 561){
                    [self removeFinal];
                }
            }
        }else{
            if(location.x > 392 && location.x < 466){
                if(location.y > 198 && location.y < 259){
                    [self removeFinal];
                }
            }
        }
        
    }
}

-(void) showFinal{
    isDisplayingFinal = true;
    [s_final_bg setPosition:ccp([UIScreen mainScreen].bounds.size.height/2,[UIScreen mainScreen].bounds.size.width/2)];
    [l_final_ball setPosition:ccp(s_final_bg.position.x + 4 * 2/textureRatioForFuckingIpad, s_final_bg.position.y - 7* 2/textureRatioForFuckingIpad)];
    
    printf("m_final:%4.8f %4.8f\n",m_final.position.x, m_final.position.y);
    if(canDisplayFinalBtn){
        [m_final setPosition:ccp([UIScreen mainScreen].bounds.size.height/2,[UIScreen mainScreen].bounds.size.width/2)];
    }
    
    [s_dot setPosition:ccp(0,0)];
}

-(void) removeFinal{
    isDisplayingFinal = false;
    [s_final_bg setPosition:ccp(10000,10000)];
    [l_final_ball setPosition:ccp(10000,10000)];
    [m_final setPosition:ccp(10000,10000)];
    [s_dot setPosition:ccp(1000,10000)];
}

-(void) initFinal{
    canDisplayFinalBtn = false;
    if(hasFinishedMission[87]){
        canDisplayFinalBtn = true;
    }
  
    
    
    
    s_dot = [CCLayerColor layerWithColor:ccc4(0, 0, 0, 190)];
    [self addChild:s_dot z:kDeapth_FUCKTOP];
    [s_dot setPosition:ccp(1000,10000)];
    
    s_final_bg = [CCSprite spriteWithFile:@"mainMission_Final_bg.png"];
    [s_final_bg setPosition:ccp([UIScreen mainScreen].bounds.size.height/2,[UIScreen mainScreen].bounds.size.width/2)];
    [self addChild:s_final_bg z:kDeapth_FUCKTOP];
    
    
    CCMenuItem *mComplete = [CCMenuItemImage itemWithNormalImage:@"mainMission_Final_btn_complete_off.png" selectedImage:@"mainMission_Final_btn_complete_on.png" target:self selector:@selector(mCompleteCallback:)];
    
    if(canDisplayFinalBtn){
        [mComplete setPosition:ccp(-12, -50)];
    }else{
        [mComplete setPosition:ccp(-12000, -50)];
    }
    
	m_final = [CCMenu menuWithItems:mComplete, nil];
    [self addChild:m_final z:kDeapth_FUCKTOP];
    
    
    static int howmnayBallsGot;
    howmnayBallsGot = 0;
    
    if(hasFinishedMission[14]){
        howmnayBallsGot++;
    }
    if(hasFinishedMission[28]){
        howmnayBallsGot++;
    }
    if(hasFinishedMission[43]){
        howmnayBallsGot++;
    }
    if(hasFinishedMission[53]){
        howmnayBallsGot++;
    }
    if(hasFinishedMission[64]){
        howmnayBallsGot++;
    }
    if(hasFinishedMission[78]){
        howmnayBallsGot++;
    }
    if(hasFinishedMission[87]){
        howmnayBallsGot++;
    }
    
 
    if(isIpad){
        l_final_ball = [CCLabelAtlas labelWithString:[NSString stringWithFormat:@"%i", howmnayBallsGot] charMapFile:@"fontV1.png" itemWidth:24 itemHeight:28 startCharMap:'0'];
    }else{
        l_final_ball = [CCLabelAtlas labelWithString:[NSString stringWithFormat:@"%i", howmnayBallsGot] charMapFile:@"fontV1.png" itemWidth:12 itemHeight:14 startCharMap:'0'];
    }
    
    [l_final_ball setColor:ccc3(164, 164, 164)];
    [self addChild:l_final_ball z:kDeapth_FUCKTOP];
    
    
    
    [s_final_bg setPosition:ccp(10000,10000)];
    [l_final_ball setPosition:ccp(10000,10000)];
    [m_final setPosition:ccp(10000,10000)];
 
}

-(void) mCompleteCallback: (id) sender{
    storyType = 1;
     [[CCDirector sharedDirector] replaceScene: [StoryScene scene]];
}

-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
        
        
        mainMissionCheck = [[MainMissionCheck node] retain];
        
        beginningRestingTimer = 0;
        
        isPreareWinAni = false;
        isDisplayingFinal = false;
        self.isTouchEnabled = YES;
        
        CCSprite* s_bg = [CCSprite spriteWithFile:@"mainMission_bg.png"];
        [s_bg setPosition:ccp([UIScreen mainScreen].bounds.size.height/2, [UIScreen mainScreen].bounds.size.width/2)];
        [self addChild:s_bg];
        
        
        //[musicController initForPlay];
        for(int i = 0 ; i < maxMissionsShowForOneTime ; i++){
            isFinishedThisMissionColumn[i] = false;
            nextShownMission[i] = -100;
            isWinning[i] = false;
            hasSwitchedCol[i] = false;
        }
        
        printf("Befre curent mission:%i %i %i idx:%i %i %i\n"
               ,currentChosenMission[0],currentChosenMission[1],currentChosenMission[2],
               currentChosenMissionIdx[0],currentChosenMissionIdx[1],currentChosenMissionIdx[2]);
        
        isPlayingWinMissionAni = false;
        isShowingNextMissionAni = false;
        isWinFinal = false;
        
        for(int i = 0 ; i < maxMissionsShowForOneTime * 2 ; i++){
            missionStruct[i] = malloc(sizeof(eMissionStruct));
            
            missionStruct[i]->s_col = [CCSprite spriteWithFile:@"mainMission_column.png"];
            [self addChild:missionStruct[i]->s_col];
        }
        
        [self initTurtleCoinAniStruct];
        [self getValues];
        [self initFinal];
        [self initFixColumnPos];
        
        canDisplayExtra = true;
        if(isGoingFromMainPlayScene){
            [self checkIfWInMissions];
            //isGoingFromMainPlayScene = false;
           // canDisplayExtra = false;
        }
        
        [self initMenu];
        [self initMissionStructs];
        [self initMissionBar];
        [self initTurtleCoins];
        [self initTransition];
        
        [self schedule: @selector(gameStep:)];
        
        for(int i = 0 ; i < maxMissionsShowForOneTime ; i++){
            s_prepareWin_tick[i] = [CCSprite spriteWithFile:@"mainMission_tick.png"];
            [self addChild:s_prepareWin_tick[i]];
            [s_prepareWin_tick[i] setPosition:ccp(1000,10000)];
            [s_prepareWin_tick[i] setAnchorPoint:ccp(1,1)];
            [s_prepareWin_tick[i] setRotation:200];
            prepareWin_tick_Rotation = 120;
            prepareWin_tick_Scale = 0;
        }
        
        printf("curent mission:%i %i %i idx:%i %i %i\n"
               ,currentChosenMission[0],currentChosenMission[1],currentChosenMission[2],
               currentChosenMissionIdx[0],currentChosenMissionIdx[1],currentChosenMissionIdx[2]);
        
    }
	return self;
}

-(void) initTurtleCoins{
    maxCoinWords = 10;
    totalPrice = [[NSUserDefaults standardUserDefaults] integerForKey:@"turtleCoin"];
    //DELETE
    //totalPrice = 956999;
    printf("totalPrice:%i\n",totalPrice);
    
    s_turtleCoin = [CCSprite spriteWithFile:@"mainMission_coin.png"];
    [self addChild:s_turtleCoin];
    [s_turtleCoin setPosition:ccp(896/2,566/2)];
    
    if(isIpad){
        [s_turtleCoin setPosition:ccp(930,665)];
    }
    
    ss_Font03  = [CCSpriteBatchNode batchNodeWithFile:@"fontV3.png" capacity:1];
    [self addChild:ss_Font03 z:kDeapth_Turtle_Bombing2];
    
    for(int i = 0 ; i < maxCoinWords ; i++){
        l_coin[i] = [CCSprite spriteWithTexture:ss_Font03.texture rect:CGRectMake(0, 0, 0, 0)];
        
        [l_coin[i] setPosition:ccp(10000,100000)];
        [l_coin[i] setAnchorPoint:ccp(0,0)];
        [ss_Font03 addChild: l_coin[i]];
    }
    
    turtleCoinString = [[NSMutableString string] retain];
    
    [self updateTurtleCoinsDisplay];
}

-(void) updateTurtleCoinsDisplay{
    for(int i = 0 ; i < maxCoinWords ; i++){
        [l_coin[i] setPosition:ccp(10000,100000)];
    }
    
    [turtleCoinString setString:@""];
    [turtleCoinString appendFormat:@"%i", totalPrice];
    
    totalPriceChar = [turtleCoinString UTF8String];
    
    fontTexture_numInRow = 10;
    fontTexture_offsetX = 17;
    fontTexture_offsetY = 21;
    fontTexture_startX = 0;
    fontTexture_howmanyCol = 4;
    
    if(isIpad){
        fontTexture_offsetX *= 2;
        fontTexture_offsetY *= 2;
    }
    
    sentense01_AccumOffset = 0;
    setense01_offsetX = 10;
    
    static int setense01StartDisplayX;
    static int setense01StartDisplayY;
    
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
        setense01StartDisplayX *=  1024.0/480.0;
        setense01StartDisplayY *=  768.0/320.0;
        
        setense01StartDisplayX -= 23;
        setense01StartDisplayY -= 5;
    }
        
    
    for (int i=0; totalPriceChar[i]; i++){
        
        startToFuckIdx = totalPriceChar[i] - 48;
        
        if(startToFuckIdx < 0){
            startToFuckIdx = 64 - 48;
            sentense01_AccumOffset -= 4 *2/textureRatioForFuckingIpad;
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
        sentense01_AccumOffset += setense01_offsetX * 2/textureRatioForFuckingIpad;
        
    }
}

-(void) initMissionBar{
   barX = 296/2;
    barY = 562/2;
    
    if(isIpad){
        barX = 290;
        barY = 700;
    }
    
    s_bar_bottom = [CCSprite spriteWithFile:@"mainMission_barBottom.png"];
    s_bar_top_left = [CCSprite spriteWithFile:@"mainMission_barTopLeft.png"];
    s_bar_top_right = [CCSprite spriteWithFile:@"mainMission_barTopRight.png"];
    s_bar_top_center = [CCSprite spriteWithFile:@"mainMission_barTopCenter.png"];
    s_bar_missionCompleted = [CCSprite spriteWithFile:@"mainMission_missionCompleted.png"];
    
    [s_bar_bottom setPosition:ccp(barX,barY)];
    [s_bar_top_left setPosition:ccp(barX,barY)];
    [s_bar_top_right setPosition:ccp(barX + 241,barY)];
    [s_bar_top_center setPosition:ccp(barX + 16 *2/textureRatioForFuckingIpad, barY)];
    [s_bar_missionCompleted setPosition:ccp(barX,barY)];
    
    [self addChild:s_bar_bottom];
    [self addChild:s_bar_top_left];
    [self addChild:s_bar_top_right];
    [self addChild:s_bar_top_center];
    [self addChild:s_bar_missionCompleted];
    
    [s_bar_bottom setAnchorPoint:ccp(0,0.5)];
    [s_bar_top_left setAnchorPoint:ccp(0,0.5)];
    [s_bar_top_right setAnchorPoint:ccp(0,0.5)];
    [s_bar_top_center setAnchorPoint:ccp(0,0.5)];
    [s_bar_missionCompleted setAnchorPoint:ccp(0,0.5)];
    
    static float missionCompletedRatio;
    missionCompletedRatio = (float)missionCompleted/(float)maxMissions;
    if(missionCompletedRatio <= 0.02){
        [s_bar_top_left setScaleX:0];
        [s_bar_top_center setScaleX:0];
        [s_bar_top_right setScaleX:0];
    }else if(missionCompletedRatio < 1.0){
        [s_bar_top_left setScaleX:1.0];
        [s_bar_top_center setScaleX:missionCompletedRatio];
        [s_bar_top_right setScaleX:0];
    }else{
        [s_bar_top_left setScaleX:1.0];
        [s_bar_top_center setScaleX:1.0];
        [s_bar_top_right setScaleX:1.0];
    }
    
    
    
    for(int i = 0 ; i < 2 ; i++){
        l_missionCompleted[i] = [CCSprite spriteWithTexture:ss_Font01.texture rect:CGRectMake(0, 0, 0, 0)];
        [l_missionCompleted[i] setPosition:ccp(10000,100000)];
        [l_missionCompleted[i] setAnchorPoint:ccp(0,0)];
        [ss_Font01 addChild:l_missionCompleted[i]];
        
        l_totalMission[i] = [CCSprite spriteWithTexture:ss_Font01.texture rect:CGRectMake(0, 0, 0, 0)];
        [l_totalMission[i] setPosition:ccp(10000,100000)];
        [l_totalMission[i] setAnchorPoint:ccp(0,0)];
        [ss_Font01 addChild:l_totalMission[i]];
    }
    
    
    
    fuckString = [[NSMutableString string] retain];
    [self updateMissionBar];
    
   

}

-(void) updateMissionBar{
    static float missionCompletedRatio;
    missionCompletedRatio = (float)missionCompleted/(float)maxMissions;
    if(missionCompletedRatio <= 0.02){
        [s_bar_top_left setScaleX:0];
        [s_bar_top_center setScaleX:0];
        [s_bar_top_right setScaleX:0];
    }else if(missionCompletedRatio < 1.0){
        [s_bar_top_left setScaleX:1.0];
        [s_bar_top_center setScaleX:missionCompletedRatio];
        [s_bar_top_right setScaleX:0];
    }else{
        [s_bar_top_left setScaleX:1.0];
        [s_bar_top_center setScaleX:1.0];
        [s_bar_top_right setScaleX:1.0];
    }
    
    [fuckString setString:@""];
    [fuckString appendFormat:@"%i", missionCompleted];
    
    missionCompletedChar = [fuckString UTF8String];
    
    [fuckString setString:@""];
    [fuckString appendFormat:@"%i", maxMissions];
    missionTotalChar = [fuckString UTF8String];
    
    
    fontTexture_numInRow = 10;
    fontTexture_offsetX = 12;
    fontTexture_offsetY = 14;
    fontTexture_startX = 0;
    fontTexture_howmanyCol = 4;
    
    if(isIpad){
        fontTexture_offsetX *= 2;
        fontTexture_offsetY *= 2;
    }
    
    sentense01_AccumOffset = 0;
    setense01_offsetX = 10 * 2/textureRatioForFuckingIpad;
    for (int i=0; missionCompletedChar[i]; i++){
        startToFuckIdx = missionCompletedChar[i] - 48;
        
        if(startToFuckIdx < 0){
            startToFuckIdx = 64 - 48;
            sentense01_AccumOffset -= 4;
        }
        
        // fontTexture_chosenCol = fontTexture_howmanyCol + 1;
        fontTexture_chosenCol = -1;
        do{
            
            fontTexture_chosenRow = startToFuckIdx;
            fontTexture_chosenCol++;
            
            startToFuckIdx -= fontTexture_numInRow;
        }while(startToFuckIdx >= 0);
        
        // printf("iii:%i\n",i);
        
        [l_missionCompleted[i] setTextureRect:CGRectMake(fontTexture_chosenRow * fontTexture_offsetX, fontTexture_chosenCol * fontTexture_offsetY, fontTexture_offsetX, fontTexture_offsetY)];
        
        if(missionCompleted <= 9){
            [l_missionCompleted[i] setPosition:ccp(sentense01_AccumOffset + barX + 192 * 2/textureRatioForFuckingIpad, barY - 7 * 2/textureRatioForFuckingIpad)];
        }else{
            [l_missionCompleted[i] setPosition:ccp(sentense01_AccumOffset + barX + 185 * 2/textureRatioForFuckingIpad, barY - 7 * 2/textureRatioForFuckingIpad)];
        }
        
        
        sentense01_AccumOffset += setense01_offsetX;
        
    }
    
    sentense01_AccumOffset = 0;
    for (int i=0; missionTotalChar[i]; i++){
        startToFuckIdx = missionTotalChar[i] - 48;
        
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
        
        [l_totalMission[i] setTextureRect:CGRectMake(fontTexture_chosenRow * fontTexture_offsetX, fontTexture_chosenCol * fontTexture_offsetY, fontTexture_offsetX, fontTexture_offsetY)];
        
        [l_totalMission[i] setPosition:ccp(sentense01_AccumOffset + barX + 222 * 2/textureRatioForFuckingIpad, barY - 7 * 2/textureRatioForFuckingIpad)];
        sentense01_AccumOffset += setense01_offsetX;
        
    }
}

-(void) initFixColumnPos{
    fixColumnX[0] = [UIScreen mainScreen].bounds.size.height/2;
    fixColumnX[1] = [UIScreen mainScreen].bounds.size.height/2;
    fixColumnX[2] = [UIScreen mainScreen].bounds.size.height/2;
    
    fixColumnY[0] = 210;
    fixColumnY[1] = 130;
    fixColumnY[2] = 50;
    
    if(isIpad){
        fixColumnY[0] = 500;
        fixColumnY[1] = 340;
        fixColumnY[2] = 180;
    }
}

-(void) mCol00Callback: (id) sender{
    if(isDisplayingFinal){
        return;
    }
    
    if(!hasSwitchedCol[0]){
        if(totalPrice >= missionStruct[0]->pirce){
            isCheckCol[0] = true;
            totalPrice -= missionStruct[0]->pirce;
            [[NSUserDefaults standardUserDefaults] setInteger:totalPrice forKey:@"turtleCoin"];
            [self winForThisColumn:0];
            [self updateAll];
           
        }
    }
    
}
-(void) mCol01Callback: (id) sender{
    if(isDisplayingFinal){
        return;
    }
    
    if(!hasSwitchedCol[1]){
        if(totalPrice >= missionStruct[1]->pirce){
            isCheckCol[1] = true;
            totalPrice -= missionStruct[1]->pirce;
            [[NSUserDefaults standardUserDefaults] setInteger:totalPrice forKey:@"turtleCoin"];
            [self winForThisColumn:1];
            [self updateAll];
        }
    }
}
-(void) mCol02Callback: (id) sender{
    if(isDisplayingFinal){
        return;
    }
    
    if(!hasSwitchedCol[2]){
        if(totalPrice >= missionStruct[2]->pirce){
            isCheckCol[2] = true;
            totalPrice -= missionStruct[2]->pirce;
            [[NSUserDefaults standardUserDefaults] setInteger:totalPrice forKey:@"turtleCoin"];
            [self winForThisColumn:2];
            [self updateAll];
        }
    }
}
-(void) mCol03Callback: (id) sender{
    if(isDisplayingFinal){
        return;
    }
    
    if(hasSwitchedCol[0]){
        if(totalPrice >= missionStruct[3]->pirce){
            isCheckCol[0] = true;
            totalPrice -= missionStruct[3]->pirce;
            [[NSUserDefaults standardUserDefaults] setInteger:totalPrice forKey:@"turtleCoin"];
            [self winForThisColumn:0];
            [self updateAll];
        }
    }
}
-(void) mCol04Callback: (id) sender{
    if(isDisplayingFinal){
        return;
    }
    
    if(hasSwitchedCol[1]){
        if(totalPrice >= missionStruct[4]->pirce){
            isCheckCol[1] = true;
            totalPrice -= missionStruct[4]->pirce;
            [[NSUserDefaults standardUserDefaults] setInteger:totalPrice forKey:@"turtleCoin"];
            [self winForThisColumn:1];
            [self updateAll];
        }
    }
}
-(void) mCol05Callback: (id) sender{
    if(isDisplayingFinal){
        return;
    }
    
    if(hasSwitchedCol[2]){
        if(totalPrice >= missionStruct[5]->pirce){
            isCheckCol[2] = true;
            totalPrice -= missionStruct[5]->pirce;
            [[NSUserDefaults standardUserDefaults] setInteger:totalPrice forKey:@"turtleCoin"];
            [self winForThisColumn:2];
            [self updateAll];
        }
    }
}

-(void) updateAll{
    [self updateTurtleCoinsDisplay];
    
    [self checkToShowNextMissions];
    [self initMissionSentense];
    [self updateCols];
    [self updateMissionBar];
}

-(int) getSkipPrice:(int)_missionIdx{
    static int returnSkipPrice;
    returnSkipPrice = [mainMissionCheck thisMissionPrice:_missionIdx] * 10;
    if(returnSkipPrice >= 40000){
        returnSkipPrice = 40000;
    }
    return returnSkipPrice;
}

-(int) getMissionPrice:(int)_missionIdx{
    return [mainMissionCheck thisMissionPrice:_missionIdx];
}

-(void) initMissionStructs{
    fuckfuckString = [[NSMutableString string] retain];
    
    
    skipBtn[0] = [CCMenuItemImage itemWithNormalImage:@"mainMission_btn_skip_off.png" selectedImage:@"mainMission_btn_skip_on.png" target:self selector:@selector(mCol00Callback:)];
    skipBtn[1] = [CCMenuItemImage itemWithNormalImage:@"mainMission_btn_skip_off.png" selectedImage:@"mainMission_btn_skip_on.png" target:self selector:@selector(mCol01Callback:)];
    skipBtn[2] = [CCMenuItemImage itemWithNormalImage:@"mainMission_btn_skip_off.png" selectedImage:@"mainMission_btn_skip_on.png" target:self selector:@selector(mCol02Callback:)];
    skipBtn[3] = [CCMenuItemImage itemWithNormalImage:@"mainMission_btn_skip_off.png" selectedImage:@"mainMission_btn_skip_on.png" target:self selector:@selector(mCol03Callback:)];
    skipBtn[4] = [CCMenuItemImage itemWithNormalImage:@"mainMission_btn_skip_off.png" selectedImage:@"mainMission_btn_skip_on.png" target:self selector:@selector(mCol04Callback:)];
    skipBtn[5] = [CCMenuItemImage itemWithNormalImage:@"mainMission_btn_skip_off.png" selectedImage:@"mainMission_btn_skip_on.png" target:self selector:@selector(mCol05Callback:)];
    skipMenu = [CCMenu menuWithItems:skipBtn[0],skipBtn[1],skipBtn[2],skipBtn[3],skipBtn[4],skipBtn[5], nil];
    [self addChild:skipMenu];
    
    ss_Font01  = [CCSpriteBatchNode batchNodeWithFile:@"fontV1.png" capacity:1];
    [self addChild:ss_Font01 z:kDeapth_Turtle_Bombing2];
    
    
    maxWordsInSkip = 7;
    maxWordsInSentense = 60;
    
    //hit 0
    missionStruct_s_icon[0] = [CCSprite spriteWithFile:@"icon_Mission_01.png"];
    missionStruct_s_icon[1] = [CCSprite spriteWithFile:@"icon_Mission_04.png"];
    missionStruct_s_icon[2] = [CCSprite spriteWithFile:@"icon_Mission_02.png"];
    missionStruct_s_icon[3] = [CCSprite spriteWithFile:@"icon_Mission_03.png"];
    missionStruct_s_icon[4] = [CCSprite spriteWithFile:@"icon_Mission_05.png"];
    missionStruct_s_icon[5] = [CCSprite spriteWithFile:@"icon_Mission_06.png"];
    missionStruct_s_icon[6] = [CCSprite spriteWithFile:@"icon_Weapon_03.png"];
    missionStruct_s_icon[7] = [CCSprite spriteWithFile:@"icon_Mission_05.png"];
    missionStruct_s_icon[8] = [CCSprite spriteWithFile:@"icon_Mission_07.png"];
    missionStruct_s_icon[9] = [CCSprite spriteWithFile:@"icon_Mission_08.png"];
    missionStruct_s_icon[10] = [CCSprite spriteWithFile:@"icon_Mission_01.png"];
    missionStruct_s_icon[11] = [CCSprite spriteWithFile:@"icon_Mission_02.png"];
    missionStruct_s_icon[12] = [CCSprite spriteWithFile:@"icon_Weapon_02.png"];
    missionStruct_s_icon[13] = [CCSprite spriteWithFile:@"icon_Mission_09.png"];
    missionStruct_s_icon[14] = [CCSprite spriteWithFile:@"icon_Mission_10.png"];
    
    // hit 1
    missionStruct_s_icon[15] = [CCSprite spriteWithFile:@"icon_Mission_05.png"];
    missionStruct_s_icon[16] = [CCSprite spriteWithFile:@"icon_Mission_08.png"];
    missionStruct_s_icon[17] = [CCSprite spriteWithFile:@"icon_Mission_13.png"];
    missionStruct_s_icon[18] = [CCSprite spriteWithFile:@"icon_Mission_06.png"];
    missionStruct_s_icon[19] = [CCSprite spriteWithFile:@"icon_Mission_03.png"];
    missionStruct_s_icon[20] = [CCSprite spriteWithFile:@"icon_Mission_02.png"];
    missionStruct_s_icon[21] = [CCSprite spriteWithFile:@"icon_Mission_11.png"];
    missionStruct_s_icon[22] = [CCSprite spriteWithFile:@"icon_Mission_09.png"];
    missionStruct_s_icon[23] = [CCSprite spriteWithFile:@"icon_Mission_12.png"];
    missionStruct_s_icon[24] = [CCSprite spriteWithFile:@"icon_Mission_12.png"];
    missionStruct_s_icon[25] = [CCSprite spriteWithFile:@"icon_Mission_01.png"];
    missionStruct_s_icon[26] = [CCSprite spriteWithFile:@"icon_Mission_05.png"];
    missionStruct_s_icon[27] = [CCSprite spriteWithFile:@"icon_Mission_02.png"];
    missionStruct_s_icon[28] = [CCSprite spriteWithFile:@"icon_Mission_10.png"];
    
    
    //hit 2
    missionStruct_s_icon[29] = [CCSprite spriteWithFile:@"icon_Mission_09.png"];
    missionStruct_s_icon[30] = [CCSprite spriteWithFile:@"icon_Mission_05.png"];
    missionStruct_s_icon[31] = [CCSprite spriteWithFile:@"icon_Mission_12.png"];
    missionStruct_s_icon[32] = [CCSprite spriteWithFile:@"icon_Mission_01.png"];
    missionStruct_s_icon[33] = [CCSprite spriteWithFile:@"icon_Mission_06.png"];
    missionStruct_s_icon[34] = [CCSprite spriteWithFile:@"icon_Mission_08.png"];
    missionStruct_s_icon[35] = [CCSprite spriteWithFile:@"icon_Mission_12.png"];
    missionStruct_s_icon[36] = [CCSprite spriteWithFile:@"icon_Mission_12.png"];
    missionStruct_s_icon[37] = [CCSprite spriteWithFile:@"icon_Mission_05.png"];
    missionStruct_s_icon[38] = [CCSprite spriteWithFile:@"icon_Mission_10.png"];
    missionStruct_s_icon[39] = [CCSprite spriteWithFile:@"icon_Mission_14.png"];
    missionStruct_s_icon[40] = [CCSprite spriteWithFile:@"icon_Mission_09.png"];
    missionStruct_s_icon[41] = [CCSprite spriteWithFile:@"icon_Mission_02.png"];
    missionStruct_s_icon[42] = [CCSprite spriteWithFile:@"icon_Mission_12.png"];
    missionStruct_s_icon[43] = [CCSprite spriteWithFile:@"icon_Mission_10.png"];
    
    
    //hit 3
    missionStruct_s_icon[44] = [CCSprite spriteWithFile:@"icon_Mission_05.png"];
    missionStruct_s_icon[45] = [CCSprite spriteWithFile:@"icon_Mission_11.png"];
    missionStruct_s_icon[46] = [CCSprite spriteWithFile:@"icon_Mission_01.png"];
    missionStruct_s_icon[47] = [CCSprite spriteWithFile:@"icon_Mission_08.png"];
    missionStruct_s_icon[48] = [CCSprite spriteWithFile:@"icon_Mission_03.png"];
    missionStruct_s_icon[49] = [CCSprite spriteWithFile:@"icon_Mission_12.png"];
    missionStruct_s_icon[50] = [CCSprite spriteWithFile:@"icon_Mission_05.png"];
    missionStruct_s_icon[51] = [CCSprite spriteWithFile:@"icon_Mission_06.png"];
    missionStruct_s_icon[52] = [CCSprite spriteWithFile:@"icon_Mission_05.png"];
    missionStruct_s_icon[53] = [CCSprite spriteWithFile:@"icon_Mission_10.png"];
    
    //hit 4
    missionStruct_s_icon[54] = [CCSprite spriteWithFile:@"icon_Mission_15.png"];
    missionStruct_s_icon[55] = [CCSprite spriteWithFile:@"icon_Mission_12.png"];
    missionStruct_s_icon[56] = [CCSprite spriteWithFile:@"icon_Mission_03.png"];
    missionStruct_s_icon[57] = [CCSprite spriteWithFile:@"icon_Mission_11.png"];
    missionStruct_s_icon[58] = [CCSprite spriteWithFile:@"icon_Mission_05.png"];
    missionStruct_s_icon[59] = [CCSprite spriteWithFile:@"icon_Mission_15.png"];
    missionStruct_s_icon[60] = [CCSprite spriteWithFile:@"icon_Mission_12.png"];
    missionStruct_s_icon[61] = [CCSprite spriteWithFile:@"icon_Mission_13.png"];
    missionStruct_s_icon[62] = [CCSprite spriteWithFile:@"icon_Mission_09.png"];
    missionStruct_s_icon[63] = [CCSprite spriteWithFile:@"icon_Mission_11.png"];
    missionStruct_s_icon[64] = [CCSprite spriteWithFile:@"icon_Mission_10.png"];
    
    //hit 5
    missionStruct_s_icon[65] = [CCSprite spriteWithFile:@"icon_Mission_05.png"];
    missionStruct_s_icon[66] = [CCSprite spriteWithFile:@"icon_Mission_11.png"];
    missionStruct_s_icon[67] = [CCSprite spriteWithFile:@"icon_Mission_02.png"];
    missionStruct_s_icon[68] = [CCSprite spriteWithFile:@"icon_Mission_11.png"];
    missionStruct_s_icon[69] = [CCSprite spriteWithFile:@"icon_Mission_05.png"];
    missionStruct_s_icon[70] = [CCSprite spriteWithFile:@"icon_Mission_06.png"];
    missionStruct_s_icon[71] = [CCSprite spriteWithFile:@"icon_Mission_12.png"];
    missionStruct_s_icon[72] = [CCSprite spriteWithFile:@"icon_Mission_15.png"];
    missionStruct_s_icon[73] = [CCSprite spriteWithFile:@"icon_Mission_11.png"];
    missionStruct_s_icon[74] = [CCSprite spriteWithFile:@"icon_Mission_09.png"];
    missionStruct_s_icon[75] = [CCSprite spriteWithFile:@"icon_Mission_08.png"];
    missionStruct_s_icon[76] = [CCSprite spriteWithFile:@"icon_Mission_13.png"];
    missionStruct_s_icon[77] = [CCSprite spriteWithFile:@"icon_Mission_05.png"];
    missionStruct_s_icon[78] = [CCSprite spriteWithFile:@"icon_Mission_10.png"];
    
    //hit 6
    missionStruct_s_icon[79] = [CCSprite spriteWithFile:@"icon_Mission_03.png"];
    missionStruct_s_icon[80] = [CCSprite spriteWithFile:@"icon_Mission_15.png"];
    missionStruct_s_icon[81] = [CCSprite spriteWithFile:@"icon_Mission_12.png"];
    missionStruct_s_icon[82] = [CCSprite spriteWithFile:@"icon_Mission_05.png"];
    missionStruct_s_icon[83] = [CCSprite spriteWithFile:@"icon_Mission_11.png"];
    missionStruct_s_icon[84] = [CCSprite spriteWithFile:@"icon_Mission_02.png"];
    missionStruct_s_icon[85] = [CCSprite spriteWithFile:@"icon_Mission_09.png"];
    missionStruct_s_icon[86] = [CCSprite spriteWithFile:@"icon_Mission_11.png"];
    missionStruct_s_icon[87] = [CCSprite spriteWithFile:@"icon_Mission_10.png"];
    
    for(int i = 0 ; i < maxMissions ; i++){
         [self addChild:missionStruct_s_icon[i]];
        [missionStruct_s_icon[i] setPosition:ccp(10000,10000)];
    }

    
    for(int i = 0 ; i < maxMissionsShowForOneTime * 2 ; i++){
        
        missionStruct[i]->mission = -987;
        missionStruct[i]->isWinning = false;
        missionStruct[i]->isNexting = false;
        missionStruct[i]->isAniTimer = 0;
        
       // missionStruct[i]->s_icon = [CCSprite spriteWithFile:@"AchievementIcon_unblockedBg.png"];
       
       
        
        for(int j = 0 ; j < maxWordsInSentense ; j++){
            missionStruct[i]->l_firstSentence[j] = [CCSprite spriteWithTexture:ss_Font01.texture rect:CGRectMake(0, 0, 0, 0)];
            missionStruct[i]->l_secondSentense[j] = [CCSprite spriteWithTexture:ss_Font01.texture rect:CGRectMake(0, 0, 0, 0)];
            
            [missionStruct[i]->l_firstSentence[j] setPosition:ccp(10000,100000)];
            [missionStruct[i]->l_firstSentence[j] setAnchorPoint:ccp(0,0)];
            [ss_Font01 addChild:missionStruct[i]->l_firstSentence[j]];
            [missionStruct[i]->l_firstSentence[j] setColor:ccc3(140,59,19)];
            
            [missionStruct[i]->l_secondSentense[j] setPosition:ccp(10000,100000)];
            [missionStruct[i]->l_secondSentense[j] setAnchorPoint:ccp(0,0)];
            [ss_Font01 addChild:missionStruct[i]->l_secondSentense[j]];
            [missionStruct[i]->l_secondSentense[j] setColor:ccc3(140,59,19)];
        }
        
        for(int j = 0 ; j < maxWordsInSkip ; j++){
            missionStruct[i]->l_skipPrice[j] = [CCSprite spriteWithTexture:ss_Font01.texture rect:CGRectMake(0, 0, 0, 0)];
            missionStruct[i]->l_missionPrice[j] = [CCSprite spriteWithTexture:ss_Font01.texture rect:CGRectMake(0, 0, 0, 0)];
            
            [missionStruct[i]->l_skipPrice[j] setPosition:ccp(10000,100000)];
            [missionStruct[i]->l_skipPrice[j] setAnchorPoint:ccp(0,0)];
            [ss_Font01 addChild:missionStruct[i]->l_skipPrice[j]];
            
            [missionStruct[i]->l_missionPrice[j] setPosition:ccp(10000,100000)];
            [missionStruct[i]->l_missionPrice[j] setAnchorPoint:ccp(0,0)];
            [ss_Font01 addChild:missionStruct[i]->l_missionPrice[j]];
            [missionStruct[i]->l_missionPrice[j] setColor:ccc3(153, 0, 0)];
        }
        

    }
    
    static int isInesetedTime;
    isInesetedTime = 0;
    
    
    
    for(int i = 0 ; i < maxMissionsShowForOneTime  ; i++){
        missionStruct[i]->mission = currentChosenMission[i];
        printf("mission:%i %i\n",i,  missionStruct[i]->mission);
        
        if( missionStruct[i]->mission >= 0){
            missionStruct[i]->x = fixColumnX[isInesetedTime];
            missionStruct[i]->y = fixColumnY[isInesetedTime];
            
            
           /* if(isWinning[i]){
                printf("isWINING\n");
                missionStruct[i]->isWinning = true;
                 missionStruct[i]->ax = 0.7;
                 missionStruct[i]->vx = -5;
            }else{
                printf("NOT isWINING\n");
            }*/
            
            isInesetedTime++;
            
        }else{
            missionStruct[i]->x = 10000;
            missionStruct[i]->y = 10000;
        }
        
    }
    
    
    
    for(int i = 0 ; i < maxMissionsShowForOneTime  ; i++){
        isCheckCol[i] = true;
    }
    [self checkToShowNextMissions];
    
    [self initMissionSentense];
    
    [self updateCols];
    
    canDisplayExtra = false;
    
}

-(void) updateCols{
    [fuckfuckString setString:@""];
    
    for(int i = 0 ; i < maxMissionsShowForOneTime*2  ; i++){
        if( missionStruct[i]->mission >= 0){
            
            missionStruct[i]->pirce = [self getSkipPrice:missionStruct[i]->mission];
           // missionStruct[i]->pirce = 1;
            
            [fuckfuckString setString:@";"];
            [fuckfuckString appendFormat:@"%i", missionStruct[i]->pirce];
            skipPrice = [fuckfuckString UTF8String];
            
            
            missionStruct[i]->missionPrice = [self getMissionPrice:missionStruct[i]->mission];
            
            [fuckfuckString setString:@";"];
            [fuckfuckString appendFormat:@"%i", missionStruct[i]->missionPrice];
             missionPrice = [fuckfuckString UTF8String];
            
        }else{
            [fuckfuckString setString:@";"];
            [fuckfuckString appendFormat:@"%i", 777];
            missionStruct[i]->pirce = 777;
            skipPrice = [fuckfuckString UTF8String];
            
            missionStruct[i]->missionPrice = 777;
            missionPrice = [fuckfuckString UTF8String];
        }
        
        fontTexture_numInRow = 10;
        fontTexture_offsetX = 12;
        fontTexture_offsetY = 14;
        fontTexture_startX = 0;
        fontTexture_howmanyCol = 4;
        
        if(isIpad){
            fontTexture_offsetX *= 2;
            fontTexture_offsetY *= 2;
        }
        
        sentense01_AccumOffset = 0;
        setense01_offsetX = 10 * 2/textureRatioForFuckingIpad;
        missionStruct[i]->priceSetenseLength = 0;
        for (int j=0; skipPrice[j]; j++){
            startToFuckIdx = skipPrice[j] - 48;
            
            if(startToFuckIdx < 0){
                startToFuckIdx = 64 - 48;
                sentense01_AccumOffset -= 4 * 2/textureRatioForFuckingIpad;
            }
            
            fontTexture_chosenCol = -1;
            do{
                fontTexture_chosenRow = startToFuckIdx;
                fontTexture_chosenCol++;
                
                startToFuckIdx -= fontTexture_numInRow;
            }while(startToFuckIdx >= 0);
            
            [missionStruct[i]->l_skipPrice[j] setTextureRect:CGRectMake(fontTexture_chosenRow * fontTexture_offsetX, fontTexture_chosenCol * fontTexture_offsetY, fontTexture_offsetX, fontTexture_offsetY)];
            
            [missionStruct[i]->l_skipPrice[j] setPosition:ccp(sentense01_AccumOffset + missionStruct[i]->x + 150000, missionStruct[i]->y + 10)];
            sentense01_AccumOffset += setense01_offsetX;
            
            missionStruct[i]->priceSetenseLength++;
        }
        
        
        
        sentense01_AccumOffset = 0;
        setense01_offsetX = 10 * 2/textureRatioForFuckingIpad;
        missionStruct[i]->missionPriceSetenseLength = 0;
        for (int j=0; missionPrice[j]; j++){
            startToFuckIdx = missionPrice[j] - 48;
            
            if(startToFuckIdx < 0){
                startToFuckIdx = 64 - 48;
                sentense01_AccumOffset -= 4 * 2/textureRatioForFuckingIpad;
            }
            
            fontTexture_chosenCol = -1;
            do{
                fontTexture_chosenRow = startToFuckIdx;
                fontTexture_chosenCol++;
                
                startToFuckIdx -= fontTexture_numInRow;
            }while(startToFuckIdx >= 0);
            
            [missionStruct[i]->l_missionPrice[j] setTextureRect:CGRectMake(fontTexture_chosenRow * fontTexture_offsetX, fontTexture_chosenCol * fontTexture_offsetY, fontTexture_offsetX, fontTexture_offsetY)];
            
            [missionStruct[i]->l_missionPrice[j] setPosition:ccp(sentense01_AccumOffset + missionStruct[i]->x + 150000, missionStruct[i]->y + 10)];
            sentense01_AccumOffset += setense01_offsetX;
            
            missionStruct[i]->missionPriceSetenseLength++;
        }
        
        
    }
}
    
    

-(void) checkToShowNextMissions{
    for(int i = 0 ; i < maxMissionsShowForOneTime  ; i++){
        
        if(isCheckCol[i]){
            if(!hasSwitchedCol[i]){
                missionStruct[i+maxMissionsShowForOneTime]->mission = nextShownMission[i];
                nextShownMission[i] = -100;
                
                if(missionStruct[i+maxMissionsShowForOneTime]->mission >= 0){
                    missionStruct[i+maxMissionsShowForOneTime]->x = fixColumnX[i] - [UIScreen mainScreen].bounds.size.height;
                    missionStruct[i+maxMissionsShowForOneTime]->y = fixColumnY[i];
                    
                    missionStruct[i+maxMissionsShowForOneTime]->isWinning = false;
                    missionStruct[i]->isNexting = false;
                    
                    if(missionStruct[i+maxMissionsShowForOneTime]->mission == 9999){
                        printf("FUCK 9999\n");
                        missionStruct[i+maxMissionsShowForOneTime]->isNexting = false;
                    }else{
                        missionStruct[i+maxMissionsShowForOneTime]->isNexting = true;
                    }
                    
                    missionStruct[i]->isWinning = true;
                    missionStruct[i]->ax = 0.7;
                    missionStruct[i]->vx = -5;
                    missionStruct[i]->isAniTimer = 60;
                    missionStruct[i+maxMissionsShowForOneTime]->isAniTimer = 60;
                    
                    missionStruct[i+maxMissionsShowForOneTime]->vx = 0;
                    // missionStruct[i]->vx = 0;
                    
                    printf("checkToShowNextMissions:%i %i\n",i, i+maxMissionsShowForOneTime);
                    hasSwitchedCol[i] = !hasSwitchedCol[i];
                }else{
                    missionStruct[i+maxMissionsShowForOneTime]->x = 10000;
                    missionStruct[i+maxMissionsShowForOneTime]->y = 10000;
                }
            }else{
                missionStruct[i]->mission = nextShownMission[i];
                nextShownMission[i] = -100;
                
                if(missionStruct[i]->mission >= 0){
                    missionStruct[i]->x = fixColumnX[i] - [UIScreen mainScreen].bounds.size.height;
                    missionStruct[i]->y = fixColumnY[i];
                    
                    missionStruct[i]->isWinning = false;
                    missionStruct[i+maxMissionsShowForOneTime]->isNexting = false;
                    
                    if(missionStruct[i]->mission == 9999){
                        printf("FUCK2 9999\n");
                        missionStruct[i]->isNexting = false;
                    }else{
                        missionStruct[i]->isNexting = true;
                    }
                    
                    missionStruct[i+maxMissionsShowForOneTime]->isWinning = true;
                    missionStruct[i+maxMissionsShowForOneTime]->ax = 0.7;
                    missionStruct[i+maxMissionsShowForOneTime]->vx = -5;
                    missionStruct[i]->isAniTimer = 60;
                    missionStruct[i+maxMissionsShowForOneTime]->isAniTimer = 60;
                    
                    //missionStruct[i+maxMissionsShowForOneTime]->vx = 0;
                    missionStruct[i]->vx = 0;
                    
                    hasSwitchedCol[i] = !hasSwitchedCol[i];
                }else{
                    missionStruct[i]->x = 10000;
                    missionStruct[i]->y = 10000;
                }
            }
            
            isCheckCol[i] = false;
        }
        
    }
}

-(void) getMissionSentense:(int)_missionIdx{
    //[mainMissionCheck getMissionSentense:_missionIdx];
    
    recordUse_diamondGotTotal = [[NSUserDefaults standardUserDefaults] integerForKey:@"main_diamondGot"];
    printf("in mission scene:recordUse_diamondGotTotal:%i\n",recordUse_diamondGotTotal);
    recordUse_penguinHitTotal = [[NSUserDefaults standardUserDefaults] integerForKey:@"main_penguinHit"];
    recordUse_continuePerfectLaunchTIme = [[NSUserDefaults standardUserDefaults] integerForKey:@"main_continuePerfectLaunch"];
    recordUse_moneyGainedTotal = [[NSUserDefaults standardUserDefaults] integerForKey:@"main_moneyGained"];
    
    if(!hasPlayedThisMissionBefore[_missionIdx]){
        canDisplayExtra = false;
    }else{
        canDisplayExtra = true;
    }
    
    
    NSMutableString* fuck2String;
    fuck2String = [NSMutableString string];

        if(_missionIdx == 0){
            missionFirstSentenseChar = "FLY FOR A DURATION OF";
            missionSecondSentenseChar = "12 SECONDS";
        }
        if(_missionIdx == 1){
            missionFirstSentenseChar = "FLY STRAIGHT FOR 6 SECONDS";
            missionSecondSentenseChar = "";
        }
        if(_missionIdx == 2){
            missionFirstSentenseChar = "REACH A SPEED OF 22MPH";
            missionSecondSentenseChar = "";
        }
        if(_missionIdx == 3){
            missionFirstSentenseChar = "PERFORM 1 PERFECT LAUNCH";
            missionSecondSentenseChar = "";
        }
        if(_missionIdx == 4){
            missionFirstSentenseChar = "GET A DIAMOND";
            missionSecondSentenseChar = "IN A SINGLE RUN";
        }
        if(_missionIdx == 5){
            missionFirstSentenseChar = "FLY FOR A DISTANCE OF 350M";
            missionSecondSentenseChar = "";
        }
    
    if(_missionIdx == 6){
        missionFirstSentenseChar = "UPGRADE CANNON TO LEVEL 1";
        missionSecondSentenseChar = "OR ABOVE";
    }
    
        if(_missionIdx == 7){
            missionFirstSentenseChar = "GET A TOTAL OF 5 DIAMONDS";
            
            if(canDisplayExtra){
                [fuck2String setString:@"<"];
                [fuck2String appendFormat:@"%i", 5-recordUse_diamondGotTotal];
                [fuck2String appendString:@" LEFT>"];
            }else{
                [fuck2String setString:@""];
            }
            
            
            missionSecondSentenseChar = [fuck2String UTF8String];
        }
        if(_missionIdx == 8){
            missionFirstSentenseChar = "FLY FOR A DISTANCE OF 400M";
            missionSecondSentenseChar = "WITHOUT PERFECT LAUNCH";
        }
        if(_missionIdx == 9){
            missionFirstSentenseChar = "FLY NEAR THE FLOOR";
            missionSecondSentenseChar = "FOR 5 SECONS";
        }
        if(_missionIdx == 10){
            missionFirstSentenseChar = "FLY FOR A DURATION OF";
            missionSecondSentenseChar = "25 SECONDS";
        }
        if(_missionIdx == 11){
            missionFirstSentenseChar = "FLY STRAIGHT AND";
            missionSecondSentenseChar = "REACH A SPEED OF 30MPH";
        }
        if(_missionIdx == 12){
            missionFirstSentenseChar = "UPGRADE ROCKET TO LEVEL 2";
            missionSecondSentenseChar = " OR ABOVE";
        }
        if(_missionIdx == 13){
            missionFirstSentenseChar = "REACH AN ALTITUDE OF 150M";
            missionSecondSentenseChar = "";
        }
        if(_missionIdx == 14){
            missionFirstSentenseChar = "DESTROY THE FIRST OBSTACLE";
            missionSecondSentenseChar = "HINTS<UPGRADE HELMET>";
        }
        if(_missionIdx == 15){
            missionFirstSentenseChar = "GET TWO DIAMONDS";
            missionSecondSentenseChar = "IN A SINGLE RUN";
        }
        if(_missionIdx == 16){
            missionFirstSentenseChar = "FLY NEAR THE FLOOR";
            missionSecondSentenseChar = "FOR 7 SECONS";
        }
        if(_missionIdx == 17){
            missionFirstSentenseChar = "FLY FOR A DISTANCE OF 350M";
            missionSecondSentenseChar = "WITHOUT APPLYING FUEL";
        } 
        if(_missionIdx == 18){
            missionFirstSentenseChar = "FLY FOR A DISTANCE OF 1000M";
            missionSecondSentenseChar = "";
        }
        if(_missionIdx == 19){
            missionFirstSentenseChar = "PERFORM 2 PERFECT LAUNCH";
            
            if(canDisplayExtra){
                [fuck2String setString:@"IN A ROW <"];
                [fuck2String appendFormat:@"%i", 2-recordUse_continuePerfectLaunchTIme];
                [fuck2String appendString:@" LEFT>"];
            }else{
                [fuck2String setString:@"IN A ROW"];
            }
            
            
            missionSecondSentenseChar = [fuck2String UTF8String];
        } 
        if(_missionIdx == 20){
            missionFirstSentenseChar = "FLY STRAIGHT OVER 23MPH";
            missionSecondSentenseChar = "FOR 15 SECONDS";
        }
        if(_missionIdx == 21){
            missionFirstSentenseChar = "DESTROY THE FIRST OBSTACLE";
            missionSecondSentenseChar = "IN LESS THAN 12 SECONDS";
        }
        if(_missionIdx == 22){
            missionFirstSentenseChar = "REACH AN ALTITUDE OF 200M";
            missionSecondSentenseChar = "";
        }
        if(_missionIdx == 23){
            missionFirstSentenseChar = "HIT ONE PENGUIN";
            missionSecondSentenseChar = "<PENGUINS APPEAR OVER 150M>";
        }
        if(_missionIdx == 24){
            missionFirstSentenseChar = "HIT A TOTAL OF 5 PENGUINS";
            
            if(canDisplayExtra){
                [fuck2String setString:@"<"];
                [fuck2String appendFormat:@"%i", 5-recordUse_penguinHitTotal];
                [fuck2String appendString:@" LEFT>"];
            }else{
                [fuck2String setString:@""];
            }
            
            
            missionSecondSentenseChar = [fuck2String UTF8String];
        }
        if(_missionIdx == 25){
            missionFirstSentenseChar = "FLY FOR A DURATION OF";
            missionSecondSentenseChar = "45 SECONDS";
        }
        if(_missionIdx == 26){
            missionFirstSentenseChar = "GET 3 DIAMONDS";
            missionSecondSentenseChar = "IN A SINGLE RUN";
        }
        if(_missionIdx == 27){
            missionFirstSentenseChar = "FLY STRAIGHT AND";
            missionSecondSentenseChar = "REACH A SPEED OF 40MPH";
        }
        if(_missionIdx == 28){
            missionFirstSentenseChar = "DESTROY THE SECOND OBSTACLE";
            missionSecondSentenseChar = "GET THE SECOND TURTLE BALL";
        }
        if(_missionIdx == 29){
            missionFirstSentenseChar = "REACH AN ALTITUDE OF 350M";
            missionSecondSentenseChar = "";
        }
        if(_missionIdx == 30){
            missionFirstSentenseChar = "GET A TOTAL OF 20 DIAMONDS";
            
            if(canDisplayExtra){
                [fuck2String setString:@"<"];
                [fuck2String appendFormat:@"%i", 20-recordUse_diamondGotTotal];
                [fuck2String appendString:@" LEFT>"];
            }else{
                [fuck2String setString:@""];
            }
            
            
            missionSecondSentenseChar = [fuck2String UTF8String];
        }
        if(_missionIdx == 31){
            missionFirstSentenseChar = "HIT 2 PENGUINS";
            missionSecondSentenseChar = "IN A SINGLE RUN";
        }
        if(_missionIdx == 32){
            missionFirstSentenseChar = "FLY FOR A DURATION OF";
            missionSecondSentenseChar = "65 SECONDS";
        }
        if(_missionIdx == 33){
            missionFirstSentenseChar = "FLY FOR A DISTANCE OF 2500M";
            missionSecondSentenseChar = "";
        }
        if(_missionIdx == 34){
            missionFirstSentenseChar = "FLY NEAR THE FLOOR FOR 5S";
            missionSecondSentenseChar = "KEEPING THE SPEED OVER 30MPH";
        }
        if(_missionIdx == 35){
            missionFirstSentenseChar = "HIT A TOTAL OF 20 PENGUINS";
            
            if(canDisplayExtra){
                [fuck2String setString:@"<"];
                [fuck2String appendFormat:@"%i", 20-recordUse_penguinHitTotal];
                [fuck2String appendString:@" LEFT>"];
            }else{
                [fuck2String setString:@""];
            }
            
            
            missionSecondSentenseChar = [fuck2String UTF8String];
        }
        if(_missionIdx == 36){
            missionFirstSentenseChar = "HIT 4 PENGUINS";
            missionSecondSentenseChar = "IN A SINGLE RUN";
        }
        if(_missionIdx == 37){
            missionFirstSentenseChar = "GET A GREEN DIAMOND";
            missionSecondSentenseChar = "";
        }
        if(_missionIdx == 38){
            missionFirstSentenseChar = "DESTROY 2 OBSTACLES";
            missionSecondSentenseChar = "IN A SINGLE RUN";
        }
        if(_missionIdx == 39){
            missionFirstSentenseChar = "DESTROY THE FIRST OBSTACLE";
            missionSecondSentenseChar = "WITHOUT APPLYING FUEL";
        }
        if(_missionIdx == 40){
            missionFirstSentenseChar = "REACH AN ALTITUDE OF 460M";
            missionSecondSentenseChar = "";
        }
        if(_missionIdx == 41){
            missionFirstSentenseChar = "FLY STRAIGHT AND";
            missionSecondSentenseChar = "REACH A SPEED OF 52MPH";
        }
        if(_missionIdx == 42){
            missionFirstSentenseChar = "HIT 6 PENGUINS";
            missionSecondSentenseChar = "IN A SINGLE RUN";
        }
        if(_missionIdx == 43){
            missionFirstSentenseChar = "DESTROY THE THIRD OBSTACLE";
            missionSecondSentenseChar = "GET THE THIRD TURTLE BALL";
        }
        if(_missionIdx == 44){
            missionFirstSentenseChar = "EARN ;20 FROM DIAMONDS COLLECTED";
            missionSecondSentenseChar = "IN A SINGLE RUN";
        }
        if(_missionIdx == 45){
            missionFirstSentenseChar = "DESTROY THE SECOND OBSTACLE";
            missionSecondSentenseChar = "IN LESS THAN 28 SECONDS";
        }
        if(_missionIdx == 46){
            missionFirstSentenseChar = "FLY FOR A DURATION OF";
            missionSecondSentenseChar = "90 SECONDS";
        }
        if(_missionIdx == 47){
            missionFirstSentenseChar = "FLY NEAR THE FLOOR FOR 3S";
            missionSecondSentenseChar = "KEEPING THE SPEED OVER 45MPH";
        }
        if(_missionIdx == 48){
            missionFirstSentenseChar = "PERFORM 3 PERFECT LAUNCH";
            
            if(canDisplayExtra){
                [fuck2String setString:@"IN A ROW <"];
                [fuck2String appendFormat:@"%i", 3-recordUse_continuePerfectLaunchTIme];
                [fuck2String appendString:@" LEFT>"];
            }else{
                [fuck2String setString:@"IN A ROW"];
            }
            
            
            missionSecondSentenseChar = [fuck2String UTF8String];
        }
        if(_missionIdx == 49){
            missionFirstSentenseChar = "HIT A TOTAL OF 50 PENGUINS";
            
            if(canDisplayExtra){
                [fuck2String setString:@"<"];
                [fuck2String appendFormat:@"%i", 50-recordUse_penguinHitTotal];
                [fuck2String appendString:@" LEFT>"];
            }else{
                [fuck2String setString:@""];
            }
            
            missionSecondSentenseChar = [fuck2String UTF8String];
            
        }
        if(_missionIdx == 50){
            missionFirstSentenseChar = "GAIN A TOTAL OF ;100";
            
            if(canDisplayExtra){
                [fuck2String setString:@"FROM DIAMONDS <"];
                [fuck2String appendFormat:@"%i", 100-recordUse_moneyGainedTotal];
                [fuck2String appendString:@" LEFT>"];
            }else{
                [fuck2String setString:@"FROM DIAMONDS"];
            }
            
            
            missionSecondSentenseChar = [fuck2String UTF8String];

        }
        if(_missionIdx == 51){
            missionFirstSentenseChar = "FLY FOR A DISTANCE OF 4500M";
            missionSecondSentenseChar = "";
        }
        if(_missionIdx == 52){
            missionFirstSentenseChar = "GET 3 GREEN DIAMONDS";
            missionSecondSentenseChar = "IN A SINGLE RUN";
        }
        if(_missionIdx == 53){
            missionFirstSentenseChar = "DESTROY THE FORTH OBSTACLE";
            missionSecondSentenseChar = "IT IS AT ALTITUDE 100M";
        }
        if(_missionIdx == 54){
            missionFirstSentenseChar = "PERFORM ONE PANTS ON FIRE";
            missionSecondSentenseChar = "HINTS<UPGRADE POF>";
        }
        if(_missionIdx == 55){
            missionFirstSentenseChar = "HIT 8 PENGUINS";
            missionSecondSentenseChar = "IN A SINGLE RUN";
        }
        if(_missionIdx == 56){
            missionFirstSentenseChar = "PERFORM A PERFECT LAUNCH";
            missionSecondSentenseChar = "FROM CANNON AT LEVEL 4 OR ABOVE";
        }
        if(_missionIdx == 57){
            missionFirstSentenseChar = "HIT THE FIRST OBSTACLE";
            missionSecondSentenseChar = "IN LESS THAN 10 SECONDS";
        }
        if(_missionIdx == 58){
            missionFirstSentenseChar = "EARN ;40 FROM DIAMONDS COLLECTED";
            missionSecondSentenseChar = "IN A SINGLE RUN";
        }
        if(_missionIdx == 59){
            missionFirstSentenseChar = "PERFORM ONE PANTS ON FIRE";
            missionSecondSentenseChar = "WITHOUT HITTING ANY PENGUIN";
        }
        if(_missionIdx == 60){
            missionFirstSentenseChar = "HIT A TOTAL OF 100 PENGUINS";
            
            if(canDisplayExtra){
                [fuck2String setString:@"<"];
                [fuck2String appendFormat:@"%i", 100-recordUse_penguinHitTotal];
                [fuck2String appendString:@" LEFT>"];
            }else{
                [fuck2String setString:@""];
            }
            
            
            missionSecondSentenseChar = [fuck2String UTF8String];
        }
        if(_missionIdx == 61){
            missionFirstSentenseChar = "FLY FOR A DISTANCE OF 900M";
            missionSecondSentenseChar = "WITHOUT APPLYING FUEL";
        }
        if(_missionIdx == 62){
            missionFirstSentenseChar = "REACH AN ALTITUDE OF 800M";
            missionSecondSentenseChar = "";
        }
        if(_missionIdx == 63){
            missionFirstSentenseChar = "DESTROY 3 OBSTACLES";
            missionSecondSentenseChar = "IN LESS THAN 50 SECONDS";
        }
        if(_missionIdx == 64){
            missionFirstSentenseChar = "DESTROY THE FIFTH OBSTACLES";
            missionSecondSentenseChar = "IT IS AT ALTITUDE 200M";
        }
        if(_missionIdx == 65){
            missionFirstSentenseChar = "EARN ;140 FROM DIAMONDS COLLECTED";
            missionSecondSentenseChar = "IN A SINGLE RUN";
        }
        if(_missionIdx == 66){
            missionFirstSentenseChar = "DESTROY ANY OBSTACLE";
            missionSecondSentenseChar = "WHILE PANTS ON FIRE";
        }
        if(_missionIdx == 67){
            missionFirstSentenseChar = "REACH A SPEED OF 75MPH";
            missionSecondSentenseChar = "WITHOUT PANTS OF FIRE";
        }
        if(_missionIdx == 68){
            missionFirstSentenseChar = "DESTROY THE FORTH OBSTACLE";
            missionSecondSentenseChar = "IN LESS THAN 56 SECONDS";
        }
        if(_missionIdx == 69){
            missionFirstSentenseChar = "COLLECT A TOTAL OF 250 DIAMONDS";
            if(canDisplayExtra){
                [fuck2String setString:@"<"];
                [fuck2String appendFormat:@"%i", 250-recordUse_diamondGotTotal];
                [fuck2String appendString:@" LEFT>"];
            }else{
                [fuck2String setString:@""];
            }
            
            
            missionSecondSentenseChar = [fuck2String UTF8String];
        }
        if(_missionIdx == 70){
            missionFirstSentenseChar = "FLY FOR A DISTANCE OF 6200M";
            missionSecondSentenseChar = "";
        }
        if(_missionIdx == 71){
            missionFirstSentenseChar = "HIT A TOTAL OF 15 PENGUINS";
            missionSecondSentenseChar = "IN A SINGLE RUN";
        }
        if(_missionIdx == 72){
            missionFirstSentenseChar = "PERFORM 2 PANTS ON FIRE";
            missionSecondSentenseChar = "IN A SINGLE RUN";
        }
        if(_missionIdx == 73){
            missionFirstSentenseChar = "DESTROY 5 OBSTACLES";
            missionSecondSentenseChar = "IN A SINGLE RUN";
        }
        if(_missionIdx == 74){
            missionFirstSentenseChar = "REACH AN ALTITUDE OF 1400M";
            missionSecondSentenseChar = "";
        }
        if(_missionIdx == 75){
            missionFirstSentenseChar = "FLY NEAR THE FLOOR FOR 6S";
            missionSecondSentenseChar = "KEEPING THE SPEED OVER 45MPH";
        }
        if(_missionIdx == 76){
            missionFirstSentenseChar = "FLY FOR A DISTANCE OF 1100M";
            missionSecondSentenseChar = "WITHOUT APPLYING FUEL";
        }
        if(_missionIdx == 77){
            missionFirstSentenseChar = "COLLECT 6 PURPLE DIAMONDS";
            missionSecondSentenseChar = "IN A SINGLE RUN";
        }
        if(_missionIdx == 78){
            missionFirstSentenseChar = "DESTROY THE SIXTH OBSTACLE";
            missionSecondSentenseChar = "IT IS AT ALTITUDE 400M";
        }
        if(_missionIdx == 79){
            missionFirstSentenseChar = "PERFORM 4 PERFECT LAUNCH";
            
            if(canDisplayExtra){
                [fuck2String setString:@"IN A ROW <"];
                [fuck2String appendFormat:@"%i", 4-recordUse_continuePerfectLaunchTIme];
                [fuck2String appendString:@" LEFT>"];
            }else{
                [fuck2String setString:@"IN A ROW"];
            }
            
            
            missionSecondSentenseChar = [fuck2String UTF8String];

        }
        if(_missionIdx == 80){
            missionFirstSentenseChar = "PERFORM 5 PANTS ON FIRE";
            missionSecondSentenseChar = "IN A SINGLE RUN";
        }
    
    if(_missionIdx == 81){
        missionFirstSentenseChar = "HIT 7 PENGUINS IN";
        missionSecondSentenseChar = "ONE YELLOW BLAZE TIME";
    }
    
    if(_missionIdx == 82){
        missionFirstSentenseChar = "EARN ;500 FROM DIAMONDS COLLECTED";
        missionSecondSentenseChar = "IN A SINGLE RUN";
    }
    
    if(_missionIdx == 83){
        missionFirstSentenseChar = "DESTROY ANY 4 OBSTACLES";
        missionSecondSentenseChar = "IN LESS THAN 42 SECONDS";
    }
    
    if(_missionIdx == 84){
        missionFirstSentenseChar = "FLY STRAIGHT AND";
        missionSecondSentenseChar = "REACH A SPEED OF 90MPH";
    }
    
    if(_missionIdx == 85){
        missionFirstSentenseChar = "REACH AN ALTITUDE OF 1700M";
        missionSecondSentenseChar = "";
    }
       
    if(_missionIdx == 86){
        missionFirstSentenseChar = "DESTROY THE FIFTH OBSTACLE";
        missionSecondSentenseChar = "IN LESS THAN 58 SECONDS";
    }
    
    if(_missionIdx == 87){
        missionFirstSentenseChar = "DESTROY THE FINAL OBSTACLE";
        missionSecondSentenseChar = "IT IS AT ALTITUDE 800M";
    }
}

-(void) initMissionSentense{
     fontTexture_numInRow = 10;
    fontTexture_offsetX = 12;
    fontTexture_offsetY = 14;
    fontTexture_startX = 0;
    fontTexture_howmanyCol = 4;
    
    if(isIpad){
        fontTexture_offsetX *= 2;
        fontTexture_offsetY *= 2;
    }

    for(int j = 0 ; j < maxMissionsShowForOneTime * 2 ; j++){
       // missionFirstSentenseChar = "";
       // missionSecondSentenseChar = "";
        printf("missionStruct[j]->mission:%i\n",missionStruct[j]->mission);
        if(missionStruct[j]->mission >= maxMissions || missionStruct[j]->mission < 0){
            missionFirstSentenseChar = "";
            missionSecondSentenseChar = "";
        }else{
            [self getMissionSentense:missionStruct[j]->mission];
        }
                
        missionStruct[j]->firstSentenseLength = 0;
        missionStruct[j]->sencondSentenseLength = 0;
        
        sentense01_AccumOffset = 0;
        setense01_offsetX = 10 * 2/textureRatioForFuckingIpad;
        for (int i=0; missionFirstSentenseChar[i]; i++){
            startToFuckIdx = missionFirstSentenseChar[i] - 48;
            
            if(startToFuckIdx < 0){
                startToFuckIdx = 58 - 48;
                sentense01_AccumOffset -= 3 * 2/textureRatioForFuckingIpad;
            }
            
            if(startToFuckIdx == 73-48){
                sentense01_AccumOffset -= 2 * 2/textureRatioForFuckingIpad;
            }

            
            // fontTexture_chosenCol = fontTexture_howmanyCol + 1;
            fontTexture_chosenCol = -1;
            do{
                
                fontTexture_chosenRow = startToFuckIdx;
                fontTexture_chosenCol++;
                
                startToFuckIdx -= fontTexture_numInRow;
            }while(startToFuckIdx >= 0);
            
            // printf("iii:%i\n",i);
            
            [missionStruct[j]->l_firstSentence[i] setTextureRect:CGRectMake(fontTexture_chosenRow * fontTexture_offsetX, fontTexture_chosenCol * fontTexture_offsetY, fontTexture_offsetX, fontTexture_offsetY)];
            
            [missionStruct[j]->l_firstSentence[i] setPosition:ccp(sentense01_AccumOffset + (missionStruct[j]->x - 153 * 2/textureRatioForFuckingIpad), missionStruct[j]->y - 5 * 2/textureRatioForFuckingIpad)];
            missionStruct[j]->firstSetencePosX[i] = sentense01_AccumOffset;
            sentense01_AccumOffset += setense01_offsetX;
            
            
            
            missionStruct[j]->firstSentenseLength++;
        }
        
        
        sentense01_AccumOffset = 0;
        for (int i=0; missionSecondSentenseChar[i]; i++){
            startToFuckIdx = missionSecondSentenseChar[i] - 48;
            
            if(startToFuckIdx < 0){
                startToFuckIdx = 58 - 48;
                sentense01_AccumOffset -= 3 * 2/textureRatioForFuckingIpad;
            }
            
            if(startToFuckIdx == 73-48){
                sentense01_AccumOffset -= 2 * 2/textureRatioForFuckingIpad;
            }
            
            // fontTexture_chosenCol = fontTexture_howmanyCol + 1;
            fontTexture_chosenCol = -1;
            do{
                
                fontTexture_chosenRow = startToFuckIdx;
                fontTexture_chosenCol++;
                
                startToFuckIdx -= fontTexture_numInRow;
            }while(startToFuckIdx >= 0);
            
            // printf("iii:%i\n",i);
            
            [missionStruct[j]->l_secondSentense[i] setTextureRect:CGRectMake(fontTexture_chosenRow * fontTexture_offsetX, fontTexture_chosenCol * fontTexture_offsetY, fontTexture_offsetX, fontTexture_offsetY)];
            
            [missionStruct[j]->l_secondSentense[i] setPosition:ccp(sentense01_AccumOffset + (missionStruct[j]->x - 153 * 2/textureRatioForFuckingIpad), missionStruct[j]->y - 20 * 2/textureRatioForFuckingIpad)];
            missionStruct[j]->secondSetencePosX[i] = sentense01_AccumOffset;
            sentense01_AccumOffset += setense01_offsetX;
            
            
            
            missionStruct[j]->sencondSentenseLength++;
        }
        
    }
    
    

    
}

-(void) gameStep:(ccTime) dt{
    
    if(isTransitioning){
        [self manageAni];
        return;
    }

    if(isPreareWinAni){
        beginningRestingTimer++;
        if(beginningRestingTimer > 15){
            [self managePrepareWinAni];
             [self turtleCoinAniManage];
        }
    }
    
    [self manageAni];
   
}

-(void) managePrepareWinAni{
    prepareWin_tick_Rotation += (0 - prepareWin_tick_Rotation)/2.5;
    prepareWin_tick_Scale += (1.0 - prepareWin_tick_Scale)/2.5;
    
    for(int i = 0 ; i < maxMissionsShowForOneTime ; i++){
        if(isPrepareWinForThisCol[i]){
            //printf("managePrepareWinAni:%i %4.8f %4.8f %4.8f\n",i,prepareWin_tick_Scale,missionStruct[i]->s_icon.position.x+25,missionStruct[i]->s_icon.position.y+15);
            [s_prepareWin_tick[i] setRotation:prepareWin_tick_Rotation];
            [s_prepareWin_tick[i] setScale:prepareWin_tick_Scale];
            //[s_prepareWin_tick[i] setPosition:ccp(missionStruct[i]->s_icon.position.x+25, missionStruct[i]->s_icon.position.y+15)];
            
            if(missionStruct[i]->mission >= 0 && missionStruct[i]->mission < 1000){
                [s_prepareWin_tick[i] setPosition:ccp(missionStruct_s_icon[missionStruct[i]->mission].position.x+25,  missionStruct_s_icon[missionStruct[i]->mission].position.y+15)];
            }
            
        }
    }
    
    if(prepareWInTimer == 0){
        [musicController playThisSound:kSound_ComboTime isLoop:NO gain:1.0];
    }
    
    prepareWInTimer++;
    if(prepareWInTimer == 60){
        isPreareWinAni = false;
        for(int i = 0 ; i < maxMissionsShowForOneTime ; i++){
            if(isPrepareWinForThisCol[i]){
                [self winForThisColumn:i];
                isCheckCol[i] = true;
            }
        }
        [self updateAll];
    }
}

-(void) manageAni{
    //printf("manageAni  x:%4.8f vx:%4.8f\n", missionStruct[0]->x, missionStruct[0]->vx);
    if(!isTransitioning){
        for(int i = 0 ; i < maxMissionsShowForOneTime ; i++){
            [s_prepareWin_tick[i] setPosition:ccp(s_prepareWin_tick[i].position.x + missionStruct[i]->vx, s_prepareWin_tick[i].position.y)];
        }
    } 
   
    
    for(int i = 0 ; i < maxMissionsShowForOneTime*2 ; i++){
        if(missionStruct[i]->isWinning){
            if(missionStruct[i]->isAniTimer > 60){
                missionStruct[i]->x += missionStruct[i]->vx; 
                missionStruct[i]->vx += missionStruct[i]->ax;
            }
            
            /*if(missionStruct[i]->isAniTimer > 120){
                missionStruct[i]->isWinning = false;
            }*/
          //  printf("win:%i  x:%4.8f vx:%4.8f\n",i , missionStruct[i]->x, missionStruct[i]->vx);
        }
        
        if(missionStruct[i]->isNexting){
            if(missionStruct[i]->isAniTimer > 90){
                
                static float dx;
                if( i < maxMissionsShowForOneTime){
                    dx = fixColumnX[i] - missionStruct[i]->x;
                }else{
                    dx = fixColumnX[i-maxMissionsShowForOneTime] - missionStruct[i]->x;
                }
                
                missionStruct[i]->ax = dx * 0.05;
                missionStruct[i]->x += missionStruct[i]->vx; 
                missionStruct[i]->vx += missionStruct[i]->ax;
                missionStruct[i]->vx *= 0.8;
            }
            
           /* if(missionStruct[i]->isAniTimer > 200){
                missionStruct[i]->isNexting = false;
            }*/
            // printf("isNexting:%i  x:%4.8f vx:%4.8f\n",i , missionStruct[i]->x, missionStruct[i]->vx);
        }
        
        missionStruct[i]->isAniTimer++;
    }
    
    for(int j = 0 ; j < maxMissionsShowForOneTime*2 ; j++){
        sentense01_AccumOffset = 0;
        setense01_offsetX = 10 * 2/textureRatioForFuckingIpad;
        for (int i=0; i < missionStruct[j]->firstSentenseLength ; i++){
           // [missionStruct[j]->l_firstSentence[i] setPosition:ccp(sentense01_AccumOffset + (missionStruct[j]->x - 153), missionStruct[j]->y - 5)];
           // sentense01_AccumOffset += setense01_offsetX;
            [missionStruct[j]->l_firstSentence[i] setPosition:ccp(missionStruct[j]->firstSetencePosX[i] + (missionStruct[j]->x - 153 * 2/textureRatioForFuckingIpad), missionStruct[j]->y - 5 * 2/textureRatioForFuckingIpad)];
        }
        
        sentense01_AccumOffset = 0;
        for (int i=0; i < missionStruct[j]->sencondSentenseLength ; i++){
           // [missionStruct[j]->l_secondSentense[i] setPosition:ccp(sentense01_AccumOffset + (missionStruct[j]->x - 153), missionStruct[j]->y - 20)];
           // sentense01_AccumOffset += setense01_offsetX;
            [missionStruct[j]->l_secondSentense[i] setPosition:ccp( missionStruct[j]->secondSetencePosX[i] + (missionStruct[j]->x - 153 * 2/textureRatioForFuckingIpad), missionStruct[j]->y - 20 * 2/textureRatioForFuckingIpad)];
        }
        
         sentense01_AccumOffset = 0;
        //printf("manageANi:%i %i %i\n",j, missionStruct[j]->pirce, missionStruct[j]->priceSetenseLength);
        
        static int skipPriceOffsetToMissionStruct;
        for (int i=0; i < missionStruct[j]->priceSetenseLength ; i++){
            
            if(missionStruct[j]->pirce <= 9){
                skipPriceOffsetToMissionStruct = 154;
            }else if(missionStruct[j]->pirce <= 99){
                skipPriceOffsetToMissionStruct = 154;
            }else if(missionStruct[j]->pirce <= 999){
                skipPriceOffsetToMissionStruct = 150;
            }else if(missionStruct[j]->pirce <= 9999){
                skipPriceOffsetToMissionStruct = 145;
            }else if(missionStruct[j]->pirce <= 99999){
                skipPriceOffsetToMissionStruct = 139;
            }
            
            if(isIpad){
                skipPriceOffsetToMissionStruct *= 2;
            }
            
            if(missionStruct[j]->mission >= (maxMissions - maxMissionsShowForOneTime)){
                [missionStruct[j]->l_skipPrice[i] setPosition:ccp(10000, 20000)];
            }else{
                 [missionStruct[j]->l_skipPrice[i] setPosition:ccp(sentense01_AccumOffset + (missionStruct[j]->x + skipPriceOffsetToMissionStruct), missionStruct[j]->y - 15 * 2/textureRatioForFuckingIpad)];
            }
           
            sentense01_AccumOffset += setense01_offsetX;
        }
        
        sentense01_AccumOffset = 0;
        for (int i=0; i < missionStruct[j]->missionPriceSetenseLength ; i++){
            
            if(missionStruct[j]->missionPrice <= 9){
                skipPriceOffsetToMissionStruct = 154;
            }else if(missionStruct[j]->missionPrice <= 99){
                skipPriceOffsetToMissionStruct = 154;
            }else if(missionStruct[j]->missionPrice <= 999){
                skipPriceOffsetToMissionStruct = 150;
            }else if(missionStruct[j]->missionPrice <= 9999){
                skipPriceOffsetToMissionStruct = 145;
            }else if(missionStruct[j]->missionPrice <= 99999){
                skipPriceOffsetToMissionStruct = 139;
            }
            
            if(isIpad){
                skipPriceOffsetToMissionStruct *= 2;
            }
            
            if(isIpad){
                [missionStruct[j]->l_missionPrice[i] setPosition:ccp(sentense01_AccumOffset + (missionStruct[j]->x + skipPriceOffsetToMissionStruct) - 615 , missionStruct[j]->y + 16)];
            }else{
                [missionStruct[j]->l_missionPrice[i] setPosition:ccp(sentense01_AccumOffset + (missionStruct[j]->x + skipPriceOffsetToMissionStruct) - 328 + 23 , missionStruct[j]->y + 12)];
            }
            
            
            sentense01_AccumOffset += setense01_offsetX;
        }

        
        [missionStruct[j]->s_col setPosition:ccp(missionStruct[j]->x, missionStruct[j]->y)];
        //[missionStruct[j]->s_icon setPosition:ccp(missionStruct[j]->x - 187, missionStruct[j]->y)];
        //printf("missionStruct[j]->mission:%i\n",missionStruct[j]->mission);
        if(missionStruct[j]->mission >= 0 && missionStruct[j]->mission < 1000){
            [missionStruct_s_icon[missionStruct[j]->mission] setPosition:ccp(missionStruct[j]->x - 187, missionStruct[j]->y)];
            
            if(isIpad){
                [missionStruct_s_icon[missionStruct[j]->mission] setPosition:ccp(missionStruct[j]->x - 187 * 1024.0/480.0 + 10, missionStruct[j]->y)];
            }
        }
        
        
        if(missionStruct[j]->mission >= (maxMissions - maxMissionsShowForOneTime)){
            [skipBtn[j] setPosition:ccp(70000, missionStruct[j]->y-160)];
        }else{
            
            if(isIphone5){
                [skipBtn[j] setPosition:ccp(missionStruct[j]->x - 70 - 44, missionStruct[j]->y-160)];
            }else if(isIpad){
                [skipBtn[j] setPosition:ccp(missionStruct[j]->x - 70 * 1024.0/480.0 - 10, missionStruct[j]->y - 160 * 768.0/320.0)];
            }else{
                [skipBtn[j] setPosition:ccp(missionStruct[j]->x - 70, missionStruct[j]->y-160)];
            }
            
        }
        
    }
    
    for(int j = 0 ; j < maxMissionsShowForOneTime*2 ; j++){
        if(missionStruct[j]->mission == 9999){
             //[missionStruct[j]->s_icon setPosition:ccp(99999, 99999)];
            
            if(missionStruct[j]->mission >= 0 && missionStruct[j]->mission < 1000){
                [missionStruct_s_icon[missionStruct[j]->mission] setPosition:ccp(10000,10000)];
            }
            
             [missionStruct[j]->s_col setPosition:ccp(99999, 99999)];
        }
        
        
        if(isDisplayingFinal){
            [skipBtn[j] setPosition:ccp(100000 - 70, 100000)];
            for (int i=0; i < missionStruct[j]->priceSetenseLength ; i++){
                 [missionStruct[j]->l_skipPrice[i] setPosition:ccp(10000, 20000)];
            }
        }
    }
    
   
}

-(void) initMenu{

    CCMenuItem *mBack = [CCMenuItemImage itemWithNormalImage:@"mainMission_btn_store_off.png" selectedImage:@"mainMission_btn_store_on.png" target:self selector:@selector(mBackCallback:)];
     CCMenuItem *mFinalMission = [CCMenuItemImage itemWithNormalImage:@"mainMission_btn_finalMission_off.png" selectedImage:@"mainMission_btn_finalMission_on.png" target:self selector:@selector(mFinalMissionCallback:)];
    
    [mBack setScale:0.8];
    [mFinalMission setScale:0.8];
    
    [mBack setPosition:ccp(-408/2, 246/2)];
    [mFinalMission setPosition:ccp(-286/2, 246/2)];
    
    if(isIphone5){
        [mBack setPosition:ccp(-408/2 - 44, 246/2)];
        [mFinalMission setPosition:ccp(-286/2 - 44, 246/2)];
    }
    
    if(isIpad){
        [mBack setPosition:ccp(-440, 310)];
        [mFinalMission setPosition:ccp(-300, 310)];
    }
    
	CCMenu* menu = [CCMenu menuWithItems:mBack,mFinalMission, nil];
	[self addChild:menu];
    
}

-(void) mBackCallback: (id) sender{
    [musicController playThisSound:kSound_ButtonTap isLoop:NO gain:1.0];
    [musicController playThisSound:kSound_ButtonTap2 isLoop:NO gain:0.2];
    
    if(isPreareWinAni){
        return;
    }
    
    if(isDisplayingFinal){
        return;
    }
    
    [[CCDirector sharedDirector] replaceScene: [MainUpgradeScene scene]];
}

-(void) mFinalMissionCallback: (id) sender{
    [musicController playThisSound:kSound_ButtonTap isLoop:NO gain:1.0];
    [musicController playThisSound:kSound_ButtonTap2 isLoop:NO gain:0.2];
    
    if(isPreareWinAni){
        return;
    }
    
    if(isDisplayingFinal){
        return;
    }
    
    [self showFinal];
}

- (void) dealloc
{
	printf("MainMissionScene Dealloc\n");
    [turtleCoinString release];
    [fuckfuckString release];
    [fuckString release];
    [mainMissionCheck release];
	[super dealloc];
}

@end
