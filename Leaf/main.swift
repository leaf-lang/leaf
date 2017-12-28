//
//  main.swift
//  Leaf
//
//  Created by Peter Entwistle on 04/12/2017.
//  Copyright © 2017 Peter Entwistle. All rights reserved.
//

import Foundation
//
//print("Hello, World!")
//
//func main() {
//    let array = [10, 20, 30, 40]
//
//    for element in array {
//        print("Value is: \(element)")
//    }
//}
//
//func sum1(x: int, y: int) -> int {
//    return x + y
//}
//
//func sum2(x: int, y: int) -> int {
//    => x + y
//}
//
//func sum1(x: int, y: int) -> int {
//    rn x + y
//}
//
//
//for x in 0..<10 {
//    print("\(x)")
//}

//ASCIIControlCharacter.carriageReturn


//let testData = "let x = 10"
let testData = """
fn test(x: int) -> int {
    return x * 3
}
"""

var tokens = [Token]()
var buffer = String()
var lineNumber = 1
var charPosition = 0

testData.forEach({
    if $0 == " " || $0 == "\n" {
        if let tokenType = TokenType(rawValue: buffer) {
            tokens.append(Token(tokenType: tokenType, value: buffer))
            print(tokens.last!)
        } else {
            if !buffer.isEmpty{
                print("Error undefined value: \"\(buffer)\" at \(lineNumber):\(charPosition - buffer.count)")
            }
        }
        
        buffer.removeAll()
    } else {
        buffer.append($0)
    }
    
    if $0 == "\n" {
        lineNumber += 1
        charPosition = 0
    } else {
        charPosition += 1
    }
})

print("Total rocognised tokens: \(tokens.count)")
