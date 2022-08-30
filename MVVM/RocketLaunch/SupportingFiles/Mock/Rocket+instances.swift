//
//  Rocket+instances.swift
//  RocketLaunch
//
//  Created by Lucie Havrdová on 19.08.2022.
//

import Foundation

// MARK: - Rocket 

extension Rocket {

    static let all: [Rocket] = [
        .falcon1,
        .falcon9,
        .falconHeavy,
        .falconHeavy,
        .falconHeavy,
        .starship
    ]

    static let falcon1 = Rocket(
        id: "1",
        name: "Falcon 1",
        firstFlight: createDate("24.3.2006", stringFormat: "dd.MM.yyy")
    )

    static let falcon9 = Rocket(
        id: "falcon9",
        name: "Falcon 9",
        firstFlight: createDate("6.4.2010", stringFormat: "dd.MM.yyy")
    )

    static let falconHeavy = Rocket(
        id: "3",
        name: "Falcon Heavy",
        firstFlight: createDate("2.6.2018", stringFormat: "dd.MM.yyy")
    )

    static let starship = Rocket(
        id: "4",
        name: "Starship",
        firstFlight: createDate("12.1.2021", stringFormat: "dd.MM.yyy")
    )
}
