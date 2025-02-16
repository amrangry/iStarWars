//
//  PlanetDetailsConfigurator.swift
//  iStarWars
//
//  Created by Amr Ahmed Elghadban on 25/01/2025.
//

import Foundation

/// PlanetDetailsConfigurator acting as scene configurator
class PlanetDetailsConfigurator {
    
    static func configure(client: DataClientProtocol, cacheManager: CacheManagerProtocol, model: Planet) -> PlanetDetailsViewModel { // swiftlint:disable:this line_length
        let apiClient = client
        let cacheManager = cacheManager
        let repository = PlanetRepositoryAPI(apiClient: apiClient, cacheManager: cacheManager)
        let useCase = FetchPlanetDetailsUseCase(repository: repository)
        let viewModel = PlanetDetailsViewModel(useCase: useCase, planet: model)
        return viewModel
    }
    
}
