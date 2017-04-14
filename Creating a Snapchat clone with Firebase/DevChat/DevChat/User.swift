//
//  User.swift
//  DevChat
//
//  Created by Jeffrey Eng on 4/13/17.
//  Copyright © 2017 Jeffrey Eng. All rights reserved.
//

import UIKit

struct User {
    private var _firstName: String
    private var _uid: String
    
    var firstName: String {
        return _firstName
    }
    
    var uid: String {
        return _uid
    }
    
    init(firstName: String, uid: String) {
        _firstName = firstName
        _uid = uid
        
    }
}
