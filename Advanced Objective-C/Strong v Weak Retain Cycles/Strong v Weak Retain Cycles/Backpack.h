//
//  Backpack.h
//  Strong v Weak Retain Cycles
//
//  Created by Jeffrey Eng on 4/24/17.
//  Copyright © 2017 Jeffrey Eng. All rights reserved.
//

#import <Foundation/Foundation.h>
@ class Person;


@interface Backpack : NSObject

@property (weak, nonatomic) Person *owner;

@end
