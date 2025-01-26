//
//  APIClientTests.swift
//  iStarWarsTests
//
//  Created by Amr Ahmed Elghadban on 23/01/2025.
//

import XCTest
import Combine
@testable import iStarWars

// MARK: - Test Model
class APIClientTests: XCTestCase {
    
    var apiClient: APIClient!
    var cancellables: Set<AnyCancellable>!
    let baseURL = URL(string: "https://amrangry.github.io/api/data")! //swiftlint:disable:this force_unwrapping
    
    override func setUp() {
        super.setUp()
        apiClient = APIClient.shared
        cancellables = []
        
        // Configure URLSession to use MockURLProtocol
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [MockURLProtocol.self]
        apiClient.urlSession = URLSession(configuration: configuration)
    }
    
    override func tearDown() {
        apiClient = nil
        cancellables = nil
        super.tearDown()
    }
    
    // MARK: - Async/Await Tests
    
    func testAsyncRequestSuccess() async {
        // Mock response data
        let mockData = MockResponse.getMockedData()
        
        // Set up mock request handler
        MockURLProtocol.requestHandler = { request in
            let url = request.url! //swiftlint:disable:this force_unwrapping
            let response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: nil)! //swiftlint:disable:this line_length force_unwrapping
            return (response, mockData)
        }
        
        do {
            let url = baseURL
            let model: MockResponse = try await apiClient.request(url)
            XCTAssertEqual(model.id, MockResponse.getMockedId())
            XCTAssertEqual(model.name, MockResponse.getMockedName())
        } catch {
            XCTFail("Request failed with error: \(error)")
        }
    }
    
    func testAsyncRequestFailure() async {
        // Set up mock request handler to simulate a server error
        MockURLProtocol.requestHandler = { request in
            let response = HTTPURLResponse(url: request.url!, statusCode: 500, httpVersion: nil, headerFields: nil)!  //swiftlint:disable:this line_length force_unwrapping
            return (response, Data())
        }
        
        do {
            let url = baseURL
            let _: MockResponse = try await apiClient.request(url)
            XCTFail("Expected request to fail, but it succeeded.")
        } catch {
            XCTAssertTrue(error is URLError)
        }
    }
    
    // MARK: - Combine Tests
    
    func testCombineRequestSuccess() {
        // Mock response data
        let mockData = MockResponse.getMockedData()
        
        // Set up mock request handler
        MockURLProtocol.requestHandler = { request in
            let response = HTTPURLResponse(url: request.url!, statusCode: 200, httpVersion: nil, headerFields: nil)!  //swiftlint:disable:this line_length force_unwrapping
            return (response, mockData)
        }
        
        let expectation = XCTestExpectation(description: "Combine request succeeds")
        let url = baseURL
        
        apiClient.request(url)
            .sink(receiveCompletion: { completion in
                switch completion {
                    case .finished:
                        break
                    case .failure(let error):
                        XCTFail("Request failed with error: \(error)")
                }
            }, receiveValue: { (model: MockResponse) in
                XCTAssertEqual(model.id, MockResponse.getMockedId())
                XCTAssertEqual(model.name, MockResponse.getMockedName())
                expectation.fulfill()
            })
            .store(in: &cancellables)
        
        wait(for: [expectation], timeout: 1)
    }
    
    func testCombineRequestFailure() {
        // Set up mock request handler to simulate a server error
        MockURLProtocol.requestHandler = { request in
            let response = HTTPURLResponse(url: request.url!, statusCode: 500, httpVersion: nil, headerFields: nil)!  //swiftlint:disable:this line_length force_unwrapping
            return (response, Data())
        }
        
        let expectation = XCTestExpectation(description: "Combine request fails")
        let url = baseURL
        
        apiClient.request(url)
            .sink(receiveCompletion: { completion in
                switch completion {
                    case .finished:
                        XCTFail("Expected request to fail, but it succeeded.")
                    case .failure(let error):
                        XCTAssertTrue(error is URLError)
                        expectation.fulfill()
                }
            }, receiveValue: { (model: MockResponse) in //swiftlint:disable:this unused_closure_parameter
                XCTFail("Expected request to fail, but it succeeded.")
            })
            .store(in: &cancellables)
        
        wait(for: [expectation], timeout: 1)
    }
    
}
