//
//  MockAPIService.swift
//  RickAndMortyAPI
//
//  Created by Josset Garcia on 22-12-25.
//

import Foundation

struct MockAPIService: RMAPIService {
    
    func fetchCharacters() async -> [Character] {
        print("Retrieving characters from mock service")
        let filename = "character_list_sample.json"
        
            guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
                fatalError("Couldn't find \(filename) in main bundle")
            }
        do {
            let data = try Data(contentsOf: file)
            do {
                let characterResult = try JSONDecoder().decode([Character].self, from: data)
                return characterResult
            } catch {
                print("Error decoding data: \(error.localizedDescription)")
            }
        } catch {
            print("Error parsing data from filename: \(error.localizedDescription)")
        }
        return []
    }
}
