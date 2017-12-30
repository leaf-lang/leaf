//
//  Token.swift
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

public struct Token {
    public let tokenType: TokenType
    public let value: String
}
public enum TokenType: String {
    // Keywords
    case tokLet = "let"
    case tokVar = "var"
    case tokTrue = "true"
    case tokFalse = "false"
    case tokIf = "if"
    case tokElse = "else"
    case tokReturn = "return"
    case tokFn = "fn"
    case tokFor = "for"
    case tokWhile = "while"
    case tokIn = "in"
    case tokDo = "do"
    case tokSwitch = "switch"
    case tokCase = "case"
    case tokDefault = "default"
    case tokBreak = "break"
    case tokContinue = "continue"
    case tokNull = "null"
    
    // Primatives
    case tokBool = "bool"
    case tokInt = "int"
    case tokLong = "long"
    case tokFloat = "float"
    case tokDouble = "double"
    case tokString = "string"
    case tokChar = "char"
    
    // Brackets
    case tokLParen = "("
    case tokRParen = ")"
    case tokLBrace = "{"
    case tokRBrace = "}"
    case tokLSqBrack = "["
    case tokRSqBrack = "]"
    
    // Special characters
    case tokComma = ","
    case tokDot = "."
    case tokArrow = "->"
    case tokColon = ":"
    case tokSemiColon = ";"
    case tokQuestion = "?"
    
    // Comments
    case tokCommentSingle = "//"
    case tokCommentMultiStart = "/*"
    case tokCommentMultiEnd = "*/"
    
    // Arithmetic operators
    case tokPlus = "+"
    case tokMinus = "-"
    case tokAsterix = "*"
    case tokForwardSlash = "/"
    case tokPercent = "%"
    
    // Assignment operators
    case tokEq = "="
    case tokPlusEq = "+="
    case tokMinusEq = "-="
    
    // Relational operators
    case tokLessThan = "<"
    case tokGreaterThan = ">"
    case tokLessThanEq = "<="
    case tokGreaterThanEq = ">="
    
    // Equality operators
    case tokEqTo = "=="
    case tokNotEqTo = "!="
    
    // Negation operator
    case tokNot = "!"
    
    // Conditional operators
    case tokAnd = "&&"
    case tokOr = "||"
    
    case tokIdentifier
    case tokNumber
}

extension String {
    public var isIdentifier: Bool {        
        return range(of: "^[a-zA-Z][a-zA-Z0-9_]*$", options: .regularExpression) != nil
    }
    
    public var isNumber: Bool {
        return range(of: "^[0-9]+$", options: .regularExpression) != nil
    }
}
