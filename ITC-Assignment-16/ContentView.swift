//
//  ContentView.swift
//  ITC-Assignment-16
//
//  Created by Isaiah Ojo on 24/04/2023.
//

import SwiftUI



struct ContentView: View {
    @StateObject var pokemonViewModel = PokemonListViewModel()

    var body: some View {
        VStack {
//            List(pokemonViewModel.pokeData, id: \.id) { pokemon in
//                VStack(alignment: .leading) {
//                    Text(pokemon.name ?? "")
//                    Text(pokemon.id ?? "")
//                }
            }
            .task {
                await pokemonViewModel.getListOfPokemons(urlString: APIEndpoint.pkListEndPoint)
            }
            .padding()
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }

