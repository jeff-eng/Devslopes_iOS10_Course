//
//  Person.h
//  OBJC Initializers
//
//  Created by Jeffrey Eng on 4/24/17.
//  Copyright © 2017 Jeffrey Eng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (strong, nonatomic) NSString *firstName;
@property (strong, nonatomic) NSString *lastName;

- (id)initWithFirstName:(NSString*)first lastName:(NSString*)last;

- (void)printName;

@end
