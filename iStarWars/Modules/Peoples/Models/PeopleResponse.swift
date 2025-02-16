//
//  PeopleResponse.swift
//  iStarWars
//
//  Created by Amr Ahmed Elghadban on 13/02/2025.
//

import Foundation

struct PeopleResponse: Codable {
    let results: [People]
    let count: Int
    let next: String?
    let previous: String?
    //    "count": 60,
    //    "next": "https://swapi.dev/api/planets/?page=2",
    //    "previous": null,
}
