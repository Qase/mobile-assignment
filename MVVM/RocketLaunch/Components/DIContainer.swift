//
//  DIContainer.swift
//  RocketLaunch
//
//  Created by Lucie Havrdová on 23.08.2022.
//

import Foundation

// MARK: - DI Container

final class DIContainer {
    static let shared = DIContainer()

    lazy var apiDataMockProviderService: APIDataServiceProviderProtocol = {
        MockAPIDataServiceProvider()
    }()

    lazy var apiDataServiceProvider: APIDataServiceProviderProtocol = {
        APIDataServiceProvider()
    }()
}
