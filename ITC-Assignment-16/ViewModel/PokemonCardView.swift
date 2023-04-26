//
//  PokemonCardView.swift
//  ITC-Assignment-16
//
//  Created by Isaiah Ojo on 26/04/2023.
//

import SwiftUI

struct PokemonCardView: View {
    let pokemon: PokemonDetails

    var body: some View {
        VStack(alignment: .leading) {
            if let urlString = pokemon.images?.small, let url = URL(string: urlString) {
                AsyncImage(url: url) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 100, height: 100)
            }
            Text(pokemon.name ?? "")
                .font(.headline)
            Text("HP: \(pokemon.hp ?? "")")
                .font(.subheadline)
            Text("Level: \(pokemon.level ?? "")")
                .font(.subheadline)
        }
        .accessibility(identifier: "pokemonCard")
    }
}
