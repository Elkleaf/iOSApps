//
//  PriceTag.h
//  DiscountCalc
//
//  Created by Matthew Elko on 9/29/14.
//  Copyright (c) 2014 Elko, Matt. All rights reserved.
//

#import <Foundation/Foundation.h>


//how many models?
//should we make a model for the ISO?
//what attributes would they have?

//how to add the delegate and make it format the decimal input
//how to implement the scroll view
//do we have to include the "Nexttextfield.h" to our project if we wanted to
//use pointers to go between textfields //this was used as a 'CAtegory'

//is my textfield visible? use scrollView to overcome this
//how do I move to the next textfield? using the category that was defined in the example

//deal with the protocol of the textfield so it inputs like a cashregister
//price
//taxRate
//discountRate
//extraDiscountRate
//dollarsOff
@interface PriceTag : NSObject
@property (retain, nonatomic)NSNumber* price;
@property (retain,nonatomic)NSNumber* discount;
@property (retain, nonatomic)NSNumber* dollarsOff;
@property (retain, nonatomic)NSNumber* taxRate;
@property (retain, nonatomic)NSNumber* extraDiscount;
@property (readonly, nonatomic)NSNumber* originalPrice;
@property (readonly, nonatomic)NSNumber* discountedPrice;


+(PriceTag*)priceTag;
-(NSNumber*)discountedPrice;
-(NSNumber*)originalPrice;


@end
