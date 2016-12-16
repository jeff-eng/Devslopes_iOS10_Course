// Swift Programming Language - Inheritance

import UIKit

//Creating a base class
class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    func makeNoise() {
        //do nothing - an arbitrary vehicle doesn't necessarily make a noise
    }
}

// Creating a new instance of Vehicle with initializer syntax
let someVehicle = Vehicle()
// Access the description property of the new Vehicle instance
print("Vehicle: \(someVehicle.description)")


//Creating a subclass
class Bicycle: Vehicle {
    var hasBasket = false
}
// Create a new instance of Bicycle and setting the hasBasket property to true
let bicycle = Bicycle()
bicycle.hasBasket = true

// Modifying the inherited currentSpeed property of the Bicycle instance
bicycle.currentSpeed = 18.0
print("Bicycle: \(bicycle.description)")

// Subclassing the subclass Bicycle and adding a new stored property
class Tandem: Bicycle {
    var currentNumberOfPassengers = 0
}
// Create a new instance of Tandem and accessing all inherited properties/methods as well as newly created currentNumberOfPassengers property
let tandem = Tandem()
tandem.currentNumberOfPassengers = 2
tandem.hasBasket = false
tandem.currentSpeed = 11.0
print("Tandem: \(tandem.description)")


//Overriding
// Overriding Methods (defining new subclass and customizing inherited method from base class)
class Train: Vehicle {
    override func makeNoise() {
        print("Choo choo")
    }
}

let train = Train()
train.makeNoise() // Prints "Choo choo"

// Overriding Properties (this example modifies the Vehicle superclass description property slightly)
class Car: Vehicle {
    var gear = 1
    override var description: String {
        return super.description + " in gear \(gear)"
    }
}

let car = Car()
car.currentSpeed = 25.0
car.gear = 3
print("Car: \(car.description)")

// Overriding Property Observers
class AutomaticCar: Car {
    override var currentSpeed: Double {
        didSet {
            gear = Int(currentSpeed / 10.0) + 1
        }
    }
}

let automatic = AutomaticCar()
automatic.currentSpeed = 45.0
print("AutomaticCar: \(automatic.description)")
