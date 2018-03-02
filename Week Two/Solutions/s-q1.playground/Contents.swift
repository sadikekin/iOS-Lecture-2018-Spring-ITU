//: Playground - noun: a place where people can play

import Foundation

struct Student {
    var name: String
    var surname: String
    var age: Int
    var gender: String
    var points: Int
    
    init(withName name: String, withSurname surname: String, withAge age: Int, withGender gender: String, withPoints points: Int) {
        self.name = name
        self.surname = surname
        self.age = age
        self.gender = gender
        self.points = points
    }
}

let studentArray = [Student(withName: "Ali", withSurname: "Bal", withAge: 21, withGender: "Man", withPoints: 71), Student(withName: "Hasan", withSurname: "Kazanci", withAge: 23, withGender: "Man", withPoints: 80), Student(withName: "Ayse", withSurname: "Bekci", withAge: 20, withGender: "Woman", withPoints: 69), Student(withName: "Gizem", withSurname: "Kantarci", withAge: 19, withGender: "Woman", withPoints: 90)]

var studentWhoGetHighestPoint = Student(withName: "", withSurname: "", withAge: 0, withGender: "", withPoints: 0)

for s in studentArray {
    if(s.points > studentWhoGetHighestPoint.points){
        studentWhoGetHighestPoint = s
    }
}

print("\(studentWhoGetHighestPoint.name) + \(studentWhoGetHighestPoint.surname)")

