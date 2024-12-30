//
//  RocketList.swift
//  QuantiSpaceX
//
//  Created by Petr Žáček on 26.12.2024.
//

import Foundation

struct RocketList: Codable, Hashable, Identifiable {
    let height: Height?
    let diameter: Diameter?
    let mass: Mass?
    let first_stage: FirstStage?
    let second_stage: SecondStage?
    let engines: Engines?
    let landing_legs: LandingLegs?
    let payload_weights: [PayloadWeight]?
    let flickr_images: [String]?
    let name: String
    let type: String
    let active: Bool
    let stages: Int
    let boosters: Int
    let cost_per_launch: Int
    let success_rate_pct: Double?
    let first_flight: String?
    let country: String?
    let company: String?
    let wikipedia: String?
    let description: String?
    let id: String?
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

struct Height: Codable, Hashable {
    var meters: Double?
    var feet: Double?
}

struct Diameter: Codable, Hashable {
    var meters: Double?
    var feet: Double?
}

struct Mass: Codable, Hashable {
    var kg: Double?
    var lb: Double?
}

struct FirstStage: Codable, Hashable{
    var thrust_sea_level: ThrustSeaLevel?
    var thrust_vacuum: ThrustVacuum?
    var reusable: Bool?
    var engines: Int?
    var fuel_amount_tons: Double?
    var burn_time_sec: Double?
}

struct ThrustSeaLevel: Codable, Hashable {
    var kn: Double?
    var lbf: Double?
}

struct ThrustVacuum: Codable, Hashable {
    var kn: Double?
    var lbf: Double?
}

struct SecondStage: Codable, Hashable {
    var thrust: Thrust?
    var payloads: Payloads?
    var reusable: Bool?
    var engines: Int?
    var fuel_amount_tons: Double?
    let burn_time_sec: Double?
}

struct Thrust: Codable, Hashable{
    var kN: Double?
    var lbf: Double?
}

struct Payloads: Codable, Hashable {
    var composite_fairing: CompositeFairing?
    var option_1: String?
}

struct CompositeFairing: Codable, Hashable {
    var height: Height
    var diameter: Diameter
}

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

struct Isp: Codable, Hashable {
    var sea_level: Double
    var vacuum: Double
}

struct LandingLegs: Codable, Hashable {
    var number: Int?
    var material: String?
}

struct PayloadWeight: Codable, Hashable {
    var id: String?
    var name: String?
    var kg: Double?
    var lb: Double?
}
