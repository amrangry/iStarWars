//
//  StringUpperCase.swift
//  iStarWars
//
//  Created by Amr Ahmed Elghadban on 16/02/2025.
//

import SwiftUI

@propertyWrapper
struct StringUpperCase: DynamicProperty {
//    @State var wrappedValue: String
//
//    var projectValue: Binding<String> {
//        Binding (
//            get: { wrappedValue.uppercased() },
//            set: { wrappedValue = $0.uppercased() }
//        )
//    }

    @State private var value: String

    var wrappedValue: String {
        get { value }
        nonmutating set { value = newValue.uppercased() }
    }

    var projectedValue: Binding<String> {
        Binding(
            get: { wrappedValue },
            set: { wrappedValue = $0 }
        )
    }

    init(wrappedValue: String) {
        self._value = State(initialValue: wrappedValue.uppercased())
    }

}
