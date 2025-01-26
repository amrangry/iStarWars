//
//  MockResponse.swift
//  iStarWarsTests
//
//  Created by Amr Ahmed Elghadban on 25/01/2025.
//

import Foundation

// MARK: - Mock Response Structure
struct MockResponse: Decodable {
    
    let id: Int
    let name: String
    
    static func getMockedData() -> Data {
        let data = Data("""
        {
            "id": 1,
            "name": "Test"
        }
        """.utf8)
        return data
    }
    
    static func getMockedId() -> Int {
        return 1
    }
    
    static func getMockedName() -> String {
        return "Test"
    }
    
}
