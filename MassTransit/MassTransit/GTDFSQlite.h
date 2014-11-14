//
//  GTDFSQlite.h
//  MassTransit
//
//  Created by Matthew Elko on 11/11/14.
//  Copyright (c) 2014 Elko, Matt. All rights reserved.
//

#import "SQLiteDB.h"

@interface GTDFSQlite : SQLiteDB

+(GTDFSQlite*)sharedGTDF;
@end
