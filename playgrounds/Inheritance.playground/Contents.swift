//Inheritance

import UIKit

// Class
class Vehicle {
    var tires = 4
    var make: String?
    var model: String?
    var currentSpeed: Double = 0
    
    // Initializer
    init() {
        print("I am the parent.")
    }
    
    func drive(speedIncrease: Double) {
        currentSpeed += speedIncrease * 2
    }
    
    func brake() {
        
    }
}

// Subclass of Vehicle
class SportsCar: Vehicle {
    // Override the parent class' initializer
    override init() {
        // super.init() calls the parent's initializer which is why "I am the parent." prints.
        super.init()
        print("I am the child.")
        make = "BMW"
        model = "3 series"
    }
    
    override func drive(speedIncrease: Double) {
        currentSpeed += speedIncrease * 3
    }
}
// Creating an instance of SportsCar class, an object called 'car'.
let car = SportsCar()

// Another subclass of Vehicle
class Truck: Vehicle {
    override init() {
        super.init()
    }
}
// Creating an instance of the Truck class, an object called 'dodgeRam'.
let dodgeRam = Truck()