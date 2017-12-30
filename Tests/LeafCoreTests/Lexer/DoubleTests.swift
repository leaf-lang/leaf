//
//  DoubleTests.swift
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

class DoublerTests: XCTestCase {
    
    func testGivenANumberWithASpaceAfterDot_ThenTheNumberIsInvalid() {
        XCTAssertFalse("687. 567".isDouble)
    }
    
    func testGivenANumberWithASpaceBeforerDot_ThenTheNumberIsInvalid() {
        XCTAssertFalse("687 .567".isDouble)
    }
    
    func testGivenANumberWithASpaceBetweenNumbers_ThenTheNumberIsInvalid() {
        XCTAssertFalse("6 87.567".isDouble)
    }
    
    func testGivenANumberContainingLettersAfterDot_ThenTheNumberIsInvalid() {
        XCTAssertFalse("68.7test567".isDouble)
    }
    
    func testGivenANumberContainingLettersBeforeDot_ThenTheNumberIsInvalid() {
        XCTAssertFalse("687test.567".isDouble)
    }
    
    func testGiven12345Dot6789_ThenTheNumberIsValid() {
        XCTAssertTrue("12345.6789".isDouble)
    }
    
    func testGiven0Dot0_ThenTheNumberIsValid() {
        XCTAssertTrue("0.0".isDouble)
    }
}

