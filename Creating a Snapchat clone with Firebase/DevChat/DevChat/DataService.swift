//
//  DataService.swift
//  DevChat
//
//  Created by Jeffrey Eng on 4/12/17.
//  Copyright © 2017 Jeffrey Eng. All rights reserved.
//

import Foundation
import FirebaseDatabase
import FirebaseStorage

class DataService {
    private static let _instance = DataService()
    
    static var instance: DataService {
        return _instance
    }
    
    var mainRef: FIRDatabaseReference {
        return FIRDatabase.database().reference()
    }
    
    var usersRef: FIRDatabaseReference {
        return mainRef.child(GlobalConstants.FIR_CHILD_USERS)
    }
    
    var mainStorageRef: FIRStorageReference {
        return FIRStorage.storage().reference(forURL: GlobalConstants.FIR_STORAGE_REF_URL)
    }
    
    var imagesStorageRef: FIRStorageReference {
        return mainStorageRef.child(GlobalConstants.FIR_STORAGE_REF_CHILD_IMAGES)
    }
    
    var videoStorageRef: FIRStorageReference {
        return mainStorageRef.child(GlobalConstants.FIR_STORAGE_REF_CHILD_VIDEOS)
    }
    
    func saveUser(uid: String) {
        let profile: Dictionary<String, Any> = ["firstName": "", "lastName": ""]
        
        // Accessing the database and drilling down all the way to the profile node where we set the values for firstName and lastName keys
        mainRef.child(GlobalConstants.FIR_CHILD_USERS).child(uid).child(GlobalConstants.FIR_CHILD_PROFILE).setValue(profile)
    }
}
