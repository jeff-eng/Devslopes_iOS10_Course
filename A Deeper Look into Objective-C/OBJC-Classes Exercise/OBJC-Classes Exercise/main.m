//
//  main.m
//  OBJC-Classes Exercise
//
//  Created by Jeffrey Eng on 4/24/17.
//  Copyright © 2017 Jeffrey Eng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XYZPerson.h"
#import "XYZShoutingPerson.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // Create a new XYZPerson instance
        XYZPerson *person = [[XYZPerson alloc] init];
        // Call the sayHello method
        [person sayHello];
        
        // Call the other greetings
        [person sayExcuseMe];
        [person sayGoodbye];
        
        XYZShoutingPerson *shoutingPerson = [[XYZShoutingPerson alloc] init];
        [shoutingPerson saySomething:(@"Talk is cheap.")];
        
        XYZShoutingPerson *anotherShoutingPerson = [XYZShoutingPerson person];
        
        XYZPerson *person2;
        
        if (person2 == nil) {
            NSLog(@"person2 doesn't point to an object.");
        }
    }
    return 0;
}
