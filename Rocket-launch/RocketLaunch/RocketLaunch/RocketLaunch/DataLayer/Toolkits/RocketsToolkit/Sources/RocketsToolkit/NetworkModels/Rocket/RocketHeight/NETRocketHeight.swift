//
//  NETRocketHeight.swift
//  
//
//  Created by Tomáš Brand on 13.03.2023.
//

import SharedDomain

struct NETRocketHeight: Codable {
    let meters: Double
    let feet: Double
}

// Conversion from NetworkModel to DomainModel
extension NETRocketHeight {
    var domainModel: RocketHeight {
        RocketHeight(meters: meters, feet: feet)
    }
}

// Conversion from DomainModel to NetworkModel
extension RocketHeight {
    var networkModel: NETRocketHeight {
        NETRocketHeight(meters: meters, feet: feet)
    }
}

