// Generics

import UIKit

func intAdder(number: Int) -> Int {
    return number + 1
}

intAdder(number: 15)
//intAdder(number: 15.0) // Shows an error since the parameter accepts an Int, not a Double

func doubleAdder(number: Double) -> Double {
    return number + 1
}

doubleAdder(number: 15.0)


// The use case for Generics
func genericAdder<T: Strideable>(number: T) -> T {
    return number + 1
}

genericAdder(number: 15)
genericAdder(number: 15.0)


// Another example of where generics are useful
func intMultiplier(lhs: Int, rhs: Int) -> Int {
    return lhs * rhs
}

intMultiplier(lhs: 2, rhs: 5)


func doubleMultiplier(lhs: Double, rhs: Double) -> Double {
    return lhs * rhs
}

doubleMultiplier(lhs: 2.0, rhs: 5.0)

protocol Numeric {
    func *(lhs: Self, rhs: Self) -> Self
}

extension Double: Numeric {}
extension Float: Numeric {}
extension Int: Numeric {}

func genericMultiplier<T: Numeric>(lhs: T, rhs: T) -> T {
    return lhs * rhs
}

genericMultiplier(lhs: 5, rhs: 5)
genericMultiplier(lhs: 3.14, rhs: 5)


