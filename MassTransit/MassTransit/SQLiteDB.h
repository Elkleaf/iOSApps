//
//  SQLiteDB.h
//  MassTransit
//
//  Created by Matthew Elko on 11/11/14.
//  Copyright (c) 2014 Elko, Matt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SQLiteDB : NSObject
@property (weak,nonatomic) NSString* name;
-(SQLiteDB*)initWithFile:(NSString*)aFile;
@end
