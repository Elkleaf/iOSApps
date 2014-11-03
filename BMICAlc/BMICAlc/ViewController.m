//
//  ViewController.m
//  BMICAlc
//
//  Created by Matthew Elko on 9/17/14.
//  Copyright (c) 2014 elkleaf@csu.fullerton.edu . All rights reserved.
//

#import "ViewController.h"
#import "Subject.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize HeightMeasurement;
@synthesize WeightMeasurement;
@synthesize SwitchLabel;
@synthesize heightTextField;
@synthesize weightTextField;
@synthesize BMI_Label;
@synthesize BMIString;
@synthesize Picture;
@synthesize MeasurementUnit;
@synthesize CalcButton;




- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.heightTextField.text=@"Enter Height";
    self.weightTextField.text =@"Enter Weight";
    [Picture setImage:[UIImage imageNamed:@"NormalBMI.png"]];
    [MeasurementUnit setTintColor:[UIColor colorWithRed:255.0/255.0 green:0/255 blue:0/255 alpha:1.0]];
    [CalcButton setEnabled:NO];
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//this will check to see if the user has entered something
- (IBAction)EditChanged:(id)sender {
    if([heightTextField.text length] !=0 && [weightTextField.text length] != 0){
        [CalcButton setEnabled:YES];
    }

    else{
        [CalcButton setEnabled:NO];
    }
}

//will check to see if the done button was clicked
-(void)doneClicked:(UIBarButtonItem*) sender
{
    
    NSInteger tag = sender.tag;
    if (tag == 0) {
        [heightTextField resignFirstResponder];
    }
    else{
        [weightTextField resignFirstResponder];
    }
    
}

//will see if the refresh button is clicked
-(void)refreshClicked:(UIBarButtonItem*)sender
{
    if (sender.tag == 0) {
        [heightTextField setText:@""];
    }
    else{
        [weightTextField setText:@""];
    }
}

//if the Calculate button is pressed
- (IBAction)CalculateButtonPressed:(id)sender {
    
    //create a number formater so you can get the float numbers from the text fields
    NSNumberFormatter* formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    Subject* person =[Subject subject];
    
    NSNumber* height = [formatter numberFromString:[heightTextField text]];
        
    NSNumber* weight = [formatter numberFromString:[weightTextField text]];
    float BmiFloatValue;
    NSString* BMIvalue;
    
    if ([MeasurementUnit isOn]) {
       
        //send the height and weight to model
        //get the bmi NSNumber and the
        //NSString bmiIndexString
        
        [person setHeightinMetric:height];
        [person setWeightinMetric:weight];
       
        BmiFloatValue = [[person bmi] floatValue];
        BMIvalue = [NSString stringWithFormat:@"%f",BmiFloatValue];
       
        [BMIString setText:[person bmiIndexString]];
        [BMI_Label setText:BMIvalue];
        
        
    }
    else{//if the measurement units are selected for US standard
        height = [NSNumber numberWithFloat:([height floatValue] * 0.0245)];
        weight = [NSNumber numberWithFloat:([weight floatValue] * 0.455392)];
        [person setHeightinMetric:height];
        [person setWeightinMetric:weight];
        
        BmiFloatValue = [[person bmi] floatValue];
        BMIvalue = [NSString stringWithFormat:@"%f",BmiFloatValue];
        [BMIString setText:[person bmiIndexString]];
        [BMI_Label setText:BMIvalue];
         
    }
    
    //will display appropiate picture
    if (BmiFloatValue >= 30.00) {
        [Picture setImage:[UIImage imageNamed:@"severeobeseBMI.png"]];
    }
    
    if (BmiFloatValue <=16.99) {
        [Picture setImage:[UIImage imageNamed:@"ThinBMI.png"]];
    }
    if (BmiFloatValue >16.99 && BmiFloatValue <=24.99) {
        [Picture setImage:[UIImage imageNamed:@"NormalBMI.png"]];
    }
    if (BmiFloatValue >24.99 && BmiFloatValue <=29.99) {
        [Picture setImage:[UIImage imageNamed:@"ObeseBMI.png"]];
    }
    
}

//displays the toolbar on top of the keyboard
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    UIToolbar *toolbar = [[UIToolbar alloc] init];
    [toolbar sizeToFit];
    NSInteger tag = textField.tag;
    UIBarButtonItem* doneButton =[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneClicked:)];
    
    //creates space between the refresh button and done button
    UIBarButtonItem* flexspace =[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    
    UIBarButtonItem* refreshButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(refreshClicked:)];
    
   doneButton.tag = tag;
    refreshButton.tag =tag;
    NSArray* BarArray = @[refreshButton,flexspace,doneButton];
    
    [toolbar setItems:BarArray];
    
    
    [textField setInputAccessoryView:toolbar];
    
    return YES;
}
//if the switch is toggled, change the labels
- (IBAction)MeasurementSwitched:(id)sender {
    
    
    if (![MeasurementUnit isOn]) {
        [SwitchLabel setText:@"Metrics: off"];
        [HeightMeasurement setText:@"in"];
        [WeightMeasurement setText:@"lbs"];
  
    }
    else{
        
        [SwitchLabel setText:@"Metrics: on"];
        [HeightMeasurement setText:@"m"];
        [WeightMeasurement setText:@"kg"];
        
    }
    
}


//hides the keyboard when the user touches outside the text box
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch* touch =[[event allTouches] anyObject];
    if ([heightTextField isFirstResponder] && [touch view] != heightTextField){
        [heightTextField resignFirstResponder];
    }
    else{
        if([weightTextField isFirstResponder] && [touch view] != weightTextField){
            [weightTextField resignFirstResponder];
        }
    }
    [super touchesBegan:touches withEvent:event];
}
@end
