//
//  Engines.swift
//  QuantiSpaceX
//
//  Created by Petr Žáček on 14.02.2025.
//

import Foundation

struct Engines: Codable, Hashable {
    var isp: Isp?
    var thrust_sea_level: ThrustSeaLevel?
    var thrust_vacuum: ThrustVacuum?
    var number: Int?
    var type: String?
    var version: String?
    var layout: String?
    var engine_loss_max: Int?
    var propellant_1: String?
    var propellant_2: String?
    var thrust_to_weight: Double?
}
