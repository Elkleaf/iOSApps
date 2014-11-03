//
//  MainMenuController.m
//  DiscountCalc
//
//  Created by Matthew Elko on 9/28/14.
//  Copyright (c) 2014 Elko, Matt. All rights reserved.
//

#import "MainMenuController.h"
#import "GraphViewController.h"
#import "UITextField+NextTextFieldProperty.h"
#import "UITextfield+PrevTextFieldProperty.h"
#import "PriceTag.h"

@interface MainMenuController ()

@end

@implementation MainMenuController

@synthesize PriceTf;
@synthesize DiscountTf;
@synthesize DollarsOffTf;
@synthesize TaxTf;
@synthesize AdditionalDiscTf;
@synthesize Scroller;
@synthesize CalcButton;
@synthesize originalPriceLabel;
@synthesize DiscountLabel;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(id)initWithCoder:(NSCoder *)aDecoder{
    
    
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Initialization code
        
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [Scroller setScrollEnabled:YES];
    //[scroller setContentSi]
    
    //setting the next text fields
    [PriceTf setNextTextField:DollarsOffTf];
    [DollarsOffTf setNextTextField:DiscountTf];
    [DiscountTf setNextTextField:AdditionalDiscTf];
    [AdditionalDiscTf setNextTextField:TaxTf];
    [TaxTf setNextTextField:PriceTf];
    
    //setting the previous text fields
    [PriceTf setPrevTextField:TaxTf];
    [DollarsOffTf setPrevTextField:PriceTf];
    [DiscountTf setPrevTextField:DollarsOffTf];
    [AdditionalDiscTf setPrevTextField:DiscountTf];
    [TaxTf setPrevTextField:AdditionalDiscTf];
    
    //create a tap gesture recognizer to add to the scroll view so it can detect screen taps
    //to dimiss the keyboard
    UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyBoard)];
    tap.cancelsTouchesInView = NO;
    
    [Scroller addGestureRecognizer:tap];
    
    [CalcButton setEnabled:NO];
    

}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




-(void)hideKeyBoard
{
    
    
    
    if ([PriceTf isFirstResponder])
    {
        [PriceTf resignFirstResponder];
    }
    else if ([DollarsOffTf isFirstResponder])
    {
        [DollarsOffTf resignFirstResponder];
    }
    else if ([DiscountTf isFirstResponder])
    {
        [DiscountTf resignFirstResponder];
    }
    else if ([AdditionalDiscTf isFirstResponder])
    {
        [AdditionalDiscTf resignFirstResponder];
    }
    else if ([TaxTf isFirstResponder])
    {
        [TaxTf resignFirstResponder];
    }
    
    
    
    
}


//next button clicked
- (void)nextClicked: (UIBarButtonItem*) sender
{
    UITextField* next = self.activeTF.nextTextField;
    [self.activeTF setNextTextField:next];
    
    if (next) {
        [next becomeFirstResponder];
    }
}

//previous button clicked
-(void)prevClicked: (UIBarButtonItem*) sender
{
    UITextField* prev = self.activeTF.prevTextField;
    [self.activeTF setPrevTextField:prev];
    
    if (prev) {
        [prev becomeFirstResponder];
    }
}

//done button clicked
- (void) doneClicked: (UIBarButtonItem*) sender
{
    
    [self.activeTF resignFirstResponder];
}


- (BOOL)textField:(UITextField*)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString*)string
{
    NSInteger MAX_DIGITS = 11; // $999,999,999.99
    
    //if you are etnering into a textfield that will contain currency
    if (textField == PriceTf || textField == DollarsOffTf)
    {
        
        NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
        [numberFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];
        
        //copy recently entered string into a temporary string
        NSString *stringMaybeChanged = [NSString stringWithString:string];
        
        //copy the text in the textfield into a mutable string
        NSMutableString *textFieldTextStr = [NSMutableString stringWithString:textField.text];
        
        //adds the recently entered string into to the textfield string
        [textFieldTextStr replaceCharactersInRange:range withString:stringMaybeChanged];
        
        //strip the '$', '%' and the ',' from the string
        [textFieldTextStr replaceOccurrencesOfString:@"$"
                                          withString:@""
                                             options:NSLiteralSearch
                                               range:NSMakeRange(0, [textFieldTextStr length])];
        
        [textFieldTextStr replaceOccurrencesOfString:@","
                                          withString:@""
                                             options:NSLiteralSearch
                                               range:NSMakeRange(0, [textFieldTextStr length])];
        
        [textFieldTextStr replaceOccurrencesOfString:@"."
                                          withString:@""
                                             options:NSLiteralSearch
                                               range:NSMakeRange(0, [textFieldTextStr length])];
        //when we enter up the the max digits limit
        if (textFieldTextStr.length <= MAX_DIGITS)
        {
            //convert the text field string into a decimal number to do arithmetic on
            NSDecimalNumber *textFieldTextNum = [NSDecimalNumber decimalNumberWithString:textFieldTextStr];
            NSDecimalNumber *divideByNum = [[[NSDecimalNumber alloc] initWithInt:10] decimalNumberByRaisingToPower:2];
            NSDecimalNumber *textFieldTextNewNum = [textFieldTextNum decimalNumberByDividingBy:divideByNum];
            
            //convert newly formed decimal into string
            NSString *textFieldTextNewStr = [numberFormatter stringFromNumber:textFieldTextNewNum];
            
            textField.text = textFieldTextNewStr;
            
        }
        

    }
    
    //else you are entering percentages
    else
    {
        NSNumberFormatter* formatter = [[NSNumberFormatter alloc] init];
        [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
        
        //copy the recently entered character into another string
        NSString *stringMaybeChanged = [NSString stringWithString:string];
        
        //copy the textfield.text into a mutable string to perform operations on
        NSMutableString *textFieldText = [NSMutableString stringWithString:textField.text];
        
        
       //take out the '%' symbol
        [textFieldText replaceOccurrencesOfString:@"%" withString:@"" options:NSLiteralSearch range:NSMakeRange(0, [textFieldText length])];

        
        if ([stringMaybeChanged isEqual:@""]) {
            if (textFieldText.length !=0) {
                [textFieldText replaceCharactersInRange:NSMakeRange([textFieldText length]-1, 1) withString:stringMaybeChanged];
            }
        }
        else{
                [textFieldText appendString:stringMaybeChanged];
            }

        NSString *percentString = [NSString stringWithFormat:@"%@%%", textFieldText];
        
        if (textFieldText.length <=3) {
            textField.text = percentString;
        }
        
        
    }
        return NO;
}



-(void)textFieldDidBeginEditing:(UITextField *)textField{
    
    //scroll's origin is (17,68)
    //when you begin to edit a textfield, the scroller will adjust accordingly
    CGPoint scrollPoint = CGPointMake(0, textField.frame.origin.y-150);
    [Scroller setContentOffset:scrollPoint animated:YES];
    

    
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    
    //return the scroller offset back to the original frame
    [Scroller setContentOffset:CGPointZero animated:YES];

    if (textField.text.length ==0 || [textField.text  isEqual: @"$0.00"] || [textField.text isEqual:@"0%"]) {
        [CalcButton setEnabled:NO];
    }
    else{
        [CalcButton setEnabled:YES];
    }
}


-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    self.activeTF = textField;
   
    UIToolbar *toolbar = [[UIToolbar alloc] init];
    [toolbar sizeToFit];
    
    UIBarButtonItem *prevButton = [[UIBarButtonItem alloc]
                                   initWithTitle: @"Previous"
                                   style: UIBarButtonItemStyleDone
                                   target: self
                                   action:@selector(prevClicked:)];
    
    UIBarButtonItem *nextButton = [[UIBarButtonItem alloc]
                                   initWithTitle: @"Next"
                                   style: UIBarButtonItemStyleDone
                                   target: self
                                   action:@selector(nextClicked:)];
    
    UIBarButtonItem *flexButton = [[UIBarButtonItem alloc]
                                   initWithBarButtonSystemItem: UIBarButtonSystemItemFlexibleSpace
                                   target: self
                                   action: nil];
    
    UIBarButtonItem *doneButton =[[UIBarButtonItem alloc]
                                  initWithBarButtonSystemItem: UIBarButtonSystemItemDone
                                  target: self
                                  action: @selector(doneClicked:)];
    
    NSArray* itemsArray = @[prevButton, nextButton, flexButton, doneButton];
    
    [toolbar setItems: itemsArray];
    
    [textField setInputAccessoryView: toolbar];
    
    return YES;
 
    
    
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    //getting the full price and discounted price
    NSMutableString* finalPriceString = [NSMutableString stringWithString:originalPriceLabel.text];
    NSMutableString* finalDiscountString = [NSMutableString stringWithString:DiscountLabel.text];
    
    //taking out the '$'  and any ',' from the strings so we can do operations on it
    [finalPriceString replaceOccurrencesOfString:@"$" withString:@"" options:NSLiteralSearch range:NSMakeRange(0, [finalDiscountString length])];
    [finalPriceString replaceOccurrencesOfString:@"," withString:@"" options:NSLiteralSearch range:NSMakeRange(0, [finalPriceString length])];
    [finalDiscountString replaceOccurrencesOfString:@"$" withString:@"" options:NSLiteralSearch range:NSMakeRange(0, [finalDiscountString length])];
    [finalDiscountString replaceOccurrencesOfString:@"," withString:@"" options:NSLiteralSearch range:NSMakeRange(0, [finalDiscountString length])];
    
    //get the segue destination and sending the required information to the graphcontroller
    GraphViewController *gvc = (GraphViewController*)[segue destinationViewController];
    gvc.taxRate = [TaxTf.text floatValue]/100.0;
    gvc.finalPrice = [finalPriceString floatValue];
    gvc.discountPercent = ([finalPriceString floatValue] - [finalDiscountString floatValue])/[finalPriceString floatValue];
    gvc.discountPrice = [finalDiscountString floatValue];
   
    
}


- (IBAction)calculateButtonPressed:(id)sender {
    
    //create a new priceTag to perform calculations
    PriceTag* newPrice = [PriceTag priceTag];
    NSNumberFormatter* stringformatter = [[NSNumberFormatter alloc]init];
    [stringformatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    
    NSNumberFormatter* formatter = [[NSNumberFormatter alloc]init];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    
    //creating temporary mustable strings to strip the texts of the '$' and store them
    //into a NSNumber object
    NSMutableString *tempPrice = [NSMutableString stringWithString:PriceTf.text];
    NSMutableString *tempDollarsOff = [NSMutableString stringWithString:DollarsOffTf.text];
    NSMutableString *tempDiscount = [NSMutableString stringWithString:DiscountTf.text];
    NSMutableString *tempExtraDisc = [NSMutableString stringWithString:AdditionalDiscTf.text];
    NSMutableString *tempTax = [NSMutableString stringWithString:TaxTf.text];
    
    //removing '$' from textfields
    [tempPrice replaceOccurrencesOfString:@"$" withString:@"" options:NSLiteralSearch range:NSMakeRange(0, [tempPrice length])];
    [tempDollarsOff replaceOccurrencesOfString:@"$" withString:@"" options:NSLiteralSearch range:NSMakeRange(0, [tempDollarsOff length])];
    
    //removing the '%' from precentages
    [tempDiscount replaceOccurrencesOfString:@"%" withString:@"" options:NSLiteralSearch range:NSMakeRange(0, [tempDiscount length])];
    [tempExtraDisc replaceOccurrencesOfString:@"%" withString:@"" options:NSLiteralSearch range:NSMakeRange(0, [tempExtraDisc length])];
    [tempTax replaceOccurrencesOfString:@"%" withString:@"" options:NSLiteralSearch range:NSMakeRange(0, [tempTax length])];
    
    //converting the values in the temp mutable strings into NSNumber objects
    NSNumber* price = [formatter numberFromString:tempPrice];
    NSNumber* tax = [formatter numberFromString:tempTax];
    NSNumber* discount = [formatter numberFromString:tempDiscount];
    NSNumber* dollarsOff = [formatter numberFromString:tempDollarsOff];
    NSNumber* extraDisc = [formatter numberFromString:tempExtraDisc];
    NSLog(@"priceBefore: %@", price);
    NSLog(@"the discount is: %@",discount);
    
    
    //setting the properties of the newPrice
    [newPrice setPrice:price];
    [newPrice setTaxRate:tax];
    [newPrice setDiscount:discount];
    [newPrice setDollarsOff:dollarsOff];
    [newPrice setExtraDiscount:extraDisc];
    
    //converting the calculated prices into strings
    NSString* originalPriceString = [stringformatter stringFromNumber:[newPrice originalPrice]];
    NSString* discountPriceString = [stringformatter stringFromNumber:[newPrice discountedPrice]];
    
    
    
    NSLog(@"price: %@", originalPriceString);
    NSLog(@"discount: %@", discountPriceString);
    
    //setting the labels to contain the calculations
    [originalPriceLabel setText:originalPriceString];
    [DiscountLabel setText:discountPriceString];
    
    
    
}

@end
