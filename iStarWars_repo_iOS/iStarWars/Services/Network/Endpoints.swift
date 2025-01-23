//
//  Endpoints.swift
//  iStarWars
//
//  Created by Amr Ahmed Elghadban on 23/01/2025.
//

import Foundation

//API Endpoints 
enum Endpoints {
    case planets
    case planetDetails(String)
    
    var url: URL? {
        let baseURL = Constants.baseURL
        
        switch self {
            case .planets:
                return URL(string: "\(baseURL)/planets")
            case .planetDetails(let planetID):
                let parameter = planetID.trimmingCharacters(in: .whitespacesAndNewlines)
                if parameter.isEmpty {
                    return nil
                }
                if !parameter.isValidAlphaNumeric {
                    return nil
                }
                return URL(string: "\(baseURL)/planets/\(parameter)")
        }
    }
    
}
