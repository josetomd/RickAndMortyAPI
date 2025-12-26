//
//  CharacterDetailView.swift
//  RickAndMortyAPI
//
//  Created by Josset Garcia on 23-12-25.
//

import SwiftUI

struct CharacterDetailView: View {
    @StateObject var viewModel: CharacterDetailViewModel
    
    var body: some View {
        List {
            Section {
                VStack(alignment: .center) {
                    AsyncImage(url: URL(string: viewModel.character.image)) { phase in
                        if let image = phase.image {
                            image.resizable()
                                 .aspectRatio(contentMode: .fill)
                                 .frame(width: 250, height: 250)
                                 .clipShape(Circle())
                                 .overlay(Circle().stroke(Color.white, lineWidth: 4))
                                 .shadow(radius: 7)
                        } else {
                            ProgressView()
                        }
                    }
                    .frame(maxWidth: .infinity)
                    
                    Text(viewModel.character.name)
                        .font(.system(.title, design: .rounded))
                        .bold()
                }
                .listRowBackground(Color.clear) // Makes the header stand out
            }
            
            Section("Status & Species") {
                LabeledContent("Status", value: viewModel.character.status)
                LabeledContent("Species", value: viewModel.character.species)
                LabeledContent("Gender", value: viewModel.character.gender)
            }
            
            Section("Episodes") {
                if viewModel.isLoading {
                    ProgressView()
                } else if viewModel.episodes.isEmpty {
                    Text("No episodes found").foregroundStyle(.secondary)
                } else {
                    ForEach(viewModel.episodes) { episode in
                        VStack(alignment: .leading) {
                            Text(episode.name).font(.headline)
                            Text(episode.episode).font(.caption).foregroundStyle(.secondary)
                        }
                    }
                }
            }
        }
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
        .task { await viewModel.fetchEpisodes() }
    }
}

#Preview {
    CharacterDetailView(viewModel: CharacterDetailViewModel(character: PreviewData.sampleCharacter, service: DefaultAPIService()))
}
