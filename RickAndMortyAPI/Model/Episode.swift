//
//  Episode.swift
//  RickAndMortyAPI
//
//  Created by Josset Garcia on 23-12-25.
//

import Foundation
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let episodeResult = try? JSONDecoder().decode(EpisodeResult.self, from: jsonData)

// MARK: - EpisodeResult
struct EpisodeResult: Codable {
    let info: Info
    let results: [Episode]
}

struct Episode: Identifiable, Codable {
    let id: Int
    let name, airDate, episode: String
    let characters: [String]
    let url: String
    let created: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case airDate = "air_date"
        case episode, characters, url, created
    }
}
