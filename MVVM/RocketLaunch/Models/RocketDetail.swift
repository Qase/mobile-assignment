//
//  RocketDetail.swift
//  rocketLaunch
//
//  Created by Lucie Havrdová on 11.02.2022.
//

import Foundation
import Metal
import SwiftUI

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
    let name: LocalizedStringKey
    var metric: Double
    let imperial: Double

    var metricString: String {
        switch type {
        case .diameter, .height:
            return String(format: "%.0f", self.metric)+"m"
        case .mass:
            if self.metric.rounded(.down) > 1000 {
                return String(format: "%.0f", self.metric/1000)+"t"
            }
            return String(format: "%.0f", self.metric)+"kg"
        }
    }
}

// MARK: Stage

struct Stage {
    let engines: Int
    let reusable: Bool
    let fuelAmount: Int
    let burnTime: Int?
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
