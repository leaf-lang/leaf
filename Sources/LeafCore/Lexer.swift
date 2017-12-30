//
//  Lexer.swift
//  LeafCore
//
//  Copyright 2017 Peter Entwistle
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

public class Lexer {
    
    var tokens: [Token]
    var buffer: String
    var lineNumber: Int
    var charPosition: Int
    
    public init() {
        tokens = [Token]()
        buffer = String()
        lineNumber = 1
        charPosition = 0
    }
    
    public func lex(data: String) -> [Token] {
        
        data.forEach({
            getToken(for: $0)
        })
        if !buffer.isEmpty {
            getToken()
        }
        
        print("Total rocognised tokens: \(tokens.count)")
        return tokens
    }
    
    func getToken(for c: Character) {
        if c == " " || c == "\n"  {
            getToken()
        } else {
            buffer.append(c)
        }
        
        if c == "\n" {
            lineNumber += 1
            charPosition = 0
        } else {
            charPosition += 1
        }
    }
    
    func getToken() {
        if let tokenType = TokenType(rawValue: buffer) {
            tokens.append(Token(tokenType: tokenType, value: buffer))
            print(tokens.last!)
        } else {
            if buffer.isIdentifier {
                tokens.append(Token(tokenType: .tokIdentifier, value: buffer))
                print(tokens.last!)
            } else if buffer.isInt {
                tokens.append(Token(tokenType: .tokIntLiteral, value: buffer))
                print(tokens.last!)
            } else if buffer.isDouble {
                tokens.append(Token(tokenType: .tokDoubleLiteral, value: buffer))
                print(tokens.last!)
            } else if !buffer.isEmpty {
                print("Error undefined value: \"\(buffer)\" at \(lineNumber):\(charPosition - buffer.count)")
            }
        }
        buffer.removeAll()
    }
}
