//
//  NETRocketFirstStage.swift
//  
//
//  Created by Tomáš Brand on 25.03.2023.
//

import SharedDomain

struct NETRocketFirstStage: Codable {
    let reusable: Bool?
    let engines: Double?
    let fuel_amount_tons: Double?
    let burn_time_sec: Double?
}

// Conversion from NetworkModel to DomainModel
extension NETRocketFirstStage {
    var domainModel: RocketFirstStage {
        RocketFirstStage(
            reusable: reusable,
            engines: engines,
            fuelAmountTons: fuel_amount_tons,
            burnTimeSec: burn_time_sec
        )
    }
}

// Conversion from DomainModel to NetworkModel
extension RocketFirstStage {
    var networkModel: NETRocketFirstStage {
        NETRocketFirstStage(
            reusable: reusable,
            engines: engines,
            fuel_amount_tons: fuelAmountTons,
            burn_time_sec: burnTimeSec
        )
    }
}
