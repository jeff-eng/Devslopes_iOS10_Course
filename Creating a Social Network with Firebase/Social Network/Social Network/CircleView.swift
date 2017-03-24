//
//  CircleView.swift
//  Social Network
//
//  Created by Jeffrey Eng on 3/21/17.
//  Copyright © 2017 Jeffrey Eng. All rights reserved.
//

import UIKit

class CircleView: UIImageView {
   
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = self.frame.width / 2
    }
    
}
