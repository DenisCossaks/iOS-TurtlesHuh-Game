//
//  CreditsScene.m
//  TurtlesHuh
//
//  Created by  on 2012/8/15.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "CreditsScene.h"
#import "CoverScene.h"
#import "MusicController.h"
#import "Global.h"

@implementation CreditsScene

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	CreditsScene *layer = [CreditsScene node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

- (void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    for( UITouch *touch in touches ) {
		CGPoint location = [touch locationInView: [touch view]];
		location = [[CCDirector sharedDirector] convertToGL: location];
        printf("l:%4.8f %4.8f\n", location.x , location.y);
    }
}

-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
        
        self.isTouchEnabled = YES;

        CCSprite* s_bg = [CCSprite spriteWithFile:@"cover_bg.png"];
        [s_bg setPosition:ccp([UIScreen mainScreen].bounds.size.height/2,[UIScreen mainScreen].bounds.size.width/2)];
        [self addChild:s_bg];
        

        CCSprite* s_bg2 = [CCSprite spriteWithFile:@"credit_bg.png"];
        [s_bg2 setPosition:ccp(554/2,342/2)];
        
        if(isIpad){
            [s_bg2 setPosition:ccp([UIScreen mainScreen].bounds.size.height/2,[UIScreen mainScreen].bounds.size.width/2)];
        }
        
        [self addChild:s_bg2];
        
        [self initMenu];

    }
    
	return self;
}


-(void) initMenu{
    CCMenuItem *mBack = [CCMenuItemImage itemWithNormalImage:@"ScoreShown_btn_restart_off.png" selectedImage:@"ScoreShown_btn_restart_on.png" target:self selector:@selector(mBackCallback:)];
     
    [mBack setPosition:ccp(-408/2, 246/2)];

    if(isIphone5){
        [mBack setPosition:ccp(mBack.position.x - 44, mBack.position.y)];
    }
    
    if(isIpad){
        [mBack setPosition:ccp(-440, 310)];
    }

    
	CCMenu* menu = [CCMenu menuWithItems:mBack, nil];
	[self addChild:menu];
}

-(void) mBackCallback: (id) sender{
    [musicController playThisSound:kSound_ButtonTap isLoop:NO gain:1.0];
    [musicController playThisSound:kSound_ButtonTap2 isLoop:NO gain:0.2];
    
    [[CCDirector sharedDirector] replaceScene: [CoverScene scene]];
}

@end
