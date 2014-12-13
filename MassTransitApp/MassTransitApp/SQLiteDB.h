//
//  SQLiteDB.h
//
//  Created by Matthew Elko on 11/11/14.
//  Copyright (c) 2014 Elko, Matt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface SQLiteDB : NSObject
{
    sqlite3* DBconnection;
}

@property (weak,nonatomic) NSString* name;
-(SQLiteDB*)initWithFile:(NSString*)aFile;
@end
