//
//  AuthService.swift
//  DevChat
//
//  Created by Jeffrey Eng on 4/12/17.
//  Copyright © 2017 Jeffrey Eng. All rights reserved.
//

import Foundation
import FirebaseAuth

class AuthService {
    // Creating a private type property on the class (static keyword makes it a type property) that calls this class, which creates the singleton.
    private static let _instance = AuthService()
    
    static var instance: AuthService {
        return _instance
    }
    
    // Attempt login - user will be created if user doesn't exist
    func login(_ email: String, _ password: String) {
        FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user, error) in
            if error != nil {
                if let errorCode = FIRAuthErrorCode(rawValue: error!._code), errorCode == .errorCodeUserNotFound {
                    
                    self.createUser(email, password)
                    
                } else {
                    // Show error to user
                }
            } else {
                // We have successfully logged in
            }
        })
    }
    
    func createUser(_ email: String, _ password: String) {
        FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: { (user, error) in
            if error != nil {
                // TODO: Show error to the user
                
            } else if user?.uid != nil {
                // Attempt to login after user is created
                self.login(email, password)
            }
        })
    }
    
}
