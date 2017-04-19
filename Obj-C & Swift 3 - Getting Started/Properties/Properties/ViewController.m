//
//  ViewController.m
//  Properties
//
//  Created by Jeffrey Eng on 4/19/17.
//  Copyright © 2017 Jeffrey Eng. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Create instance of Person class named 'person1'
    Person *person1 = [[Person alloc] init];
    
    // Setting the firstName property for the instance named person1 to the string 'Sandra' using dot-notation syntax
    person1.firstName = @"Sandra";
    
    // Setting the lastName property for the instance named person1 to the string 'Mandra' using Bracket notation
    [person1 setLastName:@"Mandra"];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
