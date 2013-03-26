//
//  QuickPlay.m
//  FlowMaster
//
//  Created by tarman
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "QuickPlay.h"
#import "MainScreen.h"
#import "MainGamePlayScreen.h"
#import "CCRadioMenu.h"
#import "globalVar.h"
#import "Help.h"
#import "AppDelegate.h"
#import "CCMenuItemLabelAndImage.h"
#import "SimpleAudioEngine.h"



CCSprite * logo;

//-----------tarman--------
//these variables are being used to implement the back and forth moment through the song list

NSInteger flag1=0;
NSInteger flag2=0;
NSInteger countArray ;
NSInteger beginArray = 0;
NSInteger endArray = 19;
@implementation QuickPlay

+(id) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	QuickPlay *layer = [QuickPlay node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}


// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
		
        //----------tarman--------------------
        //------setting up the arrays with song titles and bpm and album images
        
        _songTitle = [NSMutableArray arrayWithObjects:@"Where Ya Been Lars",@"Generic Crunk Rap",@"Twenty Three",@"The Metric System",@"True Player for Real",@"White Kids Aren't Hyphy",@"Lars Attacks",@"Space Game",@"Mr. Raven",@"Signing Emo",@"Gary the Green Nosed Reindeer",@"Ahab",@"iGeneration",@"Hurricane Fresh",@"Hipster Girl",@"35 Laurel Drive",@"Venomous Box",@"Rapgirl",@"Hey There Ophelia",@"This Gigantic Robot Kills", nil];
        [_songTitle retain];
        _songTitle1 = [NSMutableArray arrayWithObjects:@"WhereYaBeenLars",@"GenericCrunkRap",@"TwentyThree",@"theMetricSystem",@"TruePlayerforReal",@"WhiteKidsAren'tHyphy",@"LarsAttacks",@"SpaceGame",@"MrRaven",@"SigningEmo",@"GarytheGreen-NosedReindeer",@"Ahab",@"iGeneration",@"Hurricane Fresh",@"HipsterGirl",@"35LaurelDrive",@"VenomousBox",@"Rapgirl",@"HeyThereOphelia",@"ThisGiganticRobotKills", nil];
        [_songTitle1 retain];
        
        _songBpm =[NSMutableArray arrayWithObjects:@"72",@"74",@"88",@"91.55",@"100",@"100",@"105",@"108",@"109",@"110",@"110",@"112",@"120",@"122.16",@"128",@"130",@"140",@"143",@"150",@"151", nil];
        [_songBpm retain];
        
        _albumImg = [NSMutableArray arrayWithObjects:@"albumImg1.png", @"albumImg2.png", @"albumImg3.png", @"albumImg4.png", @"albumImg5.png", @"albumImg6.png", @"albumImg7.png", @"albumImg8.png", @"albumImg9.png", @"albumImg10.png", @"albumImg11.png", @"albumImg12.png", @"albumImg13.png", @"albumImg14.png", @"albumImg15.png", @"albumImg16.png", @"albumImg17.png", @"albumImg18.png", @"albumImg19.png", @"albumImg20.png", nil];
        [_albumImg retain];
        
        
        // menu which contains the forward an backward buttons
        
        CCMenuItem *back = [CCMenuItemImage itemFromNormalImage:@"leftarrow.png"
                                                  selectedImage:@"leftarrow.png" 
                                                         target:self selector:@selector(backButtonTapped:)];
        [back setScaleX:(1.0f)];
		[back setScaleY:(1.0f)];
        back.position = ccp(15,0);
        CCMenuItem *forward = [CCMenuItemImage itemFromNormalImage:@"rightarrow.png"
                                                     selectedImage:@"rightarrow.png" 
                                                            target:self selector:@selector(forwardButtonTapped:)];
        
        forward.position = ccp(400,0);
        
        [forward setScaleX:(1.0f)];
		[forward setScaleY:(1.0f)];
        
        
        
		
		
        CCMenu *songMenu = [CCMenu menuWithItems: forward,back, nil];
		songMenu.position = ccp(50,160);
		[self addChild:songMenu];
		
	//-----------End of menu--------	
		
        
        // This displays the first element of from each array(songTitle , songBpm, albuImg
        
        
        NSString *titleStr = [_songTitle objectAtIndex:countArray];
        _title =[[CCLabelTTF labelWithString:@"" fontName:@"Arial Black" fontSize:23.0] retain];
        _title.position = ccp(250,250);
        [_title setString: [NSString stringWithFormat:@"Title : %@",titleStr]];
        [self addChild:_title];
        
        
        
        NSString *bpmStr = [_songBpm objectAtIndex:countArray];
        
        
        _bpm =[[CCLabelTTF labelWithString:@"" fontName:@"Arial Black" fontSize:23.0] retain];
        _bpm.position = ccp(250,40);
        [_bpm setString: [NSString stringWithFormat:@"BPM : %@",bpmStr]];
        [self addChild:_bpm];
              
        CCMenuItemImage *albumImage = [CCMenuItemImage itemFromNormalImage:[_albumImg objectAtIndex:countArray] 
                                                              selectedImage:[_albumImg objectAtIndex:countArray] 
                                                              disabledImage:[_albumImg objectAtIndex:countArray] 
                                                                     target:self
                                                                   selector:@selector(albumImageClicked:)];
        
        
        CCMenu *imageMenu = [CCMenu menuWithItems: albumImage, nil];
		imageMenu.position = ccp(250,145);
		[self addChild:imageMenu];

        
        CCMenuItem *goBackMenu = [CCMenuItemImage itemFromNormalImage:@"back.png"
                                                        selectedImage:@"back.png" 
                                                               target:self selector:@selector(goBackButtonTapped:)];
        [goBackMenu setScaleX:(.2f)];
        [goBackMenu setScaleY:(.2f)];
        goBackMenu.position = ccp(50,0);
        
    
        
        CCMenu *nameMenu = [CCMenu menuWithItems:goBackMenu, nil];
        nameMenu.position = ccp(10,50);
        [self addChild:nameMenu];
        // Preload sound effect needed later - Meijie Wang
        [[SimpleAudioEngine sharedEngine] preloadEffect:@"clickSound.wav"];
    }
	return self;
}

//this funtions take the player back to the home page
- (void)goBackButtonTapped:(id)sender {
    [[SimpleAudioEngine sharedEngine] playEffect:@"clickSound.wav"];      // play click sound - Meijie
    [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:0.5f scene:[MainScreen scene]]];
    NSLog(@"Tapped back button");
}



//------------------tarman----------------------//
//this function implements forward movement throught the song list
//when the player clicks the next button the current title, bpm and image fades out and the next is displayed
//CCFadein and CCFadeout are used to implement this

- (void)forwardButtonTapped:(id)sender {
    [[SimpleAudioEngine sharedEngine] playEffect:@"clickSound.wav"];      // play click sound - Meijie
    
    if(countArray == 19 ){
        countArray = 0 ;
    }    
    
    else if (flag2 == 0){
        if (flag1 == 0){
            countArray = 1;
            flag1 = 1;
        }
        else{
            countArray = 0;
        }
        flag2=1;
    }
    else {
        countArray++;
    }
       
    CCFadeOut * title1 = [CCFadeOut actionWithDuration:0.00001];
    CCSequence * sequence1 = [CCSequence actions:title1, nil];
    
    
    CCFadeOut * bpm1 = [CCFadeOut actionWithDuration:0.00001];
    CCSequence * sequence2 = [CCSequence actions:bpm1, nil];
    
    
    [_title runAction: sequence2];
    [_bpm runAction: sequence1];

   
    
    NSString *titleStr = [_songTitle objectAtIndex:countArray];
    _title =[[CCLabelTTF labelWithString:@"" fontName:@"Arial Black" fontSize:23.0] retain];
    _title.position = ccp(250,250);
    [_title setString: [NSString stringWithFormat:@"Title : %@",titleStr]];
    [self addChild:_title];
    
    
    
    NSString *bpmStr = [_songBpm objectAtIndex:countArray];
    
    _bpm =[[CCLabelTTF labelWithString:@"" fontName:@"Arial Black" fontSize:23.0] retain];
    _bpm.position = ccp(250,40);
    [_bpm setString: [NSString stringWithFormat:@"BPM : %@",bpmStr]];
    [self addChild:_bpm];
    
    CCMenuItemImage *albumImage = [CCMenuItemImage itemFromNormalImage:[_albumImg objectAtIndex:countArray] 
                                                          selectedImage:[_albumImg objectAtIndex:countArray] 
                                                          disabledImage:[_albumImg objectAtIndex:countArray] 
                                                                 target:self
                                                               selector:@selector(albumImageClicked:)];
    
    
    CCMenu *imageMenu = [CCMenu menuWithItems: albumImage, nil];
    imageMenu.position = ccp(250,145);
    [self addChild:imageMenu];

    
    CCFadeIn *title2 = [CCFadeIn actionWithDuration:.00005];
    CCSequence * sequence3 = [CCSequence actions:title2, nil];
    
    CCFadeIn *bpm2 = [CCFadeIn actionWithDuration:.00005];
    CCSequence * sequence4 = [CCSequence actions:bpm2, nil];  
    
 
    
    [_title runAction: sequence3];
    [_bpm runAction: sequence4];
  
}
- (void) albumImageClicked:(id)sender {
    NSLog(@"The story button was tapped");
    globalVar* sharedGameStateInstance = [globalVar sharedGameStateInstance];
    NSArray* songNameArray = [NSArray arrayWithObjects:[_songTitle1 objectAtIndex:countArray],nil];
    [sharedGameStateInstance resetCountArray];
    [sharedGameStateInstance setSongArray:songNameArray];
    [[SimpleAudioEngine sharedEngine] playEffect:@"clickSound.wav"];      // play click sound - Meijie
    [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:0.5f scene:[MainGamePlayScreen scene]]];

}

// this functions implements the backward movement through the song list
// the code is analogous to the function forward buttontapped
- (void)backButtonTapped:(id)sender {
    [[SimpleAudioEngine sharedEngine] playEffect:@"clickSound.wav"];      // play click sound - Meijie
    
    if(countArray == 0 ){
        countArray =19 ;
    }    
    else if (flag2 == 0){
        countArray = 19;
        flag2=1;
    }
    else {
        countArray--;
    }
    
    
    
    CCFadeOut * title1 = [CCFadeOut actionWithDuration:0.00001];
    CCSequence * sequence1 = [CCSequence actions:title1, nil];
    
    
    CCFadeOut * bpm1 = [CCFadeOut actionWithDuration:0.00001];
    CCSequence * sequence2 = [CCSequence actions:bpm1, nil];
    
       
    [_title runAction: sequence2];
    [_bpm runAction: sequence1];

    
    NSString *titleStr = [_songTitle objectAtIndex:countArray];
    _title =[[CCLabelTTF labelWithString:@"" fontName:@"Arial Black" fontSize:23.0] retain];
    _title.position = ccp(250,250);
    [_title setString: [NSString stringWithFormat:@"Title : %@",titleStr]];
    [self addChild:_title];
    
    
    
    NSString *bpmStr = [_songBpm objectAtIndex:countArray];
    
    _bpm =[[CCLabelTTF labelWithString:@"" fontName:@"Arial Black" fontSize:23.0] retain];
    _bpm.position = ccp(250,40);
    [_bpm setString: [NSString stringWithFormat:@"BPM : %@",bpmStr]];
    [self addChild:_bpm];
    
    CCMenuItemImage *albumImage = [CCMenuItemImage itemFromNormalImage:[_albumImg objectAtIndex:countArray] 
                                                          selectedImage:[_albumImg objectAtIndex:countArray] 
                                                          disabledImage:[_albumImg objectAtIndex:countArray] 
                                                                 target:self
                                                               selector:@selector(albumImageClicked:)];
    
    
    CCMenu *imageMenu = [CCMenu menuWithItems: albumImage, nil];
    imageMenu.position = ccp(250,145);
    [self addChild:imageMenu];

        
    CCFadeIn *title2 = [CCFadeIn actionWithDuration:.00005];
    CCSequence * sequence3 = [CCSequence actions:title2, nil];
    
      
    
    CCFadeIn *bpm2 = [CCFadeIn actionWithDuration:.00005];
    CCSequence * sequence4 = [CCSequence actions:bpm2, nil];    
    [_title runAction: sequence3];
    [_bpm runAction: sequence4];
        
}





- (void)mediumButtonTapped:(id)sender {
    [_label setString:@"Last button: *"];
}
- (void)easyButtonTapped:(id)sender {
    [_label setString:@"Last button: *"];
}

- (void)newGameButtonTapped:(id)sender {
    [_label setString:@"Last button: *"];
}
- (void)resumeButtonTapped:(id)sender {
    [_label setString:@"Last button: *"];
}
- (void)homeButtonTapped:(id)sender {
    [_label setString:@"Last button: *"];
    [[SimpleAudioEngine sharedEngine] playEffect:@"clickSound.wav"];      // play click sound - Meijie
	[[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:0.5f scene:[MainScreen scene]]];
}


// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
    [super dealloc];
    _label=nil;
    _title=nil;
    _bpm=nil;
    albumPicture = nil;
}


@end
