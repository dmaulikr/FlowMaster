//
//  MainScreen.h
//  FlowMaster
//
//  Created by student on 3/8/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "AppDelegate.h"


extern NSInteger countArray;

@interface MainScreen : CCLayer<FBSessionDelegate>{
    
        
    //UIWindow			*window;
	//RootViewController	*viewController;
    Facebook *facebook;
    FBDialog *_loginDialog;
    NSInteger counter;
    //FBStreamDialog *dialog;
    
    
}


//@property (nonatomic, retain) UIWindow *window;
//@property (nonatomic, retain) IBOutlet RootViewController *rootViewController;
//@property (nonatomic, retain) Facebook *facebook;


+(id) scene;



@end
