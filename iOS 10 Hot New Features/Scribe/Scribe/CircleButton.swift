//
//  CircleButton.swift
//  Scribe
//
//  Created by Jeffrey Eng on 2/16/17.
//  Copyright © 2017 Jeffrey Eng. All rights reserved.
//

import UIKit

@IBDesignable
class CircleButton: UIButton {
    @IBInspectable var cornerRadius: CGFloat = 30.0 {
        didSet {
            setupView()
        }
    }
    
    override func prepareForInterfaceBuilder() {
        setupView()
    }
    
    func setupView() {
        layer.cornerRadius = cornerRadius
    }
}
