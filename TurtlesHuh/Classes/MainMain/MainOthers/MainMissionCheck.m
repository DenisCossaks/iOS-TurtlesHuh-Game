//
//  MainMissionCheck.m
//  TurtlesHuh
//
//  Created by  on 2012/7/12.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "MainMissionCheck.h"
#import "Global.h"
#import "MissionGlobal.h"
#import "MainGamePlayGlobal.h"
#import "GamePlayGlobal.h"

@implementation MainMissionCheck

-(int) thisMissionPriceByPassingColIdx:(int)_colIdx{
    return [self thisMissionPrice:currentChosenMission[_colIdx]];
}

-(int) thisMissionPrice:(int)_missionIdx{
    if(_missionIdx >= 0 && _missionIdx <= 6){
        return 15;
    }
    if(_missionIdx >= 7 && _missionIdx <= 13){
        return 30;
    }
    if(_missionIdx == 14){
        return 300;
    }
    if(_missionIdx >= 15 && _missionIdx <= 17){
        return 30;
    }
    
    //hit 1
    if(_missionIdx >= 18 &&  _missionIdx <= 25){
        return 60;
    }
    if(_missionIdx >= 26 && _missionIdx <= 27){
        return 100;
    }
    if(_missionIdx == 28){
        return 1000;
    }
    if(_missionIdx >= 29 && _missionIdx <= 31){
        return 150;
    }
    
    //hit 2
    if(_missionIdx >= 32 && _missionIdx <= 38){
        return 150;
    }
    if(_missionIdx >= 39 && _missionIdx <= 42){
        return 200;
    }
    if(_missionIdx == 43){
        return 2000;
    }
    
    //hit 3
    if(_missionIdx >= 44 && _missionIdx <= 48){
        return 250;
    }
    if(_missionIdx >= 49 && _missionIdx <= 52){
        return 300;
    }
    if(_missionIdx == 53){
        return 5000;
    }
    
    //hit 4
    if(_missionIdx >= 54 && _missionIdx <= 63){
        return 400;
    }
    if(_missionIdx == 64){
        return 8000;
    }
    
    //hit 5
    if(_missionIdx >= 65 && _missionIdx <= 70){
        return 500;
    }
    if(_missionIdx >= 71 && _missionIdx <= 77){
        return 700;
    }
    if(_missionIdx == 78){
        return 12000;
    }
    
    //hit 6
    if(_missionIdx >= 79 && _missionIdx <= 86){
        return 900;
    }
    if(_missionIdx == 87){
        return 16000;
    }
    
    return 0;
}


-(bool) checkThisMissionByPassingColIdx:(int)_colIdx{
    return [self checkThisMission:currentChosenMission[_colIdx]];
}

-(bool) checkThisMission:(int)_missionIdx{
    
    if(_missionIdx == 0){
        if(record_totalFlightTime >= 12){
            return true;
        }
    }
    
    if(_missionIdx == 1){
        if(record_flyStraightTime >= 6){
            return true;
        }
    }
    
    if(_missionIdx == 2){
        if(!recordUse_isClickingBtnFromHeavyInvincible){
            if(characterVelocity >= 5){
                return true;
            }
        }
    }
    
    if(_missionIdx == 3){
        if(spin_pefect){
            return true;
        }
    }
    
    if(_missionIdx == 4){
        if(recordUse_diamondGotInOneRound >= 1){
            return true;
        }
    }
    
    if(_missionIdx == 5){
        if(characterRealX >= 350){
            return true;
        }
    }
    
    if(_missionIdx == 6){
        if(playerCannon >= 1){
            return true;
        }
    }

    
    if(_missionIdx == 7){
        if(recordUse_diamondGotTotal >= 5){
            return true;
        }
    }
    
    if(_missionIdx == 8){
        if(!spin_pefect){
            if(characterRealX >= 400){
                return true;
            }
        }
    }
    
    if(_missionIdx == 9){
            if(record_flyNearFloorTime >= 5){
                return true;
            }
    }

    
    if(_missionIdx == 10){
        if(record_totalFlightTime >= 25){
            return true;
        }
    }
    
    if(_missionIdx == 11){
        if(!recordUse_isClickingBtnFromHeavyInvincible){
            if(characterVelocity >= 6.66666667){
                if(characterRotation > -10 && characterRotation < 10){
                    return true;
                }  
            }
        } 
    }
    
    if(_missionIdx == 12){
        if(playerBoost >= 2){
            return true;
        }
    }
    
    if(_missionIdx == 13){
        if(characterRealY >= 150){
            return true;
        }
    }
    
    if(_missionIdx == 14){
        if(record_hasHittedDragonBall[0]){
            return true;
        }
    }
    
    if(_missionIdx == 15){
        if(recordUse_diamondGotInOneRound >= 2){
            return true;
        }
    }
    
    if(_missionIdx == 16){
        if(record_flyNearFloorTime >= 7){
            return true;
        }
    }
    
    if(_missionIdx == 17){
        if(characterRealX >= 350){
            if(!recordUse_hasAppliedFuel){
                 return true;
            }
        }
    }
    
    if(_missionIdx == 18){
        if(characterRealX >= 1000){
            return true;
        }
    }

    if(_missionIdx == 19){
        if(recordUse_continuePerfectLaunchTIme >= 2){
            return true;
        }
    }
    
    if(_missionIdx == 20){
        if(record_flyStraightTime >= 15){
            return true;
        }
    }
    
    if(_missionIdx == 21){
        if(recordUse_howmanyDragonBallHitted >= 1){
            if(record_destroyUseTime <= 12){
                return true;
            }
        }
    }
    
    if(_missionIdx == 22){
        if(characterRealY >= 200){
            return true;
        }
    }
    
    if(_missionIdx == 23){
        if(recordUse_penguinHitInOneRound >= 1){
            return true;
        }
    }
    
    if(_missionIdx == 24){
        if(recordUse_penguinHitTotal >= 5){
            return true;
        }
    }
    
    if(_missionIdx == 25){
        if(record_totalFlightTime >= 45){
            return true;
        }
    }
    
    if(_missionIdx == 26){
        if(recordUse_diamondGotInOneRound >= 3){
            return true;
        }
    }
    
    if(_missionIdx == 27){
        if(!recordUse_isClickingBtnFromHeavyInvincible){
            if(characterVelocity >= 8.88888889){
                if(characterRotation > -10 && characterRotation < 10){
                    return true;
                }  
            }
        }
    }
    
    if(_missionIdx == 28){
        if(record_hasHittedDragonBall[1]){
            return true;
        }
    }
    
    if(_missionIdx == 29){
        if(characterRealY >= 350){
            return true;
        }
    }
    
    if(_missionIdx == 30){
        if(recordUse_diamondGotTotal >= 20){
            return true;
        }
    }
    
    if(_missionIdx == 31){
        if(recordUse_penguinHitInOneRound >= 2){
            return true;
        }
    }
    
    if(_missionIdx == 32){
        if(record_totalFlightTime >= 65){
            return true;
        }
    }
    
    if(_missionIdx == 33){
        if(characterRealX >= 2500){
            return true;
        }
    }
    
    if(_missionIdx == 34){
        if(record_flyNearFloorTime >= 5){
            return true;
        }
    }
    
    if(_missionIdx == 35){
        if(recordUse_penguinHitTotal >= 20){
            return true;
        }
    }
    
    if(_missionIdx == 36){
        if(recordUse_penguinHitInOneRound >= 4){
            return true;
        }
    }
    
    if(_missionIdx == 37){
        if(recordUse_GREENDiamondGotInOneRound >= 1){
            return true;
        }
    }
    
    if(_missionIdx == 38){
        if(recordUse_howmanyDragonBallHitted >= 2){
            return true;
        }
    }
    
    if(_missionIdx == 39){
        if(record_hasHittedDragonBall[0]){
            if(!recordUse_hasAppliedFuel){
                return true;
            }
        }
    }
    
    if(_missionIdx == 40){
        if(characterRealY >= 460){
            return true;
        }
    }
    
    if(_missionIdx == 41){
        if(!recordUse_isClickingBtnFromHeavyInvincible){
            if(characterVelocity >= 11.5555556){
                if(characterRotation > -10 && characterRotation < 10){
                    return true;
                }  
            }
        }

    }
    
    if(_missionIdx == 42){
        if(recordUse_penguinHitInOneRound >= 6){
            return true;
        }
    }
    
    if(_missionIdx == 43){
        if(record_hasHittedDragonBall[2]){
            return true;
        }
    }
    
    if(_missionIdx == 44){
        if(recordUse_moneyEarnedFromDiamondsInOneRound >= 20){
            return true;
        }
    }
    
    if(_missionIdx == 45){
        if(record_hasHittedDragonBall[1]){
            if(record_destroyUseTime <= 28){
                return true;
            }
        }
    }
    
    if(_missionIdx == 46){
        if(record_totalFlightTime >= 90){
            return true;
        }
    }
    
    if(_missionIdx == 47){
        if(record_flyNearFloorTime >= 3){
            return true;
        }
    }

    if(_missionIdx == 48){
        if(recordUse_continuePerfectLaunchTIme >= 3){
            return true;
        }
    }
    
    if(_missionIdx == 49){
        if(recordUse_penguinHitTotal >= 50){
            return true;
        }
    }
    
    if(_missionIdx == 50){
        if(recordUse_moneyGainedTotal >= 100){
            return true;
        }
    }
    
    if(_missionIdx == 51){
        if(characterRealX >= 4500){
            return true;
        }
    }
    
    if(_missionIdx == 52){
        if(recordUse_GREENDiamondGotInOneRound >= 3){
            return true;
        }
    }

    if(_missionIdx == 53){
        if(record_hasHittedDragonBall[3]){
            return true;
        }
    }
    
    if(_missionIdx == 54){
        if(recordUse_pantsOfFireTime >= 1){
            return true;
        }
    }
    
    if(_missionIdx == 55){
        if(recordUse_penguinHitInOneRound >= 8){
            return true;
        }
    }
    
    if(_missionIdx == 56){
        if(spin_pefect){
            if(playerCannon >= 4){
                 return true;
            }
        }
    }
    
    if(_missionIdx == 57){
        if(record_hasHittedDragonBall[0]){
            if(record_destroyUseTime <= 10){
                return true;
            }
        }
    }

    if(_missionIdx == 58){
        if(recordUse_moneyEarnedFromDiamondsInOneRound >= 40){
            return true;
        }
    }
    
    if(_missionIdx == 59){
        if(recordUse_pantsOfFireTime >= 1){
            if(recordUse_penguinHitInOneRound == 0){
                return true;
            }
        }
    }
    
    if(_missionIdx == 60){
        if(recordUse_penguinHitTotal >= 100){
            return true;
        }
    }
    
    if(_missionIdx == 61){
        if(characterRealX >= 900){
            if(!recordUse_hasAppliedFuel){
                return true;
            }
        }
    }
    
    if(_missionIdx == 62){
        if(characterRealY >= 800){
            return true;
        }
    }
    if(_missionIdx == 63){
        if(recordUse_howmanyDragonBallHitted >= 3){
            if(canDisplayDestroyUseTime <= 50){
                return true;
            }
        }
    }
    
    if(_missionIdx == 64){
        if(record_hasHittedDragonBall[4]){
            return true;
        }
    }
    
    if(_missionIdx == 65){
        if(recordUse_moneyEarnedFromDiamondsInOneRound >= 140){
            return true;
        }
    }

    if(_missionIdx == 66){
        if(recordUse_breakWhileInHeavy){
            return true;
        }
    }
    
    if(_missionIdx == 67){
        /*if(!recordUse_isClickingBtnFromHeavyInvincible){
            if(characterVelocity >= 5){
                return true;
            }
        } */
        if(!recordUse_isClickingBtnFromHeavyInvincible){
            if(characterVelocity >= 16.6666667){
                return true;
            }
        }
    }

    if(_missionIdx == 68){
        if(record_destroyUseTime <= 56){
            if(record_hasHittedDragonBall[3]){
                return true;
            }
        }
    }
    
    if(_missionIdx == 69){
        if(recordUse_diamondGotTotal >= 250){
            return true;
        }
    }
    
    if(_missionIdx == 70){
        if(characterRealX >= 6200){
            return true;
        }
    }
    
    if(_missionIdx == 71){
        if(recordUse_penguinHitInOneRound >= 15){
            return true;
        }
    }
    
    if(_missionIdx == 72){
        if(recordUse_pantsOfFireTime >= 2){
            return true;
        }
    }
    
    if(_missionIdx == 73){
        if(recordUse_howmanyDragonBallHitted >= 5){
            return true;
        }
    }
    
    if(_missionIdx == 74){
        if(characterRealY >= 1400){
            return true;
        }
    }
    
    if(_missionIdx == 75){
        if(record_flyNearFloorTime >= 6){
            return true;
        }
    }
    
    if(_missionIdx == 76){
        if(characterRealX >= 1100){
            if(!recordUse_hasAppliedFuel){
                return true;
            }
        }
    }
    
    if(_missionIdx == 77){
        if(recordUse_PURPLEDiamondGotInOneRound >= 6){
            return true;
        }
    }
    
    if(_missionIdx == 78){
        if(record_hasHittedDragonBall[5]){
            return true;
        }
    }
    
    if(_missionIdx == 79){
        if(recordUse_continuePerfectLaunchTIme >= 4){
            return true;
        }
    }
    
    if(_missionIdx == 80){
        if(recordUse_pantsOfFireTime >= 5){
            return true;
        }
    }

    if(_missionIdx == 81){
        if(recordUse_penguinHitInYellowBlaze >= 7){
            return true;
        }
    }
    
    if(_missionIdx == 82){
        if(recordUse_moneyEarnedFromDiamondsInOneRound >= 500){
            return true;
        }
    }
    
    if(_missionIdx == 83){
        if(recordUse_howmanyDragonBallHitted >= 4){
            if(record_destroyUseTime <= 42){
                return true;
            }  
        }
    }
    
    if(_missionIdx == 84){
        if(!recordUse_isClickingBtnFromHeavyInvincible){
            if(characterVelocity >= 19.95){
                if(characterRotation > -10 && characterRotation < 10){
                    return true;
                }  
            }
        }
    }
    
    if(_missionIdx == 85){
        if(characterRealY >= 1700){
            return true;
        }
    }

    if(_missionIdx == 86){
        if(record_destroyUseTime <= 58){
            if(record_hasHittedDragonBall[4]){
                return true;
            }
        }
    }

    if(_missionIdx == 87){
            if(record_hasHittedDragonBall[6]){
                return true;
            }
    }
    
    //check for max speed without heavy invincible
   /* if(_missionIdx == 0){
        if(!recordUse_isClickingBtnFromHeavyInvincible){
            if(recordUse_maxSpeed >= 12){
                return true;
            }
        }
    }*/
    
    
    /*if(_missionIdx == 3){
        if(record_hasHittedDragonBall){
            return true;
        }
    }*/


    
    if(_missionIdx < 0){
        return false;
    }
    
    return false;
}


@end
