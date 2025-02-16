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
            VStack(alignment: .leading, spacing: 16) {
                if viewModel.isLoading {
                    ProgressView()
                } else if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                } else if let planetDetails = viewModel.planet {
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
        .navigationTitle(planet.name ?? "")
        .onAppear {
            viewModel.planet = planet
            viewModel.fetchPlanetDetails()
        }
    }
    
}
