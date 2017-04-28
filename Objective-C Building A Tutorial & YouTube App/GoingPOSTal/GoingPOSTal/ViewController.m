//
//  ViewController.m
//  GoingPOSTal
//
//  Created by Jeffrey Eng on 4/28/17.
//  Copyright © 2017 Jeffrey Eng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSDictionary *comment = @{@"username":@"devslopes", @"comment":@"This video is off da hook!"};
    
    NSError *error;
    
    // Create session
    NSURLSession *session = [NSURLSession sharedSession];
    // Create URL being posted to
    NSURL *url = [NSURL URLWithString:@"http://localhost:6069/comments"];
    // Create request object
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    // Specify headers for the request
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    // Specify the HTTP Request method
    [request setHTTPMethod:@"POST"];
    
    // Serializing the dictionary into JSON format
    NSData *postData = [NSJSONSerialization dataWithJSONObject:comment options:0 error:&error];
    
    // Set the body of the request as the postData object created previously
    [request setHTTPBody:postData];
    
    // Initiate the POST
    NSURLSessionDataTask *postDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        // handle errors here
        
    }];
    
    [postDataTask resume];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
