//
//  Mini01.h
//  BombTheTurtle
//
//  Created by  on 2012/4/13.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "MiniBasic.h"
#import "Turtle.h"

@interface Mini01 : MiniBasic {
    Turtle* turtle[6];
    
    int shellGoingToMoment[6];
    int shellLevelGoingToMoment[6];
    
    int shell_Check[6];
}

-(void) initCharacters;
//-(void) manage;

-(void) manageRemainTapToNextStep;
-(int)genNextTargetMoment:(int)_shellStandPosition shellLevel:(int)_shellLevel NS1:(int)_NS1 NS2:(int)_NS2 NS3:(int)_NS3 NS4:(int)_NS4 NS5:(int)_NS5 NS6:(int)_NS6;

@end
