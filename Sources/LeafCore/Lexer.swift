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
    var shouldSkipLine = false
    
    let lineFeed: Character = "\n"
    
    public init() {
        tokens = [Token]()
        buffer = String()
        lineNumber = 1
        charPosition = 0
    }
    
    public func lex(data: String) -> [Token] {
        data.forEach({
            if shouldSkipLine && $0 != lineFeed {
                return
            }
            shouldSkipLine = false
            getToken(for: $0)
        })
        
        if !buffer.isEmpty {
            getToken(buffer: buffer)
        }
        
        //TODO: For debug purposes, remove later
        for token in tokens {
            print(token)
        }
        
        print("Total rocognised tokens: \(tokens.count)")
        return tokens
    }
    
    func getToken(for c: Character) {
        if c == " " || c == lineFeed  {
            getToken(buffer: buffer)
            buffer.removeAll()
        } else {
            buffer.append(c)
        }
        
        if c == lineFeed {
            nextLine()
        } else {
            charPosition += 1
        }
    }
    
    func getToken(buffer: String) {
        if let tokenType = TokenType(rawValue: buffer) {
            tokens.append(Token(tokenType: tokenType, value: buffer))
            
            guard let previousToken = getPreviousToken() else {
                return
            }
            
            if previousToken.tokenType == .tokCommentSingle {
                shouldSkipLine = true
            }
        } else {
            if buffer.isIdentifier {
                tokens.append(Token(tokenType: .tokIdentifier, value: buffer))
            } else if buffer.isInt {
                tokens.append(Token(tokenType: .tokIntLiteral, value: buffer))
            } else if buffer.isDouble {
                tokens.append(Token(tokenType: .tokDoubleLiteral, value: buffer))
            } else if !buffer.isEmpty {
                
                var error = true
                var newBuffer = String()
                for i in buffer {
                    newBuffer.append(i)
                    if let tokenType = TokenType(rawValue: i.description) {
                        newBuffer.removeLast()
                        getToken(buffer: newBuffer)
                        
                        tokens.append(Token(tokenType: tokenType, value: i.description))
                        detectSingleLineComment()
                        
                        newBuffer.removeAll()
                        error = false
                    }
                }
                
                if error {
                    tokens.append(Token(tokenType: .tokInvalid, value: buffer))
                    print("Error undefined value: \"\(buffer)\" at \(lineNumber):\(charPosition - buffer.count)")
                }
            }
        }
    }
    
    func nextLine() {
        lineNumber += 1
        charPosition = 0
    }
    
    func getPreviousToken() -> Token? {
        return tokens.last
    }
    
    func detectSingleLineComment() {
        let lastTwoTokens = Array(tokens.suffix(2))

        guard lastTwoTokens.count == 2 else {
            return
        }
        
        if (lastTwoTokens.first?.tokenType == .tokForwardSlash &&
            lastTwoTokens.last?.tokenType == .tokForwardSlash) {
            tokens = Array(tokens.dropLast(2))
            tokens.append(Token(tokenType: .tokCommentSingle, value: TokenType.tokCommentSingle.rawValue))
            shouldSkipLine = true
        }
    }
}
