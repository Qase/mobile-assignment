//
//  RocketStruct.swift
//  Ficek_QuantiApp
//
//  Created by Martin Ficek on 24.02.2023.
//

import Foundation

struct Rocket: Decodable, Equatable, Identifiable{
    
    var id: String
    var firstFlight: String
    var height, diameter: Diameter
    var mass: Mass
    var firstStage: FirstStage
    var secondStage: SecondStage
    var engines: Engines
    var flickrImages: [String]
    var description: String
    var name: String
    var type: String
 
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case firstFlight = "first_flight"
        case height, diameter, mass
        case firstStage = "first_stage"
        case secondStage = "second_stage"
        case engines
        case flickrImages = "flickr_images"
        case description
        case name = "name"
        case type = "type"
    }
}

// MARK: - Diameter
struct Diameter: Codable, Equatable {
    var meters, feet: Double?
}

// MARK: - Engines
struct Engines: Codable, Equatable {
    var number: Int
    var type: String
    var version: String

    enum CodingKeys: String, CodingKey {
        case number
        case type
        case version
    }
}

// MARK: - FirstStage
struct FirstStage: Codable, Equatable {
    var reusable: Bool
    var engines: Int
    var fuelAmountTons: Double
    var burnTimeSEC: Int?

    enum CodingKeys: String, CodingKey {
        case reusable, engines
        case fuelAmountTons = "fuel_amount_tons"
        case burnTimeSEC = "burn_time_sec"
    }
}

// MARK: - Mass
struct Mass: Codable, Equatable  {
    var kg, lb: Int
}

// MARK: - SecondStage
struct SecondStage: Codable, Equatable {
    var reusable: Bool
    var engines: Int
    var fuelAmountTons: Double
    var burnTimeSEC: Int?

    enum CodingKeys: String, CodingKey {
        case reusable, engines
        case fuelAmountTons = "fuel_amount_tons"
        case burnTimeSEC = "burn_time_sec"
    }
}

enum RocketError: Error {
    case internalError
    case badUrl
}

struct Mock {
    
    let json =
"""
{
    "height": {
        "meters": 22.25,
        "feet": 73
    },
    "diameter": {
        "meters": 1.68,
        "feet": 5.5
    },
    "mass": {
        "kg": 30146,
        "lb": 66460
    },
    "first_stage": {
        "thrust_sea_level": {
            "kN": 420,
            "lbf": 94000
        },
        "thrust_vacuum": {
            "kN": 480,
            "lbf": 110000
        },
        "reusable": false,
        "engines": 1,
        "fuel_amount_tons": 44.3,
        "burn_time_sec": 169
    },
    "second_stage": {
        "thrust": {
            "kN": 31,
            "lbf": 7000
        },
        "payloads": {
            "composite_fairing": {
                "height": {
                    "meters": 3.5,
                    "feet": 11.5
                },
                "diameter": {
                    "meters": 1.5,
                    "feet": 4.9
                }
            },
            "option_1": "composite fairing"
        },
        "reusable": false,
        "engines": 1,
        "fuel_amount_tons": 3.38,
        "burn_time_sec": 378
    },
    "engines": {
        "isp": {
            "sea_level": 267,
            "vacuum": 304
        },
        "thrust_sea_level": {
            "kN": 420,
            "lbf": 94000
        },
        "thrust_vacuum": {
            "kN": 480,
            "lbf": 110000
        },
        "number": 1,
        "type": "merlin",
        "version": "1C",
        "layout": "single",
        "engine_loss_max": 0,
        "propellant_1": "liquid oxygen",
        "propellant_2": "RP-1 kerosene",
        "thrust_to_weight": 96
    },
    "landing_legs": {
        "number": 0,
        "material": null
    },
    "payload_weights": [
        {
            "id": "leo",
            "name": "Low Earth Orbit",
            "kg": 450,
            "lb": 992
        }
    ],
    "flickr_images": [
        "https://imgur.com/DaCfMsj.jpg",
        "https://imgur.com/azYafd8.jpg"
    ],
    "name": "Falcon 1",
    "type": "rocket",
    "active": false,
    "stages": 2,
    "boosters": 0,
    "cost_per_launch": 6700000,
    "success_rate_pct": 40,
    "first_flight": "2006-03-24",
    "country": "Republic of the Marshall Islands",
    "company": "SpaceX",
    "wikipedia": "https://en.wikipedia.org/wiki/Falcon_1",
    "description": "The Falcon 1 was an expendable launch system privately developed and manufactured by SpaceX during 2006-2009. On 28 September 2008, Falcon 1 became the first privately-developed liquid-fuel launch vehicle to go into orbit around the Earth.",
    "id": "5e9d0d95eda69955f709d1eb"
}
"""
    var data: Data { json.data(using: .utf8)! }
    var mock: [Rocket] { try! JSONDecoder().decode([Rocket].self, from: data) }
}
