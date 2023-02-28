//
//  RocketRepository.swift
//  Ficek_QuantiApp
//
//  Created by Martin Ficek on 24.02.2023.
//

import Foundation
import ComposableArchitecture
import Dependencies
import XCTestDynamicOverlay

extension DependencyValues {
    var rocketRepositoryClient: RocketRepositoryClient {
        get { self[RocketRepositoryClient.self] }
        set { self[RocketRepositoryClient.self] = newValue }
    }
}

struct RocketRepositoryClient {
//    struct Input {
//
//
//    }
    let fetchAllRockets: () async throws -> [Rocket]
}

extension RocketRepositoryClient: DependencyKey {
    
    static var liveValue: RocketRepositoryClient {
        @Dependency(\.apiClient) var apiClient
        @Dependency(\.requestBuilderClient) var requestBuilderClient
        
        return Self(
            fetchAllRockets: {
                guard let url = URL(string: "https://api.spacexdata.com/v4/rockets")
                else {
                    throw RocketError.badUrl
                }
                
                let request = try requestBuilderClient.rocketRequest(
                    RequestBuilderClient.Input(url: url)
                )
                
                let (data, _) = try await apiClient.request(request)
                return try JSONDecoder().decode([Rocket].self, from: data)
            }
        )
    }
    
    static let testValue = RocketRepositoryClient(
        //fetchAllRockets: unimplemented("RocketRepositoryClient(fetchAllRockets: )")
        fetchAllRockets: {
            return .mock
        }
    )
    
    static let previewValue = RocketRepositoryClient(
        fetchAllRockets: {
            return .mock
        }
    )
}





