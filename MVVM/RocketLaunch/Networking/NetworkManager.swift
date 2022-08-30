//
//  NetworkingManager.swift
//  RocketLaunch
//
//  Created by Lucie Havrdová on 24.08.2022.
//

import Foundation

// MARK: - Network Manager

struct NetworkManager {
    func getDataFromRequest<T: Decodable>(_ request: URLRequest) async throws -> T {
        let (data, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse else { throw APIError.other }
        switch httpResponse.statusCode {
        case 100...199: throw APIError.informationalResponse
        case 200...299: break
        case 300...399: throw APIError.redirectionResponse
        case 400...499: throw APIError.clientErrorResponse
        case 500...599: throw APIError.serverErrorResponse
        default: throw APIError.other
        }

        return try decode(data: data)
    }

    // MARK: - Private helpers

    private let decoder = JSONDecoder()

    private func decode<T: Decodable>(data: Data) throws -> T {
        let decodedData = try decoder.decode(T.self, from: data)
        return decodedData
    }
}
