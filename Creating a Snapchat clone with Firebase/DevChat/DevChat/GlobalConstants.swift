//
//  GlobalConstants.swift
//  DevChat
//
//  Created by Jeffrey Eng on 4/13/17.
//  Copyright © 2017 Jeffrey Eng. All rights reserved.
//

import Foundation

struct GlobalConstants {
    
    // Constants for Firebase child nodes
    static let FIR_CHILD_USERS = "users"
    static let FIR_CHILD_PROFILE = "profile"

    static let USERS_VC = "UsersVC"
    
    static let VIDEO_URL = "videoURL"
    static let SNAPSHOT_DATA = "snapshotData"
    
    static let FIR_STORAGE_REF_URL = "gs://devchat-d7332.appspot.com"
    static let FIR_STORAGE_REF_CHILD_IMAGES = "images"
    static let FIR_STORAGE_REF_CHILD_VIDEOS = "videos"
    
    static func ENABLE_SEND_BUTTON(barButtonItem: UINavigationItem) {
        barButtonItem.rightBarButtonItem?.isEnabled = true
    }
    
    static func DISABLE_SEND_BUTTON(barButtonItem: UINavigationItem) {
        barButtonItem.rightBarButtonItem?.isEnabled = false
    }
}
