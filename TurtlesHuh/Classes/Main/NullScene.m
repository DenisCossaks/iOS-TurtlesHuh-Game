//
//  NullScene.m
//  TurtlesHuh
//
//  Created by  on 2012/6/3.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "NullScene.h"
#import "PlayScene.h"
#import "Global.h"

@implementation NullScene

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	NullScene *layer = [NullScene node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
        
        if(goToNullWithNewPlayMusic){
            goToNullWithNewPlayMusic = false;
        }else{
            returnBackToSameMusic = true;
        }
        
        nextSceneTimer = 0;
        [self schedule: @selector(gameStep:)];
        
    }
	return self;
}

-(void) gameStep:(ccTime) dt{
    nextSceneTimer++;
    if(nextSceneTimer == 30){
        [[CCDirector sharedDirector] replaceScene: [PlayScene scene]];
    }
}


- (void) dealloc
{
	printf("Null Scene Dealloc\n");
	[super dealloc];
}


@end
