// Swift Programming Language - Collection Types (Arrays)

import UIKit

//**CREATING AN EMPTY ARRAY**
var someInts = [Int]() // Initializer syntax
print("someInts is of type [Int] with \(someInts.count) items.")
// Prints "someInts is of type [Int] with 0 items."

someInts.append(3)
// someInts now contains 1 value of type Int
someInts = []
// someInts is now an empty array, but is still of type [Int]


//**CREATE AN ARRAY WITH A DEFAULT VALUE**
var threeDoubles = Array(repeating: 0.0, count: 3)
// threeDoubles is of type [Double], and equals [0.0, 0.0, 0.0]


//**CREATE AN ARRAY BY ADDING TWO ARRAYS TOGETHER**
var anotherThreeDoubles = Array(repeating: 2.5, count: 3)
// anotherThreeDoubles is of type [Double], and equals [2.5, 2.5, 2.5]

var sixDoubles = threeDoubles + anotherThreeDoubles
// sixDoubles is inferred as [Double], and equals [0.0, 0.0, 0.0, 2.5, 2.5, 2.5]


//**CREATING AN ARRAY WITH ARRAY LITERALS**
var shoppingList: [String] = ["Eggs", "Milk"]
// shoppingList has been initialized with two initial items


//**ACCESSING AND MODIFYING AN ARRAY**
// Find out the number of items in an array using the 'count' property
print("The shopping list contains \(shoppingList.count) items.")

//Use the Boolean 'isEmpty' property as a shortcut for checking whether the count property is equal to 0
if shoppingList.isEmpty {
    print("The shopping list is empty.")
} else {
    print("The shopping list is not empty.")
}
// Prints "The shopping list is not empty."

//Add a new item to the end of an array by calling the array's 'append' method
shoppingList.append("Flour")
// shoppingList now contains 3 items, and some is making pancakes

//Append an array of one or more compatible items with the addition assignment operator(+=)
shoppingList += ["Baking Powder"]
//shoppingList now contains 4 items
shoppingList += ["Chocolate Spread", "Cheese", "Butter"]
// shoppingList now contains 7 items

//Retrieve a value from the array by using subscript syntax
var firstItem = shoppingList[0]
// firstItem is equal to "Eggs"

//Change an existing value at given index
shoppingList[0] = "Six eggs"
// the first item in the array is now equal to "Six eggs" rather than "Eggs"

//Use subscript syntax to change a range of values at once
shoppingList[4...6] = ["Bananas", "Apples"]
// shoppingList now contains 6 items.

//Insert an item into the array at specified index using array's 'insert' method.
shoppingList.insert("Maple Syrup", at: 0)
// shoppingList now contains 7 items and "Maple Syrup" is now the first item in the list

//Remove an item from the array with remove(at:) method
let mapleSyrup = shoppingList.remove(at: 0)
// the item that was at index 0 has just been removed
// shoppingList now contains 6 items, and no Maple Syrup
// the mapleSyrup constant is now equal to the removed "Maple Syrup" string

//Remove final item from the array, use removeLast() method
let apples = shoppingList.removeLast()
// the last item in the array has just been removed
// shoppingList now contains 5 items, and no apples
// the apples constant is now equal to the removed "Apples" string


//**ITERATING OVER AN ARRAY**
for item in shoppingList {
    print(item)
}
// Six eggs
// Milk
// Flour
// Baking Powder
// Bananas

//Using the enumerated() method to iterate over an array to get the integer index and its value
for (index, value) in shoppingList.enumerated() {
    print("Item \(index + 1): \(value)")
}
// Item 1: Six eggs
// Item 2: Milk
// Item 3: Flour
// Item 4: Baking Powder
// Item 5: Bananas






