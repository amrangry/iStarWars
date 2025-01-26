//
//  MockAPIClient.swift
//  iStarWarsTests
//
//  Created by Amr Ahmed Elghadban on 25/01/2025.
//

import Foundation
import Combine
@testable import iStarWars

class MockAPIClient: APIClientProtocol {
    
    func request<T: Decodable>(_ url: URL) -> AnyPublisher<T, Error> {
        // Mock response data
        let mockData = MockResponse.getMockedData()
        
        let decodedObject = try! JSONDecoder().decode(T.self, from: mockData)
        return Just(decodedObject)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
    
    func request<T: Decodable>(_ url: URL) async throws -> T {
        let mockData = Data() // Provide mock data here
        return try JSONDecoder().decode(T.self, from: mockData)
    }
    
    func request<T: Decodable>(_ urlRequest: URLRequest) async throws -> T {
        let mockData = Data() // Provide mock data here
        return try JSONDecoder().decode(T.self, from: mockData)
    }
    
}
