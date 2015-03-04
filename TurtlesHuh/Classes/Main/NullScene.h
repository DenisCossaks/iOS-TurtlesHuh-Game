//
//  NullScene.h
//  TurtlesHuh
//
//  Created by  on 2012/6/3.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface NullScene : CCLayer {
    int nextSceneTimer;
}

+(CCScene *) scene;

@end
