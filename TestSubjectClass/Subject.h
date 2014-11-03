//
//  Subject.h
//  TestSubjectClass
//
//  Created by Matthew Elko on 9/15/14.
//  Copyright (c) 2014 Matthew Elko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Subject : NSObject

@property (retain, nonatomic) NSNumber* HeightinMetric;
@property (retain, nonatomic) NSNumber* WeightinMetric;
@property (readonly, nonatomic) NSNumber* bmi;
@property (readonly)NSString* bmiIndexString;

-(NSNumber*) bmi;
-(NSString*)bmiIndexString;
//-(instancetype)init;
+(Subject*)subject;


@end
