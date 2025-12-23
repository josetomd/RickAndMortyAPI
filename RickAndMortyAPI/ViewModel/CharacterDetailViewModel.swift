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
    
    func fetchEpisodes() async {
        self.isLoading = true
        for episode in character.episode {
            do {
                if let ep = try await service.fetchEpisode(url: episode) {
                    self.episodes.append(ep)
                }
            } catch {
                self.errorMessage = error.localizedDescription
            }
        }
        self.isLoading = false
    }
}
