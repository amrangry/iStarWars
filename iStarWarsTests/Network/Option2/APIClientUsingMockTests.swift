//
//  APIClientUsingMockTests.swift
//  iStarWarsTests
//
//  Created by Amr Ahmed Elghadban on 25/01/2025.
//

import Foundation
import XCTest
import Combine
@testable import iStarWars

// MARK: - APIClient Tests
class APIClientUsingMockTests: XCTestCase {

    var mockAPIClient: MockAPIClient!
    var cancellables: Set<AnyCancellable>!
    let baseURL = URL(string: "https://amrangry.github.io/api/data")!  // swiftlint:disable:this force_unwrapping

    override func setUp() {
        super.setUp()
        mockAPIClient = MockAPIClient()
        cancellables = []
    }

    override func tearDown() {
        mockAPIClient = nil
        cancellables = nil
        super.tearDown()
    }

    // MARK: - Combine Test
    func testCombineRequest() {
        // Arrange
        let mockURL = baseURL
        let expectedName = MockResponse.getMockedName()
        let expectation = self.expectation(description: "Combine request completes")

        // Act
        mockAPIClient.request(mockURL)
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    XCTFail("Request failed with error: \(error)")
                }
            }, receiveValue: { (response: MockResponse) in
                // Assert
                XCTAssertEqual(response.name, expectedName)
                expectation.fulfill()
            })
            .store(in: &cancellables)

        // Wait
        wait(for: [expectation], timeout: 1.0)
    }

    // MARK: - Async/Await Test
    func testAsyncRequest() async throws {
        // Arrange
        let mockURL = baseURL
        let expectedName = MockResponse.getMockedName()

        do {
            // Act
            let response: MockResponse = try await mockAPIClient.request(mockURL)

            // Assert
            XCTAssertEqual(response.name, expectedName)
        } catch {
            XCTFail("Request failed with error: \(error)")
        }
    }

    // MARK: - Validation Error Test
    func testValidationError() async throws {
        // Arrange
        let mockURL = baseURL

        do {
            // Act
            let _: MockResponse = try await mockAPIClient.request(mockURL)
            XCTFail("Expected validation error, but got success.")
        } catch {
            // Assert
            XCTAssertTrue(error is URLError, "Expected URLError but got \(error)")
        }
    }

}
