import Dependencies
import Foundation
import ModelConvertible
import fetchRockets

public extension LineMeasureConverterKMM {
  static var live = Self(
    domainModelConverter: {
      RocketDetail.LineMeasure(meters: $0.meters, feet: $0.feet)
    }
  )
}

public extension WeightScaleConverterKMM {
  static var live = Self(
    domainModelConverter: {
      RocketDetail.WeightScale(kilograms: $0.kilograms, pounds: $0.pounds)
    }
  )
}

public extension StageConverterKMM {
  static var live = Self(
    domainModelConverter: {
      RocketDetail.Stage(reusable: $0.reusable, engines: Int($0.engines), fuelMass: $0.fuelMass, burnTime: $0.burnTime?.intValue)
    }
  )
}
public extension RocketDetailConverterKMM {
  static var live: Self {
    @Dependency(\.lineMeasureConverterKMM) var lineMeasureConverterKMM
    @Dependency(\.weightScaleConverterKMM) var weightScaleConverterKMM
    @Dependency(\.stageConverterKMM) var stageConverterKMM

    return .init(
      domainModelConverter: { rocketKMM in
        guard
          let height = lineMeasureConverterKMM.domainModel(fromExternal: rocketKMM.height),
          let diameter = lineMeasureConverterKMM.domainModel(fromExternal: rocketKMM.diameter),
          let mass = weightScaleConverterKMM.domainModel(fromExternal: rocketKMM.mass),
          let firstStage = stageConverterKMM.domainModel(fromExternal: rocketKMM.firstStage),
          let secondStage = stageConverterKMM.domainModel(fromExternal: rocketKMM.secondStage)
        else {
          return nil
        }

        return RocketDetail(
          id: rocketKMM.id,
          name: rocketKMM.name,
          overview: rocketKMM.overview,
          height: height,
          diameter: diameter,
          mass: mass,
          firstStage: firstStage,
          secondStage: secondStage,
          firstFlight: rocketKMM.firstFlight,
          photos: rocketKMM.photos
        )
      }
    )
  }
}

public extension RocketsDetailConverterKMM {
  static var live: Self {
    @Dependency(\.rocketConverterKMM) var rocketConverterKMM

    return .init(
      domainModelConverter: { rocketKMM in
        let rockets: [RocketDetail] = rocketKMM.compactMap {
          guard let rocket = rocketConverterKMM.domainModel(fromExternal: $0) else {
            return nil
          }

          return RocketDetail(
            id: rocket.id,
            name: rocket.name,
            overview: rocket.overview,
            height: rocket.height,
            diameter: rocket.diameter,
            mass: rocket.mass,
            firstStage: rocket.firstStage,
            secondStage: rocket.secondStage,
            firstFlight: rocket.firstFlight,
            photos: rocket.photos
          )
        }

        guard rocketKMM.count == rockets.count else {
            return nil
        }

        return rockets
      }
    )
  }
}
