//: Playground - noun: a place where people can play

import Foundation


// Creating the protocol
protocol squareRootConnectorDelegate{
    func squareRootShouldHappend()
}

// squareRooter function has the delegate as variable
class squareRooter {
    var number: Int
    var squareRootDelegate: squareRootConnectorDelegate?
    
    // We call the function. That funcstion calls the delegated class, which is squareRootHater.
    func takeTheSquare() {
        self.number = self.number * self.number
        squareRootDelegate?.squareRootShouldHappend()
    }
    
    // When we initialize this call, we create it with delegate
    init(withNumber integerNum: Int, withDelegate delegate: squareRootConnectorDelegate) {
        self.squareRootDelegate = delegate
        number = integerNum
    }
}

class squareRootHater: squareRootConnectorDelegate {
    var hatedSquareRoot: squareRooter?
    
    // Creating squareRooter object.
    init() {
        hatedSquareRoot = squareRooter(withNumber: 5, withDelegate: self)
    }
    
    
    // When we call this function. Automaticly delegate calls squareRootShouldHappend function.
    func increaseHateLevel() {
        hatedSquareRoot?.takeTheSquare()
    }
    
    func squareRootShouldHappend() {
        print("I hate you square root!")
    }
}

let letsTakeSquareRoot = squareRootHater()
letsTakeSquareRoot.increaseHateLevel()
