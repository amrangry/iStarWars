//
//  PlanetRowViewUITests.swift
//  iStarWarsUITests
//
//  Created by Amr Ahmed Elghadban on 25/01/2025.
//

import XCTest

/// PlanetRowViewUITests class for UI
final class PlanetRowViewUITests: XCTestCase {

    let app = XCUIApplication()

    override func setUpWithError() throws {
        // Launch the application before each test
        continueAfterFailure = false
        app.launch()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPlanetRowViewAppearance() throws {
        // Verify that the PlanetRowView is displayed with sample data
//        let planetName = app.staticTexts["Tatooine"] // Replace with your test data
//        XCTAssertTrue(planetName.exists, "Planet name should be visible on screen")

        let climateText = app.staticTexts["Climate: Arid"]
        XCTAssertTrue(climateText.exists, "Climate label should be visible on screen")

        let terrainText = app.staticTexts["Terrain: Desert"]
        XCTAssertTrue(terrainText.exists, "Terrain label should be visible on screen")

        let populationText = app.staticTexts["Population: 200000"]
        XCTAssertTrue(populationText.exists, "Population label should be visible on screen")
    }

    func testPlanetRowViewAccessibilityIdentifiers() throws {
        XCTAssertTrue(app.staticTexts["planetNameLabel"].exists, "Planet name label should exist")
        XCTAssertTrue(app.staticTexts["climateLabel"].exists, "Climate label should exist")
        XCTAssertTrue(app.staticTexts["terrainLabel"].exists, "Terrain label should exist")
        XCTAssertTrue(app.staticTexts["populationLabel"].exists, "Population label should exist")
    }

}
