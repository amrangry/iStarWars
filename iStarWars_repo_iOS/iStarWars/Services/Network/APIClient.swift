//
//  APIClient.swift
//  iStarWars
//
//  Created by Amr Ahmed Elghadban on 23/01/2025.
//

import Foundation
import Combine

/*
 * The APIClient will handle all network requests.
 * It abstracts the networking logic (e.g., URLSession).
 */
class APIClient {
    
    static let shared = APIClient()
    var urlSession: URLSession = URLSession.shared
    
    private init() {}
    
    // Combine
    func request<T: Decodable>(_ url: URL) -> AnyPublisher<T, Error> {
        // Create a URLRequest
        var request = URLRequest(url: url)
        request.cachePolicy = .returnCacheDataElseLoad // Use cached data if available
        
        return urlSession.dataTaskPublisher(for: request)
            .tryMap { data, response in
                try self.validateResponse(response)
                return data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    // Async/Await
    func request<T: Decodable>(_ url: URL) async throws -> T {
        // Create a URLRequest
        let urlRequest = URLRequest(url: url)
        return try await request(urlRequest)
    }
    
    func request<T: Decodable>(_ urlRequest: URLRequest) async throws -> T {
        // Create a URLRequest
        var request = urlRequest
        request.cachePolicy = .returnCacheDataElseLoad // Use cached data if available
        
        // Perform the network request
        let (data, response) = try await urlSession.data(for: request)
        
        try validateResponse(response) // Validate the response
        
        return try JSONDecoder().decode(T.self, from: data)
    }
    
    // MARK: - Helper Methods
    
    // Check if the response is valid (status code 200-299)
    private func validateResponse(_ response: URLResponse) throws {
        guard let httpResponse = response as? HTTPURLResponse else {
            throw URLError(.badServerResponse)
        }
        
        guard (200...299).contains(httpResponse.statusCode) else {
            throw URLError(.badServerResponse)
        }
    }
    
}
