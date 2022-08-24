//
//  RocketEndpoints.swift
//  RocketLaunch
//
//  Created by Lucie Havrdová on 24.08.2022.
//

import Foundation

// MARK: - Endpoint for SpaceX API

enum RocketEndpoints {
    case rocketList
    case rocketDetail(id: String)
}

extension RocketEndpoints {
    // MARK: Endpoint URL Paht
    var path: String {
        switch self {
        case .rocketList:
            return Constants.Networking.allRockets
        case .rocketDetail(let id):
            return Constants.Networking.oneRocket(id: id)
        }
    }

    // MARK: Url
    var url: String {
        switch self {
        case .rocketList:
            return Constants.Networking.baseURL + Constants.Networking.allRockets
        case .rocketDetail(let id):
            return Constants.Networking.baseURL + Constants.Networking.oneRocket(id: id)
        }
    }

    // MARK: Method
    var method: String {
        switch self {
        case .rocketList:
            return "GET"
        case .rocketDetail:
            return "GET"
        }
    }

    // MARK: URL Request creation
    // TODO: remove exclamation marks
    var request: URLRequest {
        var urlComponents = URLComponents(string: Constants.Networking.baseURL)!
        urlComponents.path = path

        var request = URLRequest(url: urlComponents.url!)
        request.httpMethod = method

        return request
    }
}
