//
//  LoadingViewController.m
//  TurtlesHuh
//
//  Created by apple on 12/10/12.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "LoadingViewController.h"
#import "Global.h"

@implementation LoadingViewController

-(id) init{
	
	if( ! [super init] )
		return nil;
    
    printf("LOADING\n");
	
    
    viewV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
	viewV.backgroundColor  = [UIColor colorWithRed: 0.0 green: 0.0 blue: 0.0 alpha:0.75];
    
    self.view = viewV;
    
    activityIndicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    activityIndicator.frame = CGRectMake(140, 220, 40, 40);
    
    if(isIphone5){
        activityIndicator.frame = CGRectMake(140, 264, 40, 40);
    }
    
    [activityIndicator startAnimating];
    
    [self.view addSubview:activityIndicator];

	return self;
}


- (void)dealloc {
	printf("LoadingViewController DEALLOC\n");
    
    [viewV release];
    [activityIndicator release];
    
    [super dealloc];
}


@end
