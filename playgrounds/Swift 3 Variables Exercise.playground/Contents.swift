import UIKit

// EXERCISE: SWIFT 3 VARIABLES
//-----------------------------//

//1. Create a variable with a name of your choosing that has a value of 15.
var dogs = 15

//2. Create a 2nd variable with a name of your choosing that has a value of 5
var cats = 5

//3. Create a 3rd variable that stores that sum of the 1st and 2nd variables (20 should print to the screen)
var animals = cats + dogs

//4. Create a 4th variable that stores the result of a multiplication operation - the stored result should be equal to 45
var product = 9 * 5

//5. Create a 5th variable that stores the result of the 1st variable minus the 2nd variable - the result should be 10
var difference = dogs - cats

//6. Create a 6th variable that stores the result of the 1st variable divided by the 2nd variable - the result should be 3
var divisionResult = dogs / cats

//7. Create 3 new variables of any name and of any value, but all on the same line
var firstValue = 1, secondValue = 2, thirdValue = 3
//Testing that this syntax works
print(firstValue, secondValue, thirdValue)

//8. Create 3 constants (let) of any name and of any value, but all on the same line
let firstPrimeNumber = 2, secondPrimeNumber = 3, thirdPrimeNumber = 5

//9. Create an explicit variable of any name of type Double and don't give it any value
var someCoolValue: Double

//10. Create another explicit variable of any name of type Int but DO give it an initial value of 423
var anotherCoolValue: Int = 423

//11. Create a variable of type String with a value of "Hello"
var firstWord: String = "Hello "

//12. Create another variable of type String with a value of "World"
var secondWord: String = "World"

//13. Create a 3rd variable to store the result of concatenating the first two strings (using the + symbol)
var phrase = firstWord + secondWord

//14. Using that 3rd variable again, store the result of concatenating the first two string but instead using "(someVar)" syntax (string interpolation)
phrase = "\(firstWord) \(secondWord)"
