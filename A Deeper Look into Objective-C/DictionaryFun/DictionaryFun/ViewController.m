//
//  ViewController.m
//  DictionaryFun
//
//  Created by Jeffrey Eng on 4/21/17.
//  Copyright © 2017 Jeffrey Eng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSNumber *age = [NSNumber numberWithInt:30];
    NSNumber *age2 = [NSNumber numberWithInt:44];
    NSDictionary *dict = @{@"jack": age, @"barry": age2};
    
    // Retrieving a value for given key
    int jacksAge = [[dict valueForKey:@"jack"] intValue];
    
    // Longer way of doing the same thing above
    NSNumber *age3 = [dict objectForKey:@"jack"];
    int jacksAge2 = [age3 intValue];
    
    NSLog(@"Jack's age: %d", jacksAge2);
    
    NSMutableDictionary *mutDict = [@{@"1": @"Warriors", @"2": @"Spurs", @"3": @"Rockets"} mutableCopy];
    
    NSMutableDictionary *mutDict2 = [[NSMutableDictionary alloc] init];
    
    NSMutableDictionary *mutDict3 = [NSMutableDictionary dictionaryWithObjects:@"Good" forKeys:@"Meat"];
    [mutDict2 setObject:[NSNumber numberWithDouble: 20.000] forKey:@"Stuff"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
