// Booleans and conditional logic

import UIKit

var amITheBestTeacherEver = true

amITheBestTeacherEver = false


//Comparison Operators
// Equal to: ==
// Not equal to: !=
// Greater than: >
// Greater than or equal to: >=
// Less than: <
// Less than or equal to: <=

var bankBalance = 400
var itemToBuy = 200

if bankBalance >= itemToBuy {
    print("purchased item")
}

if itemToBuy > bankBalance {
    print("You need mo' money foo!")
}

if itemToBuy == bankBalance {
    print("Hey buddy, your balance is now zero.")
}



// Examples of conditional logic (if-else statements)
var bookTitle1 = "Harry Blotter and the Moppet of Mire"
var bookTitle2 = "Harry Blotter nd the moppet of Mire"

if bookTitle1 != bookTitle2 {
    print("Need to fix spelling before printing")
} else if bookTitle2.characters.count > 10 {
    print("Find a new title for the book")
} else {
    print("Book looks great, send to printer")
}