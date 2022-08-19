//
//  Date+.swift
//  RocketLaunch
//
//  Created by Lucie Havrdová on 19.08.2022.
//

import Foundation

extension Date {
    init(
        _ date: String,
        stringFormat: String
    ) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = stringFormat

        self.init(dateFormatter.date(from: date)!)
    }
}
