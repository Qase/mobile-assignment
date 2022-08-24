//
//  APIMockDataServiceProvider.swift
//  RocketLaunch
//
//  Created by Lucie Havrdová on 23.08.2022.
//

import Foundation

// MARK: - API Mock Data Provider Service

struct MockAPIDataServiceProvider: APIDataServiceProviderProtocol {
    func getRocketList() async throws -> [Rocket] {
        return Rocket.all
    }

    func getRocketDetail(id: String) async throws -> RocketDetail {
        let result = RocketDetail.all
            .filter { rocket in
                rocket.id == id
            }
        if let firstElement = result.first{
            return firstElement
        }

        throw APIError.rocketNotFound
    }
}
