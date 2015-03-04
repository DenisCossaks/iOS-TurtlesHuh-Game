//
//  GameCenterController.h
//  DoodleBoy
//
//  Created by apple on 2010/9/16.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <GameKit/GameKit.h>

#import "GameCenterManager.h"

@class GameCenterManager;

@interface GameCenterController : UIViewController  <UIActionSheetDelegate, GKLeaderboardViewControllerDelegate, GKAchievementViewControllerDelegate, GameCenterManagerDelegate>{
	GameCenterManager* gameCenterManager;
}

-(void) checkHasExcellentGameCenterByeByeToOpenFient;

-(void) showLeaderboard;

-(void) submitScore;
-(void) showAchievements;


@end
