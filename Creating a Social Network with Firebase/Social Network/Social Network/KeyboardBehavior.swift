//
//  KeyboardBehavior.swift
//  Social Network
//
//  Created by Jeffrey Eng on 3/27/17.
//  Copyright © 2017 Jeffrey Eng. All rights reserved.
//

import UIKit

protocol KeyboardBehavior {
    // Required method for adding instance of gesture recognizer when keyboard will be visible
    func keyboardWillShow(notification: NSNotification)
    // Required method for removing gesture recognizer when keyboard is going to be hidden
    func keyboardWillHide(notification: NSNotification)
    // Method for dismissing keyboard
    func dismissKeyboard(sender: Any)
}
