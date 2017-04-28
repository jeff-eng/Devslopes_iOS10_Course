//
//  VideoVC.m
//  DevslopesTutorials
//
//  Created by Jeffrey Eng on 4/28/17.
//  Copyright © 2017 Jeffrey Eng. All rights reserved.
//

#import "VideoVC.h"

@interface VideoVC ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;

@end

@implementation VideoVC
- (IBAction)closedPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}



@end
