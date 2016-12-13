//Swift 3 Dictionaries

import UIKit

var namesOfIntegers = [Int: String]()

namesOfIntegers[3] = "three"
namesOfIntegers[44] = "fourty four"

//clear out dictionary
namesOfIntegers = [:]

//Example using dictionary to store airport codes and corresponding airports, i.e. SEA = Sea-Tac Airport
var airports: [String : String] = ["YYZ": "Toronto Pearson", "LAX": "Los Angeles International"]

//Properties of dictionaries
//-Count
print("The airports dictionary has: \(airports.count) items")
//-isEmpty
if airports.isEmpty {
    print("The airports dictionary is empty!")
}

airports["LHR"] = "London"
airports["LHR"] = "London Heathrow" //Reassigning another value to the key
airports["DEV"] = "Devslopes International"

airports["DEV"] = nil

//Use for-in loop to retrieve key and value (tuple) from dictionary
for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}

for key in airports.keys {
    print("Key: \(key)")
}

for val in airports.values {
    print("Values: \(val)")
}
