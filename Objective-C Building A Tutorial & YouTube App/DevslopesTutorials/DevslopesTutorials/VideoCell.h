//
//  VideoCell.h
//  DevslopesTutorials
//
//  Created by Jeffrey Eng on 4/27/17.
//  Copyright © 2017 Jeffrey Eng. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Video;

@interface VideoCell : UITableViewCell
- (void)updateUI:(nonnull Video *)video;
@end
