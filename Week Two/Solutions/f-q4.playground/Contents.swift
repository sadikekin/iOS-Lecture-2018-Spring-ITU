//: Playground - noun: a place where people can play

import Foundation

func gcd(_ a: Int, _ b: Int) -> Int {
    if(b != 0){
        return gcd(b,a%b)
    }else{
        return a
    }
}

print(gcd(8,25))
print(gcd(8,24))
print(gcd(5,25))

