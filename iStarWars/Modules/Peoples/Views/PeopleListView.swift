//
//  PeopleListView.swift
//  iStarWars
//
//  Created by Amr Ahmed Elghadban on 13/02/2025.
//

import SwiftUI

/// PeopleListView display the list
struct PeopleListView: View {
    
    @StateObject var viewModel: PeopleViewModel
   // @EnvironmentObject private var coordinator: AppCoordinator
    
    var body: some View {
        List {
            if viewModel.isLoading {
                // ProgressView()
                ForEach(0..<5) { _ in
                    ShimmerView()
                        .frame(height: 100)
                        .cornerRadius(8)
                }
            } else if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
            } else {
                ForEach(viewModel.peoples) { people in
                    Text("\(people.name)")
                }
            }
        }
        .navigationTitle("Peoples")
        .onAppear {
            // Fetch planets when the view appears nd planet is empty
            if viewModel.peoples.isEmpty {
                viewModel.fetchPeople()
            }
        }
    }
    
}

//#Preview {
//    PeopleListView()
//}
