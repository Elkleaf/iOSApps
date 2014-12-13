//
//  TiledPDFView.h
//
//  Created by Matthew Elko on 11/29/14.
//  Copyright (c) 2014 Elko, Matt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface TiledPDFView : UIView
{
  CGPDFPageRef _pdfPage;
  CGFloat _myScale;
}

@property (assign) CGPDFPageRef pdfPage;
@property (assign) CGFloat myScale;


- (id)initWithFrame:(CGRect)frame scale:(CGFloat)scale;
- (void)setPage:(CGPDFPageRef)newPage;

@end
