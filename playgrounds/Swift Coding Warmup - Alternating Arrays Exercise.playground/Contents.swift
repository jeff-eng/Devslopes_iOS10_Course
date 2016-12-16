// Swift Coding Warmup - Alternating Arrays

import UIKit

//Write a function that combines two arrays by alternatingly taking elements. For example: given the two arrays ["a", "b", "c"] and ["bo", "ro", "me"], the function should return ["a", "bo", "b", "ro", "c", "me"].

func combineArrays(firstArray: [Any], secondArray: [Any]) -> Any {
    // Declare and initialize a new empty array to hold all elements from arrays passed into this function
    var comboArray = [Any]()
    
    // Check if both arrays have the same number of elements, otherwise prints and returns a message to the console that tells user the arrays don't have equal numbers of elements.
    if firstArray.count == secondArray.count {
    // Use an enumerated for-each loop to go through the array elements in the first array
        for (index, element) in firstArray.enumerated() {
            // Append the element to the comboArray
            comboArray.append(element)
            // Append the retrieved element using the array subscript syntax from the secondArray with the current index
            comboArray.append(secondArray[index])
        }
        return comboArray
    }
    else {
        print("Arrays are not equal in count. Try again.")
        return "Arrays are not equal in count. Try again."
    }
}

//Test #1 using two arrays of strings
var stringArray1 = ["a", "b", "c"]
var stringArray2 = ["bo", "ro", "me"]
combineArrays(firstArray: stringArray1, secondArray: stringArray2)

//Test #2 using two arrays of integers
var integerArray1 = [100, 200, 300, 400]
var integerArray2 = [111, 222, 333, 444]
combineArrays(firstArray: integerArray1, secondArray: integerArray2)

//Test #3 to make sure the else statement is triggered when the count of array elements are not equal
var stuffArray1 = [1, 2, 3, 4]
var stuffArray2 = ["1", "2", "3", "4", "5"]
combineArrays(firstArray: stuffArray1, secondArray: stuffArray2)
