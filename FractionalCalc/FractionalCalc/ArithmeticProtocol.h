//
//  ArithmeticProtocol.h
//  FractionalCalc
//
//  Created by Matthew Elko on 10/28/14.
//  Copyright (c) 2014 Elko, Matt. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ArithmeticProtocol <NSObject>
-(id)add:(id)rhs;
-(id)subtract:(id)numberToSubtract;
-(id) divide: (id) divideBy;
-(id) multiply: (id) multiplyBy;

@end
