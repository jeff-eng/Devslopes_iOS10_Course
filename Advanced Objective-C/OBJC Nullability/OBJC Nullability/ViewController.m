//
//  ViewController.m
//  OBJC Nullability
//
//  Created by Jeffrey Eng on 4/24/17.
//  Copyright © 2017 Jeffrey Eng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)getName:(NSString * _Nonnull)name {
    
}

- (int)sumWithNumA:(nonnull NSNumber *)a numB:(nonnull NSNumber *)b {
    int theSum = a.intValue + b.intValue;
    return theSum;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self getName:nil];
    
    NSNumber *num1;
    NSNumber *num2;

    int sum = [self sumWithNumA:num1 numB:num2];
    
    NSLog(@"The sum: %d", sum);  // This will show zero b/c Obj-C treats null number values as zero
    
//    int sum = [self sumWithNumA:num1 numB:num2];
//    
//    if (num1 && num2) {
//        NSLog(@"Sum: %d", sum);
//    } else {
//        NSLog(@"These are null!");
//    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
