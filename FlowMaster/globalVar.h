//
//  globalVar.h
//  FlowMaster
//
//  Created by Meijie Wang on 3/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

@interface globalVar : NSObject {
    NSInteger countArray;      // index in the playlist  
    NSArray *songArray;      // song playlist
     int mainscore,levelScore,bonus,mileStones;
    NSInteger storycounter; //counnter for story
    NSInteger difficulty;// check the difficulty clicked
    
}
+ (globalVar*) sharedGameStateInstance;
- (void) updateCountArray;
- (void) easy;
- (void) medium;
- (void) hard;
- (void) storytell;
- (NSInteger) getStoryCounter;
- (NSInteger) difflevel;
- (void) resetCountArray;
- (NSInteger) getCountArray;
- (void) setSongArray : (NSArray *)inputSongArray;
- (NSString*) getCurrentSong;
- (void) printSongArray;
- (BOOL) isReachEnd;
-(int) getMainScore;
-(int) getLevelScore;
-(int) getBonus;
-(int) getMileStones;
-(void) setMainScore:(int)ms;
-(void) setLevelScore:(int)ls;
-(void) setBonus:(int)b;
-(void) setMileStones:(int)ms;
@end
