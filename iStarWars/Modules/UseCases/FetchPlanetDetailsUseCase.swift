//
//  FetchPlanetDetailsUseCase.swift
//  iStarWars
//
//  Created by Amr Ahmed Elghadban on 23/01/2025.
//

import Foundation

/// The UseCase encapsulates the business logic. It communicates with the Repository to fetch data.
/// The FetchPlanetsUseCase acts as a bridge between the PlanetViewModel and the PlanetRepositoryProtocol
class FetchPlanetDetailsUseCase {
    
    private let repository: PlanetRepositoryProtocol
    
    init(repository: PlanetRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute(parameter: String) async throws -> Planet {
        do {
            return try await repository.fetchPlanetDetails(id: parameter)
        } catch {
            throw error // Or map to a custom error
        }
    }
    
}
