//
//  PlanetRowView.swift
//  iStarWars
//
//  Created by Amr Ahmed Elghadban on 23/01/2025.
//

import SwiftUI

/// The `PlanetRowView` is a reusable component that represents a single row in the list of planets
struct PlanetRowView: View {

    let planet: Planet

    var body: some View {
        VStack(alignment: .leading) {
            Text(planet.name ?? "")
                .font(.headline)
                .accessibilityIdentifier("planetNameLabel")
            Text("Climate: \( planet.climate ?? "")")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .accessibilityIdentifier("climateLabel")
            Text("Terrain: \(planet.terrain ?? "")")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .accessibilityIdentifier("terrainLabel")
            if let population = planet.population?.intValue {
                Text(
                    "Population: \(population.stringDecoration)"
                )
                .font(.subheadline)
                .foregroundColor(.secondary)
                .accessibilityIdentifier("populationLabel")
            }
        }
        .padding(.vertical, 8)
    }

}

#Preview("Planet Row", traits: .sizeThatFitsLayout) {
    let planet = Planet.mock()
    return PlanetRowView(planet: planet)
        .padding()
}
