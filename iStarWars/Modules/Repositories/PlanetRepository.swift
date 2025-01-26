//
//  PlanetRepository.swift
//  iStarWars
//
//  Created by Amr Ahmed Elghadban on 23/01/2025.
//

import Foundation
import Combine

/// The PlanetRepository mediates between the APIClient and the UseCase. It abstracts the data source (e.g., API).
class PlanetRepository: PlanetRepositoryProtocol {
    
    private let apiClient: DataClientProtocol
    private let cacheManager: CacheManagerProtocol

    init(apiClient: DataClientProtocol = APIClient.shared, cacheManager: CacheManagerProtocol = CacheManager.shared) {
        self.apiClient = apiClient
        self.cacheManager = cacheManager
    }
    
    /// Combine
    func fetchPlanets() -> AnyPublisher<[Planet], Error> {
        guard let url = Endpoints.planets.url else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        
        // Check for cached data
        if let cachedData = cacheManager.data(for: url),
           let cachedPlanets = try? JSONDecoder().decode([Planet].self, from: cachedData) {
            return Just(cachedPlanets)
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        }
        
        return apiClient.request(url)
            .map { (response: PlanetsResponse) -> [Planet] in
                // Assign identifiers based on the array index
                let planets = response.results.enumerated().map { index, planet in
                    var planetWithIdentifier = planet
                    planetWithIdentifier.index = "\(index + 1)" // Start from 1
                    return planetWithIdentifier
                }
                
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
    
    /// Async/Await
    func fetchPlanetDetails(id: String) async throws -> Planet {
        guard let url = Endpoints.planetDetails(id).url else {
            throw URLError(.badURL)
        }
        
        // Check for cached data
        if let cachedData = cacheManager.data(for: url),
           let cachedPlanet = try? JSONDecoder().decode(Planet.self, from: cachedData) {
            return cachedPlanet
        }
        
        // Fetch from the network
        do {
            let planet: Planet = try await apiClient.request(url)
            // Cache the response
            if let data = try? JSONEncoder().encode(planet) {
                cacheManager.cache(data, for: url)
            }
            return planet
        } catch let urlError as URLError {
            throw NetworkError.networkError(description: urlError.localizedDescription)
        } catch let decodingError as DecodingError {
            throw DataError.decodingError(description: decodingError.localizedDescription)
        } catch {
            throw CustomError.unknownError
        }
        
    }
    
}
