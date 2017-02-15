//Protocol Oriented Programming and Advanced Swift 3 - Writing Your First Protocols

import UIKit

protocol Vehicle: CustomStringConvertible{
    var isRunning: Bool { get set }
    var make: String {  get set }
    var model: String { get set }
    
    mutating func start()
    
    mutating func turnOff()
    
}

extension Vehicle {
    
    var makeModel: String {
        return "\(make) \(model)"
    }
    
    mutating func start() {
        if isRunning {
            print("Already started")
        } else {
            isRunning = true
            print("\(self.description) fired up!")
        }
    }
    
    mutating func turnOff() {
        if isRunning {
            isRunning = false
            print("\(self.description) shut down!")
        } else {
            print("Already dead!")
        }
    }
}

//Creating a sports car Structure that conforms to the Vehicle protocol
struct SportsCar: Vehicle {
    var isRunning: Bool = false
    var make: String
    var model: String
    
    var description: String {
        return self.makeModel
    }
    
}

//Now creating a SemiTruck class that conforms to the Vehicle protocol to show that protocols work with both value and reference types
class SemiTruck: Vehicle {
    var isRunning: Bool = false
    var make: String
    var model: String
    
    init(isRunning: Bool, make: String, model: String) {
        self.isRunning = isRunning
        self.make = make
        self.model = model
    }
    
    var description: String {
        return self.makeModel
    }
    
    // You can specify additional functionality not specified by the protocol.
    func blowAirHorn() {
        print("HONK!!!")
    }
    
}

var car1 = SportsCar(isRunning: false, make: "Porsche", model: "911")
var truck1 = SemiTruck(isRunning: false, make: "Peterbilt", model: "Verago")
//
car1.start()
truck1.start()
truck1.blowAirHorn()

truck1.turnOff()

// Creating an array to store the SportsCar instance and SemiTruck instance; even though they are different types (Struct vs. Class), you can store both of them in the array because they both conform to Vehicle protocol. This shows you can use protocols as types.
var vehicleArray: Array<Vehicle> = [car1, truck1]


for vehicle in vehicleArray {
    print("\(vehicle.makeModel)")
}


// Creating Protocol Extensions

extension Double {
    var dollarString: String {
        return String(format: "$%.02f", self)
    }
}

var pct = 32.15 * 0.15  // returns 4.8225
pct.dollarString        // returns "$4.82"


