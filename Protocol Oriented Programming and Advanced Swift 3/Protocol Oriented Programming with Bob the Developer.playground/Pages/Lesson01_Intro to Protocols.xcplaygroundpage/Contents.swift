import Foundation

// Protocol = blueprints for struct/class/enum

// Coach (protocol) and Athlete (struct)

protocol Humanable {
    var name: String { get set }
    var isAlive: Bool { get set }
    
    func sayHi()
}

struct Human: Humanable {
    var name: String = "Bob"
    var isAlive: Bool = true
    
    func sayHi() {
        print("Hello hi")
    }
}

class Animal: Humanable {
    var name: String = "Bobo"
    var isAlive: Bool = true
    func sayHi() {
        print("Hello hello")
    }
}



protocol FindAreable {
    var area: Double { get set } // 'get set' applies to computed properties
}

struct Square: FindAreable {
    var side: Double = 100
    var area: Double {
        get {
            return side * side
        }
        set {
            side = sqrt(newValue)
        }
    }
}

//For computed property
// get set --> always follow the convention
// get --> do whatever you want including normal property and computed property

var ten = Square(side: 10)
ten.area
ten.area = 500
ten.side