//: Playground - noun: a place where people can play

import Foundation

var strOne: String
var floatOne: Float = 3.14
var intOne: Int
var doubleOne: Double = 3.1455555555555
var boolOne: Bool = true // false

var 🤮 = "UO"
var smile = "🙂"
var stringValueOne = "1"
var multiLineString = """
This
is
an
multiline
string
"""

var intValueOne = Int(stringValueOne)
var stringValueFive = String(5)
var intString = Int("Five")

var red,green,blue: Double
// This is a comment
/*
 This is another comment
 */

var strTwo = "hello"



var optinalString: String?
var notOptinalString = optinalString ?? "Value is nil"
print(optinalString ?? "Value is nil")
print(notOptinalString)

print("This value is \(stringValueFive)")

if let notOptinalStringTwo = optinalString {
    print("Inside of if")
    print(notOptinalStringTwo)
}

let valueTuple: (s: String, i: Int,b:  Bool)
valueTuple.s = "5"
valueTuple.i = 4
valueTuple.b = true

if(valueTuple.b && false){ // || -> Or
   print("tuple Value is \(valueTuple.b)")
}

var stringArray: [String] = ["Five", "One", "Two"]
stringArray.append("5")
stringArray.append("1")
stringArray.append("2")

for e in stringArray {
    print(e)
}

var f = 10
repeat {
    print("Something")
    f -= 1
}while(f >= 0)

while f < 10 {
    print("f is : \(f)")
    f += 1
}



var tupleArray: [(String, Int)] = [("ali", 100),("ayse", 95),("mahmut", 50), ("hasan", 70)]
// == <= >= > <

var max: (String, Int) = ("", 0)
for t in tupleArray {
    if(t.1 > max.1){
        max.1 = t.1
        max.0 = t.0
    }
}

print(max.0)

var dic = [String: String]()
dic["ali"] = "100"
dic["ayse"] = "95"
print("mark of ayse is \(dic["ali"] ??  "that student does not have a mark")")
print(tupleArray)

let stringHelloWorld = "Hello World!"
var stringHelloWorldCharArray: [Character] = ["H", "e", "l", "l", "o" ]

let stringFromStringHelloWorldCharArray = String(stringHelloWorldCharArray)
print(stringFromStringHelloWorldCharArray)


let thisValueIsOne = 1
let thisValueIsNotOne=1

switch thisValueIsNotOne {
case 1:
    print("One")
case 2:
    print("Two")
default:
    print("Not One And Two")
}

if(thisValueIsNotOne == 1){
    print("One")
}else if(thisValueIsNotOne == 2){
    print("Two")
}else{
    print("Not One And Two")
}
let tupleFour = (name: "Korel",surname:  "Hayrullah")

switch tupleFour {
case ("Korel", let surname):
    print("\(surname)")
default:
    print("No Korel is found")
}

if(tupleFour.name == "Korel"){
    print(tupleFour.surname)
}else{
    print("No Korel is found")
}

let IntNine = 9

switch IntNine {
case 0...9:
    print(IntNine)
default:
    print("Not Nine")
}

if(IntNine >= 0 && IntNine <= 9){
    print(IntNine)
}else{
    print("Not Nine")
}

for _ in 0..<10 {
    print(9)
}

var tupleMarks = [("ali", 95),("mahmut", 30),("ayse", 25),("hasan", 60),("ali", 80)]

var counter: Int = 0
while counter < tupleMarks.count {
    if tupleMarks[counter].0 == "ali"{
        tupleMarks[counter].1 += 1
    }
    counter += 1
}
// + - * / %
print(10%4)
print(tupleMarks)






























