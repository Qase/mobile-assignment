//
//  RocketRepository.swift
//  Ficek_QuantiApp
//
//  Created by Martin Ficek on 24.02.2023.
//

import Foundation
import Combine
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
}


extension DependencyValues {
    var requestBuilderClient: RequestBuilderClient {
        get { self[RequestBuilderClient.self] }
        set { self[RequestBuilderClient.self] = newValue }
    }
}

struct RequestBuilderClient {
    struct Input {
        let url: URL
       
    }
    
    let rocketRequest: (Input) throws -> URLRequest
}

extension RequestBuilderClient: DependencyKey {
    static var liveValue: RequestBuilderClient {
        
        return Self(
            rocketRequest: { input in
                
                var request = URLRequest(url: input.url)
                request.httpMethod = "GET"
                
//                var components = URLComponents.init(url: input.url, resolvingAgainstBaseURL: false)
//                components?.queryItems = [
//                    URLQueryItem(name: "username", value: input.username.lowercased())
//                ]
//                let query = components?.url?.query
//                request.httpBody = query.flatMap { $0.data(using: .utf8) }
                return request
            }
        )
    }
    
    static var testValue = RequestBuilderClient { input in
        return URLRequest(url: input.url)
    }
}

extension DependencyValues {
    var apiClient: APIClient {
        get { self[APIClient.self] }
        set { self[APIClient.self] = newValue }
    }
}

struct APIClient {
    let request: (URLRequest) async throws -> (Data, URLResponse)
}

extension APIClient: DependencyKey {
    static var liveValue: APIClient {
        return Self(
            request: { request in
                try await URLSession.shared.data(for: request)
            }
        )
    }
}
