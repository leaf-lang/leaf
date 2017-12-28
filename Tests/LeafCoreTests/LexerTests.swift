//
//  LexerTests.swift
//  LeafCoreTests
//
//  Created by Peter Entwistle on 28/12/2017.
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
