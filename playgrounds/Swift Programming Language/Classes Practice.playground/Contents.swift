//Swift Programming Language - Classes

import UIKit

//Defining a class/structure
class SomeClass {
    // class definition goes here
}

struct SomeStructure {
    // structure definition goes here
}

// Example of structure definition and class definition
struct Resolution {
    var width = 0
    var height = 0
}

class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}


//Class and Structure Instances
let someResolution = Resolution()
let someVideoMode = VideoMode()

//Accessing Properties
print("The width of someResolution is \(someResolution.width).")
// Drilling down into subproperties
print("The width of someVideoMode is \(someVideoMode.resolution.width).")
// Using dot syntax to assign a new value to a variable property
someVideoMode.resolution.width = 1280
print("The width of someVideoMode is now \(someVideoMode.resolution.width).")


//Classes Are Reference Types
let hd = Resolution(width: 1920, height: 1080)
var cinema = hd

let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

// Assigning the instance of VideoMode() named tenEighty to another constant called alsoTenEighty.
let alsoTenEighty = tenEighty
// Able to modify tenEighty frameRate property by modifying alsoTenEighty frameRate property because they both refer to the exact same instance of the VideoMode class
alsoTenEighty.frameRate = 30.0
// Proving that Classes are passed by reference-alsoTenEighty and tenEighty frameRate properties refer to the same property of the exact same object.
print("The framerate of tenEighty is \(tenEighty.frameRate) and the framerate of alsoTenEighty is \(alsoTenEighty.frameRate) because they refer to the same instance of the VideoMode class.")





























