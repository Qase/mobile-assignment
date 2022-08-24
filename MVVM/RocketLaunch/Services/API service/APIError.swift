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
}
