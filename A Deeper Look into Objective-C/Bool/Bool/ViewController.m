//
//  ViewController.m
//  Bool
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
    
    // Creating variable and assigning a boolean value
    BOOL amICool = YES;
    BOOL isTheOtherPersonCool = NO;
    
    // Conditional
    if (amICool) {
        NSLog(@"Whip out the cool Ray Bans and hit the beach!");
    } else {
        NSLog(@"We should never get here!");
    }

    // Using operators
    if ((amICool != isTheOtherPersonCool) || (isTheOtherPersonCool == NO)) {
        NSLog(@"Somebody has to be cool, right?");
    }
    
    
    // Using nil/not nil as equating to true/false
    NSString *name = nil;
    
    if (name) {
        NSLog(@"Name: %@", name);
    } else {
        // Some code goes here...
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
