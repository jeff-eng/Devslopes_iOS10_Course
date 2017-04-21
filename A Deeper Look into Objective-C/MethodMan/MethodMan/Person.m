//
//  Person.m
//  MethodMan
//
//  Created by Jeffrey Eng on 4/21/17.
//  Copyright © 2017 Jeffrey Eng. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void)speakName {
    NSLog(@"My name is Khan!");
}

// Static Type method on the Person class uses the +
+ (void)stateSpecies {
    NSLog(@"I am a human...");
}

@end
