//
//  Character.swift
//  RickAndMortyAPI
//
//  Created by Josset Garcia on 22-12-25.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let characterInfo = try? JSONDecoder().decode(CharacterInfo.self, from: jsonData)

import Foundation

// MARK: - CharacterInfo
struct CharacterResult: Codable {
    let info: Info
    let results: [Character]
}

// MARK: - Info
struct Info: Codable {
    let count, pages: Int
    let next: String
    let prev: String?
}

// MARK: - Result
struct Character: Codable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin, location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

// MARK: - Location
struct Location: Codable {
    let name: String
    let url: String
}


