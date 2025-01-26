//
//  PlanetRowView.swift
//  iStarWars
//
//  Created by Amr Ahmed Elghadban on 23/01/2025.
//

import SwiftUI

/// The PlanetRowView is a reusable component that represents a single row in the list of planets
struct PlanetRowView: View {
    
    let planet: Planet
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(planet.name ?? "")
                .font(.headline)
            Text("Climate: \( planet.climate ?? "")")
                .font(.subheadline)
                .foregroundColor(.secondary)
            Text("Terrain: \(planet.terrain ?? "")")
                .font(.subheadline)
                .foregroundColor(.secondary)
            Text("Population: \(planet.population  ?? "")")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .padding(.vertical, 8)
    }
    
}

//#Preview {
//    PlanetRowView(planet: .mock())
//        .previewLayout(.sizeThatFits)
//        .padding()
//}
/**
 In Xcode 15 and later, the #Preview macro has replaced the old PreviewProvider protocol, and the way we specify layout traits has changed. The .previewLayout(.sizeThatFits) modifier is no longer used directly in the #Preview macro. Instead, you use the traits argument of the #Preview macro to specify the layout.
 */

#Preview("Planet Row", traits: .sizeThatFitsLayout) {
    // Create a mock Planet object for the preview
    let mockPlanet = Planet.mock()
    return PlanetRowView(planet: mockPlanet)
        .padding()
}
