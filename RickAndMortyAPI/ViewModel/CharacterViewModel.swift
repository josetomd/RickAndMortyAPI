//
//  CharacterViewModel.swift
//  RickAndMortyAPI
//
//  Created by Josset Garcia on 22-12-25.
//

import Foundation

class CharacterViewModel: ObservableObject {
    @Published var characters: [Character] = []
    @Published var errorMessage: String? = nil
    @Published var isLoading: Bool = false
    
    let service: RMAPIService
    
    init(service: RMAPIService = DefaultAPIService()) {
        self.service = service
    }
    
    @MainActor
    func fetchCharacters() async {
        isLoading = true
        errorMessage = nil
        
        do {
            self.characters = try await service.fetchCharacters()
        } catch {
            self.errorMessage = error.localizedDescription
        }
        isLoading = false
    }
}
