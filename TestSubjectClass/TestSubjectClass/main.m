//
//  main.m
//  TestSubjectClass
//
//  Created by Matthew Elko on 9/15/14.
//  Copyright (c) 2014 Matthew Elko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Subject.h"



int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Subject* test = [Subject subject];
    
        
        NSLog(@"%@", test.description);
        
        [test setHeightinMetric:@1.7];
        [test setWeightinMetric:@70];
        NSLog(@"%@",[test bmiIndexString]);
        NSLog(@"the bmi is: %@", [test bmi]);
        
    }
    return 0;
}

