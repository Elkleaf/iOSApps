//
//  NSArray+Range.h
//  MidtermReview
//
//  Created by Matthew Elko on 10/14/14.
//  Copyright (c) 2014 Elko, Matt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Range)

-(id) initWithFrom: (NSInteger)from to: (NSInteger)to;
-(id) initWithTo: (NSInteger)to;
-(id) initWithFrom: (NSInteger)from to: (NSInteger)to step: (NSInteger)step;
-(id) initWithTo: (NSInteger)to step: (NSInteger)step;
+(NSArray*) arrayWithFrom: (NSInteger)from to: (NSInteger)to;
+(NSArray*) arrayWithTo: (NSInteger)to;
+(NSArray*) arrayWithFrom: (NSInteger)from to: (NSInteger)to step: (NSInteger)step;
+(NSArray*) arrayWithTo: (NSInteger)to step: (NSInteger)step;

@end
