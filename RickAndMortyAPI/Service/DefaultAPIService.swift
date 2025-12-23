//
//  DefaultAPIService.swift
//  RickAndMortyAPI
//
//  Created by Josset Garcia on 22-12-25.
//

import Foundation

struct DefaultAPIService: RMAPIService {
    func fetchCharacters() async throws -> [Character] {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character") else {
            throw NetworkError.invalidURL
        }
        
        
        let (jsonData, _) = try await URLSession.shared.data(from: url)
        do {
            let characterResult = try JSONDecoder().decode(CharacterResult.self, from: jsonData)
            if characterResult.results.isEmpty == false {
                return characterResult.results
            }
        } catch {
            throw NetworkError.decodingError(description: error.localizedDescription)
        }
       
        return []
    }
}
