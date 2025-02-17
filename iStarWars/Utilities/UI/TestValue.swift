//
//  TestValue.swift
//  iStarWars
//
//  Created by Amr Ahmed Elghadban on 16/02/2025.
//

import SwiftUI

struct TestValue: View {

    @StringUpperCase var name = ""
    // @State var name = ""

    var body: some View {
        VStack(alignment: .leading) {
            Text("Hello, World! \(name)")
            TextField("Enter your name", text: $name)
        }.padding()

    }
}

// #Preview {
//    TestValue()
// }
