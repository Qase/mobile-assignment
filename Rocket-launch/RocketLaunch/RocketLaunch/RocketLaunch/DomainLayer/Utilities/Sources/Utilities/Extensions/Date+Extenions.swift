//
//  Date+Extenions.swift
//  
//
//  Created by Tomáš Brand on 13.03.2023.
//

import Foundation

public extension Date {
    func toString(formatter: DateFormatter = Formatter.Date.default) -> String? {
        formatter.string(from: self)
    }
    
    func toString(formatter: ISO8601DateFormatter) -> String? {
        formatter.string(from: self)
    }
}

