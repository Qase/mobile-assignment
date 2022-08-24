//
//  APIMockDataServiceProvider.swift
//  RocketLaunch
//
//  Created by Lucie Havrdová on 23.08.2022.
//

import Foundation

// MARK: - API Mock Data Provider Service

struct MockAPIDataServiceProvider: APIDataServiceProviderProtocol {
    func getRocketList() -> [Rocket] {
        return Rocket.all
    }

    func getRocketDetail(id: String) -> RocketDetail? {
        let result = RocketDetail.all
            .filter { rocket in
                rocket.id == id
            }
        if !result.isEmpty {
            return result.first
        }
        return nil
    }
}
