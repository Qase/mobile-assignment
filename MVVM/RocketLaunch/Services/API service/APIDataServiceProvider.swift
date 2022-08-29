//
//  APIDataServiceProvider.swift
//  RocketLaunch
//
//  Created by Lucie Havrdová on 23.08.2022.
//

import Foundation

// MARK: - API Data Service Provider

struct APIDataServiceProvider: APIDataServiceProviderProtocol {
    enum APIDataServiceError: Error {
        case rocketNorFound
    }

    func getRocketList() async throws -> [Rocket] {
        let (data, _) = try await URLSession.shared.data(for: RocketEndpoints.rocketList.request)
        let decodedDTORockets = try decode(data: data)
        let rockets = convertToModel(DTOData: decodedDTORockets)

        return rockets
    }

    func getRocketDetail(id: String) async throws -> RocketDetail {
        return RocketDetail.falcon9 // TODO: revrite
    }
}

// MARK: APIDataServiceProvider helpers

extension APIDataServiceProvider {
    func decode(data: Data) throws -> [RocketDTO] {
        let decoder = JSONDecoder()
        let decodedData = try decoder.decode([RocketDTO].self, from: data)
        return decodedData
    }

    func convertToModel(DTOData: [RocketDTO]) -> [Rocket] {
        var result: [Rocket] = []
        for dtoModel in DTOData {
            result.append(dtoModel.toRocket)
        }
        return result
    }
}
