//
//  cardDetailview.swift
//  ITC-Assignment-16
//
//  Created by Isaiah Ojo on 26/04/2023.
//

import SwiftUI

struct CardDetailView: View {
    var card: PokemonDetails

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                if let imageURL = card.images?.large, let url = URL(string: imageURL) {
                    AsyncImage(url: url) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(maxWidth: .infinity)
                }
                
                Group {
                    Text("Name: \(card.name ?? "Unknown")")
                        .font(.title2)
                        .bold()
                    
                    if let level = card.level {
                        Text("Level: \(level)")
                    }
                    
                    if let hp = card.hp {
                        Text("HP: \(hp)")
                    }
                    
                    if let types = card.types {
                        Text("Types: \(types.joined(separator: ", "))")
                    }
                    
                    if let subtypes = card.subtypes {
                        Text("Subtypes: \(subtypes.joined(separator: ", "))")
                    }
                }
                
                Group {
                    if let number = card.number {
                        Text("Number: \(number)")
                    }
                    
                    if let artist = card.artist {
                        Text("Artist: \(artist)")
                    }
                    
                    if let rarity = card.rarity {
                        Text("Rarity: \(rarity)")
                    }
                    
                    if let nationalPokedexNumbers = card.nationalPokedexNumbers {
                        Text("National Pokedex Numbers: \(nationalPokedexNumbers.map { String($0) }.joined(separator: ", "))")
                    }
                }
                
                if let abilities = card.abilities {
                    Text("Abilities:")
                        .font(.title3)
                        .bold()
                    
                    VStack(alignment: .leading, spacing: 10) {
                        ForEach(abilities, id: \.name) { ability in
                            VStack(alignment: .leading) {
                                Text(ability.name ?? "")
                                    .font(.headline)
                                Text(ability.text ?? "")
                            }
                        }
                    }
                }
                
                if let attacks = card.attacks {
                    Text("Attacks:")
                        .font(.title3)
                        .bold()
                    
                    VStack(alignment: .leading, spacing: 10) {
                        ForEach(attacks, id: \.name) { attack in
                            VStack(alignment: .leading) {
                                Text(attack.name ?? "")
                                    .font(.headline)
                                Text("Cost: \([attack.cost].description ?? "")")
                                Text("Damage: \(attack.damage ?? "")")
                                Text("Text: \(attack.text ?? "")")
                            }
                        }
                    }
                }
                
                Spacer()
            }
            .padding()
        }
        .navigationTitle(card.name ?? "Card Details")
    }
}
