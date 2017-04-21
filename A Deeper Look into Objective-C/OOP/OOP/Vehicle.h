//
//  Vehicle.h
//  OOP
//
//  Created by Jeffrey Eng on 4/20/17.
//  Copyright © 2017 Jeffrey Eng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Vehicle : NSObject

@property (strong, nonatomic) NSString *make;
@property (strong, nonatomic) NSString *model;
@property (strong, nonatomic) NSString *engineSize;

-(void)drive;

@end
