//
//  SplashScreen.m
//  FlowMaster
//
//  Created by student on 3/8/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "SplashScreen.h"
#import "MainScreen.h"
#import "CCTouchDispatcher.h"

CCSprite * _logo;
CCSprite * _title;

@implementation SplashScreen

+(id) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	
    SplashScreen *layer = [SplashScreen node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	//-----------tarman---------
    //this screen has just tow spites displaying the logo and the background image
	if( (self=[super init])) {
		
        CCSprite* backGround = [CCSprite spriteWithFile:@"bg.png"];
        backGround.tag = 1;
        backGround.anchorPoint = CGPointMake(0, 0);
        [self addChild:backGround];
        CGSize s = [[CCDirector sharedDirector] winSize];
        CGSize imageSize = [backGround boundingBox].size;
        [backGround setScaleX:(s.width/imageSize.width)];
        [backGround setScaleY:(s.height/imageSize.height)];
        
        _logo = [CCSprite spriteWithFile:@"logo.png"];
        _logo.position=ccp(30,30);
        [_logo setScaleX:(.2f)];
        [_logo setScaleY:(.2f)];
        _title = [CCSprite spriteWithFile:@"title.png"];
        _title.position=ccp(240,300);
        [_title setScaleX:(.5f)];
        [_title setScaleY:(.5f)];
        [self addChild:_logo];
        [self addChild:_title];
		[[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self
														 priority:0
												  swallowsTouches:YES];
        
    }
	return self;
    
}

-(BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event{
	return YES;
}

-(void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event{
	[[CCDirector sharedDirector] replaceScene:[MainScreen scene]];
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
