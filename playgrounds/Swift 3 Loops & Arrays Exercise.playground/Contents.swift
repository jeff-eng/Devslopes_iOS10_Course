// Swift 3 Loops & Arrays Exercise

import UIKit

// EXERCISE ARRAYS

//1) Declare an empty array of type String
var vegetables = [String]()

//2) Declare an explicit array of type Double and initialize it with 4 values
var numbers: [Double] = [1.0, 2.0, 3.0, 4.0]

//3) Declare an array and initialize it with 5 values of any type using type inference
var sandwichOptions = ["Turkey", "Ham", "Roast Beef", "Tuna", "Meatball", "Bologna"]

//4) Use append 3 times in each array
numbers.append(5.0)
numbers.append(6.0)
numbers.append(7.0)

sandwichOptions.append("Reuben")
sandwichOptions.append("Chicken Salad")
sandwichOptions.append("Grilled Chicken")

//5) Use removeAt in each array
let numberAtSecondIndex = numbers.remove(at: 2)
let bologna = sandwichOptions.remove(at: 5)

//6) Use removeAll on one array
numbers.removeAll()
print(numbers) //Prints empty array

//7) Use a new array feature that you haven't learned yet
sandwichOptions.insert("Philly CheeseSteak", at: 2)


// EXERCISE LOOPS
//1) Create an empty array of type Int called oddNumbers
var oddNumbers = [Int]()

//2) Using a standard for-in loop add all odd numbers less than or equal to 100 to the oddNumbers array
for number in 0...100 {
    if number % 2 != 0 {
        oddNumbers.append(number)
    }
}

//3) Create a second array called sums of type Int
var sums = [Int]()

//4) Using a for-in, iterate through oddNumbers array and add the current iteration value + 5 to the sums array
for oddNumber in oddNumbers {
    sums.append(oddNumber + 5)
}

//5) Using a repeat while loop, iterate through the sums array and print "The sum is: x" where x is the current value of the iteration (ie The sum is: 15)
var index = 0
repeat {
    print("The sum is: \(sums[index])")
    index += 1
} while (index < sums.count)

