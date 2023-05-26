import Dependencies
import Foundation
import ModelConvertible

public extension RocketDetailConverter {
  static var live: Self {
    @Dependency(\.lineMeasureConverter) var lineMeasureConverter
    @Dependency(\.weightScaleConverter) var weightScaleConverter
    @Dependency(\.stageConverter) var stageConverter

    return .init(
      domainModelConverter: { rocketDTO in
        guard
          let height = lineMeasureConverter.domainModel(fromExternal: rocketDTO.height),
          let diameter = lineMeasureConverter.domainModel(fromExternal: rocketDTO.diameter),
          let mass = weightScaleConverter.domainModel(fromExternal: rocketDTO.mass),
          let firstStage = stageConverter.domainModel(fromExternal: rocketDTO.firstStage),
          let secondStage = stageConverter.domainModel(fromExternal: rocketDTO.secondStage)
        else {
          return nil
        }

        return RocketDetail(
          id: rocketDTO.id,
          name: rocketDTO.name,
          overview: rocketDTO.overview,
          height: height,
          diameter: diameter,
          mass: mass,
          firstStage: firstStage,
          secondStage: secondStage,
          firstFlight: rocketDTO.firstFlight,
          photos: rocketDTO.photos
        )
      }
    )
  }
}

public extension RocketsDetailConverter {
  static var live: Self {
    @Dependency(\.rocketConverter) var rocketConverter

    return .init(
      domainModelConverter: { rocketsDTO in
        let rockets: [RocketDetail] = rocketsDTO.compactMap {
          guard let rocket = rocketConverter.domainModel(fromExternal: $0) else {
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

        guard rocketsDTO.count == rockets.count else {
            return nil
        }

        return rockets
      }
    )
  }
}

public extension LineMeasureConverter {
  static var live = Self(
    domainModelConverter: {
      RocketDetail.LineMeasure(meters: $0.meters, feet: $0.feet)
    }
  )
}

public extension WeightScaleConverter {
  static var live = Self(
    domainModelConverter: {
      RocketDetail.WeightScale(kilograms: $0.kilograms, pounds: $0.pounds)
    }
  )
}

public extension StageConverter {
  static var live = Self(
    domainModelConverter: {
      RocketDetail.Stage(reusable: $0.reusable, engines: $0.engines, fuelMass: $0.fuelMass, burnTime: $0.burnTime)
    }
  )
}
