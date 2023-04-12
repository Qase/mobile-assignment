//
//  NETThrustSeaLevel.swift
//  
//
//  Created by Tomáš Brand on 25.03.2023.
//

import SharedDomain

struct NETThrustSeaLevel: Codable {
    let kN: Double
    let lbf: Double
}

// Conversion from NetworkModel to DomainModel
extension NETThrustSeaLevel {
    var domainModel: ThrustSeaLevel {
        ThrustSeaLevel(kN: kN, lbf: lbf)
    }
}

// Conversion from DomainModel to NetworkModel
extension ThrustSeaLevel {
    var networkModel: NETThrustSeaLevel {
        NETThrustSeaLevel(kN: kN, lbf: lbf)
    }
}
