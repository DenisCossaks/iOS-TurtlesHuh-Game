//
//  PenguinJump.h
//  TurtlesHuh
//
//  Created by  on 2012/5/21.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Global.h"
#import "Penguin.h"
#import "Turtle.h"

@interface PenguinJump : CCNode {
    Penguin* penguin;
    Turtle* turtle[15];
    
    int howmanyTurtleShells;
    int idx;
    
    id delegate;
    
    int shellDisplayX;
    int shellOffsetX;
    int shellPosStartX;
    int shellPosX;
    int shellPosY;
    
    bool isClickingRight;
}

-(void) setDelegate:(id)_delegate;

-(void) setHowmanyTurtlesAndInit:(int)_howmanyTurtles;

-(void) initCharacters;
-(void) initMenu;
-(void) initShellPos;

-(void) update;
-(void) manage:(ccTime) dt;

-(void) setShellsToFinalPosition;

@end
