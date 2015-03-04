//
//  MainUpgradeScene.h
//  TurtlesHuh
//
//  Created by  on 2012/7/1.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Global.h"
#import <AdColony/AdColony.h>
#import "AppDelegate.h"


typedef enum{
    kUpgradeItem_Glider = 0,
    kUpgradeItem_Rocket,
    kUpgradeItem_Cannon,
    kUpgradeItem_Helmet,
    
    
    kUpgradeItem_ExtraYellow,
    kUpgradeItem_FuelAmout,
    kUpgradeItem_FuelConsumption,
    kUpgradeItem_MoneyDensity,
    kUpgradeItem_MaxSpeed,
    kUpgradeItem_Acceleration,
    kUpgradeItem_LongerYellow,
    kUpgradeItem_AirResistance,
    kUpgradeItem_FasterInvincible,
    kUpgradeItem_MoneyRatio,
    
    kUpgradeItem_Permenant_Fuel1,
    kUpgradeItem_Permenant_Fuel2,
    kUpgradeItem_Permenant_PerfectLaunch,
    kUpgradeItem_Permenant_Magnetic1,
    kUpgradeItem_Permenant_Magnetic2,
    kUpgradeItem_Permenant_BreakLess,
    kUpgradeItem_Permenant_ExtraYellow,
    kUpgradeItem_Permenant_MoneyRatio,

 }eUpgradeItem;

typedef enum{
    kONSUpgradeItem_Fuel20 = 0,
    kONSUpgradeItem_Fuel50, 
    kONSUpgradeItem_Fuel100,
    kONSUpgradeItem_DoubleYellow,
    kONSUpgradeItem_InitBoost,
    kONSUpgradeItem_SpinSlow,
   // kONSUpgradeItem_SpinDifficult,
    kONSUpgradeItem_BreakLess,
    kONSUpgradeItem_Magnetic,
}eONSUpgradeItem;

typedef struct sUpgradeItemStruct{    
    int price;
    int maxLevel;
    int level;
    int itemIdx;
    
   // ExtendedMenuItem* menuItem;
}eUpgradeItemStruct;



@interface MainUpgradeScene : CCLayer <AdColonyAdDelegate>{
    
    eUpgradeItemStruct* updgradeItem[maxUpgradeItems];
    ExtendedMenuItem* menuItem[maxUpgradeItems];
    int upgradeOrder[maxUpgradeItems];
    int recentUpgradeIdx;
    int recentRelativePosIdx;
    
    int howmnayUpgrades;
    int howmanyUpgradeInOnPage;
    
    int pageIdx;
    int maxItemsOnPage;
    
    CCSprite* s_chosenIcon[40];
    CCSprite* l_sentense01[60];
    CCSprite* l_sentense02[60];
    CCSprite* l_sentense03[60];
    CCSprite* l_sentense04[60];
    CCSprite* l_chosenItemName[30];
    CCSprite* l_chosenPrice[5];
    float chosenPriceScale;
   // CCSprite* l_totalMoney[10];
   // CCSprite* l_chosenLevel;
     CCLabelAtlas* l_chosenLevel;
    CCSprite* l_chosenMaxLevel;
    
  //  int maxTotalMoneyWord;
    int maxSentenseWord;
    int maxPriceWord;
    int maxItemnameWord;
    NSMutableString* string_chosenPrice;
    
    
    CCMenu* upgradeMenu;
    
    int totalPrice;
    int allPrices[maxUpgradeItems][10];
    int allUnblockPrices[maxUpgradeItems][10];
    
    int relativeFixItemX[10];
    int relativeFixItemY[10];
    
    CCSpriteBatchNode* ss_Font01;
   // CCSpriteBatchNode* ss_Font02;
    
    
    CCMenu* othersMenu;
    int howmnayBuyCoin;
    ExtendedMenuItem* buyCoin_MenuItem[8];
    int recentBuyCoinIdx;
    
    CCMenu* ONSUpgradeMenu;
    int ONSOrder[8];
    int howmnayONSUpgrade;
    ExtendedMenuItem* onsUpgrade_MenuItem[8];
    int recentONSUpgradeIdx;
    int onsUpgrade_price[8];
    
    ExtendedMenuItem* achivement_MenuItem;
    
   // CCLabelAtlas* l_iconLevelShown[9];
    
    
    
     int itemNamePosX;
     int itemNamePosY;
     int priceStringPosX;
     int priceStringPosY;
     int totalPricePosX;
     int totalPricePosY;
    
     int sentense01posX;
     int sentense01posY;
     int sentense02posX;
     int sentense02posY;
     int sentense03posX;
     int sentense03posY;
     int sentense04posX;
     int sentense04posY;
    
    
     int startToFuckIdx;
    
     int fontTexture_numInRow;
     int fontTexture_offsetX;
     int fontTexture_offsetY;
    
     int fontTexture_chosenRow;
     int fontTexture_chosenCol;
    
    
     int sentense01_AccumOffset;
     int setense01_offsetX;
    
    
    //BUY IAP
    int buyTimer;
	CCSprite* s_loading2;
	bool isLoading;
     int howmanyCoinsBought;
    
    
    
    //COIN
    CCSpriteBatchNode* ss_Font03;
    NSMutableString* turtleCoinString;
    CCSprite* s_turtleCoin;
    CCSprite* l_coin[10];
    int maxCoinWords;
    
    
    //NEW ADD
    CCSprite* s_levelWord;
    CCSprite* s_ownWord;
  //  CCSprite* s_showingIcon;
    CCSprite* s_turtleCoinDisplay;
    
    CCMenuItem *mBuy;
    CCMenuItem *mGetFree;
    CCMenuItem *mPlayMini;
    CCMenuItem* mRateMe;
    CCMenuItem* mWarning_Pay;
    CCMenuItem* mWarning_Cancel;
    CCMenuItem* mReward;
    
    
    int missionsNeedForThis[maxUpgradeItems][10];  //10 for levels
    bool isWarning;
    CCSprite* warning_missionLeft;
    CCLabelAtlas* l_missionLeft;
    CCLabelAtlas* l_missionLeftForBtn;
    CCLabelAtlas* l_missionLeftPrice;
    int missionLeftToDisplay;
    
    bool isONSEnable;
    
    CCMenuItem* mMissionLeft;
    CCMenuItem* mONSIsEnable;
    CCMenuItem* mONSIsDisable;
    
    CCSprite* s_transition;
    int transitionTimer;
    bool isTransitioning;
    bool isTraitionDisappearing;
    float transitionOpacity;
    float transitionGain;


    /*CCSpriteBatchNode* ss_iconTexture;
    int iconTexture_width;
    int iconTexture_height;
    int iconTexture_offsetX;
    int iconTexture_offsetY;*/
    
    int fuckTimer;
    bool hasFucked;
    
    int burstlyCheckTimes;
    bool burstlyHasLoaded;
    int burstlyTimerInterval;
    
    
    //for free coins
    CCMenuItem* mfc_1;
//    CCMenuItem* mfc_2;
    CCMenuItem* mfc_3;
    CCMenuItem* m_tapjoy_register;
    CCMenuItem* m_tapjoy_how;
    CCMenuItem* m_tapjoy_left;
    CCMenuItem* m_tapjoy_right;
    CCSprite* tajpyInstruction[5];
    bool isShowingTapjoy;
    int tapjoyIdx;
    int fc_idx;
    
    int adColonyTimer;
    bool hasAdColony;
    
    //NEW
    int chosenIconPosX;
    int chosenIconPosY;
}

+(CCScene *) scene;

-(void) initTapjoy;
-(void) udpateTapjoyPage;

-(void) initTransition;
-(void) manageTransition;

-(void) initMissionLeft;
-(void) initONSUpgradeMenu;
-(void) initBuyCoinMenu;
-(void) initChosen;
-(void) initFixItemPos;
-(void) initUpgradeItemStructs;
-(void) initMenu;
-(void) initAllPrices;
-(void) initOtherValues;
-(void) getValuesFromDB;

-(void) successBuyONS;
-(void) successBuy;
-(void) noMoneyWarning;


-(void) updateSelectedDisplay;
-(void) updateSelectedDisplayONSUpgrade;
-(void) updateSelectedDisplayAcivement;
-(void) updateSelectedDisplayBuyCoin;

-(void) updatePage;
-(void) updateAchivementPage;
-(void) updateBuyCoinPage;
-(void) updateONSUpgradePage;

-(void) setFirstSentense;
-(void) setSecondSentense;
-(void) setThirdSentense;
-(void) setForthSentense;
-(void) setItemNameSentense;

-(void) showLevelShown;

-(void) resetChosen;

-(void) saveToDB;

-(void) initLoading2;
-(void) addLoad;
-(void) endLoad;

-(void) delayBuy;
-(void) buy:(ccTime) dt;
-(void) buyIAP;

-(void) showSplashDialog;


-(void) initTurtleCoins;
-(void) updateTurtleCoinsDisplay;

-(void) updateChosePriceValues;

-(void) rateMe;

-(void) showWarning;
-(void) cancelWarning;

-(void) checkIfUnblockPermenatUpgrades;

-(void) removeFuckFuck;

-(void) loadAdColony;
-(void) finishColony:(int)_amount;

@end
