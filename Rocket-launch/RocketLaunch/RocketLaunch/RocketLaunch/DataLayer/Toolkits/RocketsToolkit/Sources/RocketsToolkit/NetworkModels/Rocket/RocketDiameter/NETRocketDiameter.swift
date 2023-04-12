//
//  NETRocketDiameter.swift
//  
//
//  Created by Tomáš Brand on 25.03.2023.
//

import SharedDomain

struct NETRocketDiameter: Codable {
    let meters: Double
    let feet: Double
}

// Conversion from NetworkModel to DomainModel
extension NETRocketDiameter {
    var domainModel: RocketDiameter {
        RocketDiameter(meters: meters, feet: feet)
    }
}

// Conversion from DomainModel to NetworkModel
extension RocketDiameter {
    var networkModel: NETRocketDiameter {
        NETRocketDiameter(meters: meters, feet: feet)
    }
}
