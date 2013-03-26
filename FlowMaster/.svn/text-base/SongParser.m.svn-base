//
//  SongParser.m
//  RachitXML
//
//  Created by student on 2/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
/* parse song xml files 
 * implemented by Meijie Wang, Xiaoyin, Rachit
 */

#import "SongParser.h"

@implementation SongParser

/* initialization of all the parameters 
 */
-init {
    if(self == [super init]) {
        lyrics1 = [[NSMutableString alloc] init];
        lyrics2 = [[NSMutableString alloc] init];
        correctAnswer = [[NSMutableString alloc] init];
        wrongAnswers = [[NSMutableString alloc] init];
        level = [[NSMutableString alloc] init];
        songlen = [[NSMutableString alloc] init];
        displayLoop = [[NSMutableString alloc] init];
        BPM = [[NSMutableString alloc] init];
        BPL = [[NSMutableString alloc] init];
        animationTags = [[NSMutableString alloc] init];        
    }      
    return self;
}

/* select which xml to be parsed 
 * @param songName Name of xml file to be parsed 
 */
- (void)chooseSong:(NSString *)songName {
    
    NSString *song = [NSString stringWithFormat:@"%s", songName];
    [song retain];
  
    parser = [[NSXMLParser alloc]
              initWithContentsOfURL:[NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                            pathForResource:songName ofType: @"xml"]]];
    [parser setDelegate:self];
    [parser parse];
    [parser release];

}

/* return all the needed parameters 
 * level, lyrics, correct answer, wrong answer, length of song, etc
 */
- (NSMutableString *) getlevelValue{
    return level;
}

- (NSMutableString *) getlyrics1Value{
    return lyrics1;
}

- (NSMutableString *) getlyrics2Value{
    return lyrics2;
}

- (NSMutableString *) getcorrectAnswerValue{
    return correctAnswer;
}

- (NSMutableString *) getwrongAnswersValue{
    return wrongAnswers;
}

- (NSMutableString *) getsonglenValue{
    return songlen;
}

- (NSMutableString *) getsongdisplayLoop {
    return displayLoop;
}

- (NSMutableString *) getBPM {
    return BPM;
}

- (NSMutableString *) getBPL {
    return BPL;
}

- (NSMutableString *) getanimationTags{
    return animationTags;
}

/* parsing XML file using SAX 
 * with didStartElement, didEndElement, foundCharacters
 */
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
    if (qName) elementName = qName;
    if (elementName) current = [NSString stringWithString:elementName];
    if (attributeDict)    attrvalue=attributeDict;
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qName {
    
    if ([current isEqualToString:@"song"]){
        [songlen appendFormat:@"/"];
    }
    if ([current isEqualToString:@"part"]){
        [level appendFormat:@"/"];
    }
    if ([current isEqualToString:@"lyrics"])
    {
        // Add animation tag
        NSString *attributeValue1 = [attrvalue objectForKey:@"animationTag"];
        if (attributeValue1 == nil){
            [animationTags appendString:@"0"];
        }
        else{
            [animationTags appendFormat:@"%@", attributeValue1];
        }
        [animationTags appendString:@"/"];
        
        NSString *attributeValue = [attrvalue objectForKey:@"line"];
        if ([attributeValue isEqualToString:@"one"])  [lyrics1 appendFormat:@"/"];
        
        if ([attributeValue isEqualToString:@"two"])  [lyrics2 appendFormat:@"/"];
    }
    if ([current isEqualToString:@"answer"])
    {
        NSString *attributeValue = [attrvalue objectForKey:@"type"];
        if ([attributeValue isEqualToString:@"correct"])  [correctAnswer appendFormat:@"/"];
        if ([attributeValue isEqualToString:@"wrong"])  [wrongAnswers appendFormat:@"/"];
    }
	current = nil; 
    
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    
    if (!current) return;
    if ([current isEqualToString:@"song"]) {
        NSString *attributeValue1 = [attrvalue objectForKey:@"length"];
        [songlen appendFormat:@"%@", attributeValue1];
        NSString *attributeValue2 = [attrvalue objectForKey:@"BPM"];
        [BPM appendFormat:@"%@", attributeValue2];
        NSString *attributeValue3 = [attrvalue objectForKey:@"displayLoop"];
        [displayLoop appendFormat:@"%@", attributeValue3];
        NSString *attributeValue4 = [attrvalue objectForKey:@"BPL"];
        [BPL appendFormat:@"%@", attributeValue4];        
    }
    if ([current isEqualToString:@"part"]) {
        NSString *attributeValue = [attrvalue objectForKey:@"level"];
        [level appendFormat:@"%@/", attributeValue];
    }
    if ([current isEqualToString:@"lyrics"])
    {
        NSString *attributeValue = [attrvalue objectForKey:@"line"];
        if ([attributeValue isEqualToString:@"one"])  [lyrics1 appendFormat:@"%@", string];
        if ([attributeValue isEqualToString:@"two"])  [lyrics2 appendFormat:@"%@", string];
    }   
    if ([current isEqualToString:@"answer"])
    {
        NSString *attributeValue = [attrvalue objectForKey:@"type"];
        if ([attributeValue isEqualToString:@"correct"])  [correctAnswer appendFormat:@"%@", string];
        if ([attributeValue isEqualToString:@"wrong"])  [wrongAnswers appendFormat:@"%@", string];
    }  
}

-(void) parserDidEndDocument:(NSXMLParser *)parser {}
-(void) parserDidStartDocument:(NSXMLParser *)parser {}


@end
