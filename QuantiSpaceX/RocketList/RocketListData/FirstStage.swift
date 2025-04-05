//
//  FirstStage.swift
//  QuantiSpaceX
//
//  Created by Petr Žáček on 14.02.2025.
//

import Foundation

struct FirstStage: Codable, Hashable{
    var thrust_sea_level: ThrustSeaLevel?
    var thrust_vacuum: ThrustVacuum?
    var reusable: Bool?
    var engines: Int?
    var fuel_amount_tons: Double?
    var burn_time_sec: Double?
}
