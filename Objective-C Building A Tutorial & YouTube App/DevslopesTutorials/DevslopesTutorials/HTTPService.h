//
//  HTTPService.h
//  DevslopesTutorials
//
//  Created by Jeffrey Eng on 4/27/17.
//  Copyright © 2017 Jeffrey Eng. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^onComplete)(NSArray *__nullable dataArray, NSString *__nullable errMessage);

@interface HTTPService : NSObject

+ (id)instance;
- (void)getTutorials:(nullable onComplete)completionHandler;

@end
