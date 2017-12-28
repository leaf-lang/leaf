//
//  Lexer.swift
//  LeafCore
//
//  Created by Peter Entwistle on 14/12/2017.
//  Copyright © 2017 Peter Entwistle. All rights reserved.
//

public class Lexer {

    public static  func lex(data: String)  -> [Token] {
        var tokens = [Token]()
        var buffer = String()
        var lineNumber = 1
        var charPosition = 0
        
        data.forEach({
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
        
        return tokens
    }
}
