//
//  RequestBuilder.swift
//  Ficek_QuantiApp
//
//  Created by Martin Ficek on 26.02.2023.
//

import Foundation
import ComposableArchitecture
import XCTestDynamicOverlay

extension DependencyValues {
    public var requestBuilderClient: RequestBuilderClient {
        get { self[RequestBuilderClient.self] }
        set { self[RequestBuilderClient.self] = newValue }
    }
}

public struct RequestBuilderClient {
    public struct Input {
        public let url: URL
        
        public init(url: URL) {
            self.url = url
        }
     }
    
   public let rocketRequest: (Input) throws -> URLRequest
}

extension RequestBuilderClient: DependencyKey {
   public static var liveValue: RequestBuilderClient {
        
        return Self(
            rocketRequest: { input in
                var request = URLRequest(url: input.url)
                request.httpMethod = "GET"
                return request
            }
        )
    }
    
    public static var testValue = RequestBuilderClient { input in
        return URLRequest(url: input.url)
    }
}
