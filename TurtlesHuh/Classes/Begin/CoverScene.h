//
//  CoverScene.h
//  TurtlesHuh
//
//  Created by  on 2012/6/30.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"


@interface CoverScene : CCLayer {
    CCSprite* s_free;
    float freeOpacity;
    bool freeIncreaingO;
    
    int moreGameTimer;
    int beginTimer;
}

+(CCScene *) scene;

-(void) initMenu;

@end
