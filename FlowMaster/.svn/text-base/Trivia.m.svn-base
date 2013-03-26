//
//  Trivia.m
//  FlowMaster
//
//  Created by Leon Aburime on 3/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <stdio.h>
#import "Trivia.h"
#import "CocosDenshion.h"
#import "StoryTelling.h"


#define red 0
#define green 1
#define blue 2


@implementation Trivia

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	Trivia *layer = [Trivia node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}


-(CCLabelTTF*) createLabel: (NSString*)content: (NSString*)fontType:
(CGFloat) fontSize:
(CGFloat)x_Pos: (CGFloat)y_Pos: 
(CGFloat)r: (CGFloat)g :(CGFloat)b
{
    
    CCLabelTTF *newLabel = [CCLabelTTF labelWithString:content fontName:fontType fontSize:fontSize];
    [newLabel setColor:ccc3(r, g, b)];
    newLabel.position = ccp(x_Pos, y_Pos);
    
    
    return newLabel;
}

//Takes the input file 'filepath' to parse data from
-(void) parseFile: (NSString*) filepath{
    
    //Creates a filehandle object
    NSFileHandle *file = [NSFileHandle 
                          fileHandleForReadingAtPath: filepath];
    
    
    if (file == nil){
        NSLog(@"Failed to open file");
        exit(0);
    }
    
    //will hold all the data read from file
    NSData *databuffer = [file readDataToEndOfFile];
    [file closeFile];
    
    //Changed this...turns data into string 
    NSString* myString = [[NSString alloc] initWithData:databuffer encoding:NSASCIIStringEncoding];
    
    //Parses myString into two arrays question and answer
    NSArray *Q_As = [myString componentsSeparatedByString: @"Question:\\"];
    questions= [[NSMutableArray alloc] init];
    answers= [[NSMutableArray alloc] init];
    
    
    
    NSArray *each;
    NSString* each_question;
    const char* tt;
    NSUInteger numObjects = [Q_As count];
    
    //Goes through the whole string and parses
    //it into each question and answer segment
    for(NSUInteger i=1; i<numObjects; i++){
        
        tt = [  [Q_As objectAtIndex:i]  UTF8String] ;
        each_question = [NSString stringWithUTF8String:tt];
        
        each = [ each_question componentsSeparatedByString: @"Correct->"];
        [questions addObject:[each objectAtIndex:0]];
        [answers addObject:[each objectAtIndex:1]];
    }

}

-(CCLabelTTF*) createLabelwithDim:(NSString*)content: (NSString*)fontType:
(CGFloat) fontSize:
(CGFloat)x_Pos: (CGFloat)y_Pos: 
(CGFloat)r: (CGFloat)g :(CGFloat)b:(CCNode*) parent:
(CGFloat)dim_Width: (CGFloat)dim_Height:
(CGFloat)X_scale: (CGFloat)Y_scale
{
    //Here you can center the lyrics but it might not be fixed.
    //ALso you might have to adjust the width of the dimensions of the label because its too wide--->dim_Width
    CCLabelTTF *newLabel = [CCLabelTTF labelWithString:content dimensions:CGSizeMake(dim_Width, dim_Height) alignment:CCTextAlignmentLeft fontName:fontType fontSize:fontSize];
    newLabel.position = ccp(x_Pos, y_Pos);
    [newLabel setColor:ccc3(r, g, b)];
    
    [newLabel setScaleX: X_scale];
    [newLabel setScaleY: Y_scale];
    
    newLabel.anchorPoint = ccp(0,0);
    
    return newLabel;
}

//Function trims all the whitespace text
-(NSString*)strip: (NSString*) stripme {
    
   
    trimmed= [[stripme   stringByTrimmingCharactersInSet:  [NSCharacterSet whitespaceAndNewlineCharacterSet]]
              stringByReplacingOccurrencesOfString:@"\\" withString:@" "];
    
    trimmed = [trimmed stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    trimmed = [trimmed stringByReplacingOccurrencesOfString:@"}" withString:@""];
    //trimmed = [trimmed stringByReplacingOccurrencesOfString:@"/" withString:@""];
    
    return trimmed;
    
}

-(void) display_question:(id) sender {
    
    
    
    if(question_number >= [questions count] ){ 
        
        
        
        //return;
        
        [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:0.5f scene:[StoryTelling scene]]];
        
        return;

        
    }
    
    NSArray *temp;
    [response setString:@"" ];
    
    
    full_question = [questions objectAtIndex:question_number];
    all_answers =   [answers   objectAtIndex:question_number];
    
    //Splits string into choice A
    temp = [ all_answers componentsSeparatedByString: @"A."];
    correct = [self strip:[temp objectAtIndex:0]];
    [correct retain];
    
    all_answers = [temp objectAtIndex:1]; 
    
    //Splits string into choice B
    temp = [ all_answers componentsSeparatedByString: @"B."];
    //[answer1 setString:[self strip:[temp objectAtIndex:0]]];
    [third_option setString:[self strip:[temp objectAtIndex:0]]];
    all_answers = [temp objectAtIndex:1];
  
    //Splits string into choice C
    temp = [ all_answers componentsSeparatedByString: @"C."];
    //[answer2 setString:[self strip:[temp objectAtIndex:0]]];
    [second_option setString:[self strip:[temp objectAtIndex:0]]];
    all_answers = [temp objectAtIndex:1];
    
    
    
    temp = [ all_answers componentsSeparatedByString: @"Link-"];
    
    //Sets all the values of String
    [question setString:[self strip:full_question]];
    //[answer3 setString:[self strip:[temp objectAtIndex:0]]];
    [first_option setString:[self strip:[temp objectAtIndex:0]]];
    
    /*
    if([temp count] < 1){
        link = [[temp objectAtIndex:1]   stringByTrimmingCharactersInSet: 
            [NSCharacterSet whitespaceAndNewlineCharacterSet]];
        [url addObject: link];
    }
       
    else    
        [url addObject: @""];
    */ 
    question_number+=1;
    
    answered = FALSE;
    
}

//Leon - If the next button is tapped it takes you to 
//the next question
-(void) next_button_tapped:(id) sender{

    if(answered != TRUE)    
        [self performSelector:@selector(display_question:)];

}

- (void)starButtonTapped:(id)sender {
    
    answer_menu.isTouchEnabled = NO;
    answered = TRUE;
    
    
    //Strips the string of new lines and whitespaces
    NSString* tapped = ((CCLabelTTF*) [sender label]).string;
    correct = [self strip:correct];
    tapped = [self strip:tapped];
    
    //If you get the right answer
    if([tapped isEqualToString:correct] ){
        
        //Display correct and update points
        current_points+= point_interval;
        [response setString:@"Correct!!" ];
        [points setString:[NSString stringWithFormat:@"POINTS: %d", current_points]];
        
        //Displays the next question
        if(question_number >= [questions count]) return;
            [self performSelector:@selector(display_question:) withObject:nil afterDelay:2];

    }
    
    
    else{
        
        //Wrong choice.  Sets string to Incorrect and updates points
        current_points-= point_interval;
        [response setString:@"Incorrect" ];
        [points setString:[NSString stringWithFormat:@"POINTS: %d", current_points]];
        
        if(question_number >= [questions count]) return;
            [self performSelector:@selector(display_question:) withObject:nil afterDelay:2];

    }
    
    
    answer_menu.isTouchEnabled = YES;
    return;
}

-(CCMenuItemLabelAndImage*) createMenuItemLabel_Image:(NSString*)itemfromNI:
(NSString*) selectme:(CCLabelTTF*) option:
(SEL) func_name :
(CGFloat)position_width:(CGFloat)position_height :
(CGFloat)X_scale: (CGFloat)Y_scale:(NSString*)rhymestring: 
(NSString*)fontType:
(CGFloat) fontSize:
(CGFloat)x_Pos: (CGFloat)y_Pos: 
(CGFloat)r: (CGFloat)g :(CGFloat)b


{
    
    CCLabelTTF *ll = [[CCLabelTTF alloc] initWithString:rhymestring fontName:@"Arial" fontSize:20];
    CCMenuItemLabelAndImage *menuItem = [CCMenuItemLabelAndImage 
                                         itemFromLabel:ll normalImage:selectme 
                                         selectedImage:selectme 
                                         disabledImage:selectme 
                                         target:self 
                                         selector:@selector(starButtonTapped:)];

    menuItem.position = ccp(position_width,position_height);
    
    [menuItem setScaleX: X_scale];
    [menuItem setScaleY: Y_scale];
    
    
    return menuItem;
}

-(CCMenuItemLabelAndImage*) createMenuItemLabel:(NSString*)itemfromNI:
(NSString*) selectme:(CCLabelTTF*) option:
(SEL) func_name :
(CGFloat)position_width:(CGFloat)position_height :
(CGFloat)X_scale: (CGFloat)Y_scale:(NSString*)rhymestring: 
(NSString*)fontType:
(CGFloat) fontSize:
(CGFloat)x_Pos: (CGFloat)y_Pos: 
(CGFloat)r: (CGFloat)g :(CGFloat)b


{
    
    CCLabelTTF *ll = [[CCLabelTTF alloc] initWithString:rhymestring fontName:@"Arial" fontSize:0];
    CCMenuItem *menuItem = [CCMenuItemLabelAndImage
                            
                            
                                         itemFromLabel:ll normalImage:selectme 
                                         selectedImage:selectme 
                                         disabledImage:selectme 
                                         target:self 
                                         selector:@selector(starButtonTapped:)];
    
    menuItem.position = ccp(position_width,position_height);
    
    [menuItem setScaleX: X_scale];
    [menuItem setScaleY: Y_scale];
    
    
    return menuItem;
}

//Leon -  Function takes you back to the home page
-(void)miniGameButtonTapped: (CCMenuItem *) menuItem
{
    
	[[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:0.5f scene:[StoryTelling scene]]];
    //[self dealloc];
}

-(CCLabelTTF*) createLabelwithDimension:(NSString*)content font:(NSString*)fontType
               fontSize:(CGFloat) fontsize X_Position:(CGFloat)x_Pos  Y_Position:(CGFloat)y_Pos
                          rgbarray:(int[])colorarray
                            Parent:(CCNode*) parent
                             Width:(CGFloat)dim_Width Height:(CGFloat)dim_Height
                            X_Size:(CGFloat)X_scale Y_Size:(CGFloat)Y_scale
{
    
    
    //Here you can center the lyrics but it might not be fixed.
    //ALso you might have to adjust the width of the dimensions of the label because its too wide--->dim_Width
    CCLabelTTF *newLabel = [CCLabelTTF labelWithString:content dimensions:CGSizeMake(dim_Width, dim_Height) alignment:CCTextAlignmentLeft fontName:fontType fontSize:fontsize];
    newLabel.position = ccp(x_Pos, y_Pos);
    [newLabel setColor:ccc3(colorarray[red],colorarray[green],colorarray[blue])];
    
    [newLabel setScaleX: X_scale];
    [newLabel setScaleY: Y_scale];
    
    newLabel.anchorPoint = ccp(0,0);
    
    return newLabel;

    
    
}



// on "init" you need to initialize your instance
-(id) init
{
    
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init] )) {

		
        
    
    
       
        
    }
    
    CCSprite* background = [CCSprite spriteWithFile:@"WhiteBackground.gif"];
    background.tag = 1;
    background.anchorPoint = CGPointMake(0, 0);
    [self addChild:background];
    CGSize s = [[CCDirector sharedDirector] winSize];
    CGSize imageSize = [background boundingBox].size;
    [background setScaleX:(s.width/imageSize.width)];
    [background setScaleY:(s.height/imageSize.height)];

    
    //CCSprite *board = 
    CCSprite *board = [CCSprite spriteWithFile:@"TriviaBoard.png"];
    board.position = ccp(235, 200);
    board.scaleY = .5;
    board.scaleX = .5;
    [self addChild:board];
    

    //CCSprite *teacher = 
    CCSprite *teacher = [CCSprite spriteWithFile:@"lars longer.png"];
    teacher.position = ccp(420,100);
    teacher.scale=.25;
    [self addChild:teacher];
    
    
    NSString* path = [[NSBundle mainBundle] pathForResource:@"HHTrivia" 
                                                     ofType:@"rtf"];
    
    //Function to parse input file into
    //to get the values
    [self parseFile:path];
    
    
    /*
    question = [self createLabelwithDim:@"" :@"Arial" : 15 :5:
                s.height-165 :0:0:0: self :s.width-15 :s.height/2 :1 :1];
    */
    
    int blackletters[3] = {255,255,255};
    
    
    question = [self createLabelwithDimension:@"" font:@"Arial" fontSize:15 X_Position:35 Y_Position:s.height-175 rgbarray:blackletters 
                                       Parent:self Width:s.width-100 Height:s.height/2 X_Size:1 Y_Size:1];  
    
    /*
    //Creating answer labels
    answer1 = [self createLabelwithDim:@"" :@"Arial Black" : 13 :
               80 :200 :0:0:0: self: s.width: 30: 1 :1];
    answer2 = [self createLabelwithDim:@"" :@"Arial Black" : 13 :
               180 :175 :0:0:0: self:  s.width: 30: 1 :1];
    answer3 = [self createLabelwithDim:@"" :@"Arial Black" : 13 :
              280 :150 :0:0:0: self:  s.width: 30 : 1 :1];
     */ 
    answered = NO;
    
    
    //Goes to the next page 
    next_button = [CCMenuItemImage itemFromNormalImage:@"next_button.jpeg" 
                                         selectedImage:@"next_button.jpeg"  target:self selector:@selector(next_button_tapped:)];
    next_button.position = ccp(s.width-175, 25);
    next_button.scale = 0.125;
    
     /*
    //Goes back to main screen
    home_button = [CCMenuItemImage itemFromNormalImage:@"home_button.jpeg" 
                    selectedImage:@"home_button.jpeg"  target:self selector:@selector(miniGameButtonTapped:)];
    home_button.position = ccp(s.width-250, 25);
    home_button.scale = 0.125;
    */
    response = [self createLabel:@"" :@"Arial Black" :20 :80 :65 :0:0:0] ;
    [self addChild:response];

    current_points =0;
    point_interval =10;

    //Creating points label
    points = [self createLabel:[NSString stringWithFormat:@"POINTS: %d", current_points] 
                :@"Arial Black" :15 :100 :25 :0:0:0] ;
    [self addChild:points];
    
    question_number =0;
    
    
    //Creates option buttons
    /*option1= [self createMenuItemLabel_Image:@"black_button.jpeg" :@"black_button.jpeg" :
                                answer1 : @selector(starButtonTapped) :50: 100 :(s.width/imageSize.width/4):
       (s.height/imageSize.height/4) : @"testing" :@"Arial Black" : 50.0f :
       200 :150 :0:0:0 ];
    
    
    //CCMenuItem *back = [CCMenuItem itemFromString:@"back" target:self selector: @selector(starButtonTapped:)];
    //back.position = ccp(200,200);
    
    option2= [self createMenuItemLabel_Image:@"black_button.jpeg" :@"black_button.jpeg" :
                                answer2 : @selector(starButtonTapped) :50: 150 :(s.width/imageSize.width/4):
              (s.height/imageSize.height/4) : @"tytytyty" :@"Arial Black" : 50.0f :
              150 :150 :0:0:0 ];
    
    option3= [self createMenuItemLabel_Image:@"black_button.jpeg" :@"black_button.jpeg" :
                                answer3 : @selector(starButtonTapped) :50: 200 :(s.width/imageSize.width/4):
              (s.height/imageSize.height/4) : @"sfasfsd" :@"Arial Black" : 50.0f :
              550 :150 :0:0:0 ];
     */
    //CCLabelTTF labelWithString:content dimensions:CGSizeMake(dim_Width, dim_Height) alignment:CCTextAlignmentLeft fontName:fontType fontSize:fontsize
       
    //first_choice = [[CCLabelTTF alloc] initWithString:@"Please work" fontName:@"Arial Black" fontSize:13];
    first_choice = [CCLabelTTF labelWithString:@"Please work" dimensions:CGSizeMake(300, 20) alignment:CCTextAlignmentLeft fontName:@"Arial Black" fontSize:13];
    first_option = [CCMenuItemLabel itemWithLabel:first_choice target:self selector:@selector(starButtonTapped:)];
    first_option.position = ccp(200,220);
    
    second_choice = [CCLabelTTF labelWithString:@"Please work" dimensions:CGSizeMake(300, 20) alignment:CCTextAlignmentLeft fontName:@"Arial Black" fontSize:13];
    second_option = [CCMenuItemLabel itemWithLabel:second_choice target:self selector:@selector(starButtonTapped:)];
    second_option.position = ccp(200,180);
    
    third_choice = [CCLabelTTF labelWithString:@"Please work" dimensions:CGSizeMake(300, 20) alignment:CCTextAlignmentLeft fontName:@"Arial Black" fontSize:13];
    third_option = [CCMenuItemLabel itemWithLabel:third_choice target:self selector:@selector(starButtonTapped:)];
    third_option.position = ccp(200,140);
    
    /*
    [self addChild:answer1];
    [self addChild:answer2];
    [self addChild:answer3];
    */
        
    answer_menu  = [CCMenu menuWithItems:first_option, second_option, third_option, next_button, nil];
    [self addChild:answer_menu];
    answer_menu.position = CGPointZero;

   
    self.isTouchEnabled = NO;
    
    
    [self addChild: question ];
    [self performSelector:@selector(display_question:)];
     
    
    return self;
}


- (void) dealloc
{
    
    [super dealloc];   
}

@end
