//
//  UITextField+NextTextFieldProperty.m
//
//  Created by Matthew Elko on 9/28/14.
//  Copyright (c) 2014 Matthew Elko. All rights reserved.
//

#import "UITextField+NextTextFieldProperty.h"
#import <objc/runtime.h>

static Byte defaultHashKey;

@implementation UITextField (NextTextFieldProperty)

-(UITextField*) nextTextField
{
    return objc_getAssociatedObject( self, &defaultHashKey );
}

-(void) setNextTextField: (UITextField *)nextTextField
{
    objc_setAssociatedObject( self, &defaultHashKey, nextTextField,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC );
}

@end
