//
//  DataErrorTests.swift
//  iStarWarTests
//
//  Created by Amr Ahmed Elghadban on 23/01/2025.
//

import XCTest
@testable import iStarWars

class DataErrorTests: XCTestCase {

    func testInvalidData() {
        // Given
        let error = DataError.invalidData
        // When
        let message = error.localizedDescription
        // Then
        XCTAssertNotNil(message, "Error message shouldn't be nil")
        XCTAssertEqual(message, "Invalid data", "Error message should be matched")
    }

    func testDecodingError() {
        // Given
        let testValue = "some description"
        let error = DataError.decodingError(description: testValue)
        // When
        let message = error.localizedDescription
        // Then
        XCTAssertNotNil(message, "Error message shouldn't be nil")
        XCTAssertEqual(message, "Decoding Error: \(testValue)", "Error message should be matched")
    }

}
