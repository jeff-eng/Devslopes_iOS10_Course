//
//  Person.m
//  OBJC Initializers
//
//  Created by Jeffrey Eng on 4/24/17.
//  Copyright © 2017 Jeffrey Eng. All rights reserved.
//

#import "Person.h"

@implementation Person

// Designated initializer
- (id)initWithFirstName:(NSString*)first lastName:(NSString*)last {
    self.firstName = first;
    self.lastName = last;
    
    // Calls the initializer of the parent class which is NSObject
//    self = [super init];
    
    return [self initWithAge:52];
}

- (id)initWithAge:(NSInteger)age {
    self = [super init];
    
    return self;
}

- (void)printName {
    NSLog(@"%@ %@", self.firstName, self.lastName);
}

@end
