//
//  testNetworkManager.swift
//  ITC-Assignment-16
//
//  Created by Isaiah Ojo on 26/04/2023.
//

import Foundation

class TestNetworkManager: networkableProtocol {
    func getDataFromAPI(url: URL) async throws -> Data {
        let bundle = Bundle(for: TestNetworkManager.self)
        
        guard let filePathUrl = bundle.url(forResource: url.absoluteString, withExtension: "json") else {
            throw NetworkError.dataNotFound
        }

        do {
            let data = try Data(contentsOf: filePathUrl)
            return data
        } catch {
            throw NetworkError.dataNotFound
        }
    }
}
