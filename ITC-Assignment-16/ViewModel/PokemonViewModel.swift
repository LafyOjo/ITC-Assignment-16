//
//  PokemonViewModel.swift
//  ITC-Assignment-16
//
//  Created by Isaiah Ojo on 24/04/2023.
//
import Foundation

@MainActor
class PokemonListViewModel: ObservableObject {
    private let networkManager: networkableProtocol

    @Published var pokeData = [Datum]()
    @Published var errorMessage: String = ""
    @Published var isLoading: Bool = false

    init(networkManager: networkableProtocol = NetworkManager.shared) {
        self.networkManager = networkManager
    }

    //func fetchPokemonCards() async {
//        isLoading = true
//        do {
//            try await networkManager.fetchPokemonCards { result in
//                switch result {
//                case .success(let response):
//                    self.pokeData = response
//                    self.errorMessage = ""
//                case .failure:
//                    self.errorMessage = "An error occurred while fetching data."
//                }
//            }
//        } catch {
//            errorMessage = "An error occurred while fetching data."
//        }
//        isLoading = false
//    }

    func getListOfPokemons(urlString: String) async {
        guard let url = URL(string: urlString) else {
            return
        }

        do {
            let datala = try await networkManager.getDataFromAPI(url: url)
            print(datala)
            let pokemondata = try JSONDecoder().decode(Pokemon.self, from: datala)
            print(pokemondata)
            pokeData = pokemondata.data
            print(pokeData)
        } catch {
            print(error.localizedDescription)
        }
    }
}







