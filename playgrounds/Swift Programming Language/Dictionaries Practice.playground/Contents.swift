// Swift Programming Language Book (Swift 3) - Dictionaries

import UIKit

//**Creating an Empty Dictionary**
// Using the initializer syntax to create an empty dictionary [Int: String]
var namesOfIntegers = [Int: String]()
// Assigns key Int '16' to the value String 'sixteen'
namesOfIntegers[16] = "sixteen"
// Clears the dictionary
namesOfIntegers = [:]

//**Creating a Dictionary with a Dictionary Literal**
var airports: [String: String] = ["SEA": "Seattle-Tacoma International", "SFO": "San Francisco International"]

//**Accessing and Modifying a Dictionary**
// Use the count property to find out number of items in dictionary.
print("The airports dictionary contains \(airports.count) items.")

// Use the isEmpty property to check whether count property is equal to 0
if airports.isEmpty {
    print("The airports dictionary is empty.")
} else {
    print("The airports dictionary is not empty.")
}

// Add a new item to a dictionary using subscript syntax
airports["LAX"] = "Los Angeles"
airports["LAX"] = "Los Angeles International"

// Use the dictionary's method updateValue(_:forKey:) to set or update the value for a particular key
if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
    print("The old value for DUB was \(oldValue).")
}
// Use dictionary's subscript syntax to retrieve a value for specific key
if let airportName = airports["DUB"] {
    print("The name of the airport is \(airportName).")
} else {
    print("That airport is not in the airports dictionary.")
}
// Use subscript syntax to remove a key-value pair from dictionary by assigning a value of nil for that key
airports["APL"] = "Apple International"
//  Apple International is not the real airport for APL, so delete it
airports["APL"] = nil
//  APL has now been removed from the dictionary

// Use the removeValue(forKey:) method to remove a key-value pair from dictionary if it exists and returns removed value, or nil if no value existed
if let removedValue = airports.removeValue(forKey: "DUB") {
    print("The removed airport's name is \(removedValue).")
} else {
    print("The airports dictionary does not contain a value for DUB.")
}

//**Iterating over a Dictionary**
for (airportCode, airportName) in airports {
    print("\(airportCode) refers to \(airportName).")
}

// Retrieving an iterable collection of a dictionary's keys or values by accesing its 'keys' and 'values' properties.
for airportCode in airports.keys {
    print("Airport Code: \(airportCode)")
}
for airportName in airports.values {
    print("Airport Name: \(airportName)")
}

//
let airportCodes = [String](airports.keys)
let airportNames = [String](airports.values)
