//
//  ViewController.h
//  BMICAlc
//
//  Created by Matthew Elko on 9/17/14.
//  Copyright (c) 2014 elkleaf@csu.fullerton.edu . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>


//@property(nonatomic, getter = IsOn) bool on;
@property (weak, nonatomic) IBOutlet UITextField *heightTextField;

@property(weak, nonatomic) IBOutlet UITextField* weightTextField;

@property (weak, nonatomic) IBOutlet UIButton *CalcButton;

@property (weak, nonatomic) IBOutlet UILabel *BMI_Label;

@property (weak, nonatomic) IBOutlet UILabel *BMIString;

@property (weak, nonatomic) IBOutlet UIImageView *Picture;

@property (weak, nonatomic) IBOutlet UISwitch *MeasurementUnit;

@property (weak, nonatomic) IBOutlet UILabel* HeightLabel;


@property (weak, nonatomic)IBOutlet UILabel* HeightMeasurement;

@property (weak, nonatomic)IBOutlet UILabel* WeightMeasurement;

@property (weak, nonatomic)IBOutlet UILabel* SwitchLabel;
- (IBAction)EditChanged:(id)sender;

- (IBAction)CalculateButtonPressed:(id)sender;

- (IBAction)MeasurementSwitched:(id)sender;



-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;

@end
