//
//  PlanetDetailsViewModel.swift
//  iStarWars
//
//  Created by Amr Ahmed Elghadban on 23/01/2025.
//

import Combine

/// PlanetDetailsViewModel Model
class PlanetDetailsViewModel: ObservableObject {
    
    // MARK: - Published Properties
    @Published var planet: Planet?
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    // MARK: - Dependencies
    private let useCase: FetchPlanetDetailsUseCase
    
    // MARK: - Initializer
    init(useCase: FetchPlanetDetailsUseCase = FetchPlanetDetailsUseCase(), planet: Planet? = nil) {
        self.useCase = useCase
        self.planet = planet
    }
    
    // MARK: - Methods
    func fetchPlanetDetails() {
        guard let id = planet?.identifier else { return }
        
        isLoading = true
        errorMessage = nil
        
        Task {
            do {
                let planet = try await useCase.execute(parameter: id)
                await MainActor.run {
                    self.planet = planet
                    self.isLoading = false
                }
            } catch {
                await MainActor.run {
                    self.errorMessage = error.localizedDescription
                    self.isLoading = false
                }
            }
        }
    }
    
}
