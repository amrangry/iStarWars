//
//  PlanetsResponse.swift
//  iStarWars
//
//  Created by Amr Ahmed Elghadban on 23/01/2025.
//

import Foundation

/// PlanetsResponse Entity 
struct PlanetsResponse: Codable {
    let results: [Planet]
    let count: Int
    let next: String?
    let previous: String?
    //    "count": 60,
    //    "next": "https://swapi.dev/api/planets/?page=2",
    //    "previous": null,
}
