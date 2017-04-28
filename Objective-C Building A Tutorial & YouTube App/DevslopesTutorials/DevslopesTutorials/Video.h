//
//  Video.h
//  DevslopesTutorials
//
//  Created by Jeffrey Eng on 4/27/17.
//  Copyright © 2017 Jeffrey Eng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Video : NSObject

@property (strong, nonatomic) NSString *videoTitle;
@property (strong, nonatomic) NSString *videoDescription;
@property (strong, nonatomic) NSString *videoIframe;
@property (strong, nonatomic) NSString *thumbnailUrl;

@end
