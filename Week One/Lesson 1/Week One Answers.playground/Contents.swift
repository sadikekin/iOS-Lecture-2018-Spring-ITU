//: Playground - noun: a place where people can play
import Foundation // library that contains all the neccessary elementary stuff

// BOOK REFERENCE: https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/index.html#//apple_ref/doc/uid/TP40014097-CH3-ID0
// Sources https://www.codeforces.com and https://www.leetcode.com.
// Note: Highly recommended two websites for improving your swift knowledge. Plus, some of these questions asked as interview questions at big companies in Silicon Valley like Facebook or Google.

// Week One - Questions

/****************************************************************************************/
// Question 1: Print all numbers from 1 to N that is divisible by both 3 and 5.

// Write your answer below (expand your working area as needed):

let a = 204

// We just loop until n and check if it is divisible by both 3 and 5 which is 15.

for i in 1...a{
    if i % 15 == 0{
        print(i)
    }
}

/****************************************************************************************/
// Question 2: Print “Even” if N is even. Print “Odd” if N is odd.

// Write your answer below (expand your working area as needed):

let b = 5

// if n modulo 2 is 1. that means n is odd.

if b % 2 == 1{
    print("Odd")
}else{
    print("Even")
}

/****************************************************************************************/
// Question 3: Print the are of the and the circumference of circle with given diameter.

// Write your answer below (expand your working area as needed):

let c = 10.0

// In her, circle formulas are implemented.

print("Area: \(Double.pi * c * c)")
print("Circumference: \(Double.pi * c * 2)")

/****************************************************************************************/
// Question 4: Determine number of decimal digits in an unsigned integer. For example, 9
//             is a single digit, 66 has 2 digits and 128685 has 6 digits.

// Write your answer below (expand your working area as needed):

let d = 1023455

// We change value to string and find its size which equals to digit number.

let stringD = String(d)

print("Number of digits: \(stringD.count)")

/****************************************************************************************/
// Question 5: Find the given s is palindrome or not.

// Write your answer below (expand your working area as needed):

let s = "abcba"

// We can not use s[1] in swift. So we have to change String to Char Array.

let stringArray = Array(s)

var isPalindrom = true

for i in 0..<((s.count / 2) + 1){
    // This if checks if string chars equal to each other according to palindrom rules
    if(stringArray[i] != stringArray[s.count-1-i]) {
        isPalindrom = false
        break
    }
}

if isPalindrom {
    print("Palindrom")
} else {
    print("Not a Palindrom")
}

/****************************************************************************************/
// Question 6: Find the given integer n is prime or not.

// Write your answer below (expand your working area as needed):

let n: Double = 11.0 //explicitly declared variable
// can be done also saying let n = 11.0 (by default is adopted as Double)
// also by defining it explicitly there is no need to add a point e.g. let n: Double = 11

var isPrime = true

// We can only look until square root n for checking n is prime or not.

for i in 2...(Int(n.squareRoot())+1){
    if(Int(n)%i == 0 && Int(n) != i){
        isPrime = false
        break
    }
}

if isPrime{
    print("Prime")
} else {
    print("Not Prime")
}

/****************************************************************************************/
// Question 7: Create an ten by ten matrix(all elements are 0 win that matrix) and place
//             5 different 1’s in that array randomly.(You should watch out for not
//             selecting same place again and again.)

// Write your answer below (expand your working area as needed):

var board = [[Int]](repeating: [Int](repeating :0, count: 10), count: 10) // Creatin 10 by 10 board
print(board)

var emptySpaces = [[Int]]()
for i in 0..<10{
    for j in 0..<10{
        emptySpaces.append([i,j])
    }
}

print(emptySpaces)

// In this for we are selecting one empty space randomly and assign 1 to that empty space. Moreover, we are deleting that selected empty space. Because it is not an emtpy space any more.

for _ in 0..<5{
    let selectedEmptySpace = Int(arc4random_uniform(UInt32(emptySpaces.count-1)))
    let selectedLocation = emptySpaces[selectedEmptySpace]
    emptySpaces.remove(at: selectedEmptySpace)
    board[selectedLocation[0]][selectedLocation[1]] = 1
}

print(board)

/****************************************************************************************/
// Question 8: Given an array of integers, return a new array such that each element at
//             index i of the new array is the product of all the numbers in the original
//             array except the one at i.
//             Solve it without using division and in O(n) time ( O(n) time means that you
//             can not use a loop inside the any loop ).
//             For example, if our input was [1, 2, 3, 4, 5], the expected output would
//             be [120, 60, 40, 30, 24]. If our input was [3, 2, 1], the expected output
//             would be [2, 3, 6].

// Write your answer below (expand your working area as needed):

let g = [1,2,3,4,5]

var aFromBeginning = [1]
var aProductBeginning = 1
for e in g {
    aProductBeginning *= e
    aFromBeginning.append(aProductBeginning)
}
// For aFromBeginning Array, we multiply every element one by one and place it to its place.
print("Array Multiplied From Beginning: \(aFromBeginning)")

var aFromEnd = [Int]()
var aProductEnd = 1
for e in  g.reversed(){
    aProductEnd *= e
    aFromEnd.append(aProductEnd)
}
aFromEnd = aFromEnd.reversed()
aFromEnd.append(1)

// For aFromEnd Array, we multiply every element one by one and place it to its place reversely.
print("Array Multiplied From End: \(aFromEnd)")

var finalArray = [Int]()
for i in 1...(g.count) {
    finalArray.append(aFromBeginning[i-1]*aFromEnd[i])
}
// We didn't use division and we didnt use loop inside a loop.
print("Final Solution by using last 2 array: \(finalArray)")


/****************************************************************************************/
// Question 9: Given an integer, convert it to a roman numeral. Number will be between 1
//             and 3999. For example, 41 is “XLI” and 4 is “IV”.

// Write your answer below (expand your working area as needed):

let nn = 41 // n value will be 1 < n < 3999
var ss = ""
// Symbol   I    V    X     L     C      D      M
// Value    1    5    10    50    100    500    1,000
let one = ["0": "", "1": "I", "2": "II", "3": "III", "4": "IV", "5": "V", "6": "VI", "7": "VII", "8": "VIII", "9": "IX"]
let two = ["0": "", "1": "X", "2": "XX", "3": "XXX", "4": "XL", "5": "L", "6": "LX", "7": "LXX", "8": "LXXX", "9": "XC"]
let three = ["0": "", "1": "C", "2": "CC", "3": "CCC", "4": "CD", "5": "D", "6": "DC", "7": "DCC", "8": "DCCC", "9": "CM"]
let four = ["1": "M", "2": "MM", "3": "MMM"]
var i = 0
//Creating reverse array fron given integer and check its digits one by one
let arrayGivenInt = Array(Array(String(nn)).reversed())
while i < arrayGivenInt.count{
    if i == 0 {
        ss = one[String(arrayGivenInt[i])]! + ss
    } else if i == 1 {
        ss = two[String(arrayGivenInt[i])]! + ss
    } else if i == 2 {
        ss = three[String(arrayGivenInt[i])]! + ss
    } else {
        ss = four[String(arrayGivenInt[i])]! + ss
    }
    i += 1 // i = i + 1
}
print(s)

/****************************************************************************************/
// Question 10: Given a string of round, curly, and square open and closing brackets,
//             return whether the brackets are balanced (well-formed).
//             For example, given the string "([])[]({})", you should return true.
//             Given the string "([)]" or "((()", you should return false.

// Write your answer below (expand your working area as needed):

let str = "[]{(})"

var array = [String]()

for e in Array(str){
    // For each element("{", "(", "}") if that element closes we just take its pair form array. If its not we push it to array.
    if e == "]" {
        if let lastElement = array.last {
            if lastElement == "[" {
                array.removeLast()
            }
        }
    } else if e == "}" {
        if let lastElement = array.last {
            if lastElement == "{" {
                array.removeLast()
            }
        }
    } else if e == ")" {
        if let lastElement = array.last {
            if lastElement == "(" {
                array.removeLast()
            }
        }
    } else {
        array.append(String(e))
    }
}
// In the last if we matched every paranthesis. It is true
if array.isEmpty {
    print("True")
} else {
    print("False")
}

/****************************************************************************************/
// Question 11: You will be given a number and you will need to return it as a string in
//              Expanded Form.
//              * expandedForm 12 -- Should return '10 + 2'
//              * expandedForm 42 -- Should return '40 + 2'
//              * expandedForm 70304 -- Should return '70000 + 300 + 4’

// Write your answer below (expand your working area as needed):

var nnn = 70304
var finalStringArray = [String]()
var mm = 1

// while nnn is greater than 0 we append its digits to string array.

while(nnn > 0){
    let temp = String( ( nnn % 10 ) * mm)
    if(temp != "0"){
        finalStringArray.append(temp)
    }
    nnn = nnn / 10
    mm *= 10
}

let reversedFinalStringArray = Array(finalStringArray.reversed())

// we reverse that string array and concatenate them with seperator " + "

let finalString = reversedFinalStringArray.joined(separator: " + ")

print(finalString)
