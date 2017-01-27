//
//  Double.swift
//  rainyshinycloudy
//
//  Created by Jeffrey Eng on 1/26/17.
//  Copyright © 2017 Jeffrey Eng. All rights reserved.
//

import Foundation

// Extends the type Double to give its own properties and methods
extension Double {
    var toFahrenheit: Double {
        return self * 1.8 - 459.67
    }
}

func roundToTenths(_ value: Double) -> Double {
    return round(10 * value) / 10
}


