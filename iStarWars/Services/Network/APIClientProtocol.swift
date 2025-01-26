//
//  APIClientProtocol.swift
//  iStarWars
//
//  Created by Amr Ahmed Elghadban on 25/01/2025.
//

import Foundation

import Foundation
import Combine

/// `APIClientProtocol` defines the requirements that a APIClient must conform to in order to handle network operations.
protocol APIClientProtocol {
    // Combine
    func request<T: Decodable>(_ url: URL) -> AnyPublisher<T, Error>
    
    // Async/Await
    func request<T: Decodable>(_ url: URL) async throws -> T
    func request<T: Decodable>(_ urlRequest: URLRequest) async throws -> T
}
