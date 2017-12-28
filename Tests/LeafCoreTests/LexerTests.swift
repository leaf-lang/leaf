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
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testFunctionIsCorrectlyLexed() {
        let value = Lexer.lex(data: """
                                    fn test(x: int) -> int {
                                        return x * 3
                                    }
                                    """)
        
        XCTAssertEqual(value.count, 15)
    }
    
    func testConstantAssignmentIsCorrectlyLexed() {
        let value = Lexer.lex(data: """
                                    let x = 10
                                    """)
        XCTAssertEqual(value.count, 4)
        XCTAssertTrue(value.contains(where: { $0.tokenType == .tokLet }))
        XCTAssertTrue(value.contains(where: { $0.tokenType == .tokEq }))
    }
    
    func testVariableAssignmentIsCorrectlyLexed() {
        let value = Lexer.lex(data: """
                                    var x = 10
                                    """)
        XCTAssertEqual(value.count, 4)
        XCTAssertTrue(value.contains(where: { $0.tokenType == .tokVar }))
        XCTAssertTrue(value.contains(where: { $0.tokenType == .tokEq }))
    }
}
