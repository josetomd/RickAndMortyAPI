//
//  RickAndMortyAPITests.swift
//  RickAndMortyAPITests
//
//  Created by Josset Garcia on 22-12-25.
//

import XCTest
@testable import RickAndMortyAPI

final class RickAndMortyAPITests: XCTestCase {

    func test_viewModel_fetchCharacters_shouldSucceed() async {
        let mockService = MockAPIService()
        let viewModel = CharacterViewModel(service: mockService)
        
        await viewModel.fetchCharacters()
        
        XCTAssertFalse(viewModel.characters.isEmpty, "Characters should not be empty when using Mock service")
        XCTAssertNil(viewModel.errorMessage, "Error message should be nil on success")
    }
    
    func test_viewModel_fetchCharacters_shouldHandleError() async {
        struct FailingMock: RMAPIService {
            func fetchCharacters() async throws -> [Character] {
                throw NetworkError.requestFailed(description: "Server Down")
            }
        }
        
        let viewModel = CharacterViewModel(service: FailingMock())
        
        await viewModel.fetchCharacters()
        
        XCTAssertTrue(viewModel.characters.isEmpty)
        XCTAssertNotNil(viewModel.errorMessage)
        XCTAssertEqual(viewModel.errorMessage, "Network request failed: Server Down")
    }
}
