//
//  NetworkProviderError.swift
//  
//
//  Created by Tomáš Brand on 11.03.2023.
//

public enum NetworkProviderError: Error {
    case requestFailed(statusCode: NetworkStatusCode, message: String)
}
