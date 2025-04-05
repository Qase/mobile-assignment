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
