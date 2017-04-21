//
//  ViewController.m
//  ArrayFun
//
//  Created by Jeffrey Eng on 4/21/17.
//  Copyright © 2017 Jeffrey Eng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Create an instance of NSArray and initialize with items; NSArray is immutable
    NSArray *arr = [[NSArray alloc]initWithObjects:@"Wham", @"Bam", @"Thank you", @"maam", nil];
    NSLog(@"Contents of arr: %@", arr);
    
    // Initializing an array using literal syntax
    NSArray *arr2 = @[@"Legend", @"Of", @"Zelda"];
    
    NSString *str = [arr2 objectAtIndex:2];
    NSLog(@"%@", str);
 
    // Create instance of NSMutableArray; NSMutableArray is mutable
    NSMutableArray *mutableArray = [NSMutableArray arrayWithObjects:@"boom", @"shaka", @"laka", nil];
    
    // Modifying contents of the NSMutableArray instance
    NSLog(@"mutableArray: %@", mutableArray.debugDescription);
    
    // Removing object from array
    [mutableArray removeObjectAtIndex:2];

    // Add object to array
    [mutableArray addObject:@"papa"];
    
    NSLog(@"mutableArray(after removal of item at index 2): %@", mutableArray.debugDescription);
    
    // Initializing an array with another array
    NSArray *arr3 = [NSArray arrayWithArray:arr];
    
    // Creating an NSArray instance from an NSMutableArray instance
    NSArray *arr4 = mutableArray;
    
    // Trying to do this will give you an error; you can't really do this because you are trying to cast an NSArray (immutable) to a mutable array
    NSMutableArray *mutableArray2 = arr;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
