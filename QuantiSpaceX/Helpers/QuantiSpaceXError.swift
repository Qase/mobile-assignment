//
//  QuantiSpaceXError.swift
//  QuantiSpaceX
//
//  Created by Petr Žáček on 27.12.2024.
//

import Foundation

enum QuantiSpaceXError: LocalizedError, Equatable {

    case unknown

    var errorDescription: String? {
        switch self {
        case .unknown: return "Unknown error has occured."
        }
    }

}
