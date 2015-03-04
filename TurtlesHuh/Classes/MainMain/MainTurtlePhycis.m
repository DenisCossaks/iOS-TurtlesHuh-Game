//
//  MainTurtlePhycis.m
//  TurtlesHuh
//
//  Created by  on 2012/7/14.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "MainTurtlePhycis.h"
#import "GamePlayGlobal.h"
#import "MainTurtlePhycisGlobal.h"
#import "MainGamePlayGlobal.h"

@implementation MainTurtlePhycis

-(void) initUpgradeLevels{
    //playerGlider = 4;
   // playerBoost = 4;
}

-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
        
        [self initUpgradeLevels];
        
        myself_redVY = 0;
        myself_redVX = 0;
        
        runningRandomRotationTimer = 0;
        isRunningRandomRotation = false;
        
        /*stat_glider_spin[0] = 0.7;
        stat_glider_spin[1] = 1.2;
        stat_glider_spin[2] = 1.0;
        stat_glider_spin[3] = 1.1;
        stat_glider_spin[4] = 1.2;
        
        stat_glider_control[0] = 0.0;
        stat_glider_control[1] = 0.1;
        stat_glider_control[2] = 0.15;
        stat_glider_control[3] = 0.3;
        stat_glider_control[4] = 0.5;
        
        stat_glider_catch[0] = 0.01;
        stat_glider_catch[1] = 0.7;
        stat_glider_catch[2] = 0.73;
        stat_glider_catch[3] = 0.76;
        stat_glider_catch[4] = 0.79;
        
        stat_glider_upcatch[0] = 0.02;
        stat_glider_upcatch[1] = 0.6;
        stat_glider_upcatch[2] = 0.63;
        stat_glider_upcatch[3] = 0.66;
        stat_glider_upcatch[4] = 0.69;
        
        stat_gliding_speed[0] = 999;
        stat_gliding_speed[1] = 10;
        stat_gliding_speed[2] = 12;
        stat_gliding_speed[3] = 25;
        stat_gliding_speed[4] = 8;
        
        stat_falling_speed[0] = 998;
        stat_falling_speed[1] = 2;
        stat_falling_speed[2] = 3;
        stat_falling_speed[3] = 4;
        stat_falling_speed[4] = 2;
        
        stat_glider_speed[0] = 50;
        stat_glider_speed[1] = 25;
        stat_glider_speed[2] = 60;
        stat_glider_speed[3] = 100;
        stat_glider_speed[4] = 10;
        
        stat_glider_spin_red[0] = 25;
        stat_glider_spin_red[1] = 25;
        stat_glider_spin_red[2] = 40;
        stat_glider_spin_red[3] = 65;
        stat_glider_spin_red[4] = 10;
        
        stat_glider_gravity[0] = 0.25;
        stat_glider_gravity[1] = 0.25;
        stat_glider_gravity[2] = 0.25;
        stat_glider_gravity[3] = 0.25;
        stat_glider_gravity[4] = 0.4;
        
        stat_glider_lift_max[0] = 0.0;
        stat_glider_lift_max[1] = 0.3;
        stat_glider_lift_max[2] = 0.33;
        stat_glider_lift_max[3] = 0.36;
        stat_glider_lift_max[4] = 0.65;
        
        stat_glider_lift_min[0] = 0.0;
        stat_glider_lift_min[1] = 0.0;
        stat_glider_lift_min[2] = 0.0;
        stat_glider_lift_min[3] = 0.0;
        stat_glider_lift_min[4] = 0.0;
        
        stat_boost_thrust[0] = 0.0;
        stat_boost_thrust[1] = 0.8;
        stat_boost_thrust[2] = 1.5;
        stat_boost_thrust[3] = 2.4;
        stat_boost_thrust[4] = 0.8;*/
        
        
        
        
        
        
        
        stat_glider_spin[0] = 0.7;
        stat_glider_spin[1] = 1.2;
        stat_glider_spin[2] = 1.0;
        stat_glider_spin[3] = 1.1;
        stat_glider_spin[4] = 1.15;
        stat_glider_spin[5] = 1.2;
        
        stat_glider_control[0] = 0.0;
        stat_glider_control[1] = 0.1;
        stat_glider_control[2] = 0.2;
        stat_glider_control[3] = 0.3;
        stat_glider_control[4] = 0.4;
        stat_glider_control[5] = 0.5;
        
        stat_glider_catch[0] = 0.01;
        stat_glider_catch[1] = 0.7;
        stat_glider_catch[2] = 0.725;
        stat_glider_catch[3] = 0.75;
        stat_glider_catch[4] = 0.77;
        stat_glider_catch[5] = 0.79;
        
        stat_glider_upcatch[0] = 0.02;
        stat_glider_upcatch[1] = 0.6;
        stat_glider_upcatch[2] = 0.62;
        stat_glider_upcatch[3] = 0.64;
        stat_glider_upcatch[4] = 0.66;
        stat_glider_upcatch[5] = 0.69;
        
        stat_gliding_speed[0] = 999;
        stat_gliding_speed[1] = 4;
        stat_gliding_speed[2] = 5.3;
        stat_gliding_speed[3] = 6.2;
        stat_gliding_speed[4] = 7;
        stat_gliding_speed[5] = 8;
        
        stat_falling_speed[0] = 998;
        stat_falling_speed[1] = 2;
        stat_falling_speed[2] = 2;
        stat_falling_speed[3] = 2;
        stat_falling_speed[4] = 2;
        stat_falling_speed[5] = 2;
        
        stat_glider_speed[0] = 4;
        stat_glider_speed[1] = 5;
        stat_glider_speed[2] = 6.3;
        stat_glider_speed[3] = 7.2;
        stat_glider_speed[4] = 8.5;
        stat_glider_speed[5] = 10;
        
        stat_glider_spin_red[0] = 4;
        stat_glider_spin_red[1] = 5;
        stat_glider_spin_red[2] = 6;
        stat_glider_spin_red[3] = 7;
        stat_glider_spin_red[4] = 8.5;
        stat_glider_spin_red[5] = 10;
        
        stat_glider_gravity[0] = 0.4;
        stat_glider_gravity[1] = 0.4;
        stat_glider_gravity[2] = 0.4;
        stat_glider_gravity[3] = 0.4;
        stat_glider_gravity[4] = 0.4;
        stat_glider_gravity[5] = 0.4;
        
        stat_glider_lift_max[0] = 0.0;
        stat_glider_lift_max[1] = 0.5;
        stat_glider_lift_max[2] = 0.54;
        stat_glider_lift_max[3] = 0.57;
        stat_glider_lift_max[4] = 0.61;
        stat_glider_lift_max[5] = 0.65;
        
        stat_glider_lift_min[0] = 0.0;
        stat_glider_lift_min[1] = 0.0;
        stat_glider_lift_min[2] = 0.0;
        stat_glider_lift_min[3] = 0.0;
        stat_glider_lift_min[4] = 0.0;
        stat_glider_lift_min[5] = 0.0;
        
        stat_boost_thrust[0] = 0.0;
        stat_boost_thrust[1] = 0.05;
        stat_boost_thrust[2] = 0.1;
        stat_boost_thrust[3] = 0.15;
        stat_boost_thrust[4] = 0.2;
        stat_boost_thrust[5] = 0.25;
        
        
        /*stat_glider_spin[5] = 1.2;
        stat_glider_control[5] = 0.5;
        stat_glider_catch[5] = 0.79;
        stat_glider_upcatch[5] = 0.69;
        stat_gliding_speed[5] = 8;
        stat_falling_speed[5] = 2;
        stat_glider_speed[5] = 10;
        stat_glider_spin_red[5] = 10;
        stat_glider_gravity[5] = 0.4;
        stat_glider_lift_max[5] = 0.65;
        stat_glider_lift_min[5] = 0.0;
        stat_boost_thrust[5] = 0.25;*/
        GLIDER_ROTATION_SPEED = 2;
        GLIDER_ROTATION_ALTER = 1.250000;
        GLIDER_ROTATION_MAX_DECREASE = -0.300000;
        RED_ZONE_RESISTANCE = 0.090000;
        AIR_RESISTANCE = 0.996500;
        AIR_RESISTANCE_VERTICAL = 0.976500;
        
        
        AIR_RESISTANCE = 0.995500;
        
        //BEGIN
        //AIR_RESISTANCE = 0.976500;
      //  AIR_RESISTANCE = 0.976500 + (float)playerAirResistance/9.0 * (0.995500 - 0.976500);
        
       /* //hit 0
        AIR_RESISTANCE = 0.990500;
        stat_gliding_speed[1] -= 0.85;
        stat_glider_speed[1] -= 0.85;
        stat_boost_thrust[2] -= 0.02;
        
        //hit 1
        AIR_RESISTANCE = 0.992500;
        stat_gliding_speed[2] -= 0.7;
        stat_glider_speed[2] -= 0.7;
        stat_boost_thrust[3] -= 0.016;
        
        //hit 2
        AIR_RESISTANCE = 0.993100;
        stat_gliding_speed[3] -= 0.55;
        stat_glider_speed[3] -= 0.55;
        stat_boost_thrust[3] -= 0.0125;
        
        //hit 3
        AIR_RESISTANCE = 0.9940500;
        stat_gliding_speed[4] -= 0.35;
        stat_glider_speed[4] -= 0.35;
        stat_boost_thrust[3] -= 0.0075;
        
        //hit 4
        AIR_RESISTANCE = 0.9948500;
        stat_gliding_speed[4] -= 0.2;
        stat_glider_speed[4] -= 0.2;
        stat_boost_thrust[4] -= 0.0045;
        
        //hit 5
        AIR_RESISTANCE = 0.995100;
        stat_gliding_speed[5] -= 0.1;
        stat_glider_speed[5] -= 0.1;
        stat_boost_thrust[5] -= 0.002;
        
        //hit 6
        AIR_RESISTANCE = 0.995500;
        stat_gliding_speed[5] -= 0;
        stat_glider_speed[5] -= 0;
        stat_boost_thrust[5] -= 0;*/
        
        AIR_RESISTANCE = characterAirResistanceReduce;
        for(int i = 0 ; i < 5 ; i++){
            //stat_gliding_speed[i] -= characterAccelerationReduce;
           // stat_glider_speed[i] -= characterAccelerationReduce;
           // stat_boost_thrust[i] -= characterMaxSpeedReduce;
            
            stat_gliding_speed[i] -= characterMaxSpeedReduce;
            stat_glider_speed[i] -= characterMaxSpeedReduce;
            stat_boost_thrust[i] -= characterAccelerationReduce;
        }
        
        
        printf("characterAccelerationReduce:%4.8f %4.8f\n",characterAccelerationReduce,characterMaxSpeedReduce);
        printf("AIR_RESISTANCE:%4.8f\n",AIR_RESISTANCE);
        printf("stat_gliding_speed:%4.8f\n",stat_gliding_speed[playerGlider]);
        printf("stat_glider_speed:%4.8f\n",stat_glider_speed[playerGlider]);
        printf("stat_boost_thrust:%4.8f\n",stat_boost_thrust[playerBoost]);
        
        
      /* // orignal level = 4
        stat_glider_spin[4] = 1.2;
        stat_glider_control[4] = 0.5;
        stat_glider_catch[4] = 0.79;
        stat_glider_upcatch[4] = 0.69;
        stat_gliding_speed[4] = 50;
        stat_falling_speed[4] = 5;
        stat_glider_speed[4] = 250;
        stat_glider_spin_red[4] = 120;
        stat_glider_gravity[4] = 0.4;
        stat_glider_lift_max[4] = 0.395;
        stat_glider_lift_min[4] = 0.0;
        stat_boost_thrust[4] = 4.0;
        GLIDER_ROTATION_SPEED = 2;
        GLIDER_ROTATION_ALTER = 1.250000;
        GLIDER_ROTATION_MAX_DECREASE = -0.300000;
        RED_ZONE_RESISTANCE = 0.050000;
        AIR_RESISTANCE = 0.996500;
        AIR_RESISTANCE_VERTICAL = 0.996500;*/
        
       
        test_turn_rate = stat_glider_spin[playerGlider];
        test_glider_control = stat_glider_control[playerGlider];
        test_glider_catch = stat_glider_catch[playerGlider];
        test_glider_upcatch = stat_glider_upcatch[playerGlider];
        test_gliding_speed = stat_gliding_speed[playerGlider];
        test_falling_speed = stat_falling_speed[playerGlider];
        test_red_zone = stat_glider_speed[playerGlider];
        test_spin_red_zone = stat_glider_spin_red[playerGlider];
        test_gravity = stat_glider_gravity[playerGlider];
        test_lift_max = MIN(stat_glider_lift_max[playerGlider], test_gravity * 0.999000);
        test_lift_min = stat_glider_lift_min[playerGlider];
      
        glide_vdir = 0.000000;
        glide_vmag = 0.000000;
        glide_vx = 0.000000;
        glide_vy = 0.000000;
        grav_mag = 0.000000;
    }
	return self;
}

-(void) runJump:(float)jumpAngle force:(float)_force{
    glide_vdir = player_rotation;
    player_rotation = glide_vdir;
    //glide_vmag = 35;
    glide_vmag = _force;
    glide_vx = cos(glide_vdir * rads) * glide_vmag;
    glide_vy = sin(glide_vdir * rads) * glide_vmag;
}


-(void) runGlide{
    //printf("runGlide:%4.8f %4.8f %4.8f\n",glide_vx, glide_vy, glide_vmag);
    REF_speed = ceil(sqrt(pow(glide_vx, 2) + pow(glide_vy + grav_mag, 2)) * 10) / 10;
    
    glide_vdir = atan2(glide_vy, glide_vx) / rads;
    glide_vmag = sqrt(glide_vx * glide_vx + glide_vy * glide_vy);
   // printf("222runGlide:%4.8f %4.8f %4.8f\n",glide_vx, glide_vy, glide_vmag);
    glide_vmag = MIN(glide_vmag, 2500);
    if (player_rotation <= 0.000000 && player_rotation >= -90)
    {
        glide_vmag = glide_vmag * (1 - player_rotation / -85 * 0.100000 * test_glider_upcatch);
    }
    else if (player_rotation >= 0.000000 && player_rotation <= 90)
    {
        glide_vmag = glide_vmag * (1 - player_rotation / -85 * 0.100000 * test_glider_catch);
    }
    else if (player_rotation >= 90 && player_rotation <= 180)
    {
        glide_vmag = glide_vmag * (1 - (player_rotation - 180) / 85 * 0.100000 * test_glider_catch);
    }
    else
    {
        glide_vmag = glide_vmag * (1 - (player_rotation + 180) / 85 * 0.100000 * test_glider_upcatch);
    } // end else if
    
    
    myself_hasRed = false;
    if (REF_speed >= test_red_zone + 0.100000 && playTimer > playFlightTime)
    {
        glide_vmag = glide_vmag * (1 - RED_ZONE_RESISTANCE * MAX(0.000000, MIN(5, (REF_speed - test_red_zone) / test_red_zone)));
     //   grav_vmag = grav_vmag * (1 - RED_ZONE_RESISTANCE * MAX(0.000000, MIN(5, (REF_speed - test_red_zone) / test_red_zone)));
        
        
        if(isEndingRedDueToHeavyInvincible){
           // printf("isEndingRedDueToHeavyInvincible\n");
        }else{
          //  printf("NOT isEndingRedDueToHeavyInvincible\n");
            if(isApplyingFuel){
                myself_redVX += cos(glide_vdir * rads) * 0.01;
                myself_redVY += sin(glide_vdir * rads) * 0.01;
                myself_hasRed = true;
            }
        }
        
    } // end if
    
    if(!myself_hasRed){
        myself_redVX *= 0.95;
        myself_redVY *= 0.95;
    }
   
    
    glide_vmag = glide_vmag * AIR_RESISTANCE;
   // printf("BEFORE:%4.8f\n",grav_mag);
    grav_mag = grav_mag * AIR_RESISTANCE_VERTICAL;
  //  printf("AFTER:%4.8f\n",grav_mag);
    if (abs(glide_vdir - player_rotation) >= 180)
    {
        if (glide_vdir >= 0.000000)
        {
            glide_vdir = glide_vdir - (glide_vdir - 360 - player_rotation) * test_glider_control;
        }
        else
        {
            glide_vdir = glide_vdir - (glide_vdir + 360 - player_rotation) * test_glider_control;
        } // end else if
    }
    else
    {
        glide_vdir = glide_vdir - (glide_vdir - player_rotation) * test_glider_control;
    } // end else if
    
    //ORIGINAL
    glide_vx = cos(glide_vdir * rads) * glide_vmag;
    glide_vy = sin(glide_vdir * rads) * glide_vmag;
    //printf("333runGlide:%4.8f %4.8f %4.8f\n\n",glide_vx, glide_vy, glide_vmag);

    
    static float glide_ratio_gauge_stopFrame;
    glide_ratio_gauge_stopFrame = MAX(1, MIN(400, (glide_vmag - test_falling_speed) / (test_gliding_speed - test_falling_speed) * 400));
  //  printf("glide_ratio_gauge_stopFrame:%4.8f %4.8f %4.8f %4.8f\n",glide_ratio_gauge_stopFrame,glide_vmag,test_gliding_speed,test_falling_speed);
    
    
    if(glide_ratio_gauge_stopFrame < 2){
        glide_ratio = 0;
    }else if(glide_ratio_gauge_stopFrame < 7){
        glide_ratio = 0.025 * glide_ratio_gauge_stopFrame + 0.0425;
    }else if(glide_ratio_gauge_stopFrame < 31){
        glide_ratio = 0.0098125 * glide_ratio_gauge_stopFrame + 0.1488125;
    }else if(glide_ratio_gauge_stopFrame < 395){
        glide_ratio = 0.0015 * glide_ratio_gauge_stopFrame + 0.4064148;
    }else{
        glide_ratio = 1;
    }
    
    
    if (grav_mag > 0.000000 && glide_ratio > 0.000000)
    {
        grav_mag = grav_mag * (1 - glide_ratio / 50);
    } // end if
    lift = test_lift_min + (test_lift_max - test_lift_min) * glide_ratio;
    
    if(player_rotation >= 60 && player_rotation <= 90){
        lift *= (-player_rotation  + 90.0)/30.0;
        lift *= 0.5;
       // printf("life ratio:%4.8f\n", (-player_rotation  + 90.0)/20.0);
    }
    if(player_rotation >= 90 && player_rotation <= 120){
        lift *= (player_rotation  -90.0)/30.0;
        lift *= 0.5;
       // printf("life ratio2:%4.8f\n", (player_rotation  -90.0)/20.0);
    }          
    
    //printf("lift:%4.8f    %4.8f :     %4.8f %4.8f\n",lift,glide_vmag,glide_ratio,glide_ratio_gauge_stopFrame);
    /*if(player_rotation >= 110 || player_rotation <= -110){
        lift = 0;
    }*/
    
    grav_mag = grav_mag + (test_gravity - lift);
 
    
   // player_y = player_y + (glide_vy + grav_mag);
   // player_x = player_x + glide_vx;
    
    
   /* characterVY = glide_vy + grav_mag;
    characterVX = glide_vx;
    characterRotation = player_rotation;*/
    
  //  printf("\n");
}

-(void) runRoateAfterCannonShot:(int)_playFlightTime{
    static float rotationInterval;
    static float fuckReduce;
    fuckReduce = 0.0;
    if(playerCannon == 2){
        fuckReduce = -60;
    }
    if(playerCannon == 3){
        fuckReduce = -200;
    }
    if(playerCannon == 4){
        fuckReduce = -250;
    }
    if(playerCannon == 5){
        fuckReduce = -300;
    }
    
    rotationInterval = 30.0 / ((float)_playFlightTime - fuckReduce);
    player_rotation +=  rotationInterval;
    if(player_rotation > -5){
        player_rotation = -5;
    }
}

-(void) runRotate:(bool)_isLeft acceX:(float)_acceX{
    if(playTimer <= playFlightTime){
        return;
    }
    
    if(dragonBall_isCollidingOnPillar){
        return;
    }

    if(!isPlayingWithAccelator){
        if(!_isLeft){
            player_rotation = player_rotation + test_turn_rate * GLIDER_ROTATION_SPEED * (1 + MIN(1, MAX(GLIDER_ROTATION_MAX_DECREASE, GLIDER_ROTATION_ALTER * ((test_spin_red_zone - REF_speed) / test_spin_red_zone))));
        }else{
            player_rotation = player_rotation - test_turn_rate * GLIDER_ROTATION_SPEED * (1 + MIN(1, MAX(GLIDER_ROTATION_MAX_DECREASE, GLIDER_ROTATION_ALTER * ((test_spin_red_zone - REF_speed) / test_spin_red_zone))));
        }
    }else{
        static float rotationFuck;
        /*static float externFuck;
        externFuck = _acceX + 0.5;
        if(externFuck < 0.5){
            externFuck = 0.5;
        }
        if(externFuck > 1){
            externFuck = 1;
        }
        externFuck=1;
        rotationFuck = GLIDER_ROTATION_SPEED * sin(_acceX) * 2 * externFuck;*/
        rotationFuck = GLIDER_ROTATION_SPEED * sin(_acceX) * 2;
       
        /*if(_acceX < 0){
            rotationFuck = -GLIDER_ROTATION_SPEED * (sin(_acceX + 4.71238898)+1) * 2;
        }else{
            rotationFuck = GLIDER_ROTATION_SPEED * (sin(_acceX + 4.71238898)+1) * 2;
        }*/

        
       //printf("rads + _acceX:%4.8f %4.8f\n",_acceX*180/M_PI, (_acceX + 4.71238898)*180/M_PI);
        
        if(characterY <= (minFloorY + 0.1)){
            if(player_rotation > -20 && player_rotation < 20){
            
            }else{
                rotationFuck *= 0.5;
            }
            
            if(characterVelocity < 0.1 && !isApplyingFuel){
                return;
            }
            
        }
        
        
        player_rotation = player_rotation + test_turn_rate * rotationFuck * (1 + MIN(1, MAX(GLIDER_ROTATION_MAX_DECREASE, GLIDER_ROTATION_ALTER * ((test_spin_red_zone - REF_speed) / test_spin_red_zone))));
                                                                                                                                                            
                                                                                                                                                            
    }
   
    
   
    if (REF_speed >= test_falling_speed)
    {
        if (player_rotation <= 90 && player_rotation >= -90)
        {
            if (isClickingAntiClockwise)
            {
                characterVY = characterVY - 0.800000;
            } // end if
        }
        else if (isClickingClockwise)
        {
            characterVY = characterVY - 0.800000;
        } // end if
    } // end else if
    
}

-(void) runRandomRotation{
    if(playTimer <= playFlightTime){
        return;
    }
    
    if(dragonBall_isInHittingRange){
        return;
    }
    
    if(player_rotation >= -20 && player_rotation <= 20){
        isInAttackAngleTimer++;
    }else{
        isInAttackAngleTimer = 0; 
        isRunningRandomRotation = false;
        runningRandomRotationTimer = 0;
    }
    
    if(isInAttackAngleTimer >= 60){
        
        if(characterY <= minFloorY){
            runningRandomRotationTimer = 0;
            isRunningRandomRotation = false;
            isInAttackAngleTimer = 0;
            runningRandomRotationTimer = 0;
            
            return;
        }
        
        if(!isRunningRandomRotation){
            if(runningRandomRotationTimer == 0){
                nextRunningRandomRotationTime = arc4random()%25;
                nextRunningRandomRotationTime += 10;
            }
            
            if(runningRandomRotationTimer == nextRunningRandomRotationTime){
                isRunningRandomRotation = true;
                runningRandomRotationTimer = 0;
                runForHowLong = arc4random()%45;
                runForHowLong += 30;
                
                
                static int randomRotationForceRandom;
                static bool hasCollide;
                
                do {
                    hasCollide = false;
                    randomRotationForceRandom = arc4random()%100;
                    randomRotationForce = (float)randomRotationForceRandom/100.0 * 1.5 - 0.75;
                    
                    if(randomRotationForce < 0.4 && randomRotationForce > -0.4){
                        hasCollide = true;
                    }
                } while (hasCollide);
                
                
            }
        }
        
        runningRandomRotationTimer++;
        
        if(isRunningRandomRotation){
            
            if(characterVelocity <= 5){
                randomRotationForce *= 0.5;
            }else if(characterVelocity <= 7){
                randomRotationForce *= 0.8;
            }
            
            player_rotation += randomRotationForce;
          //  printf("randomRotationForce:%4.8f %i\n",randomRotationForce, runningRandomRotationTimer);
            
            if(runningRandomRotationTimer == runForHowLong){
                runningRandomRotationTimer = 0;
                isRunningRandomRotation = false;
                isInAttackAngleTimer = 0;
                runningRandomRotationTimer = 0;
            }
        }
        

    }   
    
}

-(void) applyBoost:(float)_power{
    if(playTimer <= playFlightTime){
        return;
    }
    
    static float boostBuff;
    boostBuff = MIN(1, abs(-90.0 - player_rotation) / 90.0 * 0.15 + 0.85);
  //  printf("_power:%4.8f %4.8f\n",_power, boostBuff);
    glide_vx = glide_vx + cos(player_rotation * rads) * _power * boostBuff;
    //glide_vy = glide_vy + sin(player_rotation * rads) * _power * boostBuff;
    
    //CHANGE TO THIS
    if(_power * boostBuff <0.1){
        glide_vy = glide_vy + sin(player_rotation * rads) * 0.1;
    }else{
        glide_vy = glide_vy + sin(player_rotation * rads) * _power * boostBuff;
    }
    
    /*if(characterRealY < 100){
        if(_power * boostBuff <0.1){
            glide_vy = glide_vy + sin(player_rotation * rads) * 0.1;
        }else{
            glide_vy = glide_vy + sin(player_rotation * rads) * _power * boostBuff;
        }
    }else{
        glide_vy = glide_vy + sin(player_rotation * rads) * _power * boostBuff;
    }*/
    
    
   // printf("_power:%4.8f %4.8f %4.8f %4.8f %4.8f\n",_power, boostBuff,grav_mag,glide_vy, myself_redVY);
}

- (void) dealloc
{
    printf("Main Turtle Physics Dealloc\n");
    [super dealloc];
}

@end
