//
//  LocalizedStringKey+.swift
//  RocketLaunch
//
//  Created by Lucie Havrdová on 19.08.2022.
//

import SwiftUI

// MARK: - Localized String Key

extension LocalizedStringKey {
    static let rocketList_title: LocalizedStringKey = "rocketList_title"

    enum RocketDetail {
        static let launch: LocalizedStringKey = "rocketDetail_launch"
        static let overviewTitle: LocalizedStringKey = "rocketDetail_overview_title"

        enum Parameters {
            static let title: LocalizedStringKey = "rocketDetail_parameters_title"
            static let height: LocalizedStringKey = "rocketDetail_parameters_height"
            static let diameter: LocalizedStringKey = "rocketDetail_parameters_diameter"
            static let mass: LocalizedStringKey = "rocketDetail_parameters_mass"
        }

        enum Stage {
            static let title1: LocalizedStringKey = "rocketDetail_stage_title1"
            static let title2: LocalizedStringKey = "rocketDetail_stage_title2"
            static let reusable: LocalizedStringKey = "rocketDetail_stage_reusable"
            static let notReusable: LocalizedStringKey = "rocketDetail_stage_notReusable"
        }

        static let photosTitle: LocalizedStringKey = "rocketDetail_photosTitle"
    }

    enum RocketLaunch {
        static let title: LocalizedStringKey = "rocketLaunch_title"
        static let notLaunched: LocalizedStringKey = "rocketLaunch_notLaunched"
        static let launched: LocalizedStringKey = "rocketLaunch_launched"
    }
}
