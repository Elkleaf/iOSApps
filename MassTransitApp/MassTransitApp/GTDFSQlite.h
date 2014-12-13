//
//  GTDFSQlite.h
//
//  Created by Matthew Elko on 11/11/14.
//  Copyright (c) 2014 Elko, Matt. All rights reserved.
//

#import "SQLiteDB.h"
#import "Routes.h"
#import "Stops.h"


@interface GTDFSQlite : SQLiteDB

//+(GTDFSQlite*)sharedGTDF;
-(NSArray*)retrieveRoutes;
-(NSArray*)retrieveStops: (NSString*)routeID;
-(NSArray*)retrieveTrips: (NSString*)routeID;
-(NSArray*)stopIdFromTrips: (NSString*)routeID;

@end
