import Foundation

// Week 3 - Practice Questions

// Answer for question 3

enum Departments: String {
    case ComputerEngineering = "Computer Engineering"
    case ElectricalEngineering = "Electrical Engineering"
    case FoodEnginerring = "Food engineering"
    
    func departmentDescription() -> String {
        return self.rawValue
    }
}

enum Errors: Error {
    case quota
    case restriction
    case feeNotPaid
    
    func showError() -> String {
        switch self {
        case .quota:
            return "The quota for this class if currently full."
        case .restriction:
            return "You cannot add class of another department."
        default:
            return "You cannot add class. Please pay your term fee first!"
        }
    }
}

class Student {
    let fullName: String
    let department: Departments
    let id: String
    let feePaid: Bool
    
    
    init(fullName: String, department: Departments, id: String, feePaid: Bool) {
        self.fullName = fullName
        self.department = department
        self.id = id
        self.feePaid = feePaid
    }
    
    func studentDescription() {
        print("\(fullName) -> \(department.departmentDescription()) -> \(id)")
    }
}

let student1 = Student(fullName: "Sadik Ekin Ozbay", department: Departments.ComputerEngineering, id: "151412461", feePaid: true)
let student2 = Student(fullName: "Korel Hayrullah", department: Departments.ComputerEngineering, id: "151413461", feePaid: false)
let student3 = Student(fullName: "Nazmi Adivar", department: Departments.ElectricalEngineering, id: "151212245", feePaid: true)
let student4 = Student(fullName: "Fikret Basaran", department: Departments.ElectricalEngineering, id: "151264245", feePaid: false)
let student5 = Student(fullName: "Vedat Milor", department: Departments.FoodEnginerring, id: "142464342", feePaid: true)

class Lecture {
    let department: Departments
    let quota: Int
    var enrolledStudents: [Student]
    
    init(department: Departments, quota: Int) {
        self.department = department
        self.quota = quota
        self.enrolledStudents = [Student]()
    }
    
    func addStudent(student: Student) throws{
        if !student.feePaid {
            throw Errors.feeNotPaid
        }
        if student.department != department {
            throw Errors.restriction
        }
        if quota == enrolledStudents.count {
            throw Errors.quota
        }
        self.enrolledStudents.append(student)
        student.studentDescription()
        print("Added!")
    }
    
    func showStudentsOfThisClass(){
        print("This class has \(enrolledStudents.count) students currently enrolled.")
        for student in enrolledStudents {
            student.studentDescription()
        }
    }
}

let cLecture = Lecture(department: Departments.ComputerEngineering, quota: 2)


do {
    try cLecture.addStudent(student: student1)
    try cLecture.addStudent(student: student2)
    try cLecture.addStudent(student: student3)
    try cLecture.addStudent(student: student4)
    try cLecture.addStudent(student: student5)
} catch Errors.quota{
    print(Errors.quota.showError())
} catch Errors.restriction {
    print(Errors.restriction.showError())
} catch Errors.feeNotPaid {
    print(Errors.feeNotPaid.showError())
}





