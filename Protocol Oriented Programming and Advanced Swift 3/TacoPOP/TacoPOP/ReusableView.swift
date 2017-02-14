//
//  ReusableView.swift
//  TacoPOP
//
//  Created by Jeffrey Eng on 2/14/17.
//  Copyright © 2017 Jeffrey Eng. All rights reserved.
//

import UIKit

protocol ReusableView: class {}

extension ReusableView where Self: UIView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
