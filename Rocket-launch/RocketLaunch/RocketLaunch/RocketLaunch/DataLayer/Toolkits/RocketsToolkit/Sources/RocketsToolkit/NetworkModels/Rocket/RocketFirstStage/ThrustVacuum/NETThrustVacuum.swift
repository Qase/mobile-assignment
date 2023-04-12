//
//  NETThrustVacuum.swift
//  
//
//  Created by Tomáš Brand on 25.03.2023.
//

import SharedDomain

struct NETThrustVacuum: Codable {
    let kN: Double
    let lbf: Double
}

// Conversion from NetworkModel to DomainModel
extension NETThrustVacuum {
    var domainModel: ThrustVacuum {
        ThrustVacuum(kN: kN, lbf: lbf)
    }
}

// Conversion from DomainModel to NetworkModel
extension ThrustVacuum {
    var networkModel: NETThrustVacuum {
        NETThrustVacuum(kN: kN, lbf: lbf)
    }
}
