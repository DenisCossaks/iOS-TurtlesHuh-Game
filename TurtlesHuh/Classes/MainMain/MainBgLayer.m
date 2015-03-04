//
//  MainBgLayer.m
//  TurtlesHuh
//
//  Created by  on 2012/6/17.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "MainBgLayer.h"
#import "MainGamePlayGlobal.h"
#import "GamePlayGlobal.h"
#import "Global.h"

@implementation MainBgLayer



-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
        [self initBg];
        [self initBehineHillLayer];
        [self initHillLayer];
        [self initFloorItemHillLayer];
        [self initFloor];
        [self initClouds];
        [self initItems];
        [self initFloorSnow];
        manageCloudTimer = 0;

       //// tempBg =  [CCSprite spriteWithFile:@"mini_04_bg.png"];
       // [tempBg setPosition:ccp(240,160)];
		//[self addChild:tempBg];
    }
	return self;
}

-(void) initFloorSnow{
    floorSnow = malloc(sizeof(eFloorSnow));
    floorSnow->howmany = 50;
    floorSnow->idx = 0;
    floorSnow->genIdx = 0;
    for(int i = 0 ; i < floorSnow->howmany ; i++){
        floorSnow->s_snow[i] = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(2018/textureRatioForFuckingIpad,1374/textureRatioForFuckingIpad,30/textureRatioForFuckingIpad,30/textureRatioForFuckingIpad)];
        [floorSnow->s_snow[i] setPosition:ccp(10000,100000)];
        floorSnow->isAni[i] = false;
        
        [ss_Character addChild:floorSnow->s_snow[i] z:kDeapth_Turtle_Bombing];
    }
}

-(void) initBehineHillLayer{
   // behindHillLayer_s_hill01[0] = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(0/textureRatioForFuckingIpad,1580/textureRatioForFuckingIpad,1396/textureRatioForFuckingIpad,468/textureRatioForFuckingIpad)];
   // behindHillLayer_s_hill01[1] = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(0/textureRatioForFuckingIpad,1580/textureRatioForFuckingIpad,1396/textureRatioForFuckingIpad,468/textureRatioForFuckingIpad)];
    behindHillLayer_s_hill01[0] = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(0/textureRatioForFuckingIpad,1580/textureRatioForFuckingIpad,712/textureRatioForFuckingIpad,468/textureRatioForFuckingIpad)];
    behindHillLayer_s_hill01[1] = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(0/textureRatioForFuckingIpad,1580/textureRatioForFuckingIpad,712/textureRatioForFuckingIpad,468/textureRatioForFuckingIpad)];
    behindHillLayer_s_hill01[2] = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(0/textureRatioForFuckingIpad,1580/textureRatioForFuckingIpad,712/textureRatioForFuckingIpad,468/textureRatioForFuckingIpad)];
    behindHillLayer_s_hill01[3] = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(0/textureRatioForFuckingIpad,1580/textureRatioForFuckingIpad,712/textureRatioForFuckingIpad,468/textureRatioForFuckingIpad)];
    
    [ss_Character addChild:behindHillLayer_s_hill01[0]];
    [ss_Character addChild:behindHillLayer_s_hill01[1]];
    [ss_Character addChild:behindHillLayer_s_hill01[2]];
    [ss_Character addChild:behindHillLayer_s_hill01[3]];

    [behindHillLayer_s_hill01[0] setAnchorPoint:ccp(0,0)];
    [behindHillLayer_s_hill01[1] setAnchorPoint:ccp(0,0)];
    [behindHillLayer_s_hill01[2] setAnchorPoint:ccp(0,0)];
    [behindHillLayer_s_hill01[3] setAnchorPoint:ccp(0,0)];

    
    behindHillLayer_CurrentIdx = 0;
    behindHillLayer_NextIdx = 1;
    
    behindHillLayer_Offset = 681;
    behindHillLayer_Ratio = 0.15;  
    //behindHillLayer_RatioY = 0.05;
    behindHillLayer_RatioY = 0.1;
    //behindHillLayer_ScreenY = 800;
    behindHillLayer_Y = 0;
    
    static int hillInitHiehgt;
    hillInitHiehgt = characterY - startToDeclineY;
    behindHillLayer_s_hill01[0].position = ccp(behindHillLayer_s_hill01[0].position.x, behindHillLayer_Y - hillInitHiehgt * behindHillLayer_RatioY);
    behindHillLayer_s_hill01[1].position = ccp(behindHillLayer_s_hill01[1].position.x, behindHillLayer_Y - hillInitHiehgt * behindHillLayer_RatioY);

}

-(void) initFloorItemHillLayer{
    floorItemLayer_s_snowman[0] = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1756/textureRatioForFuckingIpad,1722/textureRatioForFuckingIpad,54/textureRatioForFuckingIpad,68/textureRatioForFuckingIpad)];
    floorItemLayer_s_igno[0] = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(786/textureRatioForFuckingIpad,582/textureRatioForFuckingIpad,130/textureRatioForFuckingIpad,74/textureRatioForFuckingIpad)];

    floorItemLayer_s_snowman[1] = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1756/textureRatioForFuckingIpad,1722/textureRatioForFuckingIpad,54/textureRatioForFuckingIpad,68/textureRatioForFuckingIpad)];
    floorItemLayer_s_igno[1] = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(786/textureRatioForFuckingIpad,582/textureRatioForFuckingIpad,130/textureRatioForFuckingIpad,74/textureRatioForFuckingIpad)];
    
    [ss_Character addChild:floorItemLayer_s_snowman[0]];
    [ss_Character addChild:floorItemLayer_s_igno[0]];

    [ss_Character addChild:floorItemLayer_s_snowman[1]];
    [ss_Character addChild:floorItemLayer_s_igno[1]];

    
    [floorItemLayer_s_snowman[0] setAnchorPoint:ccp(0,0)];
    [floorItemLayer_s_igno[0] setAnchorPoint:ccp(0,0)];
   
    [floorItemLayer_s_snowman[1] setAnchorPoint:ccp(0,0)];
    [floorItemLayer_s_igno[1] setAnchorPoint:ccp(0,0)];
   
    
    floorItemLayer_CurrentIdx = 0;
    floorItemLayer_NextIdx = 1;
    
    floorItemLayer_Offset = 600 * 2/textureRatioForFuckingIpad;
    floorItemLayer_Ratio = 0.8;  
    floorItemLayer_RatioY = 1.0;
    floorItemLayer_Y = 36-5;  //36
    
    
    if(isIpad){
        floorItemLayer_Y *= 2;
    }
    
    static int hillInitHiehgt;
    hillInitHiehgt = characterY - startToDeclineY;
    floorItemLayer_s_snowman[0].position = ccp(245, floorItemLayer_Y - hillInitHiehgt * floorItemLayer_RatioY);
    floorItemLayer_s_snowman[1].position = ccp(245, floorItemLayer_Y - hillInitHiehgt * floorItemLayer_RatioY);
}

-(void) initHillLayer{
    hillLayer_s_hill01[0] = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1414/textureRatioForFuckingIpad,1550/textureRatioForFuckingIpad,342/textureRatioForFuckingIpad,238/textureRatioForFuckingIpad)];
    hillLayer_s_hill02[0] = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1414/textureRatioForFuckingIpad,1792/textureRatioForFuckingIpad,412/textureRatioForFuckingIpad,256/textureRatioForFuckingIpad)];
       
    hillLayer_s_hill01[1] = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1414/textureRatioForFuckingIpad,1550/textureRatioForFuckingIpad,342/textureRatioForFuckingIpad,238/textureRatioForFuckingIpad)];
    hillLayer_s_hill02[1] = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1414/textureRatioForFuckingIpad,1792/textureRatioForFuckingIpad,412/textureRatioForFuckingIpad,256/textureRatioForFuckingIpad)];
   
    [ss_Character addChild:hillLayer_s_hill01[0]];
    [ss_Character addChild:hillLayer_s_hill02[0]];
    
    [ss_Character addChild:hillLayer_s_hill01[1]];
    [ss_Character addChild:hillLayer_s_hill02[1]];
   
    [hillLayer_s_hill01[0] setAnchorPoint:ccp(0,0)];
    [hillLayer_s_hill02[0] setAnchorPoint:ccp(0,0)];
    
    [hillLayer_s_hill01[1] setAnchorPoint:ccp(0,0)];
    [hillLayer_s_hill02[1] setAnchorPoint:ccp(0,0)];
    
    hillLayer_CurrentIdx = 0;
    hillLayer_NextIdx = 1;
    
    hillLayer_Offset = 600 * 2/textureRatioForFuckingIpad;
    hillLayer_Ratio = 0.3;  
   // hillLayer_RatioY = 0.15;
    hillLayer_RatioY = 0.3;
    
    if(playerBoost >= 2){
        hillLayer_RatioY = 0.15;
    }
    
    hillLayer_Y = 10 * 2/textureRatioForFuckingIpad;  //36

   
    static int hillInitHiehgt;
    hillInitHiehgt = characterY - startToDeclineY;
    hillLayer_s_hill01[0].position = ccp(hillLayer_s_hill01[0].position.x, hillLayer_Y - hillInitHiehgt * hillLayer_RatioY);
    hillLayer_s_hill01[1].position = ccp(hillLayer_s_hill01[1].position.x, hillLayer_Y - hillInitHiehgt * hillLayer_RatioY);
}

-(void) initFloor{
    
    if(isIpad){
        s_floor[0] = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(934/textureRatioForFuckingIpad,582/textureRatioForFuckingIpad,1043/textureRatioForFuckingIpad,86/textureRatioForFuckingIpad)];
        s_floor[1] = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(934/textureRatioForFuckingIpad,582/textureRatioForFuckingIpad,1043/textureRatioForFuckingIpad,86/textureRatioForFuckingIpad)];
    }else{
        s_floor[0] = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(934/textureRatioForFuckingIpad,582/textureRatioForFuckingIpad,1020/textureRatioForFuckingIpad,86/textureRatioForFuckingIpad)];
        s_floor[1] = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(934/textureRatioForFuckingIpad,582/textureRatioForFuckingIpad,1020/textureRatioForFuckingIpad,86/textureRatioForFuckingIpad)];
    }
    
    
    [ss_Character addChild:s_floor[0] z:kDeapth_Turtle_Bombing];
    [ss_Character addChild:s_floor[1] z:kDeapth_Turtle_Bombing];
    
    // [s_floor[0] setScaleY:-1];
    // [s_floor[1] setScaleY:-1];
    
    floor_CurrentIdx = 0;
    floor_NextIdx = 1;
    [s_floor[0] setAnchorPoint:ccp(0,0.5)];
    [s_floor[1] setAnchorPoint:ccp(0,0.5)];
    
    
    floor_Offset = 1000/2;
    if(isIpad){
        floor_Offset = 1040;
    }
    
    floor_Ratio = 1.0;  
    floor_RatioY = 1.0;
    floor_Y = 20-5;
    
    if(isIpad){
        floor_Y *= 768.0/320.0;
    }

}

-(void) initBg{
    s_staticBg = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(2026/textureRatioForFuckingIpad,1408/textureRatioForFuckingIpad,22/textureRatioForFuckingIpad,640/textureRatioForFuckingIpad)];
    [s_staticBg setScaleX:60];
    [s_staticBg setPosition:ccp([UIScreen mainScreen].bounds.size.height/2, [UIScreen mainScreen].bounds.size.width/2)];
    [ss_Character addChild:s_staticBg];
    
    
    staticBg2_Opacity = 0;
    s_staticBg2 = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1996/textureRatioForFuckingIpad,1408/textureRatioForFuckingIpad,24/textureRatioForFuckingIpad,640/textureRatioForFuckingIpad)];
    [s_staticBg2 setScaleX:60];
    [s_staticBg2 setPosition:ccp([UIScreen mainScreen].bounds.size.height/2, [UIScreen mainScreen].bounds.size.width/2)];
    [ss_Character addChild:s_staticBg2];
    
    if(isIpad){
        [s_staticBg setScaleY:1.3];
        [s_staticBg2 setScaleY:1.3];
    }
}

-(void) initItems{
    maxItem = 50;
    maxItemOnScreen = 20;
    itemOnScreen = 0;
    itemIdx = 0;
    for (int i = 0; i < maxItem ; i++){
        item_X[i] = -999999;
        item_Y[i] = -99999;
        itemisAni[i] = false;
        
        s_item[i] = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad)];
        [ss_Character addChild:s_item[i]];
        [s_item[i] setPosition:ccp(10000,10000)];
        [s_item[i] setScale:0.75];
        
        itemType[i] = kItemType_money10;
    }

}

-(void) initClouds{
    maxCloud = 50;
    maxCloudsOnScreen = 20;
    cloudsOnScreen = 0;
    cloudIdx = 0;
    for (int i = 0; i < maxCloud ; i++){
        cloud_X[i] = -999999;
        cloud_Y[i] = -99999;
        cloud_isAni[i] = false;
        
        s_cloud[i] = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad)];
        [ss_Character addChild:s_cloud[i]];
        [s_cloud[i] setPosition:ccp(10000,10000)];
    }
}

-(void) manageClouds{
    
    for (int i = 0; i < maxCloud ; i++){
        if(cloud_isAni[i]){
           /* static float cloudSetX;
            static float cloudSetY;
            
            cloudSetX = cloud_X[i] - characterX + screenX;
            cloudSetY = cloud_Y[i] - characterY + screenY;
            
            [s_cloud[i] setPosition:ccp(cloudSetX, cloudSetY)];*/
            [s_cloud[i] setPosition:ccp(s_cloud[i].position.x -characterVX*0.7, s_cloud[i].position.y -characterVY*0.7)];
        }
    }
    
    manageCloudTimer++;
    if(manageCloudTimer % 10 != 0){
        return;
    }
    
   // characterIsFacingDirection = atan2(characterVY, characterVX);
    
    [self newMethodToDetectGenCloud];
    
    for (int i = 0; i < maxCloud ; i++){
        if(cloud_isAni[i]){
            
            if(isIpad){
                if(s_cloud[i].position.y < -1700 || s_cloud[i].position.y > 1700
                   || s_cloud[i].position.x < -1700 || s_cloud[i].position.x > 1700){
                    cloudsOnScreen--;
                    cloud_isAni[i] = false;
                }
            }else{
                if(s_cloud[i].position.y < -1200 || s_cloud[i].position.y > 1200
                   || s_cloud[i].position.x < -1200 || s_cloud[i].position.x > 1200){
                    cloudsOnScreen--;
                    cloud_isAni[i] = false;
                }
            }
    
        }
    }
}

-(void) newMethodToDetectGenCloud{

    //static float vSquare;
   // vSquare = characterVY * characterVY + characterVX * characterVX;
    /*if(characterVelocity < 4){
        return;
    }*/
    
    static float genCenterX;
    static float genCenterY;
    static int genRadius = 800;
    
    static int ranCloudX;
    static int ranCloudY;
    static int ranGenAngle;
    static int ranGenDistance;
    static int numInArea;
    
    if(isIpad){
        genCenterX =  characterX + 1150 * cos(characterIsFacingDirection);
        genCenterY =  characterY + 900 * sin(characterIsFacingDirection);
    }else{
        genCenterX =  characterX + 540 * cos(characterIsFacingDirection);
        genCenterY =  characterY + 540 * sin(characterIsFacingDirection);
    }
    
    numInArea = 0;
    for(int i = 0 ; i < maxCloud ; i++){
        if(cloud_isAni[i]){
            static float cloudGenCenterDiffX;
            static float cloudGenCenterDiffY;
            static float cloudGenCenterDiffDistance;
            cloudGenCenterDiffX = cloud_X[i] - genCenterX;
            cloudGenCenterDiffY = cloud_Y[i] - genCenterY;
            cloudGenCenterDiffDistance = cloudGenCenterDiffX*cloudGenCenterDiffX + cloudGenCenterDiffY*cloudGenCenterDiffY;
            
            if(cloudGenCenterDiffDistance < genRadius*genRadius){
                numInArea++;
            }
        }
    }
    
    static float cloudCloudInterval;
    static bool isAllowGenCloud;
    cloudCloudInterval = 300;
    
    while (numInArea < 4) {
        isAllowGenCloud = true;
        ranGenAngle = arc4random() % 360;
        ranGenDistance = arc4random() % genRadius;
        
        ranCloudX = genCenterX + (float)ranGenDistance * cos((float)ranGenAngle * M_PI/180);
        ranCloudY = genCenterY + (float)ranGenDistance * sin((float)ranGenAngle * M_PI/180);
        
        if(cloud_isAni[cloudIdx]){
            printf("WTTTTTTTTF\n");
            cloudIdx++;
            if(cloudIdx >= maxCloud){
                cloudIdx = 0;
            }
            isAllowGenCloud = false;
            break;
        }
        
        //NEW
        static float screenCheckDiffX;
        static float screenCheckDiffY;
        screenCheckDiffX = ranCloudX - characterX;
        screenCheckDiffY = ranCloudY - characterY;
        if(screenCheckDiffX > -320*2/textureRatioForFuckingIpad && screenCheckDiffX < 320*2/textureRatioForFuckingIpad){
            if(screenCheckDiffY > -230*2/textureRatioForFuckingIpad && screenCheckDiffY < 230*2/textureRatioForFuckingIpad){
                isAllowGenCloud = false;
                break;
            }
        }
        
        for(int j = 0 ; j < maxCloud ; j++){
            if(j != cloudIdx){
                if(cloud_isAni[j]){
                    static float fuck2DiffX;
                    static float fuck2DiffY;
                    static float fuck2DiffDistance;
                    
                    fuck2DiffX = cloud_X[j] - ranCloudX;
                    fuck2DiffY = cloud_Y[j] - ranCloudY;  
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
        if(cloudCloudInterval <= 180){
          //  printf("BREAK\n");
            break;
        }
       // printf("B\n");
        
        
        
        if(isAllowGenCloud){
            
            if(ranCloudY > 2000){
                cloud_isAni[cloudIdx] = true;
                cloud_X[cloudIdx] =   (float)ranCloudX;
                cloud_Y[cloudIdx] =   (float)ranCloudY;
                
                static int genCloudType;
                genCloudType = arc4random() % 4;
                if(genCloudType == 0){
                    [s_cloud[cloudIdx] setTextureRect:CGRectMake(726/textureRatioForFuckingIpad, 1794/textureRatioForFuckingIpad, 380/textureRatioForFuckingIpad, 254/textureRatioForFuckingIpad)];
                }
                if(genCloudType == 1){
                    [s_cloud[cloudIdx] setTextureRect:CGRectMake(726/textureRatioForFuckingIpad, 1570/textureRatioForFuckingIpad, 380/textureRatioForFuckingIpad, 215/textureRatioForFuckingIpad)];
                }
                if(genCloudType == 2){
                    [s_cloud[cloudIdx] setTextureRect:CGRectMake(1114/textureRatioForFuckingIpad, 1878/textureRatioForFuckingIpad, 290/textureRatioForFuckingIpad, 168/textureRatioForFuckingIpad)];
                }
                if(genCloudType == 3){
                    [s_cloud[cloudIdx] setTextureRect:CGRectMake(1612/textureRatioForFuckingIpad, 1258/textureRatioForFuckingIpad, 374/textureRatioForFuckingIpad, 264/textureRatioForFuckingIpad)];
                }
                [s_cloud[cloudIdx] setScale:0.9];
                //[s_cloud[cloudIdx] setOpacity:200];
                
                // printf("gen:%i |%4.8f %4.8f  SCREEN:%4.8f %4.8f\n",cloudIdx ,cloud_X[cloudIdx],cloud_Y[cloudIdx],cloud_X[cloudIdx] - characterX + screenX, cloud_Y[cloudIdx] - characterY + screenY);
                
                //printf("center:%4.8f %4.8f %4.8f gen2: %4.8f %i %4.8f %i\n",genCenterX,genCenterY,characterIsFacingDirection * 180/M_PI,characterX ,ranCloudX, characterY, ranCloudY);
                
                static float cloudSetX;
                static float cloudSetY;
                
                cloudSetX = cloud_X[cloudIdx] - characterX + screenX;
                cloudSetY = cloud_Y[cloudIdx] - characterY + screenY;
                
                [s_cloud[cloudIdx] setPosition:ccp(cloudSetX, cloudSetY)];
                
                cloudIdx++;
                if(cloudIdx >= maxCloud){
                    cloudIdx = 0;
                }
                
                numInArea++;
                cloudCloudInterval = 100;
                
            }
            
        }
       
    }
}

-(void) genOneCloud{
    
    cloud_isAni[cloudIdx] = true;
    
    static int ranCloudX;
    static int ranCloudY;
    static float ranCloudStartGenY;
    
    ranCloudX = arc4random() % 1500;
    ranCloudY = arc4random() % 1600;
    
  //  printf("characterY:%4.8f\n",characterY);
    
    if(characterY < 800){
        ranCloudStartGenY = 50;
    }else{
        ranCloudStartGenY =  -800;
    }
    
    ranCloudX += 480;
    if(characterVX < 0){
        ranCloudX *= -1;
    }
    ranCloudY += ranCloudStartGenY;
    
    cloud_X[cloudIdx] = characterX + ranCloudX;
    cloud_Y[cloudIdx] = characterY + ranCloudY;
    
    cloudIdx++;
    if(cloudIdx >= maxCloud){
        cloudIdx = 0;
    }
}

-(void) manageItems{
    
    for (int i = 0; i < maxItem ; i++){
        if(itemisAni[i]){
            static float cloudSetX;
            static float cloudSetY;
            
            cloudSetX = item_X[i] - characterX + screenX;
            cloudSetY = item_Y[i] - characterY + screenY;
            
            if(characterIsMagnet){
                static float yDiff2;
                static float xDiff2;
                static float angleDiff2;
                static float xyDiff2;
                static float xyRatio2;
                
                static float superFuxkAngleDiff;
                
                static float superFuxkOriX;
                static float superFuxkOriY;
                static float detectPointX;
                static float detectPointY;
                
                superFuxkOriX =  characterDetectX[0];
                superFuxkOriY =  characterDetectY[0];
                detectPointX =  characterX + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
                detectPointY =  characterY + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
                
                yDiff2 = item_Y[i] - detectPointY;
                xDiff2 = item_X[i] - detectPointX;
                
                angleDiff2 = atan2(yDiff2, xDiff2);
                
                xyDiff2 = sqrt(xDiff2*xDiff2 + yDiff2*yDiff2);
                
                if(xyDiff2 < 350){
                    //2.0 medium
                    //4.0 strong
                    xyRatio2 = characterMagnetPower * (350*2/textureRatioForFuckingIpad-xyDiff2)/xyDiff2;
                    //printf("xyRatio2:%4.8f\n",xyRatio2);
                    
                    if(xyRatio2 > 3.3){
                        xyRatio2 = 3.3;
                    }
                    item_X[i] -= xyRatio2 * cos(angleDiff2);
                    item_Y[i] -= xyRatio2 * sin(angleDiff2);
                }
            }
            
            
            [s_item[i] setPosition:ccp(cloudSetX, cloudSetY)];
        }
    }
    
    manageItemTimer++;
    if(manageItemTimer % 10 != 0){
        return;
    }
    
    //characterIsFacingDirection = atan2(characterVY, characterVX);
    
    [self newMethodToDetectGenItems];
    
    for (int i = 0; i < maxItem ; i++){
        if(itemisAni[i]){
            
            [self detectThisItemCollision:i];
            
            
            cloudIsFacingDirectionAccordingToCharterVelocity = atan2(item_Y[i] - characterY, item_X[i] - characterX);
            static float fuckfuckDiff;
            fuckfuckDiff = cloudIsFacingDirectionAccordingToCharterVelocity - characterIsFacingDirection;
            if(fuckfuckDiff > M_PI/2 || fuckfuckDiff < -M_PI/2){
                static float fuckfuckDiffX;
                static float fuckfuckDiffY;
                static float fuckfuckDiffDistance;
                
                fuckfuckDiffX = characterX - item_X[i];
                fuckfuckDiffY = characterY - item_Y[i];
                
                fuckfuckDiffDistance = fuckfuckDiffX*fuckfuckDiffX + fuckfuckDiffY*fuckfuckDiffY;
                if(fuckfuckDiffDistance > 250000 * 2/textureRatioForFuckingIpad){
                    itemOnScreen--;
                    itemisAni[i] = false;
                    //printf("-------------------:%i\n",i);
                }
            }
            
        }
    }
}

-(void) detectThisItemCollision:(int)_itemIdx{
   // printf("detectThisItemCollision\n");
    if(s_item[_itemIdx].position.x < 0 || s_item[_itemIdx].position.x > [UIScreen mainScreen].bounds.size.height){
        return;
    }
    if(s_item[_itemIdx].position.y < 0 || s_item[_itemIdx].position.y > [UIScreen mainScreen].bounds.size.width){
        return;
    }
   // printf("detesssctdfdsfThisItemCollision:%i\n",_itemIdx);
    static float superFuxkOriX;
    static float superFuxkOriY;
    static float superFuxkAngleDiff;
    static float fuxkDistanceDiffX;
    static float fuxkDistanceDiffY;
    static float fuxkDistanceDiff;
    static float detectPointX;
    static float detectPointY;
    
    superFuxkAngleDiff = -characterRotation * M_PI/180;
    
    static int hasDetectTime;
    hasDetectTime = 0;
    do{
        superFuxkOriX =  characterDetectX[hasDetectTime];
        superFuxkOriY =  characterDetectY[hasDetectTime];
        detectPointX =  characterX + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
        detectPointY =  characterY + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
        
        
        fuxkDistanceDiffX = detectPointX - item_X[_itemIdx];
        fuxkDistanceDiffY = detectPointY - item_Y[_itemIdx];
        fuxkDistanceDiff = fuxkDistanceDiffX*fuxkDistanceDiffX + fuxkDistanceDiffY*fuxkDistanceDiffY;
        
        //printf("fuxkDistanceDiff:%4.8f %4.8f %4.8f %4.8f %4.8f\n",fuxkDistanceDiff, detectPointX, item_X[_itemIdx],detectPointY,item_Y[_itemIdx]);
        
        if(fuxkDistanceDiff < 1600 * 2/textureRatioForFuckingIpad){
            // printf("TTTTTTTTTTBBBBBBBBBB\n\n");
            [self getThisItem:_itemIdx];
            return;
        }
        
        hasDetectTime++;
    }while(hasDetectTime < characterDetectNumber);
    
}

-(void) getThisItem:(int)_itemIdx{
 
    itemisAni[_itemIdx] = false;
    item_X[_itemIdx] = 9999;
    [s_item[_itemIdx] setPosition:ccp(10000,10000)];
    
    if(itemType[_itemIdx] == kItemType_money10){
        record_coinsCollected += 1;
        recordUse_moneyGainedTotal += 1 * moneyExchangeRatio;
    }
    if(itemType[_itemIdx] == kItemType_money20){
        record_coinsCollected += 2;
        recordUse_GREENDiamondGotInOneRound += 1;
        recordUse_moneyGainedTotal += 2 * moneyExchangeRatio;
    }
    if(itemType[_itemIdx] == kItemType_money30){
        record_coinsCollected += 4;
        recordUse_PURPLEDiamondGotInOneRound += 1;
        recordUse_moneyGainedTotal += 4 * moneyExchangeRatio;
    }
    if(itemType[_itemIdx] == kItemType_money40){
        record_coinsCollected += 8;
        recordUse_moneyGainedTotal += 8 * moneyExchangeRatio;
    }
    
    recordUse_diamondGotInOneRound += 1;
    recordUse_diamondGotTotal += 1;
    recordUse_moneyEarnedFromDiamondsInOneRound = record_coinsCollected * moneyExchangeRatio;
    if(pemanent_moneyRatio){
        recordUse_moneyEarnedFromDiamondsInOneRound *= 2;
    }
    
    [musicController playThisSound:kSound_Diamond isLoop:NO gain:1.0];
}

-(void) newMethodToDetectGenItems{
   // static float vSquare;
   // vSquare = characterVY * characterVY + characterVX * characterVX;
   // printf("newMethd to detect gem items:%4.8f\n",characterVelocity);
    /*if(characterVelocity < 4){
        return;
    }*/
    
    static float genCenterX;
    static float genCenterY;
    static int genRadius;
    genRadius = moneyGenRadius;
    
    static int ranCloudX;
    static int ranCloudY;
    static int ranGenAngle;
    static int ranGenDistance;
    static int numInArea;
    
    if(isIpad){
        genCenterX =  characterX + 1150 * cos(characterIsFacingDirection);
        genCenterY =  characterY + 900 * sin(characterIsFacingDirection);
    }else{
        genCenterX =  characterX + 540 * cos(characterIsFacingDirection);
        genCenterY =  characterY + 540 * sin(characterIsFacingDirection);
    }
    
    
    
    numInArea = 0;
    for(int i = 0 ; i < maxItem ; i++){
        if(itemisAni[i]){
            static float cloudGenCenterDiffX;
            static float cloudGenCenterDiffY;
            static float cloudGenCenterDiffDistance;
            cloudGenCenterDiffX = item_X[i] - genCenterX;
            cloudGenCenterDiffY = item_Y[i] - genCenterY;
            cloudGenCenterDiffDistance = cloudGenCenterDiffX*cloudGenCenterDiffX + cloudGenCenterDiffY*cloudGenCenterDiffY;
            
            if(cloudGenCenterDiffDistance < genRadius*genRadius){
                numInArea++;
            }
        }
    }
    
    static float cloudCloudInterval;
    static bool isAllowGenCloud;
    cloudCloudInterval = 250;
    
    while (numInArea < moneyNumArea) {
        isAllowGenCloud = true;
        ranGenAngle = arc4random() % 360;
        ranGenDistance = arc4random() % genRadius;
        
        ranCloudX = genCenterX + (float)ranGenDistance * cos((float)ranGenAngle * M_PI/180);
        ranCloudY = genCenterY + (float)ranGenDistance * sin((float)ranGenAngle * M_PI/180);
        
        if(itemisAni[itemIdx]){
           // printf("WTTTTTTTTF222\n");
            itemIdx++;
            if(itemIdx >= maxItem){
                itemIdx = 0;
            }
            isAllowGenCloud = false;
            break;
        }
        
        if(ranCloudY < 80){
            isAllowGenCloud = false;
            break;
        }
        
        //NEW
        static float screenCheckDiffX;
        static float screenCheckDiffY;
        screenCheckDiffX = ranCloudX - characterX;
        screenCheckDiffY = ranCloudY - characterY;
        if(screenCheckDiffX > -280*2/textureRatioForFuckingIpad && screenCheckDiffX < 280*2/textureRatioForFuckingIpad){
            if(screenCheckDiffY > -200*2/textureRatioForFuckingIpad && screenCheckDiffY < 200*2/textureRatioForFuckingIpad){
                isAllowGenCloud = false;
                break;
            }
        }
        
        
        for(int j = 0 ; j < maxItem ; j++){
            if(j != itemIdx){
                if(itemisAni[j]){
                    static float fuck2DiffX;
                    static float fuck2DiffY;
                    static float fuck2DiffDistance;
                    
                    fuck2DiffX = item_X[j] - ranCloudX;
                    fuck2DiffY = item_Y[j] - ranCloudY;  
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
            itemisAni[itemIdx] = true;
            item_X[itemIdx] =   (float)ranCloudX;
            item_Y[itemIdx] =   (float)ranCloudY;
            
            // printf("gen:%i |%4.8f %4.8f  SCREEN:%4.8f %4.8f\n",cloudIdx ,cloud_X[cloudIdx],cloud_Y[cloudIdx],cloud_X[cloudIdx] - characterX + screenX, cloud_Y[cloudIdx] - characterY + screenY);
            
          //  printf("center:%4.8f %4.8f %4.8f gen2: %4.8f %i %4.8f %i\n",genCenterX,genCenterY,characterIsFacingDirection * 180/M_PI,characterX ,ranCloudX, characterY, ranCloudY);
            
            
            
            if(characterX < 10000){
                itemAppearRatio[0] = 100;
                itemAppearRatio[1] = 100;
                itemAppearRatio[2] = 100;
                itemAppearRatio[3] = 100;
            }else if(characterX < 25000){
                itemAppearRatio[0] = 85;
                itemAppearRatio[1] = 100;
                itemAppearRatio[2] = 100;
                itemAppearRatio[3] = 100;
            }else if(characterX < 40000){
                itemAppearRatio[0] = 70;
                itemAppearRatio[1] = 85;
                itemAppearRatio[2] = 100;
                itemAppearRatio[3] = 100;
            }else if(characterX < 60000){
                itemAppearRatio[0] = 60;
                itemAppearRatio[1] = 80;
                itemAppearRatio[2] = 95;
                itemAppearRatio[3] = 100;
            }else{
                itemAppearRatio[0] = 50;
                itemAppearRatio[1] = 75;
                itemAppearRatio[2] = 60;
                itemAppearRatio[3] = 100;

            }
            
            
            static int genItemRatio;
            genItemRatio = arc4random()%100;
            if(genItemRatio < itemAppearRatio[0]){
                itemType[itemIdx] = kItemType_money10;
            }else if(genItemRatio < itemAppearRatio[1]){
                itemType[itemIdx] = kItemType_money20;
            }else if(genItemRatio < itemAppearRatio[2]){
                itemType[itemIdx] = kItemType_money30;
            }else{
                itemType[itemIdx] = kItemType_money40;
            }
            
            if(itemType[itemIdx] == kItemType_money10){
                [s_item[itemIdx] setTextureRect:CGRectMake(1760/textureRatioForFuckingIpad, 1118/textureRatioForFuckingIpad, 100/textureRatioForFuckingIpad, 76/textureRatioForFuckingIpad)]; 
            }
            if(itemType[itemIdx] == kItemType_money20){
                [s_item[itemIdx] setTextureRect:CGRectMake(1186/textureRatioForFuckingIpad, 1536/textureRatioForFuckingIpad, 100/textureRatioForFuckingIpad, 76/textureRatioForFuckingIpad)]; 
            }
            if(itemType[itemIdx] == kItemType_money30){
                [s_item[itemIdx] setTextureRect:CGRectMake(1688/textureRatioForFuckingIpad, 950/textureRatioForFuckingIpad, 100/textureRatioForFuckingIpad, 76/textureRatioForFuckingIpad)]; 
            }
            if(itemType[itemIdx] == kItemType_money40){
                [s_item[itemIdx] setTextureRect:CGRectMake(1688/textureRatioForFuckingIpad, 1034/textureRatioForFuckingIpad, 100/textureRatioForFuckingIpad, 76/textureRatioForFuckingIpad)]; 
            }
            
            itemIdx++;
            if(itemIdx >= maxItem){
                itemIdx = 0;
            }
            
            numInArea++;
            cloudCloudInterval = 100;
        }
        
    }
}

-(void) manage{

   // [tempBg setPosition:ccp(tempBg.position.x - characterVX * 0.1, tempBg.position.x - characterVY * 0.1)];
    [self manageStaticBg];
    [self manageClouds];
    [self manageItems];
    [self manageFloor];
    [self manageHill];
    [self manageBehineHill];
    [self manageFloorItem];
    [self maangeFloorSnow];
    
}

-(void) genFloorSnow{
    floorSnow->genIdx++;
    
    static int floorSnowGenRatio;
    static float floorSnowGenX;
    static float floorSnowGenY;
    static float floorSnowGenVX;
    static float floorSnowGenVY;
    static float floorSnowGenMinVX;
    static float floorSnowGenMinVY;
    static int genTime;
    
    genTime = 2;
    if(characterVelocity > 6){
        floorSnowGenRatio = 2;
        genTime = 5;
    }else if(characterVelocity > 5){
        floorSnowGenRatio = 3;
        genTime = 4;
    }else if(characterVelocity > 4){
        floorSnowGenRatio = 4;
        genTime = 4;
    }else if(characterVelocity > 3){
        floorSnowGenRatio = 5;
        genTime = 3;
    }else if(characterVelocity > 2){
        floorSnowGenRatio = 7;
        genTime = 2;
    }else if(characterVelocity > 1){
        floorSnowGenRatio = 10;
        genTime = 2;
    }else{
        floorSnowGenRatio = 9999999;
        genTime = 2;
    }
    
    floorSnowGenVX = -3.0;
    floorSnowGenMinVX = 0.5;
    
    //floorSnowGenX = 50;
    floorSnowGenY = -7;
    
    static int genVelocity;
    genVelocity = arc4random()% 100;
    floorSnowGenX = 30.0 * (float)genVelocity/100.0 + 30.0;
    
    
    if(characterVelocity > 7){
        floorSnowGenRatio = 3;
        floorSnowGenVY = 8.0;
        floorSnowGenMinVY = 4.0;
    }else if(characterVelocity > 5.5){
        floorSnowGenRatio = 5;
        floorSnowGenVY = 7.0;
        floorSnowGenMinVY = 3.5;
    }else if(characterVelocity > 4){
        floorSnowGenRatio = 7;
        floorSnowGenVY = 5.0;
        floorSnowGenMinVY = 2.5;
    }else if(characterVelocity > 2.5){
        floorSnowGenRatio = 10;
        floorSnowGenVY = 4.0;
        floorSnowGenMinVY = 2.0;
    }else if(characterVelocity > 1){
        floorSnowGenRatio = 50;
        floorSnowGenVY = 3.0;
        floorSnowGenMinVY = 1.5;
    }else{
        floorSnowGenRatio = 999999;
        floorSnowGenVY = 2.0;
        floorSnowGenMinVY = 1.0;
    }
    
    if((characterRotation > 70 && characterRotation < 110) || (characterRotation < -250 && characterRotation > -290)
       || (characterRotation > 250 && characterRotation < 290) || (characterRotation < -70 && characterRotation > -110)){
        genTime = 10;
        
        if(characterLastVY < -1){
            floorSnowGenVX = -4.0;
            floorSnowGenMinVX = 2.0;
            floorSnowGenX = 10.0 * (float)genVelocity/100.0 - 20.0;
            //printf("PPPPPPPPPPPPPPPP\n");
        }
        
        if((characterRotation > 80 && characterRotation < 100) || (characterRotation < -260 && characterRotation > -280)
           || (characterRotation > 260 && characterRotation < 280) || (characterRotation < -80 && characterRotation > -100)){
            genTime = 15;  
            
            if(characterLastVY < -6){
                floorSnowGenRatio = 1;
            }
            
           // printf("DSFDSFSDFSDFSFSDFD\n");
        }
       
    }
    
    if(characterRotation < -5 && characterRotation > -70){
        floorSnowGenX = -30.0 * (float)genVelocity/100.0 - 40.0;
    }
    
    if((characterRotation < 5 && characterRotation > -5) || (characterRotation < -175 && characterRotation > -185)){
        genTime = 5;
        genVelocity = arc4random()% 100;
        floorSnowGenX = 40.0 * (float)genVelocity/100.0 - 80.0;
       // printf("floorSnowGenX:%4.8f %i\n",floorSnowGenX, genVelocity);
    }
    
    
    if(characterLastVY < -7){
        genTime = 15;
        floorSnowGenRatio = 1;
        
        if(characterLastVX > -0.5 && characterLastVX < 0.5){
            floorSnowGenVX = 4.0;
            floorSnowGenMinVX = -2.0;
        }
        
    }else if(characterLastVY < -6){
        genTime = 10;
        floorSnowGenRatio = 1;
        
        if(characterLastVX > -0.5 && characterLastVX < 0.5){
            floorSnowGenVX = 3.5;
            floorSnowGenMinVX = -1.75;
        }
        
    }else if(characterLastVY < -5){
        genTime = 7;
        floorSnowGenRatio = 1;
        
        if(characterLastVX > -0.5 && characterLastVX < 0.5){
            floorSnowGenVX = 3.0;
            floorSnowGenMinVX = -1.5;
        }
        
    }else if(characterLastVY < -4){
        genTime = 5;
        floorSnowGenRatio = 1;
        
        if(characterLastVX > -0.5 && characterLastVX < 0.5){
            floorSnowGenVX = 2.5;
            floorSnowGenMinVX = -1.25;
        }
        
    }else if(characterLastVY < -1){
        if(characterLastVX > -0.5 && characterLastVX < 0.5){
            floorSnowGenVX = 2.0;
            floorSnowGenMinVX = -1.0;
        }
    }else{
        if(characterLastVX > -0.5 && characterLastVX < 0.5){
            floorSnowGenVX = 1.0;
            floorSnowGenMinVX = -0.5;
        }
    }
    
    
    if(characterVelocity < 0.5  && characterVelocity > -0.5){
        floorSnowGenRatio = 999999;
    }
    
    
    
   // printf("%4.8f %4.8f %4.8f %4.8f\n",floorSnowGenVY,floorSnowGenMinVY,characterLastVY, characterRotation);

    if(floorSnow->genIdx % floorSnowGenRatio == 0){
        floorSnow->genIdx = 0;
      //  printf("GENTIME:%i\n",genTime);
        
        while (genTime > 0) {
            if(characterVelocity > 3){
                if(characterRotation < 5 && characterRotation > -5){
                    floorSnowGenX = 100.0 * (float)genVelocity/100.0 - 50.0;
                }

            }
            
            
            floorSnow->isAni[floorSnow->idx] = true;
            floorSnow->x[floorSnow->idx] = characterX + floorSnowGenX;
            floorSnow->y[floorSnow->idx] = characterY + floorSnowGenY;
            
            genVelocity = arc4random()% 100;
            floorSnow->vx[floorSnow->idx] = floorSnowGenVX * (float)genVelocity/100.0 + floorSnowGenMinVX;
            
            genVelocity = arc4random()% 100;
            floorSnow->vy[floorSnow->idx] = floorSnowGenVY * (float)genVelocity/100.0 + floorSnowGenMinVY;
            
            genVelocity = arc4random()% 100;
            [floorSnow->s_snow[floorSnow->idx] setScale:1.0 * (float)genVelocity/100.0 + 0.5];
            
            floorSnow->idx++;
            if(floorSnow->idx >= floorSnow->howmany){
                floorSnow->idx = 0;
            }
            
            genTime--;
        }
        
    }
}

-(void) maangeFloorSnow{
    if(characterY <= minFloorY + 2){
        [self genFloorSnow];
    }
    
    for(int i = 0 ; i < floorSnow->howmany ; i++){
        if(floorSnow->isAni[i]){
            floorSnow->x[i] += floorSnow->vx[i];
            floorSnow->y[i] += floorSnow->vy[i];
            floorSnow->vx[i] *= 0.98;
            floorSnow->vy[i] += -0.5;
            
            floorSnow->screenX[i] = floorSnow->x[i] - characterX + screenX;
            floorSnow->screenY[i] = floorSnow->y[i] - characterY + screenY;
            
            [floorSnow->s_snow[i] setPosition:ccp(floorSnow->screenX[i], floorSnow->screenY[i])];
            
            if(floorSnow->screenY[i] < -50){
                floorSnow->isAni[i] = false;
            }
        }
    }
}

-(void) manageStaticBg{
    if(characterY < 600){
        staticBg2_Opacity = 0;
    }else{
        staticBg2_Opacity = 255 * (characterY - 600) / 9000;
    }
    
    //printf("staticBg2_Opacity:%4.8f\n",staticBg2_Opacity);
    
    if(staticBg2_Opacity > 255){
        staticBg2_Opacity = 255;
    } 
    
    [s_staticBg2 setOpacity:staticBg2_Opacity];
}

-(void) manageFloor{
    floor_OffsetXCal = floor_Ratio * characterVX;
    
    floor_ScreenY = floor_Y - characterY + screenY;
    
    [s_floor[floor_CurrentIdx] setPosition:ccp(s_floor[floor_CurrentIdx].position.x - floor_OffsetXCal, floor_ScreenY)];
    if(characterVX > 0){
        // [s_floor[floor_NextIdx] setPosition:ccp(s_floor[floor_CurrentIdx].position.x + floor_Offset , floor_ScreenY)];
        if(s_floor[floor_CurrentIdx].position.x > -10){
            [s_floor[floor_NextIdx] setPosition:ccp(s_floor[floor_CurrentIdx].position.x - floor_Offset , floor_ScreenY)];
        }else{
            [s_floor[floor_NextIdx] setPosition:ccp(s_floor[floor_CurrentIdx].position.x + floor_Offset , floor_ScreenY)];
        }
    }else{
        if(s_floor[floor_CurrentIdx].position.x > -10){
            [s_floor[floor_NextIdx] setPosition:ccp(s_floor[floor_CurrentIdx].position.x - floor_Offset , floor_ScreenY)];
        }else{
            [s_floor[floor_NextIdx] setPosition:ccp(s_floor[floor_CurrentIdx].position.x + floor_Offset , floor_ScreenY)];
        }
        
    }
    
    
    
    if(s_floor[floor_CurrentIdx].position.x < -520 * 2/textureRatioForFuckingIpad){
        if(floor_CurrentIdx == 0){
            floor_CurrentIdx = 1;
            floor_NextIdx = 0;
        }else{
            floor_CurrentIdx = 0;
            floor_NextIdx = 1;
        }
    }
    
    if(s_floor[floor_CurrentIdx].position.x > 476 * 2/textureRatioForFuckingIpad){
        if(floor_CurrentIdx == 0){
            floor_CurrentIdx = 1;
            floor_NextIdx = 0;
        }else{
            floor_CurrentIdx = 0;
            floor_NextIdx = 1;
        }
    }

}

-(void) manageHill{
    hillLayer_OffsetXCal = hillLayer_Ratio * characterVX;
    hillLayer_OffsetYCal = hillLayer_RatioY * characterVY;
    
    hillLayer_ScreenY = hillLayer_s_hill01[hillLayer_CurrentIdx].position.y - hillLayer_OffsetYCal;
    
    if(characterY < startToDeclineY){
        hillLayer_ScreenY = hillLayer_Y;
    }
    
    
    [hillLayer_s_hill01[hillLayer_CurrentIdx] setPosition:ccp(hillLayer_s_hill01[hillLayer_CurrentIdx].position.x - hillLayer_OffsetXCal, hillLayer_ScreenY)];
    if(characterVX > 0){
        if(hillLayer_s_hill01[hillLayer_CurrentIdx].position.x > -10){
            [hillLayer_s_hill01[hillLayer_NextIdx] setPosition:ccp(hillLayer_s_hill01[hillLayer_CurrentIdx].position.x - hillLayer_Offset , hillLayer_ScreenY)];
        }else{
            [hillLayer_s_hill01[hillLayer_NextIdx] setPosition:ccp(hillLayer_s_hill01[hillLayer_CurrentIdx].position.x + hillLayer_Offset , hillLayer_ScreenY)];
        }
    }else{
        if(hillLayer_s_hill01[hillLayer_CurrentIdx].position.x > -10){
            [hillLayer_s_hill01[hillLayer_NextIdx] setPosition:ccp(hillLayer_s_hill01[hillLayer_CurrentIdx].position.x - hillLayer_Offset , hillLayer_ScreenY)];
        }else{
            [hillLayer_s_hill01[hillLayer_NextIdx] setPosition:ccp(hillLayer_s_hill01[hillLayer_CurrentIdx].position.x + hillLayer_Offset , hillLayer_ScreenY)];
        }
        
    }
    
    [hillLayer_s_hill02[hillLayer_CurrentIdx] setPosition:ccp(hillLayer_s_hill01[hillLayer_CurrentIdx].position.x + 283 , hillLayer_ScreenY)];
    //[hillLayer_s_snowman[hillLayer_CurrentIdx] setPosition:ccp(hillLayer_s_hill01[hillLayer_CurrentIdx].position.x + 245 , hillLayer_ScreenY)];
   // [hillLayer_s_igno[hillLayer_CurrentIdx] setPosition:ccp(hillLayer_s_hill01[hillLayer_CurrentIdx].position.x + 171 , hillLayer_ScreenY)];
    
    [hillLayer_s_hill02[hillLayer_NextIdx] setPosition:ccp(hillLayer_s_hill01[hillLayer_NextIdx].position.x + 283 , hillLayer_ScreenY)];
   // [hillLayer_s_snowman[hillLayer_NextIdx] setPosition:ccp(hillLayer_s_hill01[hillLayer_NextIdx].position.x + 245 , hillLayer_ScreenY)];
   // [hillLayer_s_igno[hillLayer_NextIdx] setPosition:ccp(hillLayer_s_hill01[hillLayer_NextIdx].position.x + 171 , hillLayer_ScreenY)];
    
    
    if(hillLayer_s_hill01[hillLayer_CurrentIdx].position.x < -520){
        if(hillLayer_CurrentIdx == 0){
            hillLayer_CurrentIdx = 1;
            hillLayer_NextIdx = 0;
        }else{
            hillLayer_CurrentIdx = 0;
            hillLayer_NextIdx = 1;
        }
    }
    
    if(hillLayer_s_hill01[hillLayer_CurrentIdx].position.x > 476){
        if(hillLayer_CurrentIdx == 0){
            hillLayer_CurrentIdx = 1;
            hillLayer_NextIdx = 0;
        }else{
            hillLayer_CurrentIdx = 0;
            hillLayer_NextIdx = 1;
        }
    }

}

-(void) manageFloorItem{
    floorItemLayer_OffsetXCal = floorItemLayer_Ratio * characterVX;
    floorItemLayer_OffsetYCal = floorItemLayer_RatioY * characterVY;
    
    floorItemLayer_ScreenY = floorItemLayer_s_snowman[floorItemLayer_CurrentIdx].position.y - floorItemLayer_OffsetYCal;
    
    if(characterY < startToDeclineY){
        floorItemLayer_ScreenY = floorItemLayer_Y;
    }
    
    
    [floorItemLayer_s_snowman[floorItemLayer_CurrentIdx] setPosition:ccp(floorItemLayer_s_snowman[floorItemLayer_CurrentIdx].position.x - floorItemLayer_OffsetXCal, floorItemLayer_ScreenY)];
    if(characterVX > 0){
        if(floorItemLayer_s_snowman[floorItemLayer_CurrentIdx].position.x > -10){
            [floorItemLayer_s_snowman[floorItemLayer_NextIdx] setPosition:ccp(floorItemLayer_s_snowman[floorItemLayer_CurrentIdx].position.x - floorItemLayer_Offset , floorItemLayer_ScreenY)];
        }else{
            [floorItemLayer_s_snowman[floorItemLayer_NextIdx] setPosition:ccp(floorItemLayer_s_snowman[floorItemLayer_CurrentIdx].position.x + floorItemLayer_Offset , floorItemLayer_ScreenY)];
        }
    }else{
        if(floorItemLayer_s_snowman[floorItemLayer_CurrentIdx].position.x > -10){
            [floorItemLayer_s_snowman[floorItemLayer_NextIdx] setPosition:ccp(floorItemLayer_s_snowman[floorItemLayer_CurrentIdx].position.x - floorItemLayer_Offset , floorItemLayer_ScreenY)];
        }else{
            [floorItemLayer_s_snowman[floorItemLayer_NextIdx] setPosition:ccp(floorItemLayer_s_snowman[floorItemLayer_CurrentIdx].position.x + floorItemLayer_Offset , floorItemLayer_ScreenY)];
        }
        
    }
    
   // printf("floorItemLayer_s_snowman[floorItemLayer_CurrentIdx] :%4.8f %4.8f\n",floorItemLayer_s_snowman[0].position.x, floorItemLayer_s_snowman[0].position.y);
    
    [floorItemLayer_s_igno[floorItemLayer_CurrentIdx] setPosition:ccp(floorItemLayer_s_snowman[floorItemLayer_CurrentIdx].position.x - 110 , floorItemLayer_ScreenY)];
    [floorItemLayer_s_igno[floorItemLayer_NextIdx] setPosition:ccp(floorItemLayer_s_snowman[floorItemLayer_NextIdx].position.x - 110 , floorItemLayer_ScreenY)];
   
    
    if(floorItemLayer_s_snowman[floorItemLayer_CurrentIdx].position.x < -520 * 2/textureRatioForFuckingIpad){
        if(floorItemLayer_CurrentIdx == 0){
            floorItemLayer_CurrentIdx = 1;
            floorItemLayer_NextIdx = 0;
        }else{
            floorItemLayer_CurrentIdx = 0;
            floorItemLayer_NextIdx = 1;
        }
    }
    
    if(floorItemLayer_s_snowman[floorItemLayer_CurrentIdx].position.x > 476 * 2/textureRatioForFuckingIpad){
        if(floorItemLayer_CurrentIdx == 0){
            floorItemLayer_CurrentIdx = 1;
            floorItemLayer_NextIdx = 0;
        }else{
            floorItemLayer_CurrentIdx = 0;
            floorItemLayer_NextIdx = 1;
        }
    }
    
}


-(void) manageBehineHill{
    behindHillLayer_OffsetXCal = behindHillLayer_Ratio * characterVX;
    behindHillLayer_OffsetYCal = behindHillLayer_RatioY * characterVY;
    
    behindHillLayer_ScreenY = behindHillLayer_s_hill01[behindHillLayer_CurrentIdx].position.y - behindHillLayer_OffsetYCal;
    
    if(characterY < startToDeclineY){
        behindHillLayer_ScreenY = behindHillLayer_Y;
    }
    
    
    [behindHillLayer_s_hill01[behindHillLayer_CurrentIdx] setPosition:ccp(behindHillLayer_s_hill01[behindHillLayer_CurrentIdx].position.x - behindHillLayer_OffsetXCal, behindHillLayer_ScreenY)];
    if(characterVX > 0){
        if(behindHillLayer_s_hill01[behindHillLayer_CurrentIdx].position.x > -10){
            [behindHillLayer_s_hill01[behindHillLayer_NextIdx] setPosition:ccp(behindHillLayer_s_hill01[behindHillLayer_CurrentIdx].position.x - behindHillLayer_Offset , behindHillLayer_ScreenY)];
        }else{
            [behindHillLayer_s_hill01[behindHillLayer_NextIdx] setPosition:ccp(behindHillLayer_s_hill01[behindHillLayer_CurrentIdx].position.x + behindHillLayer_Offset , behindHillLayer_ScreenY)];
        }
        
        [behindHillLayer_s_hill01[2] setPosition:ccp(behindHillLayer_s_hill01[0].position.x + 341 * 2/textureRatioForFuckingIpad, behindHillLayer_s_hill01[0].position.y)];
        [behindHillLayer_s_hill01[3] setPosition:ccp(behindHillLayer_s_hill01[1].position.x + 341 * 2/textureRatioForFuckingIpad, behindHillLayer_s_hill01[1].position.y)];
        
    }else{
        if(behindHillLayer_s_hill01[behindHillLayer_CurrentIdx].position.x > -10){
            [behindHillLayer_s_hill01[behindHillLayer_NextIdx] setPosition:ccp(behindHillLayer_s_hill01[behindHillLayer_CurrentIdx].position.x - behindHillLayer_Offset , behindHillLayer_ScreenY)];
        }else{
            [behindHillLayer_s_hill01[behindHillLayer_NextIdx] setPosition:ccp(behindHillLayer_s_hill01[behindHillLayer_CurrentIdx].position.x + behindHillLayer_Offset , behindHillLayer_ScreenY)];
        }
        
        [behindHillLayer_s_hill01[2] setPosition:ccp(behindHillLayer_s_hill01[0].position.x + 341 * 2/textureRatioForFuckingIpad, behindHillLayer_s_hill01[0].position.y)];
        [behindHillLayer_s_hill01[3] setPosition:ccp(behindHillLayer_s_hill01[1].position.x + 341 * 2/textureRatioForFuckingIpad, behindHillLayer_s_hill01[1].position.y)];
        
    }
    
    
    
    if(behindHillLayer_s_hill01[behindHillLayer_CurrentIdx].position.x < -520 * 2/textureRatioForFuckingIpad){
        if(behindHillLayer_CurrentIdx == 0){
            behindHillLayer_CurrentIdx = 1;
            behindHillLayer_NextIdx = 0;
        }else{
            behindHillLayer_CurrentIdx = 0;
            behindHillLayer_NextIdx = 1;
        }
    }
    
    if(behindHillLayer_s_hill01[behindHillLayer_CurrentIdx].position.x > 476 * 2/textureRatioForFuckingIpad){
        if(behindHillLayer_CurrentIdx == 0){
            behindHillLayer_CurrentIdx = 1;
            behindHillLayer_NextIdx = 0;
        }else{
            behindHillLayer_CurrentIdx = 0;
            behindHillLayer_NextIdx = 1;
        }
    }
    
}


@end
