//
//  LexerTests.swift
//  LeafCoreTests
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

import Foundation
import XCTest
import LeafCore

class LexerTests: XCTestCase {
    
    func testFunctionIsCorrectlyLexed() {
        let lexer = Lexer()
        let value = lexer.lex(data: """
                                    fn test(x: int) -> int {
                                        return x * 3
                                    }
                                    """)
        
        XCTAssertEqual(value.count, 15)
    }
    
    func testConstantAssignmentIsCorrectlyLexed() {
        let lexer = Lexer()
        let value = lexer.lex(data: """
                                    let x = 10
                                    """)
        
        XCTAssertEqual(value.count, 4)
        XCTAssertTrue(value.contains(where: { $0.tokenType == .tokLet }))
        XCTAssertTrue(value.contains(where: { $0.tokenType == .tokIdentifier }))
        XCTAssertTrue(value.first(where: { $0.tokenType == .tokIdentifier })?.value == "x")
        XCTAssertTrue(value.contains(where: { $0.tokenType == .tokEq }))
        XCTAssertTrue(value.contains(where: { $0.tokenType == .tokNumber }))
        XCTAssertTrue(value.first(where: { $0.tokenType == .tokNumber })?.value == "10")
    }
    
    func testVariableAssignmentIsCorrectlyLexed() {
        let lexer = Lexer()
        let value = lexer.lex(data: """
                                    var x = 10
                                    """)
        
        XCTAssertEqual(value.count, 4)
        XCTAssertTrue(value.contains(where: { $0.tokenType == .tokVar }))
        XCTAssertTrue(value.contains(where: { $0.tokenType == .tokIdentifier }))
        XCTAssertTrue(value.first(where: { $0.tokenType == .tokIdentifier })?.value == "x")
        XCTAssertTrue(value.contains(where: { $0.tokenType == .tokEq }))
        XCTAssertTrue(value.contains(where: { $0.tokenType == .tokNumber }))
        XCTAssertTrue(value.first(where: { $0.tokenType == .tokNumber })?.value == "10")
    }
}
