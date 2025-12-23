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
        Group {
            if viewModel.isLoading {
                ProgressView("Fetching data...")
            } else if let error = viewModel.errorMessage {
                ContentUnavailableView("Error", systemImage: "wifi.exclamationmark", description: Text(error))
            } else {
                VStack {
                    Text(viewModel.character.name)
                        .font(.largeTitle.bold())
                    AsyncImage(url: URL(string: viewModel.character.image)) { phase in
                        switch phase {
                        case .empty:
                            ProgressView().frame(width: 120, height: 120)
                        case .success(let image):
                            image
                                .resizable()
                                .frame(width: 320, height: 320)
                            
                        case .failure:
                            Image(systemName: "person.fill.questionmark")
                                .font(.largeTitle)
                                .frame(width: 120, height: 120)
                                .background(Color.gray.opacity(0.2))
                        @unknown default:
                            EmptyView()
                        }
                    }
                    .cornerRadius(8)
                    
                    VStack {
                        ScrollView {
                            ForEach(viewModel.episodes, id: \.name) { episode in
                                HStack {
                                    Text(episode.name)
                                }
                            }
                        }
                    }
                }
            }
        }
        .task {
            await viewModel.fetchEpisodes()
        }
    }
}

#Preview {
    CharacterDetailView(viewModel: CharacterDetailViewModel(character: PreviewData.sampleCharacter, service: DefaultAPIService()))
}
