//
//  DisplayView.m
//  FractionalCalc
//
//  Created by Matthew Elko on 10/30/14.
//  Copyright (c) 2014 Elko, Matt. All rights reserved.
//

#import "DisplayView.h"

@implementation DisplayView

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
        
        
		self.opaque = YES;
		self.clearsContextBeforeDrawing = YES;
    }
    return self;
}



// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    //x origin is 20, y is 43
    //width is 286 and height is 120
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetRGBFillColor(context, 0.0, 0.6, 1.0, 1.0);
    CGContextAddRect(context, CGRectMake(40.0, 50.0, 60.0, 40.0));
    CGContextStrokePath(context);
    CGContextFillRect(context, CGRectMake(40.0, 50.0, 60.0, 40.0));
    // Drawing code
}


@end
