//
//  BombScript.h
//  TurtlesHuh
//
//  Created by  on 2012/5/20.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface BombScript : CCNode {
    
}

-(void) manage;

-(void) manageBombAni;
-(void) manageBombComboAni;
-(void) manageBombShakeAni;
-(void) managePlusTimeAni;

@end

