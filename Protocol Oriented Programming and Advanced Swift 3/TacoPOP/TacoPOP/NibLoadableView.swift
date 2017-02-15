//
//  NibLoadableView.swift
//  TacoPOP
//
//  Created by Jeffrey Eng on 2/14/17.
//  Copyright © 2017 Jeffrey Eng. All rights reserved.
//

import UIKit

protocol NibLoadableView: class {}

extension NibLoadableView where Self: UIView {
    static var nibName: String {
        return String(describing: self)
    }
}
