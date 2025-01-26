//
//  CachedManagerTests.swift
//  iStarWarsTests
//
//  Created by Amr Ahmed Elghadban on 23/01/2025.
//

import XCTest
@testable import iStarWars

class CachedManagerTests: XCTestCase {
    
    var cacheManager: CacheManager!
    let testData = Data("myTestData".utf8)
    let testURL = URL(string: "https://amrangry.github.io/api/data")! //swiftlint:disable:this force_unwrapping
    
    override func setUp() {
        super.setUp()
        
        cacheManager = CacheManager.shared
        cacheManager.clearCache() // Clear cache before each test
    }
    
    override func tearDown() {
        super.tearDown()
        
        cacheManager.clearCache() // Clear cache after each test
    }
    
    func testRetunCashedDataIfExistAndNotExpired() {
        //Given
        cacheManager.cache(testData, for: testURL)
        //When
        let dataFromCache = cacheManager.data(for: testURL)
        //Then
        XCTAssertNotNil(dataFromCache, "Data not found in cache")
        XCTAssertEqual(dataFromCache, testData, "Data in cache is not equal")
    }
    
    func testRetunCashedDataIfExpired() {
        //Given
        cacheManager.cache(testData, for: testURL)
        // Simulate cache expiry by setting the timestamp to an old date
        let cache = cacheManager.getCache()
        if let cachedResponse = cache?.cachedResponse(for: URLRequest(url: testURL)) {
            let expiredResponse = CachedURLResponse(
                response: cachedResponse.response,
                data: cachedResponse.data,
                timestamp: Date().timeIntervalSince1970 - Constants.cacheExpiryInterval - 1 // Expired
            )
            cache?.storeCachedResponse(expiredResponse, for: URLRequest(url: testURL))
        }
        //When
        let dataFromCache = cacheManager.data(for: testURL)
        //Then
        XCTAssertNil(dataFromCache, "Data found in cache even though it is expired")
        XCTAssertNotNil(dataFromCache, "Data found in cache even though it is expired")
        XCTAssertEqual(dataFromCache, testData, "Data in cache is not equal")
    }
    
    func testRetunCashedDataWhenNotExist() {
        //Given
        //When
        //Then
    }
    
}
