//
//  DIContainer.swift
//  RocketLaunch
//
//  Created by Lucie Havrdová on 23.08.2022.
//

import Foundation

final class DIContainer {
    static let shared = DIContainer()

    lazy var apiDataMockProviderService: APIDataServiceProviderProtocol = {
        MockAPIDataServiceProvider()
    }()

//    lazy var apiDataProviderService: APIDataProvicerServiceProtocol = {
//        // TBA
//    }()
}
