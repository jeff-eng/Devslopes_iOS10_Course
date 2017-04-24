//
//  XYZPerson.h
//  OBJC-Classes Exercise
//
//  Created by Jeffrey Eng on 4/24/17.
//  Copyright © 2017 Jeffrey Eng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XYZPerson : NSObject

@property NSString *firstName;
@property NSString *lastName;
@property NSDate *dateOfBirth;

- (void)sayHello;
+ (void)person;

@end
