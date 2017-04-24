//
//  Person.m
//  Strong v Weak Retain Cycles
//
//  Created by Jeffrey Eng on 4/24/17.
//  Copyright © 2017 Jeffrey Eng. All rights reserved.
//

#import "Person.h"
#import "Backpack.h"

@implementation Person

- (void) initData {
    self.backpack = [[Backpack alloc] init];
    self.backpack.owner = self;
}

@end
