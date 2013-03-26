//
//  Trivia.h
//  FlowMaster
//
//  Created by student on 3/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "CCMenuItemLabelAndImage.h"
#import "MainScreen.h"
#import "testScreen.h"


@interface Trivia : CCLayerColor{
    
    
    CCLabelTTF *question, *first_choice, *second_choice, *third_choice,
    *next_question, *response, *points;
    
    CCMenu *answer_menu;
    CCMenuItemLabel *first_option, *second_option, *third_option;
    CCMenuItemImage* next_button, *home_button;
    
    void* matchup;
    
    NSInteger question_number, current_points, point_interval;
    NSString *correct, *full_question, *trimmed, *all_answers,
                *link;
    
    NSMutableArray *questions, *answers, *url;
    BOOL answered;
    

}

// returns a CCScene 
+(CCScene *) scene;




@end
