//
//  FractionalNumber.h
//  FractionalCalc
//
//  Created by Matthew Elko on 10/26/14.
//  Copyright (c) 2014 Elko, Matt. All rights reserved.
//
#import "ArithmeticProtocol.h"
#import <Foundation/Foundation.h>

@interface FractionalNumber : NSObject <ArithmeticProtocol>
@property (assign) int numerator;
@property (assign) int denominator;

-(FractionalNumber*) initWithNumerator:(int)n Denominator:(int)d;
-(FractionalNumber*) add: (FractionalNumber*)rhs;
-(FractionalNumber*) subtract: (FractionalNumber*) numberToSubtract;
-(FractionalNumber*) divide: (FractionalNumber*) divideBy;
-(FractionalNumber*) multiply: (FractionalNumber*) multiplyBy;
+(int)GCD:(int)first and: (int)second;
+(int)LCM:(int)first and: (int)second;
@end
