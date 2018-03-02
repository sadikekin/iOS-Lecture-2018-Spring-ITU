//: Playground - noun: a place where people can play

import Foundation

func makeStringGreatAgain(_ s: String) -> String{
    var returnString = [String]()
    
    // For every character in s we append that character to return string if that character is not equal to space
    for c in s {
        if(c != " "){
           returnString.append(String(c))
        }
    }
    return returnString.joined(separator: " ")
}


print(makeStringGreatAgain("ali ata bak"))
