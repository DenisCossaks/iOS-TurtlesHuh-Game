bool isMusic;
bool isSound;	
float musicVolumn;
float soundVolumn;

#define maxAchivements 45
bool hasFinishedThisAchivements[maxAchivements];
int ahievementReward[maxAchivements];

int currentAchivementIdx[4];

#define maxMiniGames 20
#define maxTotalMiniChosen 10
#define maxTotalMissionGameChosen 1
bool hasPlayedMiniGames[maxMiniGames];
//int gradeAccordingToScoreInMiniGame[5][maxMiniGames];

#define maxMissions 88
#define maxMissionsShowForOneTime 3
int missionCompleted;
int missionIdxMatched[maxMissions];
bool hasFinishedMission[maxMissions];
bool hasPlayedThisMissionBefore[maxMissions];
int currentChosenMissionIdx[5];
int currentChosenMission[5];
bool currentChosenMissionWon[5];

#define maxUpgradeItems 22
int upgradeItemLevel[maxUpgradeItems];

#define maxONSUpgradeItems 8
int onsUpgradeItemLevel[maxONSUpgradeItems];
bool onsUpgradeItemIsEnable[maxONSUpgradeItems];
bool permenanatUpgradeItemIsEnable[8];

#import "MusicController.h"
MusicController* musicController;

float timeRunOut_Fast_Gain;
float timeRunOut_Slow_Gain;
float timeRunOut_Fast_MaxGain;
float timeRunOut_Slow_MaxGain;


bool returnBackToSameMusic;
bool goToNullWithNewPlayMusic;

bool achivementIsGoingToCoverScene;
bool achivementIsGoingToStoreScene;
bool achivementIsGoingToSelectMiniScene;


int miniGameOrder[15];
int miniGameIdx;

bool isEarningCoinsFromTapJoy;
int earningCoinsFromTapjoyTimer;

bool isGoingFromMainPlayScene;
bool isGoingSelectMIniAfterPlay;
bool isGoingToNextMiniGame;

bool hasShownedExtra;
int canShownExtra;
int canShownExtra2;

bool hasRatedBefore;
bool isGoingToRate;
int rateTimer;
bool isFreeChargesOnONS;

bool hasGameCenterSupport;
#import "GameCenterController.h"
GameCenterController* gameCenterController;


int fromInstruction_GoToNextIdx;
int storyType;


//for ad use
bool ad_isClickingShowMore;
bool ad_isLocking;
bool ad_isLoading;
int ad_chosenType;
bool ad_firstTime;
bool ad_revmobIsFirstLoad;
bool ad_isDirectLoaded;
int ad_RevmobChartboostRatio;
int ad_RevmobChartboostRatio2;
int ad_howmanyRounds;
int ad_howmanyGamesPlayed;
int ad_howmanyMainGamePlayed;
bool ad_isInGaming;
bool ad_isLoadingFromBecomeActive;
bool ad_notShowAdTHisTime;

//p4RC
int lastFuckPoint;
bool p4rc_canDisplayScore;
bool p4rc_isInMiniGame;

bool burstly_viewedOffer;
int burstly_coinsGained;
bool burstly_isOpenning;

//burtsly
bool bustly_isdeleteControllerInMainGame;

UIDeviceOrientation gOrientation;

bool isIphone5;
bool isIpad;
