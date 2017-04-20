//
//  ViewController.m
//  MountainMath
//
//  Created by Jeffrey Eng on 4/20/17.
//  Copyright © 2017 Jeffrey Eng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Native C types
    int imAnInt = 5;
    float imAFloat = 4.3;
    double iAmTheDouble = 4.7474;
    
    NSLog(@"Int: %d", imAnInt);
    NSLog(@"Float: %f", imAFloat);
    NSLog(@"Double: %f", iAmTheDouble);
    
    // Use NSNumber when working with values you want to store
    NSNumber *numInt = [NSNumber numberWithInt:5];
    NSNumber *numInt2 = [NSNumber numberWithInt:6];
    
    int val = numInt.intValue;
    int val2 = numInt2.intValue;
    
    int sum = val + val2;
    
    NSLog(@"Sum: %d", sum);
    
    NSNumber *numSum = [NSNumber numberWithInt:sum];
    
    // We are able to store NSNumber types in an NSArray; this is not possible with native C types
    NSArray *arr = @[numInt, numInt2, numSum];
    
    NSString *str = numSum.stringValue;
    
    NSInteger someInt = 55; // You don't use a pointer (*) here because under the hood NSInteger is still a native type Int; pointers should only be used when the variable type is a class.
    
//    NSNumber *sumNum = [NSNumber numberWithInt:[numInt intValue] * [numInt intValue]];
    NSNumber *sumNum = [NSNumber numberWithInt:(numInt.intValue * numInt2.intValue)];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
