//
//  PlanetsCoordinator.swift
//  iStarWars
//
//  Created by Amr Ahmed Elghadban on 23/01/2025.
//

import Foundation

/// PlanetsConfigurator acting as scene configurator
class PlanetsConfigurator {
    
    static func configure(client: DataClientProtocol, cacheManager: CacheManagerProtocol) -> PlanetsViewModel {
        let apiClient = client
        let cacheManager = cacheManager
        let repository = PlanetRepositoryAPI(apiClient: apiClient, cacheManager: cacheManager)
        let useCase = FetchPlanetsUseCase(repository: repository)
        let planetViewModel = PlanetsViewModel(fetchPlanetsUseCase: useCase)
        return planetViewModel
    }
    
}

