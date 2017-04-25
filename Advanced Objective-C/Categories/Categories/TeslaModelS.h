//
//  TeslaModelS.h
//  Categories
//
//  Created by Jeffrey Eng on 4/25/17.
//  Copyright © 2017 Jeffrey Eng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TeslaModelS : NSObject

@property BOOL ludicrousModeUnlocked;
@property (strong, nonatomic) NSNumber *electricRange;
@property BOOL dualMotor;

- (void)drive;
- (void)enableAutoPilot;

@end
