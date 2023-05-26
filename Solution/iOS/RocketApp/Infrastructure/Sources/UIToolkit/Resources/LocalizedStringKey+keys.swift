// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen
// This is a custom template generated strings keys in extension of LocalizedStringKey 
// for a convenient using base on SwiftGen template structured-swift5

import SwiftUI

// MARK: - LocalizedStringKey+

public extension LocalizedStringKey {
  /// Diameter
  static let diameter: LocalizedStringKey = "diameter".localizedStringKey
  /// %lld Engines
  static func engines(_ param1: Int) -> LocalizedStringKey {
      "engines %lld".localizedStringKey(with: [param1])
  }
  /// Kann nicht das Data einladen, die Ursache:
  static let error: LocalizedStringKey = "error".localizedStringKey
  /// EU metrics
  static let euMetrics: LocalizedStringKey = "eu_metrics".localizedStringKey
  /// First flight: %@
  static func firstFlight(_ param1: String) -> LocalizedStringKey {
      "first_flight %@".localizedStringKey(with: [param1])
  }
  /// First stage
  static let firstStage: LocalizedStringKey = "first_stage".localizedStringKey
  /// Height
  static let height: LocalizedStringKey = "height".localizedStringKey
  /// Launch
  static let launch: LocalizedStringKey = "launch".localizedStringKey
  /// Launch successful!
  static let launchSuccessful: LocalizedStringKey = "launch_successful".localizedStringKey
  /// Mass
  static let mass: LocalizedStringKey = "mass".localizedStringKey
  /// Not reusable
  static let notReusable: LocalizedStringKey = "not_reusable".localizedStringKey
  /// Overview
  static let overview: LocalizedStringKey = "overview".localizedStringKey
  /// Parameters
  static let parameters: LocalizedStringKey = "parameters".localizedStringKey
  /// Photos
  static let photos: LocalizedStringKey = "photos".localizedStringKey
  /// Reset rocket launch
  static let resetLaunch: LocalizedStringKey = "reset_launch".localizedStringKey
  /// Reusable
  static let reusable: LocalizedStringKey = "reusable".localizedStringKey
  /// Rockets
  static let rockets: LocalizedStringKey = "rockets".localizedStringKey
  /// Second stage
  static let secondStage: LocalizedStringKey = "second_stage".localizedStringKey
  /// %lld Seconds burn-time
  static func secondsBurnTime(_ param1: Int) -> LocalizedStringKey {
      "seconds_burn_time %lld".localizedStringKey(with: [param1])
  }
  /// Meters remaining to launch %@:
  static func tiltToLaunch(_ param1: String) -> LocalizedStringKey {
      "tilt_to_launch %@".localizedStringKey(with: [param1])
  }
  /// %f Tons of fuel
  static func tonsOfFuelF(_ param1: Float) -> LocalizedStringKey {
      "tons_of_fuel %f".localizedStringKey(with: [param1])
  }
  /// US metrics
  static let usMetrics: LocalizedStringKey = "us_metrics".localizedStringKey
}

public extension String {
  var nsLocalizedString: String {
      NSLocalizedString(self, bundle: .module, comment: "")
  }

  var localizedStringKey: LocalizedStringKey {
      LocalizedStringKey(nsLocalizedString)
  }

  func localizedStringKey(with arguments: [CVarArg]) -> LocalizedStringKey {
      let localizedString = String.localizedStringWithFormat(nsLocalizedString, arguments)
      return LocalizedStringKey(localizedString)
  }
}
