//
//  PeopleRespsitoryProtcol.swift
//  iStarWars
//
//  Created by Amr Ahmed Elghadban on 13/02/2025.
//

import Foundation
import Combine

protocol PeopleRespsitoryProtcol {

    /// Combine
    func fetchPeople() -> AnyPublisher<[People], Error>

}
