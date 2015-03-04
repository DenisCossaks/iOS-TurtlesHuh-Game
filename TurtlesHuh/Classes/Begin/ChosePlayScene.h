//
//  ChosePlayScene.h
//  TurtlesHuh
//
//  Created by  on 2012/8/15.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface ChosePlayScene : CCLayer {
    bool canPlayMain;
    CCSprite* s_mainLocker;
}

+(CCScene *) scene;

-(void) checkIfCanPlayMain;
-(void) initMenu;

@end
