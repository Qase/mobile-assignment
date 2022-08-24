//
//  APIError.swift
//  RocketLaunch
//
//  Created by Lucie Havrdová on 24.08.2022.
//

import Foundation

enum APIError: Error {
    case downloadError
    case decodingError
    case rocketNotFound

    case invalidURL
}

extension APIError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .downloadError:
            return NSLocalizedString("Description of downloading error.", comment: "It was unable to download data.")
        case .decodingError:
            return NSLocalizedString("Description of not decodable data.", comment: "Data were not decoded.")
        case .rocketNotFound:
            return NSLocalizedString("Description of not found rocket.", comment: "Rocket was not found.")
        case .invalidURL:
            return NSLocalizedString("Description of invalid URL.", comment: "Invalid API endpoint.")
        }
    }
}
