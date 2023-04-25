//
//  netowrkManager.swift
//  ITC-Assignment-16
//
//  Created by Isaiah Ojo on 24/04/2023.
//


import Foundation

class NetworkManager: networkableProtocol {
    static let shared = NetworkManager()
    private init() {}

    func getDataFromAPI(url:URL) async throws -> Data {
        
        do{
            let (data,_) = try await URLSession.shared.data(from: url)
            return data
        }catch let error{
            throw error
        }
    }
    
    func fetchPokemonCards(completion: @escaping (Result<[Datum], APIError>) -> Void) async {
        let urlString = "https://api.pokemontcg.io/v2/cards?page=1&pageSize=40"

        guard let url = URL(string: urlString) else { return }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            let response = try decoder.decode([Datum].self, from: data)
            completion(.success(response))
        } catch {
            completion(.failure(.networkError))
        }
    }
}
