//
//  GameCenterController.m
//  DoodleBoy
//
//  Created by apple on 2010/9/16.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "GameCenterController.h"
#import "GameCenterManager.h"
#import "Global.h"

#import "AppDelegate.h"

@implementation GameCenterController

-(id) init
{
	if( ! [super init] )
		return nil;
    
    [self checkHasExcellentGameCenterByeByeToOpenFient];
	
	return self;
}

- (void) processGameCenterAuth: (NSError*) error{
	printf("processGameCenterAuth->\n");

	[self submitScore];
}

-(void) checkHasExcellentGameCenterByeByeToOpenFient{
	if([GameCenterManager isGameCenterAvailable])
	{
		printf("DIU YOU\n");
		gameCenterManager= [[GameCenterManager alloc] init];
		[gameCenterManager setDelegate: self];
		[gameCenterManager authenticateLocalUser];
		
		hasGameCenterSupport = true;
	}
	else
	{	printf("DOUDOU\n");
		hasGameCenterSupport = false;
	}
}

-(void) submitScore{
    
     int mini01Score;
     int mini02Score;
     int mini03Score;
     int mini04Score;
     int mini05Score;
     int mini06Score;
     int mini07Score;
     int mini08Score;
     int mini09Score;
    
    mini01Score = [[NSUserDefaults standardUserDefaults] integerForKey:@"score_mini_01"];
    mini02Score = [[NSUserDefaults standardUserDefaults] integerForKey:@"score_mini_04"];
    mini03Score = [[NSUserDefaults standardUserDefaults] integerForKey:@"score_mini_02"];
    mini04Score = [[NSUserDefaults standardUserDefaults] integerForKey:@"score_mini_03"];
    mini05Score = [[NSUserDefaults standardUserDefaults] integerForKey:@"score_mini_10"];
    mini06Score = [[NSUserDefaults standardUserDefaults] integerForKey:@"score_mini_05"];
    mini07Score = [[NSUserDefaults standardUserDefaults] integerForKey:@"score_mini_11"];
    mini08Score = [[NSUserDefaults standardUserDefaults] integerForKey:@"score_mini_13"];
    mini09Score = [[NSUserDefaults standardUserDefaults] integerForKey:@"score_mini_103"];
    
    if(mini01Score != 0){
        [gameCenterManager reportScore:mini01Score forCategory:@"grp.com.appbillionaire.rabbitandturtle.mini01"];
    }
    if(mini02Score != 0){
        [gameCenterManager reportScore:mini02Score forCategory:@"grp.com.appbillionaire.rabbitandturtle.mini02"];
    }
    if(mini03Score != 0){
        [gameCenterManager reportScore:mini03Score forCategory:@"grp.com.appbillionaire.rabbitandturtle.mini03"];
    }
    if(mini04Score != 0){
        [gameCenterManager reportScore:mini04Score forCategory:@"grp.com.appbillionaire.rabbitandturtle.mini04"];
    }
    if(mini05Score != 0){
        [gameCenterManager reportScore:mini05Score forCategory:@"grp.com.appbillionaire.rabbitandturtle.mini05"];
    }
    if(mini06Score != 0){
        [gameCenterManager reportScore:mini06Score forCategory:@"grp.com.appbillionaire.rabbitandturtle.mini06"];
    }
    if(mini07Score != 0){
        [gameCenterManager reportScore:mini07Score forCategory:@"grp.com.appbillionaire.rabbitandturtle.mini07"];
    }
    if(mini08Score != 0){
        [gameCenterManager reportScore:mini08Score forCategory:@"grp.com.appbillionaire.rabbitandturtle.mini08"];
    }
    if(mini09Score != 0){
        [gameCenterManager reportScore:mini08Score forCategory:@"grp.com.appbillionaire.rabbitandturtle.mini09"];
    }


	//printf("submitScore->%i %i %i %i %i %i %i %i\n",mini01Score, mini02Score,mini03Score,mini04Score,mini05Score,mini06Score,mini07Score,mini08Score);
	
	
	printf("end SUBMIT SCORE\n");
}

- (void) scoreReported: (NSError*) error{
//	for(NSError* detailedError in error) {
		NSLog(@"  DetailedError: %@", [error userInfo]);
//	}
	
}


- (void) showLeaderboard
{
	AppController *appDelegate =(AppController*) [[UIApplication sharedApplication] delegate];
	[appDelegate addGameCenterView];
	
	GKLeaderboardViewController *leaderboardController = [[GKLeaderboardViewController alloc] init];
    if (leaderboardController != nil)
    {
        leaderboardController.leaderboardDelegate = self;
        leaderboardController.category = nil;//self.currentLeaderBoard;
        [self presentModalViewController: leaderboardController animated: YES];
    }
}


- (void)leaderboardViewControllerDidFinish:(GKLeaderboardViewController *)viewController
{
	
	[self dismissModalViewControllerAnimated: YES];
	
	AppController *appDelegate =(AppController*) [[UIApplication sharedApplication] delegate];
	[appDelegate removeGameCenterView];
}

- (void) showAchievements
{

	AppController *appDelegate =(AppController*) [[UIApplication sharedApplication] delegate];
	[appDelegate addGameCenterView];

	GKAchievementViewController *achievements = [[GKAchievementViewController alloc] init];

	if (achievements != NULL)
	{
		achievements.achievementDelegate = self;
		[self presentModalViewController: achievements animated: YES];
	}
}

- (void)achievementViewControllerDidFinish:(GKAchievementViewController *)viewController
{
	[self dismissModalViewControllerAnimated: YES];
	 
	 AppController *appDelegate =(AppController*) [[UIApplication sharedApplication] delegate];
	 [appDelegate removeGameCenterView];
}

-(void) dealloc{
	NSLog(@"GameCenterController dealloc");
	[gameCenterManager release];
	[super dealloc];
}

@end
