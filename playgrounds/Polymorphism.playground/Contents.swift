// Polymorphism

import UIKit

class Shape {
    var area: Double?
    
    func calculateArea(valA: Double, valB: Double) {
        
    }
}

class Triangle: Shape {
    
    override func calculateArea(valA: Double, valB: Double) {
        area = (valA * valB) / 2
    }
}

class Rectangle: Shape {
    
    override func calculateArea(valA: Double, valB: Double) {
        area = valA * valB
    }
}

// In Triangle subclass and Rectangle subclass, they obey the same requirement that they need to have the method calculateArea, but they implement that method in different ways.  The way each subclass modifies the calculateArea method to suit their own purpose is essentially what polymorphism is.