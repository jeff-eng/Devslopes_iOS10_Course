//
//  ViewController.m
//  Swift and OBJC Interoperability
//
//  Created by Jeffrey Eng on 4/25/17.
//  Copyright © 2017 Jeffrey Eng. All rights reserved.
//

#import "ViewController.h"
#import "Swift_and_OBJC_Interoperability-Swift.h"

@interface ViewController ()
@property (strong, nonatomic) SecondVC *secondVC;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor brownColor];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

- (IBAction)loadSecondVC:(id)sender {
    // Create instance of SecondVC
    _secondVC = [[SecondVC alloc] init];
    // Change the background color so we can see it
    _secondVC.view.backgroundColor = [UIColor purpleColor];
    // Present it on the screen
    [self presentViewController:_secondVC animated:YES completion:nil];
}

@end
