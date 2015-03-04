//
//  Mini12.m
//  TurtlesHuh
//
//  Created by  on 2012/6/14.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "Mini12.h"
#import "GamePlayGlobal.h"
#import "Global.h"

@implementation Mini12

-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
        
              
        s_bg = [CCSprite spriteWithFile:@"mini_01_bg.png"];
        [s_bg setPosition:ccp(240,160)];
		[self addChild:s_bg];
        
        // wholeTurtleScaleFromSocurce = 0.25;
		wholeTurtleScaleFromSocurce = 0.8;
      
        [self initCharacters];
        
    }
	return self;
}

-(void) initCharacters{
    turtle = [[Turtle alloc] init];
    
    [turtle setX:240];
    [turtle setY:80];
    [turtle setStatus:kTurtleAniStatus_Out];

    [turtle setBombOutType:kTurtleBombOutType_bombOutOffScreenWithGravity];
    [turtle setDelegate:self];
    [turtle setIdNumber:0];

}

-(void) manage:(ccTime) dt{
    [turtle manage:dt];
    [turtle manageYellowHurt];
    [self runTurtleAI];
}

- (void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [super ccTouchesBegan:touches withEvent:event];
    
    if(isTapWronglyAndDisableBtns){
        return;
    }
    
    if(isStopping){
        return;
    }
    

	for( UITouch *touch in touches ) {
		CGPoint location = [touch locationInView: [touch view]];
		location = [[CCDirector sharedDirector] convertToGL: location];
        
        [self fuckTurtle];
    }
}

-(void) fuckTurtle{
    [turtle setYellowHurt];
    [playLayer setToShakingBomb:[turtle x] turtleY:[turtle y]];
    
    if(arc4random() % 8 == 0){
        [musicController playThisSound:kSound_CrackShell isLoop:NO gain:1.0];
    }else{
        [musicController playThisSound:kSound_ComboSmoke isLoop:NO gain:0.5];
    }
    
}

-(void) runTurtleAI{
    if([turtle status] == kTurtleAniStatus_Normal_Out){
        if(arc4random() % 50 == 0){
            if(arc4random() % 10 == 0){
                
            }else{
                [turtle setStatus:kTurtleAniStatus_Idle];
            }
        }
    }
    
}

- (void) dealloc
{
	printf("Mini 12 Dealloc\n");
    
    [turtle release];
    
	[super dealloc];
}

@end
