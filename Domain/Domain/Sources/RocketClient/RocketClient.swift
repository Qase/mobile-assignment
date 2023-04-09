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
    //    @Dependency(\.apiClient) var apiClient
    //    @Dependency(\.requestBuilderClient) var requestBuilderClient
        
        return Self(
            fetchAllRockets: {
               // var cancellables = Set<AnyCancellable>()
                let request = Request(endpoint: "https://api.spacexdata.com/v4/rockets")
                let networkClient = NetworkClient(urlRequester: .live(urlSessionConfiguration: .default), networkMonitorClient: .live(onQueue: DispatchQueue.main))
                
                let data = request.execute(using: networkClient)
                
                return data
                    .tryMap { (headers, body) -> Data in
//                        guard headers["Content-Type"] == "application/json" else {
//                        throw NetworkError.invalidResponse
//                        }
                    return body
                    }
                    .decode(type: [Rocket].self, decoder: JSONDecoder())
                        .mapError({ _ in
                            RocketError.internalError
                        })
                        .eraseToAnyPublisher()
                
                

                
//                guard let url = URL(string: "https://api.spacexdata.com/v4/rockets")
//                else {
//                    throw RocketError.badUrl
//                }
//
//                let request = try requestBuilderClient.rocketRequest(
//                    RequestBuilderClient.Input(url: url)
//                )
//
//                let (data, _) = try await apiClient.request(request)
//                return try JSONDecoder().decode([Rocket].self, from: data)
            }
        )
    }
    
//   public static let testValue = RocketClient(
//        //fetchAllRockets: unimplemented("RocketRepositoryClient(fetchAllRockets: )")
//        fetchAllRockets: {
//            return .mock
//        }
//    )
//
//    public static let previewValue = RocketClient(
//        fetchAllRockets: {
//            return .mock
//        }
//    )
}
