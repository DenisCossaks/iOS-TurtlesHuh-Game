//
//  ADColonyViewController.h
//  TurtlesHuh
//
//  Created by apple on 12/11/27.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AdColony/AdColony.h>

@interface ADColonyViewController : UIViewController{
    UIViewController *viewController;
    
    NSTimer* fuckTimer;
    int fuckTimerTimer;    
}

@property (nonatomic, retain) UIViewController *viewController;

@end
