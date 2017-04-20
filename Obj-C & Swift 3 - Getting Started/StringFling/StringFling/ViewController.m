//
//  ViewController.m
//  StringFling
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
  
    NSString *firstName = @"John";
    NSString *allocatedString = [[NSString alloc]init];
    
    NSLog(@"Name: %@", firstName);
    
    NSString *fullName = [NSString stringWithFormat:@"%@ Smith %@", firstName, @"Jr."];
    
    NSString *display = [fullName stringByAppendingString:@" - Died 1448"];
    
    NSLog(@"Full name: %@", fullName);
    
    NSLog(@"%@", display);
    
    // String comparison
    NSString *var1 = @"Junk";
    NSString *var2 = @"in the trunk";
    NSString *var3 = @"junk";
    
    if (![var1 isEqualToString:var2]) {
        NSLog(@"They are not the same!");
    }
    
    if ([var1 isEqualToString:var3]) {
        NSLog(@"We gotteeth here!");
    }
    
    if ([var1 caseInsensitiveCompare:var3] == NSOrderedSame) {
        NSLog(@"Woohoo");
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
