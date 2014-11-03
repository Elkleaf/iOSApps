//
//  Subject.m
//  BMICAlc
//
//  Created by Matthew Elko on 9/20/14.
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


//calculates BMI
-(NSNumber*)bmi
{
    
    
    return [NSNumber numberWithFloat:([WeightinMetric floatValue]/ ([HeightinMetric floatValue]*[HeightinMetric floatValue]))];
}

//will return appropiate string based off of BMI
-(NSString*)bmiIndexString
{
    float bmiValue = [[_subject bmi] floatValue];
    
    
    if (bmiValue >= 16.00 && bmiValue<=16.99) {
        
        return @"Moderate Thinness, have an extra serving";
        
    }
    
    if (bmiValue>=18.50 && bmiValue<=24.99){
        return@"Normal Range! You are healthy!";
        
    }

    if (bmiValue< 16.00) {
        
        return @"Severe Thinness! Eat a donut and See a doctor!";
    }
    if (bmiValue >= 17.00 && bmiValue <=18.49 ) {
        return @"Mild Thinness, nothing to worry about";
    }
    
    if (bmiValue >=25.00 && bmiValue <=29.99) {
        return @"overweight, lay off the snakcs";
    }
    
    if (bmiValue>29.99 && bmiValue <=34.99) {
        return @"Obese Class 1 (Moderate), It's not too late";
    }
    if (bmiValue >34.99 && bmiValue <=39.99) {
        return @"Obese Class 2 (Severe) Seek Help";
    }
    if (bmiValue >39.99) {
        return @"Obese Class 3 (Very Severe) go to a doctor now!";
    }
    return @"Re-enter body specs";
}

@end

