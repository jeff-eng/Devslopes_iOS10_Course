// Functions Exercise
import UIKit

//Create a function named add that takes two parameters of type Double and returns the sum of the two numbers
func add(firstValue: Double, secondValue: Double) -> Double {
    return firstValue + secondValue
}

//Create a function named subtract that takes two parameters of type Int and returns the difference of the two numbers
func subtract(firstValue: Int, secondValue: Int) -> Int {
    return firstValue - secondValue
}

//Create a function named multiply that takes two parameters of type Float and returns the product of the two numbers
func multiply(firstValue: Float, secondValue: Float) -> Float {
    return firstValue * secondValue
}

//Create a function named divide that takes two parameters of type Double and returns the result of dividing the first parameter by the second
func divide(firstValue: Double, secondValue: Double) -> Double {
    return firstValue / secondValue
}

//Call those functions and pass different values into the parameters - ensure they are producing the correct results
add(firstValue: 1, secondValue: 2)
subtract(firstValue: 1, secondValue: 2)
multiply(firstValue: 3.1, secondValue: 1.2)
divide(firstValue: 1, secondValue: 5)