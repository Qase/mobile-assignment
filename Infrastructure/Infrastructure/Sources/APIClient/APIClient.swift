//
//  APIClient.swift
//  Ficek_QuantiApp
//
//  Created by Martin Ficek on 26.02.2023.
//

import Foundation
import Dependencies
import XCTestDynamicOverlay
import Networking
import RequestBuilder
import NetworkMonitoring
import Combine
import Rocket

extension DependencyValues {
    public var apiClient: APIClient {
        get { self[APIClient.self] }
        set { self[APIClient.self] = newValue }
    }
}

public struct APIClient {
    public init(
        request: @escaping (Request) -> AnyPublisher<(headers: [HTTPHeader], body: Data), NetworkError>
    )
    {
        self.request = request
    }
    
    public let request: (Request) -> AnyPublisher<(headers: [HTTPHeader], body: Data), NetworkError>
}

extension APIClient: DependencyKey {
    public static var liveValue: APIClient {
        return Self(
            request: { request in
                return request.execute(
                    using:
                        NetworkClient(
                            urlRequester: .live(urlSessionConfiguration: .default),
                            networkMonitorClient: .live(onQueue: DispatchQueue.main)
                        )
                )
            }
        )
    }
    
    public static var testValue: APIClient = Self(
        request: unimplemented()
        )
}
