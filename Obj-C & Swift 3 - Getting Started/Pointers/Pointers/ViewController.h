//
//  ViewController.h
//  Pointers
//
//  Created by Jeffrey Eng on 4/19/17.
//  Copyright © 2017 Jeffrey Eng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

// The * denotes a pointer; a pointer holds a reference to a specific location in memory
@property (strong, nonatomic) NSString *name;
// Native types such as integers don't require a pointer
@property (nonatomic) int age;
@property (nonatomic) NSInteger debt;
@property (nonatomic) NSNumber *bankBalance;

@end

