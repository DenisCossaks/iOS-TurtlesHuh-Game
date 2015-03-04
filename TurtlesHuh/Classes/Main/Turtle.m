//
//  Turtle.m
//  BombTheTurtle
//
//  Created by  on 2012/4/12.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "Turtle.h"
#import "GamePlayGlobal.h"
#import "animationDefs.h"
#import "Global.h"
#import "MainGamePlayGlobal.h"

@implementation Turtle

-(void) setScaleYForShell:(float)_scaleY{
    turtle_Shell_scaleY = _scaleY;
}

-(void) setScaleXForShell:(float)_scaleX{
    turtle_Shell_scaleX = _scaleX;
}

-(float) rotation{
    return turtleRotation;
}

-(void) collisionOnWall{
    turtleVX *= -1;
}

-(void) resetHurtTime{
    hurtTime = 0;
}

-(void) setRotation:(float)_rotation{
    turtleRotation = _rotation;
}

-(void) setWholeScale:(float)_wholeScale{
    wholeTurtleScaleFromSocurce = _wholeScale * 0.5;
    isChangingWholeScale = true;
}


-(void) setDelegate:(id)_delegate{
    delegate = _delegate;
}

-(int) shellLevel{
    return shellLevel;
}

-(int) hurtTime{
    return hurtTime;
}

-(float) x{
    return turtleX;
}
-(float) y{
    return turtleY;
}

-(int) color{
    return color;
}

-(int) idNumber{
    return idNumber;
}

-(void) setFacingRight:(bool)_isRight{
    isFacingRight = _isRight;
}

-(void) setExternalOffsetFinalX:(float)_ex{
    externalOffsetFinalX = _ex;
}

-(void) setExternalOffsetFinalY:(float)_ey{
    externalOffsetFinalY = _ey;
}

-(void) setExternalOffsetFinalXALL:(float)_ex{
    externalOffsetFinalX = _ex;
    externalOffsetX2 = _ex;
}

-(void) setIdNumber:(int)_idNumber{
    idNumber = _idNumber;
}

-(void) setMomentIdx:(int)_momentIdx{
    momentIdx = _momentIdx;
}

-(void) setColor:(int)_color{
    color = _color;

}

-(void) setGravity:(bool)_gravity{
    isGravity = _gravity;
    
     turtleAX = 0;
     turtleAY = -0.75;
     turtleVX = 0;
     turtleVY = 0;
     turtleVR = 0;
     turtleAR = 0;
}

-(void) bombOutOffScreenDirection:(int)_bomOutOffScreenDirection{
    bombOutOffScreenDirection = _bomOutOffScreenDirection;
}

-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
        
       // printf("turtle init\n");
        
        delegate = nil;
        
        isBombShell = false;
        
        isGravity = false;
        
        isChangingWholeScale = false;
        
        color = kTurtleShellColor_BrownOri;
        
        turtleRotation = 0;
        
        isFacingRight = false;
        isYellowHurt = false;
        
        turtle_HeadAndNeck_x = 9999;
        turtle_Head_x = 9999;
        turtle_Jaw_x = 9999;
        turtle_Neck_x = 9999;
        turtle_Shell_x = 9999;
        turtle_LeftLeg_x = 9999;
        turtle_RightLeg_x = 9999;
        turtle_Tail_x = 9999;
        turtle_Shadow_x = 9999;
        turtle_Eye_x = 9999;
        turtle_Spike_x[0] = 9999;
        turtle_Spike_x[1] = 9999;
        turtle_Spike_x[2] = 9999;
        turtle_Spike_x[3] = 9999;
        
        turtle_HeadAndNeck_y = 9999;
        turtle_Head_y = 9999;
        turtle_Jaw_y = 9999;
        turtle_Neck_y = 9999;
        turtle_Shell_y = 9999;
        turtle_LeftLeg_y = 9999;
        turtle_RightLeg_y = 9999;
        turtle_Tail_y = 9999;
        turtle_Shadow_y = 9999;
        turtle_Eye_y = 9999;
        turtle_Spike_y[0] = 9999;
        turtle_Spike_y[1] = 9999;
        turtle_Spike_y[2] = 9999;
        turtle_Spike_y[3] = 9999;
        
       
        
        if(isIpad){
            s_Turtle_HeadAndNeck = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(0,0,0,0)];
            s_Turtle_Head = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(226,162,132,107)];
            s_Turtle_Neck = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(360,204,29,59)];
            s_Turtle_Shell = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(396,204,108,70)];
            s_Turtle_LeftLeg = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(360,162,34,38)];
            s_Turtle_RightLeg = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(360,162,34,38)];
            s_Turtle_Tail = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(396,162,44,29)];
            s_Turtle_Shadow = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(226,278,152,12)];
            s_Turtle_Eye = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(226,278,0,0)];
            s_Turtle_Jaw = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1976,320,58,51)];
        }else{
            s_Turtle_HeadAndNeck = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(0,0,0,0)];
            s_Turtle_Head = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(226/2,162/2,132/2,107/2)];
            s_Turtle_Neck = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(360/2,204/2,29/2,59/2)];
            s_Turtle_Shell = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(396/2,204/2,108/2,70/2)];
            s_Turtle_LeftLeg = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(360/2,162/2,34/2,38/2)];
            s_Turtle_RightLeg = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(360/2,162/2,34/2,38/2)];
            s_Turtle_Tail = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(396/2,162/2,44/2,29/2)];
            s_Turtle_Shadow = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(226/2,278/2,152/2,12/2)];
            s_Turtle_Eye = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(226/2,278/2,0/2,0/2)];
            s_Turtle_Jaw = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1976/2,320/2,58/2,51/2)];
        }
        
        
        [ss_Character addChild:s_Turtle_HeadAndNeck z:kDeapth_Turtle_HeadAndNeck];
        [ss_Character addChild:s_Turtle_Head z:kDeapth_Turtle_Head];
        [ss_Character addChild:s_Turtle_Neck z:kDeapth_Turtle_Neck];
        [ss_Character addChild:s_Turtle_Shell z:kDeapth_Turtle_Shell];
        [ss_Character addChild:s_Turtle_LeftLeg z:kDeapth_Turtle_LeftLeg];
        [ss_Character addChild:s_Turtle_RightLeg z:kDeapth_Turtle_RightLeg];
        [ss_Character addChild:s_Turtle_Tail z:kDeapth_Turtle_Tail];
        [ss_Character addChild:s_Turtle_Shadow z:kDeapth_Turtle_Shadow];
        [ss_Character addChild:s_Turtle_Eye z:kDeapth_Turtle_Eye];
        [ss_Character addChild:s_Turtle_Jaw z:kDeapth_Turtle_Eye];
        
        [s_Turtle_Shell setAnchorPoint:ccp(54/108.0, 1.0 - 46.0/71.0)];
        [s_Turtle_LeftLeg setAnchorPoint:ccp(33.0/67.0, 1.0 - 38.0/76.0)];
        [s_Turtle_RightLeg setAnchorPoint:ccp(33.0/67.0, 1.0 - 38.0/76.0)];
        [s_Turtle_Tail setAnchorPoint:ccp(44.0/88.0, 1.0 - 28.0/57.0)];
        [s_Turtle_Shadow setAnchorPoint:ccp(152.0/304.0, 1.0 - 12.0/26.0)];
        [s_Turtle_HeadAndNeck setAnchorPoint:ccp(217.0/226.0, 10.0/159.0)];
        [s_Turtle_Head setAnchorPoint:ccp(175.0/264.0, 1.0-181.0/213.0)];
        [s_Turtle_Neck setAnchorPoint:ccp(29.0/58.0, 1.0-58.0/118.0)];
        [s_Turtle_Eye setAnchorPoint:ccp(20.0/48.0, 1.0-63.0/98.0)];
        [s_Turtle_Jaw setAnchorPoint:ccp(57.0/113.0, 1.0-52.0/102.0)];
        
        [s_Turtle_HeadAndNeck setScale:wholeTurtleScaleFromSocurce * 2]; 
        [s_Turtle_Head setScale:wholeTurtleScaleFromSocurce * 2]; 
        [s_Turtle_Neck setScale:wholeTurtleScaleFromSocurce * 2]; 
        [s_Turtle_Shell setScale:wholeTurtleScaleFromSocurce * 2]; 
        [s_Turtle_LeftLeg setScale:wholeTurtleScaleFromSocurce * 2]; 
        [s_Turtle_RightLeg setScale:wholeTurtleScaleFromSocurce * 2]; 
        [s_Turtle_Tail setScale:wholeTurtleScaleFromSocurce * 2]; 
        [s_Turtle_Shadow setScale:wholeTurtleScaleFromSocurce * 2]; 
        [s_Turtle_Eye setScale:wholeTurtleScaleFromSocurce * 2]; 
        [s_Turtle_Jaw setScale:wholeTurtleScaleFromSocurce * 2]; 
        
        
        s_Turtle_Spike[0] = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(106/2,562/2,20/2,20/2)];
        s_Turtle_Spike[1] = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(134/2,562/2,24/2,24/2)];
        s_Turtle_Spike[2] = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(106/2,588/2,18/2,18/2)];
        s_Turtle_Spike[3] = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(134/2,588/2,18/2,16/2)];
        
        [ss_Character addChild:s_Turtle_Spike[0] z:kDeapth_Turtle_Spike];
        [ss_Character addChild:s_Turtle_Spike[1] z:kDeapth_Turtle_Spike];
        [ss_Character addChild:s_Turtle_Spike[2] z:kDeapth_Turtle_Spike];
        [ss_Character addChild:s_Turtle_Spike[3] z:kDeapth_Turtle_Spike];
        
        [s_Turtle_Spike[0] setPosition:ccp(1000,10000)];
        [s_Turtle_Spike[1] setPosition:ccp(1000,10000)];
        [s_Turtle_Spike[2] setPosition:ccp(1000,10000)];
        [s_Turtle_Spike[3] setPosition:ccp(1000,10000)];
        
        [s_Turtle_HeadAndNeck setPosition:ccp(10000,10000)];
        [s_Turtle_Head setPosition:ccp(10000,10000)];
        [s_Turtle_Neck setPosition:ccp(10000,10000)];
        [s_Turtle_Shell setPosition:ccp(10000,10000)];
        [s_Turtle_LeftLeg setPosition:ccp(10000,10000)];
        [s_Turtle_RightLeg setPosition:ccp(10000,10000)];
        [s_Turtle_Tail setPosition:ccp(10000,10000)];
        [s_Turtle_Shadow setPosition:ccp(10000,10000)];
        [s_Turtle_Eye setPosition:ccp(10000,10000)];
        [s_Turtle_Jaw setPosition:ccp(10000,10000)];
        
        
        
    }
    
	return self;
}

-(int) status{
    return status;
}

-(void) setX:(int)_x{
    //printf("se:%i\n",_x);
    turtleX = _x;
    
    if(!isPlayingMiniGame){
        return;
    }
    
    if(status == kTurtleAniStatus_Normal_In){
       // printf("IIIIIIIIIIIIIII\n");
        superFuxkAngleDiff = -turtleRotation * M_PI/180;
        superFuxkOriX =  frameData[turtleInAnim.spriteData[kTurtlePart_Shell].firstFrame + 12].x * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
        superFuxkOriY =  frameData[turtleInAnim.spriteData[kTurtlePart_Shell].firstFrame + 12].y * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
        turtle_Shell_x =  turtleX + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
        turtle_Shell_y =  turtleY + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
    }else{
        if(currentChosenMiniGame == 13){
            superFuxkAngleDiff = -turtleRotation * M_PI/180;
            superFuxkOriX =   frameData[turtleOutAnim.spriteData[kTurtlePart_Shell].firstFrame + 12].x * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
            superFuxkOriY =   frameData[turtleOutAnim.spriteData[kTurtlePart_Shell].firstFrame + 12].y * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
            turtle_Shell_x =  turtleX + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
            turtle_Shell_y =  turtleY + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
            
            superFuxkAngleDiff = -turtleRotation * M_PI/180;
            superFuxkOriX =   frameData[turtleOutAnim.spriteData[kTurtlePart_LeftLeg].firstFrame + 12].x * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
            superFuxkOriY =   frameData[turtleOutAnim.spriteData[kTurtlePart_LeftLeg].firstFrame + 12].y * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
            turtle_LeftLeg_x =  turtleX + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
            turtle_LeftLeg_y =  turtleY + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
            
            superFuxkAngleDiff = -turtleRotation * M_PI/180;
            superFuxkOriX =   frameData[turtleOutAnim.spriteData[kTurtlePart_RightLeg].firstFrame + 12].x * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
            superFuxkOriY =   frameData[turtleOutAnim.spriteData[kTurtlePart_RightLeg].firstFrame + 12].y * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
            turtle_RightLeg_x =  turtleX + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
            turtle_RightLeg_y =  turtleY + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
            
            superFuxkAngleDiff = -turtleRotation * M_PI/180;
            superFuxkOriX =   frameData[turtleOutAnim.spriteData[kTurtlePart_Tail].firstFrame + 12].x * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
            superFuxkOriY =   frameData[turtleOutAnim.spriteData[kTurtlePart_Tail].firstFrame + 12].y * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
            turtle_Tail_x =  turtleX + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
            turtle_Tail_y =  turtleY + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
            
            /*superFuxkAngleDiff = -turtleRotation * M_PI/180;
            superFuxkOriX =   frameData[turtleOutAnim.spriteData[kTurtlePart_Head].firstFrame + 12].x * wholeTurtleScaleFromSocurce;
            superFuxkOriY =   frameData[turtleOutAnim.spriteData[kTurtlePart_Head].firstFrame + 12].y * wholeTurtleScaleFromSocurce;
            turtle_Head_x =  turtleX + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
            turtle_Head_y =  turtleY + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);*/
            
            /*superFuxkAngleDiff = -turtleRotation * M_PI/180;
            superFuxkOriX =   frameData[turtleOutAnim.spriteData[kTurtlePart_Jaw].firstFrame + 12].x * wholeTurtleScaleFromSocurce;
            superFuxkOriY =   frameData[turtleOutAnim.spriteData[kTurtlePart_Jaw].firstFrame + 12].y * wholeTurtleScaleFromSocurce;
            turtle_Jaw_x =  turtleX + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
            turtle_Jaw_y =  turtleY + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
            
            superFuxkAngleDiff = -turtleRotation * M_PI/180;
            superFuxkOriX =   frameData[turtleOutAnim.spriteData[kTurtlePart_Neck].firstFrame + 12].x * wholeTurtleScaleFromSocurce;
            superFuxkOriY =   frameData[turtleOutAnim.spriteData[kTurtlePart_Neck].firstFrame + 12].y * wholeTurtleScaleFromSocurce;
            turtle_Neck_x =  turtleX + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
            turtle_Neck_y =  turtleY + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
            
            superFuxkAngleDiff = -turtleRotation * M_PI/180;
            superFuxkOriX =   frameData[turtleOutAnim.spriteData[kTurtlePart_Eye].firstFrame + 12].x * wholeTurtleScaleFromSocurce;
            superFuxkOriY =   frameData[turtleOutAnim.spriteData[kTurtlePart_Eye].firstFrame + 12].y * wholeTurtleScaleFromSocurce;
            turtle_Eye_x =  turtleX + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
            turtle_Eye_y =  turtleY + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);*/
        }
    }
        
        
}

-(void) setY:(int)_y{
    turtleY = _y;
    
    if(isPlayingMiniGame){
        if(status == kTurtleAniStatus_Normal_In){
            superFuxkAngleDiff = -turtleRotation * M_PI/180;
            superFuxkOriX =  frameData[turtleInAnim.spriteData[kTurtlePart_Shell].firstFrame + 12].x * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
            superFuxkOriY =  frameData[turtleInAnim.spriteData[kTurtlePart_Shell].firstFrame + 12].y * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
            turtle_Shell_x =  turtleX + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
            turtle_Shell_y =  turtleY + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
        }
    }else{
        return;
    }
    
}

-(void) setStatus:(int) _status{
    // printf("setStatus:%i\n", _status);
    
    
    
    if(_status == kTurtleAniStatus_Normal_Out){
        
        //hurtTime = 0;
        
        if(!isFacingRight){
 
            superFuxkAngleDiff = -turtleRotation * M_PI/180;
            superFuxkOriX =  frameData[turtleOutAnim.spriteData[kTurtlePart_Shell].firstFrame + 12].x * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
            superFuxkOriY =  frameData[turtleOutAnim.spriteData[kTurtlePart_Shell].firstFrame + 12].y * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
            turtle_Shell_x =  turtleX + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
            turtle_Shell_y =  turtleY + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
            
            superFuxkAngleDiff = -turtleRotation * M_PI/180;
            superFuxkOriX =  frameData[turtleOutAnim.spriteData[kTurtlePart_LeftLeg].firstFrame + 12].x * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
            superFuxkOriY =  frameData[turtleOutAnim.spriteData[kTurtlePart_LeftLeg].firstFrame + 12].y * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
            turtle_LeftLeg_x =  turtleX + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
            turtle_LeftLeg_y =  turtleY + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
            
            superFuxkAngleDiff = -turtleRotation * M_PI/180;
            superFuxkOriX =  frameData[turtleOutAnim.spriteData[kTurtlePart_RightLeg].firstFrame + 12].x * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
            superFuxkOriY =  frameData[turtleOutAnim.spriteData[kTurtlePart_RightLeg].firstFrame + 12].y * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
            turtle_RightLeg_x =  turtleX + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
            turtle_RightLeg_y =  turtleY + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
            
            superFuxkAngleDiff = -turtleRotation * M_PI/180;
            superFuxkOriX =  frameData[turtleOutAnim.spriteData[kTurtlePart_Tail].firstFrame + 12].x * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
            superFuxkOriY =  frameData[turtleOutAnim.spriteData[kTurtlePart_Tail].firstFrame + 12].y * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
            turtle_Tail_x =  turtleX + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
            turtle_Tail_y =  turtleY + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
            
            superFuxkAngleDiff = -turtleRotation * M_PI/180;
            superFuxkOriX =  frameData[turtleOutAnim.spriteData[kTurtlePart_Shadow].firstFrame + 12].x * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
            superFuxkOriY =  frameData[turtleOutAnim.spriteData[kTurtlePart_Shadow].firstFrame + 12].y * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
            turtle_Shadow_x =  turtleX + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
            turtle_Shadow_y =  turtleY + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);

            turtle_Shell_r = frameData[turtleOutAnim.spriteData[kTurtlePart_Shell].firstFrame + 12].rotation * 180/M_PI + turtleRotation;
            turtle_LeftLeg_r = frameData[turtleOutAnim.spriteData[kTurtlePart_LeftLeg].firstFrame + 12].rotation * 180/M_PI + turtleRotation;
            turtle_RightLeg_r = frameData[turtleOutAnim.spriteData[kTurtlePart_RightLeg].firstFrame + 12].rotation * 180/M_PI + turtleRotation;
            turtle_Tail_r = frameData[turtleOutAnim.spriteData[kTurtlePart_Tail].firstFrame + 12].rotation * 180/M_PI + turtleRotation;
            turtle_Shadow_r = frameData[turtleOutAnim.spriteData[kTurtlePart_Shadow].firstFrame + 12].rotation * 180/M_PI + turtleRotation;
            
            [s_Turtle_Shell setScaleX:frameData[turtleOutAnim.spriteData[kTurtlePart_Shell].firstFrame + 12].scaleX * wholeTurtleScaleFromSocurce * 2];
            [s_Turtle_LeftLeg setScaleX:frameData[turtleOutAnim.spriteData[kTurtlePart_LeftLeg].firstFrame + 12].scaleX * wholeTurtleScaleFromSocurce * 2];
            [s_Turtle_RightLeg setScaleX:frameData[turtleOutAnim.spriteData[kTurtlePart_RightLeg].firstFrame + 12].scaleX * wholeTurtleScaleFromSocurce * 2];
            [s_Turtle_Tail setScaleX:frameData[turtleOutAnim.spriteData[kTurtlePart_Tail].firstFrame + 12].scaleX * wholeTurtleScaleFromSocurce * 2];
            [s_Turtle_Shadow setScaleX:frameData[turtleOutAnim.spriteData[kTurtlePart_Shadow].firstFrame + 12].scaleX * wholeTurtleScaleFromSocurce * 2];
            
            [s_Turtle_Shell setScaleY:frameData[turtleOutAnim.spriteData[kTurtlePart_Shell].firstFrame + 12].scaleY * wholeTurtleScaleFromSocurce * 2];
            [s_Turtle_LeftLeg setScaleY:frameData[turtleOutAnim.spriteData[kTurtlePart_LeftLeg].firstFrame + 12].scaleY * wholeTurtleScaleFromSocurce * 2];
            [s_Turtle_RightLeg setScaleY:frameData[turtleOutAnim.spriteData[kTurtlePart_RightLeg].firstFrame + 12].scaleY * wholeTurtleScaleFromSocurce * 2];
            [s_Turtle_Tail setScaleY:frameData[turtleOutAnim.spriteData[kTurtlePart_Tail].firstFrame + 12].scaleY * wholeTurtleScaleFromSocurce * 2];
            [s_Turtle_Shadow setScaleY:frameData[turtleOutAnim.spriteData[kTurtlePart_Shadow].firstFrame + 12].scaleY * wholeTurtleScaleFromSocurce * 2];

            
        }else{
            
            superFuxkAngleDiff = -turtleRotation * M_PI/180;
            superFuxkOriX =  -frameData[turtleOutAnim.spriteData[kTurtlePart_Head].firstFrame + 12].x * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
            superFuxkOriY =  frameData[turtleOutAnim.spriteData[kTurtlePart_Head].firstFrame + 12].y * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
            turtle_Head_x =  turtleX + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
            turtle_Head_y =  turtleY + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
            
            superFuxkAngleDiff = -turtleRotation * M_PI/180;
            superFuxkOriX =  -frameData[turtleOutAnim.spriteData[kTurtlePart_Neck].firstFrame + 12].x * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
            superFuxkOriY =  frameData[turtleOutAnim.spriteData[kTurtlePart_Neck].firstFrame + 12].y * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
            turtle_Neck_x =  turtleX + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
            turtle_Neck_y =  turtleY + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
            
            superFuxkAngleDiff = -turtleRotation * M_PI/180;
            superFuxkOriX =  -frameData[turtleOutAnim.spriteData[kTurtlePart_Shell].firstFrame + 12].x * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
            superFuxkOriY =  frameData[turtleOutAnim.spriteData[kTurtlePart_Shell].firstFrame + 12].y * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
            turtle_Shell_x =  turtleX + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
            turtle_Shell_y =  turtleY + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
            
            superFuxkAngleDiff = -turtleRotation * M_PI/180;
            superFuxkOriX =  -frameData[turtleOutAnim.spriteData[kTurtlePart_LeftLeg].firstFrame + 12].x * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
            superFuxkOriY =  frameData[turtleOutAnim.spriteData[kTurtlePart_LeftLeg].firstFrame + 12].y * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
            turtle_LeftLeg_x =  turtleX + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
            turtle_LeftLeg_y =  turtleY + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
            
            superFuxkAngleDiff = -turtleRotation * M_PI/180;
            superFuxkOriX =  -frameData[turtleOutAnim.spriteData[kTurtlePart_RightLeg].firstFrame + 12].x * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
            superFuxkOriY =  frameData[turtleOutAnim.spriteData[kTurtlePart_RightLeg].firstFrame + 12].y * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
            turtle_RightLeg_x =  turtleX + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
            turtle_RightLeg_y =  turtleY + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
            
            superFuxkAngleDiff = -turtleRotation * M_PI/180;
            superFuxkOriX =  -frameData[turtleOutAnim.spriteData[kTurtlePart_Tail].firstFrame + 12].x * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
            superFuxkOriY =  frameData[turtleOutAnim.spriteData[kTurtlePart_Tail].firstFrame + 12].y * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
            turtle_Tail_x =  turtleX + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
            turtle_Tail_y =  turtleY + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
            
            superFuxkAngleDiff = -turtleRotation * M_PI/180;
            superFuxkOriX =  -frameData[turtleOutAnim.spriteData[kTurtlePart_Shadow].firstFrame + 12].x * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
            superFuxkOriY =  frameData[turtleOutAnim.spriteData[kTurtlePart_Shadow].firstFrame + 12].y * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
            turtle_Shadow_x =  turtleX + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
            turtle_Shadow_y =  turtleY + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
            
            turtle_Head_r = -frameData[turtleOutAnim.spriteData[kTurtlePart_Head].firstFrame + 12].rotation * 180/M_PI + turtleRotation;
            turtle_Neck_r = -frameData[turtleOutAnim.spriteData[kTurtlePart_Neck].firstFrame + 12].rotation * 180/M_PI + turtleRotation;
            turtle_Shell_r = -frameData[turtleOutAnim.spriteData[kTurtlePart_Shell].firstFrame + 12].rotation * 180/M_PI + turtleRotation;
            turtle_LeftLeg_r = -frameData[turtleOutAnim.spriteData[kTurtlePart_LeftLeg].firstFrame + 12].rotation * 180/M_PI + turtleRotation;
            turtle_RightLeg_r = -frameData[turtleOutAnim.spriteData[kTurtlePart_RightLeg].firstFrame + 12].rotation * 180/M_PI + turtleRotation;
            turtle_Tail_r = -frameData[turtleOutAnim.spriteData[kTurtlePart_Tail].firstFrame + 12].rotation * 180/M_PI + turtleRotation;
            turtle_Shadow_r = -frameData[turtleOutAnim.spriteData[kTurtlePart_Shadow].firstFrame + 12].rotation * 180/M_PI + turtleRotation;
            
            [s_Turtle_Head setScaleX:-frameData[turtleOutAnim.spriteData[kTurtlePart_Head].firstFrame + 12].scaleX * wholeTurtleScaleFromSocurce * 2];
            [s_Turtle_Neck setScaleX:-frameData[turtleOutAnim.spriteData[kTurtlePart_Neck].firstFrame + 12].scaleX * wholeTurtleScaleFromSocurce * 2];
            [s_Turtle_Shell setScaleX:-frameData[turtleOutAnim.spriteData[kTurtlePart_Shell].firstFrame + 12].scaleX * wholeTurtleScaleFromSocurce * 2];
            [s_Turtle_LeftLeg setScaleX:-frameData[turtleOutAnim.spriteData[kTurtlePart_LeftLeg].firstFrame + 12].scaleX * wholeTurtleScaleFromSocurce * 2];
            [s_Turtle_RightLeg setScaleX:-frameData[turtleOutAnim.spriteData[kTurtlePart_RightLeg].firstFrame + 12].scaleX * wholeTurtleScaleFromSocurce * 2];
            [s_Turtle_Tail setScaleX:-frameData[turtleOutAnim.spriteData[kTurtlePart_Tail].firstFrame + 12].scaleX * wholeTurtleScaleFromSocurce * 2];
            [s_Turtle_Shadow setScaleX:-frameData[turtleOutAnim.spriteData[kTurtlePart_Shadow].firstFrame + 12].scaleX * wholeTurtleScaleFromSocurce * 2];
            
            [s_Turtle_Head setScaleY:frameData[turtleOutAnim.spriteData[kTurtlePart_Head].firstFrame + 12].scaleY * wholeTurtleScaleFromSocurce * 2];
            [s_Turtle_Neck setScaleY:frameData[turtleOutAnim.spriteData[kTurtlePart_Neck].firstFrame + 12].scaleY * wholeTurtleScaleFromSocurce * 2];
            [s_Turtle_Shell setScaleY:frameData[turtleOutAnim.spriteData[kTurtlePart_Shell].firstFrame + 12].scaleY * wholeTurtleScaleFromSocurce * 2];
            [s_Turtle_LeftLeg setScaleY:frameData[turtleOutAnim.spriteData[kTurtlePart_LeftLeg].firstFrame + 12].scaleY * wholeTurtleScaleFromSocurce * 2];
            [s_Turtle_RightLeg setScaleY:frameData[turtleOutAnim.spriteData[kTurtlePart_RightLeg].firstFrame + 12].scaleY * wholeTurtleScaleFromSocurce * 2];
            [s_Turtle_Tail setScaleY:frameData[turtleOutAnim.spriteData[kTurtlePart_Tail].firstFrame + 12].scaleY * wholeTurtleScaleFromSocurce * 2];
            [s_Turtle_Shadow setScaleY:frameData[turtleOutAnim.spriteData[kTurtlePart_Shadow].firstFrame + 12].scaleY * wholeTurtleScaleFromSocurce * 2];

        }
        
                
        showingHeadTime = 0;
        
    }
    
    if(_status == kTurtleAniStatus_Normal_In){
        
        superFuxkAngleDiff = -turtleRotation * M_PI/180;
        superFuxkOriX =  frameData[turtleInAnim.spriteData[kTurtlePart_Shell].firstFrame + 12].x * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
        superFuxkOriY =  frameData[turtleInAnim.spriteData[kTurtlePart_Shell].firstFrame + 12].y * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
        turtle_Shell_x =  turtleX + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
        turtle_Shell_y =  turtleY + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
   
       
        //DO IT EXTERNALLY
        //hurtTime = 0;
        
        turtleRotation = 0;
        turtle_Shell_r = turtleRotation;
        
        turtle_HeadAndNeck_x = 9999;
        turtle_Head_x = 9999;
        turtle_Jaw_x = 9999;
        turtle_Neck_x = 9999;
        turtle_LeftLeg_x = 9999;
        turtle_RightLeg_x = 9999;
        turtle_Tail_x = 9999;
        turtle_Eye_x = 9999;
        
        turtle_HeadAndNeck_y = 9999;
        turtle_Head_y = 9999;
        turtle_Jaw_y = 9999;
        turtle_Neck_y = 9999;
        turtle_LeftLeg_y = 9999;
        turtle_RightLeg_y = 9999;
        turtle_Tail_y = 9999;
        turtle_Eye_y = 9999;
        

        if(currentChosenMiniGame != 5){
            [s_Turtle_Shell setTextureRect:CGRectMake(396/2,204/2,108/2,70/2)];
            [s_Turtle_Shell setAnchorPoint:ccp(54/108.0, 1.0 - 46.0/71.0)];
            
            if(isIpad){
                [s_Turtle_Shell setTextureRect:CGRectMake(396,204,108,70)];
            }
        }
        
        
    }
    
    if(_status == kTurtleAniStatus_Out){
        isBombShell = false;
        
        if(status == kTurtleAniStatus_Idle){
            [self endIdle];
        }
        
        hurtTime = 0;
        
        turtleAniStep = 0;
        turtleAniStep2 = 0;
        
        turtleRotation = 0;
        
        isCountAlready = false;
        currentTurtleOnScreen++;
       // printf("OUTTTTTT:%i\n" ,idNumber);
        
        if(!cannotPlayTurtleHeadOutSound){
            cannotPlayTurtleHeadOutSound = true;
            //[musicController playThisSound:kSound_TurtleHeadOut isLoop:NO gain:1.0];
        }
        
    }
    
    if(_status == kTurtleAniStatus_In){
        // printf("DSFDS\n");
        if(status == kTurtleAniStatus_Idle){
            [self endIdle];
        }
        
        turtleAniStep = 0;
        turtleAniStep2 = 0;
        
        if(!isCountAlready){
            currentTurtleOnScreen--;
            isCountAlready = true;
        }
        
        if(currentChosenMiniGame == 4){
            if(idNumber == 0 && delegate){
                [delegate setExternalValues:0];
            }
        }
        
    }
    
    if(_status == kTurtleAniStatus_Idle){
        if(status != kTurtleAniStatus_Idle){
            turtleAniStep = 0;
            turtleAniStep2 = 0;
            
            //ADD FROM MINI 13
            turtle_HeadAndNeck_x = 99999;
        }
    }
    
    
    if(_status == kTurtleAniStatus_Bombing){
        if(status == kTurtleAniStatus_Idle){
            [self endIdle];
        }
        
        turtleAniStep = 0;
        turtleAniStep2 = 0;
        turtleBombAniStep = 0;
        //turtleRotation = 0;
        bomb_isHittedFloor = false;
        bomb_hitFloorTimer = 0;
        
        if(currentChosenMiniGame == 4){
            if(idNumber == 0 && delegate){
                [delegate setExternalValues:0];
            }
        }
        
    }
    
    if(_status == kTurtleAniStatus_Shaking){
        turtleAniStep = 0;
        turtleAniStep2 = 0;
        
        turtleOriX = turtleX;
        turtleOriY = turtleY;
        
        [playLayer setToShakingBomb:turtleX turtleY:turtleY];
    }
    
    status = _status;
    
}

-(void) manageMovement{
  //  printf("turtleY:%4.8f\n",turtleY);
    if(isPlayingMiniGame){
        superFuxkAngleDiff = -turtleRotation * M_PI/180;
        superFuxkOriX =  frameData[turtleOutAnim.spriteData[kTurtlePart_Shell].firstFrame + 12].x * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
        superFuxkOriY =  frameData[turtleOutAnim.spriteData[kTurtlePart_Shell].firstFrame + 12].y * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
        turtle_Shell_x =  turtleX + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
        turtle_Shell_y =  turtleY + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
        
        superFuxkAngleDiff = -turtleRotation * M_PI/180;
        superFuxkOriX =  frameData[turtleOutAnim.spriteData[kTurtlePart_LeftLeg].firstFrame + 12].x * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
        superFuxkOriY =  frameData[turtleOutAnim.spriteData[kTurtlePart_LeftLeg].firstFrame + 12].y * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
        turtle_LeftLeg_x =  turtleX + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
        turtle_LeftLeg_y =  turtleY + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
        
        superFuxkAngleDiff = -turtleRotation * M_PI/180;
        superFuxkOriX =  frameData[turtleOutAnim.spriteData[kTurtlePart_RightLeg].firstFrame + 12].x * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
        superFuxkOriY =  frameData[turtleOutAnim.spriteData[kTurtlePart_RightLeg].firstFrame + 12].y * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
        turtle_RightLeg_x =  turtleX + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
        turtle_RightLeg_y =  turtleY + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
        
        superFuxkAngleDiff = -turtleRotation * M_PI/180;
        superFuxkOriX =  frameData[turtleOutAnim.spriteData[kTurtlePart_Tail].firstFrame + 12].x * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
        superFuxkOriY =  frameData[turtleOutAnim.spriteData[kTurtlePart_Tail].firstFrame + 12].y * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
        turtle_Tail_x =  turtleX + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
        turtle_Tail_y =  turtleY + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
        
        superFuxkAngleDiff = -turtleRotation * M_PI/180;
        superFuxkOriX =  frameData[turtleOutAnim.spriteData[kTurtlePart_Shadow].firstFrame + 12].x * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
        superFuxkOriY =  frameData[turtleOutAnim.spriteData[kTurtlePart_Shadow].firstFrame + 12].y * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
        turtle_Shadow_x =  turtleX + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
        turtle_Shadow_y =  turtleY + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
        
        superFuxkAngleDiff = -turtleRotation * M_PI/180;
        superFuxkOriX =  frameData[turtleOutAnim.spriteData[kTurtlePart_Head].firstFrame + 12].x * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
        superFuxkOriY =  frameData[turtleOutAnim.spriteData[kTurtlePart_Head].firstFrame + 12].y * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
        turtle_Head_x =  turtleX + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
        turtle_Head_y =  turtleY + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
        
        superFuxkAngleDiff = -turtleRotation * M_PI/180;
        superFuxkOriX =  frameData[turtleOutAnim.spriteData[kTurtlePart_Neck].firstFrame + 12].x * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
        superFuxkOriY =  frameData[turtleOutAnim.spriteData[kTurtlePart_Neck].firstFrame + 12].y * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
        turtle_Neck_x =  turtleX + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
        turtle_Neck_y =  turtleY + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
        
        turtle_Shell_r = frameData[turtleOutAnim.spriteData[kTurtlePart_Shell].firstFrame + 12].rotation * 180/M_PI + turtleRotation;
        turtle_LeftLeg_r = frameData[turtleOutAnim.spriteData[kTurtlePart_LeftLeg].firstFrame + 12].rotation * 180/M_PI + turtleRotation;
        turtle_RightLeg_r = frameData[turtleOutAnim.spriteData[kTurtlePart_RightLeg].firstFrame + 12].rotation * 180/M_PI + turtleRotation;
        turtle_Tail_r = frameData[turtleOutAnim.spriteData[kTurtlePart_Tail].firstFrame + 12].rotation * 180/M_PI + turtleRotation;
        turtle_Shadow_r = frameData[turtleOutAnim.spriteData[kTurtlePart_Shadow].firstFrame + 12].rotation * 180/M_PI + turtleRotation;
        turtle_Head_r = frameData[turtleOutAnim.spriteData[kTurtlePart_Head].firstFrame + 12].rotation * 180/M_PI + turtleRotation;
        turtle_Neck_r = frameData[turtleOutAnim.spriteData[kTurtlePart_Neck].firstFrame + 12].rotation * 180/M_PI + turtleRotation;
        
    }else{
        
        superFuxkAngleDiff = -turtleRotation * M_PI/180;
        superFuxkOriX =  -frameData[turtleOutAnim.spriteData[kTurtlePart_Shell].firstFrame + 12].x * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
        superFuxkOriY =  frameData[turtleOutAnim.spriteData[kTurtlePart_Shell].firstFrame + 12].y * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
        turtle_Shell_x =  turtleX + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
        turtle_Shell_y =  turtleY + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
        
        superFuxkAngleDiff = -turtleRotation * M_PI/180;
        superFuxkOriX =  -frameData[turtleOutAnim.spriteData[kTurtlePart_LeftLeg].firstFrame + 12].x * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
        superFuxkOriY =  frameData[turtleOutAnim.spriteData[kTurtlePart_LeftLeg].firstFrame + 12].y * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
        turtle_LeftLeg_x =  turtleX + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
        turtle_LeftLeg_y =  turtleY + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
        
        superFuxkAngleDiff = -turtleRotation * M_PI/180;
        superFuxkOriX =  -frameData[turtleOutAnim.spriteData[kTurtlePart_RightLeg].firstFrame + 12].x * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
        superFuxkOriY =  frameData[turtleOutAnim.spriteData[kTurtlePart_RightLeg].firstFrame + 12].y * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
        turtle_RightLeg_x =  turtleX + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
        turtle_RightLeg_y =  turtleY + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
        
        superFuxkAngleDiff = -turtleRotation * M_PI/180;
        superFuxkOriX =  -frameData[turtleOutAnim.spriteData[kTurtlePart_Tail].firstFrame + 12].x * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
        superFuxkOriY =  frameData[turtleOutAnim.spriteData[kTurtlePart_Tail].firstFrame + 12].y * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
        turtle_Tail_x =  turtleX + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
        turtle_Tail_y =  turtleY + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
        
        superFuxkAngleDiff = -turtleRotation * M_PI/180;
        superFuxkOriX =  -frameData[turtleOutAnim.spriteData[kTurtlePart_Head].firstFrame + 12].x * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
        superFuxkOriY =  frameData[turtleOutAnim.spriteData[kTurtlePart_Head].firstFrame + 12].y * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
        turtle_Head_x =  turtleX + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
        turtle_Head_y =  turtleY + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
        
        superFuxkAngleDiff = -turtleRotation * M_PI/180;
        superFuxkOriX =  -frameData[turtleOutAnim.spriteData[kTurtlePart_Neck].firstFrame + 12].x * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
        superFuxkOriY =  frameData[turtleOutAnim.spriteData[kTurtlePart_Neck].firstFrame + 12].y * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
        turtle_Neck_x =  turtleX + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
        turtle_Neck_y =  turtleY + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
        
        turtle_Shell_r = -frameData[turtleOutAnim.spriteData[kTurtlePart_Shell].firstFrame + 12].rotation * 180/M_PI + turtleRotation;
        turtle_LeftLeg_r = -frameData[turtleOutAnim.spriteData[kTurtlePart_LeftLeg].firstFrame + 12].rotation * 180/M_PI + turtleRotation;
        turtle_RightLeg_r = -frameData[turtleOutAnim.spriteData[kTurtlePart_RightLeg].firstFrame + 12].rotation * 180/M_PI + turtleRotation;
        turtle_Tail_r = -frameData[turtleOutAnim.spriteData[kTurtlePart_Tail].firstFrame + 12].rotation * 180/M_PI + turtleRotation;
        turtle_Head_r = -frameData[turtleOutAnim.spriteData[kTurtlePart_Head].firstFrame + 12].rotation * 180/M_PI + turtleRotation;
        turtle_Neck_r = -frameData[turtleOutAnim.spriteData[kTurtlePart_Neck].firstFrame + 12].rotation * 180/M_PI + turtleRotation;
        
        [s_Turtle_Shell setScaleX:-frameData[turtleOutAnim.spriteData[kTurtlePart_Shell].firstFrame + 12].scaleX * wholeTurtleScaleFromSocurce * 2];
        [s_Turtle_Shell setScaleY:frameData[turtleOutAnim.spriteData[kTurtlePart_Shell].firstFrame + 12].scaleY * wholeTurtleScaleFromSocurce * 2];
        [s_Turtle_LeftLeg setScaleX:-frameData[turtleOutAnim.spriteData[kTurtlePart_LeftLeg].firstFrame + 12].scaleX * wholeTurtleScaleFromSocurce * 2];
        [s_Turtle_LeftLeg setScaleY:frameData[turtleOutAnim.spriteData[kTurtlePart_LeftLeg].firstFrame + 12].scaleY * wholeTurtleScaleFromSocurce * 2];
        [s_Turtle_RightLeg setScaleX:-frameData[turtleOutAnim.spriteData[kTurtlePart_RightLeg].firstFrame + 12].scaleX * wholeTurtleScaleFromSocurce * 2];
        [s_Turtle_RightLeg setScaleY:frameData[turtleOutAnim.spriteData[kTurtlePart_RightLeg].firstFrame + 12].scaleY * wholeTurtleScaleFromSocurce * 2];
        [s_Turtle_Tail setScaleX:-frameData[turtleOutAnim.spriteData[kTurtlePart_Tail].firstFrame + 12].scaleX * wholeTurtleScaleFromSocurce * 2];
        [s_Turtle_Tail setScaleY:frameData[turtleOutAnim.spriteData[kTurtlePart_Tail].firstFrame + 12].scaleY * wholeTurtleScaleFromSocurce * 2];
        [s_Turtle_Head setScaleX:-frameData[turtleOutAnim.spriteData[kTurtlePart_Head].firstFrame + 12].scaleX * wholeTurtleScaleFromSocurce * 2];
        [s_Turtle_Head setScaleY:frameData[turtleOutAnim.spriteData[kTurtlePart_Head].firstFrame + 12].scaleY * wholeTurtleScaleFromSocurce * 2];
        [s_Turtle_Neck setScaleX:-frameData[turtleOutAnim.spriteData[kTurtlePart_Neck].firstFrame + 12].scaleX * wholeTurtleScaleFromSocurce * 2];
        [s_Turtle_Neck setScaleY:frameData[turtleOutAnim.spriteData[kTurtlePart_Neck].firstFrame + 12].scaleY * wholeTurtleScaleFromSocurce * 2];
        
         turtle_Shadow_x =  10000;
        
      //  printf("F:%4.8f %4.8f\n",frameData[turtleInAnim.spriteData[kTurtlePart_LeftLeg].firstFrame + 12].scaleX,frameData[turtleInAnim.spriteData[kTurtlePart_RightLeg].firstFrame + 12].scaleX);
    }
   
    
}

-(void) manageNormalInMovement{
    superFuxkAngleDiff = -turtleRotation * M_PI/180;
    superFuxkOriX =  frameData[turtleOutAnim.spriteData[kTurtlePart_Shell].firstFrame + 12].x * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
    superFuxkOriY =  frameData[turtleOutAnim.spriteData[kTurtlePart_Shell].firstFrame + 12].y * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
    turtle_Shell_x =  turtleX + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
    turtle_Shell_y =  turtleY + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
    
    turtle_Shell_r = frameData[turtleOutAnim.spriteData[kTurtlePart_Shell].firstFrame + 12].rotation * 180/M_PI + turtleRotation;
}

-(void) mainManage:(ccTime) dt{
    [self checkAndRunAni];
    [self manageSpike];
    [self manageBombAni];
}

-(void) manage:(ccTime) dt{

    if(currentChosenMiniGame == 4){
        isExternalOffseting = true;
    }
    
    [self checkAndRunAni];
    [self manageSpike];
    [self manageBombAni];
    
    if(isGravity){
        turtleVX += turtleAX;
        turtleVY += turtleAY;
        
        turtleX += turtleVX;
        turtleY += turtleVY;
        
        turtleVR += turtleAR;
        turtleRotation += turtleVR;
        
        turtleAR /= 10;
        
        if(turtleY < -100){
            turtleX = -999999;
        }
        
        if(turtleVY < -10){
            turtleVY = -10;
        }
    }


    if(isPlayingMiniGame){
        if(currentChosenMiniGame == 3){
            if(status == kTurtleAniStatus_Normal_Out){
                [self manageMovement];
            }
            if(status == kTurtleAniStatus_Normal_In){
                [self manageNormalInMovement];
            }
            
        }else{
            if(prevTurtleRotation != turtleRotation){
                if(status == kTurtleAniStatus_Normal_Out){
                    [self manageMovement];
                }
                prevTurtleRotation = turtleRotation;
            }
        }

    }else{
       // [self manageMovement];
    }
       

        
    externalOffsetX2 += (externalOffsetFinalX-externalOffsetX2)/100;
    externalOffsetY2 += (externalOffsetFinalY-externalOffsetY2)/100;
    
    if(!isBombShell){
        [s_Turtle_HeadAndNeck setPosition:ccp(turtle_HeadAndNeck_x + externalOffsetX2, turtle_HeadAndNeck_y + externalOffsetY2)];
        [s_Turtle_Head setPosition:ccp(turtle_Head_x + externalOffsetX2, turtle_Head_y + externalOffsetY2)];
        [s_Turtle_Jaw setPosition:ccp(turtle_Jaw_x + externalOffsetX2, turtle_Jaw_y + externalOffsetY2)];
        [s_Turtle_Neck setPosition:ccp(turtle_Neck_x + externalOffsetX2, turtle_Neck_y + externalOffsetY2)];
        [s_Turtle_Shell setPosition:ccp(turtle_Shell_x + externalOffsetX2, turtle_Shell_y + externalOffsetY2)];
        [s_Turtle_LeftLeg setPosition:ccp(turtle_LeftLeg_x + externalOffsetX2, turtle_LeftLeg_y + externalOffsetY2)];
        [s_Turtle_RightLeg setPosition:ccp(turtle_RightLeg_x + externalOffsetX2, turtle_RightLeg_y + externalOffsetY2)];
        [s_Turtle_Tail setPosition:ccp(turtle_Tail_x + externalOffsetX2, turtle_Tail_y + externalOffsetY2)];
        [s_Turtle_Eye setPosition:ccp(turtle_Eye_x + externalOffsetX2, turtle_Eye_y + externalOffsetY2)];
    }else{
        static float tempYYY = 10;
        [s_Turtle_HeadAndNeck setPosition:ccp(turtle_HeadAndNeck_x + externalOffsetX2, turtle_HeadAndNeck_y + externalOffsetY2 - tempYYY)];
        [s_Turtle_Head setPosition:ccp(turtle_Head_x + externalOffsetX2, turtle_Head_y + externalOffsetY2 - tempYYY)];
        [s_Turtle_Jaw setPosition:ccp(turtle_Jaw_x + externalOffsetX2, turtle_Jaw_y + externalOffsetY2 - tempYYY)];
        [s_Turtle_Neck setPosition:ccp(turtle_Neck_x + externalOffsetX2, turtle_Neck_y + externalOffsetY2 - tempYYY)];
        [s_Turtle_Shell setPosition:ccp(turtle_Shell_x + externalOffsetX2, turtle_Shell_y + externalOffsetY2 - tempYYY)];
        [s_Turtle_LeftLeg setPosition:ccp(turtle_LeftLeg_x + externalOffsetX2, turtle_LeftLeg_y + externalOffsetY2 - tempYYY)];
        [s_Turtle_RightLeg setPosition:ccp(turtle_RightLeg_x + externalOffsetX2, turtle_RightLeg_y + externalOffsetY2 - tempYYY)];
        [s_Turtle_Tail setPosition:ccp(turtle_Tail_x + externalOffsetX2, turtle_Tail_y + externalOffsetY2 - tempYYY)];
        [s_Turtle_Eye setPosition:ccp(turtle_Eye_x + externalOffsetX2, turtle_Eye_y + externalOffsetY2 - tempYYY)];
    }
    
    
    //printf("LL:%i %4.8f %4.8f\n",idNumber, turtle_HeadAndNeck_x,turtle_HeadAndNeck_y);
    
    
    for(int i = 0 ; i < 4 ; i++){
        [s_Turtle_Spike[i] setPosition:ccp(turtle_Spike_x[i] + externalOffsetX2, turtle_Spike_y[i] + externalOffsetY2)];
        [s_Turtle_Spike[i] setRotation:turtleRotation];
    }
    
    //printf("id:%i %i %4.8f %4.8f\n",idNumber,status, turtle_Spike_x[0], turtle_Spike_y[0]);
    
    if(status == kTurtleAniStatus_Normal_In){
        turtle_HeadAndNeck_r = turtleRotation;
        turtle_Head_r = turtleRotation;
        turtle_Jaw_r = turtleRotation;
        turtle_Neck_r = turtleRotation;
        turtle_Shell_r = turtleRotation;
        turtle_LeftLeg_r = turtleRotation;
        turtle_RightLeg_r = turtleRotation;
        turtle_Tail_r = turtleRotation;
        turtle_Eye_r = turtleRotation;
        turtle_Shadow_r = turtleRotation;
    }
    
    [s_Turtle_HeadAndNeck setRotation:turtle_HeadAndNeck_r];
    [s_Turtle_Head setRotation:turtle_Head_r];
    [s_Turtle_Jaw setRotation:turtle_Jaw_r];
    [s_Turtle_Neck setRotation:turtle_Neck_r];
    [s_Turtle_Shell setRotation:turtle_Shell_r];
    [s_Turtle_LeftLeg setRotation:turtle_LeftLeg_r];
    [s_Turtle_RightLeg setRotation:turtle_RightLeg_r];
    [s_Turtle_Tail setRotation:turtle_Tail_r];
    [s_Turtle_Eye setRotation:turtle_Eye_r];
    
    
    if(isChangingWholeScale){
        isChangingWholeScale = false;
        
        [s_Turtle_Shell setScaleX:frameData[turtleInAnim.spriteData[kTurtlePart_Shell].firstFrame + 12].scaleX * wholeTurtleScaleFromSocurce * 2];
        [s_Turtle_Shell setScaleY:frameData[turtleInAnim.spriteData[kTurtlePart_Shell].firstFrame + 12].scaleY * wholeTurtleScaleFromSocurce * 2];
    }
    
    if(currentChosenMiniGame == 10 || currentChosenMiniGame == 2){
        [s_Turtle_Shell setScaleX:turtle_Shell_scaleX];
        [s_Turtle_Shell setScaleY:turtle_Shell_scaleY];
    }
    
    if(currentChosenMiniGame == 5 || currentChosenMiniGame == 3 || currentChosenMiniGame == 13){
        [s_Turtle_Shadow setPosition:ccp(10000, 10000)];
    }else{
        [s_Turtle_Shadow setPosition:ccp(turtle_Shadow_x + externalOffsetX2, turtle_Shadow_y + externalOffsetY2)];
        [s_Turtle_Shadow setRotation:turtle_Shadow_r];
    }
    
    
    if(status == kTurtleAniStatus_Normal_Out){
        showingHeadTime += dt;
    }
       

}

-(void) checkAndRunAni{
    if(status == kTurtleAniStatus_Flying){
        [self turtleFlying];
    }
    
    if(status == kTurtleAniStatus_Out){
        [self turtleOut];
    }
    if(status == kTurtleAniStatus_In){
        [self turtleIn];
    }
    if(status == kTurtleAniStatus_Bombing){
        if(bombOutType == kTurtleBombOutType_backToOri){
             [self turtleInFromBombing_BackToOri];
        }
        if(bombOutType == kTurtleBombOutType_bombOutOffScreen){
            [self turtleInFromBombing_BombOffScreen];
        }
      //  if(bombOutType == kTurtleBombOutType_bombOutOffScreenWithGravity){
       //     [self turtleInFromBombing_BombOffScreenWithGravity];
      //  }
       
    }
    
    if(status == kTurtleAniStatus_Idle){
        [self turtleIdle];
        [self turtleWink];
    }
    
    if(status == kTurtleAniStatus_Shaking){
        [self turtleShake];
    }
}

-(void) turtleShake{
    turtleAniStep2++;
    if(turtleAniStep2 % 2 == 0){
        return;
    }
    
    turtleAniStep++;
    
    if(turtleAniStep == 1){
        turtleRotation = 0;
        [s_Turtle_Shell setScale:1];
    }
    
    static int shakeOffsetRanX;
    static int shakeOffsetRanY;
    static int shakeOffsetAngle;
    
    shakeOffsetRanX = arc4random()% 6 - 3;
    shakeOffsetRanY = arc4random()%4 - 2;
    shakeOffsetAngle = arc4random()%12 - 6;
    
    superFuxkAngleDiff = -turtleRotation * M_PI/180;
    superFuxkOriX =  shakeOffsetRanX + frameData[turtleInAnim.spriteData[kTurtlePart_Shell].firstFrame + 12].x * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
    superFuxkOriY =  shakeOffsetRanY + frameData[turtleInAnim.spriteData[kTurtlePart_Shell].firstFrame + 12].y * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
    turtle_Shell_x =  turtleX + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
    turtle_Shell_y =  turtleY + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);

    turtle_Shell_r = shakeOffsetAngle + turtleRotation;
       
    if(turtleAniStep == 8){
        [self setStatus:kTurtleAniStatus_Normal_In];
    }
}

-(void) turtleOut{
    turtleAniStep2++;
    if(turtleAniStep2 % 2 == 0){
        return;
    }
    
    turtleAniStep++;
    
    
    //turtleAniStep = 12;
    
    // printf("turtleAniStep:%i\n",turtleAniStep);
    
    //turtleAniStep = 12;
    
    
    /*printf("frameData[turtleOutAnim.spriteData[kTurtlePart_Shadow].firstFrame + turtleAniStep:%4.8f %i %i\n",frameData[turtleOutAnim.spriteData[kTurtlePart_Shadow].firstFrame + turtleAniStep].x, turtleOutAnim.spriteData[kTurtlePart_Shadow].firstFrame, turtleAniStep);
     printf("s_Turtle_Shadow:%4.8f %4.8f\n",s_Turtle_Shadow.position.x, s_Turtle_Shadow.position.y);*/
    
    if(!isFacingRight){
        superFuxkAngleDiff = -turtleRotation * M_PI/180;
        superFuxkOriX =   frameData[turtleOutAnim.spriteData[kTurtlePart_Shell].firstFrame + turtleAniStep].x * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
        superFuxkOriY =   frameData[turtleOutAnim.spriteData[kTurtlePart_Shell].firstFrame + turtleAniStep].y * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
        turtle_Shell_x =  turtleX + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
        turtle_Shell_y =  turtleY + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
        
        superFuxkAngleDiff = -turtleRotation * M_PI/180;
        superFuxkOriX =   frameData[turtleOutAnim.spriteData[kTurtlePart_LeftLeg].firstFrame + turtleAniStep].x * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
        superFuxkOriY =   frameData[turtleOutAnim.spriteData[kTurtlePart_LeftLeg].firstFrame + turtleAniStep].y * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
        turtle_LeftLeg_x =  turtleX + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
        turtle_LeftLeg_y =  turtleY + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
        
        superFuxkAngleDiff = -turtleRotation * M_PI/180;
        superFuxkOriX =   frameData[turtleOutAnim.spriteData[kTurtlePart_RightLeg].firstFrame + turtleAniStep].x * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
        superFuxkOriY =   frameData[turtleOutAnim.spriteData[kTurtlePart_RightLeg].firstFrame + turtleAniStep].y * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
        turtle_RightLeg_x =  turtleX + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
        turtle_RightLeg_y =  turtleY + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
        
        superFuxkAngleDiff = -turtleRotation * M_PI/180;
        superFuxkOriX =   frameData[turtleOutAnim.spriteData[kTurtlePart_Tail].firstFrame + turtleAniStep].x * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
        superFuxkOriY =   frameData[turtleOutAnim.spriteData[kTurtlePart_Tail].firstFrame + turtleAniStep].y * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
        turtle_Tail_x =  turtleX + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
        turtle_Tail_y =  turtleY + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
        
        superFuxkAngleDiff = -turtleRotation * M_PI/180;
        superFuxkOriX =   frameData[turtleOutAnim.spriteData[kTurtlePart_Shadow].firstFrame + turtleAniStep].x * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
        superFuxkOriY =   frameData[turtleOutAnim.spriteData[kTurtlePart_Shadow].firstFrame + turtleAniStep].y * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
        turtle_Shadow_x =  turtleX + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
        turtle_Shadow_y =  turtleY + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);

        
        turtle_Shell_r = frameData[turtleOutAnim.spriteData[kTurtlePart_Shell].firstFrame + turtleAniStep].rotation * 180/M_PI + turtleRotation;
        turtle_LeftLeg_r = frameData[turtleOutAnim.spriteData[kTurtlePart_LeftLeg].firstFrame + turtleAniStep].rotation * 180/M_PI + turtleRotation;
        turtle_RightLeg_r = frameData[turtleOutAnim.spriteData[kTurtlePart_RightLeg].firstFrame + turtleAniStep].rotation * 180/M_PI + turtleRotation;
        turtle_Tail_r = frameData[turtleOutAnim.spriteData[kTurtlePart_Tail].firstFrame + turtleAniStep].rotation * 180/M_PI + turtleRotation;
        turtle_Shadow_r = frameData[turtleOutAnim.spriteData[kTurtlePart_Shadow].firstFrame + turtleAniStep].rotation * 180/M_PI + turtleRotation;

        
        [s_Turtle_Shell setScaleX:frameData[turtleOutAnim.spriteData[kTurtlePart_Shell].firstFrame + turtleAniStep].scaleX * wholeTurtleScaleFromSocurce * 2];
        [s_Turtle_LeftLeg setScaleX:frameData[turtleOutAnim.spriteData[kTurtlePart_LeftLeg].firstFrame + turtleAniStep].scaleX * wholeTurtleScaleFromSocurce * 2];
        [s_Turtle_RightLeg setScaleX:frameData[turtleOutAnim.spriteData[kTurtlePart_RightLeg].firstFrame + turtleAniStep].scaleX * wholeTurtleScaleFromSocurce * 2];
        [s_Turtle_Tail setScaleX:frameData[turtleOutAnim.spriteData[kTurtlePart_Tail].firstFrame + turtleAniStep].scaleX * wholeTurtleScaleFromSocurce * 2];
        [s_Turtle_Shadow setScaleX:frameData[turtleOutAnim.spriteData[kTurtlePart_Shadow].firstFrame + turtleAniStep].scaleX * wholeTurtleScaleFromSocurce * 2];
        
    }else{

        turtle_Shell_r = -frameData[turtleOutAnim.spriteData[kTurtlePart_Shell].firstFrame + turtleAniStep].rotation * 180/M_PI + turtleRotation;
        turtle_LeftLeg_r = -frameData[turtleOutAnim.spriteData[kTurtlePart_LeftLeg].firstFrame + turtleAniStep].rotation * 180/M_PI + turtleRotation;
        turtle_RightLeg_r = -frameData[turtleOutAnim.spriteData[kTurtlePart_RightLeg].firstFrame + turtleAniStep].rotation * 180/M_PI + turtleRotation;
        turtle_Tail_r = -frameData[turtleOutAnim.spriteData[kTurtlePart_Tail].firstFrame + turtleAniStep].rotation * 180/M_PI + turtleRotation;
        turtle_Shadow_r = -frameData[turtleOutAnim.spriteData[kTurtlePart_Shadow].firstFrame + turtleAniStep].rotation * 180/M_PI + turtleRotation;
        
        [s_Turtle_Shell setScaleX:-frameData[turtleOutAnim.spriteData[kTurtlePart_Shell].firstFrame + turtleAniStep].scaleX * wholeTurtleScaleFromSocurce * 2];
        [s_Turtle_LeftLeg setScaleX:-frameData[turtleOutAnim.spriteData[kTurtlePart_LeftLeg].firstFrame + turtleAniStep].scaleX * wholeTurtleScaleFromSocurce * 2];
        [s_Turtle_RightLeg setScaleX:-frameData[turtleOutAnim.spriteData[kTurtlePart_RightLeg].firstFrame + turtleAniStep].scaleX * wholeTurtleScaleFromSocurce * 2];
        [s_Turtle_Tail setScaleX:-frameData[turtleOutAnim.spriteData[kTurtlePart_Tail].firstFrame + turtleAniStep].scaleX * wholeTurtleScaleFromSocurce * 2];
        [s_Turtle_Shadow setScaleX:-frameData[turtleOutAnim.spriteData[kTurtlePart_Shadow].firstFrame + turtleAniStep].scaleX * wholeTurtleScaleFromSocurce * 2];
        
    }
    
    [s_Turtle_Shell setScaleY:frameData[turtleOutAnim.spriteData[kTurtlePart_Shell].firstFrame + turtleAniStep].scaleY * wholeTurtleScaleFromSocurce * 2];
    [s_Turtle_LeftLeg setScaleY:frameData[turtleOutAnim.spriteData[kTurtlePart_LeftLeg].firstFrame + turtleAniStep].scaleY * wholeTurtleScaleFromSocurce * 2];
    [s_Turtle_RightLeg setScaleY:frameData[turtleOutAnim.spriteData[kTurtlePart_RightLeg].firstFrame + turtleAniStep].scaleY * wholeTurtleScaleFromSocurce * 2];
    [s_Turtle_Tail setScaleY:frameData[turtleOutAnim.spriteData[kTurtlePart_Tail].firstFrame + turtleAniStep].scaleY * wholeTurtleScaleFromSocurce * 2];
    [s_Turtle_Shadow setScaleY:frameData[turtleOutAnim.spriteData[kTurtlePart_Shadow].firstFrame + turtleAniStep].scaleY * wholeTurtleScaleFromSocurce * 2];
    
    
    float turtleAppearAniWidth_Out = 226/2;
    float turtleAppearAniHeight_Out = 159/2;
    int turtleAppearAniTotalRow_Out = 9;
    int turtleAppearAniTotalFrame_Out = 10;
    int turtleAppearAniCurrentRow_Out;
    int turtleAppearAniCurrentCol_Out;
    
    if(isIpad){
        turtleAppearAniWidth_Out *= 2;
        turtleAppearAniHeight_Out *= 2;
    }
    
    
    /*if(turtleAniStep >= turtleAppearAniTotalFrame){
     turtleAniStep = turtleAppearAniTotalFrame - 1;
     }*/
    
    if(turtleAniStep < turtleAppearAniTotalRow_Out){
        turtleAppearAniCurrentCol_Out = 0;
        turtleAppearAniCurrentRow_Out = turtleAniStep;
    }else{
        turtleAppearAniCurrentCol_Out = 1;
        turtleAppearAniCurrentRow_Out = 0;
    }
    
    // printf("turtleAniStep   :%i\n",turtleAniStep);
    
    if(turtleAniStep <= 9){
        [s_Turtle_HeadAndNeck setTextureRect:CGRectMake(turtleAppearAniCurrentRow_Out * turtleAppearAniWidth_Out, turtleAppearAniCurrentCol_Out * turtleAppearAniHeight_Out, turtleAppearAniWidth_Out, turtleAppearAniHeight_Out)];
        
        if(!isFacingRight){
            [s_Turtle_HeadAndNeck setScale:wholeTurtleScaleFromSocurce * 2];
        }else{
            [s_Turtle_HeadAndNeck setScaleX:-wholeTurtleScaleFromSocurce * 2];
            [s_Turtle_HeadAndNeck setScaleY:wholeTurtleScaleFromSocurce * 2];
        }
        
        turtle_HeadAndNeck_x = turtleX;
        turtle_HeadAndNeck_y = turtleY;
        turtle_HeadAndNeck_r = turtleRotation;
        
        turtle_Head_x = 99999;
        turtle_Neck_x = 99999;
        turtle_Head_y = 99999;
        turtle_Neck_y = 99999;
    }else{
        
        if(!isFacingRight){
            superFuxkAngleDiff = -turtleRotation * M_PI/180;
            superFuxkOriX =   frameData[turtleOutAnim.spriteData[kTurtlePart_Head].firstFrame + turtleAniStep].x * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
            superFuxkOriY =   frameData[turtleOutAnim.spriteData[kTurtlePart_Head].firstFrame + turtleAniStep].y * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
            turtle_Head_x =  turtleX + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
            turtle_Head_y =  turtleY + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
            
            superFuxkAngleDiff = -turtleRotation * M_PI/180;
            superFuxkOriX =   frameData[turtleOutAnim.spriteData[kTurtlePart_Neck].firstFrame + turtleAniStep].x * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
            superFuxkOriY =   frameData[turtleOutAnim.spriteData[kTurtlePart_Neck].firstFrame + turtleAniStep].y * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
            turtle_Neck_x =  turtleX + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
            turtle_Neck_y =  turtleY + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
            
            turtle_Head_r = frameData[turtleOutAnim.spriteData[kTurtlePart_Head].firstFrame + turtleAniStep].rotation * 180/M_PI + turtleRotation;
            turtle_Neck_r = frameData[turtleOutAnim.spriteData[kTurtlePart_Neck].firstFrame + turtleAniStep].rotation * 180/M_PI + turtleRotation;
            
            [s_Turtle_Head setScaleX:frameData[turtleOutAnim.spriteData[kTurtlePart_Head].firstFrame + turtleAniStep].scaleX * wholeTurtleScaleFromSocurce * 2];
            [s_Turtle_Neck setScaleX:frameData[turtleOutAnim.spriteData[kTurtlePart_Neck].firstFrame + turtleAniStep].scaleX * wholeTurtleScaleFromSocurce * 2];
        }else{
            
            turtle_Head_r = -frameData[turtleOutAnim.spriteData[kTurtlePart_Head].firstFrame + turtleAniStep].rotation * 180/M_PI + turtleRotation;
            turtle_Neck_r = -frameData[turtleOutAnim.spriteData[kTurtlePart_Neck].firstFrame + turtleAniStep].rotation * 180/M_PI + turtleRotation;
            
            [s_Turtle_Head setScaleX:-frameData[turtleOutAnim.spriteData[kTurtlePart_Head].firstFrame + turtleAniStep].scaleX * wholeTurtleScaleFromSocurce * 2];
            [s_Turtle_Neck setScaleX:-frameData[turtleOutAnim.spriteData[kTurtlePart_Neck].firstFrame + turtleAniStep].scaleX * wholeTurtleScaleFromSocurce * 2];
            
        }
        
        [s_Turtle_Head setScaleY:frameData[turtleOutAnim.spriteData[kTurtlePart_Head].firstFrame + turtleAniStep].scaleY * wholeTurtleScaleFromSocurce * 2];
        [s_Turtle_Neck setScaleY:frameData[turtleOutAnim.spriteData[kTurtlePart_Neck].firstFrame + turtleAniStep].scaleY * wholeTurtleScaleFromSocurce * 2];
        
        turtle_HeadAndNeck_x = 9999;
        turtle_HeadAndNeck_y = 9999;
    }
    
    
    if(turtleAniStep == 12){
        [self setStatus:kTurtleAniStatus_Normal_Out];
       // status = kTurtleAniStatus_Normal_Out;
    }
    
    
}

-(void) turtleIn{
    turtleAniStep++;
    
    if(turtleAniStep < 8){
        
        
        if(isFacingRight){
            turtle_LeftLeg_x = turtleX + frameData[turtleInAnim.spriteData[kTurtlePart_LeftLeg].firstFrame + turtleAniStep].x * wholeTurtleScaleFromSocurce;
            turtle_RightLeg_x = turtleX + frameData[turtleInAnim.spriteData[kTurtlePart_RightLeg].firstFrame + turtleAniStep].x * wholeTurtleScaleFromSocurce;
            turtle_Tail_x = turtleX + frameData[turtleInAnim.spriteData[kTurtlePart_Tail].firstFrame + turtleAniStep].x * wholeTurtleScaleFromSocurce;
            
            turtle_LeftLeg_y = turtleY + frameData[turtleInAnim.spriteData[kTurtlePart_LeftLeg].firstFrame + turtleAniStep].y * wholeTurtleScaleFromSocurce;
            turtle_RightLeg_y = turtleY + frameData[turtleInAnim.spriteData[kTurtlePart_RightLeg].firstFrame + turtleAniStep].y * wholeTurtleScaleFromSocurce;
            turtle_Tail_y = turtleY + frameData[turtleInAnim.spriteData[kTurtlePart_Tail].firstFrame + turtleAniStep].y * wholeTurtleScaleFromSocurce;
            
            turtle_LeftLeg_r = -frameData[turtleInAnim.spriteData[kTurtlePart_LeftLeg].firstFrame + turtleAniStep].rotation * 180/M_PI + turtleRotation;
            turtle_RightLeg_r = -frameData[turtleInAnim.spriteData[kTurtlePart_RightLeg].firstFrame + turtleAniStep].rotation * 180/M_PI + turtleRotation;
            turtle_Tail_r = -frameData[turtleInAnim.spriteData[kTurtlePart_Tail].firstFrame + turtleAniStep].rotation * 180/M_PI + turtleRotation;
                
            [s_Turtle_LeftLeg setScaleX:-frameData[turtleInAnim.spriteData[kTurtlePart_LeftLeg].firstFrame + turtleAniStep].scaleX * wholeTurtleScaleFromSocurce * 2];
            [s_Turtle_RightLeg setScaleX:-frameData[turtleInAnim.spriteData[kTurtlePart_RightLeg].firstFrame + turtleAniStep].scaleX * wholeTurtleScaleFromSocurce * 2];
            [s_Turtle_Tail setScaleX:-frameData[turtleInAnim.spriteData[kTurtlePart_Tail].firstFrame + turtleAniStep].scaleX * wholeTurtleScaleFromSocurce * 2];
        }else{
            
            superFuxkAngleDiff = -turtleRotation * M_PI/180;
            superFuxkOriX =   frameData[turtleInAnim.spriteData[kTurtlePart_LeftLeg].firstFrame + turtleAniStep].x * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
            superFuxkOriY =   frameData[turtleInAnim.spriteData[kTurtlePart_LeftLeg].firstFrame + turtleAniStep].y * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
            turtle_LeftLeg_x =  turtleX + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
            turtle_LeftLeg_y =  turtleY + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
            
            superFuxkAngleDiff = -turtleRotation * M_PI/180;
            superFuxkOriX =   frameData[turtleInAnim.spriteData[kTurtlePart_RightLeg].firstFrame + turtleAniStep].x * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
            superFuxkOriY =   frameData[turtleInAnim.spriteData[kTurtlePart_RightLeg].firstFrame + turtleAniStep].y * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
            turtle_RightLeg_x =  turtleX + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
            turtle_RightLeg_y =  turtleY + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
            
            superFuxkAngleDiff = -turtleRotation * M_PI/180;
            superFuxkOriX =   frameData[turtleInAnim.spriteData[kTurtlePart_Tail].firstFrame + turtleAniStep].x * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
            superFuxkOriY =   frameData[turtleInAnim.spriteData[kTurtlePart_Tail].firstFrame + turtleAniStep].y * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
            turtle_Tail_x =  turtleX + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
            turtle_Tail_y =  turtleY + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);

            
            turtle_LeftLeg_r = frameData[turtleInAnim.spriteData[kTurtlePart_LeftLeg].firstFrame + turtleAniStep].rotation * 180/M_PI + turtleRotation;
            turtle_RightLeg_r = frameData[turtleInAnim.spriteData[kTurtlePart_RightLeg].firstFrame + turtleAniStep].rotation * 180/M_PI + turtleRotation;
            turtle_Tail_r = frameData[turtleInAnim.spriteData[kTurtlePart_Tail].firstFrame + turtleAniStep].rotation * 180/M_PI + turtleRotation;
            
            [s_Turtle_LeftLeg setScaleX:frameData[turtleInAnim.spriteData[kTurtlePart_LeftLeg].firstFrame + turtleAniStep].scaleX * wholeTurtleScaleFromSocurce * 2];
            [s_Turtle_RightLeg setScaleX:frameData[turtleInAnim.spriteData[kTurtlePart_RightLeg].firstFrame + turtleAniStep].scaleX * wholeTurtleScaleFromSocurce * 2];
            [s_Turtle_Tail setScaleX:frameData[turtleInAnim.spriteData[kTurtlePart_Tail].firstFrame + turtleAniStep].scaleX * wholeTurtleScaleFromSocurce * 2];
        }
        
        [s_Turtle_LeftLeg setScaleY:frameData[turtleInAnim.spriteData[kTurtlePart_LeftLeg].firstFrame + turtleAniStep].scaleY * wholeTurtleScaleFromSocurce * 2];
        [s_Turtle_RightLeg setScaleY:frameData[turtleInAnim.spriteData[kTurtlePart_RightLeg].firstFrame + turtleAniStep].scaleY * wholeTurtleScaleFromSocurce * 2];
        [s_Turtle_Tail setScaleY:frameData[turtleInAnim.spriteData[kTurtlePart_Tail].firstFrame + turtleAniStep].scaleY * wholeTurtleScaleFromSocurce * 2];
        
    }else{
        turtle_LeftLeg_x = 9999;
        turtle_RightLeg_x = 9999;
        turtle_Tail_x = 9999;
        
        turtle_LeftLeg_y = 9999;
        turtle_RightLeg_y = 9999;
        turtle_Tail_y = 9999;
 
    }
    
    
    
    
    if(!isFacingRight){
        superFuxkAngleDiff = -turtleRotation * M_PI/180;
        superFuxkOriX =   frameData[turtleInAnim.spriteData[kTurtlePart_Shell].firstFrame + turtleAniStep].x * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
        superFuxkOriY =   frameData[turtleInAnim.spriteData[kTurtlePart_Shell].firstFrame + turtleAniStep].y * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
        turtle_Shell_x =  turtleX + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
        turtle_Shell_y =  turtleY + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
        
        superFuxkAngleDiff = -turtleRotation * M_PI/180;
        superFuxkOriX =   frameData[turtleInAnim.spriteData[kTurtlePart_Shadow].firstFrame + turtleAniStep].x * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
        superFuxkOriY =   frameData[turtleInAnim.spriteData[kTurtlePart_Shadow].firstFrame + turtleAniStep].y * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
        turtle_Shadow_x =  turtleX + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
        turtle_Shadow_y =  turtleY + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
    
        
        turtle_Shell_r = frameData[turtleInAnim.spriteData[kTurtlePart_Shell].firstFrame + turtleAniStep].rotation * 180/M_PI + turtleRotation;
        turtle_Shadow_r = frameData[turtleInAnim.spriteData[kTurtlePart_Shadow].firstFrame + turtleAniStep].rotation * 180/M_PI + turtleRotation;

        
        [s_Turtle_Shell setScaleX:frameData[turtleInAnim.spriteData[kTurtlePart_Shell].firstFrame + turtleAniStep].scaleX * wholeTurtleScaleFromSocurce * 2];
        [s_Turtle_Shadow setScaleX:frameData[turtleInAnim.spriteData[kTurtlePart_Shadow].firstFrame + turtleAniStep].scaleX * wholeTurtleScaleFromSocurce * 2];
    }else{
        
        turtle_Shell_r = -frameData[turtleInAnim.spriteData[kTurtlePart_Shell].firstFrame + turtleAniStep].rotation * 180/M_PI + turtleRotation;
        turtle_Shadow_r = -frameData[turtleInAnim.spriteData[kTurtlePart_Shadow].firstFrame + turtleAniStep].rotation * 180/M_PI + turtleRotation;
        
        [s_Turtle_Shell setScaleX:-frameData[turtleInAnim.spriteData[kTurtlePart_Shell].firstFrame + turtleAniStep].scaleX * wholeTurtleScaleFromSocurce * 2];
        [s_Turtle_Shadow setScaleX:-frameData[turtleInAnim.spriteData[kTurtlePart_Shadow].firstFrame + turtleAniStep].scaleX * wholeTurtleScaleFromSocurce * 2];
    }
    
    [s_Turtle_Shell setScaleY:frameData[turtleInAnim.spriteData[kTurtlePart_Shell].firstFrame + turtleAniStep].scaleY * wholeTurtleScaleFromSocurce * 2];
    [s_Turtle_Shadow setScaleY:frameData[turtleInAnim.spriteData[kTurtlePart_Shadow].firstFrame + turtleAniStep].scaleY * wholeTurtleScaleFromSocurce * 2];
    
    
    static float turtleAppearAniWidth_In = 205/2;
    static float turtleAppearAniHeight_In = 133/2;
    
    // printf("turtleAniStep   :%i\n",turtleAniStep);
    
    if(turtleAniStep > 3){
        
        if(turtleAniStep < 8){
            [s_Turtle_HeadAndNeck setTextureRect:CGRectMake(510/2 + (turtleAniStep - 3) * turtleAppearAniWidth_In, 162/2, turtleAppearAniWidth_In, turtleAppearAniHeight_In)];
            
            if(isIpad){
                [s_Turtle_HeadAndNeck setTextureRect:CGRectMake((510/2 + (turtleAniStep - 3) * turtleAppearAniWidth_In) * 2, 162/2 * 2, turtleAppearAniWidth_In * 2, turtleAppearAniHeight_In * 2)];
            }
            //printf("PK\n");
            
            if(!isFacingRight){
                
                turtle_HeadAndNeck_x = turtleX;
                turtle_HeadAndNeck_y = turtleY;

                [s_Turtle_HeadAndNeck setScale:wholeTurtleScaleFromSocurce * 2];
                turtle_HeadAndNeck_r = turtleRotation;
            }else{
                [s_Turtle_HeadAndNeck setScaleX:-wholeTurtleScaleFromSocurce * 2];
                [s_Turtle_HeadAndNeck setScaleY:wholeTurtleScaleFromSocurce * 2];
            }
            
            turtle_Head_x = 9999;
            turtle_Neck_x = 9999;
            turtle_Head_y = 9999;
            turtle_Neck_y = 9999;
        }else{
            turtle_HeadAndNeck_x = 9999;
            turtle_Head_x = 9999;
            turtle_Neck_x = 9999;
            
            turtle_HeadAndNeck_y = 9999;
            turtle_Head_y = 9999;
            turtle_Neck_y = 9999;
        }
        
        
    }else{
        
        if(!isFacingRight){
            
            superFuxkAngleDiff = -turtleRotation * M_PI/180;
            superFuxkOriX =   frameData[turtleInAnim.spriteData[kTurtlePart_Head].firstFrame + turtleAniStep].x * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
            superFuxkOriY =   frameData[turtleInAnim.spriteData[kTurtlePart_Head].firstFrame + turtleAniStep].y * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
            turtle_Head_x =  turtleX + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
            turtle_Head_y =  turtleY + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
            
            superFuxkAngleDiff = -turtleRotation * M_PI/180;
            superFuxkOriX =   frameData[turtleInAnim.spriteData[kTurtlePart_Neck].firstFrame + turtleAniStep].x * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
            superFuxkOriY =   frameData[turtleInAnim.spriteData[kTurtlePart_Neck].firstFrame + turtleAniStep].y * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
            turtle_Neck_x =  turtleX + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
            turtle_Neck_y =  turtleY + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
            
            
            turtle_Head_r = frameData[turtleInAnim.spriteData[kTurtlePart_Head].firstFrame + turtleAniStep].rotation * 180/M_PI + turtleRotation;
            turtle_Neck_r = frameData[turtleInAnim.spriteData[kTurtlePart_Neck].firstFrame + turtleAniStep].rotation * 180/M_PI + turtleRotation;
            
            [s_Turtle_Head setScaleX:frameData[turtleInAnim.spriteData[kTurtlePart_Head].firstFrame + turtleAniStep].scaleX * wholeTurtleScaleFromSocurce * 2];
            [s_Turtle_Neck setScaleX:frameData[turtleInAnim.spriteData[kTurtlePart_Neck].firstFrame + turtleAniStep].scaleX * wholeTurtleScaleFromSocurce * 2];
        }else{
            
            turtle_Head_r = -frameData[turtleInAnim.spriteData[kTurtlePart_Head].firstFrame + turtleAniStep].rotation * 180/M_PI + turtleRotation;
            turtle_Neck_r = -frameData[turtleInAnim.spriteData[kTurtlePart_Neck].firstFrame + turtleAniStep].rotation * 180/M_PI + turtleRotation;
            
            [s_Turtle_Head setScaleX:-frameData[turtleInAnim.spriteData[kTurtlePart_Head].firstFrame + turtleAniStep].scaleX * wholeTurtleScaleFromSocurce * 2];
            [s_Turtle_Neck setScaleX:-frameData[turtleInAnim.spriteData[kTurtlePart_Neck].firstFrame + turtleAniStep].scaleX * wholeTurtleScaleFromSocurce * 2];
        }
        
        
        [s_Turtle_Head setScaleY:frameData[turtleInAnim.spriteData[kTurtlePart_Head].firstFrame + turtleAniStep].scaleY * wholeTurtleScaleFromSocurce * 2];
        [s_Turtle_Neck setScaleY:frameData[turtleInAnim.spriteData[kTurtlePart_Neck].firstFrame + turtleAniStep].scaleY * wholeTurtleScaleFromSocurce * 2];
        
         turtle_HeadAndNeck_x = 9999;
         turtle_HeadAndNeck_y = 9999;

    }
    
    
    if(turtleAniStep == 12){
        [self checkIfLostComboWhenTurtleIn];
        [self setStatus:kTurtleAniStatus_Normal_In];
    }
    
}

-(void) checkIfLostComboWhenTurtleIn{
    static bool isLostCombo;
    isLostCombo = true;
    if(shellLevel == 0){
        if(hurtTime == 1){
            isLostCombo = false;
        }
    }
    
    if(shellLevel == 1){
        if(hurtTime == 2){
            isLostCombo = false;
        }
    }
    
    if(shellLevel == 2){
        if(hurtTime == 3){
            isLostCombo = false;
        }
    }
    
    if(isLostCombo){
        [uILayer lostCombo];
    }
}

-(void) turtleInFromBombing_BombOffScreenWithGravity{
       
}

-(void) turtleInFromBombing_BombOffScreen{
    
    
    
    if(turtleBombAniStep == 0){
        if(currentChosenMiniGame == 10){
        
        }else{
        
        }
        bomb_force = 10;
        
        bomb_x = 0;
        bomb_y = 0;
        
        bomb_vx = 7;
        bomb_vy = 12;
        bomb_oriVy = bomb_vy;
        bomb_ay = -0.75;
        bomb_floorY = turtleY;
        
        static int ranR;
        ranR = arc4random() % 100;
        
        bomb_vr = bomb_force * 0.5;
        bomb_isRotatingClockrise = true;

        if(bombOutOffScreenDirection == kBombOutOffScreenDirection_Left){
            bomb_vx *= -1;
            bomb_isRotatingClockrise = false;
        }
    }
    
    bomb_vy += bomb_ay;
    bomb_y += bomb_vy;
    bomb_x += bomb_vx;
    
    if(bomb_isRotatingClockrise){
         turtleRotation += bomb_vr;
    }else{
         turtleRotation += -bomb_vr;
    }
   
    //printf("IDNumber:%i %4.8f\n",idNumber, turtleRotation);

    
    [s_Turtle_Shadow setOpacity:bomb_shadowOpacity];
    [s_Turtle_Shadow setScaleX:bomb_shadowScaleY];
    
   
    // printf("turtleRotation:%4.8f\n",turtleRotation);
    
    if(turtleAniStep < 8){
        
        
        if(isFacingRight){
            
        }else{
            
            if(status == kTurtleAniStatus_Normal_Out){
                superFuxkAngleDiff = -turtleRotation * M_PI/180;
                superFuxkOriX = frameData[turtleInAnim.spriteData[kTurtlePart_LeftLeg].firstFrame + turtleAniStep].x * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
                superFuxkOriY = frameData[turtleInAnim.spriteData[kTurtlePart_LeftLeg].firstFrame + turtleAniStep].y * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
                turtle_LeftLeg_x = turtleX + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff) + bomb_x;
                turtle_LeftLeg_y = turtleY + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff) + bomb_y;
                
                superFuxkAngleDiff = -turtleRotation * M_PI/180;
                superFuxkOriX = frameData[turtleInAnim.spriteData[kTurtlePart_RightLeg].firstFrame + turtleAniStep].x * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
                superFuxkOriY = frameData[turtleInAnim.spriteData[kTurtlePart_RightLeg].firstFrame + turtleAniStep].y * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
                turtle_RightLeg_x = turtleX + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff) + bomb_x;
                turtle_RightLeg_y = turtleY + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff) + bomb_y;
                
                
                
                superFuxkAngleDiff = -turtleRotation * M_PI/180;
                superFuxkOriX = frameData[turtleInAnim.spriteData[kTurtlePart_Tail].firstFrame + turtleAniStep].x * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
                superFuxkOriY = frameData[turtleInAnim.spriteData[kTurtlePart_Tail].firstFrame + turtleAniStep].y * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
                turtle_Tail_x = turtleX + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff) + bomb_x;
                turtle_Tail_y = turtleY + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff) + bomb_y;
                
                
                //ORI FUCK
                /*turtle_LeftLeg_r = -frameData[turtleInAnim.spriteData[kTurtlePart_LeftLeg].firstFrame + turtleAniStep].rotation * 180/M_PI + turtleRotation;
                 turtle_RightLeg_r = -frameData[turtleInAnim.spriteData[kTurtlePart_RightLeg].firstFrame + turtleAniStep].rotation * 180/M_PI + turtleRotation;
                 turtle_Tail_r = -frameData[turtleInAnim.spriteData[kTurtlePart_Tail].firstFrame + turtleAniStep].rotation * 180/M_PI + turtleRotation;*/
                turtle_LeftLeg_r = frameData[turtleInAnim.spriteData[kTurtlePart_LeftLeg].firstFrame + turtleAniStep].rotation * 180/M_PI + turtleRotation;
                turtle_RightLeg_r = frameData[turtleInAnim.spriteData[kTurtlePart_RightLeg].firstFrame + turtleAniStep].rotation * 180/M_PI + turtleRotation;
                turtle_Tail_r = frameData[turtleInAnim.spriteData[kTurtlePart_Tail].firstFrame + turtleAniStep].rotation * 180/M_PI + turtleRotation;

                [s_Turtle_LeftLeg setScaleX:frameData[turtleInAnim.spriteData[kTurtlePart_LeftLeg].firstFrame + turtleAniStep].scaleX * wholeTurtleScaleFromSocurce * 2];
                [s_Turtle_RightLeg setScaleX:frameData[turtleInAnim.spriteData[kTurtlePart_RightLeg].firstFrame + turtleAniStep].scaleX * wholeTurtleScaleFromSocurce * 2];
                [s_Turtle_Tail setScaleX:frameData[turtleInAnim.spriteData[kTurtlePart_Tail].firstFrame + turtleAniStep].scaleX * wholeTurtleScaleFromSocurce * 2];
            }
            
        }
        
        if(status == kTurtleAniStatus_Normal_Out){
            [s_Turtle_LeftLeg setScaleY:frameData[turtleInAnim.spriteData[kTurtlePart_LeftLeg].firstFrame + turtleAniStep].scaleY * wholeTurtleScaleFromSocurce * 2];
            [s_Turtle_RightLeg setScaleY:frameData[turtleInAnim.spriteData[kTurtlePart_RightLeg].firstFrame + turtleAniStep].scaleY * wholeTurtleScaleFromSocurce * 2];
            [s_Turtle_Tail setScaleY:frameData[turtleInAnim.spriteData[kTurtlePart_Tail].firstFrame + turtleAniStep].scaleY * wholeTurtleScaleFromSocurce * 2];
        }
        
        
    }else{
        turtle_LeftLeg_x = 9999;
        turtle_RightLeg_x = 9999;
        turtle_Tail_x = 9999;
        
        turtle_LeftLeg_y = 9999;
        turtle_RightLeg_y = 9999;
        turtle_Tail_y = 9999;
        
    }
    
    
    
    
    if(!isFacingRight){
        
        
        superFuxkAngleDiff = -turtleRotation * M_PI/180;
        superFuxkOriX = frameData[turtleInAnim.spriteData[kTurtlePart_Shell].firstFrame + turtleAniStep].x * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad + externalOffsetX;
        superFuxkOriY = frameData[turtleInAnim.spriteData[kTurtlePart_Shell].firstFrame + turtleAniStep].y * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad + externalOffsetY;
        turtle_Shell_x = turtleX + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff) + bomb_x;
        turtle_Shell_y = turtleY + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff) + bomb_y;
        
        turtle_Shell_r = frameData[turtleInAnim.spriteData[kTurtlePart_Shell].firstFrame + turtleAniStep].rotation * 180/M_PI + turtleRotation;
        [s_Turtle_Shell setScaleX:frameData[turtleInAnim.spriteData[kTurtlePart_Shell].firstFrame + turtleAniStep].scaleX * wholeTurtleScaleFromSocurce * 2];
    }else{
        
    }
    
    [s_Turtle_Shell setScaleY:frameData[turtleInAnim.spriteData[kTurtlePart_Shell].firstFrame + turtleAniStep].scaleY * wholeTurtleScaleFromSocurce * 2];
    
    
    static float turtleAppearAniWidth_In = 205/2;
    static float turtleAppearAniHeight_In = 133/2;
    
    // printf("turtleAniStep   :%i\n",turtleAniStep);
    
    if(turtleAniStep > 3){
        
        if(turtleAniStep < 8){
            if(status == kTurtleAniStatus_Normal_Out){
                [s_Turtle_HeadAndNeck setTextureRect:CGRectMake(510/2 + (turtleAniStep - 3) * turtleAppearAniWidth_In, 162/2, turtleAppearAniWidth_In, turtleAppearAniHeight_In)];
                
                if(!isFacingRight){
                    superFuxkAngleDiff = -turtleRotation * M_PI/180;
                    superFuxkOriX =   bomb_x;
                    superFuxkOriY =   bomb_y;
                    turtle_HeadAndNeck_x =  turtleX + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
                    turtle_HeadAndNeck_y =  turtleY + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
                    
                    //turtle_HeadAndNeck_x = turtleX + bomb_x;
                    //turtle_HeadAndNeck_y = turtleY + bomb_y;
                    
                    [s_Turtle_HeadAndNeck setScale:wholeTurtleScaleFromSocurce * 2];
                    turtle_HeadAndNeck_r = turtleRotation;
                }else{
                    
                }
            }
            
            
            turtle_Head_x = 9999;
            turtle_Neck_x = 9999;
            turtle_Head_y = 9999;
            turtle_Neck_y = 9999;
            
        }else{
            turtle_HeadAndNeck_x = 9999;
            turtle_Head_x = 9999;
            turtle_Neck_x = 9999;
            
            turtle_HeadAndNeck_y = 9999;
            turtle_Head_y = 9999;
            turtle_Neck_y = 9999;
            
        }
        
        
    }else{
        
        if(!isFacingRight){
            if(status == kTurtleAniStatus_Normal_Out){
                superFuxkAngleDiff = -turtleRotation * M_PI/180;
                superFuxkOriX = frameData[turtleInAnim.spriteData[kTurtlePart_Head].firstFrame + turtleAniStep].x * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad + externalOffsetX;
                superFuxkOriY = frameData[turtleInAnim.spriteData[kTurtlePart_Head].firstFrame + turtleAniStep].y * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad + externalOffsetY;
                turtle_Head_x = turtleX + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff) + bomb_x;
                turtle_Head_y = turtleY + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff) + bomb_y;
                
                
                superFuxkAngleDiff = -turtleRotation * M_PI/180;
                superFuxkOriX = frameData[turtleInAnim.spriteData[kTurtlePart_Neck].firstFrame + turtleAniStep].x * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad + externalOffsetX;
                superFuxkOriY = frameData[turtleInAnim.spriteData[kTurtlePart_Neck].firstFrame + turtleAniStep].y * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad + externalOffsetY;
                turtle_Neck_x = turtleX + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff) + bomb_x;
                turtle_Neck_y = turtleY + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff) + bomb_y;
                
                turtle_Head_r = frameData[turtleInAnim.spriteData[kTurtlePart_Head].firstFrame + turtleAniStep].rotation * 180/M_PI + turtleRotation;
                turtle_Neck_r = frameData[turtleInAnim.spriteData[kTurtlePart_Neck].firstFrame + turtleAniStep].rotation * 180/M_PI + turtleRotation;

                [s_Turtle_Head setScaleX:frameData[turtleInAnim.spriteData[kTurtlePart_Head].firstFrame + turtleAniStep].scaleX * wholeTurtleScaleFromSocurce * 2];
                [s_Turtle_Neck setScaleX:frameData[turtleInAnim.spriteData[kTurtlePart_Neck].firstFrame + turtleAniStep].scaleX * wholeTurtleScaleFromSocurce * 2];

            }
        }else{
            
        }
        
        if(status == kTurtleAniStatus_Normal_Out){
            [s_Turtle_Head setScaleY:frameData[turtleInAnim.spriteData[kTurtlePart_Head].firstFrame + turtleAniStep].scaleY * wholeTurtleScaleFromSocurce * 2];
            [s_Turtle_Neck setScaleY:frameData[turtleInAnim.spriteData[kTurtlePart_Neck].firstFrame + turtleAniStep].scaleY * wholeTurtleScaleFromSocurce * 2];
        }
        
        
        turtle_HeadAndNeck_x = 9999;
        turtle_HeadAndNeck_y = 9999;
    }
    
    
    turtleBombAniStep++;
    
    if(s_Turtle_Shell.position.y < -30){
        
        turtleX = 9999;
        [self setStatus:kTurtleAniStatus_Normal_In];
        
        if(delegate){
            [delegate thisTurtleIsBombOutOffScreen:idNumber];
        }
        
        
        
        
        if(!isCountAlready){
            currentTurtleOnScreen--;
            isCountAlready = true;
        }
    }
    
}

-(void) turtleInFromBombing_BackToOri{
    
    
    if(turtleAniStep < 12){
        turtleAniStep++;
    }
    
    
    if(turtleBombAniStep == 0){
        bomb_x = 0;
        bomb_y = 0;
        
        bomb_vy = 10;
        bomb_oriVy = bomb_vy;
        bomb_ay = -0.75;
        bomb_floorY = turtleY;
        
        bomb_vr = 15.9;
        bomb_isRotatingClockrise = true;
        
        bomb_shadowOpacity = 255;
        bomb_shadowScaleY = s_Turtle_Shadow.scaleY;
        
        bomb_hasOnceHittedFloor = false;
    }
    
    bomb_vy += bomb_ay;
    bomb_y += bomb_vy;
    
    if(bomb_y < 0){
        bomb_y = 0;
        bomb_isHittedFloor = true;
        
        if(!bomb_hasOnceHittedFloor){
            [s_Turtle_Shell setTextureRect:CGRectMake(396/2,204/2,108/2,70/2)];
            [s_Turtle_Shell setAnchorPoint:ccp(54/108.0, 1.0 - 46.0/71.0)];
            
            if(isIpad){
                [s_Turtle_Shell setTextureRect:CGRectMake(396,204,108,70)];
            }
        }
        
        bomb_hasOnceHittedFloor = true;
    }
    
    if(bomb_isHittedFloor){
        bomb_oriVy /= 3;
        bomb_vy =bomb_oriVy;
        bomb_y = 0;
        
        bomb_vr /= 3;
        
        bomb_isRotatingClockrise = !bomb_isRotatingClockrise;
        
        bomb_isHittedFloor = false; 
    }else{
        
    }
    
    if(bomb_isRotatingClockrise){
        turtleRotation += bomb_vr;
    }else{
        turtleRotation -= bomb_vr;
    }
    
    if(bomb_vy > 0){
        
        
    }else{
        
    }
    
    if(!bomb_hasOnceHittedFloor){
        
        bomb_shadowOpacity -= 15;
        if(bomb_shadowOpacity < 0){
            bomb_shadowOpacity = 0;
        }
        
        bomb_shadowScaleY -= 0.1;
        if(bomb_shadowScaleY < 0){
            bomb_shadowScaleY = 0;
        }
        
    }else{
        
        bomb_shadowOpacity += 35;
        if(bomb_shadowOpacity > 255){
            bomb_shadowOpacity = 255;
        }
        
        bomb_shadowScaleY += 0.1;
        if(bomb_shadowScaleY > 0.6396328003115613){
            bomb_shadowScaleY = 0.6396328003115613;
        }
        
        turtle_Shadow_x = turtleX + 0.35000000000002274 * wholeTurtleScaleFromSocurce;
        turtle_Shadow_y = turtleY - 21.899999999999977 * wholeTurtleScaleFromSocurce;
        
    }
    
    [s_Turtle_Shadow setOpacity:bomb_shadowOpacity];
    [s_Turtle_Shadow setScaleX:bomb_shadowScaleY];
    
    if(turtleBombAniStep  == 40){
        [self setStatus:kTurtleAniStatus_Normal_In];
        
        if(!isCountAlready){
            currentTurtleOnScreen--;
            isCountAlready = true;
        }
    }
    
    
    // printf("turtleRotation:%4.8f\n",turtleRotation);
    
    if(turtleAniStep < 8){
        
        
        if(isFacingRight){
            
        }else{
            
            
            superFuxkAngleDiff = -turtleRotation * M_PI/180;
            superFuxkOriX = frameData[turtleInAnim.spriteData[kTurtlePart_LeftLeg].firstFrame + turtleAniStep].x * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
            superFuxkOriY = frameData[turtleInAnim.spriteData[kTurtlePart_LeftLeg].firstFrame + turtleAniStep].y * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
            turtle_LeftLeg_x = turtleX + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff) + bomb_x;
            turtle_LeftLeg_y = turtleY + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff) + bomb_y;
                     
            superFuxkAngleDiff = -turtleRotation * M_PI/180;
            superFuxkOriX = frameData[turtleInAnim.spriteData[kTurtlePart_RightLeg].firstFrame + turtleAniStep].x * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
            superFuxkOriY = frameData[turtleInAnim.spriteData[kTurtlePart_RightLeg].firstFrame + turtleAniStep].y * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
            turtle_RightLeg_x = turtleX + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff) + bomb_x;
            turtle_RightLeg_y = turtleY + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff) + bomb_y;
            
            
            
            superFuxkAngleDiff = -turtleRotation * M_PI/180;
            superFuxkOriX = frameData[turtleInAnim.spriteData[kTurtlePart_Tail].firstFrame + turtleAniStep].x * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
            superFuxkOriY = frameData[turtleInAnim.spriteData[kTurtlePart_Tail].firstFrame + turtleAniStep].y * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
            turtle_Tail_x = turtleX + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff) + bomb_x;
            turtle_Tail_y = turtleY + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff) + bomb_y;
      
            //ORI FUCK 2
            /*turtle_LeftLeg_r = -frameData[turtleInAnim.spriteData[kTurtlePart_LeftLeg].firstFrame + turtleAniStep].rotation * 180/M_PI + turtleRotation;
             turtle_RightLeg_r = -frameData[turtleInAnim.spriteData[kTurtlePart_RightLeg].firstFrame + turtleAniStep].rotation * 180/M_PI + turtleRotation;
             turtle_Tail_r = -frameData[turtleInAnim.spriteData[kTurtlePart_Tail].firstFrame + turtleAniStep].rotation * 180/M_PI + turtleRotation;*/
            turtle_LeftLeg_r = frameData[turtleInAnim.spriteData[kTurtlePart_LeftLeg].firstFrame + turtleAniStep].rotation * 180/M_PI + turtleRotation;
            turtle_RightLeg_r = frameData[turtleInAnim.spriteData[kTurtlePart_RightLeg].firstFrame + turtleAniStep].rotation * 180/M_PI + turtleRotation;
            turtle_Tail_r = frameData[turtleInAnim.spriteData[kTurtlePart_Tail].firstFrame + turtleAniStep].rotation * 180/M_PI + turtleRotation;
 
            [s_Turtle_LeftLeg setScaleX:frameData[turtleInAnim.spriteData[kTurtlePart_LeftLeg].firstFrame + turtleAniStep].scaleX * wholeTurtleScaleFromSocurce * 2];
            [s_Turtle_RightLeg setScaleX:frameData[turtleInAnim.spriteData[kTurtlePart_RightLeg].firstFrame + turtleAniStep].scaleX * wholeTurtleScaleFromSocurce * 2];
            [s_Turtle_Tail setScaleX:frameData[turtleInAnim.spriteData[kTurtlePart_Tail].firstFrame + turtleAniStep].scaleX * wholeTurtleScaleFromSocurce * 2];
        }
        
        [s_Turtle_LeftLeg setScaleY:frameData[turtleInAnim.spriteData[kTurtlePart_LeftLeg].firstFrame + turtleAniStep].scaleY * wholeTurtleScaleFromSocurce * 2];
        [s_Turtle_RightLeg setScaleY:frameData[turtleInAnim.spriteData[kTurtlePart_RightLeg].firstFrame + turtleAniStep].scaleY * wholeTurtleScaleFromSocurce * 2];
        [s_Turtle_Tail setScaleY:frameData[turtleInAnim.spriteData[kTurtlePart_Tail].firstFrame + turtleAniStep].scaleY * wholeTurtleScaleFromSocurce * 2];
        
    }else{
        turtle_LeftLeg_x = 9999;
        turtle_RightLeg_x = 9999;
        turtle_Tail_x = 9999;
        
        turtle_LeftLeg_y = 9999;
        turtle_RightLeg_y = 9999;
        turtle_Tail_y = 9999;

    }
    
    
    
    
    if(!isFacingRight){
        
        superFuxkAngleDiff = -turtleRotation * M_PI/180;
        superFuxkOriX = frameData[turtleInAnim.spriteData[kTurtlePart_Shell].firstFrame + turtleAniStep].x * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad + externalOffsetX;
        superFuxkOriY = frameData[turtleInAnim.spriteData[kTurtlePart_Shell].firstFrame + turtleAniStep].y * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad + externalOffsetY;
        turtle_Shell_x = turtleX + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff) + bomb_x;
        turtle_Shell_y = turtleY + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff) + bomb_y;

        turtle_Shell_r = frameData[turtleInAnim.spriteData[kTurtlePart_Shell].firstFrame + turtleAniStep].rotation * 180/M_PI + turtleRotation;
        [s_Turtle_Shell setScaleX:frameData[turtleInAnim.spriteData[kTurtlePart_Shell].firstFrame + turtleAniStep].scaleX * wholeTurtleScaleFromSocurce * 2];
    }else{
        
    }
    
    [s_Turtle_Shell setScaleY:frameData[turtleInAnim.spriteData[kTurtlePart_Shell].firstFrame + turtleAniStep].scaleY * wholeTurtleScaleFromSocurce * 2];
    
    
    static float turtleAppearAniWidth_In = 205/2;
    static float turtleAppearAniHeight_In = 133/2;
    
    // printf("turtleAniStep   :%i\n",turtleAniStep);
    
    if(turtleAniStep > 3){
        
        if(turtleAniStep < 8){
            [s_Turtle_HeadAndNeck setTextureRect:CGRectMake(510/2 + (turtleAniStep - 3) * turtleAppearAniWidth_In, 162/2, turtleAppearAniWidth_In, turtleAppearAniHeight_In)];
            
            if(isIpad){
                [s_Turtle_HeadAndNeck setTextureRect:CGRectMake(510 + (turtleAniStep - 3) * turtleAppearAniWidth_In*2, 162, turtleAppearAniWidth_In*2, turtleAppearAniHeight_In*2)];
                
            }
            
            if(!isFacingRight){
                turtle_HeadAndNeck_x = turtleX + bomb_x;
                turtle_HeadAndNeck_y = turtleY + bomb_y;
                
                [s_Turtle_HeadAndNeck setScale:wholeTurtleScaleFromSocurce * 2];
                turtle_HeadAndNeck_r = turtleRotation;
            }else{
                
            }
            
            turtle_Head_x = 9999;
            turtle_Neck_x = 9999;
            turtle_Head_y = 9999;
            turtle_Neck_y = 9999;

        }else{
            turtle_HeadAndNeck_x = 9999;
            turtle_Head_x = 9999;
            turtle_Neck_x = 9999;
            
            turtle_HeadAndNeck_y = 9999;
            turtle_Head_y = 9999;
            turtle_Neck_y = 9999;
            
        }
        
        
    }else{
        
        if(!isFacingRight){
            superFuxkAngleDiff = -turtleRotation * M_PI/180;
            superFuxkOriX = frameData[turtleInAnim.spriteData[kTurtlePart_Head].firstFrame + turtleAniStep].x * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad + externalOffsetX;
            superFuxkOriY = frameData[turtleInAnim.spriteData[kTurtlePart_Head].firstFrame + turtleAniStep].y * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad + externalOffsetY;
            turtle_Head_x = turtleX + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff) + bomb_x;
            turtle_Head_y = turtleY + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff) + bomb_y;
                 
            
            superFuxkAngleDiff = -turtleRotation * M_PI/180;
            superFuxkOriX = frameData[turtleInAnim.spriteData[kTurtlePart_Neck].firstFrame + turtleAniStep].x * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad + externalOffsetX;
            superFuxkOriY = frameData[turtleInAnim.spriteData[kTurtlePart_Neck].firstFrame + turtleAniStep].y * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad + externalOffsetY;
            turtle_Neck_x = turtleX + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff) + bomb_x;
            turtle_Neck_y = turtleY + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff) + bomb_y;
            
            turtle_Head_r = frameData[turtleInAnim.spriteData[kTurtlePart_Head].firstFrame + turtleAniStep].rotation * 180/M_PI + turtleRotation;
            turtle_Neck_r = frameData[turtleInAnim.spriteData[kTurtlePart_Neck].firstFrame + turtleAniStep].rotation * 180/M_PI + turtleRotation;
            
            [s_Turtle_Head setScaleX:frameData[turtleInAnim.spriteData[kTurtlePart_Head].firstFrame + turtleAniStep].scaleX * wholeTurtleScaleFromSocurce * 2];
            [s_Turtle_Neck setScaleX:frameData[turtleInAnim.spriteData[kTurtlePart_Neck].firstFrame + turtleAniStep].scaleX * wholeTurtleScaleFromSocurce * 2];
        }else{
        }
        
        
        [s_Turtle_Head setScaleY:frameData[turtleInAnim.spriteData[kTurtlePart_Head].firstFrame + turtleAniStep].scaleY * wholeTurtleScaleFromSocurce * 2];
        [s_Turtle_Neck setScaleY:frameData[turtleInAnim.spriteData[kTurtlePart_Neck].firstFrame + turtleAniStep].scaleY * wholeTurtleScaleFromSocurce * 2];
        
        turtle_HeadAndNeck_x = 9999;
        turtle_HeadAndNeck_y = 9999;
    }
    
    
    turtleBombAniStep++;
    
}

-(void) turtleTempIdle{
   
}



-(void) turtleIdle{
    //  [self turtleTempIdle];
    // return;
    
    if(currentChosenMiniGame == 13){
        turtleAniStep2++;
        if(turtleAniStep2 % 2 == 1){
            turtleAniStep++;
        }
        
        
    }else{
        turtleAniStep2++;
        if(turtleAniStep2 % 2 == 0){
            return;
        }
        
        turtleAniStep++;
    }
    
    
    
    static float idleOffsetX;
    static float idleOffsetY;
    
    if(turtleAniStep == 1){
        [s_Turtle_Head setTextureRect:CGRectMake(1542/2,162/2,132/2,107/2)];
        [s_Turtle_Eye setTextureRect:CGRectMake(1688/2,162/2,48/2,98/2)];
        
        if(isIpad){
            [s_Turtle_Head setTextureRect:CGRectMake(1542,162,132,107)];
            [s_Turtle_Eye setTextureRect:CGRectMake(1688,162,48,98)];
        }
        
        idleOffsetX = -175 * wholeTurtleScaleFromSocurce * 2;
        idleOffsetY = 140 * wholeTurtleScaleFromSocurce * 2;
        
        if(isIpad){
            idleOffsetX = -175 * wholeTurtleScaleFromSocurce * 4;
            idleOffsetY = 140 * wholeTurtleScaleFromSocurce * 4;
        }
    }
    
    // printf("turtleAniStep:%4.8f %4.8f %4.8f\n",turtleX,turtleY, turtleX + frameData[IdleTurtleAnim.spriteData[kTurtlePart_Neck].firstFrame + turtleAniStep].x * wholeTurtleScaleFromSocurce);
    
    
    if(!isFacingRight){
        superFuxkAngleDiff = -turtleRotation * M_PI/180;
        superFuxkOriX = idleOffsetX + frameData[IdleTurtleAnim.spriteData[kTurtlePart_Neck].firstFrame + turtleAniStep].x * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
        superFuxkOriY = idleOffsetY + frameData[IdleTurtleAnim.spriteData[kTurtlePart_Neck].firstFrame + turtleAniStep].y * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
        turtle_Neck_x =  turtleX + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
        turtle_Neck_y =  turtleY + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
        
        superFuxkAngleDiff = -turtleRotation * M_PI/180;
        superFuxkOriX = idleOffsetX + frameData[IdleTurtleAnim.spriteData[kTurtlePart_Jaw].firstFrame + turtleAniStep].x * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
        superFuxkOriY = idleOffsetY + frameData[IdleTurtleAnim.spriteData[kTurtlePart_Jaw].firstFrame + turtleAniStep].y * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
        turtle_Jaw_x =  turtleX + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
        turtle_Jaw_y =  turtleY + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
        
        superFuxkAngleDiff = -turtleRotation * M_PI/180;
        superFuxkOriX = idleOffsetX + frameData[IdleTurtleAnim.spriteData[kTurtlePart_Eye].firstFrame + turtleAniStep].x * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
        superFuxkOriY = idleOffsetY + frameData[IdleTurtleAnim.spriteData[kTurtlePart_Eye].firstFrame + turtleAniStep].y * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
        turtle_Eye_x =  turtleX + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
        turtle_Eye_y =  turtleY + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
        
        superFuxkAngleDiff = -turtleRotation * M_PI/180;
        superFuxkOriX = idleOffsetX + frameData[IdleTurtleAnim.spriteData[kTurtlePart_Head].firstFrame + turtleAniStep].x * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
        superFuxkOriY = idleOffsetY + frameData[IdleTurtleAnim.spriteData[kTurtlePart_Head].firstFrame + turtleAniStep].y * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
        turtle_Head_x =  turtleX + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
        turtle_Head_y =  turtleY + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
        
        superFuxkAngleDiff = -turtleRotation * M_PI/180;
        superFuxkOriX = idleOffsetX + frameData[IdleTurtleAnim.spriteData[kTurtlePart_Shell].firstFrame + turtleAniStep].x * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
        superFuxkOriY = idleOffsetY + frameData[IdleTurtleAnim.spriteData[kTurtlePart_Shell].firstFrame + turtleAniStep].y * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
        turtle_Shell_x =  turtleX + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
        turtle_Shell_y =  turtleY + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
        
        superFuxkAngleDiff = -turtleRotation * M_PI/180;
        superFuxkOriX = idleOffsetX + frameData[IdleTurtleAnim.spriteData[kTurtlePart_LeftLeg].firstFrame + turtleAniStep].x * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
        superFuxkOriY = idleOffsetY + frameData[IdleTurtleAnim.spriteData[kTurtlePart_LeftLeg].firstFrame + turtleAniStep].y * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
        turtle_LeftLeg_x =  turtleX + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
        turtle_LeftLeg_y =  turtleY + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
        
        superFuxkAngleDiff = -turtleRotation * M_PI/180;
        superFuxkOriX = idleOffsetX + frameData[IdleTurtleAnim.spriteData[kTurtlePart_RightLeg].firstFrame + turtleAniStep].x * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
        superFuxkOriY = idleOffsetY + frameData[IdleTurtleAnim.spriteData[kTurtlePart_RightLeg].firstFrame + turtleAniStep].y * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
        turtle_RightLeg_x =  turtleX + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
        turtle_RightLeg_y =  turtleY + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
        
        superFuxkAngleDiff = -turtleRotation * M_PI/180;
        superFuxkOriX = idleOffsetX + frameData[IdleTurtleAnim.spriteData[kTurtlePart_Tail].firstFrame + turtleAniStep].x * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
        superFuxkOriY = idleOffsetY + frameData[IdleTurtleAnim.spriteData[kTurtlePart_Tail].firstFrame + turtleAniStep].y * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
        turtle_Tail_x =  turtleX + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
        turtle_Tail_y =  turtleY + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
        
        superFuxkAngleDiff = -turtleRotation * M_PI/180;
        superFuxkOriX = idleOffsetX + frameData[IdleTurtleAnim.spriteData[kTurtlePart_Shadow].firstFrame + turtleAniStep].x * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
        superFuxkOriY = idleOffsetY + frameData[IdleTurtleAnim.spriteData[kTurtlePart_Shadow].firstFrame + turtleAniStep].y * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
        turtle_Shadow_x =  turtleX + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
        turtle_Shadow_y =  turtleY + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
        
    
        turtle_Neck_r = frameData[IdleTurtleAnim.spriteData[kTurtlePart_Neck].firstFrame + turtleAniStep].rotation * 180/M_PI + turtleRotation;
        turtle_Jaw_r = frameData[IdleTurtleAnim.spriteData[kTurtlePart_Jaw].firstFrame + turtleAniStep].rotation * 180/M_PI + turtleRotation;
        turtle_Eye_r = frameData[IdleTurtleAnim.spriteData[kTurtlePart_Eye].firstFrame + turtleAniStep].rotation * 180/M_PI + turtleRotation;
        turtle_Head_r = frameData[IdleTurtleAnim.spriteData[kTurtlePart_Head].firstFrame + turtleAniStep].rotation * 180/M_PI + turtleRotation;
        turtle_Shell_r = frameData[IdleTurtleAnim.spriteData[kTurtlePart_Shell].firstFrame + turtleAniStep].rotation * 180/M_PI + turtleRotation;
        turtle_LeftLeg_r = frameData[IdleTurtleAnim.spriteData[kTurtlePart_LeftLeg].firstFrame + turtleAniStep].rotation * 180/M_PI + turtleRotation;
        turtle_RightLeg_r = frameData[IdleTurtleAnim.spriteData[kTurtlePart_RightLeg].firstFrame + turtleAniStep].rotation * 180/M_PI + turtleRotation;
        turtle_Tail_r = frameData[IdleTurtleAnim.spriteData[kTurtlePart_Tail].firstFrame + turtleAniStep].rotation * 180/M_PI + turtleRotation;
        turtle_Shadow_r = frameData[IdleTurtleAnim.spriteData[kTurtlePart_Shadow].firstFrame + turtleAniStep].rotation * 180/M_PI + turtleRotation;
        
        [s_Turtle_Neck setScaleX:frameData[IdleTurtleAnim.spriteData[kTurtlePart_Neck].firstFrame + turtleAniStep].scaleX * wholeTurtleScaleFromSocurce * 2];
        [s_Turtle_Jaw setScaleX:frameData[IdleTurtleAnim.spriteData[kTurtlePart_Jaw].firstFrame + turtleAniStep].scaleX * wholeTurtleScaleFromSocurce * 2];
        [s_Turtle_Eye setScaleX:frameData[IdleTurtleAnim.spriteData[kTurtlePart_Eye].firstFrame + turtleAniStep].scaleX * wholeTurtleScaleFromSocurce * 2];
        [s_Turtle_Head setScaleX:frameData[IdleTurtleAnim.spriteData[kTurtlePart_Head].firstFrame + turtleAniStep].scaleX * wholeTurtleScaleFromSocurce * 2];
        [s_Turtle_Shell setScaleX:frameData[IdleTurtleAnim.spriteData[kTurtlePart_Shell].firstFrame + turtleAniStep].scaleX * wholeTurtleScaleFromSocurce * 2];
        [s_Turtle_LeftLeg setScaleX:frameData[IdleTurtleAnim.spriteData[kTurtlePart_LeftLeg].firstFrame + turtleAniStep].scaleX * wholeTurtleScaleFromSocurce * 2];
        [s_Turtle_RightLeg setScaleX:frameData[IdleTurtleAnim.spriteData[kTurtlePart_RightLeg].firstFrame + turtleAniStep].scaleX * wholeTurtleScaleFromSocurce * 2];
        [s_Turtle_Tail setScaleX:frameData[IdleTurtleAnim.spriteData[kTurtlePart_Tail].firstFrame + turtleAniStep].scaleX * wholeTurtleScaleFromSocurce * 2];
        [s_Turtle_Shadow setScaleX:frameData[IdleTurtleAnim.spriteData[kTurtlePart_Shadow].firstFrame + turtleAniStep].scaleX * wholeTurtleScaleFromSocurce * 2];
        
    }else{
        [s_Turtle_Neck setPosition:ccp(-idleOffsetX + turtleX - frameData[IdleTurtleAnim.spriteData[kTurtlePart_Neck].firstFrame + turtleAniStep].x * wholeTurtleScaleFromSocurce + externalOffsetX,
                                       idleOffsetY + turtleY + frameData[IdleTurtleAnim.spriteData[kTurtlePart_Neck].firstFrame + turtleAniStep].y * wholeTurtleScaleFromSocurce + externalOffsetY)];
        [s_Turtle_Jaw setPosition:ccp(-idleOffsetX + turtleX - (frameData[IdleTurtleAnim.spriteData[kTurtlePart_Jaw].firstFrame + turtleAniStep].x + 1) * wholeTurtleScaleFromSocurce + externalOffsetX,
                                      idleOffsetY + turtleY + (frameData[IdleTurtleAnim.spriteData[kTurtlePart_Jaw].firstFrame + turtleAniStep].y - 1) * wholeTurtleScaleFromSocurce + externalOffsetY)];
        [s_Turtle_Eye setPosition:ccp(-idleOffsetX + turtleX - (frameData[IdleTurtleAnim.spriteData[kTurtlePart_Eye].firstFrame + turtleAniStep].x + 1) * wholeTurtleScaleFromSocurce + externalOffsetX,
                                      idleOffsetY + turtleY + (frameData[IdleTurtleAnim.spriteData[kTurtlePart_Eye].firstFrame + turtleAniStep].y - 2) * wholeTurtleScaleFromSocurce + externalOffsetY)];
        [s_Turtle_Head setPosition:ccp(-idleOffsetX + turtleX - frameData[IdleTurtleAnim.spriteData[kTurtlePart_Head].firstFrame + turtleAniStep].x * wholeTurtleScaleFromSocurce + externalOffsetX,
                                       idleOffsetY + turtleY + frameData[IdleTurtleAnim.spriteData[kTurtlePart_Head].firstFrame + turtleAniStep].y * wholeTurtleScaleFromSocurce + externalOffsetY)];
        
        [s_Turtle_Shell setPosition:ccp(-idleOffsetX + turtleX - frameData[IdleTurtleAnim.spriteData[kTurtlePart_Shell].firstFrame + turtleAniStep].x * wholeTurtleScaleFromSocurce + externalOffsetX,
                                        idleOffsetY + turtleY + frameData[IdleTurtleAnim.spriteData[kTurtlePart_Shell].firstFrame + turtleAniStep].y * wholeTurtleScaleFromSocurce + externalOffsetY)];
        [s_Turtle_LeftLeg setPosition:ccp(-idleOffsetX + turtleX - frameData[IdleTurtleAnim.spriteData[kTurtlePart_LeftLeg].firstFrame + turtleAniStep].x * wholeTurtleScaleFromSocurce + externalOffsetX,
                                          idleOffsetY + turtleY + frameData[IdleTurtleAnim.spriteData[kTurtlePart_LeftLeg].firstFrame + turtleAniStep].y * wholeTurtleScaleFromSocurce + externalOffsetY)];
        [s_Turtle_RightLeg setPosition:ccp(-idleOffsetX + turtleX - frameData[IdleTurtleAnim.spriteData[kTurtlePart_RightLeg].firstFrame + turtleAniStep].x * wholeTurtleScaleFromSocurce + externalOffsetX,
                                           idleOffsetY + turtleY + frameData[IdleTurtleAnim.spriteData[kTurtlePart_RightLeg].firstFrame + turtleAniStep].y * wholeTurtleScaleFromSocurce + externalOffsetY)];
        [s_Turtle_Tail setPosition:ccp(-idleOffsetX + turtleX - frameData[IdleTurtleAnim.spriteData[kTurtlePart_Tail].firstFrame + turtleAniStep].x * wholeTurtleScaleFromSocurce + externalOffsetX,
                                       idleOffsetY + turtleY + frameData[IdleTurtleAnim.spriteData[kTurtlePart_Tail].firstFrame + turtleAniStep].y * wholeTurtleScaleFromSocurce + externalOffsetY)];
        [s_Turtle_Shadow setPosition:ccp(-idleOffsetX + turtleX - frameData[IdleTurtleAnim.spriteData[kTurtlePart_Shadow].firstFrame + turtleAniStep].x * wholeTurtleScaleFromSocurce + externalOffsetX,
                                         idleOffsetY + turtleY + frameData[IdleTurtleAnim.spriteData[kTurtlePart_Shadow].firstFrame + turtleAniStep].y * wholeTurtleScaleFromSocurce + externalOffsetY)];
        
 
        turtle_Neck_r = -frameData[IdleTurtleAnim.spriteData[kTurtlePart_Neck].firstFrame + turtleAniStep].rotation * 180/M_PI + turtleRotation;
        turtle_Jaw_r = -frameData[IdleTurtleAnim.spriteData[kTurtlePart_Jaw].firstFrame + turtleAniStep].rotation * 180/M_PI + turtleRotation;
        turtle_Eye_r = -frameData[IdleTurtleAnim.spriteData[kTurtlePart_Eye].firstFrame + turtleAniStep].rotation * 180/M_PI + turtleRotation;
        turtle_Head_r = -frameData[IdleTurtleAnim.spriteData[kTurtlePart_Head].firstFrame + turtleAniStep].rotation * 180/M_PI + turtleRotation;
        turtle_Shell_r = -frameData[IdleTurtleAnim.spriteData[kTurtlePart_Shell].firstFrame + turtleAniStep].rotation * 180/M_PI + turtleRotation;
        turtle_LeftLeg_r = -frameData[IdleTurtleAnim.spriteData[kTurtlePart_LeftLeg].firstFrame + turtleAniStep].rotation * 180/M_PI + turtleRotation;
        turtle_RightLeg_r = -frameData[IdleTurtleAnim.spriteData[kTurtlePart_RightLeg].firstFrame + turtleAniStep].rotation * 180/M_PI + turtleRotation;
        turtle_Tail_r = -frameData[IdleTurtleAnim.spriteData[kTurtlePart_Tail].firstFrame + turtleAniStep].rotation * 180/M_PI + turtleRotation;
        turtle_Shadow_r = -frameData[IdleTurtleAnim.spriteData[kTurtlePart_Shadow].firstFrame + turtleAniStep].rotation * 180/M_PI + turtleRotation;
        
        [s_Turtle_Neck setScaleX:-frameData[IdleTurtleAnim.spriteData[kTurtlePart_Neck].firstFrame + turtleAniStep].scaleX * wholeTurtleScaleFromSocurce * 2];
        [s_Turtle_Jaw setScaleX:-frameData[IdleTurtleAnim.spriteData[kTurtlePart_Jaw].firstFrame + turtleAniStep].scaleX * wholeTurtleScaleFromSocurce * 2];
        [s_Turtle_Eye setScaleX:-frameData[IdleTurtleAnim.spriteData[kTurtlePart_Eye].firstFrame + turtleAniStep].scaleX * wholeTurtleScaleFromSocurce * 2];
        [s_Turtle_Head setScaleX:-frameData[IdleTurtleAnim.spriteData[kTurtlePart_Head].firstFrame + turtleAniStep].scaleX * wholeTurtleScaleFromSocurce * 2];
        [s_Turtle_Shell setScaleX:-frameData[IdleTurtleAnim.spriteData[kTurtlePart_Shell].firstFrame + turtleAniStep].scaleX * wholeTurtleScaleFromSocurce * 2];
        [s_Turtle_LeftLeg setScaleX:-frameData[IdleTurtleAnim.spriteData[kTurtlePart_LeftLeg].firstFrame + turtleAniStep].scaleX * wholeTurtleScaleFromSocurce * 2];
        [s_Turtle_RightLeg setScaleX:-frameData[IdleTurtleAnim.spriteData[kTurtlePart_RightLeg].firstFrame + turtleAniStep].scaleX * wholeTurtleScaleFromSocurce * 2];
        [s_Turtle_Tail setScaleX:-frameData[IdleTurtleAnim.spriteData[kTurtlePart_Tail].firstFrame + turtleAniStep].scaleX * wholeTurtleScaleFromSocurce * 2];
        [s_Turtle_Shadow setScaleX:-frameData[IdleTurtleAnim.spriteData[kTurtlePart_Shadow].firstFrame + turtleAniStep].scaleX * wholeTurtleScaleFromSocurce * 2];
    }
    
    
    
    /*printf("frameData[turtleOutAnim.spriteData[kTurtlePart_Shadow].firstFrame + turtleAniStep:%4.8f %i %i\n",frameData[turtleOutAnim.spriteData[kTurtlePart_Shadow].firstFrame + turtleAniStep].x, turtleOutAnim.spriteData[kTurtlePart_Shadow].firstFrame, turtleAniStep);
     printf("s_Turtle_Shadow:%4.8f %4.8f\n",s_Turtle_Shadow.position.x, s_Turtle_Shadow.position.y);*/
    
    
    
    [s_Turtle_Neck setScaleY:frameData[IdleTurtleAnim.spriteData[kTurtlePart_Neck].firstFrame + turtleAniStep].scaleY * wholeTurtleScaleFromSocurce * 2];
    [s_Turtle_Jaw setScaleY:frameData[IdleTurtleAnim.spriteData[kTurtlePart_Jaw].firstFrame + turtleAniStep].scaleY * wholeTurtleScaleFromSocurce * 2];
    [s_Turtle_Eye setScaleY:frameData[IdleTurtleAnim.spriteData[kTurtlePart_Eye].firstFrame + turtleAniStep].scaleY * wholeTurtleScaleFromSocurce * 2];
    [s_Turtle_Head setScaleY:frameData[IdleTurtleAnim.spriteData[kTurtlePart_Head].firstFrame + turtleAniStep].scaleY * wholeTurtleScaleFromSocurce * 2];
    [s_Turtle_Shell setScaleY:frameData[IdleTurtleAnim.spriteData[kTurtlePart_Shell].firstFrame + turtleAniStep].scaleY * wholeTurtleScaleFromSocurce * 2];
    [s_Turtle_LeftLeg setScaleY:frameData[IdleTurtleAnim.spriteData[kTurtlePart_LeftLeg].firstFrame + turtleAniStep].scaleY * wholeTurtleScaleFromSocurce * 2];
    [s_Turtle_RightLeg setScaleY:frameData[IdleTurtleAnim.spriteData[kTurtlePart_RightLeg].firstFrame + turtleAniStep].scaleY * wholeTurtleScaleFromSocurce * 2];
    [s_Turtle_Tail setScaleY:frameData[IdleTurtleAnim.spriteData[kTurtlePart_Tail].firstFrame + turtleAniStep].scaleY * wholeTurtleScaleFromSocurce * 2];
    [s_Turtle_Shadow setScaleY:frameData[IdleTurtleAnim.spriteData[kTurtlePart_Shadow].firstFrame + turtleAniStep].scaleY * wholeTurtleScaleFromSocurce * 2];
    
    if(turtleAniStep == 45){
        [self endIdle];
        [self setStatus:kTurtleAniStatus_Normal_Out];
        //status = kTurtleAniStatus_Normal_Out;
    }
    
    if(turtleAniStep < 40){
        if(arc4random() % 20 == 0){
            isWinking = true;
            winkingTimer = 0;
        }
    }
    
    
    if(isBombShell){
        turtle_HeadAndNeck_x = 100000;
        turtle_Head_x = 100000;
        turtle_Jaw_x = 100000;
        turtle_Neck_x = 100000;
        turtle_LeftLeg_x = 100000;
        turtle_RightLeg_x = 100000;
        turtle_Tail_x = 100000;
        turtle_Eye_x = 100000;
    }
}

-(void) turtleWink{
    if(!isWinking){
        return;
    }
    
    winkingTimer++;
    if(winkingTimer % 2 == 0){
        return;
    }
    
    //  printf("winkingTimer:%i\n",winkingTimer);
    
    if(winkingTimer == 1){
        [s_Turtle_Head setTextureRect:CGRectMake(1542/2,162/2,132/2,107/2)];
        [s_Turtle_Eye setTextureRect:CGRectMake(1736/2,162/2,48/2,98/2)];
        
        if(isIpad){
            [s_Turtle_Head setTextureRect:CGRectMake(1542,162,132,107)];
            [s_Turtle_Eye setTextureRect:CGRectMake(1736,162,48,98)];
        }
    }
    if(winkingTimer == 3){
        [s_Turtle_Eye setTextureRect:CGRectMake(1784/2,162/2,48/2,98/2)];
        
        if(isIpad){
            [s_Turtle_Eye setTextureRect:CGRectMake(1784,162,48,98)];
        }
    }
    if(winkingTimer == 5){
        [s_Turtle_Eye setTextureRect:CGRectMake(1736/2,162/2,48/2,98/2)];
        
        if(isIpad){
            [s_Turtle_Eye setTextureRect:CGRectMake(1736,162,48,98)];
        }
    }
    
    
    if(winkingTimer == 7){
        [s_Turtle_Eye setTextureRect:CGRectMake(1688/2,162/2,48/2,98/2)];
        
        if(isIpad){
            [s_Turtle_Eye setTextureRect:CGRectMake(1688,162,48,98)];
        }
        
        [self endWink];
        // status = kTurtleAniStatus_Normal_Out;
    }
    
}

-(void) endIdle{
    if(isWinking){
        [self endWink];
    }
    // printf("endIdle\n");
    turtle_Eye_x = 9999;
    turtle_Jaw_x = 9999;
    turtle_Eye_y = 9999;
    turtle_Jaw_y = 9999;
    [s_Turtle_Head setTextureRect:CGRectMake(226/2,162/2,132/2,107/2)];
    
    if(isIpad){
        [s_Turtle_Head setTextureRect:CGRectMake(226,162,132,107)];
    }
}

-(void) endWink{
    isWinking = false;
    winkingTimer = 0;
}

-(void) setShellLevel:(int)_shellLevel{
    if(shellLevel == _shellLevel){
        //  return;
    }
    
    //  printf("setShellLevel:%i\n",_shellLevel);
    
    shellLevel = _shellLevel;
    
    if(shellLevel == 0){
        if(color == kTurtleShellColor_BrownOri){
            [s_Turtle_Shell setTextureRect:CGRectMake(396/textureRatioForFuckingIpad,204/textureRatioForFuckingIpad,108/textureRatioForFuckingIpad,70/textureRatioForFuckingIpad)];
            
            if(isIpad){
                [s_Turtle_Shell setTextureRect:CGRectMake(396,204,108,70)];
            }
        }
        if(color == kTurtleShellColor_Brown){
            [s_Turtle_Shell setTextureRect:CGRectMake(396/textureRatioForFuckingIpad,204/textureRatioForFuckingIpad,108/textureRatioForFuckingIpad,70/textureRatioForFuckingIpad)];
            
            if(isIpad){
                [s_Turtle_Shell setTextureRect:CGRectMake(396,204,108,70)];
            }
        }
        if(color == kTurtleShellColor_Red){
            [s_Turtle_Shell setTextureRect:CGRectMake(756/textureRatioForFuckingIpad,642/textureRatioForFuckingIpad,108/textureRatioForFuckingIpad,70/textureRatioForFuckingIpad)];
        }
        if(color == kTurtleShellColor_Green){
            [s_Turtle_Shell setTextureRect:CGRectMake(756/textureRatioForFuckingIpad,460/textureRatioForFuckingIpad,108/textureRatioForFuckingIpad,70/textureRatioForFuckingIpad)];
        }
        if(color == kTurtleShellColor_Blue){
            [s_Turtle_Shell setTextureRect:CGRectMake(756/textureRatioForFuckingIpad,552/textureRatioForFuckingIpad,108/textureRatioForFuckingIpad,70/textureRatioForFuckingIpad)];
        }
        
        [s_Turtle_Shell setAnchorPoint:ccp(54/108.0, 1.0 - 46.0/71.0)];
    }
    
    if(shellLevel == 1){
        if(color == kTurtleShellColor_BrownOri){
            [s_Turtle_Shell setTextureRect:CGRectMake(948/textureRatioForFuckingIpad,370/textureRatioForFuckingIpad,108/textureRatioForFuckingIpad,76/textureRatioForFuckingIpad)];
            
            if(isIpad){
                [s_Turtle_Shell setTextureRect:CGRectMake(948,370,108,76)];
            }
        }
        if(color == kTurtleShellColor_Brown){
            [s_Turtle_Shell setTextureRect:CGRectMake(1938/textureRatioForFuckingIpad,380/textureRatioForFuckingIpad,108/textureRatioForFuckingIpad,76/textureRatioForFuckingIpad)];
            
            if(isIpad){
                [s_Turtle_Shell setTextureRect:CGRectMake(1938,380,108,76)];
            }
        }
        if(color == kTurtleShellColor_Red){
            [s_Turtle_Shell setTextureRect:CGRectMake(866/textureRatioForFuckingIpad,642/textureRatioForFuckingIpad,108/textureRatioForFuckingIpad,76/textureRatioForFuckingIpad)];
        }
        if(color == kTurtleShellColor_Green){
            [s_Turtle_Shell setTextureRect:CGRectMake(866/textureRatioForFuckingIpad,460/textureRatioForFuckingIpad,108/textureRatioForFuckingIpad,76/textureRatioForFuckingIpad)];
        }
        if(color == kTurtleShellColor_Blue){
            [s_Turtle_Shell setTextureRect:CGRectMake(866/textureRatioForFuckingIpad,552/textureRatioForFuckingIpad,108/textureRatioForFuckingIpad,76/textureRatioForFuckingIpad)];
        }
        
        [s_Turtle_Shell setAnchorPoint:ccp(54/108.0, 1.0 - 52.0/76.0)];
    }
    
    if(shellLevel == 2){
        hasSpike = true;
        if(color == kTurtleShellColor_BrownOri){
            [s_Turtle_Shell setTextureRect:CGRectMake(836/textureRatioForFuckingIpad,370/textureRatioForFuckingIpad,108/textureRatioForFuckingIpad,86/textureRatioForFuckingIpad)];
            
            if(isIpad){
                [s_Turtle_Shell setTextureRect:CGRectMake(836,370,108,86)];
            }
        }
        if(color == kTurtleShellColor_Brown){
            [s_Turtle_Shell setTextureRect:CGRectMake(1700/textureRatioForFuckingIpad,380/textureRatioForFuckingIpad,108/textureRatioForFuckingIpad,86/textureRatioForFuckingIpad)];
            if(isIpad){
                [s_Turtle_Shell setTextureRect:CGRectMake(1700,380,108,86)];
            }
        }
        if(color == kTurtleShellColor_Red){
            [s_Turtle_Shell setTextureRect:CGRectMake(1090/textureRatioForFuckingIpad,642/textureRatioForFuckingIpad,108/textureRatioForFuckingIpad,86/textureRatioForFuckingIpad)];
        }
        if(color == kTurtleShellColor_Green){
            [s_Turtle_Shell setTextureRect:CGRectMake(1090/textureRatioForFuckingIpad,460/textureRatioForFuckingIpad,108/textureRatioForFuckingIpad,86/textureRatioForFuckingIpad)];
        }
        if(color == kTurtleShellColor_Blue){
            [s_Turtle_Shell setTextureRect:CGRectMake(1090/textureRatioForFuckingIpad,552/textureRatioForFuckingIpad,108/textureRatioForFuckingIpad,86/textureRatioForFuckingIpad)];
        }
        
        [s_Turtle_Shell setAnchorPoint:ccp(54/108.0, 1.0 - 62.0/86.0)];
    }
}

-(void) tap{

    if(status == kTurtleAniStatus_Normal_In || status == kTurtleAniStatus_Shaking || status == kTurtleAniStatus_Bombing){
        
        if(currentChosenMiniGame == 3){
            [self setToBombing];
        }else{
            if(delegate){
                [delegate tapWrongly];
            }
            
            [uILayer lostCombo];
            [self setStatus:kTurtleAniStatus_Shaking];
            
            //if(delegate){
            //    [delegate tapWrongly];
            //}
            
            
            [musicController playThisSound:kSound_TapWrongly isLoop:NO gain:1.0];
        }
        
        
        
        return;
    }
    
    if(status == kTurtleAniStatus_Bombing){
        return;
    }
    
    hurtTime++;
    
    
    [uILayer gainCombo:1];
    counterForAchivement++;
    
    if(hasSpike){
        hasSpike = false;
        spikeRemoveAniTimer = 0;
        spikeRemoveIsAni = true;
    }
    
    if(shellLevel == 0){
        if(hurtTime == 1){
           // printf("I want fuck you\n");
            [self setToBombing];
        }
    }
    
    if(shellLevel == 1){
        if(hurtTime == 1){
            if(color == kTurtleShellColor_BrownOri){
                [s_Turtle_Shell setTextureRect:CGRectMake(1058/textureRatioForFuckingIpad,370/textureRatioForFuckingIpad,108/textureRatioForFuckingIpad,76/textureRatioForFuckingIpad)];
                
                if(isIpad){
                    [s_Turtle_Shell setTextureRect:CGRectMake(1058,370,108,76)];
                }
            }
            if(color == kTurtleShellColor_Brown){
                [s_Turtle_Shell setTextureRect:CGRectMake(1058/textureRatioForFuckingIpad,370/textureRatioForFuckingIpad,108/textureRatioForFuckingIpad,76/textureRatioForFuckingIpad)];
                
                if(isIpad){
                    [s_Turtle_Shell setTextureRect:CGRectMake(1058,370,108,76)];
                }
            }
            if(color == kTurtleShellColor_Red){
                [s_Turtle_Shell setTextureRect:CGRectMake(978/textureRatioForFuckingIpad,642/textureRatioForFuckingIpad,108/textureRatioForFuckingIpad,76/textureRatioForFuckingIpad)];
            }
            if(color == kTurtleShellColor_Green){
                [s_Turtle_Shell setTextureRect:CGRectMake(978/textureRatioForFuckingIpad,460/textureRatioForFuckingIpad,108/textureRatioForFuckingIpad,76/textureRatioForFuckingIpad)];
            }
            if(color == kTurtleShellColor_Blue){
                [s_Turtle_Shell setTextureRect:CGRectMake(978/textureRatioForFuckingIpad,552/textureRatioForFuckingIpad,108/textureRatioForFuckingIpad,76/textureRatioForFuckingIpad)];
            }
            
            [s_Turtle_Shell setAnchorPoint:ccp(54/108.0, 1.0 - 52.0/76.0)];
            
            [musicController playThisSound:kSound_CrackShell isLoop:NO gain:1.0];
        }
        
        if(hurtTime == 2){
            [self setToBombing];
        }
    }
    
    if(shellLevel == 2){
        if(hurtTime == 1){
            if(color == kTurtleShellColor_BrownOri){
                [s_Turtle_Shell setTextureRect:CGRectMake(614/textureRatioForFuckingIpad,370/textureRatioForFuckingIpad,108/textureRatioForFuckingIpad,76/textureRatioForFuckingIpad)];
                
                if(isIpad){
                    [s_Turtle_Shell setTextureRect:CGRectMake(614,370,108,76)];
                }
            }
            if(color == kTurtleShellColor_Brown){
                [s_Turtle_Shell setTextureRect:CGRectMake(1202/textureRatioForFuckingIpad,370/textureRatioForFuckingIpad,108/textureRatioForFuckingIpad,76/textureRatioForFuckingIpad)];
                
                if(isIpad){
                    [s_Turtle_Shell setTextureRect:CGRectMake(1202, 370,108,76)];
                }
            }
            if(color == kTurtleShellColor_Red){
                [s_Turtle_Shell setTextureRect:CGRectMake(1202/textureRatioForFuckingIpad,642/textureRatioForFuckingIpad,108/textureRatioForFuckingIpad,76/textureRatioForFuckingIpad)];
            }
            if(color == kTurtleShellColor_Green){
                [s_Turtle_Shell setTextureRect:CGRectMake(1202/textureRatioForFuckingIpad,460/textureRatioForFuckingIpad,108/textureRatioForFuckingIpad,76/textureRatioForFuckingIpad)];
            }
            if(color == kTurtleShellColor_Blue){
                [s_Turtle_Shell setTextureRect:CGRectMake(1202/textureRatioForFuckingIpad,552/textureRatioForFuckingIpad,108/textureRatioForFuckingIpad,76/textureRatioForFuckingIpad)];
            }
           
            [s_Turtle_Shell setAnchorPoint:ccp(54/108.0, 1.0 - 52.0/76.0)];
            
            [musicController playThisSound:kSound_CrackShell isLoop:NO gain:1.0];
        }
        
        if(hurtTime == 2){
            if(color == kTurtleShellColor_BrownOri){
                [s_Turtle_Shell setTextureRect:CGRectMake(724/textureRatioForFuckingIpad,370/textureRatioForFuckingIpad,108/textureRatioForFuckingIpad,76/textureRatioForFuckingIpad)];
                if(isIpad){
                    [s_Turtle_Shell setTextureRect:CGRectMake(724,370,108,76)];
                }
            }
            if(color == kTurtleShellColor_Brown){
                [s_Turtle_Shell setTextureRect:CGRectMake(1314/textureRatioForFuckingIpad,370/textureRatioForFuckingIpad,108/textureRatioForFuckingIpad,76/textureRatioForFuckingIpad)];
                
                if(isIpad){
                    [s_Turtle_Shell setTextureRect:CGRectMake(1314,370,108,76)];
                }
            }
            if(color == kTurtleShellColor_Red){
                [s_Turtle_Shell setTextureRect:CGRectMake(1314/textureRatioForFuckingIpad,640/textureRatioForFuckingIpad,108/textureRatioForFuckingIpad,76/textureRatioForFuckingIpad)];
            }
            if(color == kTurtleShellColor_Green){
                [s_Turtle_Shell setTextureRect:CGRectMake(1314/textureRatioForFuckingIpad,460/textureRatioForFuckingIpad,108/textureRatioForFuckingIpad,76/textureRatioForFuckingIpad)];
            }
            if(color == kTurtleShellColor_Blue){
                [s_Turtle_Shell setTextureRect:CGRectMake(1314/textureRatioForFuckingIpad,552/textureRatioForFuckingIpad,108/textureRatioForFuckingIpad,76/textureRatioForFuckingIpad)];
            }
            
            [s_Turtle_Shell setAnchorPoint:ccp(54/108.0, 1.0 - 52.0/76.0)];
            
            [musicController playThisSound:kSound_CrackShell isLoop:NO gain:1.0];
        }
        
        if(hurtTime == 3){
            [self setToBombing];
        }
    }
    
}

-(void) tap2{
    
    hurtTime++;

    if(currentChosenMiniGame != 10){
        [uILayer gainCombo:1];
        counterForAchivement++;
    }
    
    
    if(hasSpike){
        hasSpike = false;
        spikeRemoveAniTimer = 0;
        spikeRemoveIsAni = true;
    }
    
    if(shellLevel == 0){
        if(hurtTime == 1){
            [self setToBombing];
        }
    }
    
    if(shellLevel == 1){
        if(hurtTime == 1){
            [self setToBombing];
        }
    }
    
    if(shellLevel == 2){
        if(hurtTime == 1){
            
            [self setStatus:kTurtleAniStatus_Shaking];
            
            if(color == kTurtleShellColor_BrownOri){
                [s_Turtle_Shell setTextureRect:CGRectMake(724/textureRatioForFuckingIpad,370/textureRatioForFuckingIpad,108/textureRatioForFuckingIpad,76/textureRatioForFuckingIpad)];
                if(isIpad){
                    [s_Turtle_Shell setTextureRect:CGRectMake(724,370,108,76)];
                }
            }
            if(color == kTurtleShellColor_Brown){
                [s_Turtle_Shell setTextureRect:CGRectMake(1816/textureRatioForFuckingIpad,380/textureRatioForFuckingIpad,108/textureRatioForFuckingIpad,76/textureRatioForFuckingIpad)];
                
                if(isIpad){
                    [s_Turtle_Shell setTextureRect:CGRectMake(1816,380,108,76)];
                }
            }
            if(color == kTurtleShellColor_Red){
                [s_Turtle_Shell setTextureRect:CGRectMake(1314/textureRatioForFuckingIpad,640/textureRatioForFuckingIpad,108/textureRatioForFuckingIpad,76/textureRatioForFuckingIpad)];
            }
            if(color == kTurtleShellColor_Green){
                [s_Turtle_Shell setTextureRect:CGRectMake(1314/textureRatioForFuckingIpad,460/textureRatioForFuckingIpad,108/textureRatioForFuckingIpad,76/textureRatioForFuckingIpad)];
            }
            if(color == kTurtleShellColor_Blue){
                [s_Turtle_Shell setTextureRect:CGRectMake(1314/textureRatioForFuckingIpad,552/textureRatioForFuckingIpad,108/textureRatioForFuckingIpad,76/textureRatioForFuckingIpad)];
            }
            
            [s_Turtle_Shell setAnchorPoint:ccp(54/108.0, 1.0 - 52.0/76.0)];
        }
        
        if(hurtTime == 2){
            [self setToBombing];
            
            /*if(color == kTurtleShellColor_BrownOri){
                [s_Turtle_Shell setTextureRect:CGRectMake(724/textureRatioForFuckingIpad,370/textureRatioForFuckingIpad,108/textureRatioForFuckingIpad,76/textureRatioForFuckingIpad)];
            }
            if(color == kTurtleShellColor_Brown){
                [s_Turtle_Shell setTextureRect:CGRectMake(1314/textureRatioForFuckingIpad,370/textureRatioForFuckingIpad,108/textureRatioForFuckingIpad,76/textureRatioForFuckingIpad)];
            }
            if(color == kTurtleShellColor_Red){
                [s_Turtle_Shell setTextureRect:CGRectMake(1314/textureRatioForFuckingIpad,640/textureRatioForFuckingIpad,108/textureRatioForFuckingIpad,76/textureRatioForFuckingIpad)];
            }
            if(color == kTurtleShellColor_Green){
                [s_Turtle_Shell setTextureRect:CGRectMake(1314/textureRatioForFuckingIpad,460/textureRatioForFuckingIpad,108/textureRatioForFuckingIpad,76/textureRatioForFuckingIpad)];
            }
            if(color == kTurtleShellColor_Blue){
                [s_Turtle_Shell setTextureRect:CGRectMake(1314/textureRatioForFuckingIpad,552/textureRatioForFuckingIpad,108/textureRatioForFuckingIpad,76/textureRatioForFuckingIpad)];
            }
            
            [s_Turtle_Shell setAnchorPoint:ccp(54/108.0, 1.0 - 52.0/76.0)];*/
        }
        
    }
    
}

-(void) bombButLoseCombo{
    hurtTime = 0;
    
    [playLayer setToBombing:turtleX turtleY:turtleY];
    [self setY:-99999];
}

-(void) tap3{
    
    hurtTime++;
    
    [uILayer gainCombo:1];
    counterForAchivement++;
    
    
    if(hasSpike){
        hasSpike = false;
        spikeRemoveAniTimer = 0;
        spikeRemoveIsAni = true;
    }
    
    if(shellLevel == 0){
        if(hurtTime == 1){
             //printf("I want fuck you\n");
            [self setToBombing];
            [self setY:-99999];
        }
    }
    
    if(shellLevel == 1){
        if(hurtTime == 1){
            if(color == kTurtleShellColor_BrownOri){
                [s_Turtle_Shell setTextureRect:CGRectMake(1058/textureRatioForFuckingIpad,370/textureRatioForFuckingIpad,108/textureRatioForFuckingIpad,76/textureRatioForFuckingIpad)];
                if(isIpad){
                    [s_Turtle_Shell setTextureRect:CGRectMake(1058,370,108,76)];
                }
            }
            if(color == kTurtleShellColor_Brown){
                [s_Turtle_Shell setTextureRect:CGRectMake(1058/textureRatioForFuckingIpad,370/textureRatioForFuckingIpad,108/textureRatioForFuckingIpad,76/textureRatioForFuckingIpad)];
                if(isIpad){
                    [s_Turtle_Shell setTextureRect:CGRectMake(1058,370,108,76)];
                }
            }
            if(color == kTurtleShellColor_Red){
                [s_Turtle_Shell setTextureRect:CGRectMake(978/textureRatioForFuckingIpad,642/textureRatioForFuckingIpad,108/textureRatioForFuckingIpad,76/textureRatioForFuckingIpad)];
            }
            if(color == kTurtleShellColor_Green){
                [s_Turtle_Shell setTextureRect:CGRectMake(978/textureRatioForFuckingIpad,460/textureRatioForFuckingIpad,108/textureRatioForFuckingIpad,76/textureRatioForFuckingIpad)];
            }
            if(color == kTurtleShellColor_Blue){
                [s_Turtle_Shell setTextureRect:CGRectMake(978/textureRatioForFuckingIpad,552/textureRatioForFuckingIpad,108/textureRatioForFuckingIpad,76/textureRatioForFuckingIpad)];
            }
            
            [s_Turtle_Shell setAnchorPoint:ccp(54/108.0, 1.0 - 52.0/76.0)];
            
            [musicController playThisSound:kSound_CrackShell isLoop:NO gain:0.5];
            
            [self setToBombingForMiniGame03];
        }
        
        if(hurtTime == 2){
            [self setToBombing];
            [self setY:-99999];
        }
    }
    
    if(shellLevel == 2){
        if(hurtTime == 1){
            if(color == kTurtleShellColor_BrownOri){
                [s_Turtle_Shell setTextureRect:CGRectMake(614/textureRatioForFuckingIpad,370/textureRatioForFuckingIpad,108/textureRatioForFuckingIpad,76/textureRatioForFuckingIpad)];
                if(isIpad){
                     [s_Turtle_Shell setTextureRect:CGRectMake(614,370,108,76)];
                }
            }
            if(color == kTurtleShellColor_Brown){
                [s_Turtle_Shell setTextureRect:CGRectMake(1202/textureRatioForFuckingIpad,370/textureRatioForFuckingIpad,108/textureRatioForFuckingIpad,76/textureRatioForFuckingIpad)];
                
                if(isIpad){
                    [s_Turtle_Shell setTextureRect:CGRectMake(1202,370,108,76)];
                }
            }
            if(color == kTurtleShellColor_Red){
                [s_Turtle_Shell setTextureRect:CGRectMake(1202/textureRatioForFuckingIpad,642/textureRatioForFuckingIpad,108/textureRatioForFuckingIpad,76/textureRatioForFuckingIpad)];
            }
            if(color == kTurtleShellColor_Green){
                [s_Turtle_Shell setTextureRect:CGRectMake(1202/textureRatioForFuckingIpad,460/textureRatioForFuckingIpad,108/textureRatioForFuckingIpad,76/textureRatioForFuckingIpad)];
            }
            if(color == kTurtleShellColor_Blue){
                [s_Turtle_Shell setTextureRect:CGRectMake(1202/textureRatioForFuckingIpad,552/textureRatioForFuckingIpad,108/textureRatioForFuckingIpad,76/textureRatioForFuckingIpad)];
            }
            
            [s_Turtle_Shell setAnchorPoint:ccp(54/108.0, 1.0 - 52.0/76.0)];
            
            [musicController playThisSound:kSound_CrackShell isLoop:NO gain:0.5];
            
            [self setToBombingForMiniGame03];
        }
        
        if(hurtTime == 2){
            if(color == kTurtleShellColor_BrownOri){
                [s_Turtle_Shell setTextureRect:CGRectMake(724/textureRatioForFuckingIpad,370/textureRatioForFuckingIpad,108/textureRatioForFuckingIpad,76/textureRatioForFuckingIpad)];
                
                if(isIpad){
                     [s_Turtle_Shell setTextureRect:CGRectMake(724,370,108,76)];
                }
            }
            if(color == kTurtleShellColor_Brown){
                [s_Turtle_Shell setTextureRect:CGRectMake(1314/textureRatioForFuckingIpad,370/textureRatioForFuckingIpad,108/textureRatioForFuckingIpad,76/textureRatioForFuckingIpad)];
                
                if(isIpad){
                     [s_Turtle_Shell setTextureRect:CGRectMake(1314,370,108,76)];
                }
            }
            if(color == kTurtleShellColor_Red){
                [s_Turtle_Shell setTextureRect:CGRectMake(1314/textureRatioForFuckingIpad,640/textureRatioForFuckingIpad,108/textureRatioForFuckingIpad,76/textureRatioForFuckingIpad)];
            }
            if(color == kTurtleShellColor_Green){
                [s_Turtle_Shell setTextureRect:CGRectMake(1314/textureRatioForFuckingIpad,460/textureRatioForFuckingIpad,108/textureRatioForFuckingIpad,76/textureRatioForFuckingIpad)];
            }
            if(color == kTurtleShellColor_Blue){
                [s_Turtle_Shell setTextureRect:CGRectMake(1314/textureRatioForFuckingIpad,552/textureRatioForFuckingIpad,108/textureRatioForFuckingIpad,76/textureRatioForFuckingIpad)];
            }
            
            [s_Turtle_Shell setAnchorPoint:ccp(54/108.0, 1.0 - 52.0/76.0)];
            
            [musicController playThisSound:kSound_CrackShell isLoop:NO gain:0.5];
            
            [self setToBombingForMiniGame03];
        }
        
        if(hurtTime == 3){
            [self setToBombing];
            [self setY:-99999];
        }
    }
    
}



-(void) manageSpike{
    if(!spikeRemoveIsAni){
        return;
    }
    
    if(spikeRemoveAniTimer == 0){
        // [s_Turtle_Shell setTextureRect:CGRectMake(504/textureRatioForFuckingIpad,370/textureRatioForFuckingIpad,108/textureRatioForFuckingIpad,76/textureRatioForFuckingIpad)];
        // [s_Turtle_Shell setAnchorPoint:ccp(54/108.0, 1.0 - 52.0/76.0)];
        
        spikePosX[0] = s_Turtle_Shell.position.x - 32 * wholeTurtleScaleFromSocurce;
        spikePosX[1] = s_Turtle_Shell.position.x + 2 * wholeTurtleScaleFromSocurce;
        spikePosX[2] = s_Turtle_Shell.position.x + 32 * wholeTurtleScaleFromSocurce;
        spikePosX[3] = s_Turtle_Shell.position.x + 0 * wholeTurtleScaleFromSocurce;
        
        spikePosY[0] = s_Turtle_Shell.position.y + 34 * wholeTurtleScaleFromSocurce;
        spikePosY[1] = s_Turtle_Shell.position.y + 53 * wholeTurtleScaleFromSocurce;
        spikePosY[2] = s_Turtle_Shell.position.y + 30 * wholeTurtleScaleFromSocurce;
        spikePosY[3] = s_Turtle_Shell.position.y + 15 * wholeTurtleScaleFromSocurce;
        
        spikeOpacity = 255;
    }
    
    
    spikeOpacity -= 30;
    if(spikeOpacity < 0){
        spikeOpacity = 0;
    }
    
    spikePosY[0] += 1.0;
    spikePosY[1] += 1.0;
    spikePosY[2] += 1.0;
    spikePosY[3] += 1.0;
    
    spikePosX[0] += -1.0;
    spikePosX[1] += 0;
    spikePosX[2] += 1.0;
    spikePosX[3] += 0;
    
    for(int i = 0 ; i < 4 ; i++){
        superFuxkAngleDiff = -turtleRotation * M_PI/180;
        superFuxkOriX =   spikePosX[i];
        superFuxkOriY =   spikePosY[i];
       // turtle_Spike_x[i] = spikePosX[i];
       // turtle_Spike_y[i] = spikePosY[i];
        turtle_Spike_x[i] =    superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
        turtle_Spike_y[i] =    superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
        
        [s_Turtle_Spike[i] setOpacity:spikeOpacity];
    }
    
    
    spikeRemoveAniTimer++;
}

-(void) setToBombing{
    if(currentChosenMiniGame != 10){
        gameRound++;
        gameRoundFromBegin++;
    }
    
    //printf("setToBomb:%i\n",gameRound);
     //printf("setToBombing\n");
    if(currentChosenMiniGame == 4 || currentChosenMiniGame == 1 || currentChosenMiniGame == 13){
       // printf("setToBombing2\n");
        if(status != kTurtleAniStatus_In){
            if(delegate){
                [delegate turtleBombed:momentIdx];
            }
            
        }
    }
    
    if(currentChosenMiniGame == 3){
        [delegate turtleBombed:momentIdx];
    }
    
    [playLayer setToBombing:turtleX turtleY:turtleY];
    if(currentChosenMiniGame != 3){
        [self setStatus:kTurtleAniStatus_Bombing];
    }
   
    if(currentChosenMiniGame == 3){
        //[musicController playThisSound:kSound_ComboSmoke isLoop:NO gain:0.5];
       // [musicController playThisSound:kSound_CrackShell isLoop:NO gain:0.15];
        [musicController playThisSound:kSound_ComboSmoke isLoop:NO gain:0.75];
        [musicController playThisSound:kSound_CrackShell isLoop:NO gain:0.2];
    }else{
        [musicController playThisSound:kSound_ComboSmoke isLoop:NO gain:1.0];
        [musicController playThisSound:kSound_CrackShell isLoop:NO gain:0.3];
    }
    
}

-(void) setToBombingForMiniGame03{
    [musicController playThisSound:kSound_ComboSmoke isLoop:NO gain:1.0];
    [musicController playThisSound:kSound_CrackShell isLoop:NO gain:0.3];
    
    [playLayer setToShakingBomb:turtleX turtleY:turtleY];
    
    if(bombOutType == kTurtleBombOutType_bombOutOffScreenWithGravity){
        static int ranV;
        ranV = arc4random()%3;
        
        /*if(turtleY > 200){
         turtleVY = 10;
        }else{
         turtleVY = 15;
        }*/
        turtleVY = (360 - turtleY)/16;
        if(turtleVY > 15){
            turtleVY = 15;
        }
        if(turtleVY < 10){
            turtleVY = 10;
        }
       
        
        ranV = arc4random()%100;
        turtleVX *= 0.5 + 0.1 * ranV/100;
        
        if(arc4random() % 2 == 0){
           // turtleVX *= -1;
        }
    }
}

-(void) setBombOutType:(int)_bombOutType{
    bombOutType = _bombOutType;
}

-(void) manageBombAni{
    
}

-(void) shotFromCannonAtX:(float)_x y:(float)_y force:(float)_force angle:(float)_angle{
    static int ranXRatio;
    ranXRatio = arc4random()%100;
    
    [self setX:_x];
    [self setY:_y];
    turtleVX = _force * cos(-_angle * M_PI/180) * ( 1 + 0.5 * ranXRatio/100);
    turtleVY = _force * sin(-_angle * M_PI/180) * 2.5;
    
    turtleVR = 0;
    turtleAR = _force/4.0;
    
   // printf("turtleVY:%4.8f %4.8f\n",turtleVX,turtleVY);
}

-(void) changeToBombShell{
  //  printf("changeToBombShell:%i\n",idNumber);
    [s_Turtle_Shell setTextureRect:CGRectMake(1434/2,610/2,110/2,86/2)];
    if(isIpad){
        [s_Turtle_Shell setTextureRect:CGRectMake(1434,610,110,86)];
    }
    isBombShell = true;
    
    turtle_HeadAndNeck_x = 100000;
    turtle_Head_x = 100000;
    turtle_Jaw_x = 100000;
    turtle_Neck_x = 100000;
    turtle_LeftLeg_x = 100000;
    turtle_RightLeg_x = 100000;
    turtle_Tail_x = 100000;
    turtle_Eye_x = 100000;
}

-(void) changeToNormalShell{
    //  printf("changeToBombShell:%i\n",idNumber);
    [s_Turtle_Shell setTextureRect:CGRectMake(396/2,204/2,108/2,70/2)];
    if(isIpad){
        [s_Turtle_Shell setTextureRect:CGRectMake(396,204,108,70)];
    }
    isBombShell = true;
    
    turtle_HeadAndNeck_x = 100000;
    turtle_Head_x = 100000;
    turtle_Jaw_x = 100000;
    turtle_Neck_x = 100000;
    turtle_LeftLeg_x = 100000;
    turtle_RightLeg_x = 100000;
    turtle_Tail_x = 100000;
    turtle_Eye_x = 100000;
}


-(void) setYellowHurt{
    isYellowHurt = true;
    yellowHurtTimer = 0;
}

-(void) manageYellowHurt{
    
    static float rr;
    static float gg;
    static float bb;
    
    if(isYellowHurt){
        if(yellowHurtTimer == 0){
            
            rr = 255;
            gg = 195;
            bb = 124;
            
            [s_Turtle_HeadAndNeck setColor:ccc3(rr, gg, bb)];
            [s_Turtle_Head setColor:ccc3(rr, gg, bb)];
            [s_Turtle_Jaw setColor:ccc3(rr, gg, bb)];
            [s_Turtle_Neck setColor:ccc3(rr, gg, bb)];
            [s_Turtle_Shell setColor:ccc3(rr, gg, bb)];
            [s_Turtle_LeftLeg setColor:ccc3(rr, gg, bb)];
            [s_Turtle_RightLeg setColor:ccc3(rr, gg, bb)];
            [s_Turtle_Tail setColor:ccc3(rr, gg, bb)];
            [s_Turtle_Shadow setColor:ccc3(rr, gg, bb)];
            [s_Turtle_Eye setColor:ccc3(rr, gg, bb)];
            [s_Turtle_Spike[0] setColor:ccc3(rr, gg, bb)];
            [s_Turtle_Spike[1] setColor:ccc3(rr, gg, bb)];
            [s_Turtle_Spike[2] setColor:ccc3(rr, gg, bb)];
            [s_Turtle_Spike[3] setColor:ccc3(rr, gg, bb)];
        }
        
        yellowHurtTimer++;
        if(yellowHurtTimer == 2){
            isYellowHurt = false;
            
            rr = 255;
            gg = 255;
            bb = 255;
            
            [s_Turtle_HeadAndNeck setColor:ccc3(rr, gg, bb)];
            [s_Turtle_Head setColor:ccc3(rr, gg, bb)];
            [s_Turtle_Jaw setColor:ccc3(rr, gg, bb)];
            [s_Turtle_Neck setColor:ccc3(rr, gg, bb)];
            [s_Turtle_Shell setColor:ccc3(rr, gg, bb)];
            [s_Turtle_LeftLeg setColor:ccc3(rr, gg, bb)];
            [s_Turtle_RightLeg setColor:ccc3(rr, gg, bb)];
            [s_Turtle_Tail setColor:ccc3(rr, gg, bb)];
            [s_Turtle_Shadow setColor:ccc3(rr, gg, bb)];
            [s_Turtle_Eye setColor:ccc3(rr, gg, bb)];
            [s_Turtle_Spike[0] setColor:ccc3(rr, gg, bb)];
            [s_Turtle_Spike[1] setColor:ccc3(rr, gg, bb)];
            [s_Turtle_Spike[2] setColor:ccc3(rr, gg, bb)];
            [s_Turtle_Spike[3] setColor:ccc3(rr, gg, bb)];
            
        }
    }
}


//FOR MAIN
-(void) turtleFlying{
    //  [self turtleTempIdle];
    // return;
    
    turtleAniStep = characterFlyingStep;
    
    static float fuckScale =  1.37119664;
   // static float fuckScale =  1.0;
    //wholeTurtleScaleFromSocurce = 1.0;
    
    // printf("turtleAniStep:%4.8f %4.8f %4.8f\n",turtleX,turtleY, turtleX + frameData[IdleTurtleAnim.spriteData[kTurtlePart_Neck].firstFrame + turtleAniStep].x * wholeTurtleScaleFromSocurce);
    
    superFuxkAngleDiff = -turtleRotation * M_PI/180;
    superFuxkOriX =  frameData[RocketAnim.spriteData[kTurtlePart_Neck].firstFrame + turtleAniStep].x * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
    superFuxkOriY =  frameData[RocketAnim.spriteData[kTurtlePart_Neck].firstFrame + turtleAniStep].y * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
    turtle_Neck_x =  turtleX + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
    turtle_Neck_y =  turtleY + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
    
    superFuxkAngleDiff = -turtleRotation * M_PI/180;
    superFuxkOriX =  frameData[RocketAnim.spriteData[kTurtlePart_Head].firstFrame + turtleAniStep].x * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
    superFuxkOriY =  frameData[RocketAnim.spriteData[kTurtlePart_Head].firstFrame + turtleAniStep].y * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
    turtle_Head_x =  turtleX + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
    turtle_Head_y =  turtleY + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
    
    superFuxkAngleDiff = -turtleRotation * M_PI/180;
    superFuxkOriX =  frameData[RocketAnim.spriteData[kTurtlePart_Shell].firstFrame + turtleAniStep].x * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
    superFuxkOriY =  frameData[RocketAnim.spriteData[kTurtlePart_Shell].firstFrame + turtleAniStep].y * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
    turtle_Shell_x =  turtleX + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
    turtle_Shell_y =  turtleY + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
    
    superFuxkAngleDiff = -turtleRotation * M_PI/180;
    superFuxkOriX =  frameData[RocketAnim.spriteData[kTurtlePart_LeftLeg].firstFrame + turtleAniStep].x * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
    superFuxkOriY =  frameData[RocketAnim.spriteData[kTurtlePart_LeftLeg].firstFrame + turtleAniStep].y * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
    turtle_LeftLeg_x =  turtleX + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
    turtle_LeftLeg_y =  turtleY + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
    
    superFuxkAngleDiff = -turtleRotation * M_PI/180;
    superFuxkOriX =  frameData[RocketAnim.spriteData[kTurtlePart_RightLeg].firstFrame + turtleAniStep].x * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
    superFuxkOriY =  frameData[RocketAnim.spriteData[kTurtlePart_RightLeg].firstFrame + turtleAniStep].y * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
    turtle_RightLeg_x =  turtleX + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
    turtle_RightLeg_y =  turtleY + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
    
    superFuxkAngleDiff = -turtleRotation * M_PI/180;
    superFuxkOriX =  frameData[RocketAnim.spriteData[kTurtlePart_Tail].firstFrame + turtleAniStep].x * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
    superFuxkOriY =  frameData[RocketAnim.spriteData[kTurtlePart_Tail].firstFrame + turtleAniStep].y * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
    turtle_Tail_x =  turtleX + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
    turtle_Tail_y =  turtleY + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
    
   
    turtle_Neck_r = frameData[RocketAnim.spriteData[kTurtlePart_Neck].firstFrame + turtleAniStep].rotation * 180/M_PI + turtleRotation + 180;
    turtle_Head_r = frameData[RocketAnim.spriteData[kTurtlePart_Head].firstFrame + turtleAniStep].rotation * 180/M_PI + turtleRotation + 180;
    turtle_Shell_r = frameData[RocketAnim.spriteData[kTurtlePart_Shell].firstFrame + turtleAniStep].rotation * 180/M_PI + turtleRotation + 180;
    turtle_LeftLeg_r = frameData[RocketAnim.spriteData[kTurtlePart_LeftLeg].firstFrame + turtleAniStep].rotation * 180/M_PI + turtleRotation + 180;
    turtle_RightLeg_r = frameData[RocketAnim.spriteData[kTurtlePart_RightLeg].firstFrame + turtleAniStep].rotation * 180/M_PI + turtleRotation + 180;
    turtle_Tail_r = frameData[RocketAnim.spriteData[kTurtlePart_Tail].firstFrame + turtleAniStep].rotation * 180/M_PI + turtleRotation + 180;
    
    //printf("turtleRotation:%4.8f %4.8f\n",turtleRotation, turtle_Head_r);
    [s_Turtle_Neck setRotation:turtle_Neck_r];
    [s_Turtle_Head setRotation:turtle_Head_r];
    [s_Turtle_Shell setRotation:turtle_Shell_r];
    [s_Turtle_LeftLeg setRotation:turtle_LeftLeg_r];
    [s_Turtle_RightLeg setRotation:turtle_RightLeg_r];
    [s_Turtle_Tail setRotation:turtle_Tail_r];

   
    [s_Turtle_Neck setScaleX:-frameData[RocketAnim.spriteData[kTurtlePart_Neck].firstFrame + turtleAniStep].scaleX * wholeTurtleScaleFromSocurce * 2 * fuckScale];
    [s_Turtle_Head setScaleX:-frameData[RocketAnim.spriteData[kTurtlePart_Head].firstFrame + turtleAniStep].scaleX * wholeTurtleScaleFromSocurce * 2 * fuckScale];
    [s_Turtle_Shell setScaleX:-frameData[RocketAnim.spriteData[kTurtlePart_Shell].firstFrame + turtleAniStep].scaleX * wholeTurtleScaleFromSocurce * 2 * fuckScale];
    [s_Turtle_LeftLeg setScaleX:-frameData[RocketAnim.spriteData[kTurtlePart_LeftLeg].firstFrame + turtleAniStep].scaleX * wholeTurtleScaleFromSocurce * 2 * fuckScale];
    [s_Turtle_RightLeg setScaleX:-frameData[RocketAnim.spriteData[kTurtlePart_RightLeg].firstFrame + turtleAniStep].scaleX * wholeTurtleScaleFromSocurce * 2 * fuckScale];
    [s_Turtle_Tail setScaleX:-frameData[RocketAnim.spriteData[kTurtlePart_Tail].firstFrame + turtleAniStep].scaleX * wholeTurtleScaleFromSocurce * 2 * fuckScale];
    
    [s_Turtle_Neck setScaleY:frameData[RocketAnim.spriteData[kTurtlePart_Neck].firstFrame + turtleAniStep].scaleY * wholeTurtleScaleFromSocurce * 2 * fuckScale];
    [s_Turtle_Head setScaleY:frameData[RocketAnim.spriteData[kTurtlePart_Head].firstFrame + turtleAniStep].scaleY * wholeTurtleScaleFromSocurce * 2 * fuckScale];
    [s_Turtle_Shell setScaleY:frameData[RocketAnim.spriteData[kTurtlePart_Shell].firstFrame + turtleAniStep].scaleY * wholeTurtleScaleFromSocurce * 2 * fuckScale];
    [s_Turtle_LeftLeg setScaleY:frameData[RocketAnim.spriteData[kTurtlePart_LeftLeg].firstFrame + turtleAniStep].scaleY * wholeTurtleScaleFromSocurce * 2 * fuckScale];
    [s_Turtle_RightLeg setScaleY:frameData[RocketAnim.spriteData[kTurtlePart_RightLeg].firstFrame + turtleAniStep].scaleY * wholeTurtleScaleFromSocurce * 2 * fuckScale];
    [s_Turtle_Tail setScaleY:frameData[RocketAnim.spriteData[kTurtlePart_Tail].firstFrame + turtleAniStep].scaleY * wholeTurtleScaleFromSocurce * 2 * fuckScale];
    
    [s_Turtle_Neck setPosition:ccp(turtle_Neck_x + externalOffsetX2, turtle_Neck_y + externalOffsetY2)];
    [s_Turtle_Head setPosition:ccp(turtle_Head_x + externalOffsetX2, turtle_Head_y + externalOffsetY2)];
    [s_Turtle_Shell setPosition:ccp(turtle_Shell_x + externalOffsetX2, turtle_Shell_y + externalOffsetY2)];
    [s_Turtle_LeftLeg setPosition:ccp(turtle_LeftLeg_x + externalOffsetX2, turtle_LeftLeg_y + externalOffsetY2)];
    [s_Turtle_RightLeg setPosition:ccp(turtle_RightLeg_x + externalOffsetX2, turtle_RightLeg_y + externalOffsetY2)];
    [s_Turtle_Tail setPosition:ccp(turtle_Tail_x + externalOffsetX2, turtle_Tail_y + externalOffsetY2)];
   
    
    //printf("turtle_Head_x:%4.8f\n",turtle_Head_x);

    
    
}

@end
