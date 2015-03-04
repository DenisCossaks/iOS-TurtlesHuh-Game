//
//  MainTurtleEquipments.m
//  TurtlesHuh
//
//  Created by  on 2012/6/17.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "MainTurtleEquipments.h"
#import "GamePlayGlobal.h"
#import "MainGamePlayGlobal.h"
#import "animationDefs.h"
#import "Turtle.h"

@implementation MainTurtleEquipments

-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
        clickingRocketTimer = 0;
        hasAppliedFuelOnce = false;
        
        isOpenningGlide = false;
        openningGlideTimer = 0;
        
        [self initOffsets];
        [self initEquipments];
    }
    
	return self;
}

-(void) setTurtleCollide{
    if(isTurtleColliding){
        return;
    }
    
    isTurtleColliding = true;
    turtleCollidingTimer = 0;
    
    collide_Rocket_r = characterRotation;
    collide_Glide_r = characterRotation;
    collide_Rope_r = characterRotation;
    collide_Helmet_r = characterRotation;
    collide_Line_r = characterRotation;
    
    static float collisionForce;
    collisionForce = characterVelocity * 0.5;
    
    static int collisionRan;
    
    collisionRan = arc4random() % 100;
    collide_Rocket_vr = -collisionForce + 5 * (float)collisionRan/100.0 - 2.5;
    
    collisionRan = arc4random() % 100;
    collide_Glide_vr = -collisionForce + 5 * (float)collisionRan/100.0 - 2.5;
    
    collisionRan = arc4random() % 100;
    collide_Rope_vr = -collisionForce + 5 * (float)collisionRan/100.0 - 2.5;
    
    collisionRan = arc4random() % 100;
    collide_Helmet_vr = -collisionForce + 5 * (float)collisionRan/100.0 - 2.5;
    
    collisionRan = arc4random() % 100;
    collide_Line_vr = -collisionForce + 5 * (float)collisionRan/100.0 - 2.5;
    
    static float collisionGeneralVX;
    static float collisionGeneralVY;
    
    collisionGeneralVX = -characterVelocity * cos(characterRotation * M_PI/180);
    collisionGeneralVY = -characterVelocity * sin(characterRotation * M_PI/180);
    
    collisionRan = arc4random() % 100;
    collide_Rocket_vx = collisionGeneralVX*0.3 + 10 * (float)collisionRan/100.0 - 5;
    collisionRan = arc4random() % 100;
    collide_Rocket_vy = collisionGeneralVY + 3 + 8 * (float)collisionRan/100.0 - 3;
    
    collisionRan = arc4random() % 100;
    collide_Glide_vx = collisionGeneralVX*0.3 + 10 * (float)collisionRan/100.0 - 5;
    collisionRan = arc4random() % 100;
    collide_Glide_vy = collisionGeneralVY + 2 + 8 * (float)collisionRan/100.0 - 3;
    
    collisionRan = arc4random() % 100;
    collide_Rope_vx = collisionGeneralVX*0.3 + 10 * (float)collisionRan/100.0 - 5;
    collisionRan = arc4random() % 100;
    collide_Rope_vy = collisionGeneralVY + 2 + 8 * (float)collisionRan/100.0 - 3;
    
    collisionRan = arc4random() % 100;
    collide_Helmet_vx = collisionGeneralVX*0.3 + 10 * (float)collisionRan/100.0 - 5;
    collisionRan = arc4random() % 100;
    collide_Helmet_vy = collisionGeneralVY + 2 + 8 * (float)collisionRan/100.0 - 3;
    
    collisionRan = arc4random() % 100;
    collide_Line_vx = collisionGeneralVX*0.3 + 10 * (float)collisionRan/100.0 - 5;
    collisionRan = arc4random() % 100;
    collide_Line_vy = collisionGeneralVY + 2 + 8 * (float)collisionRan/100.0 - 3;
}

-(void) initOffsets{
    rocketToTurtleOffsetX = 0;
    rocketToTurtleOffsetY = -5;
    smokeToRocketOffsetX = -150;
    smokeToRocketOffsetY = 0;
    
    glide1ToTurtleOffsetX = 0;
    glide1ToTurtleOffsetY = 40;
    glide2ToTurtleOffsetX = 0;
    glide2ToTurtleOffsetY = 80;
    
    ropeToTurtleOffsetX = 0;
    ropeToTurtleOffsetY = -40;
    
}

-(void) initEquipments{
    s_glide = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(0/textureRatioForFuckingIpad+726/textureRatioForFuckingIpad, 824/textureRatioForFuckingIpad-132/textureRatioForFuckingIpad, 396/textureRatioForFuckingIpad,92/textureRatioForFuckingIpad)];
    s_line = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1384/textureRatioForFuckingIpad, 696/textureRatioForFuckingIpad, 28/textureRatioForFuckingIpad,94/textureRatioForFuckingIpad)];
    s_helmet = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1442/textureRatioForFuckingIpad, 692/textureRatioForFuckingIpad, 128/textureRatioForFuckingIpad,100/textureRatioForFuckingIpad)];
    s_rope = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1872/textureRatioForFuckingIpad, 1118/textureRatioForFuckingIpad, 42/textureRatioForFuckingIpad,118/textureRatioForFuckingIpad)];
    s_fire = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(598/textureRatioForFuckingIpad, 1434/textureRatioForFuckingIpad, 66/textureRatioForFuckingIpad,60/textureRatioForFuckingIpad)];
    
     helmetLevel_offsetX = 0;
     helmetLevel_offsetY = 0;
     rocketLevel_offsetX = 0;
     rocketLevel_offsetY = 0;
     gliderLevel_offsetX = 0;
     gliderLevel_offsetY = 0;
    
    
    if(playerGlider == 1){
        [s_glide setTextureRect:CGRectMake(0/textureRatioForFuckingIpad+726/textureRatioForFuckingIpad, 824/textureRatioForFuckingIpad-132/textureRatioForFuckingIpad, 396/textureRatioForFuckingIpad,92/textureRatioForFuckingIpad)];
    }
    if(playerGlider == 2){
        [s_glide setTextureRect:CGRectMake(726/textureRatioForFuckingIpad, 802/textureRatioForFuckingIpad, 404/textureRatioForFuckingIpad,94/textureRatioForFuckingIpad)];
    }
    if(playerGlider == 3){
        [s_glide setTextureRect:CGRectMake(686/textureRatioForFuckingIpad, 1104/textureRatioForFuckingIpad, 398/textureRatioForFuckingIpad,94/textureRatioForFuckingIpad)];
    }
    if(playerGlider == 4){
        [s_glide setTextureRect:CGRectMake(686/textureRatioForFuckingIpad, 1004/textureRatioForFuckingIpad, 398/textureRatioForFuckingIpad,94/textureRatioForFuckingIpad)];
    }
    if(playerGlider == 5){
        [s_glide setTextureRect:CGRectMake(726/textureRatioForFuckingIpad, 906/textureRatioForFuckingIpad, 398/textureRatioForFuckingIpad,92/textureRatioForFuckingIpad)];
    }
    
    if(playerHelmet == 0){
        [s_helmet setTextureRect:CGRectMake(0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad, 0/textureRatioForFuckingIpad,0/textureRatioForFuckingIpad)];
    }
    if(playerHelmet == 1){
        [s_helmet setTextureRect:CGRectMake(1442/textureRatioForFuckingIpad, 692/textureRatioForFuckingIpad, 128/textureRatioForFuckingIpad,100/textureRatioForFuckingIpad)];
    }
    if(playerHelmet == 2){
        [s_helmet setTextureRect:CGRectMake(1372/textureRatioForFuckingIpad, 802/textureRatioForFuckingIpad, 128/textureRatioForFuckingIpad,100/textureRatioForFuckingIpad)];
    }
    if(playerHelmet == 3){
        [s_helmet setTextureRect:CGRectMake(1310/textureRatioForFuckingIpad, 1004/textureRatioForFuckingIpad, 148/textureRatioForFuckingIpad,100/textureRatioForFuckingIpad)];
        helmetLevel_offsetX = 8;
        helmetLevel_offsetY = 0;
    }
    if(playerHelmet == 4){
        [s_helmet setTextureRect:CGRectMake(1372/textureRatioForFuckingIpad, 906/textureRatioForFuckingIpad, 126/textureRatioForFuckingIpad,98/textureRatioForFuckingIpad)];
    }
    if(playerHelmet == 5){
        [s_helmet setTextureRect:CGRectMake(1578/textureRatioForFuckingIpad, 692/textureRatioForFuckingIpad, 144/textureRatioForFuckingIpad,108/textureRatioForFuckingIpad)];
        helmetLevel_offsetX = -4;
        helmetLevel_offsetY = 0;
    }

    
    [ss_Character addChild:s_fire z:kDeapth_Equip_Fire];
    [ss_Character addChild:s_glide z:kDeapth_Equip_Glide];
    [ss_Character addChild:s_rope z:kDeapth_Equip_Glide];
    [ss_Character addChild:s_helmet z:kDeapth_Equip_Glide];
    [ss_Character addChild:s_line z:kDeapth_Equip_Glide];
    
    [s_glide setPosition:ccp(10000,100000)];
    [s_rope setPosition:ccp(10000,100000)];
    [s_helmet setPosition:ccp(10000,100000)];
    [s_line setPosition:ccp(10000,100000)];
    [s_fire setPosition:ccp(10000,100000)];
    
    [s_fire setAnchorPoint:ccp(1,0.5)];
    
    [s_glide setAnchorPoint:ccp(390.0/790.0,42.0/182.0)];
    [s_rope setAnchorPoint:ccp(39.0/79.0,118.0/236.0)];
    [s_helmet setAnchorPoint:ccp(92.0/252.0,74.0/198.0)];
    [s_line setAnchorPoint:ccp(0.5,158.0/184.0)];
    
    [self initRocket];
}

-(void) initRocket{
    rocket = malloc(sizeof(eRocket));
    rocket->maxSmoke = 100;
    rocket->smokeIdx = 0;
    
    rocket->s_rockect = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(398/textureRatioForFuckingIpad+726/textureRatioForFuckingIpad,824/textureRatioForFuckingIpad-132/textureRatioForFuckingIpad,216/textureRatioForFuckingIpad,88/textureRatioForFuckingIpad)];
    [ss_Character addChild:rocket->s_rockect z:kDeapth_Equip_Rocket];
    [rocket->s_rockect setPosition:ccp(10000,100000)];
    
    fireToRocketOffset = -85;
    if(playerBoost == 1){
        [rocket->s_rockect setTextureRect:CGRectMake(398/textureRatioForFuckingIpad+726/textureRatioForFuckingIpad,824/textureRatioForFuckingIpad-132/textureRatioForFuckingIpad,216/textureRatioForFuckingIpad,88/textureRatioForFuckingIpad)];
    }
    if(playerBoost == 2){
        [rocket->s_rockect setTextureRect:CGRectMake(1136/textureRatioForFuckingIpad, 802/textureRatioForFuckingIpad, 228/textureRatioForFuckingIpad,90/textureRatioForFuckingIpad)];
        fireToRocketOffset = -80;
    }
    if(playerBoost == 3){
        [rocket->s_rockect setTextureRect:CGRectMake(1090/textureRatioForFuckingIpad, 1104/textureRatioForFuckingIpad, 216/textureRatioForFuckingIpad,76/textureRatioForFuckingIpad)];
    }
    if(playerBoost == 4){
        [rocket->s_rockect setTextureRect:CGRectMake(1090/textureRatioForFuckingIpad, 1004/textureRatioForFuckingIpad, 216/textureRatioForFuckingIpad,78/textureRatioForFuckingIpad)];
    }
    if(playerBoost == 5){
        [rocket->s_rockect setTextureRect:CGRectMake(1136/textureRatioForFuckingIpad, 906/textureRatioForFuckingIpad, 220/textureRatioForFuckingIpad,82/textureRatioForFuckingIpad)];
    }
    
    [rocket->s_rockect setAnchorPoint:ccp(207.0/428.0,90.0/175.0)];
    
    for(int i = 0 ; i < rocket->maxSmoke ; i++){
       rocket->s_smoke[i] = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(0,0,0,0)];
        [ss_Character addChild:rocket->s_smoke[i] z:kDeapth_Equip_Smoke];
        [rocket->s_smoke[i] setPosition:ccp(10000,100000)];
        [rocket->s_smoke[i] setTextureRect:CGRectMake(598/textureRatioForFuckingIpad, 1500/textureRatioForFuckingIpad, 74/textureRatioForFuckingIpad, 72/textureRatioForFuckingIpad)];
        
        rocket->smoke_isAni[i] = false;
    }
}

-(void) manage{
    [self manageRocket];
    [self managePos];
    
    if(!isOpenningGlide && !hasOpennedGlide){
        if(!isBeginningHeavyInvincible){
            if(playTimer >= (playFlightTime - 20)){
                isOpenningGlide = true;
                hasOpennedGlide = false;
                openningGlideTimer = 0;
                glideOpenning_r = - 45;
                glideOpenning_sx = 1.0;
                glideOpenning_sy = 0.0;
            }
        }else{
            if(playTimer >= (playFlightTime - 0)){
                isOpenningGlide = true;
                hasOpennedGlide = false;
                openningGlideTimer = 0;
                glideOpenning_r = - 45;
                glideOpenning_sx = 1.0;
                glideOpenning_sy = 0.0;
            }
        }
        
    }
    
    if(isOpenningGlide){
        glideOpenning_r += (0 - glideOpenning_r)/7.5;
        
        if(openningGlideTimer > 6){
            glideOpenning_sy += (1 - glideOpenning_sy)/15.0;
        }else{
            glideOpenning_sy += 0.2;
        }
        
        openningGlideTimer++;
        if(openningGlideTimer >= 120){
            isOpenningGlide = false;
            hasOpennedGlide = true;
        }
    }
    
    if(!isTurtleColliding){
        [self manageRocketAni];
    }else{
        [self manageTurtleColliding];
    }
    
}

-(void) manageTurtleColliding{
    turtleCollidingTimer++;
    
   // printf("collide_Rocket_vx:%4.8f %4.8f\n",collide_Rocket_vx, ani_Rocket_x);
    
    ani_Rocket_x += collide_Rocket_vx;
    ani_Rocket_y += collide_Rocket_vy;
    ani_Rocket_r += collide_Rocket_vr;
    
    ani_Glide_x += collide_Glide_vx;
    ani_Glide_y += collide_Glide_vy;
    ani_Glide_r += collide_Glide_vr;

    ani_Rope_x += collide_Rope_vx;
    ani_Rope_y += collide_Rope_vy;
    ani_Rope_r += collide_Rope_vr;
    
    ani_Helmet_x += collide_Helmet_vx;
    ani_Helmet_y += collide_Helmet_vy;
    ani_Helmet_r += collide_Helmet_vr;
    
    ani_Line_x += collide_Line_vx;
    ani_Line_y += collide_Line_vy;
    ani_Line_r += collide_Line_vr;
    
    static float collideGravity = -0.5;
    collide_Rocket_vy += collideGravity;
    collide_Glide_vy += collideGravity;
    collide_Rope_vy += collideGravity;
    collide_Helmet_vy += collideGravity;
    collide_Line_vy += collideGravity;
    
    [rocket->s_rockect setPosition:ccp(ani_Rocket_x - 0 + screenX , ani_Rocket_y - 0 + screenY)];
    [s_line setPosition:ccp(ani_Line_x - 0 + screenX, ani_Line_y - 0 + screenY)];
    [s_glide setPosition:ccp(ani_Glide_x - 0 + screenX, ani_Glide_y - 0 + screenY)];
    [s_rope setPosition:ccp(ani_Rope_x - 0 + screenX, ani_Rope_y - 0 + screenY)];
    [s_helmet setPosition:ccp(ani_Helmet_x - 0 + screenX, ani_Helmet_y - 0 + screenY)];
    
    
    [rocket->s_rockect setRotation:ani_Rocket_r];
    [s_line setRotation:ani_Line_r+25];
    [s_glide setRotation:ani_Glide_r];
    [s_rope setRotation:ani_Rope_r];
    [s_helmet setRotation:ani_Helmet_r];
    [s_fire setRotation:ani_Line_r];
    
    [s_fire setPosition:ccp(10000, 10000)];
    
}

-(void) manageRocket{
    if(isApplyingFuel && !isHeavyInvincible){
      //  printf("h\n");
        if(clickingRocketTimer % 4 == 0){
            [self genOneRocketSmoke:true];
        }
        
        [self manageFire];
        hasAppliedFuelOnce = true;
        
        clickingRocketTimer++;
    }else{
        
        if(hasAppliedFuelOnce){
            hasAppliedFuelOnce = false;
            clickingRocketTimer = 0;
            fireAniTimer = 0;
            fireAniIdx = 0;
        }
        
    }
    

}

-(void) manageFire{
    if(fireAniTimer % 3 == 0){
        fireAniIdx++;
        if(fireAniIdx == 2){
            fireAniIdx = 0;
        }
        
        if(fireAniIdx == 0){
            [s_fire setScaleX:1.8 * wholeScale];
        }
        if(fireAniIdx == 1){
            [s_fire setScaleX:2.0 * wholeScale];
        }
    }
    
    fireAniTimer++;
}

-(void) managePos{
    

    for(int i = 0 ; i < rocket->maxSmoke ; i++){
        if(rocket->smoke_isAni[i]){
        
            rocket->smoke_X[i] += rocket->smoke_VX[i];
            rocket->smoke_Y[i] += rocket->smoke_VY[i];
            [rocket->s_smoke[i] setPosition:ccp((rocket->smoke_X[i] - characterX) + screenX, (rocket->smoke_Y[i] - characterY) + screenY)];
            
            rocket->smoke_Opacity[i] -= 8;
            if(rocket->smoke_Opacity[i] < 0){
                rocket->smoke_Opacity[i] = 0;
                rocket->smoke_isAni[i] = false;
            }
            
            //rocket->smoke_Scale[i] += 0.02;
            rocket->smoke_Scale[i] += 0.035;
            if(rocket->smoke_Scale[i] < 0){
                rocket->smoke_Scale[i] = 0;
            }
            
            
            [rocket->s_smoke[i] setOpacity:rocket->smoke_Opacity[i]];
            [rocket->s_smoke[i] setScale:rocket->smoke_Scale[i] * wholeScale];
            
            
           // printf("(I:%i rocket->smoke_X[i] - characterX) + screenX:%4.8f    %4.8f\n",i,rocket->s_smoke[i].position.x ,rocket->s_smoke[i].position.y);
          //  printf("rocket->smoke_Scale[i]:%4.8f %4.8f %4.8f %4.8f\n",rocket->s_smoke[i].scale, rocket->s_smoke[i].scaleX, rocket->s_smoke[i].scaleY);
        }
    }
}

-(void) genOnePenguinSmokeAtX:(float)_x Y:(float)_y{
    rocket->smoke_X[rocket->smokeIdx] = _x;
    rocket->smoke_Y[rocket->smokeIdx] = _y;
    rocket->smoke_Opacity[rocket->smokeIdx] = 255;
    
    static float smokeGenAngleRan;
    smokeGenAngleRan = arc4random() % 60;
    smokeGenAngleRan -= 30;
    
    static float smokeGenForce;
    smokeGenForce = 3.5;
  
    rocket->smoke_VX[rocket->smokeIdx] = smokeGenForce * cos((float)smokeGenAngleRan * M_PI/180);
    rocket->smoke_VY[rocket->smokeIdx] = smokeGenForce * sin((float)smokeGenAngleRan * M_PI/180);
    
   // printf("rocket->smoke_VX[rocket->smokeIdx]:%4.8f\n",rocket->smoke_VX[rocket->smokeIdx]);
    
    
    static float smokeGenScaleRan;
    smokeGenScaleRan = arc4random() % 100;
    
    rocket->smoke_Scale[rocket->smokeIdx] = (0.75 + 0.6 * (float)smokeGenScaleRan/100.0) * 2;
    
    
    rocket->smoke_isAni[rocket->smokeIdx] = true;
    
    rocket->smokeIdx++;
    if(rocket->smokeIdx == rocket->maxSmoke){
        rocket->smokeIdx = 0;
    }
    
}

-(void) genOneRocketSmoke:(bool)_isLarge{
    superFuxkAngleDiff = -characterRotation * M_PI/180;
    
    if(_isLarge){
        superFuxkOriX =  (smokeToRocketOffsetX + rocketToTurtleOffsetX)* wholeScale * aniControlValueForFuckingIpad;
        superFuxkOriY =  (smokeToRocketOffsetY + rocketToTurtleOffsetY)* wholeScale * aniControlValueForFuckingIpad;
    }else{
        superFuxkOriX =  (smokeToRocketOffsetX + rocketToTurtleOffsetX - 50)* wholeScale * aniControlValueForFuckingIpad;
        superFuxkOriY =  (smokeToRocketOffsetY + rocketToTurtleOffsetY)* wholeScale * aniControlValueForFuckingIpad;
    }
   
    superFuxkCalX =  characterX + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
    superFuxkCalY =  characterY + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
    
    
    
    rocket->smoke_X[rocket->smokeIdx] = superFuxkCalX;
    rocket->smoke_Y[rocket->smokeIdx] = superFuxkCalY;
    rocket->smoke_Opacity[rocket->smokeIdx] = 255;
    
    static float smokeGenAngleRan;
    smokeGenAngleRan = arc4random() % 180;
    smokeGenAngleRan -= 270;
    
    static float smokeGenForce;
    smokeGenForce = 0.5;
    if(characterVelocity < 4){
        rocket->smoke_VX[rocket->smokeIdx] = -smokeGenForce * cos((float)(smokeGenAngleRan - characterRotation) * M_PI/180);
        rocket->smoke_VY[rocket->smokeIdx] = -smokeGenForce * sin((float)(smokeGenAngleRan - characterRotation) * M_PI/180);
    }else{
        rocket->smoke_VX[rocket->smokeIdx] = 0;
        rocket->smoke_VY[rocket->smokeIdx] = 0;
    }
    
    
   // printf(" rocket->smoke_VX[rocket->smokeIdx]:%4.8f\n", rocket->smoke_VX[rocket->smokeIdx]);
    
    static float smokeGenScaleRan;
    smokeGenScaleRan = arc4random() % 100;
    
    if(_isLarge){
        rocket->smoke_Scale[rocket->smokeIdx] = (0.6 + 0.6 * (float)smokeGenScaleRan/100.0) * 2;
    }else{
        rocket->smoke_Scale[rocket->smokeIdx] = (1.5 + 1.0 * (float)smokeGenScaleRan/100.0) * 2;
    }
    /*if(_isLarge){
        rocket->smoke_Scale[rocket->smokeIdx] = (0.3 + 0.3 * (float)smokeGenScaleRan/100.0) * 2;
    }else{
        rocket->smoke_Scale[rocket->smokeIdx] = (0.1 + 0.4 * (float)smokeGenScaleRan/100.0) * 2;
    }*/
    
    
    rocket->smoke_isAni[rocket->smokeIdx] = true;
    
    rocket->smokeIdx++;
    if(rocket->smokeIdx == rocket->maxSmoke){
        rocket->smokeIdx = 0;
    }
    
    static float smokeSmallRen;
    static int smokeSmallRan2;
    //printf("characterVelocity:%4.8f\n",characterVelocity);
    
    //max velocity = 7
    if(characterVelocity < 4){
        smokeSmallRan2 = 9999999;
    }else if(characterVelocity < 5){
        smokeSmallRan2 = 10;
    }else if(characterVelocity < 6){
        smokeSmallRan2 = 5;
    }else{
        smokeSmallRan2 = 3;
    }
    
    
    smokeSmallRen = arc4random() % smokeSmallRan2;
    if(smokeSmallRen == 0){
        [self genOneRocketSmoke:false];
    }

}

-(void) manageRocketAni{
    superFuxkAngleDiff = -characterRotation * M_PI/180;
    superFuxkOriX =  frameData[RocketAnim.spriteData[kTurtlePart_Rocket].firstFrame + characterFlyingStep].x * wholeScale * aniControlValueForFuckingIpad;
    superFuxkOriY =  frameData[RocketAnim.spriteData[kTurtlePart_Rocket].firstFrame + characterFlyingStep].y * wholeScale * aniControlValueForFuckingIpad;
    ani_Rocket_x =  0 + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
    ani_Rocket_y =  0 + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
    
    superFuxkAngleDiff = -characterRotation * M_PI/180;
    superFuxkOriX =  frameData[RocketAnim.spriteData[kTurtlePart_Line].firstFrame + characterFlyingStep].x * wholeScale * aniControlValueForFuckingIpad;
    superFuxkOriY =  frameData[RocketAnim.spriteData[kTurtlePart_Line].firstFrame + characterFlyingStep].y * wholeScale * aniControlValueForFuckingIpad;
    ani_Line_x =  0 + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
    ani_Line_y =  0 + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
    
    superFuxkAngleDiff = -characterRotation * M_PI/180;
    superFuxkOriX =  frameData[RocketAnim.spriteData[kTurtlePart_Glide].firstFrame + characterFlyingStep].x * wholeScale * aniControlValueForFuckingIpad;
    superFuxkOriY =  frameData[RocketAnim.spriteData[kTurtlePart_Glide].firstFrame + characterFlyingStep].y * wholeScale * aniControlValueForFuckingIpad;
    ani_Glide_x =  0 + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
    ani_Glide_y =  0 + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
    
    
    superFuxkAngleDiff = -characterRotation * M_PI/180;
    superFuxkOriX =  frameData[RocketAnim.spriteData[kTurtlePart_Rope].firstFrame + characterFlyingStep].x * wholeScale * aniControlValueForFuckingIpad;
    superFuxkOriY =  frameData[RocketAnim.spriteData[kTurtlePart_Rope].firstFrame + characterFlyingStep].y * wholeScale * aniControlValueForFuckingIpad;
    ani_Rope_x =  0 + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
    ani_Rope_y =  0 + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
    
    superFuxkAngleDiff = -characterRotation * M_PI/180;
    superFuxkOriX =  frameData[RocketAnim.spriteData[kTurtlePart_Helmet].firstFrame + characterFlyingStep].x * wholeScale * aniControlValueForFuckingIpad + helmetLevel_offsetX * wholeScale * aniControlValueForFuckingIpad;
    superFuxkOriY =  frameData[RocketAnim.spriteData[kTurtlePart_Helmet].firstFrame + characterFlyingStep].y * wholeScale * aniControlValueForFuckingIpad + helmetLevel_offsetY * wholeScale * aniControlValueForFuckingIpad;
    ani_Helmet_x =  0 + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
    ani_Helmet_y =  0 + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
    
    superFuxkAngleDiff = -characterRotation * M_PI/180;
    superFuxkOriX =  fireToRocketOffset * wholeScale * aniControlValueForFuckingIpad;
    superFuxkOriY =  0 * wholeScale * aniControlValueForFuckingIpad;
    ani_Fire_x =  0 + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
    ani_Fire_y =  0 + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
     
    ani_Rocket_r = frameData[RocketAnim.spriteData[kTurtlePart_Rocket].firstFrame + characterFlyingStep].rotation * 180/M_PI + characterRotation;
    ani_Line_r = frameData[RocketAnim.spriteData[kTurtlePart_Line].firstFrame + characterFlyingStep].rotation * 180/M_PI + characterRotation;
    ani_Glide_r = frameData[RocketAnim.spriteData[kTurtlePart_Glide].firstFrame + characterFlyingStep].rotation * 180/M_PI + characterRotation;
    ani_Rope_r = frameData[RocketAnim.spriteData[kTurtlePart_Rope].firstFrame + characterFlyingStep].rotation * 180/M_PI + characterRotation;
    ani_Helmet_r = frameData[RocketAnim.spriteData[kTurtlePart_Helmet].firstFrame + characterFlyingStep].rotation * 180/M_PI + characterRotation;
    ani_Line_r = characterRotation;

    [rocket->s_rockect setScaleX:frameData[RocketAnim.spriteData[kTurtlePart_Rocket].firstFrame + characterFlyingStep].scaleX * wholeScale * 2];
    //[s_line setScaleX:frameData[RocketAnim.spriteData[kTurtlePart_Line].firstFrame + characterFlyingStep].scaleX * wholeScale * 2];
    //[s_glide setScaleX:frameData[RocketAnim.spriteData[kTurtlePart_Glide].firstFrame + characterFlyingStep].scaleX * wholeScale * 2];
    [s_rope setScaleX:frameData[RocketAnim.spriteData[kTurtlePart_Rope].firstFrame + characterFlyingStep].scaleX * wholeScale * 2];
    [s_helmet setScaleX:frameData[RocketAnim.spriteData[kTurtlePart_Helmet].firstFrame + characterFlyingStep].scaleX * wholeScale * 2];
    
    [rocket->s_rockect setScaleY:frameData[RocketAnim.spriteData[kTurtlePart_Rocket].firstFrame + characterFlyingStep].scaleY * wholeScale * 2];
    //[s_line setScaleY:frameData[RocketAnim.spriteData[kTurtlePart_Line].firstFrame + characterFlyingStep].scaleY * wholeScale * 2];
    //[s_glide setScaleY:frameData[RocketAnim.spriteData[kTurtlePart_Glide].firstFrame + characterFlyingStep].scaleY * wholeScale * 2];
    [s_rope setScaleY:frameData[RocketAnim.spriteData[kTurtlePart_Rope].firstFrame + characterFlyingStep].scaleY * wholeScale * 2];
    [s_helmet setScaleY:frameData[RocketAnim.spriteData[kTurtlePart_Helmet].firstFrame + characterFlyingStep].scaleY * wholeScale * 2];
    
    [rocket->s_rockect setRotation:ani_Rocket_r];
    //[s_line setRotation:ani_Line_r+25];
    //[s_glide setRotation:ani_Glide_r];
    [s_rope setRotation:ani_Rope_r];
    [s_helmet setRotation:ani_Helmet_r];
    [s_fire setRotation:ani_Line_r];
    
   
    
    
   // printf(":%4.8f %4.8f %4.8f %4.8f\n",ani_Rocket_x ,ani_Rope_x, rocket->s_rockect.anchorPoint.x, s_rope.anchorPoint.x);
    [rocket->s_rockect setPosition:ccp(ani_Rocket_x - 0 + screenX , ani_Rocket_y - 0 + screenY)];
    [s_line setPosition:ccp(ani_Line_x - 0 + screenX, ani_Line_y - 0 + screenY)];
    [s_glide setPosition:ccp(ani_Glide_x - 0 + screenX, ani_Glide_y - 0 + screenY)];
    [s_rope setPosition:ccp(ani_Rope_x - 0 + screenX, ani_Rope_y - 0 + screenY)];
    [s_helmet setPosition:ccp(ani_Helmet_x - 0 + screenX, ani_Helmet_y - 0 + screenY)];
    
    if(isApplyingFuel && !isHeavyInvincible){
        [s_fire setPosition:ccp(ani_Fire_x - 0 + screenX, ani_Fire_y - 0 + screenY)];
    }else{
        [s_fire setPosition:ccp(10000, 10000)];
    }
    
    

    if(hasOpennedGlide){
        [s_glide setScaleX:frameData[RocketAnim.spriteData[kTurtlePart_Glide].firstFrame + characterFlyingStep].scaleX * wholeScale * 2];
        [s_glide setScaleY:frameData[RocketAnim.spriteData[kTurtlePart_Glide].firstFrame + characterFlyingStep].scaleY * wholeScale * 2];
        [s_glide setRotation:ani_Glide_r]; 
        
        [s_line setScaleX:frameData[RocketAnim.spriteData[kTurtlePart_Line].firstFrame + characterFlyingStep].scaleX * wholeScale * 2];
        [s_line setScaleY:frameData[RocketAnim.spriteData[kTurtlePart_Line].firstFrame + characterFlyingStep].scaleY * wholeScale * 2];
        [s_line setRotation:ani_Line_r+25];
        
        
    }else{
        if(!isOpenningGlide){
            [s_glide setPosition:ccp(10000,10000)];
            [s_line setPosition:ccp(10000,10000)];
        }else{
            [s_glide setScaleX:(frameData[RocketAnim.spriteData[kTurtlePart_Glide].firstFrame + characterFlyingStep].scaleX * wholeScale * 2) * glideOpenning_sx];
            [s_glide setScaleY:(frameData[RocketAnim.spriteData[kTurtlePart_Glide].firstFrame + characterFlyingStep].scaleY * wholeScale * 2) * glideOpenning_sy];
            [s_glide setRotation:ani_Glide_r + glideOpenning_r]; 
            
            [s_line setScaleX:(frameData[RocketAnim.spriteData[kTurtlePart_Line].firstFrame + characterFlyingStep].scaleX * wholeScale * 2) * glideOpenning_sx];
            [s_line setScaleY:(frameData[RocketAnim.spriteData[kTurtlePart_Line].firstFrame + characterFlyingStep].scaleY * wholeScale * 2) * glideOpenning_sy];
            [s_line setRotation:ani_Line_r+25 + glideOpenning_r];
        }
    }
    
    
   // printf(":%4.8f %4.8f\n", s_fire.position.x, s_fire.position.y);
    
}

@end
