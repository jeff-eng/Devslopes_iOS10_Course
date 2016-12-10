//Functions

import UIKit

//Defining and Calling Functions

//Example 1
func greet(person: String) -> String {
    let greeting = "Hello, \(person)!"
    return greeting
}

print(greet(person: "Anna"))
// Prints "Hello, Anna!"
print(greet(person: "Brian"))
// Prints "Hello, Brian!"


//Example 1a - same as Example 1 but shorter
func greetAgain(person: String) -> String {
    return "Hello again, " + person + "!"
}
print(greetAgain(person: "Anna"))
// Prints "Hello again, Anna!"


//Example 2 - Multiple parameters
func greet(person: String, alreadyGreeted: Bool) -> String {
    if alreadyGreeted {
        return greetAgain(person: person)
    } else {
        return greet(person: person)
    }
}
print(greet(person: "Kevin", alreadyGreeted: true))
// Prints "Hello again, Kevin!"

// Example 3 - No return value
func greets(person: String) {
    print("Hello, \(person)!")
}
greet(person: "Dave")


// Example 3a - No return value
func printAndCount(string: String) -> Int {
    print(string)
    return string.characters.count
}

func printWithoutCounting(string: String) {
    let _ = printAndCount(string: string)
}

printAndCount(string: "hello, world")
// prints "hello, world" and returns a value of 12
printWithoutCounting(string: "hello, world")
// prints "hello, world" but does not return a value


// Example 4 - Functions with Multiple Return Values
//func minMax(array: [Int]) -> (min: Int, max: Int) {
//    var currentMin = array[0]
//    var currentMax = array[0]
//    for value in array[1..<array.count] {
//        if value < currentMin {
//            currentMin = value
//        } else if value > currentMax {
//            currentMax = value
//        }
//    }
//    return (currentMin, currentMax)
//}

//let bounds = minMax(array: [8, -6, 2, 109, 3, 71])
//print("min is \(bounds.min) and max is \(bounds.max)")
//// Prints "min is -6 and max is 109"

// Example 4a - Functions with Multiple Return Values - Optional tuple return type
func minMax(array: [Int]) -> (min: Int, max: Int)? {
    if array.isEmpty { return nil }
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}
// Optional binding to check if minMax function returns tuple or nil
if let bounds = minMax(array: [8, -6, 2, 109, 3, 71]) {
    print("min is \(bounds.min) and max is \(bounds.max)")
}


// Example 5 - Function Argument labels and parameter names
func someFunction(firstParameterName: Int, secondParameterName: Int) {
    // In the function body, firstParameterName and secondParameterName refer to the argument values for the first and second parameters.
}
someFunction(firstParameterName: 1, secondParameterName: 2)

// Example 5a 
func someFunction(argumentLabel parameterName: Int) {
    // The parameterName label is used inside the function body to refer to the value of the argument (the function's input).
}

// Example 5b
func greet(person: String, from hometown: String) -> String {
    return "Hello \(person)! Glad you could visit from \(hometown)."
}
print(greet(person: "Steve", from: "Cupertino"))


// Example 6 - Omitting Argument labels
func someOtherFunction(_ firstParameterName: Int, secondParameterName: Int) {
    // In the function body, firstParameterName and secondParameterName refer to the argument values for the first and second parameters.
}
someOtherFunction(1, secondParameterName: 2)

// Example 7 - Default Parameter Values
func someMoreOtherFunction(parameterWithoutDefault: Int, parameterWithDefault: Int = 12) {
    // If you omit the second argument when calling this function, then the value of parameterWithDefault is 12 inside the function body.
}
someMoreOtherFunction(parameterWithoutDefault: 3, parameterWithDefault: 6) // parameterWithDefault is 6
someMoreOtherFunction(parameterWithoutDefault: 4) // parameterWithDefault is 12

// Example 8 - Variadic parameters
func arithmeticMean(_ numbers: Double...) -> Double {
    var total: Double = 0
    // The variadic parameter 'numbers' is an array of Doubles
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
arithmeticMean(1, 2, 3, 4, 5)
arithmeticMean(3, 8.25, 18.75)

// Example 9 - In-out Parameters
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 3
var anotherInt = 107
swap(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")


// Example 10 - Function Types as parameter types
func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a + b
}
func multiplyTwoInts (_ a: Int, _ b: Int) -> Int {
    return a * b
}

// A variable called mathFunction that has a type of 'a function that takes two Int values, and returns an Int value
var mathFunction: (Int, Int) -> Int = addTwoInts
print("Result: \(mathFunction(2, 3))")
// Prints "Result: 5"

//Different function with same matching type can be assigned to same mathFunction variable
mathFunction = multiplyTwoInts
print("Result: \(mathFunction(2, 3))")
// Prints "Result: 6"

//You can leave it to Swift to infer the function type when you assign a function to a constant or variable.
let anotherMathFunction = addTwoInts

// Inserting a function as an argument
func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("Result: \(mathFunction(a,b))")
}
printMathResult(addTwoInts, 3, 5)


// Example 11 - Function Types as Return Types
func stepForward(_ input: Int) -> Int {
    return input + 1
}

func stepBackward(_ input: Int) -> Int {
    return input - 1
}

func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    return backward ? stepBackward : stepForward
}

var currentValue = 3
let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
// moveNearerToZero now refers to the stepBackward() function

print("Counting to zero:")
// Counting to zero:
while currentValue != 0 {
    print("\(currentValue)...")
    currentValue = moveNearerToZero(currentValue)
}
print("zero!")
// 3...
// 2...
// 1...
// zero!


// Example 12 - Nested Functions

























