//
//  SongParser.h
//  RachitXML
//
//  Created by student on 2/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
/* parse song xml files 
 * implemented by Meijie Wang, Xiaoyin, Rachit
 */

#import <Foundation/Foundation.h>

@interface SongParser : NSObject<NSXMLParserDelegate> {
    NSXMLParser *parser;                    // NSXML parser pointer
    NSMutableString		*current;           // current element name in the xml file
    NSDictionary    *attrvalue;             // current attrubute in the xml file
    NSMutableString	    *level;             // level - easy, median, hard
    NSMutableString	    *lyrics1;           // first line of lyrics
    NSMutableString	    *lyrics2;           // second line of lyrics
    NSMutableString	    *correctAnswer;     // correct answers
    NSMutableString	    *wrongAnswers;      // wrong answers
    NSMutableString	    *songlen;           // length of the song
    NSMutableString     *displayLoop;       // total loop of the song
    NSMutableString     *BPM;               // beat per minute
    NSMutableString     *BPL;               // beat per line
    NSMutableString     *animationTags;      // tags to indicate where to play special animation
}

- (NSMutableString *) getlevelValue;
- (NSMutableString *) getlyrics1Value;
- (NSMutableString *) getlyrics2Value;
- (NSMutableString *) getcorrectAnswerValue;
- (NSMutableString *) getwrongAnswersValue;
- (NSMutableString *) getsonglenValue;
- (NSMutableString *) getsongdisplayLoop;
- (NSMutableString *) getBPM;
- (NSMutableString *) getBPL;
- (NSMutableString *) getanimationTags;

- (void)chooseSong:(NSString *)songName;

@end
