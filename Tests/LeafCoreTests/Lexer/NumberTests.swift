//
//  NumberTests.swift
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

class NumberTests: XCTestCase {
    
    func testGivenANumberWithASpace_ThenTheNumberIsInvalid() {
        XCTAssertFalse("687 567".isInt)
    }
    
    func testGivenANumberContainingLetters_ThenTheNumberIsInvalid() {
        XCTAssertFalse("687test567".isInt)
    }
    
    func testGiven123456789_ThenTheNumberIsValid() {
        XCTAssertTrue("123456789".isInt)
    }
    
    func testGiven0_ThenTheNumberIsValid() {
        XCTAssertTrue("0".isInt)
    }
}
