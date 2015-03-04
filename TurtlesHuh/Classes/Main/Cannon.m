//
//  Cannon.m
//  TurtlesHuh
//
//  Created by  on 2012/5/23.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "Cannon.h"
#import "GamePlayGlobal.h"
#import "animationDefs.h"
#import "Global.h"
#import "MainGamePlayGlobal.h"

@implementation Cannon

-(void) setIdNumber:(int)_idNumber{
    idNumber = _idNumber;
}

-(void) setDelegate:(id)_delegate{
    delegate = _delegate;
}

-(void) setX:(int)_x{
    cannon_X = _x;
    
    if(!isPlayingMiniGame){
        return;
    }
    
    static float superFuxkAngleDiff;
    static float superFuxkOriX;
    static float superFuxkOriY;
    static float superFuxkOffsetX;
    static float superFuxkOffsetY;
    
    superFuxkOffsetX = -58 * cos(rotateDegreeAngle * M_PI/180 + M_PI/2);
    superFuxkOffsetY = 58 * sin(rotateDegreeAngle * M_PI/180 + M_PI/2) - 58;
    
    superFuxkAngleDiff = -rotateDegreeAngle * M_PI/180;
    superFuxkOriX = frameData[CannonShootAnim.spriteData[kCannonPart_Back].firstFrame + cannon_aniTime].x * wholeCannonScaleFromSocurce * aniControlValueForFuckingIpad;
    superFuxkOriY = frameData[CannonShootAnim.spriteData[kCannonPart_Back].firstFrame + cannon_aniTime].y * wholeCannonScaleFromSocurce * aniControlValueForFuckingIpad;
    cannon_Back_x = cannon_X + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff) - superFuxkOffsetX * wholeCannonScaleFromSocurce;
    cannon_Back_y = cannon_Y + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff) - superFuxkOffsetY * wholeCannonScaleFromSocurce;
    
    superFuxkAngleDiff = -rotateDegreeAngle * M_PI/180;
    superFuxkOriX = frameData[CannonShootAnim.spriteData[kCannonPart_Body].firstFrame + cannon_aniTime].x * wholeCannonScaleFromSocurce * aniControlValueForFuckingIpad;
    superFuxkOriY = frameData[CannonShootAnim.spriteData[kCannonPart_Body].firstFrame + cannon_aniTime].y * wholeCannonScaleFromSocurce * aniControlValueForFuckingIpad;
    cannon_Body_x = cannon_X + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff) - superFuxkOffsetX * wholeCannonScaleFromSocurce;
    cannon_Body_y = cannon_Y + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff) - superFuxkOffsetY * wholeCannonScaleFromSocurce;
    
    superFuxkAngleDiff = -rotateDegreeAngle * M_PI/180;
    superFuxkOriX = frameData[CannonShootAnim.spriteData[kCannonPart_Front].firstFrame + cannon_aniTime].x * wholeCannonScaleFromSocurce * aniControlValueForFuckingIpad;
    superFuxkOriY = frameData[CannonShootAnim.spriteData[kCannonPart_Front].firstFrame + cannon_aniTime].y * wholeCannonScaleFromSocurce * aniControlValueForFuckingIpad;
    cannon_Front_x = cannon_X + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff) - superFuxkOffsetX * wholeCannonScaleFromSocurce;
    cannon_Front_y = cannon_Y + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff) - superFuxkOffsetY * wholeCannonScaleFromSocurce;
    
    superFuxkAngleDiff = -rotateDegreeAngle * M_PI/180;
    superFuxkOriX = frameData[CannonShootAnim.spriteData[kCannonPart_Wood].firstFrame + cannon_aniTime].x * wholeCannonScaleFromSocurce * aniControlValueForFuckingIpad;
    superFuxkOriY = frameData[CannonShootAnim.spriteData[kCannonPart_Wood].firstFrame + cannon_aniTime].y * wholeCannonScaleFromSocurce * aniControlValueForFuckingIpad;
    cannon_Wood_x = cannon_X + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff) - superFuxkOffsetX * wholeCannonScaleFromSocurce;
    cannon_Wood_y = cannon_Y + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff) - superFuxkOffsetY * wholeCannonScaleFromSocurce;
}

-(void) setY:(int)_y{
    cannon_Y = _y;
    
    if(!isPlayingMiniGame){
        return;
    }
    
    static float superFuxkAngleDiff;
    static float superFuxkOriX;
    static float superFuxkOriY;
    static float superFuxkOffsetX;
    static float superFuxkOffsetY;
    
    superFuxkOffsetX = -58 * cos(rotateDegreeAngle * M_PI/180 + M_PI/2);
    superFuxkOffsetY = 58 * sin(rotateDegreeAngle * M_PI/180 + M_PI/2) - 58;
    
    superFuxkAngleDiff = -rotateDegreeAngle * M_PI/180;
    superFuxkOriX = frameData[CannonShootAnim.spriteData[kCannonPart_Back].firstFrame + cannon_aniTime].x * wholeCannonScaleFromSocurce * aniControlValueForFuckingIpad;
    superFuxkOriY = frameData[CannonShootAnim.spriteData[kCannonPart_Back].firstFrame + cannon_aniTime].y * wholeCannonScaleFromSocurce * aniControlValueForFuckingIpad;
    cannon_Back_x = cannon_X + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff) - superFuxkOffsetX * wholeCannonScaleFromSocurce;
    cannon_Back_y = cannon_Y + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff) - superFuxkOffsetY * wholeCannonScaleFromSocurce;
    
    superFuxkAngleDiff = -rotateDegreeAngle * M_PI/180;
    superFuxkOriX = frameData[CannonShootAnim.spriteData[kCannonPart_Body].firstFrame + cannon_aniTime].x * wholeCannonScaleFromSocurce * aniControlValueForFuckingIpad;
    superFuxkOriY = frameData[CannonShootAnim.spriteData[kCannonPart_Body].firstFrame + cannon_aniTime].y * wholeCannonScaleFromSocurce * aniControlValueForFuckingIpad;
    cannon_Body_x = cannon_X + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff) - superFuxkOffsetX * wholeCannonScaleFromSocurce;
    cannon_Body_y = cannon_Y + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff) - superFuxkOffsetY * wholeCannonScaleFromSocurce;
    
    superFuxkAngleDiff = -rotateDegreeAngle * M_PI/180;
    superFuxkOriX = frameData[CannonShootAnim.spriteData[kCannonPart_Front].firstFrame + cannon_aniTime].x * wholeCannonScaleFromSocurce * aniControlValueForFuckingIpad;
    superFuxkOriY = frameData[CannonShootAnim.spriteData[kCannonPart_Front].firstFrame + cannon_aniTime].y * wholeCannonScaleFromSocurce * aniControlValueForFuckingIpad;
    cannon_Front_x = cannon_X + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff) - superFuxkOffsetX * wholeCannonScaleFromSocurce;
    cannon_Front_y = cannon_Y + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff) - superFuxkOffsetY * wholeCannonScaleFromSocurce;
    
    superFuxkAngleDiff = -rotateDegreeAngle * M_PI/180;
    superFuxkOriX = frameData[CannonShootAnim.spriteData[kCannonPart_Wood].firstFrame + cannon_aniTime].x * wholeCannonScaleFromSocurce * aniControlValueForFuckingIpad;
    superFuxkOriY = frameData[CannonShootAnim.spriteData[kCannonPart_Wood].firstFrame + cannon_aniTime].y * wholeCannonScaleFromSocurce * aniControlValueForFuckingIpad;
    cannon_Wood_x = cannon_X + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff) - superFuxkOffsetX * wholeCannonScaleFromSocurce;
    cannon_Wood_y = cannon_Y + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff) - superFuxkOffsetY * wholeCannonScaleFromSocurce;
}

-(float) x{
    return cannon_X;
}

-(float) y{
    return cannon_Y;
}

-(float) cannonFrontX{
    return s_Cannon_Front.position.x;
}

-(float) cannonFrontY{
    return s_Cannon_Front.position.y;
}

-(void) setRotateDegree:(float)_angle{
    rotateDegreeAngle = _angle;

    if(cannon_status == kCannonStatus_Idle){
        [self setCannonStatus:kCannonStatus_Idle];
    }
}

-(void) setReverse{
    [s_Cannon_Back setScaleX:-1];
    [s_Cannon_Body setScaleX:-1];
    [s_Cannon_Front setScaleX:-1];
    [s_Cannon_Wood setScaleX:-1];
}

-(void) initOriValues{
    rotateDegreeAngle = 0;
    
    /*oriRadius_Back[0] = sqrt(43.75*43.75 + 23.30000000000001*23.30000000000001);
    oriAngle_Back = -0.881045593947644;
    
    oriRadius_Body = sqrt(31.05000000000001*31.05000000000001 + 113.94999999999999*113.94999999999999);
    oriAngle_Body = -0.881045593947644;
    
    oriRadius_Front = sqrt(99.30000000000001*99.30000000000001 + 196.7*196.7);
    oriAngle_Front = -0.881045593947644;*/
}

-(void) MAIN_SETSHOOT{
    MAIN_SHOOT = true;
}

-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
        
        delegate = nil;
        MAIN_SHOOT = false;
        MAIN_SHOOTSHOOT = false;
        MAIN_TIMER = 0;
        
        [self initOriValues];
        
        cannon_status = kCannonStatus_Idle;
        
        if(isPlayingMiniGame){
            s_Cannon_Back = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(106/textureRatioForFuckingIpad,610/textureRatioForFuckingIpad,42/textureRatioForFuckingIpad,42/textureRatioForFuckingIpad)];
            s_Cannon_Body = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1430/textureRatioForFuckingIpad,370/textureRatioForFuckingIpad,212/textureRatioForFuckingIpad,112/textureRatioForFuckingIpad)];
            s_Cannon_Front = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1648/textureRatioForFuckingIpad,370/textureRatioForFuckingIpad,30/textureRatioForFuckingIpad,110/textureRatioForFuckingIpad)];
            s_Cannon_Wood = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1430/textureRatioForFuckingIpad,486/textureRatioForFuckingIpad,114/textureRatioForFuckingIpad,118/textureRatioForFuckingIpad)];
        }else{
            
            /*s_Cannon_Back = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1926/textureRatioForFuckingIpad,828/textureRatioForFuckingIpad,42/textureRatioForFuckingIpad,42/textureRatioForFuckingIpad)];
            s_Cannon_Body = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1330/textureRatioForFuckingIpad,0/textureRatioForFuckingIpad,212/textureRatioForFuckingIpad,112/textureRatioForFuckingIpad)];
            s_Cannon_Front = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1548/textureRatioForFuckingIpad,0/textureRatioForFuckingIpad,30/textureRatioForFuckingIpad,110/textureRatioForFuckingIpad)];
            s_Cannon_Wood = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1582/textureRatioForFuckingIpad,0/textureRatioForFuckingIpad,114/textureRatioForFuckingIpad,118/textureRatioForFuckingIpad)];*/
            
            s_Cannon_Back = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1646/textureRatioForFuckingIpad,464/textureRatioForFuckingIpad,42/textureRatioForFuckingIpad,40/textureRatioForFuckingIpad)];
            s_Cannon_Body = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1328/textureRatioForFuckingIpad,0/textureRatioForFuckingIpad,214/textureRatioForFuckingIpad,118/textureRatioForFuckingIpad)];
            s_Cannon_Front = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1546/textureRatioForFuckingIpad,0/textureRatioForFuckingIpad,54/textureRatioForFuckingIpad,110/textureRatioForFuckingIpad)];
            s_Cannon_Wood = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1290/textureRatioForFuckingIpad,1494/textureRatioForFuckingIpad,116/textureRatioForFuckingIpad,118/textureRatioForFuckingIpad)];
            
    
            if(playerCannon == 1){
                [s_Cannon_Body setTextureRect:CGRectMake(1328/textureRatioForFuckingIpad,0/textureRatioForFuckingIpad,214/textureRatioForFuckingIpad,118/textureRatioForFuckingIpad)];
                [s_Cannon_Front setTextureRect:CGRectMake(1546/textureRatioForFuckingIpad,0/textureRatioForFuckingIpad,54/textureRatioForFuckingIpad,110/textureRatioForFuckingIpad)];
                [s_Cannon_Wood setTextureRect:CGRectMake(1290/textureRatioForFuckingIpad,1494/textureRatioForFuckingIpad,116/textureRatioForFuckingIpad,118/textureRatioForFuckingIpad)];
            }
            if(playerCannon == 2){
                [s_Cannon_Body setTextureRect:CGRectMake(1328/textureRatioForFuckingIpad,0/textureRatioForFuckingIpad,214/textureRatioForFuckingIpad,118/textureRatioForFuckingIpad)];
                [s_Cannon_Front setTextureRect:CGRectMake(1688/textureRatioForFuckingIpad,1118/textureRatioForFuckingIpad,54/textureRatioForFuckingIpad,110/textureRatioForFuckingIpad)];
                [s_Cannon_Wood setTextureRect:CGRectMake(992/textureRatioForFuckingIpad,1366/textureRatioForFuckingIpad,116/textureRatioForFuckingIpad,118/textureRatioForFuckingIpad)];
            }
            if(playerCannon == 3){
                [s_Cannon_Body setTextureRect:CGRectMake(1114/textureRatioForFuckingIpad,1366/textureRatioForFuckingIpad,212/textureRatioForFuckingIpad,116/textureRatioForFuckingIpad)];
                [s_Cannon_Front setTextureRect:CGRectMake(1330/textureRatioForFuckingIpad,1366/textureRatioForFuckingIpad,54/textureRatioForFuckingIpad,110/textureRatioForFuckingIpad)];
                [s_Cannon_Wood setTextureRect:CGRectMake(992/textureRatioForFuckingIpad,1366/textureRatioForFuckingIpad,116/textureRatioForFuckingIpad,118/textureRatioForFuckingIpad)];
            }
            if(playerCannon == 4){
                [s_Cannon_Body setTextureRect:CGRectMake(1392/textureRatioForFuckingIpad,1366/textureRatioForFuckingIpad,212/textureRatioForFuckingIpad,116/textureRatioForFuckingIpad)];
                [s_Cannon_Front setTextureRect:CGRectMake(1630/textureRatioForFuckingIpad,1072/textureRatioForFuckingIpad,54/textureRatioForFuckingIpad,110/textureRatioForFuckingIpad)];
                [s_Cannon_Wood setTextureRect:CGRectMake(1572/textureRatioForFuckingIpad,950/textureRatioForFuckingIpad,116/textureRatioForFuckingIpad,118/textureRatioForFuckingIpad)];
            }
            if(playerCannon == 5){
                [s_Cannon_Body setTextureRect:CGRectMake(1392/textureRatioForFuckingIpad,1244/textureRatioForFuckingIpad,212/textureRatioForFuckingIpad,118/textureRatioForFuckingIpad)];
                [s_Cannon_Front setTextureRect:CGRectMake(1572/textureRatioForFuckingIpad,1072/textureRatioForFuckingIpad,54/textureRatioForFuckingIpad,110/textureRatioForFuckingIpad)];
                [s_Cannon_Wood setTextureRect:CGRectMake(1272/textureRatioForFuckingIpad,1244/textureRatioForFuckingIpad,116/textureRatioForFuckingIpad,118/textureRatioForFuckingIpad)];
            }

            
            [s_Cannon_Front setAnchorPoint:ccp(37.0/54.0,0.5)];
            
            if(playerCannon == 0){
                [s_Cannon_Body setTextureRect:CGRectMake(1052/textureRatioForFuckingIpad,1244/textureRatioForFuckingIpad,212/textureRatioForFuckingIpad,112/textureRatioForFuckingIpad)];
                [s_Cannon_Wood setTextureRect:CGRectMake(936/textureRatioForFuckingIpad,1244/textureRatioForFuckingIpad,114/textureRatioForFuckingIpad,118/textureRatioForFuckingIpad)];
                [s_Cannon_Front setTextureRect:CGRectMake(900/textureRatioForFuckingIpad,1244/textureRatioForFuckingIpad,32/textureRatioForFuckingIpad,110/textureRatioForFuckingIpad)];
                [s_Cannon_Front setAnchorPoint:ccp(0.5,0.5)];
            }
        }
        
        
        // [s_Cannon_Back setAnchorPoint:ccp()];
        
        [ss_Character addChild:s_Cannon_Back z:kDeapth_Bg_Element1];
        [ss_Character addChild:s_Cannon_Body z:kDeapth_Bg_Element1];
        [ss_Character addChild:s_Cannon_Front z:kDeapth_Bg_Element1];
        [ss_Character addChild:s_Cannon_Wood z:kDeapth_Bg_Element1];
        
        if(currentChosenMiniGame == 5){
            cannon_X = 80;
            cannon_Y = 7;
        }
        if(currentChosenMiniGame == 3){
            cannon_X = 70000;
            cannon_Y = 7;
        }
        
    }
    
	return self;
}


-(void) setCannonStatus:(int)_cannonStatus{
    static float superFuxkAngleDiff;
    static float superFuxkOriX;
    static float superFuxkOriY;
    static float superFuxkOffsetX;
    static float superFuxkOffsetY;
    
    superFuxkOffsetX = -58 * cos(rotateDegreeAngle * M_PI/180 + M_PI/2);
    superFuxkOffsetY = 58 * sin(rotateDegreeAngle * M_PI/180 + M_PI/2) - 58;
    
    if(_cannonStatus == kCannonStatus_Idle){
        superFuxkAngleDiff = -rotateDegreeAngle * M_PI/180;
        superFuxkOriX = frameData[CannonShootAnim.spriteData[kCannonPart_Back].firstFrame + 0].x * wholeCannonScaleFromSocurce * aniControlValueForFuckingIpad;
        superFuxkOriY = frameData[CannonShootAnim.spriteData[kCannonPart_Back].firstFrame + 0].y * wholeCannonScaleFromSocurce * aniControlValueForFuckingIpad;
        cannon_Back_x = cannon_X + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff) - superFuxkOffsetX * wholeCannonScaleFromSocurce;
        cannon_Back_y = cannon_Y + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff) - superFuxkOffsetY * wholeCannonScaleFromSocurce;
        
        superFuxkAngleDiff = -rotateDegreeAngle * M_PI/180;
        superFuxkOriX = frameData[CannonShootAnim.spriteData[kCannonPart_Body].firstFrame + 0].x * wholeCannonScaleFromSocurce * aniControlValueForFuckingIpad;
        superFuxkOriY = frameData[CannonShootAnim.spriteData[kCannonPart_Body].firstFrame + 0].y * wholeCannonScaleFromSocurce * aniControlValueForFuckingIpad;
        cannon_Body_x = cannon_X + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff) - superFuxkOffsetX * wholeCannonScaleFromSocurce;
        cannon_Body_y = cannon_Y + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff) - superFuxkOffsetY * wholeCannonScaleFromSocurce;
        
        superFuxkAngleDiff = -rotateDegreeAngle * M_PI/180;
        superFuxkOriX = frameData[CannonShootAnim.spriteData[kCannonPart_Front].firstFrame + 0].x * wholeCannonScaleFromSocurce * aniControlValueForFuckingIpad;
        superFuxkOriY = frameData[CannonShootAnim.spriteData[kCannonPart_Front].firstFrame + 0].y * wholeCannonScaleFromSocurce * aniControlValueForFuckingIpad;
        cannon_Front_x = cannon_X + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff) - superFuxkOffsetX * wholeCannonScaleFromSocurce;
        cannon_Front_y = cannon_Y + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff) - superFuxkOffsetY * wholeCannonScaleFromSocurce;
        
        superFuxkAngleDiff = -rotateDegreeAngle * M_PI/180;
        superFuxkOriX = frameData[CannonShootAnim.spriteData[kCannonPart_Wood].firstFrame + 0].x * wholeCannonScaleFromSocurce * aniControlValueForFuckingIpad;
        superFuxkOriY = frameData[CannonShootAnim.spriteData[kCannonPart_Wood].firstFrame + 0].y * wholeCannonScaleFromSocurce * aniControlValueForFuckingIpad;
        cannon_Wood_x = cannon_X + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff) - superFuxkOffsetX * wholeCannonScaleFromSocurce;
        cannon_Wood_y = cannon_Y + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff) - superFuxkOffsetY * wholeCannonScaleFromSocurce;
        
        
        /*[s_Cannon_Back setPosition:ccp(cannon_X + frameData[CannonShootAnim.spriteData[kCannonPart_Back].firstFrame].x * wholeCannonScaleFromSocurce,
                                       cannon_Y + frameData[CannonShootAnim.spriteData[kCannonPart_Back].firstFrame].y * wholeCannonScaleFromSocurce)];
        [s_Cannon_Body setPosition:ccp(cannon_X + frameData[CannonShootAnim.spriteData[kCannonPart_Body].firstFrame].x * wholeCannonScaleFromSocurce,
                                       cannon_Y + frameData[CannonShootAnim.spriteData[kCannonPart_Body].firstFrame].y * wholeCannonScaleFromSocurce)];
        [s_Cannon_Front setPosition:ccp(cannon_X + frameData[CannonShootAnim.spriteData[kCannonPart_Front].firstFrame].x * wholeCannonScaleFromSocurce,
                                        cannon_Y + frameData[CannonShootAnim.spriteData[kCannonPart_Front].firstFrame].y * wholeCannonScaleFromSocurce)];
        [s_Cannon_Wood setPosition:ccp(cannon_X + frameData[CannonShootAnim.spriteData[kCannonPart_Wood].firstFrame].x * wholeCannonScaleFromSocurce,
                                       cannon_Y + frameData[CannonShootAnim.spriteData[kCannonPart_Wood].firstFrame].y * wholeCannonScaleFromSocurce)];*/
        
        [s_Cannon_Back setRotation:frameData[CannonShootAnim.spriteData[kCannonPart_Back].firstFrame].rotation * 180/M_PI + rotateDegreeAngle];
        [s_Cannon_Body setRotation:frameData[CannonShootAnim.spriteData[kCannonPart_Body].firstFrame].rotation * 180/M_PI + rotateDegreeAngle];
        [s_Cannon_Front setRotation:frameData[CannonShootAnim.spriteData[kCannonPart_Front].firstFrame].rotation * 180/M_PI + rotateDegreeAngle];
        [s_Cannon_Wood setRotation:frameData[CannonShootAnim.spriteData[kCannonPart_Wood].firstFrame].rotation * 180/M_PI];
        
        // printf("frameData[CannonShootAnim.spriteData[kCannonPart_Body].firstFrame].rotation:%4.8f\n",frameData[CannonShootAnim.spriteData[kCannonPart_Body].firstFrame].rotation);
        
        [s_Cannon_Back setScaleX:frameData[CannonShootAnim.spriteData[kCannonPart_Back].firstFrame].scaleX * wholeCannonScaleFromSocurce * 2];
        [s_Cannon_Body setScaleX:frameData[CannonShootAnim.spriteData[kCannonPart_Body].firstFrame].scaleX * wholeCannonScaleFromSocurce * 2];
        [s_Cannon_Front setScaleX:frameData[CannonShootAnim.spriteData[kCannonPart_Front].firstFrame].scaleX * wholeCannonScaleFromSocurce * 2];
        [s_Cannon_Wood setScaleX:frameData[CannonShootAnim.spriteData[kCannonPart_Wood].firstFrame].scaleX * wholeCannonScaleFromSocurce * 2];
        
        [s_Cannon_Back setScaleY:frameData[CannonShootAnim.spriteData[kCannonPart_Back].firstFrame].scaleY * wholeCannonScaleFromSocurce * 2];
        [s_Cannon_Body setScaleY:frameData[CannonShootAnim.spriteData[kCannonPart_Body].firstFrame].scaleY * wholeCannonScaleFromSocurce * 2];
        [s_Cannon_Front setScaleY:frameData[CannonShootAnim.spriteData[kCannonPart_Front].firstFrame].scaleY * wholeCannonScaleFromSocurce * 2];
        [s_Cannon_Wood setScaleY:frameData[CannonShootAnim.spriteData[kCannonPart_Wood].firstFrame].scaleY * wholeCannonScaleFromSocurce * 2];
        
    }
    if(_cannonStatus == kCannonStatus_Shooting){
        cannon_isAni = true;
        cannon_aniTime = 0;
    }
    
    cannon_status = _cannonStatus;
}

-(void) manage{
    
    
    if(cannon_isAni){
        cannon_aniTime++;
        
        if(cannon_aniTime == 3){
            if(delegate){
                [delegate cannonShootBall:idNumber];
                [musicController playThisSound:kSound_ComboSmoke isLoop:NO gain:1.0];
            }
        }

        
        [s_Cannon_Back setRotation:frameData[CannonShootAnim.spriteData[kCannonPart_Back].firstFrame + cannon_aniTime].rotation * 180/M_PI + rotateDegreeAngle];
        [s_Cannon_Body setRotation:frameData[CannonShootAnim.spriteData[kCannonPart_Body].firstFrame + cannon_aniTime].rotation * 180/M_PI + rotateDegreeAngle];
        [s_Cannon_Front setRotation:frameData[CannonShootAnim.spriteData[kCannonPart_Front].firstFrame + cannon_aniTime].rotation * 180/M_PI + rotateDegreeAngle];
        [s_Cannon_Wood setRotation:frameData[CannonShootAnim.spriteData[kCannonPart_Wood].firstFrame + cannon_aniTime].rotation * 180/M_PI];
        
        [s_Cannon_Back setScaleX:frameData[CannonShootAnim.spriteData[kCannonPart_Back].firstFrame + cannon_aniTime].scaleX];
        [s_Cannon_Body setScaleX:frameData[CannonShootAnim.spriteData[kCannonPart_Body].firstFrame + cannon_aniTime].scaleX];
        [s_Cannon_Front setScaleX:frameData[CannonShootAnim.spriteData[kCannonPart_Front].firstFrame + cannon_aniTime].scaleX];
        [s_Cannon_Wood setScaleX:frameData[CannonShootAnim.spriteData[kCannonPart_Wood].firstFrame + cannon_aniTime].scaleX];
        
        [s_Cannon_Back setScaleY:frameData[CannonShootAnim.spriteData[kCannonPart_Back].firstFrame + cannon_aniTime].scaleY];
        [s_Cannon_Body setScaleY:frameData[CannonShootAnim.spriteData[kCannonPart_Body].firstFrame + cannon_aniTime].scaleY];
        [s_Cannon_Front setScaleY:frameData[CannonShootAnim.spriteData[kCannonPart_Front].firstFrame + cannon_aniTime].scaleY];
        [s_Cannon_Wood setScaleY:frameData[CannonShootAnim.spriteData[kCannonPart_Wood].firstFrame + cannon_aniTime].scaleY];
        
        if(cannon_aniTime == 9){
            cannon_isAni = false;
            cannon_aniTime = 0;
            [self setCannonStatus:kCannonStatus_Idle];
        }
        
    }
    
    if(currentChosenMiniGame == 7){
        cannon_Wood_x = 99999;
        cannon_Back_x = 99999;
    }
    
    [s_Cannon_Body setPosition:ccp(cannon_Body_x,cannon_Body_y)];
    [s_Cannon_Front setPosition:ccp(cannon_Front_x,cannon_Front_y)];
    [s_Cannon_Wood setPosition:ccp(cannon_Wood_x,cannon_Wood_y)];
    [s_Cannon_Back setPosition:ccp(cannon_Back_x,cannon_Back_y)];
    
    
    if(currentChosenMiniGame == 102){
        if(isPlayingMiniGame){
             [s_Cannon_Wood setPosition:ccp(cannon_Wood_x-3,cannon_Wood_y)];
        }
    }
    
    //printf("FFF:%4.8f %4.8f\n",cannon_Body_x, cannon_Body_y);
}

-(void) setMAINSTARTSHOOTTIMER:(int)_startTimer{
    MAIN_STARTSHOOTTIMER = _startTimer;
}

-(void) setMAINPRESHOOTSPEED:(float)_speed{
    MAIN_PRESHOOTSPEED = _speed;
}

-(void) manageMAIN{
    
    static float cannon_Front_Begin_x = 181.5;
    static float cannon_Body_Begin_x = 74;
    static float cannon_Back_Begin_x = -43.75;
    
    static float cannon_Front_Final_x = 114.4;
    static float cannon_Body_Final_x = 37.8;
     static float cannon_Back_Final_x = -53.75;
    
    static float cannon_Front_Final_sx = 1.0;
    static float cannon_Body_Final_sx = 0.651;
    static float cannon_Back_Final_sx = 1.541;
    
    static float cannon_Front_Final_sy = 1.162;
    static float cannon_Body_Final_sy = 1.176;
    static float cannon_Back_Final_sy = 1.955;
    
    static float cannon_MAIN_Front_aniX;
    static float cannon_MAIN_Body_aniX;
    static float cannon_MAIN_Back_aniX;
    static float cannon_MAIN_Front_aniSX;
    static float cannon_MAIN_Body_aniSX;
    static float cannon_MAIN_Back_aniSX;
    static float cannon_MAIN_Front_aniSY;
    static float cannon_MAIN_Body_aniSY;
    static float cannon_MAIN_Back_aniSY;
    
    
    
    static float superFuxkAngleDiff;
    static float superFuxkOriX;
    static float superFuxkOriY;
   // static float superFuxkOffsetX;
   // static float superFuxkOffsetY;
    
    if(MAIN_TIMER == 0){
        cannon_MAIN_Front_aniX = cannon_Front_Begin_x;
        cannon_MAIN_Body_aniX = cannon_Body_Begin_x;
        cannon_MAIN_Back_aniX = cannon_Back_Begin_x;
        
        cannon_MAIN_Front_aniSX = 1.0;
        cannon_MAIN_Body_aniSX = 1.0;
        cannon_MAIN_Back_aniSX = 1.0;
        cannon_MAIN_Front_aniSY = 1.0;
        cannon_MAIN_Body_aniSY = 1.0;
        cannon_MAIN_Back_aniSY = 1.0;
        
    }
    
    if(MAIN_SHOOT){
        
        if(!MAIN_SHOOTSHOOT){
            
            cannon_MAIN_Front_aniX += (cannon_Front_Final_x - cannon_MAIN_Front_aniX)/MAIN_PRESHOOTSPEED;
            cannon_MAIN_Body_aniX += (cannon_Body_Final_x - cannon_MAIN_Body_aniX)/MAIN_PRESHOOTSPEED;
            cannon_MAIN_Back_aniX += (cannon_Back_Final_x - cannon_MAIN_Back_aniX)/MAIN_PRESHOOTSPEED;
            
            cannon_MAIN_Front_aniSX += (cannon_Front_Final_sx - cannon_MAIN_Front_aniSX)/MAIN_PRESHOOTSPEED;
            cannon_MAIN_Body_aniSX += (cannon_Body_Final_sx - cannon_MAIN_Body_aniSX)/MAIN_PRESHOOTSPEED;
            cannon_MAIN_Back_aniSX += (cannon_Back_Final_sx - cannon_MAIN_Back_aniSX)/MAIN_PRESHOOTSPEED;
            
            cannon_MAIN_Front_aniSY += (cannon_Front_Final_sy - cannon_MAIN_Front_aniSY)/MAIN_PRESHOOTSPEED;
            cannon_MAIN_Body_aniSY += (cannon_Body_Final_sy - cannon_MAIN_Body_aniSY)/MAIN_PRESHOOTSPEED;
            cannon_MAIN_Back_aniSY += (cannon_Back_Final_sy - cannon_MAIN_Back_aniSY)/MAIN_PRESHOOTSPEED;
            
                        
        }else{
        
            if(MAIN_TIMER == MAIN_STARTSHOOTTIMER+1){
                cannon_MAIN_Front_aniSX = 368.6 - 212.5;
                cannon_MAIN_Body_aniX = 272.2 - 212.5;
                cannon_MAIN_Back_aniX = 163.4 - 212.5;
                
                cannon_MAIN_Front_aniSX = 1.0;
                cannon_MAIN_Front_aniSY = 0.995;
                cannon_MAIN_Body_aniSX = 0.962;
                cannon_MAIN_Body_aniSY = 1.029;
                cannon_MAIN_Back_aniSX = 1.261;
                cannon_MAIN_Back_aniSY = 1.524;
            }
            if(MAIN_TIMER == MAIN_STARTSHOOTTIMER+2){
                cannon_MAIN_Front_aniSX = 410.05 - 212.5;
                cannon_MAIN_Body_aniX = 294.0 - 212.5;
                cannon_MAIN_Back_aniX = 168.05 - 212.5;
                
                cannon_MAIN_Front_aniSX = 1.0;
                cannon_MAIN_Front_aniSY = 0.829;
                cannon_MAIN_Body_aniSX = 1.073;
                cannon_MAIN_Body_aniSY = 0.882;
                cannon_MAIN_Back_aniSX = 0.983;
                cannon_MAIN_Back_aniSY = 1.096;
            }
            if(MAIN_TIMER == MAIN_STARTSHOOTTIMER+3){
                cannon_MAIN_Front_aniSX = 441.1 - 212.5;
                cannon_MAIN_Body_aniX = 310.35 - 212.5;
                cannon_MAIN_Back_aniX = 171.5 - 212.5;
                
                cannon_MAIN_Front_aniSX = 1.0;
                cannon_MAIN_Front_aniSY = 0.704;
                cannon_MAIN_Body_aniSX = 1.23;
                cannon_MAIN_Body_aniSY = 0.772;
                cannon_MAIN_Back_aniSX = 0.775;
                cannon_MAIN_Back_aniSY = 0.775;
            }
            if(MAIN_TIMER == MAIN_STARTSHOOTTIMER+4){
                cannon_MAIN_Front_aniSX = 423.3 - 212.5;
                cannon_MAIN_Body_aniX = 301.35 - 212.5;
                cannon_MAIN_Back_aniX = 170.45 - 212.5;
                
                cannon_MAIN_Front_aniSX = 1.0;
                cannon_MAIN_Front_aniSY = 0.816;
                cannon_MAIN_Body_aniSX = 1.143;
                cannon_MAIN_Body_aniSY = 0.858;
                cannon_MAIN_Back_aniSX = 0.86;
                cannon_MAIN_Back_aniSY = 0.86;
            }
            if(MAIN_TIMER == MAIN_STARTSHOOTTIMER+5){
                cannon_MAIN_Front_aniSX = 405.6 - 212.5;
                cannon_MAIN_Body_aniX = 292.35 - 212.5;
                cannon_MAIN_Back_aniX = 169.45 - 212.5;
                
                cannon_MAIN_Front_aniSX = 1.0;
                cannon_MAIN_Front_aniSY = 0.927;
                cannon_MAIN_Body_aniSX = 1.057;
                cannon_MAIN_Body_aniSY = 0.944;
                cannon_MAIN_Back_aniSX = 0.944;
                cannon_MAIN_Back_aniSY = 0.944;
            }
            
            if(MAIN_TIMER == MAIN_STARTSHOOTTIMER+6){
                cannon_MAIN_Front_aniX = cannon_Front_Begin_x;
                cannon_MAIN_Body_aniX = cannon_Body_Begin_x;
                cannon_MAIN_Back_aniX = cannon_Back_Begin_x;
                
                cannon_MAIN_Front_aniSX = 1.0;
                cannon_MAIN_Body_aniSX = 1.0;
                cannon_MAIN_Back_aniSX = 1.0;
                cannon_MAIN_Front_aniSY = 1.0;
                cannon_MAIN_Body_aniSY = 1.0;
                cannon_MAIN_Back_aniSY = 1.0;
                
                MAIN_SHOOT = false;

            }
        }
        
        if(MAIN_TIMER == MAIN_STARTSHOOTTIMER){
            MAIN_SHOOTSHOOT = true;
            
            if(delegate){
                [delegate cannonShootBall:idNumber];
                [musicController playThisSound:kSound_ComboSmoke isLoop:NO gain:1.0];
            }
        }
        
        
        MAIN_TIMER++;
    }
    
    
    
    superFuxkAngleDiff = -rotateDegreeAngle * M_PI/180;
    superFuxkOriX = cannon_MAIN_Back_aniX * wholeCannonScaleFromSocurce * aniControlValueForFuckingIpad;
    superFuxkOriY = 17.85 * wholeCannonScaleFromSocurce * aniControlValueForFuckingIpad;
    cannon_Back_x = cannon_X + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
    cannon_Back_y = cannon_Y + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
    
    superFuxkAngleDiff = -rotateDegreeAngle * M_PI/180;
    superFuxkOriX = cannon_MAIN_Body_aniX * wholeCannonScaleFromSocurce * aniControlValueForFuckingIpad;
    superFuxkOriY = 17.85 * wholeCannonScaleFromSocurce * aniControlValueForFuckingIpad;
    cannon_Body_x = cannon_X + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
    cannon_Body_y = cannon_Y + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
    
    superFuxkAngleDiff = -rotateDegreeAngle * M_PI/180;
    superFuxkOriX = cannon_MAIN_Front_aniX * wholeCannonScaleFromSocurce * aniControlValueForFuckingIpad;
    superFuxkOriY = 17.85 * wholeCannonScaleFromSocurce * aniControlValueForFuckingIpad;
    cannon_Front_x = cannon_X + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
    cannon_Front_y = cannon_Y + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
    
    superFuxkAngleDiff = -rotateDegreeAngle * M_PI/180;
    superFuxkOriX = 24.6 * wholeCannonScaleFromSocurce * aniControlValueForFuckingIpad;
    superFuxkOriY = 0;
    cannon_Wood_x = cannon_X + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
    cannon_Wood_y = cannon_Y + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
    
    
    if(MAIN_SHOOT && !MAIN_SHOOTSHOOT){
        [delegate setScreenOffsetXFromExternal:-9999];
        [delegate setScreenOffsetYFromExternal:-9999];
    }

    
    
    [s_Cannon_Back setRotation:rotateDegreeAngle];
    [s_Cannon_Body setRotation:rotateDegreeAngle];
    [s_Cannon_Front setRotation:rotateDegreeAngle];
    [s_Cannon_Wood setRotation:0];

    
    [s_Cannon_Body setPosition:ccp(cannon_Body_x,cannon_Body_y)];
    [s_Cannon_Front setPosition:ccp(cannon_Front_x,cannon_Front_y)];
    [s_Cannon_Wood setPosition:ccp(cannon_Wood_x,cannon_Wood_y)];
    [s_Cannon_Back setPosition:ccp(cannon_Back_x,cannon_Back_y)];
    
    [s_Cannon_Back setScaleX:cannon_MAIN_Back_aniSX];
    [s_Cannon_Body setScaleX:cannon_MAIN_Body_aniSX];
    [s_Cannon_Front setScaleX:cannon_MAIN_Front_aniSX];
  //  printf("cannon_MAIN_Body_aniSX %4.8f\n",cannon_MAIN_Body_aniSX);
    
    [s_Cannon_Back setScaleY:cannon_MAIN_Back_aniSY];
    [s_Cannon_Body setScaleY:cannon_MAIN_Front_aniSY];
    [s_Cannon_Front setScaleY:cannon_MAIN_Body_aniSY];
    
    [s_Cannon_Wood setScaleX:frameData[CannonShootAnim.spriteData[kCannonPart_Wood].firstFrame + 0].scaleX];
    [s_Cannon_Wood setScaleY:frameData[CannonShootAnim.spriteData[kCannonPart_Wood].firstFrame + 0].scaleY];
    
}

@end
