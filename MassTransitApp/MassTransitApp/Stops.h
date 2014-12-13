//
//  Stops.h
//  DemoTAbView
//
//  Created by Matthew Elko on 11/29/14.
//  Copyright (c) 2014 Elko, Matt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface Stops : NSObject
@property (retain, nonatomic)NSString* stopName;
@property (readonly)CLLocationCoordinate2D coord;

-(id)initWithStopName: (NSString*) aName andCoord: (CLLocationCoordinate2D) aCoord;
@end
