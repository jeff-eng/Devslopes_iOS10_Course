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
    @IBOutlet weak var emailTextField: StyleTextField!
    @IBOutlet weak var passwordTextField: StyleTextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Enable textfield clear button
        emailTextField.clearButtonMode = .whileEditing
        passwordTextField.clearButtonMode = .whileEditing
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
    
    @IBAction func signInPressed(_ sender: StyleSignInButton) {
        guard let email = emailTextField.text,
            let password = passwordTextField.text,
            password.characters.count >= 6
        else {
            if let emailText = emailTextField.text, emailText == "" {
                let emptyEmailAlert = UIAlertController.init(title: "Missing email address", message: "Please enter a valid email", preferredStyle: .alert)
                emptyEmailAlert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                present(emptyEmailAlert, animated: true)
            } else if let password = passwordTextField.text, password.characters.count < 6 {
            let errorAlert = UIAlertController.init(title: "Login Error", message: "Your password must be at least 6 alphanumeric characters.", preferredStyle: .alert)
            errorAlert.addAction(UIAlertAction(title: "OK", style: .default))
            // Present the UIAlert and reset the password text field
            present(errorAlert, animated: true, completion: { self.passwordTextField.text = nil })
            }
            return
        }
        //Initiate Email authentication process with Firebase
        FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user, error)  in
            if error == nil {
                print("Jeff: Email user authenticated with Firebase")
            } else {
                // Handle scenario where user doesn't exist; a new user will automatically be created
                FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: { (user, error) in
                    if error != nil {
                        print("Jeff: Unable to create new user with email in Firebase")
                    } else {
                        print("Jeff: Successfully created new user with email in Firebase")
                    }
                })
            }
        })
    
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

