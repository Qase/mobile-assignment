//
//  Payloads.swift
//  QuantiSpaceX
//
//  Created by Petr Žáček on 14.02.2025.
//

import Foundation

struct Payloads: Codable, Hashable {
    var composite_fairing: CompositeFairing?
    var option_1: String?
}
