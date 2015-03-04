//
//  InstructionScene.h
//  TurtlesHuh
//
//  Created by  on 2012/8/15.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface InstructionScene : CCLayer {
    int idx;
    int totalPage;
    
   // int fromInstruction_GoToNextIdx;  // 0 for upgradeScene , 1 for mainPlay
    
    CCSprite* s_page[7];
}

+(CCScene *) scene;

-(void) setGoToNextIdx:(int)_idx;
-(void) initMenu;

-(void) updateDisplay;

-(void) leave;

@end
