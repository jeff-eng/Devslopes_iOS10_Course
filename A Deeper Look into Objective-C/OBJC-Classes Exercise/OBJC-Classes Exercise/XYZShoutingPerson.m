//
//  XYZShoutingPerson.m
//  OBJC-Classes Exercise
//
//  Created by Jeffrey Eng on 4/26/17.
//  Copyright © 2017 Jeffrey Eng. All rights reserved.
//

#import "XYZShoutingPerson.h"
#import "XYZPerson.h"

@implementation XYZShoutingPerson

- (void)saySomething:(NSString *)greeting {
    NSString *uppercaseGreeting = [greeting uppercaseString];
    // Override the superclass implementation
    [super saySomething:uppercaseGreeting];
}

@end
