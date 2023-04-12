//
//  AlertAction.swift
//  
//
//  Created by Tomáš Brand on 12.03.2023.
//

import Foundation

public enum AlertAction: Equatable {
    case showAlert(_ alert: AlertData)

    public static func == (lhs: AlertAction, rhs: AlertAction) -> Bool {
        switch (lhs, rhs) {
        case let (.showAlert(lhsAlert), .showAlert(rhsAlert)):
            return lhsAlert == rhsAlert
        }
    }
}
