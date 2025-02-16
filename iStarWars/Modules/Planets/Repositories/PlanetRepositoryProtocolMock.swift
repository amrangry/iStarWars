//
//  PlanetRepositoryProtocolMock.swift
//  iStarWars
//
//  Created by Amr Ahmed Elghadban on 16/02/2025.
//

import Combine

class PlanetRepositoryProtocolMock: PlanetRepositoryProtocol {

    func fetchPlanets() -> AnyPublisher<[Planet], any Error> {
        return Just([Planet.mock()])
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }

    func fetchPlanetDetails(id: String) async throws -> Planet {
        return .mock()
    }

}
