//
//  IdentifierTests.swift
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

class IdentifierTests: XCTestCase {
    
    func testGivenAnIdentifierWithASpace_ThenTheIdentifierIsInvalid() {
        XCTAssertFalse("identifier WithASpace".isIdentifier)
    }
    
    func testGivenAnIdentifierWithoutASpace_ThenTheIdentifierIsValid() {
        XCTAssertTrue("identifierWithoutASpace".isIdentifier)
    }
    
    func testGivenAnIdentifierInAllCapitals_ThenTheIdentifierIsValid() {
        XCTAssertTrue("IDENTIFIERINALLCAPS".isIdentifier)
    }
    
    func testGivenAnIdentifierInAllLowercase_ThenTheIdentifierIsValid() {
        XCTAssertTrue("identifierinalllowercase".isIdentifier)
    }
    
    func testGivenAnIdentifierWithMixedCase_ThenTheIdentifierIsValid() {
        XCTAssertTrue("identifierInUpperAndLowercase".isIdentifier)
    }
    
    func testGivenAnIdentifierContainingLettersAndNumbers_ThenTheIdentifierIsValid() {
        XCTAssertTrue("l4tt4rsAndNumb4rs".isIdentifier)
    }
    
    func testGivenAnIdentifierContainingJustNumbers_ThenTheIdentifierIsInvalid() {
        XCTAssertFalse("123456".isIdentifier)
    }
    
    func testGivenAnIdentifierWithHyphon_ThenTheIdentifierIsInvalid() {
        XCTAssertFalse("invalid-separatedIdentifier".isIdentifier)
    }
    
    func testGivenAnIdentifierWithUnderscores_ThenTheIdentifierIsValid() {
        XCTAssertTrue("valid_separatedIdentifier".isIdentifier)
    }
    
    func testGivenAnIdentifierBeginsWithANumber_ThenTheIdentifierIsInvalid() {
        XCTAssertFalse("64CannotBeginWithANumber".isIdentifier)
    }
    
    func testGivenAnEmptyIdentifier_ThenTheIdentifierIsInvalid() {
        XCTAssertFalse("".isIdentifier)
    }
}
