//
//  MainMissionCheck.h
//  TurtlesHuh
//
//  Created by  on 2012/7/12.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface MainMissionCheck : CCNode {
    
}

-(bool) checkThisMissionByPassingColIdx:(int)_colIdx;

//-(void) getMissionSentense:(int)_missionIdx;

-(bool) checkThisMission:(int)_missionIdx;

-(int) thisMissionPriceByPassingColIdx:(int)_colIdx;
-(int) thisMissionPrice:(int)_missionIdx;

@end
