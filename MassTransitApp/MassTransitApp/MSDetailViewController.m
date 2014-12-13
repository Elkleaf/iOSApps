//
//  MSDetailViewController.m
//
//  Created by Matthew Elko on 11/29/14.
//  Copyright (c) 2014 Elko, Matt. All rights reserved.
//

#import "MSDetailViewController.h"

@interface MSDetailViewController ()

@end

@implementation MSDetailViewController

@synthesize selectedStop;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
  self.cityLabel.text = self.selectedStop.stopName;
 
  self.coordLabel.text = [NSString stringWithFormat: @"Latitude: %f, Longitude: %f", self.selectedStop.coord.latitude, self.selectedStop.coord.longitude];
  [self.map setCenterCoordinate: self.selectedStop.coord animated: YES];
  self.map.region = MKCoordinateRegionMake(self.selectedStop.coord, MKCoordinateSpanMake(0.5, 0.5));
  MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
  [annotation setCoordinate: self.selectedStop.coord];
  [annotation setTitle: self.selectedStop.stopName];
  [self.map addAnnotation:annotation];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
  [self setCoordLabel:nil];
  
  [super viewDidUnload];
}
@end
