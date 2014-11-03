//
//  FractionalNumber.m
//  FractionalCalc
//
//  Created by Matthew Elko on 10/26/14.
//  Copyright (c) 2014 Elko, Matt. All rights reserved.
//

#import "FractionalNumber.h"

@implementation FractionalNumber
@synthesize numerator;
@synthesize denominator;
-(FractionalNumber*) initWithNumerator:(int)n Denominator:(int)d
{
    assert(d!=0);
    self = [super init];
    if (self) {
        numerator = n;
        denominator = d;
    }
    return self;
}
-(FractionalNumber*) add: (FractionalNumber*)rhs
{
    if (self.denominator != rhs.denominator) {
        int lcm = [FractionalNumber LCM:self.denominator and:rhs.denominator];
        int firstTop = (lcm/self.denominator) * self.numerator;
        int secondTop = (lcm/rhs.denominator) * rhs.numerator;
        
        return [[FractionalNumber alloc]initWithNumerator:(firstTop + secondTop) Denominator:lcm];
    }
    else
    {
        return [[FractionalNumber alloc]initWithNumerator:(self.numerator + rhs.numerator) Denominator:self.denominator];
    }
    
}
-(FractionalNumber*) subtract: (FractionalNumber*) numberToSubtract
{
    if (self.denominator != numberToSubtract.denominator) {
        int lcm = [FractionalNumber LCM:self.denominator and:numberToSubtract.denominator];
        int firstTop = (lcm/self.denominator) * self.numerator;
        int secondTop = (lcm/numberToSubtract.denominator) * numberToSubtract.numerator;
        
        return [[FractionalNumber alloc]initWithNumerator:(firstTop - secondTop) Denominator:lcm];
    }
    else
    {
        return [[FractionalNumber alloc]initWithNumerator:(self.numerator - numberToSubtract.numerator) Denominator:self.denominator];
    }

    
}
-(FractionalNumber*) divide: (FractionalNumber*) divideBy
{
    return [[FractionalNumber alloc]initWithNumerator:(self.numerator * divideBy.denominator) Denominator:(self.denominator * divideBy.numerator)];
    
}
-(FractionalNumber*) multiply: (FractionalNumber*) multiplyBy
{
    return [[FractionalNumber alloc]initWithNumerator:(self.numerator * multiplyBy.numerator) Denominator:(self.denominator * multiplyBy.denominator)];
}
+(int)GCD:(int)first and: (int)second
{
    if (first ==0) {
        return second;
    }
    if (second ==0) {
        return first;
    }
    int result;
    result =[FractionalNumber GCD:second and:(first%second)];
    return result;
}

+(int)LCM:(int)first and: (int)second
{
    return abs(first *second)/[FractionalNumber GCD:first and:second];
}
@end
