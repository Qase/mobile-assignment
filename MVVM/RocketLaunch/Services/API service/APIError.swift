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
    case invalidStatusCode
    case rocketNotFound

    // HTTP errors
    case informationalResponse
    case redirectionResponse
    case clientErrorResponse
    case serverErrorResponse
    case other


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
        case .invalidStatusCode:
            return NSLocalizedString("Invalid status code.", comment: "Invalid status code.")

        case .informationalResponse:
            return NSLocalizedString("Description of informational response.", comment: "http 100-199")
        case .redirectionResponse:
            return NSLocalizedString("Description of redirection status code.", comment: "http 300-399")
        case .clientErrorResponse:
            return NSLocalizedString("Description of client error response status code.", comment: "http 400-499")
        case .serverErrorResponse:
            return NSLocalizedString("Description of server error status code.", comment: "http 500-599")
        case .other:
            return NSLocalizedString("Description of some other error message.", comment: "No comment..")
        }
    }
}
