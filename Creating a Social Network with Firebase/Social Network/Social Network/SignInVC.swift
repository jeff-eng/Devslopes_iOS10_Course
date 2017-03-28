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
    
    var keyboardDismissTapGesture: UIGestureRecognizer?
    
    @IBOutlet weak var emailTextField: StyleTextField!
    @IBOutlet weak var passwordTextField: StyleTextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Enable textfield clear button
        emailTextField.clearButtonMode = .whileEditing
        passwordTextField.clearButtonMode = .whileEditing
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        if let _ = KeychainWrapper.standard.string(forKey: KEY_UID) {
            performSegue(withIdentifier: "FeedVC", sender: nil)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self)
        
        super.viewWillDisappear(animated)
    }

    @IBAction func facebookBtnPressed(_ sender: UIButton) {
        let facebookLogin = FBSDKLoginManager()
        
        facebookLogin.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            if error != nil {
                print("Jeff: Unable to authenticate with Facebook - \(String(describing: error))")
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
                let userData = ["provider": user.providerID]
                print("Jeff: Email user authenticated with Firebase")
                self.completeSignIn(user.uid, userData: userData)
            } else {
                // Handle scenario where user doesn't exist; a new user will automatically be created
                FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: { (user, error) in
                    if error != nil {
                        print("Jeff: Unable to create new user with email in Firebase")
                    } else if let user = user {
                        let userData = ["provider": user.providerID]
                        print("Jeff: Successfully created new user with email in Firebase")
                        self.completeSignIn(user.uid, userData: userData)
                    }
                })
            }
        })
    
    }

    func firebaseAuth(_ credential: FIRAuthCredential) {
        FIRAuth.auth()?.signIn(with: credential, completion: { (user, error) in
            if error != nil {
                print("Jeff: Unable to authenticate with Firebase - \(String(describing: error))")
            } else if let user = user {
                let userData = ["provider": credential.provider]
                print("Jeff: Successfully authenticated with Firebase")
                self.completeSignIn(user.uid, userData: userData)
            }
        })
    }
    
    func completeSignIn(_ id: String, userData: Dictionary<String, String>) {
        DataService.ds.createFirebaseDBUser(uid: id, userData: userData)
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

//MARK: Keyboard Hiding Extension
extension SignInVC: KeyboardBehavior {
    
    func keyboardWillHide(notification: NSNotification) {
        if keyboardDismissTapGesture != nil {
            // Removing the instance of the UITapGestureRecognizer
            self.view.removeGestureRecognizer(keyboardDismissTapGesture!)
            keyboardDismissTapGesture = nil
        }
    }
    
    func keyboardWillShow(notification: NSNotification) {
        if keyboardDismissTapGesture == nil {
            // Adding an instance of UITapGestureRecognizer
            keyboardDismissTapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard(sender:)))
            // Apply gesture recognizer to the main view
            self.view.addGestureRecognizer(keyboardDismissTapGesture!)
        }
    }
    
    func dismissKeyboard(sender: Any) {
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
    }
    
}
