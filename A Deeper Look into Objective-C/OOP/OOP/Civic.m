//
//  Honda.m
//  OOP
//
//  Created by Jeffrey Eng on 4/20/17.
//  Copyright © 2017 Jeffrey Eng. All rights reserved.
//

#import "Civic.h"

@implementation Civic

-(id)init {
    if (self = [super init]) {
        
    }
    
    [self drive];
    return self;
}


// Create a function
-(void)test {
    self.make = @"Honda";
    self.model = @"Civic";
    
    // Calling the drive method inherited from the parent class
    [self drive];
}

// Overriding the parent class's drive method and customizing it for this subclass
-(void)drive {
    // Customize the drive method inherited from the superclass Vehicle
    NSLog(@"Drive from subclass");
    
    // We can also call the superclass' implementation of the drive method
    [super drive];
}
@end
