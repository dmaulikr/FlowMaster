//
//  globalVar.m
//  FlowMaster
//
//  Created by Meijie Wang on 3/15/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.

/*  This file build a singleton class
 *  will only be initialized once in the whole program
 *  created by Meijie Wang
 */

#import "globalVar.h"


@implementation globalVar
static globalVar *sharedGameStateInstance = nil;

/* ensure that only it is initialized only once */
+ (globalVar*) sharedGameStateInstance {
    if (sharedGameStateInstance == nil) {
        sharedGameStateInstance = [[globalVar alloc] init];
        
        //set the mainscore to 0
        [sharedGameStateInstance setMainScore:0];
    }
    return sharedGameStateInstance;
}

/* update the index of song */
- (void) updateCountArray{
    countArray ++;
}

- (void) easy{
    difficulty=1;
}

- (void) medium{
    difficulty=2;
}

- (void) hard{
    difficulty=3;
}

- (void) storytell{
    storycounter=-1;
}

- (NSInteger) getStoryCounter{
    //NSLog(@"Difficulty: %d \n", difficulty);
    storycounter++;
    return storycounter;
}

/* print playlist */
- (NSInteger) difflevel{
    //NSLog(@"Difficulty: %d \n", difficulty);
    return difficulty;
}

/* reset the index of song */
- (void) resetCountArray{
    countArray = 0;
}

/* get the current index of song */
- (NSInteger) getCountArray{
    return countArray;
}

/* set the playlist array 
 @param inputSongArray Input NSArray which contains all the songs need to be played
 */
- (void) setSongArray : (NSArray *)inputSongArray{
    songArray = [[NSArray alloc] initWithArray:inputSongArray copyItems:YES];
}

/* get the song which need to be played now */
- (NSString*) getCurrentSong{
    return [songArray objectAtIndex:countArray];
}


/* print playlist */
- (void) printSongArray{
    NSLog(@"song array: %@ \n", songArray);
}

/* check if reach the end of the playlist */
- (BOOL) isReachEnd{
    if (countArray == [songArray count]) {
        return YES;
    }
    else {
        return NO;
    }
}

//adding access methods for score variables -- self explanatory code. added by sai
-(int) getMainScore{
    return mainscore;
}

-(void) setMainScore:(int)ms{
    mainscore=ms;
    
}

-(int) getLevelScore{
    return levelScore;
}

-(void) setLevelScore:(int)ls{
    levelScore=ls;
    
}

-(int) getBonus{
    return bonus;
}

-(void) setBonus:(int)b{
    bonus=b;
}

-(int) getMileStones{
    return mileStones;
}

-(void) setMileStones:(int)ms
{
    mileStones=ms;
}

//end adding methods for score variables

/* initialize the index and playlist array */
-init {
    if(self == [super init]) {
        countArray = 0;
        songArray = [[NSArray alloc] init];
    }
    return self;
}
@end
