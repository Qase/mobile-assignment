//
//  NETRocketSecondStage.swift
//  
//
//  Created by Tomáš Brand on 25.03.2023.
//

import SharedDomain

struct NETRocketSecondStage: Codable {
    let reusable: Bool?
    let engines: Double?
    let fuel_amount_tons: Double?
    let burn_time_sec: Double?
}

// Conversion from NetworkModel to DomainModel
extension NETRocketSecondStage {
    var domainModel: RocketSecondStage {
        RocketSecondStage(
            reusable: reusable,
            engines: engines,
            fuelAmountTons: fuel_amount_tons,
            burnTimeSec: burn_time_sec
        )
    }
}

// Conversion from DomainModel to NetworkModel
extension RocketSecondStage {
    var networkModel: NETRocketSecondStage {
        NETRocketSecondStage(
            reusable: reusable ?? false,
            engines: engines ?? 0,
            fuel_amount_tons: fuelAmountTons ?? 0,
            burn_time_sec: burnTimeSec ?? 0
        )
    }
}
