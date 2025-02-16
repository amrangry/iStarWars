//
//  AppCoordinator.swift
//  iStarWars
//
//  Created by Amr Ahmed Elghadban on 23/01/2025.
//

import Foundation
import SwiftUI

/// The `AppCoordinator` manage app naviagtion
class AppCoordinator: ObservableObject {

    @Published var navigationPath = [NavigationPath]()

    private let sceneConfigurator = SceneConfigurator.shared

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
                PlanetDetailView(viewModel: planetDetailViewModel)
            case .peopleList:
                PeopleListView(viewModel: sceneConfigurator.configurePeopleViewModel())
        }
    }

}
