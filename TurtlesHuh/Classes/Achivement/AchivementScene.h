//
//  AchivementScene.h
//  TurtlesHuh
//
//  Created by  on 2012/5/21.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Global.h"
#import "PenguinJump.h"
#import "Penguin.h"
#import "AchivementPopup.h"

@interface AchivementScene : CCLayer {
    //CCSpriteBatchNode* ss_Achievement;
    
     CCSprite* s_achivementIcons[maxAchivements];
   // CCSprite* s_achivementIcons_bg[maxAchivements];
   // bool achivementHasUnblocked[maxAchivements];
    
    int pageIdx;
    int iconStartIdx;
    int numberIconShownAtOnePage;
    int totalAcheivements;
    
    int maxPage;
    
    Penguin* penguin;
    float shellPosX[10]; 
    float shellPosY; 
    
    float iconPosX[12];
    float iconPosY[12];

    
    float iconPageOffsetX;
    float iconPageMovemnetX;
    float iconPageMovemnetFinalX;
    
    
    int currentSelectAchivement;
    AchivementPopup* achivementPopup;
    bool isShowingFirstRowAchivement;
    int achivementSelectIdx;  //actual achivement idx
    int generalAchviementPosIdx; //pos from 0 - 11
    
    bool isPoppingUp;
    bool isPreparingRemovePopup;
    
    int removePopupTimer;
}

+(CCScene *) scene;

-(void) getValuesFromDB;

-(void) initCharacter;
-(void) initIcons;
-(void) initMenu;

-(void) initAchivementPopup;
-(void) showAchivementPopup;

-(void) updatePage;

-(void) manageIconMovement;


@end
