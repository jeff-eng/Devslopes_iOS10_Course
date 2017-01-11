//
//  Person.swift
//  mvc-test
//
//  Created by Jeffrey Eng on 1/11/17.
//  Copyright © 2017 Jeffrey Eng. All rights reserved.
//

import Foundation

class Person {
    
    // Properties - Private variables, used within the Person class only
    private var _firstName: String
    private var _lastName: String
    
    // Properties - Public variables
    var firstName: String {
        get {
            return _firstName
        }
        
        set {
            _firstName = newValue
        }
    }
    
    var lastName: String {
        return _lastName
    }
    
    // Initializer
    init(first: String, last: String) {
        self._firstName = first
        self._lastName = last
    }
    // Computed property that prints the full name
    var fullName: String {
        return "\(_firstName) \(_lastName)"
    }
}
