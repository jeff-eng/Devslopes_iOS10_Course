//
//  LoginVC.swift
//  DevChat
//
//  Created by Jeffrey Eng on 4/12/17.
//  Copyright © 2017 Jeffrey Eng. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    @IBOutlet weak var emailTextField: RoundTextField!
    @IBOutlet weak var passwordTextField: RoundTextField!

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func loginButtonPressed(_ sender: Any) {
        guard let email = emailTextField.text, let password = passwordTextField.text, (email.characters.count > 0 && password.characters.count > 0) else {
        
            // Alert the user that their login is invalid due to wrong username or password
            let alert = UIAlertController(title: "Username and Password Required", message: "Both username and password fields must be entered to log in.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            present(alert, animated: true, completion: nil)
            
            return
        }
        
        // Call the login service
        
        
    }


}
