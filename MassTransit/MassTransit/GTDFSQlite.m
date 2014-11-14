//
//  GTDFSQlite.m
//  MassTransit
//
//  Created by Matthew Elko on 11/11/14.
//  Copyright (c) 2014 Elko, Matt. All rights reserved.
//

#import "GTDFSQlite.h"
#import <sqlite3.h>
#import "SQLiteDB.h"
static GTDFSQlite* _connection;
@implementation GTDFSQlite

+(GTDFSQlite*)sharedGTDF
{
    if (_connection == NULL) {
        _connection = dbconnection;
    }
    
    return _connection;
    
}
@end
