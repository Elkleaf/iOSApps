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
bool numeratorButton = false;
bool denominatorButton = false;
bool signButton = false;

- (void)viewDidLoad
{
    [super viewDidLoad];
	   
    [Display setText:@"0"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)buttonPressed:(id)sender {
    //get what button was pressed
    int buttonID = [sender tag];
    
    //get the calculater engine
    CalcEngine * calcBrain = [CalcEngine sharedCalcEngine];
    
    
    //store whatever is being displayed into a mutable string
    NSMutableString *tempString = [NSMutableString stringWithString:[Display text]];
    
    
    switch (buttonID) {
        //if a number was pressed, just appened to the string
        case 0:
        case 1:
        case 2:
        case 3:
        case 4:
        case 5:
        case 6:
        case 7:
        case 8:
        case 9:
        {
            numeratorButton = false;

            if ([tempString isEqualToString:@"0"]) {
                tempString = [NSMutableString stringWithString:@""];
            }
            if (OperatorPressed) {
                tempString = [NSMutableString stringWithString:@""];
            }
            tempString =[NSMutableString stringWithString:[tempString stringByAppendingFormat:@"%d",buttonID]];
            [Display setText:tempString];
            OperatorPressed = false;
            denominatorButton = false;
            break;
        }
        // operators were pressed
        case 10:
        case 11:
        case 12:
        case 13:
        {
            //this makes sure that the user can't do an operation without finishing inputing the fraction
            if (numeratorButton || denominatorButton) {
                break;
            }
            OperatorPressed = true;
            
            //get the location in the string where the '/' is
            int fractionStringLoc = [tempString rangeOfString:@"/"].location;
            
            //if a fraction is found
            if (fractionStringLoc != NSNotFound) {
                
                //make 2 strings. The numerator string will conatin both the whole number and numerator at this point
                NSString* numerator = [tempString substringToIndex:fractionStringLoc];
                NSString* denominator = [tempString substringFromIndex:fractionStringLoc+1];
                
                //get the location in the string where the space is. This determines the difference between whole and numerator numbers
                int spaceStringLoc = [numerator rangeOfString:@" "].location;
                
                //if there is a space
                if (spaceStringLoc != NSNotFound) {
                    NSString* wholeNumber = [numerator substringToIndex:spaceStringLoc];
                    numerator = [numerator substringFromIndex:spaceStringLoc+1];
                    numerator = [NSString stringWithFormat:@"%d",(([wholeNumber intValue]*[denominator intValue])+[numerator intValue])];
                    
                }
                
                //this is an error check to make sure a user can't enter a 0 in the denominator
                if ([denominator isEqualToString:@"0"]) {
                    
                    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Math Error" message:@"you can't have a 0 in the denominator" delegate:self cancelButtonTitle:@"input again" otherButtonTitles:nil];
                    
                    [alert show];
                    break;
                }
                
                //get a fraction number from what the user inputted
                FractionalNumber* newFraction = [[FractionalNumber alloc]initWithNumerator:[numerator intValue] Denominator:[denominator intValue]];
                
                //based on what button was pressed, send to calc engine to preform
                if (buttonID == 10) {
                    newFraction = [calcBrain send:newFraction withOperator:@selector(add:)];
                }
                if (buttonID == 11) {
                    newFraction = [calcBrain send:newFraction withOperator:@selector(subtract:)];
                }
                if (buttonID == 12) {
                    newFraction = [calcBrain send:newFraction withOperator:@selector(divide:)];
                }
                if (buttonID == 13) {
                    newFraction = [calcBrain send:newFraction withOperator:@selector(multiply:)];
                }
                
                [newFraction reduce];
                
                //if the denominator is 1, we can just print out the numerator
                if (newFraction.denominator == 1) {
                    numerator = [NSString stringWithFormat:@"%d", newFraction.numerator];
                }
                else
                {
                    //checkst to see if we have an improper fraction or not
                    if (abs(newFraction.numerator) < newFraction.denominator) {
                        numerator = [NSString stringWithFormat:@"%d", newFraction.numerator];
                        denominator = [NSString stringWithFormat:@"%d", newFraction.denominator];
                        numerator = [numerator stringByAppendingString:@"/"];
                        numerator = [numerator stringByAppendingString:denominator];
                    }
                    else
                    {
                        numerator = [newFraction mixedFraction];
                    }
                    
                    
                }
                [Display setText:numerator];
            }
            
            //if we didn't find a '/' in the tempString, then we are just working with a whole number
            //we repeat many of the same steps as above
            else
            {
                FractionalNumber* newFraction = [[FractionalNumber alloc] initWithNumerator:[[Display text]intValue] Denominator:1];
                if (buttonID == 10) {
                    newFraction = [calcBrain send:newFraction withOperator:@selector(add:)];
                }
                if (buttonID == 11) {
                    newFraction = [calcBrain send:newFraction withOperator:@selector(subtract:)];
                }
                if (buttonID == 12) {
                    newFraction = [calcBrain send:newFraction withOperator:@selector(divide:)];
                }
                if (buttonID == 13) {
                    newFraction = [calcBrain send:newFraction withOperator:@selector(multiply:)];
                }

                [newFraction reduce];
                NSString* numerator = [NSString stringWithFormat:@"%d",newFraction.numerator];
                
                if (newFraction.denominator==1) {
                    [Display setText:numerator];
                }
                else
                {
                    if (abs(newFraction.numerator) < newFraction.denominator) {
                        NSString* denominator = [NSString stringWithFormat:@"%d",newFraction.denominator];
                        numerator = [numerator stringByAppendingString:@"/"];
                        numerator = [numerator stringByAppendingString:denominator];
                    }
                    else
                    {
                        numerator = [newFraction mixedFraction];
                    }
                    
                    [Display setText:numerator];
                }
            }
            
            break;
        }


        //AC button
        case 14:
        {
            
            [calcBrain setWaitingOperand:[[FractionalNumber alloc]initWithNumerator:0 Denominator:1]];
            [calcBrain setWaitingOperator:@selector(add:)];
            [Display setText:@"0"];
            break;
        }
            
        //denominator button
        case 15:
        {
            if (numeratorButton) {
                break;
            }
            denominatorButton = true;
            [tempString appendString:@"/"];
            [Display setText:tempString];
            break;
        }
        
        //numerator button
        case 16:
        {
            numeratorButton = true;
            [tempString appendString:@" "];
            [Display setText:tempString];
            break;
        }
            
        //eqaul sign
        //many of the steps involved for this button are similar to when the other operators are
        //except for that instead of calling the 'send:' method, we use the 'evaulate' method for the
        //calcBrain
            
        case 17:
        {
            if (numeratorButton) {
                break;
            }
            OperatorPressed = true;
            
            
            int fractionStringLoc = [tempString rangeOfString:@"/"].location;
            
            //if a fraction is found
            if (fractionStringLoc != NSNotFound) {
                NSString* numerator = [tempString substringToIndex:fractionStringLoc];
                NSString* denominator = [tempString substringFromIndex:fractionStringLoc+1];
                int spaceStringLoc = [numerator rangeOfString:@" "].location;
                if (spaceStringLoc != NSNotFound) {
                    NSString* wholeNumber = [numerator substringToIndex:spaceStringLoc];
                    numerator = [numerator substringFromIndex:spaceStringLoc+1];
                    numerator = [NSString stringWithFormat:@"%d",(([wholeNumber intValue]*[denominator intValue])+[numerator intValue])];
                    
                }
                
                
                FractionalNumber* newFraction = [[FractionalNumber alloc]initWithNumerator:[numerator intValue] Denominator:[denominator intValue]];
                
                //we won't have a new fraction to send once we press '=', based on how this calc
                //is currently setup, this was the fasted/easiest way to do this
                newFraction = [calcBrain evaluate:newFraction];
                
                [newFraction reduce];
                               
                if (newFraction.denominator == 1) {
                    numerator = [NSString stringWithFormat:@"%d", newFraction.numerator];
                }
                else
                {
                    if (abs(newFraction.numerator) < newFraction.denominator) {
                        numerator = [NSString stringWithFormat:@"%d", newFraction.numerator];
                        denominator = [NSString stringWithFormat:@"%d", newFraction.denominator];
                        numerator = [numerator stringByAppendingString:@"/"];
                        numerator = [numerator stringByAppendingString:denominator];
                    }
                    else
                    {
                        numerator = [newFraction mixedFraction];
                    }
                    
                    
                }
                [Display setText:numerator];
            }
            else
            {
                FractionalNumber* newFraction = [[FractionalNumber alloc] initWithNumerator:[[Display text]intValue] Denominator:1];
                newFraction = [calcBrain evaluate:newFraction];
                [newFraction reduce];
                NSString* numerator = [NSString stringWithFormat:@"%d",newFraction.numerator];
                
                if (newFraction.denominator==1) {
                    [Display setText:numerator];
                }
                else
                {
                    if (abs(newFraction.numerator) < newFraction.denominator) {
                        NSString* denominator = [NSString stringWithFormat:@"%d",newFraction.denominator];
                        numerator = [numerator stringByAppendingString:@"/"];
                        numerator = [numerator stringByAppendingString:denominator];
                    }
                    else
                    {
                        numerator = [newFraction mixedFraction];
                    }
                    
                    [Display setText:numerator];
                }
            }
            //since we pressed the '=', we should reset the waiting operand and operator in the CalcEngine
            //so that way, once the result is displayed, we can press any other operator to continue using
            //the result or we can press numbers to start a new set of calculations
            [calcBrain setWaitingOperand:[[FractionalNumber alloc]initWithNumerator:0 Denominator:1]];
            [calcBrain setWaitingOperator:@selector(add:)];
             
             
            break;
        }
            
            
        
        //square root button
        case 18:
        {
            //since the square root button is not implemented, then a message will pop up alerting the user
            UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"hello" message:@"that's not possible" delegate:self cancelButtonTitle:@"stop" otherButtonTitles:nil];
            
            [alert show];
            break;
        }
        
        //code for the +/-
        case 19:
            if ([tempString isEqualToString:@"0"]) {
                tempString = [NSMutableString stringWithString:@""];
            }
            if (!signButton) {
                NSString* signString = @"-";
                signString = [signString stringByAppendingString:tempString];
                signButton = true;
                [Display setText:signString];
                break;
                
            }
            else
            {
                [tempString replaceOccurrencesOfString:@"-" withString:@"" options:NSLiteralSearch range:NSMakeRange(0, [tempString length])];
                signButton = false;
                [Display setText:tempString];
                break;
            }
            
            
        default:
            break;
    }
    
}


@end
