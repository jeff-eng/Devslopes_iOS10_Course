//Protocol Oriented Programming and Advanced Swift 3 - Writing Your First Protocols

import UIKit

protocol Vehicle: CustomStringConvertible{
    var isRunning: Bool { get set }
    
    mutating func start()
    
    mutating func turnOff()
}

//Creating a sports car Structure that conforms to the Vehicle protocol
struct SportsCar: Vehicle {
    var isRunning: Bool = false
    var description: String {
        if isRunning {
           return "Sports car currently running"
        } else {
           return "Sports car currently turned off"
        }
    }
    
    mutating func start() {
        if isRunning {
            print("Already started")
        } else {
            isRunning = true
            print("Vrooom")
        }
    }
    
    mutating func turnOff() {
        if isRunning {
            isRunning = false
            print("Crickets")
        } else {
            print("Already dead!")
        }
    }
}

//Now creating a SemiTruck class that conforms to the Vehicle protocol to show that protocols work with both value and reference types
class SemiTruck: Vehicle {
    var isRunning: Bool = false
    var description: String {
        if isRunning {
            return "Semi truck currently running"
        } else {
            return "Semi truck currently shut down"
        }
    }
    func start() {
        if isRunning {
            print("Already started")
        } else {
            isRunning = true
            print("Rumble")
        }
    }
    
    func turnOff() {
        if isRunning {
            isRunning = false
            print("put...put...silence")
        } else {
            print("Already shut down")
        }
    }
    
    // You can specify additional functionality not specified by the protocol.
    func blowAirHorn() {
        print("HONK!!!")
    }
    
}

var car1 = SportsCar()
var truck1 = SemiTruck()

car1.start()
truck1.start()
truck1.blowAirHorn()

// Creating an array to store the SportsCar instance and SemiTruck instance; even though they are different types (Struct vs. Class), you can store both of them in the array because they both conform to Vehicle protocol. This shows you can use protocols as types.
var vehicleArray: Array<Vehicle> = [car1, truck1]


for vehicle in vehicleArray {
    print("\(vehicle.description)")
}



