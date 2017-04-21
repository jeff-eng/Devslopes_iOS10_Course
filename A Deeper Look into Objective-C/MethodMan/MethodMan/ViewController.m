//
//  ViewController.m
//  MethodMan
//
//  Created by Jeffrey Eng on 4/21/17.
//  Copyright © 2017 Jeffrey Eng. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@property (nonatomic) double bankAccount;
@property (nonatomic) double itemAmount;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.bankAccount = 500.50;
    self.itemAmount = 400.00;
    
}

- (BOOL)canPurchase:(double)amount {
    
    if (self.bankAccount >= amount) {
        return YES;
    }
    
    return NO;
}

// Defining the method implementation with multiple parameters
- (void)declareWinnerWithPlayerAScore:(NSInteger)scoreA playerBScore:(NSInteger)scoreB {
    
    if (scoreA > scoreB) {
        NSLog(@"Player A won!");
    } else if (scoreA < scoreB) {
        NSLog(@"Player B won!");
    } else {
        NSLog(@"It was a tie!");
    }
}



- (void)playground {
    
    if ([self canPurchase:self.itemAmount]) {
        NSLog(@"We can buy!");
    }
    
    // Calling the method (self is required to call the method)
    [self declareWinnerWithPlayerAScore:55 playerBScore:66];
    
    // Creating an instance of Person class
    Person *person = [[Person alloc]init];
    // Calling the method of the instance
    [person speakName];
    // Calling the static type method on the Person class
    [Person stateSpecies];

    
    // Nesting static type methods within each other
    UIImage *image1 = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://google.com/"]]];
    
    
    // The alternate way of doing the above
    NSString *urlString = @"http://google.com/someImage";
    NSURL *url = [NSURL URLWithString:urlString];
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    UIImage *image2 = [UIImage imageWithData:data];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
