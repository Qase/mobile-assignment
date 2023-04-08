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
import Rocket
import APIClient
import RequestBuilderClient

extension DependencyValues {
    public var rocketRepository: RocketRepository{
        get { self[RocketRepository.self] }
        set { self[RocketRepository.self] = newValue }
    }
}

public struct RocketRepository{
//    struct Input {
//
//
//    }
  public let fetchAllRockets: () async throws -> [Rocket]
}

extension RocketRepository: DependencyKey {
    
   public static var liveValue: RocketRepository {
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
    
   public static let testValue = RocketRepository(
        //fetchAllRockets: unimplemented("RocketRepositoryClient(fetchAllRockets: )")
        fetchAllRockets: {
            return .mock
        }
    )
    
    public static let previewValue = RocketRepository(
        fetchAllRockets: {
            return .mock
        }
    )
}





