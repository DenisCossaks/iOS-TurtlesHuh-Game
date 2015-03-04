//
//  StoryScene.m
//  TurtlesHuh
//
//  Created by  on 2012/8/15.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "StoryScene.h"
#import "MainMissionScene.h"
#import "Global.h"

@implementation StoryScene

-(void) setStoryType{

    if(storyType == 1){
        //begin
        s_page[0] = [CCSprite spriteWithFile:@"story_end_01.png"];
        s_page[1] = [CCSprite spriteWithFile:@"story_end_02.png"];
        s_page[2] = [CCSprite spriteWithFile:@"story_end_03.png"];
        
        totalPage = 3;

    }
    
    if(storyType == 0){
        //end
        s_page[0] = [CCSprite spriteWithFile:@"story_begin_01.png"];
        s_page[1] = [CCSprite spriteWithFile:@"story_begin_02.png"];
        s_page[2] = [CCSprite spriteWithFile:@"story_begin_03.png"];
        s_page[3] = [CCSprite spriteWithFile:@"story_begin_04.png"];
        s_page[4] = [CCSprite spriteWithFile:@"story_begin_05.png"];
        s_page[5] = [CCSprite spriteWithFile:@"story_begin_06.png"];
        s_page[6] = [CCSprite spriteWithFile:@"story_begin_07.png"];
        s_page[7] = [CCSprite spriteWithFile:@"story_begin_08.png"];
        s_page[8] = [CCSprite spriteWithFile:@"story_begin_09.png"];
        s_page[9] = [CCSprite spriteWithFile:@"story_begin_10.png"];
        
        totalPage = 10;
        
    }
    
    for(int i = 0 ; i < totalPage ; i++){
        [self addChild:s_page[i]];
        [s_page[i] setPosition:ccp(1000,10000)];
    }
    
    [self updateDisplay];
}

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	StoryScene *layer = [StoryScene node];
	
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
        
        
        CCSprite* s_bg = [CCSprite spriteWithFile:@"mainMission_bg.png"];
        [s_bg setPosition:ccp([UIScreen mainScreen].bounds.size.height/2, [UIScreen mainScreen].bounds.size.width/2)];
        [self addChild:s_bg];
        
        CCSprite* s_bg2 = [CCSprite spriteWithFile:@"story_bg.png"];
        [s_bg2 setPosition:ccp([UIScreen mainScreen].bounds.size.height/2, [UIScreen mainScreen].bounds.size.width/2 + 10)];
        [self addChild:s_bg2];
        

        idx = 0;
        
        
        [self setStoryType];
        [self initMenu];
        
    }
    
	return self;
}

-(void) initMenu{
     CCMenuItem *mRight = [CCMenuItemImage itemWithNormalImage:@"ScoreShown_btn_restartPlay_off.png" selectedImage:@"ScoreShown_btn_restartPlay_on.png" target:self selector:@selector(mRihgtCallback:)];
    CCMenuItem *mLeft = [CCMenuItemImage itemWithNormalImage:@"ScoreShown_btn_restartPlay_off.png" selectedImage:@"ScoreShown_btn_restartPlay_on.png" target:self selector:@selector(mLeftCallback:)];

    
    if (isIpad) {
        [mRight setPosition:ccp(420, 0)];
        [mLeft setPosition:ccp(-420, 0)];
        [mLeft setScaleX:-1];
    }
    else {
        [mRight setPosition:ccp(200, -125)];
        [mLeft setPosition:ccp(-200, -125)];
        [mLeft setScaleX:-1];
    }
    
    if(isIphone5){
        [mLeft setPosition:ccp(mLeft.position.x - 44, mLeft.position.y)];
         [mRight setPosition:ccp(mRight.position.x + 44, mRight.position.y)];
    }

   
	CCMenu* menu = [CCMenu menuWithItems:mRight,mLeft, nil];
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

-(void) leave{
    if(storyType == 0){
        [[NSUserDefaults standardUserDefaults] setBool:true forKey:@"main_hasPlayedBeginStory"];
        [[CCDirector sharedDirector] replaceScene: [MainMissionScene scene]];
        
    }
    if(storyType == 1){
        [[NSUserDefaults standardUserDefaults] setBool:true forKey:@"main_hasPlayedEndStory"];
        isGoingFromMainPlayScene = true;
        [[CCDirector sharedDirector] replaceScene: [MainMissionScene scene]];
    }
}


-(void) updateDisplay{
    for(int i = 0 ; i < totalPage ; i++){
        [s_page[i] setPosition:ccp(1000,10000)];
        
        if(i == idx){
            [s_page[i] setPosition:ccp([UIScreen mainScreen].bounds.size.height/2,
                                       isIpad ? 350 : 155)];
        }
    }
    
    
    
}

@end
