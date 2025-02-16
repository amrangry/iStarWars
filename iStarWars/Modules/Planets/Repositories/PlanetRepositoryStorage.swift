//
//  PlanetRepositoryStorage.swift
//  iStarWars
//
//  Created by Amr Ahmed Elghadban on 28/01/2025.
//

import Foundation
import Combine

class PlanetRepositoryStorage: PlanetRepositoryProtocol {

    func fetchPlanets() -> AnyPublisher<[Planet], any Error> {
        // TODO - implementation
        let planets = [Planet.mock(), Planet.mock()]
        return Just(planets)
            .setFailureType(to: Error.self) // to align with the return type (Publisher)
            .eraseToAnyPublisher()
    }

    func fetchPlanetDetails(id: String) async throws -> Planet {
        // TODO - implementation
        Planet.mock()
    }

}
