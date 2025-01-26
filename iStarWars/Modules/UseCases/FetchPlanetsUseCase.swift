//
//  FetchPlanetsUseCase.swift
//  iStarWars
//
//  Created by Amr Ahmed Elghadban on 23/01/2025.
//

import Combine

/// The UseCase encapsulates the business logic.
/// It communicates with the Repository to fetch data.
/// The FetchPlanetsUseCase acts as a bridge between the PlanetViewModel and the PlanetRepository
class FetchPlanetsUseCase {
    
    private let repository: PlanetRepositoryProtocol
    
    init(repository: PlanetRepositoryProtocol = PlanetRepository()) {
        self.repository = repository
    }
    
    func execute() -> AnyPublisher<[Planet], Error> {
        return repository.fetchPlanets()
    }
    
}
