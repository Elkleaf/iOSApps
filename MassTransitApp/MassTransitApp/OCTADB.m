//
//  OCTADB.m
//
//  Created by Matthew Elko on 11/25/14.
//  Copyright (c) 2014 Elko, Matt. All rights reserved.
//

#import "OCTADB.h"
static OCTADB* _connection;
@implementation OCTADB
+(OCTADB*)sharedGTDF
{
    if (_connection == nil) {
        _connection = [[OCTADB alloc]initWithFile:@"OCTA"];
    }
    
    return _connection;
    
}

-(id)init
{
    self = [super init];
    if (self) {
        self.name = @"OCTA";
        ;
    }
    
    return self;
}
@end
