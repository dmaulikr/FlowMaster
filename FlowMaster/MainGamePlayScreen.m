//
//  MainGamePlayScreen.m
//  Flow Master by MC Lars
//
//  Created by student on 2/20/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "MainGamePlayScreen.h"
#import "SimpleAudioEngine.h"
#import "CDAudioManager.h"
#import "CocosDenshion.h"
#import "SongParser.h"
#import "MainScreen.h"
#import "globalVar.h"
#import "ContinueScreen.h"
#import "StoryTelling.h"
#import "Help.h"



enum{
    TAG_BACKGROUND=1,
    TAG_FADE_SPRITE1=2,
    TAG_FADE_SPRITE2=3,
    TAG_FADE_SPRITE3=4
};

#define LINE_LENGTH 4
CCSprite *pauseMenuBackGround;
CCMenu *pauseMenu;
NSString *animationNum;
NSInteger isTapped = 0; //zhenlu--to check whether the bubble is tapped
//mr raven frames

NSMutableArray *mrRavenBgFrames;
NSMutableArray *mrRavenChorusFrames;
NSMutableArray *mrRavenWinningFrames;
NSMutableArray *mrRavenLosingFrames;
NSMutableArray *mrRavenwonFrames;
NSMutableArray *mrRavenLostFrames;
NSMutableArray *mrRavenDancingRappingFrames;
NSMutableArray *mrRavenNormalFrames;

NSMutableArray *catFrames;
NSMutableArray *robotFrames;
NSMutableArray *dancingRappingFrames;
NSMutableArray *dudesFrames;
NSMutableArray *glueFrames;
NSMutableArray *indieFrames;
NSMutableArray *jewelFrames;
NSMutableArray *kerenFrames;
NSMutableArray *nebraskaFrames;
NSMutableArray *scissorsFrames;
NSMutableArray *spankrockFrames;
NSMutableArray *viceFrames;
NSMutableArray *hipsgirlFrames;
NSMutableArray *mobyBackgroundFrames;
NSMutableArray *singingBackgroundFrames;
NSMutableArray *chorusBackgroundFrames;
NSMutableArray *chorusOpenMouthBackgroundFrames;
NSMutableArray *winningBackgroundFrames;
NSMutableArray *losingBackgroundFrames;
NSMutableArray *lostBackgroundFrames;
NSMutableArray *wonBackgroundFrames;
NSMutableArray *flatmassFrames;
NSMutableArray *emoticonFrames;
NSMutableArray *typingFrames;
NSMutableArray *imaginationFrames;
NSMutableArray *bushFrames;
NSMutableArray *steveFrames;
NSMutableArray *mtvFrames;
NSMutableArray *dancingBabyFrames;
NSMutableArray *singFrames;
NSMutableArray *danceFrames; //zhenlu--frames to make lars dance
NSMutableArray *normalFrames;//zhenlu--frames to make lars sing
NSMutableArray *wonFrames;//zhenlu--frames to make lars win in the end of level
NSMutableArray *lostFrames;//zhenlu--frames to make lars lose in the end of level
NSMutableArray *winloseFrames;//zhenlu--frames to make lars happy when the answer is correct
NSMutableArray *losewinFrames; //zhenlu--frames to make lars unhappy when the answer is incorrect
NSInteger randomNum;
//id a1,a21,a31;
CCSequence * sequence1, * sequence2, *sequence3;//zhenlu--sequences used for lyrics fadein move and fadeout
NSInteger t = 173, minutes, seconds;
//NSString *question, *question2, *blank;
CCLabelTTF *countdown, *current_score, *scoreViewLabel; //current-score is the main score label. ScoreViewLabel is the score lable that pops out at the bottom right
int previousScore; //this is used for the score that pops out and moves
CCMoveTo *scoreViewMove; //these three variables define the transition of the score that pops at bottom right
CCFadeOut *scoreViewFadeOut;
CCFadeIn *scoreViewFadeIn;
NSString *pData;
//NSString *correct;
CCLabelTTF *rhyme_lyrics1;  //first line of the lyrics displayed
CCLabelTTF *rhyme_lyrics2;  //second line of the lyrics displayed
NSInteger  q_points;
NSInteger  totalpoints;
NSInteger current_points;
CCMenuItemLabelAndImage *bubble1, *bubble2, *bubble3; //zhenlu--three answer choices
NSString *choice1,*choice2,*choice3; //3 answer choices
//NSString *complete; 

Boolean inChorusPart; //sai- test whether song is in chorus part

NSString *firstLine; //first line of the lyrics
NSString *secondLine; //second line of the lyrics
BOOL isCorrect; //selecting correct answer
NSString *songName;  //xiaoyin--the name of current played song

float BPMs;//xiaoyin--Beat per Minute for the current song
float BPLs;//xiaoyin--Beat per line for the current song
NSArray * bubbleArray;   //array of all three choices

NSInteger indexOfArr;    //xiaoyin--index of the answer array and lyrics array which is currently read
NSInteger countLoop; //xiaoyin--the number of ccSchedule function tick1 called 
int displayLoopNums;  //xiaoyin--the lyrics start displaying when tick1 called such number of times
NSString *answerChoice1,*answerChoice2,*answerChoice3;
@implementation MainGamePlayScreen


@synthesize dudes = _dudes;
@synthesize glue = _glue;
@synthesize indie = _indie;
@synthesize jewel = _jewel;
@synthesize keren = _keren;
@synthesize nebraska = _nebraska;
@synthesize scissors = _scissors;
@synthesize spankrock = _spankrock;
@synthesize vice = _vice;
@synthesize mobybackground = _mobybackground;
@synthesize singingbackground = _singingbackground;
@synthesize chorusbackground = _chorusbackground;
@synthesize chorusOpenMouthbackground = _chorusOpenMouthbackground;
@synthesize winningbackground = _winningbackground;
@synthesize losingbackground = _losingbackground;
@synthesize lostbackground = _lostbackground;
@synthesize wonbackground = _wonbackground;
@synthesize hipstergirl = _hipstergirl;
//zhenlu -- mr raven
//sprites
@synthesize mrRavenBg = _mrRavenBg;
@synthesize mrRavenChorus = _mrRavenChorus;
@synthesize mrRavenWinning = _mrRavenWinning;
@synthesize mrRavenLosing = _mrRavenLosing;
@synthesize mrRavenwon = _mrRavenwon;
@synthesize mrRavenLost = _mrRavenLost;
@synthesize mrRavenNormal = _mrRavenNormal;
@synthesize mrRavenDancingRapping = _mrRavenDancingRapping;

//igeneration
@synthesize flatmass1 = _flatmass1;
@synthesize flatmass2 = _flatmass2;
@synthesize flatmass3 = _flatmass3;
@synthesize flatmass4 = _flatmass4;
@synthesize flatmass5 = _flatmass5;
@synthesize flatmass6 = _flatmass6;
@synthesize flatmass7 = _flatmass7;
@synthesize flatmass8 = _flatmass8;
@synthesize flatmass9 = _flatmass9;
@synthesize flatmass10 = _flatmass10;
@synthesize flatmass11 = _flatmass11;
@synthesize flatmass12 = _flatmass12;
@synthesize emoticon = _emoticon;
@synthesize typing = _typing;
@synthesize imagination = _imagination;
@synthesize bush = _bush;
@synthesize steve = _steve;
@synthesize mtv = _mtv;
@synthesize dancingBaby = _dancingBaby;
@synthesize cat = _cat;
@synthesize catAction = _catAction;
@synthesize robot = _robot;
@synthesize robotAction = _robotAction;
@synthesize dancingRapping = _dancingRapping;
@synthesize dancingRappingAction = _dancingRappingAction;

@synthesize singAction = _singAction;
@synthesize larsSing = _larsSing;
@synthesize wonAction = _wonAction;//zhenlu--action when lars won at the end of each level
@synthesize lostAction = _lostAction;//zhenlu--action when lars lost at the end of each level
@synthesize larswinlose = _larswinlose;//zhenlu--sprite used when lars win or lose
@synthesize larsnormaldance = _larsnormaldance;//zhenlu-sprite used when lars is singing or dacing
@synthesize danceAction = _danceAction;//zhenlu--action when lars dance
@synthesize winningAction = _winningAction;//zhenlu--action when lars' answer is correct
@synthesize normalAction = _normalAction;//zhenlu--action when lars' answer is wrong 
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	MainGamePlayScreen *layer = [MainGamePlayScreen node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

//this function is used to restart the level
-(void)restartTapped{
    [[SimpleAudioEngine sharedEngine] resumeBackgroundMusic];
    [[CCDirector sharedDirector] resume];
    [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:0.5f scene:[MainGamePlayScreen scene]]];
    CCLOG(@"pop up menu- restart tapped");
}
//this functiont takes back to main menu when tapped
-(void)goBackToMainMenuTapped{
    
    //[[SimpleAudioEngine sharedEngine] resumeBackgroundMusic];
    [[CCDirector sharedDirector] resume];
    [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:0.5f scene:[MainScreen scene]]];
    CCLOG(@"pop up menu- Go Back to main menu tapped"); 
}

-(void)helpTapped{
    [[CCDirector sharedDirector] resume];
    [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:0.5f scene:[Help scene]]];
    CCLOG(@"pop up menu- Help tapped");
}

//this function is used to blink based on the answer choice
-(void)blink:(int)tag isCorrect:(BOOL)isCorrect{
    CCSprite *fadeSpriteTarget=(CCSprite *)[self getChildByTag:tag];
    [fadeSpriteTarget stopAllActions];
    if(isCorrect==NO)
        [fadeSpriteTarget setColor:ccc3(255, 0, 0)];
    else
        [fadeSpriteTarget setColor:ccc3(0, 255, 0)];
    [fadeSpriteTarget setOpacity:0.0f];
    [fadeSpriteTarget runAction:[CCSequence actions:[CCFadeIn actionWithDuration:0.2f],[CCFadeOut actionWithDuration:0.2f], nil]];
}


- (void)starButtonTapped:(id)sender {
    
    isTapped = 1;
    //Disables menu so button can't be pressed multiple times-Leon
    starMenu.isTouchEnabled = NO;
    //CCLOG(@"star menu touch disabled in star button tapped");
    
    CCLabelTTF* mylabel = (CCLabelTTF*) [sender label];
    NSString *rhyme   =  mylabel.string;
    
    //zhenlu--fadeout actions of three bubbles
    id fadeout1 = [CCFadeOut actionWithDuration:1];
    id fadeout2 = [CCFadeOut actionWithDuration:1];
    id fadeout3 = [CCFadeOut actionWithDuration:1];
    
    //find which bubble is actually clicked. This helps to blink the corresponding fade sprite
    int tappedId;
    
    if(randomNum==0)
    {
        if([rhyme isEqualToString:answerChoice1])
            tappedId=TAG_FADE_SPRITE3;
        else if([rhyme isEqualToString:answerChoice2])
            tappedId=TAG_FADE_SPRITE2;
        else
            tappedId=TAG_FADE_SPRITE1;
    }
    else if(randomNum==1)
    {
        if([rhyme isEqualToString:answerChoice1])
            tappedId=TAG_FADE_SPRITE2;
        else if([rhyme isEqualToString:answerChoice2])
            tappedId=TAG_FADE_SPRITE1;
        else
            tappedId=TAG_FADE_SPRITE3;
    }
    else if(randomNum==2)
    {
        if([rhyme isEqualToString:answerChoice1])
            tappedId=TAG_FADE_SPRITE1;
        else if([rhyme isEqualToString:answerChoice2])
            tappedId=TAG_FADE_SPRITE3;
        else
            tappedId=TAG_FADE_SPRITE2;
    }
    
    //end
    
    
    
    if([rhyme isEqualToString:correct]){
        
        //update score
        previousScore=mainScore;
        [scoreAlgo updateScore:&mainScore isCorrect:YES levelScore:&internalScore currentBonus:&bonus mode:EASY];
        NSLog(@"Correct. bonus increased to %d",bonus);
        //Increment Flowmeter
        if(bonus<=32)
        {
            flow_location = MIN(log2(bonus)*5,44);
        }
        else
        {
            if(bonus==64)
                flow_location = 32;
            else if(bonus==128)
                flow_location=38;
            else if(bonus==256)
                flow_location=44;
        }
        flow.visible = NO;
        flow = (CCSprite*)[flow_meter_array objectAtIndex:MIN(flow_location,44)];
        flow.visible =YES;
        
        
        
        [mylabel setString:@"Correct!!"];
        [[SimpleAudioEngine sharedEngine] playEffect:@"Coin_Sound_Effect.mp3"];     // play win sound effect - Meijie Wang
        
        
        //code to blink if the answer is correct //185 110  35
        
        [self blink:tappedId isCorrect:YES];
        
        //blink code end
        
        isCorrect = YES;
        /*zhenlu--if the answer is right, then the right lyrics keeps moving and the rest disappears**/
        if(randomNum == 0)//zhenlu--it means the first answer is correct
        {
            [bubble2 stopAllActions];
            [bubble3 stopAllActions];
            [bubble2 runAction:fadeout2];
            [bubble3 runAction:fadeout3];
        }
        else if(randomNum == 1)//zhenlu--it means the second answer is correct
        {
            [bubble1 stopAllActions];
            [bubble3 stopAllActions];
            [bubble1 runAction:fadeout1];
            [bubble3 runAction:fadeout3];
        }
        else if(randomNum == 2)//zhenlu--it means the third answer is correct
        {
            [bubble1 stopAllActions];
            [bubble2 stopAllActions];
            [bubble1 runAction:fadeout1];
            [bubble2 runAction:fadeout2];
        }
 
        /* ahab happy */
        if([[animationTagArray objectAtIndex:1] isEqualToString: @"301"]){
            _singingbackground.visible = NO;
            _winningbackground.visible = YES;
        }
        /*mr raven happy*/
        else if([[animationTagArray objectAtIndex:0] isEqualToString: @"401"]){
            _mrRavenWinning.visible = YES;
            _mrRavenChorus.visible = NO;
            _mrRavenDancingRapping.visible =NO;
            _mrRavenNormal.visible = NO;
            
        } 
        else {
            /*zhenlu--the answer is correct, so make lars happy*****************************************************/
            winloseFrames = [[NSMutableArray array] autorelease];
            for(int i = 1; i <= 5; i++) {
                [winloseFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"winning %d.png", i]]];
            }
            [winloseFrames retain];
            CCAnimation *winningAnim = [CCAnimation animationWithFrames:winloseFrames delay:0.4f];
            id a1 = [CCAnimate actionWithAnimation:winningAnim restoreOriginalFrame:NO];
            _larsnormaldance.visible = NO;
            _larsSing.visible = NO;
            _larswinlose.visible = YES;
            [_larswinlose runAction:a1]; 
        }
        
        //finished1 is the string when we touch the answer, and the answer is correct
        NSString *finished1 = [NSString stringWithFormat:@"%s", [[rhyme_lyrics1 string] UTF8String ]];
        //finished2 is the string when we touch the answer, and the answer is correct,replace the blank with correct answer
        NSString *finished2 = [NSString stringWithFormat:@"%@ %@",[lyric2 objectAtIndex:(indexOfArr-1)/2], correct];
        //set string of the CClabel rhyme_lyrics1 and rhyme_lyrics2 
        [rhyme_lyrics1 setString: finished1];
        [rhyme_lyrics2 setString: finished2];
        
        //create and move the score towards main score label
        
        if(mainScore==previousScore)
            previousScore=0;
        else {
            previousScore=mainScore-previousScore;
        }
        [scoreViewLabel  setString:[NSString stringWithFormat:@"%d", previousScore]];
        [scoreViewLabel setVisible:YES];
        [scoreViewLabel runAction:[CCSequence actions:[CCFadeOut actionWithDuration:1.0f], nil]];
        [scoreViewLabel runAction:[CCSequence actions:[CCMoveTo actionWithDuration:1.0f position:ccp(20,10)],[CCCallFunc actionWithTarget:self selector:@selector(updateMainScoreLabel)], nil]];
        
        
    }
    
    else{ //chosen choice is wrong
        
        //code to blink if the answer is wrong
        [self blink:tappedId isCorrect:NO];
        //blink code end
        //update score
        previousScore=mainScore;
        [scoreAlgo updateScore:&mainScore isCorrect:NO levelScore:&internalScore currentBonus:&bonus mode:EASY];
        NSLog(@"wrong. bonus dropped to %d",bonus);
        //Decrement Flowmeter
        if(bonus<=32)
        {
            flow_location = MIN(log2(bonus)*5,44);
        }
        else
        {
            if(bonus==64)
                flow_location = 32;
            else if(bonus==128)
                flow_location=38;
            else if(bonus==256)
                flow_location=44;
        }
        
        flow.visible = NO;
        flow = (CCSprite*)[flow_meter_array objectAtIndex:MIN(flow_location,44)];
        flow.visible =YES;
        
        /* ahab unhappy */
        if([[animationTagArray objectAtIndex:1] isEqualToString: @"301"]){
            _singingbackground.visible = NO;
            _losingbackground.visible = YES;
        }
        
        /* mr raven unhappy */
        else if([[animationTagArray objectAtIndex:0] isEqualToString: @"401"]){
            _mrRavenLosing.visible = YES;
            _mrRavenChorus.visible = NO;
            _mrRavenDancingRapping.visible =NO;
            _mrRavenNormal.visible = NO;
        }
        else{
            /*zhenlu--the answer is wrong, so make lars unhappy*****************************************************/ 
            losewinFrames = [[NSMutableArray array] autorelease];
            for(int i = 1; i <= 5; i++) {
                [losewinFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"losing %d.png", i]]];
            }
            [losewinFrames retain];
            
            CCAnimation *losingAnim = [CCAnimation animationWithFrames:losewinFrames delay:0.4f];
            id a2 = [CCAnimate actionWithAnimation:losingAnim restoreOriginalFrame:NO];
            _larsnormaldance.visible = NO;
            _larsSing.visible = NO;
            _larswinlose.visible = YES;
            [_larswinlose runAction:a2];
            /***********************************************************************************************/
        }
        
        [mylabel setString:@"Wrong"];
        [[SimpleAudioEngine sharedEngine] playEffect:@"beep-sound-effect.wav"];    // play lose sound effect - Meijie
        //NSString *convert = [NSString stringWithFormat:@"%d", mainScore];
        //create and move the score towards main score label
        if(mainScore==previousScore)
            previousScore=0;
        else {
            previousScore=mainScore-previousScore;
        }
        [scoreViewLabel  setString:[NSString stringWithFormat:@"%d", previousScore]];
        [scoreViewLabel setVisible:YES];
        [scoreViewLabel runAction:[CCSequence actions:[CCFadeOut actionWithDuration:1.0f], nil]];
        [scoreViewLabel runAction:[CCSequence actions:[CCMoveTo actionWithDuration:1.0f position:ccp(20,10)],[CCCallFunc actionWithTarget:self selector:@selector(updateMainScoreLabel)], nil]];
        
        
        /*******************zhenlu --- if the answer is wrong, then all the lyrics disappear******************/
        
        [bubble1 stopAllActions];
        [bubble2 stopAllActions];
        [bubble3 stopAllActions];
        [bubble1 runAction:fadeout1];
        [bubble2 runAction:fadeout2];
        [bubble3 runAction:fadeout3];
        /***********************************************************************************************/
    }
    
    return;
    
}



-(CCSprite*) createSprite:(NSString*)picname: (CGFloat)X_scale:
(CGFloat)Y_scale: (CGFloat)position_width: 
(CGFloat)position_height: (MainGamePlayScreen*) parent
{
    
    CCSprite* newsprite = [CCSprite spriteWithFile:picname];
    newsprite.position = ccp(position_width ,position_height);
    
    [newsprite setScaleX:(X_scale)];
    [newsprite setScaleY:(Y_scale)];
    
    [parent addChild:newsprite];
    
    return newsprite;
}

-(CCMenuItem*) createMenuItem:(NSString*)itemfromNI:
(NSString*) selectme:(MainGamePlayScreen*) targeted:
(SEL) func_name :
(CGFloat)position_width:(CGFloat)position_height :
(CGFloat)X_scale: (CGFloat)Y_scale

{
    
    CCMenuItem *menuItem = [CCMenuItemImage 
                            itemFromNormalImage:itemfromNI 
                            selectedImage:selectme 
                            target:targeted 
                            selector:@selector(starButtonTapped:)];
    
    menuItem.position = ccp(position_width,position_height);
    
    [menuItem setScaleX: X_scale];
    [menuItem setScaleY: Y_scale];
    
    
    return menuItem;
}

-(CCLabelTTF*) createLabel:(NSString*)content: (NSString*)fontType:
(CGFloat) fontSize:
(CGFloat)x_Pos: (CGFloat)y_Pos: 
(CGFloat)r: (CGFloat)g :(CGFloat)b
{
    
    CCLabelTTF *newLabel = [CCLabelTTF labelWithString:content fontName:fontType fontSize:fontSize];
    [newLabel setColor:ccc3(r, g, b)];
    [newLabel setAnchorPoint:ccp(0, 0.5)];
    newLabel.position = ccp(x_Pos, y_Pos);
    
    
    return newLabel;
}

-(CCMenuItemLabelAndImage*) createMenuItemLabel_Image:(NSString*)itemfromNI:
(NSString*) selectme:(MainGamePlayScreen*) targeted:
(SEL) func_name :
(CGFloat)position_width:(CGFloat)position_height :
(CGFloat)X_scale: (CGFloat)Y_scale:(NSString*)rhymestring: 
(NSString*)fontType:
(CGFloat) fontSize:
(CGFloat)x_Pos: (CGFloat)y_Pos: 
(CGFloat)r: (CGFloat)g :(CGFloat)b


{
    
    CCLabelTTF *label = [self createLabel:rhymestring :fontType :fontSize :
                                   x_Pos :y_Pos :r: g: b];
    
    
    CCMenuItemLabelAndImage *menuItem = [CCMenuItemLabelAndImage 
                                         itemFromLabel:label normalImage:selectme 
                                         selectedImage:selectme 
                                         disabledImage:selectme 
                                         target:self 
                                         selector:func_name];
    
    menuItem.position = ccp(position_width,position_height);
    
    [menuItem setScaleX: X_scale];
    [menuItem setScaleY: Y_scale];
    
    
    return menuItem;
}




-(CCLabelTTF*) createLabelwithDim:(NSString*)content: (NSString*)fontType:
(CGFloat) fontSize:
(CGFloat)x_Pos: (CGFloat)y_Pos: 
(CGFloat)r: (CGFloat)g :(CGFloat)b:(CCSprite*) parent:
(CGFloat)dim_Width: (CGFloat)dim_Height:
(CGFloat)X_scale: (CGFloat)Y_scale
{
    //Here you can center the lyrics but it might not be fixed.
    //ALso you might have to adjust the width of the dimensions of the label because its too wide--->dim_Width
    CCLabelTTF *newLabel = [CCLabelTTF labelWithString:content dimensions:CGSizeMake(dim_Width, dim_Height) alignment:CCTextAlignmentLeft fontName:fontType fontSize:fontSize];
    newLabel.position = ccp(x_Pos, y_Pos);
    [newLabel setColor:ccc3(r, g, b)];
    
    [newLabel setScaleX: X_scale];
    [newLabel setScaleY: Y_scale];
    
    newLabel.anchorPoint = ccp(0,0);
    
    return newLabel;
}

-(void)makeTouchEnable{
    if(inChorusPart==NO)
    {
        starMenu.isTouchEnabled=YES;
        CCLOG(@"star menu touch enabled in the function");
    }
    
}
-(void)makeTouchDisable{
    starMenu.isTouchEnabled=NO;
    CCLOG(@"star menu touch disabled in the function");
}

-(void)updateMainScoreLabel{
    [current_score  setString:[NSString stringWithFormat:@"%d", mainScore]]; 
    [scoreViewLabel setPosition:ccp(200, 10)];
}

- (void)LyricsScreen{
    CGSize s = [[CCDirector sharedDirector] winSize];
    animationNum = [animationTagArray objectAtIndex:indexOfArr];
    
     firstLine=[NSString stringWithFormat:@"%@\n", [lyric objectAtIndex:indexOfArr/2]];
    // chorus
    if ([[correctAnswerar  objectAtIndex:indexOfArr/2] isEqualToString: @""]) {        
        if(isTapped ==0) {
            
            //sai
            //disable touch if it is chorus part
            starMenu.isTouchEnabled=NO;
            CCLOG(@" star menu touch disabled if it is a chorus part");
            //ended disabling
            
            /*zhenlu--when it is chorus, make lars dance in the middle***********************************/
            
            inChorusPart=YES;

            if([[animationTagArray objectAtIndex:0] isEqualToString: @"501"]){
                //cat dancing in the chorus 
                catFrames = [[NSMutableArray array] autorelease];
                for(int i = 1; i <= 12; ++i) {
                    [catFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"cat %d.png", i]]];
                }
                
                [catFrames retain];
                // self.lars = [CCSprite spriteWithSpriteFrameName:@"dance 1.png"];
                _cat.position = ccp(s.width/2 - 150, s.height/4);
                CCAnimation *catAnim = [CCAnimation animationWithFrames:catFrames delay:0.3f];
                self.catAction = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:catAnim restoreOriginalFrame:NO]];
                _cat.visible = YES;
                _larswinlose.visible = NO;
                _larsSing.visible = NO;
                [_cat runAction:_catAction]; 
                
                //robot dancing in the chorus
                robotFrames = [[NSMutableArray array] autorelease];
                for(int i = 1; i <= 12; ++i) {
                    [robotFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"robot %d.png", i]]];
                }
                
                [robotFrames retain];
                // self.lars = [CCSprite spriteWithSpriteFrameName:@"dance 1.png"];
                _robot.position = ccp(s.width/2 + 150, s.height/4);
                CCAnimation *robotAnim = [CCAnimation animationWithFrames:robotFrames delay:0.3f];
                self.robotAction = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:robotAnim restoreOriginalFrame:NO]];
                _robot.visible = YES;
                _larswinlose.visible = NO;
                _larsSing.visible = NO;
                [_robot runAction:_robotAction];             
                
                //check whether lars need to open mouth or close
                if([firstLine isEqualToString:@""]){
                    _larsnormaldance.visible = YES;
                    _larswinlose.visible = NO;
                    _larsSing.visible = NO;
                    [_larsnormaldance runAction:_danceAction];
                }
                else {
                    dancingRappingFrames = [NSMutableArray array];
                    for(int i = 1; i < 12; i++){
                        [dancingRappingFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"dance %d rapping.png", i]]]; 
                    }
                    [dancingRappingFrames retain];
                    _dancingRapping.position = ccp(s.width/2 + 25, s.height/4);
                    CCAnimation *walkAnim = [CCAnimation animationWithFrames:dancingRappingFrames delay:0.3f];
                    self.dancingRappingAction = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:walkAnim restoreOriginalFrame:NO]];
                    _dancingRapping.visible = YES;
                    _larswinlose.visible = NO;
                    _larsSing.visible = NO;
                    _larsnormaldance.visible = NO;
                    [_dancingRapping runAction:_dancingRappingAction];
                    
                }


                
            }

                      // animation for ahab
            if ([[animationTagArray objectAtIndex:1] isEqualToString: @"301"]){
                static const ccColor3B ccColorBlack={0,0,0};
                [bubble1 setColor:(ccColorBlack)];
                [bubble2 setColor:(ccColorBlack)];
                [bubble3 setColor:(ccColorBlack)];
                _singingbackground.visible = NO;
                _winningbackground.visible = NO;
                _losingbackground.visible = NO;
                //check whether ahab need to close
                if([firstLine isEqualToString:@""]){
                    _chorusbackground.visible = YES;
                }
                else{
                    _chorusOpenMouthbackground.visible = YES;
                }
                
            }
            //animation for mr raven
            else if([[animationTagArray objectAtIndex:0] isEqualToString: @"401"]){
                NSLog(@"I am in mr raven");
                static const ccColor3B ccColorWhite={255,255,255};
                [bubble1 setColor:(ccColorWhite)];
                [bubble2 setColor:(ccColorWhite)];
                [bubble3 setColor:(ccColorWhite)];
                

                _mrRavenDancingRapping.visible = YES;
                //check whether mr raven need to close
                if([firstLine isEqualToString:@""]){
                    _mrRavenChorus.visible = YES;
                    _mrRavenDancingRapping.visible = NO;
                    _mrRavenNormal.visible = NO;
                    _mrRavenWinning.visible = NO;
                    _mrRavenLosing.visible = NO;
                }
                else{
                    _mrRavenDancingRapping.visible = YES;
                    _mrRavenChorus.visible = NO;
                    _mrRavenNormal.visible = NO;
                    _mrRavenWinning.visible = NO;
                    _mrRavenLosing.visible = NO;
                }
            }
            else {
                _dancingRapping.visible = YES;
                _larswinlose.visible = NO;
                _larsSing.visible = NO;
                _larsnormaldance.visible = NO;
                
            }
            /***********************************************************************************************/
            
        }
        
    }
    else {
        if(isTapped ==0) {
            
            /********zhenlu -- when the chorus is over, make lars back to the left and sing normally***********************************/
            inChorusPart=NO;
            
            /***********************************************************************************************/    
            // animation for ahab
            if([[animationTagArray objectAtIndex:1] isEqualToString: @"301"]){
                _singingbackground.visible = YES;
                _chorusbackground.visible = NO;
                _chorusOpenMouthbackground.visible = NO;
                _winningbackground.visible = NO;
                _losingbackground.visible = NO;
            }
            // animation for mr raven
            else if([[animationTagArray objectAtIndex:0] isEqualToString: @"401"]){
                _mrRavenNormal.visible = YES;
                _mrRavenDancingRapping.visible = NO;
                _mrRavenChorus.visible = NO;
                _mrRavenLosing.visible = NO;
                _mrRavenWinning.visible = NO;
            }
            else {
                [_larswinlose stopAllActions];
                _larsSing.position = ccp(s.width/5, s.height/4);
                singFrames = [[NSMutableArray array] autorelease];
                for(int i = 1; i <= 18; ++i) {
                    [singFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"normal %d.png", i]]];
                }
                
                [singFrames retain];
                CCAnimation *normalAnim = [CCAnimation animationWithFrames:singFrames delay:BPMs/500];
                self.normalAction = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:normalAnim restoreOriginalFrame:NO]];
                _larsSing.visible = YES;
                _dancingRapping.visible = NO;
                _cat.visible = NO;
                _robot.visible = NO;
                _larsnormaldance.visible = NO;
                _larswinlose.visible = NO;
                [_larsSing runAction:_normalAction];
            }
            
        }
    }
    
    if([animationNum isEqualToString: @"1"]){
        dancingBabyFrames = [[NSMutableArray array] autorelease];
        for(int i = 1; i <= 6; i++) {
            [dancingBabyFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"baby %d.png", i]]];
        }
        [dancingBabyFrames retain];
        CCAnimation *babyAnim = [CCAnimation animationWithFrames:dancingBabyFrames delay:0.25f];
        id a1 = [CCAnimate actionWithAnimation:babyAnim restoreOriginalFrame:NO];
        //  _larsnormaldance.visible = NO;
        //       _larsSing.visible = NO;
        //        _larswinlose.visible = NO;
        _dancingBaby.visible = YES;
        [_dancingBaby runAction:a1];
    }
    else if([animationNum isEqualToString: @"2"]){
        mtvFrames = [[NSMutableArray array] autorelease];
        for(int i = 1; i <= 11; i++) {
            [mtvFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"mtv%d.png", i]]];
        }
        [mtvFrames retain];
        CCAnimation *mtvAnim = [CCAnimation animationWithFrames:mtvFrames delay:0.25f];
        id a1 = [CCAnimate actionWithAnimation:mtvAnim restoreOriginalFrame:NO];
        _mtv.visible = YES;
        [_mtv runAction:a1];        
    }
    else if([animationNum isEqualToString: @"4"]){
        steveFrames = [[NSMutableArray array] autorelease];
        for(int i = 1; i <= 2; i++) {
            [steveFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"steve %d.png", i]]];
        }
        [steveFrames retain];
        CCAnimation *steveAnim = [CCAnimation animationWithFrames:steveFrames delay:0.25f];
        id a1 = [CCAnimate actionWithAnimation:steveAnim restoreOriginalFrame:NO];
        id a2 = [CCMoveTo actionWithDuration:6.0f position:ccp(s.width/1.2, s.height+100)];
        id a3 = [CCRepeatForever actionWithAction: a1];
        _steve.visible = YES;
        [_steve runAction:a3]; 
        [_steve runAction:a2];       
    }
    else if([animationNum isEqualToString: @"3"]){
        bushFrames = [[NSMutableArray array] autorelease];
        for(int i = 1; i <= 5; i++) {
            [bushFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"george %d.png", i]]];
        }
        [bushFrames retain];
        CCAnimation *bushAnim = [CCAnimation animationWithFrames:bushFrames delay:0.25f];
        id a1 = [CCAnimate actionWithAnimation:bushAnim restoreOriginalFrame:NO];
        _bush.visible = YES;
        [_bush runAction:a1];        
    }
    else if([animationNum isEqualToString: @"5"]){
        imaginationFrames = [[NSMutableArray array] autorelease];
        for(int i = 1; i <= 5; i++) {
            [imaginationFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"bubble %d.png", i]]];
        }
        [imaginationFrames retain];
        CCAnimation *imaginationAnim = [CCAnimation animationWithFrames:imaginationFrames delay:0.25f];
        id a1 = [CCAnimate actionWithAnimation:imaginationAnim restoreOriginalFrame:NO];
        //        _larsSing.visible = NO;
        //        _larsnormaldance = NO;
        _imagination.visible = YES;
        [_imagination runAction:a1];        
    }
    else if([animationNum isEqualToString: @"6"]){
        emoticonFrames = [[NSMutableArray array] autorelease];
        for(int i = 1; i <= 4; i++) {
            [emoticonFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"emoticon %d.png", i]]];
        }
        [emoticonFrames retain];
        CCAnimation *emoticonAnim = [CCAnimation animationWithFrames:emoticonFrames delay:0.25f];
        id a1 = [CCAnimate actionWithAnimation:emoticonAnim restoreOriginalFrame:NO];
        _emoticon.visible = YES;
        [_emoticon runAction:a1];        
    }
    else if([animationNum isEqualToString: @"7"]){
        typingFrames = [[NSMutableArray array] autorelease];
        for(int i = 1; i <= 2; i++) {
            [typingFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"typing %d.png", i]]];
        }
        [typingFrames retain];
        CCAnimation *typingAnim = [CCAnimation animationWithFrames:typingFrames delay:0.25f];
        id a1 = [CCAnimate actionWithAnimation:typingAnim restoreOriginalFrame:NO];
        id a2 = [CCRepeatForever actionWithAction:a1];
        //       _larsSing.visible = NO;
        _emoticon.visible = NO;
        _typing.visible = YES;
        [_typing runAction:a2];        
    }
    else if([animationNum isEqualToString: @"8"]){
        flatmassFrames = [[NSMutableArray array] autorelease];
        for(int i = 1; i <= 14; i++) {
            [flatmassFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"flatmass %d.png", i]]];
        }
        [flatmassFrames retain];
        //      CCAnimation *flatmassAnim = [CCAnimation animationWithFrames:flatmassFrames delay:0.25f];
        id a1 = [CCMoveTo actionWithDuration:3.0f position:ccp(s.width-50, s.height + 50)];
        _flatmass1.visible = YES;
        
        id a2 = [CCMoveTo actionWithDuration:3.0f position:ccp(s.width-150, s.height + 50)];
        _flatmass2.visible = YES;
        
        id a3 = [CCMoveTo actionWithDuration:3.0f position:ccp(s.width-250, s.height + 50)];
        _flatmass3.visible = YES;
        
        id a4 = [CCMoveTo actionWithDuration:3.0f position:ccp(s.width-350, s.height + 50)];
        _flatmass4.visible = YES;
        
        id a5 = [CCMoveTo actionWithDuration:3.0f position:ccp(s.width-50, s.height + 50)];
        _flatmass5.visible = YES;
        
        id a6= [CCMoveTo actionWithDuration:3.0f position:ccp(s.width-150, s.height + 50)];
        _flatmass6.visible = YES;
        
        id a7 = [CCMoveTo actionWithDuration:3.0f position:ccp(s.width-250, s.height + 50)];
        _flatmass7.visible = YES;
        
        id a8 = [CCMoveTo actionWithDuration:3.0f position:ccp(s.width-350, s.height + 50)];
        _flatmass8.visible = YES;
        
        id a9 = [CCMoveTo actionWithDuration:3.0f position:ccp(s.width-50, s.height + 50)];
        _flatmass9.visible = YES;
        
        id a10 = [CCMoveTo actionWithDuration:3.0f position:ccp(s.width-150, s.height + 50)];
        _flatmass10.visible = YES;
        
        id a11 = [CCMoveTo actionWithDuration:3.0f position:ccp(s.width-250, s.height + 50)];
        _flatmass11.visible = YES;
        
        id a12 = [CCMoveTo actionWithDuration:3.0f position:ccp(s.width-350, s.height + 50)];
        _flatmass12.visible = YES;
        
        [_flatmass1 runAction:a1];
        [_flatmass2 runAction:a2];
        [_flatmass3 runAction:a3];
        [_flatmass4 runAction:a4];
        [_flatmass5 runAction:a5];
        [_flatmass6 runAction:a6];
        [_flatmass7 runAction:a7];
        [_flatmass8 runAction:a8];
        [_flatmass9 runAction:a9];
        [_flatmass10 runAction:a10];
        [_flatmass11 runAction:a11];
        [_flatmass12 runAction:a12];
        
    }
    else if([animationNum isEqualToString: @"201"]){
        hipsgirlFrames = [[NSMutableArray array] autorelease];
        for(int i = 1; i <= 12; i++) {
            [hipsgirlFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"girl %d.png", i]]];
        }
        [hipsgirlFrames retain];
        CCAnimation *hipsgirlAnim = [CCAnimation animationWithFrames:hipsgirlFrames delay:0.25f];
        id a1 = [CCAnimate actionWithAnimation:hipsgirlAnim restoreOriginalFrame:NO];
        _hipstergirl.visible = YES;
        _larswinlose.visible = NO;
        [_hipstergirl runAction:a1];        
    }
    else if([animationNum isEqualToString: @"202"]){
        hipsgirlFrames = [[NSMutableArray array] autorelease];
        for(int i = 1; i <= 12; i++) {
            [hipsgirlFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"girl %d.png", i]]];
        }
        [hipsgirlFrames retain];
        CCAnimation *hipsgirlAnim = [CCAnimation animationWithFrames:hipsgirlFrames delay:0.25f];
        id a1 = [CCAnimate actionWithAnimation:hipsgirlAnim restoreOriginalFrame:NO];
        _larsnormaldance.visible = NO;
        _hipstergirl.position = ccp(s.width/2, s.height/3.6);
        _hipstergirl.visible = YES;
        _larswinlose.visible = NO;
        [_hipstergirl runAction:a1]; 
        _dancingRapping.visible = NO;
    }
    else if([animationNum isEqualToString: @"203"]){    
        _indie.visible = YES;
    }
    else if([animationNum isEqualToString: @"204"]){    
        _vice.visible = YES;
    }
    else if([animationNum isEqualToString: @"205"]){    
        _nebraska.visible = YES;
    }
    else if([animationNum isEqualToString: @"206"]){    
        _keren.visible = YES;
        _nebraska.visible = NO;
    }
    else if([animationNum isEqualToString: @"207"]){    
        _dudes.visible = YES;
    }
    else if([animationNum isEqualToString: @"208"]){    
        _jewel.visible = YES;
    }
    else if([animationNum isEqualToString: @"209"]){    
        _scissors.visible = YES;
        _glue.visible = YES;
    }
    else if([animationNum isEqualToString: @"210"]){    
        _spankrock.visible = YES;
    }
    else if([animationNum isEqualToString: @"301"]){    
        _larsSing.visible = NO;
        _larsnormaldance.visible = NO;
        _larswinlose.visible = NO;
        _cat.visible = NO;
        _robot.visible = NO;
        _dancingRapping.visible = NO;
    }
    else if([animationNum isEqualToString: @"401"]){
        _larsSing.visible = NO;
        _larsnormaldance.visible = NO;
        _larswinlose.visible = NO;
        _cat.visible = NO;
        _robot.visible = NO;
        _dancingRapping.visible = NO;
    }
    else {
        _spankrock.visible = NO;
        _scissors.visible = NO;
        _glue.visible = NO;
        _jewel.visible = NO;
        _dudes.visible = NO;
        _keren.visible = NO;
        _nebraska.visible = NO;
        _vice.visible = NO;
        _indie.visible = NO;
        _dancingBaby.visible = NO;
        _mtv.visible = NO;
        _steve.visible = NO;
        _bush.visible = NO;
        _imagination.visible = NO;
        _flatmass1.visible = NO;
        _flatmass2.visible = NO;
        _flatmass3.visible = NO;
        _flatmass4.visible = NO;
        _flatmass5.visible = NO;
        _flatmass6.visible = NO;
        _flatmass7.visible = NO;
        _flatmass8.visible = NO;
        _flatmass9.visible = NO;
        _flatmass10.visible = NO;
        _flatmass11.visible = NO;
        _flatmass12.visible = NO;
        _typing.visible = NO;
        _emoticon.visible = NO;
        _hipstergirl.visible = NO;
    }
    

    
    //xiaoyin--firstLine of lyrics
//    firstLine=[NSString stringWithFormat:@"%@\n", [lyric objectAtIndex:indexOfArr/2]];
    
    
    //if correct answer has been touched and the song already reach the second line of lyrics
    if ((isCorrect == YES)&&(indexOfArr%2 == 1)) 
    {
        //fill the blank in the second line with answer
        secondLine =[NSString stringWithFormat:@"%@ %@",[lyric2 objectAtIndex:indexOfArr/2], correct];
    }
    else{
        //this if tests whether it is a chorus part or not
        if ([[correctAnswerar  objectAtIndex:indexOfArr/2] isEqualToString: @""]) {
            //xiaoyin--delete the appending blank of the second line 
            
            secondLine =[NSString stringWithFormat:@"%@",[lyric2 objectAtIndex:indexOfArr/2]];
            
        }
        else { //not a chorus part , then second line need to append blank
            secondLine =[NSString stringWithFormat:@"%@ _____",[lyric2 objectAtIndex:indexOfArr/2]];
        }
    }
    
    isCorrect = NO;
    
    correct = [correctAnswerar  objectAtIndex:indexOfArr/2];    
    
    
    //xiaoyin--because initially set empty string to rhyme_lyrics1 and rhyme_lyrics2, need to display the lyrics when tick1 call next time, at which time countLoop is defintely large than 0 
    if(countLoop >0 || displayLoopNums==0) {
        
        [rhyme_lyrics1 setString:firstLine];
        [rhyme_lyrics2 setString:secondLine];
        
    }
    //xiaoyin--this color is black
    static const ccColor3B ccAZURE1={0,0,0};
    //xiaoyin--this color is red
    static const ccColor3B ccAZURE2={240,0,0};
    if(indexOfArr % 2 ==1) {//xiaoyin--set the first line black, the second line red when the song reach second line
        [rhyme_lyrics1 setColor:ccAZURE1];
        [rhyme_lyrics2 setColor:ccAZURE2];
        
    }
    else{//xiaoyin--set the first line red, the second line black when the song reach first line
        
        [rhyme_lyrics1 setColor:ccAZURE2];
        [rhyme_lyrics2 setColor:ccAZURE1];
        
        
        //enable the touch so that he can select
        //starMenu.isTouchEnabled = YES;
        
        
        answerChoice1=[correctAnswerar  objectAtIndex:indexOfArr/2];
        answerChoice2=[wrongAnswersar  objectAtIndex:indexOfArr];
        answerChoice3=[wrongAnswersar  objectAtIndex:indexOfArr+1];
        
        //xiaoyin--because initially set empty string to the answer bubbles, need to display the answers when tick1 call next time, at which time countLoop is defintely large than 0 
        if(countLoop >0 || displayLoopNums ==0) {
            /* randomize the position of answer choices -- Meijie Wang */
            randomNum = (CCRANDOM_0_1() * 2.999999999); 
            bubbleArray = [NSArray arrayWithObjects:bubble1, bubble2, bubble3, nil];
            [[bubbleArray objectAtIndex:randomNum] setString:answerChoice1];
            [[bubbleArray objectAtIndex:(randomNum+1)%3] setString:answerChoice2];
            [[bubbleArray objectAtIndex:(randomNum+2)%3] setString:answerChoice3];
            /* ------ */
        }
        
        
        /***********************when there are no choices chosen, keep moving and then disappear******************/
        
        //zhenlu -- initialize the 3 answers position so that they can move from the initial position to the left      
        [bubble1 setPosition:ccp(s.width-100, 185)];
        [bubble2 setPosition:ccp(s.width-100, 110)];
        [bubble3 setPosition:ccp(s.width-100, 35)];
        //zhenlu -- 3 answers default actions which is move fadein, moving from right to leftm and fadeout      
        CCMoveTo * lyrics1Move1 = [CCMoveTo actionWithDuration:((float)60/BPMs*BPLs*1.55) position:ccp(200,185)];
        sequence1 = [CCSequence actions:[CCCallFunc actionWithTarget:self selector:@selector(makeTouchEnable)],[CCFadeIn actionWithDuration:0.00001],lyrics1Move1,[CCCallFunc actionWithTarget:self selector:@selector(makeTouchDisable)],[CCFadeOut actionWithDuration:1], nil];
        
        CCMoveTo * lyrics2Move1 = [CCMoveTo actionWithDuration:((float)60/BPMs*BPLs*1.55) position:ccp(200,110)];
        sequence2 = [CCSequence actions:[CCFadeIn actionWithDuration:0.00001], lyrics2Move1,[CCFadeOut actionWithDuration:1], nil];
        
        CCMoveTo *lyrics3Move1 = [CCMoveTo actionWithDuration:((float)60/BPMs*BPLs*1.55) position:ccp(200,35)];
        sequence3 = [CCSequence actions:[CCFadeIn actionWithDuration:0.00001],lyrics3Move1,[CCFadeOut actionWithDuration:1], nil];
        
        [bubble1 stopAllActions];
        [bubble2 stopAllActions];
        [bubble3 stopAllActions];
        
        
        [bubble1 runAction: sequence1];
        [bubble2 runAction: sequence2];
        [bubble3 runAction: sequence3];
        
        
        /*****************************************************************************************************/
        
    }
    if(indexOfArr%2==1) {
        isTapped = 0;
    }
    
}



-(void)decrement:(ccTime) dt{
    
    
    t-=1;
    minutes=t/60;
    seconds=t%60;
    
    if(seconds<10)
        pData = [NSString stringWithFormat:@"%d:0%d", minutes, seconds];
    
    else
        pData = [NSString stringWithFormat:@"%d:%d", minutes, seconds];
    
    [countdown setString:pData ];
    
}
//xiaoyin--call tick1 every interval time
-(void)tick1:(ccTime)dt {
    //xiaoyin--increase the countLoop every time tick1 called
    countLoop++;
    
    //if the song start at first begin, then indexofArr need to be initialed as 1 
    if(countLoop ==1 && displayLoopNums==0) {
        indexOfArr = 1;
    }
    
    //xioayin--if tick1 called displayLoopNums times, start call function lyricsScreen
    if(countLoop>displayLoopNums-1) {
        if(indexOfArr<(leng-1)*2){  //the song is not yet complete
            
            [self LyricsScreen];
            
            indexOfArr++;}
        else if(indexOfArr==(leng-1)*2){
            [[SimpleAudioEngine sharedEngine] stopBackgroundMusic];    // stop background music
            /**zhenlu -- won action at the end of level*****************/
            CGSize s = [[CCDirector sharedDirector] winSize];
            if(internalScore > 20)
            {
                /*zhenlu added*/
                // animation for ahab
                if([[animationTagArray objectAtIndex:1] isEqualToString: @"301"]){
                    _wonbackground.visible = YES;
                    _chorusbackground.visible = NO;
                    _chorusOpenMouthbackground.visible = NO;
                }
                // animation for mr raven
                else if([[animationTagArray objectAtIndex:0] isEqualToString: @"401"]){
                    _mrRavenwon.visible = YES;
                    _mrRavenChorus.visible = NO;
                    _mrRavenDancingRapping.visible = NO;
                }
                else{
                    [_larswinlose stopAllActions];
                    // Load up the frames of our animation
                    wonFrames = [[NSMutableArray array] autorelease];
                    for(int i = 1; i <= 3; ++i) {
                        [wonFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"won %d.png", i]]];
                    }
                    for(int j = 3; j >=1; --j){
                        [wonFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache]   spriteFrameByName:[NSString stringWithFormat:@"won %d.png", j]]];
                    }
                    [wonFrames retain];
                    _larswinlose.position = ccp(s.width/2, s.height/4);
                    CCAnimation *wonAnim = [CCAnimation animationWithFrames:wonFrames delay:0.4f];
                    self.wonAction = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:wonAnim restoreOriginalFrame:NO]];
                    _larsnormaldance.visible = NO;
                    _larsSing.visible = NO;
                    _larswinlose.visible = YES;
                    _dancingRapping.visible = NO;
                    [_larswinlose runAction:_wonAction ];
                }
                /********************************************************/
            }
            else {
                // animation for ahab
                if([[animationTagArray objectAtIndex:1] isEqualToString: @"301"]){
                    _lostbackground.visible = YES;
                    _chorusbackground.visible = NO;
                    _chorusOpenMouthbackground.visible = NO;
                }
                // animation for mr raven
                else if([[animationTagArray objectAtIndex:0] isEqualToString: @"401"]){
                    _mrRavenLost.visible = YES;
                    _mrRavenChorus.visible = NO;
                    _mrRavenDancingRapping.visible = NO;
                }
                else{
                    /***zhenlu -- lose action at the end of level**************/
                    [_larsnormaldance stopAllActions];
                    // Load up the frames of our animation
                    lostFrames = [[NSMutableArray array] autorelease];
                    for(int i = 1; i <= 2; ++i) {
                        [lostFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"lost %d.png", i]]];
                    }
                    for(int j = 2; j >=1; --j){
                        [lostFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"lost %d.png", j]]];
                    }
                    [lostFrames retain];
                    _larswinlose.position = ccp(s.width/2, s.height/4);
                    CCAnimation *wonAnim = [CCAnimation animationWithFrames:lostFrames delay:0.4f];
                    self.lostAction = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:wonAnim restoreOriginalFrame:NO]];
                    _larsnormaldance.visible = NO;
                    _larsSing.visible = NO;
                    _larswinlose.visible = YES;
                    _dancingRapping.visible = NO;
                    [_larswinlose runAction:_lostAction ];
                }
                /********************************************************/
            }
            indexOfArr ++;
        }
        else{  //the song is complete
            //gloablvar is a singleton class
            //it is initalized only once at the begining of the game and holds the name of the song being played
            globalVar* sharedGameStateInstance = [globalVar sharedGameStateInstance];
            [sharedGameStateInstance updateCountArray]; //changes the song to next song
            // if at the end of the playlist. no more songs to play
            if ([sharedGameStateInstance isReachEnd]) {
                [self unschedule:@selector(decrement:)];
                [[SimpleAudioEngine sharedEngine] stopBackgroundMusic];      // stop background music
                [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:0.5f scene:[MainScreen scene]]];
                [self unschedule:@selector(tick1:)];
            }
            //go to the next song. but display the score card to the user. So call continuescreen
            else {
                [self unschedule:@selector(decrement:)];
                
                //update mainscore to the global variables in globalvar.h --added by sai
                [sharedGameStateInstance setMainScore:mainScore];
                [sharedGameStateInstance setLevelScore:internalScore];
                [sharedGameStateInstance setMileStones:mileStones];
                [sharedGameStateInstance setBonus:bonus];
                //end updating main score                
                
                
                [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:0.5f scene:[ContinueScreen scene]]];
                [self unschedule:@selector(tick1:)];
            }
        }        
    }
}


//Leon - Will update visibility pause when button pressed
- (void)pauseButtonpressed {
    
    [[CCDirector sharedDirector] pause];
    [[SimpleAudioEngine sharedEngine] pauseBackgroundMusic];
    pause_button.visible = NO;
    play_button.visible = YES;
    pauseMenuBackGround.visible=YES;
    pauseMenu.visible=YES;
    _hidelyrics.visible = YES;
    
}

//Leon - Will update visibility play when button pressed
- (void)playButtonpressed {
    
    [[SimpleAudioEngine sharedEngine] resumeBackgroundMusic];
    [[CCDirector sharedDirector] resume];
    pause_button.visible = YES;
    play_button.visible = NO;
    pauseMenu.visible=NO;
    pauseMenuBackGround.visible=NO;
    _hidelyrics.visible = NO;
}


// on "init" you need to initialize your instance
-(id) init
{
    
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init] )) {  
        firstLine = [[NSString alloc] init];
        
        
        indexOfArr = 0;
        countLoop = 0;
        bonus = 1;  
        
        internalScore= 0;
        mileStones= 0;
        isCorrect = NO;
        bubbleArray = [[NSArray alloc] init];
        //init parser
        parser = [[SongParser alloc] init];
        globalVar* sharedGameStateInstance = [globalVar sharedGameStateInstance];
        songName = [sharedGameStateInstance getCurrentSong];
        [sharedGameStateInstance printSongArray];  
        
        
        
        // ask the songParser to parse the song named songName
        [parser chooseSong:songName];
        mainScore= [sharedGameStateInstance getMainScore];
        //added by sai. setting the score variables
        //[sharedGameStateInstance setMainScore:0];
        [sharedGameStateInstance setLevelScore:0];
        [sharedGameStateInstance setBonus:1];
        [sharedGameStateInstance setMileStones:0];
        
        //end settign score vars
        
        //added by sai
        
        //to blink the area red or green if answer is correct or wrong
        
        //invisible sprites. We will use them to blink
        //position:ccp(200, 185)];position:ccp(200,110)];position:ccp(200,35)];
        CCSprite *fadeSprite1=[CCSprite spriteWithFile:@"blank.png"];
        CGSize size=[[CCDirector sharedDirector] winSize];
        [fadeSprite1 setOpacity:0];
        [fadeSprite1 setColor:ccc3(255, 0, 0)];
        [fadeSprite1 setAnchorPoint:ccp(0, 0)];
        [fadeSprite1 setPosition:ccp(150, 0)];
        [fadeSprite1 setTextureRect:CGRectMake(150, 0, size.width-150,68)];
        [self addChild:fadeSprite1 z:3 tag:TAG_FADE_SPRITE1];
        
        CCSprite *fadeSprite2=[CCSprite spriteWithFile:@"blank.png"];
        [fadeSprite2 setOpacity:0];
        [fadeSprite2 setColor:ccc3(0, 255, 0)];
        [fadeSprite2 setAnchorPoint:ccp(0, 0)];
        [fadeSprite2 setPosition:ccp(150, 68)];
        [fadeSprite2 setTextureRect:CGRectMake(150, 68, size.width-150,76)];
        [self addChild:fadeSprite2 z:3 tag:TAG_FADE_SPRITE2];
        
        CCSprite *fadeSprite3=[CCSprite spriteWithFile:@"blank.png"];
        [fadeSprite3 setOpacity:0];
        [fadeSprite3 setColor:ccc3(0, 0, 255)];
        [fadeSprite3 setAnchorPoint:ccp(0, 0)];
        [fadeSprite3 setPosition:ccp(150, 146)];
        [fadeSprite3 setTextureRect:CGRectMake(150, 146, size.width-150,76)];
        [self addChild:fadeSprite3 z:3 tag:TAG_FADE_SPRITE3];
        
        //ended sai code
        
        
        // variables for song markers
        level = [[NSMutableString alloc] init];
        lyrics1 = [[NSMutableString alloc] init];
        lyrics2 = [[NSMutableString alloc] init];
        correctAnswer = [[NSMutableString alloc] init];
        wrongAnswers = [[NSMutableString alloc] init];
        songlen = [[NSMutableString alloc] init];
        displayLoop = [[NSMutableString alloc] init];
        BPM = [[NSMutableString alloc] init];
        BPL = [[NSMutableString alloc] init];
        
        
        // get marker values
        
        level = [parser getlevelValue];
        lyrics1 = [parser getlyrics1Value];
        lyrics2 = [parser getlyrics2Value];
        correctAnswer = [parser getcorrectAnswerValue];
        wrongAnswers = [parser getwrongAnswersValue];
        songlen = [parser getsonglenValue];
        BPM = [parser getBPM];
        BPL = [parser getBPL];
        displayLoop = [parser getsongdisplayLoop];
        animationTag = [parser getanimationTags];
        
        
        //get the elements separated by "/"
        lyric = [lyrics1 componentsSeparatedByString:@"/"];
        lyric2 = [lyrics2 componentsSeparatedByString:@"/"];
        correctAnswerar = [correctAnswer componentsSeparatedByString:@"/"];
        wrongAnswersar = [wrongAnswers componentsSeparatedByString:@"/"];
        levelar = [level componentsSeparatedByString:@"/"];
        songlength = [songlen componentsSeparatedByString:@"/"];
        BPMNum = [BPM componentsSeparatedByString:@"/"];
        BPLNum = [BPL componentsSeparatedByString:@"/"];
        displayLoopNum = [displayLoop componentsSeparatedByString:@"/"];
        animationTagArray = [animationTag componentsSeparatedByString:@"/"];
        
        /* delete last empty element in the arrays - Maggie*/
        [animationTagArray removeObjectAtIndex:[animationTagArray count]-1];
        [correctAnswerar removeObjectAtIndex:[correctAnswerar count]-1];
        
        
        // Checking for difficulty Level >>>Rachit
        
        
        lengDiff = [[NSString stringWithFormat:@"%i", [levelar count]] intValue];
        lengDiff--;
        
        checkDiff=[sharedGameStateInstance difflevel];
        for(int p=0;p<lengDiff;p++){
            if(checkDiff==1){
                if([[levelar objectAtIndex:p] isEqualToString:@"medium"] || [[levelar objectAtIndex:p] isEqualToString:@"hard"]){
                    
                    newstr=[lyric2 objectAtIndex:p];
                    newstr=[newstr stringByAppendingFormat:@" "];
                    newstr=[newstr stringByAppendingFormat:[correctAnswerar objectAtIndex:p]];
                    NSLog(@"The new string is %@",newstr);
                    [lyric2 replaceObjectAtIndex:p withObject:newstr];
                    [correctAnswerar replaceObjectAtIndex:p withObject:@""];
                    [wrongAnswersar replaceObjectAtIndex:p*2 withObject:@""];
                    [wrongAnswersar replaceObjectAtIndex:(p*2)+1 withObject:@""];
                }
            }
            if(checkDiff==2){
                if([[levelar objectAtIndex:p] isEqualToString:@"hard"]){
                    newstr=[lyric2 objectAtIndex:p];
                    newstr=[newstr stringByAppendingFormat:@" "];
                    newstr=[newstr stringByAppendingFormat:[correctAnswerar objectAtIndex:p]];
                    NSLog(@"The new string is %@",newstr);
                    [lyric2 replaceObjectAtIndex:p withObject:newstr];
                    [correctAnswerar replaceObjectAtIndex:p withObject:@""];
                    [wrongAnswersar replaceObjectAtIndex:(p*2) withObject:@""];
                    [wrongAnswersar replaceObjectAtIndex:(p*2)+1 withObject:@""];
                }
            }
            
        }
        
        
        
        // End for difficulty check
        
        
        
        [lyric retain];
        [lyric2 retain];
        [correctAnswerar retain];
        [wrongAnswersar retain];
        [levelar retain];
        [songlength retain];
        [displayLoopNum retain];
        [animationTagArray retain];
       // NSLog(@"%@",animationTagArray);
        
        displayLoopNums = [[displayLoopNum objectAtIndex:0] intValue];
        BPMs = [[BPMNum objectAtIndex:0] floatValue];
        BPLs = [[BPLNum objectAtIndex:0] floatValue];
        
        CCSprite* background = [CCSprite spriteWithFile:@"new layout.png"];
        background.tag = TAG_BACKGROUND;
        background.anchorPoint = CGPointMake(0, 0);
        [self addChild:background];
        CGSize s = [[CCDirector sharedDirector] winSize];
        CGSize imageSize = [background boundingBox].size;
        [background setScaleX:(s.width/imageSize.width)];
        [background setScaleY:(s.height/imageSize.height)];
        
        
        //Added by Leon to hide lyrics during pause
        _hidelyrics =[CCSprite spriteWithFile:@"pausescreen.png"];
        //[_hidelyrics setOpacity:0];
        [_hidelyrics setColor:ccc3(255,255,255)];
        //[_hidelyrics setAnchorPoint:ccp(0, 0)];
        [_hidelyrics setPosition:ccp(310,110)];
        //[_hidelyrics setTextureRect:CGRectMake(150, 68, size.width-150,76)];
        [self addChild:_hidelyrics z:5 /*tag:TAG_FADE_SPRITE2*/];
        //_hidelyrics.position = ccp(150,50);
        _hidelyrics.scaleY = .275;
        _hidelyrics.scaleX = .325;
        _hidelyrics.visible = NO;
        //End of Add by Leon
        
        
        //added by sai to display the pauseMenu when the game is paused
        pauseMenuBackGround=[CCSprite spriteWithFile:@"blankslide.jpeg"];
        [pauseMenuBackGround setScaleX:.8];
        [pauseMenuBackGround setScaleY:.13];
        [pauseMenuBackGround setPosition:ccp(0, 270)];
        pauseMenuBackGround.visible=NO;
        [self addChild:pauseMenuBackGround z:5];
        CCLOG(@"sai debug");
        CCMenuItemImage *menuItem_restart = [CCMenuItemImage itemFromNormalImage:@"return_menuButton.png"
                                                                   selectedImage:@"return_menuButton.png"
                                                                          target:self
                                                                        selector:@selector(restartTapped)];
        
        [menuItem_restart setScaleX:(0.3f)];
        [menuItem_restart setScaleY:(0.3f)];
        [menuItem_restart setPosition:ccp(0, 10)];
        
        
        CCMenuItemImage *menuItem_goBack = [CCMenuItemImage itemFromNormalImage:@"menu_menuButton.png"
                                                                  selectedImage:@"menu_menuButton.png"
                                                                         target:self
                                                                       selector:@selector(goBackToMainMenuTapped)];
        [menuItem_goBack setPosition:ccp(130, 10)];
	    
        [menuItem_goBack setScaleX:(0.3f)];
        [menuItem_goBack setScaleY:(0.3f)];
        
        CCMenuItemImage *menuItem_help= [CCMenuItemImage itemFromNormalImage:@"help_menuButton.png"
                                                               selectedImage:@"help_menuButton.png"
                                                                      target:self
                                                                    selector:@selector(helpTapped)];
        
        [menuItem_help setPosition:ccp(260, 10)];
        [menuItem_help setScaleX:(0.3f)];
        [menuItem_help setScaleY:(0.3f)];
        
        pauseMenu = [CCMenu menuWithItems: menuItem_restart,menuItem_help,menuItem_goBack, nil];
        [pauseMenu setPosition:ccp(60, 260)];
        //pauseMenu.position = CGPointZero;
        
        //add the menu to  scene
        [self addChild:pauseMenu z:6];
        pauseMenu.visible=NO;
        
        //end add by sai
        
        
        //adding the score label to the screen
        //added by sai
        current_score = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"%d",mainScore] fontName:@"Arial Black" fontSize:20.0f];
        //[current_score setColor:ccc3(r, g, b)];
        [current_score setAnchorPoint:ccp(0, 0)];
        [current_score setPosition:ccp(12, 10)];
        [self addChild:current_score z:3];
        
        scoreViewLabel = [CCLabelTTF labelWithString:@"temp one" fontName:@"Arial Black" fontSize:20.0f];
        [scoreViewLabel setAnchorPoint:ccp(0, 0)];
        [scoreViewLabel setPosition:ccp(200, 10)];
        [self addChild:scoreViewLabel z:3];
        [scoreViewLabel setVisible:NO];
        
        
        //define animations for the scoreViewLabel
        scoreViewFadeIn=[CCFadeIn actionWithDuration:1.0f];
        scoreViewFadeOut=[CCFadeOut actionWithDuration:1.0f];
        scoreViewMove=[CCMoveTo actionWithDuration:1.0f position:ccp(12,10)];
        
        //end adding score lable
        
        CCSprite*  rhyme= [CCSprite node];
        rhyme.position = ccp(s.width-s.width/2,s.height-73);
        
        leng = [[NSString stringWithFormat:@"%i", [correctAnswerar count]] intValue];
        NSLog(@"The length of freshar array is %i",leng);
        
        //get the correct answer from the correct answers array. /2 is because for every two lines there is one correct answer
        correct = [correctAnswerar objectAtIndex:indexOfArr/2];
        [correct retain];
        
        /**************zhenlu---igeneration animation initial things*****************/
        //zhenlu -- lars dancing rapping

        //zhenlu -- dancing baby
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"baby.plist"];        
        CCSpriteBatchNode *spriteSheet4 = [CCSpriteBatchNode batchNodeWithFile:@"baby.png"];
        [self addChild:spriteSheet4];
        
        self.dancingBaby = [CCSprite spriteWithSpriteFrameName:@"baby 1.png"];
        _dancingBaby.position = ccp(s.width/1.2, s.height/6.5);
        [spriteSheet4 addChild:_dancingBaby];
        _dancingBaby.scale = 0.6f;
        _dancingBaby.visible=NO;        
        
        //zhenlu -- mtv
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"mtv.plist"];        
        CCSpriteBatchNode *spriteSheet5 = [CCSpriteBatchNode batchNodeWithFile:@"mtv.png"];
        [self addChild:spriteSheet5];
        
        self.mtv = [CCSprite spriteWithSpriteFrameName:@"mtv1.png"];
        _mtv.position = ccp(s.width/1.3, s.height/3);
        //_mtv.scale = 0.6f;
        [spriteSheet5 addChild:_mtv];
        _mtv.visible=NO; 
        
        //zhenlu -- bush
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"bush.plist"];        
        CCSpriteBatchNode *spriteSheet6 = [CCSpriteBatchNode batchNodeWithFile:@"bush.png"];
        [self addChild:spriteSheet6];
        
        self.bush = [CCSprite spriteWithSpriteFrameName:@"george 1.png"];
        _bush.position = ccp(s.width/1.2, s.height/6);
        _bush.scale = 0.6f;
        [spriteSheet6 addChild:_bush];
        _bush.visible=NO;
        
        //zhenlu -- mtv
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"steve.plist"];        
        CCSpriteBatchNode *spriteSheet7 = [CCSpriteBatchNode batchNodeWithFile:@"steve.png"];
        [self addChild:spriteSheet7];
        
        self.steve = [CCSprite spriteWithSpriteFrameName:@"steve 1.png"];
        _steve.position = ccp(s.width/1.2, s.height/6);
        _steve.scale = 0.6f;
        [spriteSheet7 addChild:_steve];
        _steve.visible=NO;
        
        //zhenlu -- imagination
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"imagination.plist"];        
        CCSpriteBatchNode *spriteSheet8 = [CCSpriteBatchNode batchNodeWithFile:@"imagination.png"];
        [self addChild:spriteSheet8];
        
        self.imagination = [CCSprite spriteWithSpriteFrameName:@"bubble 1.png"];
        _imagination.position = ccp(s.width/3, s.height/1.5);
        _imagination.scale = 0.3f;
        [spriteSheet8 addChild:_imagination];
        _imagination .visible=NO;
        
        //zhenlu -- typing
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"typing.plist"];        
        CCSpriteBatchNode *spriteSheet9 = [CCSpriteBatchNode batchNodeWithFile:@"typing.png"];
        [self addChild:spriteSheet9];
        
        self.typing = [CCSprite spriteWithSpriteFrameName:@"typing 1.png"];
        _typing.position = ccp(s.width/1.5, s.height/6);
        _typing.scale = 0.9f;
        [spriteSheet9 addChild:_typing];
        _typing.visible=NO;
        
        //zhenlu -- emoticon
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"emotion.plist"];        
        CCSpriteBatchNode *spriteSheet10 = [CCSpriteBatchNode batchNodeWithFile:@"emotion.png"];
        [self addChild:spriteSheet10];
        
        self.emoticon = [CCSprite spriteWithSpriteFrameName:@"emoticon 1.png"];
        _emoticon.position = ccp(s.width/1.5, s.height/6);
        _emoticon.scale = 0.4f;
        [spriteSheet10 addChild:_emoticon];
        _emoticon.visible=NO;
        
        //zhenlu -- flatmass
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"flatmass.plist"];        
        CCSpriteBatchNode *spriteSheet11 = [CCSpriteBatchNode batchNodeWithFile:@"flatmass.png"];
        [self addChild:spriteSheet11];
        
        self.flatmass1 = [CCSprite spriteWithSpriteFrameName:@"flatmass 1.png"];
        _flatmass1.position = ccp(s.width-50, s.height/6);
        _flatmass1.scale = 0.2f;
        [spriteSheet11 addChild:_flatmass1];
        _flatmass1.visible=NO;
        
        self.flatmass2 = [CCSprite spriteWithSpriteFrameName:@"flatmass 2.png"];
        _flatmass2.position = ccp(s.width-150, s.height/6);
        _flatmass2.scale = 0.2f;
        [spriteSheet11 addChild:_flatmass2];
        _flatmass2.visible=NO;
        
        self.flatmass3 = [CCSprite spriteWithSpriteFrameName:@"flatmass 3.png"];
        _flatmass3.position = ccp(s.width-250, s.height/6);
        _flatmass3.scale = 0.2f;
        [spriteSheet11 addChild:_flatmass3];
        _flatmass3.visible=NO;
        
        self.flatmass4 = [CCSprite spriteWithSpriteFrameName:@"flatmass 4.png"];
        _flatmass4.position = ccp(s.width-350, s.height/6);
        _flatmass4.scale = 0.2f;
        [spriteSheet11 addChild:_flatmass4];
        _flatmass4.visible=NO;
        
        self.flatmass5 = [CCSprite spriteWithSpriteFrameName:@"flatmass 5.png"];
        _flatmass5.position = ccp(s.width-50, s.height/6 + 100);
        _flatmass5.scale = 0.2f;
        [spriteSheet11 addChild:_flatmass5];
        _flatmass5.visible=NO;
        
        self.flatmass6 = [CCSprite spriteWithSpriteFrameName:@"flatmass 6.png"];
        _flatmass6.position = ccp(s.width-150, s.height/6 + 100);
        _flatmass6.scale = 0.2f;
        [spriteSheet11 addChild:_flatmass6];
        _flatmass6.visible=NO;
        
        self.flatmass7 = [CCSprite spriteWithSpriteFrameName:@"flatmass 7.png"];
        _flatmass7.position = ccp(s.width-250, s.height/6 + 100);
        _flatmass7.scale = 0.2f;
        [spriteSheet11 addChild:_flatmass7];
        _flatmass7.visible=NO;
        
        self.flatmass8 = [CCSprite spriteWithSpriteFrameName:@"flatmass 8.png"];
        _flatmass8.position = ccp(s.width-350, s.height/6 + 100);
        _flatmass8.scale = 0.2f;
        [spriteSheet11 addChild:_flatmass8];
        _flatmass8.visible=NO;
        
        self.flatmass9 = [CCSprite spriteWithSpriteFrameName:@"flatmass 9.png"];
        _flatmass9.position = ccp(s.width-50, s.height/6 + 200);
        _flatmass9.scale = 0.2f;
        [spriteSheet11 addChild:_flatmass9];
        _flatmass9.visible=NO;
        
        self.flatmass10 = [CCSprite spriteWithSpriteFrameName:@"flatmass 10.png"];
        _flatmass10.position = ccp(s.width-150, s.height/6 + 200);
        _flatmass10.scale = 0.2f;
        [spriteSheet11 addChild:_flatmass10];
        _flatmass10.visible=NO;
        
        self.flatmass11 = [CCSprite spriteWithSpriteFrameName:@"flatmass 11.png"];
        _flatmass11.position = ccp(s.width-250, s.height/6 + 200);
        _flatmass11.scale = 0.2f;
        [spriteSheet11 addChild:_flatmass11];
        _flatmass11.visible=NO;
        
        self.flatmass12 = [CCSprite spriteWithSpriteFrameName:@"flatmass 12.png"];
        _flatmass12.position = ccp(s.width-350, s.height/6 + 200);
        _flatmass12.scale = 0.2f;
        [spriteSheet11 addChild:_flatmass12];
        _flatmass12.visible=NO;
        

        //zhenlu -- dancingRapping
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"danceRapping.plist"];        
        CCSpriteBatchNode *spriteSheet22 = [CCSpriteBatchNode batchNodeWithFile:@"danceRapping.png"];
        [self addChild:spriteSheet22];
        self.dancingRapping = [CCSprite spriteWithSpriteFrameName:@"dance 1 rapping.png"];
        _dancingRapping.scale = 0.95f;
        [spriteSheet22 addChild:_dancingRapping];
        _dancingRapping.visible=NO; 
        dancingRappingFrames = [[NSMutableArray array] autorelease];
        for(int i = 1; i < 12; i++){
            [dancingRappingFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"dance %d rapping.png", i]]]; 
        }
        [dancingRappingFrames retain];
        _dancingRapping.position = ccp(s.width/2 + 25, s.height/4);
        CCAnimation *walkAnim1 = [CCAnimation animationWithFrames:dancingRappingFrames delay:0.3f];
        self.dancingRappingAction = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:walkAnim1 restoreOriginalFrame:NO]];
        [_dancingRapping runAction:_dancingRappingAction];
        
        //zhenlu -- cat dance
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"cat.plist"];        
        CCSpriteBatchNode *spriteSheet23 = [CCSpriteBatchNode batchNodeWithFile:@"cat.png"];
        [self addChild:spriteSheet23];
        self.cat = [CCSprite spriteWithSpriteFrameName:@"cat 1.png"];
        _cat.position = ccp(s.width/4.9, s.height/3.6);
        _cat.scale = 0.7;
        [spriteSheet23 addChild:_cat];
        _cat.visible=NO;
        
        //zhenlu -- robot dance
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"robot.plist"];        
        CCSpriteBatchNode *spriteSheet24 = [CCSpriteBatchNode batchNodeWithFile:@"robot.png"];
        [self addChild:spriteSheet24];
        
        self.robot = [CCSprite spriteWithSpriteFrameName:@"robot 1.png"];
        _robot.position = ccp(s.width/4.9, s.height/3.6);
        _robot.scale = 0.7;
        [spriteSheet24 addChild:_robot];
        _robot.visible=NO;        
        
        //Meijie -- hipgirldancing
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"girldancing.plist"];        
        CCSpriteBatchNode *spriteSheet12 = [CCSpriteBatchNode batchNodeWithFile:@"girldancing.png"];
        [self addChild:spriteSheet12];
        
        self.hipstergirl = [CCSprite spriteWithSpriteFrameName:@"girl 1.png"];
        _hipstergirl.position = ccp(s.width/6, s.height/3.6);
        _hipstergirl.scale = 0.8f;
        [spriteSheet12 addChild:_hipstergirl];
        _hipstergirl.visible=NO;
        
        //Meijie -- dudes
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"dudes.plist"];        
        CCSpriteBatchNode *spriteSheet13 = [CCSpriteBatchNode batchNodeWithFile:@"dudes.png"];
        [self addChild:spriteSheet13];
        
        self.dudes = [CCSprite spriteWithSpriteFrameName:@"dudes.png"];
        _dudes.position = ccp(s.width/1.2, s.height/6);
        _dudes.scale = 0.4f;
        [spriteSheet13 addChild:_dudes];
        _dudes.visible=NO;
        
        //Meijie -- glue
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"glue.plist"];        
        CCSpriteBatchNode *spriteSheet14 = [CCSpriteBatchNode batchNodeWithFile:@"glue.png"];
        [self addChild:spriteSheet14];
        
        self.glue = [CCSprite spriteWithSpriteFrameName:@"glue.png"];
        _glue.position = ccp(s.width/1.2, s.height/6);
        _glue.scale = 0.4f;
        [spriteSheet14 addChild:_glue];
        _glue.visible=NO;
        
        //Meijie -- indie
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"indie.plist"];        
        CCSpriteBatchNode *spriteSheet15 = [CCSpriteBatchNode batchNodeWithFile:@"indie.png"];
        [self addChild:spriteSheet15];
        
        self.indie = [CCSprite spriteWithSpriteFrameName:@"indie hip-hop.png"];
        _indie.position = ccp(s.width/1.2, s.height/6);
        _indie.scale = 0.4f;
        [spriteSheet15 addChild:_indie];
        _indie.visible=NO;
        
        //Meijie -- jewel night
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"jewel night.plist"];        
        CCSpriteBatchNode *spriteSheet16 = [CCSpriteBatchNode batchNodeWithFile:@"jewel night.png"];
        [self addChild:spriteSheet16];
        
        self.jewel = [CCSprite spriteWithSpriteFrameName:@"jewel night.png"];
        _jewel.position = ccp(s.width/1.2, s.height/6);
        _jewel.scale = 0.4f;
        [spriteSheet16 addChild:_jewel];
        _jewel.visible=NO;
        
        //Meijie -- karen
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"karen.plist"];        
        CCSpriteBatchNode *spriteSheet17 = [CCSpriteBatchNode batchNodeWithFile:@"karen.png"];
        [self addChild:spriteSheet17];
        
        self.keren = [CCSprite spriteWithSpriteFrameName:@"karen.png"];
        _keren.position = ccp(s.width/1.2, s.height/6);
        _keren.scale = 0.4f;
        [spriteSheet17 addChild:_keren];
        _keren.visible=NO;
        
        //Meijie -- nebraska
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"nebraska.plist"];        
        CCSpriteBatchNode *spriteSheet18 = [CCSpriteBatchNode batchNodeWithFile:@"nebraska.png"];
        [self addChild:spriteSheet18];
        
        self.nebraska = [CCSprite spriteWithSpriteFrameName:@"nebraska.png"];
        _nebraska.position = ccp(s.width/1.2, s.height/6);
        _nebraska.scale = 0.4f;
        [spriteSheet18 addChild:_nebraska];
        _nebraska.visible=NO;
        
        //Meijie -- scissors
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"scissors.plist"];        
        CCSpriteBatchNode *spriteSheet19 = [CCSpriteBatchNode batchNodeWithFile:@"scissors.png"];
        [self addChild:spriteSheet19];
        
        self.scissors = [CCSprite spriteWithSpriteFrameName:@"scissors.png"];
        _scissors.position = ccp(s.width/2, s.height/6);
        _scissors.scale = 0.4f;
        [spriteSheet19 addChild:_scissors];
        _scissors.visible=NO;
        
        //Meijie -- spankrock
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"spankrock.plist"];        
        CCSpriteBatchNode *spriteSheet20 = [CCSpriteBatchNode batchNodeWithFile:@"spankrock.png"];
        [self addChild:spriteSheet20];
        
        self.spankrock = [CCSprite spriteWithSpriteFrameName:@"spankrock.png"];
        _spankrock.position = ccp(s.width/1.2, s.height/6);
        _spankrock.scale = 0.4f;
        [spriteSheet20 addChild:_spankrock];
        _spankrock.visible=NO;
        
        //Meijie -- vice
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"vice.plist"];        
        CCSpriteBatchNode *spriteSheet21 = [CCSpriteBatchNode batchNodeWithFile:@"vice.png"];
        [self addChild:spriteSheet21];
        
        self.vice = [CCSprite spriteWithSpriteFrameName:@"vice magazine.png"];
        _vice.position = ccp(s.width/1.2, s.height/6);
        _vice.scale = 0.4f;
        [spriteSheet21 addChild:_vice];
        _vice.visible=NO;
        
        /*******zhenlu -- lars animation initial things *****************/
        //zhenlu -- sprite sheet used for win and lose
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"losewin.plist"];        
        CCSpriteBatchNode *spriteSheet1 = [CCSpriteBatchNode batchNodeWithFile:@"losewin.png"];
        [self addChild:spriteSheet1];
        
        
        //zhenlu -- sprite sheet used for normal and dance
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"normaldance.plist"];        
        CCSpriteBatchNode *spriteSheet2 = [CCSpriteBatchNode batchNodeWithFile:@"normaldance.png"];
        [self addChild:spriteSheet2];
        
        //zhenlu -- sprite sheet used for normal and dance
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"singing.plist"];        
        CCSpriteBatchNode *spriteSheet3 = [CCSpriteBatchNode batchNodeWithFile:@"singing.png"];
        [self addChild:spriteSheet3];
        
        // zhenlu -- sprite used for win and lose
        self.larswinlose = [CCSprite spriteWithSpriteFrameName:@"winning 1.png"];
        _larswinlose.position = ccp(s.width/4.9, s.height/3.6);
        _larswinlose.scale = 0.80;
        [spriteSheet1 addChild:_larswinlose];
        _larswinlose.visible=NO;
        
        // zhenlu -- sprite used for normal and dance
        self.larsnormaldance = [CCSprite spriteWithSpriteFrameName:@"dance 1.png"];
        _larsnormaldance.position = ccp(s.width/4.9, s.height/3.6);
        _larsnormaldance.scale = 0.95;
        [spriteSheet2 addChild:_larsnormaldance];
        _larsnormaldance.visible = YES;
        
        // zhenlu -- sprite used for sing
        self.larsSing = [CCSprite spriteWithSpriteFrameName:@"normal 1.png"];
        //_larsSing.position = ccp(s.width/4.9, s.height/3.6);
        [spriteSheet3 addChild:_larsSing];
        _larsSing.visible = NO;
    
        // zhenlu -- sprite used for normal and dance
        danceFrames = [[NSMutableArray array] autorelease];
        for(int i = 1; i <= 12; ++i) {
            [danceFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"dance %d.png", i]]];
        }
        [danceFrames retain];
        // self.lars = [CCSprite spriteWithSpriteFrameName:@"dance 1.png"];
        _larsnormaldance.position = ccp(s.width/2 + 25, s.height/4);
        CCAnimation *walkAnim = [CCAnimation animationWithFrames:danceFrames delay:0.3f];
        self.danceAction = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:walkAnim restoreOriginalFrame:NO]];
        _larsnormaldance.visible = YES;
        _larswinlose.visible = NO;
        _larsSing.visible = NO;
        [_larsnormaldance runAction:_danceAction];        
        
        /* mr raven animation - zhenlu */
        if([[animationTagArray objectAtIndex:0] isEqualToString: @"401"]){
            NSLog(@"init bg");
            background.visible = NO;
            [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"poebg.plist"];        
            CCSpriteBatchNode *spriteSheet24 = [CCSpriteBatchNode batchNodeWithFile:@"poebg.png"];
            [self addChild:spriteSheet24];
            
            self.mrRavenBg = [CCSprite spriteWithSpriteFrameName:@"poe background 1.png"];
            _mrRavenBg.position = ccp(240, 160);
            _mrRavenBg.scale = 1.0f;
            [spriteSheet24 addChild:_mrRavenBg];
            mrRavenBgFrames = [[NSMutableArray array] autorelease];
            for(int i = 1; i <= 3; i++) {
                [mrRavenBgFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"poe background %d.png", i]]];
            }
            [mrRavenBgFrames retain];
            CCAnimation *mrRavenBgAnim = [CCAnimation animationWithFrames:mrRavenBgFrames delay:0.25f];
            id a41 = [CCAnimate actionWithAnimation:mrRavenBgAnim restoreOriginalFrame:NO];
            CCRepeatForever* repeat40 = [CCRepeatForever actionWithAction:a41];
            _mrRavenBg.visible = YES;
            [_mrRavenBg runAction:repeat40]; 

            // dancing rapping background
            [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"poedancerapping.plist"];        
            CCSpriteBatchNode *spriteSheet43 = [CCSpriteBatchNode batchNodeWithFile:@"poedancerapping.png"];
            [self addChild:spriteSheet43];
            
            self.mrRavenDancingRapping = [CCSprite spriteWithSpriteFrameName:@"dance 1 rappingPoe.png"];
            _mrRavenDancingRapping.position = ccp(s.width/2 + 25, s.height/4);
            _mrRavenDancingRapping.scale = 0.9f;
            [spriteSheet43 addChild:_mrRavenDancingRapping];
            mrRavenDancingRappingFrames = [[NSMutableArray array] autorelease];
            for(int i = 1; i <= 12; i++) {
                [mrRavenDancingRappingFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"dance %d rappingPoe.png", i]]];
            }
            [mrRavenDancingRappingFrames retain];
            CCAnimation *mrRavenDancingRappingAnim = [CCAnimation animationWithFrames:mrRavenDancingRappingFrames delay:0.25f];
            id a43 = [CCAnimate actionWithAnimation:mrRavenDancingRappingAnim restoreOriginalFrame:NO];
            CCRepeatForever* repeat41 = [CCRepeatForever actionWithAction:a43];
            _mrRavenDancingRapping.visible = NO;
            [_mrRavenDancingRapping runAction:repeat41];
            NSLog(@"init dangcing rapping");
            // chorus background
            [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"poedanceclosedmouth.plist"];        
            CCSpriteBatchNode *spriteSheet44 = [CCSpriteBatchNode batchNodeWithFile:@"poedanceclosedmouth.png"];
            [self addChild:spriteSheet44];
            
            self.mrRavenChorus = [CCSprite spriteWithSpriteFrameName:@"dancePoe 1 closed mouth.png"];
            _mrRavenChorus.position = ccp(s.width/2, s.height/3.4);
            _mrRavenChorus.scale = 0.9f;
            [spriteSheet44 addChild:_mrRavenChorus];
            mrRavenChorusFrames = [[NSMutableArray array] autorelease];
            for(int i = 1; i <= 12; i++) {
                [mrRavenChorusFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"dancePoe %d closed mouth.png", i]]];
            }
            [mrRavenChorusFrames retain];
            CCAnimation *mrRavenChorusAnim = [CCAnimation animationWithFrames:mrRavenChorusFrames delay:0.25f];
            id a44 = [CCAnimate actionWithAnimation:mrRavenChorusAnim restoreOriginalFrame:NO];
            CCRepeatForever* repeat42 = [CCRepeatForever actionWithAction:a44];
            _mrRavenChorus.visible = YES;
            [_mrRavenChorus runAction:repeat42];
            NSLog(@"init chrus");
            // winning - mr raven
            [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"poewinning.plist"];        
            CCSpriteBatchNode *spriteSheet45 = [CCSpriteBatchNode batchNodeWithFile:@"poewinning.png"];
            [self addChild:spriteSheet45];
            
            self.mrRavenWinning = [CCSprite spriteWithSpriteFrameName:@"winningPoe 1.png"];
            _mrRavenWinning.position = ccp(s.width/4.5, s.height/3.4);
            _mrRavenWinning.scale = 0.9f;
            [spriteSheet45 addChild:_mrRavenWinning];
            
            mrRavenWinningFrames = [[NSMutableArray array] autorelease];
            for(int i = 1; i <= 10; i++) {
                [mrRavenWinningFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"winningPoe %d.png", i]]];
            }
            [mrRavenWinningFrames retain];
            CCAnimation *mrRavenWinningAnim = [CCAnimation animationWithFrames:mrRavenWinningFrames delay:0.4f];
            id a45 = [CCAnimate actionWithAnimation:mrRavenWinningAnim restoreOriginalFrame:NO];
            CCRepeatForever* repeat44 = [CCRepeatForever actionWithAction:a45];
            [_mrRavenWinning runAction:repeat44]; 
            _mrRavenWinning.visible = NO;
            
            NSLog(@"init win");
            // losing - mr raven
            [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"poelosing.plist"];        
            CCSpriteBatchNode *spriteSheet46 = [CCSpriteBatchNode batchNodeWithFile:@"poelosing.png"];
            [self addChild:spriteSheet46];
            
            self.mrRavenLosing = [CCSprite spriteWithSpriteFrameName:@"losingPoe 1.png"];
            _mrRavenLosing.position = ccp(s.width/4.5, s.height/3.4);
            _mrRavenLosing.scale = 0.9f;
            [spriteSheet46 addChild:_mrRavenLosing];
            
            mrRavenLosingFrames = [[NSMutableArray array] autorelease];
            for(int i = 1; i <= 10; i++) {
                [mrRavenLosingFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"losingPoe %d.png", i]]];
            }
            [mrRavenLosingFrames retain];
            CCAnimation *mrRavenLosingAnim = [CCAnimation animationWithFrames:mrRavenLosingFrames delay:0.4f];
            id a1 = [CCAnimate actionWithAnimation:mrRavenLosingAnim restoreOriginalFrame:NO];
            CCRepeatForever* repeat43 = [CCRepeatForever actionWithAction:a1];
            [_mrRavenLosing runAction:repeat43]; 
            _mrRavenLosing.visible = NO;
            
            NSLog(@"init lose");
            //won --mr raven
            [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"poewon.plist"];        
            CCSpriteBatchNode *spriteSheet47 = [CCSpriteBatchNode batchNodeWithFile:@"poewon.png"];
            [self addChild:spriteSheet47];
            
            self.mrRavenwon = [CCSprite spriteWithSpriteFrameName:@"wonPoe 1.png"];
            _mrRavenwon.position = ccp(s.width/2, s.height/3.4);
            _mrRavenwon.scale = 1.0f;
            [spriteSheet47 addChild:_mrRavenwon];
            mrRavenwonFrames = [[NSMutableArray array] autorelease];
            for(int i = 1; i <= 3; i++) {
                [mrRavenwonFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"wonPoe %d.png", i]]];
            }
            [mrRavenwonFrames retain];
            CCAnimation *mrRavenwonAnim = [CCAnimation animationWithFrames:mrRavenwonFrames delay:0.25f];
            id a47 = [CCAnimate actionWithAnimation:mrRavenwonAnim restoreOriginalFrame:NO];
            CCRepeatForever* repeat47 = [CCRepeatForever actionWithAction:a47];
            _mrRavenwon.visible = NO;
            [_mrRavenwon runAction:repeat47]; 
            NSLog(@"init won");
            
            
            //lost -- mr raven
            [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"poelost.plist"];        
            CCSpriteBatchNode *spriteSheet48 = [CCSpriteBatchNode batchNodeWithFile:@"poelost.png"];
            [self addChild:spriteSheet48];
            
            self.mrRavenLost = [CCSprite spriteWithSpriteFrameName:@"lostPoe 1.png"];
            _mrRavenLost.position = ccp(s.width/2, s.height/3.4);
            _mrRavenLost.scale = 1.0f;
            [spriteSheet48 addChild:_mrRavenLost];
            mrRavenLostFrames = [[NSMutableArray array] autorelease];
            for(int i = 1; i <= 2; i++) {
                [mrRavenLostFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"lostPoe %d.png", i]]];
            }
            [mrRavenLostFrames retain];
            CCAnimation *mrRavenLostAnim = [CCAnimation animationWithFrames:mrRavenLostFrames delay:0.25f];
            id a48 = [CCAnimate actionWithAnimation:mrRavenLostAnim restoreOriginalFrame:NO];
            CCRepeatForever* repeat48 = [CCRepeatForever actionWithAction:a48];
            _mrRavenLost.visible = NO;
            [_mrRavenLost runAction:repeat48]; 
            
            NSLog(@"init lost");
            //normal -- mr raven
            [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"poenormal.plist"];        
            CCSpriteBatchNode *spriteSheet49 = [CCSpriteBatchNode batchNodeWithFile:@"poenormal.png"];
            [self addChild:spriteSheet49];
            
            self.mrRavenNormal = [CCSprite spriteWithSpriteFrameName:@"normalPoe 1.png"];
            _mrRavenNormal.position = ccp(s.width/4.5, s.height/3.4);
            _mrRavenNormal.scale = 0.9f;
            [spriteSheet49 addChild:_mrRavenNormal];
            mrRavenNormalFrames = [[NSMutableArray array] autorelease];
            for(int i = 1; i <= 10; i++) {
                [mrRavenNormalFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"normalPoe %d.png", i]]];
            }
            [mrRavenNormalFrames retain];
            CCAnimation *mrRavenNormalAnim = [CCAnimation animationWithFrames:mrRavenNormalFrames delay:0.25f];
            id a49 = [CCAnimate actionWithAnimation:mrRavenNormalAnim restoreOriginalFrame:NO];
            CCRepeatForever* repeat49 = [CCRepeatForever actionWithAction:a49];
            _mrRavenNormal.visible = NO;
            [_mrRavenNormal runAction:repeat49]; 
            NSLog(@"init normal");
    
        }
        
        /* ahab Background animation - Meijie Wang */
        else if([[animationTagArray objectAtIndex:1] isEqualToString: @"301"]){
            [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"moby background.plist"];        
            CCSpriteBatchNode *spriteSheet32 = [CCSpriteBatchNode batchNodeWithFile:@"moby background.png"];
            [self addChild:spriteSheet32];
            
            self.mobybackground = [CCSprite spriteWithSpriteFrameName:@"moby background 1.png"];
            _mobybackground.position = ccp(240, 160);
            _mobybackground.scale = 1.0f;
            [spriteSheet32 addChild:_mobybackground];
            mobyBackgroundFrames = [[NSMutableArray array] autorelease];
            for(int i = 1; i <= 6; i++) {
                [mobyBackgroundFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"moby background %d.png", i]]];
            }
            [mobyBackgroundFrames retain];
            CCAnimation *mobyBackgroundAnim = [CCAnimation animationWithFrames:mobyBackgroundFrames delay:0.25f];
            id a2 = [CCAnimate actionWithAnimation:mobyBackgroundAnim restoreOriginalFrame:NO];
            CCRepeatForever* repeat = [CCRepeatForever actionWithAction:a2];
            _mobybackground.visible = YES;
            [_mobybackground runAction:repeat]; 
            
            // singing background
            [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"normalAhab.plist"];        
            CCSpriteBatchNode *spriteSheet33 = [CCSpriteBatchNode batchNodeWithFile:@"normalAhab.png"];
            [self addChild:spriteSheet33];
            
            self.singingbackground = [CCSprite spriteWithSpriteFrameName:@"normalAhab 1.png"];
            _singingbackground.position = ccp(s.width/4.5, s.height/3.4);
            _singingbackground.scale = 0.9f;
            [spriteSheet33 addChild:_singingbackground];
            singingBackgroundFrames = [[NSMutableArray array] autorelease];
            for(int i = 1; i <= 10; i++) {
                [singingBackgroundFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"normalAhab %d.png", i]]];
            }
            [singingBackgroundFrames retain];
            CCAnimation *singingBackgroundAnim = [CCAnimation animationWithFrames:singingBackgroundFrames delay:0.25f];
            id a3 = [CCAnimate actionWithAnimation:singingBackgroundAnim restoreOriginalFrame:NO];
            CCRepeatForever* repeat1 = [CCRepeatForever actionWithAction:a3];
            _singingbackground.visible = NO;
            [_singingbackground runAction:repeat1];
            
            // chorus background
            [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"dancingAhab.plist"];        
            CCSpriteBatchNode *spriteSheet34 = [CCSpriteBatchNode batchNodeWithFile:@"dancingAhab.png"];
            [self addChild:spriteSheet34];
            
            self.chorusbackground = [CCSprite spriteWithSpriteFrameName:@"dancingAhab 1.png"];
            _chorusbackground.position = ccp(s.width/2, s.height/3.4);
            _chorusbackground.scale = 0.9f;
            [spriteSheet34 addChild:_chorusbackground];
            chorusBackgroundFrames = [[NSMutableArray array] autorelease];
            for(int i = 1; i <= 12; i++) {
                [chorusBackgroundFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"dancingAhab %d.png", i]]];
            }
            [chorusBackgroundFrames retain];
            CCAnimation *chorusBackgroundAnim = [CCAnimation animationWithFrames:chorusBackgroundFrames delay:0.25f];
            id a4 = [CCAnimate actionWithAnimation:chorusBackgroundAnim restoreOriginalFrame:NO];
            CCRepeatForever* repeat2 = [CCRepeatForever actionWithAction:a4];
            _chorusbackground.visible = YES;
            [_chorusbackground runAction:repeat2];
            
            // chorus open mouth background
            [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"dance rapping.plist"];        
            CCSpriteBatchNode *spriteSheet37 = [CCSpriteBatchNode batchNodeWithFile:@"dance rapping.png"];
            [self addChild:spriteSheet37];
            
            self.chorusOpenMouthbackground = [CCSprite spriteWithSpriteFrameName:@"dance rapping 1.png"];
            _chorusOpenMouthbackground.position = ccp(s.width/2, s.height/3.4);
            _chorusOpenMouthbackground.scale = 0.9f;
            [spriteSheet37 addChild:_chorusOpenMouthbackground];
            chorusOpenMouthBackgroundFrames = [[NSMutableArray array] autorelease];
            for(int i = 1; i <= 12; i++) {
                [chorusOpenMouthBackgroundFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"dance rapping %d.png", i]]];
            }
            [chorusOpenMouthBackgroundFrames retain];
            CCAnimation *chorusOpenMouthBackgroundAnim = [CCAnimation animationWithFrames:chorusOpenMouthBackgroundFrames delay:0.25f];
            id a6 = [CCAnimate actionWithAnimation:chorusOpenMouthBackgroundAnim restoreOriginalFrame:NO];
            CCRepeatForever* repeat6 = [CCRepeatForever actionWithAction:a6];
            _chorusOpenMouthbackground.visible = NO;
            [_chorusOpenMouthbackground runAction:repeat6];
            
            // winning - ahab
            [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"winningAhab.plist"];        
            CCSpriteBatchNode *spriteSheet35 = [CCSpriteBatchNode batchNodeWithFile:@"winningAhab.png"];
            [self addChild:spriteSheet35];
            
            self.winningbackground = [CCSprite spriteWithSpriteFrameName:@"winningAhab 1.png"];
            _winningbackground.position = ccp(s.width/4.5, s.height/3.4);
            _winningbackground.scale = 0.9f;
            [spriteSheet35 addChild:_winningbackground];
            winningBackgroundFrames = [[NSMutableArray array] autorelease];
            for(int i = 1; i <= 10; i++) {
                [winningBackgroundFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"winningAhab %d.png", i]]];
            }
            [winningBackgroundFrames retain];
            CCAnimation *winningBackgroundAnim = [CCAnimation animationWithFrames:winningBackgroundFrames delay:0.25f];
            id a5 = [CCAnimate actionWithAnimation:winningBackgroundAnim restoreOriginalFrame:NO];
            CCRepeatForever* repeat3 = [CCRepeatForever actionWithAction:a5];
            _winningbackground.visible = NO;
            [_winningbackground runAction:repeat3];            
            
            // losing - ahab
            [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"losingAhab.plist"];        
            CCSpriteBatchNode *spriteSheet26 = [CCSpriteBatchNode batchNodeWithFile:@"losingAhab.png"];
            [self addChild:spriteSheet26];
            
            self.losingbackground = [CCSprite spriteWithSpriteFrameName:@"losingAhab 1.png"];
            _losingbackground.position = ccp(s.width/4.5, s.height/3.4);
            _losingbackground.scale = 0.9f;
            [spriteSheet26 addChild:_losingbackground];
            
            losingBackgroundFrames = [[NSMutableArray array] autorelease];
            for(int i = 1; i <= 10; i++) {
                [losingBackgroundFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"losingAhab %d.png", i]]];
            }
            [losingBackgroundFrames retain];
            CCAnimation *losingAnimAhab = [CCAnimation animationWithFrames:losingBackgroundFrames delay:0.4f];
            id a1 = [CCAnimate actionWithAnimation:losingAnimAhab restoreOriginalFrame:NO];
            CCRepeatForever* repeat4 = [CCRepeatForever actionWithAction:a1];
            [_losingbackground runAction:repeat4]; 
            _losingbackground.visible = NO;
            
            // lost - ahab
            [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"lostAhab.plist"];        
            CCSpriteBatchNode *spriteSheet38 = [CCSpriteBatchNode batchNodeWithFile:@"lostAhab.png"];
            [self addChild:spriteSheet38];
            
            self.lostbackground = [CCSprite spriteWithSpriteFrameName:@"lostAhab 1.png"];
            _lostbackground.position = ccp(s.width/2, s.height/3.4);
            _lostbackground.scale = 0.9f;
            [spriteSheet38 addChild:_lostbackground];
            
            lostBackgroundFrames = [[NSMutableArray array] autorelease];
            for(int i = 1; i <= 2; i++) {
                [lostBackgroundFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"lostAhab %d.png", i]]];
            }
            [lostBackgroundFrames retain];
            CCAnimation *lostAnimAhab = [CCAnimation animationWithFrames:lostBackgroundFrames delay:0.4f];
            id a8 = [CCAnimate actionWithAnimation:lostAnimAhab restoreOriginalFrame:NO];
            CCRepeatForever* repeat8 = [CCRepeatForever actionWithAction:a8];
            [_lostbackground runAction:repeat8]; 
            _lostbackground.visible = NO;
            
            // won - ahab
            [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"wonAhab.plist"];        
            CCSpriteBatchNode *spriteSheet39 = [CCSpriteBatchNode batchNodeWithFile:@"wonAhab.png"];
            [self addChild:spriteSheet39];
            
            self.wonbackground = [CCSprite spriteWithSpriteFrameName:@"wonAhab 1.png"];
            _wonbackground.position = ccp(s.width/2, s.height/3.4);
            _wonbackground.scale = 0.9f;
            [spriteSheet39 addChild:_wonbackground];
            
            wonBackgroundFrames = [[NSMutableArray array] autorelease];
            for(int i = 1; i <= 3; i++) {
                [wonBackgroundFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"wonAhab %d.png", i]]];
            }
            [wonBackgroundFrames retain];
            CCAnimation *wonAnimAhab = [CCAnimation animationWithFrames:wonBackgroundFrames delay:0.4f];
            id a9 = [CCAnimate actionWithAnimation:wonAnimAhab restoreOriginalFrame:NO];
            CCRepeatForever* repeat9 = [CCRepeatForever actionWithAction:a9];
            [_wonbackground runAction:repeat9]; 
            _wonbackground.visible = NO;
        }
        
        //Initializing flow meter array
        flow_meter_array = [NSMutableArray array] ;   
        //we have 45 flow meter images.         
        NSString *name;
        
        for(int i = 0; i <= 44; ++i) {
            
            if(i<=8 )
                name= [NSString stringWithFormat:@"f0%d.png", i+1];
            
            
            else 
                name = [NSString stringWithFormat:@"f%d.png", i+1];
            
            CCSprite *sp = [CCSprite spriteWithFile:name];
            [flow_meter_array insertObject:sp atIndex:i];
            [self addChild: sp];
            sp.visible = NO;
            sp.scale = .4;
            sp.scaleY=0.55;
            sp.position = ccp(s.width-10,110);
            
            
        }
        
        [flow_meter_array retain];
        
        flow_location = 0;
        flow = (CCSprite*)[flow_meter_array objectAtIndex:flow_location];
        flow.scale = .4;
        flow.scaleY=0.55;
        flow.position = ccp(s.width-10,110);
        flow.visible = YES;

        /********************************************************/
        /*************Initialize bubbles*************************/
        
        bubble1 = [self createMenuItemLabel_Image:@"layer transparent.png" :@"layer transparent.png" :
                                            self : @selector(starButtonTapped:) :70: 185 :(s.width/imageSize.width) :
                   (s.height/imageSize.height) : @"" :@"Arial Black" :50.0f :
                   150 :150 :0: 0: 0];
        
        
        
        
        bubble2 = [self createMenuItemLabel_Image:@"layer transparent.png" :@"layer transparent.png" :
                                            self : @selector(starButtonTapped:) :70 : 110 :(s.width/imageSize.width) :
                   (s.height/imageSize.height): @"" :@"Arial Black" :50.0f :
                   150 :150 :0: 0: 0];
        
        
        
        
        bubble3 = [self createMenuItemLabel_Image:@"layer transparent.png" :@"layer transparent.png" :
                                            self : @selector(starButtonTapped:) :70: 35 :(s.width/imageSize.width):
                   (s.height/imageSize.height) : @"" :@"Arial Black" : 50.0f :
                   150 :150 :0: 0: 0 ];
        
                
        
        
        
        pause_button = [self createMenuItemLabel_Image:@"pause.png" :@"pause.png" :
                                                 self : @selector(pauseButtonpressed) :s.width-25: s.height-45 :(s.width/imageSize.width/3):
                        (s.height/imageSize.height/4) : @"" :@"Arial Black" : 50.0f :
                        150 :150 :0: 0: 0 ];
        play_button = [self createMenuItemLabel_Image:@"play.png" :@"play.png" :
                                                self : @selector(playButtonpressed) :s.width-25: s.height-45 :(s.width/imageSize.width/3):
                       (s.height/imageSize.height/4) : @"" :@"Arial Black" : 50.0f :
                       150 :150 :0: 0: 0 ];
        
        /********************************************************/
         
        [[CCDirector sharedDirector] setDisplayFPS:NO];
        
        blank = @"______";
        
        
        // lyrics labels
        rhyme_lyrics1 = [self createLabelwithDim:@"" :@"Arial Black": 18: 2: -25: 
                         0  : 0 :0: rhyme: 430: 350: 1:1];
        rhyme_lyrics2 = [self createLabelwithDim:@"" :@"Arial Black": 18: 2: -75: 
                         240: 0 :0: rhyme: 430: 350: 1:1];
        
        
        
        [self addChild:rhyme_lyrics1];
        [self addChild:rhyme_lyrics2];
        
        
        //Pause-Play menu
        play_button.visible = NO;//Must set this at the beginning so both buttons dont show up
        pause_play_menu = [CCMenu menuWithItems:pause_button,play_button,nil];
        pause_play_menu.position = CGPointZero;
        [self addChild:pause_play_menu];
        
        //Create the menu and adds the Bubbles to the menu
        starMenu = [CCMenu menuWithItems:bubble1,bubble2,bubble3,nil];
        starMenu.position = CGPointZero;
        [self addChild:starMenu];
        
        starMenu.isTouchEnabled=NO;//Sets the menu so it can be touchenabled for every rhyme-Leon
        //CCLOG(@"star menu touch enabled in the init");
        
        
        [self schedule:@selector(decrement:) interval:1];
        
        
        //xiaoyin--set the interval equals to (float)60/BPMs*BPLs
        [self schedule:@selector(tick1:) interval:(float)60/BPMs*BPLs];
        
	}
    
    
    self.isTouchEnabled = YES;
    CCLOG(@"self touch enabled in init");
    
    // add background sound and preload sound effect needed later - Meijie Wang
    [[SimpleAudioEngine sharedEngine] playBackgroundMusic:[NSString stringWithFormat:@"%@.mp3",songName]];
    [[SimpleAudioEngine sharedEngine] preloadEffect:@"Coin_Sound_Effect.mp3"];
    [[SimpleAudioEngine sharedEngine] preloadEffect:@"beep-sound-effect.wav"];
    
	return self;
}

/*zhenlu added*/
-(void) registerWithTouchDispatcher
{
	[[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];
}

-(BOOL) ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
	return YES;
}


/*zhenlu added*/

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
    self.larswinlose = nil;
    self.larsnormaldance = nil;
    self.danceAction = nil;
    self.wonAction = nil;
    self.lostAction = nil;
    self.normalAction = nil;
    //mr raven
    self.mrRavenBg = nil;
    self.mrRavenChorus = nil;
    self.mrRavenDancingRapping = nil;
    self.mrRavenWinning = nil;
    self.mrRavenLosing = nil;
    self.mrRavenwon = nil;
    self.mrRavenLost = nil;
    self.mrRavenNormal = nil;
    //igernation
    self.cat = nil;
    self.robot = nil;
    self.dancingRapping = nil;
    
    //meijie
    self.singingbackground = nil;
    self.chorusbackground = nil;
    self.chorusOpenMouthbackground = nil;
    self.mobybackground = nil;
    
    
    
//    
//    [parser release];
//    [marker_start release];
//    [marker_end release];
//    [marker_blank release];
//    [lyrics1 release];
//    [lyrics2 release];
//    [correctAnswer release];
//    [wrongAnswers release];
//    [level release];
//    [BPM release];
//    [BPL release];
//    [animationTag release];
//    [animationTagArray release];
//    [hipsgirlFrames release];
//    [dudesFrames release];
//    [glueFrames release];
//    [indieFrames release];
//    [jewelFrames release];
//    [kerenFrames release];
//    [nebraskaFrames release];
//    [scissorsFrames release];
//    [spankrockFrames release];
//    [viceFrames release];
//    [mobyBackgroundFrames release];
//    [singingBackgroundFrames release];
//    [chorusBackgroundFrames release];
//    [chorusOpenMouthBackgroundFrames release];
//    [wonBackgroundFrames  release];
//    [lostBackgroundFrames release];
//    [winningBackgroundFrames release];
//    [losingBackgroundFrames release];
//    [catFrames release];
//    [robotFrames release];
//    [dancingRappingFrames release];
//    [dancingBabyFrames release];
//    [mtvFrames release];
//    [bushFrames release];
//    [steveFrames release];
//    [imaginationFrames release];
//    [typingFrames release];
//    [flatmassFrames release];
//    [emoticonFrames release];
//    [danceFrames release];
//    [mrRavenBgFrames release];
//    [mrRavenChorusFrames release];
//    [mrRavenLosingFrames release];
//    [mrRavenWinningFrames release];
//    [mrRavenLostFrames release];
//    [mrRavenDancingRappingFrames release];
//    [mrRavenwonFrames release];
//    [mrRavenLostFrames release];
	[super dealloc];
}


@end
