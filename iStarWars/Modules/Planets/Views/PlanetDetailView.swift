//
//  PlanetDetailView.swift
//  iStarWars
//
//  Created by Amr Ahmed Elghadban on 23/01/2025.
//

import SwiftUI

/// PlanetDetailView display the details
struct PlanetDetailView: View {

    // @StateObject private var viewModel = PlanetDetailsViewModel()
    @ObservedObject var viewModel: PlanetDetailsViewModel

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                if viewModel.isLoading {
                    ProgressView()
                } else if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                } else if let planet = viewModel.planet {
                    Text(planet.name ?? "")
                        .font(.largeTitle)
                        .bold()
                    TitleDetailView(title: "Climate:", detail: planet.terrain ?? "")
                    TitleDetailView(title: "Terrain:", detail: planet.terrain ?? "")
                    TitleDetailView(title: "Population:", detail: planet.population?.stringValue ?? "")
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

#Preview {
    let respoirtory = PlanetRepositoryProtocolMock()
    let usecase = FetchPlanetDetailsUseCase(repository: respoirtory)
    let planet: Planet = .mock()
    let viewModel =  PlanetDetailsViewModel(usecase: usecase, planet: planet)
    return PlanetDetailView(viewModel: viewModel)
}
