//: Playground - noun: a place where people can play

import UIKit

// Demonstrating why functions are useful by first showing how ugly it is to repeat code. Below example are performing the same calculation, the area of a shape, over again but with different values.
// Shape 1
var length = 5
var width = 10

var area = length * width

// Shape 2
var length2 = 6
var width2 = 12

var area2 = length2 * width2

// Shape 3
var length3 = 3
var width3 = 8

var area3 = length3 * width3



// The beauty of functions is demonstrated in example below to do the same operation as examples above but using a function that takes inputs, length and width, and returns a value, which is the area.

// Defining the function
func calculateArea(length: Int, width: Int) -> Int {
    let area = length * width
    return area
}

// Calling the function and saving the value returned from the function to a constant.
let shape1 = calculateArea(length: 5, width: 4)
let shape2 = calculateArea(length: 3, width: 2)
let shape3 = calculateArea(length: 3, width: 9)

var bankAccountBalance = 500.00
var sigourneyWeaverAlienStomperShoes = 350.00

func purchaseItem(currentBalance: Double, itemPrice: Double) -> Double {
    if itemPrice <= currentBalance {
        print("Purchased item for: $\(itemPrice)")
        return currentBalance - itemPrice
    } else {
        print("You are broke. You should learn to save money.")
        return currentBalance
    }
}

bankAccountBalance = purchaseItem(currentBalance: bankAccountBalance, itemPrice: sigourneyWeaverAlienStomperShoes)

var retroLunchBox = 40.00

bankAccountBalance = purchaseItem(currentBalance: bankAccountBalance, itemPrice: retroLunchBox)
