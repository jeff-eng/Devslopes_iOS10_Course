//
//  DataService.swift
//  DevChat
//
//  Created by Jeffrey Eng on 4/12/17.
//  Copyright © 2017 Jeffrey Eng. All rights reserved.
//

import Foundation
import FirebaseDatabase

class DataService {
    private static let _instance = DataService()
    
    static var instance: DataService {
        return _instance
    }
    
    var mainRef: FIRDatabaseReference {
        return FIRDatabase.database().reference()
    }
    
    func saveUser(uid: String) {
        let profile: Dictionary<String, Any> = ["firstName": "", "lastName": ""]
        // Accessing the database and drilling down all the way to the profile node where we set the values for firstName and lastName keys
        mainRef.child("users").child(uid).child("profile").setValue(profile)
    }
}
