//
//  ShimmerView.swift
//  iStarWars
//
//  Created by Amr Ahmed Elghadban on 23/01/2025.
//

import SwiftUI

/// ShimmerView istemp view whiel loading
struct ShimmerView: View {

    @State var isAnimating = false

    var body: some View {
        Rectangle()
            .fill(Color.gray.opacity(0.3))
            .overlay(
                Rectangle()
                    .fill(Color.white.opacity(0.5))
                    .scaleEffect(x: isAnimating ? 1.5 : 0.5, y: 1)
                    .animation(.easeInOut(duration: 1).repeatForever(autoreverses: true), value: isAnimating)
            )
            .onAppear {
                isAnimating = true
            }
            .accessibility(label: Text("Loading Data...".localized)) // Use `accessibility(label:)`
    }

}
