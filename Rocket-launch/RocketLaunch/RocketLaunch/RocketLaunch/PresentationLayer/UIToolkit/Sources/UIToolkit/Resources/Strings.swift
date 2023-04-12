//
//  Strings.swift
//  RocketLaunch
//
//  Created by Tomáš Brand on 10.04.2023.
//

import Foundation
import SwiftUI

public class Strings {
    
    // General
    public static let errorDataLoadTitle = NSLocalizedString("error_data_load_title", comment: "")
    
    // Splash screen / onboarding
    public static let appName = NSLocalizedString("app_name", comment: "")
    
    // Rockets list screen
    public static let rocketsListTitle = NSLocalizedString("rockets_list_title", comment: "")
    public static let rocketsEmptyScreenTitle = NSLocalizedString("rockets_empty_screen_title", comment: "")
    
    public static func rocketCellSubtitle(_ p1: String) -> String {
        return NSLocalizedString("rocket_cell_subtitle", comment: "").localized(with: [p1])
    }
    
    // Rocket detail screen
    public static let emptyPhotosErrorTitle = NSLocalizedString("empty_photos_error_title", comment: "")
    public static let rocketLaunchButtonTitle = NSLocalizedString("rocket_launch_button_title", comment: "")
    public static let rocketPhotosButtonTitle = NSLocalizedString("rocket_photos_button_title", comment: "")
    public static let paramsSectionTitle = NSLocalizedString("params_section_title", comment: "")
    public static let paramsMetersKeyTitle = NSLocalizedString("params_meters_key_title", comment: "")
    public static let paramsTonsKeyTitle = NSLocalizedString("params_tons_key_title", comment: "")
    public static let stagesSectionTitle = NSLocalizedString("stages_section_title", comment: "")
    public static let heightValueTitle = NSLocalizedString("height_value_title", comment: "")
    public static let diameterValueTitle = NSLocalizedString("diameter_value_title", comment: "")
    public static let massValueTitle = NSLocalizedString("mass_value_title", comment: "")
    public static let firstStageTitle = NSLocalizedString("first_stage_title", comment: "")
    public static let reusableCellTitle = NSLocalizedString("reusable_cell_title", comment: "")
    public static let notReusableCellTitle = NSLocalizedString("not_reusable_cell_title", comment: "")
    public static let secondStageTitle = NSLocalizedString("second_stage_title", comment: "")
    public static let oneEngineCellTitle = NSLocalizedString("one_engine_cell_title", comment: "")
    
    public static func enginesCellTitle(_ p1: Double) -> String {
        return NSLocalizedString("engines_cell_title", comment: "").localized(with: [p1])
    }
    
    public static func fuelAmountTons(_ p1: Double) -> String {
        return NSLocalizedString("fuel_amount_cell_title", comment: "").localized(with: [p1])
    }
    
    public static func burnTime(_ p1: Double) -> String {
        return NSLocalizedString("burn_time_cell_title", comment: "").localized(with: [p1])
    }
    
    // Rocket launch screen
    public static let rocketLaunchScreenTitle = NSLocalizedString("rocket_launch_screen_title", comment: "")
    public static let rocketLaunchInfoText = NSLocalizedString("rocket_launch_info_text", comment: "")
    public static let rocketLaunchToastTitle = NSLocalizedString("rocket_launch_toast_title", comment: "")
}
