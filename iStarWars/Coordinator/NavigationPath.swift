//
//  NavigationPath.swift
//  iStarWars
//
//  Created by Amr Ahmed Elghadban on 23/01/2025.
//

import Foundation

enum NavigationPath: Hashable, Equatable {
    
    case planetList
    case planetDetail(planet: Planet) // all associated values in the NavigationPath enum need conform to Hashable and Equatable
    
}
