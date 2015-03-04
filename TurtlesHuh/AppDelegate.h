//
//  AppDelegate.h
//  TurtlesHuh
//
//  Created by apple on 12/10/19.
//  Copyright __MyCompanyName__ 2012年. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "cocos2d.h"


#import <AdColony/AdColony.h>
#import "PlayHavenSDK.h"

//#import <ZIGI/ZIGIManager.h>

@class  TapjoyMarketViewController, LeadboltViewController, LoadingViewController,LoadingIndicatorViewController, BurstlyViewController, FixGMNavigationController, ADColonyViewController;

//@interface AppController : NSObject <UIApplicationDelegate, CCDirectorDelegate, AarkiUserBalanceDelegate, ZIGIManagerDelegate>
@interface AppController : NSObject <UIApplicationDelegate, CCDirectorDelegate, AdColonyDelegate, PHPublisherContentRequestDelegate>
{
	UIWindow *window_;
	//UINavigationController *navController_;
    FixGMNavigationController *navController_;
    
	CCDirectorIOS	*director_;							// weak ref
    
    
    TapjoyMarketViewController* tapjoyMarketViewController;
    LeadboltViewController* leadboltViewController;
    LoadingViewController* loadingViewController;
    BurstlyViewController* burstlyViewController;
    LoadingIndicatorViewController* loadingIndicatorViewController;
    ADColonyViewController* aDColonyViewController;
    
    PHNotificationView *_notificationView;
    
    
    NSTimer* fuckTimer;
    int fuckTimerTimer;
    
    id fucklegate;
    
    NSTimer* gameCenterTimer;
    int gameCenterTimerTimer;
    
   // RViewController* viewController;
    
    NSTimer* removeBurstlyTimer;
    int removeBurstlyTimerTimer;
    
    int heyTimerTimer;
    NSTimer* heyTimer;
}

@property (nonatomic, retain) UIWindow *window;
@property (readonly) UINavigationController *navController;
@property (readonly) CCDirectorIOS *director;

-(void) setHeyTimer;
-(void) submitAllScoreToHeyZap;

-(void) loadADColonyViewController;
-(void) removeADColonyViewController;

-(void) setFucklegate:(id)_fucklegate;

//-(void) loadP4RCView;
//-(void) removeP4RCView;

-(void) refreshBustlyView;
-(void) loadBurstlyView;
-(void) removeBurstlyView;

-(void) initGameCenter;
-(void) addGameCenterView;
-(void) removeGameCenterView;

-(void) loadIndicatorView;
-(void) removeIndicatorView;

-(void) loadLoadingViewWOTimer;
-(void) loadLoadingView;
-(void) removeLoadingView;
-(void) showChartboostMoreApp;

-(void) forceToUnblcokAD;

-(void) loadLeadbolt;
-(void) removeLeadbolt;

-(void) initMusic;
-(void) initDB;
-(void) initOptionDB;
-(void) initAchivementDB;
-(void) initMissionDB;
-(void) initUpgradeDB;
-(void) initONSUpgradeDB;
-(void) initMainOtherDataDB;
-(void) initHeyzapDB;

-(void) initMissionMatched;
-(void) initMiniGameOrder;

-(void) getOptionValues;

-(void) initGradesInMiniGames;
-(void) getAchivementValues;
-(void) getMissionValues;
-(void) getUpgadeValues;
-(void) getONSUpgradeValues;
-(void) getAchivementRewards;

+ (BOOL)isInternetReachable;
+(void) showNoNetworkAlert;
-(void) failToLoadAD;

-(void) loadTapjooyMarketViewController;
-(void) endTapjoyMarketViewController;

-(void) gotoRate;

-(void) buyTurtleFly;

-(void) reloadShowExtra;
-(void) reloadADRatio;

-(void) tryLoadAD;

-(void) removeFuckLoad;

//p4RC
-(void) didStartLevel;

//Birstly
-(void) checkForBurstlyUpdate;

-(void) checkForIphone5;

-(void) showAllAds;


@end
