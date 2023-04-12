//
//  Bundle+Extensions.swift
//  
//
//  Created by Tomáš Brand on 10.04.2023.
//

import Foundation

public extension Bundle {
    /// Return the main bundle when in the app or an app extension.
    /// Taken from: https://stackoverflow.com/questions/26189060
    static var app: Bundle {
        var components = main.bundleURL.path.split(separator: "/")
        var bundle: Bundle?

        if let index = components.lastIndex(where: { $0.hasSuffix(".app") }) {
            components.removeLast((components.count - 1) - index)
            bundle = Bundle(path: components.joined(separator: "/"))
        }

        return bundle ?? main
    }
}
