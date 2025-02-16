//
//  PeopleConfigurator.swift
//  iStarWars
//
//  Created by Amr Ahmed Elghadban on 13/02/2025.
//

import Foundation

/// PeopleConfigurator acting as scene configurator
class PeopleConfigurator {
    
    static func configure(client: DataClientProtocol, cacheManager: CacheManagerProtocol) -> PeopleViewModel {
        let apiClient = client
        let cacheManager = cacheManager
        let repository = PeopleRespsitoryAPI(apiClient: apiClient, cacheManager: cacheManager)
        let useCase = FetchPeopleUseCase(repository: repository)
        let viewModel = PeopleViewModel(fetchUseCase: useCase)
        return viewModel
    }
    
}
