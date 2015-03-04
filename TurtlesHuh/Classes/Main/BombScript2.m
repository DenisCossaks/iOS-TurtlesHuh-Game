//
//  BombScript2.m
//  TurtlesHuh
//
//  Created by  on 2012/5/20.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "BombScript2.h"
#import "BombScriptGlobal.h"

@implementation BombScript2

-(void) manage{
    [self manageBombCannonAni];
    
    
}

-(void) manageBombCannonAni{
    static float wholeBombOffsetX = 0;
    static float wholeBombOffsetY = 0;
    
    
    for(int i = 0 ; i < bombingAniMax ; i++){
        
        if(bombingAniStruct[i]->isAniCannon){
            
            //printf("BC:%i %i\n",i, bombingAniStruct[i]->aniTimer);
            
            wholeBombOffsetX = bombingAniStruct[i]->aniX;
            wholeBombOffsetY = bombingAniStruct[i]->aniY;
            
            // printf("i:%4.8f %4.8f\n",wholeBombOffsetX,wholeBombOffsetY);
            
            bombingAniStruct[i]->aniTimer++;
            
            //Frame 3
            if(bombingAniStruct[i]->aniTimer == 1){
                [bombingAniStruct[i]->s_buum setPosition:ccp(356.4 + wholeBombOffsetX, -259.7 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_buum setRotation:25.8];
                [bombingAniStruct[i]->s_buum setScaleX:0.522 * 1.537];
                [bombingAniStruct[i]->s_buum setScaleY:0.522 * 1.537];
                [bombingAniStruct[i]->s_buum setOpacity:50.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_blick setPosition:ccp(350.5 + wholeBombOffsetX, -261.4 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_blick setScaleX:1.064];
                [bombingAniStruct[i]->s_blick setScaleY:1.064];
                [bombingAniStruct[i]->s_blick setOpacity:33.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_wave setPosition:ccp(351.5 + wholeBombOffsetX, -265.4 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_wave setScaleX:0.335 * 2.099];
                [bombingAniStruct[i]->s_wave setScaleY:0.335 * 2.099];
                [bombingAniStruct[i]->s_wave setOpacity:39.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[0] setPosition:ccp(367.3 + wholeBombOffsetX, -273.6 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[0] setRotation:113.3];
                [bombingAniStruct[i]->s_bigClouds[0] setScaleX:1.598 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[0] setScaleY:1.598 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[0] setOpacity:79.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[1] setPosition:ccp(367.6 + wholeBombOffsetX, -247.9 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[1] setRotation:43.6];
                [bombingAniStruct[i]->s_bigClouds[1] setScaleX:2.091 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[1] setScaleY:2.091 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[1] setOpacity:79.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[2] setPosition:ccp(345.4 + wholeBombOffsetX, -245.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[2] setRotation:43.6];
                [bombingAniStruct[i]->s_bigClouds[2] setScaleX:1.321 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[2] setScaleY:1.321 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[2] setOpacity:79/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[3] setPosition:ccp(351.1 + wholeBombOffsetX, -277.1 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[3] setRotation:151.2];
                [bombingAniStruct[i]->s_bigClouds[3] setScaleX:2.117 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[3] setScaleY:2.117 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[3] setOpacity:79.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[4] setPosition:ccp(330.0 + wholeBombOffsetX, -247.5 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[4] setRotation:-9.8];
                [bombingAniStruct[i]->s_bigClouds[4] setScaleX:2.015 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[4] setScaleY:2.015 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[4] setOpacity:79.0/100.0 * 255.0];
            }
            
            //Frame 4
            if(bombingAniStruct[i]->aniTimer == 2){
                [bombingAniStruct[i]->s_buum setPosition:ccp(360.1 + wholeBombOffsetX, -264.2 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_buum setRotation:51.9];
                [bombingAniStruct[i]->s_buum setScaleX:0.859 * 1.537];
                [bombingAniStruct[i]->s_buum setScaleY:0.859 * 1.537];
                [bombingAniStruct[i]->s_buum setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_blick setPosition:ccp(350.5 + wholeBombOffsetX, -261.5 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_blick setScaleX:1.527];
                [bombingAniStruct[i]->s_blick setScaleY:1.527];
                [bombingAniStruct[i]->s_blick setOpacity:67.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_wave setPosition:ccp(351.5 + wholeBombOffsetX, -265.4 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_wave setScaleX:0.5 * 2.099];
                [bombingAniStruct[i]->s_wave setScaleY:0.5 * 2.099];
                [bombingAniStruct[i]->s_wave setOpacity:79.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[0] setPosition:ccp(368.9 + wholeBombOffsetX, -277.9 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[0] setRotation:113.1];
                [bombingAniStruct[i]->s_bigClouds[0] setScaleX:1.856 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[0] setScaleY:1.856 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[0] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[1] setPosition:ccp(369.2 + wholeBombOffsetX, -247.7 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[1] setRotation:39.3];
                [bombingAniStruct[i]->s_bigClouds[1] setScaleX:2.392 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[1] setScaleY:2.392 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[1] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[2] setPosition:ccp(344.7 + wholeBombOffsetX, -246.2 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[2] setRotation:39.3];
                [bombingAniStruct[i]->s_bigClouds[2] setScaleX:1.508 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[2] setScaleY:1.508 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[2] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[3] setPosition:ccp(350.9 + wholeBombOffsetX, -279.6 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[3] setRotation:154.5];
                [bombingAniStruct[i]->s_bigClouds[3] setScaleX:2.414 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[3] setScaleY:2.414 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[3] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[4] setPosition:ccp(327.1 + wholeBombOffsetX, -246.4 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[4] setRotation:-12.5];
                [bombingAniStruct[i]->s_bigClouds[4] setScaleX:2.273 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[4] setScaleY:2.273 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[4] setOpacity:100.0/100.0 * 255.0];
            }
            
            //Frame 5
            if(bombingAniStruct[i]->aniTimer == 3){
                [bombingAniStruct[i]->s_buum setPosition:ccp(353.6 + wholeBombOffsetX, -266.0 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_buum setRotation:86.2];
                [bombingAniStruct[i]->s_buum setScaleX:0.534 * 1.537];
                [bombingAniStruct[i]->s_buum setScaleY:0.534 * 1.537];
                [bombingAniStruct[i]->s_buum setOpacity:50.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_blick setPosition:ccp(350.5 + wholeBombOffsetX, -261.5 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_blick setScaleX:1.991];
                [bombingAniStruct[i]->s_blick setScaleY:1.991];
                [bombingAniStruct[i]->s_blick setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_wave setPosition:ccp(351.5 + wholeBombOffsetX, -265.4 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_wave setScaleX:0.554 * 2.099];
                [bombingAniStruct[i]->s_wave setScaleY:0.554 * 2.099];
                [bombingAniStruct[i]->s_wave setOpacity:75/100.0 * 255.0];
                
                
                [bombingAniStruct[i]->s_bigClouds[0] setPosition:ccp(370.6 + wholeBombOffsetX, -280.2 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[0] setRotation:116.9];
                [bombingAniStruct[i]->s_bigClouds[0] setScaleX:1.8 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[0] setScaleY:1.8 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[0] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[1] setPosition:ccp(370.3 + wholeBombOffsetX, -246.7 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[1] setRotation:35.6];
                [bombingAniStruct[i]->s_bigClouds[1] setScaleX:2.342 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[1] setScaleY:2.342 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[1] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[2] setPosition:ccp(344.+ + wholeBombOffsetX, -244.4 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[2] setRotation:35.6];
                [bombingAniStruct[i]->s_bigClouds[2] setScaleX:1.479 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[2] setScaleY:1.479 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[2] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[3] setPosition:ccp(350.9 + wholeBombOffsetX, -281.1 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[3] setRotation:157.7];
                [bombingAniStruct[i]->s_bigClouds[3] setScaleX:2.365 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[3] setScaleY:2.365 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[3] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[4] setPosition:ccp(325.2 + wholeBombOffsetX, -245.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[4] setRotation:-14.8];
                [bombingAniStruct[i]->s_bigClouds[4] setScaleX:2.227 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[4] setScaleY:2.227 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[4] setOpacity:100.0/100.0 * 255.0];
            }
            
            //Frame 6
            if(bombingAniStruct[i]->aniTimer == 4){
                [bombingAniStruct[i]->s_buum setPosition:ccp(353000, 10000)];
                
                [bombingAniStruct[i]->s_blick setPosition:ccp(350.5 + wholeBombOffsetX, -261.5 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_blick setScaleX:1.492];
                [bombingAniStruct[i]->s_blick setScaleY:1.492];
                [bombingAniStruct[i]->s_blick setOpacity:67.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_wave setPosition:ccp(351.5 + wholeBombOffsetX, -265.4 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_wave setScaleX:0.639 * 2.099];
                [bombingAniStruct[i]->s_wave setScaleY:0.639 * 2.099];
                [bombingAniStruct[i]->s_wave setOpacity:71.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[0] setPosition:ccp(372.6 + wholeBombOffsetX, -283.0 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[0] setRotation:121.8];
                [bombingAniStruct[i]->s_bigClouds[0] setScaleX:1.734 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[0] setScaleY:1.734 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[0] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[1] setPosition:ccp(372.2 + wholeBombOffsetX, -244.9 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[1] setRotation:29.1];
                [bombingAniStruct[i]->s_bigClouds[1] setScaleX:2.26 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[1] setScaleY:2.26 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[1] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[2] setPosition:ccp(344.4 + wholeBombOffsetX, -241.1 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[2] setRotation:29.1];
                [bombingAniStruct[i]->s_bigClouds[2] setScaleX:1.431 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[2] setScaleY:1.431 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[2] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[3] setPosition:ccp(350.9 + wholeBombOffsetX, -283.9 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[3] setRotation:163.2];
                [bombingAniStruct[i]->s_bigClouds[3] setScaleX:2.281 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[3] setScaleY:2.281 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[3] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[4] setPosition:ccp(321.9 + wholeBombOffsetX, -244.6 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[4] setRotation:-19.3];
                [bombingAniStruct[i]->s_bigClouds[4] setScaleX:2.146 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[4] setScaleY:2.146 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[4] setOpacity:100.0/100.0 * 255.0];
            }
            
            
            //Frame 7
            if(bombingAniStruct[i]->aniTimer == 5){
                [bombingAniStruct[i]->s_blick setPosition:ccp(350.5 + wholeBombOffsetX, -261.5 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_blick setScaleX:0.994];
                [bombingAniStruct[i]->s_blick setScaleY:0.994];
                [bombingAniStruct[i]->s_blick setOpacity:33.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_wave setPosition:ccp(351.5 + wholeBombOffsetX, -265.4 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_wave setScaleX:0.753 * 2.099];
                [bombingAniStruct[i]->s_wave setScaleY:0.753 * 2.099];
                [bombingAniStruct[i]->s_wave setOpacity:64.0/100.0 * 255.0];
                
                
                [bombingAniStruct[i]->s_bigClouds[0] setPosition:ccp(375.0 + wholeBombOffsetX, -286.4 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[0] setRotation:127.6];
                [bombingAniStruct[i]->s_bigClouds[0] setScaleX:1.657 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[0] setScaleY:1.657 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[0] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[1] setPosition:ccp(374.9 + wholeBombOffsetX, -242.6 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[1] setRotation:20.8];
                [bombingAniStruct[i]->s_bigClouds[1] setScaleX:2.153 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[1] setScaleY:2.153 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[1] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[2] setPosition:ccp(344.1 + wholeBombOffsetX, -236.9 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[2] setRotation:20.8];
                [bombingAniStruct[i]->s_bigClouds[2] setScaleX:1.37 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[2] setScaleY:1.37 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[2] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[3] setPosition:ccp(350.9 + wholeBombOffsetX, -287.6 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[3] setRotation:170.2];
                [bombingAniStruct[i]->s_bigClouds[3] setScaleX:2.173 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[3] setScaleY:2.173 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[3] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[4] setPosition:ccp(317.4 + wholeBombOffsetX, -243.0 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[4] setRotation:-24.8];
                [bombingAniStruct[i]->s_bigClouds[4] setScaleX:2.043 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[4] setScaleY:2.043 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[4] setOpacity:100.0/100.0 * 255.0];
                
            }
            
            //Frame 8
            if(bombingAniStruct[i]->aniTimer == 6){
                [bombingAniStruct[i]->s_blick setPosition:ccp(10000 , 261.5)];
                
                [bombingAniStruct[i]->s_wave setPosition:ccp(351.5 + wholeBombOffsetX, -265.4 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_wave setScaleX:0.89 * 2.099];
                [bombingAniStruct[i]->s_wave setScaleY:0.89 * 2.099];
                [bombingAniStruct[i]->s_wave setOpacity:56.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[0] setPosition:ccp(377.6 + wholeBombOffsetX, -290.1 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[0] setRotation:134.1];
                [bombingAniStruct[i]->s_bigClouds[0] setScaleX:1.568 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[0] setScaleY:1.568 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[0] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[1] setPosition:ccp(378 + wholeBombOffsetX, -240.1 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[1] setRotation:11.0];
                [bombingAniStruct[i]->s_bigClouds[1] setScaleX:2.029 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[1] setScaleY:2.029 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[1] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[2] setPosition:ccp(343.8 + wholeBombOffsetX, -232.1 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[2] setRotation:11.0];
                [bombingAniStruct[i]->s_bigClouds[2] setScaleX:1.299 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[2] setScaleY:1.299 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[2] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[3] setPosition:ccp(351.1 + wholeBombOffsetX, -291.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[3] setRotation:178.7];
                [bombingAniStruct[i]->s_bigClouds[3] setScaleX:2.048 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[3] setScaleY:2.048 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[3] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[4] setPosition:ccp(312.4 + wholeBombOffsetX, -241.2 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[4] setRotation:-31.3];
                [bombingAniStruct[i]->s_bigClouds[4] setScaleX:1.922 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[4] setScaleY:1.922 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[4] setOpacity:100.0/100.0 * 255.0];
                
            }
            
            //Frame 9
            if(bombingAniStruct[i]->aniTimer == 7){
                [bombingAniStruct[i]->s_wave setPosition:ccp(351.5 + wholeBombOffsetX, -265.4 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_wave setScaleX:1.045 * 2.099];
                [bombingAniStruct[i]->s_wave setScaleY:1.015 * 2.099];
                [bombingAniStruct[i]->s_wave setOpacity:47.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[0] setPosition:ccp(380.8 + wholeBombOffsetX, -294.2 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[0] setRotation:141.4];
                [bombingAniStruct[i]->s_bigClouds[0] setScaleX:1.471 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[0] setScaleY:1.471 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[0] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[1] setPosition:ccp(381.1 + wholeBombOffsetX, -237.1 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[1] setRotation:0.3];
                [bombingAniStruct[i]->s_bigClouds[1] setScaleX:1.892 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[1] setScaleY:1.892 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[1] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[2] setPosition:ccp(343.4 + wholeBombOffsetX, -226.7 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[2] setRotation:0.3];
                [bombingAniStruct[i]->s_bigClouds[2] setScaleX:1.22 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[2] setScaleY:1.22 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[2] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[3] setPosition:ccp(351.1 + wholeBombOffsetX, -296.5 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[3] setRotation:-172.2];
                [bombingAniStruct[i]->s_bigClouds[3] setScaleX:1.908 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[3] setScaleY:1.908 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[3] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[4] setPosition:ccp(306.9 + wholeBombOffsetX, -239.3 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[4] setRotation:-38.6];
                [bombingAniStruct[i]->s_bigClouds[4] setScaleX:1.792 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[4] setScaleY:1.792 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[4] setOpacity:100.0/100.0 * 255.0];
                
            }
            
            //Frame 10
            if(bombingAniStruct[i]->aniTimer == 8){
                [bombingAniStruct[i]->s_wave setPosition:ccp(351.5 + wholeBombOffsetX, -265.4 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_wave setScaleX:1.213 * 2.099];
                [bombingAniStruct[i]->s_wave setScaleY:1.213 * 2.099];
                [bombingAniStruct[i]->s_wave setOpacity:38.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[0] setPosition:ccp(394.1 + wholeBombOffsetX, -298.7 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[0] setRotation:149.4];
                [bombingAniStruct[i]->s_bigClouds[0] setScaleX:1.361 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[0] setScaleY:1.361 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[0] setOpacity:91.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[1] setPosition:ccp(385.1 + wholeBombOffsetX, -234.1 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[1] setRotation:-11.3];
                [bombingAniStruct[i]->s_bigClouds[1] setScaleX:1.742 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[1] setScaleY:1.742 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[1] setOpacity:91.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[2] setPosition:ccp(343.1 + wholeBombOffsetX, -220.9 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[2] setRotation:-11.3];
                [bombingAniStruct[i]->s_bigClouds[2] setScaleX:1.133 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[2] setScaleY:1.133 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[2] setOpacity:91.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[3] setPosition:ccp(351.3 + wholeBombOffsetX, -301.5 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[3] setRotation:-162.4];
                [bombingAniStruct[i]->s_bigClouds[3] setScaleX:1.75 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[3] setScaleY:1.75 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[3] setOpacity:91.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[4] setPosition:ccp(300.9 + wholeBombOffsetX, -237.1 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[4] setRotation:-46.4];
                [bombingAniStruct[i]->s_bigClouds[4] setScaleX:1.647 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[4] setScaleY:1.647 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[4] setOpacity:91.0/100.0 * 255.0];
                
            }
            
            //Frame 11
            if(bombingAniStruct[i]->aniTimer == 9){
                [bombingAniStruct[i]->s_wave setPosition:ccp(351.5 + wholeBombOffsetX, -265.4 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_wave setScaleX:1.386 * 2.099];
                [bombingAniStruct[i]->s_wave setScaleY:1.386 * 2.099];
                [bombingAniStruct[i]->s_wave setOpacity:28.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[0] setPosition:ccp(387.9 + wholeBombOffsetX, -303.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[0] setRotation:158.2];
                [bombingAniStruct[i]->s_bigClouds[0] setScaleX:1.244 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[0] setScaleY:1.244 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[0] setOpacity:82.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[1] setPosition:ccp(389.1 + wholeBombOffsetX, -230.7 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[1] setRotation:-23.8];
                [bombingAniStruct[i]->s_bigClouds[1] setScaleX:1.583 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[1] setScaleY:1.583 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[1] setOpacity:80.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[2] setPosition:ccp(342.7 + wholeBombOffsetX, -214.7 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[2] setRotation:-23.8];
                [bombingAniStruct[i]->s_bigClouds[2] setScaleX:1.041 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[2] setScaleY:1.041 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[2] setOpacity:80.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[3] setPosition:ccp(351.5 + wholeBombOffsetX, -306.9 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[3] setRotation:-151.7];
                [bombingAniStruct[i]->s_bigClouds[3] setScaleX:1.595 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[3] setScaleY:1.595 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[3] setOpacity:80.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[4] setPosition:ccp(294.6 + wholeBombOffsetX, -234.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[4] setRotation:-54.9];
                [bombingAniStruct[i]->s_bigClouds[4] setScaleX:1.496 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[4] setScaleY:1.496 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[4] setOpacity:80.0/100.0 * 255.0];
                
            }
            
            //Frame 12
            if(bombingAniStruct[i]->aniTimer == 10){
                [bombingAniStruct[i]->s_wave setPosition:ccp(351.5 + wholeBombOffsetX, -265.4 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_wave setScaleX:1.558 * 2.099];
                [bombingAniStruct[i]->s_wave setScaleY:1.558 * 2.099];
                [bombingAniStruct[i]->s_wave setOpacity:18.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[0] setPosition:ccp(391.6 + wholeBombOffsetX, -309.1 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[0] setRotation:167.7];
                [bombingAniStruct[i]->s_bigClouds[0] setScaleX:1.118 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[0] setScaleY:1.118 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[0] setOpacity:72.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[1] setPosition:ccp(393.1 + wholeBombOffsetX, -227.7 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[1] setRotation:-36.6];
                [bombingAniStruct[i]->s_bigClouds[1] setScaleX:1.416 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[1] setScaleY:1.416 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[1] setOpacity:70.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[2] setPosition:ccp(342.2 + wholeBombOffsetX, -208.2 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[2] setRotation:-36.6];
                [bombingAniStruct[i]->s_bigClouds[2] setScaleX:0.946 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[2] setScaleY:0.946 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[2] setOpacity:70.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[3] setPosition:ccp(351.6 + wholeBombOffsetX, -312.6 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[3] setRotation:-140.6];
                [bombingAniStruct[i]->s_bigClouds[3] setScaleX:1.427 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[3] setScaleY:1.427 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[3] setOpacity:70.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[4] setPosition:ccp(287.8 + wholeBombOffsetX, -232.5 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[4] setRotation:-63.5];
                [bombingAniStruct[i]->s_bigClouds[4] setScaleX:1.338 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[4] setScaleY:1.338 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[4] setOpacity:70.0/100.0 * 255.0];
            }
            
            
            //Frame 13
            if(bombingAniStruct[i]->aniTimer == 11){
                [bombingAniStruct[i]->s_wave setPosition:ccp(351.5 + wholeBombOffsetX, -265.4 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_wave setScaleX:1.72 * 2.099];
                [bombingAniStruct[i]->s_wave setScaleY:1.72 * 2.099];
                [bombingAniStruct[i]->s_wave setOpacity:9.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[0] setPosition:ccp(395.9 + wholeBombOffsetX, -314.9 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[0] setRotation:177.7];
                [bombingAniStruct[i]->s_bigClouds[0] setScaleX:0.983 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[0] setScaleY:0.983 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[0] setOpacity:62.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[1] setPosition:ccp(397.4 + wholeBombOffsetX, -223.5 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[1] setRotation:-50.2];
                [bombingAniStruct[i]->s_bigClouds[1] setScaleX:1.244 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[1] setScaleY:1.244 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[1] setOpacity:59.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[2] setPosition:ccp(341.9 + wholeBombOffsetX, -201.6 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[2] setRotation:-50.2];
                [bombingAniStruct[i]->s_bigClouds[2] setScaleX:0.846 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[2] setScaleY:0.846 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[2] setOpacity:59.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[3] setPosition:ccp(351.7 + wholeBombOffsetX, -318.4 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[3] setRotation:-129.1];
                [bombingAniStruct[i]->s_bigClouds[3] setScaleX:1.253 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[3] setScaleY:1.253 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[3] setOpacity:59.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[4] setPosition:ccp(280.9 + wholeBombOffsetX, -230.0 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[4] setRotation:-72.7];
                [bombingAniStruct[i]->s_bigClouds[4] setScaleX:1.174 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[4] setScaleY:1.174 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[4] setOpacity:59.0/100.0 * 255.0];
                
            }
            
            
            //Frame 14
            if(bombingAniStruct[i]->aniTimer == 12){
                [bombingAniStruct[i]->s_wave setPosition:ccp(10000 , 265)];
                
                [bombingAniStruct[i]->s_debris[0] setPosition:ccp(257.8 + wholeBombOffsetX, -319.5 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[0] setRotation:132.6];
                [bombingAniStruct[i]->s_debris[0] setScaleX:0.383];
                [bombingAniStruct[i]->s_debris[0] setScaleY:0.635];
                [bombingAniStruct[i]->s_debris[0] setOpacity:5.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[0] setPosition:ccp(400.4 + wholeBombOffsetX, -321.0 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[0] setRotation:171.7];
                [bombingAniStruct[i]->s_bigClouds[0] setScaleX:0.84 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[0] setScaleY:0.84 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[0] setOpacity:51.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[1] setPosition:ccp(401.8 + wholeBombOffsetX, -219.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[1] setRotation:-64.2];
                [bombingAniStruct[i]->s_bigClouds[1] setScaleX:1.066 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[1] setScaleY:1.066 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[1] setOpacity:48.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[2] setPosition:ccp(341.3 + wholeBombOffsetX, -194.6 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[2] setRotation:-64.2];
                [bombingAniStruct[i]->s_bigClouds[2] setScaleX:0.744 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[2] setScaleY:0.744 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[2] setOpacity:48.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[3] setPosition:ccp(351.8 + wholeBombOffsetX, -324.4 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[3] setRotation:-117.1];
                [bombingAniStruct[i]->s_bigClouds[3] setScaleX:1.074 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[3] setScaleY:1.074 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[3] setOpacity:48.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[4] setPosition:ccp(273.8 + wholeBombOffsetX, -227.4 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[4] setRotation:-82.0];
                [bombingAniStruct[i]->s_bigClouds[4] setScaleX:1.005 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[4] setScaleY:1.005 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[4] setOpacity:48.0/100.0 * 255.0];
                
            }
            
            
            //Frame 15
            if(bombingAniStruct[i]->aniTimer == 13){
                
                [bombingAniStruct[i]->s_debris[0] setPosition:ccp(10000, 319.5)];
                
                [bombingAniStruct[i]->s_bigClouds[0] setPosition:ccp(404.9 + wholeBombOffsetX, -327.4 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[0] setRotation:160.5];
                [bombingAniStruct[i]->s_bigClouds[0] setScaleX:0.688 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[0] setScaleY:0.688 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[0] setOpacity:39.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[1] setPosition:ccp(406.4 + wholeBombOffsetX, -215.9 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[1] setRotation:-78.5];
                [bombingAniStruct[i]->s_bigClouds[1] setScaleX:0.884 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[1] setScaleY:0.884 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[1] setOpacity:36.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[2] setPosition:ccp(340.9 + wholeBombOffsetX, -187.4 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[2] setRotation:-78.5];
                [bombingAniStruct[i]->s_bigClouds[2] setScaleX:0.639 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[2] setScaleY:0.639 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[2] setOpacity:36.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[3] setPosition:ccp(351.9 + wholeBombOffsetX, -330.5 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[3] setRotation:-104.8];
                [bombingAniStruct[i]->s_bigClouds[3] setScaleX:0.889 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[3] setScaleY:0.889 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[3] setOpacity:36.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[4] setPosition:ccp(266.4 + wholeBombOffsetX, -224.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[4] setRotation:-91.5];
                [bombingAniStruct[i]->s_bigClouds[4] setScaleX:0.83 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[4] setScaleY:0.83 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[4] setOpacity:36.0/100.0 * 255.0];
                
            }
            
            
            //Frame 16
            if(bombingAniStruct[i]->aniTimer == 14){
                
                
                [bombingAniStruct[i]->s_bigClouds[0] setPosition:ccp(409.9 + wholeBombOffsetX, -334.2 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[0] setRotation:-148.7];
                [bombingAniStruct[i]->s_bigClouds[0] setScaleX:0.529 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[0] setScaleY:0.529 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[0] setOpacity:27.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[1] setPosition:ccp(411.1 + wholeBombOffsetX, -212.0 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[1] setRotation:-93.0];
                [bombingAniStruct[i]->s_bigClouds[1] setScaleX:0.696 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[1] setScaleY:0.696 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[1] setOpacity:25.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[2] setPosition:ccp(340.3 + wholeBombOffsetX, -180.1 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[2] setRotation:-93.0];
                [bombingAniStruct[i]->s_bigClouds[2] setScaleX:0.531 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[2] setScaleY:0.531 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[2] setOpacity:25.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[3] setPosition:ccp(352.1 + wholeBombOffsetX, -336.9 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[3] setRotation:-92.3];
                [bombingAniStruct[i]->s_bigClouds[3] setScaleX:0.699 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[3] setScaleY:0.699 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[3] setOpacity:25.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[4] setPosition:ccp(258.8 + wholeBombOffsetX, -222.1 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[4] setRotation:-101.3];
                [bombingAniStruct[i]->s_bigClouds[4] setScaleX:0.65 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[4] setScaleY:0.65 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[4] setOpacity:25.0/100.0 * 255.0];
                
                
            }
            
            
            //Frame 17
            if(bombingAniStruct[i]->aniTimer == 15){
                
                [bombingAniStruct[i]->s_bigClouds[0] setPosition:ccp(415.0 + wholeBombOffsetX, -341.1 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[0] setRotation:-136.4];
                [bombingAniStruct[i]->s_bigClouds[0] setScaleX:0.364 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[0] setScaleY:0.364 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[0] setOpacity:14.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[1] setPosition:ccp(415.8 + wholeBombOffsetX, -207.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[1] setRotation:-108.1];
                [bombingAniStruct[i]->s_bigClouds[1] setScaleX:0.503 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[1] setScaleY:0.503 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[1] setOpacity:13.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[2] setPosition:ccp(339.8 + wholeBombOffsetX, -172.7 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[2] setRotation:-108.1];
                [bombingAniStruct[i]->s_bigClouds[2] setScaleX:0.42 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[2] setScaleY:0.42 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[2] setOpacity:13.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[3] setPosition:ccp(352.1 + wholeBombOffsetX, -343.4 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[3] setRotation:-79.7];
                [bombingAniStruct[i]->s_bigClouds[3] setScaleX:0.505 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[3] setScaleY:0.505 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[3] setOpacity:13.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[4] setPosition:ccp(251.0 + wholeBombOffsetX, -219.3 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[4] setRotation:-111.5];
                [bombingAniStruct[i]->s_bigClouds[4] setScaleX:0.466 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[4] setScaleY:0.466 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[4] setOpacity:13.0/100.0 * 255.0];
                
            }
            
            
            if(bombingAniStruct[i]->aniTimer == 16){
                [bombingAniStruct[i]->s_bigClouds[0] setPosition:ccp(34900.8 , -256.2)];
                [bombingAniStruct[i]->s_bigClouds[1] setPosition:ccp(34900.8 , -256.2)];
                [bombingAniStruct[i]->s_bigClouds[2] setPosition:ccp(34900.8 , -256.2)];
                [bombingAniStruct[i]->s_bigClouds[3] setPosition:ccp(34900.8 , -256.2)];
                [bombingAniStruct[i]->s_bigClouds[4] setPosition:ccp(34900.8 , -256.2)];
                [bombingAniStruct[i]->s_bigClouds[7] setPosition:ccp(34900.8 , -256.2)];
                
                bombingAniStruct[i]->isAniCannon = false;
            }
            
        }//end if bombingAniStrut i isAni
        
        
    }
}

@end
