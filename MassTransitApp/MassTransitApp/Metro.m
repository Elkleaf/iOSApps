//
//  Metro.m
//
//  Created by Matthew Elko on 11/30/14.
//  Copyright (c) 2014 Elko, Matt. All rights reserved.
//
//  all methods defined in here are for retrieving information from the Metro Database

#import "Metro.h"
static Metro* _connection;
@implementation Metro
+(Metro*)sharedGTDF
{
    if (_connection == nil) {
        _connection = [[Metro alloc]initWithFile:@"Metrolink"];
    }
    
    return _connection;
    
}
-(id)init
{
    self = [super init];
    if (self) {
        self.name = @"Metrolink";
    }
    
    return self;
}

-(NSArray*)retrieveRoutes
{
    NSMutableArray* routes = [[NSMutableArray alloc] init];
    NSString* query = @"SELECT * FROM routes;";
    sqlite3_stmt *stmt;
    const unsigned char* text;
    
    NSString *name, *color, *routeId, *agency, *someType;
     
   
    if( sqlite3_prepare_v2(DBconnection, [query UTF8String], [query length], &stmt, nil) == SQLITE_OK){
        while( sqlite3_step(stmt) == SQLITE_ROW)
        {
            text = sqlite3_column_text(stmt, 0);
            if (text) {
                routeId = [NSString stringWithCString:(const char*)text encoding:NSUTF8StringEncoding];
            }
            else
                routeId =nil;
            text = sqlite3_column_text(stmt, 1);
            
            if (text) {
                agency = [NSString stringWithCString:(const char*)text encoding:NSUTF8StringEncoding];
            }
            else
                agency = nil;
            
            
            
            text = sqlite3_column_text(stmt, 3);
            if (text) {
                name = [NSString stringWithCString:(const char*)text encoding:NSUTF8StringEncoding];
            }
            else
                name = nil;
            
            text = sqlite3_column_text(stmt, 4);
            if (text) {
                someType = [NSString stringWithCString:(const char*)text encoding:NSUTF8StringEncoding];
            }
            else
                someType = nil;
            
            text = sqlite3_column_text(stmt, 7);
            if (text) {
                color = [NSString stringWithCString:(const char*)text encoding:NSUTF8StringEncoding];
            }
            else
                color = nil;
            
            Routes* tempRoute = [[Routes alloc] initFromMetro:routeId andAgency:agency andRouteName:name andType:someType andColor:color];
            
            [routes addObject:tempRoute];
            
        }
        sqlite3_finalize(stmt);
    }
    return routes;

}

-(NSArray*)retrieveTrips: (NSString*)routeID;
{
    NSMutableArray* trips = [[NSMutableArray alloc]init];
    NSString* query = [NSString stringWithFormat:@"SELECT * FROM trips where route_id = '%@'",routeID];
    
    sqlite3_stmt *stmt;
    double tempNumber;
    NSNumber *tripID;
    
    if( sqlite3_prepare_v2(DBconnection, [query UTF8String], [query length], &stmt, nil) == SQLITE_OK){
        while( sqlite3_step(stmt) == SQLITE_ROW)
        {
            
            tempNumber = sqlite3_column_double(stmt, 2);
            if (tempNumber) {
                tripID = [NSNumber numberWithDouble:tempNumber];
            }
            [trips addObject:tripID];
        }
        sqlite3_finalize(stmt);
    }
    else
        NSLog(@"stament not correct");
    
    return trips;
    
}
-(NSArray*)stopIdFromTrips:(NSString*)routeID
{
    NSMutableArray* stopIds = [[NSMutableArray alloc]init];
    NSArray* tripArray = [[Metro sharedGTDF]retrieveTrips:routeID];
    sqlite3_stmt *stmt;
    double tempNumber;
    NSNumber* tempId;
    for (int i = 0; i < 1; i++)
    {
        NSString* query = [NSString stringWithFormat:@"SELECT * FROM stop_times where trip_id = %@",[tripArray objectAtIndex:i]];
        
        if( sqlite3_prepare_v2(DBconnection, [query UTF8String], [query length], &stmt, nil) == SQLITE_OK){
            while( sqlite3_step(stmt) == SQLITE_ROW)
            {
                tempNumber = sqlite3_column_double(stmt, 3);
                if (tempNumber) {
                    tempId = [NSNumber numberWithDouble:tempNumber];
                }
                [stopIds addObject:tempId];
            }
            sqlite3_finalize(stmt);
        }
        
        
        
    }
    
    return stopIds;
    
}

-(NSArray*)retrieveStops:(NSString *)routeID
{
    NSArray* stopIDs = [[Metro sharedGTDF]stopIdFromTrips:routeID];
    NSMutableArray* stops = [[NSMutableArray alloc]init];
    sqlite3_stmt *stmt;
    const unsigned char* text;
    double longitude, latitude;
    NSString *name;
    
    
    for (id obj in stopIDs)
    {
        NSString* query = [NSString stringWithFormat:@"SELECT * FROM stops where stop_id = %@",obj];
        if( sqlite3_prepare_v2(DBconnection, [query UTF8String], [query length], &stmt, nil) == SQLITE_OK){
            while( sqlite3_step(stmt) == SQLITE_ROW)
            {
                text = sqlite3_column_text(stmt, 1);
                if (text) {
                    name = [NSString stringWithCString:(const char*)text encoding:NSUTF8StringEncoding];
                }
                else
                    name = nil;
                
                latitude = sqlite3_column_double(stmt, 2);
                longitude = sqlite3_column_double(stmt, 3);
                CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(latitude, longitude);
                Stops* newStop = [[Stops alloc]initWithStopName:name andCoord:coordinate];
                
                [stops addObject:newStop];
            }
            sqlite3_finalize(stmt);
        }
        
        
        
    }
    return stops;
    
}

@end
