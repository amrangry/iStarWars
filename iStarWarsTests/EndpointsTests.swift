//
//  EndpointsTests.swift
//  iStarWarTests
//
//  Created by Amr Ahmed Elghadban on 23/01/2025.
//

import XCTest
@testable import iStarWars

class EndpointsTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Set the environment to development for testing
        Constants.currentEnvironment = .development
    }
    
    override func tearDown() {
        // Reset the environment after testing
        Constants.currentEnvironment = .production
        super.tearDown()
    }
    
    func testPlanetsURL() {
        // Given
        let endpoint = Endpoints.planets
        
        // When
        let url = endpoint.url
        
        // Then
        XCTAssertNotNil(url, "URL should not be nil for planets endpoint")
        XCTAssertEqual(url?.absoluteString, "https://dev.swapi.dev/api/planets", "Planets URL is incorrect")
    }
    
    func testPlanetDetailsURL() {
        // Given
        let planetID = "1"
        let endpoint = Endpoints.planetDetails(planetID)
        
        // When
        let url = endpoint.url
        
        // Then
        XCTAssertNotNil(url, "URL should not be nil for planetDetails endpoint")
        XCTAssertEqual(url?.absoluteString, "https://dev.swapi.dev/api/planets/1", "PlanetDetails URL is incorrect")
    }
    
    func testPlanetDetailsURLWithEmptyID() {
        // Given
        let planetID = ""
        let endpoint = Endpoints.planetDetails(planetID)
        
        // When
        let url = endpoint.url
        
        // Then
        XCTAssertNil(url, "URL should be nil for empty planetID")
    }
    
    func testPlanetDetailsURLWithSpecialCharacters() {
        // Given
        let planetID = "!@#$%^&*()"
        let endpoint = Endpoints.planetDetails(planetID)
        
        // When
        let url = endpoint.url
        
        // Then
        XCTAssertNil(url, "URL should be nil for planetID with special characters")
        XCTAssertEqual(url?.absoluteString, nil, "PlanetDetails URL with special characters is incorrect")
    }
}
