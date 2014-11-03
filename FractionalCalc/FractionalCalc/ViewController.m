//
//  ViewController.m
//  FractionalCalc
//
//  Created by Matthew Elko on 10/26/14.
//  Copyright (c) 2014 Elko, Matt. All rights reserved.
//

#import "ViewController.h"
#import "FractionalNumber.h"
#import "CalcEngine.h"
#import "ArithmeticProtocol.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize Display;
bool OperatorPressed = false;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
//    FractionalNumber* firstNum = [[FractionalNumber alloc]initWithNumerator:4 Denominator:5];
//    FractionalNumber* secondNum = [[FractionalNumber alloc]initWithNumerator:1 Denominator:4];
//    FractionalNumber* result = [FractionalNumber alloc];
//    result = [firstNum add:secondNum];
//    
//    NSLog(@"numerator is: %d", result.numerator);
//    NSLog(@"denomenator is : %d", result.denominator);
//    
//    result = [firstNum subtract:secondNum];
//    
//    NSLog(@"numerator is: %d", result.numerator);
//    NSLog(@"denomenator is : %d", result.denominator);
//    
//    result = [firstNum divide:secondNum];
//    
//    NSLog(@"numerator is: %d", result.numerator);
//    NSLog(@"denomenator is : %d", result.denominator);
//    
//    result = [firstNum multiply:secondNum];
//    NSLog(@"numerator is: %d", result.numerator);
//    NSLog(@"denomenator is : %d", result.denominator);
    
//    CalcEngine* calcEngine =[CalcEngine sharedCalcEngine];
//    
//    
//    result = [calcEngine send:firstNum withOperator:@selector(add:)];
//    
//    NSLog(@"result is: %d", result.numerator);
//    NSLog(@"denominator is: %d", result.denominator);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)buttonPressed:(id)sender {
    int buttonID = [sender tag];
    CalcEngine * calcBrain = [CalcEngine sharedCalcEngine];
    //NSLog(@"the button presssed: %d", buttonID);
    if (OperatorPressed) {
        [Display setText:@""];
    }
    NSMutableString *tempString = [NSMutableString stringWithString:[Display text]];
    [tempString replaceOccurrencesOfString:@"+" withString:@"" options:NSLiteralSearch range:NSMakeRange(0, [tempString length])];
    
//    NSString* numerator = [tempString substringToIndex:subStringLoc];
//    NSString* denominator = [tempString substringFromIndex:subStringLoc];
//    
    
    //NSLog(@"locatoin: %d",subStringLoc);
    switch (buttonID) {
        case 1:
        {
            [tempString appendString:@"1"];
            [Display setText:tempString];
            OperatorPressed = false;
            break;
        }
        case 2:
        {
            [tempString appendString:@"2"];
            [Display setText:tempString];
            OperatorPressed = false;
            break;
        }
        case 3:
        {
            [tempString appendString:@"3"];
            [Display setText:tempString];
            OperatorPressed = false;
            break;
        }
        case 4:
        {
            [tempString appendString:@"4"];
            [Display setText:tempString];
            OperatorPressed = false;
            break;
        }
        case 5:
        {
            [tempString appendString:@"5"];
            [Display setText:tempString];
            OperatorPressed = false;
            break;
        }
        case 6:
        {
            [tempString appendString:@"6"];
            [Display setText:tempString];
            OperatorPressed = false;
            break;
        }
        case 7:
        {
            [tempString appendString:@"7"];
            [Display setText:tempString];
            OperatorPressed = false;
            break;
        }
        case 8:
        {
            [tempString appendString:@"8"];
            [Display setText:tempString];
            OperatorPressed = false;
            break;
        }
        case 9:
        {
            [tempString appendString:@"9"];
            [Display setText:tempString];
            OperatorPressed = false;
            break;
        }
        // addition sign
        case 10:
        {
            OperatorPressed = true;
            
            
            int subStringLoc = [tempString rangeOfString:@"/"].location;
            if (subStringLoc != NSNotFound) {
                NSString* numerator = [tempString substringToIndex:subStringLoc];
                NSString* denominator = [tempString substringFromIndex:subStringLoc+1];
                NSLog(@"the numerator is: %@" , numerator);
                NSLog(@"the denominator is: %@", denominator);
                
                FractionalNumber* newFraction = [[FractionalNumber alloc]initWithNumerator:[numerator intValue] Denominator:[denominator intValue]];
                newFraction = [calcBrain send:newFraction withOperator:@selector(add:)];
                NSLog(@"new fraction numerator: %d", newFraction.numerator);
                NSLog(@"new fraction denominator: %d", newFraction.denominator);
                numerator = [NSString stringWithFormat:@"%d", newFraction.numerator];
                denominator = [NSString stringWithFormat:@"%d", newFraction.denominator];
                numerator = [numerator stringByAppendingString:@"/"];
                numerator = [numerator stringByAppendingString:denominator];
                [Display setText:numerator];

            }
            else
            {
                FractionalNumber* newFraction = [[FractionalNumber alloc] initWithNumerator:0 Denominator:1];
                newFraction = [calcBrain send:newFraction withOperator:@selector(add:)];
                NSString* numerator = [NSString stringWithFormat:@"%d",newFraction.numerator];
                NSString* denominator = [NSString stringWithFormat:@"%d",newFraction.denominator];
                numerator = [numerator stringByAppendingString:@"/"];
                numerator = [numerator stringByAppendingString:denominator];
                [Display setText:numerator];
            }
            
            break;
        }
        //subtraction sign
        case 11:
        {
            OperatorPressed = true;
            
            
            int subStringLoc = [tempString rangeOfString:@"/"].location;
            if (subStringLoc != NSNotFound) {
                NSString* numerator = [tempString substringToIndex:subStringLoc];
                NSString* denominator = [tempString substringFromIndex:subStringLoc+1];
                NSLog(@"the numerator is: %@" , numerator);
                NSLog(@"the denominator is: %@", denominator);
                
                FractionalNumber* newFraction = [[FractionalNumber alloc]initWithNumerator:[numerator intValue] Denominator:[denominator intValue]];
                newFraction = [calcBrain send:newFraction withOperator:@selector(subtract:)];
                NSLog(@"new fraction numerator: %d", newFraction.numerator);
                NSLog(@"new fraction denominator: %d", newFraction.denominator);
                numerator = [NSString stringWithFormat:@"%d", newFraction.numerator];
                denominator = [NSString stringWithFormat:@"%d", newFraction.denominator];
                numerator = [numerator stringByAppendingString:@"/"];
                numerator = [numerator stringByAppendingString:denominator];
                [Display setText:numerator];
                
            }
            else
            {
                FractionalNumber* newFraction = [[FractionalNumber alloc] initWithNumerator:0 Denominator:1];
                newFraction = [calcBrain send:newFraction withOperator:@selector(add:)];
                NSString* numerator = [NSString stringWithFormat:@"%d",newFraction.numerator];
                NSString* denominator = [NSString stringWithFormat:@"%d",newFraction.denominator];
                numerator = [numerator stringByAppendingString:@"/"];
                numerator = [numerator stringByAppendingString:denominator];
                [Display setText:numerator];
            }
            
            break;
        }
        
         //division sign
        case 12:
        {
            OperatorPressed = true;
            
            
            int subStringLoc = [tempString rangeOfString:@"/"].location;
            if (subStringLoc != NSNotFound) {
                NSString* numerator = [tempString substringToIndex:subStringLoc];
                NSString* denominator = [tempString substringFromIndex:subStringLoc+1];
                NSLog(@"the numerator is: %@" , numerator);
                NSLog(@"the denominator is: %@", denominator);
                
                FractionalNumber* newFraction = [[FractionalNumber alloc]initWithNumerator:[numerator intValue] Denominator:[denominator intValue]];
                newFraction = [calcBrain send:newFraction withOperator:@selector(divide:)];
                NSLog(@"new fraction numerator: %d", newFraction.numerator);
                NSLog(@"new fraction denominator: %d", newFraction.denominator);
                numerator = [NSString stringWithFormat:@"%d", newFraction.numerator];
                denominator = [NSString stringWithFormat:@"%d", newFraction.denominator];
                numerator = [numerator stringByAppendingString:@"/"];
                numerator = [numerator stringByAppendingString:denominator];
                [Display setText:numerator];
                
            }
            else
            {
                FractionalNumber* newFraction = [[FractionalNumber alloc] initWithNumerator:0 Denominator:1];
                newFraction = [calcBrain send:newFraction withOperator:@selector(add:)];
                NSString* numerator = [NSString stringWithFormat:@"%d",newFraction.numerator];
                NSString* denominator = [NSString stringWithFormat:@"%d",newFraction.denominator];
                numerator = [numerator stringByAppendingString:@"/"];
                numerator = [numerator stringByAppendingString:denominator];
                [Display setText:numerator];
            }
            
            break;
        }
        
        //multiplication sign
        case 13:
        {
            OperatorPressed = true;
            
            
            int subStringLoc = [tempString rangeOfString:@"/"].location;
            if (subStringLoc != NSNotFound) {
                NSString* numerator = [tempString substringToIndex:subStringLoc];
                NSString* denominator = [tempString substringFromIndex:subStringLoc+1];
                NSLog(@"the numerator is: %@" , numerator);
                NSLog(@"the denominator is: %@", denominator);
                
                FractionalNumber* newFraction = [[FractionalNumber alloc]initWithNumerator:[numerator intValue] Denominator:[denominator intValue]];
                newFraction = [calcBrain send:newFraction withOperator:@selector(multiply:)];
                NSLog(@"new fraction numerator: %d", newFraction.numerator);
                NSLog(@"new fraction denominator: %d", newFraction.denominator);
                numerator = [NSString stringWithFormat:@"%d", newFraction.numerator];
                denominator = [NSString stringWithFormat:@"%d", newFraction.denominator];
                numerator = [numerator stringByAppendingString:@"/"];
                numerator = [numerator stringByAppendingString:denominator];
                [Display setText:numerator];
                
            }
            else
            {
                FractionalNumber* newFraction = [[FractionalNumber alloc] initWithNumerator:0 Denominator:1];
                newFraction = [calcBrain send:newFraction withOperator:@selector(add:)];
                NSString* numerator = [NSString stringWithFormat:@"%d",newFraction.numerator];
                NSString* denominator = [NSString stringWithFormat:@"%d",newFraction.denominator];
                numerator = [numerator stringByAppendingString:@"/"];
                numerator = [numerator stringByAppendingString:denominator];
                [Display setText:numerator];
            }
            
            break;
        }


        
        case 14:
        {
            [calcBrain setWaitingOperand:[[FractionalNumber alloc]initWithNumerator:0 Denominator:1]];
            [calcBrain setWaitingOperator:@selector(add:)];
            [Display setText:@""];
            break;
        }
        case 15:
        {
            [tempString appendString:@"/"];
            [Display setText:tempString];
            break;
        }
        
        case 17:
        {
            //I can clean this up:
            //I can create a new method for the CalcEngine that will perform the operation instead
            //of having the send: function doing it
            FractionalNumber* newFraction = [[FractionalNumber alloc] initWithNumerator:0 Denominator:1];
            newFraction = [calcBrain send:newFraction withOperator:@selector(add:)];
            NSString* numerator = [NSString stringWithFormat:@"%d",newFraction.numerator];
            NSString* denominator = [NSString stringWithFormat:@"%d",newFraction.denominator];
            numerator = [numerator stringByAppendingString:@"/"];
            numerator = [numerator stringByAppendingString:denominator];
            [Display setText:numerator];
        }
            
        default:
            break;
    }
    
}
@end
