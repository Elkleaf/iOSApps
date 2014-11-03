//
//  Subject.m
//  TestSubjectClass
//
//  Created by Matthew Elko on 9/15/14.
//  Copyright (c) 2014 Matthew Elko. All rights reserved.
//

#import "Subject.h"

static Subject *_subject;
@implementation Subject
@synthesize HeightinMetric;
@synthesize WeightinMetric;

+(Subject*)subject
{
    
    if(_subject ==nil)
    {
        _subject = [[Subject alloc]init];
    }
    
    return _subject;
}



-(NSNumber*)bmi
{
   
    
    return [NSNumber numberWithFloat:([WeightinMetric floatValue]/ ([HeightinMetric floatValue]*[HeightinMetric floatValue]))];
}

-(NSString*)bmiIndexString
{
    return @"a string";
}

@end


