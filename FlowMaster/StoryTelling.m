//
//  StoryTelling.m
//  FlowMaster
//
//  Created by student on 4/15/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "StoryTelling.h"
#include "MainGamePlayScreen.h"
#include "globalVar.h"
#import "MainScreen.h"
#import "Trivia.h"

CCSprite * _logo;
CCSprite * _title;

@implementation StoryTelling

+(id) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	StoryTelling *layer = [StoryTelling node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}


- (id)init
{

if( (self=[super init])) {
    
   globalVar* sharedGameStateInstance = [globalVar sharedGameStateInstance];
    counter = [sharedGameStateInstance getStoryCounter];
    if(counter==0){
        story=[NSMutableArray arrayWithObjects:@"02 cafe.png",@"03 cafe.png",@"04 cafe.png",@"05 cafe.png",@"06 cafe.png",@"07 cafe.png",@"08 cafe.png",@"09 cafe.png",@"10 cafe.png",nil];
        [story retain];
        i=0;
        length=[story count];
        CCSprite * sprite =[CCSprite spriteWithFile:@"01 cafe.png"];
        sprite.anchorPoint = CGPointMake(0, 0);
        [self addChild:sprite];
        CCAnimation *mainHead = [CCAnimation animation];
        
        [mainHead addFrameWithFilename:@"01 cafe.png"];
        
        CCAnimate * animation = [CCAnimate actionWithDuration:10.0f animation:mainHead restoreOriginalFrame:YES];
        CCRepeatForever *repeat = [CCRepeatForever actionWithAction:animation];
        [sprite runAction:repeat];
        
        CGSize s = [[CCDirector sharedDirector] winSize];
        CGSize imageSize = [sprite boundingBox].size;
        [sprite setScaleX:(s.width/imageSize.width)];
        [sprite setScaleY:(s.height/imageSize.height)];
        
		[[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self
														 priority:0
												  swallowsTouches:YES];
           

        
        
        
    }

    
    if(counter==1){
    
        
        story=[NSMutableArray arrayWithObjects:@"02 hipster.png",@"03 hipster.png",@"04 hipster.png",@"05 hipster.png",@"06 hipster.png",@"07 hipster.png",@"08 hipster.png",@"09 hipster.png",@"10 hipster.png",@"11 hipster.png",@"12 hipster.png",@"13 hipster.png",@"14 hipster.png",@"15 hipster.png",@"16 hipster.png",@"17 hipster.png",@"18 hipster.png",nil];
        [story retain];
        i=0;
        length=[story count ];
        CCSprite * sprite =[CCSprite spriteWithFile:@"01 hipster.png"];
        sprite.anchorPoint = CGPointMake(0, 0);
        [self addChild:sprite];
        CCAnimation *mainHead = [CCAnimation animation];
        
        [mainHead addFrameWithFilename:@"01 hipster.png"];
        
        CCAnimate * animation = [CCAnimate actionWithDuration:10.0f animation:mainHead restoreOriginalFrame:YES];
        CCRepeatForever *repeat = [CCRepeatForever actionWithAction:animation];
        [sprite runAction:repeat];
        
        CGSize s = [[CCDirector sharedDirector] winSize];
        CGSize imageSize = [sprite boundingBox].size;
        [sprite setScaleX:(s.width/imageSize.width)];
        [sprite setScaleY:(s.height/imageSize.height)];
        
		[[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self
														 priority:0
												  swallowsTouches:YES];
    
    }
    
    if(counter==2){
        
        
        story=[NSMutableArray arrayWithObjects:@"02 subway.png",@"03 subway.png",@"04 subway.png",@"05 subway.png",@"06 subway.png",@"07 subway.png",@"08 subway.png",@"09 subway.png",@"10 subway.png",@"11 subway.png",@"12 subway.png",@"13 subway.png",@"14 subway.png",@"15 subway.png",@"16 subway.png",@"17 subway.png",@"18 subway.png",@"19 subway.png",@"20 subway.png",@"21 subway.png",@"22 subway.png",@"23 subway.png",@"24 subway.png",nil];
        [story retain];
        i=0;
        length=[story count ];
        CCSprite * sprite =[CCSprite spriteWithFile:@"01 subway.png"];
        sprite.anchorPoint = CGPointMake(0, 0);
        [self addChild:sprite];
        CCAnimation *mainHead = [CCAnimation animation];
        
        [mainHead addFrameWithFilename:@"01 subway.png"];
        
        CCAnimate * animation = [CCAnimate actionWithDuration:10.0f animation:mainHead restoreOriginalFrame:YES];
        CCRepeatForever *repeat = [CCRepeatForever actionWithAction:animation];
        [sprite runAction:repeat];
        
        CGSize s = [[CCDirector sharedDirector] winSize];
        CGSize imageSize = [sprite boundingBox].size;
        [sprite setScaleX:(s.width/imageSize.width)];
        [sprite setScaleY:(s.height/imageSize.height)];
        
		[[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self
														 priority:0
												  swallowsTouches:YES];        
    }
    
    if(counter==3){
        
        [[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self
														 priority:0
												  swallowsTouches:YES];  

        
    }

    if(counter==4){
        story=[NSMutableArray arrayWithObjects:@"02 19th cent lit.png",@"03 19th cent lit.png",@"04 19th cent lit.png",@"05 19th cent lit.png",@"06 19th cent lit.png",@"07 19th cent lit.png",@"08 19th cent lit.png",@"09 19th cent lit.png",@"10 19th cent lit.png",@"11 19th cent lit.png",nil];
        [story retain];
        i=0;
        length=[story count];
        CCSprite * sprite =[CCSprite spriteWithFile:@"01 19th cent lit.png"];
        sprite.anchorPoint = CGPointMake(0, 0);
        [self addChild:sprite];
        CCAnimation *mainHead = [CCAnimation animation];
        
        [mainHead addFrameWithFilename:@"01 19th cent lit.png"];
        
        CCAnimate * animation = [CCAnimate actionWithDuration:10.0f animation:mainHead restoreOriginalFrame:YES];
        CCRepeatForever *repeat = [CCRepeatForever actionWithAction:animation];
        [sprite runAction:repeat];
        
        CGSize s = [[CCDirector sharedDirector] winSize];
        CGSize imageSize = [sprite boundingBox].size;
        [sprite setScaleX:(s.width/imageSize.width)];
        [sprite setScaleY:(s.height/imageSize.height)];
        
		[[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self
														 priority:0
												  swallowsTouches:YES];

        
    }

    if(counter==5){
        
        
        story=[NSMutableArray arrayWithObjects:nil];
        [story retain];
        i=0;
        length=[story count ];
        CCSprite * sprite =[CCSprite spriteWithFile:@"01 trivia.png"];
        sprite.anchorPoint = CGPointMake(0, 0);
        [self addChild:sprite];
        CCAnimation *mainHead = [CCAnimation animation];
        
        [mainHead addFrameWithFilename:@"01 trivia.png"];
        
        CCAnimate * animation = [CCAnimate actionWithDuration:10.0f animation:mainHead restoreOriginalFrame:YES];
        CCRepeatForever *repeat = [CCRepeatForever actionWithAction:animation];
        [sprite runAction:repeat];
        
        CGSize s = [[CCDirector sharedDirector] winSize];
        CGSize imageSize = [sprite boundingBox].size;
        [sprite setScaleX:(s.width/imageSize.width)];
        [sprite setScaleY:(s.height/imageSize.height)];
        
		[[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self
														 priority:0
												  swallowsTouches:YES];   
        
    }

    if(counter==6){
        
        story=[NSMutableArray arrayWithObjects:@"02 show.png",nil];
        [story retain];
        i=0;
        length=[story count ];
        CCSprite * sprite =[CCSprite spriteWithFile:@"01 show.png"];
        sprite.anchorPoint = CGPointMake(0, 0);
        [self addChild:sprite];
        CCAnimation *mainHead = [CCAnimation animation];
        
        [mainHead addFrameWithFilename:@"01 show.png"];
        
        CCAnimate * animation = [CCAnimate actionWithDuration:10.0f animation:mainHead restoreOriginalFrame:YES];
        CCRepeatForever *repeat = [CCRepeatForever actionWithAction:animation];
        [sprite runAction:repeat];
        
        CGSize s = [[CCDirector sharedDirector] winSize];
        CGSize imageSize = [sprite boundingBox].size;
        [sprite setScaleX:(s.width/imageSize.width)];
        [sprite setScaleY:(s.height/imageSize.height)];
        
		[[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self
														 priority:0
												  swallowsTouches:YES];   
        
    }

    if(counter==7){
        
        
        story=[NSMutableArray arrayWithObjects:@"02 mc.png",@"03 mc.png",@"04 mc.png",@"05 mc.png",@"06 mc.png",nil];
        [story retain];
        i=0;
        length=[story count ];
        CCSprite * sprite =[CCSprite spriteWithFile:@"01 mc.png"];
        sprite.anchorPoint = CGPointMake(0, 0);
        [self addChild:sprite];
        CCAnimation *mainHead = [CCAnimation animation];
        
        [mainHead addFrameWithFilename:@"01 mc.png"];
        
        CCAnimate * animation = [CCAnimate actionWithDuration:10.0f animation:mainHead restoreOriginalFrame:YES];
        CCRepeatForever *repeat = [CCRepeatForever actionWithAction:animation];
        [sprite runAction:repeat];
        
        CGSize s = [[CCDirector sharedDirector] winSize];
        CGSize imageSize = [sprite boundingBox].size;
        [sprite setScaleX:(s.width/imageSize.width)];
        [sprite setScaleY:(s.height/imageSize.height)];
        
		[[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self
														 priority:0
												  swallowsTouches:YES];
        
    }

    if(counter==8){
        
        
        CCSprite* backGround = [CCSprite spriteWithFile:@"black.png"];
        backGround.tag = 1;
        backGround.anchorPoint = CGPointMake(0, 0);
        [self addChild:backGround];
        CGSize s3 = [[CCDirector sharedDirector] winSize];
        CGSize imageSize3 = [backGround boundingBox].size;
        [backGround setScaleX:(s3.width/imageSize3.width)];
        [backGround setScaleY:(s3.height/imageSize3.height)];
        
        
        
        CCSprite * sprite =[CCSprite spriteWithFile:@"hands1.png"];
        sprite.anchorPoint = CGPointMake(0, 0);
        [self addChild:sprite];
        CCAnimation *mainHead = [CCAnimation animation];
        
        [mainHead addFrameWithFilename:@"hands2.png"];
        [mainHead addFrameWithFilename:@"hands3.png"];
        [mainHead addFrameWithFilename:@"hands5.png"];
        
        CCAnimate * animation = [CCAnimate actionWithDuration:1.0f animation:mainHead restoreOriginalFrame:YES];
        CCRepeatForever *repeat = [CCRepeatForever actionWithAction:animation];
        [sprite runAction:repeat];
        
        CGSize s = [[CCDirector sharedDirector] winSize];
        CGSize imageSize = [sprite boundingBox].size;
        [sprite setScaleX:(s.width/imageSize.width)];
        [sprite setScaleY:(s.height/imageSize.height)];
        
        
        
        CCSprite * character =[CCSprite spriteWithFile:@"lars 1.png"];
        //       character.anchorPoint = CGPointMake(0,0);
        [character setPosition:CGPointMake(220, 180)];
        [self addChild:character];
        CCAnimation *characterMain = [CCAnimation animation];
        
        [characterMain addFrameWithFilename:@"lars 2.png"];
        [characterMain addFrameWithFilename:@"lars 3.png"];
        [characterMain addFrameWithFilename:@"lars 4.png"];
        
        character.scaleY = .5;
        character.scaleX = .5;
        
        
        CCAnimate * animation1 = [CCAnimate actionWithDuration:1.0f animation:characterMain restoreOriginalFrame:YES];
        CCRepeatForever *repeat1 = [CCRepeatForever actionWithAction:animation1];
        [character runAction:repeat1];
        
        
		[[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self
														 priority:0
												  swallowsTouches:YES];
        
    }


        
}

return self;

}

-(BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event{
	return YES;
}

-(void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event{
    if(i==length)
        [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:0.5f scene:[MainGamePlayScreen scene]]];
    
    else {
    
    
    CCLOG(@"-----------------------------------------------------------i value is %d",i);
    CCSprite * sprite =[CCSprite spriteWithFile:@"01 cafe.png"];
    sprite.anchorPoint = CGPointMake(0, 0);
    [self addChild:sprite];
    CCAnimation *mainHead = [CCAnimation animation];
    
    [mainHead addFrameWithFilename:[story objectAtIndex:i]];
//    if(counter ==0){
//        
//        [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:0.5f scene:[Trivia scene]]];
//    }
//        
//        
//    else{
    
    CCAnimate * animation = [CCAnimate actionWithDuration:10.0f animation:mainHead restoreOriginalFrame:YES];
    CCRepeatForever *repeat = [CCRepeatForever actionWithAction:animation];
    [sprite runAction:repeat];
    
    CGSize s = [[CCDirector sharedDirector] winSize];
    CGSize imageSize = [sprite boundingBox].size;
    [sprite setScaleX:(s.width/imageSize.width)];
    [sprite setScaleY:(s.height/imageSize.height)];
        i++;

    }
}


@end
