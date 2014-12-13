//
//  Routes.h
//  DemoTAbView
//
//  Created by Matthew Elko on 11/26/14.
//  Copyright (c) 2014 Elko, Matt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Routes : NSObject
@property (nonatomic,retain) NSString* routeId;
@property (nonatomic, retain) NSString* agencyId;
@property (nonatomic, retain) NSString* routeShort;
@property (nonatomic, retain) NSString* routeName;
@property (nonatomic, retain) NSString* routeDesc;
@property (nonatomic, retain) NSString* routeType;
@property (nonatomic, retain) NSString* routeColor;

-(id)initWithrouteId: (NSString*)anId andAgency: (NSString*)agencyId andShortName:(NSString*) aShort andRouteName: (NSString*) aRouteName andDesc: (NSString*) aRouteDesc andType: (NSString*) aType andColor: (NSString*) aColor;

-(id)initFromMetro: (NSString*)anId andAgency: (NSString*)agencyId andRouteName: (NSString*) aRouteName  andType: (NSString*) aType andColor: (NSString*) aColor;


@end
