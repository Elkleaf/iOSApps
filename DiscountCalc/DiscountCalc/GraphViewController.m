//
//  GraphViewController.m
//  DiscountCalc
//
//  Created by Matthew Elko on 9/28/14.
//  Copyright (c) 2014 Elko, Matt. All rights reserved.
//

#import "GraphViewController.h"
#import "MyGraphView.h"


@interface GraphViewController ()

@end

@implementation GraphViewController
@synthesize discountPercent;
@synthesize finalPrice;
@synthesize taxRate;
@synthesize DiscountPriceLabel;
@synthesize FullPriceLabel;
@synthesize discountPrice;
@synthesize SavingsLabel;
@synthesize TaxLabel;
@synthesize smallPriceLabel;
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
    
    //I still need to figure out how to get the total discount
    ((MyGraphView*)self.view).taxRate = self.taxRate;
    ((MyGraphView*)self.view).discountPercent = self.discountPercent;
    ((MyGraphView*)self.view).finalPrice = self.finalPrice;
    [self.view setNeedsDisplay];
    
    //swip gester for swiping back to the main view
    UISwipeGestureRecognizer* swipeLeftGestureRecognizer =
    [[UISwipeGestureRecognizer alloc] initWithTarget: self
                                              action: @selector(handleSwipeLeftFrom:)];
    swipeLeftGestureRecognizer.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer: swipeLeftGestureRecognizer];
    
    
    NSNumberFormatter* format = [[NSNumberFormatter alloc]init];
    [format setNumberStyle:NSNumberFormatterCurrencyStyle];
    //setting all the labels
    [DiscountPriceLabel setText:[format stringFromNumber:[NSNumber numberWithFloat:self.discountPrice]]];
    [FullPriceLabel setText:[format stringFromNumber:[NSNumber numberWithFloat:self.finalPrice]]];
    [SavingsLabel setText:[format stringFromNumber:[NSNumber numberWithFloat:(self.finalPrice - self.discountPrice)]]];
    [TaxLabel setText:[format stringFromNumber:[NSNumber numberWithFloat:self.taxRate* self.finalPrice]]];
    [smallPriceLabel setText:[format stringFromNumber:[NSNumber numberWithFloat:self.discountPrice]]];
}

- (void)handleSwipeLeftFrom:(UIGestureRecognizer*)recognizer {
    
    [self.navigationController popViewControllerAnimated:YES];

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    //[self.navigationController popViewControllerAnimated:YES];
}


@end
