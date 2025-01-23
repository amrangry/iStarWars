//
//  PlanetsCoordinator.swift
//  iStarWars
//
//  Created by Amr Ahmed Elghadban on 23/01/2025.
//

import Foundation

class PlanetsCoordinator: ObservableObject {
    
    @Published var viewModel: PlanetsViewModel
    
    init(viewModel: PlanetsViewModel) {
        self.viewModel = viewModel
    }
    
    func start() {
        viewModel.fetchPlanets()
    }
    
}
