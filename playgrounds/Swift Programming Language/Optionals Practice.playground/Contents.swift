// Swift Programming Language - Optionals

import UIKit

//Example demonstrating optional Int
let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)
//convertedNumber is inferred to be of type "Int?", or "optional Int"
print(type(of: convertedNumber))


//Example of setting optional variable to valueless state by assigning it to 'nil'
var serverResponseCode: Int? = 404
// serverResponseCode contains an actual Int value of 404
serverResponseCode = nil
// serverResponseCode now contains no value


//Defining an optional variable without providing a default value automatically sets it to nil
var surveyAnswer: String?


//Using an if statement to find out whether an optional contains a value by comparing the optional against nil
if convertedNumber != nil {
    print("convertedNumber contains some integer value.")
    // Prints "convertedNumber contains some integer value."
}


//Forced unwrapping of optional's value with exclamation mark (!)
if convertedNumber != nil {
    print("The convertedNumber has an integer value of \(convertedNumber!)")
    // Prints "The convertedNumber has an integer value of 123."
}


//Using optional binding with 'if let' instead of forced unwrapping
if let actualNumber = Int(possibleNumber) {
    print("\"\(possibleNumber)\" has an integer value of \(actualNumber)")
} else {
    print("\"\(possibleNumber)\" could not be converted to an integer")
}


//Including multiple optional bindings and Boolean conditions in a single if statement, separated by commas
if let firstNumber = Int("4"), let secondNumber = Int("42"), firstNumber < secondNumber && secondNumber < 100 {
    print("\(firstNumber) < \(secondNumber) < 100")
}
// Prints "4 < 42 < 100"
// The following code is essentially same as above, just with nested optional binding and if statements.
if let firstNumber = Int("4") {
    if let secondNumber = Int("42") {
        if firstNumber < secondNumber && secondNumber < 100 {
            print("\(firstNumber) < \(secondNumber) < 100")
        }
    }
}


//Implicitly Unwrapped Optionals using exclamation mark (!)
let possibleString: String? = "An optional string."
let forcedString: String = possibleString! //requires an exclamation mark

let assumedString: String! = "An implicitly unwrapped optional string."
let implicitString: String = assumedString //no need for exclamation mark

//Treating an implicitly unwrapped optional like a normal optional, to check if it contains a value
if assumedString != nil {
    print(assumedString)
}

//Using an implicitly unwrapped optional with optional binding, to check and unwrap its value in a single statement
if let definiteString = assumedString {
    print(definiteString)
}
// Prints "An implicitly unwrapped optional string."



















