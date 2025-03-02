//
//  PlanetListView.swift
//  iStarWars
//
//  Created by Amr Ahmed Elghadban on 23/01/2025.
//

import SwiftUI

/// PlanetListView display the list
struct PlanetListView: View {

    @StateObject var viewModel: PlanetsViewModel
    @EnvironmentObject private var coordinator: AppCoordinator

    var body: some View {
        NavigationStack(path: $coordinator.navigationPath) {
            List {
                if viewModel.isLoading {
                    // ProgressView()
                    ForEach(0..<5) { _ in
                        ShimmerView()
                            .frame(height: 100)
                            .cornerRadius(8)
                    }
                } else if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                } else {
                    ForEach(viewModel.planets) { planet in
                        NavigationLink(value: NavigationPath.planetDetail(planet: planet)) {
                            PlanetRowView(planet: planet)
                        }
                    }
                }
            }
            .navigationTitle("Planets")
            .onAppear {
                // Fetch planets when the view appears nd planet is empty
                if viewModel.planets.isEmpty {
                    viewModel.fetchPlanets()
                }
            }
            .navigationDestination(for: NavigationPath.self) { path in
                coordinator.view(for: path)
            }
        }
    }

}

#Preview {
    let respoirtory = PlanetRepositoryProtocolMock()
    let usecase = FetchPlanetsUseCase(repository: respoirtory)
    let viewModel =  PlanetsViewModel(usecase: usecase)
    // Create a mock coordinator
    let coordinator = AppCoordinator()
    return PlanetListView(viewModel: viewModel).environmentObject(coordinator)
}
