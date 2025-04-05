//
//  SecondStage.swift
//  QuantiSpaceX
//
//  Created by Petr Žáček on 14.02.2025.
//

import Foundation

struct SecondStage: Codable, Hashable {
    var thrust: Thrust?
    var payloads: Payloads?
    var reusable: Bool?
    var engines: Int?
    var fuel_amount_tons: Double?
    let burn_time_sec: Double?
}
