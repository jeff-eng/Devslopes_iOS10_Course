// Devslopes Bootcamp Day 2

import UIKit

// Coding Warmup - Create a function named calcCircleArea that takes one parameter of type Double called radius. The function should return the area of a circle given the radius.

func calcCircleArea(radius: Double) -> Double {
    return Double.pi * (radius * radius)
}

calcCircleArea(radius: 2)


// Loops

var employee1Salary = 45000.0
var employee2Salary = 54000.0
var employee3Salary = 100000.0
var employee4Salary = 20000.0

//Calculating 10% pay increase for each employee, doing it manually for each one (the repetitive way)
//employee1Salary = employee1Salary + (employee1Salary * 0.10)
//employee2Salary = employee2Salary + (employee2Salary * 0.10)
//employee3Salary = employee3Salary + (employee3Salary * 0.10)
//employee4Salary = employee4Salary + (employee4Salary * 0.10)

//Use a loop along with an array to reduce your code and still complete the calculations
var salaries = [employee1Salary, employee2Salary, employee3Salary, employee4Salary]
//For-in loop
for i in 0..<salaries.count {
    salaries[i] = salaries[i] + (salaries[i] * 0.10)
    print(salaries[i])
}

//Repeat-while loop
var x = 0
repeat {
    //Keep repeating this code until the condition is false
    print("The current index is \(x)")
    x += 1
} while (x < 10) // This is the condition. You need to provide an escape out of a repeat-while loop


// Exercise - Arrays & Loops

//Create an empty array of type Int called oddNumbers
var oddNumbers = [Int]()

//Using a standard for-in loop add all odd numbers less than or equal to 100 to the oddNumbers array
for number in 0...100 {
    if number % 2 != 0 {
        //append to the oddNumbers array
        oddNumbers.append(number)
    }
}

//Create a second array called sums of type Int
var sums = [Int]()

//Using a for-in, iterate through oddNumbers array and add the current iteration value + 5 to the sums array
for currentIndex in 0..<oddNumbers.count {
    sums.append(oddNumbers[currentIndex] + 5)
    
}

//Using a repeat while loop, iterate through the sums array and print "The sum is: x" where x is the current value of the iteration (ie The sum is: 15)

var y = 0
repeat {
    print("The sum is: \(sums[y])")
    y += 1
} while (y < sums.count)


