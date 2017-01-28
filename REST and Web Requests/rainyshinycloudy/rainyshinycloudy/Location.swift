//
//  Location.swift
//  rainyshinycloudy
//
//  Created by Jeffrey Eng on 1/27/17.
//  Copyright © 2017 Jeffrey Eng. All rights reserved.
//

import Foundation
import CoreLocation

class Location {
    static var sharedInstance = Location()
    private init() {}
    
    var latitude: Double!
    var longitude: Double!
}
