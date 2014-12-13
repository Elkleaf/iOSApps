//
//  Stops.m
//  DemoTAbView
//
//  Created by Matthew Elko on 11/29/14.
//  Copyright (c) 2014 Elko, Matt. All rights reserved.
//

#import "Stops.h"

@implementation Stops
@synthesize stopName;
@synthesize coord;

-(id)initWithStopName:(NSString *)aName andCoord:(CLLocationCoordinate2D)aCoord
{
    self = [super init];
    if (self) {
        stopName = aName;
        coord = CLLocationCoordinate2DMake(aCoord.latitude, aCoord.longitude);
    }
    return self;
}
@end
