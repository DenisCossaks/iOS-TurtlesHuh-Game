//
//  MiniBasic.m
//  BombTheTurtle
//
//  Created by  on 2012/4/13.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "MiniBasic.h"
#import "GamePlayGlobal.h"
#import "Global.h"
#import "SelectMiniGameScene2.h"


@implementation MiniBasic

-(void) fuckfuck{

}

-(void) initAchivementIdx{
    
}

-(void) initControlLayer{
   /* if(currentChosenMiniGame == 1){
        currentAchivementIdx[0] = 1;
        currentAchivementIdx[1] = 2;
        currentAchivementIdx[2] = 3;
        currentAchivementIdx[3] = 4;
    }
    if(currentChosenMiniGame == 2){
        currentAchivementIdx[0] = 5;
        currentAchivementIdx[1] = 6;
        currentAchivementIdx[2] = 7;
        currentAchivementIdx[3] = 8;
    }
    if(currentChosenMiniGame == 3){
        currentAchivementIdx[0] = 9;
        currentAchivementIdx[1] = 10;
        currentAchivementIdx[2] = 11;
        currentAchivementIdx[3] = 12;
    }
    if(currentChosenMiniGame == 4){
        currentAchivementIdx[0] = 13;
        currentAchivementIdx[1] = 14;
        currentAchivementIdx[2] = 15;
        currentAchivementIdx[3] = 16;
    }
    if(currentChosenMiniGame == 5){
        currentAchivementIdx[0] = 17;
        currentAchivementIdx[1] = 18;
        currentAchivementIdx[2] = 19;
        currentAchivementIdx[3] = 20;
    }*/
}

-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
         self.isTouchEnabled = YES;
        
        comoboReduceSpeed = 0.002;
        comboReduceSpeedAccum = 0;
        counterForAchivement = 0;
        
        isTapWronglyAndDisableBtns = false;
        isFuckingShootFirstTime = false;
        
        gameLevel = 0;
        gameRound = 0;
        
        remainTapToNextRound = 1;
        numberTapToNextRound = 1;
        
        isFuxking = false;
        
        [self initMoments];
        [self initComboColorLimit];
        
        [uILayer setDelegate:self];
        
    }
	return self;
}

-(void) initComboColorLimit{

}

-(void) initCharacters{

}

-(void) initMoments{
    maxMoment = 10;
    for(int i = 0 ; i < maxMoment ; i++){
        momentRunTime[i] = -9999;
    }
}

-(void) manage:(ccTime) dt{

}

-(void) getScript{

}

-(void) finishOneRound{
    printf("mini basic\n");
    gameRound++;
}

-(void) manageMini04Type:(ccTime) dt{
    newestMomentHasAppearedTime += dt;
    
   // printf("managemini04Type:%4.8f %4.8f\n",newestMomentHasAppearedTime,nextMomentAppearTime);
    
    if(newestMomentHasAppearedTime >= nextMomentAppearTime){
       // printf("GiveNetMoent:%4.8f %4.8f\n",newestMomentHasAppearedTime,nextMomentAppearTime);
        [self giveNextMoment];
    }
    
    for(int i = 0 ; i < maxMoment ; i++){
        momentRunTime[i] += dt;
         //printf("TTTTTTmomentRunTime:%i %4.8f %4.8f\n",i,momentRunTime[i],momentOverTime[i]);
        if(momentRunTime[i] > momentOverTime[i]){
           // printf("momentRunTime:%i %4.8f %4.8f\n",i,momentRunTime[i],momentOverTime[i]);
            if(!hasNoticedOverTime[i]){
                hasNoticedOverTime[i] = true;
                momentRunTime[i] = -9999;
                [self thisMomentOverTime:i];
            }
        }
    }
}

-(void) thisMomentOverTime:(int)_momentIdx{
    
}

-(void) giveNextMoment{

}

-(void) turtleBombed:(int)_momentIdx{
   // printf("turtle Bomboed:%i\n",_momentIdx);
    hasNoticedOverTime[_momentIdx] = true;
    momentRunTime[_momentIdx] = -9999;
    
    remainTapToNextRound--;
    if(remainTapToNextRound == 0){
        comboRemain = 1;
    }
    
}
- (void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
   // printf("SDFSDFDSFSDFDSFDSFSDFSDFDSn");
    
    for( UITouch *touch in touches ) {
		CGPoint location = [touch locationInView: [touch view]];
		location = [[CCDirector sharedDirector] convertToGL: location];
       // printf("SDFSDFDSFSDFDSFDSFSDFSDFDS:%4.8f %4.8f\n",location.x, location.y);
        
        int stopX;
        int stopY;
        
        if(isIpad){
            stopX = 900;
            stopY = 550;
        }else{
            stopX = 418;
            stopY = 258;
        }
        
        if(!isStopping){
            if(location.x > stopX){
                if(location.y > stopY){
                    isStopping = true;
                    isFuckingShootFirstTime = true;
                    [uILayer showMenu];
                    
                    if(currentChosenMiniGame == 11){
                        isTapWronglyAndDisableBtns = true;
                    }
                }
            }
        }else{
           // printf("SDFSDFDSFSDFDSFDSFSDFSDFDS:%4.8f %4.8f\n",location.x, location.y);
            
            if(isShowingInstruction){
                [playLayer removeInstruction];
            }
            
            if(isShowingMenu){
                
                if(isIpad){
                    if(location.x > 212 && location.x < 812){
                        if (location.y > 550){
                            [playLayer showInstruction];
                        }else if (location.y > 400){
                            [uILayer removeMenu];
                        }else if (location.y > 250){
                            [uILayer removeMenu];
                            [playLayer gotoRestart];
                        }else{
                            [musicController stopBackgroundMusic];
                            [[CCDirector sharedDirector] replaceScene: [SelectMiniGameScene2 scene]];
                        }
                    }
                    
                }else{
                    
                    if(location.x > 101 && location.x < 400){
                        if (location.y > 239){
                            [playLayer showInstruction];
                        }else if (location.y > 153){
                            [uILayer removeMenu];
                        }else if (location.y > 83){
                            [uILayer removeMenu];
                            [playLayer gotoRestart];
                        }else{
                            [musicController stopBackgroundMusic];
                            [[CCDirector sharedDirector] replaceScene: [SelectMiniGameScene2 scene]];
                        }
                    }
                }
                
                
            }
            
           
            
        }
        
       
        
    }
}

-(void) tapWrongly{
  //  printf("tapWronglytapWronglytapWronglytapWronglytapWronglytapWronglytapWronglytapWronglytapWrongly\n");
    
    newestMomentHasAppearedTime = nextMomentAppearTime - 1.2;
    
    gameRound-=1;
    if(gameRound < 0){
        gameRound = 0;
    }
    
    remainTapToNextRound = 0;
    isFuxking = true;
}

-(void) updateGameLevel{

}

-(void) comboLost{
  //  printf("mini basic combo lost\n");
    return;
    
    for(int i = 0 ; i < maxMoment ; i++){
        if( momentRunTime[i] > 0){
            momentRunTime[i] = -9999;
            [self thisMomentOverTime:i];
        }
    }
}

-(void) thisTurtleIsBombOutOffScreen:(int)_turtleIdx{

}

-(void) btnIsTappedInControlLayer:(int)_btnIdx{

}

-(void) btnIsReleasedInControlLayer:(int)_btnIdx{

}

-(void) restart{
    comboReduceSpeedAccum = 0;
    [self updateGameLevel];
}

-(void) cannonShootBall:(int)_fromId{

}

-(void) reInitColorComboLimit{

}

-(void) beforeLoseComboWhenComboRemainGoesToZero{

}

@end
