//
//  String+Extensions.swift
//  
//
//  Created by Tomáš Brand on 10.04.2023.
//

import Foundation

public extension String {
    func localized(with arguments: [CVarArg]) -> String {
        return String(format: NSLocalizedString(self, comment: ""), locale: nil, arguments: arguments)
    }
}
