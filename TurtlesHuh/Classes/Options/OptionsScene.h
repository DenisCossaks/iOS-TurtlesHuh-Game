//
//  OptionsScene.h
//  TurtlesHuh
//
//  Created by  on 2012/7/31.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface OptionsScene : CCLayer <UIAlertViewDelegate>{
    CCSprite* s_select_music;
    CCSprite* s_select_sound;
}

+(CCScene *) scene;

-(void) initMenu;
-(void) initSelect;

-(void) resetData;

-(void) changeSelect;

@end
