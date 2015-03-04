//
//  AppDelegate.m
//  TurtlesHuh
//
//  Created by apple on 12/10/19.
//  Copyright __MyCompanyName__ 2012年. All rights reserved.
//

#import "cocos2d.h"

#import "AppDelegate.h"

#import "PlayScene.h"

#import "Global.h"

#import "AchivementScene.h"

#import "ScoreShownScene.h"
#import "AchivementScene.h"

#import "MainPlayScene.h"
#import "MainMissionScene.h"

#import "CoverScene.h"

#import "MainUpgradeScene.h"


#import "MKStoreManager.h"

#import <SystemConfiguration/SystemConfiguration.h>
#import <CoreFoundation/CoreFoundation.h>

#import <sys/socket.h>
#import <netinet/in.h>
#import <netinet6/in6.h>
#import <arpa/inet.h>
#import <ifaddrs.h>
#import <netdb.h>

#import "TapjoyMarketViewController.h"

#import "LeadboltViewController.h"
#import "LoadingViewController.h"
#import "LoadingIndicatorViewController.h"

#import "Chartboost.h"
#import <RevMobAds/RevMobAds.h>
#import "Flurry.h"

#import "ALSdk.h"
#import "ALInterstitialAd.h"

//#import "ATPAutoSend2.h"


//#import "BurstlyViewController.h"


#import "P4RC.h"

#import "ScoreShownScene.h"

#import "RViewController.h"

#import "FixGMNavigationController.h"


#import "HeyzapCocos2DSDK.h"

#import <AdColony/AdColony.h>
#import "ADColonyViewController.h"
#import "GamePlayGlobal.h"

@implementation AppController

@synthesize window=window_, navController=navController_, director=director_;

-(void) checkForIphone5{
    isIphone5 = false;
    isIpad = false;
    aniControlValueForFuckingIpad = 1.0;
    textureRatioForFuckingIpad = 2.0;
    
    if([UIScreen mainScreen].bounds.size.height >= 768.0)
    {
        printf("is Ipad\n");
        isIpad = true;
        aniControlValueForFuckingIpad = 2.0; //assume all the images are double size in fucking ipad
        textureRatioForFuckingIpad = 1.0;
    }else if([UIScreen mainScreen].bounds.size.height >= 568.0)
    {
        printf("is iPhone 5\n");
        isIphone5 = true;
    }
     
}


-(void) checkForBurstlyUpdate{
    //[burstlyViewController checkUpdate];
}

-(void) refreshBustlyView{
    printf("refreshBustlyView\n");
    //[burstlyViewController displayAD];
}

-(void) loadBurstlyView{
    printf("loadBurstlyView\n");
    
   // burstlyViewController = [[BurstlyViewController alloc] init];
   // burstlyViewController.viewController = director_;
   // [burstlyViewController initAds];
    
}

-(void) removeBurstlyView{
    printf("removeBurstlyView\n");
    
   /* if(!bustly_isdeleteControllerInMainGame){
        [burstlyViewController release];
    }else{
        removeBurstlyTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(removeBustlyDelayTimer) userInfo:nil repeats:YES];
        removeBurstlyTimerTimer = 0;
    }*/
    
    

}

-(void) removeBustlyDelayTimer{
    /*removeBurstlyTimerTimer++;
    printf("removeBurstlyTimerTimer:%i\n",removeBurstlyTimerTimer);
    if(removeBurstlyTimerTimer == 3){
        printf("removeBurstlyView->removeBustlyDelayTimer\n");
        [burstlyViewController release];
        [removeBurstlyTimer invalidate];
        bustly_isdeleteControllerInMainGame = false;
    }*/
}

- (NSUInteger)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window {
   // return UIInterfaceOrientationMaskLandscapeLeft;
    //FOR FUCKING GM CRASH
    return UIInterfaceOrientationMaskAllButUpsideDown;
}

/*//FOR FUCKING GM CRASH
-(BOOL)shouldAutorotate {
    return [[UIDevice currentDevice] orientation] != UIInterfaceOrientationPortrait;
}*/

-(void) buyTurtleFly{
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.j2sighte.com/adv/TurtleFly.html"]];
}


-(void) gotoRate{
	//[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?onlyLatestVersion=true&pageNumber=0&sortOrdering=1&type=Purple+Software&id=386595237"]];
	printf("gotoRate\n");
    isGoingToRate = true;
    rateTimer = 0;
    
	NSString *str = @"itms-apps://ax.itunes.apple.com/WebObjects/MZStore.woa";
	str = [NSString stringWithFormat:@"%@/wa/viewContentsUserReviews?", str];
	str = [NSString stringWithFormat:@"%@type=Purple+Software&id=", str];
	
	// Here is the app id from itunesconnect
	str = [NSString stringWithFormat:@"%@542661154", str];
	
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
	
}

+ (BOOL)isInternetReachable {
	printf("isInternetReachable\n");
	BOOL reachable = NO;
	
	struct sockaddr_in zeroAddress;
	memset(&zeroAddress, 0, sizeof(zeroAddress));
	zeroAddress.sin_len = sizeof(zeroAddress);
	zeroAddress.sin_family = AF_INET;
	
	SCNetworkReachabilityRef reachability = SCNetworkReachabilityCreateWithAddress(kCFAllocatorDefault, (const struct sockaddr*)&zeroAddress);
	SCNetworkReachabilityFlags flags = 0;
	
	if (SCNetworkReachabilityGetFlags(reachability, &flags)) {
		reachable = (flags & kSCNetworkReachabilityFlagsReachable) ? YES : NO;
		if (flags & kSCNetworkReachabilityFlagsInterventionRequired)
			reachable = NO;
	}
	
	CFRelease(reachability);
	
	if(reachable){
		printf("has internet\n");
	}else {
		printf("NO internet\n");
	}
    
	return reachable;
}

+(void) showNoNetworkAlert{
	UIAlertView *alert = [[[UIAlertView alloc] init] autorelease];
	[alert setTitle:@"Info"];
	[alert setMessage:@"An internet connection is required."];
	[alert setDelegate:self];
	[alert addButtonWithTitle:@"OK"];
	[alert show];
}

-(void) loadLeadbolt{
    leadboltViewController = [[LeadboltViewController alloc] init];
    [window_ addSubview:leadboltViewController.view];
}

-(void) removeLeadbolt{
    [leadboltViewController.view removeFromSuperview];
    [leadboltViewController release];
}

-(void) loadADColonyViewController{
    printf("loadADColonyViewController\n");
    aDColonyViewController = [[ADColonyViewController alloc] init];
    //aDColonyViewController.viewController = director_;
    [window_ addSubview:aDColonyViewController.view];
}

-(void) removeADColonyViewController{
    [aDColonyViewController.view removeFromSuperview];
    [aDColonyViewController release];
}


-(void) loadIndicatorView{
    printf("loadIndicatorView\n");
    loadingIndicatorViewController = [[LoadingIndicatorViewController alloc] init];
    [window_ addSubview:loadingIndicatorViewController.view];
}

-(void) removeIndicatorView{
    [loadingIndicatorViewController.view removeFromSuperview];
    [loadingIndicatorViewController release];
}

-(void) loadLoadingViewWOTimer{
    loadingViewController = [[LoadingViewController alloc] init];
    [window_ addSubview:loadingViewController.view];
}

-(void) loadLoadingView{
    loadingViewController = [[LoadingViewController alloc] init];
    [window_ addSubview:loadingViewController.view];
    
    fuckTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(fuckDelayTimer) userInfo:nil repeats:YES];
    fuckTimerTimer = 0;
    ad_isLocking = true;
}

-(void) forceToUnblcokAD{
    if(ad_isLocking){
        ad_isLocking = false;
        [fuckTimer invalidate];
    }
}

-(void) fuckDelayTimer{
   // printf("fuckDelayTimer:%i\n",fuckTimerTimer);
    fuckTimerTimer++;
    
    if(fuckTimerTimer == 10){
        if(ad_isLoading){
            printf("FUCK FAIL LOAD AD\n");
            [self failToLoadAD];
            
            if(ad_isClickingShowMore){
                ad_isLocking = false;
                [fuckTimer invalidate];
            }
        }
        
    }
    
    if(fuckTimerTimer == 60){
        ad_isLocking = false;
        [fuckTimer invalidate];
    }
}

-(void) failToLoadAD{
    ad_isLoading = false;
    [self removeLoadingView];
}

-(void) removeLoadingView{
    [loadingViewController.view removeFromSuperview];
    [loadingViewController release];
}

-(void) loadTapjooyMarketViewController{
    printf("loadTapjooyMarketViewController\n");
    
}
-(void) endTapjoyMarketViewController{
    printf("endTapjoyMarketViewController\n");
    [tapjoyMarketViewController.view removeFromSuperview];
    [tapjoyMarketViewController release];
}



-(void) addGameCenterView{
	[window_ addSubview:gameCenterController.view];
}

-(void) removeGameCenterView{
	gameCenterController.view.frame = CGRectMake(0, 0, 1, 1);
	[gameCenterController.view removeFromSuperview];
}

-(void) initGameCenter{
    printf("initGameCenter\n");
    gameCenterController = [[GameCenterController alloc] init];
}

-(void) gmDelayTimer{

}


- (void) removeStartupFlicker
{
	//
	// THIS CODE REMOVES THE STARTUP FLICKER
	//
	// Uncomment the following code if you Application only supports landscape mode
	//
#if GAME_AUTOROTATION == kGameAutorotationUIViewController
    
    //	CC_ENABLE_DEFAULT_GL_STATES();
    //	CCDirector *director = [CCDirector sharedDirector];
    //	CGSize size = [director winSize];
    //	CCSprite *sprite = [CCSprite spriteWithFile:@"Default.png"];
    //	sprite.position = ccp(size.width/2, size.height/2);
    //	sprite.rotation = -90;
    //	[sprite visit];
    //	[[director openGLView] swapBuffers];
    //	CC_ENABLE_DEFAULT_GL_STATES();
	
#endif // GAME_AUTOROTATION == kGameAutorotationUIViewController
}
//- (void) applicationDidFinishLaunching:(UIApplication*)application


-(void) sendHeyZap2:(int)i{
    NSMutableString* scor_heyzapDisplay;
    scor_heyzapDisplay = [NSMutableString string];
    HZScore *score_heyzap = [[HZScore alloc] init];
    
    static int dbScore;
    static int heyScore;
    NSMutableString* dbScoreString = [NSMutableString string];
    NSMutableString* heyScoreString = [NSMutableString string];
    
    static int chosenMiniGame;
    
    if(i == 0){
        chosenMiniGame = 1;
    }
    if(i == 1){
        chosenMiniGame = 4;
    }
    if(i == 2){
        chosenMiniGame = 2;
    }
    if(i == 3){
        chosenMiniGame = 3;
    }
    if(i == 4){
        chosenMiniGame = 10;
    }
    if(i == 5){
        chosenMiniGame = 5;
    }
    if(i == 6){
        chosenMiniGame = 11;
    }
    if(i == 7){
        chosenMiniGame = 13;
    }
    if(i == 8){
        chosenMiniGame = 103;
    }
    
    
    [dbScoreString setString:@"score_mini_"];
    if(chosenMiniGame < 9){
        [dbScoreString appendString:@"0"];
    }
    [dbScoreString appendFormat:@"%i", chosenMiniGame];
    
    
    [heyScoreString setString:@"heyzap_score_mini"];
    if(chosenMiniGame < 9){
        [heyScoreString appendString:@"0"];
    }
    [heyScoreString appendFormat:@"%i", chosenMiniGame];
    
    heyScore = [[NSUserDefaults standardUserDefaults] integerForKey:heyScoreString];
    dbScore = [[NSUserDefaults standardUserDefaults] integerForKey:dbScoreString];
    
  //  NSLog(heyScoreString);
    printf("t:%i heyScore:%i dbScore:%i\n",i,heyScore,dbScore);
    
    if(heyScore < dbScore){
    //    NSLog(heyScoreString);
        printf("iiiiii:%i send mini:%i score:%i\n",i,chosenMiniGame,dbScore);
        [[NSUserDefaults standardUserDefaults] setInteger:dbScore forKey:heyScoreString];
        
        heyScore = [[NSUserDefaults standardUserDefaults] integerForKey:heyScoreString];
        //printf("heyScore:%i\n\n",heyScore);
        
        if(i == 0){
            score_heyzap.levelID = @"W9g";
        }
        if(i == 1){
            score_heyzap.levelID = @"WMc";
        }
        if(i == 2){
            score_heyzap.levelID = @"WMm";
        }
        if(i == 3){
            score_heyzap.levelID = @"WMQ";
        }
        if(i == 4){
            score_heyzap.levelID = @"WIR";
        }
        if(i == 5){
            score_heyzap.levelID = @"WMD";
        }
        if(i == 6){
            score_heyzap.levelID = @"WI8";
        }
        if(i == 7){
            score_heyzap.levelID = @"WI9";
        }
        if(i == 8){
            score_heyzap.levelID = @"WI7";
        }
        
        score_heyzap.relativeScore = dbScore;
        [scor_heyzapDisplay setString:[NSString stringWithFormat:@"%i", dbScore]];
        score_heyzap.displayScore = scor_heyzapDisplay;
        
        [[HeyzapSDK sharedSDK] submitScore: score_heyzap withCompletion:^(HZLeaderboardRank *rank, NSError *error) {
            
        }];
        
    }

}

-(void) submitAllScoreToHeyZap{
    printf("submitAllScoreToHeyZap\n");
    NSMutableString* scor_heyzapDisplay;
    scor_heyzapDisplay = [NSMutableString string];
    HZScore *score_heyzap = [[HZScore alloc] init];
    
    
    static int dbScore;
    static int heyScore;
    NSMutableString* dbScoreString = [NSMutableString string];
    NSMutableString* heyScoreString = [NSMutableString string];
    
    //main
    [dbScoreString setString:@"mainOtherData_bestHeight"];
    [heyScoreString setString:@"heyzap_score_main"];
    
    if(heyScore < dbScore){
        printf("send main:%i\n",dbScore);
        [[NSUserDefaults standardUserDefaults] setInteger:dbScore forKey:heyScoreString];
        
         score_heyzap.levelID = @"WIV";
        score_heyzap.relativeScore = dbScore;
        [scor_heyzapDisplay setString:[NSString stringWithFormat:@"%i", dbScore]];
        score_heyzap.displayScore = scor_heyzapDisplay;
        
        [[HeyzapSDK sharedSDK] submitScore: score_heyzap withCompletion:^(HZLeaderboardRank *rank, NSError *error) {
            
        }];

    }
    //end main
    
    [self sendHeyZap2:0];
    [self sendHeyZap2:1];
    [self sendHeyZap2:2];
    [self sendHeyZap2:3];
    [self sendHeyZap2:4];
    [self sendHeyZap2:5];
    [self sendHeyZap2:6];
    [self sendHeyZap2:7];
    [self sendHeyZap2:8];
    
}

-(void) setHeyTimer{
    if(heyTimerTimer!= 0){
        return;
    }
    
    ad_notShowAdTHisTime = true;
    heyTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(heyDelayTimer) userInfo:nil repeats:YES];
    heyTimerTimer = 0;
}

-(void) heyDelayTimer{
    heyTimerTimer++;
    printf("heyTimerTimer:%i\n",heyTimerTimer);
    if(heyTimerTimer == 10){
        printf("heyTimerTimer->invalidate\n");
        [heyTimer invalidate];
        heyTimerTimer = 0;
    }
}


//use the app id provided by adcolony.com
- ( void ) onAdColonyV4VCReward:(BOOL)success currencyName:(NSString*)currencyName currencyAmount:(int)amount inZone:(NSString*)zoneID {
    NSLog(@"AdColony zone %@ reward %i %i %@", zoneID, success, amount, currencyName);
    [(MainUpgradeScene*)fucklegate finishColony:amount];
}

//- (void) onAdColonyAdStartedInZone:(NSString *)zoneID
//{
//	NSLog(@"Video ad launched for zone %@", zoneID);
//    [musicController deallocMusicEngine];
//}
//- (void) onAdColonyAdAttemptFinished:(BOOL)shown inZone:(NSString *)zoneID
//{
//	NSLog(@"Video ad finished in zone %@", zoneID);
//    [musicController reallocaMusicEngine];
//    
//}

//- (void) adColonyVideoAdNotServedForZone:(NSString *)zone {
//    NSLog(@"adColonyVideoAdNotServedForZone  AdColony did not serve a video for zone %@", zone);
//    UIAlertView *alert = [[[UIAlertView alloc] init] autorelease];
//    [alert setTitle:@"Video is loading"];
//    [alert setMessage:@"Please try again later"];
//    [alert setDelegate:self];
//    [alert addButtonWithTitle:@"ok"];
//    [alert show];
//}

- ( void ) onAdColonyAdAvailabilityChange:(BOOL)available inZone:(NSString*) zoneID {
    
}



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    srandom(time(NULL));

	// Create the main window
	window_ = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    //adColony
    [AdColony configureWithAppID:ADCOLONY_APP_ID zoneIDs:@[ADCOLONY_ZONE_ID] delegate:self logging:YES];
    
    [self checkForIphone5];
    
    heyTimerTimer = 0;
    
    ad_notShowAdTHisTime = false;
    ad_isLoadingFromBecomeActive = false;
    ad_isDirectLoaded = false;
    ad_isLocking = false;
    ad_isLoading = false;
    ad_firstTime = true;
    //  ad_firstTime = false;
    ad_revmobIsFirstLoad = true;
    ad_howmanyGamesPlayed = 0;
    ad_howmanyMainGamePlayed = 0;
    
    ad_RevmobChartboostRatio = 10;
    ad_RevmobChartboostRatio2 = 10;
    ad_howmanyRounds = 0;
    
    burstly_coinsGained = 0;
    burstly_viewedOffer = false;
    bustly_isdeleteControllerInMainGame = false;
    
    
    [HeyzapCocos2DSDK startHeyzapWithAppId: @"542661154"];
    
    [Flurry startSession:FLURRY_API_KEY];
    
    
    [RevMobAds startSessionWithAppID:REVMOB_APP_ID];

    [ALSdk initializeSdk];

    
    //-----------------------------------------------------------------
    [[PHPublisherContentRequest requestForApp:PLAYHEAVEN_TOKEN secret:PLAYHEAVEN_SECRET placement:@"more_games" delegate:self] preload];
    _notificationView = [[PHNotificationView alloc] initWithApp:PLAYHEAVEN_TOKEN secret:PLAYHEAVEN_SECRET placement:@"more_games"];
    _notificationView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin;
    

    
    //getkna
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *checkATPKEY = [defaults objectForKey:@"checkATPKEY"];
    
    NSLog(@"checkATPKEY : %@", checkATPKEY);
    
    if (![checkATPKEY isEqualToString:@"1"]) {
        //ATPAutoSend2 *atpAutoSend = [[ATPAutoSend2 alloc] init];
        
       /* // AAAAAAAAA is your application Apple ID.
        // Please, check the ApplieID.png to learn about the Apple ID.
        [atpAutoSend setATPAppcode:@"542661154"];
        
        // XXXXXXXXXXXXX is an authentication code given to you by AppTouchPoint.
        // We will generate the auto code with your Apple ID.
        [atpAutoSend setATPAuthcode:@"APzLYum5QAwJw"];
        
        [atpAutoSend send];*/
    }
    
    //END gtekna
    
    
    

	// Create an CCGLView with a RGB565 color buffer, and a depth buffer of 0-bits
	CCGLView *glView = [CCGLView viewWithFrame:[window_ bounds]
								   pixelFormat:kEAGLColorFormatRGB565	//kEAGLColorFormatRGBA8
								   depthFormat:0	//GL_DEPTH_COMPONENT24_OES
							preserveBackbuffer:NO
									sharegroup:nil
								 multiSampling:NO
							   numberOfSamples:0];
    
    [glView setMultipleTouchEnabled:YES];

	director_ = (CCDirectorIOS*) [CCDirector sharedDirector];
    
   
	director_.wantsFullScreenLayout = YES;

	// Display FSP and SPF
	[director_ setDisplayStats:NO];

	// set FPS at 60
	//[director_ setAnimationInterval:1.0/60];
    [director_ setAnimationInterval:1.0/240];

	// attach the openglView to the director
	[director_ setView:glView];

	// for rotation and other messages
	[director_ setDelegate:self];

	// 2D projection
	[director_ setProjection:kCCDirectorProjection2D];
//	[director setProjection:kCCDirectorProjection3D];

	// Enables High Res mode (Retina Display) on iPhone 4 and maintains low res on all other devices
    
    if(isIpad){
        if( ! [director_ enableRetinaDisplay:NO] )
            CCLOG(@"Retina Display Not supported");
    }else{
        if( ! [director_ enableRetinaDisplay:YES] )
            CCLOG(@"Retina Display Not supported");
    }
	

	// Default texture format for PNG/BMP/TIFF/JPEG/GIF images
	// It can be RGBA8888, RGBA4444, RGB5_A1, RGB565
	// You can change anytime.
	[CCTexture2D setDefaultAlphaPixelFormat:kCCTexture2DPixelFormat_RGBA8888];

	// If the 1st suffix is not found and if fallback is enabled then fallback suffixes are going to searched. If none is found, it will try with the name without suffix.
	// On iPad HD  : "-ipadhd", "-ipad",  "-hd"
	// On iPad     : "-ipad", "-hd"
	// On iPhone HD: "-hd"
	CCFileUtils *sharedFileUtils = [CCFileUtils sharedFileUtils];
	[sharedFileUtils setEnableFallbackSuffixes:NO];				// Default: NO. No fallback suffixes are going to be used
	[sharedFileUtils setiPhoneRetinaDisplaySuffix:@"-hd"];		// Default on iPhone RetinaDisplay is "-hd"
	[sharedFileUtils setiPadSuffix:@"-ipad"];					// Default on iPad is "ipad"
	[sharedFileUtils setiPadRetinaDisplaySuffix:@"-ipadhd"];	// Default on iPad RetinaDisplay is "-ipadhd"

	// Assume that PVR images have premultiplied alpha
	[CCTexture2D PVRImagesHavePremultipliedAlpha:YES];

	// and add the scene to the stack. The director will run it when it automatically when the view is displayed.
	//[director_ pushScene: [IntroLayer scene]];

	
	// Create a Navigation Controller with the Director
	//navController_ = [[UINavigationController alloc] initWithRootViewController:director_];
	navController_ = [[FixGMNavigationController alloc] initWithRootViewController:director_];
	navController_.navigationBarHidden = YES;
	
	// set the Navigation Controller as the root view controller
//	[window_ addSubview:navController_.view];	// Generates flicker.
	[window_ setRootViewController:navController_];
	
	// make main window visible
	[window_ makeKeyAndVisible];
    
    
    achivementIsGoingToCoverScene = false;
    achivementIsGoingToStoreScene = false;
    achivementIsGoingToSelectMiniScene = false;
    
    isGoingSelectMIniAfterPlay = false;
    isGoingToNextMiniGame = false;
    // hasShownedExtra = false;
    
    [self initGameCenter];
    
    [self initMiniGameOrder];
    [self initDB];
    [self initMusic];
    [self initGradesInMiniGames];
    [self getOptionValues];
    [self getAchivementRewards];
    
    currentChosenMissionWon[0] = false;
    currentChosenMissionWon[1] = false;
    currentChosenMissionWon[2] = false;
    
    
    /*   In-app purchase   */
    [MKStoreManager sharedManager];
    
    
    isGoingToRate = false;
    rateTimer = 0;
    
    canShownExtra = 0;
    canShownExtra2 = 0;
	[self performSelectorInBackground:@selector(backgroundLoadShownExtra) withObject:nil];
    [self performSelectorInBackground:@selector(backgroundLoadADRatio) withObject:nil];
    
    
    // P4RC
    [[P4RC sharedInstance] setBannersTimeBeforeHiding:4];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(initializationDidComplete) name:P4RCInitializationDidCompleteNotification object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(initializationDidFail) name:P4RCInitializationDidFailNotification object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pointsWasSentOnServer) name:P4RCPointsWasSentOnServerNotification object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pointsSendingDidFail) name:P4RCPointsSendingDidFailNotification object:nil];
    
    [[P4RC sharedInstance] setGameRefId:@"Turtles101512"];
    //[[P4RC sharedInstance] initializeWithTestServer];
    [[P4RC sharedInstance]  initializeWithServerHost:@"www.p4rc.com" andApiKey:@"f70430f2-2fec-4f03-8048-dc91cf5837a4"];
    
    
    [[NSUserDefaults standardUserDefaults] registerDefaults:[NSDictionary dictionaryWithObject:[NSNumber numberWithInt:0] forKey:@"hasShownP4RC"]];
    static bool hasShownP4RC;
    hasShownP4RC = [[NSUserDefaults standardUserDefaults] boolForKey:@"hasShownP4RC"];
    if(!hasShownP4RC){
        [[P4RC sharedInstance] showSplash];
        [[NSUserDefaults standardUserDefaults] setBool:true forKey:@"hasShownP4RC"];
    }
    
    

    gOrientation = UIDeviceOrientationLandscapeLeft;
    UIDevice *device = [UIDevice currentDevice];
    [device beginGeneratingDeviceOrientationNotifications];	
    [[NSNotificationCenter defaultCenter] addObserver:self											//Add yourself as an observer
                                             selector:@selector(orientationChanged:)
                                                 name:UIDeviceOrientationDidChangeNotification
                                               object:device];
    
    
    
    
    //aarki
    /* NSLog(@"Loading Offer Manager v. %@.", [AarkiContact libraryVersion]);
    NSLog(@"OpenUDID: %@", [AarkiContact openUDID]);
    NSLog(@"UserID: %@", [AarkiContact userId]);
     
    [AarkiContact registerAppWithClientSecurityKey:@"wgqIJIit7QwMfsrSnm6u09civHSf"];
    //[AarkiContact setUserId:@"DEVELOPER_USER_ID"]; // Uncomment this line to specify your own user ID
    
    [AarkiUserBalance check:@"A84AB9AD80F3704DAA" delegate:self];*/
   
    
    
    /*ZIGIManager* manager = [ZIGIManager
                            createSharedManagerWithApikey:@"3db95c135bf54da4bd88632021bc3934"];
    manager.delegate = self;
    
    [[ZIGIManager sharedManager] pauseMonitoring];*/
    
	// Run the intro Scene
	//[[CCDirector sharedDirector] runWithScene: [CoverScene scene]];
    [director_ pushScene: [CoverScene scene]];
    
    
    [self showAllAds];
    
	
	return YES;
}




-(void) reloadADRatio{
    [self performSelectorInBackground:@selector(backgroundLoadADRatio) withObject:nil];
}

-(void) backgroundLoadADRatio{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	printf("load backgroundLoadADRatio\n");
    
    NSError* error = nil;
    
	ad_RevmobChartboostRatio = [[NSString stringWithContentsOfURL:[NSURL URLWithString: @"http://j2sighte.com/adv/hasInternet/TurtlesHuh/adRatio.html"] encoding:NSUTF8StringEncoding error:&error] intValue];
	ad_RevmobChartboostRatio2 = [[NSString stringWithContentsOfURL:[NSURL URLWithString: @"http://j2sighte.com/adv/hasInternet/TurtlesHuh/adRatio2.html"] encoding:NSUTF8StringEncoding error:&error] intValue];
	
	[self performSelectorOnMainThread:@selector(showADRatio) withObject:nil waitUntilDone:NO];
	
	[pool drain];
}

-(void) showADRatio{
    printf("showADRatio %i %i\n",ad_RevmobChartboostRatio,ad_RevmobChartboostRatio2);
}

-(void) reloadShowExtra{
    printf("reloadShowExtra\n");
    [self performSelectorInBackground:@selector(backgroundLoadShownExtra) withObject:nil];
}

-(void) backgroundLoadShownExtra{
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	printf("load backgroundLoadShownExtra\n");
    
    NSError* error = nil;
    
	canShownExtra = [[NSString stringWithContentsOfURL:[NSURL URLWithString: @"http://j2sighte.com/adv/hasInternet/TurtlesHuh/canShownExtra.html"] encoding:NSUTF8StringEncoding error:&error]  intValue];
	canShownExtra2 = [[NSString stringWithContentsOfURL:[NSURL URLWithString: @"http://j2sighte.com/adv/hasInternet/TurtlesHuh/canShownExtra2.html"] encoding:NSUTF8StringEncoding error:&error]  intValue];
	
	[self performSelectorOnMainThread:@selector(shownExtra) withObject:nil waitUntilDone:NO];
	
	[pool drain];
}

-(void) shownExtra{
	printf("canShownExtra %i %i\n",canShownExtra,canShownExtra2);
    //hasShownedExtra = true;
}




-(void) showChartboost
{
    Chartboost *cb = [Chartboost sharedChartboost];
    
    cb.appId = CHARTBOOST_APP_ID;
    cb.appSignature = CHARTBOOST_APP_SIGNATURE;
    
    // Required for use of delegate methods. See "Advanced Topics" section below.
//    cb.delegate = self;
    
    // Begin a user session. Must not be dependent on user actions or any prior network requests.
    // Must be called every time your app becomes active.
    [cb startSession];
    
    // Show an interstitial
    [cb showInterstitial];

}
-(void) showChartboostMoreApp{
    ad_isLoading = true;
    
    [self loadLoadingView];
    
    Chartboost *cb = [Chartboost sharedChartboost];
    
    cb.appId = CHARTBOOST_APP_ID;
    cb.appSignature = CHARTBOOST_APP_SIGNATURE;
    
    // Required for use of delegate methods. See "Advanced Topics" section below.
//    cb.delegate = self;
    
    // Begin a user session. Must not be dependent on user actions or any prior network requests.
    // Must be called every time your app becomes active.
    [cb startSession];
    
  //  Chartboost *cb = [Chartboost sharedChartboost];
    [cb showMoreApps];
}


- (void)didFailToLoadInterstitial:(NSString *)location{
    printf("didFailToLoadInterstitial\n");
}

- (BOOL)shouldDisplayInterstitial:(NSString *)location{
    printf("shouldDisplayInterstitial\n");
    return YES;
}

//-(void) tryLoadAD{
//    printf("tryLoadAD1\n");
//    
//    [cb showInterstitial];
//    
//    
//    [[RevMobAds session]  showFullscreen];
//    
//    return;
//    
//}


- (BOOL)shouldDisplayMoreApps{
    printf("shouldDisplayMoreApps\n");
    return YES;
}

- (void)revmobAdDidReceive{
    printf("revmobAdDidReceive\n");
    if(ad_isLoading){
        [self removeLoadingView];
        
        if(ad_isClickingShowMore){
            ad_isLocking = false;
            [fuckTimer invalidate];
        }
    }
    
    ad_isLoading = false;
    
}


-(void) revmobAdDisplayed{
    printf("revmobAdDisplayed\n");
}
-(void) revmobUserClickedInTheAd{
    printf("revmobUserClickedInTheAd\n");
}
-(void) revmobUserClosedTheAd{
    printf("revmobUserClosedTheAd\n");
}
-(void) installDidReceive{
    printf("installDidReceive\n");
}


- (void)showEarnedCurrencyAlert:(NSNotification*)notifyObj
{
    
}



-(void) initMusic{
    musicController = [[MusicController alloc] init];
}

-(void) initDB{
    [self initOptionDB];
    [self initAchivementDB];
    [self initMissionDB];
    [self initUpgradeDB];
    [self initONSUpgradeDB];
    [self initMainOtherDataDB];
    [self initHeyzapDB];
}

-(void) initHeyzapDB{
    [[NSUserDefaults standardUserDefaults] registerDefaults:[NSDictionary dictionaryWithObject:[NSNumber numberWithInt:0] forKey:@"heyzap_score_mini01"]];
    [[NSUserDefaults standardUserDefaults] registerDefaults:[NSDictionary dictionaryWithObject:[NSNumber numberWithInt:0] forKey:@"heyzap_score_mini02"]];
    [[NSUserDefaults standardUserDefaults] registerDefaults:[NSDictionary dictionaryWithObject:[NSNumber numberWithInt:0] forKey:@"heyzap_score_mini03"]];
    [[NSUserDefaults standardUserDefaults] registerDefaults:[NSDictionary dictionaryWithObject:[NSNumber numberWithInt:0] forKey:@"heyzap_score_mini04"]];
    [[NSUserDefaults standardUserDefaults] registerDefaults:[NSDictionary dictionaryWithObject:[NSNumber numberWithInt:0] forKey:@"heyzap_score_mini05"]];
    [[NSUserDefaults standardUserDefaults] registerDefaults:[NSDictionary dictionaryWithObject:[NSNumber numberWithInt:0] forKey:@"heyzap_score_mini06"]];
    [[NSUserDefaults standardUserDefaults] registerDefaults:[NSDictionary dictionaryWithObject:[NSNumber numberWithInt:0] forKey:@"heyzap_score_mini07"]];
    [[NSUserDefaults standardUserDefaults] registerDefaults:[NSDictionary dictionaryWithObject:[NSNumber numberWithInt:0] forKey:@"heyzap_score_mini08"]];
    [[NSUserDefaults standardUserDefaults] registerDefaults:[NSDictionary dictionaryWithObject:[NSNumber numberWithInt:0] forKey:@"heyzap_score_mini09"]];
    [[NSUserDefaults standardUserDefaults] registerDefaults:[NSDictionary dictionaryWithObject:[NSNumber numberWithInt:0] forKey:@"heyzap_score_main"]];
    
}

-(void) initMainOtherDataDB{
    [[NSUserDefaults standardUserDefaults] registerDefaults:[NSDictionary dictionaryWithObject:[NSNumber numberWithInt:0] forKey:@"mainOtherData_bestHeight"]];
    
    [[NSUserDefaults standardUserDefaults] registerDefaults:[NSDictionary dictionaryWithObject:[NSNumber numberWithInt:0] forKey:@"hasRatedBefore"]];
    
    // [[NSUserDefaults standardUserDefaults] registerDefaults:[NSDictionary dictionaryWithObject:[NSNumber numberWithInt:0] forKey:@"hasPlayedBeginStory"]];
    // [[NSUserDefaults standardUserDefaults] registerDefaults:[NSDictionary dictionaryWithObject:[NSNumber numberWithInt:0] forKey:@"hasPlayedEndStory"]];
    
    [[NSUserDefaults standardUserDefaults] registerDefaults:[NSDictionary dictionaryWithObject:[NSNumber numberWithInt:0] forKey:@"freeChargesOnONS"]];
    //  [[NSUserDefaults standardUserDefaults] registerDefaults:[NSDictionary dictionaryWithObject:[NSNumber numberWithInt:1] forKey:@"showBeginInstructions"]];
    
    
    [[NSUserDefaults standardUserDefaults] registerDefaults:[NSDictionary dictionaryWithObject:[NSNumber numberWithInt:0] forKey:@"main_penguinHit"]];
    [[NSUserDefaults standardUserDefaults] registerDefaults:[NSDictionary dictionaryWithObject:[NSNumber numberWithInt:0] forKey:@"main_continuePerfectLaunch"]];
    [[NSUserDefaults standardUserDefaults] registerDefaults:[NSDictionary dictionaryWithObject:[NSNumber numberWithInt:0] forKey:@"main_diamondGot"]];
    [[NSUserDefaults standardUserDefaults] registerDefaults:[NSDictionary dictionaryWithObject:[NSNumber numberWithInt:0] forKey:@"main_moneyGained"]];
    
    [[NSUserDefaults standardUserDefaults] registerDefaults:[NSDictionary dictionaryWithObject:[NSNumber numberWithInt:0] forKey:@"main_hasPlayedInstruction"]];
    [[NSUserDefaults standardUserDefaults] registerDefaults:[NSDictionary dictionaryWithObject:[NSNumber numberWithInt:0] forKey:@"main_hasPlayedBeginStory"]];
    [[NSUserDefaults standardUserDefaults] registerDefaults:[NSDictionary dictionaryWithObject:[NSNumber numberWithInt:0] forKey:@"main_hasPlayedEndStory"]];
    [[NSUserDefaults standardUserDefaults] registerDefaults:[NSDictionary dictionaryWithObject:[NSNumber numberWithInt:0] forKey:@"main_hasUnblocked"]];
    
    
    [[NSUserDefaults standardUserDefaults] registerDefaults:[NSDictionary dictionaryWithObject:[NSNumber numberWithInt:0] forKey:@"burstly_hasEnteredOfferwall"]];
    
    
    [[NSUserDefaults standardUserDefaults] registerDefaults:[NSDictionary dictionaryWithObject:[NSNumber numberWithInt:1] forKey:@"firstPlayFor76444"]];
    if([[NSUserDefaults standardUserDefaults] boolForKey:@"firstPlayFor76444"]){
        [[NSUserDefaults standardUserDefaults] setBool:false forKey:@"firstPlayFor76444"];
        [[NSUserDefaults standardUserDefaults] setBool:false forKey:@"main_hasUnblocked"];
    }
}

-(void) initOptionDB{
	[[NSUserDefaults standardUserDefaults] registerDefaults:[NSDictionary dictionaryWithObject:[NSNumber numberWithInt:1] forKey:@"isMusic"]];
	[[NSUserDefaults standardUserDefaults] registerDefaults:[NSDictionary dictionaryWithObject:[NSNumber numberWithInt:1] forKey:@"isSound"]];
	[[NSUserDefaults standardUserDefaults] registerDefaults:[NSDictionary dictionaryWithObject:[NSNumber numberWithInt:1] forKey:@"musicVolumn"]];
	[[NSUserDefaults standardUserDefaults] registerDefaults:[NSDictionary dictionaryWithObject:[NSNumber numberWithInt:1] forKey:@"soundVolumn"]];
}

-(void) initONSUpgradeDB{
    NSMutableString* achivementString = [NSMutableString string];
    for(int i = 0 ; i < maxONSUpgradeItems ; i++){
        
        [achivementString setString:@"onsUpgrade_itemLevel_"];
        
        if(i <= 9){
            [achivementString appendString:@"0"];
        }
        
        [achivementString appendFormat:@"%i", i];
        
        // NSLog(achivementString);
        
        [[NSUserDefaults standardUserDefaults] registerDefaults:[NSDictionary dictionaryWithObject:[NSNumber numberWithInt:0] forKey:achivementString]];
    }
    
    
    
    for(int i = 0 ; i < maxONSUpgradeItems ; i++){
        
        [achivementString setString:@"onsUpgrade_isEnable_"];
        
        if(i <= 9){
            [achivementString appendString:@"0"];
        }
        
        [achivementString appendFormat:@"%i", i];
        
        // NSLog(achivementString);
        
        [[NSUserDefaults standardUserDefaults] registerDefaults:[NSDictionary dictionaryWithObject:[NSNumber numberWithInt:1] forKey:achivementString]];
    }
    
    
    for(int i = 0 ; i < 8 ; i++){
        
        [achivementString setString:@"permenantUpgrade_isEnable_"];
        
        if(i <= 9){
            [achivementString appendString:@"0"];
        }
        
        [achivementString appendFormat:@"%i", i];
        
        // NSLog(achivementString);
        
        [[NSUserDefaults standardUserDefaults] registerDefaults:[NSDictionary dictionaryWithObject:[NSNumber numberWithInt:1] forKey:achivementString]];
    }
}

-(void) initUpgradeDB{
    NSMutableString* achivementString = [NSMutableString string];
    for(int i = 0 ; i < maxUpgradeItems ; i++){
        
        [achivementString setString:@"upgrade_itemLevel_"];
        
        if(i <= 9){
            [achivementString appendString:@"0"];
        }
        
        [achivementString appendFormat:@"%i", i];
        
        // NSLog(achivementString);
        
        if( i == 0 || i == 1){
            [[NSUserDefaults standardUserDefaults] registerDefaults:[NSDictionary dictionaryWithObject:[NSNumber numberWithInt:1] forKey:achivementString]];
        }else{
            [[NSUserDefaults standardUserDefaults] registerDefaults:[NSDictionary dictionaryWithObject:[NSNumber numberWithInt:0] forKey:achivementString]];
        }
        
    }
    
}

-(void) initMissionDB{
    
    [self initMissionMatched];
    
    [[NSUserDefaults standardUserDefaults] registerDefaults:[NSDictionary dictionaryWithObject:[NSNumber numberWithInt:0] forKey:@"currentMissionIdx_00"]];
    [[NSUserDefaults standardUserDefaults] registerDefaults:[NSDictionary dictionaryWithObject:[NSNumber numberWithInt:1] forKey:@"currentMissionIdx_01"]];
    [[NSUserDefaults standardUserDefaults] registerDefaults:[NSDictionary dictionaryWithObject:[NSNumber numberWithInt:2] forKey:@"currentMissionIdx_02"]];
    
    //mission_01
    
    NSMutableString* achivementString = [NSMutableString string];
    for(int i = 0 ; i < maxMissions ; i++){
        
        [achivementString setString:@"mission_"];
        
        if(i <= 9){
            [achivementString appendString:@"0"];
        }
        
        [achivementString appendFormat:@"%i", i];
        
        // NSLog(achivementString);
        
        [[NSUserDefaults standardUserDefaults] registerDefaults:[NSDictionary dictionaryWithObject:[NSNumber numberWithInt:0] forKey:achivementString]];
    }
    
    
    for(int i = 0 ; i < maxMissions ; i++){
        
        [achivementString setString:@"missionPlayed_"];
        
        if(i <= 9){
            [achivementString appendString:@"0"];
        }
        
        [achivementString appendFormat:@"%i", i];
        
        // NSLog(achivementString);
        
        [[NSUserDefaults standardUserDefaults] registerDefaults:[NSDictionary dictionaryWithObject:[NSNumber numberWithInt:0] forKey:achivementString]];
    }
    
}



-(void) initAchivementDB{
    
    [[NSUserDefaults standardUserDefaults] registerDefaults:[NSDictionary dictionaryWithObject:[NSNumber numberWithInt:0] forKey:@"turtleCoin"]];
    
    //achivement_01
    
    NSMutableString* achivementString = [NSMutableString string];
    for(int i = 0 ; i < maxAchivements ; i++){
        
        [achivementString setString:@"achivement_"];
        
        if(i < 9){
            [achivementString appendString:@"0"];
        }
        
        [achivementString appendFormat:@"%i", i+1];
        
        // NSLog(achivementString);
        
        [[NSUserDefaults standardUserDefaults] registerDefaults:[NSDictionary dictionaryWithObject:[NSNumber numberWithInt:0] forKey:achivementString]];
    }
    
    NSMutableString* achivementString2 = [NSMutableString string];
    for(int i = 0 ; i < maxAchivements ; i++){
        
        [achivementString2 setString:@"achivement_hasUnblockForMain_"];
        
        if(i < 9){
            [achivementString2 appendString:@"0"];
        }
        
        [achivementString2 appendFormat:@"%i", i+1];
        
        // NSLog(achivementString2);
        
        [[NSUserDefaults standardUserDefaults] registerDefaults:[NSDictionary dictionaryWithObject:[NSNumber numberWithInt:0] forKey:achivementString2]];
    }
    
    
    
    
    //score_mini_01
    
    NSMutableString* scoreString = [NSMutableString string];
    for(int i = 0 ; i < maxMiniGames ; i++){
        
        [scoreString setString:@"score_mini_"];
        
        if(i < 9){
            [scoreString appendString:@"0"];
        }
        
        [scoreString appendFormat:@"%i", i+1];
        
        // NSLog(scoreString);
        
        [[NSUserDefaults standardUserDefaults] registerDefaults:[NSDictionary dictionaryWithObject:[NSNumber numberWithInt:0] forKey:scoreString]];
    }
    
    
    
    NSMutableString* miniCounterString = [NSMutableString string];
    for(int i = 0 ; i < maxMiniGames ; i++){
        
        [miniCounterString setString:@"counter_mini_"];
        
        if(i < 9){
            [miniCounterString appendString:@"0"];
        }
        
        [miniCounterString appendFormat:@"%i", i+1];
        
        // NSLog(scoreString);
        
        [[NSUserDefaults standardUserDefaults] registerDefaults:[NSDictionary dictionaryWithObject:[NSNumber numberWithInt:0] forKey:miniCounterString]];
    }
    
    NSMutableString* miniCounterPlayedString = [NSMutableString string];
    for(int i = 0 ; i < maxMiniGames ; i++){
        
        [miniCounterPlayedString setString:@"mini_hasPlayed_"];
        
        if(i < 9){
            [miniCounterPlayedString appendString:@"0"];
        }
        
        [miniCounterPlayedString appendFormat:@"%i", i+1];
        
        // NSLog(scoreString);
        
        [[NSUserDefaults standardUserDefaults] registerDefaults:[NSDictionary dictionaryWithObject:[NSNumber numberWithInt:0] forKey:miniCounterPlayedString]];
    }
}

-(void) getOptionValues{
	isMusic = [[NSUserDefaults standardUserDefaults] boolForKey:@"isMusic"];
	isSound = [[NSUserDefaults standardUserDefaults] boolForKey:@"isSound"];
	musicVolumn = [[NSUserDefaults standardUserDefaults] floatForKey:@"musicVolumn"];
	soundVolumn = [[NSUserDefaults standardUserDefaults] floatForKey:@"soundVolumn"];
}

-(void) getAchivementValues{
    printf("getAchivementValues\n");
    
    NSMutableString* achivementString = [NSMutableString string];
    for(int i = 0 ; i < maxAchivements ; i++){
        [achivementString setString:@"achivement_"];
        
        if(i < 9){
            [achivementString appendString:@"0"];
        }
        
        [achivementString appendFormat:@"%i", i+1];
        
        hasFinishedThisAchivements[i] = [[NSUserDefaults standardUserDefaults] boolForKey:achivementString];
    }
    
}

-(void) getAchivementRewards{
    for(int i = 0 ; i < maxAchivements ; i++){
        ahievementReward[i] = 35;
    }
    
    
    for(int i = 0 ; i < 8 ; i++){
        ahievementReward[i*5] = 50;
        ahievementReward[i*5+1] = 300;
        ahievementReward[i*5+2] = 500;
        ahievementReward[i*5+3] = 1000;
        ahievementReward[i*5+4] = 5000;
    }
    
}

-(void) getMissionValues{
    NSMutableString* achivementString = [NSMutableString string];
    missionCompleted = 0;
    for(int i = 0 ; i < maxMissions ; i++){
        [achivementString setString:@"mission_"];
        
        if(i <= 9){
            [achivementString appendString:@"0"];
        }
        
        [achivementString appendFormat:@"%i", i];
        
        hasFinishedMission[i] = [[NSUserDefaults standardUserDefaults] boolForKey:achivementString];
        if(hasFinishedMission[i]){
            missionCompleted++;
            // printf("missionCompleted:%i\n",i);
        }
        
    }
    
    
    for(int i = 0 ; i < maxMissions ; i++){
        [achivementString setString:@"missionPlayed_"];
        
        if(i <= 9){
            [achivementString appendString:@"0"];
        }
        
        [achivementString appendFormat:@"%i", i];
        
        hasPlayedThisMissionBefore[i] = [[NSUserDefaults standardUserDefaults] boolForKey:achivementString];
        
        if(hasPlayedThisMissionBefore[i]){
            // printf("hasPlayedThisMissionBefore:%i\n",i);
        }
        
    }
    
    
    currentChosenMissionIdx[0] = [[NSUserDefaults standardUserDefaults] integerForKey:@"currentMissionIdx_00"];
    currentChosenMissionIdx[1] = [[NSUserDefaults standardUserDefaults] integerForKey:@"currentMissionIdx_01"];
    currentChosenMissionIdx[2] = [[NSUserDefaults standardUserDefaults] integerForKey:@"currentMissionIdx_02"];
    
    printf("getMissionValues:%i %i %i\n", currentChosenMissionIdx[0], currentChosenMissionIdx[1], currentChosenMissionIdx[2]);
    
    for(int i = 0 ; i < maxMissionsShowForOneTime ; i++){
        if(currentChosenMissionIdx[i] >= 0 && currentChosenMissionIdx[i] < 9999){
            currentChosenMission[i] = missionIdxMatched[currentChosenMissionIdx[i]];
        }else{
            currentChosenMission[i] = -100;
        }
    }
    
}

-(void) getUpgadeValues{
    NSMutableString* achivementString = [NSMutableString string];
    for(int i = 0 ; i < maxUpgradeItems ; i++){
        
        [achivementString setString:@"upgrade_itemLevel_"];
        
        if(i <= 9){
            [achivementString appendString:@"0"];
        }
        
        [achivementString appendFormat:@"%i", i];
        
        // NSLog(achivementString);
        upgradeItemLevel[i] = [[NSUserDefaults standardUserDefaults] integerForKey:achivementString];
        // printf("getUpgadeValues:%i %i\n",i , upgradeItemLevel[i]);
    }
}

-(void) getONSUpgradeValues{
    NSMutableString* achivementString = [NSMutableString string];
    for(int i = 0 ; i < maxONSUpgradeItems ; i++){
        
        [achivementString setString:@"onsUpgrade_itemLevel_"];
        
        if(i <= 9){
            [achivementString appendString:@"0"];
        }
        
        [achivementString appendFormat:@"%i", i];
        
        // NSLog(achivementString);
        onsUpgradeItemLevel[i] = [[NSUserDefaults standardUserDefaults] integerForKey:achivementString];
        //   printf("getUpgadeValues:%i %i\n",i , onsUpgradeItemLevel[i]);
    }
    
    for(int i = 0 ; i < maxONSUpgradeItems ; i++){
        
        [achivementString setString:@"onsUpgrade_isEnable_"];
        
        if(i <= 9){
            [achivementString appendString:@"0"];
        }
        
        [achivementString appendFormat:@"%i", i];
        
        // NSLog(achivementString);
        onsUpgradeItemIsEnable[i] = [[NSUserDefaults standardUserDefaults] integerForKey:achivementString];
        // printf("onsUpgradeItemIsEnable:%i %i\n",i , onsUpgradeItemIsEnable[i]);
    }
    
    
    for(int i = 0 ; i < 8 ; i++){
        
        [achivementString setString:@"permenantUpgrade_isEnable_"];
        
        if(i <= 9){
            [achivementString appendString:@"0"];
        }
        
        [achivementString appendFormat:@"%i", i];
        
        // NSLog(achivementString);
        permenanatUpgradeItemIsEnable[i] = [[NSUserDefaults standardUserDefaults] integerForKey:achivementString];
        // printf("onsUpgradeItemIsEnable:%i %i\n",i , onsUpgradeItemIsEnable[i]);
    }
}

-(void) initGradesInMiniGames{
    //mini game 01
    /* gradeAccordingToScoreInMiniGame[0][0] = 700;
     gradeAccordingToScoreInMiniGame[1][0] = 500;
     gradeAccordingToScoreInMiniGame[2][0] = 350;
     gradeAccordingToScoreInMiniGame[3][0] = 200;
     gradeAccordingToScoreInMiniGame[4][0] = 100;*/
    
}

-(void) initMissionMatched{
    for(int i = 0 ; i < maxMissions ; i++){
        missionIdxMatched[i] = i;
    }
}

-(void) initMiniGameOrder{
    miniGameOrder[0] = 1;
    miniGameOrder[1] = 4;
    miniGameOrder[2] = 2;
    miniGameOrder[3] = 3;
    miniGameOrder[4] = 10;
    miniGameOrder[5] = 5;
    miniGameOrder[6] = 11;
    miniGameOrder[7] = 13;
    miniGameOrder[8] = 103;

}


//********** ORIENTATION CHANGED **********
- (void)orientationChanged:(NSNotification *)note
{
	NSLog(@"Orientation  has changed: %d", [[note object] orientation]);
    if([[note object] orientation] == UIDeviceOrientationLandscapeRight){
        printf("UIDeviceOrientationLandscapeRight\n");
        gOrientation = UIDeviceOrientationLandscapeRight;
    }
    if([[note object] orientation] == UIDeviceOrientationLandscapeLeft){
        printf("UIDeviceOrientationLandscapeLeft\n");
        gOrientation = UIDeviceOrientationLandscapeLeft;
    }
}

#pragma mark - P4RC

- (void)initializationDidComplete
{
    printf("initializationDidComplete\n");
}

- (void)initializationDidFail
{
    printf("initializationDidFail\n");
}

-(void) setFucklegate:(id)_fucklegate{
    fucklegate = _fucklegate;
}

- (void)pointsWasSentOnServer
{
	printf("pointsWasSentOnServer\n");
    
    
    lastFuckPoint =  [[P4RC sharedInstance] lastP4RCPoints];
    printf("lastloastFuckPoint:%i\n",lastFuckPoint);
    
    
    if(p4rc_canDisplayScore){
        printf("p4rc_canDisplayScore\n");
        if(p4rc_isInMiniGame){
             [(ScoreShownScene*)fucklegate displayP4RCLastPoint];
        }else{
            [(MainPlayScene*)fucklegate displayP4RCLastPoint];
        }
    }
        
    
}

- (void)pointsSendingDidFail
{
	printf("pointsSendingDidFail\n");
   //  [(ScoreShownScene*)fucklegate failP4RCaAndReload];
}

-(void) removeFuckLoad{
    [(MainUpgradeScene*)fucklegate removeFuckFuck];
}

- (void)didStartLevel
{
    [[P4RC sharedInstance] didStartLevel];
    printf("DidStartLevel\n");
}



-(void) HavenMoreGames
{
    PHPublisherContentRequest *request = [PHPublisherContentRequest requestForApp:PLAYHEAVEN_TOKEN secret:PLAYHEAVEN_SECRET placement:@"more_games" delegate:self];
    [request send];
}

#pragma mark - PHPublisherContentRequestDelegate

-(void)requestWillGetContent:(PHPublisherContentRequest *)request
{
    NSLog(@"Getting content for placement: %@", request.placement);
}

-(void)requestDidGetContent:(PHPublisherContentRequest *)request
{
    NSLog(@"Got content for placement: %@", request.placement);
}

-(void)request:(PHPublisherContentRequest *)request contentWillDisplay:(PHContent *)content
{
    NSLog(@"Preparing to display content: %@",content);
}

-(void)request:(PHPublisherContentRequest *)request contentDidDisplay:(PHContent *)content
{
    //This is a good place to clear any notification views attached to this request.
    [_notificationView clear];
    NSLog(@"Displayed content: %@",content);
}

-(void)request:(PHPublisherContentRequest *)request contentDidDismissWithType:(PHPublisherContentDismissType *)type
{
    NSLog(@" User dismissed request: %@ of type %@",request, type);
}

-(void)request:(PHPublisherContentRequest *)request didFailWithError:(NSError *)error
{
    NSLog(@"Error ! !  ");
    NSLog(@"Error Type :: %@ ", error);
    
}



// Supported orientations: Landscape. Customize it for your own needs
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return UIInterfaceOrientationIsLandscape(interfaceOrientation);
}


// getting a call, pause the game
-(void) applicationWillResignActive:(UIApplication *)application
{
	if( [navController_ visibleViewController] == director_ )
		[director_ pause];
}

// call got rejected
-(void) applicationDidBecomeActive:(UIApplication *)application
{
	if( [navController_ visibleViewController] == director_ )
		[director_ resume];
    
    
    if(![[NSUserDefaults standardUserDefaults] boolForKey:@"firstLuanch"]){
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"firstLuanch"];
    }
    else {
//        [self showAllAds];
    }
    
    
    return;
    
    
    
}

-(void) showAllAds{
    

#if FREE_VERSION == YES
    int number = random() % 4;

    if (number == 0) {
        [[RevMobAds session] showFullscreen];
    }
    else if (number == 1) {
        [self showChartboost];
    }
    else if (number == 2) {
        PHPublisherContentRequest *request = [PHPublisherContentRequest requestForApp: PLAYHEAVEN_TOKEN secret: PLAYHEAVEN_SECRET placement:@"more_games" delegate:self];
        [request send];
    }
    else {
        [ALInterstitialAd showOver:[[UIApplication sharedApplication] keyWindow]];
    }
#endif

}


-(void) applicationDidEnterBackground:(UIApplication*)application
{
	if( [navController_ visibleViewController] == director_ )
		[director_ stopAnimation];
}

-(void) applicationWillEnterForeground:(UIApplication*)application
{
	if( [navController_ visibleViewController] == director_ )
		[director_ startAnimation];
}

// application will be killed
- (void)applicationWillTerminate:(UIApplication *)application
{
	CC_DIRECTOR_END();
}

// purge memory
- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application
{
	[[CCDirector sharedDirector] purgeCachedData];
}

// next delta time will be zero
-(void) applicationSignificantTimeChange:(UIApplication *)application
{
	[[CCDirector sharedDirector] setNextDeltaTimeZero:YES];
}

- (void) dealloc
{
	[window_ release];
	[navController_ release];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:P4RCInitializationDidCompleteNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:P4RCInitializationDidFailNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:P4RCPointsWasSentOnServerNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:P4RCPointsSendingDidFailNotification object:nil];

	[super dealloc];
}
@end

