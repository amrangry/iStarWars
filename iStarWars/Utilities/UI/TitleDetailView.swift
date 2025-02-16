//
//  TitleDetailView.swift
//  iStarWars
//
//  Created by Amr Ahmed Elghadban on 17/02/2025.
//

import SwiftUI

struct TitleDetailView: View {
    var title: String = ""
    var detail: String = ""

    var body: some View {
        HStack{
            Text(title)
                .font(.title2)
                .bold()
            Spacer()
            Text(detail)
                .font(.body)
                .foregroundColor(.secondary)
        }.padding()
    }
}

#Preview {
    TitleDetailView(title: "Title:" , detail: "Details!")
}
