//
//  RMAPIService.swift
//  RickAndMortyAPI
//
//  Created by Josset Garcia on 22-12-25.
//

import Foundation

protocol RMAPIService {
    func fetchCharacters() async throws -> [Character]
    func fetchEpisode(url: String) async throws -> Episode?
}
