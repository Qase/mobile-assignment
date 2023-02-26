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
                return request
            }
        )
    }
    
    static var testValue = RequestBuilderClient { input in
        return URLRequest(url: input.url)
    }
}
