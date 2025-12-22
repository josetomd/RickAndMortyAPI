//
//  RickAndMortyAPIApp.swift
//  RickAndMortyAPI
//
//  Created by Josset Garcia on 22-12-25.
//

import SwiftUI

@main
struct RickAndMortyAPIApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: CharacterViewModel())
        }
    }
}
