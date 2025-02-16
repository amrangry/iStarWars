//
//  FetchPeopleUseCase.swift
//  iStarWars
//
//  Created by Amr Ahmed Elghadban on 13/02/2025.
//
import Foundation
import Combine

class FetchPeopleUseCase {
    
    private let repository: PeopleRespsitoryProtcol
    
    init(repository: PeopleRespsitoryProtcol) {
        self.repository = repository
    }
    
    func execute() -> AnyPublisher<[People], Error> {
        return repository.fetchPeople()
    }
    
}
