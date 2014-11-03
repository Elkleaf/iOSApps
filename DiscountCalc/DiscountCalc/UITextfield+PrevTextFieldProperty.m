//
//  UITextField+PrevTextFieldProperty.h
//
//  Created by Matthew Elko on 9/28/14.
//  Copyright (c) 2014 Matthew Elko. All rights reserved.
//

#import "UITextField+PrevTextFieldProperty.h"
#import <objc/runtime.h>

static Byte defaultHashKey;

@implementation UITextField (prevTextFieldProperty)

-(UITextField*) prevTextField
{
    return objc_getAssociatedObject( self, &defaultHashKey );
}

-(void) setPrevTextField: (UITextField *)prevTextField
{
    objc_setAssociatedObject( self, &defaultHashKey, prevTextField,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC );
}

@end
