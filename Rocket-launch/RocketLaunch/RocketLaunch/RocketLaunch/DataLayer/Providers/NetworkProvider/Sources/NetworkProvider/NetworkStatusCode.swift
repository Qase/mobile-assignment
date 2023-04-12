//
//  NetworkStatusCode.swift
//  
//
//  Created by Tomáš Brand on 11.03.2023.
//

public enum NetworkStatusCode: Int {
    case badRequest = 400
    case unathorized = 401
    case forbidden = 403
    case notFound = 404
    case methodNotAllowed = 405
    case conflict = 409
    case internalServerError = 500
    case unknown = 0
}
