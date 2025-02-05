//
//  KeyIdentifiable.swift
//  BookStore
//
//  Created by Amr Elghadban on 21/06/2023.
//  Copyright © 2023 ADKA Tech. All rights reserved.
//

import Foundation

/// The KeyIdentifiable protocol is designed to provide a way for conforming types to expose a unique identifier key.
protocol KeyIdentifiable {
    associatedtype Key: Hashable
    
    var identifierKey: Key { get }
}
