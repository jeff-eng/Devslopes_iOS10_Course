// Swift 3 Loops

import UIKit

// Showing how useful loops are by first showing how boring and repetitive not using loops are
var employee1Salary = 45000.0
var employee2Salary = 100000.0
var employee3Salary = 54000.0
var employee4Salary = 20000.0
// Give everyone 10% raises.
employee1Salary = employee1Salary + (employee1Salary * 0.10)
employee2Salary = employee2Salary + (employee2Salary * 0.10)
employee3Salary = employee3Salary + (employee3Salary * 0.10)
employee4Salary = employee4Salary + (employee4Salary * 0.10)

// A little better
var salaries = [45000.0, 100000.0, 54000.0, 20000.0]

//salaries[0] = salaries[0] + (salaries[0] * 0.10)
//salaries[1] = salaries[1] + (salaries[0] * 0.10)
////...


// Repeat-While loop

var index = 0
repeat {
    salaries[index] = salaries[index] * (1.1)
    index += 1
} while (index < salaries.count)

print(salaries)

// For-in loop
for x in 1...5 {
    print("Index: \(x)")
}

for z in 1..<5 {
    print("Index Z: \(z)")
}


for i in 0..<salaries.count {
    salaries[i] = salaries[i] * 1.1
}

// For-each loop
for salary in salaries {
    print("Salary: \(salary)")
}
