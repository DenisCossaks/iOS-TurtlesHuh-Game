//
//  MusicController.m
//  ADoodleKart
//
//  Created by apple on 2009/12/22.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "MusicController.h"
#import "CMOpenALSoundManager.h"
#import "Global.h"
#import "AppDelegate.h"

@implementation MusicController
@synthesize soundMgr;

- (id)init {
	
	if( ! [super init] )
		return nil;

    playerSoundIdx = -1;
    

	self.soundMgr = [[[CMOpenALSoundManager alloc] init] autorelease];
	soundMgr.soundFileNames = [NSArray arrayWithObjects:@"turtleHeadOut.mp3",@"TurtleExplode01.mp3",@"TurtleExplode02.mp3",@"TurtleExplode03.mp3",@"TImeRunOut_Slow.mp3",@"TImeRunOut_Medium.mp3",@"TImeRunOut_Fast.mp3",@"ComboTime.mp3",@"CrackShell.mp3",@"ComboSmoke.mp3",@"GameOver.mp3",@"tapWrongly.mp3",@"LoseCombo.mp3", @"Arrows.mp3", @"Minesweeper2.mp3",@"MinesweeperV2.mp3", @"PenguinJump3.mp3", 
                               @"Achievement_UnLock.mp3",@"BUTTON_TAP.mp3",@"BUTTON_TAP2.mp3",@"Reward.mp3",@"Score.mp3",@"Score2.mp3",@"Turtle_Coins.mp3",@"mainThrust.mp3", @"MAINcrash.mp3"
                               , @"Diamond.mp3", @"Penguin_Hit.mp3", @"PerfectLaunch.mp3", @"RedFlame.mp3", @"YellowFlame.mp3",@"thrustBoost.mp3",
                               @"buy.mp3",@"PerfectLaunch02.mp3",nil];
	

	return self;
}

-(void) initForNull{
    [soundMgr playBackgroundMusic:@"LoseCombo.mp3" isLoop:NO];
	[soundMgr setBackgroundMusicVolume:0.0];
}

-(void) initForBegin{
	if(returnBackToSameMusic){
		returnBackToSameMusic = false;
		return;
	}
    
    if(!isMusic){
        return;
    }
    
    if(playerSoundIdx == 0){
        return;
    }
    
    playerSoundIdx = 0;
    
	
	[soundMgr playBackgroundMusic:@"begin.mp3" isLoop:YES];
	[soundMgr setBackgroundMusicVolume:0.5*musicVolumn];
}

-(void) initForPlay{
	if(returnBackToSameMusic){
		returnBackToSameMusic = false;
		return;
	}
    
    if(!isMusic){
        return;
    }
    
    if(playerSoundIdx == 1){
        return;
    }
    
    playerSoundIdx = 1;
    
    [soundMgr playBackgroundMusic:@"play.mp3" isLoop:YES];
    [soundMgr setBackgroundMusicVolume:1.0*musicVolumn];
	
}

-(void) initEndRound{
	if(returnBackToSameMusic){
		returnBackToSameMusic = false;
		return;
	}
    
    if(!isMusic){
        return;
    }
    
    if(playerSoundIdx == 2){
        return;
    }
    
    playerSoundIdx = 2;
    
    [soundMgr playBackgroundMusic:@"endRound.mp3" isLoop:NO];
    [soundMgr setBackgroundMusicVolume:1.0*musicVolumn];
	
}


-(void) initForMAINPlay{
    if(returnBackToSameMusic){
		returnBackToSameMusic = false;
		return;
	}
    
    if(!isMusic){
        return;
    }
    
    if(playerSoundIdx == 3){
        return;
    }
    
    playerSoundIdx = 3;
    
    [soundMgr playBackgroundMusic:@"mainPlay.mp3" isLoop:YES];
    [soundMgr setBackgroundMusicVolume:1.0*musicVolumn];
}

-(void) initForWind{
	if(returnBackToSameMusic){
		returnBackToSameMusic = false;
		return;
	}
    
    if(!isMusic){
        return;
    }
    
    if(playerSoundIdx == 4){
      return;
    }
    
    playerSoundIdx = 4;
    
    [soundMgr playBackgroundMusic:@"wind.mp3" isLoop:YES];
    [soundMgr setBackgroundMusicVolume:1.0*musicVolumn];
	
}





-(void) initForStore{
    if(!isMusic){
        return;
    }
    
    if(playerSoundIdx == 5){
        return;
    }
    
    playerSoundIdx = 5;
    
	[soundMgr playBackgroundMusic:@"store.mp3" isLoop:YES];
	[soundMgr setBackgroundMusicVolume:1.0*musicVolumn];
}


- (void) stopBackgroundMusic{
	//[soundMgr pauseBackgroundMusic];
    
    playerSoundIdx = -1;
    
	[soundMgr stopBackgroundMusic];
	printf("stopBackgroundMusic\n");
	//[soundMgr playBackgroundMusic:@"begin.mp3" isLoop:YES];
	//[soundMgr setBackgroundMusicVolume:0.1];
}

-(void) playThisSound:(int)_sound isLoop:(BOOL)_isLoop gain:(float)_gain{
	if(!isSound)
		return;
	//printf("playThisSound:%i\n",_sound);
	[soundMgr playSoundWithID:_sound isLoop:_isLoop withPitch:1.0 gain:_gain*soundVolumn];
}

-(void) puaseThisSound:(int)_sound{
	if(!isSound)
		return;
	
	[soundMgr pauseSoundWithID:_sound];
}

-(void) stopThisSound:(int)_sound{
	if(!isSound)
		return;
	
	[soundMgr stopSoundWithID:_sound];
}

-(void) rewindThisSound:(int)_sound{
	if(!isSound)
		return;
	
	[soundMgr rewindSoundWithID:_sound];
}

-(void) setmusicGain:(float) gain{
	//printf("gain:%4.8f\n",gain);
	[soundMgr setBackgroundMusicVolume:gain];
}



-(void) changeGain:(int)_sound gain:(float)_gain{
	//printf("changeGain:%i %4.8f\n",_sound, _gain);
	source[_sound] = [soundMgr getSourceID:_sound];
	alSourcef(source[_sound], AL_GAIN, _gain*soundVolumn);	
}


-(void) changePitchOnEngine:(float)_pitch gain:(float)_gain{
	
	if(!isSound)
		return;
	
	static int changePitchTimer = 0;
	changePitchTimer++;
	
	if(changePitchTimer%3==0){
		source[kSound_engine] = [soundMgr getSourceID:kSound_engine];
		alSourcef(source[kSound_engine], AL_PITCH, _pitch);	
		alSourcef(source[kSound_engine], AL_GAIN, _gain*soundVolumn);
		
	}
	
}

-(void) deallocMusicEngine{
    [soundMgr beginInterruption];
}

-(void) reallocaMusicEngine{
    [soundMgr endInterruption];
    
    [soundMgr playBackgroundMusic:@"store.mp3" isLoop:YES];
	[soundMgr setBackgroundMusicVolume:1.0*musicVolumn];
    
    //AppController *appDelegate =(AppController*) [[UIApplication sharedApplication] delegate];
   // [appDelegate removeADColonyViewController];
}

-(void) dealloc{
	NSLog(@"Music controller dealloc");
	[super dealloc];
}


@end
