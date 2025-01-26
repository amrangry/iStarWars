//
//  CacheManagerProtocol.swift
//  iStarWars
//
//  Created by Amr Ahmed Elghadban on 25/01/2025.
//

import Foundation

/// `CacheManagerProtocol` defines the requirements that a cache manager must conform to in order to handle caching operations.
protocol CacheManagerProtocol {
    
    func data(for url: URL) -> Data?
    func cache(_ data: Data, for url: URL)
    func isCacheExpired(for url: URL, maxAge: TimeInterval) -> Bool
    func removeCachedData(for url: URL)
    func clearCache()
    func getCacheExpiryInterval() -> TimeInterval?
    func setCacheExpiryInterval(_ value: TimeInterval)
    
}
