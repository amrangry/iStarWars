//
//  PlanetDetailsConfigurator.swift
//  iStarWars
//
//  Created by Amr Ahmed Elghadban on 25/01/2025.
//

import Foundation

/// PlanetDetailsConfigurator acting as scene configurator
class PlanetDetailsConfigurator: ObservableObject {
    
    static func configure(client: DataClientProtocol, cacheManager: CacheManagerProtocol, model: Planet) -> PlanetDetailsViewModel {
        let apiClient = client
        let cacheManager = cacheManager
        let repository = PlanetRepository(apiClient: apiClient, cacheManager: cacheManager)
        let useCase = FetchPlanetDetailsUseCase(repository: repository)
        let viewModel = PlanetDetailsViewModel(useCase: useCase, planet: model)
        return viewModel
    }
    
}
