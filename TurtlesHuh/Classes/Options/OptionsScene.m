//
//  OptionsScene.m
//  TurtlesHuh
//
//  Created by  on 2012/7/31.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "OptionsScene.h"
#import "CoverScene.h"
#import "AppDelegate.h"
#import "Global.h"

@implementation OptionsScene

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	OptionsScene *layer = [OptionsScene node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
        
        self.isTouchEnabled = YES;
        
        AppController *appDelegate =(AppController*) [[UIApplication sharedApplication] delegate];
        [appDelegate getOptionValues];
        
        CCSprite* s_bg = [CCSprite spriteWithFile:@"cover_bg.png"];
        [s_bg setPosition:ccp([UIScreen mainScreen].bounds.size.height/2,[UIScreen mainScreen].bounds.size.width/2)];
        [self addChild:s_bg];
        
        CCSprite* s_onOff2 = [CCSprite spriteWithFile:@"options_mainWord.png"];
        [s_onOff2 setPosition:ccp([UIScreen mainScreen].bounds.size.height/2,[UIScreen mainScreen].bounds.size.width/2)];
        [self addChild:s_onOff2];
        
        [self initSelect];
        
        CCSprite* s_onOff = [CCSprite spriteWithFile:@"options_onOff.png"];
        [s_onOff setPosition:ccp([UIScreen mainScreen].bounds.size.height/2,[UIScreen mainScreen].bounds.size.width/2)];
        [self addChild:s_onOff];
        
        [self initMenu];
        
        [self changeSelect];
    }
        
	return self;
}

-(void) initMenu{
    CCMenuItem *mBack = [CCMenuItemImage itemWithNormalImage:@"ScoreShown_btn_restart_off.png" selectedImage:@"ScoreShown_btn_restart_on.png" target:self selector:@selector(mBackCallback:)];
    CCMenuItem *mReset = [CCMenuItemImage itemWithNormalImage:@"options_btn_reset_off.png" selectedImage:@"options_btn_reset_on.png" target:self selector:@selector(mResetCallback:)];

    [mBack setPosition:ccp(-408/2, 246/2)];
    [mReset setPosition:ccp(0/2, -110)];
    
    if(isIphone5){
        [mBack setPosition:ccp(mBack.position.x - 44, mBack.position.y)];
    }
    
    if(isIpad){
        [mBack setPosition:ccp(-440, 310)];
        [mReset setPosition:ccp(0/2, -110 - 100)];
    }
    
	CCMenu* menu = [CCMenu menuWithItems:mBack,mReset, nil];
	[self addChild:menu];
}

-(void) mBackCallback: (id) sender{
    [musicController playThisSound:kSound_ButtonTap isLoop:NO gain:1.0];
    [musicController playThisSound:kSound_ButtonTap2 isLoop:NO gain:0.2];
    
    [[CCDirector sharedDirector] replaceScene: [CoverScene scene]];
}

-(void) mResetCallback: (id) sender{
    UIAlertView *alert = [[[UIAlertView alloc] init] autorelease];
	[alert setTag:102];
	//[alert setTitle:@"Quit?"];
    [alert setMessage:@"Data in Main Game will be reset, while the Turtle Coins you have will still be kept. Reset data?"];
	[alert setDelegate:self];
	[alert addButtonWithTitle:@"YES"];
	[alert addButtonWithTitle:@"NO"];
	[alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
	if(buttonIndex == 0){
        [self resetData];
     }else{
     
     }
}

-(void) initSelect{
    s_select_music = [CCSprite spriteWithFile:@"options_select.png"];
    [self addChild:s_select_music];
    
    s_select_sound = [CCSprite spriteWithFile:@"options_select.png"];
    [self addChild:s_select_sound];
}

-(void) resetData{
    printf("rest data\n");
    
     //NSMutableString* achivementString = [NSMutableString string];
    
    
    
    //story
    [[NSUserDefaults standardUserDefaults] setBool:false forKey:@"main_hasPlayedBeginStory"];
    [[NSUserDefaults standardUserDefaults] setBool:false forKey:@"main_hasPlayedEndStory"];
    [[NSUserDefaults standardUserDefaults] setBool:false forKey:@"main_hasPlayedInstruction"];
    //[[NSUserDefaults standardUserDefaults] setBool:false forKey:@"main_hasUnblocked"];
    
    //missions
    [[NSUserDefaults standardUserDefaults] setInteger:0 forKey:@"currentMissionIdx_00"];
    [[NSUserDefaults standardUserDefaults] setInteger:1 forKey:@"currentMissionIdx_01"];
    [[NSUserDefaults standardUserDefaults] setInteger:2 forKey:@"currentMissionIdx_02"];
    
    for(int i = 0 ; i < maxMissions ; i++){
        
        NSString *key = [NSString stringWithFormat:@"mission_%02d", i];
       //  NSLog(key);
         [[NSUserDefaults standardUserDefaults] setBool:false forKey:key];
    }
    
    
    for(int i = 0 ; i < maxMissions ; i++){
        
        NSString *key = [NSString stringWithFormat:@"missionPlayed_%02d", i];
      //   NSLog(key);
        [[NSUserDefaults standardUserDefaults] setBool:false forKey:key];
    }
    
    //items
    for(int i = 0 ; i < maxUpgradeItems ; i++){
         NSString *key = [NSString stringWithFormat:@"upgrade_itemLevel_%02d", i];
        // NSLog(key);
        if( i == 0 || i == 1){
            [[NSUserDefaults standardUserDefaults] setInteger:1 forKey:key];
        }else{
            [[NSUserDefaults standardUserDefaults] setInteger:0 forKey:key];
        }
        
    }
}

- (void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    for( UITouch *touch in touches ) {
		CGPoint location = [touch locationInView: [touch view]];
		location = [[CCDirector sharedDirector] convertToGL: location];
        
        if(isIpad){
        
            if(location.y > -(160 - 210) * 2 + 384 && location.y < -(160 - 270) * 2 + 384){
                if(location.x > -(240 - 125) * 2 + 512 && location.x < -(240 - 260) * 2 + 512){
                    isMusic = true;
                    [self changeSelect];
                }
                if(location.x > -(240 - 260) * 2 + 512 && location.x < -(240 - 368) * 2 + 512){
                    isMusic = false;
                    [self changeSelect];
                    
                }
            }
            
            
            if(location.y > -(160 - 124) * 2 + 384 && location.y < -(160 - 178) * 2 + 384){
                if(location.x > -(240 - 125) * 2 + 512 && location.x < -(240 - 260) * 2 + 512){
                    isSound = true;
                    [self changeSelect];
                }
                if(location.x > -(240 - 260) * 2 + 512 && location.x < -(240 - 368) * 2 + 512){
                    isSound = false;
                    [self changeSelect];
                    
                }
            }
            
        }else{
            
            if(location.y > 210 && location.y < 270){
                if(location.x > 125 && location.x < 260){
                    isMusic = true;
                    [self changeSelect];
                }
                if(location.x > 260 && location.x < 368){
                    isMusic = false;
                    [self changeSelect];
                    
                }
            }
            
            
            if(location.y > 124 && location.y < 178){
                if(location.x > 125 && location.x < 260){
                    isSound = true;
                    [self changeSelect];
                }
                if(location.x > 260 && location.x < 368){
                    isSound = false;
                    [self changeSelect];
                    
                }
            }
        }
        
        
        
        
        printf("locatoin:%4.8f %4.8f\n",location.x, location.y);
    }
}

-(void) changeSelect{
    
    if(isIpad){
        if(isMusic){
            [s_select_music setPosition:ccp(-(240 - 202) * 2 + 512, -(160 - 238) * 2 + 384)];
        }else{
            [s_select_music setPosition:ccp(-(240 - 317) * 2 + 512, -(160 - 238) * 2 + 384)];
        }
        
        if(isSound){
            [s_select_sound setPosition:ccp(-(240 - 202) * 2 + 512, -(160 - 150) * 2 + 384)];
        }else{
            [s_select_sound setPosition:ccp(-(240 - 317) * 2 + 512, -(160 - 150) * 2 + 384)];
        }
        
    }else{
        if(isMusic){
            [s_select_music setPosition:ccp(202, 238)];
        }else{
            [s_select_music setPosition:ccp(317, 238)];
        }
        
        if(isSound){
            [s_select_sound setPosition:ccp(202, 150)];
        }else{
            [s_select_sound setPosition:ccp(317, 150)];
        }
        
    }
    
    
    if(isIphone5){
        [s_select_music setPosition:ccp(s_select_music.position.x + 44, s_select_music.position.y)];
        [s_select_sound setPosition:ccp(s_select_sound.position.x + 44, s_select_sound.position.y)];
    }

    
    [[NSUserDefaults standardUserDefaults] setBool:isMusic forKey:@"isMusic"];
    [[NSUserDefaults standardUserDefaults] setBool:isSound forKey:@"isSound"];
    
    [[NSUserDefaults standardUserDefaults] setBool:isMusic forKey:@"isMusic"];
    [[NSUserDefaults standardUserDefaults] setBool:isSound forKey:@"isSound"];
    
    if(isMusic){
        [musicController initForBegin];
    }else{
        [musicController stopBackgroundMusic];
    }
}

- (void) dealloc
{
	printf("Options scence Dealloc\n");
	[super dealloc];
}


@end
