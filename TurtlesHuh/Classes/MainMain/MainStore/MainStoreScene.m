//
//  MainStoreScene.m
//  TurtlesHuh
//
//  Created by  on 2012/6/30.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "MainStoreScene.h"
#import "Global.h"

@implementation MainStoreScene

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	MainStoreScene *layer = [MainStoreScene node];
	
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
        
    }
    
	return self;
}

- (void) dealloc
{
	printf("MainStoreScene Dealloc\n");
	[super dealloc];
}


@end
