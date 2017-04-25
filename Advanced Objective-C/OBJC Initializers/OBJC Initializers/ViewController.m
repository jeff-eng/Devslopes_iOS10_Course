//
//  ViewController.m
//  OBJC Initializers
//
//  Created by Jeffrey Eng on 4/24/17.
//  Copyright © 2017 Jeffrey Eng. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    Person *person = [[Person alloc] init];
    Person *person2 = [Person new];
    
    [person printName];
    
    // Created instance of Person with designated initializer
    Person *person3 = [[Person alloc] initWithFirstName:@"Petey" lastName:@"McFreedy"];
    
    [person3 printName];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
