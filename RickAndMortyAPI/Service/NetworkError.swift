//
//  NetworkError.swift
//  RickAndMortyAPI
//
//  Created by Josset Garcia on 22-12-25.
//

import Foundation

enum NetworkError: Error, LocalizedError {
    case invalidURL
    case requestFailed(description: String)
    case decodingError(description: String)
    case unknown
    
    var errorDescription: String? {
        switch self {
        case .invalidURL: return "The URL provided was invalid."
        case .requestFailed(let description): return "Network request failed: \(description)"
        case .decodingError(let description): return "Failed to parse data: \(description)"
        case .unknown: return "An unknown error has occurred"
        }
    }
}
