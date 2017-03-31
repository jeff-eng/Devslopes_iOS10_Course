//
//  UIImageView+Ext.swift
//  Social Network
//
//  Created by Jeffrey Eng on 3/30/17.
//  Copyright © 2017 Jeffrey Eng. All rights reserved.
//

import UIKit

extension UIImageView {
    func loadingImageIndicator(_ show: Bool) {
        let indicator = UIActivityIndicatorView()
        if show {
            self.alpha = 0.5
            let imageViewHeight = self.bounds.size.height
            let imageViewWidth = self.bounds.size.width
            indicator.center = CGPoint(x: imageViewWidth/2, y: imageViewHeight/2)
            self.addSubview(indicator)
            indicator.startAnimating()
        } else {
            self.alpha = 1.0
            indicator.stopAnimating()
            indicator.removeFromSuperview()
        }
    }
}
