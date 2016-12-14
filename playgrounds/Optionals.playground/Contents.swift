//Swift 3 Optionals 

import UIKit

var lotteryWinnings: Int? // optional - ? means there may be a value or there may not be a value(nil)
lotteryWinnings = 10
if lotteryWinnings != nil {
    print(lotteryWinnings!)
}


// if let syntax (the preferred way over using the '!= nil' syntax)
if let winnings = lotteryWinnings {
    print(winnings)
}

class Car {
    var model: String?
}

var vehicle: Car?

//if let v = vehicle {
//    if let m = v.model {
//        print(m)
//    }
//}

// Create instance of Car class
vehicle = Car()
vehicle?.model = "Bronco"

if let v = vehicle, let m = v.model {
    print(m)
}

// Create an array of cars and is optional
var cars: [Car]?
// Initialize an empty array of Car objects
cars = [Car]()

// Using if let syntax combined with condition (in newest iteration of Swift lang, the comma (,) replaces 'where' for the condition)
if let carArr = cars, carArr.count > 0 {
    //only execute if not nil and if more than 0 elements
} else {
    cars?.append(Car())
    print(cars?.count)
}


// Example of an Implicitly Unwrapped Optional

class Person {
    var _age: Int!
    
    var age: Int {
        if _age == nil {
            _age = 15
        }
        return _age
    }
    
    func setAge(newAge: Int) {
        self._age = newAge
    }
}

var jack = Person()
//print(jack._age)
print(jack.age)



class Dog {
    var species: String
    
    init(someSpecies: String) {
        self.species = someSpecies
    }
}

var lab = Dog(someSpecies: "Black Lab")
print(lab.species)
