//
//  PeopleViewModel.swift
//  iStarWars
//
//  Created by Amr Ahmed Elghadban on 13/02/2025.
//

import Foundation
import Combine

/// PeopleViewModel Model
class PeopleViewModel: ObservableObject {

    // MARK: - Published Properties

    @Published var peoples: [People] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    // MARK: - Dependencies

    private let fetchUseCase: FetchPeopleUseCase
    private var cancellables = Set<AnyCancellable>()

    // MARK: - Initializer

    init(fetchUseCase: FetchPeopleUseCase) {
        self.fetchUseCase = fetchUseCase
    }

    // MARK: - Methods

    func fetchPeople() {
        isLoading = true
        errorMessage = nil

        fetchUseCase.execute()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                self?.isLoading = false
                switch completion {
                    case .failure(let error):
                        self?.errorMessage = error.localizedDescription
                    case .finished:
                        break
                }
            } receiveValue: { [weak self] values in
                self?.peoples = values
            }
            .store(in: &cancellables)
    }

}
