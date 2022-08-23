//
//  RocketDetail.swift
//  rocketLaunch
//
//  Created by Lucie Havrdová on 11.02.2022.
//

import Foundation
import Metal

// MARK: - Rocket Detail Model

struct RocketDetail {
    let id: String
    let name: String
    let description: String

    let parameters: [Parameter]
    let firstStage: Stage
    let secondStage: Stage
    let photos: [Photo]
}

// MARK: Parameter

enum ParameterType {
    case diameter
    case height
    case mass
}

struct Parameter {
    let type: ParameterType
    let name: String
    let metric: Double
    let imperial: Double
}

// MARK: Stage

struct Stage {
    let engines: Int
    let reusable: Bool
    let fuelAmount: Int
    let burnTime: Int
}

// MARK: Photo

struct Photo: Hashable {
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
