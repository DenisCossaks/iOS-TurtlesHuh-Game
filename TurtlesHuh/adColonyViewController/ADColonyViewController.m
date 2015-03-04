//
//  LeadboltViewController.m
//  TurtlesHuh
//
//  Created by  on 2012/7/31.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "ADColonyViewController.h"
#import "AppDelegate.h"
#import <AdColony/AdColony.h>

#import "Global.h"

@implementation ADColonyViewController

//app interrupted: called when video is played or
//banner ad is expanded
-(void)adColonyTakeoverBeganForZone:(NSString *)zone{
	NSLog(@"Video ad launched for zone %@", zone);
}

//app interruption over: called when video ad or expanded
//banner ad is dismissed
-(void)adColonyTakeoverEndedForZone:(NSString *)zone withVC:(BOOL)withVirtualCurrencyAward{
	NSLog(@"Video ad finished in zone %@", zone);
    [musicController reallocaMusicEngine];
}

- (void) adColonyVideoAdNotServedForZone:(NSString *)zone {
    NSLog(@"AdColony did not serve a video for zone %@", zone);
}


-(void) fuckDelayTimer{
    // printf("fuckDelayTimer:%i\n",fuckTimerTimer);
    fuckTimerTimer++;
    
    if(fuckTimerTimer == 1){
        printf("dealloc musicController\n");
       // [musicController deallocMusicEngine];
    }
    
    if(fuckTimerTimer == 3){
        printf("play video\n");
        
        [musicController deallocMusicEngine];
        
        [AdColony playVideoAdForZone:ADCOLONY_ZONE_ID withDelegate:nil withV4VCPrePopup:YES andV4VCPostPopup:YES];
    }
}

-(id) init{
	
	if( ! [super init] )
		return nil;
    
    fuckTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(fuckDelayTimer) userInfo:nil repeats:YES];
    fuckTimerTimer = 0;
    return self;

    
    printf("ADColonyViewController\n");
    
    
	return self;

}

- (void)dealloc {
	printf("ADColonyViewController DEALLOC\n");
    
    [super dealloc];
}

@end
