//
//  DateCreator.swift
//  RocketLaunch
//
//  Created by Lucie Havrdová on 30.08.2022.
//

import Foundation

func createDate(
    _ date: String,
    stringFormat: String
) -> Date {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = stringFormat

    guard let createdDate = dateFormatter.date(from: date) else {
        fatalError("Cannot convert date")
    }

    return createdDate
}
