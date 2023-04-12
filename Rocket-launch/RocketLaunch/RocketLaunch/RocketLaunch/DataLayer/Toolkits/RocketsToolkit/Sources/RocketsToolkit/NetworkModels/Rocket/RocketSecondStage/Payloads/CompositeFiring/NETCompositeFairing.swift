//
//  File.swift
//  
//
//  Created by Tomáš Brand on 25.03.2023.
//

import SharedDomain

struct NETCompositeFairing: Codable {
    let height: NETRocketHeight?
    let diameter: NETRocketDiameter?
}

// Conversion from NetworkModel to DomainModel
extension NETCompositeFairing {
    var domainModel: CompositeFairing {
        CompositeFairing(
            height: height?.domainModel,
            diameter: diameter?.domainModel
        )
    }
}

// Conversion from DomainModel to NetworkModel
extension CompositeFairing {
    var networkModel: NETCompositeFairing {
        NETCompositeFairing(
            height: height?.networkModel,
            diameter: diameter?.networkModel
        )
    }
}
