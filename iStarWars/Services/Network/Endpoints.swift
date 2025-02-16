//
//  Endpoints.swift
//  iStarWars
//
//  Created by Amr Ahmed Elghadban on 23/01/2025.
//

import Foundation

/// API Endpoints 
enum Endpoints {

    case peoples
    case planets
    case planetDetails(String)
    case peopleDirect(String)

    var url: URL? {
        let baseURL = Constants.baseURL

        switch self {
            case .peopleDirect(let path):
                 return URL(string: path)
            case .peoples:
                return URL(string: "\(baseURL)/people")
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
