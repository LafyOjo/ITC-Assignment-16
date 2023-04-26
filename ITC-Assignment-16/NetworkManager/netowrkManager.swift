//
//  netowrkManager.swift
//  ITC-Assignment-16
//
//  Created by Isaiah Ojo on 24/04/2023.
//


import Foundation

enum NetworkError: Error {
    case dataNotFound
    case invalidURL
    case decodingError
    case serverError
    case unknownError
    case invalidData
    
    var localizedDescription: String {
        switch self {
        case .dataNotFound:
            return NSLocalizedString("Data not found.", comment: "")
        case .invalidURL:
            return NSLocalizedString("Invalid URL.", comment: "")
        case .decodingError:
            return NSLocalizedString("Decoding error.", comment: "")
        case .serverError:
            return NSLocalizedString("Server error.", comment: "")
        case .unknownError:
            return NSLocalizedString("Unknown error.", comment: "")
        case .invalidData:
            return NSLocalizedString("Data Invalid", comment: "")
        }
    }
}

class NetworkManager: networkableProtocol {
    static let shared = NetworkManager()
    init() {}

    func getDataFromAPI(url: URL) async throws -> Data {
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            return data
        } catch {
            throw NetworkError.invalidData
        }
    }
    
    func getDataFromJSONFile(fileName: String, completion: @escaping (Result<Data, Error>) -> Void) {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json") else {
            completion(.failure(NetworkError.invalidURL))
            return
        }

        do {
            let data = try Data(contentsOf: url)
            completion(.success(data))
        } catch {
            completion(.failure(NetworkError.invalidData))
        }
    }
}
//    func fetchPokemonCards(completion: @escaping (Result<[Datum], APIError>) -> Void) async {
//        let urlString = "https://api.pokemontcg.io/v2/cards?page=1&pageSize=40"
//
//        guard let url = URL(string: urlString) else { return }
//
//        do {
//            let (data, _) = try await URLSession.shared.data(from: url)
//            let decoder = JSONDecoder()
//            let response = try decoder.decode([Datum].self, from: data)
//            completion(.success(response))
//        } catch {
//            completion(.failure(.networkError))
//        }
//    }
//}


