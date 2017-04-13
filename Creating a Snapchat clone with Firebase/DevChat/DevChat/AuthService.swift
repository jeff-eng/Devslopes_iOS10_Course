//
//  AuthService.swift
//  DevChat
//
//  Created by Jeffrey Eng on 4/12/17.
//  Copyright © 2017 Jeffrey Eng. All rights reserved.
//

import Foundation
import FirebaseAuth

typealias Completion = (_ errMsg: String?, _ data: Any?) -> Void

class AuthService {
    // Creating a private type property on the class (static keyword makes it a type property) that calls this class, which creates the singleton.
    private static let _instance = AuthService()
    
    static var instance: AuthService {
        return _instance
    }
    
    // Attempt login - user will be created if user doesn't exist
    func login(email: String, password: String, onComplete: Completion?) {
        FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user, error) in
            if error != nil {
                if let errorCode = FIRAuthErrorCode(rawValue: error!._code), errorCode == .errorCodeUserNotFound {
                    
                    self.createUser(email, password, onComplete)
                    
                } else {
                    self.handleFirebaseError(error: error! as NSError, onComplete: onComplete)
                }
            } else {
                // We have successfully logged in
                onComplete?(nil, user)
            }
        })
    }
    
    func createUser(_ email: String, _ password: String, _ onComplete: Completion?) {
        FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: { (user, error) in
            if error != nil {
                // Show error to the user
                self.handleFirebaseError(error: error! as NSError, onComplete: onComplete)
            } else if user?.uid != nil {
                // Attempt to login after user is created
                self.login(email: email, password: password, onComplete: onComplete)
            }
        })
    }
    
    func handleFirebaseError(error: NSError, onComplete: Completion?) {
        print(error.debugDescription)
        
        if let errorCode = FIRAuthErrorCode(rawValue: error._code) {
            switch errorCode {
            case .errorCodeInvalidEmail:
                onComplete?("Invalid email address.", nil)
                break
            case .errorCodeWrongPassword:
                onComplete?("Invalid password.", nil)
                break
            case .errorCodeEmailAlreadyInUse, .errorCodeAccountExistsWithDifferentCredential:
                onComplete?("Could not create account. Email already in use.", nil)
                break
            default:
                onComplete?("There was a problem authenticating. Try again.", nil)
                break
            }
        }
    }
    
}
