//
//  CharacterCardView.swift
//  RickAndMortyAPI
//
//  Created by Josset Garcia on 23-12-25.
//

import SwiftUI

struct CharacterCardView: View {
    let character: Character
    
    private var statusColor: Color {
        switch character.status.lowercased() {
        case "alive": return .green
        case "dead": return .red
        default: return .gray
        }
    }
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            AsyncImage(url: URL(string: character.image)) { phase in
                switch phase {
                case .empty:
                    ProgressView().frame(width: 120, height: 120)
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 120, height: 120)
                        .clipped()
                case .failure:
                    Image(systemName: "person.fill.questionmark")
                        .font(.largeTitle)
                        .frame(width: 120, height: 120)
                        .background(Color.gray.opacity(0.2))
                @unknown default:
                    EmptyView()
                }
            }
            .cornerRadius(8)

            VStack(alignment: .leading, spacing: 8) {
                VStack(alignment: .leading, spacing: 2) {
                    Text(character.name)
                        .font(.title3)
                        .bold()
                    
                    HStack(spacing: 4) {
                        Image(systemName: "circle.fill")
                            .font(.system(size: 8))
                            .foregroundStyle(statusColor)
                        
                        Text("\(character.status) - \(character.species)")
                            .font(.subheadline)
                            .fontWeight(.medium)
                    }
                }
                
                infoSection(label: "Last known location:", value: character.location.name)
                infoSection(label: "First seen in:", value: character.origin.name)
            }
            .padding(.vertical, 4)
            
            Spacer()
        }
        .background(Color(uiColor: .secondarySystemGroupedBackground))
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
    }

    private func infoSection(label: String, value: String) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(label)
                .font(.caption)
                .foregroundStyle(.secondary)
            Text(value)
                .font(.footnote)
                .lineLimit(1)
        }
    }
}

#Preview {
    CharacterCardView(character: PreviewData.sampleCharacter)
}
