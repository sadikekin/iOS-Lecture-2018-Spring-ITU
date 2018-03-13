import Foundation

// Week 3

/********************************************ClASSES********************************************/

enum PlayerStatus {
    case win, lost, pass
}


class Bank {
    // what the heck is static ?
    // Static variables are belong to a type rather than to instance of class. You can access the static variable by using the full name of the type.
    // Static variables are shared accross all the classes
    static var totalBankAccount = 1500

    static func giveCoinsToPerson(amount: Int) -> Int {
        if (totalBankAccount - amount) < 0 {
            print("Cannot give that amount cause I don't have any :/")
            return 0
        }
        totalBankAccount -= amount
        return amount
    }

    static func receiveMoney(amount: Int) {
        if amount == 500 {
            print("Yes, I got my all money back.")
        } else if amount == 0 {
            print("This player owes me all my money.")
        } else {
            print("This player owes me \(amount). Not all but, not \(amount)")
        }
        totalBankAccount += amount
    }
}

class Player {
    static var counter = 1
    let playerCounter: Int
    let fullName: String
    var totalMoney: Int
    var playerStatus: PlayerStatus = .pass

    // initializer
    init(fullName: String, totalMoney: Int) {
        self.playerCounter = Player.counter
        print("Init invoked and this is the player with number: \(playerCounter)")
        self.fullName = fullName
        self.totalMoney = Bank.giveCoinsToPerson(amount: totalMoney)
        print("Banks total amount is: \(Bank.totalBankAccount)")
        Player.counter += 1
    }

    // de-init

    deinit {
        print("\nDeinit invoked!")
        Bank.receiveMoney(amount: totalMoney)
        print("Banks total amount after receiving is: \(Bank.totalBankAccount)")
    }

    func playerDescription() {
        print("Player \(playerCounter) is playing...")
    }

    func playDeadlyRound() -> PlayerStatus{
        playerDescription()
        let randomNumber = arc4random() % 2 + 1
        if randomNumber == 1{
            print("I have saved the round")
            playerStatus = .pass
        } else {
            if totalMoney >= 500 {
                print("I pay 500 and go on.")
                totalMoney -= 500
                playerStatus = .pass
            } else {
                playerStatus = .lost
            }

        }
        sleep(1)
        return playerStatus
    }
}

class Coder: Player {
    let superStrength: Bool

    init(fullName: String, totalMoney: Int, superStrength: Bool) {
        self.superStrength = superStrength
        if superStrength {
            super.init(fullName: fullName, totalMoney: 0)
            self.totalMoney = 9999999
        } else {
            super.init(fullName: fullName, totalMoney: totalMoney)
        }
    }

    override func playDeadlyRound() -> PlayerStatus {
        playerDescription()
        let randomNumber = arc4random() % 2 + 1
        if randomNumber == 1{
            print("I have saved the round")
            playerStatus = .pass
        } else {
            if !superStrength{
                if totalMoney >= 500 {
                    print("I pay 500 and go on")
                    totalMoney -= 500
                    playerStatus = .pass
                } else {
                    playerStatus = .lost
                }
            }
        }
        sleep(1)
        return playerStatus
    }
}


var player: Player?
var coder: Coder?

player = Player(fullName: "Sadik Ekin Ozbay", totalMoney: 500)
coder = Coder(fullName: "Korel Hayrullah", totalMoney: 100000, superStrength: false)

if let player = player, let coder = coder {
    while(true){
        if player.playDeadlyRound() == .lost {
            print("Player 1 lost the game.")
            //player = nil
            break
        }
        if coder.playDeadlyRound() == .lost {
            print("Player 2 lost the game.")
            //coder = nil
            break
        }
    }
}

player = nil
coder = nil



/********************************************EXTENSIONS********************************************/

extension Double {
    func intify() -> Int{
        return Int(self)
    }
}
extension Int {
    func doublify() -> Double {
        return Double(self)
    }
}


var a = 5
var b = 6.8

let sum = a + b.intify()
let sum2 = a.doublify() + b


/********************************************PROTOCOLS********************************************/

protocol HumanProtocol {
    var name: String { get set }
    var surname: String { get set }
    func fullName() -> String
}


class Human: HumanProtocol {
    var name: String = "Default Name"
    var surname: String = "Default Surname"
    var age: Int
    
    init(name: String, surname: String, age: Int) {
        self.name = name
        self.surname = surname
        self.age = age
    }
    
    
    func fullName() -> String {
        return name + " " + surname
    }
    
    func humanDesription() -> (name: String, surname: String, age: Int){
        return (name, surname, age)
    }
}


let human = Human(name: "Sadik", surname: "Ekin Ozbay", age: 22)


print(human.humanDesription().name)


protocol StackProtocol {
    associatedtype Element
    mutating func push(item: Element)
    mutating func pop() -> Element?
    func isEmpty() -> Bool
}



/********************************************GENERICS********************************************/

func swapTwoValues<T>(firstGenericItem: inout T, secondGenericItem: inout T){
    let tempValue = firstGenericItem
    firstGenericItem = secondGenericItem
    secondGenericItem = tempValue
}

var oneInt = 5
var secondInt = 7

print("This is before my swap function: oneInt is: \(oneInt) and secondInt is: \(secondInt)")
swapTwoValues(firstGenericItem: &oneInt, secondGenericItem: &secondInt)
print("This is after my swap function: oneInt is: \(oneInt) and secondInt is: \(secondInt)")


var korel = "Korel"
var ekin = "Ekin"

print("This is before my swap function: korel is: \(korel) and ekin is: \(ekin)")
swapTwoValues(firstGenericItem: &korel, secondGenericItem: &ekin)
print("This is after my swap function: korel is: \(korel) and ekin is: \(ekin)")


struct MyStack<Element> {
    var myStackArray = [Element]()
    // these methods are marked as mutating, because they need to modify (or mutate) the structure’s items array. For class, mutating isn't available. Try yourself!
    
    mutating func pushToStack(item: Element){
        myStackArray.append(item)
    }
    
    mutating func popFromStack() -> Element?{
        if !isEmpty() {
            return myStackArray.removeLast()
        }
        return nil
        
    }
    
    func isEmpty() -> Bool{
        if myStackArray.count == 0{
            print("Stack is empty!")
            return true
        }
        return false
    }
    
    func showStackStatus() {
        print(myStackArray)
    }
}


var myStack = MyStack<Int>()
myStack.pushToStack(item: 5)
myStack.showStackStatus()
myStack.pushToStack(item: 3)
myStack.pushToStack(item: 2)
myStack.pushToStack(item: 1)
myStack.showStackStatus()




var myArray = [4, 6, 3, 2, 8, 5 ,9, 10]

//sort first

myArray.sort()

print(myArray)

var mySecondStack = MyStack<Int>()
for i in myArray {
    mySecondStack.pushToStack(item: i)
}

var myArraySortedAndReversed = [Int]()

while(!mySecondStack.isEmpty()){
    myArraySortedAndReversed.append(mySecondStack.popFromStack()!)
}

print(myArraySortedAndReversed)


struct MyStackWithProtcol<Element>: StackProtocol {
    var myStackArray = [Element]()
    
    mutating func push(item: Element){
        myStackArray.append(item)
    }
    
    mutating func pop() -> Element?{
        if !isEmpty() {
            return myStackArray.removeLast()
        }
        return nil
    }
    
    func isEmpty() -> Bool{
        if myStackArray.count == 0{
            print("Stack is empty!")
            return true
        }
        return false
    }
    
    func showStackStatus() {
        print(myStackArray)
    }
}


/********************************************ERROR HANDLING********************************************/


// To indicate that a function, method, or initializer can throw an error, you write the throws keyword in the function’s declaration after its parameters.

enum MyDummyErrors: Error {
    case hugeError
    case middleError
    case smallError
}



func throwsError(checkStatus: Int) throws -> Int {
    switch checkStatus {
    case 1:
        throw MyDummyErrors.hugeError
    case 2:
        throw MyDummyErrors.middleError
    case 3:
        throw MyDummyErrors.smallError
    default:
        return 1
    }
    
}

do {
    let returnedValue = try throwsError(checkStatus: 3)
    print("This line will only be executed if the function to be tried doesn't throws something")
    print("The returned value is \(returnedValue)")
} catch MyDummyErrors.hugeError {
    print("Huge error caught.")
} catch MyDummyErrors.middleError {
    print("Middle error caught.")
} catch MyDummyErrors.smallError {
    print("Small error caught.")
}


// adding some space to

func anotherThrowingFunction(leMeThrow: Bool) throws -> String {
    if !leMeThrow {
        return "The code has been succesfully executed."
    }
    throw MyDummyErrors.hugeError
}

// Optional handling with throw

let thrownVal = try? anotherThrowingFunction(leMeThrow: false)


// optional handling 1 (optional chaining)
if let thrownVal = thrownVal {
    print("Unwrapped val with optional chaining is: \(thrownVal)")
} else {
    fatalError("Could not unwrap the optional. Found nil.")
}

// optional handling 2 (guard statement)
//guard let thrownVal1 = thrownVal else { fatalError("Could not unwrap the optional. Found nil.") }
//print("Unwrapped val with guard statement is: \(thrownVal!)")

// optional handling 3 (forced unwrapping)
if thrownVal != nil {
   print("Unwrapped val with forced unwrapping is: \(thrownVal!)")
} else {
    fatalError("Could not unwrap the optional. Found nil.")
}

