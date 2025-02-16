//
//  NavigationPath.swift
//  iStarWars
//
//  Created by Amr Ahmed Elghadban on 23/01/2025.
//

import Foundation

/// The `NavigationPath` define the app path
enum NavigationPath: Hashable, Equatable {

    case peopleList
    case planetList
    /// all associated values in the NavigationPath enum need conform to Hashable and Equatable
    case planetDetail(planet: Planet)

}
