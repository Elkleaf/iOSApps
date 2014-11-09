//
//  CalcEngine.m
//  FractionalCalc
//
//  Created by Matthew Elko on 10/28/14.
//  Copyright (c) 2014 Elko, Matt. All rights reserved.
//

#import "CalcEngine.h"
static CalcEngine* _engine;
@implementation CalcEngine
@synthesize waitingOperand;
@synthesize waitingOperator;

-(id)init
{
    self = [super init];
    if(self)
    {
        waitingOperand = [[FractionalNumber alloc] initWithNumerator:0 Denominator:1];
        waitingOperator = @selector(add:);
    }
    
    return self;
}

-(id <ArithmeticProtocol, NSObject>)send:(id<ArithmeticProtocol,NSObject>)anOperand withOperator:(SEL)anOperator
{
    waitingOperand =[waitingOperand performSelector:waitingOperator withObject:anOperand];
    waitingOperator = anOperator;
    return waitingOperand;
    
    
}
-(id<ArithmeticProtocol, NSObject>)evaluate:(id<ArithmeticProtocol, NSObject>) anOperand
{
    return [waitingOperand performSelector:waitingOperator withObject:anOperand];
    
}

+(CalcEngine*)sharedCalcEngine
{
    if(_engine == nil)
    {
        _engine = [[CalcEngine alloc]init];
    }
    
    return _engine;
}
@end
