//
//  ViewController.m
//  GettersSetters
//
//  Created by Jeffrey Eng on 4/19/17.
//  Copyright © 2017 Jeffrey Eng. All rights reserved.
//

#import "ViewController.h"
#import "Vehicle.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    Vehicle *car = [[Vehicle alloc]init];
    car.odometer = -100;
    
    NSLog(@"Odometer: %lu", car.odometer);
    
    car.model = @"Honda Civic";
    
    NSLog(@"I drive a %@", car.model);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
