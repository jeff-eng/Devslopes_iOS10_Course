//
//  ViewController.h
//  ClassAnatomy
//
//  Created by Jeffrey Eng on 4/19/17.
//  Copyright © 2017 Jeffrey Eng. All rights reserved.
//

// Import statement - #import is where you import your code files so your classes can recognize other classes you want to access and use
#import <UIKit/UIKit.h>

// @interface is called Directive - basically means 'class'; 'ViewController' is the name of the class; then ' : UIViewController' is the class that ViewController is inheriting from
@interface ViewController : UIViewController

// @property makes variables publicly available to other classes
@property (nonatomic, strong) NSString *name;


// @end is where your class definition will end
@end

