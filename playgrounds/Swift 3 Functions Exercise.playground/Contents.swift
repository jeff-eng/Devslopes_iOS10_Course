// EXERCISE: SWIFT 3 FUNCTIONS

import UIKit

//1. Create a function named add that takes two parameters of type Double and returns the sum of the two numbers.

func add(firstValue: Double, secondValue: Double) -> Double {
    return firstValue + secondValue
}


//2. Create a function named subtract that takes two parameters of type Int and returns the difference of the two numbers.
func subtract(firstInteger: Int, secondInteger: Int) -> Int {
    return firstInteger - secondInteger
}


//3. Create a function named multiply that takes two parameters of type Float and returns the product of the two numbers.
func multiply(valueOne: Float, valueTwo: Float) -> Float {
    return valueOne * valueTwo
}


//4. Create a function named divide that takes two parameters of type Double and returns the result of dividing the first parameter by the second.
func divide(dividend: Double, divisor: Double) -> Double {
    return dividend / divisor
}


//5. Call those functions and pass different values into the parameters - ensure they are producing the correct results.

add(firstValue: 2.50, secondValue: 2.25)
subtract(firstInteger: 20, secondInteger: 10)
multiply(valueOne: 5.8, valueTwo: 2.2)
divide(dividend: 4.4, divisor: 2.2)
