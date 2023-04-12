//
//  NETRocket.swift
//  
//
//  Created by Tomáš Brand on 13.03.2023.
//

import SharedDomain
//import DomainLayer

struct NETRocket: Codable {
    let id: String
    let name: String
    let description: String
    let wikipedia: String
    let active: Bool
    let stages: Int
    let boosters: Int
    let cost_per_launch: Int
    let success_rate_pct: Int
    let first_flight: String
    let country: String
    let company: String
    let flickr_images: [String]
    let first_stage: NETRocketFirstStage?
    let second_stage: NETRocketSecondStage?
    let height: NETRocketHeight?
    let diameter: NETRocketDiameter?
    let mass: NETRocketMass?
}

// Conversion from NetworkModel to DomainModel
extension NETRocket {
    var domainModel: Rocket {
        Rocket(
            id: id,
            name: name,
            description: description,
            wikipedia: wikipedia,
            active: active,
            stages: stages,
            boosters: boosters,
            costPerLaunch: cost_per_launch,
            successRatePct: success_rate_pct,
            firstFlight: first_flight,
            country: country,
            company: company,
            flickrImages: flickr_images,
            firstStage: first_stage?.domainModel,
            secondStage: second_stage?.domainModel,
            height: height?.domainModel,
            diameter: diameter?.domainModel,
            mass: mass?.domainModel
        )
    }
}

// Conversion from DomainModel to NetworkModel
extension Rocket {
    var networkModel: NETRocket {
        NETRocket(
            id: id,
            name: name,
            description: description,
            wikipedia: wikipedia,
            active: active,
            stages: stages,
            boosters: boosters,
            cost_per_launch: costPerLaunch,
            success_rate_pct: successRatePct,
            first_flight: firstFlight,
            country: country,
            company: company,
            flickr_images: flickrImages,
            first_stage: firstStage?.networkModel,
            second_stage: secondStage?.networkModel,
            height: height?.networkModel,
            diameter: diameter?.networkModel,
            mass: mass?.networkModel
        )
    }
}
