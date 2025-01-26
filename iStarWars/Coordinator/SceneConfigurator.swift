//
//  SceneConfigurator.swift
//  iStarWars
//
//  Created by Amr Ahmed Elghadban on 23/01/2025.
//

import Foundation

/// The SceneConfigurator handles dependency injection, keeping the view code clean and focused on UI.
class SceneConfigurator {
    
    static let shared = SceneConfigurator()
    let apiClient: DataClientProtocol
    let cacheManager: CacheManagerProtocol
    
    private init() {
        self.apiClient = APIClient.shared
        self.cacheManager = CacheManager.shared
    }
    
    //PlanetListView Dependencies
    func configurePlanetViewModel() -> PlanetsViewModel {
        let apiClient = apiClient
        let cacheManager = cacheManager
        let viewModel = PlanetsConfigurator.configure(client: apiClient, cacheManager: cacheManager)
        return viewModel
    }
    
    //PlanetDetailView Dependencies
    func configurePlanetDetailsViewModel(planet: Planet) -> PlanetDetailsViewModel {
        let apiClient = apiClient
        let cacheManager = cacheManager
        let viewModel = PlanetDetailsConfigurator.configure(client: apiClient, cacheManager: cacheManager, model: planet)
        return viewModel
    }
    
}
