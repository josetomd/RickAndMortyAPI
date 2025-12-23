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
        VStack {
            if let characters = viewModel.characters {
                List(characters) { char in
                    Text(char.name)
                }
            }
        }
        .task {
            await viewModel.fetchCharacters()
        }
        .padding()
    }
}

#Preview {
    ContentView(viewModel: CharacterViewModel(service: MockAPIService()))
}
