//
//  PlanetsViewModel.swift
//  iStarWars
//
//  Created by Amr Ahmed Elghadban on 23/01/2025.
//

import Foundation
import Combine

/// PlanetsViewModel Model
class PlanetsViewModel: ObservableObject {
    
    // MARK: - Published Properties
    
    @Published var planets: [Planet] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    // MARK: - Dependencies
    
    // private let repository: PlanetRepositoryProtocol
    private let fetchPlanetsUseCase: FetchPlanetsUseCase
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - Initializer
    
    init(fetchPlanetsUseCase: FetchPlanetsUseCase = FetchPlanetsUseCase()) {
        self.fetchPlanetsUseCase = fetchPlanetsUseCase
    }
    
    // MARK: - Methods
    
    func fetchPlanets() {
        isLoading = true
        errorMessage = nil
        
        fetchPlanetsUseCase.execute()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                self?.isLoading = false
                switch completion {
                    case .failure(let error):
                        self?.errorMessage = error.localizedDescription
                    case .finished:
                        break
                }
            } receiveValue: { [weak self] planets in
                self?.planets = planets
            }
            .store(in: &cancellables)
    }
    
}
