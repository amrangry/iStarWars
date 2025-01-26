//
//  MockCacheManager.swift
//  iStarWarsTests
//
//  Created by Amr Ahmed Elghadban on 25/01/2025.
//

import Foundation
@testable import iStarWars

class MockCacheManager: CacheManagerProtocol {
    
    private var mockCache: [URL: Data] = [:]
    private var mockExpiryIntervals: [URL: TimeInterval] = [:]
    
    func data(for url: URL) -> Data? {
        mockCache[url]
    }
    
    func cache(_ data: Data, for url: URL) {
        mockCache[url] = data
        mockExpiryIntervals[url] = Date().timeIntervalSince1970
    }
    
    func isCacheExpired(for url: URL, maxAge: TimeInterval) -> Bool {
        if let timestamp = mockExpiryIntervals[url] {
            return Date().timeIntervalSince1970 - timestamp > maxAge
        }
        return true
    }
    
    func removeCachedData(for url: URL) {
        mockCache.removeValue(forKey: url)
        mockExpiryIntervals.removeValue(forKey: url)
    }
    
    func clearCache() {
        mockCache.removeAll()
        mockExpiryIntervals.removeAll()
    }
    
    func getCacheExpiryInterval() -> TimeInterval? {
        Constants.cacheExpiryInterval
    }
    
    func setCacheExpiryInterval(_ value: TimeInterval) {}
    
}
