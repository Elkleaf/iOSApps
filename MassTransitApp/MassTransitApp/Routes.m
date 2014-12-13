//
//  Routes.m
//  DemoTAbView
//
//  Created by Matthew Elko on 11/26/14.
//  Copyright (c) 2014 Elko, Matt. All rights reserved.
//

#import "Routes.h"

@implementation Routes
@synthesize routeId;
@synthesize agencyId;
@synthesize routeShort;
@synthesize routeName;
@synthesize routeDesc;
@synthesize routeType;
@synthesize routeColor;

-(id)initWithrouteId:(NSString *)anId andAgency:(NSString *)anAgency andShortName:(NSString*)aShort andRouteName:(NSString *)aRouteName andDesc:(NSString *)aRouteDesc andType:(NSString *)aType andColor:(NSString *)aColor
{
    self = [super init];
    if (self) {
        routeId = anId;
        agencyId = anAgency;
        routeShort = aShort;
        routeName = aRouteName;
        routeDesc = aRouteDesc;
        routeType = aType;
        routeColor = aColor;
    }
    return self;
}

-(id)initFromMetro: (NSString*)anId andAgency: (NSString*)anAgency andRouteName: (NSString*) aRouteName  andType: (NSString*) aType andColor: (NSString*) aColor;
{
    self = [super init];
    if (self) {
        routeId = anId;
        agencyId = anAgency;
        routeName = aRouteName;
        routeType = aType;
        routeColor = aColor;
    }
    return self;
}
@end
