//: Playground - noun: a place where people can play

import UIKit

var str: String = "Hello, playground"

var firstName = "Jack"
var lastName = "Bauer"

var age = 45

// String concatenation
var fullName = firstName + " " + lastName
// String interpolation
var fullName2 = "\(firstName) \(lastName) is \(age)."

// Practicing methods you can call on strings to perform string manipulation.
fullName.append(" III")

var bookTitle = "bring back our sonics"
bookTitle.capitalized

var chatroomAnnoyingCapsGuy = "PLEASE HELP ME NOW! HERE IS MY 100 LINES OF CODE"
var lowercasedChat = chatroomAnnoyingCapsGuy.lowercased()

// Oh My Heck, Fetch
var sentence = "What the fetch?! Heck that is crazy!"

if sentence.contains("fetch") || sentence.contains("Heck") {
    sentence.replacingOccurrences(of: "fetch", with: "floppity")
    sentence.replacingOccurrences(of: "Heck", with: "Wompus")
}