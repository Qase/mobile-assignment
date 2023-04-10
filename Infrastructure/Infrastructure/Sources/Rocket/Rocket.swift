//
//  RocketStruct.swift
//  Ficek_QuantiApp
//
//  Created by Martin Ficek on 24.02.2023.
//

import Foundation

//MARK: Rocket Struct
public struct Rocket: Codable, Equatable, Identifiable{
    public var id: String
    public var firstFlight: String
    public var height, diameter: Diameter
    public var mass: Mass
    public var firstStage: FirstStage
    public var secondStage: SecondStage
    public var engines: Engines
    public var flickrImages: [String]
    public var description: String
    public var name: String
    public var type: String
 
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

public struct Diameter: Codable, Equatable {
    public var meters, feet: Double?
}

public struct Engines: Codable, Equatable {
    public var number: Int
    public var type: String
    public var version: String

    enum CodingKeys: String, CodingKey {
        case number
        case type
        case version
    }
}

public struct FirstStage: Codable, Equatable {
   public var reusable: Bool
   public var engines: Int
   public var fuelAmountTons: Double
   public var burnTimeSEC: Int?

    enum CodingKeys: String, CodingKey {
        case reusable, engines
        case fuelAmountTons = "fuel_amount_tons"
        case burnTimeSEC = "burn_time_sec"
    }
}

public struct Mass: Codable, Equatable  {
   public var kg, lb: Int
}

public struct SecondStage: Codable, Equatable {
   public var reusable: Bool
   public var engines: Int
   public var fuelAmountTons: Double
   public var burnTimeSEC: Int?

    enum CodingKeys: String, CodingKey {
        case reusable, engines
        case fuelAmountTons = "fuel_amount_tons"
        case burnTimeSEC = "burn_time_sec"
    }
}

public enum RocketError: Error {
    case internalError
    case badUrl
    case networkError
}

//MARK: Mock data
extension Rocket {
   public static let mock: Self =
         Rocket(
          id: "5e9d0d95eda69955f709d1eb",
          firstFlight: "2006-03-24",
          height: Diameter(
            meters: 22.25,
            feet: 73.0
          ),
          diameter: Diameter(
            meters: 1.68,
            feet: 5.5
          ),
          mass: Mass(
            kg: 30146,
            lb: 66460
          ),
          firstStage: FirstStage(
            reusable: false,
            engines: 1,
            fuelAmountTons: 44.3,
            burnTimeSEC: 169
          ),
          secondStage: SecondStage(
            reusable: false,
            engines: 1,
            fuelAmountTons: 3.38,
            burnTimeSEC: 378
          ),
          engines: Engines(
            number: 1,
            type: "merlin",
            version: "1C"
          ),
          flickrImages: [
           "https://imgur.com/DaCfMsj.jpg",
           "https://imgur.com/azYafd8.jpg"
          ],
          description: "The Falcon 1 was an expendable launch system privately developed and manufactured by SpaceX during 2006-2009. On 28 September 2008, Falcon 1 became the first privately-developed liquid-fuel launch vehicle to go into orbit around the Earth.",
          name: "Falcon 1",
          type: "rocket"
        )
}

//MARK: Mock data array
extension [Rocket] {
    public static let mock: Self = [
         Rocket(
          id: "5e9d0d95eda69955f709d1eb",
          firstFlight: "2006-03-24",
          height: Diameter(
            meters: 22.25,
            feet: 73.0
          ),
          diameter: Diameter(
            meters: 1.68,
            feet: 5.5
          ),
          mass: Mass(
            kg: 30146,
            lb: 66460
          ),
          firstStage: FirstStage(
            reusable: false,
            engines: 1,
            fuelAmountTons: 44.3,
            burnTimeSEC: 169
          ),
          secondStage: SecondStage(
            reusable: false,
            engines: 1,
            fuelAmountTons: 3.38,
            burnTimeSEC: 378
          ),
          engines: Engines(
            number: 1,
            type: "merlin",
            version: "1C"
          ),
          flickrImages: [
           "https://imgur.com/DaCfMsj.jpg",
           "https://imgur.com/azYafd8.jpg"
          ],
          description: "The Falcon 1 was an expendable launch system privately developed and manufactured by SpaceX during 2006-2009. On 28 September 2008, Falcon 1 became the first privately-developed liquid-fuel launch vehicle to go into orbit around the Earth.",
          name: "Falcon 1",
          type: "rocket"
        ),
         Rocket(
          id: "5e9d0d95eda69973a809d1ec",
          firstFlight: "2010-06-04",
          height: Diameter(
            meters: 70.0,
            feet: 229.6
          ),
          diameter: Diameter(
            meters: 3.7,
            feet: 12.0
          ),
          mass: Mass(
            kg: 549054,
            lb: 1207920
          ),
          firstStage: FirstStage(
            reusable: true,
            engines: 9,
            fuelAmountTons: 385.0,
            burnTimeSEC: 162
          ),
          secondStage: SecondStage(
            reusable: false,
            engines: 1,
            fuelAmountTons: 90.0,
            burnTimeSEC: 397
          ),
          engines: Engines(
            number: 9,
            type: "merlin",
            version: "1D+"
          ),
          flickrImages: [
            "https://farm1.staticflickr.com/929/28787338307_3453a11a77_b.jpg",
            "https://farm4.staticflickr.com/3955/32915197674_eee74d81bb_b.jpg",
            "https://farm1.staticflickr.com/293/32312415025_6841e30bf1_b.jpg",
            "https://farm1.staticflickr.com/623/23660653516_5b6cb301d1_b.jpg",
            "https://farm6.staticflickr.com/5518/31579784413_d853331601_b.jpg",
            "https://farm1.staticflickr.com/745/32394687645_a9c54a34ef_b.jpg"
          ],
          description: "Falcon 9 is a two-stage rocket designed and manufactured by SpaceX for the reliable and safe transport of satellites and the Dragon spacecraft into orbit.",
          name: "Falcon 9",
          type: "rocket"
        ),
         Rocket(
          id: "5e9d0d95eda69974db09d1ed",
          firstFlight: "2018-02-06",
          height: Diameter(
            meters: 70.0,
            feet: 229.6
          ),
          diameter: Diameter(
            meters: 12.2,
            feet: 39.9
          ),
          mass: Mass(
            kg: 1420788,
            lb: 3125735
          ),
          firstStage: FirstStage(
            reusable: true,
            engines: 27,
            fuelAmountTons: 1155.0,
            burnTimeSEC: 162
          ),
          secondStage: SecondStage(
            reusable: false,
            engines: 1,
            fuelAmountTons: 90.0,
            burnTimeSEC: 397
          ),
          engines: Engines(
            number: 27,
            type: "merlin",
            version: "1D+"
          ),
          flickrImages: [
            "https://farm5.staticflickr.com/4599/38583829295_581f34dd84_b.jpg",
            "https://farm5.staticflickr.com/4645/38583830575_3f0f7215e6_b.jpg",
            "https://farm5.staticflickr.com/4696/40126460511_b15bf84c85_b.jpg",
            "https://farm5.staticflickr.com/4711/40126461411_aabc643fd8_b.jpg"
          ],
          description: "With the ability to lift into orbit over 54 metric tons (119,000 lb)--a mass equivalent to a 737 jetliner loaded with passengers, crew, luggage and fuel--Falcon Heavy can lift more than twice the payload of the next closest operational vehicle, the Delta IV Heavy, at one-third the cost.",
          name: "Falcon Heavy",
          type: "rocket"
        ),
         Rocket(
          id: "5e9d0d96eda699382d09d1ee",
          firstFlight: "2021-12-01",
          height: Diameter(
            meters: 118.0,
            feet: 387.0
          ),
          diameter: Diameter(
            meters: 9.0,
            feet: 30.0
          ),
          mass: Mass(
            kg: 1335000,
            lb: 2943000
          ),
          firstStage: FirstStage(
            reusable: true,
            engines: 37,
            fuelAmountTons: 3300.0,
            burnTimeSEC: nil
          ),
          secondStage: SecondStage(
            reusable: true,
            engines: 6,
            fuelAmountTons: 1200.0,
            burnTimeSEC: nil
          ),
          engines: Engines(
            number: 37,
            type: "raptor",
            version: ""
          ),
          flickrImages: [
            "https://live.staticflickr.com/65535/48954138962_ee541e6755_b.jpg",
            "https://live.staticflickr.com/65535/48953946911_e60c5bcc5c_b.jpg",
            "https://live.staticflickr.com/65535/48954138922_9c42173f08_b.jpg",
            "https://live.staticflickr.com/65535/48953947006_313f01ec93_b.jpg"
          ],
          description: "Starship and Super Heavy Rocket represent a fully reusable transportation system designed to service all Earth orbit needs as well as the Moon and Mars. This two-stage vehicle — composed of the Super Heavy rocket (booster) and Starship (ship) — will eventually replace Falcon 9, Falcon Heavy and Dragon.",
          name: "Starship",
          type: "rocket"
        )
           
        ]
    
    
   public static let mockTest: Self = [
         Rocket(
          id: "5e9d0d95eda69955f709d1eb",
          firstFlight: "2006-03-24",
          height: Diameter(
            meters: 22.25,
            feet: 73.0
          ),
          diameter: Diameter(
            meters: 1.68,
            feet: 5.5
          ),
          mass: Mass(
            kg: 30146,
            lb: 66460
          ),
          firstStage: FirstStage(
            reusable: false,
            engines: 1,
            fuelAmountTons: 44.3,
            burnTimeSEC: 169
          ),
          secondStage: SecondStage(
            reusable: false,
            engines: 1,
            fuelAmountTons: 3.38,
            burnTimeSEC: 378
          ),
          engines: Engines(
            number: 1,
            type: "merlin",
            version: "1C"
          ),
          flickrImages: [
           "https://imgur.com/DaCfMsj.jpg",
           "https://imgur.com/azYafd8.jpg"
          ],
          description: "The Falcon 1 was an expendable launch system privately developed and manufactured by SpaceX during 2006-2009. On 28 September 2008, Falcon 1 became the first privately-developed liquid-fuel launch vehicle to go into orbit around the Earth.",
          name: "Falcon 1",
          type: "rocket"
        )
        ]
}

