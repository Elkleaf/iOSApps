//
//  SQLiteDB.m
//  MassTransit
//
//  Created by Matthew Elko on 11/11/14.
//  Copyright (c) 2014 Elko, Matt. All rights reserved.
//

#import "SQLiteDB.h"
#import <sqlite3.h>

@interface SQLiteDB ()
{
    sqlite3* DBconnection;
}

@end
@implementation SQLiteDB

-(SQLiteDB*)initWithFile:(NSString*)aFile
{
    
}
@end
