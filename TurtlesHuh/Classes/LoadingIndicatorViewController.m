//
//  LoadingIndicatorViewController.m
//  TurtlesHuh
//
//  Created by apple on 12/10/17.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "LoadingIndicatorViewController.h"
#import "Global.h"

@implementation LoadingIndicatorViewController

-(id) init{
	
	if( ! [super init] )
		return nil;
    
    printf("LoadingIndicatorViewController\n");
	
    self.view.frame = CGRectMake(0, 0, 0, 0);
    
    if(p4rc_isInMiniGame){
        activityIndicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        if(isIphone5){
            activityIndicator.frame = CGRectMake(77+11, 172+210-30 + 44, 40, 40);
        }else{
            activityIndicator.frame = CGRectMake(77+11, 172+210-30, 40, 40);
        }
    }else{
        activityIndicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
        //activityIndicator.frame = CGRectMake(22, 168, 40, 40);
       
        
        if(isIphone5){
             activityIndicator.frame = CGRectMake(22, 168 + 44, 40, 40);
        }else{
             activityIndicator.frame = CGRectMake(22, 168, 40, 40);
        }
    }
    
    
   
    
    [activityIndicator startAnimating];
    
    [self.view addSubview:activityIndicator];
    
	return self;
}


- (void)dealloc {
	printf("LoadingIndicatorViewController DEALLOC\n");

    [activityIndicator release];
    
    [super dealloc];
}

@end
