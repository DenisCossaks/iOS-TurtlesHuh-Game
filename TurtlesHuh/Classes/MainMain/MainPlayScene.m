//
//  MainPlayScene.m
//  TurtlesHuh
//
//  Created by  on 2012/6/17.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "MainPlayScene.h"
#import "Global.h"
#import "MainGamePlayGlobal.h"
#import "MainUILayer.h"
#import "GamePlayGlobal.h"
#import "BombScriptGlobal.h"
#import "AppDelegate.h"
#import "MainTurtlePhycisGlobal.h"
#import "MissionGlobal.h"
#import "MainUpgradeScene.h"
#import "MainMissionScene.h"
#import "StoryScene.h"

#import "P4RC.h"
#import "HeyzapCocos2DSDK.h"

const char *missionXXXXFirstSentenseChar = nil;
const char *missionXXXXSecondSentenseChar = nil;

@implementation MainPlayScene

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	MainPlayScene *layer = [MainPlayScene node];
    //playLayer = layer;
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

-(void) getDataFromUpgrades{
    //GET OTHER DATA HERE
    mainOtherData_bestHeight = [[NSUserDefaults standardUserDefaults] integerForKey:@"mainOtherData_bestHeight"];
    printf("get data:%i\n",mainOtherData_bestHeight);
    
    characterIsMagnet = false;
    characterMagnetPower = 0;
    
    oneUse_20Fuel = false;
    oneUse_50Fuel = false;
    oneUse_100Fuel = false;
    oneUse_doubleYellow = false;
    oneUse_superInitBoost = false;
    oneUse_slowCannon = false;
    oneUse_BreakLess = false;
    oneUse_magnetic = false;
    
    if([[NSUserDefaults standardUserDefaults] integerForKey:@"onsUpgrade_itemLevel_00"] > 0){
        if([[NSUserDefaults standardUserDefaults] boolForKey:@"onsUpgrade_isEnable_00"]){
            oneUse_20Fuel = true;
            printf("oneUse_20Fuel\n");
        }
    }
    if([[NSUserDefaults standardUserDefaults] integerForKey:@"onsUpgrade_itemLevel_01"] > 0){
        if([[NSUserDefaults standardUserDefaults] boolForKey:@"onsUpgrade_isEnable_01"]){
            oneUse_50Fuel = true;
            printf("oneUse_50Fuel\n");
        }
    }
    if([[NSUserDefaults standardUserDefaults] integerForKey:@"onsUpgrade_itemLevel_02"] > 0){
        if([[NSUserDefaults standardUserDefaults] boolForKey:@"onsUpgrade_isEnable_02"]){
            oneUse_100Fuel = true;
            printf("oneUse_100Fuel\n");
        }
    }
    if([[NSUserDefaults standardUserDefaults] integerForKey:@"onsUpgrade_itemLevel_03"] > 0){
        if([[NSUserDefaults standardUserDefaults] boolForKey:@"onsUpgrade_isEnable_03"]){
            oneUse_doubleYellow = true;
            printf("oneUse_doubleYellow\n");
        }
    }
    if([[NSUserDefaults standardUserDefaults] integerForKey:@"onsUpgrade_itemLevel_04"] > 0){
        if([[NSUserDefaults standardUserDefaults] boolForKey:@"onsUpgrade_isEnable_04"]){
            oneUse_superInitBoost = true;
             printf("oneUse_superInitBoost\n");
        }
    }
    if([[NSUserDefaults standardUserDefaults] integerForKey:@"onsUpgrade_itemLevel_05"] > 0){
        if([[NSUserDefaults standardUserDefaults] boolForKey:@"onsUpgrade_isEnable_05"]){
            oneUse_slowCannon = true;
             printf("oneUse_slowCannon\n");
        }
    }
    if([[NSUserDefaults standardUserDefaults] integerForKey:@"onsUpgrade_itemLevel_06"] > 0){
        if([[NSUserDefaults standardUserDefaults] boolForKey:@"onsUpgrade_isEnable_06"]){
            oneUse_BreakLess = true;
             printf("oneUse_BreakLess\n");
        }
    }
    if([[NSUserDefaults standardUserDefaults] integerForKey:@"onsUpgrade_itemLevel_07"] > 0){
        if([[NSUserDefaults standardUserDefaults] boolForKey:@"onsUpgrade_isEnable_07"]){
            oneUse_magnetic = true;
             printf("oneUse_magnetic\n");
        }
    }
    

    
    if(oneUse_100Fuel){
        oneUse_20Fuel = false;
        oneUse_50Fuel = false;
    }else if(oneUse_50Fuel){
        oneUse_20Fuel = false;
    }
    
     pemanent_fuel1 = false;
     pemanent_fuel2 = false;
     pemanent_perfectLuanch = false;
     pemanent_magnet1 = false;
     pemanent_magnet2 = false;
     pemanent_breakless = false;
     pemanent_extraYellow = false;
     pemanent_moneyRatio = false;
    
    
    if(upgradeItemLevel[14] >= 1 && [[NSUserDefaults standardUserDefaults] boolForKey:@"permenantUpgrade_isEnable_00"]){
        pemanent_fuel1 = true;
        printf("pemanent_fuel1\n");
    }
    if(upgradeItemLevel[15] >= 1 && [[NSUserDefaults standardUserDefaults] boolForKey:@"permenantUpgrade_isEnable_01"]){
        pemanent_fuel2 = true;
         printf("pemanent_fuel2\n");
    }

    if(upgradeItemLevel[16] >= 1 && [[NSUserDefaults standardUserDefaults] boolForKey:@"permenantUpgrade_isEnable_02"]){
        pemanent_perfectLuanch = true;
         printf("pemanent_perfectLuanch\n");
    }

    if(upgradeItemLevel[17] >= 1 && [[NSUserDefaults standardUserDefaults] boolForKey:@"permenantUpgrade_isEnable_03"]){
        pemanent_magnet1 = true;
         printf("pemanent_magnet1\n");
    }

    if(upgradeItemLevel[18] >= 1 && [[NSUserDefaults standardUserDefaults] boolForKey:@"permenantUpgrade_isEnable_04"]){
        pemanent_magnet2 = true;
        printf("pemanent_magnet2\n");
    }

    if(upgradeItemLevel[19] >= 1 && [[NSUserDefaults standardUserDefaults] boolForKey:@"permenantUpgrade_isEnable_05"]){
        pemanent_breakless = true;
        printf("pemanent_breakless\n");
    }
    if(upgradeItemLevel[20] >= 1 && [[NSUserDefaults standardUserDefaults] boolForKey:@"permenantUpgrade_isEnable_06"]){
        pemanent_extraYellow = true;
        printf("pemanent_extraYellow\n");
    }
    if(upgradeItemLevel[21] >= 1 && [[NSUserDefaults standardUserDefaults] boolForKey:@"permenantUpgrade_isEnable_07"]){
        pemanent_moneyRatio = true;
        printf("pemanent_moneyRatio\n");
    }

    
    /*--------- beginning -----------------
        characterFuelRemain = 30;
        characterFuelReduceSpeed = 0.2;
        spin_maxForce = 10;
     spin_hasPerfect = false;
     */
    
    /*playerGlider = 5;
    playerBoost = 5;
    
    characterFuelRemain = 100;
    characterFuelReduceSpeed = 0.05;
    spin_maxForce = 35;
    spin_hasPerfect = true;
    characterMaxSpinFlightTime = 120;*/
    
   /* //hit 0
    playerGlider = 1;
    playerBoost = 2;
    characterFuelRemain = 50;
    characterFuelReduceSpeed = 0.1;
    spin_maxForce = 15;
    spin_hasPerfect = false;
    characterMaxSpinFlightTime = 60;
    characterLightInvincibleMaxTime = 600;
    
    //hit 1
    playerGlider = 2;
    playerBoost = 3;
    characterFuelRemain = 60;
    characterFuelReduceSpeed = 0.088;
    spin_maxForce = 20;
    spin_hasPerfect = false;
    characterMaxSpinFlightTime = 60;
    
    //hit 2
    playerGlider = 3;
    playerBoost = 3;
    characterFuelRemain = 70;
    characterFuelReduceSpeed = 0.08;
    spin_maxForce = 25;
    spin_hasPerfect = false;
    characterMaxSpinFlightTime = 60;
    
    //hit 3
    playerGlider = 4;
    playerBoost = 3;
    characterFuelRemain = 80;
    characterFuelReduceSpeed = 0.07;
    spin_maxForce = 25;
    spin_hasPerfect = false;
    characterMaxSpinFlightTime = 60;
    
    //hit 4
    playerGlider = 4;
    playerBoost = 4;
    characterFuelRemain = 90;
    characterFuelReduceSpeed = 0.062;
    spin_maxForce = 30;
    spin_hasPerfect = true;
    characterMaxSpinFlightTime = 60;
    characterMaxBeginHeavyTime = 150;
    
    //hit 5
    playerGlider = 5;
    playerBoost = 5;
    characterFuelRemain = 90;
    characterFuelReduceSpeed = 0.057;
    spin_maxForce = 30;
    spin_hasPerfect = true;
    characterMaxSpinFlightTime = 60;
    characterMaxBeginHeavyTime = 150;
    characterGainInvincible = 10.0;
    characterGainInvincibleInterval = 1.0/60.0;
    characterLightInvincibleMax = 4;
    
    //hit 6
    playerGlider = 5;
    playerBoost = 5;
    
    characterFuelRemain = 100;
    characterFuelReduceSpeed = 0.05;
    spin_maxForce = 35;
    spin_hasPerfect = true;
    characterMaxSpinFlightTime = 120;
     characterMaxBeginHeavyTime = 240;
    characterGainInvincible = 12.0;
    characterGainInvincibleInterval = 1.0/50.0;
    characterLightInvincibleMax = 6;
    characterLightInvincibleMaxTime = 1200;  //init = 600
     

    dragonBall_maxSpeedToBreak[0] = 5.0;
    dragonBall_maxSpeedToBreak[1] = 6.5;
    dragonBall_maxSpeedToBreak[2] = 7.5;
    dragonBall_maxSpeedToBreak[3] = 9.5;
    dragonBall_maxSpeedToBreak[4] = 11.0;
    dragonBall_maxSpeedToBreak[5] = 14.0;
    //dragonBall_maxSpeedToBreak[6] = 15.5;  //70
    dragonBall_maxSpeedToBreak[6] = 15.0;  //70*/
    
    //hit 0
   /* playerGlider = 1;
    playerBoost = 2;
    playerCannon = 1;
    playerHelmet = 1;
    
    playerFuelAmount = 1;
    playerFuelConsumption = 2;
    playerAirResistance = 1;
    playerMaxSpeed = 1;
    playerAcceleration = 1;
    playerMoneyDensity = 0;
    playerMoneyRatio = 0;
    playerExtraYellow = 0;
    playerLongerYellow = 0;
    playerFasterToRedFrame = 0;*/
    
    //hit 1
    /* playerGlider = 2;
     playerBoost = 3;
     playerCannon = 2;
     playerHelmet = 2;
     
     playerFuelAmount = 2;
     playerFuelConsumption = 4;
     playerAirResistance = 3;
     playerMaxSpeed = 2;
     playerAcceleration = 2;
     playerMoneyDensity = 1;
     playerMoneyRatio = 0;
     playerExtraYellow = 1;
     playerLongerYellow = 0;
     playerFasterToRedFrame = 0;*/
    
    //hit 2
    /* playerGlider = 3;
     playerBoost = 3;
     playerCannon = 3;
     playerHelmet = 2;
     
     playerFuelAmount = 3;
     playerFuelConsumption = 5;
     playerAirResistance = 4;
     playerMaxSpeed = 3;
     playerAcceleration = 4;
     playerMoneyDensity = 2;
     playerMoneyRatio = 1;
     playerExtraYellow = 2;
     playerLongerYellow = 0;
     playerFasterToRedFrame = 0;*/
    
    //hit 3
    /* playerGlider = 4;
     playerBoost = 3;
     playerCannon = 3;
     playerHelmet = 3;
     
     playerFuelAmount = 4;
     playerFuelConsumption = 6;
     playerAirResistance = 6;
     playerMaxSpeed = 5;
     playerAcceleration = 6;
     playerMoneyDensity = 2;
     playerMoneyRatio = 2;
     playerExtraYellow = 2;
     playerLongerYellow = 1;
     playerFasterToRedFrame = 0;*/
    
    //hit 4
    /* playerGlider = 4;
     playerBoost = 4;
     playerCannon = 4;
     playerHelmet = 4;
     
     playerFuelAmount = 5;
     playerFuelConsumption = 7;
     playerAirResistance = 7;
     playerMaxSpeed = 7;
     playerAcceleration = 7;
     playerMoneyDensity = 2;
     playerMoneyRatio = 2;
     playerExtraYellow = 3;
     playerLongerYellow = 2;
     playerFasterToRedFrame = 1;*/
    
    //hit 5
    /* playerGlider = 5;
     playerBoost = 5;
     playerCannon = 4;
     playerHelmet = 5;
     
     playerFuelAmount = 6;
     playerFuelConsumption = 8;
     playerAirResistance = 8;
     playerMaxSpeed = 8;
     playerAcceleration = 8;
     playerMoneyDensity = 3;
     playerMoneyRatio = 3;
     playerExtraYellow = 4;
     playerLongerYellow = 2;
     playerFasterToRedFrame = 2;*/
    
    
    
   /* playerGlider = 4;
    playerBoost = 3;
    playerCannon = 4;
    playerHelmet = 3;
    
    playerFuelAmount = 5;
    playerFuelConsumption = 7;
    playerAirResistance = 6;
    playerMaxSpeed = 5;
    playerAcceleration = 6;
    playerMoneyDensity = 2;
    playerMoneyRatio = 2;
    playerExtraYellow = 2;
    playerLongerYellow = 1;
    playerFasterToRedFrame = 0;*/
    
    playerGlider = upgradeItemLevel[0];
    playerBoost = upgradeItemLevel[1];
    playerCannon = upgradeItemLevel[2];
    playerHelmet = upgradeItemLevel[3];
    
    
    playerExtraYellow = upgradeItemLevel[4];
    playerFuelAmount = upgradeItemLevel[5];
    playerFuelConsumption = upgradeItemLevel[6];
    playerMoneyDensity = upgradeItemLevel[7];
    playerMaxSpeed = upgradeItemLevel[8];
    playerAcceleration = upgradeItemLevel[9];
    playerLongerYellow = upgradeItemLevel[10];
    playerAirResistance = upgradeItemLevel[11];
    playerFasterToRedFrame = upgradeItemLevel[12];
    playerMoneyRatio = upgradeItemLevel[13];
    
    for(int i = 0 ; i < 14 ; i++){
        printf("u:%i upgrae:%i\n",i,upgradeItemLevel[i]);
    }
   
    
    
    //MAX
   /* playerGlider = 5;
    playerBoost = 5;
    playerCannon = 5;
    playerHelmet = 5;
    
    playerFuelAmount = 6;
    playerFuelConsumption = 9;
    playerAirResistance = 9;
    playerMaxSpeed = 9;
    playerAcceleration = 9;
    playerMoneyDensity = 4;
    playerMoneyRatio = 5;
    playerExtraYellow = 6;
    playerLongerYellow = 5;
    playerFasterToRedFrame = 4;*/
    
    
     characterMaxBeginHeavyTime = 100;
    characterMaxSpinFlightTime = 60;
    if(playerCannon == 0){
        spin_maxForce = 10;
        spin_hasPerfect = false;
    }
    if(playerCannon == 1){
        spin_maxForce = 15;
        spin_hasPerfect = false;
    }
    if(playerCannon == 2){
        spin_maxForce = 20;
        spin_hasPerfect = false;
    }
    if(playerCannon == 3){
        spin_maxForce = 25;
        spin_hasPerfect = false;
    }
    if(playerCannon == 4){
        spin_maxForce = 30;
        spin_hasPerfect = true;
        
        characterMaxBeginHeavyTime = 150;
    }
    if(playerCannon == 5){
        spin_maxForce = 35;
        spin_hasPerfect = true;
        characterMaxBeginHeavyTime = 150;
    }
    
    if(playerHelmet == 0){
        dragonBall_maxSpeedToBreak[0] = 9.0;
        dragonBall_maxSpeedToBreak[1] = 11.0;
        dragonBall_maxSpeedToBreak[2] = 13.0;
        dragonBall_maxSpeedToBreak[3] = 15.0;
        dragonBall_maxSpeedToBreak[4] = 15.0;
        dragonBall_maxSpeedToBreak[5] = 15.0;
        dragonBall_maxSpeedToBreak[6] = 16.0;
    }
    if(playerHelmet == 1){
        dragonBall_maxSpeedToBreak[0] = 5.5;  //FIT
        dragonBall_maxSpeedToBreak[1] = 8.5;
        dragonBall_maxSpeedToBreak[2] = 11.0;
        dragonBall_maxSpeedToBreak[3] = 13.0;
        dragonBall_maxSpeedToBreak[4] = 15.0;
        dragonBall_maxSpeedToBreak[5] = 15.0;
        dragonBall_maxSpeedToBreak[6] = 16.0;
    }
    if(playerHelmet == 2){
        dragonBall_maxSpeedToBreak[0] = 5.5;
        dragonBall_maxSpeedToBreak[1] = 6.5;  //FIT
        dragonBall_maxSpeedToBreak[2] = 8.0;
        dragonBall_maxSpeedToBreak[3] = 12.0;
        dragonBall_maxSpeedToBreak[4] = 13.0;
        dragonBall_maxSpeedToBreak[5] = 15.0;
        dragonBall_maxSpeedToBreak[6] = 16.0;  //70
    }
    if(playerHelmet == 3){
        dragonBall_maxSpeedToBreak[0] = 6.0;
        dragonBall_maxSpeedToBreak[1] = 6.0;
        dragonBall_maxSpeedToBreak[2] = 7.5;//FIT
        dragonBall_maxSpeedToBreak[3] = 9.5;//FIT
        dragonBall_maxSpeedToBreak[4] = 11.5;
        dragonBall_maxSpeedToBreak[5] = 15.0;
        dragonBall_maxSpeedToBreak[6] = 16.0;  //70
    }
    if(playerHelmet == 4){
        dragonBall_maxSpeedToBreak[0] = 5.0;
        dragonBall_maxSpeedToBreak[1] = 6.0;
        dragonBall_maxSpeedToBreak[2] = 6.5;
        dragonBall_maxSpeedToBreak[3] = 8.5;
        dragonBall_maxSpeedToBreak[4] = 10.0;//FIT
        dragonBall_maxSpeedToBreak[5] = 14.0;//FIT
        dragonBall_maxSpeedToBreak[6] = 18.0;  //70
    }
    if(playerHelmet == 5){
        dragonBall_maxSpeedToBreak[0] = 4.0;
        dragonBall_maxSpeedToBreak[1] = 5.0;
        dragonBall_maxSpeedToBreak[2] = 6.0;
        dragonBall_maxSpeedToBreak[3] = 8.0;
        dragonBall_maxSpeedToBreak[4] = 9.0;
        dragonBall_maxSpeedToBreak[5] = 12.5;
        dragonBall_maxSpeedToBreak[6] = 15.0;//FIT  //70
    }

    
   /* if(playerHelmet == 4){
        dragonBall_maxSpeedToBreak[0] = 5.0;
        dragonBall_maxSpeedToBreak[1] = 6.0;
        dragonBall_maxSpeedToBreak[2] = 6.5;
        dragonBall_maxSpeedToBreak[3] = 8.5;
        dragonBall_maxSpeedToBreak[4] = 10.0;//FIT
        dragonBall_maxSpeedToBreak[5] = 13.5;//FIT
        dragonBall_maxSpeedToBreak[6] = 16.0;  //70
    }
    if(playerHelmet == 5){
        dragonBall_maxSpeedToBreak[0] = 4.0;
        dragonBall_maxSpeedToBreak[1] = 5.0;
        dragonBall_maxSpeedToBreak[2] = 6.0;
        dragonBall_maxSpeedToBreak[3] = 8.0;
        dragonBall_maxSpeedToBreak[4] = 9.0;
        dragonBall_maxSpeedToBreak[5] = 11.0;
        dragonBall_maxSpeedToBreak[6] = 14.0;//FIT  //70
    }*/
    
    

    if(playerFuelAmount == 0){
        characterFuelRemain = 40;
    }
    if(playerFuelAmount == 1){
        characterFuelRemain = 50;
    }
    if(playerFuelAmount == 2){
        characterFuelRemain = 60;
    }
    if(playerFuelAmount == 3){
        characterFuelRemain = 70;
    }
    if(playerFuelAmount == 4){
        characterFuelRemain = 80;
    }
    if(playerFuelAmount == 5){
        characterFuelRemain = 90;
    }
    if(playerFuelAmount == 6){
        characterFuelRemain = 100;
    }
    
    if(playerFuelConsumption == 0){
        characterFuelReduceSpeed = 0.12;
    }
    if(playerFuelConsumption == 1){
        characterFuelReduceSpeed = 0.11;
    }
    if(playerFuelConsumption == 2){
        characterFuelReduceSpeed = 0.1;  //hit 0
    }
    if(playerFuelConsumption == 3){
        characterFuelReduceSpeed = 0.092;
    }
    if(playerFuelConsumption == 4){
        characterFuelReduceSpeed = 0.088;  //hit 1
    }
    if(playerFuelConsumption == 5){
        characterFuelReduceSpeed = 0.08;  //hit 2
    }
    if(playerFuelConsumption == 6){
        characterFuelReduceSpeed = 0.07;  //hit 3
    }
    if(playerFuelConsumption == 7){
        characterFuelReduceSpeed = 0.062;  //hit 4
    }
    if(playerFuelConsumption == 8){
        characterFuelReduceSpeed = 0.057;  //hit 5
    }
    if(playerFuelConsumption == 9){
        characterFuelReduceSpeed = 0.05;  //hit 6
    }
    
    if(playerAirResistance == 0){
        characterAirResistanceReduce = 0.990000;
    }
    if(playerAirResistance == 1){
        characterAirResistanceReduce = 0.990500; //hit 0
    }
    if(playerAirResistance == 2){
        characterAirResistanceReduce = 0.991500; 
    }
    if(playerAirResistance == 3){
        characterAirResistanceReduce = 0.992500; //hit 1
    }
    if(playerAirResistance == 4){
        characterAirResistanceReduce = 0.993100; //hit 2
    }
    if(playerAirResistance == 5){
        characterAirResistanceReduce = 0.9935500;
    }
    if(playerAirResistance == 6){
        characterAirResistanceReduce = 0.9940500; //hit 3
    }
    if(playerAirResistance == 7){
        characterAirResistanceReduce = 0.9948500; //hit 4
    }
    if(playerAirResistance == 8){
        characterAirResistanceReduce = 0.995100; //hit 5
    }
    if(playerAirResistance == 9){
        characterAirResistanceReduce = 0.995500; //hit 6
    }
    
    if(playerMaxSpeed == 0){
        characterAccelerationReduce = 0.022;
    }
    if(playerMaxSpeed == 1){
        characterAccelerationReduce = 0.02; //hit 0
    }
    if(playerMaxSpeed == 2){
        characterAccelerationReduce = 0.016; //hit 1
    }
    if(playerMaxSpeed == 3){
        characterAccelerationReduce = 0.0125; //hit 2
    }
    if(playerMaxSpeed == 4){
        characterAccelerationReduce = 0.01; 
    }
    if(playerMaxSpeed == 5){
        characterAccelerationReduce = 0.0075; //hit 3
    }
    if(playerMaxSpeed == 6){
        characterAccelerationReduce = 0.006; 
    }
    if(playerMaxSpeed == 7){
        characterAccelerationReduce = 0.045; //hit 4
    }
    if(playerMaxSpeed == 8){
        characterAccelerationReduce = 0.002; //hit 5
    }
    if(playerMaxSpeed == 9){
        characterAccelerationReduce = 0.0; //hit 6
    }
    
    if(playerAcceleration == 0){
        characterMaxSpeedReduce = 0.9;
    }
    if(playerAcceleration == 1){
        characterMaxSpeedReduce = 0.85; //hit 0
    }
    if(playerAcceleration == 2){
        characterMaxSpeedReduce = 0.7; //hit 1
    }
    if(playerAcceleration == 3){
        characterMaxSpeedReduce = 0.65; 
    }
    if(playerAcceleration == 4){
        characterMaxSpeedReduce = 0.55; //hit 2
    }
    if(playerAcceleration == 5){
        characterMaxSpeedReduce = 0.45; 
    }
    if(playerAcceleration == 6){
        characterMaxSpeedReduce = 0.35; //hit 3
    }
    if(playerAcceleration == 7){
        characterMaxSpeedReduce = 0.2; //hit 4
    }
    if(playerAcceleration == 8){
        characterMaxSpeedReduce = 0.1; //hit 5
    }
    if(playerAcceleration == 9){
        characterMaxSpeedReduce = 0.0; //hit 6
    }
    
    
    printf("playerMoneyDensity:%i\n",playerMoneyDensity);
    if(playerMoneyDensity == 0){
        moneyGenRadius = 3500;
        moneyNumArea = 2;
    }
    if(playerMoneyDensity == 1){
        moneyGenRadius = 2500;
        moneyNumArea = 2;
    }
    if(playerMoneyDensity == 2){
        moneyGenRadius = 1500;
        moneyNumArea = 2;
    }
    if(playerMoneyDensity == 3){
        moneyGenRadius = 900;
        moneyNumArea = 2;
    }
    if(playerMoneyDensity == 4){
        moneyGenRadius = 450;
        moneyNumArea = 2;
    }
    if(playerMoneyDensity == 5){
        moneyGenRadius = 300;
        moneyNumArea = 2;
    }

    
    moneyExchangeRatio = 1.0;
    if(playerMoneyRatio == 0){
        moneyExchangeRatio = 1.0;
    }
    if(playerMoneyRatio == 1){
        moneyExchangeRatio = 2.0;
    }
    if(playerMoneyRatio == 2){
        moneyExchangeRatio = 3.0;
    }
    if(playerMoneyRatio == 3){
        moneyExchangeRatio = 4.0;
    }
    if(playerMoneyRatio == 4){
        moneyExchangeRatio = 5.0;
    }
    
    if(playerExtraYellow == 0){
        characterLightInvincibleMax = 0;
    }
    if(playerExtraYellow == 1){
        characterLightInvincibleMax = 1;
    }
    if(playerExtraYellow == 2){
        characterLightInvincibleMax = 2;
    }
    if(playerExtraYellow == 3){
        characterLightInvincibleMax = 3;
    }
    if(playerExtraYellow == 4){
        characterLightInvincibleMax = 4;
    }
    if(playerExtraYellow == 5){
        characterLightInvincibleMax = 5;
    }
    if(playerExtraYellow == 6){
        characterLightInvincibleMax = 6;
    }

    
    if(playerLongerYellow == 0){
        characterLightInvincibleMaxTime = 600;
    }
    if(playerLongerYellow == 1){
        characterLightInvincibleMaxTime = 700;
    }
    if(playerLongerYellow == 2){
        characterLightInvincibleMaxTime = 800;
    } 
    if(playerLongerYellow == 3){
        characterLightInvincibleMaxTime = 900;
    }
    if(playerLongerYellow == 4){
        characterLightInvincibleMaxTime = 1050;
    }
    if(playerLongerYellow == 5){
        characterLightInvincibleMaxTime = 1200;
    }
   
    if(playerFasterToRedFrame == 0){
        characterGainInvincibleInterval = 1.0/9999999.0;
        characterGainInvincible = 5.0;
    }
    

    if(playerFasterToRedFrame == 1){
        characterGainInvincibleInterval = 1.0/85.0;
        characterGainInvincible = 7.0;
        //characterGainInvincibleInterval = 1.0/70.0;
       // characterGainInvincible = 8.0;
    }
    if(playerFasterToRedFrame == 2){
        characterGainInvincibleInterval = 1.0/65.0;
        characterGainInvincible = 9.0;
       // characterGainInvincibleInterval = 1.0/60.0;
       // characterGainInvincible = 10.0;
    } 
    if(playerFasterToRedFrame == 3){
        characterGainInvincibleInterval = 1.0/50.0;
        characterGainInvincible = 12.0;
    }
 
    if(oneUse_BreakLess){
        for(int i = 0 ; i < 7 ; i++){
            dragonBall_maxSpeedToBreak[i] -= 1.11111111;
        }
    }
    
    
    printf("characterFuelRemain:%4.8f\n",characterFuelRemain);
    printf("characterFuelReduceSpeed:%4.8f\n",characterFuelReduceSpeed);
    printf("spin_maxForce:%4.8f\n",spin_maxForce);

    printf("characterMaxSpinFlightTime:%i\n",characterMaxSpinFlightTime);
    printf("characterMaxBeginHeavyTime:%i\n",characterMaxBeginHeavyTime);
    printf("characterGainInvincible:%4.8f\n",characterGainInvincible);
    printf("characterGainInvincibleInterval:%4.8f\n",characterGainInvincibleInterval);
    printf("characterLightInvincibleMax:%i\n",characterLightInvincibleMax);
    printf("characterLightInvincibleMaxTime:%i\n",characterLightInvincibleMaxTime);
    
    for(int i = 0 ; i < 7 ; i++){
        printf("dragonBal:%i   l_maxSpeedToBreak:%4.8f\n",i,dragonBall_maxSpeedToBreak[i]);
    }

    
    dragonBall_X[0] = 5500;
    dragonBall_X[1] = 15000;
    dragonBall_X[2] = 24000;
    dragonBall_X[3] = 29000;
    dragonBall_X[4] = 40000;
    dragonBall_X[5] = 60000;
    
    dragonBall_X[6] = 80000;
    
   /* //delete
    dragonBall_X[0] = 1500;
    dragonBall_X[1] = 3000;
    dragonBall_X[2] = 4500;
    dragonBall_X[3] = 6000;
    dragonBall_X[4] = 8000;
    dragonBall_X[5] = 10000;
    dragonBall_X[6] = 12000;*/
    
    dragonBall_Y[0] = 190;
    dragonBall_Y[1] = (222 + 12);
    dragonBall_Y[2] = (265 + 12);
    dragonBall_Y[3] = 1000;
    dragonBall_Y[4] = 2000;
    dragonBall_Y[5] = 4000;
    
    dragonBall_Y[6] = 8000;
    
    if(isIpad){
        int fuckYY;
        fuckYY = 200;
        for(int i = 0 ; i < 7 ; i++){
            dragonBall_Y[i] += fuckYY;
        }
    }
    
   /* dragonBall_X[0] = 80000;
    dragonBall_Y[0] = 8000;
    for(int i = 1 ; i < 7 ; i++){
        dragonBall_X[i] = 999999;
    }
    
    dragonBall_maxSpeedToBreak[0] = 15.5;*/
    
    //DELETE LATER
   /* oneUse_100Fuel = true;
    pemanent_fuel1 = true;
    pemanent_fuel2 = true;
    oneUse_magnetic = true;
    moneyGenRadius = 450;
    moneyNumArea = 2;*/
    
    if(oneUse_magnetic){
        characterIsMagnet = true;
        characterMagnetPower += 1.5;
    }
    if(pemanent_magnet1){
        characterIsMagnet = true;
        characterMagnetPower += 1.25;
    }
    if(pemanent_magnet2){
        characterIsMagnet = true;
        characterMagnetPower += 1.25;
    }
    
    if(oneUse_20Fuel){
        characterFuelRemain += 25;
    }
    if(oneUse_50Fuel){
        characterFuelRemain += 50;
    }
    if(oneUse_100Fuel){
        characterFuelRemain += 100;
    }
    if(pemanent_fuel1){
        characterFuelRemain += 25;
    }
    if(pemanent_fuel2){
        characterFuelRemain += 25;
    }
    
    if(pemanent_extraYellow){
        characterLightInvincibleMax *= 2;
    }
    
    if(oneUse_BreakLess){
        for(int i = 0 ; i < maxDragonBalls ; i++){
            dragonBall_maxSpeedToBreak[i] -= 1.11111;
        }
    }
    if(pemanent_breakless){
        for(int i = 0 ; i < maxDragonBalls ; i++){
            dragonBall_maxSpeedToBreak[i] -= 1.11111;
        }
    }
    
    printf("SPECIAL:%4.8f %4.8f\n",characterMagnetPower,characterFuelRemain);
    for(int i = 0 ; i < maxDragonBalls ; i++){
         printf("SPECIAL dragonBall_maxSpeedToBreak:%4.8f\n",dragonBall_maxSpeedToBreak[i]);
    }
    
    
    thurstSound = 0.5;
    if(playerBoost == 1){
        thurstSound = 0.2;
    }
    if(playerBoost == 2){
        thurstSound = 0.2;
    }
    if(playerBoost == 3){
        thurstSound = 0.2;
    }
    if(playerBoost == 4){
        thurstSound = 0.2;
    }
    if(playerBoost == 5){
        thurstSound = 0.2;
    }
}

-(void) getMissionOtherValues{
    canDisplayTotalFlightTime = false;
    canDisplayDestroyUseTime = false;
    canDisplayFlyStraightTime = false;
    canDisplayFlyNearFloorTime = false;
    
    isUnderingTotalFlightTime = false;
    isUnderingDestroyUseTime = false;
    isUnderingFlyStraightTime = false;
    isUnderingFlyNearFloorTime = false;
    
    currentChosenMissionWon[0] = false;
    currentChosenMissionWon[1] = false;
    currentChosenMissionWon[2] = false;
    
    for(int i = 0 ; i < 3 ; i++){
        if(currentChosenMission[i] == 0 || currentChosenMission[i] == 10 || currentChosenMission[i] == 25 || currentChosenMission[i] == 32 || currentChosenMission[i] == 46){
            canDisplayTotalFlightTime = true;
            isUnderingTotalFlightTime = true;
        }
        
        
        if(currentChosenMission[i] == 1 || currentChosenMission[i] == 20){
            canDisplayFlyStraightTime = true;
            isUnderingFlyStraightTime = true;
            recordUse_flyStraightMinSpeed = 0.0;
            recordUse_flyStraightCanFuel = true;
            
            if(currentChosenMission[i] == 20){
                recordUse_flyStraightMinSpeed = 5.0;
            }
        }
        
        if(currentChosenMission[i] == 9 || currentChosenMission[i] == 16 || currentChosenMission[i] == 34 || currentChosenMission[i] == 47 || currentChosenMission[i] == 75){
            canDisplayFlyNearFloorTime = true;
            isUnderingFlyNearFloorTime = true;
            recordUse_flyNearFloorMinSpeed =  0.0;
            recordUse_flyNearFloorCanFuel = true;
            
            if(currentChosenMission[i] == 34){
                recordUse_flyNearFloorMinSpeed =  6.66666667;
                recordUse_flyNearFloorCanFuel = true;

            }
            
            if(currentChosenMission[i] == 47 || currentChosenMission[i] == 75){
                recordUse_flyNearFloorMinSpeed =  10.0;
                recordUse_flyNearFloorCanFuel = true;
                
            }

        }
        
        if(currentChosenMission[i] == 21 || currentChosenMission[i] == 45 || currentChosenMission[i] == 57 || currentChosenMission[i] == 63 || currentChosenMission[i] == 68 || currentChosenMission[i] == 83 || currentChosenMission[i] == 86){
            canDisplayDestroyUseTime = true;
            isUnderingDestroyUseTime = true;
            recordUse_targetDragonBall = -1;
            recordUse_howmanyDragonBallNeedToHit = -1;
            
            if(currentChosenMission[i] == 21){
                recordUse_targetDragonBall = 0;
            }
            if(currentChosenMission[i] == 45){
                recordUse_targetDragonBall = 1;
            }
            if(currentChosenMission[i] == 57){
                recordUse_targetDragonBall = 0;
            }
            if(currentChosenMission[i] == 63){
                recordUse_howmanyDragonBallNeedToHit = 3;
            }
            if(currentChosenMission[i] == 68){
                recordUse_targetDragonBall = 3;
            }
            if(currentChosenMission[i] == 82){
                recordUse_howmanyDragonBallNeedToHit = 4;
            }
            if(currentChosenMission[i] == 85){
                recordUse_targetDragonBall = 4;
            }
        }
    }
    
    if(canDisplayTotalFlightTime){
        canDisplayFlyStraightTime = false;
        canDisplayFlyNearFloorTime = false;
        canDisplayDestroyUseTime = false;
    }else if(canDisplayDestroyUseTime){
        canDisplayFlyStraightTime = false;
        canDisplayFlyNearFloorTime = false;
    }else if(canDisplayFlyStraightTime){
        canDisplayFlyNearFloorTime = false;
    }
    
    
    recordUse_GREENDiamondGotInOneRound = 0;
    recordUse_PURPLEDiamondGotInOneRound = 0;
    recordUse_diamondGotInOneRound = 0;
    recordUse_diamondGotTotal = [[NSUserDefaults standardUserDefaults] integerForKey:@"main_diamondGot"];
    recordUse_moneyEarnedFromDiamondsInOneRound = 0;
    recordUse_penguinHitInOneRound = 0;
    recordUse_penguinHitInYellowBlaze = 0;
    recordUse_penguinHitTotal = [[NSUserDefaults standardUserDefaults] integerForKey:@"main_penguinHit"];
    recordUse_continuePerfectLaunchTIme = [[NSUserDefaults standardUserDefaults] integerForKey:@"main_continuePerfectLaunch"];
    recordUse_moneyGainedTotal = [[NSUserDefaults standardUserDefaults] integerForKey:@"main_moneyGained"];
    recordUse_howmanyDragonBallHitted = 0;
    recordUse_pantsOfFireTime = 0;
    recordUse_hasAppliedFuel = false;
    recordUse_breakWhileInHeavy = false;
    
    
    for(int i = 0 ; i < 3 ; i++){
        if(currentChosenMission[i] == 24 || currentChosenMission[i] == 35 || currentChosenMission[i] == 49 || currentChosenMission[i] == 60){
            if(!hasPlayedThisMissionBefore[currentChosenMission[i]]){
                 recordUse_penguinHitTotal = 0;
                hasPlayedThisMissionBefore[currentChosenMission[i]] = true;
                
                //[[NSUserDefaults standardUserDefaults] setBool:true forKey:@"missionPlayed_24"];
            }
        }
        
        if(currentChosenMission[i] == 7 || currentChosenMission[i] == 30  || currentChosenMission[i] == 69){
            if(!hasPlayedThisMissionBefore[currentChosenMission[i]]){
                recordUse_diamondGotTotal = 0;
                 hasPlayedThisMissionBefore[currentChosenMission[i]] = true;
                printf("SO DODFDSFSDFSDFSDFSDFSDFSDFSD\n");
            }
        }
        
        if(currentChosenMission[i] == 19 || currentChosenMission[i] == 48 || currentChosenMission[i] == 79){
            if(!hasPlayedThisMissionBefore[currentChosenMission[i]]){
                recordUse_continuePerfectLaunchTIme = 0;
                 hasPlayedThisMissionBefore[currentChosenMission[i]] = true;
            }
        }
        
        if(currentChosenMission[i] == 50){
            if(!hasPlayedThisMissionBefore[currentChosenMission[i]]){
                recordUse_moneyGainedTotal = 0;
                 hasPlayedThisMissionBefore[currentChosenMission[i]] = true;
            }
        }
        
    }
    
    /*NSMutableString* achivementString = [NSMutableString string];
    for(int i = 0 ; i < 3 ; i++){
        if(hasPlayedThisMissionBefore[currentChosenMission[i]]){
            printf("iPlay:%i %i\n",i, currentChosenMission[i]);
            
            [achivementString setString:@"missionPlayed_"];
            
            if(currentChosenMission[i] <= 9){
                [achivementString appendString:@"0"];
            }
            
            [achivementString appendFormat:@"%i", currentChosenMission[i]];
            
            [[NSUserDefaults standardUserDefaults] setBool:true forKey:achivementString];
        }
    }*/
    
    
    
   /* recordUse_flyStraightMinSpeed = 5.0;
    recordUse_flyStraightCanFuel = true;
    
    recordUse_flyNearFloorMinSpeed =  10.0;
    recordUse_flyNearFloorCanFuel = true;*/
    
   // recordUse_maxSpeed = 0;
    recordUse_isClickingBtnFromHeavyInvincible = true;  //at beginning, set to TRUE to prevent max speed fuck up
    
    
}

-(void) initForBeginning{
    isBeginningFlight = true;
    player_rotation = -30;
    characterRotation = player_rotation;
    characterX = 0;
    
    //doubt cancel
   // characterY = 440;
    
    playFlightTime = 60;
    beginningFlightTimer = 0;
}

-(void) startFlight{
    if(spin_pefect && spin_hasPerfect){
        [self setHeavyInvincible];
    }
    
    isBeginningFlight = false;
    [mainTurtlePhycis runJump:-999 force:spin_chosenForce];
    
    [musicController setmusicGain:1.0];
    [musicController initForMAINPlay];
}

-(void) initBeginFlightOther{
    //s_riff = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(0/textureRatioForFuckingIpad, 990/textureRatioForFuckingIpad, 644/textureRatioForFuckingIpad, 292/textureRatioForFuckingIpad)];
    s_riff = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(0/textureRatioForFuckingIpad, 1336/textureRatioForFuckingIpad, 582/textureRatioForFuckingIpad, 230/textureRatioForFuckingIpad)];
    [ss_Character addChild:s_riff z:kDeapth_Equip_Rocket];
    [s_riff setAnchorPoint:ccp(0,1.0)];
    
    riff_x = characterX - 240;
    riff_y = characterY - 50;
    [s_riff setPosition:ccp(riff_x, riff_y)];
}

-(void) initSpin{
    
    spin_x = characterX - 65 * 2/textureRatioForFuckingIpad + 44 * 2/textureRatioForFuckingIpad;
    spin_y = characterY + 75 * 2/textureRatioForFuckingIpad + 22 * 2/textureRatioForFuckingIpad;
    spin_isRotating = true;
    spin_isCheating = false;
    spin_pefect = false;
    spin_timer = 0;
    
    spin_noddle_r = 0;
    spin_noddle_vr = 0;
 
    spin_circle_r = 0;
    spin_circle_vr = 0;
    
    spinAngleDiff = 0;

    
    s_spin_circle = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1128/textureRatioForFuckingIpad, 1744/textureRatioForFuckingIpad, 130/textureRatioForFuckingIpad, 130/textureRatioForFuckingIpad)];
    s_spin_noddle = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1264/textureRatioForFuckingIpad, 1794/textureRatioForFuckingIpad, 22/textureRatioForFuckingIpad, 48/textureRatioForFuckingIpad)];
    s_spin_center = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1264/textureRatioForFuckingIpad, 1744/textureRatioForFuckingIpad, 46/textureRatioForFuckingIpad, 46/textureRatioForFuckingIpad)];
    s_spin_perfectFire = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1264/textureRatioForFuckingIpad, 1744/textureRatioForFuckingIpad, 46/textureRatioForFuckingIpad, 46/textureRatioForFuckingIpad)];
    
    //[s_spin_circle setScale:1.2];
   // [s_spin_noddle setScale:1.2];
    //[s_spin_center setScale:1.2];
    
    [s_spin_noddle setAnchorPoint:ccp(0.5,0)];
    
    [ss_Character addChild:s_spin_circle z:kDeapth_Equip_Rocket];
    [ss_Character addChild:s_spin_noddle z:kDeapth_Equip_Rocket];
    [ss_Character addChild:s_spin_center z:kDeapth_Equip_Rocket];
    [ss_Character addChild:s_spin_perfectFire z:kDeapth_Equip_Rocket];
    
    [s_spin_perfectFire setPosition:ccp(100000,10000)];
    
   /* if(oneUse_hardSpin){
         spin_circle_vr = -1.75;
    }*/
   
    
}

-(void) manageSpin{

    if(spin_pefect){
        static int fuckStart = 9999;
        
        if(spin_timer == 0){
            [s_spin_perfectFire setRotation:90];
            spin_perfectFireScaleX = 0;
            spin_perfectFireScaleY = 0;
            spin_perfectFireOpacity = 255;
        }
        
        
        if(spin_perffectCircleTextureIdx == 0){
            [s_spin_circle setTextureRect:CGRectMake(860/textureRatioForFuckingIpad, 1366/textureRatioForFuckingIpad, 130/textureRatioForFuckingIpad, 130/textureRatioForFuckingIpad)];
        }
        if(spin_perffectCircleTextureIdx == 1){
            [s_spin_circle setTextureRect:CGRectMake(726/textureRatioForFuckingIpad, 1366/textureRatioForFuckingIpad, 130/textureRatioForFuckingIpad, 130/textureRatioForFuckingIpad)];
        }
        
        if(spin_timer % 5 == 0){
            spin_perffectCircleTextureIdx++;
            if(spin_perffectCircleTextureIdx == 2){
                spin_perffectCircleTextureIdx = 0;
            }
        }
        
        if(spin_timer >= fuckStart){
            if(spin_timer < 4 + fuckStart){
                spin_perfectFireScaleX += 0.4;
            }else{
                spin_perfectFireScaleX += (1.0 - spin_perfectFireScaleX)/3.0;
            }
            
            if(spin_timer < 6 + fuckStart){
                spin_perfectFireScaleY += 0.3;
            }else if(spin_timer < 54){
                spin_perfectFireScaleY += (1.0 - spin_perfectFireScaleY)/3.0;
            }else{
                spin_perfectFireScaleY -= 0.15;
                if(spin_perfectFireScaleY < 0){
                    spin_perfectFireScaleY = 0;
                }
            }
            
            if(spin_timer % 3 == 0){
                spin_perffectFireTextureIdx++;
            }
            
            if(spin_perffectFireTextureIdx >= 3){
                spin_perffectFireTextureIdx = 0;
            }
            
          /*  if(spin_timer >= 0 + 20){
                spin_perfectFireOpacity -= 15;
                if(spin_perfectFireOpacity < 0){
                    spin_perfectFireOpacity = 0;
                }

            }*/
                       
            [s_spin_perfectFire setPosition:ccp(s_spin_circle.position.x-1, s_spin_circle.position.y + 28)];
            [s_spin_perfectFire setTextureRect:heavyInvincble_texture[spin_perffectFireTextureIdx]];
            [s_spin_perfectFire setScaleX:spin_perfectFireScaleX * 0.7];
            [s_spin_perfectFire setScaleY:spin_perfectFireScaleY * 0.85];
            [s_spin_perfectFire setOpacity:spin_perfectFireOpacity];
        }
       
        
        spin_timer++;
    }
    
    if(spin_isRotating){
        [self spinRotating];
    }
    
    if(spin_isCheating){
        printf("spin_isCheating\n");
        
        //check to apply
        static float checkNext_spin_noddle_r;
        static float checkNext_spin_circle_r;
        static float checkNext_prev_spin_angleDiff;
        static float checkNext_spin_angleDiff;
        
        checkNext_spin_noddle_r = spin_noddle_r;
        checkNext_spin_circle_r = spin_circle_r;
        checkNext_prev_spin_angleDiff = spinAngleDiff;
        
        checkNext_spin_noddle_r += spin_noddle_vr;
        checkNext_spin_circle_r += spin_circle_vr;
        checkNext_spin_angleDiff = checkNext_spin_circle_r - checkNext_spin_noddle_r;
        
        
        if(checkNext_spin_angleDiff > 180){
            checkNext_spin_angleDiff = checkNext_spin_angleDiff - 360;
        }
        
        if(checkNext_spin_angleDiff < -180){
            checkNext_spin_angleDiff = 360 + checkNext_spin_angleDiff;
        }
        
        if(checkNext_prev_spin_angleDiff < 0){
            checkNext_prev_spin_angleDiff *= -1;
        }
        if(checkNext_spin_angleDiff < 0){
            checkNext_spin_angleDiff *= -1;
        }
        
        if(checkNext_spin_angleDiff > checkNext_prev_spin_angleDiff || spin_cheatStep <= 0){
            printf("cancel:%4.8f %4.8f\n",checkNext_spin_angleDiff,checkNext_prev_spin_angleDiff);
            spin_cheatStep = 0;
            spin_isCheating = false;
             [self endSpin2];
        }else{
            [self spinRotating];
        }
        
        spin_cheatStep--;
        
    }
    
    [s_spin_circle setPosition:ccp(spin_x - characterX + cannon_finalScreenX, spin_y - characterY + cannon_finalScreenY)];
    [s_spin_center setPosition:ccp(s_spin_circle.position.x , s_spin_circle.position.y)];
    [s_spin_noddle setPosition:ccp(s_spin_circle.position.x , s_spin_circle.position.y)];
    
    
    
    spinAngleDiff = spin_circle_r - spin_noddle_r;
    
   // printf("manageSpin:%4.8f %4.8f %4.8f\n",spinAngleDiff,spin_noddle_r,spin_circle_r);
    
    if(spinAngleDiff > 180){
        spinAngleDiff = spinAngleDiff - 360;
    }
    
    if(spinAngleDiff < -180){
        spinAngleDiff = 360 + spinAngleDiff;
    }
    
  //  printf("AA  manageSpin:%4.8f %4.8f %4.8f\n",spinAngleDiff,spin_noddle_r,spin_circle_r);
}

-(void) spinRotating{
    spin_noddle_vr += 0.3;
    static float maxSpinNoddleVr;
    if(oneUse_slowCannon){
        maxSpinNoddleVr = 15.0 * 0.7;
    }else{
        maxSpinNoddleVr = 15.0;
    }
    
    if(spin_noddle_vr > maxSpinNoddleVr){
        spin_noddle_vr = maxSpinNoddleVr;
    }
    
    
    static int ranNoodleR;
    static float initNoodleR;
    ranNoodleR = arc4random() % 100;
    initNoodleR = ranNoodleR / 100.0 * 135;
    
    spin_noddle_r += spin_noddle_vr;
    spin_circle_r += spin_circle_vr;
    
    static int ranSpinFuck;
    ranSpinFuck = arc4random()%7;
    if(ranSpinFuck == 0){
        spin_noddle_r += 1;
    }
    if(ranSpinFuck == 1){
        spin_noddle_r += 2;
    }
    if(ranSpinFuck == 2){
        spin_noddle_r += 3;
    }
    
    if(spin_noddle_r > 360){
        spin_noddle_r -= 360;
    }
    
    if(spin_circle_r < 0){
        spin_circle_r += 360;
    }
    
    [s_spin_circle setRotation:spin_circle_r];
    [s_spin_center setRotation:spin_circle_r];
    [s_spin_noddle setRotation:spin_noddle_r];
    
    spin_timer++;
}

-(void) endSpin{
    if(!spin_isRotating){
        return;
    }
    
    spinAngleDiff = spin_circle_r - spin_noddle_r;
    
    printf("endSpin:%4.8f %4.8f %4.8f\n",spinAngleDiff,spin_noddle_r,spin_circle_r);
    
    if(spinAngleDiff > 180){
        spinAngleDiff = spinAngleDiff - 360;
    }
    
    if(spinAngleDiff < -180){
        spinAngleDiff = 360 + spinAngleDiff;
    }
    
    printf("AA  endSpin:%4.8f %4.8f %4.8f\n",spinAngleDiff,spin_noddle_r,spin_circle_r);
    

    
    spin_isRotating = false;
    spin_isCheating = false;

    if(spinAngleDiff > 15 * 0.35 && spinAngleDiff < 90){
    //if(spinAngleDiff > (-15 + spin_noddle_vr)*0.35 && spinAngleDiff < 90){
        spin_isCheating = true;
        
        static float ranSpinDiffRange;
        ranSpinDiffRange = spinAngleDiff;
        
        //spin_noddle_r -= spin_noddle_vr;
        //spin_circle_r -= spin_circle_vr;
        
        static float oneInterval;
        static int maxStep;
        static int ranMaxStep;
        oneInterval = -spin_circle_vr + spin_noddle_vr;
        
        maxStep = 2;
        while (ranSpinDiffRange > oneInterval) {
            ranSpinDiffRange -= oneInterval;
            maxStep++;
        }
        
        ranMaxStep = arc4random()%maxStep;
        spin_cheatStep = ranMaxStep;
        
        printf("ranstep:%i %i  spin_cheatStep:%i  %4.8f\n",ranMaxStep,maxStep,spin_cheatStep,ranSpinDiffRange);
        
       /* static int ranSpinDiffRange;
        static int ranSpinDiff;
        ranSpinDiffRange = (int)spinAngleDiff;
        ranSpinDiff  = arc4random() % ranSpinDiffRange;
        spin_isCheating = true;
        spin_cheatStep = (int)((float)ranSpinDiff/(float)ranSpinDiffRange + 0.5);*/
       // printf("spin_cheatStep:%i %i %i\n",spin_cheatStep,ranSpinDiff,ranSpinDiffRange);
        
    }else{
        //if(spinAngleDiff > -(-15 + spin_noddle_vr)*0.55 && spinAngleDiff < (-15 + spin_noddle_vr)*0.35){
        
        static int fuckRange;
        fuckRange = arc4random() % 100;
        printf("fuckRange:%i\n",fuckRange);
        if(spinAngleDiff > -15*0.55 && spinAngleDiff < 15*0.35){
             printf("PRE go to super directly:%4.8f\n",spinAngleDiff);
            if(fuckRange <= 60){
                printf("go to super directly:%4.8f\n",spinAngleDiff);
                spinAngleDiff = 0;
            }
        }else if(spinAngleDiff <= -15*0.55 && spinAngleDiff > -15*1.0){
            printf("PRE2 go to super directly:%4.8f\n",spinAngleDiff);
            if(fuckRange <= 45){
                printf("go2 to super directly:%4.8f\n",spinAngleDiff);
                spinAngleDiff = 0;
            }
        }else if(spinAngleDiff <= -15*1.0 && spinAngleDiff > -15*1.5){
            printf("PRE3 go to super directly:%4.8f\n",spinAngleDiff);
            if(fuckRange <= 30){
                printf("go3 to super directly:%4.8f\n",spinAngleDiff);
                spinAngleDiff = 0;
            }
        }
    }
    
    if(spin_isCheating){
        return;
    }
    
    [self endSpin2];
    
}

-(void) endSpin2{
    
    spin_pefect = false;
    
    printf("spinAngleDiff:%4.8f\n",spinAngleDiff);

    if(spinAngleDiff < 0){
        spinAngleDiff *= -1;
    }
    
    static bool goFor67PerfectLaunch;
    static int g67Ratio;
    goFor67PerfectLaunch = false;
    
    if(spinAngleDiff >= 8 && spinAngleDiff < 9){
        g67Ratio = arc4random()%4;
        printf("g67Ratio:%i\n",g67Ratio);
        if(g67Ratio == 0){
            goFor67PerfectLaunch = true;
        }
    }
    
    if(spinAngleDiff >= 7 && spinAngleDiff < 8){
        g67Ratio = arc4random()%2;
        printf("g67Ratio:%i\n",g67Ratio);
        if(g67Ratio == 0){
            goFor67PerfectLaunch = true;
        }
    }

    
    if(spinAngleDiff >= 6 && spinAngleDiff < 7){
       /* g67Ratio = arc4random()%4;
        printf("g67Ratio:%i\n",g67Ratio);
        if(g67Ratio <= 2){
            goFor67PerfectLaunch = true;
        }*/
        
        goFor67PerfectLaunch = true;
    }
    
    if(oneUse_superInitBoost || pemanent_perfectLuanch){
        goFor67PerfectLaunch = true;
    }
    
    if(spinAngleDiff < 6){
        goFor67PerfectLaunch = true; 
    }else if(spinAngleDiff < 13){
        spin_forceRatio = 0.9;
    }else if(spinAngleDiff < 20){
        spin_forceRatio = 0.8;
    }else if(spinAngleDiff < 30){
        spin_forceRatio = 0.7;
    }else if(spinAngleDiff < 60){
        spin_forceRatio = 0.6;
    }else if(spinAngleDiff < 75){
        spin_forceRatio = 0.5;
    }else if(spinAngleDiff < 90){
        spin_forceRatio = 0.4;
    }else{
        spin_forceRatio = 0.3;
    }
    
    if(goFor67PerfectLaunch){
        spin_forceRatio = 1.0;
        
        spinAngleDiff = 0;
        
        spin_noddle_r = spin_circle_r;
        
        [s_spin_circle setRotation:spin_circle_r];
        [s_spin_center setRotation:spin_circle_r];
        [s_spin_noddle setRotation:spin_noddle_r];
        
        spin_pefect = true;
        spin_timer = 0;
        spin_perffectFireTextureIdx = 0;
        spin_perffectCircleTextureIdx = 0;
        
        if(oneUse_superInitBoost){
            spin_forceRatio *= 2.0;
            spin_hasPerfect = true;
        }

    }
    
    
    //DELETE LATER
   /* spin_forceRatio = 1.0;
    spinAngleDiff = 0;
    spin_noddle_r = spin_circle_r;
    [s_spin_circle setRotation:spin_circle_r];
    [s_spin_center setRotation:spin_circle_r];
    [s_spin_noddle setRotation:spin_noddle_r];
    spin_pefect = true;
    spin_timer = 0;
    spin_perffectFireTextureIdx = 0;*/
    
    
    
    /*if(oneUse_hardSpin){
        
        if(spinAngleDiff < 6){
            spin_forceRatio = 1.5;
        }else if(spinAngleDiff < 13){
            spin_forceRatio = 1.0;
        }else if(spinAngleDiff < 20){
            spin_forceRatio = 0.9;
        }else if(spinAngleDiff < 30){
            spin_forceRatio = 0.75;
        }else if(spinAngleDiff < 60){
            spin_forceRatio = 0.65;
        }else if(spinAngleDiff < 75){
            spin_forceRatio = 0.55;
        }else if(spinAngleDiff < 90){
            spin_forceRatio = 0.4;
        }else{
            spin_forceRatio = 0.3;
        }
        
    }*/
    
    if(spin_pefect){
        if(spin_hasPerfect){
            characterMaxSpinFlightTime *= 2.0;
        }else{
            characterMaxSpinFlightTime *= 1.5;
        }
        
        recordUse_continuePerfectLaunchTIme++;
    }
    /*else if(oneUse_hardSpin){
        characterMaxSpinFlightTime *= 1.5;
    }*/
    
    if(!spin_pefect){
        recordUse_continuePerfectLaunchTIme = 0;
    }
    
    
    
    spin_chosenForce = spin_maxForce * spin_forceRatio;
    
    if(spin_chosenForce < 6){
        spin_chosenForce = 6;
    }
    
    /*if(spin_chosenForce < 7){
        playFlightTime = 30;
        characterMaxSpinFlightTime = 30;
    }else if(spin_chosenForce < 10){
        playFlightTime = 30;
         characterMaxSpinFlightTime = 30;
    }*/
    
     printf("endSpin2:%4.8f %4.8f %4.8f\n",spinAngleDiff,spin_noddle_r,spin_circle_r);
    
    
    if(spin_pefect){
        playFlightTime = characterMaxSpinFlightTime;
        [musicController playThisSound:kSound_PerfectLaunch isLoop:NO gain:0.5];
        [musicController playThisSound:kSound_PerfectLaunch02 isLoop:NO gain:1.0];
    }
    printf("playFlightTime:%i\n",playFlightTime);
    
   /* if(spin_chosenForce >= 30){
        [cannon setMAINSTARTSHOOTTIMER:90];
        [cannon setMAINPRESHOOTSPEED:40.0];
    }*/

    [cannon setMAINSTARTSHOOTTIMER:60];
    [cannon setMAINPRESHOOTSPEED:30.0];
    
    [self setCannonPrepareShoot];

    
    isEndedSpin = true;

}

-(void) initDistanceShown{
    distanceShown_maxDistance = dragonBall_X[6] * characterXRealityRatio;
    distanceShown_length = 200 * 2/textureRatioForFuckingIpad;
    
    s_distanceShown_line = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(726/textureRatioForFuckingIpad, 1500/textureRatioForFuckingIpad, 452/textureRatioForFuckingIpad, 64/textureRatioForFuckingIpad)];
    s_distanceShown_turtle = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(676/textureRatioForFuckingIpad, 1434/textureRatioForFuckingIpad, 34/textureRatioForFuckingIpad, 32/textureRatioForFuckingIpad)];
    s_distanceShown_bestPosition = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(676/textureRatioForFuckingIpad, 1500/textureRatioForFuckingIpad, 34/textureRatioForFuckingIpad, 32/textureRatioForFuckingIpad)];
    
    //[s_distanceShown_line setAnchorPoint:ccp(0,0.5)];
    
    [ss_Character addChild:s_distanceShown_line z:kDeapth_Penguin_Bombing];
    [ss_Character addChild:s_distanceShown_bestPosition z:kDeapth_Penguin_Bombing];
    [ss_Character addChild:s_distanceShown_turtle z:kDeapth_Penguin_Bombing];
    
    [s_distanceShown_line setPosition:ccp(240, 22)];
    [s_distanceShown_turtle setPosition:ccp(10000, 30)];
    
    if(isIpad){
        [s_distanceShown_line setPosition:ccp(240 * 1024.0/480.0, 22 * 768.0/320.0)];
    }
    
    distanceShown_calRatio = mainOtherData_bestHeight / distanceShown_maxDistance;
    if(distanceShown_calRatio > 1){
        distanceShown_calRatio = 1;
    }
    
    [s_distanceShown_bestPosition setPosition:ccp(distanceShown_calRatio * distanceShown_length + s_distanceShown_line.position.x-104 * 2/textureRatioForFuckingIpad,s_distanceShown_line.position.y+0)];

    [s_distanceShown_line setScale:0];
     [s_distanceShown_turtle setScale:0];
     [s_distanceShown_bestPosition setScale:0];
}

-(void) manageDistanceShown{
    distanceShown_calRatio = characterRealX / distanceShown_maxDistance;
    if(distanceShown_calRatio > 1){
        distanceShown_calRatio = 1;
    }
    [s_distanceShown_turtle setPosition:ccp(distanceShown_calRatio * distanceShown_length + s_distanceShown_line.position.x-104 * 2/textureRatioForFuckingIpad, s_distanceShown_line.position.y+0)];
}


-(void) getUpgradedValues{
    return;
    
    upgraded_maxVelocityX = 10.0;
    upgraded_maxVelocityY = 3.0;
    upgraded_gravity = -0.05;
}

- (void)accelerometer:(UIAccelerometer*)accelerometer didAccelerate:(UIAcceleration*)acceleration
{	
   // printf("EEE.y:%4.8f %4.8f\n",acceleration.x , acceleration.y);
	if(isStopping){
        return;
    }
    
    if(dragonBall_isCollidingOnPillar){
        accelRotation = 0;
        return;
    }
	
    
    
    #define kFilterFactor 0.375f
    

  // accelRotation = -acceleration.y * 0;
    //acceX = (float) -acceleration.y * kFilterFactor + (1- kFilterFactor)*prevX;
    if(gOrientation == UIDeviceOrientationLandscapeRight){
       // printf("RIGHT\n");
        accelRotation = acceleration.y * 0;
        acceX = (float) acceleration.y * kFilterFactor + (1- kFilterFactor)*prevX;
    }else{
       //  printf("LEFT\n");
        accelRotation = -acceleration.y * 0;
        acceX = (float) -acceleration.y * kFilterFactor + (1- kFilterFactor)*prevX;
    }
    
   // accelRotation = -acceleration.y * 0;
   // acceX = (float) -acceleration.y * kFilterFactor + (1- kFilterFactor)*prevX;
   

	prevX = acceX;
    
    
}

-(void) initRecords{
    record_height = 0;
    record_maxAttitude = 0;
    record_hitted = 0;
    record_coinsCollected = 0;
    record_mission = 0;
    for(int i = 0 ; i < 7 ; i++){
        record_hasHittedDragonBall[i] = false;
    }
    
    
    record_totalFlightTime = 0;
    record_destroyUseTime = 0;
    record_flyStraightTime = 0;
    record_flyNearFloorTime = 0;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
        
        d = [[UIDevice currentDevice] orientation];

        
        printf("init PLAYSCENE\n");
        //self.isTouchEnabled = YES;
        
        ad_howmanyMainGamePlayed++;
        
        perfectLaunchSound = 1.0;
        engineSound = 0.0;
        
        [musicController playThisSound:kSound_engine isLoop:YES gain:0];
        [musicController playThisSound:kSound_TimeRunOutSlow isLoop:YES gain:0.0];
        [musicController playThisSound:kSound_TimeRunOutFast isLoop:YES gain:0.0];
        
        [musicController initForWind];
        
        isPlayingEngineSound = false;
        windSoundGain = 0.3;
        windSoundIsIncreasing = true;
        isEndedSpin = false;
        
        floorTime = 9999;
        
        //RESET
        player_rotation = 0;
        player_y = 0;
        player_x = 0;
        
        glide_vmag = 0;
        glide_vx = 0;
        glide_vy = 0;
        glide_vdir = 0;
        glide_ratio = 0;
        grav_mag = 0;
        
        lift = 0;
        myself_redVX = 0;
        myself_redVY = 0;
        
        characterCollideVY = 0;
        characterCollideVX = 0;
        characterCollideVR = 0;
        
        timeChosenToDisplay = 0;
        
       /* for(int i = 0 ; i < 5 ; i++){
            s_temp[i] = [CCSprite spriteWithFile:@"penguinJump_btn_left_Off.png"];
            [s_temp[i] setScale:0.1];
            [self addChild:s_temp[i] z:kDeapth_FUCKTOP];
        }*/
        

        isPlayingWithAccelator = true;
        hasWinMission = false;
        
        dragonBall_isInHittingRange = false;
        isSlowing = false;
        hasFinishedOneRound = false;
        landingFloorTimer = 0;
        
        if(isPlayingWithAccelator){
            self.isAccelerometerEnabled = YES;
            [[UIAccelerometer sharedAccelerometer] setUpdateInterval:1.0 / 30.0];
        }
        

        
        AppController *appDelegate =(AppController*) [[UIApplication sharedApplication] delegate];
        [appDelegate getMissionValues];
        [appDelegate getUpgadeValues];
        [self getMissionOtherValues];
        
      //  [musicController initForMAINPlay];
        
        gameLevel = 0;
        
        characterXRealityRatio = 0.1;
        characterYRealityRatio = 0.1;
        
        
        characterStatus = kCharacterStatus_Flying;
        characterFlyingStep = 0;
        
        self.isTouchEnabled = YES;
        isStopping = false;
        isPlayingMiniGame = false;
        isClickingRocket = false;
        isClickingAntiClockwise = false;
        isClickingClockwise = false;
        isInvicinble = false;
        isEndingRedDueToHeavyInvincible = false;
        
        missionChecker = 0;

        wholeCannonScaleFromSocurce = 0.5;
        wholeTurtleScaleFromSocurce = 0.375;
        wholePenguinScaleFromSocurce = 0.5;
        characterRotation = 0;
        characterVR = 0;
       // wholeScale = 0.4;
        wholeScale = 0.375;
        
        
        characterX = 0;
        characterY = 200+123;
        characterVX = 0;
        characterVY = 0;
        character0To180FreeAX = 0;
        character0To180FreeAY = 0;
        
        characterRealY = characterY * characterYRealityRatio;
        
        
        characterSuddenVY = 0;
         suddenFuckUpAccumX = 0;
         suddenFuckUpAccumAngle = 0;
         prevCharacterX = 0;
         prevCharacterAngle = 0;
        
        //screenX = 240;
        //screenY = 120;
        screenX = 240;
        screenY = 120;
        
        if(isIpad){
            screenX = 250;
            screenY = 250;
            //screenY *= 768.0/320.0;
        }
        
        cannon_initScreenX = screenX;
        cannon_initScreenY = screenY;
        cannon_finalScreenX = screenX + (326.9 * cos(-33 * M_PI/180) - 394 * cos(-33 * M_PI/180)) * wholeCannonScaleFromSocurce;
        cannon_finalScreenY = screenY - (326.9 * sin(-33 * M_PI/180) - 394 * sin(-33 * M_PI/180)) * wholeCannonScaleFromSocurce;
        
        if(isIpad){
            cannon_finalScreenX -= 20;
            cannon_finalScreenY -= 50;
        }
        
        printf("screenX:%4.8f %4.8f\n",screenX,cannon_finalScreenX);
        printf("screenY:%4.8f %4.8f\n",screenY,cannon_finalScreenY);
        
        startToDeclineY = 120;
        minFloorY = 40;
        //minFloorY = 0;
        
        if(isIpad){
            startToDeclineY *= 768.0/320.0;
            minFloorY *= 768.0/320.0;
            //startToDeclineY *= 2;
            //minFloorY *= 2;
            
            startToDeclineY = 270;
        }
         
        isApplyingFuel = false;
        

        ss_Character  = [CCSpriteBatchNode batchNodeWithFile:@"whole_turtle_MAIN.png" capacity:1];
     //   ss_Character  = [CCSpriteBatchNode spriteSheetWithFile:@"whole_turtle.png" capacity:1];
        [self addChild:ss_Character z:kDeapth_ssCharacter];
        
        characterDetectNumber = 4;
        characterDetectX[0] = 48;
        characterDetectY[0] = 27;
        characterDetectX[1] = characterDetectX[0] - 47;
        characterDetectY[1] = characterDetectY[0] - 15;
        characterDetectX[2] = characterDetectX[0] - 23;
        characterDetectY[2] = characterDetectY[0] - 15;
        characterDetectX[3] = characterDetectX[0] - 68;
        characterDetectY[3] = characterDetectY[0] - 22;
        
        if(isIpad){
            characterDetectX[0] = 96;
            characterDetectY[0] = 54;
            characterDetectX[1] = characterDetectX[0] - 94;
            characterDetectY[1] = characterDetectY[0] - 30;
            characterDetectX[2] = characterDetectX[0] - 46;
            characterDetectY[2] = characterDetectY[0] - 30;
            characterDetectX[3] = characterDetectX[0] - 136;
            characterDetectY[3] = characterDetectY[0] - 44;
        }
        
        
        [self getDataFromUpgrades];
        [self initForBeginning];
        [self initRecords];
        [self initUI];
        [self initCharacter];
        [self initControlLayer];
        [self initBg];
       // [self getUpgradedValues];   DELETE LATER
        [self initMenu];
        [self initDragonBalls];
        [self initDragonDetect];
        [self initBomobingAni];
        [self initMissionCheck];
        [self initMainTurtlePhysics];
        [self initFinishedOneRound];
        [self initMissionCompletedShown];
        [self initSpeical];
        [self initCannon];
        [self initSpin];
        [self initBeginFlightOther];
        [self initDistanceShown];
        [self initTransition];
        
        [self initP4RC];

        playTimer = 0;
        [self schedule: @selector(gameStep:)];
        
    }
	return self;
}

-(void) displayP4RCLastPoint{
    printf("displayP4RCLastPoint:%i\n",lastFuckPoint);
    [l_p4rc_earned setPosition:ccp(172,41)];
    
    if(isIpad){
        [l_p4rc_earned setPosition:ccp(l_p4rc_earned.position.x * 1024.0/480.0, l_p4rc_earned.position.y * 768.0/320.0)];
    }

    
    [l_p4rc_earned setString:[NSString stringWithFormat:@"%i", lastFuckPoint]];
    [self removeP4RCSpin];
}

-(void) removeP4RCSpin{
    if(p4rc_isRemovedSpin){
        return;
    }
    
    p4rc_isRemovedSpin = true;
    
    printf("removeP4RCSpin\n");
    AppController *appDelegate =(AppController*) [[UIApplication sharedApplication] delegate];
    [appDelegate removeIndicatorView];
}

-(void) showP4RC{
    [s_p4rc_setense1 setTextureRect:CGRectMake(1188/textureRatioForFuckingIpad, 278/textureRatioForFuckingIpad, 314/textureRatioForFuckingIpad, 28/textureRatioForFuckingIpad)];
    [s_p4rc_setense2 setTextureRect:CGRectMake(1594/textureRatioForFuckingIpad, 278/textureRatioForFuckingIpad, 412/textureRatioForFuckingIpad, 28/textureRatioForFuckingIpad)];
    [s_p4rcIcon setTextureRect:CGRectMake(1338/textureRatioForFuckingIpad, 1118/textureRatioForFuckingIpad, 80/textureRatioForFuckingIpad, 78/textureRatioForFuckingIpad)];
    
    [s_p4rc_setense1 setAnchorPoint:ccp(0,0.5)];
    [s_p4rc_setense1 setPosition:ccp(14,40)];
    [s_p4rc_setense2 setPosition:ccp(14,20)];
    
    if(isIpad){
        [s_p4rc_setense1 setPosition:ccp(14 * 1024.0/480.0, 40 * 768.0/320.0)];
        [s_p4rc_setense2 setPosition:ccp(14 * 1024.0/480.0, 20 * 768.0/320.0)];
    }
    
    [s_p4rcIcon setPosition:ccp(446-200,40-8)];
    
    if(isIpad){
        [s_p4rcIcon setPosition:ccp(246 * 1024.0/480.0, 32 * 768.0/320.0)];
    }
    
    if(isIphone5){
        [s_p4rc_setense1 setPosition:ccp(s_p4rc_setense1.position.x + 44, s_p4rc_setense1.position.y)];
        [s_p4rc_setense2 setPosition:ccp(s_p4rc_setense2.position.x + 44, s_p4rc_setense2.position.y)];
        [s_p4rcIcon setPosition:ccp(s_p4rcIcon.position.x + 44, s_p4rcIcon.position.y)];
    }
    
    p4rc_isRemovedSpin = false;
    p4rc_spinningTimer = 0;
    
    AppController *appDelegate =(AppController*) [[UIApplication sharedApplication] delegate];
    [appDelegate loadIndicatorView];
    
    
    // Create a menu item image button
    CCMenuItem *heyzap = [CCMenuItemImage itemWithNormalImage:@"Heyzap.bundle/btn-sdk-checkin.png"
                                                selectedImage:@"Heyzap.bundle/btn-sdk-checkin-down.png"
                                                       target:self
                                                     selector:@selector(heyzapCheckinTapped:)];
    
    // Set x and y to be the position on screen where you want to place the button
    heyzap.position = ccp(165,-128);
    
    if(isIpad){
        heyzap.position = ccp(230,-308);
    }
    
    // Add it to the menu (or use your existing menu instead)
    CCMenu *heyzapMenu = [CCMenu menuWithItems:heyzap, nil];
    [self addChild:heyzapMenu z:kDeapth_ssCharacter];
}

- (void)heyzapCheckinTapped: (id)sender {
    AppController *appDelegate =(AppController*) [[UIApplication sharedApplication] delegate];
    [appDelegate setHeyTimer];
    
    NSMutableString* heyString;
    heyString = [NSMutableString string];
    [heyString setString:@"My turtle has just flown for a distance of "];
    [heyString appendFormat:@"%i", (int)record_height];
    [heyString appendString:@" meters!"];
    
     [[HeyzapCocos2DSDK sharedSDK] checkinWithMessage:heyString];
    
    [appDelegate submitAllScoreToHeyZap];
}

-(void) initP4RC{
    
    AppController *appDelegate =(AppController*) [[UIApplication sharedApplication] delegate];
    [appDelegate setFucklegate:self];
    [appDelegate didStartLevel];
    
    if(isIpad){
        l_p4rc_earned = [CCLabelAtlas labelWithString:@"0" charMapFile:@"fontV2.png" itemWidth:44 itemHeight:54 startCharMap:'0'];
    }else{
        l_p4rc_earned = [CCLabelAtlas labelWithString:@"0" charMapFile:@"fontV2.png" itemWidth:22 itemHeight:27 startCharMap:'0'];
    }
    
    [l_p4rc_earned setColor:ccc3(255, 255, 255)];
    [l_p4rc_earned setAnchorPoint:ccp(0,0.5)];
    [l_p4rc_earned setScale:0.611];
    

    s_p4rc_setense1 = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad)];
    s_p4rc_setense2 = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad)];
    s_p4rcIcon = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad)];
    
    [s_p4rc_setense1 setAnchorPoint:ccp(0,0.5)];
    [s_p4rc_setense2 setAnchorPoint:ccp(0,0.5)];
    
    
    [ss_Character addChild:s_p4rc_setense1 z:kDeapth_Gameover];
    [ss_Character addChild:s_p4rc_setense2 z:kDeapth_Gameover];
    [ss_Character addChild:s_p4rcIcon z:kDeapth_Gameover];
    [self addChild:l_p4rc_earned z:kDeapth_ssCharacter];
    
    [s_p4rc_setense1 setPosition:ccp(10000,100000)];
    [l_p4rc_earned setPosition:ccp(10000,100000)];
    [s_p4rcIcon setPosition:ccp(10000,100000)];
}

-(void) initTransition{
    [finishOne_colorLayer setTextureRect:CGRectMake(728/textureRatioForFuckingIpad, 326/textureRatioForFuckingIpad, 2, 2)];
    [finishOne_colorLayer setScaleX:300];
    [finishOne_colorLayer setScaleY:180];
    
    if(isIpad){
        [finishOne_colorLayer setScaleX:600];
        [finishOne_colorLayer setScaleY:400];
    }
    
    [finishOne_colorLayer setColor:ccc3(0, 0, 0)];
    [finishOne_colorLayer setOpacity:255];
    finishOne_colorLayerOpacity = 255;
    [finishOne_colorLayer setPosition:ccp([UIScreen mainScreen].bounds.size.height/2, [UIScreen mainScreen].bounds.size.width/2)];
    
}


-(void) initFinishedOneRound{
    finishOne_colorLayer= [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad)];
    [ss_Character addChild:finishOne_colorLayer z:kDeapth_Gameover];
    [finishOne_colorLayer setPosition:ccp(10000,10000)];
    
    finishOne_s_bg = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(0/textureRatioForFuckingIpad, 906/textureRatioForFuckingIpad, 680/textureRatioForFuckingIpad, 406/textureRatioForFuckingIpad)];
    finishOne_s_btnOn = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1442/textureRatioForFuckingIpad, 152/textureRatioForFuckingIpad, 546/textureRatioForFuckingIpad, 103/textureRatioForFuckingIpad)];
    finishOne_totalMoneyWord = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(518/textureRatioForFuckingIpad, 284/textureRatioForFuckingIpad, 256/textureRatioForFuckingIpad, 26/textureRatioForFuckingIpad)];
    
    [finishOne_s_bg setPosition:ccp(10000,100000)];
    [finishOne_s_btnOn setPosition:ccp(10000,100000)];
    [finishOne_totalMoneyWord setPosition:ccp(10000,100000)];
    
    [ss_Character addChild:finishOne_s_bg z:kDeapth_Gameover];
    [ss_Character addChild:finishOne_s_btnOn z:kDeapth_Gameover];
    [ss_Character addChild:finishOne_totalMoneyWord z:kDeapth_Gameover];
    
    /*maxOneRoundWord = 7;
    for(int i = 0 ; i < maxOneRoundWord ; i++){
        finishOne_l_height[i] = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad)];
        finishOne_l_hiehgtMoney[i] = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad)];
        finishOne_l_attitude[i] = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad)];
        finishOne_l_attitudeMoney[i] = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad)];
        finishOne_l_hitted[i] = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad)];
        finishOne_l_hittedMoney[i] = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad)];
        finishOne_l_coin[i] = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad)];
        finishOne_l_coinMoney[i] = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad)];
    }*/
    
    
    
    if(isIpad){
        finishOne_l_height = [CCLabelAtlas labelWithString:@"0" charMapFile:@"fontV1.png" itemWidth:24 itemHeight:28 startCharMap:'0'];
        finishOne_l_hiehgtMoney = [CCLabelAtlas labelWithString:@"0" charMapFile:@"fontV1.png" itemWidth:24 itemHeight:28 startCharMap:'0'];
        finishOne_l_attitude = [CCLabelAtlas labelWithString:@"0" charMapFile:@"fontV1.png" itemWidth:24 itemHeight:28 startCharMap:'0'];
        finishOne_l_attitudeMoney = [CCLabelAtlas labelWithString:@"0" charMapFile:@"fontV1.png" itemWidth:24 itemHeight:28 startCharMap:'0'];
        finishOne_l_hitted = [CCLabelAtlas labelWithString:@"0" charMapFile:@"fontV1.png" itemWidth:24 itemHeight:28 startCharMap:'0'];
        finishOne_l_hittedMoney = [CCLabelAtlas labelWithString:@"0" charMapFile:@"fontV1.png" itemWidth:24 itemHeight:28 startCharMap:'0'];
        finishOne_l_coin = [CCLabelAtlas labelWithString:@"0" charMapFile:@"fontV1.png" itemWidth:24 itemHeight:28 startCharMap:'0'];
        finishOne_l_coinMoney = [CCLabelAtlas labelWithString:@"0" charMapFile:@"fontV1.png" itemWidth:24 itemHeight:28 startCharMap:'0'];
        finishOne_l_totalMoney = [CCLabelAtlas labelWithString:@"0" charMapFile:@"fontV1.png" itemWidth:24 itemHeight:28 startCharMap:'0'];
        finishOne_l_missionMoney = [CCLabelAtlas labelWithString:@"0" charMapFile:@"fontV1.png" itemWidth:24 itemHeight:28 startCharMap:'0'];
    }else{
        finishOne_l_height = [CCLabelAtlas labelWithString:@"0" charMapFile:@"fontV1.png" itemWidth:12 itemHeight:14 startCharMap:'0'];
        finishOne_l_hiehgtMoney = [CCLabelAtlas labelWithString:@"0" charMapFile:@"fontV1.png" itemWidth:12 itemHeight:14 startCharMap:'0'];
        finishOne_l_attitude = [CCLabelAtlas labelWithString:@"0" charMapFile:@"fontV1.png" itemWidth:12 itemHeight:14 startCharMap:'0'];
        finishOne_l_attitudeMoney = [CCLabelAtlas labelWithString:@"0" charMapFile:@"fontV1.png" itemWidth:12 itemHeight:14 startCharMap:'0'];
        finishOne_l_hitted = [CCLabelAtlas labelWithString:@"0" charMapFile:@"fontV1.png" itemWidth:12 itemHeight:14 startCharMap:'0'];
        finishOne_l_hittedMoney = [CCLabelAtlas labelWithString:@"0" charMapFile:@"fontV1.png" itemWidth:12 itemHeight:14 startCharMap:'0'];
        finishOne_l_coin = [CCLabelAtlas labelWithString:@"0" charMapFile:@"fontV1.png" itemWidth:12 itemHeight:14 startCharMap:'0'];
        finishOne_l_coinMoney = [CCLabelAtlas labelWithString:@"0" charMapFile:@"fontV1.png" itemWidth:12 itemHeight:14 startCharMap:'0'];
        finishOne_l_totalMoney = [CCLabelAtlas labelWithString:@"0" charMapFile:@"fontV1.png" itemWidth:12 itemHeight:14 startCharMap:'0'];
        finishOne_l_missionMoney = [CCLabelAtlas labelWithString:@"0" charMapFile:@"fontV1.png" itemWidth:12 itemHeight:14 startCharMap:'0'];
    }
    
    [self addChild:finishOne_l_height z:kDeapth_ssCharacter];
     [self addChild:finishOne_l_hiehgtMoney z:kDeapth_ssCharacter];
     [self addChild:finishOne_l_attitude z:kDeapth_ssCharacter];
     [self addChild:finishOne_l_attitudeMoney z:kDeapth_ssCharacter];
     [self addChild:finishOne_l_hitted z:kDeapth_ssCharacter];
     [self addChild:finishOne_l_hittedMoney z:kDeapth_ssCharacter];
     [self addChild:finishOne_l_coin z:kDeapth_ssCharacter];
     [self addChild:finishOne_l_coinMoney z:kDeapth_ssCharacter];
    [self addChild:finishOne_l_totalMoney z:kDeapth_ssCharacter];
    [self addChild:finishOne_l_missionMoney z:kDeapth_ssCharacter];
    
    [finishOne_l_height setAnchorPoint:ccp(0,0.5)];
    [finishOne_l_hiehgtMoney setAnchorPoint:ccp(0,0.5)];
    [finishOne_l_attitude setAnchorPoint:ccp(0,0.5)];
    [finishOne_l_attitudeMoney setAnchorPoint:ccp(0,0.5)];
    [finishOne_l_hitted setAnchorPoint:ccp(0,0.5)];
    [finishOne_l_hittedMoney setAnchorPoint:ccp(0,0.5)];
    [finishOne_l_coin setAnchorPoint:ccp(0,0.5)];
    [finishOne_l_coinMoney setAnchorPoint:ccp(0,0.5)];
    [finishOne_l_totalMoney setAnchorPoint:ccp(0,0.5)];
    [finishOne_l_missionMoney setAnchorPoint:ccp(0,0.5)];
    
    [finishOne_l_height setColor:ccc3(140, 59, 19)];
    [finishOne_l_attitude setColor:ccc3(140, 59, 19)];
    [finishOne_l_hitted setColor:ccc3(140, 59, 19)];
    [finishOne_l_coin setColor:ccc3(140, 59, 19)];
    
    [finishOne_l_height setPosition:ccp(10000,10000)];
    [finishOne_l_hiehgtMoney setPosition:ccp(10000,10000)];
    [finishOne_l_attitude setPosition:ccp(10000,10000)];
    [finishOne_l_attitudeMoney setPosition:ccp(10000,10000)];
    [finishOne_l_hitted setPosition:ccp(10000,10000)];
    [finishOne_l_hittedMoney setPosition:ccp(10000,10000)];
    [finishOne_l_coin setPosition:ccp(10000,10000)];
    [finishOne_l_coinMoney setPosition:ccp(10000,10000)];
    [finishOne_l_totalMoney setPosition:ccp(10000,10000)];
    [finishOne_l_missionMoney setPosition:ccp(10000,10000)];
    

    finishOne_string = [[NSMutableString string] retain];

}


-(void) initMainTurtlePhysics{
    mainTurtlePhycis = [[MainTurtlePhycis node] retain];
}

-(void) initBg{
    mainBgLayer = [[MainBgLayer alloc] init];
}

-(void) initUI{
    mainUILayer = [[MainUILayer alloc] init];
}

-(void) initDragonBalls{
    dragonBall_isCollidingOnPillar = false;
    dragonBall_isCollidingAtDragonBall = false;
    dragonBall_s_targeting_isPillarBreaking = false;
    maxDragonBalls = 7;
    maxPillarMiddle = 5;
    dragonBall_pillarDtectRadius = 53 * 2/textureRatioForFuckingIpad;
    dragonBall_targetingIdx = -1;
    dragonBall_checkTimer = 0;
    dragonBall_targetMovingAngle = 0;
    
  
    
    dragonBall_howmanyStars[0] = 1;
    dragonBall_howmanyStars[1] = 1;
    dragonBall_howmanyStars[2] = 1;
    dragonBall_howmanyStars[3] = 1;
    dragonBall_howmanyStars[4] = 1;
    dragonBall_howmanyStars[5] = 1;
    dragonBall_howmanyStars[6] = 1;
    
    dragonBall_isBreaking = false;
    dragonBall_breakingTimer = 0;
    
    dragonBall_s_targeting_ballBottom = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1074/textureRatioForFuckingIpad, 342/textureRatioForFuckingIpad, 224/textureRatioForFuckingIpad, 224/textureRatioForFuckingIpad)];
    dragonBall_s_targeting_ballTop = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1302/textureRatioForFuckingIpad, 342/textureRatioForFuckingIpad, 224/textureRatioForFuckingIpad, 224/textureRatioForFuckingIpad)];
    for(int i = 0 ; i < maxDragonBalls ; i++){
        dragonBall_s_targeting_ballStar[i] = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1578/textureRatioForFuckingIpad, 456/textureRatioForFuckingIpad, 64/textureRatioForFuckingIpad, 64/textureRatioForFuckingIpad)];
    }
    
    dragonBall_s_targeting_cover = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(808/textureRatioForFuckingIpad, 342/textureRatioForFuckingIpad, 258/textureRatioForFuckingIpad, 210/textureRatioForFuckingIpad)];
    dragonBall_s_targeting_breakCover[0] = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1722/textureRatioForFuckingIpad, 342/textureRatioForFuckingIpad, 160/textureRatioForFuckingIpad, 142/textureRatioForFuckingIpad)];
    dragonBall_s_targeting_breakCover[1] = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1884/textureRatioForFuckingIpad, 342/textureRatioForFuckingIpad, 164/textureRatioForFuckingIpad, 184/textureRatioForFuckingIpad)];
    dragonBall_s_targeting_breakSpike[0] = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1528/textureRatioForFuckingIpad, 342/textureRatioForFuckingIpad, 52/textureRatioForFuckingIpad, 42/textureRatioForFuckingIpad)];
    dragonBall_s_targeting_breakSpike[1] = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1582/textureRatioForFuckingIpad, 342/textureRatioForFuckingIpad, 54/textureRatioForFuckingIpad, 42/textureRatioForFuckingIpad)];
    dragonBall_s_targeting_breakSpike[2] = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1640/textureRatioForFuckingIpad, 342/textureRatioForFuckingIpad, 64/textureRatioForFuckingIpad, 50/textureRatioForFuckingIpad)];
    dragonBall_s_targeting_breakSpike[3] = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1528/textureRatioForFuckingIpad, 342/textureRatioForFuckingIpad, 52/textureRatioForFuckingIpad, 48/textureRatioForFuckingIpad)];
    dragonBall_s_targeting_breakSpike[4] = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1582/textureRatioForFuckingIpad, 342/textureRatioForFuckingIpad, 46/textureRatioForFuckingIpad, 52/textureRatioForFuckingIpad)];
    dragonBall_s_targeting_breakSpike[5] = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1636/textureRatioForFuckingIpad, 342/textureRatioForFuckingIpad, 84/textureRatioForFuckingIpad, 48/textureRatioForFuckingIpad)];
    dragonBall_s_targeting_breakSpike[6] = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1528/textureRatioForFuckingIpad, 342/textureRatioForFuckingIpad, 30/textureRatioForFuckingIpad, 72/textureRatioForFuckingIpad)];
    
    dragonBall_s_targeting_pillarBottom = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1882/textureRatioForFuckingIpad, 1982/textureRatioForFuckingIpad, 106/textureRatioForFuckingIpad, 66/textureRatioForFuckingIpad)];
    dragonBall_s_targeting_pillarTop = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1882/textureRatioForFuckingIpad, 1672/textureRatioForFuckingIpad, 106/textureRatioForFuckingIpad, 62/textureRatioForFuckingIpad)];
    
    for(int i = 0 ; i < maxPillarMiddle ; i++){
        dragonBall_s_targeting_pillarMiddle[i] = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad)];
    }
    
    
    
    [ss_Character addChild:dragonBall_s_targeting_ballBottom z:kDeapth_Extra2];
    for(int i = 0 ; i < maxDragonBalls ; i++){
        [ss_Character addChild:dragonBall_s_targeting_ballStar[i] z:kDeapth_Extra2];
    }
    [ss_Character addChild:dragonBall_s_targeting_ballTop z:kDeapth_Extra2];
    
    
    [ss_Character addChild:dragonBall_s_targeting_cover z:kDeapth_Bg_Element1];
    [ss_Character addChild:dragonBall_s_targeting_breakCover[0] z:kDeapth_Bg_Element1];
    [ss_Character addChild:dragonBall_s_targeting_breakCover[1] z:kDeapth_Bg_Element1];
    for(int i = 0 ; i < 7 ; i++){
        [ss_Character addChild:dragonBall_s_targeting_breakSpike[i] z:kDeapth_Bg_Element1];
    }
    
    for(int i = 0 ; i < maxPillarMiddle ; i++){
        [ss_Character addChild:dragonBall_s_targeting_pillarMiddle[i] z:kDeapth_Bg_Element1];
        [dragonBall_s_targeting_pillarMiddle[i] setAnchorPoint:ccp(0.5,0)];
    }
    
    [ss_Character addChild:dragonBall_s_targeting_pillarBottom z:kDeapth_Bg_Element1];
    [ss_Character addChild:dragonBall_s_targeting_pillarTop z:kDeapth_Bg_Element1];
    
    [dragonBall_s_targeting_pillarBottom setAnchorPoint:ccp(0.5,0)];
    [dragonBall_s_targeting_pillarTop setAnchorPoint:ccp(0.5,0)];
     
    
    for(int i = 0 ; i < maxDragonBalls ; i++){
       // dragonBall_Y[i] = 300;
        dragonBall_isAvailable[i] = false;
        dragonBall_hasBroken[i] = false;
        dragonBall_hasEnoughMissionCompleted[i] = false;
    }
    
    dragonBall_detectRange[0] = 2000;
    dragonBall_detectRange[1] = 3000;
    dragonBall_detectRange[2] = 4000;
    dragonBall_detectRange[3] = 5000;
    dragonBall_detectRange[4] = 6500;
    dragonBall_detectRange[5] = 8000;
    dragonBall_detectRange[6] = 10000;
    
    dragonBall_hasEnoughMissionCompleted[0] = false;
    dragonBall_hasEnoughMissionCompleted[1] = false;
    dragonBall_hasEnoughMissionCompleted[2] = false;
    dragonBall_hasEnoughMissionCompleted[3] = false;
    dragonBall_hasEnoughMissionCompleted[4] = false;
    dragonBall_hasEnoughMissionCompleted[5] = false;
    dragonBall_hasEnoughMissionCompleted[6] = false;
    dragonBall_isAvailable[0] = true;
    dragonBall_isAvailable[1] = true;
    dragonBall_isAvailable[2] = true;
    dragonBall_isAvailable[3] = true;
    dragonBall_isAvailable[4] = true;
    dragonBall_isAvailable[5] = true;
    dragonBall_isAvailable[6] = true;
    
    if(hasFinishedMission[14]){
        dragonBall_isAvailable[0] = false;
        dragonBall_hasEnoughMissionCompleted[0] = true;
    }else{
        for(int i = 0 ; i < 3 ; i++){
            if(currentChosenMission[i] == 14){
                dragonBall_hasEnoughMissionCompleted[0] = true;  
            }
        }
    }
    
    if(hasFinishedMission[28]){
        dragonBall_isAvailable[1] = false;
        dragonBall_hasEnoughMissionCompleted[1] = true;
    }else{
        for(int i = 0 ; i < 3 ; i++){
            if(currentChosenMission[i] == 28){
                dragonBall_hasEnoughMissionCompleted[1] = true;  
            }
        }
    }
    
    if(hasFinishedMission[43]){
        dragonBall_isAvailable[2] = false;
        dragonBall_hasEnoughMissionCompleted[2] = true;
    }else{
        for(int i = 0 ; i < 3 ; i++){
            if(currentChosenMission[i] == 43){
                dragonBall_hasEnoughMissionCompleted[2] = true;  
            }
        }
    }
    
    if(hasFinishedMission[53]){
        dragonBall_isAvailable[3] = false;
        dragonBall_hasEnoughMissionCompleted[3] = true;
    }else{
        for(int i = 0 ; i < 3 ; i++){
            if(currentChosenMission[i] == 53){
                dragonBall_hasEnoughMissionCompleted[3] = true;  
            }
        }
    }
    
    if(hasFinishedMission[64]){
        dragonBall_isAvailable[4] = false;
        dragonBall_hasEnoughMissionCompleted[4] = true;
    }else{
        for(int i = 0 ; i < 3 ; i++){
            if(currentChosenMission[i] == 64){
                dragonBall_hasEnoughMissionCompleted[4] = true;  
            }
        }
    }
    
    if(hasFinishedMission[78]){
        dragonBall_isAvailable[5] = false;
        dragonBall_hasEnoughMissionCompleted[5] = true;
    }else{
        for(int i = 0 ; i < 3 ; i++){
            if(currentChosenMission[i] == 78){
                dragonBall_hasEnoughMissionCompleted[5] = true;  
            }
        }
    }
    
    if(hasFinishedMission[87]){
        dragonBall_isAvailable[6] = false;
        dragonBall_hasEnoughMissionCompleted[6] = true;
    }else{
        for(int i = 0 ; i < 3 ; i++){
            if(currentChosenMission[i] == 87){
                dragonBall_hasEnoughMissionCompleted[6] = true;  
            }
        }
    }
    
    //DELETE LATER
   // dragonBall_isAvailable[0] = true;
   // dragonBall_hasEnoughMissionCompleted[0] = true;
    
    for(int i = 0 ; i < maxDragonBalls ; i++){
        dragonBall_oriX[i] = dragonBall_X[i];
        dragonBall_oriY[i] = dragonBall_Y[i];
        
        if(dragonBall_isAvailable[i]){
            printf("dragonBall_isAvailable:%i\n",i);
        }
        if(dragonBall_hasEnoughMissionCompleted[i]){
            printf("dragonBall_hasEnoughMissionCompleted:%i\n",i);
        }
    }
    
    [dragonBall_s_targeting_ballBottom setPosition:ccp(10000,10000)];
    [dragonBall_s_targeting_ballTop setPosition:ccp(10000,10000)];
    for(int i = 0 ; i < maxDragonBalls ; i++){
        [dragonBall_s_targeting_ballStar[i] setPosition:ccp(10000,100000)];
    }
    
    [dragonBall_s_targeting_cover setPosition:ccp(10000,10000)];
    [dragonBall_s_targeting_breakCover[0] setPosition:ccp(10000,10000)];
    [dragonBall_s_targeting_breakCover[1] setPosition:ccp(10000,10000)];
    for(int i = 0 ; i < 7 ; i++){
        [dragonBall_s_targeting_breakSpike[i] setPosition:ccp(10000,10000)];
    }
    
    
    [dragonBall_s_targeting_pillarTop setPosition:ccp(10000,10000)];
    [dragonBall_s_targeting_pillarBottom setPosition:ccp(10000,10000)];
    for(int i = 0 ; i < maxPillarMiddle ; i++){
         [dragonBall_s_targeting_pillarMiddle[i] setPosition:ccp(10000,10000)];
    }
    
}

-(void) initDragonDetect{
    
    s_dragonDetect = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1792/textureRatioForFuckingIpad, 976/textureRatioForFuckingIpad, 138/textureRatioForFuckingIpad, 138/textureRatioForFuckingIpad)];
    s_dragonDetectObj = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad)];
   // s_dragonDetectArrow = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1932/textureRatioForFuckingIpad, 906/textureRatioForFuckingIpad, 34/textureRatioForFuckingIpad, 28/textureRatioForFuckingIpad)];
    s_dragonDetectArrow = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1932/textureRatioForFuckingIpad, 906/textureRatioForFuckingIpad, 30/textureRatioForFuckingIpad, 36/textureRatioForFuckingIpad)];
    
    if(isIpad){
        s_dragonDetectDotLine = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(934/textureRatioForFuckingIpad, 578/textureRatioForFuckingIpad, 1024/textureRatioForFuckingIpad, 4/textureRatioForFuckingIpad)];
    }else{
        s_dragonDetectDotLine = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(934/textureRatioForFuckingIpad, 578/textureRatioForFuckingIpad, 960/textureRatioForFuckingIpad, 4/textureRatioForFuckingIpad)];
    }
    
    dragonDetect_dotLineOpacity = 0;
    
    [s_dragonDetect setScale:0.0];
    [s_dragonDetectObj setScale:0.0];
    [s_dragonDetectArrow setScale:0.0];
    
    [ss_Character addChild:s_dragonDetectDotLine];
    [ss_Character addChild:s_dragonDetect z:kDeapth_Bg_Element1];
    [ss_Character addChild:s_dragonDetectObj z:kDeapth_Bg_Element1];
    [ss_Character addChild:s_dragonDetectArrow z:kDeapth_Bg_Element1];
    
    [s_dragonDetect setPosition:ccp(10000,10000)];
    [s_dragonDetectObj setPosition:ccp(10000,10000)];
    [s_dragonDetectArrow setPosition:ccp(10000,10000)];
    
    dragonDetect_isAni = false;
    
    s_dragonDetect_digit[0] = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad)];
    s_dragonDetect_digit[1] = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad)];
    s_dragonDetect_digit[2] = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad)];
    s_dragonDetect_digit[3] = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad)];
    
    [ss_Character addChild:s_dragonDetect_digit[0] z:kDeapth_Bg_Element1];
    [ss_Character addChild:s_dragonDetect_digit[1] z:kDeapth_Bg_Element1];
    [ss_Character addChild:s_dragonDetect_digit[2] z:kDeapth_Bg_Element1];
    [ss_Character addChild:s_dragonDetect_digit[3] z:kDeapth_Bg_Element1];
    
    
    [s_dragonDetect_digit[0] setPosition:ccp(10000,100000)];
    [s_dragonDetect_digit[1] setPosition:ccp(10000,100000)];
    [s_dragonDetect_digit[2] setPosition:ccp(10000,100000)];
    [s_dragonDetect_digit[3] setPosition:ccp(10000,100000)];
    
    [s_dragonDetect_digit[0] setScale:0.95];
    [s_dragonDetect_digit[1] setScale:0.95];
    [s_dragonDetect_digit[2] setScale:0.95];
    [s_dragonDetect_digit[3] setScale:0.95];
        
}

-(void) initCharacter{
    turtle = [[Turtle alloc] init];
    [turtle setX:1000];
    [turtle setY:10000];
    [turtle setFacingRight:true];
    [turtle setStatus:kTurtleAniStatus_Flying];
    [turtle setIdNumber:999];
    characterMass = 1.0;

    
    mainTurtleEquipments  = [[MainTurtleEquipments alloc] init];
    
    
    maxAirPenguin = 30;
    airPenguinIdx = 0;
    maxAirPenguinOnScreen = 1;
    howmanyAirPenguinOnScreen = 0;
    for(int i = 0 ; i < maxAirPenguin ; i++){
        airPenguin[i] = [[Penguin alloc] init];
        [airPenguin[i] setFacingRight:true];
        [airPenguin[i] setIDNumber:i];
        [airPenguin[i] setMAINX:24000];
        [airPenguin[i] setMAINY:16000];
        [airPenguin[i] setStatus:kPenguinAniStatus_Idle];
        [airPenguin[i] setOutside]; 
        
        airPenguinMass[i] = 4.0;
        airPenguinIsAni[i] = false;
        airPenguinIsColliding[i] = false;
    }
}



-(void) initControlLayer{
    controlLayer = [ControlLayer node];
	[self addChild:controlLayer z:kDeapth_Btns];
    [controlLayer setDelegate:self];
}

-(void )removeSlow{
    isSlowing = false;
    slowTimer = 0;
}

-(void) setSlow:(int)_speed{
   /* if(!isSlowing){
        isSlowing = true;
        slowStep = 2;
        return;
    }
    
    slowStep+=4;
    if(slowStep > 30){
        slowStep = 30;
    }*/
    
    if(isSlowing){
        return;
    }
    
    isSlowing = true;
    slowStep = _speed;
}

-(void) manageShowTime:(ccTime) dt{
    
    if(isUnderingTotalFlightTime){
        //[mainUILayer setShowTime];
        if(!isBeginningFlight){
            
            record_totalFlightTime += dt;
            
            if(canDisplayTotalFlightTime){
                timeChosenToDisplay = record_totalFlightTime;
            }
            
           // printf("record_totalFlightTime:%4.8f\n",record_totalFlightTime);
            
            if(characterY <= minFloorY+1 || dragonBall_isCollidingOnPillar){
                record_totalFlightTime = 0;
                if(canDisplayTotalFlightTime){
                    [mainUILayer removeShowTime];
                }
                
            }else{
                if(canDisplayTotalFlightTime){
                    [mainUILayer setShowTime];
                }
            }
            
        }
        
    }
    
    
    if(isUnderingDestroyUseTime){
        
        if(!isBeginningFlight){
            if(record_destroyUseTime == 0){
                if(canDisplayDestroyUseTime){
                    [mainUILayer setShowTime];
                }  
            }
            
            record_destroyUseTime += dt;
            if(canDisplayDestroyUseTime){
                 timeChosenToDisplay = record_destroyUseTime;
            }
           
           //  printf("record_destroyUseTime:%4.8f\n",record_destroyUseTime);
            
            if(dragonBall_isCollidingOnPillar){
                record_destroyUseTime = 0;
                if(canDisplayDestroyUseTime){
                    [mainUILayer removeShowTime];
                }
                isUnderingDestroyUseTime = false;
            }
            
            if(dragonBall_targetingIdx == recordUse_targetDragonBall && dragonBall_isBreaking){
                if(canDisplayDestroyUseTime){
                    [mainUILayer removeShowTime];
                }
                isUnderingDestroyUseTime = false;
            }
            
            if(recordUse_howmanyDragonBallHitted == recordUse_howmanyDragonBallNeedToHit){
                if(canDisplayDestroyUseTime){
                    [mainUILayer removeShowTime];
                }
                isUnderingDestroyUseTime = false;
            }
            
        }
        
    }
    
    
    static bool canFuck;
    
    if(isUnderingFlyStraightTime){
        canFuck = false;

        if(characterRotation > -10 && characterRotation < 10){
            if(characterVelocity >= recordUse_flyStraightMinSpeed){
                if(recordUse_flyStraightCanFuel){
                    canFuck = true;
                }else{
                    if(!isApplyingFuel){
                        canFuck = true;
                    }
                }
            }
        }
        
        
        if(characterY <= minFloorY+1 || dragonBall_isCollidingOnPillar){
            canFuck = false;
        }
        
        if(characterVY*characterVY > characterVX*characterVX){
            canFuck = false;
        }

        if(canFuck){
            record_flyStraightTime+=dt;
            if(canDisplayFlyStraightTime){
                timeChosenToDisplay = record_flyStraightTime;
                [mainUILayer setShowTime];
            }
            
          //  printf("record_flyStraightTime:%4.8f\n",record_flyStraightTime);
        }else{
            record_flyStraightTime = 0;
            if(canDisplayFlyStraightTime){
                [mainUILayer removeShowTime];
            }
        }
    }
    
    
    
    if(isUnderingFlyNearFloorTime){
        canFuck = false;
       // printf("characterRealY:%4.8f\n",characterRealY);
        if(characterRotation > -10 && characterRotation < 10){
            if(characterVelocity >= recordUse_flyNearFloorMinSpeed && characterRealY <= 4.0 * 2/textureRatioForFuckingIpad){
                if(recordUse_flyNearFloorCanFuel){
                    canFuck = true;
                }else{
                    if(!isApplyingFuel){
                        canFuck = true;
                    }
                }
            }
        }
        
        if(characterY <= minFloorY+1 || dragonBall_isCollidingOnPillar){
            canFuck = false;
        }

        if(characterVY*characterVY > characterVX*characterVX){
            canFuck = false;
        }
        
        if(canFuck){
            record_flyNearFloorTime+=dt;
            if(canDisplayFlyNearFloorTime){
                timeChosenToDisplay = record_flyNearFloorTime;
                [mainUILayer setShowTime];
            }
            
          //  printf("record_flyNearFloorTime:%4.8f\n",record_flyNearFloorTime);
        }else{
            record_flyNearFloorTime = 0;
            if(canDisplayFlyNearFloorTime){
                [mainUILayer removeShowTime];
            } 
        }
    }

    
}

-(void) gameStep:(ccTime) dt{
  
    if(isStopping){
        return;
    }

    [self manageShowTime:dt];

    
    superFuxkAngleDiff = -characterRotation * M_PI/180;   
    characterIsFacingDirection = atan2(characterVY, characterVX);
    characterVelocity = sqrt(characterVX*characterVX + characterVY*characterVY);
    
    
    if(!hasFinishedOneRound){
        
       // static bool canRunGameStep;
       /* canRunGameStep = false;
        
        if(isSlowing){
            slowTimer++;
            if(slowTimer % (int)slowStep == 0){
                canRunGameStep = true;

                slowStep -= slowStep/10;
                
                slowTimer = 0;
                if((int)slowStep <= 0){
                    isSlowing = false;
                }
            }
        }else{
            canRunGameStep = true;
        }*/
       
        if(playTimer < playFlightTime){
           // printf("playTimer:%i %i\n",playTimer,playFlightTime);
            if(spin_pefect){
               // printf("perfectLaunchSound:%4.8f\n",perfectLaunchSound);
                
                if(playTimer == 0){
                    perfectLaunchSound -= 0.03;
                    if(perfectLaunchSound < 0){
                        perfectLaunchSound = 0;
                    }
                }else{
                    perfectLaunchSound -= 0.05;
                    if(perfectLaunchSound < 0){
                        perfectLaunchSound = 0;
                    }
                }
                
                [musicController changeGain:kSound_PerfectLaunch02 gain:perfectLaunchSound];
            }
            
            if(isEndedSpin && isBeginningFlight){
                windSoundGain -= 0.05;
                if(windSoundGain < 0){
                    windSoundGain = 0;
                }
                [musicController setmusicGain:windSoundGain];
            }else{
                if(windSoundIsIncreasing){
                    windSoundGain += 0.005;
                    if(windSoundGain >= 0.75){
                        windSoundGain = 0.75;
                        windSoundIsIncreasing = !windSoundIsIncreasing;
                    }
                }else{
                    windSoundGain -= 0.005;
                    if(windSoundGain <= 0.3){
                        windSoundGain = 0.3;
                        windSoundIsIncreasing = !windSoundIsIncreasing;
                    }
                }
                [musicController setmusicGain:windSoundGain];
            }
            
           
            
            finishOne_colorLayerOpacity -= 10;
            if(finishOne_colorLayerOpacity < 0){
                if(finishOne_colorLayerOpacity >= -10){
                    [finishOne_colorLayer setScaleX:0];
                    [finishOne_colorLayer setScaleY:0];
                }
                finishOne_colorLayerOpacity = -99999;
            }else{
                [finishOne_colorLayer setOpacity:finishOne_colorLayerOpacity];
            }
            
            
            if(playTimer >= 1){
               // printf("runRoateAfterCannonShot:%i\n",playFlightTime);
                [mainTurtlePhycis runRoateAfterCannonShot:playFlightTime];
            } 
        }
        
        //if(canRunGameStep){
        if(playTimer == (playFlightTime + 120)){
            recordUse_isClickingBtnFromHeavyInvincible = false;
           // recordUse_maxSpeed = characterVelocity;
            // printf("recordUse_maxSpeed:%4.8f\n",recordUse_maxSpeed);
        }
        
        
            characterLastVY = characterVY;
            characterLastVX = characterVX;
            
            
            [self manageCharacter];
            // [self manageWholeMovement];
            [self manageAirPenguins];
            [self manageDragonBalls];
            [self manageDragonDetect];
            [self manageInvicinble];
            [self manageBombScript];
            [mainTurtleEquipments manage];
            [mainBgLayer manage];
            [mainUILayer manage:dt];
            
            //[self manageMissionCheck];

            [turtle setX:screenX];
            [turtle setY:screenY];
            [turtle setRotation:characterRotation];
            [turtle mainManage:dt];
            
            
            if(!isBeginningFlight){
                [self manageMainTurtlePhysics];
                
                if(playTimer < 60){
                    screenX += ([UIScreen mainScreen].bounds.size.height/2 - screenX)/5.0;
                    
                    if(isIpad){
                        screenY += (270 - screenY)/5.0;
                    }else{
                        screenY += (120 - screenY)/5.0;
                    }
                    
                }
                
                playTimer++;
            }else{
                beginningFlightTimer++;
            }
            
            [self manageWholeMovement];
            
            [self manageThurstSound];
            
            [self manageHeavyInvincible];
            [self manageLightInvincible];
            
            [self manageDistanceShown];
    
        if(!isBeginningFlight && !isHeavyInvincible){
            if([mainUILayer gainTime:characterGainInvincibleInterval]){
                [self setHeavyInvincible];
            }
        }
            
       // }
        
        
    }else{
         [self manageFinishedOneRound];
    }

    
    [self maangeCannon];
    [controlLayer MAIN_manageChanging];
   
    [self manageMissionCompletedShown];
}

-(void) manageThurstSound{
    if(isApplyingFuel){
        static float vRatio;
        vRatio = characterVelocity/10.0;
        if(vRatio < 0){
            vRatio *= -1;
        }
        if(vRatio > 1){
            vRatio = 1;
        }
        applyPitch += ((2.0 + 3.0 * vRatio) - applyPitch)/10;
        applyGain += ((0.3 - 0.15 * vRatio) - applyGain)/10;

    }else{
        applyPitch += (1.0 - applyPitch)/10;
        applyGain += (0.5 - applyGain)/10;
    }
    //[musicController changePitchOnEngine:applyPitch gain:applyGain];
}

-(void) manageMainTurtlePhysics{
    if(isApplyingFuel){
        if(isHeavyInvincible){
            [mainTurtlePhycis applyBoost:stat_boost_thrust[playerBoost] * 3.0];
        }else{
            [mainTurtlePhycis applyBoost:stat_boost_thrust[playerBoost]];
        }
        
    }
    
    
    if(!isPlayingWithAccelator){
        if(isClickingClockwise){
            [mainTurtlePhycis runRotate:false acceX:0];
        }
        if(isClickingAntiClockwise){
            [mainTurtlePhycis runRotate:true acceX:0];
        }
    }else{
        [mainTurtlePhycis runRotate:false acceX:acceX];
    }
    
    
    static int runStep;
    runStep++;
    if(runStep % 2 == 0){
        [mainTurtlePhycis runGlide];
        [mainTurtlePhycis runRandomRotation];
    }
    
    
}

-(void) manageDragonBalls{
    //CHECK TARGET BALL
    static bool isTargetChanging;
    
    isTargetChanging = false;
    if(dragonBall_checkTimer % 60 == 0){
        static int checkingTargetBallIdx;
        if(characterVX >= 0){
            checkingTargetBallIdx = dragonBall_targetingIdx + 1;
        }else{
            checkingTargetBallIdx = dragonBall_targetingIdx - 1;
        }
    
        if(checkingTargetBallIdx >= 0 && checkingTargetBallIdx < maxDragonBalls){
            static int checkingTargetDiffX;
            checkingTargetDiffX = characterX - dragonBall_X[checkingTargetBallIdx];
            //printf("checkingTargetBallIdx:%i\n",checkingTargetBallIdx);
            if(checkingTargetDiffX < 3000 && checkingTargetDiffX > -3000){
                dragonBall_targetingIdx = checkingTargetBallIdx;
                printf("CHANGED:%i\n",dragonBall_targetingIdx);
                isTargetChanging = true;
            }
        }
        
        if(dragonBall_targetingIdx  == -1){
            dragonBall_targetingIdx = 0;
            isTargetChanging = true;
        }
        
        //printf("manageDragonBalls:%4.8f %4.8f %4.8f %4.8f\n",characterX,dragonBall_s_targeting_pillarTop.position.y,
            //   dragonBall_s_targeting_pillarBottom.position.y,dragonBall_s_targeting_pillarMiddle[0].position.y);
    }
    
    dragonBall_checkTimer++;
    
   
    
    if(isTargetChanging){
        //printf("isTargetChanging\n");
        for(int i = 0 ; i < maxPillarMiddle ; i++){
            [dragonBall_s_targeting_pillarMiddle[i] setTextureRect:CGRectMake(0, 0, 0, 0)];
        }
        
        dragonBall_s_targeting_howmanyStars = dragonBall_howmanyStars[dragonBall_targetingIdx];
        
        if(isIpad){
            dragonBall_s_targeting_detectRadius = 14400; //67;
        }else{
            dragonBall_s_targeting_detectRadius = 4500; //67;
        }
        
       // dragonBall_s_targeting_coverToBallOffsetX = 5.5;
       // dragonBall_s_targeting_coverToBallOffsetY = -22.5;
        dragonBall_targeting_cover_Scale = 1.0;
        
            
        if(dragonBall_targetingIdx == 0){
            dragonBall_targetHowmnayPillarMiddle = 1;
            [dragonBall_s_targeting_pillarMiddle[0] setTextureRect:CGRectMake(1882/textureRatioForFuckingIpad, 1750/textureRatioForFuckingIpad, 106/textureRatioForFuckingIpad, 48/textureRatioForFuckingIpad)];
            dragonBall_targetPillarBottomY = 34 * 2/textureRatioForFuckingIpad;
            dragonBall_targetPillarMiddleY[0] = dragonBall_targetPillarBottomY + 32 * 2/textureRatioForFuckingIpad;
            dragonBall_targetPillarTopY = dragonBall_targetPillarMiddleY[0] + 22 * 2/textureRatioForFuckingIpad;
            
            
            //plus 10
            dragonBall_s_targeting_detectLine[0] = dragonBall_targetPillarTopY + 40 * 2/textureRatioForFuckingIpad;
            dragonBall_s_targeting_detectLine[1] = dragonBall_targetPillarBottomY - 10 * 2/textureRatioForFuckingIpad;
            dragonBall_s_targeting_detectLine[2] = dragonBall_X[dragonBall_targetingIdx] + 5 * 2/textureRatioForFuckingIpad - 35 * 2/textureRatioForFuckingIpad;
            dragonBall_s_targeting_detectLine[3] = dragonBall_X[dragonBall_targetingIdx] + 5 * 2/textureRatioForFuckingIpad + 35 * 2/textureRatioForFuckingIpad;

        }
        
        if(dragonBall_targetingIdx == 1){
            dragonBall_targetHowmnayPillarMiddle = 2;
            [dragonBall_s_targeting_pillarMiddle[0] setTextureRect:CGRectMake(1882/textureRatioForFuckingIpad, 1824/textureRatioForFuckingIpad, 106/textureRatioForFuckingIpad, 64/textureRatioForFuckingIpad)];
            [dragonBall_s_targeting_pillarMiddle[1] setTextureRect:CGRectMake(1882/textureRatioForFuckingIpad, 1754/textureRatioForFuckingIpad, 106/textureRatioForFuckingIpad, 56/textureRatioForFuckingIpad)];
            dragonBall_targetPillarBottomY = 34;
            dragonBall_targetPillarMiddleY[0] = dragonBall_targetPillarBottomY + 32 * 2/textureRatioForFuckingIpad;
            dragonBall_targetPillarMiddleY[1] = dragonBall_targetPillarMiddleY[0] + 30 * 2/textureRatioForFuckingIpad;
            dragonBall_targetPillarTopY = dragonBall_targetPillarMiddleY[1] + 26 * 2/textureRatioForFuckingIpad;
            
          //  dragonBall_s_targeting_detectRadius = 2873;
          //  dragonBall_s_targeting_detectRadius = 115*0.8;
          //  dragonBall_targeting_cover_Scale = 0.8;
            
            //plus 10
            dragonBall_s_targeting_detectLine[0] = dragonBall_targetPillarTopY + 40 * 2/textureRatioForFuckingIpad;
            dragonBall_s_targeting_detectLine[1] = dragonBall_targetPillarBottomY - 10 * 2/textureRatioForFuckingIpad;
            dragonBall_s_targeting_detectLine[2] = dragonBall_X[dragonBall_targetingIdx] + 5 * 2/textureRatioForFuckingIpad - 35 * 2/textureRatioForFuckingIpad;
            dragonBall_s_targeting_detectLine[3] = dragonBall_X[dragonBall_targetingIdx] + 5 * 2/textureRatioForFuckingIpad + 35 * 2/textureRatioForFuckingIpad;
        }

        
        if(dragonBall_targetingIdx == 2){
            dragonBall_targetHowmnayPillarMiddle = 3;
            [dragonBall_s_targeting_pillarMiddle[0] setTextureRect:CGRectMake(1882/textureRatioForFuckingIpad, 1886/textureRatioForFuckingIpad, 106/textureRatioForFuckingIpad, 80/textureRatioForFuckingIpad)];
            [dragonBall_s_targeting_pillarMiddle[1] setTextureRect:CGRectMake(1882/textureRatioForFuckingIpad, 1824/textureRatioForFuckingIpad, 106/textureRatioForFuckingIpad, 64/textureRatioForFuckingIpad)];
            [dragonBall_s_targeting_pillarMiddle[2] setTextureRect:CGRectMake(1882/textureRatioForFuckingIpad, 1754/textureRatioForFuckingIpad, 106/textureRatioForFuckingIpad, 56/textureRatioForFuckingIpad)];
            dragonBall_targetPillarBottomY = 34;
            dragonBall_targetPillarMiddleY[0] = dragonBall_targetPillarBottomY + 32 * 2/textureRatioForFuckingIpad;
            dragonBall_targetPillarMiddleY[1] = dragonBall_targetPillarMiddleY[0] + 38 * 2/textureRatioForFuckingIpad;
            dragonBall_targetPillarMiddleY[2] = dragonBall_targetPillarMiddleY[1] + 30 * 2/textureRatioForFuckingIpad;
            dragonBall_targetPillarTopY = dragonBall_targetPillarMiddleY[2] + 26 * 2/textureRatioForFuckingIpad;
            
            //plus 10
            dragonBall_s_targeting_detectLine[0] = dragonBall_targetPillarTopY + 40 * 2/textureRatioForFuckingIpad;
            dragonBall_s_targeting_detectLine[1] = dragonBall_targetPillarBottomY - 10 * 2/textureRatioForFuckingIpad;
            dragonBall_s_targeting_detectLine[2] = dragonBall_X[dragonBall_targetingIdx] + 5 * 2/textureRatioForFuckingIpad - 35 * 2/textureRatioForFuckingIpad;
            dragonBall_s_targeting_detectLine[3] = dragonBall_X[dragonBall_targetingIdx] + 5 * 2/textureRatioForFuckingIpad + 35 * 2/textureRatioForFuckingIpad;
        }
        
        
        if(dragonBall_targetingIdx == 3){
            dragonBall_targetHowmnayPillarMiddle = 0;
            dragonBall_targetPillarBottomY = 0;
            dragonBall_targetPillarMiddleY[0] = 0;
            dragonBall_targetPillarTopY = 0;
            dragonBall_s_targeting_detectLine[0] = 0;
            dragonBall_s_targeting_detectLine[1] = 0;
            dragonBall_s_targeting_detectLine[2] = 0;
            dragonBall_s_targeting_detectLine[3] = 0;
            
            
            if(isIpad){
                dragonBall_s_targeting_detectRadius = 26500;
            }else{
                dragonBall_s_targeting_detectRadius = 6750;
            }
            
            dragonBall_targeting_cover_Scale = 1.5;
        }
        
        if(dragonBall_targetingIdx == 4){
            dragonBall_targetHowmnayPillarMiddle = 0;
            dragonBall_targetPillarBottomY = 0;
            dragonBall_targetPillarMiddleY[0] = 0;
            dragonBall_targetPillarTopY = 0;
            dragonBall_s_targeting_detectLine[0] = 0;
            dragonBall_s_targeting_detectLine[1] = 0;
            dragonBall_s_targeting_detectLine[2] = 0;
            dragonBall_s_targeting_detectLine[3] = 0;
            
            
            if(isIpad){
                dragonBall_s_targeting_detectRadius = 26500;
            }else{
                dragonBall_s_targeting_detectRadius = 6750;
            }
            
            dragonBall_targeting_cover_Scale = 1.5;
        }
        
        if(dragonBall_targetingIdx == 5){
            dragonBall_targetHowmnayPillarMiddle = 0;
            dragonBall_targetPillarBottomY = 0;
            dragonBall_targetPillarMiddleY[0] = 0;
            dragonBall_targetPillarTopY = 0;
            dragonBall_s_targeting_detectLine[0] = 0;
            dragonBall_s_targeting_detectLine[1] = 0;
            dragonBall_s_targeting_detectLine[2] = 0;
            dragonBall_s_targeting_detectLine[3] = 0;
            
            
            if(isIpad){
                dragonBall_s_targeting_detectRadius = 107500;
            }else{
                dragonBall_s_targeting_detectRadius = 27000;
            }
            
            dragonBall_targeting_cover_Scale = 2.5;
        }
        
        
        //tet 6
        if(dragonBall_targetingIdx == 6){
            dragonBall_targetHowmnayPillarMiddle = 0;
            dragonBall_targetPillarBottomY = 0;
            dragonBall_targetPillarMiddleY[0] = 0;
            dragonBall_targetPillarTopY = 0;
            dragonBall_s_targeting_detectLine[0] = 0;
            dragonBall_s_targeting_detectLine[1] = 0;
            dragonBall_s_targeting_detectLine[2] = 0;
            dragonBall_s_targeting_detectLine[3] = 0;
            
            if(isIpad){
                dragonBall_s_targeting_detectRadius = 292000;
            }else{
                dragonBall_s_targeting_detectRadius = 50000;
            }
            
            dragonBall_targeting_cover_Scale = 4.0;
            
        }
        
        if(dragonBall_s_targeting_howmanyStars == 1){
            [dragonBall_s_targeting_ballStar[0] setScale:2.0];
            dragonBall_s_targeting_starToBallOffsetX[0] = 9.0/2.0 * dragonBall_targeting_cover_Scale;
            dragonBall_s_targeting_starToBallOffsetY[0] = -6.0/2.0 * dragonBall_targeting_cover_Scale;
        }

        
        dragonBall_s_targeting_coverToBallOffsetX = 5.5 * dragonBall_targeting_cover_Scale;
        dragonBall_s_targeting_coverToBallOffsetY = -22.5 * dragonBall_targeting_cover_Scale;
        
       // printf("dragonBall_s_targeting_coverToBallOffsetX:%4.8f %4.8f\n",dragonBall_s_targeting_coverToBallOffsetX,dragonBall_s_targeting_coverToBallOffsetY);
        

        [dragonBall_s_targeting_cover setScale:dragonBall_targeting_cover_Scale];
        [dragonBall_s_targeting_ballBottom setScale:dragonBall_targeting_cover_Scale];
        [dragonBall_s_targeting_ballTop setScale:dragonBall_targeting_cover_Scale];
        for(int kk = 0 ; kk < dragonBall_s_targeting_howmanyStars ; kk++){
            [dragonBall_s_targeting_ballStar[kk] setScale:dragonBall_targeting_cover_Scale * 2.0];
        }
    }
    
    static float dragonBall_displayingTargetX;
    static float dragonBall_displayingTargetY;
    dragonBall_displayingTargetX = dragonBall_X[dragonBall_targetingIdx] - characterX + screenX;
    dragonBall_displayingTargetY = dragonBall_Y[dragonBall_targetingIdx] - characterY + screenY;
    
    static int displayRange;
    displayRange = 200 * 2/textureRatioForFuckingIpad;
    if(dragonBall_targetingIdx == 6){
        displayRange = 500 * 2/textureRatioForFuckingIpad;
    }

    if(dragonBall_displayingTargetX > -displayRange && dragonBall_displayingTargetX < ([UIScreen mainScreen].bounds.size.height+displayRange) && dragonBall_hasEnoughMissionCompleted[dragonBall_targetingIdx] && !dragonBall_hasBroken[dragonBall_targetingIdx]){
        if(dragonBall_displayingTargetY > -displayRange && dragonBall_displayingTargetY < ([UIScreen mainScreen].bounds.size.width+displayRange)){

            dragonBall_targetMovingAngle += 0.034906585;
            dragonBall_Y[dragonBall_targetingIdx] = dragonBall_oriY[dragonBall_targetingIdx] + 5 * sin(dragonBall_targetMovingAngle);
            
            if(dragonBall_isCollidingAtDragonBall){
               // screenX = characterCollideAtX + dragonBallCollideAtX - dragonBall_X[dragonBall_targetingIdx];
                screenY = characterCollideAtY - dragonBall_Y[dragonBall_targetingIdx]  + dragonBallCollideAtY;
               // printf("KK:%4.8f %4.8f\n",characterY,screenY);
            }
            
            
            
            if(!dragonBall_hasBroken[dragonBall_targetingIdx]){
                if(dragonBall_isAvailable[dragonBall_targetingIdx] && !dragonBall_isBreaking){
                    [dragonBall_s_targeting_ballBottom setPosition:ccp(dragonBall_displayingTargetX,dragonBall_displayingTargetY)];
                    [dragonBall_s_targeting_ballTop setPosition:ccp(dragonBall_displayingTargetX,dragonBall_displayingTargetY)];
                    //printf("dragonBall_s_targeting_ballBottom:%4.8f\n",dragonBall_s_targeting_ballBottom.scale);
                    
                    for(int i = 0 ; i < dragonBall_s_targeting_howmanyStars ; i++){
                        [dragonBall_s_targeting_ballStar[i] setPosition:ccp(dragonBall_displayingTargetX + dragonBall_s_targeting_starToBallOffsetX[i], dragonBall_displayingTargetY + dragonBall_s_targeting_starToBallOffsetY[i])];
                    }
                }
                
                
                if(!dragonBall_isBreaking){
                  //  printf("CHECK\n");
                    [self checkIfCollideWithTargetBall];
                }
                
                [dragonBall_s_targeting_cover setPosition:ccp(dragonBall_displayingTargetX + dragonBall_s_targeting_coverToBallOffsetX,dragonBall_displayingTargetY + dragonBall_s_targeting_coverToBallOffsetY)];

            }else{
                [dragonBall_s_targeting_cover setPosition:ccp(10000,10000)];
            }
            
         //   printf("\n");
            
            if(!dragonBall_s_targeting_isPillarBreaking){
                dragonBall_s_targeting_pillarX = dragonBall_displayingTargetX + 5;
                dragonBall_displayingTargetY = dragonBall_targetPillarTopY - characterY + screenY;
                [dragonBall_s_targeting_pillarTop setPosition:ccp(dragonBall_s_targeting_pillarX,dragonBall_displayingTargetY)];
                
                dragonBall_displayingTargetY = dragonBall_targetPillarBottomY - characterY + screenY;
                [dragonBall_s_targeting_pillarBottom setPosition:ccp(dragonBall_s_targeting_pillarX,dragonBall_displayingTargetY)];
                
                for(int i = 0 ; i < dragonBall_targetHowmnayPillarMiddle ; i++){
                    dragonBall_displayingTargetY = dragonBall_targetPillarMiddleY[i] - characterY + screenY;
                    [dragonBall_s_targeting_pillarMiddle[i] setPosition:ccp(dragonBall_s_targeting_pillarX, dragonBall_displayingTargetY)];
                }
                
                
                [self checkIfCollideWithTargetPillar];
            }else{
                
            }
           
            
        }
    }
    
    
    if(dragonBall_s_targeting_isPillarBreaking){
        dragonBall_s_targeting_pillarX = dragonBall_displayingTargetX + 5;
        dragonBall_displayingTargetY = dragonBall_targetPillarBottomY - characterY + screenY;
        [dragonBall_s_targeting_pillarBottom setPosition:ccp(dragonBall_s_targeting_pillarX,dragonBall_displayingTargetY)];
        
        dragonBall_s_targeting_pillarTopBreak_x += dragonBall_s_targeting_pillarTopBreak_vx;
        dragonBall_s_targeting_pillarTopBreak_y += dragonBall_s_targeting_pillarTopBreak_vy;
        dragonBall_s_targeting_pillarTopBreak_r += dragonBall_s_targeting_pillarTopBreak_vr;
        dragonBall_s_targeting_pillarTopBreak_vy += -0.95;
        [dragonBall_s_targeting_pillarTop setPosition:ccp(dragonBall_s_targeting_pillarTopBreak_x - characterX + screenX,
                                                          dragonBall_s_targeting_pillarTopBreak_y - characterY + screenY)];
        [dragonBall_s_targeting_pillarTop setRotation:dragonBall_s_targeting_pillarTopBreak_r];
        
        for(int i = 0 ; i < dragonBall_targetHowmnayPillarMiddle ; i++){
            dragonBall_s_targeting_pillarBreak_x[i] += dragonBall_s_targeting_pillarBreak_vx[i];
            dragonBall_s_targeting_pillarBreak_y[i] += dragonBall_s_targeting_pillarBreak_vy[i];
            dragonBall_s_targeting_pillarBreak_r[i] += dragonBall_s_targeting_pillarBreak_vr[i];
            dragonBall_s_targeting_pillarBreak_vy[i] += -0.95;
            [dragonBall_s_targeting_pillarMiddle[i] setPosition:ccp(dragonBall_s_targeting_pillarBreak_x[i] - characterX + screenX,
                                                                    dragonBall_s_targeting_pillarBreak_y[i] - characterY + screenY)];
            [dragonBall_s_targeting_pillarMiddle[i] setRotation:dragonBall_s_targeting_pillarBreak_r[i]];
        }
        
        dragonBall_s_targeting_pillarBreakingTimer++;
        if(dragonBall_s_targeting_pillarBreakingTimer == 200){
            dragonBall_s_targeting_isPillarBreaking = false;
            [dragonBall_s_targeting_pillarTop setRotation:0];
            for(int i = 0 ; i < 5 ; i++){
                [dragonBall_s_targeting_pillarMiddle[i] setRotation:0];
            }
        }
    }
    
   // printf("dragonBall_displayingTargetX:%4.8f %4.8f\n",dragonBall_displayingTargetX,dragonBall_displayingTargetY);
    
    if(dragonBall_isBreaking){
        if((dragonBall_breakingTimer >= 240 && dragonBall_targetingIdx != dragonBall_breakingIdx) || isTargetChanging){
            //printf("NEXT SHITSGT\n");
            dragonBall_isBreaking  = false;
            dragonBall_hasBroken[dragonBall_breakingIdx] = true;
        }
    }
   
    
    if(dragonBall_isBreaking){
        //----RUN dragon ball disappear ani
        if(dragonBall_isAvailable[dragonBall_targetingIdx]){

            if(dragonBall_breakingTimer == 0){
                dragonBallDisappear_scale = dragonBall_targeting_cover_Scale;
                dragonBallDisappear_r = 0;
            }
            
            if(dragonBall_breakingTimer < 90){
                dragonBall_displayingTargetY = dragonBall_Y[dragonBall_targetingIdx] - characterY + screenY;
                
                dragonBallDisappear_x = dragonBall_displayingTargetX;
                dragonBallDisappear_y = dragonBall_displayingTargetY;
            }else{
                static float disappearAngleDiff;
                
                if(dragonBall_breakingTimer == 90){
                     disappearAngleDiff = atan2(290-dragonBallDisappear_y, 141-dragonBallDisappear_x);
                }
                
                dragonBallDisappear_x += 15*cos(disappearAngleDiff);
                dragonBallDisappear_y += 15*sin(disappearAngleDiff);
                dragonBallDisappear_r += 2.0;
                
                dragonBallDisappear_scale -= 0.017;
                if(dragonBallDisappear_scale < 0){
                    dragonBallDisappear_scale = 0;
                }
            }
            
            
            dragonBallDisappear_r += 1.5;
            
            
            [dragonBall_s_targeting_ballBottom setPosition:ccp(dragonBallDisappear_x,dragonBallDisappear_y)];
            [dragonBall_s_targeting_ballTop setPosition:ccp(dragonBallDisappear_x,dragonBallDisappear_y)];
            
            //[dragonBall_s_targeting_ballBottom setRotation:dragonBallDisappear_r];
           // [dragonBall_s_targeting_ballTop setRotation:dragonBallDisappear_r];
            
            [dragonBall_s_targeting_ballBottom setScale:dragonBallDisappear_scale];
            [dragonBall_s_targeting_ballTop setScale:dragonBallDisappear_scale];
            
            for(int i = 0 ; i < dragonBall_s_targeting_howmanyStars ; i++){
                [dragonBall_s_targeting_ballStar[i] setPosition:ccp(dragonBallDisappear_x + dragonBall_s_targeting_starToBallOffsetX[i], dragonBallDisappear_y + dragonBall_s_targeting_starToBallOffsetY[i])];
                [dragonBall_s_targeting_ballStar[i] setRotation:dragonBallDisappear_r];
                [dragonBall_s_targeting_ballStar[i] setScale:dragonBallDisappear_scale*2.0];
            }
        }
        
        
        
        
        
        [dragonBall_s_targeting_cover setPosition:ccp(10000,10000)];
        
        for(int i = 0 ; i < 2 ; i++){
            [dragonBall_s_targeting_breakCover[i] setPosition:ccp(dragonBall_targeting_breakCover_X[i] - characterX + screenX, 
                                                                  dragonBall_targeting_breakCover_Y[i] - characterY + screenY)];
            [dragonBall_s_targeting_breakCover[i] setRotation:dragonBall_targeting_breakCover_R[i]];
            
            dragonBall_targeting_breakCover_X[i] += dragonBall_targeting_breakCover_VX[i];
            dragonBall_targeting_breakCover_Y[i] += dragonBall_targeting_breakCover_VY[i];
            dragonBall_targeting_breakCover_R[i] += dragonBall_targeting_breakCover_VR[i];
            
            dragonBall_targeting_breakCover_VY[i] += -0.95;
            
        }
        
        for(int i = 0 ; i < 7 ; i++){
            [dragonBall_s_targeting_breakSpike[i] setPosition:ccp(dragonBall_targeting_breakSpike_X[i] - characterX + screenX, 
                                                                  dragonBall_targeting_breakSpike_Y[i] - characterY + screenY)];
            [dragonBall_s_targeting_breakSpike[i] setRotation:dragonBall_targeting_breakSpike_R[i]];
            
            dragonBall_targeting_breakSpike_X[i] += dragonBall_targeting_breakSpike_VX[i];
            dragonBall_targeting_breakSpike_Y[i] += dragonBall_targeting_breakSpike_VY[i];
            dragonBall_targeting_breakSpike_R[i] += dragonBall_targeting_breakSpike_VR[i];
            
            dragonBall_targeting_breakSpike_VY[i] += -0.95;
        }
        
        dragonBall_breakingTimer++;
        
       /* if(dragonBall_breakingTimer >= 240 && dragonBall_targetingIdx != dragonBall_breakingIdx){
            printf("NEXT SHIT\n");
            dragonBall_isBreaking  = false;
            dragonBall_hasBroken[dragonBall_breakingIdx] = true;
        }*/
        
    }
    
}

-(void) breakTheBall:(bool)_isCollideFromBall{
    [self pillarBreak:dragonBall_targetingIdx];
    
    if(!record_hasHittedDragonBall[dragonBall_targetingIdx]){
         recordUse_howmanyDragonBallHitted++;
        
        if(isHeavyInvincible){
            recordUse_breakWhileInHeavy = true;
        }
    }
    record_hasHittedDragonBall[dragonBall_targetingIdx] = true;
    
    missionCompleted_timer = 59;
    
    dragonBall_isBreaking = true;
    dragonBall_breakingIdx = dragonBall_targetingIdx;
    dragonBall_breakingTimer = 0;
    //dragonBall_hasBroken[dragonBall_targetingIdx] = true;
    
    for(int i = 0 ; i < 2 ; i++){
        [dragonBall_s_targeting_breakCover[i] setScale:dragonBall_targeting_cover_Scale];
  
    }
    
    for(int i = 0 ; i < 7 ; i++){
        [dragonBall_s_targeting_breakSpike[i] setScale:dragonBall_targeting_cover_Scale];
    }
    
    static int fuckBreakOffsetX = 2;
    static int fuckBreakOffsetY = 5;
    
    dragonBall_targeting_breakCover_X[0] = dragonBall_X[dragonBall_targetingIdx] + dragonBall_targeting_cover_Scale * (- 22 + fuckBreakOffsetX);
    dragonBall_targeting_breakCover_Y[0] = dragonBall_Y[dragonBall_targetingIdx] + dragonBall_targeting_cover_Scale * (- 42 + fuckBreakOffsetY);
    dragonBall_targeting_breakCover_X[1] = dragonBall_X[dragonBall_targetingIdx] + dragonBall_targeting_cover_Scale * ( 27 + fuckBreakOffsetX);
    dragonBall_targeting_breakCover_Y[1] = dragonBall_Y[dragonBall_targetingIdx] + dragonBall_targeting_cover_Scale * (- 34 + fuckBreakOffsetY);
    
    dragonBall_targeting_breakSpike_X[0] = dragonBall_X[dragonBall_targetingIdx] + dragonBall_targeting_cover_Scale * (- 47 + fuckBreakOffsetX);
    dragonBall_targeting_breakSpike_Y[0] = dragonBall_Y[dragonBall_targetingIdx] + dragonBall_targeting_cover_Scale * (- 8 + fuckBreakOffsetY);
    dragonBall_targeting_breakSpike_X[1] = dragonBall_X[dragonBall_targetingIdx] + dragonBall_targeting_cover_Scale * (- 0 + fuckBreakOffsetX);
    dragonBall_targeting_breakSpike_Y[1] = dragonBall_Y[dragonBall_targetingIdx] + dragonBall_targeting_cover_Scale * (- 19 + fuckBreakOffsetY);
    dragonBall_targeting_breakSpike_X[2] = dragonBall_X[dragonBall_targetingIdx] + dragonBall_targeting_cover_Scale * ( 28 + fuckBreakOffsetX);
    dragonBall_targeting_breakSpike_Y[2] = dragonBall_Y[dragonBall_targetingIdx] + dragonBall_targeting_cover_Scale * (- 46 + fuckBreakOffsetY);
    dragonBall_targeting_breakSpike_X[3] = dragonBall_X[dragonBall_targetingIdx] + dragonBall_targeting_cover_Scale * ( 53 + fuckBreakOffsetX);
    dragonBall_targeting_breakSpike_Y[3] = dragonBall_Y[dragonBall_targetingIdx] + dragonBall_targeting_cover_Scale * ( 15 + fuckBreakOffsetY);
    dragonBall_targeting_breakSpike_X[4] = dragonBall_X[dragonBall_targetingIdx] + dragonBall_targeting_cover_Scale * (- 48 + fuckBreakOffsetX);
    dragonBall_targeting_breakSpike_Y[4] = dragonBall_Y[dragonBall_targetingIdx] + dragonBall_targeting_cover_Scale * (- 42 + fuckBreakOffsetY);
    dragonBall_targeting_breakSpike_X[5] = dragonBall_X[dragonBall_targetingIdx] + dragonBall_targeting_cover_Scale * (- 0 + fuckBreakOffsetX);
    dragonBall_targeting_breakSpike_Y[5] = dragonBall_Y[dragonBall_targetingIdx] + dragonBall_targeting_cover_Scale * (- 70 + fuckBreakOffsetY);
    dragonBall_targeting_breakSpike_X[6] = dragonBall_X[dragonBall_targetingIdx] + dragonBall_targeting_cover_Scale * ( 60  + fuckBreakOffsetX);
    dragonBall_targeting_breakSpike_Y[6] = dragonBall_Y[dragonBall_targetingIdx] + dragonBall_targeting_cover_Scale * (- 32 + fuckBreakOffsetY);
    
    
    if(_isCollideFromBall){
        static float breakForceX;
        breakForceX = (characterVX * 8.0  - 14.0)/5.0;
        breakForceX *= 0.7;
        //ori breaforce x = 10
        
        dragonBall_targeting_breakCover_VX[0] = 1.0*breakForceX;
        dragonBall_targeting_breakCover_VY[0] = 10*0.5;
        dragonBall_targeting_breakCover_VX[1] = 0.3*breakForceX;
        dragonBall_targeting_breakCover_VY[1] = 8*0.5;
        
        dragonBall_targeting_breakSpike_VX[0] = 1.5*breakForceX;
        dragonBall_targeting_breakSpike_VY[0] = 12*0.5;
        dragonBall_targeting_breakSpike_VX[1] = 0.3*breakForceX;
        dragonBall_targeting_breakSpike_VY[1] = 7*0.5;
        dragonBall_targeting_breakSpike_VX[2] = 1.5*breakForceX;
        dragonBall_targeting_breakSpike_VY[2] = 10*0.5;
        dragonBall_targeting_breakSpike_VX[3] = 0.2*breakForceX;
        dragonBall_targeting_breakSpike_VY[3] = 6*0.5;
        dragonBall_targeting_breakSpike_VX[4] = 0.5*breakForceX;
        dragonBall_targeting_breakSpike_VY[4] = 8*0.5;
        dragonBall_targeting_breakSpike_VX[5] = 0.2*breakForceX;
        dragonBall_targeting_breakSpike_VY[5] = 4*0.5;
        dragonBall_targeting_breakSpike_VX[6] = 0.3*breakForceX;
        dragonBall_targeting_breakSpike_VY[6] = 7*0.5;
        
        dragonBall_targeting_breakCover_VR[0] = 4.5;
        dragonBall_targeting_breakCover_VR[1] = 2.0;
        
        dragonBall_targeting_breakSpike_VR[0] = 3.0;
        dragonBall_targeting_breakSpike_VR[1] = 0.5;
        dragonBall_targeting_breakSpike_VR[2] = 2.0;
        dragonBall_targeting_breakSpike_VR[3] = 2.5;
        dragonBall_targeting_breakSpike_VR[4] = 3.5;
        dragonBall_targeting_breakSpike_VR[5] = 2.5;
        dragonBall_targeting_breakSpike_VR[6] = 1.0;
    }else{
        dragonBall_targeting_breakCover_VX[0] = 0.1*10;
        dragonBall_targeting_breakCover_VY[0] = 2*0.5;
        dragonBall_targeting_breakCover_VX[1] = 0.05*10;
        dragonBall_targeting_breakCover_VY[1] = 1.5*0.5;
        
        dragonBall_targeting_breakSpike_VX[0] = 0.1*10;
        dragonBall_targeting_breakSpike_VY[0] = 0.5*0.5;
        dragonBall_targeting_breakSpike_VX[1] = 0.0*10;
        dragonBall_targeting_breakSpike_VY[1] = 0.0*0.5;
        dragonBall_targeting_breakSpike_VX[2] = 0.2*10;
        dragonBall_targeting_breakSpike_VY[2] = 0.5*0.5;
        dragonBall_targeting_breakSpike_VX[3] = 0.3*10;
        dragonBall_targeting_breakSpike_VY[3] = 0.7*0.5;
        dragonBall_targeting_breakSpike_VX[4] = 0.25*10;
        dragonBall_targeting_breakSpike_VY[4] = 0.6*0.5;
        dragonBall_targeting_breakSpike_VX[5] = 0.0*10;
        dragonBall_targeting_breakSpike_VY[5] = 0.2*0.5;
        dragonBall_targeting_breakSpike_VX[6] = 0.5*10;
        dragonBall_targeting_breakSpike_VY[6] = 0.1*0.5;
        
        dragonBall_targeting_breakCover_VR[0] = 1.0;
        dragonBall_targeting_breakCover_VR[1] = 0.5;
        
        dragonBall_targeting_breakSpike_VR[0] = 1.0;
        dragonBall_targeting_breakSpike_VR[1] = 0.5;
        dragonBall_targeting_breakSpike_VR[2] = 0.6;
        dragonBall_targeting_breakSpike_VR[3] = 0.2;
        dragonBall_targeting_breakSpike_VR[4] = 1.5;
        dragonBall_targeting_breakSpike_VR[5] = 1.2;
        dragonBall_targeting_breakSpike_VR[6] = 0.7;
    }
    
    
    dragonBall_targeting_breakCover_R[0] = 0;
    dragonBall_targeting_breakCover_R[1] = 0;
    
    dragonBall_targeting_breakSpike_R[0] = 0;
    dragonBall_targeting_breakSpike_R[1] = 0;
    dragonBall_targeting_breakSpike_R[2] = 0;
    dragonBall_targeting_breakSpike_R[3] = 0;
    dragonBall_targeting_breakSpike_R[4] = 0;
    dragonBall_targeting_breakSpike_R[5] = 0;
    dragonBall_targeting_breakSpike_R[6] = 0;

}

-(void) checkIfCollideWithTargetBall{
    
    static int hasDetectTime;
    hasDetectTime = 0;
    do{
        
        superFuxkOriX =  characterDetectX[hasDetectTime];
        superFuxkOriY =  characterDetectY[hasDetectTime];
        detectPointX =  characterX + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
        detectPointY =  characterY + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
        
       // [s_temp[hasDetectTime] setPosition:ccp(detectPointX-characterX+screenX, detectPointY-characterY+screenY)];
        
        fuxkDistanceDiffX = detectPointX - dragonBall_X[dragonBall_targetingIdx];
        fuxkDistanceDiffY = detectPointY - dragonBall_Y[dragonBall_targetingIdx];
        fuxkDistanceDiff = fuxkDistanceDiffX*fuxkDistanceDiffX + fuxkDistanceDiffY*fuxkDistanceDiffY;
        
        //[s_temp[4] setPosition:ccp(dragonBall_X[dragonBall_targetingIdx], dragonBall_Y[dragonBall_targetingIdx])];
        
       // printf("fuxkDistanceDiff:%4.8f %4.8f %4.8f\n",fuxkDistanceDiff, detectPointX, dragonBall_s_targeting_detectRadius);
        
       
       // if(fuxkDistanceDiff < 4500){
        if(fuxkDistanceDiff < dragonBall_s_targeting_detectRadius){
          //   printf("TTTTTTTTTTBBBBBBBBBB\n\n");
            [self collideOnBall:detectPointX DetectY:detectPointY];
            return;
        }
        
        
        hasDetectTime++;
    }while(hasDetectTime < 1);
}

-(void) checkIfCollideWithTargetPillar{

    static int hasDetectTime;
    hasDetectTime = 0;
    do{
        
        superFuxkOriX =  characterDetectX[hasDetectTime];
        superFuxkOriY =  characterDetectY[hasDetectTime];
        detectPointX =  characterX + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
        detectPointY =  characterY + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
        
        if(detectPointX > dragonBall_s_targeting_detectLine[2] && detectPointX < dragonBall_s_targeting_detectLine[3]){
            if(detectPointY > dragonBall_s_targeting_detectLine[1] && detectPointY < dragonBall_s_targeting_detectLine[0]){
                [self collideOnPillar];
                return;
            }
        }

        hasDetectTime++;
    }while(hasDetectTime < 1);
    
}


-(void) collideOnBall:(float)_detectX DetectY:(float)_detectY{
    
    if(dragonBall_isCollidingAtDragonBall || dragonBall_isBreaking){
        return;
    }
    

    //printf("glide_vx:%4.8f\n",glide_vx);


    static float dragonToTurtlDiffAngle;
    dragonToTurtlDiffAngle = atan2(_detectY - dragonBall_Y[dragonBall_targetingIdx], 
                                   _detectX - dragonBall_X[dragonBall_targetingIdx]);
    
    printf("collideOnBall:%4.8f\n",characterVelocity);
    static float collideDirection;
    collideDirection = atan2(characterY - dragonBall_Y[dragonBall_targetingIdx], characterX - dragonBall_X[dragonBall_targetingIdx]);
    //glide_vx *= 0.1;
    
    if(!dragonBall_isAvailable[dragonBall_targetingIdx]){
               
        //from 57 to 57 + 80
        //printf("dragonToTurtlDiffAngle:%4.8f\n",dragonToTurtlDiffAngle);
        if(dragonToTurtlDiffAngle > 0.994837674 && dragonToTurtlDiffAngle < 2.39110108){
         //   printf("NO FUCKING COLLIDE IN BALL\n");
            return;
        
        }
    }
    
    
    
    
    
    // printf("glide_vx:%4.8f\n",glide_vx);
    if(glide_vx > 0){
        glide_vx += dragonBall_maxSpeedToBreak[dragonBall_targetingIdx]/2 * cos(dragonToTurtlDiffAngle);
        if(glide_vx < 0){
            glide_vx = 0;
        }
    }
    if(glide_vx < 0){
        glide_vx += dragonBall_maxSpeedToBreak[dragonBall_targetingIdx]/2 * cos(dragonToTurtlDiffAngle);
        if(glide_vx > 0){
            glide_vx = 0;
        }
    }

    
    
    if(characterVelocity >= dragonBall_maxSpeedToBreak[dragonBall_targetingIdx]){
        if(_detectX < 0){
            [self breakTheBall:false];
        }else{
            [self breakTheBall:true];
        }
       
        
        if(dragonBall_isAvailable[dragonBall_targetingIdx]){
          //  [self setSlow:15];
        }
                
        [musicController playThisSound:kSound_MAINCrash01 isLoop:NO gain:1.0];
        
        return;
    }
    
    [musicController playThisSound:kSound_TurtleExplode03 isLoop:NO gain:1.0];
    [musicController playThisSound:kSound_ComboSmoke isLoop:NO gain:1.0];
    
    if(dragonBall_isCollidingOnPillar){
        characterCollideAtX = screenX;
        characterCollideAtY = screenY;
        dragonBallCollideAtX = dragonBall_X[dragonBall_targetingIdx];
        dragonBallCollideAtY = dragonBall_Y[dragonBall_targetingIdx];
        
        return;
    }
    
    [ss_Character reorderChild:dragonBall_s_targeting_ballBottom z:kDeapth_Penguin_Bombing];
    for(int i = 0 ; i < maxDragonBalls ; i++){
        [ss_Character reorderChild:dragonBall_s_targeting_ballStar[i] z:kDeapth_Penguin_Bombing];
    }
    [ss_Character reorderChild:dragonBall_s_targeting_ballTop z:kDeapth_Penguin_Bombing];
    
    
    dragonBall_isCollidingOnPillar = true;
    landingFloorTimer = -90;
    [turtle setStatus:kTurtleAniStatus_Colliding];
    [mainTurtleEquipments setTurtleCollide];
    
    dragonBall_isCollidingAtDragonBall = true;
    characterCollideAtX = screenX;
    characterCollideAtY = screenY;
    dragonBallCollideAtX = dragonBall_X[dragonBall_targetingIdx];
    dragonBallCollideAtY = dragonBall_Y[dragonBall_targetingIdx];
    
}


-(void) pillarBreak:(int)_pillarIdx{
    if(dragonBall_s_targeting_isPillarBreaking){
        return;
    }
    
    dragonBall_s_targeting_isPillarBreaking = true;
    dragonBall_s_targeting_pillarBreakingTimer = 0;
    
    dragonBall_s_targeting_pillarTopBreak_x = dragonBall_X[dragonBall_targetingIdx] + 5;
    dragonBall_s_targeting_pillarTopBreak_y = dragonBall_targetPillarTopY;
    dragonBall_s_targeting_pillarTopBreak_r = 0;
    for(int i = 0 ; i < dragonBall_targetHowmnayPillarMiddle ; i++){
        dragonBall_s_targeting_pillarBreak_x[i] = dragonBall_X[dragonBall_targetingIdx] + 5;
        dragonBall_s_targeting_pillarBreak_y[i] = dragonBall_targetPillarMiddleY[i]; 
        dragonBall_s_targeting_pillarBreak_r[i] = 0;
    }
    
    static int pillarFuckRan;
    pillarFuckRan = arc4random() % 100;
    dragonBall_s_targeting_pillarTopBreak_vx = 2 + 2.0 * (float)pillarFuckRan/100.0;
    pillarFuckRan = arc4random() % 100;
    dragonBall_s_targeting_pillarTopBreak_vy = 3.0 + 3.0 * (float)pillarFuckRan/100.0;
    pillarFuckRan = arc4random() % 100;
    dragonBall_s_targeting_pillarTopBreak_vr = 1.5 + 4.5 * (float)pillarFuckRan/100.0;
    
    for(int i = 0 ; i < dragonBall_targetHowmnayPillarMiddle ; i++){
        
        pillarFuckRan = arc4random() % 100;
        dragonBall_s_targeting_pillarBreak_vx[i] = 2 + 2.0 * (float)pillarFuckRan/100.0;
        pillarFuckRan = arc4random() % 100;
        dragonBall_s_targeting_pillarBreak_vy[i] = 3.0 + 3.0 * (float)pillarFuckRan/100.0;
        pillarFuckRan = arc4random() % 100;
        dragonBall_s_targeting_pillarBreak_vr[i] = 1.5 + 4.5 * (float)pillarFuckRan/100.0;
    }
}

-(void) collideOnPillar{
    if(dragonBall_isCollidingOnPillar){
        return;
    }
    
   /* if(isHeavyInvincible){
        [self pillarBreak:dragonBall_targetingIdx];
        return;
    }*/
    
    if(characterVelocity >= dragonBall_maxSpeedToBreak[dragonBall_targetingIdx]){
        [self pillarBreak:dragonBall_targetingIdx];
        if(!dragonBall_isBreaking){
             [self collideOnBall:-100 DetectY:-100];
        }
       
        
        return;
    }
    
    [musicController playThisSound:kSound_TurtleExplode03 isLoop:NO gain:1.0];
    [musicController playThisSound:kSound_ComboSmoke isLoop:NO gain:1.0];
    
    
    dragonBall_isCollidingOnPillar = true;
    landingFloorTimer = -90;
    [turtle setStatus:kTurtleAniStatus_Colliding];
    [mainTurtleEquipments setTurtleCollide];
    characterCollideAtX = characterX;
    characterCollideAtY = characterY;
}

-(void) manageCharacter{
   
    
    characterRealX = characterX * characterXRealityRatio;
    characterRealY = (characterY - minFloorY) * characterYRealityRatio;
    
    //printf("characterRealY:%4.8f\n",characterRealY);
    
    if(record_height < characterRealX){
        record_height = characterRealX;
    }
    
    if(record_maxAttitude < characterRealY){
        record_maxAttitude = characterRealY;
    }
    
   // printf("characterRealY:%4.8f %4.8f\n",characterRealY, characterY);
    if(characterStatus == kCharacterStatus_Flying){
        characterFlyingStep++;
        
        if(isBeginningFlight){
            characterFlyingStep = 0;
        }
        
        if(characterFlyingStep == 14){
            characterFlyingStep = 0;
        }
    }
}

-(void) manageWholeMovement{
    //printf("characterVelocity:%4.8f\n",characterVelocity);
    /*if(arc4random() % 10 == 0){
        printf("characterX:%4.8f\n",characterX);
    }*/
    if(dragonBall_isCollidingOnPillar){
        characterVX = 0;
        characterVY = 0;
        characterPreVX = 0;
        characterAX = 0;
        characterAY = 0;
        isApplyingFuel = false;
        //return;
    }
    
    if(isClickingRocket && !dragonBall_isCollidingOnPillar){
        characterFuelRemain -= characterFuelReduceSpeed;
        if(characterFuelRemain < 0){
            isApplyingFuel = false;
            characterFuelRemain = 0;
        }else{
            isApplyingFuel = true;
        }
    }else{
        isApplyingFuel = false;
    }
    
    if(isApplyingFuel){
        /*if(!isPlayingEngineSound){
            [musicController playThisSound:kSound_engine isLoop:YES gain:1.0];
            isPlayingEngineSound = true;
        }*/
        
        engineSound += 0.1;
        if(engineSound >= 1){
            engineSound = 1;
        }
        [musicController changeGain:kSound_engine gain:engineSound];
        
    }else{
        /*if(isPlayingEngineSound){
            [musicController playThisSound:kSound_engine isLoop:YES gain:0.0];
            isPlayingEngineSound = false;
        }*/
        
        if(characterVelocity < 6.5){
            engineSound -= 0.05;
        }else{
            engineSound -= 0.02;
        }
        
        
        if(engineSound <= 0){
            engineSound = 0;
        }
        [musicController changeGain:kSound_engine gain:engineSound];

    }
        
    
    if(characterY > (minFloorY + 0.1)){
        if(playerBoost == 1){
            if(floorTime < 40){
                grav_mag = 0;
            }
        } 
        
        if(playerBoost == 2){
            if(floorTime < 20){
                grav_mag = 0;
            }
        } 
        
        if(playerBoost == 3){
            if(floorTime < 10){
                grav_mag = 0;
            }
        }
        floorTime++;
    }
    
    if(!dragonBall_isCollidingOnPillar){
        characterVY = -(glide_vy + grav_mag + myself_redVY);
        characterVX = glide_vx + myself_redVX;
        characterX += characterVX;
        characterY += characterVY;
        //printf("characterVY:%4.8f %4.8f %4.8f %4.8f | %4.8f\n",characterVY,glide_vy,grav_mag,myself_redVY,characterY);
        if(characterX < 0){
            characterVX = 0;
            characterX = 0;
        }
        
        player_rotation += characterCollideVR;
        characterCollideVR *= 0.9;
    }
   
    
    if(player_rotation <= -180){
        player_rotation += 360;
    }
    if(player_rotation >= 180){
        player_rotation -= 360;
    }
    
    characterRotation = player_rotation;

    
    if(dragonBall_isCollidingOnPillar){
        characterVX = 0;
        characterVY = 0;
        characterVR = 0;
    }

    if(characterY < startToDeclineY){
        screenY = characterY;
    }
    
   
    if(dragonBall_isCollidingOnPillar){
        landingFloorTimer++;
    }
    
  
    if(characterY <= (minFloorY + 0.1)){
        
        if(isApplyingFuel){
             characterY = minFloorY + 0.1;
        }else{
             characterY = minFloorY;
        }
            
       
        screenY = minFloorY;
        characterVY = 0;
        grav_mag = 0;
        glide_vy = 0;
        floorTime = 0;
        
        if(!isHeavyInvincible){
             glide_vx*=0.95;
        }
       
        
       
        
        if(characterVelocity <= 0.1){
            landingFloorTimer++;
        }else{
          //   printf("FFFFFF:%4.8f %i\n",characterVelocity,landingFloorTimer);
            landingFloorTimer = 0;
        }
        
    }else{
       // printf("TTTTTTTTTTTTTT:%4.8f %4.8f\n",characterY,minFloorY);
        if(!dragonBall_isCollidingOnPillar){
            landingFloorTimer = 0;
        }
    }
    
    if(landingFloorTimer == 60){
        [self finishOneRound];
    }

    
    
    wholeTurtleScaleFromSocurce = wholeScale;
    
    return;
    
    
    
    
    
    
    static float maxVx;
    static float maxVy;
    static float changedAngle;
    changedAngle = -characterRotation * M_PI/180;
    
    
    //characterVX += characterAX + character0To180FreeAX;
    characterVY += characterAY + character0To180FreeAY + characterSuddenVY;
    
    if(characterVY < -8){
        characterVY = -8;
    }
    
    maxVx = upgraded_maxVelocityX * cos(changedAngle);
   // maxVx = upgraded_maxVelocityX;
    maxVy = upgraded_maxVelocityY * sin(changedAngle);
    
   // printf("characterRotation:%4.8f %4.8f %4.8f %4.8f\n",characterAX, characterVX, maxVx, characterX);
    
    characterPreVX += characterAX;
    if(maxVx > 0){
        if(characterPreVX > maxVx){
            characterPreVX = maxVx;
        }
    }
    
    if(maxVx < 0){
        if(characterPreVX < maxVx){
            characterPreVX = maxVx;
        }
    }
    
    if(maxVy > 0){
        if(characterVY > maxVy){
            characterVY = maxVy;
        }
    }
    

    //characterVY += upgraded_gravity;
    
    
    if(isClickingRocket && !dragonBall_isCollidingOnPillar){
        characterFuelRemain -= characterFuelReduceSpeed;
        if(characterFuelRemain < 0){
            isApplyingFuel = false;
            characterFuelRemain = 0;
        }else{
            isApplyingFuel = true;
        }
    }else{
        isApplyingFuel = false;
    }
    
    if(isClickingProtect){
        if(!hasApplyedProtect){
            hasApplyedProtect = true;
            //[self setToInvcinbleShell];
        }
    }
    
 
    if(isApplyingFuel){
        characterAX = 0.1 * cos(changedAngle);
        characterAY = 0.1 * sin(changedAngle);
        
        //characterVY += upgraded_gravity * 0.1;
    }else{
        characterAX = 0;
        characterAY = 0;
        characterPreVX *= 0.998 - 0.01 * (sin(-characterRotation * M_PI/180 + 4.71238898) + 1);
       // characterVX *= 0.995; 
       // characterVY += upgraded_gravity;
    }
    
   // printf("characterVX:%4.8f %4.8f %4.8f\n",characterVX,characterAX, character0To180FreeAX);
   //  printf("characterVY:%4.8f %4.8f %4.8f %4.8f\n",characterVY,characterAY, character0To180FreeAY, characterSuddenVY);
    
    static float applyGravity;
    static float applyMinVY;
    
    static float temp_minVX = 2;
    static float temp_maxVX = 7;
    static float temp_minApplyMinVY = -0.07;
    static float temp_maxApplyMinVY = -0.002;
    
    
    applyMinVY = (characterVX - temp_minVX) * (temp_maxApplyMinVY - temp_minApplyMinVY)/(temp_maxVX - temp_minVX) + temp_minApplyMinVY;
    if(applyMinVY < temp_minApplyMinVY){
        applyMinVY = temp_minApplyMinVY;
    }
    if(applyMinVY > temp_maxApplyMinVY){
        applyMinVY = temp_maxApplyMinVY;
    }
    
    if(characterVX < 0.5){
        applyMinVY = -0.2;
    }else
    if(characterVX < 1.0){
        applyMinVY = -0.11;
    }
    
    
    static float apply2MinVY;
    static float temp_minAngle = -20;
    static float temp_maxAngle = -90;
    static float temp_minApply2MinVY = 0;
    static float temp_maxApply2MinVY = -0.1;
    
    if(characterRotation < 0 && characterRotation >= -90){
        temp_minAngle = -20;
        temp_maxAngle = -90;
    }else if(characterRotation < -90 && characterRotation >= -180){
        temp_minAngle = -160;
        temp_maxAngle = -90;
    }else if(characterRotation < 360 && characterRotation >= 270){
        temp_minAngle = 340;
        temp_maxAngle = 270;
    }else if(characterRotation < 270 && characterRotation >= 180){
        temp_minAngle = 200;
        temp_maxAngle = 270;
    }else if(characterRotation >= 0){
        temp_minAngle = -90;
        temp_maxAngle = -160;
    }else{
        temp_minAngle = -160;
        temp_maxAngle = -90;
    }
    
    apply2MinVY = (characterRotation - temp_minAngle) * (temp_maxApply2MinVY - temp_minApply2MinVY)/(temp_maxAngle - temp_minAngle) + temp_minApply2MinVY;
    if(apply2MinVY > temp_minApply2MinVY){
        apply2MinVY = temp_minApply2MinVY;
    }
    if(apply2MinVY < temp_maxApply2MinVY){
        apply2MinVY = temp_maxApply2MinVY;
    }
    
    applyMinVY += apply2MinVY;

    
   // printf("applyMinVY:%4.8f %4.8f\n",apply2MinVY, characterRotation);
       
    applyGravity = -0.1;
    
    if(isApplyingFuel){
        characterAY += applyMinVY * 0.1;
       /* if(characterVY > applyMinVY){ 
            characterVY += applyGravity * 0.1;
        }*/
    }else{
         characterAY += applyMinVY;
        /*if(characterVY > applyMinVY){ 
            characterVY += applyGravity * 1.0;
        }*/
    }

    if(isClickingAntiClockwise){
     characterRotation-=2;
    }
    if(isClickingClockwise){
        characterRotation+=2;
    }
    //characterRotation += accelRotation;
    
    characterRotation += characterVR;
    characterVR *= 0.9;
    
    static float diffCharacterX;
    static float diffCharacterAngle;
    diffCharacterX = characterX - prevCharacterX;
    diffCharacterAngle = characterRotation - prevCharacterAngle;
    
    suddenFuckUpAccumX /= 15;
    suddenFuckUpAccumX += diffCharacterX;
    
    suddenFuckUpAccumAngle /= 15;
    suddenFuckUpAccumAngle += diffCharacterAngle/3;
    
    if(characterRotation < 0 && characterRotation > -90){
        if(suddenFuckUpAccumAngle < 0  && suddenFuckUpAccumX > 0){
            //characterSuddenVY = -(suddenFuckUpAccumX * suddenFuckUpAccumAngle * sin(changedAngle) * 0.05);
            characterSuddenVY = -suddenFuckUpAccumX * suddenFuckUpAccumAngle * 0.145;
            // printf("characterSuddenVY:%4.8f |%4.8f %4.8f %4.8f %4.8f %4.8f\n",characterSuddenVY, suddenFuckUpAccumX, suddenFuckUpAccumAngle, sin(changedAngle), characterRotation, prevCharacterAngle);
        }
        
    }else{
        characterSuddenVY = 0;
    }
    
    // printf("OUT:%4.8f |%4.8f %4.8f %4.8f %4.8f %4.8f\n",characterSuddenVY, suddenFuckUpAccumX, suddenFuckUpAccumAngle, sin(changedAngle), characterRotation, prevCharacterAngle);
    if(characterRotation <= -360){
        characterRotation += 360;
    }
    if(characterRotation >= 360){
        characterRotation -= 360;
    }
    
    
    prevCharacterX = characterX;
    prevCharacterAngle = characterRotation;
    
    
    
    static float fuckFreeForce0To180;
    if(((characterRotation > 0 && characterRotation < 180) || (characterRotation > -180 && characterRotation < -360)) && characterY > minFloorY){
        
        changedAngle = characterRotation * M_PI/180;
        fuckFreeForce0To180 = 0.1 * sin(changedAngle);
        character0To180FreeAX = 4.0 * fuckFreeForce0To180 * cos(changedAngle);
        character0To180FreeAY = -fuckFreeForce0To180 * sin(changedAngle) * 2.0;
    }else{
        character0To180FreeAX = 0;
        character0To180FreeAY = 0;
    }
    
   
    
    character0To180VX += character0To180FreeAX;
    character0To180VX *= 0.98;
    
    if(character0To180VX > 4.0){
        character0To180VX = 4.0;
    }
    
    static float vxToBeAdded;
    vxToBeAdded = characterPreVX + character0To180VX;
    if(vxToBeAdded > 7){
        vxToBeAdded = 7;
    }
    characterVX = vxToBeAdded;
    //printf("VX:%4.8f %4.8f\n",characterVX, character0To180VX);
    
   /* //DELETE LATER
    if(isApplyingFuel){
        characterVY = 0.5;
    }else{
        characterVY = -0.5;
    }*/
    
    if(dragonBall_isCollidingOnPillar){
        characterVX = 0;
        characterVY = 0;
        characterVR = 0;
    }
    
    characterX += characterVX;
    characterY += characterVY;
   // printf("VY:%4.8f %4.8f %4.8f %4.8f\n",characterVY, characterAY, character0To180FreeAY, characterSuddenVY);
    
   // printf("D:%4.8f %4.8f %4.8f %4.8f\n",characterRotation,fuckFreeForce0To180,character0To180FreeAX, character0To180FreeAY);
    
    
    
    
    if(characterY < startToDeclineY){
        screenY = characterY;
    }
    if(characterY < minFloorY){
        characterY = minFloorY;
        screenY = minFloorY;
        characterVY = 0;
        
        characterPreVX *= 0.965;
        character0To180VX *= 0.95;
    }
    
    //printf("CharY:%4.8f\n",characterVY);
    
    //characterRotation+=0.5;
    //wholeScale +=0.001;
    wholeTurtleScaleFromSocurce = wholeScale;
}

-(void) manageAirPenguins{
    for(int i = 0 ; i < maxAirPenguin ; i++){
        if(airPenguinIsAni[i]){
            static float airPenguinScreenX;
            static float airPenguinScreenY;
            airPenguinScreenX = airPenguinX[i] - characterX + screenX;
            airPenguinScreenY = airPenguinY[i] - characterY + screenY;
            
            airPenguinX[i] += airPenguinVX[i];
            airPenguinY[i] += airPenguinVY[i];
            airPenguinRotation[i] += airPenguinVR[i];
            
            if(airPenguinIsColliding[i]){
                airPenguinVY[i] += -0.5;
                airPenguinVR[i] *= 0.94;
            }else{
                if(airPenguinScreenX < [UIScreen mainScreen].bounds.size.height){
                    if(airPenguinAniTimer[i] % 4 == 0){
                      //  printf("GEN:%i V:%4.8f %4.8f\n", i ,[airPenguin[i] x] + 45,[airPenguin[i] y] + 25);
                        [mainTurtleEquipments genOnePenguinSmokeAtX:(airPenguinX[i] + 52) Y:(airPenguinY[i] + 25.925)];
                       // [mainTurtleEquipments genOneRocketSmoke:true];
                    }
                    airPenguinAniTimer[i]++;
                }
                
            }
            
          //  printf("airPenguinScreenX:%4.8f %4.8f %4.8f %4.8f\n",airPenguinScreenX,airPenguinScreenY,  airPenguinX[i], airPenguinY[i]);
            
            [airPenguin[i] setMAINR:airPenguinRotation[i]];
            [airPenguin[i] setMAINX:airPenguinScreenX];
            [airPenguin[i] setMAINY:airPenguinScreenY];
            [airPenguin[i] MAINMANAGE];
            
            if(airPenguinScreenX < -500 || airPenguinScreenX > 1500){
                airPenguinIsAni[i] = false;
                howmanyAirPenguinOnScreen--;
                
                
                
               // printf("remove:%i %i\n",i,penguinToPenguinDetectIdx[i]);
                
            }
            
            if(!airPenguinIsColliding[i]){
                if(airPenguinScreenX > 0 && airPenguinScreenX < [UIScreen mainScreen].bounds.size.height){
                    if(airPenguinScreenY > -20 && airPenguinScreenY < [UIScreen mainScreen].bounds.size.width + 60){
                        [self checkIfCollideWithThisAirPenguin:i];
                    }
                }
            }
            
             
        }
    }
    
  /*  if(arc4random() % 300 == 0){
      //  printf("genOneAirPenguin\n");
       // if(howmanyAirPenguinOnScreen < maxAirPenguinOnScreen){
            [self genOneAirPenguin];
      //  } 
    }*/
    
    if(characterX >= 2500){
        [self newMethodToDetectGenAirPenguins];
    }
}



-(void) newMethodToDetectGenAirPenguins{
   
    if(characterY < 1500){
        return;
    }
    
    if(characterX > 72000){
        return;
    }

    
    static float genCenterX;
    static float genCenterY;
    static int genRadius;
    
    static int ranCloudX;
    static int ranCloudY;
    static int ranGenAngle;
    static int ranGenDistance;
    static int numInArea;
    
    if(isIpad){
        genCenterX =  characterX + 540 * 1024.0/480.0 * cos(characterIsFacingDirection);
        genCenterY =  characterY + 540 * 1024.0/480.0 * sin(characterIsFacingDirection);
    }else{
        genCenterX =  characterX + 540 * cos(characterIsFacingDirection);
        genCenterY =  characterY + 540 * sin(characterIsFacingDirection);
    }
   
    
    
    
    if(isIpad){
        if(characterY < 2000){
            genRadius = 1700 * 1024.0/480.0;
        }else if(characterY < 3000){
            genRadius = 1700 * 1024.0/480.0;
        }else if(characterY < 4000){
            genRadius = 1300 * 1024.0/480.0;
        }else if(characterY < 5000){
            genRadius = 1000 * 1024.0/480.0;
        }else if(characterY < 6000){
            genRadius = 800 * 1024.0/480.0;
        }else if(characterY < 7000){
            genRadius = 700 * 1024.0/480.0;
        }else if(characterY < 8000){
            genRadius = 600 * 1024.0/480.0;
        }else if(characterY < 9000){
            genRadius = 500 * 1024.0/480.0;
        }else if(characterY < 10000){
            genRadius = 400 * 1024.0/480.0;
        }
    }else{
        if(characterY < 2000){
            genRadius = 1700;
        }else if(characterY < 3000){
            genRadius = 1700;
        }else if(characterY < 4000){
            genRadius = 1300;
        }else if(characterY < 5000){
            genRadius = 1000;
        }else if(characterY < 6000){
            genRadius = 800;
        }else if(characterY < 7000){
            genRadius = 700;
        }else if(characterY < 8000){
            genRadius = 600;
        }else if(characterY < 9000){
            genRadius = 500;
        }else if(characterY < 10000){
            genRadius = 400;
        }
    }
    
   // genRadius = 600;
    
    
    numInArea = 0;
    for(int i = 0 ; i < maxAirPenguin ; i++){
        if(airPenguinIsAni[i]){
            static float cloudGenCenterDiffX;
            static float cloudGenCenterDiffY;
            static float cloudGenCenterDiffDistance;
            cloudGenCenterDiffX = airPenguinX[i] - genCenterX;
            cloudGenCenterDiffY = airPenguinY[i] - genCenterY;
            cloudGenCenterDiffDistance = cloudGenCenterDiffX*cloudGenCenterDiffX + cloudGenCenterDiffY*cloudGenCenterDiffY;
            
            if(cloudGenCenterDiffDistance < genRadius*genRadius){
                numInArea++;
            }
        }
    }
    
    static float cloudCloudInterval;
    static bool isAllowGenCloud;
    cloudCloudInterval = 250;
    
    while (numInArea < 2) {
        isAllowGenCloud = true;
        ranGenAngle = arc4random() % 360;
        ranGenDistance = arc4random() % genRadius;
        
        ranCloudX = genCenterX + (float)ranGenDistance * cos((float)ranGenAngle * M_PI/180);
        ranCloudY = genCenterY + (float)ranGenDistance * sin((float)ranGenAngle * M_PI/180);
        
        if(airPenguinIsAni[airPenguinIdx]){
            printf("WTTTTTTTTF AIR PENGUIN\n");
            airPenguinIdx++;
            if(airPenguinIdx >= maxAirPenguin){
                airPenguinIdx = 0;
            }
            isAllowGenCloud = false;
            break;
        }
        
       /* if(ranCloudY < 50){
            isAllowGenCloud = false;
            break;
        }*/
        
        //NEW
        static float screenCheckDiffX;
        static float screenCheckDiffY;
        screenCheckDiffX = ranCloudX - characterX;
        screenCheckDiffY = ranCloudY - characterY;
        if(screenCheckDiffX > -270 && screenCheckDiffX < 270){
            if(screenCheckDiffY > -180 && screenCheckDiffY < 180){
                isAllowGenCloud = false;
                break;
            }
        }
        
        for(int j = 0 ; j < maxAirPenguin ; j++){
            if(j != airPenguinIdx){
                if(airPenguinIsAni[j]){
                    static float fuck2DiffX;
                    static float fuck2DiffY;
                    static float fuck2DiffDistance;
                    
                    fuck2DiffX = airPenguinX[j] - ranCloudX;
                    fuck2DiffY = airPenguinY[j] - ranCloudY;  
                    fuck2DiffDistance = fuck2DiffX*fuck2DiffX + fuck2DiffY*fuck2DiffY;
                    
                    if(fuck2DiffDistance < cloudCloudInterval*cloudCloudInterval){
                        // printf("DSFDSFSDFDSFDSFDSFSDFDS\n");
                        cloudCloudInterval--;
                        isAllowGenCloud = false;
                        break;
                    }
                }
            }
        }
        
        //printf("A\n");
        if(cloudCloudInterval <= 150){
            //  printf("BREAK\n");
            break;
        }
        // printf("B\n");
        
        if(isAllowGenCloud){
            airPenguinIsAni[airPenguinIdx] = true;
            airPenguinIsColliding[airPenguinIdx] = false;
            airPenguinX[airPenguinIdx] =   (float)ranCloudX;
            airPenguinY[airPenguinIdx] =   (float)ranCloudY;
            
            // printf("gen:%i |%4.8f %4.8f  SCREEN:%4.8f %4.8f\n",cloudIdx ,cloud_X[cloudIdx],cloud_Y[cloudIdx],cloud_X[cloudIdx] - characterX + screenX, cloud_Y[cloudIdx] - characterY + screenY);
            
            //printf("center:%4.8f %4.8f %4.8f gen2: %4.8f %i %4.8f %i\n",genCenterX,genCenterY,characterIsFacingDirection * 180/M_PI,characterX ,ranCloudX, characterY, ranCloudY);
            
            airPenguinAniTimer[airPenguinIdx] = 0;
            airPenguinVX[airPenguinIdx] = -1.5;
            airPenguinVY[airPenguinIdx] = 0;
            airPenguinVR[airPenguinIdx] = 0;
            airPenguinRotation[airPenguinIdx] = 0;
            [airPenguin[airPenguinIdx] SETMAINISCOLLDING:false];
            
            airPenguinIdx++;
            if(airPenguinIdx >= maxAirPenguin){
                airPenguinIdx = 0;
            }
            
            numInArea++;
            cloudCloudInterval = 100;
        }
        
    }
}



-(void) genOneAirPenguin{
    return;
   
    if(airPenguinIsAni[airPenguinIdx]){
        printf("airPenguinIsAni[airPenguinIdx]:%i\n",airPenguinIdx);
        return;
    }
    
    howmanyAirPenguinOnScreen++;
    airPenguinIsAni[airPenguinIdx] = true;
    airPenguinIsColliding[airPenguinIdx] = false;
    
    
    static int airPenguinGenRan;
    
    if(isIpad){
        airPenguinGenRan = arc4random()%100;
        airPenguinX[airPenguinIdx] = characterX + (float)airPenguinGenRan/100.0 * 400 + 900;
        
        airPenguinGenRan = arc4random()%100;
        airPenguinY[airPenguinIdx] = characterY + (float)airPenguinGenRan/100.0 * 300 - 150;
    }else{
        airPenguinGenRan = arc4random()%100;
        airPenguinX[airPenguinIdx] = characterX + (float)airPenguinGenRan/100.0 * 400 + 300;
        
        airPenguinGenRan = arc4random()%100;
        airPenguinY[airPenguinIdx] = characterY + (float)airPenguinGenRan/100.0 * 200 - 100;
    }
   
    
    airPenguinAniTimer[airPenguinIdx] = 0;
    airPenguinVX[airPenguinIdx] = -1.5;
    airPenguinVY[airPenguinIdx] = 0;
    airPenguinVR[airPenguinIdx] = 0;
    airPenguinRotation[airPenguinIdx] = 0;
    
    
    airPenguinIdx++;
    if(airPenguinIdx >= maxAirPenguin){
        airPenguinIdx = 0;
    }

}

-(void) setDragonAniAtX:(float)_x Y:(float)_y detectIdx:(int)_detectIdx{
    dragonDetect_dragonAtX = _x;
    dragonDetect_dragonAtY = _y;
    dragonDetect_ScreenX = 430;
    dragonDetect_ScreenY = 150;
    
    if(isIpad){
        dragonDetect_ScreenX *= 1024.0/480.0;
        dragonDetect_ScreenY *= 768.0/320.0;
    }
    
    dragonDetect_aniTimer = 0;
    dragonDetect_isAppearing = true;
    dragonDetect_isDisappearing = false;
    dragonDetect_isAni = true;
    
    dragonDetect_scale = 0;
    
    dragonDetect_detectIdx = _detectIdx;
    
    [s_dragonDetect setPosition:ccp(dragonDetect_ScreenX, dragonDetect_ScreenY)];
    printf("setDragonAniAtX:%i\n",_detectIdx);
    if(dragonBall_isAvailable[_detectIdx]){
        [s_dragonDetectObj setTextureRect:CGRectMake(1926/textureRatioForFuckingIpad, 1118/textureRatioForFuckingIpad, 122/textureRatioForFuckingIpad, 122/textureRatioForFuckingIpad)];
        [s_dragonDetectObj setAnchorPoint:ccp(65.0/122.0,56.0/122.0)];
    }else{
        [s_dragonDetectObj setTextureRect:CGRectMake(1932/textureRatioForFuckingIpad, 976/textureRatioForFuckingIpad, 116/textureRatioForFuckingIpad, 92/textureRatioForFuckingIpad)];
    }   
    
}


-(void) manageDragonDetect{

    
    if(!dragonDetect_isAni){

        for(int i = 0 ; i < maxDragonBalls ; i++){
            if(dragonBall_hasEnoughMissionCompleted[i]){
                if(characterVX > 0){
                    if(dragonBall_X[i] - characterX < dragonBall_detectRange[i] && dragonBall_X[i] - characterX >= 0){
                        [self setDragonAniAtX:dragonBall_X[i] Y:dragonBall_Y[i] detectIdx:i];
                    }
                }else if(characterVX < 0){
                    if(characterX - dragonBall_X[i] < dragonBall_detectRange[i] && characterX - dragonBall_X[i] >= 0){
                        [self setDragonAniAtX:dragonBall_X[i] Y:dragonBall_Y[i] detectIdx:i];
                    }
                }
            }
        }
        
        dragonDetect_dotLineOpacity-=2;
        if(dragonDetect_dotLineOpacity < 0){
            dragonDetect_dotLineOpacity = 0;
        }
        [s_dragonDetectDotLine setOpacity:dragonDetect_dotLineOpacity];
        
        if(dragonBall_isAvailable[dragonDetect_detectIdx] && !dragonBall_hasBroken[dragonDetect_detectIdx]){
            [s_dragonDetectDotLine setPosition:ccp([UIScreen mainScreen].bounds.size.height/2,  dragonBall_Y[dragonDetect_detectIdx] - characterY + screenY - 3 * dragonBall_s_targeting_cover.scale)];
        }else{
            [s_dragonDetectDotLine setPosition:ccp([UIScreen mainScreen].bounds.size.height/2, dragonBall_Y[dragonDetect_detectIdx] - characterY + screenY + dragonBall_s_targeting_coverToBallOffsetY)];
        }
        
        
        return;
    }
    
    dragonDetect_aniTimer++;
    
    if(dragonBall_targetingIdx >= 3){
        dragonDetect_dotLineOpacity+=2;
        if(dragonDetect_dotLineOpacity > 83){
            dragonDetect_dotLineOpacity = 83;
        }
        [s_dragonDetectDotLine setOpacity:dragonDetect_dotLineOpacity];
        
       // printf("dragonDetect_detectIdx:%i\n",dragonDetect_detectIdx);
        
        if(dragonBall_isAvailable[dragonDetect_detectIdx] && !dragonBall_hasBroken[dragonDetect_detectIdx]){
            [s_dragonDetectDotLine setPosition:ccp([UIScreen mainScreen].bounds.size.height/2,  dragonBall_Y[dragonDetect_detectIdx] - characterY + screenY - 3 * dragonBall_s_targeting_cover.scale)];
        }else{
            [s_dragonDetectDotLine setPosition:ccp([UIScreen mainScreen].bounds.size.height/2, dragonBall_Y[dragonDetect_detectIdx] - characterY + screenY + dragonBall_s_targeting_coverToBallOffsetY)];
        }
    }
    
    
   // printf("FUCK:%i %4.8f\n",dragonDetect_aniTimer, dragonDetect_scale);
    
    if(dragonDetect_isAppearing){
        
        if(dragonDetect_aniTimer < 12){
            dragonDetect_scale += 0.1;
        }else{
            dragonDetect_scale += (1.0 - dragonDetect_scale)/10.0;
        }
        
        if(dragonDetect_aniTimer == 60){
            dragonDetect_scale = 1.0;
            dragonDetect_isAppearing = false;
        }
    }
    
    
    if(dragonDetect_isDisappearing){
        if(dragonDetect_aniTimer < 5){
            dragonDetect_scale += 0.05;
        }else{
            dragonDetect_scale += (0.0 - dragonDetect_scale)/10.0;
        }
        
        if(dragonDetect_aniTimer == 60){
            dragonDetect_scale = 0.0;
            dragonDetect_isAni = false;
            dragonBall_isInHittingRange = false;
        }
        
    }
    
    //dragonDetect_X = (dragonDetect_ScreenX - screenX) + characterX;
    //dragonDetect_Y = (dragonDetect_ScreenY - screenY) + characterY;
    
    
    static float detectToPenguinDiffX;
    static float detectToPenguinDiffY;
    static float detectToPenguinDiff;
    static float detectToPenguinDiffAngle;
    
    static float detectArrowPosX;
    static float detectArrowPosY;
    
  
    superFuxkOriX =  characterDetectX[0];
    superFuxkOriY =  characterDetectY[0];
    detectPointX =  characterX + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
    detectPointY =  characterY + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
    
    detectToPenguinDiffX = dragonDetect_dragonAtX - detectPointX;
    detectToPenguinDiffY = dragonDetect_dragonAtY - detectPointY;
    detectToPenguinDiff = sqrt(detectToPenguinDiffX*detectToPenguinDiffX + detectToPenguinDiffY*detectToPenguinDiffY);
    detectToPenguinDiffAngle = atan2(detectToPenguinDiffY, detectToPenguinDiffX);
    
    static bool fuckfuckBool;
    fuckfuckBool = false;
    
    if(!dragonDetect_isDisappearing && !dragonDetect_isAppearing){
        if(characterVX > 0){
            if(detectToPenguinDiffX < -100){
                fuckfuckBool = true;
            }
        }
        
        if(characterVX < 0){
            if(detectToPenguinDiffX > 100){
                fuckfuckBool = true;
            }
        }
    }
   
    if(fuckfuckBool){
        dragonDetect_preDisappearingTimer++;
    }else{
        dragonDetect_preDisappearingTimer = 0;
    }
    
    if(dragonDetect_preDisappearingTimer > 120){
        
        dragonBall_isInHittingRange = false;
        dragonDetect_aniTimer = 0;
        dragonDetect_isDisappearing = true;
        [s_dragonDetect_digit[0] setPosition:ccp(10000,100000)];
        [s_dragonDetect_digit[1] setPosition:ccp(10000,100000)];
        [s_dragonDetect_digit[2] setPosition:ccp(10000,100000)];
        [s_dragonDetect_digit[3] setPosition:ccp(10000,100000)];

    }
    
    
    //printf("diff:%4.8f %4.8f %4.8f\n",detectToPenguinDiffX,detectToPenguinDiffY,detectToPenguinDiffAngle*180/M_PI);
    
    detectArrowPosX = dragonDetect_ScreenX + 39 * 2/textureRatioForFuckingIpad * cos(detectToPenguinDiffAngle);
    detectArrowPosY = dragonDetect_ScreenY + 39 * 2/textureRatioForFuckingIpad * sin(detectToPenguinDiffAngle);
    
    
    [s_dragonDetectArrow setPosition:ccp(detectArrowPosX, detectArrowPosY)];
    [s_dragonDetectArrow setRotation:-detectToPenguinDiffAngle * 180/M_PI];
    
    
    [s_dragonDetectObj setPosition:ccp(dragonDetect_ScreenX, dragonDetect_ScreenY)];
    
    
    [s_dragonDetect setScale:dragonDetect_scale];
    [s_dragonDetectObj setScale:dragonDetect_scale];
    [s_dragonDetectArrow setScale:dragonDetect_scale];
    
    if(dragonDetect_isDisappearing){
        return;
    }
    
    static int calDetectToPenguinDistance;
    static int calDetectToPenguinFirstDigit;
    static int calDetectToPenguinSecondDigit;
    static int calDetectToPenguinThirdDigit;
    static int calDetectToPenguinForthDigit;
    
    calDetectToPenguinDistance = (int)(detectToPenguinDiff * characterXRealityRatio);
    if(calDetectToPenguinDistance < 300){
        dragonBall_isInHittingRange = true;
    }
    
    if(calDetectToPenguinDistance > 0){
        if(calDetectToPenguinDistance < 10){
            calDetectToPenguinFirstDigit = -1;
            calDetectToPenguinSecondDigit = -1;
            calDetectToPenguinThirdDigit = -1;
            calDetectToPenguinForthDigit = calDetectToPenguinDistance;
            
            [s_dragonDetect_digit[0] setPosition:ccp(10000,100000)];
            [s_dragonDetect_digit[1] setPosition:ccp(10000,100000)];
            [s_dragonDetect_digit[2] setPosition:ccp(10000,100000)];
            [s_dragonDetect_digit[3] setPosition:ccp(dragonDetect_ScreenX,dragonDetect_ScreenY-30 * 2/textureRatioForFuckingIpad)];
            
        }else if(calDetectToPenguinDistance < 100){
            calDetectToPenguinFirstDigit = -1;
            calDetectToPenguinSecondDigit = -1;
            calDetectToPenguinThirdDigit = calDetectToPenguinDistance/10;
            calDetectToPenguinForthDigit = calDetectToPenguinDistance - calDetectToPenguinThirdDigit*10;
            
            [s_dragonDetect_digit[0] setPosition:ccp(10000,100000)];
            [s_dragonDetect_digit[1] setPosition:ccp(10000,100000)];
            [s_dragonDetect_digit[2] setPosition:ccp(dragonDetect_ScreenX-7 * 2/textureRatioForFuckingIpad,dragonDetect_ScreenY-30 * 2/textureRatioForFuckingIpad)];
            [s_dragonDetect_digit[3] setPosition:ccp(dragonDetect_ScreenX+7 * 2/textureRatioForFuckingIpad,dragonDetect_ScreenY-30 * 2/textureRatioForFuckingIpad)];
            
        }else if(calDetectToPenguinDistance < 1000){
            calDetectToPenguinFirstDigit = -1;
            calDetectToPenguinSecondDigit = calDetectToPenguinDistance/100;
            calDetectToPenguinThirdDigit = (calDetectToPenguinDistance - calDetectToPenguinSecondDigit*100)/10;
            calDetectToPenguinForthDigit = (calDetectToPenguinDistance - calDetectToPenguinSecondDigit*100  - calDetectToPenguinThirdDigit*10);
            
            [s_dragonDetect_digit[0] setPosition:ccp(10000,100000)];
            [s_dragonDetect_digit[1] setPosition:ccp(dragonDetect_ScreenX-14 * 2/textureRatioForFuckingIpad,dragonDetect_ScreenY-30 * 2/textureRatioForFuckingIpad)];
            [s_dragonDetect_digit[2] setPosition:ccp(dragonDetect_ScreenX,dragonDetect_ScreenY-30 * 2/textureRatioForFuckingIpad)];
            [s_dragonDetect_digit[3] setPosition:ccp(dragonDetect_ScreenX+14 * 2/textureRatioForFuckingIpad,dragonDetect_ScreenY-30 * 2/textureRatioForFuckingIpad)];
            
        }else{
            calDetectToPenguinFirstDigit = calDetectToPenguinDistance/1000;
            calDetectToPenguinSecondDigit = (calDetectToPenguinDistance - calDetectToPenguinFirstDigit*1000)/100;
            calDetectToPenguinThirdDigit = (calDetectToPenguinDistance - calDetectToPenguinFirstDigit*1000 - calDetectToPenguinSecondDigit*100)/10;
            calDetectToPenguinForthDigit = calDetectToPenguinDistance - calDetectToPenguinFirstDigit*1000 - calDetectToPenguinSecondDigit*100 - calDetectToPenguinThirdDigit*10;
            
            [s_dragonDetect_digit[0] setPosition:ccp(dragonDetect_ScreenX-21 * 2/textureRatioForFuckingIpad,dragonDetect_ScreenY-30 * 2/textureRatioForFuckingIpad)];
            [s_dragonDetect_digit[1] setPosition:ccp(dragonDetect_ScreenX-7 * 2/textureRatioForFuckingIpad,dragonDetect_ScreenY-30 * 2/textureRatioForFuckingIpad)];
            [s_dragonDetect_digit[2] setPosition:ccp(dragonDetect_ScreenX+7 * 2/textureRatioForFuckingIpad,dragonDetect_ScreenY-30 * 2/textureRatioForFuckingIpad)];
            [s_dragonDetect_digit[3] setPosition:ccp(dragonDetect_ScreenX+21 * 2/textureRatioForFuckingIpad,dragonDetect_ScreenY-30 * 2/textureRatioForFuckingIpad)];
            
        }
        
        
        if(isIpad){
            if(calDetectToPenguinFirstDigit != -1){
                [s_dragonDetect_digit[0] setTextureRect:CGRectMake(786 + calDetectToPenguinFirstDigit * 36, 278, 36, 42)];
            }
            if(calDetectToPenguinSecondDigit != -1){
                [s_dragonDetect_digit[1] setTextureRect:CGRectMake(786 + calDetectToPenguinSecondDigit * 36, 278, 36, 42)];
            }
            if(calDetectToPenguinThirdDigit != -1){
                [s_dragonDetect_digit[2] setTextureRect:CGRectMake(786 + calDetectToPenguinThirdDigit * 36, 278, 36, 42)];
            }
            if(calDetectToPenguinForthDigit != -1){
                [s_dragonDetect_digit[3] setTextureRect:CGRectMake(786 + calDetectToPenguinForthDigit * 36, 278, 36, 42)];
            }
        }else{
            if(calDetectToPenguinFirstDigit != -1){
                [s_dragonDetect_digit[0] setTextureRect:CGRectMake(786/2 + calDetectToPenguinFirstDigit * 18, 278/2, 18, 21)];
            }
            if(calDetectToPenguinSecondDigit != -1){
                [s_dragonDetect_digit[1] setTextureRect:CGRectMake(786/2 + calDetectToPenguinSecondDigit * 18, 278/2, 18, 21)];
            }
            if(calDetectToPenguinThirdDigit != -1){
                [s_dragonDetect_digit[2] setTextureRect:CGRectMake(786/2 + calDetectToPenguinThirdDigit * 18, 278/2, 18, 21)];
            }
            if(calDetectToPenguinForthDigit != -1){
                [s_dragonDetect_digit[3] setTextureRect:CGRectMake(786/2 + calDetectToPenguinForthDigit * 18, 278/2, 18, 21)];
            }
        }
        
    }else{
        [s_dragonDetect_digit[0] setPosition:ccp(10000,100000)];
        [s_dragonDetect_digit[1] setPosition:ccp(10000,100000)];
        [s_dragonDetect_digit[2] setPosition:ccp(10000,100000)];
        [s_dragonDetect_digit[3] setPosition:ccp(10000,100000)];
    }
    
    

}

-(void) btnIsTappedInControlLayer:(int)_btnIdx{
    
    if(_btnIdx == 0){
        if(beginningFlightTimer >= 20){
            [self endSpin];
            [self saveToDB_Begin];
            //[self setCannonPrepareShoot];
        }
    }
    
    if(_btnIdx == 1){
       // [self tryToUseLightInvincible];
    }

    if(_btnIdx == 2){
        
        if(playTimer > playFlightTime){
            isClickingRocket = true;
            recordUse_hasAppliedFuel = true;
        }else{
            if(playTimer < playFlightTime - 20){
                playTimer = playFlightTime - 20;
            }
            isClickingRocket = true;
            recordUse_hasAppliedFuel = true;
        }
        
        if(characterFuelRemain > 0 && !hasFinishedOneRound){
            [musicController playThisSound:kSound_ThurstBoost isLoop:NO gain:thurstSound];
        }
        
        if(isHeavyInvincible){
            recordUse_isClickingBtnFromHeavyInvincible = true;
        }
        
    }
    
    if(!isPlayingWithAccelator){
        if(_btnIdx == 1){
            isClickingAntiClockwise = true;
        }
        if(_btnIdx == 3){
             isClickingClockwise = true;
        }

    }
    
    
    

}

-(void) btnIsReleasedInControlLayer:(int)_btnIdx{
     if(_btnIdx == 0){
      //  isClickingProtect = false;
    }

    if(_btnIdx == 2){
        isClickingRocket = false;
        
        if(playTimer >= playFlightTime){
            recordUse_isClickingBtnFromHeavyInvincible = false;
        }
        
    }
    
    if(!isPlayingWithAccelator){
        if(_btnIdx == 1){
            isClickingAntiClockwise = false;
        }
        if(_btnIdx == 3){
            isClickingClockwise = false;
        }
        
    }
}

- (void) dealloc
{
	printf("Main PlayScene Dealloc\n");
    
    [self removeP4RCSpin];
    
    [musicController stopThisSound:kSound_engine];
    [mainTurtleEquipments release];
    [mainUILayer release];
    [mainBgLayer release];
    [mainBombScript release];
    [mainMissionCheck release];
    [mainTurtlePhycis release];
    [finishOne_string release];
	[super dealloc];
}


- (void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    // printf("SDFSDFDSFSDFDSFDSFSDFSDFDSn");
    
    for( UITouch *touch in touches ) {
		CGPoint location = [touch locationInView: [touch view]];
		location = [[CCDirector sharedDirector] convertToGL: location];
        // printf("SDFSDFDSFSDFDSFDSFSDFSDFDS:%4.8f %4.8f\n",location.x, location.y);
        
        if(hasFinishedOneRound){
            
             printf("dff:%4.8f %4.8f\n",location.x, location.y);
            
            if(isIpad){
                if(location.x > 202 && location.x < 838){
                    if(location.y > 133 && location.y < 295){
                        [self finishOneRoundClick];
                    }
                }
            }else{
                if(location.x > 74 && location.x < 414){
                    if(location.y > 64 && location.y < 129){
                        [self finishOneRoundClick];
                    }
                }
            }
            
            
            if(isIpad){
                if(location.x > 471 && location.x < 578){
                    if(location.y < 125){
                        [s_p4rcIcon setTextureRect:CGRectMake(1418/textureRatioForFuckingIpad, 1118/textureRatioForFuckingIpad, 80/textureRatioForFuckingIpad, 78/textureRatioForFuckingIpad)];
                    }
                }
            }else{
                if(location.x > 211 && location.x < 290){
                    if(location.y < 64){
                        [s_p4rcIcon setTextureRect:CGRectMake(1418/textureRatioForFuckingIpad, 1118/textureRatioForFuckingIpad, 80/textureRatioForFuckingIpad, 78/textureRatioForFuckingIpad)];
                    }
                }
            }
            
        }
        
        if(!isStopping){
            
            if(isIpad){
                if(location.x > 900){
                    if(location.y > 668){
                        isStopping = true;
                        [mainUILayer showMenu];
                        
                    }
                }
            }else{
                if(location.x > 418){
                    if(location.y > 258){
                        isStopping = true;
                        [mainUILayer showMenu];
                        
                    }
                }
            }
            
        }else{
             printf("SDFSDFDSFSDFDSFDSFSDFSDFDS:%4.8f %4.8f\n",location.x, location.y);
            
            if(!isIpad){
                if(isShowingMenu){
                    if(location.x > 101 && location.x < 400){
                        if (location.y > 115){
                            [mainUILayer removeMenu];
                        }else if (location.y > 119){
                            
                        }else{
                            
                        }
                    }
                }
            }else{
                if(isShowingMenu){
                    if(location.x > 238 && location.x < 777){
                        if (location.y > 281){
                            [mainUILayer removeMenu];
                        }
                    }
                }
            }
            
            
        }
        
        
        
    }
}

- (void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    for( UITouch *touch in touches ) {
        CGPoint location = [touch locationInView: [touch view]];
		location = [[CCDirector sharedDirector] convertToGL: location];

        if(hasFinishedOneRound){
            [finishOne_s_btnOn setPosition:ccp(100000, finishOne_y - 56 * 2/textureRatioForFuckingIpad)];
            
            [s_p4rcIcon setTextureRect:CGRectMake(1338/textureRatioForFuckingIpad, 1118/textureRatioForFuckingIpad, 80/textureRatioForFuckingIpad, 78/textureRatioForFuckingIpad)];
            
            
            if(isIpad){
                if(location.x > 471 && location.x < 578){
                    if(location.y < 125){
                        [[P4RC sharedInstance] showMain];
                    }
                }

            }else{
                if(location.x > 211 && location.x < 290){
                    if(location.y < 64){
                        [[P4RC sharedInstance] showMain];
                    }
                }
            }
            
        }


    }
}


-(void) initMenu{
    s_blackTranspancy_bg = [CCLayerColor layerWithColor:ccc4(0, 0, 0, 200)];
    [self addChild:s_blackTranspancy_bg z:kDeapth_Menu1];
    [s_blackTranspancy_bg setPosition:ccp(1000,10000)];
    
    s_menu_resume = [CCSprite spriteWithFile:@"s_menu_resume_off.png"];
    s_menu_restart = [CCSprite spriteWithFile:@"s_menu_restart_off.png"];
    s_menu_exit = [CCSprite spriteWithFile:@"s_menu_exit_off.png"];
   // s_gameover = [CCSprite spriteWithTexture:ss_Gameover.texture rect:CGRectMake(0,0,456/textureRatioForFuckingIpad,80/textureRatioForFuckingIpad)];
    
    [self addChild:s_menu_resume z:kDeapth_Menu];
    [self addChild:s_menu_restart z:kDeapth_Menu];
    [self addChild:s_menu_exit z:kDeapth_Menu];
   // [ss_Gameover addChild:s_gameover z:kDeapth_Gameover];
    
    [s_menu_resume setPosition:ccp(10000,10000)];
    [s_menu_restart setPosition:ccp(10000,10000)];
    [s_menu_exit setPosition:ccp(10000,10000)];
   // [s_gameover setPosition:ccp(10000,10000)];
}


-(void) checkIfCollideWithThisAirPenguin:(int)_penguinIdx{
    
    static int hasDetectTime;
    hasDetectTime = 0;
    do{
        superFuxkOriX =  characterDetectX[hasDetectTime];
        superFuxkOriY =  characterDetectY[hasDetectTime];
        detectPointX =  characterX + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
        detectPointY =  characterY + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
        
        
        fuxkDistanceDiffX = detectPointX - airPenguinX[_penguinIdx];
        fuxkDistanceDiffY = detectPointY - airPenguinY[_penguinIdx];
        fuxkDistanceDiff = fuxkDistanceDiffX*fuxkDistanceDiffX + fuxkDistanceDiffY*fuxkDistanceDiffY;
        
        //printf("fuxkDistanceDiff:%4.8f %4.8f %4.8f %4.8f %4.8f\n",fuxkDistanceDiff, detectPointX, item_X[_itemIdx],detectPointY,item_Y[_itemIdx]);
        
        if(fuxkDistanceDiff < 2500 * 2/textureRatioForFuckingIpad){
            // printf("TTTTTTTTTTBBBBBBBBBB\n\n");
           // [self setAirPenguinBomb];
            [self collideOnThisAirPenguin:_penguinIdx];
            return;
        }
        
        hasDetectTime++;
    }while(hasDetectTime < characterDetectNumber);
}

-(void) setAirPenguinBomb{
    superFuxkOriX =  characterDetectX[0] + 50 * 2/textureRatioForFuckingIpad;
    superFuxkOriY =  characterDetectY[0];
    detectPointX =  screenX + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
    detectPointY =  screenY + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
    
    printf("setAirPenguinBomb:%i %i\n",characterDetectX[0],characterDetectY[0]);
    [self setToBombing:detectPointX turtleY:detectPointY];

}

-(void) collideOnThisAirPenguin:(int)_penguinIdx{
    [mainUILayer setRedFlameAni];
    
    recordUse_penguinHitInOneRound++;
    recordUse_penguinHitTotal++;
    
    if(isLightInvincible){
        recordUse_penguinHitInYellowBlaze++;
    }else{
        recordUse_penguinHitInYellowBlaze = 0;
    }
    
    printf("recordUse_penguinHitInYellowBlaze:%i\n",recordUse_penguinHitInYellowBlaze);
    
    record_hitted++;
    airPenguinIsColliding[_penguinIdx] = true;
    
    if(!isHeavyInvincible){
        if([mainUILayer gainTime:characterGainInvincible]){
            [self setHeavyInvincible];
        }
    }
    
    if(!isHeavyInvincible){
        [self tryToUseLightInvincible];
    }
    
    [musicController playThisSound:kSound_PenguinHit isLoop:NO gain:1.0];
    
    
    static float dx;
	static float dy;
	
	static float angle;
	static float sin1;
	static float cos1;
	
	static float x0;
	static float y0;
	static float x1;
	static float y1;
	
	static float vx0;
	static float vy0;
	static float vx1;
	static float vy1;
	
	static float vxTotal;
	
	static float _obj1X;
	static float _obj0X;
	static float _obj1Y;
	static float _obj0Y;
	static float _mass0;
	static float _mass1;
	static float _obj0VX;
	static float _obj0VY;
	static float _obj1VX;
	static float _obj1VY;
    
   // printf("BEcllideA:%4.8f %4.8f %4.8f %4.8f %4.8f\n",airPenguinX[_penguinIdx], airPenguinY[_penguinIdx], airPenguinVX[_penguinIdx], airPenguinVY[_penguinIdx], airPenguinVR[_penguinIdx]);
    //printf("BEcllideT:%4.8f %4.8f %4.8f %4.8f %4.8f\n",characterX, characterY, characterVX, characterVY, characterVR);
    
    _obj0X = airPenguinX[_penguinIdx];
	_obj0Y = airPenguinY[_penguinIdx];
	_obj0VX = airPenguinVX[_penguinIdx];
	_obj0VY = airPenguinVY[_penguinIdx];
	_mass0 = airPenguinMass[_penguinIdx];
    
    _obj1X = characterX;
    _obj1Y = characterY;
    _obj1VX = characterVX;
    _obj1VY = characterVY;
    _mass1 = characterMass;
    
    if(isLightInvincible){
        _mass0 /= 3;
    }
    if(isHeavyInvincible){
        _mass0 /= 6;
    }

    
	dx = _obj1X - _obj0X;
	dy = _obj1Y - _obj0Y;
	
	angle = atan2(dy, dx);
	sin1 = sin(angle);
	cos1 = cos(angle);
	
	//printf("angle:%4.8f %4.8f %4.8f\n",angle,dy,dx);
	
	x0 = 0;
	y0 = 0;
	
	x1 = dx * cos1 + dy * sin1;
	y1 = dy * cos1 - dx * sin1;
	
	vx0 = _obj0VX * cos1 + _obj0VY * sin1;
	vy0 = _obj0VY * cos1 - _obj0VX * sin1;
	vx1 = _obj1VX * cos1 + _obj1VY * sin1;
	vy1 = _obj1VY * cos1 - _obj1VX * sin1;
	
	//printf("x1:%4.8f %4.8f %4.8f %4.8f %4.8f %4.8f\n",x1,y1,vx0,vy0,vx1,vy1);
	
	vxTotal = vx0 - vx1;
	vx0 = ((_mass0 - _mass1) * vx0 + 2 * _mass1 * vx1)/(_mass0 + _mass1);
	vx1 = vxTotal + vx0;
	x0 += vx0;
	x1 += vx1;
	
	static float x0Final;
	static float y0Final;
	static float x1Final;
	static float y1Final;
	
	/*static float finalX;
	static float finalY;
	static float finalVX;
	static float finalVY;*/
	
	x0Final = x0 * cos1 - y0 * sin1;
	y0Final = y0 * cos1 + x0 * sin1;
	x1Final = x1 * cos1 - y1 * sin1;
	y1Final = y1 * cos1 + x1 * sin1;
    
    airPenguinX[_penguinIdx] = _obj0X + x0Final;
    airPenguinY[_penguinIdx] = _obj0Y + y0Final;
    airPenguinVX[_penguinIdx] = (vx0 * cos1 - vy0 * sin1)*1.0;
    airPenguinVY[_penguinIdx] = (vy0 * cos1 + vx0 * sin1)*1.0;
    
    
    if(!isHeavyInvincible){
        if(airPenguinVX[_penguinIdx] > 8){
            airPenguinVX[_penguinIdx] = 8;
        }
    }
    
    //printf("airPenguinVX[_penguinIdx]:%4.8f %4.8f\n",airPenguinVX[_penguinIdx],airPenguinVY[_penguinIdx]);
    
    
    characterX = _obj0X + x1Final;
    characterY = _obj0Y + y1Final;
    characterCollideVX = (vx1 * cos1 - vy1 * sin1)*1.0;
    characterCollideVY = (vy1 * cos1 + vx1 * sin1)*1.0;
    
    static float collideCalPreVx;
    static float collideCal0To180Vx;
    static float collideVXRatio;
    //static float collideVYRatio;
    collideVXRatio = characterPreVX / character0To180VX;
    collideCalPreVx = characterCollideVX/(1+collideVXRatio);
    collideCal0To180Vx = collideCalPreVx/collideVXRatio;
    
    characterVY = characterCollideVY;
    
    
    //static float objVInCollision;
    objVInCollision = sqrt(airPenguinVX[_penguinIdx]*airPenguinVX[_penguinIdx] + airPenguinVY[_penguinIdx]*airPenguinVY[_penguinIdx]);
    
    if(objVInCollision > 100){
        objVInCollision = 100;
    }
    if(objVInCollision < -100){
        objVInCollision = -100;
    }
    
    airPenguinVR[_penguinIdx] = objVInCollision*3.0;
    
    static float atan2ForOBj;
    atan2ForOBj = atan2(characterDetectY[0] - airPenguinY[_penguinIdx], characterDetectX[0] - airPenguinX[_penguinIdx]);
    if((atan2ForOBj > 0 && atan2ForOBj < M_PI/2) || (atan2ForOBj < -M_PI/2 && atan2ForOBj > -M_PI)){
        
    }else{
        airPenguinVR[_penguinIdx] *= -1;
    }
    
    
    objVInCollision = characterVelocity;
    
    if(objVInCollision > 100){
        objVInCollision = 100;
    }
    if(objVInCollision < -100){
        objVInCollision = -100;
    }
    
    //characterCollideVR = objVInCollision*0.2;
    
    if(airPenguinVX[_penguinIdx] > 0){
        airPenguinVX[_penguinIdx] *= 5.0;
       // airPenguinVR[_penguinIdx] *= 3.0;
    }
    
    
   // glide_vx = characterCollideVX;
   // glide_vy = -characterCollideVY;
    if(isLightInvincible || isHeavyInvincible){
    
    }else{
        glide_vx *= 0.25;
        
      //  printf("glide_vy:%4.8f\n",glide_vy);
        if(glide_vy < 0){
            glide_vy *= 0.25;
        }
        
    }
    
    
    [airPenguin[_penguinIdx] SETMAINISCOLLDING:true];
    
    
    
    //printf("cllideA:%4.8f %4.8f %4.8f %4.8f %4.8f\n",airPenguinX[_penguinIdx], airPenguinY[_penguinIdx], airPenguinVX[_penguinIdx], airPenguinVY[_penguinIdx], airPenguinVR[_penguinIdx]);
   // printf("cllideT:%4.8f %4.8f %4.8f %4.8f %4.8f\n",characterX, characterY, characterCollideVX, characterCollideVY, characterVR);

    
    //HANDLE ROTATION
    if(isLightInvincible || isHeavyInvincible){
        
    }else{
        static float forceCal;
        static float rotationForce;
        forceCal = characterVelocity;	
        
        //forceCal *= turtleApply_collisionForceRatio;
        forceCal *= 0.35;
        
        if(forceCal > 90){
            forceCal = 90;
        }
        rotationForce = forceCal * 1.0;
        
        static float collsionAngle;
        static float turtleAngle;
        
        collsionAngle = atan2(characterCollideVY, characterCollideVX);
        turtleAngle = atan2(characterVY, characterVX);
        
        static float diffAngle;
        
        
        if(turtleAngle < collsionAngle){
            diffAngle = turtleAngle - collsionAngle;
            if(diffAngle > -M_PI && diffAngle < M_PI){
                characterCollideVR = -rotationForce;
            }else {
                characterCollideVR = rotationForce;
            }
            
        }else{
            diffAngle = collsionAngle - turtleAngle;
            if(diffAngle > -M_PI && diffAngle < M_PI){
                characterCollideVR = rotationForce;
            }else {
                characterCollideVR = -rotationForce;
            }
        }
    }
    
}











-(void) manageInvicinble{
    if(!isInvicinble){
        return;
    }
    
    if(isStartingInvincible){
        startingInvincibleTimer++;
    }
    
    invicinbleTimer++;
}



-(void) initBomobingAni{
    mainBombScript = [[MainBombScript node] retain];
    
    bombingAniIdx = 0;
    bombingAniMax = 1;
    
    for(int i = 0 ; i < bombingAniMax+1 ; i++){
        bombingAniStruct[i] = malloc(sizeof(eBombingAniStruct));
        
        bombingAniStruct[i]->aniTimer = 0;
        bombingAniStruct[i]->isAni = false;
        bombingAniStruct[i]->isAniCombo = false;
        bombingAniStruct[i]->isAniShake = false;
        bombingAniStruct[i]->isAniCannon = false;
        
        
       
            static int bombDepth;
            if(currentChosenMiniGame == 11){
                bombDepth = kDeapth_Penguin_Bombing;
            }else{
                bombDepth = kDeapth_Turtle_Bombing;
            }
            
            
            bombingAniStruct[i]->s_buum = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(504/textureRatioForFuckingIpad + 1296/textureRatioForFuckingIpad,454/textureRatioForFuckingIpad + 238/textureRatioForFuckingIpad,140/textureRatioForFuckingIpad,134/textureRatioForFuckingIpad)];
            bombingAniStruct[i]->s_blick = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(504/textureRatioForFuckingIpad + 1296/textureRatioForFuckingIpad,590/textureRatioForFuckingIpad + 238/textureRatioForFuckingIpad,128/textureRatioForFuckingIpad,128/textureRatioForFuckingIpad)];
            bombingAniStruct[i]->s_wave = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(646/textureRatioForFuckingIpad + 1296/textureRatioForFuckingIpad,454/textureRatioForFuckingIpad + 238/textureRatioForFuckingIpad,106/textureRatioForFuckingIpad,108/textureRatioForFuckingIpad)];
            
            for(int j = 0 ; j < 3 ; j++){
                bombingAniStruct[i]->s_debris[j] = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(720/textureRatioForFuckingIpad + 1296/textureRatioForFuckingIpad,590/textureRatioForFuckingIpad + 238/textureRatioForFuckingIpad,22/textureRatioForFuckingIpad,14/textureRatioForFuckingIpad)];
            }
            
            for(int j = 0 ; j < 8 ; j++){
                bombingAniStruct[i]->s_bigClouds[j] = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(646/textureRatioForFuckingIpad + 1296/textureRatioForFuckingIpad,590/textureRatioForFuckingIpad + 238/textureRatioForFuckingIpad,72/textureRatioForFuckingIpad,70/textureRatioForFuckingIpad)];
            }
            
            for(int j = 0 ; j < 5 ; j++){
                bombingAniStruct[i]->s_smallClouds[j] = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(720/textureRatioForFuckingIpad + 1296/textureRatioForFuckingIpad,606/textureRatioForFuckingIpad + 238/textureRatioForFuckingIpad,26/textureRatioForFuckingIpad,28/textureRatioForFuckingIpad)];
            }
            
            
            for(int j = 0 ; j < 5 ; j++){
                [ss_Character addChild:bombingAniStruct[i]->s_smallClouds[j] z:bombDepth];
                [bombingAniStruct[i]->s_smallClouds[j] setPosition:ccp(10000,10000)];
            }
            
            [ss_Character addChild:bombingAniStruct[i]->s_wave z:kDeapth_Turtle_Bombing];
            [bombingAniStruct[i]->s_wave setPosition:ccp(10000,10000)];
            
            for(int j = 0 ; j < 8 ; j++){
                [ss_Character addChild:bombingAniStruct[i]->s_bigClouds[j] z:bombDepth];
                [bombingAniStruct[i]->s_bigClouds[j] setPosition:ccp(10000,10000)];
            }
            
            for(int j = 0 ; j < 3 ; j++){
                [ss_Character addChild:bombingAniStruct[i]->s_debris[j] z:bombDepth];
                [bombingAniStruct[i]->s_debris[j] setPosition:ccp(10000,10000)];
            }
            
            [ss_Character addChild:bombingAniStruct[i]->s_blick z:bombDepth];
            [ss_Character addChild:bombingAniStruct[i]->s_buum z:bombDepth];
        
        
        
        [bombingAniStruct[i]->s_blick setPosition:ccp(10000,10000)];
        [bombingAniStruct[i]->s_buum setPosition:ccp(10000,10000)];
    }
}


-(void) manageBombScript{
    [mainBombScript manage];
}

-(void) initMissionCheck{
    mainMissionCheck = [[MainMissionCheck node] retain];

}


-(void) finishOneRound{
    
    AppController *appDelegate =(AppController*) [[UIApplication sharedApplication] delegate];
    [appDelegate showAllAds];

    
    
    p4rc_isInMiniGame = false;
    p4rc_canDisplayScore = true;
    [self showP4RC];
    printf("P4RC send level:%i score:%i\n",9,(int)record_height);
    [[P4RC sharedInstance] didCompleteLevel:9 withPoints:(int)record_height];
    
    hasFinishedOneRound = true;
    canClickForNextScene = false;
    finishOne_isCalculating = false;
    finishOne_x = [UIScreen mainScreen].bounds.size.height/2;
    finishOne_y = 430;
    
    if(isIpad){
        finishOne_y *= 768.0/320.0;
    }
    
    finishOne_vy = 0;
    finishOne_timer = 0;
    finishOne_calTimer = 0;
    
   // record_height = 1250;
   // record_maxAttitude = 420;
   // record_hitted = 15;
   // record_coinsCollected = 126;
    
    finishOne_displayingIdx = 0;
    finishOne_displayingTimer = 0;
    finishOne_displayingMaxTime = 30;
    
    finishOne_display_height = 0;
    finishOne_display_attitude = 0;
    finishOne_display_hitted = 0;
    finishOne_display_coin = 0;
    finishOne_display_mission = 0;
    
    finishOne_display_heightMoney = 0;
    finishOne_display_attitudeMoney = 0;
    finishOne_display_hittedMoney = 0;
    finishOne_display_coinMoney = 0;
    finishOne_display_missionMoney = 0;
    finishOne_display_totalMoney = 0;
    
    [self calMoneyGot];
    [self saveToDB];
    
    [finishOne_colorLayer setTextureRect:CGRectMake(728/textureRatioForFuckingIpad, 326/textureRatioForFuckingIpad, 2, 2)];
    [finishOne_colorLayer setScaleX:300];
    [finishOne_colorLayer setScaleY:180];
    
    if(isIpad){
        [finishOne_colorLayer setScaleX:600];
        [finishOne_colorLayer setScaleY:400];
    }
    
    [finishOne_colorLayer setColor:ccc3(0, 0, 0)];
    [finishOne_colorLayer setOpacity:0];
    finishOne_colorLayerOpacity = 25;
    [finishOne_colorLayer setPosition:ccp([UIScreen mainScreen].bounds.size.height/2,[UIScreen mainScreen].bounds.size.width/2)];
    
    if(timeRunOut_Fast_Gain < 0){
        timeRunOut_Fast_Gain = 0;
        [musicController stopThisSound:kSound_TimeRunOutSlow];
        [musicController stopThisSound:kSound_TimeRunOutFast];
    }
    
    [musicController initEndRound];
}

-(void) calMoneyGot{
    finishOne_moneyGotFromHeight = record_height * 0.161460836;
    finishOne_moneyGotFromAttitude = 0;
    finishOne_moneyGotFromHitted = record_hitted * 15;
    finishOne_moneyGotFromCoin = record_coinsCollected * moneyExchangeRatio;
    
    //if(pemanent_moneyRatio){
       // finishOne_moneyGotFromHeight *= 1.5;
   // }
    if(finishOne_moneyGotFromAttitude){
      //  finishOne_moneyGotFromHeight *= 1.5;
    }
    if(finishOne_moneyGotFromHitted){
       // finishOne_moneyGotFromHeight *= 1.5;
    }
    if(pemanent_moneyRatio){
        finishOne_moneyGotFromCoin *= 2.0;
    }
    
    finishOne_moneyGotFromMission = 0;
    
    for(int i = 0 ; i < 3 ; i++){
        if(currentChosenMissionWon[i]){
            finishOne_moneyGotFromMission += [mainMissionCheck thisMissionPriceByPassingColIdx:i];
        }
    }
    
   // finishOne_moneyGotFromMission = 250;
    record_mission = finishOne_moneyGotFromMission;
    
    finishOne_totalMoneyGot = finishOne_moneyGotFromHeight + finishOne_moneyGotFromAttitude + finishOne_moneyGotFromHitted + finishOne_moneyGotFromCoin + finishOne_moneyGotFromMission;
}

-(void) manageFinishedOneRound{
 
    if(hasFinishedOneRound){
        
        if(finishOne_timer < 55){
            finishOne_colorLayerOpacity += 5;
            if(finishOne_colorLayerOpacity > 180){
                finishOne_colorLayerOpacity = 180;
            }
        }
        
        if(finishOne_timer >= 55){
            finishOne_colorLayerOpacity += 1;
            
            /*if(finishOne_timer < 50){
                finishOne_colorLayerOpacity += 1;
            }
            if(finishOne_timer < 25){
                finishOne_colorLayerOpacity += 1;
            }*/
            if(finishOne_colorLayerOpacity > 220){
                finishOne_colorLayerOpacity = 220;
            }
        }
        
        [finishOne_colorLayer setOpacity:finishOne_colorLayerOpacity];
        
        if(finishOne_timer >= 5){
            finishOne_vy += -1.5;
            finishOne_y += finishOne_vy;
            
            int fuckY;
            if(isIpad){
                fuckY = 340;
            }else{
                fuckY = 170;
            }
            
            if(finishOne_y <= fuckY){
                finishOne_y = fuckY;
                finishOne_vy = -finishOne_vy;
                finishOne_vy *= 0.55;
            }
        }
        

        
        [finishOne_s_bg setPosition:ccp(finishOne_x,finishOne_y)];
        
        
        [finishOne_totalMoneyWord setPosition:ccp(finishOne_x - 16 * 2/textureRatioForFuckingIpad,finishOne_y - 58 * 2/textureRatioForFuckingIpad)];
        [finishOne_l_height setPosition:ccp(finishOne_x - 31 * 2/textureRatioForFuckingIpad,finishOne_y + 66 * 2/textureRatioForFuckingIpad)];
        [finishOne_l_attitude setPosition:ccp(finishOne_x - 310000 * 2/textureRatioForFuckingIpad,finishOne_y + 40 * 2/textureRatioForFuckingIpad)];
        [finishOne_l_hitted setPosition:ccp(finishOne_x - 31 * 2/textureRatioForFuckingIpad,finishOne_y + 15 * 2/textureRatioForFuckingIpad)];
        [finishOne_l_coin setPosition:ccp(finishOne_x - 31 * 2/textureRatioForFuckingIpad,finishOne_y + 40 * 2/textureRatioForFuckingIpad)];
        [finishOne_l_hiehgtMoney setPosition:ccp(finishOne_x + 83 * 2/textureRatioForFuckingIpad,finishOne_y + 66 * 2/textureRatioForFuckingIpad)];
        [finishOne_l_attitudeMoney setPosition:ccp(finishOne_x + 830000 * 2/textureRatioForFuckingIpad,finishOne_y + 40 * 2/textureRatioForFuckingIpad)];
        [finishOne_l_hittedMoney setPosition:ccp(finishOne_x + 83 * 2/textureRatioForFuckingIpad,finishOne_y + 15 * 2/textureRatioForFuckingIpad)];
        [finishOne_l_coinMoney setPosition:ccp(finishOne_x + 83 * 2/textureRatioForFuckingIpad,finishOne_y + 40 * 2/textureRatioForFuckingIpad)];
        [finishOne_l_totalMoney setPosition:ccp(finishOne_x + 50 * 2/textureRatioForFuckingIpad,finishOne_y - 57 * 2/textureRatioForFuckingIpad)];
        
        [finishOne_l_missionMoney setPosition:ccp(finishOne_x + 83 * 2/textureRatioForFuckingIpad,finishOne_y - 11 * 2/textureRatioForFuckingIpad)];
        
        
        
        
        
        finishOne_timer++;
        
        if(finishOne_timer == 60){
            finishOne_isCalculating = true;
        }
        
        if(finishOne_isCalculating){
            
           // static int diffDisplay;
            static float calValue;
            
            if(finishOne_displayingIdx == 0){
                calValue = [self calDigitDiffShow2:record_height];
                if(calValue != -999){
                    finishOne_display_height += calValue;
                }else{
                    finishOne_display_height = record_height;
                }
            }
            
           /* if(finishOne_displayingIdx == 1){
                calValue = [self calDigitDiffShow2:record_maxAttitude];
                if(calValue != -999){
                    finishOne_display_attitude += calValue;
                }else{
                    finishOne_display_attitude = record_maxAttitude;
                }
            }*/
            
            if(finishOne_displayingIdx == 2){
                calValue = [self calDigitDiffShow2:record_hitted];
                if(calValue != -999){
                    finishOne_display_hitted += calValue;
                }else{
                    finishOne_display_hitted = record_hitted;
                }
                //printf("finishOne_display_hitted:%i\n",finishOne_display_hitted);
            }
            
            if(finishOne_displayingIdx == 1){
                calValue = [self calDigitDiffShow2:record_coinsCollected];
                if(calValue != -999){
                    finishOne_display_coin += calValue;
                }else{
                    finishOne_display_coin = record_coinsCollected;
                }
            }
            
            if(finishOne_displayingIdx == 3){
                calValue = [self calDigitDiffShow2:record_mission];
                if(calValue != -999){
                    finishOne_display_mission += calValue;
                }else{
                    finishOne_display_mission = record_mission;
                }
            }
            
            
            if(finishOne_display_height != record_height){
                finishOne_display_heightMoney = finishOne_moneyGotFromHeight * (float)finishOne_display_height/(float)record_height;
            }else{
                finishOne_display_heightMoney = finishOne_moneyGotFromHeight;
            }
            
           /* if(finishOne_display_attitude != record_maxAttitude){
                finishOne_display_attitudeMoney = finishOne_moneyGotFromAttitude * (float)finishOne_display_attitude/(float)record_maxAttitude;
            }else{
                finishOne_display_attitudeMoney = finishOne_moneyGotFromAttitude;
            }*/
            
            if(finishOne_display_hitted != record_hitted){
                finishOne_display_hittedMoney = finishOne_moneyGotFromHitted * (float)finishOne_display_hitted/(float)record_hitted;
            }else{
                finishOne_display_hittedMoney = finishOne_moneyGotFromHitted;
            }

            if(finishOne_display_coin != record_coinsCollected){
                finishOne_display_coinMoney = finishOne_moneyGotFromCoin * (float)finishOne_display_coin/(float)record_coinsCollected;
            }else{
                finishOne_display_coinMoney = finishOne_moneyGotFromCoin;
            }
            
            if(finishOne_display_mission != record_mission){
                finishOne_display_missionMoney = finishOne_moneyGotFromMission * (float)finishOne_display_mission/(float)record_mission;
            }else{
                finishOne_display_missionMoney = finishOne_moneyGotFromMission;
            }
        
            

            finishOne_display_totalMoney = finishOne_display_heightMoney + finishOne_display_attitudeMoney
                                         + finishOne_display_hittedMoney + finishOne_display_coinMoney + finishOne_display_missionMoney;
      
            
        
            [finishOne_string setString:@""];
            [finishOne_string appendFormat:@"%i", (int)finishOne_display_height];
            [finishOne_string appendString:@"M"];
            [finishOne_l_height setString:finishOne_string];
            
            [finishOne_string setString:@""];
            [finishOne_string appendFormat:@"%i", (int)finishOne_display_heightMoney];
            [finishOne_l_hiehgtMoney setString:finishOne_string];
            
           /* if(finishOne_displayingIdx >= 1){
                [finishOne_string setString:@""];
                [finishOne_string appendFormat:@"%i", (int)finishOne_display_attitude];
                [finishOne_string appendString:@"M"];
                [finishOne_l_attitude setString:finishOne_string];
                
                [finishOne_string setString:@""];
                [finishOne_string appendFormat:@"%i", (int)finishOne_display_attitudeMoney];
                [finishOne_l_attitudeMoney setString:finishOne_string];
            }*/
            
            if(finishOne_displayingIdx >= 1){
                [finishOne_string setString:@""];
                [finishOne_string appendFormat:@"%i", (int)finishOne_display_coin];
                [finishOne_l_coin setString:finishOne_string];
                
                
                // printf("finishOne_display_coinMoney:%i\n",finishOne_display_coinMoney);
                [finishOne_string setString:@""];
                [finishOne_string appendFormat:@"%i", (int)finishOne_display_coinMoney];
                [finishOne_l_coinMoney setString:finishOne_string];
            }

            
            if(finishOne_displayingIdx >= 2){
                [finishOne_string setString:@""];
                [finishOne_string appendFormat:@"%i", (int)finishOne_display_hitted];
                [finishOne_string appendString:@"P"];
                [finishOne_l_hitted setString:finishOne_string];
                
                [finishOne_string setString:@""];
                [finishOne_string appendFormat:@"%i", (int)finishOne_display_hittedMoney];
                [finishOne_l_hittedMoney setString:finishOne_string];
            }
            
            
            if(finishOne_displayingIdx >= 3){
                
                [finishOne_string setString:@""];
                [finishOne_string appendFormat:@"%i", (int)finishOne_display_missionMoney];
                [finishOne_l_missionMoney setString:finishOne_string];
            }
                    
            
            [finishOne_string setString:@""];
            [finishOne_string appendFormat:@"%i", (int)finishOne_display_totalMoney];
            [finishOne_l_totalMoney setString:finishOne_string];
            
            finishOne_calTimer++;
        }
    }
}

-(float) calDigitDiffShow2:(float)_finalValue{
    if(finishOne_displayingTimer >= finishOne_displayingMaxTime){
        //printf("FINISH\n");
        finishOne_displayingTimer = 0;
        finishOne_displayingIdx++;
        return -999;
    }else{
        finishOne_displayingTimer++;
        return ((float)_finalValue/(float)finishOne_displayingMaxTime);
    }
}

-(int) calDigitDiffShow:(int)_diff{
    if(_diff > 1000){
        return 12;
    }else if(_diff > 800){
        return 10;
    }else if(_diff > 600){
        return 9;
    }else if(_diff > 400){
        return 8;
    }else if(_diff > 200){
        return 7;
    }else if(_diff > 100){
        return 6;
    }else if(_diff > 70){
        return 5;
    }else if(_diff > 50){
        return 4;
    }else if(_diff > 30){
        return 3;
    }else if(_diff > 15){
        return 2;
    }else if(_diff > 0){
        return 1;
    }else{
        return 0;
    }
}

-(void) finishOneRoundClick{
    
  //  printf("finishOneRoundClick:%i %i\n",finishOne_timer,finishOne_calTimer);
    
    if(finishOne_timer < 60){
        return;
    }
    
    [finishOne_s_btnOn setPosition:ccp(finishOne_x,finishOne_y - 59 * 2/textureRatioForFuckingIpad)];
    
    if(finishOne_calTimer <120){
        finishOne_calTimer = 999;
        finishOne_displayingIdx = 999;
        
        finishOne_display_height = record_height;
        finishOne_display_attitude = record_maxAttitude;
        finishOne_display_hitted = record_hitted;
        finishOne_display_coin = record_coinsCollected;
        finishOne_display_mission = record_mission;
        finishOne_display_heightMoney = finishOne_moneyGotFromHeight;
        finishOne_display_attitudeMoney = finishOne_moneyGotFromAttitude;
        finishOne_display_hittedMoney = finishOne_moneyGotFromHitted;
        finishOne_display_coinMoney = finishOne_moneyGotFromCoin;
        finishOne_display_missionMoney = finishOne_moneyGotFromMission;
        finishOne_display_totalMoney = finishOne_totalMoneyGot;
        
        return;
    }
    
    //GOTO NEXT SCENE
    //printf("finishOneRoundClick NEXT SCENE\n");
    if(isTransitioning){
        return;
    }
    
    
    s_transition = [CCSprite spriteWithFile:@"blackDot.png"];
    [self addChild:s_transition z:kDeapth_FUCKTOP];
    [s_transition setScaleX:300];
    [s_transition setScaleY:180];
    [s_transition setPosition:ccp(10000,10000)];
    [s_transition setColor:ccc3(0, 0, 0)];
    transitionTimer = 0;
    isTransitioning = false;
    transitionOpacity = 0.0;
    transitionGain = 1.0;
    
    isTransitioning = true;
    [self schedule: @selector(transitionStep:)];
   /* if(hasWinMission){
        isGoingFromMainPlayScene = true;
        [[CCDirector sharedDirector] replaceScene: [MainMissionScene scene]];
    }else{
        isGoingFromMainPlayScene = true;
        [[CCDirector sharedDirector] replaceScene: [MainUpgradeScene scene]];
    }*/
}

-(void) transitionStep:(ccTime) dt{
    printf("transitionOpacity:%4.8f\n",transitionOpacity);
    
    transitionOpacity += 20;
    if(transitionOpacity >= 255){
        [self unschedule: @selector(transitionStep:)];
        
        if(hasWinMission){
            
            static bool isWinningFinal;
            isWinningFinal = false;
            for(int i  = 0 ; i < 3 ; i++){
                if(currentChosenMissionWon[i]){
                    printf("currentChosenMission:%i %i\n",i , currentChosenMission[i]);
                    if(currentChosenMission[i] == 87){
                        //if(![[NSUserDefaults standardUserDefaults] boolForKey:@"main_hasPlayedEndStory"]){
                            storyType = 1;
                        p4rc_canDisplayScore = false;
                            [[CCDirector sharedDirector] replaceScene: [StoryScene scene]];
                            return;
                       // }
                    }
                }
            }
            
            isGoingFromMainPlayScene = true;
            p4rc_canDisplayScore = false;
            [[CCDirector sharedDirector] replaceScene: [MainMissionScene scene]];
        }else{
            isGoingFromMainPlayScene = true;
            p4rc_canDisplayScore = false;
            [[CCDirector sharedDirector] replaceScene: [MainUpgradeScene scene]];
        }
        
    }
    
    [s_transition setPosition:ccp([UIScreen mainScreen].bounds.size.height/2,[UIScreen mainScreen].bounds.size.width/2)];
    [s_transition setOpacity:transitionOpacity];
     
    if(!hasWinMission){
        transitionGain -= 0.02;
        if(transitionGain < 0){
            transitionGain = 0;
        }
        [musicController setmusicGain:transitionGain];
    }
    
}



-(void) initMissionSentense{
   fontTexture_numInRow = 10;
    fontTexture_offsetX = 12 * 2/textureRatioForFuckingIpad;
    fontTexture_offsetY = 14 * 2/textureRatioForFuckingIpad;
    fontTexture_startX = 904 * 2/textureRatioForFuckingIpad;
    
    
        
        firstSentenseLength = 0;
        sencondSentenseLength = 0;
        
        sentense01_AccumOffset = 0;
        setense01_offsetX = 10 * 2/textureRatioForFuckingIpad;
        for (int i=0; missionXXXXFirstSentenseChar[i]; i++){
            startToFuckIdx = missionXXXXFirstSentenseChar[i] - 48;
            
            if(startToFuckIdx < 0){
                startToFuckIdx = 58 - 48;
                sentense01_AccumOffset -= 4 * 2/textureRatioForFuckingIpad;
            }
            

            fontTexture_chosenCol = -1;
            do{
                
                fontTexture_chosenRow = startToFuckIdx;
                fontTexture_chosenCol++;
                
                startToFuckIdx -= fontTexture_numInRow;
            }while(startToFuckIdx >= 0);
            
            // printf("iii:%i\n",i);
            
            [l_firstSentence[i] setTextureRect:CGRectMake(fontTexture_startX + fontTexture_chosenRow * fontTexture_offsetX, fontTexture_chosenCol * fontTexture_offsetY, fontTexture_offsetX, fontTexture_offsetY)];
            
            [l_firstSentence[i] setPosition:ccp(sentense01_AccumOffset + missionCompleted_x - 103 * 2/textureRatioForFuckingIpad, missionCompleted_y - 4 * 2/textureRatioForFuckingIpad)];
            sentense01_AccumOffset += setense01_offsetX;
            
            firstSentenseLength++;
        }
        
        
        sentense01_AccumOffset = 0;
        for (int i=0; missionXXXXSecondSentenseChar[i]; i++){
            startToFuckIdx = missionXXXXSecondSentenseChar[i] - 48;
            
            if(startToFuckIdx < 0){
                startToFuckIdx = 58 - 48;
                sentense01_AccumOffset -= 4 * 2/textureRatioForFuckingIpad;
            }
            
            fontTexture_chosenCol = -1;
            do{
                
                fontTexture_chosenRow = startToFuckIdx;
                fontTexture_chosenCol++;
                
                startToFuckIdx -= fontTexture_numInRow;
            }while(startToFuckIdx >= 0);
            
            // printf("iii:%i\n",i);
            
            [l_secondSentense[i] setTextureRect:CGRectMake(fontTexture_startX + fontTexture_chosenRow * fontTexture_offsetX, fontTexture_chosenCol * fontTexture_offsetY, fontTexture_offsetX, fontTexture_offsetY)];
            
            [l_secondSentense[i] setPosition:ccp(sentense01_AccumOffset + missionCompleted_x - 103 * 2/textureRatioForFuckingIpad, missionCompleted_y - 24 * 2/textureRatioForFuckingIpad)];
            sentense01_AccumOffset += setense01_offsetX;
            
            sencondSentenseLength++;
        }
        
    
}

-(void) initMissionCompletedShown{
    missionCompleted_s_bg = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(518/textureRatioForFuckingIpad, 150/textureRatioForFuckingIpad, 740/textureRatioForFuckingIpad, 126/textureRatioForFuckingIpad)];
    missionCompleted_s_tick = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(598/textureRatioForFuckingIpad, 1334/textureRatioForFuckingIpad, 94/textureRatioForFuckingIpad, 90/textureRatioForFuckingIpad)];
    
    [ss_Character addChild:missionCompleted_s_bg z:kDeapth_FUCKTOP];
    [ss_Character addChild:missionCompleted_s_tick z:kDeapth_FUCKTOP];
    
    [missionCompleted_s_bg setPosition:ccp(10000,10000)];
    [missionCompleted_s_tick setPosition:ccp(10000,10000)];
    
    
    maxWordsInSentense = 60;
    for(int j = 0 ; j < maxWordsInSentense ; j++){
        l_firstSentence[j] = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(0, 0, 0, 0)];
        l_secondSentense[j] = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(0, 0, 0, 0)];
        
        [l_firstSentence[j] setPosition:ccp(10000,100000)];
        [l_firstSentence[j] setAnchorPoint:ccp(0,0)];
        [ss_Character addChild:l_firstSentence[j] z:kDeapth_FUCKTOP];
        [l_firstSentence[j] setColor:ccc3(140,59,19)];
        
        [l_secondSentense[j] setPosition:ccp(10000,100000)];
        [l_secondSentense[j] setAnchorPoint:ccp(0,0)];
        [ss_Character addChild:l_secondSentense[j] z:kDeapth_FUCKTOP];
        [l_secondSentense[j] setColor:ccc3(140,59,19)];
    }
    
    for(int i = 0 ; i < 3 ; i ++){
        missionCompleted_willBeShownThis[i] = false;
        missionCompleted_showingThis[i] = false;
        missionCompleted_showingThisTimer[i] = 0;
        missionCompleted_hasShownThis[i] = false;
    }
        
}

-(void) manageMissionCompletedShown{
    missionCompleted_timer++;
    static int checkOrder;
    checkOrder = 0;
    if(missionCompleted_timer % 10 == 0 && !hasFinishedOneRound){
        while (checkOrder < 3) {
            if(!missionCompleted_hasShownThis[checkOrder]){
               // printf("checking This:%i\n",checkOrder);
                if([mainMissionCheck checkThisMissionByPassingColIdx:checkOrder]){
                    printf("PREWIN:%i\n",checkOrder);
                    missionCompleted_willBeShownThis[checkOrder] = true;
                    missionCompleted_hasShownThis[checkOrder] = true;
                    currentChosenMissionWon[checkOrder] = true;
                    hasWinMission = true;
                   // [self saveCompletedMissionDBByColIdx:checkOrder];
                    break;
                }
            }
            checkOrder++;
        }
    }
    
    
    if(missionCompleted_timer % 20 == 0){
        static bool nthShowing;
        nthShowing = false;
        if(!missionCompleted_showingThis[0] && !missionCompleted_showingThis[1] && !missionCompleted_showingThis[2]){
            nthShowing = true;
        }
        
        for(int i = 0 ; i < 3 ; i++){
            if(nthShowing){
                if(missionCompleted_willBeShownThis[i]){
                    missionCompleted_willBeShownThis[i] = false;
                    missionCompleted_showingThis[i] = true;
                    missionCompleted_showingThisTimer[i] = 0;
                    [self getMissionSentense:currentChosenMission[i]];
                    [self initMissionSentense];
                    
                    missionCompleted_x = [UIScreen mainScreen].bounds.size.height/2;
                    missionCompleted_y = 370;
                    
                    if(isIpad){
                        missionCompleted_y *= 768.0/320.0;
                    }
                    
                    nthShowing = false;
                    
                    [musicController playThisSound:kSound_ComboTime isLoop:NO gain:1.0];
                }
            }
        }
    }
   
    
    
    //RUN ANI
    for(int i = 0 ; i < 3 ; i++){
        if(missionCompleted_showingThis[i]){
            
            
            
            if(isIpad){
                if(missionCompleted_showingThisTimer[i] <= 90){
                    missionCompleted_y += (280 *  768.0/320.0 - missionCompleted_y)/10.0;
                }else{
                    missionCompleted_y += (370 *  768.0/320.0 - missionCompleted_y)/15.0;
                }
            }else{
                if(missionCompleted_showingThisTimer[i] <= 90){
                    missionCompleted_y += (280 - missionCompleted_y)/10.0;
                }else{
                    missionCompleted_y += (370 - missionCompleted_y)/15.0;
                }
            }
            
            [missionCompleted_s_bg setPosition:ccp(missionCompleted_x,missionCompleted_y)];
            [missionCompleted_s_tick setPosition:ccp(missionCompleted_x-150 * 2/textureRatioForFuckingIpad,missionCompleted_y)];
            
            setense01_offsetX = 9 * 2/textureRatioForFuckingIpad;
            sentense01_AccumOffset = 0;
            for (int i=0; i < firstSentenseLength ; i++){
                [l_firstSentence[i] setPosition:ccp(sentense01_AccumOffset + missionCompleted_x - 115 * 2/textureRatioForFuckingIpad, missionCompleted_y + 0 * 2/textureRatioForFuckingIpad)];
                sentense01_AccumOffset += setense01_offsetX;
            }
            
            sentense01_AccumOffset = 0;
            for (int i=0; i < sencondSentenseLength ; i++){
                [l_secondSentense[i] setPosition:ccp(sentense01_AccumOffset + missionCompleted_x - 115 * 2/textureRatioForFuckingIpad, missionCompleted_y - 16 * 2/textureRatioForFuckingIpad)];
                sentense01_AccumOffset += setense01_offsetX;
            }

            
            missionCompleted_showingThisTimer[i]++;
            if(missionCompleted_showingThisTimer[i] == 120){
                missionCompleted_showingThis[i] = false;
            }
        }
    }
}


-(void) saveToDB_Begin{
    static int dbInt;
    if(oneUse_20Fuel){
        dbInt = [[NSUserDefaults standardUserDefaults] integerForKey:@"onsUpgrade_itemLevel_00"];
        dbInt--;
        [[NSUserDefaults standardUserDefaults] setInteger:dbInt forKey:@"onsUpgrade_itemLevel_00"];
    }
    
    if(oneUse_50Fuel){
        dbInt = [[NSUserDefaults standardUserDefaults] integerForKey:@"onsUpgrade_itemLevel_01"];
        dbInt--;
        [[NSUserDefaults standardUserDefaults] setInteger:dbInt forKey:@"onsUpgrade_itemLevel_01"];
    }
    if(oneUse_100Fuel){
        dbInt = [[NSUserDefaults standardUserDefaults] integerForKey:@"onsUpgrade_itemLevel_02"];
        dbInt--;
        [[NSUserDefaults standardUserDefaults] setInteger:dbInt forKey:@"onsUpgrade_itemLevel_02"];
    }
    if(oneUse_doubleYellow){
        dbInt = [[NSUserDefaults standardUserDefaults] integerForKey:@"onsUpgrade_itemLevel_03"];
        dbInt--;
        [[NSUserDefaults standardUserDefaults] setInteger:dbInt forKey:@"onsUpgrade_itemLevel_03"];
    }
    if(oneUse_superInitBoost){
        dbInt = [[NSUserDefaults standardUserDefaults] integerForKey:@"onsUpgrade_itemLevel_04"];
        dbInt--;
        [[NSUserDefaults standardUserDefaults] setInteger:dbInt forKey:@"onsUpgrade_itemLevel_04"];
    }
    if(oneUse_slowCannon){
        dbInt = [[NSUserDefaults standardUserDefaults] integerForKey:@"onsUpgrade_itemLevel_05"];
        dbInt--;
        [[NSUserDefaults standardUserDefaults] setInteger:dbInt forKey:@"onsUpgrade_itemLevel_05"];
    }
    if(oneUse_BreakLess){
        dbInt = [[NSUserDefaults standardUserDefaults] integerForKey:@"onsUpgrade_itemLevel_06"];
        dbInt--;
        [[NSUserDefaults standardUserDefaults] setInteger:dbInt forKey:@"onsUpgrade_itemLevel_06"];
    }
    if(oneUse_magnetic){
        dbInt = [[NSUserDefaults standardUserDefaults] integerForKey:@"onsUpgrade_itemLevel_07"];
        dbInt--;
        [[NSUserDefaults standardUserDefaults] setInteger:dbInt forKey:@"onsUpgrade_itemLevel_07"];
    }
    
    /*if(oneUse_hardSpin){
        dbInt = [[NSUserDefaults standardUserDefaults] integerForKey:@"onsUpgrade_itemLevel_05"];
        dbInt--;
        [[NSUserDefaults standardUserDefaults] setInteger:dbInt forKey:@"onsUpgrade_itemLevel_05"];
    }*/
    
}

-(void) saveToDB{
   /* hasWinMission = false;
    for(int i = 0 ; i < 3 ; i++){
        if([mainMissionCheck checkThisMissionByPassingColIdx:i]){
            hasWinMission = true;
            //[self saveCompletedMissionDBByColIdx:i];
        }
    }*/
    
    static int turtleCoinTotal;
    turtleCoinTotal = [[NSUserDefaults standardUserDefaults] integerForKey:@"turtleCoin"];
    turtleCoinTotal += finishOne_totalMoneyGot;
    [[NSUserDefaults standardUserDefaults] setInteger:turtleCoinTotal forKey:@"turtleCoin"];

    
    //SAVE OTEHER DATA
    printf("SSSVE:%4.8f %i\n",record_height,mainOtherData_bestHeight);
    if(record_height > mainOtherData_bestHeight){
        printf("save mainOtherData_bestHeight:%i\n",mainOtherData_bestHeight);
        [[NSUserDefaults standardUserDefaults] setInteger:(int)record_height forKey:@"mainOtherData_bestHeight"];
    }
    
    printf("save recordUse_diamondGotTotal:%i\n",recordUse_diamondGotTotal);
    [[NSUserDefaults standardUserDefaults] setInteger:recordUse_diamondGotTotal forKey:@"main_diamondGot"];
    [[NSUserDefaults standardUserDefaults] setInteger:recordUse_penguinHitTotal forKey:@"main_penguinHit"];
    [[NSUserDefaults standardUserDefaults] setInteger:recordUse_continuePerfectLaunchTIme forKey:@"main_continuePerfectLaunch"];
    [[NSUserDefaults standardUserDefaults] setInteger:recordUse_moneyGainedTotal forKey:@"main_moneyGained"];
    
    
   /* NSMutableString* achivementString = [NSMutableString string];
    for(int i = 0 ; i < 3 ; i++){
        [achivementString setString:@"missionPlayed_"];
        
        if(currentChosenMission[i] <= 9){
            [achivementString appendString:@"0"];
        }
        
        [achivementString appendFormat:@"%i", currentChosenMission[i]];
        printf("PLAYed:  ");
        NSLog(achivementString);
        [[NSUserDefaults standardUserDefaults] setBool:true forKey:achivementString];
    }*/
    
    for ( int i=0; i<3; i++) {
        NSString *key = [NSString stringWithFormat:@"missionPlayed_%02d", currentChosenMission[i]];
        NSLog(@"played: %@", key);
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:key];
    }
}

-(void) saveCompletedMissionDBByColIdx:(int)_colIdx{
    //SAVE IN MISSION SCENE
    return;
    
    NSMutableString* achivementString = [NSMutableString string];
    [achivementString setString:@"mission_"];
    
    //printf("PRE winForThisColumn:%i %i %i\n",_column,chosenSaveCol, missionStruct[chosenSaveCol]->mission);
    if(currentChosenMission[_colIdx] <= 9){
        [achivementString appendString:@"0"];
    }
    
    [achivementString appendFormat:@"%i", currentChosenMission[_colIdx]];
    [[NSUserDefaults standardUserDefaults] setBool:true forKey:achivementString];
    
    //printf("winForThisColumn:%i %i %i\n",_column,chosenSaveCol, missionStruct[chosenSaveCol]->mission);
}




-(void) initSpeical{
    isHeavyInvincible = false;
    isLightInvincible = false;

    heavyInvincble_texture[0] = CGRectMake(0/textureRatioForFuckingIpad, 990/textureRatioForFuckingIpad-666/textureRatioForFuckingIpad, 358/textureRatioForFuckingIpad, 192/textureRatioForFuckingIpad);
    heavyInvincble_texture[1] = CGRectMake(0/textureRatioForFuckingIpad, 1184/textureRatioForFuckingIpad-666/textureRatioForFuckingIpad, 358/textureRatioForFuckingIpad, 192/textureRatioForFuckingIpad);
    heavyInvincble_texture[2] = CGRectMake(0/textureRatioForFuckingIpad, 1378/textureRatioForFuckingIpad-666/textureRatioForFuckingIpad, 358/textureRatioForFuckingIpad, 192/textureRatioForFuckingIpad);
    
    lightInvincble_texture[0] = CGRectMake(358/textureRatioForFuckingIpad, 990/textureRatioForFuckingIpad-666/textureRatioForFuckingIpad, 358/textureRatioForFuckingIpad, 192/textureRatioForFuckingIpad);
    lightInvincble_texture[1] = CGRectMake(358/textureRatioForFuckingIpad, 1184/textureRatioForFuckingIpad-666/textureRatioForFuckingIpad, 358/textureRatioForFuckingIpad, 192/textureRatioForFuckingIpad);
    lightInvincble_texture[2] = CGRectMake(358/textureRatioForFuckingIpad, 1378/textureRatioForFuckingIpad-666/textureRatioForFuckingIpad, 358/textureRatioForFuckingIpad, 192/textureRatioForFuckingIpad);
    
    s_heavyIncible = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad)];
    s_heavyIncible2 = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad)];
    s_lightIncible = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad)];
    s_lightIncible2 = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad)];
    
 
    [s_heavyIncible setPosition:ccp(10000,10000)];
    [s_lightIncible setPosition:ccp(10000,10000)];
    [s_heavyIncible2 setPosition:ccp(10000,10000)];
    [s_lightIncible2 setPosition:ccp(10000,10000)];

        
    [ss_Character addChild:s_heavyIncible z:kDeapth_Equip_Glide];
    [ss_Character addChild:s_lightIncible z:kDeapth_Equip_Glide];
    [ss_Character addChild:s_heavyIncible2 z:kDeapth_Equip_Glide];
    [ss_Character addChild:s_lightIncible2 z:kDeapth_Equip_Glide];
        
    [s_heavyIncible setAnchorPoint:ccp(334.0/358.0, 0.5)];
    [s_lightIncible setAnchorPoint:ccp(334.0/358.0, 0.5)];
    [s_heavyIncible2 setAnchorPoint:ccp(278.0/358.0, 0.5)];
    [s_lightIncible2 setAnchorPoint:ccp(278.0/358.0, 0.5)];
    
    if(oneUse_doubleYellow){
        characterLightInvincibleMax *= 2;
    }
    
    lightInvincible_max = characterLightInvincibleMax;
    lightInvincibleScale = 0;
    lightInvincibleStartTimer = 0;

    if(lightInvincible_max >= 18){
        lightInvincible_max = 18;
    }
    lightInvincible_remain = lightInvincible_max;
    
    for(int i = 0 ; i < lightInvincible_max ; i++){
         s_lightInvincibleIcon[i] = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1578/textureRatioForFuckingIpad, 524/textureRatioForFuckingIpad, 46/textureRatioForFuckingIpad, 44/textureRatioForFuckingIpad)];
        [ss_Character addChild:s_lightInvincibleIcon[i] z:kDeapth_Penguin_Bombing];
        
        [s_lightInvincibleIcon[i] setPosition:ccp(21 * 1024.0/480.0, (25+ i*26 + 26) * 768.0/320.0)];
        
        if(i >= 6 && i < 12){
            [s_lightInvincibleIcon[i] setPosition:ccp((21+23) * 1024.0/480.0, (25+ (i-6)*26 + 26) * 768.0/320.0)];
        }
        if(i >= 12){
            [s_lightInvincibleIcon[i] setPosition:ccp((21+23*2) * 1024.0/480.0, (25+ (i-12)*26 + 26) * 768.0/320.0)];
        }
        
        [s_lightInvincibleIcon[i] setScale:lightInvincibleScale];
    }
   
    
    
}

-(void) setHeavyInvincible{
    if(isHeavyInvincible){
        return;
    }
    
    if(characterFuelRemain < 15){
        characterFuelRemain = 15;
    }
    
    if(isLightInvincible){
        if(lightInvincibleTimer < (lightInvincibleMaxTime - 30)){
            lightInvincibleTimer = lightInvincibleMaxTime - 30;
        }
    }
    
    heavyInvincibleTimer = 0;
    isHeavyInvincible = true;
   // isLightInvincible = false;
    heavyInvincible_idx = 0;
    heavyInvincibleMaxTime = 99999;
    
    heavyInvincible_endScaleX = 1.0;
    heavyInvincible_endScaleY = 1.0;
    heavyInvincible_endOpacity = 255;
    
    heavyInvincible2_scale = 0;
    heavyInvincible2_opacity = 255;
    heavyInvincible2_vScale = 0.05;
    
    heavyInvincible_scaleY = 0.0;
    
    recordUse_isClickingBtnFromHeavyInvincible = true;
    isBeginningHeavyInvincible = false;
    if(isBeginningFlight){
        heavyInvincibleMaxTime = characterMaxBeginHeavyTime;
        isBeginningHeavyInvincible = true;
    }else{
        recordUse_pantsOfFireTime++;
    }
    
    [musicController playThisSound:kSound_RedFlame isLoop:NO gain:1.0];
    
}


-(void) setLightInvincible{
    if(isLightInvincible){
        return;
    }

    
    lightInvincibleTimer = 0;
   
    isLightInvincible = true;
    lightInvincible_idx = 0;
    lightInvincibleMaxTime = characterLightInvincibleMaxTime;
    
    lightInvincible_endScaleX = 1.0;
    lightInvincible_endScaleY = 1.0;
    lightInvincible_endOpacity = 255;
    
    lightInvincible2_scale = 0;
    lightInvincible2_opacity = 255;
    lightInvincible2_vScale = 0.05;
    
    lightInvincible_scaleY = 0;
    
    [musicController playThisSound:kSound_YellowFlame isLoop:NO gain:1.0];
}

-(void) tryToUseLightInvincible{
    //printf("lightInvincible_remain:%i\n",lightInvincible_remain);
    if(lightInvincible_remain <= 0){
        return;
    }

    if(isHeavyInvincible || isLightInvincible){
        return;
    }

    lightInvincible_remain--;
    
    [s_lightInvincibleIcon[lightInvincible_remain] setOpacity:80];
    
    [self setLightInvincible];
}

-(void) manageHeavyInvincible{
   
    if(isEndingHeavyInvincible){
        endingHeavyInvincibleTimer++;
       // printf("endingHeavyInvincibleTimer:%i\n",endingHeavyInvincibleTimer);
        if(endingHeavyInvincibleTimer == 240){
            isEndingHeavyInvincible = false;
            isBeginningHeavyInvincible = false;
            recordUse_isClickingBtnFromHeavyInvincible = false;
            
            
        }
        if(endingHeavyInvincibleTimer == 25){
            isEndingRedDueToHeavyInvincible = false;
        }
    }
    
    if(!isHeavyInvincible){
        return;
    }
    // printf("manageHeavyInvincible\n");
    
    if([mainUILayer loseTime:0.35] && !isBeginningHeavyInvincible){
        heavyInvincibleTimer = heavyInvincibleMaxTime - 30;
    }
    
    if(heavyInvincibleTimer ==  heavyInvincibleMaxTime - 30){
        isEndingHeavyInvincible = true;
        isEndingRedDueToHeavyInvincible = true;
        endingHeavyInvincibleTimer = 0;
    }
    
    if(heavyInvincible_idx == 0){
        superFuxkOriX =  46 + 28;
        superFuxkOriY =  26;
    }
    if(heavyInvincible_idx == 1){
        superFuxkOriX =  46 + 28;
        superFuxkOriY =  23;
    }
    if(heavyInvincible_idx == 2){
        superFuxkOriX =  48 + 28;
        superFuxkOriY =  23;
    }
    
    if(isIpad){
        superFuxkOriX *= 2;
        superFuxkOriY *= 2;
    }
    
   // superFuxkOriX =  48;
   // superFuxkOriY =  27;
   
    heavInvincible_x =  0 + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
    heavInvincible_y =  0 + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
    
    [s_heavyIncible setTextureRect:heavyInvincble_texture[heavyInvincible_idx]];
    [s_heavyIncible setPosition:ccp(heavInvincible_x - 0 + screenX, heavInvincible_y - 0 + screenY)];
    [s_heavyIncible setRotation:characterRotation];
    

    
    
    if(heavyInvincible_idx == 0){
        superFuxkOriX =  46;
        superFuxkOriY =  26;
    }
    if(heavyInvincible_idx == 1){
        superFuxkOriX =  46;
        superFuxkOriY =  23;
    }
    if(heavyInvincible_idx == 2){
        superFuxkOriX =  48;
        superFuxkOriY =  23;
    }
    
    if(isIpad){
        superFuxkOriX *= 2;
        superFuxkOriY *= 2;
    }

    
    // superFuxkOriX =  48;
    // superFuxkOriY =  27;
    
    heavInvincible2_x =  0 + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
    heavInvincible2_y =  0 + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
    
    [s_heavyIncible2 setTextureRect:heavyInvincble_texture[heavyInvincible_idx]];
    [s_heavyIncible2 setPosition:ccp(heavInvincible2_x - 0 + screenX, heavInvincible2_y - 0 + screenY)];
    [s_heavyIncible2 setRotation:characterRotation];

    heavyInvincible2_scale += heavyInvincible2_vScale;
    heavyInvincible2_vScale += 0.025;
    [s_heavyIncible2 setScale:heavyInvincible2_scale];
    
    if(heavyInvincibleTimer > 1){
        heavyInvincible2_opacity -= 20;
        if(heavyInvincible2_opacity < 0){
            heavyInvincible2_opacity = 0;
        }
    }
    [s_heavyIncible2 setOpacity:heavyInvincible2_opacity];
    
    
    heavyInvincible_step = 4;
    if(characterVelocity > 12){
        heavyInvincible_step = 1;
    }else if(characterVelocity > 10){
        heavyInvincible_step = 2;
    }else if(characterVelocity > 7){
        heavyInvincible_step = 3;
    }
    
    heavyInvincible_scaleX = (characterVelocity * 0.3 + 4.2)/6.0;
    if(heavyInvincible_scaleX < 1.0){
        heavyInvincible_scaleX = 1.0;
    }
    if(heavyInvincible_scaleX > 1.3){
        heavyInvincible_scaleX = 1.3;
    }
   // heavyInvincible_scaleY = 1.0;
    
    if(heavyInvincibleTimer < 7){
        heavyInvincible_scaleY += 0.2;
    }else{
        heavyInvincible_scaleY += (1 - heavyInvincible_scaleY)/10.0;
    }
    
    [s_heavyIncible setScaleX:heavyInvincible_scaleX];
    [s_heavyIncible setScaleY:heavyInvincible_scaleY];
    [s_heavyIncible setOpacity:255];
    
    static int fuckTimerFuck = 0;
    fuckTimerFuck++;
    if(fuckTimerFuck % heavyInvincible_step == 0){
        heavyInvincible_idx++;
        if(heavyInvincible_idx == 3){
            heavyInvincible_idx = 0;
        }
    }

    
    
    heavyInvincibleTimer++;
    
    if(heavyInvincibleTimer > (heavyInvincibleMaxTime - 30)){
        heavyInvincible_endScaleY -= 0.05;
        if(heavyInvincible_endScaleY < 0 ){
            heavyInvincible_endScaleY = 0;
        }
        
        heavyInvincible_endScaleX -= 0.01;
        if(heavyInvincible_endScaleX < 0 ){
            heavyInvincible_endScaleX = 0;
        }

        
        heavyInvincible_endOpacity -= 2;
        if(heavyInvincible_endOpacity < 0){
            heavyInvincible_endOpacity = 0;
        }
        
        [s_heavyIncible setScaleX:heavyInvincible_endScaleX * heavyInvincible_scaleX];
        [s_heavyIncible setScaleY:heavyInvincible_endScaleY * heavyInvincible_scaleY];
        [s_heavyIncible setOpacity:heavyInvincible_endOpacity];
    }
    
    if(heavyInvincibleTimer == heavyInvincibleMaxTime){
        [self endHeavyInvincible];
    }
    
}
-(void) manageLightInvincible{
    if(!isBeginningFlight){
        if(lightInvincibleStartTimer < 120){
            
            static float dx;
            dx = 1.0 - lightInvincibleScale;
            
            lightInvincibleAS = dx * 0.05;
            lightInvincibleScale += lightInvincibleVS;
            lightInvincibleVS += lightInvincibleAS;
            lightInvincibleVS *= 0.75;
            
            lightInvincibleStartTimer++;
          //  printf("lightInvincibleScale:%4.8f\n",lightInvincibleScale);
            
            for(int i = 0 ; i < lightInvincible_max ; i++){
                [s_lightInvincibleIcon[i] setScale:lightInvincibleScale];
            }
            
            [s_distanceShown_line setScale:lightInvincibleScale];
            [s_distanceShown_turtle setScale:lightInvincibleScale];
            [s_distanceShown_bestPosition setScale:lightInvincibleScale];
            
        }
    }

    
    if(!isLightInvincible){
        return;
    }

        
    if(lightInvincible_idx == 0){
        superFuxkOriX =  46 + 28;
        superFuxkOriY =  26;
    }
    if(lightInvincible_idx == 1){
        superFuxkOriX =  46 + 28;
        superFuxkOriY =  23;
    }
    if(lightInvincible_idx == 2){
        superFuxkOriX =  48 + 28;
        superFuxkOriY =  23;
    }
    
    if(isIpad){
        superFuxkOriX *= 2;
        superFuxkOriY *= 2;
    }
    
    // superFuxkOriX =  48;
    // superFuxkOriY =  27;
    
    lightInvincible_x =  0 + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
    lightInvincible_y =  0 + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
    
    [s_lightIncible setTextureRect:lightInvincble_texture[lightInvincible_idx]];
    [s_lightIncible setPosition:ccp(lightInvincible_x - 0 + screenX, lightInvincible_y - 0 + screenY)];
    [s_lightIncible setRotation:characterRotation];
    
    
    
    
    if(lightInvincible_idx == 0){
        superFuxkOriX =  46;
        superFuxkOriY =  26;
    }
    if(lightInvincible_idx == 1){
        superFuxkOriX =  46;
        superFuxkOriY =  23;
    }
    if(lightInvincible_idx == 2){
        superFuxkOriX =  48;
        superFuxkOriY =  23;
    }
    
    if(isIpad){
        superFuxkOriX *= 2;
        superFuxkOriY *= 2;
    }
    
    // superFuxkOriX =  48;
    // superFuxkOriY =  27;
    
    lightInvincible2_x =  0 + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
    lightInvincible2_y =  0 + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
    
    [s_lightIncible2 setTextureRect:lightInvincble_texture[lightInvincible_idx]];
    [s_lightIncible2 setPosition:ccp(10000, lightInvincible2_y - 0 + screenY)];
    [s_lightIncible2 setRotation:characterRotation];
    
    lightInvincible2_scale += lightInvincible2_vScale;
    lightInvincible2_vScale += 0.025;
    //[s_lightIncible2 setScale:lightInvincible2_scale];
    
    if(lightInvincibleTimer > 1){
        lightInvincible2_opacity -= 20;
        if(lightInvincible2_opacity < 0){
            lightInvincible2_opacity = 0;
        }
    }
    //[s_lightIncible2 setOpacity:lightInvincible2_opacity];
    
    
    lightInvincible_step = 4;
    if(characterVelocity > 12){
        lightInvincible_step = 2;
    }else if(characterVelocity > 10){
        lightInvincible_step = 3;
    }else if(characterVelocity > 7){
        lightInvincible_step = 3;
    }
    
    lightInvincible_scaleX = (characterVelocity * 0.1 + 5.4)/6.0;
    if(lightInvincible_scaleX < 1.0){
        lightInvincible_scaleX = 1.0;
    }
    if(lightInvincible_scaleX > 1.1){
        lightInvincible_scaleX = 1.1;
    }
    if(lightInvincibleTimer < 7){
        lightInvincible_scaleY += 0.2;
    }else{
        lightInvincible_scaleY += (1 - lightInvincible_scaleY)/10.0;
    }
    
    [s_lightIncible setScaleX:lightInvincible_scaleX];
    [s_lightIncible setScaleY:lightInvincible_scaleY];
    [s_lightIncible setOpacity:255];
    
    static int fuckTimerFuck = 0;
    fuckTimerFuck++;
    if(fuckTimerFuck % lightInvincible_step == 0){
        lightInvincible_idx++;
        if(lightInvincible_idx == 3){
            lightInvincible_idx = 0;
        }
    }
    
    
    
    lightInvincibleTimer++;
    
    
    if(lightInvincibleTimer > (lightInvincibleMaxTime - 30)){
        lightInvincible_endScaleY -= 0.05;
        if(lightInvincible_endScaleY < 0 ){
            lightInvincible_endScaleY = 0;
        }
        
        lightInvincible_endScaleX -= 0.01;
        if(lightInvincible_endScaleX < 0 ){
            lightInvincible_endScaleX = 0;
        }
        
        
        lightInvincible_endOpacity -= 2;
        if(lightInvincible_endOpacity < 0){
            lightInvincible_endOpacity = 0;
        }
        
        [s_lightIncible setScaleX:lightInvincible_endScaleX * lightInvincible_scaleX];
        [s_lightIncible setScaleY:lightInvincible_endScaleY * lightInvincible_scaleY];
        [s_lightIncible setOpacity:lightInvincible_endOpacity];
    }
    
    if(lightInvincibleTimer == lightInvincibleMaxTime){
        [self endLightInvincible];
    }
}

-(void) endHeavyInvincible{
    isHeavyInvincible = false;
   
    
    [s_heavyIncible setTextureRect:CGRectMake(0, 0, 0, 0)];
    [s_heavyIncible2 setTextureRect:CGRectMake(0, 0, 0, 0)];
    
    [s_heavyIncible setPosition:ccp(10000,100000)];
    [s_heavyIncible2 setPosition:ccp(10000,100000)];
    
    [s_heavyIncible setScale:0];
    [s_heavyIncible2 setScale:0];
    
    printf("endHeavyInvincibleendHeavyInvincibleendHeavyInvincibleendHeavyInvincible\n");
}

-(void) endLightInvincible{
    isLightInvincible = false;
    [s_lightIncible setPosition:ccp(10000,10000)];
    
    [s_lightIncible setTextureRect:CGRectMake(0, 0, 0, 0)];
    [s_lightIncible2 setTextureRect:CGRectMake(0, 0, 0, 0)];
    
    [s_lightIncible setPosition:ccp(10000,100000)];
    [s_lightIncible2 setPosition:ccp(10000,100000)];
    
    [s_lightIncible setScale:0];
    [s_lightIncible2 setScale:0];
    
    printf("endLightInvincibleendLightInvincibleendLightInvincible\n");
}



-(void) initCannon{
    
    cannon = [[Cannon alloc] init];
    [cannon setDelegate:self];
    [cannon setCannonStatus:kCannonStatus_Idle];
    [cannon setIdNumber:0];
    [cannon setX:999];
    [cannon setY:9999];
    //[cannon setRotateDegree:0 + 50.4801941];
    [cannon setRotateDegree:-33];
    
   // cannon_x = characterX - 87 + 5;
   // cannon_y = characterY - 58 + 4;
   // cannon_x = characterX - 87 + 15;
   // cannon_y = characterY - 58 + 12;
    cannon_x = characterX - 87 + 12;
    cannon_y = characterY - 58 + 10;
    
    if(isIpad){
        cannon_x = characterX - 87 * 2/textureRatioForFuckingIpad + 12 * 2/textureRatioForFuckingIpad ;
        cannon_y = characterY - 58 * 2/textureRatioForFuckingIpad  + 10 * 2/textureRatioForFuckingIpad ;
    }
    
    cannon_showing = true;
    
}

-(void) cannonShootBall:(int)_fromId{
    [controlLayer MAIN_setChangingBtn];
    [self setToBombingCannon:[cannon x] y:[cannon y]];
    //[playLayer setToBombingCannon:[cannon x] y:[cannon y]];
    [self startFlight];
    
    [musicController playThisSound:kSound_TurtleExplode02 isLoop:NO gain:1.0];
}

-(void) setCannonPrepareShoot{
    [cannon MAIN_SETSHOOT];
}

-(void) setToBombing:(float)_turtleX turtleY:(float)_turtleY{
    
    bombingAniStruct[bombingAniIdx]->isAni = true;
    bombingAniStruct[bombingAniIdx]->aniTimer = 0;
    
    printf("setToBombing:%4.8f %4.8f\n",_turtleX, _turtleY);
    
    bombingAniStruct[bombingAniIdx]->aniX = _turtleX - 350;
    bombingAniStruct[bombingAniIdx]->aniY = _turtleY + 269;
    
    bombingAniIdx++;
    if(bombingAniIdx == bombingAniMax){
        bombingAniIdx = 0;
    }
}

-(void) setToBombingCannon:(float)_x y:(float)_y{
    bombingAniStruct[bombingAniIdx]->isAniCannon = true;
    bombingAniStruct[bombingAniIdx]->aniTimer = 0;
    
    
    if(isIpad){
        bombingAniStruct[bombingAniIdx]->aniX = 300 - 350;
        bombingAniStruct[bombingAniIdx]->aniY = 250 + 269;
    }else{
        bombingAniStruct[bombingAniIdx]->aniX = 235 - 350;
        bombingAniStruct[bombingAniIdx]->aniY = 115 + 269;
    }
   
    
    bombingAniIdx++;
    if(bombingAniIdx == bombingAniMax){
        bombingAniIdx = 0;
    }

}

-(void) maangeCannon{
    if(cannon_showing){
       // printf("cannon_x - characterX + screenX:%4.8f %4.8f\n",cannon_x - characterX + screenX,cannon_y - characterY + screenY);
        
        [cannon setX:cannon_x - characterX + cannon_initScreenX];
        [cannon setY:cannon_y - characterY + cannon_initScreenY];
        [cannon manageMAIN];
        
  
        //DO SPIN HERE
        [self manageSpin];
        [self manageBeginFlightOther];
        
        if(characterX > 1000){
            cannon_showing = false;
        }
    }
}

-(void) manageBeginFlightOther{
    [s_riff setPosition:ccp(riff_x - characterX + cannon_finalScreenX, riff_y - characterY + cannon_finalScreenY)];
}

-(void) setScreenOffsetXFromExternal:(float)_offsetX{
  //  screenX = cannon_initScreenX + _offsetX;
    screenX += (cannon_finalScreenX - screenX)/40.0;
}

-(void) setScreenOffsetYFromExternal:(float)_offsetY{
  //  screenY = cannon_initScreenY + _offsetY;
     screenY += (cannon_finalScreenY - screenY)/40.0;
}


-(void) getMissionSentense:(int)_missionIdx{
    if(_missionIdx == 0){
        missionXXXXFirstSentenseChar = "FLY FOR A DURATION OF";
        missionXXXXSecondSentenseChar = "12 SECONDS";
    }
    if(_missionIdx == 1){
        missionXXXXFirstSentenseChar = "FLY STRAIGHT FOR 6 SECONDS";
        missionXXXXSecondSentenseChar = "";
    }
    if(_missionIdx == 2){
        missionXXXXFirstSentenseChar = "REACH A SPEED OF 22MPH";
        missionXXXXSecondSentenseChar = "";
    }
    if(_missionIdx == 3){
        missionXXXXFirstSentenseChar = "PERFORM 1 PERFECT LAUNCH";
        missionXXXXSecondSentenseChar = "";
    }
    if(_missionIdx == 4){
        missionXXXXFirstSentenseChar = "GET A DIAMOND";
        missionXXXXSecondSentenseChar = "IN A SINGLE RUN";
    }
    if(_missionIdx == 5){
        missionXXXXFirstSentenseChar = "FLY FOR A DISTANCE OF 350M";
        missionXXXXSecondSentenseChar = "";
    }
    if(_missionIdx == 6){
        missionXXXXFirstSentenseChar = "UPGRADE CANNON TO LEVEL 1";
        missionXXXXSecondSentenseChar = "";
    }
    if(_missionIdx == 7){
        missionXXXXFirstSentenseChar = "GET A TOTAL OF 5 DIAMONDS";
        missionXXXXSecondSentenseChar = "";
    }
    if(_missionIdx == 8){
        missionXXXXFirstSentenseChar = "FLY FOR A DISTANCE OF 400M";
        missionXXXXSecondSentenseChar = "WITHOUT PERFECT LAUNCH";
    }
    if(_missionIdx == 9){
        missionXXXXFirstSentenseChar = "FLY NEAR THE FLOOR";
        missionXXXXSecondSentenseChar = "FOR 5 SECONS";
    }
    if(_missionIdx == 10){
        missionXXXXFirstSentenseChar = "FLY FOR A DURATION OF";
        missionXXXXSecondSentenseChar = "25 SECONDS";
    }
    if(_missionIdx == 11){
        missionXXXXFirstSentenseChar = "FLY STRAIGHT AND";
        missionXXXXSecondSentenseChar = "REACH A SPEED OF 30MPH";
    }
    if(_missionIdx == 12){
        missionXXXXFirstSentenseChar = "UPGRADE YOUR ROCKET";
        missionXXXXSecondSentenseChar = "TO LEVEL 2 OR ABOVE";
    }
    if(_missionIdx == 13){
        missionXXXXFirstSentenseChar = "REACH AN ALTITUDE OF 150M";
        missionXXXXSecondSentenseChar = "";
    }
    if(_missionIdx == 14){
        missionXXXXFirstSentenseChar = "DESTROY THE FIRST OBSTACLE";
        missionXXXXSecondSentenseChar = "REACH MAXIMUM SPEED TO DESTROY";
    }
    if(_missionIdx == 15){
        missionXXXXFirstSentenseChar = "GET TWO DIAMONDS";
        missionXXXXSecondSentenseChar = "IN A SINGLE RUN";
    }
    if(_missionIdx == 16){
        missionXXXXFirstSentenseChar = "FLY NEAR THE FLOOR";
        missionXXXXSecondSentenseChar = "FOR 7 SECONS";
    }
    if(_missionIdx == 17){
        missionXXXXFirstSentenseChar = "FLY FOR A DISTANCE OF 350M";
        missionXXXXSecondSentenseChar = "WITHOUT APPLYING FUEL";
    } 
    if(_missionIdx == 18){
        missionXXXXFirstSentenseChar = "FLY FOR A DISTANCE OF 1000M";
        missionXXXXSecondSentenseChar = "";
    }
    if(_missionIdx == 19){
        missionXXXXFirstSentenseChar = "PERFORM 2 PERFECT LAUNCH";
        missionXXXXSecondSentenseChar = "IN A ROW";
    } 
    if(_missionIdx == 20){
        missionXXXXFirstSentenseChar = "FLY STRAIGHT OVER 23MPH";
        missionXXXXSecondSentenseChar = "FOR 15 SECONDS";
    }
    if(_missionIdx == 21){
        missionXXXXFirstSentenseChar = "DESTROY THE FIRST OBSTACLE";
        missionXXXXSecondSentenseChar = "IN LESS THAN 12 SECONDS";
    }
    if(_missionIdx == 22){
        missionXXXXFirstSentenseChar = "REACH AN ALTITUDE OF 200M";
        missionXXXXSecondSentenseChar = "";
    }
    if(_missionIdx == 23){
        missionXXXXFirstSentenseChar = "HIT ONE PENGUIN";
        missionXXXXSecondSentenseChar = "<PENGUINS APPEAR OVER 150M>";
    }
    if(_missionIdx == 24){
        missionXXXXFirstSentenseChar = "HIT A TOTAL OF 5 PENGUINS";
        missionXXXXSecondSentenseChar = "";
    }
    if(_missionIdx == 25){
        missionXXXXFirstSentenseChar = "FLY FOR A DURATION OF";
        missionXXXXSecondSentenseChar = "45 SECONDS";
    }
    if(_missionIdx == 26){
        missionXXXXFirstSentenseChar = "GET 3 DIAMONDS";
        missionXXXXSecondSentenseChar = "IN A SINGLE RUN";
    }
    if(_missionIdx == 27){
        missionXXXXFirstSentenseChar = "FLY STRAIGHT AND";
        missionXXXXSecondSentenseChar = "REACH A SPEED OF 40MPH";
    }
    if(_missionIdx == 28){
        missionXXXXFirstSentenseChar = "DESTROY THE SECOND OBSTACLE";
        missionXXXXSecondSentenseChar = "GET THE SECOND TURTLE BALL";
    }
    if(_missionIdx == 29){
        missionXXXXFirstSentenseChar = "REACH AN ALTITUDE OF 350M";
        missionXXXXSecondSentenseChar = "";
    }
    if(_missionIdx == 30){
        missionXXXXFirstSentenseChar = "GET A TOTAL OF 20 DIAMONDS";
        missionXXXXSecondSentenseChar = "";
    }
    if(_missionIdx == 31){
        missionXXXXFirstSentenseChar = "HIT 2 PENGUINS";
        missionXXXXSecondSentenseChar = "IN A SINGLE RUN";
    }
    if(_missionIdx == 32){
        missionXXXXFirstSentenseChar = "FLY FOR A DURATION OF";
        missionXXXXSecondSentenseChar = "65 SECONDS";
    }
    if(_missionIdx == 33){
        missionXXXXFirstSentenseChar = "FLY FOR A DISTANCE OF 2500M";
        missionXXXXSecondSentenseChar = "";
    }
    if(_missionIdx == 34){
        missionXXXXFirstSentenseChar = "FLY NEAR THE FLOOR FOR 5S";
        missionXXXXSecondSentenseChar = "KEEPING THE SPEED OVER 30MPH";
    }
    if(_missionIdx == 35){
        missionXXXXFirstSentenseChar = "HIT A TOTAL OF 20 PENGUINS";
        missionXXXXSecondSentenseChar = "";
    }
    if(_missionIdx == 36){
        missionXXXXFirstSentenseChar = "HIT 4 PENGUINS";
        missionXXXXSecondSentenseChar = "IN A SINGLE RUN";
    }
    if(_missionIdx == 37){
        missionXXXXFirstSentenseChar = "GET A GREEN DIAMOND";
        missionXXXXSecondSentenseChar = "";
    }
    if(_missionIdx == 38){
        missionXXXXFirstSentenseChar = "DESTROY 2 OBSTACLES";
        missionXXXXSecondSentenseChar = "IN A SINGLE RUN";
    }
    if(_missionIdx == 39){
        missionXXXXFirstSentenseChar = "DESTROY THE FIRST OBSTACLE";
        missionXXXXSecondSentenseChar = "WITHOUT APPLYING FUEL";
    }
    if(_missionIdx == 40){
        missionXXXXFirstSentenseChar = "REACH AN ALTITUDE OF 460M";
        missionXXXXSecondSentenseChar = "";
    }
    if(_missionIdx == 41){
        missionXXXXFirstSentenseChar = "FLY STRAIGHT AND";
        missionXXXXSecondSentenseChar = "REACH A SPEED OF 52MPH";
    }
    if(_missionIdx == 42){
        missionXXXXFirstSentenseChar = "HIT 6 PENGUINS";
        missionXXXXSecondSentenseChar = "IN A SINGLE RUN";
    }
    if(_missionIdx == 43){
        missionXXXXFirstSentenseChar = "DESTROY THE THIRD OBSTACLE";
        missionXXXXSecondSentenseChar = "GET THE THIRD TURTLE BALL";
    }
    if(_missionIdx == 44){
        missionXXXXFirstSentenseChar = "EARN ;20 FROM DIAMOND COLLECTED";
        missionXXXXSecondSentenseChar = "IN A SINGLE RUN";
    }
    if(_missionIdx == 45){
        missionXXXXFirstSentenseChar = "DESTROY THE SECOND OBSTACLE";
        missionXXXXSecondSentenseChar = "IN LESS THAN 28 SECONDS";
    }
    if(_missionIdx == 46){
        missionXXXXFirstSentenseChar = "FLY FOR A DURATION OF";
        missionXXXXSecondSentenseChar = "90 SECONDS";
    }
    if(_missionIdx == 47){
        missionXXXXFirstSentenseChar = "FLY NEAR THE FLOOR FOR 3S";
        missionXXXXSecondSentenseChar = "KEEPING THE SPEED OVER 45MPH";
    }
    if(_missionIdx == 48){
        missionXXXXFirstSentenseChar = "PERFORM 3 PERFECT LAUNCH";
        missionXXXXSecondSentenseChar = "IN A ROW";;
    }
    if(_missionIdx == 49){
        missionXXXXFirstSentenseChar = "HIT A TOTAL OF 50 PENGUINS";
        missionXXXXSecondSentenseChar = "";
    }
    if(_missionIdx == 50){
        missionXXXXFirstSentenseChar = "GAIN A TOTAL OF ;100 FROM DIAMONDS";
        missionXXXXSecondSentenseChar = "";
        
    }
    if(_missionIdx == 51){
        missionXXXXFirstSentenseChar = "FLY FOR A DISTANCE OF 4500M";
        missionXXXXSecondSentenseChar = "";
    }
    if(_missionIdx == 52){
        missionXXXXFirstSentenseChar = "GET 3 GREEN DIAMONDS";
        missionXXXXSecondSentenseChar = "IN A SINGLE RUN";
    }
    if(_missionIdx == 53){
        missionXXXXFirstSentenseChar = "DESTROY THE FORTH OBSTACLE";
        missionXXXXSecondSentenseChar = "GET THE FORTH TURTLE BALL";
    }
    if(_missionIdx == 54){
        missionXXXXFirstSentenseChar = "PERFORM ONE PANTS ON FIRE";
        missionXXXXSecondSentenseChar = "";
    }
    if(_missionIdx == 55){
        missionXXXXFirstSentenseChar = "HIT 8 PENGUINS";
        missionXXXXSecondSentenseChar = "IN A SINGLE RUN";
    }
    if(_missionIdx == 56){
        missionXXXXFirstSentenseChar = "PERFORM A PERFECT LAUNCH";
        missionXXXXSecondSentenseChar = "FROM CANNON AT LEVEL 4 OR ABOVE";
    }
    if(_missionIdx == 57){
        missionXXXXFirstSentenseChar = "HIT THE FIRST OBSTACLE";
        missionXXXXSecondSentenseChar = "IN LESS THAN 10 SECONDS";
    }
    if(_missionIdx == 58){
        missionXXXXFirstSentenseChar = "EARN ;40 FROM DIAMOND COLLECTED";
        missionXXXXSecondSentenseChar = "IN A SINGLE RUN";
    }
    if(_missionIdx == 59){
        missionXXXXFirstSentenseChar = "PERFORM ONE PANTS ON FIRE";
        missionXXXXSecondSentenseChar = "WITHOUT HITTING ANY PENGUIN";
    }
    if(_missionIdx == 60){
        missionXXXXFirstSentenseChar = "HIT A TOTAL OF 100 PENGUINS";
        missionXXXXSecondSentenseChar = "";
    }
    if(_missionIdx == 61){
        missionXXXXFirstSentenseChar = "FLY FOR A DISTANCE OF 900M";
        missionXXXXSecondSentenseChar = "WITHOUT APPLYING FUEL";
    }
    if(_missionIdx == 62){
        missionXXXXFirstSentenseChar = "REACH AN ALTITUDE OF 800M";
        missionXXXXSecondSentenseChar = "";
    }
    if(_missionIdx == 63){
        missionXXXXFirstSentenseChar = "DESTROY 3 OBSTACLES";
        missionXXXXSecondSentenseChar = "IN LESS THAN 50 SECONDS";
    }
    if(_missionIdx == 64){
        missionXXXXFirstSentenseChar = "DESTROY THE FIFTH OBSTACLES";
        missionXXXXSecondSentenseChar = "GET THE FIFTH TURTLE BALL";
    }
    if(_missionIdx == 65){
        missionXXXXFirstSentenseChar = "EARN ;140 FROM DIAMOND COLLECTED";
        missionXXXXSecondSentenseChar = "IN A SINGLE RUN";
    }
    if(_missionIdx == 66){
        missionXXXXFirstSentenseChar = "DESTROY ANY OBSTACLE";
        missionXXXXSecondSentenseChar = "WHILE PANTS OF FIRE";
    }
    if(_missionIdx == 67){
        missionXXXXFirstSentenseChar = "REACH A SPEED OF 75MPH";
        missionXXXXSecondSentenseChar = "WITHOUT PANTS OF FIRE";
    }
    if(_missionIdx == 68){
        missionXXXXFirstSentenseChar = "DESTROY THE FORTH OBSTACLE";
        missionXXXXSecondSentenseChar = "IN LESS THAN 56 SECONDS";
    }
    if(_missionIdx == 69){
        missionXXXXFirstSentenseChar = "COLLECT A TOTAL OF 250 DIAMONDS";
        missionXXXXSecondSentenseChar = "";
    }
    if(_missionIdx == 70){
        missionXXXXFirstSentenseChar = "FLY FOR A DISTANCE OF 6200M";
        missionXXXXSecondSentenseChar = "";
    }
    if(_missionIdx == 71){
        missionXXXXFirstSentenseChar = "HIT A TOTAL OF 15 PENGUINS";
        missionXXXXSecondSentenseChar = "IN A SINGLE RUN";
    }
    if(_missionIdx == 72){
        missionXXXXFirstSentenseChar = "PERFORM 2 PANTS OF FIRE";
        missionXXXXSecondSentenseChar = "IN A SINGLE RUN";
    }
    if(_missionIdx == 73){
        missionXXXXFirstSentenseChar = "DESTROY 5 OBSTACLES";
        missionXXXXSecondSentenseChar = "IN A SINGLE RUN";
    }
    if(_missionIdx == 74){
        missionXXXXFirstSentenseChar = "REACH AN ALTITUDE OF 1400M";
        missionXXXXSecondSentenseChar = "";
    }
    if(_missionIdx == 75){
        missionXXXXFirstSentenseChar = "FLY NEAR THE FLOOR FOR 6S";
        missionXXXXSecondSentenseChar = "KEEPING THE SPEED OVER 45MPH";
    }
    if(_missionIdx == 76){
        missionXXXXFirstSentenseChar = "FLY FOR A DISTANCE OF 1100M";
        missionXXXXSecondSentenseChar = "WITHOUT APPLYING FUEL";
    }
    if(_missionIdx == 77){
        missionXXXXFirstSentenseChar = "COLLECT 6 PURPLE DIAMONDS";
        missionXXXXSecondSentenseChar = "IN A SINGLE RUN";
    }
    if(_missionIdx == 78){
        missionXXXXFirstSentenseChar = "DESTROY THE SIXTH OBSTACLE";
        missionXXXXSecondSentenseChar = "GET THE SIXTH TURTLE BALL";
    }
    if(_missionIdx == 79){
        missionXXXXFirstSentenseChar = "PERFORM 4 PERFECT LAUNCH";
        missionXXXXSecondSentenseChar = "IN A ROW";
        
    }
    if(_missionIdx == 80){
        missionXXXXFirstSentenseChar = "PERFORM 5 PANTS OF FIRE";
        missionXXXXSecondSentenseChar = "IN A SINGLE RUN";
    }
    
    if(_missionIdx == 81){
        missionXXXXFirstSentenseChar = "HIT 7 PENGUINS IN";
        missionXXXXSecondSentenseChar = "ONE YELLOW BLAZE TIME";
    }
    
    if(_missionIdx == 82){
        missionXXXXFirstSentenseChar = "EARN ;500 FROM DIAMOND COLLECTED";
        missionXXXXSecondSentenseChar = "IN A SINGLE RUN";
    }
    
    if(_missionIdx == 83){
        missionXXXXFirstSentenseChar = "DESTROY ANY 4 OBSTACLES";
        missionXXXXSecondSentenseChar = "IN LESS THAN 42 SECONDS";
    }
    
    if(_missionIdx == 84){
        missionXXXXFirstSentenseChar = "FLY STRAIGHT AND";
        missionXXXXSecondSentenseChar = "REACH A SPEED OF 90MPH";
    }
    
    if(_missionIdx == 85){
        missionXXXXFirstSentenseChar = "REACH AN ALTITUDE OF 1700M";
        missionXXXXSecondSentenseChar = "";
    }
    
    if(_missionIdx == 86){
        missionXXXXFirstSentenseChar = "DESTROY THE FIFTH OBSTACLE";
        missionXXXXSecondSentenseChar = "IN LESS THAN 58 SECONDS";
    }
    
    if(_missionIdx == 87){
        missionXXXXFirstSentenseChar = "DESTROY THE FINAL OBSTACLE";
        missionXXXXSecondSentenseChar = "GET THE FINAL BALL";
    }
    
}



@end
