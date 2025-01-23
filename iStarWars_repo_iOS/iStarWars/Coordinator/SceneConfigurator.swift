//
//  SceneConfigurator.swift
//  iStarWars
//
//  Created by Amr Ahmed Elghadban on 23/01/2025.
//

import Foundation

/**
 The SceneConfigurator handles dependency injection, keeping the view code clean and focused on UI.
 */
class SceneConfigurator {
    
    static let shared = SceneConfigurator()
    let apiClient: APIClient
    let cacheManager: CacheManager
    
    private init() {
        self.apiClient = APIClient.shared
        self.cacheManager = CacheManager.shared
    }
    
    //PlanetListView Dependencies
    func configurePlanetViewModel() -> PlanetsViewModel {
        let apiClient = apiClient
        let cacheManager = cacheManager
        let planetRepository = PlanetRepository(apiClient: apiClient, cacheManager: cacheManager)
        let fetchPlanetsUseCase = FetchPlanetsUseCase(repository: planetRepository)
        let planetViewModel = PlanetsViewModel(fetchPlanetsUseCase: fetchPlanetsUseCase)
        return planetViewModel
    }
    
    //PlanetDetailView Dependencies
    func configurePlanetDetailsViewModel(planet: Planet) -> PlanetDetailsViewModel {
        let apiClient = apiClient
        let cacheManager = cacheManager
        let planetRepository = PlanetRepository(apiClient: apiClient, cacheManager: cacheManager)
        let fetchPlanetDetailsUseCase = FetchPlanetDetailsUseCase(repository: planetRepository)
        let planetDetailViewModel = PlanetDetailsViewModel(useCase: fetchPlanetDetailsUseCase, planet: planet)
        return planetDetailViewModel
    }
    
}
