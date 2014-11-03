//
//  main.m
//  AssignmentA
//
//  Created by Matthew Elko on 9/1/14.
//  Copyright (c) 2014 Matthew Elko. All rights reserved.
//

#import <Foundation/Foundation.h>


int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        //NSFileHandle *input = [NSFileHandle fileHandleWithStandardInput];
        NSFileHandle *input =[NSFileHandle fileHandleWithStandardInput];
        NSLog(@"please enter a string...");
        NSData *data =[input availableData];
        NSDate *today = [NSDate date];
        NSString *answer = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        
        NSDateFormatter *formater = [[NSDateFormatter alloc]init];
        [formater setDateFormat:@"MM-dd-yy h:mm:ss"];
        NSString *current_date = [formater stringFromDate:today];
        
        NSLog(@"your string...%@",answer);
    
        NSLog(@"today's date: %@",current_date);
        
        
    }
    return 0;
}

