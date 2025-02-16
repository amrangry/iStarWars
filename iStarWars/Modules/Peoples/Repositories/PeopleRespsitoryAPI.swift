//
//  PeopleRespsitoryAPI.swift
//  iStarWars
//
//  Created by Amr Ahmed Elghadban on 13/02/2025.
//
import Foundation
import Combine

struct PeopleRespsitoryAPI: PeopleRespsitoryProtcol {

    private let apiClient: DataClientProtocol
    private let cacheManager: CacheManagerProtocol
    
    init(apiClient: DataClientProtocol = APIClient.shared, cacheManager: CacheManagerProtocol = CacheManager.shared) {
        self.apiClient = apiClient
        self.cacheManager = cacheManager
    }
    
    /// Combine
    func fetchPeople() -> AnyPublisher<[People], Error> {
        guard let url = Endpoints.peoples.url else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        
        // Check for cached data
        if let cachedData = cacheManager.data(for: url),
           let cachedPeoples = try? JSONDecoder().decode([People].self, from: cachedData) {
            return Just(cachedPeoples)
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        }
        
        return apiClient.request(url)
            .map { (response: PeopleResponse) -> [People] in
                // Assign identifiers based on the array index
                let planets = response.results
                
                // Cache the modified planets
                if let data = try? JSONEncoder().encode(planets) {
                    self.cacheManager.cache(data, for: url)
                }
                
                return planets
            }
            .mapError { error -> Error in
                if let urlError = error as? URLError { // Handle network errors
                    return NetworkError.networkError(description: urlError.localizedDescription)
                } else if let decodingError = error as? DecodingError {  // Handle decoding errors
                    return DataError.decodingError(description: decodingError.localizedDescription)
                } else { // Handle unknown errors
                    return CustomError.unknownError
                }
            }
            .eraseToAnyPublisher()
    }
    
}
