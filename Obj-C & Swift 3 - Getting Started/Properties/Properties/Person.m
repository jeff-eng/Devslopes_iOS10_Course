//
//  Person.m
//  Properties
//
//  Created by Jeffrey Eng on 4/19/17.
//  Copyright © 2017 Jeffrey Eng. All rights reserved.
//

#import "Person.h"

@implementation Person

-(void)test {
    self.firstName = @"Bob";
    
    _firstName = @"Jack";
    
    isInsecure = YES;
    
    // Setter for our property
    [self setLastName:@"Davis"];
    
    
    // Getter - retrieves the value of the property and assign to variable called 'name'
    NSString *name = [self firstName];
}

@end
