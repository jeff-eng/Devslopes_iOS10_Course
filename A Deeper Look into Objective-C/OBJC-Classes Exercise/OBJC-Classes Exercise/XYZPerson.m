//
//  XYZPerson.m
//  OBJC-Classes Exercise
//
//  Created by Jeffrey Eng on 4/24/17.
//  Copyright © 2017 Jeffrey Eng. All rights reserved.
//

#import "XYZPerson.h"

@implementation XYZPerson

- (void)sayHello {
    [self saySomething:@"Hello governor!"];
}

- (void)sayGoodbye {
    [self saySomething:@"Goodbye!"];
}

- (void)sayExcuseMe {
    [self saySomething:@"Excuse me..."];
}

- (void)saySomething:(NSString *)greeting {
    NSLog(@"%@", greeting);
}

// Class Factory method
+ (id)person {
     return [[self alloc] init];
}
@end
