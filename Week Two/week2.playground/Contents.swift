//: Playground - noun: a place where people can play

import Foundation
/// ---------------- Function ----------------
// This tuple
var tuple : (String, String) = ("ali", "bal")
tuple = ("ahmet","balci")

if(tuple.0 == "ahmet"){
    print("Your name is \(tuple.0)")
}else {
    print("Your name is not \(tuple.0)")
}

for i in 0..<3{
    print(i)
}



func thisIsAFunc() {
    print("Hello, I am a func")
    print("Hello, I am at second line")
}

func helloWorld(name: String, surname: String) {
    print("hello \(name) \(surname)")
}

func funcWithReturn(_ a: Int, _ b: Int) -> Double {
    if(b == 0){
        return -1
    }
    return Double(a/b)
}

func returnTuple(_ a: Int, _ b: Int, _ c: Int, _ d: Int) -> (Int,Int){
    return (a + b, c + d)
}

func recursionSwift(withA a: Int) -> Int {
    if(a == 1){
        return 1
    }
    return a * recursionSwift(withA: a-1)
}

func fib(withN n: Int) -> Int{
    if(n == 1 || n == 0){
        return 1
    }
    return fib(withN: n-1) + fib(withN: n-2)
}

func funcThatTakesFuncAsParameter(_ sumThem: (Int,Int) -> Int,withA a: Int,withB b: Int){
    print(sumThem(a,b))
}
func workerSum(_ a: Int, _ b: Int) -> Int {
    return a + b
}

func concatStrings(_ a: String, _ b: String) -> String {
    return a + b
}

func functionWithMultipleParameter(_ inputs: String...) -> String {
    let takenInputs = inputs
    var totalString = ""
    for e in takenInputs{
        totalString += e
    }
    return totalString
}

func anotherStringFucn(_ inputs: String...) -> Int{
    var intA = 0
    for input in inputs {
        if input.first == "a"{
            intA += 1
        }
    }
    
    
    
    return intA
}

// fib(n) = fib(n-1) + fib(n-2)
// 1 1 2 3 5 8 13

thisIsAFunc()
helloWorld(name: "asdf", surname: "asdf")
helloWorld(name: "Ayse", surname: "Kagit")
print(funcWithReturn(5,0))
print(returnTuple(5, 10, 15, 20))
print(recursionSwift(withA: 5))
print(fib(withN: 5))
funcThatTakesFuncAsParameter(workerSum(_:_:),withA: 6, withB: 7)
print(concatStrings("Hello", "iOS"))
print(functionWithMultipleParameter("Hello ", "World", "!", "this", "Is", "a", "fucntion"))

print(anotherStringFucn("ahmet" , "akin", "korel"))


var a = 5

func birArttir(a: inout Int){
    a += 1
}

func thisAndVoidFunction(){
    print("I am inside of a void function")
}

birArttir(a: &a)
print(a)
thisAndVoidFunction()



/// ---------------- Closures ----------------

var IntArray = [5,4,3,2,1,6,4,3,7,8,9]

//IntArray = IntArray.sorted(by: {(e1, e2) -> Bool in
//    return e1 < e2
//})

IntArray = IntArray.sorted(by: {
    $0 > $1
})
print("\(IntArray)")


/// ---------------- Enums ----------------

enum directions {
    case south
    case north
    case east
    case west
}

let selectedDirection = directions.east
if(selectedDirection == .north){
    print("You are going to north")
}else if(selectedDirection == directions.east){
    print("You are going to east")
}else if(selectedDirection == directions.west){
    print("You are going to west")
}else if(selectedDirection == directions.south){
    print("You are going to south")
}


enum color {
    case blue
    case red
    case purple
    case magenta
    case black
    
    func mergeColors(a:color, b: color) -> color{
        if(a == .blue && b == .red){
            return color.magenta
        }
        return .black
    }
}
var selectedColor = color.red
selectedColor = .blue
print(selectedColor.mergeColors(a: color.blue, b: color.red))

if(selectedColor == .blue){
    print("Your color is \(selectedColor)")
}else if(selectedColor == color.red){
    print("Your color is red")
}else if(selectedColor == color.purple){
    print("Your color is purple")
}

enum operation {
    case sum
    case divide
    case subtract
    case multiply
}

func doAnOperation(withOperation oprtn: operation,withA a: Int,withB b: Int ) -> Int {
    if(oprtn == .sum){
        return a + b
    }else if(oprtn == .multiply){
        return a * b
    }else if(oprtn == .divide){
        if(b == 0){
            return Int.max
        }
        return a / b
    }else if(oprtn == .subtract) {
        return a - b
    }
    return Int.max
}

print(doAnOperation(withOperation: operation.subtract, withA: 7, withB: 9))
print(doAnOperation(withOperation: operation.multiply, withA: 8, withB: 2))
print(doAnOperation(withOperation: operation.divide, withA: 8, withB: 0))

/////// ---------------- Struct ----------------
enum petType {
    case dog
    case cat
    case python
}
struct Pet {
    var name: String
    var type: petType
}
struct Human {
    var name: String
    var surname: String
    var age: Int
    var weight: Int
    var height: Int
    var favPet: Pet
    var pets: [Pet]
    
    func returnBMI() -> Double {
        return Double(Double(weight) / Double(height * height))
    }
}
var minnos = Pet(name: "Minnos", type: .cat)
var comar = Pet(name: "Comar", type: .dog)
var pypy = Pet(name: "pypy", type: .python)

var ahmet = Human(name: "Ahmet", surname: "Hayrullah", age: 21, weight: 70, height: 180, favPet: minnos, pets: [minnos, comar, pypy])
print(ahmet.returnBMI())
ahmet.weight = 800
print(ahmet.returnBMI())
print(ahmet.favPet.name)

// lecture -> name, crn, [student]
// student -> name, surname, id, gpa(0-100)
// student with max gpa in the lecture
struct student {
    var name: String
    var surname: String
    var id: String
    var gpa: Int
}

struct lecture {
    var name: String
    var crn: String
    var registeredStudents: [student]
    
    func findMostSuccessfullStudent() -> student {
        var maxStudent = student(name: "", surname: "", id: "", gpa: 0)
        for s in registeredStudents {
            if(s.gpa > maxStudent.gpa){
                maxStudent = s
            }
        }
        return maxStudent
    }
}

let ahmetTwo = student(name: "ahmet", surname: "hayrullah", id: "150140709", gpa: 60)
let ayseTwo = student(name: "ayse", surname: "boz", id: "150140708", gpa: 80)
let fatmaTwo = student(name: "fatma", surname: "ozbay", id: "150140779", gpa: 90)
let hadiseTwo = student(name: "hadise", surname: "yalcinkaya", id: "150150709", gpa: 50)
let IntroductionToProgramming = lecture(name: "IntroductionToProgramming", crn: "11865", registeredStudents: [ahmetTwo,ayseTwo,fatmaTwo,hadiseTwo])

let studentWithHighestGpa = IntroductionToProgramming.findMostSuccessfullStudent()
print("name: \(studentWithHighestGpa.name), id: \(studentWithHighestGpa.id)")

