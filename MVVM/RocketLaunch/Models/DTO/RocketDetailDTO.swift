//
//  RocketDetailDTO.swift
//  RocketLaunch
//
//  Created by Lucie Havrdová on 24.08.2022.
//

import Foundation
import SwiftUI

// MARK: - Rocket Detail DTO Model

struct RocketDetailDTO {
    let id: String
    let name: String
    let description: String
    let first_stage: StageDTO
    let second_stage: StageDTO
    let flickr_images: [String]
    let mass: MassParameterDTO
    let diameter: LenghtParameterDTO
    let height: LenghtParameterDTO
}

struct StageDTO {
    let reusable: Bool
    let engines: Int
    let fuelAmountTons: Int
    let burnTimeSEC: Int
}

struct MassParameterDTO {
    let kg: Double
    let lb: Double
}

struct LenghtParameterDTO {
    let meters: Double
    let feet: Double
}

// MARK: toRocketDetail (DTO into Model)

extension RocketDetailDTO {
    var toRocketDetail: RocketDetail {
        let photos: [Photo]
        for photoURL in self.flickr_images{
            photos.append(Photo(stringURL: photoURL))
        }

        let massParameter = Parameter(
            type: .mass,
            name: "mass", // TODO: use localized string key
            metric: self.mass.kg,
            imperial: self.mass.lb
        )

        let diameterParameter = Parameter(
            type: .diameter,
            name: "diameter", // TODO: use localized string key
            metric: self.diameter.meters,
            imperial: self.diameter.feet
        )

        let heightParameter = Parameter(
            type: .height,
            name: "heigh", // TODO: use localized string key
            metric: self.height.meters,
            imperial: self.height.meters
        )

        return RocketDetail(
            id: self.id,
            name: self.name,
            description: self.description,
            parameters: [
                massParameter,
                diameterParameter,
                heightParameter
            ],
            firstStage: Stage(
                engines: self.first_stage.engines,
                reusable: self.first_stage.reusable,
                fuelAmount: self.first_stage.fuelAmountTons,
                burnTime: self.first_stage.burnTimeSEC
            ),
            secondStage: Stage(
                engines: self.second_stage.engines,
                reusable: self.second_stage.reusable,
                fuelAmount: self.second_stage.fuelAmountTons,
                burnTime: self.second_stage.burnTimeSEC
            ),
            photos: photos
        )
    }
}
