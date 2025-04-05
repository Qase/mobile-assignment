//
//  PayloadWeight.swift
//  QuantiSpaceX
//
//  Created by Petr Žáček on 14.02.2025.
//

import Foundation

struct PayloadWeight: Codable, Hashable {
    var id: String?
    var name: String?
    var kg: Double?
    var lb: Double?
}
