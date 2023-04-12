//
//  Logger+Extensions.swift
//  
//
//  Created by Tomáš Brand on 11.03.2023.
//

import OSLog

public extension Logger {
    static let app = Logger(subsystem: Bundle.main.bundleIdentifier ?? "-", category: "App")
    static let lifecycle = Logger(subsystem: Bundle.main.bundleIdentifier ?? "-", category: "Lifecycle")
}
