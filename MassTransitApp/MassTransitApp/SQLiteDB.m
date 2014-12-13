//
//  SQLiteDB.m
//
//  Created by Matthew Elko on 11/11/14.
//  Copyright (c) 2014 Elko, Matt. All rights reserved.
//

#import "SQLiteDB.h"
#import <sqlite3.h>


@implementation SQLiteDB
@synthesize name;

-(SQLiteDB*)initWithFile:(NSString*)aFile
{
    self = [super init];
    if (self) {
        NSString* dbpath = [[NSBundle mainBundle] pathForResource:aFile ofType:@"sl3"];
        if (sqlite3_open([dbpath UTF8String], &DBconnection) != SQLITE_OK) {
            NSLog(@"Failed to open database.");
        }
        
    }
    return self;
}

-(id)init
{
    self = [super init];
    if (self) {
        
        NSString* dbpath = [[NSBundle mainBundle] pathForResource:name ofType:@"sl3"];
        //NSLog(@"name: %@", name);
        if (sqlite3_open([dbpath UTF8String], &DBconnection) != SQLITE_OK) {
            NSLog(@"Failed to open database.");
        }
       
    }
    return self;
}


- (void) dealloc
{
    sqlite3_close(DBconnection);
}


//-(SQLiteDB*)initWithFile:(NSString*)aFile
//{
//    
//}
@end
