//
//  Date.swift
//  rainyshinycloudy
//
//  Created by Jeffrey Eng on 1/26/17.
//  Copyright © 2017 Jeffrey Eng. All rights reserved.
//

import Foundation

extension Date {
    func dayOfTheWeek() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
}
