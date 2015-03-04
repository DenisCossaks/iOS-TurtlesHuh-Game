//
//  MainTurtlePhycis.h
//  TurtlesHuh
//
//  Created by  on 2012/7/14.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

#define rads 0.017453

@interface MainTurtlePhycis : CCNode {
    float randomRotationForce;
    bool isRunningRandomRotation;
    int runningRandomRotationTimer;
    int nextRunningRandomRotationTime;
    int runForHowLong;
    
    int isInAttackAngleTimer;
}

-(void) runJump:(float)jumpAngle force:(float)_force;
-(void) runGlide;
-(void) runRandomRotation;
-(void) runRoateAfterCannonShot:(int)_playFlightTim;
-(void) runRotate:(bool)_isLeft acceX:(float)_acceX;
-(void) applyBoost:(float)_power;
-(void) initUpgradeLevels;

@end
