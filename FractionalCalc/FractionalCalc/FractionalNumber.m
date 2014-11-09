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
        
        FractionalNumber* result= [[FractionalNumber alloc]initWithNumerator:(firstTop + secondTop) Denominator:lcm];
        [result reduce];
        return result;
    }
    else
    {
        FractionalNumber* result = [[FractionalNumber alloc]initWithNumerator:(self.numerator + rhs.numerator) Denominator:self.denominator];
        [result reduce];
        return result;
    }
    
}
-(FractionalNumber*) subtract: (FractionalNumber*) numberToSubtract
{
    if (self.denominator != numberToSubtract.denominator) {
        int lcm = [FractionalNumber LCM:self.denominator and:numberToSubtract.denominator];
        int firstTop = (lcm/self.denominator) * self.numerator;
        int secondTop = (lcm/numberToSubtract.denominator) * numberToSubtract.numerator;
        
        FractionalNumber* result= [[FractionalNumber alloc]initWithNumerator:(firstTop - secondTop) Denominator:lcm];
        [result reduce];
        return result;
    }
    else
    {
        FractionalNumber* result = [[FractionalNumber alloc]initWithNumerator:(self.numerator - numberToSubtract.numerator) Denominator:self.denominator];
        [result reduce];
        return result;
    }

    
}
-(FractionalNumber*) divide: (FractionalNumber*) divideBy
{
    FractionalNumber* result =[[FractionalNumber alloc]initWithNumerator:(self.numerator * divideBy.denominator) Denominator:(self.denominator * divideBy.numerator)];
    [result reduce];
    return result;
    
}
-(FractionalNumber*) multiply: (FractionalNumber*) multiplyBy
{
    FractionalNumber* result =[[FractionalNumber alloc]initWithNumerator:(self.numerator * multiplyBy.numerator) Denominator:(self.denominator * multiplyBy.denominator)];
    [result reduce];
    return result;
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

-(void)reduce
{
    int gcd;
    if (self.denominator >= self.numerator)
    {
        gcd  = [FractionalNumber GCD:self.denominator and:self.numerator];
        
    }
    else{
        gcd = [FractionalNumber GCD:self.numerator and:self.denominator];
       
    }
    
    self.denominator /=  gcd;
    self.numerator /= gcd;
    
}
-(NSString*)mixedFraction
{
    
    int wholeNumber = (self.numerator / self.denominator);
    int num = (self.numerator % self.denominator);
    int denom = self.denominator;
    NSString *result = [NSString stringWithFormat:@"%d",wholeNumber];
    result = [result stringByAppendingString:@" "];
    result = [result stringByAppendingString:[NSString stringWithFormat:@"%d",num]];
    result = [result stringByAppendingString:[NSString stringWithFormat:@"/%d",denom]];
    
    return result;
    
}
@end
