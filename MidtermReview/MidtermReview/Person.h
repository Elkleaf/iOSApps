//
//  Person.h
//  MidtermReview
//
//  Created by Matthew Elko on 10/14/14.
//  Copyright (c) 2014 Elko, Matt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    NSString* _firstname;
    NSString* _lastname;
    NSDate* _birthday;
}
-(id) initWithFirstname: (NSString*) firstname andLastname: (NSString*) lastname; -(NSDate*) birthday;
-(void) setBirthday: (NSDate*)aDay;
-(NSString*) firstname;
-(void) setFirstname: (NSString*) firstname; -(NSString*) lastname;
-(void) setLastname: (NSString*) lastname;
@property (nonatomic, retain) NSDate* birthday;
@property (nonatomic, retain) NSString* firstname;
@property (nonatomic, retain) NSString* lastname; 
@end
