//: Playground - noun: a place where people can play
import Foundation

// Class of Human
class Human {
    private var name = String()
    private var surname = String()
    
    init(withName n: String,withSurname s: String) {
        name = n
        surname = s
    }
    
    func printName() -> String {
        return "\(name)  \(surname)"
    }
}

// Class of Warrior
class Warrior : Human{
    var health = Int()
    
    init(_ h: Int, _ name: String, _ surname: String) {
        // super.init initialize the super class of wariror(Human)
        super.init(withName: name, withSurname: surname)
        health = h
    }
    
    func randomHit(_ enemy: Warrior) {
        enemy.health -= Int(arc4random_uniform(30))
    }
}


var ali = Warrior(100, "Ali", "Bal")
var hasan = Warrior(100, "Hasan", "Kekik")

// If somebody has less health than 0 this function will return true and while will be broken
func checkWinner() -> Bool{
    if(ali.health <= 0){
        print("Winner is \(hasan.printName())")
        return true
    }
    if(hasan.health <= 0){
        print("Winner is \(ali.printName())")
        return true
    }
    return false
}

// If both have health bigger than zero. This while will run
while(ali.health >= 0 && hasan.health >= 0){
    ali.randomHit(hasan)
    if(checkWinner()){
        break
    }
    hasan.randomHit(ali)
    if(checkWinner()){
        break
    }
}


