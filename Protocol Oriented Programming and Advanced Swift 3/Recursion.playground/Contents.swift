// Recursion/Recursive Functions

import UIKit

//Factorial of a non-negative integer
// 1! = 1
// 2! = 1 * 2 = 2
// 3! = 1 * 2 * 3 = 6
// 7! = 1 * 2 * 3 * 4 * 5 * 6 * 7  <-- Way too tedious!

//The non-recursive method of calculating the Factorial of a non-negative integer
func factorialFirst(num: Int) -> Int {
    var factorial = 0
    for x in 1...num {
        if factorial != 0 {
            factorial = factorial * x
        } else {
            factorial = 1
        }
    }
    return factorial
}

factorialFirst(num: 7) // prints 5040

//The recursive method of calculating the Factorial of a non-negative integer
func factorial(num: Int) -> Int {
    if num == 1 {
        return 1
    } else {
        return num * factorial(num: num - 1)
    }
}

factorial(num: 7) // prints 5040