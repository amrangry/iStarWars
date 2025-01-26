//
//  AppCoordinator.swift
//  iStarWars
//
//  Created by Amr Ahmed Elghadban on 23/01/2025.
//

import Foundation
import SwiftUI

/// AppCoordinator manage app naviagtion
class AppCoordinator: ObservableObject {
    
    @Published var navigationPath = [NavigationPath]()
    
    private let sceneConfigurator = SceneConfigurator.shared
    
    func start() {
        // Initialize dependencies using the SceneConfigurator
        let planetViewModel = sceneConfigurator.configurePlanetViewModel()
        
        // Create the PlanetsCoordinator and pass the dependencies
        let planetsCoordinator = PlanetsCoordinator(viewModel: planetViewModel)
        planetsCoordinator.start()
        
        // Navigate to the PlanetListView
        navigate(to: .planetList)
    }
    
    func navigate(to path: NavigationPath) {
        navigationPath.append(path)
    }
    
    func pop() {
        navigationPath.removeLast()
    }
    
    func popToRoot() {
        navigationPath.removeAll()
    }
    
    @ViewBuilder
    func view(for path: NavigationPath) -> some View {
        let sceneConfigurator = self.sceneConfigurator
        switch path {
            case .planetList:
                PlanetListView(viewModel: sceneConfigurator.configurePlanetViewModel())
            case .planetDetail(let planet):
                let planetDetailViewModel = sceneConfigurator.configurePlanetDetailsViewModel(planet: planet)
                PlanetDetailView(planet: planet, viewModel: planetDetailViewModel)
        }
    }
}
