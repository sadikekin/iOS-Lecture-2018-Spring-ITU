//: Playground - noun: a place where people can play

import Foundation

// Erasable protocol has time and function as blueprint
protocol Erasable {
    var time : Double {get set}
    func eraseIt()
}

// HomeMadeRubber class should inherits from Erable protocol
class HomeMadeRubber : Erasable {
    var time: Double
    func eraseIt() {
        print("Erasing is on process with home made rubber....")
        // When we call the eraseIt function it sleeps according to given time.
        sleep(UInt32(time))
        print("DONE!")
    }
    
    init(withTime time: Double) {
        self.time = time
    }
    
}

// FactoryMadeRubber class should inherits from Erable protocol
class FactoryMadeRubber : Erasable {
    var time: Double
    
    // When we call the eraseIt function it sleeps according to given time.
    func eraseIt() {
        print("Erasing is on process with factory made rubber....")
        sleep(UInt32(time))
        print("DONE!")
    }
    
    init(withTime time: Double) {
        self.time = time
    }
    
}



var beautifulRubber = HomeMadeRubber.init(withTime: 15.0)
var notGoodAsHomeMadeHoweverStillNiceRubber = FactoryMadeRubber(withTime: 40.0)

beautifulRubber.eraseIt()
print("------------------")
notGoodAsHomeMadeHoweverStillNiceRubber.eraseIt()

