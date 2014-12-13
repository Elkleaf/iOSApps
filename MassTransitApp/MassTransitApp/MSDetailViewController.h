//
//  MSDetailViewController.h
//
//  Created by Matthew Elko on 11/29/14.
//  Copyright (c) 2014 Elko, Matt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

#import "Stops.h"

@interface MSDetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *cityLabel;
@property (weak, nonatomic) Stops* selectedStop;
@property (weak, nonatomic) IBOutlet MKMapView *map;
@property (weak, nonatomic) IBOutlet UILabel *coordLabel;

@end
