//
//  Honda.h
//  Categories
//
//  Created by Jeffrey Eng on 4/25/17.
//  Copyright © 2017 Jeffrey Eng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Honda : NSObject

@property (strong, nonatomic) NSString *model;
@property (strong, nonatomic) NSNumber *miles;
- (void)increaseMilesToOdometer;
- (void)drive;

@end
