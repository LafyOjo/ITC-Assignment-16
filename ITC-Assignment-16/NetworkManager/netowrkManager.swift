//
//  netowrkManager.swift
//  ITC-Assignment-16
//
//  Created by Isaiah Ojo on 24/04/2023.
//


import Foundation

class NetworkManager: Networkable {
    static let shared = NetworkManager()
    private init() {}

    func fetchPokemonCards(completion: @escaping (Result<[PokemonCard], APIError>) -> Void) async {
        let urlString = "https://api.pokemontcg.io/v2/cards?page=1&pageSize=15"

        guard let url = URL(string: urlString) else { return }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            let response = try decoder.decode([PokemonCard].self, from: data)
            completion(.success(response))
        } catch {
            completion(.failure(.networkError))
        }
    }
}
