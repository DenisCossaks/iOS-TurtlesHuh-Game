//
//  StoryScene.h
//  TurtlesHuh
//
//  Created by  on 2012/8/15.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

typedef enum{
    kStory_begin = 0,
    kStory_end,
}eStoryType;

@interface StoryScene : CCLayer {
    int idx;
    int totalPage;
    
    //int storyType;

    CCSprite* s_page[15];

}

+(CCScene *) scene;

-(void) setStoryType;
-(void) initMenu;

-(void) leave;

@end
