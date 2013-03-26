//
//  scoreAlgo.m
//  Flow Master by MC Lars
//
//  Created by Lion User on 2/27/12.
//  Copyright 2012 sai. All rights reserved.
//

#import "scoreAlgo.h"


@implementation scoreAlgo

+(int) updateScore:(int*)mainScore isCorrect:(BOOL)isCorrectAns levelScore:(int*)internalScore currentBonus:(int*)bonus mode:(int)curMode
{
    int mileStones=0;
    if(isCorrectAns==YES)
    {
        *internalScore+=10;
        //easy=1 intermediate=2 hard=3
        if(curMode==1)
        {
            *mainScore+=10;
        }
        else if(curMode==2)
        {
            *mainScore+=15;
        }
        else if(curMode==3)
        {
            *mainScore+=20;
        }
        //calculating bonus
        if(*bonus>=1 && *bonus<=128)
        {
            //CCLOG(@"entered this loop");
            if(*bonus!=1)
            {
                
                *mainScore+=*bonus;
                *bonus*=2;
            }
            else {
                *bonus*=2;
            }
       }
        else if(*bonus==256)
        {
            *bonus=256;
            *mainScore+=*bonus;
        }
        else
            *bonus=1;
        
        //determining the milestones
        if(*bonus==16)
            mileStones=1;
        else if(*bonus==64)
            mileStones=2;
        else if(*bonus==256)
            mileStones=3;
       
        
    }
    else //means the answer is wrong
    {
        *internalScore-=10;
        //*internalScore<=0?0:*internalScore;
        if(*internalScore<=0)
            *internalScore=0;
        //easy=1 intermediate=2 hard=3
        if(curMode==1)
        {
            *mainScore-=10;
            //NSLog(@"in here ");
        }
        else if(curMode==2)
        {
            *mainScore-=15;
        }
        else if(curMode==3)
        {
            *mainScore-=20;
        }
        if(*mainScore<=0)
            *mainScore=0;
        //calculating bonus
        if(*bonus>1)
        {
            if(curMode==1)
                *bonus/=2;
            else if(curMode==2)
            {
                int temp=*bonus/1;
                int n=0;
                while (temp/2>=1) {
                    n++;
                    temp/=2;
                }
                for (int i=0; i<ceil(n/2); i++) {
                    *bonus=*bonus<<2;
                }
            }
            else if(curMode==3)
            {
                *bonus=1;
            }
            
        }
        else
            *bonus=1;
        
    }
    return mileStones;
}

@end
