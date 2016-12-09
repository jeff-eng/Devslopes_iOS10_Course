// Constants & Logical Operators

import UIKit

// Example of a constant
let allowedEntry = false

if !allowedEntry {
    print("ACCESS DENIED")
}


// Example #1 using logical operators || and &&
let enteredDoorCode = true
let passedRetinaScan = false
let iAmTomCruiseFromMissionImpossible = false

if enteredDoorCode && passedRetinaScan || iAmTomCruiseFromMissionImpossible {
    print("Welcome")
} else {
    print("ACCESS DENIED AGAIN")
}


// Example #2 using logical operators
let hasDoorKey = false
let knowsOverridePassword = true

if hasDoorKey || knowsOverridePassword {
    print("Welcome!!!")
} else {
    print("You still ain't gettin' in foo'!")
}