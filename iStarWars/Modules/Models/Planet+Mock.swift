//
//  Planet+Mock.swift
//  iStarWars
//
//  Created by Amr Ahmed Elghadban on 23/01/2025.
//

import Foundation

/// Planets extension
extension Planet {
  
    /// The mockPlanet object provides sample data for the preview.
    /// - Returns: `Planet`
    static func mock() -> Planet {
        let mockPlanet = Planet(
            identifier: "1", // Unique identifier for the planet
            name: "Tatooine", // Name of the planet
            rotationPeriod: "23", // Rotation period in hours
            orbitalPeriod: "304", // Orbital period in days
            diameter: "10465", // Diameter in kilometers
            climate: "arid", // Climate of the planet
            gravity: "1 standard", // Gravity level
            terrain: "desert", // Terrain type
            surfaceWater: "1", // Percentage of surface water
            population: "200000", // Population of the planet
            residents: [ // Array of resident URLs (if any)
                "https://swapi.dev/api/people/1/",
                "https://swapi.dev/api/people/2/"
                       ],
            films: [ // Array of film URLs (if any)
                "https://swapi.dev/api/films/1/",
                "https://swapi.dev/api/films/3/"
                   ],
            created: "2014-12-09T13:50:49.641000Z", // Creation date in ISO format
            edited: "2014-12-20T20:58:18.411000Z", // Last edited date in ISO format
            url: "https://swapi.dev/api/planets/1/" // URL of the planet resource
        )
        return mockPlanet
    }
    
}
