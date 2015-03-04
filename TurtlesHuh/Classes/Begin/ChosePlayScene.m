//
//  ChosePlayScene.m
//  TurtlesHuh
//
//  Created by  on 2012/8/15.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "ChosePlayScene.h"
#import "CoverScene.h"
#import "MainMissionScene.h"
#import "SelectMiniGameScene2.h"
#import "StoryScene.h"
#import "Global.h"
#import "AppDelegate.h"
#import "AchivementScene.h"
#import "SelectMissionGameScene.h"

@implementation ChosePlayScene

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	ChosePlayScene *layer = [ChosePlayScene node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

-(void) checkIfCanPlayMain{
    if([[NSUserDefaults standardUserDefaults] boolForKey:@"main_hasUnblocked"]){
        canPlayMain = true;
    }else{
        canPlayMain = false;
    }
    
    canPlayMain = true;
}

-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
        
        AppController *appDelegate =(AppController*) [[UIApplication sharedApplication] delegate];
        [appDelegate submitAllScoreToHeyZap];
        
        self.isTouchEnabled = YES;
        
        if(canShownExtra == 0 || canShownExtra2 == 0){
            AppController *appDelegate =(AppController*) [[UIApplication sharedApplication] delegate];
            [appDelegate reloadShowExtra];
        }
        
        
        CCSprite* s_bg = [CCSprite spriteWithFile:@"cover_bg.png"];
        [s_bg setPosition:ccp([UIScreen mainScreen].bounds.size.height/2, [UIScreen mainScreen].bounds.size.width/2)];
        [self addChild:s_bg];
           
        [self checkIfCanPlayMain];
        
        CCSprite* s_bg2 = [CCSprite spriteWithFile:@"chosenPlay_bg2.png"];
        [s_bg2 setPosition:ccp([UIScreen mainScreen].bounds.size.height/2, [UIScreen mainScreen].bounds.size.width/2)];
        [self addChild:s_bg2];
        
        
         [self initMenu];
        
        s_mainLocker = [CCSprite spriteWithFile:@"chosenPlay_locker.png"];
        [self addChild:s_mainLocker];
        if(canPlayMain){
            [s_mainLocker setPosition:ccp(10000,10000)];
        }else{
            [s_mainLocker setPosition:ccp(125,125)];
            
            if(isIpad){
                [s_mainLocker setPosition:ccp(300 ,350)];
            }
        } 

    }
    
	return self;
}

-(void) initMenu{
    CCMenuItem *mMain = [CCMenuItemImage itemWithNormalImage:@"chosenPlay_btn_maingame_off.png" selectedImage:@"chosenPlay_btn_maingame_on.png" target:self selector:@selector(mMainCallback:)];
	CCMenuItem *mMini = [CCMenuItemImage itemWithNormalImage:@"chosenPlay_btn_minigame_off.png" selectedImage:@"chosenPlay_btn_minigame_on.png" target:self selector:@selector(mMiniCallback:)];
	CCMenuItem *mBack = [CCMenuItemImage itemWithNormalImage:@"ScoreShown_btn_restart_off.png" selectedImage:@"ScoreShown_btn_restart_on.png" target:self selector:@selector(mBackCallback:)];
	CCMenuItem *mAchievement = [CCMenuItemImage itemWithNormalImage:@"ScoreShown_btn_achivement_off.png" selectedImage:@"ScoreShown_btn_achivement_on.png" target:self selector:@selector(mAchievementCallback:)];
    
    CCMenuItem *mHelp = [CCMenuItemImage itemWithNormalImage:@"cover_help.png" selectedImage:@"cover_help_on.png" target:self selector:@selector(mHelpCallback:)];
	
	[mMain setPosition:ccp(-112, -87)];
    [mMini setPosition:ccp(103, -87)];
    [mBack setPosition:ccp(-200, 122)];
    [mAchievement setPosition:ccp(-125, 122)];
    
    if(isIphone5){
        [mBack setPosition:ccp(-244, 122)];
        [mAchievement setPosition:ccp(-169, 122)];
    }
    
    if(isIpad){
        [mMain setPosition:ccp(-210, -180)];
        [mMini setPosition:ccp(190, -180)];
        [mBack setPosition:ccp(-420, 300)];
        [mAchievement setPosition:ccp(-270, 300)];
    }
    
    if(canPlayMain){
        [mHelp setPosition:ccp(10000, 90)];
    }else{
        [mHelp setPosition:ccp(0, 90)];
        
        if(isIpad){
            [mHelp setPosition:ccp(0, 120)];
        }
    }
    
    
    
	CCMenu* menu = [CCMenu menuWithItems:mMain,mMini,mBack,mAchievement,mHelp, nil];
	[self addChild:menu];

}

-(void) mHelpCallback: (id) sender{
    UIAlertView *alert = [[[UIAlertView alloc] init] autorelease];
	[alert setTitle:@""];
	[alert setMessage:@"Click the Mini Games button to play the mini-games. To unblock main game, play the last mini-game(mini-game #9) once."];
	[alert setDelegate:self];
	[alert addButtonWithTitle:@"OK"];
	[alert show];
}

-(void) mAchievementCallback: (id) sender{
    achivementIsGoingToCoverScene = true;
    [[CCDirector sharedDirector] replaceScene: [AchivementScene scene]];
}

-(void) mMainCallback: (id) sender{
    [musicController playThisSound:kSound_ButtonTap isLoop:NO gain:1.0];
    [musicController playThisSound:kSound_ButtonTap2 isLoop:NO gain:0.2];
    
   /* if(!canPlayMain){
        return;
    }
    */
    
    
    if(![[NSUserDefaults standardUserDefaults] boolForKey:@"main_hasPlayedBeginStory"]){
        storyType = 0;
        [[CCDirector sharedDirector] replaceScene: [StoryScene scene]];
    }
    else {
        [[CCDirector sharedDirector] replaceScene: [MainMissionScene scene]];
    }
    
    
    storyType = 0;
    


}

-(void) mMiniCallback: (id) sender{
    [musicController playThisSound:kSound_ButtonTap isLoop:NO gain:1.0];
    [musicController playThisSound:kSound_ButtonTap2 isLoop:NO gain:0.2];
    
    [[CCDirector sharedDirector] replaceScene: [SelectMiniGameScene2 scene]];
   // [[CCDirector sharedDirector] replaceScene: [SelectMissionGameScene scene]];
}

-(void) mBackCallback: (id) sender{
    [musicController playThisSound:kSound_ButtonTap isLoop:NO gain:1.0];
    [musicController playThisSound:kSound_ButtonTap2 isLoop:NO gain:0.2];
    
    [[CCDirector sharedDirector] replaceScene: [CoverScene scene]];
}

@end
