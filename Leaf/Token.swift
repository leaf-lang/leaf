//
//  Token.swift
//  Leaf
//
//  Created by Peter Entwistle on 12/12/2017.
//  Copyright © 2017 Peter Entwistle. All rights reserved.
//

struct Token {
    let tokenType: TokenType
    let value: String
}
enum TokenType: String {
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
}

