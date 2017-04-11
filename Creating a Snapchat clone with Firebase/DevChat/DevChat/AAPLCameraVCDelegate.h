//
//  AAPLCameraVCDelegate.h
//  DevChat
//
//  Created by Jeffrey Eng on 4/11/17.
//  Copyright © 2017 Jeffrey Eng. All rights reserved.
//

#ifndef AAPLCameraVCDelegate_h
#define AAPLCameraVCDelegate_h

@protocol AAPLCameraVCDelegate <NSObject>

-(void)shouldEnableRecordUI:(BOOL)enable;
-(void)shouldEnableCameraUI:(BOOL)enable;
-(void)canStartRecording;
-(void)recordingHasStarted;
@end

#endif /* AAPLCameraVCDelegate_h */
