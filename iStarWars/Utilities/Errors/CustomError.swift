//
//  CustomError.swift
//  iStarWars
//
//  Created by Amr Ahmed Elghadban on 23/01/2025.
//

import Foundation

/// CustomError is an enum that conforms to the Error and LocalizedError protocols.
enum CustomError: Error, LocalizedError {
    
    case error(description: String)
    case unknownError
    
    // Provide user-friendly error messages
    var errorDescription: String? {
        switch self {
            case .error(let description):
                return "Error: \(description)"
            case .unknownError:
                return "An unknown error occurred"
        }
    }
    
}
