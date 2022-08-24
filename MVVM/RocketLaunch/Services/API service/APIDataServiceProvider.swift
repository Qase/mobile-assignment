//
//  APIDataServiceProvider.swift
//  RocketLaunch
//
//  Created by Lucie Havrdová on 23.08.2022.
//

import Foundation

struct APIDataServiceProvider: APIDataServiceProviderProtocol {
    enum APIDataServiceError: Error {
        case rocketNorFound
    }

    func getRocketList() async throws -> [Rocket] {
        guard let url = URL(string: RocketEndpoints.rocketList.url) else {
            throw APIError.invalidURL
        }
        let (data, response) = try await URLSession.shared.data(from: url)

        return []
    }

    func getRocketDetail(id: String) async throws -> RocketDetail {
        return RocketDetail.falcon9 // TODO: revrite
    }
}
