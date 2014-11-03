//
//  PriceTag.m
//  DiscountCalc
//
//  Created by Matthew Elko on 9/29/14.
//  Copyright (c) 2014 Elko, Matt. All rights reserved.
//

#import "PriceTag.h"
static PriceTag* _priceTag;
@implementation PriceTag
@synthesize price;
@synthesize discount;
@synthesize dollarsOff;
@synthesize taxRate;
@synthesize extraDiscount;

+(PriceTag*)priceTag
{
    
    if(_priceTag ==nil)
    {
        _priceTag = [[PriceTag alloc]init];
    }
    
    return _priceTag;
}

-(NSNumber*)discountedPrice
{
    
    float oriPrice = [price floatValue];
    float tax =  oriPrice * ([taxRate floatValue]/100.0);
    float firstDisc = oriPrice * ([discount floatValue]/100.0);
    float secondDisc = (oriPrice - firstDisc)*([extraDiscount floatValue]/100.0);
    float dollars = [dollarsOff floatValue];
    float finalPrice = MAX(oriPrice + tax - firstDisc - secondDisc - dollars, 0);
    
    return [NSNumber numberWithFloat:finalPrice];
}

-(NSNumber*)originalPrice
{
    return [NSNumber numberWithFloat:(([price floatValue]*([taxRate floatValue]/100.0))+[price floatValue])];
}

@end
