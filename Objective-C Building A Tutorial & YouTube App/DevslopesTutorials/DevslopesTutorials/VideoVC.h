//
//  VideoVC.h
//  DevslopesTutorials
//
//  Created by Jeffrey Eng on 4/28/17.
//  Copyright © 2017 Jeffrey Eng. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Video;

@interface VideoVC : UIViewController <UIWebViewDelegate>;
@property (strong, nonatomic) Video *video;
@end
