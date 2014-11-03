//
//  Person.m
//  MidtermReview
//
//  Created by Matthew Elko on 10/14/14.
//  Copyright (c) 2014 Elko, Matt. All rights reserved.
//

#import "Person.h"

@implementation Person
-(id) initWithFirstname: (NSString*) firstname andLastname: (NSString*) lastname
{
    self = [super init];
    if (self != NULL) {
        _firstname = firstname;
        _lastname = lastname;
        
    }
    return self;
}

-(void) setBirthday: (NSDate*)aDay
{
    _birthday = aDay;
}

-(NSString*) firstname
{
    return _firstname;
}

-(void) setFirstname: (NSString*) firstname;

{
    _firstname = firstname;
    
}

-(NSString*) lastname
{
    return _lastname;
}


@end
