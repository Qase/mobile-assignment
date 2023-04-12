//
//  ParameterEncoding.swift
//  
//
//  Created by Tomáš Brand on 11.03.2023.
//

import Foundation

/// A type used to define how a set of parameters are applied to a `URLRequest`.
public protocol ParameterEncoding {
    /// Creates a `URLRequest` by encoding parameters and applying them on the passed request.
    ///
    /// - Parameters:
    ///   - urlRequest: `URLRequest` value onto which parameters will be encoded.
    ///   - parameters: `[String: Any]` to encode onto the request.
    ///
    /// - Returns:      The encoded `URLRequest`.
    /// - Throws:       Any `Error` produced during parameter encoding.
    func encode(_ urlRequest: URLRequest, with parameters: [String: Any]) throws -> URLRequest
}
