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

struct MyUnitTestModel: Decodable {
    let id: Int
    let name: String
}

// MARK: - Test Model
class APIClientTests: XCTestCase {
    
    var apiClient: APIClient!
    var cancellables: Set<AnyCancellable>!
    let baseURL = URL(string: "https://amrangry.github.io/api/data")!
    
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
        let mockData = """
        {
            "id": 1,
            "name": "Test"
        }
        """.data(using: .utf8)!
        
        // Set up mock request handler
        MockURLProtocol.requestHandler = { request in
            let response = HTTPURLResponse(url: request.url!, statusCode: 200, httpVersion: nil, headerFields: nil)!
            return (response, mockData)
        }
        
        do {
            let url = baseURL
            let model: MyUnitTestModel = try await apiClient.request(url)
            XCTAssertEqual(model.id, 1)
            XCTAssertEqual(model.name, "Test")
        } catch {
            XCTFail("Request failed with error: \(error)")
        }
    }
    
    func testAsyncRequestFailure() async {
        // Set up mock request handler to simulate a server error
        MockURLProtocol.requestHandler = { request in
            let response = HTTPURLResponse(url: request.url!, statusCode: 500, httpVersion: nil, headerFields: nil)!
            return (response, Data())
        }
        
        do {
            let url = baseURL
            let _: MyUnitTestModel = try await apiClient.request(url)
            XCTFail("Expected request to fail, but it succeeded.")
        } catch {
            XCTAssertTrue(error is URLError)
        }
    }
    
    // MARK: - Combine Tests
    
    func testCombineRequestSuccess() {
        // Mock response data
        let mockData = """
        {
            "id": 1,
            "name": "Test"
        }
        """.data(using: .utf8)!
        
        // Set up mock request handler
        MockURLProtocol.requestHandler = { request in
            let response = HTTPURLResponse(url: request.url!, statusCode: 200, httpVersion: nil, headerFields: nil)!
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
            }, receiveValue: { (model: MyUnitTestModel) in
                XCTAssertEqual(model.id, 1)
                XCTAssertEqual(model.name, "Test")
                expectation.fulfill()
            })
            .store(in: &cancellables)
        
        wait(for: [expectation], timeout: 1)
    }
    
    func testCombineRequestFailure() {
        // Set up mock request handler to simulate a server error
        MockURLProtocol.requestHandler = { request in
            let response = HTTPURLResponse(url: request.url!, statusCode: 500, httpVersion: nil, headerFields: nil)!
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
            }, receiveValue: { (model: MyUnitTestModel) in
                XCTFail("Expected request to fail, but it succeeded.")
            })
            .store(in: &cancellables)
        
        wait(for: [expectation], timeout: 1)
    }
}
