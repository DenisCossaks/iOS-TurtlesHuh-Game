//
//  MusicController.h
//  ADoodleKart
//
//  Created by apple on 2009/12/22.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <OpenAL/al.h>
#import <OpenAL/alc.h>

enum mySoundIds {
	kSound_TurtleHeadOut,
    kSound_TurtleExplode01,
    kSound_TurtleExplode02,
    kSound_TurtleExplode03,
    kSound_TimeRunOutSlow,
    kSound_TimeRunOutMedium,
    kSound_TimeRunOutFast,
    kSound_ComboTime,
    kSound_CrackShell,
    kSound_ComboSmoke,
    kSound_GameOver,
    kSound_TapWrongly,
    kSound_LoseCombo,
    kSound_Arrows,
    kSound_Minesweeper,
    kSound_MinesweeperV2,
    kSound_PenguinJump,
    kSound_AchivementUnlock,
    kSound_ButtonTap,
    kSound_ButtonTap2,
    kSound_Reward,
    kSound_Score,
    kSound_Score2,
    kSound_TurtleCoinsGain,
    kSound_engine,
    kSound_MAINCrash01,
    kSound_Diamond,
    kSound_PenguinHit,
    kSound_PerfectLaunch,
    kSound_RedFlame,
    kSound_YellowFlame,
    kSound_ThurstBoost,
    kSound_Buy,
    kSound_PerfectLaunch02,
};



@class CMOpenALSoundManager;

#define kMaxSoundInThisShxtGame 39

@interface MusicController : NSObject {
	CMOpenALSoundManager *soundMgr;
	ALint source[kMaxSoundInThisShxtGame];
    
    int playerSoundIdx;
}

@property (nonatomic, retain) CMOpenALSoundManager *soundMgr;


-(void) initForBegin;
-(void) initForPlay;
-(void) initEndRound;
-(void) initForShop;
-(void) initForStore;
-(void) initForNull;
-(void) initForWind;

-(void) initForMAINPlay;

-(void) playThisSound:(int)_sound isLoop:(BOOL)_isLoop gain:(float)_gain;
-(void) puaseThisSound:(int)_sound;
-(void) stopThisSound:(int)_sound;
-(void) rewindThisSound:(int)_sound;

- (void) stopBackgroundMusic;
-(void) setmusicGain:(float) gain;

-(void) changeGain:(int)_sound gain:(float)_gain;

-(void) changePitchOnEngine:(float)_pitch gain:(float)_gain;

-(void) deallocMusicEngine;
-(void) reallocaMusicEngine;


@end
