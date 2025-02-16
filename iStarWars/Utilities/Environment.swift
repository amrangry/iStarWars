//
//  Environment.swift
//  iStarWars
//
//  Created by Amr Ahmed Elghadban on 23/01/2025.
//

import Foundation

/// Application Environment
enum Environment {

    case development
    case staging
    case production

    var baseURL: String {
        switch self {
            case .development:
                return "https://dev.swapi.dev/api"
            case .staging:
                return "https://staging.swapi.dev/api"
            case .production:
                return "https://swapi.dev/api"
        }
    }

}
