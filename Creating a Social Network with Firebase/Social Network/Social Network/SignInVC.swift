//
//  SignInVC.swift
//  Social Network
//
//  Created by Jeffrey Eng on 3/13/17.
//  Copyright © 2017 Jeffrey Eng. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import Firebase

class SignInVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
     
    }

    @IBAction func facebookBtnPressed(_ sender: UIButton) {
        let facebookLogin = FBSDKLoginManager()
        
        facebookLogin.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            if error != nil {
                print("Jeff: Unable to authenticate with Facebook - \(error)")
            } else if result?.isCancelled == true {
                print("Jeff: User cancelled Facebook authentication")
            } else {
                print("Jeff: Successfully authenticated with Facebook")
                let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                self.firebaseAuth(credential)
            }
        }
    }

    func firebaseAuth(_ credential: FIRAuthCredential) {
        FIRAuth.auth()?.signIn(with: credential, completion: { (user, error) in
            if error != nil {
                print("Jeff: Unable to authenticate with Firebase - \(error)")
            } else {
                print("Jeff: Successfully authenticated with Firebase")
            }
        })
    }
    
}

