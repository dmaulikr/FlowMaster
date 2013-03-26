//
//  testScreen.m
//  FlowMaster
//
//  Created by student on 3/8/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "testScreen.h"
#import "MainScreen.h"
#import "Trivia.h"


@implementation testScreen

+(id) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	testScreen *layer = [testScreen node];
	
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
        
        
        CGSize winSize = [[CCDirector sharedDirector] winSize];
        
        // Create a label for display purposes
        _label = [[CCLabelTTF labelWithString:@"Last button: None" 
                                   dimensions:CGSizeMake(320, 50) alignment:UITextAlignmentCenter 
                                     fontName:@"Arial" fontSize:32.0] retain];
        _label.position = ccp(winSize.width/2, 
                              winSize.height-(_label.contentSize.height/2));
        [self addChild:_label];
        
        
        //-------------------------tarman--------------------
        //--------this menu contains 9 buttons for each team member to incorporate their mini games
        
        CCMenuItem *badaMenu = [CCMenuItemImage itemFromNormalImage:@"bada.png"
                                                      selectedImage:@"bada1.png" 
                                                             target:self selector:@selector(badaButtonTapped:)];
        [badaMenu setScaleX:(.4f)];
        [badaMenu setScaleY:(.4f)];
        badaMenu.position = ccp(50,0);
        
        
        CCMenuItem *tarmanMenu = [CCMenuItemImage itemFromNormalImage:@"tarman.png"
                                                        selectedImage:@"tarman1.png" 
                                                               target:self selector:@selector(tarmanButtonTapped:)];
        
        [tarmanMenu setScaleX:(.4f)];
        [tarmanMenu setScaleY:(.4f)];
        tarmanMenu.position = ccp(50,50);
        
        
        CCMenuItem *macyMenu = [CCMenuItemImage itemFromNormalImage:@"macy.png"
                                                      selectedImage:@"macy1.png" 
                                                             target:self selector:@selector(macyButtonTapped:)];
        [macyMenu setScaleX:(.4f)];
        [macyMenu setScaleY:(.4f)];
        macyMenu.position = ccp(50,100);
        
        
        CCMenuItem *rachitMenu = [CCMenuItemImage itemFromNormalImage:@"rachit.png"
                                                        selectedImage:@"rachit1.png" 
                                                               target:self selector:@selector(rachitButtonTapped:)];
        [rachitMenu setScaleX:(.4f)];
        [rachitMenu setScaleY:(.4f)];
        rachitMenu.position = ccp(50,150);
        
        
        CCMenuItem *maggieMenu = [CCMenuItemImage itemFromNormalImage:@"maggie.png"
                                                        selectedImage:@"maggie1.png" 
                                                               target:self selector:@selector(maggieButtonTapped:)];
        
        [maggieMenu setScaleX:(.4f)];
        [maggieMenu setScaleY:(.4f)];
        maggieMenu.position = ccp(50,200);
        
        
        CCMenuItem *leonMenu = [CCMenuItemImage itemFromNormalImage:@"leon.png"
                                                      selectedImage:@"leon1.png" 
                                                             target:self selector:@selector(leonButtonTapped:)];
        [leonMenu setScaleX:(.4f)];
        [leonMenu setScaleY:(.4f)];
        leonMenu.position = ccp(300,50);
        
        CCMenuItem *backMenu = [CCMenuItemImage itemFromNormalImage:@"back.png"
                                                      selectedImage:@"back1.png" 
                                                             target:self selector:@selector(backButtonTapped:)];
        [backMenu setScaleX:(.2f)];
        [backMenu setScaleY:(.2f)];
        backMenu.position = ccp(300,0);
        
        CCMenuItem *saiMenu = [CCMenuItemImage itemFromNormalImage:@"sai.png"
                                                     selectedImage:@"sai1.png" 
                                                            target:self selector:@selector(saiButtonTapped:)];
        
        [saiMenu setScaleX:(.4f)];
        [saiMenu setScaleY:(.4f)];
        saiMenu.position = ccp(300,100);
        
        
        CCMenuItem *zhenluMenu = [CCMenuItemImage itemFromNormalImage:@"zhenlu.png"
                                                        selectedImage:@"zhenlu1.png" 
                                                               target:self selector:@selector(zhenluButtonTapped:)];
        [zhenluMenu setScaleX:(.4f)];
        [zhenluMenu setScaleY:(.4f)];
        zhenluMenu.position = ccp(300,150);
        
        
        CCMenuItem *xiaoMenu = [CCMenuItemImage itemFromNormalImage:@"xiaoyin.png"
                                                      selectedImage:@"xiaoyin1.png" 
                                                             target:self selector:@selector(xiaoButtonTapped:)];
        [xiaoMenu setScaleX:(.4f)];
        [xiaoMenu setScaleY:(.4f)];
        xiaoMenu.position = ccp(300,200);
        
        
        
        CCMenu *nameMenu = [CCMenu menuWithItems:badaMenu,tarmanMenu,macyMenu,leonMenu,rachitMenu,maggieMenu,xiaoMenu,zhenluMenu,saiMenu,backMenu, nil];
        nameMenu.position = ccp(50,50);
        [self addChild:nameMenu];
        
    }
    return self;
}

//--------------tarman-------------
//-----One of the following functions will be called depending upon the button user has clicked

- (void)badaButtonTapped:(id)sender {
    [_label setString:@"Last button: *"];
}
- (void)tarmanButtonTapped:(id)sender {
    [_label setString:@"Last button: *"];
}
- (void)macyButtonTapped:(id)sender {
    [_label setString:@"Last button: *"];
}

- (void)leonButtonTapped:(id)sender {
    
    
    NSLog(@"The story button was tapped");
    [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:0.5f
                                                                                 scene:[Trivia scene]]];
}
- (void)rachitButtonTapped:(id)sender {
    [_label setString:@"Last button: *"];
}
- (void)maggieButtonTapped:(id)sender {
    [_label setString:@"Last button: *"];
}
- (void)xiaoButtonTapped:(id)sender {
    [_label setString:@"Last button: *"];
}
- (void)backButtonTapped:(id)sender {
    [_label setString:@"Last button: *"];
    [[CCDirector sharedDirector] replaceScene:[MainScreen scene]];
}
- (void)zhenluButtonTapped:(id)sender {
    [_label setString:@"Last button: *"];
}
- (void)saiButtonTapped:(id)sender {
    [_label setString:@"Last button: *"];
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
    [_label release];
    _label=nil;
}

@end
