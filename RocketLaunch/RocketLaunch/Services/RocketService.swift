//
//  RocketsService.swift
//  rocketLaunch
//
//  Created by Lucie Havrdová on 24.02.2022.
//

import Foundation
import Combine

public struct RocketsService {
    private var url: URL {
        urlComponents.url!
    }
    
    private var urlComponents: URLComponents {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.spacexdata.com"
        components.path = "/v4/rockets/"
        return components
    }
}

extension RocketsService: APIServiceDataPublisher {
    public func publisher() -> AnyPublisher<Data, URLError> {
        URLSession.shared
            .dataTaskPublisher(for: url)
            .map(\.data)
            .eraseToAnyPublisher()
    }
}
