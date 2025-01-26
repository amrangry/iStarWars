//
//  Constants.swift
//  iStarWars
//
//  Created by Amr Ahmed Elghadban on 23/01/2025.
//

import Foundation

/// Application Constants
struct Constants {
    
    // Configuration Network
    static var currentEnvironment: Environment = .production
    static var baseURL: String {
        return currentEnvironment.baseURL
    }
    // Configuration URLCache
    static let cacheExpiryInterval: TimeInterval = 3600 // 1 hour
    static let cacheSizeMemory = 50 * 1024 * 1024 // 50 MB
    static let cacheSizeDisk = 100 * 1024 * 1024 // 100 MB
    static let cacheDiskPath = "iStarWarCache"
    
}
