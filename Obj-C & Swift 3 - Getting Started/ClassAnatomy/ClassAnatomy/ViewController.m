//
//  ViewController.m
//  ClassAnatomy
//
//  Created by Jeffrey Eng on 4/19/17.
//  Copyright © 2017 Jeffrey Eng. All rights reserved.
//

#import "ViewController.h"

// Optional, however it allows you to declare local variables that you only want available inside your class.
@interface ViewController ()

// Put your properties here in this section of the .m file for your ViewController class if you don't want them publicly available
@property(nonatomic,strong) NSString *vehicle;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // Printing to the console; the %@ is string interpolation like \( in Swift; we are accessing the name publicly available 'name' property of ViewController class
    NSLog(@"Name: %@", self.name);
    
    self.name = @"Jack";
    
    NSLog(@"Name: %@", self.name);
    
    _name = @"Peter";
    
    NSLog(@"Name: %@", _name);
    
    [self setName:@"Sylvia"];
    
    NSLog(@"Name: %@", [self name]);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
