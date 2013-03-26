//
//  MainGamePlayScreen.h
//  Flow Master by MC Lars
//
#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "CCMenuItemLabelAndImage.h"
#import "scoreAlgo.h"
#import "SongParser.h"


#define EASY 1
#define INTERMEDIATE 2
#define HARD 3



@interface MainGamePlayScreen : CCLayerColor {
    //zhenlu -- Mr Raven
    //sprite
    CCSprite *_mrRavenBg;
    CCSprite *_mrRavenChorus;
    CCSprite *_mrRavenWinning;
    CCSprite *_mrRavenLosing;
    CCSprite *_mrRavenwon;
    CCSprite *_mrRavenLost;
    CCSprite *_mrRavenDancingRapping;
    CCSprite *_mrRavenNormal;
    CCSprite *_cat;
    CCAction *_catAction;
    CCSprite *_robot;
    CCAction *_robotAction;
    CCSprite *_dancingRapping;
    CCAction *_dancingRappingAction;
    //meijie
    CCSprite *_singingbackground;
    CCSprite *_chorusbackground;
    CCSprite *_chorusOpenMouthbackground;
    CCSprite *_mobybackground;
    CCSprite *_winningbackground;
    CCSprite *_losingbackground;
    CCSprite *_lostbackground;
    CCSprite *_wonbackground;
    CCSprite *_dudes;
    CCSprite *_glue;
    CCSprite *_indie;
    CCSprite *_jewel;
    CCSprite *_keren;
    CCSprite *_nebraska;
    CCSprite *_scissors;
    CCSprite *_spankrock;
    CCSprite *_vice;
    CCSprite *_hipstergirl;
    
    //igeneration
    CCSprite *_flatmass1;
    CCSprite *_flatmass2;
    CCSprite *_flatmass3;
    CCSprite *_flatmass4;
    CCSprite *_flatmass5;
    CCSprite *_flatmass6;    
    CCSprite *_flatmass7;    
    CCSprite *_flatmass8;
    CCSprite *_flatmass9;    
    CCSprite *_flatmass10;    
    CCSprite *_flatmass11;
    CCSprite *_flatmass12;
    CCSprite *_emoticon;
    CCAction *_emoticonAction;
    CCSprite *_typing;
    CCAction *_typingAction;
    CCSprite *_imagination;
    CCAction *_imaginationAction;
    CCSprite *_bush;
    CCAction *_bushAction;
    CCSprite *_steve;
    CCAction *_steveAction;
    CCSprite *_mtv;
    CCAction *_mtvAction;
    CCSprite *_dancingBaby;
    CCAction *_dancingBabyAction;
    CCSprite *_larsSing;
    CCSprite *_hidelyrics;
    CCAction *_singAction;
    CCSprite *_larswinlose;//zhenlu--sprite used for win and lose
    CCSprite *_larsnormaldance;//zhenlu--sprite used for normal and dance
    CCAction *_danceAction; //zhenlu--actions to make lars dance
    CCAction *_wonAction; //zhenlu--actions when win at the end of each level
    CCAction *_lostAction; //zhenlu--actions when lost at the end of each level
    CCAction *_winningAction; //zhenlu--actions when users answer correctly
    CCAction *_normalAction; //zhenlu--actions when lars is singing
    CCMenu *starMenu;
    NSMutableArray *flow_meter_array;
    CCSprite* flow;
    int flow_location;
    BOOL invalidtouch;
    
    CCMenuItemLabelAndImage *pause_button, *play_button;
    CCMenu *pause_play_menu;
    
    NSString *question, *question2, *blank, *correct,*temp;
    NSString *newstr;
    
    int bonus, mainScore, internalScore, mileStones;
    
    SongParser *parser;
    
    BOOL *waschosen;
    
    // variables for song markers
    NSMutableString	*level, *marker_start, 
    *marker_end, *marker_blank , *lyrics1, 
    *lyrics2 ,  *correctAnswer, *wrongAnswers,*songlen,*BPM,*displayLoop,*BPL,*animationTag; 
    
    NSMutableArray *fields, *fields2,  
    *fields3, *lyric, *lyric2, 
    *correctAnswerar, *wrongAnswersar, *levelar,*songlength,*BPMNum,*BPLNum,*displayLoopNum,*animationTagArray;
    
    CGFloat beat_time;
    
    int leng,lengDiff;
    
    NSInteger checkDiff;
    
    
}

// returns a CCScene 
+(CCScene *) scene;



//zhenlu--Mr Raven
//sprite

@property (nonatomic, retain) CCSprite *mrRavenBg;
@property (nonatomic, retain) CCSprite *mrRavenChorus;
@property (nonatomic, retain) CCSprite *mrRavenWinning;
@property (nonatomic, retain) CCSprite *mrRavenLosing;
@property (nonatomic, retain) CCSprite *mrRavenwon;
@property (nonatomic, retain) CCSprite *mrRavenLost;
@property (nonatomic, retain) CCSprite *mrRavenDancingRapping;
@property (nonatomic, retain) CCSprite *mrRavenNormal;



@property (nonatomic, retain) CCSprite *dudes;
@property (nonatomic, retain) CCSprite *glue;
@property (nonatomic, retain) CCSprite *indie;
@property (nonatomic, retain) CCSprite *jewel;
@property (nonatomic, retain) CCSprite *keren;
@property (nonatomic, retain) CCSprite *nebraska;
@property (nonatomic, retain) CCSprite *scissors;
@property (nonatomic, retain) CCSprite *spankrock;
@property (nonatomic, retain) CCSprite *vice;
@property (nonatomic, retain) CCSprite *mobybackground;
@property (nonatomic, retain) CCSprite *singingbackground;
@property (nonatomic, retain) CCSprite *chorusbackground;
@property (nonatomic, retain) CCSprite *chorusOpenMouthbackground;
@property (nonatomic, retain) CCSprite *winningbackground;
@property (nonatomic, retain) CCSprite *losingbackground;
@property (nonatomic, retain) CCSprite *lostbackground;
@property (nonatomic, retain) CCSprite *wonbackground;
@property (nonatomic, retain) CCSprite *hipstergirl;
//igeneration
@property (nonatomic, retain) CCSprite *cat;
@property (nonatomic, retain) CCAction *catAction;
@property (nonatomic, retain) CCSprite *robot;
@property (nonatomic, retain) CCAction *robotAction;
@property (nonatomic, retain) CCSprite *dancingRapping;
@property (nonatomic, retain) CCAction *dancingRappingAction;
@property (nonatomic, retain) CCSprite *flatmass1;
@property (nonatomic, retain) CCSprite *flatmass2;
@property (nonatomic, retain) CCSprite *flatmass3;
@property (nonatomic, retain) CCSprite *flatmass4;
@property (nonatomic, retain) CCSprite *flatmass5;
@property (nonatomic, retain) CCSprite *flatmass6;
@property (nonatomic, retain) CCSprite *flatmass7;
@property (nonatomic, retain) CCSprite *flatmass8;
@property (nonatomic, retain) CCSprite *flatmass9;
@property (nonatomic, retain) CCSprite *flatmass10;
@property (nonatomic, retain) CCSprite *flatmass11;
@property (nonatomic, retain) CCSprite *flatmass12;
@property (nonatomic, retain) CCSprite *emoticon;
@property (nonatomic, retain) CCSprite *typing;
@property (nonatomic, retain) CCSprite *imagination;
@property (nonatomic, retain) CCSprite *bush;
@property (nonatomic, retain) CCSprite *steve;
@property (nonatomic, retain) CCSprite *mtv;
@property (nonatomic, retain) CCSprite *dancingBaby;
@property (nonatomic, retain) CCAction *singAction;
@property (nonatomic, retain) CCSprite *larsSing;
@property (nonatomic, retain) CCSprite *larswinlose; //zhenlu--sprite used for win and lose
@property (nonatomic, retain) CCSprite *larsnormaldance;//zhenlu--sprite used for normal and dance
@property (nonatomic, retain) CCAction *wonAction;//zhenlu--when win at the end of each level
@property (nonatomic, retain) CCAction *lostAction;//zhenlu--actions when lost at the end of each level
@property (nonatomic, retain) CCAction *danceAction;//zhenlu--actions to make lars dance
@property (nonatomic, retain) CCAction *winningAction;//zhenlu--actions when users answer correctl
@property (nonatomic, retain) CCAction *normalAction;//zhenlu--actions when lars is singing
-(void)tick1:(ccTime)dt;


@end
