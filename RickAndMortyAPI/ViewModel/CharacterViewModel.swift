//
//  CharacterViewModel.swift
//  RickAndMortyAPI
//
//  Created by Josset Garcia on 22-12-25.
//

import Foundation

class CharacterViewModel: ObservableObject {
    @Published var characters: [Character]?
    
    func fetchCharacters() async {
        let url = URLRequest(url: .init(string: "https://rickandmortyapi.com/api/character")!)
        
        do {
            let (jsonData, _) = try await URLSession.shared.data(for: url)
            do {
                let characterResult = try JSONDecoder().decode(CharacterResult.self, from: jsonData)
                if characterResult.results.isEmpty == false {
                    self.characters = characterResult.results
                }
            } catch {
                print("error parsing json to swift object: \(error.localizedDescription)")
            }
        } catch {
            print("Error fetching from url: \(error.localizedDescription)")
        }   
    }
}
