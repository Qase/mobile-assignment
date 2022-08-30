//
//  RocketDetailDTO.swift
//  RocketLaunch
//
//  Created by Lucie Havrdová on 24.08.2022.
//

import Foundation
import SwiftUI

// MARK: - Rocket Detail DTO Model

struct RocketDetailDTO: Codable {
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

struct StageDTO: Codable {
    let reusable: Bool
    let engines: Int
    let fuel_amount_tons: Double
    let burn_time_sec: Double?
}

struct MassParameterDTO: Codable {
    let kg: Double
    let lb: Double
}

struct LenghtParameterDTO: Codable {
    let meters: Double
    let feet: Double
}

// MARK: toRocketDetail (DTO into Model)

extension RocketDetailDTO: DTOModelProtocol {
    var toModel: RocketDetail {
        var photos: [Photo] = []
        for photoURL in self.flickr_images{
            let photo = Photo(stringURL: photoURL)
            photos.append(photo)
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
                fuelAmount: Int(self.first_stage.fuel_amount_tons),
                burnTime: (self.first_stage.burn_time_sec != nil) ? Int(self.first_stage.burn_time_sec!) : nil
            ),
            secondStage: Stage(
                engines: self.second_stage.engines,
                reusable: self.second_stage.reusable,
                fuelAmount: Int(self.second_stage.fuel_amount_tons),
                burnTime: (self.second_stage.burn_time_sec != nil) ? Int(self.second_stage.burn_time_sec!) : nil
            ),
            photos: photos
        ) 
    }
}
