//
//  ViewController.h
//  FractionalCalc
//
//  Created by Matthew Elko on 10/26/14.
//  Copyright (c) 2014 Elko, Matt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIAlertViewDelegate>


- (IBAction)buttonPressed:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *Display;

@end
