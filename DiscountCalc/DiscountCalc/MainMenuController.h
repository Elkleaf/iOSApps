//
//  MainMenuController.h
//  DiscountCalc
//
//  Created by Matthew Elko on 9/28/14.
//  Copyright (c) 2014 Elko, Matt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainMenuController : UIViewController<UITextFieldDelegate, UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIButton *CalcButton;
@property (weak, nonatomic) IBOutlet UITextField *PriceTf;
@property (weak, nonatomic) IBOutlet UITextField *DollarsOffTf;
@property (weak, nonatomic) IBOutlet UITextField *DiscountTf;
@property (weak, nonatomic) IBOutlet UITextField *AdditionalDiscTf;
@property (weak, nonatomic) IBOutlet UITextField *TaxTf;
@property (weak, nonatomic) IBOutlet UIScrollView *Scroller;
@property (weak, nonatomic) IBOutlet UILabel *originalPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *DiscountLabel;


@property (weak, nonatomic) UITextField* activeTF;



- (IBAction)calculateButtonPressed:(id)sender;


@end
