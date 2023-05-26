import Foundation
import SwiftUI
import UIToolkit

public struct RocketDetail: Identifiable, Equatable {
  public let id: String
  public let name: String
  public let overview: String
  public let height: LineMeasure
  public let diameter: LineMeasure
  public let mass: WeightScale
  public let firstStage: Stage
  public let secondStage: Stage
  public let firstFlight: String
  public let photos: [String]

  public init(
    id: String,
    name: String,
    overview: String,
    height: LineMeasure,
    diameter: LineMeasure,
    mass: WeightScale,
    firstStage: RocketDetail.Stage,
    secondStage: RocketDetail.Stage,
    firstFlight: String,
    photos: [String]
  ) {
    self.id = id
    self.name = name
    self.overview = overview
    self.height = height
    self.diameter = diameter
    self.mass = mass
    self.firstStage = firstStage
    self.secondStage = secondStage
    self.firstFlight = firstFlight
    self.photos = photos
  }

  public struct LineMeasure: Equatable {
    public let meters: Float
    public let feet: Float

    init(meters: Float, feet: Float) {
      self.meters = meters
      self.feet = feet
    }
  }

  public struct WeightScale: Equatable {
    public let kilograms: Float
    public let pounds: Float

    init(kilograms: Float, pounds: Float) {
      self.kilograms = kilograms
      self.pounds = pounds
    }
  }

  public struct Stage: Equatable {
    public let reusable: Bool
    public let engines: Int
    public let fuelMass: Float
    public let burnTime: Int?

    public init(reusable: Bool, engines: Int, fuelMass: Float, burnTime: Int?) {
      self.reusable = reusable
      self.engines = engines
      self.fuelMass = fuelMass
      self.burnTime = burnTime
    }
  }
}

public extension RocketDetail {
  enum RocketParameters {
    case id
    case name
    case overview
    case height
    case diameter
    case mass
    case fuelMass
    case firstStage
    case secondStage
    case firstFlight(String)
    case photos
    case reusable
    case notReusable
    case engines(Int)
    case tonsOfFuel(Float)
    case secondsBurnTime(Int)

    public var name: LocalizedStringKey {
      switch self {
      case .overview:
        return .overview
      case .height:
        return .height
      case .diameter:
        return .diameter
      case .mass:
        return .mass
      case .firstStage:
        return .firstStage
      case .secondStage:
        return .secondStage
      case let .firstFlight(date):
        return .firstFlight(date)
      case .photos:
        return .photos
      case .reusable:
        return .reusable
      case .notReusable:
        return .notReusable
      case let .engines(count):
        return .engines(count)
      case let .tonsOfFuel(count):
        return .tonsOfFuelF(count)
      case let .secondsBurnTime(count):
        return .secondsBurnTime(count)
      default:
        return "Undefined"
      }
    }

    // TODO: Make custom formatter for RocketDetail
    public func detail(rocketDetail: RocketDetail, isUSMetrics: Bool) -> String {
      switch self {
      case .height:
        return isUSMetrics ? "\(rocketDetail.height.feet)" + "ft" : "\(rocketDetail.height.meters)" + "m"
      case .diameter:
        return isUSMetrics ? "\(rocketDetail.diameter.feet)" + "ft" : "\(rocketDetail.diameter.meters)" + "m"
      case .mass:
        return isUSMetrics ? "\(rocketDetail.mass.pounds)" + "℔" : "\(rocketDetail.mass.kilograms)" + "kg"
      default:
        return "Undefined"
      }
    }
  }
}
