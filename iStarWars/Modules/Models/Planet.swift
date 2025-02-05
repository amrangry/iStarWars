//
//  Planet.swift
//  iStarWars
//
//  Created by Amr Ahmed Elghadban on 23/01/2025.
//

import Foundation

/// Planet struct
struct Planet: Codable, Identifiable {
    /// Unique identifier for SwiftUI
    let id = UUID()
    /// Custom identifier based on the array index
    var index: String?
    let name, rotationPeriod, orbitalPeriod, diameter: String?
    let climate, gravity, terrain, surfaceWater: String?
    let population: String?
    let residents, films: [String]?
    let created, edited: String?
    let url: String?
    
    enum CodingKeys: String, CodingKey {
        case index
        case name
        case rotationPeriod = "rotation_period"
        case orbitalPeriod = "orbital_period"
        case diameter, climate, gravity, terrain
        case surfaceWater = "surface_water"
        case population, residents, films, created, edited, url
    }
    
}

extension Planet: KeyIdentifiable {
    
    var identifierKey: ValueWrapper? {
        if let value = index {
            return ValueWrapper.string(value)
        } else {
            return nil
        }
    }
    
}

// all associated values in the NavigationPath enum need conform to Hashable and Equatable
extension Planet: Equatable {
    
    // Implement Equatable conformance
    static func == (lhs: Planet, rhs: Planet) -> Bool {
        return lhs.id == rhs.id // Compare based on the unique identifier
    }
    
}

// all associated values in the NavigationPath enum need conform to Hashable and Equatable
extension Planet: Hashable {
    
    // Implement Hashable conformance
    func hash(into hasher: inout Hasher) {
        hasher.combine(id) // Use the unique identifier for hashing
    }
    
}
