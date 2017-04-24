//
//  School.m
//  Strong v Weak Retain Cycles
//
//  Created by Jeffrey Eng on 4/24/17.
//  Copyright © 2017 Jeffrey Eng. All rights reserved.
//

#import "School.h"
#import "Person.h"

@implementation School

- (void)initData {
    self.student = [[Person alloc] init];
    [self.student initData];
    
    // This dummy pulled a prank, and is getting kicked out of school
    self.student = nil;
}

@end
