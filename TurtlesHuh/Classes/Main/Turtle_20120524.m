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

@implementation Turtle

-(void) resetHurtTime{
    hurtTime = 0;
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

-(void) setFacingRight:(bool)_isRight{
    isFacingRight = _isRight;
}

-(void) setExternalOffsetFinalX:(float)_ex{
    externalOffsetFinalX = _ex;
}

-(void) setExternalOffsetFinalY:(float)_ey{
    externalOffsetFinalY = _ey;
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

-(void) bombOutOffScreenDirection:(int)_bomOutOffScreenDirection{
    bombOutOffScreenDirection = _bomOutOffScreenDirection;
}

-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
        
        printf("turtle init\n");
        
        delegate = nil;
        
        isChangingWholeScale = false;
        
        color = kTurtleShellColor_BrownOri;
        
        turtleRotation = 0;
        
        isFacingRight = false;
        
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
    turtleX = _x;
    
    if(status == kTurtleAniStatus_Normal_In){
        turtle_Shell_x = turtleX + frameData[turtleInAnim.spriteData[kTurtlePart_Shell].firstFrame + 12].x * wholeTurtleScaleFromSocurce;
    }
        
        
}

-(void) setY:(int)_y{
    turtleY = _y;
    
    if(status == kTurtleAniStatus_Normal_In){
        turtle_Shell_y = turtleY + frameData[turtleInAnim.spriteData[kTurtlePart_Shell].firstFrame + 12].y * wholeTurtleScaleFromSocurce;
    }
}

-(void) setStatus:(int) _status{
    // printf("setStatus:%i\n", _status);
    
    
    
    if(_status == kTurtleAniStatus_Normal_Out){
        
        //hurtTime = 0;
        
        if(!isFacingRight){
            turtle_Shell_x = turtleX + frameData[turtleOutAnim.spriteData[kTurtlePart_Shell].firstFrame + 12].x * wholeTurtleScaleFromSocurce;
            turtle_LeftLeg_x = turtleX + frameData[turtleOutAnim.spriteData[kTurtlePart_LeftLeg].firstFrame + 12].x * wholeTurtleScaleFromSocurce;
            turtle_RightLeg_x = turtleX + frameData[turtleOutAnim.spriteData[kTurtlePart_RightLeg].firstFrame + 12].x * wholeTurtleScaleFromSocurce;
            turtle_Tail_x = turtleX + frameData[turtleOutAnim.spriteData[kTurtlePart_Tail].firstFrame + 12].x * wholeTurtleScaleFromSocurce;
            turtle_Shadow_x = turtleX + frameData[turtleOutAnim.spriteData[kTurtlePart_Shadow].firstFrame + 12].x * wholeTurtleScaleFromSocurce;
            
            turtle_Shell_y = turtleY + frameData[turtleOutAnim.spriteData[kTurtlePart_Shell].firstFrame + 12].y * wholeTurtleScaleFromSocurce;
            turtle_LeftLeg_y = turtleY + frameData[turtleOutAnim.spriteData[kTurtlePart_LeftLeg].firstFrame + 12].y * wholeTurtleScaleFromSocurce;
            turtle_RightLeg_y = turtleY + frameData[turtleOutAnim.spriteData[kTurtlePart_RightLeg].firstFrame + 12].y * wholeTurtleScaleFromSocurce;
            turtle_Tail_y = turtleY + frameData[turtleOutAnim.spriteData[kTurtlePart_Tail].firstFrame + 12].y * wholeTurtleScaleFromSocurce;
            turtle_Shadow_y = turtleY + frameData[turtleOutAnim.spriteData[kTurtlePart_Shadow].firstFrame + 12].y * wholeTurtleScaleFromSocurce;

            
            [s_Turtle_Shell setRotation:frameData[turtleOutAnim.spriteData[kTurtlePart_Shell].firstFrame + 12].rotation * 180/M_PI];
            [s_Turtle_LeftLeg setRotation:frameData[turtleOutAnim.spriteData[kTurtlePart_LeftLeg].firstFrame + 12].rotation * 180/M_PI];
            [s_Turtle_RightLeg setRotation:frameData[turtleOutAnim.spriteData[kTurtlePart_RightLeg].firstFrame + 12].rotation * 180/M_PI];
            [s_Turtle_Tail setRotation:frameData[turtleOutAnim.spriteData[kTurtlePart_Tail].firstFrame + 12].rotation * 180/M_PI];
            [s_Turtle_Shadow setRotation:frameData[turtleOutAnim.spriteData[kTurtlePart_Shadow].firstFrame + 12].rotation * 180/M_PI];
            
            [s_Turtle_Shell setScaleX:frameData[turtleOutAnim.spriteData[kTurtlePart_Shell].firstFrame + 12].scaleX * wholeTurtleScaleFromSocurce * 2];
            [s_Turtle_LeftLeg setScaleX:frameData[turtleOutAnim.spriteData[kTurtlePart_LeftLeg].firstFrame + 12].scaleX * wholeTurtleScaleFromSocurce * 2];
            [s_Turtle_RightLeg setScaleX:frameData[turtleOutAnim.spriteData[kTurtlePart_RightLeg].firstFrame + 12].scaleX * wholeTurtleScaleFromSocurce * 2];
            [s_Turtle_Tail setScaleX:frameData[turtleOutAnim.spriteData[kTurtlePart_Tail].firstFrame + 12].scaleX * wholeTurtleScaleFromSocurce * 2];
            [s_Turtle_Shadow setScaleX:frameData[turtleOutAnim.spriteData[kTurtlePart_Shadow].firstFrame + 12].scaleX * wholeTurtleScaleFromSocurce * 2];
            
        }else{
            
            [s_Turtle_Shell setRotation:-frameData[turtleOutAnim.spriteData[kTurtlePart_Shell].firstFrame + 12].rotation * 180/M_PI];
            [s_Turtle_LeftLeg setRotation:-frameData[turtleOutAnim.spriteData[kTurtlePart_LeftLeg].firstFrame + 12].rotation * 180/M_PI];
            [s_Turtle_RightLeg setRotation:-frameData[turtleOutAnim.spriteData[kTurtlePart_RightLeg].firstFrame + 12].rotation * 180/M_PI];
            [s_Turtle_Tail setRotation:-frameData[turtleOutAnim.spriteData[kTurtlePart_Tail].firstFrame + 12].rotation * 180/M_PI];
            [s_Turtle_Shadow setRotation:-frameData[turtleOutAnim.spriteData[kTurtlePart_Shadow].firstFrame + 12].rotation * 180/M_PI];
            
            [s_Turtle_Shell setScaleX:-frameData[turtleOutAnim.spriteData[kTurtlePart_Shell].firstFrame + 12].scaleX * wholeTurtleScaleFromSocurce * 2];
            [s_Turtle_LeftLeg setScaleX:-frameData[turtleOutAnim.spriteData[kTurtlePart_LeftLeg].firstFrame + 12].scaleX * wholeTurtleScaleFromSocurce * 2];
            [s_Turtle_RightLeg setScaleX:-frameData[turtleOutAnim.spriteData[kTurtlePart_RightLeg].firstFrame + 12].scaleX * wholeTurtleScaleFromSocurce * 2];
            [s_Turtle_Tail setScaleX:-frameData[turtleOutAnim.spriteData[kTurtlePart_Tail].firstFrame + 12].scaleX * wholeTurtleScaleFromSocurce * 2];
            [s_Turtle_Shadow setScaleX:-frameData[turtleOutAnim.spriteData[kTurtlePart_Shadow].firstFrame + 12].scaleX * wholeTurtleScaleFromSocurce * 2];
        }
        
        [s_Turtle_Shell setScaleY:frameData[turtleOutAnim.spriteData[kTurtlePart_Shell].firstFrame + 12].scaleY * wholeTurtleScaleFromSocurce * 2];
        [s_Turtle_LeftLeg setScaleY:frameData[turtleOutAnim.spriteData[kTurtlePart_LeftLeg].firstFrame + 12].scaleY * wholeTurtleScaleFromSocurce * 2];
        [s_Turtle_RightLeg setScaleY:frameData[turtleOutAnim.spriteData[kTurtlePart_RightLeg].firstFrame + 12].scaleY * wholeTurtleScaleFromSocurce * 2];
        [s_Turtle_Tail setScaleY:frameData[turtleOutAnim.spriteData[kTurtlePart_Tail].firstFrame + 12].scaleY * wholeTurtleScaleFromSocurce * 2];
        [s_Turtle_Shadow setScaleY:frameData[turtleOutAnim.spriteData[kTurtlePart_Shadow].firstFrame + 12].scaleY * wholeTurtleScaleFromSocurce * 2];
        
        showingHeadTime = 0;
        
    }
    
    if(_status == kTurtleAniStatus_Normal_In){
        turtle_Shell_x = turtleX + frameData[turtleInAnim.spriteData[kTurtlePart_Shell].firstFrame + 12].x * wholeTurtleScaleFromSocurce;
        turtle_Shell_y = turtleY + frameData[turtleInAnim.spriteData[kTurtlePart_Shell].firstFrame + 12].y * wholeTurtleScaleFromSocurce;
       
        //DO IT EXTERNALLY
        //hurtTime = 0;
        
        turtleRotation = 0;
        [s_Turtle_Shell setRotation:0];
        
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
        }
        
        
    }
    
    if(_status == kTurtleAniStatus_Out){
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
        }
    }
    
    
    if(_status == kTurtleAniStatus_Bombing){
        if(status == kTurtleAniStatus_Idle){
            [self endIdle];
        }
        
        turtleAniStep = 0;
        turtleAniStep2 = 0;
        turtleBombAniStep = 0;
        turtleRotation = 0;
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

-(void) manage:(ccTime) dt{
    if(currentChosenMiniGame == 4){
        isExternalOffseting = true;
    }
    
    [self checkAndRunAni];
    [self manageSpike];
    [self manageBombAni];

        
        externalOffsetX2 += (externalOffsetFinalX-externalOffsetX2)/100;
        externalOffsetY2 += (externalOffsetFinalY-externalOffsetY2)/100;
        
        [s_Turtle_HeadAndNeck setPosition:ccp(turtle_HeadAndNeck_x + externalOffsetX2, turtle_HeadAndNeck_y + externalOffsetY2)];
        [s_Turtle_Head setPosition:ccp(turtle_Head_x + externalOffsetX2, turtle_Head_y + externalOffsetY2)];
        [s_Turtle_Jaw setPosition:ccp(turtle_Jaw_x + externalOffsetX2, turtle_Jaw_y + externalOffsetY2)];
        [s_Turtle_Neck setPosition:ccp(turtle_Neck_x + externalOffsetX2, turtle_Neck_y + externalOffsetY2)];
        [s_Turtle_Shell setPosition:ccp(turtle_Shell_x + externalOffsetX2, turtle_Shell_y + externalOffsetY2)];
        [s_Turtle_LeftLeg setPosition:ccp(turtle_LeftLeg_x + externalOffsetX2, turtle_LeftLeg_y + externalOffsetY2)];
        [s_Turtle_RightLeg setPosition:ccp(turtle_RightLeg_x + externalOffsetX2, turtle_RightLeg_y + externalOffsetY2)];
        [s_Turtle_Tail setPosition:ccp(turtle_Tail_x + externalOffsetX2, turtle_Tail_y + externalOffsetY2)];
        [s_Turtle_Eye setPosition:ccp(turtle_Eye_x + externalOffsetX2, turtle_Eye_y + externalOffsetY2)];
    
    
    
    if(isChangingWholeScale){
        isChangingWholeScale = false;
        
        [s_Turtle_Shell setScaleX:frameData[turtleInAnim.spriteData[kTurtlePart_Shell].firstFrame + 12].scaleX * wholeTurtleScaleFromSocurce * 2];
        [s_Turtle_Shell setScaleY:frameData[turtleInAnim.spriteData[kTurtlePart_Shell].firstFrame + 12].scaleY * wholeTurtleScaleFromSocurce * 2];
    }
    
    
    if(currentChosenMiniGame == 5){
        [s_Turtle_Shadow setPosition:ccp(10000, 10000)];
    }else{
        [s_Turtle_Shadow setPosition:ccp(turtle_Shadow_x + externalOffsetX2, turtle_Shadow_y + externalOffsetY2)];
    }
    
        for(int i = 0 ; i < 4 ; i++){
           // printf("ii:%i\n",i);
            [s_Turtle_Spike[i] setPosition:ccp(turtle_Spike_x[i] + externalOffsetX2, turtle_Spike_y[i] + externalOffsetY2)];
        }
        
    
    if(status == kTurtleAniStatus_Normal_Out){
        showingHeadTime += dt;
    }
        

}

-(void) checkAndRunAni{
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
    
    turtle_Shell_x = turtleX + shakeOffsetRanX + frameData[turtleInAnim.spriteData[kTurtlePart_Shell].firstFrame + 12].x * wholeTurtleScaleFromSocurce;
    turtle_Shell_y = turtleY + shakeOffsetRanY + frameData[turtleInAnim.spriteData[kTurtlePart_Shell].firstFrame + 12].y * wholeTurtleScaleFromSocurce;
    [s_Turtle_Shell setRotation:shakeOffsetAngle + turtleRotation];
    
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
        turtle_Shell_x = turtleX + frameData[turtleOutAnim.spriteData[kTurtlePart_Shell].firstFrame + turtleAniStep].x * wholeTurtleScaleFromSocurce;
        turtle_LeftLeg_x = turtleX + frameData[turtleOutAnim.spriteData[kTurtlePart_LeftLeg].firstFrame + turtleAniStep].x * wholeTurtleScaleFromSocurce;
        turtle_RightLeg_x = turtleX + frameData[turtleOutAnim.spriteData[kTurtlePart_RightLeg].firstFrame + turtleAniStep].x * wholeTurtleScaleFromSocurce;
        turtle_Tail_x = turtleX + frameData[turtleOutAnim.spriteData[kTurtlePart_Tail].firstFrame + turtleAniStep].x * wholeTurtleScaleFromSocurce;
        turtle_Shadow_x = turtleX + frameData[turtleOutAnim.spriteData[kTurtlePart_Shadow].firstFrame + turtleAniStep].x * wholeTurtleScaleFromSocurce;
        
        turtle_Shell_y = turtleY + frameData[turtleOutAnim.spriteData[kTurtlePart_Shell].firstFrame + turtleAniStep].y * wholeTurtleScaleFromSocurce;
        turtle_LeftLeg_y = turtleY + frameData[turtleOutAnim.spriteData[kTurtlePart_LeftLeg].firstFrame + turtleAniStep].y * wholeTurtleScaleFromSocurce;
        turtle_RightLeg_y = turtleY + frameData[turtleOutAnim.spriteData[kTurtlePart_RightLeg].firstFrame + turtleAniStep].y * wholeTurtleScaleFromSocurce;
        turtle_Tail_y = turtleY + frameData[turtleOutAnim.spriteData[kTurtlePart_Tail].firstFrame + turtleAniStep].y * wholeTurtleScaleFromSocurce;
        turtle_Shadow_y = turtleY + frameData[turtleOutAnim.spriteData[kTurtlePart_Shadow].firstFrame + turtleAniStep].y * wholeTurtleScaleFromSocurce;
        
        [s_Turtle_Shell setRotation:frameData[turtleOutAnim.spriteData[kTurtlePart_Shell].firstFrame + turtleAniStep].rotation * 180/M_PI];
        [s_Turtle_LeftLeg setRotation:frameData[turtleOutAnim.spriteData[kTurtlePart_LeftLeg].firstFrame + turtleAniStep].rotation * 180/M_PI];
        [s_Turtle_RightLeg setRotation:frameData[turtleOutAnim.spriteData[kTurtlePart_RightLeg].firstFrame + turtleAniStep].rotation * 180/M_PI];
        [s_Turtle_Tail setRotation:frameData[turtleOutAnim.spriteData[kTurtlePart_Tail].firstFrame + turtleAniStep].rotation * 180/M_PI];
        [s_Turtle_Shadow setRotation:frameData[turtleOutAnim.spriteData[kTurtlePart_Shadow].firstFrame + turtleAniStep].rotation * 180/M_PI];
        
        [s_Turtle_Shell setScaleX:frameData[turtleOutAnim.spriteData[kTurtlePart_Shell].firstFrame + turtleAniStep].scaleX * wholeTurtleScaleFromSocurce * 2];
        [s_Turtle_LeftLeg setScaleX:frameData[turtleOutAnim.spriteData[kTurtlePart_LeftLeg].firstFrame + turtleAniStep].scaleX * wholeTurtleScaleFromSocurce * 2];
        [s_Turtle_RightLeg setScaleX:frameData[turtleOutAnim.spriteData[kTurtlePart_RightLeg].firstFrame + turtleAniStep].scaleX * wholeTurtleScaleFromSocurce * 2];
        [s_Turtle_Tail setScaleX:frameData[turtleOutAnim.spriteData[kTurtlePart_Tail].firstFrame + turtleAniStep].scaleX * wholeTurtleScaleFromSocurce * 2];
        [s_Turtle_Shadow setScaleX:frameData[turtleOutAnim.spriteData[kTurtlePart_Shadow].firstFrame + turtleAniStep].scaleX * wholeTurtleScaleFromSocurce * 2];
        
    }else{

        [s_Turtle_Shell setRotation:-frameData[turtleOutAnim.spriteData[kTurtlePart_Shell].firstFrame + turtleAniStep].rotation * 180/M_PI];
        [s_Turtle_LeftLeg setRotation:-frameData[turtleOutAnim.spriteData[kTurtlePart_LeftLeg].firstFrame + turtleAniStep].rotation * 180/M_PI];
        [s_Turtle_RightLeg setRotation:-frameData[turtleOutAnim.spriteData[kTurtlePart_RightLeg].firstFrame + turtleAniStep].rotation * 180/M_PI];
        [s_Turtle_Tail setRotation:-frameData[turtleOutAnim.spriteData[kTurtlePart_Tail].firstFrame + turtleAniStep].rotation * 180/M_PI];
        [s_Turtle_Shadow setRotation:-frameData[turtleOutAnim.spriteData[kTurtlePart_Shadow].firstFrame + turtleAniStep].rotation * 180/M_PI];
        
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
    
    
    static float turtleAppearAniWidth_Out = 226/2;
    static float turtleAppearAniHeight_Out = 159/2;
    static int turtleAppearAniTotalRow_Out = 9;
    static int turtleAppearAniTotalFrame_Out = 10;
    static int turtleAppearAniCurrentRow_Out;
    static int turtleAppearAniCurrentCol_Out;
    
    
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
    
     printf("id:%i turtleAniStep   :%i\n",idNumber,turtleAniStep);
    
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
        [s_Turtle_HeadAndNeck setRotation:turtleRotation];
        
        printf("head out:%4.8f %4.8f\n",turtleX, turtleY);
        
        turtle_Head_x = 99999;
        turtle_Neck_x = 99999;
        turtle_Head_y = 99999;
        turtle_Neck_y = 99999;
    }else{
        
        if(!isFacingRight){
            turtle_Head_x = turtleX + frameData[turtleOutAnim.spriteData[kTurtlePart_Head].firstFrame + turtleAniStep].x * wholeTurtleScaleFromSocurce;
            turtle_Neck_x = turtleX + frameData[turtleOutAnim.spriteData[kTurtlePart_Neck].firstFrame + turtleAniStep].x * wholeTurtleScaleFromSocurce;
            
            turtle_Head_y = turtleY + frameData[turtleOutAnim.spriteData[kTurtlePart_Head].firstFrame + turtleAniStep].y * wholeTurtleScaleFromSocurce;
            turtle_Neck_y = turtleY + frameData[turtleOutAnim.spriteData[kTurtlePart_Neck].firstFrame + turtleAniStep].y * wholeTurtleScaleFromSocurce;

            [s_Turtle_Head setRotation:frameData[turtleOutAnim.spriteData[kTurtlePart_Head].firstFrame + turtleAniStep].rotation * 180/M_PI];
            [s_Turtle_Neck setRotation:frameData[turtleOutAnim.spriteData[kTurtlePart_Neck].firstFrame + turtleAniStep].rotation * 180/M_PI];
            
            [s_Turtle_Head setScaleX:frameData[turtleOutAnim.spriteData[kTurtlePart_Head].firstFrame + turtleAniStep].scaleX * wholeTurtleScaleFromSocurce * 2];
            [s_Turtle_Neck setScaleX:frameData[turtleOutAnim.spriteData[kTurtlePart_Neck].firstFrame + turtleAniStep].scaleX * wholeTurtleScaleFromSocurce * 2];
        }else{
            [s_Turtle_Head setRotation:-frameData[turtleOutAnim.spriteData[kTurtlePart_Head].firstFrame + turtleAniStep].rotation * 180/M_PI];
            [s_Turtle_Neck setRotation:-frameData[turtleOutAnim.spriteData[kTurtlePart_Neck].firstFrame + turtleAniStep].rotation * 180/M_PI];
            
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
            
            [s_Turtle_LeftLeg setRotation:-frameData[turtleInAnim.spriteData[kTurtlePart_LeftLeg].firstFrame + turtleAniStep].rotation * 180/M_PI];
            [s_Turtle_RightLeg setRotation:-frameData[turtleInAnim.spriteData[kTurtlePart_RightLeg].firstFrame + turtleAniStep].rotation * 180/M_PI];
            [s_Turtle_Tail setRotation:-frameData[turtleInAnim.spriteData[kTurtlePart_Tail].firstFrame + turtleAniStep].rotation * 180/M_PI];
            
            [s_Turtle_LeftLeg setScaleX:-frameData[turtleInAnim.spriteData[kTurtlePart_LeftLeg].firstFrame + turtleAniStep].scaleX * wholeTurtleScaleFromSocurce * 2];
            [s_Turtle_RightLeg setScaleX:-frameData[turtleInAnim.spriteData[kTurtlePart_RightLeg].firstFrame + turtleAniStep].scaleX * wholeTurtleScaleFromSocurce * 2];
            [s_Turtle_Tail setScaleX:-frameData[turtleInAnim.spriteData[kTurtlePart_Tail].firstFrame + turtleAniStep].scaleX * wholeTurtleScaleFromSocurce * 2];
        }else{
            
            turtle_LeftLeg_x = turtleX + frameData[turtleInAnim.spriteData[kTurtlePart_LeftLeg].firstFrame + turtleAniStep].x * wholeTurtleScaleFromSocurce;
            turtle_RightLeg_x = turtleX + frameData[turtleInAnim.spriteData[kTurtlePart_RightLeg].firstFrame + turtleAniStep].x * wholeTurtleScaleFromSocurce;
            turtle_Tail_x = turtleX + frameData[turtleInAnim.spriteData[kTurtlePart_Tail].firstFrame + turtleAniStep].x * wholeTurtleScaleFromSocurce;
            
            turtle_LeftLeg_y = turtleY + frameData[turtleInAnim.spriteData[kTurtlePart_LeftLeg].firstFrame + turtleAniStep].y * wholeTurtleScaleFromSocurce;
            turtle_RightLeg_y = turtleY + frameData[turtleInAnim.spriteData[kTurtlePart_RightLeg].firstFrame + turtleAniStep].y * wholeTurtleScaleFromSocurce;
            turtle_Tail_y = turtleY + frameData[turtleInAnim.spriteData[kTurtlePart_Tail].firstFrame + turtleAniStep].y * wholeTurtleScaleFromSocurce;
            
            [s_Turtle_LeftLeg setRotation:frameData[turtleInAnim.spriteData[kTurtlePart_LeftLeg].firstFrame + turtleAniStep].rotation * 180/M_PI];
            [s_Turtle_RightLeg setRotation:frameData[turtleInAnim.spriteData[kTurtlePart_RightLeg].firstFrame + turtleAniStep].rotation * 180/M_PI];
            [s_Turtle_Tail setRotation:frameData[turtleInAnim.spriteData[kTurtlePart_Tail].firstFrame + turtleAniStep].rotation * 180/M_PI];
            
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
        turtle_Shell_x = turtleX + frameData[turtleInAnim.spriteData[kTurtlePart_Shell].firstFrame + turtleAniStep].x * wholeTurtleScaleFromSocurce;
        turtle_Shadow_x = turtleX + frameData[turtleInAnim.spriteData[kTurtlePart_Shadow].firstFrame + turtleAniStep].x * wholeTurtleScaleFromSocurce;
        
        turtle_Shell_y = turtleY + frameData[turtleInAnim.spriteData[kTurtlePart_Shell].firstFrame + turtleAniStep].y * wholeTurtleScaleFromSocurce;
        turtle_Shadow_y = turtleY + frameData[turtleInAnim.spriteData[kTurtlePart_Shadow].firstFrame + turtleAniStep].y * wholeTurtleScaleFromSocurce;
        
        [s_Turtle_Shell setRotation:frameData[turtleInAnim.spriteData[kTurtlePart_Shell].firstFrame + turtleAniStep].rotation * 180/M_PI];
        [s_Turtle_Shadow setRotation:frameData[turtleInAnim.spriteData[kTurtlePart_Shadow].firstFrame + turtleAniStep].rotation * 180/M_PI];
        
        [s_Turtle_Shell setScaleX:frameData[turtleInAnim.spriteData[kTurtlePart_Shell].firstFrame + turtleAniStep].scaleX * wholeTurtleScaleFromSocurce * 2];
        [s_Turtle_Shadow setScaleX:frameData[turtleInAnim.spriteData[kTurtlePart_Shadow].firstFrame + turtleAniStep].scaleX * wholeTurtleScaleFromSocurce * 2];
    }else{
        
        [s_Turtle_Shell setRotation:-frameData[turtleInAnim.spriteData[kTurtlePart_Shell].firstFrame + turtleAniStep].rotation * 180/M_PI];
        [s_Turtle_Shadow setRotation:-frameData[turtleInAnim.spriteData[kTurtlePart_Shadow].firstFrame + turtleAniStep].rotation * 180/M_PI];
        
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
            
            if(!isFacingRight){
                turtle_HeadAndNeck_x = turtleX;
                turtle_HeadAndNeck_y = turtleY;

                [s_Turtle_HeadAndNeck setScale:wholeTurtleScaleFromSocurce * 2];
                [s_Turtle_HeadAndNeck setRotation:turtleRotation];
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
            turtle_Head_x = turtleX + frameData[turtleInAnim.spriteData[kTurtlePart_Head].firstFrame + turtleAniStep].x * wholeTurtleScaleFromSocurce;
            turtle_Neck_x = turtleX + frameData[turtleInAnim.spriteData[kTurtlePart_Neck].firstFrame + turtleAniStep].x * wholeTurtleScaleFromSocurce;
            
            turtle_Head_y = turtleY + frameData[turtleInAnim.spriteData[kTurtlePart_Head].firstFrame + turtleAniStep].y * wholeTurtleScaleFromSocurce;
            turtle_Neck_y = turtleY + frameData[turtleInAnim.spriteData[kTurtlePart_Neck].firstFrame + turtleAniStep].y * wholeTurtleScaleFromSocurce;

            [s_Turtle_Head setRotation:frameData[turtleInAnim.spriteData[kTurtlePart_Head].firstFrame + turtleAniStep].rotation * 180/M_PI];
            [s_Turtle_Neck setRotation:frameData[turtleInAnim.spriteData[kTurtlePart_Neck].firstFrame + turtleAniStep].rotation * 180/M_PI];
            
            [s_Turtle_Head setScaleX:frameData[turtleInAnim.spriteData[kTurtlePart_Head].firstFrame + turtleAniStep].scaleX * wholeTurtleScaleFromSocurce * 2];
            [s_Turtle_Neck setScaleX:frameData[turtleInAnim.spriteData[kTurtlePart_Neck].firstFrame + turtleAniStep].scaleX * wholeTurtleScaleFromSocurce * 2];
        }else{

            [s_Turtle_Head setRotation:-frameData[turtleInAnim.spriteData[kTurtlePart_Head].firstFrame + turtleAniStep].rotation * 180/M_PI];
            [s_Turtle_Neck setRotation:-frameData[turtleInAnim.spriteData[kTurtlePart_Neck].firstFrame + turtleAniStep].rotation * 180/M_PI];
            
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

-(void) turtleInFromBombing_BombOffScreen{
    
    
    
    if(turtleBombAniStep == 0){
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

    }
    
    bomb_vy += bomb_ay;
    bomb_y += bomb_vy;
    bomb_x += bomb_vx;
    turtleRotation += bomb_vr;
    

    
    [s_Turtle_Shadow setOpacity:bomb_shadowOpacity];
    [s_Turtle_Shadow setScaleX:bomb_shadowScaleY];
    
    static float superFuxkAngleDiff;
    static float superFuxkOriX;
    static float superFuxkOriY;
    
    // printf("turtleRotation:%4.8f\n",turtleRotation);
    
    if(turtleAniStep < 8){
        
        
        if(isFacingRight){
            
        }else{
            
            if(status == kTurtleAniStatus_Normal_Out){
                superFuxkAngleDiff = -turtleRotation * M_PI/180;
                superFuxkOriX = -frameData[turtleInAnim.spriteData[kTurtlePart_LeftLeg].firstFrame + turtleAniStep].x * wholeTurtleScaleFromSocurce;
                superFuxkOriY = frameData[turtleInAnim.spriteData[kTurtlePart_LeftLeg].firstFrame + turtleAniStep].y * wholeTurtleScaleFromSocurce;
                turtle_LeftLeg_x = turtleX + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff) + bomb_x;
                turtle_LeftLeg_y = turtleY + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff) + bomb_y;
                
                superFuxkAngleDiff = -turtleRotation * M_PI/180;
                superFuxkOriX = -frameData[turtleInAnim.spriteData[kTurtlePart_RightLeg].firstFrame + turtleAniStep].x * wholeTurtleScaleFromSocurce;
                superFuxkOriY = frameData[turtleInAnim.spriteData[kTurtlePart_RightLeg].firstFrame + turtleAniStep].y * wholeTurtleScaleFromSocurce;
                turtle_RightLeg_x = turtleX + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff) + bomb_x;
                turtle_RightLeg_y = turtleY + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff) + bomb_y;
                
                
                
                superFuxkAngleDiff = -turtleRotation * M_PI/180;
                superFuxkOriX = -frameData[turtleInAnim.spriteData[kTurtlePart_Tail].firstFrame + turtleAniStep].x * wholeTurtleScaleFromSocurce;
                superFuxkOriY = frameData[turtleInAnim.spriteData[kTurtlePart_Tail].firstFrame + turtleAniStep].y * wholeTurtleScaleFromSocurce;
                turtle_Tail_x = turtleX + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff) + bomb_x;
                turtle_Tail_y = turtleY + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff) + bomb_y;
                
                
                [s_Turtle_LeftLeg setRotation:-frameData[turtleInAnim.spriteData[kTurtlePart_LeftLeg].firstFrame + turtleAniStep].rotation * 180/M_PI + turtleRotation];
                [s_Turtle_RightLeg setRotation:-frameData[turtleInAnim.spriteData[kTurtlePart_RightLeg].firstFrame + turtleAniStep].rotation * 180/M_PI + turtleRotation];
                [s_Turtle_Tail setRotation:-frameData[turtleInAnim.spriteData[kTurtlePart_Tail].firstFrame + turtleAniStep].rotation * 180/M_PI + turtleRotation];
                
                [s_Turtle_LeftLeg setScaleX:-frameData[turtleInAnim.spriteData[kTurtlePart_LeftLeg].firstFrame + turtleAniStep].scaleX * wholeTurtleScaleFromSocurce * 2];
                [s_Turtle_RightLeg setScaleX:-frameData[turtleInAnim.spriteData[kTurtlePart_RightLeg].firstFrame + turtleAniStep].scaleX * wholeTurtleScaleFromSocurce * 2];
                [s_Turtle_Tail setScaleX:-frameData[turtleInAnim.spriteData[kTurtlePart_Tail].firstFrame + turtleAniStep].scaleX * wholeTurtleScaleFromSocurce * 2];
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
        superFuxkOriX = frameData[turtleInAnim.spriteData[kTurtlePart_Shell].firstFrame + turtleAniStep].x * wholeTurtleScaleFromSocurce + externalOffsetX;
        superFuxkOriY = frameData[turtleInAnim.spriteData[kTurtlePart_Shell].firstFrame + turtleAniStep].y * wholeTurtleScaleFromSocurce + externalOffsetY;
        turtle_Shell_x = turtleX + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff) + bomb_x;
        turtle_Shell_y = turtleY + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff) + bomb_y;
        
        
        [s_Turtle_Shell setRotation:frameData[turtleInAnim.spriteData[kTurtlePart_Shell].firstFrame + turtleAniStep].rotation * 180/M_PI + turtleRotation];
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
                    turtle_HeadAndNeck_x = turtleX + bomb_x;
                    turtle_HeadAndNeck_y = turtleY + bomb_y;
                    
                    [s_Turtle_HeadAndNeck setScale:wholeTurtleScaleFromSocurce * 2];
                    [s_Turtle_HeadAndNeck setRotation:turtleRotation];
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
                superFuxkOriX = frameData[turtleInAnim.spriteData[kTurtlePart_Head].firstFrame + turtleAniStep].x * wholeTurtleScaleFromSocurce + externalOffsetX;
                superFuxkOriY = frameData[turtleInAnim.spriteData[kTurtlePart_Head].firstFrame + turtleAniStep].y * wholeTurtleScaleFromSocurce + externalOffsetY;
                turtle_Head_x = turtleX + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff) + bomb_x;
                turtle_Head_y = turtleY + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff) + bomb_y;
                
                
                superFuxkAngleDiff = -turtleRotation * M_PI/180;
                superFuxkOriX = frameData[turtleInAnim.spriteData[kTurtlePart_Neck].firstFrame + turtleAniStep].x * wholeTurtleScaleFromSocurce + externalOffsetX;
                superFuxkOriY = frameData[turtleInAnim.spriteData[kTurtlePart_Neck].firstFrame + turtleAniStep].y * wholeTurtleScaleFromSocurce + externalOffsetY;
                turtle_Neck_x = turtleX + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff) + bomb_x;
                turtle_Neck_y = turtleY + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff) + bomb_y;
                
                
                [s_Turtle_Head setRotation:frameData[turtleInAnim.spriteData[kTurtlePart_Head].firstFrame + turtleAniStep].rotation * 180/M_PI + turtleRotation];
                [s_Turtle_Neck setRotation:frameData[turtleInAnim.spriteData[kTurtlePart_Neck].firstFrame + turtleAniStep].rotation * 180/M_PI + turtleRotation];
                
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
    
    static float superFuxkAngleDiff;
    static float superFuxkOriX;
    static float superFuxkOriY;
    
    // printf("turtleRotation:%4.8f\n",turtleRotation);
    
    if(turtleAniStep < 8){
        
        
        if(isFacingRight){
            
        }else{
            
            
            superFuxkAngleDiff = -turtleRotation * M_PI/180;
            superFuxkOriX = -frameData[turtleInAnim.spriteData[kTurtlePart_LeftLeg].firstFrame + turtleAniStep].x * wholeTurtleScaleFromSocurce;
            superFuxkOriY = frameData[turtleInAnim.spriteData[kTurtlePart_LeftLeg].firstFrame + turtleAniStep].y * wholeTurtleScaleFromSocurce;
            turtle_LeftLeg_x = turtleX + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff) + bomb_x;
            turtle_LeftLeg_y = turtleY + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff) + bomb_y;
                     
            superFuxkAngleDiff = -turtleRotation * M_PI/180;
            superFuxkOriX = -frameData[turtleInAnim.spriteData[kTurtlePart_RightLeg].firstFrame + turtleAniStep].x * wholeTurtleScaleFromSocurce;
            superFuxkOriY = frameData[turtleInAnim.spriteData[kTurtlePart_RightLeg].firstFrame + turtleAniStep].y * wholeTurtleScaleFromSocurce;
            turtle_RightLeg_x = turtleX + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff) + bomb_x;
            turtle_RightLeg_y = turtleY + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff) + bomb_y;
            
            
            
            superFuxkAngleDiff = -turtleRotation * M_PI/180;
            superFuxkOriX = -frameData[turtleInAnim.spriteData[kTurtlePart_Tail].firstFrame + turtleAniStep].x * wholeTurtleScaleFromSocurce;
            superFuxkOriY = frameData[turtleInAnim.spriteData[kTurtlePart_Tail].firstFrame + turtleAniStep].y * wholeTurtleScaleFromSocurce;
            turtle_Tail_x = turtleX + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff) + bomb_x;
            turtle_Tail_y = turtleY + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff) + bomb_y;
      
            
            [s_Turtle_LeftLeg setRotation:-frameData[turtleInAnim.spriteData[kTurtlePart_LeftLeg].firstFrame + turtleAniStep].rotation * 180/M_PI + turtleRotation];
            [s_Turtle_RightLeg setRotation:-frameData[turtleInAnim.spriteData[kTurtlePart_RightLeg].firstFrame + turtleAniStep].rotation * 180/M_PI + turtleRotation];
            [s_Turtle_Tail setRotation:-frameData[turtleInAnim.spriteData[kTurtlePart_Tail].firstFrame + turtleAniStep].rotation * 180/M_PI + turtleRotation];
            
            [s_Turtle_LeftLeg setScaleX:-frameData[turtleInAnim.spriteData[kTurtlePart_LeftLeg].firstFrame + turtleAniStep].scaleX * wholeTurtleScaleFromSocurce * 2];
            [s_Turtle_RightLeg setScaleX:-frameData[turtleInAnim.spriteData[kTurtlePart_RightLeg].firstFrame + turtleAniStep].scaleX * wholeTurtleScaleFromSocurce * 2];
            [s_Turtle_Tail setScaleX:-frameData[turtleInAnim.spriteData[kTurtlePart_Tail].firstFrame + turtleAniStep].scaleX * wholeTurtleScaleFromSocurce * 2];
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
        superFuxkOriX = frameData[turtleInAnim.spriteData[kTurtlePart_Shell].firstFrame + turtleAniStep].x * wholeTurtleScaleFromSocurce + externalOffsetX;
        superFuxkOriY = frameData[turtleInAnim.spriteData[kTurtlePart_Shell].firstFrame + turtleAniStep].y * wholeTurtleScaleFromSocurce + externalOffsetY;
        turtle_Shell_x = turtleX + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff) + bomb_x;
        turtle_Shell_y = turtleY + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff) + bomb_y;

        
        [s_Turtle_Shell setRotation:frameData[turtleInAnim.spriteData[kTurtlePart_Shell].firstFrame + turtleAniStep].rotation * 180/M_PI + turtleRotation];
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
            
            if(!isFacingRight){
                turtle_HeadAndNeck_x = turtleX + bomb_x;
                turtle_HeadAndNeck_y = turtleY + bomb_y;
                
                [s_Turtle_HeadAndNeck setScale:wholeTurtleScaleFromSocurce * 2];
                [s_Turtle_HeadAndNeck setRotation:turtleRotation];
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
            superFuxkOriX = frameData[turtleInAnim.spriteData[kTurtlePart_Head].firstFrame + turtleAniStep].x * wholeTurtleScaleFromSocurce + externalOffsetX;
            superFuxkOriY = frameData[turtleInAnim.spriteData[kTurtlePart_Head].firstFrame + turtleAniStep].y * wholeTurtleScaleFromSocurce + externalOffsetY;
            turtle_Head_x = turtleX + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff) + bomb_x;
            turtle_Head_y = turtleY + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff) + bomb_y;
                 
            
            superFuxkAngleDiff = -turtleRotation * M_PI/180;
            superFuxkOriX = frameData[turtleInAnim.spriteData[kTurtlePart_Neck].firstFrame + turtleAniStep].x * wholeTurtleScaleFromSocurce + externalOffsetX;
            superFuxkOriY = frameData[turtleInAnim.spriteData[kTurtlePart_Neck].firstFrame + turtleAniStep].y * wholeTurtleScaleFromSocurce + externalOffsetY;
            turtle_Neck_x = turtleX + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff) + bomb_x;
            turtle_Neck_y = turtleY + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff) + bomb_y;
            
            
            [s_Turtle_Head setRotation:frameData[turtleInAnim.spriteData[kTurtlePart_Head].firstFrame + turtleAniStep].rotation * 180/M_PI + turtleRotation];
            [s_Turtle_Neck setRotation:frameData[turtleInAnim.spriteData[kTurtlePart_Neck].firstFrame + turtleAniStep].rotation * 180/M_PI + turtleRotation];
            
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
    turtleAniStep++;
    
    turtleRotation++;
    
    static float idleOffsetX;
    static float idleOffsetY;
    
    static float superFuxkAngleDiff;
    static float superFuxkOriX;
    static float superFuxkOriY;
    
    if(turtleAniStep == 1){
        [s_Turtle_Head setTextureRect:CGRectMake(1542/2,162/2,132/2,107/2)];
        [s_Turtle_Eye setTextureRect:CGRectMake(1688/2,162/2,48/2,98/2)];
        
        idleOffsetX = -175 * wholeTurtleScaleFromSocurce * 2;
        idleOffsetY = 140 * wholeTurtleScaleFromSocurce * 2;
    }
    
    turtleAniStep = 0;
    
    
    superFuxkAngleDiff = -turtleRotation * M_PI/180;
    superFuxkOriX = frameData[turtleInAnim.spriteData[kTurtlePart_Neck].firstFrame + turtleAniStep].x * wholeTurtleScaleFromSocurce + externalOffsetX;
    superFuxkOriY = frameData[turtleInAnim.spriteData[kTurtlePart_Neck].firstFrame + turtleAniStep].y * wholeTurtleScaleFromSocurce + externalOffsetY;
 
    
    superFuxkAngleDiff = -turtleRotation * M_PI/180;
    superFuxkOriX = frameData[turtleInAnim.spriteData[kTurtlePart_Jaw].firstFrame + turtleAniStep].x * wholeTurtleScaleFromSocurce + externalOffsetX;
    superFuxkOriY = frameData[turtleInAnim.spriteData[kTurtlePart_Jaw].firstFrame + turtleAniStep].y * wholeTurtleScaleFromSocurce + externalOffsetY;

    
    superFuxkAngleDiff = -turtleRotation * M_PI/180;
    superFuxkOriX = frameData[turtleInAnim.spriteData[kTurtlePart_Eye].firstFrame + turtleAniStep].x * wholeTurtleScaleFromSocurce + externalOffsetX;
    superFuxkOriY = frameData[turtleInAnim.spriteData[kTurtlePart_Eye].firstFrame + turtleAniStep].y * wholeTurtleScaleFromSocurce + externalOffsetY;
    
    
    superFuxkAngleDiff = -turtleRotation * M_PI/180;
    superFuxkOriX = frameData[turtleInAnim.spriteData[kTurtlePart_Head].firstFrame + turtleAniStep].x * wholeTurtleScaleFromSocurce + externalOffsetX;
    superFuxkOriY = frameData[turtleInAnim.spriteData[kTurtlePart_Head].firstFrame + turtleAniStep].y * wholeTurtleScaleFromSocurce + externalOffsetY;
    
    
    superFuxkAngleDiff = -turtleRotation * M_PI/180;
    superFuxkOriX = frameData[turtleInAnim.spriteData[kTurtlePart_Shell].firstFrame + turtleAniStep].x * wholeTurtleScaleFromSocurce + externalOffsetX;
    superFuxkOriY = frameData[turtleInAnim.spriteData[kTurtlePart_Shell].firstFrame + turtleAniStep].y * wholeTurtleScaleFromSocurce + externalOffsetY;
    
  
    superFuxkAngleDiff = -turtleRotation * M_PI/180;
    superFuxkOriX = frameData[turtleInAnim.spriteData[kTurtlePart_LeftLeg].firstFrame + turtleAniStep].x * wholeTurtleScaleFromSocurce + externalOffsetX;
    superFuxkOriY = frameData[turtleInAnim.spriteData[kTurtlePart_LeftLeg].firstFrame + turtleAniStep].y * wholeTurtleScaleFromSocurce + externalOffsetY;
    
    
    superFuxkAngleDiff = -turtleRotation * M_PI/180;
    superFuxkOriX = frameData[turtleInAnim.spriteData[kTurtlePart_RightLeg].firstFrame + turtleAniStep].x * wholeTurtleScaleFromSocurce + externalOffsetX;
    superFuxkOriY = frameData[turtleInAnim.spriteData[kTurtlePart_RightLeg].firstFrame + turtleAniStep].y * wholeTurtleScaleFromSocurce + externalOffsetY;
    
    
    superFuxkAngleDiff = -turtleRotation * M_PI/180;
    superFuxkOriX = frameData[turtleInAnim.spriteData[kTurtlePart_Tail].firstFrame + turtleAniStep].x * wholeTurtleScaleFromSocurce + externalOffsetX;
    superFuxkOriY = frameData[turtleInAnim.spriteData[kTurtlePart_Tail].firstFrame + turtleAniStep].y * wholeTurtleScaleFromSocurce + externalOffsetY;

    
    superFuxkAngleDiff = -turtleRotation * M_PI/180;
    superFuxkOriX = frameData[turtleInAnim.spriteData[kTurtlePart_Shadow].firstFrame + turtleAniStep].x * wholeTurtleScaleFromSocurce + externalOffsetX;
    superFuxkOriY = frameData[turtleInAnim.spriteData[kTurtlePart_Shadow].firstFrame + turtleAniStep].y * wholeTurtleScaleFromSocurce + externalOffsetY;
    
    
    [s_Turtle_Neck setRotation:frameData[IdleTurtleAnim.spriteData[kTurtlePart_Neck].firstFrame + turtleAniStep].rotation * 180/M_PI + turtleRotation];
    [s_Turtle_Jaw setRotation:frameData[IdleTurtleAnim.spriteData[kTurtlePart_Jaw].firstFrame + turtleAniStep].rotation * 180/M_PI + turtleRotation];
    [s_Turtle_Eye setRotation:frameData[IdleTurtleAnim.spriteData[kTurtlePart_Eye].firstFrame + turtleAniStep].rotation * 180/M_PI + turtleRotation];
    [s_Turtle_Head setRotation:frameData[IdleTurtleAnim.spriteData[kTurtlePart_Head].firstFrame + turtleAniStep].rotation * 180/M_PI + turtleRotation];
    [s_Turtle_Shell setRotation:frameData[IdleTurtleAnim.spriteData[kTurtlePart_Shell].firstFrame + turtleAniStep].rotation * 180/M_PI + turtleRotation];
    [s_Turtle_LeftLeg setRotation:frameData[IdleTurtleAnim.spriteData[kTurtlePart_LeftLeg].firstFrame + turtleAniStep].rotation * 180/M_PI + turtleRotation];
    [s_Turtle_RightLeg setRotation:frameData[IdleTurtleAnim.spriteData[kTurtlePart_RightLeg].firstFrame + turtleAniStep].rotation * 180/M_PI + turtleRotation];
    [s_Turtle_Tail setRotation:frameData[IdleTurtleAnim.spriteData[kTurtlePart_Tail].firstFrame + turtleAniStep].rotation * 180/M_PI + turtleRotation];
    [s_Turtle_Shadow setRotation:frameData[IdleTurtleAnim.spriteData[kTurtlePart_Shadow].firstFrame + turtleAniStep].rotation * 180/M_PI + turtleRotation];
    
    [s_Turtle_Neck setScaleX:frameData[IdleTurtleAnim.spriteData[kTurtlePart_Neck].firstFrame + turtleAniStep].scaleX * wholeTurtleScaleFromSocurce * 2];
    [s_Turtle_Jaw setScaleX:frameData[IdleTurtleAnim.spriteData[kTurtlePart_Jaw].firstFrame + turtleAniStep].scaleX * wholeTurtleScaleFromSocurce * 2];
    [s_Turtle_Eye setScaleX:frameData[IdleTurtleAnim.spriteData[kTurtlePart_Eye].firstFrame + turtleAniStep].scaleX * wholeTurtleScaleFromSocurce * 2];
    [s_Turtle_Head setScaleX:frameData[IdleTurtleAnim.spriteData[kTurtlePart_Head].firstFrame + turtleAniStep].scaleX * wholeTurtleScaleFromSocurce * 2];
    [s_Turtle_Shell setScaleX:frameData[IdleTurtleAnim.spriteData[kTurtlePart_Shell].firstFrame + turtleAniStep].scaleX * wholeTurtleScaleFromSocurce * 2];
    [s_Turtle_LeftLeg setScaleX:frameData[IdleTurtleAnim.spriteData[kTurtlePart_LeftLeg].firstFrame + turtleAniStep].scaleX * wholeTurtleScaleFromSocurce * 2];
    [s_Turtle_RightLeg setScaleX:frameData[IdleTurtleAnim.spriteData[kTurtlePart_RightLeg].firstFrame + turtleAniStep].scaleX * wholeTurtleScaleFromSocurce * 2];
    [s_Turtle_Tail setScaleX:frameData[IdleTurtleAnim.spriteData[kTurtlePart_Tail].firstFrame + turtleAniStep].scaleX * wholeTurtleScaleFromSocurce * 2];
    [s_Turtle_Shadow setScaleX:frameData[IdleTurtleAnim.spriteData[kTurtlePart_Shadow].firstFrame + turtleAniStep].scaleX * wholeTurtleScaleFromSocurce * 2];
    
    [s_Turtle_Neck setScaleY:frameData[IdleTurtleAnim.spriteData[kTurtlePart_Neck].firstFrame + turtleAniStep].scaleY * wholeTurtleScaleFromSocurce * 2];
    [s_Turtle_Jaw setScaleY:frameData[IdleTurtleAnim.spriteData[kTurtlePart_Jaw].firstFrame + turtleAniStep].scaleY * wholeTurtleScaleFromSocurce * 2];
    [s_Turtle_Eye setScaleY:frameData[IdleTurtleAnim.spriteData[kTurtlePart_Eye].firstFrame + turtleAniStep].scaleY * wholeTurtleScaleFromSocurce * 2];
    [s_Turtle_Head setScaleY:frameData[IdleTurtleAnim.spriteData[kTurtlePart_Head].firstFrame + turtleAniStep].scaleY * wholeTurtleScaleFromSocurce * 2];
    [s_Turtle_Shell setScaleY:frameData[IdleTurtleAnim.spriteData[kTurtlePart_Shell].firstFrame + turtleAniStep].scaleY * wholeTurtleScaleFromSocurce * 2];
    [s_Turtle_LeftLeg setScaleY:frameData[IdleTurtleAnim.spriteData[kTurtlePart_LeftLeg].firstFrame + turtleAniStep].scaleY * wholeTurtleScaleFromSocurce * 2];
    [s_Turtle_RightLeg setScaleY:frameData[IdleTurtleAnim.spriteData[kTurtlePart_RightLeg].firstFrame + turtleAniStep].scaleY * wholeTurtleScaleFromSocurce * 2];
    [s_Turtle_Tail setScaleY:frameData[IdleTurtleAnim.spriteData[kTurtlePart_Tail].firstFrame + turtleAniStep].scaleY * wholeTurtleScaleFromSocurce * 2];
    [s_Turtle_Shadow setScaleY:frameData[IdleTurtleAnim.spriteData[kTurtlePart_Shadow].firstFrame + turtleAniStep].scaleY * wholeTurtleScaleFromSocurce * 2];
}



-(void) turtleIdle{
    //  [self turtleTempIdle];
    // return;
    
    turtleAniStep2++;
    if(turtleAniStep2 % 2 == 0){
        return;
    }
    
    turtleAniStep++;
    
    static float idleOffsetX;
    static float idleOffsetY;
    
    if(turtleAniStep == 1){
        [s_Turtle_Head setTextureRect:CGRectMake(1542/2,162/2,132/2,107/2)];
        [s_Turtle_Eye setTextureRect:CGRectMake(1688/2,162/2,48/2,98/2)];
        
        idleOffsetX = -175 * wholeTurtleScaleFromSocurce * 2;
        idleOffsetY = 140 * wholeTurtleScaleFromSocurce * 2;
    }
    
    // printf("turtleAniStep:%4.8f %4.8f %4.8f\n",turtleX,turtleY, turtleX + frameData[IdleTurtleAnim.spriteData[kTurtlePart_Neck].firstFrame + turtleAniStep].x * wholeTurtleScaleFromSocurce);
    
    
    if(!isFacingRight){
        turtle_Neck_x = idleOffsetX + turtleX + frameData[IdleTurtleAnim.spriteData[kTurtlePart_Neck].firstFrame + turtleAniStep].x * wholeTurtleScaleFromSocurce;
        turtle_Jaw_x = idleOffsetX + turtleX + (frameData[IdleTurtleAnim.spriteData[kTurtlePart_Jaw].firstFrame + turtleAniStep].x+1) * wholeTurtleScaleFromSocurce;
        turtle_Eye_x = idleOffsetX + turtleX + (frameData[IdleTurtleAnim.spriteData[kTurtlePart_Eye].firstFrame + turtleAniStep].x+1) * wholeTurtleScaleFromSocurce;
        turtle_Head_x = idleOffsetX + turtleX + frameData[IdleTurtleAnim.spriteData[kTurtlePart_Head].firstFrame + turtleAniStep].x * wholeTurtleScaleFromSocurce;
        turtle_Shell_x = idleOffsetX + turtleX + frameData[IdleTurtleAnim.spriteData[kTurtlePart_Shell].firstFrame + turtleAniStep].x * wholeTurtleScaleFromSocurce;
        turtle_LeftLeg_x = idleOffsetX + turtleX + frameData[IdleTurtleAnim.spriteData[kTurtlePart_LeftLeg].firstFrame + turtleAniStep].x * wholeTurtleScaleFromSocurce;
        turtle_RightLeg_x = idleOffsetX + turtleX + frameData[IdleTurtleAnim.spriteData[kTurtlePart_RightLeg].firstFrame + turtleAniStep].x * wholeTurtleScaleFromSocurce;
        turtle_Tail_x = idleOffsetX + turtleX + frameData[IdleTurtleAnim.spriteData[kTurtlePart_Tail].firstFrame + turtleAniStep].x * wholeTurtleScaleFromSocurce;
        turtle_Shadow_x = idleOffsetX + turtleX + frameData[IdleTurtleAnim.spriteData[kTurtlePart_Shadow].firstFrame + turtleAniStep].x * wholeTurtleScaleFromSocurce;
        
        turtle_Neck_y = idleOffsetY + turtleY + frameData[IdleTurtleAnim.spriteData[kTurtlePart_Neck].firstFrame + turtleAniStep].y * wholeTurtleScaleFromSocurce;
        turtle_Jaw_y = idleOffsetY + turtleY + (frameData[IdleTurtleAnim.spriteData[kTurtlePart_Jaw].firstFrame + turtleAniStep].y-1) * wholeTurtleScaleFromSocurce;
        turtle_Eye_y = idleOffsetY + turtleY + (frameData[IdleTurtleAnim.spriteData[kTurtlePart_Eye].firstFrame + turtleAniStep].y-2) * wholeTurtleScaleFromSocurce;
        turtle_Head_y = idleOffsetY + turtleY + frameData[IdleTurtleAnim.spriteData[kTurtlePart_Head].firstFrame + turtleAniStep].y * wholeTurtleScaleFromSocurce;
        turtle_Shell_y = idleOffsetY + turtleY + frameData[IdleTurtleAnim.spriteData[kTurtlePart_Shell].firstFrame + turtleAniStep].y * wholeTurtleScaleFromSocurce;
        turtle_LeftLeg_y = idleOffsetY + turtleY + frameData[IdleTurtleAnim.spriteData[kTurtlePart_LeftLeg].firstFrame + turtleAniStep].y * wholeTurtleScaleFromSocurce;
        turtle_RightLeg_y = idleOffsetY + turtleY + frameData[IdleTurtleAnim.spriteData[kTurtlePart_RightLeg].firstFrame + turtleAniStep].y * wholeTurtleScaleFromSocurce;
        turtle_Tail_y = idleOffsetY + turtleY + frameData[IdleTurtleAnim.spriteData[kTurtlePart_Tail].firstFrame + turtleAniStep].y * wholeTurtleScaleFromSocurce;
        turtle_Shadow_y = idleOffsetY + turtleY + frameData[IdleTurtleAnim.spriteData[kTurtlePart_Shadow].firstFrame + turtleAniStep].y * wholeTurtleScaleFromSocurce;
    
        
        [s_Turtle_Neck setRotation:frameData[IdleTurtleAnim.spriteData[kTurtlePart_Neck].firstFrame + turtleAniStep].rotation * 180/M_PI];
        [s_Turtle_Jaw setRotation:frameData[IdleTurtleAnim.spriteData[kTurtlePart_Jaw].firstFrame + turtleAniStep].rotation * 180/M_PI];
        [s_Turtle_Eye setRotation:frameData[IdleTurtleAnim.spriteData[kTurtlePart_Eye].firstFrame + turtleAniStep].rotation * 180/M_PI];
        [s_Turtle_Head setRotation:frameData[IdleTurtleAnim.spriteData[kTurtlePart_Head].firstFrame + turtleAniStep].rotation * 180/M_PI];
        [s_Turtle_Shell setRotation:frameData[IdleTurtleAnim.spriteData[kTurtlePart_Shell].firstFrame + turtleAniStep].rotation * 180/M_PI];
        [s_Turtle_LeftLeg setRotation:frameData[IdleTurtleAnim.spriteData[kTurtlePart_LeftLeg].firstFrame + turtleAniStep].rotation * 180/M_PI];
        [s_Turtle_RightLeg setRotation:frameData[IdleTurtleAnim.spriteData[kTurtlePart_RightLeg].firstFrame + turtleAniStep].rotation * 180/M_PI];
        [s_Turtle_Tail setRotation:frameData[IdleTurtleAnim.spriteData[kTurtlePart_Tail].firstFrame + turtleAniStep].rotation * 180/M_PI];
        [s_Turtle_Shadow setRotation:frameData[IdleTurtleAnim.spriteData[kTurtlePart_Shadow].firstFrame + turtleAniStep].rotation * 180/M_PI];
        
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
        
        [s_Turtle_Neck setRotation:-frameData[IdleTurtleAnim.spriteData[kTurtlePart_Neck].firstFrame + turtleAniStep].rotation * 180/M_PI];
        [s_Turtle_Jaw setRotation:-frameData[IdleTurtleAnim.spriteData[kTurtlePart_Jaw].firstFrame + turtleAniStep].rotation * 180/M_PI];
        [s_Turtle_Eye setRotation:-frameData[IdleTurtleAnim.spriteData[kTurtlePart_Eye].firstFrame + turtleAniStep].rotation * 180/M_PI];
        [s_Turtle_Head setRotation:-frameData[IdleTurtleAnim.spriteData[kTurtlePart_Head].firstFrame + turtleAniStep].rotation * 180/M_PI];
        [s_Turtle_Shell setRotation:-frameData[IdleTurtleAnim.spriteData[kTurtlePart_Shell].firstFrame + turtleAniStep].rotation * 180/M_PI];
        [s_Turtle_LeftLeg setRotation:-frameData[IdleTurtleAnim.spriteData[kTurtlePart_LeftLeg].firstFrame + turtleAniStep].rotation * 180/M_PI];
        [s_Turtle_RightLeg setRotation:-frameData[IdleTurtleAnim.spriteData[kTurtlePart_RightLeg].firstFrame + turtleAniStep].rotation * 180/M_PI];
        [s_Turtle_Tail setRotation:-frameData[IdleTurtleAnim.spriteData[kTurtlePart_Tail].firstFrame + turtleAniStep].rotation * 180/M_PI];
        [s_Turtle_Shadow setRotation:-frameData[IdleTurtleAnim.spriteData[kTurtlePart_Shadow].firstFrame + turtleAniStep].rotation * 180/M_PI];
        
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
    }
    if(winkingTimer == 3){
        [s_Turtle_Eye setTextureRect:CGRectMake(1784/2,162/2,48/2,98/2)];
    }
    if(winkingTimer == 5){
        [s_Turtle_Eye setTextureRect:CGRectMake(1736/2,162/2,48/2,98/2)];
    }
    
    
    if(winkingTimer == 7){
        [s_Turtle_Eye setTextureRect:CGRectMake(1688/2,162/2,48/2,98/2)];
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
            [s_Turtle_Shell setTextureRect:CGRectMake(396/2,204/2,108/2,70/2)];
        }
        if(color == kTurtleShellColor_Brown){
            [s_Turtle_Shell setTextureRect:CGRectMake(396/2,204/2,108/2,70/2)];
        }
        if(color == kTurtleShellColor_Red){
            [s_Turtle_Shell setTextureRect:CGRectMake(756/2,642/2,108/2,70/2)];
        }
        if(color == kTurtleShellColor_Green){
            [s_Turtle_Shell setTextureRect:CGRectMake(756/2,460/2,108/2,70/2)];
        }
        if(color == kTurtleShellColor_Blue){
            [s_Turtle_Shell setTextureRect:CGRectMake(756/2,552/2,108/2,70/2)];
        }
        
        [s_Turtle_Shell setAnchorPoint:ccp(54/108.0, 1.0 - 46.0/71.0)];
    }
    
    if(shellLevel == 1){
        if(color == kTurtleShellColor_BrownOri){
            [s_Turtle_Shell setTextureRect:CGRectMake(948/2,370/2,108/2,76/2)];
        }
        if(color == kTurtleShellColor_Brown){
            //[s_Turtle_Shell setTextureRect:CGRectMake(948/2,370/2,108/2,76/2)];
            [s_Turtle_Shell setTextureRect:CGRectMake(1938/2,380/2,108/2,76/2)];
        }
        if(color == kTurtleShellColor_Red){
            [s_Turtle_Shell setTextureRect:CGRectMake(866/2,642/2,108/2,76/2)];
        }
        if(color == kTurtleShellColor_Green){
            [s_Turtle_Shell setTextureRect:CGRectMake(866/2,460/2,108/2,76/2)];
        }
        if(color == kTurtleShellColor_Blue){
            [s_Turtle_Shell setTextureRect:CGRectMake(866/2,552/2,108/2,76/2)];
        }
        
        [s_Turtle_Shell setAnchorPoint:ccp(54/108.0, 1.0 - 52.0/76.0)];
    }
    
    if(shellLevel == 2){
        hasSpike = true;
        if(color == kTurtleShellColor_BrownOri){
            [s_Turtle_Shell setTextureRect:CGRectMake(836/2,370/2,108/2,86/2)];
        }
        if(color == kTurtleShellColor_Brown){
            [s_Turtle_Shell setTextureRect:CGRectMake(1700/2,380/2,108/2,86/2)];
        }
        if(color == kTurtleShellColor_Red){
            [s_Turtle_Shell setTextureRect:CGRectMake(1090/2,642/2,108/2,86/2)];
        }
        if(color == kTurtleShellColor_Green){
            [s_Turtle_Shell setTextureRect:CGRectMake(1090/2,460/2,108/2,86/2)];
        }
        if(color == kTurtleShellColor_Blue){
            [s_Turtle_Shell setTextureRect:CGRectMake(1090/2,552/2,108/2,86/2)];
        }
        
        [s_Turtle_Shell setAnchorPoint:ccp(54/108.0, 1.0 - 62.0/86.0)];
    }
}

-(void) tap{
    
    if(status == kTurtleAniStatus_Normal_In || status == kTurtleAniStatus_Shaking || status == kTurtleAniStatus_Bombing){
        
        [uILayer lostCombo];
        [self setStatus:kTurtleAniStatus_Shaking];
        
        if(delegate){
            [delegate tapWrongly];
        }
        
        
        [musicController playThisSound:kSound_TapWrongly isLoop:NO gain:1.0];
        
        return;
    }
    
    if(status == kTurtleAniStatus_Bombing){
        return;
    }
    
    hurtTime++;
    
    
    [uILayer gainCombo:1];
    
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
                [s_Turtle_Shell setTextureRect:CGRectMake(1058/2,370/2,108/2,76/2)];
            }
            if(color == kTurtleShellColor_Brown){
                [s_Turtle_Shell setTextureRect:CGRectMake(1058/2,370/2,108/2,76/2)];
            }
            if(color == kTurtleShellColor_Red){
                [s_Turtle_Shell setTextureRect:CGRectMake(978/2,642/2,108/2,76/2)];
            }
            if(color == kTurtleShellColor_Green){
                [s_Turtle_Shell setTextureRect:CGRectMake(978/2,460/2,108/2,76/2)];
            }
            if(color == kTurtleShellColor_Blue){
                [s_Turtle_Shell setTextureRect:CGRectMake(978/2,552/2,108/2,76/2)];
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
                [s_Turtle_Shell setTextureRect:CGRectMake(614/2,370/2,108/2,76/2)];
            }
            if(color == kTurtleShellColor_Brown){
                [s_Turtle_Shell setTextureRect:CGRectMake(1202/2,370/2,108/2,76/2)];
            }
            if(color == kTurtleShellColor_Red){
                [s_Turtle_Shell setTextureRect:CGRectMake(1202/2,642/2,108/2,76/2)];
            }
            if(color == kTurtleShellColor_Green){
                [s_Turtle_Shell setTextureRect:CGRectMake(1202/2,460/2,108/2,76/2)];
            }
            if(color == kTurtleShellColor_Blue){
                [s_Turtle_Shell setTextureRect:CGRectMake(1202/2,552/2,108/2,76/2)];
            }
           
            [s_Turtle_Shell setAnchorPoint:ccp(54/108.0, 1.0 - 52.0/76.0)];
            
            [musicController playThisSound:kSound_CrackShell isLoop:NO gain:1.0];
        }
        
        if(hurtTime == 2){
            if(color == kTurtleShellColor_BrownOri){
                [s_Turtle_Shell setTextureRect:CGRectMake(724/2,370/2,108/2,76/2)];
            }
            if(color == kTurtleShellColor_Brown){
                [s_Turtle_Shell setTextureRect:CGRectMake(1314/2,370/2,108/2,76/2)];
            }
            if(color == kTurtleShellColor_Red){
                [s_Turtle_Shell setTextureRect:CGRectMake(1314/2,640/2,108/2,76/2)];
            }
            if(color == kTurtleShellColor_Green){
                [s_Turtle_Shell setTextureRect:CGRectMake(1314/2,460/2,108/2,76/2)];
            }
            if(color == kTurtleShellColor_Blue){
                [s_Turtle_Shell setTextureRect:CGRectMake(1314/2,552/2,108/2,76/2)];
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
    
    printf("tap2: %i\n",hurtTime);
    hurtTime++;
    printf("tap222: %i\n",hurtTime);

    [uILayer gainCombo:1];
    
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
                [s_Turtle_Shell setTextureRect:CGRectMake(724/2,370/2,108/2,76/2)];
            }
            if(color == kTurtleShellColor_Brown){
                [s_Turtle_Shell setTextureRect:CGRectMake(1816/2,380/2,108/2,76/2)];
            }
            if(color == kTurtleShellColor_Red){
                [s_Turtle_Shell setTextureRect:CGRectMake(1314/2,640/2,108/2,76/2)];
            }
            if(color == kTurtleShellColor_Green){
                [s_Turtle_Shell setTextureRect:CGRectMake(1314/2,460/2,108/2,76/2)];
            }
            if(color == kTurtleShellColor_Blue){
                [s_Turtle_Shell setTextureRect:CGRectMake(1314/2,552/2,108/2,76/2)];
            }
            
            [s_Turtle_Shell setAnchorPoint:ccp(54/108.0, 1.0 - 52.0/76.0)];
        }
        
        if(hurtTime == 2){
            [self setToBombing];
            
            /*if(color == kTurtleShellColor_BrownOri){
                [s_Turtle_Shell setTextureRect:CGRectMake(724/2,370/2,108/2,76/2)];
            }
            if(color == kTurtleShellColor_Brown){
                [s_Turtle_Shell setTextureRect:CGRectMake(1314/2,370/2,108/2,76/2)];
            }
            if(color == kTurtleShellColor_Red){
                [s_Turtle_Shell setTextureRect:CGRectMake(1314/2,640/2,108/2,76/2)];
            }
            if(color == kTurtleShellColor_Green){
                [s_Turtle_Shell setTextureRect:CGRectMake(1314/2,460/2,108/2,76/2)];
            }
            if(color == kTurtleShellColor_Blue){
                [s_Turtle_Shell setTextureRect:CGRectMake(1314/2,552/2,108/2,76/2)];
            }
            
            [s_Turtle_Shell setAnchorPoint:ccp(54/108.0, 1.0 - 52.0/76.0)];*/
        }
        
    }
    
}


-(void) manageSpike{
    if(!spikeRemoveIsAni){
        return;
    }
    
    if(spikeRemoveAniTimer == 0){
        // [s_Turtle_Shell setTextureRect:CGRectMake(504/2,370/2,108/2,76/2)];
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
        turtle_Spike_x[i] = spikePosX[i];
        turtle_Spike_y[i] = spikePosY[i];
        
        [s_Turtle_Spike[i] setOpacity:spikeOpacity];
    }
    
    
    spikeRemoveAniTimer++;
}

-(void) setToBombing{
    gameRound++;
    //printf("setToBomb:%i\n",gameRound);
     //printf("setToBombing\n");
    if(currentChosenMiniGame == 4 || currentChosenMiniGame == 1){
       // printf("setToBombing2\n");
        if(status != kTurtleAniStatus_In){
            if(delegate){
                [delegate turtleBombed:momentIdx];
            }
            
        }
    }
    
    [playLayer setToBombing:turtleX turtleY:turtleY];
    [self setStatus:kTurtleAniStatus_Bombing];
    
    [musicController playThisSound:kSound_ComboSmoke isLoop:NO gain:1.0];
    [musicController playThisSound:kSound_CrackShell isLoop:NO gain:0.3];
    
   // [musicController playThisSound:kSound_TurtleExplode01 isLoop:NO gain:0.7];
   // [musicController playThisSound:kSound_CrackShell isLoop:NO gain:0.6];
}

-(void) setBombOutType:(int)_bombOutType{
    bombOutType = _bombOutType;
}

-(void) manageBombAni{
    
}



@end
