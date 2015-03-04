//
//  ADScene.m
//  TurtlesHuh
//
//  Created by  on 2012/8/16.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "ADScene.h"
#import "CoverScene.h"
#import "AppDelegate.h"
#import "Global.h"

@implementation ADScene

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	ADScene *layer = [ADScene node];
	
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
        
        self.isTouchEnabled = YES;
        
        CCSprite* s_bg = [CCSprite spriteWithFile:@"ad_bg.png"];
        [s_bg setPosition:ccp(240,160)];
        [self addChild:s_bg];

        [self initMenu];

    }
    
	return self;
}

-(void) initMenu{
    CCMenuItem *mBack = [CCMenuItemImage itemWithNormalImage:@"ScoreShown_btn_restart_off.png" selectedImage:@"ScoreShown_btn_restart_on.png" target:self selector:@selector(mBackCallback:)];
    CCMenuItem *mBuy = [CCMenuItemImage itemWithNormalImage:@"ad_btn_get_off.png" selectedImage:@"ad_btn_get_on.png" target:self selector:@selector(mBuyCallback:)];
    
    [mBack setPosition:ccp(-408/2, 246/2)];
    [mBuy setPosition:ccp(0/2, -95)];
    
	CCMenu* menu = [CCMenu menuWithItems:mBack,mBuy, nil];
	[self addChild:menu];
}

-(void) mBackCallback: (id) sender{
    [musicController playThisSound:kSound_ButtonTap isLoop:NO gain:1.0];
    [musicController playThisSound:kSound_ButtonTap2 isLoop:NO gain:0.2];
    
    [[CCDirector sharedDirector] replaceScene: [CoverScene scene]];
}

-(void) mBuyCallback: (id) sender{
    [musicController playThisSound:kSound_ButtonTap isLoop:NO gain:1.0];
    [musicController playThisSound:kSound_ButtonTap2 isLoop:NO gain:0.2];
    
    AppController *appDelegate =(AppController*) [[UIApplication sharedApplication] delegate];
    [appDelegate buyTurtleFly];
}



@end
