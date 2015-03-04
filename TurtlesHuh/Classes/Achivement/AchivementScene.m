//
//  AchivementScene.m
//  TurtlesHuh
//
//  Created by  on 2012/5/21.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "AchivementScene.h"
#import "GamePlayGlobal.h"
#import "AppDelegate.h"
#import "CoverScene.h"
#import "MainStoreScene.h"
#import "SelectMiniGameScene2.h"
#import "MainUpgradeScene.h"
#import "Global.h"

@implementation AchivementScene

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	AchivementScene *layer = [AchivementScene node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

-(void) initMenu{
    CCMenuItem *mLeft = [CCMenuItemImage itemWithNormalImage:@"penguinJump_btn_left_Off.png" selectedImage:@"penguinJump_btn_left_On.png" target:self selector:@selector(mLeftCallback:)];
    
	CCMenuItem *mRight = [CCMenuItemImage itemWithNormalImage:@"penguinJump_btn_left_Off.png" selectedImage:@"penguinJump_btn_left_On.png" target:self selector:@selector(mRightCallback:)];
    
    CCMenuItem *mMenu = [CCMenuItemImage itemWithNormalImage:@"ScoreShown_btn_restart_off.png" selectedImage:@"ScoreShown_btn_restart_on.png" target:self selector:@selector(mMenuCallback:)];

	
    [mLeft setScaleX:-1];
	
	[mLeft setPosition:ccp(-200, -125)];
    [mRight setPosition:ccp(200, -125)];
    [mMenu setPosition:ccp(-206, 125)];
    
    if(isIphone5){
        [mLeft setPosition:ccp(mLeft.position.x - 44, mLeft.position.y)];
        [mRight setPosition:ccp(mRight.position.x + 44, mRight.position.y)];
        [mMenu setPosition:ccp(mMenu.position.x - 44, mMenu.position.y)];
    }

    if(isIpad){
        [mLeft setPosition:ccp(-420, -310)];
        [mRight setPosition:ccp(420, -310)];
        [mMenu setPosition:ccp(-440, 310)];
        
    }
    
    
    [mMenu setScale:0.79];
    
	CCMenu* menu = [CCMenu menuWithItems:mRight,mLeft,mMenu, nil];
	[self addChild:menu];

}

-(void) mMenuCallback: (id) sender{
    [musicController playThisSound:kSound_ButtonTap isLoop:NO gain:1.0];
    [musicController playThisSound:kSound_ButtonTap2 isLoop:NO gain:0.2];
    
    if(isPoppingUp){
        return;
    }
    
    if(achivementIsGoingToCoverScene){
        achivementIsGoingToCoverScene = false;
        [[CCDirector sharedDirector] replaceScene: [CoverScene scene]];
        return;
    }
    
    if(achivementIsGoingToStoreScene){
        achivementIsGoingToStoreScene = false;
        [[CCDirector sharedDirector] replaceScene: [MainUpgradeScene scene]];
        return;
    }
    
    if(achivementIsGoingToSelectMiniScene){
        achivementIsGoingToSelectMiniScene = false;
        [[CCDirector sharedDirector] replaceScene: [SelectMiniGameScene2 scene]];
        return;
    }
}

-(void) mLeftCallback: (id) sender{
    [musicController playThisSound:kSound_ButtonTap isLoop:NO gain:1.0];
    [musicController playThisSound:kSound_ButtonTap2 isLoop:NO gain:0.2];
    
    if(isPoppingUp){
        return;
    }
    
    pageIdx--;
    if(pageIdx < 0){
        pageIdx = 0;
        return;
    }
    
    [penguin setFacingRight:false];
    penguinJumpFinalX = shellPosX[pageIdx];
    penguinJumpFinalY = shellPosY;
    [penguin setJump:kPenguinJump_jumpTo1TurtleShell];
    
    [self updatePage];
}

-(void) mRightCallback: (id) sender{
    [musicController playThisSound:kSound_ButtonTap isLoop:NO gain:1.0];
    [musicController playThisSound:kSound_ButtonTap2 isLoop:NO gain:0.2];
    
    if(isPoppingUp){
        return;
    }
    
    pageIdx++;
    if(pageIdx >= maxPage){
        pageIdx = maxPage - 1;
        return;
    }
    
    [penguin setFacingRight:true];
    penguinJumpFinalX = shellPosX[pageIdx];
    penguinJumpFinalY = shellPosY;
    [penguin setJump:kPenguinJump_jumpTo1TurtleShell];
    
    [self updatePage];
}

-(void) updatePage{
    iconStartIdx = pageIdx * numberIconShownAtOnePage;
    
    for(int i = 0 ; i < totalAcheivements ; i++){
        [s_achivementIcons[i] setPosition:ccp(1000,10000)];
      //   [s_achivementIcons_bg[i] setPosition:ccp(1000,10000)];
    }
    
    iconPageMovemnetFinalX = -iconPageOffsetX * pageIdx;
    
}

-(void) getValuesFromDB{
    return;
   /* NSMutableString* achivementString = [NSMutableString string];
    for(int i = 0 ; i < totalAcheivements ; i++){
        
        [achivementString setString:@"achivement_"];
        
        if(i < 9){
            [achivementString appendString:@"0"];
        }
        
        [achivementString appendFormat:@"%i", i+1];
        
        // NSLog(achivementString);
        achivementHasUnblocked[i] = [[NSUserDefaults standardUserDefaults] boolForKey:achivementString];
        
    }*/
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
        
        //FOR CORRECT DISPLAY
        isPlayingMiniGame = true;
    
        
        AppController *appDelegate =(AppController*) [[UIApplication sharedApplication] delegate];
        [appDelegate getAchivementValues];
        
        isPoppingUp = false;
        self.isTouchEnabled = YES;
        
        CCSprite* s_bg = [CCSprite spriteWithFile:@"Achievement_bg.png"];
        [s_bg setPosition:ccp([UIScreen mainScreen].bounds.size.height/2,[UIScreen mainScreen].bounds.size.width/2)];
        [self addChild:s_bg];
        
        //ss_Achievement  = [CCSpriteBatchNode spriteSheetWithFile:@"AchievementIcons_Texture.png" capacity:1];
       // [self addChild:ss_Achievement z:kDeapth_ssCharacter];
        
         totalAcheivements = maxAchivements;
        iconPageMovemnetX = 0;
        iconPageMovemnetFinalX = 0;
        
       // printf("KKK\n");
        [self getValuesFromDB];
        [self initIcons];
        [self initCharacter];
        [self initMenu];
        [self updatePage];
        [self initAchivementPopup];
        
        removePopupTimer = 0;
        isPreparingRemovePopup = false;
        [self schedule: @selector(gameStep:)];
       // printf("CCCKKK\n");

        
    }
	return self;
}

-(void) showAchivementPopup{
    isPoppingUp = true;
    
    if(generalAchviementPosIdx < 6){
        isShowingFirstRowAchivement = true;
    }else{
        isShowingFirstRowAchivement = false;
    }
    
    [achivementPopup setX:240];
    if(isShowingFirstRowAchivement){
        [achivementPopup setY:190];
    }else{
        [achivementPopup setY:130];
    }
    
    if(isIphone5){
        [achivementPopup setX:284];
    }
    
    if(isIpad){
        [achivementPopup setX:240 * 1024.0/480.0];
        if(isShowingFirstRowAchivement){
            [achivementPopup setY:190 * 768.0/320.0 + 20];
        }else{
            [achivementPopup setY:130 * 768.0/320.0 + 45];
        }
    }
    
    printf("show generalAchviementPosIdx:%i\n",generalAchviementPosIdx);
    [achivementPopup popupAchivementDetails:achivementSelectIdx arrowIsUp:true arrowX:iconPosX[generalAchviementPosIdx]-235 * 2/textureRatioForFuckingIpad];
}

-(void) removePopup{
    removePopupTimer = 0;
    isPreparingRemovePopup = true;
}

-(void) initAchivementPopup{
    achivementPopup = [AchivementPopup node];
    [self addChild:achivementPopup];
    [achivementPopup setDelegate:self];
}

-(void) initIcons{
    int fuckIconStartX;
    int fuckIconStartY;
    int fuckIconOffsetY;
    int fuckIconOffsetX;
    
      fuckIconStartX = 100;
      fuckIconStartY = 263;
      fuckIconOffsetY = -60;
      fuckIconOffsetX = 56;

    if(isIphone5){
        fuckIconStartX += 44;
    }
    
    if(isIpad){
        fuckIconStartX = 100 * 1024.0/480.0;
        fuckIconStartY = 263 * 768.0/320.0;
        fuckIconOffsetY = -60 * 2;
        fuckIconOffsetX = 56 * 2;
    }
    
    iconPosX[0] = fuckIconStartX;
    iconPosX[1] = fuckIconStartX + fuckIconOffsetX * 1;
    iconPosX[2] = fuckIconStartX + fuckIconOffsetX * 2;
    iconPosX[3] = fuckIconStartX + fuckIconOffsetX * 3;
    iconPosX[4] = fuckIconStartX + fuckIconOffsetX * 4;
    iconPosX[5] = fuckIconStartX + fuckIconOffsetX * 5;
    
    iconPosX[6] = fuckIconStartX;
    iconPosX[7] = fuckIconStartX + fuckIconOffsetX * 1;
    iconPosX[8] = fuckIconStartX + fuckIconOffsetX * 2;
    iconPosX[9] = fuckIconStartX + fuckIconOffsetX * 3;
    iconPosX[10] = fuckIconStartX + fuckIconOffsetX * 4;
    iconPosX[11] = fuckIconStartX + fuckIconOffsetX * 5;
    
    iconPosY[0] = fuckIconStartY;
    iconPosY[1] = fuckIconStartY;
    iconPosY[2] = fuckIconStartY;
    iconPosY[3] = fuckIconStartY;
    iconPosY[4] = fuckIconStartY;
    iconPosY[5] = fuckIconStartY;
    
    iconPosY[6] = fuckIconStartY + fuckIconOffsetY;
    iconPosY[7] = fuckIconStartY + fuckIconOffsetY;
    iconPosY[8] = fuckIconStartY + fuckIconOffsetY;
    iconPosY[9] = fuckIconStartY + fuckIconOffsetY;
    iconPosY[10] = fuckIconStartY + fuckIconOffsetY;
    iconPosY[11] = fuckIconStartY + fuckIconOffsetY;
    
    
    pageIdx = 0;
    iconStartIdx = 0;
    numberIconShownAtOnePage = 12;
    maxPage = 4;
    
    int shellDiff;
    shellDiff = 77;
    
    int iPhone5Offset;
    if(isIphone5){
        iPhone5Offset = 44;
    }else{
        iPhone5Offset = 0;
    }
    
    if(isIpad){
        shellDiff *= 2;
    }

    shellPosX[0] = 120 * 2/textureRatioForFuckingIpad;
    if(isIpad){
        shellPosX[0] += 30;
    }
    shellPosX[1] =  shellPosX[0] + shellDiff + iPhone5Offset;
    shellPosX[2] =  shellPosX[0] + shellDiff*2 + iPhone5Offset;
    shellPosX[3] =  shellPosX[0] + shellDiff*3 + iPhone5Offset;
    shellPosX[4] =  shellPosX[0] + shellDiff*4 + iPhone5Offset;
    
    shellPosY = 88*2/textureRatioForFuckingIpad;


    
    for( int i = 0 ; i < totalAcheivements ; i++){
        if(hasFinishedThisAchivements[i]){
           NSString *key = [NSString stringWithFormat:@"icon_Achievement_%02d.png", i+1];
            s_achivementIcons[i] = [CCSprite spriteWithFile:key];
          //  s_achivementIcons_bg[i] = [CCSprite spriteWithFile:@"AchievementIcon_unblockedBg.png"];
        }else{
            s_achivementIcons[i] = [CCSprite spriteWithFile:@"icon_Achievement_unblock.png"];
         //   s_achivementIcons_bg[i] = [CCSprite spriteWithFile:@"AchievementIcon_blockedBg.png"];
        }
        
        [self addChild:s_achivementIcons[i]];
      //  [self addChild:s_achivementIcons_bg[i]];
        
        [s_achivementIcons[i] setPosition:ccp(10000,10000)];
       // [s_achivementIcons_bg[i] setPosition:ccp(10000,10000)];

    }
}

-(void) initCharacter{
    ss_Character  = [CCSpriteBatchNode batchNodeWithFile:@"whole_turtle.png" capacity:1];
    [self addChild:ss_Character];
    
    wholePenguinScaleFromSocurce = 0.5;
    
    printf("penguin has init\n");
    penguin = [[Penguin alloc] init];
    [penguin setX:shellPosX[pageIdx]];
    [penguin setY:shellPosY];
    [penguin setStatus:kPenguinAniStatus_Idle];
    [penguin setIsNotInGame:true];
}

-(void) gameStep:(ccTime) dt{
    //printf("GGG\n");
    [penguin manage];
    [self manageIconMovement];
    
    if(isPreparingRemovePopup){
       // printf("LLLL\n");
        removePopupTimer++;
        if(removePopupTimer >= 2){
            //printf("TTTTLLLL\n");
            isPoppingUp = false;
            isPreparingRemovePopup = false;
        }
       
    }
    
}

-(void) manageIconMovement{
    
    iconPageOffsetX = [UIScreen mainScreen].bounds.size.height;
    
    iconPageMovemnetX += (iconPageMovemnetFinalX - iconPageMovemnetX)/15;
    
    for(int i = 0 ; i < totalAcheivements ; i++){
        static float fuckIconNowX;
        static float fuckIconNowY;
        
        static int fuckIconChosen;
        static int thisFuckBeloingsToWichOffset;
        fuckIconChosen = i;
        thisFuckBeloingsToWichOffset = 0;
        while(fuckIconChosen >= numberIconShownAtOnePage){
            fuckIconChosen -= numberIconShownAtOnePage;
            thisFuckBeloingsToWichOffset++;
        }
        
        fuckIconNowX = iconPageMovemnetX + thisFuckBeloingsToWichOffset * iconPageOffsetX + iconPosX[fuckIconChosen];
        fuckIconNowY=  iconPosY[fuckIconChosen];
        
        
        [s_achivementIcons[i] setPosition:ccp(fuckIconNowX, fuckIconNowY)];
      //  [s_achivementIcons_bg[i] setPosition:ccp(fuckIconNowX, fuckIconNowY)];
        
    }
}


- (void) dealloc
{
	printf("AchivementScene Dealloc\n");
    [penguin release];
    
	[super dealloc];
}


- (void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    // printf("ccTouchesBegan\n");
    
    if(isPoppingUp){
        printf("AAAAA:\n");
        return;
    }
    
    for( UITouch *touch in touches ) {
		CGPoint location = [touch locationInView: [touch view]];
		location = [[CCDirector sharedDirector] convertToGL: location];
        //printf("TTTT:%4.8f %4.8f\n",location.x, location.y);
        
        for(int i = 0 ; i < numberIconShownAtOnePage ; i++){
            if(location.x > iconPosX[i] - 30*2/textureRatioForFuckingIpad && location.x <  iconPosX[i] + 30*2/textureRatioForFuckingIpad){
                if(location.y > iconPosY[i] - 30*2/textureRatioForFuckingIpad && location.y <  iconPosY[i] + 30*2/textureRatioForFuckingIpad){
                    generalAchviementPosIdx = i;
                    achivementSelectIdx = pageIdx*12 + i;
                    [self showAchivementPopup];
                    return;
                }
            }
        }
        
        
        
    }
}


@end
