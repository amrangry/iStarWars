//
//  DataError.swift
//  iStarWars
//
//  Created by Amr Ahmed Elghadban on 23/01/2025.
//

import Foundation

/// DataError is an enum that conforms to the Error and LocalizedError protocols.
enum DataError: Error, LocalizedError {

    // Represents errors that occur during JSON decoding.
    case decodingError(description: String)
    case invalidData

    // Provide user-friendly error messages
    var errorDescription: String? {
        switch self {
            case .decodingError(let description):
                return "Decoding Error: \(description)"
            case .invalidData:
                return "Invalid data"
        }
    }

}
