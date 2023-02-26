//
//  APIClient.swift
//  Ficek_QuantiApp
//
//  Created by Martin Ficek on 26.02.2023.
//

import Foundation
import ComposableArchitecture
import XCTestDynamicOverlay

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
