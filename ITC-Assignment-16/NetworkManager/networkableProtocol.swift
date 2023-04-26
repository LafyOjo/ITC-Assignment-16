//
//  networkableProtocol.swift
//  ITC-Assignment-16
//
//  Created by Isaiah Ojo on 24/04/2023.
//

import Foundation

// protocol
protocol networkableProtocol {
    func getDataFromAPI(url:URL) async throws -> Data
}

