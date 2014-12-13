//
//  RoutesTableViewController.h
//
//  Created by Matthew Elko on 11/29/14.
//  Copyright (c) 2014 Elko, Matt. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface RoutesTableViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>
{
  
    NSArray* _routes;
}


@property (nonatomic, retain) NSArray* routes;

@end
