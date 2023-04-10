//
//  RocketClient.swift
//  
//
//  Created by Martin Ficek on 09.04.2023.
//

import Foundation
import ComposableArchitecture
import Dependencies
import XCTestDynamicOverlay
import Rocket
import Combine
import Networking
import RequestBuilder
import NetworkMonitoring
import APIClient
import RequestBuilderClient

extension DependencyValues {
    public var rocketClient: RocketClient{
        get { self[RocketClient.self] }
        set { self[RocketClient.self] = newValue }
    }
}

public struct RocketClient{
    //    struct Input {
    //
    //
    //    }
    public let fetchAllRockets: () -> AnyPublisher<[Rocket], RocketError>
}

extension RocketClient: DependencyKey {
    
    public static var liveValue: RocketClient {
        
        @Dependency(\.apiClient) var apiClient
        @Dependency(\.requestBuilderClient) var requestBuilder
        
        return Self(
            fetchAllRockets: {
              
                return apiClient.request(requestBuilder.rocketRequest())
                    .tryMap { (headers, body) -> Data in
                        guard headers["Content-Type"] == "application/json; charset=utf-8" else {
                            throw NetworkError.invalidResponse
                        }
                        return body
                    }
                    .decode(type: [Rocket].self, decoder: JSONDecoder())
                    .mapError { NetworkError -> RocketError in
                        return RocketError.networkError
                    }
                    .eraseToAnyPublisher()
            }
        )
    }
    
    public static let testValue = RocketClient(
        fetchAllRockets: unimplemented("RocketRepositoryClient(fetchAllRockets: )")
//        fetchAllRockets: {
//            return Just([Rocket].mock)
//                .setFailureType(to: RocketError.self)
//                .eraseToAnyPublisher()
//        }
    )
    
    public static let previewValue = RocketClient(
        fetchAllRockets: {
            return Just([Rocket].mock)
                .setFailureType(to: RocketError.self)
                .eraseToAnyPublisher()
        }
    )
}
