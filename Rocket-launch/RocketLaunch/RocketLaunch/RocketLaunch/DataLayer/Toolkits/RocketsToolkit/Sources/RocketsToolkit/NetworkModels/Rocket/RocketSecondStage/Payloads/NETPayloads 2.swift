//
//  File.swift
//  
//
//  Created by Tomáš Brand on 25.03.2023.
//

import SharedDomain

struct NETPayloads: Codable {
    let composite_fairing: NETCompositeFairing?
    let option_1: String
}

// Conversion from NetworkModel to DomainModel
extension NETPayloads {
    var domainModel: Payloads {
        Payloads(
            compositeFairing: composite_fairing?.domainModel,
            option1: option_1)
    }
}

// Conversion from DomainModel to NetworkModel
extension Payloads {
    var networkModel: NETPayloads {
        NETPayloads(
            composite_fairing: compositeFairing?.networkModel,
            option_1: option1
        )
    }
}
