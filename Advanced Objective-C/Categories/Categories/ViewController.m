//
//  ViewController.m
//  Categories
//
//  Created by Jeffrey Eng on 4/25/17.
//  Copyright © 2017 Jeffrey Eng. All rights reserved.
//

#import "ViewController.h"
#import "Honda.h"
#import "Honda+SupedUp.h"
#import "TeslaModelS.h"
#import "TeslaModelS+PremiumUpgrades.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Honda *honda = [[Honda alloc] init];
    
    [honda addUglySpoiler];
    [honda addHorribleSoundingMuffler];
    
    TeslaModelS *P100D = [[TeslaModelS alloc] init];
    [P100D unlockLudicrousMode];
    NSLog(@"Is Ludicrous Mode Unlocked? %d", P100D.ludicrousModeUnlocked);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
