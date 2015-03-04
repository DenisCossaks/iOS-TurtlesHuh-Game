//
//  Penguin.m
//  TurtlesHuh
//
//  Created by  on 2012/4/29.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "Penguin.h"
#import "animationDefs.h"
#import "GamePlayGlobal.h"
#import "Global.h"

@implementation Penguin

-(int) jumpingAniStep{
    return jumpingAniStep;
}

-(void) bombOutOffScreenDirection:(int)_bomOutOffScreenDirection{
    bombOutOffScreenDirection = _bomOutOffScreenDirection;
}

-(void) setOpacity:(int)_opacity{
    [s_Body setOpacity:_opacity];
    [s_Eye setOpacity:_opacity];
    [s_FrontLeg setOpacity:_opacity];
    [s_BackLeg setOpacity:_opacity];
    [s_Mouth setOpacity:_opacity];
    [s_Wing setOpacity:_opacity];
}

-(bool) facingRight{
    return isFacingRight;
}

-(float)x{
    return x;
}

-(float)y{
    return y;
}

-(float)jumpingX{
    return x + jumpXLengthInterval * aniStep;
}

-(void) setDelegate:(id)_delegate{
    delegate = _delegate;
}

-(void) setIDNumber:(int)_number{
    idNumber = _number;
}

-(void) setFacingRight:(bool)_isRight{
    
    if(isFacingRight != _isRight){
        [s_Body setScaleX:-s_Body.scaleX];
        [s_Eye setScaleX:-s_Eye.scaleX];
        [s_FrontLeg setScaleX:-s_FrontLeg.scaleX];
        [s_BackLeg setScaleX:-s_BackLeg.scaleX];
        [s_Mouth setScaleX:-s_Mouth.scaleX];
        [s_Wing setScaleX:-s_Wing.scaleX];
    }
    
    isFacingRight = _isRight;
}

-(void) setIsNotInGame:(bool)_notInGame{
    isNotInGame = _notInGame;
}

-(void) setPenguinScale:(float)_scale{
    penguinScale = _scale;
    
    if(isFacingRight){
        superFuxkAngleDiff = -turtleRotation * M_PI/180;
        superFuxkOriX = idle_x[kPenguinPart_Body] * penguinScale * aniControlValueForFuckingIpad;
        superFuxkOriY = idle_y[kPenguinPart_Body] * penguinScale * aniControlValueForFuckingIpad;
        body_x = x + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
        body_y = y + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
        
        superFuxkAngleDiff = -turtleRotation * M_PI/180;
        superFuxkOriX = idle_x[kPenguinPart_Eye] * penguinScale * aniControlValueForFuckingIpad;
        superFuxkOriY = idle_y[kPenguinPart_Eye] * penguinScale * aniControlValueForFuckingIpad;
        eye_x = x + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
        eye_y = y + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
        
        superFuxkAngleDiff = -turtleRotation * M_PI/180;
        superFuxkOriX = idle_x[kPenguinPart_FrontLeg] * penguinScale * aniControlValueForFuckingIpad;
        superFuxkOriY = idle_y[kPenguinPart_FrontLeg] * penguinScale * aniControlValueForFuckingIpad;
        frontLeg_x = x + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
        frontLeg_y = y + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
        
        superFuxkAngleDiff = -turtleRotation * M_PI/180;
        superFuxkOriX = idle_x[kPenguinPart_BackLeg] * penguinScale * aniControlValueForFuckingIpad;
        superFuxkOriY = idle_y[kPenguinPart_BackLeg] * penguinScale * aniControlValueForFuckingIpad;
        backLeg_x = x + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
        backLeg_y = y + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
        
        superFuxkAngleDiff = -turtleRotation * M_PI/180;
        superFuxkOriX = idle_x[kPenguinPart_Mouth] * penguinScale * aniControlValueForFuckingIpad;
        superFuxkOriY = idle_y[kPenguinPart_Mouth] * penguinScale * aniControlValueForFuckingIpad;
        mouth_x = x + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
        mouth_y = y + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
        
        superFuxkAngleDiff = -turtleRotation * M_PI/180;
        superFuxkOriX = idle_x[kPenguinPart_Wing] * penguinScale * aniControlValueForFuckingIpad;
        superFuxkOriY = idle_y[kPenguinPart_Wing] * penguinScale * aniControlValueForFuckingIpad;
        wing_x = x + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
        wing_y = y + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
    }else{
        
        superFuxkAngleDiff = -turtleRotation * M_PI/180;
        superFuxkOriX = -idle_x[kPenguinPart_Body] * penguinScale * aniControlValueForFuckingIpad;
        superFuxkOriY = idle_y[kPenguinPart_Body] * penguinScale * aniControlValueForFuckingIpad;
        body_x = x + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
        body_y = y + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
        
        superFuxkAngleDiff = -turtleRotation * M_PI/180;
        superFuxkOriX = -idle_x[kPenguinPart_Eye] * penguinScale * aniControlValueForFuckingIpad;
        superFuxkOriY = idle_y[kPenguinPart_Eye] * penguinScale * aniControlValueForFuckingIpad;
        eye_x = x + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
        eye_y = y + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
        
        superFuxkAngleDiff = -turtleRotation * M_PI/180;
        superFuxkOriX = -idle_x[kPenguinPart_FrontLeg] * penguinScale * aniControlValueForFuckingIpad;
        superFuxkOriY = idle_y[kPenguinPart_FrontLeg] * penguinScale * aniControlValueForFuckingIpad;
        frontLeg_x = x + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
        frontLeg_y = y + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
        
        superFuxkAngleDiff = -turtleRotation * M_PI/180;
        superFuxkOriX = -idle_x[kPenguinPart_BackLeg] * penguinScale * aniControlValueForFuckingIpad;
        superFuxkOriY = idle_y[kPenguinPart_BackLeg] * penguinScale * aniControlValueForFuckingIpad;
        backLeg_x = x + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
        backLeg_y = y + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
        
        superFuxkAngleDiff = -turtleRotation * M_PI/180;
        superFuxkOriX = -idle_x[kPenguinPart_Mouth] * penguinScale * aniControlValueForFuckingIpad;
        superFuxkOriY = idle_y[kPenguinPart_Mouth] * penguinScale * aniControlValueForFuckingIpad;
        mouth_x = x + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
        mouth_y = y + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
        
        superFuxkAngleDiff = -turtleRotation * M_PI/180;
        superFuxkOriX = -idle_x[kPenguinPart_Wing] * penguinScale * aniControlValueForFuckingIpad;
        superFuxkOriY = idle_y[kPenguinPart_Wing] * penguinScale * aniControlValueForFuckingIpad;
        wing_x = x + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
        wing_y = y + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
    }
    
    
    idle_sx[kPenguinPart_BackLeg] = penguinScale * 2;
    idle_sy[kPenguinPart_BackLeg] = penguinScale * 2;
    idle_sx[kPenguinPart_Body] = penguinScale * 2;
    idle_sy[kPenguinPart_Body] = penguinScale * 2;
    idle_sx[kPenguinPart_Eye] = penguinScale * 2;
    idle_sy[kPenguinPart_Eye] = penguinScale * 2;
    idle_sx[kPenguinPart_Mouth] = penguinScale * 2;
    idle_sy[kPenguinPart_Mouth] = penguinScale * 2;
    idle_sx[kPenguinPart_FrontLeg] = penguinScale * 2;
    idle_sy[kPenguinPart_FrontLeg] = penguinScale * 2;
    
    if(!isPlayingMiniGame){
        idle_sx[kPenguinPart_Eye] = penguinScale * 2;
        idle_sy[kPenguinPart_Eye] = penguinScale * 2 * 1.161;
    }
    
    if(isFacingRight){
        [s_Body setScaleX:idle_sx[kPenguinPart_Body]];
        [s_Eye setScaleX:idle_sx[kPenguinPart_Eye]];
        [s_FrontLeg setScaleX:idle_sx[kPenguinPart_FrontLeg]];
        [s_BackLeg setScaleX:idle_sx[kPenguinPart_BackLeg]];
        [s_Mouth setScaleX:idle_sx[kPenguinPart_Mouth]];
        [s_Wing setScaleX:idle_sx[kPenguinPart_Wing]];
        
        [s_Body setScaleY:idle_sy[kPenguinPart_Body]];
        [s_Eye setScaleY:idle_sy[kPenguinPart_Eye]];
        [s_FrontLeg setScaleY:idle_sy[kPenguinPart_FrontLeg]];
        [s_BackLeg setScaleY:idle_sy[kPenguinPart_BackLeg]];
        [s_Mouth setScaleY:idle_sy[kPenguinPart_Mouth]];
        [s_Wing setScaleY:idle_sy[kPenguinPart_Wing]];
    }else{
        [s_Body setScaleX:-idle_sx[kPenguinPart_Body]];
        [s_Eye setScaleX:-idle_sx[kPenguinPart_Eye]];
        [s_FrontLeg setScaleX:-idle_sx[kPenguinPart_FrontLeg]];
        [s_BackLeg setScaleX:-idle_sx[kPenguinPart_BackLeg]];
        [s_Mouth setScaleX:-idle_sx[kPenguinPart_Mouth]];
        [s_Wing setScaleX:-idle_sx[kPenguinPart_Wing]];
        
        [s_Body setScaleY:idle_sy[kPenguinPart_Body]];
        [s_Eye setScaleY:idle_sy[kPenguinPart_Eye]];
        [s_FrontLeg setScaleY:idle_sy[kPenguinPart_FrontLeg]];
        [s_BackLeg setScaleY:idle_sy[kPenguinPart_BackLeg]];
        [s_Mouth setScaleY:idle_sy[kPenguinPart_Mouth]];
        [s_Wing setScaleY:idle_sy[kPenguinPart_Wing]];
    }


}

-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
        
        //printf("penguin init\n");
        
        delegate = nil;
        
        penguinScale = wholePenguinScaleFromSocurce;
        
         body_x = 9999;
         eye_x = 9999;
         frontLeg_x = 9999;
         backLeg_x = 9999;
         mouth_x = 9999;
         wing_x = 9999;
        
         body_y = 9999;
         eye_y = 9999;
         frontLeg_y = 9999;
         backLeg_y = 9999;
         mouth_y = 9999;
         wing_y = 9999;
        
        aniStep = 0;
        aniStep2 = 0;
        
        isFacingRight = true;
        isNotInGame = false;

        
   
        if(isPlayingMiniGame){
            s_Body = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(0,392/textureRatioForFuckingIpad,100/textureRatioForFuckingIpad,151/textureRatioForFuckingIpad)];
            s_Eye = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(134/textureRatioForFuckingIpad,506/textureRatioForFuckingIpad,16/textureRatioForFuckingIpad,26/textureRatioForFuckingIpad)];
            s_FrontLeg = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(102/textureRatioForFuckingIpad,484/textureRatioForFuckingIpad,55/textureRatioForFuckingIpad,17/textureRatioForFuckingIpad)];
            s_BackLeg = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(102/textureRatioForFuckingIpad,464/textureRatioForFuckingIpad,55/textureRatioForFuckingIpad,17/textureRatioForFuckingIpad)];
            s_Mouth = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(102/textureRatioForFuckingIpad,506/textureRatioForFuckingIpad,29/textureRatioForFuckingIpad,31/textureRatioForFuckingIpad)];
            s_Wing = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(102/textureRatioForFuckingIpad,392/textureRatioForFuckingIpad,52/textureRatioForFuckingIpad,70/textureRatioForFuckingIpad)];
            
            [ss_Character addChild:s_Body z:kDeapth_Penguin_Body];
            [ss_Character addChild:s_Eye z:kDeapth_Penguin_Eye];
            [ss_Character addChild:s_FrontLeg z:kDeapth_Penguin_FrongLeg];
            [ss_Character addChild:s_BackLeg z:kDeapth_Penguin_BackLeg];
            [ss_Character addChild:s_Mouth z:kDeapth_Penguin_Mouth];
            [ss_Character addChild:s_Wing z:kDeapth_Penguin_Wing];
            
            [s_Body setAnchorPoint:ccp(49.0/99.0, 1.0 - 76.0/151.0)];
            [s_Eye setAnchorPoint:ccp(8.0/16.0, 1.0 - 13.0/26.0)];
            [s_FrontLeg setAnchorPoint:ccp(27.0/55.0, 1.0 - 8.0/17.0)];
            [s_BackLeg setAnchorPoint:ccp(27.0/55.0, 1.0 - 8/17.0)];
            [s_Mouth setAnchorPoint:ccp(14.0/29.0, 1.0 - 17.0/31.0)];
            [s_Wing setAnchorPoint:ccp(26.0/51.0, 1.0 - 35.0/69.0)];
            
        }else{
            //EYE FOR ROPE
            //WING FOR ROCKET
            
            s_Body = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(1260/textureRatioForFuckingIpad,150/textureRatioForFuckingIpad,154/textureRatioForFuckingIpad,100/textureRatioForFuckingIpad)];
            s_Eye = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(616/textureRatioForFuckingIpad+726/textureRatioForFuckingIpad, 824/textureRatioForFuckingIpad-132/textureRatioForFuckingIpad, 42/textureRatioForFuckingIpad,118/textureRatioForFuckingIpad)];
            s_FrontLeg = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(0/textureRatioForFuckingIpad,0/textureRatioForFuckingIpad,0/textureRatioForFuckingIpad,0/textureRatioForFuckingIpad)];
            s_BackLeg = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(0/textureRatioForFuckingIpad,0/textureRatioForFuckingIpad,0/textureRatioForFuckingIpad,0/textureRatioForFuckingIpad)];
            s_Mouth = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(0/textureRatioForFuckingIpad,0/textureRatioForFuckingIpad,0/textureRatioForFuckingIpad,0/textureRatioForFuckingIpad)];
            s_Wing = [CCSprite spriteWithTexture:ss_Character.texture rect:CGRectMake(398/textureRatioForFuckingIpad+726/textureRatioForFuckingIpad,824/textureRatioForFuckingIpad-132/textureRatioForFuckingIpad,216/textureRatioForFuckingIpad,88/textureRatioForFuckingIpad)];
            
            [ss_Character addChild:s_Body z:kDeapth_Penguin_MAIN];
            [ss_Character addChild:s_Wing z:kDeapth_Penguin_MAIN];
            [ss_Character addChild:s_Eye z:kDeapth_Penguin_MAIN];
            [ss_Character addChild:s_FrontLeg z:kDeapth_Penguin_MAIN];
            [ss_Character addChild:s_BackLeg z:kDeapth_Penguin_MAIN];
            [ss_Character addChild:s_Mouth z:kDeapth_Penguin_MAIN];
            
            
            [s_Body setAnchorPoint:ccp(49.0/99.0, 1.0 - 76.0/151.0)];
            [s_Eye setAnchorPoint:ccp(39.0/79.0,118.0/236.0)];
            [s_Wing setAnchorPoint:ccp(207.0/428.0,90.0/175.0)];
            
        }
        
        
        
        if(isPlayingMiniGame){
            idle_x[kPenguinPart_BackLeg] = 7.100000000000023;
            idle_y[kPenguinPart_BackLeg] = 6.550000000000011;
            idle_r[kPenguinPart_BackLeg] = 0;
            idle_sx[kPenguinPart_BackLeg] = penguinScale * 2;
            idle_sy[kPenguinPart_BackLeg] = penguinScale * 2;
            
            idle_x[kPenguinPart_Body] = 10; //18.19999999999999;
            idle_y[kPenguinPart_Body] = 65; //76.15;
            idle_r[kPenguinPart_Body] = 0;
            idle_sx[kPenguinPart_Body] = penguinScale * 2;
            idle_sy[kPenguinPart_Body] = penguinScale * 2;
            
            idle_x[kPenguinPart_Wing] = 11.850000000000023;
            idle_y[kPenguinPart_Wing] = 58.69999999999999;
            idle_r[kPenguinPart_Wing] = 0;
            idle_sx[kPenguinPart_Wing] = penguinScale * 2;
            idle_sy[kPenguinPart_Wing] = penguinScale * 2;
            
            idle_x[kPenguinPart_Eye] = 30.5;
            idle_y[kPenguinPart_Eye] = 121.05;
            idle_r[kPenguinPart_Eye] = 0;
            idle_sx[kPenguinPart_Eye] = penguinScale * 2;
            idle_sy[kPenguinPart_Eye] = penguinScale * 2;
            
            idle_x[kPenguinPart_Mouth] = 50.80000000000001;
            idle_y[kPenguinPart_Mouth] = 105.1;
            idle_r[kPenguinPart_Mouth] = 0;
            idle_sx[kPenguinPart_Mouth] = penguinScale * 2;
            idle_sy[kPenguinPart_Mouth] = penguinScale * 2;
            
            idle_x[kPenguinPart_FrontLeg] = 0.14999999999997726;
            idle_y[kPenguinPart_FrontLeg] = 6.550000000000011;
            idle_r[kPenguinPart_FrontLeg] = 0;
            idle_sx[kPenguinPart_FrontLeg] = penguinScale * 2;
            idle_sy[kPenguinPart_FrontLeg] = penguinScale * 2;
        }else{
            

            
            idle_x[kPenguinPart_Body] = 18.19999999999999 - 18.19999999999999;
            idle_y[kPenguinPart_Body] = 76.15 - 76.15;
            idle_r[kPenguinPart_Body] = 0;
            idle_sx[kPenguinPart_Body] = -penguinScale * 2;
            idle_sy[kPenguinPart_Body] = penguinScale * 2;
            
            idle_x[kPenguinPart_Wing] = 11.850000000000023 - 2 - 18.19999999999999;
            idle_y[kPenguinPart_Wing] = 133 - 76.15;
            idle_r[kPenguinPart_Wing] = 0;
            idle_sx[kPenguinPart_Wing] = -penguinScale * 2;
            idle_sy[kPenguinPart_Wing] = penguinScale * 2;
            
            idle_x[kPenguinPart_Eye] = 2 - 18.19999999999999;
            idle_y[kPenguinPart_Eye] = 94 - 76.15;
            idle_r[kPenguinPart_Eye] = 0;
            idle_sx[kPenguinPart_Eye] = -penguinScale * 2;
            idle_sy[kPenguinPart_Eye] = penguinScale * 2 * 1.161;
            
            
            idle_x[kPenguinPart_FrontLeg] = 0;
            idle_y[kPenguinPart_FrontLeg] = 0;
            idle_r[kPenguinPart_FrontLeg] = 0;
            idle_sx[kPenguinPart_FrontLeg] = 0;
            idle_sy[kPenguinPart_FrontLeg] = 0;
            
            idle_x[kPenguinPart_Mouth] = 0;
            idle_y[kPenguinPart_Mouth] = 0;
            idle_r[kPenguinPart_Mouth] = 0;
            idle_sx[kPenguinPart_Mouth] = 0;
            idle_sy[kPenguinPart_Mouth] = 0;
            
            idle_x[kPenguinPart_BackLeg] = 0;
            idle_y[kPenguinPart_BackLeg] = 0;
            idle_r[kPenguinPart_BackLeg] = 0;
            idle_sx[kPenguinPart_BackLeg] = 0;
            idle_sy[kPenguinPart_BackLeg] = 0;
            
        }
        
        
    }
	return self;
}

-(int) status{
    return status;
}

-(void) setR:(float)_r{
    turtleRotation = _r;
    
    if(isPlayingMiniGame){
        [s_Body setRotation:idle_r[kPenguinPart_Body] * 180/M_PI + turtleRotation];
        [s_Eye setRotation:idle_r[kPenguinPart_Eye] * 180/M_PI + turtleRotation];
        [s_FrontLeg setRotation:idle_r[kPenguinPart_FrontLeg] * 180/M_PI + turtleRotation];
        [s_BackLeg setRotation:idle_r[kPenguinPart_BackLeg] * 180/M_PI + turtleRotation];
        [s_Mouth setRotation:idle_r[kPenguinPart_Mouth] * 180/M_PI + turtleRotation];
        [s_Wing setRotation:idle_r[kPenguinPart_Wing] * 180/M_PI + turtleRotation];
    }else{
      //  [s_Body setRotation:idle_r[kPenguinPart_Body] * 180/M_PI + turtleRotation];
      //  [s_Eye setRotation:idle_r[kPenguinPart_Eye] * 180/M_PI + turtleRotation];
      //  [s_Wing setRotation:idle_r[kPenguinPart_Wing] * 180/M_PI + turtleRotation];
    }
    

}

-(void) setX:(int)_x{
   // printf("setX:%i\n",_x);
    x = _x;
    
    if(!isPlayingMiniGame){
        return;
    }
    
    if(isFacingRight){
        superFuxkAngleDiff = -turtleRotation * M_PI/180;
        superFuxkOriX = idle_x[kPenguinPart_Body] * penguinScale * aniControlValueForFuckingIpad;
        superFuxkOriY = idle_y[kPenguinPart_Body] * penguinScale * aniControlValueForFuckingIpad;
        body_x = x + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
        body_y = y + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
        
        superFuxkAngleDiff = -turtleRotation * M_PI/180;
        superFuxkOriX = idle_x[kPenguinPart_Eye] * penguinScale * aniControlValueForFuckingIpad;
        superFuxkOriY = idle_y[kPenguinPart_Eye] * penguinScale * aniControlValueForFuckingIpad;
        eye_x = x + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
        eye_y = y + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
        
        superFuxkAngleDiff = -turtleRotation * M_PI/180;
        superFuxkOriX = idle_x[kPenguinPart_FrontLeg] * penguinScale * aniControlValueForFuckingIpad;
        superFuxkOriY = idle_y[kPenguinPart_FrontLeg] * penguinScale * aniControlValueForFuckingIpad;
        frontLeg_x = x + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
        frontLeg_y = y + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
        
        superFuxkAngleDiff = -turtleRotation * M_PI/180;
        superFuxkOriX = idle_x[kPenguinPart_BackLeg] * penguinScale * aniControlValueForFuckingIpad;
        superFuxkOriY = idle_y[kPenguinPart_BackLeg] * penguinScale * aniControlValueForFuckingIpad;
        backLeg_x = x + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
        backLeg_y = y + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
        
        superFuxkAngleDiff = -turtleRotation * M_PI/180;
        superFuxkOriX = idle_x[kPenguinPart_Mouth] * penguinScale * aniControlValueForFuckingIpad;
        superFuxkOriY = idle_y[kPenguinPart_Mouth] * penguinScale * aniControlValueForFuckingIpad;
        mouth_x = x + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
        mouth_y = y + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
        
        superFuxkAngleDiff = -turtleRotation * M_PI/180;
        superFuxkOriX = idle_x[kPenguinPart_Wing] * penguinScale * aniControlValueForFuckingIpad;
        superFuxkOriY = idle_y[kPenguinPart_Wing] * penguinScale * aniControlValueForFuckingIpad;
        wing_x = x + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
        wing_y = y + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
    }else{
        
        superFuxkAngleDiff = -turtleRotation * M_PI/180;
        superFuxkOriX = -idle_x[kPenguinPart_Body] * penguinScale * aniControlValueForFuckingIpad;
        superFuxkOriY = idle_y[kPenguinPart_Body] * penguinScale * aniControlValueForFuckingIpad;
        body_x = x + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
        body_y = y + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
        
        superFuxkAngleDiff = -turtleRotation * M_PI/180;
        superFuxkOriX = -idle_x[kPenguinPart_Eye] * penguinScale * aniControlValueForFuckingIpad;
        superFuxkOriY = idle_y[kPenguinPart_Eye] * penguinScale * aniControlValueForFuckingIpad;
        eye_x = x + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
        eye_y = y + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
        
        superFuxkAngleDiff = -turtleRotation * M_PI/180;
        superFuxkOriX = -idle_x[kPenguinPart_FrontLeg] * penguinScale * aniControlValueForFuckingIpad;
        superFuxkOriY = idle_y[kPenguinPart_FrontLeg] * penguinScale * aniControlValueForFuckingIpad;
        frontLeg_x = x + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
        frontLeg_y = y + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
        
        superFuxkAngleDiff = -turtleRotation * M_PI/180;
        superFuxkOriX = -idle_x[kPenguinPart_BackLeg] * penguinScale * aniControlValueForFuckingIpad;
        superFuxkOriY = idle_y[kPenguinPart_BackLeg] * penguinScale * aniControlValueForFuckingIpad;
        backLeg_x = x + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
        backLeg_y = y + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
        
        superFuxkAngleDiff = -turtleRotation * M_PI/180;
        superFuxkOriX = -idle_x[kPenguinPart_Mouth] * penguinScale * aniControlValueForFuckingIpad;
        superFuxkOriY = idle_y[kPenguinPart_Mouth] * penguinScale * aniControlValueForFuckingIpad;
        mouth_x = x + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
        mouth_y = y + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
        
        superFuxkAngleDiff = -turtleRotation * M_PI/180;
        superFuxkOriX = -idle_x[kPenguinPart_Wing] * penguinScale * aniControlValueForFuckingIpad;
        superFuxkOriY = idle_y[kPenguinPart_Wing] * penguinScale * aniControlValueForFuckingIpad;
        wing_x = x + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
        wing_y = y + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
    }
    
}

-(void) setY:(int)_y{
    y = _y;
    
    if(!isPlayingMiniGame){
        return;
    }
    
    if(isFacingRight){
        superFuxkAngleDiff = -turtleRotation * M_PI/180;
        superFuxkOriX = idle_x[kPenguinPart_Body] * penguinScale * aniControlValueForFuckingIpad;
        superFuxkOriY = idle_y[kPenguinPart_Body] * penguinScale * aniControlValueForFuckingIpad;
        body_x = x + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
        body_y = y + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
        
        superFuxkAngleDiff = -turtleRotation * M_PI/180;
        superFuxkOriX = idle_x[kPenguinPart_Eye] * penguinScale * aniControlValueForFuckingIpad;
        superFuxkOriY = idle_y[kPenguinPart_Eye] * penguinScale * aniControlValueForFuckingIpad;
        eye_x = x + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
        eye_y = y + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
        
        superFuxkAngleDiff = -turtleRotation * M_PI/180;
        superFuxkOriX = idle_x[kPenguinPart_FrontLeg] * penguinScale * aniControlValueForFuckingIpad;
        superFuxkOriY = idle_y[kPenguinPart_FrontLeg] * penguinScale * aniControlValueForFuckingIpad;
        frontLeg_x = x + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
        frontLeg_y = y + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
        
        superFuxkAngleDiff = -turtleRotation * M_PI/180;
        superFuxkOriX = idle_x[kPenguinPart_BackLeg] * penguinScale * aniControlValueForFuckingIpad;
        superFuxkOriY = idle_y[kPenguinPart_BackLeg] * penguinScale * aniControlValueForFuckingIpad;
        backLeg_x = x + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
        backLeg_y = y + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
        
        superFuxkAngleDiff = -turtleRotation * M_PI/180;
        superFuxkOriX = idle_x[kPenguinPart_Mouth] * penguinScale * aniControlValueForFuckingIpad;
        superFuxkOriY = idle_y[kPenguinPart_Mouth] * penguinScale * aniControlValueForFuckingIpad;
        mouth_x = x + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
        mouth_y = y + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
        
        superFuxkAngleDiff = -turtleRotation * M_PI/180;
        superFuxkOriX = idle_x[kPenguinPart_Wing] * penguinScale * aniControlValueForFuckingIpad;
        superFuxkOriY = idle_y[kPenguinPart_Wing] * penguinScale * aniControlValueForFuckingIpad;
        wing_x = x + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
        wing_y = y + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
    }else{
        
        superFuxkAngleDiff = -turtleRotation * M_PI/180;
        superFuxkOriX = -idle_x[kPenguinPart_Body] * penguinScale * aniControlValueForFuckingIpad;
        superFuxkOriY = idle_y[kPenguinPart_Body] * penguinScale * aniControlValueForFuckingIpad;
        body_x = x + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
        body_y = y + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
        
        superFuxkAngleDiff = -turtleRotation * M_PI/180;
        superFuxkOriX = -idle_x[kPenguinPart_Eye] * penguinScale * aniControlValueForFuckingIpad;
        superFuxkOriY = idle_y[kPenguinPart_Eye] * penguinScale * aniControlValueForFuckingIpad;
        eye_x = x + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
        eye_y = y + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
        
        superFuxkAngleDiff = -turtleRotation * M_PI/180;
        superFuxkOriX = -idle_x[kPenguinPart_FrontLeg] * penguinScale * aniControlValueForFuckingIpad;
        superFuxkOriY = idle_y[kPenguinPart_FrontLeg] * penguinScale * aniControlValueForFuckingIpad;
        frontLeg_x = x + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
        frontLeg_y = y + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
        
        superFuxkAngleDiff = -turtleRotation * M_PI/180;
        superFuxkOriX = -idle_x[kPenguinPart_BackLeg] * penguinScale * aniControlValueForFuckingIpad;
        superFuxkOriY = idle_y[kPenguinPart_BackLeg] * penguinScale * aniControlValueForFuckingIpad;
        backLeg_x = x + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
        backLeg_y = y + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
        
        superFuxkAngleDiff = -turtleRotation * M_PI/180;
        superFuxkOriX = -idle_x[kPenguinPart_Mouth] * penguinScale * aniControlValueForFuckingIpad;
        superFuxkOriY = idle_y[kPenguinPart_Mouth] * penguinScale * aniControlValueForFuckingIpad;
        mouth_x = x + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
        mouth_y = y + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
        
        superFuxkAngleDiff = -turtleRotation * M_PI/180;
        superFuxkOriX = -idle_x[kPenguinPart_Wing] * penguinScale * aniControlValueForFuckingIpad;
        superFuxkOriY = idle_y[kPenguinPart_Wing] * penguinScale * aniControlValueForFuckingIpad;
        wing_x = x + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
        wing_y = y + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
    }
}

-(void) setExternalOffsetFinalXALL:(float)_ex{
    externalOffsetFinalX = _ex;
    externalOffsetX2 = _ex;
}


-(void) setExternalOffsetFinalX:(float)_ex{
    externalOffsetFinalX = _ex;
}

-(void) setExternalOffsetFinalY:(float)_ey{
    externalOffsetFinalY = _ey;
}

-(void) setStatus:(int) _status{
    status = _status;
    
    if(_status == kPenguinAniStatus_Idle){
        aniStep = 0;
        turtleRotation = 0;
        
        if(isFacingRight){
            body_x = x + idle_x[kPenguinPart_Body] * penguinScale * aniControlValueForFuckingIpad;
            eye_x = x + idle_x[kPenguinPart_Eye] * penguinScale * aniControlValueForFuckingIpad;
            frontLeg_x = x + idle_x[kPenguinPart_FrontLeg] * penguinScale * aniControlValueForFuckingIpad;
            backLeg_x = x + idle_x[kPenguinPart_BackLeg] * penguinScale * aniControlValueForFuckingIpad;
            mouth_x = x + idle_x[kPenguinPart_Mouth] * penguinScale * aniControlValueForFuckingIpad;
            wing_x = x + idle_x[kPenguinPart_Wing] * penguinScale * aniControlValueForFuckingIpad;
            
            body_y = y + idle_y[kPenguinPart_Body] * penguinScale * aniControlValueForFuckingIpad;
            eye_y = y + idle_y[kPenguinPart_Eye] * penguinScale * aniControlValueForFuckingIpad;
            frontLeg_y = y + idle_y[kPenguinPart_FrontLeg] * penguinScale * aniControlValueForFuckingIpad;
            backLeg_y = y + idle_y[kPenguinPart_BackLeg] * penguinScale * aniControlValueForFuckingIpad;
            mouth_y = y + idle_y[kPenguinPart_Mouth] * penguinScale * aniControlValueForFuckingIpad;
            wing_y = y + idle_y[kPenguinPart_Wing] * penguinScale * aniControlValueForFuckingIpad;

        }else{
            body_x = x - idle_x[kPenguinPart_Body] * penguinScale * aniControlValueForFuckingIpad;
            eye_x = x - idle_x[kPenguinPart_Eye] * penguinScale * aniControlValueForFuckingIpad;
            frontLeg_x = x - idle_x[kPenguinPart_FrontLeg] * penguinScale * aniControlValueForFuckingIpad;
            backLeg_x = x - idle_x[kPenguinPart_BackLeg] * penguinScale * aniControlValueForFuckingIpad;
            mouth_x = x - idle_x[kPenguinPart_Mouth] * penguinScale * aniControlValueForFuckingIpad;
            wing_x = x - idle_x[kPenguinPart_Wing] * penguinScale * aniControlValueForFuckingIpad;
            
            body_y = y + idle_y[kPenguinPart_Body] * penguinScale * aniControlValueForFuckingIpad;
            eye_y = y + idle_y[kPenguinPart_Eye] * penguinScale * aniControlValueForFuckingIpad;
            frontLeg_y = y + idle_y[kPenguinPart_FrontLeg] * penguinScale * aniControlValueForFuckingIpad;
            backLeg_y = y + idle_y[kPenguinPart_BackLeg] * penguinScale * aniControlValueForFuckingIpad;
            mouth_y = y + idle_y[kPenguinPart_Mouth] * penguinScale * aniControlValueForFuckingIpad;
            wing_y = y + idle_y[kPenguinPart_Wing] * penguinScale * aniControlValueForFuckingIpad;
        }
        
        [s_Body setRotation:idle_r[kPenguinPart_Body] * 180/M_PI];
        [s_Eye setRotation:idle_r[kPenguinPart_Eye] * 180/M_PI];
        [s_FrontLeg setRotation:idle_r[kPenguinPart_FrontLeg] * 180/M_PI];
        [s_BackLeg setRotation:idle_r[kPenguinPart_BackLeg] * 180/M_PI];
        [s_Mouth setRotation:idle_r[kPenguinPart_Mouth] * 180/M_PI];
        [s_Wing setRotation:idle_r[kPenguinPart_Wing] * 180/M_PI];
        
        if(isFacingRight){
            [s_Body setScaleX:idle_sx[kPenguinPart_Body]];
            [s_Eye setScaleX:idle_sx[kPenguinPart_Eye]];
            [s_FrontLeg setScaleX:idle_sx[kPenguinPart_FrontLeg]];
            [s_BackLeg setScaleX:idle_sx[kPenguinPart_BackLeg]];
            [s_Mouth setScaleX:idle_sx[kPenguinPart_Mouth]];
            [s_Wing setScaleX:idle_sx[kPenguinPart_Wing]];
        }else{
            [s_Body setScaleX:-idle_sx[kPenguinPart_Body]];
            [s_Eye setScaleX:-idle_sx[kPenguinPart_Eye]];
            [s_FrontLeg setScaleX:-idle_sx[kPenguinPart_FrontLeg]];
            [s_BackLeg setScaleX:-idle_sx[kPenguinPart_BackLeg]];
            [s_Mouth setScaleX:-idle_sx[kPenguinPart_Mouth]];
            [s_Wing setScaleX:-idle_sx[kPenguinPart_Wing]];
        }
        
        
        [s_Body setScaleY:idle_sy[kPenguinPart_Body]];
        [s_Eye setScaleY:idle_sy[kPenguinPart_Eye]];
        [s_FrontLeg setScaleY:idle_sy[kPenguinPart_FrontLeg]];
        [s_BackLeg setScaleY:idle_sy[kPenguinPart_BackLeg]];
        [s_Mouth setScaleY:idle_sy[kPenguinPart_Mouth]];
        [s_Wing setScaleY:idle_sy[kPenguinPart_Wing]];
        
        
        if(next_hasNext){
           // printf("AAAA\n");
            isGoingToNext = true;
        }
    }
    
    if(status == kPenguinAniStatus_Jumping){
        aniStep = 0;
        aniStep2 = 0;
        jumpingAniStep = 0;
    }
    
    if(status == kPenguinAniStatus_JumpingWithGravity){
        aniStep = 0;
        aniStep2 = 0;
        jumpingAniStep = 0;
    }

    
    if(_status == kPenguinAniStatus_Bombing){
        bombAniStep = 0;
    }
}

-(void) setJump:(int)_jump{
    if(status == kPenguinAniStatus_Jumping){
        return;
    }
    
    if(_jump == kPenguinJump_jumpTo1TurtleShell){
        jumpY_maxY = 25;
    }
    if(_jump == kPenguinJump_jumpTo2TurtleShell){
        jumpY_maxY = 50;
    }
    if(_jump == kPenguinJump_jumpToDYNAMICTurtleShell){
        jumpY_maxY = penguin_DynmaicJumpY;
    }
    
    //printf("setJump:%4.8f\n",jumpY_maxY);
    
    jumpXLengthInterval = (penguinJumpFinalX - x)/9;
    jumpY_angle = 0;
    jumpY_angleInterval = M_PI/9;

    
    jumpType = _jump;
    [self setStatus:kPenguinAniStatus_Jumping];
}

-(void) setJumpWithGravity{
    [self setStatus:kPenguinAniStatus_JumpingWithGravity];
}



-(void) manage{
    [self checkAndRunAni];
    
    if(isGoingToNext){
      //  printf("penguin is going to next\n");
        
        isFacingRight = next_isFacingRight;
        
        aniStep = 0;
        aniStep2 = 0;
        
        next_hasNext = false;
        
        if(delegate && isPlayingMiniGame){
            [delegate gotoNextJump];
        }
        
        
        [self setJump:next_jumpType];

        
        isGoingToNext = false;
    }
    
    /*if(currentChosenMiniGame == 4){
        externalOffsetX += (externalOffsetFinalX-externalOffsetX)/10;
        externalOffsetY += (externalOffsetFinalY-externalOffsetY)/10;
    }*/
    
    
    externalOffsetX2 += (externalOffsetFinalX-externalOffsetX2)/100;
    externalOffsetY2 += (externalOffsetFinalY-externalOffsetY2)/100;
    
    /*if(status == kPenguinAniStatus_Jumping){
        printf("PFUCK:%4.8f\n", externalOffsetX2);
    }*/
    
    if(currentChosenMiniGame == 10){
        if(!isFacingRight){
            [s_Body setPosition:ccp(body_x + externalOffsetX2+7, body_y + externalOffsetY2)];
            [s_Eye setPosition:ccp(eye_x + externalOffsetX2+7, eye_y + externalOffsetY2)];
            [s_FrontLeg setPosition:ccp(frontLeg_x + externalOffsetX2+7, frontLeg_y + externalOffsetY2)];
            [s_BackLeg setPosition:ccp(backLeg_x + externalOffsetX2+7, backLeg_y + externalOffsetY2)];
            [s_Mouth setPosition:ccp(mouth_x + externalOffsetX2+7, mouth_y + externalOffsetY2)];
            [s_Wing setPosition:ccp(wing_x + externalOffsetX2+7, wing_y + externalOffsetY2)];
        }else{
            [s_Body setPosition:ccp(body_x + externalOffsetX2, body_y + externalOffsetY2)];
            [s_Eye setPosition:ccp(eye_x + externalOffsetX2, eye_y + externalOffsetY2)];
            [s_FrontLeg setPosition:ccp(frontLeg_x + externalOffsetX2, frontLeg_y + externalOffsetY2)];
            [s_BackLeg setPosition:ccp(backLeg_x + externalOffsetX2, backLeg_y + externalOffsetY2)];
            [s_Mouth setPosition:ccp(mouth_x + externalOffsetX2, mouth_y + externalOffsetY2)];
            [s_Wing setPosition:ccp(wing_x + externalOffsetX2, wing_y + externalOffsetY2)];
        }
    }else if(currentChosenMiniGame == 11 || currentChosenMiniGame == 102){
        if(!isFacingRight){
            [s_Body setPosition:ccp(body_x + externalOffsetX2+12, body_y + externalOffsetY2)];
            [s_Eye setPosition:ccp(eye_x + externalOffsetX2+12, eye_y + externalOffsetY2)];
            [s_FrontLeg setPosition:ccp(frontLeg_x + externalOffsetX2+12, frontLeg_y + externalOffsetY2)];
            [s_BackLeg setPosition:ccp(backLeg_x + externalOffsetX2+12, backLeg_y + externalOffsetY2)];
            [s_Mouth setPosition:ccp(mouth_x + externalOffsetX2+12, mouth_y + externalOffsetY2)];
            [s_Wing setPosition:ccp(wing_x + externalOffsetX2+12, wing_y + externalOffsetY2)];
        }else{
            [s_Body setPosition:ccp(body_x + externalOffsetX2, body_y + externalOffsetY2)];
            [s_Eye setPosition:ccp(eye_x + externalOffsetX2, eye_y + externalOffsetY2)];
            [s_FrontLeg setPosition:ccp(frontLeg_x + externalOffsetX2, frontLeg_y + externalOffsetY2)];
            [s_BackLeg setPosition:ccp(backLeg_x + externalOffsetX2, backLeg_y + externalOffsetY2)];
            [s_Mouth setPosition:ccp(mouth_x + externalOffsetX2, mouth_y + externalOffsetY2)];
            [s_Wing setPosition:ccp(wing_x + externalOffsetX2, wing_y + externalOffsetY2)];
        }
    }else{
        [s_Body setPosition:ccp(body_x + externalOffsetX2, body_y + externalOffsetY2)];
        [s_Eye setPosition:ccp(eye_x + externalOffsetX2, eye_y + externalOffsetY2)];
        [s_FrontLeg setPosition:ccp(frontLeg_x + externalOffsetX2, frontLeg_y + externalOffsetY2)];
        [s_BackLeg setPosition:ccp(backLeg_x + externalOffsetX2, backLeg_y + externalOffsetY2)];
        [s_Mouth setPosition:ccp(mouth_x + externalOffsetX2, mouth_y + externalOffsetY2)];
        [s_Wing setPosition:ccp(wing_x + externalOffsetX2, wing_y + externalOffsetY2)];
    }
    
    
  //  printf("manabody_x:%4.8f body:%4.8f\n",eye_y, s_Body);
}

-(void) checkAndRunAni{
    if(isNotInGame){
        if(status == kPenguinAniStatus_Jumping){
            [self penguinJump];
        }
        return;
    }
    
    if(isPlayingMiniGame){
        if(status == kPenguinAniStatus_Jumping){
            [self penguinJump];
        }
        if(status == kPenguinAniStatus_JumpingWithGravity){
            [self penguinJumpWithGravity];
        }
        if(status == kPenguinAniStatus_Bombing){
            [self BombOffScreen];
        }

    }else{
        if(status == kPenguinAniStatus_Jumping){
            [self penguinJumpForMain];
        }
    }
}

-(void) setToBombing{
    x += jumpXLengthInterval * aniStep;
    y += jumpY_extraY;
    [self setStatus:kPenguinAniStatus_Bombing];
}

-(void) BombOffScreen{
    
    if(bombAniStep == 0){
        
        if(currentChosenMiniGame == 13){
            bomb_force = 15;
            
            bomb_x = 0;
            bomb_y = 0;
            
            bomb_vx = 14;
            bomb_vy = 20;
            bomb_oriVy = bomb_vy;
            bomb_ay = -1.35;
            
            turtleRotation = 0;
            
        }else{
            bomb_force = 10;
            
            bomb_x = 0;
            bomb_y = 0;
            
            bomb_vx = 7;
            bomb_vy = 14;
            bomb_oriVy = bomb_vy;
            bomb_ay = -0.85;
        }
       

        
        static int ranR;
        ranR = arc4random() % 100;
        
       // turtleRotation = 0;
        bomb_vr = bomb_force * 0.5;
        bomb_isRotatingClockrise = true;
        
        if(bombOutOffScreenDirection == kBombOutOffScreenDirection_Left_Penguin){
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
    
    if(isFacingRight){
        
        superFuxkAngleDiff = -turtleRotation * M_PI/180;
        superFuxkOriX = idle_x[kPenguinPart_Body] * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
        superFuxkOriY = idle_y[kPenguinPart_Body] * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
        body_x = x + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff) + bomb_x;
        body_y = y + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff) + bomb_y;
        
        superFuxkAngleDiff = -turtleRotation * M_PI/180;
        superFuxkOriX = idle_x[kPenguinPart_Eye] * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
        superFuxkOriY = idle_y[kPenguinPart_Eye] * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
        eye_x = x + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff) + bomb_x;
        eye_y = y + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff) + bomb_y;
        
        superFuxkAngleDiff = -turtleRotation * M_PI/180;
        superFuxkOriX = idle_x[kPenguinPart_FrontLeg] * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
        superFuxkOriY = idle_y[kPenguinPart_FrontLeg] * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
        frontLeg_x = x + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff) + bomb_x;
        frontLeg_y = y + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff) + bomb_y;
        
        superFuxkAngleDiff = -turtleRotation * M_PI/180;
        superFuxkOriX = idle_x[kPenguinPart_BackLeg] * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
        superFuxkOriY = idle_y[kPenguinPart_BackLeg] * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
        backLeg_x = x + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff) + bomb_x;
        backLeg_y = y + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff) + bomb_y;
        
        superFuxkAngleDiff = -turtleRotation * M_PI/180;
        superFuxkOriX = idle_x[kPenguinPart_Mouth] * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
        superFuxkOriY = idle_y[kPenguinPart_Mouth] * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
        mouth_x = x + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff) + bomb_x;
        mouth_y = y + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff) + bomb_y;
        
        superFuxkAngleDiff = -turtleRotation * M_PI/180;
        superFuxkOriX = idle_x[kPenguinPart_Wing] * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
        superFuxkOriY = idle_y[kPenguinPart_Wing] * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
        wing_x = x + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff) + bomb_x;
        wing_y = y + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff) + bomb_y;
        
    }else{
        
        superFuxkAngleDiff = -turtleRotation * M_PI/180;
        superFuxkOriX = -idle_x[kPenguinPart_Body] * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
        superFuxkOriY = idle_y[kPenguinPart_Body] * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
        body_x = x + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff) + bomb_x;
        body_y = y + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff) + bomb_y;
        
        superFuxkAngleDiff = -turtleRotation * M_PI/180;
        superFuxkOriX = -idle_x[kPenguinPart_Eye] * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
        superFuxkOriY = idle_y[kPenguinPart_Eye] * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
        eye_x = x + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff) + bomb_x;
        eye_y = y + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff) + bomb_y;
        
        superFuxkAngleDiff = -turtleRotation * M_PI/180;
        superFuxkOriX = -idle_x[kPenguinPart_FrontLeg] * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
        superFuxkOriY = idle_y[kPenguinPart_FrontLeg] * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
        frontLeg_x = x + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff) + bomb_x;
        frontLeg_y = y + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff) + bomb_y;
        
        superFuxkAngleDiff = -turtleRotation * M_PI/180;
        superFuxkOriX = -idle_x[kPenguinPart_BackLeg] * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
        superFuxkOriY = idle_y[kPenguinPart_BackLeg] * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
        backLeg_x = x + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff) + bomb_x;
        backLeg_y = y + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff) + bomb_y;
        
        superFuxkAngleDiff = -turtleRotation * M_PI/180;
        superFuxkOriX = -idle_x[kPenguinPart_Mouth] * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
        superFuxkOriY = idle_y[kPenguinPart_Mouth] * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
        mouth_x = x + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff) + bomb_x;
        mouth_y = y + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff) + bomb_y;
        
        superFuxkAngleDiff = -turtleRotation * M_PI/180;
        superFuxkOriX = -idle_x[kPenguinPart_Wing] * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
        superFuxkOriY = idle_y[kPenguinPart_Wing] * wholeTurtleScaleFromSocurce * aniControlValueForFuckingIpad;
        wing_x = x + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff) + bomb_x;
        wing_y = y + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff) + bomb_y;
        
    }
    
    

    
    [s_Body setRotation:idle_r[kPenguinPart_Body] * 180/M_PI + turtleRotation];
    [s_Eye setRotation:idle_r[kPenguinPart_Eye] * 180/M_PI + turtleRotation];
    [s_FrontLeg setRotation:idle_r[kPenguinPart_FrontLeg] * 180/M_PI + turtleRotation];
    [s_BackLeg setRotation:idle_r[kPenguinPart_BackLeg] * 180/M_PI + turtleRotation];
    [s_Mouth setRotation:idle_r[kPenguinPart_Mouth] * 180/M_PI + turtleRotation];
    [s_Wing setRotation:idle_r[kPenguinPart_Wing] * 180/M_PI + turtleRotation];
     
    bombAniStep++;
    

}

-(void) penguinJump{
    /*aniStep2++;
    if(aniStep2 % 2 == 0){
        return;
    }*/
    
    aniStep++;
    jumpingAniStep++;
   // printf("jump:%i\n",aniStep);
    
   
    if(isFacingRight){
        [s_Body setRotation:frameData[PenguinJumpAnim.spriteData[kPenguinPart_Body].firstFrame + aniStep].rotation * 180/M_PI];
        [s_Eye setRotation:frameData[PenguinJumpAnim.spriteData[kPenguinPart_Eye].firstFrame + aniStep].rotation * 180/M_PI];
        [s_FrontLeg setRotation:frameData[PenguinJumpAnim.spriteData[kPenguinPart_FrontLeg].firstFrame + aniStep].rotation * 180/M_PI];
        [s_BackLeg setRotation:frameData[PenguinJumpAnim.spriteData[kPenguinPart_BackLeg].firstFrame + aniStep].rotation * 180/M_PI];
        [s_Mouth setRotation:frameData[PenguinJumpAnim.spriteData[kPenguinPart_Mouth].firstFrame + aniStep].rotation * 180/M_PI];
        [s_Wing setRotation:frameData[PenguinJumpAnim.spriteData[kPenguinPart_Wing].firstFrame + aniStep].rotation * 180/M_PI];
    }else{
        [s_Body setRotation:-frameData[PenguinJumpAnim.spriteData[kPenguinPart_Body].firstFrame + aniStep].rotation * 180/M_PI];
        [s_Eye setRotation:-frameData[PenguinJumpAnim.spriteData[kPenguinPart_Eye].firstFrame + aniStep].rotation * 180/M_PI];
        [s_FrontLeg setRotation:-frameData[PenguinJumpAnim.spriteData[kPenguinPart_FrontLeg].firstFrame + aniStep].rotation * 180/M_PI];
        [s_BackLeg setRotation:-frameData[PenguinJumpAnim.spriteData[kPenguinPart_BackLeg].firstFrame + aniStep].rotation * 180/M_PI];
        [s_Mouth setRotation:-frameData[PenguinJumpAnim.spriteData[kPenguinPart_Mouth].firstFrame + aniStep].rotation * 180/M_PI];
        [s_Wing setRotation:-frameData[PenguinJumpAnim.spriteData[kPenguinPart_Wing].firstFrame + aniStep].rotation * 180/M_PI];
    }
    
    
    if(isFacingRight){
        [s_Body setScaleX:frameData[PenguinJumpAnim.spriteData[kPenguinPart_Body].firstFrame + aniStep].scaleX * wholePenguinScaleFromSocurce*2];
        [s_Eye setScaleX:frameData[PenguinJumpAnim.spriteData[kPenguinPart_Body].firstFrame + aniStep].scaleX];
        [s_FrontLeg setScaleX:frameData[PenguinJumpAnim.spriteData[kPenguinPart_Body].firstFrame + aniStep].scaleX];
        [s_BackLeg setScaleX:frameData[PenguinJumpAnim.spriteData[kPenguinPart_Body].firstFrame + aniStep].scaleX];
        [s_Mouth setScaleX:frameData[PenguinJumpAnim.spriteData[kPenguinPart_Body].firstFrame + aniStep].scaleX];
        [s_Wing setScaleX:frameData[PenguinJumpAnim.spriteData[kPenguinPart_Body].firstFrame + aniStep].scaleX];
    }else{
        [s_Body setScaleX:-frameData[PenguinJumpAnim.spriteData[kPenguinPart_Body].firstFrame + aniStep].scaleX * wholePenguinScaleFromSocurce*2];
        [s_Eye setScaleX:-frameData[PenguinJumpAnim.spriteData[kPenguinPart_Body].firstFrame + aniStep].scaleX];
        [s_FrontLeg setScaleX:-frameData[PenguinJumpAnim.spriteData[kPenguinPart_Body].firstFrame + aniStep].scaleX];
        [s_BackLeg setScaleX:-frameData[PenguinJumpAnim.spriteData[kPenguinPart_Body].firstFrame + aniStep].scaleX];
        [s_Mouth setScaleX:-frameData[PenguinJumpAnim.spriteData[kPenguinPart_Body].firstFrame + aniStep].scaleX];
        [s_Wing setScaleX:-frameData[PenguinJumpAnim.spriteData[kPenguinPart_Body].firstFrame + aniStep].scaleX];
    }
    
    
    [s_Body setScaleY:frameData[PenguinJumpAnim.spriteData[kPenguinPart_Body].firstFrame + aniStep].scaleY * wholePenguinScaleFromSocurce*2];
    [s_Eye setScaleY:frameData[PenguinJumpAnim.spriteData[kPenguinPart_Body].firstFrame + aniStep].scaleY];
    [s_FrontLeg setScaleY:frameData[PenguinJumpAnim.spriteData[kPenguinPart_Body].firstFrame + aniStep].scaleY];
    [s_BackLeg setScaleY:frameData[PenguinJumpAnim.spriteData[kPenguinPart_Body].firstFrame + aniStep].scaleY];
    [s_Mouth setScaleY:frameData[PenguinJumpAnim.spriteData[kPenguinPart_Body].firstFrame + aniStep].scaleY];
    [s_Wing setScaleY:frameData[PenguinJumpAnim.spriteData[kPenguinPart_Body].firstFrame + aniStep].scaleY];
    
//    [s_Body setScale:wholePenguinScaleFromSocurce];
    
    if(jumpType == kPenguinJump_jumpTo1TurtleShell){
        if(aniStep == 1){
           // jumpXLengthInterval = (penguinJumpFinalX - x)/35;
            
           // jumpY_maxY = 20;
          //  jumpY_angle = 0;
           // jumpY_angleInterval = M_PI/35;

        }
    }
    
    //jumpY_vy += jumpY_ay;
    
    if(aniStep >= 9){
     //   printf("aniStep 35\n");
       // status = kPenguinAniStatus_Idle;
        //printf("Fx:%4.8f penguinJumpFinalX:%4.8f %4.8f\n",x,penguinJumpFinalX, penguinJumpFinalY);
        
        if(delegate){
            [delegate tapTurtle];
        }
        
        if(currentChosenMiniGame != 11 && currentChosenMiniGame != 102){
            //printf("ABCCCCCCCCCCCCCCCC\n");
            [self setX:penguinJumpFinalX];
            [self setY:penguinJumpFinalY];
        }
        
        [self setStatus:kPenguinAniStatus_Idle];
        
        aniStep = 0;
        jumpY_extraY = 0;
        
    }else{
        
        jumpY_angle = jumpY_angleInterval * aniStep;
        jumpY_extraY = jumpY_maxY * sin(jumpY_angle);
       // printf("jumpY_maxYjumpY_maxY:%4.8f\n",jumpY_maxY);
        
        if(isFacingRight){
            body_x = x + frameData[PenguinJumpAnim.spriteData[kPenguinPart_Body].firstFrame + aniStep].x * penguinScale * aniControlValueForFuckingIpad + jumpXLengthInterval * aniStep;
            eye_x = x + frameData[PenguinJumpAnim.spriteData[kPenguinPart_Eye].firstFrame + aniStep].x * penguinScale * aniControlValueForFuckingIpad + jumpXLengthInterval * aniStep;
            frontLeg_x = x + frameData[PenguinJumpAnim.spriteData[kPenguinPart_FrontLeg].firstFrame + aniStep].x * penguinScale * aniControlValueForFuckingIpad + jumpXLengthInterval * aniStep;
            backLeg_x = x + frameData[PenguinJumpAnim.spriteData[kPenguinPart_BackLeg].firstFrame + aniStep].x * penguinScale * aniControlValueForFuckingIpad + jumpXLengthInterval * aniStep;
            mouth_x = x + frameData[PenguinJumpAnim.spriteData[kPenguinPart_Mouth].firstFrame + aniStep].x * penguinScale * aniControlValueForFuckingIpad + jumpXLengthInterval * aniStep;
            wing_x = x + frameData[PenguinJumpAnim.spriteData[kPenguinPart_Wing].firstFrame + aniStep].x * penguinScale * aniControlValueForFuckingIpad + jumpXLengthInterval * aniStep;
            
            body_y = y + frameData[PenguinJumpAnim.spriteData[kPenguinPart_Body].firstFrame + aniStep].y * penguinScale * aniControlValueForFuckingIpad + jumpY_extraY;
            eye_y = y + frameData[PenguinJumpAnim.spriteData[kPenguinPart_Eye].firstFrame + aniStep].y * penguinScale * aniControlValueForFuckingIpad + jumpY_extraY;
            frontLeg_y = y + frameData[PenguinJumpAnim.spriteData[kPenguinPart_FrontLeg].firstFrame + aniStep].y * penguinScale * aniControlValueForFuckingIpad + jumpY_extraY;
            backLeg_y = y + frameData[PenguinJumpAnim.spriteData[kPenguinPart_BackLeg].firstFrame + aniStep].y * penguinScale * aniControlValueForFuckingIpad + jumpY_extraY;
            mouth_y = y + frameData[PenguinJumpAnim.spriteData[kPenguinPart_Mouth].firstFrame + aniStep].y * penguinScale * aniControlValueForFuckingIpad + jumpY_extraY;
            wing_y = y + frameData[PenguinJumpAnim.spriteData[kPenguinPart_Wing].firstFrame + aniStep].y * penguinScale * aniControlValueForFuckingIpad + jumpY_extraY;
            
        }else{
            body_x = x - frameData[PenguinJumpAnim.spriteData[kPenguinPart_Body].firstFrame + aniStep].x * penguinScale * aniControlValueForFuckingIpad + jumpXLengthInterval * aniStep;
            eye_x = x - frameData[PenguinJumpAnim.spriteData[kPenguinPart_Eye].firstFrame + aniStep].x * penguinScale * aniControlValueForFuckingIpad + jumpXLengthInterval * aniStep;
            frontLeg_x = x - frameData[PenguinJumpAnim.spriteData[kPenguinPart_FrontLeg].firstFrame + aniStep].x * penguinScale * aniControlValueForFuckingIpad + jumpXLengthInterval * aniStep;
            backLeg_x = x - frameData[PenguinJumpAnim.spriteData[kPenguinPart_BackLeg].firstFrame + aniStep].x * penguinScale * aniControlValueForFuckingIpad + jumpXLengthInterval * aniStep;
            mouth_x = x - frameData[PenguinJumpAnim.spriteData[kPenguinPart_Mouth].firstFrame + aniStep].x * penguinScale * aniControlValueForFuckingIpad + jumpXLengthInterval * aniStep;
            wing_x = x - frameData[PenguinJumpAnim.spriteData[kPenguinPart_Wing].firstFrame + aniStep].x * penguinScale * aniControlValueForFuckingIpad + jumpXLengthInterval * aniStep;
            
            body_y = y + frameData[PenguinJumpAnim.spriteData[kPenguinPart_Body].firstFrame + aniStep].y * penguinScale * aniControlValueForFuckingIpad + jumpY_extraY;
            eye_y = y + frameData[PenguinJumpAnim.spriteData[kPenguinPart_Eye].firstFrame + aniStep].y * penguinScale * aniControlValueForFuckingIpad + jumpY_extraY;
            frontLeg_y = y + frameData[PenguinJumpAnim.spriteData[kPenguinPart_FrontLeg].firstFrame + aniStep].y * penguinScale * aniControlValueForFuckingIpad + jumpY_extraY;
            backLeg_y = y + frameData[PenguinJumpAnim.spriteData[kPenguinPart_BackLeg].firstFrame + aniStep].y * penguinScale * aniControlValueForFuckingIpad + jumpY_extraY;
            mouth_y = y + frameData[PenguinJumpAnim.spriteData[kPenguinPart_Mouth].firstFrame + aniStep].y * penguinScale * aniControlValueForFuckingIpad + jumpY_extraY;
            wing_y = y + frameData[PenguinJumpAnim.spriteData[kPenguinPart_Wing].firstFrame + aniStep].y * penguinScale * aniControlValueForFuckingIpad + jumpY_extraY;
        }
        
        //printf("bodyx:%4.8f boxyY:%4.8f\n",body_x, body_y);
    }
    
    
    
    if(temp_isFast){
        aniStep+=2;
        
        if(aniStep >= 8){
            aniStep = 8;
        }
    }
    
}

-(void) penguinJumpWithGravity{

    aniStep2++;
    
   // if(aniStep2 % 2 == 1){
        aniStep++;
        jumpingAniStep++;
  //  }
    
   
    //printf("jump:%i\n",aniStep);
    
    if(aniStep >= 8){
        aniStep = 8;
    }
    
    
    if(isFacingRight){
        [s_Body setRotation:frameData[PenguinJumpAnim.spriteData[kPenguinPart_Body].firstFrame + aniStep].rotation * 180/M_PI];
        [s_Eye setRotation:frameData[PenguinJumpAnim.spriteData[kPenguinPart_Eye].firstFrame + aniStep].rotation * 180/M_PI];
        [s_FrontLeg setRotation:frameData[PenguinJumpAnim.spriteData[kPenguinPart_FrontLeg].firstFrame + aniStep].rotation * 180/M_PI];
        [s_BackLeg setRotation:frameData[PenguinJumpAnim.spriteData[kPenguinPart_BackLeg].firstFrame + aniStep].rotation * 180/M_PI];
        [s_Mouth setRotation:frameData[PenguinJumpAnim.spriteData[kPenguinPart_Mouth].firstFrame + aniStep].rotation * 180/M_PI];
        [s_Wing setRotation:frameData[PenguinJumpAnim.spriteData[kPenguinPart_Wing].firstFrame + aniStep].rotation * 180/M_PI];
    }else{
        [s_Body setRotation:-frameData[PenguinJumpAnim.spriteData[kPenguinPart_Body].firstFrame + aniStep].rotation * 180/M_PI];
        [s_Eye setRotation:-frameData[PenguinJumpAnim.spriteData[kPenguinPart_Eye].firstFrame + aniStep].rotation * 180/M_PI];
        [s_FrontLeg setRotation:-frameData[PenguinJumpAnim.spriteData[kPenguinPart_FrontLeg].firstFrame + aniStep].rotation * 180/M_PI];
        [s_BackLeg setRotation:-frameData[PenguinJumpAnim.spriteData[kPenguinPart_BackLeg].firstFrame + aniStep].rotation * 180/M_PI];
        [s_Mouth setRotation:-frameData[PenguinJumpAnim.spriteData[kPenguinPart_Mouth].firstFrame + aniStep].rotation * 180/M_PI];
        [s_Wing setRotation:-frameData[PenguinJumpAnim.spriteData[kPenguinPart_Wing].firstFrame + aniStep].rotation * 180/M_PI];
    }
    
    
    if(isFacingRight){
        [s_Body setScaleX:frameData[PenguinJumpAnim.spriteData[kPenguinPart_Body].firstFrame + aniStep].scaleX];
        [s_Eye setScaleX:frameData[PenguinJumpAnim.spriteData[kPenguinPart_Body].firstFrame + aniStep].scaleX];
        [s_FrontLeg setScaleX:frameData[PenguinJumpAnim.spriteData[kPenguinPart_Body].firstFrame + aniStep].scaleX];
        [s_BackLeg setScaleX:frameData[PenguinJumpAnim.spriteData[kPenguinPart_Body].firstFrame + aniStep].scaleX];
        [s_Mouth setScaleX:frameData[PenguinJumpAnim.spriteData[kPenguinPart_Body].firstFrame + aniStep].scaleX];
        [s_Wing setScaleX:frameData[PenguinJumpAnim.spriteData[kPenguinPart_Body].firstFrame + aniStep].scaleX];
    }else{
        [s_Body setScaleX:-frameData[PenguinJumpAnim.spriteData[kPenguinPart_Body].firstFrame + aniStep].scaleX];
        [s_Eye setScaleX:-frameData[PenguinJumpAnim.spriteData[kPenguinPart_Body].firstFrame + aniStep].scaleX];
        [s_FrontLeg setScaleX:-frameData[PenguinJumpAnim.spriteData[kPenguinPart_Body].firstFrame + aniStep].scaleX];
        [s_BackLeg setScaleX:-frameData[PenguinJumpAnim.spriteData[kPenguinPart_Body].firstFrame + aniStep].scaleX];
        [s_Mouth setScaleX:-frameData[PenguinJumpAnim.spriteData[kPenguinPart_Body].firstFrame + aniStep].scaleX];
        [s_Wing setScaleX:-frameData[PenguinJumpAnim.spriteData[kPenguinPart_Body].firstFrame + aniStep].scaleX];
    }
    
    
    [s_Body setScaleY:frameData[PenguinJumpAnim.spriteData[kPenguinPart_Body].firstFrame + aniStep].scaleY];
    [s_Eye setScaleY:frameData[PenguinJumpAnim.spriteData[kPenguinPart_Body].firstFrame + aniStep].scaleY];
    [s_FrontLeg setScaleY:frameData[PenguinJumpAnim.spriteData[kPenguinPart_Body].firstFrame + aniStep].scaleY];
    [s_BackLeg setScaleY:frameData[PenguinJumpAnim.spriteData[kPenguinPart_Body].firstFrame + aniStep].scaleY];
    [s_Mouth setScaleY:frameData[PenguinJumpAnim.spriteData[kPenguinPart_Body].firstFrame + aniStep].scaleY];
    [s_Wing setScaleY:frameData[PenguinJumpAnim.spriteData[kPenguinPart_Body].firstFrame + aniStep].scaleY];
    

    if(aniStep >= 9){
 
              
    }else{
        
        jumpY_angle = 0;
        jumpY_extraY = 0;
        
        if(isFacingRight){
            body_x = x + frameData[PenguinJumpAnim.spriteData[kPenguinPart_Body].firstFrame + aniStep].x * penguinScale * aniControlValueForFuckingIpad + jumpXLengthInterval * aniStep;
            eye_x = x + frameData[PenguinJumpAnim.spriteData[kPenguinPart_Eye].firstFrame + aniStep].x * penguinScale * aniControlValueForFuckingIpad + jumpXLengthInterval * aniStep;
            frontLeg_x = x + frameData[PenguinJumpAnim.spriteData[kPenguinPart_FrontLeg].firstFrame + aniStep].x * penguinScale * aniControlValueForFuckingIpad + jumpXLengthInterval * aniStep;
            backLeg_x = x + frameData[PenguinJumpAnim.spriteData[kPenguinPart_BackLeg].firstFrame + aniStep].x * penguinScale * aniControlValueForFuckingIpad + jumpXLengthInterval * aniStep;
            mouth_x = x + frameData[PenguinJumpAnim.spriteData[kPenguinPart_Mouth].firstFrame + aniStep].x * penguinScale * aniControlValueForFuckingIpad + jumpXLengthInterval * aniStep;
            wing_x = x + frameData[PenguinJumpAnim.spriteData[kPenguinPart_Wing].firstFrame + aniStep].x * penguinScale * aniControlValueForFuckingIpad + jumpXLengthInterval * aniStep;
            
            body_y = y + frameData[PenguinJumpAnim.spriteData[kPenguinPart_Body].firstFrame + aniStep].y * penguinScale * aniControlValueForFuckingIpad + jumpY_extraY;
            eye_y = y + frameData[PenguinJumpAnim.spriteData[kPenguinPart_Eye].firstFrame + aniStep].y * penguinScale * aniControlValueForFuckingIpad + jumpY_extraY;
            frontLeg_y = y + frameData[PenguinJumpAnim.spriteData[kPenguinPart_FrontLeg].firstFrame + aniStep].y * penguinScale * aniControlValueForFuckingIpad + jumpY_extraY;
            backLeg_y = y + frameData[PenguinJumpAnim.spriteData[kPenguinPart_BackLeg].firstFrame + aniStep].y * penguinScale * aniControlValueForFuckingIpad + jumpY_extraY;
            mouth_y = y + frameData[PenguinJumpAnim.spriteData[kPenguinPart_Mouth].firstFrame + aniStep].y * penguinScale * aniControlValueForFuckingIpad + jumpY_extraY;
            wing_y = y + frameData[PenguinJumpAnim.spriteData[kPenguinPart_Wing].firstFrame + aniStep].y * penguinScale * aniControlValueForFuckingIpad + jumpY_extraY;
            
        }else{
            body_x = x - frameData[PenguinJumpAnim.spriteData[kPenguinPart_Body].firstFrame + aniStep].x * penguinScale * aniControlValueForFuckingIpad + jumpXLengthInterval * aniStep;
            eye_x = x - frameData[PenguinJumpAnim.spriteData[kPenguinPart_Eye].firstFrame + aniStep].x * penguinScale * aniControlValueForFuckingIpad + jumpXLengthInterval * aniStep;
            frontLeg_x = x - frameData[PenguinJumpAnim.spriteData[kPenguinPart_FrontLeg].firstFrame + aniStep].x * penguinScale * aniControlValueForFuckingIpad + jumpXLengthInterval * aniStep;
            backLeg_x = x - frameData[PenguinJumpAnim.spriteData[kPenguinPart_BackLeg].firstFrame + aniStep].x * penguinScale * aniControlValueForFuckingIpad + jumpXLengthInterval * aniStep;
            mouth_x = x - frameData[PenguinJumpAnim.spriteData[kPenguinPart_Mouth].firstFrame + aniStep].x * penguinScale * aniControlValueForFuckingIpad + jumpXLengthInterval * aniStep;
            wing_x = x - frameData[PenguinJumpAnim.spriteData[kPenguinPart_Wing].firstFrame + aniStep].x * penguinScale * aniControlValueForFuckingIpad + jumpXLengthInterval * aniStep;
            
            body_y = y + frameData[PenguinJumpAnim.spriteData[kPenguinPart_Body].firstFrame + aniStep].y * penguinScale * aniControlValueForFuckingIpad + jumpY_extraY;
            eye_y = y + frameData[PenguinJumpAnim.spriteData[kPenguinPart_Eye].firstFrame + aniStep].y * penguinScale * aniControlValueForFuckingIpad + jumpY_extraY;
            frontLeg_y = y + frameData[PenguinJumpAnim.spriteData[kPenguinPart_FrontLeg].firstFrame + aniStep].y * penguinScale * aniControlValueForFuckingIpad + jumpY_extraY;
            backLeg_y = y + frameData[PenguinJumpAnim.spriteData[kPenguinPart_BackLeg].firstFrame + aniStep].y * penguinScale * aniControlValueForFuckingIpad + jumpY_extraY;
            mouth_y = y + frameData[PenguinJumpAnim.spriteData[kPenguinPart_Mouth].firstFrame + aniStep].y * penguinScale * aniControlValueForFuckingIpad + jumpY_extraY;
            wing_y = y + frameData[PenguinJumpAnim.spriteData[kPenguinPart_Wing].firstFrame + aniStep].y * penguinScale * aniControlValueForFuckingIpad + jumpY_extraY;
        }
        
    }
    
}

-(void) penguinJumpForMain{
    aniStep2++;
     if(aniStep2 % 2 == 1){
         aniStep++;
         jumpingAniStep++;
     }
    
    //aniStep++;
   // jumpingAniStep++;
    
    
    if(isFacingRight){
        [s_Body setRotation:frameData[PenguinJumpAnim.spriteData[kPenguinPart_Body].firstFrame + aniStep].rotation * 180/M_PI];
        [s_Eye setRotation:frameData[PenguinJumpAnim.spriteData[kPenguinPart_Eye].firstFrame + aniStep].rotation * 180/M_PI];
        [s_FrontLeg setRotation:frameData[PenguinJumpAnim.spriteData[kPenguinPart_FrontLeg].firstFrame + aniStep].rotation * 180/M_PI];
        [s_BackLeg setRotation:frameData[PenguinJumpAnim.spriteData[kPenguinPart_BackLeg].firstFrame + aniStep].rotation * 180/M_PI];
        [s_Mouth setRotation:frameData[PenguinJumpAnim.spriteData[kPenguinPart_Mouth].firstFrame + aniStep].rotation * 180/M_PI];
        [s_Wing setRotation:frameData[PenguinJumpAnim.spriteData[kPenguinPart_Wing].firstFrame + aniStep].rotation * 180/M_PI];
    }else{
        [s_Body setRotation:-frameData[PenguinJumpAnim.spriteData[kPenguinPart_Body].firstFrame + aniStep].rotation * 180/M_PI];
        [s_Eye setRotation:-frameData[PenguinJumpAnim.spriteData[kPenguinPart_Eye].firstFrame + aniStep].rotation * 180/M_PI];
        [s_FrontLeg setRotation:-frameData[PenguinJumpAnim.spriteData[kPenguinPart_FrontLeg].firstFrame + aniStep].rotation * 180/M_PI];
        [s_BackLeg setRotation:-frameData[PenguinJumpAnim.spriteData[kPenguinPart_BackLeg].firstFrame + aniStep].rotation * 180/M_PI];
        [s_Mouth setRotation:-frameData[PenguinJumpAnim.spriteData[kPenguinPart_Mouth].firstFrame + aniStep].rotation * 180/M_PI];
        [s_Wing setRotation:-frameData[PenguinJumpAnim.spriteData[kPenguinPart_Wing].firstFrame + aniStep].rotation * 180/M_PI];
    }
    
    
    if(isFacingRight){
        [s_Body setScaleX:frameData[PenguinJumpAnim.spriteData[kPenguinPart_Body].firstFrame + aniStep].scaleX];
        [s_Eye setScaleX:frameData[PenguinJumpAnim.spriteData[kPenguinPart_Body].firstFrame + aniStep].scaleX];
        [s_FrontLeg setScaleX:frameData[PenguinJumpAnim.spriteData[kPenguinPart_Body].firstFrame + aniStep].scaleX];
        [s_BackLeg setScaleX:frameData[PenguinJumpAnim.spriteData[kPenguinPart_Body].firstFrame + aniStep].scaleX];
        [s_Mouth setScaleX:frameData[PenguinJumpAnim.spriteData[kPenguinPart_Body].firstFrame + aniStep].scaleX];
        [s_Wing setScaleX:frameData[PenguinJumpAnim.spriteData[kPenguinPart_Body].firstFrame + aniStep].scaleX];
    }else{
        [s_Body setScaleX:-frameData[PenguinJumpAnim.spriteData[kPenguinPart_Body].firstFrame + aniStep].scaleX];
        [s_Eye setScaleX:-frameData[PenguinJumpAnim.spriteData[kPenguinPart_Body].firstFrame + aniStep].scaleX];
        [s_FrontLeg setScaleX:-frameData[PenguinJumpAnim.spriteData[kPenguinPart_Body].firstFrame + aniStep].scaleX];
        [s_BackLeg setScaleX:-frameData[PenguinJumpAnim.spriteData[kPenguinPart_Body].firstFrame + aniStep].scaleX];
        [s_Mouth setScaleX:-frameData[PenguinJumpAnim.spriteData[kPenguinPart_Body].firstFrame + aniStep].scaleX];
        [s_Wing setScaleX:-frameData[PenguinJumpAnim.spriteData[kPenguinPart_Body].firstFrame + aniStep].scaleX];
    }
    
    
    [s_Body setScaleY:frameData[PenguinJumpAnim.spriteData[kPenguinPart_Body].firstFrame + aniStep].scaleY];
    [s_Eye setScaleY:frameData[PenguinJumpAnim.spriteData[kPenguinPart_Body].firstFrame + aniStep].scaleY];
    [s_FrontLeg setScaleY:frameData[PenguinJumpAnim.spriteData[kPenguinPart_Body].firstFrame + aniStep].scaleY];
    [s_BackLeg setScaleY:frameData[PenguinJumpAnim.spriteData[kPenguinPart_Body].firstFrame + aniStep].scaleY];
    [s_Mouth setScaleY:frameData[PenguinJumpAnim.spriteData[kPenguinPart_Body].firstFrame + aniStep].scaleY];
    [s_Wing setScaleY:frameData[PenguinJumpAnim.spriteData[kPenguinPart_Body].firstFrame + aniStep].scaleY];
    

    
    //jumpY_vy += jumpY_ay;
    
    if(aniStep >= 9){
        
        [self setStatus:kPenguinAniStatus_Idle];
        
        aniStep = 0;
        jumpY_extraY = 0;
        
    }else{
        
        jumpY_angle = jumpY_angleInterval * aniStep;
        jumpY_extraY = jumpY_maxY * sin(jumpY_angle);
        // printf("jumpY_maxYjumpY_maxY:%4.8f\n",jumpY_maxY);
        
        if(isFacingRight){
            body_x = x + frameData[PenguinJumpAnim.spriteData[kPenguinPart_Body].firstFrame + aniStep].x * penguinScale * aniControlValueForFuckingIpad + jumpXLengthInterval * aniStep;
            eye_x = x + frameData[PenguinJumpAnim.spriteData[kPenguinPart_Eye].firstFrame + aniStep].x * penguinScale * aniControlValueForFuckingIpad + jumpXLengthInterval * aniStep;
            frontLeg_x = x + frameData[PenguinJumpAnim.spriteData[kPenguinPart_FrontLeg].firstFrame + aniStep].x * penguinScale * aniControlValueForFuckingIpad + jumpXLengthInterval * aniStep;
            backLeg_x = x + frameData[PenguinJumpAnim.spriteData[kPenguinPart_BackLeg].firstFrame + aniStep].x * penguinScale * aniControlValueForFuckingIpad + jumpXLengthInterval * aniStep;
            mouth_x = x + frameData[PenguinJumpAnim.spriteData[kPenguinPart_Mouth].firstFrame + aniStep].x * penguinScale * aniControlValueForFuckingIpad + jumpXLengthInterval * aniStep;
            wing_x = x + frameData[PenguinJumpAnim.spriteData[kPenguinPart_Wing].firstFrame + aniStep].x * penguinScale * aniControlValueForFuckingIpad + jumpXLengthInterval * aniStep;
            
            body_y = y + frameData[PenguinJumpAnim.spriteData[kPenguinPart_Body].firstFrame + aniStep].y * penguinScale * aniControlValueForFuckingIpad + jumpY_extraY;
            eye_y = y + frameData[PenguinJumpAnim.spriteData[kPenguinPart_Eye].firstFrame + aniStep].y * penguinScale * aniControlValueForFuckingIpad + jumpY_extraY;
            frontLeg_y = y + frameData[PenguinJumpAnim.spriteData[kPenguinPart_FrontLeg].firstFrame + aniStep].y * penguinScale * aniControlValueForFuckingIpad + jumpY_extraY;
            backLeg_y = y + frameData[PenguinJumpAnim.spriteData[kPenguinPart_BackLeg].firstFrame + aniStep].y * penguinScale * aniControlValueForFuckingIpad + jumpY_extraY;
            mouth_y = y + frameData[PenguinJumpAnim.spriteData[kPenguinPart_Mouth].firstFrame + aniStep].y * penguinScale * aniControlValueForFuckingIpad + jumpY_extraY;
            wing_y = y + frameData[PenguinJumpAnim.spriteData[kPenguinPart_Wing].firstFrame + aniStep].y * penguinScale * aniControlValueForFuckingIpad + jumpY_extraY;
            
        }else{
            body_x = x - frameData[PenguinJumpAnim.spriteData[kPenguinPart_Body].firstFrame + aniStep].x * penguinScale * aniControlValueForFuckingIpad + jumpXLengthInterval * aniStep;
            eye_x = x - frameData[PenguinJumpAnim.spriteData[kPenguinPart_Eye].firstFrame + aniStep].x * penguinScale * aniControlValueForFuckingIpad + jumpXLengthInterval * aniStep;
            frontLeg_x = x - frameData[PenguinJumpAnim.spriteData[kPenguinPart_FrontLeg].firstFrame + aniStep].x * penguinScale * aniControlValueForFuckingIpad + jumpXLengthInterval * aniStep;
            backLeg_x = x - frameData[PenguinJumpAnim.spriteData[kPenguinPart_BackLeg].firstFrame + aniStep].x * penguinScale * aniControlValueForFuckingIpad + jumpXLengthInterval * aniStep;
            mouth_x = x - frameData[PenguinJumpAnim.spriteData[kPenguinPart_Mouth].firstFrame + aniStep].x * penguinScale * aniControlValueForFuckingIpad + jumpXLengthInterval * aniStep;
            wing_x = x - frameData[PenguinJumpAnim.spriteData[kPenguinPart_Wing].firstFrame + aniStep].x * penguinScale * aniControlValueForFuckingIpad + jumpXLengthInterval * aniStep;
            
            body_y = y + frameData[PenguinJumpAnim.spriteData[kPenguinPart_Body].firstFrame + aniStep].y * penguinScale * aniControlValueForFuckingIpad + jumpY_extraY;
            eye_y = y + frameData[PenguinJumpAnim.spriteData[kPenguinPart_Eye].firstFrame + aniStep].y * penguinScale * aniControlValueForFuckingIpad + jumpY_extraY;
            frontLeg_y = y + frameData[PenguinJumpAnim.spriteData[kPenguinPart_FrontLeg].firstFrame + aniStep].y * penguinScale * aniControlValueForFuckingIpad + jumpY_extraY;
            backLeg_y = y + frameData[PenguinJumpAnim.spriteData[kPenguinPart_BackLeg].firstFrame + aniStep].y * penguinScale * aniControlValueForFuckingIpad + jumpY_extraY;
            mouth_y = y + frameData[PenguinJumpAnim.spriteData[kPenguinPart_Mouth].firstFrame + aniStep].y * penguinScale * aniControlValueForFuckingIpad + jumpY_extraY;
            wing_y = y + frameData[PenguinJumpAnim.spriteData[kPenguinPart_Wing].firstFrame + aniStep].y * penguinScale * aniControlValueForFuckingIpad + jumpY_extraY;
        }
        
    }
    
    
    
    if(temp_isFast){
        aniStep+=2;
        
        if(aniStep >= 8){
            aniStep = 8;
        }
    }
    
}

-(void) tempSetFast:(bool)_isFast{
    temp_isFast = false;
}

- (void) dealloc
{
	printf("penguin Dealloc\n");
	[super dealloc];
}

-(bool) setNext:(int)_jumpType isFacingRight:(bool)_isFacingRight{
    
    //printf("setNext in penguin:%i\n",aniStep);
    
    if(aniStep < 3){
        return false;
    }
    
    printf("setNext\n");
    
   // aniStep = 0;
   // aniStep2 = 0;
    
    next_jumpType = _jumpType;
    next_isFacingRight = _isFacingRight;
    next_hasNext = true;
    
    return true;
}

-(void) setOutside{
    [s_Body setPosition:ccp(10000, body_y)];
    [s_Eye setPosition:ccp(10000, eye_y)];
    [s_FrontLeg setPosition:ccp(10000, frontLeg_y)];
    [s_BackLeg setPosition:ccp(10000, backLeg_y)];
    [s_Mouth setPosition:ccp(10000, mouth_y)];
    [s_Wing setPosition:ccp(10000, wing_y)];
}



-(void) SETMAINISCOLLDING:(bool)_isColliding{
    
    MAIN_ISCOLLIDING = _isColliding;
    
    
    MAIN_COLLIDE_EYE_X = 0;
    MAIN_COLLIDE_EYE_Y = 0;
    MAIN_COLLIDE_WING_X = 0;
    MAIN_COLLIDE_WING_Y = 0;
    MAIN_COLLIDE_EYE_R = 0;
    MAIN_COLLIDE_WING_R = 0;
    
    MAIN_COLLIDE_EYE_VX = 1.5;
    MAIN_COLLIDE_EYE_VY = 2.0;
    MAIN_COLLIDE_WING_VX = 1.0;
    MAIN_COLLIDE_WING_VY = 1.5;
    MAIN_COLLIDE_EYE_VR = objVInCollision*1.5;;
    MAIN_COLLIDE_WING_VR = objVInCollision*1.25;;
    
}

-(void) MAINMANAGE{
   // printf("MAINMANAGE:%i\n", idNumber);
    
    superFuxkAngleDiff = -turtleRotation * M_PI/180;
    superFuxkOriX = -idle_x[kPenguinPart_Body] * penguinScale * aniControlValueForFuckingIpad;
    superFuxkOriY = idle_y[kPenguinPart_Body] * penguinScale * aniControlValueForFuckingIpad;
    body_x = x + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
    body_y = y + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
    
    static float useThisEyeX;
    static float useThisEyeY;
    static float useThisEyeR;
    static float useThisWingX;
    static float useThisWingY;
    static float useThisWingR;
    
    if(!MAIN_ISCOLLIDING){
        useThisEyeX = x;
        useThisEyeY = y;
        useThisWingX = x;
        useThisWingY = y;
        useThisEyeR = turtleRotation;
        useThisWingR = turtleRotation;
        
        
    }else{
        useThisEyeX = x + MAIN_COLLIDE_EYE_X;
        useThisEyeY = y + MAIN_COLLIDE_EYE_Y;
        useThisEyeR = turtleRotation + MAIN_COLLIDE_EYE_R;
        
        useThisWingX = x + MAIN_COLLIDE_WING_X;
        useThisWingY = y + MAIN_COLLIDE_WING_Y;
        useThisWingR = turtleRotation + MAIN_COLLIDE_WING_R;

        //printf("MAIN_COLLIDE_EYE_X:%4.8f\n",MAIN_COLLIDE_EYE_X);
        
        MAIN_COLLIDE_EYE_X += MAIN_COLLIDE_EYE_VX;
        MAIN_COLLIDE_EYE_Y += MAIN_COLLIDE_EYE_VY;
        MAIN_COLLIDE_EYE_R += MAIN_COLLIDE_EYE_VR;
        
        MAIN_COLLIDE_WING_X += MAIN_COLLIDE_WING_VX;
        MAIN_COLLIDE_WING_Y += MAIN_COLLIDE_WING_VY;
        MAIN_COLLIDE_WING_R += MAIN_COLLIDE_WING_VR;
        
        MAIN_COLLIDE_EYE_VR *= 0.94;
        MAIN_COLLIDE_WING_VR *= 0.94;
        
    }
    
    superFuxkAngleDiff = -turtleRotation * M_PI/180;
    superFuxkOriX = -idle_x[kPenguinPart_Eye] * penguinScale * aniControlValueForFuckingIpad;
    superFuxkOriY = idle_y[kPenguinPart_Eye] * penguinScale * aniControlValueForFuckingIpad;
    eye_x = useThisEyeX + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
    eye_y = useThisEyeY + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
    
    superFuxkAngleDiff = -turtleRotation * M_PI/180;
    superFuxkOriX = -idle_x[kPenguinPart_Wing] * penguinScale * aniControlValueForFuckingIpad;
    superFuxkOriY = idle_y[kPenguinPart_Wing] * penguinScale * aniControlValueForFuckingIpad;
    wing_x = useThisWingX + superFuxkOriX * cos(superFuxkAngleDiff) - superFuxkOriY * sin(superFuxkAngleDiff);
    wing_y = useThisWingY + superFuxkOriY * cos(superFuxkAngleDiff) + superFuxkOriX * sin(superFuxkAngleDiff);
    
    
    [s_Body setPosition:ccp(body_x, body_y)];
    [s_Eye setPosition:ccp(eye_x, eye_y)];
    [s_Wing setPosition:ccp(wing_x, wing_y)];
    
    [s_Body setRotation:idle_r[kPenguinPart_Body] * 180/M_PI + turtleRotation];
    [s_Eye setRotation:idle_r[kPenguinPart_Eye] * 180/M_PI + useThisEyeR];
    [s_Wing setRotation:idle_r[kPenguinPart_Wing] * 180/M_PI + useThisWingR];
    
}

-(void) setMAINX:(int)_x{
    // printf("setX:%i\n",_x);
    x = _x;
}

-(void) setMAINY:(int)_y{
    y = _y;
}

-(void) setMAINR:(float)_r{
    turtleRotation = _r;
}



@end
