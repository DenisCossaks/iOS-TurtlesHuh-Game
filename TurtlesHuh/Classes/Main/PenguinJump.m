//
//  PenguinJump.m
//  TurtlesHuh
//
//  Created by  on 2012/5/21.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "PenguinJump.h"
#import "GamePlayGlobal.h"
#import "Penguin.h"

@implementation PenguinJump

-(void) setDelegate:(id)_delegate{
    delegate = _delegate;
}

-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
        ss_Character  = [CCSpriteBatchNode batchNodeWithFile:@"whole_turtle.png" capacity:1];
        [self addChild:ss_Character z:kDeapth_ssCharacter];
    }
	return self;
}

-(void) initShellPos{
    shellPosX = 100;
    shellPosStartX = shellPosX;
    shellDisplayX = shellPosX;
    shellPosY = 70;
    shellOffsetX = 76;
    
    penguinJumpFinalX = shellPosX;
    penguinJumpFinalY = shellPosY;
}

-(void) initCharacters{
    wholeTurtleScaleFromSocurce = 0.435;
    wholePenguinScaleFromSocurce = 0.5;
    
    for(int i = 0 ; i < howmanyTurtleShells ; i++){
        turtle[i] = [[Turtle alloc] init];
        [turtle[i] setX:10000];
        [turtle[i] setY:10000];
        [turtle[i] setStatus:kTurtleAniStatus_Normal_In];
        [turtle[i] setIdNumber:i];
       // [turtle[i] setDelegate:self];
    }
    
    penguin = [[Penguin alloc] init];
    [penguin setX:shellPosX];
    [penguin setY:shellPosY];
    [penguin setStatus:kPenguinAniStatus_Idle];
   // [penguin setDelegate:self];
}


-(void) initMenu{
    
    CCMenuItem *mLeft = [CCMenuItemImage itemWithNormalImage:@"penguinJump_btn_left_Off.png" selectedImage:@"penguinJump_btn_left_On.png" target:self selector:@selector(mLeftCallback:)];
    
	CCMenuItem *mRight = [CCMenuItemImage itemWithNormalImage:@"penguinJump_btn_left_Off.png" selectedImage:@"penguinJump_btn_left_On.png" target:self selector:@selector(mRightCallback:)];
	
    [mLeft setScaleX:-1];
	
	[mLeft setPosition:ccp(-200, -125)];
    [mRight setPosition:ccp(200, -125)];
    
	CCMenu* menu = [CCMenu menuWithItems:mRight,mLeft, nil];
	[self addChild:menu];
}

-(void) setHowmanyTurtlesAndInit:(int)_howmanyTurtles{
    howmanyTurtleShells = _howmanyTurtles;
    [self initMenu];
    [self initShellPos];
    [self initCharacters];
    [self setShellsToFinalPosition];
}

-(void) mLeftCallback: (id) sender{
    idx--;
    if(idx < 0){
        idx = 0;
    }
    
    isClickingRight = false;
    
    [self update];
}

-(void) mRightCallback: (id) sender{
    idx++;
    if(idx >= howmanyTurtleShells){
        idx = howmanyTurtleShells - 1;
    }
    
    isClickingRight = true;
    
    [self update];
}

-(void) update{
    if(isClickingRight){
        [penguin setJump:kPenguinJump_jumpTo1TurtleShell];
        [penguin setFacingRight:true];
    }else{
        [penguin setJump:kPenguinJump_jumpTo1TurtleShell];
        [penguin setFacingRight:false];
    }
    
    [self setShellsToFinalPosition];
    
    shellPosX = shellPosStartX - shellOffsetX * idx;
    
    [delegate hasTappedThisIdx:idx];
}

-(void) setShellsToFinalPosition{
    for(int i = 0 ; i < howmanyTurtleShells ; i++){
        [turtle[i] setX:shellPosX + shellOffsetX * i];
        [turtle[i] setY:shellPosY];
    }
}

-(void) manage:(ccTime) dt{
    if(shellPosX - shellDisplayX > 5){
        shellDisplayX += 8;
        if(shellDisplayX > shellPosX){
            shellDisplayX = shellPosX;
        }
    }
    if(shellDisplayX - shellPosX > 5){
        shellDisplayX -= 8;
        if(shellDisplayX < shellPosX){
            shellDisplayX = shellPosX;
        }
    }
    
    for(int i = 0 ; i < howmanyTurtleShells ; i++){
        [turtle[i] setX:shellDisplayX + shellOffsetX * i];
        [turtle[i] setY:shellPosY];
        [turtle[i] manage:dt];
    }
    
    
    [penguin manage];
    
}


@end
