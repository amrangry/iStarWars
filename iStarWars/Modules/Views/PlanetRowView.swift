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
        VStack(alignment: .leading, spacing: 8) {
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
            Text("Population: \(planet.population  ?? "")")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .accessibilityIdentifier("populationLabel")
        }
        .padding(.vertical, 8)
    }

}

#Preview("Planet Row", traits: .sizeThatFitsLayout) {
    // Create a mock Planet object for the preview
    let mockPlanet = Planet.mock()
    return PlanetRowView(planet: mockPlanet)
        .padding()
}
