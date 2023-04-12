//
//  String+Extensions.swift
//  
//
//  Created by Tomáš Brand on 13.03.2023.
//

import Foundation

public extension String {
    /// Conversion from String to Date using a given formatter.
    func toDate(formatter: DateFormatter = Formatter.Date.default) -> Date? {
        formatter.date(from: self)
    }
}
