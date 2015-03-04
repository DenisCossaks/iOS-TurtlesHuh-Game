//
//  SelectMiniGameScene2.m
//  TurtlesHuh
//
//  Created by  on 2012/8/15.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "SelectMissionGameScene.h"
#import "Global.h"
#import "CoverScene.h"
#import "AchivementScene.h"
#import "GamePlayGlobal.h"
#import "PlayScene.h"
#import "ScoreShownScene.h"
#import "AppDelegate.h"

@implementation SelectMissionGameScene

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	SelectMissionGameScene *layer = [SelectMissionGameScene node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

-(void) updateDisplay{
    //  printf("updateDisplay:A\n");
    
    for(int i = 0 ; i < maxTotalMiniChosen ; i++){
        if(i == idx){
            [s_selectOn setPosition:ccp(selectPosX + selectOffsetX * i,selectPosY)];
            [s_selectOff[i] setPosition:ccp(10000,100000)];
            [s_content[i] setPosition:ccp(240,169)];
            
            //printf("blockStartIdx:%i %i\n",blockStartIdx,i);
            
        }else{
            [s_selectOff[i] setPosition:ccp(selectPosX + selectOffsetX * i,selectPosY)];
            [s_content[i] setPosition:ccp(10000,100000)];
            //  printf("updateDisplay:B : %i\n",i);
        }
    }
   
    // printf("updateDisplay:C\n");
    
    currentChosenMiniGame =  idx + 103;
    
    
    
  
  }

-(void) initContent{
    s_content[0] = [CCSprite spriteWithFile:@"selectMini_content01.png"];
   
    for(int i = 0 ; i < maxTotalMissionGameChosen ; i++){
        [self addChild:s_content[i]];
        [s_content[i] setPosition:ccp(10001,100000)];
    }
    
    
    selectPosX = 382/2;
    selectPosY = 320 - 452/2 - 5;
    selectOffsetX = 15;
    
    for(int i = 0 ; i < maxTotalMissionGameChosen ; i++){
        s_selectOff[i] = [CCSprite spriteWithFile:@"selectMini_selectOff.png"];
        [self addChild:s_selectOff[i]];
        [s_selectOff[i] setPosition:ccp(10000,100000)];
    }
    
    s_selectOn = [CCSprite spriteWithFile:@"selectMini_selectOn.png"];
    [self addChild:s_selectOn];
    [s_selectOn setPosition:ccp(10000,100000)];

 
    
}

-(void) initLabels{
    
}

-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
        
        
        self.isTouchEnabled = YES;
        isPoppingUp = false;
        isShowingInstruction = false;
        [musicController initForBegin];
        
        CCSprite* s_bg = [CCSprite spriteWithFile:@"mainMission_bg.png"];
        [s_bg setPosition:ccp(240,160)];
        [self addChild:s_bg];
        
        CCSprite* s_bg2 = [CCSprite spriteWithFile:@"selectMini_bg.png"];
        [s_bg2 setPosition:ccp(240,160)];
        [self addChild:s_bg2];
        
        
        [self initContent];
        [self initMenu];
        [self initLabels];
        
        
        idx = 0;
             
        
        if(isGoingSelectMIniAfterPlay){
            isGoingSelectMIniAfterPlay = false;
            
            isTraitionDisappearing = false;
            isTransitioning = true;
            transitionGain = 0.0;
            transitionTimer = 0;
            transitionOpacity = 255;
            isGoingFromMainPlayScene = false;
            [s_transition setPosition:ccp(240,160)];
            
        }
        
        [self updateDisplay];
        
        [self initTransition];
        [self schedule: @selector(gameStep:)];
        
        
    }
	return self;
}


-(void) initMenu{
	CCMenuItem *mLeft = [CCMenuItemImage itemWithNormalImage:@"ScoreShown_btn_restartPlay_off.png" selectedImage:@"ScoreShown_btn_restartPlay_on.png" target:self selector:@selector(mLeftCallback:)];
	CCMenuItem *mRight = [CCMenuItemImage itemWithNormalImage:@"ScoreShown_btn_restartPlay_off.png" selectedImage:@"ScoreShown_btn_restartPlay_on.png" target:self selector:@selector(mRightCallback:)];
	CCMenuItem *mInstruction = [CCMenuItemImage itemWithNormalImage:@"ScoreShown_btn_instruction_off.png" selectedImage:@"ScoreShown_btn_instruction_on.png" target:self selector:@selector(mInstructionCallback:)];
	CCMenuItem *mBack = [CCMenuItemImage itemWithNormalImage:@"ScoreShown_btn_restart_off.png" selectedImage:@"ScoreShown_btn_restart_on.png" target:self selector:@selector(mBackCallback:)];
	
    [mLeft setScaleX:-1];
    
	
	[mLeft setPosition:ccp(-181, 0)];
    [mRight setPosition:ccp(181, 0)];
    [mInstruction setPosition:ccp(204, 125)];
    [mBack setPosition:ccp(-204, 125)];
    
    [mInstruction setScale:0.79];
    [mBack setScale:0.79];
    
    menu = [CCMenu menuWithItems:mLeft,mInstruction,mRight,mBack, nil];
	[self addChild:menu];
}

-(void) mLeftCallback: (id) sender{
    [musicController playThisSound:kSound_ButtonTap isLoop:NO gain:1.0];
    [musicController playThisSound:kSound_ButtonTap2 isLoop:NO gain:0.2];
    
    if(isPoppingUp || isShowingInstruction){
        return;
    }
    
    idx--;
    if(idx < 0){
        idx = maxTotalMissionGameChosen - 1;
    }
    [self updateDisplay];
}

-(void) mRightCallback: (id) sender{
    [musicController playThisSound:kSound_ButtonTap isLoop:NO gain:1.0];
    [musicController playThisSound:kSound_ButtonTap2 isLoop:NO gain:0.2];
    
    if(isPoppingUp || isShowingInstruction){
        return;
    }
    
    idx++;
    if(idx >= maxTotalMissionGameChosen){
        idx = 0;
    }
    [self updateDisplay];
}

-(void) mInstructionCallback: (id) sender{
    [musicController playThisSound:kSound_ButtonTap isLoop:NO gain:1.0];
    [musicController playThisSound:kSound_ButtonTap2 isLoop:NO gain:0.2];
    
    if(isPoppingUp || isShowingInstruction){
        return;
    }
    
    [self initInstruction];
    [self showInstruction];
    
    //  [[CCDirector sharedDirector] replaceScene: [AchivementScene scene]];
}

-(void) mBackCallback: (id) sender{
    [musicController playThisSound:kSound_ButtonTap isLoop:NO gain:1.0];
    [musicController playThisSound:kSound_ButtonTap2 isLoop:NO gain:0.2];
    
    if(isPoppingUp || isShowingInstruction){
        return;
    }
    
    [[CCDirector sharedDirector] replaceScene: [CoverScene scene]];
}


-(void) initInstruction{
    s_dot = [CCLayerColor layerWithColor:ccc4(0, 0, 0, 190)];
    [self addChild:s_dot];
    [s_dot setPosition:ccp(1000,10000)];
    
    if(idx == 0){
        s_instruction = [CCSprite spriteWithFile:@"instruction_mini01.png"];
    }

    
    [s_instruction setAnchorPoint:ccp(0.5,1.0)];
    
    [s_instruction setPosition:ccp(10000, 10000)];
    
    [self addChild:s_instruction];
}
-(void) showInstruction{
    isShowingInstruction = true;
    [s_instruction setPosition:ccp(240, 255)];
    [s_dot setPosition:ccp(0, 0)];
}

-(void) removeInstruction{
    isShowingInstruction = false;
    [self removeChild:s_instruction cleanup:YES];
    [self removeChild:s_dot cleanup:YES];
}

- (void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    //  printf("TTTDFDSSSS\n");
    
    if(isPoppingUp){
        return;
    }
    
    for( UITouch *touch in touches ) {
		CGPoint location = [touch locationInView: [touch view]];
		location = [[CCDirector sharedDirector] convertToGL: location];
        printf("TTTT:%4.8f %4.8f\n",location.x, location.y);
        
        
        if(isShowingInstruction){
            [self removeInstruction];
            
            return;
        }
        
        if(location.x > 107 && location.x < 391){
            if(location.y > 99 && location.y < 259){
                if(idx >= 1){
                    return;
                }
                
                if(isTraitionDisappearing){
                    return;
                }
                transitionTimer = 0;
                isTransitioning = true;
                isTraitionDisappearing = true;
            }
        }
        
    }
}

-(void) initTransition{
    isTransitioning = false;
    s_transition = [CCSprite spriteWithFile:@"blackDot.png"];
    [self addChild:s_transition];
    [s_transition setScaleX:260];
    [s_transition setScaleY:180];
    [s_transition setPosition:ccp(10000,100000)];
    transitionOpacity = 0;
    transitionGain = 1.0;
}

-(void) gameStep:(ccTime) dt{
    [self manageTransition];
}

-(void) manageTransition{
    if(isTransitioning){
        if(isTraitionDisappearing){
            transitionOpacity+=20;
            if(transitionOpacity >= 255){
                transitionOpacity = 255;
                isTransitioning = false;
                
                miniGameIdx = idx+103;
                [[CCDirector sharedDirector] replaceScene: [PlayScene scene]];
            }else{
                
                transitionGain -= 0.02;
                if(transitionGain < 0){
                    transitionGain = 0;
                }
                
                [musicController setmusicGain:transitionGain];
                
            }
            
            [s_transition setPosition:ccp(240,160)];
            [s_transition setOpacity:transitionOpacity];
        }else{
            transitionOpacity-=15;
            if(transitionOpacity <= 0){
                transitionOpacity = 0;
                isTransitioning = false;
            }
            
            [s_transition setPosition:ccp(240,160)];
            [s_transition setOpacity:transitionOpacity];
            
        }
        
        
    }
}

- (void) dealloc
{
	printf("SelectMissionGameScene Dealloc\n");
    // [penguinJump release];
    
	[super dealloc];
}

@end
