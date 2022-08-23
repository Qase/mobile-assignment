//
//  Rocket.swift
//  RocketLaunch
//
//  Created by Lucie Havrdová on 19.08.2022.
//

import Foundation

struct Rocket: Identifiable, Codable {
    let id: String
    let name: String
    let firstFlight: Date
}
