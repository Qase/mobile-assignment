//
//  RocketsAPI.swift
//  
//
//  Created by Tomáš Brand on 13.03.2023.
//

import Foundation
import NetworkProvider
import Utilities

enum RocketsAPI {
    case readList(_ page: Int)
    case read(_ id: String)
}

extension RocketsAPI: NetworkEndpoint {
    var baseURL: URL { URL(string: "\(NetworkingConstants.baseURL)")! }
    var path: String {
        switch self {
        case .readList:
            return "/rockets"
        case let .read(id):
            return "/rockets/\(id)"
        }
    }
    
    var method: NetworkMethod {
        switch self {
        case .readList:
            return .get
        default:
            return .get
        }
    }
    
    var headers: [String: String]? {
        nil
    }
    
    var task: NetworkTask {
        switch self {
        case let .readList(page):
            let params: [String: Any] = [
                "page": page,
                "limit": 100
            ]
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
        case .read:
            return .requestPlain
        }
    }
}
