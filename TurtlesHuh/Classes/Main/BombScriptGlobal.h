typedef struct sBombingAniStruct{
	CCSprite* s_buum;
    CCSprite* s_blick;
    CCSprite* s_wave;
    CCSprite* s_debris[3];
    CCSprite* s_bigClouds[8];
    CCSprite* s_smallClouds[5];
    
    int aniTimer;
    bool isAni;
    bool isAniCombo;
    bool isAniShake; 
    bool isAniPlusTime;
    bool isAniCannon;
    bool isAniGameover;
    
    float aniX;
    float aniY;
    
}eBombingAniStruct;

eBombingAniStruct* bombingAniStruct[26];
int bombingAniMax;
int bombingAniIdx;
