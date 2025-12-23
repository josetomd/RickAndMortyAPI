//
//  CharacterViewModel.swift
//  RickAndMortyAPI
//
//  Created by Josset Garcia on 22-12-25.
//

import Foundation

class CharacterViewModel: ObservableObject {
    @Published var characters: [Character]?
    
    let service: RMAPIService
    
    init(service: RMAPIService = DefaultAPIService()) {
        self.service = service
    }
    func fetchCharacters() async {
        self.characters = await service.fetchCharacters()
    }
}
