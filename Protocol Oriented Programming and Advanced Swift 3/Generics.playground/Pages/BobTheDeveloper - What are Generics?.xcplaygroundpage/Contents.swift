//: [Previous](@previous)

import Foundation

//: [Next](@next)

// Generic code is to write flexible, reusable functions and structure
// Example 1:

var stringArray = ["Hi", "Hello", "Bye"]
var intArray = [1, 3, 4, 5, 6]
var doubleArray = [1.2, 3.1, 2.1]

// Print all the elements in an array
func printStringFromArray(a: [String]) {
    for s in a {
        print(s)
    }
}

func printIntFromArray(a: [Int]) {
    for i in a {
        print(i)
    }
}

func printDoubleFromArray(a: [Double]) {
    for d in a {
        print(d)
    }
}

printStringFromArray(a: stringArray)
printIntFromArray(a: intArray)
printDoubleFromArray(a: doubleArray)

// This is where Generics come in handy...
//Example 1

func printElementFromArray<T>(a: [T]) {
    for element in a {
        print(element)
    }
}

printElementFromArray(a: stringArray)
printElementFromArray(a: intArray)
printElementFromArray(a: doubleArray)


func genericFunction<T> (x: T) -> T {
   return x
}

//Example 2
func doNothing<T>(x: T) -> T {
    return x
}

doNothing(x: "123")
doNothing(x: 123)
doNothing(x: 123.123)
doNothing(x: true)

//Example 3 - Structure

struct GenericArray<T> {
    var items = [T]()
    mutating func push(item: T) {
        items.append(item)
    }
}

var myFriendList = ["Hoy", "Huy", "Dan", "Ben"]

var array = GenericArray(items: myFriendList)
array.push(item: "Bob")

array.items
array.push(item: "Rob")
array.items