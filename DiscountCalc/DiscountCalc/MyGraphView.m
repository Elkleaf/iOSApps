//
//  MyGraphView.m
//  DiscountCalc
//
//  Created by Matthew Elko on 9/30/14.
//  Copyright (c) 2014 Elko, Matt. All rights reserved.
//

#import "MyGraphView.h"

@implementation MyGraphView
@synthesize discountPercent;
@synthesize finalPrice;
@synthesize taxRate;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    NSLog(@"initWithCoder");
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Initialization code
        
        self.taxRate = 0.0;
        self.discountPercent=0.0;
        self.finalPrice =0.0;
		self.opaque = YES;
		self.clearsContextBeforeDrawing = YES;
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    //my original measurements were (20.0, 168.0, 100.0, 400.0)
    
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetRGBFillColor(context, 0.0, 0.6, 1.0, 1.0);
    CGContextAddRect(context, CGRectMake(40.0, 138.0, 100.0, 350.0));
    CGContextStrokePath(context);
    CGContextFillRect(context, CGRectMake(40.0, 138.0, 100.0, 350.0));
    
    
    //this is the total discount rectangle
    //it starts where the static rectangle starts
    CGContextSetRGBFillColor(context, 1.0, 1.0, .5, 1.0);
    CGContextAddRect(context, CGRectMake(195, 138, 100.0, (350.0*discountPercent)));
    CGContextStrokePath(context);
    CGContextFillRect(context, CGRectMake(195, 138, 100.0, (350.0*discountPercent)));
    
    //this is the tax rectangle
    //this rectangle has to start where the previous one ended
    //and its height has to be a percentage of the static graph
    CGContextSetRGBFillColor(context, 0.0, 1.0, 0.0, 1.0);
    CGContextAddRect(context, CGRectMake(195, (138+(350.0*discountPercent)), 100.0, (350.0*taxRate)));
    CGContextStrokePath(context);
    CGContextFillRect(context, CGRectMake(195, (138+(350.0*discountPercent)), 100.0, (350.0*taxRate)));
    
    //this is the final price rectangle
    CGContextSetRGBFillColor(context, 0.0, 0.6, 1.0, 1.0);
    CGContextAddRect(context, CGRectMake(195, ((138+(350.0*discountPercent))+(350.0*taxRate)), 100.0, (350.0 -((350.0*discountPercent) + (350.0*taxRate)))));
    CGContextStrokePath(context);
    CGContextFillRect(context, CGRectMake(195, ((138+(350.0*discountPercent))+(350.0*taxRate)), 100.0, (350.0 -((350.0*discountPercent) + (350.0*taxRate)))));
    
    //small box to represent the discount color on the graph
    CGContextSetRGBFillColor(context, 1.0, 1.0, .5, 1.0);
    CGContextAddRect(context, CGRectMake(40, 500, 15, 15));
    CGContextStrokePath(context);
    CGContextFillRect(context, CGRectMake(40, 500, 15, 15));
    
    //small box to represent the tax color on the graph
    CGContextSetRGBFillColor(context, 0.0, 1.0, 0.0, 1.0);
    CGContextAddRect(context, CGRectMake(40, 520, 15, 15));
    CGContextStrokePath(context);
    CGContextFillRect(context, CGRectMake(40, 520, 15, 15));
    
    CGContextSetRGBFillColor(context, 0.0, 0.6, 1.0, 1.0);
    CGContextAddRect(context, CGRectMake(40, 540, 15, 15));
    CGContextStrokePath(context);
    CGContextFillRect(context, CGRectMake(40, 540, 15, 15));
    
}


@end
