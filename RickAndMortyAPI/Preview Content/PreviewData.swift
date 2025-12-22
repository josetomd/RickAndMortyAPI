//
//  PreviewData.swift
//  RickAndMortyAPI
//
//  Created by Josset Garcia on 22-12-25.
//

import Foundation

class PreviewData {
    static var sampleCharacter: Character = load("character_sample.json")
    static var sampleCharacterList: [Character] = load("character_list_sample.json")
    
    static func load<T: Decodable>(_ filename: String) -> T {
        guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
            fatalError("Couldn't find \(filename) in main bundle")
        }
        let data = try! Data(contentsOf: file)
        return try! JSONDecoder().decode(T.self, from: data)
    }
}
