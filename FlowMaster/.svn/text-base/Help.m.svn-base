//
//  Help.m
//  FlowMaster
//
//  Created by student on 3/18/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "Help.h"
#import "MainScreen.h"
#import "SimpleAudioEngine.h"

@implementation Help
+(id) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	Help *layer = [Help node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
        
        
        winSize = [[CCDirector sharedDirector]   winSize];
        
        //--Macy--- set up help menu page
        
        // Create a label for display purposes
        //create both sprite to handle background
        background = [CCSprite spriteWithFile:@"helpBackground.png"];
       background2 = [CCSprite spriteWithFile:@"helpBackground.png"];
        
        //one the screen and second just next to it
        background.position = ccp(winSize.width/2, winSize.height/2);
      background2.position = ccp(winSize.width+160, winSize.height*2);
        
        //add schedule to move backgrounds
     [self schedule:@selector(scroll:)];
        
        //ofc add them to main layer
        [self addChild:background];
       [self addChild:background2];
        
        
        CCMenuItem *backMenu = [CCMenuItemImage itemFromNormalImage:@"back.png"
                                                      selectedImage:@"back.png" 
                                                             target:self selector:@selector(backButtonTapped:)];
        [backMenu setScaleX:(.2f)];
        [backMenu setScaleY:(.2f)];
        backMenu.position = ccp(300,0);
        
        CCMenu *nameMenu = [CCMenu menuWithItems:backMenu, nil];
        nameMenu.position = ccp(130,50);
        [self addChild:nameMenu];

        // Preload sound effect needed later - Meijie Wang
        [[SimpleAudioEngine sharedEngine] preloadEffect:@"clickSound.wav"];
    }
    return self;
}

- (void) scroll:(ccTime)dt{
    
	BOOL flg=FALSE;
    
	//reset position when they are off from view.
    if (background.position.y - background.contentSize.height/2 >= winSize.height ) {
        background.position = ccp(winSize.width/2, -winSize.height/2);
		background2.position = ccp(winSize.width/2, winSize.height/2);
		flg =TRUE;
    }
    
	if (background2.position.y - background2.contentSize.height/2>= winSize.height) {
        background2.position = ccp(winSize.width/2, -winSize.height/2);
		background.position = ccp(winSize.width/2, winSize.height/2);
		flg =TRUE;
    }
    
	if (!flg) {
		//move them 100*dt pixels to left
		background.position = ccp( background.position.x , background.position.y + 20*dt);
		background2.position = ccp( background2.position.x , background2.position.y + 20*dt);
	}
    
}

//--Macy--- go back to main menu when back button is tapped
- (void)backButtonTapped:(id)sender {
    //[_label setString:@"Last button: *"];
    [[SimpleAudioEngine sharedEngine] playEffect:@"clickSound.wav"];      // play click sound - Meijie
    [[CCDirector sharedDirector] replaceScene:[MainScreen scene]];
}

- (void) dealloc
{
	[super dealloc];
   // [_label release];
   // _label=nil;
}
@end
