
#import "MainScreen.h"
#import "CCTouchDispatcher.h"
#import "testQuick.h"
#import "CCMenuItemLabelAndImage.h"


CCSprite * _logo;
CCSprite * _title;

@implementation testQuick

+(id) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	
    testQuick *layer = [testQuick node];
	
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
		int i =0;
        _albumImg = [NSMutableArray arrayWithObjects:@"albumImg1.png", @"albumImg2.png", @"albumImg3.png", @"albumImg4.png", @"albumImg5.png", @"albumImg6.png", @"albumImg7.png", @"albumImg8.png", @"albumImg9.png", @"albumImg10.png", @"albumImg11.png", @"albumImg12.png", @"albumImg13.png", @"albumImg14.png", @"albumImg15.png", @"albumImg16.png", @"albumImg17.png", @"albumImg18.png", @"albumImg19.png", @"albumImg20.png", nil];
        [_albumImg retain];
       
        CCMenuItemImage *pauseButton = [CCMenuItemImage itemFromNormalImage:[_albumImg objectAtIndex:i] 
                                                              selectedImage:[_albumImg objectAtIndex:i+1] 
                                                              disabledImage:[_albumImg objectAtIndex:i+1] 
                                                                     target:self
                                                                   selector:@selector(pauseGame:)];
                
        
        CCMenu *songMenu = [CCMenu menuWithItems: pauseButton, nil];
		songMenu.position = ccp(50,160);
		[self addChild:songMenu];
    }
	return self;
}

- (void) pauseGame:(id)sender {
    NSLog(@"The story button was tapped");
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