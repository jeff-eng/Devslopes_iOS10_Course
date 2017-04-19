//
//  ViewController.m
//  HelloOBJC
//
//  Created by Jeffrey Eng on 4/19/17.
//  Copyright © 2017 Jeffrey Eng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickBait:(id)sender {
    
    // Create instance of UIAlertController named 'alert', passing in strings as arguments and UIAlertControllerStyleAlert enum case
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"WELCOME" message:@"Welcome to the world of Objective-C" preferredStyle:UIAlertControllerStyleAlert];
    
    // Create instance of UIAlertAction named 'closeAction'
    UIAlertAction *closeAction = [UIAlertAction actionWithTitle:@"CLOSE" style:UIAlertActionStyleCancel handler:nil];
    // Add the UIAlertAction to the UIAlertController using the addAction method
    [alert addAction:closeAction];
    // Use the presentViewcontroller method on the ViewController class to present the UIAlertController when the button is tapped
    [self presentViewController:alert animated:YES completion:nil];
}

@end

