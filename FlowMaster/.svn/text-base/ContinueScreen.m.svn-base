//
//  ContinueScreen.m
//  FlowMaster
//
//  Created by Meijie Wang on 3/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
//
//  MainScreen.m
//  FlowMaster
//
//  Created by student on 3/8/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//


#import "MainGamePlayScreen.h"
#import "Quickplayoptions.h"
#import "testScreen.h"
#import "globalVar.h"
#import "ContinueScreen.h"
#import "SimpleAudioEngine.h"
#import "StoryTelling.h"


//extern NSInteger countArray;


@implementation ContinueScreen

+(id) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	ContinueScreen *layer = [ContinueScreen node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

-(void) setUpMenus
{    //xiaoyin-- menu for the continue button
	CCMenuItemImage *menuItem0 = [CCMenuItemImage itemFromNormalImage:@"arrow.png"
														selectedImage:@"arrow.png"
                                                               target:self
                                                             selector:@selector(miniGameButtonTapped:)];
	    //Create a menu and add your menu items to it
    [menuItem0 setScaleX:(0.4f)];
    [menuItem0 setScaleY:(0.4f)];
    CCMenu *startScreenMenu = [CCMenu menuWithItems: menuItem0, nil];
    startScreenMenu.position = ccp(380,100);
    //arrange the menu items vertically
    //  [startScreenMenu alignItemsVertically];
    //add the menu to your scene
    [self addChild:startScreenMenu z:4];
    
    
	
}

- (id)init
{
    
    
    if( (self=[super init])) {
        //countArray = 0;
        [self setUpMenus];
        //adding the score label to the screen
        //added by sai
        //get the global shared instance to get the score variables
        globalVar* sharedGameStateInstance = [globalVar sharedGameStateInstance];
        
                
        CGPoint recordsStartPos=CGPointMake(10, 200);
        
        int recordsSpacing=90;
        int levelScore=[sharedGameStateInstance getLevelScore];
        
        int maxLevelScore=160;
        
        int step=maxLevelScore/4;
        
        //add a record even if the score is 0.
        CCSprite *rec1;
        rec1=[CCSprite spriteWithFile:@"white record.png"];
        [rec1 setAnchorPoint:ccp(0, 0)];
        [rec1 setScale:0.6];
        [rec1 setPosition:ccp(recordsStartPos.x, recordsStartPos.y)];
        [self addChild:rec1 z:3];
        
        NSMutableArray * tempNumbersArray = [[NSMutableArray alloc] init];
        int j;
        int i;
        for(i=1;i<=4;i++)
        {
            CCSprite *rec;
            CCLOG(@"level score is %i",levelScore);
            if(levelScore>=step)
            {
                rec=[CCSprite spriteWithFile:@"white record.png"];
                CCLOG(@"used full for %i",i);
                levelScore-=step;
                [tempNumbersArray addObject:rec];
                [rec release];
                rec=nil;
            }
            else if(levelScore>=step/2&&levelScore<step)
            {
                rec=[CCSprite spriteWithFile:@"other half white record.png"];
                CCLOG(@"used half for %i",i);
                levelScore-=step;
                [tempNumbersArray addObject:rec];
                [rec release];
                rec=nil;
            }
            else if(levelScore<step)
            {
                //rec=[CCSprite spriteWithSpriteFrameName:[NSString stringWithFormat:@"record %d transparent.png",j]];
                CCLOG(@"used none for %i",i);
                break;
            }
            
            
            
        }
        
        for(j=0;j<i-1;j++)
        {
            
            //[(CCSprite*)[tempNumbersArray objectAtIndex:i] setScale:0.25];
            [(CCSprite*)[tempNumbersArray objectAtIndex:j] setAnchorPoint:ccp(0, 0)];
            [(CCSprite*)[tempNumbersArray objectAtIndex:j] setScale:0.6];
            [(CCSprite*)[tempNumbersArray objectAtIndex:j] setPosition:ccp(recordsStartPos.x+(recordsSpacing*(j+1)), recordsStartPos.y)];
            [self addChild:[tempNumbersArray objectAtIndex:j] z:3];
            
        }
        
        CCLabelTTF *Score_lbl = [CCLabelTTF labelWithString: @"Score: " fontName:@"Arial Black" fontSize:20.0f];
        
        [Score_lbl setAnchorPoint:ccp(0, 0)];
        [Score_lbl setPosition:ccp(30, 120)];
        [self addChild:Score_lbl z:3];
        
        CCLabelTTF *mainScore_lbl = [CCLabelTTF labelWithString: @"Score" fontName:@"Arial Black" fontSize:30.0f];
        
        [mainScore_lbl  setString:[NSString stringWithFormat:@"%d",[sharedGameStateInstance getMainScore]]];
        [mainScore_lbl setAnchorPoint:ccp(0, 0)];
        [mainScore_lbl setPosition:ccp(35, 80)];
        [self addChild:mainScore_lbl z:3];
        
//        CCLabelTTF *levelScore_lbl = [CCLabelTTF labelWithString: @"Score: " fontName:@"Arial Black" fontSize:14.0f];
//        [levelScore_lbl  setString:[NSString stringWithFormat:@"Level Score is : %d",levelScore]];
//        [levelScore_lbl setAnchorPoint:ccp(0, 0)];
//        [levelScore_lbl setPosition:ccp(10, 90)];
//        [self addChild:levelScore_lbl z:3];
//        
//        CCLabelTTF *mileStones_lbl = [CCLabelTTF labelWithString: @"Score: " fontName:@"Arial Black" fontSize:14.0f];
//        [mileStones_lbl  setString:[NSString stringWithFormat:@"total Bonus is : %d",[sharedGameStateInstance getBonus]]];
//        [mileStones_lbl setAnchorPoint:ccp(0, 0)];
//        [mileStones_lbl setPosition:ccp(10, 60)];
//        [self addChild:mileStones_lbl z:3];
        
        
    }

    // Preload sound effect needed later - Meijie Wang
    [[SimpleAudioEngine sharedEngine] preloadEffect:@"clickSound.wav"];
    
    return self;
}

-(void)miniGameButtonTapped: (CCMenuItem *) menuItem
{   //xiaoyin--go to the mainGamePlayScreen scene when tapped 
    [[SimpleAudioEngine sharedEngine] playEffect:@"clickSound.wav"];      // play click sound - Meijie
	[[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:0.5f scene:[StoryTelling scene]]];
}


- (void)dealloc
{
    CCLOG(@"dealloc: %@", self);
    [super dealloc];
}


@end
