//
//  PlanetRepositoryProtocol.swift
//  iStarWars
//
//  Created by Amr Ahmed Elghadban on 23/01/2025.
//

import Combine

/// `PlanetRepositoryProtocol` defines the requirements that a PlanetRepository must conform
/// to in order to handle  operations.
protocol PlanetRepositoryProtocol {
    
    /// Combine
    func fetchPlanets() -> AnyPublisher<[Planet], Error>
    
    /// Async/Await
    func fetchPlanetDetails(id: String) async throws -> Planet
    
}
