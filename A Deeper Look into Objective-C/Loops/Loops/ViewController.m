//
//  ViewController.m
//  Loops
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
    
    NSArray *cars = @[@"Bimmer", @"Maserati", @"Bronco II"];
    
    // Standard for-loop
    for (int x = 0; x < cars.count; x++) {
        NSString *car = [cars objectAtIndex:x];
        NSLog(@"Car: %@", car);
    }
    
    // Fast enumeration / for each loop
    for (NSString *car in cars) {
        NSLog(@"Car: %@", car);
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
