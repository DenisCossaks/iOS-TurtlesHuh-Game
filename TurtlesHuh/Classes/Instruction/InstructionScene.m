//
//  InstructionScene.m
//  TurtlesHuh
//
//  Created by  on 2012/8/15.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "InstructionScene.h"
#import "MainUpgradeScene.h"
#import "MainPlayScene.h"
#import "Global.h"

@implementation InstructionScene

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	InstructionScene *layer = [InstructionScene node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

-(void) setGoToNextIdx:(int)_idx{
    fromInstruction_GoToNextIdx = _idx;
}

-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
        

        
       // fromInstruction_GoToNextIdx = 0;
   
        CCSprite* s_bg = [CCSprite spriteWithFile:@"mainMission_bg.png"];
        [s_bg setPosition:ccp([UIScreen mainScreen].bounds.size.height/2,[UIScreen mainScreen].bounds.size.width/2)];
        [self addChild:s_bg];

        
   
        s_page[0] = [CCSprite spriteWithFile:@"instruction_main01.png"];
        s_page[1] = [CCSprite spriteWithFile:@"instruction_main02.png"];
        s_page[2] = [CCSprite spriteWithFile:@"instruction_main03.png"];
        s_page[3] = [CCSprite spriteWithFile:@"instruction_main04.png"];
        s_page[4] = [CCSprite spriteWithFile:@"instruction_main05.png"];
        s_page[5] = [CCSprite spriteWithFile:@"instruction_main06.png"];
        s_page[6] = [CCSprite spriteWithFile:@"instruction_main07.png"];

        totalPage = 7;
        idx = 0;
        
        for(int i = 0 ; i < 7 ; i++){
            [self addChild:s_page[i]];
            [s_page[i] setPosition:ccp(1000,10000)];
        }
        
        [self updateDisplay];

        [self initMenu];
    }
    
	return self;
}

-(void) initMenu{
    CCMenuItem *mLeft = [CCMenuItemImage itemWithNormalImage:@"ScoreShown_btn_restartPlay_off.png" selectedImage:@"ScoreShown_btn_restartPlay_on.png" target:self selector:@selector(mLeftCallback:)];
    CCMenuItem *mRight = [CCMenuItemImage itemWithNormalImage:@"ScoreShown_btn_restartPlay_off.png" selectedImage:@"ScoreShown_btn_restartPlay_on.png" target:self selector:@selector(mRihgtCallback:)];
    
    [mLeft setPosition:ccp(-200, -125)];
    [mRight setPosition:ccp(200, -125)];
    
    if(isIpad){
        [mLeft setPosition:ccp(-440, -310)];
        [mRight setPosition:ccp(440, -310)];
    }
    
    if(isIphone5){
        [mLeft setPosition:ccp(mLeft.position.x - 44, mLeft.position.y)];
        [mRight setPosition:ccp(mRight.position.x + 44, mRight.position.y)];
    }
    
    [mLeft setScaleX:-1];
    
	CCMenu* menu = [CCMenu menuWithItems:mLeft,mRight, nil];
	[self addChild:menu];
}

-(void) mLeftCallback: (id) sender{
    [musicController playThisSound:kSound_ButtonTap isLoop:NO gain:1.0];
    [musicController playThisSound:kSound_ButtonTap2 isLoop:NO gain:0.2];
    
    idx--;
    
    if(idx < 0){
        idx = 0;
    }
        
    [self updateDisplay];
}

-(void) mRihgtCallback: (id) sender{
    [musicController playThisSound:kSound_ButtonTap isLoop:NO gain:1.0];
    [musicController playThisSound:kSound_ButtonTap2 isLoop:NO gain:0.2];
    
    idx++;
    
    if(idx == totalPage){
        [self leave];
    }
    
    [self updateDisplay];
}


-(void) updateDisplay{
    for(int i = 0 ; i < 7 ; i++){
        [s_page[i] setPosition:ccp(1000,10000)];
        
        if(i == idx){
            [s_page[i] setPosition:ccp([UIScreen mainScreen].bounds.size.height/2,[UIScreen mainScreen].bounds.size.width/2)];
        }
    }
}

-(void) leave{
  /*  if(![[NSUserDefaults standardUserDefaults] boolForKey:@"main_hasPlayedInstruction"]){
        [[NSUserDefaults standardUserDefaults] setBool:true forKey:@"main_hasPlayedInstruction"];
        [[CCDirector sharedDirector] replaceScene: [MainPlayScene scene]];
        return;
    }*/
    
    [[NSUserDefaults standardUserDefaults] setBool:true forKey:@"main_hasPlayedInstruction"];
    
    printf("LEAVE\n");
    
    if(fromInstruction_GoToNextIdx == 0){
        printf("BBBBBB\n");
        [[CCDirector sharedDirector] replaceScene: [MainUpgradeScene scene]];
    }
    if(fromInstruction_GoToNextIdx == 1){
        printf("AAAAAAA\n");
        [[CCDirector sharedDirector] replaceScene: [MainPlayScene scene]];
    }
}

- (void) dealloc
{
	printf("InstructionScene scence Dealloc\n");
	[super dealloc];
}


@end
