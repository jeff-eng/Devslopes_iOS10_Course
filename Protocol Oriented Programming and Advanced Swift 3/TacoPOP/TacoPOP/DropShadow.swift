//
//  DropShadow.swift
//  TacoPOP
//
//  Created by Jeffrey Eng on 2/13/17.
//  Copyright © 2017 Jeffrey Eng. All rights reserved.
//

import UIKit

protocol DropShadow {}

extension DropShadow where Self: UIView {
    func addDropShadow() {
        //Implementation
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.7
        layer.shadowOffset = CGSize.zero
        layer.shadowRadius = 5
    }
}
