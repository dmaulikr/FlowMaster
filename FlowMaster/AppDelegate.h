//
//  AppDelegate.h
//  FlowMaster
//
//  Created by Bada Kang on 3/5/12.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FBConnect.h"


@class RootViewController;

@interface AppDelegate : NSObject <UIApplicationDelegate>
            {
	UIWindow			*window;
	RootViewController	*viewController;
    //Facebook *facebook;
    
}

void uncaughtExceptionHandler(NSException *exception);


@property (nonatomic, retain) UIWindow *window;
@property (nonatomic, retain) IBOutlet RootViewController *rootViewController;
//@property (nonatomic, retain) Facebook *facebook;


@end
