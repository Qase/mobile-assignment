//
//  Rocket.swift
//  rocketLaunch
//
//  Created by Lucie Havrdová on 11.02.2022.
//

import Foundation

//MARK: - Rocket

public struct Rocket: Decodable, Identifiable {
    public let id: String
    let name: String
    let first_flight: String
    
    let description: String
    let height: Length
    let diameter: Length
    let mass: Weight
    
    let first_stage: Stage
    let second_stage: Stage
    let flickr_images: [String]

    init(
        Id: String,
        name: String,
        first_flight: String,
        description: String,
        height: Length,
        diameter: Length,
        mass: Weight,
        first_stage: Stage,
        second_stage: Stage,
        flickr_images: [String]
    ){
        self.id = Id
        self.name = name
        self.first_flight = first_flight
        self.description = description
        self.height = height
        self.diameter = diameter
        self.mass = mass
        self.first_stage = first_stage
        self.second_stage = second_stage
        self.flickr_images = flickr_images
    }
    
    func printFlikrImages(){
        for image in flickr_images {
            print(image)
        }
    }
}

//MARK: - Stage

struct Stage: Decodable {
    let reusable: Bool
    let engines: Int
    let fuel_amount_tons: Double
    let burn_time_sec: Int?
    
    init(
        reusable: Bool,
        engines: Int,
        fuel_amount_tons: Double,
        burn_time_sec: Int? = nil)
    {
        self.reusable = reusable
        self.engines = engines
        self.fuel_amount_tons = fuel_amount_tons
        self.burn_time_sec = burn_time_sec
    }
}

// MARK: - Parameters

struct Length: Decodable {
    enum LengthType { case meters, feet }
    let meters: Double
    let feet: Double
    
    func getLengthString(type: LengthType) -> String {
        if type == .meters {
            return "\(ceil(meters))m"
        }
        if type == .feet {
            return "\(ceil(feet))ft"
        }
        //TODO: throw error
        return "nil"
    }
}

struct Weight: Decodable {
    enum WeightType { case kg, lb }
    let kg: Int
    let lb: Int
    
    func getWeightString(type: WeightType) -> String {
        if type == .kg {
            switch kg {
            case 1..<100:
                return "\(kg)kg"
            default:
                return "\(kg/100)t"
            }
        }
        if type == .lb {
            return "\(lb)lb"
        }
        return "nil"
    }
}
