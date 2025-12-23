//
//  ContentView.swift
//  RickAndMortyAPI
//
//  Created by Josset Garcia on 22-12-25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel: CharacterViewModel
    var body: some View {
        NavigationStack {
            Group {
                if viewModel.isLoading {
                    ProgressView("Finding Characters...")
                } else if let error = viewModel.errorMessage {
                    ContentUnavailableView("Error", systemImage: "wifi.exclamationmark", description: Text(error))
                } else {
                    List(viewModel.characters) { char in
                        CharacterCardView(character: char)
                    }
                }
            }
            .navigationTitle("Rick & Morty")
            .task { await viewModel.fetchCharacters() }
        }
    }
}

#Preview {
    ContentView(viewModel: CharacterViewModel(service: MockAPIService()))
}

#Preview {
    ContentView(viewModel: CharacterViewModel(service: FailingAPIService()))
}
