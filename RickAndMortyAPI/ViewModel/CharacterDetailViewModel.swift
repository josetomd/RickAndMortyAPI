//
//  CharacterDetailViewModel.swift
//  RickAndMortyAPI
//
//  Created by Josset Garcia on 23-12-25.
//

import Foundation

class CharacterDetailViewModel: ObservableObject {
    @Published var character: Character
    @Published var errorMessage: String?
    @Published var isLoading: Bool = false
    @Published var episodes: [Episode] = []
    let service: RMAPIService
    
    init(character: Character, service: RMAPIService) {
        self.character = character
        self.service = service
    }
    
    @MainActor
    func fetchEpisodes() async {
        self.isLoading = true
        defer {
            self.isLoading = false
        }
        
        do {
            let fetchedEpisodes = try await withThrowingTaskGroup(of: Episode?.self) { group in
                for urlString in character.episode {
                    group.addTask {
                        try await self.service.fetchEpisode(url: urlString)
                    }
                }
                
                var results: [Episode] = []
                for try await episode in group {
                    if let episode = episode {
                        results.append(episode)
                    }
                }
                return results
            }
            self.episodes = fetchedEpisodes.sorted(by: { $0.id < $1.id })
        } catch {
            self.errorMessage = error.localizedDescription
        }
    }
}
