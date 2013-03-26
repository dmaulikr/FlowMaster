//
//  Quickplayoptions.m
//  FlowMaster
//
//  Created by student on 3/15/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "Quickplayoptions.h"
#import "CCRadioMenu.h"
#import "QuickPlay.h"
#import "testQuick.h"
#import "SimpleAudioEngine.h"
#import "globalVar.h"


@implementation Quickplayoptions

CCSprite * logo;


+(id) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	Quickplayoptions *layer = [Quickplayoptions node];
	
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
		
        //create a sprite for background and make it fit exactly to the size of the screen
        
        CCSprite* backGround = [CCSprite spriteWithFile:@"quick play layoutnew.png"];
        backGround.tag = 1;
        backGround.anchorPoint = CGPointMake(0, 0);
        [self addChild:backGround];
        CGSize s = [[CCDirector sharedDirector] winSize];
        CGSize imageSize = [backGround boundingBox].size;
        [backGround setScaleX:(s.width/imageSize.width)];
        [backGround setScaleY:(s.height/imageSize.height)];
        
        // Create a label for display purposes
                
        // menu which contains easy, medijm and hard buttons
        CCMenuItem *easyMenuItem = [CCMenuItemImage itemFromNormalImage:@"EASYnew.png"
                                                          selectedImage:@"EASY_clickednew.png" 
                                                                 target:self selector:@selector(easyButtonTapped:)];
        [easyMenuItem setScaleX:(.4f)];
        [easyMenuItem setScaleY:(.4f)];
        easyMenuItem.position = ccp(0,0);
        
        
        CCMenuItem *mediumMenuItem = [CCMenuItemImage itemFromNormalImage:@"MEDIUMnew.png"
                                                            selectedImage:@"MEDIUM_clickednew.png" 
                                                                   target:self selector:@selector(mediumButtonTapped:)];
        
        [mediumMenuItem setScaleX:(.4f)];
        [mediumMenuItem setScaleY:(.4f)];
        mediumMenuItem.position = ccp(0,0);
        
        
        CCMenuItem *hardMenuItem = [CCMenuItemImage itemFromNormalImage:@"HARDnew.png"
                                                          selectedImage:@"HARD_clickednew.png" 
                                                                 target:self selector:@selector(hardButtonTapped:)];
        [hardMenuItem setScaleX:(.4f)];
        [hardMenuItem setScaleY:(.4f)];
        hardMenuItem.position = ccp(0,0);
        
        // the above menu is implemented as a radio menu so that user can select only one choice
        
        CCRadioMenu *radioMenu = [CCRadioMenu menuWithItems:easyMenuItem,mediumMenuItem,hardMenuItem, nil];
        radioMenu.position = ccp(200,150);
        [radioMenu alignItemsVerticallyWithPadding:20];
        //    radioMenu.selectedItem_ = mediumMenuItem;
        //    [mediumMenuItem selected];
        [self addChild:radioMenu];
        // Preload sound effect needed later - Meijie Wang
        [[SimpleAudioEngine sharedEngine] preloadEffect:@"clickSound.wav"];		        
    }
	return self;
}
- (void)easyButtonTapped:(id)sender {
    [[SimpleAudioEngine sharedEngine] playEffect:@"clickSound.wav"];      // play click sound - Meijie
    [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:0.5f scene:[QuickPlay scene]]];
  //   [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:0.5f scene:[testQuick scene]]];
    globalVar* sharedGameStateInstance = [globalVar sharedGameStateInstance]; // initialize difficulty level to easy
    [sharedGameStateInstance easy];
    
   
}
- (void)mediumButtonTapped:(id)sender {
    [[SimpleAudioEngine sharedEngine] playEffect:@"clickSound.wav"];      // play click sound - Meijie
    [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:0.5f scene:[QuickPlay scene]]];
   //  [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:0.5f scene:[testQuick scene]]];
    globalVar* sharedGameStateInstance = [globalVar sharedGameStateInstance];// initialize difficulty level to medium
    [sharedGameStateInstance medium];
    [sharedGameStateInstance difflevel];
}
- (void)hardButtonTapped:(id)sender {
    [[SimpleAudioEngine sharedEngine] playEffect:@"clickSound.wav"];      // play click sound - Meijie
    [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:0.5f scene:[QuickPlay scene]]];
 //[[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:0.5f scene:[testQuick scene]]];
    
    globalVar* sharedGameStateInstance = [globalVar sharedGameStateInstance]; // initialize difficulty level to hard
    [sharedGameStateInstance hard];
    [sharedGameStateInstance difflevel];
}



// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
    
}


@end
