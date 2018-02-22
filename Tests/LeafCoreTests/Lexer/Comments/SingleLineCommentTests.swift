//
//  SingleLineCommentTests.swift
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

import XCTest
import LeafCore

class SingleLineCommentTests: XCTestCase {
    
    let lexer = Lexer()
    
    func testGivenASingleLineCommentTokenFollowedByASpaceThenAConstDeclaration_ThenOnlyATokCommentSingleIsLexed() {
        let value = lexer.lex(data: """
                                    // let x = 10
                                    """)
        
        XCTAssertEqual(value.count, 1)
        XCTAssertEqual(value.first?.tokenType, .tokCommentSingle)
    }
    
    func testGivenASingleLineCommentFollowedByAConstDeclaration_ThenOnlyATokCommentSingleIsLexed() {
        let value = lexer.lex(data: """
                                    //let x = 10
                                    """)
        
        XCTAssertEqual(value.count, 1)
        XCTAssertEqual(value.first?.tokenType, .tokCommentSingle)
    }
    
    func testGivenASingleLineComment_ThenOnlyATokCommentSingleIsLexed() {
        let value = lexer.lex(data: """
                                    //
                                    """)
        
        XCTAssertEqual(value.first?.tokenType, .tokCommentSingle)
    }
    
    func testGivenASingleLineComment_ThenThatLineIsIgnored() {
        let value = lexer.lex(data: """
                                    // Test comment
                                    let x = 10
                                    """)
        
        XCTAssertEqual(value.first?.tokenType, .tokCommentSingle)
        XCTAssertEqual(value.count, 5)
    }
    
    func testGivenASingleLineCommentAfterAValidStatement_ThenTheStatementIsLexedButTheCommentedOutCodeIsIgnored() {
        let value = lexer.lex(data: """
                                    let x = 10 // var test = "Test"
                                    """)
        
        XCTAssertEqual(value.count, 5)
        XCTAssertEqual(value.last?.tokenType, .tokCommentSingle)
    }
}
