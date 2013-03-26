//
//  MainScreen.m
//  FlowMaster
//
//  Created by student on 3/8/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "MainScreen.h"
#import "MainGamePlayScreen.h"
#import "Quickplayoptions.h"
#import "testScreen.h"
#import "globalVar.h"
#import "Help.h"
#import "AppDelegate.h"
#import "Facebook.h"
#import "StoryTelling.h"


//extern NSInteger countArray;


@implementation MainScreen

+(id) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	MainScreen *layer = [MainScreen node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

-(void) setUpMenus
{
	/*CCMenuItemImage *menuItem0 = [CCMenuItemImage itemFromNormalImage:@"MiniGameButton.png"
														selectedImage:@"MiniGameButton.png"
                                                               target:self
                                                             selector:@selector(miniGameButtonTapped:)];
	
	//[menuItem0 setScaleX:(0.5f)];
    //[menuItem0 setScaleY:(0.5f)];
	CCMenu *miniMenu = [CCMenu menuWithItems:menuItem0, nil];
	miniMenu.position = ccp(380,290);
	
	[self addChild:miniMenu];*/
    
    //-------------tarman-------------
    //-----menu with three buttons story, help and quickplay
	
    CCMenuItemImage *menuItem1=[CCMenuItemImage itemFromNormalImage:@"storymode_normal.png" 
                                                      selectedImage:@"storymode_clicked.png"
                                                             target:self
                                                           selector:@selector(storyButtonAction:)];
    [menuItem1 setScaleX:(0.4f)];
    [menuItem1 setScaleY:(0.4f)];
    menuItem1.position = ccp(0,0);
    
    CCMenuItemImage *menuItem2=[CCMenuItemImage itemFromNormalImage:@"quickplay_normal.png" 
                                                      selectedImage:@"quickplay_clicked.png"
                                                             target:self
                                                           selector:@selector(quick_playButtonAction:)];
    [menuItem2 setScaleX:(0.4f)];
    [menuItem2 setScaleY:(0.4f)];
    menuItem2.position = ccp(0,50);
    CCMenuItemImage *menuItem3=[CCMenuItemImage itemFromNormalImage:@"help_normal.png" 
                                                      selectedImage:@"help_clicked.png"
                                                             target:self
                                                           selector:@selector(helpButtonAction:)];
    [menuItem3 setScaleX:(0.4f)];
    [menuItem3 setScaleY:(0.4f)];
    menuItem1.position = ccp(0,100);
    
    
  
    CCMenu *startScreenMenu = [CCMenu menuWithItems: menuItem1, menuItem2, menuItem3, nil];
    startScreenMenu.position = ccp(80,100);
    //arrange the menu items vertically
    //  [startScreenMenu alignItemsVertically];
    //add the menu to your scene
    [self addChild:startScreenMenu];
    //end of the menu
    
    
    
    //---------tarman----------
	// amother menu for the three youtube, facebook and twitter icons
    CCMenuItemImage *menuItem4=[CCMenuItemImage itemFromNormalImage:@"youtube_icon.png" 
                                                      selectedImage:@"youtube_icon.png"
                                                             target:self
                                                           selector:@selector(youtubeAction:)];
    [menuItem4 setScaleX:(0.3f)];
    [menuItem4 setScaleY:(0.3f)];
	menuItem4.position = ccp(0,0);
    
    
    CCMenuItemImage *menuItem5=[CCMenuItemImage itemFromNormalImage:@"facebook_icon.png" 
                                                      selectedImage:@"facebook_icon.png"
                                                             target:self
                                                           selector:@selector(facebookAction:)];
    [menuItem5 setScaleX:(0.3f)];
    [menuItem5 setScaleY:(0.3f)];
    menuItem5.position = ccp(50,0);
    
//    CCMenuItemImage *menuItem6=[CCMenuItemImage itemFromNormalImage:@"Ticon.png" 
//                                                      selectedImage:@"myfirstbutton_selected.png"
//                                                             target:self
//                                                           selector:@selector(twitterAction:)];
//    [menuItem6 setScaleX:(0.3f)];
//    [menuItem6 setScaleY:(0.3f)];
//    menuItem6.position = ccp(100,0);
    
    
    
    //Create a menu and add your menu items to it
    CCMenu *startScreenMenuFT = [CCMenu menuWithItems: menuItem4, menuItem5,  nil];
    startScreenMenuFT.position = ccp(390,25);
  
    [self addChild:startScreenMenuFT];
}

- (id)init
{
    
        if( (self=[super init])) {
           
            //hide fps --added by sai
            [[CCDirector sharedDirector] setDisplayFPS:NO];
            
            
            //create a sprite for background and make it fit exactly to the size of the screen
            CCSprite* backGround = [CCSprite spriteWithFile:@"main screen layoutnew.png"];
            backGround.tag = 1;
            backGround.anchorPoint = CGPointMake(0, 0);
            [self addChild:backGround];
            CGSize s = [[CCDirector sharedDirector] winSize];
            CGSize imageSize = [backGround boundingBox].size;
            [backGround setScaleX:(s.width/imageSize.width)];
            [backGround setScaleY:(s.height/imageSize.height)];
            
          //-------tarman
            //code for head animation on the main screen
            CCSprite * sprite =[CCSprite spriteWithFile:@"mainScreenHead1.png"];
            [sprite setPosition:CGPointMake(360, 160)];
            [self addChild:sprite];
            CCAnimation *mainHead = [CCAnimation animation];
            
            [mainHead addFrameWithFilename:@"mainScreenHead2.png"];
            [mainHead addFrameWithFilename:@"mainScreenHead1.png"];
            
            CCAnimate * animation = [CCAnimate actionWithDuration:0.7f animation:mainHead restoreOriginalFrame:YES];
            CCRepeatForever *repeat = [CCRepeatForever actionWithAction:animation];
            [sprite runAction:repeat];

        
        [self setUpMenus];
        
    }
    
    NSSetUncaughtExceptionHandler(&uncaughtExceptionHandler);
    
    return self;
    
    
}

//-----Macy----link to mini game when the button is tapped
-(void)miniGameButtonTapped: (CCMenuItem *) menuItem
{
	[[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:0.5f scene:[testScreen scene]]];
}

//----Macy-----link to story mode when the button is tapped
-(void) storyButtonAction: (CCMenuItem *) menuItem
{
    NSLog(@"The story button was tapped");
    
    
    
    globalVar* sharedGameStateInstance = [globalVar sharedGameStateInstance];
    NSArray* songNameArray = [NSArray arrayWithObjects:@"iGeneration",@"HipsterGirl",@"Ahab",@"MrRaven",@"SpaceGame",@"ThisGiganticRobotKills",@"SigningEmo",@"TruePlayerForReal",nil];
    [sharedGameStateInstance storytell];
    [sharedGameStateInstance resetCountArray];
    [sharedGameStateInstance setSongArray:songNameArray];
    /* ------ */
    [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:0.5f scene:[StoryTelling scene]]];
    
    }

//----Macy-----link to quickplay mode when the button is tapped
-(void) quick_playButtonAction: (CCMenu *) menuItem
{
	[[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:0.5f scene:[Quickplayoptions scene]]];
}

//----Macy-----link to help page when the button is tapped
-(void) helpButtonAction: (CCMenuItem *) menuItem
{
    [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:0.5f scene:[Help scene]]];
}
-(void) youtubeAction: (CCMenuItem *) menuItem
{
    NSLog(@"The youtube action was called");
    
    //Leon- Opens the URL of Lars' website
    NSURL * url = [[NSURL alloc] initWithString:@"http://www.youtube.com/user/horrisrecords"];
	[[UIApplication sharedApplication] openURL:url];    
}


-(void) facebookAction: (CCMenuItem *) menuItem
{
    
    
    //http://developers.facebook.com/docs/mobile/ios/build/
    NSLog(@"The facebook action was called");
    
       //http://www.raywenderlich.com/1626/how-to-post-to-a-users-wall-upload-photos-and-add-a-like-button-from-your-iphone-app
    //Leon -Facebook app declaration
    facebook = [[Facebook alloc]  initWithAppId:@"371256862904820" andDelegate:self];
    
    /*
    NSArray *permissions =  [[NSArray arrayWithObjects:@"read_stream", @"publish_stream", @"offline_access",nil] retain];
    [facebook authorize:permissions];
    [facebook requestWithGraphPath:@"371256862904820/feed" andDelegate:self];
    */
    
    
   // NSString *picPath = [[NSBundle mainBundle] pathForResource:@"leon" ofType:@"png"];
    
    NSMutableString *facebookMessage = [NSMutableString stringWithString:@"I scored a whopping "];
    [facebookMessage appendString: [NSMutableString stringWithFormat:@"%d", 34]];
    [facebookMessage appendString: [NSMutableString stringWithString:@".  Can you beat me?"]];
    
    NSMutableDictionary* params = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                   @"371256862904820", @"app_id",
                                   @"http://mclars.com/site/", @"link",
                                   @"http://images2.mtv.com/uri/mgid:uma:artist:mtv.com:1242610?width=281&height=211", @"picture",
                                   @"FlowMaster", @"name",
                                   //@"Reference Documentation", @"caption",
                                   facebookMessage, @"description",
                                   facebookMessage,  @"message",
                                   nil];
    
    [facebook dialog:@"stream.publish" andParams:params andDelegate:self];
   
    
}


 // For iOS 4.2+ support -Leon 
 - (BOOL)application:(UIApplication *)application openURL:(NSURL *)url
 sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
 return [facebook handleOpenURL:url]; 
 }
 
 //Leon - In this method you will save the user's credentials specifically the access token and corresponding expiration date.
 - (void)fbDidLogin {
 NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
 [defaults setObject:[facebook accessToken] forKey:@"FBAccessTokenKey"];
 [defaults setObject:[facebook expirationDate] forKey:@"FBExpirationDateKey"];
 [defaults synchronize];
 
 }
 

-(void) twitterAction: (CCMenuItem *) menuItem
{
    NSLog(@"The twitter action was called");
}



- (void)dealloc
{
    CCLOG(@"dealloc: %@", self);
    [facebook release];
    [super dealloc];
}


@end
