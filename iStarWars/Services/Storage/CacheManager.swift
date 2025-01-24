//
//  CacheManager.swift
//  iStarWars
//
//  Created by Amr Ahmed Elghadban on 23/01/2025.
//

import Foundation

class CacheManager {
    
    static let shared = CacheManager()
    private var cache: URLCache
    private var cacheExpiryInterval: TimeInterval
    
    private init() {
        cache = URLCache.shared
        cacheExpiryInterval = Constants.cacheExpiryInterval
    }
    
    static func configure(cacheExpiryInterval: TimeInterval,
                          cacheSizeMemory: Int,
                          cacheSizeDisk: Int,
                          cacheDiskPath: String) {
        let sharedCache = Self.shared
        sharedCache.setCacheExpiryInterval(cacheExpiryInterval)
        // Configure URLCache
        URLCache.shared = URLCache(
            memoryCapacity: cacheSizeMemory,
            diskCapacity: cacheSizeDisk,
            diskPath: cacheDiskPath
        )
        sharedCache.setCache(URLCache.shared)
    }
    
    // Setters & Getters
    
    func getCacheExpiryInterval() -> TimeInterval? {
        self.cacheExpiryInterval
    }
    
    func setCacheExpiryInterval(_ value: TimeInterval) {
        cacheExpiryInterval = value
    }
    
    func getCache() -> URLCache? {
        self.cache
    }
    
    func setCache(_ value: URLCache) {
        cache = value
    }
    
    // Methods
    
    func data(for url: URL) -> Data? {
        if let cachedResponse = cache.cachedResponse(for: URLRequest(url: url)) {
            let isExpired = isCacheExpired(cachedResponse: cachedResponse)
            // Check if the cached data is still valid
            if !isExpired {
                return cachedResponse.data
            } else {
                // Invalidate expired cache
                removeCachedData(for: url)
            }
        }
        return nil
    }
    
    func cache(_ data: Data, for url: URL) {
        let response = URLResponse(
            url: url,
            mimeType: nil,
            expectedContentLength: data.count,
            textEncodingName: nil
        )
        let cachedResponse = CachedURLResponse(
            response: response,
            data: data,
            timestamp: Date().timeIntervalSince1970
        )
        cache.storeCachedResponse(cachedResponse, for: URLRequest(url: url))
    }
    
    func isCacheExpired(for url: URL, maxAge: TimeInterval = Constants.cacheExpiryInterval) -> Bool {
        if let cachedResponse = cache.cachedResponse(for: URLRequest(url: url)) {
            return isCacheExpired(cachedResponse: cachedResponse)
        }
        return true
    }
    
    func removeCachedData(for url: URL) {
        cache.removeCachedResponse(for: URLRequest(url: url))
    }
    
    func clearCache() {
        cache.removeAllCachedResponses()
    }
    
    private func isCacheExpired(cachedResponse: CachedURLResponse) -> Bool {
        let timestamp = cachedResponse.timestamp
        let currentTime = Date().timeIntervalSince1970
        
        // Check if the cached data is still valid
        if currentTime - timestamp <= cacheExpiryInterval {
            return false
        } else {
            return true
        }
    }
    
}

// Extend CachedURLResponse to include a timestamp
extension CachedURLResponse {
    
    convenience init(response: URLResponse, data: Data, timestamp: TimeInterval) {
        var userInfo = [AnyHashable: Any]()
        userInfo["timestamp"] = timestamp
        self.init(response: response, data: data, userInfo: userInfo, storagePolicy: .allowed)
    }
    
    var timestamp: TimeInterval {
        return userInfo?["timestamp"] as? TimeInterval ?? 0
    }
    
}
