//
//  File.swift
//  
//
//  Created by Tomáš Brand on 25.03.2023.
//

import SharedDomain

struct NETThrust: Codable {
    let kN: Double
    let lbf: Double
}

// Conversion from NetworkModel to DomainModel
extension NETThrust {
    var domainModel: Thrust {
        Thrust(kN: kN, lbf: lbf)
    }
}

// Conversion from DomainModel to NetworkModel
extension Thrust {
    var networkModel: NETThrust {
        NETThrust(kN: kN, lbf: lbf)
    }
}
