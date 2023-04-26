//
//  PokemonListView.swift
//  ITC-Assignment-16
//
//  Created by Isaiah Ojo on 26/04/2023.
//

import SwiftUI

struct PokemonListView: View {
    @StateObject private var viewModel = PokemonViewModel(manager: NetworkManager.shared)

    var body: some View {
        NavigationView {
            List(viewModel.pokemonList, id: \.id) { pokemon in
                PokemonCardView(pokemon: pokemon)
            }
            .task {
                await viewModel.getListOfPokemons(urlString: "https://api.pokemontcg.io/v2/cards?page=1&pageSize=40")
            }
            .navigationBarTitle("Pokémon Cards")
        }
    }
}
