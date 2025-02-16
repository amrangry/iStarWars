    //
    //  Planet.swift
    //  iStarWars
    //
    //  Created by Amr Ahmed Elghadban on 23/01/2025.
    //

import Foundation

/**
 {
 "name": "Tatooine",
 "rotation_period": "23",
 "orbital_period": "304",
 "diameter": "10465",
 "climate": "arid",
 "gravity": "1 standard",
 "terrain": "desert",
 "surface_water": "1",
 "population": "200000",
 "residents": [
 "https://swapi.dev/api/people/1/",
 "https://swapi.dev/api/people/2/",
 ],
 "films": [
 "https://swapi.dev/api/films/1/",
 "https://swapi.dev/api/films/3/",
 ],
 "created": "2014-12-09T13:50:49.641000Z",
 "edited": "2014-12-20T20:58:18.411000Z",
 "url": "https://swapi.dev/api/planets/1/"
 }

 */

    /// Planet struct
struct Planet: Codable, Identifiable {
        /// Unique identifier for SwiftUI
    let id = UUID()
        /// Custom identifier based on the array index
    var index: String?
    let name: String?
    let rotationPeriod, orbitalPeriod, diameter: ValueWrapper?
    let climate, gravity, terrain: String?
    let surfaceWater: ValueWrapper?
    let population: ValueWrapper?
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
