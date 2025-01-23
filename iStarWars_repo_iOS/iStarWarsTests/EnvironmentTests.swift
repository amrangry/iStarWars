//
//  EnvironmentTests.swift
//  iStarWarTests
//
//  Created by Amr Ahmed Elghadban on 23/01/2025.
//

import XCTest
@testable import iStarWars

class EnvironmentTests: XCTestCase {
    
    func testDevelopmentBaseURL() {
        // Given
        let environment = Environment.development
        
        // When
        let baseURL = environment.baseURL
        
        // Then
        XCTAssertEqual(baseURL, "https://dev.swapi.dev/api", "Development base URL should match")
    }
    
    func testStagingBaseURL() {
        // Given
        let environment = Environment.staging
        
        // When
        let baseURL = environment.baseURL
        
        // Then
        XCTAssertEqual(baseURL, "https://staging.swapi.dev/api", "Staging base URL should match")
    }
    
    func testProductionBaseURL() {
        // Given
        let environment = Environment.production
        
        // When
        let baseURL = environment.baseURL
        
        // Then
        XCTAssertEqual(baseURL, "https://swapi.dev/api", "Production base URL should match")
    }
}
