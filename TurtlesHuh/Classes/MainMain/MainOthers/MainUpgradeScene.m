//
//  MainUpgradeScene.m
//  TurtlesHuh
//
//  Created by  on 2012/7/1.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "MainUpgradeScene.h"
#import "Global.h"

#import "GamePlayGlobal.h"
#import "MKStoreManager.h"

#import "MainPlayScene.h"
#import "MainMissionScene.h"


#import "CoverScene.h"

#import "AchivementScene.h"
#import "InstructionScene.h"

const char *mainUpgrade_firstSentenseChar = nil;
const char *mainUpgrade_secondSentenseChar = nil;
const char *mainUpgrade_thirdSentenseChar = nil;
const char *mainUpgrade_forthSentenseChar = nil;
const char *mainUpgrade_itemNameChar = nil;
const char *mainUpgrade_priceChar = nil;
const char *mainUpgrade_totalMoneyChar = nil;

@implementation MainUpgradeScene

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	MainUpgradeScene *layer = [MainUpgradeScene node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

-(void) getValuesFromDB{
    AppController *appDelegate =(AppController*) [[UIApplication sharedApplication] delegate];
    [appDelegate getUpgadeValues];
    [appDelegate getONSUpgradeValues];
    [appDelegate getMissionValues];
    [appDelegate getAchivementValues];
    
   // totalPrice = [[NSUserDefaults standardUserDefaults] integerForKey:@"turtleCoin"];
   // totalPrice = 100000;
}

-(void) initLoading2{
	s_loading2 = [CCSprite spriteWithFile:@"iapLoading.png"];
	[self addChild:s_loading2 z:1001];
	[s_loading2 setPosition:ccp(10000,10000)];
}

-(void) addLoad{
	printf("add load\n");
	isLoading = true;
	[s_loading2 setPosition:ccp(240,160)];
}

-(void) endLoad{
	printf("end load\n");
	isLoading = false;
	[s_loading2 setPosition:ccp(10000,10000)];
}


-(void) gameStep:(ccTime) dt{
   /* static int burstlyTimer = 0;
    burstlyTimer++;
    
    if(burstly_viewedOffer){
        burstly_viewedOffer = false;
        UIAlertView *alert = [[[UIAlertView alloc] init] autorelease];
        [alert setTitle:@"Congradulations!"];
        
        NSMutableString* burstlyCoinsString = [NSMutableString string];
        [burstlyCoinsString setString:@"You've been rewared "];
        [burstlyCoinsString appendFormat:@"%i", burstly_coinsGained];
        [burstlyCoinsString appendString:@" coins from Reward Page"];
        
        [alert setMessage:burstlyCoinsString];
        [alert setDelegate:self];
        [alert addButtonWithTitle:@"OK"];
        [alert show];
        
        
        burstly_coinsGained = 0;
        
        totalPrice = [[NSUserDefaults standardUserDefaults] integerForKey:@"turtleCoin"];
        [self updateTurtleCoinsDisplay];
        
    }
    
    if(burstlyTimer % burstlyTimerInterval == 0){
        if(burstly_viewedOffer){

            
        }else{
            printf("burstlyCheckTimes:%i\n",burstlyCheckTimes);
            if(burstlyCheckTimes > 0 && burstlyHasLoaded){
                AppController *appDelegate =(AppController*) [[UIApplication sharedApplication] delegate];
                [appDelegate checkForBurstlyUpdate];
                
                burstlyTimerInterval = 450;
            }
           
            
            burstlyCheckTimes--;
        }
    }*/
    
    
    
    [self manageTransition];
    
    if(isEarningCoinsFromTapJoy){
         earningCoinsFromTapjoyTimer++;
        
        if(earningCoinsFromTapjoyTimer == 10){
            printf("update from tapjoy in mainUrgradeScene\n");
            totalPrice = [[NSUserDefaults standardUserDefaults] integerForKey:@"turtleCoin"];
            [self updateTurtleCoinsDisplay];
        }
    }
    
    if(isGoingToRate){
        rateTimer++;
        if(rateTimer == 10){
            totalPrice += 1000;
            [self updateTurtleCoinsDisplay];
            
            UIAlertView *alert = [[[UIAlertView alloc] init] autorelease];
            [alert setTag:102];
            [alert setTitle:@"Congradulations!"];
            [alert setMessage:@"You've been awarded 1000 Turtle Coins!"];
            [alert setDelegate:self];
            [alert addButtonWithTitle:@"OK"];
            [alert show];
            
            
            [[NSUserDefaults standardUserDefaults] setBool:true forKey:@"hasRatedBefore"];
            hasRatedBefore = true;
            
            [self saveToDB];
        }
    }
}

-(void) initMissionLeft{

    isWarning = false;
    
    if(isIpad){
        l_missionLeftForBtn = [CCLabelAtlas labelWithString:@"0" charMapFile:@"fontV1.png" itemWidth:24 itemHeight:28 startCharMap:'0'];
    }else{
        l_missionLeftForBtn = [CCLabelAtlas labelWithString:@"0" charMapFile:@"fontV1.png" itemWidth:12 itemHeight:14 startCharMap:'0'];
    }
   
    [l_missionLeftForBtn setPosition:ccp(1000,10000)];
    [self addChild:l_missionLeftForBtn z:kDeapth_Turtle_Bombing2];
    [l_missionLeftForBtn setAnchorPoint:ccp(0.0,0.5)];
    
    warning_missionLeft = [CCSprite spriteWithFile:@"mainUpgrade_blockWarning.png"];
    [warning_missionLeft setPosition:ccp(10000,10000)];
    [self addChild:warning_missionLeft z:kDeapth_Turtle_Bombing2];
    
    if(isIpad){
        l_missionLeft = [CCLabelAtlas labelWithString:@"0" charMapFile:@"fontV1.png" itemWidth:24 itemHeight:28 startCharMap:'0'];
    }else{
        l_missionLeft = [CCLabelAtlas labelWithString:@"0" charMapFile:@"fontV1.png" itemWidth:12 itemHeight:14 startCharMap:'0'];
    }
    
    [l_missionLeft setPosition:ccp(1000,10000)];
    [self addChild:l_missionLeft z:kDeapth_Turtle_Bombing2];
    [l_missionLeft setAnchorPoint:ccp(0.0,0.5)];
    [l_missionLeft setColor:ccc3(153, 153, 153)];
    
    
    if(isIpad){
        l_missionLeftPrice = [CCLabelAtlas labelWithString:@"0" charMapFile:@"fontV1.png" itemWidth:24 itemHeight:28 startCharMap:'0'];
    }else{
        l_missionLeftPrice = [CCLabelAtlas labelWithString:@"0" charMapFile:@"fontV1.png" itemWidth:12 itemHeight:14 startCharMap:'0'];
    }
    
    [l_missionLeftPrice setPosition:ccp(1000,10000)];
    [self addChild:l_missionLeftPrice z:kDeapth_Turtle_Bombing2];
    [l_missionLeftPrice setAnchorPoint:ccp(1.0,0.5)];
    [l_missionLeftPrice setColor:ccc3(153, 153, 153)];
    
    for(int i = 0 ; i < maxUpgradeItems ; i++){
        for(int j = 0 ; j < 10 ; j++){
            missionsNeedForThis[i][j] = -1;
        }
    }
    
  /*  missionsNeedForThis[kUpgradeItem_Glider][1] = 5;
    
    missionsNeedForThis[kUpgradeItem_ExtraYellow][0] = 2;
    missionsNeedForThis[kUpgradeItem_LongerYellow][0] = 26;*/
    
   /* missionsNeedForThis[kUpgradeItem_Permenant_Fuel1][0] = 4;
     missionsNeedForThis[kUpgradeItem_Permenant_Fuel2][0] = 9;
     missionsNeedForThis[kUpgradeItem_Permenant_PerfectLaunch][0] = 14;
     missionsNeedForThis[kUpgradeItem_Permenant_Magnetic1][0] = 19;
     missionsNeedForThis[kUpgradeItem_Permenant_Magnetic2][0] = 24;
     missionsNeedForThis[kUpgradeItem_Permenant_BreakLess][0] = 29;
     missionsNeedForThis[kUpgradeItem_Permenant_ExtraYellow][0] = 34;
    missionsNeedForThis[kUpgradeItem_Permenant_MoneyRatio][0] = 39;*/
    
    
    missionsNeedForThis[kUpgradeItem_Permenant_Fuel1][0] = 4;
    missionsNeedForThis[kUpgradeItem_Permenant_Fuel2][0] = 9;
    missionsNeedForThis[kUpgradeItem_Permenant_PerfectLaunch][0] = 19;
    missionsNeedForThis[kUpgradeItem_Permenant_Magnetic1][0] = 14;
    missionsNeedForThis[kUpgradeItem_Permenant_Magnetic2][0] = 39;
    missionsNeedForThis[kUpgradeItem_Permenant_BreakLess][0] = 24;
    missionsNeedForThis[kUpgradeItem_Permenant_ExtraYellow][0] = 29;
    missionsNeedForThis[kUpgradeItem_Permenant_MoneyRatio][0] = 34;
    
    
    missionsNeedForThis[kUpgradeItem_Glider][4-1] = 1;
    missionsNeedForThis[kUpgradeItem_Glider][5-1] = 6;
    missionsNeedForThis[kUpgradeItem_Cannon][4-1] = 11;
    missionsNeedForThis[kUpgradeItem_Cannon][5-1] = 26;
    missionsNeedForThis[kUpgradeItem_Rocket][4-1] = 16;
    missionsNeedForThis[kUpgradeItem_Rocket][5-1] = 31;
    missionsNeedForThis[kUpgradeItem_Helmet][4-1] = 36;
    missionsNeedForThis[kUpgradeItem_Helmet][5-1] = 21;
    
    missionsNeedForThis[kUpgradeItem_FuelAmout][4-1] = 2;
    missionsNeedForThis[kUpgradeItem_FuelAmout][6-1] = 3;
    missionsNeedForThis[kUpgradeItem_FuelConsumption][5-1] = 12;
    missionsNeedForThis[kUpgradeItem_AirResistance][4-1] = 7;
    missionsNeedForThis[kUpgradeItem_AirResistance][9-1] = 33;
    missionsNeedForThis[kUpgradeItem_MaxSpeed][5-1] = 22;
    missionsNeedForThis[kUpgradeItem_MaxSpeed][8-1] = 13;
    missionsNeedForThis[kUpgradeItem_Acceleration][4-1] = 17;
    missionsNeedForThis[kUpgradeItem_MoneyDensity][3-1] = 37;
    missionsNeedForThis[kUpgradeItem_MoneyDensity][4-1] = 28;
    missionsNeedForThis[kUpgradeItem_MoneyRatio][3-1] = 38;
    missionsNeedForThis[kUpgradeItem_ExtraYellow][5-1] = 32;
    missionsNeedForThis[kUpgradeItem_ExtraYellow][6-1] = 8;
    missionsNeedForThis[kUpgradeItem_LongerYellow][5-1] = 18;
    missionsNeedForThis[kUpgradeItem_FasterInvincible][3-1] = 23;
    
    missionsNeedForThis[kUpgradeItem_FuelConsumption][9-1] = 8;
    missionsNeedForThis[kUpgradeItem_Acceleration][8-1] = 23;

   // missionsNeedForThis[kUpgradeItem_MoneyRatio][1-1] = 16;

    
    
}

- (void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    // printf("SDFSDFDSFSDFDSFDSFSDFSDFDSn");
    if(!isWarning){
        return;
    }
    
    for( UITouch *touch in touches ) {
		CGPoint location = [touch locationInView: [touch view]];
        
        if(location.x > 370 && location.x < 454){
            if(location.y > 107 && location.y < 170){
              //  [self cancelWarning];
            }
        }
        
       // printf("locaition:%4.8f %4.8f\n",location.x, location.y);
    }
}

-(void) showWarning{
    isWarning = true;
    
    if(isIpad){
        [warning_missionLeft setPosition:ccp([UIScreen mainScreen].bounds.size.height/2,[UIScreen mainScreen].bounds.size.width/2 - 10)];
    }else{
        [warning_missionLeft setPosition:ccp([UIScreen mainScreen].bounds.size.height/2,[UIScreen mainScreen].bounds.size.width/2 - 5)];
    }
    
    [l_missionLeft setString:[NSString stringWithFormat:@"%i", missionLeftToDisplay]];
    [l_missionLeft setPosition:ccp(warning_missionLeft.position.x + 38, warning_missionLeft.position.y + 32)];
    
    static int totalFuckPrice;
    totalFuckPrice = allUnblockPrices[updgradeItem[recentUpgradeIdx]->itemIdx][updgradeItem[recentUpgradeIdx]->level] + allPrices[updgradeItem[recentUpgradeIdx]->itemIdx][updgradeItem[recentUpgradeIdx]->level];
    printf("totalFuckPrice:%i\n",totalFuckPrice);
    [l_missionLeftPrice setString:[NSString stringWithFormat:@"%i", totalFuckPrice]];
    [l_missionLeftPrice setPosition:ccp(warning_missionLeft.position.x - 74, warning_missionLeft.position.y - 10)];
    
    [mWarning_Pay setPosition:ccp(-80, warning_missionLeft.position.y -215)];
    [mWarning_Cancel setPosition:ccp(80, warning_missionLeft.position.y - 215)];
    
    if(isIpad){
        [l_missionLeft setPosition:ccp(warning_missionLeft.position.x + 76, warning_missionLeft.position.y + 64)];
        [l_missionLeftPrice setPosition:ccp(warning_missionLeft.position.x - 148, warning_missionLeft.position.y - 20)];
        [mWarning_Pay setPosition:ccp(-160, warning_missionLeft.position.y - 480)];
        [mWarning_Cancel setPosition:ccp(160, warning_missionLeft.position.y - 480)];
    }
}

-(void) cancelWarning{
    isWarning = false;
    [warning_missionLeft setPosition:ccp(10000,10000)];
    [l_missionLeft setPosition:ccp(10000,100000)];
    [l_missionLeftPrice setPosition:ccp(10000,100000)];
    
    [mWarning_Pay setPosition:ccp(10000,100000)];
    [mWarning_Cancel setPosition:ccp(10000,100000)];
}

-(void) initTransition{
    isTransitioning = false;
    s_transition = [CCSprite spriteWithFile:@"blackDot.png"];
    [self addChild:s_transition z:kDeapth_Turtle_Bombing2];
    [s_transition setScaleX:300];
    [s_transition setScaleY:180];
    
    if(isIpad){
        [s_transition setScaleX:600];
        [s_transition setScaleY:360];
    }
    
    [s_transition setPosition:ccp(10000,100000)];
    transitionOpacity = 0;
    transitionGain = 1.0;
}

-(void) manageTransition{
    if(isTransitioning){
        if(isTraitionDisappearing){
            transitionOpacity+=15;
            if(transitionOpacity >= 255){
                transitionOpacity = 255;
                isTransitioning = false;
                bustly_isdeleteControllerInMainGame = true;
                [[CCDirector sharedDirector] replaceScene: [MainPlayScene scene]];
            }else{
                
                transitionGain -= 0.02;
                if(transitionGain < 0){
                    transitionGain = 0;
                }
                
                [musicController setmusicGain:transitionGain];

            }
            
            [s_transition setPosition:ccp([UIScreen mainScreen].bounds.size.height/2,160)];
            [s_transition setOpacity:transitionOpacity];
                   }else{
            transitionOpacity-=15;
            if(transitionOpacity <= 0){
                transitionOpacity = 0;
                isTransitioning = false;
            }
            
            [s_transition setPosition:ccp([UIScreen mainScreen].bounds.size.height/2,160)];
            [s_transition setOpacity:transitionOpacity];
            
           /* transitionGain += 0.1;
            if(transitionGain > 1){
                transitionGain = 1;
            }
            
            [musicController setmusicGain:transitionGain];*/
        }
       
        
    }else{
       /* transitionGain += 0.1;
        if(transitionGain > 1){
            transitionGain = 1;
        }
        
        [musicController setmusicGain:transitionGain];*/
    }
    
}

-(void) checkIfUnblockPermenatUpgrades{
   /* if(hasFinishedThisAchivements[4]){
        updgradeItem[kUpgradeItem_Permenant_Fuel1]->level = 1;
    }
    if(hasFinishedThisAchivements[9]){
        updgradeItem[kUpgradeItem_Permenant_Fuel2]->level = 1;
    }
    if(hasFinishedThisAchivements[19]){
        updgradeItem[kUpgradeItem_Permenant_PerfectLaunch]->level = 1;
    }
    if(hasFinishedThisAchivements[14]){
        printf("HHHHHHHHHHHHHHH\n");
        updgradeItem[kUpgradeItem_Permenant_Magnetic1]->level = 1;
    }
    if(hasFinishedThisAchivements[39]){
        updgradeItem[kUpgradeItem_Permenant_Magnetic2]->level = 1;
    }
    if(hasFinishedThisAchivements[24]){
        updgradeItem[kUpgradeItem_Permenant_BreakLess]->level = 1;
    }
    if(hasFinishedThisAchivements[29]){
        updgradeItem[kUpgradeItem_Permenant_ExtraYellow]->level = 1;
    }
    if(hasFinishedThisAchivements[34]){
        updgradeItem[kUpgradeItem_Permenant_MoneyRatio]->level = 1;
    }*/
    
    [self saveToDB];
    [self updateSelectedDisplay];
    [self showLevelShown];
}

-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
        
       
        
        burstly_isOpenning = false;
        burstlyCheckTimes = 0;
        burstlyTimerInterval = 120;
        
        chosenIconPosX = 131;
        chosenIconPosY = 269;
        
        if(isIpad){
            chosenIconPosX *= 1024.0/480.0;
            chosenIconPosY *= 768.0/320.0;
            
            chosenIconPosY -= 25;
        }
        
        AppController *appDelegate =(AppController*) [[UIApplication sharedApplication] delegate];
        [appDelegate setFucklegate:self];
        
        printf("A\n");
        self.isTouchEnabled = YES;
        
      /*  ss_iconTexture  = [CCSpriteBatchNode spriteSheetWithFile:@"iconsALLTexture.png" capacity:1];
        [self addChild:ss_iconTexture z:kDeapth_FUCKTOP];
         iconTexture_width = 92;
         iconTexture_height = 92;
         iconTexture_offsetX = 100;
         iconTexture_offsetY = 100;*/
        
       
        [musicController initForStore];
      //  [musicController setmusicGain:0.0];
        
        
        hasRatedBefore = [[NSUserDefaults standardUserDefaults] boolForKey:@"hasRatedBefore"];
        isFreeChargesOnONS = [[NSUserDefaults standardUserDefaults] boolForKey:@"freeChargesOnONS"];
        
        ss_Font01  = [CCSpriteBatchNode batchNodeWithFile:@"fontV1.png" capacity:1];
        [self addChild:ss_Font01 z:kDeapth_Turtle_Bombing2];
        // ss_Font02  = [CCSpriteBatchNode batchNodeWithFile:@"fontV3.png" capacity:1];
        // [self addChild:ss_Font02 z:kDeapth_Turtle_Bombing2];
        ss_Font03  = [CCSpriteBatchNode batchNodeWithFile:@"fontV3.png" capacity:1];
        [self addChild:ss_Font03 z:kDeapth_Turtle_Bombing2];
        
        CCSprite* s_bg = [CCSprite spriteWithFile:@"mainMission_bg.png"];
        [s_bg setPosition:ccp([UIScreen mainScreen].bounds.size.height/2,[UIScreen mainScreen].bounds.size.width/2)];
        [self addChild:s_bg];
        
        
        CCSprite* s_bg2 = [CCSprite spriteWithFile:@"mainUpgrade_bgTop.png"];
        [s_bg2 setPosition:ccp([UIScreen mainScreen].bounds.size.height/2,[UIScreen mainScreen].bounds.size.width/2)];
        [self addChild:s_bg2];
        
        s_levelWord = [CCSprite spriteWithFile:@"mainUpgrade_level.png"];
        [s_levelWord setPosition:ccp(198,261)];
        [self addChild:s_levelWord];
        
        if(isIpad){
            [s_levelWord setPosition:ccp(s_levelWord.position.x * 1024.0/480.0, s_levelWord.position.y * 768.0/320.0 - 25)];
        }
        
        if(isIphone5){
            [s_levelWord setPosition:ccp(s_levelWord.position.x + 44, s_levelWord.position.y)];
        }
        
        s_ownWord = [CCSprite spriteWithFile:@"mainUpgrade_owned.png"];
        [s_ownWord setPosition:ccp(240000,160)];
        [self addChild:s_ownWord];
        
       // s_showingIcon = [CCSprite spriteWithFile:@"AchievementIcon_unblockedBg.png"];
       // [s_showingIcon setPosition:ccp(131,269)];
       // [self addChild:s_showingIcon];
        
        s_turtleCoinDisplay = [CCSprite spriteWithFile:@"mainMission_coin.png"];
        [s_turtleCoinDisplay setPosition:ccp(375,269)];
        [self addChild:s_turtleCoinDisplay];
        [s_turtleCoinDisplay setScale:0.75];
        
        if(isIphone5){
            [s_turtleCoinDisplay setPosition:ccp(375 + 44,269)];
        }
        
        if(isIpad){
            [s_turtleCoinDisplay setPosition:ccp(s_turtleCoinDisplay.position.x * 1024.0/480.0, s_turtleCoinDisplay.position.y * 768.0/320.0 - 25)];
        }
        
        isEarningCoinsFromTapJoy = false;
        earningCoinsFromTapjoyTimer = 0;
        [self schedule: @selector(gameStep:)];
        
        howmnayUpgrades = 22;
        howmanyUpgradeInOnPage = 9;
        maxSentenseWord = 60;
        maxPriceWord = 5;
        maxItemnameWord = 30;
        
        isLoading = false;
		[self initLoading2];
        
        [MKStoreManager setDelegate:self];
        
        [self getValuesFromDB];
        [self initFixItemPos];
        [self initAllPrices];
        [self initUpgradeItemStructs];
        [self initOtherValues];
        [self initMenu];
        [self initChosen];
        [self initBuyCoinMenu];
        [self initONSUpgradeMenu];
        [self initTurtleCoins];
        [self initMissionLeft];
        [self initTransition];
        
        
        if(isGoingFromMainPlayScene){
            isTraitionDisappearing = false;
            isTransitioning = true;
            transitionGain = 0.0;
            transitionTimer = 0;
            transitionOpacity = 255;
            isGoingFromMainPlayScene = false;
            [s_transition setPosition:ccp([UIScreen mainScreen].bounds.size.height/2, [UIScreen mainScreen].bounds.size.width/2)];
        }
        
        [self updatePage];
        
         [self checkIfUnblockPermenatUpgrades];
        
        
        
        burstlyHasLoaded = false;
        
        if([[NSUserDefaults standardUserDefaults] boolForKey:@"burstly_hasEnteredOfferwall"]){
            printf("UPDATE BURSTLY BEGINNNNNNNNNNNNNNNN\n");
            
            [[NSUserDefaults standardUserDefaults] setBool:false forKey:@"burstly_hasEnteredOfferwall"];
            
            AppController *appDelegate =(AppController*) [[UIApplication sharedApplication] delegate];
            
            [appDelegate loadBurstlyView];
            
            burstlyHasLoaded = true;
            
           // [appDelegate checkForBurstlyUpdate];
            
        }
        
        printf("ad_howmanyMainGamePlayed:%i\n",ad_howmanyMainGamePlayed);
            if(ad_howmanyMainGamePlayed % 3 == 0 && ad_howmanyMainGamePlayed > 0){
                [appDelegate showAllAds];
            }
        

        [self initTapjoy];
    }
	return self;
}


-(void) initTurtleCoins{
    maxCoinWords = 10;
    totalPrice = [[NSUserDefaults standardUserDefaults] integerForKey:@"turtleCoin"];
    //DELETE
    // totalPrice = 1254542;
    printf("totalPrice:%i\n",totalPrice);
    
    s_turtleCoin = [CCSprite spriteWithFile:@"mainMission_coin.png"];
    [self addChild:s_turtleCoin];
    [s_turtleCoin setPosition:ccp(896/2,566/2)];
    
    if(isIphone5){
        [s_turtleCoin setPosition:ccp(s_turtleCoin.position.x + 88, s_turtleCoin.position.y)];
    }
    
    if(isIpad){
        [s_turtleCoin setPosition:ccp(930,665)];
    }
    
   // ss_Font03  = [CCSpriteBatchNode batchNodeWithFile:@"fontV3.png" capacity:1];
   // [self addChild:ss_Font03 z:kDeapth_Turtle_Bombing2];
    
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
    
    mainUpgrade_totalMoneyChar = [turtleCoinString UTF8String];
    
    fontTexture_numInRow = 10;
    fontTexture_offsetX = 17 * 2/textureRatioForFuckingIpad;
    fontTexture_offsetY = 21 * 2/textureRatioForFuckingIpad;

    sentense01_AccumOffset = 0;
    setense01_offsetX = 10 * 2/textureRatioForFuckingIpad;
    
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
    
    if(isIphone5){
        setense01StartDisplayX += 88;
    }
    
    if(isIpad){
        setense01StartDisplayX *=  1024.0/480.0;
        setense01StartDisplayY *=  768.0/320.0;
        
        setense01StartDisplayX -= 23;
        setense01StartDisplayY -= 5;
        
        setense01_offsetX *= 2;
    }
    
    
    for (int i=0; mainUpgrade_totalMoneyChar[i]; i++){
        
        startToFuckIdx = mainUpgrade_totalMoneyChar[i] - 48;
        
        if(startToFuckIdx < 0){
            startToFuckIdx = 64 - 48;
            sentense01_AccumOffset -= 4;
        }
        fontTexture_chosenCol = -1;
        do{
            
            fontTexture_chosenRow = startToFuckIdx;
            fontTexture_chosenCol++;
            
            startToFuckIdx -= fontTexture_numInRow;
        }while(startToFuckIdx >= 0);

        
        [l_coin[i] setTextureRect:CGRectMake(fontTexture_chosenRow * fontTexture_offsetX, fontTexture_chosenCol * fontTexture_offsetY, fontTexture_offsetX, fontTexture_offsetY)];
        
        
        [l_coin[i] setPosition:ccp(sentense01_AccumOffset + setense01StartDisplayX, setense01StartDisplayY)];
        sentense01_AccumOffset += setense01_offsetX;
        
    }
}
-(void) initONSUpgradeMenu{
    howmnayONSUpgrade = 8;
    recentONSUpgradeIdx = 0;
    
    onsUpgrade_MenuItem[0] = [ExtendedMenuItem itemWithNormalImage:@"icon_singleUse_01.png" selectedImage:@"icon_singleUse_01_on.png" target:self selector:@selector(mONSUpgradeSelectCallback:)];
    onsUpgrade_MenuItem[1] = [ExtendedMenuItem itemWithNormalImage:@"icon_singleUse_02.png" selectedImage:@"icon_singleUse_02_on.png" target:self selector:@selector(mONSUpgradeSelectCallback:)];
    onsUpgrade_MenuItem[2] = [ExtendedMenuItem itemWithNormalImage:@"icon_singleUse_03.png" selectedImage:@"icon_singleUse_03_on.png" target:self selector:@selector(mONSUpgradeSelectCallback:)];
    onsUpgrade_MenuItem[3] = [ExtendedMenuItem itemWithNormalImage:@"icon_singleUse_04.png" selectedImage:@"icon_singleUse_04_on.png" target:self selector:@selector(mONSUpgradeSelectCallback:)];
    onsUpgrade_MenuItem[4] = [ExtendedMenuItem itemWithNormalImage:@"icon_singleUse_05.png" selectedImage:@"icon_singleUse_05_on.png" target:self selector:@selector(mONSUpgradeSelectCallback:)];
    onsUpgrade_MenuItem[5] = [ExtendedMenuItem itemWithNormalImage:@"icon_singleUse_06.png" selectedImage:@"icon_singleUse_06_on.png" target:self selector:@selector(mONSUpgradeSelectCallback:)];
    onsUpgrade_MenuItem[6] = [ExtendedMenuItem itemWithNormalImage:@"icon_singleUse_07.png" selectedImage:@"icon_singleUse_07_on.png" target:self selector:@selector(mONSUpgradeSelectCallback:)];
    onsUpgrade_MenuItem[7] = [ExtendedMenuItem itemWithNormalImage:@"icon_singleUse_08.png" selectedImage:@"icon_singleUse_08_on.png" target:self selector:@selector(mONSUpgradeSelectCallback:)];
    
    for(int i = 0 ; i < howmnayONSUpgrade ; i++){
        
        [onsUpgrade_MenuItem[i] setFuckValue:i];
        
        [onsUpgrade_MenuItem[i] setPosition:ccp(10000,100000)];
        ONSOrder[i] = i;
    }
    
    
    
    //ONSOrder[0] = 4;
    //ONSOrder[4] = 0;
    
   
    
    if(isFreeChargesOnONS){
        onsUpgrade_price[0] = 0;
        onsUpgrade_price[1] = 0;
        onsUpgrade_price[2] = 0;
        onsUpgrade_price[3] = 0;
        onsUpgrade_price[4] = 0;
        onsUpgrade_price[5] = 0;
        onsUpgrade_price[6] = 0;
        onsUpgrade_price[7] = 0;
        
       /* updgradeItem[kUpgradeItem_Permenant_Fuel1]->level = 1;
        updgradeItem[kUpgradeItem_Permenant_Fuel2]->level = 1;
        updgradeItem[kUpgradeItem_Permenant_PerfectLaunch]->level = 1;
        updgradeItem[kUpgradeItem_Permenant_Magnetic1]->level = 1;
        updgradeItem[kUpgradeItem_Permenant_Magnetic2]->level = 1;
        updgradeItem[kUpgradeItem_Permenant_BreakLess]->level = 1;
        updgradeItem[kUpgradeItem_Permenant_ExtraYellow]->level = 1;
        updgradeItem[kUpgradeItem_Permenant_MoneyRatio]->level = 1;*/
    }else{
        onsUpgrade_price[0] = 800;
        onsUpgrade_price[1] = 2000;
        onsUpgrade_price[2] = 4500;
        onsUpgrade_price[3] = 900;
        onsUpgrade_price[4] = 850;
        onsUpgrade_price[5] = 250;
        onsUpgrade_price[6] = 1500;
        onsUpgrade_price[7] = 750;
    }
    
    ONSUpgradeMenu = [CCMenu menuWithItems:onsUpgrade_MenuItem[0],onsUpgrade_MenuItem[1],onsUpgrade_MenuItem[2],onsUpgrade_MenuItem[3],onsUpgrade_MenuItem[4],onsUpgrade_MenuItem[5],onsUpgrade_MenuItem[6],onsUpgrade_MenuItem[7],nil];
	[self addChild:ONSUpgradeMenu];
    
    if(isIphone5){
        [ONSUpgradeMenu setPosition:ccp(ONSUpgradeMenu.position.x - 44, ONSUpgradeMenu.position.y)];
    }
}

-(void) mONSUpgradeSelectCallback: (id) sender{
    [musicController playThisSound:kSound_ButtonTap isLoop:NO gain:1.0];
    [musicController playThisSound:kSound_ButtonTap2 isLoop:NO gain:0.2];
    
    if(isLoading)
		return;
    
    if(isWarning){
        return;
    }
    
    if(isShowingTapjoy){
        return;
    }
    
    recentONSUpgradeIdx = [sender getValue];
    [self updateSelectedDisplayONSUpgrade];
}

-(void) initBuyCoinMenu{
    howmnayBuyCoin = 8; 
    
    buyCoin_MenuItem[0] = [ExtendedMenuItem itemWithNormalImage:@"icon_BuyCoins_01.png" selectedImage:@"icon_BuyCoins_01_on.png" target:self selector:@selector(mCoinBuySelectCallback:)];
    buyCoin_MenuItem[1] = [ExtendedMenuItem itemWithNormalImage:@"icon_BuyCoins_02.png" selectedImage:@"icon_BuyCoins_02_on.png" target:self selector:@selector(mCoinBuySelectCallback:)];
    buyCoin_MenuItem[2] = [ExtendedMenuItem itemWithNormalImage:@"icon_BuyCoins_03.png" selectedImage:@"icon_BuyCoins_03_on.png" target:self selector:@selector(mCoinBuySelectCallback:)];
    buyCoin_MenuItem[3] = [ExtendedMenuItem itemWithNormalImage:@"icon_BuyCoins_04.png" selectedImage:@"icon_BuyCoins_04_on.png" target:self selector:@selector(mCoinBuySelectCallback:)];
    buyCoin_MenuItem[4] = [ExtendedMenuItem itemWithNormalImage:@"icon_BuyCoins_05.png" selectedImage:@"icon_BuyCoins_05_on.png" target:self selector:@selector(mCoinBuySelectCallback:)];
    buyCoin_MenuItem[5] = [ExtendedMenuItem itemWithNormalImage:@"icon_BuyCoins_freeons.png" selectedImage:@"icon_BuyCoins_freeons_on.png" target:self selector:@selector(mCoinBuySelectCallback:)];
    buyCoin_MenuItem[6] = [ExtendedMenuItem itemWithNormalImage:@"icon_BuyCoins_rate.png" selectedImage:@"icon_BuyCoins_rate_on.png" target:self selector:@selector(mCoinBuySelectCallback:)];
    buyCoin_MenuItem[7] = [ExtendedMenuItem itemWithNormalImage:@"icon_BuyCoins_freeCoins.png" selectedImage:@"icon_BuyCoins_freeCoins_on.png" target:self selector:@selector(mCoinBuySelectCallback:)];
    
    
    for(int i = 0 ; i < howmnayBuyCoin ; i++){
       // buyCoin_MenuItem[i] = [ExtendedMenuItem itemFromNormalImage:@"AchievementIcon_unblockedBg.png" selectedImage:@"ScoreShown_Badge_C.png" target:self selector:@selector(mCoinBuySelectCallback:)];
        [buyCoin_MenuItem[i] setFuckValue:i];
        
        [buyCoin_MenuItem[i] setPosition:ccp(10000,100000)];
    }
    
    achivement_MenuItem = [ExtendedMenuItem itemWithNormalImage:@"AchievementIcon_unblockedBg.png" selectedImage:@"ScoreShown_Badge_D.png" target:self selector:@selector(mAchivementSelectCallback:)];
    [achivement_MenuItem setPosition:ccp(10000,100000)];
    
    othersMenu = [CCMenu menuWithItems:buyCoin_MenuItem[0],buyCoin_MenuItem[1],buyCoin_MenuItem[2],buyCoin_MenuItem[3],buyCoin_MenuItem[4],buyCoin_MenuItem[5],buyCoin_MenuItem[6],buyCoin_MenuItem[7],achivement_MenuItem,nil];
	[self addChild:othersMenu];
    
    if(isIphone5){
        [othersMenu setPosition:ccp(othersMenu.position.x - 44, othersMenu.position.y)];
    }
    
}


-(void) mCoinBuySelectCallback: (id) sender{
    [musicController playThisSound:kSound_ButtonTap isLoop:NO gain:1.0];
    [musicController playThisSound:kSound_ButtonTap2 isLoop:NO gain:0.2];
    
    if(isLoading)
		return;
    
    if(isWarning){
        return;
    }
    
    if(isShowingTapjoy){
        return;
    }
    
    recentBuyCoinIdx = [sender getValue];
    [self updateSelectedDisplayBuyCoin];
}

-(void) mAchivementSelectCallback: (id) sender{
    [musicController playThisSound:kSound_ButtonTap isLoop:NO gain:1.0];
    [musicController playThisSound:kSound_ButtonTap2 isLoop:NO gain:0.2];
    
    if(isLoading)
		return;
    
    if(isWarning){
        return;
    }
    
    if(isShowingTapjoy){
        return;
    }
    
    [self updateSelectedDisplayAcivement];
}


-(void) initChosen{
    printf("initChosen 01\n");
    string_chosenPrice = [[NSMutableString string] retain];;
    

    s_chosenIcon[0] = [CCSprite spriteWithFile:@"icon_Weapon_01.png"];
    s_chosenIcon[1] = [CCSprite spriteWithFile:@"icon_Weapon_02.png"];
    s_chosenIcon[2] = [CCSprite spriteWithFile:@"icon_Weapon_03.png"];
    s_chosenIcon[3] = [CCSprite spriteWithFile:@"icon_Weapon_04.png"];
    s_chosenIcon[4] = [CCSprite spriteWithFile:@"icon_Weapon_05.png"];
    s_chosenIcon[5] = [CCSprite spriteWithFile:@"icon_Weapon_06.png"];
    s_chosenIcon[6] = [CCSprite spriteWithFile:@"icon_Weapon_07.png"];
    s_chosenIcon[7] = [CCSprite spriteWithFile:@"icon_Weapon_08.png"];
    s_chosenIcon[8] = [CCSprite spriteWithFile:@"icon_Weapon_09.png"];
    s_chosenIcon[9] = [CCSprite spriteWithFile:@"icon_Weapon_10.png"];
    s_chosenIcon[10] = [CCSprite spriteWithFile:@"icon_Weapon_11.png"];
    s_chosenIcon[11] = [CCSprite spriteWithFile:@"icon_Weapon_12.png"];
    s_chosenIcon[12] = [CCSprite spriteWithFile:@"icon_Weapon_13.png"];
    s_chosenIcon[13] = [CCSprite spriteWithFile:@"icon_Weapon_14.png"];
    
    s_chosenIcon[14] = [CCSprite spriteWithFile:@"icon_Pemenant_01.png"];
    s_chosenIcon[15] = [CCSprite spriteWithFile:@"icon_Pemenant_02.png"];
    s_chosenIcon[16] = [CCSprite spriteWithFile:@"icon_Pemenant_03.png"];
    s_chosenIcon[17] = [CCSprite spriteWithFile:@"icon_Pemenant_04.png"];
    s_chosenIcon[18] = [CCSprite spriteWithFile:@"icon_Pemenant_05.png"];
    s_chosenIcon[19] = [CCSprite spriteWithFile:@"icon_Pemenant_06.png"];
    s_chosenIcon[20] = [CCSprite spriteWithFile:@"icon_Pemenant_07.png"];
    s_chosenIcon[21] = [CCSprite spriteWithFile:@"icon_Pemenant_08.png"];
    
    s_chosenIcon[22] = [CCSprite spriteWithFile:@"icon_singleUse_01.png"];
    s_chosenIcon[23] = [CCSprite spriteWithFile:@"icon_singleUse_02.png"];
    s_chosenIcon[24] = [CCSprite spriteWithFile:@"icon_singleUse_03.png"];
    s_chosenIcon[25] = [CCSprite spriteWithFile:@"icon_singleUse_04.png"];
    s_chosenIcon[26] = [CCSprite spriteWithFile:@"icon_singleUse_05.png"];
    s_chosenIcon[27] = [CCSprite spriteWithFile:@"icon_singleUse_06.png"];
    s_chosenIcon[28] = [CCSprite spriteWithFile:@"icon_singleUse_07.png"];
    s_chosenIcon[29] = [CCSprite spriteWithFile:@"icon_singleUse_08.png"];
   
    s_chosenIcon[30] = [CCSprite spriteWithFile:@"icon_BuyCoins_01.png"];
    s_chosenIcon[31] = [CCSprite spriteWithFile:@"icon_BuyCoins_02.png"];
    s_chosenIcon[32] = [CCSprite spriteWithFile:@"icon_BuyCoins_03.png"];
    s_chosenIcon[33] = [CCSprite spriteWithFile:@"icon_BuyCoins_04.png"];
    s_chosenIcon[34] = [CCSprite spriteWithFile:@"icon_BuyCoins_05.png"];
    s_chosenIcon[35] = [CCSprite spriteWithFile:@"icon_BuyCoins_freeons.png"];
    s_chosenIcon[36] = [CCSprite spriteWithFile:@"icon_BuyCoins_rate.png"];
    s_chosenIcon[37] = [CCSprite spriteWithFile:@"icon_BuyCoins_freeCoins.png"];
    s_chosenIcon[38] = [CCSprite spriteWithFile:@"icon_BuyCoins_freeCoins.png"];
    s_chosenIcon[39] = [CCSprite spriteWithFile:@"icon_BuyCoins_freeCoins.png"];
    

    printf("initChosen 02\n");
    for(int i = 0 ; i < 40 ; i++){
        [self addChild:s_chosenIcon[i]];
        [s_chosenIcon[i] setPosition:ccp(10000,10000)];
    }
    printf("initChosen 03\n");
    
    
    if(isIpad){
        l_chosenLevel = [CCLabelAtlas labelWithString:@"0" charMapFile:@"fontV1.png" itemWidth:24 itemHeight:28 startCharMap:'0'];
    }else{
        l_chosenLevel = [CCLabelAtlas labelWithString:@"0" charMapFile:@"fontV1.png" itemWidth:12 itemHeight:14 startCharMap:'0'];
    }
    
    
    [l_chosenLevel setPosition:ccp(10000,10000)];
    [self addChild:l_chosenLevel];
    [l_chosenLevel setAnchorPoint:ccp(0,0)];
    [l_chosenLevel setColor:ccc3(190, 73, 0)];
    
    l_chosenMaxLevel = [CCSprite spriteWithTexture:ss_Font01.texture rect:CGRectMake(0, 0, 0, 0)];
    [l_chosenMaxLevel setPosition:ccp(10000,10000)];
    [ss_Font01 addChild:l_chosenMaxLevel];
    [l_chosenMaxLevel setAnchorPoint:ccp(0,0)];
    [l_chosenMaxLevel setColor:ccc3(190, 73, 0)];
    printf("initChosen 04\n");
    for(int i = 0 ; i < maxSentenseWord ; i++){
        l_sentense01[i] = [CCSprite spriteWithTexture:ss_Font01.texture rect:CGRectMake(0, 0, 0, 0)];
        l_sentense02[i] = [CCSprite spriteWithTexture:ss_Font01.texture rect:CGRectMake(0, 0, 0, 0)];
        l_sentense03[i] = [CCSprite spriteWithTexture:ss_Font01.texture rect:CGRectMake(0, 0, 0, 0)];
        l_sentense04[i] = [CCSprite spriteWithTexture:ss_Font01.texture rect:CGRectMake(0, 0, 0, 0)];
        
        [l_sentense01[i] setPosition:ccp(10000,100000)];
        [l_sentense01[i] setAnchorPoint:ccp(0,0)];
        [ss_Font01 addChild:l_sentense01[i]];
        [l_sentense01[i] setColor:ccc3(140,59,19)];
        
        [l_sentense02[i] setPosition:ccp(10000,100000)];
        [l_sentense02[i] setAnchorPoint:ccp(0,0)];
        [ss_Font01 addChild:l_sentense02[i]];
        [l_sentense02[i] setColor:ccc3(140,59,19)];
        
        [l_sentense03[i] setPosition:ccp(10000,100000)];
        [l_sentense03[i] setAnchorPoint:ccp(0,0)];
        [ss_Font01 addChild:l_sentense03[i]];
        [l_sentense03[i] setColor:ccc3(140,59,19)];
        
        [l_sentense04[i] setPosition:ccp(10000,100000)];
        [l_sentense04[i] setAnchorPoint:ccp(0,0)];
        [ss_Font01 addChild:l_sentense04[i]];
        [l_sentense04[i] setColor:ccc3(140,59,19)];
    }
    
    for(int i = 0 ; i < maxItemnameWord ; i++){
        l_chosenItemName[i] = [CCSprite spriteWithTexture:ss_Font01.texture rect:CGRectMake(0, 0, 0, 0)];
        
        [l_chosenItemName[i] setPosition:ccp(10000,100000)];
        [l_chosenItemName[i] setAnchorPoint:ccp(0,0)];
        [ss_Font01 addChild:l_chosenItemName[i]];
        [l_chosenItemName[i] setColor:ccc3(153,0,0)];
        //[l_chosenItemName[i] setScale:1.5];
    }
    
    for(int i = 0 ; i < maxPriceWord ; i++){
        l_chosenPrice[i] = [CCSprite spriteWithTexture:ss_Font03.texture rect:CGRectMake(0, 0, 0, 0)];
        
        [l_chosenPrice[i] setPosition:ccp(10000,100000)];
        [l_chosenPrice[i] setAnchorPoint:ccp(0,0)];
        [ss_Font03 addChild:l_chosenPrice[i]];
       // [l_chosenPrice[i] setColor:ccc3(0,0,255)];
    }
    
    printf("initChosen 05\n");
    
   /* for(int i = 0 ; i < howmanyUpgradeInOnPage ; i++){
        l_iconLevelShown[i] = [CCLabelAtlas labelWithString:@"0" charMapFile:@"fontV2.png" itemWidth:22 itemHeight:27 startCharMap:'0'];
        [ l_iconLevelShown[i] setPosition:ccp(10000,100000)];
        [ l_iconLevelShown[i] setAnchorPoint:ccp(0,0)];
        [self addChild: l_iconLevelShown[i] z:kDeapth_Turtle_Bombing2];
    }*/
    
}

-(void) resetChosen{
    
    //for free coins
    [mfc_1 setPosition:ccp(10000,100000)];
//    [mfc_2 setPosition:ccp(10000,100000)];
    [mfc_3 setPosition:ccp(10000,100000)];
    [m_tapjoy_register setPosition:ccp(10000,100000)];
    [m_tapjoy_how setPosition:ccp(10000,100000)];
    [m_tapjoy_left setPosition:ccp(10000,100000)];
    [m_tapjoy_right setPosition:ccp(10000,100000)];
    for(int i = 0 ; i < 5 ; i++){
        [tajpyInstruction[i] setPosition:ccp(10000,10000)];
    }
    
    for(int i = 0 ; i < 40 ; i++){
        [s_chosenIcon[i] setPosition:ccp(1000,100000)];
    }
    
    for(int i = 0 ; i < maxSentenseWord ; i++){
        [l_sentense01[i] setPosition:ccp(10000,100000)];
        [l_sentense02[i] setPosition:ccp(10000,100000)];
        [l_sentense03[i] setPosition:ccp(10000,100000)];
        [l_sentense04[i] setPosition:ccp(10000,100000)];
    }
    
    for(int i = 0 ; i < maxItemnameWord ; i++){
        [l_chosenItemName[i] setPosition:ccp(10000,100000)];
    }
    
    for(int i = 0 ; i < maxPriceWord ; i++){
        [l_chosenPrice[i] setPosition:ccp(10000,100000)];
    }
    
    if(pageIdx == 4){
        [s_turtleCoinDisplay setPosition:ccp(10000, -8)];
    }else{
        [s_turtleCoinDisplay setPosition:ccp(375,269)];
        
        if(isIphone5){
            [s_turtleCoinDisplay setPosition:ccp(s_turtleCoinDisplay.position.x + 44, s_turtleCoinDisplay.position.y)];
        }
        
        if(isIpad){
            [s_turtleCoinDisplay setPosition:ccp(s_turtleCoinDisplay.position.x * 1024.0/480.0, s_turtleCoinDisplay.position.y * 768.0/320.0 - 25)];
        }
    }
    
    
    [mBuy setPosition:ccp(0, -8)];
    [mPlayMini setPosition:ccp(10000, -8)];
    [mGetFree setPosition:ccp(10000, -8)];
    [mRateMe setPosition:ccp(10000, -8)];
    
    [mReward setPosition:ccp(10000, -8)];
    [mMissionLeft setPosition:ccp(10000, -8)];
    [mONSIsEnable setPosition:ccp(10000, -8)];
    [mONSIsDisable setPosition:ccp(10000, -8)];
    [l_missionLeftForBtn setPosition:ccp(10000, -8)];
    
}

-(void) initFixItemPos{
    //static int fixStartX = -187;
   // static int fixStartY = -60;
   // static int fixOffsetX = 52.5;
    
    int fixStartX;
     int fixStartY;
     int fixOffsetX;
    
     fixStartX = -192;
     fixStartY = -60;
     fixOffsetX = 52;
    
    if(isIphone5){
        fixStartX += 44;
    }
    
    if(isIpad){
        fixOffsetX *= 2;
        
        fixStartX = -375;
        fixStartY = -120;
    }

    
    relativeFixItemX[0] = fixStartX + fixOffsetX * 0;
    relativeFixItemX[1] = fixStartX + fixOffsetX * 1;
    relativeFixItemX[2] = fixStartX + fixOffsetX * 2;
    relativeFixItemX[3] = fixStartX + fixOffsetX * 3;
    relativeFixItemX[4] = fixStartX + fixOffsetX * 4;
    relativeFixItemX[5] = fixStartX + fixOffsetX * 5;
    relativeFixItemX[6] = fixStartX + fixOffsetX * 6;
    relativeFixItemX[7] = fixStartX + fixOffsetX * 7;
    relativeFixItemX[8] = fixStartX + fixOffsetX * 8;
    
    relativeFixItemY[0] = fixStartY;
    relativeFixItemY[1] = fixStartY;
    relativeFixItemY[2] = fixStartY;
    relativeFixItemY[3] = fixStartY;
    relativeFixItemY[4] = fixStartY;
    relativeFixItemY[5] = fixStartY;
    relativeFixItemY[6] = fixStartY;
    relativeFixItemY[7] = fixStartY;
    relativeFixItemY[8] = fixStartY;
}

-(void) initUpgradeItemStructs{
    for(int i = 0 ; i < howmnayUpgrades ; i++){
        updgradeItem[i] = malloc(sizeof(eUpgradeItemStruct));
        updgradeItem[i]->itemIdx = i;
        updgradeItem[i]->level = upgradeItemLevel[i];


        updgradeItem[i]->price = allPrices[updgradeItem[i]->itemIdx][updgradeItem[i]->level];
    }
    
    
    for(int i = 0 ; i < howmnayUpgrades ; i++){
        
        if(updgradeItem[i]->itemIdx == kUpgradeItem_Glider){
            updgradeItem[i]->maxLevel = 5;
            menuItem[i] = [ExtendedMenuItem itemWithNormalImage:@"icon_Weapon_01.png" selectedImage:@"icon_Weapon_01_on.png" target:self selector:@selector(mItemSelectCallback:)];
            [menuItem[i] setFuckValue:updgradeItem[i]->itemIdx];
        }
        if(updgradeItem[i]->itemIdx == kUpgradeItem_Rocket){
            updgradeItem[i]->maxLevel = 5;
            menuItem[i] = [ExtendedMenuItem itemWithNormalImage:@"icon_Weapon_02.png" selectedImage:@"icon_Weapon_02_on.png" target:self selector:@selector(mItemSelectCallback:)];
            [menuItem[i] setFuckValue:updgradeItem[i]->itemIdx];
        }
        if(updgradeItem[i]->itemIdx == kUpgradeItem_Cannon){
            updgradeItem[i]->maxLevel = 5;
            menuItem[i] = [ExtendedMenuItem itemWithNormalImage:@"icon_Weapon_03.png" selectedImage:@"icon_Weapon_03_on.png" target:self selector:@selector(mItemSelectCallback:)];
            [menuItem[i] setFuckValue:updgradeItem[i]->itemIdx];
        }
        if(updgradeItem[i]->itemIdx == kUpgradeItem_Helmet){
            updgradeItem[i]->maxLevel = 5;
            menuItem[i] = [ExtendedMenuItem itemWithNormalImage:@"icon_Weapon_04.png" selectedImage:@"icon_Weapon_04_on.png" target:self selector:@selector(mItemSelectCallback:)];
            [menuItem[i] setFuckValue:updgradeItem[i]->itemIdx];
        }
        
        
        if(updgradeItem[i]->itemIdx == kUpgradeItem_ExtraYellow){
            updgradeItem[i]->maxLevel = 6;
            menuItem[i] = [ExtendedMenuItem itemWithNormalImage:@"icon_Weapon_05.png" selectedImage:@"icon_Weapon_05_on.png" target:self selector:@selector(mItemSelectCallback:)];
            [menuItem[i] setFuckValue:updgradeItem[i]->itemIdx];
        }
        if(updgradeItem[i]->itemIdx == kUpgradeItem_FuelAmout){
            updgradeItem[i]->maxLevel = 6;
            menuItem[i] = [ExtendedMenuItem itemWithNormalImage:@"icon_Weapon_06.png" selectedImage:@"icon_Weapon_06_on.png" target:self selector:@selector(mItemSelectCallback:)];
            [menuItem[i] setFuckValue:updgradeItem[i]->itemIdx];
        }
        if(updgradeItem[i]->itemIdx == kUpgradeItem_FuelConsumption){
            updgradeItem[i]->maxLevel = 9;
            menuItem[i] = [ExtendedMenuItem itemWithNormalImage:@"icon_Weapon_07.png" selectedImage:@"icon_Weapon_07_on.png" target:self selector:@selector(mItemSelectCallback:)];
            [menuItem[i] setFuckValue:updgradeItem[i]->itemIdx];
        }
        if(updgradeItem[i]->itemIdx == kUpgradeItem_MoneyDensity){
            updgradeItem[i]->maxLevel = 5;
            menuItem[i] = [ExtendedMenuItem itemWithNormalImage:@"icon_Weapon_08.png" selectedImage:@"icon_Weapon_08_on.png" target:self selector:@selector(mItemSelectCallback:)];
            [menuItem[i] setFuckValue:updgradeItem[i]->itemIdx];
        }
        if(updgradeItem[i]->itemIdx == kUpgradeItem_MaxSpeed){
            updgradeItem[i]->maxLevel = 9;
            menuItem[i] = [ExtendedMenuItem itemWithNormalImage:@"icon_Weapon_09.png" selectedImage:@"icon_Weapon_09_on.png" target:self selector:@selector(mItemSelectCallback:)];
            [menuItem[i] setFuckValue:updgradeItem[i]->itemIdx];
        }
        if(updgradeItem[i]->itemIdx == kUpgradeItem_Acceleration){
            updgradeItem[i]->maxLevel = 9;
            menuItem[i] = [ExtendedMenuItem itemWithNormalImage:@"icon_Weapon_10.png" selectedImage:@"icon_Weapon_10_on.png" target:self selector:@selector(mItemSelectCallback:)];
            [menuItem[i] setFuckValue:updgradeItem[i]->itemIdx];
        }
        if(updgradeItem[i]->itemIdx == kUpgradeItem_LongerYellow){
            updgradeItem[i]->maxLevel = 5;
            menuItem[i] = [ExtendedMenuItem itemWithNormalImage:@"icon_Weapon_11.png" selectedImage:@"icon_Weapon_11_on.png" target:self selector:@selector(mItemSelectCallback:)];
            [menuItem[i] setFuckValue:updgradeItem[i]->itemIdx];
        }
        if(updgradeItem[i]->itemIdx == kUpgradeItem_AirResistance){
            updgradeItem[i]->maxLevel = 9;
            menuItem[i] = [ExtendedMenuItem itemWithNormalImage:@"icon_Weapon_12.png" selectedImage:@"icon_Weapon_12_on.png" target:self selector:@selector(mItemSelectCallback:)];
            [menuItem[i] setFuckValue:updgradeItem[i]->itemIdx];
        }
        if(updgradeItem[i]->itemIdx == kUpgradeItem_FasterInvincible){
            updgradeItem[i]->maxLevel = 3;
            menuItem[i] = [ExtendedMenuItem itemWithNormalImage:@"icon_Weapon_13.png" selectedImage:@"icon_Weapon_13_on.png" target:self selector:@selector(mItemSelectCallback:)];
            [menuItem[i] setFuckValue:updgradeItem[i]->itemIdx];
        }
        if(updgradeItem[i]->itemIdx == kUpgradeItem_MoneyRatio){
            updgradeItem[i]->maxLevel = 4;
            menuItem[i] = [ExtendedMenuItem itemWithNormalImage:@"icon_Weapon_14.png" selectedImage:@"icon_Weapon_14_on.png" target:self selector:@selector(mItemSelectCallback:)];
            [menuItem[i] setFuckValue:updgradeItem[i]->itemIdx];
        }
           
        
        
        if(updgradeItem[i]->itemIdx == kUpgradeItem_Permenant_Fuel1){
            updgradeItem[i]->maxLevel = 1;
            menuItem[i] = [ExtendedMenuItem itemWithNormalImage:@"icon_Pemenant_01.png" selectedImage:@"icon_Pemenant_01_on.png" target:self selector:@selector(mItemSelectCallback:)];
            [menuItem[i] setFuckValue:updgradeItem[i]->itemIdx];
        }
        if(updgradeItem[i]->itemIdx == kUpgradeItem_Permenant_Fuel2){
            updgradeItem[i]->maxLevel = 1;
            menuItem[i] = [ExtendedMenuItem itemWithNormalImage:@"icon_Pemenant_02.png" selectedImage:@"icon_Pemenant_02_on.png" target:self selector:@selector(mItemSelectCallback:)];
            [menuItem[i] setFuckValue:updgradeItem[i]->itemIdx];
        }

        if(updgradeItem[i]->itemIdx == kUpgradeItem_Permenant_PerfectLaunch){
            updgradeItem[i]->maxLevel = 1;
            menuItem[i] = [ExtendedMenuItem itemWithNormalImage:@"icon_Pemenant_03.png" selectedImage:@"icon_Pemenant_03_on.png" target:self selector:@selector(mItemSelectCallback:)];
            [menuItem[i] setFuckValue:updgradeItem[i]->itemIdx];
        }

        if(updgradeItem[i]->itemIdx == kUpgradeItem_Permenant_Magnetic1){
            printf("DFDSFS:%i\n",i);
            updgradeItem[i]->maxLevel = 1;
            menuItem[i] = [ExtendedMenuItem itemWithNormalImage:@"icon_Pemenant_04.png" selectedImage:@"icon_Pemenant_04_on.png" target:self selector:@selector(mItemSelectCallback:)];
            [menuItem[i] setFuckValue:updgradeItem[i]->itemIdx];
        }

        if(updgradeItem[i]->itemIdx == kUpgradeItem_Permenant_Magnetic2){
            updgradeItem[i]->maxLevel = 1;
            menuItem[i] = [ExtendedMenuItem itemWithNormalImage:@"icon_Pemenant_05.png" selectedImage:@"icon_Pemenant_05_on.png" target:self selector:@selector(mItemSelectCallback:)];
            [menuItem[i] setFuckValue:updgradeItem[i]->itemIdx];
        }

        if(updgradeItem[i]->itemIdx == kUpgradeItem_Permenant_BreakLess){
            updgradeItem[i]->maxLevel = 1;
            menuItem[i] = [ExtendedMenuItem itemWithNormalImage:@"icon_Pemenant_06.png" selectedImage:@"icon_Pemenant_06_on.png" target:self selector:@selector(mItemSelectCallback:)];
            [menuItem[i] setFuckValue:updgradeItem[i]->itemIdx];
        }

        if(updgradeItem[i]->itemIdx == kUpgradeItem_Permenant_ExtraYellow){
            updgradeItem[i]->maxLevel = 1;
            menuItem[i] = [ExtendedMenuItem itemWithNormalImage:@"icon_Pemenant_07.png" selectedImage:@"icon_Pemenant_07_on.png" target:self selector:@selector(mItemSelectCallback:)];
            [menuItem[i] setFuckValue:updgradeItem[i]->itemIdx];
        }
        if(updgradeItem[i]->itemIdx == kUpgradeItem_Permenant_MoneyRatio){
            updgradeItem[i]->maxLevel = 1;
            menuItem[i] = [ExtendedMenuItem itemWithNormalImage:@"icon_Pemenant_08.png" selectedImage:@"icon_Pemenant_08_on.png" target:self selector:@selector(mItemSelectCallback:)];
            [menuItem[i] setFuckValue:updgradeItem[i]->itemIdx];
        }

        
    }
    
    ExtendedMenuItem* tempMenuTitem;
    tempMenuTitem = [ExtendedMenuItem itemWithNormalImage:@"ScoreShown_btn_menu_off.png" selectedImage:@"ScoreShown_btn_menu_on.png" target:self selector:@selector(mItemSelectCallback:)];
    [tempMenuTitem setFuckValue:100];
    
    upgradeMenu = [CCMenu menuWithItems:menuItem[0],menuItem[1],menuItem[2],menuItem[3],menuItem[4],menuItem[5],
                   menuItem[6],menuItem[7],menuItem[8],menuItem[9],menuItem[10],menuItem[11],
                   menuItem[12],menuItem[13],menuItem[14],menuItem[15],menuItem[16],menuItem[17],menuItem[18],menuItem[19],menuItem[20],menuItem[21],nil];
	[self addChild:upgradeMenu];
    
    if(isIphone5){
        [upgradeMenu setPosition:ccp(upgradeMenu.position.x - 44, upgradeMenu.position.y)];
    }
}

-(void) mItemSelectCallback: (ExtendedMenuItem *)sender {
    
    [musicController playThisSound:kSound_ButtonTap isLoop:NO gain:1.0];
    [musicController playThisSound:kSound_ButtonTap2 isLoop:NO gain:0.2];
    
    if(isLoading)
		return;
    
    if(isWarning){
        return;
    }
    
    if(isShowingTapjoy){
        return;
    }
    
    recentUpgradeIdx = [sender getValue];
    [self updateSelectedDisplay];
}

-(void) initAllPrices{
    for(int i = 0 ; i < maxUpgradeItems ; i++){
        for(int j = 0 ; j < 10 ; j++){
            allPrices[i][j] = 0;
            allUnblockPrices[i][j] = 5500;
        }
        
        if(i >= kUpgradeItem_Permenant_Fuel1){
            allUnblockPrices[i][0] = 40000;
        }
    }
    
    allUnblockPrices[kUpgradeItem_Glider][4-1] = 10000;
    allUnblockPrices[kUpgradeItem_Glider][5-1] = 20000;
    allUnblockPrices[kUpgradeItem_Cannon][4-1] = 10000;
    allUnblockPrices[kUpgradeItem_Cannon][5-1] = 20000;
    allUnblockPrices[kUpgradeItem_Rocket][4-1] = 10000;
    allUnblockPrices[kUpgradeItem_Rocket][5-1] = 20000;
    allUnblockPrices[kUpgradeItem_Helmet][4-1] = 10000;
    allUnblockPrices[kUpgradeItem_Helmet][5-1] = 20000;

    allUnblockPrices[kUpgradeItem_FuelAmout][4-1] = 5000;
    allUnblockPrices[kUpgradeItem_FuelAmout][6-1] = 15000;
    allUnblockPrices[kUpgradeItem_FuelConsumption][5-1] = 5000;
    allUnblockPrices[kUpgradeItem_AirResistance][4-1] = 5000;
    allUnblockPrices[kUpgradeItem_AirResistance][9-1] = 15000;
    allUnblockPrices[kUpgradeItem_MaxSpeed][5-1] = 5000;
    allUnblockPrices[kUpgradeItem_MaxSpeed][8-1] = 15000;
    allUnblockPrices[kUpgradeItem_Acceleration][4-1] = 5000;
    allUnblockPrices[kUpgradeItem_MoneyDensity][3-1] = 5000;
    allUnblockPrices[kUpgradeItem_MoneyDensity][4-1] = 15000;
    allUnblockPrices[kUpgradeItem_MoneyRatio][3-1] = 15000;
    allUnblockPrices[kUpgradeItem_ExtraYellow][5-1] = 5000;
    allUnblockPrices[kUpgradeItem_ExtraYellow][6-1] = 15000;
    allUnblockPrices[kUpgradeItem_LongerYellow][5-1] = 15000;
    allUnblockPrices[kUpgradeItem_FasterInvincible][3-1] = 15000;
    
    allUnblockPrices[kUpgradeItem_FuelConsumption][9-1] = 10000;
    allUnblockPrices[kUpgradeItem_Acceleration][8-1] = 10000;
    
   // allUnblockPrices[kUpgradeItem_MoneyRatio][1-1] = 6000;
    
    
   /* allPrices[kUpgradeItem_Glider][0] = 0;
    allPrices[kUpgradeItem_Glider][1] = 650;
    allPrices[kUpgradeItem_Glider][2] = 2000;
    allPrices[kUpgradeItem_Glider][3] = 6500;
    allPrices[kUpgradeItem_Glider][4] = 16000;
    
    allPrices[kUpgradeItem_Rocket][0] = 0;
    allPrices[kUpgradeItem_Rocket][1] = 450;
    allPrices[kUpgradeItem_Rocket][2] = 1500;
    allPrices[kUpgradeItem_Rocket][3] = 6000;
    allPrices[kUpgradeItem_Rocket][4] = 15000;
    
    allPrices[kUpgradeItem_Cannon][0] = 300;
    allPrices[kUpgradeItem_Cannon][1] = 650;
    allPrices[kUpgradeItem_Cannon][2] = 2100;
    allPrices[kUpgradeItem_Cannon][3] = 6550;
    allPrices[kUpgradeItem_Cannon][4] = 17000;
    
    allPrices[kUpgradeItem_Helmet][0] = 600;
    allPrices[kUpgradeItem_Helmet][1] = 1200;
    allPrices[kUpgradeItem_Helmet][2] = 2700;
    allPrices[kUpgradeItem_Helmet][3] = 7000;
    allPrices[kUpgradeItem_Helmet][4] = 16000;
    
    allPrices[kUpgradeItem_ExtraYellow][0] = 350;
    allPrices[kUpgradeItem_ExtraYellow][1] = 1000;
    allPrices[kUpgradeItem_ExtraYellow][2] = 2000;
    allPrices[kUpgradeItem_ExtraYellow][3] = 4000;
    allPrices[kUpgradeItem_ExtraYellow][4] = 7500;
    allPrices[kUpgradeItem_ExtraYellow][5] = 10000;
    
    allPrices[kUpgradeItem_FuelAmout][0] = 90;
    allPrices[kUpgradeItem_FuelAmout][1] = 200;
    allPrices[kUpgradeItem_FuelAmout][2] = 450;
    allPrices[kUpgradeItem_FuelAmout][3] = 1300;
    allPrices[kUpgradeItem_FuelAmout][4] = 3500;
    allPrices[kUpgradeItem_FuelAmout][5] = 9000;
    
    allPrices[kUpgradeItem_FuelConsumption][0] = 80;
    allPrices[kUpgradeItem_FuelConsumption][1] = 150;
    allPrices[kUpgradeItem_FuelConsumption][2] = 300;
    allPrices[kUpgradeItem_FuelConsumption][3] = 450;
    allPrices[kUpgradeItem_FuelConsumption][4] = 650;
    allPrices[kUpgradeItem_FuelConsumption][5] = 1000;
    allPrices[kUpgradeItem_FuelConsumption][6] = 2000;
    allPrices[kUpgradeItem_FuelConsumption][7] = 4000;
    allPrices[kUpgradeItem_FuelConsumption][8] = 7500;
    
    allPrices[kUpgradeItem_MoneyDensity][0] = 500;
    allPrices[kUpgradeItem_MoneyDensity][1] = 1000;
    allPrices[kUpgradeItem_MoneyDensity][2] = 3000;
    allPrices[kUpgradeItem_MoneyDensity][3] = 6500;
    allPrices[kUpgradeItem_MoneyDensity][4] = 12000;
    
    allPrices[kUpgradeItem_MaxSpeed][0] = 40;
    allPrices[kUpgradeItem_MaxSpeed][1] = 80;
    allPrices[kUpgradeItem_MaxSpeed][2] = 140;
    allPrices[kUpgradeItem_MaxSpeed][3] = 250;
    allPrices[kUpgradeItem_MaxSpeed][4] = 450;
    allPrices[kUpgradeItem_MaxSpeed][5] = 900;
    allPrices[kUpgradeItem_MaxSpeed][6] = 1800;
    allPrices[kUpgradeItem_MaxSpeed][7] = 3500;
    allPrices[kUpgradeItem_MaxSpeed][8] = 7000;
    
    allPrices[kUpgradeItem_Acceleration][0] = 30;
    allPrices[kUpgradeItem_Acceleration][1] = 60;
    allPrices[kUpgradeItem_Acceleration][2] = 100;
    allPrices[kUpgradeItem_Acceleration][3] = 155;
    allPrices[kUpgradeItem_Acceleration][4] = 290;
    allPrices[kUpgradeItem_Acceleration][5] = 750;
    allPrices[kUpgradeItem_Acceleration][6] = 1500;
    allPrices[kUpgradeItem_Acceleration][7] = 3000;
    allPrices[kUpgradeItem_Acceleration][8] = 6000;
    
    allPrices[kUpgradeItem_LongerYellow][0] = 450;
    allPrices[kUpgradeItem_LongerYellow][1] = 1200;
    allPrices[kUpgradeItem_LongerYellow][2] = 2500;
    allPrices[kUpgradeItem_LongerYellow][3] = 6000;
    allPrices[kUpgradeItem_LongerYellow][4] = 9500;
    
    allPrices[kUpgradeItem_AirResistance][0] = 30;
    allPrices[kUpgradeItem_AirResistance][1] = 60;
    allPrices[kUpgradeItem_AirResistance][2] = 100;
    allPrices[kUpgradeItem_AirResistance][3] = 160;
    allPrices[kUpgradeItem_AirResistance][4] = 300;
    allPrices[kUpgradeItem_AirResistance][5] = 800;
    allPrices[kUpgradeItem_AirResistance][6] = 1600;
    allPrices[kUpgradeItem_AirResistance][7] = 2350;
    allPrices[kUpgradeItem_AirResistance][8] = 5000;
    
    allPrices[kUpgradeItem_FasterInvincible][0] = 1500;
    allPrices[kUpgradeItem_FasterInvincible][1] = 4500;
    allPrices[kUpgradeItem_FasterInvincible][2] = 15000;
    
    allPrices[kUpgradeItem_MoneyRatio][0] = 750;
    allPrices[kUpgradeItem_MoneyRatio][1] = 2500;
    allPrices[kUpgradeItem_MoneyRatio][2] = 7500;
    allPrices[kUpgradeItem_MoneyRatio][3] = 20000;
    */
    
    allPrices[kUpgradeItem_Glider][0] = 0;
    allPrices[kUpgradeItem_Glider][1] = 400;
    allPrices[kUpgradeItem_Glider][2] = 1300;
    allPrices[kUpgradeItem_Glider][3] = 6500;
    allPrices[kUpgradeItem_Glider][4] = 16000;
    
    allPrices[kUpgradeItem_Rocket][0] = 0;
    allPrices[kUpgradeItem_Rocket][1] = 300;
    allPrices[kUpgradeItem_Rocket][2] = 1100;
    allPrices[kUpgradeItem_Rocket][3] = 6000;
    allPrices[kUpgradeItem_Rocket][4] = 15000;
    
    allPrices[kUpgradeItem_Cannon][0] = 200;
    allPrices[kUpgradeItem_Cannon][1] = 650;
    allPrices[kUpgradeItem_Cannon][2] = 1250;
    allPrices[kUpgradeItem_Cannon][3] = 6000;
    allPrices[kUpgradeItem_Cannon][4] = 15500;
    
    allPrices[kUpgradeItem_Helmet][0] = 450;
    allPrices[kUpgradeItem_Helmet][1] = 1200;
    allPrices[kUpgradeItem_Helmet][2] = 2700;
    allPrices[kUpgradeItem_Helmet][3] = 7000;
    allPrices[kUpgradeItem_Helmet][4] = 16000;
    
    
    
    
    allPrices[kUpgradeItem_ExtraYellow][0] = 350;
    allPrices[kUpgradeItem_ExtraYellow][1] = 1000;
    allPrices[kUpgradeItem_ExtraYellow][2] = 2000;
    allPrices[kUpgradeItem_ExtraYellow][3] = 4000;
    allPrices[kUpgradeItem_ExtraYellow][4] = 7500;
    allPrices[kUpgradeItem_ExtraYellow][5] = 10000;
    
    allPrices[kUpgradeItem_FuelAmout][0] = 90;
    allPrices[kUpgradeItem_FuelAmout][1] = 200;
    allPrices[kUpgradeItem_FuelAmout][2] = 450;
    allPrices[kUpgradeItem_FuelAmout][3] = 1300;
    allPrices[kUpgradeItem_FuelAmout][4] = 3500;
    allPrices[kUpgradeItem_FuelAmout][5] = 9000;
    
    allPrices[kUpgradeItem_FuelConsumption][0] = 80;
    allPrices[kUpgradeItem_FuelConsumption][1] = 150;
    allPrices[kUpgradeItem_FuelConsumption][2] = 300;
    allPrices[kUpgradeItem_FuelConsumption][3] = 450;
    allPrices[kUpgradeItem_FuelConsumption][4] = 650;
    allPrices[kUpgradeItem_FuelConsumption][5] = 1000;
    allPrices[kUpgradeItem_FuelConsumption][6] = 2000;
    allPrices[kUpgradeItem_FuelConsumption][7] = 4000;
    allPrices[kUpgradeItem_FuelConsumption][8] = 7500;
    
    allPrices[kUpgradeItem_MoneyDensity][0] = 500;
    allPrices[kUpgradeItem_MoneyDensity][1] = 1000;
    allPrices[kUpgradeItem_MoneyDensity][2] = 3000;
    allPrices[kUpgradeItem_MoneyDensity][3] = 6500;
    allPrices[kUpgradeItem_MoneyDensity][4] = 12000;
    
    allPrices[kUpgradeItem_MaxSpeed][0] = 40;
    allPrices[kUpgradeItem_MaxSpeed][1] = 80;
    allPrices[kUpgradeItem_MaxSpeed][2] = 140;
    allPrices[kUpgradeItem_MaxSpeed][3] = 250;
    allPrices[kUpgradeItem_MaxSpeed][4] = 450;
    allPrices[kUpgradeItem_MaxSpeed][5] = 900;
    allPrices[kUpgradeItem_MaxSpeed][6] = 1800;
    allPrices[kUpgradeItem_MaxSpeed][7] = 3500;
    allPrices[kUpgradeItem_MaxSpeed][8] = 7000;
    
    allPrices[kUpgradeItem_Acceleration][0] = 30;
    allPrices[kUpgradeItem_Acceleration][1] = 60;
    allPrices[kUpgradeItem_Acceleration][2] = 100;
    allPrices[kUpgradeItem_Acceleration][3] = 155;
    allPrices[kUpgradeItem_Acceleration][4] = 290;
    allPrices[kUpgradeItem_Acceleration][5] = 750;
    allPrices[kUpgradeItem_Acceleration][6] = 1500;
    allPrices[kUpgradeItem_Acceleration][7] = 3000;
    allPrices[kUpgradeItem_Acceleration][8] = 6000;

    allPrices[kUpgradeItem_LongerYellow][0] = 450;
    allPrices[kUpgradeItem_LongerYellow][1] = 1200;
    allPrices[kUpgradeItem_LongerYellow][2] = 2500;
    allPrices[kUpgradeItem_LongerYellow][3] = 6000;
    allPrices[kUpgradeItem_LongerYellow][4] = 9500;
    
    allPrices[kUpgradeItem_AirResistance][0] = 30;
    allPrices[kUpgradeItem_AirResistance][1] = 60;
    allPrices[kUpgradeItem_AirResistance][2] = 100;
    allPrices[kUpgradeItem_AirResistance][3] = 160;
    allPrices[kUpgradeItem_AirResistance][4] = 300;
    allPrices[kUpgradeItem_AirResistance][5] = 800;
    allPrices[kUpgradeItem_AirResistance][6] = 1600;
    allPrices[kUpgradeItem_AirResistance][7] = 2350;
    allPrices[kUpgradeItem_AirResistance][8] = 5000;
    
    allPrices[kUpgradeItem_FasterInvincible][0] = 1500;
    allPrices[kUpgradeItem_FasterInvincible][1] = 4500;
    allPrices[kUpgradeItem_FasterInvincible][2] = 15000;

    allPrices[kUpgradeItem_MoneyRatio][0] = 750;
    allPrices[kUpgradeItem_MoneyRatio][1] = 2500;
    allPrices[kUpgradeItem_MoneyRatio][2] = 7500;
    allPrices[kUpgradeItem_MoneyRatio][3] = 20000;

    
}

-(void) initOtherValues{
    for(int i = 0 ; i < howmnayUpgrades ; i++){
        upgradeOrder[i] = i;
    }
    

  /*  upgradeOrder[9] = 12;
    upgradeOrder[12] = 9;
    
    upgradeOrder[1] = 10;
    upgradeOrder[10] = 1;*/
    
    recentRelativePosIdx = 0;
    recentUpgradeIdx = upgradeOrder[upgradeOrder[0]];
}

-(void) initTapjoy{
    isShowingTapjoy = false;
    tajpyInstruction[0] = [CCSprite spriteWithFile:@"upgradeBtn_free1_off.png"];
    tajpyInstruction[1] = [CCSprite spriteWithFile:@"upgradeBtn_free1_off.png"];
    tajpyInstruction[2] = [CCSprite spriteWithFile:@"upgradeBtn_free1_off.png"];
    tajpyInstruction[3] = [CCSprite spriteWithFile:@"upgradeBtn_free1_off.png"];
    tajpyInstruction[4] = [CCSprite spriteWithFile:@"upgradeBtn_free1_off.png"];
    
   
    
    mfc_1 = [CCMenuItemImage itemWithNormalImage:@"upgradeBtn_free1_off.png" selectedImage:@"upgradeBtn_free1_on.png" target:self selector:@selector(mFC1Callback:)];
//    mfc_2 = [CCMenuItemImage itemWithNormalImage:@"upgradeBtn_free2_off.png" selectedImage:@"upgradeBtn_free2_on.png" target:self selector:@selector(mFC2Callback:)];
    mfc_3 = [CCMenuItemImage itemWithNormalImage:@"icon_BuyCoins_rate.png" selectedImage:@"icon_BuyCoins_rate_on.png" target:self selector:@selector(mFC3Callback:)];
    
    m_tapjoy_register = [CCMenuItemImage itemWithNormalImage:@"upgradeBtn_tapjoy_register_off.png" selectedImage:@"upgradeBtn_tapjoy_register_on.png" target:self selector:@selector(mTapjoyRegisterCallback:)];
    m_tapjoy_how = [CCMenuItemImage itemWithNormalImage:@"upgradeBtn_tapjoy_how_off.png" selectedImage:@"upgradeBtn_tapjoy_how_on.png" target:self selector:@selector(mTapjoyHowCallback:)];
  
    m_tapjoy_left = [CCMenuItemImage itemWithNormalImage:@"ScoreShown_btn_restartPlay_off.png" selectedImage:@"ScoreShown_btn_restartPlay_on.png" target:self selector:@selector(mTapjoyLeftCallback:)];
    m_tapjoy_right = [CCMenuItemImage itemWithNormalImage:@"ScoreShown_btn_restartPlay_off.png" selectedImage:@"ScoreShown_btn_restartPlay_on.png" target:self selector:@selector(mTapjoyRightCallback:)];
    [m_tapjoy_left setScaleX:-1];
    
    [mfc_1 setPosition:ccp(10000,100000)];
//    [mfc_2 setPosition:ccp(10000,100000)];
    [mfc_3 setPosition:ccp(10000,100000)];
    [m_tapjoy_register setPosition:ccp(10000,100000)];
    [m_tapjoy_how setPosition:ccp(10000,100000)];
    [m_tapjoy_left setPosition:ccp(10000,100000)];
    [m_tapjoy_right setPosition:ccp(10000,100000)];
    
    
//    CCMenu* menu3 = [CCMenu menuWithItems:mfc_1,mfc_2,mfc_3,m_tapjoy_register,m_tapjoy_how,nil];
    CCMenu* menu3 = [CCMenu menuWithItems:mfc_1,mfc_3,m_tapjoy_register,m_tapjoy_how,nil];
	
    [self addChild:menu3];
    
   
    
    for(int i = 0 ; i < 5 ; i++){
        [tajpyInstruction[i] setPosition:ccp(10000,10000)];
        [self addChild:tajpyInstruction[i] z:kDeapth_Turtle_Bombing2];
    }
    
    CCMenu* menu4 = [CCMenu menuWithItems:m_tapjoy_left,m_tapjoy_right,nil];
	[self addChild:menu4 z:kDeapth_Turtle_Bombing2];
    
    
    if(isIphone5){
        [menu3 setPosition:ccp(menu3.position.x - 44, menu3.position.y)];
        [menu4 setPosition:ccp(menu4.position.x - 44, menu4.position.y)];
    }

}

-(void) mTapjoyRegisterCallback: (id) sender{
    [musicController playThisSound:kSound_ButtonTap isLoop:NO gain:1.0];
    [musicController playThisSound:kSound_ButtonTap2 isLoop:NO gain:0.2];
    
    if(isLoading)
		return;
    
    if(isWarning){
        return;
    }
    
    if(isShowingTapjoy){
        return;
    }
    
    AppController *appDelegate =(AppController*) [[UIApplication sharedApplication] delegate];
    [appDelegate loadTapjooyMarketViewController];
}

-(void) mTapjoyHowCallback: (id) sender{
    [musicController playThisSound:kSound_ButtonTap isLoop:NO gain:1.0];
    [musicController playThisSound:kSound_ButtonTap2 isLoop:NO gain:0.2];
    
    if(isLoading)
		return;
    
    if(isWarning){
        return;
    }
    
    if(isShowingTapjoy){
        return;
    }
    
    isShowingTapjoy = true;
    tapjoyIdx = 0;
    [m_tapjoy_left setPosition:ccp(-170,0)];
    [m_tapjoy_right setPosition:ccp(170,0)];
    
    if(isIpad){
        [m_tapjoy_left setPosition:ccp(-440,0)];
        [m_tapjoy_right setPosition:ccp(440,0)];
    }
    
    [self udpateTapjoyPage];
}

-(void) mTapjoyLeftCallback: (id) sender{
    tapjoyIdx--;
    if(tapjoyIdx < 0){
        tapjoyIdx = 0;
    }
    [self udpateTapjoyPage];
}

-(void) mTapjoyRightCallback: (id) sender{
    tapjoyIdx++;
    if(tapjoyIdx == 5){
        isShowingTapjoy = false;
        for(int i = 0 ; i < 5 ; i++){
            [tajpyInstruction[i] setPosition:ccp(10000,10000)];
        }
        [m_tapjoy_left setPosition:ccp(-14000,0)];
        [m_tapjoy_right setPosition:ccp(14000,0)];
        
        return;
    }
    
    [self udpateTapjoyPage];
}

-(void) udpateTapjoyPage{
    for(int i = 0 ; i < 5 ; i++){
        [tajpyInstruction[i] setPosition:ccp(10000,10000)];
    }
    
     [tajpyInstruction[tapjoyIdx] setPosition:ccp([UIScreen mainScreen].bounds.size.height/2, [UIScreen mainScreen].bounds.size.width/2)];
}

-(void) mFC1Callback: (id) sender{
    [musicController playThisSound:kSound_ButtonTap isLoop:NO gain:1.0];
    [musicController playThisSound:kSound_ButtonTap2 isLoop:NO gain:0.2];
    
    if(isLoading)
		return;
    
    if(isWarning){
        return;
    }
    
    if(isShowingTapjoy){
        return;
    }
    
    fc_idx = 0;
    [self resetChosen];

    
    [mBuy setPosition:ccp(100000, -6)];
    
    mainUpgrade_itemNameChar = "";
    mainUpgrade_firstSentenseChar = "";
    mainUpgrade_secondSentenseChar = "";
    mainUpgrade_thirdSentenseChar = "";
    mainUpgrade_forthSentenseChar = "";
    
    fontTexture_numInRow = 10;
    fontTexture_offsetX = 12;
    fontTexture_offsetY = 14;
    
    sentense01_AccumOffset = 0;
    setense01_offsetX = 10;
    
    if(isIpad){
        fontTexture_offsetX *= 2;
        fontTexture_offsetY *= 2;
        setense01_offsetX *= 2;
    }
    
    [self setFirstSentense];
    
    sentense01_AccumOffset = 0;
    [self setSecondSentense];
    
    sentense01_AccumOffset = 0;
    [self setThirdSentense];
    
    sentense01_AccumOffset = 0;
    [self setForthSentense];
    
    
    sentense01_AccumOffset = 0;
    [self setItemNameSentense];
    
    [mReward setPosition:ccp(240-240,320-102-160+0)];
    
    if(isIpad){
        [mReward setPosition:ccp(0,115)];
    }
    
    [s_levelWord setPosition:ccp(198000,261)];
    [s_ownWord setPosition:ccp(400000,100000)];
    
    [l_chosenLevel setPosition:ccp(22500, 254)];
    [l_chosenMaxLevel setPosition:ccp(380000, 280)];
    [s_turtleCoinDisplay setPosition:ccp(375000,269)];
    
    for(int i = 0 ; i < howmnayUpgrades ; i++){
        [menuItem[i] setPosition:ccp(10000,100000)];
    }

    [mfc_1 setPosition:ccp(relativeFixItemX[0],relativeFixItemY[0])];
//    [mfc_2 setPosition:ccp(relativeFixItemX[1],relativeFixItemY[1])];
    [mfc_3 setPosition:ccp(relativeFixItemX[1],relativeFixItemY[1])];
    
    if(hasRatedBefore){
        [mfc_3 setPosition:ccp(10000,relativeFixItemY[1])];
    }
    
    if(canShownExtra == 999){
        [mfc_3 setPosition:ccp(10000,relativeFixItemY[1])];
//        [mfc_2 setPosition:ccp(10000,relativeFixItemY[2])];
    }
}

-(void) mFC2Callback: (id) sender{
    [musicController playThisSound:kSound_ButtonTap isLoop:NO gain:1.0];
    [musicController playThisSound:kSound_ButtonTap2 isLoop:NO gain:0.2];
    
    if(isLoading)
		return;
    
    if(isWarning){
        return;
    }
    
    if(isShowingTapjoy){
        return;
    }
    
    fc_idx = 0;
    [self resetChosen];
    
    
    [mBuy setPosition:ccp(100000, -6)];
    
    mainUpgrade_itemNameChar = "";
    mainUpgrade_firstSentenseChar = "BY COMPLETING THE OFFERS";
    mainUpgrade_secondSentenseChar = "YOU CAN EARN MORE THAN";
    mainUpgrade_thirdSentenseChar = "10000 FREE COINS";
    mainUpgrade_forthSentenseChar = "";
    
    fontTexture_numInRow = 10;
    fontTexture_offsetX = 12;
    fontTexture_offsetY = 14;
    
    sentense01_AccumOffset = 0;
    setense01_offsetX = 10;
    
    if(isIpad){
        fontTexture_offsetX *= 2;
        fontTexture_offsetY *= 2;
        setense01_offsetX *= 2;
    }
    
    [self setFirstSentense];
    
    sentense01_AccumOffset = 0;
    [self setSecondSentense];
    
    sentense01_AccumOffset = 0;
    [self setThirdSentense];
    
    sentense01_AccumOffset = 0;
    [self setForthSentense];
    
    
    sentense01_AccumOffset = 0;
    [self setItemNameSentense];
    
    for (int i = 0; mainUpgrade_firstSentenseChar[i]; i++){
        [l_sentense01[i] setPosition:ccp(l_sentense01[i].position.x, l_sentense01[i].position.y+25)];
    }
    for (int i = 0; mainUpgrade_secondSentenseChar[i]; i++){
        [l_sentense02[i] setPosition:ccp(l_sentense02[i].position.x, l_sentense02[i].position.y+25)];
    }
    for (int i = 0; mainUpgrade_thirdSentenseChar[i]; i++){
        [l_sentense03[i] setPosition:ccp(l_sentense03[i].position.x, l_sentense03[i].position.y+25)];
    }
    
    for (int i=0; mainUpgrade_itemNameChar[i]; i++){
         [l_chosenItemName[i] setPosition:ccp(l_chosenItemName[i].position.x - 40, l_chosenItemName[i].position.y+6)];
    }
    
    [m_tapjoy_register setPosition:ccp(0, -8)];
    [m_tapjoy_how setPosition:ccp(0, 30)];
    
    if(isIpad){
        [m_tapjoy_register setPosition:ccp(0, -16)];
        [m_tapjoy_how setPosition:ccp(0, 60)];
    }
    
    [s_levelWord setPosition:ccp(198000,261)];
    [s_ownWord setPosition:ccp(400000,100000)];
    
    [l_chosenLevel setPosition:ccp(22500, 254)];
    [l_chosenMaxLevel setPosition:ccp(380000, 280)];
    [s_turtleCoinDisplay setPosition:ccp(375000,269)];
    
    for(int i = 0 ; i < howmnayUpgrades ; i++){
        [menuItem[i] setPosition:ccp(10000,100000)];
    }

    [mfc_1 setPosition:ccp(relativeFixItemX[0],relativeFixItemY[0])];
//    [mfc_2 setPosition:ccp(relativeFixItemX[1],relativeFixItemY[1])];
    [mfc_3 setPosition:ccp(relativeFixItemX[1],relativeFixItemY[1])];
    
    if(hasRatedBefore){
        [mfc_3 setPosition:ccp(10000,relativeFixItemY[1])];
    }
}

-(void) mFC3Callback: (id) sender{
    [musicController playThisSound:kSound_ButtonTap isLoop:NO gain:1.0];
    [musicController playThisSound:kSound_ButtonTap2 isLoop:NO gain:0.2];
    
    if(isLoading)
		return;
    
    if(isWarning){
        return;
    }
    
    if(isShowingTapjoy){
        return;
    }
    
    fc_idx = 0;
    [self resetChosen];
    
    
    [mBuy setPosition:ccp(100000, -6)];
    
    mainUpgrade_itemNameChar = "";
    mainUpgrade_firstSentenseChar = "IF YOU LIKE THIS GAME";
    mainUpgrade_secondSentenseChar = "PLEAE RATE AND";
    mainUpgrade_thirdSentenseChar = "FREE COINS WILL BE AWARDED";
    mainUpgrade_forthSentenseChar = "FOR RATING 5 STARS";
    
    fontTexture_numInRow = 10;
    fontTexture_offsetX = 12;
    fontTexture_offsetY = 14;
    
    sentense01_AccumOffset = 0;
    setense01_offsetX = 10;
    
    if(isIpad){
        fontTexture_offsetX *= 2;
        fontTexture_offsetY *= 2;
        setense01_offsetX *= 2;
    }
    
    [self setFirstSentense];
    
    sentense01_AccumOffset = 0;
    [self setSecondSentense];
    
    sentense01_AccumOffset = 0;
    [self setThirdSentense];
    
    sentense01_AccumOffset = 0;
    [self setForthSentense];
    
    
    sentense01_AccumOffset = 0;
    [self setItemNameSentense];
    
    for (int i = 0; mainUpgrade_firstSentenseChar[i]; i++){
        [l_sentense01[i] setPosition:ccp(l_sentense01[i].position.x, l_sentense01[i].position.y+15)];
    }
    for (int i = 0; mainUpgrade_secondSentenseChar[i]; i++){
        [l_sentense02[i] setPosition:ccp(l_sentense02[i].position.x, l_sentense02[i].position.y+15)];
    }
    for (int i = 0; mainUpgrade_thirdSentenseChar[i]; i++){
        [l_sentense03[i] setPosition:ccp(l_sentense03[i].position.x, l_sentense03[i].position.y+15)];
    }
    for (int i = 0; mainUpgrade_forthSentenseChar[i]; i++){
        [l_sentense04[i] setPosition:ccp(l_sentense04[i].position.x, l_sentense04[i].position.y+15)];
    }
    
    for (int i=0; mainUpgrade_itemNameChar[i]; i++){
        [l_chosenItemName[i] setPosition:ccp(l_chosenItemName[i].position.x - 10, l_chosenItemName[i].position.y+6)];
    }
    
    [mRateMe setPosition:ccp(0, -8)];
    
    [s_levelWord setPosition:ccp(198000,261)];
    [s_ownWord setPosition:ccp(400000,100000)];
    
    [l_chosenLevel setPosition:ccp(22500, 254)];
    [l_chosenMaxLevel setPosition:ccp(380000, 280)];
    [s_turtleCoinDisplay setPosition:ccp(375000,269)];
    
    for(int i = 0 ; i < howmnayUpgrades ; i++){
        [menuItem[i] setPosition:ccp(10000,100000)];
    }
    
    [mfc_1 setPosition:ccp(relativeFixItemX[0],relativeFixItemY[0])];
//    [mfc_2 setPosition:ccp(relativeFixItemX[1],relativeFixItemY[1])];
    [mfc_3 setPosition:ccp(relativeFixItemX[1],relativeFixItemY[1])];
    
    if(hasRatedBefore){
        [mfc_3 setPosition:ccp(10000,relativeFixItemY[1])];
    }
}

-(void) initMenu{
    
    CCMenuItem *mPage1 = [CCMenuItemImage itemWithNormalImage:@"icon_Red_01.png" selectedImage:@"icon_Red_01_on.png" target:self selector:@selector(mPage1Callback:)];
    CCMenuItem *mPage2 = [CCMenuItemImage itemWithNormalImage:@"icon_Red_02.png" selectedImage:@"icon_Red_02_on.png" target:self selector:@selector(mPage2Callback:)];
    CCMenuItem *mPage3 = [CCMenuItemImage itemWithNormalImage:@"icon_Red_03.png" selectedImage:@"icon_Red_03_on.png" target:self selector:@selector(mPage3Callback:)];
    CCMenuItem *mPage4 = [CCMenuItemImage itemWithNormalImage:@"icon_Red_05.png" selectedImage:@"icon_Red_05_on.png" target:self selector:@selector(mPage4Callback:)];
    CCMenuItem *mPage5 = [CCMenuItemImage itemWithNormalImage:@"icon_Red_04.png" selectedImage:@"icon_Red_04_on.png" target:self selector:@selector(mPage5Callback:)];
    CCMenuItem *mPage6 = [CCMenuItemImage itemWithNormalImage:@"icon_Red_06.png" selectedImage:@"icon_Red_06_on.png" target:self selector:@selector(mPage6Callback:)];
    
    mBuy = [CCMenuItemImage itemWithNormalImage:@"mainUpgrade_btn_Buy_off.png" selectedImage:@"mainUpgrade_btn_Buy_on.png" target:self selector:@selector(mBuyCallback:)];
    mPlayMini = [CCMenuItemImage itemWithNormalImage:@"mainUpgrade_btn_playMini_off.png" selectedImage:@"mainUpgrade_btn_playMini_on.png" target:self selector:@selector(mBuyCallback:)];
    mGetFree = [CCMenuItemImage itemWithNormalImage:@"mainUpgrade_btn_getFree_off.png" selectedImage:@"mainUpgrade_btn_getFree_on.png" target:self selector:@selector(mBuyCallback:)];
   // mRateMe = [CCMenuItemImage itemFromNormalImage:@"mainUpgrade_btn_rate_off.png" selectedImage:@"mainUpgrade_btn_rate_on.png" target:self selector:@selector(mBuyCallback:)];
    mRateMe = [CCMenuItemImage itemWithNormalImage:@"mainUpgrade_btn_rate_off.png" selectedImage:@"mainUpgrade_btn_rate_on.png" target:self selector:@selector(mNEWRateCallback:)];
    mWarning_Pay = [CCMenuItemImage itemWithNormalImage:@"mainUpgrade_blockWarning_btn_pay_off.png" selectedImage:@"mainUpgrade_blockWarning_btn_pay_on.png" target:self selector:@selector(mWarningPayCallback:)];
    mWarning_Cancel = [CCMenuItemImage itemWithNormalImage:@"mainUpgrade_blockWarning_btn_cancel_off.png" selectedImage:@"mainUpgrade_blockWarning_btn_cancel_on.png" target:self selector:@selector(mWarningCancelCallback:)];
    
    CCMenuItem *mPlay = [CCMenuItemImage itemWithNormalImage:@"mainUpgrade_btn_Play_off.png" selectedImage:@"mainUpgrade_btn_Play_on.png" target:self selector:@selector(mPlayCallback:)];
    CCMenuItem *mBack = [CCMenuItemImage itemWithNormalImage:@"ScoreShown_btn_restart_off.png" selectedImage:@"ScoreShown_btn_restart_on.png" target:self selector:@selector(mBackCallback:)];
    CCMenuItem *mMission = [CCMenuItemImage itemWithNormalImage:@"ScoreShown_btn_menu_off.png" selectedImage:@"ScoreShown_btn_menu_on.png" target:self selector:@selector(mMissionCallback:)];
    CCMenuItem *mAchievement = [CCMenuItemImage itemWithNormalImage:@"ScoreShown_btn_achivement_off.png" selectedImage:@"ScoreShown_btn_achivement_on.png" target:self selector:@selector(mAchivementCallback:)];
    CCMenuItem *mInstruction = [CCMenuItemImage itemWithNormalImage:@"ScoreShown_btn_instruction_off.png" selectedImage:@"ScoreShown_btn_instruction_on.png" target:self selector:@selector(mInstructionCallback:)];
    
    mMissionLeft = [CCMenuItemImage itemWithNormalImage:@"mainUpgrade_btn_missionLeft_off.png" selectedImage:@"mainUpgrade_btn_missionLeft_on.png" target:self selector:@selector(mMissionLeftSelectCallback:)];
    mONSIsEnable = [CCMenuItemImage itemWithNormalImage:@"mainUpgrade_btn_enabled_off.png" selectedImage:@"mainUpgrade_btn_enabled_on.png" target:self selector:@selector(mONSIsEnableSelectCallback:)];
    mONSIsDisable = [CCMenuItemImage itemWithNormalImage:@"mainUpgrade_btn_disable_off.png" selectedImage:@"mainUpgrade_btn_disable_on.png" target:self selector:@selector(mONSIsDisnableSelectCallback:)];
    mReward = [CCMenuItemImage itemWithNormalImage:@"gainFreeCoins_Btn_Off.png" selectedImage:@"gainFreeCoins_Btn_On.png" target:self selector:@selector(mRewardSelectCallback:)];

    
    [mPage1 setPosition:ccp(relativeFixItemX[0] , -112)];
    [mPage2 setPosition:ccp(relativeFixItemX[1] , -112)];
    [mPage3 setPosition:ccp(relativeFixItemX[2] , -112)];
    [mPage4 setPosition:ccp(relativeFixItemX[3] , -112)];
    [mPage5 setPosition:ccp(relativeFixItemX[4] , -112)];
    [mPage6 setPosition:ccp(relativeFixItemX[5] , -112)];
    
    if(isIpad){
        [mPage1 setPosition:ccp(relativeFixItemX[0] , -240)];
        [mPage2 setPosition:ccp(relativeFixItemX[1] , -240)];
        [mPage3 setPosition:ccp(relativeFixItemX[2] , -240)];
        [mPage4 setPosition:ccp(relativeFixItemX[3] , -240)];
        [mPage5 setPosition:ccp(relativeFixItemX[4] , -240)];
        [mPage6 setPosition:ccp(relativeFixItemX[5] , -240)];
    }
    
    [mBuy setPosition:ccp(0, -8)];
     [mPlayMini setPosition:ccp(10000, -8)];
     [mGetFree setPosition:ccp(10000, -8)];
     [mRateMe setPosition:ccp(10000, -8)];
    [mPlay setPosition:ccp(149+5, -110)];
    [mBack setPosition:ccp(-206, 125)];
    [mMission setPosition:ccp(-206, 70)];
    [mAchievement setPosition:ccp(-206, 15)];
    [mInstruction setPosition:ccp(206, 57)];
    
    if(isIpad){
        [mBuy setPosition:ccp(0, -8)];
        [mPlayMini setPosition:ccp(10000, -8)];
        [mGetFree setPosition:ccp(10000, -8)];
        [mRateMe setPosition:ccp(10000, -8)];
        [mPlay setPosition:ccp(305, -240)];
        [mBack setPosition:ccp(-440, 310)];
        [mMission setPosition:ccp(-440, 190)];
        [mAchievement setPosition:ccp(-440, 70)];
        [mInstruction setPosition:ccp(440, 120)];
    }
    
    if(isIphone5){
        [mPlay setPosition:ccp(mPlay.position.x, mPlay.position.y)];
        [mBack setPosition:ccp(mBack.position.x - 44, mBack.position.y)];
        [mMission setPosition:ccp(mMission.position.x - 44, mMission.position.y)];
        [mAchievement setPosition:ccp(mAchievement.position.x - 44, mAchievement.position.y)];
        [mInstruction setPosition:ccp(mInstruction.position.x + 44, mInstruction.position.y)];
        
        [mPage1 setPosition:ccp(mPage1.position.x - 44, mPage1.position.y)];
        [mPage2 setPosition:ccp(mPage2.position.x - 44, mPage2.position.y)];
        [mPage3 setPosition:ccp(mPage3.position.x - 44, mPage3.position.y)];
        [mPage4 setPosition:ccp(mPage4.position.x - 44, mPage4.position.y)];
        [mPage5 setPosition:ccp(mPage5.position.x - 44, mPage5.position.y)];
        [mPage6 setPosition:ccp(mPage6.position.x - 44, mPage6.position.y)];
    
    }
    
    [mMissionLeft setPosition:ccp(10000, -8)];
    [mONSIsEnable setPosition:ccp(10000, -8)];
    [mONSIsDisable setPosition:ccp(10000, -8)];
    [mReward setPosition:ccp(10000, -8)];
    
    [mWarning_Pay setPosition:ccp(10000, -8)];
    [mWarning_Cancel setPosition:ccp(10000, -8)];
    
    [mBack setScale:0.79];
    [mMission setScale:0.79];
    [mAchievement setScale:0.79];
    [mInstruction setScale:0.79];
    
    if(canShownExtra == 999){
        //[mPage6 setPosition:ccp(10000,100000)];
    }
    
	CCMenu* menu = [CCMenu menuWithItems:mPage1,mPage2,mPage3,mPage4,mPage5,mPage6,mBuy,mPlay,mBack,mPlayMini,mGetFree,mMission,mRateMe,mMissionLeft,mONSIsEnable,mONSIsDisable, mAchievement,mInstruction,mReward,nil];
	[self addChild:menu];
    
    CCMenu* menu2 = [CCMenu menuWithItems:mWarning_Pay,mWarning_Cancel, nil];
	[self addChild:menu2 z:kDeapth_FUCKTOP];
    
 
}

-(void) mNEWRateCallback: (id) sender{
    if(!hasRatedBefore){
        [self rateMe];
    }
}


-(void) finishColony:(int)_amount{
    totalPrice += _amount;
    
    [self updateTurtleCoinsDisplay];
    [self saveToDB];
    //[self updateSelectedDisplay];
    //[self showLevelShown];
}

-(void) loadAdColony{
     /*if(hasAdColony){
        return;
    }*/
    
    if(![AppController isInternetReachable]){
        UIAlertView *alert = [[[UIAlertView alloc] init] autorelease];
        [alert setTitle:@"OPPS....."];
        [alert setMessage:@"No network"];
        [alert setDelegate:self];
        [alert addButtonWithTitle:@":("];
        alert.tag = 0;
        [alert show];
        return;
    }
    
    adColonyTimer = 0;
    [self schedule: @selector(adColonyStep:)];
    
}

-(void) adColonyStep:(ccTime) dt{
    adColonyTimer++;
    if(adColonyTimer == 10){
 //       [musicController deallocMusicEngine];
        //[AdColonyAdministratorPublic playVideoAdForSlot:1 withDelegate:self withV4VCPrePopup:YES andV4VCPostPopup:YES];
        [AdColony playVideoAdForZone:ADCOLONY_ZONE_ID withDelegate:self withV4VCPrePopup:YES andV4VCPostPopup:YES];
    }
}

- ( void ) onAdColonyAdStartedInZone:( NSString * )zoneID
{
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"isMusic"])
        [musicController deallocMusicEngine];
}

- ( void ) onAdColonyAdAttemptFinished:(BOOL)shown inZone:( NSString * )zoneID
{
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"isMusic"])
        [musicController reallocaMusicEngine];
}

//- ( void ) onAdColonyV4VCReward:(BOOL)success currencyName:(NSString*)currencyName currencyAmount:(int)amount inZone:(NSString*)zoneID {
//    
//	NSLog(@"AdColony zone %@ reward %i %i %@", zoneID, success, amount, currencyName);
//	
//	if (success) {
//        [self finishColony:amount];
//	}
//}

-(void) mRewardSelectCallback: (id) sender{
    [musicController playThisSound:kSound_ButtonTap isLoop:NO gain:1.0];
    [musicController playThisSound:kSound_ButtonTap2 isLoop:NO gain:0.2];
    
   // AppController *appDelegate =(AppController*) [[UIApplication sharedApplication] delegate];
    /// [appDelegate loadADColonyViewController];
    
    [self loadAdColony];
    
    /*[[NSUserDefaults standardUserDefaults] setBool:true forKey:@"burstly_hasEnteredOfferwall"];
    
    
   // AppController *appDelegate =(AppController*) [[UIApplication sharedApplication] delegate];
   // [appDelegate loadBurstlyView];
    
    AppController *appDelegate =(AppController*) [[UIApplication sharedApplication] delegate];
    
    if(!burstlyHasLoaded){
        [appDelegate loadBurstlyView];
        burstlyHasLoaded = true;
    }
    
    [appDelegate refreshBustlyView];
    [appDelegate loadLoadingViewWOTimer];
    
    
    burstlyCheckTimes = 15;
    fuckTimer = 0;
    hasFucked = false;
    [self schedule: @selector(gameS2222tep:)];*/
}

-(void) removeFuckFuck{
    if(!hasFucked){
        [self unschedule: @selector(gameS2222tep:)];
        AppController *appDelegate =(AppController*) [[UIApplication sharedApplication] delegate];
        [appDelegate removeLoadingView];
        
        hasFucked = true;
    }
}

-(void) gameS2222tep:(ccTime) dt{
    fuckTimer++;
   // printf("fuckTimer:%i\n",fuckTimer);
    if(fuckTimer == 540){
        printf("RRRRRRRRRRRRREVE LOAD\n");

        if(!hasFucked){
            [self unschedule: @selector(gameS2222tep:)];
            AppController *appDelegate =(AppController*) [[UIApplication sharedApplication] delegate];
            [appDelegate removeLoadingView];
            
             hasFucked = true;
        }
        
        
       // CCDirector *director = [CCDirector sharedDirector];
      //  [director setDeviceOrientation:kCCDeviceOrientationLandscapeLeft];
    }
    
}

-(void) mWarningPayCallback: (id) sender{
    [musicController playThisSound:kSound_ButtonTap isLoop:NO gain:1.0];
    [musicController playThisSound:kSound_ButtonTap2 isLoop:NO gain:0.2];
    
    static int totalFuckPrice;
    totalFuckPrice = allUnblockPrices[updgradeItem[recentUpgradeIdx]->itemIdx][updgradeItem[recentUpgradeIdx]->level] + allPrices[updgradeItem[recentUpgradeIdx]->itemIdx][updgradeItem[recentUpgradeIdx]->level];
    
    if(totalPrice >= totalFuckPrice){
        
        NSString *key = [NSString stringWithFormat:@"achivement_hasUnblockForMain_%02d", missionsNeedForThis[updgradeItem[recentUpgradeIdx]->itemIdx][updgradeItem[recentUpgradeIdx]->level] - 1];
        printf("mWarningPayCallback\n");
       // NSLog(key);
        [[NSUserDefaults standardUserDefaults] setBool:true forKey:key];

        
        totalPrice -= totalFuckPrice;
        updgradeItem[recentUpgradeIdx]->level++;
        updgradeItem[recentUpgradeIdx]->price = allPrices[updgradeItem[recentUpgradeIdx]->itemIdx][updgradeItem[recentUpgradeIdx]->level];
        
        [self saveToDB];
        [self updateSelectedDisplay];
        [self showLevelShown];
        [self cancelWarning];
        
         [musicController playThisSound:kSound_Diamond isLoop:NO gain:1.0];
        
    }else{
        [self noMoneyWarning];
    }
}  
  
     
-(void) mWarningCancelCallback: (id) sender{
    [musicController playThisSound:kSound_ButtonTap isLoop:NO gain:1.0];
    [musicController playThisSound:kSound_ButtonTap2 isLoop:NO gain:0.2];
    
    [self cancelWarning];
}  

/*-(void) mPlayMiniCallback: (id) sender{
    if(isLoading)
		return;

}*/


-(void) mMissionLeftSelectCallback: (id) sender{
    [musicController playThisSound:kSound_ButtonTap isLoop:NO gain:1.0];
    [musicController playThisSound:kSound_ButtonTap2 isLoop:NO gain:0.2];
    
    [self showWarning];
}

-(void) mONSIsEnableSelectCallback: (id) sender{
    [musicController playThisSound:kSound_ButtonTap isLoop:NO gain:1.0];
    [musicController playThisSound:kSound_ButtonTap2 isLoop:NO gain:0.2];
    
    
    if(pageIdx == 3){
        onsUpgradeItemIsEnable[recentONSUpgradeIdx] = false;
        
        NSMutableString* achivementString = [NSMutableString string];
        [achivementString setString:@"onsUpgrade_isEnable_"];
        
        if(recentONSUpgradeIdx <= 9){
            [achivementString appendString:@"0"];
        }
        
        [achivementString appendFormat:@"%i", recentONSUpgradeIdx];
        [[NSUserDefaults standardUserDefaults] setBool:false forKey:achivementString];
        
        
        [self updateSelectedDisplayONSUpgrade];
    }
    
    if(pageIdx == 2){
        permenanatUpgradeItemIsEnable[recentUpgradeIdx - 14] = false;
        
        NSMutableString* achivementString = [NSMutableString string];
        [achivementString setString:@"permenantUpgrade_isEnable_"];
        
        if(recentONSUpgradeIdx <= 9){
            [achivementString appendString:@"0"];
        }
        
        [achivementString appendFormat:@"%i", recentUpgradeIdx - 14];
        [[NSUserDefaults standardUserDefaults] setBool:false forKey:achivementString];
        
        
        [self updateSelectedDisplay];
    }
    
}

-(void) mONSIsDisnableSelectCallback: (id) sender{
    [musicController playThisSound:kSound_ButtonTap isLoop:NO gain:1.0];
    [musicController playThisSound:kSound_ButtonTap2 isLoop:NO gain:0.2];
    
    if(pageIdx == 3){
        onsUpgradeItemIsEnable[recentONSUpgradeIdx] = true;
        
        NSMutableString* achivementString = [NSMutableString string];
        [achivementString setString:@"onsUpgrade_isEnable_"];
        
        if(recentONSUpgradeIdx <= 9){
            [achivementString appendString:@"0"];
        }
        
        [achivementString appendFormat:@"%i", recentONSUpgradeIdx];
        [[NSUserDefaults standardUserDefaults] setBool:true forKey:achivementString];
        
        
        [self updateSelectedDisplayONSUpgrade];
    }
    
    if(pageIdx == 2){
        permenanatUpgradeItemIsEnable[recentUpgradeIdx - 14] = true;
        
        NSMutableString* achivementString = [NSMutableString string];
        [achivementString setString:@"permenantUpgrade_isEnable_"];
        
        if(recentONSUpgradeIdx <= 9){
            [achivementString appendString:@"0"];
        }
        
        [achivementString appendFormat:@"%i", recentUpgradeIdx - 14];
        [[NSUserDefaults standardUserDefaults] setBool:true forKey:achivementString];
        
        
        [self updateSelectedDisplay];
    }
   
}

-(void) mInstructionCallback: (id) sender{
    [musicController playThisSound:kSound_ButtonTap isLoop:NO gain:1.0];
    [musicController playThisSound:kSound_ButtonTap2 isLoop:NO gain:0.2];
    
    if(isLoading)
		return;
    
    if(isWarning){
        return;
    }
    
    if(isShowingTapjoy){
        return;
    }
    
    fromInstruction_GoToNextIdx = 0;
    [[CCDirector sharedDirector] replaceScene: [InstructionScene scene]];
    
}

-(void) mAchivementCallback: (id) sender{
    [musicController playThisSound:kSound_ButtonTap isLoop:NO gain:1.0];
    [musicController playThisSound:kSound_ButtonTap2 isLoop:NO gain:0.2];
    
    if(isLoading)
		return;
    
    if(isWarning){
        return;
    }
    
    if(isShowingTapjoy){
        return;
    }
    
    achivementIsGoingToStoreScene = true;
    [[CCDirector sharedDirector] replaceScene: [AchivementScene scene]];

}


-(void) mMissionCallback: (id) sender{
    [musicController playThisSound:kSound_ButtonTap isLoop:NO gain:1.0];
    [musicController playThisSound:kSound_ButtonTap2 isLoop:NO gain:0.2];
    
    if(isLoading)
		return;
    
    if(isWarning){
        return;
    }
    
    if(isShowingTapjoy){
        return;
    }

    isGoingFromMainPlayScene = false;
    [[CCDirector sharedDirector] replaceScene: [MainMissionScene scene]];
}


/*-(void) mGetFreeCallback: (id) sender{
    if(isLoading)
		return;

    
}*/

-(void) mPage1Callback: (id) sender{
    [musicController playThisSound:kSound_ButtonTap isLoop:NO gain:1.0];
    [musicController playThisSound:kSound_ButtonTap2 isLoop:NO gain:0.2];
    
    if(isLoading)
		return;
    
    if(isWarning){
        return;
    }
    
    if(isShowingTapjoy){
        return;
    }
    
    pageIdx = 0;
    recentUpgradeIdx = upgradeOrder[0];
    for(int i = 0 ; i < howmanyUpgradeInOnPage ; i++){
       // [ l_iconLevelShown[i] setPosition:ccp(10000,10000)];
    }
    
    [s_levelWord setPosition:ccp(198,261)];
    [s_ownWord setPosition:ccp(400000,100000)];
    
    if(isIphone5){
        [s_levelWord setPosition:ccp(s_levelWord.position.x + 44, s_levelWord.position.y)];
    }
    
    if(isIpad){
        [s_levelWord setPosition:ccp(s_levelWord.position.x * 1024.0/480.0, s_levelWord.position.y * 768.0/320.0 - 25)];
    }
    
    [self updatePage];
}
-(void) mPage2Callback: (id) sender{
    [musicController playThisSound:kSound_ButtonTap isLoop:NO gain:1.0];
    [musicController playThisSound:kSound_ButtonTap2 isLoop:NO gain:0.2];
    
    if(isLoading)
		return;
    
    if(isWarning){
        return;
    }
    
    if(isShowingTapjoy){
        return;
    }
    
    pageIdx = 1;
    recentUpgradeIdx = upgradeOrder[8];
    for(int i = 0 ; i < howmanyUpgradeInOnPage ; i++){
       // [ l_iconLevelShown[i] setPosition:ccp(10000,10000)];
    }
    
    [s_levelWord setPosition:ccp(198,261)];
    [s_ownWord setPosition:ccp(400000,100000)];
    
    if(isIphone5){
        [s_levelWord setPosition:ccp(s_levelWord.position.x + 44, s_levelWord.position.y)];
    }
    
    if(isIpad){
        [s_levelWord setPosition:ccp(s_levelWord.position.x * 1024.0/480.0, s_levelWord.position.y * 768.0/320.0 - 25)];
    }
    
    [self updatePage];
}
-(void) mPage3Callback: (id) sender{
    [musicController playThisSound:kSound_ButtonTap isLoop:NO gain:1.0];
    [musicController playThisSound:kSound_ButtonTap2 isLoop:NO gain:0.2];
    
    if(isLoading)
		return;
    
    if(isWarning){
        return;
    }
    
    if(isShowingTapjoy){
        return;
    }
    
    pageIdx = 2;
    recentUpgradeIdx = upgradeOrder[14];
    for(int i = 0 ; i < howmanyUpgradeInOnPage ; i++){
       // [ l_iconLevelShown[i] setPosition:ccp(10000,10000)];
    }
    
    [s_levelWord setPosition:ccp(198,261)];
    [s_ownWord setPosition:ccp(400000,100000)];
    
    if(isIphone5){
        [s_levelWord setPosition:ccp(s_levelWord.position.x + 44, s_levelWord.position.y)];
    }
    
    if(isIpad){
        [s_levelWord setPosition:ccp(s_levelWord.position.x * 1024.0/480.0, s_levelWord.position.y * 768.0/320.0 - 25)];
    }
    
    [self updatePage];
}

-(void) mPage4Callback: (id) sender{
    [musicController playThisSound:kSound_ButtonTap isLoop:NO gain:1.0];
    [musicController playThisSound:kSound_ButtonTap2 isLoop:NO gain:0.2];
    
    if(isLoading)
		return;
    
    if(isWarning){
        return;
    }
    
    if(isShowingTapjoy){
        return;
    }
    
    pageIdx = 3;
    recentONSUpgradeIdx = ONSOrder[0];
    for(int i = 0 ; i < howmanyUpgradeInOnPage ; i++){
        //[ l_iconLevelShown[i] setPosition:ccp(10000,10000)];
    }
    
    [s_levelWord setPosition:ccp(100000,261)];
    [s_ownWord setPosition:ccp(192,261)];
    
    if(isIphone5){
        [s_ownWord setPosition:ccp(s_ownWord.position.x + 44, s_ownWord.position.y)];
    }
    
    if(isIpad){
        [s_ownWord setPosition:ccp(192 * 1024.0/480.0,261 * 768.0/320.0 - 25)];
    }
    
    
    [self updateONSUpgradePage];
}
-(void) mPage5Callback: (id) sender{
    [musicController playThisSound:kSound_ButtonTap isLoop:NO gain:1.0];
    [musicController playThisSound:kSound_ButtonTap2 isLoop:NO gain:0.2];
    
    if(isLoading)
		return;
    
    if(isWarning){
        return;
    }
    
    if(isShowingTapjoy){
        return;
    }
    
    pageIdx = 4;
    recentBuyCoinIdx = 0;
 
    
    [s_levelWord setPosition:ccp(100000,261)];
    [s_ownWord setPosition:ccp(10000,261)];
    
     [self updateBuyCoinPage];
    //[self updateAchivementPage];
}

-(void) mPage6Callback: (id) sender{
    [musicController playThisSound:kSound_ButtonTap isLoop:NO gain:1.0];
    [musicController playThisSound:kSound_ButtonTap2 isLoop:NO gain:0.2];
    
    if(isLoading)
		return;
    
    if(isWarning){
        return;
    }
    
    if(isShowingTapjoy){
        return;
    }
    
    pageIdx = 5;
    
    [self resetChosen];
    
     [mBuy setPosition:ccp(100000, -6)];
    
    mainUpgrade_itemNameChar = "";
    mainUpgrade_firstSentenseChar = "";
    mainUpgrade_secondSentenseChar = "";
    mainUpgrade_thirdSentenseChar = "";
    mainUpgrade_forthSentenseChar = "";
    
    fontTexture_numInRow = 10;
    fontTexture_offsetX = 12;
    fontTexture_offsetY = 14;
    
    sentense01_AccumOffset = 0;
    setense01_offsetX = 10;
    
    if(isIpad){
        fontTexture_offsetX *= 2;
        fontTexture_offsetY *= 2;
        setense01_offsetX *= 2;
    }
    
    [self setFirstSentense];
    
    sentense01_AccumOffset = 0;
    [self setSecondSentense];
    
    sentense01_AccumOffset = 0;
    [self setThirdSentense];
    
    sentense01_AccumOffset = 0;
    [self setForthSentense];
    
    
    sentense01_AccumOffset = 0;
    [self setItemNameSentense];
    
    // [mReward setPosition:ccp(0,-4)];
    [mReward setPosition:ccp(240-240,320-102-160+0)];
    
    if(isIpad){
        [mReward setPosition:ccp(0,115)];
    }
    
    [s_levelWord setPosition:ccp(198000,261)];
    [s_ownWord setPosition:ccp(400000,100000)];
    
    [l_chosenLevel setPosition:ccp(22500, 254)];
    [l_chosenMaxLevel setPosition:ccp(380000, 280)];
    [s_turtleCoinDisplay setPosition:ccp(375000,269)];
    
    for(int i = 0 ; i < howmnayUpgrades ; i++){
        [menuItem[i] setPosition:ccp(10000,100000)];
    }
    
    for(int i = 0 ; i < howmnayBuyCoin ; i++){
        [buyCoin_MenuItem[i] setPosition:ccp(100000,10000)];
    }
    for(int i = 0 ; i < howmnayONSUpgrade ; i++){
        [onsUpgrade_MenuItem[i] setPosition:ccp(10000,100000)];
    }
    
    [mfc_1 setPosition:ccp(relativeFixItemX[0],relativeFixItemY[0])];
//    [mfc_2 setPosition:ccp(relativeFixItemX[1],relativeFixItemY[1])];
    [mfc_3 setPosition:ccp(relativeFixItemX[1],relativeFixItemY[1])];
    
    if(hasRatedBefore){
        [mfc_3 setPosition:ccp(10000,relativeFixItemY[1])];
    }
    
    if(canShownExtra == 999){
        [mfc_3 setPosition:ccp(10000,relativeFixItemY[1])];
//        [mfc_2 setPosition:ccp(10000,relativeFixItemY[2])];
    }
    
}

-(void) mPlayCallback: (id) sender{
    [musicController playThisSound:kSound_ButtonTap isLoop:NO gain:1.0];
    [musicController playThisSound:kSound_ButtonTap2 isLoop:NO gain:0.2];
    
    if(isLoading)
		return;
    
    if(isWarning){
        return;
    }
    
    if(isShowingTapjoy){
        return;
    }
    
    //[[CCDirector sharedDirector] replaceScene: [MainPlayScene scene]];
    
    if(![[NSUserDefaults standardUserDefaults] boolForKey:@"main_hasPlayedInstruction"]){
        fromInstruction_GoToNextIdx = 1;
        [[CCDirector sharedDirector] replaceScene: [InstructionScene scene]];
        return;
    }
    
    if(isTraitionDisappearing){
        return;
    }
    transitionTimer = 0;
    isTransitioning = true;
    isTraitionDisappearing = true;
}

-(void) mBackCallback: (id) sender{
    [musicController playThisSound:kSound_ButtonTap isLoop:NO gain:1.0];
    [musicController playThisSound:kSound_ButtonTap2 isLoop:NO gain:0.2];
    
    if(isLoading)
		return;
    
    if(isWarning){
        return;
    }
    
    if(isShowingTapjoy){
        return;
    }
    
    bustly_isdeleteControllerInMainGame = true;
    [[CCDirector sharedDirector] replaceScene: [CoverScene scene]];
}

-(void) mBuyCallback: (id) sender{
    [musicController playThisSound:kSound_ButtonTap isLoop:NO gain:1.0];
    [musicController playThisSound:kSound_ButtonTap2 isLoop:NO gain:0.2];
    
   // printf("buy:%i\n",recentUpgradeIdx);
    if(isLoading)
		return;
    
    if(isWarning){
        return;
    }
    
    if(isShowingTapjoy){
        return;
    }
    
    if(pageIdx == 0 || pageIdx == 1 || pageIdx == 2){
        if(updgradeItem[recentUpgradeIdx]->level == updgradeItem[recentUpgradeIdx]->maxLevel){
            return;
        }
        
        if(totalPrice >= updgradeItem[recentUpgradeIdx]->price){
            [self successBuy];
        }else{
            [self noMoneyWarning];
        }
    }
    
    if(pageIdx == 3){
        printf("recentONSUpgradeIdx:%i\n",recentONSUpgradeIdx);
        /*if(recentONSUpgradeIdx == howmnayONSUpgrade - 1){
            if(!hasRatedBefore){
                [self rateMe];
            }
        }else{
            if(totalPrice >= onsUpgrade_price[recentONSUpgradeIdx]){
                [self successBuyONS];
            }else{
                [self noMoneyWarning];
            }
        }*/
        if(totalPrice >= onsUpgrade_price[recentONSUpgradeIdx]){
            [self successBuyONS];
        }else{
            [self noMoneyWarning];
        }
        
    }
    
    if(pageIdx == 4){
        printf("recentBuyCoinIdx:%i\n",recentBuyCoinIdx);
        
        if(recentBuyCoinIdx >= 0 && recentBuyCoinIdx <= 5){
            [self buyIAP];
        }
        
        if(recentBuyCoinIdx == 6){
			//[[CCDirector sharedDirector] replaceScene: [SelectMinigameScene scene]];
            if(!hasRatedBefore){
                [self rateMe];
            }
		}
        
        if(recentBuyCoinIdx == 7){
            printf("loadTapjooyMarketViewController\n");
            AppController *appDelegate =(AppController*) [[UIApplication sharedApplication] delegate];
            [appDelegate loadTapjooyMarketViewController];
        }

    }
}


-(void) successBuy{
    totalPrice -= updgradeItem[recentUpgradeIdx]->price;
    updgradeItem[recentUpgradeIdx]->level++;
    updgradeItem[recentUpgradeIdx]->price = allPrices[updgradeItem[recentUpgradeIdx]->itemIdx][updgradeItem[recentUpgradeIdx]->level];
    
    [self saveToDB];
    [self updateSelectedDisplay];
    [self showLevelShown];
    
    [musicController playThisSound:kSound_Diamond isLoop:NO gain:1.0];
}

-(void) successBuyONS{
    totalPrice -= onsUpgrade_price[recentONSUpgradeIdx];
    onsUpgradeItemLevel[recentONSUpgradeIdx]++;
    
    [self saveToDB];
    [self updateSelectedDisplayONSUpgrade];
    [self showLevelShown];
    
    [musicController playThisSound:kSound_Diamond isLoop:NO gain:1.0];
}


-(void) noMoneyWarning{

}



-(void) saveToDB{
    [[NSUserDefaults standardUserDefaults] setInteger:totalPrice forKey:@"turtleCoin"];
    
    NSMutableString* achivementString = [NSMutableString string];
        
        [achivementString setString:@"upgrade_itemLevel_"];
        
        if(updgradeItem[recentUpgradeIdx]->itemIdx <= 9){
            [achivementString appendString:@"0"];
        }
        
        [achivementString appendFormat:@"%i", updgradeItem[recentUpgradeIdx]->itemIdx];
    
    printf("save to DB:%i %i\n",recentUpgradeIdx, updgradeItem[recentUpgradeIdx]->level);
  //  NSLog(achivementString);
    [[NSUserDefaults standardUserDefaults] setInteger:updgradeItem[recentUpgradeIdx]->level forKey:achivementString];
    
    
    NSMutableString* achivementString2 = [NSMutableString string];
    
    [achivementString2 setString:@"onsUpgrade_itemLevel_"];
    
    if(recentONSUpgradeIdx <= 9){
        [achivementString2 appendString:@"0"];
    }
    
    [achivementString2 appendFormat:@"%i", recentONSUpgradeIdx];
    [[NSUserDefaults standardUserDefaults] setInteger:onsUpgradeItemLevel[recentONSUpgradeIdx] forKey:achivementString2];

}

-(void) showLevelShown{

    
    /*if(pageIdx == 0){
        for(int i = 0 ; i < howmanyUpgradeInOnPage ; i++){
            [l_iconLevelShown[i] setString:[NSString stringWithFormat:@"%i", updgradeItem[upgradeOrder[i]]->level]];
            [l_iconLevelShown[i] setPosition:ccp(relativeFixItemX[i] + 10 + 240, relativeFixItemY[i] + 10 + 160)];
            
           // printf(":%i %4.8f %4.8f\n",i, l_iconLevelShown[i].position.x, l_iconLevelShown[i].position.y);
        }
    }
    if(pageIdx == 1){
        for(int i = 0 ; i < howmanyUpgradeInOnPage-1 ; i++){
            [l_iconLevelShown[i] setString:[NSString stringWithFormat:@"%i", updgradeItem[upgradeOrder[i+howmanyUpgradeInOnPage]]->level]];
            [l_iconLevelShown[i] setPosition:ccp(relativeFixItemX[i] + 10 + 240, relativeFixItemY[i] + 10 + 160)];
        }
    }
    if(pageIdx == 2){
        for(int i = 0 ; i < howmnayONSUpgrade ; i++){
            [l_iconLevelShown[i] setString:[NSString stringWithFormat:@"%i",onsUpgradeItemLevel[ONSOrder[i]]]];
            [l_iconLevelShown[i] setPosition:ccp(relativeFixItemX[i] + 10 + 240, relativeFixItemY[i] + 10 + 160)];
        }
    }*/

}

-(void) updatePage{
    if(pageIdx == 0 || pageIdx == 1 || pageIdx == 2){
        
        static int startPageIdx;
        static int endPageIdx;
        if(pageIdx == 0){
            startPageIdx = 0;
            endPageIdx = 7;
        }
        if(pageIdx == 1){
            startPageIdx = 8;
            endPageIdx = 13;
        }
        if(pageIdx == 2){
            startPageIdx = 14;
            endPageIdx = 21;
        }
        
        for(int i = 0 ; i < howmnayUpgrades ; i++){
            if(i >= startPageIdx &&  i <= endPageIdx){
                static int relativePosIdxx;
                relativePosIdxx = i - startPageIdx;
                [menuItem[upgradeOrder[i]] setPosition:ccp(relativeFixItemX[relativePosIdxx],relativeFixItemY[relativePosIdxx])];
            }else{
               // printf("SSSSS:%i %i\n",i ,upgradeOrder[i]);
                [menuItem[upgradeOrder[i]] setPosition:ccp(10000,100000)];
                //  printf("EEEE SSSSS:%i %i\n",i ,upgradeOrder[i]);
            }
        }
    }else{
        for(int i = 0 ; i < howmnayUpgrades ; i++){
            [menuItem[i] setPosition:ccp(10000,100000)];
        }
    }
    
    [achivement_MenuItem setPosition:ccp(10000,10000)];
    for(int i = 0 ; i < howmnayBuyCoin ; i++){
        [buyCoin_MenuItem[i] setPosition:ccp(100000,10000)];
    }
    for(int i = 0 ; i < howmnayONSUpgrade ; i++){
        [onsUpgrade_MenuItem[i] setPosition:ccp(10000,100000)];
    }
    
    [self updateSelectedDisplay];
    [self showLevelShown];
}

-(void) updateONSUpgradePage{
    for(int i = 0 ; i < howmnayUpgrades ; i++){
        [menuItem[i] setPosition:ccp(10000,100000)];
    }
    
    
    [achivement_MenuItem setPosition:ccp(10000,10000)];
    for(int i = 0 ; i < howmnayBuyCoin ; i++){
        [buyCoin_MenuItem[i] setPosition:ccp(100000,10000)];
    }
    
    for(int i = 0 ; i < howmnayONSUpgrade ; i++){
        [onsUpgrade_MenuItem[ONSOrder[i]] setPosition:ccp(relativeFixItemX[i],relativeFixItemY[i])];
    }
    
    if(hasRatedBefore || canShownExtra == 999){
         
    }else{
      //  [onsUpgrade_MenuItem[howmnayONSUpgrade-1] setPosition:ccp(relativeFixItemX[howmnayONSUpgrade-1],relativeFixItemY[howmnayONSUpgrade-1])];
    }
   
    
    [self updateSelectedDisplayONSUpgrade];
    [self showLevelShown];
}

-(void) updateBuyCoinPage{
    for(int i = 0 ; i < howmnayUpgrades ; i++){
        [menuItem[i] setPosition:ccp(10000,100000)];
    }


    [achivement_MenuItem setPosition:ccp(10000,10000)];
    for(int i = 0 ; i < howmnayBuyCoin ; i++){
        [buyCoin_MenuItem[i] setPosition:ccp(100000,10000)];
    }
    for(int i = 0 ; i < howmnayONSUpgrade ; i++){
        [onsUpgrade_MenuItem[i] setPosition:ccp(10000,100000)];
    }

    
    /*for(int i = 0 ; i < howmnayBuyCoin ; i++){
        [buyCoin_MenuItem[i] setPosition:ccp(relativeFixItemX[i],relativeFixItemY[i])];
    }*/
    
    for(int i = 0 ; i < howmnayBuyCoin ; i++){
        [buyCoin_MenuItem[i] setPosition:ccp(relativeFixItemX[i],relativeFixItemY[i])];
    }
    
    [buyCoin_MenuItem[6] setPosition:ccp(relativeFixItemX[7],relativeFixItemY[7])];
  [buyCoin_MenuItem[7] setPosition:ccp(relativeFixItemX[6],relativeFixItemY[6])];
    
    if(hasRatedBefore || canShownExtra == 999){
        [buyCoin_MenuItem[6] setPosition:ccp(10000,100000)];
    }
    
    if(canShownExtra == 999){
        [buyCoin_MenuItem[7] setPosition:ccp(10000,100000)];
    }
    
    [buyCoin_MenuItem[6] setPosition:ccp(10000,100000)];
    [buyCoin_MenuItem[7] setPosition:ccp(10000,100000)];
    
    [self updateSelectedDisplayBuyCoin];
}

-(void) updateAchivementPage{
    for(int i = 0 ; i < howmnayUpgrades ; i++){
        [menuItem[i] setPosition:ccp(10000,100000)];
    }
    
    
    [achivement_MenuItem setPosition:ccp(10000,10000)];
    for(int i = 0 ; i < howmnayBuyCoin ; i++){
        [buyCoin_MenuItem[i] setPosition:ccp(100000,10000)];
    }
    for(int i = 0 ; i < howmnayONSUpgrade ; i++){
        [onsUpgrade_MenuItem[i] setPosition:ccp(10000,100000)];
    }
    
    
    [achivement_MenuItem setPosition:ccp(relativeFixItemX[5],relativeFixItemY[5])];
    
    
    [self updateSelectedDisplayAcivement];
}


-(void) updateSelectedDisplayAcivement{
    [self resetChosen];
    [self updateTurtleCoinsDisplay];
}

-(void) updateSelectedDisplayBuyCoin{
    [self resetChosen];
    [self updateTurtleCoinsDisplay];
    
    itemNamePosX = 162;
    itemNamePosY = 262;
    
    sentense01posX = [UIScreen mainScreen].bounds.size.height/2;
    sentense02posX = [UIScreen mainScreen].bounds.size.height/2;
    sentense03posX = [UIScreen mainScreen].bounds.size.height/2;
    sentense04posX = [UIScreen mainScreen].bounds.size.height/2;
    sentense01posY = 226;
    sentense02posY = 209;
    sentense03posY = 194;
    sentense04posY = 179;
    
    if(isIpad){
        itemNamePosX *= 1024.0/480.0;
        itemNamePosY *= 768.0/320.0;
        
        itemNamePosY -= 25;
        
        sentense01posY *= 768.0/320.0;
        sentense02posY *= 768.0/320.0;
        sentense03posY *= 768.0/320.0;
        sentense04posY *= 768.0/320.0;
    }
    

    if(isIphone5){
        itemNamePosX += 44;
    }
    
    [string_chosenPrice setString:@""];
    
    int iPhone5OffsetX;
    if(isIphone5){
        iPhone5OffsetX = 44;
    }else{
        iPhone5OffsetX = 0;
    }
    
   
    if(recentBuyCoinIdx == 0){
        mainUpgrade_itemNameChar = "2_500 COINS";
        mainUpgrade_firstSentenseChar = "GET IT FOR 0^99USD";
        mainUpgrade_secondSentenseChar = "";
        mainUpgrade_thirdSentenseChar = "";
        mainUpgrade_forthSentenseChar = "";
        
        [s_chosenIcon[30] setPosition:ccp(chosenIconPosX + iPhone5OffsetX,chosenIconPosY)];
    }
    if(recentBuyCoinIdx == 1){
        mainUpgrade_itemNameChar = "12_500 COINS";
        mainUpgrade_firstSentenseChar = "GET IT FOR 2^99USD";
        mainUpgrade_secondSentenseChar = "<0^99USD FOR 4_166 COINS>";
        mainUpgrade_thirdSentenseChar = "";
        mainUpgrade_forthSentenseChar = "";
        
        [s_chosenIcon[31] setPosition:ccp(chosenIconPosX + iPhone5OffsetX,chosenIconPosY)];
    }
    if(recentBuyCoinIdx == 2){
        mainUpgrade_itemNameChar = "40_000 COINS";
        mainUpgrade_firstSentenseChar = "GET IT FOR 4^99USD";
        mainUpgrade_secondSentenseChar = "<0^99USD FOR 8_000 COINS>";
        mainUpgrade_thirdSentenseChar = "";
        mainUpgrade_forthSentenseChar = "";
        
        [s_chosenIcon[32] setPosition:ccp(chosenIconPosX + iPhone5OffsetX,chosenIconPosY)];
    }
    if(recentBuyCoinIdx == 3){
        mainUpgrade_itemNameChar = "200_000 COINS";
        mainUpgrade_firstSentenseChar = "GET IT FOR 9^99USD";
        mainUpgrade_secondSentenseChar = "<0^99USD FOR 20_000 COINS>";
        mainUpgrade_thirdSentenseChar = "";
        mainUpgrade_forthSentenseChar = "";
        
        [s_chosenIcon[33] setPosition:ccp(chosenIconPosX + iPhone5OffsetX,chosenIconPosY)];
    }
    if(recentBuyCoinIdx == 4){
        mainUpgrade_itemNameChar = "999_999 COINS <BEST VALUE>";
        
        /*if(canShownExtra == 3 || canShownExtra == 4){
            mainUpgrade_firstSentenseChar = "GET IT FOR 19^99USD";
            mainUpgrade_secondSentenseChar = "<0^99USD FOR 50_000 COINS>";
            mainUpgrade_thirdSentenseChar = "";
            mainUpgrade_forthSentenseChar = "";
        }else{
            mainUpgrade_firstSentenseChar = "GET IT FOR 24^99USD";
            mainUpgrade_secondSentenseChar = "<0^99USD FOR 40_000 COINS>";
            mainUpgrade_thirdSentenseChar = "";
            mainUpgrade_forthSentenseChar = "";
        }*/
        
        mainUpgrade_firstSentenseChar = "GET IT FOR 19^99USD";
        mainUpgrade_secondSentenseChar = "<0^99USD FOR 50_000 COINS>";
        mainUpgrade_thirdSentenseChar = "";
        mainUpgrade_forthSentenseChar = "";
        
        [s_chosenIcon[34] setPosition:ccp(chosenIconPosX + iPhone5OffsetX,chosenIconPosY)];
    }
   /* if(recentBuyCoinIdx == 5){
        mainUpgrade_itemNameChar = "800_000 COINS";
        mainUpgrade_firstSentenseChar = "GET IT FOR 39^99USD";
        mainUpgrade_secondSentenseChar = "<0^99USD FOR 20_000 COINS>";
        mainUpgrade_thirdSentenseChar = "";
        mainUpgrade_forthSentenseChar = "";
    }*/
    if(recentBuyCoinIdx == 5){
        mainUpgrade_itemNameChar = "FREE OF CHARGE";
        
        mainUpgrade_firstSentenseChar = "GET IT FOR 7^99USD";
        mainUpgrade_secondSentenseChar = "REMOVE TURTLE COIN COST";
        mainUpgrade_thirdSentenseChar = "ON ALL SINGLE USE ITEMS";
        mainUpgrade_forthSentenseChar = "";
        
        [s_chosenIcon[35] setPosition:ccp(chosenIconPosX + iPhone5OffsetX,chosenIconPosY)];
    }
    
    if(recentBuyCoinIdx == 6){
        mainUpgrade_itemNameChar = "RATE FOR THE GAME";
        mainUpgrade_firstSentenseChar = "IF YOU LIKE THIS GAME";
        mainUpgrade_secondSentenseChar = "PLEAE RATE AND";
        mainUpgrade_thirdSentenseChar = "FREE COINS WILL BE AWARDED";
        mainUpgrade_forthSentenseChar = "FOR RATING 5 STARS";
        
        [s_chosenIcon[36] setPosition:ccp(chosenIconPosX + iPhone5OffsetX,chosenIconPosY)];
    }
    
    if(recentBuyCoinIdx == 7){
        mainUpgrade_itemNameChar = "FREE COINS";
        mainUpgrade_firstSentenseChar = "GET FREE COINS HERE";
        mainUpgrade_secondSentenseChar = "";
        mainUpgrade_thirdSentenseChar = "";
        mainUpgrade_forthSentenseChar = "";
        
        [s_chosenIcon[37] setPosition:ccp(chosenIconPosX + iPhone5OffsetX,chosenIconPosY)];
    }

      
    
    fontTexture_numInRow = 10;
    fontTexture_offsetX = 12;
    fontTexture_offsetY = 14;
    sentense01_AccumOffset = 0;
    setense01_offsetX = 10;
    
    sentense01_AccumOffset = 0;
    
    if(isIpad){
        fontTexture_offsetX *= 2;
        fontTexture_offsetY *= 2;
        setense01_offsetX *= 2;
    }
    
    [self setFirstSentense];
    
    sentense01_AccumOffset = 0;
    [self setSecondSentense];
    
    sentense01_AccumOffset = 0;
    [self setThirdSentense];
    
    sentense01_AccumOffset = 0;
    [self setForthSentense];
    
    sentense01_AccumOffset = 0;
    [self setItemNameSentense];
    
    
    [l_chosenLevel setPosition:ccp(22500, 254)];
    [l_chosenMaxLevel setPosition:ccp(380000, 280)];
    
    
    
    if(recentBuyCoinIdx == 7){
        [mBuy setPosition:ccp(10000, -8)];
        [mRateMe setPosition:ccp(10000, -8)];
        [mGetFree setPosition:ccp(0, -8)];
         [s_turtleCoinDisplay setPosition:ccp(37005,269)];
    }else if(recentBuyCoinIdx == 6){
        [mBuy setPosition:ccp(100000, -8)];
        if(!hasRatedBefore){
            [mRateMe setPosition:ccp(0, -8)];
        }  
        [mGetFree setPosition:ccp(10000, -8)];
         [s_turtleCoinDisplay setPosition:ccp(37005,269)];
    }else{
        [mBuy setPosition:ccp(0, -8)];
        [mRateMe setPosition:ccp(10000, -8)];
        [mGetFree setPosition:ccp(10000, -8)];
         [s_turtleCoinDisplay setPosition:ccp(375000,269)];
    }

}

-(void) updateSelectedDisplayONSUpgrade{
    [self resetChosen];
    [self updateTurtleCoinsDisplay];
    
    itemNamePosX = 162;
    itemNamePosY = 271;
    
    if(isIphone5){
        itemNamePosX += 44;
    }
    
    [self updateChosePriceValues];
    
    
    sentense01posX = [UIScreen mainScreen].bounds.size.height/2;
    sentense02posX = [UIScreen mainScreen].bounds.size.height/2;
    sentense03posX = [UIScreen mainScreen].bounds.size.height/2;
    sentense04posX = [UIScreen mainScreen].bounds.size.height/2;
    sentense01posY = 226;
    sentense02posY = 209;
    sentense03posY = 194;
    sentense04posY = 179;
    
    if(isIpad){
        itemNamePosX *= 1024.0/480.0;
        itemNamePosY *= 768.0/320.0;
        
        itemNamePosY -= 25;
        
        sentense01posY *= 768.0/320.0;
        sentense02posY *= 768.0/320.0;
        sentense03posY *= 768.0/320.0;
        sentense04posY *= 768.0/320.0;
    }
    
    int iPhone5OffsetX;
    if(isIphone5){
        iPhone5OffsetX = 44;
    }else{
        iPhone5OffsetX = 0;
    }
    
    
    if(recentONSUpgradeIdx == kONSUpgradeItem_Fuel20){
       // mainUpgrade_itemNameChar = "50[ FUEL";
        mainUpgrade_itemNameChar = "SINGLE USE ITEM";
        mainUpgrade_firstSentenseChar = "<ACTIVATE TO USE FOR NEXT ROUND>";
        mainUpgrade_secondSentenseChar = "";
        mainUpgrade_thirdSentenseChar = "INCREASE FUEL AMOUNT BY 20 UNITS";
        mainUpgrade_forthSentenseChar = "";
        
        [s_chosenIcon[22] setPosition:ccp(chosenIconPosX + iPhone5OffsetX,chosenIconPosY)];
    }
    if(recentONSUpgradeIdx == kONSUpgradeItem_Fuel50){
       // mainUpgrade_itemNameChar = "50[ FUEL";
        mainUpgrade_itemNameChar = "SINGLE USE ITEM";
        mainUpgrade_firstSentenseChar = "<ACTIVATE TO USE FOR NEXT ROUND>";
        mainUpgrade_secondSentenseChar = "";
        mainUpgrade_thirdSentenseChar = "INCREASE FUEL AMOUNT BY 50 UNITS";
        mainUpgrade_forthSentenseChar = "";
        
        [s_chosenIcon[23] setPosition:ccp(chosenIconPosX + iPhone5OffsetX,chosenIconPosY)];
    }
    if(recentONSUpgradeIdx == kONSUpgradeItem_Fuel100){
       // mainUpgrade_itemNameChar = "100[ FUEL";
       mainUpgrade_itemNameChar = "SINGLE USE ITEM";
        mainUpgrade_firstSentenseChar = "<ACTIVATE TO USE FOR NEXT ROUND>";
       mainUpgrade_secondSentenseChar = "";
        mainUpgrade_thirdSentenseChar = "INCREASE FUEL AMOUNT BY 100 UNITS";
        mainUpgrade_forthSentenseChar = "";
        
        [s_chosenIcon[24] setPosition:ccp(chosenIconPosX + iPhone5OffsetX,chosenIconPosY)];
    }
    if(recentONSUpgradeIdx == kONSUpgradeItem_DoubleYellow){
       // mainUpgrade_itemNameChar = "2X YELLOW BLAZE";
        mainUpgrade_itemNameChar = "SINGLE USE ITEM";
        mainUpgrade_firstSentenseChar = "<ACTIVATE TO USE FOR NEXT ROUND>";
        mainUpgrade_secondSentenseChar = "";
        mainUpgrade_thirdSentenseChar = "DOUBLE THE AMOUNT FOR YELLOW BLAZE";
        mainUpgrade_forthSentenseChar = "";
        
        [s_chosenIcon[25] setPosition:ccp(chosenIconPosX + iPhone5OffsetX,chosenIconPosY)];
    }
    if(recentONSUpgradeIdx == kONSUpgradeItem_InitBoost){
       // mainUpgrade_itemNameChar = "SUPER INITIAL BOOST";
        mainUpgrade_itemNameChar = "SINGLE USE ITEM";
        mainUpgrade_firstSentenseChar = "<ACTIVATE TO USE FOR NEXT ROUND>";
        mainUpgrade_secondSentenseChar = "100[ CRAZY BOOST";
        mainUpgrade_thirdSentenseChar = "DOUBLE THE POWER ACCORDING";
        mainUpgrade_forthSentenseChar = "TO CANNON LEVEL";
        
        [s_chosenIcon[26] setPosition:ccp(chosenIconPosX + iPhone5OffsetX,chosenIconPosY)];
    }
    if(recentONSUpgradeIdx == kONSUpgradeItem_SpinSlow){
       // mainUpgrade_itemNameChar = "SLOW SPINNING";
        mainUpgrade_itemNameChar = "SINGLE USE ITEM";
        mainUpgrade_firstSentenseChar = "<ACTIVATE TO USE FOR NEXT ROUND>";
       mainUpgrade_secondSentenseChar = "";
        mainUpgrade_thirdSentenseChar = "SLOW 50[ FOR THE SPINNING";
        mainUpgrade_forthSentenseChar = "HIGHER CHANCE FOR PERFECT LAUNCHing";
        
        [s_chosenIcon[27] setPosition:ccp(chosenIconPosX + iPhone5OffsetX,chosenIconPosY)];
    }
  /*  if(recentONSUpgradeIdx == kONSUpgradeItem_SpinDifficult){
        mainUpgrade_itemNameChar = "CHALLENGE SPINNING";
        mainUpgrade_firstSentenseChar = "<SINGLE USE ITEM>";
        mainUpgrade_secondSentenseChar = "<CAN ONLY BE USED FOR ONE ROUND>";
        mainUpgrade_thirdSentenseChar = "INCREASE THE DIFFICULTY BUT";
        mainUpgrade_forthSentenseChar = "1>5 TIMES POWER WHEN PERFECT LAUNCH";
    }*/
    if(recentONSUpgradeIdx == kONSUpgradeItem_BreakLess){
       // mainUpgrade_itemNameChar = "BREAK DOWN";
       mainUpgrade_itemNameChar = "SINGLE USE ITEM";
        mainUpgrade_firstSentenseChar = "<ACTIVATE TO USE FOR NEXT ROUND>";
        mainUpgrade_secondSentenseChar = "";
        mainUpgrade_thirdSentenseChar = "NEED 5M]S LESSER SPEED TO";
        mainUpgrade_forthSentenseChar = "DESTROY ANY OBSTACLES";
        
        [s_chosenIcon[28] setPosition:ccp(chosenIconPosX + iPhone5OffsetX,chosenIconPosY)];
    }
    if(recentONSUpgradeIdx == kONSUpgradeItem_Magnetic){
        //mainUpgrade_itemNameChar = "MAGNETIC";
        mainUpgrade_itemNameChar = "SINGLE USE ITEM";
        mainUpgrade_firstSentenseChar = "<ACTIVATE TO USE FOR NEXT ROUND>";
       mainUpgrade_secondSentenseChar = "";
        mainUpgrade_thirdSentenseChar = "PULL DIAMONDS TOWARDS THE TURTLE";
        mainUpgrade_forthSentenseChar = "";
        
        [s_chosenIcon[29] setPosition:ccp(chosenIconPosX + iPhone5OffsetX,chosenIconPosY)];
    }
    
   /* if(recentONSUpgradeIdx == howmnayONSUpgrade - 1){
        mainUpgrade_itemNameChar = "RATE FOR THE GAME";
        mainUpgrade_firstSentenseChar = "IF YOU LIKE THIS GAME";
        mainUpgrade_secondSentenseChar = "PLEAE RATE AND";
        mainUpgrade_thirdSentenseChar = "FREE COINS WILL BE AWARDED";
        mainUpgrade_forthSentenseChar = "FOR RATING 5 STARS";
    }*/

    
    isONSEnable = onsUpgradeItemIsEnable[recentONSUpgradeIdx];
    
    if(onsUpgradeItemLevel[recentONSUpgradeIdx] == 0){
        [mBuy setPosition:ccp(0,-8)];
        
    }else{
        [mBuy setPosition:ccp(101,-8)];
        
        if(isONSEnable){
            [mONSIsEnable setPosition:ccp(-98,-8)];
            [mONSIsDisable setPosition:ccp(10000,11000)];
        }else{
            [mONSIsEnable setPosition:ccp(10000,11000)];
            [mONSIsDisable setPosition:ccp(-98,-8)];
        }
    }
    

    
    fontTexture_numInRow = 10;
    fontTexture_offsetX = 12;
    fontTexture_offsetY = 14;
    
    sentense01_AccumOffset = 0;
    setense01_offsetX = 10;
    
    if(isIpad){
        fontTexture_offsetX *= 2;
        fontTexture_offsetY *= 2;
        setense01_offsetX *= 2;
    }
    
    [self setFirstSentense];
    
    sentense01_AccumOffset = 0;
    [self setSecondSentense];
    
    sentense01_AccumOffset = 0;
    [self setThirdSentense];
    
    sentense01_AccumOffset = 0;
    [self setForthSentense];
    
    
    sentense01_AccumOffset = 0;
    [self setItemNameSentense];
   
    
    static int numberChosen;
    numberChosen = onsUpgradeItemLevel[recentONSUpgradeIdx];
    //[l_chosenLevel setTextureRect:CGRectMake(fontTexture_offsetX* numberChosen , 0, fontTexture_offsetX, fontTexture_offsetY)];
    printf("numberChosen:%i\n",numberChosen);
    [l_chosenLevel setString:[NSString stringWithFormat:@"%i", numberChosen]];
    [l_chosenLevel setPosition:ccp(225, 254)];
    
    if(isIphone5){
        [l_chosenLevel setPosition:ccp(l_chosenLevel.position.x + 44, l_chosenLevel.position.y)];
    }
    
    if(isIpad){
        [l_chosenLevel setPosition:ccp(l_chosenLevel.position.x * 1024.0/480.0, l_chosenLevel.position.y * 768.0/320.0 - 25)];
    }
    
    [l_chosenMaxLevel setPosition:ccp(380000, 280)];
   
}

-(void) updateSelectedDisplay{
    [self resetChosen];
    [self updateTurtleCoinsDisplay];
    
    itemNamePosX = 162;
    itemNamePosY = 271;
    
    [self updateChosePriceValues];
    

    sentense01posX = [UIScreen mainScreen].bounds.size.height/2;
    sentense02posX = [UIScreen mainScreen].bounds.size.height/2;
    sentense03posX = [UIScreen mainScreen].bounds.size.height/2;
    sentense04posX = [UIScreen mainScreen].bounds.size.height/2;
    sentense01posY = 226;
    sentense02posY = 209;
    sentense03posY = 194;
    sentense04posY = 179;
    
    if(isIpad){
        itemNamePosX *= 1024.0/480.0;
        itemNamePosY *= 768.0/320.0;
        
        itemNamePosY -= 25;
        
        sentense01posY *= 768.0/320.0;
        sentense02posY *= 768.0/320.0;
        sentense03posY *= 768.0/320.0;
        sentense04posY *= 768.0/320.0;
    }
    
    if(isIphone5){
        itemNamePosX += 44;
    }
    
    
    //if(!isFreeChargesOnONS){
        missionLeftToDisplay = missionsNeedForThis[updgradeItem[recentUpgradeIdx]->itemIdx][updgradeItem[recentUpgradeIdx]->level] - missionCompleted;
        
        if(hasFinishedThisAchivements[missionsNeedForThis[updgradeItem[recentUpgradeIdx]->itemIdx][updgradeItem[recentUpgradeIdx]->level]]){
            missionLeftToDisplay = -1;
        }else{
            missionLeftToDisplay = missionsNeedForThis[updgradeItem[recentUpgradeIdx]->itemIdx][updgradeItem[recentUpgradeIdx]->level] + 1;
        }
        
         NSString *key = [NSString stringWithFormat:@"achivement_hasUnblockForMain_%02d", missionsNeedForThis[updgradeItem[recentUpgradeIdx]->itemIdx][updgradeItem[recentUpgradeIdx]->level] - 1];
        printf("updateSelectedDisplay:%i %i\n",missionLeftToDisplay, missionsNeedForThis[updgradeItem[recentUpgradeIdx]->itemIdx][updgradeItem[recentUpgradeIdx]->level] - 1);
      //  NSLog(key);
        static bool continueFuck;
        continueFuck =  [[NSUserDefaults standardUserDefaults] boolForKey:key];
        if(!continueFuck){
            printf("!!!!!! continueFuck\n");
        }
        
        if(missionLeftToDisplay > 0 && !continueFuck){
            [mBuy setPosition:ccp(100000,10000)];
            [mMissionLeft setPosition:ccp(0,-8)];
            [l_missionLeftForBtn setString:[NSString stringWithFormat:@"%i", missionLeftToDisplay]];
            [l_missionLeftForBtn setPosition:ccp(mMissionLeft.position.x + 52 + [UIScreen mainScreen].bounds.size.height/2, mMissionLeft.position.y +0 + [UIScreen mainScreen].bounds.size.width/2)];
            
            if(isIphone5){
                [l_missionLeftForBtn setPosition:ccp(l_missionLeftForBtn.position.x + 44, l_missionLeftForBtn.position.y)];
            }
            
            if(isIpad){
                [l_missionLeftForBtn setPosition:ccp(mMissionLeft.position.x + 104 + [UIScreen mainScreen].bounds.size.height/2, mMissionLeft.position.y +0 + [UIScreen mainScreen].bounds.size.width/2)];
            }
            
        }else{
            
            //ADD NEW
            if(recentUpgradeIdx >= 14 && updgradeItem[recentUpgradeIdx]->level >= 1){
                isONSEnable = permenanatUpgradeItemIsEnable[recentUpgradeIdx - 14];
                
                [mBuy setPosition:ccp(101,-8)];
                
                if(isONSEnable){
                    [mONSIsEnable setPosition:ccp(-0,-8)];
                    [mONSIsDisable setPosition:ccp(10000,11000)];
                }else{
                    [mONSIsEnable setPosition:ccp(10000,11000)];
                    [mONSIsDisable setPosition:ccp(0,-8)];
                }
                
                
            }
                
            
        }
   // }
    
    
    if(updgradeItem[recentUpgradeIdx]->level == updgradeItem[recentUpgradeIdx]->maxLevel){
        [mBuy setPosition:ccp(100000,10000)];
    }
    
    int iPhone5OffsetX;
    if(isIphone5){
        iPhone5OffsetX = 44;
    }else{
        iPhone5OffsetX = 0;
    }
    
    if(updgradeItem[recentUpgradeIdx]->itemIdx == kUpgradeItem_Glider){
        mainUpgrade_itemNameChar = "GLIDER";
      //  mainUpgrade_firstSentenseChar = "INCREASE IN FLIGHT CAPABILITY";
      //  mainUpgrade_secondSentenseChar = "KEEP LONGER FOR FLYING STRAIGHT";
        
        mainUpgrade_firstSentenseChar = "KEEP FLYING STRAIGHT";
        mainUpgrade_secondSentenseChar = "FOR A LONGER TIME";
        mainUpgrade_thirdSentenseChar = "";
        mainUpgrade_forthSentenseChar = "";
        
        [s_chosenIcon[0] setPosition:ccp(chosenIconPosX + iPhone5OffsetX,chosenIconPosY)];
    }

    
    if(updgradeItem[recentUpgradeIdx]->itemIdx == kUpgradeItem_Rocket){
        mainUpgrade_itemNameChar = "ROCKET";
        mainUpgrade_firstSentenseChar = "FLY HIGHER MUCH EASIER";
        mainUpgrade_secondSentenseChar = "INCREASE THE MAXIMUM SPEED";
        mainUpgrade_thirdSentenseChar = "INCREASE THE ACCELERATION";
        mainUpgrade_forthSentenseChar = "";
        
        [s_chosenIcon[1] setPosition:ccp(chosenIconPosX + iPhone5OffsetX,chosenIconPosY)];
    }
    
    if(updgradeItem[recentUpgradeIdx]->itemIdx == kUpgradeItem_Rocket){
        mainUpgrade_itemNameChar = "ROCKET";
        mainUpgrade_firstSentenseChar = "TAP ANYWHERE ON THE SCREEN";
        mainUpgrade_secondSentenseChar = "TO SHOOT A BALL";
        mainUpgrade_thirdSentenseChar = "INCREASE THE ACCELERATION";
        mainUpgrade_forthSentenseChar = "";
        
        [s_chosenIcon[1] setPosition:ccp(chosenIconPosX + iPhone5OffsetX,chosenIconPosY)];
    }

    if(updgradeItem[recentUpgradeIdx]->itemIdx == kUpgradeItem_Cannon){
        mainUpgrade_itemNameChar = "CANNON";
        mainUpgrade_firstSentenseChar = "STRONG POWER TO SHOOT TURTLE";
        mainUpgrade_secondSentenseChar = "PANTS ON FIRE ON LEVEL 4 CANNON";
        mainUpgrade_thirdSentenseChar = "WHEN PERFECT LAUNCH";
        mainUpgrade_forthSentenseChar = "";
        
        [s_chosenIcon[2] setPosition:ccp(chosenIconPosX + iPhone5OffsetX,chosenIconPosY)];
    }
    
    if(updgradeItem[recentUpgradeIdx]->itemIdx == kUpgradeItem_Helmet){
        mainUpgrade_itemNameChar = "HELMET";
        mainUpgrade_firstSentenseChar = "NEED MUCH LESS SPEED TO";
        mainUpgrade_secondSentenseChar = " DESTROY OBSTACLES";
        mainUpgrade_thirdSentenseChar = "";
        mainUpgrade_forthSentenseChar = "";
        
        [s_chosenIcon[3] setPosition:ccp(chosenIconPosX + iPhone5OffsetX,chosenIconPosY)];
    }
    
    if(updgradeItem[recentUpgradeIdx]->itemIdx == kUpgradeItem_ExtraYellow){
        mainUpgrade_itemNameChar = "YELLOW BLAZE";
        mainUpgrade_firstSentenseChar = "INCREASE THE AMOUNT OF TIMES";
        mainUpgrade_secondSentenseChar = "FOR USING YELLOW BLAZE";
        mainUpgrade_thirdSentenseChar = "YELLOW BLAZE WILL BE GENERATED";
        mainUpgrade_forthSentenseChar = "AUTOMATICALLY WHEN HITTING PENGUIN";
        
        [s_chosenIcon[4] setPosition:ccp(chosenIconPosX + iPhone5OffsetX,chosenIconPosY)];
    }
    
    
    if(updgradeItem[recentUpgradeIdx]->itemIdx == kUpgradeItem_FuelAmout){
        mainUpgrade_itemNameChar = "FUEL AMOUNT";
        mainUpgrade_firstSentenseChar = "INCREASE FUEL AMOUNT BY 10 UNITS";
        mainUpgrade_secondSentenseChar = "";
        mainUpgrade_thirdSentenseChar = "";
        mainUpgrade_forthSentenseChar = "";
        
        [s_chosenIcon[5] setPosition:ccp(chosenIconPosX + iPhone5OffsetX,chosenIconPosY)];
    }
    
    
    if(updgradeItem[recentUpgradeIdx]->itemIdx == kUpgradeItem_FuelConsumption){
        mainUpgrade_itemNameChar = "FUEL CONSUMPTION";
        mainUpgrade_firstSentenseChar = "REDUCE THE CONSUMPTION";
        mainUpgrade_secondSentenseChar = "FOR USING FUEL";
        mainUpgrade_thirdSentenseChar = "";
        mainUpgrade_forthSentenseChar = "";
        
        [s_chosenIcon[6] setPosition:ccp(chosenIconPosX + iPhone5OffsetX,chosenIconPosY)];
    }
    
    if(updgradeItem[recentUpgradeIdx]->itemIdx == kUpgradeItem_MoneyDensity){
        mainUpgrade_itemNameChar = "COINS DENSITY";
        mainUpgrade_firstSentenseChar = "INCREASE THE DENSITY OF COINS";
        mainUpgrade_secondSentenseChar = "IN THE AIR";
        mainUpgrade_thirdSentenseChar = "";
        mainUpgrade_forthSentenseChar = "";
        
        [s_chosenIcon[7] setPosition:ccp(chosenIconPosX + iPhone5OffsetX,chosenIconPosY)];
    }
    

    
    if(updgradeItem[recentUpgradeIdx]->itemIdx == kUpgradeItem_MaxSpeed){
        mainUpgrade_itemNameChar = "MAX SPEED";
        mainUpgrade_firstSentenseChar = "SLIGHTLY INCRESAE THE MAXIMUM SPEED";
        mainUpgrade_secondSentenseChar = "";
        mainUpgrade_thirdSentenseChar = "";
        mainUpgrade_forthSentenseChar = "";
        
        [s_chosenIcon[8] setPosition:ccp(chosenIconPosX + iPhone5OffsetX,chosenIconPosY)];
    }
    if(updgradeItem[recentUpgradeIdx]->itemIdx == kUpgradeItem_Acceleration){
        mainUpgrade_itemNameChar = "ACCELERATION";
        mainUpgrade_firstSentenseChar = "ACCELERATE A LITTLE BIT FASTER";
        mainUpgrade_secondSentenseChar = "";
        mainUpgrade_thirdSentenseChar = "";
        mainUpgrade_forthSentenseChar = "";
        
        [s_chosenIcon[9] setPosition:ccp(chosenIconPosX + iPhone5OffsetX,chosenIconPosY)];
    }
    if(updgradeItem[recentUpgradeIdx]->itemIdx == kUpgradeItem_LongerYellow){
        mainUpgrade_itemNameChar = "PERIOD FOR BLAZE";
        mainUpgrade_firstSentenseChar = "LONGER PERIOD FOR YELLOW BLAZE";
        mainUpgrade_secondSentenseChar = "";
        mainUpgrade_thirdSentenseChar = "";
        mainUpgrade_forthSentenseChar = "";
        
        [s_chosenIcon[10] setPosition:ccp(chosenIconPosX + iPhone5OffsetX,chosenIconPosY)];
    }
    if(updgradeItem[recentUpgradeIdx]->itemIdx == kUpgradeItem_AirResistance){
        mainUpgrade_itemNameChar = "AIR RESISTANCE";
        mainUpgrade_firstSentenseChar = "SLIGHTLY REDUCE THE";
        mainUpgrade_secondSentenseChar = "AIR RESISTANCE ACT ON THE GLIDER";
        mainUpgrade_thirdSentenseChar = "KEEP FLY STRAIGHT";
        mainUpgrade_forthSentenseChar = "FOR A LITTLE BIT LONGER";
        
        [s_chosenIcon[11] setPosition:ccp(chosenIconPosX + iPhone5OffsetX,chosenIconPosY)];
    }
    if(updgradeItem[recentUpgradeIdx]->itemIdx == kUpgradeItem_FasterInvincible){
        mainUpgrade_itemNameChar = "POF";
        mainUpgrade_firstSentenseChar = "PANTS ON FIRE";
        mainUpgrade_secondSentenseChar = "PROGRESS FASTER ON POF BAR";
        mainUpgrade_thirdSentenseChar = "BY TIME AND BY HITTING PENGUIN";
        mainUpgrade_forthSentenseChar = "";
        
        [s_chosenIcon[12] setPosition:ccp(chosenIconPosX + iPhone5OffsetX,chosenIconPosY)];
    }
    if(updgradeItem[recentUpgradeIdx]->itemIdx == kUpgradeItem_MoneyRatio){
        mainUpgrade_itemNameChar = "EXCHANGE RATE";
        mainUpgrade_firstSentenseChar = "DOUBLE THE AMOUNT";
        mainUpgrade_secondSentenseChar = "THE COINS YOU COLLECTED";
        mainUpgrade_thirdSentenseChar = "IN A SINGLE RUN";
        mainUpgrade_forthSentenseChar = "";
        
        [s_chosenIcon[13] setPosition:ccp(chosenIconPosX + iPhone5OffsetX,chosenIconPosY)];
    }
    
    if(updgradeItem[recentUpgradeIdx]->itemIdx == kUpgradeItem_Permenant_Fuel1){
        mainUpgrade_itemNameChar = "PERMANENT UPGRADE";
        mainUpgrade_firstSentenseChar = "PERMANENTLY INCREASE";
        mainUpgrade_secondSentenseChar = "THE FUEL AMOUNT BY 25 UNITS";
        mainUpgrade_thirdSentenseChar = "";
        mainUpgrade_forthSentenseChar = "";
        
        [s_chosenIcon[14] setPosition:ccp(chosenIconPosX + iPhone5OffsetX,chosenIconPosY)];
    }
    if(updgradeItem[recentUpgradeIdx]->itemIdx == kUpgradeItem_Permenant_Fuel2){
        mainUpgrade_itemNameChar = "PERMANENT UPGRADE";
        mainUpgrade_firstSentenseChar = "PERMANENTLY INCREASE";
        mainUpgrade_secondSentenseChar = "THE FUEL AMOUNT BY 25 UNITS";
        mainUpgrade_thirdSentenseChar = "";
        mainUpgrade_forthSentenseChar = "";
        
        [s_chosenIcon[15] setPosition:ccp(chosenIconPosX + iPhone5OffsetX,chosenIconPosY)];
    }
    if(updgradeItem[recentUpgradeIdx]->itemIdx == kUpgradeItem_Permenant_PerfectLaunch){
        mainUpgrade_itemNameChar = "PERMANENT UPGRADE";
        mainUpgrade_firstSentenseChar = "PERMANENTLY 100[ CHANCE";
        mainUpgrade_secondSentenseChar = "FOR PERFECT LAUNCH";
        mainUpgrade_thirdSentenseChar = "";
        mainUpgrade_forthSentenseChar = "";
        
        [s_chosenIcon[16] setPosition:ccp(chosenIconPosX + iPhone5OffsetX,chosenIconPosY)];
    }
    if(updgradeItem[recentUpgradeIdx]->itemIdx == kUpgradeItem_Permenant_Magnetic1){
        mainUpgrade_itemNameChar = "PERMANENT UPGRADE";
        mainUpgrade_firstSentenseChar = "PERMANENTLY PROVIDE A MAGNET";
        mainUpgrade_secondSentenseChar = "TO ATTRACT DIAMONDS";
        mainUpgrade_thirdSentenseChar = "IF YOU HAVE A MAGNET ALREADY";
        mainUpgrade_forthSentenseChar = "IT WILL INCREASE 60[ MAGNETIC POWER";
        
        [s_chosenIcon[17] setPosition:ccp(chosenIconPosX + iPhone5OffsetX,chosenIconPosY)];
    }
    if(updgradeItem[recentUpgradeIdx]->itemIdx == kUpgradeItem_Permenant_Magnetic2){
        mainUpgrade_itemNameChar = "PERMANENT UPGRADE";
        mainUpgrade_firstSentenseChar = "PERMANENTLY PROVIDE A MAGNET";
        mainUpgrade_secondSentenseChar = "TO ATTRACT DIAMONDS";
        mainUpgrade_thirdSentenseChar = "IF YOU HAVE A MAGNET ALREADY";
        mainUpgrade_forthSentenseChar = "IT WILL INCREASE 60[ MAGNETIC POWER";
        
        [s_chosenIcon[18] setPosition:ccp(chosenIconPosX + iPhone5OffsetX,chosenIconPosY)];
    }
    if(updgradeItem[recentUpgradeIdx]->itemIdx == kUpgradeItem_Permenant_BreakLess){
        mainUpgrade_itemNameChar = "PERMANENT UPGRADE";
        mainUpgrade_firstSentenseChar = "PERMANENTLY WEAKEN THE STRENGTH";
        mainUpgrade_secondSentenseChar = "OF OBSTICLES";
        mainUpgrade_thirdSentenseChar = "NEED 5 MPH LESS";
        mainUpgrade_forthSentenseChar = "TO BREAK THE OBSTICLES";
        
        [s_chosenIcon[19] setPosition:ccp(chosenIconPosX + iPhone5OffsetX,chosenIconPosY)];
    }
    if(updgradeItem[recentUpgradeIdx]->itemIdx == kUpgradeItem_Permenant_ExtraYellow){
        mainUpgrade_itemNameChar = "PERMANENT UPGRADE";
        mainUpgrade_firstSentenseChar = "PERMANENTLY DOUBLE THE AMOUNT";
        mainUpgrade_secondSentenseChar = "OF YELLOW BLAZE YOU OWNED";
        mainUpgrade_thirdSentenseChar = "";
        mainUpgrade_forthSentenseChar = "";
        
        [s_chosenIcon[20] setPosition:ccp(chosenIconPosX + iPhone5OffsetX,chosenIconPosY)];
    }
    if(updgradeItem[recentUpgradeIdx]->itemIdx == kUpgradeItem_Permenant_MoneyRatio){
        mainUpgrade_itemNameChar = "PERMANENT UPGRADE";
        mainUpgrade_firstSentenseChar = "PERMANENTLY INCREASE 100[ THE AMOUNT";
        mainUpgrade_secondSentenseChar = "YOU EARNED FROM DIAMONDS COLLECTED";
        mainUpgrade_thirdSentenseChar = "DURING THE FLIGHT";
        mainUpgrade_forthSentenseChar = "";
        
        [s_chosenIcon[21] setPosition:ccp(chosenIconPosX + iPhone5OffsetX,chosenIconPosY)];
    }
    
  fontTexture_numInRow = 10;
    fontTexture_offsetX = 12;
    fontTexture_offsetY = 14;

    sentense01_AccumOffset = 0;
    setense01_offsetX = 10;
    
    if(isIpad){
        fontTexture_offsetX *= 2;
        fontTexture_offsetY *= 2;
        setense01_offsetX *= 2;
    }
    
    [self setFirstSentense];
    
    sentense01_AccumOffset = 0;
    [self setSecondSentense];
    
    sentense01_AccumOffset = 0;
    [self setThirdSentense];
    
    sentense01_AccumOffset = 0;
    [self setForthSentense];
    
    
    sentense01_AccumOffset = 0;
    [self setItemNameSentense];
    
    
    static int numberChosen;
    numberChosen = updgradeItem[recentUpgradeIdx]->level;
    //[l_chosenLevel setTextureRect:CGRectMake(fontTexture_offsetX* numberChosen , 0, fontTexture_offsetX, fontTexture_offsetY)];
    [l_chosenLevel setString:[NSString stringWithFormat:@"%i", numberChosen]];
    [l_chosenLevel setPosition:ccp(214, 256)];
    
    numberChosen = updgradeItem[recentUpgradeIdx]->maxLevel;
    [l_chosenMaxLevel setTextureRect:CGRectMake(fontTexture_offsetX* numberChosen , 0, fontTexture_offsetX, fontTexture_offsetY)];
    [l_chosenMaxLevel setPosition:ccp(232, 256)];
    
    if(isIpad){
        [l_chosenLevel setPosition:ccp(l_chosenLevel.position.x * 1024.0/480.0, l_chosenLevel.position.y * 768.0/320.0 - 25)];
        [l_chosenMaxLevel setPosition:ccp(l_chosenMaxLevel.position.x * 1024.0/480.0, l_chosenMaxLevel.position.y * 768.0/320.0 - 25)];
    }
    
    if(isIphone5){
        [l_chosenMaxLevel setPosition:ccp(l_chosenMaxLevel.position.x + 44, l_chosenMaxLevel.position.y)];
        [l_chosenLevel setPosition:ccp(l_chosenLevel.position.x + 44, l_chosenLevel.position.y)];
    }
    
}

-(void) updateChosePriceValues{
    setense01_offsetX = 11;
    
    if(pageIdx == 3){
        if(onsUpgrade_price[recentONSUpgradeIdx] <= 9){
            priceStringPosX = 328;
            priceStringPosY = 257;
            chosenPriceScale = 1.0;
        }else if(onsUpgrade_price[recentONSUpgradeIdx] <= 99){
            priceStringPosX = 324;
            priceStringPosY = 258;
            chosenPriceScale = 0.9;
            setense01_offsetX = 14;
        }else if(onsUpgrade_price[recentONSUpgradeIdx] <= 999){
            priceStringPosX = 319;
            priceStringPosY = 261;
            chosenPriceScale = 0.77;
            setense01_offsetX = 12;
        }else if(onsUpgrade_price[recentONSUpgradeIdx] <= 9999){
            priceStringPosX = 308;
            priceStringPosY = 262;
            chosenPriceScale = 0.75;
            setense01_offsetX = 11;
        }else if(onsUpgrade_price[recentONSUpgradeIdx] <= 99999){
            priceStringPosX = 300;
            priceStringPosY = 263;
            chosenPriceScale = 0.69;
            setense01_offsetX = 10;
        }
    }else{
        if(updgradeItem[recentUpgradeIdx]->price == 0){
            priceStringPosX = 337;
            priceStringPosY = 257;
            chosenPriceScale = 1.0;
        }else if(updgradeItem[recentUpgradeIdx]->price <= 9){
            priceStringPosX = 328;
            priceStringPosY = 257;
            chosenPriceScale = 1.0;
        }else if(updgradeItem[recentUpgradeIdx]->price <= 99){
            priceStringPosX = 324;
            priceStringPosY = 258;
            chosenPriceScale = 0.9;
            setense01_offsetX = 14;
        }else if(updgradeItem[recentUpgradeIdx]->price <= 999){
            priceStringPosX = 319;
            priceStringPosY = 261;
            chosenPriceScale = 0.77;
            setense01_offsetX = 12;
        }else if(updgradeItem[recentUpgradeIdx]->price <= 9999){
            priceStringPosX = 308;
            priceStringPosY = 262;
            chosenPriceScale = 0.75;
            setense01_offsetX = 11;
        }else if(updgradeItem[recentUpgradeIdx]->price <= 99999){
            priceStringPosX = 300;
            priceStringPosY = 263;
            chosenPriceScale = 0.69;
            setense01_offsetX = 10;
        }
    }
    
    if(isIphone5){
        priceStringPosX += 44;
    }
    
    if(isIpad){
        priceStringPosX *= 1024.0/480.0;
        priceStringPosY *= 768.0/320.0;
        
        setense01_offsetX*= 2;
    }
    
    [string_chosenPrice setString:@""];
    if(pageIdx == 3){
        [string_chosenPrice appendFormat:@"%i", onsUpgrade_price[recentONSUpgradeIdx]];
    }else{
        [string_chosenPrice appendFormat:@"%i", updgradeItem[recentUpgradeIdx]->price];
    }
    
    mainUpgrade_priceChar = [string_chosenPrice UTF8String];
    
    
    sentense01_AccumOffset = 0;
    for (int i=0; mainUpgrade_priceChar[i]; i++){
        startToFuckIdx = mainUpgrade_priceChar[i] - 48;
        
        if(startToFuckIdx < 0){
            startToFuckIdx = 64 - 48 - 6;
            sentense01_AccumOffset -= 4;
        }
        
        if(mainUpgrade_priceChar[i] == 73){
            sentense01_AccumOffset -= 4;
        }
        
        
        fontTexture_chosenCol = -1;
        do{
            
            fontTexture_chosenRow = startToFuckIdx;
            fontTexture_chosenCol++;
            
            startToFuckIdx -= fontTexture_numInRow;
        }while(startToFuckIdx >= 0);
        
        //  printf("TTTiii:%i\n",i);
        
        if(isIpad){
            [l_chosenPrice[i] setTextureRect:CGRectMake(fontTexture_chosenRow * 34, fontTexture_chosenCol * 42, 34, 42)];
        }else{
            [l_chosenPrice[i] setTextureRect:CGRectMake(fontTexture_chosenRow * 17, fontTexture_chosenCol * 21, 17, 21)];
        }
        
        
        [l_chosenPrice[i] setPosition:ccp(sentense01_AccumOffset + priceStringPosX, priceStringPosY)];
        sentense01_AccumOffset += setense01_offsetX;
        
        [l_chosenPrice[i] setScale:chosenPriceScale];
    }
}

-(void) setFirstSentense{
    for (int i = 0; mainUpgrade_firstSentenseChar[i]; i++){
        startToFuckIdx = mainUpgrade_firstSentenseChar[i] - 48;
        
        if(startToFuckIdx < 0){
            startToFuckIdx = 64 - 48 - 6;
            sentense01_AccumOffset -= 4 * 2/textureRatioForFuckingIpad;
        }
        if(mainUpgrade_firstSentenseChar[i] == 73){
            sentense01_AccumOffset -= 4 * 2/textureRatioForFuckingIpad;
        }
        if(mainUpgrade_firstSentenseChar[i] == 94){
            sentense01_AccumOffset -= 6 * 2/textureRatioForFuckingIpad;
        }
        
        // fontTexture_chosenCol = fontTexture_howmanyCol + 1;
        fontTexture_chosenCol = -1;
        do{
            
            fontTexture_chosenRow = startToFuckIdx;
            fontTexture_chosenCol++;
            
            startToFuckIdx -= fontTexture_numInRow;
        }while(startToFuckIdx >= 0);
        
        // printf(":%i\n",sentense01_AccumOffset);
        
        //printf("setFirstSentense:%i %i %i %i %i\n",i,fontTexture_chosenRow,fontTexture_chosenCol,fontTexture_offsetX,fontTexture_offsetY);
       // printf("setFirstSentense2:%i %i\n",startToFuckIdx,sentense01_AccumOffset);
        
        [l_sentense01[i] setTextureRect:CGRectMake(fontTexture_chosenRow * fontTexture_offsetX, fontTexture_chosenCol * fontTexture_offsetY, fontTexture_offsetX, fontTexture_offsetY)];
        
        [l_sentense01[i] setPosition:ccp(sentense01_AccumOffset + sentense01posX, sentense01posY)];
        sentense01_AccumOffset += setense01_offsetX;
    }
    
    static int sentenseOffsetX;
    sentenseOffsetX = sentense01_AccumOffset/2;
    for (int i = 0; mainUpgrade_firstSentenseChar[i]; i++){
         [l_sentense01[i] setPosition:ccp(l_sentense01[i].position.x - sentenseOffsetX, l_sentense01[i].position.y)];
    }
    
}

-(void) setSecondSentense{
    for (int i=0; mainUpgrade_secondSentenseChar[i]; i++){
        startToFuckIdx = mainUpgrade_secondSentenseChar[i] - 48;
        
        if(startToFuckIdx < 0){
            startToFuckIdx = 64 - 48 - 6;
            sentense01_AccumOffset -= 4 * 2/textureRatioForFuckingIpad;
        }
        
        if(mainUpgrade_secondSentenseChar[i] == 73){
            sentense01_AccumOffset -= 4 * 2/textureRatioForFuckingIpad;
        }
        
        if(mainUpgrade_secondSentenseChar[i] == 94){
            sentense01_AccumOffset -= 6 * 2/textureRatioForFuckingIpad;
        }
        
        
        fontTexture_chosenCol = -1;
        do{
            
            fontTexture_chosenRow = startToFuckIdx;
            fontTexture_chosenCol++;
            
            startToFuckIdx -= fontTexture_numInRow;
        }while(startToFuckIdx >= 0);
        
        //  printf("TTTiii:%i\n",i);
        
        [l_sentense02[i] setTextureRect:CGRectMake(fontTexture_chosenRow * fontTexture_offsetX, fontTexture_chosenCol * fontTexture_offsetY, fontTexture_offsetX, fontTexture_offsetY)];
        
        [l_sentense02[i] setPosition:ccp(sentense01_AccumOffset + sentense02posX, sentense02posY)];
        sentense01_AccumOffset += setense01_offsetX;
    }
    
    static int sentenseOffsetX;
    sentenseOffsetX = sentense01_AccumOffset/2;
    for (int i = 0; mainUpgrade_secondSentenseChar[i]; i++){
        [l_sentense02[i] setPosition:ccp(l_sentense02[i].position.x - sentenseOffsetX, l_sentense02[i].position.y)];
    }
}

-(void) setThirdSentense{
    for (int i=0; mainUpgrade_thirdSentenseChar[i]; i++){
        startToFuckIdx = mainUpgrade_thirdSentenseChar[i] - 48;
        
        if(startToFuckIdx < 0){
            startToFuckIdx = 64 - 48 - 6;
            sentense01_AccumOffset -= 4 * 2/textureRatioForFuckingIpad;
        }
        
        if(mainUpgrade_thirdSentenseChar[i] == 73){
            sentense01_AccumOffset -= 4 * 2/textureRatioForFuckingIpad;
        }
        
        
        fontTexture_chosenCol = -1;
        do{
            
            fontTexture_chosenRow = startToFuckIdx;
            fontTexture_chosenCol++;
            
            startToFuckIdx -= fontTexture_numInRow;
        }while(startToFuckIdx >= 0);
        
        //  printf("TTTiii:%i\n",i);
        
        [l_sentense03[i] setTextureRect:CGRectMake(fontTexture_chosenRow * fontTexture_offsetX, fontTexture_chosenCol * fontTexture_offsetY, fontTexture_offsetX, fontTexture_offsetY)];
        
        [l_sentense03[i] setPosition:ccp(sentense01_AccumOffset + sentense03posX, sentense03posY)];
        sentense01_AccumOffset += setense01_offsetX;
    }
    
    static int sentenseOffsetX;
    sentenseOffsetX = sentense01_AccumOffset/2;
    for (int i = 0; mainUpgrade_thirdSentenseChar[i]; i++){
        [l_sentense03[i] setPosition:ccp(l_sentense03[i].position.x - sentenseOffsetX, l_sentense03[i].position.y)];
    }
}

-(void) setForthSentense{
    for (int i=0; mainUpgrade_forthSentenseChar[i]; i++){
        startToFuckIdx = mainUpgrade_forthSentenseChar[i] - 48;
        
        if(startToFuckIdx < 0){
            startToFuckIdx = 64 - 48 - 6;
            sentense01_AccumOffset -= 4 * 2/textureRatioForFuckingIpad;
        }
        
        if(mainUpgrade_forthSentenseChar[i] == 73){
            sentense01_AccumOffset -= 4 * 2/textureRatioForFuckingIpad;
        }
        
        
        fontTexture_chosenCol = -1;
        do{
            
            fontTexture_chosenRow = startToFuckIdx;
            fontTexture_chosenCol++;
            
            startToFuckIdx -= fontTexture_numInRow;
        }while(startToFuckIdx >= 0);
        
        //  printf("TTTiii:%i\n",i);
        
        [l_sentense04[i] setTextureRect:CGRectMake(fontTexture_chosenRow * fontTexture_offsetX, fontTexture_chosenCol * fontTexture_offsetY, fontTexture_offsetX, fontTexture_offsetY)];
        
        [l_sentense04[i] setPosition:ccp(sentense01_AccumOffset + sentense04posX, sentense04posY)];
        sentense01_AccumOffset += setense01_offsetX;
    }
    
    static int sentenseOffsetX;
    sentenseOffsetX = sentense01_AccumOffset/2;
    for (int i = 0; mainUpgrade_forthSentenseChar[i]; i++){
        [l_sentense04[i] setPosition:ccp(l_sentense04[i].position.x - sentenseOffsetX, l_sentense04[i].position.y)];
    }
}

-(void) setItemNameSentense{
    if(pageIdx == 5){
        setense01_offsetX = 11;
    }
    
    for (int i=0; mainUpgrade_itemNameChar[i]; i++){
        startToFuckIdx = mainUpgrade_itemNameChar[i] - 48;
        
        if(startToFuckIdx < 0){
            startToFuckIdx = 64 - 48 - 6;
            sentense01_AccumOffset -= 4 * 2/textureRatioForFuckingIpad;
        }
        
        if(mainUpgrade_itemNameChar[i] == 73){
            sentense01_AccumOffset -= 4 * 2/textureRatioForFuckingIpad;
        }
        if(mainUpgrade_itemNameChar[i] == 95){
            sentense01_AccumOffset -= 4 * 2/textureRatioForFuckingIpad;
        }
        
        fontTexture_chosenCol = -1;
        do{
            
            fontTexture_chosenRow = startToFuckIdx;
            fontTexture_chosenCol++;
            
            startToFuckIdx -= fontTexture_numInRow;
        }while(startToFuckIdx >= 0);
        
        //  printf("TTTiii:%i\n",i);
        
        [l_chosenItemName[i] setTextureRect:CGRectMake(fontTexture_chosenRow * fontTexture_offsetX, fontTexture_chosenCol * fontTexture_offsetY, fontTexture_offsetX, fontTexture_offsetY)];
        
        [l_chosenItemName[i] setPosition:ccp(sentense01_AccumOffset + itemNamePosX, itemNamePosY)];
        sentense01_AccumOffset += setense01_offsetX;
    }
}

- (void) dealloc
{
	printf("MainMissionScene Dealloc\n");
    [string_chosenPrice release];
    
    if(burstlyHasLoaded){
        AppController *appDelegate =(AppController*) [[UIApplication sharedApplication] delegate];
        [appDelegate removeBurstlyView];
    }
  
    
	[super dealloc];
}

-(void) buyIAP{
    printf("buyIAP:%i\n",recentBuyCoinIdx);
    
    if([AppController isInternetReachable]){
		[self addLoad];
		[self delayBuy];
	}else{
		[AppController showNoNetworkAlert];
	}
}

-(void) delayBuy{
	buyTimer = 0;
	[self schedule: @selector(buy:)];
	
}

-(void) buy:(ccTime) dt{
	if(buyTimer == 5){
		
		if(recentBuyCoinIdx == 0){
			[[MKStoreManager sharedManager] buFeatureCoin01];
		}
        if(recentBuyCoinIdx == 1){
			[[MKStoreManager sharedManager] buFeatureCoin02];
		}
        if(recentBuyCoinIdx == 2){
			[[MKStoreManager sharedManager] buFeatureCoin03];
		}
        if(recentBuyCoinIdx == 3){
			[[MKStoreManager sharedManager] buFeatureCoin04];
		}
        if(recentBuyCoinIdx == 4){
			[[MKStoreManager sharedManager] buFeatureCoin05];
		}
        if(recentBuyCoinIdx == 5){
			[[MKStoreManager sharedManager] buFeatureFreeons];
		}
        if(recentBuyCoinIdx == 6){
			
		}
	
		[self unschedule: @selector(buy:)];
	}
	buyTimer++;
}

//-(void) productPurchased:(NSString*) productIdentifier{
//	printf("productPurchased\n");
//    
//    if([productIdentifier isEqualToString:@"iap.TurtlesHuhIpad.Freeons"]){
//        isFreeChargesOnONS = true;
//        [[NSUserDefaults standardUserDefaults] setBool:true forKey:@"freeChargesOnONS"];
//        [self showFreeONSDialog];
//        
//        onsUpgrade_price[0] = 0;
//        onsUpgrade_price[1] = 0;
//        onsUpgrade_price[2] = 0;
//        onsUpgrade_price[3] = 0;
//        onsUpgrade_price[4] = 0;
//        onsUpgrade_price[5] = 0;
//        onsUpgrade_price[6] = 0;
//        onsUpgrade_price[7] = 0;
//        
//        //[self saveToDB];
//        [self updateSelectedDisplay];
//        [self showLevelShown];
//        
//		return;
//	}
//
//    
//	howmanyCoinsBought = 0;
//	if([productIdentifier isEqualToString:@"iap.TurtlesHuhIpad.Coins01"]){
//		howmanyCoinsBought = 2500;
//	}
//    if([productIdentifier isEqualToString:@"iap.TurtlesHuhIpad.Coins02"]){
//		howmanyCoinsBought = 12500;
//	}
//    if([productIdentifier isEqualToString:@"iap.TurtlesHuhIpad.Coins03"]){
//		howmanyCoinsBought = 40000;
//	}
//    if([productIdentifier isEqualToString:@"iap.TurtlesHuhIpad.Coins04"]){
//		howmanyCoinsBought = 200000;
//	}
//    if([productIdentifier isEqualToString:@"iap.TurtlesHuhIpad.Coins05"]){
//		howmanyCoinsBought = 999999;
//	}
//    if([productIdentifier isEqualToString:@"iap.TurtlesHuhIpad.Coins06"]){
//		howmanyCoinsBought = 1;
//	}
//	
//    totalPrice += howmanyCoinsBought;
//    [[NSUserDefaults standardUserDefaults] setInteger:totalPrice forKey:@"turtleCoin"];
// 
//	[self showSplashDialog];
//    [self updateBuyCoinPage];
//}

-(void) showFreeONSDialog{
    UIAlertView *alert = [[[UIAlertView alloc] init] autorelease];
	[alert setTitle:@""];
	[alert setMessage:@"You can now using any Single Use Items for FREE!"];
	[alert setDelegate:self];
	[alert addButtonWithTitle:@"OK"];
	alert.tag = 0;
	[alert show];
}

-(void) showSplashDialog{
	
	NSMutableString* msg;
	msg = [NSMutableString string];
	[msg setString:@"You've successfully purchased "];
	[msg appendFormat:@"%i", howmanyCoinsBought];
	[msg appendString:@" Turtle Coins. You now have "];
	[msg appendFormat:@"%i", totalPrice];
	[msg appendString:@" Turtle Coins"];
	
	UIAlertView *alert = [[[UIAlertView alloc] init] autorelease];
	[alert setTitle:@""];
	[alert setMessage:msg];
	[alert setDelegate:self];
	[alert addButtonWithTitle:@"OK"];
	alert.tag = 0;
	[alert show];
}

-(void) rateMe{
    printf("rate me\n");
    AppController *appDelegate =(AppController*) [[UIApplication sharedApplication] delegate];
    [appDelegate gotoRate];
}


@end
