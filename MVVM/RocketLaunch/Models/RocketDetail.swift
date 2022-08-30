//
//  RocketDetail.swift
//  rocketLaunch
//
//  Created by Lucie Havrdová on 11.02.2022.
//

import Foundation
import Metal

// MARK: - Rocket Detail Model

struct RocketDetail: Codable {
    let id: String
    let name: String
    let description: String

    let parameters: [Parameter]
    let firstStage: Stage
    let secondStage: Stage
    let photos: [Photo]
}

// MARK: Parameter

enum ParameterType: Codable {
    case diameter
    case height
    case mass
}

struct Parameter: Codable {
    let type: ParameterType
    let name: String
    let metric: Double
    let imperial: Double
}

// MARK: Stage

struct Stage: Codable {
    let engines: Int
    let reusable: Bool
    let fuelAmount: Int
    let burnTime: Int?
}

// MARK: Photo

struct Photo: Hashable, Codable {
    let stringURL: String
}

// MARK: - Models extensions

extension RocketDetail {
    func getParameter(type: ParameterType) -> Parameter? {
        return parameters
            .filter { instance in
                instance.type == type
            }
            .first
    }
}
