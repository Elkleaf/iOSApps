//
//  CalcEngine.h
//  FractionalCalc
//
//  Created by Matthew Elko on 10/28/14.
//  Copyright (c) 2014 Elko, Matt. All rights reserved.
//
#import "ArithmeticProtocol.h"
#import "FractionalNumber.h"
#import <Foundation/Foundation.h>

@interface CalcEngine : NSObject
@property (retain, nonatomic) id<ArithmeticProtocol, NSObject> waitingOperand;
@property (assign, nonatomic) SEL waitingOperator;

+(CalcEngine*)sharedCalcEngine;
-(id<ArithmeticProtocol, NSObject>)send: (id<ArithmeticProtocol, NSObject>) anOperand withOperator: (SEL)anOperator;
-(id<ArithmeticProtocol, NSObject>)evaluate:(id<ArithmeticProtocol, NSObject>) anOperand;
@end
