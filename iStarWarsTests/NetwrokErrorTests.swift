//
//  NetwrokErrorTests.swift
//  iStarWarTests
//
//  Created by Amr Ahmed Elghadban on 23/01/2025.
//

import XCTest
@testable import iStarWars

class NetworkErrorTests: XCTestCase {
    
    func testNoInternetConnection() {
        //Give
        let error = NetworkError.noInternetConnection
        //When
        let message = error.localizedDescription
        //Then
        XCTAssertNotNil(message, "Error message should not be nil")
        XCTAssertEqual(message, "No Internet Connection", "Error message should matched")
    }
    
    func testInvalidURL() {
        //Give
        let error = NetworkError.invalidURL
        //When
        let message = error.localizedDescription
        //Then
        XCTAssertNotNil(message, "Error message should not be nil")
        XCTAssertEqual(message, "Invalid URL", "Error message should matched")
    }
    
    func testTimeout() {
        //Give
        let error = NetworkError.timeout
        //When
        let message = error.localizedDescription
        //Then
        XCTAssertNotNil(message, "Error message should not be nil")
        XCTAssertEqual(message, "Timeout", "Error message should matched")
    }
    
    func testNetworkErrorWithDescription() {
        //Give
        let testDescription = "Test Description"
        let error = NetworkError.networkError(description: testDescription)
        //When
        let message = error.localizedDescription
        //Then
        XCTAssertNotNil(message, "Error message should not be nil")
        XCTAssertEqual(message, "Network Error: \(testDescription)", "Error message should matched")
    }
    
}
