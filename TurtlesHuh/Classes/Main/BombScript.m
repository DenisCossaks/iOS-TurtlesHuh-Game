//
//  BombScript.m
//  TurtlesHuh
//
//  Created by  on 2012/5/20.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "BombScript.h"
#import "BombScriptGlobal.h"
#import "Global.h"

@implementation BombScript


-(void) manage{
    [self manageBombAni];
    [self manageBombComboAni];
    [self manageBombShakeAni];
    [self managePlusTimeAni];

    
    /*if(isIpad){
        
        float ratioX;
        float ratioY;
        
        ratioX = 1024.0/480.0;
        ratioY = 768.0/320.0;
        
        for(int i = 0 ; i < bombingAniMax ; i++){
            [bombingAniStruct[i]->s_buum setPosition:ccp(bombingAniStruct[i]->s_buum.position.x * ratioX, bombingAniStruct[i]->s_buum.position.y * ratioY)];
            [bombingAniStruct[i]->s_blick setPosition:ccp(bombingAniStruct[i]->s_blick.position.x * ratioX, bombingAniStruct[i]->s_blick.position.y * ratioY)];
            [bombingAniStruct[i]->s_wave setPosition:ccp(bombingAniStruct[i]->s_wave.position.x * ratioX, bombingAniStruct[i]->s_wave.position.y * ratioY)];
            
            [bombingAniStruct[i]->s_debris[0] setPosition:ccp(bombingAniStruct[i]->s_debris[0].position.x * ratioX, bombingAniStruct[i]->s_debris[0].position.y * ratioY)];
            [bombingAniStruct[i]->s_debris[1] setPosition:ccp(bombingAniStruct[i]->s_debris[1].position.x * ratioX, bombingAniStruct[i]->s_debris[1].position.y * ratioY)];
            [bombingAniStruct[i]->s_debris[2] setPosition:ccp(bombingAniStruct[i]->s_debris[2].position.x * ratioX, bombingAniStruct[i]->s_debris[2].position.y * ratioY)];
            
            [bombingAniStruct[i]->s_bigClouds[0] setPosition:ccp(bombingAniStruct[i]->s_bigClouds[0].position.x * ratioX, bombingAniStruct[i]->s_bigClouds[0].position.y * ratioY)];
            [bombingAniStruct[i]->s_bigClouds[1] setPosition:ccp(bombingAniStruct[i]->s_bigClouds[1].position.x * ratioX, bombingAniStruct[i]->s_bigClouds[1].position.y * ratioY)];
            [bombingAniStruct[i]->s_bigClouds[2] setPosition:ccp(bombingAniStruct[i]->s_bigClouds[2].position.x * ratioX, bombingAniStruct[i]->s_bigClouds[2].position.y * ratioY)];
            [bombingAniStruct[i]->s_bigClouds[3] setPosition:ccp(bombingAniStruct[i]->s_bigClouds[3].position.x * ratioX, bombingAniStruct[i]->s_bigClouds[3].position.y * ratioY)];
            [bombingAniStruct[i]->s_bigClouds[4] setPosition:ccp(bombingAniStruct[i]->s_bigClouds[4].position.x * ratioX, bombingAniStruct[i]->s_bigClouds[4].position.y * ratioY)];
            [bombingAniStruct[i]->s_bigClouds[5] setPosition:ccp(bombingAniStruct[i]->s_bigClouds[5].position.x * ratioX, bombingAniStruct[i]->s_bigClouds[5].position.y * ratioY)];
            [bombingAniStruct[i]->s_bigClouds[6] setPosition:ccp(bombingAniStruct[i]->s_bigClouds[6].position.x * ratioX, bombingAniStruct[i]->s_bigClouds[6].position.y * ratioY)];
            [bombingAniStruct[i]->s_bigClouds[7] setPosition:ccp(bombingAniStruct[i]->s_bigClouds[7].position.x * ratioX, bombingAniStruct[i]->s_bigClouds[7].position.y * ratioY)];
            
            [bombingAniStruct[i]->s_smallClouds[0] setPosition:ccp(bombingAniStruct[i]->s_smallClouds[0].position.x * ratioX, bombingAniStruct[i]->s_smallClouds[0].position.y * ratioY)];
            [bombingAniStruct[i]->s_smallClouds[1] setPosition:ccp(bombingAniStruct[i]->s_smallClouds[1].position.x * ratioX, bombingAniStruct[i]->s_smallClouds[1].position.y * ratioY)];
            [bombingAniStruct[i]->s_smallClouds[2] setPosition:ccp(bombingAniStruct[i]->s_smallClouds[2].position.x * ratioX, bombingAniStruct[i]->s_smallClouds[2].position.y * ratioY)];
            [bombingAniStruct[i]->s_smallClouds[3] setPosition:ccp(bombingAniStruct[i]->s_smallClouds[3].position.x * ratioX, bombingAniStruct[i]->s_smallClouds[3].position.y * ratioY)];
            [bombingAniStruct[i]->s_smallClouds[4] setPosition:ccp(bombingAniStruct[i]->s_smallClouds[4].position.x * ratioX, bombingAniStruct[i]->s_smallClouds[4].position.y * ratioY)];
        }
    }*/
}

-(void) manageBombAni{
    //return;
    
     float wholeBombOffsetX = 0;
     float wholeBombOffsetY = 0;
    
    
    for(int i = 0 ; i < bombingAniMax ; i++){
        
        if(bombingAniStruct[i]->isAni){
            
            //printf("M:%i %i\n",i, bombingAniStruct[i]->aniTimer);
            
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
                
                [bombingAniStruct[i]->s_debris[0] setPosition:ccp(345.8 + wholeBombOffsetX, -267.5 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[0] setRotation:139.6];
                [bombingAniStruct[i]->s_debris[0] setScaleX:0.419];
                [bombingAniStruct[i]->s_debris[0] setScaleY:0.636];
                [bombingAniStruct[i]->s_debris[0] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[1] setPosition:ccp(345.8 + wholeBombOffsetX, -254.0 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[1] setRotation:-124.6];
                [bombingAniStruct[i]->s_debris[1] setScaleX:0.636];
                [bombingAniStruct[i]->s_debris[1] setScaleY:0.899];
                [bombingAniStruct[i]->s_debris[1] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[2] setPosition:ccp(367.8 + wholeBombOffsetX, -254.5 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[2] setRotation:-32.3];
                [bombingAniStruct[i]->s_debris[2] setScaleX:0.636];
                [bombingAniStruct[i]->s_debris[2] setScaleY:0.636];
                [bombingAniStruct[i]->s_debris[2] setOpacity:100.0/100.0 * 255.0];
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
                
                [bombingAniStruct[i]->s_debris[0] setPosition:ccp(335.3 + wholeBombOffsetX, -273.6 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[0] setRotation:138.9];
                [bombingAniStruct[i]->s_debris[0] setScaleX:0.424];
                [bombingAniStruct[i]->s_debris[0] setScaleY:0.635];
                [bombingAniStruct[i]->s_debris[0] setOpacity:89.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[1] setPosition:ccp(338.6 + wholeBombOffsetX, -239.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[1] setRotation:-123.1];
                [bombingAniStruct[i]->s_debris[1] setScaleX:0.636];
                [bombingAniStruct[i]->s_debris[1] setScaleY:0.899];
                [bombingAniStruct[i]->s_debris[1] setOpacity:91.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[2] setPosition:ccp(384.5 + wholeBombOffsetX, -242.6 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[2] setRotation:-32.3];
                [bombingAniStruct[i]->s_debris[2] setScaleX:0.636];
                [bombingAniStruct[i]->s_debris[2] setScaleY:0.636];
                [bombingAniStruct[i]->s_debris[2] setOpacity:90.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[0] setPosition:ccp(364.1 + wholeBombOffsetX, -265.6 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[0] setRotation:113.8];
                [bombingAniStruct[i]->s_bigClouds[0] setScaleX:1.1113 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[0] setScaleY:1.1113 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[0] setOpacity:41.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[1] setPosition:ccp(364.7 + wholeBombOffsetX, -248.4 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[1] setRotation:51.6];
                [bombingAniStruct[i]->s_bigClouds[1] setScaleX:1.528 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[1] setScaleY:1.528 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[1] setOpacity:41.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[2] setPosition:ccp(346.6 + wholeBombOffsetX, -245.1 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[2] setRotation:51.6];
                [bombingAniStruct[i]->s_bigClouds[2] setScaleX:0.973 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[2] setScaleY:0.973 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[2] setOpacity:41.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[3] setPosition:ccp(351.4 + wholeBombOffsetX, -272.2 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[3] setRotation:144.7];
                [bombingAniStruct[i]->s_bigClouds[3] setScaleX:1.559 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[3] setScaleY:1.559 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[3] setOpacity:41.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[4] setPosition:ccp(335.6 + wholeBombOffsetX, -249.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[4] setRotation:-5];
                [bombingAniStruct[i]->s_bigClouds[4] setScaleX:1.529 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[4] setScaleY:1.527 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[4] setOpacity:41.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[5] setPosition:ccp(349.8 + wholeBombOffsetX, -256.2 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[5] setRotation:-21.5];
                [bombingAniStruct[i]->s_bigClouds[5] setScaleX:1.289 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[5] setScaleY:1.289 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[5] setOpacity:22.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[6] setPosition:ccp(341.6 + wholeBombOffsetX, -259.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[6] setRotation:-10.8];
                [bombingAniStruct[i]->s_bigClouds[6] setScaleX:1.1185 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[6] setScaleY:1.1185 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[6] setOpacity:22.0/100.0 * 255.0];
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
                
                [bombingAniStruct[i]->s_debris[0] setPosition:ccp(324.1 + wholeBombOffsetX, -280.2 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[0] setRotation:137.9];
                [bombingAniStruct[i]->s_debris[0] setScaleX:0.424];
                [bombingAniStruct[i]->s_debris[0] setScaleY:0.635];
                [bombingAniStruct[i]->s_debris[0] setOpacity:77.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[1] setPosition:ccp(331.1 + wholeBombOffsetX, -224.4 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[1] setRotation:-121.4];
                [bombingAniStruct[i]->s_debris[1] setScaleX:0.636];
                [bombingAniStruct[i]->s_debris[1] setScaleY:0.899];
                [bombingAniStruct[i]->s_debris[1] setOpacity:82.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[2] setPosition:ccp(402.1 + wholeBombOffsetX, -230.0 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[2] setRotation:-32.3];
                [bombingAniStruct[i]->s_debris[2] setScaleX:0.636];
                [bombingAniStruct[i]->s_debris[2] setScaleY:0.636];
                [bombingAniStruct[i]->s_debris[2] setOpacity:79.0/100.0 * 255.0];
                
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
                
                [bombingAniStruct[i]->s_bigClouds[5] setPosition:ccp(349.8 + wholeBombOffsetX, -256.4 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[5] setRotation:-14.6];
                [bombingAniStruct[i]->s_bigClouds[5] setScaleX:1.613 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[5] setScaleY:1.613 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[5] setOpacity:47.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[6] setPosition:ccp(341.6 + wholeBombOffsetX, -259.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[6] setRotation:-22.6];
                [bombingAniStruct[i]->s_bigClouds[6] setScaleX:1.499 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[6] setScaleY:1.499 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[6] setOpacity:46.0/100.0 * 255.0];
            }
            
            //Frame 8
            if(bombingAniStruct[i]->aniTimer == 6){
                [bombingAniStruct[i]->s_blick setPosition:ccp(10000 , 261.5)];
                
                [bombingAniStruct[i]->s_wave setPosition:ccp(351.5 + wholeBombOffsetX, -265.4 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_wave setScaleX:0.89 * 2.099];
                [bombingAniStruct[i]->s_wave setScaleY:0.89 * 2.099];
                [bombingAniStruct[i]->s_wave setOpacity:56.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[0] setPosition:ccp(313.1 + wholeBombOffsetX, -286.9 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[0] setRotation:136.9];
                [bombingAniStruct[i]->s_debris[0] setScaleX:0.405];
                [bombingAniStruct[i]->s_debris[0] setScaleY:0.635];
                [bombingAniStruct[i]->s_debris[0] setOpacity:65.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[1] setPosition:ccp(323.6 + wholeBombOffsetX, -209.2 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[1] setRotation:-119.8];
                [bombingAniStruct[i]->s_debris[1] setScaleX:0.636];
                [bombingAniStruct[i]->s_debris[1] setScaleY:0.925];
                [bombingAniStruct[i]->s_debris[1] setOpacity:73/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[2] setPosition:ccp(419.8 + wholeBombOffsetX, -217.4 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[2] setRotation:-32.3];
                [bombingAniStruct[i]->s_debris[2] setScaleX:0.636];
                [bombingAniStruct[i]->s_debris[2] setScaleY:0.636];
                [bombingAniStruct[i]->s_debris[2] setOpacity:68.0/100.0 * 255.0];
                
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
                
                [bombingAniStruct[i]->s_bigClouds[5] setPosition:ccp(349.7 + wholeBombOffsetX, -256.3 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[5] setRotation:-8.3];
                [bombingAniStruct[i]->s_bigClouds[5] setScaleX:1.915 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[5] setScaleY:1.915 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[5] setOpacity:70.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[6] setPosition:ccp(341.6 + wholeBombOffsetX, -259.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[6] setRotation:-33.8];
                [bombingAniStruct[i]->s_bigClouds[6] setScaleX:1.797 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[6] setScaleY:1.797 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[6] setOpacity:69.0/100.0 * 255.0];
                
                
                [bombingAniStruct[i]->s_smallClouds[0] setPosition:ccp(339 + wholeBombOffsetX, -258.5 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[0] setRotation:47.6];
                [bombingAniStruct[i]->s_smallClouds[0] setScaleX:2.801 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[0] setScaleY:2.801 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[0] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[1] setPosition:ccp(347.0 + wholeBombOffsetX, -263.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[1] setRotation:-62.4];
                [bombingAniStruct[i]->s_smallClouds[1] setScaleX:1.606 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[1] setScaleY:1.606 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[1] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[2] setPosition:ccp(350.8 + wholeBombOffsetX, -245 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[2] setRotation:78.7];
                [bombingAniStruct[i]->s_smallClouds[2] setScaleX:1.956 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[2] setScaleY:1.956 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[2] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[3] setPosition:ccp(339.8 + wholeBombOffsetX, -251.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[3] setRotation:-130.4];
                [bombingAniStruct[i]->s_smallClouds[3] setScaleX:2.226 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[3] setScaleY:2.226 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[3] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[4] setPosition:ccp(358.8 + wholeBombOffsetX, -253.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[4] setRotation:0];
                [bombingAniStruct[i]->s_smallClouds[4] setScaleX:2.223 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[4] setScaleY:2.223 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[4] setOpacity:100.0/100.0 * 255.0];
            }
            
            //Frame 9
            if(bombingAniStruct[i]->aniTimer == 7){
                [bombingAniStruct[i]->s_wave setPosition:ccp(351.5 + wholeBombOffsetX, -265.4 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_wave setScaleX:1.045 * 2.099];
                [bombingAniStruct[i]->s_wave setScaleY:1.015 * 2.099];
                [bombingAniStruct[i]->s_wave setOpacity:47.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[0] setPosition:ccp(302.4 + wholeBombOffsetX, -293.1 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[0] setRotation:136.1];
                [bombingAniStruct[i]->s_debris[0] setScaleX:0.401];
                [bombingAniStruct[i]->s_debris[0] setScaleY:0.635];
                [bombingAniStruct[i]->s_debris[0] setOpacity:54.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[1] setPosition:ccp(316.1 + wholeBombOffsetX, -194.1 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[1] setRotation:-118.3];
                [bombingAniStruct[i]->s_debris[1] setScaleX:0.635];
                [bombingAniStruct[i]->s_debris[1] setScaleY:0.934];
                [bombingAniStruct[i]->s_debris[1] setOpacity:64.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[2] setPosition:ccp(437 + wholeBombOffsetX, -205.2 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[2] setRotation:-32.3];
                [bombingAniStruct[i]->s_debris[2] setScaleX:0.636];
                [bombingAniStruct[i]->s_debris[2] setScaleY:0.636];
                [bombingAniStruct[i]->s_debris[2] setOpacity:57.0/100.0 * 255.0];
                
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
                
                [bombingAniStruct[i]->s_bigClouds[5] setPosition:ccp(349.7 + wholeBombOffsetX, -256.3 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[5] setRotation:-3.3];
                [bombingAniStruct[i]->s_bigClouds[5] setScaleX:2.151 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[5] setScaleY:2.151 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[5] setOpacity:88.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[6] setPosition:ccp(341.6 + wholeBombOffsetX, -259.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[6] setRotation:-42.9];
                [bombingAniStruct[i]->s_bigClouds[6] setScaleX:2.04 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[6] setScaleY:2.04 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[6] setOpacity:88.0/100.0 * 255.0];
                
                
                [bombingAniStruct[i]->s_smallClouds[0] setPosition:ccp(333.4 + wholeBombOffsetX, -258.4 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[0] setRotation:53.6];
                [bombingAniStruct[i]->s_smallClouds[0] setScaleX:2.722 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[0] setScaleY:2.722 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[0] setOpacity:96.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[1] setPosition:ccp(344.6 + wholeBombOffsetX, -265.4 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[1] setRotation:-64.9];
                [bombingAniStruct[i]->s_smallClouds[1] setScaleX:1.57 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[1] setScaleY:1.57 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[1] setOpacity:96.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[2] setPosition:ccp(350.9 + wholeBombOffsetX, -241.7 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[2] setRotation:83.7];
                [bombingAniStruct[i]->s_smallClouds[2] setScaleX:1.91 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[2] setScaleY:1.91 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[2] setOpacity:96.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[3] setPosition:ccp(337.1 + wholeBombOffsetX, -248.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[3] setRotation:-130.4];
                [bombingAniStruct[i]->s_smallClouds[3] setScaleX:2.168 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[3] setScaleY:2.168 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[3] setOpacity:96.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[4] setPosition:ccp(362.6 + wholeBombOffsetX, -253.5 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[4] setRotation:-4.3];
                [bombingAniStruct[i]->s_smallClouds[4] setScaleX:2.174 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[4] setScaleY:2.174 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[4] setOpacity:96.0/100.0 * 255.0];
            }
            
            //Frame 10
            if(bombingAniStruct[i]->aniTimer == 8){
                [bombingAniStruct[i]->s_wave setPosition:ccp(351.5 + wholeBombOffsetX, -265.4 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_wave setScaleX:1.213 * 2.099];
                [bombingAniStruct[i]->s_wave setScaleY:1.213 * 2.099];
                [bombingAniStruct[i]->s_wave setOpacity:38.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[0] setPosition:ccp(292.1 + wholeBombOffsetX, -299.2 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[0] setRotation:135.4];
                [bombingAniStruct[i]->s_debris[0] setScaleX:0.397];
                [bombingAniStruct[i]->s_debris[0] setScaleY:0.635];
                [bombingAniStruct[i]->s_debris[0] setOpacity:42.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[1] setPosition:ccp(308.8 + wholeBombOffsetX, -179.2 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[1] setRotation:-116.6];
                [bombingAniStruct[i]->s_debris[1] setScaleX:0.635];
                [bombingAniStruct[i]->s_debris[1] setScaleY:0.943];
                [bombingAniStruct[i]->s_debris[1] setOpacity:55.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[2] setPosition:ccp(453.8 + wholeBombOffsetX, -193.2 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[2] setRotation:-32.3];
                [bombingAniStruct[i]->s_debris[2] setScaleX:0.636];
                [bombingAniStruct[i]->s_debris[2] setScaleY:0.636];
                [bombingAniStruct[i]->s_debris[2] setOpacity:47.0/100.0 * 255.0];
                
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
                
                [bombingAniStruct[i]->s_bigClouds[5] setPosition:ccp(349.7 + wholeBombOffsetX, -256.3 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[5] setRotation:0];
                [bombingAniStruct[i]->s_bigClouds[5] setScaleX:2.309 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[5] setScaleY:2.309 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[5] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[6] setPosition:ccp(341.6 + wholeBombOffsetX, -259.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[6] setRotation:-49.2];
                [bombingAniStruct[i]->s_bigClouds[6] setScaleX:2.208 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[6] setScaleY:2.208 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[6] setOpacity:100.0/100.0 * 255.0];
                
                
                [bombingAniStruct[i]->s_smallClouds[0] setPosition:ccp(326.9 + wholeBombOffsetX, -258.3 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[0] setRotation:60.4];
                [bombingAniStruct[i]->s_smallClouds[0] setScaleX:2.638 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[0] setScaleY:2.638 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[0] setOpacity:93.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[1] setPosition:ccp(341.7 + wholeBombOffsetX, -267.2 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[1] setRotation:-67.7];
                [bombingAniStruct[i]->s_smallClouds[1] setScaleX:1.531 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[1] setScaleY:1.531 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[1] setOpacity:93.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[2] setPosition:ccp(351.1 + wholeBombOffsetX, -237.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[2] setRotation:89.4];
                [bombingAniStruct[i]->s_smallClouds[2] setScaleX:1.858 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[2] setScaleY:1.858 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[2] setOpacity:93.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[3] setPosition:ccp(334.1 + wholeBombOffsetX, -245.2 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[3] setRotation:-130.6];
                [bombingAniStruct[i]->s_smallClouds[3] setScaleX:2.105 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[3] setScaleY:2.105 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[3] setOpacity:93.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[4] setPosition:ccp(367.1 + wholeBombOffsetX, -253.1 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[4] setRotation:-9.5];
                [bombingAniStruct[i]->s_smallClouds[4] setScaleX:2.11 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[4] setScaleY:2.11 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[4] setOpacity:93.0/100.0 * 255.0];
            }
            
            //Frame 11
            if(bombingAniStruct[i]->aniTimer == 9){
                [bombingAniStruct[i]->s_wave setPosition:ccp(351.5 + wholeBombOffsetX, -265.4 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_wave setScaleX:1.386 * 2.099];
                [bombingAniStruct[i]->s_wave setScaleY:1.386 * 2.099];
                [bombingAniStruct[i]->s_wave setOpacity:28.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[0] setPosition:ccp(282.2 + wholeBombOffsetX, -305.1 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[0] setRotation:134.4];
                [bombingAniStruct[i]->s_debris[0] setScaleX:0.393];
                [bombingAniStruct[i]->s_debris[0] setScaleY:0.635];
                [bombingAniStruct[i]->s_debris[0] setOpacity:32.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[1] setPosition:ccp(301.6 + wholeBombOffsetX, -164.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[1] setRotation:-115.1];
                [bombingAniStruct[i]->s_debris[1] setScaleX:0.635];
                [bombingAniStruct[i]->s_debris[1] setScaleY:0.952];
                [bombingAniStruct[i]->s_debris[1] setOpacity:46.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[2] setPosition:ccp(469.9 + wholeBombOffsetX, -181.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[2] setRotation:-32.3];
                [bombingAniStruct[i]->s_debris[2] setScaleX:0.636];
                [bombingAniStruct[i]->s_debris[2] setScaleY:0.636];
                [bombingAniStruct[i]->s_debris[2] setOpacity:38.0/100.0 * 255.0];
                
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
                
                [bombingAniStruct[i]->s_bigClouds[5] setPosition:ccp(349.7 + wholeBombOffsetX, -256.3 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[5] setRotation:1.5];
                [bombingAniStruct[i]->s_bigClouds[5] setScaleX:2.334 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[5] setScaleY:2.334 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[5] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[6] setPosition:ccp(341.6 + wholeBombOffsetX, -259.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[6] setRotation:-50.6];
                [bombingAniStruct[i]->s_bigClouds[6] setScaleX:2.226 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[6] setScaleY:2.226 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[6] setOpacity:100.0/100.0 * 255.0];
                
                
                [bombingAniStruct[i]->s_smallClouds[0] setPosition:ccp(319.6 + wholeBombOffsetX, -258.1 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[0] setRotation:68.2];
                [bombingAniStruct[i]->s_smallClouds[0] setScaleX:2.543 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[0] setScaleY:2.543 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[0] setOpacity:89.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[1] setPosition:ccp(338.5 + wholeBombOffsetX, -269.3 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[1] setRotation:-70.7];
                [bombingAniStruct[i]->s_smallClouds[1] setScaleX:1.487 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[1] setScaleY:1.487 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[1] setOpacity:89.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[2] setPosition:ccp(351.2 + wholeBombOffsetX, -233.6 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[2] setRotation:95.6];
                [bombingAniStruct[i]->s_smallClouds[2] setScaleX:1.78 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[2] setScaleY:1.78 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[2] setOpacity:89.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[3] setPosition:ccp(330.7 + wholeBombOffsetX, -241.4 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[3] setRotation:-130.6];
                [bombingAniStruct[i]->s_smallClouds[3] setScaleX:2.034 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[3] setScaleY:2.034 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[3] setOpacity:89.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[4] setPosition:ccp(372.2 + wholeBombOffsetX, -252.7 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[4] setRotation:-15.3];
                [bombingAniStruct[i]->s_smallClouds[4] setScaleX:2.038 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[4] setScaleY:2.038 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[4] setOpacity:89.0/100.0 * 255.0];
            }
            
            //Frame 12
            if(bombingAniStruct[i]->aniTimer == 10){
                [bombingAniStruct[i]->s_wave setPosition:ccp(351.5 + wholeBombOffsetX, -265.4 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_wave setScaleX:1.558 * 2.099];
                [bombingAniStruct[i]->s_wave setScaleY:1.558 * 2.099];
                [bombingAniStruct[i]->s_wave setOpacity:18.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[0] setPosition:ccp(273.1 + wholeBombOffsetX, -310.5 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[0] setRotation:133.6];
                [bombingAniStruct[i]->s_debris[0] setScaleX:0.389];
                [bombingAniStruct[i]->s_debris[0] setScaleY:0.635];
                [bombingAniStruct[i]->s_debris[0] setOpacity:22.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[1] setPosition:ccp(294.6 + wholeBombOffsetX, -150.9 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[1] setRotation:-113.6];
                [bombingAniStruct[i]->s_debris[1] setScaleX:0.635];
                [bombingAniStruct[i]->s_debris[1] setScaleY:0.96];
                [bombingAniStruct[i]->s_debris[1] setOpacity:38.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[2] setPosition:ccp(485.1 + wholeBombOffsetX, -170.9 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[2] setRotation:-32.3];
                [bombingAniStruct[i]->s_debris[2] setScaleX:0.636];
                [bombingAniStruct[i]->s_debris[2] setScaleY:0.636];
                [bombingAniStruct[i]->s_debris[2] setOpacity:28.0/100.0 * 255.0];
                
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
                
                [bombingAniStruct[i]->s_bigClouds[5] setPosition:ccp(349.7 + wholeBombOffsetX, -256.3 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[5] setRotation:3.8];
                [bombingAniStruct[i]->s_bigClouds[5] setScaleX:2.366 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[5] setScaleY:2.366 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[5] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[6] setPosition:ccp(341.6 + wholeBombOffsetX, -259.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[6] setRotation:-53.1];
                [bombingAniStruct[i]->s_bigClouds[6] setScaleX:2.262 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[6] setScaleY:2.262 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[6] setOpacity:100.0/100.0 * 255.0];
                
                
                [bombingAniStruct[i]->s_smallClouds[0] setPosition:ccp(311.4 + wholeBombOffsetX, -258.1 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[0] setRotation:76.9];
                [bombingAniStruct[i]->s_smallClouds[0] setScaleX:2.437 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[0] setScaleY:2.437 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[0] setOpacity:84.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[1] setPosition:ccp(334.9 + wholeBombOffsetX, -271.5 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[1] setRotation:-74.2];
                [bombingAniStruct[i]->s_smallClouds[1] setScaleX:1.438 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[1] setScaleY:1.438 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[1] setOpacity:84.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[2] setPosition:ccp(351.4 + wholeBombOffsetX, -228.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[2] setRotation:102.8];
                [bombingAniStruct[i]->s_smallClouds[2] setScaleX:1.731 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[2] setScaleY:1.731 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[2] setOpacity:84.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[3] setPosition:ccp(326.9 + wholeBombOffsetX, -236.0 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[3] setRotation:-130.9];
                [bombingAniStruct[i]->s_smallClouds[3] setScaleX:1.955 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[3] setScaleY:1.955 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[3] setOpacity:84/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[4] setPosition:ccp(377.8 + wholeBombOffsetX, -252.2 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[4] setRotation:-21.8];
                [bombingAniStruct[i]->s_smallClouds[4] setScaleX:1.959 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[4] setScaleY:1.959 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[4] setOpacity:84.0/100.0 * 255.0];
            }
            
            
            //Frame 13
            if(bombingAniStruct[i]->aniTimer == 11){
                [bombingAniStruct[i]->s_wave setPosition:ccp(351.5 + wholeBombOffsetX, -265.4 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_wave setScaleX:1.72 * 2.099];
                [bombingAniStruct[i]->s_wave setScaleY:1.72 * 2.099];
                [bombingAniStruct[i]->s_wave setOpacity:9.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[0] setPosition:ccp(264.8 + wholeBombOffsetX, -315.4 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[0] setRotation:133.1];
                [bombingAniStruct[i]->s_debris[0] setScaleX:0.386];
                [bombingAniStruct[i]->s_debris[0] setScaleY:0.635];
                [bombingAniStruct[i]->s_debris[0] setOpacity:13.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[1] setPosition:ccp(288.1 + wholeBombOffsetX, -137.6 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[1] setRotation:-112.6];
                [bombingAniStruct[i]->s_debris[1] setScaleX:0.635];
                [bombingAniStruct[i]->s_debris[1] setScaleY:0.969];
                [bombingAniStruct[i]->s_debris[1] setOpacity:30.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[2] setPosition:ccp(499.4 + wholeBombOffsetX, -160.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[2] setRotation:-32.3];
                [bombingAniStruct[i]->s_debris[2] setScaleX:0.636];
                [bombingAniStruct[i]->s_debris[2] setScaleY:0.636];
                [bombingAniStruct[i]->s_debris[2] setOpacity:19.0/100.0 * 255.0];
                
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
                
                [bombingAniStruct[i]->s_bigClouds[5] setPosition:ccp(349.7 + wholeBombOffsetX, -256.3 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[5] setRotation:6.0];
                [bombingAniStruct[i]->s_bigClouds[5] setScaleX:2.402 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[5] setScaleY:2.402 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[5] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[6] setPosition:ccp(341.4 + wholeBombOffsetX, -259.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[6] setRotation:-53.6];
                [bombingAniStruct[i]->s_bigClouds[6] setScaleX:2.312 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[6] setScaleY:2.312 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[6] setOpacity:100.0/100.0 * 255.0];
                
                
                [bombingAniStruct[i]->s_smallClouds[0] setPosition:ccp(302.6 + wholeBombOffsetX, -257.9 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[0] setRotation:86.2];
                [bombingAniStruct[i]->s_smallClouds[0] setScaleX:2.32 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[0] setScaleY:2.32 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[0] setOpacity:79.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[1] setPosition:ccp(330.9 + wholeBombOffsetX, -274.0 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[1] setRotation:-77.7];
                [bombingAniStruct[i]->s_smallClouds[1] setScaleX:1.384 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[1] setScaleY:1.384 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[1] setOpacity:79.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[2] setPosition:ccp(351.6 + wholeBombOffsetX, -223.6 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[2] setRotation:110.5];
                [bombingAniStruct[i]->s_smallClouds[2] setScaleX:1.658 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[2] setScaleY:1.658 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[2] setOpacity:79.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[3] setPosition:ccp(322.8 + wholeBombOffsetX, -232.2 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[3] setRotation:-131.1];
                [bombingAniStruct[i]->s_smallClouds[3] setScaleX:1.868 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[3] setScaleY:1.868 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[3] setOpacity:79.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[4] setPosition:ccp(383.9 + wholeBombOffsetX, -251.7 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[4] setRotation:-28.8];
                [bombingAniStruct[i]->s_smallClouds[4] setScaleX:1.872 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[4] setScaleY:1.872 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[4] setOpacity:79.0/100.0 * 255.0];
            }
            
            
            //Frame 14
            if(bombingAniStruct[i]->aniTimer == 12){
                [bombingAniStruct[i]->s_wave setPosition:ccp(10000 , 265)];
                
                [bombingAniStruct[i]->s_debris[0] setPosition:ccp(257.8 + wholeBombOffsetX, -319.5 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[0] setRotation:132.6];
                [bombingAniStruct[i]->s_debris[0] setScaleX:0.383];
                [bombingAniStruct[i]->s_debris[0] setScaleY:0.635];
                [bombingAniStruct[i]->s_debris[0] setOpacity:5.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[1] setPosition:ccp(281.9 + wholeBombOffsetX, -125.0 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[1] setRotation:-111.0];
                [bombingAniStruct[i]->s_debris[1] setScaleX:0.635];
                [bombingAniStruct[i]->s_debris[1] setScaleY:0.976];
                [bombingAniStruct[i]->s_debris[1] setOpacity:23.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[2] setPosition:ccp(512.2 + wholeBombOffsetX, -151.7 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[2] setRotation:-32.3];
                [bombingAniStruct[i]->s_debris[2] setScaleX:0.636];
                [bombingAniStruct[i]->s_debris[2] setScaleY:0.636];
                [bombingAniStruct[i]->s_debris[2] setOpacity:11.0/100.0 * 255.0];
                
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
                
                [bombingAniStruct[i]->s_bigClouds[5] setPosition:ccp(349.7 + wholeBombOffsetX, -256.3 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[5] setRotation:8.8];
                [bombingAniStruct[i]->s_bigClouds[5] setScaleX:2.444 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[5] setScaleY:2.444 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[5] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[6] setPosition:ccp(341.4 + wholeBombOffsetX, -259.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[6] setRotation:-60.9];
                [bombingAniStruct[i]->s_bigClouds[6] setScaleX:2.375 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[6] setScaleY:2.375 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[6] setOpacity:100.0/100.0 * 255.0];
                
                
                [bombingAniStruct[i]->s_smallClouds[0] setPosition:ccp(293.1 + wholeBombOffsetX, -257.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[0] setRotation:96.3];
                [bombingAniStruct[i]->s_smallClouds[0] setScaleX:2.196 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[0] setScaleY:2.196 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[0] setOpacity:73.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[1] setPosition:ccp(326.6 + wholeBombOffsetX, -276.6 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[1] setRotation:-81.9];
                [bombingAniStruct[i]->s_smallClouds[1] setScaleX:1.327 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[1] setScaleY:1.327 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[1] setOpacity:73.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[2] setPosition:ccp(351.8 + wholeBombOffsetX, -217.9 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[2] setRotation:118.9];
                [bombingAniStruct[i]->s_smallClouds[2] setScaleX:1.58 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[2] setScaleY:1.58 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[2] setOpacity:73.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[3] setPosition:ccp(318.3 + wholeBombOffsetX, -226.9 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[3] setRotation:-131.1];
                [bombingAniStruct[i]->s_smallClouds[3] setScaleX:1.775 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[3] setScaleY:1.775 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[3] setOpacity:73.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[4] setPosition:ccp(390.6 + wholeBombOffsetX, -251.2 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[4] setRotation:-36.3];
                [bombingAniStruct[i]->s_smallClouds[4] setScaleX:1.778 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[4] setScaleY:1.778 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[4] setOpacity:73.0/100.0 * 255.0];
                
            }
            
            
            //Frame 15
            if(bombingAniStruct[i]->aniTimer == 13){
                
                [bombingAniStruct[i]->s_debris[0] setPosition:ccp(10000, 319.5)];
                
                [bombingAniStruct[i]->s_debris[1] setPosition:ccp(276.1 + wholeBombOffsetX, -113.3 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[1] setRotation:-109.8];
                [bombingAniStruct[i]->s_debris[1] setScaleX:0.635];
                [bombingAniStruct[i]->s_debris[1] setScaleY:0.984];
                [bombingAniStruct[i]->s_debris[1] setOpacity:16.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[2] setPosition:ccp(523.0 + wholeBombOffsetX, -143.9 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[2] setRotation:-32.3];
                [bombingAniStruct[i]->s_debris[2] setScaleX:0.636];
                [bombingAniStruct[i]->s_debris[2] setScaleY:0.636];
                [bombingAniStruct[i]->s_debris[2] setOpacity:5.0/100.0 * 255.0];
                
                
                
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
                
                [bombingAniStruct[i]->s_bigClouds[5] setPosition:ccp(349.7 + wholeBombOffsetX, -256.3 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[5] setRotation:13.0];
                [bombingAniStruct[i]->s_bigClouds[5] setScaleX:2.492 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[5] setScaleY:2.495 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[5] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[6] setPosition:ccp(341.4 + wholeBombOffsetX, -259.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[6] setRotation:-65.9];
                [bombingAniStruct[i]->s_bigClouds[6] setScaleX:2.453 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[6] setScaleY:2.453 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[6] setOpacity:100.0/100.0 * 255.0];
                
                
                [bombingAniStruct[i]->s_smallClouds[0] setPosition:ccp(282.9 + wholeBombOffsetX, -257.7 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[0] setRotation:107.1];
                [bombingAniStruct[i]->s_smallClouds[0] setScaleX:2.06 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[0] setScaleY:2.06 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[0] setOpacity:67.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[1] setPosition:ccp(322.1 + wholeBombOffsetX, -279.6 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[1] setRotation:-86.2];
                [bombingAniStruct[i]->s_smallClouds[1] setScaleX:1.265 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[1] setScaleY:1.265 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[1] setOpacity:67.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[2] setPosition:ccp(352.1 + wholeBombOffsetX, -211.9 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[2] setRotation:127.9];
                [bombingAniStruct[i]->s_smallClouds[2] setScaleX:1.497 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[2] setScaleY:1.497 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[2] setOpacity:67.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[3] setPosition:ccp(313.6 + wholeBombOffsetX, -221.5 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[3] setRotation:-131.4];
                [bombingAniStruct[i]->s_smallClouds[3] setScaleX:1.676 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[3] setScaleY:1.676 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[3] setOpacity:67.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[4] setPosition:ccp(397.6 + wholeBombOffsetX, -250.6 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[4] setRotation:-44.4];
                [bombingAniStruct[i]->s_smallClouds[4] setScaleX:1.678 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[4] setScaleY:1.678 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[4] setOpacity:67.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[7] setPosition:ccp(351.0 + wholeBombOffsetX, -261.0 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[7] setRotation:-34.6];
                [bombingAniStruct[i]->s_bigClouds[7] setScaleX:0.859 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[7] setScaleY:0.859 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[7] setOpacity:27.0/100.0 * 255.0];
                
            }
            
            
            //Frame 16
            if(bombingAniStruct[i]->aniTimer == 14){
                
                
                [bombingAniStruct[i]->s_debris[1] setPosition:ccp(270.9 + wholeBombOffsetX, -102.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[1] setRotation:-108.6];
                [bombingAniStruct[i]->s_debris[1] setScaleX:0.635];
                [bombingAniStruct[i]->s_debris[1] setScaleY:0.99];
                [bombingAniStruct[i]->s_debris[1] setOpacity:9.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[2] setPosition:ccp(10000 , 143.9)];
                
                
                
                
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
                
                [bombingAniStruct[i]->s_bigClouds[5] setPosition:ccp(349.8 + wholeBombOffsetX, -256.2 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[5] setRotation:15.3];
                [bombingAniStruct[i]->s_bigClouds[5] setScaleX:2.542 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[5] setScaleY:2.542 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[5] setOpacity:90.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[6] setPosition:ccp(341.4 + wholeBombOffsetX, -259.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[6] setRotation:-71.7];
                [bombingAniStruct[i]->s_bigClouds[6] setScaleX:2.535 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[6] setScaleY:2.535 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[6] setOpacity:86.0/100.0 * 255.0];
                
                
                [bombingAniStruct[i]->s_smallClouds[0] setPosition:ccp(272.1 + wholeBombOffsetX, -257.6 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[0] setRotation:118.6];
                [bombingAniStruct[i]->s_smallClouds[0] setScaleX:1.918 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[0] setScaleY:1.918 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[0] setOpacity:60.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[1] setPosition:ccp(317.4 + wholeBombOffsetX, -282.6 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[1] setRotation:-90.5];
                [bombingAniStruct[i]->s_smallClouds[1] setScaleX:1.20 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[1] setScaleY:1.20 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[1] setOpacity:60.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[2] setPosition:ccp(352.3 + wholeBombOffsetX, -205.7 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[2] setRotation:137.4];
                [bombingAniStruct[i]->s_smallClouds[2] setScaleX:1.409 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[2] setScaleY:1.409 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[2] setOpacity:60.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[3] setPosition:ccp(308.4 + wholeBombOffsetX, -215.7 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[3] setRotation:-131.6];
                [bombingAniStruct[i]->s_smallClouds[3] setScaleX:1.571 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[3] setScaleY:1.571 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[3] setOpacity:60.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[4] setPosition:ccp(405.1 + wholeBombOffsetX, -250.1 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[4] setRotation:-52.9];
                [bombingAniStruct[i]->s_smallClouds[4] setScaleX:1.574 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[4] setScaleY:1.574 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[4] setOpacity:60.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[7] setPosition:ccp(351.0 + wholeBombOffsetX, -261.0 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[7] setRotation:-20.8];
                [bombingAniStruct[i]->s_bigClouds[7] setScaleX:1.131 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[7] setScaleY:1.131 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[7] setOpacity:56.0/100.0 * 255.0];
                
            }
            
            
            //Frame 17
            if(bombingAniStruct[i]->aniTimer == 15){
                [bombingAniStruct[i]->s_debris[1] setPosition:ccp(266.4 + wholeBombOffsetX, -93.9 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[1] setRotation:-107.6];
                [bombingAniStruct[i]->s_debris[1] setScaleX:0.635];
                [bombingAniStruct[i]->s_debris[1] setScaleY:0.996];
                [bombingAniStruct[i]->s_debris[1] setOpacity:4.0/100.0 * 255.0];
                
                
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
                
                [bombingAniStruct[i]->s_bigClouds[5] setPosition:ccp(349.8 + wholeBombOffsetX, -256.2 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[5] setRotation:19.0];
                [bombingAniStruct[i]->s_bigClouds[5] setScaleX:2.596 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[5] setScaleY:2.596 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[5] setOpacity:79.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[6] setPosition:ccp(341.6 + wholeBombOffsetX, -259.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[6] setRotation:-77.7];
                [bombingAniStruct[i]->s_bigClouds[6] setScaleX:2.627 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[6] setScaleY:2.627 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[6] setOpacity:72.0/100.0 * 255.0];
                
                
                [bombingAniStruct[i]->s_smallClouds[0] setPosition:ccp(260.9 + wholeBombOffsetX, -257.4 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[0] setRotation:130.6];
                [bombingAniStruct[i]->s_smallClouds[0] setScaleX:1.771 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[0] setScaleY:1.771 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[0] setOpacity:54.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[1] setPosition:ccp(312.4 + wholeBombOffsetX, -285.7 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[1] setRotation:-95.3];
                [bombingAniStruct[i]->s_smallClouds[1] setScaleX:1.132 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[1] setScaleY:1.132 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[1] setOpacity:54.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[2] setPosition:ccp(352.6 + wholeBombOffsetX, -199.1 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[2] setRotation:147.2];
                [bombingAniStruct[i]->s_smallClouds[2] setScaleX:1.318 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[2] setScaleY:1.318 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[2] setOpacity:54.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[3] setPosition:ccp(303.2 + wholeBombOffsetX, -209.7 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[3] setRotation:-131.8];
                [bombingAniStruct[i]->s_smallClouds[3] setScaleX:1.462 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[3] setScaleY:1.462 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[3] setOpacity:54.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[4] setPosition:ccp(412.8 + wholeBombOffsetX, -249.3 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[4] setRotation:-61.9];
                [bombingAniStruct[i]->s_smallClouds[4] setScaleX:1.465 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[4] setScaleY:1.465 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[4] setOpacity:54.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[7] setPosition:ccp(351.0 + wholeBombOffsetX, -261.0 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[7] setRotation:-8.8];
                [bombingAniStruct[i]->s_bigClouds[7] setScaleX:1.37 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[7] setScaleY:1.37 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[7] setOpacity:82.0/100.0 * 255.0];
                
            }
            
            
            //Frame 18
            if(bombingAniStruct[i]->aniTimer == 16){
                [bombingAniStruct[i]->s_debris[1] setPosition:ccp(10000, 93.9)];
                
                
                
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
                
                [bombingAniStruct[i]->s_bigClouds[5] setPosition:ccp(349.8 + wholeBombOffsetX, -256.2 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[5] setRotation:22.8];
                [bombingAniStruct[i]->s_bigClouds[5] setScaleX:2.654 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[5] setScaleY:2.654 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[5] setOpacity:68.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[6] setPosition:ccp(341.6 + wholeBombOffsetX, -259.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[6] setRotation:-84.0];
                [bombingAniStruct[i]->s_bigClouds[6] setScaleX:2.722 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[6] setScaleY:2.722 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[6] setOpacity:57.0/100.0 * 255.0];
                
                
                [bombingAniStruct[i]->s_smallClouds[0] setPosition:ccp(249.3 + wholeBombOffsetX, -257.2 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[0] setRotation:142.7];
                [bombingAniStruct[i]->s_smallClouds[0] setScaleX:1.619 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[0] setScaleY:1.619 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[0] setOpacity:47.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[1] setPosition:ccp(307.3 + wholeBombOffsetX, -288.9 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[1] setRotation:-100.0];
                [bombingAniStruct[i]->s_smallClouds[1] setScaleX:1.062 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[1] setScaleY:1.062 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[1] setOpacity:47.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[2] setPosition:ccp(352.8 + wholeBombOffsetX, -192.2 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[2] setRotation:157.4];
                [bombingAniStruct[i]->s_smallClouds[2] setScaleX:1.225 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[2] setScaleY:1.225 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[2] setOpacity:47.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[3] setPosition:ccp(297.9 + wholeBombOffsetX, -203.5 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[3] setRotation:-132.1];
                [bombingAniStruct[i]->s_smallClouds[3] setScaleX:1.35 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[3] setScaleY:1.35 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[3] setOpacity:47.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[4] setPosition:ccp(420.7 + wholeBombOffsetX, -248.7 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[4] setRotation:-71];
                [bombingAniStruct[i]->s_smallClouds[4] setScaleX:1.353 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[4] setScaleY:1.353 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[4] setOpacity:47.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[7] setPosition:ccp(351.0 + wholeBombOffsetX, -261.0 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[7] setRotation:0];
                [bombingAniStruct[i]->s_bigClouds[7] setScaleX:1.544 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[7] setScaleY:1.544 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[7] setOpacity:100.0/100.0 * 255.0];
                
            }
            
            
            
            //Frame 19
            if(bombingAniStruct[i]->aniTimer == 17){
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
                
                [bombingAniStruct[i]->s_bigClouds[5] setPosition:ccp(349.8 + wholeBombOffsetX, -256.2 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[5] setRotation:26.6];
                [bombingAniStruct[i]->s_bigClouds[5] setScaleX:2.713 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[5] setScaleY:2.713 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[5] setOpacity:56.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[6] setPosition:ccp(341.6 + wholeBombOffsetX, -259.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[6] setRotation:-90.3];
                [bombingAniStruct[i]->s_bigClouds[6] setScaleX:2.818 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[6] setScaleY:2.818 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[6] setOpacity:41.0/100.0 * 255.0];
                
                
                [bombingAniStruct[i]->s_smallClouds[0] setPosition:ccp(237.7 + wholeBombOffsetX, -257.1 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[0] setRotation:155.2];
                [bombingAniStruct[i]->s_smallClouds[0] setScaleX:1.466 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[0] setScaleY:1.466 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[0] setOpacity:40.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[1] setPosition:ccp(302.1 + wholeBombOffsetX, -292.2 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[1] setRotation:-105.0];
                [bombingAniStruct[i]->s_smallClouds[1] setScaleX:0.99 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[1] setScaleY:0.99 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[1] setOpacity:40.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[2] setPosition:ccp(353.1 + wholeBombOffsetX, -185.3 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[2] setRotation:167.7];
                [bombingAniStruct[i]->s_smallClouds[2] setScaleX:1.13 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[2] setScaleY:1.13 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[2] setOpacity:40.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[3] setPosition:ccp(292.4 + wholeBombOffsetX, -197.1 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[3] setRotation:-132.1];
                [bombingAniStruct[i]->s_smallClouds[3] setScaleX:1.236 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[3] setScaleY:1.236 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[3] setOpacity:40.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[4] setPosition:ccp(428.8 + wholeBombOffsetX, -248.1 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[4] setRotation:-80.2];
                [bombingAniStruct[i]->s_smallClouds[4] setScaleX:1.239 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[4] setScaleY:1.239 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[4] setOpacity:40.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[7] setPosition:ccp(351.0 + wholeBombOffsetX, -261.0 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[7] setRotation:8];
                [bombingAniStruct[i]->s_bigClouds[7] setScaleX:1.592 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[7] setScaleY:1.592 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[7] setOpacity:91.0/100.0 * 255.0];
                
            }
            
            
            //Frame 20
            if(bombingAniStruct[i]->aniTimer == 18){
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
                
                [bombingAniStruct[i]->s_bigClouds[5] setPosition:ccp(349.8 + wholeBombOffsetX, -256.2 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[5] setRotation:30.6];
                [bombingAniStruct[i]->s_bigClouds[5] setScaleX:2.773 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[5] setScaleY:2.773 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[5] setOpacity:44.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[6] setPosition:ccp(341.6 + wholeBombOffsetX, -259.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[6] setRotation:-96.3];
                [bombingAniStruct[i]->s_bigClouds[6] setScaleX:2.909 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[6] setScaleY:2.909 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[6] setOpacity:27.0/100.0 * 255.0];
                
                
                [bombingAniStruct[i]->s_smallClouds[0] setPosition:ccp(225.8 + wholeBombOffsetX, -256.9 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[0] setRotation:167.7];
                [bombingAniStruct[i]->s_smallClouds[0] setScaleX:1.312 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[0] setScaleY:1.312 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[0] setOpacity:33.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[1] setPosition:ccp(296.9 + wholeBombOffsetX, -295.4 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[1] setRotation:-110.0];
                [bombingAniStruct[i]->s_smallClouds[1] setScaleX:0.919 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[1] setScaleY:0.919 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[1] setOpacity:33.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[2] setPosition:ccp(353.4 + wholeBombOffsetX, -178.4 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[2] setRotation:178.0];
                [bombingAniStruct[i]->s_smallClouds[2] setScaleX:1.035 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[2] setScaleY:1.035 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[2] setOpacity:33.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[3] setPosition:ccp(286.9 + wholeBombOffsetX, -190.7 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[3] setRotation:-132.4];
                [bombingAniStruct[i]->s_smallClouds[3] setScaleX:1.122 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[3] setScaleY:1.122 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[3] setOpacity:33.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[4] setPosition:ccp(436.9 + wholeBombOffsetX, -247.3 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[4] setRotation:-89.7];
                [bombingAniStruct[i]->s_smallClouds[4] setScaleX:1.125 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[4] setScaleY:1.125 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[4] setOpacity:33.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[7] setPosition:ccp(351.0 + wholeBombOffsetX, -261.0 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[7] setRotation:18.8];
                [bombingAniStruct[i]->s_bigClouds[7] setScaleX:1.657 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[7] setScaleY:1.657 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[7] setOpacity:79.0/100.0 * 255.0];
                
            }
            
            
            //Frame 21
            if(bombingAniStruct[i]->aniTimer == 19){
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
                
                [bombingAniStruct[i]->s_bigClouds[5] setPosition:ccp(349.8 + wholeBombOffsetX, -256.2 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[5] setRotation:34.6];
                [bombingAniStruct[i]->s_bigClouds[5] setScaleX:2.532 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[5] setScaleY:2.532 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[5] setOpacity:32.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[6] setPosition:ccp(341.6 + wholeBombOffsetX, -259.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[6] setRotation:-102.0];
                [bombingAniStruct[i]->s_bigClouds[6] setScaleX:2.995 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[6] setScaleY:2.995 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[6] setOpacity:13.0/100.0 * 255.0];
                
                
                [bombingAniStruct[i]->s_smallClouds[0] setPosition:ccp(214.0 + wholeBombOffsetX, -256.9 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[0] setRotation:180];
                [bombingAniStruct[i]->s_smallClouds[0] setScaleX:1.158 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[0] setScaleY:1.158 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[0] setOpacity:26.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[1] setPosition:ccp(291.6 + wholeBombOffsetX, -298.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[1] setRotation:-115.0];
                [bombingAniStruct[i]->s_smallClouds[1] setScaleX:0.847 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[1] setScaleY:0.847 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[1] setOpacity:26.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[2] setPosition:ccp(353.6 + wholeBombOffsetX, -171.6 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[2] setRotation:171.9];
                [bombingAniStruct[i]->s_smallClouds[2] setScaleX:0.939 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[2] setScaleY:0.939 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[2] setOpacity:26.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[3] setPosition:ccp(281.4 + wholeBombOffsetX, -184.3 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[3] setRotation:-132.4];
                [bombingAniStruct[i]->s_smallClouds[3] setScaleX:1.007 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[3] setScaleY:1.007 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[3] setOpacity:26.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[4] setPosition:ccp(445.0 + wholeBombOffsetX, -246.7 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[4] setRotation:-98.8];
                [bombingAniStruct[i]->s_smallClouds[4] setScaleX:1.01 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[4] setScaleY:1.01 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[4] setOpacity:26.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[7] setPosition:ccp(351.0 + wholeBombOffsetX, -261.0 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[7] setRotation:318];
                [bombingAniStruct[i]->s_bigClouds[7] setScaleX:1.734 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[7] setScaleY:1.734 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[7] setOpacity:65.0/100.0 * 255.0];
                
            }
            
            
            
            //Frame 22
            if(bombingAniStruct[i]->aniTimer == 20){
                [bombingAniStruct[i]->s_bigClouds[0] setPosition:ccp(41500.0, -341.1)];
                [bombingAniStruct[i]->s_bigClouds[1] setPosition:ccp(41500.0, -341.1)];
                [bombingAniStruct[i]->s_bigClouds[2] setPosition:ccp(41500.0, -341.1)];
                [bombingAniStruct[i]->s_bigClouds[3] setPosition:ccp(41500.0, -341.1)];
                [bombingAniStruct[i]->s_bigClouds[4] setPosition:ccp(41500.0, -341.1)];
                [bombingAniStruct[i]->s_bigClouds[6] setPosition:ccp(41500.0, -341.1)];
                
                [bombingAniStruct[i]->s_bigClouds[5] setPosition:ccp(349.8 + wholeBombOffsetX, -256.2 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[5] setRotation:38.4];
                [bombingAniStruct[i]->s_bigClouds[5] setScaleX:2.889 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[5] setScaleY:2.889 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[5] setOpacity:21.0/100.0 * 255.0];
                
                
                
                [bombingAniStruct[i]->s_smallClouds[0] setPosition:ccp(202.5 + wholeBombOffsetX, -256.5 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[0] setRotation:167.7];
                [bombingAniStruct[i]->s_smallClouds[0] setScaleX:1.006 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[0] setScaleY:1.006 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[0] setOpacity:19.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[1] setPosition:ccp(286.6 + wholeBombOffsetX, -302.0 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[1] setRotation:-119.8];
                [bombingAniStruct[i]->s_smallClouds[1] setScaleX:0.777 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[1] setScaleY:0.777 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[1] setOpacity:19.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[2] setPosition:ccp(353.6 + wholeBombOffsetX, -164.7 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[2] setRotation:161.7];
                [bombingAniStruct[i]->s_smallClouds[2] setScaleX:0.844 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[2] setScaleY:0.844 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[2] setOpacity:19.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[3] setPosition:ccp(276.1 + wholeBombOffsetX, -178.2 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[3] setRotation:-132.9];
                [bombingAniStruct[i]->s_smallClouds[3] setScaleX:0.895 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[3] setScaleY:0.895 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[3] setOpacity:19.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[4] setPosition:ccp(453.0 + wholeBombOffsetX, -246.1 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[4] setRotation:-107.8];
                [bombingAniStruct[i]->s_smallClouds[4] setScaleX:0.897 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[4] setScaleY:0.897 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[4] setOpacity:19.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[7] setPosition:ccp(351.0 + wholeBombOffsetX, -261.0 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[7] setRotation:46.4];
                [bombingAniStruct[i]->s_bigClouds[7] setScaleX:1.822 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[7] setScaleY:1.822 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[7] setOpacity:49.0/100.0 * 255.0];
                
            }
            
            
            //Frame 23
            if(bombingAniStruct[i]->aniTimer == 21){
                
                [bombingAniStruct[i]->s_bigClouds[5] setPosition:ccp(349.8 + wholeBombOffsetX, -256.2 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[5] setRotation:41.9];
                [bombingAniStruct[i]->s_bigClouds[5] setScaleX:2.944 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[5] setScaleY:2.944 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[5] setOpacity:10.0/100.0 * 255.0];
                
                
                
                [bombingAniStruct[i]->s_smallClouds[0] setPosition:ccp(191.2 + wholeBombOffsetX, -256.4 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[0] setRotation:155.7];
                [bombingAniStruct[i]->s_smallClouds[0] setScaleX:0.858 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[0] setScaleY:0.858 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[0] setOpacity:13.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[1] setPosition:ccp(281.6 + wholeBombOffsetX, -305.1 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[1] setRotation:-124.6];
                [bombingAniStruct[i]->s_smallClouds[1] setScaleX:0.709 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[1] setScaleY:0.709 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[1] setOpacity:13.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[2] setPosition:ccp(354.1 + wholeBombOffsetX, -158.1 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[2] setRotation:151.9];
                [bombingAniStruct[i]->s_smallClouds[2] setScaleX:0.753 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[2] setScaleY:0.753 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[2] setOpacity:13.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[3] setPosition:ccp(270.8 + wholeBombOffsetX, -172.2 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[3] setRotation:-133.1];
                [bombingAniStruct[i]->s_smallClouds[3] setScaleX:0.786 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[3] setScaleY:0.786 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[3] setOpacity:13.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[4] setPosition:ccp(460.8 + wholeBombOffsetX, -245.4 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[4] setRotation:-116.8];
                [bombingAniStruct[i]->s_smallClouds[4] setScaleX:0.787 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[4] setScaleY:0.787 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[4] setOpacity:13.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[7] setPosition:ccp(351.0 + wholeBombOffsetX, -261.0 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[7] setRotation:61.9];
                [bombingAniStruct[i]->s_bigClouds[7] setScaleX:1.916 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[7] setScaleY:1.916 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[7] setOpacity:32.0/100.0 * 255.0];
                
            }
            
            //Frame 24
            if(bombingAniStruct[i]->aniTimer == 22){
                
                [bombingAniStruct[i]->s_bigClouds[5] setPosition:ccp(34900.8 , -256.2)];
                
                
                [bombingAniStruct[i]->s_smallClouds[0] setPosition:ccp(180.5 + wholeBombOffsetX, -256.2 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[0] setRotation:144.4];
                [bombingAniStruct[i]->s_smallClouds[0] setScaleX:0.716 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[0] setScaleY:0.716 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[0] setOpacity:6.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[1] setPosition:ccp(276.8 + wholeBombOffsetX, -308.1 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[1] setRotation:-129.1];
                [bombingAniStruct[i]->s_smallClouds[1] setScaleX:0.644 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[1] setScaleY:0.644 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[1] setOpacity:6.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[2] setPosition:ccp(354.1 + wholeBombOffsetX, -151.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[2] setRotation:142.4];
                [bombingAniStruct[i]->s_smallClouds[2] setScaleX:0.665 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[2] setScaleY:0.665 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[2] setOpacity:6.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[3] setPosition:ccp(265.8 + wholeBombOffsetX, -166.2 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[3] setRotation:-133.2];
                [bombingAniStruct[i]->s_smallClouds[3] setScaleX:0.681 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[3] setScaleY:0.681 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[3] setOpacity:6.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[4] setPosition:ccp(468.2 + wholeBombOffsetX, -244.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[4] setRotation:-125.3];
                [bombingAniStruct[i]->s_smallClouds[4] setScaleX:0.682 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[4] setScaleY:0.682 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[4] setOpacity:6.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[7] setPosition:ccp(351.0 + wholeBombOffsetX, -261.0 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[7] setRotation:77.0];
                [bombingAniStruct[i]->s_bigClouds[7] setScaleX:2.008 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[7] setScaleY:2.008 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[7] setOpacity:15.0/100.0 * 255.0];
                
            }
            
            
            if(bombingAniStruct[i]->aniTimer == 23){
                [bombingAniStruct[i]->s_smallClouds[0] setPosition:ccp(34900.8 , -256.2)];
                [bombingAniStruct[i]->s_smallClouds[1] setPosition:ccp(34900.8 , -256.2)];
                [bombingAniStruct[i]->s_smallClouds[2] setPosition:ccp(34900.8 , -256.2)];
                [bombingAniStruct[i]->s_smallClouds[3] setPosition:ccp(34900.8 , -256.2)];
                [bombingAniStruct[i]->s_smallClouds[4] setPosition:ccp(34900.8 , -256.2)];
                [bombingAniStruct[i]->s_bigClouds[7] setPosition:ccp(34900.8 , -256.2)];
                
                bombingAniStruct[i]->isAni = false;
            }
            
            //printf("M2:%i %i\n",i, bombingAniStruct[i]->aniTimer);
            
        }//end if bombingAniStrut i isAni
        
        
    }
    
    
    
}

-(void) manageBombComboAni{
    static float wholeBombOffsetX = 0;
    static float wholeBombOffsetY = 0;
    
    
    for(int i = 0 ; i < bombingAniMax ; i++){
        
        if(bombingAniStruct[i]->isAniCombo){
            
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
                
                [bombingAniStruct[i]->s_bigClouds[5] setPosition:ccp(349.8 + wholeBombOffsetX, -256.4 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[5] setRotation:-14.6];
                [bombingAniStruct[i]->s_bigClouds[5] setScaleX:1.613 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[5] setScaleY:1.613 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[5] setOpacity:47.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[6] setPosition:ccp(341.6 + wholeBombOffsetX, -259.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[6] setRotation:-22.6];
                [bombingAniStruct[i]->s_bigClouds[6] setScaleX:1.499 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[6] setScaleY:1.499 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[6] setOpacity:46.0/100.0 * 255.0];
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
                
                [bombingAniStruct[i]->s_bigClouds[5] setPosition:ccp(349.7 + wholeBombOffsetX, -256.3 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[5] setRotation:-8.3];
                [bombingAniStruct[i]->s_bigClouds[5] setScaleX:1.915 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[5] setScaleY:1.915 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[5] setOpacity:70.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[6] setPosition:ccp(341.6 + wholeBombOffsetX, -259.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[6] setRotation:-33.8];
                [bombingAniStruct[i]->s_bigClouds[6] setScaleX:1.797 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[6] setScaleY:1.797 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[6] setOpacity:69.0/100.0 * 255.0];
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
                
                [bombingAniStruct[i]->s_debris[0] setPosition:ccp(345.8 + wholeBombOffsetX, -267.5 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[0] setRotation:139.6];
                [bombingAniStruct[i]->s_debris[0] setScaleX:0.419];
                [bombingAniStruct[i]->s_debris[0] setScaleY:0.636];
                [bombingAniStruct[i]->s_debris[0] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[1] setPosition:ccp(345.8 + wholeBombOffsetX, -254.0 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[1] setRotation:-124.6];
                [bombingAniStruct[i]->s_debris[1] setScaleX:0.636];
                [bombingAniStruct[i]->s_debris[1] setScaleY:0.899];
                [bombingAniStruct[i]->s_debris[1] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[2] setPosition:ccp(367.8 + wholeBombOffsetX, -254.5 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[2] setRotation:-32.3];
                [bombingAniStruct[i]->s_debris[2] setScaleX:0.636];
                [bombingAniStruct[i]->s_debris[2] setScaleY:0.636];
                [bombingAniStruct[i]->s_debris[2] setOpacity:100.0/100.0 * 255.0];
                
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
                
                [bombingAniStruct[i]->s_bigClouds[5] setPosition:ccp(349.7 + wholeBombOffsetX, -256.3 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[5] setRotation:-3.3];
                [bombingAniStruct[i]->s_bigClouds[5] setScaleX:2.151 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[5] setScaleY:2.151 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[5] setOpacity:88.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[6] setPosition:ccp(341.6 + wholeBombOffsetX, -259.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[6] setRotation:-42.9];
                [bombingAniStruct[i]->s_bigClouds[6] setScaleX:2.04 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[6] setScaleY:2.04 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[6] setOpacity:88.0/100.0 * 255.0];
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
                
                [bombingAniStruct[i]->s_debris[0] setPosition:ccp(335.3 + wholeBombOffsetX, -273.6 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[0] setRotation:138.9];
                [bombingAniStruct[i]->s_debris[0] setScaleX:0.424];
                [bombingAniStruct[i]->s_debris[0] setScaleY:0.635];
                [bombingAniStruct[i]->s_debris[0] setOpacity:89.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[1] setPosition:ccp(338.6 + wholeBombOffsetX, -239.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[1] setRotation:-123.1];
                [bombingAniStruct[i]->s_debris[1] setScaleX:0.636];
                [bombingAniStruct[i]->s_debris[1] setScaleY:0.899];
                [bombingAniStruct[i]->s_debris[1] setOpacity:91.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[2] setPosition:ccp(384.5 + wholeBombOffsetX, -242.6 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[2] setRotation:-32.3];
                [bombingAniStruct[i]->s_debris[2] setScaleX:0.636];
                [bombingAniStruct[i]->s_debris[2] setScaleY:0.636];
                [bombingAniStruct[i]->s_debris[2] setOpacity:90.0/100.0 * 255.0];
                
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
                
                [bombingAniStruct[i]->s_bigClouds[5] setPosition:ccp(349.7 + wholeBombOffsetX, -256.3 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[5] setRotation:0];
                [bombingAniStruct[i]->s_bigClouds[5] setScaleX:2.309 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[5] setScaleY:2.309 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[5] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[6] setPosition:ccp(341.6 + wholeBombOffsetX, -259.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[6] setRotation:-49.2];
                [bombingAniStruct[i]->s_bigClouds[6] setScaleX:2.208 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[6] setScaleY:2.208 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[6] setOpacity:100.0/100.0 * 255.0];
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
                
                [bombingAniStruct[i]->s_debris[0] setPosition:ccp(324.1 + wholeBombOffsetX, -280.2 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[0] setRotation:137.9];
                [bombingAniStruct[i]->s_debris[0] setScaleX:0.424];
                [bombingAniStruct[i]->s_debris[0] setScaleY:0.635];
                [bombingAniStruct[i]->s_debris[0] setOpacity:77.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[1] setPosition:ccp(331.1 + wholeBombOffsetX, -224.4 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[1] setRotation:-121.4];
                [bombingAniStruct[i]->s_debris[1] setScaleX:0.636];
                [bombingAniStruct[i]->s_debris[1] setScaleY:0.899];
                [bombingAniStruct[i]->s_debris[1] setOpacity:82.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[2] setPosition:ccp(402.1 + wholeBombOffsetX, -230.0 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[2] setRotation:-32.3];
                [bombingAniStruct[i]->s_debris[2] setScaleX:0.636];
                [bombingAniStruct[i]->s_debris[2] setScaleY:0.636];
                [bombingAniStruct[i]->s_debris[2] setOpacity:79.0/100.0 * 255.0];
                
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
                
                [bombingAniStruct[i]->s_bigClouds[5] setPosition:ccp(349.7 + wholeBombOffsetX, -256.3 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[5] setRotation:1.5];
                [bombingAniStruct[i]->s_bigClouds[5] setScaleX:2.334 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[5] setScaleY:2.334 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[5] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[6] setPosition:ccp(341.6 + wholeBombOffsetX, -259.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[6] setRotation:-50.6];
                [bombingAniStruct[i]->s_bigClouds[6] setScaleX:2.226 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[6] setScaleY:2.226 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[6] setOpacity:100.0/100.0 * 255.0];
                
            }
            
            //Frame 8
            if(bombingAniStruct[i]->aniTimer == 6){
                [bombingAniStruct[i]->s_blick setPosition:ccp(10000 , 261.5)];
                
                [bombingAniStruct[i]->s_wave setPosition:ccp(351.5 + wholeBombOffsetX, -265.4 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_wave setScaleX:0.89 * 2.099];
                [bombingAniStruct[i]->s_wave setScaleY:0.89 * 2.099];
                [bombingAniStruct[i]->s_wave setOpacity:56.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[0] setPosition:ccp(313.1 + wholeBombOffsetX, -286.9 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[0] setRotation:136.9];
                [bombingAniStruct[i]->s_debris[0] setScaleX:0.405];
                [bombingAniStruct[i]->s_debris[0] setScaleY:0.635];
                [bombingAniStruct[i]->s_debris[0] setOpacity:65.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[1] setPosition:ccp(323.6 + wholeBombOffsetX, -209.2 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[1] setRotation:-119.8];
                [bombingAniStruct[i]->s_debris[1] setScaleX:0.636];
                [bombingAniStruct[i]->s_debris[1] setScaleY:0.925];
                [bombingAniStruct[i]->s_debris[1] setOpacity:73/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[2] setPosition:ccp(419.8 + wholeBombOffsetX, -217.4 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[2] setRotation:-32.3];
                [bombingAniStruct[i]->s_debris[2] setScaleX:0.636];
                [bombingAniStruct[i]->s_debris[2] setScaleY:0.636];
                [bombingAniStruct[i]->s_debris[2] setOpacity:68.0/100.0 * 255.0];
                
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
                
                [bombingAniStruct[i]->s_bigClouds[5] setPosition:ccp(349.7 + wholeBombOffsetX, -256.3 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[5] setRotation:3.8];
                [bombingAniStruct[i]->s_bigClouds[5] setScaleX:2.366 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[5] setScaleY:2.366 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[5] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[6] setPosition:ccp(341.6 + wholeBombOffsetX, -259.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[6] setRotation:-53.1];
                [bombingAniStruct[i]->s_bigClouds[6] setScaleX:2.262 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[6] setScaleY:2.262 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[6] setOpacity:100.0/100.0 * 255.0];
                
                
                [bombingAniStruct[i]->s_smallClouds[0] setPosition:ccp(339 + wholeBombOffsetX, -258.5 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[0] setRotation:47.6];
                [bombingAniStruct[i]->s_smallClouds[0] setScaleX:2.801 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[0] setScaleY:2.801 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[0] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[1] setPosition:ccp(347.0 + wholeBombOffsetX, -263.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[1] setRotation:-62.4];
                [bombingAniStruct[i]->s_smallClouds[1] setScaleX:1.606 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[1] setScaleY:1.606 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[1] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[2] setPosition:ccp(350.8 + wholeBombOffsetX, -245 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[2] setRotation:78.7];
                [bombingAniStruct[i]->s_smallClouds[2] setScaleX:1.956 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[2] setScaleY:1.956 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[2] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[3] setPosition:ccp(339.8 + wholeBombOffsetX, -251.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[3] setRotation:-130.4];
                [bombingAniStruct[i]->s_smallClouds[3] setScaleX:2.226 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[3] setScaleY:2.226 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[3] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[4] setPosition:ccp(358.8 + wholeBombOffsetX, -253.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[4] setRotation:0];
                [bombingAniStruct[i]->s_smallClouds[4] setScaleX:2.223 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[4] setScaleY:2.223 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[4] setOpacity:100.0/100.0 * 255.0];
            }
            
            //Frame 9
            if(bombingAniStruct[i]->aniTimer == 7){
                [bombingAniStruct[i]->s_wave setPosition:ccp(351.5 + wholeBombOffsetX, -265.4 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_wave setScaleX:1.045 * 2.099];
                [bombingAniStruct[i]->s_wave setScaleY:1.015 * 2.099];
                [bombingAniStruct[i]->s_wave setOpacity:47.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[0] setPosition:ccp(302.4 + wholeBombOffsetX, -293.1 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[0] setRotation:136.1];
                [bombingAniStruct[i]->s_debris[0] setScaleX:0.401];
                [bombingAniStruct[i]->s_debris[0] setScaleY:0.635];
                [bombingAniStruct[i]->s_debris[0] setOpacity:54.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[1] setPosition:ccp(316.1 + wholeBombOffsetX, -194.1 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[1] setRotation:-118.3];
                [bombingAniStruct[i]->s_debris[1] setScaleX:0.635];
                [bombingAniStruct[i]->s_debris[1] setScaleY:0.934];
                [bombingAniStruct[i]->s_debris[1] setOpacity:64.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[2] setPosition:ccp(437 + wholeBombOffsetX, -205.2 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[2] setRotation:-32.3];
                [bombingAniStruct[i]->s_debris[2] setScaleX:0.636];
                [bombingAniStruct[i]->s_debris[2] setScaleY:0.636];
                [bombingAniStruct[i]->s_debris[2] setOpacity:57.0/100.0 * 255.0];
                
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
                
                [bombingAniStruct[i]->s_bigClouds[5] setPosition:ccp(349.7 + wholeBombOffsetX, -256.3 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[5] setRotation:6.0];
                [bombingAniStruct[i]->s_bigClouds[5] setScaleX:2.402 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[5] setScaleY:2.402 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[5] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[6] setPosition:ccp(341.4 + wholeBombOffsetX, -259.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[6] setRotation:-53.6];
                [bombingAniStruct[i]->s_bigClouds[6] setScaleX:2.312 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[6] setScaleY:2.312 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[6] setOpacity:100.0/100.0 * 255.0];
                
                
                [bombingAniStruct[i]->s_smallClouds[0] setPosition:ccp(333.4 + wholeBombOffsetX, -258.4 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[0] setRotation:53.6];
                [bombingAniStruct[i]->s_smallClouds[0] setScaleX:2.722 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[0] setScaleY:2.722 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[0] setOpacity:96.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[1] setPosition:ccp(344.6 + wholeBombOffsetX, -265.4 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[1] setRotation:-64.9];
                [bombingAniStruct[i]->s_smallClouds[1] setScaleX:1.57 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[1] setScaleY:1.57 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[1] setOpacity:96.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[2] setPosition:ccp(350.9 + wholeBombOffsetX, -241.7 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[2] setRotation:83.7];
                [bombingAniStruct[i]->s_smallClouds[2] setScaleX:1.91 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[2] setScaleY:1.91 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[2] setOpacity:96.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[3] setPosition:ccp(337.1 + wholeBombOffsetX, -248.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[3] setRotation:-130.4];
                [bombingAniStruct[i]->s_smallClouds[3] setScaleX:2.168 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[3] setScaleY:2.168 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[3] setOpacity:96.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[4] setPosition:ccp(362.6 + wholeBombOffsetX, -253.5 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[4] setRotation:-4.3];
                [bombingAniStruct[i]->s_smallClouds[4] setScaleX:2.174 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[4] setScaleY:2.174 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[4] setOpacity:96.0/100.0 * 255.0];
            }
            
            //Frame 10
            if(bombingAniStruct[i]->aniTimer == 8){
                [bombingAniStruct[i]->s_wave setPosition:ccp(351.5 + wholeBombOffsetX, -265.4 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_wave setScaleX:1.213 * 2.099];
                [bombingAniStruct[i]->s_wave setScaleY:1.213 * 2.099];
                [bombingAniStruct[i]->s_wave setOpacity:38.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[0] setPosition:ccp(292.1 + wholeBombOffsetX, -299.2 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[0] setRotation:135.4];
                [bombingAniStruct[i]->s_debris[0] setScaleX:0.397];
                [bombingAniStruct[i]->s_debris[0] setScaleY:0.635];
                [bombingAniStruct[i]->s_debris[0] setOpacity:42.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[1] setPosition:ccp(308.8 + wholeBombOffsetX, -179.2 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[1] setRotation:-116.6];
                [bombingAniStruct[i]->s_debris[1] setScaleX:0.635];
                [bombingAniStruct[i]->s_debris[1] setScaleY:0.943];
                [bombingAniStruct[i]->s_debris[1] setOpacity:55.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[2] setPosition:ccp(453.8 + wholeBombOffsetX, -193.2 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[2] setRotation:-32.3];
                [bombingAniStruct[i]->s_debris[2] setScaleX:0.636];
                [bombingAniStruct[i]->s_debris[2] setScaleY:0.636];
                [bombingAniStruct[i]->s_debris[2] setOpacity:47.0/100.0 * 255.0];
                
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
                
                [bombingAniStruct[i]->s_bigClouds[5] setPosition:ccp(349.7 + wholeBombOffsetX, -256.3 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[5] setRotation:8.8];
                [bombingAniStruct[i]->s_bigClouds[5] setScaleX:2.444 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[5] setScaleY:2.444 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[5] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[6] setPosition:ccp(341.4 + wholeBombOffsetX, -259.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[6] setRotation:-60.9];
                [bombingAniStruct[i]->s_bigClouds[6] setScaleX:2.375 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[6] setScaleY:2.375 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[6] setOpacity:100.0/100.0 * 255.0];
                
                
                [bombingAniStruct[i]->s_smallClouds[0] setPosition:ccp(326.9 + wholeBombOffsetX, -258.3 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[0] setRotation:60.4];
                [bombingAniStruct[i]->s_smallClouds[0] setScaleX:2.638 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[0] setScaleY:2.638 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[0] setOpacity:93.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[1] setPosition:ccp(341.7 + wholeBombOffsetX, -267.2 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[1] setRotation:-67.7];
                [bombingAniStruct[i]->s_smallClouds[1] setScaleX:1.531 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[1] setScaleY:1.531 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[1] setOpacity:93.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[2] setPosition:ccp(351.1 + wholeBombOffsetX, -237.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[2] setRotation:89.4];
                [bombingAniStruct[i]->s_smallClouds[2] setScaleX:1.858 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[2] setScaleY:1.858 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[2] setOpacity:93.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[3] setPosition:ccp(334.1 + wholeBombOffsetX, -245.2 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[3] setRotation:-130.6];
                [bombingAniStruct[i]->s_smallClouds[3] setScaleX:2.105 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[3] setScaleY:2.105 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[3] setOpacity:93.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[4] setPosition:ccp(367.1 + wholeBombOffsetX, -253.1 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[4] setRotation:-9.5];
                [bombingAniStruct[i]->s_smallClouds[4] setScaleX:2.11 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[4] setScaleY:2.11 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[4] setOpacity:93.0/100.0 * 255.0];
            }
            
            //Frame 11
            if(bombingAniStruct[i]->aniTimer == 9){
                [bombingAniStruct[i]->s_wave setPosition:ccp(351.5 + wholeBombOffsetX, -265.4 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_wave setScaleX:1.386 * 2.099];
                [bombingAniStruct[i]->s_wave setScaleY:1.386 * 2.099];
                [bombingAniStruct[i]->s_wave setOpacity:28.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[0] setPosition:ccp(282.2 + wholeBombOffsetX, -305.1 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[0] setRotation:134.4];
                [bombingAniStruct[i]->s_debris[0] setScaleX:0.393];
                [bombingAniStruct[i]->s_debris[0] setScaleY:0.635];
                [bombingAniStruct[i]->s_debris[0] setOpacity:32.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[1] setPosition:ccp(301.6 + wholeBombOffsetX, -164.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[1] setRotation:-115.1];
                [bombingAniStruct[i]->s_debris[1] setScaleX:0.635];
                [bombingAniStruct[i]->s_debris[1] setScaleY:0.952];
                [bombingAniStruct[i]->s_debris[1] setOpacity:46.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[2] setPosition:ccp(469.9 + wholeBombOffsetX, -181.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[2] setRotation:-32.3];
                [bombingAniStruct[i]->s_debris[2] setScaleX:0.636];
                [bombingAniStruct[i]->s_debris[2] setScaleY:0.636];
                [bombingAniStruct[i]->s_debris[2] setOpacity:38.0/100.0 * 255.0];
                
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
                
                [bombingAniStruct[i]->s_bigClouds[5] setPosition:ccp(349.7 + wholeBombOffsetX, -256.3 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[5] setRotation:13.0];
                [bombingAniStruct[i]->s_bigClouds[5] setScaleX:2.492 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[5] setScaleY:2.495 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[5] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[6] setPosition:ccp(341.4 + wholeBombOffsetX, -259.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[6] setRotation:-65.9];
                [bombingAniStruct[i]->s_bigClouds[6] setScaleX:2.453 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[6] setScaleY:2.453 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[6] setOpacity:100.0/100.0 * 255.0];
                
                
                [bombingAniStruct[i]->s_smallClouds[0] setPosition:ccp(319.6 + wholeBombOffsetX, -258.1 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[0] setRotation:68.2];
                [bombingAniStruct[i]->s_smallClouds[0] setScaleX:2.543 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[0] setScaleY:2.543 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[0] setOpacity:89.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[1] setPosition:ccp(338.5 + wholeBombOffsetX, -269.3 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[1] setRotation:-70.7];
                [bombingAniStruct[i]->s_smallClouds[1] setScaleX:1.487 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[1] setScaleY:1.487 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[1] setOpacity:89.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[2] setPosition:ccp(351.2 + wholeBombOffsetX, -233.6 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[2] setRotation:95.6];
                [bombingAniStruct[i]->s_smallClouds[2] setScaleX:1.78 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[2] setScaleY:1.78 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[2] setOpacity:89.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[3] setPosition:ccp(330.7 + wholeBombOffsetX, -241.4 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[3] setRotation:-130.6];
                [bombingAniStruct[i]->s_smallClouds[3] setScaleX:2.034 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[3] setScaleY:2.034 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[3] setOpacity:89.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[4] setPosition:ccp(372.2 + wholeBombOffsetX, -252.7 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[4] setRotation:-15.3];
                [bombingAniStruct[i]->s_smallClouds[4] setScaleX:2.038 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[4] setScaleY:2.038 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[4] setOpacity:89.0/100.0 * 255.0];
            }
            
            //Frame 12
            if(bombingAniStruct[i]->aniTimer == 10){
                [bombingAniStruct[i]->s_wave setPosition:ccp(351.5 + wholeBombOffsetX, -265.4 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_wave setScaleX:1.558 * 2.099];
                [bombingAniStruct[i]->s_wave setScaleY:1.558 * 2.099];
                [bombingAniStruct[i]->s_wave setOpacity:18.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[0] setPosition:ccp(273.1 + wholeBombOffsetX, -310.5 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[0] setRotation:133.6];
                [bombingAniStruct[i]->s_debris[0] setScaleX:0.389];
                [bombingAniStruct[i]->s_debris[0] setScaleY:0.635];
                [bombingAniStruct[i]->s_debris[0] setOpacity:22.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[1] setPosition:ccp(294.6 + wholeBombOffsetX, -150.9 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[1] setRotation:-113.6];
                [bombingAniStruct[i]->s_debris[1] setScaleX:0.635];
                [bombingAniStruct[i]->s_debris[1] setScaleY:0.96];
                [bombingAniStruct[i]->s_debris[1] setOpacity:38.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[2] setPosition:ccp(485.1 + wholeBombOffsetX, -170.9 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[2] setRotation:-32.3];
                [bombingAniStruct[i]->s_debris[2] setScaleX:0.636];
                [bombingAniStruct[i]->s_debris[2] setScaleY:0.636];
                [bombingAniStruct[i]->s_debris[2] setOpacity:28.0/100.0 * 255.0];
                
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
                
                [bombingAniStruct[i]->s_bigClouds[5] setPosition:ccp(349.8 + wholeBombOffsetX, -256.2 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[5] setRotation:15.3];
                [bombingAniStruct[i]->s_bigClouds[5] setScaleX:2.542 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[5] setScaleY:2.542 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[5] setOpacity:90.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[6] setPosition:ccp(341.4 + wholeBombOffsetX, -259.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[6] setRotation:-71.7];
                [bombingAniStruct[i]->s_bigClouds[6] setScaleX:2.535 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[6] setScaleY:2.535 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[6] setOpacity:86.0/100.0 * 255.0];
                
                
                [bombingAniStruct[i]->s_smallClouds[0] setPosition:ccp(311.4 + wholeBombOffsetX, -258.1 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[0] setRotation:76.9];
                [bombingAniStruct[i]->s_smallClouds[0] setScaleX:2.437 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[0] setScaleY:2.437 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[0] setOpacity:84.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[1] setPosition:ccp(334.9 + wholeBombOffsetX, -271.5 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[1] setRotation:-74.2];
                [bombingAniStruct[i]->s_smallClouds[1] setScaleX:1.438 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[1] setScaleY:1.438 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[1] setOpacity:84.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[2] setPosition:ccp(351.4 + wholeBombOffsetX, -228.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[2] setRotation:102.8];
                [bombingAniStruct[i]->s_smallClouds[2] setScaleX:1.731 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[2] setScaleY:1.731 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[2] setOpacity:84.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[3] setPosition:ccp(326.9 + wholeBombOffsetX, -236.0 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[3] setRotation:-130.9];
                [bombingAniStruct[i]->s_smallClouds[3] setScaleX:1.955 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[3] setScaleY:1.955 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[3] setOpacity:84/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[4] setPosition:ccp(377.8 + wholeBombOffsetX, -252.2 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[4] setRotation:-21.8];
                [bombingAniStruct[i]->s_smallClouds[4] setScaleX:1.959 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[4] setScaleY:1.959 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[4] setOpacity:84.0/100.0 * 255.0];
            }
            
            
            //Frame 13
            if(bombingAniStruct[i]->aniTimer == 11){
                [bombingAniStruct[i]->s_wave setPosition:ccp(351.5 + wholeBombOffsetX, -265.4 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_wave setScaleX:1.72 * 2.099];
                [bombingAniStruct[i]->s_wave setScaleY:1.72 * 2.099];
                [bombingAniStruct[i]->s_wave setOpacity:9.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[0] setPosition:ccp(264.8 + wholeBombOffsetX, -315.4 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[0] setRotation:133.1];
                [bombingAniStruct[i]->s_debris[0] setScaleX:0.386];
                [bombingAniStruct[i]->s_debris[0] setScaleY:0.635];
                [bombingAniStruct[i]->s_debris[0] setOpacity:13.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[1] setPosition:ccp(288.1 + wholeBombOffsetX, -137.6 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[1] setRotation:-112.6];
                [bombingAniStruct[i]->s_debris[1] setScaleX:0.635];
                [bombingAniStruct[i]->s_debris[1] setScaleY:0.969];
                [bombingAniStruct[i]->s_debris[1] setOpacity:30.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[2] setPosition:ccp(499.4 + wholeBombOffsetX, -160.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[2] setRotation:-32.3];
                [bombingAniStruct[i]->s_debris[2] setScaleX:0.636];
                [bombingAniStruct[i]->s_debris[2] setScaleY:0.636];
                [bombingAniStruct[i]->s_debris[2] setOpacity:19.0/100.0 * 255.0];
                
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
                
                [bombingAniStruct[i]->s_bigClouds[5] setPosition:ccp(349.8 + wholeBombOffsetX, -256.2 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[5] setRotation:19.0];
                [bombingAniStruct[i]->s_bigClouds[5] setScaleX:2.596 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[5] setScaleY:2.596 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[5] setOpacity:79.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[6] setPosition:ccp(341.6 + wholeBombOffsetX, -259.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[6] setRotation:-77.7];
                [bombingAniStruct[i]->s_bigClouds[6] setScaleX:2.627 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[6] setScaleY:2.627 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[6] setOpacity:72.0/100.0 * 255.0];
                
                
                [bombingAniStruct[i]->s_smallClouds[0] setPosition:ccp(302.6 + wholeBombOffsetX, -257.9 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[0] setRotation:86.2];
                [bombingAniStruct[i]->s_smallClouds[0] setScaleX:2.32 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[0] setScaleY:2.32 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[0] setOpacity:79.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[1] setPosition:ccp(330.9 + wholeBombOffsetX, -274.0 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[1] setRotation:-77.7];
                [bombingAniStruct[i]->s_smallClouds[1] setScaleX:1.384 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[1] setScaleY:1.384 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[1] setOpacity:79.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[2] setPosition:ccp(351.6 + wholeBombOffsetX, -223.6 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[2] setRotation:110.5];
                [bombingAniStruct[i]->s_smallClouds[2] setScaleX:1.658 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[2] setScaleY:1.658 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[2] setOpacity:79.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[3] setPosition:ccp(322.8 + wholeBombOffsetX, -232.2 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[3] setRotation:-131.1];
                [bombingAniStruct[i]->s_smallClouds[3] setScaleX:1.868 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[3] setScaleY:1.868 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[3] setOpacity:79.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[4] setPosition:ccp(383.9 + wholeBombOffsetX, -251.7 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[4] setRotation:-28.8];
                [bombingAniStruct[i]->s_smallClouds[4] setScaleX:1.872 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[4] setScaleY:1.872 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[4] setOpacity:79.0/100.0 * 255.0];
            }
            
            
            //Frame 14
            if(bombingAniStruct[i]->aniTimer == 12){
                [bombingAniStruct[i]->s_wave setPosition:ccp(10000 , 265)];
                
                [bombingAniStruct[i]->s_debris[0] setPosition:ccp(257.8 + wholeBombOffsetX, -319.5 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[0] setRotation:132.6];
                [bombingAniStruct[i]->s_debris[0] setScaleX:0.383];
                [bombingAniStruct[i]->s_debris[0] setScaleY:0.635];
                [bombingAniStruct[i]->s_debris[0] setOpacity:5.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[1] setPosition:ccp(281.9 + wholeBombOffsetX, -125.0 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[1] setRotation:-111.0];
                [bombingAniStruct[i]->s_debris[1] setScaleX:0.635];
                [bombingAniStruct[i]->s_debris[1] setScaleY:0.976];
                [bombingAniStruct[i]->s_debris[1] setOpacity:23.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[2] setPosition:ccp(512.2 + wholeBombOffsetX, -151.7 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[2] setRotation:-32.3];
                [bombingAniStruct[i]->s_debris[2] setScaleX:0.636];
                [bombingAniStruct[i]->s_debris[2] setScaleY:0.636];
                [bombingAniStruct[i]->s_debris[2] setOpacity:11.0/100.0 * 255.0];
                
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
                
                [bombingAniStruct[i]->s_bigClouds[5] setPosition:ccp(349.8 + wholeBombOffsetX, -256.2 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[5] setRotation:22.8];
                [bombingAniStruct[i]->s_bigClouds[5] setScaleX:2.654 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[5] setScaleY:2.654 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[5] setOpacity:68.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[6] setPosition:ccp(341.6 + wholeBombOffsetX, -259.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[6] setRotation:-84.0];
                [bombingAniStruct[i]->s_bigClouds[6] setScaleX:2.722 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[6] setScaleY:2.722 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[6] setOpacity:57.0/100.0 * 255.0];
                
                
                [bombingAniStruct[i]->s_smallClouds[0] setPosition:ccp(293.1 + wholeBombOffsetX, -257.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[0] setRotation:96.3];
                [bombingAniStruct[i]->s_smallClouds[0] setScaleX:2.196 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[0] setScaleY:2.196 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[0] setOpacity:73.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[1] setPosition:ccp(326.6 + wholeBombOffsetX, -276.6 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[1] setRotation:-81.9];
                [bombingAniStruct[i]->s_smallClouds[1] setScaleX:1.327 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[1] setScaleY:1.327 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[1] setOpacity:73.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[2] setPosition:ccp(351.8 + wholeBombOffsetX, -217.9 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[2] setRotation:118.9];
                [bombingAniStruct[i]->s_smallClouds[2] setScaleX:1.58 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[2] setScaleY:1.58 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[2] setOpacity:73.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[3] setPosition:ccp(318.3 + wholeBombOffsetX, -226.9 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[3] setRotation:-131.1];
                [bombingAniStruct[i]->s_smallClouds[3] setScaleX:1.775 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[3] setScaleY:1.775 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[3] setOpacity:73.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[4] setPosition:ccp(390.6 + wholeBombOffsetX, -251.2 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[4] setRotation:-36.3];
                [bombingAniStruct[i]->s_smallClouds[4] setScaleX:1.778 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[4] setScaleY:1.778 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[4] setOpacity:73.0/100.0 * 255.0];
                
            }
            
            
            //Frame 15
            if(bombingAniStruct[i]->aniTimer == 13){
                
                [bombingAniStruct[i]->s_debris[0] setPosition:ccp(10000, 319.5)];
                
                [bombingAniStruct[i]->s_debris[1] setPosition:ccp(276.1 + wholeBombOffsetX, -113.3 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[1] setRotation:-109.8];
                [bombingAniStruct[i]->s_debris[1] setScaleX:0.635];
                [bombingAniStruct[i]->s_debris[1] setScaleY:0.984];
                [bombingAniStruct[i]->s_debris[1] setOpacity:16.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[2] setPosition:ccp(523.0 + wholeBombOffsetX, -143.9 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[2] setRotation:-32.3];
                [bombingAniStruct[i]->s_debris[2] setScaleX:0.636];
                [bombingAniStruct[i]->s_debris[2] setScaleY:0.636];
                [bombingAniStruct[i]->s_debris[2] setOpacity:5.0/100.0 * 255.0];
                
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
                
                [bombingAniStruct[i]->s_bigClouds[5] setPosition:ccp(349.8 + wholeBombOffsetX, -256.2 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[5] setRotation:26.6];
                [bombingAniStruct[i]->s_bigClouds[5] setScaleX:2.713 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[5] setScaleY:2.713 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[5] setOpacity:56.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[6] setPosition:ccp(341.6 + wholeBombOffsetX, -259.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[6] setRotation:-90.3];
                [bombingAniStruct[i]->s_bigClouds[6] setScaleX:2.818 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[6] setScaleY:2.818 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[6] setOpacity:41.0/100.0 * 255.0];
                
                
                
                
                [bombingAniStruct[i]->s_smallClouds[0] setPosition:ccp(282.9 + wholeBombOffsetX, -257.7 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[0] setRotation:107.1];
                [bombingAniStruct[i]->s_smallClouds[0] setScaleX:2.06 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[0] setScaleY:2.06 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[0] setOpacity:67.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[1] setPosition:ccp(322.1 + wholeBombOffsetX, -279.6 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[1] setRotation:-86.2];
                [bombingAniStruct[i]->s_smallClouds[1] setScaleX:1.265 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[1] setScaleY:1.265 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[1] setOpacity:67.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[2] setPosition:ccp(352.1 + wholeBombOffsetX, -211.9 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[2] setRotation:127.9];
                [bombingAniStruct[i]->s_smallClouds[2] setScaleX:1.497 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[2] setScaleY:1.497 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[2] setOpacity:67.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[3] setPosition:ccp(313.6 + wholeBombOffsetX, -221.5 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[3] setRotation:-131.4];
                [bombingAniStruct[i]->s_smallClouds[3] setScaleX:1.676 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[3] setScaleY:1.676 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[3] setOpacity:67.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[4] setPosition:ccp(397.6 + wholeBombOffsetX, -250.6 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[4] setRotation:-44.4];
                [bombingAniStruct[i]->s_smallClouds[4] setScaleX:1.678 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[4] setScaleY:1.678 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[4] setOpacity:67.0/100.0 * 255.0];
                
                
            }
            
            
            //Frame 16
            if(bombingAniStruct[i]->aniTimer == 14){
                
                
                [bombingAniStruct[i]->s_debris[1] setPosition:ccp(270.9 + wholeBombOffsetX, -102.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[1] setRotation:-108.6];
                [bombingAniStruct[i]->s_debris[1] setScaleX:0.635];
                [bombingAniStruct[i]->s_debris[1] setScaleY:0.99];
                [bombingAniStruct[i]->s_debris[1] setOpacity:9.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[2] setPosition:ccp(10000 , 143.9)];
                
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
                
                [bombingAniStruct[i]->s_bigClouds[5] setPosition:ccp(349.8 + wholeBombOffsetX, -256.2 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[5] setRotation:30.6];
                [bombingAniStruct[i]->s_bigClouds[5] setScaleX:2.773 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[5] setScaleY:2.773 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[5] setOpacity:44.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[6] setPosition:ccp(341.6 + wholeBombOffsetX, -259.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[6] setRotation:-96.3];
                [bombingAniStruct[i]->s_bigClouds[6] setScaleX:2.909 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[6] setScaleY:2.909 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[6] setOpacity:27.0/100.0 * 255.0];
                
                
                
                
                
                [bombingAniStruct[i]->s_smallClouds[0] setPosition:ccp(272.1 + wholeBombOffsetX, -257.6 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[0] setRotation:118.6];
                [bombingAniStruct[i]->s_smallClouds[0] setScaleX:1.918 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[0] setScaleY:1.918 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[0] setOpacity:60.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[1] setPosition:ccp(317.4 + wholeBombOffsetX, -282.6 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[1] setRotation:-90.5];
                [bombingAniStruct[i]->s_smallClouds[1] setScaleX:1.20 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[1] setScaleY:1.20 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[1] setOpacity:60.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[2] setPosition:ccp(352.3 + wholeBombOffsetX, -205.7 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[2] setRotation:137.4];
                [bombingAniStruct[i]->s_smallClouds[2] setScaleX:1.409 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[2] setScaleY:1.409 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[2] setOpacity:60.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[3] setPosition:ccp(308.4 + wholeBombOffsetX, -215.7 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[3] setRotation:-131.6];
                [bombingAniStruct[i]->s_smallClouds[3] setScaleX:1.571 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[3] setScaleY:1.571 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[3] setOpacity:60.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[4] setPosition:ccp(405.1 + wholeBombOffsetX, -250.1 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[4] setRotation:-52.9];
                [bombingAniStruct[i]->s_smallClouds[4] setScaleX:1.574 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[4] setScaleY:1.574 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[4] setOpacity:60.0/100.0 * 255.0];
                
                
            }
            
            
            //Frame 17
            if(bombingAniStruct[i]->aniTimer == 15){
                [bombingAniStruct[i]->s_debris[1] setPosition:ccp(266.4 + wholeBombOffsetX, -93.9 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[1] setRotation:-107.6];
                [bombingAniStruct[i]->s_debris[1] setScaleX:0.635];
                [bombingAniStruct[i]->s_debris[1] setScaleY:0.996];
                [bombingAniStruct[i]->s_debris[1] setOpacity:4.0/100.0 * 255.0];
                
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
                
                [bombingAniStruct[i]->s_bigClouds[5] setPosition:ccp(349.8 + wholeBombOffsetX, -256.2 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[5] setRotation:34.6];
                [bombingAniStruct[i]->s_bigClouds[5] setScaleX:2.532 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[5] setScaleY:2.532 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[5] setOpacity:32.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[6] setPosition:ccp(341.6 + wholeBombOffsetX, -259.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[6] setRotation:-102.0];
                [bombingAniStruct[i]->s_bigClouds[6] setScaleX:2.995 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[6] setScaleY:2.995 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[6] setOpacity:13.0/100.0 * 255.0];
                
                
                
                [bombingAniStruct[i]->s_smallClouds[0] setPosition:ccp(260.9 + wholeBombOffsetX, -257.4 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[0] setRotation:130.6];
                [bombingAniStruct[i]->s_smallClouds[0] setScaleX:1.771 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[0] setScaleY:1.771 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[0] setOpacity:54.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[1] setPosition:ccp(312.4 + wholeBombOffsetX, -285.7 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[1] setRotation:-95.3];
                [bombingAniStruct[i]->s_smallClouds[1] setScaleX:1.132 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[1] setScaleY:1.132 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[1] setOpacity:54.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[2] setPosition:ccp(352.6 + wholeBombOffsetX, -199.1 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[2] setRotation:147.2];
                [bombingAniStruct[i]->s_smallClouds[2] setScaleX:1.318 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[2] setScaleY:1.318 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[2] setOpacity:54.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[3] setPosition:ccp(303.2 + wholeBombOffsetX, -209.7 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[3] setRotation:-131.8];
                [bombingAniStruct[i]->s_smallClouds[3] setScaleX:1.462 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[3] setScaleY:1.462 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[3] setOpacity:54.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[4] setPosition:ccp(412.8 + wholeBombOffsetX, -249.3 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[4] setRotation:-61.9];
                [bombingAniStruct[i]->s_smallClouds[4] setScaleX:1.465 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[4] setScaleY:1.465 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[4] setOpacity:54.0/100.0 * 255.0];
                
                
                
            }
            
            
            //Frame 18
            if(bombingAniStruct[i]->aniTimer == 16){
                [bombingAniStruct[i]->s_debris[1] setPosition:ccp(10000, 93.9)];
                
                
                [bombingAniStruct[i]->s_bigClouds[0] setPosition:ccp(41500.0, -341.1)];
                [bombingAniStruct[i]->s_bigClouds[1] setPosition:ccp(41500.0, -341.1)];
                [bombingAniStruct[i]->s_bigClouds[2] setPosition:ccp(41500.0, -341.1)];
                [bombingAniStruct[i]->s_bigClouds[3] setPosition:ccp(41500.0, -341.1)];
                [bombingAniStruct[i]->s_bigClouds[4] setPosition:ccp(41500.0, -341.1)];
                [bombingAniStruct[i]->s_bigClouds[6] setPosition:ccp(41500.0, -341.1)];
                
                [bombingAniStruct[i]->s_bigClouds[5] setPosition:ccp(349.8 + wholeBombOffsetX, -256.2 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[5] setRotation:38.4];
                [bombingAniStruct[i]->s_bigClouds[5] setScaleX:2.889 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[5] setScaleY:2.889 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[5] setOpacity:21.0/100.0 * 255.0];
                
                
                
                [bombingAniStruct[i]->s_smallClouds[0] setPosition:ccp(249.3 + wholeBombOffsetX, -257.2 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[0] setRotation:142.7];
                [bombingAniStruct[i]->s_smallClouds[0] setScaleX:1.619 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[0] setScaleY:1.619 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[0] setOpacity:47.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[1] setPosition:ccp(307.3 + wholeBombOffsetX, -288.9 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[1] setRotation:-100.0];
                [bombingAniStruct[i]->s_smallClouds[1] setScaleX:1.062 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[1] setScaleY:1.062 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[1] setOpacity:47.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[2] setPosition:ccp(352.8 + wholeBombOffsetX, -192.2 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[2] setRotation:157.4];
                [bombingAniStruct[i]->s_smallClouds[2] setScaleX:1.225 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[2] setScaleY:1.225 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[2] setOpacity:47.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[3] setPosition:ccp(297.9 + wholeBombOffsetX, -203.5 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[3] setRotation:-132.1];
                [bombingAniStruct[i]->s_smallClouds[3] setScaleX:1.35 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[3] setScaleY:1.35 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[3] setOpacity:47.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[4] setPosition:ccp(420.7 + wholeBombOffsetX, -248.7 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[4] setRotation:-71];
                [bombingAniStruct[i]->s_smallClouds[4] setScaleX:1.353 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[4] setScaleY:1.353 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[4] setOpacity:47.0/100.0 * 255.0];
                
                
            }
            
            
            
            //Frame 19
            if(bombingAniStruct[i]->aniTimer == 17){
                
                [bombingAniStruct[i]->s_bigClouds[5] setPosition:ccp(349.8 + wholeBombOffsetX, -256.2 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[5] setRotation:41.9];
                [bombingAniStruct[i]->s_bigClouds[5] setScaleX:2.944 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[5] setScaleY:2.944 * 0.492];
                [bombingAniStruct[i]->s_bigClouds[5] setOpacity:10.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[0] setPosition:ccp(237.7 + wholeBombOffsetX, -257.1 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[0] setRotation:155.2];
                [bombingAniStruct[i]->s_smallClouds[0] setScaleX:1.466 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[0] setScaleY:1.466 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[0] setOpacity:40.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[1] setPosition:ccp(302.1 + wholeBombOffsetX, -292.2 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[1] setRotation:-105.0];
                [bombingAniStruct[i]->s_smallClouds[1] setScaleX:0.99 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[1] setScaleY:0.99 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[1] setOpacity:40.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[2] setPosition:ccp(353.1 + wholeBombOffsetX, -185.3 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[2] setRotation:167.7];
                [bombingAniStruct[i]->s_smallClouds[2] setScaleX:1.13 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[2] setScaleY:1.13 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[2] setOpacity:40.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[3] setPosition:ccp(292.4 + wholeBombOffsetX, -197.1 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[3] setRotation:-132.1];
                [bombingAniStruct[i]->s_smallClouds[3] setScaleX:1.236 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[3] setScaleY:1.236 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[3] setOpacity:40.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[4] setPosition:ccp(428.8 + wholeBombOffsetX, -248.1 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[4] setRotation:-80.2];
                [bombingAniStruct[i]->s_smallClouds[4] setScaleX:1.239 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[4] setScaleY:1.239 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[4] setOpacity:40.0/100.0 * 255.0];
                
                
                
            }
            
            
            //Frame 20
            if(bombingAniStruct[i]->aniTimer == 18){
                
                [bombingAniStruct[i]->s_bigClouds[5] setPosition:ccp(34900.8 , -256.2)];
                
                [bombingAniStruct[i]->s_smallClouds[0] setPosition:ccp(225.8 + wholeBombOffsetX, -256.9 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[0] setRotation:167.7];
                [bombingAniStruct[i]->s_smallClouds[0] setScaleX:1.312 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[0] setScaleY:1.312 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[0] setOpacity:33.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[1] setPosition:ccp(296.9 + wholeBombOffsetX, -295.4 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[1] setRotation:-110.0];
                [bombingAniStruct[i]->s_smallClouds[1] setScaleX:0.919 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[1] setScaleY:0.919 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[1] setOpacity:33.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[2] setPosition:ccp(353.4 + wholeBombOffsetX, -178.4 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[2] setRotation:178.0];
                [bombingAniStruct[i]->s_smallClouds[2] setScaleX:1.035 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[2] setScaleY:1.035 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[2] setOpacity:33.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[3] setPosition:ccp(286.9 + wholeBombOffsetX, -190.7 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[3] setRotation:-132.4];
                [bombingAniStruct[i]->s_smallClouds[3] setScaleX:1.122 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[3] setScaleY:1.122 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[3] setOpacity:33.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[4] setPosition:ccp(436.9 + wholeBombOffsetX, -247.3 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[4] setRotation:-89.7];
                [bombingAniStruct[i]->s_smallClouds[4] setScaleX:1.125 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[4] setScaleY:1.125 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[4] setOpacity:33.0/100.0 * 255.0];
                
            }
            
            
            //Frame 21
            if(bombingAniStruct[i]->aniTimer == 19){
                
                
                
                [bombingAniStruct[i]->s_smallClouds[0] setPosition:ccp(214.0 + wholeBombOffsetX, -256.9 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[0] setRotation:180];
                [bombingAniStruct[i]->s_smallClouds[0] setScaleX:1.158 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[0] setScaleY:1.158 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[0] setOpacity:26.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[1] setPosition:ccp(291.6 + wholeBombOffsetX, -298.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[1] setRotation:-115.0];
                [bombingAniStruct[i]->s_smallClouds[1] setScaleX:0.847 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[1] setScaleY:0.847 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[1] setOpacity:26.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[2] setPosition:ccp(353.6 + wholeBombOffsetX, -171.6 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[2] setRotation:171.9];
                [bombingAniStruct[i]->s_smallClouds[2] setScaleX:0.939 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[2] setScaleY:0.939 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[2] setOpacity:26.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[3] setPosition:ccp(281.4 + wholeBombOffsetX, -184.3 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[3] setRotation:-132.4];
                [bombingAniStruct[i]->s_smallClouds[3] setScaleX:1.007 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[3] setScaleY:1.007 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[3] setOpacity:26.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[4] setPosition:ccp(445.0 + wholeBombOffsetX, -246.7 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[4] setRotation:-98.8];
                [bombingAniStruct[i]->s_smallClouds[4] setScaleX:1.01 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[4] setScaleY:1.01 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[4] setOpacity:26.0/100.0 * 255.0];
                
            }
            
            
            
            //Frame 22
            if(bombingAniStruct[i]->aniTimer == 20){
                
                
                
                [bombingAniStruct[i]->s_smallClouds[0] setPosition:ccp(202.5 + wholeBombOffsetX, -256.5 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[0] setRotation:167.7];
                [bombingAniStruct[i]->s_smallClouds[0] setScaleX:1.006 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[0] setScaleY:1.006 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[0] setOpacity:19.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[1] setPosition:ccp(286.6 + wholeBombOffsetX, -302.0 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[1] setRotation:-119.8];
                [bombingAniStruct[i]->s_smallClouds[1] setScaleX:0.777 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[1] setScaleY:0.777 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[1] setOpacity:19.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[2] setPosition:ccp(353.6 + wholeBombOffsetX, -164.7 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[2] setRotation:161.7];
                [bombingAniStruct[i]->s_smallClouds[2] setScaleX:0.844 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[2] setScaleY:0.844 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[2] setOpacity:19.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[3] setPosition:ccp(276.1 + wholeBombOffsetX, -178.2 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[3] setRotation:-132.9];
                [bombingAniStruct[i]->s_smallClouds[3] setScaleX:0.895 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[3] setScaleY:0.895 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[3] setOpacity:19.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[4] setPosition:ccp(453.0 + wholeBombOffsetX, -246.1 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[4] setRotation:-107.8];
                [bombingAniStruct[i]->s_smallClouds[4] setScaleX:0.897 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[4] setScaleY:0.897 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[4] setOpacity:19.0/100.0 * 255.0];
                
                
            }
            
            
            //Frame 23
            if(bombingAniStruct[i]->aniTimer == 21){
                
                
                
                
                
                [bombingAniStruct[i]->s_smallClouds[0] setPosition:ccp(191.2 + wholeBombOffsetX, -256.4 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[0] setRotation:155.7];
                [bombingAniStruct[i]->s_smallClouds[0] setScaleX:0.858 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[0] setScaleY:0.858 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[0] setOpacity:13.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[1] setPosition:ccp(281.6 + wholeBombOffsetX, -305.1 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[1] setRotation:-124.6];
                [bombingAniStruct[i]->s_smallClouds[1] setScaleX:0.709 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[1] setScaleY:0.709 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[1] setOpacity:13.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[2] setPosition:ccp(354.1 + wholeBombOffsetX, -158.1 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[2] setRotation:151.9];
                [bombingAniStruct[i]->s_smallClouds[2] setScaleX:0.753 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[2] setScaleY:0.753 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[2] setOpacity:13.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[3] setPosition:ccp(270.8 + wholeBombOffsetX, -172.2 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[3] setRotation:-133.1];
                [bombingAniStruct[i]->s_smallClouds[3] setScaleX:0.786 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[3] setScaleY:0.786 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[3] setOpacity:13.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[4] setPosition:ccp(460.8 + wholeBombOffsetX, -245.4 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[4] setRotation:-116.8];
                [bombingAniStruct[i]->s_smallClouds[4] setScaleX:0.787 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[4] setScaleY:0.787 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[4] setOpacity:13.0/100.0 * 255.0];
                
                
            }
            
            //Frame 24
            if(bombingAniStruct[i]->aniTimer == 22){
                
                
                
                
                [bombingAniStruct[i]->s_smallClouds[0] setPosition:ccp(180.5 + wholeBombOffsetX, -256.2 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[0] setRotation:144.4];
                [bombingAniStruct[i]->s_smallClouds[0] setScaleX:0.716 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[0] setScaleY:0.716 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[0] setOpacity:6.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[1] setPosition:ccp(276.8 + wholeBombOffsetX, -308.1 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[1] setRotation:-129.1];
                [bombingAniStruct[i]->s_smallClouds[1] setScaleX:0.644 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[1] setScaleY:0.644 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[1] setOpacity:6.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[2] setPosition:ccp(354.1 + wholeBombOffsetX, -151.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[2] setRotation:142.4];
                [bombingAniStruct[i]->s_smallClouds[2] setScaleX:0.665 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[2] setScaleY:0.665 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[2] setOpacity:6.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[3] setPosition:ccp(265.8 + wholeBombOffsetX, -166.2 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[3] setRotation:-133.2];
                [bombingAniStruct[i]->s_smallClouds[3] setScaleX:0.681 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[3] setScaleY:0.681 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[3] setOpacity:6.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[4] setPosition:ccp(468.2 + wholeBombOffsetX, -244.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[4] setRotation:-125.3];
                [bombingAniStruct[i]->s_smallClouds[4] setScaleX:0.682 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[4] setScaleY:0.682 * 0.527];
                [bombingAniStruct[i]->s_smallClouds[4] setOpacity:6.0/100.0 * 255.0];
                
                
            }
            
            
            if(bombingAniStruct[i]->aniTimer == 23){
                [bombingAniStruct[i]->s_smallClouds[0] setPosition:ccp(34900.8 , -256.2)];
                [bombingAniStruct[i]->s_smallClouds[1] setPosition:ccp(34900.8 , -256.2)];
                [bombingAniStruct[i]->s_smallClouds[2] setPosition:ccp(34900.8 , -256.2)];
                [bombingAniStruct[i]->s_smallClouds[3] setPosition:ccp(34900.8 , -256.2)];
                [bombingAniStruct[i]->s_smallClouds[4] setPosition:ccp(34900.8 , -256.2)];
                [bombingAniStruct[i]->s_bigClouds[7] setPosition:ccp(34900.8 , -256.2)];
                
                bombingAniStruct[i]->isAniCombo = false;
            }
            
        }//end if bombingAniStrut i isAni
        
        
    }
}

-(void) manageBombShakeAni{
    static float wholeBombOffsetX = 0;
    static float wholeBombOffsetY = 0;
    
    
    for(int i = 0 ; i < bombingAniMax ; i++){
        
        if(bombingAniStruct[i]->isAniShake){
            
            //  printf("BS:%i %i\n",i, bombingAniStruct[i]->aniTimer);
            
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
                
                [bombingAniStruct[i]->s_debris[0] setPosition:ccp(345.8 + wholeBombOffsetX, -267.5 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[0] setRotation:139.6];
                [bombingAniStruct[i]->s_debris[0] setScaleX:0.419];
                [bombingAniStruct[i]->s_debris[0] setScaleY:0.636];
                [bombingAniStruct[i]->s_debris[0] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[1] setPosition:ccp(345.8 + wholeBombOffsetX, -254.0 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[1] setRotation:-124.6];
                [bombingAniStruct[i]->s_debris[1] setScaleX:0.636];
                [bombingAniStruct[i]->s_debris[1] setScaleY:0.899];
                [bombingAniStruct[i]->s_debris[1] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[2] setPosition:ccp(367.8 + wholeBombOffsetX, -254.5 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[2] setRotation:-32.3];
                [bombingAniStruct[i]->s_debris[2] setScaleX:0.636];
                [bombingAniStruct[i]->s_debris[2] setScaleY:0.636];
                [bombingAniStruct[i]->s_debris[2] setOpacity:100.0/100.0 * 255.0];
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
                
                [bombingAniStruct[i]->s_debris[0] setPosition:ccp(335.3 + wholeBombOffsetX, -273.6 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[0] setRotation:138.9];
                [bombingAniStruct[i]->s_debris[0] setScaleX:0.424];
                [bombingAniStruct[i]->s_debris[0] setScaleY:0.635];
                [bombingAniStruct[i]->s_debris[0] setOpacity:89.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[1] setPosition:ccp(338.6 + wholeBombOffsetX, -239.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[1] setRotation:-123.1];
                [bombingAniStruct[i]->s_debris[1] setScaleX:0.636];
                [bombingAniStruct[i]->s_debris[1] setScaleY:0.899];
                [bombingAniStruct[i]->s_debris[1] setOpacity:91.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[2] setPosition:ccp(384.5 + wholeBombOffsetX, -242.6 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[2] setRotation:-32.3];
                [bombingAniStruct[i]->s_debris[2] setScaleX:0.636];
                [bombingAniStruct[i]->s_debris[2] setScaleY:0.636];
                [bombingAniStruct[i]->s_debris[2] setOpacity:90.0/100.0 * 255.0];
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
                
                [bombingAniStruct[i]->s_debris[0] setPosition:ccp(324.1 + wholeBombOffsetX, -280.2 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[0] setRotation:137.9];
                [bombingAniStruct[i]->s_debris[0] setScaleX:0.424];
                [bombingAniStruct[i]->s_debris[0] setScaleY:0.635];
                [bombingAniStruct[i]->s_debris[0] setOpacity:77.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[1] setPosition:ccp(331.1 + wholeBombOffsetX, -224.4 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[1] setRotation:-121.4];
                [bombingAniStruct[i]->s_debris[1] setScaleX:0.636];
                [bombingAniStruct[i]->s_debris[1] setScaleY:0.899];
                [bombingAniStruct[i]->s_debris[1] setOpacity:82.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[2] setPosition:ccp(402.1 + wholeBombOffsetX, -230.0 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[2] setRotation:-32.3];
                [bombingAniStruct[i]->s_debris[2] setScaleX:0.636];
                [bombingAniStruct[i]->s_debris[2] setScaleY:0.636];
                [bombingAniStruct[i]->s_debris[2] setOpacity:79.0/100.0 * 255.0];
            }
            
            //Frame 8
            if(bombingAniStruct[i]->aniTimer == 6){
                [bombingAniStruct[i]->s_blick setPosition:ccp(10000 , 261.5)];
                
                [bombingAniStruct[i]->s_wave setPosition:ccp(351.5 + wholeBombOffsetX, -265.4 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_wave setScaleX:0.89 * 2.099];
                [bombingAniStruct[i]->s_wave setScaleY:0.89 * 2.099];
                [bombingAniStruct[i]->s_wave setOpacity:56.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[0] setPosition:ccp(313.1 + wholeBombOffsetX, -286.9 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[0] setRotation:136.9];
                [bombingAniStruct[i]->s_debris[0] setScaleX:0.405];
                [bombingAniStruct[i]->s_debris[0] setScaleY:0.635];
                [bombingAniStruct[i]->s_debris[0] setOpacity:65.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[1] setPosition:ccp(323.6 + wholeBombOffsetX, -209.2 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[1] setRotation:-119.8];
                [bombingAniStruct[i]->s_debris[1] setScaleX:0.636];
                [bombingAniStruct[i]->s_debris[1] setScaleY:0.925];
                [bombingAniStruct[i]->s_debris[1] setOpacity:73/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[2] setPosition:ccp(419.8 + wholeBombOffsetX, -217.4 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[2] setRotation:-32.3];
                [bombingAniStruct[i]->s_debris[2] setScaleX:0.636];
                [bombingAniStruct[i]->s_debris[2] setScaleY:0.636];
                [bombingAniStruct[i]->s_debris[2] setOpacity:68.0/100.0 * 255.0];
            }
            
            //Frame 9
            if(bombingAniStruct[i]->aniTimer == 7){
                [bombingAniStruct[i]->s_wave setPosition:ccp(351.5 + wholeBombOffsetX, -265.4 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_wave setScaleX:1.045 * 2.099];
                [bombingAniStruct[i]->s_wave setScaleY:1.015 * 2.099];
                [bombingAniStruct[i]->s_wave setOpacity:47.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[0] setPosition:ccp(302.4 + wholeBombOffsetX, -293.1 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[0] setRotation:136.1];
                [bombingAniStruct[i]->s_debris[0] setScaleX:0.401];
                [bombingAniStruct[i]->s_debris[0] setScaleY:0.635];
                [bombingAniStruct[i]->s_debris[0] setOpacity:54.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[1] setPosition:ccp(316.1 + wholeBombOffsetX, -194.1 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[1] setRotation:-118.3];
                [bombingAniStruct[i]->s_debris[1] setScaleX:0.635];
                [bombingAniStruct[i]->s_debris[1] setScaleY:0.934];
                [bombingAniStruct[i]->s_debris[1] setOpacity:64.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[2] setPosition:ccp(437 + wholeBombOffsetX, -205.2 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[2] setRotation:-32.3];
                [bombingAniStruct[i]->s_debris[2] setScaleX:0.636];
                [bombingAniStruct[i]->s_debris[2] setScaleY:0.636];
                [bombingAniStruct[i]->s_debris[2] setOpacity:57.0/100.0 * 255.0];
            }
            
            //Frame 10
            if(bombingAniStruct[i]->aniTimer == 8){
                [bombingAniStruct[i]->s_wave setPosition:ccp(351.5 + wholeBombOffsetX, -265.4 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_wave setScaleX:1.213 * 2.099];
                [bombingAniStruct[i]->s_wave setScaleY:1.213 * 2.099];
                [bombingAniStruct[i]->s_wave setOpacity:38.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[0] setPosition:ccp(292.1 + wholeBombOffsetX, -299.2 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[0] setRotation:135.4];
                [bombingAniStruct[i]->s_debris[0] setScaleX:0.397];
                [bombingAniStruct[i]->s_debris[0] setScaleY:0.635];
                [bombingAniStruct[i]->s_debris[0] setOpacity:42.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[1] setPosition:ccp(308.8 + wholeBombOffsetX, -179.2 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[1] setRotation:-116.6];
                [bombingAniStruct[i]->s_debris[1] setScaleX:0.635];
                [bombingAniStruct[i]->s_debris[1] setScaleY:0.943];
                [bombingAniStruct[i]->s_debris[1] setOpacity:55.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[2] setPosition:ccp(453.8 + wholeBombOffsetX, -193.2 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[2] setRotation:-32.3];
                [bombingAniStruct[i]->s_debris[2] setScaleX:0.636];
                [bombingAniStruct[i]->s_debris[2] setScaleY:0.636];
                [bombingAniStruct[i]->s_debris[2] setOpacity:47.0/100.0 * 255.0];
            }
            
            //Frame 11
            if(bombingAniStruct[i]->aniTimer == 9){
                [bombingAniStruct[i]->s_wave setPosition:ccp(351.5 + wholeBombOffsetX, -265.4 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_wave setScaleX:1.386 * 2.099];
                [bombingAniStruct[i]->s_wave setScaleY:1.386 * 2.099];
                [bombingAniStruct[i]->s_wave setOpacity:28.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[0] setPosition:ccp(282.2 + wholeBombOffsetX, -305.1 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[0] setRotation:134.4];
                [bombingAniStruct[i]->s_debris[0] setScaleX:0.393];
                [bombingAniStruct[i]->s_debris[0] setScaleY:0.635];
                [bombingAniStruct[i]->s_debris[0] setOpacity:32.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[1] setPosition:ccp(301.6 + wholeBombOffsetX, -164.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[1] setRotation:-115.1];
                [bombingAniStruct[i]->s_debris[1] setScaleX:0.635];
                [bombingAniStruct[i]->s_debris[1] setScaleY:0.952];
                [bombingAniStruct[i]->s_debris[1] setOpacity:46.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[2] setPosition:ccp(469.9 + wholeBombOffsetX, -181.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[2] setRotation:-32.3];
                [bombingAniStruct[i]->s_debris[2] setScaleX:0.636];
                [bombingAniStruct[i]->s_debris[2] setScaleY:0.636];
                [bombingAniStruct[i]->s_debris[2] setOpacity:38.0/100.0 * 255.0];
            }
            
            //Frame 12
            if(bombingAniStruct[i]->aniTimer == 10){
                [bombingAniStruct[i]->s_wave setPosition:ccp(351.5 + wholeBombOffsetX, -265.4 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_wave setScaleX:1.558 * 2.099];
                [bombingAniStruct[i]->s_wave setScaleY:1.558 * 2.099];
                [bombingAniStruct[i]->s_wave setOpacity:18.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[0] setPosition:ccp(273.1 + wholeBombOffsetX, -310.5 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[0] setRotation:133.6];
                [bombingAniStruct[i]->s_debris[0] setScaleX:0.389];
                [bombingAniStruct[i]->s_debris[0] setScaleY:0.635];
                [bombingAniStruct[i]->s_debris[0] setOpacity:22.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[1] setPosition:ccp(294.6 + wholeBombOffsetX, -150.9 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[1] setRotation:-113.6];
                [bombingAniStruct[i]->s_debris[1] setScaleX:0.635];
                [bombingAniStruct[i]->s_debris[1] setScaleY:0.96];
                [bombingAniStruct[i]->s_debris[1] setOpacity:38.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[2] setPosition:ccp(485.1 + wholeBombOffsetX, -170.9 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[2] setRotation:-32.3];
                [bombingAniStruct[i]->s_debris[2] setScaleX:0.636];
                [bombingAniStruct[i]->s_debris[2] setScaleY:0.636];
                [bombingAniStruct[i]->s_debris[2] setOpacity:28.0/100.0 * 255.0];
            }
            
            
            //Frame 13
            if(bombingAniStruct[i]->aniTimer == 11){
                [bombingAniStruct[i]->s_wave setPosition:ccp(351.5 + wholeBombOffsetX, -265.4 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_wave setScaleX:1.72 * 2.099];
                [bombingAniStruct[i]->s_wave setScaleY:1.72 * 2.099];
                [bombingAniStruct[i]->s_wave setOpacity:9.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[0] setPosition:ccp(264.8 + wholeBombOffsetX, -315.4 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[0] setRotation:133.1];
                [bombingAniStruct[i]->s_debris[0] setScaleX:0.386];
                [bombingAniStruct[i]->s_debris[0] setScaleY:0.635];
                [bombingAniStruct[i]->s_debris[0] setOpacity:13.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[1] setPosition:ccp(288.1 + wholeBombOffsetX, -137.6 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[1] setRotation:-112.6];
                [bombingAniStruct[i]->s_debris[1] setScaleX:0.635];
                [bombingAniStruct[i]->s_debris[1] setScaleY:0.969];
                [bombingAniStruct[i]->s_debris[1] setOpacity:30.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[2] setPosition:ccp(499.4 + wholeBombOffsetX, -160.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[2] setRotation:-32.3];
                [bombingAniStruct[i]->s_debris[2] setScaleX:0.636];
                [bombingAniStruct[i]->s_debris[2] setScaleY:0.636];
                [bombingAniStruct[i]->s_debris[2] setOpacity:19.0/100.0 * 255.0];
                
            }
            
            
            //Frame 14
            if(bombingAniStruct[i]->aniTimer == 12){
                [bombingAniStruct[i]->s_wave setPosition:ccp(10000 , 265)];
                
                [bombingAniStruct[i]->s_debris[0] setPosition:ccp(257.8 + wholeBombOffsetX, -319.5 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[0] setRotation:132.6];
                [bombingAniStruct[i]->s_debris[0] setScaleX:0.383];
                [bombingAniStruct[i]->s_debris[0] setScaleY:0.635];
                [bombingAniStruct[i]->s_debris[0] setOpacity:5.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[1] setPosition:ccp(281.9 + wholeBombOffsetX, -125.0 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[1] setRotation:-111.0];
                [bombingAniStruct[i]->s_debris[1] setScaleX:0.635];
                [bombingAniStruct[i]->s_debris[1] setScaleY:0.976];
                [bombingAniStruct[i]->s_debris[1] setOpacity:23.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[2] setPosition:ccp(512.2 + wholeBombOffsetX, -151.7 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[2] setRotation:-32.3];
                [bombingAniStruct[i]->s_debris[2] setScaleX:0.636];
                [bombingAniStruct[i]->s_debris[2] setScaleY:0.636];
                [bombingAniStruct[i]->s_debris[2] setOpacity:11.0/100.0 * 255.0];
                
            }
            
            
            //Frame 15
            if(bombingAniStruct[i]->aniTimer == 13){
                
                [bombingAniStruct[i]->s_debris[0] setPosition:ccp(10000, 319.5)];
                
                [bombingAniStruct[i]->s_debris[1] setPosition:ccp(276.1 + wholeBombOffsetX, -113.3 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[1] setRotation:-109.8];
                [bombingAniStruct[i]->s_debris[1] setScaleX:0.635];
                [bombingAniStruct[i]->s_debris[1] setScaleY:0.984];
                [bombingAniStruct[i]->s_debris[1] setOpacity:16.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[2] setPosition:ccp(523.0 + wholeBombOffsetX, -143.9 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[2] setRotation:-32.3];
                [bombingAniStruct[i]->s_debris[2] setScaleX:0.636];
                [bombingAniStruct[i]->s_debris[2] setScaleY:0.636];
                [bombingAniStruct[i]->s_debris[2] setOpacity:5.0/100.0 * 255.0];
            }
            
            
            //Frame 16
            if(bombingAniStruct[i]->aniTimer == 14){
                
                
                [bombingAniStruct[i]->s_debris[1] setPosition:ccp(270.9 + wholeBombOffsetX, -102.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[1] setRotation:-108.6];
                [bombingAniStruct[i]->s_debris[1] setScaleX:0.635];
                [bombingAniStruct[i]->s_debris[1] setScaleY:0.99];
                [bombingAniStruct[i]->s_debris[1] setOpacity:9.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[2] setPosition:ccp(10000 , 143.9)];
                
            }
            
            
            //Frame 17
            if(bombingAniStruct[i]->aniTimer == 15){
                [bombingAniStruct[i]->s_debris[1] setPosition:ccp(266.4 + wholeBombOffsetX, -93.9 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[1] setRotation:-107.6];
                [bombingAniStruct[i]->s_debris[1] setScaleX:0.635];
                [bombingAniStruct[i]->s_debris[1] setScaleY:0.996];
                [bombingAniStruct[i]->s_debris[1] setOpacity:4.0/100.0 * 255.0];
            }
            
            
            //Frame 18
            if(bombingAniStruct[i]->aniTimer == 16){
                [bombingAniStruct[i]->s_debris[1] setPosition:ccp(10000, 93.9)];
            }
            
            
            
            
            if(bombingAniStruct[i]->aniTimer == 17){
                bombingAniStruct[i]->isAniShake = false;
            }
            
        }//end if bombingAniStrut i isAni
        
        
    }
}

-(void) managePlusTimeAni{
    static float wholeBombOffsetX = 0;
    static float wholeBombOffsetY = 0;
    static float plusTimeScale = 2.0;
    
    
    for(int i = 0 ; i < bombingAniMax ; i++){
        
        if(bombingAniStruct[i]->isAniPlusTime){
            
            //printf("DDBC:%i %i\n",i, bombingAniStruct[i]->aniTimer);
            
            wholeBombOffsetX = bombingAniStruct[i]->aniX;
            wholeBombOffsetY = bombingAniStruct[i]->aniY;
            
            // printf("i:%4.8f %4.8f\n",wholeBombOffsetX,wholeBombOffsetY);
            
            bombingAniStruct[i]->aniTimer++;
            
            //Frame 3
            if(bombingAniStruct[i]->aniTimer == 1){
                [bombingAniStruct[i]->s_buum setPosition:ccp(356.4 + wholeBombOffsetX, -259.7 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_buum setRotation:25.8];
                [bombingAniStruct[i]->s_buum setScaleX:0.522 * 1.537 * plusTimeScale];
                [bombingAniStruct[i]->s_buum setScaleY:0.522 * 1.537 * plusTimeScale];
                [bombingAniStruct[i]->s_buum setOpacity:50.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_blick setPosition:ccp(350.5 + wholeBombOffsetX, -261.4 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_blick setScaleX:1.064 * plusTimeScale];
                [bombingAniStruct[i]->s_blick setScaleY:1.064 * plusTimeScale];
                [bombingAniStruct[i]->s_blick setOpacity:33.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_wave setPosition:ccp(351.5 + wholeBombOffsetX, -265.4 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_wave setScaleX:0.335 * 2.099 * plusTimeScale];
                [bombingAniStruct[i]->s_wave setScaleY:0.335 * 2.099 * plusTimeScale];
                [bombingAniStruct[i]->s_wave setOpacity:39.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[0] setPosition:ccp(367.3 + wholeBombOffsetX, -273.6 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[0] setRotation:113.3];
                [bombingAniStruct[i]->s_bigClouds[0] setScaleX:1.598 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[0] setScaleY:1.598 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[0] setOpacity:79.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[1] setPosition:ccp(367.6 + wholeBombOffsetX, -247.9 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[1] setRotation:43.6];
                [bombingAniStruct[i]->s_bigClouds[1] setScaleX:2.091 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[1] setScaleY:2.091 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[1] setOpacity:79.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[2] setPosition:ccp(345.4 + wholeBombOffsetX, -245.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[2] setRotation:43.6];
                [bombingAniStruct[i]->s_bigClouds[2] setScaleX:1.321 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[2] setScaleY:1.321 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[2] setOpacity:79/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[3] setPosition:ccp(351.1 + wholeBombOffsetX, -277.1 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[3] setRotation:151.2];
                [bombingAniStruct[i]->s_bigClouds[3] setScaleX:2.117 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[3] setScaleY:2.117 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[3] setOpacity:79.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[4] setPosition:ccp(330.0 + wholeBombOffsetX, -247.5 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[4] setRotation:-9.8];
                [bombingAniStruct[i]->s_bigClouds[4] setScaleX:2.015 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[4] setScaleY:2.015 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[4] setOpacity:79.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[5] setPosition:ccp(349.8 + wholeBombOffsetX, -256.4 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[5] setRotation:-14.6];
                [bombingAniStruct[i]->s_bigClouds[5] setScaleX:1.613 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[5] setScaleY:1.613 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[5] setOpacity:47.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[6] setPosition:ccp(341.6 + wholeBombOffsetX, -259.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[6] setRotation:-22.6];
                [bombingAniStruct[i]->s_bigClouds[6] setScaleX:1.499 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[6] setScaleY:1.499 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[6] setOpacity:46.0/100.0 * 255.0];
            }
            
            //Frame 4
            if(bombingAniStruct[i]->aniTimer == 2){
                [bombingAniStruct[i]->s_buum setPosition:ccp(360.1 + wholeBombOffsetX, -264.2 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_buum setRotation:51.9];
                [bombingAniStruct[i]->s_buum setScaleX:0.859 * 1.537 * plusTimeScale];
                [bombingAniStruct[i]->s_buum setScaleY:0.859 * 1.537 * plusTimeScale];
                [bombingAniStruct[i]->s_buum setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_blick setPosition:ccp(350.5 + wholeBombOffsetX, -261.5 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_blick setScaleX:1.527 * plusTimeScale];
                [bombingAniStruct[i]->s_blick setScaleY:1.527 * plusTimeScale];
                [bombingAniStruct[i]->s_blick setOpacity:67.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_wave setPosition:ccp(351.5 + wholeBombOffsetX, -265.4 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_wave setScaleX:0.5 * 2.099 * plusTimeScale];
                [bombingAniStruct[i]->s_wave setScaleY:0.5 * 2.099 * plusTimeScale];
                [bombingAniStruct[i]->s_wave setOpacity:79.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[0] setPosition:ccp(368.9 + wholeBombOffsetX, -277.9 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[0] setRotation:113.1];
                [bombingAniStruct[i]->s_bigClouds[0] setScaleX:1.856 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[0] setScaleY:1.856 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[0] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[1] setPosition:ccp(369.2 + wholeBombOffsetX, -247.7 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[1] setRotation:39.3];
                [bombingAniStruct[i]->s_bigClouds[1] setScaleX:2.392 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[1] setScaleY:2.392 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[1] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[2] setPosition:ccp(344.7 + wholeBombOffsetX, -246.2 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[2] setRotation:39.3];
                [bombingAniStruct[i]->s_bigClouds[2] setScaleX:1.508 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[2] setScaleY:1.508 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[2] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[3] setPosition:ccp(350.9 + wholeBombOffsetX, -279.6 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[3] setRotation:154.5];
                [bombingAniStruct[i]->s_bigClouds[3] setScaleX:2.414 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[3] setScaleY:2.414 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[3] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[4] setPosition:ccp(327.1 + wholeBombOffsetX, -246.4 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[4] setRotation:-12.5];
                [bombingAniStruct[i]->s_bigClouds[4] setScaleX:2.273 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[4] setScaleY:2.273 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[4] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[5] setPosition:ccp(349.7 + wholeBombOffsetX, -256.3 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[5] setRotation:-8.3];
                [bombingAniStruct[i]->s_bigClouds[5] setScaleX:1.915 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[5] setScaleY:1.915 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[5] setOpacity:70.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[6] setPosition:ccp(341.6 + wholeBombOffsetX, -259.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[6] setRotation:-33.8];
                [bombingAniStruct[i]->s_bigClouds[6] setScaleX:1.797 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[6] setScaleY:1.797 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[6] setOpacity:69.0/100.0 * 255.0];
            }
            
            //Frame 5
            if(bombingAniStruct[i]->aniTimer == 3){
                [bombingAniStruct[i]->s_buum setPosition:ccp(353.6 + wholeBombOffsetX, -266.0 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_buum setRotation:86.2];
                [bombingAniStruct[i]->s_buum setScaleX:0.534 * 1.537 * plusTimeScale];
                [bombingAniStruct[i]->s_buum setScaleY:0.534 * 1.537 * plusTimeScale];
                [bombingAniStruct[i]->s_buum setOpacity:50.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_blick setPosition:ccp(350.5 + wholeBombOffsetX, -261.5 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_blick setScaleX:1.991 * plusTimeScale];
                [bombingAniStruct[i]->s_blick setScaleY:1.991 * plusTimeScale];
                [bombingAniStruct[i]->s_blick setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_wave setPosition:ccp(351.5 + wholeBombOffsetX, -265.4 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_wave setScaleX:0.554 * 2.099 * plusTimeScale];
                [bombingAniStruct[i]->s_wave setScaleY:0.554 * 2.099 * plusTimeScale];
                [bombingAniStruct[i]->s_wave setOpacity:75/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[0] setPosition:ccp(345.8 + wholeBombOffsetX, -267.5 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[0] setRotation:139.6];
                [bombingAniStruct[i]->s_debris[0] setScaleX:0.419 * plusTimeScale];
                [bombingAniStruct[i]->s_debris[0] setScaleY:0.636 * plusTimeScale];
                [bombingAniStruct[i]->s_debris[0] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[1] setPosition:ccp(345.8 + wholeBombOffsetX, -254.0 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[1] setRotation:-124.6];
                [bombingAniStruct[i]->s_debris[1] setScaleX:0.636 * plusTimeScale];
                [bombingAniStruct[i]->s_debris[1] setScaleY:0.899 * plusTimeScale];
                [bombingAniStruct[i]->s_debris[1] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[2] setPosition:ccp(367.8 + wholeBombOffsetX, -254.5 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[2] setRotation:-32.3];
                [bombingAniStruct[i]->s_debris[2] setScaleX:0.636 * plusTimeScale];
                [bombingAniStruct[i]->s_debris[2] setScaleY:0.636 * plusTimeScale];
                [bombingAniStruct[i]->s_debris[2] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[0] setPosition:ccp(370.6 + wholeBombOffsetX, -280.2 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[0] setRotation:116.9];
                [bombingAniStruct[i]->s_bigClouds[0] setScaleX:1.8 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[0] setScaleY:1.8 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[0] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[1] setPosition:ccp(370.3 + wholeBombOffsetX, -246.7 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[1] setRotation:35.6];
                [bombingAniStruct[i]->s_bigClouds[1] setScaleX:2.342 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[1] setScaleY:2.342 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[1] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[2] setPosition:ccp(344.+ + wholeBombOffsetX, -244.4 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[2] setRotation:35.6];
                [bombingAniStruct[i]->s_bigClouds[2] setScaleX:1.479 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[2] setScaleY:1.479 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[2] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[3] setPosition:ccp(350.9 + wholeBombOffsetX, -281.1 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[3] setRotation:157.7];
                [bombingAniStruct[i]->s_bigClouds[3] setScaleX:2.365 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[3] setScaleY:2.365 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[3] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[4] setPosition:ccp(325.2 + wholeBombOffsetX, -245.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[4] setRotation:-14.8];
                [bombingAniStruct[i]->s_bigClouds[4] setScaleX:2.227 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[4] setScaleY:2.227 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[4] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[5] setPosition:ccp(349.7 + wholeBombOffsetX, -256.3 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[5] setRotation:-3.3];
                [bombingAniStruct[i]->s_bigClouds[5] setScaleX:2.151 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[5] setScaleY:2.151 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[5] setOpacity:88.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[6] setPosition:ccp(341.6 + wholeBombOffsetX, -259.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[6] setRotation:-42.9];
                [bombingAniStruct[i]->s_bigClouds[6] setScaleX:2.04 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[6] setScaleY:2.04 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[6] setOpacity:88.0/100.0 * 255.0];
            }
            
            //Frame 6
            if(bombingAniStruct[i]->aniTimer == 4){
                [bombingAniStruct[i]->s_buum setPosition:ccp(353000, 10000)];
                
                [bombingAniStruct[i]->s_blick setPosition:ccp(350.5 + wholeBombOffsetX, -261.5 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_blick setScaleX:1.492 * plusTimeScale];
                [bombingAniStruct[i]->s_blick setScaleY:1.492 * plusTimeScale];
                [bombingAniStruct[i]->s_blick setOpacity:67.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_wave setPosition:ccp(351.5 + wholeBombOffsetX, -265.4 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_wave setScaleX:0.639 * 2.099 * plusTimeScale];
                [bombingAniStruct[i]->s_wave setScaleY:0.639 * 2.099 * plusTimeScale];
                [bombingAniStruct[i]->s_wave setOpacity:71.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[0] setPosition:ccp(335.3 + wholeBombOffsetX, -273.6 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[0] setRotation:138.9];
                [bombingAniStruct[i]->s_debris[0] setScaleX:0.424 * plusTimeScale];
                [bombingAniStruct[i]->s_debris[0] setScaleY:0.635 * plusTimeScale];
                [bombingAniStruct[i]->s_debris[0] setOpacity:89.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[1] setPosition:ccp(338.6 + wholeBombOffsetX, -239.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[1] setRotation:-123.1];
                [bombingAniStruct[i]->s_debris[1] setScaleX:0.636 * plusTimeScale];
                [bombingAniStruct[i]->s_debris[1] setScaleY:0.899 * plusTimeScale];
                [bombingAniStruct[i]->s_debris[1] setOpacity:91.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[2] setPosition:ccp(384.5 + wholeBombOffsetX, -242.6 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[2] setRotation:-32.3];
                [bombingAniStruct[i]->s_debris[2] setScaleX:0.636 * plusTimeScale];
                [bombingAniStruct[i]->s_debris[2] setScaleY:0.636 * plusTimeScale];
                [bombingAniStruct[i]->s_debris[2] setOpacity:90.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[0] setPosition:ccp(372.6 + wholeBombOffsetX, -283.0 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[0] setRotation:121.8];
                [bombingAniStruct[i]->s_bigClouds[0] setScaleX:1.734 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[0] setScaleY:1.734 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[0] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[1] setPosition:ccp(372.2 + wholeBombOffsetX, -244.9 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[1] setRotation:29.1];
                [bombingAniStruct[i]->s_bigClouds[1] setScaleX:2.26 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[1] setScaleY:2.26 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[1] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[2] setPosition:ccp(344.4 + wholeBombOffsetX, -241.1 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[2] setRotation:29.1];
                [bombingAniStruct[i]->s_bigClouds[2] setScaleX:1.431 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[2] setScaleY:1.431 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[2] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[3] setPosition:ccp(350.9 + wholeBombOffsetX, -283.9 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[3] setRotation:163.2];
                [bombingAniStruct[i]->s_bigClouds[3] setScaleX:2.281 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[3] setScaleY:2.281 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[3] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[4] setPosition:ccp(321.9 + wholeBombOffsetX, -244.6 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[4] setRotation:-19.3];
                [bombingAniStruct[i]->s_bigClouds[4] setScaleX:2.146 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[4] setScaleY:2.146 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[4] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[5] setPosition:ccp(349.7 + wholeBombOffsetX, -256.3 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[5] setRotation:0];
                [bombingAniStruct[i]->s_bigClouds[5] setScaleX:2.309 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[5] setScaleY:2.309 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[5] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[6] setPosition:ccp(341.6 + wholeBombOffsetX, -259.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[6] setRotation:-49.2];
                [bombingAniStruct[i]->s_bigClouds[6] setScaleX:2.208 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[6] setScaleY:2.208 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[6] setOpacity:100.0/100.0 * 255.0];
            }
            
            
            //Frame 7
            if(bombingAniStruct[i]->aniTimer == 5){
                [bombingAniStruct[i]->s_blick setPosition:ccp(350.5 + wholeBombOffsetX, -261.5 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_blick setScaleX:0.994 * plusTimeScale];
                [bombingAniStruct[i]->s_blick setScaleY:0.994 * plusTimeScale];
                [bombingAniStruct[i]->s_blick setOpacity:33.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_wave setPosition:ccp(351.5 + wholeBombOffsetX, -265.4 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_wave setScaleX:0.753 * 2.099 * plusTimeScale];
                [bombingAniStruct[i]->s_wave setScaleY:0.753 * 2.099 * plusTimeScale];
                [bombingAniStruct[i]->s_wave setOpacity:64.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[0] setPosition:ccp(324.1 + wholeBombOffsetX, -280.2 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[0] setRotation:137.9];
                [bombingAniStruct[i]->s_debris[0] setScaleX:0.424 * plusTimeScale];
                [bombingAniStruct[i]->s_debris[0] setScaleY:0.635 * plusTimeScale];
                [bombingAniStruct[i]->s_debris[0] setOpacity:77.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[1] setPosition:ccp(331.1 + wholeBombOffsetX, -224.4 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[1] setRotation:-121.4];
                [bombingAniStruct[i]->s_debris[1] setScaleX:0.636 * plusTimeScale];
                [bombingAniStruct[i]->s_debris[1] setScaleY:0.899 * plusTimeScale];
                [bombingAniStruct[i]->s_debris[1] setOpacity:82.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[2] setPosition:ccp(402.1 + wholeBombOffsetX, -230.0 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[2] setRotation:-32.3];
                [bombingAniStruct[i]->s_debris[2] setScaleX:0.636 * plusTimeScale];
                [bombingAniStruct[i]->s_debris[2] setScaleY:0.636 * plusTimeScale];
                [bombingAniStruct[i]->s_debris[2] setOpacity:79.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[0] setPosition:ccp(375.0 + wholeBombOffsetX, -286.4 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[0] setRotation:127.6];
                [bombingAniStruct[i]->s_bigClouds[0] setScaleX:1.657 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[0] setScaleY:1.657 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[0] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[1] setPosition:ccp(374.9 + wholeBombOffsetX, -242.6 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[1] setRotation:20.8];
                [bombingAniStruct[i]->s_bigClouds[1] setScaleX:2.153 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[1] setScaleY:2.153 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[1] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[2] setPosition:ccp(344.1 + wholeBombOffsetX, -236.9 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[2] setRotation:20.8];
                [bombingAniStruct[i]->s_bigClouds[2] setScaleX:1.37 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[2] setScaleY:1.37 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[2] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[3] setPosition:ccp(350.9 + wholeBombOffsetX, -287.6 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[3] setRotation:170.2];
                [bombingAniStruct[i]->s_bigClouds[3] setScaleX:2.173 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[3] setScaleY:2.173 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[3] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[4] setPosition:ccp(317.4 + wholeBombOffsetX, -243.0 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[4] setRotation:-24.8];
                [bombingAniStruct[i]->s_bigClouds[4] setScaleX:2.043 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[4] setScaleY:2.043 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[4] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[5] setPosition:ccp(349.7 + wholeBombOffsetX, -256.3 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[5] setRotation:1.5];
                [bombingAniStruct[i]->s_bigClouds[5] setScaleX:2.334 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[5] setScaleY:2.334 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[5] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[6] setPosition:ccp(341.6 + wholeBombOffsetX, -259.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[6] setRotation:-50.6];
                [bombingAniStruct[i]->s_bigClouds[6] setScaleX:2.226 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[6] setScaleY:2.226 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[6] setOpacity:100.0/100.0 * 255.0];
                
            }
            
            //Frame 8
            if(bombingAniStruct[i]->aniTimer == 6){
                [bombingAniStruct[i]->s_blick setPosition:ccp(10000 , 261.5)];
                
                [bombingAniStruct[i]->s_wave setPosition:ccp(351.5 + wholeBombOffsetX, -265.4 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_wave setScaleX:0.89 * 2.099 * plusTimeScale];
                [bombingAniStruct[i]->s_wave setScaleY:0.89 * 2.099 * plusTimeScale];
                [bombingAniStruct[i]->s_wave setOpacity:56.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[0] setPosition:ccp(313.1 + wholeBombOffsetX, -286.9 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[0] setRotation:136.9];
                [bombingAniStruct[i]->s_debris[0] setScaleX:0.405 * plusTimeScale];
                [bombingAniStruct[i]->s_debris[0] setScaleY:0.635 * plusTimeScale];
                [bombingAniStruct[i]->s_debris[0] setOpacity:65.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[1] setPosition:ccp(323.6 + wholeBombOffsetX, -209.2 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[1] setRotation:-119.8];
                [bombingAniStruct[i]->s_debris[1] setScaleX:0.636 * plusTimeScale];
                [bombingAniStruct[i]->s_debris[1] setScaleY:0.925 * plusTimeScale];
                [bombingAniStruct[i]->s_debris[1] setOpacity:73/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[2] setPosition:ccp(419.8 + wholeBombOffsetX, -217.4 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[2] setRotation:-32.3];
                [bombingAniStruct[i]->s_debris[2] setScaleX:0.636 * plusTimeScale];
                [bombingAniStruct[i]->s_debris[2] setScaleY:0.636 * plusTimeScale];
                [bombingAniStruct[i]->s_debris[2] setOpacity:68.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[0] setPosition:ccp(377.6 + wholeBombOffsetX, -290.1 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[0] setRotation:134.1];
                [bombingAniStruct[i]->s_bigClouds[0] setScaleX:1.568 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[0] setScaleY:1.568 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[0] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[1] setPosition:ccp(378 + wholeBombOffsetX, -240.1 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[1] setRotation:11.0];
                [bombingAniStruct[i]->s_bigClouds[1] setScaleX:2.029 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[1] setScaleY:2.029 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[1] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[2] setPosition:ccp(343.8 + wholeBombOffsetX, -232.1 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[2] setRotation:11.0];
                [bombingAniStruct[i]->s_bigClouds[2] setScaleX:1.299 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[2] setScaleY:1.299 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[2] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[3] setPosition:ccp(351.1 + wholeBombOffsetX, -291.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[3] setRotation:178.7];
                [bombingAniStruct[i]->s_bigClouds[3] setScaleX:2.048 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[3] setScaleY:2.048 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[3] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[4] setPosition:ccp(312.4 + wholeBombOffsetX, -241.2 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[4] setRotation:-31.3];
                [bombingAniStruct[i]->s_bigClouds[4] setScaleX:1.922 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[4] setScaleY:1.922 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[4] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[5] setPosition:ccp(349.7 + wholeBombOffsetX, -256.3 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[5] setRotation:3.8];
                [bombingAniStruct[i]->s_bigClouds[5] setScaleX:2.366 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[5] setScaleY:2.366 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[5] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[6] setPosition:ccp(341.6 + wholeBombOffsetX, -259.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[6] setRotation:-53.1];
                [bombingAniStruct[i]->s_bigClouds[6] setScaleX:2.262 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[6] setScaleY:2.262 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[6] setOpacity:100.0/100.0 * 255.0];
                
                
                [bombingAniStruct[i]->s_smallClouds[0] setPosition:ccp(339 + wholeBombOffsetX, -258.5 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[0] setRotation:47.6];
                [bombingAniStruct[i]->s_smallClouds[0] setScaleX:2.801 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[0] setScaleY:2.801 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[0] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[1] setPosition:ccp(347.0 + wholeBombOffsetX, -263.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[1] setRotation:-62.4];
                [bombingAniStruct[i]->s_smallClouds[1] setScaleX:1.606 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[1] setScaleY:1.606 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[1] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[2] setPosition:ccp(350.8 + wholeBombOffsetX, -245 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[2] setRotation:78.7];
                [bombingAniStruct[i]->s_smallClouds[2] setScaleX:1.956 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[2] setScaleY:1.956 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[2] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[3] setPosition:ccp(339.8 + wholeBombOffsetX, -251.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[3] setRotation:-130.4];
                [bombingAniStruct[i]->s_smallClouds[3] setScaleX:2.226 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[3] setScaleY:2.226 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[3] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[4] setPosition:ccp(358.8 + wholeBombOffsetX, -253.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[4] setRotation:0];
                [bombingAniStruct[i]->s_smallClouds[4] setScaleX:2.223 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[4] setScaleY:2.223 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[4] setOpacity:100.0/100.0 * 255.0];
            }
            
            //Frame 9
            if(bombingAniStruct[i]->aniTimer == 7){
                [bombingAniStruct[i]->s_wave setPosition:ccp(351.5 + wholeBombOffsetX, -265.4 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_wave setScaleX:1.045 * 2.099 * plusTimeScale];
                [bombingAniStruct[i]->s_wave setScaleY:1.015 * 2.099 * plusTimeScale];
                [bombingAniStruct[i]->s_wave setOpacity:47.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[0] setPosition:ccp(302.4 + wholeBombOffsetX, -293.1 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[0] setRotation:136.1];
                [bombingAniStruct[i]->s_debris[0] setScaleX:0.401 * plusTimeScale];
                [bombingAniStruct[i]->s_debris[0] setScaleY:0.635 * plusTimeScale];
                [bombingAniStruct[i]->s_debris[0] setOpacity:54.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[1] setPosition:ccp(316.1 + wholeBombOffsetX, -194.1 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[1] setRotation:-118.3];
                [bombingAniStruct[i]->s_debris[1] setScaleX:0.635 * plusTimeScale];
                [bombingAniStruct[i]->s_debris[1] setScaleY:0.934 * plusTimeScale];
                [bombingAniStruct[i]->s_debris[1] setOpacity:64.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[2] setPosition:ccp(437 + wholeBombOffsetX, -205.2 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[2] setRotation:-32.3];
                [bombingAniStruct[i]->s_debris[2] setScaleX:0.636 * plusTimeScale];
                [bombingAniStruct[i]->s_debris[2] setScaleY:0.636 * plusTimeScale];
                [bombingAniStruct[i]->s_debris[2] setOpacity:57.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[0] setPosition:ccp(380.8 + wholeBombOffsetX, -294.2 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[0] setRotation:141.4];
                [bombingAniStruct[i]->s_bigClouds[0] setScaleX:1.471 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[0] setScaleY:1.471 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[0] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[1] setPosition:ccp(381.1 + wholeBombOffsetX, -237.1 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[1] setRotation:0.3];
                [bombingAniStruct[i]->s_bigClouds[1] setScaleX:1.892 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[1] setScaleY:1.892 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[1] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[2] setPosition:ccp(343.4 + wholeBombOffsetX, -226.7 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[2] setRotation:0.3];
                [bombingAniStruct[i]->s_bigClouds[2] setScaleX:1.22 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[2] setScaleY:1.22 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[2] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[3] setPosition:ccp(351.1 + wholeBombOffsetX, -296.5 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[3] setRotation:-172.2];
                [bombingAniStruct[i]->s_bigClouds[3] setScaleX:1.908 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[3] setScaleY:1.908 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[3] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[4] setPosition:ccp(306.9 + wholeBombOffsetX, -239.3 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[4] setRotation:-38.6];
                [bombingAniStruct[i]->s_bigClouds[4] setScaleX:1.792 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[4] setScaleY:1.792 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[4] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[5] setPosition:ccp(349.7 + wholeBombOffsetX, -256.3 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[5] setRotation:6.0];
                [bombingAniStruct[i]->s_bigClouds[5] setScaleX:2.402 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[5] setScaleY:2.402 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[5] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[6] setPosition:ccp(341.4 + wholeBombOffsetX, -259.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[6] setRotation:-53.6];
                [bombingAniStruct[i]->s_bigClouds[6] setScaleX:2.312 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[6] setScaleY:2.312 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[6] setOpacity:100.0/100.0 * 255.0];
                
                
                [bombingAniStruct[i]->s_smallClouds[0] setPosition:ccp(333.4 + wholeBombOffsetX, -258.4 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[0] setRotation:53.6];
                [bombingAniStruct[i]->s_smallClouds[0] setScaleX:2.722 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[0] setScaleY:2.722 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[0] setOpacity:96.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[1] setPosition:ccp(344.6 + wholeBombOffsetX, -265.4 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[1] setRotation:-64.9];
                [bombingAniStruct[i]->s_smallClouds[1] setScaleX:1.57 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[1] setScaleY:1.57 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[1] setOpacity:96.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[2] setPosition:ccp(350.9 + wholeBombOffsetX, -241.7 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[2] setRotation:83.7];
                [bombingAniStruct[i]->s_smallClouds[2] setScaleX:1.91 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[2] setScaleY:1.91 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[2] setOpacity:96.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[3] setPosition:ccp(337.1 + wholeBombOffsetX, -248.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[3] setRotation:-130.4];
                [bombingAniStruct[i]->s_smallClouds[3] setScaleX:2.168 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[3] setScaleY:2.168 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[3] setOpacity:96.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[4] setPosition:ccp(362.6 + wholeBombOffsetX, -253.5 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[4] setRotation:-4.3];
                [bombingAniStruct[i]->s_smallClouds[4] setScaleX:2.174 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[4] setScaleY:2.174 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[4] setOpacity:96.0/100.0 * 255.0];
            }
            
            //Frame 10
            if(bombingAniStruct[i]->aniTimer == 8){
                [bombingAniStruct[i]->s_wave setPosition:ccp(351.5 + wholeBombOffsetX, -265.4 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_wave setScaleX:1.213 * 2.099 * plusTimeScale];
                [bombingAniStruct[i]->s_wave setScaleY:1.213 * 2.099 * plusTimeScale];
                [bombingAniStruct[i]->s_wave setOpacity:38.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[0] setPosition:ccp(292.1 + wholeBombOffsetX, -299.2 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[0] setRotation:135.4];
                [bombingAniStruct[i]->s_debris[0] setScaleX:0.397 * plusTimeScale];
                [bombingAniStruct[i]->s_debris[0] setScaleY:0.635 * plusTimeScale];
                [bombingAniStruct[i]->s_debris[0] setOpacity:42.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[1] setPosition:ccp(308.8 + wholeBombOffsetX, -179.2 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[1] setRotation:-116.6];
                [bombingAniStruct[i]->s_debris[1] setScaleX:0.635 * plusTimeScale];
                [bombingAniStruct[i]->s_debris[1] setScaleY:0.943 * plusTimeScale];
                [bombingAniStruct[i]->s_debris[1] setOpacity:55.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[2] setPosition:ccp(453.8 + wholeBombOffsetX, -193.2 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[2] setRotation:-32.3];
                [bombingAniStruct[i]->s_debris[2] setScaleX:0.636 * plusTimeScale];
                [bombingAniStruct[i]->s_debris[2] setScaleY:0.636 * plusTimeScale];
                [bombingAniStruct[i]->s_debris[2] setOpacity:47.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[0] setPosition:ccp(394.1 + wholeBombOffsetX, -298.7 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[0] setRotation:149.4];
                [bombingAniStruct[i]->s_bigClouds[0] setScaleX:1.361 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[0] setScaleY:1.361 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[0] setOpacity:91.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[1] setPosition:ccp(385.1 + wholeBombOffsetX, -234.1 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[1] setRotation:-11.3];
                [bombingAniStruct[i]->s_bigClouds[1] setScaleX:1.742 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[1] setScaleY:1.742 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[1] setOpacity:91.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[2] setPosition:ccp(343.1 + wholeBombOffsetX, -220.9 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[2] setRotation:-11.3];
                [bombingAniStruct[i]->s_bigClouds[2] setScaleX:1.133 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[2] setScaleY:1.133 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[2] setOpacity:91.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[3] setPosition:ccp(351.3 + wholeBombOffsetX, -301.5 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[3] setRotation:-162.4];
                [bombingAniStruct[i]->s_bigClouds[3] setScaleX:1.75 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[3] setScaleY:1.75 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[3] setOpacity:91.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[4] setPosition:ccp(300.9 + wholeBombOffsetX, -237.1 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[4] setRotation:-46.4];
                [bombingAniStruct[i]->s_bigClouds[4] setScaleX:1.647 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[4] setScaleY:1.647 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[4] setOpacity:91.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[5] setPosition:ccp(349.7 + wholeBombOffsetX, -256.3 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[5] setRotation:8.8];
                [bombingAniStruct[i]->s_bigClouds[5] setScaleX:2.444 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[5] setScaleY:2.444 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[5] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[6] setPosition:ccp(341.4 + wholeBombOffsetX, -259.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[6] setRotation:-60.9];
                [bombingAniStruct[i]->s_bigClouds[6] setScaleX:2.375 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[6] setScaleY:2.375 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[6] setOpacity:100.0/100.0 * 255.0];
                
                
                [bombingAniStruct[i]->s_smallClouds[0] setPosition:ccp(326.9 + wholeBombOffsetX, -258.3 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[0] setRotation:60.4];
                [bombingAniStruct[i]->s_smallClouds[0] setScaleX:2.638 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[0] setScaleY:2.638 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[0] setOpacity:93.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[1] setPosition:ccp(341.7 + wholeBombOffsetX, -267.2 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[1] setRotation:-67.7];
                [bombingAniStruct[i]->s_smallClouds[1] setScaleX:1.531 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[1] setScaleY:1.531 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[1] setOpacity:93.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[2] setPosition:ccp(351.1 + wholeBombOffsetX, -237.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[2] setRotation:89.4];
                [bombingAniStruct[i]->s_smallClouds[2] setScaleX:1.858 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[2] setScaleY:1.858 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[2] setOpacity:93.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[3] setPosition:ccp(334.1 + wholeBombOffsetX, -245.2 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[3] setRotation:-130.6];
                [bombingAniStruct[i]->s_smallClouds[3] setScaleX:2.105 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[3] setScaleY:2.105 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[3] setOpacity:93.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[4] setPosition:ccp(367.1 + wholeBombOffsetX, -253.1 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[4] setRotation:-9.5];
                [bombingAniStruct[i]->s_smallClouds[4] setScaleX:2.11 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[4] setScaleY:2.11 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[4] setOpacity:93.0/100.0 * 255.0];
            }
            
            //Frame 11
            if(bombingAniStruct[i]->aniTimer == 9){
                [bombingAniStruct[i]->s_wave setPosition:ccp(351.5 + wholeBombOffsetX, -265.4 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_wave setScaleX:1.386 * 2.099 * plusTimeScale];
                [bombingAniStruct[i]->s_wave setScaleY:1.386 * 2.099 * plusTimeScale];
                [bombingAniStruct[i]->s_wave setOpacity:28.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[0] setPosition:ccp(282.2 + wholeBombOffsetX, -305.1 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[0] setRotation:134.4];
                [bombingAniStruct[i]->s_debris[0] setScaleX:0.393 * plusTimeScale];
                [bombingAniStruct[i]->s_debris[0] setScaleY:0.635 * plusTimeScale];
                [bombingAniStruct[i]->s_debris[0] setOpacity:32.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[1] setPosition:ccp(301.6 + wholeBombOffsetX, -164.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[1] setRotation:-115.1];
                [bombingAniStruct[i]->s_debris[1] setScaleX:0.635 * plusTimeScale];
                [bombingAniStruct[i]->s_debris[1] setScaleY:0.952 * plusTimeScale];
                [bombingAniStruct[i]->s_debris[1] setOpacity:46.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[2] setPosition:ccp(469.9 + wholeBombOffsetX, -181.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[2] setRotation:-32.3];
                [bombingAniStruct[i]->s_debris[2] setScaleX:0.636 * plusTimeScale];
                [bombingAniStruct[i]->s_debris[2] setScaleY:0.636 * plusTimeScale];
                [bombingAniStruct[i]->s_debris[2] setOpacity:38.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[0] setPosition:ccp(387.9 + wholeBombOffsetX, -303.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[0] setRotation:158.2];
                [bombingAniStruct[i]->s_bigClouds[0] setScaleX:1.244 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[0] setScaleY:1.244 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[0] setOpacity:82.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[1] setPosition:ccp(389.1 + wholeBombOffsetX, -230.7 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[1] setRotation:-23.8];
                [bombingAniStruct[i]->s_bigClouds[1] setScaleX:1.583 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[1] setScaleY:1.583 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[1] setOpacity:80.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[2] setPosition:ccp(342.7 + wholeBombOffsetX, -214.7 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[2] setRotation:-23.8];
                [bombingAniStruct[i]->s_bigClouds[2] setScaleX:1.041 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[2] setScaleY:1.041 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[2] setOpacity:80.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[3] setPosition:ccp(351.5 + wholeBombOffsetX, -306.9 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[3] setRotation:-151.7];
                [bombingAniStruct[i]->s_bigClouds[3] setScaleX:1.595 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[3] setScaleY:1.595 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[3] setOpacity:80.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[4] setPosition:ccp(294.6 + wholeBombOffsetX, -234.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[4] setRotation:-54.9];
                [bombingAniStruct[i]->s_bigClouds[4] setScaleX:1.496 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[4] setScaleY:1.496 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[4] setOpacity:80.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[5] setPosition:ccp(349.7 + wholeBombOffsetX, -256.3 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[5] setRotation:13.0];
                [bombingAniStruct[i]->s_bigClouds[5] setScaleX:2.492 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[5] setScaleY:2.495 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[5] setOpacity:100.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[6] setPosition:ccp(341.4 + wholeBombOffsetX, -259.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[6] setRotation:-65.9];
                [bombingAniStruct[i]->s_bigClouds[6] setScaleX:2.453 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[6] setScaleY:2.453 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[6] setOpacity:100.0/100.0 * 255.0];
                
                
                [bombingAniStruct[i]->s_smallClouds[0] setPosition:ccp(319.6 + wholeBombOffsetX, -258.1 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[0] setRotation:68.2];
                [bombingAniStruct[i]->s_smallClouds[0] setScaleX:2.543 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[0] setScaleY:2.543 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[0] setOpacity:89.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[1] setPosition:ccp(338.5 + wholeBombOffsetX, -269.3 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[1] setRotation:-70.7];
                [bombingAniStruct[i]->s_smallClouds[1] setScaleX:1.487 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[1] setScaleY:1.487 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[1] setOpacity:89.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[2] setPosition:ccp(351.2 + wholeBombOffsetX, -233.6 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[2] setRotation:95.6];
                [bombingAniStruct[i]->s_smallClouds[2] setScaleX:1.78 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[2] setScaleY:1.78 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[2] setOpacity:89.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[3] setPosition:ccp(330.7 + wholeBombOffsetX, -241.4 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[3] setRotation:-130.6];
                [bombingAniStruct[i]->s_smallClouds[3] setScaleX:2.034 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[3] setScaleY:2.034 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[3] setOpacity:89.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[4] setPosition:ccp(372.2 + wholeBombOffsetX, -252.7 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[4] setRotation:-15.3];
                [bombingAniStruct[i]->s_smallClouds[4] setScaleX:2.038 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[4] setScaleY:2.038 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[4] setOpacity:89.0/100.0 * 255.0];
            }
            
            //Frame 12
            if(bombingAniStruct[i]->aniTimer == 10){
                [bombingAniStruct[i]->s_wave setPosition:ccp(351.5 + wholeBombOffsetX, -265.4 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_wave setScaleX:1.558 * 2.099 * plusTimeScale];
                [bombingAniStruct[i]->s_wave setScaleY:1.558 * 2.099 * plusTimeScale];
                [bombingAniStruct[i]->s_wave setOpacity:18.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[0] setPosition:ccp(273.1 + wholeBombOffsetX, -310.5 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[0] setRotation:133.6];
                [bombingAniStruct[i]->s_debris[0] setScaleX:0.389 * plusTimeScale];
                [bombingAniStruct[i]->s_debris[0] setScaleY:0.635 * plusTimeScale];
                [bombingAniStruct[i]->s_debris[0] setOpacity:22.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[1] setPosition:ccp(294.6 + wholeBombOffsetX, -150.9 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[1] setRotation:-113.6];
                [bombingAniStruct[i]->s_debris[1] setScaleX:0.635 * plusTimeScale];
                [bombingAniStruct[i]->s_debris[1] setScaleY:0.96 * plusTimeScale];
                [bombingAniStruct[i]->s_debris[1] setOpacity:38.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[2] setPosition:ccp(485.1 + wholeBombOffsetX, -170.9 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[2] setRotation:-32.3];
                [bombingAniStruct[i]->s_debris[2] setScaleX:0.636 * plusTimeScale];
                [bombingAniStruct[i]->s_debris[2] setScaleY:0.636 * plusTimeScale];
                [bombingAniStruct[i]->s_debris[2] setOpacity:28.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[0] setPosition:ccp(391.6 + wholeBombOffsetX, -309.1 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[0] setRotation:167.7];
                [bombingAniStruct[i]->s_bigClouds[0] setScaleX:1.118 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[0] setScaleY:1.118 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[0] setOpacity:72.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[1] setPosition:ccp(393.1 + wholeBombOffsetX, -227.7 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[1] setRotation:-36.6];
                [bombingAniStruct[i]->s_bigClouds[1] setScaleX:1.416 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[1] setScaleY:1.416 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[1] setOpacity:70.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[2] setPosition:ccp(342.2 + wholeBombOffsetX, -208.2 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[2] setRotation:-36.6];
                [bombingAniStruct[i]->s_bigClouds[2] setScaleX:0.946 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[2] setScaleY:0.946 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[2] setOpacity:70.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[3] setPosition:ccp(351.6 + wholeBombOffsetX, -312.6 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[3] setRotation:-140.6];
                [bombingAniStruct[i]->s_bigClouds[3] setScaleX:1.427 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[3] setScaleY:1.427 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[3] setOpacity:70.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[4] setPosition:ccp(287.8 + wholeBombOffsetX, -232.5 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[4] setRotation:-63.5];
                [bombingAniStruct[i]->s_bigClouds[4] setScaleX:1.338 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[4] setScaleY:1.338 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[4] setOpacity:70.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[5] setPosition:ccp(349.8 + wholeBombOffsetX, -256.2 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[5] setRotation:15.3];
                [bombingAniStruct[i]->s_bigClouds[5] setScaleX:2.542 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[5] setScaleY:2.542 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[5] setOpacity:90.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[6] setPosition:ccp(341.4 + wholeBombOffsetX, -259.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[6] setRotation:-71.7];
                [bombingAniStruct[i]->s_bigClouds[6] setScaleX:2.535 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[6] setScaleY:2.535 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[6] setOpacity:86.0/100.0 * 255.0];
                
                
                [bombingAniStruct[i]->s_smallClouds[0] setPosition:ccp(311.4 + wholeBombOffsetX, -258.1 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[0] setRotation:76.9];
                [bombingAniStruct[i]->s_smallClouds[0] setScaleX:2.437 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[0] setScaleY:2.437 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[0] setOpacity:84.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[1] setPosition:ccp(334.9 + wholeBombOffsetX, -271.5 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[1] setRotation:-74.2];
                [bombingAniStruct[i]->s_smallClouds[1] setScaleX:1.438 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[1] setScaleY:1.438 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[1] setOpacity:84.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[2] setPosition:ccp(351.4 + wholeBombOffsetX, -228.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[2] setRotation:102.8];
                [bombingAniStruct[i]->s_smallClouds[2] setScaleX:1.731 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[2] setScaleY:1.731 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[2] setOpacity:84.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[3] setPosition:ccp(326.9 + wholeBombOffsetX, -236.0 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[3] setRotation:-130.9];
                [bombingAniStruct[i]->s_smallClouds[3] setScaleX:1.955 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[3] setScaleY:1.955 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[3] setOpacity:84/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[4] setPosition:ccp(377.8 + wholeBombOffsetX, -252.2 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[4] setRotation:-21.8];
                [bombingAniStruct[i]->s_smallClouds[4] setScaleX:1.959 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[4] setScaleY:1.959 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[4] setOpacity:84.0/100.0 * 255.0];
            }
            
            
            //Frame 13
            if(bombingAniStruct[i]->aniTimer == 11){
                [bombingAniStruct[i]->s_wave setPosition:ccp(351.5 + wholeBombOffsetX, -265.4 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_wave setScaleX:1.72 * 2.099 * plusTimeScale];
                [bombingAniStruct[i]->s_wave setScaleY:1.72 * 2.099 * plusTimeScale];
                [bombingAniStruct[i]->s_wave setOpacity:9.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[0] setPosition:ccp(264.8 + wholeBombOffsetX, -315.4 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[0] setRotation:133.1];
                [bombingAniStruct[i]->s_debris[0] setScaleX:0.386 * plusTimeScale];
                [bombingAniStruct[i]->s_debris[0] setScaleY:0.635 * plusTimeScale];
                [bombingAniStruct[i]->s_debris[0] setOpacity:13.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[1] setPosition:ccp(288.1 + wholeBombOffsetX, -137.6 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[1] setRotation:-112.6];
                [bombingAniStruct[i]->s_debris[1] setScaleX:0.635 * plusTimeScale];
                [bombingAniStruct[i]->s_debris[1] setScaleY:0.969 * plusTimeScale];
                [bombingAniStruct[i]->s_debris[1] setOpacity:30.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[2] setPosition:ccp(499.4 + wholeBombOffsetX, -160.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[2] setRotation:-32.3];
                [bombingAniStruct[i]->s_debris[2] setScaleX:0.636 * plusTimeScale];
                [bombingAniStruct[i]->s_debris[2] setScaleY:0.636 * plusTimeScale];
                [bombingAniStruct[i]->s_debris[2] setOpacity:19.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[0] setPosition:ccp(395.9 + wholeBombOffsetX, -314.9 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[0] setRotation:177.7];
                [bombingAniStruct[i]->s_bigClouds[0] setScaleX:0.983 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[0] setScaleY:0.983 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[0] setOpacity:62.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[1] setPosition:ccp(397.4 + wholeBombOffsetX, -223.5 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[1] setRotation:-50.2];
                [bombingAniStruct[i]->s_bigClouds[1] setScaleX:1.244 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[1] setScaleY:1.244 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[1] setOpacity:59.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[2] setPosition:ccp(341.9 + wholeBombOffsetX, -201.6 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[2] setRotation:-50.2];
                [bombingAniStruct[i]->s_bigClouds[2] setScaleX:0.846 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[2] setScaleY:0.846 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[2] setOpacity:59.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[3] setPosition:ccp(351.7 + wholeBombOffsetX, -318.4 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[3] setRotation:-129.1];
                [bombingAniStruct[i]->s_bigClouds[3] setScaleX:1.253 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[3] setScaleY:1.253 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[3] setOpacity:59.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[4] setPosition:ccp(280.9 + wholeBombOffsetX, -230.0 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[4] setRotation:-72.7];
                [bombingAniStruct[i]->s_bigClouds[4] setScaleX:1.174 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[4] setScaleY:1.174 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[4] setOpacity:59.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[5] setPosition:ccp(349.8 + wholeBombOffsetX, -256.2 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[5] setRotation:19.0];
                [bombingAniStruct[i]->s_bigClouds[5] setScaleX:2.596 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[5] setScaleY:2.596 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[5] setOpacity:79.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[6] setPosition:ccp(341.6 + wholeBombOffsetX, -259.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[6] setRotation:-77.7];
                [bombingAniStruct[i]->s_bigClouds[6] setScaleX:2.627 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[6] setScaleY:2.627 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[6] setOpacity:72.0/100.0 * 255.0];
                
                
                [bombingAniStruct[i]->s_smallClouds[0] setPosition:ccp(302.6 + wholeBombOffsetX, -257.9 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[0] setRotation:86.2];
                [bombingAniStruct[i]->s_smallClouds[0] setScaleX:2.32 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[0] setScaleY:2.32 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[0] setOpacity:79.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[1] setPosition:ccp(330.9 + wholeBombOffsetX, -274.0 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[1] setRotation:-77.7];
                [bombingAniStruct[i]->s_smallClouds[1] setScaleX:1.384 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[1] setScaleY:1.384 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[1] setOpacity:79.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[2] setPosition:ccp(351.6 + wholeBombOffsetX, -223.6 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[2] setRotation:110.5];
                [bombingAniStruct[i]->s_smallClouds[2] setScaleX:1.658 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[2] setScaleY:1.658 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[2] setOpacity:79.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[3] setPosition:ccp(322.8 + wholeBombOffsetX, -232.2 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[3] setRotation:-131.1];
                [bombingAniStruct[i]->s_smallClouds[3] setScaleX:1.868 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[3] setScaleY:1.868 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[3] setOpacity:79.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[4] setPosition:ccp(383.9 + wholeBombOffsetX, -251.7 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[4] setRotation:-28.8];
                [bombingAniStruct[i]->s_smallClouds[4] setScaleX:1.872 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[4] setScaleY:1.872 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[4] setOpacity:79.0/100.0 * 255.0];
            }
            
            
            //Frame 14
            if(bombingAniStruct[i]->aniTimer == 12){
                [bombingAniStruct[i]->s_wave setPosition:ccp(10000 , 265)];
                
                [bombingAniStruct[i]->s_debris[0] setPosition:ccp(257.8 + wholeBombOffsetX, -319.5 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[0] setRotation:132.6];
                [bombingAniStruct[i]->s_debris[0] setScaleX:0.383 * plusTimeScale];
                [bombingAniStruct[i]->s_debris[0] setScaleY:0.635 * plusTimeScale];
                [bombingAniStruct[i]->s_debris[0] setOpacity:5.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[1] setPosition:ccp(281.9 + wholeBombOffsetX, -125.0 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[1] setRotation:-111.0];
                [bombingAniStruct[i]->s_debris[1] setScaleX:0.635 * plusTimeScale];
                [bombingAniStruct[i]->s_debris[1] setScaleY:0.976 * plusTimeScale];
                [bombingAniStruct[i]->s_debris[1] setOpacity:23.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[2] setPosition:ccp(512.2 + wholeBombOffsetX, -151.7 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[2] setRotation:-32.3];
                [bombingAniStruct[i]->s_debris[2] setScaleX:0.636 * plusTimeScale];
                [bombingAniStruct[i]->s_debris[2] setScaleY:0.636 * plusTimeScale];
                [bombingAniStruct[i]->s_debris[2] setOpacity:11.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[0] setPosition:ccp(400.4 + wholeBombOffsetX, -321.0 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[0] setRotation:171.7];
                [bombingAniStruct[i]->s_bigClouds[0] setScaleX:0.84 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[0] setScaleY:0.84 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[0] setOpacity:51.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[1] setPosition:ccp(401.8 + wholeBombOffsetX, -219.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[1] setRotation:-64.2];
                [bombingAniStruct[i]->s_bigClouds[1] setScaleX:1.066 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[1] setScaleY:1.066 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[1] setOpacity:48.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[2] setPosition:ccp(341.3 + wholeBombOffsetX, -194.6 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[2] setRotation:-64.2];
                [bombingAniStruct[i]->s_bigClouds[2] setScaleX:0.744 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[2] setScaleY:0.744 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[2] setOpacity:48.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[3] setPosition:ccp(351.8 + wholeBombOffsetX, -324.4 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[3] setRotation:-117.1];
                [bombingAniStruct[i]->s_bigClouds[3] setScaleX:1.074 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[3] setScaleY:1.074 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[3] setOpacity:48.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[4] setPosition:ccp(273.8 + wholeBombOffsetX, -227.4 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[4] setRotation:-82.0];
                [bombingAniStruct[i]->s_bigClouds[4] setScaleX:1.005 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[4] setScaleY:1.005 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[4] setOpacity:48.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[5] setPosition:ccp(349.8 + wholeBombOffsetX, -256.2 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[5] setRotation:22.8];
                [bombingAniStruct[i]->s_bigClouds[5] setScaleX:2.654 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[5] setScaleY:2.654 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[5] setOpacity:68.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[6] setPosition:ccp(341.6 + wholeBombOffsetX, -259.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[6] setRotation:-84.0];
                [bombingAniStruct[i]->s_bigClouds[6] setScaleX:2.722 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[6] setScaleY:2.722 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[6] setOpacity:57.0/100.0 * 255.0];
                
                
                [bombingAniStruct[i]->s_smallClouds[0] setPosition:ccp(293.1 + wholeBombOffsetX, -257.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[0] setRotation:96.3];
                [bombingAniStruct[i]->s_smallClouds[0] setScaleX:2.196 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[0] setScaleY:2.196 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[0] setOpacity:73.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[1] setPosition:ccp(326.6 + wholeBombOffsetX, -276.6 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[1] setRotation:-81.9];
                [bombingAniStruct[i]->s_smallClouds[1] setScaleX:1.327 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[1] setScaleY:1.327 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[1] setOpacity:73.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[2] setPosition:ccp(351.8 + wholeBombOffsetX, -217.9 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[2] setRotation:118.9];
                [bombingAniStruct[i]->s_smallClouds[2] setScaleX:1.58 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[2] setScaleY:1.58 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[2] setOpacity:73.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[3] setPosition:ccp(318.3 + wholeBombOffsetX, -226.9 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[3] setRotation:-131.1];
                [bombingAniStruct[i]->s_smallClouds[3] setScaleX:1.775 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[3] setScaleY:1.775 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[3] setOpacity:73.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[4] setPosition:ccp(390.6 + wholeBombOffsetX, -251.2 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[4] setRotation:-36.3];
                [bombingAniStruct[i]->s_smallClouds[4] setScaleX:1.778 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[4] setScaleY:1.778 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[4] setOpacity:73.0/100.0 * 255.0];
                
            }
            
            
            //Frame 15
            if(bombingAniStruct[i]->aniTimer == 13){
                
                [bombingAniStruct[i]->s_debris[0] setPosition:ccp(10000, 319.5)];
                
                [bombingAniStruct[i]->s_debris[1] setPosition:ccp(276.1 + wholeBombOffsetX, -113.3 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[1] setRotation:-109.8];
                [bombingAniStruct[i]->s_debris[1] setScaleX:0.635 * plusTimeScale];
                [bombingAniStruct[i]->s_debris[1] setScaleY:0.984 * plusTimeScale];
                [bombingAniStruct[i]->s_debris[1] setOpacity:16.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[2] setPosition:ccp(523.0 + wholeBombOffsetX, -143.9 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[2] setRotation:-32.3];
                [bombingAniStruct[i]->s_debris[2] setScaleX:0.636 * plusTimeScale];
                [bombingAniStruct[i]->s_debris[2] setScaleY:0.636 * plusTimeScale];
                [bombingAniStruct[i]->s_debris[2] setOpacity:5.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[0] setPosition:ccp(404.9 + wholeBombOffsetX, -327.4 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[0] setRotation:160.5];
                [bombingAniStruct[i]->s_bigClouds[0] setScaleX:0.688 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[0] setScaleY:0.688 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[0] setOpacity:39.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[1] setPosition:ccp(406.4 + wholeBombOffsetX, -215.9 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[1] setRotation:-78.5];
                [bombingAniStruct[i]->s_bigClouds[1] setScaleX:0.884 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[1] setScaleY:0.884 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[1] setOpacity:36.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[2] setPosition:ccp(340.9 + wholeBombOffsetX, -187.4 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[2] setRotation:-78.5];
                [bombingAniStruct[i]->s_bigClouds[2] setScaleX:0.639 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[2] setScaleY:0.639 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[2] setOpacity:36.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[3] setPosition:ccp(351.9 + wholeBombOffsetX, -330.5 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[3] setRotation:-104.8];
                [bombingAniStruct[i]->s_bigClouds[3] setScaleX:0.889 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[3] setScaleY:0.889 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[3] setOpacity:36.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[4] setPosition:ccp(266.4 + wholeBombOffsetX, -224.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[4] setRotation:-91.5];
                [bombingAniStruct[i]->s_bigClouds[4] setScaleX:0.83 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[4] setScaleY:0.83 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[4] setOpacity:36.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[5] setPosition:ccp(349.8 + wholeBombOffsetX, -256.2 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[5] setRotation:26.6];
                [bombingAniStruct[i]->s_bigClouds[5] setScaleX:2.713 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[5] setScaleY:2.713 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[5] setOpacity:56.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[6] setPosition:ccp(341.6 + wholeBombOffsetX, -259.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[6] setRotation:-90.3];
                [bombingAniStruct[i]->s_bigClouds[6] setScaleX:2.818 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[6] setScaleY:2.818 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[6] setOpacity:41.0/100.0 * 255.0];
                
                
                
                
                [bombingAniStruct[i]->s_smallClouds[0] setPosition:ccp(282.9 + wholeBombOffsetX, -257.7 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[0] setRotation:107.1];
                [bombingAniStruct[i]->s_smallClouds[0] setScaleX:2.06 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[0] setScaleY:2.06 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[0] setOpacity:67.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[1] setPosition:ccp(322.1 + wholeBombOffsetX, -279.6 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[1] setRotation:-86.2];
                [bombingAniStruct[i]->s_smallClouds[1] setScaleX:1.265 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[1] setScaleY:1.265 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[1] setOpacity:67.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[2] setPosition:ccp(352.1 + wholeBombOffsetX, -211.9 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[2] setRotation:127.9];
                [bombingAniStruct[i]->s_smallClouds[2] setScaleX:1.497 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[2] setScaleY:1.497 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[2] setOpacity:67.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[3] setPosition:ccp(313.6 + wholeBombOffsetX, -221.5 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[3] setRotation:-131.4];
                [bombingAniStruct[i]->s_smallClouds[3] setScaleX:1.676 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[3] setScaleY:1.676 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[3] setOpacity:67.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[4] setPosition:ccp(397.6 + wholeBombOffsetX, -250.6 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[4] setRotation:-44.4];
                [bombingAniStruct[i]->s_smallClouds[4] setScaleX:1.678 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[4] setScaleY:1.678 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[4] setOpacity:67.0/100.0 * 255.0];
                
                
            }
            
            
            //Frame 16
            if(bombingAniStruct[i]->aniTimer == 14){
                
                
                [bombingAniStruct[i]->s_debris[1] setPosition:ccp(270.9 + wholeBombOffsetX, -102.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[1] setRotation:-108.6];
                [bombingAniStruct[i]->s_debris[1] setScaleX:0.635 * plusTimeScale];
                [bombingAniStruct[i]->s_debris[1] setScaleY:0.99 * plusTimeScale];
                [bombingAniStruct[i]->s_debris[1] setOpacity:9.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_debris[2] setPosition:ccp(10000 , 143.9)];
                
                [bombingAniStruct[i]->s_bigClouds[0] setPosition:ccp(409.9 + wholeBombOffsetX, -334.2 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[0] setRotation:-148.7];
                [bombingAniStruct[i]->s_bigClouds[0] setScaleX:0.529 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[0] setScaleY:0.529 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[0] setOpacity:27.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[1] setPosition:ccp(411.1 + wholeBombOffsetX, -212.0 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[1] setRotation:-93.0];
                [bombingAniStruct[i]->s_bigClouds[1] setScaleX:0.696 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[1] setScaleY:0.696 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[1] setOpacity:25.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[2] setPosition:ccp(340.3 + wholeBombOffsetX, -180.1 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[2] setRotation:-93.0];
                [bombingAniStruct[i]->s_bigClouds[2] setScaleX:0.531 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[2] setScaleY:0.531 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[2] setOpacity:25.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[3] setPosition:ccp(352.1 + wholeBombOffsetX, -336.9 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[3] setRotation:-92.3];
                [bombingAniStruct[i]->s_bigClouds[3] setScaleX:0.699 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[3] setScaleY:0.699 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[3] setOpacity:25.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[4] setPosition:ccp(258.8 + wholeBombOffsetX, -222.1 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[4] setRotation:-101.3];
                [bombingAniStruct[i]->s_bigClouds[4] setScaleX:0.65 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[4] setScaleY:0.65 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[4] setOpacity:25.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[5] setPosition:ccp(349.8 + wholeBombOffsetX, -256.2 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[5] setRotation:30.6];
                [bombingAniStruct[i]->s_bigClouds[5] setScaleX:2.773 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[5] setScaleY:2.773 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[5] setOpacity:44.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[6] setPosition:ccp(341.6 + wholeBombOffsetX, -259.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[6] setRotation:-96.3];
                [bombingAniStruct[i]->s_bigClouds[6] setScaleX:2.909 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[6] setScaleY:2.909 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[6] setOpacity:27.0/100.0 * 255.0];
                
                
                
                
                
                [bombingAniStruct[i]->s_smallClouds[0] setPosition:ccp(272.1 + wholeBombOffsetX, -257.6 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[0] setRotation:118.6];
                [bombingAniStruct[i]->s_smallClouds[0] setScaleX:1.918 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[0] setScaleY:1.918 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[0] setOpacity:60.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[1] setPosition:ccp(317.4 + wholeBombOffsetX, -282.6 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[1] setRotation:-90.5];
                [bombingAniStruct[i]->s_smallClouds[1] setScaleX:1.20 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[1] setScaleY:1.20 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[1] setOpacity:60.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[2] setPosition:ccp(352.3 + wholeBombOffsetX, -205.7 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[2] setRotation:137.4];
                [bombingAniStruct[i]->s_smallClouds[2] setScaleX:1.409 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[2] setScaleY:1.409 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[2] setOpacity:60.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[3] setPosition:ccp(308.4 + wholeBombOffsetX, -215.7 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[3] setRotation:-131.6];
                [bombingAniStruct[i]->s_smallClouds[3] setScaleX:1.571 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[3] setScaleY:1.571 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[3] setOpacity:60.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[4] setPosition:ccp(405.1 + wholeBombOffsetX, -250.1 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[4] setRotation:-52.9];
                [bombingAniStruct[i]->s_smallClouds[4] setScaleX:1.574 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[4] setScaleY:1.574 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[4] setOpacity:60.0/100.0 * 255.0];
                
                
            }
            
            
            //Frame 17
            if(bombingAniStruct[i]->aniTimer == 15){
                [bombingAniStruct[i]->s_debris[1] setPosition:ccp(266.4 + wholeBombOffsetX, -93.9 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_debris[1] setRotation:-107.6];
                [bombingAniStruct[i]->s_debris[1] setScaleX:0.635 * plusTimeScale];
                [bombingAniStruct[i]->s_debris[1] setScaleY:0.996 * plusTimeScale];
                [bombingAniStruct[i]->s_debris[1] setOpacity:4.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[0] setPosition:ccp(415.0 + wholeBombOffsetX, -341.1 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[0] setRotation:-136.4];
                [bombingAniStruct[i]->s_bigClouds[0] setScaleX:0.364 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[0] setScaleY:0.364 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[0] setOpacity:14.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[1] setPosition:ccp(415.8 + wholeBombOffsetX, -207.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[1] setRotation:-108.1];
                [bombingAniStruct[i]->s_bigClouds[1] setScaleX:0.503 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[1] setScaleY:0.503 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[1] setOpacity:13.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[2] setPosition:ccp(339.8 + wholeBombOffsetX, -172.7 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[2] setRotation:-108.1];
                [bombingAniStruct[i]->s_bigClouds[2] setScaleX:0.42 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[2] setScaleY:0.42 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[2] setOpacity:13.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[3] setPosition:ccp(352.1 + wholeBombOffsetX, -343.4 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[3] setRotation:-79.7];
                [bombingAniStruct[i]->s_bigClouds[3] setScaleX:0.505 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[3] setScaleY:0.505 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[3] setOpacity:13.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[4] setPosition:ccp(251.0 + wholeBombOffsetX, -219.3 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[4] setRotation:-111.5];
                [bombingAniStruct[i]->s_bigClouds[4] setScaleX:0.466 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[4] setScaleY:0.466 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[4] setOpacity:13.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[5] setPosition:ccp(349.8 + wholeBombOffsetX, -256.2 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[5] setRotation:34.6];
                [bombingAniStruct[i]->s_bigClouds[5] setScaleX:2.532 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[5] setScaleY:2.532 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[5] setOpacity:32.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_bigClouds[6] setPosition:ccp(341.6 + wholeBombOffsetX, -259.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[6] setRotation:-102.0];
                [bombingAniStruct[i]->s_bigClouds[6] setScaleX:2.995 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[6] setScaleY:2.995 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[6] setOpacity:13.0/100.0 * 255.0];
                
                
                
                [bombingAniStruct[i]->s_smallClouds[0] setPosition:ccp(260.9 + wholeBombOffsetX, -257.4 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[0] setRotation:130.6];
                [bombingAniStruct[i]->s_smallClouds[0] setScaleX:1.771 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[0] setScaleY:1.771 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[0] setOpacity:54.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[1] setPosition:ccp(312.4 + wholeBombOffsetX, -285.7 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[1] setRotation:-95.3];
                [bombingAniStruct[i]->s_smallClouds[1] setScaleX:1.132 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[1] setScaleY:1.132 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[1] setOpacity:54.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[2] setPosition:ccp(352.6 + wholeBombOffsetX, -199.1 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[2] setRotation:147.2];
                [bombingAniStruct[i]->s_smallClouds[2] setScaleX:1.318 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[2] setScaleY:1.318 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[2] setOpacity:54.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[3] setPosition:ccp(303.2 + wholeBombOffsetX, -209.7 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[3] setRotation:-131.8];
                [bombingAniStruct[i]->s_smallClouds[3] setScaleX:1.462 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[3] setScaleY:1.462 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[3] setOpacity:54.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[4] setPosition:ccp(412.8 + wholeBombOffsetX, -249.3 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[4] setRotation:-61.9];
                [bombingAniStruct[i]->s_smallClouds[4] setScaleX:1.465 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[4] setScaleY:1.465 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[4] setOpacity:54.0/100.0 * 255.0];
                
                
                
            }
            
            
            //Frame 18
            if(bombingAniStruct[i]->aniTimer == 16){
                [bombingAniStruct[i]->s_debris[1] setPosition:ccp(10000, 93.9)];
                
                
                [bombingAniStruct[i]->s_bigClouds[0] setPosition:ccp(41500.0, -341.1)];
                [bombingAniStruct[i]->s_bigClouds[1] setPosition:ccp(41500.0, -341.1)];
                [bombingAniStruct[i]->s_bigClouds[2] setPosition:ccp(41500.0, -341.1)];
                [bombingAniStruct[i]->s_bigClouds[3] setPosition:ccp(41500.0, -341.1)];
                [bombingAniStruct[i]->s_bigClouds[4] setPosition:ccp(41500.0, -341.1)];
                [bombingAniStruct[i]->s_bigClouds[6] setPosition:ccp(41500.0, -341.1)];
                
                [bombingAniStruct[i]->s_bigClouds[5] setPosition:ccp(349.8 + wholeBombOffsetX, -256.2 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[5] setRotation:38.4];
                [bombingAniStruct[i]->s_bigClouds[5] setScaleX:2.889 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[5] setScaleY:2.889 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[5] setOpacity:21.0/100.0 * 255.0];
                
                
                
                [bombingAniStruct[i]->s_smallClouds[0] setPosition:ccp(249.3 + wholeBombOffsetX, -257.2 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[0] setRotation:142.7];
                [bombingAniStruct[i]->s_smallClouds[0] setScaleX:1.619 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[0] setScaleY:1.619 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[0] setOpacity:47.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[1] setPosition:ccp(307.3 + wholeBombOffsetX, -288.9 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[1] setRotation:-100.0];
                [bombingAniStruct[i]->s_smallClouds[1] setScaleX:1.062 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[1] setScaleY:1.062 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[1] setOpacity:47.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[2] setPosition:ccp(352.8 + wholeBombOffsetX, -192.2 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[2] setRotation:157.4];
                [bombingAniStruct[i]->s_smallClouds[2] setScaleX:1.225 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[2] setScaleY:1.225 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[2] setOpacity:47.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[3] setPosition:ccp(297.9 + wholeBombOffsetX, -203.5 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[3] setRotation:-132.1];
                [bombingAniStruct[i]->s_smallClouds[3] setScaleX:1.35 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[3] setScaleY:1.35 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[3] setOpacity:47.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[4] setPosition:ccp(420.7 + wholeBombOffsetX, -248.7 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[4] setRotation:-71];
                [bombingAniStruct[i]->s_smallClouds[4] setScaleX:1.353 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[4] setScaleY:1.353 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[4] setOpacity:47.0/100.0 * 255.0];
                
                
            }
            
            
            
            //Frame 19
            if(bombingAniStruct[i]->aniTimer == 17){
                
                [bombingAniStruct[i]->s_bigClouds[5] setPosition:ccp(349.8 + wholeBombOffsetX, -256.2 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_bigClouds[5] setRotation:41.9];
                [bombingAniStruct[i]->s_bigClouds[5] setScaleX:2.944 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[5] setScaleY:2.944 * 0.492 * plusTimeScale];
                [bombingAniStruct[i]->s_bigClouds[5] setOpacity:10.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[0] setPosition:ccp(237.7 + wholeBombOffsetX, -257.1 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[0] setRotation:155.2];
                [bombingAniStruct[i]->s_smallClouds[0] setScaleX:1.466 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[0] setScaleY:1.466 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[0] setOpacity:40.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[1] setPosition:ccp(302.1 + wholeBombOffsetX, -292.2 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[1] setRotation:-105.0];
                [bombingAniStruct[i]->s_smallClouds[1] setScaleX:0.99 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[1] setScaleY:0.99 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[1] setOpacity:40.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[2] setPosition:ccp(353.1 + wholeBombOffsetX, -185.3 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[2] setRotation:167.7];
                [bombingAniStruct[i]->s_smallClouds[2] setScaleX:1.13 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[2] setScaleY:1.13 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[2] setOpacity:40.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[3] setPosition:ccp(292.4 + wholeBombOffsetX, -197.1 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[3] setRotation:-132.1];
                [bombingAniStruct[i]->s_smallClouds[3] setScaleX:1.236 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[3] setScaleY:1.236 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[3] setOpacity:40.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[4] setPosition:ccp(428.8 + wholeBombOffsetX, -248.1 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[4] setRotation:-80.2];
                [bombingAniStruct[i]->s_smallClouds[4] setScaleX:1.239 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[4] setScaleY:1.239 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[4] setOpacity:40.0/100.0 * 255.0];
                
                
                
            }
            
            
            //Frame 20
            if(bombingAniStruct[i]->aniTimer == 18){
                
                [bombingAniStruct[i]->s_bigClouds[5] setPosition:ccp(34900.8 , -256.2)];
                
                [bombingAniStruct[i]->s_smallClouds[0] setPosition:ccp(225.8 + wholeBombOffsetX, -256.9 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[0] setRotation:167.7];
                [bombingAniStruct[i]->s_smallClouds[0] setScaleX:1.312 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[0] setScaleY:1.312 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[0] setOpacity:33.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[1] setPosition:ccp(296.9 + wholeBombOffsetX, -295.4 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[1] setRotation:-110.0];
                [bombingAniStruct[i]->s_smallClouds[1] setScaleX:0.919 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[1] setScaleY:0.919 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[1] setOpacity:33.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[2] setPosition:ccp(353.4 + wholeBombOffsetX, -178.4 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[2] setRotation:178.0];
                [bombingAniStruct[i]->s_smallClouds[2] setScaleX:1.035 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[2] setScaleY:1.035 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[2] setOpacity:33.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[3] setPosition:ccp(286.9 + wholeBombOffsetX, -190.7 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[3] setRotation:-132.4];
                [bombingAniStruct[i]->s_smallClouds[3] setScaleX:1.122 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[3] setScaleY:1.122 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[3] setOpacity:33.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[4] setPosition:ccp(436.9 + wholeBombOffsetX, -247.3 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[4] setRotation:-89.7];
                [bombingAniStruct[i]->s_smallClouds[4] setScaleX:1.125 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[4] setScaleY:1.125 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[4] setOpacity:33.0/100.0 * 255.0];
                
            }
            
            
            //Frame 21
            if(bombingAniStruct[i]->aniTimer == 19){
                
                
                
                [bombingAniStruct[i]->s_smallClouds[0] setPosition:ccp(214.0 + wholeBombOffsetX, -256.9 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[0] setRotation:180];
                [bombingAniStruct[i]->s_smallClouds[0] setScaleX:1.158 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[0] setScaleY:1.158 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[0] setOpacity:26.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[1] setPosition:ccp(291.6 + wholeBombOffsetX, -298.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[1] setRotation:-115.0];
                [bombingAniStruct[i]->s_smallClouds[1] setScaleX:0.847 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[1] setScaleY:0.847 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[1] setOpacity:26.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[2] setPosition:ccp(353.6 + wholeBombOffsetX, -171.6 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[2] setRotation:171.9];
                [bombingAniStruct[i]->s_smallClouds[2] setScaleX:0.939 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[2] setScaleY:0.939 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[2] setOpacity:26.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[3] setPosition:ccp(281.4 + wholeBombOffsetX, -184.3 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[3] setRotation:-132.4];
                [bombingAniStruct[i]->s_smallClouds[3] setScaleX:1.007 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[3] setScaleY:1.007 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[3] setOpacity:26.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[4] setPosition:ccp(445.0 + wholeBombOffsetX, -246.7 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[4] setRotation:-98.8];
                [bombingAniStruct[i]->s_smallClouds[4] setScaleX:1.01 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[4] setScaleY:1.01 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[4] setOpacity:26.0/100.0 * 255.0];
                
            }
            
            
            
            //Frame 22
            if(bombingAniStruct[i]->aniTimer == 20){
                
                
                
                [bombingAniStruct[i]->s_smallClouds[0] setPosition:ccp(202.5 + wholeBombOffsetX, -256.5 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[0] setRotation:167.7];
                [bombingAniStruct[i]->s_smallClouds[0] setScaleX:1.006 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[0] setScaleY:1.006 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[0] setOpacity:19.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[1] setPosition:ccp(286.6 + wholeBombOffsetX, -302.0 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[1] setRotation:-119.8];
                [bombingAniStruct[i]->s_smallClouds[1] setScaleX:0.777 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[1] setScaleY:0.777 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[1] setOpacity:19.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[2] setPosition:ccp(353.6 + wholeBombOffsetX, -164.7 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[2] setRotation:161.7];
                [bombingAniStruct[i]->s_smallClouds[2] setScaleX:0.844 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[2] setScaleY:0.844 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[2] setOpacity:19.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[3] setPosition:ccp(276.1 + wholeBombOffsetX, -178.2 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[3] setRotation:-132.9];
                [bombingAniStruct[i]->s_smallClouds[3] setScaleX:0.895 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[3] setScaleY:0.895 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[3] setOpacity:19.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[4] setPosition:ccp(453.0 + wholeBombOffsetX, -246.1 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[4] setRotation:-107.8];
                [bombingAniStruct[i]->s_smallClouds[4] setScaleX:0.897 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[4] setScaleY:0.897 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[4] setOpacity:19.0/100.0 * 255.0];
                
                
            }
            
            
            //Frame 23
            if(bombingAniStruct[i]->aniTimer == 21){
                
                
                
                
                
                [bombingAniStruct[i]->s_smallClouds[0] setPosition:ccp(191.2 + wholeBombOffsetX, -256.4 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[0] setRotation:155.7];
                [bombingAniStruct[i]->s_smallClouds[0] setScaleX:0.858 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[0] setScaleY:0.858 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[0] setOpacity:13.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[1] setPosition:ccp(281.6 + wholeBombOffsetX, -305.1 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[1] setRotation:-124.6];
                [bombingAniStruct[i]->s_smallClouds[1] setScaleX:0.709 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[1] setScaleY:0.709 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[1] setOpacity:13.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[2] setPosition:ccp(354.1 + wholeBombOffsetX, -158.1 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[2] setRotation:151.9];
                [bombingAniStruct[i]->s_smallClouds[2] setScaleX:0.753 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[2] setScaleY:0.753 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[2] setOpacity:13.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[3] setPosition:ccp(270.8 + wholeBombOffsetX, -172.2 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[3] setRotation:-133.1];
                [bombingAniStruct[i]->s_smallClouds[3] setScaleX:0.786 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[3] setScaleY:0.786 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[3] setOpacity:13.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[4] setPosition:ccp(460.8 + wholeBombOffsetX, -245.4 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[4] setRotation:-116.8];
                [bombingAniStruct[i]->s_smallClouds[4] setScaleX:0.787 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[4] setScaleY:0.787 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[4] setOpacity:13.0/100.0 * 255.0];
                
                
            }
            
            //Frame 24
            if(bombingAniStruct[i]->aniTimer == 22){
                
                
                
                
                [bombingAniStruct[i]->s_smallClouds[0] setPosition:ccp(180.5 + wholeBombOffsetX, -256.2 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[0] setRotation:144.4];
                [bombingAniStruct[i]->s_smallClouds[0] setScaleX:0.716 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[0] setScaleY:0.716 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[0] setOpacity:6.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[1] setPosition:ccp(276.8 + wholeBombOffsetX, -308.1 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[1] setRotation:-129.1];
                [bombingAniStruct[i]->s_smallClouds[1] setScaleX:0.644 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[1] setScaleY:0.644 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[1] setOpacity:6.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[2] setPosition:ccp(354.1 + wholeBombOffsetX, -151.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[2] setRotation:142.4];
                [bombingAniStruct[i]->s_smallClouds[2] setScaleX:0.665 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[2] setScaleY:0.665 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[2] setOpacity:6.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[3] setPosition:ccp(265.8 + wholeBombOffsetX, -166.2 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[3] setRotation:-133.2];
                [bombingAniStruct[i]->s_smallClouds[3] setScaleX:0.681 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[3] setScaleY:0.681 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[3] setOpacity:6.0/100.0 * 255.0];
                
                [bombingAniStruct[i]->s_smallClouds[4] setPosition:ccp(468.2 + wholeBombOffsetX, -244.8 + wholeBombOffsetY)];
                [bombingAniStruct[i]->s_smallClouds[4] setRotation:-125.3];
                [bombingAniStruct[i]->s_smallClouds[4] setScaleX:0.682 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[4] setScaleY:0.682 * 0.527 * plusTimeScale];
                [bombingAniStruct[i]->s_smallClouds[4] setOpacity:6.0/100.0 * 255.0];
                
                
            }
            
            
            if(bombingAniStruct[i]->aniTimer == 23){
                [bombingAniStruct[i]->s_smallClouds[0] setPosition:ccp(34900.8 , -256.2)];
                [bombingAniStruct[i]->s_smallClouds[1] setPosition:ccp(34900.8 , -256.2)];
                [bombingAniStruct[i]->s_smallClouds[2] setPosition:ccp(34900.8 , -256.2)];
                [bombingAniStruct[i]->s_smallClouds[3] setPosition:ccp(34900.8 , -256.2)];
                [bombingAniStruct[i]->s_smallClouds[4] setPosition:ccp(34900.8 , -256.2)];
                [bombingAniStruct[i]->s_bigClouds[7] setPosition:ccp(34900.8 , -256.2)];
                
                bombingAniStruct[i]->isAniPlusTime = false;
            }
            
        }//end if bombingAniStrut i isAni
        
        
    }
}

@end
