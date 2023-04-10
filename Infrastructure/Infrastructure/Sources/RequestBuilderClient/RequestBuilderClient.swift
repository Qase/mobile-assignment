//
//  RequestBuilder.swift
//  Ficek_QuantiApp
//
//  Created by Martin Ficek on 26.02.2023.
//

import Foundation
import Dependencies
import XCTestDynamicOverlay
import RequestBuilder

extension DependencyValues {
    public var requestBuilderClient: RequestBuilderClient {
        get { self[RequestBuilderClient.self] }
        set { self[RequestBuilderClient.self] = newValue }
    }
}

public struct RequestBuilderClient {
//    public struct Input {
//        public let url: String
//
//        public init(url: String) {
//            self.url = url
//        }
//     }
    
   public let rocketRequest: () -> Request
}

extension RequestBuilderClient: DependencyKey {
   public static var liveValue: RequestBuilderClient {
        
        return Self(
            rocketRequest: {
//                var request = URLRequest(url: input.url)
//                request.httpMethod = "GET"
//                return request
//
                return Request(
                    endpoint: "https://api.spacexdata.com/v4/rockets"
                )
            }
        )
    }
    
    public static var testValue = RequestBuilderClient {
        return Request(endpoint: "https://api.spacexdata.com/v4/rockets")
    }
}
