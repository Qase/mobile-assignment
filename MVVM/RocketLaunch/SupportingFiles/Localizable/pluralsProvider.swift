//
//  pluralsProvider.swift
//  RocketLaunch
//
//  Created by Lucie Havrdová on 31.08.2022.
//

import Foundation

func pluralString(name: String, count: UInt) -> String {
    let formatString: String = NSLocalizedString(name, comment: "comment")
    let resultString: String = String.localizedStringWithFormat(formatString, count)
    return resultString
}

func boolString(name: String, value: Bool) -> String {
    // TODO: add to .stringsdict file
    if name == "reusable" {
        return value ? "reusable" : "not reusable"
    }
    return "value does not exist"
}

enum PluralString {
    case reusable
    case enginesCount
    case fuelAmount
    case burnTime

    var stringValue: String {
        switch self {
        case .reusable: return "reusable"
        case .enginesCount: return "engines_count"
        case .fuelAmount: return "fuel_amount"
        case .burnTime: return "burn_time"
        }
    }
}
