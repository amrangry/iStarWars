//
//  CacheManagerTests.swift
//  iStarWarsTests
//
//  Created by Amr Ahmed Elghadban on 25/01/2025.
//

import XCTest
@testable import iStarWars

class CacheManagerTests: XCTestCase {
    
    var cacheManager: CacheManagerProtocol!
    let testData = Data("Test Data".utf8)
    let baseURL = URL(string: "https://amrangry.github.io/api/data")! // swiftlint:disable:this force_unwrapping
    
    override func setUp() {
        super.setUp()
        // Use MockCacheManager for testing
        cacheManager = MockCacheManager()
    }
    
    override func tearDown() {
        cacheManager = nil
        super.tearDown()
    }
    
    func testCacheData() {
        // Arrange
        let testURL = baseURL
        
        // Act
        cacheManager.cache(testData, for: testURL)
        let cachedData = cacheManager.data(for: testURL)
        
        // Assert
        XCTAssertNotNil(cachedData)
        XCTAssertEqual(cachedData, testData)
    }
    
    func testCacheExpiry() {
        // Arrange
        let testURL = baseURL
        let expiryInterval: TimeInterval = 5
        
        cacheManager.setCacheExpiryInterval(expiryInterval)
        cacheManager.cache(testData, for: testURL)
        
        // Act
        let isExpiredBeforeTime = cacheManager.isCacheExpired(for: testURL, maxAge: expiryInterval)
        sleep(6) // Simulate time passing to exceed expiry interval
        let isExpiredAfterTime = cacheManager.isCacheExpired(for: testURL, maxAge: expiryInterval)
        
        // Assert
        XCTAssertFalse(isExpiredBeforeTime)
        XCTAssertTrue(isExpiredAfterTime)
    }
    
    func testRemoveCachedData() {
        // Arrange
        let testURL = baseURL
        cacheManager.cache(testData, for: testURL)
        
        // Act
        cacheManager.removeCachedData(for: testURL)
        let cachedData = cacheManager.data(for: testURL)
        
        // Assert
        XCTAssertNil(cachedData)
    }
    
    func testClearCache() {
        // Arrange
        let testURL1 = URL(string: "https://example.com/resource1")! // swiftlint:disable:this force_unwrapping
        let testURL2 = URL(string: "https://example.com/resource2")! // swiftlint:disable:this force_unwrapping
        let testData1 = Data("Test Data 1".utf8)
        let testData2 = Data("Test Data 2".utf8)
        
        cacheManager.cache(testData1, for: testURL1)
        cacheManager.cache(testData2, for: testURL2)
        
        // Act
        cacheManager.clearCache()
        let cachedData1 = cacheManager.data(for: testURL1)
        let cachedData2 = cacheManager.data(for: testURL2)
        
        // Assert
        XCTAssertNil(cachedData1)
        XCTAssertNil(cachedData2)
    }
    
    func testCacheExpiryIntervalSetterAndGetter() {
        // Arrange
        let newExpiryInterval: TimeInterval = 300
        
        // Act
        cacheManager.setCacheExpiryInterval(newExpiryInterval)
        let retrievedExpiryInterval = cacheManager.getCacheExpiryInterval()
        
        // Assert
        XCTAssertEqual(retrievedExpiryInterval, newExpiryInterval)
    }
    
}
