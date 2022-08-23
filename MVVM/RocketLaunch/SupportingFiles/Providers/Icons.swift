//
//  Icons.swift
//  RocketLaunch
//
//  Created by Lucie Havrdová on 19.08.2022.
//

import SwiftUI

enum Icons: String {
    case burn = "Burn"
    case engine = "Engine"
    case fuel = "Fuel"
    case reusable = "Reusable"
    case flyingRocket = "Rocket Flying"
    case idleRocket = "Rocket Idle"
    case rocket = "Rocket"
    case placeholder = "Placeholder"

    var image: Image {
        Image(self.rawValue)
    }
}
