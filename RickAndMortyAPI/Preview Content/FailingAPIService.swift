//
//  FailingAPIService.swift
//  RickAndMortyAPI
//
//  Created by Josset Garcia on 23-12-25.
//

import Foundation

struct FailingAPIService: RMAPIService {
    func fetchCharacters() async throws -> [Character] {
        throw NetworkError.decodingError(description: "Error trying to decode data")
    }
    func fetchEpisode(url: String) async throws -> Episode? {
        throw NetworkError.requestFailed(description: "Error on request made")
    }
}
