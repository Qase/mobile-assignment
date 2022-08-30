//
//  APIDataServiceProvider.swift
//  RocketLaunch
//
//  Created by Lucie Havrdová on 23.08.2022.
//

import Foundation


// MARK: - API Data Service Provider

struct APIDataServiceProvider: APIDataServiceProviderProtocol {
    func getRocketList() async throws -> [Rocket] {
        let networkManager = NetworkManager()
        let request = RocketEndpoints.rocketList.request
        let dto: [RocketDTO] = try await networkManager.getDataFromRequest(request)
        return dto.map { $0.toModel }
    }

    func getRocketDetail(id: String) async throws -> RocketDetail {
        let networkManager = NetworkManager()
        let request = RocketEndpoints.rocketDetail(id: id).request
        return try await networkManager.getDataFromRequest(request)
    }
}
