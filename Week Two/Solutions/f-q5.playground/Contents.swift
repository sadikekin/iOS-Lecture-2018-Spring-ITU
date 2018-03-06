//: Playground - noun: a place where people can play

import Foundation


func fib(_ number: Int) -> Int{
    if(number == 1 || number == 2){
        return 1
    }
    return fib(number-2) + fib(number-1)
}


print(fib(6))
print(fib(8))
