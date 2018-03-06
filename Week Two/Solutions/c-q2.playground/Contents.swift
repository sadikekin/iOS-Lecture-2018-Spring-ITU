//: Playground - noun: a place where people can play

import Foundation

class Stack {
    private var list = [Int]()
    private var max = Int()
    
    init() {
    }
    
    // Pushing the item to list and if that value is bigger than max change the max value
    func push(withValue a: Int) {
        if(a >= max){
            max = a
        }
        list.append(a)
    }
    
    
    func pop() -> Int {
        if list.count != 0 {
            return list.popLast()!
        }else{
            return -1
        }
    }
    func maxItem() -> Int {
        return max
    }
}


let a = Stack()
a.push(withValue: 9)
a.push(withValue: 2)
a.push(withValue: 3)
a.push(withValue: 4)
a.push(withValue: 5)
a.push(withValue: 7)
print(a.maxItem())
print(a.pop())
print(a.pop())

