//
//  StopsTableViewController.h
//
//  Created by Matthew Elko on 11/29/14.
//  Copyright (c) 2014 Elko, Matt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Routes.h"
#import "Stops.h"

@interface StopsTableViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>
{
    NSArray* _stops;
}
@property (retain, nonatomic)NSArray* stops;
@property (retain, nonatomic)NSString* routeID;
@property (retain, nonatomic)Routes* selectedRoute;


@end
