//
//  CoverScene.m
//  TurtlesHuh
//
//  Created by  on 2012/6/30.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "CoverScene.h"
#import "SelectMiniGameScene2.h"
#import "AchivementScene.h"
#import "Global.h"
#import "AppDelegate.h"
#import "OptionsScene.h"
#import "MainMissionScene.h"
#import "CreditsScene.h"
#import "ChosePlayScene.h"
#import "ADScene.h"

#import "P4RC.h"
#import "HeyzapCocos2DSDK.h"

@implementation CoverScene

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	CoverScene *layer = [CoverScene node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
        
        AppController *appDelegate =(AppController*) [[UIApplication sharedApplication] delegate];
        [appDelegate submitAllScoreToHeyZap];
        
        moreGameTimer = 0;
        
        CCSprite* s_bg = [CCSprite spriteWithFile:@"cover_bg.png"];
        [s_bg setPosition:ccp([UIScreen mainScreen].bounds.size.height/2, [UIScreen mainScreen].bounds.size.width/2)];
        [self addChild:s_bg];

        
        [musicController initForBegin];
        beginTimer = 0;
       // [self initMenu];
        
        CCSprite* s_bg2 = [CCSprite spriteWithFile:@"cover_bg2.png"];
        [s_bg2 setPosition:ccp([UIScreen mainScreen].bounds.size.height/2, [UIScreen mainScreen].bounds.size.width/2)];
        [self addChild:s_bg2];
        
        s_free = [CCSprite spriteWithFile:@"cover_free.png"];
        
        if(isIpad){
            [s_free setPosition:ccp(935,260)];
        }else{
            [s_free setPosition:ccp(438,110)];
        }
        
        [self addChild:s_free];
        
        if(isIphone5){
            [s_free setPosition:ccp(s_free.position.x + 44, s_free.position.y)];
        }
        
        
        freeIncreaingO = true;
        freeOpacity = 60;
        [self schedule: @selector(gameStep:)];
        
       
    }
    
	return self;
}

- (void)heyzapCheckinTapped: (id)sender {
    AppController *appDelegate =(AppController*) [[UIApplication sharedApplication] delegate];
    [appDelegate setHeyTimer];
    
    [[HeyzapCocos2DSDK sharedSDK] checkin];
    //[[HeyzapCocos2DSDK sharedSDK] openLeaderboard];
}

-(void) gameStep:(ccTime) dt{
   /* UIDeviceOrientation d = [[UIDevice currentDevice] orientation];
    if(d == UIDeviceOrientationLandscapeLeft){
        printf("LEFT\n");
    }else{
        printf("RIGHT\n");
    }*/
    
   /* UIDeviceOrientation orientation = [[UIDevice currentDevice] orientation];
    if(orientation == UIDeviceOrientationLandscapeRight){
        printf("UIDeviceOrientationLandscapeRight\n");
    }
    if(orientation == UIDeviceOrientationLandscapeLeft){
        printf("UIDeviceOrientationLandscapeLeft\n");
    }*/
    
    
    beginTimer++;
    if(beginTimer == 2){
        [self initMenu];
    }
    
    if(freeIncreaingO){
            freeOpacity+=1.5;
    }else{
        freeOpacity -= 1.5;
    }
    
    
    if(freeOpacity < 60){
        freeOpacity = 60;
        freeIncreaingO = true;
    }
    
    if(freeOpacity > 300){
        freeOpacity =300;
        freeIncreaingO = false;
    }
    
    if(freeOpacity >= 255){
        [s_free setOpacity:255];
    }else{
        [s_free setOpacity:freeOpacity];
    }
}

-(void) initMenu{

    CCMenuItem *mMain = [CCMenuItemImage itemWithNormalImage:@"cover_btn_play_off.png" selectedImage:@"cover_btn_play_on.png" target:self selector:@selector(mMainCallback:)];
//    CCMenuItem *mSurvival = [CCMenuItemImage itemWithNormalImage:@"cover_btn_credits_off.png" selectedImage:@"cover_btn_credits_on.png" target:self selector:@selector(mSurvialCallback:)];
    CCMenuItem *mOption = [CCMenuItemImage itemWithNormalImage:@"cover_btn_options_off.png" selectedImage:@"cover_btn_options_on.png" target:self selector:@selector(mOptionCallback:)];
    CCMenuItem *mLeaderboard = [CCMenuItemImage itemWithNormalImage:@"cover_btn_gamecenter_off.png" selectedImage:@"cover_btn_gamecenter_on.png" target:self selector:@selector(mLeaderboardCallback:)];
    CCMenuItem *mMoreGames = [CCMenuItemImage itemWithNormalImage:@"cover_btn_moregames_off.png" selectedImage:@"cover_btn_moregames_on.png" target:self selector:@selector(mMoregamesCallback:)];
    CCMenuItem *mP4RC = [CCMenuItemImage itemWithNormalImage:@"cover_rocket_off.png" selectedImage:@"cover_rocket_on.png" target:self selector:@selector(mP4RCallback:)];

    
	[mMain setPosition:ccp(0, -106)];
//    [mSurvival setPosition:ccp(-125, -107)];
    [mOption setPosition:ccp(-200, -107)];
    [mLeaderboard setPosition:ccp(125, -107)];
    [mMoreGames setPosition:ccp(200, -107)];
//    [mP4RC setPosition:ccp(-162, 9)];
    [mP4RC setPosition:ccp(-125, -107)];
    
    if(isIpad){
        [mMain setPosition:ccp(0, -200)];
//        [mSurvival setPosition:ccp(-270, -300)];
        [mOption setPosition:ccp(-420, -250)];
        [mLeaderboard setPosition:ccp(270, -250)];
        [mMoreGames setPosition:ccp(420, -250)];
//        [mP4RC setPosition:ccp(-320, -110)];
        [mP4RC setPosition:ccp(-270, -250)];
    }

    
//	CCMenu* menu = [CCMenu menuWithItems:mMain,mOption,mLeaderboard,mMoreGames,mSurvival,mP4RC, nil];
    CCMenu* menu = [CCMenu menuWithItems:mMain,mOption,mLeaderboard,mMoreGames,mP4RC, nil];
	[self addChild:menu];
    
    
    
/*
    // Create a menu item image button
    CCMenuItem *heyzap = [CCMenuItemImage itemWithNormalImage:@"Heyzap.bundle/btn-sdk-checkin.png"
                                                selectedImage:@"Heyzap.bundle/btn-sdk-checkin-down.png"
                                                       target:self
                                                     selector:@selector(heyzapCheckinTapped:)];
    
    // Set x and y to be the position on screen where you want to place the button
    heyzap.position = ccp(350,40);
    
    // Add it to the menu (or use your existing menu instead)
    CCMenu *heyzapMenu = [CCMenu menuWithItems:heyzap, nil];
    [self addChild:heyzapMenu];
*/
    
}

-(void) mP4RCallback: (id) sender{
    [musicController playThisSound:kSound_ButtonTap isLoop:NO gain:1.0];
    [musicController playThisSound:kSound_ButtonTap2 isLoop:NO gain:0.2];
    
    [[P4RC sharedInstance] showMain];
}

-(void) mMoregamesCallback: (id) sender{
    [musicController playThisSound:kSound_ButtonTap isLoop:NO gain:1.0];
    [musicController playThisSound:kSound_ButtonTap2 isLoop:NO gain:0.2];
    
    AppController *appDelegate =(AppController*) [[UIApplication sharedApplication] delegate];
    [appDelegate showChartboostMoreApp];
    
    
/*
    ad_isDirectLoaded = true;
    AppController *appDelegate =(AppController*) [[UIApplication sharedApplication] delegate];

    [appDelegate loadLoadingViewWOTimer];
    
    [[RevMobAds session] openAdLinkWithDelegate:self];
    
    [appDelegate forceToUnblcokAD];
    
    //moreGameTimer = 0;
    if(moreGameTimer == 0){
        [self schedule: @selector(gameStepffff:)];
    }
    
    
//    ad_isClickingShowMore = true;
//    AppDelegate *appDelegate =(AppDelegate*) [[UIApplication sharedApplication] delegate];
//    [appDelegate forceToUnblcokAD];
//    [appDelegate tryLoadAD];

    
    return;
*/
    
//    if(canShownExtra == 2 || canShownExtra == 4 || YES){
//       // AppDelegate *appDelegate =(AppDelegate*) [[UIApplication sharedApplication] delegate];
//       // [appDelegate loadLeadbolt];
//        AppController *appDelegate =(AppController*) [[UIApplication sharedApplication] delegate];
//        [appDelegate loadTapjooyMarketViewController];
//        return;
//    }
    
    
//    [[CCDirector sharedDirector] replaceScene: [ADScene scene]];
}

-(void) gameStepffff:(ccTime) dt{
    moreGameTimer++;
    if(moreGameTimer == 600){
        if(ad_isDirectLoaded){
              AppController *appDelegate =(AppController*) [[UIApplication sharedApplication] delegate];
            [appDelegate removeLoadingView];
            ad_isDirectLoaded = false;
        }
        
        moreGameTimer = 0;
        [self unschedule:@selector(gameStepffff:)];
    }
}



-(void) mMainCallback: (id) sender{
    [musicController playThisSound:kSound_ButtonTap isLoop:NO gain:1.0];
    [musicController playThisSound:kSound_ButtonTap2 isLoop:NO gain:0.2];
    
    [[CCDirector sharedDirector] replaceScene: [ChosePlayScene scene]];
    //[[CCDirector sharedDirector] replaceScene: [MainMissionScene scene]];
}
-(void) mMiniCallback: (id) sender{
    return;
    
    [musicController playThisSound:kSound_ButtonTap isLoop:NO gain:1.0];
    [musicController playThisSound:kSound_ButtonTap2 isLoop:NO gain:0.2];
    [[CCDirector sharedDirector] replaceScene: [SelectMiniGameScene2 scene]];
}
-(void) mSurvialCallback: (id) sender{
    [musicController playThisSound:kSound_ButtonTap isLoop:NO gain:1.0];
    [musicController playThisSound:kSound_ButtonTap2 isLoop:NO gain:0.2];
    [[CCDirector sharedDirector] replaceScene: [CreditsScene scene]];
}
-(void) mAchivementCallback: (id) sender{
    [musicController playThisSound:kSound_ButtonTap isLoop:NO gain:1.0];
    [musicController playThisSound:kSound_ButtonTap2 isLoop:NO gain:0.2];
    achivementIsGoingToCoverScene = true;
    [[CCDirector sharedDirector] replaceScene: [AchivementScene scene]];
}
-(void) mOptionCallback: (id) sender{
    [musicController playThisSound:kSound_ButtonTap isLoop:NO gain:1.0];
    [musicController playThisSound:kSound_ButtonTap2 isLoop:NO gain:0.2];
    [[CCDirector sharedDirector] replaceScene: [OptionsScene scene]];
}
-(void) mLeaderboardCallback: (id) sender{
    [musicController playThisSound:kSound_ButtonTap isLoop:NO gain:1.0];
    [musicController playThisSound:kSound_ButtonTap2 isLoop:NO gain:0.2];
    
   /* [[HeyzapCocos2DSDK sharedSDK] openLeaderboard];
    
    AppController *appDelegate =(AppController*) [[UIApplication sharedApplication] delegate];
    [appDelegate submitAllScoreToHeyZap];*/
    
    [gameCenterController submitScore];
    [gameCenterController showLeaderboard];
}

- (void) dealloc
{
	printf("CoverScene Dealloc\n");
	[super dealloc];
}


@end
