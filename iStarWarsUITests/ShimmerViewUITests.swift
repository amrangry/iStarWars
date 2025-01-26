//
//  ShimmerViewUITests.swift
//  iStarWarsUITests
//
//  Created by Amr Ahmed Elghadban on 25/01/2025.
//

import SwiftUI
import XCTest
@testable import iStarWars

final class ShimmerViewUITests: XCTestCase {
    
    func testAnimationStateOnAppear() {
        // Create the view
        let shimmerView = ShimmerView()
        
        // Verify that `isAnimating` starts as `false`
        XCTAssertEqual(shimmerView.isAnimating, false)
        
        // Simulate `onAppear`
        _ = shimmerView.onAppear()
        
        // Assert that `isAnimating` is set to `true`
        XCTAssertEqual(shimmerView.isAnimating, true)
    }
    
    func testAnimationEffect() {
        // Create the ShimmerView
        let shimmerView = ShimmerView()
        
        // Simulate appearance and delay
        _ = shimmerView.onAppear()
        
        // Verify after a short delay (simulate animation runtime)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            XCTAssertTrue(shimmerView.isAnimating, "Animation should still be running")
        }
    }
    
}
