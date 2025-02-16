//
//  PlanetDetailView.swift
//  iStarWars
//
//  Created by Amr Ahmed Elghadban on 23/01/2025.
//

import SwiftUI

/// PlanetDetailView display the details
struct PlanetDetailView: View {
    
    let planet: Planet
    // @StateObject private var viewModel = PlanetDetailsViewModel()
    @ObservedObject var viewModel: PlanetDetailsViewModel

    var body: some View {
        ScrollView {
                if viewModel.isLoading {
                    ProgressView()
                } else if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                    Text(planetDetails.name ?? "")
                        .font(.largeTitle)
                        .bold()

                    VStack(alignment: .leading, spacing: 8) {
                        Text("Climate")
                            .font(.title2)
                            .bold()
                        Text(planetDetails.climate ?? "")
                            .font(.body)
                            .foregroundColor(.secondary)
                    }

                    VStack(alignment: .leading, spacing: 8) {
                        Text("Terrain")
                            .font(.title2)
                            .bold()
                        Text(planetDetails.terrain ?? "")
                            .font(.body)
                            .foregroundColor(.secondary)
                    }

                    VStack(alignment: .leading, spacing: 8) {
                        Text("Population")
                            .font(.title2)
                            .bold()
                        Text(planetDetails.population ?? "")
                            .font(.body)
                            .foregroundColor(.secondary)
                    }
                }
            }
            .padding()
        }
        .navigationTitle(viewModel.planet?.name ?? "")
        .onAppear {
            viewModel.fetchPlanetDetails()
        }
    }

}

// #Preview {
//    let respoirtory = PlanetRepositoryProtocolMock()
//    let usecase = FetchPlanetDetailsUseCase(repository: respoirtory)
//    let planet: Planet = .mock()
//    let viewModel =  PlanetDetailsViewModel(useCase: usecase, planet: planet)
//
//
//    PlanetDetailView(
//        planet: .mock(),
//        viewModel: viewModel)
//    )
// }
