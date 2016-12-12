// Swift 3 Arrays

import UIKit

// Example 1 from Lecture
var employee1Salary = 45000.0
var employee2Salary = 54000.0
var employee3Salary = 100000.0
var employee4Salary = 20000.0

var employeeSalaries = [employee1Salary, employee2Salary, employee3Salary, employee4Salary]

print(employeeSalaries.count)
var employee5Salary = 33333.0
employeeSalaries.append(employee5Salary)

print(employeeSalaries.count)

employeeSalaries.remove(at: 1)

print(employeeSalaries.count)


// Example 2 from Lecture
var students = [String]()
print(students.count)

students.append("Jon")
students.append("Jacob")
students.append("Jose")
students.append("Jingle")
students.append("Heimer")
students.append("Schmidt")

let jose = students.remove(at: 2)
print(students)
print(jose)


// Example 3 Personal Practice - Starcaft Units
//- Initial units
var SCVHealthPoints = 60
var marineHealthPoints = 40
var fireBatHealthPoints = 50
var ghostHealthPoints = 45
var vultureHealthPoints = 75
var siegeTankHealthPoints = 150
var goliathHealthPoints = 125

//- Create an array to store all of the units health points
var terranUnitsHealthPoints = [SCVHealthPoints, marineHealthPoints, fireBatHealthPoints, ghostHealthPoints, vultureHealthPoints, siegeTankHealthPoints, goliathHealthPoints]
//- Create a new variable to store the dropship's health points rating
var dropshipHealthPoints = 150
//- Add the dropship to the array
terranUnitsHealthPoints.append(dropshipHealthPoints)
//- Marine was killed! Need to remove him from the array
terranUnitsHealthPoints.remove(at: 1)
// How many Terran units are left? Use the count method.
print(terranUnitsHealthPoints.count)
//- Insert a new Terran unit
var scienceVessel = 250
terranUnitsHealthPoints.insert(scienceVessel, at: 3)
print(terranUnitsHealthPoints)
