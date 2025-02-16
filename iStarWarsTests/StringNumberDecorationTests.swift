//
//  StringNumberDecorationTests.swift
//  iStarWars
//
//  Created by Amr Ahmed Elghadban on 16/02/2025.
//

import XCTest
@testable import iStarWars

class StringNumberDecorationTests: XCTestCase {

    // MARK: - Test Cases

    func testNegativeValue() {
        XCTAssertEqual("-100".integerDecoration, "0")
    }

    func testZero() {
        XCTAssertEqual("0".integerDecoration, "0")
    }

    func testLessThan500() {
        XCTAssertEqual("499".integerDecoration, "499")
    }

    func test500To999() {
        XCTAssertEqual("500".integerDecoration, "Less than 1K")
        XCTAssertEqual("999".integerDecoration, "Less than 1K")
    }

    func testThousands() {
        XCTAssertEqual("1000".integerDecoration, "1K")
        XCTAssertEqual("2000".integerDecoration, "2K")
        XCTAssertEqual("2500".integerDecoration, "2.5K")
        XCTAssertEqual("999999".integerDecoration, "999.9K") // Edge case for thousands
    }

    func testMillions() {
        XCTAssertEqual("1000000".integerDecoration, "1M")
        XCTAssertEqual("1500000".integerDecoration, "1.5M")
        XCTAssertEqual("999999999".integerDecoration, "999.9M") // Edge case for millions
    }

    func testBillions() {
        XCTAssertEqual("1000000000".integerDecoration, "1B")
        XCTAssertEqual("1200000000".integerDecoration, "1.2B")
        XCTAssertEqual("999999999999".integerDecoration, "999.9B") // Edge case for billions
    }

    func testTrillions() {
        XCTAssertEqual("1000000000000".integerDecoration, "1T")
        XCTAssertEqual("1500000000000".integerDecoration, "1.5T")
        XCTAssertEqual("1000000000000000".integerDecoration, "1000T") // Edge case for trillions
    }

    func testInvalidInput() {
        XCTAssertNil("abc".integerDecoration) // Non-numeric input
        XCTAssertNil("12.34".integerDecoration) // Floating-point input
    }

}
