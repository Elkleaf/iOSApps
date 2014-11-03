//
//  GraphViewController.h
//  DiscountCalc
//
//  Created by Matthew Elko on 9/28/14.
//  Copyright (c) 2014 Elko, Matt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyGraphView.h"


@interface GraphViewController : UIViewController
@property float discountPercent;
@property float taxRate;
@property float finalPrice;
@property float discountPrice;
@property (weak, nonatomic) IBOutlet UILabel *FullPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *DiscountPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *SavingsLabel;
@property (weak, nonatomic) IBOutlet UILabel *TaxLabel;
@property (weak, nonatomic) IBOutlet UILabel *smallPriceLabel;
@end
