//
//  NetworkError.swift
//  iStarWars
//
//  Created by Amr Ahmed Elghadban on 23/01/2025.
//

import Foundation

/// NetworkError is an enum that conforms to the Error and LocalizedError protocols.
enum NetworkError: Error, LocalizedError {
    
    //Represents network-related errors.
    case networkError(description: String)
    //Represents an invalid URL error.
    case invalidURL
    case noInternetConnection
    case timeout
    
    // Provide user-friendly error messages
    var errorDescription: String? {
        switch self {
            case .networkError(let description):
                return "Network Error: \(description)"
            case .invalidURL:
                return "Invalid URL"
            case .timeout:
                return "Timeout"
            case .noInternetConnection:
                return "No Internet Connection"
        }
    }
    
}
