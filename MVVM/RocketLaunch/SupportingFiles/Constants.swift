//
//  Constants.swift
//  RocketLaunch
//
//  Created by Lucie Havrdová on 23.08.2022.
//

import Foundation
import SwiftUI

struct Constants {
    enum View {
        static let cornerRadius: CGFloat = 10
    }

    enum Networking {
        static let basicURL = "https://api.spacexdata.com"
        static let allRockets = "/v4/rockets"
        static func oneRocket(id: String) -> String {
            return "/v4/rockets/" + id
        }
    }
}
