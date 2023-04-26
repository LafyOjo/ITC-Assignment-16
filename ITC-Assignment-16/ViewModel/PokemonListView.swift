//
//  PokemonListView.swift
//  ITC-Assignment-16
//
//  Created by Isaiah Ojo on 26/04/2023.
//


import SwiftUI

struct PokemonListView: View {
    @StateObject var viewModel = PokemonViewModel(manager: NetworkManager.shared)
    @State private var showingAlert = false
    @State private var alertMessage = ""

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.pokemonList) { pokemon in
                    NavigationLink(destination: CardDetailView(card: pokemon)) {
                        HStack {
                            if let urlString = pokemon.images?.small, let url = URL(string: urlString) {
                                AsyncImage(url: url) { image in
                                    image.resizable()
                                } placeholder: {
                                    ProgressView()
                                }
                                .frame(width: 50, height: 50)
                            }
                            Text(pokemon.name ?? "Unknown")
                        }
                    }
                }
            }
            .navigationTitle(NSLocalizedString("Pokemon Cards", comment: ""))
            .alert(isPresented: $showingAlert, content: {
                Alert(title: Text(NSLocalizedString("Error", comment: "")), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            })
        }
        .onAppear {
            Task {
                do {
                    try await viewModel.getListOfPokemons(urlString: "https://api.pokemontcg.io/v2/cards?page=1&pageSize=40")
                } catch {
                    showingAlert = true
                    alertMessage = error.localizedDescription
                }
            }
        }
    }
}






