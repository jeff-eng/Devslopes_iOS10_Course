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
import SwiftKeychainWrapper

class SignInVC: UIViewController {
    @IBOutlet weak var emailTextField: StyleTextField!
    @IBOutlet weak var passwordTextField: StyleTextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Enable textfield clear button
        emailTextField.clearButtonMode = .whileEditing
        passwordTextField.clearButtonMode = .whileEditing
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let _ = KeychainWrapper.standard.string(forKey: KEY_UID) {
            performSegue(withIdentifier: "FeedVC", sender: nil)
        }
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
                displayInvalidEmailAlert()
            } else if let password = passwordTextField.text, password.characters.count < 6 {
                displayInvalidPasswordAlert()
            }
            return
        }
        //Initiate Email authentication process with Firebase
        FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user, error)  in
            if error == nil, let user = user {
                print("Jeff: Email user authenticated with Firebase")
                self.completeSignIn(user.uid)
            } else {
                // Handle scenario where user doesn't exist; a new user will automatically be created
                FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: { (user, error) in
                    if error != nil {
                        print("Jeff: Unable to create new user with email in Firebase")
                    } else if let user = user {
                        print("Jeff: Successfully created new user with email in Firebase")
                        self.completeSignIn(user.uid)
                    }
                })
            }
        })
    
    }

    func firebaseAuth(_ credential: FIRAuthCredential) {
        FIRAuth.auth()?.signIn(with: credential, completion: { (user, error) in
            if error != nil {
                print("Jeff: Unable to authenticate with Firebase - \(error)")
            } else if let user = user {
                print("Jeff: Successfully authenticated with Firebase")
                self.completeSignIn(user.uid)
            }
        })
    }
    
    func completeSignIn(_ id: String) {
        let keychainResult = KeychainWrapper.standard.set(id, forKey: KEY_UID)
        print("Jeff: Data saved to keychain \(keychainResult)")
        performSegue(withIdentifier: "FeedVC", sender: nil)
    }
    
    //MARK: UIAlertControllers
    func displayInvalidEmailAlert() {
        let emptyEmailAlert = UIAlertController.init(title: "Invalid email", message: "Please enter a valid email", preferredStyle: .alert)
        emptyEmailAlert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(emptyEmailAlert, animated: true)
    }
    
    func displayInvalidPasswordAlert() {
        let errorAlert = UIAlertController.init(title: "Login Error", message: "Your password must be at least 6 alphanumeric characters.", preferredStyle: .alert)
        errorAlert.addAction(UIAlertAction(title: "OK", style: .default))
        // Present the UIAlert and reset the password text field
        present(errorAlert, animated: true, completion: { self.passwordTextField.text = nil })

    }
}

