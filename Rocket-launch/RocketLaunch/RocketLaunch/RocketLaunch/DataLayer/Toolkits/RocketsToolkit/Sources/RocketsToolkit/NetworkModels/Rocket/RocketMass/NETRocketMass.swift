//
//  NETRocketMass.swift
//  
//
//  Created by Tomáš Brand on 13.03.2023.
//

import SharedDomain

struct NETRocketMass: Codable {
    let kg: Double
    let lb: Double
}

// Conversion from NetworkModel to DomainModel
extension NETRocketMass {
    var domainModel: RocketMass {
        RocketMass(kg: kg, lb: lb)
    }
}

// Conversion from DomainModel to NetworkModel
extension RocketMass {
    var networkModel: NETRocketMass {
        NETRocketMass(kg: kg, lb: lb)
    }
}

