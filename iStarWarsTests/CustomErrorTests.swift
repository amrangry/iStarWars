//
//  CustomErrorTests.swift
//  iStarWarTests
//
//  Created by Amr Ahmed Elghadban on 23/01/2025.
//

import XCTest
@testable import iStarWars

class CustomErrorTests: XCTestCase {

    func testErrorWithDescription() {
        // Given
        let testName = "testErrorWithDescription"
        let customError = CustomError.error(description: testName)

        // When
        let valueDescription = customError.errorDescription

        // Then
        XCTAssertNotNil(valueDescription, "Error description should not be nil")
        XCTAssertEqual(valueDescription, "Error: \(testName)", "Error description should match")

    }

    func testUnknownError() {
        // Given
        let testName = "testErrorWithDescription"
        let customError = CustomError.unknownError

        // When
        let valueDescription = customError.errorDescription

        // Then
        XCTAssertNotNil(valueDescription, "Error description should not be nil")
        XCTAssertEqual(valueDescription, "An unknown error occurred", "Error description should match")
    }

}
